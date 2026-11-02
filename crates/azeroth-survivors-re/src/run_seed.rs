//! Current process-wide run seed sequence, recovered from 0.109.0.
//! See docs/analysis/run-seed-0.109.0.md for the clock/factory/constructor chain.
//! Current 0.121.0 also derives one immutable local hero identity from the
//! initial process seed; see docs/analysis/ward-target-guid-0.121.0.md.

use bevy::prelude::Resource;
use std::time::{SystemTime, UNIX_EPOCH};

const MULTIPLIER: u64 = 0x5851_f42d_4c95_7f2d;

#[derive(Resource)]
pub(crate) struct RunSeeds {
    state: u64,
    player_guid: u64,
}

impl Default for RunSeeds {
    fn default() -> Self {
        let state = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .map(|elapsed| {
                elapsed.as_secs().wrapping_mul(1000)
                    .wrapping_add(u64::from(elapsed.subsec_millis()))
            })
            .unwrap_or(1);
        Self {
            state,
            player_guid: azeroth_survivors_re::coop::server_party::native_world_identity(state),
        }
    }
}

impl RunSeeds {
    /// Current145b12840 derives this once from the process timestamp. Enter
    /// and Again advance the run RNG without changing the custom roster GUID.
    pub(crate) fn player_guid(&self) -> u64 {
        self.player_guid
    }

    /// Enter and Again advance the same server state exactly once, regardless
    /// of how much randomness the preceding Game consumed.
    pub(crate) fn next(&mut self) -> [u64; 4] {
        self.state = self.state.wrapping_mul(MULTIPLIER)
            .wrapping_add(0x1405_7b7e_f767_814f);
        expand(self.state)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_startup_identity_survives_run_seed_advances() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/../../docs/analysis/evidence/0.121.0/ward-target-guid.json"
        ))).unwrap();
        for row in fixture["seed_cases"].as_array().unwrap() {
            let state = row["seed"].as_u64().unwrap();
            let player_guid = azeroth_survivors_re::coop::server_party::native_world_identity(state);
            let mut seeds = RunSeeds { state, player_guid };
            assert_eq!(seeds.player_guid(), row["player_guid"].as_u64().unwrap());
            for _ in 0..8 {
                seeds.next();
                assert_eq!(seeds.player_guid(), player_guid);
            }
        }
    }
}

/// Current14590c4d0 produces eight little-endian PCG32 words, then the Game
/// consumes their four u64 pairs as its shared xoshiro256++ state.
fn expand(mut seed: u64) -> [u64; 4] {
    let mut words = [0u64; 4];
    for word in &mut words {
        for shift in [0, 32] {
            seed = seed.wrapping_mul(MULTIPLIER)
                .wrapping_add(0xa176_54e4_6fbe_17f3);
            let value = (((seed >> 18) ^ seed) >> 27) as u32;
            *word |= u64::from(value.rotate_right((seed >> 59) as u32)) << shift;
        }
    }
    if words == [0; 4] {
        // Current14590c64f calls SplitMix64 with seed zero in this arm.
        words = [0xe220_a839_7b1d_cdaf, 0x6e78_9e6a_a1b9_65f4,
            0x06c4_5d18_8009_454f, 0xf88b_b8a8_724c_81ec];
    }
    words
}
