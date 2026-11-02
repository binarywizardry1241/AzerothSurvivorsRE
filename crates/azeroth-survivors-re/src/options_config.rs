//! Native 0.92 CVar override composition and local-state file replacement.
//! Evidence: options-config-native.json; this module does not own VM globals.

use std::{collections::BTreeMap, io::Write, path::Path, time::Duration};

use serde::{Deserialize, Serialize};

/// The same local-state route used by Options and pre-App consumers such as
/// the mixer. Capture mode has no local config home in the native client.
/// Current Options file calls share the engine owner; see options-vm-0.112.0.md.
pub fn home() -> Option<std::path::PathBuf> {
    benilla_app::config_dir()
}

/// Engine mixer boot read: a case-insensitive raw lookup before the registry
/// exists. It silently falls back when the typed config cannot be loaded.
pub fn boot_cvar(name: &str) -> Option<String> {
    Config::read(&home()?.join("config.toml"))
        .0
        .cvars
        .into_iter()
        .find(|(key, _)| key.eq_ignore_ascii_case(name))
        .map(|(_, value)| value)
}

pub const SAVE_QUIET: Duration = Duration::from_secs(1);
pub const HEADER: &str = "\
# benilla local config — CVar values that moved off their defaults.
# Managed by the client; hand edits are read on next launch and preserved on save.
";

#[derive(Default, Serialize, Deserialize)]
#[serde(rename = "LocalConfig")]
pub struct Config {
    #[serde(default)]
    pub cvars: BTreeMap<String, String>,
}

impl Config {
    /// 140eaf640 accepts the typed LocalConfig as a whole. A bad document loads
    /// no overrides and does not establish a persistent write hold.
    pub fn read(path: &Path) -> (Self, Option<String>) {
        match std::fs::read_to_string(path) {
            Ok(text) => match Self::parse(&text) {
                Ok(config) => (config, None),
                Err(error) => (
                    Self::default(),
                    Some(format!(
                        "config: {} is malformed ({error}) — running on defaults",
                        path.display()
                    )),
                ),
            },
            Err(error) if error.kind() == std::io::ErrorKind::NotFound => (Self::default(), None),
            Err(error) => (
                Self::default(),
                Some(format!("config: cannot read {}: {error}", path.display())),
            ),
        }
    }

    pub fn parse(text: &str) -> Result<Self, toml::de::Error> {
        toml::from_str(text)
    }

    /// Keep unknown entries and the spelling of existing registered entries.
    /// A registered row restored to its exact default is removed from the file.
    pub fn compose(&self, rows: impl IntoIterator<Item = (String, String, String)>) -> Self {
        let mut cvars = self.cvars.clone();
        for (name, value, default) in rows {
            let existing = cvars
                .keys()
                .find(|key| key.eq_ignore_ascii_case(&name))
                .cloned();
            if value == default {
                if let Some(existing) = existing {
                    cvars.remove(&existing);
                }
            } else {
                cvars.insert(existing.unwrap_or(name), value);
            }
        }
        Self { cvars }
    }

    pub fn text(&self) -> Result<String, String> {
        toml::to_string(self)
            .map(|body| format!("{HEADER}{body}"))
            .map_err(|error| error.to_string())
    }
}

/// Native startup uses trimmed Rust f32 parsing for both the default and the
/// loaded value. Infinity/NaN are accepted; the original adds no finite check.
pub fn valid_loaded_value(default: &str, value: &str) -> bool {
    default.trim().parse::<f32>().is_err() || value.trim().parse::<f32>().is_ok()
}

/// Native local_state::write_atomic_bytes: create parents, replace the extension
/// with `tmp`, write/sync, then rename. Errors leave the temporary file in place.
pub fn write_atomic(path: &Path, bytes: &[u8]) -> Result<(), String> {
    let write = || -> std::io::Result<()> {
        if let Some(parent) = path.parent() {
            std::fs::create_dir_all(parent)?;
        }
        let temporary = path.with_extension("tmp");
        {
            let mut file = std::fs::File::create(&temporary)?;
            file.write_all(bytes)?;
            file.sync_all()?;
        }
        std::fs::rename(temporary, path)
    };
    write().map_err(|error| format!("{}: {error}", path.display()))
}
