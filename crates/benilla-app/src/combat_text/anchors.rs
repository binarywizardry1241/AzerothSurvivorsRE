//! The addon hit stream is independent of the stock floating-number renderer.

use std::collections::{HashMap, VecDeque};
use std::sync::{Arc, Mutex};

use benilla_protocol::{
    messages::{CombatTextAttribution, PeriodicTick},
    SessionEvent,
};
use benilla_ui::{
    mlua::{self, Lua, Table, Value},
    script::UiScript,
};
use benilla_world::{frame_pace::FrameStep, view::WorldCamera, world_map::CurrentMap};
use bevy::ecs::message::MessageCursor;
use bevy::{camera::CameraProjection, prelude::*};

use crate::{
    creature_anim::SwingImpact,
    names::NameCache,
    net::{GuidIndex, ObjectStore, SelfGuid},
    ui_action::Spells,
    ui_script::{seam_scale, HostClock, UiPassState, UiScreen},
    video::Widescreen,
};

const CAPACITY: usize = 4096;
const LIMIT: usize = 256;
const RETENTION: f64 = 5.0;

#[derive(Resource, Default)]
pub(crate) struct CombatTextAnchors(Arc<Mutex<Stream>>, Mutex<MessageCursor<SwingImpact>>);

#[derive(Default)]
struct Stream {
    epoch: u64,
    world_epoch: u64,
    vm: u64,
    world: Option<u32>,
    run: Option<u64>,
    ready: bool,
    subscribed: Option<f64>,
    sequence: u64,
    anchor_sequence: u64,
    target_sequence: u64,
    camera_sample: u64,
    frame_current: bool,
    camera: Option<View>,
    hero: Option<Vec3>,
    events: VecDeque<Event>,
    anchors: VecDeque<Anchor>,
    targets: HashMap<u64, TargetLife>,
    resource_evictions: HashMap<u64, f64>,
    receiving_melee: Option<PendingMelee>,
    pending_melee: VecDeque<(u64, PendingMelee)>,
}

struct Event {
    sequence: u64,
    time: f64,
    target: u64,
    target_life: Option<u64>,
    anchor: Option<u64>,
    target_name: Option<String>,
    source: u64,
    source_kind: &'static str,
    spell: Option<u32>,
    spell_name: Option<String>,
    icon: Option<String>,
    critical: bool,
    periodic: bool,
    reflected: bool,
    damage_type: &'static str,
    school_mask: Option<u32>,
    outcome: Outcome,
    attribution: Option<CombatTextAttribution>,
}

#[derive(Clone, Copy)]
enum Outcome {
    Damage(u32),
    Miss(&'static str),
}

struct Anchor {
    sequence: u64,
    born: f64,
    target: u64,
    entity: Entity,
    impact: Spot,
    follow: Spot,
    state: TargetState,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum TargetState {
    Alive,
    Dead,
    Unavailable,
}

struct TargetLife {
    entity: Entity,
    id: u64,
    state: TargetState,
}

#[derive(Clone, Copy)]
struct Spot {
    feet: Vec3,
    overhead: Vec3,
}

struct View {
    clip_from_world: Mat4,
    position: Vec3,
    right: Vec3,
    forward: Vec3,
    viewport: Vec2,
    near: f32,
    far: f32,
}

impl Stream {
    fn reset(&mut self, vm: u64, world: Option<u32>, run: Option<u64>) {
        let epoch = self.epoch.wrapping_add(1);
        let world_epoch = self
            .world_epoch
            .wrapping_add(u64::from(self.world != world));
        *self = Self {
            epoch,
            world_epoch,
            vm,
            world,
            run,
            ..Self::default()
        };
    }

    fn prune(&mut self, now: f64) {
        while self
            .events
            .front()
            .is_some_and(|event| now - event.time > RETENTION)
        {
            self.events.pop_front();
        }
        while self
            .anchors
            .front()
            .is_some_and(|anchor| now - anchor.born > RETENTION)
        {
            self.anchors.pop_front();
        }
        self.resource_evictions
            .retain(|_, born| now - *born <= RETENTION);
    }

