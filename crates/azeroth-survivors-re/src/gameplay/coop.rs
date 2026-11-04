//! Native party admission, actual world publication and guest packet ownership.
#[path = "coop_commands.rs"]
mod commands;
#[path = "coop_reconnection.rs"]
mod reconnection;
#[path = "coop_recap.rs"]
mod recap;
#[path = "coop_party_frames.rs"]
mod party_frames;
#[path = "coop_overlay.rs"]
pub(super) mod overlay;
#[path = "coop_publish.rs"]
pub(super) mod publication;
use super::*;
use crate::coop_runtime::{CoopRuntime, CoopSet};
use azeroth_survivors_re::coop::{
    client_state::{RunPhase, RunProjection},
    engine_packets,
    replication::{EnginePacket, EquipmentGrant, NativeMessage, NativeState, ResourceRow, TimerRow},
    server_party::{ClientId, LifecyclePacket, MembershipEvent, NativeHero, NativeRosterEntry},
};
use benilla_app::local_client::{
    LocalAppearance, LocalClientSession, LocalClientSet, LocalPlayerRequest, LocalPlayerSpawn,
    LocalPlayerUi, LocalUnitVisual,
    events::{LocalPresentationEvents, LocalWireEvents, SessionEvent},
    local_player_fields,
};
use std::collections::{HashMap, HashSet, VecDeque};

const HERO_UPDATE_INTERVAL: f64 = 0.1;

#[derive(Default)]
struct HeroUpdate {
    last_applied: Option<f64>,
    pending: Option<Box<NativeHero>>,
}

#[derive(Clone, Copy)]
struct HeroAdmission {
    host_guid: u64,
    now: f64,
    run_under_way: bool,
    zone_key: &'static str,
    zone_index: usize,
    heroic_rank: u8,
}

#[derive(Resource, Default)]
pub(crate) struct CoopGame {
    local: Option<NativeHero>,
    profiles: HashMap<ClientId, NativeHero>,
    hero_updates: HashMap<ClientId, HeroUpdate>,
    world_profiles: HashMap<u64, NativeHero>,
    admitted: HashMap<ClientId, u64>,
    commands: VecDeque<(ClientId, commands::Input)>,
    zone: Option<String>,
    zone_started: f64,
    sync_sent: bool,
    fields: Option<benilla_protocol::ObjectFields>,
    state: Option<NativeState>,
    pub(super) hud: Option<serde_json::Value>,
    pick: azeroth_survivors_re::coop::pick::Client,
    choice_generations: HashMap<ClientId, u64>,
    resources: Vec<ResourceRow>,
    timers: Vec<TimerRow>,
    gear_received: usize,
    marks_received: f32,
    duplicate_marks: crate::save::gear_rewards::DuplicateMarks,
    seen_received: usize,
    sent_state: HashMap<ClientId, NativeState>,
    motion: HashMap<ClientId, commands::Motion>,
    inventory: HashMap<ClientId, client::inventory::RemoteInventory>,
    sent_players: HashMap<u64, Vec<(u16, u32)>>,
    sent_actions: HashMap<ClientId, Vec<u32>>,
    addon_publishers: HashMap<ClientId, client::addon_feed::Publisher>,
    state_sent_at: HashMap<ClientId, f64>,
    units: HashMap<u64, publication::UnitSnapshot>,
    sent_seen: HashMap<ClientId, Vec<(String, u8)>>,
    host_identity: Option<u64>,
    initial_list_identity: Option<u64>,
    tracking_sent: Option<(u64, bool)>,
    cooldowns: HashMap<u32, (f64, f32)>,
    aura_deadlines: HashMap<u8, (f64, f64)>,
    entry: Option<guest_settlement::Entry>,
    checkpoints: guest_settlement::Checkpoints,
    pending_events: Vec<RunEvent>,
    terminal_recap: Option<death_recap::DeathRecap>,
    pub(super) terminal_delivery: Option<azeroth_survivors_re::run_progression::TerminalDelivery>,
    pub(super) terminal_unlocked_zone: Option<Option<String>>,
}

impl CoopGame {
    fn receive_hero(&mut self, client: ClientId, hero: Box<NativeHero>, admission: HeroAdmission) -> Option<Vec<u8>> {
        let update = self.hero_updates.entry(client).or_default();
        if self.profiles.contains_key(&client)
            && update.last_applied.is_some_and(|last| admission.now - last < HERO_UPDATE_INTERVAL)
        {
            update.pending = Some(hero);
            return None;
        }
        self.apply_hero(client, *hero, admission)
    }

    fn apply_hero(&mut self, client: ClientId, hero: NativeHero, admission: HeroAdmission) -> Option<Vec<u8>> {
        self.hero_updates.entry(client).or_default().last_applied = Some(admission.now);
        let hero = match crate::coop_profile::sanitize(hero) {
            Ok(hero) => hero,
            Err(error) => {
                warn!("Co-op hero identity rejected: {error:?}");
                return None;
            }
        };
        if !self.profiles.contains_key(&client)
            && !hero.permits_zone(admission.zone_index, admission.heroic_rank)
        {
            return Some(NativeHero::locked_reason(admission.zone_key, admission.heroic_rank));
        }
        if hero.guid == admission.host_guid
            || self.profiles.iter().any(|(id, profile)| *id != client && profile.guid == hero.guid)
        {
            warn!("Co-op hero identity rejected: Duplicate");
            return None;
        }
        if admission.run_under_way || self.admitted.contains_key(&client) {
            return None;
        }
        self.profiles.insert(client, hero);
        None
    }

    fn drain_hero_update(&mut self, client: ClientId, admission: HeroAdmission) -> Option<Vec<u8>> {
        let pending = self.hero_updates.get_mut(&client).and_then(|update| {
            update.last_applied.filter(|last| admission.now - last >= HERO_UPDATE_INTERVAL)?;
            update.pending.take()
        });
        pending.and_then(|hero| self.apply_hero(client, *hero, admission))
    }

    fn retire_hero_profile(&mut self, client: ClientId) {
        self.profiles.remove(&client);
        self.hero_updates.remove(&client);
    }

    pub(super) fn member_language(&self, client: ClientId) -> Option<&[u8]> {
        let guid = self.admitted.get(&client)?;
        self.world_profiles.get(guid).map(|hero| hero.bytes_30.as_slice())
    }

    pub(super) fn terminal_recap(&self) -> Option<&death_recap::DeathRecap> {
        self.state.as_ref().filter(|state| {
            state.flag_8c && RunPhase::from_native(state.byte_8f) == RunPhase::Dead
        })?;
        self.terminal_recap.as_ref()
    }

    fn receive_denied(&mut self, client: Option<ClientId>) -> bool {
        if client.is_some() { return false; }
        // Denied drops the old guest role's cache. It does not establish a
        // local Game end, settlement, awards or a replacement disconnect reason.
        self.leave();
        true
    }

    fn kick_member(&self, runtime: &mut CoopRuntime, hero_identity: u64, now: f64) -> bool {
        let Some(driver) = runtime.driver.as_mut().filter(|driver| driver.is_hosting()) else {
            return false;
        };
        // Current145bb6767 walks actual connection rows with an admitted Hero
        // and compares that Hero's GUID. Roster positions/service IDs are unrelated.
        let client = driver.server.clients().iter().find_map(|client| {
            self.profiles.get(&client.id)
                .filter(|hero| hero.guid == hero_identity).map(|_| client.id)
        });
        client.is_some_and(|client| driver.kick_client(client, now))
    }

    fn guest_engine_packet(
        &self,
        opcode: u16,
        payload: Vec<u8>,
        engine_active: bool,
    ) -> Option<EnginePacket> {
        (self.sync_sent && engine_active
            && azeroth_survivors_re::coop::server_party::guest_engine_packet_allowed(
                opcode, payload.len(),
            ))
            .then(|| EnginePacket {
                opcode,
                payload: azeroth_survivors_re::coop::trust::guest_engine_payload(opcode, payload),
            })
    }

    pub(crate) fn leave(&mut self) {
        self.zone = None;
        self.state = None;
        self.fields = None;
        self.hud = None;
        self.pick.clear();
        self.commands.clear();
        self.hero_updates.clear();
        self.sync_sent = false;
        self.resources.clear();
        self.timers.clear();
        self.cooldowns.clear();
        self.aura_deadlines.clear();
        self.entry = None;
        self.checkpoints = Default::default();
        self.pending_events.clear();
        self.terminal_recap = None;
        self.duplicate_marks = Default::default();
        self.terminal_delivery = None;
        self.terminal_unlocked_zone = None;
    }

    fn zone_equipment_ids(&self, class: u8, armory: &crate::armory::ArmoryCatalog) -> Vec<u32> {
        self.zone.as_deref()
            .and_then(|key| armory.zones.iter().position(|zone| zone.key == key))
            .map(|zone| (0..armory.zones[zone].bosses.len())
                .flat_map(|boss| armory.pieces_for_boss(class, zone, boss))
                .map(|piece| piece.id).collect())
            .unwrap_or_default()
    }

    fn reward_heroic_rank(&self, save: &crate::save::Save) -> u8 {
        self.state.as_ref().map_or(0, |state| state.heroic_rank.min(save.max_heroic_rank(
            state.byte_90, azeroth_survivors_re::zones::resolve(&state.text).key)))
    }

    /// The admitted tag13 rows use the ordinary gear owner's ordered drop
    /// notices. Preserve them before replica construction as well as in a run.
    fn receive_equipment_grants(
        &mut self,
        run: &mut RunSession,
        menu: &mut MenuState,
        grants: &[EquipmentGrant],
        now: u64,
    ) {
        if grants.is_empty() { return; }
        let ids: Vec<_> = grants.iter().map(|grant| grant.item_id).collect();
        let retain = self.entry.and_then(|entry| entry.roster_guid)
            .is_some_and(|guid| guid != crate::startup::TESTER_GUID);
        let before = menu.backend_save.plaintext();
        let rank = self.reward_heroic_rank(&menu.backend_save);
        let race = menu.backend_pick().hero.race;
        let receipts = if retain {
            menu.backend_save.receive_equipment(&ids, rank)
        } else {
            let owned = crate::armory::GearSave::read(&menu.backend_save).owned;
            ids.iter().copied().filter(|id| crate::save::gear::decode(*id).is_some())
                .map(|id| crate::save::gear_rewards::EquipmentReceipt {
                    id, is_new: !owned.contains(&id), marks_tenths: 0,
                }).collect()
        };
        let mut events = Vec::new();
        for (grant, receipt) in grants.iter()
            .filter(|grant| crate::save::gear::decode(grant.item_id).is_some()).zip(receipts) {
            self.duplicate_marks.record(grant, receipt.marks_tenths);
            events.push(RunEvent::EquipmentLoot { id: receipt.id, is_new: receipt.is_new });
            events.push(RunEvent::GearReceipt { id: receipt.id, race,
                is_new: receipt.is_new, marks_tenths: receipt.marks_tenths });
        }
        if menu.backend_save.plaintext() != before {
            events.extend(crate::progression::grant_account(&mut menu.backend_save, Some(now))
                .into_iter().map(RunEvent::Achievement));
            menu.commit_account();
        }
        if let Some(game) = run.mechanics.as_mut() {
            game.set_duplicate_marks(self.duplicate_marks.clone());
            game.events.extend(events);
        }
        else { self.pending_events.extend(events); }
    }

