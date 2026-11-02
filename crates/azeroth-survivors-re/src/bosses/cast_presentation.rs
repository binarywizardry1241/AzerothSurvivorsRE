//! Selected 0.108.0 raid cast hold, separate from an ordinary mob's cast state.
//! Native owner145950630 freezes movement, extends hold/attack deadlines and
//! emits a stop before145950b00 publishes the timed spell start.

use crate::enemies::ai::{Actor, Movement};

/// Native MAXPS followed by its unordered-result repair retains the previous
/// value when the requested deadline is NaN. A previous NaN accepts a number.
fn extend(previous: f32, requested: f32) -> f32 {
    if requested.is_nan() || previous > requested { previous } else { requested }
}

///145950f4e..145950faa. The native addition order is duration, now, then the
///0.4-second release gap; pre-adding the gap changes rounded boundaries.
pub fn block_until(previous: f32, now: f32, seconds: f32) -> f32 {
    extend(previous, (seconds + now) + 0.4)
}

///14595072e..1459507b9. Height is the primary provider's current sample;
/// failure retains interpolated actor Z. The caller owns the stop packet and
/// shared movement serial. This does not arm the ordinary mob casting flag.
pub fn hold(actor: &mut Actor, hold_until: &mut f32, now: f32, seconds: f32,
            primary_height: Option<f32>) {
    let mut point = actor.movement.position_at(now);
    point.z = primary_height.unwrap_or(point.z);
    actor.movement = Movement { from: point, to: point, started_at: now, duration: 0.0 };
    *hold_until = extend(*hold_until, now + seconds);
    // Native stores the same updated hold deadline at+194, even if an earlier
    // movement refresh had a later deadline.
    actor.next_movement_at = *hold_until;
    actor.attack_delay = extend(actor.attack_delay, seconds + 0.3);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_deadline_extension_preserves_unordered_requests() {
        assert_eq!(extend(5.0, 3.0), 5.0);
        assert_eq!(extend(3.0, 5.0), 5.0);
        assert_eq!(extend(3.0, f32::NAN), 3.0);
        assert_eq!(extend(f32::NAN, 5.0), 5.0);
        assert!(extend(f32::NAN, f32::NAN).is_nan());
    }
}
