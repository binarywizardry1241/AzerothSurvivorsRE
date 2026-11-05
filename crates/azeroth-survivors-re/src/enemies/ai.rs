//! Ordinary actor decisions originally recovered from1454c9510 in0.97.2.
//! Caster sight/chase/completion gates: caster-navigation-0.127.0.md.
//! The engine owns aura ticking, victim damage, spell/projectile resolution,
//! terrain heights and packets. See docs/analysis/enemies-0.97.2.md.

use super::{catalog::EnemyDefinition, Position};

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Movement {
    pub from: Position,
    pub to: Position,
    pub started_at: f32,
    pub duration: f32,
}

impl Movement {
    pub fn position_at(self, now: f32) -> Position {
        if self.duration <= 0.0 {
            return self.to;
        }
        let fraction = (now - self.started_at) / self.duration;
        let fraction = native_max(0.0, fraction);
        let fraction = native_min(1.0, fraction);
        Position {
            x: (self.to.x - self.from.x) * fraction + self.from.x,
            y: (self.to.y - self.from.y) * fraction + self.from.y,
            z: (self.to.z - self.from.z) * fraction + self.from.z,
        }
    }
}

fn native_max(a: f32, b: f32) -> f32 { if a > b { a } else { b } }
fn native_min(a: f32, b: f32) -> f32 { if a < b { a } else { b } }
fn distance(a: Position, b: Position) -> f32 {
    let x = a.x - b.x;
    let y = a.y - b.y;
    (y * y + x * x).sqrt()
}

/// Actor+0x98/+0x9c and +0xa0/+0xa4, respectively. No invented clamping.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct TimedReduction {
    pub fraction: f32,
    pub until: f32,
}