    fn receive_boss_rewards(
        &mut self, run: &mut RunSession, menu: &mut MenuState,
        class: u8, marks: f32, missed: &[u32], now: u64,
    ) {
        if !self.entry.and_then(|entry| entry.roster_guid)
            .is_some_and(|guid| guid != crate::startup::TESTER_GUID) { return; }
        let before = menu.backend_save.plaintext();
        menu.backend_save.record_boss_rewards(class, marks, missed);
        let mut events = Vec::new();
        if marks > 0. {
            events.push(RunEvent::MarksEarned { earned: marks,
                total_tenths: menu.backend_save.class_marks_tenths(class) });
        }
        if menu.backend_save.plaintext() != before {
            events.extend(crate::progression::grant_account(&mut menu.backend_save, Some(now))
                .into_iter().map(RunEvent::Achievement));
            menu.commit_account();
        }
        if let Some(game) = run.mechanics.as_mut() { game.events.extend(events); }
        else { self.pending_events.extend(events); }
    }

    ///145c30b84 publishes a clear from each accepted State15 independently of
    /// terminal/summary admission, including the pre-world cache lifetime.
    fn receive_victory(&mut self, run: &mut RunSession, menu: &mut MenuState) {
        let Some(entry) = self.entry.filter(|_| self.zone.is_some()) else { return; };
        let Some(state) = self.state.as_ref() else { return; };
        let snapshot = guest_settlement::Snapshot::from_cached(state, entry, &self.checkpoints)
            .with_duplicate_marks(&self.duplicate_marks)
            .with_notice_ready(self.sync_sent);
        let events = snapshot.victory(menu, entry.roster_guid);
        if let Some(game) = run.mechanics.as_mut() { game.events.extend(events); }
        else { self.pending_events.extend(events); }
    }

    /// Current State15 dispatch evaluates feats before its terminal checks.
    /// Accepted pre-world snapshots use the same recipient save and pending events.
    pub(super) fn receive_live_feats(&mut self, run: &mut RunSession, menu: &mut MenuState, now: u64) {
        let Some(entry) = self.entry.filter(|_| self.zone.is_some()) else { return; };
        let Some(state) = self.state.as_ref() else { return; };
        let snapshot = guest_settlement::Snapshot::from_cached(state, entry, &self.checkpoints)
            .with_duplicate_marks(&self.duplicate_marks);
        let events = snapshot.live_feats(menu, entry.roster_guid, now);
        if let Some(game) = run.mechanics.as_mut() { game.events.extend(events); }
        else { self.pending_events.extend(events); }
    }

    /// The native snapshot owner accepts a validated cache before local-world
    /// bootstrap. Settle that same recipient before any close removes it.
    pub(crate) fn settle(
        &mut self,
        run: &mut RunSession,
        menu: &mut MenuState,
        catalog: &MenuCatalog,
        locale: Option<&crate::localization::Localization>,
        notifications: &mut notifications::Notifications,
        now: u64,
        ui_time: f32,
        closing: bool,
    ) -> Vec<SessionEvent> {
        let Some(entry) = self.entry.filter(|_| self.zone.is_some() && self.state.is_some()) else {
            return Vec::new();
        };
        if let Some(game) = run.mechanics.as_mut().filter(|game| game.is_party_replica()) {
            if !closing {
                self.terminal_delivery = game.summary_delivery();
                self.terminal_unlocked_zone = Some(self.terminal_delivery.as_ref()
                    .filter(|_| entry.roster_guid.is_some_and(|guid| guid != crate::startup::TESTER_GUID))
                    .and_then(|delivery| terminal::unlocked_zone(delivery, menu, catalog)));
            }
            persist_run_at(game, menu, entry.roster_guid, run.starting_gear,
                run.showcase, run.started, now, true);
            return if closing {
                client::guest_account_messages(&mut game.events, catalog, locale, notifications, ui_time)
            } else { Vec::new() };
        }
        let snapshot = guest_settlement::Snapshot::from_cached(self.state.as_ref().unwrap(), entry,
            &self.checkpoints).with_duplicate_marks(&self.duplicate_marks).with_notice_ready(self.sync_sent);
        if !closing {
            self.terminal_delivery = snapshot.delivery().cloned();
            self.terminal_unlocked_zone = Some(self.terminal_delivery.as_ref()
                .filter(|_| entry.roster_guid.is_some_and(|guid| guid != crate::startup::TESTER_GUID))
                .and_then(|delivery| terminal::unlocked_zone(delivery, menu, catalog)));
        }
        let mut events = snapshot.summary(menu, entry.roster_guid, now);
        self.checkpoints.acknowledge_summary(&snapshot, entry.roster_guid);
        events.extend(snapshot.account(menu, entry.roster_guid, now));
        self.checkpoints.acknowledge_account(&snapshot, entry.roster_guid);
        self.pending_events.extend(events);
        if closing {
            client::guest_account_messages(&mut self.pending_events, catalog, locale, notifications, ui_time)
        } else { Vec::new() }
    }
}

pub(super) fn install(app: &mut App) {
    commands::install(app);
    reconnection::install(app);
    party_frames::install(app);
    publication::install(app);
    overlay::install(app);
    app.init_resource::<CoopGame>()
        .add_systems(First, receive.in_set(CoopSet::Apply))
        .add_systems(
            Update,
            bootstrap.after(ZoneWorldSet::Ready).before(RunSet::Tick),
        )
        .add_systems(Update, guest_request_route.after(bootstrap))
        .add_systems(
            Update,
            settings
                .after(bootstrap)
                .after(RunSet::Input)
                .before(RunSet::Tick),
        );
}

fn guest_request_route(
    runtime: Res<CoopRuntime>, state: Res<CoopGame>,
    mut wire: ResMut<benilla_app::local_client::LocalWireRequests>,
) {
    // Current145b21ef6 forwards guest requests only after synchronization.
    // Update after bootstrap so PostUpdate request collection sees that edge.
    wire.enabled = runtime.is_guest() && state.sync_sent;
}

fn appearance(hero: &NativeHero) -> crate::save::Hero {
    crate::save::Hero {
        class: hero.class,
        race: hero.race,
        sex: hero.sex,
        features: hero.features,
    }
}

fn template(
    profile: &NativeHero,
    zone: &str,
    rules: RunRules,
    week: Option<u32>,
    entry: &EntryCatalog,
    catalog: &MenuCatalog,
    armory: &crate::armory::ArmoryCatalog,
    seed: [u64; 4],
    locale: &crate::localization::Localization,
) -> Result<Mechanics, String> {
    let class = crate::save::CLASS_IDS
        .iter()
        .position(|id| *id == profile.class)
        .and_then(|index| catalog.classes.get(index))
        .ok_or_else(|| "No native class entry for the admitted hero".to_owned())?;
    let hero = appearance(profile);
    let stats = entry_player_stats(class, &hero, entry);
    let mut game = Mechanics::new(zone, &class.key, rules, stats, seed)?;
    if let Some(week) = week { game.configure_heroic_affixes(rules.heroic_rank, week); }
    let actor_locale = locale.for_code(&String::from_utf8_lossy(&profile.bytes_30));
    game.set_spell_display_locale(&actor_locale);
    let race = entry
        .races
        .iter()
        .find(|race| race.native_id == hero.race)
        .ok_or_else(|| "No native race entry for the admitted hero".to_owned())?;
    game.player_guid = profile.guid;
    game.set_equipment_ids(profile.words_188);
    game.set_racial_progression_components(
        entry.player.damage_multiplier,
        race.damage_bonus,
        0.8,
        race.regeneration_bonus,
    );
    crate::coop_profile::configure(&mut game, profile, armory);
    game.configure_party_options(profile.bytes_1d8);
    game.set_base_movement_multiplier(1.0 + race.move_bonus);
    game.finish_player_entry();
    Ok(game)
}

