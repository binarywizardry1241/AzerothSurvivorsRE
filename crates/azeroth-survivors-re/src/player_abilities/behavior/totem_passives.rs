//! Current totem expiry/pulse passives and their shared native helpers.
//! Owners:1454a422c..1454a4c10,1454d43d0,1454d49e0,1455321e0.
//! See player-totem-passives-0.97.2.md for SHA-bound evidence and limits.
//! Expiry/begin-passive/multi-hit revalidation: totem-cap-0.105.0.md.

use super::{dispatch::{CastContext, CastPort}, execution, hit_passives::HitPassivePort,
    hit_passives::PassiveHit, min_preserving_original_nan,
    passive_tick::ProcDeadlines, periodic::area_radius, state::Vitals,
    targeting::Target, totems::Totem, unit24, RuntimeInstance};
use crate::{bosses::abilities::{CastTarget, SpellCast},
    enemies::{ai::Actor, NativeRng}, player_abilities::{damage::{base_interval, effective_power},
    native_max, upgrades::passive_minimum_interval}};

/// Ordered native64-byte talent rows. Key is present for the key-bearing
/// variants (including13); tag22 has no ability-key filter.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct TalentEffect<'a> { pub tag: u8, pub amount: f32, pub key: Option<&'a str> }

/// The exact blocks saved around native recursive hits. Only their low64-bit
/// enum tags are cleared; the other payload words remain unchanged.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct PassiveAttribution {
    pub source_kind: u8,             // Game+273
    pub source_words: [u32; 4],       // Game+32..47
    pub cast_words: [u32; 4],         // Game+64..79
}

impl PassiveAttribution {
    fn for_passive(mut self) -> Self {
        self.source_kind = 3;
        self.source_words[0] = 0;
        self.source_words[1] = 0;
        self.cast_words[0] = 0;
        self.cast_words[1] = 0;
        self
    }
}

/// State writes precede both packet intents. The adapter emits the native
///145442f60 cooldown packet first, then opcode0x135's [spell:u32,guid:u64].
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PassiveStarted {
    pub spell_id: u32,
    pub player_guid: u64,
    pub interval: f32,
    pub cooldown_milliseconds: u32,
}

/// The first tag22 row chooses the corresponding40-byte provenance row.
/// Without that row the native meter uses translated"Leech" and the icon
///"Spell_Shadow_LifeDrain02". The adapter copies the actual provenance.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum HealingSource { Talent { index: usize }, Leech }

pub const LEECH_HEALING_NAME_KEY: &str = "Leech";
pub const LEECH_HEALING_ICON: &str = "Spell_Shadow_LifeDrain02";

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct HealingAction {
    pub requested: f32,
    pub actual: f32,
    pub source: HealingSource,
    /// Native skips the meter when0>=actual; unordered actual is retained.
    pub record_in_meter: bool,
    /// These object fields are published even when actual healing is zero.
    pub health_field: u32,           // UNIT_FIELD_HEALTH22
    pub maximum_health_field: u32,   // UNIT_FIELD_MAXHEALTH28
}

/// The source owns all passive gates, arithmetic, target selection, context
/// restoration and state changes. Required ports bind actual actors, the
/// canonical recursive hit/death owner and native packet/meter publication.
pub trait PassivePort: CastPort {
    fn heroic_rank(&self) -> u8 { 0 }
    fn targets(&self) -> Vec<Target>;
    fn actors(&self) -> Vec<Actor> { self.targets().into_iter().map(|target| target.actor).collect() }
    fn attribution(&self) -> PassiveAttribution;
    fn set_attribution(&mut self, attribution: PassiveAttribution);
    /// Resolve synchronously with final native hit flagfalse. Pass the SAME
    /// run RNG into downstream hit/procs before the next helper crit draw.
    fn passive_hit(&mut self, hit: PassiveHit, rng: &mut NativeRng);
    fn emit_passive_started(&mut self, started: PassiveStarted);
    /// Publish the already-applied health state; do not heal a second time.
    fn emit_healing(&mut self, action: HealingAction);
}

pub struct TotemPassiveContext<'a, 'e> {
    pub effects: &'a [TalentEffect<'e>],
    pub global_cooldown: f32,
    pub provenance_count: usize,
    pub deadlines: &'a mut ProcDeadlines,
    pub vitals: &'a mut Vitals,
}

