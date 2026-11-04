//! Feed the recovered run into the actual offline client host.
//! Presentation is the existing FrameXML, model, controller and audio pipeline.

mod addon_bootstrap;
pub(super) mod addon_banners;
pub(super) mod addon_feed;
mod detailed_feed;
mod coop_feed;
pub(super) use coop_feed::recipient_addon_snapshot;
pub(super) mod raid_targets;
mod addon_lists;
mod addon_scalars;
mod addon_summons;
mod addon_timers;
mod events;
pub(super) mod creature_queries;
mod framexml_hud;
mod glue_strings;
pub(super) mod object_queries;
pub(super) mod name_queries;
pub(super) mod clock_queries;
mod query_packets;
pub(super) mod talent_view;
mod run_stats;
mod spell_scales;
pub(super) mod inventory;
pub(super) mod inventory_requests;

use std::collections::BTreeMap;

use azeroth_survivors_re::player_abilities::damage;
use benilla_app::local_client::{
    descriptor_aura_state, LocalActionUi, LocalAddonRequests, LocalAppearance, LocalClientExtension, LocalClientInput,
    LocalClientSession, LocalClientSet, LocalCooldown, LocalEquipmentDisplay,
    LocalEquipmentMetadata, LocalMenuMusic, LocalPlayerEquipment, LocalPlayerEquipmentMetadata,
    LocalPlayerRequest, LocalPlayerSpawn, LocalPlayerUi, SpellBookState, UnitAuraSlot,
};
use benilla_assets::{AssetSet, LockRecover, WorldAssets};
use benilla_formats::{CharCreateCatalog, SpellCatalog, SpellDurationCatalog, WorldMapAreaCatalog};
use bevy::prelude::*;

use super::{world::ZoneWorld, EntryCatalog, RunSession};
use crate::{
    armory::{ArmoryCatalog, GearSave},
    menu_state::MenuState,
};

pub struct ClientBridgePlugin;

/// Reuse the same current phase owner for custom presence and the addon feed.
pub(super) fn presence_phase(session: &RunSession) -> &'static str {
    addon_scalars::phase(session)
}

pub(super) fn recipient_phase(
    game: &super::mechanics::Mechanics,
    started: bool,
    paused: bool,
) -> &'static str {
    addon_scalars::phase_for(game, started, paused)
}

fn addon_messages(
    game: &super::mechanics::Mechanics,
    scalars: addon_scalars::Payloads,
    locale: &crate::localization::Localization,
    catalog: &BridgeCatalog,
    [party, revive]: [String; 2],
) -> Vec<addon_feed::AddonMessage> {
    let [bosses, units, debuffs, spells, buffs, chests, lairs] =
        addon_lists::snapshot(game, locale, catalog);
    let [meter, healing, boss_meter, taken] = game.addon_meter_lines(locale);
    use addon_feed::AddonMessage as M;
    vec![
        M::new("AZS", scalars.stats),
        M::new("AZSZONE", scalars.zone),
        M::new("AZSRUN", scalars.run),
        bosses, units, debuffs,
        M::new("AZSTGT", scalars.target),
        spells,
        M::new("AZSTIMERS", addon_timers::snapshot(game, locale)),
        buffs,
        M::new("AZSPETS", addon_summons::snapshot(game, locale)),
        M::new("AZSTOTEMS", addon_summons::totems(game, locale)),
        M::new("AZSMETER", meter),
        M::new("AZSHEAL", healing),
        M::new("AZSBOSSDMG", boss_meter),
        M::new("AZSPARTY", party),
        M::new("AZSREVIVE", revive),
        M::new("AZSDOWNED", game.party_downed_payload()),
        chests, lairs,
        M::new("AZSTAKEN", taken),
        M::new("AZSEND", scalars.end),
    ]
}

/// Drain the run's shared player-mover queue, including an immediate terminal
/// continuation. The caller appends the Endless notice only after these packets.
pub(super) fn player_mover_messages(game: &mut super::mechanics::Mechanics)
    -> Vec<benilla_app::local_client::events::SessionEvent>
{
    game.drain_player_mover().into_iter().map(events::player_mover).collect()
}

