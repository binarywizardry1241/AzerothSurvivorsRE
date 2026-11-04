//! The Survivors world catalog is independent of the short-lived hit stream.

use std::collections::{BTreeMap, HashMap, HashSet, VecDeque};
use std::sync::{Arc, Mutex};

use benilla_assets::coords::{bevy_to_wow, wow_to_bevy};
use benilla_protocol::messages::ObjectType;
use benilla_ui::{
    mlua::{self, Lua, Table, Value},
    script::UiScript,
};
use benilla_world::world_map::CurrentMap;
use bevy::prelude::*;

use crate::{
    client_state::ClientState,
    local_client::LocalClientExtension,
    names::NameCache,
    net::{Guid, GuidIndex, ObjectStore},
};

use super::anchors::{project_point, spot, View};

const CAPACITY: usize = 4096;
const RETIRED_CAPACITY: usize = 8192;
const LIMIT: usize = 256;
const FALLEN_SECONDS: f64 = 60.0;
const ENEMY_FACTION: u32 = 14;

const KINDS: &[&str] = &[
    "enemy",
    "elite",
    "guardian",
    "boss",
    "finalBoss",
    "cache",
    "guardianLair",
    "downedPartyMember",
];
const STATES: &[&str] = &[
    "alive", "dead", "present", "empty", "asleep", "awake", "downed",
];

#[derive(Resource, Default)]
pub(crate) struct WorldAnchors(Arc<Mutex<Catalog>>);

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
enum Key {
    Unit(u64, Entity),
    Cache(u32),
    Lair(u32),
    Fall(String, u32),
}

struct Anchor {
    key: Key,
    kind: &'static str,
    state: &'static str,
    name: Option<String>,
    position: Option<Vec3>,
    overhead: Option<Vec3>,
    occupant: Option<u32>,
    expires: Option<f64>,
}

#[derive(Default)]
struct Catalog {
    vm: u64,
    map: Option<u32>,
    run_identity: Option<u64>,
    run: Option<String>,
    stream: u64,
    revision: u64,
    sequence: u64,
    sample: u64,
    frame_current: bool,
    frame_ready: bool,
    tracking: bool,
    enemies_ready: bool,
    overflowed: bool,
    camera: Option<View>,
    hero: Option<Vec3>,
    entries: BTreeMap<u64, Anchor>,
    active: HashMap<Key, u64>,
    fallen: VecDeque<u64>,
    observed_dead: HashSet<Key>,
    retired: HashMap<u64, &'static str>,
    retirement_order: VecDeque<u64>,
    unit_metadata: HashMap<u32, (&'static str, Option<String>)>,
}

impl Catalog {
    fn seat(&mut self, vm: u64, map: Option<u32>, run_identity: Option<u64>) {
        if (self.vm, self.map, self.run_identity) == (vm, map, run_identity) {
            return;
        }
        let same_vm = self.vm == vm;
        let same_map = self.map == map;
        if !same_vm {
            self.run = None;
            self.tracking = false;
        }
        if !same_vm || !same_map {
            self.frame_ready = false;
            self.camera = None;
            self.hero = None;
        }
        self.vm = vm;
        self.map = map;
        self.run_identity = run_identity;
        self.reset_stream();
    }

    fn reset_stream(&mut self) {
        *self = Self {
            vm: self.vm,
            map: self.map,
            run_identity: self.run_identity,
            run: self.run.take(),
            stream: self.stream.wrapping_add(1),
            sample: self.sample,
            tracking: self.tracking,
            frame_ready: self.frame_ready,
            camera: self.camera.take(),
            hero: self.hero,
            ..Self::default()
        };
    }

    fn handle(&self, id: u64) -> String {
        format!("w{}.{id}", self.stream_id())
    }
    fn stream_id(&self) -> String {
        format!("{}.{}", self.vm, self.stream)
    }
    fn space(&self, map: u32) -> String {
        format!("m{map}:{}", self.run.as_deref().unwrap_or("none"))
    }

