//! 0.140.0 Gandling script and live attack history. See scholomance-encounters-0.140.0.md.
use super::*;
use azeroth_survivors_re::{
    bosses::{
        abilities::{CastTarget, CombatPort},
        scripted_attack_geometry::Shape,
    },
    coop::replication::BossFlagRow,
};
use serde_json::{json, Value};
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
    Scripted(u32),
}

impl Kind {
    fn spell(self) -> u32 {
        match self {
            Self::OfficeWarning | Self::ExamLine => 0,
            Self::Office | Self::ExamFirst | Self::ExamSecond => SPELL,
            Self::Dismissed => 27687,
            Self::Quiz => 17950,
            Self::Scripted(spell) => spell,
        }
    }

    fn counts_for_straight_as(self) -> bool {
        matches!(self, Self::Office | Self::ExamFirst | Self::ExamSecond)
    }
}

#[derive(Clone, Copy, Debug)]
pub(super) struct Part {
    pub(super) id: u32,
    pub(super) shape: Shape,
    pub(super) z: f32,
    pub(super) offset: f32,
    pub(super) duration: f32,
    pub(super) interval: f32,
    pub(super) fill_offset: f32,
    pub(super) tail: f32,
    pub(super) damage: f32,
    pub(super) color: &'static str,
    pub(super) tracking: Option<u64>,
    pub(super) aim: Option<(u64, f32)>,
    pub(super) push_fallback: f32,
}

impl Part {
    fn anchor(self, zone: &ZoneDefinition) -> [f32; 2] {
        match self.shape {
            Shape::Field { .. } => super::scripted_arena::polygon(zone)
                .first()
                .copied()
                .unwrap_or([zone.center[0], zone.center[1]]),
            Shape::Rect { start, .. } => start,
            Shape::Circle { center, .. } | Shape::Donut { center, .. } => center,
            Shape::Capsule { start, .. } => start,
            Shape::Sweep { start, .. } => start,
            Shape::Cone { origin, .. } => origin,
            Shape::Grid(grid) => grid.origin,
        }
    }

    pub(super) fn impact(shape: Shape, damage: f32, color: &'static str) -> Self {
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
            tracking: None,
            aim: None,
            push_fallback: match shape {
                Shape::Cone { angle, .. } => angle,
                _ => 0.0,
            },
        }
    }
}

#[derive(Clone, Copy)]
pub(super) enum CastVisuals {
    None,
    Scripted,
    DedicatedLaunch,
}

#[derive(Clone, Copy)]
pub(super) struct Timing {
    pub(super) windup: f32,
    pub(super) lock_lead: f32,
    pub(super) visuals: CastVisuals,
}

