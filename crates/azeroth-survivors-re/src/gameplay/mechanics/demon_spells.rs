//! Live selected-target demon spell and post-hit consumers.
use super::demons::Demon;
use super::*;
use azeroth_survivors_re::{
    loot_rewards::amulets::SpellModifiers,
    run_effects::{demon_effects, demon_spells as native, demons::distance, healing},
    run_meter::CapturedAttack,
};

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    pub(super) fn demon_target_position(&self, guid: u64) -> Option<Position> {
        self.core
            .actors
            .iter()
            .find(|row| row.guid == guid)
            .map(|row| row.actor.movement.position_at(self.context.now))
            .or_else(|| {
                self.core
                    .bosses
                    .iter()
                    .find(|row| row.guid == guid)
                    .map(|row| row.actor.movement.position_at(self.context.now))
            })
            .or_else(|| self.core.boss_state.wards.actors.iter()
                .find(|row| row.guid == guid)
                .map(|row| row.actor.movement.position_at(self.context.now)))
    }
    pub(super) fn demon_doomguard_interval(&self, execution: &ExecutionState<'_>) -> f32 {
        let definition = AbilityDefinition::by_key("shadow_bolt").expect("current Shadow Bolt");
        let instance = native::direct_proxy(
            "shadow_bolt",
            self.learned,
            self.core.equipped.spell_modifiers(definition),
        );
        let cooldown = aura_cooldown(
            self.core.numeric.recovery,
            &execution.auras,
            self.context.now,
            self.core.numeric.buff_bonus,
        );
        damage::base_interval(&instance, cooldown).max(0.5)
    }
    pub(super) fn demon_spell_attack(
        &mut self,
        demon: &mut Demon,
        target: u64,
        greater_factor: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let pit_lord = demon.definition.special == 8;
        let key = if pit_lord {
            "searing_pain"
        } else {
            "shadow_bolt"
        };
        let definition = AbilityDefinition::by_key(key).expect("current demon spell");
        // Pit Lord's selected owner uses only learned power/target upgrades;
        // Doomguard additionally derives the current matching effect lanes.
        let modifiers = if pit_lord {
            SpellModifiers::default()
        } else {
            self.core.equipped.spell_modifiers(definition)
        };
        let instance = native::direct_proxy(key, self.learned, modifiers);
        let context = self.core.current_context(self.cast_context, execution);
        let base = native::power(&instance, &context.power, demon.definition.damage) * greater_factor;
        let from = demon.tick.motion.position_at(self.context.now);
        let center = Position {
            x: from[0],
            y: from[1],
            z: from[2],
        };
        let candidates = self.attack_candidates();
        let mut ordered = azeroth_survivors_re::run_effects::weapon::ordered_targets(
            &candidates,
            self.context.now,
            center,
            30.0,
        )
        .iter()
        .map(|row| row.guid)
        .collect::<Vec<_>>();
        let count = native::target_count(&instance, context.global_target_bonus, pit_lord) as usize;
        let selected = if pit_lord {
            // Current native caller preserves the leading prioritized query row,
            // shuffles only its tail, then admits at most six distinct victims.
            if ordered.len() > 1 {
                behavior::targeting::shuffle(&mut ordered[1..], rng);
            }
            ordered.truncate(6);
            ordered
                .iter()
                .copied()
                .cycle()
                .take(count)
                .collect::<Vec<_>>()
        } else {
            let mut targets = vec![target];
            targets.extend(
                ordered
                    .into_iter()
                    .filter(|guid| *guid != target)
                    .take(1),
            );
            targets
        };
        let eligible = actor_targets(
            self.core.actors, self.core.bosses, &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        ).into_iter().any(|row| row.actor.guid == target && !row.actor.dead
            && (row.has_metadata || row.flagged));
        let focus = if pit_lord {
            0.0
        } else {
            native::doomguard_focus(
                &mut demon.tick.focus,
                &mut demon.tick.focus_casts,
                target,
                eligible,
                false,
                demon.config.doomguard_rank,
            )
        };
        if selected.is_empty() { return; }
        // Capture all per-target power before either volley rolls criticals.
        // Shadow Cleave inherits the primary's focus-adjusted power, and its
        // query excludes every already prepared primary/neighbor GUID.
        let mut prepared = selected.iter().copied().enumerate().map(|(index, guid)| {
            let bonus = if index == 0 { focus } else { 0.0 };
            let power = base * (1.0 + bonus)
                * if pit_lord && index == 0 { 1.25 } else { 1.0 };
            (guid, power, bonus, false)
        }).collect::<Vec<_>>();
        if !pit_lord {
            if let (Some(bounce), Some(center)) = (
                self.core.equipped.gear_bounce("shadow_bolt"),
                self.demon_target_position(target),
            ) {
                let actors = actor_targets(
                    self.core.actors, self.core.bosses, &self.core.boss_state.wards,
                    self.core.object_counter.sequence(),
                );
                let power = prepared[0].1 * bounce.power_multiplier;
                for row in behavior::targeting::radius_targets(
                    &actors, self.context.now, center, 10.0, &selected,
                ).into_iter().take(bounce.count as usize) {
                    prepared.push((row.actor.guid, power, 0.0, true));
                }
            }
        }
        // Native GameTick builds this target/power vector once. Its Echo uses
        // the same ordering and focus bonus, then rolls each victim's critical
        // again; it never advances focus or reshuffles the volley a second time.
        for echo in [false, true] {
            if echo {
                let chance = self.core.equipped.sum(31);
                if !(chance > 0.0 && chance > behavior::unit24(rng)) { break; }
            }
            // Current1459d17e0 filters the captured Doomguard list again for
            // each volley; missing/dead rows produce neither visuals nor crits.
            let active = if pit_lord { prepared.clone() } else {
                let actors = actor_targets(
                    self.core.actors, self.core.bosses, &self.core.boss_state.wards,
                    self.core.object_counter.sequence(),
                );
                prepared.iter().copied().filter(|(guid, _, _, _)| actors.iter()
                    .any(|row| row.actor.guid == *guid && !row.actor.dead)).collect()
            };
            if active.is_empty() { continue; }
            if !pit_lord {
                // Current14595a8b0 batches both visuals before victim RNG.
                for (spell_id, hit_targets) in
                    [(definition.spell_id, Vec::new()), (27383, active.iter().map(|row| row.0).collect())]
                {
                    self.core.events.push(RunEvent::Spell(SpellCast {
                        source_guid: demon.guid,
                        spell_id,
                        target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(target),
                        hit_targets,
                    }));
                }
            }
            for (index, (target, power, bonus, cleave)) in active.iter().copied().enumerate() {
                let attack = CapturedAttack {
                    primary: if echo {
                        "Demonic Echoes"
                    } else if pit_lord {
                        "Felseeker"
                    } else if cleave {
                        "Shadow Cleave"
                    } else {
                        "Shadow Bolt"
                    },
                    secondary: (!echo && !cleave && bonus > 0.0).then_some("Doom Bringer"),
                    bonus_bits: bonus.to_bits(),
                    suppressed: false,
                };
                // Current14595a460 captures both endpoints before the victim
                // critical draw; a missing actor consumes no critical RNG.
                let Some(to) = self.demon_target_position(target) else {
                    continue;
                };
                let (power, critical) = self.demon_critical(demon, power, target, execution, rng);
                // Native5676 has no travel-speed arm. The Pit Lord's burst uses
                // a separate0.12-second per-bolt delay;686 travels at20 units/s.
                let travel = if pit_lord {
                    0.0
                } else {
                    distance(from, [to.x, to.y, to.z]) / 20.0
                };
                let delay = if pit_lord { index as f32 * 0.12 } else { 0.0 };
                if pit_lord {
                    self.core.events.push(RunEvent::Spell(SpellCast {
                        source_guid: demon.guid,
                        spell_id: definition.spell_id,
                        target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(target),
                        hit_targets: vec![target],
                    }));
                }
                self.demon_pending(
                    demon,
                    target,
                    definition.spell_id,
                    power,
                    critical,
                    attack,
                    echo,
                    (self.context.now + delay) + travel,
                    execution,
                    rng,
                    counter,
                );
                if !pit_lord && !echo {
                    execution.pending.0.last_mut().expect("Doomguard pending hit")
                        .context.demon_spell_impact = Some(behavior::execution::DemonSpellImpact {
                            nightfall: !cleave,
                            conflagrate: true,
                        });
                }
            }
        }
    }

    pub(super) fn demon_infernal_pulse(
        &mut self,
        demon: &mut Demon,
        echo: bool,
        greater_factor: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let definition = AbilityDefinition::by_key("hellfire").expect("current Hellfire");
        let instance = native::infernal_proxy(
            self.learned,
            self.core.equipped.spell_modifiers(definition),
        );
        let context = self.core.current_context(self.cast_context, execution);
        if !echo {
            let cooldown = aura_cooldown(
                self.core.numeric.recovery,
                &execution.auras,
                self.context.now,
                self.core.numeric.buff_bonus,
            );
            // Main tick captures fresh modifier cooldown independently of
            // the full learned instance used by the pulse damage owner.
            let clock_instance = native::direct_proxy(
                "hellfire", self.learned, self.core.equipped.spell_modifiers(definition),
            );
            demon.next_special = self.context.now + native::infernal_interval(&clock_instance, cooldown);
        }
        let point = demon.tick.motion.position_at(self.context.now);
        let actors = actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        );
        let selected = behavior::targeting::radius_targets(
            &actors,
            self.context.now,
            Position {
                x: point[0],
                y: point[1],
                z: point[2],
            },
            native::infernal_radius(&instance, context.global_area),
            &[],
        )
        .iter()
        .map(|row| row.actor.guid)
        .collect::<Vec<_>>();
        if selected.is_empty() {
            return;
        }
        self.core.events.push(RunEvent::Spell(SpellCast {
            source_guid: demon.guid,
            spell_id: 11683,
            target: azeroth_survivors_re::bosses::abilities::CastTarget::None,
            hit_targets: selected.clone(),
        }));
        // Native14594f779..f7bc captures the first matching non-sentinel
        // status before hits. Generic keyed callbacks reject source2, so this
        // per-victim draw is an independent native consumer (including echoes).
        let status = self
            .core
            .equipped
            .rows
            .iter()
            .find(|row| {
                row.tag() == 8
                    && row.word(24) == 0
                    && row.word(8) != u32::MAX
                    && row.bytes[32] == 1
                    && row.key(40) == Some("hellfire")
            })
            .cloned();
        let mut talents = demon.config;
        talents.supremacy = self.core.equipped.sum(32) > 0.0;
        let base = native::power(&instance, &context.power, 1.0)
            * greater_factor * (1.0 + talents.infernal_supremacy_bonus());
        for target in selected {
            let (power, critical) = self.demon_critical(demon, base, target, execution, rng);
            self.hit_with_execution(
                PendingHit {
                    context: HitContext {
                        captured_source_kind: Some(2),
                        pet_entry: Some(demon.definition.entry),
                        meter_attack: Some(CapturedAttack {
                            primary: if echo { "Demonic Echoes" } else { "Hellfire" },
                            secondary: None,
                            bonus_bits: 0,
                            suppressed: false,
                        }),
                        ..Default::default()
                    },
                    target_guid: target,
                    source_guid: demon.guid,
                    effect: player_abilities::StatusEffect {
                        tag: 0,
                        value: 0.0,
                        duration: 0.0,
                    },
                    resolves_at: self.context.now,
                    spell_id: 11683,
                    damage: power,
                    critical,
                    damages_player: false,
                    school: definition.school,
                },
                rng,
                execution,
                counter,
            );
            if let Some(effect) = status.as_ref().and_then(|row| row.proc_status(rng)) {
                self.apply_effect_status(target, effect, 11683, power, execution);
            }
        }
    }

    ///14594c843..cbef follows each synchronous source2 hit. Shield gain uses
    /// full post-critical power; meter damage already used effective victim HP.
    pub(super) fn demon_after_hit(
        &mut self,
        demon: &Demon,
        target: u64,
        power: f32,
        echo: bool,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let victim = self
            .core
            .actors
            .iter()
            .find(|row| row.guid == target)
            .map(|row| (!row.actor.dead, row.health, row.maximum_health))
            .or_else(|| {
                self.core
                    .bosses
                    .iter()
                    .find(|row| row.guid == target)
                    .map(|row| (!row.actor.dead, row.health, row.maximum_health))
            });
        let victim = victim.or_else(|| self.core.boss_state.wards.actors.iter()
            .find(|row| row.guid == target)
            .map(|row| (!row.actor.dead, row.health, row.maximum_health)));
        let Some((alive, _, _)) = victim else {
            return;
        };
        if demon.definition.special == 3 {
            if !alive {
                let actual = demon_effects::voidwalker_kill_heal_for_rank(&mut execution.vitals, self.core.rules.heroic_rank);
                self.core.generic.healing_meter.record(
                    healing::MeterSource {
                        name: demon.definition.name,
                        icon: demon.definition.icon.unwrap_or("Ability_Hunter_BeastCall"),
                        talent: false,
                    },
                    actual,
                );
                self.core.events.push(RunEvent::Healing {
                    amount: actual,
                    context: None,
                    emit_log: false,
                    fields: healing::vital_fields(&execution.vitals),
                });
            }
            let gained = demon_effects::grant_soul_link(
                &mut execution.vitals,
                self.core.soul_link_absorb,
                power,
                self.core.equipped.rows.iter()
                    .filter(|row| row.tag() == 253 && row.bytes[63] == 31)
                    .fold(-0.0, |sum, row| sum + row.float(4)),
            );
            self.core.player_absorb = execution.vitals.absorb;
            if gained > 0.0 {
                self.core.publish_player_auras(execution, self.learned);
            }
        } else if !echo && demon.definition.special == 2 && alive {
            self.demon_consume_magic(demon, target, execution, rng, counter);
        } else if !echo && demon.definition.special == 4 {
            if alive {
                self.demon_succubus_seduction(demon, target);
            } else {
                self.demon_succubus_coil(demon, execution, rng);
            }
        }
    }
}
