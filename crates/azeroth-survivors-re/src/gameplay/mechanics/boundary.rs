//! 0.105.0 red perimeter pillars: Begin 145919c2f and creator 145944080.
//! The native creator is shared with Lightwell; its existing profile-driven
//! constructor supplies the same fields, shared serial and random orientation.

use super::*;
use azeroth_survivors_re::{
    floor_recovery::Zone,
    player_abilities::behavior::passive_tick::{LightwellSpawn, lightwell_object},
};

/// Shared 0.110.0 floor inputs include WSG's 38 vertices and SM's twelve.
/// Current native sampling is bound by ground-navigation-0.110.0.md.
fn samples(zone: &Zone) -> Vec<[f32; 2]> {
    let mut points = Vec::new();
    if !zone.polygon.is_empty() {
        for (index, &from) in zone.polygon.iter().enumerate() {
            let to = zone.polygon[(index + 1) % zone.polygon.len()];
            let dx = to[0] - from[0];
            let dy = to[1] - from[1];
            let count = (dx.hypot(dy) / 12.0).ceil().max(1.0) as usize;
            for index in 0..count {
                let fraction = index as f32 / count as f32;
                points.push([dx * fraction + from[0], dy * fraction + from[1]]);
            }
        }
    } else {
        let radius = zone.radius + 10.0;
        let tau = f32::from_bits(0x40c9_0fdb);
        let count = (tau * radius / 12.0).ceil() as usize;
        for index in 0..count {
            let angle = (index as f32 * tau) / count as f32;
            points.push([
                angle.cos() * radius + zone.center[0],
                angle.sin() * radius + zone.center[1],
            ]);
        }
    }
    points
}

fn placement(zone: &Zone, xy: [f32; 2], world: &mut impl Terrain) -> Option<Position> {
    let z = match world.height(xy) {
        Some(height) => height,
        None if zone.indoor => return None,
        // The outdoor branch repeats the primary query before the secondary
        // cache and final terrain fallback. An indoor missing floor is omitted.
        None => world
            .height(xy)
            .or_else(|| world.secondary_height(xy))
            .unwrap_or_else(|| world.fallback_height()),
    };
    if zone.indoor {
        let dx = zone.center[0] - xy[0];
        let dy = zone.center[1] - xy[1];
        let length = dx.hypot(dy).max(0.01);
        // Check one unit inward; the pillar itself stays at the sampled point.
        if let Some(grid) = world.blocked_grid() {
            let x = (dx / length + xy[0]) - grid.origin[0];
            let y = (dy / length + xy[1]) - grid.origin[1];
            if x >= 0.0 && y >= 0.0 {
                let col = x as usize;
                let row = y as usize;
                if col < grid.side && row < grid.side && grid.cells[row * grid.side + col] != 0 {
                    return None;
                }
            }
        }
    }
    Some(Position {
        x: xy[0],
        y: xy[1],
        z,
    })
}

impl Mechanics {
    pub(super) fn begin_boundary(&mut self, world: &mut impl Terrain) {
        if self.boundary_started {
            return;
        }
        let Some(zone) = Zone::for_key(self.zone.key) else {
            return;
        };
        self.boundary_started = true;
        for xy in samples(zone) {
            let Some(center) = placement(zone, xy, world) else {
                continue;
            };
            let object = lightwell_object(
                LightwellSpawn {
                    center,
                    entry: 9013,
                    display: 4831,
                    scale: 1.0,
                    native_kind: 5,
                    native_flags: 16,
                },
                &mut self.counter,
                &mut self.rng,
                f32::sin,
                f32::cos,
            );
            // Current0.123.0 Begin retains every returned GUID in Game+a10.
            // Again's collector needs this identity after creation is delivered.
            self.boundary_objects.push(object.guid);
            self.events.push(RunEvent::BoundaryPillar(object));
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    fn fixtures() -> Value {
        serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/boundary-pillars/native-fixtures.json"
        ))
        .unwrap()
    }

