//! Movement admission and indoor recovery, originally recovered from 0.100.1.
//! Exact terrain query implementations are ports, not fabricated walk surfaces.
//! Current zone inputs/navigation/publication: docs/analysis/ground-navigation-0.110.0.md.
//! See docs/analysis/floor-recovery-0.100.1.md for historical admission provenance.
//! Current Pull report handoff: docs/analysis/raid-forced-position-0.112.0.md.

pub mod cache;
pub mod map;
pub mod navigation;
pub mod placement;

use serde::Deserialize;
use std::sync::OnceLock;

#[derive(Clone, Debug, Deserialize)]
pub struct Zone {
    pub key: String,
    pub center: [f32; 2],
    pub radius: f32,
    pub indoor: bool,
    /// Nonempty for zones with an authored boundary.
    pub polygon: Vec<[f32; 2]>,
}

impl Zone {
    pub fn for_key(key: &str) -> Option<&'static Self> {
        static ZONES: OnceLock<Vec<Zone>> = OnceLock::new();
        ZONES
            .get_or_init(|| {
                use crate::zones::scholomance as school;
                let mut zones: Vec<Zone> = serde_json::from_str(include_str!(
                    "../assets/native-floor-zones-0.110.0.json"
                )).expect("retained floor zones");
                zones.insert(school::INDEX, Zone {
                    key: school::KEY.into(),
                    center: [school::SPAWN[0], school::SPAWN[1]],
                    radius: school::RADIUS,
                    indoor: true,
                    polygon: school::POLYGON.to_vec(),
                });
                zones
            })
            .iter()
            .find(|zone| zone.key == key)
    }
    pub fn outside(&self, xy: [f32; 2]) -> bool {
        if self.polygon.is_empty() {
            distance(xy, self.center) > self.radius + 10.0
        } else {
            let mut inside = false;
            let mut previous = self.polygon[self.polygon.len() - 1];
            for &point in &self.polygon {
                if (xy[1] < previous[1]) != (xy[1] < point[1])
                    && xy[0]
                        < (xy[1] - point[1]) * (previous[0] - point[0]) / (previous[1] - point[1])
                            + point[0]
                {
                    inside = !inside;
                }
                previous = point;
            }
            !inside
        }
    }
    fn boundary_correction(&self, xy: [f32; 2]) -> [f32; 2] {
        if self.polygon.is_empty() {
            let delta = [xy[0] - self.center[0], xy[1] - self.center[1]];
            let length = distance(xy, self.center).max(0.01);
            let radius = self.radius + 10.0 - 4.0;
            [
                self.center[0] + radius * (delta[0] / length),
                self.center[1] + radius * (delta[1] / length),
            ]
        } else {
            let nearest = nearest_polygon_point(&self.polygon, xy);
            inward(nearest, self.center, 4.0, false)
        }
    }
}

