//! Current desktop Saves listing and captured import lifecycle.
//! See saves-browser-0.100.1.md; the portable envelope lives in `save`.
use crate::save::Save;
use std::{
    cmp::Ordering,
    ffi::OsStr,
    path::{Path, PathBuf},
    time::{SystemTime, UNIX_EPOCH},
};

pub fn files(directory: &Path) -> Vec<PathBuf> {
    // Current140289ef0 skips a failed read_dir;1401adcf0 skips failed entries.
    let Ok(entries) = std::fs::read_dir(directory) else {
        return Vec::new();
    };
    let mut paths = Vec::new();
    for entry in entries.flatten() {
        let path = entry.path();
        // Current1402852f0 filters only the extension, including directories named .sav.
        if save_extension(path.extension()) {
            let name = entry.file_name().to_string_lossy().into_owned();
            let modified = entry
                .metadata()
                .and_then(|metadata| metadata.modified())
                .ok();
            paths.push((path, name, modified));
        }
    }
    // Current140230ff0: descending optional modification time, then UTF-8 name ascending.
    paths.sort_by(|a, b| file_order((&a.1, a.2), (&b.1, b.2)));
    paths.into_iter().map(|(path, _, _)| path).collect()
}

fn save_extension(extension: Option<&OsStr>) -> bool {
    extension.is_some_and(|extension| extension.eq_ignore_ascii_case("sav"))
}

fn file_order(a: (&str, Option<SystemTime>), b: (&str, Option<SystemTime>)) -> Ordering {
    b.1.cmp(&a.1).then_with(|| a.0.cmp(b.0))
}

/// Current14028e1f7 reads the file before showing confirmation. Confirmation owns
/// the filename and original encoded contents, independently of later file/list changes.
#[derive(Clone, Debug)]
pub struct PendingImport {
    pub name: String,
    contents: String,
}

impl PendingImport {
    pub fn read(path: &Path) -> Result<Self, String> {
        let contents = std::fs::read_to_string(path).map_err(|error| error.to_string())?;
        Ok(Self {
            name: path
                .file_name()
                .unwrap_or_default()
                .to_string_lossy()
                .into_owned(),
            contents,
        })
    }

    /// Current14543a760 validates the captured envelope only after confirmation.
    pub fn parse(&self) -> Result<Save, crate::save::SaveError> {
        Save::import(&self.contents)
    }
}

/// The selected target uses UTC Gregorian names for exports and hourly backups.
pub fn export_name(seconds: u64) -> String {
    format!("AzerothSurvivors {}.sav", crate::save::timestamp(seconds))
}

/// Write the envelope already prepared by Options before its directory lookup.
pub fn export(directory: &Path, payload: &str) -> Result<PathBuf, String> {
    // Current 0.115.0 Options export calls 145002900, whose failed
    // duration-since-epoch branch supplies zero to the UTC filename formatter.
    let seconds = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map_or(0, |elapsed| elapsed.as_secs());
    let path = directory.join(export_name(seconds));
    Save::write_payload(&path, payload).map_err(|e| e.to_string())?;
    Ok(path)
}

pub fn import(path: &Path) -> Result<Save, String> {
    PendingImport::read(path)?
        .parse()
        .map_err(|error| error.to_string())
}

/// Native import retains the fixed before-import backup and accepts the parsed state
/// even if persistence fails (current14543a760 calls the void ordinary writer).
pub fn replace(path: &Path, save: &Save) -> Result<(), String> {
    // Current14543a760 ignores before-import backup errors, then calls1454356a0.
    if let Ok(bytes) = std::fs::read(path) {
        let directory = path.parent().unwrap_or_else(|| Path::new("."));
        let _ = std::fs::write(directory.join("characters.before-import.txt"), bytes);
    }
    if let Err(error) = save.write(path) {
        eprintln!(
            "rogue: cannot save characters to {}: {error}",
            path.display()
        );
    }
    Ok(())
}

pub fn open_folder(directory: &Path) -> Result<(), String> {
    std::fs::create_dir_all(directory).map_err(|e| e.to_string())?;
    #[cfg(target_os = "windows")]
    let command = "explorer";
    #[cfg(target_os = "macos")]
    let command = "open";
    #[cfg(not(any(target_os = "windows", target_os = "macos")))]
    let command = "xdg-open";
    std::process::Command::new(command)
        .arg(directory)
        .spawn()
        .map(|_| ())
        .map_err(|e| e.to_string())
}

#[cfg(test)]
mod native_tests {
    use super::*;

    fn vectors() -> serde_json::Value {
        serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.100.1/saves-browser/native-list-fixtures.json"
        ))
        .unwrap()
    }

    #[test]
    fn extension_filter_matches_current_native_cases() {
        for row in vectors()["extensions"].as_array().unwrap() {
            assert_eq!(
                save_extension(row["extension"].as_str().map(OsStr::new)),
                row["accepted"].as_bool().unwrap(),
                "{row}"
            );
        }
    }

    #[test]
    fn optional_time_and_name_order_match_current_native_cases() {
        for row in vectors()["ordering"].as_array().unwrap() {
            let timestamp = |key: &str| {
                row[key]
                    .as_u64()
                    .map(|seconds| UNIX_EPOCH + std::time::Duration::from_secs(seconds))
            };
            let first = (row["first"].as_str().unwrap(), timestamp("first_mtime"));
            let second = (row["second"].as_str().unwrap(), timestamp("second_mtime"));
            let order = if file_order(first, second).is_gt() {
                [1, 0]
            } else {
                [0, 1]
            };
            let expected: Vec<u64> = row["order"]
                .as_array()
                .unwrap()
                .iter()
                .map(|value| value.as_u64().unwrap())
                .collect();
            assert_eq!(order.as_slice(), expected, "{row}");
        }
    }
}