    fn insert(&mut self, row: Anchor) -> u64 {
        if let Some(&id) = self.active.get(&row.key) {
            let prior = self.entries.get_mut(&id).expect("active anchor");
            if (prior.kind, prior.state) != (row.kind, row.state) {
                self.revision = self.revision.wrapping_add(1);
            }
            *prior = row;
            return id;
        }
        self.sequence += 1;
        self.revision = self.revision.wrapping_add(1);
        self.active.insert(row.key.clone(), self.sequence);
        self.entries.insert(self.sequence, row);
        self.sequence
    }

    fn retire(&mut self, id: u64, reason: &'static str) {
        if let Some(row) = self.entries.remove(&id) {
            if self.active.get(&row.key) == Some(&id) {
                self.active.remove(&row.key);
            }
            self.retired.insert(id, reason);
            self.retirement_order.push_back(id);
            if self.retirement_order.len() > RETIRED_CAPACITY {
                let oldest = self.retirement_order.pop_front().expect("retired anchor");
                self.retired.remove(&oldest);
            }
            self.revision = self.revision.wrapping_add(1);
        }
    }

    fn prune(&mut self, now: f64) {
        while let Some(&id) = self.fallen.front() {
            let expires = self.entries[&id].expires.expect("fallen expiry");
            let reason = if now > expires {
                "age"
            } else if self.fallen.len() > CAPACITY {
                "resourceLimit"
            } else {
                break;
            };
            self.fallen.pop_front();
            self.retire(id, reason);
        }
    }

    fn sync(&mut self, values: Table) -> mlua::Result<Option<String>> {
        let map = values.raw_get::<Option<u32>>("map")?;
        if self.map.is_none() || self.map != map {
            return Ok(None);
        }
        let run = values.raw_get::<Option<String>>("run")?;
        if self.run.is_some() && self.run != run {
            self.reset_stream();
        }
        self.run = run;
        self.unit_metadata.clear();
        if let Some(units) = values.raw_get::<Option<Table>>("units")? {
            for unit in units.sequence_values::<Table>() {
                let unit = unit?;
                let id: u32 = unit.raw_get("id")?;
                let kind = match unit.raw_get::<String>("kind")?.as_str() {
                    "elite" => "elite",
                    "guardian" => "guardian",
                    "boss" => "boss",
                    "final" => "finalBoss",
                    _ => continue,
                };
                self.unit_metadata.insert(id, (kind, unit.raw_get("name")?));
            }
        }
        let mut present = HashSet::new();
        let mut ended = HashMap::new();
        for list in ["chests", "lairs", "downed"] {
            let Some(rows) = values.raw_get::<Option<Table>>(list)? else {
                continue;
            };
            for row in rows.sequence_values::<Table>() {
                let row = row?;
                let state = row.raw_get::<Option<String>>("state")?;
                let (key, kind, state, occupant) = match list {
                    "chests" => (Key::Cache(row.raw_get("id")?), "cache", "present", None),
                    "lairs" => {
                        let state = match state.as_deref() {
                            Some("empty") => "empty",
                            Some("asleep") => "asleep",
                            Some("awake") => "awake",
                            _ => continue,
                        };
                        let occupant = row.raw_get::<Option<u32>>("id")?.filter(|id| *id != 0);
                        (
                            Key::Lair(row.raw_get("index")?),
                            "guardianLair",
                            state,
                            occupant,
                        )
                    }
                    _ => {
                        let epoch = row.raw_get::<f32>("ep")?;
                        let key = Key::Fall(row.raw_get("id")?, epoch.to_bits());
                        if state.as_deref() != Some("down") {
                            let reason = match state.as_deref() {
                                Some("left") => "departed",
                                Some("ended") => "runEnded",
                                _ => "revived",
                            };
                            ended.insert(key, reason);
                            continue;
                        }
                        (key, "downedPartyMember", "downed", None)
                    }
                };
                present.insert(key.clone());
                let position = match (
                    row.raw_get::<Option<f32>>("x")?,
                    row.raw_get::<Option<f32>>("y")?,
                    row.raw_get::<Option<f32>>("z")?,
                ) {
                    (Some(x), Some(y), Some(z)) => {
                        Some(wow_to_bevy([x, y, z])).filter(|point| point.is_finite())
                    }
                    _ => None,
                };
                let id = self.insert(Anchor {
                    key,
                    kind,
                    state,
                    position,
                    occupant,
                    name: row.raw_get("name")?,
                    overhead: None,
                    expires: None,
                });
                row.raw_set("anchorId", position.map(|_| self.handle(id)))?;
                row.raw_set(
                    "anchorStatus",
                    if position.is_some() {
                        "ready"
                    } else {
                        "unavailable"
                    },
                )?;
            }
        }
        let removed: Vec<_> = self
            .active
            .iter()
            .filter_map(|(key, &id)| {
                if present.contains(key) {
                    return None;
                }
                let reason = match key {
                    Key::Unit(..) => return None,
                    Key::Cache(_) => "collected",
                    Key::Lair(_) => "removed",
                    Key::Fall(..) => ended.get(key).copied().unwrap_or("revived"),
                };
                Some((id, reason))
            })
            .collect();
        for (id, reason) in removed {
            self.retire(id, reason);
        }
        Ok(Some(self.stream_id()))
    }