///1454d4a68..4ab3: the key floor is applied AFTER the common.25 floor,
/// then the resulting interval is divided by max(effect_multiplier,.1).
pub fn passive_interval(instance: &RuntimeInstance<'_>, global_cooldown: f32) -> f32 {
    native_max(passive_minimum_interval(instance.definition.key),
        base_interval(instance, global_cooldown)) / native_max(instance.effect_multiplier, 0.1)
}

///1454d49e0: no readiness check is hidden here. The caller decides when a
/// passive triggers; this updates first matching deadline and learned row.
pub fn begin_passive(instance: &RuntimeInstance<'_>, now: f32, global_cooldown: f32,
    player_guid: u64, learned: &mut [RuntimeInstance<'_>], deadlines: &mut ProcDeadlines,
) -> Option<PassiveStarted> {
    let key = instance.definition.key;
    if key == "redemption" || key == "faerie_fire" { return None; }
    let interval = passive_interval(instance, global_cooldown);
    deadlines.set(key, now + interval);
    if let Some(row) = learned.iter_mut().find(|row| row.definition.key == key) {
        row.remaining = interval;
    }
    Some(PassiveStarted { spell_id: instance.definition.spell_id, player_guid, interval,
        cooldown_milliseconds: (interval * 1000.0) as u32 })
}

#[derive(Clone, Copy, Debug)]
pub struct MultiHit<'a> {
    pub now: f32,
    pub player_guid: u64,
    pub source_guid: u64,
    /// Visual-only ID. Actual hits use the instance definition's spell ID.
    pub spell_id: u32,
    pub targets: &'a [u64],
    pub raw_power: f32,
}

fn hit_pass(instance: &RuntimeInstance<'_>, targets: &[u64], power: f32,
    rng: &mut NativeRng, port: &mut impl PassivePort,
) {
    if targets.is_empty() { return; }
    let saved = port.attribution();
    for &target_guid in targets {
        let roll = unit24(rng);
        let stats = port.critical();
        let critical = stats.chance > roll;
        let damage = if critical { stats.multiplier * power } else { power };
        resolve_with_attribution(PassiveHit { target_guid, spell_id: instance.definition.spell_id,
            school: instance.definition.school, damage, critical }, saved, rng, port);
    }
}

fn resolve_with_attribution(hit: PassiveHit, saved: PassiveAttribution,
    rng: &mut NativeRng, port: &mut impl PassivePort,
) {
    port.set_attribution(saved.for_passive());
    port.passive_hit(hit, rng);
    port.set_attribution(saved);
}

/// Shared single-hit form of the native source-kind3 context wrapper. This
/// does not roll crit: Hunter/Faerie and other callers own that exact choice.
/// Multi-hit retains its original once-per-pass snapshot through the private
/// helper above; standalone hits snapshot the actual context at this call.
pub fn resolve_passive_hit(hit: PassiveHit, rng: &mut NativeRng, port: &mut impl PassivePort) {
    let saved = port.attribution();
    resolve_with_attribution(hit, saved, rng, port);
}

