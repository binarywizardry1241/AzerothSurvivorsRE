//! Ras's 0.141.0 Scholomance script. See docs/analysis/scholomance-ras-0.141.0.md.
use super::*;
use azeroth_survivors_re::{
    bosses::{
        abilities::CombatPort,
        scripted_attack_geometry::{Grid, Shape},
    },
    guardians::placement::LairTerrain,
};
use gandling::{HeroPose, Part, State};
use std::f32::consts::{PI, TAU};

pub(super) const ENTRY: u32 = 10508;
const VOLLEY: u32 = 0x20ce;
const CHILL_NOVA: u32 = 0x46b3;
const FROST_ARMOR: u32 = 0x46b4;
const SHIELD_SECONDS: f32 = 8.0;
const SHIELD_REPEAT: f32 = 35.0;
const VULNERABILITY_SECONDS: f32 = 4.0;
const RUNE_RADIUS: f32 = 1.5;
const NEAR_RADII: [f32; 5] = [8.0, 7.0, 9.0, 6.0, 10.0];
const FAR_RADII: [f32; 3] = [12.5, 13.5, 14.5];
const REPEAT: [f32; 3] = [12.0, 17.0, 24.0];

#[derive(Clone, Debug)]
pub(super) struct Script {
    due: [f32; 3],
    armor_due: f32,
    armor_started: bool,
    shield: Option<(u32, f32)>,
    weakened_until: f32,
}

impl Script {
    pub(super) fn new(now: f32) -> Self {
        Self {
            due: [now + 1.5, now + 7.5, now + 4.5],
            armor_due: f32::INFINITY,
            armor_started: false,
            shield: None,
            weakened_until: 0.0,
        }
    }

    pub(super) fn damage_multiplier(&self, now: f32) -> f32 {
        if self.shield.is_some_and(|(_, until)| now < until) {
            0.25
        } else if now < self.weakened_until {
            1.2
        } else {
            1.0
        }
    }
}

fn distance(a: [f32; 2], b: [f32; 2]) -> f32 {
    (a[0] - b[0]).hypot(a[1] - b[1])
}

fn nearest(heroes: &[HeroPose], origin: Position) -> Option<Position> {
    let squared = |position: Position| {
        let dx = position.x - origin.x;
        let dy = position.y - origin.y;
        dx * dx + dy * dy
    };
    heroes
        .iter()
        .min_by(|a, b| {
            squared(a.position)
                .total_cmp(&squared(b.position))
                .then_with(|| a.guid.cmp(&b.guid))
        })
        .map(|hero| hero.position)
}

fn point_inside(point: [f32; 2], polygon: &[[f32; 2]]) -> bool {
    polygon
        .iter()
        .zip(polygon.iter().cycle().skip(1))
        .fold(false, |inside, (&a, &b)| {
            inside
                ^ ((point[1] < a[1]) != (point[1] < b[1])
                    && point[0] < (point[1] - a[1]) * (b[0] - a[0]) / (b[1] - a[1]) + a[0])
        })
}

