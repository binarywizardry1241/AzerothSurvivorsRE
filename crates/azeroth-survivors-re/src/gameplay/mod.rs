//! Connect the recovered game owners to the real streamed MPQ world.
//! Native entry data and remaining gaps: docs/analysis/playable-zone-entry-0.97.2.md.

pub mod client;
pub mod mechanics;
mod coop;
mod guest_settlement;
mod heroic_progress;
pub(crate) use coop::CoopGame as GuestRun;
pub(crate) use coop::queue_delivery as queue_guest_delivery;
pub(crate) use notifications::Notifications as RunNotifications;
mod raid_markers;
mod meter;
mod addon_meters;
mod discord;
mod native_overlay_payload;
mod native_overlays;
pub(crate) use native_overlays::Enabled as DeviceChoiceEnabled;
mod notifications;
pub(crate) mod run_hud;
pub(crate) mod stored_hud;
mod talent_view;
mod death_recap;
mod terminal;
pub(crate) use terminal::TerminalAction as DeviceTerminalAction;
mod terminal_view;
pub mod visuals;
pub mod world;

use azeroth_survivors_re::enemies::Position;
use benilla_assets::AdtTile;
use benilla_world::{collision::WorldCollision, terrain_stream::TerrainStreamer};
use bevy::prelude::*;
use serde::Deserialize;

use crate::{assets::MenuArt, catalog::MenuCatalog, menu_state::MenuState, options::OptionsSet};
use mechanics::{Mechanics, RunEvent, RunPlayerStats, RunRules};
use world::{WorldTerrain, ZoneWorld, ZoneWorldRequest, ZoneWorldSet};

#[derive(Deserialize)]
struct RunZone {
    key: String,
    map_id: u32,
    spawn: [f32; 3],
    facing: f32,
    radius: f32,
}

#[derive(Deserialize)]
struct PlayerDefaults {
    move_speed: f32,
    critical_chance: f32,
    critical_multiplier: f32,
    damage_multiplier: f32,
    cooldown_multiplier: f32,
    pickup_radius: f32,
    pickup_other_radius: f32,
    armor_by_class: std::collections::BTreeMap<String, f32>,
    camera_offset: [f32; 3],
    camera_target_height: f32,
}

#[derive(Resource, Deserialize)]
struct EntryCatalog {
    zones: Vec<RunZone>,
    player: PlayerDefaults,
    races: Vec<RaceModifiers>,
}

/// Ordinary1459b45c0 projects the saved rows in their existing order, using
/// the connection's one selected zone and the shared appearance owner.
pub(crate) fn stock_roster(
    save: &crate::save::Save,
    zone_key: &str,
    armory: &crate::armory::ArmoryCatalog,
    startup: Option<&crate::save::Character>,
) -> Vec<benilla_app::local_client::LocalStockCharacter> {
    use benilla_app::local_client::{LocalStockCharacter, LocalStockPosition};
    let zone_key = azeroth_survivors_re::zones::resolve(zone_key).key;
    #[derive(Deserialize)]
    struct Binding { key: String, area_id: u32 }
    let bindings: Vec<Binding> = serde_json::from_str(include_str!("../../assets/addon-zones-0.105.0.json"))
        .expect("selected-target roster zone IDs");
    let entry: EntryCatalog = serde_json::from_str(include_str!("../../assets/run-entry-0.100.1.json"))
        .expect("revalidated stock entry coordinates");
    let Some(zone) = entry.zones.iter().find(|zone| zone.key == zone_key) else { return Vec::new() };
    let Some(binding) = bindings.iter().find(|zone| zone.key == zone_key) else { return Vec::new() };
    startup.into_iter().cloned().chain(save.characters()).map(|row| {
        let mut equipment = [Default::default(); 19];
        let (outfit, _, _) = client::outfit(save, row.race, row.class, armory);
        for item in outfit {
            if let Some(slot) = equipment.get_mut(usize::from(item.slot)) {
                *slot = benilla_app::local_client::LocalStockEquipment {
                    display_id: item.display_id, inventory_type: item.inventory_type,
                };
            }
        }
        LocalStockCharacter {
            guid: row.guid, name: row.name, race: row.race, class: row.class,
            gender: row.sex, skin: row.features[0], face: row.features[1],
            hair_style: row.features[2], hair_color: row.features[3], facial_hair: row.features[4],
            level: row.best_level.clamp(1, 60) as u8, new_character: false,
            zone: binding.area_id, map: zone.map_id,
            position: LocalStockPosition { x: zone.spawn[0], y: zone.spawn[1], z: zone.spawn[2] },
            flags: 0, equipment, pet_display_id: 0, pet_level: 0, pet_family: 0,
        }
    }).collect()
}

#[derive(Deserialize)]
struct RaceModifiers {
    native_id: u8,
    racial_ability_key: String,
    faction_template: u32,
    health_multiplier: f32,
    damage_bonus: f32,
    move_bonus: f32,
    armor_bonus: f32,
    cooldown_divisor: f32,
    experience_multiplier: f32,
    gold_multiplier: f32,
    pickup_multiplier: f32,
    regeneration_bonus: f32,
    crit_bonus: f32,
    luck_bonus: f32,
    heal_on_kill: f32,
}

#[derive(Resource, Default)]
pub struct StartZone(pub Option<String>);

#[derive(Resource, Default)]
pub struct RunSession {
    pub mechanics: Option<Mechanics>,
    pub paused: bool,
    /// The custom pause menu ended a live run, distinct from a lethal hit.
    pub ended_by_player: bool,
    /// The normalized entry specification actually supplied to the run's effects.
    pub talent_allocation: crate::save::talents::Allocation,
    pub talent_view_open: bool,
    pub talent_view_selected: Option<String>,
    pub error: Option<String>,
    pub zone_name: String,
    pub name: String,
    pub(super) entry_hero: Option<crate::save::Hero>,
    identity: u64,
    selected_roster_guid: Option<u64>,
    /// Native snapshot reads all19 entry equipment words, including unused paperdoll slots.
    starting_gear: [u32; 19],
    starting_stars: [u8; 19],
    starting_pity: Vec<(u32, u8)>,
    starting_gear_effects: Vec<(u8, f32)>,
    /// Command6 retains the old solo Config; a fresh Play captures Save again.
    solo_again: bool,
    starting_weapon_glow: u32,
    /// Current14544fd20 sets Game9b2 only for exact WOW_ROGUE_SHOWCASE=1.
    showcase: bool,
    last_position: Option<[f32; 3]>,
    accepted_position: Option<[f32; 3]>,
    recovery: azeroth_survivors_re::floor_recovery::Recovery,
    last_report: u32,
    pub started: bool,
}

impl RunSession {
    fn prepare_entry_loadout(&mut self, armory: &crate::armory::ArmoryCatalog,
        save: &crate::save::Save, class: u8, race: u8, heroic_restart_rank: Option<u8>,
    ) -> std::collections::BTreeSet<u32> {
        let retain = self.solo_again && heroic_restart_rank.is_some();
        self.solo_again = false;
        // Terminal ownership remains a current account view, independent of the
        // original Config's equipment, glow, derived effects and class-filtered pity.
        let records = crate::save::gear::Records::read(save.plaintext().lines());
        if !retain {
            let gear = crate::armory::GearSave::read_for(save, class, race);
            self.starting_gear = std::array::from_fn(|slot| {
                gear.equipped.get(&(class, slot)).copied().unwrap_or(0)
            });
            self.starting_stars = self.starting_gear.map(|id| gear.stars(id));
            self.starting_weapon_glow = save.weapon_glow(class);
            self.starting_gear_effects = gear.effects(armory, class);
            self.starting_pity = records.pity.into_iter().filter(|(id, _)| {
                crate::save::gear::decode(*id).is_some_and(|piece| piece.class == class)
            }).collect();
        }
        records.owned
    }

    pub fn playing(&self) -> bool {
        self.mechanics
            .as_ref()
            .is_some_and(|game| if game.has_party() { game.party_shared_running() }
                else { !self.paused && !game.dead && !game.completed && !game.is_paused_for_choice() })
    }
}

#[derive(SystemSet, Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum RunSet {
    Input,
    Tick,
    Present,
}

pub struct GameplayPlugin;

impl Plugin for GameplayPlugin {
    fn build(&self, app: &mut App) {
        app.insert_resource(
            serde_json::from_str::<EntryCatalog>(include_str!(
                "../../assets/run-entry-0.100.1.json"
            ))
            .expect("hash-bound 0.100.1 run entry data"),
        )
        .init_resource::<StartZone>()
        .init_resource::<RunSession>()
        .init_resource::<crate::run_seed::RunSeeds>()
        .init_resource::<ChoicePresentation>()
        .init_resource::<terminal::TerminalState>()
        .add_plugins((
            world::ZoneWorldPlugin,
            visuals::RunVisualsPlugin,
            raid_markers::RaidMarkersPlugin,
            client::ClientBridgePlugin,
            meter::MeterPlugin,
            run_hud::RunHudPlugin,
            stored_hud::StoredHudPlugin,
            talent_view::TalentViewPlugin,
            notifications::NotificationsPlugin,
        ))
        .configure_sets(
            Update,
            (
                RunSet::Input
                    .after(benilla_app::local_client::LocalClientSet::Input)
                    .before(benilla_app::local_client::LocalPlayerSet::Hold)
                    .after(OptionsSet::Input)
                    .before(ZoneWorldSet::Prepare),
                RunSet::Tick.after(ZoneWorldSet::Ready),
                RunSet::Present.after(RunSet::Tick),
            ),
        )
        .add_systems(
            Update,
            (auto_enter, enter, talent_view::input, controls)
                .chain()
                .in_set(RunSet::Input),
        )
        .add_systems(
            Update,
            capture_card_skip.in_set(benilla_app::local_client::LocalClientSet::OverlayCapture),
        )
        .add_systems(
            Update,
            native_requests.after(benilla_world::schedule::WorldStage::Input).after(RunSet::Input),
        )
        .add_systems(
            Update,
            resolved_requests
                .after(native_requests)
                .after(RunSet::Input)
                .before(RunSet::Tick),
        )
        .add_systems(
            Update,
            (tick, terminal::capture, account_delivery, terminal::apply_requests).chain().in_set(RunSet::Tick),
        )
        .add_systems(Update, hud.in_set(RunSet::Present))
        .add_systems(Update, discord::snapshot.in_set(crate::discord::DiscordSet::Snapshot))
        .add_systems(Update, native_overlays::animate.after(hud));
        app.add_systems(Update, native_overlays::tooltip::rebuild.after(hud));
        app.add_systems(Update, native_overlays::confirmation::sync.after(hud));
        // The selected AS registration supplies independent input systems;
        // it establishes no relative execution edge for the modal handler.
        app.add_systems(Update, confirmation_controls.in_set(RunSet::Input)
            .in_set(benilla_app::local_client::LocalClientSet::OverlayInput));
        app.add_systems(Update, terminal::input.after(controls).in_set(RunSet::Input)
            .before(coop::publication::publish)
            .in_set(benilla_app::local_client::LocalClientSet::OverlayInput));
        terminal_view::install(app);
        coop::install(app);
        app.add_systems(Last, flush_exit);
    }
}

fn auto_enter(
    mut start: ResMut<StartZone>,
    mut menu: ResMut<MenuState>,
    catalog: Res<MenuCatalog>,
    time: Res<Time>,
) {
    let Some(key) = start.0.take() else { return };
    if let Some(index) = catalog.zones.iter().position(|zone| zone.key == key) {
        // This explicit developer launch selects a zone without granting save unlocks.
        menu.zone = index;
        menu.begin_enter(&catalog, time.elapsed_secs());
    } else {
        menu.error = Some(format!("Unknown zone: {key}"));
        menu.mark_dirty();
    }
}

/// Local and remote admission share the existing recovered entry stats.
fn entry_player_stats(class: &crate::catalog::ClassDef, hero: &crate::save::Hero,
    entry: &EntryCatalog) -> RunPlayerStats {
    let defaults=&entry.player;
    let race=entry.races.iter().find(|race|race.native_id==hero.race)
        .expect("sanitized native class/race has entry data");
    let regeneration_base=0.8;
RunPlayerStats {
        maximum_health: class.base_health,
        health_per_level: 9.0,
        health_multiplier: race.health_multiplier,
        regeneration: regeneration_base + race.regeneration_bonus,
        pickup_radius: defaults.pickup_radius * race.pickup_multiplier,
        luck_bonus: race.luck_bonus,
        heal_on_kill: race.heal_on_kill,
        armor_fraction: (defaults.armor_by_class[&class.key] + race.armor_bonus).min(0.6),
        damage_reduction: 0.0,
        damage_multiplier: defaults.damage_multiplier + race.damage_bonus,
        cooldown_multiplier: defaults.cooldown_multiplier / race.cooldown_divisor,
        experience_multiplier: race.experience_multiplier,
        gold_multiplier: race.gold_multiplier,
        critical_chance: defaults.critical_chance + race.crit_bonus,
        critical_multiplier: defaults.critical_multiplier,
        native_race: hero.race,
        packed_player_field: u32::from_le_bytes([hero.race, hero.class, hero.sex, 0]),
    }
}

