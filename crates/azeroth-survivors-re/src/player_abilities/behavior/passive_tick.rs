//! Current 0.97.2 GameTick class-special state and consumers.
//! Native owner14549d550; see player-passive-tick-0.97.2.md. World, packet,
//! attribution and recursive-hit operations are supplied by the real run.

use super::{execution::{self, Critical, ProjectilePort}, hit_passives::{PassiveHit, RestoredAppearance},
    periodic, targeting::{self, Target}, unit24, RuntimeInstance};
use crate::{bosses::abilities::{native_missile_speed, CastTarget, SpellCast},
    enemies::{ai::Actor, NativeRng, Position}, player_abilities::{damage::{self, PowerContext}, native_max, native_min}};

/// Native Game+720 vector,24-byte [key pointer,key length,deadline].
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ProcDeadline { pub key: &'static str, pub at: f32 }

/// Duplicate keys remain observable: lookup/update use the FIRST match.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct ProcDeadlines(pub Vec<ProcDeadline>);

pub fn last_proc(deadlines: &[ProcDeadline], key: &str) -> f32 {
    deadlines.iter().find(|row| row.key == key).map_or(-f32::MAX, |row| row.at)
}

pub fn update_proc(deadlines: &mut Vec<ProcDeadline>, key: &'static str, at: f32) {
    if let Some(row) = deadlines.iter_mut().find(|row| row.key == key) { row.at = at; }
    else { deadlines.push(ProcDeadline { key, at }); }
}

impl ProcDeadlines {
    pub fn get(&self, key: &str) -> f32 { last_proc(&self.0, key) }
    pub fn set(&mut self, key: &'static str, at: f32) { update_proc(&mut self.0, key, at); }
}

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct BloodrageState {
    pub pool: f32,         // Game+7c4
    pub bank: f32,         // Game+7c8
    pub last_gain_at: f32, // Game+7cc
}

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct SealFateState { pub points: u32, pub bank: f32 } // Game+7d0/+7d4

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct HunterMarkState { pub guid: Option<u64>, pub reacquire_at: f32 } // +7b0/+7e8

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct FaerieMark { pub guid: u64, pub charges: f32 } // +768,16-byte rows

/// Selected0.105.0 eight-byte timestamp/amount row. Every Felguard swing
/// credits this ledger once, even when its cleave resolves multiple victims.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DemonSoulShardCredit { pub at: f32, pub amount: f32 }

///14590682a..145906fe5. Called only for an actual Felguard swing while Soul
/// Fire is learned. The current target consumes fractional shards at0.9999,
/// keeps at most2 credit within the open one-second window, and never banks
/// more progress while the integer resource is full. A true result requires
/// the caller to invoke publish_soul_fire synchronously, using this same state.
pub fn credit_demon_soul_shards(state: &mut PassiveTickState, now: f32) -> bool {
    //145995f70 stable compaction: equality and unordered ages are discarded.
    state.demon_soul_shard_credits.retain(|row| 1.0 > now - row.at);
    let recent = state.demon_soul_shard_credits.iter()
        .fold(-0.0_f32, |sum, row| sum + row.amount);
    let amount = native_min(2.0 - recent, 0.2);
    if !(amount > 0.0001) || state.soul_fire_points >= 5 { return false; }
    state.demon_soul_shard_credits.push(DemonSoulShardCredit { at: now, amount });
    state.soul_fire_fraction += amount;
    while state.soul_fire_fraction >= 0.9999 && state.soul_fire_points < 5 {
        state.soul_fire_fraction = native_max(state.soul_fire_fraction + -1.0, 0.0);
        state.soul_fire_points += 1;
    }
    if state.soul_fire_points >= 5 { state.soul_fire_fraction = 0.0; }
    true
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SoulFireHit {
    pub target_guid: u64, pub resolves_at: f32, pub damage: f32, pub critical: bool,
}

/// Native32-byte queued Redemption; the current death proc supplies these
/// fields, preserving its original target, sampled position and chain word.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Redemption {
    pub source_guid: u64, pub resolves_at: f32, pub center: Position, pub native_7e4: u32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Lightwell {
    pub object_guid: u64, pub center: Position, pub expires_at: f32,
    pub next_tick_at: f32, pub duration: f32,
}

/// Storage shared by GameTick, hit/death hooks and totem passive consumers.
/// These defaults are empty storage, not a replacement for the native run
/// constructor's resource initialization; the run owns initialization.
#[derive(Clone, Debug, Default)]
pub struct PassiveTickState {
    pub deadlines: ProcDeadlines,
    pub bloodrage: BloodrageState,
    pub seal_fate: SealFateState,
    pub soul_fire_points: u32,
    pub soul_fire_gain_at: f32, // Historical Game+7dc; selected0.105.0 Game+8a4
    /// Selected0.105.0 Game+8a8; distinct from the qualified-kill deadline.
    pub soul_fire_fraction: f32,
    /// Game+7f0/7f8: individual admitted Felguard swing credits in order.
    pub demon_soul_shard_credits: Vec<DemonSoulShardCredit>,
    pub redemption_queue_at: f32, // Game+7e0
    pub soul_fire_hits: Vec<SoulFireHit>,
    pub redemptions: Vec<Redemption>,
    pub hunters_mark: HunterMarkState,
    pub faerie_marks: Vec<FaerieMark>,
    pub lightwells: Vec<Lightwell>,
    pub polymorph_guids: Vec<u64>,
    pub resource_bar: Option<ResourceBar>,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct ResourceBar { pub field: u16, pub value: u32 }

pub fn special_target_count(instance: &RuntimeInstance<'_>, global_bonus: u32) -> u32 {
    execution::target_count(instance, global_bonus).min(3)
}

///1454a0a2e..0bcf. Interval is the canonical passive interval, including
/// its per-key minimum and effect multiplier, from begin_passive's owner.
pub fn regenerate_bloodrage(state: &mut BloodrageState, delta: f32, now: f32, interval: f32) {
    let rate = 100.0 / interval;
    state.bank = native_min(state.bank + delta * rate, native_max(rate * 0.5, 2.0));
    if now - state.last_gain_at > 3.0 {
        state.pool = native_max(state.pool + -15.0 * delta, 0.0);
    }
}

pub fn regenerate_seal_fate(state: &mut SealFateState, delta: f32, interval: f32) {
    let rate = 5.0 / interval;
    state.bank = native_min(state.bank + delta * rate, native_max(rate * 0.5, 2.0));
}

/// Extra current actor fields absent from the general AI Target view. The
/// optional native+64 is deliberately unnamed; its discriminant and byte96
/// have different eligibility tests in the original query/upkeep helpers.
#[derive(Clone, Debug)]
pub struct SpecialTarget {
    pub target: Target,
    pub native_64_present: bool,
    pub native_96: u8,
    pub native_flag_344: u8,
}

impl SpecialTarget {
    pub fn priority(&self) -> u8 {
        (u8::from(self.target.has_metadata) * 2) | self.native_flag_344
    }

    fn eligible(&self, now: f32, exact_one: bool) -> bool {
        self.target.actor.fear_until <= now && (!self.native_64_present ||
            if exact_one { self.native_96 == 1 } else { self.native_96 != 0 })
    }
}

fn plain_targets(targets: &[SpecialTarget]) -> Vec<Target> {
    targets.iter().map(|target| target.target.clone()).collect()
}

///1454d5740: first eligible distance-ordered candidate uses byte96==1;
/// subsequent candidates accept nonzero. Prefer greatest native priority,
/// then greatest HP by total float order; the LAST exact tie wins.
pub fn special_target(targets: &[SpecialTarget], now: f32, center: Position,
    range: f32, excluded: &[u64],
) -> Option<u64> {
    let plain = plain_targets(targets);
    let ordered = targeting::radius_targets(&plain, now, center, range, excluded);
    let mut chosen: Option<&SpecialTarget> = None;
    for target in ordered {
        let Some(view) = targets.iter().find(|view| view.target.actor.guid == target.actor.guid)
            else { continue; };
        if !view.eligible(now, chosen.is_none()) { continue; }
        if let Some(old) = chosen {
            if view.priority() < old.priority() || (view.priority() == old.priority() &&
                view.target.health.total_cmp(&old.target.health).is_lt()) { continue; }
        }
        chosen = Some(view);
    }
    chosen.map(|view| view.target.actor.guid)
}

///1454d5950/145544f90: native ordered query, excluding existing marks,
/// and byte96==1 eligibility. The center can be a dead victim's position.
pub fn faerie_candidates(targets: &[SpecialTarget], marks: &[FaerieMark], now: f32,
    center: Position, range: f32,
) -> Vec<u64> {
    let plain = plain_targets(targets);
    targeting::ordered_targets(&plain, now, center, range).into_iter().filter_map(|target| {
        let guid = target.actor.guid;
        (!marks.iter().any(|mark| mark.guid == guid) && targets.iter().any(|view|
            view.target.actor.guid == guid && view.eligible(now, true))).then_some(guid)
    }).collect()
}

///145524320/145524410: remove ALL matches and retain survivor order.
pub fn remove_faerie(marks: &mut Vec<FaerieMark>, guid: u64) {
    marks.retain(|mark| mark.guid != guid);
}

///1454d785b..786a. A direct append, not a deduplication operation.
pub fn add_faerie(marks: &mut Vec<FaerieMark>, guid: u64) {
    marks.push(FaerieMark { guid, charges: 4.0 });
}

pub fn remove_polymorph(guids: &mut Vec<u64>, guid: u64) { guids.retain(|row| *row != guid); }

///1454d42f0: old marks have a1.5x range hysteresis and accept byte96!=0.
fn valid_mark(view: &SpecialTarget, now: f32, player: Position, range: f32) -> bool {
    !view.target.actor.dead && view.eligible(now, false) && range * 1.5 >=
        execution::distance_squared(player, view.target.actor.movement.position_at(now)).sqrt()
}

#[derive(Clone, Copy, Debug)]
pub struct TickContext {
    pub now: f32,
    pub delta: f32,
    pub player_guid: u64,
    pub player: Position,
    pub power: PowerContext,
    pub global_cooldown: f32,
    pub global_area: f32,
    pub global_target_bonus: u32,
}

#[derive(Clone, Copy, Debug)]
pub struct GearBounce { pub count: u32, pub power_multiplier: f32 }

/// The source's concrete Lightwell entity profile at1469ac2f0. Native
///1454d2850 receives this profile, position, kind5 and flags16.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LightwellSpawn {
    pub center: Position,
    pub entry: u32,
    pub display: u32,
    pub scale: f32,
    pub native_kind: u32,
    pub native_flags: u32,
}

#[derive(Clone, Debug, PartialEq)]
pub struct LightwellObject {
    pub guid: u64,
    pub position: Position,
    pub orientation: f32,
    pub object_type: u8,
    pub fields: Vec<(u16, u32)>,
}

pub trait TickPort<'a>: ProjectilePort {
    fn learned(&self) -> &[RuntimeInstance<'a>];
    fn context(&self) -> TickContext;
    fn state(&self) -> &PassiveTickState;
    fn state_mut(&mut self) -> &mut PassiveTickState;
    fn special_targets(&self) -> Vec<SpecialTarget>;
    fn critical(&self) -> Critical;
    /// Disjoint actual run storage, so the shared begin helper updates the
    /// current learned row and THIS deadline table in one source operation.
    fn learned_and_state_mut(&mut self) -> (&mut [RuntimeInstance<'a>], &mut PassiveTickState);
    fn emit_passive_started(&mut self, started: super::totem_passives::PassiveStarted);
    /// Restore source-kind3 and the two cleared low64-bit tags around EACH
    /// synchronous canonical hit. Share the RNG with all recursive procs.
    fn hit_in_passive_context(&mut self, hit: PassiveHit, rng: &mut NativeRng);
    fn set_additional_damage_taken(&mut self, guid: u64, amount: f32);
    fn aura(&mut self, guid: u64, spell_id: u32, present: bool);
    fn actor_mut(&mut self, guid: u64) -> Option<&mut Actor>;
    fn restored_appearance(&self, guid: u64) -> Option<RestoredAppearance>;
    fn restore_appearance(&mut self, guid: u64, appearance: RestoredAppearance);
    fn primary_height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn secondary_height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn fallback_height(&self) -> f32;
    fn object_counter_mut(&mut self) -> &mut dyn crate::native_counter::NativeCounter;
    fn sin(&self, radians: f32) -> f32;
    fn cos(&self, radians: f32) -> f32;
    /// Emit current1454ff870/1454ffad0 create-object packet with recovered
    /// type, movement/orientation and update fields. Source constructs it.
    fn create_lightwell(&mut self, object: LightwellObject);
    fn remove_object(&mut self, guid: u64);
    /// FIRST matching equipped effect6: tag6,word16==0,byte24==1,keymatch.
    fn gear_bounce(&self, ability_key: &str) -> Option<GearBounce>;
    fn native_7e4(&self) -> u32;
    fn set_native_7e4(&mut self, value: u32);
    fn publish_resource_bar(&mut self, bar: ResourceBar);
}

fn learned<'a>(port: &impl TickPort<'a>, key: &str) -> Option<RuntimeInstance<'a>> {
    port.learned().iter().find(|instance| instance.definition.key == key).copied()
}

fn start_passive<'a>(instance: &RuntimeInstance<'a>, port: &mut impl TickPort<'a>) {
    let context = port.context();
    let (learned, state) = port.learned_and_state_mut();
    let action = super::totem_passives::begin_passive(instance, context.now,
        context.global_cooldown, context.player_guid, learned, &mut state.deadlines);
    if let Some(action) = action { port.emit_passive_started(action); }
}

fn visual(source_guid: u64, spell_id: u32, target: CastTarget, targets: &[u64],
    port: &mut impl ProjectilePort,
) { port.cast_spell(SpellCast { source_guid, spell_id, target, hit_targets: targets.to_vec() }); }

fn hit<'a>(instance: &RuntimeInstance<'_>, target_guid: u64, power: f32,
    rng: &mut NativeRng, port: &mut impl TickPort<'a>,
) {
    let roll = unit24(rng);
    let stats = port.critical();
    let critical = stats.chance > roll;
    port.hit_in_passive_context(PassiveHit { target_guid, spell_id: instance.definition.spell_id,
        school: instance.definition.school,
        damage: if critical { stats.multiplier * power } else { power }, critical }, rng);
}

///1454d69f0. An empty query retains the full resource pool and deadline.
pub fn publish_bloodrage<'a>(rng: &mut NativeRng, port: &mut impl TickPort<'a>) -> bool {
    if !(port.state().bloodrage.pool >= 100.0) { return false; }
    let context = port.context();
    if !(port.state().deadlines.get("bloodrage") <= context.now) { return false; }
    let Some(instance) = learned(port, "bloodrage") else { return false; };
    let targets = plain_targets(&port.special_targets());
    let selected = targeting::radius_targets(&targets, context.now, context.player,
        periodic::area_radius(&instance, context.global_area), &[]).into_iter()
        .map(|target| target.actor.guid).collect::<Vec<_>>();
    if selected.is_empty() { return false; }
    port.state_mut().bloodrage.pool = 0.0;
    start_passive(&instance, port);
    visual(context.player_guid, 5246, CastTarget::None, &selected, port);
    let power = damage::effective_power(&instance, &context.power);
    for guid in selected { hit(&instance, guid, power, rng, port); }
    true
}