fn rune_pair(
    world: &impl RunWorld,
    zone: &ZoneDefinition,
    state: &State,
    heroes: &[HeroPose],
    now: f32,
    origin: Position,
    rotation: f32,
    radii: &[f32],
) -> Option<[[f32; 2]; 2]> {
    let polygon = azeroth_survivors_re::zones::resolve(zone.key).polygon;
    let mut candidates = Vec::new();
    for &radius in radii {
        for index in 0..16 {
            let angle = (index as f32 * TAU) * 0.0625 + rotation;
            let point = [
                origin.x + angle.cos() * radius,
                origin.y + angle.sin() * radius,
            ];
            let clear = [[0.0, 0.0], [1.5, 0.0], [-1.5, 0.0], [0.0, 1.5], [0.0, -1.5]]
                .into_iter()
                .all(|[x, y]| {
                    let sample = [point[0] + x, point[1] + y];
                    point_inside(sample, polygon)
                        && !LairTerrain::blocked_at(world, sample[0], sample[1])
                });
            if !clear
                || state.dangerous_rune(now, point)
                || heroes
                    .iter()
                    .any(|hero| distance(point, [hero.position.x, hero.position.y]) < 3.0)
            {
                continue;
            }
            let reachable = heroes.iter().any(|hero| {
                let from = hero.position;
                let to = Position {
                    x: point[0],
                    y: point[1],
                    ..from
                };
                if distance(point, [from.x, from.y]) > 24.0 {
                    return false;
                }
                let clipped = scripted_arena::clip_segment(world, zone, from, to);
                distance(point, [clipped.x, clipped.y]) < 0.01
            });
            let heading = (point[1] - origin.y).atan2(point[0] - origin.x);
            candidates.push((point, reachable, heading));
        }
    }
    let mut best = None;
    let mut best_score = 0.0;
    for (index, &(a, a_reachable, a_heading)) in candidates.iter().enumerate() {
        for &(b, b_reachable, b_heading) in &candidates[index + 1..] {
            if (!a_reachable && !b_reachable) || distance(a, b) < 6.0 {
                continue;
            }
            let wrapped = (a_heading - b_heading + PI) % TAU;
            let separation = ((if wrapped < 0.0 {
                wrapped + TAU
            } else {
                wrapped
            }) - PI)
                .abs();
            if best.is_none() || separation > best_score + 0.0001 {
                best = Some([a, b]);
                best_score = separation;
            }
        }
    }
    best
}

fn checkmate_grid(parity: bool) -> Grid {
    Grid {
        origin: [96.0, 138.0],
        angle: 0.0,
        pitch: 6.0,
        rows: 9,
        columns: 12,
        valid: [0xffff_ffff_ff3f_f3ff, 0x0000_0fff_ffff_ffff],
        danger: if parity {
            [0x5aaa_555a_aa15_52aa, 0x0000_0aaa_555a_aa55]
        } else {
            [0xa555_aaa5_552a_a155, 0x0000_0555_aaa5_55aa]
        },
    }
}

