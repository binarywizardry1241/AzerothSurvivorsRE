//! Ordinary enemies reconstructed from the hash-bound 0.97.2 executable.
//!
//! Catalogs, scheduling, creation math and actor decisions are source components.
//! Actual world, terrain, pathfinding, packets and spell resolution are required
//! engine boundaries. The binary gameplay adapter supplies their initial live owners.

pub mod ai;
pub mod catalog;
pub mod relocation;
pub mod scaling;
pub mod spawning;
pub mod waves;

pub const TARGET_VERSION: &str = "0.97.2";
pub const TARGET_SHA256: &str =
    "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589";

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Position {
    pub x: f32,
    pub y: f32,
    pub z: f32,
}

impl From<[f32; 3]> for Position {
    fn from([x, y, z]: [f32; 3]) -> Self {
        Self { x, y, z }
    }
}

/// Reuse the run RNG transition; revalidated in the selected enemy creator.
pub use crate::treasure_chests::NativeRng;
