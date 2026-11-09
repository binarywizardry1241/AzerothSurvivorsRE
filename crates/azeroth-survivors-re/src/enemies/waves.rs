//! Timed elites and the four periodic enemy formations in 0.97.2.
//! Source evidence: docs/analysis/enemy-spawning-0.97.2.md.

use super::catalog::ZoneDefinition;
use super::spawning::{admitted_enemy_indices, select_enemy, validate_position, PlacementMath, Terrain, TickInput};
use super::{NativeRng, Position};

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
#[repr(u8)]
pub enum Pattern { Swarm = 0, Stampede = 1, Wall = 2, Pack = 3 }

impl Pattern {
    pub fn message(self) -> &'static str {
        match self {
            Self::Swarm => "Swarm surrounds you!",
            Self::Stampede => "A stampede charges through!",
            Self::Wall => "A wall of foes closes in!",
            Self::Pack => "A pack hunts you!",
        }
    }
}

pub fn elite_interval(minutes: f32) -> f32 { (minutes * -2.5 + 55.0).max(25.0) }
pub fn pattern_interval(minutes: f32) -> f32 { (minutes * -1.5 + 60.0).max(35.0) }

/// UniformInt's native multiply-high rejection. A one-entry choice still
/// consumes the shared RNG and can retry; do not optimize the draw away.
pub fn uniform_index(count: usize, rng: &mut NativeRng) -> usize {
    assert!(count > 0, "native uniform selection of an empty collection");
    let count = count as u64;
    let zone = (count << count.leading_zeros()).wrapping_sub(1);
    loop {
        let product = u128::from(rng.next_u64()) * u128::from(count);
        if product as u64 <= zone { return (product >> 64) as usize; }
    }
}

pub fn admitted_elite_indices(zone: &ZoneDefinition, minutes: f32) -> Vec<usize> {
    zone.enemies.iter().enumerate()
        .filter(|(_, enemy)| enemy.flag_4c == 1 && minutes >= enemy.raw_48)
        .map(|(index, _)| index).collect()
}

/// Each pattern starts with an admitted low-cost pool. If that pool is empty,
/// every admitted ordinary definition participates instead.
pub fn pattern_candidates(zone: &ZoneDefinition, ordinary: &[usize]) -> Vec<usize> {
    let cheap: Vec<_> = ordinary.iter().copied()
        .filter(|&index| zone.enemies[index].raw_44 <= 1.2).collect();
    if cheap.is_empty() { ordinary.to_vec() } else { cheap }
}

