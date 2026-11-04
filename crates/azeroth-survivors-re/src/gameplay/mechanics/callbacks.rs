//! Synchronous current generic effect0/6/7/9/12/14/17/18 event consumers.
//! Complete native switch and unresolved families are recorded in the owning report.
use super::*;
use azeroth_survivors_re::bosses::abilities::CastTarget;
use azeroth_survivors_re::run_effects::conditions::Event;
use behavior::hit_passives::HitPassivePort;
use behavior::targeting;
#[path = "milestones.rs"]
mod milestones;

pub(super) const FROST_SHOCK_AURA: u32 = 8056;

#[derive(Debug, Default)]
pub(super) struct State {
    /// Selected feat snapshot's ordered (definition id, killing spell id) pairs.
    pub killing_blows: Vec<(u32, u32)>,
    /// Current extended lethal-hit records and the deduplicated incoming-boss
    /// history are run-local; neither is reconstructed from damage meters.
    pub boss_killing_blows: Vec<azeroth_survivors_re::account_progression::BossKillingBlow>,
    pub damaged_by_bosses: Vec<u32>,
    pub deadlines: Vec<f32>,
    pub cooldowns_dirty: bool,
    pub depth: u32,
    pub first_criticals: Vec<u32>,
    pub enhancement: enhancement::State,
    pub source: Option<usize>,
    /// Current named-pet descriptor, restored with deferred hit attribution.
    pub meter_pet_entry: Option<u32>,
    pub meter_attack: Option<azeroth_survivors_re::run_meter::CapturedAttack>,
    pub timestamps: Vec<Vec<f32>>,
    pub counters: Vec<u32>,
    pub temporary: azeroth_survivors_re::run_effects::actions::TemporaryStats,
    pub healing: azeroth_survivors_re::run_effects::healing::HealingState,
    seeds_of_life: Vec<SeedOfLife>,
    pub healing_meter: azeroth_survivors_re::run_effects::healing::HealingMeter,
    pub damage_meters: azeroth_survivors_re::run_meter::DamageMeters,
    pub player_auras: azeroth_survivors_re::run_effects::player_auras::PlayerAuraState,
    pub aura_slots:
        std::collections::BTreeMap<u64, azeroth_survivors_re::run_effects::presentation::AuraSlots>,
    pub frost_shock_durations: std::collections::BTreeMap<u64, f32>,
    pub reduction_spells: std::collections::BTreeMap<u64, u32>,
    pub reduction_durations: std::collections::BTreeMap<u64, f32>,
    pub actor_weakening: std::collections::BTreeMap<u64, state::StrongestWindow>,
    pub demoralizing_amplification: std::collections::BTreeMap<u64, state::StrongestWindow>,
    pub packlord_howl: std::collections::BTreeMap<u64, std::collections::BTreeMap<u8, (f32, f32)>>,
    pub appearance_overrides: std::collections::BTreeMap<u64, (u32, f32)>,
    /// Current Game128 vector: all Felhunters share a3-second victim cooldown.
    pub consume_magic_ready_at: std::collections::BTreeMap<u64, f32>,
    /// Current Game110 vector: all Succubi share a5-second Seduction cooldown.
    pub succubus_seduction_ready_at: std::collections::BTreeMap<u64, f32>,
}

#[derive(Clone, Copy, Debug)]
struct SeedOfLife {
    target: u64,
    effect_index: usize,
    resolves_at: f32,
    position: Position,
    power: f32,
    nearby: usize,
    radius: f32,
    double_strike: bool,
}

#[derive(Clone, Copy)]
pub(super) enum ActorAuraUpdate {
    Remove { target: u64, spell_id: u32 },
    Applications { target: u64, spell_id: u32 },
}

impl State {
    pub(super) fn packlord_amplification(&self, guid: u64, owner: u8, now: f32) -> f32 {
        self.packlord_howl.get(&guid)
            .and_then(|howls| howls.get(&owner))
            .filter(|(expires_at, _)| now < *expires_at)
            .map_or(0.0, |(_, amount)| *amount)
    }

