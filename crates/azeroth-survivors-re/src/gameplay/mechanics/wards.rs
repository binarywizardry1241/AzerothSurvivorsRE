//! Native22's actor lifecycle through the live target, hit, aura and enemy lanes.
//! The shared actor vector has no ordinary EnemyDefinition for these units.
use super::*;
use azeroth_survivors_re::bosses::raid_wards::{self as native, Action, Effect};

///14594dd30 is shared by kind1 wards and kind6 tether hazards. It first finds
/// an alive source, mutates health once and publishes fields before the log.
pub(super) fn heal_source(
    actors: &mut [RunActor],
    bosses: &mut [RunBoss],
    wards: &mut native::WardState,
    events: &mut Vec<RunEvent>,
    guid: u64,
    fraction: f32,
    spell: u32,
) {
    let vitals = bosses
        .iter_mut()
        .find(|row| row.guid == guid && !row.actor.dead)
        .map(|row| (&mut row.health, row.maximum_health))
        .or_else(|| {
            actors
                .iter_mut()
                .find(|row| row.guid == guid && !row.actor.dead)
                .map(|row| (&mut row.health, row.maximum_health))
        })
        .or_else(|| {
            wards
                .actors
                .iter_mut()
                .find(|row| row.guid == guid && !row.actor.dead)
                .map(|row| (&mut row.health, row.maximum_health))
        });
    let Some((health, maximum_health)) = vitals else {
        return;
    };
    let amount = native::heal_amount(*health, maximum_health, fraction);
    if !(amount > 0.) {
        return;
    }
    *health += amount;
    events.push(RunEvent::ActorHealing {
        target: guid,
        spell_id: spell,
        amount,
        fields: vec![(22, health.ceil() as u32)],
    });
}

impl Mechanics {
    /// Current145c1db92 filters ward collection by Actor+f8==activehero;
    /// deferred resolution must restore that same personal context.
    pub(super) fn resolve_ward_actions(
        &mut self,
        actions: Vec<Action>,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        for action in actions {
            let slot = self.coop.targets.get(&action.guid).copied().unwrap_or(0);
            let input = self.party_input_for(slot).unwrap_or(coop::PartyInput {
                position: player,
                facing,
                velocity: [0.0; 2],
            });
            self.with_party_hero(slot, |game| {
                game.resolve_ward_action(action, input.position, input.facing, world);
            });
        }
    }

    fn resolve_ward_action(
        &mut self,
        action: Action,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        let Some(ward) = self
            .boss_state
            .wards
            .actors
            .iter()
            .find(|row| row.guid == action.guid && !row.actor.dead)
        else {
            return;
        };
        let parent = ward.parent;
        let alive = self
            .actors
            .iter()
            .any(|row| row.guid == parent && !row.actor.dead)
            || self
                .bosses
                .iter()
                .any(|row| row.guid == parent && !row.actor.dead)
            || self
                .boss_state
                .wards
                .actors
                .iter()
                .any(|row| row.guid == parent && !row.actor.dead);
        let effect = self.boss_state.wards.resolve(action, alive);
        match effect {
            Some(Effect::Explode {
                guid,
                position,
                fraction,
            }) => {
                self.events.push(RunEvent::Spell(SpellCast {
                    source_guid: guid,
                    spell_id: 20475,
                    target: azeroth_survivors_re::bosses::abilities::CastTarget::Ground(position),
                    hit_targets: Vec::new(),
                }));
                // The native request compensates the canonical reduction
                // before entering its ordinary absorb/immunity/death owner.
                let reduction = 1.0 - self.effective_armor();
                let reduction = if reduction > 0.1 { reduction } else { 0.1 };
                let raw = (fraction * self.execution.vitals.maximum_health) / reduction;
                self.damage_player_from(raw, super::incoming::DamageKind::Mechanic(20475),
                    guid, player, facing, world);
                self.remove_ward(guid);
            }
            Some(Effect::Heal {
                parent,
                fraction,
                spell,
            }) => {
                heal_source(
                    &mut self.actors,
                    &mut self.bosses,
                    &mut self.boss_state.wards,
                    &mut self.events,
                    parent,
                    fraction,
                    spell,
                );
            }
            Some(Effect::Hatch {
                guid,
                count,
                enemy_index,
                position,
            }) => {
                for request in native::hatch_positions(count, enemy_index, position, &ai::HostMath)
                {
                    // Native ordinary creation counts all alive shared
                    // actors, including the egg that has not been removed.
                    let live_bosses = self.bosses.iter().filter(|row| !row.actor.dead).count()
                        + self
                            .boss_state
                            .wards
                            .actors
                            .iter()
                            .filter(|row| !row.actor.dead)
                            .count();
                    if self.actors.iter().filter(|row| !row.actor.dead).count() + live_bosses
                        >= scaling::population_limit(self.rules.density_percent)
                    {
                        continue;
                    }
                    let mut port = SpawnAdapter {
                        party_health_multiplier: self.party_health_factors()[0],
                        zone: self.zone,
                        rules: self.rules,
                        phase: self.boss_state.phase(),
                        endless_started_at: self.boss_state.endless_started_at(),
                        now: self.clock,
                        run_level: self.level,
                        player,
                        velocity: [0.; 2],
                        actors: &mut self.actors,
                        live_bosses,
                        counter: &mut self.counter,
                        world: &mut *world,
                        events: &mut self.events,
                    };
                    let index = request
                        .enemy_index
                        .min(self.zone.enemies.len().saturating_sub(1));
                    port.create(index, Some(request.position), &mut self.rng);
                }
                self.remove_ward(guid);
            }
            Some(Effect::Remove { guid }) => self.remove_ward(guid),
            None => {}
        }
    }

