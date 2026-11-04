//! Status state, including 0.127.0 shared enemy control from 0x145c68a30.
//! Health/absorb contracts retain their separately recorded native provenance.

use super::{min_preserving_original_nan, RuntimeInstance};
use crate::enemies::{ai::{Actor, Movement, TimedReduction}, Position};
use crate::player_abilities::catalog::StatusEffect;

/// Scale a hit's secondary effect. Native status tables use the instance's
/// talent-duration field for slow/weaken duration, effect multiplier for the
/// single-float variants, and cap enemy damage weakening at 90% (0.139.2).
pub fn scaled_hit_effect(instance: &RuntimeInstance<'_>) -> StatusEffect {
    let mut effect = instance.definition.effect;
    match effect.tag {
        1 => effect.duration *= instance.talent_duration_multiplier,
        2 | 3 | 7 | 8 | 9 => effect.value *= instance.effect_multiplier,
        10 => {
            effect.value = (effect.value * instance.effect_multiplier).min(0.9);
            effect.duration *= instance.talent_duration_multiplier;
        }
        _ => {}
    }
    effect
}

/// Selected0.127.0 145b760b0: strongest timed value plus one future fallback.
/// The native state has two value/deadline pairs, rather than additive stacks.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct StrongestWindow {
    pub active: TimedReduction,
    pub fallback: TimedReduction,
}

impl StrongestWindow {
    pub fn value_at(&self, now: f32) -> f32 {
        if self.active.until > now { self.active.fraction }
        else if self.fallback.until > now { self.fallback.fraction }
        else { 0.0 }
    }
    pub fn advance(&mut self, now: f32) {
        if now >= self.active.until {
            self.active = if now < self.fallback.until {
                self.fallback
            } else { TimedReduction::default() };
            self.fallback = TimedReduction::default();
        }
    }

    pub fn insert(&mut self, now: f32, value: f32, until: f32) {
        self.advance(now);
        let previous = self.active;
        let incoming = TimedReduction { fraction: value, until };
        if now >= self.active.until || value > self.active.fraction
            || (value == self.active.fraction && until > self.active.until)
        {
            self.active = incoming;
        }
        let mut fallback = TimedReduction::default();
        for candidate in [previous, self.fallback, incoming] {
            if candidate.fraction > 0.0 && candidate.until > self.active.until && candidate.until > now
                && (candidate.fraction > fallback.fraction
                    || (candidate.fraction == fallback.fraction && candidate.until > fallback.until))
            {
                fallback = candidate;
            }
        }
        self.fallback = fallback;
    }
}

#[cfg(test)]
mod strongest_window_tests {
    use super::*;

    #[test]
    fn current_native_shout_sequences_keep_the_future_fallback() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.127.0/shouts/native-cases.json"
        )).unwrap();
        for sequence in proof["strongest_sequences"].as_array().unwrap() {
            let mut window = StrongestWindow::default();
            for step in sequence.as_array().unwrap() {
                let f = |index: usize| f32::from_bits(step[index].as_u64().unwrap() as u32);
                window.insert(f(0), f(1), f(2));
                let actual = [window.active.fraction, window.active.until,
                    window.fallback.fraction, window.fallback.until].map(f32::to_bits);
                let expected: Vec<_> = step[3].as_array().unwrap().iter()
                    .map(|value| value.as_u64().unwrap() as u32).collect();
                assert_eq!(actual.as_slice(), expected.as_slice());
            }
        }
    }
}

/// 0.127.0 actor-owned state shared by every caster and control kind.
/// Native +1f4/+1f5 are the elite flag/application byte; +1dc is immunity.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct ControlWindow {
    pub started_at: f32,
    pub immune_until: f32,
    pub applications: u8,
    pub resistant: bool,
    pub polymorph_duration: f32,
    pub elemental_sunder_until: f32,
    /// Current Actor+0x1dc, independent of the ordinary movement slow.
    pub winter_chill_until: f32,
}

impl ControlWindow {
    pub fn elemental_sunder(&self, school: u8, now: f32) -> f32 {
        if matches!(school, 2 | 3) && self.elemental_sunder_until > now { 0.1 } else { 0.0 }
    }

    pub fn for_enemy(resistant: bool) -> Self {
        Self { resistant, ..Self::default() }
    }