impl Timing {
    pub(super) fn standard(windup: f32) -> Self {
        Self {
            windup,
            lock_lead: 1.2,
            visuals: CastVisuals::Scripted,
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
    blocks_until: f32,
    locked: bool,
    activated: bool,
    launch: bool,
    tracking_dirty: bool,
    last_update: f32,
    tracked: Option<u64>,
    parts: Vec<Part>,
    hits: HashSet<(u64, u32)>,
    retired_parts: HashSet<usize>,
    objects: Vec<u64>,
}

#[derive(Clone, Copy)]
pub(super) struct HeroPose {
    pub(super) guid: u64,
    pub(super) position: Position,
}

pub(super) enum Motion {
    Push {
        origin: [f32; 2],
        fallback: f32,
        distance: f32,
    },
    Rush {
        origin: [f32; 2],
        angle: f32,
    },
    Hook {
        origin: [f32; 2],
    },
}

#[derive(Debug, Default)]
pub(super) struct State {
    next_id: u32,
    attacks: Vec<Attack>,
    previous_positions: HashMap<u64, [f32; 2]>,
    blood_hits: Vec<(u32, u32, u64, u32)>,
    immolate_impacts: Vec<(u64, [f32; 2])>,
}

impl State {
    pub(super) fn take_blood_hits(&mut self) -> std::vec::IntoIter<(u32, u32, u64, u32)> {
        std::mem::take(&mut self.blood_hits).into_iter()
    }

    pub(super) fn take_immolate_impacts(&mut self) -> Vec<(u64, [f32; 2])> {
        std::mem::take(&mut self.immolate_impacts)
    }

    pub(super) fn has_attack(&self, source: u64, now: f32) -> bool {
        self.attacks
            .iter()
            .any(|row| row.source == source && row.blocks_until > now)
    }

    pub(super) fn has_attack_id(&self, id: u32) -> bool {
        self.attacks.iter().any(|row| row.id == id)
    }

    pub(super) fn capsule_endpoint(&self, id: u32) -> Option<[f32; 2]> {
        self.attacks
            .iter()
            .find(|row| row.id == id)?
            .parts
            .iter()
            .find_map(|part| match part.shape {
                Shape::Capsule { end, .. } => Some(end),
                _ => None,
            })
    }

    pub(super) fn block_until(&mut self, id: u32, deadline: f32) {
        if let Some(row) = self.attacks.iter_mut().find(|row| row.id == id) {
            row.blocks_until = deadline;
        }
    }

    pub(super) fn retire_attack(&mut self, id: u32, now: f32, events: &mut Vec<RunEvent>) {
        self.remove_where(now, "ad", events, |row| row.id == id);
    }

    pub(super) fn touches_rune(&self, id: u32, heroes: &[HeroPose]) -> bool {
        self.attacks
            .iter()
            .find(|row| row.id == id)
            .is_some_and(|row| {
                row.parts.iter().any(|part| {
                    heroes.iter().any(|hero| {
                        part.shape
                            .hits([hero.position.x, hero.position.y], HERO_RADIUS)
                    })
                })
            })
    }

    pub(super) fn dangerous_rune(&self, now: f32, point: [f32; 2]) -> bool {
        self.active_damaging_parts(now, true)
            .any(|part| part.shape.hits_at(point, HERO_RADIUS, 0.0))
    }

    pub(super) fn dangerous_landing(&self, now: f32, point: [f32; 2]) -> bool {
        self.active_damaging_parts(now, false).any(|part| {
            [0.0, 0.25, 0.5, 0.75, 1.0]
                .into_iter()
                .any(|progress| part.shape.hits_at(point, HERO_RADIUS, progress))
        })
    }

    fn active_damaging_parts(
        &self,
        now: f32,
        include_endpoint: bool,
    ) -> impl Iterator<Item = &Part> {
        self.attacks.iter().flat_map(move |row| {
            row.parts
                .iter()
                .enumerate()
                .filter_map(move |(index, part)| {
                    let end = row.impact_at + part.offset + part.duration;
                    (part.damage > 0.0
                        && !row.retired_parts.contains(&index)
                        && (end > now || (include_endpoint && end == now)))
                        .then_some(part)
                })
        })
    }

    pub(super) fn move_circle(
        &mut self,
        id: u32,
        position: Position,
        now: f32,
        events: &mut Vec<RunEvent>,
    ) {
        if let Some(row) = self.attacks.iter_mut().find(|row| row.id == id) {
            for part in &mut row.parts {
                if let Shape::Circle { center, .. } = &mut part.shape {
                    *center = [position.x, position.y];
                    part.z = position.z;
                }
            }
            if now - row.last_update >= 0.1 {
                row.publish_positions(now, events);
            }
        }
    }

    pub(super) fn retire_source(&mut self, source: u64, now: f32, events: &mut Vec<RunEvent>) {
        self.remove_where(now, "boss", events, |row| row.source == source);
    }

    fn spawn(
        &mut self,
        source: u64,
        kind: Kind,
        now: f32,
        timing: Timing,
        parts: Vec<Part>,
        tracked: Option<u64>,
        zone: &ZoneDefinition,
        events: &mut Vec<RunEvent>,
    ) -> u32 {
        self.next_id = self.next_id.wrapping_add(1);
        let impact_at = now + timing.windup;
        let ends_at = parts.iter().fold(impact_at, |latest, part| {
            latest.max(impact_at + part.offset + part.duration + part.tail)
        });
        let lock_at = if tracked.is_some()
            || kind.spell() == super::krastinov::RUSH
            || parts
                .iter()
                .any(|part| part.tracking.is_some() || part.aim.is_some())
        {
            impact_at - timing.lock_lead
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
            blocks_until: ends_at,
            locked: false,
            activated: false,
            launch: matches!(timing.visuals, CastVisuals::Scripted),
            tracking_dirty: false,
            last_update: now,
            tracked,
            parts,
            hits: HashSet::new(),
            retired_parts: HashSet::new(),
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
        self.retire_source(source, now, events);
        BossFlagRow {
            boss_id: ENTRY,
            flags: u8::from(clean),
        }
    }
}

impl Attack {
    fn publish_positions(&mut self, now: f32, events: &mut Vec<RunEvent>) {
        let changes: Vec<_> = self
            .parts
            .iter()
            .enumerate()
            .filter_map(|(index, part)| {
                if self.retired_parts.contains(&index) {
                    return None;
                }
                let (point, angle, length) = match part.shape {
                    Shape::Circle { center, .. } => (center, 0.0, 0.0),
                    Shape::Cone {
                        origin,
                        angle,
                        length,
                        ..
                    } => (origin, angle, length),
                    Shape::Capsule { start, end, .. } | Shape::Rect { start, end, .. } => {
                        let dx = end[0] - start[0];
                        let dy = end[1] - start[1];
                        (start, dy.atan2(dx), dx.hypot(dy))
                    }
                    _ => return None,
                };
                Some(json!([index, point[0], point[1], part.z, angle, length]))
            })
            .collect();
        if !changes.is_empty() {
            events.push(RunEvent::RaidMarker(json!({
                "type": "atku", "id": self.id, "t": now, "m": changes,
            })));
        }
        self.tracking_dirty = false;
        self.last_update = now;
    }

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
                    "f0": self.started_at + part.fill_offset, "fade": part.tail, "c": part.color,
                    "trk": self.tracked.is_some() || part.tracking.is_some() || part.aim.is_some(),
                    "safe": part.damage <= 0.0,
                });
                match part.shape {
                    Shape::Field { safe } => {
                        row["s"] = json!("field");
                        row["a"] = json!(0.0);
                        row["w"] = json!(0);
                        row["v"] = json!(super::scripted_arena::polygon(zone));
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
                    Shape::Donut { inner, outer, .. } => {
                        row["s"] = json!("donut");
                        row["inner"] = json!(inner);
                        row["r"] = json!(outer);
                    }
                    Shape::Cone {
                        angle,
                        length,
                        half_angle,
                        ..
                    } => {
                        row["s"] = json!("cone");
                        row["a"] = json!(angle);
                        row["r"] = json!(length);
                        row["arc"] = json!(half_angle * 2.0);
                    }
                    Shape::Capsule { start, end, radius } => {
                        let [dx, dy] = [end[0] - start[0], end[1] - start[1]];
                        row["s"] = json!("capsule");
                        row["a"] = json!(dy.atan2(dx));
                        row["len"] = json!(dx.hypot(dy));
                        row["w"] = json!(radius * 2.0);
                    }
                    Shape::Sweep {
                        start,
                        end,
                        width,
                        span,
                    } => {
                        let [dx, dy] = [end[0] - start[0], end[1] - start[1]];
                        row["s"] = json!("sweep");
                        row["a"] = json!(dy.atan2(dx));
                        row["len"] = json!(dx.hypot(dy));
                        row["w"] = json!(width);
                        row["dx"] = json!(span[0]);
                        row["dy"] = json!(span[1]);
                    }
                    Shape::Grid(grid) => {
                        row["s"] = json!("grid");
                        row["a"] = json!(grid.angle);
                        row["bx"] = json!(grid.origin[0]);
                        row["by"] = json!(grid.origin[1]);
                        row["cell"] = json!(grid.pitch);
                        row["rows"] = json!(grid.rows);
                        row["cols"] = json!(grid.columns);
                        row["valid"] = json!(grid.valid.map(|word| format!("{word:x}")));
                        row["danger"] = json!(grid.danger.map(|word| format!("{word:x}")));
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
            offset: 0.5,
            duration: 2.5,
            interval: 1.0,
            fill_offset: windup,
            ..Part::impact(shape, power * 0.3, "violet")
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
            } else if !state.has_attack(source, now) {
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
                        let factor = repeat_factor(self.rules.heroic_rank, enraged);
                        script.due[action] = now + REPEAT[action] * factor;
                    }
                }
            }
            self.bosses[index].gandling = Some(script);
        }
        state.update_warnings(now, heroes, self.bosses, self.zone, self.world, self.events);
    }

    pub(super) fn spawn_scripted(
        &mut self,
        state: &mut State,
        source: u64,
        spell: u32,
        windup: f32,
        parts: Vec<Part>,
        tracked: Option<u64>,
    ) -> u32 {
        self.spawn_scripted_with(
            state,
            source,
            spell,
            Timing::standard(windup),
            parts,
            tracked,
        )
    }

    pub(super) fn spawn_scripted_with(
        &mut self,
        state: &mut State,
        source: u64,
        spell: u32,
        timing: Timing,
        parts: Vec<Part>,
        tracked: Option<u64>,
    ) -> u32 {
        self.publish_scripted(state, source, Kind::Scripted(spell), timing, parts, tracked)
    }

    fn spawn_gandling(
        &mut self,
        state: &mut State,
        source: u64,
        kind: Kind,
        windup: f32,
        parts: Vec<Part>,
        tracked: Option<u64>,
    ) -> u32 {
        self.publish_scripted(
            state,
            source,
            kind,
            Timing::standard(windup),
            parts,
            tracked,
        )
    }

    fn publish_scripted(
        &mut self,
        state: &mut State,
        source: u64,
        kind: Kind,
        timing: Timing,
        mut parts: Vec<Part>,
        tracked: Option<u64>,
    ) -> u32 {
        if !matches!(timing.visuals, CastVisuals::None) && kind.spell() != 0 {
            self.raid_cast(source, kind.spell(), timing.windup);
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
            timing,
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

    pub(super) fn sample_gandling(
        &mut self,
        state: &mut State,
        elapsed: f32,
        scripted_moves: &mut Vec<(usize, Motion)>,
    ) {
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
            for (index, part) in row.parts.iter().enumerate() {
                if row.retired_parts.contains(&index) {
                    continue;
                }
                if part.damage <= 0.0 {
                    continue;
                }
                let start = row.impact_at + part.offset;
                let continuous = part.duration > 0.0 && part.interval == 0.0;
                let mut tick = if part.interval > 0.0 {
                    (((prev_clock - start) / part.interval).floor() + 1.0).max(0.0) as u32
                } else {
                    0
                };
                loop {
                    let impact = if continuous {
                        now
                    } else {
                        start + tick as f32 * part.interval
                    };
                    if impact < start {
                        break;
                    }
                    if !continuous && !(impact <= now && impact <= start + part.duration + 0.0001) {
                        break;
                    }
                    let key = (self.player_guid, part.id + tick);
                    if (continuous || prev_clock < impact) && !row.hits.contains(&key) {
                        let (sample_start, sample_end, count) = if continuous {
                            let lo = prev_clock.max(start);
                            let hi = now.min(start + part.duration);
                            if lo > hi {
                                break;
                            }
                            let span = match part.shape {
                                Shape::Sweep { span, .. } => span[0].hypot(span[1]),
                                _ => 0.0,
                            };
                            let hero_travel =
                                (accepted.x - previous[0]).hypot(accepted.y - previous[1]);
                            let shape_travel = span * (hi - lo) / part.duration;
                            let count = ((hero_travel + shape_travel) / (2.0 * HERO_RADIUS))
                                .ceil()
                                .clamp(1.0, 64.0) as u32;
                            (lo, hi, count)
                        } else {
                            (impact, impact, 0)
                        };
                        let hit = (0..=count).any(|sample| {
                            let time = if count == 0 {
                                sample_start
                            } else {
                                sample_start
                                    + (sample_end - sample_start) * sample as f32 / count as f32
                            };
                            let progress =
                                ((time - prev_clock) / elapsed.max(0.0001)).clamp(0.0, 1.0);
                            let point = [
                                previous[0] + (accepted.x - previous[0]) * progress,
                                previous[1] + (accepted.y - previous[1]) * progress,
                            ];
                            let adjusted = [
                                point[0] + (projected.x - accepted.x),
                                point[1] + (projected.y - accepted.y),
                            ];
                            let shape_progress = if continuous {
                                (time - start) / part.duration
                            } else {
                                0.0
                            };
                            part.shape.hits_at(point, HERO_RADIUS, shape_progress)
                                && part.shape.hits_at(adjusted, HERO_RADIUS, shape_progress)
                        });
                        if hit {
                            row.hits.insert(key);
                            let spell = row.kind.spell();
                            if spell == super::kirtonos::BLOOD_OFFERING {
                                if let Some((_, _, _, count)) = state
                                    .blood_hits
                                    .iter_mut()
                                    .find(|(id, part_id, _, _)| *id == row.id && *part_id == key.1)
                                {
                                    *count += 1;
                                } else {
                                    state.blood_hits.push((row.id, key.1, row.source, 1));
                                }
                            }
                            let motion = match (spell, part.shape) {
                                (super::kirtonos::SWOOP, Shape::Cone { origin, .. }) => {
                                    Some(Motion::Push {
                                        origin,
                                        fallback: part.push_fallback,
                                        distance: 6.0,
                                    })
                                }
                                (super::kirtonos::WING_FLAP, Shape::Donut { center, .. }) => {
                                    Some(Motion::Push {
                                        origin: center,
                                        fallback: 0.0,
                                        distance: 4.0,
                                    })
                                }
                                (super::ras::CHILL_NOVA, Shape::Circle { center, .. }) => {
                                    Some(Motion::Push {
                                        origin: center,
                                        fallback: 0.0,
                                        distance: 6.0,
                                    })
                                }
                                (super::krastinov::RUSH, Shape::Sweep { start, end, .. }) => {
                                    Some(Motion::Rush {
                                        origin: start,
                                        angle: (end[1] - start[1]).atan2(end[0] - start[0]),
                                    })
                                }
                                (super::krastinov::HOOK, Shape::Capsule { start, .. }) => {
                                    Some(Motion::Hook { origin: start })
                                }
                                _ => None,
                            };
                            if let Some(motion) = motion {
                                scripted_moves.push((self.incoming.len(), motion));
                            }
                            self.incoming
                                .push((part.damage * multiplier, row.source, spell));
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

pub(super) fn repeat_factor(rank: u8, enraged: bool) -> f32 {
    if rank < 2 {
        1.0
    } else if enraged {
        0.6
    } else {
        0.8
    }
}

impl State {
    pub(super) fn publish_launches(
        &self,
        now: f32,
        elapsed: f32,
        zone: &ZoneDefinition,
        world: &mut impl RunWorld,
        events: &mut Vec<RunEvent>,
    ) {
        let previous = now - elapsed;
        for row in &self.attacks {
            let spell_id = row.kind.spell();
            if !row.launch || spell_id == 0 {
                continue;
            }
            let parts = row.parts.iter().enumerate().filter_map(|(index, part)| {
                (!row.retired_parts.contains(&index)).then_some(part)
            });
            let mut launched = HashSet::new();
            for part in parts.clone() {
                let end = row.impact_at + part.offset + part.duration;
                if !(part.interval <= 0.0 && previous < end && end <= now)
                    || !launched.insert(part.id)
                {
                    continue;
                }
                // Several shapes can share a native part ID. Use the first
                // live shape in the group after tracking has updated.
                let [x, y] = parts
                    .clone()
                    .find(|candidate| candidate.id == part.id)
                    .expect("the due part belongs to the live group")
                    .anchor(zone);
                let z = Terrain::height(world, [x, y])
                    .or_else(|| Terrain::secondary_height(world, [x, y]))
                    .unwrap_or_else(|| Terrain::fallback_height(world));
                events.push(RunEvent::RaidSpellGo(SpellCast {
                    source_guid: row.source,
                    spell_id,
                    target: CastTarget::Ground(Position { x, y, z }),
                    hit_targets: Vec::new(),
                }));
            }
        }
    }

    fn update_warnings(
        &mut self,
        now: f32,
        heroes: &[HeroPose],
        bosses: &[RunBoss],
        zone: &ZoneDefinition,
        world: &impl RunWorld,
        events: &mut Vec<RunEvent>,
    ) {
        let mut cancelled = Vec::new();
        for row in &mut self.attacks {
            if !row.locked {
                let locking = now >= row.lock_at;
                for (index, part) in row.parts.iter_mut().enumerate() {
                    if locking {
                        break;
                    }
                    if row.retired_parts.contains(&index) {
                        continue;
                    }
                    if let Some(guid) = part.tracking {
                        let target = heroes.iter().find(|hero| hero.guid == guid);
                        match (target, &mut part.shape) {
                            (Some(target), Shape::Circle { center, .. }) => {
                                let point = [target.position.x, target.position.y];
                                row.tracking_dirty |=
                                    *center != point || part.z != target.position.z;
                                *center = point;
                                part.z = target.position.z;
                            }
                            (None, _) => {
                                row.retired_parts.insert(index);
                                events.push(RunEvent::RaidMarker(json!({
                                    "type": "atkx", "id": row.id, "part": index, "t": now, "why": "target",
                                })));
                            }
                            _ => {}
                        }
                    }
                    if let Some((guid, offset)) = part.aim {
                        let point = part.anchor(zone);
                        let origin = Position {
                            x: point[0],
                            y: point[1],
                            z: part.z,
                        };
                        let spell = row.kind.spell();
                        let target = heroes
                            .iter()
                            .find(|hero| hero.guid == guid)
                            .copied()
                            .or_else(|| match spell {
                                super::kirtonos::VOLLEY => None,
                                super::kirtonos::SWOOP => super::kirtonos::closest(heroes, origin),
                                _ => quiz_target(heroes, origin),
                            });
                        if target.is_none() && spell == super::kirtonos::VOLLEY {
                            cancelled.push(row.id);
                            break;
                        }
                        if let Some(target) = target {
                            part.aim = Some((target.guid, offset));
                            let angle = (target.position.y - origin.y)
                                .atan2(target.position.x - origin.x)
                                + offset;
                            match &mut part.shape {
                                Shape::Cone { angle: heading, .. } => {
                                    row.tracking_dirty |= *heading != angle;
                                    *heading = angle;
                                }
                                Shape::Rect { end, .. } if spell == super::kirtonos::VOLLEY => {
                                    let next = super::kirtonos::volley_endpoint(
                                        world, zone, origin, angle,
                                    );
                                    row.tracking_dirty |= *end != next;
                                    *end = next;
                                }
                                Shape::Capsule { end, .. } if spell == super::krastinov::HOOK => {
                                    let next =
                                        super::krastinov::hook_endpoint(world, zone, origin, angle);
                                    row.tracking_dirty |= *end != next;
                                    *end = next;
                                }
                                _ => {}
                            }
                        }
                    }
                }
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
                }
                if (locking
                    && (row.tracked.is_some()
                        || row
                            .parts
                            .iter()
                            .any(|part| part.tracking.is_some() || part.aim.is_some())))
                    || (row.tracking_dirty && now - row.last_update >= 0.1)
                {
                    row.publish_positions(now, events);
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
                if row.kind.spell() == super::barov::IMMOLATE {
                    if let Some(Part {
                        shape: Shape::Circle { center, .. },
                        ..
                    }) = row.parts.first()
                    {
                        self.immolate_impacts.push((row.source, *center));
                    }
                }
                events.push(RunEvent::RaidMarker(json!({
                    "type": "atka", "id": row.id, "t": now,
                })));
            }
        }
        if !cancelled.is_empty() {
            self.remove_where(now, "target", events, |row| cancelled.contains(&row.id));
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use super::super::rng_integration::TerrainFixture;

    #[test]
    fn scripted_launches_use_distinct_live_parts_at_their_end_times() {
        let zone = ZoneDefinition::by_key("scholomance").unwrap();
        let mut state = State::default();
        let mut events = Vec::new();
        let circle = |x| Part::impact(
            Shape::Circle { center: [x, 3.0], radius: 1.0 },
            1.0,
            "blue",
        );
        state.spawn(
            12,
            Kind::Quiz,
            0.0,
            Timing::standard(2.0),
            vec![
                circle(1.0),
                circle(2.0),
                circle(3.0),
                Part { id: 1, duration: 1.0, ..circle(4.0) },
                Part { id: 2, duration: 1.0, interval: 0.5, ..circle(5.0) },
            ],
            None,
            zone,
            &mut events,
        );
        state.attacks[0].retired_parts.insert(0);
        events.clear();
        state.publish_launches(2.0, 0.5, zone, &mut TerrainFixture, &mut events);
        state.publish_launches(3.0, 1.0, zone, &mut TerrainFixture, &mut events);
        state.publish_launches(3.5, 0.5, zone, &mut TerrainFixture, &mut events);
        assert!(matches!(
            events.as_slice(),
            [
                RunEvent::RaidSpellGo(first),
                RunEvent::RaidSpellGo(second),
            ] if first.source_guid == 12
                && first.spell_id == 17950
                && first.hit_targets.is_empty()
                && matches!(first.target, CastTarget::Ground(point) if point.x == 2.0)
                && matches!(second.target, CastTarget::Ground(point) if point.x == 4.0)
        ));
    }

    #[test]
    fn gandling_reads_live_shared_hits_before_retiring_the_source() {
        let zone = ZoneDefinition::by_key("scholomance").unwrap();
        let mut state = State::default();
        let mut events = Vec::new();
        state.spawn(
            12,
            Kind::Office,
            0.0,
            Timing::standard(2.5),
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
            Timing::standard(1.75),
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
