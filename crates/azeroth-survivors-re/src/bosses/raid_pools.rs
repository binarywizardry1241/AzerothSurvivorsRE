//! Selected 0.109.0 native28 safe-inner-circle / burning outer donut.
//! See docs/analysis/raid-pools-0.109.0.md for producer and periodic contracts.

use super::{Area, Pending, Pool, ground};
use crate::bosses::{RawBossAbility, abilities::{CombatContext, CombatPort}};

impl Pending {
    pub(super) fn dispatch_pool(&mut self, record: &RawBossAbility,
        context: CombatContext, port: &mut impl CombatPort) -> bool {
        let w = record.words;
        if w[0] != 11 { return false; }
        let windup = f32::from_bits(w[3]);
        let lifetime = f32::from_bits(w[4]);
        port.raid_block(context.source_guid, windup);
        port.raid_cast(context.source_guid, w[1], windup);
        let inner = f32::from_bits(w[2]);
        let mut row = Area::danger(context, ground(port, context.player), inner + 40.,
            windup, context.effective_damage * f32::from_bits(w[5]), port.heroic_rank());
        row.inner_radius = Some(inner);
        row.impact_spell = w[1];
        row.pool = Some(Pool { expires: (context.now + windup) + lifetime,
            next_tick: 0., active: false });
        self.push(row);
        port.raid_warning(context.source_guid, crate::bosses::raid_warnings::RaidWarning::BurningGround);
        true
    }
}
