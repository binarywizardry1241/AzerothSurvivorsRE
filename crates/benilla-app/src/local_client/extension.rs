//! Embedding-owned Lua/CVar extension over the real client VM lifecycle.
use super::*;

/// A core-file transformation supplied by an embedding. The existing provider
/// owns file lookup and chunk identity; the embedding owns the actual format.
#[derive(Clone)]
pub struct LocalCoreScriptTransform {
    pub path: String,
    pub payload: String,
    pub apply: fn(&[u8], &str) -> Vec<u8>,
}

#[derive(Resource, Clone, Default)]
pub struct LocalClientExtension {
    /// Optional embedding transformation of the raw CreatureSoundData table,
    /// before the ordinary shared voice catalog parses it. Rejection retains
    /// the original table; the embedding never changes the player's archive.
    pub creature_sound_data_patch: Option<fn(&[u8]) -> Option<Vec<u8>>>,
    /// Exact embedding-owned creature names over authoritative GUIDs, supplied
    /// without inventing creature-template metadata for custom local actors.
    pub unit_names: Vec<(u64, String)>,
    /// Custom embedding UI participates in the production mouse owner arbiter.
    /// OR hover/drag capture in OverlayCapture/OverlayInput before mouse routing.
    pub pointer_over_ui: bool,
    /// Optional VM string global listing comma-separated frame names whose
    /// subtrees paint above embedding screens and retain their ordinary input.
    pub on_top_frames_global: Option<String>,
    /// This frame's actual UI hit, or one of its ancestors, is registered above
    /// the embedding screens. Embeddings yield their pointer controls to it.
    pub on_top_pointer: bool,
    /// A custom key-binding editor owns new input this frame. The host still
    /// delivers releases so a command held before capture receives its Stop.
    pub binding_capture: bool,
    /// Own unfocused Escape before the Lua key/binding walk for the embedding's
    /// custom menu. A stock GameMenuFrame opening also hands off before paint.
    pub custom_game_menu: bool,
    pub cvar_defaults: Vec<(String, String)>,
    /// Queued through the ordinary registry, never a parallel config store.
    pub cvar_writes: Vec<(String, String)>,
    /// Selected custom Options globals, with true for Lua 1/nil toggles.
    /// The owning FrameXML saved-variable reader seats these at VM startup.
    pub option_globals: Vec<(String, bool)>,
    /// Exact Lua literals written by the custom Options owner. Apply only to
    /// the loaded in-game VM; discard assignments made while it is unavailable.
    pub option_global_writes: Vec<(String, String)>,
    /// Optional embedding policy for the ordinary LoggingCombat flag. Reconciled
    /// only with the active in-game VM; the existing chat logger owns its file.
    pub combat_logging: Option<bool>,
    /// Live command updates, preserving each command's key order. The engine
    /// SetBinding/SaveBindings path owns dispatch, events and persistence.
    pub binding_writes: Vec<(String, Vec<String>)>,
    pub binding_reset: bool,
    /// Complete file-derived account table from the Azeroth Survivors editor.
    /// Its account commit removes a character override without using stale VM
    /// account keys as the base for unchanged commands.
    pub account_bindings: Option<Vec<(String, Vec<String>)>>,
    /// Embedding-owned core commands, appended after FrameXML's Bindings.xml
    /// and before any addons, including on ReloadUI.
    pub binding_commands: Vec<benilla_ui::bindings_xml::Binding>,
    /// Added to set 0 before account/character overrides are resolved. These
    /// are defaults, never a per-frame SetBinding that defeats a user rebind.
    pub binding_defaults: Vec<benilla_ui::script::keybind::KeyBinding>,
    /// Installed before FrameXML/addons, including after ReloadUI.
    pub script_prelude: String,
    /// Lua appended to named core FrameXML files before their normal chunk load.
    /// Applies to direct TOC entries and XML Script includes, before addons and
    /// again on ReloadUI; never writes the player's files or patches GlueXML.
    pub framexml_appends: Vec<(String, String)>,
    /// Applied to matching GlueXML core reads before their normal chunk load,
    /// including a replacement glue VM. No underlying archive/file is written.
    pub glue_transforms: Vec<LocalCoreScriptTransform>,
    /// Installed once after FrameXML/addons, including after ReloadUI. For
    /// embedding extensions that wrap actual stock functions and frames.
    pub script_postlude: String,
    /// Authoritative state publication after the normal player feed.
    pub script_update: String,
    /// Optional string counter emitted by the embedding game's talent binding.
    /// A fresh VM's first value establishes the baseline without opening a screen.
    pub talent_toggle_counter: Option<String>,
}

