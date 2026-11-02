//! Guardian homes recovered from 0.97.2 `1454b22ba..1454b37dc`.
//!
//! Native terrain providers remain an engine responsibility. This module does
//! not replace missing ADT/WMO or collision data with generated terrain.

use super::{catalog::ZoneDefinition, Position};

/// World queries needed by the original placement algorithm.
pub trait LairTerrain {
    /// The ADT height query (`1454627f0`); `None` means no sample.
    fn adt_height(&self, x: f32, y: f32) -> Option<f32>;
    /// WMO fallback query (`145467bf0`), used for explicit/fallback homes.
    fn wmo_height(&self, x: f32, y: f32) -> Option<f32>;
    /// The original map fallback height at world object +0x90.
    fn fallback_height(&self) -> f32;
    /// Native blocked-grid lookup. Missing grid and coordinates outside its
    /// bounds are unblocked; the adapter must preserve that behavior.
    fn blocked_at(&self, x: f32, y: f32) -> bool;
}

fn height<T: LairTerrain + ?Sized>(terrain: &T, x: f32, y: f32) -> f32 {
    terrain
        .adt_height(x, y)
        .or_else(|| terrain.wmo_height(x, y))
        .unwrap_or_else(|| terrain.fallback_height())
}

/// Four homes in slot order. Enemy selection and the run-mode gate happen in
/// the caller. No home is randomly sampled by this algorithm.
pub fn make_lair_positions<T: LairTerrain + ?Sized>(
    zone: &ZoneDefinition,
    terrain: &T,
) -> [Position; 4] {
    let center_x = zone.center[0];
    let center_y = zone.center[1];
    let center_z = height(terrain, center_x, center_y);
    let radius = zone.guardian_radius.unwrap_or(zone.radius);

    std::array::from_fn(|slot| {
        if let Some(point) = zone
            .guardian_points
            .iter()
            .find(|point| point.index == slot)
        {
            return Position {
                x: point.xy[0],
                y: point.xy[1],
                z: height(terrain, point.xy[0], point.xy[1]),
            };
        }

        // Preserve instruction order and the exact f32 constants in the EXE.
        let angle = zone.placement_angle
            + f32::from_bits(0x3f49_0fdb)
            + (slot as f32 * f32::from_bits(0x40c9_0fdb)) * 0.25;
        let direction = [angle.cos(), angle.sin()];
        for fraction in [0.7_f32, 0.62, 0.54, 0.46, 0.38] {
            let distance = fraction * radius;
            let x = direction[0] * distance + center_x;
            let y = direction[1] * distance + center_y;
            let blocked = (-2..=2)
                .any(|dx| (-2..=2).any(|dy| terrain.blocked_at(x + dx as f32, y + dy as f32)));
            if blocked {
                continue;
            }
            if let Some(z) = terrain.adt_height(x, y) {
                if (z - center_z).abs() < 30.0 {
                    return Position { x, y, z };
                }
            }
        }

        // After all five candidates fail the original accepts this half-radius
        // home without repeating the blocked-grid or height-difference test.
        let fallback_radius = 0.5 * radius;
        let x = direction[0] * fallback_radius + center_x;
        let y = direction[1] * fallback_radius + center_y;
        Position {
            x,
            y,
            z: height(terrain, x, y),
        }
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    struct Terrain {
        adt: Option<f32>,
        wmo: Option<f32>,
        blocked: bool,
    }

    impl LairTerrain for Terrain {
        fn adt_height(&self, _: f32, _: f32) -> Option<f32> {
            self.adt
        }
        fn wmo_height(&self, _: f32, _: f32) -> Option<f32> {
            self.wmo
        }
        fn fallback_height(&self) -> f32 {
            -123.0
        }
        fn blocked_at(&self, _: f32, _: f32) -> bool {
            self.blocked
        }
    }

    #[test]
    fn missing_adt_uses_half_radius_fallback_and_wmo_height() {
        let zone = ZoneDefinition::by_key("elwynn").unwrap();
        let positions = make_lair_positions(
            zone,
            &Terrain {
                adt: None,
                wmo: Some(42.0),
                blocked: false,
            },
        );
        let radius = zone.guardian_radius.unwrap_or(zone.radius) * 0.5;
        for position in positions {
            let distance = ((position.x - zone.center[0]).powi(2)
                + (position.y - zone.center[1]).powi(2))
            .sqrt();
            assert!((distance - radius).abs() < 0.001);
            assert_eq!(position.z, 42.0);
        }
    }

    #[test]
    fn blocked_candidates_fall_back_instead_of_inventing_a_valid_home() {
        let zone = ZoneDefinition::by_key("elwynn").unwrap();
        let positions = make_lair_positions(
            zone,
            &Terrain {
                adt: Some(6.0),
                wmo: None,
                blocked: true,
            },
        );
        let expected = 0.5 * zone.guardian_radius.unwrap_or(zone.radius);
        for position in positions {
            assert!(
                ((position.x - zone.center[0]).hypot(position.y - zone.center[1]) - expected).abs()
                    < 0.001
            );
        }
    }

    #[test]
    fn first_valid_radius_is_seventy_percent() {
        let zone = ZoneDefinition::by_key("elwynn").unwrap();
        let positions = make_lair_positions(
            zone,
            &Terrain {
                adt: Some(6.0),
                wmo: None,
                blocked: false,
            },
        );
        let expected = 0.7 * zone.guardian_radius.unwrap_or(zone.radius);
        assert!(
            ((positions[0].x - zone.center[0]).hypot(positions[0].y - zone.center[1]) - expected)
                .abs()
                < 0.001
        );
    }
}
