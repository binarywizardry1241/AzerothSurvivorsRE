//! Primary boss placement revalidated against0.112.0 creator14593b0f0.
//! See docs/analysis/raid-boss-lifecycle-0.112.0.md.
//! Fixed points exist only for Scarlet Monastery and Naxxramas.
use super::catalog::{spawn_points, ZoneDefinition};
use super::{NativeRng, Position};
use crate::enemies::spawning::{resolved_height, sample_position_with_distances, PlacementMath, Terrain};

pub const POINT_MINIMUM_DISTANCE: f32 = 20.0;

pub fn admit_distance(distance: f32) -> bool {
    distance >= POINT_MINIMUM_DISTANCE
}

/// Current1459cbf00 accepts equality and refuses unordered distances.
pub fn admitted_points(points: &[[f32; 2]], player: Position,
                       math: &mut impl PlacementMath) -> Vec<usize> {
    points.iter().enumerate().filter_map(|(index, point)| {
        admit_distance(math.hypot(point[0] - player.x, point[1] - player.y))
            .then_some(index)
    }).collect()
}

/// Native multiply/reject point draw, including its draw for one candidate.
pub fn uniform_point(count: usize, rng: &mut NativeRng) -> usize {
    assert!(count != 0);
    let count = count as u64;
    let zone = count.wrapping_shl(count.leading_zeros()).wrapping_sub(1);
    loop {
        let product = u128::from(rng.next_u64()) * u128::from(count);
        if product as u64 <= zone { return (product >> 64) as usize; }
    }
}

/// Current14593b48d retains the greatest total-ordered distance; ties
/// choose the later point. The native rule is farthest, not nearest.
pub fn farthest_point(points: &[[f32; 2]], player: Position,
                      math: &mut impl PlacementMath) -> usize {
    assert!(!points.is_empty());
    let mut selected = 0;
    for index in 1..points.len() {
        let current = points[selected];
        let candidate = points[index];
        let current = math.hypot(current[0] - player.x, current[1] - player.y);
        let candidate = math.hypot(candidate[0] - player.x, candidate[1] - player.y);
        if prefer_later_distance(current, candidate) { selected = index; }
    }
    selected
}

pub fn prefer_later_distance(current: f32, candidate: f32) -> bool {
    current.total_cmp(&candidate) != std::cmp::Ordering::Greater
}

/// Resolve an actual boss placement using its native zone point table, the
/// owning run RNG and real terrain. No population-cap or invented retry gate.
pub fn sample_position(zone: &ZoneDefinition, player: Position, player_velocity: [f32; 2],
                       rng: &mut NativeRng, terrain: &mut impl Terrain,
                       math: &mut impl PlacementMath) -> Position {
    let points = spawn_points(zone.key);
    let admitted = admitted_points(points, player, math);
    let index = if !admitted.is_empty() {
        Some(admitted[uniform_point(admitted.len(), rng)])
    } else if matches!(zone.key, "sm" | "naxx") {
        Some(farthest_point(points, player, math))
    } else { None };
    match index {
        Some(index) => {
            let point = points[index];
            Position { x: point[0], y: point[1], z: resolved_height(terrain, point) }
        }
        None => sample_position_with_distances(zone.center, zone.radius, player, player_velocity,
                                               0.0, 24.0, 28.0, rng, terrain, math),
    }
}
