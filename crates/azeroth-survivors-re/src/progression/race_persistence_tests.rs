//! Source regressions for the 0.120.0 permanent-race account contract.
//! These tests require compilation; source-only recovery does not execute them.

use super::*;
use crate::save::{Hero, Pick, RunMods};
use std::{
    fs,
    path::{Path, PathBuf},
    sync::atomic::{AtomicUsize, Ordering},
};

fn funded_save(records: &str) -> Save {
    let catalog = Catalog::embedded();
    let achievements = catalog
        .achievements
        .iter()
        .map(|entry| entry.key.as_str())
        .collect::<Vec<_>>()
        .join(",");
    Save::parse(&format!("ach|{achievements}\n{records}")).unwrap()
}

fn race_row(save: &Save) -> Option<String> {
    save.plaintext()
        .lines()
        .find(|line| line.starts_with("races|"))
        .map(str::to_owned)
}

#[test]
fn race_loader_collects_all_rows_filters_tokens_and_serializes_one_sorted_set() {
    let cases: &[(&str, &[u8])] = &[
        ("", &[]),
        ("races|\n", &[]),
        ("races|8,2,2,1\nraces|4,8\n", &[1, 2, 4, 8]),
        ("races|+3,03,3,0008,+0002\n", &[2, 3, 8]),
        ("races|0,9,255,256,-1,bad,,+\n", &[]),
        ("races|2, 3,4 ,5\n", &[2, 5]),
        (" \traces|8,2\u{2003}\n", &[2, 8]),
        ("races|8|2,3\nraces|4,5|6\n", &[3, 4]),
        ("Races|1\nxraces|2\nraces |3\nraces|6\n", &[6]),
    ];
    for (input, expected) in cases {
        let save = Save::parse(input).unwrap();
        assert_eq!(save.purchased_races(), *expected, "{input:?}");
        let expected_row = (!expected.is_empty()).then(|| {
            format!(
                "races|{}",
                expected
                    .iter()
                    .map(u8::to_string)
                    .collect::<Vec<_>>()
                    .join(",")
            )
        });
        assert_eq!(race_row(&save), expected_row, "{input:?}");
        let serialized = save.plaintext();
        assert_eq!(Save::parse(&serialized).unwrap().plaintext(), serialized);
    }
}

#[test]
fn accepted_reward_command_persists_normalized_races_and_charges_each_once() {
    let mut save = funded_save("races|1,4\ntabard|90011\nperk|rerolls:1\n");
    let mut request = RewardPlan::read(&save);
    request.races = vec![8, 4, 1, 8, 2, 2];
    let mut optimistic = save.clone();
    let mut plan = Progress::read_with_menu(&save, None);
    plan.races = request.races.clone();
    plan.write_rewards(&mut optimistic).unwrap();
    assert!(apply_reward_command(&mut save, request).unwrap());
    assert_eq!(save.plaintext(), optimistic.plaintext());
    assert_eq!(save.purchased_races(), [1, 2, 4, 8]);
    assert_eq!(race_row(&save).as_deref(), Some("races|1,2,4,8"));

    let catalog = Catalog::embedded();
    let account = Progress::read_with_menu(&save, None);
    let mut without_races = account.clone();
    without_races.races.clear();
    assert_eq!(account.spent(&catalog) - without_races.spent(&catalog), 400);
    assert_eq!(
        available_points(&save),
        account.earned_points(&catalog) - account.spent(&catalog)
    );
    let mut reopened = Save::parse(&save.plaintext()).unwrap();
    assert_eq!(RewardPlan::read(&reopened).races, account.races);
    assert_eq!(available_points(&reopened), available_points(&save));
    assert!(apply_reward_reset(&mut reopened).unwrap());
    assert_eq!(reopened.purchased_races(), [1, 2, 4, 8]);
    assert_eq!(available_points(&reopened), available_points(&save) + 15);
    assert_eq!(
        Save::parse(&reopened.plaintext())
            .unwrap()
            .purchased_races(),
        [1, 2, 4, 8]
    );
}

