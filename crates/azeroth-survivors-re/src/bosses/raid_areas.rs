//! Shared raid hazards, including selected lines, cones, knockback circles,
//! persistent donut pools, player bombs and grouped soak towers.
//! Other hazard kinds retain their separate, unrecovered producers.
//! The 0.115.0 common source gate/removal is owned by raid-death-0.115.0.md.
//! Other producer/lifecycle proofs retain their documented target provenance.

use super::{abilities::{CastTarget, CombatContext, CombatPort, SpellCast}, Position, RawBossAbility};
use serde_json::{json, Value};

#[path = "raid_extra.rs"]
mod extra;
#[path = "raid_sequence_areas.rs"]
mod sequences;
pub(crate) use lines::{DelayedKind, PendingLines};

#[path = "raid_shapes.rs"]
mod shapes;
#[path = "raid_lines.rs"]
mod lines;
#[path = "raid_actions.rs"]
mod actions;
pub(crate) use actions::SCHOL_RAID_ACTION;
pub(super) use actions::schol_aim_windup;
#[path = "raid_pools.rs"]
mod pools;
#[path = "raid_bombs.rs"]
mod bombs;
#[path = "raid_towers.rs"]
mod towers;

#[derive(Clone, Debug)]
struct Area {
    id: u32,
    source: u64,
    center: Position,
    radius: f32,
    inner_radius: Option<f32>,
    line: Option<(f32, f32)>,
    cone: Option<(f32, f32)>,
    knockback: f32,
    pool: Option<Pool>,
    extra: Option<extra::Extra>,
    tower_group: Option<u32>,
    follow_player_until: f32,
    enemy_damage: f32,
    impact_spell: u32,
    damage: f32,
    start: f32,
    end: f32,
    warning_lead: f32,
    follow: bool,
    published: bool,
}

/// Independent Game+0xa38 u32 serial, separate from object GUIDs and splines.
#[derive(Clone, Debug, Default)]
pub struct Pending {
    next_id: u32,
    next_tower_group: u32,
    rows: Vec<Area>,
    pub(crate) lines: lines::PendingLines,
    actions: actions::PendingActionVisuals,
}

impl Pending {
    pub fn object_guids(&self) -> impl Iterator<Item = u64> + '_ {
        self.rows.iter().filter_map(|row| match &row.extra {
            Some(extra::Extra::Aftershock { object, .. }) => *object,
            _ => None,
        })
    }
}

#[derive(Clone, Debug)]
struct Pool { expires: f32, next_tick: f32, active: bool }

struct AreaRemoval {
    index: usize,
    id: u32,
    published: bool,
    object: Option<u64>,
}

fn ground(port: &mut impl CombatPort, point: Position) -> Position {
    Position { z: port.primary_height([point.x, point.y])
        .or_else(|| port.secondary_height([point.x, point.y]))
        .unwrap_or_else(|| port.fallback_height()), ..point }
}

impl Pending {
    /// Sanguine and raid hazards share the native marker serial.
    pub fn allocate_marker_id(&mut self) -> u32 {
        self.next_id = self.next_id.wrapping_add(1);
        self.next_id
    }

    fn push(&mut self, mut row: Area) {
        self.next_id = self.next_id.wrapping_add(1);
        row.id = self.next_id;
        self.rows.push(row);
    }

    pub fn dispatch_current(&mut self, record: &RawBossAbility, context: CombatContext,
        port: &mut impl CombatPort, math: &impl crate::enemies::ai::Math) -> bool {
        if let Some(removal) = super::raid_shields::dispatch(record, context, port) {
            self.lines.remove_aura_at(removal.source, removal.spell, removal.at);
            return true;
        }
        self.dispatch_line(record, context, port, math)
            || self.dispatch_actions(record, context, port, math)
            || self.dispatch_pool(record, context, port)
            || self.dispatch_bomb(record, context, port)
            || self.dispatch(record, context, port)
    }

