use azeroth_survivors_re::floor_recovery::{
    self, Admission, HeightGrid, Recovery, Report, Terrain, Zone,
};
use serde::Deserialize;

struct ControlledTerrain {
    blocked: bool,
}
impl Terrain for ControlledTerrain {
    fn height(&mut self, _: [f32; 2]) -> Option<f32> {
        Some(10.0)
    }
    fn nearby_height(&mut self, _: [f32; 2], _: f32) -> Option<f32> {
        None
    }
    fn nearest_floor(&mut self, xy: [f32; 2]) -> Option<[f32; 3]> {
        Some([xy[0], xy[1], 10.0])
    }
    fn minimum_floor(&mut self, _: [f32; 2]) -> Option<f32> {
        Some(10.0)
    }
    fn blocked(&mut self, _: [f32; 2]) -> bool {
        self.blocked
    }
    fn has_blocked_grid(&self) -> bool {
        true
    }
    fn nearest_open(&mut self, xy: [f32; 2], radius: f32) -> Option<[f32; 2]> {
        assert_eq!(radius, 20.0);
        Some([xy[0] + 6.0, xy[1]])
    }
    fn nearest_valid(&mut self, _: [f32; 2], _: f32, _: f32) -> Option<[f32; 3]> {
        None
    }
    fn fallback_height(&self) -> f32 {
        10.0
    }
}

#[derive(Deserialize)]
struct MovementFixture {
    cases: Vec<MovementCase>,
}
#[derive(Deserialize)]
struct MovementCase {
    label: String,
    report: Input,
    corrected: Vec<[f32; 3]>,
    position: [f32; 3],
}
#[derive(Deserialize)]
struct Input {
    now: f32,
    position: [f32; 3],
    flags: u32,
    phase: u8,
}

#[test]
fn retained_terrain_and_timer_instruction_cases_replay() {
    let fixture: MovementFixture = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.100.1/floor-recovery/native-fixtures.json"
    ))
    .unwrap();
    let zone = Zone::for_key("naxx").unwrap();
    let mut state = Recovery::default();
    let mut terrain = ControlledTerrain { blocked: false };
    let mut position = [zone.center[0] + 20.0, zone.center[1], 10.0];
    for case in fixture.cases {
        // The historical report-count budget changed to three simulation
        // seconds in 0.123.0; its original fixture remains immutable evidence.
        if case.label.starts_with("stale-") {
            continue;
        }
        if matches!(
            case.label.as_str(),
            "shallow-start"
                | "stationary-start"
                | "blocked-start"
                | "flying-flag-stationary-start"
                | "ready-stationary-start"
                | "deep-boundary-equal"
        ) {
            state = Recovery::default();
            position = [zone.center[0] + 20.0, zone.center[1], 10.0];
            terrain.blocked = case.label == "blocked-start";
        }
        let input = case.report;
        let admission = state.admit(
            zone,
            Report {
                now: input.now,
                position: input.position,
                flags: input.flags,
                phase: input.phase,
                facing: 0.0,
            },
            &mut terrain,
        );
        match admission {
            Admission::Corrected(point) => {
                assert_eq!(case.corrected, vec![point], "{} correction", case.label);
                position = point;
            }
            Admission::Accepted => {
                assert!(case.corrected.is_empty(), "{}", case.label);
                position = input.position;
            }
            Admission::Ignored => assert!(case.corrected.is_empty(), "{}", case.label),
        }
        assert_eq!(position, case.position, "{} admitted pose", case.label);
    }
}

#[derive(Deserialize)]
struct GridFixtures {
    cases: Vec<GridCase>,
}
#[derive(Deserialize)]
struct GridCase {
    operation: String,
    side: usize,
    origin: [f32; 2],
    cells: Vec<Option<f32>>,
    xy: [f32; 2],
    radius: f32,
    result: serde_json::Value,
}