pub fn formation_count(pattern: Pattern, minutes: f32, density_percent: u16) -> usize {
    let scale = (f32::from(density_percent) / 100.0) * 0.6;
    let count = match pattern {
        Pattern::Swarm => (minutes * 2.5 + 12.0) * scale,
        Pattern::Stampede | Pattern::Wall => (minutes + minutes + 10.0) * scale,
        Pattern::Pack => (minutes * 0.8 + 5.0) * scale,
    } as usize;
    count.max(if pattern == Pattern::Pack { 2 } else { 1 })
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct StampedeOrder {
    pub destination: [f32; 2],
    pub until: f32,
    /// Native actor+0x12c resets to the current clock with this order.
    pub next_move_at: f32,
}

/// Native override after successful creation. Only target XY is stored;
/// its Z is unused. Other movement/cast/status fields retain their values.
pub fn apply_stampede(actor: &mut super::ai::Actor, order: StampedeOrder) {
    actor.escape = Some(super::ai::Escape {
        target: Position { x: order.destination[0], y: order.destination[1], z: 0.0 },
        until: order.until,
    });
    actor.next_movement_at = order.next_move_at;
}

pub trait WavePort {
    fn live_entity_count(&self) -> usize;
    /// Use recovered constructor/scaling and append synchronously. None calls
    /// ordinary placement; Some uses the exact position without resampling.
    fn create_enemy(&mut self, enemy_index: usize, position: Option<Position>, rng: &mut NativeRng) -> u64;
    fn enemy_position(&self, _guid: u64, _now: f32) -> Option<Position> { None }
    fn order_stampede(&mut self, guid: u64, order: StampedeOrder);
    /// Native localized message is emitted even if the live-entity cap blocked
    /// all creations; the owning message adapter supplies the enemy name.
    fn announce_pattern(&mut self, pattern: Pattern, enemy_index: usize);
    fn announce_elite(&mut self, enemy_index: usize);
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct WaveTimers {
    pub elite_at: f32,
    pub wave_at: f32,
    /// Game+0x95e; values outside 0..3 allow all four choices.
    pub previous_pattern: u8,
}

fn create(port: &mut impl WavePort, enemy_index: usize, position: Option<Position>,
          input: TickInput<'_>, rng: &mut NativeRng) -> Option<u64> {
    if port.live_entity_count() >= input.population_limit() { return None; }
    Some(port.create_enemy(enemy_index, position, rng))
}

fn radial(player: Position, angle: f32, distance: f32, math: &mut impl PlacementMath) -> [f32; 2] {
    [distance * math.cos(angle) + player.x, distance * math.sin(angle) + player.y]
}

fn center_along(zone: &ZoneDefinition, player: Position, angle: f32, initial: f32,
                terrain: &mut impl Terrain, math: &mut impl PlacementMath) -> Option<Position> {
    let cosine = math.cos(angle);
    let sine = math.sin(angle);
    let mut distance = initial;
    while distance >= 14.0 {
        let point = [cosine * distance + player.x, sine * distance + player.y];
        if let Some(position) = validate_position(zone, player, point, terrain, math) { return Some(position); }
        distance -= 2.0;
    }
    None
}

impl Default for WaveTimers {
    fn default() -> Self { Self { elite_at: 240.0, wave_at: 60.0, previous_pattern: 255 } }
}

impl WaveTimers {
    /// Native Game constructor 14549bb90 establishes these exact timers.
    pub fn new() -> Self { Self::default() }

    /// Runs after ordinary budget/population spawning, within the same raw95b
    /// gate. A due timer selects one elite, with a second adjacent actor on
    /// Heroic; it schedules from now.
    pub fn tick_elite(&mut self, zone: &ZoneDefinition, input: TickInput<'_>,
                      rng: &mut NativeRng, port: &mut impl WavePort) -> usize {
        self.tick_elite_for_rank(zone, input, rng, port, 0)
    }

    pub fn tick_elite_for_rank(&mut self, zone: &ZoneDefinition, input: TickInput<'_>,
        rng: &mut NativeRng, port: &mut impl WavePort, heroic_rank: u8) -> usize {
        if input.suppressed || !(input.clock_seconds >= self.elite_at) { return 0; }
        let minutes = input.effective_minutes;
        let candidates = admitted_elite_indices(zone, minutes);
        // Native even consumes a count-one draw when the candidate list is empty.
        let index = uniform_index(candidates.len().max(1), rng);
        let spawned = if let Some(&enemy_index) = candidates.get(index) {
            let first = create(port, enemy_index, None, input, rng);
            let mut spawned = usize::from(first.is_some());
            if heroic_rank != 0 {
                if let Some(position) = first.and_then(|guid| port.enemy_position(guid, input.clock_seconds)) {
                    let adjacent = Position { x: position.x + 2.5, y: position.y + 1.0, ..position };
                    spawned += usize::from(create(port, enemy_index, Some(adjacent), input, rng).is_some());
                }
            }
            port.announce_elite(enemy_index);
            spawned
        } else { 0 };
        self.elite_at = elite_interval(minutes) + input.clock_seconds;
        spawned
    }

    /// The game chooses one of four kinds except the previous kind, then a
    /// uniform low-cost enemy before dispatch. Stampede/pack override that
    /// choice, but the discarded uniform draw still advances the shared RNG.
    pub fn tick_pattern(&mut self, zone: &ZoneDefinition, input: TickInput<'_>,
                        player: Position, velocity: [f32; 2], speed_percent: u16,
                        rng: &mut NativeRng, terrain: &mut impl Terrain,
                        math: &mut impl PlacementMath, port: &mut impl WavePort) -> usize {
        if input.suppressed || !(input.clock_seconds >= self.wave_at) { return 0; }
        let minutes = input.effective_minutes;
        let ordinary = admitted_enemy_indices(zone, minutes);
        let mut spawned = 0;
        if !ordinary.is_empty() {
            let patterns: Vec<_> = [Pattern::Swarm, Pattern::Stampede, Pattern::Wall, Pattern::Pack]
                .into_iter().filter(|pattern| *pattern as u8 != self.previous_pattern).collect();
            let pattern = patterns[uniform_index(patterns.len(), rng)];
            self.previous_pattern = pattern as u8;
            let candidates = pattern_candidates(zone, &ordinary);
            let mut enemy_index = candidates[uniform_index(candidates.len(), rng)];
            let count = formation_count(pattern, minutes, input.density_percent);
            match pattern {
                Pattern::Swarm => {
                    for index in 0..count {
                        let angle = (index as f32 / count as f32) * std::f32::consts::TAU;
                        let cosine = math.cos(angle);
                        let sine = math.sin(angle);
                        let mut distance = 26.0;
                        while distance >= 8.0 {
                            let point = [distance * cosine + player.x, distance * sine + player.y];
                            if let Some(position) = validate_position(zone, player, point, terrain, math) {
                                spawned += usize::from(create(port, enemy_index, Some(position), input, rng).is_some());
                                break;
                            }
                            distance -= 2.0;
                        }
                    }
                    port.announce_pattern(pattern, enemy_index);
                }
                Pattern::Wall => {
                    let moving = velocity[1] * velocity[1] + velocity[0] * velocity[0] > 4.0;
                    let heading = if moving { math.atan2(velocity[1], velocity[0]) }
                        else { rng.range_f32(0.0, std::f32::consts::TAU) };
                    let first_angle = heading + -1.2;
                    for index in 0..count {
                        let angle = ((index as f32 + 0.5) * 2.4) / count as f32 + first_angle;
                        let cosine = math.cos(angle);
                        let sine = math.sin(angle);
                        let mut distance = 30.0;
                        while distance >= 10.0 {
                            let point = [distance * cosine + player.x, distance * sine + player.y];
                            if let Some(position) = validate_position(zone, player, point, terrain, math) {
                                spawned += usize::from(create(port, enemy_index, Some(position), input, rng).is_some());
                                break;
                            }
                            distance -= 2.0;
                        }
                    }
                    port.announce_pattern(pattern, enemy_index);
                }
                Pattern::Pack => {
                    enemy_index = select_enemy(zone, &ordinary, minutes, rng);
                    let angle = rng.range_f32(0.0, std::f32::consts::TAU);
                    if let Some(center) = center_along(zone, player, angle, 32.0, terrain, math) {
                        for index in 0..count {
                            let radial_angle = index as f32 * 2.4;
                            let distance = (index as f32).sqrt() * 1.6 + 1.0;
                            let point = [math.cos(radial_angle) * distance + center.x,
                                         math.sin(radial_angle) * distance + center.y];
                            let position = validate_position(zone, player, point, terrain, math).unwrap_or(center);
                            spawned += usize::from(create(port, enemy_index, Some(position), input, rng).is_some());
                        }
                        port.announce_pattern(pattern, enemy_index);
                    }
                }
                Pattern::Stampede => {
                    // Native max_by total float order keeps the last tie.
                    enemy_index = *candidates.iter().max_by(|&&a, &&b| {
                        zone.enemies[a].raw_3c.total_cmp(&zone.enemies[b].raw_3c)
                    }).expect("nonempty native pattern candidates");
                    let moving = velocity[1] * velocity[1] + velocity[0] * velocity[0] > 4.0;
                    let heading = if moving {
                        let heading = math.atan2(velocity[1], velocity[0]);
                        // Sign uses the next output's high bit, then the range draw.
                        let side = if rng.next_u64() >> 63 == 0 { -1.57 } else { 1.57 };
                        let jitter = rng.range_f32(-0.4, 0.4);
                        heading + side + jitter
                    } else { rng.range_f32(0.0, std::f32::consts::TAU) };
                    if let Some(center) = center_along(zone, player, heading + std::f32::consts::PI, 34.0, terrain, math) {
                        let cosine = math.cos(heading);
                        let sine = math.sin(heading);
                        let distance = math.hypot(center.x - player.x, center.y - player.y);
                        let travel_distance = distance + distance + 12.0;
                        // Native order: raw speed * 1.05, then percent, then 1.4.
                        let speed = (f32::from(speed_percent) / 100.0)
                            * (zone.enemies[enemy_index].raw_3c * 1.05) * 1.4;
                        let until = input.clock_seconds + travel_distance / speed.max(1.0) + 3.0;
                        let row_width = count - (count >> 1);
                        let half_width = (row_width as f32 + -1.0) * 0.5;
                        for index in 0..count {
                            let row = (index / row_width) as f32;
                            let lateral = ((index % row_width) as f32 - half_width) * 2.6;
                            let point = [(center.x - sine * lateral) - cosine * row * 3.0,
                                         (lateral * cosine + center.y) - row * sine * 3.0];
                            if let Some(position) = validate_position(zone, player, point, terrain, math) {
                                if let Some(guid) = create(port, enemy_index, Some(position), input, rng) {
                                    spawned += 1;
                                    port.order_stampede(guid, StampedeOrder {
                                        destination: [position.x + travel_distance * cosine,
                                                      position.y + travel_distance * sine],
                                        until, next_move_at: input.clock_seconds,
                                    });
                                }
                            }
                        }
                        port.announce_pattern(pattern, enemy_index);
                    }
                }
            }
        }
        self.wave_at = pattern_interval(minutes) + input.clock_seconds;
        spawned
    }
}
