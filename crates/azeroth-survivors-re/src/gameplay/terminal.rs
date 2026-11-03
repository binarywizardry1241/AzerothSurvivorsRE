//! Terminal state and ordered command admission, revalidated against 0.109.0. Account delivery and presentation
//! retain separate lifetimes: saving a result must not dismiss its summary.

use bevy::prelude::*;
use std::collections::{BTreeSet, VecDeque};

use super::{RunSession, mechanics::Mechanics, run_hud::Pause, world::ZoneWorld};
use crate::{armory::ArmoryCatalog, assets::MenuArt, catalog::MenuCatalog, menu_state::MenuState};

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(super) enum Outcome {
    Victory,
    Defeat,
    Left,
}

#[derive(Component, Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum TerminalAction {
    Again,
    Endless,
    Menu,
}

#[derive(Clone, Debug)]
pub(super) struct TalentSummary {
    pub gained: u32,
    pub total: u32,
    pub before: Option<u32>,
    pub class_name: String,
    pub parts: Vec<(String, i64)>,
}

#[derive(Clone, Debug)]
pub(super) struct TerminalLoot {
    pub name: String,
    pub icon: Option<Handle<Image>>,
    pub rarity: usize,
    pub is_new: bool,
}

#[derive(Clone, Debug)]
pub(super) struct TerminalSummary {
    pub outcome: Outcome,
    pub hero: String,
    pub race_name: String,
    pub class_name: String,
    pub zone_name: String,
    pub time_seconds: f64,
    pub level: u32,
    pub kills: u32,
    pub elites: u32,
    pub guardians: u32,
    pub bosses: u32,
    pub damage: f64,
    pub taken: f64,
    pub gold: u32,
    pub chests: u32,
    pub unlocked_zone: Option<String>,
    pub talent: Option<TalentSummary>,
    pub loot: Vec<TerminalLoot>,
    pub recap: Option<super::death_recap::DeathRecap>,
    pub return_to_main_menu: bool,
}

#[derive(Resource, Default)]
pub(super) struct TerminalState {
    pub summary: Option<TerminalSummary>,
    pub identity: u64,
    talent_context: crate::talent_context::Context,
    talent_requests: VecDeque<serde_json::Value>,
    owned_before: BTreeSet<u32>,
    /// Current input sends every admitted pressed row in query order. Keep the
    /// remainder while the source adapter constructs an Again replacement.
    actions: VecDeque<TerminalAction>,
    replacing: bool,
    /// Command6 keeps the outgoing mover's serial while creating a fresh Game.
    restart_mover: Option<u32>,
}

impl TerminalState {
    pub(super) fn begin(&mut self, owned: BTreeSet<u32>) {
        self.summary = None;
        self.talent_context.clear();
        self.talent_requests.clear();
        self.identity = self.identity.wrapping_add(1);
        self.owned_before = owned;
        self.restart_mover = None;
        if !self.replacing {
            self.actions.clear();
        }
    }

    pub(super) fn take_restart_mover(&mut self) -> Option<u32> {
        self.restart_mover.take()
    }

    /// Current14013e826 copies the complete request into the active context;
    /// current1402de2b9/140160020 read it only for the terminal XP panel.
    pub(super) fn queue_talent(&mut self, value: serde_json::Value) {
        self.talent_requests.push_back(value);
    }

    fn accept_talent(&mut self, value: serde_json::Value) {
        if !self.talent_context.accept(value) {
            return;
        }
        if let Some(summary) = self.summary.as_mut() {
            summary.talent = self.talent_context.snapshot().map(|snapshot| TalentSummary {
                gained: snapshot.gained,
                total: snapshot.total,
                before: Some(snapshot.before),
                class_name: snapshot.class_name,
                parts: snapshot.parts.into_iter().map(|(name, xp)| (name, i64::from(xp))).collect(),
            });
            self.identity = self.identity.wrapping_add(1);
        }
    }
}

/// Drain after terminal context construction, including a guest's state and
/// event arriving in the same inbound batch. A missing context drops the Value.
pub(super) fn apply_requests(mut state: ResMut<TerminalState>) {
    while let Some(value) = state.talent_requests.pop_front() {
        state.accept_talent(value);
    }
}