    fn collect_units(&mut self, world: &mut World, now: f64) {
        let mut units = world.query::<(Entity, &Guid, &ObjectStore)>();
        let Some(index) = world.get_resource::<GuidIndex>() else {
            return;
        };
        let names = world.get_resource::<NameCache>();
        self.overflowed = false;
        self.prune(now);
        let mut living = self
            .active
            .keys()
            .filter(|key| matches!(key, Key::Unit(..)))
            .count();
        let mut present = HashSet::new();
        for (entity, &Guid(guid), store) in units.iter(world) {
            let fields = &store.0;
            if index.0.get(&guid) != Some(&entity)
                || fields.object_type() != Some(ObjectType::Unit)
                || fields.unit_faction_template() != Some(ENEMY_FACTION)
            {
                continue;
            }
            let Some(health) = fields.unit_health() else {
                continue;
            };
            let key = Key::Unit(guid, entity);
            let active = self.active.get(&key).copied();
            let dead = health as i32 <= 0;
            present.insert(key.clone());
            if dead {
                // A still-present corpse does not get another handle when its row expires.
                if !self.observed_dead.insert(key.clone()) {
                    continue;
                }
                if let Some(id) = active {
                    self.active.remove(&key);
                    let row = self.entries.get_mut(&id).expect("living unit anchor");
                    if let Some(point) = spot(world, entity) {
                        row.position = Some(point.feet);
                        row.overhead = Some(point.overhead);
                    }
                    row.state = "dead";
                    row.expires = Some(now + FALLEN_SECONDS);
                    self.fallen.push_back(id);
                    self.revision = self.revision.wrapping_add(1);
                    living -= 1;
                    continue;
                }
            } else {
                self.observed_dead.remove(&key);
                // Preserve the query walk. A death frees its slot at its position
                // in the walk, while unseen living rows retire after the scan.
                if active.is_none() && living >= CAPACITY {
                    self.overflowed = true;
                    continue;
                }
                living += usize::from(active.is_none());
            }
            let (kind, name) = self
                .unit_metadata
                .get(&(guid as u32))
                .cloned()
                .unwrap_or(("enemy", None));
            let name = name.or_else(|| {
                names
                    .and_then(|names| names.peek_unit(guid, Some(store)))
                    .map(str::to_owned)
            });
            let point = spot(world, entity);
            let id = self.insert(Anchor {
                key: key.clone(),
                kind,
                name,
                state: if dead { "dead" } else { "alive" },
                occupant: None,
                expires: dead.then_some(now + FALLEN_SECONDS),
                position: point.map(|point| point.feet),
                overhead: point.map(|point| point.overhead),
            });
            if dead {
                self.active.remove(&key);
                self.fallen.push_back(id);
            }
        }
        let removed: Vec<_> = self
            .active
            .iter()
            .filter_map(|(key, &id)| {
                (matches!(key, Key::Unit(..)) && !present.contains(key)).then_some(id)
            })
            .collect();
        for id in removed {
            self.retire(id, "removed");
        }
        self.observed_dead.retain(|key| present.contains(key));
        self.prune(now);
        self.enemies_ready = true;
    }

