//! Boss enrage, remaining ability timers and the shared actor update ordering.
//! Native owners: 1454cae7d..1454cb009 and 1454ccbb0..1454ccd0a.

use crate::enemies::ai::{Action, Actor, CombatModifiers, Context, Math, Movement, TimedReduction, World};
use super::{catalog::BossDefinition, scaling::{initial_ability_timers, BossInitialStats}, RawBossAbility, Position};

#[derive(Clone, Debug, PartialEq)]
pub struct BossAiState {
    pub enraged: bool,
    pub cooldowns: Vec<f32>,
    /// Selected current circle/minion timers in native slot order.
    pub raid_schedule: super::raid_area_catalog::ScheduleState,
    /// Native boss+48 action-selection deadline, distinct from common casting.
    pub raid_cast_until: f32,
    /// Native actor+1c4 admission hold applied before common attacks/movement.
    pub raid_hold_until: f32,
}

/// Original deferred ability request records retain the actor-vector index.
/// The dispatcher looks up that index again and ignores a missing/dead actor.
#[derive(Clone, Copy, Debug)]
pub struct QueuedAbility {
    pub actor_index: usize,
    pub ability: RawBossAbility,
}

#[derive(Clone, Debug)]
pub struct BossTick {
    pub common_actions: Vec<Action>,
    pub abilities: Vec<QueuedAbility>,
    pub phase_yells: Vec<super::minion_phases::PhaseAction>,
}

impl BossAiState {
    pub fn new(definition: &BossDefinition) -> Self {
        Self { enraged: false, cooldowns: initial_ability_timers(definition),
            raid_schedule: super::raid_area_catalog::ScheduleState::new(definition.id),
            raid_cast_until: 0.0, raid_hold_until: 0.0 }
    }

    pub fn modifiers(&self) -> CombatModifiers {
        if self.enraged { CombatModifiers { movement: 1.25, damage: 1.4 } }
        else { CombatModifiers::default() }
    }

    /// Call only after the original common status/escape gates. Enrage is
    /// latched when the f32 value `max_health * 0.3` exceeds current health,
    /// and is not removed by subsequent healing. Preserve the rounded threshold.
    /// Each timer fires at most once per tick in original ability-slot order.
    pub fn advance(&mut self, definition: &BossDefinition, actor_index: usize,
        elapsed: f32, health: f32, max_health: f32) -> Vec<QueuedAbility> {
        self.advance_for_rank(definition, actor_index, elapsed, health, max_health, 0)
    }

    pub fn advance_for_rank(&mut self, definition: &BossDefinition, actor_index: usize,
        elapsed: f32, health: f32, max_health: f32, heroic_rank: u8) -> Vec<QueuedAbility> {
        if !self.enraged && max_health * 0.3 > health { self.enraged = true; }
        let repeat_scale = crate::heroic::boss_repeat_factor(heroic_rank, self.enraged);
        let mut due=Vec::new();
        for (index,timer) in self.cooldowns.iter_mut().enumerate() {
            *timer -= elapsed;
            if *timer <= 0.0 {
                let ability=*definition.abilities.get(index).expect("native boss ability bounds failure");
                *timer = repeat_scale * f32::from_bits(ability.words[6]);
                due.push(QueuedAbility { actor_index, ability });
            }
        }
        due
    }

    /// Reuse the original common actor path, including spawn stun, fear,
    /// escape, contact melee and movement. Ability dispatch belongs to the
    /// owning frame after its movement/melee/aura stages, not inside this call.
    pub fn tick(&mut self, definition: &BossDefinition, actor_index: usize,
        actor: &mut Actor, health: f32, max_health: f32, context: Context,
        world: &impl World, math: &impl Math) -> BossTick {
        self.tick_inner(definition, actor_index, actor, health, max_health, context, world, math, None, 0)
    }

    /// Selected minion and current raid phases share the admitted actor stage,
    /// complete native phase indices and the existing deferred dispatch queue.
    pub fn tick_with_minion_phases(&mut self, definition: &BossDefinition, actor_index: usize,
        actor: &mut Actor, health: f32, max_health: f32, context: Context,
        world: &impl World, math: &impl Math, phases: &mut super::minion_phases::PhaseState) -> BossTick {
        self.tick_inner(definition, actor_index, actor, health, max_health, context, world, math, Some(phases), 0)
    }

    pub fn tick_with_minion_phases_for_rank(&mut self, definition: &BossDefinition, actor_index: usize,
        actor: &mut Actor, health: f32, max_health: f32, context: Context,
        world: &impl World, math: &impl Math, phases: &mut super::minion_phases::PhaseState,
        heroic_rank: u8) -> BossTick {
        self.tick_inner(definition, actor_index, actor, health, max_health, context, world, math,
            Some(phases), heroic_rank)
    }