impl TimedReduction {
    pub fn apply(self, value: f32, now: f32) -> f32 {
        if now < self.until { (1.0 - self.fraction) * value } else { value }
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Escape {
    pub target: Position,
    pub until: f32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Actor {
    pub guid: u64,
    pub movement: Movement,
    pub next_movement_at: f32,
    pub attack_delay: f32,
    pub attack_interval: f32,
    pub melee_reach: f32,
    pub movement_speed: f32,
    pub damage: f32,
    pub movement_angle: f32,
    /// Native actor+0x70 == 1; completion uses the current definition pointer.
    pub casting: bool,
    pub cast_ends_at: f32,
    pub dead: bool,
    pub died_at: f32,
    pub fear_until: f32,
    pub stun_until: f32,
    /// Native actor+0x150: move away from the player while this is active.
    pub forced_escape_until: f32,
    pub escape: Option<Escape>,
    pub slow: TimedReduction,
    pub damage_reduction: TimedReduction,
    /// Current native actor+1c8: whirlwind speeds movement and suppresses
    /// ordinary contact/cast admission, independently of raid hold/cast gates.
    pub whirlwind_until: f32,
}

#[derive(Clone, Copy, Debug)]
pub struct Context {
    pub now: f32,
    pub elapsed: f32,
    pub player: Position,
    pub zone_center: Position,
    pub zone_radius: f32,
}

/// Native primary-boss enrage affects movement and damage independently of
/// ordinary timed reductions. Default values preserve ordinary actors.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct CombatModifiers {
    pub movement: f32,
    pub damage: f32,
}

impl Default for CombatModifiers {
    fn default() -> Self { Self { movement: 1.0, damage: 1.0 } }
}

impl CombatModifiers {
    fn movement(self, value: f32) -> f32 {
        if self.movement == 1.0 { value } else { value * self.movement }
    }
    fn damage(self, value: f32) -> f32 {
        if self.damage == 1.0 { value } else { value * self.damage }
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Action {
    Move(Movement),
    Melee { source_guid: u64, damage: f32 },
    BeginCast { source_guid: u64, spell_id: u32, duration: f32 },
    CompleteCast { source_guid: u64, spell_id: u32, damage: f32 },
    Remove { guid: u64 },
}

/// Bind these to real collision and pathfinding. Returning `None` is the
/// native absent-grid/no-correction result, not a replacement flat world.
pub trait World {
    fn ray_fraction(&self, from: Position, to: Position) -> Option<f32>;
    /// Height for the movement packet at this XY. The actor keeps its raw pose.
    fn actor_movement_height(&self, _xy: [f32; 2]) -> Option<f32> {
        None
    }
    /// Current caster/hostile-impact query145b98c90. The live terrain adapter
    /// also applies its blocked-destination correction before this segment.
    /// No occupancy grid admits the cast, as in the native optional-grid path.
    fn sight_clear(&self, from: Position, to: Position) -> bool {
        self.ray_fraction(from, to).is_none_or(|fraction| fraction >= 1.0)
    }
    /// Native chase-path query 1454654b0 with vertical search argument 14.
    /// A correction keeps the actor's current Z; the packet layer samples
    /// terrain heights independently at movement dispatch.
    fn chase_path(&self, from: Position, to: Position, vertical_search: f32) -> Option<[f32; 2]>;
}

/// External CRT calls remain injectable for Windows bit-level comparison.
pub trait Math {
    fn cos(&self, angle: f32) -> f32;
    fn sin(&self, angle: f32) -> f32;
    fn hypot(&self, x: f32, y: f32) -> f32;
}

pub struct HostMath;
impl Math for HostMath {
    fn cos(&self, angle: f32) -> f32 { angle.cos() }
    fn sin(&self, angle: f32) -> f32 { angle.sin() }
    fn hypot(&self, x: f32, y: f32) -> f32 { x.hypot(y) }
}

/// `1454cb201`: in-range includes equality. Unordered UCOMISS takes the
/// moving branch; move refresh requires an ordered now >= deadline.
pub fn movement_due(range: f32, player_distance: f32, outside_zone: bool, now: f32, deadline: f32) -> Option<bool> {
    if !(range >= player_distance) || outside_zone {
        if now >= deadline { Some(true) } else { None }
    } else {
        Some(false)
    }
}

pub fn attack_ranges(definition: &EnemyDefinition, reach: f32) -> (f32, f32) {
    if definition.raw_cast[0] & 1 != 0 {
        let range = f32::from_bits(definition.raw_cast[2]);
        (range + 4.0, range)
    } else {
        (reach, reach * 0.8)
    }
}

/// 1454cbcc2..1454cbd44: travel duration and bounded chase refresh delay.
pub fn chase_timing(from: Position, to: Position, speed: f32) -> (f32, f32) {
    let duration = distance(from, to) / native_max(speed, 0.5);
    (duration, native_min(0.7, native_max(0.25, duration)))
}

/// 1454cc1da..1454cc212: the victim armor fraction is applied only when
/// dispatching melee damage; the floating raw value still feeds on-hit logic.
pub fn melee_damage_after_armor(raw_damage: f32, armor_fraction: f32) -> u32 {
    native_max((1.0 - armor_fraction) * raw_damage, 1.0) as u32
}

/// Clip the caster's requested destination to the recovered inner zone disk.
/// This is 1454cb2b3..1454cbb28, before the 14-unit movement segment limit.
pub fn caster_destination(player: Position, desired: Position, preferred_radius: f32, center: Position, zone_radius: f32, math: &impl Math) -> Position {
    let radius = native_max(zone_radius - 2.0, 1.0);
    let px = player.x - center.x;
    let py = player.y - center.y;
    let dx = desired.x - player.x;
    let dy = desired.y - player.y;
    let length = math.hypot(dx, dy);
    let c = (py * py + px * px) - radius * radius;
    if c >= 0.0 {
        let norm = native_max(math.hypot(px, py), 0.01);
        return Position { x: center.x + radius * (px / norm), y: center.y + radius * (py / norm), z: desired.z };
    }
    let (nx, ny) = if length < 0.01 { (1.0, 0.0) } else { (dx / length, dy / length) };
    let dot = py * ny + px * nx;
    let intersection = (dot * dot - c).sqrt() - dot;
    let clipped = native_min(preferred_radius, intersection);
    let clipped = if clipped.is_nan() { preferred_radius } else { clipped };
    let clipped = native_max(clipped, 0.0);
    Position { x: player.x + clipped * nx, y: player.y + clipped * ny, z: desired.z }
}

impl Actor {
    /// Native ordinary zero/sentinel defaults after creation. Position,
    /// calculated stats and timing come from the actual constructor pipeline.
    pub fn new(guid: u64, position: Position, clock_seconds: f32, stats: super::scaling::InitialStats, timing: super::scaling::InitialTiming) -> Self {
        Self {
            guid,
            movement: Movement { from: position, to: position, started_at: clock_seconds, duration: 0.0 },
            next_movement_at: timing.next_movement_at,
            attack_delay: stats.initial_attack_delay,
            attack_interval: stats.attack_interval,
            melee_reach: stats.melee_reach,
            movement_speed: stats.movement_speed,
            damage: stats.damage,
            movement_angle: timing.facing,
            casting: false,
            cast_ends_at: 0.0,
            dead: false,
            died_at: 0.0,
            fear_until: 0.0,
            stun_until: 0.0,
            forced_escape_until: 0.0,
            escape: None,
            slow: TimedReduction::default(),
            damage_reduction: TimedReduction::default(),
            whirlwind_until: 0.0,
        }
    }

    fn install_move(&mut self, from: Position, to: Position, now: f32, duration: f32, refresh_after: f32, actions: &mut Vec<Action>) {
        self.movement = Movement { from, to, started_at: now, duration };
        self.next_movement_at = now + refresh_after;
        actions.push(Action::Move(self.movement));
    }

    fn ray_clip(from: Position, to: Position, world: &impl World) -> Position {
        match world.ray_fraction(from, to) {
            Some(fraction) if !(fraction >= 1.0) => {
                let denominator = native_max(distance(from, to), 0.5);
                let fraction = native_max(fraction - 0.5 / denominator, 0.0);
                Position { x: (to.x - from.x) * fraction + from.x, y: (to.y - from.y) * fraction + from.y, z: from.z }
            }
            _ => to,
        }
    }

    /// Call at the actor stage of an admitted active run tick. Shared aura
    /// ticking/expiry occurs before this stage, including on stunned actors.
    /// Only ordinary actors belong here: bosses and lair guardians have their
    /// own earlier dispatch branches in the original update.
    pub fn tick(&mut self, definition: &EnemyDefinition, context: Context, world: &impl World, math: &impl Math) -> Vec<Action> {
        self.tick_with_stage(Some(definition), context, world, math, CombatModifiers::default(), |_, _| {})
    }

    /// Shared native actor path. A missing enemy definition is the original
    /// primary-boss null pointer, which selects ordinary contact melee. The
    /// stage runs after status/escape gates and before common chase/attack.
    /// It queues abilities for the owning frame's later dispatch stage.
    pub(crate) fn tick_with_stage(&mut self, definition: Option<&EnemyDefinition>, context: Context,
        world: &impl World, math: &impl Math, modifiers: CombatModifiers,
        stage: impl FnMut(Position, &mut CombatModifiers)) -> Vec<Action> {
        self.tick_with_stage_and_hold(definition, context, world, math, modifiers, 0.0, stage)
    }

    /// Current raid hold1459721a4 is distinct from ordinary mob casting. Fear
    /// and stun admission precede it; movement/attack and boss stages wait.
    pub fn tick_with_stage_and_hold(&mut self, definition: Option<&EnemyDefinition>, context: Context,
        world: &impl World, math: &impl Math, mut modifiers: CombatModifiers, hold_until: f32,
        mut stage: impl FnMut(Position, &mut CombatModifiers)) -> Vec<Action> {
        let mut actions = Vec::new();
        let now = context.now;
        if self.dead {
            if now - self.died_at > 1.2 { actions.push(Action::Remove { guid: self.guid }); }
            return actions;
        }
        let current = self.movement.position_at(now);
        if now < self.fear_until {
            if now >= self.next_movement_at {
                self.movement_angle += 2.4;
                let to = Position { x: math.cos(self.movement_angle) * 2.0 + current.x, y: math.sin(self.movement_angle) * 2.0 + current.y, z: current.z };
                let to = Self::ray_clip(current, to, world);
                self.install_move(current, to, now, 0.8, 0.8 + 0.6, &mut actions);
                // The native deadline is computed in this order, before the
                // actor loop. Reassociation changes some f32 boundaries.
                self.next_movement_at = (now + 0.8) + 0.6;
            }
            return actions;
        }
        if self.stun_until > now { return actions; }
        if hold_until > now { return actions; }
        self.attack_delay -= context.elapsed;
        let player_distance = distance(current, context.player);
        let speed = self.raid_movement(modifiers.movement(self.slow.apply(self.movement_speed, now)), now);
        let damage = modifiers.damage(self.damage_reduction.apply(self.damage, now));
        if now < self.forced_escape_until {
            if now >= self.next_movement_at {
                let norm = native_max(player_distance, 0.1);
                let to = Position { x: (current.x - context.player.x) / norm * 8.0 + current.x, y: (current.y - context.player.y) / norm * 8.0 + current.y, z: current.z };
                let to = Self::ray_clip(current, to, world);
                self.install_move(current, to, now, 8.0 / (speed * 0.8), 0.8, &mut actions);
            }
            return actions;
        }
        if let Some(escape) = self.escape {
            if self.attack_delay <= 0.0 && player_distance <= self.melee_reach && !(now < self.whirlwind_until) {
                self.attack_delay = self.attack_interval;
                actions.push(Action::Melee { source_guid: self.guid, damage });
            }
            let length = math.hypot(escape.target.x - current.x, escape.target.y - current.y);
            if now < escape.until && length >= 2.0 {
                if !(now >= self.next_movement_at) { return actions; }
                let fraction = native_min(14.0 / length, 1.0);
                let to = Position { x: (escape.target.x - current.x) * fraction + current.x, y: (escape.target.y - current.y) * fraction + current.y, z: current.z };
                let to = Self::ray_clip(current, to, world);
                let length = distance(current, to);
                if length >= 1.0 {
                    let duration = length / (native_max(speed, 0.5) * 1.4);
                    self.install_move(current, to, now, duration, duration, &mut actions);
                    return actions;
                }
            }
            self.escape = None;
            self.next_movement_at = now;
            if player_distance > 40.0 {
                actions.push(Action::Remove { guid: self.guid });
                return actions;
            }
        }
        stage(current, &mut modifiers);
        let speed = self.raid_movement(modifiers.movement(self.slow.apply(self.movement_speed, now)), now);
        let damage = modifiers.damage(self.damage_reduction.apply(self.damage, now));
        let caster = definition.is_some_and(|definition| definition.raw_cast[0] == 1);
        let (range, preferred) = definition.map(|definition| attack_ranges(definition, self.melee_reach))
            .unwrap_or((self.melee_reach, self.melee_reach * 0.8));
        let outside = caster && math.hypot(current.x - context.zone_center.x, current.y - context.zone_center.y) > context.zone_radius;
        let sight_clear = !caster || world.sight_clear(current, context.player);
        if self.casting {
            if now >= self.cast_ends_at {
                self.casting = false;
                if let Some(definition) = definition.filter(|definition| sight_clear && definition.raw_cast[0] & 1 != 0) {
                    actions.push(Action::CompleteCast { source_guid: self.guid, spell_id: definition.raw_cast[1], damage });
                }
            }
            return actions;
        }
        match movement_due(range, player_distance, outside || !sight_clear, now, self.next_movement_at) {
            None => return actions,
            Some(true) => {
                self.movement_angle += 0.15;
                //145c3d9fa..145c3da1d: a blocked caster already inside
                //attack range walks close to the victim instead of orbiting
                //at its usual ranged radius. Out-of-range chase is unchanged.
                let preferred = if !sight_clear && !(range < player_distance) {
                    1.5
                } else { native_max(preferred, 1.5) };
                let mut to = Position { x: math.cos(self.movement_angle) * preferred + context.player.x, y: math.sin(self.movement_angle) * preferred + context.player.y, z: context.player.z };
                if caster {
                    if outside { to = current; }
                    to = caster_destination(context.player, to, preferred, context.zone_center, context.zone_radius, math);
                }
                let length = distance(current, to);
                if length > 14.0 {
                    let fraction = 14.0 / length;
                    to = Position { x: (to.x - current.x) * fraction + current.x, y: (to.y - current.y) * fraction + current.y, z: current.z };
                }
                if let Some([x, y]) = world.chase_path(current, to, 14.0) {
                    to = Position { x, y, z: current.z };
                }
                let (duration, refresh) = chase_timing(current, to, speed);
                self.install_move(current, to, now, duration, refresh, &mut actions);
            }
            Some(false) => {
                if self.movement.duration > 0.0 && now < self.movement.started_at + self.movement.duration {
                    self.movement = Movement { from: current, to: current, started_at: now, duration: 0.0 };
                    actions.push(Action::Move(self.movement));
                }
                if self.attack_delay <= 0.0 && !(now < self.whirlwind_until) {
                    self.attack_delay = self.attack_interval;
                    if let Some(definition) = definition.filter(|definition| definition.raw_cast[0] & 1 != 0) {
                        let duration = f32::from_bits(definition.raw_cast[3]);
                        self.casting = true;
                        self.cast_ends_at = now + duration;
                        actions.push(Action::BeginCast { source_guid: self.guid, spell_id: definition.raw_cast[1], duration });
                    } else {
                        actions.push(Action::Melee { source_guid: self.guid, damage });
                    }
                }
            }
        }
        actions
    }

    pub fn movement_speed_at(&self, now: f32) -> f32 {
        self.raid_movement(self.slow.apply(self.movement_speed, now), now)
    }

    fn raid_movement(&self, speed: f32, now: f32) -> f32 {
        if now < self.whirlwind_until { speed * f32::from_bits(0x3faccccd) } else { speed }
    }
}
