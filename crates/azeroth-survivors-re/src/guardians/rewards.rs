//! Guardian-specific reward inputs recovered from the selected 0.97.2 EXE.
//!
//! Evidence: docs/analysis/guardians.md.
//! The owning Game retains its shared XP, choice queues, pickup creation,
//! localization and account-event consumers. These helpers do not create a
//! replacement loot UI, private RNG or account/save mutation route.

pub const GOLD_PICKUP_KIND: u32 = 1;
pub const MAGNET_PICKUP_KIND: u32 = 6;
pub const GUARDIAN_DEATH_SOUND_ID: u32 = 0x1fee;
pub const GUARDIAN_DEATH_TEXT_KEY: &str = "%s is slain! Its lair yields treasure and its strength, and the other guardians grow stronger.";

/// Queued independently from the subsequent XP and jewelry choices. The
/// native JSON fields are `type: "guardian"` and `name: <localized name>`.
/// The actual account-event owner must serialize and consume this message.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct GuardianAccountEvent<'a> {
    pub event_type: &'static str,
    pub name: &'a str,
}

impl<'a> GuardianAccountEvent<'a> {
    pub const fn new(localized_name: &'a str) -> Self {
        Self {
            event_type: "guardian",
            name: localized_name,
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct GuardianChoiceRequest {
    pub mode: u8,
    pub pause: bool,
    /// Native mode2 passes this to shared jewelry generator1454e1d00.
    /// It is retained without inventing the general generator's semantics.
    pub generation_parameter: f32,
}

pub const GUARDIAN_JEWELRY_CHOICE: GuardianChoiceRequest = GuardianChoiceRequest {
    mode: 2,
    pause: true,
    generation_parameter: 0.25,
};

/// Effects are applied by the actual run owner, in the original death order.
/// Ordinary kill counters, on-kill procs and eventual actor removal remain
/// responsibilities of the shared death owner.
pub trait DeathPort {
    fn announce(&mut self, text_key: &'static str, localized_name: &str);
    fn play_sound(&mut self, sound_id: u32);
    fn account_event(&mut self, event: GuardianAccountEvent<'_>);
    fn create_gold_pickup(&mut self, position: [f32; 3], amount: u32);
    fn attempt_scheduled_magnet(&mut self, position: [f32; 3]);
    fn queue_strength_award(&mut self);
}

pub fn emit_guardian_death(
    kills_after_increment: u32,
    localized_name: &str,
    position: [f32; 3],
    port: &mut impl DeathPort,
) {
    port.announce(GUARDIAN_DEATH_TEXT_KEY, localized_name);
    port.play_sound(GUARDIAN_DEATH_SOUND_ID);
    port.account_event(GuardianAccountEvent::new(localized_name));
    port.create_gold_pickup(position, guardian_gold_amount(kills_after_increment));
    port.attempt_scheduled_magnet(position);
    port.queue_strength_award();
}

/// Actual shared XP callbacks can change level, XP and the run state. A static
/// copy of the initial level is insufficient for several deaths in one tick.
pub trait StrengthPort {
    fn level_and_experience(&self) -> (u32, u32);
    fn add_experience(&mut self, amount: u32);
    fn run_state(&self) -> u8;
    fn suppression_958(&self) -> bool;
}

/// Native 1454aa235 captures and clears the current strength count before the
/// loop. Once admitted, all captured awards run even if XP opens a spell UI.
/// Return the jewelry request only after reevaluating the final native gate.
/// The general jewelry/choice owner handles consumption and modal state.
pub fn drain_strength_awards(
    pending_strength: &mut u32,
    pending_jewelry: &mut u32,
    port: &mut impl StrengthPort,
) -> Option<GuardianChoiceRequest> {
    if *pending_strength == 0 || port.run_state() != 1 {
        return None;
    }
    let count = std::mem::take(pending_strength);
    for _ in 0..count {
        *pending_jewelry = pending_jewelry.wrapping_add(1);
        let (level, experience) = port.level_and_experience();
        port.add_experience(guardian_strength_xp(level, experience));
    }
    guardian_jewelry_ready(*pending_jewelry, port.run_state(), port.suppression_958())
        .then_some(GUARDIAN_JEWELRY_CHOICE)
}

/// The count is Game+664 AFTER its native wrapping increment. Thus the first
/// ordinary guardian kill requests 30 gold, rather than 25. Creation still
/// uses the actual shared pickup helper's clamp, terrain and entity adapters.
pub fn guardian_gold_amount(kills_after_increment: u32) -> u32 {
    kills_after_increment.wrapping_mul(5).wrapping_add(25)
}

/// Exact shared threshold evaluated by pending guardian-strength handling.
/// Separate f32 operations precede CRT roundf; Rust round has the same
/// halfway-away-from-zero rule. The final native conversion saturates to u32.
pub fn level_experience_threshold(level: u32) -> u32 {
    let n = level.saturating_sub(1) as f32;
    let mut quadratic = n * f32::from_bits(0x3eb3_3333);
    quadratic *= n;
    let mut linear = n * 4.0;
    linear += 5.0;
    let total = quadratic + linear;
    total.round() as u32
}

/// For every pending guardian death, request enough XP for the CURRENT level
/// threshold, at least one. The owner must reevaluate level/XP after each
/// actual shared XP callback; level-up can open a spell choice and pause the
/// run before the final guardian-jewelry gate is reached.
pub fn guardian_strength_xp(level: u32, experience: u32) -> u32 {
    level_experience_threshold(level)
        .saturating_sub(experience)
        .max(1)
}

/// Final gate1454aa321..1454aa347, after all captured pending deaths have
/// requested XP. Native Game+958 is supplied as an opaque suppression flag.
pub fn guardian_jewelry_ready(pending: u32, run_state: u8, suppression_958: bool) -> bool {
    pending != 0 && !suppression_958 && run_state == 1
}

/// Native1454c16a0 examines only the shared schedule's FIRST deadline. It
/// draws RNG only when that head is due; a failed draw retains the head.
/// Success removes exactly that first entry and requests a kind6 magnet at
/// death XY+(-2,+1.5), preserving Z. Pickup creation/clamping is caller-owned.
///
/// `draw_unit_24` must consume one draw from the actual shared run RNG, using
/// `(next_u64 >> 40) as f32 * 2^-24`, not a private or reseeded generator.
pub fn attempt_scheduled_magnet(
    deadlines: &mut impl crate::run_pickups::MagnetSchedule,
    now: f32,
    death_position: [f32; 3],
    draw_unit_24: impl FnOnce() -> f32,
) -> Option<[f32; 3]> {
    let deadline = deadlines.first_eligible()?;
    if deadline > now {
        return None;
    }
    if draw_unit_24() >= 0.5 {
        return None;
    }
    deadlines.remove_first();
    Some([
        death_position[0] + -2.0,
        death_position[1] + 1.5,
        death_position[2],
    ])
}

#[cfg(test)]
mod tests {
    use super::*;
    struct XpOwner {
        level: u32,
        xp: u32,
        state: u8,
        awards: Vec<u32>,
    }
    impl StrengthPort for XpOwner {
        fn level_and_experience(&self) -> (u32, u32) {
            (self.level, self.xp)
        }
        fn add_experience(&mut self, amount: u32) {
            self.awards.push(amount);
            self.level += 1;
            self.xp = 0;
            self.state = 2;
        }
        fn run_state(&self) -> u8 {
            self.state
        }
        fn suppression_958(&self) -> bool {
            false
        }
    }
    #[test]
    fn captured_strength_awards_recheck_level_even_after_a_modal_opens() {
        let mut owner = XpOwner {
            level: 1,
            xp: 3,
            state: 1,
            awards: Vec::new(),
        };
        let (mut strength, mut jewelry) = (2, 0);
        assert_eq!(
            drain_strength_awards(&mut strength, &mut jewelry, &mut owner),
            None
        );
        assert_eq!(owner.awards, [2, 9]);
        assert_eq!((strength, jewelry), (0, 2));
        owner.state = 1;
        // The native branch is not re-entered without a new pending death.
        assert_eq!(
            drain_strength_awards(&mut strength, &mut jewelry, &mut owner),
            None
        );
    }
    #[test]
    fn magnet_uses_only_the_due_head_and_consumes_rng_lazily() {
        let mut schedule = vec![50.0, 10.0];
        assert_eq!(
            attempt_scheduled_magnet(&mut schedule, 20.0, [0.0; 3], || panic!("head not due")),
            None
        );
        assert_eq!(
            attempt_scheduled_magnet(&mut schedule, 50.0, [3.0, 4.0, 5.0], || 0.5),
            None
        );
        assert_eq!(schedule, [50.0, 10.0]);
        assert_eq!(
            attempt_scheduled_magnet(&mut schedule, 50.0, [3.0, 4.0, 5.0], || 0.499),
            Some([1.0, 5.5, 5.0])
        );
        assert_eq!(schedule, [10.0]);
    }
}