#[test]
fn current_grid_helper_instructions_replay() {
    let fixture: GridFixtures = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.100.1/floor-recovery/grid-fixtures.json"
    ))
    .unwrap();
    for (index, case) in fixture.cases.into_iter().enumerate() {
        let cells = case
            .cells
            .iter()
            .map(|v| v.unwrap_or(f32::NAN))
            .collect::<Vec<_>>();
        let result = match case.operation.as_str() {
            "minimum" => serde_json::to_value(
                HeightGrid {
                    side: case.side,
                    origin: case.origin,
                    cells: &cells,
                }
                .minimum(case.xy),
            )
            .unwrap(),
            "nearest" => serde_json::to_value(
                HeightGrid {
                    side: case.side,
                    origin: case.origin,
                    cells: &cells,
                }
                .nearest(case.xy),
            )
            .unwrap(),
            "blocked" | "open" => {
                let values = cells.iter().map(|v| *v as u8).collect::<Vec<_>>();
                let grid = floor_recovery::BlockedGrid {
                    side: case.side,
                    origin: case.origin,
                    cells: &values,
                };
                if case.operation == "blocked" {
                    serde_json::to_value(floor_recovery::completely_blocked(grid, case.xy)).unwrap()
                } else {
                    serde_json::to_value(floor_recovery::nearest_open(grid, case.xy, case.radius))
                        .unwrap()
                }
            }
            operation => panic!("unknown native fixture {operation}"),
        };
        assert_eq!(
            result, case.result,
            "case{index} {} at{:?}",
            case.operation, case.xy
        );
    }
}

#[test]
fn only_current_indoor_zones_enable_stationary_recovery() {
    for key in [
        "elwynn", "duskwood", "wsg", "ungoro", "ab", "feralas", "arena", "sm", "av", "brm", "aq",
        "naxx",
    ] {
        assert_eq!(
            Zone::for_key(key).unwrap().indoor,
            matches!(key, "sm" | "naxx")
        );
    }
}

#[derive(Deserialize)]
struct TriangleFixtures {
    cases: Vec<TriangleCase>,
}
#[derive(Deserialize)]
struct TriangleCase {
    triangle: [[f32; 3]; 3],
    origin: [f32; 2],
    side: usize,
    maximum: f32,
    result: Vec<CandidateFixture>,
}
#[derive(Deserialize)]
struct CandidateFixture {
    cell: usize,
    height: f32,
}

#[test]
fn current_triangle_rasterizer_instructions_replay() {
    use floor_recovery::cache::IndoorBuilder;
    let fixture: TriangleFixtures = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.100.1/floor-recovery/triangle-fixtures.json"
    ))
    .unwrap();
    for (index, case) in fixture.cases.into_iter().enumerate() {
        let radius = case.side as f32 / 4.0;
        let mut builder = IndoorBuilder::new(
            [
                case.origin[0] + radius,
                case.origin[1] + radius,
                case.maximum - 8.0,
            ],
            radius,
        );
        builder.triangle(case.triangle);
        let expected = case
            .result
            .iter()
            .map(|v| (v.cell, v.height))
            .collect::<Vec<_>>();
        let actual = builder
            .candidates()
            .iter()
            .map(|v| (v.cell, v.height))
            .collect::<Vec<_>>();
        assert_eq!(actual, expected, "native triangle{index}");
    }
}

#[test]
fn connected_floor_keeps_the_spawn_storey_and_disconnected_heights_are_holes() {
    use floor_recovery::cache::IndoorBuilder;
    let mut builder = IndoorBuilder::new([2.0, 2.0, 0.0], 2.0);
    for cell in 0..64 {
        builder.terrain_sample(cell, Some(if cell % 8 < 4 { 0.0 } else { 5.0 }));
        // A second storey is present even over the spawn-connected side.
        builder.terrain_sample(cell, Some(7.0));
    }
    let cache = builder.finish();
    assert_eq!(cache.height([1.75, 2.25]), Some(0.0));
    assert_eq!(cache.height([2.25, 2.25]), None);
    assert_eq!(cache.grid().nearest([2.25, 2.25]), Some([1.75, 2.25, 0.0]));
}

#[test]
fn connected_floor_admits_native_step_limit_and_rejects_a_larger_gap() {
    use floor_recovery::cache::IndoorBuilder;
    let mut builder = IndoorBuilder::new([2.0, 2.0, 0.0], 2.0);
    builder.terrain_sample(36, Some(0.0));
    builder.terrain_sample(37, Some(1.6));
    builder.terrain_sample(38, Some(3.2));
    builder.terrain_sample(39, Some(5.0));
    let cache = builder.finish();
    assert_eq!(cache.heights[36..39], [0.0, 1.6, 3.2]);
    assert!(cache.heights[39].is_nan());
}