    pub fn dispatch_current_with_rng(&mut self, record: &RawBossAbility, context: CombatContext,
        port: &mut impl CombatPort, rng: &mut super::NativeRng,
        math: &impl crate::enemies::ai::Math) -> bool {
        super::raid_wards::dispatch(record, context, port, rng, math)
            || self.dispatch_extra(record, context, port, rng, math)
            || self.dispatch_sequences(record, context, port, math)
            || self.dispatch_towers(record, context, port, rng, math)
            || self.dispatch_current(record, context, port, math)
    }
    /// Semantic tags 5/6 are generated only from hash-bound current records by
    /// raid_area_catalog; they are not the native enum's binary discriminants.
    pub fn dispatch(&mut self, record: &RawBossAbility, context: CombatContext,
                    port: &mut impl CombatPort) -> bool {
        if self.dispatch_shape(record, context, port) { return true; }
        let w = record.words;
        let (point, radius, delay, factor, follow) = match w[0] {
            5 => {
                let delay = f32::from_bits(w[4]);
                port.raid_block(context.source_guid, delay);
                (context.player, f32::from_bits(w[3]), delay, f32::from_bits(w[5]), false)
            }
            6 => {
                let seconds = f32::from_bits(0x3fa66666);
                port.raid_block(context.source_guid, seconds);
                port.raid_hold(context.source_guid, seconds);
                port.raid_cast(context.source_guid, w[1], seconds);
                (context.source, f32::from_bits(w[2]), seconds,
                 f32::from_bits(w[3]), true)
            }
            _ => return false,
        };
        self.next_id = self.next_id.wrapping_add(1);
        self.rows.push(Area { id: self.next_id, source: context.source_guid,
            center: ground(port, point), radius, inner_radius: None,
            line: None, cone: None, knockback: 0., pool: None, extra: None,
            tower_group: None, follow_player_until: 0., enemy_damage: 0.,
            impact_spell: if w[0] == 5 { w[2] } else { w[1] },
            damage: context.effective_damage * factor,
            start: context.now, end: context.now + delay * crate::heroic::warning_factor(port.heroic_rank()), warning_lead: f32::INFINITY,
            follow, published: false });
        // Native create queues state only. The next hazard stage owns hz/hzend;
        // a hazard that resolves before its first publication has neither.
        true
    }

    /// Tag4's inline constructor uses the shared hazard serial/vector and
    /// source-lifetime gate. Its fixed circle has no optional impact spell,
    /// dynamic object, occupancy or follow flag.
    pub(super) fn volley_impact(&mut self, context: CombatContext, center: Position,
        delay: f32, damage: f32, port: &mut impl CombatPort) {
        self.next_id = self.next_id.wrapping_add(1);
        self.rows.push(Area { id: self.next_id, source: context.source_guid,
            center: ground(port, center), radius: 2.5, inner_radius: None,
            line: None, cone: None, knockback: 0., pool: None, extra: None,
            tower_group: None, follow_player_until: 0., enemy_damage: 0.,
            impact_spell: 0, damage,
            start: context.now, end: context.now + delay * crate::heroic::warning_factor(port.heroic_rank()), warning_lead: f32::INFINITY, follow: false,
            published: false });
    }

    /// Called in the existing pre-actor effects stage, even with no active rows.
    /// These plain danger circles never contribute to the native occupancy list.
    pub fn tick(&mut self, now: f32, port: &mut impl CombatPort) {
        self.tick_elapsed(now, 0., port);
    }

    pub fn tick_elapsed(&mut self, now: f32, elapsed: f32, port: &mut impl CombatPort) {
        self.lines.tick(now, port);
        self.tick_areas(now, elapsed, port);
        self.actions.advance(now, port);
    }

