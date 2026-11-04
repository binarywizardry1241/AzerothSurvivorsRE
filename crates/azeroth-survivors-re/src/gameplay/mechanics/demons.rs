//! Live special-demon actors. Ordinary special0 pets keep their own adapter.
use super::*;
use azeroth_survivors_re::{
    run_effects::{
        demon_talents::Config, demons as native, pet_tick::PetMotion, pets as definitions,
    },
    run_meter::CapturedAttack,
};

#[derive(Debug, Default)]
pub(super) struct State {
    pub config: Config,
    pub started: bool,
    pub rows: Vec<Demon>,
    pub requests: Vec<native::SummonRequest>,
    pub imp_recent: Vec<f32>,
}
#[derive(Clone, Debug)]
pub(super) struct Demon {
    pub guid: u64,
    pub allocation_order: u64,
    pub definition: &'static definitions::PetDefinition,
    pub relative_angle: f32,
    pub tick: native::ActorState,
    pub config: Config,
    pub next_special: f32,
    /// Current native follower+7c: one Gate-empowered Infernal/Doomguard attack.
    pub greater_empowered: bool,
    /// Original creation clock, retained independently of later movement starts.
    /// The 0.112.0 AZSPETS producer publishes duration as deadline minus birth.
    pub born_at: f32,
    /// Native temporary-origin effect index; showcase uses usize::MAX.
    /// Current raw34 clocks use the summon timestamp independently of expiry.
    pub origin_effect: Option<usize>,
}
pub(super) fn effect_definition(row: &azeroth_survivors_re::run_effects::EffectRow)
    -> Option<&'static definitions::PetDefinition> {
    let address = u64::from_le_bytes(row.bytes[16..24].try_into().unwrap());
    definitions::definition_at_current_address(address)
}
fn coordinates(p: Position) -> [f32; 3] {
    [p.x, p.y, p.z]
}
fn position(p: [f32; 3]) -> Position {
    Position {
        x: p[0],
        y: p[1],
        z: p[2],
    }
}
fn motion(m: ai::Movement) -> PetMotion {
    PetMotion {
        from: coordinates(m.from),
        to: coordinates(m.to),
        started_at: m.started_at,
        duration: m.duration,
    }
}

#[cfg(test)]
mod follower_tests {
    use super::super::rng_integration::{TerrainFixture, class_run};
    use super::*;

    #[test]
    fn showcase_adds_all_special_followers_once_with_unowned_temporary_origins() {
        let mut game = class_run("warlock", 0);
        game.set_showcase(true);
        game.begin_demons(Position::default(), 0.0, &mut TerrainFixture);
        let after_creation = game.rng.words;
        game.begin_demons(Position::default(), 0.0, &mut TerrainFixture);
        let expected = definitions::showcase_followers(9);
        assert_eq!(game.rng.words, after_creation);
        assert!(game.demon_state.requests.is_empty());
        assert_eq!(
            game.demon_state
                .rows
                .iter()
                .map(|row| row.definition.entry)
                .collect::<Vec<_>>(),
            expected
        );
        assert!(
            game.demon_state
                .rows
                .iter()
                .all(|row| row.origin_effect == Some(usize::MAX)
                    && row.tick.expires_at == Some(40.0)
                    && row.tick.power_multiplier == 1.0)
        );
    }
}


