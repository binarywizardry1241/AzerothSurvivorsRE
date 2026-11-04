//! Warned cones, following knockback circles and rooting circles.
//! Included beneath raid_areas so every effect shares its hazard ID/vector.

use super::{ground, Area, Pending};
use crate::bosses::{abilities::{CastTarget, CombatContext, CombatPort, SpellCast}, Position, RawBossAbility};
use crate::enemies::ai::Math;

#[derive(Clone, Copy)]
enum Action {
    Cone { spell: u32, range: f32, degrees: f32, windup: f32, factor: f32 },
    Knockback { spell: u32, radius: f32, factor: f32, speed: f32 },
    Root { spell: u32, radius: f32, windup: f32, duration: f32, factor: f32 },
}

pub(crate) const SCHOL_RAID_ACTION: u32 = 19;
const SCHOL_KNOCKBACK_WINDUP: f32 = 1.2;

// 0.140.0 records 0x1473be7c8, 0x1473be800 and 0x1473be838.
const SCHOL_ACTIONS: &[Action] = &[
    Action::Cone { spell: 15284, range: 9.5, degrees: 90., windup: 0.96, factor: 1.5 },
    Action::Knockback { spell: 20549, radius: 7., factor: 1.3, speed: 12. },
    Action::Root { spell: 745, radius: 5., windup: 1.2, duration: 2., factor: 0.4 },
];

pub(in crate::bosses) fn schol_aim_windup(record: &RawBossAbility) -> Option<f32> {
    match SCHOL_ACTIONS.get(record.words[1] as usize)? {
        Action::Cone { windup, .. } | Action::Root { windup, .. } => Some(*windup),
        Action::Knockback { .. } => None,
    }
}