pub(super) fn terminal_talent_messages(
    game: &mut super::mechanics::Mechanics,
    catalog: &crate::catalog::MenuCatalog,
    locale: Option<&crate::localization::Localization>,
) -> Vec<benilla_app::local_client::events::SessionEvent> {
    events::terminal_talent_messages(game, catalog, locale)
}

pub(super) fn guest_account_messages(
    events: &mut Vec<super::mechanics::RunEvent>,
    player_guid: Option<u64>,
    catalog: &crate::catalog::MenuCatalog,
    locale: Option<&crate::localization::Localization>,
    notifications: &mut super::notifications::Notifications,
    now: f32,
) -> Vec<benilla_app::local_client::events::SessionEvent> {
    events::guest_account_messages(events, player_guid, catalog, locale, notifications, now)
}

impl Plugin for ClientBridgePlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<crate::localization::Localization>();
        let mut extension = addon_bootstrap::extension();
        let locale = app.world().resource::<crate::localization::Localization>();
        glue_strings::configure(&mut extension, locale);
        addon_bootstrap::meter_language(&mut extension, locale.code());
        extension.talent_toggle_counter = Some("AZS_TALENT_TOGGLES".into());
        extension.framexml_appends.splice(0..0, framexml_hud::appends());
        extension.framexml_appends.extend(raid_targets::appends());
        app.insert_resource(extension)
        .init_resource::<BridgeCatalog>()
        .init_resource::<BridgeState>()
        .init_resource::<LocalAddonRequests>()
        .add_systems(Startup, load_catalog.after(AssetSet::Open))
        // The previous completed run tick is coherent here. Keeping this outside Update
        // avoids ordering a post-stream mechanics tick ahead of the pre-input UI feed.
        .add_systems(First, sync_to_client.after(crate::coop_runtime::CoopSet::Apply)
            .before(LocalClientSet::Configuration));
        events::install(app);
        spell_scales::install(app);
        inventory::install(app);
        raid_targets::install(app);
    }
}

#[derive(Resource, Default)]
pub(super) struct BridgeCatalog {
    pub(super) creation: Option<CharCreateCatalog>,
    pub(super) spells: Option<std::sync::Arc<SpellCatalog>>,
    pub(super) spell_durations: Option<SpellDurationCatalog>,
    map_areas: Option<WorldMapAreaCatalog>,
}

#[derive(Resource, Default)]
struct BridgeState {
    stats_locale: Option<&'static str>,
    identity: Option<u64>,
    addon: addon_feed::Publisher,
    music_in_menu: Option<bool>,
    aura_durations: BTreeMap<(u32, u32), f32>,
    outfit_key: Option<(u64, u64, u8, u8)>,
    outfit_entries: Vec<(u8, u32)>,
    player_display: Option<(u64, u32)>,
    player_glow: Option<(u64, [u32; 3])>,
}

fn load_catalog(mut catalog: ResMut<BridgeCatalog>, assets: Option<Res<WorldAssets>>) {
    let Some(assets) = assets else { return };
    let mut chain = assets.chain.lock_recover();
    match CharCreateCatalog::load(&mut chain) {
        Ok(creation) => catalog.creation = Some(creation),
        Err(error) => warn!("local client body catalog unavailable: {error}"),
    }
    match benilla_formats::load_spell_catalog(&mut chain) {
        Ok(spells) => catalog.spells = Some(spells.into()),
        Err(error) => warn!("local client spell presentation catalog unavailable: {error}"),
    }
    match benilla_formats::load_world_map_area_catalog(&mut chain) {
        Ok(maps) => catalog.map_areas = Some(maps),
        Err(error) => warn!("addon map projection catalog unavailable: {error}"),
    }
    match benilla_formats::load_spell_durations(&mut chain) {
        Ok(durations) => catalog.spell_durations = Some(durations),
        Err(error) => warn!("local client aura duration catalog unavailable: {error}"),
    }
}

