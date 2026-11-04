//! Offline embedding of the production client controller and FrameXML host.
//!
//! The embedding application supplies authoritative game state; no socket worker is started.
//! The client still loads the user's real 1.12 interface, textures and Lua through its normal
//! world-entry lifecycle. This is independent of the developer capture and UI demonstration paths.

use benilla_ui::script::{PlayerRecord, ScriptValue, UiScript, UnitGuids};
use bevy::prelude::*;

mod actors;
mod device;
pub(crate) mod spell_scales;
pub(crate) mod spell_settings;
pub use spell_scales::{LocalSpellScale, LocalSpellScales};
pub use device::{device_cvar, touch_over_interface, LocalDeviceInput, LocalTouchPointer};
pub(crate) mod movement;
pub use movement::LocalUnitPath;
pub mod events;
mod requests;
mod item_descriptions;
pub use item_descriptions::{ItemInfo, ItemSpellEntry, LocalItemDescriptions};
mod item_sets;
pub use item_sets::LocalItemSets;
mod spell_descriptions;
pub use spell_descriptions::{LocalSpellDescription, LocalSpellDescriptions};
mod stock_frontend;
pub use stock_frontend::{LocalStockCharacter, LocalStockCreate, LocalStockEquipment, LocalStockFrontend,
    LocalStockPosition, LocalStockRealm, LocalStockReply, LocalStockRequest};
pub use requests::{LocalClientRequest, LocalClientRequests, LocalItemQueries, LocalWireRequests};
pub(crate) mod extension;
pub use crate::ui_aura::descriptor_aura_state;
pub use actors::{
    LocalActorSet, LocalActorsPlugin, LocalTargetSelection, LocalUnitBounds, LocalUnitEngineVisual,
    LocalUnitMotion, LocalUnitName, LocalUnitVisual,
};
pub use benilla_protocol::messages::UnitAuraSlot;
pub use extension::{LocalClientExtension, LocalCoreScriptTransform};

pub use crate::player::local::{
    LocalCorrectionRequest, LocalEquipmentDisplay, LocalEquipmentMetadata, LocalMovementReport,
    LocalMovementReports, LocalPlayerCorrection, LocalPlayerEquipment,
    LocalPlayerEquipmentMetadata, LocalPlayerPlugin, LocalPlayerPose, LocalPlayerRequest,
    LocalPlayerSet, LocalPlayerSpawn,
};
/// Production menu music commands, handled by the existing client mixer and MPQ decoder.
pub use crate::sound::GlueMusicRequest as LocalMenuMusic;
/// Current custom-menu character request, rendered by the shared streamed booth.
pub use benilla_protocol::CharEnumItem as LocalHeroEquipment;
pub use crate::portrait::hero_booth::{LocalHeroLook, LocalHeroPreview, LocalHeroPreviewOutput, LocalHeroPreviewSet};
/// The actual interface compositor camera, also Bevy UI's default camera.
pub use crate::ui_pass::PlayerUiCamera;
pub use crate::client_state::LocalMenuSceneActive;
pub use crate::loading_screen::local::LocalLoadingScreen;
/// The same layout-aware key names used by the real binding dispatcher.
pub use crate::bindings::layout::LayoutNames as LocalBindingNames;
pub use benilla_protocol::ObjectFields;
pub use benilla_ui::script::{
    ActionUse, AuraState, ScriptCall, SessionRequest, SpellBookState, UnitState,
};

/// The installed client's locale used by FrameXML and localized TOC metadata.
/// This is independent of an embedding application's custom-menu language.
pub fn client_locale_index() -> usize {
    crate::ui_script::client_locale().index()
}

/// Device-local wall-clock hour (0–23) and minute.
pub fn local_hour_minute() -> (u32, u32) {
    let [_, _, hour, minute, _, _] = crate::ui_chat::logging::local_now();
    (hour, minute)
}

/// Installs on top of Bevy's default plugins and `benilla_world::WorldPlugins`.
/// The parent application starts a session through [`LocalClientSession`]. Its
/// custom menu is the default; [`LocalStockFrontend`] opts into real GlueXML.
pub struct LocalClientPlugin;

/// Ordering hooks for an embedding application's authoritative state and input consumers.
#[derive(SystemSet, Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum LocalClientSet {
    Lifecycle,
    Feed,
    Input,
    /// Custom Options writes after its input/snapshot, before the real binding
    /// save drain and shutdown. Embeddings order their Options input before it.
    Options,
    /// Stateless embedding hover capture before FrameXML routes this frame's click.
    OverlayCapture,
    /// Embedding overlays publish pointer capture after client input snapshots.
    OverlayInput,
}

/// The embedding owns in-world authority and no network worker runs. Without
/// [`LocalStockFrontend`], it also owns the frontend and suppresses GlueXML.
#[derive(Resource)]
pub(crate) struct LocalClientMode;

#[derive(Resource, Default)]
pub(crate) struct LocalUiCalls {
    pub(crate) session: std::sync::Mutex<Vec<SessionRequest>>,
    pub(crate) cancel_aura: std::sync::Mutex<Vec<u32>>,
}