    /// Current145c02620 consumes the dirty flag and publishes every positive,
    /// finite learned timer through the ordinary millisecond cooldown path.
    pub(super) fn flush_cooldowns(
        &mut self,
        learned: &[RuntimeInstance<'_>],
        effects: &azeroth_survivors_re::run_effects::Effects,
        auras: &[buffs::Aura],
        now: f32,
        published: &mut Vec<(u32, RunCooldown)>,
    ) {
        if !std::mem::take(&mut self.cooldowns_dirty) { return; }
        for ability in learned.iter().filter(|ability|
            ability.remaining > 0.0 && ability.remaining.is_finite())
        {
            let spell_id = ability.definition.spell_id;
            let remaining = enhancement::cooldown_wall_time(
                &effects.rows, auras, now, ability.definition.key, ability.remaining,
            );
            let cooldown = RunCooldown::published(now, remaining);
            if let Some((_, old)) = published.iter_mut().find(|(id, _)| *id == spell_id) {
                *old = cooldown;
            } else {
                published.push((spell_id, cooldown));
            }
        }
    }

    pub(super) fn aura_event(
        &mut self,
        target: u64,
        spell_id: u32,
        present: bool,
        periodic: &[periodic::ActorPeriodic],
    ) -> Option<RunEvent> {
        self.aura_slots
            .entry(target)
            .or_default()
            .apply(spell_id, present, periodic)
            .map(|fields| RunEvent::Aura {
                target,
                spell_id,
                present,
                fields,
            })
    }
    /// The shared status publishes control, weakening, and Frost Shock auras.
    pub(super) fn apply_actor_status(
        &mut self,
        actor: &mut Actor,
        window: &mut ControlWindow,
        ordinary: bool,
        periodic: &[periodic::ActorPeriodic],
        now: f32,
        effect: player_abilities::StatusEffect,
        spell_id: u32,
        movement_counter: &mut u32,
        world: &mut impl RunWorld,
    ) -> Vec<RunEvent> {
        if actor.dead {
            return Vec::new();
        }
        let mut events = Vec::new();
        let changed = if effect.tag == 10 {
            let weakening = self.actor_weakening.entry(actor.guid).or_insert(state::StrongestWindow {
                active: actor.damage_reduction, ..Default::default()
            });
            weakening.insert(now, effect.value, now + effect.duration);
            actor.damage_reduction = weakening.active;
            true
        } else { state::apply_actor_reduction_or_fear(actor, window, ordinary, now, effect) };
        if effect.tag == 1 && changed {
            if spell_id == FROST_SHOCK_AURA {
                self.frost_shock_durations.insert(actor.guid, effect.duration);
                events.extend(self.aura_event(actor.guid, spell_id, true, periodic));
            } else if self.frost_shock_durations.remove(&actor.guid).is_some() {
                events.extend(self.aura_event(actor.guid, FROST_SHOCK_AURA, false, periodic));
            }
        }
        if matches!(effect.tag, 2 | 3) {
            let position = actor.movement.position_at(now);
            if state::apply_control(actor, window, ordinary, now, effect.value, position) {
                let mut stopped_at = position;
                if let Some(height) = world.height([position.x, position.y]) {
                    stopped_at.z = height;
                }
                actor.movement.from = stopped_at;
                actor.movement.to = stopped_at;
                *movement_counter = movement_counter.wrapping_add(1);
                events.push(RunEvent::StoppedMovement {
                    target: actor.guid,
                    position: stopped_at,
                    serial: *movement_counter,
                });
                events.extend(self.aura_event(actor.guid, spell_id, true, periodic));
            }
        } else if effect.tag == 10 && changed && spell_id != 0 {
            if actor.damage_reduction.fraction == effect.value
                && actor.damage_reduction.until == now + effect.duration
            {
                self.reduction_durations.insert(actor.guid, effect.duration);
            }
            let previous = self
                .reduction_spells
                .insert(actor.guid, spell_id)
                .unwrap_or(0);
            if previous != spell_id {
                if previous != 0 {
                    events.extend(self.aura_event(actor.guid, previous, false, periodic));
                }
                events.extend(self.aura_event(actor.guid, spell_id, true, periodic));
            }
        }
        events
    }
    /// Current actor-update removes exhausted periodic records before its
    /// reduction/control cleanup. All publications capture these exact rows.
    pub(super) fn update_actor_auras(
        &mut self,
        actor: &mut Actor,
        window: &mut ControlWindow,
        periodic: &mut Vec<periodic::ActorPeriodic>,
        now: f32,
    ) -> Vec<ActorAuraUpdate> {
        if actor.dead {
            self.packlord_howl.remove(&actor.guid);
            return Vec::new();
        }
        let mut events = Vec::new();
        let exhausted = periodic
            .iter()
            .filter(|row| row.ticks_remaining == 0)
            .map(|row| row.spell_id)
            .collect::<Vec<_>>();
        periodic.retain(|row| row.ticks_remaining != 0);
        for spell_id in exhausted {
            if periodic.iter().any(|row| row.spell_id == spell_id) {
                events.push(ActorAuraUpdate::Applications {
                    target: actor.guid,
                    spell_id,
                });
            } else {
                events.push(ActorAuraUpdate::Remove {
                    target: actor.guid,
                    spell_id,
                });
            }
        }
        if let Some(weakening) = self.actor_weakening.get_mut(&actor.guid) {
            weakening.advance(now);
            actor.damage_reduction = weakening.active;
        }
        let reduction = self.reduction_spells.get(&actor.guid).copied().unwrap_or(0);
        if reduction != 0 && now >= actor.damage_reduction.until {
            self.reduction_spells.remove(&actor.guid);
            self.reduction_durations.remove(&actor.guid);
            events.push(ActorAuraUpdate::Remove {
                target: actor.guid,
                spell_id: reduction,
            });
        }
        if now >= actor.slow.until && self.frost_shock_durations.remove(&actor.guid).is_some() {
            events.push(ActorAuraUpdate::Remove {
                target: actor.guid,
                spell_id: FROST_SHOCK_AURA,
            });
        }
        if window.elemental_sunder_until != 0.0 && now >= window.elemental_sunder_until {
            window.elemental_sunder_until = 0.0;
            events.push(ActorAuraUpdate::Remove {
                target: actor.guid,
                spell_id: enhancement::ELEMENTAL_SUNDER,
            });
        }
        if let Some(howls) = self.packlord_howl.get_mut(&actor.guid) {
            howls.retain(|_, (expires_at, _)| now < *expires_at);
            if howls.is_empty() {
                self.packlord_howl.remove(&actor.guid);
                events.push(ActorAuraUpdate::Remove { target: actor.guid, spell_id: 24_604 });
            }
        }
        let control_expired = actor.stun_until > 0.0 && now >= actor.stun_until;
        state::expire_control(actor, window, now);
        if control_expired {
            let reduction = self.reduction_spells.get(&actor.guid).copied().unwrap_or(0);
            let spells = self
                .aura_slots
                .get(&actor.guid)
                .map_or([0; 16], |slots| slots.spells);
            for spell_id in spells {
                if spell_id != 0
                    && spell_id != reduction
                    && !(spell_id == FROST_SHOCK_AURA
                        && self.frost_shock_durations.contains_key(&actor.guid))
                    && !(spell_id == 24_604 && self.packlord_howl.contains_key(&actor.guid))
                    && !periodic.iter().any(|row| row.spell_id == spell_id)
                {
                    events.push(ActorAuraUpdate::Remove {
                        target: actor.guid,
                        spell_id,
                    });
                }
            }
        }
        events
    }
}

#[derive(Clone)]
struct VictimSnapshot {
    position: Position,
    maximum_health: f32,
    periodic: Vec<periodic::ActorPeriodic>,
}

impl<W: RunWorld> CombatAdapter<'_, W> {
    pub(super) fn actor_aura(&mut self, target: u64, spell_id: u32, present: bool) {
        let Some(periodic) = self.periodic_rows(target).cloned() else {
            return;
        };
        self.events.extend(
            self.generic
                .aura_event(target, spell_id, present, &periodic),
        );
    }
    pub(super) fn effect_stats(&self) -> Vec<(u8, f32)> {
        let mut stats = self.equipped.stats.clone();
        stats.extend(
            self.generic
                .temporary
                .contributions(&self.equipped.rows, self.now),
        );
        stats
    }
    pub(super) fn refresh_numeric(&mut self, execution: &mut ExecutionState<'_>) {
        let stats = self.effect_stats();
        let mut numeric = self.pre_stats;
        numeric.apply_stats(&stats);
        if let Some(luck) = self.cooperative_luck {
            numeric.luck += luck;
        }
        numeric.finish();
        effects::EffectsState::apply_health(execution, self.soul_link_absorb, &numeric, self.equipped);
        self.player_absorb = execution.vitals.absorb;
        self.stats = effects::EffectsState::player_stats(self.base_stats, numeric, self.run_level);
        self.stats.maximum_health = numeric.health;
        self.leech = self.base_leech.total(
            &stats[self.equipped.stats.len()..], &self.equipped.stats,
        );
        self.extra_cast_factor = numeric.extra_cast - self.equipped.sum(13);
        *self.numeric = numeric;
        self.stats_recomputed = true;
    }
    pub(super) fn current_context(
        &self,
        mut context: CastContext,
        execution: &ExecutionState<'_>,
    ) -> CastContext {
        context.power = PowerContext {
            maximum_health: execution.vitals.maximum_health,
            damage_multiplier: aura_damage(
                self.numeric.damage,
                &execution.auras,
                self.now,
                self.numeric.buff_bonus,
            ),
        };
        context.global_area = self.numeric.area;
        context.global_target_bonus = self.numeric.targets;
        context.global_dot_tick_bonus = self.numeric.dot_tick;
        context.shield_bonus = self.numeric.buff_bonus;
        context
    }
    fn victim_snapshot(&self, guid: u64) -> Option<VictimSnapshot> {
        self.actors
            .iter()
            .find(|row| row.guid == guid)
            .map(|row| VictimSnapshot {
                position: row.actor.movement.position_at(self.now),
                maximum_health: row.maximum_health,
                periodic: row.periodic.clone(),
            })
            .or_else(|| {
                self.bosses
                    .iter()
                    .find(|row| row.guid == guid)
                    .map(|row| VictimSnapshot {
                        position: row.actor.movement.position_at(self.now),
                        maximum_health: row.maximum_health,
                        periodic: row.periodic.clone(),
                    })
            })
            .or_else(|| {
                self.boss_state
                    .wards
                    .actors
                    .iter()
                    .find(|row| row.guid == guid)
                    .map(|row| VictimSnapshot {
                        position: row.actor.movement.position_at(self.now),
                        maximum_health: row.maximum_health,
                        periodic: row.periodic.clone(),
                    })
            })
    }
    pub(super) fn periodic_rows(&self, guid: u64) -> Option<&Vec<periodic::ActorPeriodic>> {
        self.actors
            .iter()
            .find(|row| row.guid == guid)
            .map(|row| &row.periodic)
            .or_else(|| {
                self.bosses
                    .iter()
                    .find(|row| row.guid == guid)
                    .map(|row| &row.periodic)
            })
            .or_else(|| {
                self.boss_state
                    .wards
                    .actors
                    .iter()
                    .find(|row| row.guid == guid)
                    .map(|row| &row.periodic)
            })
    }
    pub(super) fn periodic_rows_mut(&mut self, guid: u64) -> Option<&mut Vec<periodic::ActorPeriodic>> {
        if let Some(row) = self.actors.iter_mut().find(|row| row.guid == guid) {
            return Some(&mut row.periodic);
        }
        self.bosses
            .iter_mut()
            .find(|row| row.guid == guid)
            .map(|row| &mut row.periodic)
            .or_else(|| {
                self.boss_state
                    .wards
                    .actors
                    .iter_mut()
                    .find(|row| row.guid == guid)
                    .map(|row| &mut row.periodic)
            })
    }
}
impl State {
    pub fn begin_cast(&mut self, spell: u32) {
        if !self.first_criticals.contains(&spell) {
            self.first_criticals.push(spell);
        }
    }
}

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    pub(super) fn pulse_healing_pool(
        &mut self,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let Some(pulse) = self
            .core
            .generic
            .healing
            .take_pulse(&self.core.equipped.rows, self.context.now)
        else {
            return;
        };
        let targets = actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        );
        let selected = targeting::radius_targets(
            &targets,
            self.context.now,
            self.context.player,
            pulse.radius,
            &[],
        )
        .into_iter()
        .map(|target| target.actor.guid)
        .collect::<Vec<_>>();
        if pulse.visual_spell != 0 {
            self.core.events.push(RunEvent::Spell(SpellCast {
                source_guid: self.context.player_guid,
                spell_id: pulse.visual_spell,
                target: CastTarget::None,
                hit_targets: selected.clone(),
            }));
        }
        // 0.140.0 145fb8ff0..145fb921e snapshots one Seed before the
        // Tranquility hits. Its center follows the target until detonation.
        if !selected.is_empty() {
            if let Some((effect_index, row)) = self.core.equipped.rows.iter().enumerate()
                .find(|(_, row)| row.tag() == 70)
            {
                let candidates = self.attack_candidates();
                if let Some(target) = azeroth_survivors_re::run_effects::weapon::ordered_targets(
                    &candidates,
                    self.context.now,
                    self.context.player,
                    pulse.radius,
                ).first() {
                    self.core.generic.seeds_of_life.push(SeedOfLife {
                        target: target.guid,
                        effect_index,
                        resolves_at: self.context.now + 1.5,
                        position: target.position,
                        power: pulse.power * row.float(4),
                        nearby: row.word(8) as usize,
                        radius: row.float(12),
                        double_strike: row.bytes[16] != 0,
                    });
                }
            }
        }
        for guid in selected {
            self.druid_effect_hit(pulse.effect_index, guid, 740, pulse.power, execution, rng, counter);
        }
    }

    pub(super) fn resolve_seeds_of_life(
        &mut self,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let now = self.context.now;
        let mut due = Vec::new();
        self.core.generic.seeds_of_life.retain(|seed| {
            if seed.resolves_at <= now {
                due.push(*seed);
                false
            } else {
                true
            }
        });
        for seed in due {
            let actors = actor_targets(
                self.core.actors,
                self.core.bosses,
                &self.core.boss_state.wards,
                self.core.object_counter.sequence(),
            );
            let center = actors.iter().find(|target| target.actor.guid == seed.target)
                .map_or(seed.position, |target| target.actor.movement.position_at(now));
            let targets = std::iter::once(seed.target)
                .chain(targeting::radius_targets(&actors, now, center, seed.radius, &[seed.target])
                    .into_iter()
                    .take(seed.nearby)
                    .map(|target| target.actor.guid))
                .collect::<Vec<_>>();
            const SEED_OF_LIFE: u32 = 21070;
            self.core.cast_spell(SpellCast {
                source_guid: self.context.player_guid,
                spell_id: SEED_OF_LIFE,
                target: CastTarget::Ground(center),
                hit_targets: Vec::new(),
            });
            let prior = std::mem::replace(&mut self.core.generic.healing.seed_impact, true);
            for guid in targets {
                let double = seed.double_strike && (self.core.guardian_state.contains(guid)
                    || actors.iter().any(|target|
                        target.actor.guid == guid && (target.has_metadata || target.flagged)));
                self.druid_effect_hit(seed.effect_index, guid, SEED_OF_LIFE, seed.power, execution, rng, counter);
                if double {
                    self.druid_effect_hit(seed.effect_index, guid, SEED_OF_LIFE, seed.power, execution, rng, counter);
                }
            }
            self.core.generic.healing.seed_impact = prior;
        }
    }

    fn druid_effect_hit(
        &mut self,
        index: usize,
        guid: u64,
        spell_id: u32,
        power: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        // Each hit draws and reads live stats after any preceding hit's procs.
        let draw = behavior::unit24(rng);
        let stats = CastPort::critical(self.core);
        let critical = draw < stats.chance;
        let damage = if critical { power * stats.multiplier } else { power };
        self.effect_hit_with_suppression(
            index, guid, spell_id, 3, damage, critical, false, true, execution, rng, counter,
        );
    }
    pub(super) fn apply_effect_status(
        &mut self,
        guid: u64,
        effect: player_abilities::StatusEffect,
        spell_id: u32,
        raw_power: f32,
        execution: &mut ExecutionState<'_>,
    ) {
        // Current shared status1454ff860 changes state without applying an
        // additional minimum-one actor hit. Scalar player lanes are synchronous.
        if effect.tag == u32::MAX {
            // Selected0.127.0 145c771da/145c77962 separates Demo's shared
            // strongest window from other MAX-status procs (Judgement).
            if spell_id == 1160 {
                let alive = self.core.actors.iter().any(|row| row.guid == guid && !row.actor.dead)
                    || self.core.bosses.iter().any(|row| row.guid == guid && !row.actor.dead)
                    || self.core.boss_state.wards.actors.iter().any(|row| row.guid == guid && !row.actor.dead);
                if alive {
                    self.core.generic.demoralizing_amplification.entry(guid).or_default()
                        .insert(self.context.now, effect.value, self.context.now + effect.duration);
                }
                return;
            }
            if let Some(row) = self
                .core
                .actors
                .iter_mut()
                .find(|row| row.guid == guid && !row.actor.dead)
            {
                row.vulnerability = effect.value;
                row.vulnerability_until = self.context.now + effect.duration;
            } else if let Some(row) = self.core.boss_state.wards.actors.iter_mut()
                .find(|row| row.guid == guid && !row.actor.dead)
            {
                row.vulnerability = effect.value;
                row.vulnerability_until = self.context.now + effect.duration;
            } else if let Some(row) = self
                .core
                .bosses
                .iter_mut()
                .find(|row| row.guid == guid && !row.actor.dead)
            {
                row.vulnerability = effect.value;
                row.vulnerability_until = self.context.now + effect.duration;
            }
            return;
        }
        if matches!(effect.tag, 5 | 6) {
            if let Some(amount) = execution.vitals.heal_effect(effect, raw_power) {
                let source = if effect.tag == 5 {
                    self.core.healing_source(spell_id)
                } else {
                    azeroth_survivors_re::run_effects::healing::LEECH
                };
                self.core.generic.healing_meter.record(source, amount);
                self.core.events.push(RunEvent::Healing {
                    amount,
                    emit_log: false,
                    fields: azeroth_survivors_re::run_effects::healing::vital_fields(
                        &execution.vitals,
                    ),
                    context: (spell_id != 0).then_some(HealingContext {
                        source: self.context.player_guid,
                        target: self.context.player_guid,
                        spell_id,
                        critical: false,
                    }),
                });
            }
            return;
        }
        if effect.tag == 7 {
            execution
                .vitals
                .absorb_effect(self.context.now, effect.value);
            self.core.player_absorb = execution.vitals.absorb;
            if spell_id != 0 && !execution.auras.iter().any(|aura| aura.spell_id == spell_id) {
                execution.auras.push(buffs::Aura {
                    source_guid: 0,
                    effect,
                    spell_id,
                    expires_at: f32::INFINITY,
                    healing_power: 0.0,
                });
            }
            self.core.publish_player_auras(execution, self.learned);
            return;
        }
        if let Some(row) = self.core.actors.iter_mut().find(|row| row.guid == guid) {
            self.core
                .events
                .extend(self.core.generic.apply_actor_status(
                    &mut row.actor,
                    &mut row.control,
                    true,
                    &row.periodic,
                    self.context.now,
                    effect,
                    spell_id,
                    self.core.movement_counter,
                    self.core.world,
                ));
        } else if let Some(row) = self.core.bosses.iter_mut().find(|row| row.guid == guid) {
            self.core
                .events
                .extend(self.core.generic.apply_actor_status(
                    &mut row.actor,
                    &mut row.control,
                    false,
                    &row.periodic,
                    self.context.now,
                    effect,
                    spell_id,
                    self.core.movement_counter,
                    self.core.world,
                ));
        } else if let Some(row) = self
            .core
            .boss_state
            .wards
            .actors
            .iter_mut()
            .find(|row| row.guid == guid)
        {
            self.core
                .events
                .extend(self.core.generic.apply_actor_status(
                    &mut row.actor,
                    &mut row.control,
                    true,
                    &row.periodic,
                    self.context.now,
                    effect,
                    spell_id,
                    self.core.movement_counter,
                    self.core.world,
                ));
        }
    }
    fn effect_hit(
        &mut self,
        index: usize,
        guid: u64,
        spell_id: u32,
        school: u8,
        damage: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        self.effect_hit_with_suppression(
            index, guid, spell_id, school, damage, false, false, false, execution, rng, counter,
        );
    }
    pub(super) fn effect_hit_with_suppression(
        &mut self,
        index: usize,
        guid: u64,
        spell_id: u32,
        school: u8,
        damage: f32,
        critical: bool,
        suppress_damage_log: bool,
        effect_critical_procs: bool,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let original = self.core.attribution;
        self.core.attribution.source_kind = 3;
        self.hit_with_execution(
            PendingHit {
                context: HitContext {
                    source_words: [1, 0, index as u32, (index as u64 >> 32) as u32],
                    overcast: self.core.extra_cast,
                    proc_source: self.core.generic.source,
                    suppress_damage_log,
                    effect_critical_procs,
                    ..Default::default()
                },
                target_guid: guid,
                source_guid: self.context.player_guid,
                effect: player_abilities::StatusEffect {
                    tag: 0,
                    value: 0.0,
                    duration: 0.0,
                },
                resolves_at: self.context.now,
                spell_id,
                damage,
                critical,
                damages_player: false,
                school,
            },
            rng,
            execution,
            counter,
        );
        self.core.attribution = original;
    }
    /// Current raw35 generic callback: only a direct player Death Coil can
    /// dispatch the separate remainder hit. Native source-kind3 prevents this
    /// hit from recursively triggering generic effects and meters it as Coil.
    fn soul_reaping_event(
        &mut self,
        event: Event,
        definition: Option<&AbilityDefinition>,
        victim_guid: u64,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        if event.kind != 0 || event.source_kind != 0 || event.spell_id == 0
            || !definition.is_some_and(|row| row.key == "death_coil")
            || self.core.target_health(victim_guid).is_none()
        {
            return;
        }
        let Some(periodic) = self.core.periodic_rows(victim_guid) else { return; };
        let damage = behavior::soul_reaping::bonus(&self.core.equipped.rows, periodic);
        if !(damage > 0.0) { return; }
        let original = self.core.attribution;
        self.hit_with_execution(
            PendingHit {
                context: HitContext {
                    captured_source_kind: Some(3),
                    // Native clears only Game+20's low64 enum tag; retain its
                    // payload words and the caller's independent cast context.
                    source_words: [0, 0, original.source_words[2], original.source_words[3]],
                    cast_words: original.cast_words,
                    proc_source: None,
                    ..Default::default()
                },
                target_guid: victim_guid,
                source_guid: self.context.player_guid,
                effect: player_abilities::StatusEffect { tag: 0, value: 0.0, duration: 0.0 },
                resolves_at: self.context.now,
                spell_id: event.spell_id,
                damage,
                critical: false,
                damages_player: false,
                school: 5,
            },
            rng,
            execution,
            counter,
        );
    }

    /// The queues and serial are borrowed from the same active run. A proc is
    /// dispatched before returning to the next actor, with the shared RNG.
    pub(super) fn hit_with_execution(
        &mut self,
        hit: PendingHit,
        rng: &mut NativeRng,
        execution: &mut ExecutionState<'_>,
        counter: &mut dyn NativeCounter,
    ) {
        let original = self.core.attribution;
        let original_source = self.core.generic.source;
        let original_pet_entry = self.core.generic.meter_pet_entry;
        let original_attack = self.core.generic.meter_attack;
        if let Some(kind) = hit.context.captured_source_kind {
            self.core.attribution.source_kind = kind;
            self.core.generic.meter_pet_entry = hit.context.pet_entry;
            self.core.generic.meter_attack = hit.context.meter_attack;
        } else if hit.context.meter_attack.is_some() {
            self.core.generic.meter_attack = hit.context.meter_attack;
        }
        self.core.generic.source = hit.context.proc_source;
        self.core.attribution.source_words = hit.context.source_words;
        self.core.attribution.cast_words = hit.context.cast_words;
        if let Some(input) = self.resolve_hit(hit, rng, Some(&mut execution.vitals)) {
            // Class-special callbacks may have recursively dealt damage. Their
            // leech also precedes this hit's health-conditioned generic rows.
            self.core.flush_leech(&mut execution.vitals);
            let event = Event {
                spell_id: input.spell_id,
                school: hit.school,
                source_kind: self.core.attribution.source_kind,
                critical: input.critical,
                first_periodic: self.first_periodic,
                ..Default::default()
            };
            if event.source_kind == 3 && hit.context.effect_critical_procs && event.critical {
                // 0.140.0 145f47a5b..145f47b80 bypasses ordinary hit/kill
                // dispatch and first-hit/first-critical token consumption.
                self.generic_event(event, input.raw_power, input.victim_guid, execution, rng, counter);
            } else if let Some(event) = azeroth_survivors_re::run_effects::hit_event(
                event,
                !self.core.equipped.rows.is_empty(),
                &mut execution.seen_spells,
                &mut self.core.generic.first_criticals,
            ) {
                self.generic_event(
                    event,
                    input.raw_power,
                    input.victim_guid,
                    execution,
                    rng,
                    counter,
                );
                if self.gates().qualifies_death(input.remaining_health) {
                    self.generic_event(
                        Event {
                            kind: 2,
                            first_periodic: false,
                            ..event
                        },
                        input.raw_power,
                        input.victim_guid,
                        execution,
                        rng,
                        counter,
                    );
                }
            }
        }
        self.core.attribution = original;
        self.core.generic.source = original_source;
        self.core.generic.meter_pet_entry = original_pet_entry;
        self.core.generic.meter_attack = original_attack;
    }

    /// Selected14592706d gates pet missile damage at the pending consumer.
    /// Direct demon area and bounce hits retain the canonical minimum-one rule.
    pub(super) fn pending_hit_with_execution(
        &mut self,
        hit: PendingHit,
        rng: &mut NativeRng,
        execution: &mut ExecutionState<'_>,
        counter: &mut dyn NativeCounter,
    ) {
        if hit.context.captured_source_kind == Some(2) && !(hit.damage > 0.0) {
            self.apply_effect_status(
                hit.target_guid,
                hit.effect,
                hit.spell_id,
                hit.damage,
                execution,
            );
        } else {
            self.hit_with_execution(hit, rng, execution, counter);
        }
    }

    fn definition_for_event(&self, id: u32) -> Option<&'static AbilityDefinition> {
        // Native basic attacks bypass the learned-ability lookup entirely.
        if id == 0 {
            return None;
        }
        let class = player_abilities::catalog::CLASSES
            .iter()
            .find(|class| class.class_id == self.core.class_id)?;
        class
            .pool
            .iter()
            .filter_map(|key| AbilityDefinition::by_key(key))
            .chain(
                self.learned
                    .iter()
                    .filter_map(|instance| AbilityDefinition::by_key(instance.definition.key)),
            )
            .find(|definition| definition.spell_id == id || definition.pulse_spell_id == id)
    }

    fn free_instance(&self, key: &str) -> Option<RuntimeInstance<'static>> {
        azeroth_survivors_re::run_effects::actions::free_instance(
            key,
            self.learned,
            self.core.equipped,
        )
    }

    pub(super) fn generic_event(
        &mut self,
        event: Event,
        amount: f32,
        victim_guid: u64,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        self.generic_event_with_demons(event, amount, victim_guid, execution, rng, counter, None);
    }

    pub(super) fn generic_event_with_demons(
        &mut self,
        event: Event,
        amount: f32,
        victim_guid: u64,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
        mut demon_state: Option<&mut super::demons::State>,
    ) {
        let definition = self.definition_for_event(event.spell_id);
        //1454cba87..cbb1c owns a copy before evaluating any row.
        let rows = self.core.equipped.rows.clone();
        let victim = (event.kind == 2)
            .then(|| self.core.victim_snapshot(victim_guid))
            .flatten();
        let mut stats_dirty = false;
        for (index, row) in rows.iter().enumerate() {
            // Current native tag 21 with condition 2 is the periodic-on-critical
            // lane used by Blood Frenzy and The Eye of Hakkar.
            if event.source_kind == 3 && (row.tag() != 9 || row.word(16) != 2) {
                continue;
            }
            // Semantic marker keeps current army effects in their original order.
            // Creation, landing hits and their random draws finish before
            // the next generic or demon effect observes the shared state.
            if row.tag() == 253 {
                if row.bytes[63] == 35 {
                    self.soul_reaping_event(event, definition, victim_guid, execution, rng, counter);
                    continue;
                }
                if event.kind == 3 && row.bytes[63] == 33 {
                    if let (Some(state), Some(definition)) =
                        (demon_state.as_deref_mut(), definition)
                    {
                        if let Some(pet) = super::demons::effect_definition(row) {
                            let facing =
                                self.cast_context.facing[1].atan2(self.cast_context.facing[0]);
                            let recovery = aura_cooldown(
                                self.core.numeric.recovery,
                                &execution.auras,
                                self.context.now,
                                self.core.numeric.buff_bonus,
                            );
                            state.after_damaging_cast_for(
                                pet.entry,
                                index,
                                definition,
                                self.context.now,
                                recovery,
                                rng,
                                |state, rng| {
                                    self.spawn_demons(state, facing, execution, rng, counter)
                                },
                            );
                        }
                    }
                }
                continue;
            }
            match row.tag() {
                11 | 12 | 14 if victim.is_some() => {}
                10 if event.kind == 2 && row.matches_event(8, &event, definition) => {}
                0 | 1 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 15 | 16 | 17 | 18 => {
                    let condition = match row.tag() {
                        0 | 1 => 32,
                        4 | 8 => 24,
                        5 => 8,
                        _ => 16,
                    };
                    if !row.condition_matches(
                        condition,
                        &event,
                        definition,
                        execution.vitals.health,
                        execution.vitals.maximum_health,
                    ) {
                        continue;
                    }
                }
                _ => continue,
            }
            match row.tag() {
                0 => {
                    if self
                        .core
                        .generic
                        .deadlines
                        .get(index)
                        .is_some_and(|deadline| *deadline > self.context.now)
                    {
                        continue;
                    }
                    if !(behavior::unit24(rng) < row.float(4)) {
                        continue;
                    }
                    if let Some(deadline) = self.core.generic.deadlines.get_mut(index) {
                        *deadline = self.context.now + row.float(8);
                    }
                    self.generic_freecast(row, index, definition, execution, rng, counter);
                }
                1 | 5 => self.milestone_event(
                    row,
                    index,
                    event,
                    definition,
                    victim_guid,
                    execution,
                    rng,
                    counter,
                ),
                3 => {
                    let context = self.core.current_context(self.cast_context, execution);
                    let burst = row
                        .shield_burst(amount, context.power.damage_multiplier)
                        .unwrap();
                    let actors = actor_targets(
                        self.core.actors,
                        self.core.bosses,
                        &self.core.boss_state.wards,
                        self.core.object_counter.sequence(),
                    );
                    let targets = targeting::radius_targets(
                        &actors,
                        self.context.now,
                        self.context.player,
                        burst.radius,
                        &[],
                    );
                    self.core.cast_spell(SpellCast {
                        source_guid: self.context.player_guid,
                        spell_id: burst.spell_id,
                        target: CastTarget::Ground(self.context.player),
                        hit_targets: Vec::new(),
                    });
                    for target in targets {
                        self.effect_hit(
                            index,
                            target.actor.guid,
                            burst.spell_id,
                            burst.school,
                            burst.power,
                            execution,
                            rng,
                            counter,
                        );
                    }
                }
                4 => {
                    let Some(actor) = self.core.victim_snapshot(victim_guid) else {
                        continue;
                    };
                    let required = row.word(16);
                    if required != 0 && !actor.periodic.iter().any(|dot| dot.spell_id == required) {
                        continue;
                    }
                    let cap = row.word(20) as usize;
                    if cap != 0 {
                        if let Some(timestamps) = self.core.generic.timestamps.get_mut(index) {
                            timestamps.retain(|time| self.context.now - *time < 1.0);
                            if timestamps.len() >= cap {
                                continue;
                            }
                            timestamps.push(self.context.now);
                        }
                    }
                    if row.word(12) != 0 {
                        self.core.cast_spell(SpellCast {
                            source_guid: self.context.player_guid,
                            spell_id: row.word(12),
                            target: CastTarget::Ground(actor.position),
                            hit_targets: Vec::new(),
                        });
                    }
                    let actors = actor_targets(
                        self.core.actors,
                        self.core.bosses,
                        &self.core.boss_state.wards,
                        self.core.object_counter.sequence(),
                    );
                    let targets = targeting::radius_targets(
                        &actors,
                        self.context.now,
                        actor.position,
                        row.float(8),
                        &[victim_guid],
                    );
                    for target in targets {
                        self.effect_hit(
                            index,
                            target.actor.guid,
                            event.spell_id,
                            event.school,
                            row.float(4) * amount,
                            execution,
                            rng,
                            counter,
                        );
                        if definition
                            .is_some_and(|definition| matches!(definition.effect.tag, 1..=4 | 10))
                        {
                            // Native1454ce4ed..cef10 additionally invokes the shared
                            // status owner using the definition's unscaled base effect.
                            self.apply_effect_status(
                                target.actor.guid,
                                definition.unwrap().effect,
                                event.spell_id,
                                amount,
                                execution,
                            );
                        }
                    }
                }
                6 => {
                    let Some(actor) = self.core.victim_snapshot(victim_guid) else {
                        continue;
                    };
                    let actors = actor_targets(
                        self.core.actors,
                        self.core.bosses,
                        &self.core.boss_state.wards,
                        self.core.object_counter.sequence(),
                    );
                    let targets = targeting::radius_targets(
                        &actors,
                        self.context.now,
                        actor.position,
                        10.0,
                        &[victim_guid],
                    )
                    .into_iter()
                    .take(row.word(4) as usize)
                    .map(|target| target.actor.guid)
                    .collect::<Vec<_>>();
                    let damage = row.float(8) * amount;
                    for guid in targets {
                        if event.spell_id != 0 {
                            self.core.cast_spell(SpellCast {
                                source_guid: self.context.player_guid,
                                spell_id: event.spell_id,
                                target: CastTarget::Unit(guid),
                                hit_targets: vec![guid],
                            });
                        } else {
                            self.core.events.push(RunEvent::Melee {
                                source: self.context.player_guid,
                                target: guid,
                                amount: damage as u32,
                                critical: false,
                            });
                        }
                        self.effect_hit(
                            index,
                            guid,
                            event.spell_id,
                            event.school,
                            damage,
                            execution,
                            rng,
                            counter,
                        );
                    }
                }
                7 => {
                    //1454cc3cb..4445 consumes one chance draw before count/actor checks.
                    if !(behavior::unit24(rng) < row.float(4)) {
                        continue;
                    }
                    let damage = row.float(12) * amount;
                    for _ in 0..row.word(8) {
                        if event.spell_id == 0 {
                            self.core.events.push(RunEvent::Melee {
                                source: self.context.player_guid,
                                target: victim_guid,
                                amount: damage as u32,
                                critical: false,
                            });
                        }
                        self.effect_hit(
                            index,
                            victim_guid,
                            event.spell_id,
                            event.school,
                            damage,
                            execution,
                            rng,
                            counter,
                        );
                    }
                }
                8 => {
                    if let Some(effect) = row.proc_status(rng) {
                        self.apply_effect_status(
                            victim_guid,
                            effect,
                            event.spell_id,
                            amount,
                            execution,
                        );
                    }
                }
                9 => {
                    let rows = if let Some(actor) = self
                        .core
                        .actors
                        .iter_mut()
                        .find(|actor| actor.guid == victim_guid && !actor.actor.dead)
                    {
                        &mut actor.periodic
                    } else if let Some(actor) = self
                        .core
                        .bosses
                        .iter_mut()
                        .find(|actor| actor.guid == victim_guid && !actor.actor.dead)
                    {
                        &mut actor.periodic
                    } else {
                        continue;
                    };
                    let spell_id = row.word(4);
                    let retained = rows
                        .iter()
                        .filter(|periodic| {
                            periodic.owner_kind != 0
                                && periodic.owner_guid == index as u64
                                && periodic.spell_id == spell_id
                        })
                        .fold(-0.0, |sum, periodic| {
                            sum + periodic.power_per_tick * periodic.ticks_remaining as f32
                        });
                    let duration = row.float(12);
                    periodic::install_dot(
                        rows,
                        1,
                        index as u64,
                        spell_id,
                        event.school,
                        periodic::DotPlan {
                            total_power: amount * row.float(8) + retained,
                            duration,
                            ticks: duration.round().max(1.0) as u32,
                        },
                        self.context.now,
                        0.0,
                        1,
                    );
                    self.core.actor_aura(victim_guid, spell_id, true);
                }
                10 => {
                    if self
                        .core
                        .generic
                        .deadlines
                        .get(index)
                        .is_some_and(|deadline| *deadline > self.context.now)
                    {
                        continue;
                    }
                    if let Some(deadline) = self.core.generic.deadlines.get_mut(index) {
                        *deadline = self.context.now + row.float(4);
                    }
                    for ability in self
                        .learned
                        .iter_mut()
                        .filter(|ability| ability.definition.spell_id == event.spell_id)
                    {
                        ability.remaining = ability.remaining.min(0.05);
                    }
                }
                16 => {
                    // Current145c0b9a1/de7a..e0f9: no random draw or clamp.
                    // The killing spell keeps its timer; all other learned
                    // primary IDs lose the exact configured number of seconds.
                    if self.core.generic.deadlines.get(index)
                        .is_some_and(|deadline| *deadline > self.context.now)
                    { continue; }
                    if let Some(deadline) = self.core.generic.deadlines.get_mut(index) {
                        *deadline = self.context.now + row.float(8);
                    }
                    for ability in self.learned.iter_mut().filter(|ability|
                        ability.definition.spell_id != event.spell_id)
                    {
                        ability.remaining -= row.float(4);
                    }
                    self.core.generic.cooldowns_dirty = true;
                }
                11 => {
                    let victim = victim.as_ref().unwrap();
                    let would_add_dot = rows.iter().any(|row| {
                        row.tag() == 9
                            && row.condition_matches(
                                16,
                                &Event { kind: 0, ..event },
                                definition,
                                execution.vitals.health,
                                execution.vitals.maximum_health,
                            )
                    });
                    if !row.death_explosion_matches(
                        &event,
                        definition,
                        victim.periodic.iter().map(|dot| dot.spell_id),
                        |id| self.definition_for_event(id),
                        would_add_dot,
                    ) {
                        continue;
                    }
                    let explosion = row.death_explosion(victim.maximum_health).unwrap();
                    if let Some(timestamps) = self.core.generic.timestamps.get_mut(index) {
                        if !azeroth_survivors_re::run_effects::actions::admit_per_second(
                            timestamps,
                            explosion.maximum_per_second,
                            self.context.now,
                        ) {
                            continue;
                        }
                    }
                    if let Some(spell_id) = explosion.visual_spell_id {
                        self.core.cast_spell(SpellCast {
                            source_guid: self.context.player_guid,
                            spell_id,
                            target: CastTarget::Ground(victim.position),
                            hit_targets: Vec::new(),
                        });
                    }
                    let actors = actor_targets(
                        self.core.actors,
                        self.core.bosses,
                        &self.core.boss_state.wards,
                        self.core.object_counter.sequence(),
                    );
                    let targets = targeting::radius_targets(
                        &actors,
                        self.context.now,
                        victim.position,
                        explosion.radius,
                        &[victim_guid],
                    );
                    for target in targets {
                        self.effect_hit(
                            index,
                            target.actor.guid,
                            explosion.spell_id,
                            event.school,
                            explosion.power,
                            execution,
                            rng,
                            counter,
                        );
                    }
                }
                12 => {
                    let victim = victim.as_ref().unwrap();
                    if !execution.auras.iter().any(|aura| {
                        aura.spell_id == row.word(4) && aura.expires_at > self.context.now
                    }) {
                        continue;
                    }
                    let cap = row.word(20) as usize;
                    if cap != 0 {
                        if let Some(timestamps) = self.core.generic.timestamps.get_mut(index) {
                            timestamps.retain(|time| self.context.now - *time < 1.0);
                            if timestamps.len() >= cap {
                                continue;
                            }
                            timestamps.push(self.context.now);
                        }
                    }
                    let spell_id = row.word(16);
                    self.core.cast_spell(SpellCast {
                        source_guid: self.context.player_guid,
                        spell_id,
                        target: CastTarget::Ground(victim.position),
                        hit_targets: Vec::new(),
                    });
                    let actors = actor_targets(
                        self.core.actors,
                        self.core.bosses,
                        &self.core.boss_state.wards,
                        self.core.object_counter.sequence(),
                    );
                    let targets = targeting::radius_targets(
                        &actors,
                        self.context.now,
                        victim.position,
                        row.float(12),
                        &[victim_guid],
                    );
                    for target in targets {
                        self.effect_hit(
                            index,
                            target.actor.guid,
                            spell_id,
                            event.school,
                            row.float(8) * victim.maximum_health,
                            execution,
                            rng,
                            counter,
                        );
                    }
                }
                14 => {
                    let victim = victim.as_ref().unwrap();
                    for periodic in &victim.periodic {
                        if periodic.spell_id == 0 {
                            continue;
                        }
                        let Some(definition) = self.definition_for_event(periodic.spell_id) else {
                            continue;
                        };
                        if !row.matches(8, definition) {
                            continue;
                        }
                        let actors = actor_targets(
                            self.core.actors,
                            self.core.bosses,
                            &self.core.boss_state.wards,
                            self.core.object_counter.sequence(),
                        );
                        let selected = targeting::radius_targets(
                            &actors,
                            self.context.now,
                            victim.position,
                            10.0,
                            &[victim_guid],
                        )
                        .into_iter()
                        .filter(|target| {
                            !self
                                .core
                                .periodic_rows(target.actor.guid)
                                .is_some_and(|rows| {
                                    rows.iter().any(|existing| {
                                        existing.spell_id == periodic.spell_id
                                            && existing.ticks_remaining != 0
                                            && if periodic.owner_kind == 0 {
                                                existing.owner_kind == 0
                                            } else {
                                                existing.owner_kind == 1
                                                    && existing.owner_guid == periodic.owner_guid
                                            }
                                    })
                                })
                        })
                        .take(row.word(4) as usize)
                        .map(|target| target.actor.guid)
                        .collect::<Vec<_>>();
                        //1454cd796 deliberately reads initial+24, not remaining+20.
                        let ticks = periodic.initial_ticks.max(1);
                        for guid in selected {
                            if let Some(rows) = self.core.periodic_rows_mut(guid) {
                                periodic::install_dot(
                                    rows,
                                    periodic.owner_kind,
                                    periodic.owner_guid,
                                    periodic.spell_id,
                                    periodic.school,
                                    periodic::DotPlan {
                                        total_power: periodic.power_per_tick * ticks as f32,
                                        duration: periodic.interval * ticks as f32,
                                        ticks,
                                    },
                                    self.context.now,
                                    periodic.leech_fraction,
                                    1,
                                );
                            }
                            self.core.cast_spell(SpellCast {
                                source_guid: self.context.player_guid,
                                spell_id: periodic.spell_id,
                                target: CastTarget::Unit(guid),
                                hit_targets: vec![guid],
                            });
                            self.core.actor_aura(guid, periodic.spell_id, true);
                        }
                    }
                }
                15 => {
                    if self
                        .core
                        .generic
                        .temporary
                        .activate(index, row, self.context.now)
                    {
                        stats_dirty = true;
                    }
                }
                17 => {
                    if self
                        .core
                        .generic
                        .deadlines
                        .get(index)
                        .is_some_and(|deadline| *deadline > self.context.now)
                    {
                        continue;
                    }
                    if let Some(deadline) = self.core.generic.deadlines.get_mut(index) {
                        *deadline = self.context.now + row.float(8);
                    }
                    let before = execution.vitals.health;
                    execution.vitals.health = behavior::min_preserving_original_nan(
                        before + row.float(4) * execution.vitals.maximum_health,
                        execution.vitals.maximum_health,
                    );
                    let amount = execution.vitals.health - before;
                    let source = azeroth_survivors_re::run_effects::healing::meter_source(
                        3,
                        [1, 0, index as u32, (index as u64 >> 32) as u32],
                        [0; 4],
                        None,
                        self.core.meter_sources,
                        0,
                        None,
                    );
                    self.core.generic.healing_meter.record(source, amount);
                    self.core.events.push(RunEvent::Healing {
                        amount,
                        context: None,
                        emit_log: false,
                        fields: azeroth_survivors_re::run_effects::healing::vital_fields(
                            &execution.vitals,
                        ),
                    });
                }
                18 => {
                    let cap = row.float(8) * execution.vitals.maximum_health;
                    if execution.vitals.absorb < cap {
                        execution.vitals.absorb = behavior::min_preserving_original_nan(
                            execution.vitals.absorb
                                + row.float(4) * execution.vitals.maximum_health,
                            cap,
                        );
                        self.core.player_absorb = execution.vitals.absorb;
                    }
                }
                _ => {}
            }
        }
        if stats_dirty {
            self.core.refresh_numeric(execution);
            self.cast_context = self.core.current_context(self.cast_context, execution);
            self.context.power = self.cast_context.power;
            self.context.global_area = self.cast_context.global_area;
            self.context.global_target_bonus = self.cast_context.global_target_bonus;
            self.context.global_cooldown = aura_cooldown(
                self.core.numeric.recovery,
                &execution.auras,
                self.context.now,
                self.core.numeric.buff_bonus,
            );
        }
    }
}