///1454d7020. Target HP is re-read before each hit; earlier recursive procs
/// can change a later victim. Double power applies strictly below30% HP.
pub fn publish_seal_fate<'a>(rng: &mut NativeRng, port: &mut impl TickPort<'a>) -> bool {
    if port.state().seal_fate.points < 5 { return false; }
    let context = port.context();
    if !(port.state().deadlines.get("seal_fate") <= context.now) { return false; }
    let Some(instance) = learned(port, "seal_fate") else { return false; };
    let targets = plain_targets(&port.special_targets());
    let mut selected = targeting::radius_targets(&targets, context.now, context.player,
        instance.definition.range, &[]);
    targeting::order_execute(&mut selected, context.now);
    selected.truncate(special_target_count(&instance, context.global_target_bonus) as usize);
    let selected = selected.into_iter().map(|target| target.actor.guid).collect::<Vec<_>>();
    if selected.is_empty() { return false; }
    port.state_mut().seal_fate.points = 0;
    start_passive(&instance, port);
    visual(context.player_guid, 2098, CastTarget::Unit(selected[0]), &selected, port);
    let power = damage::effective_power(&instance, &context.power);
    for guid in selected {
        let double = port.special_targets().iter().find(|view| view.target.actor.guid == guid)
            .is_some_and(|view| view.target.health / view.target.maximum_health < 0.3);
        hit(&instance, guid, if double { power + power } else { power }, rng, port);
    }
    true
}