// Semantic10 carries an index, independently of the current native enum.
#[rustfmt::skip]
const ACTIONS: &[Action] = &[
// BEGIN NATIVE ACTIONS
    Action::Cone { spell: 6304, range: f32::from_bits(0x41300000), degrees: f32::from_bits(0x42a00000), windup: f32::from_bits(0x3f8ccccd), factor: f32::from_bits(0x3fe66666) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x41000000), factor: f32::from_bits(0x3fb33333), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41100000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x40000000) },
    Action::Cone { spell: 22539, range: f32::from_bits(0x41600000), degrees: f32::from_bits(0x42700000), windup: f32::from_bits(0x3fb33333), factor: f32::from_bits(0x400ccccd) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x42200000), degrees: f32::from_bits(0x43340000), windup: f32::from_bits(0x40000000), factor: f32::from_bits(0x40266666) },
    Action::Knockback { spell: 8078, radius: f32::from_bits(0x41100000), factor: f32::from_bits(0x3fcccccd), speed: f32::from_bits(0x41500000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41200000), degrees: f32::from_bits(0x42a00000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x400ccccd) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x41200000), factor: f32::from_bits(0x3fe66666), speed: f32::from_bits(0x41600000) },
    Action::Cone { spell: 18435, range: f32::from_bits(0x41800000), degrees: f32::from_bits(0x42700000), windup: f32::from_bits(0x3fb33333), factor: f32::from_bits(0x40266666) },
    Action::Knockback { spell: 8078, radius: f32::from_bits(0x41000000), factor: f32::from_bits(0x3fcccccd), speed: f32::from_bits(0x41400000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x41200000), factor: f32::from_bits(0x3fe66666), speed: f32::from_bits(0x41700000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41400000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x40266666) },
    Action::Knockback { spell: 16508, radius: f32::from_bits(0x41000000), factor: f32::from_bits(0x3fb33333), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41100000), degrees: f32::from_bits(0x42c80000), windup: f32::from_bits(0x3f666666), factor: f32::from_bits(0x400ccccd) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x41100000), factor: f32::from_bits(0x40000000), speed: f32::from_bits(0x41500000) },
    Action::Knockback { spell: 16727, radius: f32::from_bits(0x41000000), factor: f32::from_bits(0x3fcccccd), speed: f32::from_bits(0x41500000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x41300000), factor: f32::from_bits(0x40000000), speed: f32::from_bits(0x41600000) },
    Action::Cone { spell: 120, range: f32::from_bits(0x41600000), degrees: f32::from_bits(0x42700000), windup: f32::from_bits(0x3fa66666), factor: f32::from_bits(0x4019999a) },
    Action::Cone { spell: 21099, range: f32::from_bits(0x41800000), degrees: f32::from_bits(0x428c0000), windup: f32::from_bits(0x3fb33333), factor: f32::from_bits(0x40333333) },
    Action::Knockback { spell: 23931, radius: f32::from_bits(0x41000000), factor: f32::from_bits(0x3fcccccd), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 16390, range: f32::from_bits(0x41600000), degrees: f32::from_bits(0x42700000), windup: f32::from_bits(0x3fb33333), factor: f32::from_bits(0x4019999a) },
    Action::Knockback { spell: 18500, radius: f32::from_bits(0x41100000), factor: f32::from_bits(0x3fcccccd), speed: f32::from_bits(0x41600000) },
    Action::Cone { spell: 22539, range: f32::from_bits(0x42200000), degrees: f32::from_bits(0x43340000), windup: f32::from_bits(0x40000000), factor: f32::from_bits(0x404ccccd) },
    Action::Knockback { spell: 25599, radius: f32::from_bits(0x41300000), factor: f32::from_bits(0x40000000), speed: f32::from_bits(0x41500000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41200000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x400ccccd) },
    Action::Cone { spell: 26050, range: f32::from_bits(0x41800000), degrees: f32::from_bits(0x42f00000), windup: f32::from_bits(0x3fb33333), factor: f32::from_bits(0x400ccccd) },
    Action::Cone { spell: 28308, range: f32::from_bits(0x41100000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f666666), factor: f32::from_bits(0x40266666) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x41100000), factor: f32::from_bits(0x3fe66666), speed: f32::from_bits(0x41500000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x40e00000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fb33333) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x40e00000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fb33333) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Knockback { spell: 10101, radius: f32::from_bits(0x40c00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41600000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 16396, range: f32::from_bits(0x41100000), degrees: f32::from_bits(0x42a00000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Knockback { spell: 18500, radius: f32::from_bits(0x41000000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41600000) },
    Action::Cone { spell: 16396, range: f32::from_bits(0x41200000), degrees: f32::from_bits(0x428c0000), windup: f32::from_bits(0x3f8ccccd), factor: f32::from_bits(0x3fc00000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Knockback { spell: 16508, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41500000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Knockback { spell: 20549, radius: f32::from_bits(0x40e00000), factor: f32::from_bits(0x3fa66666), speed: f32::from_bits(0x41400000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
    Action::Cone { spell: 15284, range: f32::from_bits(0x41000000), degrees: f32::from_bits(0x42b40000), windup: f32::from_bits(0x3f800000), factor: f32::from_bits(0x3fc00000) },
// END NATIVE ACTIONS
];

#[derive(Clone, Debug)]
struct Visual {
    source: u64,
    spell: u32,
    at: f32,
    position: Position,
}

/// Current Game+5c0/5c8/5d0 queue; distinct from hazard expiry and actor actions35.
#[derive(Clone, Debug, Default)]
pub struct PendingActionVisuals(Vec<Visual>);

impl PendingActionVisuals {
    /// Current local update resolves hazards, then14591cad0 consumes these.
    /// A removed/dead caster does not suppress a queued spell's presentation.
    pub fn advance(&mut self, now: f32, port: &mut impl CombatPort) {
        let mut index = 0;
        while index < self.0.len() {
            if !port.raid_source_selected(self.0[index].source) { index += 1; continue; }
            // Current UCOMISS/JB skips both an earlier clock and an unordered
            // comparison. A NaN time must retain the queued visual.
            if !(now >= self.0[index].at) { index += 1; continue; }
            let visual = self.0.remove(index);
            port.cast_spell(SpellCast { source_guid: visual.source, spell_id: visual.spell,
                target: CastTarget::Ground(visual.position), hit_targets: Vec::new() });
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::bosses::abilities::{Charge, GroundObject, MinionSpawn};
    use crate::native_counter::NativeCounter;

    #[derive(Default)]
    struct Port(Vec<SpellCast>);

    impl CombatPort for Port {
        fn primary_height(&mut self, _: [f32; 2]) -> Option<f32> { unreachable!() }
        fn secondary_height(&mut self, _: [f32; 2]) -> Option<f32> { unreachable!() }
        fn fallback_height(&self) -> f32 { unreachable!() }
        fn ray_fraction(&mut self, _: Position, _: Position) -> Option<f32> { unreachable!() }
        fn cast_spell(&mut self, request: SpellCast) { self.0.push(request); }
        fn create_ground_object(&mut self, _: GroundObject) { unreachable!() }
        fn remove_ground_object(&mut self, _: u64) { unreachable!() }
        fn spawn_minion(&mut self, _: MinionSpawn, _: &mut NativeRng, _: &mut dyn NativeCounter) { unreachable!() }
        fn begin_charge(&mut self, _: Charge) { unreachable!() }
        fn yell(&mut self, _: u64, _: &'static str) { unreachable!() }
        fn player_position(&self) -> Position { unreachable!() }
        fn damage_player(&mut self, _: f32, _: u64, _: u32) { unreachable!() }
    }

    #[test]
    fn unordered_visual_times_retain_rows_without_blocking_later_due_rows() {
        let mut pending = PendingActionVisuals(
            [f32::NAN, 1.0, 3.0, 1.0].into_iter().enumerate().map(|(index, at)| Visual {
                source: 100 + index as u64,
                spell: 200 + index as u32,
                at,
                position: Position { x: index as f32, y: 2.0, z: 3.0 },
            }).collect(),
        );
        let mut port = Port::default();
        pending.advance(f32::NAN, &mut port);
        assert!(port.0.is_empty());
        assert_eq!(pending.0.len(), 4);

        pending.advance(1.0, &mut port);
        assert_eq!(port.0.iter().map(|row| row.source_guid).collect::<Vec<_>>(), [101, 103]);
        assert_eq!(pending.0.iter().map(|row| row.source).collect::<Vec<_>>(), [100, 102]);
        assert!(pending.0[0].at.is_nan());
        assert!(matches!(port.0[0].target, CastTarget::Ground(Position { x: 1.0, y: 2.0, z: 3.0 })));

        pending.advance(3.0, &mut port);
        pending.advance(f32::INFINITY, &mut port);
        assert_eq!(port.0.iter().map(|row| row.spell_id).collect::<Vec<_>>(), [201, 203, 202]);
        assert_eq!(pending.0.len(), 1);
        assert_eq!(pending.0[0].source, 100);
        assert!(pending.0[0].at.is_nan());
    }
}

impl Pending {
    pub(super) fn queue_action_visual(&mut self, source: u64, spell: u32, at: f32, position: Position) {
        self.actions.0.push(Visual { source, spell, at, position });
    }

    pub(super) fn dispatch_actions(&mut self, record: &RawBossAbility, context: CombatContext,
        port: &mut impl CombatPort, math: &impl Math) -> bool {
        let actions = match record.words[0] {
            10 => ACTIONS,
            SCHOL_RAID_ACTION => SCHOL_ACTIONS,
            _ => return false,
        };
        match actions[record.words[1] as usize] {
            Action::Cone { spell, range, degrees, windup, factor } => {
                let angle = (context.player.y-context.source.y).atan2(context.player.x-context.source.x);
                // The visual samples the hero's XY. The 0.140.0 dispatcher
                // tries the secondary floor before falling back to player Z.
                let xy = [context.player.x, context.player.y];
                let visual_z = port.primary_height(xy)
                    .or_else(|| if record.words[0] == SCHOL_RAID_ACTION {
                        port.secondary_height(xy)
                    } else {
                        None
                    })
                    .unwrap_or(context.player.z);
                port.raid_block(context.source_guid, windup);
                port.raid_hold_facing(context.source_guid, windup + f32::from_bits(0x3e99999a), angle);
                port.raid_cast(context.source_guid, spell, windup);
                let mut row = Area::danger(context, ground(port, context.source), range, windup,
                    context.effective_damage * factor, port.heroic_rank());
                // Native stores the full radian width, and membership divides
                // it by two; retain the same multiply order and constants.
                row.cone = Some((angle, (degrees * f32::from_bits(0x3c8efa35)) * 0.5));
                self.push(row);
                if spell != 0 {
                    self.actions.0.push(Visual { source: context.source_guid, spell,
                        at: windup + context.now,
                        position: Position {
                            x: (range * math.cos(angle)) * 0.5 + context.source.x,
                            y: (range * math.sin(angle)) * 0.5 + context.source.y,
                            z: visual_z,
                        } });
                }
            }
            Action::Knockback { spell, radius, factor, speed } => {
                let windup = if record.words[0] == SCHOL_RAID_ACTION {
                    SCHOL_KNOCKBACK_WINDUP
                } else {
                    f32::from_bits(0x3fa66666)
                };
                port.raid_block(context.source_guid, windup);
                port.raid_hold(context.source_guid, windup);
                port.raid_cast(context.source_guid, spell, windup);
                let mut row = Area::danger(context, ground(port, context.source), radius, windup,
                    context.effective_damage * factor, port.heroic_rank());
                row.impact_spell = spell;
                row.follow = true;
                row.knockback = speed;
                self.push(row);
            }
            Action::Root { spell, radius, windup, duration, factor } => {
                port.raid_block(context.source_guid, windup);
                port.raid_cast(context.source_guid, spell, windup);
                let mut row = Area::danger(
                    context, ground(port, context.player), radius, windup,
                    context.effective_damage * factor, port.heroic_rank(),
                );
                row.impact_spell = spell;
                row.extra = Some(super::extra::Extra::Root { duration });
                self.push(row);
            }
        }
        true
    }
}