/// Summary XP admits custom GUIDfffffe and excludes only GUIDffffff.
/// Showcase separately gates the regular tick's five counters, not summary XP.
fn eligible(session: &RunSession) -> bool {
    session.started
        && session
            .selected_roster_guid
            .is_some_and(|guid| guid != 0x00ff_ffff)
}

/// Read before summary persistence opens the zone. A guest's account delivery
/// can run before the later presentation system sees its terminal state.
pub(super) fn unlocked_zone(
    delivery: &azeroth_survivors_re::run_progression::TerminalDelivery,
    menu: &MenuState,
    catalog: &MenuCatalog,
) -> Option<String> {
    if !delivery.first_result || !delivery.result.won { return None; }
    let index = catalog.zones.iter().position(|zone| zone.key == delivery.result.zone_key)?;
    if (index + 2).min(catalog.zones.len()) as u64
        <= menu.backend_save.unlock_value(delivery.result.class).unwrap_or(1)
    { return None; }
    catalog.zones.get(index + 1).map(|zone| zone.name.clone())
}

/// Capture before account_delivery consumes its queue/checkpoint. The completed
/// world and summary then outlive that save transaction independently.
pub(super) fn capture(
    mut session: ResMut<RunSession>,
    menu: Res<MenuState>,
    catalog: Res<MenuCatalog>,
    armory: Res<ArmoryCatalog>,
    art: Res<MenuArt>,
    mut state: ResMut<TerminalState>,
    stock: Option<Res<benilla_app::local_client::LocalStockFrontend>>,
    mut guest: Option<ResMut<super::coop::CoopGame>>,
) {
    if !menu.in_run || session.mechanics.is_none() {
        state.summary = None;
        state.talent_context.clear();
        return;
    }
    let game = session.mechanics.as_ref().unwrap();
    let remote_recap = guest.as_deref().and_then(|guest| guest.terminal_recap());
    if let Some(summary) = state.summary.as_mut() {
        // The ordered party lane can seat State before the private JSON event.
        // Refresh presentation without repeating terminal settlement.
        if game.replica_phase().is_some()
            && summary.outcome == Outcome::Defeat
            && summary.recap.as_ref() != remote_recap
        {
            summary.recap = remote_recap.cloned();
            state.identity = state.identity.wrapping_add(1);
        }
        return;
    }
    if !session.started {
        return;
    }
    if game.has_party() && game.party_shared_running() { return; }
    if !game.dead && !game.completed {
        return;
    }
    let class_name = catalog
        .classes
        .iter()
        .find(|row| row.key == game.class.key)
        .map(|row| row.name.clone())
        .unwrap_or_default();
    let race_name = catalog
        .races
        .get(usize::from(game.stats.native_race.saturating_sub(1)))
        .map(|row| row.name.clone())
        .unwrap_or_default();
    // Guest State delivery may already have acknowledged account checkpoints in
    // First. Keep the receipt until a world/summary can actually be presented.
    let guest_delivery = guest.as_deref_mut().and_then(|guest| guest.terminal_delivery.take());
    let guest_unlock = guest.as_deref_mut().and_then(|guest| guest.terminal_unlocked_zone.take());
    let delivery = guest_delivery.or_else(|| game.terminal_delivery()).filter(|_| eligible(&session));
    let zone_index = catalog
        .zones
        .iter()
        .position(|zone| zone.key == game.zone.key);
    let unlocked_zone = guest_unlock.unwrap_or_else(|| delivery.as_ref()
        .and_then(|delivery| unlocked_zone(delivery, &menu, &catalog)));
    let unlocked_banner = unlocked_zone.as_ref().and_then(|name| {
        zone_index
            .and_then(|index| catalog.zones.get(index + 1))
            .map(|zone| (format!("zone.{}.name", zone.key), name.clone()))
    });
    let mut owned = state.owned_before.clone();
    let saves_equipment = session
        .selected_roster_guid
        .is_some_and(|guid| guid != 0x00ff_ffff);
    let loot = game
        .run_equipment()
        .iter()
        .filter_map(|id| {
            let piece = armory.piece(*id)?;
            let is_new = !owned.contains(id);
            if saves_equipment {
                owned.insert(*id);
            }
            Some(TerminalLoot {
                name: piece.name(game.stats.native_race).to_owned(),
                icon: art
                    .icons
                    .get(&format!("gear.{}", piece.display_id(game.stats.native_race)))
                    .cloned(),
                rarity: piece.rarity,
                is_new,
            })
        })
        .collect();
    state.talent_context.activate();
    let outcome = if game.completed {
        Outcome::Victory
    } else if session.ended_by_player {
        Outcome::Left
    } else {
        Outcome::Defeat
    };
    let recap = if outcome == Outcome::Defeat {
        guest.as_deref()
            .and_then(|guest| guest.terminal_recap())
            .or_else(|| game.death_recap())
            .cloned()
    } else {
        None
    };
    state.summary = Some(TerminalSummary {
        outcome,
        hero: session.name.clone(),
        race_name,
        class_name,
        zone_name: session.zone_name.clone(),
        time_seconds: f64::from(game.clock),
        level: game.level,
        kills: game.kills,
        elites: game.elite_kills(),
        guardians: game.guardian_kills(),
        bosses: game.boss_kills(),
        damage: game.effective_damage(),
        taken: game.taken_total(),
        gold: game.gold_earned,
        chests: game.caches_bought(),
        unlocked_zone,
        talent: None,
        loot,
        recap,
        // Selected-target frontend-resource+c stores the process picker mode.
        return_to_main_menu: stock.is_none(),
    });
    state.identity = state.identity.wrapping_add(1);
    if let Some((key, name)) = unlocked_banner {
        // Preserve ordering behind the final kill/achievement events. The sole
        // collector sends it once; terminal recapture cannot replay it.
        session
            .mechanics
            .as_mut()
            .unwrap()
            .events
            .push(super::mechanics::RunEvent::ZoneUnlocked { key, name });
    }
}