    fn handle(&self, kind: char, sequence: u64) -> String {
        format!("{kind}{}.{sequence}", self.epoch)
    }

    fn world_handle(&self, map: u32) -> String {
        format!("w{}.{map}", self.world_epoch)
    }

    fn target_life(&mut self, guid: u64, entity: Entity, current: TargetState) -> u64 {
        if let Some(life) = self.targets.get_mut(&guid) {
            if life.entity == entity
                && !(life.state == TargetState::Dead && current == TargetState::Alive)
            {
                life.state = current;
                return life.id;
            }
        }
        self.target_sequence += 1;
        self.targets.insert(
            guid,
            TargetLife {
                entity,
                id: self.target_sequence,
                state: current,
            },
        );
        self.target_sequence
    }
}

fn get_handle(raw: &str, kind: char) -> Option<(u64, u64)> {
    let (epoch, sequence) = raw.strip_prefix(kind)?.split_once('.')?;
    Some((epoch.parse().ok()?, sequence.parse().ok()?))
}

fn err(lua: &Lua, code: &str, message: &str) -> mlua::Result<(Option<Table>, Option<Table>)> {
    let error = lua.create_table()?;
    error.set("code", code)?;
    error.set("message", message)?;
    Ok((None, Some(error)))
}

impl CombatTextAnchors {
    pub(crate) fn install_lua(&self, script: &UiScript) -> mlua::Result<()> {
        {
            let mut state = self.0.lock().expect("combat text state");
            let world = state.world;
            let run = state.run;
            state.reset(script.session(), world, run);
        }
        let events = Arc::clone(&self.0);
        let projection = Arc::clone(&self.0);
        let lua = script.lua();
        lua.globals().set(
            "AZS_NativeCombatTextEvents",
            lua.create_function(move |lua, (cursor, limit, now): (Value, Value, f64)| {
                let limit = match limit {
                    Value::Nil => LIMIT,
                    Value::Integer(n) if (1..=LIMIT as i64).contains(&n) => n as usize,
                    Value::Number(n) if (1.0..=LIMIT as f64).contains(&n) && n.fract() == 0.0 => {
                        n as usize
                    }
                    _ => {
                        return err(
                            lua,
                            "INVALID_ARGUMENT",
                            "limit must be a whole number from 1 to 256",
                        )
                    }
                };
                let mut state = events.lock().expect("combat text state");
                let sequence = match cursor {
                    Value::Nil => state.sequence,
                    Value::String(value) => {
                        let Ok(value) = value.to_str() else {
                            return err(lua, "INVALID_ARGUMENT", "not a cursor of this API");
                        };
                        let Some((epoch, sequence)) = get_handle(&value, 'c') else {
                            return err(lua, "INVALID_ARGUMENT", "not a cursor of this API");
                        };
                        if epoch != state.epoch {
                            return err(lua, "STREAM_CHANGED", "this stream has ended");
                        }
                        if sequence > state.sequence {
                            return err(lua, "INVALID_ARGUMENT", "not a cursor of this stream");
                        }
                        sequence
                    }
                    _ => return err(lua, "INVALID_ARGUMENT", "cursor must be nil or a string"),
                };
                let Some(map) = state.world else {
                    return err(lua, "NOT_IN_WORLD", "not in the world");
                };
                if !state.ready {
                    return err(lua, "NOT_READY", "the feed starts with the first frame");
                }
                state.subscribed = Some(now);
                state.prune(now);
                let entries = lua.create_table()?;
                let mut next = sequence;
                let mut dropped = 0;
                for (index, row) in state
                    .events
                    .iter()
                    .filter(|row| row.sequence > sequence)
                    .take(limit)
                    .enumerate()
                {
                    dropped += row.sequence - next - 1;
                    next = row.sequence;
                    entries.raw_set(index + 1, event_table(lua, &state, row)?)?;
                }
                let more = state.events.back().is_some_and(|row| row.sequence > next);
                if !more {
                    dropped += state.sequence - next;
                    next = state.sequence;
                }
                let batch = lua.create_table()?;
                batch.set("apiVersion", 1)?;
                batch.set("streamId", state.handle('s', 0))?;
                batch.set("worldId", state.world_handle(map))?;
                batch.set("clockSeconds", now)?;
                batch.set("cursor", state.handle('c', next))?;
                batch.set("events", entries)?;
                batch.set("hasMore", more)?;
                batch.set("droppedCount", dropped)?;
                Ok((Some(batch), None))
            })?,
        )?;
        lua.globals().set(
            "AZS_NativeCombatTextProject",
            lua.create_function(
                move |lua, (handles, mode, now, seat): (Value, Value, f64, Option<Table>)| {
                    let follow = match mode {
                        Value::String(mode) if mode.as_bytes().as_ref() == b"follow" => true,
                        Value::String(mode) if mode.as_bytes().as_ref() == b"impact" => false,
                        _ => {
                            return err(
                                lua,
                                "INVALID_ARGUMENT",
                                "mode must be \"impact\" or \"follow\"",
                            )
                        }
                    };
                    let Value::Table(handles) = handles else {
                        return err(
                            lua,
                            "INVALID_ARGUMENT",
                            "anchorIds must be an array of handles",
                        );
                    };
                    let count = handles.raw_len();
                    if count > LIMIT {
                        return err(lua, "INVALID_ARGUMENT", "at most 256 anchors a call");
                    }
                    for pair in handles.pairs::<Value, Value>() {
                        let (key, _) = pair?;
                        match key {
                            Value::Integer(n) if n > 0 && n as usize <= count => (),
                            Value::Number(n)
                                if n >= 1.0 && n <= count as f64 && n.fract() == 0.0 =>
                            {
                                ()
                            }
                            _ => {
                                return err(
                                    lua,
                                    "INVALID_ARGUMENT",
                                    "anchorIds must be a dense array",
                                )
                            }
                        }
                    }
                    let mut state = projection.lock().expect("combat text state");
                    let Some(map) = state.world else {
                        return err(lua, "NOT_IN_WORLD", "not in the world");
                    };
                    if !state.ready {
                        return err(lua, "NOT_READY", "the feed starts with the first frame");
                    }
                    state.prune(now);
                    let entries = lua.create_table()?;
                    for index in 1..=count {
                        let raw = match handles.raw_get::<Value>(index)? {
                            Value::String(raw) => raw,
                            Value::Nil => {
                                return err(
                                    lua,
                                    "INVALID_ARGUMENT",
                                    "anchorIds must be a dense array",
                                )
                            }
                            _ => {
                                return err(
                                    lua,
                                    "INVALID_ARGUMENT",
                                    "every anchorId must be a string",
                                )
                            }
                        };
                        let parsed = raw.to_str().ok().and_then(|value| get_handle(&value, 'a'));
                        let entry = lua.create_table()?;
                        entry.set("anchorId", raw)?;
                        project_entry(&state, &entry, parsed, follow, seat.as_ref())?;
                        entries.raw_set(index, entry)?;
                    }
                    let batch = lua.create_table()?;
                    batch.set("apiVersion", 1)?;
                    batch.set("streamId", state.handle('s', 0))?;
                    batch.set("worldId", state.world_handle(map))?;
                    batch.set("cameraSampleId", state.handle('p', state.camera_sample))?;
                    batch.set("clockSeconds", now)?;
                    batch.set("frameCurrent", state.frame_current)?;
                    batch.set("entries", entries)?;
                    Ok((Some(batch), None))
                },
            )?,
        )?;
        Ok(())
    }

