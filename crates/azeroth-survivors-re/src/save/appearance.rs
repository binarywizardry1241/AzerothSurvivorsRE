//! Current0.109.0 optional appearance cache and menu controls.
//! Nullable getter1459a29c0, clamp1459a2280, cycle1459a21a0 and random1459a2790
//! are revalidated in docs/analysis/save-schema-0.109.0.md. Historical evidence
//! remains in docs/analysis/appearance-0.97.2.md.

use std::{
    collections::BTreeMap,
    sync::OnceLock,
    time::{SystemTime, UNIX_EPOCH},
};

pub type AppearanceRanges = BTreeMap<(u8, u8), [u8; 5]>;

static RANGES: OnceLock<AppearanceRanges> = OnceLock::new();

/// The native cache is optional and initialized once after character assets load.
pub fn install_ranges(ranges: AppearanceRanges) {
    let _ = RANGES.set(ranges);
}

/// Missing cache or missing race/sex preserves the stored bytes, including outliers.
pub fn normalize_features(race: u8, sex: u8, features: [u8; 5]) -> [u8; 5] {
    normalize_with_ranges(race, sex, features, RANGES.get())
}

/// Current1459a21a0 first clamps all features, then wraps the selected byte.
pub fn cycle_features(race: u8, sex: u8, features: [u8; 5], index: usize, delta: i8) -> [u8; 5] {
    let mut features = normalize_features(race, sex, features);
    let count = RANGES
        .get()
        .and_then(|ranges| ranges.get(&(race, sex)))
        .map_or(1, |counts| counts[index].max(1));
    features[index] =
        (i16::from(features[index]) + i16::from(delta)).rem_euclid(i16::from(count)) as u8;
    features
}

/// Current1459a2790 reseeds from the current clock for each Randomize action.
pub fn random_features(race: u8, sex: u8) -> [u8; 5] {
    let clock_seed = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|duration| duration.as_nanos() as u64)
        .unwrap_or(7);
    random_from_seed(race, sex, clock_seed)
}

fn random_from_seed(race: u8, sex: u8, clock_seed: u64) -> [u8; 5] {
    let counts = RANGES
        .get()
        .and_then(|ranges| ranges.get(&(race, sex)))
        .copied()
        .unwrap_or([1; 5]);
    let mut seed = clock_seed ^ 0x9e3779b97f4a7c15;
    std::array::from_fn(|i| {
        seed ^= seed << 13;
        seed ^= seed >> 7;
        seed ^= seed << 17;
        (seed % u64::from(counts[i].max(1))) as u8
    })
}

pub fn normalize_with_ranges(
    race: u8,
    sex: u8,
    features: [u8; 5],
    ranges: Option<&AppearanceRanges>,
) -> [u8; 5] {
    let Some(counts) = ranges.and_then(|ranges| ranges.get(&(race, sex))) else {
        return features;
    };
    std::array::from_fn(|i| features[i].min(counts[i].saturating_sub(1)))
}

#[cfg(test)]
mod tests {
    use super::*;

    // Authored from static instructions; intentionally not executed in this session.
    #[test]
    fn optional_counts_preserve_or_bound_each_feature() {
        let features = [200, 3, 9, 0, 255];
        let ranges = BTreeMap::from([((1, 0), [0, 2, 5, 1, 255])]);
        assert_eq!(normalize_with_ranges(1, 0, features, None), features);
        assert_eq!(
            normalize_with_ranges(2, 0, features, Some(&ranges)),
            features
        );
        assert_eq!(
            normalize_with_ranges(1, 0, features, Some(&ranges)),
            [0, 1, 4, 0, 254]
        );
    }
}
