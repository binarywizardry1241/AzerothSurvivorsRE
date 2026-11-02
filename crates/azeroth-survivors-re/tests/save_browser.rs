#[allow(dead_code)]
#[path = "../src/hero_name.rs"]
mod hero_name;
#[allow(dead_code)]
#[path = "../src/save.rs"]
mod save;
#[allow(dead_code)]
#[path = "../src/save_browser.rs"]
mod save_browser;

fn directory(label: &str) -> std::path::PathBuf {
    let unique = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let path = std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join(format!("../../runtime/save-browser-tests/{label}-{unique}"));
    std::fs::create_dir_all(&path).unwrap();
    path
}

#[test]
fn desktop_listing_filters_only_the_extension_and_ignores_unreadable_directories() {
    let root = directory("listing");
    for name in ["one.sav", "two.SaV", "not.sav.txt", ".sav", "ordinary"] {
        std::fs::write(root.join(name), "deliberately not a sealed save").unwrap();
    }
    // Current predicate does not check file type or validate the portable envelope.
    std::fs::create_dir(root.join("folder.sav")).unwrap();
    let names: std::collections::BTreeSet<_> = save_browser::files(&root)
        .into_iter()
        .map(|path| path.file_name().unwrap().to_string_lossy().into_owned())
        .collect();
    assert_eq!(
        names,
        ["one.sav", "two.SaV", "folder.sav"]
            .map(str::to_owned)
            .into()
    );
    assert!(save_browser::files(&root.join("missing")).is_empty());
    assert!(save_browser::files(&root.join("one.sav")).is_empty());
}

#[test]
fn desktop_listing_orders_cached_mtime_descending_then_filename_ascending() {
    use std::{
        fs::{File, FileTimes},
        time::{Duration, UNIX_EPOCH},
    };
    let root = directory("ordering");
    for (name, seconds) in [
        ("older.sav", 10),
        ("z.sav", 20),
        ("A.sav", 20),
        ("b.sav", 20),
    ] {
        let file = File::create(root.join(name)).unwrap();
        file.set_times(FileTimes::new().set_modified(UNIX_EPOCH + Duration::from_secs(seconds)))
            .unwrap();
    }
    let names: Vec<_> = save_browser::files(&root)
        .into_iter()
        .map(|path| path.file_name().unwrap().to_string_lossy().into_owned())
        .collect();
    assert_eq!(names, ["A.sav", "b.sav", "z.sav", "older.sav"]);
}

#[test]
fn confirmation_keeps_the_clicked_contents_after_file_replacement_or_removal() {
    let root = directory("snapshot");
    let path = root.join("chosen.sav");
    let first = save::Save::parse("unlock|1|2\n").unwrap();
    first.write_export(&path).unwrap();
    let pending = save_browser::PendingImport::read(&path).unwrap();
    assert_eq!(pending.name, "chosen.sav");
    save::Save::parse("unlock|1|3\n")
        .unwrap()
        .write_export(&path)
        .unwrap();
    assert_eq!(pending.parse().unwrap().unlock_value(1), Some(2));
    std::fs::remove_file(&path).unwrap();
    assert_eq!(pending.parse().unwrap().unlock_value(1), Some(2));
}

#[test]
fn confirmation_reads_utf8_first_and_validates_the_envelope_only_when_confirmed() {
    let root = directory("snapshot-errors");
    let path = root.join("bad.sav");
    std::fs::write(&path, "plaintext is readable but not portable").unwrap();
    let pending = save_browser::PendingImport::read(&path).unwrap();
    assert!(matches!(pending.parse(), Err(save::SaveError::NotASave)));
    std::fs::write(&path, [0xff, 0xfe]).unwrap();
    assert!(save_browser::PendingImport::read(&path).is_err());
    assert!(matches!(pending.parse(), Err(save::SaveError::NotASave)));
}

#[test]
fn native_export_timestamp_uses_utc_and_handles_leap_days() {
    for (seconds, expected) in [
        (0, "AzerothSurvivors 1970-01-01 00-00-00.sav"),
        (951_867_245, "AzerothSurvivors 2000-02-29 23-34-05.sav"),
        (1_792_131_905, "AzerothSurvivors 2026-10-16 06-25-05.sav"),
        (4_107_542_400, "AzerothSurvivors 2100-03-01 00-00-00.sav"),
    ] {
        assert_eq!(save_browser::export_name(seconds), expected);
    }
}

#[test]
fn import_replacement_retains_previous_native_named_backup() {
    let unique = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let directory = std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join(format!("../../runtime/save-browser-tests/{unique}"));
    let path = directory.join("custom-active.data");
    let old = save::Save::parse("unlock|1|2\n").unwrap();
    old.write(&path).unwrap();
    let previous_bytes = std::fs::read(&path).unwrap();
    let new = save::Save::parse("unlock|1|3\n").unwrap();
    save_browser::replace(&path, &new).unwrap();
    assert_eq!(
        std::fs::read(directory.join("characters.before-import.txt")).unwrap(),
        previous_bytes
    );
    assert_eq!(save::Save::load(&path).unwrap().unlock_value(1), Some(3));
    assert!(!path.with_extension("before-import.txt").exists());
}

#[test]
fn native_import_ignores_backup_write_failure() {
    let unique = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let directory = std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR")).join(format!(
        "../../runtime/save-browser-tests/backup-failure-{unique}"
    ));
    let path = directory.join("characters.txt");
    save::Save::parse("unlock|1|2\n")
        .unwrap()
        .write(&path)
        .unwrap();
    std::fs::create_dir(directory.join("characters.before-import.txt")).unwrap();
    let new = save::Save::parse("unlock|1|3\n").unwrap();
    save_browser::replace(&path, &new).unwrap();
    assert_eq!(save::Save::load(&path).unwrap().unlock_value(1), Some(3));
}

#[test]
fn native_import_succeeds_when_active_save_write_fails() {
    let unique = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap()
        .as_nanos();
    let directory = std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR")).join(format!(
        "../../runtime/save-browser-tests/active-write-failure-{unique}"
    ));
    let exported = directory.join("Saves/native-import.sav");
    save::Save::parse("unlock|1|3\n")
        .unwrap()
        .write(&exported)
        .unwrap();
    let active = directory.join("characters.txt");
    std::fs::create_dir(&active).unwrap();
    let imported = save_browser::import(&exported).unwrap();
    assert!(save_browser::replace(&active, &imported).is_ok());
    assert_eq!(imported.unlock_value(1), Some(3));
    assert!(active.is_dir());
}
