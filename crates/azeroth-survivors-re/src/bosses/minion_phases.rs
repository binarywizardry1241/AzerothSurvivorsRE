//! Selected health-phase summons plus current 0.109.0 raid phase actions.
//! Current phase gate:14597a520..14597a54a; all nine summon phase records
//! revalidated with docs/analysis/raid-towers-0.109.0.md. Historical summon
//! consumer recovery: docs/analysis/boss-minions-0.108.0.md.

use super::RawBossAbility;

#[derive(Clone, Copy, Debug)]
pub struct PhaseAction {
    pub boss_id: u32,
    pub phase_index: u8,
    pub yell: &'static str,
    pub native_tag: u8,
    pub ability: RawBossAbility,
}

impl PhaseAction {
    pub fn ability(self) -> RawBossAbility { self.ability }

    pub fn blocking(self) -> bool {
        !crate::guardians::signatures::nonblocking(self.native_tag)
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PhaseSummon {
    pub boss_id: u32,
    /// Index in the original complete phase table, including unrecovered moves.
    pub phase_index: u8,
    pub threshold: f32,
    pub count: u32,
    pub yell: &'static str,
}

impl PhaseSummon {
    /// Semantic adapter to the existing summon consumer. Native tag5 and the
    /// historical port's tag2 have the same count/spawn contract, not the same ABI.
    pub fn ability(self) -> RawBossAbility {
        RawBossAbility {
            words: [2, self.count, 0, 0, 0, 0, 0],
        }
    }
}

#[rustfmt::skip]
pub const PHASE_SUMMONS: &[PhaseSummon] = &[
// BEGIN RECOVERED PHASE SUMMONS
    PhaseSummon { boss_id: 694, phase_index: 0, threshold: f32::from_bits(0x3f000000), count: 8, yell: "Fools! Our cause is righteous!" },
    PhaseSummon { boss_id: 894, phase_index: 0, threshold: f32::from_bits(0x3f000000), count: 8, yell: "Gordok strongest! Gordok smash!" },
    PhaseSummon { boss_id: 1392, phase_index: 0, threshold: f32::from_bits(0x3e4ccccd), count: 14, yell: "Ah, I've been waiting for a real challenge!" },
    PhaseSummon { boss_id: 1394, phase_index: 0, threshold: f32::from_bits(0x3f000000), count: 10, yell: "Arise, my champion!" },
    PhaseSummon { boss_id: 1093, phase_index: 0, threshold: f32::from_bits(0x3f000000), count: 12, yell: "Reckless mortals! None may challenge the Sons of the Living Flame!" },
    PhaseSummon { boss_id: 1094, phase_index: 1, threshold: f32::from_bits(0x3e4ccccd), count: 14, yell: "Impossible! Rise, my minions! Serve your master once more!" },
    PhaseSummon { boss_id: 1191, phase_index: 0, threshold: f32::from_bits(0x3f000000), count: 10, yell: "Wave after wave, they will come!" },
    PhaseSummon { boss_id: 1194, phase_index: 0, threshold: f32::from_bits(0x3f000000), count: 14, yell: "Death is close..." },
    PhaseSummon { boss_id: 1494, phase_index: 1, threshold: f32::from_bits(0x3ee66666), count: 14, yell: "Master, I require aid!" },
// END RECOVERED PHASE SUMMONS
];

#[derive(Clone, Debug, Default, PartialEq)]
pub struct PhaseState {
    fired: u32,
}

impl PhaseState {
    /// Both selected phase families share the complete native phase indices.
    /// Collect before recurring admission, then restore original phase order;
    /// all crossed thresholds latch even during a cast or another phase action.
    pub fn take_actions(&mut self, boss_id: u32, health: f32,
        maximum_health: f32) -> Vec<PhaseAction> {
        let denominator = if maximum_health > 1.0 { maximum_health } else { 1.0 };
        let ratio = health / denominator;
        let mut due = Vec::new();
        for phase in PHASE_SUMMONS.iter().filter(|phase| phase.boss_id == boss_id) {
            let bit = 1_u32 << phase.phase_index;
            if self.fired & bit == 0 && ratio < phase.threshold {
                self.fired |= bit;
                due.push(PhaseAction { boss_id, phase_index: phase.phase_index,
                    yell: phase.yell, native_tag: 5, ability: phase.ability() });
            }
        }
        for phase in super::raid_area_catalog::CURRENT_PHASES.iter()
            .filter(|phase| phase.boss_id == boss_id) {
            let bit = 1_u32 << phase.phase_index;
            if self.fired & bit == 0 && ratio < phase.threshold {
                self.fired |= bit;
                due.push(PhaseAction { boss_id, phase_index: phase.phase_index,
                    yell: phase.yell, native_tag: phase.native_tag, ability: phase.ability });
            }
        }
        due.sort_by_key(|phase| phase.phase_index);
        due
    }

    /// Called inside the real admitted actor stage. Fear, stun, death and
    /// escape gates precede this call. Native tag5 is nonblocking, so the
    /// ordinary cast hold and other requests do not suppress these summons.
    /// Strict ratio comparison, original indices/order and the latched bits
    /// prevent repeat waves after healing, including endless boss instances.
    pub fn take_due(
        &mut self,
        boss_id: u32,
        health: f32,
        maximum_health: f32,
    ) -> Vec<&'static PhaseSummon> {
        let denominator = if maximum_health > 1.0 {
            maximum_health
        } else {
            1.0
        };
        let ratio = health / denominator;
        let mut due = Vec::new();
        for phase in PHASE_SUMMONS
            .iter()
            .filter(|phase| phase.boss_id == boss_id)
        {
            let bit = 1_u32 << phase.phase_index;
            if self.fired & bit == 0 && ratio < phase.threshold {
                self.fired |= bit;
                due.push(phase);
            }
        }
        due
    }
}
