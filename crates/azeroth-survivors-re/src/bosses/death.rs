//! Primary boss death rewards revalidated against0.112.0 arm14594040e..145940de1.
//! See docs/analysis/raid-boss-lifecycle-0.112.0.md. Older versioned comments
//! below retain their original recovery provenance; current completion is
//! separately checked by raid-guardian-lifecycle-0.112.0.md.
//!
//! Native owner 1454c2eb0; primary arm 1454c41d3..1454c4af9. Common
//! damage/death marking, aura removal, on-kill procs and actor removal belong to
//! the shared owner and must precede this arm. Equipment uses mob_loot's
//! recovered implementation and the same run RNG; no duplicate loot tables.

use super::{catalog::{BossDefinition, ZONES}, NativeRng, Position};
use crate::mob_loot::{EquipmentRoll, MobLootWorld, PickupDrop};

pub const DEATH_TEXT_KEY: &str = "Impossible...";

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct BossAccountEvent<'a> {
    pub event_type: &'static str,
    pub name: &'a str,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct BossDeathState {
    /// Native Game+668, incremented before reward amounts are computed.
    pub boss_kills: u32,
    /// Selected0.105.0 Game+704 boss-meter state: 2=empty, 0=live, 1=stopped.
    /// Other values retain their native bit/discriminant behavior.
    pub clear_marker: u32,
    /// Selected0.105.0 Game+708 boss-meter stop time. Current hit-owner
    ///145935431..14593547b scans state0 actors with primary metadata;
    ///145935728..145935754 stops an even marker other than2 when none remain.
    pub clear_marked_at: f32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct CompletionState {
    /// Native Game+858, shared with endless scaling and the late victory gate.
    pub phase: u32,
    pub phase_started_at: f32,
    /// Native Game+95f; active=1, completed=5.
    pub run_state: u8,
    /// Native Game+952. It suppresses the normal completion gate.
    pub endless_enabled: bool,
    /// Native Game+4b4, incremented by the deferred normal completion owner.
    pub victories: u32,
}

#[derive(Clone, Copy, Debug)]
pub struct BossDeathInput {
    pub guid: u64,
    pub now: f32,
    pub position: Position,
    /// Must be evaluated after the dying actor is marked dead. Current
    ///145935431..14593547b admits only actor state0 with primary metadata
    /// other than the absent(-1) option. Ordinary enemies/guardians do not count.
    pub remaining_live_primary_boss: bool,
    pub class: u8,
    pub zone_index: usize,
    pub equipment: EquipmentRoll,
}

