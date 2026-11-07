//! Azeroth Survivors custom Options descriptors and input routes.
//! Current custom file/VM integration: options-vm-0.112.0.md; binding capture:
//! in-run-bindings-0.112.0.md. Other contracts retain their owning target provenance.
//! The embedded client owns CVar callbacks and live bindings. VM globals use
//! the recovered flat FrameXML file and active-VM assignment route; defaults
//! and lifecycle contracts retain the provenance in their owning reports.

use std::{
    collections::{BTreeMap, BTreeSet},
    path::{Path, PathBuf},
    time::Instant,
};

use bevy::{
    input::{keyboard::KeyboardInput, mouse::MouseWheel, ButtonState},
    prelude::*,
    ui::{FocusPolicy, RelativeCursorPosition},
    window::{MonitorSelection, PresentMode, PrimaryWindow, WindowMode},
};
use serde::Deserialize;

use crate::{assets::MenuArt, catalog::MenuCatalog, menu_state::MenuState, native_bindings, save_browser};

const GOLD: Color = Color::srgb(0.973, 0.824, 0.416);
const EDGE: Color = Color::srgb(0.427, 0.333, 0.145);
const DARK: Color = Color::srgb(0.035, 0.028, 0.017);
const RED: Color = Color::srgb(0.19, 0.025, 0.018);
const PAPER: Color = Color::srgb(0.949, 0.902, 0.788);

pub struct OptionsPlugin;

#[derive(SystemSet, Debug, Hash, PartialEq, Eq, Clone)]
pub enum OptionsSet {
    Input,
}

impl Plugin for OptionsPlugin {
    fn build(&self, app: &mut App) {
        app.insert_resource(Definitions::embedded())
            .init_resource::<OptionsState>()
            .add_systems(Update, capture_input.in_set(
                benilla_app::local_client::LocalClientSet::OverlayCapture))
            .add_systems(
                Update,
                (
                    input.run_if(crate::update_ui::menu_input_enabled)
                        .after(benilla_app::local_client::LocalClientSet::Input),
                    sync_engine.after(benilla_app::local_client::LocalClientSet::Input),
                    save_bindings,
                    apply_window,
                )
                    .chain()
                    .in_set(OptionsSet::Input)
                    .before(benilla_app::local_client::LocalClientSet::Options),
            )
            // Account binding writes drain through the existing VM/file owner
            // in Update. Read their actual result before preparing this UI.
            .add_systems(PostUpdate,
                (rebuild, scroll.run_if(crate::update_ui::menu_input_enabled))
                    .chain().before(bevy::ui::UiSystems::Prepare))
            .add_systems(Last, (save_when_quiet, save_on_exit).chain());
    }
}

#[derive(Resource, Deserialize)]
struct Definitions {
    pages: Vec<String>,
    rows: Vec<Definition>,
}

impl Definitions {
    fn embedded() -> Self {
        serde_json::from_str(include_str!("../assets/options.json"))
            .expect("recovered options definitions")
    }

    // The menu currently exposes this subset of the native CVar registry.
    fn cvar_defaults(&self) -> BTreeMap<String, String> {
        let mut defaults = BTreeMap::new();
        for row in &self.rows {
            if !matches!(row.storage, 0 | 3) {
                continue;
            }
            let Some(value) = &row.default else { continue };
            defaults.insert(row.key.to_ascii_lowercase(), value.clone());
            if !row.linked.is_empty() {
                if let Ok(value) = value.parse::<f32>() {
                    defaults.insert(
                        row.linked.to_ascii_lowercase(),
                        number_string(value * row.multiplier),
                    );
                }
            }
        }
        defaults
    }
}

#[derive(Deserialize)]
struct Definition {
    key: String,
    label: String,
    page: usize,
    storage: u8,
    control: u8,
    default: Option<String>,
    range: [f32; 3],
    inverted: bool,
    choices: Vec<Choice>,
    indent: bool,
    linked: String,
    multiplier: f32,
}

#[derive(Deserialize)]
struct Choice {
    label: String,
    value: String,
}

impl Definition {
    fn state_key(&self) -> String {
        format!("{}:{}", self.storage, self.key.to_ascii_lowercase())
    }
    fn displayed(&self, value: &str) -> f32 {
        let value = value.parse::<f32>().unwrap_or(self.range[0]);
        if self.storage == 3 {
            1.0 - value
        } else {
            value
        }
    }
    fn formatted(&self, value: &str) -> String {
        let number = self.displayed(value);
        match self.control {
            0 => format!("{:.0}%", number * 100.0),
            1 => format!("{number:.0}"),
            2 => format!("{:.0} yd", number * 15.0),
            3 => format!(
                "{:.0}%",
                (number - self.range[0]) / (self.range[1] - self.range[0]) * 100.0
            ),
            4 => self
                .choices
                .get(
                    (number.round().max(0.0) as usize)
                        .min(self.choices.len().saturating_sub(1)),
                )
                .map(|c| c.label.clone())
                .unwrap_or_else(|| value.into()),
            _ => value.into(),
        }
    }
}

#[derive(Default)]
struct BindingsState {
    rows: Vec<BindingRow>,
    defaults: BTreeMap<String, Vec<String>>,
    keys: BTreeMap<String, Vec<String>>,
    skip_keys: Vec<String>,
    labels: BTreeMap<String, String>,
    capture: Option<(usize, usize)>,
    error: Option<String>,
    pending: bool,
    expanded: BTreeSet<usize>,
    engine_writes: Vec<(String, Vec<String>)>,
    engine_reset: bool,
    engine_connected: bool,
    engine_rows: Vec<(String, String)>,
}

struct BindingRow {
    command: Option<String>,
    label: String,
}

impl BindingsState {
    fn load(home: Option<&Path>) -> Self {
        let mut state = Self::default();
        state.expanded.insert(0);
        let result = (|| -> Result<(), String> {
            let directory = crate::assets::data_directory().ok_or("No MPQ directory")?;
            let mut chain = benilla_formats::open_chain(&directory).map_err(|e| e.to_string())?;
            let xml = chain
                .read_file("Interface\\FrameXML\\Bindings.xml")
                .map_err(|e| e.to_string())?;
            let mut bindings = benilla_ui::bindings_xml::parse(&benilla_ui::source::decode(&xml))
                .map_err(|e| e.to_string())?;
            for binding in crate::native_bindings::commands() {
                if !bindings.iter().any(|existing| existing.name.eq_ignore_ascii_case(&binding.name)) {
                    bindings.push(binding);
                }
            }
            let defaults = chain
                .read_file("WTF\\DefaultBindings.wtf")
                .map_err(|e| e.to_string())?;
            for (key, command) in
                benilla_ui::script::keybind::parse_bindings_wtf(&String::from_utf8_lossy(&defaults))
                    .into_iter().chain(crate::native_bindings::defaults())
            {
                if let Some(key) = benilla_ui::script::keybind::normalize_binding_key(&key) {
                    // Appending `bind Y AZS_OPENLEVELS` has SetBinding's
                    // last-key-wins semantics before saved overrides load.
                    for keys in state.defaults.values_mut() {
                        keys.retain(|existing| existing != &key);
                    }
                    state
                        .defaults
                        .entry(command.to_ascii_uppercase())
                        .or_default()
                        .push(key);
                }
            }
            // Existing engine sandbox; only its instruction-bounded labels are run.
            // Binding bodies are parsed as data and never executed by this menu.
            let script = benilla_ui::script::UiScript::new().map_err(|e| e.to_string())?;
            script.set_instruction_budget(500_000);
            if let Ok(strings) = chain.read_file("Interface\\FrameXML\\GlobalStrings.lua") {
                script
                    .run_chunk_named(&strings, "Interface\\FrameXML\\GlobalStrings.lua")
                    .map_err(|e| e.to_string())?;
            }
            let text = |name: &str, fallback: &str| {
                if let Some(label) = crate::native_bindings::label(name) {
                    return label.to_string();
                }
                let value = script.global_text(name);
                if value.is_empty() {
                    fallback.to_string()
                } else {
                    value
                }
            };
            for binding in bindings {
                // The selected reference is the Windows artifact, without mac-only media commands.
                if binding.hidden || binding.platform.as_deref() == Some("mac") {
                    continue;
                }
                if let Some(header) = binding.header {
                    state.rows.push(BindingRow {
                        command: None,
                        label: text(&format!("BINDING_HEADER_{header}"), &header),
                    });
                }
                let command = binding.name.to_ascii_uppercase();
                state.defaults.entry(command.clone()).or_default();
                state.rows.push(BindingRow {
                    label: text(&format!("BINDING_NAME_{command}"), &command),
                    command: Some(command),
                });
            }
            state.insert_skip_row();
            for token in [
                "SPACE",
                "UP",
                "DOWN",
                "LEFT",
                "RIGHT",
                "ENTER",
                "BACKSPACE",
                "TAB",
                "INSERT",
                "DELETE",
                "HOME",
                "END",
                "PAGEUP",
                "PAGEDOWN",
                "CAPSLOCK",
                "NUMLOCK",
                "PRINTSCREEN",
                "MOUSEWHEELUP",
                "MOUSEWHEELDOWN",
                "ALT",
                "CTRL",
                "SHIFT",
                "NUMPADPLUS",
                "NUMPADMINUS",
                "NUMPADMULTIPLY",
                "NUMPADDIVIDE",
                "NUMPADDECIMAL",
                "NUMPADEQUALS",
            ] {
                state
                    .labels
                    .insert(token.into(), text(&format!("KEY_{token}"), token));
            }
            for prefix in ["F", "NUMPAD", "BUTTON"] {
                for index in 0..=24 {
                    let token = format!("{prefix}{index}");
                    state
                        .labels
                        .insert(token.clone(), text(&format!("KEY_{token}"), &token));
                }
            }
            state.keys = state.account_keys(home);
            Ok(())
        })();
        if let Err(error) = result {
            state.error = Some(error);
        }
        state
    }

    fn insert_skip_row(&mut self) {
        if let Some(index) = self.rows.iter().position(|row| {
            row.command.as_deref() == Some(native_bindings::COMMAND)
        }) {
            self.rows.insert(index + 1, BindingRow {
                command: Some(native_bindings::SKIP_COMMAND.into()),
                label: "Skip".into(),
            });
        }
    }

    fn account_keys(&self, home: Option<&Path>) -> BTreeMap<String, Vec<String>> {
        let mut table = self.defaults.clone();
        let Some(file) = home.and_then(|home| std::fs::read_to_string(home.join("bindings/account.txt")).ok()) else {
            return table;
        };
        for line in file.lines() {
            let mut parts = line.split_whitespace();
            if parts.next() != Some("bind") { continue; }
            let Some(command) = parts.next() else { continue; };
            let command = command.to_ascii_uppercase();
            let keys: Vec<String> = parts.filter_map(benilla_ui::script::keybind::normalize_binding_key).collect();
            for other in table.values_mut() {
                other.retain(|key| !keys.contains(key));
            }
            table.insert(command, keys);
        }
        table
    }

    fn assign(&mut self, row: usize, slot: usize, key: Option<String>) {
        let Some(command) = self.rows.get(row).and_then(|row| row.command.clone()) else {
            return;
        };
        if let Some(old) = self.keys.get_mut(&command) {
            if slot < old.len() {
                old.remove(slot);
            }
        }
        if let Some(key) = key {
            for keys in self.keys.values_mut() {
                keys.retain(|existing| existing != &key);
            }
            let keys = self.keys.entry(command).or_default();
            keys.insert(slot.min(keys.len()), key);
        }
        self.capture = None;
        self.pending = true;
        let command = self.rows[row].command.as_ref().expect("binding command").clone();
        self.engine_writes.push((command.clone(), self.keys.get(&command).cloned().unwrap_or_default()));
    }