    /// The sixth application interrupts all current control and starts immunity.
    /// Expiry of an individual effect does not reset the application count.
    pub fn admit(&mut self, actor: &mut Actor, now: f32, duration: f32) -> Option<f32> {
        if actor.dead || self.immune_until > now { return None; }
        if self.applications >= 5 {
            self.immune_until = now + 8.0;
            self.applications = 0;
            actor.stun_until = min_preserving_original_nan(actor.stun_until, now);
            actor.forced_escape_until = min_preserving_original_nan(actor.forced_escape_until, now);
            actor.fear_until = min_preserving_original_nan(actor.fear_until, now);
            actor.next_movement_at = now;
            return None;
        }
        let index = self.applications as usize;
        self.applications += 1;
        let duration = if self.resistant { duration.min(1.0) } else { duration };
        let duration = if duration > 0.0 { duration } else { 0.0 };
        Some(duration * [1.0, 0.8, 0.6, 0.4, 0.2][index])
    }
}

/// Native AI0x1454c9fe0..1454ca01a. Run before this actor's next decision.
pub fn expire_control(actor: &mut Actor, _window: &mut ControlWindow, now: f32) {
    if actor.stun_until > 0.0 && now >= actor.stun_until {
        actor.stun_until = 0.0;
    }
}

/// Root and stun share this native movement-stop window. Ordinary actors get
/// full duration; metadata-bearing actors retain the native25% multiplier.
/// Elite/boss duration is capped before the common diminishing-return factor.
/// `stopped_at` is the real world's interpolated/height-corrected position.
pub fn apply_control(
    actor: &mut Actor,
    window: &mut ControlWindow,
    ordinary: bool,
    now: f32,
    duration: f32,
    stopped_at: Position,
) -> bool {
    let duration = duration * if ordinary { 1.0 } else { 0.25 };
    let Some(duration) = window.admit(actor, now, duration) else { return false; };
    if now >= actor.stun_until { window.started_at = now; }
    let until = now + duration;
    if actor.stun_until >= until { return false; }
    actor.stun_until = until;
    actor.movement = Movement { from: stopped_at, to: stopped_at, started_at: now, duration: 0.0 };
    true
}

/// Tag1 replaces the slow and deadline. Tag10 uses the caller's actor-owned
/// StrongestWindow; tag4 fear shares the ordinary control admission state.
pub fn apply_actor_reduction_or_fear(
    actor: &mut Actor,
    window: &mut ControlWindow,
    ordinary: bool,
    now: f32,
    effect: StatusEffect,
) -> bool {
    if actor.dead { return false; }
    match effect.tag {
        1 => actor.slow = TimedReduction { fraction: effect.value, until: now + effect.duration },
        4 if ordinary => {
            let Some(duration) = window.admit(actor, now, effect.value) else { return false; };
            let until = now + duration;
            if !(until > actor.forced_escape_until) { return false; }
            actor.forced_escape_until = until;
            actor.next_movement_at = now;
        }
        _ => return false,
    }
    true
}

/// Native player health/absorb state; damage subtraction itself belongs to
/// the canonical player/actor damage pipeline.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Vitals {
    pub health: f32,
    pub maximum_health: f32,
    pub absorb: f32,
    pub absorb_applied_at: f32,
    pub absorb_same_tick_count: u32,
}

impl Vitals {
    /// Native5 uses raw supplied hit power;6 uses maximum health. Returned
    /// amount is actual healing, for the real combat log / field updates.
    pub fn heal_effect(&mut self, effect: StatusEffect, raw_hit_power: f32) -> Option<f32> {
        let requested = match effect.tag {
            5 => raw_hit_power * effect.value,
            6 => self.maximum_health * effect.value,
            _ => return None,
        };
        let previous = self.health;
        //1454ed905 and following unordered mask preserve the original sum.
        self.health = min_preserving_original_nan(self.health + requested, self.maximum_health);
        Some(self.health - previous)
    }

    /// Native7 counts applications at exactly the same run timestamp, caps
    /// that multiplier at5 and retains max(existing,new), rather than adding.
    pub fn absorb_effect(&mut self, now: f32, fraction: f32) {
        self.absorb_same_tick_count = if now == self.absorb_applied_at {
            self.absorb_same_tick_count.wrapping_add(1)
        } else { 1 };
        self.absorb_applied_at = now;
        let requested = fraction * self.maximum_health
            * self.absorb_same_tick_count.min(5) as f32;
        self.absorb = self.absorb.max(requested);
    }
}