/// Engine-owned representations behind Game+898. None means that native
/// resource/query is absent. In particular an absent blocked grid is not open.
pub trait Terrain {
    /// Primary cache 14552a140, queried at the exact XY.
    fn height(&mut self, xy: [f32; 2]) -> Option<f32>;
    /// Outdoor nearby primary-cache query 1455266f0, radius 12.
    fn nearby_height(&mut self, xy: [f32; 2], radius: f32) -> Option<f32>;
    /// Secondary half-yard cache 14552d220, ring search through 20 cells.
    fn nearest_floor(&mut self, xy: [f32; 2]) -> Option<[f32; 3]>;
    /// 14552b4e0: minimum non-NaN height in the 5x5 half-yard neighborhood.
    fn minimum_floor(&mut self, xy: [f32; 2]) -> Option<f32>;
    /// 1455257a0: all nine one-yard footprint samples are blocked.
    fn blocked(&mut self, xy: [f32; 2]) -> bool;
    fn has_blocked_grid(&self) -> bool;
    /// 145525bb0: nearest cell center with all nine samples clear, radius 20.
    fn nearest_open(&mut self, xy: [f32; 2], radius: f32) -> Option<[f32; 2]>;
    /// 14551dc20, called only outdoors: radial scan radius20 with exclusion2.
    fn nearest_valid(&mut self, xy: [f32; 2], radius: f32, exclusion: f32) -> Option<[f32; 3]>;
    fn fallback_height(&self) -> f32;
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Report {
    pub position: [f32; 3],
    pub facing: f32,
    /// Game+990 movement flags from the accepted incoming movement packet.
    pub flags: u32,
    /// Game+9b9: 0 ready, 1 active, later phases do not run stationary detection.
    pub phase: u8,
    /// Native Game+934 clock, frozen with the native simulation pause.
    pub now: f32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Admission {
    Ignored,
    Accepted,
    /// Apply to the real player controller and publish the correction packet.
    Corrected([f32; 3]),
}

#[derive(Clone, Copy, Debug)]
struct TimedPosition {
    since: f32,
    position: [f32; 3],
}
#[derive(Clone, Copy, Debug)]
struct PendingCorrection {
    position: [f32; 3],
    since: f32,
}

#[derive(Clone, Debug, Default)]
pub struct Recovery {
    below_since: Option<f32>,
    blocked_since: Option<f32>,
    stationary: Option<TimedPosition>,
    last_recovery: Option<TimedPosition>,
    pending: Option<PendingCorrection>,
}

impl Recovery {
    /// Current 0.123.0 admission145b0a0de keeps distant stale reports out for
    /// three simulation seconds, independently of report count or client time.
    pub fn expect_position(&mut self, position: [f32; 3], now: f32) {
        self.pending = Some(PendingCorrection {
            position,
            since: now,
        });
    }

    /// Call per incoming movement report, before committing its XYZ. Native
    /// correction timers are report driven, not independently advanced per frame.
    pub fn admit(&mut self, zone: &Zone, report: Report, terrain: &mut impl Terrain) -> Admission {
        self.admit_with_clock(zone, report, report.now, terrain)
    }

    /// Current movement dispatch145ae4870/145bb79f0 supplies the movement
    /// packet's own u32 milliseconds for indoor recovery timers. Pending
    /// correction expiry continues to use the authoritative simulation clock.
    pub fn admit_timestamped(
        &mut self,
        zone: &Zone,
        report: Report,
        timestamp: u32,
        terrain: &mut impl Terrain,
    ) -> Admission {
        self.admit_with_clock(zone, report, timestamp as f32 / 1000.0, terrain)
    }

    fn admit_with_clock(
        &mut self,
        zone: &Zone,
        report: Report,
        movement_time: f32,
        terrain: &mut impl Terrain,
    ) -> Admission {
        let position = report.position;
        let xy = [position[0], position[1]];
        if let Some(pending) = &self.pending {
            let dx = pending.position[0] - xy[0];
            let dy = pending.position[1] - xy[1];
            if dx * dx + dy * dy > 9.0 && report.now - pending.since < 3.0 {
                return Admission::Ignored;
            }
            self.pending = None;
        }
        let center_height = terrain
            .height(zone.center)
            .or_else(|| terrain.nearest_floor(zone.center).map(|point| point[2]))
            .unwrap_or_else(|| terrain.fallback_height());
        let outside = zone.outside(xy);
        let secondary = if zone.indoor {
            terrain.nearest_floor(xy)
        } else {
            None
        };
        let shallow = zone.indoor
            && terrain
                .minimum_floor(xy)
                .is_some_and(|height| height + f32::from_bits(0xbeb3_3333) > position[2]);
        let below_due = timer(&mut self.below_since, shallow, movement_time, 0.75);
        let blocked = zone.indoor && terrain.has_blocked_grid() && terrain.blocked(xy);
        let blocked_due = timer(&mut self.blocked_since, blocked, movement_time, 1.0);
        let stationary_due = if zone.indoor
            && report.phase == 1
            && report.flags & 0xf != 0
            && report.flags & 0x1000 == 0
        {
            let anchor = self.stationary.get_or_insert(TimedPosition {
                since: movement_time,
                position,
            });
            if distance(xy, [anchor.position[0], anchor.position[1]]) > 0.75 {
                *anchor = TimedPosition {
                    since: movement_time,
                    position,
                };
                false
            } else {
                movement_time - anchor.since >= 1.5
            }
        } else {
            self.stationary = None;
            false
        };
        let primary = terrain.height(xy);
        let lower_bound = match primary {
            Some(height) => height + if zone.indoor { -5.0 } else { -15.0 },
            None => secondary
                .map(|point| point[2] - 5.0)
                .or_else(|| {
                    (!zone.indoor)
                        .then(|| terrain.nearby_height(xy, 12.0))
                        .flatten()
                        .map(|h| h - 15.0)
                })
                .unwrap_or(center_height - 120.0),
        };
        if !outside && !below_due && !blocked_due && !stationary_due && !(lower_bound > position[2])
        {
            return Admission::Accepted;
        }
        self.below_since = None;
        self.blocked_since = None;
        self.stationary = None;
        let mut corrected = if outside {
            zone.boundary_correction(xy)
        } else {
            xy
        };
        if stationary_due || below_due {
            let repeated = self.last_recovery.is_some_and(|last| {
                (movement_time - last.since).abs() < 6.0
                    && distance(corrected, [last.position[0], last.position[1]]) < 3.0
            });
            self.last_recovery = Some(TimedPosition {
                since: movement_time,
                position,
            });
            if repeated {
                corrected = inward(corrected, zone.center, 4.0, true);
            }
        }
        if zone.indoor && terrain.has_blocked_grid() && terrain.blocked(corrected) {
            if let Some(open) = terrain.nearest_open(corrected, 20.0) {
                corrected = open;
            }
        }
        let mut height = center_height;
        if let Some(primary) = terrain.height(corrected) {
            height = primary;
        } else if let Some(floor) = terrain.nearest_floor(corrected) {
            corrected = [floor[0], floor[1]];
            height = floor[2];
        } else if !zone.indoor {
            if let Some(floor) = terrain.nearest_valid(corrected, 20.0, 2.0) {
                corrected = [floor[0], floor[1]];
                height = floor[2];
            }
        }
        let position = [corrected[0], corrected[1], height + 0.5];
        self.expect_position(position, report.now);
        Admission::Corrected(position)
    }
}

fn timer(state: &mut Option<f32>, condition: bool, now: f32, threshold: f32) -> bool {
    if condition {
        now - *state.get_or_insert(now) >= threshold
    } else {
        *state = None;
        false
    }
}
fn distance(a: [f32; 2], b: [f32; 2]) -> f32 {
    (a[0] - b[0]).hypot(a[1] - b[1])
}
fn inward(xy: [f32; 2], center: [f32; 2], maximum: f32, limited: bool) -> [f32; 2] {
    let length = distance(center, xy).max(0.01);
    let amount = if limited {
        length.min(maximum)
    } else {
        maximum
    };
    [
        xy[0] + amount * ((center[0] - xy[0]) / length),
        xy[1] + amount * ((center[1] - xy[1]) / length),
    ]
}
fn nearest_polygon_point(polygon: &[[f32; 2]], xy: [f32; 2]) -> [f32; 2] {
    let mut nearest = polygon[0];
    let mut best = f32::INFINITY;
    let mut previous = polygon[0];
    for &point in polygon.iter().skip(1).chain(polygon.first()) {
        let delta = [point[0] - previous[0], point[1] - previous[1]];
        let denominator = (delta[0] * delta[0] + delta[1] * delta[1]).max(0.000_001);
        let fraction = (((xy[0] - previous[0]) * delta[0] + (xy[1] - previous[1]) * delta[1])
            / denominator)
            .clamp(0.0, 1.0);
        let candidate = [
            previous[0] + fraction * delta[0],
            previous[1] + fraction * delta[1],
        ];
        let delta = [candidate[0] - xy[0], candidate[1] - xy[1]];
        let squared = delta[0] * delta[0] + delta[1] * delta[1];
        if squared < best {
            nearest = candidate;
            best = squared;
        }
        previous = point;
    }
    nearest
}

/// Current secondary cache uses half-yard cells and NaN holes. The cache's
/// construction/residency belongs to the engine; these queries never add samples.
#[derive(Clone, Copy, Debug)]
pub struct HeightGrid<'a> {
    pub origin: [f32; 2],
    pub side: usize,
    pub cells: &'a [f32],
}
impl HeightGrid<'_> {
    pub fn minimum(&self, xy: [f32; 2]) -> Option<f32> {
        let x = ((xy[0] - self.origin[0]) * 2.0).floor() as i32;
        let y = ((xy[1] - self.origin[1]) * 2.0).floor() as i32;
        let maximum = self.side as i32 - 1;
        let mut minimum: Option<f32> = None;
        for row in (y.saturating_sub(2)).max(0)..=y.saturating_add(2).min(maximum) {
            for col in (x.saturating_sub(2)).max(0)..=x.saturating_add(2).min(maximum) {
                let height = self.cells[row as usize * self.side + col as usize];
                if !height.is_nan() && minimum.is_none_or(|old| old > height) {
                    minimum = Some(height);
                }
            }
        }
        minimum
    }
    pub fn nearest(&self, xy: [f32; 2]) -> Option<[f32; 3]> {
        let x = ((xy[0] - self.origin[0]) * 2.0).floor() as i32;
        let y = ((xy[1] - self.origin[1]) * 2.0).floor() as i32;
        for radius in 0i32..=20 {
            let mut result = None;
            let mut best = i32::MAX;
            for dy in -radius..=radius {
                for dx in -radius..=radius {
                    if dx.abs().max(dy.abs()) != radius {
                        continue;
                    }
                    let col = x.saturating_add(dx);
                    let row = y.saturating_add(dy);
                    if col < 0 || row < 0 || col >= self.side as i32 || row >= self.side as i32 {
                        continue;
                    }
                    let height = self.cells[row as usize * self.side + col as usize];
                    let squared = dx * dx + dy * dy;
                    if !height.is_nan() && squared < best {
                        best = squared;
                        result = Some([
                            self.origin[0] + (col as f32 + 0.5) * 0.5,
                            self.origin[1] + (row as f32 + 0.5) * 0.5,
                            height,
                        ]);
                    }
                }
            }
            if result.is_some() {
                return result;
            }
        }
        None
    }
}