    fn common(&self, lua: &Lua, map: u32, now: f64) -> mlua::Result<Table> {
        let table = lua.create_table()?;
        table.set("apiVersion", 1)?;
        table.set("worldId", format!("m{map}:{}", self.stream))?;
        table.set("streamId", self.stream_id())?;
        table.set("clockSeconds", now)?;
        Ok(table)
    }

    fn entry(&self, lua: &Lua, map: u32, id: u64, row: &Anchor) -> mlua::Result<Table> {
        let table = lua.create_table()?;
        table.set("anchorId", self.handle(id))?;
        table.set("kind", row.kind)?;
        table.set("state", row.state)?;
        table.set("name", row.name.as_deref())?;
        match &row.key {
            Key::Unit(guid, _) => table.set("unitId", *guid as u32)?,
            Key::Cache(id) => table.set("cacheId", *id)?,
            Key::Lair(id) => table.set("lairIndex", *id)?,
            Key::Fall(id, _) => table.set("memberId", id.as_str())?,
        }
        table.set("occupantUnitId", row.occupant)?;
        table.set(
            "attachments",
            if matches!(row.key, Key::Unit(..)) {
                lua.create_sequence_from(["position", "overhead"])?
            } else {
                lua.create_sequence_from(["position"])?
            },
        )?;
        table.set("positionAvailable", row.position.is_some())?;
        if let Some(position) = row.position {
            let [x, y, z] = bevy_to_wow(position);
            table.set("x", x)?;
            table.set("y", y)?;
            table.set("z", z)?;
            table.set("mapId", map)?;
            table.set("spaceId", self.space(map))?;
            table.set("runId", self.run.as_deref())?;
        }
        table.set("expiresAt", row.expires)?;
        Ok(table)
    }
}

type Response = mlua::Result<(Option<Table>, Option<Table>)>;

fn error(lua: &Lua, code: &str, message: &str) -> Response {
    let err = lua.create_table()?;
    err.set("code", code)?;
    err.set("message", message)?;
    Ok((None, Some(err)))
}

fn dense(rows: &Table) -> mlua::Result<bool> {
    let count = rows.raw_len();
    let mut found = 0;
    for pair in rows.pairs::<Value, Value>() {
        let (key, _) = pair?;
        let index = match key {
            Value::Integer(n) if n > 0 && n as usize <= count => true,
            Value::Number(n) if n >= 1.0 && n <= count as f64 && n.fract() == 0.0 => true,
            _ => false,
        };
        if !index {
            return Ok(false);
        }
        found += 1;
    }
    Ok(found == count)
}

fn filter(value: Value, names: &[&str], marker: &[u8], hash: &mut u32) -> Option<u32> {
    match value {
        Value::Nil => Some((1 << names.len()) - 1),
        Value::Table(rows) if dense(&rows).ok()? => {
            hash_query_part(hash, marker);
            let mut mask = 0;
            for name in rows.sequence_values::<mlua::String>() {
                let name = name.ok()?;
                let name = name.to_str().ok()?;
                mask |= 1 << names.iter().position(|item| *item == &*name)?;
                hash_query_part(hash, name.as_bytes());
            }
            Some(mask)
        }
        _ => None,
    }
}

fn hash_query_part(hash: &mut u32, value: &[u8]) {
    for byte in value.iter().copied().chain(std::iter::once(0)) {
        *hash = (*hash ^ u32::from(byte)).wrapping_mul(0x0100_0193);
    }
}

fn allows(names: &[&str], value: &str, mask: u32) -> bool {
    names
        .iter()
        .position(|name| *name == value)
        .is_some_and(|index| mask & (1 << index) != 0)
}

fn handle_parts<const N: usize>(value: &str, prefix: char) -> Option<(&str, [u64; N])> {
    let mut parts = value.strip_prefix(prefix)?.rsplitn(N + 1, '.');
    let mut out = [0; N];
    for number in out.iter_mut().rev() {
        *number = parts.next()?.parse().ok()?;
    }
    let stream = parts.next().filter(|stream| !stream.is_empty())?;
    Some((stream, out))
}

impl Catalog {
    fn query(
        &mut self,
        lua: &Lua,
        query: Value,
        cursor: Value,
        limit: Value,
        now: f64,
    ) -> Response {
        let limit = match limit {
            Value::Nil => LIMIT,
            Value::Integer(n) if (1..=LIMIT as i64).contains(&n) => n as usize,
            Value::Number(n) if (1.0..=LIMIT as f64).contains(&n) && n.fract() == 0.0 => n as usize,
            _ => {
                return error(
                    lua,
                    "INVALID_ARGUMENT",
                    "limit must be a whole number from 1 to 256",
                )
            }
        };
        let (kinds, states) = match query {
            Value::Nil => (Value::Nil, Value::Nil),
            Value::Table(query) => {
                for pair in query.pairs::<Value, Value>() {
                    let (key, _) = pair?;
                    if !matches!(key, Value::String(s) if s.as_bytes().as_ref() == b"kinds" || s.as_bytes().as_ref() == b"states")
                    {
                        return error(lua, "INVALID_ARGUMENT", "query takes kinds and states");
                    }
                }
                (query.raw_get("kinds")?, query.raw_get("states")?)
            }
            _ => return error(lua, "INVALID_ARGUMENT", "query must be nil or a table"),
        };
        let mut selector = 0x811c_9dc5;
        let (Some(kinds), Some(states)) = (
            filter(kinds, KINDS, b"k", &mut selector),
            filter(states, STATES, b"s", &mut selector),
        ) else {
            return error(lua, "INVALID_ARGUMENT", "query takes kinds and states");
        };
        let Some(map) = self.map else {
            return error(lua, "NOT_IN_WORLD", "not in the world");
        };
        if kinds & 0x1f != 0 && !self.enemies_ready {
            self.tracking = true;
            return error(lua, "NOT_READY", "enemies are tracked from the next frame");
        }
        if !self.frame_ready {
            return error(lua, "NOT_READY", "the catalog starts with the first frame");
        }
        self.prune(now);
        let stream_id = self.stream_id();
        let offset = match cursor {
            Value::Nil => 0,
            Value::String(value) => {
                let decoded = value.to_str().ok();
                let Some((stream, [revision, fingerprint, offset])) = decoded
                    .as_deref()
                    .and_then(|value| handle_parts(value, 'k'))
                else {
                    return error(lua, "INVALID_ARGUMENT", "not a cursor of this API");
                };
                if stream != stream_id {
                    return error(lua, "STREAM_CHANGED", "this stream has ended");
                }
                if fingerprint != u64::from(selector) {
                    return error(
                        lua,
                        "INVALID_ARGUMENT",
                        "this cursor belongs to another query",
                    );
                }
                if revision != self.revision {
                    return error(
                        lua,
                        "CATALOG_CHANGED",
                        "the catalog changed: read from the start",
                    );
                }
                let Ok(offset) = usize::try_from(offset) else {
                    return error(lua, "INVALID_ARGUMENT", "not a cursor of this stream");
                };
                offset
            }
            _ => return error(lua, "INVALID_ARGUMENT", "cursor must be nil or a string"),
        };
        let mut matching = self
            .entries
            .iter()
            .filter(|(_, row)| allows(KINDS, row.kind, kinds) && allows(STATES, row.state, states))
            .skip(offset);
        let rows = lua.create_table()?;
        let mut count = 0;
        for (&id, row) in matching.by_ref().take(limit) {
            count += 1;
            rows.raw_set(count, self.entry(lua, map, id, row)?)?;
        }
        let more = matching.next().is_some();
        let out = self.common(lua, map, now)?;
        out.set("catalogId", format!("{stream_id}.{}", self.revision))?;
        out.set("mapId", map)?;
        out.set("spaceId", self.space(map))?;
        out.set("runId", self.run.as_deref())?;
        out.set("entries", rows)?;
        out.set("hasMore", more)?;
        out.set(
            "nextCursor",
            more.then(|| {
                format!(
                    "k{stream_id}.{}.{selector}.{offset}",
                    self.revision,
                    offset = offset + count
                )
            }),
        )?;
        out.set("overflowed", self.overflowed)?;
        Ok((Some(out), None))
    }

