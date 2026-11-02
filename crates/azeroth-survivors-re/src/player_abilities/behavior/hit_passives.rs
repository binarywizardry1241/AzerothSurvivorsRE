//! Current class-special tail of1454c2eb0, after the shared damage/death arm.
//! Native source/evidence: player-hit-passives-0.97.2.md. Required ports bind
//! the actual actor collection, attribution, packet and recursive-hit owners.

use super::{execution::{self, ProjectilePort}, min_preserving_original_nan,
    passive_tick::{self, BloodrageState, FaerieMark, PassiveTickState, Redemption, SealFateState, SpecialTarget}, periodic::area_radius,
    totem_passives::{self, MultiHit, PassivePort, TalentEffect},
    unit24, RuntimeInstance};
use crate::{bosses::abilities::{CastTarget, SpellCast}, enemies::{ai::{Actor, Movement}, NativeRng, Position},
    player_abilities::{damage::{base_interval, effective_power, PowerContext}, native_max, native_min}};

/// Native Game+0x111 is a four-way source-context discriminant. Only the
/// passive value3 has a recovered semantic name here;0..2 remain explicit.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
#[repr(u8)]
pub enum SourceKind { Native0 = 0, Native1 = 1, Native2 = 2, Passive = 3 }

#[derive(Clone, Copy, Debug)]
pub struct HitInput {
    pub victim_guid: u64,
    /// Interpolated victim position captured by the shared hit prefix, before
    /// death processing can remove or otherwise mutate the original actor.
    pub position: Position,
    /// Supplied cast/impact power, before this victim's damage multiplier.
    pub raw_power: f32,
    pub remaining_health: f32,
    pub spell_id: u32,
    pub critical: bool,
}

/// Snapshot at1454c4d98..4df5, not inferred conventional hit/kill categories.
#[derive(Clone, Copy, Debug)]
pub struct HitGates {
    pub source: SourceKind,
    /// Native Game+0x104 must equal0 for the normal-source path.
    pub native_104: u32,
    /// Native Game+0x40 is an enum tag stored as a full64-bit word.
    pub native_40: u64,
    pub native_7ec: bool,
    /// Native Game+0x30 is read only by source1's death qualification.
    pub native_30: bool,
}

impl HitGates {
    pub fn permits_normal_source(self) -> bool {
        self.native_104 == 0 && self.native_40 == 0 && !self.native_7ec
    }

    /// PE jump table1469acd94; a positive/NaN remaining HP never qualifies.
    pub fn qualifies_death(self, remaining_health: f32) -> bool {
        if !(remaining_health <= 0.0) { return false; }
        match self.source {
            SourceKind::Native0 => self.permits_normal_source(),
            SourceKind::Native1 => !self.native_30,
            SourceKind::Native2 => true,
            SourceKind::Passive => false,
        }
    }
}

/// Native recursive calls set source-kind3, zero only the low64-bit enum
/// tags at Game+32/+64, and restore all original words after EACH hit.
/// The adapter must also pass the final native bool argument as false.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PassiveHit {
    pub target_guid: u64,
    pub spell_id: u32,
    pub school: u8,
    pub damage: f32,
    pub critical: bool,
}

/// Native actor+144 optional metadata supplies its+36 word to1454d5440;
/// actor+264 supplies the float. These are kept lossless, not guessed from
/// ordinary WoW creature/model defaults.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct RestoredAppearance { pub metadata_word_36: u32, pub actor_float_264: f32 }