/// The run remains the authority. This feeds its existing state and never manually casts a
/// replacement spell in response to an action-bar request.
#[allow(clippy::too_many_arguments)]
fn sync_to_client(
    session: Res<RunSession>,
    menu: Res<MenuState>,
    entry: Res<EntryCatalog>,
    armory: Res<ArmoryCatalog>,
    catalog: Res<BridgeCatalog>,
    world: Res<ZoneWorld>,
    input: Res<LocalClientInput>,
    mut client: ResMut<LocalClientSession>,
    mut spawn: ResMut<LocalPlayerSpawn>,
    mut equipment: ResMut<LocalPlayerEquipment>,
    mut metadata: ResMut<LocalPlayerEquipmentMetadata>,
    mut state: ResMut<BridgeState>,
    mut music: MessageWriter<LocalMenuMusic>,
    mut extension: ResMut<LocalClientExtension>,
    mut loading: ResMut<benilla_app::local_client::LocalLoadingScreen>,
    (selection, mut packets, locale, stock, coop, mut addon_requests): (
        Option<Res<benilla_app::local_client::LocalTargetSelection>>,
        ResMut<benilla_app::local_client::events::LocalPresentationEvents>,
        Res<crate::localization::Localization>,
        Option<Res<benilla_app::local_client::LocalStockFrontend>>,
        Option<Res<crate::coop_runtime::CoopRuntime>>,
        ResMut<LocalAddonRequests>,
    ),
) {
    let guest = coop.as_ref().is_some_and(|coop| coop.is_guest());
    for request in addon_requests.0.drain(..) {
        if !guest && request.distribution == benilla_ui::script::AddonDistribution::Party {
            if let Some(request) = addon_feed::MeterRequest::parse(&request.text) {
                state.addon.request(request);
            }
        }
    }
    extension.combat_text_run = session.mechanics.as_ref().filter(|_| menu.in_run)
        .map(|_| session.identity);
    if state.stats_locale != Some(locale.code()) {
        extension.script_postlude = run_stats::source(Some(&locale));
        glue_strings::configure(&mut extension, &locale);
        addon_bootstrap::meter_language(&mut extension, locale.code());
        state.stats_locale = Some(locale.code());
    }
    if guest {
        let in_run = session.mechanics.is_some() && menu.in_run;
        extension.custom_game_menu = in_run;
        extension.script_update = talent_view::publication(in_run, in_run && session.talent_view_open);
        return;
    }
    let in_menu = session.mechanics.is_none() || !menu.in_run;
    extension.custom_game_menu = !in_menu;
    if stock.is_none() && state.music_in_menu != Some(in_menu) {
        if in_menu {
            music.write(LocalMenuMusic::Play(crate::menu_audio::THEME.into()));
        }
        // Current14097bb30 keeps the theme through world loading, then fades
        // over three seconds when the cover drains. The shared audio handoff
        // owns that edge; StopGlueMusic is the separate one-second movie verb.
        state.music_in_menu = Some(in_menu);
    }
    let Some(game) = session.mechanics.as_ref().filter(|_| menu.in_run) else {
        state.addon.idle(input.ui_time);
        if !menu.entering {
            loading.cancel();
        }
        if menu.entering && client.active {
            // Again is a replacement run on the existing client connection.
            // Keep its identity and VM until the new mechanics reaches feed.
            client.set_paused(true);
            return;
        }
        extension.unit_names.clear();
        extension.script_update = talent_view::publication(false, false);
        if client.active {
            client.end();
        }
        spawn.request = None;
        equipment.rows.clear();
        metadata.rows.clear();
        state.identity = None;
        state.aura_durations.clear();
        state.outfit_key = None;
        state.outfit_entries.clear();
        state.player_display = None;
        state.player_glow = None;
        return;
    };
    extension.unit_names = game
        .loot_companion_names()
        .map(|(guid, name)| (guid, locale.label(name).to_owned()))
        .collect();
    extension.script_update = talent_view::publication(true, session.talent_view_open);
    let hero = session.entry_hero.clone().unwrap_or_else(|| menu.hero());
    let Some(display_id) = catalog
        .creation
        .as_ref()
        .and_then(|creation| creation.body_display(hero.race, hero.sex))
    else {
        // Keep the missing body binding visible to the existing run/load status. A fallback
        // race model would conceal an asset failure and would not be the selected character.
        return;
    };
    let Some(zone) = entry.zones.iter().find(|zone| zone.key == game.zone.key) else {
        return;
    };
    // Spawn/snapshot synchronization must retain the speed admitted by the native
    // 0.01 deadband, rather than overwriting the ordinary forced-speed consumer.
    let run_speed = game.player_run_speed();
    let outfit_key = (
        session.identity,
        menu.save_revision,
        hero.race,
        hero.class,
    );
    if state.outfit_key != Some(outfit_key) {
        let (rows, traits, entries) = outfit(&menu.backend_save, hero.race, hero.class, &armory);
        equipment.rows = rows;
        metadata.rows = traits;
        state.outfit_entries = entries;
        state.outfit_key = Some(outfit_key);
    }
    let player = player_ui(game, &hero, &session.name, display_id, state.outfit_entries.clone());
    if state.identity != Some(session.identity) {
        //145917d40 warms the shared getter with ID zero at Begin. An open
        // failure remains retryable by the actual debuff consumer.
        let _ = crate::native_dbc::spell(0);
        client.begin(player);
        state.identity = Some(session.identity);
        state.aura_durations.clear();
        spawn.request = Some(LocalPlayerRequest {
            identity: session.identity,
            map_id: zone.map_id,
            position_wow: zone.spawn,
            facing: zone.facing,
            run_speed,
            camera_distance: zone_camera_distance(entry.player.camera_offset),
            camera_pitch: None,
        });
    } else {
        client.player = Some(player);
    }
    // Keep the host's native body snapshot (field132) separate from the live
    // field131 override. The normal values handler/renderer owns the model swap;
    // subsequent health snapshots merge changed host lanes and preserve it.
    let current_display = game.player_form_display().unwrap_or(display_id);
    if state.player_display != Some((session.identity, current_display)) {
        use benilla_app::local_client::events::{ObjectFields, SessionEvent};
        packets.0.push(SessionEvent::ObjectValues {
            guid: game.player_guid,
            fields: ObjectFields::from_pairs(&[(131, current_display)]),
        });
        state.player_display = Some((session.identity, current_display));
    }
    // Current145bcfe80 writes the displayed weapon's admitted enchant through
    // ordinary visible-item fields. Star eligibility follows worn equipment,
    // while a cosmetic may supply the displayed item ID.
    let glow = std::array::from_fn(|index| {
        let slot = 15 + index;
        let shown = state.outfit_entries.iter()
            .find(|(field_slot, _)| *field_slot as usize == slot + 1)
            .map_or(0, |(_, item)| *item);
        azeroth_survivors_re::armory_cosmetics::weapon_glow(
            session.starting_weapon_glow, slot as u8, shown,
            session.starting_stars[slot],
        )
    });
    if state.player_glow != Some((session.identity, glow)) {
        use benilla_app::local_client::events::{ObjectFields, SessionEvent};
        let fields: Vec<_> = glow.into_iter().enumerate()
            .map(|(index, enchant)| (0x105 + 12 * (15 + index) as u16, enchant))
            .collect();
        packets.0.push(SessionEvent::ObjectValues {
            guid: game.player_guid,
            fields: ObjectFields::from_pairs(&fields),
        });
        state.player_glow = Some((session.identity, glow));
    }
    if state.addon.due(session.identity, input.ui_time) {
        let position = azeroth_survivors_re::enemies::Position::from(world.position_wow);
        if let Some(scalars) = addon_scalars::snapshot(&session, &menu,
            addon_scalars::Inputs { position, facing: world.facing,
                target: selection.as_ref().and_then(|selection| selection.guid) }, &locale) {
            let party = coop.as_ref().map_or_else(
                || [String::new(), String::new()],
                |state| [state.party.meter_payload(game.clock),
                    state.party.revive_payload(0, state.shared_running)],
            );
            let snapshot = addon_messages(game, scalars, &locale, &catalog, party);
            packets.0.extend(state.addon.changed_from(snapshot,game.player_guid));
        }
        let phase = addon_scalars::phase(&session);
        let owners = game.detailed_owners(&armory);
        packets.0.extend(state.addon.detailed.publish(game, &owners, phase, &locale));
    }
    loading.set_ready(world.ready);
    client.set_paused(loading.covering() || session.paused || game.is_paused_for_choice() || !session.playing() || !world.ready);
    let ui_now = input.ui_time;
    // Current1454e3d30/serializer145441c20: learned index is the zero-based wire slot.
    // The separate native racial occupies wire11 (Lua12).
    client.actions = game
        .abilities
        .iter()
        .enumerate()
        .map(|(index, ability)| LocalActionUi {
            slot: index as u32 + 1,
            spell_id: ability.definition.spell_id,
            texture: Some(format!("Interface\\Icons\\{}", ability.definition.icon)),
            cooldown: ui_cooldown(
                game.ability_cooldown(ability.definition.spell_id),
                game.clock,
            ),
            // The recovered run owns auto-cast readiness and has no mana-cost gate. Native
            // button presses remain intentionally outside that automatic cast scheduler.
            usable: !game.dead && !game.completed,
            in_range: None,
        })
        .collect();
    if let Some(racial) = game.racial.as_ref() {
        let cooldown = ui_cooldown(game.racial_cooldown, game.clock);
        client.actions.push(LocalActionUi {
            slot: 12,
            spell_id: racial.definition.spell_id,
            texture: Some(format!("Interface\\Icons\\{}", racial.definition.icon)),
            cooldown,
            usable: !game.dead && !game.completed,
            in_range: None,
        });
    }
    client.known_spells = game
        .abilities
        .iter()
        .chain(game.racial.iter())
        .map(|ability| ability.definition.spell_id)
        .collect();
    client.spell_cooldowns = game
        .abilities
        .iter()
        .filter_map(|ability| {
            ui_cooldown(
                game.ability_cooldown(ability.definition.spell_id),
                game.clock,
            )
            .map(|cooldown| (ability.definition.spell_id, cooldown))
        })
        .collect();
    if let Some(racial) = game.racial.as_ref() {
        if let Some(cooldown) = ui_cooldown(game.racial_cooldown, game.clock) {
            client
                .spell_cooldowns
                .push((racial.definition.spell_id, cooldown));
        }
    }
    client.spellbook = SpellBookState::default();
    // One native48-slot projector owns both field-driven effects and Lua state.
    // Keep its ordering, partitions and stack counts, including generic aliases.
    client.auras = game
        .player_auras()
        .iter()
        .enumerate()
        .filter_map(|(slot, aura)| aura.map(|aura| (slot, aura)))
        .filter(|(_, aura)| aura.expires_at > game.clock)
        .filter_map(|(slot, aura)| {
            let permanent = !aura.expires_at.is_finite();
            let (duration, expiration) = if permanent {
                (0.0, 0.0)
            } else {
                let instance = game
                    .abilities
                    .iter()
                    .chain(game.racial.iter())
                    .find(|ability| ability.definition.spell_id == aura.spell_id);
                let duration = *state
                    .aura_durations
                    .entry((aura.spell_id, aura.expires_at.to_bits()))
                    .or_insert_with(|| {
                        instance.map_or(aura.expires_at - game.clock, |instance| {
                            damage::scaled_duration(instance).max(0.1)
                        })
                    });
                (
                    f64::from(duration),
                    ui_now + f64::from(aura.expires_at - game.clock),
                )
            };
            descriptor_aura_state(
                UnitAuraSlot {
                    slot: slot as u8,
                    spell_id: aura.spell_id,
                    flags: if slot < 32 { 9 } else { 8 },
                    level: game.level.min(255) as u8,
                    stacks: aura.count.clamp(1, 255) as u8,
                },
                duration,
                expiration,
                catalog.spells.as_deref(),
                catalog.spell_durations.as_ref(),
            )
        })
        .collect();
    state.aura_durations.retain(|(id, expiry), _| {
        game.player_auras()
            .iter()
            .flatten()
            .any(|aura| aura.spell_id == *id && aura.expires_at.to_bits() == *expiry)
    });
}

