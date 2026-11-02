//! Native 0.92 preparation/check sequencing with injected host fixtures.
//! 112920 prepares the worker; 0e7f80 combines latest EXE and pending data patches.
//! This module never fetches part URLs, installs files or starts a process.

use std::{
    path::{Path, PathBuf},
    time::Duration,
};

use serde_json::Value;

use super::{
    data::DataManifest, eligible_executable, newer, Download, LatestManifest, DATA_MANIFEST_URL,
    MANIFEST_URL, USER_AGENT,
};

const DATA_ONLY_NOTES: &str = "New game data for this version: the models and textures it shows.";

/// 112920 host operations. Errors are discarded exactly where the owner discards them.
pub trait PrepareHost {
    type Error;
    fn env(&mut self, name: &str) -> Result<String, Self::Error>;
    fn current_exe(&mut self) -> Result<PathBuf, Self::Error>;
    fn remove_file(&mut self, path: &Path) -> Result<(), Self::Error>;
}

/// 0e7f80 worker operations; the fake implementation records calls in memory.
pub trait CheckHost {
    fn latest(&mut self, url: &str) -> Result<LatestManifest, String>;
    fn data(&mut self, url: &str) -> Result<DataManifest, String>;
    fn metadata_len(&mut self, path: &Path) -> Result<u64, String>;
    fn log(&mut self, message: &str);
}

#[derive(Debug)]
pub struct CheckRequest {
    executable: PathBuf,
    manifest_url: String,
    data_manifest_url: String,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct UpdatePlan {
    pub version: String,
    pub notes: String,
    pub executable: Option<Download>,
    pub patches: Vec<Download>,
}

impl UpdatePlan {
    /// 010a0d–010b52: sum compressed part sizes with release-mode u64 wrapping.
    pub fn wire_size(&self) -> u64 {
        self.executable
            .iter()
            .chain(self.patches.iter())
            .flat_map(|download| &download.parts)
            .fold(0_u64, |total, part| total.wrapping_add(part.size))
    }

    /// 00ec39: optional EXE selects the heading and whether the versions row exists.
    pub fn heading_key(&self) -> &'static str {
        if self.executable.is_some() {
            "A new version is out!"
        } else {
            "New game data"
        }
    }
}

impl CheckRequest {
    pub fn from_environment() -> Option<Self> {
        Self::prepare_with(&mut Environment)
    }

    /// Native opt-out is read before current_exe; rejected names perform no cleanup/URL reads.
    pub fn prepare_with(host: &mut impl PrepareHost) -> Option<Self> {
        let update_setting = host.env("WOW_ROGUE_UPDATE").ok();
        if update_setting.as_deref() == Some("0") {
            return None;
        }
        let executable = host.current_exe().ok()?;
        if !eligible_executable(&executable, update_setting.as_deref()) {
            return None;
        }
        let _ = host.remove_file(&executable.with_extension("old"));
        let manifest_url = host
            .env("WOW_ROGUE_UPDATE_URL")
            .unwrap_or_else(|_| MANIFEST_URL.to_owned());
        let data_manifest_url = host
            .env("WOW_ROGUE_DATA_URL")
            .unwrap_or_else(|_| DATA_MANIFEST_URL.to_owned());
        Some(Self {
            executable,
            manifest_url,
            data_manifest_url,
        })
    }

    /// Metadata and local lengths only. A failed endpoint is logged, then the other path proceeds.
    pub fn check(self) -> Option<UpdatePlan> {
        self.check_with(&mut Environment)
    }

