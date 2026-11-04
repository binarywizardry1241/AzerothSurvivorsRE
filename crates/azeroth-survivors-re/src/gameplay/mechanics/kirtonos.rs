//! Kirtonos's four actions and fixed final cycle. See scholomance-kirtonos-0.141.0.md.
use super::*;
use azeroth_survivors_re::bosses::{
    abilities::CombatPort,
    raid_transforms::{KirtonosBeat, KirtonosForm},
    scripted_attack_geometry::Shape,
};

pub(super) const ENTRY: u32 = 10506;
pub(super) const VOLLEY: u32 = 17228;
pub(super) const BLOOD_OFFERING: u32 = 7154;
pub(super) const SWOOP: u32 = 18144;
pub(super) const WING_FLAP: u32 = 12882;

const INITIAL: [f32; 4] = [1.5, 5.0, 1.5, 5.0];
const REPEAT: [f32; 4] = [13.0, 17.0, 15.0, 18.0];
const VOLLEY_SPREAD: f32 = f32::from_bits(0x3eb2_b8c2);
const SWOOP_ARC: f32 = f32::from_bits(0x3fbd_e44e);

#[derive(Clone, Debug)]
pub(super) struct Script {
    due: [f32; 4],
    offering_limit: usize,
    offering_cursor: u32,
}

impl Script {
    pub(super) fn new(spawn_at: f32, admitted_hero_count: usize) -> Self {
        let offering_limit = match admitted_hero_count {
            0..=2 => 1,
            3..=4 => 2,
            _ => 3,
        };
        Self {
            due: INITIAL.map(|seconds| spawn_at + seconds),
            offering_limit,
            offering_cursor: 0,
        }
    }

    fn enter_form(&mut self, form: KirtonosForm, fixed: bool, now: f32) {
        if fixed {
            self.due = [f32::INFINITY; 4];
        } else if form == KirtonosForm::Winged {
            let held_until = now + 2.0;
            self.due = [
                f32::INFINITY,
                f32::INFINITY,
                held_until + INITIAL[2],
                held_until + INITIAL[3],
            ];
        }
    }

    fn offering_targets(&mut self, heroes: &[gandling::HeroPose]) -> Vec<gandling::HeroPose> {
        if heroes.is_empty() {
            return Vec::new();
        }
        let mut ordered = heroes.to_vec();
        ordered.sort_unstable_by_key(|hero| hero.guid);
        let start = self.offering_cursor as usize % ordered.len();
        ordered.rotate_left(start);
        ordered.truncate(self.offering_limit);
        self.offering_cursor = self.offering_cursor.wrapping_add(ordered.len() as u32);
        ordered
    }
}

pub(super) fn closest(
    heroes: &[gandling::HeroPose],
    origin: Position,
) -> Option<gandling::HeroPose> {
    let distance = |hero: &gandling::HeroPose| {
        let x = hero.position.x - origin.x;
        let y = hero.position.y - origin.y;
        x * x + y * y
    };
    heroes.iter().copied().min_by(|a, b| {
        distance(a)
            .total_cmp(&distance(b))
            .then_with(|| a.guid.cmp(&b.guid))
    })
}

pub(super) fn volley_endpoint(
    world: &impl RunWorld,
    zone: &ZoneDefinition,
    origin: Position,
    angle: f32,
) -> [f32; 2] {
    let destination = Position {
        x: origin.x + angle.cos() * 30.0,
        y: origin.y + angle.sin() * 30.0,
        ..origin
    };
    let end = scripted_arena::clip_segment(world, zone, origin, destination);
    [end.x, end.y]
}

impl Mechanics {
    pub(super) fn apply_kirtonos_push(
        &mut self,
        origin: [f32; 2],
        fallback: f32,
        distance: f32,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        // Native 0x145fa1a23 runs after damage and uses the current hero pose.
        let (player, facing) = self.boss_state.player_override.unwrap_or((player, facing));
        let away = [player.x - origin[0], player.y - origin[1]];
        let angle = if away[0].hypot(away[1]) >= 0.05 {
            away[1].atan2(away[0])
        } else {
            fallback
        };
        self.apply_scripted_push(angle, distance, player, facing, world);
    }

    pub(super) fn apply_scripted_push(
        &mut self,
        angle: f32,
        distance: f32,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        if !self.active_run_state() {
            return;
        }
        let (player, facing) = self.boss_state.player_override.unwrap_or((player, facing));
        let step = [angle.cos() * distance, angle.sin() * distance];
        let destination = Position {
            x: player.x + step[0],
            y: player.y + step[1],
            ..player
        };
        let desired = (destination.x - player.x).hypot(destination.y - player.y);
        if desired < 0.05 {
            return;
        }
        let end = scripted_arena::clip_segment(world, self.zone, player, destination);
        let clipped = (end.x - player.x).hypot(end.y - player.y);
        let travel = if clipped < desired - 0.001 {
            (clipped - 0.5).max(0.0)
        } else {
            desired
        };
        if travel <= 0.0 {
            return;
        }
        let angle = (destination.y - player.y).atan2(destination.x - player.x);
        let point = [
            player.x + angle.cos() * travel,
            player.y + angle.sin() * travel,
        ];
        let z = world
            .height(point)
            .or_else(|| world.secondary_height(point))
            .unwrap_or(player.z);
        self.boss_state.player_override = Some((
            Position {
                x: point[0],
                y: point[1],
                z,
            },
            facing,
        ));
        self.events.push(RunEvent::PlayerMover(
            self.player_mover
                .knockback(angle, travel / f32::from_bits(0x3f39_cbb6)),
        ));
    }