#[derive(Deserialize)]
struct OccupancyFixtures {
    cases: Vec<OccupancyCase>,
}
#[derive(Deserialize)]
struct OccupancyCase {
    triangle: [[f32; 3]; 3],
    origin: [f32; 2],
    side: usize,
    floor_heights: Vec<f32>,
    cells: Vec<u8>,
}

#[test]
fn current_occupancy_rasterizer_instructions_replay() {
    use floor_recovery::cache::OccupancyBuilder;
    let fixture: OccupancyFixtures = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.100.1/floor-recovery/occupancy-fixtures.json"
    ))
    .unwrap();
    for (index, case) in fixture.cases.into_iter().enumerate() {
        let mut builder = OccupancyBuilder::new(case.origin, case.side, case.floor_heights);
        builder.triangle(case.triangle);
        assert_eq!(
            builder.cells, case.cells,
            "native occupancy triangle{index}"
        );
    }
}

#[derive(Deserialize)]
struct PlacementFixtures {
    cases: Vec<PlacementCase>,
}
#[derive(Deserialize)]
struct PlacementCase {
    rotation: [f32; 3],
    matrix: [f32; 9],
    vertices: Vec<[f32; 3]>,
    position: [f32; 3],
    scale: f32,
    result: Vec<[f32; 3]>,
}

#[test]
fn current_placement_rotation_and_vertex_instructions_replay() {
    use floor_recovery::placement;
    let fixture: PlacementFixtures = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.100.1/floor-recovery/placement-fixtures.json"
    ))
    .unwrap();
    for (index, case) in fixture.cases.into_iter().enumerate() {
        let actual = placement::matrix(case.rotation);
        for (i, (actual, expected)) in actual.iter().zip(case.matrix).enumerate() {
            assert!(
                (actual - expected).abs() < 0.000_001,
                "native placement{index} matrix{i}: {actual} vs {expected}"
            );
        }
        for (vertex, expected) in case.vertices.into_iter().zip(case.result) {
            let actual = placement::transform(actual, vertex, case.position, case.scale);
            for i in 0..3 {
                assert!(
                    (actual[i] - expected[i]).abs() < 0.000_002,
                    "native placement{index} vertex{i}: {actual:?} vs {expected:?}"
                );
            }
        }
    }
}

#[test]
fn raised_floor_admission_preserves_native_adt_requirement_and_height_band() {
    use floor_recovery::cache::{PrimaryCache, RaisedBuilder};
    let triangle = |z| [[0.0, 0.0, z], [4.0, 0.0, z], [0.0, 4.0, z]];
    let mut builder = RaisedBuilder::new([2.0, 2.0], 2.0);
    for z in [0.1, 1.0, 3.0, 3.001] {
        builder.triangle(triangle(z));
    }
    let raised = builder.finish(|xy| (xy[0] < 2.0).then_some(0.0)).unwrap();
    assert_eq!(raised.height([0.25, 0.25]), Some(3.0));
    assert_eq!(raised.height([2.25, 0.25]), None);
    let primary = PrimaryCache {
        raised: Some(raised),
        ..Default::default()
    };
    assert_eq!(primary.height([0.25, 0.25], |_| None), None);
    assert_eq!(primary.height([0.25, 0.25], |_| Some(0.0)), Some(3.0));
    assert_eq!(primary.height([0.25, 0.25], |_| Some(4.0)), Some(4.0));
}

