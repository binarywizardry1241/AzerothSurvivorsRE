//! Opcode/body output for the AS presentation events used by the shared world.
//! The receiver is the existing benilla-protocol parser, not a second protocol.

use super::replication::{EnginePacket, NativeMessage};
use benilla_protocol::messages::{
    MonsterMoveFacing, MoveMode, PeriodicTick, SpeedKind, opcode as op,
};
use benilla_protocol::{EntityKind, ObjectFields, SessionEvent};

/// Current AS ItemQuery helper: four NUL names follow the entry/class/subclass
/// header, then five complete six-word spell cells at fixed offsets. This
/// deliberately does not parse or reconstruct the packet's other fields.
fn item_spell_offsets(payload: &[u8]) -> Option<[usize; 5]> {
    if i32::from_le_bytes(payload.get(..4)?.try_into().ok()?) < 0 {
        return None;
    }
    let mut cursor = 12usize;
    for _ in 0..4 {
        cursor += payload.get(cursor..)?.iter().position(|byte| *byte == 0)? + 1;
    }
    payload.get(..cursor.checked_add(0x17c)?)?;
    Some(std::array::from_fn(|index| cursor + 0x104 + index * 0x18))
}

pub fn item_spell_ids(payload: &[u8]) -> Option<[u32; 5]> {
    Some(item_spell_offsets(payload)?.map(|at|
        u32::from_le_bytes(payload[at..at + 4].try_into().expect("checked spell cell"))))
}

/// Native host145b91b10 uses wire25 for valid ItemQuery responses, carrying
/// one string for each spell ordinal. Unknown registry IDs carry empty text.
pub fn item_message(packet: EnginePacket, mut lookup: impl FnMut(u32) -> Option<String>) -> NativeMessage {
    if packet.opcode == op::SMSG_ITEM_QUERY_SINGLE_RESPONSE {
        if let Some(ids) = item_spell_ids(&packet.payload) {
            return NativeMessage::ItemTemplate {
                payload: packet.payload,
                descriptions: ids.into_iter().map(|id| lookup(id).unwrap_or_default()).collect(),
            };
        }
    }
    packet.into_message()
}

