//! Live ports for the already recovered class-special hit and tick owners.
//!
//! The source modules own ordering, proc gates, resource arithmetic, targeting,
//! recursive attribution and RNG draws. This adapter supplies the actual run
//! actors and queues; it does not recalculate those algorithms.

use super::*;
use azeroth_survivors_re::player_abilities::behavior::{
    hit_passives::{self, HitGates, HitPassivePort, RestoredAppearance, SourceKind},
    passive_tick::{
        self, GearBounce, LightwellObject, PassiveTickState, ResourceBar, SpecialTarget,
        TickContext, TickPort,
    },
    totem_passives::{self, TalentEffect},
};

/// The caller lends the same learned rows/state to every synchronous hit.
/// Object creation only occurs in `passive_tick::tick`; its caller supplies
/// the shared run counter. Hit/cast wrappers leave `object_counter` absent,
/// so dispatch can borrow that same counter for its own summon construction.
pub(super) struct PassiveCombat<'p, 'c, 'd, W> {
    pub core: &'p mut CombatAdapter<'c, W>,
    pub learned: &'p mut [RuntimeInstance<'d>],
    pub state: &'p mut PassiveTickState,
    pub context: TickContext,
    pub cast_context: CastContext,
    pub first_periodic: bool,
    pub native_7e4: &'p mut u32,
    /// Current source-one owner discriminant at Game+30 (actor DoT owner).
    pub native_30: bool,
    pub object_counter: Option<&'p mut dyn NativeCounter>,
}

impl<W: RunWorld> PassiveCombat<'_, '_, '_, W> {
    /// The shared prefix completes primary damage, death, loot and guardian
    /// rewards before the class-special tail observes its captured hit input.
    pub(super) fn hit(&mut self, hit: PendingHit, rng: &mut NativeRng) {
        self.resolve_hit(hit, rng, None);
    }
    pub(super) fn resolve_hit(&mut self, hit: PendingHit, rng: &mut NativeRng,
        vitals: Option<&mut Vitals>) -> Option<HitInput> {
        let original = self.core.attribution;
        let original_pet_entry = self.core.generic.meter_pet_entry;
        let original_attack = self.core.generic.meter_attack;
        if let Some(kind) = hit.context.captured_source_kind {
            self.core.attribution.source_kind = kind;
            self.core.generic.meter_pet_entry = hit.context.pet_entry;
            self.core.generic.meter_attack = hit.context.meter_attack;
        } else if hit.context.meter_attack.is_some() {
            self.core.generic.meter_attack = hit.context.meter_attack;
        }
        self.core.attribution.source_words = hit.context.source_words;
        self.core.attribution.cast_words = hit.context.cast_words;
        let input = self.core.hit(hit, rng, vitals);
        if let Some(input) = input {
            hit_passives::after_damage(input, rng, self);
        }
        self.core.attribution = original;
        self.core.generic.meter_pet_entry = original_pet_entry;
        self.core.generic.meter_attack = original_attack;
        input
    }

    fn actor(&self, guid: u64) -> Option<&Actor> {
        self.core
            .actors
            .iter()
            .find(|row| row.guid == guid)
            .map(|row| &row.actor)
            .or_else(|| {
                self.core
                    .bosses
                    .iter()
                    .find(|row| row.guid == guid)
                    .map(|row| &row.actor)
            })
            .or_else(|| {
                self.core
                    .boss_state
                    .wards
                    .actors
                    .iter()
                    .find(|row| row.guid == guid)
                    .map(|row| &row.actor)
            })
    }

    fn actor_mut(&mut self, guid: u64) -> Option<&mut Actor> {
        if let Some(row) = self.core.actors.iter_mut().find(|row| row.guid == guid) {
            return Some(&mut row.actor);
        }
        self.core
            .bosses
            .iter_mut()
            .find(|row| row.guid == guid)
            .map(|row| &mut row.actor)
            .or_else(|| {
                self.core
                    .boss_state
                    .wards
                    .actors
                    .iter_mut()
                    .find(|row| row.guid == guid)
                    .map(|row| &mut row.actor)
            })
    }

    fn special_targets(&self) -> Vec<SpecialTarget> {
        actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        )
        .into_iter()
        .map(|target| {
            // Native actor+64 is the guardian optional lane. The recovered
            // guardian fixtures bind its awake flag to actor+96 exactly.
            let awake = self.core.guardian_state.passive_awake(target.actor.guid);
            let native_flag_344 = self
                .core
                .actors
                .iter()
                .find(|row| row.guid == target.actor.guid)
                .map_or(0, |row| row.definition.flag_4c);
            SpecialTarget {
                target,
                native_64_present: awake.is_some(),
                native_96: awake.unwrap_or(0),
                native_flag_344,
            }
        })
        .collect()
    }

    fn aura(&mut self, guid: u64, spell_id: u32, present: bool) {
        self.core.actor_aura(guid, spell_id, present);
    }

    /// Current ordinary/guardian creators retain definition+24 and scale in
    /// Actor+90/+108. Primary boss records have no ordinary definition pointer.
    fn original_appearance(&self, guid: u64) -> Option<RestoredAppearance> {
        self.core
            .actors
            .iter()
            .find(|row| row.guid == guid)
            .map(|row| RestoredAppearance {
                metadata_word_36: row.definition.model_id,
                actor_float_264: self
                    .core
                    .guardian_state
                    .render_scale(guid)
                    .unwrap_or(row.definition.scale),
            })
    }

    fn restore_appearance(&mut self, guid: u64, appearance: RestoredAppearance) {
        self.core.generic.appearance_overrides.remove(&guid);
        self.core.events.push(RunEvent::RestoreAppearance {
            target: guid,
            appearance,
        });
    }

    fn passive_started(&mut self, started: PassiveStarted) {
        self.core.events.push(RunEvent::PassiveStarted(started));
    }
}