pub trait DeathPort: MobLootWorld {
    fn announce_boss_death(&mut self, guid: u64, localized_name: &str, text_key: &'static str);
    fn account_event(&mut self, event: BossAccountEvent<'_>);
    fn queue_equipment(&mut self, item_id: u32);
    /// The live account adapter owns current Heroic/pity/marks state; isolated
    /// historical death fixtures supply their original equipment policy.
    fn roll_boss_equipment(&mut self, class: u8, zone: usize, boss: usize,
        roll: EquipmentRoll, rng: &mut NativeRng);
    /// Native shared pickup creator kind6.
    fn create_boss_magnet(&mut self, position: Position);
    fn create_boss_magnet_with_rng(&mut self, position: Position, _rng: &mut NativeRng) {
        self.create_boss_magnet(position);
    }
    /// Native1454d2380, after boss pickups/equipment. The shared pickup owner
    /// must apply attract_idle_experience below to its actual experience rows.
    fn attract_idle_experience(&mut self);
}

pub fn boss_experience(kills_after_increment: u32) -> u32 {
    kills_after_increment.wrapping_mul(20).wrapping_add(60)
}
pub fn boss_gold(kills_after_increment: u32) -> u32 {
    kills_after_increment.wrapping_mul(20).wrapping_add(40)
}

/// Exact primary death arm, called once for a primary-boss actor. The native
/// generic pickup creator still owns clamping, entity packets and acquisition.
/// Boss magnet scheduling consumes a due head unconditionally; guardian
/// chance-gated magnet handling is a separate native path.
pub fn on_boss_death(
    state: &mut BossDeathState,
    completion: &mut CompletionState,
    magnet_deadlines: &mut impl crate::run_pickups::MagnetSchedule,
    definition: &BossDefinition,
    localized_name: &str,
    input: BossDeathInput,
    rng: &mut NativeRng,
    port: &mut impl DeathPort,
) {
    // Selected0.105.0 stop branch145935728..145935754 preserves odd markers
    // and marker2; otherwise no remaining primary boss stores marker1 and now.
    if !input.remaining_live_primary_boss && state.clear_marker & 1 == 0 && state.clear_marker != 2 {
        state.clear_marker = 1;
        state.clear_marked_at = input.now;
    }
    state.boss_kills = state.boss_kills.wrapping_add(1);
    port.announce_boss_death(input.guid, localized_name, DEATH_TEXT_KEY);
    port.account_event(BossAccountEvent { event_type: "bossdown", name: localized_name });
    let position = crate::treasure_chests::Position::new(input.position.x, input.position.y, input.position.z);
    port.create_pickup_with_rng(PickupDrop::Experience { amount: boss_experience(state.boss_kills), position }, rng);
    port.create_pickup_with_rng(PickupDrop::Gold {
        amount: boss_gold(state.boss_kills),
        position: crate::treasure_chests::Position::new(input.position.x + 2.0, input.position.y + -0.0, input.position.z),
    }, rng);
    // UCOMISS/JA takes the removal arm for equal or unordered deadlines.
    if magnet_deadlines.first_eligible().is_some_and(|deadline| !(deadline > input.now)) {
        magnet_deadlines.remove_first();
        port.create_boss_magnet_with_rng(Position { x: input.position.x + -2.0, y: input.position.y + 1.5, z: input.position.z }, rng);
    }
    // Native equipment admission compares this actual definition pointer with
    // one of the chosen zone's five static boss rows. Cloned/custom definitions
    // receive ordinary boss rewards but do not gain invented equipment rolls.
    if let Some(zone) = ZONES.get(input.zone_index) {
        if let Some(index) = zone.bosses.iter().position(|row| std::ptr::eq(row, definition)) {
            port.roll_boss_equipment(input.class, input.zone_index, index, input.equipment, rng);
        }
    }
    port.attract_idle_experience();
    // Native compares the LOW BYTE, not the entire phase discriminant.
    if definition.flag_54 == 1 && completion.phase as u8 == 0 {
        completion.phase = 1;
        completion.phase_started_at = input.now;
    }
}

/// Native end-of-active-tick1454aa103 gate. This is intentionally deferred
/// until after the death owner, and is separate from endless phase activation.
/// Return true once the engine should execute its recovered completion
/// movement-stop/packet/account callbacks. Later calls are blocked by state5.
pub fn finish_normal_run(state: &mut CompletionState) -> bool {
    struct StateOnly;
    impl CompletionPort for StateOnly {
        fn freeze_world_movements(&mut self) {}
        fn completion_packet(&mut self, _: u16, _: u64, _: u32) {}
        fn account_statistics_event(&mut self, _: &'static str) {}
    }
    finish_normal_run_with_port(state, 0, &mut StateOnly)
}


/// Concrete callbacks requested by the deferred native completion branch.
/// The real account-event consumer owns later persistence; this branch does
/// not directly call a save routine.
pub trait CompletionPort {
    /// Native145492fd0 freezes live actors and the other owned movement rows,
    /// revalidates terrain Z and queues the shared stop-movement packets.
    fn freeze_world_movements(&mut self);
    /// Native14543fb70: opcode0xe8, player GUID, preincrement victory count.
    fn completion_packet(&mut self, opcode: u16, player_guid: u64, prior_victories: u32);
    /// Native1454b6620 constructs the current Game statistics event. Its
    /// serializer and downstream consumer remain the shared account owner.
    fn account_statistics_event(&mut self, event_type: &'static str);
}

/// Preserves the native side-effect order, including the preincrement packet
/// count and postincrement statistics snapshot. State5 blocks repeat dispatch.
pub fn finish_normal_run_with_port(state: &mut CompletionState, player_guid: u64, port: &mut impl CompletionPort) -> bool {
    if state.phase == 0 || state.run_state != 1 || state.endless_enabled { return false; }
    state.run_state = 5;
    port.freeze_world_movements();
    port.completion_packet(0xe8, player_guid, state.victories);
    state.victories = state.victories.wrapping_add(1);
    port.account_statistics_event("victory");
    true
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct BossMeterTiming {
    pub seconds: f32,
    pub live: bool,
}

/// Historical bossMeter JSON1454988e5..145498b53; selected0.105.0 elapsed
/// branch1458fd151..1458fd160 revalidates this clock selection. State2 is absent.
/// Other states choose stop time when bit0 is set, otherwise current clock.
/// The serialized live boolean specifically compares state != 1.
pub fn boss_meter_timing(marker: u32, started_at: f32, stopped_at: f32, now: f32) -> Option<BossMeterTiming> {
    if marker == 2 { return None; }
    let end = if marker & 1 != 0 { stopped_at } else { now };
    Some(BossMeterTiming { seconds: end - started_at, live: marker != 1 })
}

/// Selected0.105.0 hit-owner14593471c..145934898 invokes this only for an
/// admitted primary-boss record. A new segment starts when the state is nonzero;
/// the shared boss damage-meter lines are cleared before the new line is added.
pub fn begin_boss_meter<T>(marker: &mut u32, started_at: &mut f32, lines: &mut Vec<T>, now: f32) -> bool {
    if *marker == 0 { return false; }
    *started_at = now;
    *marker = 0;
    lines.clear();
    true
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ExperiencePickup {
    pub guid: u64,
    /// Native kind+20; only kind0 is experience.
    pub kind: u32,
    /// Native state+18; only state0 is admitted.
    pub state: u32,
    pub position: Position,
    pub arrives_at: f32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ExperienceAttraction {
    pub guid: u64,
    pub from: Position,
    pub to: Position,
    pub duration: f32,
}

/// Native1454d2380: every idle experience pickup moves to the current player
/// with duration=max(XY_distance/40, .15). Active/non-XP rows are skipped.
/// Entity movement packet construction/sequence and actual credit on arrival
/// remain shared pickup-owner responsibilities.
pub fn attract_idle_experience(pickups: &mut [ExperiencePickup], player: Position, now: f32) -> Vec<ExperienceAttraction> {
    let mut moves = Vec::new();
    for pickup in pickups {
        if pickup.kind != 0 || pickup.state != 0 { continue; }
        let dx = pickup.position.x - player.x;
        let dy = pickup.position.y - player.y;
        let duration = (dy * dy + dx * dx).sqrt() / 40.0;
        let duration = if duration > 0.15 { duration } else { 0.15 };
        pickup.state = 1;
        pickup.arrives_at = now + duration;
        moves.push(ExperienceAttraction { guid: pickup.guid, from: pickup.position, to: player, duration });
    }
    moves
}
