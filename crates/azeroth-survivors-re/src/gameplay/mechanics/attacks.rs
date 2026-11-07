//! Friendly basic attacks use their own recovered power lanes and hit order.
use super::*;
use azeroth_survivors_re::run_effects::weapon;

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    pub(super) fn weapon_tick(
        &mut self,
        state: &mut weapon::State,
        delta: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let profile = weapon::profile(self.core.class_id);
        if !state.elapse(profile, delta) {
            return;
        }
        let profile = profile.expect("enabled native weapon profile");
        let candidates = self.attack_candidates();
        let Some(target) = weapon::ordered_targets(
            &candidates,
            self.context.now,
            self.context.player,
            profile.range,
        )
        .first()
        .map(|row| row.guid) else {
            state.no_target();
            return;
        };
        let context = self.core.current_context(self.cast_context, execution);
        let swing = weapon::swing(
            profile,
            &self.core.equipped.stats,
            context.power.damage_multiplier,
            Critical {
                chance: self.core.numeric.crit,
                multiplier: self.core.numeric.crit_damage,
            },
            rng,
        );
        self.core.events.push(RunEvent::Melee {
            source: self.context.player_guid,
            target,
            amount: swing.packet_amount,
            critical: swing.critical,
        });
        let original = self.core.attribution;
        self.core.attribution.source_kind = 0;
        self.hit_with_execution(
            PendingHit {
                context: HitContext {
                    suppress_damage_log: true,
                    ..Default::default()
                },
                target_guid: target,
                source_guid: self.context.player_guid,
                effect: player_abilities::StatusEffect {
                    tag: 0,
                    value: 0.0,
                    duration: 0.0,
                },
                resolves_at: self.context.now,
                spell_id: 0,
                damage: swing.power,
                critical: swing.critical,
                damages_player: false,
                school: 0,
            },
            rng,
            execution,
            counter,
        );
        self.core.attribution = original;
        // A synchronous hit proc may have changed recovery or active auras.
        state.complete(
            profile,
            1.0 / (recovery_with_auras(
                self.core.numeric.recovery,
                &execution.auras,
                self.context.now,
                self.core.numeric.buff_bonus,
            ) + 1.0),
        );
    }

    pub(super) fn attack_candidates(&self) -> Vec<weapon::Candidate> {
        // The weapon selector subtracts the raw byte from 2 with wrapping.
        // Target.flagged is a boolean used by other target consumers.
        let raw_flags: std::collections::HashMap<_, _> = self
            .core
            .actors
            .iter()
            .map(|row| (row.guid, row.definition.flag_4c))
            .collect();
        actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        )
        .into_iter()
        .map(|target| weapon::Candidate {
            guid: target.actor.guid,
            position: target.actor.movement.position_at(self.context.now),
            health: target.health,
            dead: target.actor.dead,
            avoid_until: target.actor.fear_until,
            has_metadata: target.has_metadata,
            flag: raw_flags.get(&target.actor.guid).copied().unwrap_or(0),
        })
        .collect()
    }
}

#[cfg(test)]
mod tests {
    use super::super::rng_integration::{TerrainFixture, class_run, fixture_enemies};
    use super::*;

    fn attack_run(
        class: &str,
        allocation: &[(String, u8)],
        distance: f32,
    ) -> (Mechanics, TerrainFixture, Position) {
        let mut game = class_run(class, 1);
        game.abilities.clear();
        game.racial = None;
        game.weapon_state.remaining = 0.0;
        game.pet_state.started = false;
        game.configure_effects(allocation, &[]);
        let mut world = TerrainFixture;
        fixture_enemies(&mut game, &[distance], &mut world);
        game.actors[0].health = 1000.0;
        game.actors[0].maximum_health = 1000.0;
        game.actors[0].actor.attack_delay = 1000.0;
        let player = game.zone.center.into();
        (game, world, player)
    }