/// Publish the full-screen block before FrameXML's mouse input stage, including
/// the first finished frame before capture has materialized the summary.
pub(super) fn capture_pointer(
    menu: Res<MenuState>,
    session: Res<RunSession>,
    state: Res<TerminalState>,
    mut extension: ResMut<benilla_app::local_client::LocalClientExtension>,
) {
    extension.pointer_over_ui |= menu.in_run
        && (state.summary.is_some()
            || session
                .mechanics
                .as_ref()
                .is_some_and(|game| game.dead || game.completed));
}

pub(super) fn input(
    clicks: Query<(&Interaction, &TerminalAction), Changed<Interaction>>,
    recap_modal: Res<super::terminal_view::RecapModal>,
    mut state: ResMut<TerminalState>,
    mut session: ResMut<RunSession>,
    mut menu: ResMut<MenuState>,
    catalog: Res<MenuCatalog>,
    mut world: ResMut<ZoneWorld>,
    mut client: ResMut<benilla_app::local_client::LocalClientSession>,
    mut pause: ResMut<Pause>,
    mut extension: ResMut<benilla_app::local_client::LocalClientExtension>,
    mut packets: ResMut<benilla_app::local_client::events::LocalPresentationEvents>,
    time: Res<Time>,
    mut commands: Commands,
    locale: Option<Res<crate::localization::Localization>>,
    stock: Option<Res<benilla_app::local_client::LocalStockFrontend>>,
    (mut coop,mut guest,mut inbound,mut notifications):(
        Option<ResMut<crate::coop_runtime::CoopRuntime>>,
        Option<ResMut<super::coop::CoopGame>>,
        ResMut<benilla_app::local_client::events::LocalWireEvents>,
        ResMut<super::notifications::Notifications>,
    ),
) {
    extension.pointer_over_ui |= menu.in_run && state.summary.is_some();
    if menu.in_run && state.summary.is_some() && !recap_modal.blocks_terminal() {
        // Native140287210 iterates every changed pressed row and sends each
        // action, then clears the displayed summary. A first-match shortcut
        // loses simultaneous input and makes later commands use the old Game.
        state
            .actions
            .extend(clicks.iter().filter_map(|(interaction, action)| {
                (*interaction == Interaction::Pressed).then_some(*action)
            }));
        if !state.actions.is_empty() {
            state.summary = None;
            state.talent_context.clear();
        }
    }
    if let Some(runtime)=coop.as_deref_mut().filter(|runtime|runtime.is_guest()) {
        let mut active_client = client.active;
        while let Some(action)=state.actions.pop_front() {
            match action {
                TerminalAction::Endless=>{
                    // Current guest command8 is native Control4, whose host
                    // consumer intentionally performs no continuation.
                    runtime.send(None,azeroth_survivors_re::coop::replication::NativeMessage::Control{kind:4,argument:0,offer:0});
                },
                TerminalAction::Again|TerminalAction::Menu=>{
                    // Native guest run commands6/9 close the admitted cache;
                    // they do not require the raw engine Logout client gate.
                    let Some(guest)=guest.as_deref_mut() else { continue };
                    let now=std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH)
                        .map_or(0,|duration|duration.as_secs());
                    let messages=guest.settle(&mut session,&mut menu,&catalog,locale.as_deref(),
                        &mut notifications,now,time.elapsed_secs(),true);
                    menu.persist_selection(&catalog);
                    if let Some(driver)=runtime.driver.as_mut() {
                        driver.send_message(None,azeroth_survivors_re::coop::replication::NativeMessage::Lifecycle(
                            azeroth_survivors_re::coop::server_party::LifecyclePacket::Disconnect));
                        driver.flush(time.elapsed_secs_f64());driver.close();
                    }
                    runtime.driver=None;runtime.party.clear();runtime.actor_clients.clear();
                    guest.leave();
                    world.request=None;session.mechanics=None;session.started=false;session.paused=false;
                    session.ended_by_player=false;*pause=Pause::default();
                    if active_client || menu.in_run { menu.return_from_run(); }
                    super::coop::queue_delivery(&mut commands,&mut inbound,&mut packets,messages,
                        active_client.then_some(benilla_protocol::SessionEnd::LoggedOut));
                    active_client=false;
                },
            }
        }
        return;
    }
    if state.replacing {
        if menu.entering {
            return;
        }
        // enter() runs before this system. Resume after construction succeeds
        // or returns an absent Game, independently of world-loading readiness.
        state.replacing = false;
        state.restart_mover = None;
    }
    let mut active_client = client.active;
    while let Some(action) = state.actions.pop_front() {
        // Current command6 takes the game option and returns when it was absent.
        // A stale terminal action must not replace that no-op with picker entry.
        if action == TerminalAction::Again && session.mechanics.is_none() {
            continue;
        }
        // Current1458b8300 searches active connections before persisting or taking
        // the Game. A second Menu in this batch sees the first logout immediately.
        if action == TerminalAction::Menu && !active_client {
            continue;
        }
        if action == TerminalAction::Endless {
            // Current 0.113.2 continuation always resumes/unroots a victory,
            // but publishes its notice only when endless was previously off.
            let announce_endless = session
                .mechanics
                .as_ref()
                .is_some_and(|game| !game.rules.endless);
            if session
                .mechanics
                .as_mut()
                .is_some_and(Mechanics::continue_endless)
            {
                // The native continuation emits the shared mover unroot before
                // the Endless notice. Drain it now: ordinary collection runs in
                // First and would otherwise deliver it after this Update's chat.
                packets.0.extend(super::client::player_mover_messages(
                    session.mechanics.as_mut().unwrap(),
                ));
                state.summary = None;
                state.talent_context.clear();
                session.ended_by_player = false;
                session.paused = false;
                *pause = Pause::default();
                // Current1458f4c30 publishes a RAID_BOSS_EMOTE through1458c8a40.
                // Reuse the actual client/FrameXML chat consumer for its title/body.
                use benilla_app::local_client::events::{ChatMessage, SessionEvent};
                let localized = |key: &str| {
                    locale
                        .as_deref()
                        .map_or_else(|| key.to_owned(), |locale| locale.label(key).to_owned())
                };
                if announce_endless {
                    packets.0.push(SessionEvent::Chat(ChatMessage {
                        chat_type: 0x5a,
                        language: 0,
                        sender_guid: 0,
                        target_guid: 0,
                        sender_name: Some(localized("Endless")),
                        channel: None,
                        text: localized("The onslaught never ends..."),
                        chat_tag: 0,
                    }));
                }
                // Victory can retain an earned offer; do not briefly enable the
                // controller between continuation and its next control update.
                client.set_paused(!session.playing() || !world.ready);
            }
            // Current command8 closes ordinary gossip after its helper even
            // when the present Game was not in victory phase. The unroot and
            // Endless notice above retain their earlier packet order.
            if session.mechanics.is_some() {
                packets
                    .0
                    .push(benilla_app::local_client::events::SessionEvent::GossipComplete);
            }
            continue;
        }
        let stock = stock.is_some();
        session.solo_again = action == TerminalAction::Again
            && session.mechanics.as_ref().is_some_and(|game| !game.has_party());
        let heroic_rank = session.mechanics.as_ref().map(|game| game.rules.heroic_rank);
        let selected = session.selected_roster_guid;
        let gear = session.starting_gear;
        let showcase = session.showcase;
        let started = session.started;
        if let Some(game) = session.mechanics.as_mut() {
            super::persist_run(game, &mut menu, selected, gear, showcase, started, true);
        }
        // AZSRUN/AZSEND use only the ordinary server poll. Terminal commands
        // enqueue their own protocol packets without forcing another snapshot.
        let mut final_messages = session.mechanics.as_mut().map_or_else(Vec::new, |game| {
            super::client::terminal_talent_messages(game, &catalog, locale.as_deref())
        });
        if action == TerminalAction::Again
            && active_client
            && client
                .player
                .as_ref()
                .is_some_and(|player| player.guid != 0)
        {
            // Current1458bca22 sends opcode17e before collecting/removing the
            // previous world's objects. Use the real FrameXML gossip handler.
            final_messages.push(benilla_app::local_client::events::SessionEvent::GossipComplete);
        }
        // Again always takes the old Game, but replacement admission requires an
        // active connection. Keep its no-client result distinct from menu entry.
        if action == TerminalAction::Again && !active_client {
            session.mechanics = None;
            continue;
        }
        // Current145c24759 enumerates the taken Game, then145c24799 sends
        // ObjectDestroy for every GUID before145c26320 constructs its successor.
        let retiring = (action == TerminalAction::Again)
            .then(|| session.mechanics.as_ref().map(Mechanics::retirement_objects))
            .flatten();
        state.restart_mover = (action == TerminalAction::Again)
            .then(|| session.mechanics.as_ref().map(Mechanics::player_mover_sequence))
            .flatten();
        menu.persist_selection(&catalog);
        world.request = None;
        session.mechanics = None;
        session.paused = false;
        session.ended_by_player = false;
        *pause = Pause::default();
        state.summary = None;
        state.talent_context.clear();
        menu.return_from_run();
        super::finish_client_delivery(
            &mut commands,
            final_messages,
            action == TerminalAction::Menu,
            action == TerminalAction::Again,
            retiring,
        );
        if action == TerminalAction::Menu {
            active_client = false;
        }
        if action == TerminalAction::Again {
            if stock {
                let zone = menu.zone;
                if let Some(guid) = selected {
                    if menu.select_roster_character(guid) {
                        menu.zone = zone;
                        menu.begin_restart(time.elapsed_secs(), heroic_rank);
                    }
                }
            } else {
                menu.begin_restart(time.elapsed_secs(), heroic_rank);
            }
            if menu.entering {
                state.replacing = true;
                break;
            }
            state.restart_mover = None;
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn again_replacement_preserves_the_rest_of_the_native_action_batch() {
        let mut state = TerminalState::default();
        state.actions.extend([
            TerminalAction::Again,
            TerminalAction::Endless,
            TerminalAction::Menu,
        ]);
        assert_eq!(state.actions.pop_front(), Some(TerminalAction::Again));
        state.replacing = true;
        // The actual enter() owner calls begin before remaining commands drain.
        state.begin([42].into_iter().collect());
        assert_eq!(
            state.actions.into_iter().collect::<Vec<_>>(),
            [TerminalAction::Endless, TerminalAction::Menu]
        );
        assert_eq!(state.owned_before, [42].into_iter().collect());
    }

    #[test]
    fn an_ordinary_entry_drops_stale_terminal_commands() {
        let mut state = TerminalState::default();
        state.actions.push_back(TerminalAction::Menu);
        state.begin(BTreeSet::new());
        assert!(state.actions.is_empty());
    }
}
