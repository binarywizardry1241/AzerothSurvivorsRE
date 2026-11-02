//! Current shared actor walk and its separate publication/consumption queues.
//! Native14597830a..14597cd0f; see actor-frame-order-0.109.0.md.
use super::*;

#[derive(Clone, Copy, Debug)]
enum Lane {
    Actor(usize),
    Boss(usize),
    Ward(usize),
}

/// Native decisions mutate each actor in insertion order, while packet and
/// damage consumers run by queue. Allocating movement serials during decisions
/// would incorrectly interleave them with other actors' publications.
#[derive(Default)]
pub(super) struct ActorFrame {
    pub(super) actor_index: usize,
    movements: Vec<(u64, ai::Movement)>,
    melee: Vec<(f32, bool, u64)>,
    casts: Vec<(u64, u32, f32)>,
    removals: Vec<u64>,
    pub(super) yells: Vec<RunAnnouncement>,
    pub(super) emotes: Vec<RunAnnouncement>,
    pub(super) engaged: Vec<u64>,
}

impl ActorFrame {
    pub(super) fn collect(&mut self, guid: u64, actions: Vec<ai::Action>) {
        for action in actions {
            match action {
                ai::Action::Move(movement) => self.movements.push((guid, movement)),
                ai::Action::Melee {
                    source_guid,
                    damage,
                } => {
                    self.melee.push((damage, true, source_guid));
                }
                ai::Action::CompleteCast {
                    source_guid,
                    spell_id,
                    damage,
                } => {
                    self.casts.push((source_guid, spell_id, damage));
                }
                ai::Action::Remove { guid } => self.removals.push(guid),
                ai::Action::BeginCast {
                    source_guid,
                    spell_id,
                    duration,
                } => {
                    // Native queues a negative duration in the same float
                    // slot used by a completed cast's nonnegative damage.
                    self.casts.push((source_guid, spell_id, -duration));
                }
            }
        }
    }
}

impl Mechanics {
    ///1459b5358 destroys actor-owned fields with the removed vector element.
    /// Queued effects/source GUID references keep their own native lifetimes.
    pub(super) fn retire_actor_metadata(&mut self, guid: u64) {
        self.coop.targets.remove(&guid);
        self.affixes.retire(guid);
        self.guardian_state.retire_actor(guid);
        self.boss_state.defenses.remove(&guid);
        self.boss_state.forms.remove(&guid);
        self.boss_state.other_deadlines.remove(&guid);
        let generic = &mut self.effect_state.generic;
        generic.aura_slots.remove(&guid);
        generic.reduction_spells.remove(&guid);
        generic.reduction_durations.remove(&guid);
        generic.actor_weakening.remove(&guid);
        generic.demoralizing_amplification.remove(&guid);
        generic.appearance_overrides.remove(&guid);
    }

