//! Krastinov's Scholomance actions, recovered from the 0.141.0 script header.

use super::*;
use azeroth_survivors_re::{
    bosses::{
        abilities::{CastTarget, Charge, CombatPort},
        scripted_attack_geometry::Shape,
    },
    heroic::warning_factor,
};
use gandling::{HeroPose, Part, State, Timing};
use scripted_arena::clip_segment;
use std::f32::consts::{FRAC_PI_2, PI};

pub(super) const ENTRY: u32 = 11261;
pub(super) const RUSH: u32 = 0x5668;
const CLEAVE: u32 = 0x3bb4;
const BLADESTORM: u32 = 0x690;
pub(super) const HOOK: u32 = 0x3528;
const RUSH_SECONDS: f32 = 0.75;
const STORM_SECONDS: f32 = 4.0;
const STORM_SPEED: f32 = 3.5;
const REPEAT: [f32; 4] = [14.0, 17.0, 23.0, 18.0];
const PRIORITY: [usize; 4] = [2, 3, 1, 0];

#[derive(Clone, Copy, Debug)]
enum Pending {
    Cleave {
        id: u32,
        origin: Position,
        angle: f32,
    },
    Rush {
        at: f32,
        from: Position,
        end: Position,
    },
    Hook {
        id: u32,
        at: f32,
    },
    Storm {
        id: u32,
        target: u64,
        start: f32,
        end: f32,
        next_move: f32,
        next_cast: f32,
    },
}

#[derive(Debug, Clone)]
pub(super) struct Script {
    due: [f32; 4],
    pending: Option<Pending>,
}

impl Script {
    pub(super) fn new(now: f32) -> Self {
        Self {
            due: [1.5, 5.0, 10.5, 10.5].map(|delay| now + delay),
            pending: None,
        }
    }
}

fn xy(position: Position) -> [f32; 2] {
    [position.x, position.y]
}

fn heading(from: Position, to: Position) -> f32 {
    (to.y - from.y).atan2(to.x - from.x)
}

fn offset(origin: Position, angle: f32, distance: f32) -> Position {
    Position {
        x: origin.x + distance * angle.cos(),
        y: origin.y + distance * angle.sin(),
        z: origin.z,
    }
}

fn target(heroes: &[HeroPose], origin: Position, farthest: bool) -> Option<HeroPose> {
    let distance = |hero: &HeroPose| {
        let dx = hero.position.x - origin.x;
        let dy = hero.position.y - origin.y;
        dx * dx + dy * dy
    };
    heroes.iter().copied().min_by(|left, right| {
        let order = distance(left).total_cmp(&distance(right));
        (if farthest { order.reverse() } else { order }).then_with(|| left.guid.cmp(&right.guid))
    })
}

pub(super) fn hook_endpoint(
    world: &impl RunWorld,
    zone: &ZoneDefinition,
    origin: Position,
    angle: f32,
) -> [f32; 2] {
    xy(clip_segment(
        world,
        zone,
        origin,
        offset(origin, angle, 18.0),
    ))
}

fn landing_admitted(world: &impl RunWorld, zone: &ZoneDefinition, [x, y]: [f32; 2]) -> bool {
    let polygon = super::scripted_arena::polygon(zone);
    let inside = polygon.iter().zip(polygon.iter().cycle().skip(1)).fold(
        false,
        |inside, (&[x0, y0], &[x1, y1])| {
            inside ^ ((y < y0) != (y < y1) && x < (y - y0) * (x1 - x0) / (y1 - y0) + x0)
        },
    );
    inside
        && world.blocked_grid().is_none_or(|grid| {
            let gx = x - grid.origin[0];
            let gy = y - grid.origin[1];
            gx < 0.0
                || gy < 0.0
                || gx >= grid.side as f32
                || gy >= grid.side as f32
                || grid.cells[gy as usize * grid.side + gx as usize] == 0
        })
}