///1454d5bd0: unique best-special targets, position sampled before publication,
/// crit at launch and XY travel using the current spell-ID speed lookup.
pub fn publish_soul_fire<'a>(rng: &mut NativeRng, port: &mut impl TickPort<'a>) -> bool {
    if port.state().soul_fire_points < 5 { return false; }
    let context = port.context();
    if !(port.state().deadlines.get("soul_fire") <= context.now) { return false; }
    let Some(instance) = learned(port, "soul_fire") else { return false; };
    let targets = port.special_targets();
    let mut selected = Vec::new();
    let mut excluded = Vec::new();
    for _ in 0..execution::target_count(&instance, context.global_target_bonus) {
        let Some(guid) = special_target(&targets, context.now, context.player,
            instance.definition.range, &excluded) else { break; };
        let Some(view) = targets.iter().find(|view| view.target.actor.guid == guid) else { break; };
        selected.push((guid, view.target.actor.movement.position_at(context.now)));
        excluded.push(guid);
    }
    if selected.is_empty() { return false; }
    port.state_mut().soul_fire_points = 0;
    start_passive(&instance, port);
    let power = damage::effective_power(&instance, &context.power);
    // The helper's inlined lookup defaults an unknown speed to1.
    let speed = native_max(native_missile_speed(instance.definition.spell_id), 1.0);
    for (guid, destination) in selected {
        visual(context.player_guid, instance.definition.spell_id, CastTarget::Unit(guid), &[guid], port);
        let critical = unit24(rng) < port.critical().chance;
        let damage = if critical { power * port.critical().multiplier } else { power };
        port.state_mut().soul_fire_hits.push(SoulFireHit { target_guid: guid,
            resolves_at: execution::distance_squared(context.player, destination).sqrt() / speed + context.now,
            damage, critical });
    }
    true
}

