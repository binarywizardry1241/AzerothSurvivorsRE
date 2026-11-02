#[path = "../src/options_config.rs"]
mod options_config;

use std::{
    collections::BTreeMap,
    path::PathBuf,
    sync::atomic::{AtomicU64, Ordering},
};

#[test]
fn native_default_reset_keeps_only_overrides_and_unknown_keys() {
    let file = options_config::Config {
        cvars: BTreeMap::from([
            ("MasterVolume".into(), "0.2".into()),
            ("GXWINDOW".into(), "0".into()),
            ("addon_unknown".into(), "kept".into()),
        ]),
    };
    let composed = file.compose([
        ("MasterVolume".into(), "1".into(), "1".into()),
        ("gxWindow".into(), "1".into(), "0".into()),
        ("hudClock".into(), "1".into(), "1".into()),
    ]);
    assert_eq!(
        composed.cvars,
        BTreeMap::from([
            ("GXWINDOW".into(), "1".into()),
            ("addon_unknown".into(), "kept".into()),
        ])
    );
}

#[test]
fn native_config_text_matches_captured_default_reset_shape() {
    let file = options_config::Config::default().compose([
        ("gxWindow".into(), "1".into(), "0".into()),
        ("MasterVolume".into(), "1".into(), "1".into()),
    ]);
    assert_eq!(
        file.text().unwrap(),
        format!("{}[cvars]\ngxWindow = \"1\"\n", options_config::HEADER)
    );
    assert_eq!(options_config::SAVE_QUIET.as_secs(), 1);
}

fn scratch() -> PathBuf {
    static NEXT: AtomicU64 = AtomicU64::new(0);
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("../../runtime/menu-config-tests");
    std::fs::create_dir_all(&root).unwrap();
    loop {
        let nonce = NEXT.fetch_add(1, Ordering::Relaxed);
        let directory = root.join(format!("{}-{nonce}", std::process::id()));
        // Reserve ownership atomically. Equal clock samples, another process
        // and stale output from a reused PID must never share a fixture.
        match std::fs::create_dir(&directory) {
            Ok(()) => return directory,
            Err(error) if error.kind() == std::io::ErrorKind::AlreadyExists => continue,
            Err(error) => panic!("cannot reserve {}: {error}", directory.display()),
        }
    }
}

#[test]
fn parallel_fixture_reservations_are_distinct_and_already_owned() {
    let threads: Vec<_> = (0..32).map(|_| std::thread::spawn(scratch)).collect();
    let directories: Vec<_> = threads.into_iter().map(|t| t.join().unwrap()).collect();
    let unique: std::collections::BTreeSet<_> = directories.iter().collect();
    assert_eq!(unique.len(), directories.len());
    for directory in &directories {
        assert!(
            directory.is_dir(),
            "scratch must reserve its directory before returning"
        );
    }
    for directory in directories {
        std::fs::remove_dir(directory).unwrap();
    }
}

#[test]
fn native_replacement_uses_extension_tmp_and_keeps_it_on_rename_failure() {
    let directory = scratch();
    let file = directory.join("nested/config.toml");
    options_config::write_atomic(&file, b"first").unwrap();
    options_config::write_atomic(&file, b"second").unwrap();
    assert_eq!(std::fs::read(&file).unwrap(), b"second");
    assert!(!file.with_extension("tmp").exists());

    std::fs::remove_file(&file).unwrap();
    std::fs::create_dir(&file).unwrap();
    assert!(options_config::write_atomic(&file, b"pending").is_err());
    assert_eq!(
        std::fs::read(file.with_extension("tmp")).unwrap(),
        b"pending"
    );
    assert!(file.is_dir());
    std::fs::remove_dir_all(directory).unwrap();
}

#[test]
fn native_typed_config_rejects_a_bad_value_without_partial_overrides() {
    for text in [
        "cvars = 3",
        "cvars = []",
        "[cvars]\nMasterVolume = '0.2'\ngxWindow = 1",
        "[cvars]\nMasterVolume = '0.2'\ngxWindow = true",
        "[cvars]\nMasterVolume = '0.2'\nUNKNOWN = 1979-05-27T07:32:00Z",
    ] {
        assert!(options_config::Config::parse(text).is_err(), "{text}");
    }
    assert!(options_config::Config::parse("").unwrap().cvars.is_empty());
    let config = options_config::Config::parse(
        "unrelated = 17\n[cvars]\nMasterVolume = '0.2'\nUNKNOWN = 'kept'",
    )
    .unwrap();
    assert_eq!(config.cvars["MasterVolume"], "0.2");
    assert_eq!(config.cvars["UNKNOWN"], "kept");
    // Native TOML's whole-map DateTime adapter is retained by using its exact
    // typed deserializer, rather than imposing a hand-written table check.
    let datetime = options_config::Config::parse("cvars = 1979-05-27T07:32:00Z").unwrap();
    assert_eq!(
        datetime.cvars["$__toml_private_datetime"],
        "1979-05-27T07:32:00Z"
    );
}

#[test]
fn native_bad_config_load_does_not_write_or_hold_later_changes() {
    let directory = scratch();
    std::fs::create_dir_all(&directory).unwrap();
    let path = directory.join("config.toml");
    let bad = "[cvars]\nMasterVolume = '0.2'\ngxWindow = false";
    std::fs::write(&path, bad).unwrap();
    let (config, warning) = options_config::Config::read(&path);
    assert!(config.cvars.is_empty());
    assert!(warning.unwrap().contains("running on defaults"));
    assert_eq!(std::fs::read_to_string(&path).unwrap(), bad);
    let changed = config.compose([("gxWindow".into(), "1".into(), "0".into())]);
    options_config::write_atomic(&path, changed.text().unwrap().as_bytes()).unwrap();
    let (loaded, warning) = options_config::Config::read(&path);
    assert!(warning.is_none());
    assert_eq!(
        loaded.cvars,
        BTreeMap::from([("gxWindow".into(), "1".into())])
    );
    std::fs::remove_dir_all(directory).unwrap();
}

#[test]
fn native_numeric_load_trims_and_accepts_nonfinite_float_values() {
    for value in ["0.25", "\u{2003}-1.5\u{2003}", "+Infinity", "-inf", "NaN"] {
        assert!(options_config::valid_loaded_value(" 1 ", value), "{value}");
    }
    for value in ["", "bad", "1,25", "1f"] {
        assert!(!options_config::valid_loaded_value("1", value), "{value}");
    }
    assert!(options_config::valid_loaded_value("auto", "any saved text"));
}