/// The source mutates resource counters itself. World calls below have no
/// defaults: a run adapter must bind the actual recovered native owners.
pub trait HitPassivePort<'a>: PassivePort {
    fn learned(&self) -> &[RuntimeInstance<'a>];
    /// Disjoint actual run fields, needed by the shared begin-passive owner.
    fn learned_and_state_mut(&mut self) -> (&mut [RuntimeInstance<'a>], &mut PassiveTickState);
    fn now(&self) -> f32;
    fn player_guid(&self) -> u64;
    fn gates(&self) -> HitGates;
    fn power_context(&self) -> PowerContext;
    fn global_area(&self) -> f32;
    fn global_target_bonus(&self) -> u32;
    fn global_cooldown(&self) -> f32;
    fn talent_effects(&self) -> &[TalentEffect<'a>];
    fn passive_state(&self) -> &PassiveTickState;
    fn passive_state_mut(&mut self) -> &mut PassiveTickState;
    fn actor(&self, guid: u64) -> Option<&Actor>;
    fn actor_mut(&mut self, guid: u64) -> Option<&mut Actor>;
    fn actor_and_control_mut(&mut self, guid: u64)
        -> Option<(&mut Actor, &mut super::state::ControlWindow)>;
    /// Called only after the corresponding actor lookup succeeded.
    fn actor_maximum_health(&self, guid: u64) -> f32;
    fn restored_appearance(&self, guid: u64) -> Option<RestoredAppearance>;
    fn restore_appearance(&mut self, guid: u64, appearance: RestoredAppearance);
    /// Same1454d5440 packet/field owner with literal model856,scale1 when
    /// Polymorph is installed, or metadata-supplied values on restoration.
    fn set_polymorph_appearance(&mut self, guid: u64, model: u32, scale: f32);
    /// Native1454d13a0's actual aura update. Installation/removal use118.
    fn actor_aura(&mut self, guid: u64, spell_id: u32, present: bool);
    /// Supplemental native actor+64/+96/+344 fields used by the shared
    /// special-target predicates, in the current actor collection's order.
    fn special_targets(&self) -> Vec<SpecialTarget>;
    /// Actual1454627f0 terrain sample. None retains the interpolated Z.
    fn polymorph_height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn movement_counter_mut(&mut self) -> &mut u32;
    /// Packet1454451b0 using the already-incremented Game+0x908 serial.
    fn stopped_movement(&mut self, guid: u64, position: Position, serial: u32);
    /// Delegate to the corresponding concrete passive_tick::publish_* with
    /// THIS state/world and the SAME RNG; those helpers own bursts, counters
    /// and resource-bar updates. These are adapter bridges, not new behavior.
    fn publish_bloodrage(&mut self, rng: &mut NativeRng);
    fn publish_seal_fate(&mut self, rng: &mut NativeRng);
    fn publish_soul_fire(&mut self, rng: &mut NativeRng);
    /// Native Game+0x7e4, read at the passive-source death branch.
    fn native_7e4(&self) -> u32;
}

fn learned<'a>(port: &impl HitPassivePort<'a>, key: &str) -> Option<RuntimeInstance<'a>> {
    port.learned().iter().find(|i| i.definition.key == key).copied()
}

fn start_passive<'a>(instance: &RuntimeInstance<'a>, port: &mut impl HitPassivePort<'a>) {
    let now = port.now();
    let cooldown = port.global_cooldown();
    let player_guid = port.player_guid();
    let (learned, state) = port.learned_and_state_mut();
    let action = totem_passives::begin_passive(instance, now, cooldown, player_guid,
        learned, &mut state.deadlines);
    if let Some(action) = action { port.emit_passive_started(action); }
}

///1454c4fff..50a2. Even an empty bank publishes the resource state and
/// stamps last_gain_at; this is not conditional on a positive amount gained.
pub fn gain_bloodrage(state: &mut BloodrageState, now: f32) {
    let amount = native_max(native_min(state.bank, 2.0), 0.0);
    state.bank -= amount;
    state.pool = native_min(state.pool + amount, 100.0);
    state.last_gain_at = now;
}

///1454c50bb..51e5. Fractional bank credit is retained. The saturating float
/// conversion occurs before native wrapping addition and the five-point cap.
pub fn gain_seal_fate(state: &mut SealFateState, critical: bool) {
    let amount = native_max(native_min(state.bank.floor(), if critical { 2.0 } else { 1.0 }), 0.0);
    state.bank -= amount;
    state.points = state.points.wrapping_add(amount as u32).min(5);
}

/// Only the first matching native16-byte mark row supplies the charge.
///1454c521b's ja skips ordered values below1; an unordered charge passes.
pub fn consume_faerie_charge(marks: &mut [FaerieMark], guid: u64) -> bool {
    let Some(mark) = marks.iter_mut().find(|mark| mark.guid == guid) else { return false; };
    if mark.charges < 1.0 { return false; }
    mark.charges += -1.0;
    true
}

fn visual(source: u64, spell_id: u32, targets: &[u64], unit_target: bool,
          port: &mut impl ProjectilePort) {
    port.cast_spell(SpellCast { source_guid: source, spell_id,
        target: if unit_target { CastTarget::Unit(targets[0]) } else { CastTarget::None },
        hit_targets: targets.to_vec() });
}

fn passive_hit(instance: &RuntimeInstance<'_>, target: u64, damage: f32, critical: bool) -> PassiveHit {
    PassiveHit { target_guid: target, spell_id: instance.definition.spell_id,
        school: instance.definition.school, damage, critical }
}