pub(super) fn create(
    state: &mut State,
    now: f32,
    player: Position,
    facing: f32,
    level: u32,
    race: u8,
    world: &mut impl RunWorld,
    counter: &mut dyn NativeCounter,
    events: &mut Vec<RunEvent>,
    rng: &mut NativeRng,
    targets: &[behavior::targeting::Target],
    area: f32,
) -> Vec<Demon> {
    let mut created = Vec::new();
    for request in std::mem::take(&mut state.requests) {
        let definition =
            definitions::definition(request.entry).expect("recovered demon definition");
        assert_ne!(
            definition.special, 0,
            "ordinary pet routed through demon creation"
        );
        // Current145959b30 chooses greater/lesser relative angles before
        // delegating to the shared selected creature constructor.
        let angle = request
            .relative_angle
            .unwrap_or_else(|| native::summon_relative_angle(definition.special, rng));
        let selected = if definition.special == 6 {
            behavior::targeting::ground_center(
                targets,
                now,
                player,
                30.0,
                azeroth_survivors_re::run_effects::demon_effects::infernal_landing_radius(area),
            )
        } else {
            None
        };
        let spawn = if let Some(point) = selected {
            coordinates(point)
        } else {
            let xy = definitions::spawn_xy(coordinates(player), facing, angle);
            let z = world
                .height(xy)
                .or_else(|| world.secondary_height(xy))
                .unwrap_or_else(|| Terrain::fallback_height(world));
            [xy[0], xy[1], z]
        };
        let origin = request
            .lifetime
            .map(|lifetime| definitions::TemporaryOrigin {
                expires_at: now + lifetime,
                effect_index: request.effect_index,
            });
        let initial = definitions::initial_state(definition, origin, spawn, angle, now, counter);
        events.push(RunEvent::Pet(SummonedObject {
            guid: initial.guid,
            position: position(initial.position),
            fields: definitions::object_fields(definition, definition, initial.guid, 1, level, race),
        }));
        let demon = Demon {
            guid: initial.guid,
            allocation_order: initial.allocation_order,
            definition,
            relative_angle: angle,
            config: state.config,
            next_special: now + 1.0,
            greater_empowered: false,
            born_at: now,
            origin_effect: origin.map(|origin| origin.effect_index),
            tick: native::ActorState {
                motion: PetMotion::stationary(initial.position, now),
                next_update: initial.next_update,
                next_attack: initial.next_attack,
                target: None,
                focus: None,
                focus_casts: 0,
                swings: 0,
                expires_at: origin.map(|origin| origin.expires_at),
                power_multiplier: request.power_multiplier,
            },
        };
        if request.relative_angle.is_none() {
            events.push(RunEvent::Spell(SpellCast {
                source_guid: demon.guid,
                spell_id: if definition.special == 6 { 1122 } else { 7741 },
                target: if definition.special == 6 {
                    azeroth_survivors_re::bosses::abilities::CastTarget::Ground(position(
                        initial.position,
                    ))
                } else {
                    azeroth_survivors_re::bosses::abilities::CastTarget::None
                },
                hit_targets: if definition.special == 6 {
                    Vec::new()
                } else {
                    vec![demon.guid]
                },
            }));
        }
        state.rows.push(demon.clone());
        created.push(demon);
    }
    created
}

impl Mechanics {
    /// Current14592a4e8..678 appends one Hellfire ring while any Infernal lives.
    pub(super) fn demon_infernal_visual_scale(&self)
        -> Option<player_abilities::visual_scale::SpellScale> {
        if !self.demon_state.rows.iter().any(|row| row.definition.special == 6) {
            return None;
        }
        let definition = AbilityDefinition::by_key("hellfire").expect("current Hellfire");
        let instance = azeroth_survivors_re::run_effects::demon_spells::infernal_proxy(
            &self.abilities, self.effect_state.equipped.spell_modifiers(definition),
        );
        let radius = azeroth_survivors_re::run_effects::demon_spells::infernal_radius(
            &instance, self.effect_state.numeric.area,
        );
        Some(player_abilities::visual_scale::SpellScale {
            spell_id: 11683, scale: radius / 10.0, attached: false,
        })
    }

    pub fn hud_build_timers(&self) -> Vec<(&str, f32)> {
        if let Some(hud)=self.replica_hud() {
            return hud.get("timers").and_then(serde_json::Value::as_array).into_iter().flatten()
                .filter_map(|row|Some((row.get("icon")?.as_str()?,row.get("left")?.as_f64()? as f32))).collect();
        }
        self.effect_state.equipped.rows.iter().enumerate().filter_map(|(index, row)| {
            if row.tag() != 253 || row.bytes[63] != 34 { return None; }
            let source = self.effect_state.meter_sources.get(index)?;
            let active = self.effect_state.generic.counters.get(index).copied().unwrap_or(0) != 0;
            let timestamp = self.effect_state.generic.deadlines.get(index).copied().unwrap_or(0.0);
            let raw = row.float(8) * self.current_cooldown_multiplier();
            let period = if raw.is_nan() { raw } else { raw.max(row.float(12)) };
            let remaining = if active { (timestamp + period - self.clock).max(0.0) } else { 0.0 };
            Some((source.icon, remaining))
        }).collect()
    }

