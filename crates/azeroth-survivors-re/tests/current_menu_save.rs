//! Save fixtures retain their documented historical provenance.
//! Roster-name validation/results follow the recovered 0.127.0 Unicode contract.
//! Historical0.92 interop vectors remain in native_save.rs and their original evidence files.
#[allow(dead_code)]
#[path = "../src/hero_name.rs"]
mod hero_name;
#[allow(dead_code)]
#[path = "../src/save.rs"]
mod save;

#[test]
fn stock_create_uses_saved_max_guid_and_native_failure_precedence() {
    let mut save = save::Save::parse("42|Earlier|1|1|0|0,0,0,0,0|4|12|3|1\n2|Later|3|1|1|0,0,0,0,0|1|0|0|0\nopen|1|duskwood\n").unwrap();
    let features = [1, 2, 3, 4, 5];
    assert_eq!(save.create_roster_character(" aRYATH ", 4, 1, 1, features, None), 0x2e);
    let created = save.characters().pop().unwrap();
    assert_eq!((created.guid, created.name.as_str(), created.features), (43, "Aryath", features));
    assert_eq!((created.best_level, created.best_seconds, created.runs, created.wins), (1, 0, 0, 0));
    let before = save.plaintext();
    for (name, status) in [("ARYATH", 0x31), ("", 0x45), ("é", 0x46), ("A", 0x46), ("Αβ", 0x48), ("abcdefghijklmnopqrstu", 0x47), ("A B C", 0x4f), ("A  B", 0x50)] {
        assert_eq!(save.create_roster_character(name, 1, 1, 0, [0; 5], None), status);
        assert_eq!(save.plaintext(), before);
    }
    let startup = save::Character { guid: 0xffffff, name: "Startup Hero".into(), race: 1, class: 1, sex: 0, features: [0; 5], best_level: 1, best_seconds: 0, runs: 0, wins: 0 };
    assert_eq!(save.create_roster_character("startup hero", 1, 1, 0, [0; 5], Some(&startup)), 0x31);
    assert_eq!(save.plaintext(), before);
    save.remove_character(42);
    assert_eq!(save.characters().iter().map(|row| row.guid).collect::<Vec<_>>(), [2, 43]);
    assert_eq!(save.unlock_value(1), Some(2));
}

#[test]
fn stock_create_keeps_unicode_names_and_counts_scalars() {
    let mut save = save::Save::default();
    for (name, expected) in [("éé", "Éé"), ("ивАН", "Иван"), ("小米", "小米"), ("안녕", "안녕")] {
        assert_eq!(save.create_roster_character(name, 1, 1, 0, [0; 5], None), 0x2e);
        assert_eq!(save.characters().last().unwrap().name, expected);
    }
    assert_eq!(save.create_roster_character(&"小".repeat(20), 1, 1, 0, [0; 5], None), 0x2e);
    let before = save.plaintext();
    assert_eq!(save.create_roster_character(&"小".repeat(21), 1, 1, 0, [0; 5], None), 0x47);
    assert_eq!(save.plaintext(), before);
}

#[test]
fn stock_create_checks_duplicates_before_the_ten_row_limit_and_wraps_guid() {
    let mut save = save::Save::default();
    for name in ["Aa", "Ab", "Ac", "Ad", "Ae", "Af", "Ag", "Ah", "Ai", "Aj"] {
        assert_eq!(save.create_roster_character(name, 1, 1, 0, [0; 5], None), 0x2e);
    }
    assert_eq!(save.create_roster_character("AA", 1, 1, 0, [0; 5], None), 0x31);
    assert_eq!(save.create_roster_character("Ak", 1, 1, 0, [0; 5], None), 0x34);
    let mut save = save::Save::parse("18446744073709551615|Max|1|1|0|0,0,0,0,0|1|0|0|0\n").unwrap();
    assert_eq!(save.create_roster_character("New", 1, 1, 0, [0; 5], None), 0x2e);
    assert_eq!(save.characters()[1].guid, 0);
}

#[test]
fn legacy_unlocks_migrate_through_their_keys() {
    for (old, current, key) in [
        (0, 1, "elwynn"), (1, 1, "elwynn"), (2, 2, "duskwood"),
        (3, 3, "wsg"), (4, 5, "ab"), (5, 6, "feralas"), (6, 7, "arena"),
        (7, 9, "av"), (8, 10, "brm"), (9, 11, "aq"), (255, 11, "aq"),
    ] {
        let save = save::Save::parse(&format!("unlock|1|{old}\n")).unwrap();
        assert_eq!(save.unlock_value(1), Some(current));
        assert_eq!(save.plaintext(), format!("open|1|{key}\n"));
    }
}

#[test]
fn current_keys_merge_with_migrated_progress_by_maximum() {
    let save = save::Save::parse("open|1|sm\nunlock|1|4\nopen|1|wsg\nopen|8|naxx\n").unwrap();
    assert_eq!(save.unlock_value(1), Some(8));
    assert_eq!(save.unlock_value(8), Some(12));
    assert_eq!(save.plaintext(), "open|1|sm\nopen|8|naxx\n");
}

#[test]
fn first_valid_pick_is_normalized_instead_of_rejected_for_eligibility() {
    let save = save::Save::parse(
        "pick|bad|1|0|elwynn|Skip\npick|6|255|255|unknown| aRYATH |1,x,2,300,3,4,5\npick|8|7|0|naxx|Later\n"
    ).unwrap();
    let pick = save.pick().unwrap();
    assert_eq!((pick.hero.class, pick.hero.race, pick.hero.sex), (1, 1, 1));
    assert_eq!(pick.hero.features, [1, 2, 3, 4, 5]);
    assert_eq!((pick.name.as_str(), pick.zone.as_str()), ("Aryath", "elwynn"));
    assert_eq!(save.plaintext().lines().filter(|line| line.starts_with("pick|")).count(), 1);
}

#[test]
fn class_heroes_use_strict_eligibility_and_last_row_wins() {
    let save = save::Save::parse(
        "hero|1|2|0|1,2,3,4,5\nhero|2|2|0|1,2,3,4,5\nhero|8|7|0|0,0,0,0,0\nhero|1|3|3|5,bad,4,3,2,1\n"
    ).unwrap();
    let heroes = save.heroes();
    assert_eq!(heroes.iter().map(|hero| hero.class).collect::<Vec<_>>(), [8, 1]);
    assert_eq!((heroes[1].race, heroes[1].sex, heroes[1].features), (3, 1, [5, 4, 3, 2, 1]));
}

#[test]
fn ownership_preserves_legendary_and_each_pvp_variant() {
    let save = save::Save::parse("items|101060,101040,101050,38,101040,101070,bad\n").unwrap();
    assert_eq!(save.plaintext(), "items|101040,101050,101060\n");
}