///1454c4e78..4fd9 and5687..5954. Return value retains original membership,
/// even when this hit removes the victim from the Polymorph collection.
fn polymorph<'a>(hit: HitInput, gates: HitGates, rng: &mut NativeRng,
    port: &mut impl HitPassivePort<'a>,
) -> bool {
    if !port.passive_state().polymorph_guids.contains(&hit.victim_guid) { return false; }
    if (gates.source as u8) < 2 && gates.permits_normal_source() {
        let now = port.now();
        let Some(actor) = port.actor(hit.victim_guid) else { return true; };
        let center = actor.movement.position_at(now);
        let maximum_health = port.actor_maximum_health(hit.victim_guid);
        passive_tick::remove_polymorph(&mut port.passive_state_mut().polymorph_guids, hit.victim_guid);
        let live = if let Some(actor) = port.actor_mut(hit.victim_guid) {
            actor.fear_until = 0.0; // native+320
            actor.next_movement_at = now; // native+300
            !actor.dead
        } else { false };
        if live {
            if let Some(appearance) = port.restored_appearance(hit.victim_guid) {
                port.restore_appearance(hit.victim_guid, appearance);
            }
            port.actor_aura(hit.victim_guid, 118, false);
        }
        if let Some(instance) = learned(port, "polymorph") {
            let power_context = port.power_context();
            let radius = area_radius(&instance, port.global_area());
            let targets = execution::targets_in_radius(&port.actors(), now, center, radius, &[]);
            visual(hit.victim_guid, 1449, &targets, false, port);
            let raw_power = min_preserving_original_nan(maximum_health * 0.15,
                effective_power(&instance, &power_context));
            let effects = port.talent_effects().to_vec();
            let request = MultiHit { now, player_guid: port.player_guid(), source_guid: hit.victim_guid,
                spell_id: 1449, targets: &targets, raw_power };
            totem_passives::multi_hit(&instance, request, &effects, rng, port);
        }
    } else if hit.remaining_health <= 0.0 {
        passive_tick::remove_polymorph(&mut port.passive_state_mut().polymorph_guids, hit.victim_guid);
    }
    true
}

///1454c51eb..5664 plus622b..639d. Consume the charge before looking for a
/// learned Faerie Fire instance or a still-present victim. Both hit passes
/// use the same first-two query results; only the second rechecks live state.
fn faerie_hit<'a>(hit: HitInput, rng: &mut NativeRng, port: &mut impl HitPassivePort<'a>) {
    if !consume_faerie_charge(&mut port.passive_state_mut().faerie_marks, hit.victim_guid) { return; }
    let Some(instance) = learned(port, "faerie_fire") else { return; };
    let Some(actor) = port.actor(hit.victim_guid) else { return; };
    let center = actor.movement.position_at(port.now());
    let power_context = port.power_context();
    let radius = area_radius(&instance, port.global_area());
    let mut targets = execution::targets_in_radius(&port.actors(), port.now(), center, radius, &[hit.victim_guid]);
    targets.truncate(2);
    let factor = native_min((instance.power_multiplier * instance.talent_power_multiplier).sqrt()
        * 0.8, 1.2);
    let power = min_preserving_original_nan(factor * hit.raw_power,
        effective_power(&instance, &power_context));
    for &target in &targets {
        visual(hit.victim_guid, 8921, &[target], true, port);
        totem_passives::resolve_passive_hit(passive_hit(&instance, target, power, false), rng, port);
    }
    let mut repeat = -0.0_f32;
    for effect in port.talent_effects() {
        if effect.tag == 13 && effect.key == Some(instance.definition.key) { repeat += effect.amount; }
    }
    if repeat > 0.0 {
        let damage = repeat * power;
        for &target in &targets {
            if !port.actor(target).is_some_and(|actor| !actor.dead) { continue; }
            visual(hit.victim_guid, 8921, &[target], true, port);
            totem_passives::resolve_passive_hit(passive_hit(&instance, target, damage, false), rng, port);
        }
    }
}