impl Plugin for LocalClientPlugin {
    fn build(&self, app: &mut App) {
        item_descriptions::install(app);
        spell_descriptions::install(app);
        app.add_systems(Update, item_sets::feed.in_set(crate::ui_script::UiFeed));
        app.insert_resource(LocalClientMode)
            .init_resource::<LocalItemSets>()
            .init_resource::<LocalClientSession>()
            .init_resource::<LocalUiCalls>()
            .init_resource::<LocalClientInput>()
            .init_resource::<LocalDeviceInput>()
            .init_resource::<LocalClientExtension>()
            .init_resource::<LocalContextBinding>()
            .init_resource::<LocalFeedMemory>()
            .init_resource::<crate::BuildId>()
            .add_plugins(crate::game_plugins::GamePlugins {
                connect: false,
                start: crate::client_state::ClientState::Login,
            })
            .add_plugins(LocalPlayerPlugin)
            .add_plugins(LocalActorsPlugin)
            .add_plugins(events::LocalPresentationPlugin)
            .add_plugins(requests::LocalRequestsPlugin)
            .configure_sets(
                Update,
                LocalClientSet::OverlayCapture.before(crate::ui_script::UiInput),
            )
            .configure_sets(Update, LocalClientSet::Options.after(LocalClientSet::Input)
                .before(crate::ui_script::UiDrain))
            .add_systems(First, reset_overlay_pointer)
            .add_systems(First, extension::register.before(LocalClientSet::Lifecycle))
            .add_systems(First, follow_session.in_set(LocalClientSet::Lifecycle))
            .add_systems(
                Update,
                capture_game_menu_input.in_set(LocalClientSet::OverlayCapture),
            )
            .add_systems(Update, stock_frontend::bootstrap.before(crate::ui_script::glue_mgr::drive_glue_mgr))
            .add_systems(Update,
                (stock_frontend::startup_pick, crate::glue_session::roster::enter_run_pick)
                    .chain()
                    .after(crate::ui_script::glue_mgr::drive_glue_mgr)
                    .after(crate::ui_script::UiInput)
                    .run_if(|stock: Option<Res<LocalStockFrontend>>| stock.is_some()))
            .add_systems(
                Update,
                extension::flush_options.in_set(LocalClientSet::Options)
                    .run_if(crate::ui_script::ingame_ui_up),
            )
            .add_systems(
                Update,
                extension::discard_inactive_option_globals.in_set(LocalClientSet::Options)
                    .run_if(not(crate::ui_script::ingame_ui_up)),
            )
            .add_systems(
                Update,
                extension::discard_inactive_account_bindings.in_set(LocalClientSet::Options)
                    .run_if(not(crate::ui_script::ingame_ui_up)),
            )
            .add_systems(
                Update,
                feed_ui
                    .in_set(crate::ui_script::UiFeed)
                    .after(crate::ui_unit::UnitFeed)
                    .in_set(LocalClientSet::Feed)
                    .run_if(crate::ui_script::ingame_ui_up),
            )
            .add_systems(
                Update,
                capture_input
                    .after(crate::ui_script::UiInput)
                    .before(benilla_world::schedule::WorldStage::Input)
                    .in_set(LocalClientSet::Input),
            );
    }
}

/// Overlay capture is a per-frame union. Reset it before every Update reader,
/// then let each embedding overlay OR its current hover/drag contribution.
fn reset_overlay_pointer(
    mut extension: ResMut<LocalClientExtension>,
    mut context: ResMut<LocalContextBinding>,
) {
    extension.pointer_over_ui = false;
    extension.on_top_pointer = false;
    extension.binding_capture = false;
    context.chords.clear();
    context.pressed = false;
}

/// The character creation bytes and actual item-entry IDs, with native equipment slots 1..19.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct LocalAppearance {
    pub skin: u8,
    pub face: u8,
    pub hair_style: u8,
    pub hair_color: u8,
    pub facial_hair: u8,
    pub equipment: Vec<(u8, u32)>,
}

/// Authoritative local player state. Sex is the wire's 0 male / 1 female representation.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct LocalPlayerUi {
    pub guid: u64,
    pub name: String,
    pub race: u8,
    pub class: u8,
    pub sex: u8,
    pub display_id: u32,
    pub faction_template: u32,
    pub scale: f32,
    pub appearance: LocalAppearance,
    pub health: u32,
    pub max_health: u32,
    pub power_type: u8,
    /// Raw descriptor units (rage uses tenths); the bridge applies the existing display divisor.
    pub power: u32,
    pub max_power: u32,
    pub level: u32,
    pub xp: u32,
    pub xp_max: u32,
    pub gold: u32,
    pub rest_state: u8,
    pub rested_xp: u32,
    pub resting: bool,
}

/// The same complete5875 descriptor used by the actual local player's body.
/// Embedding transports can publish it without duplicating field ownership.
pub fn local_player_fields(player:&LocalPlayerUi)->ObjectFields {
    crate::player::local::player_fields(player)
}

#[derive(Clone, Debug, Default, PartialEq)]
pub struct LocalUnitUi {
    pub guid: u64,
    pub state: UnitState,
    pub auras: Vec<AuraState>,
}

/// Game-clock durations, reanchored onto the interface's process clock on each authoritative feed.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct LocalCooldown {
    pub remaining: f32,
    pub duration: f32,
}

impl LocalCooldown {
    pub(crate) fn ui_triple(self, ui_now: f64) -> Option<benilla_ui::script::CooldownTriple> {
        (self.remaining.is_finite() && self.remaining > 0.0
            && self.duration.is_finite() && self.duration > 0.0).then(|| {
            (
                ((ui_now - f64::from(self.duration - self.remaining)) * 1000.0).round() as i64,
                (self.duration * 1000.0).round() as u32,
                true,
            )
        })
    }
}

#[derive(Clone, Debug, Default, PartialEq)]
pub struct LocalActionUi {
    /// Lua action ID, 1..120.
    pub slot: u32,
    pub spell_id: u32,
    pub texture: Option<String>,
    pub cooldown: Option<LocalCooldown>,
    pub usable: bool,
    pub in_range: Option<bool>,
}