    fn tick_inner(&mut self, definition: &BossDefinition, actor_index: usize,
        actor: &mut Actor, health: f32, max_health: f32, context: Context,
        world: &impl World, math: &impl Math, mut phases: Option<&mut super::minion_phases::PhaseState>, heroic_rank: u8) -> BossTick {
        let mut abilities=Vec::new();
        let mut phase_yells=Vec::new();
        let modifiers=self.modifiers();
        let hold_until = self.raid_hold_until;
        let common_actions=actor.tick_with_stage_and_hold(None,context,world,math,modifiers,hold_until,|_,modifiers| {
            // Historical helpers remain separately testable. On the live
            // current path, replace every old ground/summon/strike producer:
            // new native slots must not be inferred from old ability records.
            abilities=self.advance_for_rank(definition,actor_index,context.elapsed,health,max_health,heroic_rank);
            if let Some(phases) = phases.as_mut() {
                phase_yells = phases.take_actions(definition.id, health, max_health);
            }
            let blocking_phase = phase_yells.iter().any(|phase| phase.blocking());
            if super::raid_area_catalog::current_schedule(definition.id).is_some() {
                // The selected current schedule is complete: every native
                // recurring slot uses its current record and admission order.
                abilities.clear();
                let now = context.now;
                let selected: Vec<_> = self.raid_schedule.advance_with_phases_for_rank(
                    definition.id, context.elapsed, self.enraged, self.raid_cast_until > now, blocking_phase, heroic_rank,
                ).into_iter().map(|ability| QueuedAbility { actor_index, ability }).collect();
                abilities = selected;
            }
            if !phase_yells.is_empty() {
                // Native phase requests precede ordinary timer requests. No
                // summon mutates an actor until the owning deferred stage.
                let mut queued: Vec<_> = phase_yells.iter().map(|phase| QueuedAbility {
                    actor_index, ability: phase.ability(),
                }).collect();
                queued.append(&mut abilities);
                abilities = queued;
            }
            *modifiers=self.modifiers();
        });
        BossTick { common_actions, abilities, phase_yells }
    }
}

/// Install the recovered boss constructor's common actor fields. The real
/// owner stores health, max health, definition identity and raw_148_clock.
pub fn make_combat_actor(guid: u64, position: Position, now: f32, stats: &BossInitialStats) -> Actor {
    Actor {
        guid,
        movement: Movement { from: position, to: position, started_at: now, duration: 0.0 },
        next_movement_at: stats.next_movement_at,
        attack_delay: stats.initial_attack_delay,
        attack_interval: stats.attack_interval,
        melee_reach: stats.melee_reach,
        movement_speed: stats.movement_speed,
        damage: stats.damage,
        movement_angle: stats.movement_angle,
        casting: false,
        cast_ends_at: 0.0,
        dead: false,
        died_at: 0.0,
        fear_until: 0.0,
        stun_until: stats.stun_until,
        forced_escape_until: 0.0,
        escape: None,
        slow: TimedReduction::default(),
        damage_reduction: TimedReduction::default(), whirlwind_until: 0.0,
    }
}

/// Current actor snapshot at the later deferred ability-dispatch stage.
#[derive(Clone, Copy, Debug)]
pub struct AbilityActor {
    pub actor: Actor,
    pub enraged: bool,
}

pub fn effective_ability_damage(actor: AbilityActor, now: f32) -> f32 {
    let damage=actor.actor.damage_reduction.apply(actor.actor.damage,now);
    if actor.enraged { damage * 1.4 } else { damage }
}

/// Look up the actual current actor vector for each deferred request. The
/// engine's frame queue must retain native actor/slot order when combining
/// these boss requests with other actor families' requests.
pub trait DispatchPort: super::abilities::CombatPort {
    fn ability_actor(&self, actor_index: usize) -> Option<AbilityActor>;
    fn player_guid(&self) -> u64;
}

pub fn dispatch_queued(requests: &[QueuedAbility], now: f32, rng: &mut super::NativeRng,
    guid_counter: &mut dyn crate::native_counter::NativeCounter, effects: &mut super::abilities::PendingEffects,
    port: &mut impl DispatchPort, math: &impl Math) -> Result<usize, super::abilities::UnknownAbilityTag> {
    let mut dispatched=0;
    for request in requests {
        // Native queue terminator is tested before actor lookup.
        if request.ability.words[0]==u32::MAX { break; }
        if !super::abilities::queued_action_enabled(&request.ability) { continue; }
        let Some(snapshot)=port.ability_actor(request.actor_index) else { continue };
        if snapshot.actor.dead { continue; }
        let context=super::abilities::CombatContext {
            source_guid:snapshot.actor.guid,
            player_guid:port.player_guid(),
            now,
            source:snapshot.actor.movement.position_at(now),
            player:port.player_position(),
            effective_damage:effective_ability_damage(snapshot,now),
        };
        super::abilities::dispatch_live(&request.ability,context,rng,guid_counter,effects,port,math)?;
        dispatched+=1;
    }
    Ok(dispatched)
}
