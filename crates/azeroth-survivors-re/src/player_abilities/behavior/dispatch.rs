//! Retained ordinary cast dispatcher with the current kind-12 companion port.
//! Terrain, packet emission,
//! combat/death and recomputed player stats use required engine ports.

use super::{
    RuntimeInstance,
    buffs::{self, Aura, BuffActions, ShieldReservation},
    execution::{
        self, Critical, HitContext, PendingHit, PendingHits, ProjectileCast, ProjectilePort,
    },
    periodic::{self, DotPlan, GroundPeriodic},
    state::{Vitals, scaled_hit_effect},
    targeting::{self, Target},
    totems::{self, SummonedObject, Totem},
    unit24,
};
use crate::{
    bosses::abilities::{CastTarget, GroundObject, SpellCast, ground_object},
    enemies::{NativeRng, Position},
    player_abilities::damage::{PowerContext, effective_power},
};

#[derive(Clone, Copy, Debug)]
pub struct CastContext {
    pub now: f32,
    pub player_guid: u64,
    pub player: Position,
    /// Imported cosf/sinf of the actual player orientation.
    pub facing: [f32; 2],
    /// Imported cosf/sinf after native optional+PI/2 totem-side adjustment.
    pub summon_facing: [f32; 2],
    pub power: PowerContext,
    pub global_area: f32,
    pub global_target_bonus: u32,
    pub global_dot_stack_bonus: u32,
    pub global_dot_tick_bonus: f32,
    pub shield_bonus: f32,
    pub hit_context: HitContext,
    pub aimed_shot_focus: u64,
    /// Presence of current talent-effect variant23, not an assumed talent key.
    pub chain_no_decay: bool,
    /// Game+0x285, used only for the original summon faction-template lookup.
    pub native_race: u8,
    /// Original Game+0x3f8 packed player field copied into summon field34.
    pub packed_player_field: u32,
}

#[derive(Debug)]
pub struct ExecutionState<'a> {
    /// Current Game+0xe8 first-hit tokens: cast entry uniquely inserts IDs,
    /// including failed attempts; qualified hits consume them with swap-remove.
    pub seen_spells: Vec<u32>,
    pub pending: PendingHits,
    pub ground: Vec<GroundPeriodic>,
    pub totems: Vec<Totem<'a>>,
    pub auras: Vec<Aura>,
    /// 0.140.0 Game+0x5ec. The last admitted Divine Shield's natural
    /// expiry remains the baseline even after its aura leaves the list.
    pub divine_shield_expires_at: f32,
    pub vitals: Vitals,
    pub shield: ShieldReservation,
}

