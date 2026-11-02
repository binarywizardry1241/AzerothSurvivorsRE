//! Live ordinary combat pets; current raw29/stat17 contracts are documented in
//! docs/analysis/ordinary-weapons-pets-0.110.0.md.
use super::*;
use azeroth_survivors_re::run_effects::{pet_power, pet_tick, pets};

#[derive(Debug, Default)]
pub(super) struct State {
    pub grants: Vec<u32>,
    pub started: bool,
    pub rows: Vec<Pet>,
}

#[derive(Debug)]
pub(super) struct Pet {
    pub guid: u64,
    pub allocation_order: u64,
    pub definition: &'static pets::PetDefinition,
    pub relative_angle: f32,
    pub tick: pet_tick::PetTickState,
}

fn position(point: [f32; 3]) -> Position {
    Position {
        x: point[0],
        y: point[1],
        z: point[2],
    }
}
fn coordinates(point: Position) -> [f32; 3] {
    [point.x, point.y, point.z]
}
fn motion(value: ai::Movement) -> pet_tick::PetMotion {
    pet_tick::PetMotion {
        from: coordinates(value.from),
        to: coordinates(value.to),
        started_at: value.started_at,
        duration: value.duration,
    }
}

impl Mechanics {
    pub(super) fn begin_pets(&mut self, player: Position, facing: f32, world: &mut impl RunWorld) {
        if self.pet_state.started {
            return;
        }
        self.pet_state.started = true;
        for (index, entry) in self.pet_state.grants.iter().copied().enumerate() {
            let definition = pets::definition(entry).expect("recovered follower definition");
            let relative_angle = pets::initial_relative_angle(index, self.pet_state.grants.len());
            let xy = pets::spawn_xy(coordinates(player), facing, relative_angle);
            let z = world
                .height(xy)
                .unwrap_or_else(|| Terrain::fallback_height(world));
            let initial = pets::initial_state(
                definition,
                None,
                [xy[0], xy[1], z],
                relative_angle,
                self.clock,
                &mut self.counter,
            );
            self.events.push(RunEvent::Pet(SummonedObject {
                guid: initial.guid,
                position: position(initial.position),
                fields: pets::object_fields(
                    definition,
                    initial.guid,
                    self.player_guid,
                    self.level,
                    self.stats.native_race,
                ),
            }));
            self.pet_state.rows.push(Pet {
                guid: initial.guid,
                allocation_order: initial.allocation_order,
                definition,
                relative_angle,
                tick: pet_tick::PetTickState {
                    motion: pet_tick::PetMotion::stationary(initial.position, self.clock),
                    next_update: initial.next_update,
                    next_attack: initial.next_attack,
                    target_guid: None,
                },
            });
        }
    }
}

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    pub(super) fn pet_tick(
        &mut self,
        rows: &mut [Pet],
        facing: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        // Native caches these movement speeds at the pet-stage entry.
        let speed = aura_movement(
            self.core.numeric.move_speed,
            &execution.auras,
            self.context.now,
        );
        for pet in rows {
            if self.context.now < pet.tick.next_update {
                continue;
            }
            let candidates = self.attack_candidates();
            let center = position(pet.tick.motion.position_at(self.context.now));
            let ordered = azeroth_survivors_re::run_effects::weapon::ordered_targets(
                &candidates,
                self.context.now,
                center,
                pet_tick::query_radius(pet.definition),
            )
            .iter()
            .map(|target| target.guid)
            .collect::<Vec<_>>();
            let raw_flags: std::collections::HashMap<_, _> = candidates
                .iter()
                .map(|target| (target.guid, target.flag))
                .collect();
            let targets = actor_targets(
                self.core.actors,
                self.core.bosses,
                &self.core.boss_state.wards,
                self.core.object_counter.sequence(),
            )
            .into_iter()
            .map(|target| pet_tick::Target {
                guid: target.actor.guid,
                motion: motion(target.actor.movement),
                retained_target_eligible: !target.actor.dead,
                priority: (u8::from(target.has_metadata) * 2)
                    | raw_flags.get(&target.actor.guid).copied().unwrap_or(0),
            })
            .collect::<Vec<_>>();
            let plan = pet_tick::normal_tick(
                &mut pet.tick,
                pet.definition,
                pet_tick::TickContext {
                    now: self.context.now,
                    player_position: coordinates(self.context.player),
                    player_facing: facing,
                    player_speed_multiplier: speed,
                    relative_angle: pet.relative_angle,
                },
                &targets,
                &ordered,
            );
            if pet.definition.spell_id != 0 {
                if let Some(request) = plan.movement {
                    self.move_pet(pet, request);
                }
            }
            if let Some(target) = plan.attack {
                let current = self.core.current_context(self.cast_context, execution);
                let power = pet_power::attack_power(
                    pet.definition.damage,
                    self.core.run_level,
                    current.power.damage_multiplier,
                    &self.core.equipped.stats,
                );
                let draw = behavior::unit24(rng);
                let critical = self.core.numeric.crit > draw;
                let power = pet_power::critical_power(
                    power,
                    self.core.numeric.crit,
                    self.core.numeric.crit_damage,
                    draw,
                );
                let mut hit = PendingHit {
                    context: HitContext {
                        captured_source_kind: Some(2),
                        pet_entry: Some(pet.definition.entry),
                        suppress_damage_log: pet.definition.spell_id == 0,
                        ..Default::default()
                    },
                    target_guid: target,
                    source_guid: pet.guid,
                    effect: pet_tick::normal_ranged_effect(pet.definition).unwrap_or(
                        player_abilities::StatusEffect {
                            tag: 0,
                            value: 0.0,
                            duration: 0.0,
                        },
                    ),
                    resolves_at: self.context.now,
                    spell_id: pet.definition.spell_id,
                    damage: power,
                    critical,
                    damages_player: false,
                    school: pet.definition.school,
                };
                if pet.definition.spell_id == 0 {
                    self.core.events.push(RunEvent::Melee {
                        source: pet.guid,
                        target,
                        amount: power as u32,
                        critical,
                    });
                    self.hit_with_execution(hit, rng, execution, counter);
                } else {
                    let target_position = candidates
                        .iter()
                        .find(|row| row.guid == target)
                        .expect("native query returned a current target")
                        .position;
                    hit.resolves_at = pet_tick::normal_ranged_impact_at(
                        pet.definition,
                        self.context.now,
                        coordinates(center),
                        coordinates(target_position),
                    )
                    .expect("recovered ordinary pet projectile speed");
                    self.core.events.push(RunEvent::Spell(SpellCast {
                        source_guid: pet.guid,
                        spell_id: pet.definition.spell_id,
                        target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(target),
                        hit_targets: vec![target],
                    }));
                    execution.pending.0.push(hit);
                }
            }
            if pet.definition.spell_id == 0 {
                if let Some(request) = plan.movement {
                    self.move_pet(pet, request);
                }
            }
        }
    }

    fn move_pet(&mut self, pet: &mut Pet, request: pet_tick::MovementRequest) {
        let now = self.context.now;
        let start = pet.tick.motion.position_at(now);
        let start_z = self
            .core
            .world
            .height([start[0], start[1]])
            .unwrap_or(start[2]);
        let z = self
            .core
            .world
            .height(request.destination)
            .or_else(|| self.core.world.secondary_height(request.destination))
            .unwrap_or_else(|| Terrain::fallback_height(self.core.world));
        if pet.tick.motion.begin_move(
            now,
            [request.destination[0], request.destination[1], z],
            request.speed,
        ) {
            pet.tick.motion.from[2] = start_z;
            *self.core.movement_counter = self.core.movement_counter.wrapping_add(1);
            self.core.events.push(RunEvent::PetMove {
                guid: pet.guid,
                start: position(pet.tick.motion.from),
                to: position(pet.tick.motion.to),
                duration: pet.tick.motion.duration,
                serial: *self.core.movement_counter,
            });
        }
    }
}