/// The embedding game's UI feed. Updating these snapshots does not send protocol messages.
#[derive(Resource, Default)]
pub struct LocalClientSession {
    pub active: bool,
    pub paused: bool,
    /// A confirmed SMSG_LOGOUT_COMPLETE returns the client to character select.
    /// The embedding frontend still decides whether its own picker or GlueXML
    /// owns that screen; this flag does not enable a socket or stock login.
    pub logged_out: bool,
    pub player: Option<LocalPlayerUi>,
    pub target: Option<LocalUnitUi>,
    pub actions: Vec<LocalActionUi>,
    pub auras: Vec<AuraState>,
    pub spellbook: SpellBookState,
    /// Actual known spell IDs; the normal DBC skill-line mapper builds the book unless an
    /// explicit nonempty `spellbook` snapshot is supplied.
    pub known_spells: Vec<u32>,
    pub spell_cooldowns: Vec<(u32, LocalCooldown)>,
    /// Additional native events emitted by the owning game, after its snapshots are seated.
    pub events: Vec<(String, Vec<ScriptValue>)>,
}

impl LocalClientSession {
    pub fn begin(&mut self, player: LocalPlayerUi) {
        *self = Self {
            active: true,
            player: Some(player),
            ..Default::default()
        };
    }
    pub fn end(&mut self) {
        *self = Self::default();
    }
    /// Call after delivering the authoritative logout-complete event. Preserve
    /// its character-select destination until another begin/end changes it.
    pub fn logout(&mut self) {
        *self = Self {
            logged_out: true,
            ..Self::default()
        };
    }
    pub fn set_paused(&mut self, paused: bool) {
        self.paused = paused;
    }
}

/// Native interface ownership and semantic requests. Drain requests in the authoritative game.
#[derive(Resource, Default)]
pub struct LocalClientInput {
    pub pointer_over_ui: bool,
    /// Visible FrameXML Minimap bounds, normalized `[left, top, right, bottom]`.
    pub minimap_rect: Option<[f32; 4]>,
    /// The rendered Minimap widget's `[left, top, right, bottom]` in logical
    /// window pixels; independent of the FrameXML frame's registered name.
    pub rendered_minimap_rect: Option<[f32; 4]>,
    pub keyboard_captured: bool,
    /// A fresh key press consumed by the embedding's active contextual binding.
    pub contextual_key_pressed: bool,
    pub game_menu_open: bool,
    /// A fresh embedding-owned Escape, device menu request or stock-menu opening.
    pub custom_game_menu_requested: bool,
    /// The embedding-declared talent counter changed since its previous observation.
    /// Several increments between observations still produce one toggle.
    pub talent_toggle: bool,
    /// Actual loading cover; the native custom banner clock defers while covered.
    pub loading_screen_covering: bool,
    pub consumed_keys: Vec<KeyCode>,
    pub ui_time: f64,
    /// The observed real UI VM, including replacements made by ReloadUI.
    /// Embedding publishers use this to replay unchanged snapshots to a new VM.
    pub script_session: Option<u64>,
    pub action_uses: Vec<ActionUse>,
    pub action_sets: Vec<(u32, u32)>,
    pub aura_cancels: Vec<u32>,
    pub session_requests: Vec<SessionRequest>,
    /// Ordered calls, including the same action-use calls exposed above for convenience.
    pub script_calls: Vec<ScriptCall>,
    /// Applied embedding CVars, including this input pass's accepted Lua writes.
    /// The ordinary registry drain still owns callbacks and persistence.
    pub cvars: Vec<(String, String)>,
    /// Actual registered defaults, including the engine's locale selection.
    pub cvar_defaults: Vec<(String, String)>,
    /// Staged latched values for settings controls. Gameplay continues to read
    /// the applied snapshot above until the engine commits the stage.
    pub staged_cvars: Vec<(String, String)>,
    /// Actual FrameXML globals observed after its input. Numeric plate toggles
    /// use Lua truthiness and are exposed as 1/0 for the custom controls.
    pub option_globals: Vec<(String, String)>,
    pub bindings: Option<LocalBindingsSnapshot>,
}

/// An embedding shortcut with a narrower lifetime than the normal binding map.
/// Publish the active chords in OverlayCapture before the world binding walk.
#[derive(Resource, Default)]
pub struct LocalContextBinding {
    pub chords: Vec<String>,
    pub(crate) pressed: bool,
}

#[derive(Clone, Debug, Default)]
pub struct LocalBindingsSnapshot {
    pub rows: Vec<(String, String)>,
    pub keys: Vec<(String, Vec<String>)>,
    pub defaults: Vec<(String, String)>,
    pub current_set: u32,
}

impl LocalClientInput {
    pub fn take_action_uses(&mut self) -> Vec<ActionUse> {
        std::mem::take(&mut self.action_uses)
    }
    pub fn take_script_calls(&mut self) -> Vec<ScriptCall> {
        std::mem::take(&mut self.script_calls)
    }
}

/// Queue the production host's deferred interface rebuild (the same path as `ReloadUI()`).
pub fn reload_interface(world: &mut World) {
    world.resource_mut::<crate::ui_script::ReloadUiPending>().0 = true;
}

/// Apply through the production CVar registry, including its validation, callbacks and VM mirror.
pub fn set_cvar(world: &mut World, name: &str, value: &str) -> bool {
    use crate::cvars::SetOutcome;
    world
        .get_resource_mut::<crate::cvars::Cvars>()
        .is_some_and(|mut cvars| {
            matches!(
                cvars.set(name, value),
                SetOutcome::Unchanged | SetOutcome::Staged | SetOutcome::Changed
            )
        })
}

pub(crate) fn external_menu(mode: Option<Res<LocalClientMode>>) -> bool {
    mode.is_some()
}
pub(crate) fn network_ui(mode: Option<Res<LocalClientMode>>) -> bool {
    mode.is_none()
}

