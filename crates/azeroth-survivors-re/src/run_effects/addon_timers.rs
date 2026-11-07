//! 0.115.0 AZSTIMERS row selection, native owner1459721c0.
//!
//! The native switch and arithmetic back the timer contract in docs/addon-api.md. This projection
//! reads the live generic-effect slots without advancing any gameplay clock.

use super::EffectRow;
use crate::player_abilities::native_max;

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Timer {
    /// Original generic-effect ordinal, including skipped non-timer rows.
    pub index: usize,
    pub kind: &'static str,
    pub ready: f32,
    pub wait: f32,
}

/// Native raw34 uses MAXSS followed by a NaN-selection mask. Unlike raw32's
/// plain MAXSS, a NaN minimum restores the multiplied first operand. Equal
/// values, including opposite signed zeroes, retain the second operand.
fn build_wait(multiplied: f32, minimum: f32) -> f32 {
    let maximum = native_max(multiplied, minimum);
    if maximum.is_nan() { multiplied } else { maximum }
}

/// Current generic rows retain talent/amulet order and their original indices.
/// Missing deadline slots read as zero; missing or zero activity makes raw34
/// ready at `now`. Tag19 always uses the separate shared lethal-protection
/// deadline. Its wait is deliberately not subject to the positive-wait gate.
///
/// `ready` remains an absolute run-clock timestamp. The native wire formatter,
/// rather than this selector, clamps it to zero. No remaining-time conversion
/// or ready-versus-now clamp belongs here.
pub fn collect(
    rows: &[EffectRow],
    deadlines: &[f32],
    counters: &[u32],
    cooldown: f32,
    now: f32,
    lethal_ready: f32,
    supremacy: bool,
) -> Vec<Timer> {
    rows.iter().enumerate().filter_map(|(index, row)| {
        // The source stores current demon effects behind a semantic marker;
        // the native generic vector retains their raw32/raw34 discriminants.
        let tag = match row.tag() {
            253 if matches!(row.bytes[63], 32 | 34) => row.bytes[63],
            253 => return None,
            tag => tag,
        };
        let deadline = || deadlines.get(index).copied().unwrap_or(0.0);
        let (kind, ready, wait) = match tag {
            0 | 16 | 17 => {
                let wait = row.float(8);
                if !(wait > 0.0) { return None; }
                ("cooldown", deadline(), wait)
            }
            10 => {
                let wait = row.float(4);
                if !(wait > 0.0) { return None; }
                ("cooldown", deadline(), wait)
            }
            19 => ("cooldown", lethal_ready, row.float(4)),
            32 => {
                let wait = if supremacy { 12.0 }
                    else { native_max(row.float(4) * cooldown, 4.0) };
                ("summon", deadline(), wait)
            }
            34 => {
                let wait = build_wait(row.float(8) * cooldown, row.float(12));
                let ready = if counters.get(index).is_some_and(|count| *count != 0) {
                    deadline() + wait
                } else { now };
                ("summon", ready, wait)
            }
            _ => return None,
        };
        Some(Timer { index, kind, ready, wait })
    }).collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn effect(tag: u8, at4: f32, at8: f32, at12: f32) -> EffectRow {
        let mut bytes = [0; 64];
        if matches!(tag, 32 | 34) {
            bytes[0] = 253;
            bytes[63] = tag;
        } else {
            bytes[0] = tag;
        }
        for (offset, value) in [(4, at4), (8, at8), (12, at12)] {
            bytes[offset..offset + 4].copy_from_slice(&value.to_le_bytes());
        }
        EffectRow { bytes, strings: &[], lists: &[] }
    }

    #[test]
    fn native_switch_keeps_generic_ordinals_duplicates_and_shared_lethal_clock() {
        let rows = [effect(26, 3.0, 0.0, 0.0), effect(0, 0.0, 2.0, 0.0),
            effect(16, 0.0, 3.0, 0.0), effect(17, 0.0, 4.0, 0.0),
            effect(10, 5.0, 0.0, 0.0), effect(19, 0.0, 0.0, 0.0),
            effect(19, -1.0, 0.0, 0.0), effect(0, 0.0, 2.0, 0.0)];
        let result = collect(&rows, &[91.0, -2.0, 12.0, 13.0, 14.0, 95.0, 96.0],
            &[], 0.1, 40.0, -7.0, false);
        assert_eq!(result, vec![
            Timer { index: 1, kind: "cooldown", ready: -2.0, wait: 2.0 },
            Timer { index: 2, kind: "cooldown", ready: 12.0, wait: 3.0 },
            Timer { index: 3, kind: "cooldown", ready: 13.0, wait: 4.0 },
            Timer { index: 4, kind: "cooldown", ready: 14.0, wait: 5.0 },
            Timer { index: 5, kind: "cooldown", ready: -7.0, wait: 0.0 },
            Timer { index: 6, kind: "cooldown", ready: -7.0, wait: -1.0 },
            Timer { index: 7, kind: "cooldown", ready: 0.0, wait: 2.0 },
        ]);
    }

    #[test]
    fn ordinary_cooldowns_reject_zero_negative_and_unordered_waits_only() {
        for tag in [0, 10, 16, 17] {
            for wait in [f32::NEG_INFINITY, -1.0, -0.0, 0.0, f32::NAN,
                f32::MIN_POSITIVE, 1.0, f32::INFINITY] {
                let row = effect(tag, wait, wait, 0.0);
                let result = collect(&[row], &[], &[], 1.0, 20.0, 30.0, false);
                assert_eq!(!result.is_empty(), wait > 0.0, "tag={tag} wait={wait}");
                if let Some(timer) = result.first() {
                    assert_eq!(timer.wait.to_bits(), wait.to_bits());
                    assert_eq!(timer.ready.to_bits(), 0.0_f32.to_bits());
                }
            }
        }
        let row = effect(19, f32::NAN, 0.0, 0.0);
        let result = collect(&[row], &[], &[], 1.0, 20.0, f32::NAN, false);
        assert_eq!(result.len(), 1);
        assert!(result[0].wait.is_nan() && result[0].ready.is_nan());
    }

    #[test]
    fn legion_gate_uses_plain_maxss_and_equipped_supremacy() {
        for (base, cooldown, expected) in [
            (4.0, 0.1, 4.0), (4.0, 2.0, 8.0),
            (f32::NAN, 1.0, 4.0), (4.0, f32::NAN, 4.0),
            (f32::NEG_INFINITY, 1.0, 4.0), (f32::INFINITY, 1.0, f32::INFINITY),
        ] {
            let row = effect(32, base, 0.0, 0.0);
            let result = collect(&[row.clone()], &[-5.0], &[], cooldown, 40.0, 0.0, false);
            assert_eq!(result[0].kind, "summon");
            assert_eq!(result[0].ready, -5.0);
            assert_eq!(result[0].wait.to_bits(), expected.to_bits());
            let special = collect(&[row], &[], &[], cooldown, 40.0, 0.0, true);
            assert_eq!((special[0].ready, special[0].wait), (0.0, 12.0));
        }
    }

    #[test]
    fn recurring_builds_use_activity_and_missing_slots_without_clamping() {
        let rows = [effect(34, 20.0, 30.0, 13.0), effect(34, 20.0, 30.0, 13.0)];
        let inactive = collect(&rows, &[10.0], &[0], 0.1, 40.0, 0.0, false);
        assert_eq!((inactive[0].ready, inactive[1].ready), (40.0, 40.0));
        let active = collect(&rows, &[-20.0], &[u32::MAX, 1], 0.1, 40.0, 0.0, false);
        assert_eq!((active[0].ready, active[1].ready), (-7.0, 13.0));
        assert_eq!((active[0].wait, active[1].wait), (13.0, 13.0));
    }

    #[test]
    fn recurring_build_max_preserves_nan_selection_and_second_operand_ties() {
        let nan = f32::from_bits(0x7fc0_1234);
        for (base, minimum, expected) in [
            (nan, 13.0, 13.0), (30.0, nan, 30.0), (nan, nan, nan),
            (0.0, -0.0, -0.0), (-0.0, 0.0, 0.0),
        ] {
            let row = effect(34, 20.0, base, minimum);
            let result = collect(&[row], &[], &[], 1.0, 40.0, 0.0, false);
            assert_eq!(result[0].wait.to_bits(), expected.to_bits());
            assert_eq!(result[0].ready, 40.0);
        }
    }
}