    fn key_label(&self, key: &str) -> String {
        let mut remaining = key;
        let mut out = String::new();
        for modifier in ["ALT", "CTRL", "SHIFT"] {
            if let Some(rest) = remaining.strip_prefix(&format!("{modifier}-")) {
                out.push_str(
                    self.labels
                        .get(modifier)
                        .map(String::as_str)
                        .unwrap_or(modifier),
                );
                out.push('-');
                remaining = rest;
            }
        }
        out.push_str(
            self.labels
                .get(remaining)
                .map(String::as_str)
                .unwrap_or(remaining),
        );
        out
    }

    fn write(&mut self, home: &Path) -> Result<(), String> {
        if !self.pending {
            return Ok(());
        }
        // Native Save requests are drained once; a failed write logs and does
        // not enqueue itself again or undo the accepted live binding.
        self.pending = false;
        if let Some(error) = &self.error {
            return Err(error.clone());
        }
        let mut text = String::from("# benilla key bindings — diff vs defaults\n");
        for (command, keys) in &self.keys {
            if self
                .defaults
                .get(command)
                .map(Vec::as_slice)
                .unwrap_or_default()
                == keys.as_slice()
            {
                continue;
            }
            text.push_str("bind ");
            text.push_str(command);
            for key in keys {
                text.push(' ');
                text.push_str(key);
            }
            text.push('\n');
        }
        atomic_write(&home.join("bindings/account.txt"), text.as_bytes())
    }
}

#[derive(Resource)]
pub struct OptionsState {
    pub open: bool,
    page: usize,
    values: BTreeMap<String, String>,
    config: crate::options_config::Config,
    state_home: Option<PathBuf>,
    dirty: bool,
    definitions_pending: bool,
    last_open: bool,
    scale: f32,
    scroll: f32,
    hovered: Option<usize>,
    drag: Option<usize>,
    cvars_pending: Option<Instant>,
    apply_pending: bool,
    engine_connected: bool,
    engine_writes: Vec<(String, String)>,
    engine_defaults: BTreeMap<String, String>,
    global_writes: Vec<(String, String)>,
    error: Option<String>,
    bindings: BindingsState,
    suppress_wheel: bool,
    save_files: Vec<PathBuf>,
    save_confirmation: Option<save_browser::PendingImport>,
    save_notice: Option<String>,
    addons: crate::addons::Addons,
    addon_hovered: Option<usize>,
}

impl Default for OptionsState {
    fn default() -> Self {
        let defs = Definitions::embedded();
        let mut values = BTreeMap::new();
        for row in &defs.rows {
            if let Some(value) = &row.default {
                values.insert(row.state_key(), value.clone());
            }
        }
        let state_home = crate::options_config::home();
        let mut config = crate::options_config::Config::default();
        let error = None;
        if let Some(home) = &state_home {
            let path = home.join("config.toml");
            let (document, warning) = crate::options_config::Config::read(&path);
            if let Some(warning) = warning {
                warn!("{warning}");
            }
            let defaults = defs.cvar_defaults();
            for (key, value) in &document.cvars {
                let name = key.to_ascii_lowercase();
                if let Some(default) = defaults.get(&name) {
                    if crate::options_config::valid_loaded_value(default, value) {
                        values.insert(format!("0:{name}"), value.clone());
                    } else {
                        warn!("config: {key}: unparseable value '{value}' ignored");
                    }
                }
            }
            config = document;
            values.extend(crate::options_globals::read(home, defs.rows.iter()
                .filter(|row| matches!(row.storage, 1 | 2)).map(|row| (row.key.as_str(), row.storage))));
            // Brightness is a view over the engine's gamma CVar.
            if let Some(value) = values.get("0:gamma").cloned() {
                values.insert("3:gamma".into(), value);
            }
        }
        let mut bindings = BindingsState::load(state_home.as_deref());
        let skip_value = config.cvars.iter()
            .find(|(name, _)| name.eq_ignore_ascii_case(native_bindings::SKIP_CVAR))
            .map_or(native_bindings::DEFAULT_SKIP_KEY, |(_, value)| value.as_str());
        bindings.skip_keys = native_bindings::skip_keys(skip_value);
        let addons = crate::addons::Addons::load(state_home.as_deref());
        Self {
            open: false,
            page: 0,
            values,
            config,
            state_home,
            dirty: true,
            definitions_pending: true,
            last_open: false,
            scale: 1.0,
            scroll: 0.0,
            hovered: None,
            drag: None,
            cvars_pending: None,
            apply_pending: true,
            engine_connected: false,
            engine_writes: Vec::new(),
            engine_defaults: BTreeMap::new(),
            global_writes: Vec::new(),
            error,
            bindings,
            addons,
            addon_hovered: None,
            suppress_wheel: false,
            save_files: Vec::new(),
            save_confirmation: None,
            save_notice: None,
        }
    }
}

impl OptionsState {
    /// The current native Escape/Done path drops transient page content, including
    /// an outstanding Saves confirmation and notice, without undoing settings.
    fn close(&mut self) {
        self.open = false;
        self.bindings.capture = None;
        self.drag = None;
        self.hovered = None;
        self.addon_hovered = None;
        self.save_confirmation = None;
        self.save_notice = None;
    }

    fn saves_directory(&self) -> Option<PathBuf> {
        crate::save::native_base_directory().map(|base| base.join("Saves"))
    }
    fn refresh_saves(&mut self) {
        self.save_files = self.saves_directory()
            .map(|directory| save_browser::files(&directory)).unwrap_or_default();
    }
    /// Mirror a native/addon CVar change through the same validation and save debounce as a menu edit.
    pub fn set_engine_cvar(&mut self, name: &str, value: &str) -> bool {
        let definitions = Definitions::embedded();
        let Some(row) = definitions.rows.iter().find(|row| row.storage == 0 && row.key.eq_ignore_ascii_case(name)) else {
            return false;
        };
        if row.default.as_deref().is_some_and(|default| !crate::options_config::valid_loaded_value(default, value)) {
            return false;
        }
        self.set(row, value.to_owned());
        true
    }

    /// HUD CVars are saved by the real engine registry. Keep the Options view
    /// and its merge base current without scheduling a second file writer.
    pub(crate) fn observe_hud_cvar(&mut self, name: &str, value: &str, default: &str) {
        if !crate::gameplay::run_hud::owns_cvar(name) { return; }
        if self.values.get(&format!("0:{}", name.to_ascii_lowercase())).map(String::as_str) != Some(value) {
            self.values.insert(format!("0:{}", name.to_ascii_lowercase()), value.into());
            self.dirty = true;
        }
        self.config = self.config.compose([(name.to_owned(), value.to_owned(), default.to_owned())]);
    }

    pub fn cvar(&self, name: &str) -> Option<&str> {
        self.values
            .get(&format!("0:{}", name.to_ascii_lowercase()))
            .map(String::as_str)
    }
    /// 0.127.0 cards setting: absent values are enabled; only the trimmed
    /// literal "0" disables the rays. This uses the ordinary saved CVar lane.
    pub(crate) fn card_rays_enabled(&self) -> bool {
        self.cvar("cardRays").is_none_or(|value| value.trim() != "0")
    }
    /// Menu-backed CVars plus native registered engine values that have no
    /// visible row (the output limiter). Consumers retain their own defaults
    /// and numeric validation, as the native change callback does.
    pub fn engine_cvar(&self, name: &str) -> Option<&str> {
        self.cvar(name).or_else(|| {
            // This registered audio key has no Options row. Apply the native
            // startup numeric check before exposing its retained raw override.
            if !name.eq_ignore_ascii_case("SoundOutputLimiter") {
                return None;
            }
            self.config
                .cvars
                .iter()
                .find(|(key, _)| key.eq_ignore_ascii_case(name))
                .map(|(_, value)| value.as_str())
                .filter(|value| crate::options_config::valid_loaded_value("1", value))
        })
    }
    fn value<'a>(&'a self, row: &'a Definition) -> Option<&'a str> {
        self.values
            .get(&row.state_key())
            .map(String::as_str)
            .or(row.default.as_deref())
    }
    fn default_value<'a>(&'a self, row: &'a Definition) -> Option<&'a str> {
        if matches!(row.storage, 0 | 3) {
            self.engine_defaults.get(&row.key.to_ascii_lowercase())
                .map(String::as_str).or(row.default.as_deref())
        } else { row.default.as_deref() }
    }

    pub(crate) fn skip_keys(&self) -> &[String] {
        &self.bindings.skip_keys
    }

    pub(crate) fn skip_key_label(&self) -> Option<String> {
        self.skip_keys().first().map(|key| self.bindings.key_label(key))
    }

    fn assign_binding(&mut self, row: usize, slot: usize, key: Option<String>) {
        if self.bindings.rows.get(row).and_then(|row| row.command.as_deref())
            != Some(native_bindings::SKIP_COMMAND)
        {
            self.bindings.assign(row, slot, key);
            return;
        }
        let mut keys = self.bindings.skip_keys.clone();
        if slot < keys.len() {
            keys.remove(slot);
        }
        if let Some(key) = key {
            keys.retain(|existing| existing != &key);
            keys.insert(slot.min(keys.len()), key);
        }
        self.bindings.capture = None;
        self.set_skip_keys(keys);
    }

    fn set_skip_keys(&mut self, keys: Vec<String>) {
        if keys != self.bindings.skip_keys {
            let value = keys.join(" ");
            self.bindings.skip_keys = keys;
            self.engine_writes.push((native_bindings::SKIP_CVAR.into(), value));
            if !self.engine_connected {
                self.cvars_pending = Some(Instant::now());
            }
            self.dirty = true;
        }
    }
    fn set(&mut self, row: &Definition, value: String) {
        let linked = (!row.linked.is_empty()).then(|| value.parse::<f32>().ok())
            .flatten().map(|number| number_string(number * row.multiplier));
        if self.value(row) == Some(value.as_str()) && linked.as_ref().is_none_or(|linked| {
            self.values.get(&format!("0:{}", row.linked.to_ascii_lowercase())) == Some(linked)
        }) {
            return;
        }
        self.values.insert(row.state_key(), value.clone());
        self.definitions_pending = true;
        if matches!(row.storage, 0 | 3) {
            // Native 14001d989 writes the CVar by its descriptor key. Gamma's
            // slider has already converted its display value to stored gamma.
            self.engine_writes.push((row.key.clone(), value.clone()));
        }
        if row.storage == 3 {
            self.values.insert("0:gamma".into(), value.clone());
        }
        if let Some(linked) = linked {
            self.values.insert(format!("0:{}", row.linked.to_ascii_lowercase()), linked.clone());
            self.engine_writes.push((row.linked.clone(), linked));
        }
        self.dirty = true;
        let now = Instant::now();
        if (matches!(row.storage, 0 | 3) || !row.linked.is_empty())
            && !self.engine_connected && !crate::gameplay::run_hud::owns_cvar(&row.key) {
            self.cvars_pending = Some(now);
        }
        if !matches!(row.storage, 0 | 3) {
            let literal = crate::options_globals::literal(row.storage, &value);
            if let Some(home) = &self.state_home {
                if let Err(error) = crate::options_globals::write(home, &row.key, &literal) {
                    warn!("saved variables: cannot write {error}");
                }
            }
            self.global_writes.push((row.key.clone(), literal));
        }
        self.apply_pending = true;
    }
    fn persist(&mut self) {
        let Some(home) = self.state_home.clone() else {
            self.cvars_pending = None;
            self.bindings.pending = false;
            return;
        };
        if let Err(error) = self.bindings.write(&home) {
            warn!("bindings: cannot save: {error}");
        }
        log_cvar_write(self.persist_cvars(&home));
    }
    fn persist_cvars(&mut self, home: &Path) -> Result<(), String> {
        if self.cvars_pending.take().is_none() {
            return Ok(());
        }
        let definitions = Definitions::embedded();
        let mut rows = Vec::new();
        if let Some((name, value)) = self.engine_writes.iter().rev()
            .find(|(name, _)| name == native_bindings::SKIP_CVAR)
        {
            rows.push((name.clone(), value.clone(), native_bindings::DEFAULT_SKIP_KEY.into()));
        }
        for row in &definitions.rows {
            if !matches!(row.storage, 0 | 3) {
                continue;
            }
            let Some(default) = &row.default else {
                continue;
            };
            let value = self.value(row).unwrap_or(default);
            rows.push((row.key.clone(), value.to_string(), default.clone()));
            if !row.linked.is_empty() {
                if let Ok(default) = default.parse::<f32>() {
                    let default = number_string(default * row.multiplier);
                    let value = self
                        .values
                        .get(&format!("0:{}", row.linked.to_ascii_lowercase()))
                        .cloned()
                        .unwrap_or_else(|| default.clone());
                    rows.push((row.linked.clone(), value, default));
                }
            }
        }
        let document = self.config.compose(rows);
        let text = document.text()?;
        atomic_write(&home.join("config.toml"), text.as_bytes())?;
        self.config = document;
        Ok(())
    }
}