fn enter(
    mut session: ResMut<RunSession>,
    mut run_seeds: ResMut<crate::run_seed::RunSeeds>,
    mut menu: ResMut<MenuState>,
    catalog: Res<MenuCatalog>,
    entry: Res<EntryCatalog>,
    mut world: ResMut<ZoneWorld>,
    mut options: ResMut<crate::options::OptionsState>,
    armory: Res<crate::armory::ArmoryCatalog>,
    mut extension: ResMut<benilla_app::local_client::LocalClientExtension>,
    mut terminal: ResMut<terminal::TerminalState>,
    stock: Option<Res<benilla_app::local_client::LocalStockFrontend>>,
    mut loading: ResMut<benilla_app::local_client::LocalLoadingScreen>,
    coop: Option<Res<crate::coop_runtime::CoopRuntime>>,
    locale: Res<crate::localization::Localization>,
    bridge: Res<client::BridgeCatalog>,
) {
    if !menu.entering || menu.in_run {
        return;
    }
    if coop.as_deref().is_some_and(|runtime| runtime.is_guest()) {
        // A guest's world is owned by received ZoneKey/login, not the solo
        // frontend's Enter request. Keep the selected profile in the lobby.
        menu.entering = false;
        return;
    }
    let pick = if stock.is_some() { crate::save::Pick { hero: menu.hero(), name: menu.name.clone(),
        zone: catalog.zones[menu.zone].key.clone(), heroic_rank: menu.heroic_rank, mods: menu.run_mods } } else { menu.backend_pick().clone() };
    let zone_key = azeroth_survivors_re::zones::resolve(&pick.zone).key;
    let Some(selected) = catalog.zones.iter().find(|zone| zone.key == zone_key) else {
        return;
    };
    let Some(zone) = entry.zones.iter().find(|zone| zone.key == selected.key) else {
        loading.cancel();
        menu.error = Some(format!("No recovered world entry for {}", selected.name));
        menu.return_from_run();
        return;
    };
    // Put the actual client cover on screen before synchronous mechanics/cache setup.
    // A retry/Again is a new admission even when it reuses the current map and VM.
    if !loading.pending() {
        loading.begin(zone.map_id);
        return;
    }
    if !loading.presented() {
        return;
    }
    // Current login copies the addressed roster GUID into Config+130. The
    // custom roster instead projects the immutable process identity; an actual
    // cooperative host retains its admitted world identity.
    let host_guid = coop.as_deref()
        .filter(|runtime| runtime.driver.as_ref().is_some_and(|driver| driver.is_hosting()))
        .and_then(|runtime| runtime.world_guid);
    let Some(player_guid) = host_guid.or_else(|| {
        if stock.is_some() { menu.selected_roster_guid() }
        else { Some(run_seeds.player_guid()) }
    }) else { return };
    let class = &catalog.classes[crate::save::CLASS_IDS.iter().position(|id| *id == pick.hero.class).expect("backend Pick class")];
    let seed = run_seeds.next();
    // 145b231ce forces the transient Tester's Game to Normal. Later host
    // metadata has its own minimum; the requested Pick stays unchanged.
    let heroic_rank = menu.heroic_restart_rank.unwrap_or_else(|| {
        if menu.selected_roster_guid() == Some(crate::startup::TESTER_GUID) {
            0
        } else {
            pick.heroic_rank.min(menu.backend_save.max_heroic_rank(pick.hero.class, zone_key))
        }
    });
    let rules = RunRules { heroic_rank,
        // Current difficulty is selected by Heroic rank. Retained percentage
        // fields support historical helpers; live construction supplies unity.
        difficulty: 1.0,
        density_percent: 100,
        hp_percent: 100,
        damage_percent: 100,
        speed_percent: 100,
        endless: false,
    };
    let defaults = &entry.player;
    let race = entry
        .races
        .iter()
        .find(|race| race.native_id == pick.hero.race)
        .expect("native picker race has recovered stat data");
    let regeneration_base = 0.8;
    let stats = entry_player_stats(class, &pick.hero, &entry);
    match Mechanics::new(&zone.key, &class.key, rules, stats, seed) {
        Ok(mut game) => {
            game.configure_heroic_affixes(heroic_rank, menu.heroic_week);
            game.set_spell_display_locale(&locale);
            game.recap_spells = bridge.spells.clone();
            game.player_guid = player_guid;
            session.showcase = std::env::var("WOW_ROGUE_SHOWCASE")
                .is_ok_and(|value| value == "1");
            let definitions = crate::save::talents::Catalog::embedded();
            // 14589cea0 bypasses saved talent allocation for the optional
            // transient Tester row, independently of WOW_ROGUE_SHOWCASE.
            let allocation = if menu.selected_roster_guid() == Some(crate::startup::TESTER_GUID) {
                Default::default()
            } else {
                crate::save::talents::normalize(
                    definitions.class(pick.hero.class),
                    &menu.backend_save.talent_allocation(pick.hero.class),
                    crate::save::talents::budget(menu.backend_save.talent_xp(pick.hero.class)).0,
                )
            };
            let entry_owned = session.prepare_entry_loadout(&armory, &menu.backend_save,
                pick.hero.class, pick.hero.race, menu.heroic_restart_rank);
            game.configure_armor_set(session.starting_gear, session.starting_stars);
            game.set_equipment_pity(&session.starting_pity);
            game.set_racial_progression_components(
                defaults.damage_multiplier,
                race.damage_bonus,
                regeneration_base,
                race.regeneration_bonus,
            );
            game.configure_effects(
                &allocation
                    .iter()
                    .map(|(key, rank)| (key.clone(), *rank))
                    .collect::<Vec<_>>(),
                &session.starting_gear_effects,
            );
            session.talent_allocation = allocation;
            session.talent_view_open = false;
            session.talent_view_selected = None;
            let mut account_grants = crate::progression::account_run_grants(
                &menu.backend_save,
                pick.hero.class,
            );
            // Current1458bff32..4f gives the transient Tester no Veteran bonus.
            if menu.selected_roster_guid() == Some(crate::startup::TESTER_GUID) {
                account_grants.veteran_bonus = 0.0;
            }
            game.set_account_grants(account_grants);
            if !session.showcase {
                game.set_loot_companions(crate::progression::account_loot_companions(&menu.backend_save));
            }
            game.set_base_movement_multiplier(1.0 + race.move_bonus);
            game.set_showcase(session.showcase);
            game.finish_player_entry();
            if let Some(sequence) = terminal.take_restart_mover() {
                game.restart_player_entry(sequence, zone.spawn, zone.facing);
            }
            let store = options
                .cvar("storeLevels")
                .is_some_and(|value| native_cvar_text(value) == "1");
            game.set_store_levels(store);
            extension.cvar_writes.extend([
                ("storeLevels".into(), if store { "1" } else { "0" }.into()),
                ("spendLevels".into(), "0".into()),
            ]);
            game.set_cache_on_click(
                options
                    .cvar("cacheOnClick")
                    .and_then(|value| value.parse::<f32>().ok())
                    .is_some_and(|value| value != 0.0),
            );
            session.identity = session.identity.wrapping_add(1);
            terminal.begin(entry_owned);
            // Keep the custom result-bookkeeping marker separate from the
            // runtime player GUID assigned above; it has no permanent row.
            session.selected_roster_guid = if stock.is_some() {
                menu.selected_roster_guid()
            } else { menu.backend_save.pick().map(|pick| pick.custom_character().guid) };
            session.mechanics = Some(game);
            session.zone_name = selected.name.clone();
            session.name = pick.name.clone();
            session.entry_hero = Some(pick.hero.clone());
            session.paused = false;
            session.ended_by_player = false;
            session.error = None;
            session.last_position = None;
            session.accepted_position = Some(zone.spawn);
            session.recovery = Default::default();
            session.started = false;
            session.last_report = 0;
            options.open = false;
            world.request = Some(ZoneWorldRequest {
                identity: session.identity,
                map_id: zone.map_id,
                spawn_wow: zone.spawn,
                spawn_facing: zone.facing,
                camera_offset: defaults.camera_offset,
                camera_target_height: defaults.camera_target_height,
            });
            world.facing = zone.facing;
            menu.complete_enter();
            info!(
                "run started: {} / {} / radius {}",
                zone.key, class.key, zone.radius
            );
        }
        Err(error) => {
            loading.cancel();
            menu.error = Some(error);
            menu.return_from_run();
        }
    }
}

fn capture_card_skip(
    mut context: ResMut<benilla_app::local_client::LocalContextBinding>,
    input: Res<benilla_app::local_client::LocalClientInput>,
    session: Res<RunSession>,
    menu: Res<MenuState>,
    options: Res<crate::options::OptionsState>,
    pause: Res<run_hud::Pause>,
    loading: Res<benilla_app::local_client::LocalLoadingScreen>,
    opened: Res<ChoicePresentation>,
    runtime: Option<Res<crate::coop_runtime::CoopRuntime>>,
    replica: Option<Res<coop::CoopGame>>,
) {
    let Some(game) = session.mechanics.as_ref().filter(|game| !game.dead && !game.completed) else {
        return;
    };
    if !menu.in_run || input.game_menu_open || session.talent_view_open || options.open
        || pause.paused(&options) || loading.covering() || opened.signature.is_empty()
        || opened.closing.is_some() || opened.confirming.is_some()
    {
        return;
    }
    let skippable = if runtime.is_some_and(|runtime| runtime.is_guest()) {
        replica.as_deref().is_some_and(coop::overlay::guest_skip_available)
    } else {
        !game.choices.is_empty() && game.choice_footer().skip_gold.is_some()
    };
    if skippable {
        context.chords.extend_from_slice(options.skip_keys());
    }
}

fn controls(
    keys: Res<ButtonInput<KeyCode>>,
    input: Res<benilla_app::local_client::LocalClientInput>,
    mut client: ResMut<benilla_app::local_client::LocalClientSession>,
    mut session: ResMut<RunSession>,
    menu: Res<MenuState>,
    world: Res<ZoneWorld>,
    loading: Res<benilla_app::local_client::LocalLoadingScreen>,
    time: Res<Time>,
    clicks: Query<
        (
            &Interaction,
            &native_overlays::OverlayAction,
            &native_overlays::Enabled,
        ),
        Changed<Interaction>,
    >,
    mut opened: ResMut<ChoicePresentation>,
    mut extension: ResMut<benilla_app::local_client::LocalClientExtension>,
    mut options: ResMut<crate::options::OptionsState>,
    pause: Res<run_hud::Pause>,
    stored_clicks: Query<
        (&Interaction, &Node),
        (Changed<Interaction>, With<stored_hud::OpenStoredLevels>),
    >,
    (mut coop_runtime,mut replica):(Option<ResMut<crate::coop_runtime::CoopRuntime>>,Option<ResMut<coop::CoopGame>>),
) {
    if !menu.in_run {
        opened.signature.clear();
        opened.closing = None;
        opened.confirming = None;
        opened.renewal_pending = false;
        session.talent_view_open = false;
        session.talent_view_selected = None;
        return;
    }
    if let (Some(runtime),Some(replica))=(coop_runtime.as_deref_mut(),replica.as_deref_mut()) {
        if runtime.is_guest() {
            coop::overlay::retire_stale_confirmation(replica, &session, &mut opened);
            if loading.covering(){client.set_paused(true);return;}
            coop::overlay::guest_controls(runtime,replica,&keys,&input,&mut client,&mut session,&time,
                clicks.iter(),&mut opened,&mut extension,&mut options,&pause,
                stored_clicks.iter().any(|(interaction,node)|*interaction==Interaction::Pressed&&node.display==Display::Flex));
            if !world.ready{client.set_paused(true);}
            return;
        }
    }
    // Absent/terminal runs retire the old card exit, including teardown after
    // accepted input. An undisplayed offer cannot change a frozen result.
    if session.mechanics.as_ref().is_none_or(|game| game.dead || game.completed) {
        opened.signature.clear();
        opened.closing = None;
        opened.confirming = None;
        opened.renewal_pending = false;
        session.talent_view_open = false;
        session.talent_view_selected = None;
        client.set_paused(true);
        return;
    }
    if loading.covering() {
        if opened.confirming.is_some() && session.mechanics.as_ref()
            .is_none_or(|game| opened.signature != offer_signature(game)) {
            opened.confirming = None;
        }
        client.set_paused(true);
        return;
    }
    if input.talent_toggle {
        session.talent_view_open = !session.talent_view_open;
        if session.talent_view_open {
            // Selected-target root creation clears its shared selected-key slot.
            session.talent_view_selected = None;
        }
    }
    let choice_position = session.accepted_position.unwrap_or(world.position_wow);
    if let Some(game) = session.mechanics.as_mut() {
        game.set_choice_player_position(Position::from(choice_position));
        for (name, value) in &input.cvars {
            if name == "storeLevels" && opened.store_value.as_ref() != Some(value) {
                // Entry/menu writes are applied by the real VM feed on its
                // next frame. An older input snapshot must not overwrite them.
                if extension
                    .cvar_writes
                    .iter()
                    .any(|(pending, _)| pending == name)
                {
                    continue;
                }
                game.set_store_levels(native_cvar_text(value) == "1");
                options.set_engine_cvar(name, value);
                opened.store_value = Some(value.clone());
            } else if name == "spendLevels"
                && native_cvar_text(value) == "1"
                && !game.spending_levels()
            {
                game.open_stored_levels();
            }
        }
        if !game.spending_levels()
            && input
                .cvars
                .iter()
                .any(|(name, value)| name == "spendLevels" && native_cvar_text(value) == "1")
        {
            extension
                .cvar_writes
                .push(("spendLevels".into(), "0".into()));
        }
        if !input.game_menu_open
            && stored_clicks.iter().any(|(interaction, node)| {
                *interaction == Interaction::Pressed && node.display == Display::Flex
            })
        {
            game.open_stored_levels();
            if game.spending_levels() {
                extension
                    .cvar_writes
                    .push(("spendLevels".into(), "1".into()));
            }
        }
    }
    // Native custom-menu requests and stock frame openings share this pause owner.
    session.paused = input.game_menu_open || session.talent_view_open || pause.paused(&options);
    let choosing = session
        .mechanics
        .as_ref()
        .is_some_and(|game| game.is_paused_for_choice());
    if !opened.renewal_pending {
        if choosing {
            let game = session.mechanics.as_ref().unwrap();
            let signature = offer_signature(game);
            if opened.signature != signature {
                opened.signature = signature;
                opened.at = time.elapsed_secs();
                opened.confirming = None;
            }
        } else {
            opened.signature.clear();
            opened.confirming = None;
        }
    }
    if let Some((_, began)) = opened.closing {
        if !(time.elapsed_secs() - began < CHOICE_EXIT_SECONDS) {
            // Choice commands already ran in delivery order. This gate owns
            // only the old card hierarchy's exit and the next revision's reveal.
            opened.closing = None;
            opened.renewal_pending = false;
            opened.signature = session
                .mechanics
                .as_ref()
                .filter(|game| !game.choices.is_empty())
                .map(offer_signature)
                .unwrap_or_default();
            opened.at = time.elapsed_secs();
        }
    }
    let age = time.elapsed_secs() - opened.at;
    let admitted = choosing && opened.closing.is_none() && age >= CHOICE_OPENING_SECONDS;
    let mut regenerated = false;
    if choosing && opened.closing.is_none() && opened.confirming.is_none() && !session.paused {
        // CardsState is the input snapshot for this pass. Backend commands
        // cannot change its count or affordability while input is collected.
        let game = session.mechanics.as_ref().unwrap();
        let count = game.choices.len();
        let footer = game.choice_footer();
        let can_reroll = footer.can_reroll;
        let can_skip = footer.skip_gold.is_some();
        let replacements: Vec<_> = (0..count).map(|index| {
            game.cache_reward(index).is_some_and(|reward|
                native_overlay_payload::replaced_amulet(reward, game).is_some())
        }).collect();
        let mut actions = Vec::new();
        // Pointer selection commits after the other pointer commands, so a
        // preceding reroll can change the row that the backend later accepts.
        let mut selected = None;
        let mut pointer_skip = false;
        for (interaction, action, enabled) in clicks.iter() {
            if !extension.on_top_pointer && *interaction == Interaction::Pressed && enabled.0 {
                match *action {
                    native_overlays::OverlayAction::Select(index) if admitted => {
                        selected = Some(index);
                    }
                    native_overlays::OverlayAction::Reroll if can_reroll => actions.push(*action),
                    native_overlays::OverlayAction::Banish(_) if admitted => actions.push(*action),
                    native_overlays::OverlayAction::Skip if admitted && can_skip => pointer_skip = true,
                    _ => {}
                }
            }
        }
        if pointer_skip {
            actions.push(native_overlays::OverlayAction::Skip);
        }
        if let Some(index) = selected.filter(|_| !pointer_skip) {
            if index < count {
                if opened.select_or_confirm(index, replacements[index], time.elapsed_secs()) {
                    actions.push(native_overlays::OverlayAction::Select(index));
                }
            }
        }
        if !pointer_skip && !input.keyboard_captured && opened.closing.is_none() && opened.confirming.is_none() {
            if input.contextual_key_pressed && can_skip {
                if admitted {
                    actions.push(native_overlays::OverlayAction::Skip);
                }
            } else {
                let (selected, reroll) = keyboard_choice_actions(&keys, count, age, can_reroll);
                if let Some(index) = selected {
                    if opened.select_or_confirm(index, replacements[index], time.elapsed_secs()) {
                        actions.push(native_overlays::OverlayAction::Select(index));
                    }
                }
                // Native R reads the same snapshot after digits set closing.
                // Its backend sees the preceding accepted choice.
                if reroll {
                    actions.push(native_overlays::OverlayAction::Reroll);
                }
            }
        }
        if let Some(game) = session.mechanics.as_mut() {
            for action in actions {
                match action {
                    native_overlays::OverlayAction::Select(index) => { game.choose(index); }
                    native_overlays::OverlayAction::Reroll => { regenerated |= game.reroll_choices(); }
                    native_overlays::OverlayAction::Banish(index) => { regenerated |= game.banish_choice(index); }
                    native_overlays::OverlayAction::Skip => {
                        if game.skip_choices() {
                            regenerated = true;
                            opened.skip(time.elapsed_secs());
                        }
                    }
                    native_overlays::OverlayAction::Confirm | native_overlays::OverlayAction::Cancel => {}
                }
            }
        }
    }
    // Acceptance already changed the backend. Retain the old visible payload
    // until its exit finishes, even if acceptance leaves no next offer.
    if opened.closing.is_some() {
        opened.renewal_pending = true;
    }
    // Each successful regeneration publishes a new native choices message.
    // Its revision resets the clock even when the visible payload is identical.
    // Re-roll/banish/skip can replace the offer during this input pass.
    // Establish its opening clock before the presentation system sees it.
    if !opened.renewal_pending {
        if let Some(game) = session
            .mechanics
            .as_ref()
            .filter(|game| !game.choices.is_empty())
        {
            let signature = offer_signature(game);
            if regenerated || opened.signature != signature {
                opened.signature = signature;
                opened.at = time.elapsed_secs();
                opened.confirming = None;
            }
        }
    }
    client.set_paused(session.paused || session.mechanics.as_ref().is_some_and(|game|game.is_paused_for_choice()) || !session.playing() || !world.ready);
}

