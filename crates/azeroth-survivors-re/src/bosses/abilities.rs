//! Historical boss ability effects with selected 0.109.0 raid volley hazards.
//! Current producer/lifecycle: docs/analysis/raid-volleys-0.109.0.md.
//! The five semantic variants cover the partially migrated source records
//! in the canonical boss catalog. No game assets or replacement world exist
//! here; actual terrain, packets, entities and victim damage use required ports.

use super::{NativeRng, Position, RawBossAbility};
use crate::enemies::ai::{Math, Movement};

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Ability {
    GroundArea { visual_spell: u32, impact_spell: u32, radius: f32, delay: f32, damage_factor: f32 },
    MissileVolley { spell_id: u32, count: u32 },
    Summon { count: u32 },
    AreaStrike { spell_id: u32, radius: f32, damage_factor: f32 },
    Charge { spell_id: u32 },
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct UnknownAbilityTag(pub u32);

impl Ability {
    pub fn decode(record: &RawBossAbility) -> Result<Self, UnknownAbilityTag> {
        let w = record.words;
        Ok(match w[0] {
            0 => Self::GroundArea { visual_spell: w[1], impact_spell: w[2], radius: f32::from_bits(w[3]), delay: f32::from_bits(w[4]), damage_factor: f32::from_bits(w[5]) },
            1 => Self::MissileVolley { spell_id: w[1], count: w[2] },
            2 => Self::Summon { count: w[1] },
            3 => Self::AreaStrike { spell_id: w[1], radius: f32::from_bits(w[2]), damage_factor: f32::from_bits(w[3]) },
            4 => Self::Charge { spell_id: w[1] },
            tag => return Err(UnknownAbilityTag(tag)),
        })
    }
}

/// Current 14596ca90: native visual radius overrides; unknown spells have none.
/// Revalidated with the 0.112.0 dynamic-object helper and comparison boundaries.
pub fn native_spell_radius(spell_id: u32) -> Option<f32> {
    match spell_id {
        10 | 1510 | 1680 | 5740 | 6343 | 8122 | 16914 | 20549 | 26573 => Some(8.0),
        120 | 122 | 1160 | 1449 | 1949 | 11113 | 11683 | 13810 | 15237 => Some(10.0),
        779 | 2120 => Some(5.0),
        _ => None,
    }
}

/// 1454f08d0: the original hardcoded speed lookup, not inferred DBC behavior.
pub fn native_missile_speed(spell_id: u32) -> f32 {
    match spell_id {
        403 | 686 | 2812 | 5176 | 7269 => 20.0,
        133 | 6353 | 6789 | 11366 => 24.0,
        116 | 10181 => 28.0,
        75 | 1978 | 3044 | 5116 | 6917 | 19434 => 40.0,
        1510 | 2643 => 30.0,
        24275 => 35.0,
        3606 => 19.0,
        _ => 0.0,
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct CombatContext {
    pub source_guid: u64,
    pub player_guid: u64,
    pub now: f32,
    /// Actor position interpolated again at deferred ability-dispatch time.
    pub source: Position,
    /// Current player position at dispatch, captured for ground/missile aims.
    pub player: Position,
    /// Actor damage after timed reduction and boss-only 1.4 enrage multiplier.
    pub effective_damage: f32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum CastTarget {
    /// Native target tag 2, serialized target mask zero.
    None,
    /// Native target tag 0, serialized unit mask two and a packed GUID.
    Unit(u64),
    /// Native target tag 1, serialized destination mask 0x40 and XYZ.
    Ground(Position),
}

#[derive(Clone, Debug, PartialEq)]
pub struct SpellCast {
    pub source_guid: u64,
    pub spell_id: u32,
    pub target: CastTarget,
    pub hit_targets: Vec<u64>,
}

#[derive(Clone, Debug, PartialEq)]
pub struct GroundObject {
    pub guid: u64,
    pub position: Position,
    /// Native object/update fields; key five is absent in the original map.
    pub fields: Vec<(u16, u32)>,
}

/// Current 145963f80. The owning Game+0xa60 counter is shared with creatures.
/// Dynamic GUIDs retain the full wrapping u32; field 5 is absent from the map.
pub fn ground_object(counter: &mut dyn crate::native_counter::NativeCounter, player_guid: u64, spell_id: u32, radius: f32, position: Position) -> GroundObject {
    let guid = 0xf100_0000_0000_0000 | u64::from(counter.next());
    let scale = native_spell_radius(spell_id).map_or(1.0, |base| radius / base);
    GroundObject { guid, position, fields: vec![
        (0, guid as u32), (1, (guid >> 32) as u32), (2, 0x41), (3, spell_id), (4, scale.to_bits()),
        (6, player_guid as u32), (7, (player_guid >> 32) as u32), (8, 1), (9, spell_id),
        (10, radius.to_bits()), (11, position.x.to_bits()), (12, position.y.to_bits()),
        (13, position.z.to_bits()), (14, 0),
    ] }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct MinionSpawn { pub enemy_index: usize, pub position: Position }

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Charge {
    pub source_guid: u64,
    pub movement: Movement,
    pub duration_ms: u32,
    pub next_move_at: f32,
    /// Remaining attack delay, not a second absolute deadline.
    pub attack_delay: f32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Impact {
    pub source_guid: u64,
    pub impact_spell: u32,
    pub center: Position,
    pub radius: f32,
    pub damage: f32,
    pub created_at: f32,
    pub resolves_at: f32,
    pub remove_object: Option<u64>,
    /// Original record+54, preserved even though kind-one expiry ignores it.
    pub raw_school: u8,
}

/// Bind actual terrain/collision, network effects, enemy constructor and player
/// damage. The source supplies concrete spell/object/impact/actor mutations.
pub trait CombatPort {
    fn heroic_rank(&self) -> u8 { 0 }
    /// Current primary-boss aim from the selected hero's admitted report.
    /// Historical effect-only ports retain their supplied target position.
    fn raid_aim(&mut self, context: CombatContext, _windup: f32) -> Position { context.player }
    /// Current ground-hazard checks distinguish admitted tracking from the
    /// collision-clipped report-lag position. Historical ports have one pose.
    fn raid_hazard_positions(&mut self) -> (Position, Position) {
        let player = self.player_position();
        (player, player)
    }
    /// Current145923166/145923e75 resolve the living source's party target
    /// before mutating a shared delayed or hazard row. Solo ports admit all.
    fn raid_source_selected(&self, _guid: u64) -> bool { true }
    /// Dedicated native hazard channel; ordinary HUD messages never enter it.
    fn raid_marker(&mut self, _message: serde_json::Value) {}
    /// Alive source actor at the hazard stage, before this frame's actor tick.
    fn raid_source(&self, _guid: u64) -> Option<Position> { None }
    /// Final current hazard hit doubles before Endless is enabled. Isolated
    /// historical effect fixtures retain their unscaled lane; the live port
    /// supplies the completion owner's flag.
    fn raid_damage_multiplier(&self) -> f32 { 1.0 }
    fn primary_height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn secondary_height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn fallback_height(&self) -> f32;
    fn ray_fraction(&mut self, from: Position, to: Position) -> Option<f32>;
    fn cast_spell(&mut self, request: SpellCast);
    fn create_ground_object(&mut self, object: GroundObject);
    fn remove_ground_object(&mut self, guid: u64);
    /// The original enemy creator enforces its live cap and applies normal
    /// scaling/actor initialization. It consumes these same shared counters.
    fn spawn_minion(&mut self, request: MinionSpawn, rng: &mut NativeRng, guid_counter: &mut dyn crate::native_counter::NativeCounter);
    /// Increment the shared Game+908 movement sequence, emit the recovered
    /// movement packet and install the request's actor movement/timing fields.
    fn begin_charge(&mut self, request: Charge);
    fn begin_raid_charge(&mut self, request: Charge) { self.begin_charge(request); }
    fn raid_source_scale(&self, _guid: u64) -> f32 { 1. }
    /// Re-read the live caster at delayed native18 dispatch, including current
    /// interpolation, damage reduction and primary-boss enrage.
    fn raid_context(&self, _guid: u64, _now: f32) -> Option<CombatContext> { None }
    fn raid_source_maximum_health(&self, _guid: u64) -> Option<f32> { None }
    fn raid_spawn_ward(&mut self, _request: super::raid_wards::Spawn) {}
    fn raid_expose(&mut self, _source: u64, _until: f32) {}
    fn raid_whirlwind(&mut self, _source: u64, _until: f32) {}
    fn raid_pull(&mut self, _source: u64) {}
    fn raid_teleport(&mut self, _source: u64, _destination: Position, _angle: f32) {}
    fn raid_transform(&mut self, _source: u64, _native_action_index: usize) {}
    fn raid_dynamic_object(&mut self, _spell: u32, _radius: f32, _point: Position) -> u64 { 0 }
    fn raid_heal_source(&mut self, _source: u64, _fraction: f32, _spell: u32) {}
    fn raid_spawn_at(&mut self, _index_low: u32, _index_high: u32, _position: Position) {}
    fn raid_hold_facing(&mut self, source: u64, seconds: f32, _angle: f32) {
        self.raid_hold(source, seconds);
    }
    fn raid_knockback(&mut self, _angle: f32, _speed: f32) {}
    fn raid_root(&mut self, _source: u64, _spell: u32, _duration: f32) {}
    /// Native23's actor+1cc deadline, distinct from player absorb/armor.
    fn raid_protect(&mut self, _source: u64, _until: f32) {}
    /// Existing shared actor slots own duplicate/full/add/remove publication.
    fn raid_aura(&mut self, _source: u64, _spell: u32, _present: bool) {}
    fn raid_warning(&mut self, _source: u64, _warning: super::raid_warnings::RaidWarning) {}
    fn raid_bomb_damage(&mut self, _center: Position, _radius: f32, _damage: f32, _spell: u32) {}
    fn raid_zone_bounds(&self) -> Option<([f32;2],f32)> { None }
    /// Current raid-specific movement hold; historical effect-only ports may
    /// omit it. The live adapter freezes the actor and emits its stop packet.
    fn raid_hold(&mut self, _source_guid: u64, _seconds: f32) {}
    /// Current boss ability gate is separate from the actor movement hold.
    fn raid_block(&mut self, _source_guid: u64, _seconds: f32) {}
    ///145950b00 publishes SpellStart independently of marker/impact creation.
    fn raid_cast(&mut self, _source_guid: u64, _spell_id: u32, _seconds: f32) {}
    fn yell(&mut self, source_guid: u64, text: &'static str);
    fn player_position(&self) -> Position;
    /// The live hazard hit retains the emitter and impact spell.
    fn damage_player(&mut self, amount: f32, source_guid: u64, spell_id: u32);
}

fn height(port: &mut impl CombatPort, x: f32, y: f32) -> f32 {
    port.primary_height([x, y]).or_else(|| port.secondary_height([x, y]))
        .unwrap_or_else(|| port.fallback_height())
}
fn distance(a: Position, b: Position) -> f32 {
    let x = a.x - b.x; let y = a.y - b.y;
    (y * y + x * x).sqrt()
}

/// Native ordered XY range test; Z never participates.
pub fn in_radius(a: Position, b: Position, radius: f32) -> bool { radius >= distance(a, b) }

pub fn charge_duration(from: Position, to: Position) -> f32 { (distance(from, to) / 24.0).max(1.1) }

pub fn charge_endpoint(from: Position, to: Position, fraction: f32) -> Position {
    if fraction >= 1.0 { return to; }
    let margin = 0.5 / distance(from, to).max(0.5);
    let fraction = (fraction - margin).max(0.0);
    Position { x: (to.x - from.x) * fraction + from.x,
        y: (to.y - from.y) * fraction + from.y, z: to.z }
}

/// Per-impact native volley aim. The first impact consumes its phase draw
/// while placing at the captured player; later impacts add a 2..6 radial draw.
pub fn missile_aim_xy(index: u32, count: u32, player: Position,
                      rng: &mut NativeRng, math: &impl Math) -> [f32; 2] {
    let phase = rng.range_f32(0.0, 1.0);
    let radius = if index == 0 { 0.0 } else { rng.range_f32(2.0, 6.0) };
    let angle = (index as f32 / count as f32) * std::f32::consts::TAU + phase;
    [math.cos(angle) * radius + player.x, math.sin(angle) * radius + player.y]
}

pub fn minion_enemy_index(index: u32) -> usize { usize::from(index % 3 == 2) }

/// Selected 0.109.0 tag4 volleys use the same speed lookup with a ten-yard
/// default, but every landing waits at least 0.6 seconds. MAXSS chooses the
/// floor for an unordered distance. Z does not participate. Current native
/// lanes:14595c5ce..14595c609 and14595ca1f..14595ca5a.
pub fn missile_travel_delay(spell_id: u32, source: Position, center: Position) -> f32 {
    let speed = native_missile_speed(spell_id).max(10.0);
    (distance(source, center) / speed).max(0.6)
}

/// Kind-one entries in the owning shared area-effect queue, in insertion order.
/// The real run may also have player-owned kind-zero area records; its adapter
/// must preserve their original ordering when using these recovered effects.
#[derive(Clone, Debug, Default)]
pub struct PendingEffects {
    pub impacts: Vec<Impact>,
    pub raid_areas: super::raid_areas::Pending,
}

impl PendingEffects {
    /// Current delayed native abilities share insertion order with charge and
    /// aura removal. The same RNG and object counter reach nested summons.
    pub fn resolve_due_with_rng(&mut self, now: f32, elapsed: f32,
        port: &mut impl CombatPort, rng: &mut NativeRng,
        counter: &mut dyn crate::native_counter::NativeCounter) {
        use super::raid_areas::{DelayedKind, PendingLines};
        let mut index = 0;
        while let Some((source, kind)) = self.raid_areas.lines.take_due(now, &mut index,
            |source| port.raid_source_selected(source)) {
            match kind {
                DelayedKind::Ability(ability) => {
                    if let Some(context) = port.raid_context(source, now) {
                        // Every generated child has a current native owner.
                        let _ = dispatch_live(&ability, context, rng, counter, self, port,
                            &crate::enemies::ai::HostMath);
                    }
                }
                other => PendingLines::apply(source, other, now, port),
            }
        }
        self.raid_areas.tick_elapsed(now, elapsed, port);
        self.resolve_impacts(now, port);
    }
    /// Main tick 1454a3cd0..a3f81 executes before actor update/ability dispatch.
    /// An effect created in actor dispatch cannot resolve until a later tick.
    /// Expiry is inclusive; test the player's position at resolution, not aim.
    pub fn resolve_due(&mut self, now: f32, port: &mut impl CombatPort) {
        self.raid_areas.tick(now, port);
        self.resolve_impacts(now, port);
    }

    fn resolve_impacts(&mut self, now: f32, port: &mut impl CombatPort) {
        let mut index = 0;
        while index < self.impacts.len() {
            if !port.raid_source_selected(self.impacts[index].source_guid) { index += 1; continue; }
            if !(now >= self.impacts[index].resolves_at) { index += 1; continue; }
            let impact = self.impacts.remove(index);
            if impact.impact_spell != 0 {
                port.cast_spell(SpellCast { source_guid: impact.source_guid,
                    spell_id: impact.impact_spell, target: CastTarget::Ground(impact.center), hit_targets: vec![] });
            }
            if in_radius(port.player_position(), impact.center, impact.radius) {
                port.damage_player(impact.damage, impact.source_guid, impact.impact_spell);
            }
            if let Some(guid) = impact.remove_object { port.remove_ground_object(guid); }
        }
    }
}

/// Current primary/guardian phase announcements omit towers and gazes below
/// Heroic IV after collection. Their timers, phase latches and records remain.
pub fn initial_raid_action_enabled(native_tag: u8) -> bool {
    initial_raid_action_enabled_for_rank(native_tag, 0)
}

pub fn initial_raid_action_enabled_for_rank(native_tag: u8, heroic_rank: u8) -> bool {
    heroic_rank > 3 || !matches!(native_tag, 12 | 26)
}

/// The current actor-request loop skips towers/gaze below IV before actor lookup.
/// Semantic 13 adapts towers; semantic 17 also carries unrelated native actions,
/// so gaze admission must resolve its native registry tag rather than skip 17.
/// Nested/delayed actions enter dispatch directly and retain their own rules.
pub fn queued_action_enabled(record: &RawBossAbility) -> bool {
    queued_action_enabled_for_rank(record, 0)
}

pub fn queued_action_enabled_for_rank(record: &RawBossAbility, heroic_rank: u8) -> bool {
    match record.words[0] {
        13 => initial_raid_action_enabled_for_rank(12, heroic_rank),
        17 => super::raid_native_catalog::ACTIONS.get(record.words[1] as usize)
            .map_or(true, |action| initial_raid_action_enabled_for_rank(action.native_tag, heroic_rank)),
        _ => true,
    }
}

/// One live entry for primary, guardian and delayed current actions.
pub fn dispatch_live(record: &RawBossAbility, context: CombatContext,
    rng: &mut NativeRng, counter: &mut dyn crate::native_counter::NativeCounter,
    effects: &mut PendingEffects, port: &mut impl CombatPort,
    math: &impl Math) -> Result<(), UnknownAbilityTag> {
    let mut context = context;
    if let Some(windup) = super::prediction::windup(record, context) {
        context.player = port.raid_aim(context, windup);
    }
    if super::raid_sequences::dispatch_sequence(record, context, rng, counter, effects, port, math)? {
        return Ok(());
    }
    if effects.raid_areas.dispatch_current_with_rng(record, context, port, rng, math) { return Ok(()); }
    dispatch(record, context, rng, counter, effects, port, math)
}

/// Dispatch after collecting all actor requests, in native queue order. The
/// caller validates that the actor index still exists and is alive, and passes
/// its current interpolated position/damage. Death between collection and this
/// stage suppresses the original request; the cooldown was already reset.
pub fn dispatch(record: &RawBossAbility, context: CombatContext,
                rng: &mut NativeRng, guid_counter: &mut dyn crate::native_counter::NativeCounter, effects: &mut PendingEffects,
                port: &mut impl CombatPort, math: &impl Math) -> Result<(), UnknownAbilityTag> {
    match Ability::decode(record)? {
        Ability::GroundArea { visual_spell, impact_spell, radius, delay, damage_factor } => {
            let center = Position { z: height(port, context.player.x, context.player.y), ..context.player };
            let object = ground_object(guid_counter, context.player_guid, visual_spell, radius, center);
            let guid = object.guid;
            port.create_ground_object(object);
            effects.impacts.push(Impact { source_guid: context.source_guid, impact_spell,
                center, radius, damage: damage_factor * context.effective_damage,
                created_at: context.now, resolves_at: delay + context.now, remove_object: Some(guid), raw_school: 0 });
        }
        Ability::MissileVolley { spell_id, count } => {
            if count == 0 { return Ok(()); }
            let damage = context.effective_damage * 0.45;
            for index in 0..count {
                // Native first impact still consumes its phase draw. Its
                // radius is zero, so that aim is exactly the captured player.
                let [x, y] = missile_aim_xy(index, count, context.player, rng, math);
                let center = Position { x, y, z: height(port, x, y) };
                port.cast_spell(SpellCast { source_guid: context.source_guid, spell_id,
                    target: CastTarget::Ground(center), hit_targets: vec![] });
                let delay = missile_travel_delay(spell_id, context.source, center);
                effects.raid_areas.volley_impact(context, center, delay, damage, port);
            }
        }
        Ability::Summon { count } => {
            port.yell(context.source_guid, "Minions, to me!");
            for index in 0..count {
                let angle = (index as f32 / count as f32) * std::f32::consts::TAU;
                let x = math.cos(angle) * 5.0 + context.source.x;
                let y = math.sin(angle) * 5.0 + context.source.y;
                let enemy_index = minion_enemy_index(index);
                let position = Position { x, y, z: height(port, x, y) };
                port.spawn_minion(MinionSpawn { enemy_index, position }, rng, guid_counter);
            }
        }
        Ability::AreaStrike { spell_id, radius, damage_factor } => {
            let hit = in_radius(context.source, context.player, radius);
            port.cast_spell(SpellCast { source_guid: context.source_guid, spell_id,
                target: CastTarget::None, hit_targets: if hit { vec![context.player_guid] } else { vec![] } });
            if hit { port.damage_player(context.effective_damage * damage_factor, context.source_guid, spell_id); }
        }
        Ability::Charge { spell_id } => {
            let target = Position { z: height(port, context.player.x, context.player.y), ..context.player };
            let destination = if let Some(fraction) = port.ray_fraction(context.source, target) {
                let clipped = charge_endpoint(context.source, target, fraction);
                Position { z: height(port, clipped.x, clipped.y), ..clipped }
            } else { target };
            let duration = charge_duration(context.source, destination);
            port.cast_spell(SpellCast { source_guid: context.source_guid, spell_id,
                target: CastTarget::Unit(context.player_guid), hit_targets: vec![context.player_guid] });
            // Source movement Z samples only the primary provider, unlike the
            // destination height chain. Failure retains interpolated actor Z.
            let from = Position { z: port.primary_height([context.source.x, context.source.y])
                .unwrap_or(context.source.z), ..context.source };
            let arrives_at = context.now + duration;
            port.begin_charge(Charge { source_guid: context.source_guid,
                movement: Movement { from, to: destination, started_at: context.now, duration },
                duration_ms: (duration * 1000.0) as u32,
                next_move_at: arrives_at + 0.2, attack_delay: duration + 0.3 });
            effects.impacts.push(Impact { source_guid: context.source_guid, impact_spell: 6343,
                center: destination, radius: 4.5, damage: context.effective_damage + context.effective_damage,
                created_at: context.now, resolves_at: arrives_at, remove_object: None, raw_school: 0 });
        }
    }
    Ok(())
}