/// Deliver the custom Options page through the same registry as SetCVar. The
/// extension drains writes before the next VM feed, fires the engine callbacks,
/// and owns the one-second config debounce even while the picker is active.
fn sync_engine(
    mut state: ResMut<OptionsState>,
    defs: Res<Definitions>,
    extension: Option<ResMut<benilla_app::local_client::LocalClientExtension>>,
    input: Option<Res<benilla_app::local_client::LocalClientInput>>,
) {
    let Some(mut extension) = extension else { return };
    let defaults = defs.cvar_defaults();
    for (name, default) in &defaults {
        if !extension.cvar_defaults.iter().any(|(key, _)| key.eq_ignore_ascii_case(name)) {
            // Existing engine rows keep their registered defaults; addon rows
            // learn the selected target's recovered dynamic registration values.
            extension.cvar_defaults.push((name.clone(), default.clone()));
        }
    }
    state.engine_connected = true;
    // Current140008df0 reads the ordinary CVar every update and accepts only
    // trimmed "1". The engine reconciles the same flag /combatlog controls.
    extension.combat_logging = Some(state.cvar("combatLogFile").is_some_and(|value| value.trim() == "1"));
    extension.cvar_writes.append(&mut state.engine_writes);
    for row in defs.rows.iter().filter(|row| matches!(row.storage, 1 | 2)) {
        if !extension.option_globals.iter().any(|(name, _)| name == &row.key) {
            extension.option_globals.push((row.key.clone(), row.storage == 2));
        }
    }
    extension.option_global_writes.append(&mut state.global_writes);
    state.cvars_pending = None;
    let Some(input) = input else { return };
    // Current14012bc10 reads storage1/2 from saved-variables.lua. Live VM
    // assignment remains a write consumer; its snapshot cannot replace the
    // independently read literal value shown by these Options rows.
    if let Some(snapshot) = &input.bindings {
        state.bindings.engine_connected = true;
        if state.bindings.engine_rows != snapshot.rows {
            state.bindings.engine_rows.clone_from(&snapshot.rows);
            state.bindings.rows = snapshot.rows.iter().map(|(name, label)| BindingRow {
                command: (!name.starts_with("HEADER_")).then(|| name.clone()),
                // Current 0x1401a8020 replaces the exact AZS header before
                // custom Options presentation, independently of its VM label.
                label: if name == "HEADER_AZS" {
                    crate::native_bindings::label("BINDING_HEADER_AZS")
                        .expect("registered AZS binding header").into()
                } else if label.is_empty() {
                    name.strip_prefix("HEADER_").unwrap_or(name).into()
                } else { label.clone() },
            }).collect();
            state.bindings.insert_skip_row();
            state.bindings.capture = None;
            state.dirty = true;
        }
        let mut defaults: BTreeMap<String, Vec<String>> = BTreeMap::new();
        for (key, command) in &snapshot.defaults { defaults.entry(command.clone()).or_default().push(key.clone()); }
        for (name, _) in &snapshot.keys { defaults.entry(name.clone()).or_default(); }
        state.bindings.defaults = defaults;
        if state.bindings.pending {
            let reset = std::mem::take(&mut state.bindings.engine_reset);
            // Native commits the complete file-derived account model, not a
            // partial command edit over a potentially stale VM account set.
            if reset || !state.bindings.engine_writes.is_empty() {
                extension.account_bindings = Some(state.bindings.keys.iter()
                    .map(|(command, keys)| (command.clone(), keys.clone())).collect());
                state.bindings.engine_writes.clear();
            }
        }
    } else {
        state.bindings.engine_connected = false;
        // Menu-only edits already use the standalone account writer. Do not
        // replay an old account edit into a later character-specific VM.
        state.bindings.engine_writes.clear();
        state.bindings.engine_reset = false;
    }
    for (name, value) in &input.cvar_defaults {
        state.engine_defaults.insert(name.to_ascii_lowercase(), value.clone());
    }
    for (name, applied) in &input.cvars {
        let key = name.to_ascii_lowercase();
        let value = input.staged_cvars.iter()
            .find(|(staged, _)| staged.eq_ignore_ascii_case(name))
            .map_or(applied, |(_, value)| value);
        // A menu change takes precedence over the preceding frame's VM mirror.
        if extension.cvar_writes.iter().any(|(pending, _)| pending.eq_ignore_ascii_case(name)) {
            continue;
        }
        if name.eq_ignore_ascii_case(native_bindings::SKIP_CVAR) {
            let keys = native_bindings::skip_keys(value);
            if state.bindings.skip_keys != keys {
                state.bindings.skip_keys = keys;
                state.dirty = true;
            }
            continue;
        }
        let Some(default) = defaults.get(&key) else { continue };
        if state.values.get(&format!("0:{key}")) != Some(value) {
            state.values.insert(format!("0:{key}"), value.clone());
            if key == "gamma" { state.values.insert("3:gamma".into(), value.clone()); }
            state.dirty = true;
            state.apply_pending = true;
            state.config = state.config.compose([(name.clone(), value.clone(), default.clone())]);
        }
    }
}

fn atomic_write(path: &Path, bytes: &[u8]) -> Result<(), String> {
    crate::options_config::write_atomic(path, bytes)
}

fn number_string(value: f32) -> String {
    // Native14001c700 formats two decimal places, trims fractional zeroes
    // and the decimal point, then canonicalizes the remaining negative zero.
    let text = format!("{value:.2}");
    let text = text.trim_end_matches('0').trim_end_matches('.');
    if text == "-0" { "0".into() } else { text.into() }
}

fn checkbox_enabled(value: Option<&str>) -> bool {
    // Native click and draw compare the cached string with the single byte '0'.
    value.is_some_and(|value| !value.is_empty() && value != "0")
}

fn slider_string(row: &Definition, displayed: f32) -> String {
    let value = number_string(displayed);
    if row.storage == 3 {
        // Native14001d920 parses the slider's two-place display string, then
        // writes the inverted gamma with six fractional digits.
        format!("{:.6}", 1.0 - value.parse::<f32>().unwrap_or(0.0))
    } else {
        value
    }
}

fn binding_key(key: KeyCode) -> Option<String> {
    use KeyCode::*;
    let fixed = match key {
        Space => "SPACE",
        Tab => "TAB",
        Enter | NumpadEnter => "ENTER",
        Backspace => "BACKSPACE",
        Insert => "INSERT",
        Delete => "DELETE",
        Home => "HOME",
        End => "END",
        PageUp => "PAGEUP",
        PageDown => "PAGEDOWN",
        ArrowUp => "UP",
        ArrowDown => "DOWN",
        ArrowLeft => "LEFT",
        ArrowRight => "RIGHT",
        NumpadAdd => "NUMPADPLUS",
        NumpadSubtract => "NUMPADMINUS",
        NumpadMultiply => "NUMPADMULTIPLY",
        NumpadDivide => "NUMPADDIVIDE",
        NumpadDecimal => "NUMPADDECIMAL",
        NumpadEqual => "NUMPADEQUALS",
        NumLock => "NUMLOCK",
        CapsLock => "CAPSLOCK",
        PrintScreen => "PRINTSCREEN",
        Minus => "-",
        Equal => "=",
        BracketLeft => "[",
        BracketRight => "]",
        Backslash => "\\",
        Semicolon => ";",
        Quote => "'",
        Comma => ",",
        Period => ".",
        Slash => "/",
        Backquote => "`",
        _ => "",
    };
    if !fixed.is_empty() {
        return Some(fixed.into());
    }
    let name = format!("{key:?}");
    for prefix in ["Key", "Digit"] {
        if let Some(token) = name.strip_prefix(prefix) {
            if token.len() == 1 {
                return Some(token.into());
            }
        }
    }
    if name
        .strip_prefix("Numpad")
        .is_some_and(|suffix| suffix.len() == 1 && suffix.bytes().all(|b| b.is_ascii_digit()))
    {
        return Some(name.to_ascii_uppercase());
    }
    if name
        .strip_prefix('F')
        .is_some_and(|suffix| !suffix.is_empty() && suffix.bytes().all(|b| b.is_ascii_digit()))
    {
        return Some(name);
    }
    None
}

/// Publish ownership before FrameXML and world bindings read this frame. A
/// MessageReader clear only advances this editor's cursor, so it cannot keep
/// a newly captured key from also executing its former command in the client.
fn capture_input(
    state: Res<OptionsState>,
    extension: Option<ResMut<benilla_app::local_client::LocalClientExtension>>,
) {
    if let Some(mut extension) = extension {
        extension.binding_capture = state.open && state.page == 6 && state.bindings.capture.is_some();
        extension.pointer_over_ui |= state.open;
    }
}

#[derive(Component)]
struct Root;
#[derive(Component)]
struct Body;
#[derive(Component)]
struct Tip;
#[derive(Component)]
struct HoverRow(usize);
#[derive(Component)]
struct HoverAddon(usize);
#[derive(Component)]
struct Slider(usize);
#[derive(Component)]
struct BindingSlot {
    row: usize,
    slot: usize,
}
#[derive(Component)]
enum Action {
    Page(usize),
    Toggle(usize),
    Choice(usize, usize),
    Binding(usize, usize),
    BindingHeader(usize),
    Defaults,
    Done,
    ExportSave,
    ImportSave(usize),
    ConfirmSave,
    CancelSave,
    OpenSaves,
    OpenAddons,
    ToggleAddon(usize),
}

