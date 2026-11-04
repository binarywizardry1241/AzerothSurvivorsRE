//! Enhancement's cast capture and ordered proc dispatcher.
//! Native owners in 0.140.0: 145f25ef0, 145f26a70 and 145f8c810.
use super::*;
use azeroth_survivors_re::run_effects::{self, EffectRow};

const TALENT_EFFECT: u8 = 54;
const FLURRY: u32 = 16280;
const SHATTERING_ELEMENTS: u32 = 16246;
pub(super) const ELEMENTAL_SUNDER: u32 = 7386;

#[derive(Debug, Default)]
pub(super) struct State {
    capture: Option<Capture>,
    ancestral_strikes: u32,
    previous_shock: Option<(&'static str, f32)>,
    earthshatter_ready: bool,
}

#[derive(Debug)]
struct Capture {
    spell_id: u32,
    proc_source: Option<usize>,
    first_hit: Option<(u64, f32)>,
    targets: Vec<u64>,
    critical: bool,
}

impl State {
    pub(super) fn record_hit(
        &mut self,
        spell_id: u32,
        target: u64,
        raw_power: f32,
        critical: bool,
        context: HitContext,
    ) {
        if let Some(capture) = &mut self.capture {
            if capture.spell_id == spell_id && capture.proc_source == context.proc_source {
                capture.first_hit.get_or_insert((target, raw_power));
                capture.critical |= critical;
            }
        }
    }

    pub(super) fn record_targets(
        &mut self,
        spell_id: u32,
        targets: &[&Target],
        context: HitContext,
    ) {
        if let Some(capture) = &mut self.capture {
            if capture.spell_id == spell_id && capture.proc_source == context.proc_source {
                capture
                    .targets
                    .extend(targets.iter().map(|target| target.actor.guid));
            }
        }
    }
}

fn talent(rows: &[EffectRow], subtype: u8) -> Option<(usize, u8)> {
    rows.iter().enumerate().find_map(|(index, row)| {
        (row.tag() == TALENT_EFFECT && row.bytes[4] == subtype).then_some((index, row.bytes[5]))
    })
}

fn is_melee(key: &str) -> bool {
    matches!(key, "rockbiter" | "stormstrike")
}

fn is_shock(key: &str) -> bool {
    matches!(key, "earth_shock" | "flame_shock" | "frost_shock")
}

impl Mechanics {
    pub(super) fn stormguard(&self) -> (f32, bool) {
        let amount = talent(&self.effect_state.equipped.rows, 1)
            .map_or(0.0, |(_, rank)| f32::from(rank) * 3.0 / 100.0);
        let active = amount > 0.0
            && self
                .execution
                .auras
                .iter()
                .any(|aura| aura.spell_id == 324 && self.clock < aura.expires_at);
        (amount, active)
    }

