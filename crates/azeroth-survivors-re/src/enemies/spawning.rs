//! Ordinary enemy admissions, weighted selection, budget/population spawning
//! and placement recovered from the selected 0.97.2 executable.
//!
//! Owning evidence: docs/analysis/enemy-spawning-0.97.2.md. This is source
//! reconstruction; real terrain, path grids, entities and tick adapters are
//! required. Timed elite/pattern formations are recovered in `waves`.

use super::catalog::{EnemyDefinition, ZoneDefinition};
use super::{NativeRng, Position};

pub const NEAR_DISTANCE: f32 = 26.0;
pub const FAR_DISTANCE: f32 = 36.0;
pub const MINIMUM_RETRY_DISTANCE: f32 = 12.0;
pub const ANGLE_ATTEMPTS: usize = 16;
pub const FALLBACK_ATTEMPTS: usize = 12;

/// 14552ef30: ordinary rows become eligible at their inclusive minute gate.
/// An infinite deadline never admits a row at finite time. NaN also refuses.
pub fn admitted_enemy_indices(zone: &ZoneDefinition, minutes: f32) -> Vec<usize> {
    zone.enemies.iter().enumerate()
        .filter(|(_, enemy)| enemy.flag_4c == 0 && minutes >= enemy.raw_48)
        .map(|(index, _)| index).collect()
}

/// 145536a90: old, inexpensive entries retain more probability. There is no
/// removal when another enemy becomes available; the age term caps at four.
pub fn selection_weight(enemy: &EnemyDefinition, minutes: f32) -> f32 {
    let age = (minutes - enemy.raw_48).max(0.0);
    (age * 0.5 + 1.0).min(4.0) / enemy.raw_44
}

/// 1454beef0: consumes the run's shared RNG, even for a one-entry list.
/// The native fallback is the first candidate if the roulette exhausts.
/// An empty list is a native bounds failure, not a fabricated default enemy.
pub fn select_enemy(zone: &ZoneDefinition, candidates: &[usize], minutes: f32,
                    rng: &mut NativeRng) -> usize {
    let weights: Vec<_> = candidates.iter()
        .map(|&index| selection_weight(&zone.enemies[index], minutes)).collect();
    let total = weights.iter().fold(0.0_f32, |sum, &weight| sum + weight).max(0.001);
    let mut draw = rng.range_f32(0.0, total);
    for (&index, weight) in candidates.iter().zip(weights) {
        if weight > draw { return index; }
        draw -= weight;
    }
    candidates[0]
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ActiveBoss {
    /// Living boss with definition byte +0x54 == 0.
    Ordinary,
    /// Living boss with definition byte +0x54 != 0.
    Flagged,
}

/// Only live entities with native field +0x18 != -1 enter this fold. The
/// engine adapter must exclude dead rows and ordinary/lair rows beforehand.
pub fn boss_spawn_multiplier(bosses: &[ActiveBoss]) -> f32 {
    bosses.iter().fold(1.0_f32, |current, boss| current.min(match boss {
        ActiveBoss::Ordinary => 0.45,
        ActiveBoss::Flagged => 0.3,
    }))
}

#[derive(Clone, Copy, Debug)]
pub struct TickInput<'a> {
    pub clock_seconds: f32,
    pub delta_seconds: f32,
    pub density_percent: u16,
    /// Current cooperative horde factor, applied after pressure acceleration
    /// and after the ordinary target's 36-unit cap. None retains solo options.
    pub cooperative_density: Option<f32>,
    pub active_bosses: &'a [ActiveBoss],
    /// Game+0x95b, inside the outer active-run tick gate.
    pub suppressed: bool,
    /// Game+0x952. The native legitimate representation is a boolean.
    pub endless: bool,
    /// Game+0x858 == 1: additional endless scaling uses Game+0x85c.
    pub endless_phase_one: bool,
    pub endless_started_at: f32,
}

impl TickInput<'_> {
    pub fn population_limit(self) -> usize {
        self.cooperative_density.map_or_else(
            || super::scaling::population_limit(self.density_percent),
            |factor| (50.0 * factor).round() as usize,
        )
    }

    fn endless_multiplier(self) -> f32 {
        if !self.endless { return 1.0; }
        let elapsed = if self.endless_phase_one {
            ((self.clock_seconds - self.endless_started_at) / 60.0).max(0.0)
        } else { 0.0 };
        elapsed * 0.1 + 1.5
    }
}

