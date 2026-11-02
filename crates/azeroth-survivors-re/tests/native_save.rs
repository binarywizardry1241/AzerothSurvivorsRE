//! Compatibility vectors include bytes exported by the real 0.92.0 EXE and a Rust file which
//! that EXE accepted through its native Import flow. No reference EXE is required for these tests.
#[allow(dead_code)]
#[path = "../src/hero_name.rs"]
mod hero_name;
#[allow(dead_code)]
#[path = "../src/save.rs"]
mod save;
use save::{Hero, Pick, RunMods, Save};
use serde_json::Value;

fn fixtures() -> Value {
    serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.92/save/interop-fixtures.json"
    ))
    .unwrap()
}

#[test]
fn opens_actual_native_exports_and_reproduces_native_accepted_rust_bytes() {
    for fixture in fixtures()["fixtures"].as_array().unwrap() {
        let encoded = fixture["sealed"].as_str().unwrap();
        let plain = fixture["plaintext"].as_str().unwrap();
        assert_eq!(save::open(encoded).unwrap(), plain, "{}", fixture["label"]);
        use base64::Engine;
        let blob = base64::engine::general_purpose::STANDARD
            .decode(&encoded[5..])
            .unwrap();
        let nonce: [u8; 16] = blob[..16].try_into().unwrap();
        assert_eq!(save::seal_with_nonce(plain, nonce), encoded);
    }
}

#[test]
fn native_imported_picker_has_confirmed_field_order_and_normalization() {
    let data = fixtures();
    let parsed = Save::parse(data["fixtures"][2]["sealed"].as_str().unwrap()).unwrap();
    let pick = parsed.pick().unwrap();
    assert_eq!(pick.name, "Changed");
    assert_eq!(pick.zone, "elwynn");
    assert_eq!(pick.hero.class, 1);
    assert_eq!(pick.hero.race, 2);
    assert_eq!(pick.hero.sex, 0);
    // Current 0.121.0 treats the historical CSV tuple as an invalid rank.
    assert_eq!(pick.heroic_rank, 0);
    assert_eq!(pick.mods, RunMods::default());
    assert_eq!(parsed.unlock_value(8), Some(3));
    assert!(!save::allowed_races(2).contains(&2));
}

#[test]
fn picker_changes_preserve_unimplemented_progress_and_reject_invalid_combinations() {
    let mut saved = Save::parse("ach|class:mage\nunlock|8|3\ntalent|8|4321|ranks\n").unwrap();
    saved
        .set_pick(&Pick {
            hero: Hero {
                class: 8,
                race: 7,
                sex: 1,
                features: [2, 3, 4, 5, 6],
            },
            name: "Testmage".into(),
            zone: "elwynn".into(),
            heroic_rank: 0,
            mods: RunMods::default(),
        })
        .unwrap();
    assert!(saved.plaintext().contains("ach|class:mage\n"));
    assert_eq!(saved.talent_xp(8), 4321);
    assert!(saved
        .set_hero(&Hero {
            class: 2,
            race: 2,
            sex: 0,
            features: [0; 5]
        })
        .is_err());
}

#[test]
fn portable_import_rejects_plaintext_and_modified_seals() {
    assert!(Save::import("hero|1|1|0|0,0,0,0,0").is_err());
    let data = fixtures();
    let mut encoded = data["fixtures"][1]["sealed"]
        .as_str()
        .unwrap()
        .as_bytes()
        .to_vec();
    encoded[30] = if encoded[30] == b'A' { b'B' } else { b'A' };
    assert!(Save::import(std::str::from_utf8(&encoded).unwrap()).is_err());
}