    pub(crate) fn frame_current(&self, current: bool) {
        self.0.lock().expect("combat text state").frame_current = current;
    }

    pub(crate) fn bind_melee(&self, seq: u64) {
        let mut state = self.0.lock().expect("combat text state");
        if let Some(pending) = state.receiving_melee.take() {
            if state.pending_melee.len() == CAPACITY {
                state.pending_melee.pop_front();
            }
            state.pending_melee.push_back((seq, pending));
        }
    }
}

fn event_table(lua: &Lua, state: &Stream, row: &Event) -> mlua::Result<Table> {
    let table = lua.create_table()?;
    table.set("eventId", state.handle('e', row.sequence))?;
    table.set("presentedAt", row.time)?;
    table.set("targetUnitId", u64::from(row.target as u32))?;
    table.set("targetName", row.target_name.as_deref())?;
    table.set("sourceId", format!("u{}", row.source))?;
    table.set("sourceKind", row.source_kind)?;
    table.set("spellId", row.spell)?;
    table.set("abilityName", row.spell_name.as_deref())?;
    table.set("icon", row.icon.as_deref())?;
    table.set("damageType", row.damage_type)?;
    table.set("schoolMask", row.school_mask)?;
    table.set("critical", row.critical)?;
    table.set("periodic", row.periodic)?;
    table.set("reflected", row.reflected)?;
    if let Some(life) = row.target_life {
        table.set("targetId", state.handle('u', life))?;
    }
    if let Some(anchor) = row.anchor {
        table.set("anchorId", state.handle('a', anchor))?;
        table.set("anchorStatus", "ready")?;
    } else {
        table.set("anchorStatus", "unavailable")?;
    }
    match row.outcome {
        Outcome::Damage(amount) => {
            table.set("kind", "damage")?;
            table.set("amount", amount)?;
            if let Some(attribution) = &row.attribution {
                table.set("meterSource", attribution.source_name.as_str())?;
                table.set("meterSourceKey", attribution.source_key.as_str())?;
            }
        }
        Outcome::Miss(word) => {
            table.set("kind", "miss")?;
            let result = lua.create_table()?;
            result.set("key", word.to_ascii_lowercase())?;
            result.set(
                "text",
                lua.globals().get::<Option<String>>(word).ok().flatten(),
            )?;
            table.set("result", result)?;
        }
    }
    Ok(table)
}

fn project_entry(
    state: &Stream,
    entry: &Table,
    parsed: Option<(u64, u64)>,
    follow: bool,
    seat: Option<&Table>,
) -> mlua::Result<()> {
    let Some((epoch, sequence)) = parsed else {
        return entry.set("state", "unknownAnchor");
    };
    if epoch != state.epoch {
        return entry.set("state", "worldChanged");
    }
    let Some(anchor) = state
        .anchors
        .iter()
        .find(|anchor| anchor.sequence == sequence)
    else {
        if sequence != 0 && sequence <= state.anchor_sequence {
            entry.set("state", "expired")?;
            let reason = if state.resource_evictions.contains_key(&sequence) {
                "resourceLimit"
            } else {
                "age"
            };
            return entry.set("reason", reason);
        }
        return entry.set("state", "unknownAnchor");
    };
    entry.set(
        "targetState",
        match anchor.state {
            TargetState::Alive => "alive",
            TargetState::Dead => "dead",
            TargetState::Unavailable => "unavailable",
        },
    )?;
    let (Some(view), Some(seat)) = (&state.camera, seat) else {
        return entry.set("state", "notReady");
    };
    let (Ok(scale), Ok(left), Ok(bottom)) = (
        seat.get::<f32>("scale"),
        seat.get::<f32>("left"),
        seat.get::<f32>("bottom"),
    ) else {
        return entry.set("state", "notReady");
    };
    if !scale.is_finite() || scale <= 0.0 || !left.is_finite() || !bottom.is_finite() {
        return entry.set("state", "notReady");
    }
    let spot = if follow { anchor.follow } else { anchor.impact };
    let depth = view.forward.dot(spot.overhead - view.position);
    if depth <= 0.0 {
        return entry.set("state", "behindCamera");
    }
    if depth < view.near || depth > view.far {
        return entry.set("state", "clipped");
    }
    let clip = view.clip_from_world * spot.overhead.extend(1.0);
    let ndc = clip.truncate() / clip.w;
    if !ndc.is_finite() || ndc.x.abs() > 1.0 || ndc.y.abs() > 1.0 {
        return entry.set("state", "offscreen");
    }
    let unit_view = view.viewport / (seam_scale(view.viewport.y) * scale);
    entry.set("state", "onScreen")?;
    entry.set("x", (ndc.x + 1.0) * 0.5 * unit_view.x - left)?;
    entry.set("y", (ndc.y + 1.0) * 0.5 * unit_view.y - bottom)?;
    entry.set("cameraDistance", spot.overhead.distance(view.position))?;
    entry.set("cameraDepth", depth)?;
    let across = view.clip_from_world * (spot.overhead + view.right).extend(1.0);
    entry.set(
        "uiUnitsPerYard",
        (across.x / across.w - ndc.x).abs() * 0.5 * unit_view.x,
    )?;
    if !follow || anchor.state != TargetState::Unavailable {
        entry.set(
            "playerDistance",
            state.hero.map(|hero| hero.distance(spot.feet)),
        )?;
    }
    Ok(())
}

struct Hit {
    source: u64,
    target: u64,
    spell: Option<u32>,
    school: Option<u32>,
    critical: bool,
    periodic: bool,
    reflected: bool,
    outcome: Outcome,
}

struct PendingMelee {
    source: u64,
    target: u64,
    attribution: Option<CombatTextAttribution>,
}

fn spell_outcome(damage: u32, absorb: u32, resist: i32, blocked: u32) -> Option<Outcome> {
    match super::spell_text(damage, absorb, resist, blocked, false)?.1 {
        super::TextBody::Literal(_) => Some(Outcome::Damage(damage)),
        super::TextBody::Word(word) => Some(Outcome::Miss(word)),
    }
}

fn held_entity(world: &World, guid: u64) -> Option<Entity> {
    world.get_resource::<GuidIndex>()?.0.get(&guid).copied()
}

fn spot(world: &World, entity: Entity) -> Option<Spot> {
    let tf = world.get::<Transform>(entity)?;
    Some(Spot {
        feet: tf.translation,
        overhead: crate::entities::overhead_anchor_in(world, entity, tf),
    })
}

fn source_kind(world: &World, guid: u64, hero: u64) -> Option<&'static str> {
    if guid == hero {
        return Some("player");
    }
    let unit = world.get::<ObjectStore>(held_entity(world, guid)?)?;
    if unit.0.unit_summoned_by() != Some(hero) && unit.0.unit_created_by() != Some(hero) {
        return None;
    }
    if unit.0.unit_pet_number() != 0 {
        return Some("pet");
    }
    let kind = unit
        .0
        .object_entry()
        .and_then(|entry| world.get_resource::<NameCache>()?.creature_type(entry));
    Some(match kind {
        Some(11) => "totem",
        Some(_) => "summon",
        None => "ownedUnknown",
    })
}

fn feed(world: &World) -> Option<&CombatTextAnchors> {
    let extension = world.get_resource::<crate::local_client::LocalClientExtension>()?;
    if extension.combat_text_anchors {
        world.get_resource::<CombatTextAnchors>()
    } else {
        None
    }
}

pub(crate) fn capture_hit(
    world: &World,
    packet: &SessionEvent,
    attribution: Option<CombatTextAttribution>,
) {
    let Some(feed) = feed(world) else { return };
    let mut state = feed.0.lock().expect("combat text state");
    let Some(subscribed) = state.subscribed else {
        return;
    };
    let Some(hero) = world.get_resource::<SelfGuid>().and_then(|hero| hero.0) else {
        return;
    };
    let attribution = attribution.and_then(|pair| pair.sanitized());
    state.receiving_melee = None;
    if let SessionEvent::AttackerState(hit) = packet {
        if hit.victim != hero && hit.displayed() && source_kind(world, hit.attacker, hero).is_some()
        {
            state.receiving_melee = Some(PendingMelee {
                source: hit.attacker,
                target: hit.victim,
                attribution,
            });
        }
        return;
    }
    if let SessionEvent::ObjectValues { guid, fields } = packet {
        if let Some(health) = fields.unit_health() {
            if health == 0 {
                update_target(world, &mut state, *guid, TargetState::Dead);
            } else if let Some(entity) = held_entity(world, *guid) {
                if state.targets.contains_key(guid) {
                    state.target_life(*guid, entity, TargetState::Alive);
                }
            }
        }
        return;
    }
    if let SessionEvent::ObjectDestroyed(guid) = packet {
        update_target(world, &mut state, *guid, TargetState::Unavailable);
        return;
    }
    if let SessionEvent::ObjectsRemoved(guids) = packet {
        for &guid in guids {
            update_target(world, &mut state, guid, TargetState::Unavailable);
        }
        return;
    }
    let spells = world.get_resource::<Spells>();
    let mut record = |hit| {
        record_hit(
            world,
            &mut state,
            hero,
            subscribed,
            hit,
            attribution.as_ref(),
        )
    };

    match packet {
        SessionEvent::SpellDamageLog(hit) if hit.hit_info & 0x8 == 0 => {
            if let Some(outcome) = spell_outcome(hit.damage, hit.absorb, hit.resist, hit.blocked) {
                record(Hit {
                    source: hit.attacker,
                    target: hit.target,
                    spell: Some(hit.spell_id),
                    school: Some(u32::from(hit.school)),
                    critical: hit.hit_info & 2 != 0,
                    periodic: hit.periodic,
                    reflected: false,
                    outcome,
                });
            }
        }
        SessionEvent::PeriodicAuraLog(log) => {
            for tick in &log.ticks {
                if let PeriodicTick::Damage {
                    amount,
                    school,
                    absorb,
                    resist,
                } = *tick
                {
                    if let Some(outcome) = spell_outcome(amount, absorb, resist, 0) {
                        record(Hit {
                            source: log.caster,
                            target: log.target,
                            spell: Some(log.spell_id),
                            school: Some(school),
                            critical: false,
                            periodic: true,
                            reflected: false,
                            outcome,
                        });
                    }
                }
            }
        }
        SessionEvent::DamageShield(hit) => {
            record(Hit {
                source: hit.victim,
                target: hit.attacker,
                spell: None,
                school: Some(hit.school),
                critical: false,
                periodic: false,
                reflected: true,
                outcome: Outcome::Damage(hit.damage),
            });
        }
        SessionEvent::SpellLogMiss(log) if !log.extended => {
            let school = spells
                .and_then(|s| s.catalog.get(log.spell_id))
                .map(|spell| spell.school);
            for &(target, result) in &log.misses {
                if let Some((word, _)) = super::miss_word(result) {
                    record(Hit {
                        source: log.caster,
                        target,
                        spell: Some(log.spell_id),
                        school,
                        critical: false,
                        periodic: false,
                        reflected: result == 11,
                        outcome: Outcome::Miss(word),
                    });
                }
            }
        }
        SessionEvent::SpellGo {
            caster,
            unit_caster,
            item_caster,
            spell_id,
            misses,
            ..
        } => {
            let Some(spell) = spells
                .and_then(|s| s.catalog.get(*spell_id))
                .filter(|spell| spell.speed == 0.0)
            else {
                return;
            };
            let first = item_caster.unwrap_or(*caster);
            let source = if held_entity(world, first).is_some() {
                first
            } else {
                *unit_caster
            };
            for miss in misses {
                for (target, result) in [
                    (miss.target, miss.info),
                    (
                        *unit_caster,
                        if miss.info == 11 {
                            miss.reflect_result
                        } else {
                            0
                        },
                    ),
                ] {
                    if let Some((word, _)) = super::miss_word(result) {
                        record(Hit {
                            source,
                            target,
                            spell: Some(*spell_id),
                            school: Some(spell.school),
                            critical: false,
                            periodic: false,
                            reflected: miss.info == 11,
                            outcome: Outcome::Miss(word),
                        });
                    }
                }
            }
        }
        _ => (),
    }
}

fn record_hit(
    world: &World,
    state: &mut Stream,
    hero: u64,
    subscribed: f64,
    hit: Hit,
    attribution: Option<&CombatTextAttribution>,
) {
    let Some(clock) = world.get_resource::<HostClock>() else {
        return;
    };
    let now = world
        .get_resource::<FrameStep>()
        .map_or(clock.0.ui_now, |step| {
            clock.0.ui_now
                + step
                    .at
                    .saturating_duration_since(clock.0.anchor)
                    .as_secs_f64()
        });
    let spells = world.get_resource::<Spells>();
    if hit.target == hero {
        return;
    }
    let Some(source_kind) = source_kind(world, hit.source, hero) else {
        return;
    };
    state.sequence += 1;
    if now - subscribed > RETENTION {
        return;
    }
    let sequence = state.sequence;
    let entity = held_entity(world, hit.target);
    let unit = entity.and_then(|entity| world.get::<ObjectStore>(entity));
    let target_name = world
        .get_resource::<NameCache>()
        .and_then(|names| names.peek_unit(hit.target, unit))
        .map(str::to_owned);
    let current = match unit.and_then(|unit| unit.0.unit_health()) {
        Some(0) => TargetState::Dead,
        Some(_) => TargetState::Alive,
        None => TargetState::Unavailable,
    };
    let target_life = entity.map(|entity| state.target_life(hit.target, entity, current));
    let anchor = entity.and_then(|entity| {
        let impact = spot(world, entity)?;
        if state.anchors.len() == CAPACITY {
            if let Some(old) = state.anchors.pop_front() {
                state.resource_evictions.insert(old.sequence, old.born);
            }
        }
        state.anchor_sequence += 1;
        state.anchors.push_back(Anchor {
            sequence: state.anchor_sequence,
            born: now,
            target: hit.target,
            entity,
            impact,
            follow: impact,
            state: current,
        });
        Some(state.anchor_sequence)
    });
    let spell = hit.spell.and_then(|id| spells?.catalog.get(id));
    let damage_type = match spell {
        Some(spell) if spell.melee_white_damage() => "ranged",
        _ if hit.spell.is_some() => "spell",
        _ => "melee",
    };
    if state.events.len() == CAPACITY {
        state.events.pop_front();
    }
    state.events.push_back(Event {
        sequence,
        time: now,
        target: hit.target,
        target_life,
        anchor,
        target_name,
        source: hit.source,
        source_kind,
        spell: hit.spell,
        spell_name: spell.map(|row| row.name.clone()),
        icon: spell.and_then(|row| row.icon.clone()),
        critical: hit.critical,
        periodic: hit.periodic,
        reflected: hit.reflected,
        damage_type,
        school_mask: hit
            .school
            .and_then(|school| (school < 7).then(|| 1 << school)),
        outcome: hit.outcome,
        attribution: attribution.cloned(),
    });
}

fn update_target(world: &World, state: &mut Stream, guid: u64, next: TargetState) {
    let Some(entity) = held_entity(world, guid) else {
        return;
    };
    let position = spot(world, entity);
    if let Some(life) = state.targets.get_mut(&guid) {
        if life.entity == entity && life.state == TargetState::Alive {
            life.state = next;
        }
    }
    for anchor in &mut state.anchors {
        if anchor.target == guid && anchor.entity == entity && anchor.state == TargetState::Alive {
            if let Some(position) = position {
                anchor.follow = position;
            }
            anchor.state = next;
        }
    }
}

/// The packet bridge seats the suffix before the swing handler runs. The engine's own impact
/// lane decides when the pending swing lands, including a receive-time fallback or flush.
pub(crate) fn capture_melee_impacts(world: &World) {
    let Some(feed) = feed(world) else { return };
    let Some(impacts) = world.get_resource::<Messages<SwingImpact>>() else {
        return;
    };
    let Some(hero) = world.get_resource::<SelfGuid>().and_then(|hero| hero.0) else {
        return;
    };
    let mut cursor = feed.1.lock().expect("combat text melee reader");
    let mut state = feed.0.lock().expect("combat text state");
    let Some(subscribed) = state.subscribed else {
        cursor.clear(impacts);
        return;
    };
    for impact in cursor.read(impacts) {
        let swing = impact.swing;
        let Some(index) = state
            .pending_melee
            .iter()
            .position(|(seq, _)| *seq == swing.seq)
        else {
            continue;
        };
        let (_, pending) = state
            .pending_melee
            .remove(index)
            .expect("matched pending swing");
        let Some((_, body)) = super::melee_text(swing.hit_info, swing.victim_state, swing.damage)
        else {
            continue;
        };
        let outcome = match body {
            super::TextBody::Literal(_) => Outcome::Damage(swing.damage),
            super::TextBody::Word(word) => Outcome::Miss(word),
        };
        record_hit(
            world,
            &mut state,
            hero,
            subscribed,
            Hit {
                source: pending.source,
                target: pending.target,
                spell: None,
                school: Some(swing.school),
                critical: swing.hit_info & 0x80 != 0,
                periodic: false,
                reflected: false,
                outcome,
            },
            pending.attribution.as_ref(),
        );
    }
}

pub(crate) fn seat_stream(world: &World) {
    let Some(feed) = feed(world) else { return };
    let in_world = crate::ui_script::ingame_ui_up_in(world);
    let map = world
        .get_resource::<CurrentMap>()
        .filter(|_| in_world)
        .map(|map| map.0);
    let vm = world
        .get_non_send_resource::<UiScript>()
        .map_or(0, UiScript::session);
    let run = world
        .resource::<crate::local_client::LocalClientExtension>()
        .combat_text_run;
    let mut state = feed.0.lock().expect("combat text state");
    if (vm, map, run) != (state.vm, state.world, state.run) {
        state.reset(vm, map, run);
    }
}

pub(crate) fn sample_frame(world: &mut World) {
    seat_stream(world);
    capture_melee_impacts(world);
    let Some(feed) = feed(world) else { return };
    let shared = Arc::clone(&feed.0);
    let mut state = shared.lock().expect("combat text state");
    state.ready = true;
    let live = world
        .get_resource::<UiPassState>()
        .is_some_and(|pass| pass.world_frame);
    state.camera_sample = state.camera_sample.wrapping_add(1);
    let widescreen = world.get_resource::<Widescreen>().is_none_or(|wide| wide.0);
    let mut camera =
        world.query_filtered::<(&Camera, &Projection, &Transform), With<WorldCamera>>();
    state.camera =
        camera
            .single(world)
            .ok()
            .filter(|_| live)
            .and_then(|(camera, projection, transform)| {
                let Projection::Perspective(perspective) = projection else {
                    return None;
                };
                let viewport = UiScreen::of(camera.logical_viewport_size()?, widescreen).size;
                Some(View {
                    clip_from_world: projection.get_clip_from_view()
                        * transform.to_matrix().inverse(),
                    position: transform.translation,
                    forward: *transform.forward(),
                    right: *transform.right(),
                    viewport,
                    near: perspective.near,
                    far: perspective.far,
                })
            });
    state.hero = world
        .get_resource::<SelfGuid>()
        .and_then(|hero| hero.0)
        .and_then(|guid| world.get::<Transform>(held_entity(world, guid)?))
        .map(|transform| transform.translation);
    let now = world
        .get_non_send_resource::<UiScript>()
        .map_or(0.0, UiScript::now);
    state.prune(now);
    state
        .targets
        .retain(|&guid, life| held_entity(world, guid) == Some(life.entity));
    for anchor in &mut state.anchors {
        if anchor.state != TargetState::Alive {
            continue;
        }
        if held_entity(world, anchor.target) != Some(anchor.entity) {
            anchor.state = TargetState::Unavailable;
            continue;
        }
        if let Some(position) = spot(world, anchor.entity) {
            anchor.follow = position;
        }
        if world
            .get::<ObjectStore>(anchor.entity)
            .is_some_and(|unit| unit.0.unit_health() == Some(0))
        {
            anchor.state = TargetState::Dead;
        }
    }
}