/// 1454a73dd..1454a7435 before pressure acceleration.
pub fn budget_rate(input: TickInput<'_>) -> f32 {
    let minutes = input.clock_seconds / 60.0;
    let linear = minutes * 0.32 + 0.9;
    let quadratic = (0.025 * minutes) * minutes;
    let polynomial = (quadratic + linear) * 0.6;
    let density = f32::from(input.density_percent) / 100.0;
    (density * polynomial) * boss_spawn_multiplier(input.active_bosses)
        * input.endless_multiplier()
}

/// 1454a780d..1454a7897. This is a top-up count, separate from the budget.
/// Guardians/elite definitions and dead rows do not count toward this target.
pub fn population_target(input: TickInput<'_>) -> usize {
    let minutes = input.clock_seconds / 60.0;
    let density = f32::from(input.density_percent) / 100.0;
    let desired = (minutes * 1.6 + 4.0) * density
        * boss_spawn_multiplier(input.active_bosses);
    let cap = 36.0 * density;
    (desired.min(cap) * input.cooperative_density.unwrap_or(1.0)) as usize
}

/// Actual owning engine boundary. Creation must synchronously append a live
/// entity and run recovered scaling/placement. It has no fake allocation-error
/// result: native refusal is solely the live-entity cap checked by this owner.
pub trait SpawnPort {
    /// All native rows whose dead field +0x68 == 0, including elites/bosses.
    fn live_entity_count(&self) -> usize;
    /// Live rows with a non-null enemy definition and flag_4c == 0.
    fn live_ordinary_count(&self) -> usize;
    fn create_enemy(&mut self, enemy_index: usize, rng: &mut NativeRng);
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct OrdinarySpawner {
    /// Game+0x90c. Native new-run value is 3.0.
    pub budget: f32,
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct SpawnedThisTick {
    pub budget: usize,
    pub population: usize,
}

impl Default for OrdinarySpawner {
    fn default() -> Self { Self { budget: 3.0 } }
}

impl OrdinarySpawner {
    /// Native Game constructor 14549bb90: budget+0x90c starts at three.
    pub fn new() -> Self { Self::default() }

    fn attempt(port: &mut impl SpawnPort, enemy_index: usize, input: TickInput<'_>,
               rng: &mut NativeRng) -> bool {
        if port.live_entity_count() >= input.population_limit() {
            return false;
        }
        port.create_enemy(enemy_index, rng);
        true
    }

    /// Borrow the one shared Game+0x910 accumulator (the existing
    /// MobLootState.death_accumulator); enemy deaths add raw_44 to it there.
    /// This owner decays it and converts it into temporary spawn acceleration.
    /// Do not pass a copied or separately seeded accumulator.
    pub fn advance_budget_with_expf(&mut self, input: TickInput<'_>,
                                    death_credit: &mut f32,
                                    mut expf: impl FnMut(f32) -> f32) {
        if input.suppressed { return; }
        *death_credit *= expf(input.delta_seconds / -12.0);
        let rate = budget_rate(input);
        let acceleration = ((*death_credit / 12.0) * 1.25 / rate.max(0.001))
            .max(1.0).min(3.0);
        let rate = (rate * acceleration) * input.cooperative_density.unwrap_or(1.0);
        self.budget = input.delta_seconds * rate + self.budget;
    }

    /// Call once during the native active tick. The supplied expf should use
    /// the target-compatible runtime when bit parity matters; host expf parity
    /// is not established. No clock or independent RNG is created here.
    pub fn tick_with_expf(&mut self, zone: &ZoneDefinition, input: TickInput<'_>,
                          rng: &mut NativeRng, death_credit: &mut f32,
                          expf: impl FnMut(f32) -> f32, port: &mut impl SpawnPort) -> SpawnedThisTick {
        let mut spawned = SpawnedThisTick::default();
        if input.suppressed { return spawned; }
        self.advance_budget_with_expf(input, death_credit, expf);
        let minutes = input.clock_seconds / 60.0;
        let candidates = admitted_enemy_indices(zone, minutes);
        while self.budget >= 1.0 && spawned.budget < 8 {
            let enemy_index = select_enemy(zone, &candidates, minutes, rng);
            let cost = zone.enemies[enemy_index].raw_44;
            if cost > self.budget { break; }
            if !Self::attempt(port, enemy_index, input, rng) {
                self.budget = self.budget.min(cost);
                break;
            }
            spawned.budget += 1;
            self.budget -= cost;
        }
        let missing = population_target(input).saturating_sub(port.live_ordinary_count());
        // ceilf is called with the density factor still in XMM0, not delta.
        let cap = if input.cooperative_density.is_some() { 3 } else {
            3 * (f32::from(input.density_percent) / 100.0).ceil() as usize
        };
        for _ in 0..missing.min(cap) {
            let enemy_index = select_enemy(zone, &candidates, minutes, rng);
            if !Self::attempt(port, enemy_index, input, rng) { break; }
            spawned.population += 1;
        }
        spawned
    }
}

#[derive(Clone, Copy, Debug)]
pub struct BlockedGrid<'a> {
    pub origin: [f32; 2],
    pub side: usize,
    pub cells: &'a [u8],
}

impl BlockedGrid<'_> {
    pub(super) fn index(&self, xy: [f32; 2]) -> Option<usize> {
        let x = xy[0] - self.origin[0];
        let y = xy[1] - self.origin[1];
        if x < 0.0 || y < 0.0 { return None; }
        let x = x as usize;
        let y = y as usize;
        (x < self.side && y < self.side).then(|| self.side.wrapping_mul(y).wrapping_add(x))
    }