fn ui_cooldown(cooldown: Option<super::mechanics::RunCooldown>, now: f32) -> Option<LocalCooldown> {
    let cooldown = cooldown?;
    let remaining = cooldown.duration - (now - cooldown.started_at);
    (remaining > 0.0).then_some(LocalCooldown {
        remaining,
        duration: cooldown.duration,
    })
}

/// One descriptor projection for local and actually admitted remote heroes.
pub(super) fn player_ui(game:&super::mechanics::Mechanics,hero:&crate::save::Hero,
    name:&str,display_id:u32,equipment:Vec<(u8,u32)>)->LocalPlayerUi {
    let resource=game.class_resource();
    let [(_,health),(_,max_health)]=game.player_vital_fields();
LocalPlayerUi {
        guid: game.player_guid,
        name: name.to_owned(),
        race: hero.race,
        class: game.class.class_id,
        sex: hero.sex,
        display_id,
        // Currentplayerdescriptor145491140/145491906..929, table1469acab8.
        faction_template: match hero.race {
            2 => 2,
            3 => 3,
            4 => 4,
            5 => 5,
            6 => 6,
            7 => 115,
            8 => 116,
            _ => 1,
        },
        scale: 1.0,
        appearance: LocalAppearance {
            skin: hero.features[0],
            face: hero.features[1],
            hair_style: hero.features[2],
            hair_color: hero.features[3],
            facial_hair: hero.features[4],
            equipment,
        },
        health,
        max_health,
        power_type: resource.map_or(0, |bar| bar.field.saturating_sub(23) as u8),
        power: resource.map_or(0, |bar| bar.value),
        // Bloodrage's recovered pool caps at100 and publishes tenths; Seal Fate/Soul Fire
        // publish five points*20, and Lightwell publishes its clamped percentage.
        max_power: resource.map_or(0, |bar| if bar.field == 24 { 1000 } else { 100 }),
        level: game.level,
        xp: game.xp,
        xp_max: game.xp_required(),
        // Current1454e56e1 publishes native gold units as copper in field1176.
        gold: azeroth_survivors_re::treasure_chests::coinage(game.gold),
        rest_state: 2,
        rested_xp: 0,
        resting: false,
    }
}