pub trait CastPort: ProjectilePort {
    /// Current1454f9c6d..f9e14 initializes both once-per-cast token sets,
    /// including attempts that later fail a target/health gate.
    fn begin_cast(&mut self, _spell_id: u32) {}
    /// Selected0.105.0 Empowerment additionally requires a live special demon.
    fn has_special_demons(&self) -> bool { false }
    fn command_pets(&mut self, _instance: &RuntimeInstance<'_>, _context: CastContext,
                    _targets: &[Target]) -> bool { false }
    /// Native Game+0x464/+0x468, read for each victim/launch after prior procs.
    fn critical(&self) -> Critical;
    fn critical_for(&self, _definition: &super::super::catalog::AbilityDefinition) -> Critical {
        self.critical()
    }
    fn direct_power(&self, _instance: &RuntimeInstance<'_>, power: f32, _context: HitContext) -> f32 {
        power
    }
    fn record_direct_hit(
        &mut self,
        _spell_id: u32,
        _target: u64,
        _raw_power: f32,
        _critical: bool,
        _context: HitContext,
    ) {}
    fn record_cast_targets(
        &mut self, _spell_id: u32, _targets: &[&Target], _context: HitContext,
    ) {}
    fn primary_height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn secondary_height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn fallback_height(&self) -> f32;
    /// Execute checks the live actor again for each hit, after earlier hit
    /// procs may have changed another victim's HP. None is native lookup miss.
    fn target_health(&self, guid: u64) -> Option<(f32, f32)>;
    /// Bind the canonical current hit/death and secondary-status handlers.
    /// The provided power is already crit-adjusted, just as the native call.
    /// Recursive hit/proc draws advance this same run RNG before the next cast draw.
    fn direct_hit(&mut self, hit: PendingHit, rng: &mut NativeRng);
    /// A synchronous proc may cast another ability before the next victim.
    /// The live bridge receives the actual execution queues and object serial.
    fn direct_hit_with_execution(
        &mut self,
        hit: PendingHit,
        rng: &mut NativeRng,
        _state: &mut ExecutionState<'_>,
        _guid_counter: &mut dyn crate::native_counter::NativeCounter,
    ) {
        self.direct_hit(hit, rng);
    }
    fn heal(&mut self, spell_id: u32, requested: f32);
    /// Current high-health self-heal gate can admit a nearby injured party hero.
    fn party_needs_healing(&self) -> bool { false }
    /// Enqueue before the local cast visual; the party owner drains once after
    /// all hero simulation, independently of per-recipient aura storage.
    fn share_healing(&mut self, _healing: buffs::SharedHealing) {}
    fn share_aura(&mut self, _aura: buffs::SharedAura) {}
    fn create_ground(&mut self, object: GroundObject);
    /// Current145b387b0 queries the live generic rows, including worn set24.
    fn ground_follows(&self, _definition: &super::super::catalog::AbilityDefinition) -> bool { false }
    fn move_ground(&mut self, _guid: u64, _position: Position) {}
    fn create_totem(&mut self, object: SummonedObject);
    /// Selected0.105.0 cap removal invokes the same expiry callback as the
    /// normal deadline path before destroying the old object. The live
    /// passive port additionally binds learned Call of Flame/deadline state.
    fn expire_totem(&mut self, totem: Totem<'_>, _context: CastContext, _rng: &mut NativeRng) {
        if totem.guid != 0 { self.remove_object(totem.guid); }
    }
    fn remove_object(&mut self, guid: u64);
    /// Emit current player aura fields and recompute stats when requested.
    /// This callback also routes an immediate heal to the real healing owner.
    fn finish_buff(&mut self, spell_id: u32, actions: BuffActions);
    fn finish_buff_with_execution(
        &mut self,
        spell_id: u32,
        actions: BuffActions,
        state: &mut ExecutionState<'_>,
    ) {
        let _ = state;
        self.finish_buff(spell_id, actions);
    }
}

fn height(port: &mut impl CastPort, mut position: Position) -> Position {
    position.z = port
        .primary_height([position.x, position.y])
        .or_else(|| port.secondary_height([position.x, position.y]))
        .unwrap_or_else(|| port.fallback_height());
    position
}

fn visual(
    instance: &RuntimeInstance<'_>,
    context: CastContext,
    target: CastTarget,
    targets: &[&Target],
    port: &mut impl CastPort,
) {
    // 0.123.0 145b32361..145b3236c aliases only the kind-two cast event.
    // Damage, cooldowns and learned ability identity retain descriptor1535.
    let spell_id = if instance.definition.kind == 2 && instance.definition.spell_id == 1535 {
        8349
    } else {
        instance.definition.spell_id
    };
    port.cast_spell(SpellCast {
        source_guid: context.player_guid,
        spell_id,
        target,
        hit_targets: targets.iter().map(|t| t.actor.guid).collect(),
    });
}

pub(super) fn direct(
    instance: &RuntimeInstance<'_>,
    target: u64,
    power: f32,
    context: CastContext,
    rng: &mut NativeRng,
    port: &mut impl CastPort,
    state: &mut ExecutionState<'_>,
    guid_counter: &mut dyn crate::native_counter::NativeCounter,
) {
    let roll = unit24(rng);
    let stats = port.critical_for(instance.definition);
    let critical = roll < stats.chance;
    port.record_direct_hit(instance.definition.spell_id, target, power, critical, context.hit_context);
    let power = port.direct_power(instance, power, context.hit_context);
    port.direct_hit_with_execution(
        PendingHit {
            context: context.hit_context,
            target_guid: target,
            source_guid: context.player_guid,
            effect: scaled_hit_effect(instance),
            resolves_at: context.now,
            spell_id: instance.definition.spell_id,
            damage: if critical {
                stats.multiplier * power
            } else {
                power
            },
            critical,
            damages_player: false,
            school: instance.definition.school,
        },
        rng,
        state,
        guid_counter,
    );
}