fn follow_session(
    session: Res<LocalClientSession>,
    stock: Option<Res<LocalStockFrontend>>,
    state: Res<State<crate::client_state::ClientState>>,
    mut next: ResMut<NextState<crate::client_state::ClientState>>,
    mut input: ResMut<LocalClientInput>,
    mut actions: ResMut<crate::ui_action::PlayerActions>,
    spells: Option<Res<crate::ui_action::Spells>>,
    mut roster: ResMut<crate::glue_session::roster::Roster>,
    mut was_logged_out: Local<bool>,
) {
    if stock.is_some() && session.logged_out && !*was_logged_out { roster.pending_pick = None; }
    *was_logged_out = session.logged_out;
    let wanted = match stock.as_deref().filter(|_| !session.active) {
        Some(frontend) if frontend.authenticated => crate::client_state::ClientState::CharSelect,
        Some(_) => crate::client_state::ClientState::Login,
        None => session_screen(&session),
    };
    if *state.get() != wanted {
        next.set(wanted);
    }
    if !session.active {
        *input = LocalClientInput::default();
    }
    let known = session.known_spells.iter().copied().collect();
    if actions.spells != known {
        // The updated engine keeps lock openers separately, in the supplied book order.
        actions.openers.clear();
        for &spell_id in &session.known_spells {
            crate::spell::net::list_opener(spell_id, spells.as_deref(), &mut actions);
        }
        actions.spells = known;
    }
}

fn session_screen(session: &LocalClientSession) -> crate::client_state::ClientState {
    use crate::client_state::ClientState;
    if session.active && session.player.is_some() {
        ClientState::InWorld
    } else if session.logged_out {
        ClientState::CharSelect
    } else {
        ClientState::Login
    }
}

pub(crate) fn seed_player(
    script: &mut UiScript,
    player: &LocalPlayerUi,
    names: crate::ui_unit::UnitNames<'_>,
) {
    let race = names.race(player.race).map(|(a, b)| (a.into(), b.into()));
    let class = names.class(player.class).map(|(a, b)| (a.into(), b.into()));
    script.set_player_record(PlayerRecord {
        name: player.name.clone(),
        race,
        class,
        sex: player.sex + 2,
    });
    script.set_unit("player", Some(player_state(player, names)));
    script.set_player_xp(player.xp, player.xp_max);
    script.set_rest_state(player.rest_state, player.rested_xp, player.resting);
    script.set_money(u64::from(player.gold));
    script.seat_player_guid(player.guid);
}

fn player_state(player: &LocalPlayerUi, names: crate::ui_unit::UnitNames<'_>) -> UnitState {
    let race = names.race(player.race);
    let class = names.class(player.class);
    let divisor = benilla_protocol::messages::power_display_scale(u32::from(player.power_type));
    UnitState {
        exists: true,
        has_object: true,
        name: Some(player.name.clone()),
        health: player.health,
        max_health: player.max_health,
        level: player.level,
        power_type: player.power_type,
        power: player.power / divisor,
        max_power: player.max_power / divisor,
        dead: player.health == 0,
        race: race.map(|v| v.0.into()),
        race_file: race.map(|v| v.1.into()),
        class: class.map(|v| v.0.into()),
        class_file: class.map(|v| v.1.into()),
        sex: player.sex + 2,
        is_player: true,
        player_controlled: true,
        is_connected: true,
        faction_group: names.faction_group(player.race).map(str::to_owned),
        faction_group_localized: names.faction_group(player.race).map(str::to_owned),
        has_relic_slot: matches!(player.class, 2 | 7 | 11),
        ..Default::default()
    }
}

#[derive(Resource, Default)]
struct LocalFeedMemory {
    vm: u64,
    player: Option<LocalPlayerUi>,
    target: Option<LocalUnitUi>,
    actions: Vec<LocalActionUi>,
    auras: Vec<AuraState>,
    spellbook: SpellBookState,
    spell_cooldowns: Vec<(u32, Option<(i64, u32, bool)>)>,
}

fn unit_events(
    script: &mut UiScript,
    token: &str,
    previous: Option<&UnitState>,
    current: &UnitState,
) {
    let mut fire = |event: &str| script.fire_event(event, vec![ScriptValue::Str(token.into())]);
    if previous.is_none_or(|v| v.health != current.health) {
        fire("UNIT_HEALTH");
    }
    if previous.is_none_or(|v| v.max_health != current.max_health) {
        fire("UNIT_MAXHEALTH");
    }
    if previous.is_none_or(|v| v.level != current.level) {
        fire("UNIT_LEVEL");
    }
    if previous.is_none_or(|v| v.name != current.name) {
        fire("UNIT_NAME_UPDATE");
    }
    if previous.is_none_or(|v| v.power_type != current.power_type) {
        fire("UNIT_DISPLAYPOWER");
    }
    let suffix = match current.power_type {
        1 => "RAGE",
        2 => "FOCUS",
        3 => "ENERGY",
        4 => "HAPPINESS",
        _ => "MANA",
    };
    if previous.is_none_or(|v| v.power != current.power) {
        fire(&format!("UNIT_{suffix}"));
    }
    if previous.is_none_or(|v| v.max_power != current.max_power) {
        fire(&format!("UNIT_MAX{suffix}"));
    }
}

