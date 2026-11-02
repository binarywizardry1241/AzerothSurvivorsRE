//! Near-foot floor election shared by the renderer bridge and its fixtures.

pub const STEP_UP: f32 = 1.0;
pub const CLAMP_DOWN: f32 = 4.0;

/// The same vertical window constrains both providers. A cave's ADT surface
/// and an upper WMO storey must never replace the floor around the native Z.
pub fn choose_floor(feet: f32, terrain: Option<f32>, surface: Option<f32>) -> Option<f32> {
    let eligible = |height: &f32| *height <= feet + STEP_UP && *height >= feet - CLAMP_DOWN;
    match (terrain.filter(eligible), surface.filter(eligible)) {
        (Some(terrain), Some(surface)) => Some(terrain.max(surface)),
        (terrain, surface) => terrain.or(surface),
    }
}