///1454a0c4e..0e29 detaches due rows before recursive hits. This consumer
/// runs only while Soul Fire remains learned; otherwise its queue is retained.
pub fn resolve_soul_fire<'a>(rng: &mut NativeRng, port: &mut impl TickPort<'a>) {
    if learned(port, "soul_fire").is_none() { return; }
    let now = port.context().now;
    let mut due = Vec::new();
    port.state_mut().soul_fire_hits.retain(|row| {
        if now >= row.resolves_at { due.push(*row); false } else { true }
    });
    for row in due {
        port.hit_in_passive_context(PassiveHit { target_guid: row.target_guid,
            spell_id: 6353, school: 2, damage: row.damage, critical: row.critical }, rng);
    }
}

///1454a0e4e..13ac: repeatedly remove the FIRST due row. Each pass re-reads
/// the current learned instance, and recursive deaths may append new rows.
/// Missing Redemption drops due rows; future rows keep their stored order.
pub fn resolve_redemption<'a>(rng: &mut NativeRng, port: &mut impl TickPort<'a>) {
    let now = port.context().now;
    loop {
        let Some(index) = port.state().redemptions.iter().position(|row| now >= row.resolves_at)
            else { break; };
        let row = port.state_mut().redemptions.remove(index);
        let Some(instance) = learned(port, "redemption") else { continue; };
        let context = port.context();
        let targets = plain_targets(&port.special_targets());
        let selected = targeting::radius_targets(&targets, now, row.center,
            periodic::area_radius(&instance, context.global_area), &[row.source_guid])
            .into_iter().map(|target| target.actor.guid).collect::<Vec<_>>();
        if targets.iter().any(|target| target.actor.guid == row.source_guid) {
            visual(row.source_guid, 15237, CastTarget::None, &selected, port);
        }
        let saved = port.native_7e4();
        port.set_native_7e4(row.native_7e4);
        let power = damage::effective_power(&instance, &context.power);
        for guid in selected { hit(&instance, guid, power, rng, port); }
        port.set_native_7e4(saved);
    }
}