fn receive(
    mut runtime: ResMut<CoopRuntime>,
    mut state: ResMut<CoopGame>,
    mut run: ResMut<RunSession>,
    mut menu: ResMut<MenuState>,
    options: Res<crate::options::OptionsState>,
    locale: Res<crate::localization::Localization>,
    time: Res<Time>,
    mut local: ResMut<LocalClientSession>,
    mut inbound: ResMut<LocalWireEvents>,
    mut item_texts: ResMut<benilla_app::local_client::LocalItemDescriptions>,
    mut presentation: ResMut<LocalPresentationEvents>,
    armory: Res<crate::armory::ArmoryCatalog>,
    mut commands: Commands,
    mut world: ResMut<ZoneWorld>,
    (input, bridge, hud_settings, catalog, stock, mut notifications, mut board, units, mut terrain, mut coop_view): (
        Res<benilla_app::local_client::LocalClientInput>,
        Res<client::BridgeCatalog>,
        Res<run_hud::HudSettings>,
        Res<MenuCatalog>,
        Option<Res<benilla_app::local_client::LocalStockFrontend>>,
        ResMut<notifications::Notifications>,
        ResMut<client::raid_targets::RaidTargets>,
        Query<(&LocalUnitVisual, &Transform, Option<&benilla_app::local_client::LocalUnitPath>)>,
        commands::CommandTerrain,
        ResMut<crate::coop_ui::CoopUi>,
    ),
) {
    let now = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH)
        .map_or(0, |duration| duration.as_secs());
    // Host service failure precedes its peer update in145878f30. Only the
    // guest's dead-host path dispatches the buffered batch before teardown.
    if runtime.transport_lost && !runtime.is_guest() {
        finish_transport_lost(
            &mut runtime,
            &mut state,
            &mut run,
            &mut menu,
            &mut world,
            &mut commands,
            (&catalog, &locale, &mut notifications, now, time.elapsed_secs(), local.active),
            (&mut inbound, &mut presentation),
        );
        return;
    }
    for hero_identity in std::mem::take(&mut runtime.kick_requests) {
        state.kick_member(&mut runtime, hero_identity, time.elapsed_secs_f64());
    }
    // The process identity also exists offline. It does not admit a party
    // profile; retain any buffered lifecycle/end batch before the idle return.
    if runtime.driver.is_none() && runtime.incoming.is_empty() && runtime.party_events.is_empty() {
        return;
    }
    let Some(guid) = runtime.world_guid else {
        finish_transport_lost(
            &mut runtime,
            &mut state,
            &mut run,
            &mut menu,
            &mut world,
            &mut commands,
            (&catalog, &locale, &mut notifications, now, time.elapsed_secs(), local.active),
            (&mut inbound, &mut presentation),
        );
        return;
    };
    // The queued batch belongs to its upstream guest even after Session has
    // switched that refused endpoint Off. Earlier packets still precede Denied.
    let guest = runtime.driver.as_ref().is_some_and(|driver| !driver.is_hosting());
    let begin_ready_check = std::mem::take(&mut runtime.begin_ready_check);
    let cancel_ready_check = std::mem::take(&mut runtime.cancel_ready_check);
    if let Some(answer) = runtime.ready_answer.take().filter(|_| guest && state.zone.is_none()) {
        if let Some(driver) = runtime.driver.as_mut() {
            driver.send_ready_answer(answer);
        }
    }
    let pick = menu.backend_pick().clone();
    let flags = [
        u8::from(
            options
                .cvar("cacheOnClick")
                .and_then(|v| v.parse::<f32>().ok())
                .is_some_and(|v| v != 0.0),
        ),
        u8::from(options.cvar("storeLevels").is_some_and(|v| v == "1")),
        u8::from(hud_settings.shown("flag")),
    ];
    let profile =
        crate::coop_profile::build(&menu.backend_save, &pick, guid, locale.code(), flags, runtime.roster_profile.clone());
    if state.local.as_ref() != Some(&profile) && run.mechanics.is_none() {
        state.local = Some(profile.clone());
        if guest
            && runtime
                .driver
                .as_ref()
                .is_some_and(|driver| driver.accepted().is_some())
        {
            runtime.send(
                None,
                NativeMessage::Lifecycle(LifecyclePacket::Hero(Box::new(profile))),
            );
        }
    }
    for text in std::mem::take(&mut runtime.lobby_chat_requests) {
        let text = azeroth_survivors_re::coop::server_party::normalize_lobby_chat(&text);
        if text.is_empty() { continue; }
        if guest {
            if state.zone.is_some() || state.sync_sent { continue; }
            if let Some(driver) = runtime.driver.as_mut() {
                driver.send_guest_lobby_chat(text.into_bytes());
            }
            continue;
        }
        if run.mechanics.is_some() { continue; }
        let Some(hero) = state.local.as_ref() else { continue; };
        let chat = azeroth_survivors_re::coop::server_party::NativeLobbyChat {
            hero_identity: hero.guid, name: hero.name.clone(), class: hero.class,
            text: text.into_bytes(),
        };
        if let Some(driver) = runtime.driver.as_mut() {
            driver.publish_lobby_chat(chat);
        }
    }
    // A kick follows this frame's transport poll, so expose its ordinary
    // Left/Removed edges to the existing world consumers in this same Apply pass.
    let retired = runtime.driver.as_mut().map(|driver| driver.take_party_events()).unwrap_or_default();
    runtime.party_events.extend(retired);
    let mut events = std::collections::VecDeque::from(std::mem::take(&mut runtime.party_events));
    events.extend(std::mem::take(&mut runtime.incoming).into_iter()
        .map(azeroth_survivors_re::coop::session::PartyEvent::Incoming));
    let profile_now = time.elapsed_secs_f64();
    let selected_zone = azeroth_survivors_re::zones::resolve(&pick.zone);
    let zone_index = azeroth_survivors_re::guardians::catalog::ZONES
        .iter().position(|row| row.key == selected_zone.key).unwrap_or(0);
    let selected_rank = pick.heroic_rank.min(
        menu.backend_save.max_heroic_rank(pick.hero.class, selected_zone.key)).min(5);
    let hero_admission = HeroAdmission {
        host_guid: guid,
        now: profile_now,
        run_under_way: runtime.driver.as_ref().is_some_and(|driver| driver.server.run_under_way()),
        zone_key: selected_zone.key,
        zone_index,
        heroic_rank: selected_rank,
    };
    loop {
        let event = events.pop_front().or_else(|| runtime.driver.as_mut()
            .filter(|driver| driver.is_hosting()).and_then(|driver| driver.next_host_event()));
        let Some(event) = event else { break; };
        if let azeroth_survivors_re::coop::session::PartyEvent::Membership(
            MembershipEvent::Left { client, .. }) = &event {
            let client = *client;
            state.retire_hero_profile(client);
            if let Some(guid) = state.admitted.remove(&client) {
                if let Some(game) = run.mechanics.as_mut() {
                    if let Some(slot) = game.party_slot(guid) {
                        game.leave_party_hero(slot);
                    }
                }
            }
            state.sent_state.remove(&client);
            state.motion.remove(&client);
            state.inventory.remove(&client);
            state.sent_seen.remove(&client);
            state.sent_actions.remove(&client);
            state.addon_publishers.remove(&client);
            state.state_sent_at.remove(&client);
            state.choice_generations.remove(&client);
        }
        if let azeroth_survivors_re::coop::session::PartyEvent::Removed { clients, .. } = &event {
            if let Some(game) = run.mechanics.as_ref() {
                party_frames::fanout_with_clients(&mut runtime, game, local.active, &mut presentation, clients);
            }
        }
        let azeroth_survivors_re::coop::session::PartyEvent::Incoming(incoming) = event else { continue; };
        let client = incoming.client;
        match incoming.message {
            NativeMessage::Lifecycle(LifecyclePacket::Denied(_)) => {
                if state.receive_denied(client) { return; }
            }
            NativeMessage::Lifecycle(LifecyclePacket::LobbyChat(chat)) if !guest => {
                if run.mechanics.is_some() { continue; }
                let Some(client) = client else { continue; };
                let Some(hero) = state.profiles.get(&client) else { continue; };
                let text = azeroth_survivors_re::coop::server_party::normalize_lobby_chat(
                    &String::from_utf8_lossy(&chat.text));
                if text.is_empty() { continue; }
                let Some(driver) = runtime.driver.as_mut() else { continue; };
                if driver.admit_lobby_chat(client, time.elapsed_secs_f64()) {
                    // Sender metadata comes from the admitted Hero, never the
                    // untrusted chat frame's supplied identity/name/class.
                    driver.publish_lobby_chat(azeroth_survivors_re::coop::server_party::NativeLobbyChat {
                        hero_identity: hero.guid, name: hero.name.clone(), class: hero.class,
                        text: text.into_bytes(),
                    });
                }
            }
            NativeMessage::Lifecycle(LifecyclePacket::ReadyAnswer(ready)) if !guest => {
                if let Some((driver, hero)) = runtime.driver.as_mut().zip(client.and_then(|id| state.profiles.get(&id))) {
                    driver.answer_ready_check(hero.guid, ready);
                }
            }
            NativeMessage::Lifecycle(LifecyclePacket::ReadyCheck(mut snapshot))
                if guest && state.zone.is_none() && !state.sync_sent =>
            {
                use azeroth_survivors_re::coop::readycheck::{Answer, SECONDS};
                snapshot.left = snapshot.left.min(SECONDS);
                snapshot.answers.truncate(5);
                for (_, answer) in &mut snapshot.answers {
                    if matches!(answer, Answer::Unknown(_)) {
                        *answer = Answer::NotReady;
                    }
                }
                coop_view.receive_ready_check(snapshot, guid, time.elapsed_secs(), &locale);
            }
            NativeMessage::Lifecycle(LifecyclePacket::Accepted(_)) if guest => {
                if let Some(hero) = &state.local {
                    runtime.send(
                        None,
                        NativeMessage::Lifecycle(LifecyclePacket::Hero(Box::new(hero.clone()))),
                    );
                }
            }
            NativeMessage::Lifecycle(LifecyclePacket::Hero(hero)) if !guest => {
                let Some((client, driver)) = client.zip(runtime.driver.as_mut()) else { continue };
                if let Some(reason) = state.receive_hero(client, hero, hero_admission) {
                    driver.reject_hero(client, reason, profile_now);
                }
            }
            NativeMessage::Lifecycle(LifecyclePacket::Synchronize) if !guest => {
                if let Some(client) = client {
                    synchronize(client, &mut state, &mut runtime, &mut run, &bridge,
                        &armory, &locale, &board, &units, local.active, &mut presentation);
                }
            }
            message @ (NativeMessage::Lifecycle(LifecyclePacket::EngineCommand { .. })
                | NativeMessage::ItemTemplate { .. }) => {
                let (opcode, payload) = match message {
                    NativeMessage::Lifecycle(LifecyclePacket::EngineCommand { opcode, payload }) => (opcode, payload),
                    NativeMessage::ItemTemplate { payload, descriptions } if guest => {
                        let Some(payload) = engine_packets::remap_item_descriptions(payload, &descriptions,
                            |text| item_texts.intern(text)) else { continue; };
                        (benilla_protocol::messages::opcode::SMSG_ITEM_QUERY_SINGLE_RESPONSE, payload)
                    }
                    _ => continue,
                };
                if let Some(client) = client {
                    if opcode == benilla_protocol::messages::opcode::MSG_RAID_TARGET_UPDATE {
                        // Session already admitted the synchronized transport row.
                        // Apply in receive order before the next peer event.
                        let (icon, target) = client::raid_targets::request_body(&payload);
                        if icon == 0xff {
                            if let Ok(Some(packet)) = engine_packets::encode(&board.list(), None) {
                                runtime.send(Some(client), packet.into_message());
                            }
                        } else {
                            let changes = board.set(icon, target);
                            if run.mechanics.is_some() {
                                client::raid_targets::relay_changes(&mut runtime, &changes);
                            }
                            if local.active {
                                presentation.0.extend(changes);
                            }
                        }
                        continue;
                    }
                    if opcode == benilla_protocol::messages::opcode::CMSG_ITEM_NAME_QUERY {
                        let entry = commands::template_entry(&payload);
                        let actor = run.mechanics.as_ref()
                            .and_then(|_| state.admitted.get(&client))
                            .and_then(|guid| state.world_profiles.get(guid));
                        let language = actor.map(|hero| String::from_utf8_lossy(&hero.bytes_30))
                            .unwrap_or_else(|| locale.code().into()).into_owned();
                        let reply = state.inventory.entry(client).or_default()
                            .query_name(entry, &armory, &locale, &language);
                        if let Ok(Some(packet)) = engine_packets::encode(&reply, None) {
                            runtime.send(Some(client), packet.into_message());
                        }
                        continue;
                    }
                    state.commands.push_back((client, commands::Input::Engine(EnginePacket {
                        opcode,
                        payload,
                    })));
                } else if guest {
                    let Some(packet) = state.guest_engine_packet(opcode, payload, local.active) else {
                        continue;
                    };
                    let Some(driver) = runtime.driver.as_mut() else { continue };
                    let packet = driver.smooth.packet(packet, time.elapsed_secs_f64());
                    if let Ok(events) = packet.decode_server() {
                        for event in events {
                            observe(
                                &mut state,
                                &mut local,
                                &event,
                                guid,
                                time.elapsed_secs_f64(),
                            );
                        }
                    }
                    inbound.0.push((packet.opcode, packet.payload));
                }
            }
            NativeMessage::Time(milliseconds) if guest => {
                if let Some(driver) = runtime.driver.as_mut() {
                    driver.smooth.sample(milliseconds, time.elapsed_secs_f64());
                }
            }
            NativeMessage::ZoneKey(zone) if guest => {
                //145b05300 always returns a canonical row; unknown text and
                // case mismatches select row0 rather than an absent ZoneKey.
                let zone = azeroth_survivors_re::zones::resolve(&zone).key.to_owned();
                // Every admitted ZoneKey starts a new cache/checkpoint lifetime,
                // including a restart in the same zone. Native reset does not
                // settle the previous run here.
                state.leave();
                run.mechanics = None;
                run.started = false;
                run.paused = false;
                let roster_guid = if stock.is_some() { menu.selected_roster_guid() }
                    else { menu.backend_save.pick().map(|pick| pick.custom_character().guid) };
                state.entry = Some(guest_settlement::Entry {
                    roster_guid,
                    veteran_bonus: crate::progression::account_run_grants(
                        &menu.backend_save, pick.hero.class).veteran_bonus,
                });
                state.zone = Some(zone);
                state.zone_started = time.elapsed_secs_f64();
                state.gear_received = 0;
                state.marks_received = 0.0;
                state.seen_received = 0;
            }
            NativeMessage::Control { kind, argument, offer } if !guest => {
                if let Some(client) = client {
                    state.commands.push_back((client, commands::Input::Control {
                        kind, argument, offer,
                    }));
                }
            }
            NativeMessage::State(value) if guest => {
                let zone = azeroth_survivors_re::zones::resolve(&value.text);
                let bosses = zone.bosses.iter().map(|row| row.id).collect::<Vec<_>>();
                let duration = zone
                    .bosses
                    .last()
                    .map_or(1200., |row| f64::from(row.time_minutes) * 60.);
                if let Some(value) = azeroth_survivors_re::coop::client_state::validate_state(
                    value,
                    azeroth_survivors_re::coop::client_state::StateValidation {
                        canonical_zone_matches: state
                            .zone
                            .as_deref()
                            .map(azeroth_survivors_re::zones::resolve)
                            .is_some_and(|selected| selected.key == zone.key),
                        class: pick.hero.class,
                        seconds_since_zone_start: time.elapsed_secs_f64() - state.zone_started,
                        zone_duration_seconds: duration,
                        boss_ids: &bosses,
                    },
                ) {
                    let projection = RunProjection::read(&value);
                    if projection.phase == RunPhase::Victory
                        || (projection.phase != RunPhase::Dead
                            && state.state.as_ref().is_some_and(|previous| {
                                RunPhase::from_native(previous.byte_8f) == RunPhase::Dead
                            }))
                    {
                        state.terminal_recap = None;
                    }
                    run.started = !matches!(projection.phase, RunPhase::Ready);
                    run.paused = matches!(projection.phase, RunPhase::Paused);
                    if let Some(game) = run.mechanics.as_mut() {
                        game.apply_replica_native(&value);
                    }
                    let terminal_edge = state.checkpoints.admit_terminal_state(&value);
                    state.state = Some(value);
                    state.receive_live_feats(&mut run, &mut menu, now);
                    state.receive_victory(&mut run, &mut menu);
                    if terminal_edge {
                        let messages = state.settle(&mut run, &mut menu, &catalog,
                            Some(&locale), &mut notifications, now, time.elapsed_secs(), false);
                        queue_delivery(&mut commands, &mut inbound, &mut presentation, messages, None);
                    }
                }
            }
            NativeMessage::Lifecycle(LifecyclePacket::EventBytes(bytes)) if guest => {
                overlay::receive_choices(&mut state, &bytes);
                if client.is_none() && state.zone.is_some() {
                    recap::receive(&mut state.terminal_recap, &bytes);
                }
            }
            NativeMessage::HudJson(text) if guest => {
                if let Ok(value) = serde_json::from_str(&text) {
                    state.hud = Some(value);
                }
                if state.pick.receive_hud(&text, time.elapsed_secs_f64()) {
                    runtime.send(None, NativeMessage::Control { kind: 10, argument: 0, offer: 0 });
                }
            }
            NativeMessage::Resources(mut rows) if guest => {
                azeroth_survivors_re::coop::client_state::sanitize_resources(&mut rows);
                state.resources = rows;
            }
            NativeMessage::Timers(mut rows) if guest => {
                azeroth_survivors_re::coop::client_state::sanitize_timers(&mut rows);
                state.timers = rows;
            }
            NativeMessage::EquipmentGrants(grants) if guest && state.zone.is_some() => {
                let allowed = state.zone_equipment_ids(pick.hero.class, &armory);
                let grants = azeroth_survivors_re::coop::client_state::accept_equipment_grants(
                    grants,
                    &allowed,
                    &mut state.gear_received,
                );
                state.receive_equipment_grants(&mut run, &mut menu, &grants, now);
            }
            NativeMessage::MarksAndPity { marks_bits, missed_items } if guest && state.zone.is_some() => {
                let allowed = state.zone_equipment_ids(pick.hero.class, &armory);
                let (marks, missed) = azeroth_survivors_re::coop::client_state::accept_marks_and_pity(
                    marks_bits, missed_items, &allowed, &mut state.marks_received);
                state.receive_boss_rewards(&mut run, &mut menu, pick.hero.class, marks, &missed, now);
            }
            NativeMessage::StringRanks(rows) if guest && state.zone.is_some() => {
                let rows = azeroth_survivors_re::coop::client_state::accept_seen_grants(
                    rows,
                    azeroth_survivors_re::coop::client_state::recognized_seen_key,
                    &mut state.seen_received,
                );
                if !rows.is_empty()
                    && menu.selected_roster_guid() != Some(crate::startup::TESTER_GUID)
                {
                    menu.backend_save.record_seen(&rows);
                    menu.commit_account();
                }
            }
            NativeMessage::End if guest && state.zone.is_some() && state.state.is_some() => {
                let final_messages = state.settle(&mut run, &mut menu, &catalog,
                    Some(&locale), &mut notifications, now, time.elapsed_secs(), true);
                state.leave();
                world.request = None;
                run.mechanics = None;
                run.started = false;
                run.paused = false;
                if local.active || menu.in_run { menu.return_from_run(); }
                queue_delivery(&mut commands, &mut inbound, &mut presentation,
                    final_messages, local.active.then_some(benilla_protocol::SessionEnd::LoggedOut));
                let hero = crate::coop_profile::build(
                    &menu.backend_save,
                    &pick,
                    guid,
                    locale.code(),
                    flags,
                    runtime.roster_profile.clone(),
                );
                state.local = Some(hero.clone());
                runtime.send(
                    None,
                    NativeMessage::Lifecycle(LifecyclePacket::Hero(Box::new(hero))),
                );
            }
            _ => {}
        }
        // Apply authenticated world input before the host pump can advance to
        // another packet or retire this peer. Bootstrap can finish in Update.
        if !state.commands.is_empty() {
            commands::drain(
                &mut state, &mut runtime, &mut run, &world, &mut terrain,
                &locale, &mut presentation, &armory, &mut item_texts,
            );
        }
    }
    if let Some(driver) = runtime.driver.as_mut().filter(|driver| driver.is_hosting()) {
        // The native frame takes due profiles after peer input, before roster
        // publication, in the live connection order.
        let denied = driver.server.clients().iter().filter(|row| row.closing_since.is_none())
            .filter_map(|row| state.drain_hero_update(row.id, hero_admission).map(|reason| (row.id, reason)))
            .collect::<Vec<_>>();
        for (client, reason) in denied {
            driver.reject_hero(client, reason, profile_now);
        }
    }
    if !guest {
        let mut rows = state
            .local
            .iter()
            .map(|hero| roster_row(hero, true))
            .collect::<Vec<_>>();
        if let Some(driver) = runtime.driver.as_mut() {
            if let Some(host) = rows.first_mut() { host.country = driver.host_country().into_bytes(); }
            for client in driver
                .server
                .clients()
                .iter()
                .filter(|row| row.joined && row.closing_since.is_none())
            {
                if let Some(hero) = state.profiles.get(&client.id) {
                    let mut row = roster_row(hero, hero.permits_zone(zone_index, selected_rank));
                    let (ping, country) = driver.peer_lobby_metadata(client.id);
                    row.ping_ms = ping;
                    row.country = country.into_bytes();
                    rows.push(row);
                }
            }
            driver.publish_roster(rows, selected_zone.key.into(), selected_rank);
            if driver.advance_ready_check(time.elapsed_secs_f64(), begin_ready_check, cancel_ready_check)
                && !menu.in_run && !menu.entering {
                menu.admit_enter(time.elapsed_secs());
            }
        }
    }
    if guest {
        let now = time.elapsed_secs_f64();
        local.spell_cooldowns = state
            .cooldowns
            .iter()
            .filter_map(|(id, (deadline, duration))| {
                let remaining = (*deadline - now) as f32;
                (remaining > 0.).then_some((
                    *id,
                    benilla_app::local_client::LocalCooldown {
                        remaining,
                        duration: *duration,
                    },
                ))
            })
            .collect();
        let cooldowns = local.spell_cooldowns.clone();
        for action in &mut local.actions {
            action.cooldown = cooldowns
                .iter()
                .find_map(|(id, value)| (*id == action.spell_id).then_some(*value));
        }
        if let Some(fields) = &state.fields {
            local.auras = fields
                .unit_auras()
                .filter_map(|aura| {
                    let (duration, expiration) = state.aura_deadlines.get(&aura.slot).map_or(
                        (0., 0.),
                        |(deadline, duration)| {
                            (*duration, input.ui_time + (*deadline - now).max(0.))
                        },
                    );
                    benilla_app::local_client::descriptor_aura_state(
                        aura,
                        duration,
                        expiration,
                        bridge.spells.as_deref(),
                        bridge.spell_durations.as_ref(),
                    )
                })
                .collect();
        }
        if let (Some(game), Some(player)) = (run.mechanics.as_mut(), local.player.as_ref()) {
            game.apply_replica_vitals(player.health, player.max_health, player.xp, player.gold);
        }
    }
    if let Some(driver) = runtime.driver.as_mut().filter(|driver| driver.is_hosting()) {
        let changes = driver.take_reconnection_changes();
        let retry = driver.take_relay_retry_change();
        runtime.reconnection_changes.extend(changes);
        if let Some(reconnecting) = retry {
            runtime.reconnection_changes.push(azeroth_survivors_re::coop::session::ReconnectionChange::Relay(reconnecting));
        }
    }
    if let Some(game) = run.mechanics.as_ref() {
        runtime.actor_clients = state
            .admitted
            .iter()
            .filter_map(|(client, guid)| game.party_slot(*guid).map(|slot| (slot, *client)))
            .collect();
    }
    // Native guest receive dispatches its final buffered frames before the
    // dead-host transition. Keep the driver/guest role through that batch.
    finish_transport_lost(
        &mut runtime,
        &mut state,
        &mut run,
        &mut menu,
        &mut world,
        &mut commands,
        (&catalog, &locale, &mut notifications, now, time.elapsed_secs(), local.active),
            (&mut inbound, &mut presentation),
    );
}