    pub(super) fn effective_armor(&self) -> f32 {
        let (amount, active) = self.stormguard();
        if active {
            (self.stats.armor_fraction + amount).min(self.effect_state.numeric.armor_cap)
        } else {
            self.stats.armor_fraction
        }
    }
}

pub(super) fn critical_bonus(rows: &[EffectRow], key: &str) -> f32 {
    if !is_melee(key) {
        return 0.0;
    }
    talent(rows, 0).map_or(0.0, |(_, rank)| f32::from(rank) * 1.5 / 100.0)
}

fn spell_matches(row: &EffectRow, spell_id: u32) -> bool {
    row.key(8)
        .and_then(AbilityDefinition::by_key)
        .is_some_and(|definition| definition.spell_id == spell_id)
}

pub(super) fn winter_slow(
    rows: &[EffectRow],
    spell_id: u32,
    effect: player_abilities::StatusEffect,
) -> Option<player_abilities::StatusEffect> {
    if effect.tag != 1 {
        return None;
    }
    // 0.140.0 145f85155..145f85262 selects the first keyed slow override.
    let row = rows
        .iter()
        .find(|row| row.tag() == 49 && spell_matches(row, spell_id))?;
    Some(player_abilities::StatusEffect {
        value: row.float(24),
        duration: row.float(28),
        ..effect
    })
}

pub(super) fn spell_amplification(
    rows: &[EffectRow],
    spell_id: u32,
    now: f32,
    control: &ControlWindow,
    health: f32,
    maximum_health: f32,
) -> f32 {
    // 0.140.0 145fbb990 sums qualifying keyed rows before the canonical hit.
    rows.iter().fold(0.0, |sum, row| match row.tag() {
        50 if control.winter_chill_until > now && spell_matches(row, spell_id) => {
            sum + row.float(24)
        }
        51 if maximum_health * row.float(24) > health && spell_matches(row, spell_id) => {
            sum + row.float(28)
        }
        _ => sum,
    })
}

pub(super) fn sweeping_storm_power(
    effects: &run_effects::Effects,
    instance: &RuntimeInstance<'_>,
    power: f32,
    proc_source: Option<usize>,
) -> f32 {
    // Native 145f25dc0 recognizes regular Stormstrike and Windfury casts
    // of either Enhancement melee spell, then looks up the allocated rank.
    let key = instance.definition.key;
    let windfury = proc_source
        .and_then(|index| effects.rows.get(index))
        .is_some_and(|row| row.tag() == TALENT_EFFECT && row.bytes[4] == 4);
    if effects.sweeping_storm_rank >= 3 && (key == "stormstrike" || key == "rockbiter" && windfury)
    {
        power * 1.2
    } else {
        power
    }
}

pub(super) fn cooldown_elapsed(
    rows: &[EffectRow],
    auras: &[buffs::Aura],
    now: f32,
    key: &str,
    delta: f32,
) -> f32 {
    flurry(rows, auras, now, key).map_or(delta, |(rate, _)| delta * rate)
}

fn flurry(rows: &[EffectRow], auras: &[buffs::Aura], now: f32, key: &str) -> Option<(f32, f32)> {
    if !is_melee(key) {
        return None;
    }
    let (_, rank) = talent(rows, 10)?;
    let aura = auras
        .iter()
        .find(|aura| aura.spell_id == FLURRY && now < aura.expires_at)?;
    Some((1.0 + f32::from(rank) * 6.0 / 100.0, aura.expires_at - now))
}

pub(super) fn cooldown_wall_time(
    rows: &[EffectRow],
    auras: &[buffs::Aura],
    now: f32,
    key: &str,
    remaining: f32,
) -> f32 {
    let Some((rate, live_for)) = flurry(rows, auras, now, key) else {
        return remaining;
    };
    if remaining <= live_for * rate {
        remaining / rate
    } else {
        remaining - live_for * (rate - 1.0)
    }
}

#[derive(Clone, Copy)]
enum Proc {
    Windfury(u32),
    Flametongue(f32),
    Frostbrand,
    AncestralFortitude,
    EyeOfTheTempest(f32),
}

fn windfury_strikes(rank: u8, rng: &mut NativeRng) -> u32 {
    let draw = behavior::unit24(rng);
    if rank >= 3 {
        if draw < 0.25 {
            2
        } else if draw < 0.375 {
            3
        } else {
            0
        }
    } else if draw < if rank == 2 { 0.18 } else { 0.10 } {
        if behavior::unit24(rng) < 0.0001 { 5 } else { 2 }
    } else {
        0
    }
}

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    pub(super) fn elemental_sunder_hit(&mut self, hit: PendingHit) {
        if !matches!(hit.spell_id, 8017 | 17364) || talent(&self.core.equipped.rows, 8).is_none() {
            return;
        }
        let guid = hit.target_guid;
        let target = if let Some(row) = self
            .core
            .actors
            .iter_mut()
            .find(|row| row.guid == guid && !row.actor.dead)
        {
            (&mut row.control, row.periodic.as_slice())
        } else if let Some(row) = self
            .core
            .bosses
            .iter_mut()
            .find(|row| row.guid == guid && !row.actor.dead)
        {
            (&mut row.control, row.periodic.as_slice())
        } else if let Some(row) = self
            .core
            .boss_state
            .wards
            .actors
            .iter_mut()
            .find(|row| row.guid == guid && !row.actor.dead)
        {
            (&mut row.control, row.periodic.as_slice())
        } else {
            return;
        };
        let (control, periodic) = target;
        control.elemental_sunder_until = self.context.now + 4.0;
        self.core.events.extend(self.core.generic.aura_event(
            guid,
            ELEMENTAL_SUNDER,
            true,
            periodic,
        ));
    }

