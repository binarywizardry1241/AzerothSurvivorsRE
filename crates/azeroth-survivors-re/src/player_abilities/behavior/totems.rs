//! Current kind-ten summons:1454e7cf6 creation,1454a422c..1454a52e3 ticks.
//! The actual world supplies object packets and the shared hit/death owner.

use super::{dispatch::CastContext, execution::{distance_squared, HitContext,
    PendingHit, PendingHits}, periodic::area_radius, targeting::{self, Target}, unit24,
    hit_passives::HitPassivePort, state::Vitals, totem_passives, RuntimeInstance};
use crate::{bosses::abilities::{native_missile_speed, CastTarget, SpellCast},
    enemies::{NativeRng, Position}, player_abilities::{catalog::StatusEffect,
    damage::{effective_power, scaled_duration}}};

#[derive(Clone, Copy, Debug)]
pub struct Totem<'a> {
    /// The selected0.105.0 native136-byte summon row starts with a complete
    ///104-byte instance.
    /// At each pulse an equipped learned instance of the same key takes
    /// precedence; this captured value is the original fallback.
    pub captured: RuntimeInstance<'a>,
    pub guid: u64,
    pub position: Position,
    pub expires_at: f32,
    pub next_tick_at: f32,
    pub interval: f32,
}

/// Current0.127.0 per-key population limit; native145c62b89 admits at most29
/// existing matches before first-match expiry/destruction and replacement.
pub const KIND_LIMIT: usize = 30;

impl<'a> Totem<'a> {
    pub fn new(instance: &RuntimeInstance<'a>, now: f32, counter: &mut dyn crate::native_counter::NativeCounter, position: Position) -> Self {
        let serial=counter.next();
        Self { captured: *instance, guid: 0xf130_0025_1c00_0000 | u64::from(serial & 0x00ff_ffff),
            position, expires_at: now + scaled_duration(instance), next_tick_at: now + 0.5,
            interval: instance.definition.duration / instance.definition.ticks.max(1) as f32 }
    }
}

/// Current0.127.0 145c62b09..145c62c4b counts equal ability keys and
/// evicts exactly the first matching row when at least30 already exist.
/// Keep the other rows in order, including when presented an overfull list.
pub fn remove_for_kind_limit<'a>(rows: &mut Vec<Totem<'a>>, key: &str) -> Option<Totem<'a>> {
    if rows.iter().filter(|row| row.captured.definition.key == key).count() < KIND_LIMIT {
        return None;
    }
    let index = rows.iter().position(|row| row.captured.definition.key == key)?;
    Some(rows.remove(index))
}

#[derive(Clone, Debug, PartialEq)]
pub struct SummonedObject {
    pub guid: u64,
    pub position: Position,
    pub fields: Vec<(u16, u32)>,
}

/// Exact object-field keys/values in1454e9d88..1454ea753. The original
/// creature entry is9500 for both spells; model4589 is Magma,4587 Searing.
/// AbilityDefinition.pulse_spell_id is the pulse spell, not this creature entry.
pub fn object(totem: &Totem<'_>, player_guid: u64, race: u8, player_field: u32) -> SummonedObject {
    let model = if totem.captured.definition.key == "magma_totem" { 4589 } else { 4587 };
    let faction = match race { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 115, 8 => 116, _ => 1 };
    SummonedObject { guid: totem.guid, position: totem.position, fields: vec![
        (0, totem.guid as u32), (1, (totem.guid >> 32) as u32), (2, 9), (3, 9500),
        (4, 1.0_f32.to_bits()), (12, player_guid as u32), (13, (player_guid >> 32) as u32),
        (14, player_guid as u32), (15, (player_guid >> 32) as u32),
        (22, 5), (28, 5), (34, player_field), (35, faction), (46, 2),
        (129, 0.4_f32.to_bits()), (130, 1.0_f32.to_bits()), (131, model), (132, model),
    ] }
}

