//! 0.92 updater rules recovered from the SHA-bound executable.
//! Exact executable eligibility gates both metadata requests and native old-backup cleanup.
//! Native lifecycle/worker adapters are connected behind the same shipped-executable gate.

use std::path::Path;

use serde_json::Value;

#[path = "update_check.rs"]
pub mod check;
#[path = "update_data.rs"]
pub mod data;
#[path = "update_install.rs"]
pub mod install;
#[path = "update_worker.rs"]
pub mod worker;
pub use check::{CheckRequest, UpdatePlan};

pub const MANIFEST_URL: &str = "https://wow.aethus.pl/exe/latest.json";
pub const DATA_MANIFEST_URL: &str = "https://wow.aethus.pl/exe/data/patches.json";
pub const USER_AGENT: &str = "AzerothSurvivors/0.2.0";

/// 0x14011a0c0: the shipped executable stem and the exact opt-out value gate the worker.
pub fn eligible_executable(path: &Path, update_setting: Option<&str>) -> bool {
    update_setting != Some("0")
        && path
            .file_stem()
            .and_then(|stem| stem.to_str())
            .is_some_and(|stem| stem.eq_ignore_ascii_case("AzerothSurvivors"))
}

/// 0x140119dd0 / 0x1400fd690 / 0x14010afd0: numeric lane comparison, not SemVer.
pub fn newer(candidate: &str, current: &str) -> bool {
    fn lanes(value: &str) -> Vec<u64> {
        value
            .trim_start_matches('v')
            .split('.')
            .map(|lane| lane.trim().parse::<u64>().unwrap_or(0))
            .collect()
    }
    lanes(candidate) > lanes(current)
}

/// 0x1400e868f: the install worker starts automatically only for this exact value.
pub fn automatic(update_auto_setting: Option<&str>) -> bool {
    update_auto_setting == Some("1")
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Part {
    pub url: String,
    pub size: u64,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Download {
    pub name: String,
    pub size: u64,
    pub sha256: String,
    pub parts: Vec<Part>,
}

impl Download {
    /// 0x140118060 / 0x140141680. `base` is the manifest URL through its last slash.
    pub fn from_json(value: &Value, base: &str) -> Result<Self, &'static str> {
        let parts = value
            .get("parts")
            .and_then(Value::as_array)
            .ok_or("no parts")?
            .iter()
            .map(|part| {
                let url = part.get("url").and_then(Value::as_str).unwrap_or("");
                Part {
                    url: if url.contains("://") {
                        url.to_owned()
                    } else {
                        format!("{base}{url}")
                    },
                    size: part.get("size").and_then(Value::as_u64).unwrap_or(0),
                }
            })
            .collect::<Vec<_>>();
        let sha256 = value
            .get("sha256")
            .and_then(Value::as_str)
            .unwrap_or("")
            .to_ascii_lowercase();
        if parts.is_empty() || sha256.len() != 64 {
            return Err("a download is listed incomplete");
        }
        Ok(Self {
            name: value
                .get("name")
                .and_then(Value::as_str)
                .unwrap_or("")
                .to_owned(),
            size: value.get("size").and_then(Value::as_u64).unwrap_or(0),
            sha256,
            parts,
        })
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct LatestManifest {
    pub version: String,
    pub notes: String,
    pub download: Download,
}

impl LatestManifest {
    /// 0x1401185f0: parsed JSON contract, also used by the gated read-only request.
    pub fn from_json(value: &Value, manifest_url: &str) -> Result<Self, &'static str> {
        let version = value
            .get("version")
            .and_then(Value::as_str)
            .filter(|version| !version.is_empty())
            .ok_or("latest.json is incomplete")?;
        let base = manifest_url
            .rfind('/')
            .map(|position| &manifest_url[..=position])
            .unwrap_or("");
        Ok(Self {
            version: version.to_owned(),
            notes: value
                .get("notes")
                .and_then(Value::as_str)
                .unwrap_or("")
                .to_owned(),
            download: Download::from_json(value, base)?,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn shipped_name_and_exact_environment_gate() {
        assert!(eligible_executable(Path::new("AzerothSurvivors.exe"), None));
        assert!(eligible_executable(
            Path::new("AZEROTHSURVIVORS.exe"),
            Some("false")
        ));
        assert!(!eligible_executable(
            Path::new("AzerothSurvivors.exe"),
            Some("0")
        ));
        assert!(!eligible_executable(
            Path::new("AzerothSurvivorsRE"),
            Some("1")
        ));
        assert!(automatic(Some("1")));
        assert!(!automatic(Some("true")));
    }

    #[test]
    fn native_numeric_lanes_preserve_non_semver_behavior() {
        assert!(newer("v0.94.1", "0.92.0"));
        assert!(!newer("0.92.0", "0.92.0"));
        assert!(newer("1.0.0.0", "1.0.0"));
        assert!(!newer("1.0.0-beta", "1.0.0"));
        assert!(newer("vv1.\u{2003}+3\u{2003}", "1.2"));
        assert!(newer("1.2.4", "1.18446744073709551616.99"));
        assert!(!newer("V2.0", "1.0"));
    }

    #[test]
    fn manifest_keeps_native_defaults_and_literal_url_concatenation() {
        let value = serde_json::json!({
            "version": "0.94.1", "notes": false, "sha256": "A".repeat(64),
            "parts": [{"url": "file.bin", "size": 42}, {"url": "../other"},
                      {"url": "odd://host/a"}, {"url": "/root"}, false]
        });
        let manifest = LatestManifest::from_json(&value, MANIFEST_URL).unwrap();
        assert_eq!(manifest.notes, "");
        assert_eq!(manifest.download.name, "");
        assert_eq!(manifest.download.size, 0);
        assert_eq!(manifest.download.sha256, "a".repeat(64));
        assert_eq!(
            manifest.download.parts[0].url,
            "https://wow.aethus.pl/exe/file.bin"
        );
        assert_eq!(
            manifest.download.parts[1].url,
            "https://wow.aethus.pl/exe/../other"
        );
        assert_eq!(manifest.download.parts[2].url, "odd://host/a");
        assert_eq!(
            manifest.download.parts[3].url,
            "https://wow.aethus.pl/exe//root"
        );
        assert_eq!(
            manifest.download.parts[4],
            Part {
                url: "https://wow.aethus.pl/exe/".into(),
                size: 0
            }
        );
    }

    #[test]
    fn parser_uses_native_validation_order_and_byte_length() {
        let mut value = serde_json::json!({"version": "", "parts": []});
        assert_eq!(
            LatestManifest::from_json(&value, MANIFEST_URL),
            Err("latest.json is incomplete")
        );
        value["version"] = "0.94.1".into();
        assert_eq!(
            LatestManifest::from_json(&value, MANIFEST_URL),
            Err("a download is listed incomplete")
        );
        value["parts"] = serde_json::json!([{}]);
        value["sha256"] = "é".repeat(32).into();
        assert!(LatestManifest::from_json(&value, MANIFEST_URL).is_ok());
        value["parts"] = Value::Null;
        assert_eq!(
            LatestManifest::from_json(&value, MANIFEST_URL),
            Err("no parts")
        );
    }
}