    pub(super) fn configure_demons(&mut self, config: Config) {
        self.demon_state.config = config;
        // Native attack consumers read the current Game talent allocation.
        // Follower power_multiplier remains the captured creation-time scalar.
        for demon in &mut self.demon_state.rows {
            demon.config = config;
        }
    }
    pub(super) fn begin_demons(
        &mut self,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        if self.demon_state.started {
            return;
        }
        self.demon_state.initialize(self.pet_state.grants.len());
        if self.showcase.enabled {
            // Current Begin adds these after ordinary/granted companions.
            // The existing wrapper retains random-angle/spawn/landing behavior,
            // native special attacks, deferred attribution and timed removal.
            self.demon_state.requests.extend(
                definitions::showcase_followers(self.class.class_id)
                    .iter()
                    .map(|entry| native::SummonRequest {
                        entry: *entry,
                        lifetime: Some(40.0),
                        effect_index: usize::MAX,
                        power_multiplier: 1.0,
                        relative_angle: None,
                    }),
            );
        }
        if !self.demon_state.requests.is_empty() {
            self.create_entry_demons(player, facing, world);
        }
    }

    /// Begin creates the army before the run clock advances and before later
    /// showcase mob/cache/pickup allocation. Use the same canonical callbacks
    /// as a successful-cast summon, including Infernal landing and recursive RNG.
    fn create_entry_demons(&mut self, player: Position, facing: f32, world: &mut impl RunWorld) {
        let context = self.cast_context(player, facing);
        let passive_context = behavior::passive_tick::TickContext {
            now: self.clock,
            delta: 0.0,
            player_guid: self.player_guid,
            player,
            power: context.power,
            global_cooldown: self.current_cooldown_multiplier(),
            global_area: context.global_area,
            global_target_bonus: context.global_target_bonus,
        };
        let extra_cast_factor =
            self.effect_state.numeric.extra_cast - self.effect_state.equipped.sum(13);
        let cooperative_luck = self.active_cooperative_luck();
        let mut port = CombatAdapter {
            party_healing: self.coop.healing_port(),
            player_guid: self.player_guid,
            showcase: self.showcase.enabled,
            actors: &mut self.actors,
            bosses: &mut self.bosses,
            pets: &mut self.pet_state.rows,
            hunter_mark: self.passive_state.hunters_mark.guid,
            boss_state: &mut self.boss_state,
            guardian_state: &mut self.guardian_state,
            affixes: &mut self.affixes,
            pickups: &mut self.pickups,
            object_counter: self.counter.clone(),
            loot: &mut self.loot,
            kills: &mut self.kills,
            elite_kills: &mut self.elite_kills,
            events: &mut self.events,
            healing: &mut self.pending_healing,
            absorbs: &mut self.pending_absorb,
            now: self.clock,
            run_level: self.level,
            player,
            zone: self.zone,
            rules: self.rules,
            stats: RunPlayerStats {
                maximum_health: self.execution.vitals.maximum_health,
                ..self.stats
            },
            class_id: self.class.class_id,
            player_absorb: self.execution.vitals.absorb,
            equipped: &self.effect_state.equipped,
            meter_sources: &self.effect_state.meter_sources,
            meter_definitions: self
                .abilities
                .iter()
                .map(|instance| instance.definition)
                .collect(),
            meter_racial: self.racial.as_ref().map(|instance| instance.definition),
            aura_provenance: &self.effect_state.display_provenance,
            rescue_ready_at: self.effect_state.incoming.lethal_talent_ready_at,
            soul_link_absorb: &mut self.effect_state.incoming.soul_link_absorb,
            special_demons: self.demon_state.rows.len(),
            racial_cooldown: self
                .racial
                .as_ref()
                .filter(|row| row.definition.effect.tag == 11)
                .map(|row| row.remaining),
            movement_counter: &mut self.movement_counter,
            numeric: &mut self.effect_state.numeric,
            stats_recomputed: false,
            pre_stats: self.effect_state.pre_stats,
            cooperative_luck,
            base_stats: self.effect_state.base,
            base_leech: self.effect_state.base_leech,
            generic: &mut self.effect_state.generic,
            extra_cast: false,
            extra_cast_factor,
            leech: self.effect_state.leech,
            world,
            attribution: PassiveAttribution {
                source_kind: 0,
                source_words: [0; 4],
                cast_words: [0; 4],
            },
        };
        port.flush_vitals(&mut self.execution.vitals);
        {
            let mut passive = passives::PassiveCombat {
                core: &mut port,
                learned: &mut self.abilities,
                state: &mut self.passive_state,
                context: passive_context,
                cast_context: context,
                first_periodic: false,
                native_7e4: &mut self.native_7e4,
                object_counter: None,
                native_30: false,
            };
            passive.spawn_demons(
                &mut self.demon_state,
                facing,
                &mut self.execution,
                &mut self.rng,
                &mut self.counter,
            );
        }
        port.flush_vitals(&mut self.execution.vitals);
        let refreshed = port.stats_recomputed.then_some((port.stats, port.leech));
        drop(port);
        if let Some((stats, leech)) = refreshed {
            self.accept_refreshed_stats(stats, leech);
        }
    }
}

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    /// Native preparation precedes the shared ordinary/special pet AI stage.
    pub(super) fn demon_prepare(
        &mut self,
        state: &mut State,
        facing: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let now = self.context.now;
        self.spawn_demons(state, facing, execution, rng, counter);
        let nearby35 = behavior::targeting::radius_targets(
            &actor_targets(
                self.core.actors,
                self.core.bosses,
                &self.core.boss_state.wards,
                self.core.object_counter.sequence(),
            ),
            now,
            self.context.player,
            35.0,
            &[],
        )
        .len()
            != 0;
        // Current expiry compacts before Gate/build clocks or Infernal pulses.
        state.rows.retain(|demon| {
            if demon.tick.expires_at.is_some_and(|end| now + 0.0001 >= end) {
                self.core.events.push(RunEvent::RemoveObject(demon.guid));
                false
            } else { true }
        });
        let effects = self.core.equipped.rows.clone();
        for (index, row) in effects.iter().enumerate() {
            let cooldown = aura_cooldown(self.core.numeric.recovery,
                &execution.auras, now, self.core.numeric.buff_bonus);
            let action = state.lifecycle_action(row, index, now,
                cooldown, nearby35,
                &mut self.core.generic.deadlines, &mut self.core.generic.counters);
            match action {
                super::demon_lifecycle::LifecycleAction::None => {}
                super::demon_lifecycle::LifecycleAction::Summon(request) => {
                    state.requests.push(request);
                    self.spawn_demons(state, facing, execution, rng, counter);
                }
                super::demon_lifecycle::LifecycleAction::Gate { count, lifetime } => {
                    for _ in 0..count {
                        if state.temporary_lesser_count() >= 12 { break; }
                        let Some(entry) = state.gate_entry(rng) else { continue; };
                        state.requests.push(native::SummonRequest { entry, lifetime: Some(lifetime),
                            effect_index: index, power_multiplier: 1.0, relative_angle: None });
                        self.spawn_demons(state, facing, execution, rng, counter);
                    }
                }
            }
        }
        //14590484d..145904b3a pulses all Infernals before the movement loop.
        for demon in &mut state.rows {
            if demon.definition.special == 6 && now >= demon.next_special {
                let greater_factor = if std::mem::take(&mut demon.greater_empowered) { 1.5 } else { 1.0 };
                self.demon_infernal_pulse(demon, false, greater_factor, execution, rng, counter);
                let echo_chance = self.demon_echo_chance(demon);
                if echo_chance > 0.0 && echo_chance > behavior::unit24(rng) {
                    self.demon_infernal_pulse(demon, true, greater_factor, execution, rng, counter);
                }
            }
        }
        azeroth_survivors_re::run_effects::demon_effects::clamp_soul_link_capacity(
            &mut execution.vitals,
            self.core.soul_link_absorb,
        );
        self.core.special_demons = state.rows.len();
    }

    pub(super) fn demon_tick(
        &mut self,
        state: &mut State,
        facing: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let now = self.context.now;
        for index in 0..state.rows.len() {
            if now < state.rows[index].tick.next_update {
                continue;
            }
            let candidates = actor_targets(
                self.core.actors,
                self.core.bosses,
                &self.core.boss_state.wards,
                self.core.object_counter.sequence(),
            );
            let spells = candidates
                .iter()
                .map(|target| {
                    self.core
                        .periodic_rows(target.actor.guid)
                        .map(|rows| {
                            // Current target/Imp owners test retained spell IDs,
                            // including rows whose remaining tick count is zero.
                            rows.iter()
                                .map(|dot| dot.spell_id)
                                .collect::<Vec<_>>()
                        })
                        .unwrap_or_default()
                })
                .collect::<Vec<_>>();
            let targets = candidates
                .iter()
                .enumerate()
                .map(|(i, target)| native::Target {
                    guid: target.actor.guid,
                    motion: motion(target.actor.movement),
                    alive: !target.actor.dead,
                    selectable_at: target.actor.fear_until,
                    seduction_ready_at: self.core.generic.succubus_seduction_ready_at
                        .get(&target.actor.guid).copied().unwrap_or(0.0),
                    health: target.health,
                    maximum_health: target.maximum_health,
                    boss: target.has_metadata,
                    elite: target.flagged,
                    periodic_spells: &spells[i],
                })
                .collect::<Vec<_>>();
            let allocations = state
                .rows
                .iter()
                .enumerate()
                .filter(|(i, _)| *i != index)
                .map(|(_, other)| native::Allocation {
                    target: other.tick.target,
                    special: other.definition.special,
                })
                .collect::<Vec<_>>();
            let missiles = execution
                .pending
                .0
                .iter()
                .map(|hit| native::IncomingMissile {
                    target: hit.target_guid,
                    power: hit.damage,
                    consumed: hit.damages_player,
                })
                .collect::<Vec<_>>();
            let demon = &mut state.rows[index];
            let center = if demon.definition.spell_id == 0 {
                self.context.player
            } else {
                position(demon.tick.motion.position_at(now))
            };
            let candidates = actor_targets(
                self.core.actors,
                self.core.bosses,
                &self.core.boss_state.wards,
                self.core.object_counter.sequence(),
            );
            let ordered = behavior::targeting::radius_targets(&candidates, now, center, 28.0, &[])
                .iter()
                .map(|row| row.actor.guid)
                .collect::<Vec<_>>();
            let focus_ordered = behavior::targeting::radius_targets(
                &candidates, now, position(demon.tick.motion.position_at(now)), 30.0, &[]
            ).iter().map(|row| row.actor.guid).collect::<Vec<_>>();
            let selected = native::select_target(
                demon.definition,
                &demon.tick,
                now,
                coordinates(self.context.player),
                self.core.run_level,
                self.core
                    .current_context(self.cast_context, execution)
                    .power
                    .damage_multiplier,
                &targets,
                &ordered,
                &focus_ordered,
                &allocations,
                &missiles,
            );
            let target = selected.and_then(|id| targets.iter().find(|row| row.guid == id));
            let period = if demon.definition.special == 7 {
                self.demon_doomguard_interval(execution)
            } else {
                native::attack_interval(demon.definition, aura_cooldown(
                    self.core.numeric.recovery, &execution.auras,
                    now, self.core.numeric.buff_bonus,
                ))
            };
            let speed = aura_movement(self.core.numeric.move_speed, &execution.auras, now);
            let plan = native::tick_plan(
                &mut demon.tick,
                demon.definition,
                demon.guid,
                demon.relative_angle,
                facing,
                now,
                coordinates(self.context.player),
                speed,
                target,
                period,
            );
            if demon.definition.spell_id != 0 {
                if let Some(movement) = plan.movement {
                    self.move_demon(demon, movement)
                }
            }
            if let Some(target) = plan.attack {
                if matches!(demon.definition.special, 7 | 8) {
                    let greater_factor = if std::mem::take(&mut demon.greater_empowered) { 1.5 } else { 1.0 };
                    self.demon_spell_attack(demon, target, greater_factor, execution, rng, counter);
                } else if demon.definition.special == 1 {
                    state.imp_recent.retain(|at| now - *at < 1.0);
                    let mut hits = vec![target];
                    let extra_budget = 24_usize.saturating_sub(state.imp_recent.len());
                    let imp_ordered = behavior::targeting::radius_targets(
                        &candidates,
                        now,
                        position(demon.tick.motion.position_at(now)),
                        30.0,
                        &[],
                    );
                    for other in imp_ordered.iter().map(|row| row.actor.guid) {
                        if hits.len() - 1 >= extra_budget {
                            break;
                        }
                        if other != target
                            && targets
                                .iter()
                                .any(|row| row.guid == other && row.periodic_spells.contains(&348))
                        {
                            hits.push(other);
                            state.imp_recent.push(now);
                        }
                    }
                    self.imp_attack(demon, &hits, false, execution, rng, counter);
                    let echo_chance = self.demon_echo_chance(demon);
                    if echo_chance > 0.0 && echo_chance > behavior::unit24(rng) {
                        self.imp_attack(demon, &hits, true, execution, rng, counter);
                    }
                } else {
                    let point = targets
                        .iter()
                        .find(|row| row.guid == target)
                        .expect("selected native target")
                        .motion
                        .position_at(now);
                    let mut hits = vec![target];
                    if matches!(demon.definition.special, 2 | 3 | 5) {
                        let radius = if demon.definition.special == 5 {
                            let radius = self.core.numeric.area * 15.0;
                            if radius > 70.0 {
                                ((radius - 70.0) / 10.0).ln_1p() * 10.0 + 70.0
                            } else { radius }
                        } else {
                            5.0
                        };
                        let cap = if demon.definition.special == 5 {
                            9
                        } else {
                            1
                        };
                        let center = if demon.definition.special == 5 {
                            demon.tick.motion.position_at(now)
                        } else { point };
                        hits.extend(
                            behavior::targeting::radius_targets(
                                &candidates,
                                now,
                                position(center),
                                radius,
                                &[],
                            )
                            .iter()
                            .filter(|row| row.actor.guid != target)
                            .take(cap)
                            .map(|row| row.actor.guid),
                        );
                    }
                    let mut momentum = false;
                    if demon.definition.special == 5 {
                        demon.tick.swings = demon.tick.swings.wrapping_add(1);
                        momentum = demon.tick.swings % 3 == 0;
                        if momentum {
                            self.core.events.push(RunEvent::Spell(SpellCast {
                                source_guid: demon.guid,
                                spell_id: 845,
                                target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(
                                    target,
                                ),
                                hit_targets: hits.clone(),
                            }))
                        }
                    }
                    self.demon_melee(demon, &hits, momentum, false, execution, rng, counter);
                    let echo_chance = self.demon_echo_chance(demon);
                    if echo_chance > 0.0 && echo_chance > behavior::unit24(rng) {
                        // Current1459ebf30 filters the captured list after the
                        // normal swing's synchronous callbacks; it never queries
                        // a replacement victim or advances the swing count.
                        let actors = actor_targets(self.core.actors, self.core.bosses,
                            &self.core.boss_state.wards, self.core.object_counter.sequence());
                        let echo_hits = hits.iter().copied().filter(|guid|
                            actors.iter().any(|row| row.actor.guid == *guid && !row.actor.dead))
                            .collect::<Vec<_>>();
                        self.demon_melee(demon, &echo_hits, momentum, true, execution, rng, counter);
                    }
                }
            }
            if demon.definition.spell_id == 0 {
                if let Some(movement) = plan.movement {
                    self.move_demon(demon, movement)
                }
            }
        }
    }

    fn demon_echo_chance(&self, _demon: &Demon) -> f32 {
        // Current echo gates sum equipped Game7f8/800 stat31 once,
        // independently of the stat-refresh scratch copy.
        self.core.equipped.sum(31)
    }

    pub(super) fn demon_critical(
        &self,
        demon: &Demon,
        base: f32,
        target: u64,
        execution: &ExecutionState<'_>,
        rng: &mut NativeRng,
    ) -> (f32, bool) {
        let mut periodic = Vec::new();
        let vital = self
            .core
            .actors
            .iter()
            .find(|row| row.guid == target)
            .map(|row| {
                periodic.extend(row.periodic.iter().map(|dot| dot.spell_id));
                (row.health, row.maximum_health)
            })
            .or_else(|| {
                self.core
                    .bosses
                    .iter()
                    .find(|row| row.guid == target)
                    .map(|row| {
                        periodic.extend(row.periodic.iter().map(|dot| dot.spell_id));
                        (row.health, row.maximum_health)
                    })
            })
            .or_else(|| {
                self.core
                    .boss_state
                    .wards
                    .actors
                    .iter()
                    .find(|row| row.guid == target)
                    .map(|row| {
                        periodic.extend(row.periodic.iter().map(|dot| dot.spell_id));
                        (row.health, row.maximum_health)
                    })
            });
        let (boss, elite) = actor_targets(
            self.core.actors, self.core.bosses, &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        ).into_iter().find(|row| row.actor.guid == target)
            .map_or((false, false), |row| (row.has_metadata, row.flagged));
        let target = vital.map(|(health, maximum_health)| native::Target {
            guid: target,
            motion: PetMotion::stationary([0.; 3], self.context.now),
            alive: health > 0.0,
            selectable_at: 0.0,
            seduction_ready_at: 0.0,
            health,
            maximum_health,
            boss,
            elite,
            periodic_spells: &periodic,
        });
        //Current14595c200 reads Game7f8/800 (equipped rows) directly. Temporary
        //rows are appended only to the stat-refresh scratch copy.
        let live_stats = &self.core.equipped.stats;
        let stats = native::AttackStats {
            demon_damage: live_stats
                .iter()
                .filter(|(tag, _)| *tag == 17)
                .fold(-0.0, |sum, (_, v)| sum + v),
            demon_crit: live_stats
                    .iter()
                    .filter(|(tag, _)| *tag == 29)
                    .fold(-0.0, |sum, (_, value)| sum + value),
            empowerment: execution
                .auras
                .iter()
                .filter(|a| a.effect.tag == 10 && a.expires_at > self.context.now)
                .fold(0.0, |sum, a| {
                    sum + a.effect.value * (self.core.numeric.buff_bonus + 1.0)
                }),
            health_bonus: execution.vitals.maximum_health
                / (self.core.base_stats.maximum_health
                    + self.core.base_stats.health_per_level
                        * self.core.run_level.saturating_sub(1) as f32)
                    .max(1.0)
                - 1.0,
            damage_reduction: self.core.numeric.armor,
            devourer_rank: demon.config.devourer_rank,
            supremacy: self.core.equipped.sum(32) > 0.0,
        };
        native::critical_attack(
            base,
            demon.definition,
            demon.tick.power_multiplier,
            stats,
            target.as_ref(),
            self.core.numeric.crit,
            self.core.numeric.crit_damage,
            behavior::unit24(rng),
        )
    }

    pub(super) fn demon_pending(
        &mut self,
        demon: &Demon,
        target: u64,
        spell: u32,
        power: f32,
        critical: bool,
        attack: CapturedAttack,
        echo: bool,
        resolves_at: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let hit = PendingHit {
            context: HitContext {
                captured_source_kind: Some(2),
                pet_entry: Some(demon.definition.entry),
                meter_attack: Some(attack),
                suppress_damage_log: spell == 0,
                ..Default::default()
            },
            target_guid: target,
            source_guid: demon.guid,
            effect: player_abilities::StatusEffect {
                tag: 0,
                value: 0.,
                duration: 0.,
            },
            resolves_at,
            spell_id: spell,
            damage: power,
            critical,
            damages_player: false,
            school: demon.definition.school,
        };
        if spell == 0 {
            self.core.events.push(RunEvent::Melee {
                source: demon.guid,
                target,
                amount: power as u32,
                critical,
            });
            self.hit_with_execution(hit, rng, execution, counter);
            self.demon_after_hit(demon, target, power, echo, execution, rng, counter);
        } else {
            execution.pending.0.push(hit)
        }
    }

    fn demon_melee(
        &mut self,
        demon: &Demon,
        targets: &[u64],
        momentum: bool,
        echo: bool,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let base = native::common_base(
            demon.definition,
            self.core.run_level,
            self.core
                .current_context(self.cast_context, execution)
                .power
                .damage_multiplier,
            if momentum { 2.0 } else { 1.0 },
        );
        let attack = CapturedAttack {
            primary: if echo {
                "Demonic Echoes"
            } else if demon.definition.special == 5 {
                "Cleave"
            } else {
                "Melee"
            },
            secondary: (!echo && momentum).then_some("Brutal Momentum"),
            bonus_bits: if !echo && momentum {
                1.0_f32.to_bits()
            } else {
                0
            },
            suppressed: false,
        };
        for &target in targets {
            let (power, critical) = self.demon_critical(demon, base, target, execution, rng);
            self.demon_pending(
                demon,
                target,
                0,
                power,
                critical,
                attack,
                echo,
                self.context.now,
                execution,
                rng,
                counter,
            );
        }
    }

    fn imp_attack(
        &mut self,
        demon: &Demon,
        targets: &[u64],
        echo: bool,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let base = native::common_base(
            demon.definition,
            self.core.run_level,
            self.core
                .current_context(self.cast_context, execution)
                .power
                .damage_multiplier,
            1.0,
        ) * (1.0 + self.core.equipped.sum(30))
            * azeroth_survivors_re::run_effects::demon_spells::imp_fire_multiplier(
                &self.core.equipped.spell_rows,
            );
        let attack = CapturedAttack {
            primary: if echo { "Demonic Echoes" } else { "Firebolt" },
            secondary: None,
            bonus_bits: 0,
            suppressed: false,
        };
        if let Some(&first) = targets.first() {
            //145950ab0 first sends the descriptor spell with an empty hit
            //list, then the requested Firebolt visual with the complete list.
            self.core.events.push(RunEvent::Spell(SpellCast {
                source_guid: demon.guid,
                spell_id: demon.definition.spell_id,
                target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(first),
                hit_targets: Vec::new(),
            }));
            self.core.events.push(RunEvent::Spell(SpellCast {
                source_guid: demon.guid,
                spell_id: 6996,
                target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(first),
                hit_targets: targets.to_vec(),
            }))
        }
        let from = demon.tick.motion.position_at(self.context.now);
        for &target in targets {
            let Some(to) = self.demon_target_position(target) else { continue; };
            let (power, critical) = self.demon_critical(demon, base, target, execution, rng);
            let at = self.context.now + native::distance(from, coordinates(to)) / 30.0;
            self.demon_pending(
                demon,
                target,
                demon.definition.spell_id,
                power,
                critical,
                attack,
                echo,
                at,
                execution,
                rng,
                counter,
            );
        }
    }



    fn move_demon(
        &mut self,
        demon: &mut Demon,
        request: azeroth_survivors_re::run_effects::pet_tick::MovementRequest,
    ) {
        let now = self.context.now;
        let start = demon.tick.motion.position_at(now);
        let start_z = self
            .core
            .world
            .height([start[0], start[1]])
            .unwrap_or(start[2]);
        // Current145939d25 rejects short XY movement before destination probes.
        if native::distance(start, [request.destination[0], request.destination[1], start[2]]) < 0.3 {
            return;
        }
        let z = self
            .core
            .world
            .height(request.destination)
            .or_else(|| self.core.world.secondary_height(request.destination))
            .unwrap_or_else(|| Terrain::fallback_height(self.core.world));
        if demon.tick.motion.begin_move(
            now,
            [request.destination[0], request.destination[1], z],
            request.speed,
        ) {
            demon.tick.motion.from[2] = start_z;
            *self.core.movement_counter = self.core.movement_counter.wrapping_add(1);
            self.core.events.push(RunEvent::PetMove {
                guid: demon.guid,
                start: position(demon.tick.motion.from),
                to: position(demon.tick.motion.to),
                duration: demon.tick.motion.duration,
                serial: *self.core.movement_counter,
            });
        }
    }
}
