//! SHA-bound 0.97.2 player abilities, upgrades and cast behavior.
//!
//! This is source for the owning gameplay integration. The binary adapter now
//! supplies live actor, clock and world ports; no substitute map is installed here. See docs/analysis/player-abilities-0.97.2.md for native owners,
//! evidence, recovered scope and unresolved integration/parity work.

pub mod catalog;
pub mod damage;
pub mod upgrades;
pub mod behavior;
pub mod visual_scale;

pub use behavior::RuntimeInstance;
pub use catalog::{AbilityDefinition, ClassAbilities, StatusEffect, ABILITIES, CLASSES};

/// Ordered SSE maxss/minss semantics: the second operand wins an unordered
/// comparison or equal signed zero. Do not replace with Rust's NaN-filtering max.
pub(crate) fn native_max(left: f32, right: f32) -> f32 {
    if left > right { left } else { right }
}
pub(crate) fn native_min(left: f32, right: f32) -> f32 {
    if left < right { left } else { right }
}
