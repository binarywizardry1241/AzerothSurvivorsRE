//! Current 0.112.0 Felhunter/Succubus common-melee tails at145956d00.
use super::demons::Demon;
use super::*;
use azeroth_survivors_re::{
    run_effects::{demon_effects, demon_spells},
    run_meter::CapturedAttack,
};

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    pub(super) fn demon_consume_magic(
        &mut self,
        demon: &Demon,
        target: u64,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let now = self.context.now;
        self.core
            .generic
            .consume_magic_ready_at
            .retain(|_, deadline| *deadline > now);
        if self
            .core
            .generic
            .consume_magic_ready_at
            .contains_key(&target)
            || self.core.target_health(target).is_none()
        {
            return;
        }
        let Some(spell) = self
            .core
            .periodic_rows(target)
            .and_then(|rows| demon_effects::consume_magic_spell(rows, self.learned))
        else {
            return;
        };
        self.core
            .generic
            .consume_magic_ready_at
            .insert(target, now + 3.0);
        let Some(rows) = self.core.periodic_rows_mut(target) else {
            return;
        };
        let consumed = demon_effects::consume_magic(rows, spell, now);
        if !(consumed > 0.0) {
            return;
        }
        self.hit_with_execution(
            PendingHit {
                context: HitContext {
                    captured_source_kind: Some(2),
                    pet_entry: Some(demon.definition.entry),
                    meter_attack: Some(CapturedAttack {
                        primary: "Consume Magic",
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
                resolves_at: now,
                spell_id: spell,
                damage: consumed * 1.5,
                critical: false,
                damages_player: false,
                school: demon.definition.school,
            },
            rng,
            execution,
            counter,
        );
    }

    pub(super) fn demon_succubus_seduction(&mut self, demon: &Demon, target: u64) {
        let now = self.context.now;
        //145957054 admits only ordinary actors. Any retained Corruption row
        //qualifies; native does not test its remaining ticks or owner.
        let ordinary = self
            .core
            .actors
            .iter()
            .any(|row| row.guid == target && !row.actor.dead);
        let ward = self
            .core
            .boss_state
            .wards
            .actors
            .iter()
            .any(|row| row.guid == target && !row.actor.dead);
        if !(ordinary || ward)
            || !self
                .core
                .periodic_rows(target)
                .is_some_and(|rows| rows.iter().any(|dot| dot.spell_id == 172))
        {
            return;
        }
        self.core
            .generic
            .succubus_seduction_ready_at
            .retain(|_, deadline| *deadline > now);
        if self
            .core
            .generic
            .succubus_seduction_ready_at
            .contains_key(&target)
        {
            return;
        }
        self.core
            .generic
            .succubus_seduction_ready_at
            .insert(target, now + 5.0);
        self.core.events.push(RunEvent::Spell(SpellCast {
            source_guid: demon.guid,
            spell_id: 6358,
            target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(target),
            hit_targets: vec![target],
        }));
        if let Some(row) = self.core.actors.iter_mut().find(|row| row.guid == target) {
            self.core
                .events
                .extend(self.core.generic.apply_actor_status(
                    &mut row.actor,
                    &mut row.control,
                    true,
                    &row.periodic,
                    now,
                    player_abilities::StatusEffect {
                        tag: 3,
                        value: if row.definition.flag_4c != 0 {
                            0.5
                        } else {
                            1.0
                        },
                        duration: 0.0,
                    },
                    6358,
                    self.core.equipped,
                    self.core.movement_counter,
                    self.core.world,
                ));
        } else if let Some(row) = self
            .core
            .boss_state
            .wards
            .actors
            .iter_mut()
            .find(|row| row.guid == target)
        {
            self.core
                .events
                .extend(self.core.generic.apply_actor_status(
                    &mut row.actor,
                    &mut row.control,
                    true,
                    &row.periodic,
                    now,
                    player_abilities::StatusEffect {
                        tag: 3,
                        value: 1.0,
                        duration: 0.0,
                    },
                    6358,
                    self.core.equipped,
                    self.core.movement_counter,
                    self.core.world,
                ));
        }
    }

    /// Killing-blow Coil captures power and Drain Life remainder at launch.
    /// It uses ordinary player spell power/crit, without the demon attack scalar.
    pub(super) fn demon_succubus_coil(
        &mut self,
        demon: &Demon,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
    ) {
        let definition = AbilityDefinition::by_key("death_coil").expect("current Death Coil");
        let instance = demon_spells::proxy(
            "death_coil",
            self.learned,
            self.core.equipped.spell_modifiers(definition),
        );
        let candidates = actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        );
        let candidates = behavior::targeting::radius_targets(
            &candidates,
            self.context.now,
            self.context.player,
            definition.range,
            &[],
        );
        if candidates.is_empty() {
            return;
        }
        let chosen = candidates[behavior::targeting::random_index(candidates.len(), rng)];
        let target = chosen.actor.guid;
        let to = chosen.actor.movement.position_at(self.context.now);
        let context = self.core.current_context(self.cast_context, execution);
        let mut power = damage::effective_power(&instance, &context.power);
        let critical = self.core.numeric.crit > behavior::unit24(rng);
        if critical {
            power *= self.core.numeric.crit_damage;
        }
        let remainder = self.core.periodic_rows(target).map_or(0.0, |rows| {
            behavior::soul_reaping::bonus(&self.core.equipped.rows, rows)
        });
        power = (power + remainder) * 0.5;
        self.core.events.push(RunEvent::Spell(SpellCast {
            source_guid: demon.guid,
            spell_id: 6789,
            target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(target),
            hit_targets: vec![target],
        }));
        let from = demon.tick.motion.position_at(self.context.now);
        let dx = from[0] - to.x;
        let dy = from[1] - to.y;
        let travel = (dy * dy + dx * dx).sqrt() / 24.0;
        execution.pending.0.push(PendingHit {
            context: HitContext {
                captured_source_kind: Some(2),
                pet_entry: Some(demon.definition.entry),
                meter_attack: Some(CapturedAttack {
                    primary: "death_coil",
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
            resolves_at: self.context.now + travel,
            spell_id: 6789,
            damage: power,
            critical,
            damages_player: false,
            school: 5,
        });
    }
}
