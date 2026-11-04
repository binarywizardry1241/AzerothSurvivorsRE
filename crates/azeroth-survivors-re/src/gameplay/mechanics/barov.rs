//! Scholomance's Lord Alexei Barov script. See scholomance-barov-0.141.0.md.

use super::{
    gandling::{self, HeroPose, Part, State, Timing},
    scripted_arena::clip_segment,
    *,
};
use azeroth_survivors_re::bosses::{
    abilities::{ground_object, CombatPort},
    scripted_attack_geometry::Shape,
};

pub(super) const ENTRY: u32 = 10504;
pub(super) const IMMOLATE: u32 = 0x45db;
const DEATH_KNELL: u32 = 0x1a85;
const SHADOW_VERDICT: u32 = 0x490e;
const VEIL_OF_SHADOW: u32 = 0x459c;
const INITIAL: [f32; 4] = [1.5, 10.5, 5.5, 18.0];
const REPEAT: [f32; 4] = [24.0, 12.0, 23.0, 28.0];
const PRIORITY: [usize; 4] = [3, 2, 0, 1];

#[derive(Clone, Copy, Debug)]
enum Followup {
    Ring {
        index: usize,
        center: [f32; 2],
        previous_impact: f32,
    },
    Verdict(u32),
}

#[derive(Clone, Debug)]
pub(super) struct Script {
    due: [f32; 4],
    followup: Option<Followup>,
    last_target: Option<u32>,
    burns: Vec<u64>,
    burn_deadline: f32,
}

impl Script {
    pub(super) fn new(now: f32) -> Self {
        Self {
            due: INITIAL.map(|delay| now + delay),
            followup: None,
            last_target: None,
            burns: Vec::new(),
            burn_deadline: 0.0,
        }
    }

    pub(super) fn remove_burns(&mut self, events: &mut Vec<RunEvent>) {
        events.extend(self.burns.drain(..).map(RunEvent::RemoveObject));
    }

    pub(super) fn burn_guids(&self) -> impl Iterator<Item = u64> + '_ {
        self.burns.iter().copied()
    }
}

fn death_knell(center: [f32; 2], index: usize, power: f32) -> Part {
    let (inner, outer, tail, color) = [
        (0.0, 7.5, 0.2, "red"),
        (7.5, 14.0, 0.2, "amber"),
        (14.0, 26.0, 0.25, "violet"),
    ][index];
    Part {
        tail,
        ..Part::impact(
            Shape::Donut {
                center,
                inner,
                outer,
            },
            power * 2.0,
            color,
        )
    }
}

fn immolate_target(heroes: &[HeroPose], boss: Position, last: Option<u32>) -> Option<HeroPose> {
    let distance = |hero: &HeroPose| {
        let dx = hero.position.x - boss.x;
        let dy = hero.position.y - boss.y;
        dx * dx + dy * dy
    };
    heroes.iter().copied().min_by(|left, right| {
        (Some(left.guid as u32) == last)
            .cmp(&(Some(right.guid as u32) == last))
            .then_with(|| distance(left).total_cmp(&distance(right)))
            .then_with(|| left.guid.cmp(&right.guid))
    })
}

fn verdict_parts(
    world: &impl ai::World,
    zone: &ZoneDefinition,
    diagonal: bool,
    power: f32,
) -> Vec<Part> {
    let [x, y, z] = zone.center;
    let origin = Position { x, y, z };
    let color = if diagonal { "violet" } else { "blue" };
    (0..4)
        .map(|index| {
            let degrees = 90.0 * index as f32 + if diagonal { 45.0 } else { 0.0 };
            let angle = degrees * f32::from_bits(0x3c8e_fa35);
            let end = clip_segment(
                world,
                zone,
                origin,
                Position {
                    x: angle.cos() * 100.0 + x,
                    y: angle.sin() * 100.0 + y,
                    z,
                },
            );
            // All four rays share native hit ID zero.
            Part {
                tail: 0.2,
                ..Part::impact(
                    Shape::Capsule {
                        start: [x, y],
                        end: [end.x, end.y],
                        radius: 3.75,
                    },
                    power * 2.1,
                    color,
                )
            }
        })
        .collect()
}

fn veil_parts(world: &impl ai::World, zone: &ZoneDefinition, power: f32) -> Vec<Part> {
    let [x, y, z] = zone.center;
    [-1.0_f32, 1.0]
        .into_iter()
        .map(|side| {
            let start = Position {
                x: x + side * 3.0,
                y: y - 12.0,
                z,
            };
            let requested = Position {
                x: x + side * 103.0,
                ..start
            };
            let bottom = clip_segment(world, zone, start, requested);
            let top = clip_segment(
                world,
                zone,
                Position {
                    y: y + 12.0,
                    ..start
                },
                Position {
                    y: y + 12.0,
                    ..requested
                },
            );
            let end_x = if side < 0.0 {
                bottom.x.max(top.x)
            } else {
                bottom.x.min(top.x)
            };
            Part {
                duration: 4.5,
                ..Part::impact(
                    Shape::Sweep {
                        start: [start.x, start.y],
                        end: [end_x, start.y],
                        width: 3.0,
                        span: [0.0, 24.0],
                    },
                    power * 2.1,
                    "amber",
                )
            }
        })
        .collect()
}

