//! Selected 0.127.0 per-piece star projection and final-star missing-stat bridge.
//! Native owners: 145b85250 (total), 145b84e40 (increment),
//! 145b840e0 / 145d0e1a0 (bridge), and 145cef910 (typed projection).

// Authored f32 tables at 1470725e8 and 147072600. Rarity is the native
// set/tier index, with both faction variants of PvP in index five.
const STEP: [f32; 6] = [0.64, 0.40, 0.28, 0.17, 0.12, 0.15];
const FINAL: [f32; 6] = [3.73, 1.85, 0.85, 0.42, 0.12, 0.22];
const FINAL_TARGET: [f32; 6] = [0.90, 0.92, 0.94, 0.96, 1.0, 0.98];

/// Additional multiplier, before merging the original piece bonuses.
pub fn bonus(rarity: usize, stars: u8) -> f32 {
    let tier = rarity.min(5);
    let ordinary = f32::from(stars.min(4)) * STEP[tier];
    if stars > 4 {
        ordinary + FINAL[tier]
    } else {
        ordinary
    }
}

/// Native purchase-preview difference. Subtract the two f32 totals before
/// multiplying each effect; rounded health differences cannot be substituted.
pub fn increment(rarity: usize, stars: u8) -> f32 {
    if stars == 0 {
        return 0.0;
    }
    bonus(rarity, stars) - bonus(rarity, stars - 1)
}

fn projected(tag: u8, value: f32, factor: f32) -> Option<f32> {
    match tag {
        2 => Some((value * factor).round()),
        0..=10 | 12..=14 => Some(value * factor),
        // The native projector excludes the integer extra-target variant.
        _ => None,
    }
}

pub fn extra_effects(
    base: &[(u8, f32)],
    rarity: usize,
    stars: u8,
    purchase_increment: bool,
    final_star: &[(u8, f32)],
) -> Vec<(u8, f32)> {
    if stars == 0 {
        return Vec::new();
    }
    let factor = if purchase_increment {
        increment(rarity, stars)
    } else {
        bonus(rarity, stars)
    };
    let mut extra: Vec<_> = base
        .iter()
        .filter_map(|&(tag, value)| projected(tag, value, factor).map(|value| (tag, value)))
        .collect();
    if stars > 4 && (!purchase_increment || stars == 5) {
        extra.extend_from_slice(final_star);
    }
    extra
}

/// Preserve the original effects and add the separately projected star rows.
/// In particular, health rounds its bonus before the base is added, and the
/// two f32 operations must not become `base * (1 + bonus)`.
pub fn effects(
    base: &[(u8, f32)],
    rarity: usize,
    stars: u8,
    final_star: &[(u8, f32)],
) -> Vec<(u8, f32)> {
    let mut merged = Vec::<(u8, f32)>::new();
    for (tag, value) in base
        .iter()
        .copied()
        .chain(extra_effects(base, rarity, stars, false, final_star))
    {
        if let Some((_, total)) = merged.iter_mut().find(|(kind, _)| *kind == tag) {
            *total += value;
        } else {
            merged.push((tag, value));
        }
    }
    merged
}

/// The last star adds only tags missing from this armor piece. The reference
/// is the same class and compact slot's Tier 3 piece, with its separately
/// rounded star bonuses merged before the rarity target is applied.
pub fn final_star_effects(
    base: &[(u8, f32)],
    tier3_base: &[(u8, f32)],
    rarity: usize,
    slot: usize,
) -> Vec<(u8, f32)> {
    if rarity == 4 || slot >= 8 {
        return Vec::new();
    }
    // Native folds the Tier 3 ordinary and final factors to these exact bits.
    let reference_bonus = f32::from_bits(0x3f19_9999);
    let mut reference = Vec::<(u8, f32)>::new();
    for (tag, value) in tier3_base
        .iter()
        .copied()
        .chain(tier3_base.iter().filter_map(|&(tag, value)| {
            projected(tag, value, reference_bonus).map(|value| (tag, value))
        }))
    {
        if let Some((_, total)) = reference.iter_mut().find(|(kind, _)| *kind == tag) {
            *total += value;
        } else {
            reference.push((tag, value));
        }
    }
    reference
        .into_iter()
        .filter(|(tag, _)| *tag != 11 && !base.iter().any(|(kind, _)| kind == tag))
        .filter_map(|(tag, value)| {
            projected(tag, value, FINAL_TARGET[rarity.min(5)]).map(|value| (tag, value))
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn final_star_adds_missing_armor_stats_once_and_preserves_existing_tags() {
        let base = [(2, 10.0)];
        let tier3 = [(2, 30.0), (12, f32::from_bits(0x3cac_0831)), (11, 1.0)];
        let bridge = final_star_effects(&base, &tier3, 0, 0);
        assert_eq!(bridge.len(), 1);
        assert_eq!(bridge[0].0, 12);
        let echo = tier3[1].1;
        assert_eq!(
            bridge[0].1.to_bits(),
            ((echo + echo * f32::from_bits(0x3f19_9999)) * 0.90).to_bits()
        );
        assert_eq!(extra_effects(&base, 0, 4, true, &bridge).len(), 1);
        assert_eq!(extra_effects(&base, 0, 5, true, &bridge).len(), 2);
        assert_eq!(extra_effects(&base, 0, 6, true, &bridge), [(2, 0.0)]);
        assert_eq!(effects(&base, 0, 5, &bridge), effects(&base, 0, 6, &bridge));
    }

    #[test]
    fn legendary_armor_and_all_weapons_do_not_borrow_missing_stats() {
        let tier3 = [(2, 30.0), (12, 0.021)];
        assert!(final_star_effects(&[], &tier3, 4, 0).is_empty());
        for tier in 0..6 {
            assert!(final_star_effects(&[], &tier3, tier, 8).is_empty());
        }
    }
}