fn feed_ui(
    mut session: ResMut<LocalClientSession>,
    mut vm: crate::script_calls::VmWith<(
        Option<ResMut<'static, LocalClientExtension>>,
        Option<ResMut<'static, crate::cvars::Cvars>>,
    )>,
    clock: Res<crate::ui_script::UiClock>,
    mut memory: ResMut<LocalFeedMemory>,
    native_player: Query<(), With<crate::net::SelfPlayer>>,
    names: crate::ui_unit::NameTables,
) {
    let names = names.get();
    use benilla_ui::script::origin::{within, Origin};
    within(Origin::Allowed("local_client::feed_ui"), || vm.turn(|script, (extension, cvars)| {
        let Some(script) = script else { return };
        if let Some(mut extension) = extension {
            if let Some(mut cvars) = cvars {
                for (name, default) in &extension.cvar_defaults {
                    cvars.learn_addon_row(name, default);
                }
                for (name, value) in std::mem::take(&mut extension.cvar_writes) {
                    cvars.set(&name, &value);
                }
            }
            if !extension.script_update.is_empty() {
                if let Err(error) = script.run(&extension.script_update) {
                    error!("local client extension state publication failed: {error}");
                }
            }
        }
        let Some(player) = session.player.as_ref().filter(|_| session.active) else {
            return;
        };
        let fresh = memory.vm != script.session();
        if fresh {
            *memory = LocalFeedMemory {
                vm: script.session(),
                ..Default::default()
            };
        }
        let native_units = !native_player.is_empty();
        if !native_units {
            seed_player(script, player, names);
        }
        let state = player_state(player, names);
        let prior = memory
            .player
            .as_ref()
            .map(|player| player_state(player, names));
        if !native_units {
            unit_events(script, "player", prior.as_ref(), &state);
        }
        if !native_units
            && memory
                .player
                .as_ref()
                .is_none_or(|p| (p.xp, p.xp_max) != (player.xp, player.xp_max))
        {
            script.fire_event("PLAYER_XP_UPDATE", vec![ScriptValue::Str("player".into())]);
        }
        if !native_units && memory.player.as_ref().is_none_or(|p| p.gold != player.gold) {
            script.fire_event("PLAYER_MONEY", vec![]);
        }
        let target = session.target.as_ref();
        if let Some(target) = target {
            script.set_unit("target", Some(target.state.clone()));
            let mut guids = UnitGuids {
                player: player.guid,
                target: target.guid,
                ..Default::default()
            };
            guids.held.insert(player.guid, target.guid);
            guids.held.insert(target.guid, 0);
            script.set_unit_by_guid(target.guid, Some(target.state.clone()));
            script.set_unit_auras(target.guid, Some(target.auras.clone().into()));
            unit_events(
                script,
                "target",
                memory.target.as_ref().map(|v| &v.state),
                &target.state,
            );
            script.set_unit_guids(&guids);
            if memory.target.as_ref().map(|v| v.guid) != Some(target.guid) {
                script.fire_event("PLAYER_TARGET_CHANGED", vec![]);
            }
            if memory.target.as_ref().map(|v| &v.auras) != Some(&target.auras) {
                script.fire_event("UNIT_AURA", vec![ScriptValue::Str("target".into())]);
            }
        }
        script.set_player_auras(session.auras.clone());
        if fresh || memory.auras != session.auras {
            script.fire_event("PLAYER_AURAS_CHANGED", vec![]);
            script.fire_event("UNIT_AURA", vec![ScriptValue::Str("player".into())]);
        }
        if !session.spellbook.tabs.is_empty() || !session.spellbook.slots.is_empty() {
            script.set_spellbook(session.spellbook.clone());
            if fresh || memory.spellbook != session.spellbook {
                script.fire_event("SPELLS_CHANGED", vec![]);
            }
        } else {
            let cooldowns = session.spell_cooldowns.iter()
                .map(|(spell, cooldown)| (*spell, cooldown.ui_triple(clock.ui_now)))
                .collect::<Vec<_>>();
            if memory.spell_cooldowns != cooldowns {
                script.fire_event("SPELL_UPDATE_COOLDOWN", vec![]);
            }
            memory.spell_cooldowns = cooldowns;
        }
        memory.player = Some(player.clone());
        memory.target = session.target.clone();
        memory.actions = session.actions.clone();
        memory.auras = session.auras.clone();
        memory.spellbook = session.spellbook.clone();
        if fresh && !native_units {
            script.fire_world_enter();
        }
        for (event, args) in std::mem::take(&mut session.events) {
            script.fire_event(&event, args);
        }
    }));
}

/// The selected AS input filter owns Escape before the Lua key/binding walk.
/// The preceding UI typing snapshot retains its ordinary Escape handler;
/// addons may replace ToggleGameMenu or hide GameMenuFrame independently.
/// See the 0.112.5 producer/consumer proof in escape-game-menu-2026-10-23.md.
fn capture_game_menu_input(
    session: Res<LocalClientSession>,
    extension: Res<LocalClientExtension>,
    capture: Res<crate::ui_script::UiKeyboardCapture>,
    mut keyboard: ResMut<Messages<bevy::input::keyboard::KeyboardInput>>,
    mut input: ResMut<LocalClientInput>,
    mut reader: Local<bevy::ecs::message::MessageCursor<bevy::input::keyboard::KeyboardInput>>,
) {
    input.custom_game_menu_requested = false;
    // Observe fresh events even while inactive/typing. A retained Escape that
    // closed an EditBox must not become a new menu request after focus clears.
    let fresh: Vec<_> = reader.read(&keyboard)
        .map(|event| (event.key_code, event.state, event.repeat)).collect();
    if !session.active || !extension.custom_game_menu || capture.typing {
        return;
    }
    if !fresh.iter().any(|(key, _, _)| *key == KeyCode::Escape) {
        return;
    }
    input.custom_game_menu_requested = fresh.iter().any(|(key, state, repeat)|
        *key == KeyCode::Escape && *state == bevy::input::ButtonState::Pressed && !*repeat);
    // Drain both buffers and republish survivors, as the native filter does.
    // Advancing a single reader would still let the addon binding see Escape.
    let retained: Vec<_> = keyboard.drain()
        .filter(|event| event.key_code != KeyCode::Escape).collect();
    keyboard.write_batch(retained);
    reader.clear(&keyboard);
}