/// Native 14028e9d0 reads pending at its own entry. Keep this independent of
/// ordinary card controls: registration does not prove a relative order, and
/// neither a new pending slot nor cancellation imposes an extra frame delay.
fn confirmation_controls(
    keys: Res<ButtonInput<KeyCode>>,
    input: Res<benilla_app::local_client::LocalClientInput>,
    mut client: ResMut<benilla_app::local_client::LocalClientSession>,
    mut session: ResMut<RunSession>,
    menu: Res<MenuState>,
    world: Res<ZoneWorld>,
    loading: Res<benilla_app::local_client::LocalLoadingScreen>,
    time: Res<Time>,
    clicks: Query<(&Interaction, &native_overlays::OverlayAction, &native_overlays::Enabled), Changed<Interaction>>,
    mut opened: ResMut<ChoicePresentation>,
    extension: Res<benilla_app::local_client::LocalClientExtension>,
    (mut runtime, mut replica): (Option<ResMut<crate::coop_runtime::CoopRuntime>>, Option<ResMut<coop::CoopGame>>),
) {
    if !menu.in_run || loading.covering() || session.mechanics.as_ref().is_none_or(|game| game.dead || game.completed) {
        opened.confirming = None;
        return;
    }
    let Some((index, _)) = opened.confirming else { return; };
    let guest = runtime.as_ref().is_some_and(|runtime| runtime.is_guest());
    if guest {
        if let Some(replica) = replica.as_deref() {
            coop::overlay::retire_stale_confirmation(replica, &session, &mut opened);
        }
    } else if session.mechanics.as_ref().is_some_and(|game| opened.signature != offer_signature(game)) {
        opened.confirming = None;
    }
    if opened.confirming.is_none() { return; }
    let pointer = clicks.iter().find_map(|(interaction, action, enabled)| {
        (!extension.on_top_pointer && *interaction == Interaction::Pressed && enabled.0)
            .then_some(*action)
            .filter(|action| matches!(action, native_overlays::OverlayAction::Confirm | native_overlays::OverlayAction::Cancel))
    });
    let Some(accept) = native_overlays::confirmation::decision(&keys, &input, pointer) else { return; };
    opened.confirming = None;
    if !accept { return; }
    if guest {
        let (Some(runtime), Some(replica)) = (runtime.as_deref_mut(), replica.as_deref_mut()) else { return; };
        if !coop::overlay::accept_confirmed(runtime, replica, index, time.elapsed_secs_f64()) { return; }
    } else if let Some(game) = session.mechanics.as_mut() {
        game.choose(index);
    }
    opened.closing = Some((index, time.elapsed_secs()));
    opened.renewal_pending = true;
    if !guest {
        client.set_paused(session.paused || session.mechanics.as_ref().is_some_and(|game| game.is_paused_for_choice()) || !session.playing() || !world.ready);
    }
}

const CHOICE_OPENING_SECONDS: f32 = f32::from_bits(0x3ee6_6666);
const CHOICE_EXIT_SECONDS: f32 = f32::from_bits(0x3ea3_d70a);

/// 0.127.0 14028fab0 admits digits in ascending order, then R from the same
/// CardsState snapshot. Its constant-first JA rejects only an ordered young age.
fn keyboard_choice_actions(
    keys: &ButtonInput<KeyCode>,
    count: usize,
    age: f32,
    can_reroll: bool,
) -> (Option<usize>, bool) {
    if count == 0 { return (None, false); }
    let selected = if age < CHOICE_OPENING_SECONDS {
        None
    } else {
        [
            [KeyCode::Digit1, KeyCode::Numpad1],
            [KeyCode::Digit2, KeyCode::Numpad2],
            [KeyCode::Digit3, KeyCode::Numpad3],
            [KeyCode::Digit4, KeyCode::Numpad4],
        ].into_iter().take(count).enumerate().find_map(|(index, aliases)| {
            aliases.into_iter().any(|key| keys.just_pressed(key)).then_some(index)
        })
    };
    (selected, can_reroll && keys.just_pressed(KeyCode::KeyR))
}

fn tick(
    time: Res<Time>,
    hud_settings: Res<run_hud::HudSettings>,
    mut session: ResMut<RunSession>,
    world: Res<ZoneWorld>,
    terrain: Option<Res<TerrainStreamer>>,
    tiles: Option<Res<Assets<AdtTile>>>,
    collision: WorldCollision,
    reports: Res<benilla_app::local_client::LocalMovementReports>,
    mut native_floor: ResMut<world::native_floor::NativeFloor>,
    mut coop: Option<ResMut<crate::coop_runtime::CoopRuntime>>,
    mut replica: Option<ResMut<coop::CoopGame>>,
    loading: Res<benilla_app::local_client::LocalLoadingScreen>,
) {
    if coop.as_ref().is_some_and(|coop|coop.is_guest()) || loading.covering() || !world.ready || !session.playing() {
        return;
    }
    let Some((terrain, tiles)) = terrain.as_deref().zip(tiles.as_deref()) else {
        return;
    };
    let position = world.position_wow;
    let delta = time.delta_secs();
    let prior = session.last_position;
    let velocity = prior.map_or([0.0; 2], |old| {
        if delta > 0.0 {
            [
                (position[0] - old[0]) / delta,
                (position[1] - old[1]) / delta,
            ]
        } else {
            [0.0; 2]
        }
    });
    session.last_position = Some(position);
    let Some(floor) = native_floor.terrain() else {
        return;
    };
    let zone_key = session.mechanics.as_ref().unwrap().zone.key;
    let Some(zone) = azeroth_survivors_re::floor_recovery::Zone::for_key(zone_key) else {
        return;
    };
    if reports.identity == session.identity {
        for report in &reports.reports {
            use azeroth_survivors_re::floor_recovery::Report;
            session.mechanics.as_mut().unwrap().record_boss_movement_flags(report.flags);
            let now = session.mechanics.as_ref().unwrap().clock;
            let phase = u8::from(session.started);
            let floor_report = Report {
                position: report.position_wow,
                facing: report.facing,
                flags: report.flags,
                phase,
                now,
            };
            let admission = if let Some(timestamp) = report.timestamp_ms {
                session.recovery.admit_timestamped(zone, floor_report, timestamp, floor)
            } else {
                session.recovery.admit(zone, floor_report, floor)
            };
            if let Some((coop, opcode))=coop.as_deref_mut().zip(report.movement_opcode) {
                let admitted=match admission {azeroth_survivors_re::floor_recovery::Admission::Ignored=>None,
                    azeroth_survivors_re::floor_recovery::Admission::Accepted=>Some(report.position_wow),
                    azeroth_survivors_re::floor_recovery::Admission::Corrected(point)=>(point == report.position_wow).then_some(report.position_wow)};
                coop.local_admissions.push((opcode,report.position_wow,admitted));
            }
            commit_movement_report(&mut session, report.position_wow, report.facing, admission);
            if !matches!(admission, azeroth_survivors_re::floor_recovery::Admission::Ignored) {
                let point = session.accepted_position.unwrap();
                session.mechanics.as_mut().unwrap().record_boss_movement_report(
                    Position::from(point), report.facing, report.flags);
            }
        }
    }
    if !session.started {
        return;
    }
    let position = session.accepted_position.unwrap_or(position);
    floor.refresh_navigation(
        [position[0], position[1]],
        session.mechanics.as_ref().unwrap().clock,
    );
    let mut terrain = WorldTerrain {
        streamer: terrain,
        tiles,
        collision: Some(&collision),
        fallback: position[2],
        native: native_floor.terrain_ref(),
    };
    let showcase = session.showcase;
    let Some(game) = session.mechanics.as_mut() else {
        return;
    };
    let forced_position = if game.has_party() {
        game.tick_party(delta, Position::from(position), velocity, world.facing, &mut terrain)
    } else {
        game.tick(delta, Position::from(position), velocity, world.facing, &mut terrain)
    };
    if let Some(replica) = replica.as_deref_mut() {
        let game = session.mechanics.as_mut().unwrap();
        for (slot, point) in game.take_party_forced_positions() {
            if let Some(client) = coop.as_deref().and_then(|runtime| runtime.actor_clients.get(&slot)) {
                replica.expect_remote_position(*client, [point.x, point.y, point.z], game.clock);
            }
        }
    }
    let position = if let Some(point) = forced_position {
        let position = [point.x, point.y, point.z];
        session.accepted_position = Some(position);
        let now = session.mechanics.as_ref().unwrap().clock;
        session.recovery.expect_position(position, now);
        position
    } else {
        position
    };
    let game = session.mechanics.as_mut().unwrap();
    if !showcase {
        if !game.has_party() {
            game.update_addon_flag(Position::from(position));
            game.update_world_flag(Position::from(position), hud_settings.shown("flag"));
        }
    }
    let report = (game.clock / 5.0) as u32;
    let report_text = format!(
        "run tick: t={:.2} pos={position:?} hp={:.1} level={} xp={} kills={} actors={} pickups={}",
        game.clock,
        game.health(),
        game.level,
        game.xp,
        game.kills,
        game.actors.len(),
        game.pickups.len()
    );
    if report != session.last_report {
        session.last_report = report;
        info!("{report_text}");
    }
}

/// Current1458ad720 consumes account queues/snapshots while the Game exists,
/// including phase2. Pausing the simulation for a choice must not pause delivery.
fn account_delivery(mut session: ResMut<RunSession>, mut menu: ResMut<MenuState>) {
    let phase_active = session.started;
    let selected_roster_guid = session.selected_roster_guid;
    let starting_gear = session.starting_gear;
    let showcase = session.showcase;
    if let Some(game) = session.mechanics.as_mut() {
        persist_run(
            game,
            &mut menu,
            selected_roster_guid,
            starting_gear,
            showcase,
            phase_active,
            false,
        );
    }
}

/// Live item/seen ownership and terminal counters follow their separate native
/// consumers. Saving the account never commits unrelated live picker edits.
fn persist_run(
    game: &mut Mechanics,
    menu: &mut MenuState,
    selected_roster_guid: Option<u64>,
    starting_gear: [u32; 19],
    showcase: bool,
    phase_active: bool,
    force_summary: bool,
) {
    let now = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map_or(0, |duration| duration.as_secs());
    persist_run_at(
        game,
        menu,
        selected_roster_guid,
        starting_gear,
        showcase,
        phase_active,
        now,
        force_summary,
    );
}

fn persist_run_at(
    game: &mut Mechanics,
    menu: &mut MenuState,
    selected_roster_guid: Option<u64>,
    starting_gear: [u32; 19],
    showcase: bool,
    phase_active: bool,
    now: u64,
    force_summary: bool,
) {
    if game.is_party_replica() {
        // Current0.119.0 poll excludes guests from local live grants. Their
        // accepted State terminal edge and close owners deliver the account.
        if !force_summary { return; }
        if let Some(snapshot) = guest_settlement::Snapshot::from_mechanics(game, starting_gear) {
            let mut events = snapshot.summary(menu, selected_roster_guid, now);
            if selected_roster_guid.is_some() && snapshot.summary_admitted() {
                if let Some(delivery) = snapshot.delivery() {
                    game.mark_terminal_summary_saved(delivery, false);
                }
            }
            events.extend(snapshot.account(menu, selected_roster_guid, now));
            if selected_roster_guid.is_some_and(|guid| guid != crate::startup::TESTER_GUID) {
                game.mark_account_counts_saved(snapshot.counts());
            }
            game.events.extend(events);
        }
        return;
    }
    let saves_equipment = selected_roster_guid.is_some_and(|guid| guid != 0x00ff_ffff);
    let account_eligible = phase_active && saves_equipment;
    // Current145b16870/145b154f0 bypass the local showcase restriction for
    // an admitted guest, while retaining its own non-tester roster identity.
    let count_eligible = account_eligible && (!showcase || game.is_party_replica());
    // Current145c107ae publishes the final-boss clear while the shared victory
    // latch is set, independently of terminal summaries and queued choices.
    if count_eligible {
        let events = guest_settlement::persist_victory(
            menu, selected_roster_guid, game.class.class_id, game.zone.key,
            game.heroic_rank(), game.victory_reached(), true,
        );
        game.events.extend(events);
    }
    let mut granted = Vec::new();
    let equipment = if force_summary {
        Vec::new()
    } else {
        game.drain_equipment_grants()
    };
    if !equipment.is_empty() {
        let ids: Vec<_> = equipment.iter().map(|grant| grant.item_id).collect();
        let before = menu.backend_save.plaintext();
        let receipts = if saves_equipment {
            menu.backend_save.receive_equipment(&ids, game.heroic_rank())
        } else {
            let owned = crate::armory::GearSave::read(&menu.backend_save).owned;
            ids.iter().copied().filter(|id| crate::save::gear::decode(*id).is_some())
                .map(|id| crate::save::gear_rewards::EquipmentReceipt {
                    id, is_new: !owned.contains(&id), marks_tenths: 0,
                }).collect()
        };
        for (grant, receipt) in equipment.iter()
            .filter(|grant| crate::save::gear::decode(grant.item_id).is_some()).zip(receipts) {
            game.record_equipment_receipt(grant, receipt.marks_tenths);
            game.events.push(RunEvent::EquipmentLoot { id: receipt.id, is_new: receipt.is_new });
            game.events.push(RunEvent::GearReceipt { id: receipt.id, race: game.stats.native_race,
                is_new: receipt.is_new, marks_tenths: receipt.marks_tenths });
        }
        if menu.backend_save.plaintext() != before {
            granted.extend(crate::progression::grant_account(&mut menu.backend_save, Some(now)));
            menu.commit_account();
        }
    }
    if !force_summary && saves_equipment {
        let before = menu.backend_save.plaintext();
        menu.backend_save.record_seen(game.seen_abilities());
        if menu.backend_save.plaintext() != before {
            granted.extend(crate::progression::grant_account(&mut menu.backend_save, Some(now)));
            menu.commit_account();
        }
    }
    if !force_summary {
        let (marks, missed_ids) = game.drain_boss_rewards();
        if saves_equipment && (marks > 0. || !missed_ids.is_empty()) {
            let before = menu.backend_save.plaintext();
            menu.backend_save.record_boss_rewards(game.class.class_id, marks, &missed_ids);
            if marks > 0. {
                game.events.push(RunEvent::MarksEarned { earned: marks,
                    total_tenths: menu.backend_save.class_marks_tenths(game.class.class_id) });
            }
            if menu.backend_save.plaintext() != before {
                granted.extend(crate::progression::grant_account(&mut menu.backend_save, Some(now)));
                menu.commit_account();
            }
        }
    }
    let snapshot = game.feat_snapshot(starting_gear).with_heroic_cap(
        menu.backend_save.max_heroic_rank(game.class.class_id, game.zone.key));
    if !force_summary && count_eligible {
        let feats = crate::progression::grant_run_feats(
            &mut menu.backend_save,
            snapshot,
            game.killing_blows(),
            game.boss_killing_blows(),
            game.damaged_by_bosses(),
            now,
        );
        if !feats.is_empty() {
            granted.extend(feats);
            menu.commit_account();
        }
        if let Some(context) = game.cooperative_feat_context() {
            // Current0.119.0 145b15833 admits cooperative won history only
            // with at least two current members. Shared lethal history reaches every recipient,
            // regardless of which hero owns the ordinary killing-blow record.
            let history_changed = snapshot.won
                && context.members.len() >= 2
                && menu.backend_save.mark_cooperative_victory(game.zone.key);
            let feats = azeroth_survivors_re::guardians::catalog::ZONES.iter()
                .position(|zone| zone.key == game.zone.key)
                .map(|zone| crate::progression::grant_party_feats(
                    &mut menu.backend_save, zone, snapshot, &context, now,
                ))
                .unwrap_or_default();
            let changed = history_changed || !feats.is_empty();
            granted.extend(feats);
            if history_changed {
                granted.extend(crate::progression::grant_account(&mut menu.backend_save, Some(now)));
            }
            if changed {
                menu.commit_account();
            }
        }
    }
    // Guest edges are consumed per accepted State in receive, including an
    // entire terminal/continuation batch before this Update can observe it.
    let terminal_edge = !force_summary && phase_active && !game.is_party_replica()
        && !(game.has_party() && game.party_shared_running()) && game.take_terminal_phase_edge();
    let summary_phase = game.replica_phase().map_or(phase_active, |phase| {
        matches!(phase.native(), 1..=5)
    });
    let summary_admitted = summary_phase && (force_summary || terminal_edge);
    if summary_admitted {
        if let (Some(guid), Some(result)) = (selected_roster_guid, game.summary_result()) {
            let delivery = game.summary_delivery();
            // Current0.112.0:1458ba545 saves XP before bests/results/tick counters.
            if let Some(delivery) = delivery
                .as_ref()
                .filter(|d| account_eligible && d.talent_xp != 0)
            {
                let before = menu.backend_save.talent_xp(result.class) as u32;
                if let Err(error) = menu
                    .backend_save
                    .grant_terminal_xp(result.class, delivery.talent_xp)
                {
                    menu.error = Some(error.to_string());
                } else {
                    menu.commit_account();
                    // Current145889ce0 captures old XP, saves the saturated
                    // class total, then queues the full unsaturated award.
                    game.events.push(RunEvent::TalentXp {
                        gain: delivery.talent_xp,
                        before,
                        total: menu.backend_save.talent_xp(result.class) as u32,
                        class_key: game.class.key,
                        parts: delivery.delta_xp_parts,
                    });
                }
            }
            // Permanent roster first; a matching optional startup row changes only level.
            menu.record_character_bests(guid, result.level, result.seconds);
            if delivery.as_ref().is_some_and(|d| d.first_result) {
                if account_eligible && result.won {
                    match menu.backend_save.open_next_zone(result.class, result.zone_key) {
                        Ok(true) => menu.commit_account(),
                        Ok(false) => {}
                        Err(error) => menu.error = Some(error.to_string()),
                    }
                }
                menu.backend_save
                    .record_character_result(guid, result.level, result.seconds, result.won);
                if account_eligible {
                    menu.backend_save.apply_run_totals(result.won);
                }
            }
            if let Some(delivery) = delivery.as_ref() {
                game.mark_terminal_summary_saved(delivery, false);
            }
            //1458bb0ff/bb8e3 save every admitted summary, even unchanged.
            menu.commit_account();
            //1458b0a9e admits this second account transaction only from the
            // regular terminal edge. Explicit Again/Menu never deliver five counts.
            if count_eligible && terminal_edge {
                let delta = delivery.as_ref().map_or([0; 5], |d| d.delta_counts);
                menu.backend_save.apply_run_counts(delta);
                granted.extend(crate::progression::grant_run_feats(
                    &mut menu.backend_save,
                    snapshot,
                    game.killing_blows(),
                    game.boss_killing_blows(),
                    game.damaged_by_bosses(),
                    now,
                ));
                granted.extend(crate::progression::grant_account(&mut menu.backend_save, Some(now)));
                if let Some(delivery) = delivery.as_ref() {
                    game.mark_terminal_summary_saved(delivery, true);
                }
                //1458b1df8 saves after checkpoints and grants, even zero deltas.
                menu.commit_account();
            }
        }
    }
    game.events
        .extend(granted.into_iter().map(mechanics::RunEvent::Achievement));
}