fn input(
    mut state: ResMut<OptionsState>,
    defs: Res<Definitions>,
    keys: Res<ButtonInput<KeyCode>>,
    mouse: Res<ButtonInput<MouseButton>>,
    clicks: Query<(Entity, &Interaction, &Action), (Changed<Interaction>, With<Button>)>,
    hovers: Query<(&RelativeCursorPosition, &HoverRow)>,
    addon_hovers: Query<(&RelativeCursorPosition, &HoverAddon)>,
    sliders: Query<(&Interaction, &RelativeCursorPosition, &Slider)>,
    binding_slots: Query<(&RelativeCursorPosition, &BindingSlot)>,
    mut keyboard: MessageReader<KeyboardInput>,
    mut binding_wheel: MessageReader<MouseWheel>,
    mut tips: Query<&mut Text, With<Tip>>,
    catalog: Res<MenuCatalog>,
    mut menu: ResMut<MenuState>,
    device: (Option<Res<crate::native_input::DeviceUiInput>>, Option<Res<benilla_app::local_client::LocalDeviceInput>>),
    binding_names: Option<Res<benilla_app::local_client::LocalBindingNames>>,
) {
    let (device, controller) = device;
    let back = keys.just_pressed(KeyCode::Escape) || controller.as_ref().is_some_and(|input| input.menu_requested);
    if !state.open {
        state.drag = None;
        keyboard.clear();
        binding_wheel.clear();
        return;
    }
    if state.page == 6 {
        if mouse.just_pressed(MouseButton::Right) {
            if let Some((_, slot)) = binding_slots.iter().find(|(cursor, _)| cursor.cursor_over) {
                state.assign_binding(slot.row, slot.slot, None);
                state.definitions_pending = true;
                state.dirty = true;
                keyboard.clear();
                binding_wheel.clear();
                return;
            }
        }
        if let Some((row, slot)) = state.bindings.capture {
            if back {
                state.bindings.capture = None;
                state.dirty = true;
                keyboard.clear();
                binding_wheel.clear();
                return;
            }
            let pressed = keyboard
                .read()
                .filter(|event| event.state == ButtonState::Pressed && !event.repeat)
                .find_map(|event| binding_names.as_ref().map_or_else(
                    || binding_key(event.key_code),
                    |names| names.binding_token(event.key_code)));
            let mouse_key = mouse.get_just_pressed().find_map(|button| match button {
                MouseButton::Left | MouseButton::Right => None,
                MouseButton::Middle => Some("BUTTON3".into()),
                MouseButton::Back => Some("BUTTON5".into()),
                MouseButton::Forward => Some("BUTTON4".into()),
                MouseButton::Other(number) if (5..20).contains(number) => Some(format!("BUTTON{}", number + 1)),
                MouseButton::Other(_) => None,
            });
            let wheel_key = binding_wheel
                .read()
                .find(|event| event.y != 0.0)
                .map(|event| {
                    if event.y > 0.0 {
                        "MOUSEWHEELUP"
                    } else {
                        "MOUSEWHEELDOWN"
                    }
                    .to_string()
                });
            if wheel_key.is_some() {
                state.suppress_wheel = true;
            }
            let contextual = state.bindings.rows.get(row).and_then(|row| row.command.as_deref())
                == Some(native_bindings::SKIP_COMMAND);
            let token = if contextual { pressed } else { pressed.or(mouse_key).or(wheel_key) };
            if let Some(token) = token {
                if !keys.any_pressed([KeyCode::SuperLeft, KeyCode::SuperRight]) {
                    let mut key = String::new();
                    for (modifier, held) in [
                        (
                            "ALT",
                            keys.any_pressed([KeyCode::AltLeft, KeyCode::AltRight]),
                        ),
                        (
                            "CTRL",
                            keys.any_pressed([KeyCode::ControlLeft, KeyCode::ControlRight]),
                        ),
                        (
                            "SHIFT",
                            keys.any_pressed([KeyCode::ShiftLeft, KeyCode::ShiftRight]),
                        ),
                    ] {
                        if held {
                            key.push_str(modifier);
                            key.push('-');
                        }
                    }
                    key.push_str(&token);
                    if let Some(key) = benilla_ui::script::keybind::normalize_binding_key(&key) {
                        state.assign_binding(row, slot, Some(key));
                        state.definitions_pending = true;
                        state.dirty = true;
                    }
                }
                return;
            }
        } else {
            keyboard.clear();
            binding_wheel.clear();
        }
    } else {
        keyboard.clear();
        binding_wheel.clear();
    }
    if back {
        state.close();
        return;
    }
    for (entity, interaction, action) in &clicks {
        if *interaction != Interaction::Pressed || !(mouse.just_pressed(MouseButton::Left)
            || device.as_ref().is_some_and(|d| d.touch_pressed || crate::native_input::activated(d, entity))) {
            continue;
        }
        // Native world input rebuilds its cached definitions after every
        // queued operation, including a page switch. Refresh file inventories
        // once after this input batch, preserving captured import bytes.
        state.definitions_pending = true;
        match *action {
            Action::Page(page) => {
                state.page = page;
                state.scroll = 0.0;
                state.hovered = None;
                state.bindings.capture = None;
                state.dirty = true;
            }
            Action::Toggle(index) => {
                let row = &defs.rows[index];
                let enabled = checkbox_enabled(state.value(row));
                state.set(row, if enabled { "0" } else { "1" }.into());
            }
            Action::Choice(index, choice) => state.set(
                &defs.rows[index],
                defs.rows[index].choices[choice].value.clone(),
            ),
            Action::Binding(row, slot) => {
                state.bindings.capture = (state.bindings.capture != Some((row, slot)))
                    .then_some((row, slot));
                state.dirty = true;
            }
            Action::BindingHeader(row) => {
                if !state.bindings.expanded.remove(&row) {
                    state.bindings.expanded.insert(row);
                }
                state.bindings.capture = None;
                state.dirty = true;
            }
            Action::Defaults => {
                if state.page == 6 {
                    state.bindings.keys = state.bindings.defaults.clone();
                    state.bindings.capture = None;
                    state.bindings.pending = true;
                    state.bindings.engine_writes.clear();
                    state.bindings.engine_reset = true;
                    state.set_skip_keys(vec![native_bindings::DEFAULT_SKIP_KEY.into()]);
                    state.dirty = true;
                }
                // Native Defaults applies only the current page’s recovered rows.
                for row in defs
                    .rows
                    .iter()
                    .filter(|row| row.page == state.page)
                    .collect::<Vec<_>>()
                {
                    if let Some(default) = state.default_value(row).map(str::to_owned) {
                        state.set(row, default);
                    }
                }
            }
            Action::Done => {
                state.close();
            }
            Action::ExportSave => {
                // Current 0.115.0 1400ab984 prepares the actual account's
                // sealed bytes before looking up the export directory.
                let payload = menu.load_active_save().export_payload().map_err(|e| e.to_string());
                if let Some(directory) = state.saves_directory() {
                    state.save_notice = Some(
                        match payload.and_then(|payload| save_browser::export(&directory, &payload)) {
                            Ok(path) => catalog.label("options.exported").replace(
                                "{name}",
                                &path.file_name().unwrap_or_default().to_string_lossy(),
                            ),
                            Err(error) => catalog
                                .label("options.export_failed")
                                .replace("{error}", &error),
                        },
                    );
                    state.refresh_saves();
                } else {
                    state.save_notice = Some(catalog.label("options.no_export_folder").into());
                }
                state.dirty = true;
            }
            Action::ImportSave(index) => {
                if let Some(path) = state.save_files.get(index) {
                    match save_browser::PendingImport::read(path) {
                        Ok(pending) => state.save_confirmation = Some(pending),
                        Err(error) => {
                            let name = path.file_name().unwrap_or_default().to_string_lossy();
                            state.save_notice = Some(catalog.label("options.cannot_read")
                                .replace("{name}", &name).replace("{error}", &error));
                        }
                    }
                }
                state.dirty = true;
            }
            Action::ConfirmSave => {
                if let Some(pending) = state.save_confirmation.take() {
                    let result = pending.parse().map(|save| {
                        if let Some(active) = menu.save_path.as_deref() {
                            let _ = save_browser::replace(active, &save);
                        }
                        menu.import_save(save, &catalog);
                    });
                    state.save_notice = Some(match result {
                        Ok(()) => catalog.label("options.imported").replace("{name}", &pending.name),
                        Err(error) => format!("{}: {}", pending.name, catalog.label(match error {
                            crate::save::SaveError::NotASave => "save.not_a_save",
                            _ => "save.damaged",
                        })),
                    });
                    state.refresh_saves();
                }
                state.dirty = true;
            }
            Action::CancelSave => {
                state.save_confirmation = None;
                state.dirty = true;
            }
            Action::OpenSaves => {
                if let Some(directory) = state.saves_directory() {
                    if let Err(error) = save_browser::open_folder(&directory) {
                        state.save_notice = Some(error);
                    }
                }
                state.dirty = true;
            }
            Action::OpenAddons => {
                if let Some(directory) = &state.addons.root {
                    if let Err(error) = save_browser::open_folder(directory) {
                        state.error = Some(error);
                    }
                }
            }
            Action::ToggleAddon(index) => {
                if let Err(error) = state.addons.toggle(index) {
                    state.error = Some(error);
                }
                state.dirty = true;
            }
        }
    }
    let hovered = hovers
        .iter()
        .find(|(cursor, _)| cursor.cursor_over)
        .map(|(_, row)| row.0);
    let addon_hovered = addon_hovers
        .iter()
        .find(|(cursor, _)| cursor.cursor_over)
        .map(|(_, row)| row.0);
    if hovered != state.hovered || addon_hovered != state.addon_hovered {
        state.hovered = hovered;
        state.addon_hovered = addon_hovered;
        let hint = addon_hovered
            .and_then(|index| state.addons.rows.get(index))
            .filter(|addon| !addon.notes.is_empty())
            .map(|addon| addon.notes.clone())
            .or_else(|| {
                hovered
                    .map(|index| {
                        catalog
                            .label(&format!("opt.{}.tip", defs.rows[index].key))
                            .to_owned()
                    })
                    .filter(|text| !text.starts_with("opt."))
            })
            .unwrap_or_else(|| {
                catalog
                    .label(match state.page {
                        1 => "options.hint.gamepad",
                        6 => "options.hint.keybindings",
                        10 => "options.hint.addons",
                        11 => "options.hint.saves",
                        _ => "options.hint",
                    })
                    .to_owned()
            });
        for mut tip in &mut tips {
            **tip = hint.clone();
        }
    }
    if mouse.just_released(MouseButton::Left) || (!mouse.pressed(MouseButton::Left)
        && device.as_ref().is_some_and(|d| !d.touch_held)) {
        state.drag = None;
    }
    for (interaction, cursor, slider) in &sliders {
        if *interaction == Interaction::Pressed && (mouse.just_pressed(MouseButton::Left)
            || device.as_ref().is_some_and(|d| d.touch_pressed)) {
            state.drag = Some(slider.0);
        }
        if state.drag == Some(slider.0) && (mouse.pressed(MouseButton::Left)
            || device.as_ref().is_some_and(|d| d.touch_held)) {
            if let Some(position) = cursor.normalized {
                let row = &defs.rows[slider.0];
                let [minimum, maximum, step] = row.range;
                let raw = minimum + (position.x + 0.5).clamp(0.0, 1.0) * (maximum - minimum);
                let value = if step > 0.0 {
                    minimum + ((raw - minimum) / step).round() * step
                } else {
                    raw
                };
                let value = value.clamp(minimum, maximum);
                state.set(
                    row,
                    slider_string(row, value),
                );
            }
        }
    }
}

