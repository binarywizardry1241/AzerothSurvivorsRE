//! The terminal stop and the 0.141.0 choice snapshot both visit the shared
//! hostile, combat follower and loot companion collections in this order.

use super::*;
use azeroth_survivors_re::run_effects::{loot_companions, pet_tick::PetMotion};

enum WorldMovement<'a> {
    Hostile(&'a mut Actor),
    Follower {
        guid: u64,
        motion: &'a mut PetMotion,
        next_update: &'a mut f32,
    },
    LootCompanion(&'a mut loot_companions::Actor),
}

fn active_motion(now: f32, start: f32, duration: f32) -> bool {
    duration > 0.0 && start + duration > now
}

fn stop_motion(
    motion: &mut PetMotion,
    now: f32,
    companion: bool,
    height: &mut impl FnMut([f32; 2]) -> Option<f32>,
) -> Option<Position> {
    // The companion owner checks the deadline first and permits a future
    // zero-duration row. Combat followers require a strictly positive duration.
    if companion {
        if now >= motion.started_at + motion.duration {
            return None;
        }
    } else if !active_motion(now, motion.started_at, motion.duration) {
        return None;
    }
    let mut point = motion.position_at(now);
    if let Some(z) = height([point[0], point[1]]) {
        point[2] = z;
    }
    *motion = PetMotion::stationary(point, now);
    Some(Position::from(point))
}

fn stopped(events: &mut Vec<RunEvent>, serial: &mut u32, target: u64, point: Position) {
    *serial = serial.wrapping_add(1);
    events.push(RunEvent::StoppedMovement {
        target,
        position: point,
        serial: *serial,
    });
}

impl Mechanics {
    fn visit_world_movements(
        &mut self,
        mut visit: impl FnMut(WorldMovement<'_>, &mut Vec<RunEvent>, &mut u32),
    ) {
        // Native shared vectors retain append order. Keep the allocator's full
        // internal chronology: GUIDs discard the high counter bits, so a live
        // survivor can otherwise move behind newer rows after one GUID cycle.
        let current = self.counter.sequence();
        let age = |order: u64| std::cmp::Reverse(current.wrapping_sub(order));
        let mut actors: Vec<_> = self
            .actors
            .iter_mut()
            .map(|row| (row.allocation_order, &mut row.actor))
            .chain(
                self.bosses
                    .iter_mut()
                    .map(|row| (row.allocation_order, &mut row.actor)),
            )
            .chain(
                self.boss_state
                    .wards
                    .actors
                    .iter_mut()
                    .map(|row| (row.allocation_order, &mut row.actor)),
            )
            .collect();
        actors.sort_by_key(|(order, _)| age(*order));
        for (_, actor) in actors {
            visit(
                WorldMovement::Hostile(actor),
                &mut self.events,
                &mut self.movement_counter,
            );
        }
        let mut followers: Vec<_> = self
            .pet_state
            .rows
            .iter_mut()
            .map(|row| {
                (
                    row.allocation_order,
                    row.guid,
                    &mut row.tick.motion,
                    &mut row.tick.next_update,
                )
            })
            .chain(self.demon_state.rows.iter_mut().map(|row| {
                (
                    row.allocation_order,
                    row.guid,
                    &mut row.tick.motion,
                    &mut row.tick.next_update,
                )
            }))
            .collect();
        followers.sort_by_key(|(order, _, _, _)| age(*order));
        for (_, guid, motion, next_update) in followers {
            visit(
                WorldMovement::Follower {
                    guid,
                    motion,
                    next_update,
                },
                &mut self.events,
                &mut self.movement_counter,
            );
        }
        for row in &mut self.loot_companion_state.actors {
            visit(
                WorldMovement::LootCompanion(row),
                &mut self.events,
                &mut self.movement_counter,
            );
        }
    }

    pub(super) fn freeze_world_movements(
        &mut self,
        mut height: impl FnMut([f32; 2]) -> Option<f32>,
    ) {
        let now = self.clock;
        self.visit_world_movements(|row, events, serial| match row {
            WorldMovement::Hostile(actor) => {
                let movement = actor.movement;
                if actor.dead || !active_motion(now, movement.started_at, movement.duration) {
                    return;
                }
                let mut point = movement.position_at(now);
                if let Some(z) = height([point.x, point.y]) {
                    point.z = z;
                }
                actor.movement = ai::Movement {
                    from: point,
                    to: point,
                    started_at: now,
                    duration: 0.0,
                };
                stopped(events, serial, actor.guid, point);
            }
            WorldMovement::Follower {
                guid,
                motion,
                next_update,
            } => {
                if let Some(point) = stop_motion(motion, now, false, &mut height) {
                    *next_update = now;
                    stopped(events, serial, guid, point);
                }
            }
            WorldMovement::LootCompanion(row) => {
                if let Some(point) = stop_motion(&mut row.motion, now, true, &mut height) {
                    row.next_update = now;
                    stopped(events, serial, row.guid, point);
                }
            }
        });
    }

    /// 0.141.0 145fb828c and 145fb90d7 call 145f87480 through separate
    /// publishers. Both read active splines without overwriting them.
    fn publish_choice_movements(&mut self, resume: bool) {
        let now = self.clock;
        self.visit_world_movements(|row, events, serial| {
            let (source, from, to, end) = match row {
                WorldMovement::Hostile(actor) => {
                    let motion = actor.movement;
                    if actor.dead || !active_motion(now, motion.started_at, motion.duration) {
                        return;
                    }
                    (
                        actor.guid,
                        motion.position_at(now),
                        motion.to,
                        motion.started_at + motion.duration,
                    )
                }
                WorldMovement::Follower { guid, motion, .. } => {
                    if !active_motion(now, motion.started_at, motion.duration) {
                        return;
                    }
                    (
                        guid,
                        motion.position_at(now).into(),
                        motion.to.into(),
                        motion.started_at + motion.duration,
                    )
                }
                WorldMovement::LootCompanion(row) => {
                    let motion = row.motion;
                    let end = motion.started_at + motion.duration;
                    // This selector rejects a nonpositive duration before
                    // comparing now against the deadline.
                    if !(motion.duration > 0.0) || now >= end {
                        return;
                    }
                    (
                        row.guid,
                        motion.position_at(now).into(),
                        motion.to.into(),
                        end,
                    )
                }
            };
            *serial = serial.wrapping_add(1);
            events.push(RunEvent::ChoiceMovement {
                source,
                from,
                continuation: resume.then_some((to, end - now)),
                serial: *serial,
            });
        });
    }

    pub(super) fn pause_choice_movements(&mut self) {
        if !self.has_party() && !self.choice_state.world_paused && !self.choices.is_empty() {
            self.choice_state.world_paused = true;
            self.publish_choice_movements(false);
        }
    }

    pub(super) fn resume_choice_movements(&mut self) {
        self.choice_state.world_paused = false;
        if !self.has_party() {
            self.publish_choice_movements(true);
        }
    }
}