impl<W: RunWorld> BossCombat<'_, W> {
    pub(super) fn advance_krastinov(&mut self, state: &mut State, heroes: &[HeroPose]) {
        let now = self.now;
        for index in 0..self.bosses.len() {
            let row = &mut self.bosses[index];
            if row.actor.dead {
                continue;
            }
            let Some(mut script) = row.krastinov.take() else {
                continue;
            };
            let source = row.guid;
            let actor = row.actor;
            let origin = actor.movement.position_at(now);
            let enraged = row.ai.enraged;
            let power = native::ai::effective_ability_damage(
                native::ai::AbilityActor { actor, enraged },
                now,
            );
            let warning = warning_factor(self.rules.heroic_rank);
            script.pending = match script.pending {
                Some(Pending::Cleave { id, origin, angle }) if !state.has_attack_id(id) => {
                    self.krastinov_cleave(
                        state,
                        source,
                        origin,
                        angle - FRAC_PI_2,
                        power,
                        warning,
                        true,
                    );
                    None
                }
                Some(Pending::Rush { at, from, end }) if now >= at => {
                    let distance = (end.x - from.x).hypot(end.y - from.y);
                    let end = if distance < f32::from_bits(0x418ffdf4) {
                        offset(from, heading(from, end), (distance - 0.5).max(0.0))
                    } else {
                        end
                    };
                    let destination = self.krastinov_move(
                        source,
                        from,
                        end,
                        at,
                        RUSH_SECONDS,
                        actor.next_movement_at,
                    );
                    self.events.push(RunEvent::RaidSpellGo(SpellCast {
                        source_guid: source,
                        spell_id: RUSH,
                        target: CastTarget::Ground(destination),
                        hit_targets: Vec::new(),
                    }));
                    None
                }
                Some(Pending::Hook { id, at }) if now >= at => {
                    if let Some([x, y]) = state.capsule_endpoint(id) {
                        let z = self
                            .primary_height([x, y])
                            .or_else(|| self.secondary_height([x, y]))
                            .unwrap_or_else(|| Terrain::fallback_height(self.world));
                        self.events.push(RunEvent::RaidSpellGo(SpellCast {
                            source_guid: source,
                            spell_id: HOOK,
                            target: CastTarget::Ground(Position { x, y, z }),
                            hit_targets: Vec::new(),
                        }));
                    }
                    None
                }
                Some(Pending::Storm {
                    id,
                    target: guid,
                    start,
                    end,
                    mut next_move,
                    mut next_cast,
                }) if state.has_attack_id(id) && now < end => {
                    state.move_circle(id, origin, now, self.events);
                    let mut guid = guid;
                    if now >= start {
                        if now >= next_cast {
                            next_cast = now + 0.5;
                            self.events.push(RunEvent::RaidSpellGo(SpellCast {
                                source_guid: source,
                                spell_id: BLADESTORM,
                                target: CastTarget::None,
                                hit_targets: Vec::new(),
                            }));
                        }
                        if now >= next_move - 0.001 {
                            next_move = now + 0.25;
                            if let Some(hero) = heroes
                                .iter()
                                .copied()
                                .find(|hero| hero.guid == guid)
                                .or_else(|| target(heroes, origin, true))
                            {
                                guid = hero.guid;
                                self.krastinov_pursue(
                                    source,
                                    origin,
                                    hero.position,
                                    end,
                                    actor.next_movement_at,
                                );
                            }
                        }
                    }
                    Some(Pending::Storm {
                        id,
                        target: guid,
                        start,
                        end,
                        next_move,
                        next_cast,
                    })
                }
                Some(Pending::Storm { .. }) => None,
                pending => pending,
            };
            if script.pending.is_none() && !state.has_attack(source, now) {
                if let Some(action) = PRIORITY
                    .into_iter()
                    .find(|&action| now >= script.due[action])
                {
                    if let Some(hero) = target(heroes, origin, action >= 2) {
                        let angle = heading(origin, hero.position);
                        script.pending = self.krastinov_action(
                            state, source, origin, angle, hero.guid, power, warning, action,
                        );
                        script.due[action] = now
                            + REPEAT[action]
                                * gandling::repeat_factor(self.rules.heroic_rank, enraged);
                    }
                }
            }
            self.bosses[index].krastinov = Some(script);
        }
    }

    fn krastinov_action(
        &mut self,
        state: &mut State,
        source: u64,
        origin: Position,
        angle: f32,
        victim: u64,
        power: f32,
        warning: f32,
        action: usize,
    ) -> Option<Pending> {
        let now = self.now;
        match action {
            0 => {
                let windup = 1.5 * warning;
                self.raid_hold_facing(source, windup + RUSH_SECONDS, angle);
                let end = clip_segment(self.world, self.zone, origin, offset(origin, angle, 18.0));
                let angle = heading(origin, end);
                let split = offset(
                    origin,
                    angle,
                    (end.x - origin.x).hypot(end.y - origin.y).min(1.0),
                );
                let mut part = Part::impact(
                    Shape::Sweep {
                        start: xy(origin),
                        end: xy(split),
                        width: 4.0,
                        span: [end.x - split.x, end.y - split.y],
                    },
                    power * 2.3,
                    "amber",
                );
                part.duration = RUSH_SECONDS;
                self.spawn_scripted_with(
                    state,
                    source,
                    RUSH,
                    Timing {
                        windup,
                        lock_lead: windup - 0.8 * warning,
                        visuals: gandling::CastVisuals::DedicatedLaunch,
                    },
                    vec![part],
                    None,
                );
                Some(Pending::Rush {
                    at: now + windup,
                    from: origin,
                    end,
                })
            }
            1 => {
                let hold = if warning < 1.0 {
                    f32::from_bits(0x40500001)
                } else {
                    3.7
                };
                self.raid_hold_facing(source, hold, angle);
                let id = self.krastinov_cleave(
                    state,
                    source,
                    origin,
                    angle + FRAC_PI_2,
                    power,
                    warning,
                    false,
                );
                Some(Pending::Cleave { id, origin, angle })
            }
            2 => {
                let windup = 1.75 * warning;
                self.raid_hold_facing(source, windup + STORM_SECONDS, angle);
                let mut part = Part::impact(
                    Shape::Circle {
                        center: xy(origin),
                        radius: 7.0,
                    },
                    power * 0.4,
                    "amber",
                );
                part.duration = STORM_SECONDS;
                part.interval = 0.5;
                part.tail = 0.3;
                let id = self.spawn_scripted_with(
                    state,
                    source,
                    BLADESTORM,
                    Timing {
                        visuals: gandling::CastVisuals::DedicatedLaunch,
                        ..Timing::standard(windup)
                    },
                    vec![part],
                    None,
                );
                let start = now + windup;
                let end = start + STORM_SECONDS;
                Some(Pending::Storm {
                    id,
                    target: victim,
                    start,
                    end,
                    next_move: start,
                    next_cast: start,
                })
            }
            _ => Some(self.krastinov_hook(state, source, origin, angle, victim, power, warning)),
        }
    }

    fn krastinov_cleave(
        &mut self,
        state: &mut State,
        source: u64,
        origin: Position,
        angle: f32,
        power: f32,
        warning: f32,
        second: bool,
    ) -> u32 {
        let part = Part::impact(
            Shape::Cone {
                origin: xy(origin),
                angle,
                length: 13.0,
                half_angle: FRAC_PI_2,
            },
            power * 2.3,
            if second { "blue" } else { "amber" },
        );
        self.spawn_scripted(state, source, CLEAVE, 1.5 * warning, vec![part], None)
    }

    fn krastinov_hook(
        &mut self,
        state: &mut State,
        source: u64,
        origin: Position,
        angle: f32,
        victim: u64,
        power: f32,
        warning: f32,
    ) -> Pending {
        let windup = 2.5 * warning;
        self.raid_hold_facing(source, windup, angle);
        let end = hook_endpoint(self.world, self.zone, origin, angle);
        let mut part = Part::impact(
            Shape::Capsule {
                start: xy(origin),
                end,
                radius: 1.0,
            },
            power * 1.8,
            "amber",
        );
        part.aim = Some((victim, 0.0));
        let id = self.spawn_scripted_with(
            state,
            source,
            HOOK,
            Timing {
                windup,
                lock_lead: windup - warning,
                visuals: gandling::CastVisuals::DedicatedLaunch,
            },
            vec![part],
            None,
        );
        Pending::Hook {
            id,
            at: self.now + windup,
        }
    }

    fn krastinov_move(
        &mut self,
        source: u64,
        mut from: Position,
        mut to: Position,
        at: f32,
        duration: f32,
        next_move_at: f32,
    ) -> Position {
        from.z = self
            .primary_height(xy(from))
            .or_else(|| self.secondary_height(xy(from)))
            .unwrap_or(from.z);
        to.z = self
            .primary_height(xy(to))
            .or_else(|| self.secondary_height(xy(to)))
            .unwrap_or(from.z);
        self.begin_raid_charge(Charge {
            source_guid: source,
            movement: ai::Movement {
                from,
                to,
                started_at: at,
                duration,
            },
            duration_ms: ((at + duration - self.now).max(0.05) * 1000.0) as u32,
            next_move_at,
            attack_delay: 0.0,
        });
        to
    }

    fn krastinov_pursue(
        &mut self,
        source: u64,
        from: Position,
        target: Position,
        end: f32,
        next_move_at: f32,
    ) {
        let distance = (target.x - from.x).hypot(target.y - from.y);
        if distance <= 1.0 {
            return;
        }
        let angle = heading(from, target);
        let duration = ((distance - 1.0) / STORM_SPEED).min((end - self.now).min(0.5));
        let destination = clip_segment(
            self.world,
            self.zone,
            from,
            offset(from, angle, duration * STORM_SPEED + 0.5),
        );
        let clear_distance = (destination.x - from.x).hypot(destination.y - from.y);
        let duration =
            duration * ((clear_distance - 0.5) / (STORM_SPEED * duration)).clamp(0.0, 1.0);
        if duration >= 0.001 {
            self.krastinov_move(
                source,
                from,
                offset(from, angle, duration * STORM_SPEED),
                self.now,
                duration,
                next_move_at,
            );
        }
    }
}