    pub fn check_with(self, host: &mut impl CheckHost) -> Option<UpdatePlan> {
        let current_version = env!("CARGO_PKG_VERSION");
        let latest = match host.latest(&self.manifest_url) {
            Ok(latest) if newer(&latest.version, current_version) => {
                host.log(&format!(
                    "update: v{} is out (this is v{current_version})",
                    latest.version
                ));
                Some(latest)
            }
            Ok(latest) => {
                host.log(&format!(
                    "update: up to date (site has v{})",
                    latest.version
                ));
                None
            }
            Err(error) => {
                host.log(&format!(
                    "update: could not check {}: {error}",
                    self.manifest_url
                ));
                None
            }
        };
        let patches = match host.data(&self.data_manifest_url) {
            Ok(manifest) => {
                let directory = self
                    .executable
                    .parent()
                    .unwrap_or(Path::new("."))
                    .join("Data");
                manifest.into_pending(&directory, |path| host.metadata_len(path))
            }
            Err(error) => {
                host.log(&format!(
                    "update: could not check {}: {error}",
                    self.data_manifest_url
                ));
                Vec::new()
            }
        };
        for patch in &patches {
            host.log(&format!("update: {} is missing", patch.name));
        }
        match latest {
            Some(latest) => Some(UpdatePlan {
                version: latest.version,
                notes: latest.notes,
                executable: Some(latest.download),
                patches,
            }),
            None if !patches.is_empty() => Some(UpdatePlan {
                version: current_version.to_owned(),
                notes: DATA_ONLY_NOTES.to_owned(),
                executable: None,
                patches,
            }),
            None => None,
        }
    }
}

struct Environment;

impl Environment {
    fn json(url: &str) -> Result<Value, String> {
        // 1185f0 and118e40 each construct an independent agent with this configuration.
        let agent = ureq::AgentBuilder::new()
            .timeout_connect(Duration::from_secs(10))
            .timeout_read(Duration::from_secs(30))
            .user_agent(USER_AGENT)
            .build();
        let reader = agent
            .get(url)
            .call()
            .map_err(|error| error.to_string())?
            .into_reader();
        serde_json::from_reader(reader).map_err(|error| error.to_string())
    }
}

impl PrepareHost for Environment {
    type Error = ();
    fn env(&mut self, name: &str) -> Result<String, ()> {
        std::env::var(name).map_err(|_| ())
    }
    fn current_exe(&mut self) -> Result<PathBuf, ()> {
        std::env::current_exe().map_err(|_| ())
    }
    fn remove_file(&mut self, path: &Path) -> Result<(), ()> {
        std::fs::remove_file(path).map_err(|_| ())
    }
}

