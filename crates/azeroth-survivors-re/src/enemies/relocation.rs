//! Distant enemy recycling from selected 0.97.2 native tick 1454a70fd.
//! The predicate 145531cb0 chooses at most four existing GUIDs per active tick.
//! Real actor storage, terrain and movement packets remain engine boundaries.

use super::ai::{Actor, Movement};
use super::catalog::ZoneDefinition;
use super::spawning::{sample_position, PlacementMath, Terrain};
use super::{NativeRng, Position};

pub const MAXIMUM_PER_TICK: usize = 4;
pub const DISTANCE_SQUARED: f32 = 3025.0;

/// Exact predicate inputs supplied in the owning run's actor-vector order.
/// This source snapshot does not declare the native memory ABI.
#[derive(Clone, Copy, Debug)]
pub struct Candidate {
    pub guid: u64,
    pub movement: Movement,
    pub dead: bool,
    pub definition_present: bool,
    pub boss_index: Option<usize>,
    pub lair_index: Option<usize>,
    /// Native escape-state byte+0x78. Preserve the whole byte for this gate;
    /// only zero is eligible, independently of other escape-state encoding.
    pub raw_78: u8,
}

/// `> 55` units in XY, after native clamped movement interpolation. An exact
/// boundary or unordered squared distance does not qualify. The predicate
/// does not inspect the enemy definition's flag_4c.
pub fn distant_guids(candidates: &[Candidate], now: f32, player: Position) -> Vec<u64> {
    candidates.iter().filter(|candidate| {
        if candidate.dead || !candidate.definition_present || candidate.boss_index.is_some()
            || candidate.lair_index.is_some() || candidate.raw_78 != 0 {
            return false;
        }
        let current = candidate.movement.position_at(now);
        let x = current.x - player.x;
        let y = current.y - player.y;
        y * y + x * x > DISTANCE_SQUARED
    }).take(MAXIMUM_PER_TICK).map(|candidate| candidate.guid).collect()
}

/// Native 1454451b0 request issued after actor mutation and sequence increment.
/// Its real engine packet encoder owns the serialized representation.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Relocation {
    pub guid: u64,
    pub position: Position,
    pub sequence: u32,
}

/// 1454a727c..1454a72e8. Relocation cancels the active cast state, replaces
/// both movement endpoints and sets start/refresh to now with zero duration.
/// Cast deadline, attack timer, statuses, health and damage retain their values.
pub fn apply_relocation(actor: &mut Actor, position: Position, now: f32,
                        sequence: &mut u32) -> Relocation {
    actor.movement = Movement { from: position, to: position, started_at: now, duration: 0.0 };
    actor.next_movement_at = now;
    actor.casting = false;
    *sequence = sequence.wrapping_add(1);
    Relocation { guid: actor.guid, position, sequence: *sequence }
}

pub trait RelocationPort {
    /// Snapshot the actual owning run's actor vector without reordering it.
    fn candidates(&self) -> Vec<Candidate>;
    fn actor_mut(&mut self, guid: u64) -> Option<&mut Actor>;
    fn queue_relocation(&mut self, relocation: Relocation);
}

#[derive(Clone, Copy, Debug)]
pub struct Context {
    pub now: f32,
    pub player: Position,
    /// Game+0x8a8 smoothed owning-run velocity, shared with ordinary placement.
    pub player_velocity: [f32; 2],
}

/// Call inside the active run gate, before ordinary spawn-budget accumulation.
/// Each selected GUID consumes native placement draws before GUID lookup, even
/// if it no longer exists. A found actor retains its GUID and combat stats.
pub fn relocate_distant(zone: &ZoneDefinition, context: Context, rng: &mut NativeRng,
                        terrain: &mut impl Terrain, math: &mut impl PlacementMath,
                        sequence: &mut u32, port: &mut impl RelocationPort) -> usize {
    let guids = distant_guids(&port.candidates(), context.now, context.player);
    let mut relocated = 0;
    for guid in guids {
        let position = sample_position(zone, context.player, context.player_velocity, 1.0,
                                       rng, terrain, math);
        if let Some(actor) = port.actor_mut(guid) {
            let request = apply_relocation(actor, position, context.now, sequence);
            port.queue_relocation(request);
            relocated += 1;
        }
    }
    relocated
}