fn apply_window(
    mut state: ResMut<OptionsState>,
    mut windows: Query<&mut Window, With<PrimaryWindow>>,
) {
    if !state.apply_pending {
        return;
    }
    if state.engine_connected {
        // The embedded registry owns applied/latched display values, RestartGx
        // and the platform's presentation policy. A staged Options snapshot
        // must not bypass it through this standalone-menu fallback.
        state.apply_pending = false;
        return;
    }
    if let Ok(mut window) = windows.single_mut() {
        if let Some(mode) = state.cvar("gxWindow") {
            let mode = if mode == "1" {
                WindowMode::Windowed
            } else {
                WindowMode::BorderlessFullscreen(MonitorSelection::Current)
            };
            if window.mode != mode {
                window.mode = mode;
            }
        }
        if let Some(vsync) = state.cvar("gxVSync") {
            let mode = if vsync == "0" {
                PresentMode::AutoNoVsync
            } else {
                PresentMode::AutoVsync
            };
            if window.present_mode != mode {
                window.present_mode = mode;
            }
        }
    }
    state.apply_pending = false;
}

fn label(
    ui: &mut ChildSpawnerCommands,
    font: &Handle<Font>,
    value: impl Into<String>,
    size: f32,
    color: Color,
) {
    ui.spawn((
        Text::new(value.into()),
        TextFont {
            font: font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        crate::menu::native_text_shadow(),
    ));
}

fn button(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    action: Action,
    selected: bool,
    width: f32,
    height: f32,
    scale: f32,
) -> Entity {
    let binding = matches!(action, Action::Binding(..));
    let navigation = matches!(action, Action::Page(..));
    let footer = matches!(
        action,
        Action::Defaults
            | Action::Done
            | Action::ExportSave
            | Action::OpenSaves
            | Action::ImportSave(_)
            | Action::ConfirmSave
            | Action::CancelSave
            | Action::OpenAddons
    );
    let font_size = if binding { 14.0 } else { 16.0 };
    let horizontal = if binding {
        8.0
    } else if footer {
        22.0
    } else {
        14.0
    };
    let vertical = if binding {
        4.0
    } else if footer {
        9.0
    } else {
        8.0
    };
    let mut entity = ui.spawn((
        Button,
        action,
        Node {
            width: if footer {
                Val::Auto
            } else {
                Val::Px(width * scale)
            },
            height: if footer || binding || navigation || height <= 0.0 {
                Val::Auto
            } else {
                Val::Px(height * scale)
            },
            min_width: if footer || binding {
                Val::Auto
            } else {
                Val::Px(width * scale)
            },
            flex_shrink: if binding { 1.0 } else { 0.0 },
            border: UiRect::all(Val::Px(scale)),
            padding: UiRect {
                left: Val::Px(horizontal * scale),
                right: Val::Px(horizontal * scale),
                top: Val::Px(vertical * scale),
                bottom: Val::Px(vertical * scale),
            },
            align_items: if binding {
                AlignItems::Default
            } else {
                AlignItems::Center
            },
            justify_content: if navigation {
                JustifyContent::FlexStart
            } else {
                JustifyContent::Center
            },
            border_radius: BorderRadius::all(Val::Px(4.0 * scale)),
            ..default()
        },
        BackgroundColor(if selected { RED } else { DARK }),
        BorderColor::all(if footer {
            crate::menu::BUTTON_EDGE
        } else if selected {
            GOLD
        } else {
            EDGE
        }),
    ));
    if footer || selected {
        entity.insert(crate::menu::native_button_gradient());
    }
    entity
        .with_children(|child| label(child, &art.font, value, font_size * scale, GOLD))
        .id()
}

fn draw_bindings(
    body: &mut ChildSpawnerCommands,
    state: &OptionsState,
    art: &MenuArt,
    catalog: &MenuCatalog,
    scale: f32,
) {
    if state.bindings.rows.is_empty() {
        label(
            body,
            &art.font,
            catalog.label("options.no_bindings"),
            15.0 * scale,
            PAPER,
        );
        if let Some(error) = &state.bindings.error {
            label(body, &art.font, error, 12.0 * scale, PAPER);
        }
        return;
    }
    let mut expanded = true;
    for (index, row) in state.bindings.rows.iter().enumerate() {
        let Some(command) = &row.command else {
            expanded = state.bindings.expanded.contains(&index);
            body.spawn((
                Button,
                Action::BindingHeader(index),
                Node {
                    width: Val::Percent(100.0),
                    min_height: Val::Px(32.0 * scale),
                    align_items: AlignItems::Center,
                    column_gap: Val::Px(10.0 * scale),
                    margin: UiRect::top(Val::Px(4.0 * scale)),
                    ..default()
                },
            ))
            .with_children(|header| {
                label(
                    header,
                    &art.font,
                    if expanded { "-" } else { "+" },
                    16.0 * scale,
                    GOLD,
                );
                label(header, &art.font, &row.label, 17.0 * scale, GOLD);
            });
            continue;
        };
        if !expanded {
            continue;
        }
        body.spawn(Node {
            width: Val::Percent(100.0),
            min_height: Val::Px(30.0 * scale),
            padding: UiRect::left(Val::Px(24.0 * scale)),
            align_items: AlignItems::Center,
            column_gap: Val::Px(10.0 * scale),
            ..default()
        })
        .with_children(|line| {
            // 218130 spawns Text and the width300 Node as one bundle.
            line.spawn((
                Text::new(if command == native_bindings::COMMAND {
                    // 0x1400f39a0 gives this command the localized custom
                    // menu label; FrameXML keeps its separate API label.
                    catalog.label("Level Up!")
                } else if command == native_bindings::SKIP_COMMAND {
                    catalog.label("Skip")
                } else { &row.label }),
                TextFont {
                    font: art.font.clone(),
                    font_size: 15.0 * scale,
                    ..default()
                },
                TextColor(PAPER),
                crate::menu::native_text_shadow(),
                Node {
                    width: Val::Px(300.0 * scale),
                    ..default()
                },
            ));
            for slot in 0..2 {
                let capturing = state.bindings.capture == Some((index, slot));
                let value = if capturing {
                    catalog.label("options.press_a_key").into()
                } else {
                    let keys = if command == native_bindings::SKIP_COMMAND {
                        state.skip_keys()
                    } else {
                        state.bindings.keys.get(command).map(Vec::as_slice).unwrap_or_default()
                    };
                    keys.get(slot)
                        .map(|key| state.bindings.key_label(key))
                        .unwrap_or_else(|| catalog.label("options.not_bound").into())
                };
                let entity = button(
                    line,
                    art,
                    value,
                    Action::Binding(index, slot),
                    capturing,
                    200.0,
                    0.0,
                    scale,
                );
                line.commands().entity(entity).insert((
                    BindingSlot { row: index, slot },
                    RelativeCursorPosition::default(),
                ));
            }
        });
    }
}

fn draw_saves(
    body: &mut ChildSpawnerCommands,
    state: &OptionsState,
    art: &MenuArt,
    catalog: &MenuCatalog,
    scale: f32,
) {
    label(
        body,
        &art.font,
        catalog.label("options.saves_about"),
        15.0 * scale,
        PAPER,
    );
    body.spawn(Node {
        column_gap: Val::Px(12.0 * scale),
        margin: UiRect::vertical(Val::Px(10.0 * scale)),
        ..default()
    })
    .with_children(|actions| {
        button(
            actions,
            art,
            catalog.label("options.export_save"),
            Action::ExportSave,
            false,
            0.0,
            0.0,
            scale,
        );
        button(
            actions,
            art,
            catalog.label("options.open_saves_folder"),
            Action::OpenSaves,
            false,
            0.0,
            0.0,
            scale,
        );
    });
    if let Some(notice) = &state.save_notice {
        label(body, &art.font, notice, 14.0 * scale, PAPER);
    }
    if let Some(pending) = &state.save_confirmation {
        body.spawn((
            Node {
                width: Val::Percent(100.0),
                padding: UiRect::all(Val::Px(12.0 * scale)),
                border: UiRect::all(Val::Px(scale)),
                flex_direction: FlexDirection::Column,
                row_gap: Val::Px(8.0 * scale),
                ..default()
            },
            BackgroundColor(RED),
            BorderColor::all(GOLD),
        ))
        .with_children(|confirmation| {
            label(
                confirmation,
                &art.font,
                catalog.label("options.replace_confirm").replace(
                    "{name}",
                    &pending.name,
                ),
                15.0 * scale,
                GOLD,
            );
            confirmation
                .spawn(Node {
                    column_gap: Val::Px(10.0 * scale),
                    ..default()
                })
                .with_children(|actions| {
                    button(
                        actions,
                        art,
                        catalog.label("options.replace"),
                        Action::ConfirmSave,
                        true,
                        0.0,
                        0.0,
                        scale,
                    );
                    button(
                        actions,
                        art,
                        catalog.label("options.cancel"),
                        Action::CancelSave,
                        false,
                        0.0,
                        0.0,
                        scale,
                    );
                });
        });
    }
    label(
        body,
        &art.font,
        catalog.label("options.save_files"),
        20.0 * scale,
        GOLD,
    );
    if let Some(directory) = state.saves_directory() {
        label(
            body,
            &art.font,
            catalog
                .label("options.exports_go_to")
                .replace("{path}", &directory.display().to_string()),
            13.0 * scale,
            PAPER,
        );
    }
    // Current Saves-page140279c80 places the hourly retention explanation after the directory.
    label(body, &art.font, catalog.label("options.backups_about"), 14.0 * scale, PAPER);
    if state.save_files.is_empty() {
        label(
            body,
            &art.font,
            catalog.label("options.no_save_files"),
            15.0 * scale,
            PAPER,
        );
    }
    for (index, path) in state.save_files.iter().enumerate() {
        body.spawn(Node {
            width: Val::Percent(100.0),
            min_height: Val::Px(67.0 * scale),
            align_items: AlignItems::Center,
            column_gap: Val::Px(12.0 * scale),
            ..default()
        })
        .with_children(|row| {
            row.spawn(Node {
                flex_grow: 1.0,
                min_width: Val::Px(0.0),
                ..default()
            })
            .with_children(|name| {
                label(
                    name,
                    &art.font,
                    path.file_name().unwrap_or_default().to_string_lossy(),
                    16.0 * scale,
                    PAPER,
                )
            });
            button(
                row,
                art,
                catalog.label("options.import"),
                Action::ImportSave(index),
                false,
                0.0,
                0.0,
                scale,
            );
        });
    }
}

fn draw_addons(
    body: &mut ChildSpawnerCommands,
    state: &OptionsState,
    art: &MenuArt,
    catalog: &MenuCatalog,
    scale: f32,
) {
    const NATIVE_GOLD: Color = Color::srgb(0.973, 0.824, 0.416);
    const NATIVE_MUTED: Color = Color::srgb(0.725, 0.663, 0.510);
    const NATIVE_ERROR: Color = Color::srgb(1.0, 0.353, 0.235);
    body.spawn(Node {
        width: Val::Percent(100.0),
        min_height: Val::Px(48.0 * scale),
        column_gap: Val::Px(14.0 * scale),
        margin: UiRect::vertical(Val::Px(6.0 * scale)),
        align_items: AlignItems::Center,
        ..default()
    })
    .with_children(|header| {
        button(
            header,
            art,
            catalog.label("options.open_addons_folder"),
            Action::OpenAddons,
            true,
            0.0,
            0.0,
            scale,
        );
        let path = state
            .addons
            .root
            .as_deref()
            .map(|path| path.display().to_string())
            .unwrap_or_default();
        label(
            header,
            &art.font,
            catalog
                .label("options.addons_folder_note")
                .replace("{path}", &path),
            14.0 * scale,
            NATIVE_MUTED,
        );
    });
    if state.addons.rows.is_empty() {
        label(
            body,
            &art.font,
            catalog.label("options.no_addons"),
            14.0 * scale,
            NATIVE_MUTED,
        );
    }
    let check_version = state.cvar("checkAddonVersion") != Some("0");
    for (index, addon) in state.addons.rows.iter().enumerate() {
        let missing = state.addons.missing(addon);
        let blocked = !missing.is_empty() || (addon.outdated && check_version);
        let status = if !missing.is_empty() {
            catalog
                .label("options.addon_missing")
                .replace("{list}", &missing.join(", "))
        } else if addon.outdated && check_version {
            catalog.label("options.addon_out_of_date").into()
        } else if addon.on_demand {
            catalog.label("options.addon_on_demand").into()
        } else {
            String::new()
        };
        let color = if !addon.enabled {
            NATIVE_MUTED
        } else if blocked {
            NATIVE_ERROR
        } else {
            NATIVE_GOLD
        };
        body.spawn((
            HoverAddon(index),
            RelativeCursorPosition::default(),
            Node {
                width: Val::Percent(100.0),
                min_height: Val::Px(36.0 * scale),
                column_gap: Val::Px(12.0 * scale),
                align_items: AlignItems::Center,
                ..default()
            },
        ))
        .with_children(|row| {
            row.spawn((
                Button,
                Action::ToggleAddon(index),
                Node {
                    width: Val::Px(24.0 * scale),
                    height: Val::Px(24.0 * scale),
                    flex_shrink: 0.0,
                    padding: UiRect::all(Val::Px(4.0 * scale)),
                    border: UiRect::all(Val::Px(scale)),
                    border_radius: BorderRadius::all(Val::Px(3.0 * scale)),
                    ..default()
                },
                BackgroundColor(Color::BLACK),
                BorderColor::all(EDGE),
            ))
            .with_children(|checkbox| {
                if addon.enabled {
                    checkbox.spawn((
                        Node {
                            width: Val::Percent(100.0),
                            height: Val::Percent(100.0),
                            border_radius: BorderRadius::all(Val::Px(scale)),
                            ..default()
                        },
                        BackgroundColor(NATIVE_GOLD),
                    ));
                }
            });
            row.spawn((
                Text::new(&addon.title),
                TextFont {
                    font: art.font.clone(),
                    font_size: 16.0 * scale,
                    ..default()
                },
                TextColor(color),
                crate::menu::native_text_shadow(),
                Node {
                    width: Val::Px(320.0 * scale),
                    ..default()
                },
            ));
            label(
                row,
                &art.font,
                status,
                14.0 * scale,
                if blocked { NATIVE_ERROR } else { NATIVE_MUTED },
            );
        });
    }
}

fn rebuild(
    mut commands: Commands,
    mut state: ResMut<OptionsState>,
    defs: Res<Definitions>,
    art: Res<MenuArt>,
    catalog: Res<MenuCatalog>,
    roots: Query<Entity, With<Root>>,
    windows: Query<&Window, With<PrimaryWindow>>,
) {
    let scale = windows
        .single()
        .map(|window| {
            (window.width() / 1060.0)
                .min(window.height() / 700.0)
                .min(1.4)
                .max(0.1)
        })
        .unwrap_or(1.0);
    if !state.dirty && state.last_open == state.open && (state.scale - scale).abs() < 0.001 {
        return;
    }
    for root in &roots {
        commands.entity(root).despawn();
    }
    if state.open && !state.last_open {
        state.save_confirmation = None;
        state.save_notice = None;
    }
    if state.open && (!state.last_open || state.definitions_pending) {
        state.refresh_saves();
        state.addons = crate::addons::Addons::load(state.state_home.as_deref());
        // Current14013710c/140138fd1 rebuilds the value model on open or an admitted
        // operation batch. Hover/scale repaint retains it. Reread file literals
        // here so a failed write does not become a synthetic displayed value.
        let globals = state.state_home.as_deref().map(|home| {
            crate::options_globals::read(home, defs.rows.iter()
                .filter(|row| matches!(row.storage, 1 | 2))
                .map(|row| (row.key.as_str(), row.storage)))
        }).unwrap_or_default();
        state.values.retain(|key, _| !key.starts_with("1:") && !key.starts_with("2:"));
        state.values.extend(globals);
        // Current14056a270 rereads the account file for each admitted model
        // transaction. The VM snapshot supplies declarations/defaults only.
        state.bindings.keys = state.bindings.account_keys(state.state_home.as_deref());
        state.definitions_pending = false;
    }
    state.last_open = state.open;
    state.dirty = false;
    state.scale = scale;
    if !state.open {
        return;
    }
    let page = state.page;
    // Native217e60 scales the render target once, keeping all Node/font values in design units.
    let scale = 1.0;
    commands.spawn((
        Root,
        Node {
            width: Val::Percent(100.0),
            height: Val::Percent(100.0),
            position_type: PositionType::Absolute,
            align_items: AlignItems::Center,
            justify_content: JustifyContent::Center,
            ..default()
        },
        BackgroundColor(Color::srgba(0.0, 0.0, 0.0, 0.88)),
        GlobalZIndex(100),
        Interaction::None,
        FocusPolicy::Block,
    ));
    commands
        .spawn((
            Root,
            crate::canvas::NativeCanvas {
                design: Vec2::new(1060.0, 700.0),
                max_scale: 1.4,
            },
            GlobalZIndex(101),
            Node {
                position_type: PositionType::Absolute,
                width: Val::Px(1060.0),
                height: Val::Px(700.0),
                ..default()
            },
        ))
        .with_children(|shade| {
            shade
                .spawn((
                    Node {
                        width: Val::Px(1060.0 * scale),
                        height: Val::Px(700.0 * scale),
                        border: UiRect::all(Val::Px(scale)),
                        border_radius: BorderRadius::all(Val::Px(10.0 * scale)),
                        flex_direction: FlexDirection::Column,
                        padding: UiRect {
                            left: Val::Px(28.0 * scale),
                            right: Val::Px(28.0 * scale),
                            top: Val::Px(18.0 * scale),
                            bottom: Val::Px(18.0 * scale),
                        },
                        row_gap: Val::Px(12.0 * scale),
                        ..default()
                    },
                    BackgroundGradient::from(LinearGradient {
                        angle: std::f32::consts::PI,
                        stops: vec![
                            Color::linear_rgba(0.078, 0.059, 0.035, 0.90).into(),
                            Color::linear_rgba(0.031, 0.024, 0.016, 0.93).into(),
                        ],
                        ..default()
                    }),
                    BorderColor::all(Color::srgb(0.427, 0.333, 0.145)),
                    BoxShadow::new(
                        Color::srgba(0.0, 0.0, 0.0, 0.6),
                        Val::Px(0.0),
                        Val::Px(14.0 * scale),
                        Val::Px(0.0),
                        Val::Px(40.0 * scale),
                    ),
                ))
                .with_children(|panel| {
                    panel
                        .spawn(Node {
                            width: Val::Percent(100.0),
                            height: Val::Px(48.0 * scale),
                            min_height: Val::Px(48.0 * scale),
                            align_items: AlignItems::Center,
                            justify_content: JustifyContent::Center,
                            ..default()
                        })
                        .with_children(|title| {
                            label(
                                title,
                                &art.heading_font,
                                catalog.label("picker.options"),
                                40.0 * scale,
                                GOLD,
                            )
                        });
                    panel
                        .spawn(Node {
                            width: Val::Percent(100.0),
                            flex_grow: 1.0,
                            min_height: Val::Px(0.0),
                            column_gap: Val::Px(20.0 * scale),
                            ..default()
                        })
                        .with_children(|columns| {
                            columns
                                .spawn(Node {
                                    width: Val::Px(190.0 * scale),
                                    min_width: Val::Px(190.0 * scale),
                                    flex_direction: FlexDirection::Column,
                                    row_gap: Val::Px(6.0 * scale),
                                    ..default()
                                })
                                .with_children(|nav| {
                                    for (index, key) in defs.pages.iter().enumerate() {
                                        button(
                                            nav,
                                            &art,
                                            catalog.label(&format!("opt.page.{key}")),
                                            Action::Page(index),
                                            index == page,
                                            190.0,
                                            36.0,
                                            scale,
                                        );
                                    }
                                });
                            let scroll_target =
                                columns
                                    .spawn((
                                        Body,
                                        ScrollPosition(Vec2::new(0.0, state.scroll)),
                                        Node {
                                            flex_grow: 1.0,
                                            height: Val::Percent(100.0),
                                            border: UiRect::all(Val::Px(scale)),
                                            border_radius: BorderRadius::all(Val::Px(6.0 * scale)),
                                            padding: UiRect {
                                                left: Val::Px(16.0 * scale),
                                                right: Val::Px(16.0 * scale),
                                                top: Val::Px(10.0 * scale),
                                                bottom: Val::Px(10.0 * scale),
                                            },
                                            row_gap: Val::Px(4.0 * scale),
                                            overflow: Overflow::scroll_y(),
                                            flex_direction: FlexDirection::Column,
                                            ..default()
                                        },
                                        BackgroundColor(DARK),
                                        BorderColor::all(Color::srgb(0.19, 0.15, 0.07)),
                                    ))
                                    .with_children(|body| {
                                        for (index, row) in defs
                                            .rows
                                            .iter()
                                            .enumerate()
                                            .filter(|(_, row)| row.page == page)
                                        {
                                            body.spawn((
                                                HoverRow(index),
                                                RelativeCursorPosition::default(),
                                                Node {
                                                    width: Val::Percent(100.0),
                                                    min_height: Val::Px(36.0 * scale),
                                                    align_items: AlignItems::Center,
                                                    column_gap: Val::Px(12.0 * scale),
                                                    padding: UiRect::left(Val::Px(if row.indent {
                                                        28.0 * scale
                                                    } else {
                                                        0.0
                                                    })),
                                                    ..default()
                                                },
                                            ))
                                            .with_children(|line| {
                                                line.spawn((
                                                    Text::new(
                                                        catalog
                                                            .labels
                                                            .get(&format!("opt.{}", row.key))
                                                            .unwrap_or(&row.label),
                                                    ),
                                                    TextFont {
                                                        font: art.font.clone(),
                                                        font_size: if row.indent {
                                                            14.0 * scale
                                                        } else {
                                                            15.0 * scale
                                                        },
                                                        ..default()
                                                    },
                                                    TextColor(if row.indent {
                                                        PAPER
                                                    } else {
                                                        GOLD
                                                    }),
                                                    crate::menu::native_text_shadow(),
                                                    Node {
                                                        width: Val::Px(320.0 * scale),
                                                        ..default()
                                                    },
                                                ));
                                                let value = state.value(row);
                                                match row.control {
                                                    5 => {
                                                        let checked =
                                                            checkbox_enabled(value) ^ row.inverted;
                                                        line.spawn((
                                                            Button,
                                                            Action::Toggle(index),
                                                            Node {
                                                                width: Val::Px(24.0 * scale),
                                                                height: Val::Px(24.0 * scale),
                                                                padding: UiRect::all(Val::Px(
                                                                    4.0 * scale,
                                                                )),
                                                                border: UiRect::all(Val::Px(scale)),
                                                                border_radius: BorderRadius::all(
                                                                    Val::Px(3.0 * scale),
                                                                ),
                                                                ..default()
                                                            },
                                                            BackgroundColor(Color::BLACK),
                                                            BorderColor::all(EDGE),
                                                        ))
                                                        .with_children(|box_ui| {
                                                            if checked {
                                                                box_ui.spawn((
                                                                    Node {
                                                                        width: Val::Percent(100.0),
                                                                        height: Val::Percent(100.0),
                                                                        border_radius:
                                                                            BorderRadius::all(
                                                                                Val::Px(
                                                                                    1.0 * scale,
                                                                                ),
                                                                            ),
                                                                        ..default()
                                                                    },
                                                                    BackgroundColor(GOLD),
                                                                ));
                                                            }
                                                        });
                                                    }
                                                    7 => {
                                                        line.spawn(Node {
                                                            column_gap: Val::Px(6.0 * scale),
                                                            ..default()
                                                        })
                                                        .with_children(|choices| {
                                                            for (choice_index, choice) in
                                                                row.choices.iter().enumerate()
                                                            {
                                                                let width =
                                                                    (choice.label.chars().count()
                                                                        as f32
                                                                        * 7.0
                                                                        + 18.0)
                                                                        .max(47.0);
                                                                button(
                                                                    choices,
                                                                    &art,
                                                                    catalog
                                                                        .labels
                                                                        .get(&format!(
                                                                            "opt.{}.{}",
                                                                            row.key, choice.value
                                                                        ))
                                                                        .unwrap_or(&choice.label),
                                                                    Action::Choice(
                                                                        index,
                                                                        choice_index,
                                                                    ),
                                                                    value
                                                                        == Some(
                                                                            choice.value.as_str(),
                                                                        ),
                                                                    width,
                                                                    27.0,
                                                                    scale,
                                                                );
                                                            }
                                                        });
                                                    }
                                                    0..=4 => {
                                                        let fraction = value
                                                            .map(|v| {
                                                                (row.displayed(v) - row.range[0])
                                                                    / (row.range[1] - row.range[0])
                                                            })
                                                            .unwrap_or(0.0)
                                                            .clamp(0.0, 1.0);
                                                        line.spawn((
                                                            Button,
                                                            Slider(index),
                                                            RelativeCursorPosition::default(),
                                                            Node {
                                                                width: Val::Px(240.0 * scale),
                                                                height: Val::Px(12.0 * scale),
                                                                align_items: AlignItems::Center,
                                                                ..default()
                                                            },
                                                            BackgroundColor(Color::NONE),
                                                        ))
                                                        .with_children(|slider| {
                                                            slider
                                                                .spawn((
                                                                    Node {
                                                                        width: Val::Percent(100.0),
                                                                        height: Val::Px(
                                                                            12.0 * scale,
                                                                        ),
                                                                        border: UiRect::all(
                                                                            Val::Px(scale),
                                                                        ),
                                                                        border_radius:
                                                                            BorderRadius::all(
                                                                                Val::Px(
                                                                                    5.0 * scale,
                                                                                ),
                                                                            ),
                                                                        ..default()
                                                                    },
                                                                    BackgroundColor(Color::BLACK),
                                                                    BorderColor::all(EDGE),
                                                                ))
                                                                .with_children(|track| {
                                                                    track.spawn((
                                                                        Node {
                                                                            width: Val::Percent(
                                                                                fraction * 100.0,
                                                                            ),
                                                                            height: Val::Percent(
                                                                                100.0,
                                                                            ),
                                                                            border_radius:
                                                                                BorderRadius::all(
                                                                                    Val::Px(
                                                                                        5.0 * scale,
                                                                                    ),
                                                                                ),
                                                                            ..default()
                                                                        },
                                                                        BackgroundColor(
                                                                            Color::srgb(
                                                                                0.64, 0.49, 0.19,
                                                                            ),
                                                                        ),
                                                                    ));
                                                                });
                                                        });
                                                        line.spawn(Node::default()).with_children(
                                                            |value_ui| {
                                                                label(
                                                                    value_ui,
                                                                    &art.font,
                                                                    value
                                                                        .map(|v| row.formatted(v))
                                                                        .unwrap_or_else(|| {
                                                                            "—".into()
                                                                        }),
                                                                    14.0 * scale,
                                                                    PAPER,
                                                                )
                                                            },
                                                        );
                                                    }
                                                    _ => {}
                                                }
                                            });
                                        }
                                        if page == 6 {
                                            draw_bindings(body, &state, &art, &catalog, scale);
                                        }
                                        if page == 10 {
                                            draw_addons(body, &state, &art, &catalog, scale);
                                        }
                                        if page == 11 {
                                            draw_saves(body, &state, &art, &catalog, scale);
                                        }
                                    })
                                    .id();
                            crate::scrollbar::spawn(
                                columns,
                                scroll_target,
                                scale,
                                crate::scrollbar::InputScope::Options,
                            );
                        });
                    panel
                        .spawn(Node {
                            width: Val::Percent(100.0),
                            min_height: Val::Px(52.0 * scale),
                            column_gap: Val::Px(12.0 * scale),
                            align_items: AlignItems::Center,
                            ..default()
                        })
                        .with_children(|footer| {
                            footer
                                .spawn(Node {
                                    flex_grow: 1.0,
                                    min_width: Val::Px(0.0),
                                    ..default()
                                })
                                .with_children(|hint| {
                                    hint.spawn((
                                        Tip,
                                        Text::new(state.error.clone().unwrap_or_else(|| {
                                            catalog
                                                .label(match page {
                                                    1 => "options.hint.gamepad",
                                                    6 => "options.hint.keybindings",
                                                    10 => "options.hint.addons",
                                                    11 => "options.hint.saves",
                                                    _ => "options.hint",
                                                })
                                                .into()
                                        })),
                                        TextFont {
                                            font: art.font.clone(),
                                            font_size: 13.0 * scale,
                                            ..default()
                                        },
                                        TextColor(PAPER),
                                        crate::menu::native_text_shadow(),
                                    ));
                                });
                            if page != 11 {
                                button(
                                    footer,
                                    &art,
                                    catalog.label("options.defaults"),
                                    Action::Defaults,
                                    true,
                                    100.0,
                                    36.0,
                                    scale,
                                );
                            }
                            button(
                                footer,
                                &art,
                                catalog.label("options.done"),
                                Action::Done,
                                true,
                                80.0,
                                36.0,
                                scale,
                            );
                        });
                });
        });
}

fn scroll(
    mut state: ResMut<OptionsState>,
    mut wheel: MessageReader<MouseWheel>,
    mut bodies: Query<(&ComputedNode, &mut ScrollPosition), With<Body>>,
) {
    if !state.open {
        wheel.clear();
        return;
    }
    if state.suppress_wheel || state.page == 6 && state.bindings.capture.is_some() {
        wheel.clear();
        state.suppress_wheel = false;
        return;
    }
    let amount: f32 = wheel
        .read()
        .map(|event| {
            event.y
                * match event.unit {
                    bevy::input::mouse::MouseScrollUnit::Line => 40.0,
                    bevy::input::mouse::MouseScrollUnit::Pixel => 1.0,
                }
        })
        .sum();
    for (node, mut position) in &mut bodies {
        if node.size.y <= 0.0 {
            continue;
        }
        let maximum = ((node.content_size.y - node.size.y) * node.inverse_scale_factor).max(0.0);
        position.0.y = (position.0.y - amount).clamp(0.0, maximum);
        state.scroll = position.0.y;
    }
}

fn save_bindings(mut state: ResMut<OptionsState>) {
    if !state.bindings.pending {
        return;
    }
    let Some(home) = state.state_home.clone() else {
        state.bindings.pending = false;
        return;
    };
    if let Err(error) = state.bindings.write(&home) {
        warn!("bindings: cannot save: {error}");
    }
}

fn save_when_quiet(mut state: ResMut<OptionsState>) {
    let cvars_due = state
        .cvars_pending
        .is_some_and(|last| last.elapsed() >= crate::options_config::SAVE_QUIET);
    if !cvars_due {
        return;
    }
    let Some(home) = state.state_home.clone() else {
        state.cvars_pending = None;
        return;
    };
    let cvars = if cvars_due {
        state.persist_cvars(&home)
    } else {
        Ok(())
    };
    log_cvar_write(cvars);
}

// The native writer consumes the dirty request and warns on failure; it does
// not publish a custom Options error state or establish a future write hold.
fn log_cvar_write(result: Result<(), String>) {
    if let Err(error) = result {
        warn!("config: cannot write {error}");
    }
}

fn save_on_exit(mut state: ResMut<OptionsState>, mut exits: MessageReader<AppExit>) {
    if exits.read().next().is_some()
        && (state.cvars_pending.is_some() || state.bindings.pending)
    {
        state.persist();
    }
}

#[cfg(test)]
mod persistence_tests {
    use super::*;

    #[test]
    fn checkbox_checks_the_cached_string_without_numeric_normalization() {
        for value in [None, Some(""), Some("0")] {
            assert!(!checkbox_enabled(value), "{value:?}");
        }
        for value in ["1", "0.0", "-0", "0e0", " 0 ", "value"] {
            assert!(checkbox_enabled(Some(value)), "{value:?}");
        }
    }

    fn isolated_options() -> OptionsState {
        let defs = Definitions::embedded();
        OptionsState {
            open: false, page: 0,
            values: defs.rows.iter().filter_map(|row| row.default.as_ref()
                .map(|value| (row.state_key(), value.clone()))).collect(),
            config: crate::options_config::Config::default(), state_home: None,
            dirty: false, definitions_pending: false, last_open: false, scale: 1., scroll: 0., hovered: None,
            drag: None, cvars_pending: None, apply_pending: false,
            engine_connected: false, engine_writes: Vec::new(), error: None,
            engine_defaults: BTreeMap::new(),
            global_writes: Vec::new(),
            bindings: BindingsState::default(), suppress_wheel: false,
            save_files: Vec::new(), save_confirmation: None, save_notice: None,
            addons: crate::addons::Addons::default(), addon_hovered: None,
        }
    }

    #[test]
    fn menu_edits_deliver_primary_gamma_and_linked_writes_to_registry_queue() {
        let defs = Definitions::embedded();
        let mut state = isolated_options();
        for (name, value) in [("cameraYawMoveSpeed", "210"), ("PetMeleeDamage", "0"), ("gamma", "0.7")] {
            let row = defs.rows.iter().find(|row| row.key == name).unwrap();
            state.set(row, value.into());
        }
        let mut app = App::new();
        app.insert_resource(state).insert_resource(defs)
            .init_resource::<benilla_app::local_client::LocalClientExtension>()
            .add_systems(Update, sync_engine);
        app.update();
        let extension = app.world().resource::<benilla_app::local_client::LocalClientExtension>();
        for (name, value) in [("cameraYawMoveSpeed", "210"), ("cameraPitchMoveSpeed", "105"),
            ("PetMeleeDamage", "0"), ("PetSpellDamage", "0"), ("gamma", "0.7")] {
            assert!(extension.cvar_writes.contains(&(name.into(), value.into())));
        }
        assert!(app.world().resource::<OptionsState>().cvars_pending.is_none());
    }

    #[test]
    fn page_defaults_restore_linked_setting_even_when_primary_is_already_default() {
        let defs = Definitions::embedded();
        let mut state = isolated_options();
        state.values.insert("0:camerapitchmovespeed".into(), "120".into());
        let row = defs.rows.iter().find(|row| row.key == "cameraYawMoveSpeed").unwrap();
        state.set(row, row.default.clone().unwrap());
        assert_eq!(state.cvar("cameraYawMoveSpeed"), Some("180"));
        assert!(state.engine_writes.contains(&("cameraPitchMoveSpeed".into(), "90".into())));
    }

    #[test]
    fn numeric_writes_match_current_native_precision_and_negative_zero() {
        let vectors: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/options-values/native-vectors.json"
        )).unwrap();
        for case in vectors["number"].as_array().unwrap() {
            let bytes: Vec<_> = case["input_f32_bits"].as_str().unwrap().as_bytes()
                .chunks(2).map(|pair| u8::from_str_radix(std::str::from_utf8(pair).unwrap(), 16).unwrap()).collect();
            let value = f32::from_le_bytes(bytes.try_into().unwrap());
            assert_eq!(number_string(value), case["output"].as_str().unwrap());
        }
        let definitions = Definitions::embedded();
        let gamma = definitions.rows.iter().find(|row| row.storage == 3).unwrap();
        assert_eq!(slider_string(gamma, 0.36), "0.640000");
        assert_eq!(slider_string(gamma, 0.3333333), "0.670000",
            "The pointer/device slider formats its display value before the native inversion");
    }

    #[test]
    fn embedded_display_policy_does_not_apply_staged_menu_values_to_window() {
        let mut state = isolated_options();
        state.engine_connected = true;
        state.apply_pending = true;
        state.values.insert("0:gxwindow".into(), "0".into());
        state.values.insert("0:gxvsync".into(), "0".into());
        let mut app = App::new();
        app.insert_resource(state).add_systems(Update, apply_window);
        let window = app.world_mut().spawn((Window {
            mode: WindowMode::Windowed,
            present_mode: PresentMode::AutoVsync,
            ..default()
        }, PrimaryWindow)).id();
        app.update();
        let window = app.world().get::<Window>(window).unwrap();
        assert_eq!(window.mode, WindowMode::Windowed);
        assert_eq!(window.present_mode, PresentMode::AutoVsync);
        assert!(!app.world().resource::<OptionsState>().apply_pending);
    }

    #[test]
    fn registry_snapshot_preserves_pending_edit_and_displays_latched_value() {
        use benilla_app::local_client::{LocalClientExtension, LocalClientInput};
        let defs = Definitions::embedded();
        let mut state = isolated_options();
        state.set(defs.rows.iter().find(|row| row.key == "renderScale").unwrap(), "0.75".into());
        let mut app = App::new();
        app.insert_resource(state).insert_resource(defs)
            .init_resource::<LocalClientExtension>()
            .insert_resource(LocalClientInput {
                cvars: vec![("renderScale".into(), "1".into()), ("gxWindow".into(), "0".into())],
                staged_cvars: vec![("gxWindow".into(), "1".into())],
                cvar_defaults: vec![("gxWindow".into(), "1".into())],
                ..default()
            }).add_systems(Update, sync_engine);
        app.update();
        assert_eq!(app.world().resource::<OptionsState>().cvar("renderScale"), Some("0.75"));
        assert_eq!(app.world().resource::<OptionsState>().cvar("gxWindow"), Some("1"));
        let window = app.world().resource::<Definitions>().rows.iter()
            .find(|row| row.key == "gxWindow").unwrap();
        assert_eq!(app.world().resource::<OptionsState>().default_value(window), Some("1"),
            "Page Defaults must use the registered locale default");
        app.world_mut().resource_mut::<LocalClientExtension>().cvar_writes.clear();
        app.world_mut().resource_mut::<LocalClientInput>().cvars[0].1 = "0.5".into();
        app.update();
        let state = app.world().resource::<OptionsState>();
        assert_eq!(state.cvar("renderScale"), Some("0.5"));
        assert!(state.engine_writes.is_empty(), "Registry observation must not echo another write");
    }

    #[test]
    fn live_binding_snapshot_preserves_custom_azs_header_and_other_labels() {
        use benilla_app::local_client::{
            LocalBindingsSnapshot, LocalClientExtension, LocalClientInput,
        };
        let mut app = App::new();
        app.insert_resource(isolated_options())
            .insert_resource(Definitions::embedded())
            .init_resource::<LocalClientExtension>()
            .init_resource::<LocalClientInput>()
            .add_systems(Update, sync_engine);
        for incoming in ["", "AZS", "Changed by an addon"] {
            let rows: Vec<(String, String)> = [
                ("HEADER_AZS", incoming),
                ("HEADER_AZs", ""),
                ("HEADER_AZS_EXTRA", "Another group"),
                ("HEADER_MOVEMENT", "Localized movement"),
                ("HEADER_OTHER", ""),
                ("JUMP", "Localized jump"),
            ].into_iter().map(|(name, label)| (name.into(), label.into())).collect();
            app.world_mut().resource_mut::<LocalClientInput>().bindings =
                Some(LocalBindingsSnapshot { rows: rows.clone(), ..default() });
            app.update();
            // The engine snapshot remains its own observation; only the
            // custom Options projection receives the native header override.
            let state = app.world().resource::<OptionsState>();
            assert_eq!(state.bindings.engine_rows, rows);
            assert_eq!(state.bindings.rows[0].label, "Azeroth Survivors");
            assert!(state.bindings.rows[0].command.is_none());
            assert_eq!(state.bindings.rows[1].label, "AZs");
            assert_eq!(state.bindings.rows[2].label, "Another group");
            assert_eq!(state.bindings.rows[3].label, "Localized movement");
            assert_eq!(state.bindings.rows[4].label, "OTHER");
            assert_eq!(state.bindings.rows[5].label, "Localized jump");
            assert_eq!(state.bindings.rows[5].command.as_deref(), Some("JUMP"));
        }
        app.update();
        assert_eq!(app.world().resource::<OptionsState>().bindings.rows[0].label,
            "Azeroth Survivors", "An unchanged snapshot retains the projected header");
    }

    #[test]
    fn skip_edits_its_cvar_without_taking_the_stock_chord() {
        let mut state = isolated_options();
        state.bindings.rows.push(BindingRow {
            command: Some(native_bindings::COMMAND.into()),
            label: "Open Level-Ups".into(),
        });
        state.bindings.insert_skip_row();
        state.bindings.keys.insert("SITORSTAND".into(), vec!["X".into()]);

        state.assign_binding(1, 0, Some("CTRL-F8".into()));
        assert_eq!(state.skip_keys(), ["CTRL-F8"]);
        assert_eq!(state.bindings.keys["SITORSTAND"], ["X"]);
        assert!(state.bindings.engine_writes.is_empty());
        assert_eq!(
            state.engine_writes,
            [(native_bindings::SKIP_CVAR.to_owned(), "CTRL-F8".to_owned())]
        );

        state.assign_binding(1, 0, None);
        assert!(state.skip_key_label().is_none());
        assert_eq!(state.engine_writes.last().unwrap().1, "");
    }

    #[test]
    fn failed_binding_write_consumes_request_and_keeps_live_keys() {
        let unique = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_nanos();
        let home = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join(format!("../../runtime/menu-binding-tests/{unique}"));
        std::fs::create_dir_all(home.join("bindings/account.txt")).unwrap();
        let mut bindings = BindingsState::default();
        bindings
            .defaults
            .insert("MOVEFORWARD".into(), vec!["W".into(), "UP".into()]);
        bindings
            .keys
            .insert("MOVEFORWARD".into(), vec!["G".into(), "UP".into()]);
        bindings.pending = true;
        assert!(bindings.write(&home).is_err());
        assert!(!bindings.pending);
        assert_eq!(bindings.keys["MOVEFORWARD"], ["G", "UP"]);
        assert!(
            bindings.write(&home).is_ok(),
            "no pending request means no retry"
        );
        std::fs::remove_dir_all(home).unwrap();
    }

    #[test]
    fn binding_model_rereads_account_file_over_defaults() {
        let unique = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos();
        let home = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join(format!("../../runtime/menu-binding-tests/refresh-{unique}"));
        std::fs::create_dir_all(home.join("bindings")).unwrap();
        let mut bindings = BindingsState::default();
        bindings.defaults.insert("JUMP".into(), vec!["SPACE".into()]);
        bindings.defaults.insert("MOVEFORWARD".into(), vec!["W".into()]);
        assert_eq!(bindings.account_keys(Some(&home)), bindings.defaults);
        std::fs::write(home.join("bindings/account.txt"), "bind JUMP G\n").unwrap();
        bindings.keys = bindings.account_keys(Some(&home));
        assert_eq!(bindings.keys["JUMP"], ["G"]);
        std::fs::write(home.join("bindings/account.txt"), "bind JUMP H\nbind MOVEFORWARD E\n").unwrap();
        let refreshed = bindings.account_keys(Some(&home));
        assert_eq!(refreshed["JUMP"], ["H"]);
        assert_eq!(refreshed["MOVEFORWARD"], ["E"]);
        std::fs::remove_file(home.join("bindings/account.txt")).unwrap();
        std::fs::create_dir(home.join("bindings/account.txt")).unwrap();
        assert_eq!(bindings.account_keys(Some(&home)), bindings.defaults,
            "The native account reader falls back to defaults after a read failure");
        std::fs::remove_dir_all(home).unwrap();
    }

    #[test]
    fn custom_binding_file_commit_does_not_require_a_live_vm() {
        let unique = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos();
        let home = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join(format!("../../runtime/menu-binding-tests/no-vm-{unique}"));
        let mut state = isolated_options();
        state.state_home = Some(home.clone());
        state.bindings.engine_connected = true;
        state.bindings.defaults.insert("JUMP".into(), vec!["SPACE".into()]);
        state.bindings.keys.insert("JUMP".into(), vec!["G".into()]);
        state.bindings.pending = true;
        let mut app = App::new();
        app.insert_resource(state).add_systems(Update, save_bindings);
        app.update();
        assert!(std::fs::read_to_string(home.join("bindings/account.txt")).unwrap().contains("bind JUMP G\n"));
        assert!(!app.world().resource::<OptionsState>().bindings.pending);
        std::fs::remove_dir_all(home).unwrap();
    }
}