impl<W: RunWorld> ProjectilePort for PassiveCombat<'_, '_, '_, W> {
    fn cast_spell(&mut self, cast: SpellCast) {
        self.core.cast_spell(cast);
    }
}

impl<W: RunWorld> CastPort for PassiveCombat<'_, '_, '_, W> {
    fn has_special_demons(&self) -> bool {
        self.core.special_demons != 0
    }
    fn begin_cast(&mut self, spell_id: u32) {
        self.core.generic.begin_cast(spell_id);
    }
    fn critical(&self) -> Critical {
        CastPort::critical(self.core)
    }
    fn primary_height(&mut self, xy: [f32; 2]) -> Option<f32> {
        CastPort::primary_height(self.core, xy)
    }
    fn secondary_height(&mut self, xy: [f32; 2]) -> Option<f32> {
        CastPort::secondary_height(self.core, xy)
    }
    fn fallback_height(&self) -> f32 {
        CastPort::fallback_height(self.core)
    }
    fn target_health(&self, guid: u64) -> Option<(f32, f32)> {
        self.core.target_health(guid)
    }
    fn direct_hit(&mut self, hit: PendingHit, rng: &mut NativeRng) {
        self.hit(hit, rng);
    }
    fn direct_hit_with_execution(
        &mut self,
        hit: PendingHit,
        rng: &mut NativeRng,
        state: &mut ExecutionState<'_>,
        counter: &mut dyn NativeCounter,
    ) {
        self.hit_with_execution(hit, rng, state, counter);
    }
    fn heal(&mut self, spell: u32, amount: f32) {
        self.core.heal(spell, amount);
    }
    fn party_needs_healing(&self) -> bool {
        self.core.party_needs_healing()
    }
    fn share_healing(&mut self, healing: buffs::SharedHealing) {
        self.core.share_healing(healing);
    }
    fn share_aura(&mut self, aura: buffs::SharedAura) {
        self.core.share_aura(aura);
    }
    fn create_ground(&mut self, object: GroundObject) {
        self.core.create_ground(object);
    }
    fn ground_follows(&self, definition: &AbilityDefinition) -> bool {
        self.core.ground_follows(definition)
    }
    fn move_ground(&mut self, guid: u64, position: Position) {
        self.core.move_ground(guid, position);
    }
    fn create_totem(&mut self, object: SummonedObject) {
        self.core.create_totem(object);
    }
    fn expire_totem(
        &mut self,
        totem: totems::Totem<'_>,
        context: CastContext,
        rng: &mut NativeRng,
    ) {
        totem_passives::on_expiry_live(&totem, context, rng, self);
        if totem.guid != 0 {
            CastPort::remove_object(self.core, totem.guid);
        }
    }
    fn remove_object(&mut self, guid: u64) {
        CastPort::remove_object(self.core, guid);
    }
    fn finish_buff(&mut self, spell: u32, actions: BuffActions) {
        self.core.finish_buff(spell, actions);
    }
    fn finish_buff_with_execution(
        &mut self,
        spell: u32,
        actions: BuffActions,
        state: &mut ExecutionState<'_>,
    ) {
        self.core.finish_buff(spell, actions);
        self.core.flush_vitals(&mut state.vitals);
        if actions.aura_changed {
            self.core.publish_player_auras(state, self.learned);
        }
    }
}