    fn project(&mut self, lua: &Lua, requests: Value, now: f64, seat: Option<Table>) -> Response {
        let Value::Table(requests) = requests else {
            return error(lua, "INVALID_ARGUMENT", "requests must be an array");
        };
        if requests.raw_len() > LIMIT {
            return error(lua, "INVALID_ARGUMENT", "at most 256 requests a call");
        }
        if !dense(&requests)? {
            return error(lua, "INVALID_ARGUMENT", "requests must be a dense array");
        }
        let Some(map) = self.map else {
            return error(lua, "NOT_IN_WORLD", "not in the world");
        };
        self.prune(now);
        let stream_id = self.stream_id();
        let rows = lua.create_table()?;
        for index in 1..=requests.raw_len() {
            let Value::Table(request) = requests.raw_get(index)? else {
                return error(lua, "INVALID_ARGUMENT", "every request must be a table");
            };
            let Value::String(handle) = request.raw_get("anchorId")? else {
                return error(lua, "INVALID_ARGUMENT", "every request needs an anchorId");
            };
            let attachment = match request.raw_get::<Value>("attachment")? {
                Value::String(value) if value.as_bytes().as_ref() == b"position" => "position",
                Value::String(value) if value.as_bytes().as_ref() == b"overhead" => "overhead",
                _ => {
                    return error(
                        lua,
                        "INVALID_ARGUMENT",
                        "attachment must be \"position\" or \"overhead\"",
                    )
                }
            };
            let offset = match request.raw_get::<Value>("offset")? {
                Value::Nil => Vec3::ZERO,
                Value::Table(offset) => {
                    let parts = ["x", "y", "z"].map(|key| match offset.raw_get::<Value>(key) {
                        Ok(Value::Nil) => 0.0,
                        Ok(Value::Integer(n)) => n as f32,
                        Ok(Value::Number(n)) => n as f32,
                        _ => f32::NAN,
                    });
                    wow_to_bevy(parts)
                }
                _ => Vec3::splat(f32::NAN),
            };
            if !offset.is_finite() {
                return error(
                    lua,
                    "INVALID_ARGUMENT",
                    "offset must be a table of finite x, y and z yards",
                );
            }
            let out = lua.create_table()?;
            let decoded = handle.to_str().ok();
            let parsed = decoded.as_deref().and_then(|raw| handle_parts(raw, 'w'));
            out.set("anchorId", handle.clone())?;
            out.set("attachment", attachment)?;
            if let Some((stream, [id])) = parsed {
                if stream != stream_id {
                    out.set("state", "worldChanged")?;
                } else if let Some(row) = self.entries.get(&id) {
                    out.set("entityState", row.state)?;
                    let point = if attachment == "overhead" {
                        row.overhead
                    } else {
                        row.position
                    };
                    if attachment == "overhead" && !matches!(row.key, Key::Unit(..)) {
                        out.set("state", "unavailable")?;
                        out.set("reason", "unsupportedAttachment")?;
                    } else if let Some(point) = point {
                        project_point(
                            &self.camera,
                            &out,
                            point + offset,
                            seat.as_ref(),
                            self.hero.map(|hero| hero.distance(point)),
                        )?;
                    } else {
                        out.set("state", "unavailable")?;
                    }
                } else if id != 0 && id <= self.sequence {
                    out.set("state", "expired")?;
                    out.set("reason", self.retired.get(&id).copied().unwrap_or("age"))?;
                } else {
                    out.set("state", "unknownAnchor")?;
                }
            } else {
                out.set("state", "unknownAnchor")?;
            }
            rows.raw_set(index, out)?;
        }
        let out = self.common(lua, map, now)?;
        out.set("cameraSampleId", format!("{stream_id}.{}", self.sample))?;
        out.set("frameCurrent", self.frame_current)?;
        out.set("entries", rows)?;
        Ok((Some(out), None))
    }
}

impl WorldAnchors {
    pub(crate) fn install_lua(&self, world: &World, script: &UiScript) -> mlua::Result<()> {
        let mut catalog = self.0.lock().expect("world anchor catalog");
        let map = world
            .get_resource::<CurrentMap>()
            .filter(|_| {
                world
                    .get_resource::<State<ClientState>>()
                    .is_some_and(|state| *state.get() == ClientState::InWorld)
            })
            .map(|map| map.0);
        let run_identity = world
            .get_resource::<LocalClientExtension>()
            .and_then(|extension| extension.combat_text_run);
        catalog.seat(script.session(), map, run_identity);
        drop(catalog);
        let lua = script.lua();
        let state = Arc::clone(&self.0);
        lua.globals().set(
            "AZS_NativeWorldAnchorSync",
            lua.create_function(move |_, values: Table| {
                state.lock().expect("world anchor catalog").sync(values)
            })?,
        )?;
        let state = Arc::clone(&self.0);
        lua.globals().set(
            "AZS_NativeWorldAnchorStream",
            lua.create_function(move |_, ()| {
                let state = state.lock().expect("world anchor catalog");
                Ok(state.map.map(|_| state.stream_id()))
            })?,
        )?;
        let state = Arc::clone(&self.0);
        lua.globals().set(
            "AZS_NativeWorldAnchorUnit",
            lua.create_function(move |_, id: u32| {
                let state = state.lock().expect("world anchor catalog");
                Ok(state.active.iter().find_map(|(key, &sequence)| {
                    matches!(key, Key::Unit(guid, _) if *guid as u32 == id)
                        .then(|| state.handle(sequence))
                }))
            })?,
        )?;
        let state = Arc::clone(&self.0);
        lua.globals().set(
            "AZS_NativeWorldAnchorQuery",
            lua.create_function(move |lua, (query, cursor, limit, now)| {
                state
                    .lock()
                    .expect("world anchor catalog")
                    .query(lua, query, cursor, limit, now)
            })?,
        )?;
        let state = Arc::clone(&self.0);
        lua.globals().set(
            "AZS_NativeWorldAnchorProject",
            lua.create_function(move |lua, (requests, now, seat)| {
                state
                    .lock()
                    .expect("world anchor catalog")
                    .project(lua, requests, now, seat)
            })?,
        )?;
        Ok(())
    }

