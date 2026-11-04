//! Scholomance's common endpoint clip, recovered at 0.141.0 `0x145fa2d90`.

use super::*;

pub(super) fn polygon(zone: &ZoneDefinition) -> &'static [[f32; 2]] {
    azeroth_survivors_re::floor_recovery::Zone::for_key(zone.key)
        .map_or(&[], |floor| floor.polygon.as_slice())
}

pub(super) fn clip_segment(
    world: &impl ai::World,
    zone: &ZoneDefinition,
    from: Position,
    to: Position,
) -> Position {
    let cross = |[a, b]: [f32; 2], [c, d]: [f32; 2]| a * d - b * c;
    let direction = [to.x - from.x, to.y - from.y];
    let polygon = polygon(zone);
    let mut fraction = 1.0_f32;
    for (&first, &last) in polygon.iter().zip(polygon.iter().cycle().skip(1)) {
        let edge = [last[0] - first[0], last[1] - first[1]];
        let denominator = cross(direction, edge);
        if denominator.abs() < 0.000_001 {
            continue;
        }
        let delta = [first[0] - from.x, first[1] - from.y];
        let along = cross(delta, edge) / denominator;
        let on_edge = cross(delta, direction) / denominator;
        if along > 0.0 && (0.0..=1.0).contains(&on_edge) {
            fraction = fraction.min(along);
        }
    }
    // Scholomance skips the radial-cap branch and combines polygon and occupancy.
    if let Some(ray) = world.ray_fraction(from, to) {
        fraction = fraction.min(ray);
    }
    Position {
        x: direction[0] * fraction + from.x,
        y: direction[1] * fraction + from.y,
        z: from.z,
    }
}