pub use crate::enemies::spawning::BlockedGrid;
fn occupancy(grid: BlockedGrid<'_>, xy: [f32; 2]) -> Option<u8> {
    let x = xy[0] - grid.origin[0];
    let y = xy[1] - grid.origin[1];
    if !(x >= 0.0 && y >= 0.0) {
        return None;
    }
    let col = x as usize;
    let row = y as usize;
    if col >= grid.side || row >= grid.side {
        return None;
    }
    Some(grid.cells[row * grid.side + col])
}
fn footprint(grid: BlockedGrid<'_>, xy: [f32; 2], value: u8) -> bool {
    [-1.0, 0.0, 1.0].into_iter().all(|dy| {
        [-1.0, 0.0, 1.0]
            .into_iter()
            .all(|dx| occupancy(grid, [xy[0] + dx, xy[1] + dy]) == Some(value))
    })
}
/// 1455257a0's native bool grid predicate: all nine are blocked, not any one.
pub fn completely_blocked(grid: BlockedGrid<'_>, xy: [f32; 2]) -> bool {
    footprint(grid, xy, 1)
}
/// 145525bb0 scans row/column offsets; first equal-distance candidate wins.
pub fn nearest_open(grid: BlockedGrid<'_>, xy: [f32; 2], radius: f32) -> Option<[f32; 2]> {
    let limit = radius.ceil() as i32;
    let mut result = None;
    let mut best = f32::INFINITY;
    for dy in -limit..=limit {
        for dx in -limit..=limit {
            let probe = [xy[0] + dx as f32, xy[1] + dy as f32];
            if occupancy(grid, probe).is_none() {
                continue;
            }
            let point = [
                grid.origin[0] + (probe[0] - grid.origin[0]) as usize as f32 + 0.5,
                grid.origin[1] + (probe[1] - grid.origin[1]) as usize as f32 + 0.5,
            ];
            let delta = [point[0] - xy[0], point[1] - xy[1]];
            let squared = delta[0] * delta[0] + delta[1] * delta[1];
            if squared <= radius * radius && squared < best && footprint(grid, point, 0) {
                result = Some(point);
                best = squared;
            }
        }
    }
    result
}