/// Native guest145b53260 interns received text in its own persistent registry.
/// Host IDs select populated slots only; they are never installed as local IDs.
/// Missing/empty descriptions clear the slot and surplus strings are ignored.
pub fn remap_item_descriptions(mut payload: Vec<u8>, descriptions: &[String],
    mut intern: impl FnMut(&str) -> u32) -> Option<Vec<u8>> {
    let offsets = item_spell_offsets(&payload)?;
    for (index, at) in offsets.into_iter().enumerate() {
        let old = u32::from_le_bytes(payload[at..at + 4].try_into().expect("checked spell cell"));
        let id = if let Some(text) = descriptions.get(index).filter(|text| old != 0 && !text.is_empty()) {
            let mut text = text.clone();
            super::client_state::sanitize_text(&mut text);
            intern(&text)
        } else { 0 };
        payload[at..at + 4].copy_from_slice(&id.to_le_bytes());
    }
    Some(payload)
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum EncodeError {
    Unsupported,
    Length,
    IncompleteMovement,
    /// The semantic event does not retain the wire's ammunition inventory type.
    IncompleteAmmo,
    /// Fields disagree or exceed the representation of this packet.
    InvalidValue,
}

fn u16v(out: &mut Vec<u8>, v: u16) {
    out.extend_from_slice(&v.to_le_bytes());
}
fn u32v(out: &mut Vec<u8>, v: u32) {
    out.extend_from_slice(&v.to_le_bytes());
}
fn u64v(out: &mut Vec<u8>, v: u64) {
    out.extend_from_slice(&v.to_le_bytes());
}
fn f32v(out: &mut Vec<u8>, v: f32) {
    u32v(out, v.to_bits());
}
fn point(out: &mut Vec<u8>, v: &[f32; 3]) {
    for f in v {
        f32v(out, *f);
    }
}
fn guid(out: &mut Vec<u8>, v: u64) {
    benilla_protocol::wire::write_packed_guid(v, out).expect("Vec writes are infallible");
}

/// Convert the stock client's teleport acknowledgement to the AS ingress shape.
pub fn pack_teleport_ack(payload: &[u8]) -> Option<Vec<u8>> {
    let (actor, tail) = payload.split_first_chunk::<8>()?;
    let mut packed = Vec::with_capacity(payload.len() + 1);
    guid(&mut packed, u64::from_le_bytes(*actor));
    packed.extend_from_slice(tail);
    Some(packed)
}

fn cstr(out: &mut Vec<u8>, v: &str) {
    out.extend_from_slice(v.as_bytes());
    out.push(0);
}
fn lenstr(out: &mut Vec<u8>, v: &str) -> Result<(), EncodeError> {
    u32v(
        out,
        u32::try_from(v.len().checked_add(1).ok_or(EncodeError::Length)?)
            .map_err(|_| EncodeError::Length)?,
    );
    cstr(out, v);
    Ok(())
}
fn fields(out: &mut Vec<u8>, fields: &ObjectFields) -> Result<(), EncodeError> {
    let rows: Vec<_> = fields.raw_fields().collect();
    let blocks = rows.last().map_or(0, |(key, _)| usize::from(*key) / 32 + 1);
    out.push(u8::try_from(blocks).map_err(|_| EncodeError::Length)?);
    let mut mask = vec![0u32; blocks];
    for &(key, _) in &rows {
        mask[usize::from(key) / 32] |= 1 << (key % 32);
    }
    for block in mask {
        u32v(out, block);
    }
    for (_, value) in rows {
        u32v(out, value);
    }
    Ok(())
}
fn update(out: &mut Vec<u8>, kind: u8, id: u64) {
    u32v(out, 1);
    out.push(0);
    out.push(kind);
    guid(out, id);
}
/// The target-presence flags shared by the packet encoder and the local client.
pub fn spell_target_mask(target: Option<u64>, go_target: Option<u64>, dest: Option<[f32; 3]>) -> u16 {
    u16::from(target.is_some()) * 2
        | u16::from(go_target.is_some()) * 0x800
        | u16::from(dest.is_some()) * 0x40
}
fn targets(out: &mut Vec<u8>, target: Option<u64>, go_target: Option<u64>, dest: Option<[f32; 3]>) {
    u16v(out, spell_target_mask(target, go_target, dest));
    if let Some(target) = target.or(go_target) {
        guid(out, target);
    }
    if let Some(dest) = dest {
        point(out, &dest);
    }
}

/// The item cache drops unused stat/damage blocks but retains spell ordinals.
/// Reinsert only their specified empty forms, and reject contradictory projections.
fn item(out: &mut Vec<u8>, v: &benilla_protocol::messages::ItemInfo) -> Result<(), EncodeError> {
    if v.stats.len() > 10 || v.stats.contains(&(0, 0)) {
        return Err(EncodeError::InvalidValue);
    }
    u32v(out, v.class);
    u32v(out, v.subclass);
    cstr(out, &v.name);
    out.extend([0; 3]); // Unused localized names, as in the existing template producer.
    for n in [
        v.display_info_id,
        v.quality,
        v.flags,
        v.buy_price,
        v.sell_price,
        v.inventory_type,
        v.allowable_class as u32,
        v.allowable_race as u32,
        v.item_level,
        v.required_level,
        v.required_skill,
        v.required_skill_rank,
        v.required_spell,
        v.required_honor_rank,
        v.required_city_rank,
        v.required_rep_faction,
        v.required_rep_rank,
        v.max_count,
        v.stackable,
        v.container_slots,
    ] {
        u32v(out, n);
    }
    for index in 0..10 {
        let (kind, value) = v.stats.get(index).copied().unwrap_or((0, 0));
        u32v(out, kind);
        u32v(out, value as u32);
    }
    let first = benilla_protocol::messages::ItemDamage {
        min: v.dmg_min,
        max: v.dmg_max,
        school: v.dmg_type,
    };
    let rest = if v.dmg_max > 0.0 {
        if v.damages.first() != Some(&first) {
            return Err(EncodeError::InvalidValue);
        }
        &v.damages[1..]
    } else {
        v.damages.as_slice()
    };
    if rest.len() > 4 || rest.iter().any(|d| !(d.max > 0.0)) {
        return Err(EncodeError::InvalidValue);
    }
    for d in std::iter::once(Some(&first)).chain((0..4).map(|i| rest.get(i))) {
        f32v(out, d.map_or(0.0, |d| d.min));
        f32v(out, d.map_or(0.0, |d| d.max));
        u32v(out, d.map_or(0, |d| d.school));
    }
    u32v(out, v.armor);
    for r in v.resistances {
        u32v(out, r as u32);
    }
    u32v(out, v.delay_ms);
    u32v(out, v.ammo_type);
    f32v(out, v.ranged_mod_range);
    let mut spells = [None; 5];
    for spell in &v.spells {
        let Some(slot) = spells.get_mut(usize::from(spell.index)) else {
            return Err(EncodeError::InvalidValue);
        };
        if slot.is_some() || spell.spell_id == 0 {
            return Err(EncodeError::InvalidValue);
        }
        *slot = Some(spell);
    }
    if spells[0].is_some_and(|s| s.charges != v.spell_charges_0) {
        return Err(EncodeError::InvalidValue);
    }
    let use_spell = spells.iter().flatten().find(|s| s.trigger == 0).map(|s| {
        benilla_protocol::messages::ItemUseSpell {
            spell_id: s.spell_id,
            cooldown_ms: s.cooldown_ms,
            category: s.category,
            category_cooldown_ms: s.category_cooldown_ms,
        }
    });
    if use_spell != v.use_spell {
        return Err(EncodeError::InvalidValue);
    }
    for (index, spell) in spells.into_iter().enumerate() {
        let words = spell.map_or(
            [
                0,
                0,
                if index == 0 {
                    v.spell_charges_0 as u32
                } else {
                    0
                },
                u32::MAX,
                0,
                u32::MAX,
            ],
            |s| {
                [
                    s.spell_id,
                    s.trigger,
                    s.charges as u32,
                    s.cooldown_ms as u32,
                    s.category,
                    s.category_cooldown_ms as u32,
                ]
            },
        );
        for n in words {
            u32v(out, n);
        }
    }
    u32v(out, v.bonding);
    cstr(out, &v.description);
    for n in [
        v.page_text,
        v.language_id,
        v.page_material,
        v.start_quest,
        v.lock_id,
        v.material,
        v.sheath,
        v.random_property,
        v.block,
        v.item_set,
        v.max_durability,
        v.area,
        v.map,
        v.bag_family,
    ] {
        u32v(out, n);
    }
    Ok(())
}

/// Encode an actual presentation event. Notify/end markers have no independent
/// wire body; their owner is the surrounding UPDATE_OBJECT packet. Unsupported
/// semantic events return an error, never a made-up replacement packet.
pub fn encode(
    event: &SessionEvent,
    self_guid: Option<u64>,
) -> Result<Option<EnginePacket>, EncodeError> {
    if let SessionEvent::AttributedCombatHit { hit, attribution } = event {
        let mut packet = encode(hit, self_guid)?.ok_or(EncodeError::InvalidValue)?;
        if !benilla_protocol::messages::CombatTextAttribution::supports(packet.opcode) {
            return Err(EncodeError::InvalidValue);
        }
        attribution.append_to(&mut packet.payload);
        return Ok(Some(packet));
    }
    let mut b = Vec::new();
    let opcode = match event {
        SessionEvent::ObjectValues {
            guid: id,
            fields: rows,
        } => {
            update(&mut b, 0, *id);
            fields(&mut b, rows)?;
            op::SMSG_UPDATE_OBJECT
        }
        SessionEvent::ObjectMove {
            guid: id,
            position,
            orientation,
        } => {
            update(&mut b, 1, *id);
            b.push(0x40);
            point(&mut b, position);
            f32v(&mut b, *orientation);
            op::SMSG_UPDATE_OBJECT
        }
        SessionEvent::ObjectCreate {
            guid: id,
            kind,
            position,
            orientation,
            speeds,
            mover,
            transport_progress,
            transport,
            spline,
            fields: rows,
            ..
        } => {
            if spline.is_some()
                || transport.is_some()
                || mover.is_some_and(|v| v.flags & (0x2000 | 0x2000000 | 0x4000000 | 0x400000) != 0)
            {
                return Err(EncodeError::IncompleteMovement);
            }
            update(&mut b, 3, *id);
            b.push(match kind {
                EntityKind::Player => 4,
                EntityKind::Unit => 3,
                EntityKind::GameObject => 5,
                EntityKind::DynamicObject => 6,
                EntityKind::Corpse => 7,
                EntityKind::Other => 0,
            });
            let living = speeds.is_some();
            b.push(
                if living { 0x20 } else { 0x40 }
                    | u8::from(self_guid == Some(*id))
                    | if transport_progress.is_some() { 2 } else { 0 },
            );
            if living {
                u32v(&mut b, mover.map_or(0, |v| v.flags));
                u32v(&mut b, 0);
            }
            point(&mut b, position);
            f32v(&mut b, *orientation);
            if let Some(s) = speeds {
                if mover.is_some_and(|v| v.flags & 0x20_0000 != 0) {
                    f32v(&mut b, mover.unwrap().pitch);
                }
                u32v(&mut b, 0);
                for v in [s.walk, s.run, s.run_back, s.swim, s.swim_back, s.turn_rate] {
                    f32v(&mut b, v);
                }
            }
            if let Some(progress) = transport_progress {
                u32v(&mut b, progress.progress_ms);
            }
            fields(&mut b, rows)?;
            op::SMSG_UPDATE_OBJECT
        }
        SessionEvent::ItemCreate {
            guid: id,
            container,
            fields: rows,
        } => {
            update(&mut b, 3, *id);
            b.push(if *container { 2 } else { 1 });
            b.push(0x10);
            u32v(&mut b, 0);
            fields(&mut b, rows)?;
            op::SMSG_UPDATE_OBJECT
        }
        SessionEvent::ObjectDestroyed(id) => {
            u64v(&mut b, *id);
            op::SMSG_DESTROY_OBJECT
        }
        SessionEvent::ObjectsRemoved(ids) | SessionEvent::ObjectsNear(ids) => {
            u32v(&mut b, 1);
            b.push(0);
            b.push(if matches!(event, SessionEvent::ObjectsRemoved(_)) {
                4
            } else {
                5
            });
            u32v(
                &mut b,
                u32::try_from(ids.len()).map_err(|_| EncodeError::Length)?,
            );
            for id in ids {
                guid(&mut b, *id);
            }
            op::SMSG_UPDATE_OBJECT
        }
        SessionEvent::ObjectNotify { .. } | SessionEvent::ObjectUpdateEnd => return Ok(None),
        SessionEvent::Worldport {
            map_id,
            position,
            orientation,
            needs_ack,
        } => {
            u32v(&mut b, *map_id);
            point(&mut b, position);
            f32v(&mut b, *orientation);
            if *needs_ack {
                op::SMSG_NEW_WORLD
            } else {
                op::SMSG_LOGIN_VERIFY_WORLD
            }
        }
        SessionEvent::MonsterMove {
            guid: id,
            transport,
            start,
            spline_id,
            path,
            facing,
            stop,
            duration_ms,
            flying,
            run_mode,
        } => {
            guid(&mut b, *id);
            if let Some(t) = transport {
                guid(&mut b, *t);
            }
            point(&mut b, start);
            u32v(&mut b, *spline_id);
            b.push(if *stop {
                1
            } else {
                match facing {
                    MonsterMoveFacing::None => 0,
                    MonsterMoveFacing::Spot(_) => 2,
                    MonsterMoveFacing::Target(_) => 3,
                    MonsterMoveFacing::Angle(_) => 4,
                }
            });
            if !*stop {
                match facing {
                    MonsterMoveFacing::Spot(p) => point(&mut b, p),
                    MonsterMoveFacing::Target(id) => u64v(&mut b, *id),
                    MonsterMoveFacing::Angle(f) => f32v(&mut b, *f),
                    _ => {}
                }
                u32v(
                    &mut b,
                    u32::from(*flying) * 0x200 + u32::from(*run_mode) * 0x100,
                );
                u32v(&mut b, *duration_ms);
                let tail = if path.first() == Some(start) {
                    &path[1..]
                } else {
                    path.as_slice()
                };
                u32v(
                    &mut b,
                    u32::try_from(tail.len()).map_err(|_| EncodeError::Length)?,
                );
                if *flying {
                    for p in tail {
                        point(&mut b, p);
                    }
                } else if let Some((last, prior)) = tail.split_last() {
                    point(&mut b, last);
                    for p in prior {
                        if !(0..3).all(|axis| (last[axis] - p[axis]).is_finite()) {
                            return Err(EncodeError::IncompleteMovement);
                        }
                        let x = ((last[0] - p[0]) * 4.).round() as i32;
                        let y = ((last[1] - p[1]) * 4.).round() as i32;
                        let z = ((last[2] - p[2]) * 4.).round() as i32;
                        if !(-1024..=1023).contains(&x)
                            || !(-1024..=1023).contains(&y)
                            || !(-512..=511).contains(&z)
                        {
                            return Err(EncodeError::IncompleteMovement);
                        }
                        u32v(
                            &mut b,
                            (x as u32 & 0x7ff)
                                | ((y as u32 & 0x7ff) << 11)
                                | ((z as u32 & 0x3ff) << 22),
                        );
                    }
                }
            }
            if transport.is_some() {
                op::SMSG_MONSTER_MOVE_TRANSPORT
            } else {
                op::SMSG_MONSTER_MOVE
            }
        }
        SessionEvent::SpellStart {
            caster,
            spell_id,
            cast_flags,
            cast_time_ms,
            target,
            ammo_display_id,
        } => {
            if *cast_flags & 0x20 != 0 || ammo_display_id.is_some() {
                return Err(EncodeError::IncompleteAmmo);
            }
            guid(&mut b, *caster);
            guid(&mut b, *caster);
            u32v(&mut b, *spell_id);
            u16v(&mut b, *cast_flags);
            u32v(&mut b, *cast_time_ms);
            targets(&mut b, *target, None, None);
            op::SMSG_SPELL_START
        }
        SessionEvent::SpellGo {
            caster,
            unit_caster,
            spell_id,
            cast_flags,
            hits,
            target,
            dest,
            ammo_display_id,
            go_target,
            item_caster,
            misses,
            source,
            target_mask,
        } => {
            if *cast_flags & 0x20 != 0 || ammo_display_id.is_some() {
                return Err(EncodeError::IncompleteAmmo);
            }
            if source.is_some() || *target_mask != spell_target_mask(*target, *go_target, *dest)
                || target.is_some() && go_target.is_some()
                || (*unit_caster != 0 && *unit_caster != *caster)
                || item_caster.is_some_and(|item| item == *caster || *unit_caster == 0)
                || misses
                    .iter()
                    .any(|miss| miss.info != 11 && miss.reflect_result != 0)
            {
                return Err(EncodeError::InvalidValue);
            }
            guid(&mut b, item_caster.unwrap_or(*caster));
            guid(&mut b, *unit_caster);
            u32v(&mut b, *spell_id);
            u16v(&mut b, *cast_flags);
            b.push(u8::try_from(hits.len()).map_err(|_| EncodeError::Length)?);
            for id in hits {
                u64v(&mut b, *id);
            }
            b.push(u8::try_from(misses.len()).map_err(|_| EncodeError::Length)?);
            for miss in misses {
                u64v(&mut b, miss.target);
                b.push(miss.info);
                if miss.info == 11 {
                    b.push(miss.reflect_result);
                }
            }
            targets(&mut b, *target, *go_target, *dest);
            op::SMSG_SPELL_GO
        }
        SessionEvent::CastResult {
            spell_id,
            success,
            reason,
            arg,
        } => {
            if (*success && (reason.is_some() || arg.is_some())) || (!*success && reason.is_none())
            {
                return Err(EncodeError::InvalidValue);
            }
            u32v(&mut b, *spell_id);
            b.push(if *success { 0 } else { 2 });
            if !*success {
                b.push(reason.unwrap());
                if let Some(arg) = arg {
                    u32v(&mut b, *arg);
                }
            }
            op::SMSG_CAST_RESULT
        }
        SessionEvent::SpellDamageLog(v) => {
            guid(&mut b, v.target);
            guid(&mut b, v.attacker);
            u32v(&mut b, v.spell_id);
            u32v(&mut b, v.damage);
            b.push(v.school);
            u32v(&mut b, v.absorb);
            u32v(&mut b, v.resist as u32);
            b.extend([u8::from(v.periodic), 0]);
            u32v(&mut b, v.blocked);
            u32v(&mut b, v.hit_info);
            b.push(0);
            op::SMSG_SPELLNONMELEEDAMAGELOG
        }
        SessionEvent::SpellHealLog(v) => {
            guid(&mut b, v.target);
            guid(&mut b, v.healer);
            u32v(&mut b, v.spell_id);
            u32v(&mut b, v.amount);
            b.push(u8::from(v.critical));
            op::SMSG_SPELLHEALLOG
        }
        SessionEvent::PeriodicAuraLog(v) => {
            guid(&mut b, v.target);
            guid(&mut b, v.caster);
            u32v(&mut b, v.spell_id);
            u32v(
                &mut b,
                u32::try_from(v.ticks.len()).map_err(|_| EncodeError::Length)?,
            );
            for tick in &v.ticks {
                match tick {
                    PeriodicTick::Damage {
                        amount,
                        school,
                        absorb,
                        resist,
                    } => {
                        for n in [3, *amount, *school, *absorb, *resist as u32] {
                            u32v(&mut b, n);
                        }
                    }
                    PeriodicTick::Heal { amount } => {
                        u32v(&mut b, 8);
                        u32v(&mut b, *amount);
                    }
                    PeriodicTick::Energize { power, amount } => {
                        for n in [24, *power, *amount] {
                            u32v(&mut b, n);
                        }
                    }
                    PeriodicTick::ManaLeech {
                        power,
                        amount,
                        multiplier,
                    } => {
                        for n in [64, *power, *amount] {
                            u32v(&mut b, n);
                        }
                        f32v(&mut b, *multiplier);
                    }
                }
            }
            op::SMSG_PERIODICAURALOG
        }
        SessionEvent::AttackerState(v) => {
            u32v(&mut b, v.hit_info);
            guid(&mut b, v.attacker);
            guid(&mut b, v.victim);
            u32v(&mut b, v.damage);
            b.push(1);
            u32v(&mut b, u32::from(v.school));
            f32v(&mut b, v.damage as f32);
            u32v(&mut b, v.damage);
            u32v(&mut b, v.absorb);
            u32v(&mut b, v.resist as u32);
            u32v(&mut b, v.victim_state);
            u32v(&mut b, 0);
            u32v(&mut b, v.melee_spell_id);
            u32v(&mut b, v.blocked);
            op::SMSG_ATTACKERSTATEUPDATE
        }
        SessionEvent::SpellBook {
            spell_ids,
            cooldowns,
        } => {
            b.push(0);
            u16v(
                &mut b,
                u16::try_from(spell_ids.len()).map_err(|_| EncodeError::Length)?,
            );
            for id in spell_ids {
                u16v(
                    &mut b,
                    u16::try_from(*id).map_err(|_| EncodeError::InvalidValue)?,
                );
                u16v(&mut b, 0);
            }
            u16v(
                &mut b,
                u16::try_from(cooldowns.len()).map_err(|_| EncodeError::Length)?,
            );
            for cd in cooldowns {
                for n in [cd.spell_id, cd.item_id, cd.category] {
                    u16v(&mut b, n);
                }
                u32v(&mut b, cd.spell_cd_ms);
                u32v(&mut b, cd.category_cd_ms);
            }
            op::SMSG_INITIAL_SPELLS
        }
        SessionEvent::ActionButtons { buttons } => {
            let mut slots = [0u32; 120];
            for button in buttons {
                let Some(slot) = slots.get_mut(usize::from(button.slot)) else {
                    return Err(EncodeError::InvalidValue);
                };
                let packed = button.action | u32::from(button.kind) << 24;
                if *slot != 0 || button.action > 0x00ff_ffff || packed == 0 {
                    return Err(EncodeError::InvalidValue);
                }
                *slot = packed;
            }
            for word in slots {
                u32v(&mut b, word);
            }
            op::SMSG_ACTION_BUTTONS
        }
        SessionEvent::SpellLearned { spell_id } | SessionEvent::SpellRemoved { spell_id } => {
            u16v(
                &mut b,
                u16::try_from(*spell_id).map_err(|_| EncodeError::InvalidValue)?,
            );
            if matches!(event, SessionEvent::SpellLearned { .. }) {
                u16v(&mut b, 0); // The parser discards this unused action-bar slot.
                op::SMSG_LEARNED_SPELL
            } else {
                op::SMSG_REMOVED_SPELL
            }
        }
        SessionEvent::SpellSuperceded {
            old_spell_id,
            new_spell_id,
        } => {
            for id in [old_spell_id, new_spell_id] {
                u16v(
                    &mut b,
                    u16::try_from(*id).map_err(|_| EncodeError::InvalidValue)?,
                );
            }
            op::SMSG_SUPERCEDED_SPELL
        }
        SessionEvent::AuraDuration { slot, remaining_ms } => {
            b.push(*slot);
            u32v(&mut b, *remaining_ms as u32);
            op::SMSG_UPDATE_AURA_DURATION
        }
        SessionEvent::SpellCooldowns { caster, cooldowns } => {
            u64v(&mut b, *caster);
            for (id, ms) in cooldowns {
                u32v(&mut b, *id);
                u32v(&mut b, *ms);
            }
            op::SMSG_SPELL_COOLDOWN
        }
        SessionEvent::CooldownEvent { spell_id, caster }
        | SessionEvent::ClearCooldown { spell_id, caster } => {
            u32v(&mut b, *spell_id);
            u64v(&mut b, *caster);
            if matches!(event, SessionEvent::ClearCooldown { .. }) {
                op::SMSG_CLEAR_COOLDOWN
            } else {
                op::SMSG_COOLDOWN_EVENT
            }
        }
        SessionEvent::CooldownCheat { caster } => {
            u64v(&mut b, *caster);
            op::SMSG_COOLDOWN_CHEAT
        }
        SessionEvent::ForceSpeedChange {
            guid: id,
            kind,
            counter,
            speed,
        } => {
            guid(&mut b, *id);
            u32v(&mut b, *counter);
            f32v(&mut b, *speed);
            match kind {
                SpeedKind::Walk => op::SMSG_FORCE_WALK_SPEED_CHANGE,
                SpeedKind::Run => op::SMSG_FORCE_RUN_SPEED_CHANGE,
                SpeedKind::RunBack => op::SMSG_FORCE_RUN_BACK_SPEED_CHANGE,
                SpeedKind::Swim => op::SMSG_FORCE_SWIM_SPEED_CHANGE,
                SpeedKind::SwimBack => op::SMSG_FORCE_SWIM_BACK_SPEED_CHANGE,
                SpeedKind::TurnRate => op::SMSG_FORCE_TURN_RATE_CHANGE,
            }
        }
        SessionEvent::MoveMode {
            guid: id,
            counter,
            mode,
            apply,
        } => {
            guid(&mut b, *id);
            u32v(&mut b, *counter);
            match (mode, *apply) {
                (MoveMode::Root, true) => op::SMSG_FORCE_MOVE_ROOT,
                (MoveMode::Root, false) => op::SMSG_FORCE_MOVE_UNROOT,
                (MoveMode::WaterWalk, true) => op::SMSG_MOVE_WATER_WALK,
                (MoveMode::WaterWalk, false) => op::SMSG_MOVE_LAND_WALK,
                (MoveMode::FeatherFall, true) => op::SMSG_MOVE_FEATHER_FALL,
                (MoveMode::FeatherFall, false) => op::SMSG_MOVE_NORMAL_FALL,
                (MoveMode::Hover, true) => op::SMSG_MOVE_SET_HOVER,
                (MoveMode::Hover, false) => op::SMSG_MOVE_UNSET_HOVER,
            }
        }
        SessionEvent::KnockBack {
            guid: id,
            counter,
            launch,
        } => {
            guid(&mut b, *id);
            u32v(&mut b, *counter);
            for f in [
                launch.cos_angle,
                launch.sin_angle,
                launch.xy_speed,
                launch.zspeed,
            ] {
                f32v(&mut b, f);
            }
            op::SMSG_MOVE_KNOCK_BACK
        }
        SessionEvent::Teleport {
            guid: id,
            counter,
            position,
            orientation,
        } => {
            guid(&mut b, *id);
            u32v(&mut b, *counter);
            u32v(&mut b, 0);
            u32v(&mut b, 0);
            point(&mut b, position);
            f32v(&mut b, *orientation);
            u32v(&mut b, 0);
            op::MSG_MOVE_TELEPORT_ACK
        }
        SessionEvent::PlayerName {
            guid: id,
            name,
            race,
            gender,
            class,
        } => {
            u64v(&mut b, *id);
            cstr(&mut b, name);
            b.push(0);
            for n in [race, gender, class] {
                u32v(&mut b, *n);
            }
            op::SMSG_NAME_QUERY_RESPONSE
        }
        SessionEvent::CreatureName {
            entry,
            name,
            subname,
            creature_type,
            pet_family,
            rank,
            type_flags,
            pet_spell_list,
            display_id,
            civilian,
            racial_leader,
        } => {
            if let Some(name) = name {
                u32v(&mut b, *entry);
                cstr(&mut b, name);
                b.extend([0; 3]);
                cstr(&mut b, subname.as_deref().unwrap_or(""));
                for word in [
                    *type_flags,
                    creature_type.unwrap_or(0),
                    *pet_family,
                    *rank,
                    0,
                    *pet_spell_list,
                    *display_id,
                ] {
                    u32v(&mut b, word);
                }
                b.extend([u8::from(*civilian), u8::from(*racial_leader)]);
            } else {
                u32v(&mut b, *entry | 0x8000_0000);
            }
            op::SMSG_CREATURE_QUERY_RESPONSE
        }
        SessionEvent::GameObjectInfo {
            entry,
            type_id,
            display_id,
            name,
            data,
        } => {
            for word in [entry, type_id, display_id] {
                u32v(&mut b, *word);
            }
            cstr(&mut b, name);
            b.extend([0; 4]);
            for word in data {
                u32v(&mut b, *word as u32);
            }
            op::SMSG_GAMEOBJECT_QUERY_RESPONSE
        }
        SessionEvent::GameObjectUnknown { entry } => {
            u32v(&mut b, *entry | 0x8000_0000);
            op::SMSG_GAMEOBJECT_QUERY_RESPONSE
        }
        SessionEvent::ItemTemplate { entry, info } => {
            u32v(
                &mut b,
                *entry | if info.is_none() { 0x8000_0000 } else { 0 },
            );
            if let Some(info) = info {
                item(&mut b, info)?;
            }
            op::SMSG_ITEM_QUERY_SINGLE_RESPONSE
        }
        SessionEvent::InventoryFailure {
            reason,
            required_level,
            item_guid,
            item2_guid,
            bag_slot,
        } => {
            if *reason == 0 || (*reason == 1) != required_level.is_some() {
                return Err(EncodeError::InvalidValue);
            }
            b.push(*reason);
            if let Some(level) = required_level {
                u32v(&mut b, *level);
            }
            u64v(&mut b, *item_guid);
            u64v(&mut b, *item2_guid);
            b.push(*bag_slot);
            op::SMSG_INVENTORY_CHANGE_FAILURE
        }
        SessionEvent::GossipPoi(poi) => {
            u32v(&mut b, poi.flags);
            for value in poi.pos {
                f32v(&mut b, value);
            }
            u32v(&mut b, poi.icon);
            u32v(&mut b, poi.data);
            cstr(&mut b, &poi.name);
            op::SMSG_GOSSIP_POI
        }
        SessionEvent::ServerUnixTime { unix_time } => {
            u32v(&mut b, *unix_time);
            op::SMSG_QUERY_TIME_RESPONSE
        }
        SessionEvent::RaidTargetSet { icon, guid: id } => {
            b.extend([0, *icon]);
            u64v(&mut b, *id);
            op::MSG_RAID_TARGET_UPDATE
        }
        SessionEvent::ItemName { entry, name } => {
            if let Some(name) = name {
                u32v(&mut b, *entry);
                cstr(&mut b, name);
            } else {
                u32v(&mut b, *entry | 0x8000_0000);
            }
            op::SMSG_ITEM_NAME_QUERY_RESPONSE
        }
        SessionEvent::RaidTargetList { entries } => {
            b.push(1);
            for (icon, id) in entries {
                b.push(*icon);
                u64v(&mut b, *id);
            }
            op::MSG_RAID_TARGET_UPDATE
        }
        SessionEvent::PlaySound { sound_id } => {
            u32v(&mut b, *sound_id);
            op::SMSG_PLAY_SOUND
        }
        SessionEvent::Notification { text } => {
            cstr(&mut b, text);
            op::SMSG_NOTIFICATION
        }
        SessionEvent::Chat(v) => {
            b.push(v.chat_type);
            u32v(&mut b, v.language);
            match v.chat_type {
                0x1a | 0x59 | 0x5a | 0x0d => {
                    lenstr(&mut b, v.sender_name.as_deref().unwrap_or(""))?;
                    u64v(&mut b, v.target_guid);
                }
                0 | 1 | 5 => {
                    u64v(&mut b, v.sender_guid);
                    u64v(&mut b, v.target_guid);
                }
                0x0b | 0x0c => {
                    u64v(&mut b, v.sender_guid);
                    lenstr(&mut b, v.sender_name.as_deref().unwrap_or(""))?;
                    u64v(&mut b, v.target_guid);
                }
                0x0e => {
                    cstr(&mut b, v.channel.as_deref().unwrap_or(""));
                    u32v(&mut b, 0);
                    u64v(&mut b, v.sender_guid);
                }
                _ => u64v(&mut b, v.sender_guid),
            }
            lenstr(&mut b, &v.text)?;
            b.push(v.chat_tag);
            op::SMSG_MESSAGECHAT
        }
        SessionEvent::LoggedOut => op::SMSG_LOGOUT_COMPLETE,
        SessionEvent::LogoutResponse { reason, instant } => {
            u32v(&mut b, *reason);
            b.push(u8::from(*instant));
            op::SMSG_LOGOUT_RESPONSE
        }
        SessionEvent::LogoutCancelled => op::SMSG_LOGOUT_CANCEL_ACK,
        _ => return Err(EncodeError::Unsupported),
    };
    Ok(Some(EnginePacket { opcode, payload: b }))
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn sparse_fields_and_full_guids_roundtrip_through_the_production_decoder() {
        let event = SessionEvent::ObjectValues {
            guid: 0xf130_0001_0000_0007,
            fields: ObjectFields::from_pairs(&[(0, 7), (22, 18), (28, 42), (131, 856), (1281, 99)]),
        };
        let packet = encode(&event, None).unwrap().unwrap();
        let events = packet.decode_server().unwrap();
        assert!(matches!(&events[0],SessionEvent::ObjectValues{guid,fields}
            if *guid==0xf130_0001_0000_0007 && fields.raw_fields().collect::<Vec<_>>()
                ==vec![(0,7),(22,18),(28,42),(131,856),(1281,99)]));
    }
    #[test]
    fn spell_hits_keep_raw_guid_width_and_destination() {
        let event = SessionEvent::SpellGo {
            caster: 0x800001,
            unit_caster: 0x800001,
            spell_id: 10,
            cast_flags: 0x100,
            hits: vec![0xf130_0001_0000_0007],
            target_mask: 0x40,
            source: None,
            target: None,
            dest: Some([1., 2., 3.]),
            ammo_display_id: None,
            item_caster: None,
            go_target: None,
            misses: vec![],
        };
        let packet = encode(&event, None).unwrap().unwrap();
        assert!(
            matches!(&packet.decode_server().unwrap()[0],SessionEvent::SpellGo{hits,dest,..}
            if hits==&vec![0xf130_0001_0000_0007] && *dest==Some([1.,2.,3.]))
        );
    }
    #[test]
    fn spellbook_actions_and_cast_failure_preserve_their_distinct_wire_widths() {
        use benilla_protocol::messages::{ActionButton, SpellCooldown};
        let cooldown = SpellCooldown {
            spell_id: 133,
            item_id: 7,
            category: 12,
            spell_cd_ms: 1,
            category_cd_ms: 0x8000_0001,
        };
        let event = SessionEvent::SpellBook {
            spell_ids: vec![133, 65535],
            cooldowns: vec![cooldown],
        };
        let decoded = encode(&event, None)
            .unwrap()
            .unwrap()
            .decode_server()
            .unwrap();
        assert!(
            matches!(&decoded[0],SessionEvent::SpellBook{spell_ids,cooldowns}
            if spell_ids==&vec![133,65535] && cooldowns==&vec![cooldown])
        );
        let buttons = vec![
            ActionButton {
                slot: 0,
                action: 133,
                kind: 0,
            },
            ActionButton {
                slot: 119,
                action: 0x00ff_ffff,
                kind: 0x41,
            },
        ];
        let packet = encode(
            &SessionEvent::ActionButtons {
                buttons: buttons.clone(),
            },
            None,
        )
        .unwrap()
        .unwrap();
        assert_eq!(packet.payload.len(), 120 * 4);
        assert!(
            matches!(&packet.decode_server().unwrap()[0],SessionEvent::ActionButtons{buttons:b} if b==&buttons)
        );
        let event = SessionEvent::CastResult {
            spell_id: 133,
            success: false,
            reason: Some(0x5e),
            arg: Some(789),
        };
        assert!(matches!(
            &encode(&event, None)
                .unwrap()
                .unwrap()
                .decode_server()
                .unwrap()[0],
            SessionEvent::CastResult {
                spell_id: 133,
                success: false,
                reason: Some(0x5e),
                arg: Some(789)
            }
        ));
        assert_eq!(
            encode(
                &SessionEvent::SpellBook {
                    spell_ids: vec![65536],
                    cooldowns: vec![]
                },
                None
            ),
            Err(EncodeError::InvalidValue)
        );
        assert_eq!(
            encode(
                &SessionEvent::ActionButtons {
                    buttons: vec![ActionButton {
                        slot: 120,
                        action: 1,
                        kind: 0
                    }]
                },
                None
            ),
            Err(EncodeError::InvalidValue)
        );
    }

    #[test]
    fn query_templates_and_inventory_refusals_roundtrip_through_the_real_decoder() {
        let event = SessionEvent::CreatureName {
            entry: 42,
            name: Some("Creature".into()),
            subname: Some("Rare".into()),
            creature_type: Some(7),
            pet_family: 8,
            rank: 4,
            type_flags: 0x10,
            pet_spell_list: 11,
            display_id: 12,
            civilian: true,
            racial_leader: false,
        };
        assert!(
            matches!(&encode(&event,None).unwrap().unwrap().decode_server().unwrap()[0],
            SessionEvent::CreatureName{entry:42,name:Some(n),subname:Some(s),creature_type:Some(7),
                pet_family:8,rank:4,type_flags:0x10,pet_spell_list:11,display_id:12,civilian:true,
                racial_leader:false} if n=="Creature" && s=="Rare")
        );
        let event = SessionEvent::GameObjectInfo {
            entry: 44,
            type_id: 3,
            display_id: 57,
            name: "Chest".into(),
            data: [-7; 24],
        };
        assert!(
            matches!(&encode(&event,None).unwrap().unwrap().decode_server().unwrap()[0],
            SessionEvent::GameObjectInfo{entry:44,type_id:3,display_id:57,name,data} if name=="Chest" && data==&[-7;24])
        );
        assert!(matches!(
            &encode(&SessionEvent::GameObjectUnknown { entry: 44 }, None)
                .unwrap()
                .unwrap()
                .decode_server()
                .unwrap()[0],
            SessionEvent::GameObjectUnknown { entry: 44 }
        ));
        let event = SessionEvent::InventoryFailure {
            reason: 1,
            required_level: Some(10),
            item_guid: 0x4000_0000_0000_0042,
            item2_guid: 0x4000_0000_0000_0043,
            bag_slot: 255,
        };
        assert!(matches!(
            &encode(&event, None)
                .unwrap()
                .unwrap()
                .decode_server()
                .unwrap()[0],
            SessionEvent::InventoryFailure {
                reason: 1,
                required_level: Some(10),
                item_guid: 0x4000_0000_0000_0042,
                item2_guid: 0x4000_0000_0000_0043,
                bag_slot: 255
            }
        ));
        let poi = benilla_protocol::messages::GossipPoi {
            flags: 99,
            pos: [1.5, -2.5],
            icon: 6,
            data: 7,
            name: "Camp".into(),
        };
        let packet = encode(&SessionEvent::GossipPoi(poi.clone()), None)
            .unwrap()
            .unwrap();
        assert!(
            matches!(&packet.decode_server().unwrap()[0],SessionEvent::GossipPoi(decoded) if decoded==&poi)
        );
    }

    fn item_fixture() -> benilla_protocol::messages::ItemInfo {
        use benilla_protocol::messages::{ItemDamage, ItemInfo, ItemSpellEntry, ItemUseSpell};
        ItemInfo {
            class: 2,
            subclass: 7,
            name: "Sword".into(),
            display_info_id: 6303,
            quality: 4,
            flags: 66,
            buy_price: 4200,
            sell_price: 1050,
            inventory_type: 21,
            allowable_class: -1,
            allowable_race: 3,
            item_level: 60,
            required_level: 55,
            required_skill: 164,
            required_skill_rank: 225,
            required_spell: 5209,
            required_honor_rank: 3,
            required_city_rank: 2,
            required_rep_faction: 69,
            required_rep_rank: 4,
            max_count: 5,
            stackable: 1,
            container_slots: 0,
            stats: vec![(4, 15), (5, -3)],
            damages: vec![
                ItemDamage {
                    min: 12.5,
                    max: 25.5,
                    school: 0,
                },
                ItemDamage {
                    min: 1.,
                    max: 2.,
                    school: 2,
                },
            ],
            dmg_min: 12.5,
            dmg_max: 25.5,
            dmg_type: 0,
            armor: 17,
            resistances: [-1, 2, 3, 4, 5, 6],
            delay_ms: 1700,
            ammo_type: 0,
            ranged_mod_range: 1.5,
            spells: vec![
                ItemSpellEntry {
                    index: 0,
                    spell_id: 123,
                    trigger: 1,
                    charges: -1,
                    cooldown_ms: -1,
                    category: 3,
                    category_cooldown_ms: 10,
                },
                ItemSpellEntry {
                    index: 3,
                    spell_id: 456,
                    trigger: 0,
                    charges: 7,
                    cooldown_ms: 800,
                    category: 4,
                    category_cooldown_ms: 900,
                },
            ],
            spell_charges_0: -1,
            use_spell: Some(ItemUseSpell {
                spell_id: 456,
                cooldown_ms: 800,
                category: 4,
                category_cooldown_ms: 900,
            }),
            bonding: 1,
            description: "Rare blade".into(),
            page_text: 2,
            language_id: 3,
            page_material: 4,
            start_quest: 5,
            lock_id: 6,
            material: 7,
            sheath: 8,
            random_property: 9,
            block: 10,
            item_set: 11,
            max_durability: 12,
            area: 13,
            map: 14,
            bag_family: 15,
        }
    }

    #[test]
    fn item_templates_preserve_signed_words_sparse_spell_ordinals_and_tooltip_text() {
        let info = item_fixture();
        let packet = encode(
            &SessionEvent::ItemTemplate {
                entry: 12345,
                info: Some(Box::new(info.clone())),
            },
            None,
        )
        .unwrap()
        .unwrap();
        assert!(
            matches!(&packet.decode_server().unwrap()[0],SessionEvent::ItemTemplate{entry:12345,info:Some(decoded)}
            if decoded.as_ref()==&info)
        );
        let mut invalid = info;
        invalid.spells.push(invalid.spells[0]);
        assert_eq!(
            encode(
                &SessionEvent::ItemTemplate {
                    entry: 12345,
                    info: Some(Box::new(invalid))
                },
                None
            ),
            Err(EncodeError::InvalidValue)
        );
        assert!(matches!(
            &encode(
                &SessionEvent::ItemTemplate {
                    entry: 42,
                    info: None
                },
                None
            )
            .unwrap()
            .unwrap()
            .decode_server()
            .unwrap()[0],
            SessionEvent::ItemTemplate {
                entry: 42,
                info: None
            }
        ));
    }

    #[test]
    fn item_text_delivery_rebinds_sparse_ids_without_rewriting_other_template_bytes() {
        let packet = encode(&SessionEvent::ItemTemplate { entry: 12345,
            info: Some(Box::new(item_fixture())) }, None).unwrap().unwrap();
        assert_eq!(item_spell_ids(&packet.payload), Some([123, 0, 0, 456, 0]));
        let original = packet.payload.clone();
        let message = item_message(packet, |id| match id {
            123 => Some("health |Hlink|h".into()),
            456 => Some("recipient jewelry".into()),
            _ => None,
        });
        let bytes = super::super::replication::encode_message(&message).unwrap();
        let (NativeMessage::ItemTemplate { payload, descriptions }, _) =
            super::super::replication::decode_message(&bytes).unwrap() else { panic!("carrier"); };
        let mut asked = Vec::new();
        let rewritten = remap_item_descriptions(payload, &descriptions, |text| {
            asked.push(text.to_owned());
            0x00f0_0000 + asked.len() as u32
        }).unwrap();
        assert_eq!(asked, ["health ||Hlink||h", "recipient jewelry"]);
        assert_eq!(item_spell_ids(&rewritten), Some([0x00f0_0001, 0, 0, 0x00f0_0002, 0]));
        let mut expected = original;
        for (at, id) in item_spell_offsets(&expected).unwrap().into_iter()
            .zip([0x00f0_0001u32, 0, 0, 0x00f0_0002, 0]) {
            expected[at..at + 4].copy_from_slice(&id.to_le_bytes());
        }
        assert_eq!(rewritten, expected);
        let decoded = EnginePacket { opcode: op::SMSG_ITEM_QUERY_SINGLE_RESPONSE,
            payload: rewritten }.decode_server().unwrap();
        assert!(matches!(&decoded[0], SessionEvent::ItemTemplate { info: Some(info), .. }
            if info.spells[0].spell_id == 0x00f0_0001 && info.spells[1].index == 3
            && info.spells[1].spell_id == 0x00f0_0002 && info.stats == [(4, 15), (5, -3)]));
    }

    #[test]
    fn item_carrier_clears_absent_text_and_rejects_missing_spell_cells_before_interning() {
        let packet = encode(&SessionEvent::ItemTemplate { entry: 12345,
            info: Some(Box::new(item_fixture())) }, None).unwrap().unwrap();
        let descriptions = vec!["".into(), "ignored empty slot".into(), "".into(),
            format!("{}é", "x".repeat(4095)), "".into(), "surplus".into()];
        let mut asked = Vec::new();
        let rewritten = remap_item_descriptions(packet.payload.clone(), &descriptions, |text| {
            asked.push(text.to_owned()); 0x00f0_0031
        }).unwrap();
        assert_eq!(asked, ["x".repeat(4095)]);
        assert_eq!(item_spell_ids(&rewritten), Some([0, 0, 0, 0x00f0_0031, 0]));
        let start = item_spell_offsets(&packet.payload).unwrap()[0] - 0x104;
        for end in 0..start + 0x17c {
            assert!(remap_item_descriptions(packet.payload[..end].to_vec(), &descriptions,
                |_| panic!("malformed template interned text")).is_none());
        }
        let unknown = EnginePacket { opcode: op::SMSG_ITEM_QUERY_SINGLE_RESPONSE,
            payload: 0x8000_0031u32.to_le_bytes().to_vec() };
        assert!(matches!(item_message(unknown, |_| panic!("unknown entry lookup")),
            NativeMessage::Lifecycle(super::super::server_party::LifecyclePacket::EngineCommand { .. })));
    }

    #[test]
    fn ammo_cannot_be_reconstructed_from_a_display_id_without_inventory_type() {
        let event = SessionEvent::SpellStart {
            caster: 1,
            spell_id: 75,
            cast_flags: 0x20,
            cast_time_ms: 500,
            target: Some(2),
            ammo_display_id: Some(5996),
        };
        assert_eq!(encode(&event, None), Err(EncodeError::IncompleteAmmo));
        let event = SessionEvent::SpellGo {
            caster: 1,
            unit_caster: 1,
            item_caster: None,
            spell_id: 75,
            cast_flags: 0x120,
            hits: vec![2],
            target_mask: 2,
            source: None,
            misses: vec![],
            target: Some(2),
            go_target: None,
            dest: None,
            ammo_display_id: Some(5996),
        };
        assert_eq!(encode(&event, None), Err(EncodeError::IncompleteAmmo));
    }

    #[test]
    fn item_name_reply_uses_a_nul_terminated_name_or_high_bit_refusal() {
        for (name, expected) in [
            (Some("Linen".into()), &b"\x19\0\0\0Linen\0"[..]),
            (None, &b"\x19\0\0\x80"[..]),
        ] {
            let event = SessionEvent::ItemName { entry: 25, name: name.clone() };
            let packet = encode(&event, None).unwrap().unwrap();
            assert_eq!(packet.opcode, op::SMSG_ITEM_NAME_QUERY_RESPONSE);
            assert_eq!(packet.payload, expected);
            assert!(matches!(&packet.decode_server().unwrap()[..],
                [SessionEvent::ItemName { entry: 25, name: actual }] if *actual == name));
        }
    }

    #[test]
    fn packed_ground_paths_round_to_quarter_yards_and_refuse_wrapping_offsets() {
        let make = |path| SessionEvent::MonsterMove {
            guid: 42,
            transport: None,
            start: [0.; 3],
            spline_id: 99,
            path,
            facing: MonsterMoveFacing::None,
            stop: false,
            duration_ms: 1000,
            flying: false,
            run_mode: true,
        };
        let event = make(vec![[0.; 3], [1.13, 2.12, 3.], [10., 10., 10.]]);
        assert!(
            matches!(&encode(&event,None).unwrap().unwrap().decode_server().unwrap()[0],
            SessionEvent::MonsterMove{path,..} if path==&vec![[0.;3],[1.25,2.,3.],[10.,10.,10.]])
        );
        assert_eq!(
            encode(&make(vec![[0.; 3], [-500., 0., 0.], [0.; 3]]), None),
            Err(EncodeError::IncompleteMovement)
        );
    }
    #[test]
    fn actual_world_and_combat_packet_forms_leave_no_unread_tail() {
        use benilla_protocol::MoveSpeeds;
        use benilla_protocol::messages::{
            AttackerState, SpellDamageLog, SpellGoMiss, SpellHealLog,
        };
        let id = 0xf130_0001_0000_0007;
        let fields = ObjectFields::from_pairs(&[(0, 7), (131, 856), (4, 1.0f32.to_bits())]);
        let events = vec![
            SessionEvent::Worldport {
                map_id: 489,
                position: [1., 2., 3.],
                orientation: 4.,
                needs_ack: false,
            },
            SessionEvent::ObjectCreate {
                guid: id,
                kind: EntityKind::Unit,
                display_id: Some(856),
                position: [1., 2., 3.],
                orientation: 4.,
                scale: 1.,
                speeds: Some(MoveSpeeds {
                    walk: 2.5,
                    run: 7.,
                    run_back: 4.5,
                    swim: 4.72,
                    swim_back: 2.5,
                    turn_rate: 3.14,
                }),
                mover: None,
                transport_progress: None,
                transport: None,
                spline: None,
                fields,
            },
            SessionEvent::SpellGo {
                caster: 1,
                unit_caster: 1,
                item_caster: Some(0x4000_0000_0000_0042),
                spell_id: 133,
                cast_flags: 0x100,
                hits: vec![id],
                target_mask: 0x840,
                source: None,
                misses: vec![SpellGoMiss {
                    target: 2,
                    info: 11,
                    reflect_result: 2,
                }],
                target: None,
                go_target: Some(id),
                dest: Some([1., 2., 3.]),
                ammo_display_id: None,
            },
            SessionEvent::AttackerState(AttackerState {
                attacker: 1,
                victim: id,
                hit_info: 0x20,
                damage: 10,
                victim_state: 1,
                absorb: 3,
                resist: -4,
                blocked: 5,
                melee_spell_id: 0,
                school: 0,
            }),
            SessionEvent::SpellDamageLog(SpellDamageLog {
                target: id,
                attacker: 1,
                spell_id: 133,
                damage: 10,
                school: 2,
                absorb: 3,
                resist: -4,
                periodic: true,
                blocked: 5,
                hit_info: 2,
            }),
            SessionEvent::SpellHealLog(SpellHealLog {
                target: 1,
                healer: id,
                spell_id: 2061,
                amount: 40,
                critical: true,
            }),
            SessionEvent::PeriodicAuraLog(benilla_protocol::messages::PeriodicAuraLog {
                target: id,
                caster: 1,
                spell_id: 139,
                ticks: vec![
                    PeriodicTick::Damage {
                        amount: 5,
                        school: 2,
                        absorb: 3,
                        resist: -4,
                    },
                    PeriodicTick::Heal { amount: 6 },
                    PeriodicTick::Energize {
                        power: 0,
                        amount: 7,
                    },
                    PeriodicTick::ManaLeech {
                        power: 0,
                        amount: 8,
                        multiplier: 1.5,
                    },
                ],
            }),
            SessionEvent::SpellCooldowns {
                caster: 1,
                cooldowns: vec![(133, 5000)],
            },
            SessionEvent::CooldownCheat { caster: id },
            SessionEvent::ForceSpeedChange {
                guid: 1,
                kind: SpeedKind::Run,
                counter: 99,
                speed: 7.,
            },
            SessionEvent::Teleport {
                guid: 1,
                counter: 100,
                position: [1., 2., 3.],
                orientation: 4.,
            },
            SessionEvent::RaidTargetList {
                entries: vec![(6, id)],
            },
            SessionEvent::ItemTemplate {
                entry: 42,
                info: Some(Box::new(item_fixture())),
            },
            SessionEvent::LoggedOut,
        ];
        for event in events {
            let packet = encode(&event, Some(1)).unwrap().unwrap();
            let (decoded, tail) =
                benilla_protocol::messages::parse_server_with_tail(packet.opcode, &packet.payload)
                    .unwrap();
            assert_eq!(tail, 0, "unread bytes for {event:?}");
            assert!(!benilla_protocol::decode(decoded).is_empty());
        }
    }
    #[test]
    fn aura_duration_keeps_the_real_slot_and_signed_expiry() {
        for remaining_ms in [-1, 0, 15_000] {
            let packet = encode(
                &SessionEvent::AuraDuration {
                    slot: 47,
                    remaining_ms,
                },
                None,
            )
            .unwrap()
            .unwrap();
            assert_eq!(packet.opcode, op::SMSG_UPDATE_AURA_DURATION);
            assert_eq!(packet.payload[0], 47);
            assert_eq!(&packet.payload[1..], &remaining_ms.to_le_bytes());
            let (decoded, tail) =
                benilla_protocol::messages::parse_server_with_tail(packet.opcode, &packet.payload)
                    .unwrap();
            assert_eq!(tail, 0);
            assert!(
                matches!(&benilla_protocol::decode(decoded)[0],SessionEvent::AuraDuration{slot:47,remaining_ms:got} if *got==remaining_ms)
            );
        }
    }

    #[test]
    fn cooldown_reset_preserves_the_complete_named_unit_guid() {
        let caster = 0xf130_1234_0000_0042;
        let packet = encode(&SessionEvent::CooldownCheat { caster }, None)
            .unwrap()
            .unwrap();
        assert_eq!(packet.opcode, op::SMSG_COOLDOWN_CHEAT);
        assert_eq!(packet.payload, caster.to_le_bytes());
        let (decoded, tail) =
            benilla_protocol::messages::parse_server_with_tail(packet.opcode, &packet.payload)
                .unwrap();
        assert_eq!(tail, 0);
        assert!(matches!(&benilla_protocol::decode(decoded)[0],
            SessionEvent::CooldownCheat { caster: got } if *got == caster));
    }
}
