//! Current0.109.0 ordinary-write1458a33c0, backup1458ef860 and filter1458f0600.
//! See save-backup-0.109.0.md for current bounded default/clock/retention proof.
use std::{fs, path::Path};

/// Native UTC Gregorian conversion shared by export and backup names.
pub fn timestamp(seconds: u64) -> String {
    let days = (seconds / 86_400) as i64 + 719_468;
    let era = days / 146_097;
    let day_of_era = days - era * 146_097;
    let year_of_era =
        (day_of_era - day_of_era / 1460 + day_of_era / 36524 - day_of_era / 146096) / 365;
    let mut year = year_of_era + era * 400;
    let day_of_year = day_of_era - (365 * year_of_era + year_of_era / 4 - year_of_era / 100);
    let month_piece = (5 * day_of_year + 2) / 153;
    let day = day_of_year - (153 * month_piece + 2) / 5 + 1;
    let month = month_piece + if month_piece < 10 { 3 } else { -9 };
    year += i64::from(month <= 2);
    let time = seconds % 86_400;
    format!(
        "{year:04}-{month:02}-{day:02} {:02}-{:02}-{:02}",
        time / 3600,
        time / 60 % 60,
        time % 60
    )
}

fn has_progress(save: &super::Save) -> bool {
    // The typed default gate agrees with the normalized native serializer:
    // malformed/unknown records and zero-only counters do not create progress.
    !save.plaintext().is_empty()
}