impl<W: RunWorld> BossCombat<'_, W> {
    pub(super) fn advance_ras(
        &mut self,
        state: &mut State,
        heroes: &[HeroPose],
        rng: &mut NativeRng,
    ) {
        let now = self.now;
        let warning = azeroth_survivors_re::heroic::warning_factor(self.rules.heroic_rank);
        for index in 0..self.bosses.len() {
            let row = &mut self.bosses[index];
            if row.actor.dead {
                continue;
            }
            let Some(mut script) = row.ras.take() else {
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
            let phase = !script.armor_started && row.health / row.maximum_health.max(1.0) <= 0.6;
            let held = row.ai.raid_hold_until > now;
            if let Some((attack, until)) = script.shield {
                if now >= until {
                    script.shield = None;
                    script.armor_due = until + SHIELD_REPEAT;
                    self.raid_aura(source, FROST_ARMOR, false);
                } else if state.touches_rune(attack, heroes) {
                    script.shield = None;
                    script.armor_due = now + SHIELD_REPEAT;
                    script.weakened_until = now + VULNERABILITY_SECONDS;
                    self.raid_aura(source, FROST_ARMOR, false);
                    state.retire_attack(attack, now, self.events);
                    self.ras_warning("%s is weakened!");
                }
            }
            if phase || now >= script.armor_due {
                script.armor_started = true;
                script.armor_due = f32::INFINITY;
                let rotation = rng.range_f32(0.0, TAU);
                let pivot = nearest(heroes, origin).unwrap_or(origin);
                let points = rune_pair(
                    self.world,
                    self.zone,
                    state,
                    heroes,
                    now,
                    origin,
                    rotation,
                    &NEAR_RADII,
                )
                .or_else(|| {
                    rune_pair(
                        self.world, self.zone, state, heroes, now, origin, rotation, &FAR_RADII,
                    )
                })
                .or_else(|| {
                    rune_pair(
                        self.world,
                        self.zone,
                        state,
                        heroes,
                        now,
                        pivot,
                        rotation,
                        &NEAR_RADII,
                    )
                })
                .unwrap_or_else(|| {
                    [rotation, rotation + PI]
                        .map(|angle| [pivot.x + 3.0 * angle.cos(), pivot.y + 3.0 * angle.sin()])
                });
                self.raid_aura(source, FROST_ARMOR, true);
                self.events.push(RunEvent::RaidSpellGo(SpellCast {
                    source_guid: source,
                    spell_id: FROST_ARMOR,
                    target: native::abilities::CastTarget::None,
                    hit_targets: Vec::new(),
                }));
                self.ras_warning("%s is shielded!");
                let parts = points
                    .into_iter()
                    .map(|center| {
                        Part::impact(
                            Shape::Circle {
                                center,
                                radius: RUNE_RADIUS,
                            },
                            0.0,
                            "tower",
                        )
                    })
                    .collect();
                let id = self.spawn_scripted_with(
                    state,
                    source,
                    FROST_ARMOR,
                    gandling::Timing {
                        windup: SHIELD_SECONDS,
                        lock_lead: 0.0,
                        cast: false,
                    },
                    parts,
                    None,
                );
                script.shield = Some((id, now + SHIELD_SECONDS));
            }
            let action = (!held && !state.has_attack(source, now))
                .then(|| {
                    [2, 1, 0]
                        .into_iter()
                        .find(|&action| now >= script.due[action])
                })
                .flatten();
            if let Some(action) = action {
                let repeat = if action == 2 {
                    1.0
                } else {
                    gandling::repeat_factor(self.rules.heroic_rank, enraged)
                };
                let windup = [1.5, 2.25, 1.75][action] * warning;
                let produced = match action {
                    0 if script.due[2] > now + windup + 0.25 => {
                        if let Some(target) = nearest(heroes, origin) {
                            let heading = (target.y - origin.y).atan2(target.x - origin.x);
                            let parts = (0..6)
                                .map(|index| {
                                    let angle = index as f32 * TAU / 6.0 + heading;
                                    let end = Position {
                                        x: origin.x + angle.cos() * 20.0,
                                        y: origin.y + angle.sin() * 20.0,
                                        ..origin
                                    };
                                    let end = scripted_arena::clip_segment(
                                        self.world, self.zone, origin, end,
                                    );
                                    Part::impact(
                                        Shape::Capsule {
                                            start: [origin.x, origin.y],
                                            end: [end.x, end.y],
                                            radius: 1.25,
                                        },
                                        power * 2.3,
                                        "violet",
                                    )
                                })
                                .collect();
                            self.raid_hold_facing(source, windup, heading);
                            self.spawn_scripted(state, source, VOLLEY, windup, parts, None);
                            true
                        } else {
                            false
                        }
                    }
                    1 if script.due[2] > now + windup + 0.25 => {
                        self.raid_hold(source, windup);
                        let part = Part::impact(
                            Shape::Circle {
                                center: [origin.x, origin.y],
                                radius: 11.0,
                            },
                            power * 2.6,
                            "blue",
                        );
                        self.spawn_scripted(state, source, CHILL_NOVA, windup, vec![part], None);
                        true
                    }
                    2 => {
                        self.raid_hold(source, windup);
                        let mut part = Part::impact(
                            Shape::Grid(checkmate_grid(rng.next_u64() >> 63 != 0)),
                            power,
                            "blue",
                        );
                        part.tail = 0.3;
                        self.spawn_scripted(state, source, 0, windup, vec![part], None);
                        true
                    }
                    _ => false,
                };
                if produced {
                    script.due[action] = now + REPEAT[action] * repeat;
                }
            }
            self.bosses[index].ras = Some(script);
        }
    }

    fn ras_warning(&mut self, text: &str) {
        self.events
            .push(RunEvent::Announcement(RunAnnouncement::emote(
                AnnouncementLabel::boss(ENTRY, "Ras Frostwhisper"),
                text,
            )));
    }
}