    fn tick_areas(&mut self, now: f32, elapsed: f32, port: &mut impl CombatPort) {
        if self.rows.is_empty() { return; }
        // Native queues original vector indices, then sorts/deduplicates before
        // removing from the back. Keep that order across early circle removals
        // and the later grouped-tower pass, including wrapped marker serials.
        let mut original_indices: Vec<usize> = (0..self.rows.len()).collect();
        let mut created = Vec::new();
        let mut ended = Vec::new();
        let mut moves = Vec::new();
        let mut visuals = Vec::new();
        let mut total = 0.0f32;
        let mut last_source = (0, 0);
        let mut knockback = None;
        let mut root = None;
        let mut occupied = Vec::new();
        let mut enemy_bursts = Vec::new();
        let mut spawns = Vec::new();
        let mut heals = Vec::new();
        let mut exposures = Vec::new();
        let (player, projected) = port.raid_hazard_positions();
        let mut index = 0;
        while index < self.rows.len() {
            let row = &mut self.rows[index];
            if !port.raid_source_selected(row.source) { index += 1; continue; }
            // Native 0.115.0 checks every row's GUID against living actors
            // before follow, kind dispatch, damage, spawning or publication.
            let Some(source) = port.raid_source(row.source) else {
                ended.push(row.removal(original_indices[index]));
                self.rows.remove(index);
                original_indices.remove(index);
                continue;
            };
            if now < row.follow_player_until {
                row.center = player;
            }
            if row.follow {
                row.center = ground(port, source);
            }
            if let Some((remove, damage, replaced, heal, expose, spawn)) = row.advance_extra(now, elapsed, player, projected, port) {
                total += damage;
                if let Some(request) = spawn { spawns.push(request); }
                if let Some(fraction) = heal { heals.push((row.source,fraction,row.impact_spell)); }
                if let Some(until) = expose { exposures.push((row.source,until)); }
                if matches!(&row.extra,Some(extra::Extra::Gaze{..}|extra::Extra::Crystal{..})) && !remove && row.contains(player) { occupied.push(json!(row.id)); }
                if damage > 0. { last_source = (row.source, row.impact_spell); }
                if replaced && row.impact_spell != 0 {
                    visuals.push(SpellCast { source_guid: row.source, spell_id: row.impact_spell,
                        target: CastTarget::Ground(row.visual_position()), hit_targets: Vec::new() });
                }
                if remove {
                    ended.push(row.removal(original_indices[index]));
                    self.rows.remove(index); original_indices.remove(index); continue;
                }
                if (!row.published && now >= row.end - row.warning_lead) || replaced { created.push(row.id); row.published = true; }
                else if row.published && (row.follow || row.follow_player_until > row.start || row.extra_moves()) {
                    moves.push(json!([row.id, row.center.x, row.center.y, row.center.z, row.angle()]));
                }
                index += 1; continue;
            }
            if row.tower_group.is_some() {
                if now < row.end {
                    if !row.published { created.push(row.id); row.published = true; }
                    if row.contains(player) { occupied.push(json!(row.id)); }
                }
                index += 1;
                continue;
            }
            if now >= row.end && row.pool.is_some() {
                let pool = row.pool.as_mut().unwrap();
                if !pool.active {
                    pool.active = true;
                    pool.next_tick = now;
                    created.push(row.id);
                    if row.impact_spell != 0 {
                        visuals.push(SpellCast { source_guid: row.source,
                            spell_id: row.impact_spell, target: CastTarget::Ground(row.center),
                            hit_targets: Vec::new() });
                    }
                }
                let pool = row.pool.as_mut().unwrap();
                if now >= pool.expires {
                    ended.push(row.removal(original_indices[index]));
                    self.rows.remove(index);
                    original_indices.remove(index);
                    continue;
                }
                if now >= pool.next_tick {
                    pool.next_tick += 0.5;
                    if row.damage_contains(player, projected) {
                        total += row.damage;
                        last_source = (row.source, row.impact_spell);
                    }
                }
            } else if now >= row.end {
                let distance = (player.x - row.center.x).hypot(player.y - row.center.y);
                if row.damage_contains(player, projected) {
                    total += row.damage;
                    last_source = (row.source, row.impact_spell);
                    if let Some(extra::Extra::Root { duration }) = &row.extra {
                        if *duration > 0. {
                            root = Some((row.source, row.impact_spell, *duration));
                        }
                    }
                    if row.knockback > 0. {
                        let angle = if !(distance < 0.5) {
                            (player.y - row.center.y).atan2(player.x - row.center.x)
                        } else { row.angle() };
                        knockback = Some((angle, row.knockback));
                    }
                }
                if row.impact_spell != 0 {
                    visuals.push(SpellCast { source_guid: row.source,
                        spell_id: row.impact_spell, target: CastTarget::Ground(row.center),
                        hit_targets: Vec::new() });
                }
                if row.enemy_damage > 0. {
                    enemy_bursts.push((row.center,row.radius,row.enemy_damage,row.impact_spell));
                }
                ended.push(row.removal(original_indices[index]));
                self.rows.remove(index);
                original_indices.remove(index);
                continue;
            }
            if !row.published && now >= row.end - row.warning_lead {
                created.push(row.id);
                row.published = true;
            } else if row.published && (row.follow || row.follow_player_until > row.start) {
                moves.push(json!([row.id, row.center.x, row.center.y, row.center.z, 0.]));
            }
            index += 1;
        }
        let towers = self.resolve_towers(now, port, &mut original_indices, &mut total);
        if let Some(source) = towers.source { last_source = source; }
        ended.extend(towers.ended.into_iter().map(|(index, id)| AreaRemoval {
            index, id, published: true, object: None,
        }));
        visuals.extend(towers.visuals);
        // Native creates surviving kind2 dynamic objects before marker packets
        // and actual player damage (145951e11..145951f43).
        let objects: Vec<_> = self.rows.iter().filter(|row| port.raid_source_selected(row.source)).filter_map(|row| match &row.extra {
            Some(extra::Extra::Aftershock { active:true, visual, object:None, .. }) if *visual!=0 => Some((row.id,*visual,row.radius,row.center)), _=>None,
        }).collect();
        for (id,spell,radius,point) in objects {
            let guid=port.raid_dynamic_object(spell,radius,point);
            if let Some(row)=self.rows.iter_mut().find(|row|row.id==id) {
                if let Some(extra::Extra::Aftershock{object,..})=&mut row.extra {*object=Some(guid);}
            }
        }
        // Native sends new/replaced rows, optional visual casts, reverse-index
        // removals, then the clock/move/occupancy message. Only the first wave
        // circle has an impact visual; these selected kinds own no ground object.
        for id in created {
            if let Some(row) = self.rows.iter().find(|row| row.id == id) { port.raid_marker(row.message(now)); }
        }
        for visual in visuals { port.cast_spell(visual); }
        ended.sort_unstable_by_key(|row| row.index);
        ended.dedup_by_key(|row| row.index);
        for row in ended.into_iter().rev() {
            if let Some(guid) = row.object { port.remove_ground_object(guid); }
            if row.published { port.raid_marker(json!({"type":"hzend", "id":row.id})); }
        }
        let mut clock = json!({"type":"hzt", "t":now});
        if !moves.is_empty() { clock["m"] = Value::Array(moves); }
        if !occupied.is_empty() { clock["in"] = Value::Array(occupied); }
        port.raid_marker(clock);
        if total > 0. {
            let (source, spell) = last_source;
            port.damage_player(total * port.raid_damage_multiplier(), source, spell);
        }
        if let Some((source, spell, duration)) = root {
            port.raid_root(source, spell, duration);
        }
        if let Some((angle, speed)) = knockback { port.raid_knockback(angle, speed); }
        for (center,radius,damage,spell) in enemy_bursts { port.raid_bomb_damage(center,radius,damage,spell); }
        for (kind,index,point) in spawns { port.raid_spawn_at(kind,index,point); }
        for (source,until) in exposures { port.raid_expose(source,until); }
        for (source,fraction,spell) in heals { port.raid_heal_source(source,fraction,spell); }
    }
}