impl<W: RunWorld> PassivePort for PassiveCombat<'_, '_, '_, W> {
    fn heroic_rank(&self) -> u8 { self.core.rules.heroic_rank }
    fn targets(&self) -> Vec<Target> {
        actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        )
    }
    fn attribution(&self) -> PassiveAttribution {
        self.core.attribution
    }
    fn set_attribution(&mut self, attribution: PassiveAttribution) {
        self.core.attribution = attribution;
    }
    fn passive_hit(&mut self, hit: PassiveHit, rng: &mut NativeRng) {
        self.hit(
            PendingHit {
                context: HitContext {
                    hostile_origin: None,
                    captured_source_kind: None,
                    pet_entry: None,
                    meter_attack: None,
                    demon_spell_impact: None,
                    source_words: self.core.attribution.source_words,
                    cast_words: self.core.attribution.cast_words,
                    overcast: false,
                    proc_source: self.core.generic.source,
                    suppress_damage_log: false,
                },
                target_guid: hit.target_guid,
                source_guid: self.context.player_guid,
                effect: player_abilities::StatusEffect {
                    tag: 0,
                    value: 0.0,
                    duration: 0.0,
                },
                resolves_at: self.context.now,
                spell_id: hit.spell_id,
                damage: hit.damage,
                critical: hit.critical,
                damages_player: false,
                school: hit.school,
            },
            rng,
        );
    }
    fn emit_passive_started(&mut self, started: PassiveStarted) {
        self.passive_started(started);
    }
    fn emit_healing(&mut self, action: HealingAction) {
        self.core.emit_healing(action);
    }
}

impl<'d, W: RunWorld> HitPassivePort<'d> for PassiveCombat<'_, '_, 'd, W> {
    fn learned(&self) -> &[RuntimeInstance<'d>] {
        self.learned
    }
    fn learned_and_state_mut(&mut self) -> (&mut [RuntimeInstance<'d>], &mut PassiveTickState) {
        (self.learned, self.state)
    }
    fn now(&self) -> f32 {
        self.context.now
    }
    fn player_guid(&self) -> u64 {
        self.context.player_guid
    }
    fn gates(&self) -> HitGates {
        let attribution = self.core.attribution;
        HitGates {
            source: match attribution.source_kind {
                1 => SourceKind::Native1,
                2 => SourceKind::Native2,
                3 => SourceKind::Passive,
                _ => SourceKind::Native0,
            },
            // Generic recursion, freecast provenance, echo and periodic source
            // lanes share the same live hit state as the native gates.
            native_104: self.core.generic.depth,
            native_40: if self.core.generic.source.is_some() {
                1
            } else {
                u64::from(attribution.cast_words[0]) | (u64::from(attribution.cast_words[1]) << 32)
            },
            native_7ec: self.core.extra_cast,
            native_30: self.native_30,
        }
    }
    fn power_context(&self) -> PowerContext {
        self.context.power
    }
    fn global_area(&self) -> f32 {
        self.context.global_area
    }
    fn global_target_bonus(&self) -> u32 {
        self.context.global_target_bonus
    }
    fn global_cooldown(&self) -> f32 {
        self.context.global_cooldown
    }
    fn talent_effects(&self) -> &[TalentEffect<'d>] {
        &self.core.equipped.callbacks
    }
    fn passive_state(&self) -> &PassiveTickState {
        self.state
    }
    fn passive_state_mut(&mut self) -> &mut PassiveTickState {
        self.state
    }
    fn actor(&self, guid: u64) -> Option<&Actor> {
        Self::actor(self, guid)
    }
    fn actor_mut(&mut self, guid: u64) -> Option<&mut Actor> {
        Self::actor_mut(self, guid)
    }
    fn actor_and_control_mut(&mut self, guid: u64)
        -> Option<(&mut Actor, &mut ControlWindow)>
    {
        if let Some(row) = self.core.actors.iter_mut().find(|row| row.guid == guid) {
            Some((&mut row.actor, &mut row.control))
        } else if let Some(row) = self.core.bosses.iter_mut().find(|row| row.guid == guid) {
            Some((&mut row.actor, &mut row.control))
        } else {
            self.core.boss_state.wards.actors.iter_mut().find(|row| row.guid == guid)
                .map(|row| (&mut row.actor, &mut row.control))
        }
    }
    fn actor_maximum_health(&self, guid: u64) -> f32 {
        self.core
            .actors
            .iter()
            .find(|row| row.guid == guid)
            .map(|row| row.maximum_health)
            .or_else(|| {
                self.core
                    .bosses
                    .iter()
                    .find(|row| row.guid == guid)
                    .map(|row| row.maximum_health)
            })
            .unwrap_or(0.0)
    }
    fn restored_appearance(&self, guid: u64) -> Option<RestoredAppearance> {
        self.original_appearance(guid)
    }
    fn restore_appearance(&mut self, guid: u64, appearance: RestoredAppearance) {
        Self::restore_appearance(self, guid, appearance);
    }
    fn set_polymorph_appearance(&mut self, guid: u64, model: u32, scale: f32) {
        self.core
            .generic
            .appearance_overrides
            .insert(guid, (model, scale));
        self.core.events.push(RunEvent::Appearance {
            target: guid,
            model,
            scale,
        });
    }
    fn actor_aura(&mut self, guid: u64, spell: u32, present: bool) {
        self.aura(guid, spell, present);
    }
    fn special_targets(&self) -> Vec<SpecialTarget> {
        Self::special_targets(self)
    }
    fn polymorph_height(&mut self, xy: [f32; 2]) -> Option<f32> {
        self.core.world.height(xy)
    }
    fn movement_counter_mut(&mut self) -> &mut u32 {
        self.core.movement_counter
    }
    fn stopped_movement(&mut self, guid: u64, position: Position, serial: u32) {
        self.core.events.push(RunEvent::StoppedMovement {
            target: guid,
            position,
            serial,
        });
    }
    fn publish_bloodrage(&mut self, rng: &mut NativeRng) {
        passive_tick::publish_bloodrage(rng, self);
    }
    fn publish_seal_fate(&mut self, rng: &mut NativeRng) {
        passive_tick::publish_seal_fate(rng, self);
    }
    fn publish_soul_fire(&mut self, rng: &mut NativeRng) {
        passive_tick::publish_soul_fire(rng, self);
    }
    fn native_7e4(&self) -> u32 {
        *self.native_7e4
    }
}

