//! 0.140.0 Gandling script and live attack history. See scholomance-encounters-0.140.0.md.
use super::*;
use azeroth_survivors_re::{
    bosses::{abilities::CombatPort, scripted_attack_geometry::Shape},
    coop::replication::BossFlagRow,
};
use serde_json::{Value, json};
use std::collections::{HashMap, HashSet};

pub(super) const ENTRY: u32 = 1853;
const SPELL: u32 = 16583;
const HERO_RADIUS: f32 = f32::from_bits(0x3ec72b02);
const REPEAT: [f32; 3] = [21.0, 24.0, 28.0];

#[derive(Clone, Copy, Debug)]
enum Followup {
    Office,
    ExamFirst,
    ExamSecond,
    ExamEnd,
}

#[derive(Clone, Debug)]
pub(super) struct Script {
    due: [f32; 3],
    phase_started_at: Option<f32>,
    pending: Option<(u32, Followup)>,
}

impl Script {
    pub(super) fn new(spawn_at: f32) -> Self {
        Self {
            due: [spawn_at + 1.5, spawn_at + 5.25, spawn_at + 15.0],
            phase_started_at: None,
            pending: None,
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
enum Kind {
    OfficeWarning,
    Office,
    Dismissed,
    Quiz,
    ExamLine,
    ExamFirst,
    ExamSecond,
}

impl Kind {
    fn spell(self) -> u32 {
        match self {
            Self::OfficeWarning | Self::ExamLine => 0,
            Self::Office | Self::ExamFirst | Self::ExamSecond => SPELL,
            Self::Dismissed => 27687,
            Self::Quiz => 17950,
        }
    }

    fn counts_for_straight_as(self) -> bool {
        matches!(self, Self::Office | Self::ExamFirst | Self::ExamSecond)
    }
}

#[derive(Clone, Copy, Debug)]
struct Part {
    id: u32,
    shape: Shape,
    z: f32,
    offset: f32,
    duration: f32,
    interval: f32,
    fill_offset: f32,
    tail: f32,
    damage: f32,
    color: &'static str,
}

impl Part {
    fn anchor(self, zone: &ZoneDefinition) -> [f32; 2] {
        match self.shape {
            Shape::Field { .. } => azeroth_survivors_re::zones::resolve(zone.key)
                .polygon
                .first()
                .copied()
                .unwrap_or([zone.center[0], zone.center[1]]),
            Shape::Rect { start, .. } => start,
            Shape::Circle { center, .. } => center,
        }
    }

    fn impact(shape: Shape, damage: f32, color: &'static str) -> Self {
        Self {
            id: 0,
            shape,
            z: 0.0,
            offset: 0.0,
            duration: 0.0,
            interval: 0.0,
            fill_offset: 0.0,
            tail: 0.25,
            damage,
            color,
        }
    }
}

#[derive(Debug)]
struct Attack {
    id: u32,
    source: u64,
    kind: Kind,
    started_at: f32,
    lock_at: f32,
    impact_at: f32,
    ends_at: f32,
    locked: bool,
    activated: bool,
    tracking_dirty: bool,
    last_update: f32,
    tracked: Option<u64>,
    parts: Vec<Part>,
    hits: HashSet<(u64, u32)>,
    objects: Vec<u64>,
}

#[derive(Clone, Copy)]
pub(super) struct HeroPose {
    pub(super) guid: u64,
    pub(super) position: Position,
}

#[derive(Debug, Default)]
pub(super) struct State {
    next_id: u32,
    attacks: Vec<Attack>,
    previous_positions: HashMap<u64, [f32; 2]>,
}

impl State {
    fn spawn(
        &mut self,
        source: u64,
        kind: Kind,
        now: f32,
        windup: f32,
        parts: Vec<Part>,
        tracked: Option<u64>,
        zone: &ZoneDefinition,
        events: &mut Vec<RunEvent>,
    ) -> u32 {
        self.next_id = self.next_id.wrapping_add(1);
        let impact_at = now + windup;
        let ends_at = parts.iter().fold(impact_at, |latest, part| {
            latest.max(impact_at + part.offset + part.duration + part.tail)
        });
        let lock_at = if tracked.is_some() {
            impact_at - 1.2
        } else {
            now
        };
        let row = Attack {
            id: self.next_id,
            source,
            kind,
            started_at: now,
            lock_at,
            impact_at,
            ends_at,
            locked: false,
            activated: false,
            tracking_dirty: false,
            last_update: now,
            tracked,
            parts,
            hits: HashSet::new(),
            objects: Vec::new(),
        };
        events.push(RunEvent::RaidMarker(row.warning(zone, now)));
        self.attacks.push(row);
        self.next_id
    }

    fn remove_where(
        &mut self,
        now: f32,
        reason: &str,
        events: &mut Vec<RunEvent>,
        mut predicate: impl FnMut(&Attack) -> bool,
    ) {
        self.attacks.retain(|row| {
            if !predicate(row) {
                return true;
            }
            events.push(RunEvent::RaidMarker(json!({
                "type": "atkx", "t": now, "id": row.id, "why": reason,
            })));
            events.extend(row.objects.iter().copied().map(RunEvent::RemoveObject));
            false
        });
    }

    pub(super) fn object_guids(&self) -> impl Iterator<Item = u64> + '_ {
        self.attacks
            .iter()
            .flat_map(|row| row.objects.iter().copied())
    }

    pub(super) fn expire(&mut self, now: f32, events: &mut Vec<RunEvent>) {
        self.remove_where(now, "done", events, |row| now >= row.ends_at);
    }

    pub(super) fn finish(
        &mut self,
        source: u64,
        health: f32,
        now: f32,
        events: &mut Vec<RunEvent>,
    ) -> BossFlagRow {
        let clean = health <= 0.0
            && self.attacks.iter().all(|row| {
                row.source != source || !row.kind.counts_for_straight_as() || row.hits.is_empty()
            });
        self.remove_where(now, "boss", events, |row| row.source == source);
        BossFlagRow {
            boss_id: ENTRY,
            flags: u8::from(clean),
        }
    }
}

impl Attack {
    fn warning(&self, zone: &ZoneDefinition, now: f32) -> Value {
        json!({
            "type": "atk", "id": self.id, "t": now, "t0": self.started_at,
            "lock": self.lock_at, "impact": self.impact_at, "end": self.ends_at,
            "locked": self.locked, "parts": self.warning_parts(zone),
        })
    }

    fn warning_parts(&self, zone: &ZoneDefinition) -> Vec<Value> {
        self.parts
            .iter()
            .enumerate()
            .map(|(index, part)| {
                let t1 = self.impact_at + part.offset;
                let [x, y] = part.anchor(zone);
                let mut row = json!({
                    "i": index, "x": x, "y": y, "z": part.z, "t1": t1, "t2": t1 + part.duration,
                    "f0": self.impact_at + part.fill_offset, "fade": part.tail, "c": part.color,
                    "trk": self.tracked.is_some(), "safe": part.damage <= 0.0,
                });
                match part.shape {
                    Shape::Field { safe } => {
                        row["s"] = json!("field");
                        row["a"] = json!(0.0);
                        row["w"] = json!(0);
                        row["v"] = json!(azeroth_survivors_re::zones::resolve(zone.key).polygon);
                        row["sq"] = json!(safe);
                        row["zr"] = json!([91.0, 98.0]);
                    }
                    Shape::Rect { start, end, width } => {
                        let [dx, dy] = [end[0] - start[0], end[1] - start[1]];
                        row["s"] = json!("rect");
                        row["a"] = json!(dy.atan2(dx));
                        row["len"] = json!(dx.hypot(dy));
                        row["w"] = json!(width);
                    }
                    Shape::Circle { radius, .. } => {
                        row["s"] = json!("circle");
                        row["a"] = json!(0.0);
                        row["w"] = json!(0);
                        row["r"] = json!(radius);
                    }
                }
                row
            })
            .collect()
    }
}

fn exam_part(zone: &ZoneDefinition, kind: Kind, power: f32) -> Part {
    let [x, y, _] = zone.center;
    let (offset, width, color, damage) = match kind {
        Kind::ExamLine => (2.0, 1.0, "pale", 0.0),
        Kind::ExamFirst => (-15.5, 35.0, "violet", power * 2.4),
        Kind::ExamSecond => (19.5, 35.0, "blue", power * 2.4),
        _ => unreachable!("Gandling Examination part"),
    };
    let start = [x + offset, y - 30.0];
    let end = [x + offset, y + 26.0];
    Part::impact(Shape::Rect { start, end, width }, damage, color)
}

fn office_part(zone: &ZoneDefinition, power: f32) -> Part {
    let [x, y, _] = zone.center;
    Part::impact(
        Shape::Field {
            safe: [x - 6.0, y - 8.0, x + 10.0, y + 8.0],
        },
        power * 1.7,
        "violet",
    )
}

fn dismissed_parts(zone: &ZoneDefinition, power: f32) -> Vec<Part> {
    let [x, y, _] = zone.center;
    [(-29.0, -21.5), (-15.0, -5.0), (1.0, 11.0), (17.5, 25.0)]
        .into_iter()
        .map(|(lo, hi)| {
            let center = y + (lo + hi) * 0.5;
            Part::impact(
                Shape::Rect {
                    start: [x - 33.0, center],
                    end: [x + 37.0, center],
                    width: hi - lo,
                },
                power * 1.7,
                "amber",
            )
        })
        .collect()
}

fn quiz_parts(position: Position, power: f32, windup: f32) -> Vec<Part> {
    let shape = Shape::Circle {
        center: [position.x, position.y],
        radius: 5.0,
    };
    vec![
        Part::impact(shape, power * 1.7, "violet"),
        Part {
            id: 1,
            shape,
            z: 0.0,
            offset: 0.5,
            duration: 2.5,
            interval: 1.0,
            fill_offset: windup,
            tail: 0.25,
            damage: power * 0.3,
            color: "violet",
        },
    ]
}

fn quiz_target(heroes: &[HeroPose], boss: Position) -> Option<HeroPose> {
    let distance = |hero: &HeroPose| {
        let dx = hero.position.x - boss.x;
        let dy = hero.position.y - boss.y;
        dx * dx + dy * dy
    };
    heroes.iter().copied().max_by(|left, right| {
        distance(left)
            .total_cmp(&distance(right))
            .then_with(|| right.guid.cmp(&left.guid))
    })
}

impl<W: RunWorld> BossCombat<'_, W> {
    pub(super) fn advance_gandling(&mut self, state: &mut State, heroes: &[HeroPose]) {
        let now = self.now;
        let warning_factor = azeroth_survivors_re::heroic::warning_factor(self.rules.heroic_rank);
        for index in 0..self.bosses.len() {
            let row = &self.bosses[index];
            if row.actor.dead {
                continue;
            }
            let Some(mut script) = row.gandling.clone() else {
                continue;
            };
            let source = row.guid;
            let origin = row.actor.movement.position_at(now);
            let enraged = row.ai.enraged;
            let power = native::ai::effective_ability_damage(
                native::ai::AbilityActor {
                    actor: row.actor,
                    enraged,
                },
                now,
            );
            let phase_starts = script.phase_started_at.is_none()
                && row.health / row.maximum_health.max(1.0) <= 0.35;
            if phase_starts {
                state.remove_where(now, "phase", self.events, |row| row.source == source);
                script.phase_started_at = Some(now);
                self.gandling_warning("%s calls The Last Examination. To the line!");
                self.raid_hold(source, 3.75);
                let id = self.spawn_gandling(
                    state,
                    source,
                    Kind::ExamLine,
                    3.75,
                    vec![exam_part(self.zone, Kind::ExamLine, power)],
                    None,
                );
                script.pending = Some((id, Followup::ExamFirst));
            } else if let Some((id, next)) = script.pending {
                if state.attacks.iter().all(|row| row.id != id) {
                    script.pending = match next {
                        Followup::Office => {
                            let windup = 2.5 * warning_factor;
                            self.raid_hold(source, windup);
                            self.spawn_gandling(
                                state,
                                source,
                                Kind::Office,
                                windup,
                                vec![office_part(self.zone, power)],
                                None,
                            );
                            None
                        }
                        Followup::ExamFirst | Followup::ExamSecond => {
                            let (kind, followup) = match next {
                                Followup::ExamFirst => (Kind::ExamFirst, Followup::ExamSecond),
                                _ => (Kind::ExamSecond, Followup::ExamEnd),
                            };
                            let windup = 1.75 * warning_factor;
                            self.raid_hold(source, windup);
                            let id = self.spawn_gandling(
                                state,
                                source,
                                kind,
                                windup,
                                vec![exam_part(self.zone, kind, power)],
                                None,
                            );
                            Some((id, followup))
                        }
                        Followup::ExamEnd => {
                            let started_at = script
                                .phase_started_at
                                .expect("Examination phase is active");
                            let elapsed = now - started_at;
                            for due in &mut script.due {
                                if due.is_finite() {
                                    *due = (*due + elapsed).max(now + 2.0);
                                }
                            }
                            None
                        }
                    };
                }
            } else if state
                .attacks
                .iter()
                .all(|row| row.source != source || now >= row.ends_at)
            {
                // Tags 1/2/3 are ordered by descending native priority.
                if let Some(action) = script.due.iter().position(|&due| now >= due) {
                    let produced = match action {
                        0 => {
                            self.gandling_warning(
                                "%s calls you to the Headmaster's Office. To the centre!",
                            );
                            self.raid_hold(source, 2.75);
                            let id = self.spawn_gandling(
                                state,
                                source,
                                Kind::OfficeWarning,
                                2.75,
                                Vec::new(),
                                None,
                            );
                            script.pending = Some((id, Followup::Office));
                            true
                        }
                        1 => {
                            let windup = 1.75 * warning_factor;
                            self.raid_hold(source, windup);
                            let objects = self.dismissed_units();
                            self.spawn_gandling(
                                state,
                                source,
                                Kind::Dismissed,
                                windup,
                                dismissed_parts(self.zone, power),
                                None,
                            );
                            state
                                .attacks
                                .last_mut()
                                .expect("published Dismissed attack")
                                .objects = objects;
                            true
                        }
                        _ => {
                            if let Some(target) = quiz_target(heroes, origin) {
                                let windup = 2.5 * warning_factor;
                                self.raid_hold(source, windup);
                                self.spawn_gandling(
                                    state,
                                    source,
                                    Kind::Quiz,
                                    windup,
                                    quiz_parts(target.position, power, windup),
                                    Some(target.guid),
                                );
                                true
                            } else {
                                false
                            }
                        }
                    };
                    if produced {
                        let factor = if self.rules.heroic_rank < 2 {
                            1.0
                        } else if enraged {
                            0.6
                        } else {
                            0.8
                        };
                        script.due[action] = now + REPEAT[action] * factor;
                    }
                }
            }
            self.bosses[index].gandling = Some(script);
        }
        state.update_warnings(now, heroes, self.bosses, self.events);
    }

    fn spawn_gandling(
        &mut self,
        state: &mut State,
        source: u64,
        kind: Kind,
        windup: f32,
        mut parts: Vec<Part>,
        tracked: Option<u64>,
    ) -> u32 {
        let spell = kind.spell();
        if spell != 0 {
            self.raid_cast(source, spell, windup);
        }
        for part in &mut parts {
            let point = part.anchor(self.zone);
            part.z = self
                .primary_height(point)
                .or_else(|| self.secondary_height(point))
                .unwrap_or(self.zone.center[2]);
        }
        state.spawn(
            source,
            kind,
            self.now,
            windup,
            parts,
            tracked,
            self.zone,
            self.events,
        )
    }

    fn dismissed_units(&mut self) -> Vec<u64> {
        let [x, y, z] = self.zone.center;
        let mut objects = Vec::with_capacity(6);
        for dy in [21.0, -25.0] {
            for dx in [-12.0, 2.0, 16.0] {
                let point = [x + dx, y + dy];
                let position = Position {
                    x: point[0],
                    y: point[1],
                    z: self
                        .primary_height(point)
                        .or_else(|| self.secondary_height(point))
                        .unwrap_or(z),
                };
                let guid = azeroth_survivors_re::native_counter::creature_guid(
                    9614,
                    &mut self.object_counter,
                );
                let orientation = (self.player.y - position.y).atan2(self.player.x - position.x);
                let fields = vec![
                    (0, guid as u32),
                    (1, (guid >> 32) as u32),
                    (2, 9),
                    (3, 9614),
                    (4, 1.4_f32.to_bits()),
                    (22, 1),
                    (28, 1),
                    (34, self.run_level.min(63)),
                    (35, 14),
                    (36, 0x100),
                    (46, 0),
                    (126, 2000),
                    (127, 2000),
                    (129, (1.4_f32 * 0.5).to_bits()),
                    (130, (1.4_f32 * 1.5).to_bits()),
                    (131, 7848),
                    (132, 7848),
                    (134, 5.0_f32.to_bits()),
                    (135, 10.0_f32.to_bits()),
                    (145, 1.0_f32.to_bits()),
                ];
                self.events.push(RunEvent::ScriptedUnit(LightwellObject {
                    guid,
                    position,
                    orientation,
                    object_type: 3,
                    fields,
                }));
                objects.push(guid);
            }
        }
        objects
    }

    fn gandling_warning(&mut self, text: &str) {
        self.events
            .push(RunEvent::Announcement(RunAnnouncement::emote(
                AnnouncementLabel::boss(ENTRY, "Darkmaster Gandling"),
                text,
            )));
    }

    pub(super) fn sample_gandling(&mut self, state: &mut State, elapsed: f32) {
        let point = [self.player.x, self.player.y];
        let previous = state
            .previous_positions
            .insert(self.player_guid, point)
            .unwrap_or(point);
        if state.attacks.is_empty() {
            return;
        }
        // The native marker clock is recipient-private even with no legacy hazards.
        self.raid_marker(json!({ "type": "hzt", "t": self.now, "keep": true }));
        if !self.player_active {
            return;
        }
        let (accepted, projected) = self.raid_hazard_positions();
        let now = self.now;
        let prev_clock = now - elapsed;
        let multiplier = self.raid_damage_multiplier();
        for row in &mut state.attacks {
            for part in &row.parts {
                if part.damage <= 0.0 {
                    continue;
                }
                let start = row.impact_at + part.offset;
                let mut tick = if part.interval > 0.0 {
                    (((prev_clock - start) / part.interval).floor() + 1.0).max(0.0) as u32
                } else {
                    0
                };
                loop {
                    let impact = start + tick as f32 * part.interval;
                    if !(impact <= now && impact <= start + part.duration + 0.0001) {
                        break;
                    }
                    let key = (self.player_guid, part.id + tick);
                    if prev_clock < impact && !row.hits.contains(&key) {
                        let progress =
                            ((impact - prev_clock) / elapsed.max(0.0001)).clamp(0.0, 1.0);
                        let point = [
                            previous[0] + (accepted.x - previous[0]) * progress,
                            previous[1] + (accepted.y - previous[1]) * progress,
                        ];
                        let adjusted = [
                            point[0] + (projected.x - accepted.x),
                            point[1] + (projected.y - accepted.y),
                        ];
                        if part.shape.hits(point, HERO_RADIUS)
                            && part.shape.hits(adjusted, HERO_RADIUS)
                        {
                            row.hits.insert(key);
                            self.incoming.push((
                                part.damage * multiplier,
                                row.source,
                                row.kind.spell(),
                            ));
                        }
                    }
                    if part.interval == 0.0 {
                        break;
                    }
                    tick += 1;
                }
            }
        }
    }
}

impl State {
    fn update_warnings(
        &mut self,
        now: f32,
        heroes: &[HeroPose],
        bosses: &[RunBoss],
        events: &mut Vec<RunEvent>,
    ) {
        for row in &mut self.attacks {
            if !row.locked {
                let locking = now >= row.lock_at;
                if let Some(guid) = row.tracked {
                    let current = heroes.iter().copied().find(|hero| hero.guid == guid);
                    let target = current.or_else(|| {
                        if locking {
                            return None;
                        }
                        let boss = bosses
                            .iter()
                            .find(|boss| boss.guid == row.source && !boss.actor.dead)?;
                        quiz_target(heroes, boss.actor.movement.position_at(now))
                    });
                    if let Some(target) = target {
                        let point = target.position;
                        row.tracked = Some(target.guid);
                        for part in &mut row.parts {
                            let Shape::Circle { center, .. } = &mut part.shape else {
                                continue;
                            };
                            let next = [point.x, point.y];
                            row.tracking_dirty |= *center != next || part.z != point.z;
                            *center = next;
                            part.z = point.z;
                        }
                    }
                    if locking || (row.tracking_dirty && now - row.last_update >= 0.1) {
                        let changes = row
                            .parts
                            .iter()
                            .enumerate()
                            .filter_map(|(index, part)| {
                                let Shape::Circle { center, .. } = part.shape else {
                                    return None;
                                };
                                Some(json!([index, center[0], center[1], part.z, 0.0, 0.0]))
                            })
                            .collect::<Vec<_>>();
                        events.push(RunEvent::RaidMarker(json!({
                            "type": "atku", "id": row.id, "t": now, "m": changes,
                        })));
                        row.tracking_dirty = false;
                        row.last_update = now;
                    }
                }
                if locking {
                    row.locked = true;
                    row.tracked = None;
                    events.push(RunEvent::RaidMarker(json!({
                        "type": "atkl", "id": row.id, "t": now,
                    })));
                }
            }
            if !row.activated && now >= row.impact_at {
                row.activated = true;
                events.push(RunEvent::RaidMarker(json!({
                    "type": "atka", "id": row.id, "t": now,
                })));
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn gandling_reads_live_shared_hits_before_retiring_the_source() {
        let zone = ZoneDefinition::by_key("scholomance").unwrap();
        let mut state = State::default();
        let mut events = Vec::new();
        state.spawn(
            12,
            Kind::Office,
            0.0,
            2.5,
            vec![office_part(zone, 1.0)],
            None,
            zone,
            &mut events,
        );
        state.attacks.last_mut().unwrap().hits.insert((99, 0));
        assert_eq!(state.finish(12, 0.0, 2.7, &mut events).flags, 0);
        assert!(state.attacks.is_empty());

        state.spawn(
            12,
            Kind::ExamFirst,
            0.0,
            1.75,
            vec![exam_part(zone, Kind::ExamFirst, 1.0)],
            None,
            zone,
            &mut events,
        );
        state.attacks.last_mut().unwrap().hits.insert((99, 0));
        state.expire(2.0, &mut events);
        assert_eq!(state.finish(12, 0.0, 2.0, &mut events).flags, 1);
    }
}