impl Area {
    fn removal(&mut self, index: usize) -> AreaRemoval {
        let object = match &mut self.extra {
            Some(extra::Extra::Aftershock { object, .. }) => object.take(),
            _ => None,
        };
        AreaRemoval { index, id: self.id, published: self.published, object }
    }

    fn danger(context: CombatContext, center: Position, radius: f32, delay: f32, damage: f32,
        heroic_rank: u8) -> Self {
        Self { id: 0, source: context.source_guid, center, radius, inner_radius: None,
            line: None, cone: None, knockback: 0., pool: None, extra: None,
            tower_group: None, follow_player_until: 0., enemy_damage: 0., impact_spell: 0, damage,
            start: context.now, end: context.now + delay * crate::heroic::warning_factor(heroic_rank), warning_lead: f32::INFINITY,
            follow: false, published: false }
    }

    fn visual_position(&self) -> Position {
        if let Some((angle,_)) = self.line.or(self.cone) {
            Position { x: self.radius * 0.5 * angle.cos() + self.center.x,
                y: self.radius * 0.5 * angle.sin() + self.center.y, z: self.center.z }
        } else { self.center }
    }

    fn angle(&self) -> f32 { self.line.or(self.cone).map_or(0., |v| v.0) }

    fn contains(&self, player: Position) -> bool {
        let dx = player.x - self.center.x;
        let dy = player.y - self.center.y;
        let distance = dx.hypot(dy);
        if let Some((angle, width)) = self.line {
            let along = dx * angle.cos() + dy * angle.sin();
            return along >= 0. && along <= self.radius
                && (dy * angle.cos() - dx * angle.sin()).abs() <= width * 0.5;
        }
        if let Some((angle, arc)) = self.cone {
            if !(distance <= self.radius) { return false; }
            if distance < 0.5 { return true; }
            let offset = (dy.atan2(dx) - angle + std::f32::consts::PI)
                .rem_euclid(std::f32::consts::TAU) - std::f32::consts::PI;
            return offset.abs() <= arc;
        }
        row_circle_contains(self, distance)
    }