///1454d43d0: primary hits first, then the current matching variant13 sum;
///1455321e0 filters the ORIGINAL GUIDs for survivors without changing order.
/// Every recursive hit has an independent crit draw, interleaved with procs.
/// `effects` is the run's ordered, immutable equipped-talent set, not a cached
/// magnitude. If a world permits talents to mutate inside a hit, that adapter
/// must resample the set at this boundary before allowing a second pass.
pub fn multi_hit(instance: &RuntimeInstance<'_>, request: MultiHit<'_>,
    effects: &[TalentEffect<'_>], rng: &mut NativeRng, port: &mut impl PassivePort,
) {
    hit_pass(instance, request.targets, request.raw_power, rng, port);
    let mut magnitude = -0.0_f32;
    for effect in effects {
        if effect.tag == 13 && effect.key == Some(instance.definition.key) {
            magnitude += effect.amount;
        }
    }
    //1454d45c1 compares zero against the sum: NaN enters the second pass.
    if magnitude <= 0.0 { return; }
    let actors = port.actors();
    let survivors = request.targets.iter().copied().filter(|guid|
        actors.iter().any(|actor| actor.guid == *guid && !actor.dead)).collect::<Vec<_>>();
    if survivors.is_empty() { return; }
    if request.source_guid == request.player_guid ||
        actors.iter().any(|actor| actor.guid == request.source_guid) {
        port.cast_spell(SpellCast { source_guid: request.source_guid, spell_id: request.spell_id,
            target: CastTarget::None, hit_targets: survivors.clone() });
    }
    hit_pass(instance, &survivors, request.raw_power * magnitude, rng, port);
}

/// Selected0.105.0 145949470 is shared by ordinary deadline and forced-cap
/// expiry. An expired totem causes a Call of Flame explosion when
/// learned, ready AND at least one live target is in its area. There is no
/// totem re-summon. Empty explosions do not consume the passive deadline.
pub fn on_expiry(totem: &Totem<'_>, context: CastContext,
    learned: &mut [RuntimeInstance<'_>], passives: &mut TotemPassiveContext<'_, '_>,
    rng: &mut NativeRng, port: &mut impl PassivePort,
) -> bool {
    let Some((instance, targets)) = expiry_targets(totem, context, learned,
        passives.deadlines, &port.actors()) else { return false; };
    if let Some(started) = begin_passive(&instance, context.now, passives.global_cooldown,
        context.player_guid, learned, passives.deadlines) { port.emit_passive_started(started); }
    expiry_hits(totem, context, instance, targets, passives.effects, rng, port);
    true
}

fn expiry_targets<'a>(totem: &Totem<'_>, context: CastContext,
    learned: &[RuntimeInstance<'a>], deadlines: &ProcDeadlines, actors: &[Actor],
) -> Option<(RuntimeInstance<'a>, Vec<u64>)> {
    let instance = learned.iter().find(|row| row.definition.key == "call_of_flame").copied()?;
    if !(context.now >= deadlines.get(instance.definition.key)) { return None; }
    let targets = execution::targets_in_radius(actors, context.now, totem.position,
        area_radius(&instance, context.global_area), &[]);
    if targets.is_empty() { return None; }
    Some((instance, targets))
}

fn expiry_hits(totem: &Totem<'_>, context: CastContext, instance: RuntimeInstance<'_>,
    targets: Vec<u64>, effects: &[TalentEffect<'_>], rng: &mut NativeRng,
    port: &mut impl PassivePort,
) {
    port.cast_spell(SpellCast { source_guid: totem.guid, spell_id: 8349,
        target: CastTarget::None, hit_targets: targets.clone() });
    let raw_power = effective_power(&instance, &context.power);
    multi_hit(&instance, MultiHit { now: context.now, player_guid: context.player_guid,
        source_guid: totem.guid, spell_id: 8349, targets: &targets, raw_power },
        effects, rng, port);
}

/// The cast-time port already owns the run's learned rows and deadlines.
/// End those field borrows before recursive hits so class-special passive
/// consumers still observe the actual learned state and shared RNG.
pub fn on_expiry_live<'a>(totem: &Totem<'_>, context: CastContext,
    rng: &mut NativeRng, port: &mut impl HitPassivePort<'a>,
) -> bool {
    let Some((instance, targets)) = expiry_targets(totem, context, port.learned(),
        &port.passive_state().deadlines, &port.actors()) else { return false; };
    let cooldown = port.global_cooldown();
    let (learned, state) = port.learned_and_state_mut();
    let started = begin_passive(&instance, context.now, cooldown, context.player_guid,
        learned, &mut state.deadlines);
    if let Some(started) = started { port.emit_passive_started(started); }
    let effects = port.talent_effects().to_vec();
    expiry_hits(totem, context, instance, targets, &effects, rng, port);
    true
}

///1454a47a1..4c10, executed BEFORE each surviving totem's pulse, regardless
/// of target availability. No crit, cooldown or spell visual is involved.
pub fn prepulse_heal(effects: &[TalentEffect<'_>], provenance_count: usize,
    vitals: &mut Vitals,
) -> Option<HealingAction> {
    prepulse_heal_for_rank(effects, provenance_count, vitals, 0)
}

pub fn prepulse_heal_for_rank(effects: &[TalentEffect<'_>], provenance_count: usize,
    vitals: &mut Vitals, heroic_rank: u8,
) -> Option<HealingAction> {
    let mut factor = -0.0_f32;
    for effect in effects { if effect.tag == 22 { factor += effect.amount; } }
    if !(factor > 0.0) { return None; }
    let source = effects.iter().position(|effect| effect.tag == 22)
        .filter(|index| *index < provenance_count)
        .map_or(HealingSource::Leech, |index| HealingSource::Talent { index });
    let requested = (factor * vitals.maximum_health) * crate::heroic::healing_factor(heroic_rank);
    let before = vitals.health;
    vitals.health = min_preserving_original_nan(vitals.health + requested, vitals.maximum_health);
    let actual = vitals.health - before;
    Some(HealingAction { requested, actual, source, record_in_meter: !(actual <= 0.0),
        health_field: native_max(vitals.health, 0.0).ceil() as u32,
        maximum_health_field: vitals.maximum_health.ceil() as u32 })
}