fn hud(
    mut commands: Commands,
    session: Res<RunSession>,
    art: Res<MenuArt>,
    locale: Res<crate::localization::Localization>,
    roots: Query<Entity, With<native_overlays::OverlayRoot>>,
    mut previous: Local<String>,
    opened: Res<ChoicePresentation>,
    mut images: ResMut<Assets<Image>>,
    mut rays: Local<Option<Handle<Image>>>,
    coop:Option<Res<crate::coop_runtime::CoopRuntime>>,
    options: Option<Res<crate::options::OptionsState>>,
) {
    if coop.as_ref().is_some_and(|runtime|runtime.is_guest()){return;}
    if session.mechanics.as_ref().is_none_or(|game| game.dead || game.completed) {
        for root in &roots {
            commands.entity(root).despawn();
        }
        previous.clear();
        return;
    }
    // Native Cards root retains its old hierarchy while a new revision waits
    // for the selected-card exit. controls consumes the revision at the gate.
    if opened.renewal_pending {
        return;
    }
    let choosing = session
        .mechanics
        .as_ref()
        .is_some_and(|game| !game.dead && !game.completed && !game.choices.is_empty());
    if !choosing {
        for root in &roots {
            commands.entity(root).despawn();
        }
        previous.clear();
        return;
    }
    let start = opened.at;
    let enabled = !session.paused;
    let game = session.mechanics.as_ref().unwrap();
    let skip_key = options.as_deref().and_then(crate::options::OptionsState::skip_key_label);
    // Payload equality alone cannot identify a fresh consecutive offer.
    // Pause/affordability changes also need fresh Enabled components.
    let stamp = format!(
        "{}:{}:{}:{}:{}:{skip_key:?}",
        opened.at.to_bits(),
        enabled,
        game.cache_choices_active(),
        game.gold,
        offer_signature(game)
    );
    if *previous == stamp {
        return;
    }
    *previous = stamp;
    for root in &roots {
        commands.entity(root).despawn();
    }
    let (area_multiplier, buff_bonus, dot_tick_bonus, global_targets) = game.description_inputs();
    let context = native_overlay_payload::Context {
        maximum_health: game.max_health(),
        damage_multiplier: game.current_damage_multiplier(),
        cooldown_multiplier: game.current_cooldown_multiplier(),
        bonuses: native_overlay_payload::DescriptionBonuses {
            area_multiplier,
            buff_bonus,
            dot_tick_bonus,
            global_targets,
        },
    };
    let cards = game
        .choices
        .iter()
        .enumerate()
        .map(|(index, choice)| {
            let mut card = if let Some(reward) = game.cache_reward(index) {
                native_overlay_payload::for_treasure(reward, game, &art, &locale)
            } else {
                native_overlay_payload::for_choice(choice, game, &context, &art, &locale)
            };
            card.banish = game.can_banish_choice(index);
            card
        })
        .collect();
    let footer = game.choice_footer();
    let ray_image = rays
        .get_or_insert_with(|| {
            images.add(Image::new(
                bevy::render::render_resource::Extent3d {
                    width: 1024,
                    height: 1024,
                    depth_or_array_layers: 1,
                },
                bevy::render::render_resource::TextureDimension::D2,
                native_overlays::ray_pixels(),
                bevy::render::render_resource::TextureFormat::Rgba8UnormSrgb,
                bevy::asset::RenderAssetUsages::default(),
            ))
        })
        .clone();
    native_overlays::spawn(
        &mut commands,
        &art,
        &locale,
        &native_overlays::OverlayState {
            reason: if game.guardian_choices_active() {
                native_overlays::Reason::Guardian
            } else if game.cache_choices_active() {
                native_overlays::Reason::Cache
            } else {
                native_overlays::Reason::LevelUp
            },
            level: game.level,
            cards,
            gold: game.gold.into(),
            inputs_enabled: enabled,
            opened_at: Some(start),
            rerolls: footer.rerolls.into(),
            reroll_cost: footer.reroll_cost.into(),
            can_reroll: footer.can_reroll,
            banishes: footer.banishes.into(),
            skip_gold: footer.skip_gold.map(u64::from),
            skip_key,
            ray_image: Some(ray_image),
            ..Default::default()
        },
    );
}

/// Current1400a4890 trims Unicode White_Space before exact option text checks.
fn native_cvar_text(value: &str) -> &str {
    value.trim()
}

fn offer_signature(game: &Mechanics) -> String {
    format!(
        "{}:{}:{:?}:{:?}",
        game.level,
        game.guardian_choices_active(),
        game.choices,
        game.choice_footer()
    )
}

#[derive(Resource, Default)]
struct ChoicePresentation {
    signature: String,
    at: f32,
    closing: Option<(usize, f32)>,
    confirming: Option<(usize, f32)>,
    renewal_pending: bool,
    store_value: Option<String>,
}

impl ChoicePresentation {
    fn skip(&mut self, now: f32) {
        // A skip closes the hand with every card on the unselected exit leg.
        self.closing = Some((usize::MAX, now));
    }

    /// 0.127.0 stores a pending slot without emitting Select or beginning exit.
    /// Its captured slot is accepted by the modal's ordinary Select command.
    fn select_or_confirm(&mut self, index: usize, replaces: bool, now: f32) -> bool {
        if replaces {
            self.confirming = Some((index, now));
            false
        } else {
            self.closing = Some((index, now));
            true
        }
    }
}
/// Native terminal Menu command9 sends logout-complete before its frontend
/// callback. Again command6 has a separate new-run path and must not send it.
fn finish_client_delivery(
    commands: &mut Commands,
    messages: Vec<benilla_app::local_client::events::SessionEvent>,
    logged_out: bool,
    restarting: bool,
    retiring: Option<mechanics::Retirement>,
) {
    commands.queue(move |world: &mut World| {
        use benilla_app::local_client::{
            LocalClientSession,
            events::{LocalPresentationEvents, flush_events},
        };
        if world.contains_resource::<LocalPresentationEvents>() {
            // Wire decoding appends behind the presentation queue. Drain both
            // old queues before adding retirement, otherwise a pending create
            // could recreate a GUID after its ObjectDestroy in this same flush.
            flush_events(world);
            world
                .resource_mut::<LocalPresentationEvents>()
                .0
                .extend(messages);
            if let Some(retiring) = retiring {
                use benilla_app::local_client::events::SessionEvent;
                let mut retired = retiring.before_items.into_iter()
                    .map(SessionEvent::ObjectDestroyed).collect::<Vec<_>>();
                retired.extend(client::inventory::retire(world));
                let after_items = retiring.after_items.into_iter()
                    .map(SessionEvent::ObjectDestroyed).collect::<Vec<_>>();
                if let Some(mut runtime) = world.get_resource_mut::<crate::coop_runtime::CoopRuntime>() {
                    // Existing synchronized recipients still belong to the old
                    // run here. Publish its queued engine events first, then
                    // retire their GUIDs before the next ZoneKey/bootstrap can
                    // replace actor_clients or reuse the same serials.
                    runtime.flush_engine_events();
                    for event in &retired {
                        if let Ok(Some(packet)) = azeroth_survivors_re::coop::engine_packets::encode(event, None) {
                            runtime.route_world(0, packet);
                        }
                    }
                }
                coop::publication::retire_inventory(world);
                if let Some(mut runtime) = world.get_resource_mut::<crate::coop_runtime::CoopRuntime>() {
                    for event in &after_items {
                        if let Ok(Some(packet)) = azeroth_survivors_re::coop::engine_packets::encode(event, None) {
                            runtime.route_world(0, packet);
                        }
                    }
                }
                retired.extend(after_items);
                world.resource_mut::<LocalPresentationEvents>().0.extend(retired);
            }
            flush_events(world);
            if logged_out {
                // Flush already admitted messages before the real inbound logout
                // handler tears down the player and its sender cache.
                world
                    .resource_mut::<LocalPresentationEvents>()
                    .0
                    .push(benilla_app::local_client::events::SessionEvent::LoggedOut);
                flush_events(world);
            }
        }
        if logged_out {
            // Current Screens poll140192886 clears the retained ready entry on
            // Logout only. Again can temporarily have no Game and keeps it.
            if let Some(mut presence) = world.get_resource_mut::<crate::discord::RunSnapshot>() {
                *presence = crate::discord::RunSnapshot::default();
            }
        }
        let mut session = world.resource_mut::<LocalClientSession>();
        if restarting {
            // Again retains the live client and FrameXML session while the
            // replacement run is prepared; it has no CharSelect/logout edge.
            session.set_paused(true);
        } else if logged_out {
            session.logout();
        } else {
            session.end();
        }
    });
}

fn native_requests(
    mut input: ResMut<benilla_app::local_client::LocalClientInput>,
    client_session: Res<benilla_app::local_client::LocalClientSession>,
    mut session: ResMut<RunSession>,
    mut menu: ResMut<MenuState>,
    mut world: ResMut<ZoneWorld>,
    catalog: Res<MenuCatalog>,
    mut commands: Commands,
    mut exit: MessageWriter<AppExit>,
    mut coop:Option<ResMut<crate::coop_runtime::CoopRuntime>>,
    replica:Option<ResMut<coop::CoopGame>>,
    time:Res<Time>,
    locale:Option<Res<crate::localization::Localization>>,
    mut notifications:ResMut<notifications::Notifications>,
) {
    use benilla_app::local_client::{SessionRequest, events::SessionEvent};
    let mut replica=replica;
    // Current1454440d0 receives CMSG_CANCEL_AURA(0x136) through its default
    // return without a Game mutation. Consume the request without inventing one.
    // Native channel cases: run-presentation/cancel-aura-native.json.
    input.aura_cancels.clear();
    let started = session.started;
    let selected_roster_guid = session.selected_roster_guid;
    let starting_gear = session.starting_gear;
    let showcase = session.showcase;
    let mut active_client = client_session.active;
    for request in std::mem::take(&mut input.session_requests) {
        match request {
            // Current Lua tag4 sends empty CMSG_PLAYER_LOGOUT(0x4a), without
            // local teardown. Current1458b2580 ignores that opcode. It is a
            // different route from ordinary Logout/Quit's request(0x4b).
            SessionRequest::ForceLogout => {}
            // ForceQuit's tag3 queues AppExit directly. It does not turn the
            // current run into an abandoned terminal result before exiting.
            SessionRequest::ForceQuit => {
                exit.write(AppExit::Success);
            }
            SessionRequest::Logout | SessionRequest::Quit => {
                if !active_client {
                    if request == SessionRequest::Quit {
                        exit.write(AppExit::Success);
                    }
                    continue;
                }
                active_client = false;
                let guest = coop.as_deref().is_some_and(|runtime| runtime.is_guest());
                let mut guest_messages = None;
                if guest {
                    if let Some(replica) = replica.as_deref_mut() {
                        let now = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH)
                            .map_or(0, |duration| duration.as_secs());
                        guest_messages = Some(replica.settle(&mut session, &mut menu, &catalog,
                            locale.as_deref(), &mut notifications, now, time.elapsed_secs(), true));
                    }
                } else if let Some(game) = session.mechanics.as_mut().filter(|_| started) {
                    persist_run(game, &mut menu, selected_roster_guid, starting_gear, showcase, started, true);
                }
                if let Some(runtime)=coop.as_deref_mut().filter(|runtime|runtime.is_guest()) {
                    if let Some(driver)=runtime.driver.as_mut() {
                        driver.send_message(None,azeroth_survivors_re::coop::replication::NativeMessage::Lifecycle(
                            azeroth_survivors_re::coop::server_party::LifecyclePacket::Disconnect));
                        driver.flush(time.elapsed_secs_f64());driver.close();
                    }
                    runtime.driver=None;runtime.party.clear();runtime.actor_clients.clear();
                    if let Some(replica)=replica.as_deref_mut(){replica.leave();}
                }
                menu.persist_selection(&catalog);
                world.request = None;
                let mut final_messages = guest_messages.unwrap_or_else(|| session.mechanics.as_mut().map_or_else(Vec::new, |game| {
                    if game.is_party_replica() {
                        client::guest_account_messages(&mut game.events, &catalog, locale.as_deref(),
                            &mut notifications, time.elapsed_secs())
                    } else {
                        client::terminal_talent_messages(game, &catalog, locale.as_deref())
                    }
                }));
                session.mechanics = None;
                session.paused = false;
                session.talent_allocation.clear();
                session.talent_view_open = false;
                session.talent_view_selected = None;
                menu.return_from_run();
                final_messages.push(SessionEvent::LogoutResponse {
                    reason: 0,
                    instant: true,
                });
                finish_client_delivery(
                    &mut commands,
                    final_messages,
                    true,
                    false,
                    None,
                );
                if request == SessionRequest::Quit {
                    // The client exits on logout-complete. This deferred command
                    // follows the response, LoggedOut dispatch and session logout.
                    commands.queue(|world: &mut World| {
                        world.write_message(AppExit::Success);
                    });
                }
            }
            _ => {}
        }
    }
}

