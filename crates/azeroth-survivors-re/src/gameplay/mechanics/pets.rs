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

impl State {
    pub(super) fn can_learn_kill_command(&self) -> bool {
        self.grants.iter().copied().any(is_command_pet)
    }
}

pub(super) fn is_command_pet(entry: u32) -> bool {
    matches!(entry, 9510 | 9511 | 9532)
}

#[derive(Debug)]
pub(super) struct Pet {
    pub guid: u64,
    pub allocation_order: u64,
    pub definition: &'static pets::PetDefinition,
    pub relative_angle: f32,
    pub tick: pet_tick::PetTickState,
    command: Option<KillCommand>,
}

#[derive(Clone, Copy, Debug)]
struct KillCommand {
    target: u64,
    expires_at: f32,
    strike_at: f32,
    move_at: f32,
    remaining: u8,
    power_multiplier: f32,
    damage: f32,
    impact: Position,
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
            let appearance = if self.effect_state.generic.white_devilsaur {
                pets::white_devilsaur_appearance(definition)
            } else {
                definition
            };
            let relative_angle = pets::initial_relative_angle(index, self.pet_state.grants.len());
            let xy = pets::spawn_xy(coordinates(player), facing, relative_angle);
            let z = world
                .height(xy)
                .unwrap_or_else(|| Terrain::fallback_height(world));
            let initial = pets::initial_state(
                appearance,
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
                    appearance,
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
                command: None,
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

fn command_targets<'a>(
    targets: &'a [Target], pets: &[Pet], hunter_mark: Option<u64>, now: f32,
    center: Position, range: f32, guardians: &guardians::GuardianState,
    bosses: &bosses::BossState,
) -> Vec<&'a Target> {
    let mut candidates = behavior::targeting::radius_targets(targets, now, center, range, &[]);
    candidates.retain(|target| guardians.passive_awake(target.actor.guid) != Some(0));
    // 0x145f27eb0: spread active commands before preferring bosses, elites
    // and marked targets in each category. Equal keys preserve distance order.
    candidates.sort_by_key(|target| {
        let guid = target.actor.guid;
        let assigned = pets.iter().any(|pet| pet.command.is_some_and(|row| row.target == guid));
        let priority = if target.actor.fear_until > now {
            3
        } else if target.has_metadata {
            // The current comparator treats a protected boss as elite unless
            // the exposure deadline takes precedence.
            let defense = bosses.defenses.get(&guid).copied().unwrap_or_default();
            u8::from(defense.multiplier_with_ward(now, bosses.wards.protects(guid)) < 1.0)
        } else if target.flagged || guardians.contains(guid)
            || bosses.wards.actors.iter().any(|ward| ward.guid == guid && ward.parent != 0)
        {
            1
        } else {
            2
        };
        (assigned, priority, priority != 3 && hunter_mark != Some(guid))
    });
    candidates
}

