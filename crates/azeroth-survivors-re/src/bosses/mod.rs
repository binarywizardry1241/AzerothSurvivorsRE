//! Scheduled primary bosses recovered from the selected 0.97.2 executable.
//! Source components require real actor/world/spell/packet/game-state adapters.
//! See docs/analysis/bosses-0.97.2.md; no playable world is supplied here.

pub mod abilities;
pub mod ai;
pub mod catalog;
pub mod cast_presentation;
pub mod death;
pub mod minion_phases;
pub mod placement;
pub mod prediction;
pub mod raid_area_catalog;
pub mod raid_native_catalog;
pub mod raid_transforms;
pub mod raid_areas;
pub mod raid_shields;
pub mod raid_sequences;
pub mod raid_wards;
pub mod raid_warnings;
pub mod scaling;
pub mod scripted_attack_geometry;
pub mod spawning;

pub use crate::enemies::{NativeRng, Position};
pub use catalog::{BossDefinition, RawBossAbility};

pub const TARGET_VERSION: &str = "0.97.2";
pub const TARGET_SHA256: &str =
    "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589";