/// Registered embedding CVars outlive the VM. Menu changes must reach the
/// ordinary registry/save owner even before a character enters the world.
pub(crate) fn register(world: &mut World) {
    sync_names(world);
    if !world.contains_resource::<crate::cvars::Cvars>() { return; }
    let (defaults, writes) = {
        let Some(mut extension) = world.get_resource_mut::<LocalClientExtension>() else { return; };
        (extension.cvar_defaults.clone(), std::mem::take(&mut extension.cvar_writes))
    };
    let mut cvars = world.resource_mut::<crate::cvars::Cvars>();
    for (name, value) in defaults { cvars.learn_addon_row(&name, &value); }
    for (name, value) in writes { cvars.set(&name, &value); }
}

#[derive(Resource, Default)]
struct ExtensionNames(Vec<u64>);

fn sync_names(world: &mut World) {
    let names=world.get_resource::<LocalClientExtension>()
        .map(|extension|extension.unit_names.clone()).unwrap_or_default();
    world.init_resource::<ExtensionNames>();
    let old=std::mem::replace(&mut world.resource_mut::<ExtensionNames>().0,
        names.iter().map(|(guid,_)|*guid).collect());
    if let Some(mut cache)=world.get_resource_mut::<crate::names::NameCache>() {
        for guid in old {
            if !names.iter().any(|(current,_)|*current==guid) {cache.set_local_name(guid,None);}
        }
        for (guid,name) in names {cache.set_local_name(guid,Some(&name));}
    }
}

pub(crate) fn seed(world: &mut World, script: &mut UiScript) {
    let Some(extension) = world.get_resource::<LocalClientExtension>().cloned() else {
        return;
    };
    if let Some(mut cvars) = world.get_resource_mut::<crate::cvars::Cvars>() {
        for (name, default) in &extension.cvar_defaults {
            cvars.learn_addon_row(name, default);
        }
        cvars.seed_vm(script);
    }
    if !extension.script_prelude.is_empty() {
        if let Err(error) = script.run(&extension.script_prelude) {
            error!("local client extension initialization failed: {error}");
        }
    }
}

/// The current custom menu writes a global assignment to the active VM and
/// commits binding edits through the VM's own SetBinding/SaveBindings owner.
/// Called only after the in-game interface has completed its normal load.
pub(crate) fn apply_options(script: &mut UiScript, extension: &mut LocalClientExtension) {
    if let Some(enabled) = extension.combat_logging {
        if script.logging_flags().1 != enabled {
            let command = if enabled { "if LoggingCombat then LoggingCombat(1) end" } else { "if LoggingCombat then LoggingCombat(nil) end" };
            if let Err(error) = script.run(command) {
                warn!("local client combat logging: {error}");
            }
        }
    }
    for (name, literal) in std::mem::take(&mut extension.option_global_writes) {
        if !extension.option_globals.iter().any(|(known, _)| known == &name) { continue; }
        if let Err(error) = script.run(&format!("{name} = {literal}")) {
            warn!("local client Options global {name}: {error}");
        }
    }
    if std::mem::take(&mut extension.binding_reset) {
        if let Err(error) = script.run("LoadBindings(0); SaveBindings(GetCurrentBindingSet())") {
            warn!("local client binding Defaults: {error}");
        }
    }
    for (command, keys) in std::mem::take(&mut extension.binding_writes) {
        let mut source = format!(
            "for _, key in ipairs({{GetBindingKey({command:?})}}) do SetBinding(key) end\n"
        );
        for key in keys {
            source.push_str(&format!("SetBinding({key:?}, {command:?})\n"));
        }
        source.push_str("SaveBindings(GetCurrentBindingSet())");
        if let Err(error) = script.run(&source) {
            warn!("local client binding {command}: {error}");
        }
    }
}

fn apply_account_bindings(script: &mut UiScript, extension: &mut LocalClientExtension) {
    let Some(bindings) = extension.account_bindings.take() else { return; };
    let keys = bindings.into_iter().flat_map(|(command, keys)| {
        keys.into_iter().map(move |key| (key, command.clone()))
    }).collect();
    script.seed_binding_set(1, Some(keys));
    script.seed_binding_set(2, None);
    script.load_binding_set(1);
}

pub(crate) fn discard_inactive_account_bindings(mut extension: ResMut<LocalClientExtension>) {
    extension.account_bindings = None;
}

pub(crate) fn flush_options(
    mut vm: crate::script_calls::HostedVm,
    mut extension: ResMut<LocalClientExtension>,
    files: Res<crate::bindings::BindingFiles>,
) {
    vm.run(|script| {
        if let Some(script) = script {
            apply_options(script, &mut extension);
            if extension.account_bindings.is_some() {
                crate::bindings::remove_character_override(&files);
                apply_account_bindings(script, &mut extension);
            }
        } else {
            extension.option_global_writes.clear();
            extension.account_bindings = None;
        }
    });
}

