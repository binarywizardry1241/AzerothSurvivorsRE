//! Selected 0.105.0 pickup kinds, world descriptors and magnet windows.
//! Native contracts and byte identity: analysis/pickup-effects-0.105.0.md.

use crate::treasure_chests::NativeRng;

/// Fixed proximity threshold shared by hero pickup and Rune-hound selection.
pub const RUNE_PICKUP_RADIUS: f32 = 3.0;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
#[repr(u32)]
pub enum Rune {
    Speed = 3,
    Berserking = 4,
    Restoration = 5,
}

impl Rune {
    pub fn spell(self) -> u32 {
        match self {
            Self::Speed => 23451,
            Self::Berserking => 23505,
            Self::Restoration => 23493,
        }
    }

    pub fn name(self) -> &'static str {
        match self {
            Self::Speed => "Speed",
            Self::Berserking => "Berserking",
            Self::Restoration => "Restoration",
        }
    }

    pub fn duration(self) -> f32 {
        match self {
            Self::Speed => 10.0,
            Self::Berserking => 15.0,
            Self::Restoration => 0.0,
        }
    }

    pub fn descriptor(self) -> (u32, u32, f32) {
        match self {
            Self::Speed => (9006, 5931, 1.0),
            Self::Berserking => (9007, 5995, 1.0),
            Self::Restoration => (9008, 5991, 1.0),
        }
    }
}

/// Primary collectible, then its two noninteractive auxiliary objects.
pub const MAGNET_OBJECTS: [(u32, u32, f32); 3] = [
    (9009, 342, f32::from_bits(0x3fa6_6666)),
    (9010, 3271, 1.0),
    (9011, 2232, f32::from_bits(0x3fcc_cccd)),
];

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct MagnetWindow {
    pub eligible_at: f32,
    pub forced_at: f32,
}

/// Historical deadline fixtures retain their single-float layout. Live
/// selected-target runs use both native window fields through the same ports.
pub trait MagnetSchedule {
    fn first_eligible(&self) -> Option<f32>;
    fn remove_first(&mut self);
}
impl MagnetSchedule for Vec<MagnetWindow> {
    fn first_eligible(&self) -> Option<f32> {
        self.first().map(|window| window.eligible_at)
    }
    fn remove_first(&mut self) {
        self.remove(0);
    }
}
impl MagnetSchedule for Vec<f32> {
    fn first_eligible(&self) -> Option<f32> {
        self.first().copied()
    }
    fn remove_first(&mut self) {
        self.remove(0);
    }
}

/// Begin145919949..145919b24: uniform inclusive2..3 using the original
/// u64 widening/rejection sampler, followed by one float draw per segment.
pub fn magnet_windows(rng: &mut NativeRng, run_seconds: f32) -> Vec<MagnetWindow> {
    let limit = (2_u64 << 62).wrapping_sub(1);
    let count = loop {
        let product = u128::from(rng.next_u64()) * 2;
        if product as u64 <= limit {
            break 2 + (product >> 64) as u32;
        }
    };
    let segment = run_seconds / count as f32;
    (0..count)
        .map(|index| {
            let fraction = rng.range_f32(f32::from_bits(0x3f19_999a), 1.0);
            let eligible_at = index as f32 * segment;
            MagnetWindow {
                eligible_at,
                forced_at: eligible_at + fraction * segment,
            }
        })
        .collect()
}

pub fn flight_duration(from: [f32; 2], to: [f32; 2]) -> f32 {
    let dx = from[0] - to[0];
    let dy = from[1] - to[1];
    ((dx * dx + dy * dy).sqrt() / 40.0).max(0.15)
}

/// The two manual health owners bypass general healing's overheal/pool paths.
pub fn direct_heal(health: &mut f32, maximum: f32, requested: f32) -> f32 {
    let before = *health;
    *health =
        crate::player_abilities::behavior::min_preserving_original_nan(before + requested, maximum);
    *health - before
}

#[cfg(test)]
mod tests {
    use super::*;

    fn fixtures() -> serde_json::Value {
        serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/pickup-effects/native-vectors.json"
        ))
        .unwrap()
    }

    #[test]
    fn magnet_windows_and_shared_rng_match_current_native_instructions() {
        for row in fixtures()["magnet_windows"].as_array().unwrap() {
            let mut rng = NativeRng::new(std::array::from_fn(|i| row["seed"][i].as_u64().unwrap()));
            let actual = magnet_windows(
                &mut rng,
                f32::from_bits(row["run_seconds_bits"].as_u64().unwrap() as u32),
            );
            let actual = actual
                .iter()
                .map(|window| [window.eligible_at.to_bits(), window.forced_at.to_bits()])
                .collect::<Vec<_>>();
            let expected = row["windows"]
                .as_array()
                .unwrap()
                .iter()
                .map(|pair| {
                    [
                        pair[0].as_u64().unwrap() as u32,
                        pair[1].as_u64().unwrap() as u32,
                    ]
                })
                .collect::<Vec<_>>();
            assert_eq!(actual, expected);
            let mut expected = NativeRng::new(std::array::from_fn(|i| {
                row["rng_after"][i].as_u64().unwrap()
            }));
            assert_eq!(rng.next_u64(), expected.next_u64());
        }
    }

    #[test]
    fn direct_per_hit_healing_matches_current_native_clamps() {
        for row in fixtures()["leech_cases"].as_array().unwrap() {
            let f = |key: &str| f32::from_bits(row[key].as_u64().unwrap() as u32);
            let mut health = f("health_bits");
            if f("rate_bits") > 0.0 {
                let actual = direct_heal(&mut health, 100.0, f("damage_bits") * f("rate_bits"));
                assert_eq!(
                    actual.to_bits(),
                    row["actual_bits"].as_u64().unwrap() as u32
                );
            }
            assert_eq!(
                health.to_bits(),
                row["health_after_bits"].as_u64().unwrap() as u32
            );
        }
    }
}