    pub(super) fn cinderheart_hit(
        &mut self,
        hit: PendingHit,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        if hit.spell_id != 1535
            || hit.context.captured_source_kind == Some(3)
            || self.core.target_health(hit.target_guid).is_none()
        {
            return;
        }
        let Some((index, effect)) = self
            .core
            .equipped
            .rows
            .iter()
            .enumerate()
            .find(|(_, row)| row.tag() == 58)
        else {
            return;
        };
        let Some(periodic) = self.core.periodic_rows(hit.target_guid) else {
            return;
        };
        let remaining = periodic
            .iter()
            .filter(|row| {
                row.spell_id == 8050
                    && row.ticks_remaining != 0
                    && (!self.core.party_healing.enabled
                        || row.owner_guid == 0
                        || row.owner_guid == self.core.player_guid)
            })
            .fold(0.0, |total, row| {
                total + row.ticks_remaining as f32 * row.power_per_tick
            });
        if remaining <= 0.0 {
            return;
        }
        let mut damage = remaining * effect.float(4);
        let critical_stats = CastPort::critical(self.core);
        let critical = behavior::unit24(rng) < critical_stats.chance;
        if critical {
            damage *= critical_stats.multiplier;
        }
        let index = hit.context.proc_source.unwrap_or(index);
        let context = HitContext {
            captured_source_kind: Some(3),
            source_words: [1, 0, index as u32, (index as u64 >> 32) as u32],
            proc_source: Some(index),
            ..hit.context
        };
        self.hit_with_execution(
            PendingHit {
                context,
                damage,
                critical,
                effect: player_abilities::StatusEffect {
                    tag: 0,
                    value: 0.0,
                    duration: 0.0,
                },
                ..hit
            },
            rng,
            execution,
            counter,
        );
    }