impl<'d, W: RunWorld> TickPort<'d> for PassiveCombat<'_, '_, 'd, W> {
    fn learned(&self) -> &[RuntimeInstance<'d>] {
        self.learned
    }
    fn context(&self) -> TickContext {
        self.context
    }
    fn state(&self) -> &PassiveTickState {
        self.state
    }
    fn state_mut(&mut self) -> &mut PassiveTickState {
        self.state
    }
    fn special_targets(&self) -> Vec<SpecialTarget> {
        Self::special_targets(self)
    }
    fn critical(&self) -> Critical {
        CastPort::critical(self.core)
    }
    fn learned_and_state_mut(&mut self) -> (&mut [RuntimeInstance<'d>], &mut PassiveTickState) {
        (self.learned, self.state)
    }
    fn emit_passive_started(&mut self, started: PassiveStarted) {
        self.passive_started(started);
    }
    fn hit_in_passive_context(&mut self, hit: PassiveHit, rng: &mut NativeRng) {
        totem_passives::resolve_passive_hit(hit, rng, self);
    }
    fn set_additional_damage_taken(&mut self, guid: u64, amount: f32) {
        if let Some(row) = self.core.actors.iter_mut().find(|row| row.guid == guid) {
            row.additional_damage_taken = amount;
        } else if let Some(row) = self.core.bosses.iter_mut().find(|row| row.guid == guid) {
            row.additional_damage_taken = amount;
        } else if let Some(row) = self
            .core
            .boss_state
            .wards
            .actors
            .iter_mut()
            .find(|row| row.guid == guid)
        {
            row.additional_damage_taken = amount;
        }
    }
    fn aura(&mut self, guid: u64, spell: u32, present: bool) {
        Self::aura(self, guid, spell, present);
    }
    fn actor_mut(&mut self, guid: u64) -> Option<&mut Actor> {
        Self::actor_mut(self, guid)
    }
    fn restored_appearance(&self, guid: u64) -> Option<RestoredAppearance> {
        self.original_appearance(guid)
    }
    fn restore_appearance(&mut self, guid: u64, appearance: RestoredAppearance) {
        Self::restore_appearance(self, guid, appearance);
    }
    fn primary_height(&mut self, xy: [f32; 2]) -> Option<f32> {
        CastPort::primary_height(self.core, xy)
    }
    fn secondary_height(&mut self, xy: [f32; 2]) -> Option<f32> {
        CastPort::secondary_height(self.core, xy)
    }
    fn fallback_height(&self) -> f32 {
        CastPort::fallback_height(self.core)
    }
    fn object_counter_mut(&mut self) -> &mut dyn NativeCounter {
        self.object_counter
            .as_deref_mut()
            .expect("passive tick needs the shared run object counter")
    }
    fn sin(&self, radians: f32) -> f32 {
        radians.sin()
    }
    fn cos(&self, radians: f32) -> f32 {
        radians.cos()
    }
    fn create_lightwell(&mut self, object: LightwellObject) {
        self.core.events.push(RunEvent::Lightwell(object));
    }
    fn remove_object(&mut self, guid: u64) {
        CastPort::remove_object(self.core, guid);
    }
    fn gear_bounce(&self, key: &str) -> Option<GearBounce> {
        self.core.equipped.gear_bounce(key)
    }
    fn native_7e4(&self) -> u32 {
        *self.native_7e4
    }
    fn set_native_7e4(&mut self, value: u32) {
        *self.native_7e4 = value;
    }
    fn publish_resource_bar(&mut self, bar: ResourceBar) {
        self.core.events.push(RunEvent::ResourceBar(bar));
    }
}
