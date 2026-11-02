//! Desktop AddOns inventory and account enable overrides.
//! Selected 0.105.0: inventory 1411cb7a0; account path/read/write
//! 1411cf3a0/1411cf500/1411cf760. Real interface loads consume this same file.
use benilla_ui::toc::Toc;
use std::{
    path::{Path, PathBuf},
};

pub struct Addon {
    pub name: String,
    pub title: String,
    pub notes: String,
    pub dependencies: Vec<String>,
    pub outdated: bool,
    pub on_demand: bool,
    pub enabled: bool,
}

#[derive(Default)]
pub struct Addons {
    pub root: Option<PathBuf>,
    pub rows: Vec<Addon>,
    state_path: Option<PathBuf>,
    overrides: Vec<(String, bool)>,
}

impl Addons {
    pub fn load(home: Option<&Path>) -> Self {
        Self::load_for_locale(home, benilla_app::local_client::client_locale_index())
    }

    fn load_for_locale(home: Option<&Path>, locale: usize) -> Self {
        let mut state = Self {
            root: home.map(|path| path.join("AddOns")),
            state_path: home.map(|path| path.join("addons/account.txt")),
            ..Self::default()
        };
        let Some(root) = &state.root else {
            return state;
        };
        if let Some(text) = state.state_path.as_ref().and_then(|path| std::fs::read(path).ok()) {
            for line in benilla_ui::source::decode(&text).lines() {
                if let Some((name, value)) = line.split_once(':') {
                    let name = name.trim();
                    if !name.is_empty() {
                        state
                            .overrides
                            .push((name.into(), !value.trim().eq_ignore_ascii_case("disabled")));
                    }
                }
            }
        }
        if let Ok(entries) = std::fs::read_dir(root) {
            for entry in entries.flatten().filter(|entry| entry.path().is_dir()) {
                let name = entry.file_name().to_string_lossy().into_owned();
                let directory = entry.path();
                if benilla_assets::moved_aside(&directory, &name) {
                    continue;
                }
                let manifest = std::fs::read_dir(&directory).ok().and_then(|entries| {
                    entries.flatten().find(|file| {
                        file.file_name()
                            .to_str()
                            .is_some_and(|file| file.eq_ignore_ascii_case(&format!("{name}.toc")))
                    })
                });
                let Some(bytes) = manifest.and_then(|file| std::fs::read(file.path()).ok()) else {
                    continue;
                };
                let toc = Toc::parse(&benilla_ui::source::decode(&bytes));
                let enabled = state
                    .overrides
                    .iter()
                    .find(|(key, _)| key.eq_ignore_ascii_case(&name))
                    .map(|(_, enabled)| *enabled)
                    .unwrap_or_else(|| toc.default_state());
                state.rows.push(Addon {
                    title: toc
                        .metadata_value(&name, "Title", locale)
                        .unwrap_or_else(|| name.clone()),
                    notes: toc.metadata_value(&name, "Notes", locale).unwrap_or_default(),
                    dependencies: toc.dependencies().into_iter().map(str::to_owned).collect(),
                    outdated: toc.interface_version() != 11200,
                    on_demand: toc.load_on_demand(),
                    enabled,
                    name,
                });
            }
        }
        state
            .rows
            .sort_by_key(|addon| addon.title.to_ascii_lowercase());
        state
    }

    pub fn missing<'a>(&self, addon: &'a Addon) -> Vec<&'a str> {
        addon
            .dependencies
            .iter()
            .filter(|dependency| {
                !self
                    .rows
                    .iter()
                    .any(|candidate| candidate.name.eq_ignore_ascii_case(dependency))
            })
            .map(String::as_str)
            .collect()
    }

    pub fn toggle(&mut self, index: usize) -> Result<(), String> {
        let Some(addon) = self.rows.get_mut(index) else {
            return Ok(());
        };
        addon.enabled = !addon.enabled;
        // The native setter re-reads the account rows on every click, changes
        // the first case-insensitive match in place, or appends a new row.
        if let Some(path) = &self.state_path {
            self.overrides = std::fs::read(path).ok().map(|bytes| {
                benilla_ui::source::decode(&bytes).lines().filter_map(|line| {
                    let (name, value) = line.split_once(':')?;
                    let name = name.trim();
                    (!name.is_empty()).then(|| (name.into(), !value.trim().eq_ignore_ascii_case("disabled")))
                }).collect()
            }).unwrap_or_default();
        }
        if let Some((_, enabled)) = self.overrides.iter_mut().find(|(name, _)| name.eq_ignore_ascii_case(&addon.name)) {
            *enabled = addon.enabled;
        } else { self.overrides.push((addon.name.clone(), addon.enabled)); }
        if let Some(path) = &self.state_path {
            let mut text = String::new();
            for (name, enabled) in &self.overrides {
                text.push_str(name);
                text.push_str(if *enabled {
                    ": enabled\n"
                } else {
                    ": disabled\n"
                });
            }
            crate::options_config::write_atomic(path, text.as_bytes())?;
        }
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn inventory_uses_client_locale_for_title_and_notes_before_account_overrides() {
        let unique = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos();
        let home = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join(format!("../../runtime/addon-metadata-tests/{unique}"));
        std::fs::create_dir_all(home.join("AddOns/Example")).unwrap();
        std::fs::create_dir_all(home.join("addons")).unwrap();
        std::fs::write(home.join("AddOns/Example/Example.toc"),
            "## Interface: 11200\n## Title: English title\n## Title-deDE: Deutscher Titel\n## Notes: English notes\n## Notes-deDE: Deutsche Hinweise\n## DefaultState: disabled\n").unwrap();
        std::fs::write(home.join("addons/account.txt"), "example: enabled\n").unwrap();
        let german = Addons::load_for_locale(Some(&home), 3);
        assert_eq!(german.rows.len(), 1);
        assert_eq!(german.rows[0].title, "Deutscher Titel");
        assert_eq!(german.rows[0].notes, "Deutsche Hinweise");
        assert!(german.rows[0].enabled);
        let english = Addons::load_for_locale(Some(&home), 0);
        assert_eq!(english.rows[0].title, "English title");
        assert_eq!(english.rows[0].notes, "English notes");
        std::fs::remove_dir_all(home).unwrap();
    }
}