#[test]
fn ordinary_write_replaces_active_and_preserves_the_hourly_progress_backup() {
    let unique = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let directory = std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join(format!("../../runtime/menu-save-tests/{unique}"));
    std::fs::create_dir_all(&directory).unwrap();
    let path = directory.join("characters.txt");
    let first = Save::parse("unlock|8|3\n").unwrap();
    first.write_at(&path, 1_700_000_000).unwrap();
    let second = Save::parse("unlock|8|4\n").unwrap();
    second.write_at(&path, 1_700_000_100).unwrap();
    // Old ordinal4 is Arathi Basin, current ordinal5 after Un'Goro was inserted.
    assert_eq!(Save::load(&path).unwrap().unlock_value(8), Some(5));
    let names: Vec<_> = std::fs::read_dir(&directory)
        .unwrap()
        .map(|entry| entry.unwrap().file_name())
        .collect();
    let names = names.into_iter().collect::<std::collections::BTreeSet<_>>();
    assert_eq!(
        names,
        ["characters.txt", "characters.backup-at.txt", "Saves"]
            .into_iter()
            .map(std::ffi::OsString::from)
            .collect()
    );
    let backups = std::fs::read_dir(directory.join("Saves"))
        .unwrap()
        .map(|entry| entry.unwrap().path())
        .collect::<Vec<_>>();
    assert_eq!(backups.len(), 1);
    assert_eq!(
        Save::load(&backups[0]).unwrap().plaintext(),
        first.plaintext()
    );
    assert_eq!(
        std::fs::read_to_string(directory.join("characters.backup-at.txt")).unwrap(),
        "1700000000"
    );
    assert!(second
        .write_at(&directory.join("Saves"), 1_700_000_200)
        .is_err());
    std::fs::remove_dir_all(directory).unwrap();
}

#[test]
fn talent_allocation_round_trip_preserves_native_xp_and_other_classes() {
    let mut saved =
        Save::parse("talent|1|80|imp_heroic:1\ntalent|8|275|imp_frostbolt:2\nach|zone:elwynn\n")
            .unwrap();
    assert_eq!(saved.talent_allocation(1), vec![("imp_heroic".into(), 1)]);
    saved
        .set_talent_allocation(1, 80, &[("imp_heroic".into(), 0), ("deflection".into(), 1)])
        .unwrap();
    assert!(saved.plaintext().contains("talent|1|80|deflection:1\n"));
    assert_eq!(saved.talent_xp(1), 80);
    assert_eq!(
        saved.talent_allocation(8),
        vec![("imp_frostbolt".into(), 2)]
    );
    assert!(saved.plaintext().contains("ach|zone:elwynn\n"));
    assert!(saved
        .set_talent_allocation(1, 80, &[("bad:key".into(), 1)])
        .is_err());
}

#[test]
fn pick_uses_the_native_shared_name_validator() {
    let saved = Save::parse("pick|1|1|0|elwynn|  uLIRA  |0,0,0,0,0|100,100,100,100\n").unwrap();
    assert_eq!(saved.pick().unwrap().name, "Ulira");
    assert_eq!(
        Save::parse("pick|1|1|0|elwynn|H3ro\n")
            .unwrap()
            .pick()
            .unwrap()
            .name,
        "Hero"
    );
    let mut saved = saved;
    let mut pick = saved.pick().unwrap();
    pick.name = " aRYATH ".into();
    saved.set_pick(&pick).unwrap();
    assert!(saved.plaintext().contains("|Aryath|"));
    pick.name = "A".into();
    saved.set_pick(&pick).unwrap();
    assert_eq!(saved.pick().unwrap().name, "Hero");
}

#[test]
fn seen_keeps_unknown_keys_and_merges_native_quality_maxima() {
    let save=Save::parse("seen|legendary:cleave=2,unknown=+255,=3,bad=256,negative=-1,malformed=1=4\nseen|legendary:cleave=1,unknown=0,accuria=4\n").unwrap();
    let seen = save.seen();
    assert_eq!(seen.len(), 3);
    assert_eq!(seen.get("legendary:cleave"), Some(&2));
    assert_eq!(seen.get("unknown"), Some(&4));
    assert_eq!(seen.get("accuria"), Some(&4));
}

#[test]
fn class_selection_matches_recorded_native_outputs() {
    let fixtures: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.92/save/class-selection-fixtures.json"
    ))
    .unwrap();
    let hero = |value: &Value| Hero {
        class: value[0].as_u64().unwrap() as u8,
        race: value[1].as_u64().unwrap() as u8,
        sex: value[2].as_u64().unwrap() as u8,
        features: std::array::from_fn(|i| value[i + 3].as_u64().unwrap() as u8),
    };
    let cases = fixtures["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 153);
    assert_eq!(
        cases.iter().filter(|case| case["kind"] == "fresh").count(),
        144
    );
    for case in cases {
        let current = hero(&case["input"]);
        let mut saved = Save::default();
        if !case["saved_hero"].is_null() {
            saved.set_hero(&hero(&case["saved_hero"])).unwrap();
        }
        assert_eq!(
            saved.select_class_hero(&current, case["destination_class"].as_u64().unwrap() as u8),
            Some(hero(&case["native_output"])),
            "{case}"
        );
    }
}