/// False means the native cast gate failed and the scheduler retries after.2s.
/// Kind11 returns false in the cast function and is skipped by the scheduler;
/// its passive effects are consumed by the run's stat/hit/proc owners.
pub fn cast<'a>(
    instance: &RuntimeInstance<'a>,
    context: CastContext,
    targets: &[Target],
    state: &mut ExecutionState<'a>,
    rng: &mut NativeRng,
    guid_counter: &mut dyn crate::native_counter::NativeCounter,
    port: &mut impl CastPort,
) -> bool {
    let definition = instance.definition;
    port.begin_cast(definition.spell_id);
    //1454e7a9d..1454e7b74 precedes the kind switch and every cast gate.
    if !state.seen_spells.contains(&definition.spell_id) {
        state.seen_spells.push(definition.spell_id);
    }
    if definition.key == "demonic_empowerment" && !port.has_special_demons() {
        return false;
    }
    let power = effective_power(instance, &context.power);
    let count = execution::target_count(instance, context.global_target_bonus);
    match definition.kind {
        12 => port.command_pets(instance, context, targets),
        0 | 1 => {
            let mut selected =
                targeting::ordered_targets(targets, context.now, context.player, definition.range);
            if selected.is_empty() {
                return false;
            }
            if definition.kind == 1 {
                targeting::shuffle(&mut selected, rng);
                if definition.key == "arcane_missiles" {
                    let preferred = selected
                        .iter()
                        .copied()
                        .filter(|t| t.has_metadata || t.flagged)
                        .collect::<Vec<_>>();
                    if !preferred.is_empty() {
                        selected = preferred;
                    }
                }
                selected = selected
                    .iter()
                    .copied()
                    .cycle()
                    .take(count as usize)
                    .collect();
            } else {
                if definition.key == "aimed_shot" && context.aimed_shot_focus != 0 {
                    if let Some(index) = selected
                        .iter()
                        .position(|t| t.actor.guid == context.aimed_shot_focus)
                    {
                        let focus = selected.remove(index);
                        selected.insert(0, focus);
                    }
                }
                selected.truncate(count as usize);
            }
            port.record_cast_targets(definition.spell_id, &selected, context.hit_context);
            for target in selected {
                execution::launch_projectile(
                    instance,
                    &target.actor,
                    ProjectileCast {
                        source_guid: context.player_guid,
                        source: context.player,
                        now: context.now,
                        extra_delay: 0.0,
                        raw_power: power,
                        critical: port.critical(),
                        context: context.hit_context,
                        effect: scaled_hit_effect(instance),
                    },
                    rng,
                    &mut state.pending,
                    port,
                );
            }
            true
        }
        2 | 8 => {
            let radius = periodic::scaled_radius(
                instance,
                context.global_area,
                if definition.kind == 8 {
                    definition.range
                } else {
                    definition.radius
                },
            );
            let selected = if definition.kind == 8 {
                targeting::cone_targets(
                    targets,
                    context.now,
                    context.player,
                    radius,
                    context.facing,
                )
            } else {
                targeting::radius_targets(targets, context.now, context.player, radius, &[])
            };
            if selected.is_empty() && !(definition.kind == 2 && definition.effect.tag == 6) {
                return false;
            }
            visual(instance, context, CastTarget::None, &selected, port);
            for target in selected {
                direct(
                    instance,
                    target.actor.guid,
                    power,
                    context,
                    rng,
                    port,
                    state,
                    guid_counter,
                );
            }
            // Kind-two native self-heal occurs once after all actor hits, even
            // with no actors; it is separate from per-victim secondary effects.
            if definition.kind == 2 && definition.effect.tag == 6 {
                port.heal(
                    definition.spell_id,
                    definition.effect.value * context.power.maximum_health,
                );
            }
            true
        }
        3 => {
            let radius = periodic::area_radius(instance, context.global_area);
            let center = if definition.range <= 0.0 {
                if targeting::radius_targets(targets, context.now, context.player, radius, &[])
                    .is_empty()
                {
                    return false;
                }
                context.player
            } else {
                let Some(center) = targeting::ground_center(
                    targets,
                    context.now,
                    context.player,
                    definition.range,
                    radius,
                ) else {
                    return false;
                };
                center
            };
            let center = height(port, center);
            visual(instance, context, CastTarget::Ground(center), &[], port);
            let object = ground_object(
                guid_counter,
                context.player_guid,
                definition.spell_id,
                radius,
                center,
            );
            let guid = object.guid;
            port.create_ground(object);
            state.ground.push(GroundPeriodic::new(
                instance,
                context.now,
                guid,
                center,
                radius,
                power,
            ));
            true
        }
        4 => {
            let first =
                targeting::ordered_targets(targets, context.now, context.player, definition.range);
            let Some(first) = first.first().copied() else {
                return false;
            };
            let radius = periodic::area_radius(instance, context.global_area);
            let mut selected = vec![first];
            let mut excluded = vec![first.actor.guid];
            while selected.len() < count as usize {
                let center = selected
                    .last()
                    .unwrap()
                    .actor
                    .movement
                    .position_at(context.now);
                let next =
                    targeting::radius_targets(targets, context.now, center, radius, &excluded);
                let Some(next) = next.first().copied() else {
                    break;
                };
                selected.push(next);
                excluded.push(next.actor.guid);
            }
            visual(
                instance,
                context,
                CastTarget::Unit(first.actor.guid),
                &selected,
                port,
            );
            let decay: f32 = if context.chain_no_decay { 1.0 } else { 0.92 };
            for (index, target) in selected.iter().enumerate() {
                let roll = unit24(rng);
                let stats = port.critical();
                let critical = roll < stats.chance;
                let raw = decay.powf(index as f32) * power;
                state.pending.0.push(PendingHit {
                    context: context.hit_context,
                    target_guid: target.actor.guid,
                    source_guid: context.player_guid,
                    effect: scaled_hit_effect(instance),
                    resolves_at: index as f32 * 0.08 + context.now,
                    spell_id: definition.spell_id,
                    damage: if critical {
                        stats.multiplier * raw
                    } else {
                        raw
                    },
                    critical,
                    damages_player: false,
                    school: definition.school,
                });
            }
            true
        }
        5 | 7 => {
            let mut selected =
                targeting::ordered_targets(targets, context.now, context.player, definition.range);
            if selected.is_empty() {
                return false;
            }
            if definition.kind == 7 {
                targeting::order_execute(&mut selected, context.now);
            }
            selected.truncate(count as usize);
            visual(
                instance,
                context,
                CastTarget::Unit(selected[0].actor.guid),
                &selected,
                port,
            );
            for target in selected {
                let execute_bonus = definition.kind == 7
                    && port
                        .target_health(target.actor.guid)
                        .is_some_and(|(health, maximum)| health / maximum < 0.3);
                let raw = if execute_bonus { power + power } else { power };
                direct(
                    instance,
                    target.actor.guid,
                    raw,
                    context,
                    rng,
                    port,
                    state,
                    guid_counter,
                );
            }
            true
        }
        6 => {
            let selected = targeting::dot_targets(
                targets,
                context.now,
                context.player,
                definition.range,
                definition.spell_id,
                context.global_dot_stack_bonus,
                count,
            );
            if selected.is_empty() {
                return false;
            }
            let plan = DotPlan::new(instance, power, context.global_dot_tick_bonus);
            port.record_cast_targets(definition.spell_id, &selected, context.hit_context);
            let mut hit_context = context.hit_context;
            hit_context.cast_words = plan.words();
            for target in selected {
                execution::launch_projectile(
                    instance,
                    &target.actor,
                    ProjectileCast {
                        source_guid: context.player_guid,
                        source: context.player,
                        now: context.now,
                        extra_delay: 0.0,
                        raw_power: 0.0,
                        critical: port.critical(),
                        context: hit_context,
                        effect: scaled_hit_effect(instance),
                    },
                    rng,
                    &mut state.pending,
                    port,
                );
            }
            true
        }
        9 => {
            let divine_shield = definition.key == "divine_shield";
            if divine_shield
                && super::super::damage::divine_shield_gap(instance)
                    > context.now - state.divine_shield_expires_at
            {
                return false;
            }
            let nearby =
                !targeting::radius_targets(targets, context.now, context.player, 30.0, &[])
                    .is_empty();
            let Ok(actions) = buffs::apply_self_buff_with_party(
                instance,
                context.now,
                nearby,
                port.party_needs_healing(),
                context.shield_bonus,
                &mut state.vitals,
                &mut state.shield,
                &mut state.auras,
            ) else {
                return false;
            };
            if divine_shield {
                state.divine_shield_expires_at = context.now
                    + super::super::damage::scaled_duration(instance).max(0.1);
            }
            if let Some(healing) = actions.shared_healing {
                port.share_healing(healing);
            }
            if let Some(aura) = actions.shared_aura {
                port.share_aura(aura);
            }
            visual(instance, context, CastTarget::None, &[], port);
            port.finish_buff_with_execution(definition.spell_id, actions, state);
            true
        }
        10 => {
            if targeting::radius_targets(targets, context.now, context.player, 25.0, &[]).is_empty()
            {
                return false;
            }
            visual(instance, context, CastTarget::None, &[], port);
            let position = height(
                port,
                Position {
                    x: context.summon_facing[0] * 1.5 + context.player.x,
                    y: context.summon_facing[1] * 1.5 + context.player.y,
                    z: context.player.z,
                },
            );
            if let Some(old) = totems::remove_for_kind_limit(&mut state.totems, definition.key) {
                port.expire_totem(old, context, rng);
            }
            let totem = Totem::new(instance, context.now, guid_counter, position);
            port.create_totem(totems::object(
                &totem,
                context.player_guid,
                context.native_race,
                context.packed_player_field,
            ));
            state.totems.push(totem);
            true
        }
        11 => false,
        _ => false, //No current definition has another kind.
    }
}