impl<W: RunWorld> CombatAdapter<'_, W> {
    pub(super) fn queue_kill_command(
        &mut self, instance: &RuntimeInstance<'_>, context: CastContext,
        targets: &[Target], hunter_mark: Option<u64>,
    ) -> bool {
        let eligible = |pet: &Pet| {
            is_command_pet(pet.definition.entry) && pet.command.is_none()
        };
        if !self.pets.iter().any(eligible) {
            return false;
        }
        let candidates = command_targets(targets, self.pets, hunter_mark, context.now,
            context.player, instance.definition.range, self.guardian_state, self.boss_state);
        let Some(first) = candidates.first() else { return false; };
        self.events.push(RunEvent::Spell(SpellCast {
            source_guid: context.player_guid,
            spell_id: instance.definition.spell_id,
            target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(first.actor.guid),
            hit_targets: candidates.iter().take(self.pets.iter().filter(|pet| eligible(pet)).count())
                .map(|target| target.actor.guid).collect(),
        }));
        for (pet, target) in self.pets.iter_mut().filter(|pet| eligible(pet)).zip(candidates.iter().cycle()) {
            let target_guid = target.actor.guid;
            pet.tick.target_guid = Some(target_guid);
            pet.command = Some(KillCommand {
                target: target_guid,
                expires_at: context.now + 2.0,
                strike_at: context.now,
                move_at: context.now,
                remaining: if pet.definition.entry == 9511 { 3 } else { 1 },
                power_multiplier: instance.talent_power_multiplier * instance.power_multiplier,
                damage: 0.0,
                impact: target.actor.movement.position_at(context.now),
            });
        }
        true
    }
}

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    pub(super) fn pet_tick(
        &mut self,
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
        for index in 0..self.core.pets.len() {
            if self.core.pets[index].command.is_some() {
                self.tick_kill_command(index, execution, rng, counter);
                continue;
            }
            let pet = &self.core.pets[index];
            if self.context.now < pet.tick.next_update {
                continue;
            }
            let definition = pet.definition;
            let guid = pet.guid;
            let relative_angle = pet.relative_angle;
            let center = position(pet.tick.motion.position_at(self.context.now));
            let candidates = self.attack_candidates();
            let mut ordered = azeroth_survivors_re::run_effects::weapon::ordered_targets(
                &candidates,
                self.context.now,
                center,
                pet_tick::query_radius(definition),
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
            if definition.entry == pets::MATRIARCH.entry {
                if let Some(mark) = self.state.hunters_mark.guid.and_then(|guid| {
                    targets.iter().find(|target| target.guid == guid && target.retained_target_eligible
                        && behavior::execution::distance_squared(
                            position(target.motion.position_at(self.context.now)), self.context.player,
                        ) < 32.0 * 32.0)
                }) {
                    self.core.pets[index].tick.target_guid = Some(mark.guid);
                    ordered.retain(|guid| *guid == mark.guid);
                }
            }
            let plan = pet_tick::normal_tick(
                &mut self.core.pets[index].tick,
                definition,
                pet_tick::TickContext {
                    now: self.context.now,
                    player_position: coordinates(self.context.player),
                    player_facing: facing,
                    player_speed_multiplier: speed,
                    relative_angle,
                },
                &targets,
                &ordered,
            );
            if definition.spell_id != 0 {
                if let Some(request) = plan.movement {
                    self.move_pet(index, request);
                }
            }
            if let Some(target) = plan.attack {
                let current = self.core.current_context(self.cast_context, execution);
                let mut power = pet_power::attack_power(
                    definition.damage,
                    self.core.run_level,
                    current.power.damage_multiplier,
                    &self.core.equipped.stats,
                );
                power *= self.matriarch_mark_multiplier(definition.entry, target);
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
                        pet_entry: Some(definition.entry),
                        meter_attack: (definition.entry == 9532).then(|| CapturedAttack::single("Bite")),
                        suppress_damage_log: definition.spell_id == 0,
                        ..Default::default()
                    },
                    target_guid: target,
                    source_guid: guid,
                    effect: pet_tick::normal_ranged_effect(definition).unwrap_or(
                        player_abilities::StatusEffect {
                            tag: 0,
                            value: 0.0,
                            duration: 0.0,
                        },
                    ),
                    resolves_at: self.context.now,
                    spell_id: definition.spell_id,
                    damage: power,
                    critical,
                    damages_player: false,
                    school: definition.school,
                };
                if definition.spell_id == 0 {
                    self.core.events.push(RunEvent::Melee {
                        source: guid,
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
                        definition,
                        self.context.now,
                        coordinates(center),
                        coordinates(target_position),
                    )
                    .expect("recovered ordinary pet projectile speed");
                    self.core.events.push(RunEvent::Spell(SpellCast {
                        source_guid: guid,
                        spell_id: definition.spell_id,
                        target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(target),
                        hit_targets: vec![target],
                    }));
                    execution.pending.0.push(hit);
                }
            }
            if definition.spell_id == 0 {
                if let Some(request) = plan.movement {
                    self.move_pet(index, request);
                }
            }
        }
    }

    fn matriarch_mark_multiplier(&self, entry: u32, target: u64) -> f32 {
        if entry != 9532 || self.state.hunters_mark.guid != Some(target) {
            return 1.0;
        }
        self.core.equipped.rows.iter().find(|row| row.tag() == 64)
            .map_or(1.0, |row| 1.0 + row.float(4))
    }

    fn tick_kill_command(
        &mut self, index: usize, execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng, counter: &mut dyn NativeCounter,
    ) {
        let pet = &self.core.pets[index];
        let mut command = pet.command.expect("queued Kill Command");
        let definition = pet.definition;
        let guid = pet.guid;
        let now = self.context.now;
        if now >= command.expires_at {
            self.finish_kill_command(index, command, execution, rng, counter);
            return;
        }
        let center = position(pet.tick.motion.position_at(now));
        let targets = actor_targets(self.core.actors, self.core.bosses,
            &self.core.boss_state.wards, self.core.object_counter.sequence());
        let target = targets.iter().find(|row| row.actor.guid == command.target && !row.actor.dead)
            .or_else(|| command_targets(&targets, self.core.pets, self.state.hunters_mark.guid,
                now, center, 12.0, self.core.guardian_state, self.core.boss_state)
                .first().copied());
        let Some(target) = target else {
            self.finish_kill_command(index, command, execution, rng, counter);
            return;
        };
        if command.target != target.actor.guid {
            command.target = target.actor.guid;
            command.move_at = now;
        }
        command.impact = target.actor.movement.position_at(now);
        self.core.pets[index].tick.target_guid = Some(command.target);
        let dx = command.impact.x - center.x;
        let dy = command.impact.y - center.y;
        let distance = (dx * dx + dy * dy).sqrt();
        let clear = |fraction: f32| {
            if fraction >= 1.0 { return true; }
            let remaining = 1.0 - (fraction - 0.5 / distance.max(0.5)).max(0.0);
            dx.abs() * remaining < 0.001 && dy.abs() * remaining < 0.001
        };
        if distance <= 3.5 && now >= command.strike_at
            && self.core.world.ray_fraction(center, command.impact).is_none_or(clear)
        {
            let (label, multiplier) = match definition.entry {
                9511 => ("Raptor Strikes", 0.945),
                9532 => ("Crushing Bite", 2.1),
                _ => ("Wolf Bite", 2.8),
            };
            let context = self.core.current_context(self.cast_context, execution);
            let pet_bonus = 1.0 + self.core.equipped.sum(17);
            let base = definition.damage * 1.4 * context.power.damage_multiplier * pet_bonus;
            let raw = multiplier * base * command.power_multiplier;
            command.damage += raw;
            let power = raw * self.matriarch_mark_multiplier(definition.entry, command.target);
            let draw = behavior::unit24(rng);
            let critical = self.core.numeric.crit > draw;
            let damage = pet_power::critical_power(power, self.core.numeric.crit,
                self.core.numeric.crit_damage, draw);
            command.remaining -= 1;
            command.strike_at = now + 0.2;
            command.expires_at = now + 2.0;
            self.core.pets[index].command = Some(command);
            self.core.events.push(RunEvent::Melee { source: guid, target: command.target,
                amount: damage as u32, critical });
            self.hit_with_execution(PendingHit {
                context: HitContext {
                    captured_source_kind: Some(2),
                    pet_entry: Some(definition.entry),
                    meter_attack: Some(CapturedAttack::single(label)),
                    suppress_damage_log: true,
                    ..Default::default()
                },
                target_guid: command.target, source_guid: guid, resolves_at: now,
                spell_id: 883, damage, critical, damages_player: false, school: 0,
                effect: player_abilities::StatusEffect { tag: 0, value: 0.0, duration: 0.0 },
            }, rng, execution, counter);
            if command.remaining == 0 {
                self.finish_kill_command(index, command, execution, rng, counter);
            }
            return;
        }
        if now >= command.move_at {
            command.move_at = now + 0.2;
            let lead = target.actor.movement.position_at(now + 0.25);
            let dx = lead.x - center.x;
            let dy = lead.y - center.y;
            let length = (dx * dx + dy * dy).sqrt();
            if length > 2.6 {
                let factor = (length - 1.6) / length;
                let mut goal = Position { x: center.x + factor * dx, y: center.y + factor * dy, z: lead.z };
                if let Some(fraction) = self.core.world.ray_fraction(center, goal).filter(|fraction| *fraction < 1.0) {
                    let fraction = (fraction - 0.5 / (length - 1.6).max(0.5)).max(0.0);
                    goal.x = center.x + (goal.x - center.x) * fraction;
                    goal.y = center.y + (goal.y - center.y) * fraction;
                }
                self.move_pet(index, pet_tick::MovementRequest { destination: [goal.x, goal.y], speed: 30.0 });
            }
        }
        self.core.pets[index].command = Some(command);
    }

    fn finish_kill_command(
        &mut self, index: usize, command: KillCommand, execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng, counter: &mut dyn NativeCounter,
    ) {
        use azeroth_survivors_re::bosses::abilities::CastTarget;
        let now = self.context.now;
        let pet = &mut self.core.pets[index];
        pet.command = None;
        pet.tick.next_update = now;
        pet.tick.next_attack = pet.tick.next_attack.max(now + pet.definition.period);
        if !(command.damage > 0.0) {
            return;
        }
        let source = pet.guid;
        let entry = pet.definition.entry;
        let (tag, spell_id, radius_offset) = match entry {
            9510 => (61, 24_604, 12),
            9511 => (62, 11_977, 8),
            9532 => (63, 20_549, 8),
            _ => return,
        };
        let Some((effect_index, effect)) = self.core.equipped.rows.iter().enumerate()
            .find(|(_, row)| row.tag() == tag) else { return; };
        let effect_index = effect_index as u64;
        let (scale, radius) = (effect.float(4), effect.float(radius_offset));
        let targets = actor_targets(self.core.actors, self.core.bosses,
            &self.core.boss_state.wards, self.core.object_counter.sequence());
        let mut hits = behavior::targeting::radius_targets(&targets, now, command.impact, radius, &[]);
        if tag == 61 {
            hits.truncate(effect.word(8) as usize);
        } else if tag == 63 {
            hits.retain(|target| target.actor.guid != command.target);
        }
        self.core.events.push(RunEvent::Spell(SpellCast {
            source_guid: source, spell_id,
            target: if tag == 62 { CastTarget::Ground(command.impact) } else { CastTarget::None },
            hit_targets: hits.iter().map(|target| target.actor.guid).collect(),
        }));
        match tag {
            61 => {
                let expires_at = now + effect.float(16);
                for target in hits {
                    let guid = target.actor.guid;
                    self.core.generic.packlord_howl.entry(guid).or_default()
                        .insert(self.core.party_healing.source_slot, (expires_at, scale));
                    self.core.actor_aura(guid, spell_id, true);
                }
            }
            62 => {
                let interval = effect.float(12) / 5.0;
                let power_per_tick = (command.damage * scale) / 5.0;
                let effect_owner = Some(self.core.player_guid);
                for target in hits {
                    let guid = target.actor.guid;
                    if let Some(rows) = self.core.periodic_rows_mut(guid) {
                        // Native completion appends the bleed even if another
                        // command already added a row for this effect index.
                        rows.push(periodic::ActorPeriodic {
                            owner_kind: 1,
                            owner_guid: effect_index,
                            effect_owner,
                            spell_id,
                            power_per_tick,
                            interval,
                            next_tick_at: now + interval,
                            ticks_remaining: 5,
                            initial_ticks: 5,
                            leech_fraction: 0.0,
                            school: 0,
                        });
                        self.core.actor_aura(guid, spell_id, true);
                    }
                }
            }
            63 => {
                for target in hits {
                    self.hit_with_execution(PendingHit {
                        context: HitContext {
                            captured_source_kind: Some(3),
                            pet_entry: Some(entry),
                            source_words: [1, 0, effect_index as u32, (effect_index >> 32) as u32],
                            ..Default::default()
                        },
                        target_guid: target.actor.guid, source_guid: source, resolves_at: now,
                        spell_id, damage: command.damage * scale, critical: false, damages_player: false,
                        school: 0, effect: player_abilities::StatusEffect { tag: 0, value: 0.0, duration: 0.0 },
                    }, rng, execution, counter);
                }
            }
            _ => unreachable!(),
        }
    }

    fn move_pet(&mut self, index: usize, request: pet_tick::MovementRequest) {
        let now = self.context.now;
        let pet = &mut self.core.pets[index];
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