fn hunter_death<'a>(hit: HitInput, rng: &mut NativeRng, port: &mut impl HitPassivePort<'a>) {
    if hit.victim_guid == 0 || port.passive_state().hunters_mark.guid != Some(hit.victim_guid) { return; }
    let now = port.now();
    let state = &mut port.passive_state_mut().hunters_mark;
    state.guid = None;
    state.reacquire_at = now + 1.0;
    let Some(instance) = learned(port, "hunters_mark") else { return; };
    if !(now >= port.passive_state().deadlines.get(instance.definition.key)) { return; }
    start_passive(&instance, port);
    let power_context = port.power_context();
    let radius = area_radius(&instance, port.global_area());
    let targets = execution::targets_in_radius(&port.actors(), now, hit.position, radius, &[hit.victim_guid]);
    // Native visual is Arcane Explosion1449, while actual hits are attributed
    // to the Hunter's Mark definition's spell1130 and school6.
    visual(hit.victim_guid, 1449, &targets, false, port);
    let power = effective_power(&instance, &power_context);
    for target in targets {
        let roll = unit24(rng);
        let critical = port.critical();
        let crit = critical.chance > roll;
        let damage = if crit { critical.multiplier * power } else { power };
        totem_passives::resolve_passive_hit(passive_hit(&instance, target, damage, crit), rng, port);
    }
}

///1454c5f24..5f58. This particular maintenance cap is at most3, unlike the
/// uncapped ordinary target count used by most active spells.
pub fn faerie_capacity(instance: &RuntimeInstance<'_>, global_bonus: u32) -> u32 {
    if instance.definition.targets == 0 { return 1; }
    instance.target_bonus.wrapping_add(instance.talent_target_bonus)
        .wrapping_add(global_bonus).wrapping_add(instance.definition.targets).min(3).max(1)
}

fn faerie_death<'a>(hit: HitInput, port: &mut impl HitPassivePort<'a>) {
    if !port.passive_state().faerie_marks.iter().any(|mark| mark.guid == hit.victim_guid) { return; }
    passive_tick::remove_faerie(&mut port.passive_state_mut().faerie_marks, hit.victim_guid);
    let Some(instance) = learned(port, "faerie_fire") else { return; };
    if port.passive_state().faerie_marks.len() >= faerie_capacity(&instance, port.global_target_bonus()) as usize { return; }
    let targets = passive_tick::faerie_candidates(&port.special_targets(),
        &port.passive_state().faerie_marks, port.now(), hit.position, 12.0);
    if let Some(target) = targets.first().copied() {
        passive_tick::add_faerie(&mut port.passive_state_mut().faerie_marks, target);
        visual(port.player_guid(), 770, &[target], true, port);
        port.actor_aura(target, 770, true);
    }
}

///1454d68b0. This credits Soul Fire on qualified deaths rather than on
/// ordinary hits. Its short credit gate is the passive interval divided by5.
/// Native comparison skips only gain_at>now, so an unordered deadline passes.
pub fn gain_soul_fire(instance: &RuntimeInstance<'_>, now: f32, global_cooldown: f32,
    state: &mut PassiveTickState,
) -> bool {
    if state.soul_fire_points > 4 || state.soul_fire_gain_at > now { return false; }
    let interval = totem_passives::passive_interval(instance, global_cooldown);
    state.soul_fire_points = state.soul_fire_points.wrapping_add(1);
    state.soul_fire_gain_at = now + interval / 5.0;
    true
}

///1454d5230, in native float operation order. Unlike begin_passive, this
/// probability uses neither a per-key interval minimum nor an effect floor.
pub fn redemption_chance(instance: &RuntimeInstance<'_>, global_cooldown: f32) -> f32 {
    let numerator = (0.1 * instance.definition.base_cooldown) * 1.4;
    native_min(numerator / base_interval(instance, global_cooldown), 0.2)
        * instance.effect_multiplier
}

/// First matching Redemption, at most four queued rows. A successful row's
/// time is max(now,previous queue slot), then the NEXT slot advances by.5s.
/// The hit's native reason/chain word1 or2 is preserved for the tick consumer.
pub fn queue_redemption(instance: &RuntimeInstance<'_>, hit: HitInput, reason: u32,
    now: f32, global_cooldown: f32, rng: &mut NativeRng, state: &mut PassiveTickState,
) -> bool {
    if state.redemptions.len() > 3 { return false; }
    let roll = unit24(rng);
    if roll >= redemption_chance(instance, global_cooldown) { return false; }
    let resolves_at = native_max(now, state.redemption_queue_at);
    let resolves_at = if resolves_at.is_nan() { now } else { resolves_at };
    state.redemption_queue_at = resolves_at + 0.5;
    state.redemptions.push(Redemption { source_guid: hit.victim_guid, resolves_at,
        center: hit.position, native_7e4: reason });
    true
}