///1454a3cd0..1454a4178: removal precedes tick; one due tick per row/frame,
/// independent crit draw per current victim. Effects are applied with that
/// crit-adjusted power by the same canonical direct-hit port.
pub fn tick_ground(
    context: CastContext,
    targets: &[Target],
    state: &mut ExecutionState<'_>,
    rng: &mut NativeRng,
    port: &mut impl CastPort,
    guid_counter: &mut dyn crate::native_counter::NativeCounter,
) {
    let mut index = 0;
    while index < state.ground.len() {
        if context.now >= state.ground[index].remove_at {
            let row = state.ground.remove(index);
            if row.object_guid != 0 {
                port.remove_object(row.object_guid);
            }
            continue;
        }
        // Current145bfd8a6..145bfdb91 updates an active kind-zero area before
        // its next due tick. The selector is live, not captured at creation.
        if state.ground[index].ticks_remaining != 0 {
            let definition = super::super::catalog::AbilityDefinition::for_spell_id(
                state.ground[index].spell_id,
            ).find(|definition| definition.kind == 3);
            if definition.is_some_and(|definition| port.ground_follows(definition)) {
                let mut center = context.player;
                center.z = port.primary_height([center.x, center.y])
                    .or_else(|| port.secondary_height([center.x, center.y]))
                    .unwrap_or(center.z);
                if execution::distance_squared(state.ground[index].center, center).sqrt() > 2.0 {
                    state.ground[index].center = center;
                    port.move_ground(state.ground[index].object_guid, center);
                }
            }
        }
        if state.ground[index].take_tick(context.now) {
            let row = state.ground[index];
            for target in
                targeting::radius_targets(targets, context.now, row.center, row.radius, &[])
            {
                let roll = unit24(rng);
                let stats = port.critical();
                let critical = roll < stats.chance;
                port.direct_hit_with_execution(
                    PendingHit {
                        context: context.hit_context,
                        target_guid: target.actor.guid,
                        source_guid: context.player_guid,
                        effect: row.effect,
                        resolves_at: context.now,
                        spell_id: row.spell_id,
                        damage: if critical {
                            stats.multiplier * row.damage_per_tick
                        } else {
                            row.damage_per_tick
                        },
                        critical,
                        damages_player: false,
                        school: row.school,
                    },
                    rng,
                    state,
                    guid_counter,
                );
            }
        }
        index += 1;
    }
}