    pub(super) fn cast_with_enhancement<'spell>(
        &mut self,
        instance: &RuntimeInstance<'spell>,
        context: CastContext,
        targets: &[Target],
        execution: &mut ExecutionState<'spell>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) -> bool {
        let key = instance.definition.key;
        // General cast echoes use the ordinary dispatcher directly. Windfury
        // separately re-enters the Enhancement driver after its captured hits.
        if self.core.extra_cast {
            return dispatch::cast(instance, context, targets, execution, rng, counter, self);
        }
        if is_shock(key) {
            return self.cast_shock(instance, context, targets, execution, rng, counter);
        }
        if !is_melee(key) {
            return dispatch::cast(instance, context, targets, execution, rng, counter, self);
        }
        let (success, capture) =
            self.capture_enhancement_cast(instance, context, targets, execution, rng, counter);
        if success {
            if let Some((target, raw_power)) = capture.first_hit {
                if instance.definition.key == "rockbiter" {
                    self.earthbreaker_hit(target, raw_power, execution, rng, counter);
                }
                self.enhancement_procs(
                    instance.definition.key,
                    capture.critical,
                    true,
                    false,
                    execution,
                    rng,
                    counter,
                );
            }
        }
        success
    }

    fn cast_shock<'spell>(
        &mut self,
        instance: &RuntimeInstance<'spell>,
        context: CastContext,
        targets: &[Target],
        execution: &mut ExecutionState<'spell>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) -> bool {
        let now = self.context.now;
        let key = instance.definition.key;
        // 0.140.0 145f7bbbd inserts this separate token before target selection.
        if key == "earth_shock"
            && context.hit_context.proc_source.is_none()
            && !context.hit_context.overcast
        {
            self.core.generic.enhancement.earthshatter_ready = true;
        }
        let shattering = talent(&self.core.equipped.rows, 3);
        let resonant = talent(&self.core.equipped.rows, 2);
        let mut instance = *instance;
        if let Some((_, rank)) = shattering {
            if self
                .core
                .generic
                .enhancement
                .previous_shock
                .is_some_and(|(previous, at)| previous != key && now - at <= 6.0)
            {
                instance.power_multiplier += f32::from(rank) * 4.0 / 100.0;
            }
        }
        let (success, selected) = if resonant.is_some() {
            let (success, capture) =
                self.capture_enhancement_cast(&instance, context, targets, execution, rng, counter);
            (success, capture.targets)
        } else {
            (
                dispatch::cast(&instance, context, targets, execution, rng, counter, self),
                Vec::new(),
            )
        };
        if success && shattering.is_some() {
            self.core.generic.enhancement.previous_shock = Some((key, now));
            buffs::refresh_aura(
                &mut execution.auras,
                buffs::Aura {
                    source_guid: 0,
                    effect: player_abilities::StatusEffect {
                        tag: 0,
                        value: 0.0,
                        duration: 6.0,
                    },
                    spell_id: SHATTERING_ELEMENTS,
                    expires_at: now + 6.0,
                    healing_power: 0.0,
                },
            );
            self.core.publish_player_auras(execution, self.learned);
        }
        if let Some(effect) = resonant.filter(|_| success && !selected.is_empty()) {
            self.resonant_shocks(
                &instance, context, &selected, effect, execution, rng, counter,
            );
            // The scheduler rolls Stormbound once after the first pass, even
            // when the radius query did not find a secondary target.
            if talent(&self.core.equipped.rows, 11).is_some() && behavior::unit24(rng) < 0.05 {
                self.resonant_shocks(
                    &instance, context, &selected, effect, execution, rng, counter,
                );
            }
        }
        success
    }

    pub(super) fn earthshatter_kill(
        &mut self,
        row: &EffectRow,
        spell_id: u32,
        execution: &ExecutionState<'_>,
    ) {
        if self.core.generic.source.is_some()
            || self.core.extra_cast
            || !spell_matches(row, spell_id)
            || !std::mem::take(&mut self.core.generic.enhancement.earthshatter_ready)
        {
            return;
        }
        // 0.140.0 145fbf79a consumes the token before resolving learned timers.
        let recovery = aura_cooldown(
            self.core.numeric.recovery,
            &execution.auras,
            self.context.now,
            self.core.numeric.buff_bonus,
        );
        for ability in self
            .learned
            .iter_mut()
            .filter(|ability| ability.definition.spell_id == spell_id)
        {
            let remaining = if ability.remaining.is_finite() {
                ability.remaining
            } else {
                damage::cooldown(ability, recovery)
            };
            if remaining > 0.0 {
                ability.remaining = (remaining * (1.0 - row.float(24))).max(remaining.min(0.25));
            }
        }
        self.core.generic.cooldowns_dirty = true;
    }

    fn resonant_shocks(
        &mut self,
        instance: &RuntimeInstance<'_>,
        context: CastContext,
        selected: &[u64],
        (index, rank): (usize, u8),
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        use azeroth_survivors_re::bosses::abilities::CastTarget;

        let actors = actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        );
        let Some(first) = actors
            .iter()
            .find(|target| target.actor.guid == selected[0])
        else {
            return;
        };
        let now = context.now;
        let center = first.actor.movement.position_at(now);
        // 0x145f25350 selects the nearest non-base targets in an 8-yard
        // circle. Snapshot the composed power once per secondary pass.
        let victims = behavior::targeting::radius_targets(&actors, now, center, 8.0, selected);
        if victims.is_empty() || rank == 0 {
            return;
        }
        let context = self.core.current_context(context, execution);
        let definition = instance.definition;
        let base = definition.base_power
            * 1.4
            * instance.talent_power_multiplier
            * instance.power_multiplier;
        let health = if definition.base_power > 0.0 {
            instance.health_power * context.power.maximum_health
        } else {
            0.0
        };
        let power = ((base + health) * context.power.damage_multiplier) * 0.35;
        for target in victims.into_iter().take(usize::from(rank)) {
            let guid = target.actor.guid;
            self.core.cast_spell(SpellCast {
                source_guid: context.player_guid,
                spell_id: definition.spell_id,
                target: CastTarget::Unit(guid),
                hit_targets: vec![guid],
            });
            if definition.kind == 6 {
                // Flame Shock uses the normal kind-zero DoT lane directly.
                // The current Resonant owner multiplies the duration ratio
                // into power before applying the periodic tick factor.
                if self.core.target_health(guid).is_none() {
                    continue;
                }
                let mut plan =
                    periodic::DotPlan::new(instance, power, context.global_dot_tick_bonus);
                let duration_ratio =
                    damage::scaled_duration(instance) / definition.duration.max(0.01);
                plan.total_power = duration_ratio * power * (1.0 + context.global_dot_tick_bonus);
                if let Some(rows) = self.core.periodic_rows_mut(guid) {
                    periodic::install_dot(
                        rows,
                        0,
                        0,
                        definition.spell_id,
                        definition.school,
                        plan,
                        now,
                        0.0,
                        1 + context.global_dot_stack_bonus.min(3) as usize,
                    );
                    let applications = self
                        .core
                        .generic
                        .aura_slots
                        .get(&guid)
                        .zip(self.core.periodic_rows(guid))
                        .and_then(|(slots, rows)| {
                            slots.update_applications(definition.spell_id, rows)
                        });
                    if let Some(fields) = applications {
                        self.core.events.push(RunEvent::Aura {
                            target: guid,
                            spell_id: definition.spell_id,
                            present: true,
                            fields,
                        });
                    } else {
                        self.core.actor_aura(guid, definition.spell_id, true);
                    }
                }
            } else {
                let draw = behavior::unit24(rng);
                let stats = CastPort::critical(self.core);
                let critical = draw < stats.chance;
                let damage = if critical {
                    power * stats.multiplier
                } else {
                    power
                };
                self.effect_hit_with_suppression(
                    index,
                    guid,
                    definition.spell_id,
                    definition.school,
                    damage,
                    critical,
                    false,
                    false,
                    execution,
                    rng,
                    counter,
                );
                let effect = behavior::state::scaled_hit_effect(instance);
                if effect.tag != 0 {
                    self.apply_effect_status(guid, effect, definition.spell_id, damage, execution);
                }
            }
        }
    }

    fn earthbreaker_hit(
        &mut self,
        first_target: u64,
        first_power: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        use azeroth_survivors_re::bosses::abilities::CastTarget;

        let Some((index, effect)) = self
            .core
            .equipped
            .rows
            .iter()
            .enumerate()
            .find(|(_, row)| row.tag() == 55)
        else {
            return;
        };
        let power = first_power * effect.float(4);
        let radius = effect.float(8);
        let targets = actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        );
        let Some(first) = targets
            .iter()
            .find(|target| target.actor.guid == first_target)
        else {
            return;
        };
        let now = self.context.now;
        let center = first.actor.movement.position_at(now);
        let victims =
            behavior::targeting::radius_targets(&targets, now, center, radius, &[first_target]);
        self.core.cast_spell(SpellCast {
            source_guid: self.context.player_guid,
            spell_id: 8042,
            target: CastTarget::Ground(center),
            hit_targets: victims.iter().map(|victim| victim.actor.guid).collect(),
        });
        let context = HitContext {
            captured_source_kind: Some(3),
            source_words: [1, 0, index as u32, (index as u64 >> 32) as u32],
            proc_source: Some(index),
            ..HitContext::default()
        };
        for target in victims {
            let stats = CastPort::critical(self.core);
            let critical = behavior::unit24(rng)
                < stats.chance + critical_bonus(&self.core.equipped.rows, "rockbiter");
            self.hit_with_execution(
                PendingHit {
                    context,
                    target_guid: target.actor.guid,
                    source_guid: self.context.player_guid,
                    effect: player_abilities::StatusEffect {
                        tag: 0,
                        value: 0.0,
                        duration: 0.0,
                    },
                    resolves_at: now,
                    spell_id: 8017,
                    damage: if critical {
                        power * stats.multiplier
                    } else {
                        power
                    },
                    critical,
                    damages_player: false,
                    school: 3,
                },
                rng,
                execution,
                counter,
            );
        }
    }

    fn capture_enhancement_cast<'spell>(
        &mut self,
        instance: &RuntimeInstance<'spell>,
        context: CastContext,
        targets: &[Target],
        execution: &mut ExecutionState<'spell>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) -> (bool, Capture) {
        let previous = self.core.generic.enhancement.capture.replace(Capture {
            spell_id: instance.definition.spell_id,
            proc_source: context.hit_context.proc_source,
            first_hit: None,
            targets: Vec::new(),
            critical: false,
        });
        let success = dispatch::cast(instance, context, targets, execution, rng, counter, self);
        let capture = std::mem::replace(&mut self.core.generic.enhancement.capture, previous)
            .expect("active Enhancement cast capture");
        (success, capture)
    }

    fn enhancement_procs(
        &mut self,
        key: &'static str,
        critical: bool,
        allow_windfury: bool,
        repeated: bool,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let equipped = self.core.equipped;
        let rows = &equipped.rows;
        if critical && talent(rows, 10).is_some() {
            let now = self.context.now;
            buffs::refresh_aura(
                &mut execution.auras,
                buffs::Aura {
                    source_guid: 0,
                    effect: player_abilities::StatusEffect {
                        tag: 0,
                        value: 0.0,
                        duration: 4.0,
                    },
                    spell_id: FLURRY,
                    expires_at: now + 4.0,
                    healing_power: 0.0,
                },
            );
            self.core.generic.cooldowns_dirty = true;
            self.core.publish_player_auras(execution, self.learned);
        }
        if key == "rockbiter" {
            if let Some((index, rank)) = talent(rows, 5) {
                if behavior::unit24(rng) < f32::from(rank) * 5.0 / 100.0 {
                    let bonus = [0.1, 0.2, 0.5][usize::from(rank.clamp(1, 3) - 1)];
                    self.enhancement_proc(
                        key,
                        index,
                        Proc::Flametongue(bonus),
                        repeated,
                        execution,
                        rng,
                        counter,
                    );
                }
            }
        }
        if allow_windfury {
            if let Some((index, rank)) = talent(rows, 4) {
                let count = windfury_strikes(rank, rng);
                if count != 0 {
                    self.enhancement_proc(
                        key,
                        index,
                        Proc::Windfury(count),
                        repeated,
                        execution,
                        rng,
                        counter,
                    );
                }
            }
        }
        if key != "stormstrike" {
            return;
        }
        if let Some((index, rank)) = talent(rows, 7) {
            if behavior::unit24(rng) < f32::from(rank) * 10.0 / 100.0 {
                self.enhancement_proc(
                    key,
                    index,
                    Proc::Frostbrand,
                    repeated,
                    execution,
                    rng,
                    counter,
                );
            }
        }
        if let Some((index, rank)) = talent(rows, 9) {
            let strikes = &mut self.core.generic.enhancement.ancestral_strikes;
            *strikes = strikes.wrapping_add(1);
            if *strikes >= [8, 6, 4][usize::from(rank.clamp(1, 3) - 1)] {
                *strikes = 0;
                self.enhancement_proc(
                    key,
                    index,
                    Proc::AncestralFortitude,
                    repeated,
                    execution,
                    rng,
                    counter,
                );
            }
        }
        let chance = rows.iter().enumerate().find(|(_, row)| row.tag() == 56);
        let power = rows.iter().find(|row| row.tag() == 57);
        if let (Some((index, chance)), Some(power)) = (chance, power) {
            if behavior::unit24(rng) < chance.float(4) {
                self.enhancement_proc(
                    key,
                    index,
                    Proc::EyeOfTheTempest(power.float(4)),
                    repeated,
                    execution,
                    rng,
                    counter,
                );
            }
        }
    }

    fn enhancement_proc(
        &mut self,
        source_key: &'static str,
        index: usize,
        proc: Proc,
        repeated: bool,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        self.dispatch_enhancement_proc(source_key, index, proc, repeated, execution, rng, counter);
        if !repeated
            && talent(&self.core.equipped.rows, 11).is_some()
            && behavior::unit24(rng) < 0.05
        {
            self.dispatch_enhancement_proc(source_key, index, proc, true, execution, rng, counter);
        }
    }

    fn dispatch_enhancement_proc(
        &mut self,
        source_key: &'static str,
        index: usize,
        proc: Proc,
        repeated: bool,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let (key, count) = match proc {
            Proc::Windfury(count) => (source_key, count),
            Proc::Flametongue(_) => ("fire_nova", 1),
            Proc::Frostbrand => ("frost_shock", 1),
            Proc::AncestralFortitude => ("healing_wave", 1),
            Proc::EyeOfTheTempest(_) => ("chain_lightning", 1),
        };
        for _ in 0..count {
            let Some(mut instance) =
                run_effects::actions::free_instance(key, self.learned, self.core.equipped)
            else {
                return;
            };
            match proc {
                Proc::Windfury(_) => {}
                Proc::Flametongue(bonus) => instance.power_multiplier += bonus,
                Proc::Frostbrand => instance.target_bonus = instance.target_bonus.wrapping_add(1),
                // The self-heal reads the square root of the power lane.
                Proc::AncestralFortitude => instance.power_multiplier *= 0.25,
                Proc::EyeOfTheTempest(power) => instance.talent_power_multiplier *= power,
            }
            let original = self.core.attribution;
            let original_source = self.core.generic.source;
            let words = [1, 0, index as u32, (index as u64 >> 32) as u32];
            self.core.attribution.source_words = words;
            self.core.generic.source = Some(index);
            self.core.generic.depth = self.core.generic.depth.wrapping_add(1);
            let context = CastContext {
                hit_context: HitContext {
                    source_words: words,
                    proc_source: Some(index),
                    ..HitContext::default()
                },
                ..self.core.current_context(self.cast_context, execution)
            };
            let targets = actor_targets(
                self.core.actors,
                self.core.bosses,
                &self.core.boss_state.wards,
                self.core.object_counter.sequence(),
            );
            let capture = if matches!(proc, Proc::Windfury(_)) {
                let (success, capture) = self.capture_enhancement_cast(
                    &instance, context, &targets, execution, rng, counter,
                );
                success.then_some(capture)
            } else {
                dispatch::cast(&instance, context, &targets, execution, rng, counter, self);
                None
            };
            self.core.flush_vitals(&mut execution.vitals);
            self.core.generic.depth = self.core.generic.depth.wrapping_sub(1);
            self.core.attribution = original;
            self.core.generic.source = original_source;
            if matches!(proc, Proc::Windfury(_)) {
                let Some(capture) = capture.filter(|capture| capture.first_hit.is_some()) else {
                    return;
                };
                self.enhancement_procs(
                    source_key,
                    capture.critical,
                    false,
                    repeated,
                    execution,
                    rng,
                    counter,
                );
            }
        }
    }
}
