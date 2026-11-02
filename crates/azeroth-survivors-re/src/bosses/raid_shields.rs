//! Current native23 shields and the shared boss/guardian defense multiplier.
//! Native actor+1cc/1d0 are deadlines, independent of player armor/absorb.

use super::{abilities::{CastTarget, CombatContext, CombatPort, SpellCast}, RawBossAbility};

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct RaidDefense {
    pub shield_until: f32,
    pub exposed_until: f32,
}

impl RaidDefense {
    /// Native23 overwrites its deadline; it does not extend an older shield.
    pub fn protect(&mut self, deadline: f32) { self.shield_until = deadline; }
    /// The native guardian leash lane clears only the shield deadline. It
    /// omits exposure and leaves queued aura removals with their old owner.
    pub fn reset(&mut self) { self.shield_until = 0.0; }
    /// Actor-damage1459719bc..1a03: exposure takes precedence. The caller
    /// admits only a primary boss/guardian; ordinary actors retain factor1.
    pub fn multiplier(&self, now: f32) -> f32 {
        self.multiplier_with_ward(now, false)
    }
    pub fn multiplier_with_ward(&self, now: f32, ward: bool) -> f32 {
        if self.exposed_until > now { 1.5 }
        else if self.shield_until > now || ward { 0.25 }
        else { 1.0 }
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Removal { pub source: u64, pub spell: u32, pub at: f32 }

#[derive(Clone, Copy)]
struct Shield { spell: u32, seconds: f32 }

#[rustfmt::skip]
const SHIELDS: &[Shield] = &[
// BEGIN NATIVE SHIELDS
    Shield { spell: 25176, seconds: f32::from_bits(0x41a00000) },
    Shield { spell: 22812, seconds: f32::from_bits(0x40800000) },
    Shield { spell: 642, seconds: f32::from_bits(0x40800000) },
    Shield { spell: 20619, seconds: f32::from_bits(0x40800000) },
    Shield { spell: 642, seconds: f32::from_bits(0x40800000) },
// END NATIVE SHIELDS
];

/// The returned native37 removal belongs in the SAME insertion-ordered queue
/// as native35 movement, before hazard resolution. No cast/hold/action block:
/// native23 is explicitly nonblocking in the current admission mask.
pub fn dispatch(record: &RawBossAbility, context: CombatContext,
    port: &mut impl CombatPort) -> Option<Removal> {
    if record.words[0] != 14 { return None; }
    let shield = SHIELDS[record.words[1] as usize];
    Some(dispatch_payload(shield.spell, shield.seconds, context, port))
}

/// Root and recursively referenced native23 payloads share the same visual,
/// aura, warning and removal order even when only a child uses the payload.
pub(crate) fn dispatch_payload(spell: u32, seconds: f32, context: CombatContext,
    port: &mut impl CombatPort) -> Removal {
    let shield = Shield { spell, seconds };
    let at = context.now + shield.seconds;
    port.raid_protect(context.source_guid, at);
    port.raid_aura(context.source_guid, shield.spell, true);
    port.cast_spell(SpellCast { source_guid: context.source_guid, spell_id: shield.spell,
        target: CastTarget::None, hit_targets: Vec::new() });
    port.raid_warning(context.source_guid, super::raid_warnings::RaidWarning::Shielded);
    Removal { source: context.source_guid, spell: shield.spell, at }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_deadline_comparisons_and_exposure_precedence() {
        let mut state=RaidDefense {shield_until:20.,exposed_until:15.};
        assert_eq!(state.multiplier(14.999),1.5);
        assert_eq!(state.multiplier(15.),0.25);
        assert_eq!(state.multiplier(20.),1.);
        state.protect(12.);assert_eq!(state.shield_until,12.);
        state.shield_until=f32::NAN;state.exposed_until=f32::NAN;
        assert_eq!(state.multiplier(10.),1.);
        state.exposed_until=15.;state.reset();
        assert_eq!(state,RaidDefense {shield_until:0.,exposed_until:15.});
    }
}