/// Keep each received batch before its settlement notices. Later wire frames
/// remain queued for their own delivery rather than overtaking an earlier edge.
pub(crate) fn queue_delivery(
    commands: &mut Commands,
    inbound: &mut LocalWireEvents,
    presentation: &mut LocalPresentationEvents,
    messages: Vec<SessionEvent>,
    end: Option<benilla_protocol::SessionEnd>,
) {
    let wire = std::mem::take(&mut inbound.0);
    let presented = std::mem::take(&mut presentation.0);
    commands.queue(move |world: &mut World| {
        let later_wire = std::mem::replace(&mut world.resource_mut::<LocalWireEvents>().0, wire);
        let later_presented = std::mem::replace(
            &mut world.resource_mut::<LocalPresentationEvents>().0, presented);
        benilla_app::local_client::events::flush_events(world);
        world.resource_mut::<LocalPresentationEvents>().0.extend(messages);
        benilla_app::local_client::events::flush_events(world);
        if let Some(end) = end {
            let event = match end {
                benilla_protocol::SessionEnd::LoggedOut => SessionEvent::LoggedOut,
                benilla_protocol::SessionEnd::Lost => SessionEvent::Disconnected {
                    reason: "Host connection closed".into(), end,
                },
            };
            world.resource_mut::<LocalPresentationEvents>().0.push(event);
            benilla_app::local_client::events::flush_events(world);
            let mut local = world.resource_mut::<LocalClientSession>();
            match end {
                benilla_protocol::SessionEnd::LoggedOut => local.logout(),
                benilla_protocol::SessionEnd::Lost => local.end(),
            }
        }
        world.resource_mut::<LocalWireEvents>().0.extend(later_wire);
        world.resource_mut::<LocalPresentationEvents>().0.extend(later_presented);
    });
}

fn finish_transport_lost(
    runtime: &mut CoopRuntime,
    state: &mut CoopGame,
    run: &mut RunSession,
    menu: &mut MenuState,
    world: &mut ZoneWorld,
    commands: &mut Commands,
    (catalog, locale, notifications, now, ui_time, local_active): (&MenuCatalog, &crate::localization::Localization,
        &mut notifications::Notifications, u64, f32, bool),
    (inbound, presentation): (&mut LocalWireEvents, &mut LocalPresentationEvents),
) {
    if !std::mem::take(&mut runtime.transport_lost) {
        return;
    }
    let final_messages = state.settle(run, menu, catalog, Some(locale), notifications, now, ui_time, true);
    state.leave();
    world.request = None;
    run.mechanics = None;
    run.started = false;
    run.paused = false;
    if local_active || menu.in_run { menu.return_from_run(); }
    queue_delivery(commands, inbound, presentation, final_messages, local_active.then_some(benilla_protocol::SessionEnd::Lost));
    runtime.close_lost_driver();
    runtime.party.clear();
    runtime.actor_clients.clear();
}

fn roster_row(hero: &NativeHero, eligible: bool) -> NativeRosterEntry {
    NativeRosterEntry {
        hero_identity: hero.guid,
        name: hero.name.clone(),
        class: hero.class,
        race: hero.race,
        profile: hero.profile.clone(),
        achievement_points: hero.achievement_points,
        eligible,
        ping_ms: None,
        country: Vec::new(),
    }
}

