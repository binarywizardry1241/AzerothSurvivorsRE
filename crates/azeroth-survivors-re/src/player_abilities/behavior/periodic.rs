//! Native player periodic-effect construction. The source keeps native counts,
//! timing and power normalization distinct; expanded duration adds ticks.

use super::{state::scaled_hit_effect, RuntimeInstance};
use crate::{enemies::Position, player_abilities::{catalog::StatusEffect, damage::scaled_duration}};

/// Current radius softcap: imported log1pf, not a square-root approximation.
/// Native1454e86dd /1454e7ea6 uses the same70/10 curve.
pub fn area_radius(instance: &RuntimeInstance<'_>, global_area: f32) -> f32 {
    scaled_radius(instance, global_area, instance.definition.radius)
}

pub fn scaled_radius(instance: &RuntimeInstance<'_>, global_area: f32, base: f32) -> f32 {
    let radius = global_area * (instance.area_multiplier * instance.talent_area_multiplier * base);
    if radius > 70.0 { ((radius - 70.0) / 10.0).ln_1p() * 10.0 + 70.0 } else { radius }
}

///1454e96e7..1454e97bc, encoded in projectile caller-context variant1.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DotPlan { pub total_power: f32, pub duration: f32, pub ticks: u32 }

impl DotPlan {
    pub fn new(instance: &RuntimeInstance<'_>, effective_power: f32, global_tick_bonus: f32) -> Self {
        let definition = instance.definition;
        let duration = scaled_duration(instance);
        let base_spacing = definition.duration / definition.ticks.max(1) as f32;
        let duration_ticks = (duration / base_spacing.max(0.01)).round().max(1.0);
        let factor = global_tick_bonus + 1.0;
        let ticks_float = (factor * duration_ticks).round();
        let ticks = ticks_float as u32;
        Self { total_power: factor * effective_power * (duration / definition.duration.max(0.01)),
            duration: ticks as f32 * ((duration_ticks * base_spacing) / ticks_float), ticks }
    }

    pub fn words(self) -> [u32; 4] {
        [1, self.total_power.to_bits(), self.duration.to_bits(), self.ticks]
    }
}

/// The PE imports roundf. Rust round has the same away-from-zero tie rule;
/// the float-to-u32 conversion is saturating as emitted by current Rust code.
pub fn tick_count(instance: &RuntimeInstance<'_>) -> u32 {
    let base_ticks = instance.definition.ticks.max(1) as f32;
    let denominator = instance.definition.duration.max(0.01);
    ((scaled_duration(instance) / denominator) * base_ticks).round() as u32
}

/// Semantic native88-byte kind-zero shared area record (Game+0x4e0).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct GroundPeriodic {
    pub object_guid: u64,
    pub effect: StatusEffect,
    pub center: Position,
    pub radius: f32,
    pub spell_id: u32,
    pub next_tick_at: f32,
    pub interval: f32,
    pub ticks_remaining: u32,
    pub damage_per_tick: f32,
    pub remove_at: f32,
    pub school: u8,
}

impl GroundPeriodic {
    /// Caller selects the native center and uses bosses::abilities::ground_object
    /// to allocate/emit the actual shared object before queuing this record.
    pub fn new(instance: &RuntimeInstance<'_>, now: f32, object_guid: u64,
               center: Position, radius: f32, effective_power: f32) -> Self {
        let ticks = tick_count(instance).max(1);
        let duration = scaled_duration(instance);
        Self { object_guid, effect: scaled_hit_effect(instance), center, radius,
            spell_id: instance.definition.spell_id, next_tick_at: now + 0.25,
            interval: duration / ticks as f32, ticks_remaining: ticks,
            damage_per_tick: effective_power / instance.definition.ticks.max(1) as f32,
            remove_at: (duration + now) + 0.3, school: instance.definition.school }
    }

    ///1454a3f90: one tick per frame, advancing from the old deadline. The
    /// owning queue checks removal first, so overdue removal suppresses ticks.
    pub fn take_tick(&mut self, now: f32) -> bool {
        if now >= self.remove_at || self.ticks_remaining == 0 || !(now >= self.next_tick_at) {
            return false;
        }
        self.ticks_remaining -= 1;
        self.next_tick_at += self.interval;
        true
    }
}

/// Semantic native48-byte Actor periodic row. Owner kinds0 and1 are kept
/// distinct because replacement/stack caps match by source for kind1.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ActorPeriodic {
    pub owner_kind: u64,
    pub owner_guid: u64,
    pub spell_id: u32,
    pub power_per_tick: f32,
    pub interval: f32,
    pub next_tick_at: f32,
    pub ticks_remaining: u32,
    pub initial_ticks: u32,
    pub leech_fraction: f32,
    pub school: u8,
}

///14540d430: remove exhausted matching rows, evict the least remaining ticks
/// when at cap, append a new row. Equal remaining counts retain the first
/// eviction candidate. Zero cap is normalized to1 by the native helper.
pub fn install_dot(rows: &mut Vec<ActorPeriodic>, owner_kind: u64, owner_guid: u64,
                   spell_id: u32, school: u8, plan: DotPlan, now: f32,
                   leech_fraction: f32, stack_cap: usize) {
    let matches = |row: &ActorPeriodic| row.spell_id == spell_id
        && if owner_kind & 1 == 0 { row.owner_kind == 0 }
           else { row.owner_kind == 1 && row.owner_guid == owner_guid };
    rows.retain(|r| !(matches(r) && r.ticks_remaining == 0));
    while rows.iter().filter(|r| matches(r)).count() >= stack_cap.max(1) {
        let candidate = rows.iter().enumerate().filter(|(_, r)| matches(r))
            .min_by_key(|(index, r)| (r.ticks_remaining, *index)).map(|(i, _)| i);
        if let Some(index) = candidate { rows.remove(index); } else { break; }
    }
    rows.push(ActorPeriodic { owner_kind, owner_guid, spell_id,
        power_per_tick: plan.total_power / plan.ticks as f32,
        interval: plan.duration / plan.ticks as f32, next_tick_at: now,
        ticks_remaining: plan.ticks, initial_ticks: plan.ticks, leech_fraction, school });
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PeriodicTick {
    pub owner_kind: u64,
    pub owner_guid: u64,
    pub target_guid: u64,
    pub spell_id: u32,
    pub raw_power: f32,
    pub leech_fraction: f32,
    pub school: u8,
    pub first_player_tick: bool,
}

///1454c9bc0..1454c9c25 collects these before resolving combat requests.
/// Empty rows remain until replacement; they are skipped, not ticked again.
pub fn take_actor_ticks(rows: &mut [ActorPeriodic], target_guid: u64, now: f32) -> Vec<PeriodicTick> {
    let mut result = Vec::new();
    for row in rows {
        if row.ticks_remaining == 0 || !(now >= row.next_tick_at) { continue; }
        let first_player_tick = row.owner_kind == 0 && row.ticks_remaining == row.initial_ticks;
        row.ticks_remaining -= 1;
        row.next_tick_at += row.interval;
        result.push(PeriodicTick { owner_kind: row.owner_kind, owner_guid: row.owner_guid,
            target_guid, spell_id: row.spell_id, raw_power: row.power_per_tick,
            leech_fraction: row.leech_fraction, school: row.school, first_player_tick });
    }
    result
}