/// Ordinary FrameXML queries, action/macro/cast and hovered-GameObject requests.
/// Current AS1458646d0 rejects manual casts with reason0x17 without invoking
/// automatic abilities. Name/time queries retain their independent Game gates.
fn resolved_requests(
    mut requests: ResMut<benilla_app::local_client::LocalClientRequests>,
    mut presentation: ResMut<benilla_app::local_client::events::LocalPresentationEvents>,
    mut session: ResMut<RunSession>,
    world: Res<ZoneWorld>,
    terrain: Option<Res<TerrainStreamer>>,
    tiles: Option<Res<Assets<AdtTile>>>,
    native_floor: Res<world::native_floor::NativeFloor>,
    locale: Res<crate::localization::Localization>,
    local: Option<Res<benilla_app::local_client::LocalClientSession>>,
    mut raid_targets: Option<ResMut<client::raid_targets::RaidTargets>>,
) {
    use benilla_app::local_client::{events::SessionEvent, LocalClientRequest};
    // The local channel outlives the optional AS Game. Metadata and refusals
    // still answer while no Game is retained; only gameplay verbs need it.
    let active = local.as_deref().is_some_and(|s| s.active);
    for request in std::mem::take(&mut requests.0) {
        if let LocalClientRequest::NameQuery { guid } = request {
            if let Some(player) = local.as_deref().filter(|s| s.active).and_then(|s| s.player.as_ref()) {
                if let Some(event) = client::name_queries::name_query(guid, player) {
                    presentation.0.push(event);
                }
            }
            continue;
        }
        if matches!(request, LocalClientRequest::QueryTime) {
            if local.as_deref().is_some_and(|s| s.active) {
                if let Some(event) = client::clock_queries::query_time() {
                    presentation.0.push(event);
                }
            }
            continue;
        }
        if !active {
            continue;
        }
        match request {
            LocalClientRequest::NameQuery { .. } | LocalClientRequest::QueryTime => {
                unreachable!("independent queries drain above")
            }
            LocalClientRequest::SetRaidTarget { icon, guid } => {
                if let Some(board) = raid_targets.as_deref_mut() {
                    presentation.0.extend(board.set(icon, guid));
                }
            }
            LocalClientRequest::InventoryChange { opcode, first, second } => {
                if let Some(event) = client::inventory_requests::refused(opcode, first, second) {
                    presentation.0.push(event);
                }
            }
            LocalClientRequest::CreatureQuery { entry } => {
                if let Some(event) = client::creature_queries::creature_query(entry, &locale) {
                    presentation.0.push(event);
                }
            }
            LocalClientRequest::GameObjectQuery { entry } => {
                if let Some(event) = client::object_queries::gameobject_query(entry, &locale) {
                    presentation.0.push(event);
                }
            }
            LocalClientRequest::CastSpell { spell_id } => {
                presentation.0.push(SessionEvent::CastResult {
                    spell_id,
                    success: false,
                    reason: Some(0x17),
                    arg: None,
                });
            }
            LocalClientRequest::GameObjectUse { guid } => {
                if session.mechanics.is_none() || !world.ready || !session.started || !session.playing() {
                    continue;
                }
                let Some((terrain, tiles)) = terrain.as_deref().zip(tiles.as_deref()) else {
                    continue;
                };
                let Some(floor) = native_floor.terrain_ref() else {
                    continue;
                };
                let position = session.accepted_position.unwrap_or(world.position_wow);
                let mut terrain = WorldTerrain {
                    streamer: terrain,
                    tiles,
                    // Native cache placement/interaction use the prepared floor
                    // cache. No streamed collision ray substitutes for it.
                    collision: None,
                    fallback: position[2],
                    native: Some(floor),
                };
                session.mechanics.as_mut().unwrap().click_cache(
                    guid,
                    Position::from(position),
                    &mut terrain,
                );
            }
        }
    }
}

fn flush_exit(
    mut exits: MessageReader<AppExit>,
    mut menu: ResMut<MenuState>,
    catalog: Res<MenuCatalog>,
) {
    if exits.read().next().is_some() {
        menu.persist_selection(&catalog);
    }
}

/// Current1458fddc7 commits the final admitted/corrected position before its
/// ready-to-running check. An ignored report reaches neither operation.
fn commit_movement_report(
    session: &mut RunSession,
    reported: [f32; 3],
    facing: f32,
    admission: azeroth_survivors_re::floor_recovery::Admission,
) {
    use azeroth_survivors_re::floor_recovery::Admission;
    let position = match admission {
        Admission::Ignored => return,
        Admission::Accepted => reported,
        Admission::Corrected(position) => {
            session.mechanics.as_mut().unwrap().relocate_player(position, facing);
            position
        }
    };
    let previous = session.accepted_position.replace(position);
    if !session.started && movement_begins(previous, position) {
        session.started = true;
    }
}