/// Retain the native focus scroll offset when the open Options view rebuilds.
pub(crate) fn device_scroll_position(world: &mut World, position: f32) {
    let mut state = world.resource_mut::<OptionsState>();
    if state.open {
        state.scroll = position;
    }
}

/// Device focus steps the same descriptor and write route as a pointer drag.
/// Called before Options input; no separate values, persistence or callbacks.
pub(crate) fn device_slider(world: &mut World, entity: Entity, direction: i32) -> bool {
    let Some(index) = world.get::<Slider>(entity).map(|slider| slider.0) else { return false; };
    world.resource_scope(|world, defs: Mut<Definitions>| {
        let row = &defs.rows[index];
        let mut state = world.resource_mut::<OptionsState>();
        if !state.open || direction == 0 { return false; }
        let current = state.value(row).or(row.default.as_deref()).map(|v| row.displayed(v)).unwrap_or(row.range[0]);
        let value = device_slider_value(row.range, current, direction);
        state.set(row, slider_string(row, value));
        true
    })
}

// Current 14011dadb..14011db04 uses one twentieth of the range for
// a nonpositive/NaN step, before the ordinary write route. All current
// descriptors happen to have positive steps.
fn device_slider_value(range: [f32; 3], current: f32, direction: i32) -> f32 {
    let [min, max, step] = range;
    let step = if step > 0. { step } else { (max - min) / 20. };
    (current + direction as f32 * step).clamp(min, max)
}