impl Mechanics {
    pub(super) fn apply_krastinov_hook(
        &mut self,
        origin: [f32; 2],
        player: Position,
        world: &mut impl RunWorld,
    ) {
        if !self.active_run_state() {
            return;
        }
        let player = self
            .boss_state
            .player_override
            .map_or(player, |(position, _)| position);
        let from = Position {
            x: origin[0],
            y: origin[1],
            z: player.z,
        };
        let angle = heading(from, player);
        let offsets =
            std::iter::once(0.0).chain((1..=12).flat_map(|step| [step as f32, -(step as f32)]));
        let landing = offsets
            .map(|step| offset(from, angle + step * PI / 12.0, 4.0))
            .find(|&point| {
                let clipped = clip_segment(world, self.zone, from, point);
                (clipped.x - point.x).hypot(clipped.y - point.y) < 0.001
                    && landing_admitted(world, self.zone, xy(point))
                    && !self
                        .boss_state
                        .gandling
                        .dangerous_landing(self.clock, xy(point))
            });
        let Some(mut point) = landing else {
            return;
        };
        point.z = world
            .height(xy(point))
            .or_else(|| world.secondary_height(xy(point)))
            .unwrap_or(player.z)
            + 0.5;
        let facing = heading(point, from);
        self.boss_state.player_override = Some((point, facing));
        self.events.push(RunEvent::PlayerMover(
            self.player_mover
                .teleport([point.x, point.y, point.z], facing),
        ));
    }

    pub(super) fn apply_krastinov_rush_push(
        &mut self,
        origin: [f32; 2],
        angle: f32,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        let (player, facing) = self.boss_state.player_override.unwrap_or((player, facing));
        let side = angle.cos() * (player.y - origin[1]) - angle.sin() * (player.x - origin[0]);
        let lateral = if side < 0.0 {
            angle - FRAC_PI_2
        } else {
            angle + FRAC_PI_2
        };
        self.apply_scripted_push(lateral, 4.0, player, facing, world);
    }
}