#[test]
fn rejected_race_removal_invalid_id_and_overspend_leave_the_account_untouched() {
    for races in [vec![], vec![0, 1], vec![1, 9], vec![1, 255]] {
        let mut save = funded_save("races|1\nstat|kills=17\n");
        let before = save.plaintext();
        let mut request = RewardPlan::read(&save);
        request.races = races;
        assert!(!apply_reward_command(&mut save, request).unwrap());
        assert_eq!(save.plaintext(), before);
    }
    let mut save = Save::parse("stat|kills=17\n").unwrap();
    let before = save.plaintext();
    let mut request = RewardPlan::read(&save);
    request.races = vec![2];
    assert!(!apply_reward_command(&mut save, request).unwrap());
    assert_eq!(save.plaintext(), before);
}

#[test]
fn optimistic_and_backend_perk_resets_keep_permanent_purchases_and_other_families() {
    let source = funded_save(
        "races|8,2,2\nperk|rerolls:1\ntabard|90011\npets|rabbit,owl\n\
         stat|kills=17\nitems|101000\nresets|1\n",
    );
    let before = Progress::read_with_menu(&source, None);
    let catalog = Catalog::embedded();
    let mut optimistic = source.clone();
    let mut plan = before.clone();
    plan.perks.clear();
    plan.resets += 1;
    plan.write_rewards(&mut optimistic).unwrap();

    let mut backend = source;
    assert!(apply_reward_reset(&mut backend).unwrap());
    assert_eq!(backend.plaintext(), optimistic.plaintext());
    let after = Progress::read_with_menu(&backend, None);
    assert!(after.perks.is_empty());
    assert_eq!(after.resets, 2);
    assert_eq!(after.races, before.races);
    assert_eq!(after.tabards, before.tabards);
    assert_eq!(after.companions, before.companions);
    assert_eq!(backend.statistics()["kills"], 17);
    assert!(
        backend
            .plaintext()
            .lines()
            .any(|line| line == "items|101000")
    );
    assert_eq!(before.spent(&catalog) - after.spent(&catalog), 15);
    let mut permanent_free = after.clone();
    permanent_free.races.clear();
    assert_eq!(after.spent(&catalog) - permanent_free.spent(&catalog), 200);
    assert_eq!(
        Save::parse(&backend.plaintext()).unwrap().purchased_races(),
        [2, 8]
    );
}

#[test]
fn reset_gates_preserve_races_when_perks_are_absent_or_two_resets_are_used() {
    for records in [
        "races|2,8\n",
        "races|2,8\nresets|1\n",
        "races|2,8\nperk|rerolls:1\nresets|2\n",
        "races|2,8\nperk|rerolls:1\nresets|4294967295\n",
    ] {
        let mut save = funded_save(records);
        let before = save.plaintext();
        assert!(!apply_reward_reset(&mut save).unwrap());
        assert_eq!(save.plaintext(), before);
    }
    for resets in [0, 1] {
        let mut save = funded_save(&format!("races|2,8\nperk|rerolls:1\nresets|{resets}\n"));
        assert!(apply_reward_reset(&mut save).unwrap());
        assert_eq!(Progress::read_with_menu(&save, None).resets, resets + 1);
        assert_eq!(save.purchased_races(), [2, 8]);
    }
    // An accepted explicit rank-zero row still has a perk-vector entry until
    // a real load drops it; Reset uses vector presence rather than rank sum.
    let mut save = funded_save("races|2,8\n");
    let mut request = RewardPlan::read(&save);
    request.perks.insert("rerolls".into(), 0);
    assert!(apply_reward_command(&mut save, request).unwrap());
    assert!(apply_reward_reset(&mut save).unwrap());
    assert_eq!(save.purchased_races(), [2, 8]);
}