    pub(crate) fn frame_current(&self, current: bool) {
        self.0.lock().expect("world anchor catalog").frame_current = current;
    }
}

fn seated_catalog(world: &World) -> Option<&WorldAnchors> {
    let extension = world.get_resource::<LocalClientExtension>()?;
    extension.world_anchor_frame_callback?;
    let catalog = world.get_resource::<WorldAnchors>()?;
    let map = world
        .get_resource::<CurrentMap>()
        .filter(|_| crate::ui_script::ingame_ui_up_in(world))
        .map(|map| map.0);
    let vm = world
        .get_non_send_resource::<UiScript>()
        .map_or(0, UiScript::session);
    catalog
        .0
        .lock()
        .expect("world anchor catalog")
        .seat(vm, map, extension.combat_text_run);
    Some(catalog)
}

pub(crate) fn seat_stream(world: &World) {
    let _ = seated_catalog(world);
}

pub(super) fn sample_frame(world: &mut World, camera: Option<View>, now: f64) {
    let Some(catalog) = seated_catalog(world).map(|catalog| Arc::clone(&catalog.0)) else {
        return;
    };
    let script = world.get_non_send_resource::<UiScript>();
    let mut catalog = catalog.lock().expect("world anchor catalog");
    catalog.sample = catalog.sample.wrapping_add(1);
    catalog.frame_ready = true;
    catalog.camera = camera;
    catalog.hero = script.and_then(crate::ui_script::player_position::world_position);
    if catalog.map.is_some() && catalog.tracking {
        catalog.collect_units(world, now);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn destination_motion_retains_the_cursor_and_collection_invalidates_it() {
        let lua = Lua::new();
        let values: Table = lua
            .load("return { map=533, run='r', chests={ {id=1,x=0,y=2,z=3}, {id=2,x=4,y=5,z=6} } }")
            .eval()
            .unwrap();
        let caches = values.get::<Table>("chests").unwrap();
        let first = caches.get::<Table>(1).unwrap();
        let query = || {
            lua.load("return { kinds={'cache'} }")
                .eval::<Table>()
                .map(Value::Table)
                .unwrap()
        };
        let mut catalog = Catalog::default();
        catalog.seat(1, Some(533), Some(1));
        catalog.frame_ready = true;
        catalog.sync(values.clone()).unwrap();
        let (page, _) = catalog
            .query(&lua, query(), Value::Nil, Value::Integer(1), 0.0)
            .unwrap();
        let page = page.unwrap();
        assert_eq!(page.get::<String>("worldId").unwrap(), "m533:1");
        assert_eq!(page.get::<String>("spaceId").unwrap(), "m533:r");
        let cursor = page.get::<Value>("nextCursor").unwrap();
        let handle = first.get::<String>("anchorId").unwrap();

        first.set("x", 20).unwrap();
        catalog.sync(values.clone()).unwrap();
        assert_eq!(first.get::<String>("anchorId").unwrap(), handle);
        let (page, error) = catalog
            .query(&lua, query(), cursor.clone(), Value::Integer(1), 1.0)
            .unwrap();
        assert!(page.is_some() && error.is_none());

        caches.raw_set(2, Value::Nil).unwrap();
        catalog.sync(values).unwrap();
        let (_, error) = catalog
            .query(&lua, query(), cursor, Value::Integer(1), 2.0)
            .unwrap();
        assert_eq!(
            error.unwrap().get::<String>("code").unwrap(),
            "CATALOG_CHANGED"
        );
        assert_eq!(catalog.retired.values().copied().next(), Some("collected"));
    }

    #[test]
    fn a_departed_fall_is_retired_and_a_new_stream_rejects_old_handles() {
        let lua = Lua::new();
        let values: Table = lua
            .load("return { map=533, run='r', downed={ {id='u5',ep=4,state='down',x=0,y=0,z=0} } }")
            .eval()
            .unwrap();
        let row = values
            .get::<Table>("downed")
            .unwrap()
            .get::<Table>(1)
            .unwrap();
        let mut catalog = Catalog::default();
        catalog.seat(1, Some(533), Some(1));
        let before_zone = catalog.stream_id();
        catalog.sync(values.clone()).unwrap();
        assert_eq!(catalog.stream_id(), before_zone);
        let old: Value = row.get("anchorId").unwrap();
        let requests = lua.create_table().unwrap();
        let request = lua.create_table().unwrap();
        request.set("anchorId", old).unwrap();
        request.set("attachment", "position").unwrap();
        requests.set(1, request).unwrap();
        let projected = |catalog: &mut Catalog| {
            catalog
                .project(&lua, Value::Table(requests.clone()), 5.0, None)
                .unwrap()
                .0
                .unwrap()
                .get::<Table>("entries")
                .unwrap()
                .get::<Table>(1)
                .unwrap()
        };

        row.set("state", "left").unwrap();
        catalog.sync(values).unwrap();
        let expired = projected(&mut catalog);
        assert_eq!(expired.get::<String>("state").unwrap(), "expired");
        assert_eq!(expired.get::<String>("reason").unwrap(), "departed");
        catalog.seat(1, Some(533), Some(2));
        assert_eq!(catalog.run.as_deref(), Some("r"));
        assert_eq!(catalog.stream_id(), "1.2");
        assert_eq!(
            projected(&mut catalog).get::<String>("state").unwrap(),
            "worldChanged"
        );
    }
}