///1454a13d1..16d6 and215a..2239: keep a valid old mark unless the current
/// best special target has STRICTLY greater metadata/flag priority. Keeping
/// a mark refreshes its multiplier/aura even while reacquisition is delayed.
pub fn tick_hunters_mark<'a>(port: &mut impl TickPort<'a>) {
    let Some(instance) = learned(port, "hunters_mark") else { return; };
    let context = port.context();
    let targets = port.special_targets();
    let multiplier = native_min((instance.power_multiplier * instance.talent_power_multiplier).sqrt()
        * 0.2, 0.4);
    let candidate = special_target(&targets, context.now, context.player, instance.definition.range, &[]);
    if let Some(guid) = port.state().hunters_mark.guid {
        let old = targets.iter().find(|view| view.target.actor.guid == guid);
        let keep = old.is_some_and(|old| valid_mark(old, context.now, context.player,
            instance.definition.range) && !candidate.and_then(|guid|
                targets.iter().find(|view| view.target.actor.guid == guid))
                .is_some_and(|new| new.priority() > old.priority()));
        if keep {
            port.set_additional_damage_taken(guid, multiplier);
            port.aura(guid, instance.definition.spell_id, true);
            return;
        }
        port.set_additional_damage_taken(guid, 0.0);
        port.aura(guid, instance.definition.spell_id, false);
        port.state_mut().hunters_mark.guid = None;
    }
    // Native uses JA, so an unordered reacquire deadline does not block.
    if port.state().hunters_mark.reacquire_at > context.now { return; }
    let Some(guid) = candidate else { return; };
    port.set_additional_damage_taken(guid, multiplier);
    port.state_mut().hunters_mark.guid = Some(guid);
    visual(context.player_guid, instance.definition.spell_id, CastTarget::Unit(guid), &[guid], port);
    port.aura(guid, instance.definition.spell_id, true);
}