#[test]
fn unrelated_account_commands_and_picker_mutations_retain_race_ownership() {
    let mut save = funded_save("races|8,2\nstat|kills=17\n");
    apply_pet_command(&mut save, vec!["squirrel".into()]).unwrap();
    assert_eq!(save.purchased_races(), [2, 8]);
    crate::armory::apply_gear_command(
        &mut save,
        1,
        crate::save::gear::ClassGear {
            class_id: 1,
            ..Default::default()
        },
    )
    .unwrap();
    assert_eq!(save.purchased_races(), [2, 8]);
    save.set_talent_allocation(1, 80, &[]).unwrap();
    assert_eq!(save.purchased_races(), [2, 8]);
    let pick = Pick {
        hero: Hero {
            class: 1,
            race: 8,
            sex: 0,
            features: [0; 5],
        },
        name: "Arthas".into(),
        zone: "elwynn".into(),
        heroic_rank: 0,
        mods: RunMods::default(),
    };
    save.set_hero(&pick.hero).unwrap();
    save.set_pick(&pick).unwrap();
    save.grant_achievements(&["persistence_fixture".into()], None);
    save.normalize_achievement_inputs();
    assert_eq!(save.purchased_races(), [2, 8]);
    assert_eq!(
        Save::parse(&save.plaintext()).unwrap().purchased_races(),
        [2, 8]
    );
}

struct FixtureDirectory(PathBuf);

impl FixtureDirectory {
    fn new(name: &str) -> Self {
        static SERIAL: AtomicUsize = AtomicUsize::new(0);
        let parent = Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("../../runtime/source-tests/race-persistence");
        fs::create_dir_all(&parent).unwrap();
        let path = parent.join(format!(
            "{name}-{}-{}",
            std::process::id(),
            SERIAL.fetch_add(1, Ordering::Relaxed)
        ));
        // Never erase a pre-existing test/recovery directory to obtain a fixture.
        fs::create_dir(&path).unwrap();
        Self(path)
    }
}

impl Drop for FixtureDirectory {
    fn drop(&mut self) {
        let _ = fs::remove_dir_all(&self.0);
    }
}

#[test]
fn active_save_export_import_and_races_only_hourly_backup_keep_ownership() {
    let directory = FixtureDirectory::new("file-round-trip");
    let active = directory.0.join("characters.txt");
    let save = Save::parse("races|8,2,2\n").unwrap();
    let seconds = 1_700_000_000;
    save.write_at(&active, seconds).unwrap();
    let active_payload = fs::read_to_string(&active).unwrap();
    assert!(active_payload.starts_with("RSE1:"));
    let loaded = Save::load(&active).unwrap();
    assert_eq!(loaded.plaintext(), "races|2,8\n");

    // Permanent ownership alone is a nondefault account and receives the
    // ordinary hourly backup using the exact active-write envelope.
    let stamp = directory.0.join("characters.backup-at.txt");
    assert_eq!(fs::read_to_string(&stamp).unwrap(), seconds.to_string());
    let backup = directory
        .0
        .join("Saves")
        .join(format!("Backup {}.sav", crate::save::timestamp(seconds)));
    assert_eq!(fs::read_to_string(&backup).unwrap(), active_payload);
    assert_eq!(Save::load(&backup).unwrap().purchased_races(), [2, 8]);

    let export = directory.0.join("export.sav");
    loaded.write_export(&export).unwrap();
    let imported = Save::import(&fs::read_to_string(&export).unwrap()).unwrap();
    assert_eq!(imported.purchased_races(), [2, 8]);
    assert_eq!(imported.plaintext(), loaded.plaintext());
    assert_eq!(fs::read_to_string(&stamp).unwrap(), seconds.to_string());
    imported.write_at(&active, seconds + 3600).unwrap();
    assert_eq!(Save::load(&active).unwrap().purchased_races(), [2, 8]);
}
