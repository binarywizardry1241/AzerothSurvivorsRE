//! Hash-bound 0.109.0 concentric waves (native move tag 27).
//! Producer:145958e3a..145959146; records and checks:
//! docs/analysis/evidence/0.109.0/raid-waves/manifest.json.

use super::{ground, Area, Pending};
use crate::bosses::{abilities::{CombatContext, CombatPort}, RawBossAbility};

#[derive(Clone, Copy)]
struct Wave {
    spell: u32,
    count: u32,
    width: f32,
    windup: f32,
    step: f32,
    damage_factor: f32,
}

// The historical seven-word port cannot fit the six native payload words plus
// its semantic tag and scheduler cooldown. Semantic8 carries this table's
// index; its word6 remains the original scheduler repeat, never damage data.
const WAVES: &[Wave] = &[
// BEGIN NATIVE WAVES
    Wave { spell: 6524, count: 4, width: f32::from_bits(0x40a00000), windup: f32::from_bits(0x3fcccccd), step: f32::from_bits(0x3f4ccccd), damage_factor: f32::from_bits(0x3fcccccd) },
    Wave { spell: 19798, count: 5, width: f32::from_bits(0x40a00000), windup: f32::from_bits(0x3fcccccd), step: f32::from_bits(0x3f333333), damage_factor: f32::from_bits(0x40000000) },
    Wave { spell: 23860, count: 4, width: f32::from_bits(0x40a00000), windup: f32::from_bits(0x3fcccccd), step: f32::from_bits(0x3f4ccccd), damage_factor: f32::from_bits(0x3fe66666) },
    Wave { spell: 21097, count: 4, width: f32::from_bits(0x40a00000), windup: f32::from_bits(0x3fe66666), step: f32::from_bits(0x3f666666), damage_factor: f32::from_bits(0x3fe66666) },
    Wave { spell: 20566, count: 4, width: f32::from_bits(0x40a00000), windup: f32::from_bits(0x3fe66666), step: f32::from_bits(0x3f666666), damage_factor: f32::from_bits(0x3fe66666) },
    Wave { spell: 23860, count: 3, width: f32::from_bits(0x40a00000), windup: f32::from_bits(0x3fc00000), step: f32::from_bits(0x3f333333), damage_factor: f32::from_bits(0x3fb33333) },
    Wave { spell: 19798, count: 3, width: f32::from_bits(0x40a00000), windup: f32::from_bits(0x3fcccccd), step: f32::from_bits(0x3f4ccccd), damage_factor: f32::from_bits(0x3fb33333) },
    Wave { spell: 28884, count: 3, width: f32::from_bits(0x40a00000), windup: f32::from_bits(0x3fcccccd), step: f32::from_bits(0x3f4ccccd), damage_factor: f32::from_bits(0x3fc00000) },
    Wave { spell: 20549, count: 3, width: f32::from_bits(0x40a00000), windup: f32::from_bits(0x3fcccccd), step: f32::from_bits(0x3f4ccccd), damage_factor: f32::from_bits(0x3fc00000) },
// END NATIVE WAVES
];

impl Pending {
    pub(super) fn dispatch_shape(&mut self, record: &RawBossAbility, context: CombatContext,
                                 port: &mut impl CombatPort) -> bool {
        if record.words[0] != 8 { return false; }
        let wave = WAVES[record.words[1] as usize];
        // Native duration uses count, including the first circle, rather than
        // the final ring's zero-based index. The common gate adds its own0.4s.
        port.raid_block(context.source_guid, wave.count as f32 * wave.step + wave.windup);
        port.raid_hold(context.source_guid, wave.windup);
        port.raid_cast(context.source_guid, wave.spell, wave.windup);
        let damage = context.effective_damage * wave.damage_factor;
        // Native creates the initial circle even for a zero-count payload.
        let first_end = (0.0 * wave.step + wave.windup)
            * crate::heroic::warning_factor(port.heroic_rank()) + context.now;
        self.next_id = self.next_id.wrapping_add(1);
        self.rows.push(Area { id: self.next_id, source: context.source_guid,
            center: ground(port, context.source), radius: wave.width, inner_radius: None,
            line: None, cone: None, knockback: 0., pool: None, extra: None,
            tower_group: None, follow_player_until: 0., enemy_damage: 0.,
            impact_spell: wave.spell, damage, start: context.now, end: first_end,
            warning_lead: f32::INFINITY,
            follow: false, published: false });
        let tell_window = (wave.step + wave.step).min(f32::from_bits(0x3fb33333));
        for index in 1..wave.count {
            let end = (wave.step * index as f32 + wave.windup)
                * crate::heroic::warning_factor(port.heroic_rank()) + context.now;
            self.next_id = self.next_id.wrapping_add(1);
            self.rows.push(Area { id: self.next_id, source: context.source_guid,
                center: ground(port, context.source), radius: (index + 1) as f32 * wave.width,
                inner_radius: Some(index as f32 * wave.width),
                line: None, cone: None, knockback: 0., pool: None, extra: None,
            tower_group: None, follow_player_until: 0., enemy_damage: 0., impact_spell: 0, damage,
                start: context.now, end, warning_lead: tell_window, follow: false, published: false });
        }
        true
    }
}