fn death_procs<'a>(hit: HitInput, reason: u32, rng: &mut NativeRng,
    port: &mut impl HitPassivePort<'a>,
) {
    let now = port.now();
    let cooldown = port.global_cooldown();
    if reason == 1 {
        if let Some(instance) = learned(port, "soul_fire") {
            if gain_soul_fire(&instance, now, cooldown, port.passive_state_mut()) {
                port.publish_soul_fire(rng);
            }
        }
    }
    // Soul Fire's publisher is synchronous; native reloads learned rows and
    // current stats before considering Redemption after that call.
    if let Some(instance) = learned(port, "redemption") {
        let now = port.now();
        let cooldown = port.global_cooldown();
        queue_redemption(&instance, hit, reason, now, cooldown, rng, port.passive_state_mut());
    }
}

///1454d4dc0. The surviving-spell hook is the actual Polymorph producer:
/// ordinary actor only, fewer than3 tracked GUIDs, passive ready, current
/// avoid/fear window expired, then one12% draw. No draw occurs on a failed
/// eligibility gate. All actor state changes occur after begin_passive.
pub fn try_apply_polymorph<'a>(guid: u64, rng: &mut NativeRng,
    port: &mut impl HitPassivePort<'a>,
) -> bool {
    let Some(instance) = learned(port, "polymorph") else { return false; };
    if port.passive_state().polymorph_guids.len() > 2 { return false; }
    let now = port.now();
    if !(now >= port.passive_state().deadlines.get(instance.definition.key)) { return false; }
    let views = port.special_targets();
    let Some(view) = views.iter().find(|view| view.target.actor.guid == guid) else { return false; };
    if view.target.actor.dead || view.target.has_metadata || view.native_64_present
        || !(now >= view.target.actor.fear_until) { return false; }
    if unit24(rng) >= 0.12 { return false; }
    start_passive(&instance, port);
    // Current native c82dc0 starts the passive before shared admission. An
    // immune/sixth application consumes that proc but publishes no sheep/aura.
    let center = if let Some((actor, control)) = port.actor_and_control_mut(guid) {
        let Some(duration) = control.admit(actor, now, 10.0) else { return false; };
        control.polymorph_duration = duration;
        actor.fear_until = now + duration;
        actor.casting = false;
        actor.next_movement_at = now + 0.4;
        Some(actor.movement.position_at(now))
    } else { return false; };
    if let Some(mut center) = center {
        if let Some(height) = port.polymorph_height([center.x, center.y]) { center.z = height; }
        if let Some(actor) = port.actor_mut(guid) {
            actor.movement = Movement { from: center, to: center, started_at: now, duration: 0.0 };
        }
        let serial = port.movement_counter_mut();
        *serial = serial.wrapping_add(1);
        let serial = *serial;
        port.stopped_movement(guid, center, serial);
    }
    // After successful admission, the GUID/model/aura tail still runs if
    // later position sampling can no longer re-find the actor.
    port.passive_state_mut().polymorph_guids.push(guid);
    port.set_polymorph_appearance(guid, 856, 1.0);
    visual(port.player_guid(), instance.definition.spell_id, &[guid], true, port);
    port.actor_aura(guid, instance.definition.spell_id, true);
    true
}

/// Invoke exactly once after the shared owner has applied hit/death work and
/// before its final source-context/talent tail1454c5fc8. This function does
/// not subtract HP, award loot or reproduce the rest of the death handler.
pub fn after_damage<'a>(hit: HitInput, rng: &mut NativeRng, port: &mut impl HitPassivePort<'a>) {
    if !port.learned().iter().any(|i| i.definition.kind == 11) { return; }
    let gates = port.gates();
    let normal = gates.permits_normal_source();
    let qualified = gates.qualifies_death(hit.remaining_health);
    let was_polymorphed = polymorph(hit, gates, rng, port);
    if gates.source == SourceKind::Native0 && normal {
        if learned(port, "bloodrage").is_some() {
            let now = port.now();
            gain_bloodrage(&mut port.passive_state_mut().bloodrage, now);
            port.publish_bloodrage(rng);
        }
        if learned(port, "seal_fate").is_some() {
            gain_seal_fate(&mut port.passive_state_mut().seal_fate, hit.critical);
            port.publish_seal_fate(rng);
        }
        faerie_hit(hit, rng, port);
        if !(hit.remaining_health <= 0.0) && hit.spell_id != 0 && !was_polymorphed {
            try_apply_polymorph(hit.victim_guid, rng, port);
        }
    }
    if qualified {
        death_procs(hit, 1, rng, port);
    } else if hit.remaining_health <= 0.0 && gates.source == SourceKind::Passive && port.native_7e4() == 1 {
        death_procs(hit, 2, rng, port);
    }
    if hit.remaining_health <= 0.0 {
        hunter_death(hit, rng, port);
        faerie_death(hit, port);
    }
}