fn apply_faerie<'a>(guid: u64, port: &mut impl TickPort<'a>) {
    add_faerie(&mut port.state_mut().faerie_marks, guid);
    visual(port.context().player_guid, 770, CastTarget::Unit(guid), &[guid], port);
    port.aura(guid, 770, true);
}

///1454a16f4..1f08: refill charges, remove invalid old marks with1.5x range
/// hysteresis, fill the current1..3 cap, replace lower-priority marks, refresh
/// every remaining aura. A reduced cap does not remove otherwise valid marks.
pub fn tick_faerie_fire<'a>(port: &mut impl TickPort<'a>) {
    let Some(instance) = learned(port, "faerie_fire") else { return; };
    let context = port.context();
    for mark in &mut port.state_mut().faerie_marks {
        mark.charges = native_min(mark.charges + 4.0 * context.delta, 4.0);
    }
    let targets = port.special_targets();
    let invalid = port.state().faerie_marks.iter().filter(|mark|
        !targets.iter().find(|view| view.target.actor.guid == mark.guid).is_some_and(|view|
            valid_mark(view, context.now, context.player, instance.definition.range)))
        .map(|mark| mark.guid).collect::<Vec<_>>();
    for guid in invalid {
        remove_faerie(&mut port.state_mut().faerie_marks, guid);
        port.aura(guid, 770, false);
    }
    let cap = special_target_count(&instance, context.global_target_bonus) as usize;
    while port.state().faerie_marks.len() < cap {
        let candidates = faerie_candidates(&port.special_targets(), &port.state().faerie_marks,
            context.now, context.player, instance.definition.range);
        let Some(&guid) = candidates.first() else { break; };
        apply_faerie(guid, port);
    }
    loop {
        let targets = port.special_targets();
        let candidates = faerie_candidates(&targets, &port.state().faerie_marks,
            context.now, context.player, instance.definition.range);
        let Some(&new_guid) = candidates.first() else { break; };
        let priority = |guid| targets.iter().find(|view| view.target.actor.guid == guid)
            .map_or(0, SpecialTarget::priority);
        //145512d50 keeps the FIRST minimum when priorities tie.
        let mut worst = None;
        for mark in &port.state().faerie_marks {
            if worst.is_none_or(|old| priority(mark.guid) < priority(old)) { worst = Some(mark.guid); }
        }
        let Some(old_guid) = worst else { break; };
        if priority(new_guid) <= priority(old_guid) { break; }
        remove_faerie(&mut port.state_mut().faerie_marks, old_guid);
        port.aura(old_guid, 770, false);
        apply_faerie(new_guid, port);
    }
    let marked = port.state().faerie_marks.iter().map(|mark| mark.guid).collect::<Vec<_>>();
    for guid in marked { port.aura(guid, 770, true); }
}

///1454a3265..3491 /145532400: missing, dead or expired tracked actors are
/// removed, clearing ALL occurrences. Live actors regain their original
/// optional+144 appearance and lose aura118, after both movement writes.
pub fn tick_polymorph<'a>(port: &mut impl TickPort<'a>) {
    let now = port.context().now;
    let targets = port.special_targets();
    let expired = port.state().polymorph_guids.iter().copied().filter(|guid|
        !targets.iter().find(|view| view.target.actor.guid == *guid).is_some_and(|view|
            !view.target.actor.dead && !(now >= view.target.actor.fear_until))).collect::<Vec<_>>();
    for guid in expired {
        remove_polymorph(&mut port.state_mut().polymorph_guids, guid);
        let live = if let Some(actor) = port.actor_mut(guid) {
            actor.fear_until = 0.0;
            actor.next_movement_at = now;
            !actor.dead
        } else { false };
        if !live { continue; }
        if let Some(appearance) = port.restored_appearance(guid) {
            port.restore_appearance(guid, appearance);
        }
        port.aura(guid, 118, false);
    }
}