/// Expire first, then at most one pulse per surviving row/frame, advancing the
/// old deadline even with no victim. Upgrades and talent modifiers are read
/// from the current matching learned instance when it still exists. Native
/// Call of Flame and talent22 healing run here before removal/pulse packets.
pub fn tick_totems<'a>(context: CastContext, rows: &mut Vec<Totem<'a>>,
                   pending: &mut PendingHits, vitals: &mut Vitals, provenance_count: usize,
                   rng: &mut NativeRng, port: &mut impl HitPassivePort<'a>) {
    let mut index = 0;
    while index < rows.len() {
        if context.now >= rows[index].expires_at {
            let row = rows.remove(index);
            port.expire_totem(row, context, rng);
            continue;
        }
        if !(context.now >= rows[index].next_tick_at) { index += 1; continue; }
        rows[index].next_tick_at += rows[index].interval;
        let row = rows[index];
        let instance = port.learned().iter().find(|i| i.definition.key == row.captured.definition.key)
            .copied().unwrap_or(row.captured);
        if let Some(action) = totem_passives::prepulse_heal_for_rank(port.talent_effects(),
            provenance_count, vitals, port.heroic_rank()) { port.emit_healing(action); }
        // Earlier explosions and hit procs can remove actors. Sample the real
        // live collection for this pulse, retaining its native HP/metadata.
        let targets: Vec<Target> = port.targets();
        let definition = instance.definition;
        let power = effective_power(&instance, &context.power);
        let effect = StatusEffect { tag: 0, value: 0.0, duration: 0.0 };
        if definition.radius > 0.0 {
            let radius = area_radius(&instance, context.global_area);
            let selected = targeting::radius_targets(&targets, context.now, row.position, radius, &[]);
            port.cast_spell(SpellCast { source_guid: row.guid, spell_id: definition.pulse_spell_id,
                target: CastTarget::None, hit_targets: selected.iter().map(|t| t.actor.guid).collect() });
            for target in selected {
                let roll = unit24(rng);
                let stats = port.critical();
                let critical = roll < stats.chance;
                port.direct_hit(PendingHit { context: HitContext::default(), target_guid: target.actor.guid,
                    source_guid: row.guid, effect, resolves_at: context.now,
                    spell_id: definition.pulse_spell_id,
                    damage: if critical { stats.multiplier * power } else { power },
                    critical, damages_player: false, school: definition.school }, rng);
            }
        } else {
            let mut selected = targeting::ordered_targets(&targets, context.now, row.position, definition.range);
            selected.truncate(super::execution::target_count(&instance, context.global_target_bonus) as usize);
            for target in selected {
                port.cast_spell(SpellCast { source_guid: row.guid, spell_id: definition.pulse_spell_id,
                    target: CastTarget::Unit(target.actor.guid), hit_targets: vec![target.actor.guid] });
                let roll = unit24(rng);
                let stats = port.critical();
                let critical = roll < stats.chance;
                let speed = native_missile_speed(definition.pulse_spell_id).max(1.0);
                let travel = distance_squared(row.position, target.actor.movement.position_at(context.now)).sqrt() / speed;
                pending.0.push(PendingHit { context: HitContext::default(), target_guid: target.actor.guid,
                    source_guid: row.guid, effect, resolves_at: travel + context.now,
                    spell_id: definition.pulse_spell_id,
                    damage: if critical { stats.multiplier * power } else { power },
                    critical, damages_player: false, school: definition.school });
            }
        }
        index += 1;
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::player_abilities::AbilityDefinition;

    /// These are observations from the selected native instructions, not
    /// expected values generated by the Rust implementation under test.
    #[test]
    fn kind_limit_matches_native_vectors() {
        let vectors: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/totem-cap/native-vectors.json"
        )).unwrap();
        for case in vectors["cap_cases"].as_array().unwrap() {
            let key = case["key"].as_str().unwrap();
            let other = if key == "magma_totem" { "searing_totem" } else { "magma_totem" };
            let count = case["existing_same_kind"].as_u64().unwrap();
            let mixed = case["mixed"].as_bool().unwrap();
            let mut keys = Vec::new();
            if mixed { keys.extend([other, other]); }
            for i in 0..count {
                keys.push(key);
                if mixed && i % 7 == 0 { keys.push(other); }
            }
            let mut rows = keys.iter().enumerate().map(|(i, key)| Totem {
                captured: RuntimeInstance::learned(AbilityDefinition::by_key(key).unwrap()),
                guid: i as u64 + 100,
                position: Position { x: i as f32, y: -(i as f32), z: 11.0 },
                expires_at: 1000.0, next_tick_at: 0.0, interval: 1.0,
            }).collect::<Vec<_>>();
            let removed = remove_for_kind_limit(&mut rows, key);
            let events = case["events"].as_array().unwrap();
            assert_eq!(removed.map(|row| row.guid), events.first().map(|event| event[1].as_u64().unwrap()));
            let expected = case["survivor_guids"].as_array().unwrap().iter()
                .map(|value| value.as_u64().unwrap()).collect::<Vec<_>>();
            assert_eq!(rows.iter().map(|row| row.guid).collect::<Vec<_>>(), expected);
        }
    }
}