    pub(super) fn cell(&self, xy: [f32; 2]) -> Option<u8> {
        self.index(xy).map(|index| self.cells[index])
    }
}

#[derive(Clone, Copy, Debug)]
pub struct PathGrid<'a> {
    pub populated_cells: usize,
    pub distances: &'a [u16],
}

/// Required adapters to the native primary/secondary terrain queries and
/// navigation records. Missing resources are explicit; zero is a valid height.
pub trait Terrain {
    fn height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn secondary_height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn fallback_height(&self) -> f32;
    fn blocked_grid(&self) -> Option<BlockedGrid<'_>>;
    fn path_grid(&self) -> Option<PathGrid<'_>>;
}

/// The original uses imported cosf/sinf/atan2f/hypotf. Supply compatible math
/// for bit parity; native instruction fixtures do not prove host libm parity.
pub trait PlacementMath {
    fn cos(&mut self, angle: f32) -> f32;
    fn sin(&mut self, angle: f32) -> f32;
    fn atan2(&mut self, y: f32, x: f32) -> f32;
    fn hypot(&mut self, x: f32, y: f32) -> f32;
}

fn xy(player: Position, angle: f32, distance: f32, math: &mut impl PlacementMath) -> [f32; 2] {
    [distance * math.cos(angle) + player.x, distance * math.sin(angle) + player.y]
}

pub(crate) fn resolved_height(terrain: &mut impl Terrain, point: [f32; 2]) -> f32 {
    terrain.height(point).or_else(|| terrain.secondary_height(point))
        .unwrap_or_else(|| terrain.fallback_height())
}

fn fallback_position(center: [f32; 3], radius: f32, player: Position, near: f32, far: f32, rng: &mut NativeRng,
                     terrain: &mut impl Terrain, math: &mut impl PlacementMath) -> Position {
    // 1454c2a20 tail-call receives the original caller's distance arguments.
    for _ in 0..FALLBACK_ATTEMPTS {
        let angle = rng.range_f32(0.0, std::f32::consts::TAU);
        let distance = rng.range_f32(near, far);
        let mut point = xy(player, angle, distance, math);
        let dx = point[0] - center[0];
        let dy = point[1] - center[1];
        // This helper uses sqrt, while the primary owner uses hypotf.
        let from_center = (dx * dx + dy * dy).sqrt();
        if from_center > radius {
            point = [center[0] + radius * (dx / from_center),
                     center[1] + radius * (dy / from_center)];
        }
        if terrain.blocked_grid().and_then(|grid| grid.cell(point)).is_some_and(|cell| cell != 0) {
            continue;
        }
        if let Some(height) = terrain.height(point) {
            if (height - player.z).abs() < 25.0 {
                return Position { x: point[0], y: point[1], z: height };
            }
        }
    }
    // Last fallback skips zone projection, collision mask, path and height delta.
    let angle = rng.range_f32(0.0, std::f32::consts::TAU);
    let distance = rng.range_f32(near, far);
    let point = xy(player, angle, distance, math);
    Position { x: point[0], y: point[1], z: resolved_height(terrain, point) }
}