    fn remove_ward(&mut self, guid: u64) {
        self.boss_state.wards.remove(guid);
        self.retire_actor_metadata(guid);
        self.events.push(RunEvent::RemoveObject(guid));
    }
}

impl<W: RunWorld> CombatAdapter<'_, W> {
    /// Shared145971490 applies actor damage and common kill side effects; an
    /// absent EnemyDefinition suppresses the later ordinary XP/gold/drop lane.
    pub(super) fn hit_ward(&mut self, hit: PendingHit, _rng: &mut NativeRng,
        vitals: Option<&mut Vitals>, packlord: f32) -> Option<HitInput> {
        let leech = self.current_leech();
        let orb = self
            .boss_state
            .wards
            .actors
            .iter()
            .find(|row| row.guid == hit.target_guid)
            .is_some_and(|row| row.config[0] == 3 && row.parent == 0);
        if orb && hit.spell_id != 0 {
            let pool = player_abilities::CLASSES
                .iter()
                .find(|class| class.class_id == self.class_id)
                .map(|class| class.pool)
                .unwrap_or(&[]);
            let kind = pool
                .iter()
                .filter_map(|key| AbilityDefinition::by_key(key))
                .chain(self.meter_definitions.iter().copied())
                .chain(self.meter_racial)
                .find(|definition| {
                    definition.spell_id == hit.spell_id || definition.pulse_spell_id == hit.spell_id
                })
                .map(|definition| definition.kind);
            if kind.is_some_and(|kind| kind <= 11 && (0x0d0c_u16 & (1_u16 << kind)) != 0) {
                return None;
            }
        }
        let secondary_source = (hit.effect.tag == 5).then(|| self.healing_source(hit.spell_id));
        let meter_source = self.damage_source(&hit);
        let meter_attribution = self.damage_attribution(&hit, meter_source);
        let meter_attack = hit.context.meter_attack.or(self.generic.meter_attack);
        let effect_stats = self.effect_stats();
        let row = self
            .boss_state
            .wards
            .actors
            .iter_mut()
            .find(|row| row.guid == hit.target_guid)?;
        if row.actor.dead {
            return None;
        }
        if let Some(plan) = hit.dot_plan() {
            periodic::install_dot(
                &mut row.periodic,
                0,
                hit.source_guid,
                hit.spell_id,
                hit.school,
                plan,
                self.now,
                if hit.effect.tag == 5 {
                    hit.effect.value
                } else {
                    0.
                },
                1,
            );
            self.events.extend(self.generic.aura_event(
                row.guid,
                hit.spell_id,
                true,
                &row.periodic,
            ));
            return None;
        }
        let mut victim = Victim {
            health: row.health,
            maximum_health: row.maximum_health,
            primary_boss: false,
            guardian: false,
            has_periodic: !row.periodic.is_empty(),
            native_flag_158: 0,
            slow_until: row.actor.slow.until,
            stun_until: row.actor.stun_until,
            forced_escape_until: row.actor.forced_escape_until,
            vulnerability: row.vulnerability,
            vulnerability_until: row.vulnerability_until,
            demoralizing_amplification: self.generic.demoralizing_amplification
                .get(&row.guid).map_or(0.0, |window| window.value_at(self.now)),
            additional_damage_taken: row.additional_damage_taken,
            dead: false,
        };
        let cap = orb.then_some(victim.maximum_health / 5.0);
        let result = damage::apply_hit_with_cap(
            &mut victim,
            hit.damage,
            &VictimContext {
                run_state: 1,
                now: self.now,
                player_absorb: self.player_absorb,
                talent_effects: &effect_stats,
                spell_amplification: enhancement::spell_amplification(
                    &self.equipped.rows, hit.spell_id, self.now, &row.control,
                    row.health, row.maximum_health,
                ),
                elemental_sunder: row.control.elemental_sunder(hit.school, self.now),
                packlord_amplification: packlord,
            },
            1.,
            cap,
        )?;
        row.health = victim.health;
        let breakdown = meter_attack
            .map(|attack| {
                attack.components(self.attribution.source_kind, f64::from(result.effective))
            })
            .unwrap_or_default();
        self.generic
            .damage_meters
            .record(meter_source, hit.spell_id, result.effective, &breakdown);
        self.events.push(RunEvent::Damage {
            source: self.player_guid,
            causal_source: hit.source_guid,
            target: row.guid,
            spell_id: hit.spell_id,
            school: hit.school,
            raw_power: hit.damage,
            amount: result.amount,
            critical: hit.critical,
            source_kind: self.attribution.source_kind,
            meter_attribution,
            periodic: false,
            emit_log: hit.spell_id != 0 && !hit.context.suppress_damage_log,
        });
        leech_after_hit(result.amount, leech, self.rules.heroic_rank, vitals,
            self.healing, &mut self.generic.healing_meter, self.events);
        let position = row.actor.movement.position_at(self.now);
        let summary = HitInput {
            victim_guid: row.guid,
            position,
            raw_power: hit.damage,
            remaining_health: row.health,
            spell_id: hit.spell_id,
            critical: hit.critical,
        };
        if !result.lethal {
            self.events.extend(self.generic.apply_actor_status(
                &mut row.actor,
                &mut row.control,
                true,
                &row.periodic,
                self.now,
                hit.effect,
                hit.spell_id,
                self.equipped,
                self.movement_counter,
                self.world,
            ));
        }
        match hit.effect.tag {
            5 => self.healing.push(PendingHealing {
                meter_source: secondary_source,
                ..PendingHealing::secondary(hit.damage * hit.effect.value, hit.spell_id)
            }),
            6 => self.healing.push(PendingHealing::secondary(
                self.stats.maximum_health * hit.effect.value,
                hit.spell_id,
            )),
            7 => self.absorbs.push(hit.effect.value),
            _ => {}
        }
        if result.lethal {
            row.actor.movement = ai::Movement {
                from: position,
                to: position,
                started_at: self.now,
                duration: 0.,
            };
            row.actor.dead = true;
            row.actor.died_at = self.now;
            // This adapter retains the predeath periodic snapshot for the
            // shared after-damage callbacks; the dead gate suppresses ticks.

            *self.kills = self.kills.wrapping_add(1);
            if self.stats.heal_on_kill > 0. {
                self.healing
                    .push(PendingHealing::anonymous(self.stats.heal_on_kill));
            }
            self.events.push(RunEvent::EnemyDied { guid: row.guid });
        }
        Some(summary)
    }
}