impl<W: RunWorld> BossCombat<'_, W> {
    pub(super) fn advance_barov(&mut self, state: &mut State, heroes: &[HeroPose]) {
        let now = self.now;
        let warning_factor = azeroth_survivors_re::heroic::warning_factor(self.rules.heroic_rank);
        for index in 0..self.bosses.len() {
            let row = &mut self.bosses[index];
            if row.actor.dead {
                continue;
            }
            let Some(mut script) = row.barov.take() else {
                continue;
            };
            let source = row.guid;
            let origin = row.actor.movement.position_at(now);
            let enraged = row.ai.enraged;
            let power = native::ai::effective_ability_damage(
                native::ai::AbilityActor {
                    actor: row.actor,
                    enraged,
                },
                now,
            );
            if now >= script.burn_deadline {
                script.remove_burns(self.events);
            }

            match script.followup {
                Some(Followup::Ring {
                    index,
                    center,
                    previous_impact,
                }) if now >= previous_impact - 0.5 => {
                    let impact_at = previous_impact + 0.9;
                    let windup = (impact_at - now).max(0.05);
                    self.spawn_scripted_with(
                        state,
                        source,
                        DEATH_KNELL,
                        Timing {
                            windup,
                            lock_lead: 0.0,
                            cast: false,
                        },
                        vec![death_knell(center, index, power)],
                        None,
                    );
                    script.followup = (index < 2).then_some(Followup::Ring {
                        index: index + 1,
                        center,
                        previous_impact: impact_at,
                    });
                }
                Some(Followup::Verdict(id)) if !state.has_attack_id(id) => {
                    let parts = verdict_parts(self.world, self.zone, false, power);
                    self.spawn_scripted_with(
                        state,
                        source,
                        SHADOW_VERDICT,
                        Timing {
                            windup: 1.75 * warning_factor,
                            lock_lead: 0.0,
                            cast: false,
                        },
                        parts,
                        None,
                    );
                    script.followup = None;
                }
                None if now >= row.ai.raid_hold_until && !state.has_attack(source, now) => {
                    if let Some(action) = PRIORITY
                        .into_iter()
                        .find(|&action| now >= script.due[action])
                    {
                        let produced = match action {
                            0 => {
                                let center = [origin.x, origin.y];
                                let windup = 1.75 * warning_factor;
                                self.raid_hold(source, windup + 1.8);
                                self.spawn_scripted(
                                    state,
                                    source,
                                    DEATH_KNELL,
                                    windup,
                                    vec![death_knell(center, 0, power)],
                                    None,
                                );
                                script.followup = Some(Followup::Ring {
                                    index: 1,
                                    center,
                                    previous_impact: now + windup,
                                });
                                true
                            }
                            1 => self.barov_immolate(
                                state,
                                heroes,
                                source,
                                origin,
                                power,
                                warning_factor,
                                &mut script,
                            ),
                            2 => {
                                let windup = 1.75 * warning_factor;
                                self.raid_hold(source, 2.0 * windup + 0.4);
                                let parts = verdict_parts(self.world, self.zone, true, power);
                                let id = self.spawn_scripted(
                                    state,
                                    source,
                                    SHADOW_VERDICT,
                                    windup,
                                    parts,
                                    None,
                                );
                                script.followup = Some(Followup::Verdict(id));
                                true
                            }
                            _ => {
                                let windup = 1.75 * warning_factor;
                                self.raid_hold(source, windup);
                                let parts = veil_parts(self.world, self.zone, power);
                                self.spawn_scripted(
                                    state,
                                    source,
                                    VEIL_OF_SHADOW,
                                    windup,
                                    parts,
                                    None,
                                );
                                true
                            }
                        };
                        if produced {
                            let factor = gandling::repeat_factor(self.rules.heroic_rank, enraged);
                            script.due[action] = now + REPEAT[action] * factor;
                        }
                    }
                }
                _ => {}
            }
            self.bosses[index].barov = Some(script);
        }
    }

    fn barov_immolate(
        &mut self,
        state: &mut State,
        heroes: &[HeroPose],
        source: u64,
        origin: Position,
        power: f32,
        warning_factor: f32,
        script: &mut Script,
    ) -> bool {
        let Some(target) = immolate_target(heroes, origin, script.last_target) else {
            return false;
        };
        script.last_target = Some(target.guid as u32);
        let shape = Shape::Circle {
            center: [target.position.x, target.position.y],
            radius: 4.0,
        };
        let windup = 1.5 * warning_factor;
        self.raid_hold(source, windup);
        self.spawn_scripted_with(
            state,
            source,
            IMMOLATE,
            Timing {
                windup,
                lock_lead: 0.9,
                cast: true,
            },
            vec![
                Part {
                    tail: 0.0,
                    tracking: Some(target.guid),
                    ..Part::impact(shape, power * 1.7, "amber")
                },
                Part {
                    id: 1,
                    offset: 0.5,
                    duration: 4.5,
                    interval: 1.0,
                    fill_offset: windup,
                    tracking: Some(target.guid),
                    ..Part::impact(shape, power * 0.3, "red")
                },
            ],
            None,
        );
        true
    }
}

impl Mechanics {
    pub(super) fn apply_barov_immolate(
        &mut self,
        source: u64,
        point: [f32; 2],
        world: &mut impl RunWorld,
    ) {
        let Some(script) = self
            .bosses
            .iter_mut()
            .find(|row| row.guid == source && !row.actor.dead)
            .and_then(|row| row.barov.as_mut())
        else {
            return;
        };
        let position = Position {
            x: point[0],
            y: point[1],
            z: world
                .height(point)
                .or_else(|| world.secondary_height(point))
                .unwrap_or_else(|| Terrain::fallback_height(world)),
        };
        let object = ground_object(&mut self.counter, self.player_guid, 5740, 4.0, position);
        script.burns.push(object.guid);
        script.burn_deadline = self.clock + 5.0;
        self.events.push(RunEvent::Ground(object));
    }
}