fn observe(
    state: &mut CoopGame,
    local: &mut LocalClientSession,
    event: &SessionEvent,
    self_guid: u64,
    now: f64,
) {
    match event {
        SessionEvent::ObjectCreate { guid, fields, .. } if *guid == self_guid => {
            state.fields = Some(fields.clone())
        }
        SessionEvent::ObjectValues { guid, fields } if *guid == self_guid => {
            if let Some(previous) = state.fields.as_mut() {
                previous.merge(fields.clone());
            }
        }
        SessionEvent::SpellBook {
            spell_ids,
            cooldowns,
        } => {
            local.known_spells = spell_ids.clone();
            state.cooldowns.clear();
            for cooldown in cooldowns {
                let duration = cooldown.spell_cd_ms.max(cooldown.category_cd_ms) as f32 / 1000.;
                state.cooldowns.insert(
                    u32::from(cooldown.spell_id),
                    (now + f64::from(duration), duration),
                );
            }
        }
        SessionEvent::ActionButtons { buttons } => {
            local.actions = buttons
                .iter()
                .filter(|button| button.kind == benilla_protocol::messages::ACTION_KIND_SPELL)
                .map(|button| benilla_app::local_client::LocalActionUi {
                    slot: u32::from(button.slot) + 1,
                    spell_id: button.action,
                    texture: None,
                    cooldown: None,
                    usable: true,
                    in_range: None,
                })
                .collect();
        }
        SessionEvent::SpellLearned { spell_id } => {
            if !local.known_spells.contains(spell_id) {
                local.known_spells.push(*spell_id);
            }
        }
        SessionEvent::SpellRemoved { spell_id } => local.known_spells.retain(|id| id != spell_id),
        SessionEvent::SpellCooldowns { caster, cooldowns } if *caster == self_guid => {
            for (id, millis) in cooldowns {
                if *millis != 0 {
                    let duration = *millis as f32 / 1000.;
                    state
                        .cooldowns
                        .insert(*id, (now + f64::from(duration), duration));
                }
            }
        }
        SessionEvent::ClearCooldown { caster, spell_id } if *caster == self_guid => {
            state.cooldowns.remove(spell_id);
        }
        SessionEvent::CooldownCheat { caster } if *caster == self_guid => state.cooldowns.clear(),
        SessionEvent::AuraDuration { slot, remaining_ms } => {
            let duration = f64::from((*remaining_ms).max(0)) / 1000.;
            state
                .aura_deadlines
                .insert(*slot, (now + duration, duration));
        }
        _ => {}
    }
    if let (Some(fields), Some(player)) = (&state.fields, &mut local.player) {
        let rows: HashMap<_, _> = fields.raw_fields().collect();
        let get = |index| rows.get(&index).copied().unwrap_or(0);
        player.health = get(22);
        player.max_health = get(28);
        player.level = get(34);
        player.power_type = (get(36) >> 24) as u8;
        player.power = get(23 + u16::from(player.power_type));
        player.max_power = get(29 + u16::from(player.power_type));
        player.xp = get(716);
        player.xp_max = get(717);
        player.gold = get(1176);
    }
}

fn bootstrap(
    mut state: ResMut<CoopGame>,
    mut runtime: ResMut<CoopRuntime>,
    mut run: ResMut<RunSession>,
    mut menu: ResMut<MenuState>,
    entry: Res<EntryCatalog>,
    catalog: Res<MenuCatalog>,
    armory: Res<crate::armory::ArmoryCatalog>,
    bridge: Res<client::BridgeCatalog>,
    mut seeds: ResMut<crate::run_seed::RunSeeds>,
    mut world: ResMut<ZoneWorld>,
    mut local: ResMut<LocalClientSession>,
    mut spawn: ResMut<LocalPlayerSpawn>,
    mut loading: ResMut<benilla_app::local_client::LocalLoadingScreen>,
    time: Res<Time>,
    real_time: Res<Time<Real>>,
    (locale, mut presentation, mut terminal, stock, mut equipment, mut equipment_metadata, mut wire): (
        Res<crate::localization::Localization>,
        ResMut<LocalPresentationEvents>,
        ResMut<terminal::TerminalState>,
        Option<Res<benilla_app::local_client::LocalStockFrontend>>,
        ResMut<benilla_app::local_client::LocalPlayerEquipment>,
        ResMut<benilla_app::local_client::LocalPlayerEquipmentMetadata>,
        ResMut<LocalWireEvents>,
    ),
) {
    if let Some(since) = run.coop_start_wait_since {
        // The host driver releases the start restriction after the assigned
        // clients finish initial-world sync or 60 seconds elapse.
        let waiting = real_time.elapsed_secs_f64() - since < 60.0
            && runtime.driver.as_ref().is_some_and(|driver| {
                driver.is_hosting() && driver.server.clients().iter().any(|client| {
                    client.world_hero.is_some() && !client.synchronized
                })
            });
        if !waiting {
            run.coop_start_wait_since = None;
        }
    }
    let Some(profile) = state.local.clone() else {
        return;
    };
    let Some(creation) = &bridge.creation else {
        return;
    };
    if runtime.is_guest() {
        let Some(zone) = state.zone.clone() else {
            return;
        };
        // The current host publishes State15 independently of world Sync6.
        // Initialize rank-dependent entry values before constructing the replica.
        let Some(snapshot) = state.state.as_ref() else { return; };
        let heroic_rank = snapshot.heroic_rank;
        if run
            .mechanics
            .as_ref()
            .is_none_or(|game| game.zone.key != zone)
        {
            let zone_entry = azeroth_survivors_re::coop::bootstrap::zone_environment(&zone);
            let Ok(mut game) = template(
                &profile,
                &zone,
                RunRules { heroic_rank,
                    difficulty: 1.0,
                    density_percent: 100,
                    hp_percent: 100,
                    damage_percent: 100,
                    speed_percent: 100,
                    endless: false,
                },
                None, // Guest affix runtime is passive; effects arrive in host packets.
                &entry,
                &catalog,
                &armory,
                seeds.next(),
                &locale,
            ) else {
                return;
            };
            let mut grants = crate::progression::account_run_grants(&menu.backend_save, profile.class);
            if let Some(entry) = state.entry { grants.veteran_bonus = entry.veteran_bonus; }
            game.set_account_grants(grants);
            state.checkpoints.apply_to_game(&mut game);
            // The host can send State15/Hud10 before MPQ world loading has
            // created the local replica. Consume the accepted cache now too.
            if let Some(value) = state.state.as_ref() {
                game.apply_replica_native(value);
            }
            if let Some(value) = state.hud.as_ref() {
                game.apply_replica_hud(value);
            }
            let Some(display) = creation.body_display(profile.race, profile.sex) else {
                return;
            };
            let hero = appearance(&profile);
            let player = client::player_ui(
                &game,
                &hero,
                &String::from_utf8_lossy(&profile.name),
                display,
                crate::coop_profile::outfit(&profile, &armory),
            );
            let (rows, traits, _) =
                client::outfit(&menu.backend_save, profile.race, profile.class, &armory);
            equipment.rows = rows;
            equipment_metadata.rows = traits;
            local.begin(player);
            run.identity = run.identity.wrapping_add(1);
            run.name = String::from_utf8_lossy(&profile.name).into_owned();
            run.entry_hero = Some(hero);
            let projection = state.state.as_ref().map(RunProjection::read);
            run.started = projection
                .as_ref()
                .is_some_and(|value| value.phase != RunPhase::Ready);
            run.paused = projection
                .as_ref()
                .is_some_and(|value| value.phase == RunPhase::Paused);
            run.error = None;
            run.ended_by_player = false;
            run.selected_roster_guid = state.entry.and_then(|entry| entry.roster_guid);
            run.starting_gear = profile.words_188;
            run.starting_stars = profile.equipment_stars;
            run.starting_weapon_glow = profile.weapon_glow;
            run.showcase = false;
            run.last_position = None;
            run.zone_name = catalog
                .zones
                .iter()
                .find(|row| row.key == zone)
                .map_or_else(|| zone.clone(), |row| row.name.clone());
            terminal.begin(crate::armory::GearSave::read(&menu.backend_save).owned);
            game.set_duplicate_marks(state.duplicate_marks.clone());
            game.events.extend(std::mem::take(&mut state.pending_events));
            run.mechanics = Some(game);
            run.accepted_position = Some(zone_entry.position);
            world.request = Some(ZoneWorldRequest {
                identity: run.identity,
                map_id: zone_entry.map_id,
                spawn_wow: zone_entry.position,
                spawn_facing: zone_entry.facing,
                camera_offset: entry.player.camera_offset,
                camera_target_height: entry.player.camera_target_height,
            });
            world.ready = false;
            spawn.request = Some(LocalPlayerRequest {
                identity: run.identity,
                map_id: zone_entry.map_id,
                position_wow: zone_entry.position,
                facing: zone_entry.facing,
                run_speed: run.mechanics.as_ref().unwrap().player_run_speed(),
                camera_distance: Vec3::from_array(entry.player.camera_offset).length(),
                camera_pitch: None,
            });
            loading.begin(zone_entry.map_id);
            menu.in_run = true;
            menu.entering = false;
            menu.mark_dirty();
        }
        if !state.sync_sent && local.active {
            state.sync_sent =
                runtime.send(None, NativeMessage::Lifecycle(LifecyclePacket::Synchronize));
        }
        if let Some(game) = run.mechanics.as_mut() {
            game.set_guest_notice_ready(state.sync_sent && local.active);
        }
        loading.set_ready(world.ready);
        return;
    }
    let identity = run.identity;
    let Some(game) = run.mechanics.as_mut() else {
        return;
    };
    game.player_guid = profile.guid;
    game.set_equipment_ids(profile.words_188);
    game.set_party_local_name(String::from_utf8_lossy(&profile.name).into_owned());
    if state.host_identity != Some(identity) {
        for client in state.admitted.keys().copied().collect::<Vec<_>>() {
            runtime.send(Some(client), NativeMessage::End);
            if let Some(driver) = runtime.driver.as_mut() {
                driver.server.world_hero_removed(client);
            }
        }
        if state.host_identity.is_some() {
            state.profiles.clear();
            state.hero_updates.clear();
        }
        state.admitted.clear();
        state.world_profiles.clear();
        state.inventory.clear();
        state.motion.clear();
        state.sent_players.clear();
        state.sent_actions.clear();
        state.addon_publishers.clear();
        state.sent_seen.clear();
        state.sent_state.clear();
        state.state_sent_at.clear();
        state.units.clear();
        state.choice_generations.clear();
        runtime.actor_clients.clear();
        game.configure_party_options(profile.bytes_1d8);
        state.host_identity = Some(identity);
    }
    if !world.ready {
        return;
    }
    let zone = azeroth_survivors_re::coop::bootstrap::zone_environment(game.zone.key);
    let ordered = runtime
        .driver
        .as_ref()
        .map(|driver| {
            driver
                .server
                .clients()
                .iter()
                .filter(|row| row.joined && row.closing_since.is_none())
                .map(|row| row.id)
                .collect::<Vec<_>>()
        })
        .unwrap_or_default();
    let mut inserted = Vec::new();
    for client in ordered {
        if state.admitted.contains_key(&client) {
            continue;
        }
        let Some(hero) = state.profiles.get(&client).cloned() else {
            continue;
        };
        let zone_index = azeroth_survivors_re::guardians::catalog::ZONES
            .iter().position(|row| row.key == game.zone.key).unwrap_or(0);
        let host_pick = menu.backend_pick();
        let admission_rank = host_pick.heroic_rank.min(
            menu.backend_save.max_heroic_rank(host_pick.hero.class, game.zone.key));
        if !hero.permits_zone(zone_index, admission_rank) {
            runtime.send(Some(client), NativeMessage::Lifecycle(LifecyclePacket::Denied(
                NativeHero::locked_reason(game.zone.key, admission_rank))));
            if let Some(driver) = runtime.driver.as_mut() {
                driver.server.begin_closing(client, time.elapsed_secs_f64());
            }
            state.retire_hero_profile(client);
            continue;
        }
        let Ok(remote) = template(
            &hero,
            game.zone.key,
            game.rules,
            Some(menu.heroic_week),
            &entry,
            &catalog,
            &armory,
            seeds.next(),
            &locale,
        ) else {
            continue;
        };
        let slot = game.next_party_slot();
        if game
            .admit_party_hero(
                slot,
                hero.guid,
                String::from_utf8_lossy(&hero.name).into_owned(),
                remote,
                Position::from(zone.position),
                zone.facing,
            )
            .is_ok()
        {
            inserted.push((client, hero));
        }
    }
    let initial_world = state.initial_list_identity != Some(identity);
    if initial_world {
        party_frames::initial(&runtime, game, &mut wire);
        state.initial_list_identity = Some(identity);
    }
    for (client, hero) in inserted {
        // Rows were prevalidated without yielding. Resolve the stable GUID
        // again so even a defensive rollback cannot stale a later actor slot.
        let Some(slot) = game.party_slot(hero.guid) else { continue; };
        if runtime
            .driver
            .as_mut()
            .is_some_and(|driver| driver.server.world_hero_added(client, hero.guid))
        {
            state.admitted.insert(client, hero.guid);
            state.world_profiles.insert(hero.guid, hero.clone());
            runtime.actor_clients.insert(slot, client);
            runtime.send(Some(client), NativeMessage::ZoneKey(game.zone.key.into()));
            if let Some(display) = creation.body_display(hero.race, hero.sex) {
                if let Some((player, speed, fields)) = game.with_party_hero(slot, |game| {
                    let player = client::player_ui(
                        game,
                        &appearance(&hero),
                        &String::from_utf8_lossy(&hero.name),
                        display,
                        crate::coop_profile::outfit(&hero, &armory),
                    );
                    let fields = player_snapshot_fields(game, &player, &hero);
                    (player, game.player_run_speed(), fields)
                }) {
                    for event in [
                        player_create(&player, zone.position, zone.facing, speed, fields),
                        player_name(&hero),
                    ] {
                        if let Ok(Some(packet)) = engine_packets::encode(&event, None) {
                            runtime.route_engine(slot, packet);
                        }
                        presentation.0.push(event);
                    }
                }
            }
        } else {
            game.remove_party_hero(slot);
        }
    }
    if initial_world && !state.admitted.is_empty() {
        run.coop_start_wait_since = Some(real_time.elapsed_secs_f64());
    }
}