    /// A harmful area must contain both the admitted pose and its current
    /// report-lag projection. Tracking and beneficial occupancy stay separate.
    fn damage_contains(&self, player: Position, projected: Position) -> bool {
        self.contains(player) && self.contains(projected)
    }

    fn message(&self, now: f32) -> Value {
        let active_pool = self.pool.as_ref().filter(|pool| pool.active);
        let end = active_pool.map_or(self.end, |pool| pool.expires);
        let mut value = json!({"type":"hz", "id":self.id, "kind":"danger", "shape":"circle",
            "x":self.center.x, "y":self.center.y, "z":self.center.z, "a":self.angle(),
            "r":self.radius, "t0":self.start.max(self.end-self.warning_lead).min(now),
            "t1":end, "t":now});
        if self.pool.is_some() { value["kind"] = json!(if active_pool.is_some() { "pool" } else { "danger" }); }
        if self.tower_group.is_some() { value["kind"] = json!("tower"); }
        if let Some(state) = &self.extra {
            use extra::Extra;
            match state {
                Extra::Periodic{active,expires,..} => {
                    if *active { value["kind"]=json!("live");value["t1"]=json!(expires); }
                }
                Extra::Aftershock{active,expires,..} => {
                    if *active { value["kind"]=json!("pool");value["t1"]=json!(expires); }
                }
                Extra::Tether{active,expires,..} => { if *active { value["kind"]=json!("live"); } value["t1"]=json!(expires); }
                Extra::Gaze{..}|Extra::Crystal{..} => value["kind"]=json!("tower"),
                Extra::Spawn{..}|Extra::Root{..} => {},
            }
        }
        if let Some(inner) = self.inner_radius {
            value["shape"] = json!("donut");
            value["inner"] = json!(inner);
        }
        if let Some((_, width)) = self.line {
            value["shape"] = json!("line"); value["len"] = json!(self.radius); value["w"] = json!(width);
        }
        if let Some((_, arc)) = self.cone { value["shape"] = json!("cone"); value["arc"] = json!(arc * 2.); }
        value
    }
}

fn row_circle_contains(row: &Area, distance: f32) -> bool {
    row.radius >= distance && row.inner_radius.is_none_or(|inner| distance >= inner)
}