fn zone_camera_distance(offset: [f32; 3]) -> f32 {
    Vec3::from_array(offset).length()
}

/// Same current-target starter/cosmetic precedence as the menu's `preview::build_character`.
pub(super) fn outfit(
    save: &crate::save::Save,
    race: u8,
    class: u8,
    catalog: &ArmoryCatalog,
) -> (
    Vec<LocalEquipmentDisplay>,
    Vec<LocalEquipmentMetadata>,
    Vec<(u8, u32)>,
) {
    let mut rows = BTreeMap::new();
    let mut traits = BTreeMap::new();
    let mut entries = BTreeMap::new();
    let gear = GearSave::read_for(save, class, race);
    for (slot, id) in gear.outfit(catalog, class, race).into_iter().enumerate() {
        let Some(appearance) = catalog.appearance(id, race) else {
            continue;
        };
        let slot = slot as u8;
        rows.insert(slot, LocalEquipmentDisplay {
            slot, display_id: appearance.display_id, inventory_type: appearance.inventory_type,
        });
        entries.insert(slot + 1, id);
        let metadata = catalog.piece(id).map(|piece| (piece.item_class, piece.item_subclass, piece.sheath))
            .or_else(|| catalog.starter_items.iter().find(|piece| piece.id == id)
                .map(|piece| (piece.item_class, piece.item_subclass, piece.sheath)));
        if let Some((item_class, item_subclass, sheath)) = metadata {
            traits.insert(slot, LocalEquipmentMetadata {
                slot, item_class: item_class as u8, item_subclass: item_subclass as u8,
                sheath: sheath as u8, material: None,
            });
        }
    }
    (
        rows.into_values().collect(),
        traits.into_values().collect(),
        entries.into_iter().collect(),
    )
}
