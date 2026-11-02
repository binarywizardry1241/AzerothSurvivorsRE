//! Current 0.109.0 native12 grouped soak towers. This module is included
//! beneath raid_areas so towers retain the shared hazard vector/marker serial.
//! Evidence and static/native checks: docs/analysis/raid-towers-0.109.0.md.

use super::{ground, Area, Pending};
use crate::bosses::{
    abilities::{CastTarget, CombatContext, CombatPort, SpellCast},
    raid_warnings::RaidWarning,
    NativeRng, Position, RawBossAbility,
};
use crate::enemies::ai::Math;

#[derive(Clone, Copy)]
struct Tower {
    spell: u32,
    count: u32,
    radius: f32,
    spread: f32,
    windup: f32,
    factor: f32,
}

// Semantic13 carries an index; word6 remains the current scheduler cooldown.
#[rustfmt::skip]
const TOWERS: &[Tower] = &[
// BEGIN NATIVE TOWERS
    Tower { spell: 1449, count: 3, radius: f32::from_bits(0x40900000), spread: f32::from_bits(0x41400000), windup: f32::from_bits(0x40800000), factor: f32::from_bits(0x40a00000) },
    Tower { spell: 24324, count: 3, radius: f32::from_bits(0x40800000), spread: f32::from_bits(0x41400000), windup: f32::from_bits(0x40900000), factor: f32::from_bits(0x40a00000) },
    Tower { spell: 28524, count: 3, radius: f32::from_bits(0x40800000), spread: f32::from_bits(0x41400000), windup: f32::from_bits(0x40a00000), factor: f32::from_bits(0x40c00000) },
    Tower { spell: 28524, count: 3, radius: f32::from_bits(0x40800000), spread: f32::from_bits(0x41400000), windup: f32::from_bits(0x40a00000), factor: f32::from_bits(0x40c00000) },
    Tower { spell: 27819, count: 3, radius: f32::from_bits(0x40800000), spread: f32::from_bits(0x41400000), windup: f32::from_bits(0x40900000), factor: f32::from_bits(0x40a00000) },
// END NATIVE TOWERS
];

/// Added to the shared stage's existing ordered impact/removal/publication
/// buffers. The caller owns its one damage admission and reverse end messages.
#[derive(Default)]
pub(super) struct TowerResolution {
    pub(super) ended: Vec<(usize, u32)>,
    pub(super) visuals: Vec<SpellCast>,
    pub(super) source: Option<u64>,
}

impl Pending {
    pub(super) fn dispatch_towers(&mut self, record: &RawBossAbility, context: CombatContext,
        port: &mut impl CombatPort, rng: &mut NativeRng, math: &impl Math) -> bool {
        if record.words[0] != 13 { return false; }
        let Some(&tower) = TOWERS.get(record.words[1] as usize) else { return false };
        port.raid_block(context.source_guid, tower.windup);
        port.raid_cast(context.source_guid, tower.spell, tower.windup);
        self.next_tower_group = self.next_tower_group.wrapping_add(1);
        let group = self.next_tower_group;
        // Native draws the base angle even for centered/zero-spread towers.
        let base_angle = rng.range_f32(0., std::f32::consts::TAU);
        let count = tower.count.max(1);
        for index in 0..count {
            let mut center = context.player;
            if tower.spread > 0. {
                let distance = rng.range_f32(f32::from_bits(0x3f333333), 1.) * tower.spread;
                let angle = (index as f32 / count as f32) * std::f32::consts::TAU + base_angle;
                center.x = distance * math.cos(angle) + context.player.x;
                center.y = distance * math.sin(angle) + context.player.y;
                if let Some((zone, radius)) = port.raid_zone_bounds() {
                    let dx = center.x - zone[0];
                    let dy = center.y - zone[1];
                    let distance = dx.hypot(dy);
                    let radius = radius - 4.;
                    if distance >= f32::from_bits(0x3c23d70a) && radius < distance {
                        center.x = zone[0] + radius * (dx / distance);
                        center.y = zone[1] + radius * (dy / distance);
                    }
                }
            }
            let mut row = Area::danger(context, ground(port, center), tower.radius,
                tower.windup, context.effective_damage * tower.factor, port.heroic_rank());
            row.tower_group = Some(group);
            row.impact_spell = tower.spell;
            self.push(row);
        }
        port.raid_warning(context.source_guid, if tower.spread > 0. {
            RaidWarning::Towers
        } else { RaidWarning::StandStill });
        true
    }

    /// Native145951a11..1d41: gather every kind1 member of each admitted group,
    /// fail once only when the current player is outside every member, then
    /// remove the whole group. The filter has no extra deadline/source gate.
    pub(super) fn resolve_towers(&mut self, now: f32, port: &mut impl CombatPort,
        original_indices: &mut Vec<usize>, total: &mut f32) -> TowerResolution {
        let mut groups = Vec::new();
        for row in &self.rows {
            if !port.raid_source_selected(row.source) { continue; }
            if let Some(group) = row.tower_group {
                if now >= row.end && !groups.contains(&group) { groups.push(group); }
            }
        }
        let mut result = TowerResolution::default();
        if groups.is_empty() { return result; }
        let player = port.player_position();
        let visual_position = Position {
            z: port.primary_height([player.x, player.y]).unwrap_or(player.z), ..player
        };
        for group in groups {
            let mut rows = self.rows.iter().filter(|row| row.tower_group == Some(group));
            let Some(first) = rows.next() else { continue };
            if !first.contains(player) && !rows.any(|row| row.contains(player)) {
                // One ADDSS per failed group, after existing circle/pool damage.
                *total += first.damage;
                result.source = Some(first.source);
                if first.impact_spell != 0 {
                    result.visuals.push(SpellCast { source_guid: first.source,
                        spell_id: first.impact_spell, target: CastTarget::Ground(visual_position),
                        hit_targets: Vec::new() });
                }
            }
            let mut index = 0;
            while index < self.rows.len() {
                let row = &self.rows[index];
                if row.tower_group != Some(group) { index += 1; continue; }
                if row.published { result.ended.push((original_indices[index], row.id)); }
                self.rows.remove(index);
                original_indices.remove(index);
            }
        }
        result
    }
}