    #[test]
    fn weapon_recovery_uses_current_native_aura_order_before_the_reciprocal() {
        let fixtures: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/power-scaling/weapon/native-fixtures.json"
        ))
        .unwrap();
        let f = |value: &serde_json::Value| f32::from_bits(value.as_u64().unwrap() as u32);
        for case in fixtures["recovery"].as_array().unwrap() {
            let auras = case["auras"]
                .as_array()
                .unwrap()
                .iter()
                .map(|row| buffs::Aura {
                    source_guid: 0,
                    effect: player_abilities::StatusEffect {
                        tag: row["tag"].as_u64().unwrap() as u32,
                        value: f(&row["value_bits"]),
                        duration: 0.0,
                    },
                    spell_id: 0,
                    expires_at: f(&row["expires_bits"]),
                    healing_power: 0.0,
                })
                .collect::<Vec<_>>();
            let raw = recovery_with_auras(
                f(&case["raw_recovery_bits"]),
                &auras,
                f(&case["now_bits"]),
                f(&case["buff_bonus_bits"]),
            );
            assert_eq!(
                raw.to_bits(),
                case["after_auras_bits"].as_u64().unwrap() as u32
            );
            assert_eq!(
                (1.0 / (raw + 1.0)).to_bits(),
                case["cooldown_bits"].as_u64().unwrap() as u32
            );
        }
    }

    #[test]
    fn trauma_changes_victim_damage_without_changing_the_weapon_packet() {
        for retained_dot in [false, true] {
            let (mut game, mut world, player) =
                attack_run("warrior", &[("imp_heroic".into(), 3)], 2.0);
            let target = game.actors[0].guid;
            if retained_dot {
                // Native Trauma checks vector length even after the last tick.
                game.actors[0].periodic.push(periodic::ActorPeriodic {
                    owner_kind: 1, owner_guid: 0, effect_owner: None, meter_actor: None, spell_id: 12834,
                    power_per_tick: 1.0, interval: 1.0, next_tick_at: 1000.0,
                    ticks_remaining: 0, initial_ticks: 3, leech_fraction: 0.0, school: 0,
                });
            }
            game.tick(0.01, player, [0.0; 2], 0.0, &mut world);
            let expected = if retained_dot { (1.0 + 0.03_f32 * 3.0) * 41.25 } else { 41.25 };
            let packet = game.events.iter().position(|event| matches!(event,
                RunEvent::Melee {source: 1, target: guid, amount: 41, critical: false} if *guid == target
            )).unwrap();
            let damage = game.events.iter().position(|event| matches!(event,
                RunEvent::Damage {target: guid, raw_power, amount, source_kind: 0, emit_log: false, ..}
                    if *guid == target && raw_power.to_bits() == 41.25_f32.to_bits()
                        && amount.to_bits() == expected.to_bits()
            )).unwrap();
            assert!(packet < damage);
            assert_eq!(game.actors[0].health, 1000.0 - expected);
            assert_eq!(game.weapon_state.remaining.to_bits(), (1.6_f32 * 1.2).to_bits());
        }
    }

    #[test]
    fn bloodlust_rank_reaches_damage_and_haste_aura_consumers_once() {
        let (mut game, _, _) = attack_run("warrior", &[("unbridled_wrath".into(), 5)], 2.0);
        let bonus = 0.06_f32 * 5.0;
        assert_eq!(game.effect_state.numeric.buff_bonus.to_bits(), bonus.to_bits());
        assert_eq!(game.effect_state.equipped.sum(16), 0.0);
        for (tag, spell_id) in [(8, 6673), (9, 20572)] {
            game.execution.auras.push(buffs::Aura {
                source_guid: 0,
                effect: player_abilities::StatusEffect { tag, value: 0.2, duration: 10.0 },
                spell_id, expires_at: game.clock + 10.0, healing_power: 0.0,
            });
        }
        assert_eq!(game.current_damage_multiplier().to_bits(),
                   (game.stats.damage_multiplier + 0.2 * (1.0 + bonus)).to_bits());
        let recovery = 1.0 / game.stats.cooldown_multiplier + 0.2 * (1.0 + bonus);
        assert_eq!(game.current_cooldown_multiplier().to_bits(), (1.0 / recovery).to_bits());
    }

    #[test]
    fn hunter_pet_talent_reaches_live_melee_damage_with_pet_attribution() {
        let (mut game, mut world, player) = attack_run(
            "hunter",
            &[("tame_beast".into(), 1), ("unleashed_fury".into(), 1)],
            0.0,
        );
        game.tick(1.01, player, [0.0; 2], 0.0, &mut world);
        assert_eq!(game.pet_state.rows.len(), 1);
        let pet = &game.pet_state.rows[0];
        assert_eq!(pet.definition.entry, 9510);
        let guid = pet.guid;
        assert!(game.events.iter().any(|event| matches!(event,
            RunEvent::Damage {causal_source,raw_power,source_kind:2,emit_log:false,..}
                if *causal_source==guid && raw_power.to_bits()==80.4_f32.to_bits())));
        let line = game
            .damage_meter()
            .iter()
            .find(|line| line.source.name == "Pets")
            .unwrap();
        assert_eq!(line.source.icon, "Ability_Hunter_BeastCall");
        assert_eq!(line.total, f64::from(80.4_f32));
    }

    #[test]
    fn ranged_pet_preserves_power_and_source_until_actual_deferred_impact() {
        let (mut game, mut world, player) =
            attack_run("mage", &[("water_elemental".into(), 1)], 10.0);
        game.effect_state.equipped.stats.push((17, 0.5));
        game.tick(1.01, player, [0.0; 2], 0.0, &mut world);
        let hit = *game
            .execution
            .pending
            .0
            .iter()
            .find(|hit| hit.spell_id == 116)
            .unwrap();
        assert_eq!(hit.context.captured_source_kind, Some(2));
        assert_eq!(hit.context.pet_entry, Some(9517));
        assert_eq!(hit.damage, 75.0);
        assert!(hit.resolves_at > game.clock);
        assert!(!game.events.iter().any(|event| matches!(event,
            RunEvent::Damage {causal_source,..} if *causal_source==hit.source_guid)));
        game.effect_state
            .equipped
            .stats
            .retain(|(tag, _)| *tag != 17);
        game.tick(
            hit.resolves_at - game.clock + 0.01,
            player,
            [0.0; 2],
            0.0,
            &mut world,
        );
        assert!(game.events.iter().any(|event| matches!(event,
            RunEvent::Damage {causal_source,raw_power,source_kind:2,emit_log:true,..}
                if *causal_source==hit.source_guid && *raw_power==75.0)));
    }

    #[test]
    fn zero_power_pet_projectile_still_slows_without_a_damage_hit() {
        let (mut game, mut world, player) =
            attack_run("mage", &[("water_elemental".into(), 1)], 10.0);
        game.effect_state.equipped.stats.push((17, -1.0));
        game.tick(1.01, player, [0.0; 2], 0.0, &mut world);
        let hit = *game
            .execution
            .pending
            .0
            .iter()
            .find(|hit| hit.spell_id == 116)
            .unwrap();
        assert_eq!(hit.damage, 0.0);
        assert_eq!(hit.effect.tag, 1);
        let before = game
            .actors
            .iter()
            .find(|row| row.guid == hit.target_guid)
            .unwrap()
            .health;
        game.tick(
            hit.resolves_at - game.clock + 0.01,
            player,
            [0.0; 2],
            0.0,
            &mut world,
        );
        let target = game
            .actors
            .iter()
            .find(|row| row.guid == hit.target_guid)
            .unwrap();
        assert_eq!(target.health, before);
        assert_eq!(target.actor.slow.fraction, 0.3);
        assert_eq!(target.actor.slow.until, game.clock + 2.0);
        assert!(!game.events.iter().any(|event| matches!(event,
            RunEvent::Damage {causal_source,..} if *causal_source==hit.source_guid)));
    }

    #[test]
    fn captured_pet_descriptor_names_only_icon_bearing_meter_sources() {
        let (mut game, mut world, player) = attack_run("mage", &[], 10.0);
        let target_guid = game.actors[0].guid;
        for (pet_entry, damage) in [(9510, 2.0), (9512, 3.0), (u32::MAX, 4.0)] {
            game.execution.pending.0.push(PendingHit {
                context: HitContext {
                    captured_source_kind: Some(2),
                    pet_entry: Some(pet_entry),
                    meter_attack: (pet_entry == 9512).then_some(
                        azeroth_survivors_re::run_meter::CapturedAttack {
                            primary: "Firebolt",
                            secondary: Some("Echo"),
                            bonus_bits: 0.5_f32.to_bits(),
                            suppressed: false,
                        },
                    ),
                    ..Default::default()
                },
                target_guid,
                source_guid: 20,
                effect: player_abilities::StatusEffect {
                    tag: 0,
                    value: 0.0,
                    duration: 0.0,
                },
                resolves_at: 0.0,
                spell_id: 133,
                damage,
                critical: false,
                damages_player: false,
                school: 2,
            });
        }
        game.tick(0.01, player, [0.0; 2], 0.0, &mut world);
        let pets = game
            .damage_meter()
            .iter()
            .find(|row| row.source.name == "Pets")
            .unwrap();
        let imp = game
            .damage_meter()
            .iter()
            .find(|row| row.source.name == "Imp")
            .unwrap();
        assert_eq!(pets.total, 6.0);
        assert!(pets.breakdown.is_empty());
        assert_eq!(imp.total, 3.0);
        assert_eq!(imp.breakdown[0].name, "Firebolt");
        assert_eq!(imp.breakdown[0].total, 3.0 * (1.0 - 0.5_f64 / 1.5));
        assert_eq!(imp.breakdown[1].name, "Echo");
        assert_eq!(imp.breakdown[1].total, 1.0);
        assert_eq!(imp.source.icon, "Spell_Shadow_SummonImp");
        assert!(!imp.source.talent);
        assert_eq!(game.effective_damage(), 9.0);
        assert_eq!(game.spell_damage(133), 9.0);
        assert_eq!(game.effect_state.generic.meter_pet_entry, None);
        assert_eq!(game.effect_state.generic.meter_attack, None);
    }

    #[test]
    fn proc_owned_periodic_damage_and_leech_keep_the_original_effect_source() {
        use azeroth_survivors_re::run_effects::healing::MeterSource;
        let (mut game, mut world, player) = attack_run("priest", &[], 10.0);
        let source = MeterSource {
            name: "Periodic Talent",
            icon: "ProcIcon",
            talent: true,
        };
        game.effect_state.meter_sources.push(source);
        game.effect_state.equipped.meter_talents.push(("periodic_talent", 2));
        game.execution.vitals.health = game.max_health() - 10.0;
        game.actors[0].periodic.push(periodic::ActorPeriodic {
            owner_kind: 1,
            owner_guid: 0,
            effect_owner: None,
            meter_actor: None,
            spell_id: 589,
            power_per_tick: 3.0,
            interval: 2.0,
            next_tick_at: 0.0,
            ticks_remaining: 1,
            initial_ticks: 1,
            leech_fraction: 0.5,
            school: 5,
        });
        game.tick(0.01, player, [0.0; 2], 0.0, &mut world);
        let damage = game
            .damage_meter()
            .iter()
            .find(|row| row.source == source)
            .unwrap();
        let healing = game
            .healing_meter()
            .iter()
            .find(|row| row.source == source)
            .unwrap();
        assert_eq!(damage.total, 3.0);
        assert_eq!(healing.total, 1.5);
        assert_eq!(game.spell_damage(589), 3.0);
        assert!(game.events.iter().any(|event| matches!(
            event,
            RunEvent::Damage { meter_attribution: Some((attribution, key)), spell_id: 589, .. }
                if *attribution == source && key == "talent:periodic_talent:r2"
        )));
        assert!(
            !game
                .damage_meter()
                .iter()
                .any(|row| row.source.name == "Shadow Word: Pain")
        );
    }

    #[test]
    fn empowered_deathmist_tick_has_its_own_addon_source() {
        let (mut game, mut world, player) = attack_run("warlock", &[], 10.0);
        let mut equipment = [0; 19];
        let mut stars = [0; 19];
        for slot in 0..azeroth_survivors_re::sets::ARMOR_SLOTS {
            equipment[slot] = azeroth_survivors_re::tier05::item_id(9, slot as u8);
            stars[slot] = 5;
        }
        game.configure_armor_set(equipment, stars);
        game.configure_effects(&[], &[]);
        let effect_index = game.effect_state.equipped.rows.iter()
            .position(|effect| effect.tag() == 69)
            .expect("empowered Deathmist effect");
        game.actors[0].periodic.push(periodic::ActorPeriodic {
            owner_kind: 1,
            owner_guid: effect_index as u64,
            effect_owner: None,
            meter_actor: None,
            spell_id: 12654,
            power_per_tick: 3.0,
            interval: 1.0,
            next_tick_at: 0.0,
            ticks_remaining: 1,
            initial_ticks: 1,
            leech_fraction: 0.0,
            school: 2,
        });

        game.tick(0.01, player, [0.0; 2], 0.0, &mut world);

        assert!(game.damage_meter().iter().any(|row|
            row.source.name == "Deathmist burn" && row.total == 3.0
        ));
        assert!(game.events.iter().any(|event| matches!(
            event,
            RunEvent::Damage { meter_attribution: Some((source, key)), spell_id: 12654, .. }
                if source.name == "Deathmist burn" && key == "set:warlock.7.empowered:deathmist_burn"
        )));
    }

    #[test]
    fn learned_penance_wins_the_shared_primary_id_for_live_damage_and_healing() {
        let (mut game, mut world, player) = attack_run("priest", &[], 10.0);
        let penance = AbilityDefinition::by_key("penance").unwrap();
        assert_eq!(
            AbilityDefinition::by_spell_id(penance.spell_id)
                .unwrap()
                .key,
            "holy_shock"
        );
        game.abilities.push(RuntimeInstance::learned(penance));
        game.tick(0.01, player, [0.0; 2], 0.0, &mut world);
        game.tick(0.6, player, [0.0; 2], 0.0, &mut world);
        let damage = game
            .damage_meter()
            .iter()
            .find(|row| row.source.name == penance.name)
            .unwrap();
        assert!(damage.total > 0.0);
        assert_eq!(damage.source.icon, penance.icon);
        assert!(
            !game
                .damage_meter()
                .iter()
                .any(|row| row.source.name == "Holy Shock")
        );
        game.execution.vitals.health = game.max_health() - 10.0;
        game.apply_healing(PendingHealing::spell(2.0, penance.spell_id));
        let healing = game
            .healing_meter()
            .iter()
            .find(|row| row.source.name == penance.name)
            .unwrap();
        assert_eq!(healing.total, 2.0);
    }

    #[test]
    fn actual_magma_and_searing_pulses_use_their_owning_totem_meter_source() {
        for key in ["magma_totem", "searing_totem"] {
            let (mut game, mut world, player) = attack_run("shaman", &[], 2.0);
            let definition = AbilityDefinition::by_key(key).unwrap();
            game.abilities.push(RuntimeInstance::learned(definition));
            game.tick(0.01, player, [0.0; 2], 0.0, &mut world);
            assert_eq!(game.execution.totems.len(), 1);
            let totem_guid = game.execution.totems[0].guid;
            game.tick(0.51, player, [0.0; 2], 0.0, &mut world);
            game.tick(0.75, player, [0.0; 2], 0.0, &mut world);
            let line = game
                .damage_meter()
                .iter()
                .find(|row| row.source.name == definition.name)
                .unwrap();
            assert!(line.total > 0.0, "{key}");
            assert_eq!(line.source.icon, definition.icon);
            assert!(game.spell_damage(definition.pulse_spell_id) > 0.0, "{key}");
            let pulse_key = format!("ability:{key}:r1:pulse");
            assert!(game.events.iter().any(|event| matches!(
                event,
                RunEvent::Damage {
                    causal_source, spell_id, meter_attribution: Some((source, source_key)), ..
                } if *causal_source == totem_guid && *spell_id == definition.pulse_spell_id
                    && source.name == definition.name && source_key == &pulse_key
            )));
            assert!(
                !game
                    .damage_meter()
                    .iter()
                    .any(|row| row.source.name == "Other")
            );
        }
    }
}