    pub(super) fn apply_kirtonos_blood(&mut self, source: u64, count: usize) {
        if count == 0 {
            return;
        }
        wards::heal_source(
            &mut self.actors,
            &mut self.bosses,
            &mut self.boss_state.wards,
            &mut self.events,
            source,
            count as f32 * 0.08,
            BLOOD_OFFERING,
        );
    }
}

impl<W: RunWorld> BossCombat<'_, W> {
    pub(super) fn advance_kirtonos(
        &mut self,
        state: &mut gandling::State,
        heroes: &[gandling::HeroPose],
    ) {
        let now = self.now;
        for index in 0..self.bosses.len() {
            let row = &mut self.bosses[index];
            if row.actor.dead {
                continue;
            }
            let Some(mut script) = row.kirtonos.take() else {
                continue;
            };
            let source = row.guid;
            let beat = row
                .kirtonos_forms
                .advance_beat(row.health, row.maximum_health, now);
            let fixed = row.kirtonos_forms.fixed_cycle();
            let due = if let Some(KirtonosBeat::Attack(tag)) = beat {
                Some(usize::from(tag - 1))
            } else if !fixed
                && beat.is_none()
                && now >= row.ai.raid_hold_until
                && !state.has_attack(source, now)
            {
                // The four equal priorities are resolved in action ID order.
                script.due.iter().position(|&deadline| now >= deadline)
            } else {
                None
            };
            if let Some(KirtonosBeat::Form(form)) = beat {
                script.enter_form(form, fixed, now);
                let fields = form.fields(row.definition.model_id, row.definition.scale);
                self.events.push(RunEvent::ActorFields {
                    target: source,
                    fields: fields.fields.clone(),
                });
                self.forms.insert(source, fields);
                self.raid_block(source, 2.0);
                self.raid_hold(source, 2.0);
                self.events.push(RunEvent::RaidTransformCast {
                    source,
                    spell_id: 0x4053,
                    seconds: 2.0,
                });
            }
            if let Some(action) = due {
                let row = &self.bosses[index];
                let origin = row.actor.movement.position_at(now);
                let enraged = row.ai.enraged;
                let power = native::ai::effective_ability_damage(
                    native::ai::AbilityActor {
                        actor: row.actor,
                        enraged,
                    },
                    now,
                );
                if self.cast_kirtonos(state, heroes, &mut script, source, origin, action, power)
                    && !fixed
                {
                    let factor = if self.rules.heroic_rank < 2 {
                        1.0
                    } else if enraged {
                        0.6
                    } else {
                        0.8
                    };
                    script.due[action] = now + REPEAT[action] * factor;
                }
            }
            self.bosses[index].kirtonos = Some(script);
        }
    }

    fn cast_kirtonos(
        &mut self,
        state: &mut gandling::State,
        heroes: &[gandling::HeroPose],
        script: &mut Script,
        source: u64,
        origin: Position,
        action: usize,
        power: f32,
    ) -> bool {
        let center = [origin.x, origin.y];
        let (spell, windup, lock_lead, parts, facing) = match action {
            0 | 2 => {
                let Some(hero) = closest(heroes, origin) else {
                    return false;
                };
                let angle = (hero.position.y - origin.y).atan2(hero.position.x - origin.x);
                if action == 0 {
                    let parts = [-VOLLEY_SPREAD, 0.0, VOLLEY_SPREAD]
                        .into_iter()
                        .map(|offset| {
                            let end =
                                volley_endpoint(self.world, self.zone, origin, angle + offset);
                            let mut part = gandling::Part::impact(
                                Shape::Rect {
                                    start: center,
                                    end,
                                    width: 4.0,
                                },
                                power * 2.5,
                                "violet",
                            );
                            part.aim = Some((hero.guid, offset));
                            part
                        })
                        .collect();
                    (VOLLEY, 2.25, 1.1, parts, Some(angle))
                } else {
                    let mut part = gandling::Part::impact(
                        Shape::Cone {
                            origin: center,
                            angle,
                            length: 16.0,
                            half_angle: SWOOP_ARC * 0.5,
                        },
                        power * 3.4,
                        "blue",
                    );
                    part.aim = Some((hero.guid, 0.0));
                    part.tail = 0.3;
                    (SWOOP, 2.25, 1.9, vec![part], Some(angle))
                }
            }
            1 => {
                let targets = script.offering_targets(heroes);
                if targets.is_empty() {
                    return false;
                }
                let parts = targets
                    .into_iter()
                    .map(|hero| {
                        let mut part = gandling::Part::impact(
                            Shape::Circle {
                                center: [hero.position.x, hero.position.y],
                                radius: 4.5,
                            },
                            power * 2.5,
                            "red",
                        );
                        part.tracking = Some(hero.guid);
                        part
                    })
                    .collect();
                (BLOOD_OFFERING, 1.5, 1.0, parts, None)
            }
            _ => (
                WING_FLAP,
                1.5,
                0.0,
                vec![gandling::Part::impact(
                    Shape::Donut {
                        center,
                        inner: 4.0,
                        outer: 9.0,
                    },
                    power * 2.2,
                    "amber",
                )],
                None,
            ),
        };
        let windup = windup * azeroth_survivors_re::heroic::warning_factor(self.rules.heroic_rank);
        if let Some(angle) = facing {
            self.raid_hold_facing(source, windup, angle);
        } else {
            self.raid_hold(source, windup);
        }
        self.spawn_scripted_with(
            state,
            source,
            spell,
            gandling::Timing {
                windup,
                lock_lead,
                cast: true,
            },
            parts,
            None,
        );
        true
    }
}