#[derive(Deserialize)]
struct NavigationFixtures {
    cases: Vec<NavigationCase>,
}
#[derive(Deserialize)]
struct NavigationCase {
    origin: [f32; 2],
    side: usize,
    cells: Vec<u8>,
    player: [f32; 2],
    distances: Vec<u16>,
    start: usize,
    populated: usize,
    queries: Vec<NavigationQuery>,
}
#[derive(Deserialize)]
struct NavigationQuery {
    point: [f32; 2],
    to: [f32; 2],
    segment_fraction: f32,
    chase: Option<[f32; 2]>,
}
#[test]
fn current_distance_field_segment_and_chase_instructions_replay() {
    use floor_recovery::navigation::{segment_fraction, DistanceField};
    let fixture: NavigationFixtures = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.100.1/floor-recovery/navigation-fixtures.json"
    ))
    .unwrap();
    for (index, case) in fixture.cases.into_iter().enumerate() {
        let grid = floor_recovery::BlockedGrid {
            origin: case.origin,
            side: case.side,
            cells: &case.cells,
        };
        let field = DistanceField::build(grid, case.player).unwrap();
        assert_eq!(field.start, case.start, "native navigation{index} start");
        assert_eq!(
            field.populated_cells, case.populated,
            "native navigation{index} populated"
        );
        assert_eq!(
            field.distances, case.distances,
            "native navigation{index} distances"
        );
        for query in case.queries {
            assert_eq!(
                segment_fraction(grid, query.point, query.to),
                query.segment_fraction,
                "native navigation{index} segment{:?}",
                query.point
            );
            assert_eq!(
                field.chase(grid, query.point, query.to, 14.0),
                query.chase,
                "native navigation{index} chase{:?}",
                query.point
            );
        }
    }
}

#[test]
fn current_pending_correction_uses_simulation_seconds_instead_of_report_count() {
    let zone = Zone { key: "fixture".into(), center: [0., 0.], radius: 1000., indoor: false, polygon: vec![] };
    let mut terrain = ControlledTerrain { blocked: false };
    let mut state = Recovery::default();
    state.expect_position([0., 0., 10.], 100.);
    let report = Report { position: [20., 0., 10.], facing: 0., flags: 1, phase: 1, now: 102.999 };
    for _ in 0..100 {
        // Advancing the guest timestamp cannot expire the host's grace period.
        assert_eq!(state.admit_timestamped(&zone, report, u32::MAX, &mut terrain), Admission::Ignored);
    }
    assert_eq!(state.admit_timestamped(&zone, Report { now: 103., ..report }, 0, &mut terrain), Admission::Accepted);
    state.expect_position([0., 0., 10.], 200.);
    assert_eq!(state.admit(&zone, Report { position: [3., 0., 10.], now: 200., ..report }, &mut terrain), Admission::Accepted);
}

#[test]
fn only_the_pending_teleport_counter_can_release_a_distant_report() {
    let zone = Zone { key: "fixture".into(), center: [0., 0.], radius: 1000., indoor: false, polygon: vec![] };
    let mut terrain = ControlledTerrain { blocked: false };
    let mut state = Recovery::default();
    let position = [0., 0., 10.];
    let report = Report { position: [20., 0., 10.], facing: 0., flags: 1, phase: 1, now: 100. };

    state.expect_position(position, 100.);
    state.bind_teleport_counter([1., 0., 10.], 5);
    state.acknowledge_teleport(u32::MAX);
    assert_eq!(state.admit(&zone, report, &mut terrain), Admission::Ignored);
    state.bind_teleport_counter(position, 0x8000_0000);
    state.acknowledge_teleport(0x7fff_ffff);
    assert_eq!(state.admit(&zone, report, &mut terrain), Admission::Ignored);
    state.acknowledge_teleport(0x8000_0000);
    assert_eq!(state.admit(&zone, report, &mut terrain), Admission::Accepted);
}

#[test]
fn guest_indoor_stationary_timer_follows_movement_timestamp_during_delivery_delay() {
    let zone = Zone { key: "fixture".into(), center: [0., 0.], radius: 1000., indoor: true, polygon: vec![] };
    let mut terrain = ControlledTerrain { blocked: false };
    let mut state = Recovery::default();
    let report = Report { position: [20., 0., 10.], facing: 0., flags: 1, phase: 1, now: 100. };
    assert_eq!(state.admit_timestamped(&zone, report, 1000, &mut terrain), Admission::Accepted);
    assert_eq!(state.admit_timestamped(&zone, Report { now: 200., ..report }, 1000, &mut terrain), Admission::Accepted);
    assert_eq!(state.admit_timestamped(&zone, Report { now: 201., ..report }, 2499, &mut terrain), Admission::Accepted);
    assert_eq!(state.admit_timestamped(&zone, Report { now: 202., ..report }, 2500, &mut terrain), Admission::Corrected([20., 0., 10.5]));
}