fn movement_begins(previous: Option<[f32; 3]>, reported: [f32; 3]) -> bool {
    previous.is_some_and(|old| {
        let dx = reported[0] - old[0];
        let dy = reported[1] - old[1];
        dx * dx + dy * dy > f32::from_bits(0x3d23d70a)
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn solo_again_retains_entry_loadout_and_pity_but_fresh_play_recaptures_save() {
        let armory = crate::armory::ArmoryCatalog::embedded();
        let mut save = crate::save::Save::parse(
            "42|Saved|1|1|0|0,0,0,0,0|1|0|0|0\nitems|101000\nequip|1|0:101000\nstars|101000:2\npity|101000:3,102000:9\n",
        ).unwrap();
        let mut session = RunSession::default();
        session.prepare_entry_loadout(&armory, &save, 1, 1, None);
        let mut first_gear = [0; 19];
        first_gear[0] = 101000;
        let mut first_stars = [0; 19];
        first_stars[0] = 2;
        assert_eq!(session.starting_gear, first_gear);
        assert_eq!(session.starting_stars, first_stars);
        assert_eq!(session.starting_weapon_glow, 1894);
        assert_eq!(session.starting_pity, [(101000, 3)]);
        let first_effects = session.starting_gear_effects.clone();
        assert!(!first_effects.is_empty());
        let mut game = fixture_game();
        game.configure_armor_set(first_gear, first_stars);
        game.set_equipment_pity(&session.starting_pity);
        game.configure_effects(&[], &first_effects);
        session.mechanics = Some(game);

        // An account delivery/gear edit and the old Game's live pity/effects
        // must not become the original Config supplied by command6.
        save.replace_runtime_records(|line| ["items|", "equip|", "stars|", "pity|"]
            .iter().any(|prefix| line.starts_with(*prefix)), [
            "items|101010".to_owned(), "equip|1|0:101010".to_owned(),
            "stars|101010:4".to_owned(), "pity|101000:99,101010:7,102000:66".to_owned(),
        ]);
        assert!(save.set_weapon_glow(1, 0));
        assert_eq!(save.weapon_glow(1), 0);
        let changed = crate::armory::GearSave::read_for(&save, 1, 1);
        let changed_effects = changed.effects(&armory, 1);
        assert_ne!(changed_effects, first_effects);
        let game = session.mechanics.as_mut().unwrap();
        game.configure_armor_set([0; 19], [0; 19]);
        game.set_equipment_pity(&[(101000, 200)]);
        game.configure_effects(&[], &changed_effects);
        session.solo_again = true;
        let owned_now = session.prepare_entry_loadout(&armory, &save, 1, 1, Some(0));
        assert_eq!(session.starting_gear, first_gear);
        assert_eq!(session.starting_stars, first_stars);
        assert_eq!(session.starting_weapon_glow, 1894);
        assert_eq!(session.starting_gear_effects, first_effects);
        assert_eq!(session.starting_pity, [(101000, 3)]);
        assert!(!session.solo_again);
        assert!(owned_now.contains(&101010) && !owned_now.contains(&101000));

        // Even a stale intent flag cannot make fresh Play reuse the Config.
        session.solo_again = true;
        session.prepare_entry_loadout(&armory, &save, 1, 1, None);
        let mut next_gear = [0; 19];
        next_gear[0] = 101010;
        let mut next_stars = [0; 19];
        next_stars[0] = 4;
        assert_eq!(session.starting_gear, next_gear);
        assert_eq!(session.starting_stars, next_stars);
        assert_eq!(session.starting_weapon_glow, 0);
        assert_eq!(session.starting_gear_effects, changed_effects);
        assert_eq!(session.starting_pity, [(101000, 99), (101010, 7)]);
        assert!(!session.solo_again);

        // A co-op restart's rank marker alone is not local Again intent.
        session.starting_gear = [0; 19];
        session.starting_weapon_glow = 1894;
        session.prepare_entry_loadout(&armory, &save, 1, 1, Some(5));
        assert_eq!(session.starting_gear, next_gear);
        assert_eq!(session.starting_weapon_glow, 0);
    }

    #[test]
    fn unknown_runtime_zone_uses_native_default_and_preserves_the_pick() {
        let game = fixture_game();
        let resolved = Mechanics::new("obsolete-zone", game.class.key, game.rules, game.stats,
            [1, 2, 3, 4]).unwrap();
        assert_eq!(resolved.zone.key, "elwynn");
        let mut save = crate::save::Save::parse(
            "42|Saved|1|1|0|0,0,0,0,0|1|0|0|0\n",
        ).unwrap();
        // Loading/normal picker commits already normalize keys. Exercise a
        // noncanonical runtime/API input without changing those file rules.
        save.replace_runtime_records(|line| line.starts_with("pick|"), [
            "pick|1|1|0|obsolete-zone|Saved|0,0,0,0,0|100,100,100,100".to_owned(),
        ]);
        let armory = crate::armory::ArmoryCatalog::embedded();
        let actual = stock_roster(&save, "obsolete-zone", &armory, None);
        let expected = stock_roster(&save, "elwynn", &armory, None);
        assert_eq!(actual.len(), 1);
        assert_eq!(expected.len(), 1);
        assert_eq!((actual[0].guid, actual[0].zone, actual[0].map),
                   (expected[0].guid, expected[0].zone, expected[0].map));
        assert_eq!([actual[0].position.x, actual[0].position.y, actual[0].position.z],
                   [expected[0].position.x, expected[0].position.y, expected[0].position.z]);
        assert_eq!(save.pick().unwrap().zone, "obsolete-zone");
    }

    #[test]
    fn terminal_again_keeps_the_local_client_active_while_the_run_is_replaced() {
        use bevy::ecs::system::RunSystemOnce;
        use benilla_app::local_client::{LocalClientSession, LocalPlayerUi};
        let mut world = World::new();
        let mut client = LocalClientSession::default();
        client.begin(LocalPlayerUi { guid: 1, name: "Stock".into(), ..Default::default() });
        world.insert_resource(client);
        world.run_system_once(|mut commands: Commands| {
            finish_client_delivery(&mut commands, Vec::new(), false, true, None);
        }).unwrap();
        let client = world.resource::<LocalClientSession>();
        assert!(client.active && client.paused);
        assert!(!client.logged_out);
        assert_eq!(client.player.as_ref().map(|row| row.name.as_str()), Some("Stock"));
    }

    fn fixture_game() -> Mechanics {
        Mechanics::new(
            "elwynn",
            "warrior",
            RunRules { heroic_rank: 0,
                difficulty: 1.,
                density_percent: 100,
                hp_percent: 100,
                damage_percent: 100,
                speed_percent: 100,
                endless: false,
            },
            RunPlayerStats {
                maximum_health: 100.,
                health_per_level: 9.,
                health_multiplier: 1.,
                regeneration: 0.8,
                pickup_radius: 5.,
                luck_bonus: 0.,
                heal_on_kill: 0.,
                armor_fraction: 0.,
                damage_reduction: 0.,
                damage_multiplier: 1.,
                cooldown_multiplier: 1.,
                critical_chance: 0.,
                critical_multiplier: 1.5,
                experience_multiplier: 1.,
                gold_multiplier: 1.,
                native_race: 1,
                packed_player_field: 0x0101,
            },
            [1, 2, 3, 4],
        )
        .unwrap()
    }

    #[test]
    fn current_level_cvar_text_and_flags_match_native_whitespace_cases() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.100.1/target-menu/cvar-trim-native.json"
        ))
        .unwrap();
        for case in fixture["cases"].as_array().unwrap() {
            let value = native_cvar_text(case["input"].as_str().unwrap());
            assert_eq!(value, case["trimmed"].as_str().unwrap());
            assert_eq!(value == "1", case["store_or_spend"].as_bool().unwrap());
            assert_eq!(value != "0", case["hud"].as_bool().unwrap());
        }
    }

    #[test]
    fn resolved_manual_casts_reject_actual_identities_once_without_mutating_the_run() {
        use benilla_app::local_client::{
            events::{LocalPresentationEvents, SessionEvent},
            LocalClientRequest, LocalClientRequests,
        };
        let mut app = App::new();
        let game = fixture_game();
        let health = game.health();
        let abilities = game
            .abilities
            .iter()
            .map(|a| a.remaining)
            .collect::<Vec<_>>();
        app.insert_resource(RunSession {
            mechanics: Some(game),
            ..default()
        })
        .insert_resource(LocalClientRequests(vec![
            LocalClientRequest::CastSpell { spell_id: 116 },
            LocalClientRequest::GameObjectUse {
                guid: 0xf11000232d000007,
            },
            LocalClientRequest::CastSpell { spell_id: 10 },
        ]))
        .insert_resource(benilla_app::local_client::LocalClientSession { active: true, ..default() })
        .init_resource::<LocalPresentationEvents>()
        .insert_resource(crate::localization::Localization::english_for_tests())
        .init_resource::<ZoneWorld>()
        .init_resource::<world::native_floor::NativeFloor>()
        .add_systems(Update, resolved_requests);
        app.update();
        let events = &app.world().resource::<LocalPresentationEvents>().0;
        assert_eq!(events.len(), 2);
        for (event, expected) in events.iter().zip([116, 10]) {
            assert!(matches!(event, SessionEvent::CastResult {
                spell_id, success: false, reason: Some(0x17), arg: None
            } if *spell_id == expected));
        }
        let run = app.world().resource::<RunSession>();
        let game = run.mechanics.as_ref().unwrap();
        assert_eq!((game.clock, game.health()), (0.0, health));
        assert_eq!(
            game.abilities
                .iter()
                .map(|a| a.remaining)
                .collect::<Vec<_>>(),
            abilities
        );
        assert!(game.events.is_empty());
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 2);
        assert!(app.world().resource::<LocalClientRequests>().0.is_empty());
    }

    #[test]
    fn inventory_refusals_reply_once_before_world_ready_and_drain_when_inactive() {
        use benilla_app::local_client::{events::{LocalPresentationEvents, SessionEvent},
            LocalClientRequest, LocalClientRequests};
        let request = |opcode, first, second| LocalClientRequest::InventoryChange {
            opcode, first, second,
        };
        let mut app = App::new();
        app.insert_resource(RunSession { mechanics: Some(fixture_game()), ..default() })
            .insert_resource(benilla_app::local_client::LocalClientSession { active: true, ..default() })
            .insert_resource(LocalClientRequests(vec![request(0x10a, 255, 2),
                request(0x10d, 18, 3), request(0x111, 255, 19)]))
            .init_resource::<LocalPresentationEvents>()
            .insert_resource(crate::localization::Localization::english_for_tests())
            .init_resource::<ZoneWorld>()
            .init_resource::<world::native_floor::NativeFloor>()
            .add_systems(Update, resolved_requests);
        app.update();
        let events = &app.world().resource::<LocalPresentationEvents>().0;
        assert_eq!(events.len(), 3);
        for (event, (expected_reason, expected_guid)) in events.iter().zip([
            (0x15, 0x4000_0000_0000_0102), (0x15, 0x4000_0000_0000_0112), (0x18, 0),
        ]) {
            assert!(matches!(event, SessionEvent::InventoryFailure { reason, item_guid,
                required_level: None, item2_guid: 0, bag_slot: 0 }
                if *reason == expected_reason && *item_guid == expected_guid));
        }
        assert_eq!(app.world().resource::<RunSession>().mechanics.as_ref().unwrap().clock, 0.);
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 3);
        app.world_mut().resource_mut::<benilla_app::local_client::LocalClientSession>().active = false;
        app.world_mut().resource_mut::<LocalClientRequests>().0.push(request(0x10a, 255, 2));
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 3);
        assert!(app.world().resource::<LocalClientRequests>().0.is_empty());
    }

    #[test]
    fn clock_queries_reply_once_without_a_character_or_optional_game() {
        use benilla_app::local_client::{events::{LocalPresentationEvents, SessionEvent},
            LocalClientRequest, LocalClientRequests, LocalClientSession};
        let mut app = App::new();
        app.init_resource::<RunSession>()
            .insert_resource(LocalClientSession { active: true, ..default() })
            .insert_resource(LocalClientRequests(vec![LocalClientRequest::QueryTime]))
            .init_resource::<LocalPresentationEvents>()
            .insert_resource(crate::localization::Localization::english_for_tests())
            .init_resource::<ZoneWorld>()
            .init_resource::<world::native_floor::NativeFloor>()
            .add_systems(Update, resolved_requests);
        app.update();
        assert!(matches!(&app.world().resource::<LocalPresentationEvents>().0[..],
            [SessionEvent::ServerUnixTime { .. }]));
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 1);
        app.world_mut().resource_mut::<LocalClientSession>().active = false;
        app.world_mut().resource_mut::<LocalClientRequests>().0.push(LocalClientRequest::QueryTime);
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 1);
        assert!(app.world().resource::<LocalClientRequests>().0.is_empty());
    }

    #[test]
    fn name_queries_use_the_retained_character_without_an_optional_game() {
        use benilla_app::local_client::{events::{LocalPresentationEvents, SessionEvent},
            LocalClientRequest, LocalClientRequests, LocalClientSession, LocalPlayerUi};
        let mut app = App::new();
        app.init_resource::<RunSession>()
            .insert_resource(LocalClientSession { active: true, player: Some(LocalPlayerUi {
                guid: 1, name: "Tester".into(), race: 4, sex: 1, class: 8, ..default()
            }), ..default() })
            .insert_resource(LocalClientRequests(vec![LocalClientRequest::NameQuery { guid: u64::MAX }]))
            .init_resource::<LocalPresentationEvents>()
            .insert_resource(crate::localization::Localization::english_for_tests())
            .init_resource::<ZoneWorld>()
            .init_resource::<world::native_floor::NativeFloor>()
            .add_systems(Update, resolved_requests);
        app.update();
        let events = &app.world().resource::<LocalPresentationEvents>().0;
        assert!(matches!(&events[..], [SessionEvent::PlayerName {
            guid: u64::MAX, name, race: 4, gender: 1, class: 8
        }] if name == "Tester"));
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 1);
        app.world_mut().resource_mut::<LocalClientSession>().player = None;
        app.world_mut().resource_mut::<LocalClientRequests>().0.push(LocalClientRequest::NameQuery { guid: 3 });
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 1);
        {
            let mut local = app.world_mut().resource_mut::<LocalClientSession>();
            local.player = Some(LocalPlayerUi::default());
            local.active = false;
        }
        app.world_mut().resource_mut::<LocalClientRequests>().0.push(LocalClientRequest::NameQuery { guid: 4 });
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 1);
        assert!(app.world().resource::<LocalClientRequests>().0.is_empty());
    }

    #[test]
    fn creature_queries_reply_once_before_world_ready_and_drain_when_inactive() {
        use benilla_app::local_client::{events::{LocalPresentationEvents, SessionEvent},
            LocalClientRequest, LocalClientRequests};
        let mut app = App::new();
        app.insert_resource(RunSession { mechanics: Some(fixture_game()), ..default() })
            .insert_resource(benilla_app::local_client::LocalClientSession { active: true, ..default() })
            .insert_resource(LocalClientRequests([600, 690, 9613, 9513].map(|entry|
                LocalClientRequest::CreatureQuery { entry }).into()))
            .init_resource::<LocalPresentationEvents>()
            .insert_resource(crate::localization::Localization::english_for_tests())
            .init_resource::<ZoneWorld>()
            .init_resource::<world::native_floor::NativeFloor>()
            .add_systems(Update, resolved_requests);
        app.update();
        let events = &app.world().resource::<LocalPresentationEvents>().0;
        assert_eq!(events.len(), 4);
        for (event, (expected, kind, rank, display)) in events.iter().zip([
            (600, Some(7), 0, 26), (690, Some(7), 3, 384),
            (9613, Some(8), 0, 16033), (9513, None, 0, 0),
        ]) {
            assert!(matches!(event, SessionEvent::CreatureName { entry, creature_type,
                rank: actual_rank, display_id, .. } if *entry == expected
                && *creature_type == kind && *actual_rank == rank && *display_id == display));
        }
        assert_eq!(app.world().resource::<RunSession>().mechanics.as_ref().unwrap().clock, 0.);
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 4);
        app.world_mut().resource_mut::<benilla_app::local_client::LocalClientSession>().active = false;
        app.world_mut().resource_mut::<LocalClientRequests>().0.push(
            LocalClientRequest::CreatureQuery { entry: 600 });
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 4);
        assert!(app.world().resource::<LocalClientRequests>().0.is_empty());
    }

    #[test]
    fn stateless_replies_outlive_game_but_stop_with_the_local_channel() {
        use benilla_app::local_client::{events::{LocalPresentationEvents, SessionEvent},
            LocalClientRequest, LocalClientRequests, LocalClientSession};
        let requests = || vec![
            LocalClientRequest::CreatureQuery { entry: 600 },
            LocalClientRequest::GameObjectUse { guid: 0xf110_0023_2d00_0007 },
            LocalClientRequest::GameObjectQuery { entry: 9005 },
            LocalClientRequest::InventoryChange { opcode: 0x10a, first: 255, second: 2 },
            LocalClientRequest::CastSpell { spell_id: 116 },
        ];
        let mut app = App::new();
        app.init_resource::<RunSession>()
            .insert_resource(LocalClientSession { active: true, ..default() })
            .insert_resource(LocalClientRequests(requests()))
            .init_resource::<LocalPresentationEvents>()
            .insert_resource(crate::localization::Localization::english_for_tests())
            .init_resource::<ZoneWorld>()
            .init_resource::<world::native_floor::NativeFloor>()
            .add_systems(Update, resolved_requests);
        app.update();
        let events = &app.world().resource::<LocalPresentationEvents>().0;
        assert!(matches!(&events[..], [
            SessionEvent::CreatureName { entry: 600, .. },
            SessionEvent::GameObjectInfo { entry: 9005, .. },
            SessionEvent::InventoryFailure { reason: 0x15, item_guid: 0x4000_0000_0000_0102, .. },
            SessionEvent::CastResult { spell_id: 116, success: false, reason: Some(0x17), .. },
        ]));
        assert!(app.world().resource::<RunSession>().mechanics.is_none());
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 4);
        // A stale Game cannot keep a disconnected local channel answering.
        app.world_mut().resource_mut::<RunSession>().mechanics = Some(fixture_game());
        app.world_mut().resource_mut::<LocalClientSession>().active = false;
        app.world_mut().resource_mut::<LocalClientRequests>().0 = requests();
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 4);
        assert!(app.world().resource::<LocalClientRequests>().0.is_empty());
    }

    #[test]
    fn solo_raid_target_replies_preserve_request_order_without_a_game() {
        use benilla_app::local_client::{events::{LocalPresentationEvents, SessionEvent},
            LocalClientRequest, LocalClientRequests, LocalClientSession};
        let mut app = App::new();
        app.init_resource::<RunSession>()
            .insert_resource(LocalClientSession { active: true, ..default() })
            .init_resource::<client::raid_targets::RaidTargets>()
            .insert_resource(LocalClientRequests(vec![
                LocalClientRequest::CastSpell { spell_id: 116 },
                LocalClientRequest::SetRaidTarget { icon: 7, guid: 99 },
                LocalClientRequest::InventoryChange { opcode: 0x10a, first: 255, second: 2 },
                LocalClientRequest::SetRaidTarget { icon: 0, guid: 99 },
            ]))
            .init_resource::<LocalPresentationEvents>()
            .insert_resource(crate::localization::Localization::english_for_tests())
            .init_resource::<ZoneWorld>()
            .init_resource::<world::native_floor::NativeFloor>()
            .add_systems(Update, resolved_requests);
        app.update();
        assert!(app.world().resource::<RunSession>().mechanics.is_none());
        assert!(matches!(&app.world().resource::<LocalPresentationEvents>().0[..], [
            SessionEvent::CastResult { spell_id: 116, .. },
            SessionEvent::RaidTargetSet { icon: 7, guid: 99 },
            SessionEvent::InventoryFailure { .. },
            SessionEvent::RaidTargetSet { icon: 7, guid: 0 },
            SessionEvent::RaidTargetSet { icon: 0, guid: 99 },
        ]));
        app.update();
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 5);
        app.world_mut().resource_mut::<LocalClientSession>().active = false;
        app.world_mut().resource_mut::<LocalClientRequests>().0.push(
            LocalClientRequest::SetRaidTarget { icon: 0, guid: 0 });
        app.update();
        assert!(app.world().resource::<LocalClientRequests>().0.is_empty());
        assert_eq!(app.world().resource::<LocalPresentationEvents>().0.len(), 5);
    }

    #[test]
    fn ready_admission_uses_controller_reports_and_only_xy() {
        assert!(!movement_begins(None, [1., 2., 3.]));
        assert!(!movement_begins(Some([1., 2., 3.]), [1., 2., 8.]));
        assert!(!movement_begins(Some([0.; 3]), [0.19999, 0., 0.]));
        assert!(movement_begins(Some([0.; 3]), [0.20001, 0., 0.]));
        // Ordinary per-frame movement at60FPS is below the threshold;
        // the controller's half-second movement report admits the same walk.
        assert!(!movement_begins(Some([0.; 3]), [7. / 60., 0., 0.]));
        assert!(movement_begins(Some([0.; 3]), [3.5, 0., 0.]));
    }

    #[test]
    fn correction_commits_its_position_and_teleport_before_starting_the_run() {
        use azeroth_survivors_re::floor_recovery::Admission;
        let mut session = RunSession {
            mechanics: Some(fixture_game()),
            accepted_position: Some([-9396., -633., 0.]),
            ..default()
        };
        let corrected = [-9395., -633., 0.5];
        commit_movement_report(&mut session, [-9395., -633., -100.], 1.25,
            Admission::Corrected(corrected));
        assert!(session.started);
        assert_eq!(session.accepted_position, Some(corrected));
        let packets = session.mechanics.as_mut().unwrap().drain_player_mover();
        assert_eq!(packets.len(), 1);
        assert!(matches!(packets[0], mechanics::PlayerMoverEvent::Teleport {
            position, facing, ..
        } if position == corrected && facing == 1.25));
    }

    #[test]
    fn ready_transition_uses_final_xy_and_ignored_reports_have_no_effect() {
        use azeroth_survivors_re::floor_recovery::Admission;
        let origin = [-9270., -633., 0.5];
        let mut session = RunSession {
            mechanics: Some(fixture_game()), accepted_position: Some(origin), ..default()
        };
        // Raw movement is large, but correction returns to the current point.
        commit_movement_report(&mut session, [-9200., -633., 0.], 0.,
            Admission::Corrected(origin));
        assert!(!session.started);
        session.mechanics.as_mut().unwrap().drain_player_mover();
        commit_movement_report(&mut session, [0.; 3], 0., Admission::Ignored);
        assert_eq!(session.accepted_position, Some(origin));
        assert!(!session.started);
        assert!(session.mechanics.as_mut().unwrap().drain_player_mover().is_empty());
        commit_movement_report(&mut session, [-9270., -633., 500.], 0., Admission::Accepted);
        assert!(!session.started);
        commit_movement_report(&mut session, [-9269., -633., 500.], 0., Admission::Accepted);
        assert!(session.started);
    }

    #[test]
    fn terminal_delivery_is_once_and_preserves_the_saved_pick() {
        let mut menu = MenuState::from_save_path(None);
        menu.backend_save = crate::save::Save::parse(
            "42|Saved|1|1|0|0,0,0,0,0|1|0|0|0\npick|1|1|0|elwynn|Saved|0,0,0,0,0|100,100,100,100\n",
        ).unwrap();
        menu.save = crate::save::Save::parse("stat|kills=7000\n").unwrap();
        let frontend = menu.save.plaintext();
        let pick = menu.backend_save.pick();
        let mut game = fixture_game();
        game.clock = 60.;
        game.kills = 100;
        game.level = 8;
        game.abandon(|_| None);
        persist_run(&mut game, &mut menu, Some(42), [0; 19], false, true, false);
        let once = menu.backend_save.plaintext();
        persist_run(&mut game, &mut menu, Some(42), [0; 19], false, true, false);
        assert_eq!(menu.backend_save.plaintext(), once);
        assert_eq!(menu.save.plaintext(), frontend);
        assert_eq!(menu.backend_save.pick(), pick);
        assert_eq!(menu.backend_save.statistics()["runs"], 1);
        assert_eq!(menu.backend_save.statistics()["kills"], 100);
        let hero = &menu.backend_save.characters()[0];
        assert_eq!(
            (hero.best_level, hero.best_seconds, hero.runs, hero.wins),
            (8, 60, 1, 0)
        );
    }

    #[test]
    fn current_account_delivery_dates_feats_and_terminal_grants_once() {
        let mut menu = MenuState::from_save_path(None);
        let mut game = fixture_game();
        game.clock = 480.;
        game.kills = 2500;
        game.completed = true;
        persist_run_at(
            &mut game,
            &mut menu,
            Some(0x00ff_fffe),
            [0; 19],
            false,
            true,
            1700000000,
            false,
        );
        let earned = menu.backend_save.earned_achievements();
        let feats = azeroth_survivors_re::account_progression::definitions()
            .iter()
            .filter(|definition| definition.kind == 9 && earned.contains(&definition.key))
            .map(|definition| definition.key.clone())
            .collect::<Vec<_>>();
        assert!(!feats.is_empty());
        let delivered = game
            .events
            .iter()
            .filter_map(|event| match event {
                mechanics::RunEvent::Achievement(key) => Some(key.clone()),
                _ => None,
            })
            .collect::<Vec<_>>();
        assert_eq!(&delivered[..feats.len()], &feats);
        assert!(
            delivered
                .iter()
                .all(|key| menu.backend_save.achievement_dates()[key] == 1700000000)
        );
        assert_eq!(menu.backend_save.statistics()["runs"], 1);
        assert_eq!(menu.backend_save.statistics()["wins"], 1);
        assert!(menu.backend_save.beaten_zones().contains(&(1, 0)));
        game.events.clear();
        let once = menu.backend_save.plaintext();
        persist_run_at(
            &mut game,
            &mut menu,
            Some(0x00ff_fffe),
            [0; 19],
            false,
            true,
            1700000100,
            false,
        );
        assert_eq!(menu.backend_save.plaintext(), once);
        assert!(
            !game
                .events
                .iter()
                .any(|event| matches!(event, mechanics::RunEvent::Achievement(_)))
        );
    }

    #[test]
    fn ready_still_drains_seen_while_excluding_run_feats() {
        let mut game = fixture_game();
        game.configure_effects(&[], &[]);
        game.kills = 6000;
        let mut app = App::new();
        app.insert_resource(MenuState::from_save_path(None))
            .insert_resource(RunSession {
                mechanics: Some(game),
                started: false,
                selected_roster_guid: Some(0x00ff_fffe),
                ..default()
            })
            .add_systems(Update, account_delivery);
        app.update();
        let menu = app.world().resource::<MenuState>();
        assert!(!menu.backend_save.seen().is_empty());
        assert!(menu.backend_save.earned_achievements().is_empty());
        assert_eq!(menu.backend_save.statistics().get("runs").copied().unwrap_or(0), 0);
    }

    #[test]
    fn choice_pause_keeps_account_delivery_active_without_advancing_simulation() {
        let mut game = fixture_game();
        game.clock = 300.;
        game.kills = 2500;
        game.add_experience(5);
        assert!(game.is_paused_for_choice());
        let clock = game.clock;
        let mut app = App::new();
        app.insert_resource(MenuState::from_save_path(None))
            .insert_resource(RunSession {
                mechanics: Some(game),
                started: true,
                selected_roster_guid: Some(0x00ff_fffe),
                ..default()
            })
            .add_systems(Update, account_delivery);
        app.update();
        let menu = app.world().resource::<MenuState>();
        assert!(!menu.backend_save.earned_achievements().is_empty());
        assert_eq!(menu.backend_save.statistics().get("runs").copied().unwrap_or(0), 0);
        let game = app
            .world()
            .resource::<RunSession>()
            .mechanics
            .as_ref()
            .unwrap();
        assert_eq!(game.clock, clock);
        assert!(game.is_paused_for_choice());
        assert!(game
            .events
            .iter()
            .any(|event| matches!(event, mechanics::RunEvent::Achievement(_))));
    }

    #[test]
    fn feats_and_five_counts_exclude_showcase_but_result_grants_use_guid() {
        for (guid, showcase) in [(0x00ff_ffff, false), (0x00ff_fffe, true)] {
            let mut menu = MenuState::from_save_path(None);
            let mut game = fixture_game();
            game.clock = 1800.;
            game.kills = 6000;
            game.completed = true;
            persist_run_at(
                &mut game,
                &mut menu,
                Some(guid),
                [0; 19],
                showcase,
                true,
                1700000000,
                false,
            );
            assert!(menu.backend_save.earned_achievements().is_empty());
            assert_eq!(menu.backend_save.statistics().get("kills").copied().unwrap_or(0), 0);
            assert_eq!(
                menu.backend_save.statistics().get("runs").copied().unwrap_or(0),
                u64::from(guid != 0x00ff_ffff)
            );
            assert_eq!(
                menu.backend_save.talent_xp(game.class.class_id) != 0,
                guid != 0x00ff_ffff
            );
        }
    }

    #[test]
    fn terminal_saves_xp_bests_unlock_and_counts_in_native_snapshot_order() {
        let mut menu = MenuState::from_save_path(None);
        menu.backend_save = crate::save::Save::parse("42|Hero|1|1|0|0,0,0,0,0|1|0|0|0\n").unwrap();
        let mut game = fixture_game();
        game.clock = 1800.;
        game.kills = 100;
        game.level = 20;
        game.completed = true;
        persist_run_at(
            &mut game,
            &mut menu,
            Some(42),
            [0; 19],
            false,
            true,
            1700000000,
            false,
        );
        let saves = menu.account_snapshots();
        let xp = saves.iter().position(|save| save.talent_xp(1) > 0).unwrap();
        assert_eq!(saves[xp].characters()[0].best_level, 1);
        assert_eq!(saves[xp].statistics().get("runs").copied().unwrap_or(0), 0);
        assert_eq!(saves[xp + 1].characters()[0].best_level, 20);
        assert_eq!(saves[xp + 1].unlock_value(1), Some(2));
        assert_eq!(
            saves[xp + 1].statistics().get("runs").copied().unwrap_or(0),
            0
        );
        assert_eq!(saves[xp + 2].statistics()["runs"], 1);
        assert_eq!(
            saves[xp + 2]
                .statistics()
                .get("kills")
                .copied()
                .unwrap_or(0),
            0
        );
        assert_eq!(saves[xp + 3].statistics()["kills"], 100);
        assert_eq!(saves[xp + 3].characters()[0].runs, 1);
        assert_eq!(saves.len(), xp + 4);
        let revision = menu.save_revision;
        persist_run_at(
            &mut game,
            &mut menu,
            Some(42),
            [0; 19],
            false,
            true,
            1700000001,
            false,
        );
        assert_eq!(menu.save_revision, revision);
        persist_run_at(
            &mut game,
            &mut menu,
            Some(42),
            [0; 19],
            false,
            true,
            1700000002,
            true,
        );
        assert_eq!(menu.save_revision, revision + 1);
        assert_eq!(menu.backend_save.statistics()["kills"], 100);
    }

    #[test]
    fn logout_from_ready_does_not_create_a_terminal_result() {
        use benilla_app::local_client::{LocalClientInput, LocalClientSession, SessionRequest};
        let mut app = App::new();
        let menu = MenuState::from_save_path(None);
        let original = menu.backend_save.plaintext();
        let mut input = LocalClientInput::default();
        input.session_requests.push(SessionRequest::Logout);
        app.insert_resource(input)
            .insert_resource(RunSession {
                mechanics: Some(fixture_game()),
                ..default()
            })
            .insert_resource(menu)
            .init_resource::<ZoneWorld>()
            .insert_resource(LocalClientSession {
                active: true,
                ..default()
            })
            .init_resource::<MenuCatalog>()
            .add_message::<AppExit>()
            .init_resource::<Time>()
            .init_resource::<notifications::Notifications>()
            .add_systems(Update, native_requests);
        app.update();
        assert!(app.world().resource::<RunSession>().mechanics.is_none());
        assert_eq!(
            app.world().resource::<MenuState>().backend_save.plaintext(),
            original
        );
    }
    fn choice_controls_app(
        game: Mechanics,
        keys: ButtonInput<KeyCode>,
        input: benilla_app::local_client::LocalClientInput,
    ) -> App {
        use benilla_app::local_client::{LocalClientSession, LocalClientExtension, LocalLoadingScreen};
        let mut menu = MenuState::from_save_path(None);
        menu.in_run = true;
        let mut app = App::new();
        app.insert_resource(keys)
            .insert_resource(input)
            .insert_resource(menu)
            .insert_resource(RunSession { mechanics: Some(game), ..default() })
            .init_resource::<LocalClientSession>()
            .init_resource::<LocalClientExtension>()
            .init_resource::<LocalLoadingScreen>()
            .init_resource::<ZoneWorld>()
            .init_resource::<Time>()
            .init_resource::<ChoicePresentation>()
            .init_resource::<crate::options::OptionsState>()
            .init_resource::<run_hud::Pause>()
            .add_systems(Update, controls);
        app
    }

    #[test]
    fn amulet_modal_cancel_keeps_offer_and_original_open_clock() {
        use benilla_app::local_client::LocalClientInput;
        let mut game = fixture_game();
        game.add_experience(5);
        let signature = offer_signature(&game);
        let mut input = LocalClientInput::default();
        input.custom_game_menu_requested = true;
        let mut app = choice_controls_app(game, default(), input);
        app.add_systems(Update, confirmation_controls.after(controls));
        app.insert_resource(ChoicePresentation { signature: signature.clone(), at: -1.,
            confirming: Some((0, -0.25)), ..default() });
        app.update();
        let presentation = app.world().resource::<ChoicePresentation>();
        assert!(presentation.confirming.is_none() && presentation.closing.is_none());
        assert_eq!(presentation.at, -1.);
        assert_eq!(offer_signature(app.world().resource::<RunSession>().mechanics.as_ref().unwrap()), signature);
    }

    #[test]
    fn amulet_modal_on_top_pointer_does_not_block_enter_or_add_an_age_gate() {
        use benilla_app::local_client::{LocalClientExtension, LocalClientInput};
        let mut game = fixture_game();
        game.add_experience(5);
        let signature = offer_signature(&game);
        let mut app = choice_controls_app(game, default(), LocalClientInput::default());
        app.add_systems(Update, confirmation_controls.after(controls));
        app.insert_resource(ChoicePresentation { signature, at: 0.,
            confirming: Some((0, 0.)), ..default() });
        app.world_mut().resource_mut::<LocalClientExtension>().on_top_pointer = true;
        app.world_mut().spawn((Interaction::Pressed, native_overlays::OverlayAction::Confirm,
            native_overlays::Enabled(true)));
        app.update();
        assert!(app.world().resource::<ChoicePresentation>().confirming.is_some());
        app.world_mut().resource_mut::<ButtonInput<KeyCode>>().press(KeyCode::Enter);
        app.world_mut().resource_mut::<LocalClientInput>().game_menu_open = true;
        app.update();
        let presentation = app.world().resource::<ChoicePresentation>();
        assert!(presentation.confirming.is_none());
        assert_eq!(presentation.closing, Some((0, 0.)));
        assert!(presentation.renewal_pending);
    }

    #[test]
    fn amulet_modal_cancel_and_digit_follow_either_admitted_handler_order() {
        use benilla_app::local_client::LocalClientInput;
        for modal_first in [false, true] {
            let mut game = fixture_game();
            game.add_experience(5);
            let signature = offer_signature(&game);
            let mut keys = ButtonInput::<KeyCode>::default();
            keys.press(KeyCode::Digit1);
            let mut input = LocalClientInput::default();
            input.custom_game_menu_requested = true;
            let mut app = choice_controls_app(game, keys, input);
            app.insert_resource(ChoicePresentation { signature, at: -1.,
                confirming: Some((0, -0.25)), ..default() });
            if modal_first {
                app.add_systems(Update, confirmation_controls.before(controls));
            } else {
                app.add_systems(Update, confirmation_controls.after(controls));
            }
            app.update();
            let presentation = app.world().resource::<ChoicePresentation>();
            assert!(presentation.confirming.is_none());
            assert_eq!(presentation.closing.is_some(), modal_first);
        }
    }

    #[test]
    fn newly_published_amulet_pending_has_no_intrinsic_extra_frame_gate() {
        fn publish_pending(mut presentation: ResMut<ChoicePresentation>, time: Res<Time>) {
            assert!(!presentation.select_or_confirm(0, true, time.elapsed_secs()));
        }
        for modal_first in [false, true] {
            let mut game = fixture_game();
            game.add_experience(5);
            let signature = offer_signature(&game);
            let mut keys = ButtonInput::<KeyCode>::default();
            keys.press(KeyCode::Enter);
            let mut app = choice_controls_app(game, keys, default());
            app.insert_resource(ChoicePresentation { signature, at: -1., ..default() });
            app.add_systems(Update, publish_pending.after(controls));
            if modal_first {
                app.add_systems(Update, confirmation_controls.after(controls).before(publish_pending));
            } else {
                app.add_systems(Update, confirmation_controls.after(publish_pending));
            }
            app.update();
            let presentation = app.world().resource::<ChoicePresentation>();
            assert_eq!(presentation.confirming.is_some(), modal_first);
            assert_eq!(presentation.closing.is_some(), !modal_first);
        }
    }

    #[test]
    fn fresh_offer_accepts_reroll_while_digits_wait_and_chat_keeps_keyboard_capture() {
        use benilla_app::local_client::LocalClientInput;
        for (pointer, captured) in [(false, false), (false, true), (true, true)] {
            let mut game = fixture_game();
            game.add_experience(5);
            let mut keys = ButtonInput::<KeyCode>::default();
            keys.press(KeyCode::Digit1);
            if !pointer { keys.press(KeyCode::KeyR); }
            let mut input = LocalClientInput::default();
            input.keyboard_captured = captured;
            let mut app = choice_controls_app(game, keys, input);
            if pointer {
                app.world_mut().spawn((Interaction::Pressed,
                    native_overlays::OverlayAction::Reroll, native_overlays::Enabled(true)));
            }
            app.update();
            let game = app.world().resource::<RunSession>().mechanics.as_ref().unwrap();
            assert_eq!(game.choice_footer().rerolls, if pointer || !captured { 2 } else { 3 });
            assert!(app.world().resource::<ChoicePresentation>().closing.is_none());
        }
    }

    #[test]
    fn pointer_selection_accepts_regenerated_row_before_exit_and_guards_later_keyboard_reroll() {
        use benilla_app::local_client::LocalClientInput;
        for reverse in [false, true] {
            let mut game = fixture_game();
            game.add_experience(5);
            let mut expected = fixture_game();
            expected.add_experience(5);
            assert!(expected.reroll_choices());
            assert!(expected.choose(0));
            let mut app = choice_controls_app(game, default(), LocalClientInput::default());
            app.init_resource::<MenuArt>()
                .init_resource::<Assets<Image>>()
                .insert_resource(crate::localization::Localization::english_for_tests())
                .add_systems(Update, hud.after(controls));
            let root = |app: &mut App| {
                app.world_mut().query_filtered::<Entity, With<native_overlays::OverlayRoot>>()
                    .single(app.world()).unwrap()
            };
            app.update();
            let original_root = root(&mut app);
            app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.5));
            app.world_mut().resource_mut::<ButtonInput<KeyCode>>().press(KeyCode::KeyR);
            let mut actions = [native_overlays::OverlayAction::Select(0), native_overlays::OverlayAction::Reroll];
            if reverse { actions.reverse(); }
            for action in actions {
                app.world_mut().spawn((Interaction::Pressed, action, native_overlays::Enabled(true)));
            }
            app.update();
            let game = app.world().resource::<RunSession>().mechanics.as_ref().unwrap();
            assert_eq!(game.choice_footer().rerolls, 2, "pointer pass rerolls before closing; later keyboard input is guarded");
            let accepted = format!("{:?}", game.abilities);
            assert_eq!(accepted, format!("{:?}", expected.abilities));
            assert_eq!(game.gold, expected.gold);
            assert!(!game.is_paused_for_choice(), "acceptance runs before the old root exits");
            let opened = app.world().resource::<ChoicePresentation>();
            assert_eq!(opened.closing, Some((0, 0.5)));
            assert!(opened.renewal_pending);
            assert_eq!(opened.at, 0.0);
            assert_eq!(root(&mut app), original_root);
            app.world_mut().resource_mut::<ButtonInput<KeyCode>>().clear();
            app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.1));
            app.update();
            assert!(app.world().resource::<ChoicePresentation>().renewal_pending);
            assert_eq!(app.world().resource::<ChoicePresentation>().closing, Some((0, 0.5)));
            assert_eq!(root(&mut app), original_root);
            app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.3));
            app.update();
            let opened = app.world().resource::<ChoicePresentation>();
            assert!(!opened.renewal_pending && opened.closing.is_none());
            assert!(opened.at > 0.89 && opened.at < 0.91);
            assert_eq!(app.world_mut().query_filtered::<Entity, With<native_overlays::OverlayRoot>>()
                .iter(app.world()).count(), 0);
            let game = app.world().resource::<RunSession>().mechanics.as_ref().unwrap();
            assert_eq!(format!("{:?}", game.abilities), accepted, "exit must not accept twice");
            assert!(!game.is_paused_for_choice());
        }
    }

    #[test]
    fn keyboard_choice_aliases_use_native_age_priority_and_snapshot_reroll() {
        for (index, aliases) in [
            [KeyCode::Digit1, KeyCode::Numpad1],
            [KeyCode::Digit2, KeyCode::Numpad2],
            [KeyCode::Digit3, KeyCode::Numpad3],
            [KeyCode::Digit4, KeyCode::Numpad4],
        ].into_iter().enumerate() {
            for key in aliases {
                let mut keys = ButtonInput::<KeyCode>::default();
                keys.press(key);
                keys.press(KeyCode::KeyR);
                assert_eq!(keyboard_choice_actions(&keys, 4, CHOICE_OPENING_SECONDS, true), (Some(index), true));
                assert_eq!(keyboard_choice_actions(&keys, 4, f32::NAN, true), (Some(index), true));
                assert_eq!(keyboard_choice_actions(&keys, 4, 0.4, true), (None, true));
                assert_eq!(keyboard_choice_actions(&keys, 4, 0.5, false), (Some(index), false));
                assert_eq!(keyboard_choice_actions(&keys, index, 0.5, true), (None, index != 0));
            }
        }
        let mut keys = ButtonInput::<KeyCode>::default();
        for key in [KeyCode::Digit4, KeyCode::Numpad3, KeyCode::Digit2, KeyCode::Numpad1] {
            keys.press(key);
        }
        assert_eq!(keyboard_choice_actions(&keys, 4, 0.5, true), (Some(0), false));
        assert_eq!(keyboard_choice_actions(&keys, 0, 0.5, true), (None, false));
    }

    #[test]
    fn keyboard_selection_precedes_reroll_and_only_the_visual_exit_waits() {
        use benilla_app::local_client::LocalClientInput;
        for experience in [5, 15] {
            let mut expected = fixture_game();
            expected.add_experience(experience);
            assert!(expected.choose(0));
            assert_eq!(expected.reroll_choices(), experience == 15);
            let mut game = fixture_game();
            game.add_experience(experience);
            let mut app = choice_controls_app(game, default(), LocalClientInput::default());
            app.update();
            app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.5));
            let mut keys = app.world_mut().resource_mut::<ButtonInput<KeyCode>>();
            keys.press(KeyCode::Numpad1);
            keys.press(KeyCode::Digit4);
            keys.press(KeyCode::KeyR);
            drop(keys);
            app.update();
            let game = app.world().resource::<RunSession>().mechanics.as_ref().unwrap();
            let accepted = format!("{:?}", game.abilities);
            assert_eq!(accepted, format!("{:?}", expected.abilities));
            assert_eq!(game.gold, expected.gold);
            assert_eq!(offer_signature(game), offer_signature(&expected));
            assert_eq!(game.choice_footer().rerolls, if experience == 15 { 2 } else { 3 });
            assert_eq!(app.world().resource::<ChoicePresentation>().closing, Some((0, 0.5)));
            assert!(app.world().resource::<ChoicePresentation>().renewal_pending);
            app.world_mut().resource_mut::<ButtonInput<KeyCode>>().clear();
            for delta in [0.1, 0.3] {
                app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(delta));
                app.update();
                let game = app.world().resource::<RunSession>().mechanics.as_ref().unwrap();
                assert_eq!(format!("{:?}", game.abilities), accepted);
                assert_eq!(offer_signature(game), offer_signature(&expected), "exit changes presentation only");
            }
            assert!(app.world().resource::<ChoicePresentation>().closing.is_none());
            assert!(!app.world().resource::<ChoicePresentation>().renewal_pending);
        }
    }

    #[test]
    fn typing_blocks_every_card_key_alias_but_preserves_pointer_selection() {
        use benilla_app::local_client::LocalClientInput;
        for key in [KeyCode::Digit1, KeyCode::Numpad1, KeyCode::Digit2, KeyCode::Numpad2,
                    KeyCode::Digit3, KeyCode::Numpad3, KeyCode::Digit4, KeyCode::Numpad4] {
            for pointer in [false, true] {
                let mut game = fixture_game();
                game.add_experience(5);
                let mut input = LocalClientInput::default();
                input.keyboard_captured = true;
                let mut app = choice_controls_app(game, default(), input);
                app.update();
                app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.5));
                let mut keys = app.world_mut().resource_mut::<ButtonInput<KeyCode>>();
                keys.press(key);
                keys.press(KeyCode::KeyR);
                drop(keys);
                if pointer {
                    app.world_mut().spawn((Interaction::Pressed,
                        native_overlays::OverlayAction::Select(0), native_overlays::Enabled(true)));
                }
                app.update();
                let game = app.world().resource::<RunSession>().mechanics.as_ref().unwrap();
                assert_eq!(game.choice_footer().rerolls, 3);
                assert_eq!(game.is_paused_for_choice(), !pointer);
                assert_eq!(app.world().resource::<ChoicePresentation>().closing.is_some(), pointer);
            }
        }
    }

    #[test]
    fn keyboard_skip_precedes_the_other_card_shortcuts_and_closes_without_a_pick() {
        use benilla_app::local_client::LocalClientInput;

        let mut game = fixture_game();
        game.set_choice_grants(3, 0, true);
        game.add_experience(15);
        let mut app = choice_controls_app(game, default(), LocalClientInput::default());
        app.update();
        app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.5));
        let mut keys = app.world_mut().resource_mut::<ButtonInput<KeyCode>>();
        keys.press(KeyCode::Digit1);
        keys.press(KeyCode::KeyR);
        drop(keys);
        app.world_mut().resource_mut::<LocalClientInput>().contextual_key_pressed = true;
        app.update();

        let game = app.world().resource::<RunSession>().mechanics.as_ref().unwrap();
        assert!(game.gold > 0);
        assert_eq!(game.choice_footer().rerolls, 3);
        assert_eq!(app.world().resource::<ChoicePresentation>().closing, Some((usize::MAX, 0.5)));
    }

    #[test]
    fn pointer_skip_cannot_make_an_initially_unaffordable_keyboard_reroll_admitted() {
        use benilla_app::local_client::LocalClientInput;
        let mut expected = fixture_game();
        expected.set_choice_grants(0, 0, true);
        expected.gold = 99;
        expected.add_experience(15);
        assert!(!expected.choice_footer().can_reroll);
        assert!(expected.skip_choices());
        assert!(expected.choice_footer().can_reroll, "Skip really changes affordability");
        let mut game = fixture_game();
        game.set_choice_grants(0, 0, true);
        game.gold = 99;
        game.add_experience(15);
        let mut app = choice_controls_app(game, default(), LocalClientInput::default());
        app.update();
        app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.5));
        app.world_mut().resource_mut::<ButtonInput<KeyCode>>().press(KeyCode::KeyR);
        app.world_mut().spawn((Interaction::Pressed,
            native_overlays::OverlayAction::Skip, native_overlays::Enabled(true)));
        app.update();
        let game = app.world().resource::<RunSession>().mechanics.as_ref().unwrap();
        assert_eq!(game.gold, expected.gold);
        assert_eq!(offer_signature(game), offer_signature(&expected));
        assert_eq!(game.choice_footer().reroll_cost, 100);
    }

    #[test]
    fn run_teardown_retires_the_retained_choice_root_before_the_exit_deadline() {
        use bevy::ecs::system::RunSystemOnce;
        use benilla_app::local_client::LocalClientInput;
        for terminal in 0..6 {
            let mut game = fixture_game();
            game.add_experience(5);
            let mut app = choice_controls_app(game, default(), LocalClientInput::default());
            app.init_resource::<MenuArt>()
                .init_resource::<Assets<Image>>()
                .insert_resource(crate::localization::Localization::english_for_tests())
                .add_systems(Update, hud.after(controls));
            app.update();
            app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.5));
            app.world_mut().resource_mut::<ButtonInput<KeyCode>>().press(KeyCode::Digit1);
            app.update();
            assert!(app.world().resource::<ChoicePresentation>().renewal_pending);
            let mut session = app.world_mut().resource_mut::<RunSession>();
            match terminal % 3 {
                0 => session.mechanics = None,
                1 => session.mechanics.as_mut().unwrap().dead = true,
                _ => session.mechanics.as_mut().unwrap().completed = true,
            }
            drop(session);
            if terminal >= 3 {
                app.world_mut().resource_mut::<benilla_app::local_client::LocalLoadingScreen>().begin(0);
            }
            // Model terminal/teardown arriving after controls in this Update.
            app.world_mut().run_system_once(hud).unwrap();
            assert_eq!(app.world_mut().query_filtered::<Entity, With<native_overlays::OverlayRoot>>()
                .iter(app.world()).count(), 0);
            app.update();
            assert!(app.world().resource::<ChoicePresentation>().closing.is_none());
            assert!(!app.world().resource::<ChoicePresentation>().renewal_pending);
        }
    }

    #[test]
    fn identical_consecutive_skip_offers_receive_a_fresh_opening_clock() {
        use benilla_app::local_client::LocalClientInput;
        let mut game = fixture_game();
        game.set_choice_grants(3, u32::MAX, true);
        game.add_experience(15);
        // Exhaust actual ability/upgrade candidates through the public Banish
        // transaction, leaving native's single25-gold fallback for both levels.
        while let Some(index) = (0..game.choices.len()).find(|index| game.can_banish_choice(*index)) {
            assert!(game.banish_choice(index));
        }
        assert_eq!(game.choices.len(), 1);
        assert_eq!(game.choices[0].gold, 25);
        let before = offer_signature(&game);
        let mut app = choice_controls_app(game, default(), LocalClientInput::default());
        app.update();
        app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.5));
        app.world_mut().spawn((Interaction::Pressed,
            native_overlays::OverlayAction::Skip, native_overlays::Enabled(true)));
        app.update();
        let game = app.world().resource::<RunSession>().mechanics.as_ref().unwrap();
        assert_eq!(offer_signature(game), before, "the replacement really has identical cards and footer");
        assert_eq!(app.world().resource::<ChoicePresentation>().closing, Some((usize::MAX, 0.5)));
        app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.33));
        app.update();
        let now = app.world().resource::<Time>().elapsed_secs();
        assert_eq!(app.world().resource::<ChoicePresentation>().at, now);
        app.world_mut().resource_mut::<Time>().advance_by(std::time::Duration::from_secs_f32(0.1));
        app.world_mut().resource_mut::<ButtonInput<KeyCode>>().press(KeyCode::Digit1);
        app.update();
        assert!(app.world().resource::<ChoicePresentation>().closing.is_none());
    }

    #[test]
    fn repeated_offer_rebuilds_animation_and_pause_rebuilds_button_enabled_state() {
        let mut app = App::new();
        let mut game = fixture_game();
        game.add_experience(5);
        assert!(!game.choices.is_empty());
        app.insert_resource(RunSession {
            mechanics: Some(game),
            paused: true,
            ..default()
        })
        .insert_resource(ChoicePresentation {
            at: 1.,
            ..default()
        })
        .init_resource::<MenuArt>()
        .init_resource::<Assets<Image>>()
        .insert_resource(crate::localization::Localization::english_for_tests())
        .add_systems(Update, hud);
        let root = |app: &mut App| {
            app.world_mut()
                .query_filtered::<Entity, With<native_overlays::OverlayRoot>>()
                .single(app.world())
                .unwrap()
        };
        app.update();
        let first = root(&mut app);
        assert!(app
            .world_mut()
            .query::<&native_overlays::Enabled>()
            .iter(app.world())
            .all(|enabled| !enabled.0));
        app.world_mut().resource_mut::<RunSession>().paused = false;
        app.update();
        let resumed = root(&mut app);
        assert_ne!(first, resumed);
        assert!(app
            .world_mut()
            .query::<&native_overlays::Enabled>()
            .iter(app.world())
            .any(|enabled| enabled.0));
        app.world_mut().resource_mut::<ChoicePresentation>().at = 2.;
        app.update();
        assert_ne!(
            resumed,
            root(&mut app),
            "identical new offer must reset its animation hierarchy"
        );
    }

    #[test]
    fn shared_killing_blow_reaches_non_killer_save_once_with_first_date() {
        use azeroth_survivors_re::coop::replication::{NativeCoopFeats, NativeFeatEvent, NativeFeatMember};
        let mut game = fixture_game();
        let mut state = game.native_state();
        state.byte_8f = 1;
        state.float_68_bits = 600_f32.to_bits();
        let members = [1, 2, 3, 4, 5].map(|class| NativeFeatMember { class, word: 0, byte: 0, active_set: 0 }).to_vec();
        state.coop = Some(NativeCoopFeats {
            members: members.clone(), word_30: 0, flag_34: false,
            events: vec![NativeFeatEvent { word_18: 694, word_1c: 0,
                byte_20: 0, kind_21: 0, flag_22: true, members }],
        });
        game.apply_replica_native(&state);
        assert!(game.boss_killing_blows().is_empty(), "recipient did not land the hit");
        let mut menu = MenuState::from_save_path(None);
        persist_run_at(&mut game, &mut menu, Some(1), [0; 19], false, true, 100, true);
        assert_eq!(menu.backend_save.achievement_dates().get("coop:brotherhood"), Some(&100));
        assert!(game.events.iter().any(|event| matches!(event,
            RunEvent::Achievement(key) if key == "coop:brotherhood")));
        game.events.clear();
        persist_run_at(&mut game, &mut menu, Some(1), [0; 19], false, true, 200, true);
        assert_eq!(menu.backend_save.achievement_dates().get("coop:brotherhood"), Some(&100));
        assert!(!game.events.iter().any(|event| matches!(event, RunEvent::Achievement(_))));
        let restored = crate::save::Save::parse(&menu.backend_save.plaintext()).unwrap();
        assert!(restored.earned_achievements().contains("coop:brotherhood"));
        assert_eq!(restored.achievement_dates().get("coop:brotherhood"), Some(&100));
    }

    #[test]
    fn ordinary_shared_boss_histories_reach_recipient_save_once_with_first_date() {
        use azeroth_survivors_re::coop::replication::StateRow;
        let mut game = fixture_game();
        let mut state = game.native_state();
        state.byte_8f = 1;
        state.float_68_bits = 600_f32.to_bits();
        state.pairs = vec![[1493, 116], [694, 133], [1094, 116]];
        state.rows = vec![
            StateRow { word_00: 1493, word_04: 116, byte_08: 4, kind_09: 0, flag_0a: false },
            StateRow { word_00: 694, word_04: 133, byte_08: 2, kind_09: 0, flag_0a: false },
            StateRow { word_00: 1094, word_04: 116, byte_08: 4, kind_09: 2, flag_0a: false },
        ];
        game.apply_replica_native(&state);
        let mut menu = MenuState::from_save_path(None);
        let keys = ["feat:nou", "feat:vancleef", "feat:nefarian"];
        persist_run_at(&mut game, &mut menu, Some(1), [0; 19], false, true, 100, true);
        for key in keys {
            assert_eq!(menu.backend_save.achievement_dates().get(key), Some(&100));
            assert_eq!(game.events.iter().filter(|event| matches!(event,
                RunEvent::Achievement(granted) if granted == key)).count(), 1);
        }
        game.events.clear();
        persist_run_at(&mut game, &mut menu, Some(1), [0; 19], false, true, 200, true);
        assert!(!game.events.iter().any(|event| matches!(event, RunEvent::Achievement(_))));
        let restored = crate::save::Save::parse(&menu.backend_save.plaintext()).unwrap();
        for key in keys {
            assert!(restored.earned_achievements().contains(key));
            assert_eq!(restored.achievement_dates().get(key), Some(&100));
        }
    }

    #[test]
    fn shared_boss_count_grants_boss_hunter_and_saves_only_new_recipient_deltas() {
        let mut game = fixture_game();
        let mut state = game.native_state();
        state.byte_8f = 1;
        state.float_68_bits = 600_f32.to_bits();
        state.words_70[3] = 100;
        game.apply_replica_native(&state);
        let mut menu = MenuState::from_save_path(None);
        persist_run_at(&mut game, &mut menu, Some(1), [0; 19], false, true, 100, true);
        assert_eq!(menu.backend_save.statistics().get("bosses"), Some(&100));
        assert_eq!(menu.backend_save.achievement_dates().get("count:bosses100"), Some(&100));
        game.events.clear();
        persist_run_at(&mut game, &mut menu, Some(1), [0; 19], false, true, 200, true);
        assert_eq!(menu.backend_save.statistics().get("bosses"), Some(&100));
        assert!(!game.events.iter().any(|event| matches!(event, RunEvent::Achievement(_))));
        state.words_70[3] = 101;
        state.byte_8f = 4;
        state.flag_8c = true;
        game.apply_replica_native(&state);
        persist_run_at(&mut game, &mut menu, Some(1), [0; 19], false, true, 300, true);
        persist_run_at(&mut game, &mut menu, Some(1), [0; 19], false, true, 400, true);
        let restored = crate::save::Save::parse(&menu.backend_save.plaintext()).unwrap();
        assert_eq!(restored.statistics().get("bosses"), Some(&101));
        assert_eq!(restored.achievement_dates().get("count:bosses100"), Some(&100));
    }

    #[test]
    fn cooperative_victory_uses_recipient_admission_and_persists_history() {
        use azeroth_survivors_re::coop::replication::{NativeCoopFeats, NativeFeatMember};
        for (guid, active, admitted) in [(Some(1), true, true),
            (Some(crate::startup::TESTER_GUID), true, false), (Some(1), false, false), (None, true, false)] {
            let mut game = fixture_game();
            let mut state = game.native_state();
            state.byte_8f = 1;
            state.float_68_bits = 600_f32.to_bits();
            state.flag_8d = true;
            state.coop = Some(NativeCoopFeats { members: vec![NativeFeatMember {
                class: 1, word: 0, byte: 0, active_set: 0 }; 2], word_30: 0, flag_34: false, events: vec![] });
            game.apply_replica_native(&state);
            let mut menu = MenuState::from_save_path(None);
            // Native guest eligibility bypasses the local showcase restriction.
            persist_run_at(&mut game, &mut menu, guid, [0; 19], true, active, 300, false);
            assert_eq!(menu.backend_save.cooperative_beaten_zones().contains(&0), admitted);
            assert_eq!(menu.backend_save.earned_achievements().contains("coop:together"), admitted);
            if admitted {
                let restored = crate::save::Save::parse(&menu.backend_save.plaintext()).unwrap();
                assert!(restored.cooperative_beaten_zones().contains(&0));
                assert_eq!(restored.achievement_dates().get("coop:together"), Some(&300));
            }
        }
    }

    #[test]
    fn singleton_victory_keeps_old_progress_and_a_prior_shared_boss_event() {
        use azeroth_survivors_re::coop::replication::{NativeCoopFeats, NativeFeatEvent, NativeFeatMember};
        for count in 0..=1 {
            let mut game = fixture_game();
            let mut state = game.native_state();
            state.byte_8f = 1;
            state.float_68_bits = 600_f32.to_bits();
            state.flag_8d = true;
            let member = NativeFeatMember { class: 1, word: 0, byte: 0, active_set: 0 };
            state.coop = Some(NativeCoopFeats {
                members: vec![member.clone(); count], word_30: 0, flag_34: true,
                events: vec![NativeFeatEvent {
                    word_18: 1194, word_1c: 0, byte_20: 0, kind_21: 0,
                    flag_22: false, members: vec![member; 2],
                }],
            });
            game.apply_replica_native(&state);
            let mut menu = MenuState::from_save_path(None);
            menu.backend_save.mark_cooperative_victory("wsg");
            menu.backend_save.grant_achievements(&["coop:together".to_owned()], Some(100));
            persist_run_at(&mut game, &mut menu, Some(1), [0; 19], false, true, 300, false);
            let restored = crate::save::Save::parse(&menu.backend_save.plaintext()).unwrap();
            assert_eq!(restored.cooperative_beaten_zones(), [2].into());
            assert_eq!(restored.achievement_dates().get("coop:together"), Some(&100));
            assert!(restored.earned_achievements().contains("coop:oldgods"),
                "a later departure does not erase a qualifying lethal-event snapshot");
            assert!(!restored.earned_achievements().contains("coop:odds"),
                "victory admission uses current membership");
        }
    }

}
