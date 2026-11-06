//! Idle public-directory lifetime: native14587824f, current 0.115.0 target.
//!
//! `off` is the native cooperative-session state, independent of whether a solo
//! run is active. The caller checks that a directory service exists and retains
//! the timestamp of its selected co-op commands. Closing retains the menu's
//! existing status, snapshot and filter selections.

/// Native UCOMISD/JAE admits the exact sixty-second boundary and rejects NaN.
/// The timestamp uses the application's f64 clock, independently of the list's
/// f32 five-second refresh timer and the socket's activity Instant.
pub fn idle_due(off: bool, now: f64, last: f64) -> bool {
    off && now - last >= 60.0
}

/// The primary may still connect at exactly eight seconds. A closed primary
/// needs failure evaluation regardless of its age.
pub fn primary_failed(state: u8, now: f64, started: f64) -> bool {
    state == 2 || (state == 0 && now - started > 8.0)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn only_off_state_reaches_the_exact_idle_deadline() {
        assert!(!idle_due(true, 159.999, 100.0));
        assert!(idle_due(true, 160.0, 100.0));
        assert!(idle_due(true, 160.001, 100.0));
        assert!(!idle_due(false, f64::INFINITY, 100.0));
        assert!(!idle_due(true, 100.0, 160.0));
    }

    #[test]
    fn ordered_native_comparison_preserves_nonfinite_cases() {
        assert!(!idle_due(true, f64::NAN, 0.0));
        assert!(!idle_due(true, 100.0, f64::NAN));
        assert!(!idle_due(true, f64::INFINITY, f64::INFINITY));
        assert!(!idle_due(true, f64::NEG_INFINITY, f64::NEG_INFINITY));
        assert!(idle_due(true, f64::INFINITY, 0.0));
        assert!(idle_due(true, 0.0, f64::NEG_INFINITY));
        assert!(!idle_due(true, f64::NEG_INFINITY, 0.0));
    }
}