pub(crate) fn handoff_stock_game_menu(script: &UiScript) -> bool {
    if let Err(error) = script.run("GameMenuFrame:Hide()") {
        warn!("local custom game menu handoff failed: {error}");
        return false;
    }
    true
}

fn capture_input(
    session: Res<LocalClientSession>,
    pointer: Res<crate::ui_script::PointerOverUi>,
    keyboard: Res<crate::ui_script::UiKeyboardCapture>,
    clock: Res<crate::ui_script::UiClock>,
    mut vm: crate::script_calls::HostedVm,
    mut input: ResMut<LocalClientInput>,
    mut reload: ResMut<crate::ui_script::ReloadUiPending>,
    extension: Res<LocalClientExtension>,
    cvars: Option<Res<crate::cvars::Cvars>>,
    loading: Option<Res<crate::loading_screen::LoadingScreen>>,
    mut talent_counter: Local<TalentToggleCounter>,
    calls: Option<Res<LocalUiCalls>>,
    minimap: Option<Res<crate::minimap::MinimapWidget>>,
    device: Option<Res<LocalDeviceInput>>,
    context: Option<Res<LocalContextBinding>>,
) {
    input.talent_toggle = false;
    input.custom_game_menu_requested |= device.as_ref().is_some_and(|device| device.menu_requested);
    input.minimap_rect = None;
    input.rendered_minimap_rect = if session.active {
        minimap.as_ref().and_then(|widget| widget.0.as_ref()).map(|slot|
            [slot.rect.min.x, slot.rect.min.y, slot.rect.max.x, slot.rect.max.y])
    } else { None };
    if !session.active {
        *talent_counter = TalentToggleCounter::default();
    }
    input.loading_screen_covering = loading.is_some_and(|loading| loading.covering());
    input.pointer_over_ui = session.active && pointer.0;
    input.keyboard_captured = session.active && keyboard.typing;
    input.contextual_key_pressed = session.active && context.is_some_and(|context| context.pressed);
    input.consumed_keys.clone_from(&keyboard.consumed);
    input.ui_time = clock.ui_now;
    input.script_session = None;
    input.option_globals.clear();
    input.bindings = None;
    input.cvars = cvars.as_deref().map_or_else(Vec::new, |cvars| {
        extension
            .cvar_defaults
            .iter()
            .filter_map(|(name, _)| {
                cvars
                    .get(name)
                    .map(|value| (name.clone(), value.to_owned()))
            })
            .collect()
    });
    input.staged_cvars = cvars.as_deref().map_or_else(Vec::new, |cvars| {
        extension.cvar_defaults.iter().filter_map(|(name, _)| {
            cvars.row(name).and_then(|row| row.pending.as_ref())
                .map(|value| (name.clone(), value.clone()))
        }).collect()
    });
    input.cvar_defaults = cvars.as_deref().map_or_else(Vec::new, |cvars| {
        extension.cvar_defaults.iter().filter_map(|(name, _)| {
            cvars.row(name).map(|row| (name.clone(), row.default.clone()))
        }).collect()
    });
    vm.run(|script| {
        if let Some(script) = script {
            // The input pass can run SetCVar after the registry snapshot above.
            // Expose its accepted getter value before the embedding presents
            // its HUD, without taking writes away from the ordinary drain.
            // Quiet VM rows leave newer host registry values intact.
            for (name, value) in &mut input.cvars {
                if let Some(applied) = script.unflushed_cvar(name) {
                    *value = applied;
                }
            }
            input.script_session = Some(script.session());
            if session.active {
                for (name, toggle) in &extension.option_globals {
                    let value = if *toggle {
                        if script.eval::<bool>(&format!("return not not {name}")).unwrap_or(false) { "1" } else { "0" }.into()
                    } else { script.global_text(name) };
                    input.option_globals.push((name.clone(), value));
                }
                let commands = script.eval::<Vec<String>>(
                    "local t = {} for i = 1, GetNumBindings() do t[i] = GetBinding(i) end return t"
                ).unwrap_or_default();
                input.bindings = Some(LocalBindingsSnapshot {
                    rows: commands.into_iter().map(|name| {
                        let label = script.global_text(&format!("BINDING_{}{}",
                            if name.starts_with("HEADER_") { "" } else { "NAME_" }, name));
                        (name, label)
                    }).collect(),
                    keys: script.keybind_snapshot(), defaults: script.default_bindings(),
                    current_set: script.current_binding_set(),
                });
            }
            input.game_menu_open = session.active && script.frame_visible("GameMenuFrame");
            if session.active { input.minimap_rect = script.named_frame_normalized_rect("Minimap"); }
            if input.game_menu_open && extension.custom_game_menu && handoff_stock_game_menu(script) {
                input.custom_game_menu_requested = true;
                input.game_menu_open = false;
            }
            if session.active {
                if let Some(name) = extension.talent_toggle_counter.as_deref() {
                    if let Ok(value) = script.lua().globals().get::<String>(name) {
                        input.talent_toggle = talent_counter.observe(script.session(), value);
                    }
                }
            }
            // Action writes go through the ordinary PlayerActions/SetActionButton
            // owner. Draining them here would race it and discard client bindings.
            input
                .aura_cancels
                .extend(script.take_cancel_aura_requests());
            let mut requests = script.take_session_requests();
            if let Some(calls) = calls.as_ref() {
                requests.extend(calls.session.lock().unwrap().drain(..));
                input.aura_cancels.extend(calls.cancel_aura.lock().unwrap().drain(..));
            }
            for request in requests {
                if request == SessionRequest::ReloadUi {
                    reload.0 = true;
                }
                input.session_requests.push(request);
            }
        }
    });
}