    pub(super) fn tick_actor_frame(
        &mut self,
        delta: f32,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        let now = self.clock;
        let current = self.counter.sequence();
        let mut order: Vec<_> = self
            .actors
            .iter()
            .enumerate()
            .map(|(index, row)| (row.allocation_order, Lane::Actor(index)))
            .chain(
                self.bosses
                    .iter()
                    .enumerate()
                    .map(|(index, row)| (row.allocation_order, Lane::Boss(index))),
            )
            .chain(
                self.boss_state
                    .wards
                    .actors
                    .iter()
                    .enumerate()
                    .map(|(index, row)| (row.allocation_order, Lane::Ward(index))),
            )
            .collect();
        order.sort_by_key(|(allocated, _)| std::cmp::Reverse(current.wrapping_sub(*allocated)));
        let mut frame = ActorFrame::default();
        let mut periodic_hits = Vec::new();
        let mut actor_aura_updates = Vec::new();
        for (actor_index, (_, lane)) in order.into_iter().enumerate() {
            frame.actor_index = actor_index;
            let (actor_guid, actor_position) = match lane {
                Lane::Actor(index) => (self.actors[index].guid, self.actors[index].actor.movement.position_at(now)),
                Lane::Boss(index) => (self.bosses[index].guid, self.bosses[index].actor.movement.position_at(now)),
                Lane::Ward(index) => (self.boss_state.wards.actors[index].guid,
                    self.boss_state.wards.actors[index].actor.movement.position_at(now)),
            };
            let previous_target = self.coop.targets.get(&actor_guid).copied();
            let (slot, input) = if self.has_party() {
                if let Some(slot) = self.coop.targets.get(&actor_guid).copied() {
                    (slot, self.party_input_for(slot).unwrap_or(coop::PartyInput {
                        position: player, facing, velocity: [0.0; 2] }))
                } else { self.party_target(actor_guid, actor_position) }
            }
                else { (0, coop::PartyInput { position: player, facing, velocity: [0.0; 2] }) };
            if self.has_party() && previous_target != Some(slot) {
                let actor = match lane {
                    Lane::Actor(index) => &mut self.actors[index].actor,
                    Lane::Boss(index) => &mut self.bosses[index].actor,
                    Lane::Ward(index) => &mut self.boss_state.wards.actors[index].actor,
                };
                actor.next_movement_at = actor.next_movement_at.min(now);
            }
            self.with_party_hero(slot, |game| {
            match lane {
                Lane::Actor(index) => {
                    let row = &mut game.actors[index];
                    if row.actor.dead {
                        if now - row.actor.died_at > 1.2 {
                            frame.removals.push(row.guid);
                        }
                        return;
                    }
                    if !row.actor.dead {
                        periodic_hits.extend(periodic::take_actor_ticks(
                            &mut row.periodic,
                            row.guid,
                            now,
                        ));
                        actor_aura_updates.extend(game.effect_state.generic.update_actor_auras(
                            &mut row.actor,
                            &mut row.control,
                            &mut row.periodic,
                            now,
                        ));
                    }
                    if game.guardian_state.contains(row.guid) {
                        game.tick_guardian(index, delta, input.position, world, &mut frame);
                    } else {
                        let hold_until = game
                            .boss_state
                            .other_deadlines
                            .get(&row.guid)
                            .map_or(0., |deadlines| deadlines.hold_until);
                        let actions = row.actor.tick_with_stage_and_hold(
                            Some(row.definition),
                            ai::Context {
                                now,
                                elapsed: delta,
                                player: input.position,
                                zone_center: game.zone.center.into(),
                                zone_radius: game.zone.radius,
                            },
                            world,
                            &ai::HostMath,
                            ai::CombatModifiers::default(),
                            hold_until,
                            |_, _| {},
                        );
                        frame.collect(row.guid, actions);
                    }
                }
                Lane::Boss(index) => {
                    let row = &mut game.bosses[index];
                    if row.actor.dead {
                        if now - row.actor.died_at > 1.2 {
                            frame.removals.push(row.guid);
                        }
                        return;
                    }
                    if !row.actor.dead {
                        periodic_hits.extend(periodic::take_actor_ticks(
                            &mut row.periodic,
                            row.guid,
                            now,
                        ));
                        actor_aura_updates.extend(game.effect_state.generic.update_actor_auras(
                            &mut row.actor,
                            &mut row.control,
                            &mut row.periodic,
                            now,
                        ));
                    }
                    game.tick_boss(index, delta, input.position, world, &mut frame);
                }
                Lane::Ward(index) => {
                    let row = &mut game.boss_state.wards.actors[index];
                    if row.actor.dead {
                        if now - row.actor.died_at > 1.2 {
                            frame.removals.push(row.guid);
                        }
                        return;
                    }
                    if !row.actor.dead {
                        periodic_hits.extend(periodic::take_actor_ticks(
                            &mut row.periodic,
                            row.guid,
                            now,
                        ));
                        actor_aura_updates.extend(game.effect_state.generic.update_actor_auras(
                            &mut row.actor,
                            &mut row.control,
                            &mut row.periodic,
                            now,
                        ));
                    }
                }
            }
            });
        }
        let ward_actions = self.boss_state.wards.collect_due(now);
        // Corpses share the ordinary removal queue, before all movement. Ward
        // lifetime/parent removals still belong to the later ward-action stage.
        for guid in &frame.removals {
            self.events.push(RunEvent::RemoveObject(*guid));
            self.boss_state.wards.remove(*guid);
            self.retire_actor_metadata(*guid);
        }
        self.actors
            .retain(|row| !frame.removals.contains(&row.guid));
        self.bosses
            .retain(|row| !frame.removals.contains(&row.guid));
        for (guid, movement) in frame.movements {
            publish_actor_movement(&mut self.events, &mut self.movement_counter, guid, movement);
            if movement.duration <= 0.0 {
                let slot = self.coop.targets.get(&guid).copied().unwrap_or(0);
                let target_guid = self.party_guid(slot).unwrap_or(self.player_guid);
                if let Some(RunEvent::StationaryFacing { target, .. }) = self.events.last_mut() {
                    *target = target_guid;
                }
            }
        }
        for (amount, melee, source_guid) in frame.melee {
            let slot = self.coop.targets.get(&source_guid).copied().unwrap_or(0);
            let input = self.party_input_for(slot).unwrap_or(coop::PartyInput {
                position: player, facing, velocity: [0.0; 2] });
            self.with_party_hero(slot, |game| {
                game.events.push(RunEvent::Melee { source: source_guid, target: game.player_guid,
                    amount: ai::melee_damage_after_armor(amount, game.stats.armor_fraction) as u32,
                    critical: false });
                game.damage_player(amount, melee, source_guid, input.position, input.facing, world);
            });
        }
        // Native casts resolve their source's live position after melee damage
        // and retaliation, then create the ordinary pending hostile hit.
        for (source_guid, spell_id, damage) in frame.casts {
            let slot = self.coop.targets.get(&source_guid).copied().unwrap_or(0);
            let input = self.party_input_for(slot).unwrap_or(coop::PartyInput {
                position: player, facing, velocity: [0.0; 2] });
            self.with_party_hero(slot, |game| {
            if damage < 0. {
                game.events.push(RunEvent::ActorCast {
                    source: source_guid,
                    spell_id,
                    seconds: -damage,
                });
                return;
            }
            let Some(from) = game
                .actors
                .iter()
                .find(|row| row.guid == source_guid)
                .map(|row| row.actor.movement.position_at(now))
                .or_else(|| {
                    game.bosses
                        .iter()
                        .find(|row| row.guid == source_guid)
                        .map(|row| row.actor.movement.position_at(now))
                })
            else {
                return;
            };
            game.events.push(RunEvent::Spell(SpellCast {
                source_guid,
                spell_id,
                target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(game.player_guid),
                hit_targets: vec![game.player_guid],
            }));
            let speed = azeroth_survivors_re::bosses::abilities::native_missile_speed(spell_id);
            let distance = behavior::execution::distance_squared(from, input.position).sqrt();
            game.execution.pending.0.push(PendingHit {
                context: HitContext {
                    hostile_origin: Some([from.x.to_bits(), from.y.to_bits(), from.z.to_bits()]),
                    ..Default::default()
                },
                target_guid: game.player_guid,
                source_guid,
                effect: player_abilities::StatusEffect {
                    tag: 0,
                    value: 0.,
                    duration: 0.,
                },
                resolves_at: now + if speed > 0. { distance / speed } else { 0. },
                spell_id,
                damage,
                critical: false,
                damages_player: true,
                school: 5,
            });
                    });
        }
        if self.has_party() {
            let mut owned: std::collections::BTreeMap<u8, Vec<_>> = std::collections::BTreeMap::new();
            for hit in periodic_hits { owned.entry(self.party_slot_for_source(hit.owner_guid)).or_default().push(hit); }
            for (slot, hits) in owned {
                let input = self.party_input_for(slot).unwrap_or(coop::PartyInput {
                    position: player, facing, velocity: [0.0; 2] });
                self.with_party_hero(slot, |game| game.resolve_actor_periodic(hits, delta,
                    input.position, input.facing, world));
            }
        } else { self.resolve_actor_periodic(periodic_hits, delta, player, facing, world); }
        self.publish_actor_aura_updates(actor_aura_updates);
        self.events
            .extend(frame.yells.into_iter().map(RunEvent::Announcement));
        self.events
            .extend(frame.emotes.into_iter().map(RunEvent::Announcement));
        let raid_damage = self.dispatch_pending_raid_requests(player, world);
        let (player, facing) = self.boss_state.player_override.unwrap_or((player, facing));
        for (amount, melee, source) in raid_damage {
            self.damage_player(amount, melee, source, player, facing, world);
        }
        self.resolve_ward_actions(ward_actions, player, facing, world);
        if self.has_party() {
            for guid in frame.engaged {
                let slot = self.coop.targets.get(&guid).copied().unwrap_or(0);
                self.with_party_hero(slot, |game| game.resolve_guardian_engagements(vec![guid]));
            }
        } else { self.resolve_guardian_engagements(frame.engaged); }
    }
}