///1454d2850's concrete entity construction. The run counter is incremented
/// before the23-bit uniform yaw sample; each rejected draw advances the SAME
/// RNG. The profile's entry contributes only its low24 bits to the GUID.
pub fn lightwell_object(request: LightwellSpawn, counter: &mut dyn crate::native_counter::NativeCounter,
    rng: &mut NativeRng, sin: impl Fn(f32) -> f32, cos: impl Fn(f32) -> f32,
) -> LightwellObject {
    let serial=counter.next();
    lightwell_object_with_counter(request, serial, rng, sin, cos)
}

fn lightwell_object_with_counter(request: LightwellSpawn, counter: u32,
    rng: &mut NativeRng, sin: impl Fn(f32) -> f32, cos: impl Fn(f32) -> f32,
) -> LightwellObject {
    let tau = f32::from_bits(0x40c9_0fdb);
    let orientation = loop {
        let unit = f32::from_bits(0x3f80_0000 | (rng.next_u64() >> 41) as u32) + -1.0;
        let sample = unit * tau;
        if tau > sample { break sample + 0.0; }
    };
    let guid = 0xf110_0000_0000_0000 | (u64::from(request.entry & 0x00ff_ffff) << 24)
        | u64::from(counter & 0x00ff_ffff);
    LightwellObject { guid, position: request.center, orientation, object_type: 5, fields: vec![
        (0, guid as u32), (1, (guid >> 32) as u32), (2, 33), (3, request.entry),
        (4, request.scale.to_bits()), (8, request.display), (9, request.native_flags),
        (12, sin(orientation * 0.5).to_bits()), (13, cos(orientation * 0.5).to_bits()),
        (14, 1), (15, request.center.x.to_bits()), (16, request.center.y.to_bits()),
        (17, request.center.z.to_bits()), (18, orientation.to_bits()), (20, 35),
        (21, request.native_kind),
    ] }
}

fn lightwell_bounce<'a>(instance: &RuntimeInstance<'_>, primary: u64, center: Position,
    power: f32, rng: &mut NativeRng, port: &mut impl TickPort<'a>,
) {
    let Some(bounce) = port.gear_bounce(instance.definition.key) else { return; };
    let context = port.context();
    let targets = plain_targets(&port.special_targets());
    // Native14552b8f0 passes100 as squared radius, then sorts distances.
    let mut selected = targeting::radius_targets(&targets, context.now, center, 10.0, &[primary]);
    selected.truncate(bounce.count as usize);
    let selected = selected.into_iter().map(|target| target.actor.guid).collect::<Vec<_>>();
    for guid in selected {
        visual(primary, 25912, CastTarget::Unit(guid), &[guid], port);
        hit(instance, guid, power * bounce.power_multiplier, rng, port);
    }
}

///1454a1f18..3265. Expiry/missing-ability cleanup precedes one pulse per
/// surviving row, then a single optional new spawn. Pulse deadlines advance
/// by1 rather than resetting to now; newly created wells begin at now+.5.
pub fn tick_lightwell<'a>(rng: &mut NativeRng, port: &mut impl TickPort<'a>) {
    let context = port.context();
    let instance = learned(port, "lightwell");
    let removed = port.state().lightwells.iter().filter(|row|
        context.now >= row.expires_at || instance.is_none()).map(|row| row.object_guid).collect::<Vec<_>>();
    //145523780 removes every row whose GUID occurs in the expired list.
    port.state_mut().lightwells.retain(|row| !removed.contains(&row.object_guid));
    for guid in removed { if guid != 0 { port.remove_object(guid); } }
    let Some(instance) = instance else { return; };
    let power = damage::effective_power(&instance, &context.power);
    let original_count = port.state().lightwells.len();
    for index in 0..original_count {
        let Some(row) = port.state().lightwells.get(index).copied() else { break; };
        // Native JA skips only a strictly later tick; unordered fires.
        if row.next_tick_at > context.now { continue; }
        port.state_mut().lightwells[index].next_tick_at += 1.0;
        let views = port.special_targets();
        let targets = plain_targets(&views);
        let selected = targeting::ordered_targets(&targets, context.now, row.center, instance.definition.range)
            .into_iter().filter(|target| views.iter().any(|view| view.target.actor.guid == target.actor.guid
                && view.eligible(context.now, true)))
            .take(special_target_count(&instance, context.global_target_bonus) as usize)
            .map(|target| target.actor.guid).collect::<Vec<_>>();
        for guid in selected {
            visual(row.object_guid, 25912, CastTarget::Unit(guid), &[guid], port);
            // The position is read after the visual and before the primary hit.
            let center = port.special_targets().iter().find(|view| view.target.actor.guid == guid)
                .map(|view| view.target.actor.movement.position_at(port.context().now));
            hit(&instance, guid, power, rng, port);
            if let Some(center) = center { lightwell_bounce(&instance, guid, center, power, rng, port); }
        }
    }
    if !(context.now >= port.state().deadlines.get("lightwell")) { return; }
    // Spawn gate is ANY live actor within25yd, not a special-target query.
    let targets = plain_targets(&port.special_targets());
    if targeting::radius_targets(&targets, context.now, context.player, 25.0, &[]).is_empty() { return; }
    let mut center = context.player;
    center.z = port.primary_height([center.x, center.y])
        .or_else(|| port.secondary_height([center.x, center.y])).unwrap_or_else(|| port.fallback_height());
    let duration = damage::scaled_duration(&instance);
    start_passive(&instance, port);
    visual(context.player_guid, instance.definition.spell_id, CastTarget::Ground(center), &[], port);
    if port.state().lightwells.len() >= 3 {
        let oldest = port.state_mut().lightwells.remove(0);
        if oldest.object_guid != 0 { port.remove_object(oldest.object_guid); }
    }
    let request = LightwellSpawn { center, entry: 9012, display: 6671, scale: 1.0,
        native_kind: 5, native_flags: 16 };
    // Keep the shared counter and math accesses disjoint from the packet call.
    let counter = port.object_counter_mut();
    let counter = counter.next();
    let object = lightwell_object_with_counter(request, counter, rng,
        |radians| port.sin(radians), |radians| port.cos(radians));
    let object_guid = object.guid;
    port.create_lightwell(object);
    port.state_mut().lightwells.push(Lightwell { object_guid, center,
        expires_at: context.now + duration, next_tick_at: context.now + 0.5, duration });
}