fn synchronize(
    client: ClientId,
    state: &mut CoopGame,
    runtime: &mut CoopRuntime,
    run: &mut RunSession,
    bridge: &client::BridgeCatalog,
    armory: &crate::armory::ArmoryCatalog,
    locale: &crate::localization::Localization,
    board: &client::raid_targets::RaidTargets,
    units: &Query<(
        &LocalUnitVisual,
        &Transform,
        Option<&benilla_app::local_client::LocalUnitPath>,
    )>,
    local_active: bool,
    presentation: &mut LocalPresentationEvents,
) {
    //145c2eaa7 rejects a repeat only after earlier application edges have run.
    if !runtime.driver.as_ref().is_some_and(|driver| {
        driver
            .server
            .clients()
            .iter()
            .any(|row| row.id == client && row.world_hero.is_some() && !row.synchronized)
    }) {
        return;
    }
    let Some(profile) = state.local.clone() else {
        return;
    };
    let Some(creation) = bridge.creation.as_ref() else {
        return;
    };
    let identity = run.identity;
    let Some(game) = run.mechanics.as_mut() else {
        return;
    };
    let zone = azeroth_survivors_re::coop::bootstrap::zone_environment(game.zone.key);
    let result = (|| -> Result<Vec<EnginePacket>, String> {
        let guid = *state
            .admitted
            .get(&client)
            .ok_or("hero admission pending")?;
        let slot = game.party_slot(guid).ok_or("world hero missing")?;
        let hero = state
            .profiles
            .get(&client)
            .ok_or("profile missing")?
            .clone();
        let display = creation
            .body_display(hero.race, hero.sex)
            .ok_or("MPQ body unavailable")?;
        let (player, speed, known, learned, attack, inventory, fields) = game
            .with_party_hero(slot, |game| {
                let player = client::player_ui(
                    game,
                    &appearance(&hero),
                    &String::from_utf8_lossy(&hero.name),
                    display,
                    crate::coop_profile::outfit(&hero, &armory),
                );
                let attack = game
                    .racial
                    .as_ref()
                    .map_or(0, |racial| racial.definition.spell_id);
                let known =
                    azeroth_survivors_re::coop::bootstrap::class_spellbook(hero.class, attack)
                        .unwrap_or_default();
                let learned = game
                    .abilities
                    .iter()
                    .map(|row| row.definition.spell_id)
                    .collect::<Vec<_>>();
                let inventory = state
                    .inventory
                    .entry(client)
                    .or_default()
                    .publish(identity, &hero, game, &armory, &locale);
                let fields = player_snapshot_fields(game, &player, &hero);
                (
                    player,
                    game.player_run_speed(),
                    known,
                    learned,
                    attack,
                    inventory,
                    fields,
                )
            })
            .ok_or("world hero missing")?;
        let pose = game.party_pose(slot).ok_or("world hero pose missing")?;
        let mut own_event = player_create(
            &player,
            [pose.position.x, pose.position.y, pose.position.z],
            pose.facing,
            speed,
            fields,
        );
        if let SessionEvent::ObjectCreate { fields, .. } = &mut own_event {
            for event in &inventory {
                if let SessionEvent::ObjectValues {
                    guid: owner,
                    fields: slots,
                } = event
                {
                    if *owner == guid {
                        fields.merge(slots.clone());
                    }
                }
            }
        }
        let own = engine_packets::encode(&own_event, Some(guid))
            .map_err(|error| format!("self packet: {error:?}"))?
            .ok_or("missing self packet")?;
        let mut packets = azeroth_survivors_re::coop::bootstrap::InitialWorld {
            map_id: zone.map_id,
            zone_id: zone.zone_id,
            position: zone.position,
            facing: zone.facing,
            zone_hour: zone.hour,
            weather_kind: zone.weather_kind,
            weather_intensity: zone.weather_intensity,
            known_spells: known,
            inventory_object: None,
            self_object: own,
            hero_name: azeroth_survivors_re::coop::bootstrap::name_response(
                hero.guid, &hero.name, hero.race, hero.sex, hero.class,
            ),
        }
        .packets();
        // Inventory precedes self creation in the native snapshot. These private
        // blocks come from the same native equipment/jewelry constructors.
        let insert = packets
            .iter()
            .position(|packet| packet.opcode == 0xa9)
            .unwrap_or(7);
        let inventory = inventory
            .iter()
            .map(|event| engine_packets::encode(event, Some(guid)))
            .collect::<Result<Vec<_>, _>>()
            .map_err(|error| format!("inventory packet: {error:?}"))?;
        packets.splice(insert..insert, inventory.into_iter().flatten());
        for (unit, transform, path) in units {
            if game.party_slot(unit.guid).is_some() {
                continue;
            }
            let event = unit_create(unit, transform, path).ok_or("unknown native object type")?;
            if let Some(packet) = engine_packets::encode(&event, Some(guid))
                .map_err(|error| format!("world packet: {error:?}"))?
            {
                packets.push(packet);
            }
        }
        let mut profiles = vec![(0, profile.clone())];
        for (guid, hero) in &state.world_profiles {
            if let Some(slot) = game.party_slot(*guid) {
                profiles.push((slot, hero.clone()));
            }
        }
        profiles.sort_by_key(|row| row.0);
        for (other, hero) in profiles {
            if other != slot {
                let display = creation
                    .body_display(hero.race, hero.sex)
                    .ok_or("party MPQ body unavailable")?;
                let (player, speed, fields) = game
                    .with_party_hero(other, |game| {
                        let player = client::player_ui(
                            game,
                            &appearance(&hero),
                            &String::from_utf8_lossy(&hero.name),
                            display,
                            crate::coop_profile::outfit(&hero, &armory),
                        );
                        let fields = player_snapshot_fields(game, &player, &hero);
                        (player, game.player_run_speed(), fields)
                    })
                    .ok_or("party hero missing")?;
                let pose = game.party_pose(other).ok_or("party hero pose missing")?;
                for event in [
                    player_create(
                        &player,
                        [pose.position.x, pose.position.y, pose.position.z],
                        pose.facing,
                        speed,
                        fields,
                    ),
                    player_name(&hero),
                ] {
                    if let Some(packet) = engine_packets::encode(&event, Some(guid))
                        .map_err(|error| format!("party packet: {error:?}"))?
                    {
                        packets.push(packet);
                    }
                }
            }
        }
        if let Some(packet) = engine_packets::encode(&board.list(), Some(guid))
            .map_err(|error| format!("raid targets: {error:?}"))?
        {
            packets.push(packet);
        }
        packets.push(azeroth_survivors_re::coop::bootstrap::action_buttons(
            &learned, attack,
        ));
        Ok(packets)
    })();

    match result {
        Ok(packets) => {
            if runtime
                .driver
                .as_mut()
                .is_some_and(|driver| driver.synchronize(client, packets))
            {
                party_frames::fanout(runtime, game, local_active, presentation);
            }
        }
        Err(error) => warn!("Co-op snapshot unavailable: {error}"),
    }
}

fn unit_create(
    unit: &LocalUnitVisual,
    transform: &Transform,
    path: Option<&benilla_app::local_client::LocalUnitPath>,
) -> Option<SessionEvent> {
    let kind = entity_kind(&unit.fields)?;
    Some(SessionEvent::ObjectCreate {
        guid: unit.guid,
        kind,
        display_id: Some(unit.display_id),
        position: benilla_assets::coords::bevy_to_wow(transform.translation),
        orientation: path.map_or_else(
            || transform.rotation.to_euler(EulerRot::YXZ).0,
            |path| path.facing,
        ),
        scale: unit.scale,
        speeds: None,
        mover: None,
        transport_progress: None,
        transport: None,
        spline: None,
        fields: unit.fields.clone(),
    })
}

fn entity_kind(fields: &benilla_protocol::ObjectFields) -> Option<benilla_protocol::EntityKind> {
    use benilla_protocol::EntityKind;
    use benilla_protocol::messages::ObjectType;
    match fields.created_as() {
        Some(ObjectType::GameObject) => Some(EntityKind::GameObject),
        Some(ObjectType::DynamicObject) => Some(EntityKind::DynamicObject),
        Some(ObjectType::Player) => Some(EntityKind::Player),
        Some(ObjectType::Corpse) => Some(EntityKind::Corpse),
        Some(ObjectType::Unit) => Some(EntityKind::Unit),
        _ => {
            match fields
                .raw_fields()
                .find_map(|(field, value)| (field == 2).then_some(value))
            {
                Some(25) => Some(EntityKind::Player),
                Some(9) => Some(EntityKind::Unit),
                Some(33) => Some(EntityKind::GameObject),
                Some(65) => Some(EntityKind::DynamicObject),
                Some(129) => Some(EntityKind::Corpse),
                _ => None,
            }
        }
    }
}

fn player_create(
    player: &LocalPlayerUi,
    position: [f32; 3],
    orientation: f32,
    run_speed: f32,
    fields: benilla_protocol::ObjectFields,
) -> SessionEvent {
    SessionEvent::ObjectCreate {
        guid: player.guid,
        kind: benilla_protocol::EntityKind::Player,
        display_id: Some(player.display_id),
        position,
        orientation,
        scale: player.scale,
        speeds: Some(benilla_protocol::MoveSpeeds {
            walk: 2.5,
            run: run_speed,
            run_back: 4.5,
            swim: f32::from_bits(0x40971c71),
            swim_back: 2.5,
            turn_rate: f32::from_bits(0x40490fdb),
        }),
        mover: None,
        transport_progress: None,
        transport: None,
        spline: None,
        fields: fields.into_created(benilla_protocol::messages::ObjectType::Player),
    }
}
fn player_name(hero: &NativeHero) -> SessionEvent {
    SessionEvent::PlayerName {
        guid: hero.guid,
        name: String::from_utf8_lossy(&hero.name).into_owned(),
        race: u32::from(hero.race),
        gender: u32::from(hero.sex),
        class: u32::from(hero.class),
    }
}