impl CheckHost for Environment {
    fn latest(&mut self, url: &str) -> Result<LatestManifest, String> {
        LatestManifest::from_json(&Self::json(url)?, url).map_err(str::to_owned)
    }
    fn data(&mut self, url: &str) -> Result<DataManifest, String> {
        DataManifest::from_json(&Self::json(url)?, url)
    }
    fn metadata_len(&mut self, path: &Path) -> Result<u64, String> {
        std::fs::metadata(path)
            .map(|metadata| metadata.len())
            .map_err(|error| error.to_string())
    }
    fn log(&mut self, message: &str) {
        println!("{message}");
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::HashMap;

    struct Fixture {
        calls: Vec<String>,
        env: HashMap<String, String>,
        executable: Result<PathBuf, ()>,
        latest: Result<LatestManifest, String>,
        data: Result<DataManifest, String>,
        lengths: HashMap<PathBuf, u64>,
    }

    fn download(name: &str, size: u64, wire: u64) -> Value {
        serde_json::json!({"name":name,"size":size,"sha256":"a".repeat(64),"parts":[{"url":"part.gz","size":wire}]})
    }

    fn latest(version: &str) -> LatestManifest {
        let mut value = download("game.exe", 900, 13);
        value["version"] = version.into();
        value["notes"] = "native notes".into();
        LatestManifest::from_json(&value, MANIFEST_URL).unwrap()
    }

    impl Fixture {
        fn new() -> Self {
            Self {
                calls: Vec::new(),
                env: HashMap::new(),
                executable: Ok(PathBuf::from("fixture/AzerothSurvivors.exe")),
                latest: Ok(latest("999.0.0")),
                data: Ok(DataManifest::from_json(
                    &serde_json::json!({"patches":[]}),
                    DATA_MANIFEST_URL,
                )
                .unwrap()),
                lengths: HashMap::new(),
            }
        }
        fn request(&mut self) -> CheckRequest {
            CheckRequest::prepare_with(self).unwrap()
        }
    }

    impl PrepareHost for Fixture {
        type Error = ();
        fn env(&mut self, name: &str) -> Result<String, ()> {
            self.calls.push(format!("env:{name}"));
            self.env.get(name).cloned().ok_or(())
        }
        fn current_exe(&mut self) -> Result<PathBuf, ()> {
            self.calls.push("current_exe".into());
            self.executable.clone()
        }
        fn remove_file(&mut self, path: &Path) -> Result<(), ()> {
            self.calls.push(format!("remove:{}", path.display()));
            Err(())
        }
    }

    impl CheckHost for Fixture {
        fn latest(&mut self, url: &str) -> Result<LatestManifest, String> {
            self.calls.push(format!("latest:{url}"));
            self.latest.clone()
        }
        fn data(&mut self, url: &str) -> Result<DataManifest, String> {
            self.calls.push(format!("data:{url}"));
            self.data.clone()
        }
        fn metadata_len(&mut self, path: &Path) -> Result<u64, String> {
            self.calls.push(format!("metadata:{}", path.display()));
            self.lengths
                .get(path)
                .copied()
                .ok_or_else(|| "missing".to_owned())
        }
        fn log(&mut self, message: &str) {
            self.calls.push(format!("log:{message}"));
        }
    }

    #[test]
    fn opt_out_precedes_executable_and_rejected_names_skip_every_later_operation() {
        let mut fixture = Fixture::new();
        fixture.env.insert("WOW_ROGUE_UPDATE".into(), "0".into());
        assert!(CheckRequest::prepare_with(&mut fixture).is_none());
        assert_eq!(fixture.calls, ["env:WOW_ROGUE_UPDATE"]);
        fixture.env.clear();
        fixture.calls.clear();
        fixture.executable = Ok(PathBuf::from("fixture/AzerothSurvivorsRE"));
        assert!(CheckRequest::prepare_with(&mut fixture).is_none());
        assert_eq!(fixture.calls, ["env:WOW_ROGUE_UPDATE", "current_exe"]);
        fixture.calls.clear();
        fixture.executable = Err(());
        assert!(CheckRequest::prepare_with(&mut fixture).is_none());
        assert_eq!(fixture.calls, ["env:WOW_ROGUE_UPDATE", "current_exe"]);
    }

    #[test]
    fn preparation_ignores_cleanup_failure_then_reads_both_urls_without_empty_fallback() {
        let mut fixture = Fixture::new();
        let request = fixture.request();
        assert_eq!(
            fixture.calls,
            [
                "env:WOW_ROGUE_UPDATE",
                "current_exe",
                "remove:fixture/AzerothSurvivors.old",
                "env:WOW_ROGUE_UPDATE_URL",
                "env:WOW_ROGUE_DATA_URL"
            ]
        );
        assert_eq!(request.manifest_url, MANIFEST_URL);
        assert_eq!(request.data_manifest_url, DATA_MANIFEST_URL);
        fixture.env.insert("WOW_ROGUE_UPDATE_URL".into(), "".into());
        fixture
            .env
            .insert("WOW_ROGUE_DATA_URL".into(), " custom/patches.json ".into());
        let request = fixture.request();
        assert_eq!(request.manifest_url, "");
        assert_eq!(request.data_manifest_url, " custom/patches.json ");
    }

    #[test]
    fn latest_failure_still_checks_data_and_builds_native_data_only_plan() {
        let mut fixture = Fixture::new();
        fixture.latest = Err("latest failure".into());
        fixture.data = Ok(DataManifest::from_json(
            &serde_json::json!({"patches":[download("patch-A.mpq",100,7)]}),
            DATA_MANIFEST_URL,
        )
        .unwrap());
        let request = fixture.request();
        fixture.calls.clear();
        let plan = request.check_with(&mut fixture).unwrap();
        assert_eq!(
            fixture.calls,
            [
                format!("latest:{MANIFEST_URL}"),
                format!("log:update: could not check {MANIFEST_URL}: latest failure"),
                format!("data:{DATA_MANIFEST_URL}"),
                "metadata:fixture/Data/patch-A.mpq".into(),
                "log:update: patch-A.mpq is missing".into()
            ]
        );
        assert_eq!(plan.version, env!("CARGO_PKG_VERSION"));
        assert_eq!(plan.notes, DATA_ONLY_NOTES);
        assert!(plan.executable.is_none());
        assert_eq!(plan.heading_key(), "New game data");
        assert_eq!(plan.wire_size(), 7);
    }

    #[test]
    fn data_failure_keeps_new_executable_without_install_failure_state() {
        let mut fixture = Fixture::new();
        fixture.data = Err("data failure".into());
        let request = fixture.request();
        fixture.calls.clear();
        let plan = request.check_with(&mut fixture).unwrap();
        assert_eq!(plan.version, "999.0.0");
        assert!(plan.executable.is_some());
        assert!(plan.patches.is_empty());
        assert_eq!(plan.heading_key(), "A new version is out!");
        assert_eq!(plan.wire_size(), 13);
        assert_eq!(
            fixture.calls,
            [
                format!("latest:{MANIFEST_URL}"),
                format!("log:update: v999.0.0 is out (this is v{})", env!("CARGO_PKG_VERSION")),
                format!("data:{DATA_MANIFEST_URL}"),
                format!("log:update: could not check {DATA_MANIFEST_URL}: data failure")
            ]
        );
    }

    #[test]
    fn combined_plan_filters_lengths_keeps_duplicates_and_sums_parts_with_wrapping() {
        let mut fixture = Fixture::new();
        fixture.data = Ok(DataManifest::from_json(&serde_json::json!({"patches":[download("patch-A.mpq",100,99),download("patch-b.mpq",200,u64::MAX),download("patch-b.mpq",200,2)]}),DATA_MANIFEST_URL).unwrap());
        fixture
            .lengths
            .insert(PathBuf::from("fixture/Data/patch-A.mpq"), 100);
        let request = fixture.request();
        fixture.calls.clear();
        let plan = request.check_with(&mut fixture).unwrap();
        assert_eq!(
            plan.patches
                .iter()
                .map(|patch| patch.name.as_str())
                .collect::<Vec<_>>(),
            ["patch-b.mpq", "patch-b.mpq"]
        );
        assert_eq!(plan.wire_size(), 14);
        assert_eq!(plan.notes, "native notes");
        assert_eq!(
            &fixture.calls[3..],
            [
                "metadata:fixture/Data/patch-A.mpq",
                "metadata:fixture/Data/patch-b.mpq",
                "metadata:fixture/Data/patch-b.mpq",
                "log:update: patch-b.mpq is missing",
                "log:update: patch-b.mpq is missing"
            ]
        );
    }

    #[test]
    fn non_newer_or_failed_latest_and_no_pending_data_publish_nothing() {
        let mut fixture = Fixture::new();
        fixture.latest = Ok(latest("0.92.0"));
        let request = fixture.request();
        fixture.calls.clear();
        assert!(request.check_with(&mut fixture).is_none());
        assert_eq!(
            fixture.calls,
            [
                format!("latest:{MANIFEST_URL}"),
                "log:update: up to date (site has v0.92.0)".into(),
                format!("data:{DATA_MANIFEST_URL}")
            ]
        );
        fixture.latest = Err("latest failure".into());
        fixture.data = Err("data failure".into());
        let request = fixture.request();
        assert!(request.check_with(&mut fixture).is_none());
    }
}