///1454a3491..3884. Existing cache remains untouched if no resource ability
/// is learned. Priority is Bloodrage, Seal Fate, Soul Fire, then Lightwell.
pub fn tick_resource_bar<'a>(port: &mut impl TickPort<'a>) {
    let context = port.context();
    let bar = if learned(port, "bloodrage").is_some() {
        ResourceBar { field: 24, value: (port.state().bloodrage.pool * 10.0) as u32 }
    } else if learned(port, "seal_fate").is_some() {
        ResourceBar { field: 26, value: port.state().seal_fate.points.wrapping_mul(20) }
    } else if learned(port, "soul_fire").is_some() {
        ResourceBar { field: 23, value: port.state().soul_fire_points.wrapping_mul(20) }
    } else if let Some(instance) = learned(port, "lightwell") {
        let fraction = if let Some(last) = port.state().lightwells.last() {
            (last.expires_at - context.now) / native_max(last.duration, 0.1)
        } else {
            1.0 - native_max(port.state().deadlines.get("lightwell") - context.now, 0.0)
                / super::totem_passives::passive_interval(&instance, context.global_cooldown)
        };
        // Native MAXSS order is max(0,fraction), then min(1,result).
        let fraction = native_min(1.0, native_max(0.0, fraction));
        ResourceBar { field: 23, value: (fraction * 100.0) as u32 }
    } else { return; };
    if port.state().resource_bar == Some(bar) { return; }
    port.state_mut().resource_bar = Some(bar);
    port.publish_resource_bar(bar);
}

///1454a0987..3884. This entire block is skipped unless at least one learned
/// definition has kind11. Order matters because synchronous hits/deaths can
/// change resources, queues, learned instances and targets before later arms.
pub fn tick<'a>(rng: &mut NativeRng, port: &mut impl TickPort<'a>) {
    if !port.learned().iter().any(|instance| instance.definition.kind == 11) { return; }
    let context = port.context();
    if let Some(instance) = learned(port, "bloodrage") {
        let interval = super::totem_passives::passive_interval(&instance, context.global_cooldown);
        regenerate_bloodrage(&mut port.state_mut().bloodrage, context.delta, context.now, interval);
        publish_bloodrage(rng, port);
    }
    if let Some(instance) = learned(port, "seal_fate") {
        let interval = super::totem_passives::passive_interval(&instance, context.global_cooldown);
        regenerate_seal_fate(&mut port.state_mut().seal_fate, context.delta, interval);
        publish_seal_fate(rng, port);
    }
    if learned(port, "soul_fire").is_some() {
        publish_soul_fire(rng, port);
        resolve_soul_fire(rng, port);
    }
    resolve_redemption(rng, port);
    tick_hunters_mark(port);
    tick_faerie_fire(port);
    tick_lightwell(rng, port);
    tick_polymorph(port);
    tick_resource_bar(port);
}