fn player_snapshot_fields(
    game: &Mechanics,
    player: &LocalPlayerUi,
    hero: &NativeHero,
) -> benilla_protocol::ObjectFields {
    let mut fields = local_player_fields(player);
    let enchants = (15..=17usize).map(|slot| {
        let displayed = player.appearance.equipment.iter()
            .find(|(index, _)| usize::from(*index) == slot + 1).map_or(0, |(_, id)| *id);
        let enchant = crate::armory::cosmetics::weapon_glow(
            hero.weapon_glow, slot as u8, displayed, hero.equipment_stars[slot]);
        (benilla_protocol::field::FIELD_PLAYER_VISIBLE_ITEM_1_CREATOR + 3 + 12 * slot as u16, enchant)
    }).collect::<Vec<_>>();
    fields.merge(benilla_protocol::ObjectFields::from_pairs(&enchants));
    let mut auras = azeroth_survivors_re::run_effects::player_auras::PlayerAuraState::default();
    fields.merge(benilla_protocol::ObjectFields::from_pairs(
        &auras.publish_slots(*game.player_auras()),
    ));
    fields.merge(benilla_protocol::ObjectFields::from_pairs(&[(
        131,
        game.player_form_display().unwrap_or(player.display_id),
    )]));
    fields
}

fn settings(
    mut state: ResMut<CoopGame>,
    mut runtime: ResMut<CoopRuntime>,
    mut run: ResMut<RunSession>,
    hud: Res<run_hud::HudSettings>,
) {
    let key = (run.identity, hud.shown("flag"));
    if state.tracking_sent == Some(key) {
        return;
    }
    if runtime.is_guest() {
        if state.sync_sent
            && runtime.send(
                None,
                NativeMessage::Control {
                    kind: 9,
                    argument: u8::from(key.1),
                    offer: 0,
                },
            )
        {
            state.tracking_sent = Some(key);
        }
    } else if let Some(game) = run.mechanics.as_mut().filter(|game| game.has_party()) {
        game.party_control(0, 9, u8::from(key.1), 0, |_| None);
        state.tracking_sent = Some(key);
    }
}

#[cfg(test)]
mod guest_engine_tests {
    use super::*;

    fn elwynn_admission(now: f64) -> HeroAdmission {
        HeroAdmission {
            host_guid: 77,
            now,
            run_under_way: false,
            zone_key: "elwynn",
            zone_index: 0,
            heroic_rank: 0,
        }
    }

    #[test]
    fn guest_hero_updates_replace_the_pending_record_and_drain_at_the_boundary() {
        let menu = MenuState::from_save_path(None);
        let client = ClientId(7);
        let profile = crate::coop_profile::build(
            &menu.backend_save, menu.backend_pick(), 0x800021, "en", [0; 3], None,
        );
        let hero = |name: &[u8]| Box::new(NativeHero { name: name.to_vec(), ..profile.clone() });
        let mut state = CoopGame::default();
        assert!(state.receive_hero(client, hero(b"First"), elwynn_admission(0.)).is_none());
        assert!(state.receive_hero(client, hero(b"Second"), elwynn_admission(0.02)).is_none());
        assert!(state.receive_hero(client, hero(b"Third"), elwynn_admission(0.05)).is_none());
        assert!(state.drain_hero_update(client, elwynn_admission(0.099)).is_none());
        assert_eq!(state.profiles[&client].name.as_slice(), b"First");
        assert!(state.drain_hero_update(client, elwynn_admission(0.1)).is_none());
        assert_eq!(state.profiles[&client].name.as_slice(), b"Third");
        assert!(state.hero_updates[&client].pending.is_none());
    }

    #[test]
    fn immediate_guest_hero_update_retains_pending_until_next_interval_or_retirement() {
        let menu = MenuState::from_save_path(None);
        let client = ClientId(8);
        let profile = crate::coop_profile::build(
            &menu.backend_save, menu.backend_pick(), 0x800022, "en", [0; 3], None,
        );
        let hero = |name: &[u8]| Box::new(NativeHero { name: name.to_vec(), ..profile.clone() });
        let mut state = CoopGame::default();
        assert!(state.receive_hero(client, hero(b"First"), elwynn_admission(0.)).is_none());
        assert!(state.receive_hero(client, hero(b"Pending"), elwynn_admission(0.05)).is_none());
        assert!(state.receive_hero(client, hero(b"Immediate"), elwynn_admission(0.1)).is_none());
        assert!(state.drain_hero_update(client, elwynn_admission(0.1)).is_none());
        assert_eq!(state.profiles[&client].name.as_slice(), b"Immediate");
        assert!(state.drain_hero_update(client, elwynn_admission(0.2)).is_none());
        assert_eq!(state.profiles[&client].name.as_slice(), b"Pending");
        assert!(state.receive_hero(client, hero(b"Discarded"), elwynn_admission(0.25)).is_none());
        assert!(state.receive_hero(client, hero(b"Under way"), HeroAdmission {
            run_under_way: true, ..elwynn_admission(0.35)
        }).is_none());
        assert_eq!(state.profiles[&client].name.as_slice(), b"Pending");
        state.admitted.insert(client, 34);
        assert!(state.receive_hero(client, hero(b"Assigned"), elwynn_admission(0.5)).is_none());
        assert_eq!(state.profiles[&client].name.as_slice(), b"Pending");
        state.retire_hero_profile(client);
        assert!(state.drain_hero_update(client, elwynn_admission(1.)).is_none());
        assert!(!state.profiles.contains_key(&client));
        assert!(!state.hero_updates.contains_key(&client));
    }

    #[test]
    fn first_guest_profile_checks_zone_and_rank_before_the_common_storage_guards() {
        let menu = MenuState::from_save_path(None);
        let client = ClientId(7);
        let mut profile = crate::coop_profile::build(
            &menu.backend_save, menu.backend_pick(), 0x800021, "en", [0; 3], None,
        );
        profile.byte_1e3 = 1;
        profile.heroic_unlocks = vec![0];
        let mut state = CoopGame::default();
        let locked = HeroAdmission { heroic_rank: 1, ..elwynn_admission(0.) };
        let duplicate = HeroAdmission { host_guid: profile.guid, ..locked };
        assert_eq!(
            state.receive_hero(client, Box::new(profile.clone()), duplicate).as_deref(),
            Some(b"locked:elwynn:1".as_slice()),
        );
        let ongoing = HeroAdmission { run_under_way: true, ..elwynn_admission(0.2) };
        assert!(state.receive_hero(client, Box::new(profile.clone()), ongoing).is_none());
        assert!(!state.profiles.contains_key(&client));
        assert!(state.receive_hero(client, Box::new(profile.clone()), elwynn_admission(0.4)).is_none());
        profile.name = b"Refresh".to_vec();
        assert!(state.receive_hero(client, Box::new(profile), HeroAdmission { now: 0.6, ..locked }).is_none());
        assert_eq!(state.profiles[&client].name.as_slice(), b"Refresh");
    }

    #[test]
    fn local_kick_resolves_the_admitted_guid_instead_of_client_or_service_numbers() {
        use azeroth_survivors_re::coop::{session::Session, server_party::{HostConfig, JoinRequest}};
        let mut runtime = CoopRuntime { driver: Some(Session::service_host(
            HostConfig { password: Vec::new(), capacity: 5 })), ..default() };
        let client = runtime.driver.as_mut().unwrap().service_peer_open(73).unwrap();
        assert!(runtime.driver.as_mut().unwrap().server.admit(client,
            &JoinRequest::current(Vec::new()), 0.).unwrap().is_ok());
        let menu = MenuState::from_save_path(None);
        let guid = 0x1234_5678_9abc_def0;
        let hero = crate::coop_profile::build(&menu.backend_save, menu.backend_pick(), guid,
            "en", [0; 3], None);
        let mut state = CoopGame::default();
        state.profiles.insert(client, hero);
        assert!(!state.kick_member(&mut runtime, 73, 1.));
        assert!(!state.kick_member(&mut runtime, client.0, 1.));
        // There is deliberately no run/active-game argument in this contract.
        assert!(state.kick_member(&mut runtime, guid, 1.));
        assert!(runtime.driver.as_ref().unwrap().server.clients().is_empty());
        assert!(!state.kick_member(&mut runtime, guid, 1.));
    }

    #[test]
    fn guest_delivery_requires_sync_and_an_active_port_and_resets_on_leave() {
        let mut state = CoopGame::default();
        assert!(state.guest_engine_packet(0x58, vec![7], true).is_none());
        state.sync_sent = true;
        assert!(state.guest_engine_packet(0x58, vec![7], false).is_none());
        let packet = state.guest_engine_packet(0x58, vec![7, 0, 255], true).unwrap();
        assert_eq!(packet.opcode, 0x58);
        assert_eq!(packet.payload, [7, 0, 255]);
        assert!(state.guest_engine_packet(0x3d, vec![7], true).is_none());
        assert!(state.guest_engine_packet(0x58, vec![0; 0xfffe], true).is_none());
        state.leave();
        assert!(state.guest_engine_packet(0x58, vec![7], true).is_none());
    }

    #[test]
    fn guest_delivery_transforms_name_and_chat_before_both_consumers() {
        let mut state = CoopGame::default();
        state.sync_sent = true;
        let mut name = 123u64.to_le_bytes().to_vec();
        name.extend_from_slice(b"A|lice\0suffix|bytes");
        let packet = state.guest_engine_packet(0x51, name, true).unwrap();
        assert_eq!(&packet.payload[..8], &123u64.to_le_bytes());
        assert_eq!(&packet.payload[8..], b"Alice\0suffix|bytes");

        let mut chat = vec![0; 25];
        chat[21..25].copy_from_slice(&4u32.to_le_bytes());
        chat.extend_from_slice(b"a|b\0\x07");
        assert!(state.guest_engine_packet(0x96, chat.clone(), false).is_none());
        let packet = state.guest_engine_packet(0x96, chat, true).unwrap();
        assert_eq!(&packet.payload[21..25], &5u32.to_le_bytes());
        assert_eq!(&packet.payload[25..], b"a||b\0\x07");
    }
}

#[cfg(test)]
mod guest_equipment_tests {
    use super::*;

    fn grants(ids: &[u32]) -> Vec<EquipmentGrant> {
        ids.iter().map(|id| EquipmentGrant { item_id: *id, ..Default::default() }).collect()
    }

    fn captured_entry(roster_guid: Option<u64>) -> CoopGame {
        CoopGame { entry: Some(guest_settlement::Entry { roster_guid, veteran_bonus: 0. }),
            ..Default::default() }
    }

    fn fixture_game() -> Mechanics {
        let entry: EntryCatalog = serde_json::from_str(include_str!("../../assets/run-entry-0.100.1.json"))
            .unwrap();
        let catalog = MenuCatalog::embedded();
        let hero = crate::save::Hero { class: 1, race: 1, sex: 0, features: [0; 5] };
        Mechanics::new("elwynn", "warrior", RunRules { heroic_rank: 0,
            difficulty: 1., density_percent: 100, hp_percent: 100,
            damage_percent: 100, speed_percent: 100, endless: false,
        }, entry_player_stats(&catalog.classes[0], &hero, &entry), [1, 2, 3, 4]).unwrap()
    }