/// Current custom watcher compares the stored strings rather than parsing a delta.
/// VM identity also prevents a reload's reset counter from becoming a fresh request.
#[derive(Default)]
struct TalentToggleCounter {
    vm: Option<u64>,
    value: Option<String>,
}

impl TalentToggleCounter {
    fn observe(&mut self, vm: u64, value: String) -> bool {
        let changed = self.vm == Some(vm)
            && self
                .value
                .as_ref()
                .is_some_and(|previous| *previous != value);
        self.vm = Some(vm);
        self.value = Some(value);
        changed
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn custom_escape_does_not_require_a_stock_or_addon_menu_frame() {
        use bevy::input::{ButtonState, keyboard::{Key, KeyboardInput}};
        let mut world = World::new();
        let mut session = LocalClientSession::default();
        session.begin(character());
        world.insert_resource(session);
        world.insert_resource(LocalClientExtension { custom_game_menu: true, ..default() });
        world.init_resource::<LocalClientInput>();
        world.init_resource::<crate::ui_script::UiKeyboardCapture>();
        world.init_resource::<Messages<KeyboardInput>>();
        let script = UiScript::new().unwrap();
        script.run("GameMenuFrame = nil; function ToggleGameMenu() error('addon replacement must not run') end").unwrap();
        world.insert_non_send_resource(script);
        let system = world.register_system(capture_game_menu_input);
        let key = |code, state, repeat| KeyboardInput {
            key_code: code, state, repeat, text: None,
            logical_key: Key::Unidentified(bevy::input::keyboard::NativeKey::Unidentified),
            window: Entity::PLACEHOLDER,
        };
        // Include both native message buffers, and preserve an unrelated key.
        world.write_message(key(KeyCode::Escape, ButtonState::Pressed, false));
        world.resource_mut::<Messages<KeyboardInput>>().update();
        world.write_message(key(KeyCode::KeyW, ButtonState::Pressed, false));
        world.run_system(system).unwrap();
        assert!(world.resource::<LocalClientInput>().custom_game_menu_requested);
        let retained: Vec<_> = world.resource_mut::<Messages<KeyboardInput>>().drain().collect();
        assert_eq!(retained.len(), 1);
        assert_eq!(retained[0].key_code, KeyCode::KeyW);
        for (state, repeat) in [(ButtonState::Pressed, true), (ButtonState::Released, false)] {
            world.write_message(key(KeyCode::Escape, state, repeat));
            world.run_system(system).unwrap();
            assert!(!world.resource::<LocalClientInput>().custom_game_menu_requested);
            assert!(world.resource::<Messages<KeyboardInput>>().is_empty());
        }
        // An EditBox retains its Lua close/cancel path, and an inactive client
        // never takes ownership away from glue or an ordinary client.
        world.non_send_resource::<UiScript>()
            .run("box = CreateFrame('EditBox'); box:SetFocus()").unwrap();
        assert!(world.non_send_resource::<UiScript>().has_keyboard_focus());
        world.resource_mut::<crate::ui_script::UiKeyboardCapture>().typing = true;
        world.write_message(key(KeyCode::Escape, ButtonState::Pressed, false));
        world.run_system(system).unwrap();
        assert!(!world.resource::<LocalClientInput>().custom_game_menu_requested);
        assert_eq!(world.resource::<Messages<KeyboardInput>>().len(), 1);
        world.non_send_resource::<UiScript>().run("box:ClearFocus()").unwrap();
        world.resource_mut::<crate::ui_script::UiKeyboardCapture>().typing = false;
        world.resource_mut::<Messages<KeyboardInput>>().update();
        world.run_system(system).unwrap();
        assert!(!world.resource::<LocalClientInput>().custom_game_menu_requested,
            "the previous typing press cannot reopen a menu after focus clears");
        world.resource_mut::<Messages<KeyboardInput>>().clear();
        world.resource_mut::<LocalClientSession>().end();
        world.write_message(key(KeyCode::Escape, ButtonState::Pressed, false));
        world.run_system(system).unwrap();
        assert!(!world.resource::<LocalClientInput>().custom_game_menu_requested);
        assert_eq!(world.resource::<Messages<KeyboardInput>>().len(), 1);
    }

    #[test]
    fn embedding_logout_keeps_character_select_until_the_next_session() {
        use crate::client_state::ClientState;
        let mut session = LocalClientSession::default();
        assert_eq!(session_screen(&session), ClientState::Login);
        session.begin(LocalPlayerUi::default());
        assert_eq!(session_screen(&session), ClientState::InWorld);
        session.logout();
        assert!(!session.active);
        assert!(session.player.is_none());
        assert_eq!(session_screen(&session), ClientState::CharSelect);
        assert_eq!(session_screen(&session), ClientState::CharSelect);
        session.begin(LocalPlayerUi::default());
        assert!(!session.logged_out);
        assert_eq!(session_screen(&session), ClientState::InWorld);
        session.end();
        assert_eq!(session_screen(&session), ClientState::Login);
    }

    #[test]
    fn embedding_talent_counter_uses_first_observation_and_string_change_rules() {
        let mut counter = TalentToggleCounter::default();
        assert!(!counter.observe(1, "0".into()));
        assert!(!counter.observe(1, "0".into()));
        assert!(
            counter.observe(1, "7".into()),
            "several native increments toggle once"
        );
        assert!(!counter.observe(1, "7".into()));
        assert!(
            counter.observe(1, "07".into()),
            "the watcher compares strings"
        );
        assert!(
            !counter.observe(2, "0".into()),
            "a replacement VM only establishes its baseline"
        );
        assert!(counter.observe(2, "1".into()));
    }

    fn character() -> LocalPlayerUi {
        LocalPlayerUi {
            guid: 1,
            name: "LocalMage".into(),
            race: 7,
            class: 8,
            sex: 1,
            health: 37,
            max_health: 100,
            level: 3,
            xp: 8,
            xp_max: 17,
            gold: 23,
            rest_state: 2,
            ..Default::default()
        }
    }

    #[test]
    fn identity_is_available_before_any_framexml_load() {
        let mut script = UiScript::new().unwrap();
        let names = crate::ui_unit::TestNames::english();
        seed_player(&mut script, &character(), names.names());
        script.run("assert(UnitName('player') == 'LocalMage'); local r,rf=UnitRace('player'); assert(r=='Gnome' and rf=='Gnome'); local c,cf=UnitClass('player'); assert(c=='Mage' and cf=='MAGE'); assert(UnitSex('player')==3); assert(UnitHealth('player')==37); assert(UnitHealthMax('player')==100); assert(UnitXP('player')==8); assert(UnitXPMax('player')==17); assert(GetMoney()==23); assert(GetRestState()==2); assert(GetXPExhaustion()==nil)").unwrap();
    }

    #[test]
    fn local_identity_reads_the_installed_locale_tables() {
        let mut script = UiScript::new().unwrap();
        let names = crate::ui_unit::TestNames::korean();
        seed_player(&mut script, &character(), names.names());
        assert_eq!(
            script.eval::<String>("return UnitRace('player')").unwrap(),
            "노움"
        );
        assert_eq!(
            script.eval::<String>("return UnitClass('player')").unwrap(),
            "마법사"
        );
    }

    #[test]
    fn local_client_composes_with_the_ordered_vm_pass() {
        let mut app = crate::game_plugins::schedule_tests::headless_world_with(|app| {
            app.add_plugins(LocalClientPlugin);
        });
        // Build every system's parameter access and the dependency graph, including the local
        // feeds, drains and camera gate, without starting a window or an application loop.
        app.world_mut().schedule_scope(Update, |world, schedule| {
            schedule
                .initialize(world)
                .expect("the embedded client schedule must be acyclic");
        });
    }

    #[test]
    fn local_run_reset_precedes_the_stamped_event_drain() {
        use crate::game_plugins::schedule_tests::{census, SyncPoints};
        let mut app = crate::game_plugins::schedule_tests::headless_world_with(|app| {
            app.add_plugins(LocalClientPlugin);
        });
        let census = census(&mut app, Update, SyncPoints::Declared);
        let find = |suffix: &str| census.systems.iter()
            .find_map(|(key, info)| info.name.ends_with(suffix).then_some(*key));
        let (Some(reset), Some(chat)) = (
            find("::local_client::feed_ui"), find("::lanes::fire_in_order"),
        ) else {
            eprintln!("skipped: schedule system type names unavailable");
            return;
        };
        let mut seen = std::collections::HashSet::new();
        let mut pending = vec![reset];
        while let Some(current) = pending.pop() {
            for (from, to) in &census.dependencies {
                if *from == current && seen.insert(*to) {
                    pending.push(*to);
                }
            }
        }
        assert!(seen.contains(&chat), "run tables reset before chat hydrates them");
    }

    #[test]
    fn extension_publishes_menu_state_after_the_client_session_ends() {
        let mut app = App::new();
        let mut session = LocalClientSession::default();
        session.begin(character());
        app.insert_resource(session)
            .init_resource::<LocalFeedMemory>()
            .insert_resource(crate::ui_script::UiClock::default())
            .insert_resource(LocalClientExtension {
                script_update: "AZS_RUN = { sl = 3, ph = 'playing' }".into(),
                ..Default::default()
            })
            .insert_non_send_resource(UiScript::new().unwrap())
            .add_systems(Update, feed_ui);
        app.update();
        app.world()
            .non_send_resource::<UiScript>()
            .run("assert(AZS_RUN.sl == 3 and AZS_RUN.ph == 'playing')")
            .unwrap();
        app.world_mut().resource_mut::<LocalClientSession>().end();
        app.world_mut()
            .resource_mut::<LocalClientExtension>()
            .script_update = "AZS_RUN.sl = 0; AZS_RUN.ph = nil".into();
        app.update();
        app.world()
            .non_send_resource::<UiScript>()
            .run("assert(AZS_RUN.sl == 0 and AZS_RUN.ph == nil)")
            .unwrap();
    }

    #[test]
    fn local_spell_book_publishes_ordered_lock_openers() {
        let mut app = App::new();
        app.add_plugins((MinimalPlugins, bevy::state::app::StatesPlugin))
            .init_state::<crate::client_state::ClientState>()
            .init_resource::<LocalClientInput>()
            .init_resource::<crate::ui_action::PlayerActions>()
            .init_resource::<crate::glue_session::roster::Roster>()
            .insert_resource(LocalClientSession {
                known_spells: vec![22810, 133, 6478],
                ..Default::default()
            })
            .add_systems(Update, follow_session);
        let mut spells = crate::ui_action::Spells::empty_for_tests();
        spells.catalog = benilla_formats::SpellCatalog::from_displays(
            [22810, 6478].into_iter().map(|id| (id, benilla_formats::SpellDisplay {
                effects: [0x21, 0, 0],
                ..Default::default()
            })).collect(),
        );
        app.insert_resource(spells);
        app.update();
        assert_eq!(app.world().resource::<crate::ui_action::PlayerActions>().openers,
            [22810, 6478], "lock openers retain the embedding's supplied book order");
        app.world_mut().resource_mut::<LocalClientSession>().known_spells = vec![133];
        app.update();
        assert!(app.world().resource::<crate::ui_action::PlayerActions>().openers.is_empty());
    }

}
