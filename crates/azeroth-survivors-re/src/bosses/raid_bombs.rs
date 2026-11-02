//! Current 0.109.0 native30 player bomb; neither a permanent pool nor a ward.
//! Producer/lifecycle: docs/analysis/raid-bombs-0.109.0.md.

use super::{ground, Area, Pending};
use crate::bosses::{RawBossAbility, abilities::{CastTarget, CombatContext, CombatPort, SpellCast}};

impl Pending {
    /// Semantic12 preserves native30's five payload words and repeat timer.
    pub(super) fn dispatch_bomb(&mut self, record: &RawBossAbility,
        context: CombatContext, port: &mut impl CombatPort) -> bool {
        let w = record.words;
        if w[0] != 12 { return false; }
        let windup = f32::from_bits(w[3]);
        port.raid_block(context.source_guid, windup);
        port.raid_cast(context.source_guid, w[1], windup);
        let mut row = Area::danger(context, ground(port, context.player),
            f32::from_bits(w[2]), windup, context.effective_damage * f32::from_bits(w[4]), port.heroic_rank());
        row.impact_spell = w[1];
        row.follow_player_until = (windup + f32::from_bits(0xbfcccccd)).max(0.0) + context.now;
        row.enemy_damage = context.effective_damage * f32::from_bits(w[5]);
        self.push(row);
        // Native publishes the unit visual immediately, independently of the
        // later ground visual and player/enemy damage at the locked center.
        port.cast_spell(SpellCast { source_guid: context.source_guid, spell_id: w[1],
            target: CastTarget::Unit(context.player_guid), hit_targets: vec![context.player_guid] });
        port.raid_warning(context.source_guid, crate::bosses::raid_warnings::RaidWarning::Bomb);
        true
    }
}