/// The native Options writer commits the file, then tests the current UI before
/// assigning its global. An unavailable UI never inherits these writes later.
pub(crate) fn discard_inactive_option_globals(mut extension: ResMut<LocalClientExtension>) {
    extension.option_global_writes.clear();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn menu_defaults_keep_character_set_and_edits_use_live_binding_store() {
        let mut script = UiScript::new().unwrap();
        script.set_default_bindings(vec![("SPACE".into(), "JUMP".into())]);
        script.seed_binding_set(2, Some(vec![("F".into(), "JUMP".into())]));
        script.load_binding_set(2);
        let mut extension = LocalClientExtension { binding_reset: true, ..Default::default() };
        apply_options(&mut script, &mut extension);
        assert_eq!(script.current_binding_set(), 2);
        assert_eq!(script.binding_keys(), vec![("SPACE".into(), "JUMP".into())]);
        assert_eq!(script.take_keybind_requests(), vec![benilla_ui::script::keybind::KeybindRequest::Save(2)]);
        extension.binding_writes.push(("JUMP".into(), vec!["G".into(), "UP".into()]));
        apply_options(&mut script, &mut extension);
        assert_eq!(script.binding_keys(), vec![("G".into(), "JUMP".into()), ("UP".into(), "JUMP".into())]);
        assert_eq!(script.current_binding_set(), 2);
        assert!(extension.binding_writes.is_empty());
    }

    #[test]
    fn custom_menu_edit_publishes_the_file_derived_account_table() {
        let mut script = UiScript::new().unwrap();
        script.set_default_bindings(vec![("SPACE".into(), "JUMP".into())]);
        script.seed_binding_set(1, Some(vec![("SPACE".into(), "JUMP".into()), ("V".into(), "MOVEFORWARD".into())]));
        script.seed_binding_set(2, Some(vec![("F".into(), "JUMP".into()), ("R".into(), "MOVEFORWARD".into())]));
        script.load_binding_set(2);
        let mut extension = LocalClientExtension { account_bindings: Some(vec![("MOVEFORWARD".into(), vec!["W".into()]), ("JUMP".into(), vec!["G".into()])]), ..Default::default() };
        apply_account_bindings(&mut script, &mut extension);
        assert_eq!(script.binding_keys(), vec![("W".into(), "MOVEFORWARD".into()), ("G".into(), "JUMP".into())]);
        assert_eq!(script.current_binding_set(), 1);
        assert!(!script.character_bindings_exist());
        assert!(script.take_keybind_requests().is_empty(), "The custom owner already wrote the account file once");
    }

    #[test]
    fn inactive_custom_account_request_does_not_defer_or_drop_generic_edits() {
        let mut app = App::new();
        app.insert_resource(LocalClientExtension {
            account_bindings: Some(vec![("JUMP".into(), vec!["G".into()])]),
            binding_writes: vec![("JUMP".into(), vec!["H".into()])],
            binding_reset: true,
            ..Default::default()
        }).add_systems(Update, discard_inactive_account_bindings);
        app.update();
        let extension = app.world().resource::<LocalClientExtension>();
        assert!(extension.account_bindings.is_none());
        assert_eq!(extension.binding_writes, vec![("JUMP".into(), vec!["H".into()])]);
        assert!(extension.binding_reset);
    }

    #[test]
    fn vm_global_writes_preserve_string_and_one_or_nil_types() {
        let mut script = UiScript::new().unwrap();
        let mut extension = LocalClientExtension {
            option_globals: vec![("SHOW_COMBAT_TEXT".into(), false), ("NAMEPLATES_ON".into(), true)],
            option_global_writes: vec![("SHOW_COMBAT_TEXT".into(), "\"0\"".into()),
                ("NAMEPLATES_ON".into(), "1".into())], ..Default::default()
        };
        apply_options(&mut script, &mut extension);
        script.run("assert(type(SHOW_COMBAT_TEXT) == 'string'); assert(SHOW_COMBAT_TEXT == '0'); assert(NAMEPLATES_ON == 1)").unwrap();
        extension.option_global_writes.push(("NAMEPLATES_ON".into(), "nil".into()));
        apply_options(&mut script, &mut extension);
        script.run("assert(NAMEPLATES_ON == nil)").unwrap();
    }

    #[test]
    fn replacement_vm_receives_api_and_saved_registry_values() {
        let mut world = World::new();
        world.insert_resource(crate::cvars::Cvars::with_value("storeLevels", "1"));
        world.insert_resource(LocalClientExtension {
            cvar_defaults: vec![
                ("storeLevels".into(), "0".into()),
                ("spendLevels".into(), "0".into()),
            ],
            script_prelude: "function AZS_StoredTest() return GetCVar('storeLevels') end".into(),
            ..Default::default()
        });
        for _ in 0..2 {
            let mut script = UiScript::new().unwrap();
            seed(&mut world, &mut script);
            script
                .run("assert(AZS_StoredTest() == '1'); assert(GetCVar('spendLevels') == '0')")
                .unwrap();
        }
        assert_eq!(
            world.resource::<crate::cvars::Cvars>().get("storeLevels"),
            Some("1")
        );
    }
}