/// 1454c17b0: default ordinary creation calls this with forward chance 0.5.
/// `player_velocity` is Game+0x8a8, the smoothed owning-run velocity; it must
/// not be replaced with guessed direction or a separately updated velocity.
pub fn sample_position(zone: &ZoneDefinition, player: Position, player_velocity: [f32; 2],
                       forward_chance: f32, rng: &mut NativeRng,
                       terrain: &mut impl Terrain, math: &mut impl PlacementMath) -> Position {
    sample_position_with_distances(zone.center, zone.radius, player, player_velocity, forward_chance,
                                   NEAR_DISTANCE, FAR_DISTANCE, rng, terrain, math)
}

/// Shared native helper's caller-supplied distances. Ordinary enemies use
/// 26..36; primary boss fallback uses 24..28 and forward chance zero.
pub fn sample_position_with_distances(center: [f32; 3], radius: f32, player: Position,
                       player_velocity: [f32; 2], forward_chance: f32, near: f32, far: f32,
                       rng: &mut NativeRng, terrain: &mut impl Terrain,
                       math: &mut impl PlacementMath) -> Position {
    let moving = player_velocity[1] * player_velocity[1]
        + player_velocity[0] * player_velocity[0] > 4.0;
    let heading = if moving { math.atan2(player_velocity[1], player_velocity[0]) } else { 0.0 };
    for _ in 0..ANGLE_ATTEMPTS {
        // The chance draw uses 24 high bits, unlike range_f32's 23-bit draw.
        let forward = moving && forward_chance > (rng.next_u64() >> 40) as f32 * (1.0 / 16_777_216.0);
        let angle = if forward { rng.range_f32(-1.2, 1.2) + heading }
            else { rng.range_f32(0.0, std::f32::consts::TAU) };
        let mut distance = rng.range_f32(near, far);
        let cosine = math.cos(angle);
        let sine = math.sin(angle);
        while distance >= MINIMUM_RETRY_DISTANCE {
            let point = [distance * cosine + player.x, distance * sine + player.y];
            let from_center = math.hypot(point[0] - center[0], point[1] - center[1]);
            // Current14593d87a/db58 rejects only ordered greater distances.
            if !(from_center > radius + 18.0) {
                if let Some(height) = terrain.height(point) {
                    let max_height_delta = if from_center > radius { 8.0 } else { 25.0 };
                    if !((height - player.z).abs() > max_height_delta) {
                        let accepted = if let Some(grid) = terrain.blocked_grid() {
                            let path = terrain.path_grid();
                            let blocked = grid.cell(point).is_some_and(|cell| {
                                if path.is_some() { cell != 0 } else { cell == 1 }
                            });
                            if blocked { false }
                            else if let Some(path) = path.filter(|p| p.populated_cells >= 401) {
                                let straight = math.hypot(point[0] - player.x, point[1] - player.y);
                                grid.index(point).is_some_and(|index| {
                                    let distance = path.distances[index];
                                    distance != u16::MAX && f32::from(distance) <= straight * 1.5 + 12.0
                                })
                            } else { true }
                        } else { true };
                        if accepted { return Position { x: point[0], y: point[1], z: height }; }
                    }
                }
            }
            distance -= 2.0;
        }
    }
    fallback_position(center, radius, player, near, far, rng, terrain, math)
}

/// 1454d1b70 shared wave point checker. It always rejects nonzero collision
/// cells; path distance is required only for a present, populated path grid.
pub fn validate_position(zone: &ZoneDefinition, player: Position, point: [f32; 2],
                         terrain: &mut impl Terrain, math: &mut impl PlacementMath) -> Option<Position> {
    let from_center = math.hypot(point[0] - zone.center[0], point[1] - zone.center[1]);
    if from_center > zone.radius + 18.0 { return None; }
    let height = terrain.height(point)?;
    let max_delta = if from_center > zone.radius { 8.0 } else { 25.0 };
    if (height - player.z).abs() > max_delta { return None; }
    if let Some(grid) = terrain.blocked_grid() {
        if grid.cell(point).is_some_and(|cell| cell != 0) { return None; }
        if let Some(path) = terrain.path_grid().filter(|p| p.populated_cells >= 401) {
            let straight = math.hypot(point[0] - player.x, point[1] - player.y);
            let index = grid.index(point)?;
            let path_distance = path.distances[index];
            if path_distance == u16::MAX || f32::from(path_distance) > straight * 1.5 + 12.0 {
                return None;
            }
        }
    }
    Some(Position { x: point[0], y: point[1], z: height })
}