    #[test]
    fn queued_denial_clears_only_the_guest_cache_after_the_driver_is_off() {
        use azeroth_survivors_re::coop::{session::{Session, RelayProtocol, SharedGuestFlags},
            server_party::JoinAccepted, replication::encode_batch};
        let flags = SharedGuestFlags::default();
        flags.lock().unwrap().active = true;
        let mut driver = Session::service_join_with_flags(Vec::new(), RelayProtocol::default(), flags);
        let reason = b"  the host sent you away  ".to_vec();
        let batch = encode_batch(&[
            NativeMessage::Lifecycle(LifecyclePacket::Accepted(JoinAccepted { slot: 1, capacity: 2 })),
            NativeMessage::Lifecycle(LifecyclePacket::Denied(reason.clone())),
        ]).unwrap().unwrap();
        let mut frame = vec![0];
        frame.extend_from_slice(&1u64.to_le_bytes());
        frame.extend(batch);
        assert!(driver.service_receive(0, frame));
        driver.tick(1.);
        let mut runtime = CoopRuntime { driver: Some(driver), world_guid: Some(42), ..default() };
        assert!(!runtime.is_guest(), "the network role is already Off");
        let run = RunSession { mechanics: Some(fixture_game()), started: true, paused: true,
            ..default() };
        let before_game = run.mechanics.as_ref().unwrap().native_state();
        let mut menu = MenuState::from_save_path(None);
        menu.in_run = true;
        menu.dialog = Some(crate::menu_state::Dialog::Coop);
        let before_save = menu.backend_save.plaintext();
        let before_revision = menu.save_revision;
        let local = LocalClientSession { active: true, ..default() };
        let mut state = captured_entry(Some(42));
        state.zone = Some("elwynn".into());
        state.state = Some(before_game.clone());
        state.sync_sent = true;
        state.hud = Some(serde_json::json!({"kept": true}));
        state.cooldowns.insert(7, (1., 2.));
        state.pending_events.push(RunEvent::EquipmentLoot { id: 101000, is_new: true });
        assert!(!state.receive_denied(Some(ClientId(9))), "a host peer cannot clear the upstream cache");
        assert!(state.zone.is_some());
        for incoming in runtime.driver.as_mut().unwrap().take_messages() {
            if matches!(incoming.message, NativeMessage::Lifecycle(LifecyclePacket::Denied(_))) {
                assert!(state.receive_denied(incoming.client));
            }
        }
        assert!(state.zone.is_none() && state.state.is_none() && state.entry.is_none());
        assert!(!state.sync_sent && state.hud.is_none() && state.cooldowns.is_empty());
        assert!(state.pending_events.is_empty());
        assert_eq!(runtime.driver.as_ref().unwrap().denial.as_ref(), Some(&reason));
        assert_eq!(menu.backend_save.plaintext(), before_save);
        assert_eq!(menu.save_revision, before_revision);
        assert!(menu.in_run && matches!(menu.dialog, Some(crate::menu_state::Dialog::Coop)));
        assert!(run.started && run.paused && local.active);
        assert_eq!(run.mechanics.as_ref().unwrap().native_state(), before_game);
    }

    fn notices(events: &[RunEvent]) -> Vec<(u32, bool)> {
        events.iter().filter_map(|event| match event {
            RunEvent::EquipmentLoot { id, is_new } => Some((*id, *is_new)),
            _ => None,
        }).collect()
    }

    #[test]
    fn pre_world_duplicates_survive_spending_and_feed_cached_and_live_mark_feats() {
        let mut value = fixture_game().native_state();
        value.byte_8f = 1;
        value.float_84_bits = 97.0_f32.to_bits();
        value.float_88_bits = 45.0_f32.to_bits();
        let mut state = captured_entry(Some(42));
        state.zone = Some("elwynn".into());
        state.state = Some(value.clone());
        let mut run = RunSession::default();
        let mut menu = MenuState::from_save_path(None);
        menu.backend_save.add_equipment(&[101000, 101040]);
        menu.backend_save.record_heroic_victory(1, "elwynn", 1).unwrap();
        let grant = EquipmentGrant { item_id: 101040, boss_key: 7,
            boss_marks_bits: 45.0_f32.to_bits() };
        state.receive_equipment_grants(&mut run, &mut menu, &[grant], 0);
        assert!(run.mechanics.is_none());
        assert_eq!(menu.backend_save.class_marks(1), 8.0);
        menu.backend_save.upgrade_star(101000).unwrap();
        assert!(menu.backend_save.class_marks(1) < 8.0);
        let cached = guest_settlement::Snapshot::from_cached(&value,
            state.entry.unwrap(), &state.checkpoints).with_duplicate_marks(&state.duplicate_marks);
        cached.account(&mut menu, Some(42), 0);
        let earned = menu.backend_save.earned_achievements();
        assert!(earned.contains("feat:marks100"));
        assert!(earned.contains("feat:bossmarks50"));
        let mut game = fixture_game();
        game.apply_replica_native(&value);
        game.set_duplicate_marks(state.duplicate_marks.clone());
        let live = game.feat_snapshot([0; 19]);
        assert_eq!(live.run_marks, 105.0);
        assert_eq!(live.max_boss_marks, 53.0);
        assert_eq!(game.native_state().float_84_bits, value.float_84_bits,
            "recipient duplicate credit must not be republished as base currency");
    }

    #[test]
    fn guest_equipment_notices_keep_owned_and_duplicate_order_across_batches() {
        let mut state = captured_entry(Some(1));
        let mut run = RunSession { mechanics: Some(fixture_game()), ..Default::default() };
        let mut menu = MenuState::from_save_path(None);
        menu.backend_save.add_equipment(&[101000]);
        let revision = menu.save_revision;
        assert_eq!(menu.selected_roster_guid(), None, "entry identity owns retention");
        state.receive_equipment_grants(&mut run, &mut menu, &grants(&[101000, 101010, 101010]), 0);
        state.receive_equipment_grants(&mut run, &mut menu, &grants(&[101020, 101010]), 0);
        assert_eq!(notices(&run.mechanics.as_ref().unwrap().events),
            [(101000, false), (101010, true), (101010, false), (101020, true), (101010, false)]);
        assert!(state.pending_events.is_empty());
        assert_eq!(menu.save_revision, revision.wrapping_add(2));
        let restored = crate::save::Save::parse(&menu.backend_save.plaintext()).unwrap();
        assert!(crate::armory::GearSave::read(&restored).owned.is_superset(
            &[101000, 101010, 101020].into_iter().collect()));
    }

    #[test]
    fn guest_equipment_before_bootstrap_stays_pending_and_leave_discards_it() {
        let mut state = captured_entry(Some(1));
        let mut run = RunSession::default();
        let mut menu = MenuState::from_save_path(None);
        state.receive_equipment_grants(&mut run, &mut menu, &grants(&[101000, 101000]), 0);
        assert!(run.mechanics.is_none());
        assert_eq!(notices(&state.pending_events), [(101000, true), (101000, false)]);
        state.leave();
        assert!(state.pending_events.is_empty());
        run.mechanics = Some(fixture_game());
        state.receive_equipment_grants(&mut run, &mut menu, &grants(&[101000]), 0);
        assert_eq!(notices(&run.mechanics.as_ref().unwrap().events), [(101000, false)]);
    }

    #[test]
    fn tester_guest_keeps_notices_without_retaining_new_equipment() {
        let mut state = captured_entry(Some(crate::startup::TESTER_GUID));
        let mut run = RunSession { mechanics: Some(fixture_game()), ..Default::default() };
        let mut menu = MenuState::from_save_path(None);
        menu.backend_save.add_equipment(&[101000]);
        let before = menu.backend_save.plaintext();
        let revision = menu.save_revision;
        state.receive_equipment_grants(&mut run, &mut menu, &grants(&[101000, 101010, 101010]), 0);
        state.receive_equipment_grants(&mut run, &mut menu, &grants(&[101010]), 0);
        assert_eq!(notices(&run.mechanics.as_ref().unwrap().events),
            [(101000, false), (101010, true), (101010, true), (101010, true)]);
        assert_eq!(menu.backend_save.plaintext(), before);
        assert_eq!(menu.save_revision, revision);
    }

    #[test]
    fn retained_guest_duplicates_convert_to_marks_and_commit() {
        // Native GUID zero is eligible; only the exact Tester sentinel is refused.
        let mut state = captured_entry(Some(0));
        let mut run = RunSession::default();
        let mut menu = MenuState::from_save_path(None);
        menu.backend_save.add_equipment(&[101000]);
        let before = menu.backend_save.plaintext();
        let revision = menu.save_revision;
        state.receive_equipment_grants(&mut run, &mut menu, &grants(&[101000, 101000]), 0);
        assert_ne!(menu.backend_save.plaintext(), before);
        assert_eq!(menu.backend_save.class_marks_tenths(1), 10);
        assert_eq!(menu.save_revision, revision.wrapping_add(1));
        state.receive_equipment_grants(&mut run, &mut menu, &grants(&[101010, 101010]), 0);
        assert_eq!(menu.backend_save.class_marks_tenths(1), 20);
        assert_eq!(menu.save_revision, revision.wrapping_add(2));
        assert_eq!(notices(&state.pending_events),
            [(101000, false), (101000, false), (101010, true), (101010, false)]);
    }

    #[test]
    fn guest_equipment_without_captured_account_identity_does_not_invent_one() {
        let mut state = captured_entry(None);
        let mut run = RunSession::default();
        let mut menu = MenuState::from_save_path(None);
        let before = menu.backend_save.plaintext();
        let revision = menu.save_revision;
        state.receive_equipment_grants(&mut run, &mut menu, &grants(&[101000, 101000]), 0);
        assert_eq!(notices(&state.pending_events), [(101000, true), (101000, true)]);
        assert_eq!(menu.backend_save.plaintext(), before);
        assert_eq!(menu.save_revision, revision);
    }

    #[test]
    fn empty_guest_equipment_batch_does_not_queue_a_notice_or_save() {
        let mut state = CoopGame::default();
        let mut run = RunSession::default();
        let mut menu = MenuState::from_save_path(None);
        let revision = menu.save_revision;
        state.receive_equipment_grants(&mut run, &mut menu, &grants(&[]), 0);
        assert_eq!(menu.save_revision, revision);
        assert!(state.pending_events.is_empty());
    }
    #[test]
    fn accepted_won_choice_cache_saves_before_terminal_in_live_and_pre_world_guests() {
        for live in [false, true] {
            let mut game = fixture_game();
            let mut value = game.native_state();
            value.byte_8f = 2;
            value.flag_8c = false;
            value.flag_8d = true;
            value.heroic_rank = 1;
            game.apply_replica_native(&value);
            let mut state = captured_entry(Some(42));
            state.zone = Some("elwynn".into());
            state.state = Some(value);
            state.sync_sent = true;
            let mut run = RunSession { mechanics: live.then_some(game), started: true,
                showcase: true, ..Default::default() };
            let mut menu = MenuState::from_save_path(None);
            menu.backend_save.record_beaten_zone(1, "elwynn").unwrap();
            state.receive_victory(&mut run, &mut menu);
            assert_eq!(menu.backend_save.heroic_cleared_rank(1, "elwynn"), 1);
            assert_eq!(menu.account_snapshots().len(), 1);
            let events = run.mechanics.as_ref().map_or(state.pending_events.as_slice(), |game| game.events.as_slice());
            assert_eq!(events.iter().filter(|event| matches!(event, RunEvent::HeroicProgress { rank: 1, .. })).count(), 1);
            state.receive_victory(&mut run, &mut menu);
            assert_eq!(menu.account_snapshots().len(), 1);
            assert_eq!(state.checkpoints.xp_parts, [0; 7]);
            assert_eq!(state.checkpoints.counts, [0; 5]);
            assert!(!state.checkpoints.result_saved);
            assert_eq!(state.checkpoints.last_terminal_phase, 0xff);
            assert!(menu.backend_save.statistics().is_empty());
            assert_eq!(menu.backend_save.talent_xp(1), 0);
        }
    }

}
