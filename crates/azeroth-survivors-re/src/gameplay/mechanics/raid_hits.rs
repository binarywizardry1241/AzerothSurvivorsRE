//! Synchronous native30 bomb bursts through the live canonical player-hit path.
//! Native ordinary-actor selector1459c4940 excludes primary/guardian headers;
//! consumer1459532d0 uses school2, noncritical hits after player hazard damage.

use super::*;

impl Mechanics {
    pub(super) fn apply_raid_bomb_hits(
        &mut self,
        bursts: Vec<(Position, f32, f32, u32)>,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        for (center, radius, damage, spell_id) in bursts {
            // Canonical native145971490 refuses damage after the run leaves
            // its active state, including a lethal preceding player hazard.
            if self.dead || self.completed {
                break;
            }
            if !(damage > 0.0) {
                continue;
            }
            let now = self.clock;
            // Capture this burst's ordinary targets before executing any hit:
            // synchronous procs may move, kill or create other actors.
            let targets = actor_targets(
                &self.actors,
                &self.bosses,
                &self.boss_state.wards,
                self.counter.sequence(),
            )
            .into_iter()
            .filter(|row| {
                !row.actor.dead
                    && !row.has_metadata
                    && !self.guardian_state.contains(row.actor.guid)
            })
            .filter(|row| {
                let point = row.actor.movement.position_at(now);
                radius >= (point.x - center.x).hypot(point.y - center.y)
            })
            .map(|row| row.actor.guid)
            .collect::<Vec<_>>();
            if targets.is_empty() {
                continue;
            }
            let rules = self.rules;
            let context = self.cast_context(player, facing);
            let passive_context = behavior::passive_tick::TickContext {
                now,
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
                now,
                run_level: self.level,
                player,
                zone: self.zone,
                rules,
                stats: RunPlayerStats {
                    maximum_health: self.execution.vitals.maximum_health,
                    ..self.stats
                },
                class_id: self.class.class_id,
                player_absorb: self.execution.vitals.absorb,
                equipped: &self.effect_state.equipped,
                meter_sources: &self.effect_state.meter_sources,
                meter_abilities: self
                    .abilities
                    .iter()
                    .map(|instance| (instance.definition, instance.rank))
                    .collect(),
                meter_racial: self.racial.as_ref().map(|instance| instance.definition),
                meter_spells: self.recap_spells.as_deref(),
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
                extra_cast_factor: extra_cast_factor,
                leech: self.effect_state.leech,
                world: &mut *world,
                attribution: PassiveAttribution {
                    source_kind: 0,
                    source_words: [0; 4],
                    cast_words: [0; 4],
                },
            };
            {
                let mut passive = passives::PassiveCombat {
                    core: &mut port,
                    learned: &mut self.abilities,
                    state: &mut self.passive_state,
                    context: passive_context,
                    cast_context: context,
                    first_periodic: false,
                    native_7e4: &mut self.native_7e4,
                    native_30: false,
                    object_counter: None,
                };
                for target_guid in targets {
                    passive.hit_with_execution(
                        PendingHit {
                            context: HitContext::default(),
                            target_guid,
                            source_guid: self.player_guid,
                            effect: player_abilities::StatusEffect {
                                tag: 0,
                                value: 0.0,
                                duration: 0.0,
                            },
                            resolves_at: now,
                            spell_id,
                            damage,
                            critical: false,
                            damages_player: false,
                            school: 2,
                        },
                        &mut self.rng,
                        &mut self.execution,
                        &mut self.counter,
                    );
                }
            }
            port.flush_vitals(&mut self.execution.vitals);
            let refreshed = port.stats_recomputed.then_some((port.stats, port.leech));
            drop(port);
            if let Some((stats, leech)) = refreshed {
                self.accept_refreshed_stats(stats, leech);
            }
        }
    }
}