pub(super) fn after_write(
    save: &super::Save,
    path: &Path,
    payload: &str,
    clock: impl FnOnce() -> u64,
) {
    if !has_progress(save) {
        return;
    }
    let seconds = clock();
    let base = path.parent().unwrap_or_else(|| Path::new("."));
    let stamp = base.join("characters.backup-at.txt");
    if fs::read_to_string(&stamp)
        .ok()
        .and_then(|value| value.trim().parse::<u64>().ok())
        .is_some_and(|last| last <= seconds && seconds - last < 3600)
    {
        return;
    }
    let directory = base.join("Saves");
    let backup = directory.join(format!("Backup {}.sav", timestamp(seconds)));
    let written = fs::create_dir_all(&directory).and_then(|()| fs::write(&backup, payload));
    if let Err(error) = written {
        eprintln!(
            "rogue: cannot back the save up to {}: {error}",
            backup.display()
        );
        return;
    }
    // The native filename filter is exact-case `Backup ` and `.sav`; other saves are retained.
    let mut paths = fs::read_dir(&directory)
        .into_iter()
        .flatten()
        .filter_map(Result::ok)
        .filter_map(|entry| {
            let path = entry.path();
            let name = path.file_name()?.to_str()?;
            (name.starts_with("Backup ") && name.ends_with(".sav")).then_some(path)
        })
        .collect::<Vec<_>>();
    paths.sort();
    let remove = paths.len().saturating_sub(5);
    for path in paths.into_iter().take(remove).rev() {
        let _ = fs::remove_file(path);
    }
    // Native keeps the lexically newest five and attempts older deletions in reverse order.
    // Failed cleanup does not invalidate the created backup. Timer errors are ignored too.
    let _ = fs::write(stamp, seconds.to_string());
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::save::{Save, open};
    fn directory(name: &str) -> std::path::PathBuf {
        let path = Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("../../runtime/save-backup-tests")
            .join(format!("{name}-{}", std::process::id()));
        let _ = fs::remove_dir_all(&path);
        fs::create_dir_all(&path).unwrap();
        path
    }

    #[test]
    fn backup_clock_follows_active_write_and_skips_default_accounts() {
        let directory = directory("clock-order");
        let active = directory.join("characters.txt");
        let save = Save::parse("talent|1|80|imp_heroic:1\n").unwrap();
        let mut calls = 0;
        save.write_with_clock(&active, || {
            // The injected clock sees the completed active payload.
            assert_eq!(open(&fs::read_to_string(&active).unwrap()).unwrap(), save.plaintext());
            calls += 1;
            1_700_000_000
        }).unwrap();
        assert_eq!(calls, 1);
        Save::default().write_with_clock(&directory.join("default.txt"), || {
            panic!("A default account must not sample the backup clock")
        }).unwrap();
        // An active-file error still reaches the later hourly backup stage.
        let blocked = directory.join("blocked");
        fs::create_dir(&blocked).unwrap();
        assert!(save.write_with_clock(&blocked, || {
            assert!(blocked.is_dir());
            calls += 1;
            1_700_003_600
        }).is_err());
        assert_eq!(calls, 2);
        assert_eq!(fs::read_to_string(directory.join("characters.backup-at.txt")).unwrap(), "1700003600");
        let backup = directory.join("Saves").join(format!("Backup {}.sav", timestamp(1_700_003_600)));
        assert_eq!(open(&fs::read_to_string(backup).unwrap()).unwrap(), save.plaintext());
        fs::remove_dir_all(directory).unwrap();
    }

    #[test]
    fn current_native_typed_default_and_utc_vectors() {
        let fixtures: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.109.0/save-backup/native-vectors.json"
        )).unwrap();
        for row in fixtures["cases"].as_array().unwrap() {
            match row["contract"].as_str().unwrap() {
                "typed-default" => {
                    let save = Save::parse(row["input"].as_str().unwrap()).unwrap();
                    assert_eq!(has_progress(&save), row["native_has_progress"].as_bool().unwrap(), "{row}");
                }
                "utc-calendar" => {
                    let fields = row["fields"].as_array().unwrap();
                    let expected = format!("{:04}-{:02}-{:02} {:02}-{:02}-{:02}",
                        fields[0].as_u64().unwrap(), fields[1].as_u64().unwrap(), fields[2].as_u64().unwrap(),
                        fields[3].as_u64().unwrap(), fields[4].as_u64().unwrap(), fields[5].as_u64().unwrap());
                    assert_eq!(timestamp(row["seconds"].as_u64().unwrap()), expected, "{row}");
                }
                _ => {}
            }
        }
    }

    #[test]
    fn hourly_boundary_future_clock_and_exact_five_copy_retention() {
        let directory = directory("hourly");
        let active = directory.join("characters.txt");
        let save = Save::parse("talent|1|80|imp_heroic:1\n").unwrap();
        save.write_at(&active, 1_700_000_000).unwrap();
        let saves = directory.join("Saves");
        fs::write(saves.join("AzerothSurvivors manual.sav"), "manual").unwrap();
        fs::write(saves.join("backup lowercase.sav"), "keep").unwrap();
        save.write_at(&active, 1_700_003_599).unwrap();
        assert_eq!(fs::read_dir(&saves).unwrap().count(), 3);
        for hour in 1..=7 {
            save.write_at(&active, 1_700_000_000 + hour * 3600).unwrap();
        }
        assert_eq!(fs::read_dir(&saves).unwrap().count(), 7);
        assert!(
            !saves
                .join(format!("Backup {}.sav", timestamp(1_700_000_000)))
                .exists()
        );
        let latest = saves.join(format!("Backup {}.sav", timestamp(1_700_025_200)));
        assert_eq!(
            open(&fs::read_to_string(latest).unwrap()).unwrap(),
            save.plaintext()
        );
        fs::write(directory.join("characters.backup-at.txt"), "9999999999").unwrap();
        save.write_at(&active, 1_700_028_800).unwrap();
        assert_eq!(
            fs::read_to_string(directory.join("characters.backup-at.txt")).unwrap(),
            "1700028800"
        );
        fs::remove_dir_all(directory).unwrap();
    }

    #[test]
    fn empty_profiles_exports_and_failed_backup_do_not_advance_timer() {
        let directory = directory("empty");
        let active = directory.join("characters.txt");
        Save::default().write_at(&active, 123).unwrap();
        assert!(!directory.join("Saves").exists());
        let save = Save::parse("talent|1|80|imp_heroic:1\n").unwrap();
        save.write_export(&directory.join("export.sav")).unwrap();
        assert!(!directory.join("characters.backup-at.txt").exists());
        fs::write(directory.join("Saves"), "block directory").unwrap();
        save.write_at(&active, 123).unwrap();
        assert!(!directory.join("characters.backup-at.txt").exists());
        fs::remove_dir_all(directory).unwrap();
    }
}
