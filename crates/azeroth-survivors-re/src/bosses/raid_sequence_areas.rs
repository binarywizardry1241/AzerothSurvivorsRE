//! Current native24 drifting circles, using the shared periodic hazard owner.
use super::{Area, Pending, ground};
use crate::{bosses::{abilities::{CombatContext,CombatPort},raid_native_catalog::ACTIONS,
    Position,RawBossAbility},enemies::ai::Math};

impl Pending {
    pub(super) fn dispatch_sequences(&mut self, record: &RawBossAbility, c: CombatContext,
        port: &mut impl CombatPort, math: &impl Math) -> bool {
        if record.words[0] != 16 { return false; }
        let action = &ACTIONS[record.words[1] as usize];
        if action.native_tag != 24 { return false; }
        port.raid_block(c.source_guid, action.blocking_duration());
        let w = action.words;
        let f = |i: usize| f32::from_bits(w[i]);
        port.raid_cast(c.source_guid, w[0], 1.0);
        let middle = (w[1] as f32 - 1.0) * 0.5;
        let aim = (c.player.y-c.source.y).atan2(c.player.x-c.source.x);
        let expires = (c.now + 1.0) + f(4);
        // The first circle is constructed even for a zero-count native row.
        for index in 0..w[1].max(1) {
            let angle = (index as f32 - middle) * f32::from_bits(0x3f99999a) + aim;
            let point = Position { x: math.cos(angle)*3.0+c.source.x,
                y: math.sin(angle)*3.0+c.source.y, z: c.source.z };
            let mut row = Area::danger(c, ground(port,point), f(2), 1.0,
                c.effective_damage*f(5), port.heroic_rank());
            row.impact_spell = w[0];
            self.push_periodic(row, expires, 0.5, 0.0, f(3));
        }
        true
    }
}