    #[test]
    fn all_twelve_shapes_follow_current_native_points() {
        let current: Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/ground-navigation/native-cases.json"
        )).unwrap();
        assert_eq!(current["target_sha256"], "e069bf3152f8d8f7160d66388907fc181c733bd170aa150d3b7ff7adf251e048");
        for row in current["boundary_shapes"].as_array().unwrap() {
            let zone = Zone::for_key(row["zone"].as_str().unwrap()).unwrap();
            let actual = samples(zone);
            let expected = row["points"].as_array().unwrap();
            assert_eq!(actual.len(), expected.len(), "{}", zone.key);
            for (point, expected) in actual.iter().zip(expected) {
                for axis in 0..2 {
                    // Host libm is not a Windows CRT bit-parity claim. Two
                    // milliyards covers a world-coordinate f32 rounding step.
                    assert!((point[axis] - expected[axis].as_f64().unwrap() as f32).abs() <= 0.002);
                }
            }
        }
    }

    struct Floor {
        primary: Option<f32>,
        secondary: Option<f32>,
        grid: Option<[f32; 2]>,
        queries: usize,
        cells: [u8; 16],
    }
    impl Terrain for Floor {
        fn height(&mut self, _: [f32; 2]) -> Option<f32> {
            self.queries += 1;
            self.primary
        }
        fn secondary_height(&mut self, _: [f32; 2]) -> Option<f32> {
            self.secondary
        }
        fn fallback_height(&self) -> f32 {
            50.0
        }
        fn blocked_grid(&self) -> Option<spawning::BlockedGrid<'_>> {
            self.grid.map(|origin| spawning::BlockedGrid {
                origin,
                side: 4,
                cells: &self.cells,
            })
        }
        fn path_grid(&self) -> Option<spawning::PathGrid<'_>> {
            None
        }
    }

    #[test]
    fn native_floor_fallback_and_inward_cell_filter() {
        for row in fixtures()["filters"].as_array().unwrap() {
            let zone = Zone::for_key(row["zone"].as_str().unwrap()).unwrap();
            let xy = std::array::from_fn(|axis| row["point"][axis].as_f64().unwrap() as f32);
            let grid = row["grid"].as_str().unwrap();
            let mut floor = Floor {
                primary: row["primary"].as_f64().map(|v| v as f32),
                secondary: row["secondary"].as_f64().map(|v| v as f32),
                grid: (grid != "absent").then_some(if grid == "outside" {
                    xy
                } else {
                    zone.center
                }),
                queries: 0,
                cells: [u8::from(grid == "blocked"); 16],
            };
            let point = placement(zone, xy, &mut floor);
            let expected = row["expected"].as_array().unwrap();
            assert_eq!(point.is_some(), !expected.is_empty(), "{row}");
            if let Some(point) = point {
                assert_eq!(
                    [point.x, point.y, point.z],
                    std::array::from_fn(|axis| expected[0][axis].as_f64().unwrap() as f32)
                );
            }
            assert_eq!(
                floor.queries,
                row["primary_queries"].as_u64().unwrap() as usize
            );
        }
    }

    #[test]
    fn shared_creator_matches_current_fields_counter_and_rng() {
        for row in fixtures()["objects"].as_array().unwrap() {
            let mut counter = row["counter"].as_u64().unwrap() as u32;
            let mut rng =
                NativeRng::from_words(std::array::from_fn(|n| row["words"][n].as_u64().unwrap()));
            let object = lightwell_object(
                LightwellSpawn {
                    center: [1.25, -2.5, 30.0].into(),
                    entry: 9013,
                    display: 4831,
                    scale: 1.0,
                    native_kind: 5,
                    native_flags: 16,
                },
                &mut counter,
                &mut rng,
                f32::sin,
                f32::cos,
            );
            assert_eq!(object.guid, row["guid"].as_u64().unwrap());
            assert_eq!(counter, row["next_counter"].as_u64().unwrap() as u32);
            assert_eq!(
                rng.words,
                std::array::from_fn(|n| row["next_words"][n].as_u64().unwrap())
            );
            assert_eq!(
                object.orientation,
                row["orientation"].as_f64().unwrap() as f32
            );
            for pair in row["fields"].as_array().unwrap() {
                let key = pair[0].as_u64().unwrap() as u16;
                let expected = pair[1].as_u64().unwrap() as u32;
                let actual = object
                    .fields
                    .iter()
                    .find(|(field, _)| *field == key)
                    .unwrap()
                    .1;
                if key == 12 || key == 13 {
                    assert!((f32::from_bits(actual) - f32::from_bits(expected)).abs() < 0.000001);
                } else {
                    assert_eq!(actual, expected, "field {key}");
                }
            }
        }
    }

    #[test]
    fn live_begin_publishes_once_and_skipped_points_consume_no_serial_or_rng() {
        let mut game = super::super::rng_integration::class_run("warrior", 0);
        game.boundary_started = false;
        let mut floor = super::super::rng_integration::TerrainFixture;
        let serial = game.counter.value();
        game.begin_boundary(&mut floor);
        assert_eq!(game.counter.value(), serial + 69);
        assert_eq!(
            game.events
                .iter()
                .filter(|event| matches!(event, RunEvent::BoundaryPillar(_)))
                .count(),
            69
        );
        let words = game.rng.words;
        game.events.clear();
        game.begin_boundary(&mut floor);
        assert!(game.events.is_empty());
        assert_eq!(game.rng.words, words);
        assert_eq!(game.counter.value(), serial + 69);

        let mut indoor = super::super::rng_integration::class_run("warrior", 0);
        indoor.zone = ZoneDefinition::by_key("naxx").unwrap();
        indoor.boundary_started = false;
        let mut floor = Floor {
            primary: None,
            secondary: Some(40.0),
            grid: None,
            queries: 0,
            cells: [0; 16],
        };
        let words = indoor.rng.words;
        let serial = indoor.counter.value();
        indoor.begin_boundary(&mut floor);
        assert!(indoor.events.is_empty());
        assert_eq!(indoor.rng.words, words);
        assert_eq!(indoor.counter.value(), serial);
    }
}
