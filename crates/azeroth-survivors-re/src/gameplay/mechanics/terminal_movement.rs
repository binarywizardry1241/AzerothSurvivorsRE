//! Current145924710 freezes hostile actors, combat followers and loot companions
//! before terminal publication. Primary-height misses retain interpolated Z.

use super::*;
use azeroth_survivors_re::run_effects::pet_tick::PetMotion;

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
    } else if !(motion.duration > 0.0 && motion.started_at + motion.duration > now) {
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
    pub(super) fn freeze_world_movements(
        &mut self,
        mut height: impl FnMut([f32; 2]) -> Option<f32>,
    ) {
        let now = self.clock;
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
            if actor.dead
                || !(actor.movement.duration > 0.0
                    && actor.movement.started_at + actor.movement.duration > now)
            {
                continue;
            }
            let mut point = actor.movement.position_at(now);
            if let Some(z) = height([point.x, point.y]) {
                point.z = z;
            }
            actor.movement = ai::Movement {
                from: point,
                to: point,
                started_at: now,
                duration: 0.0,
            };
            stopped(
                &mut self.events,
                &mut self.movement_counter,
                actor.guid,
                point,
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
            if let Some(point) = stop_motion(motion, now, false, &mut height) {
                *next_update = now;
                stopped(&mut self.events, &mut self.movement_counter, guid, point);
            }
        }
        for row in &mut self.loot_companion_state.actors {
            if let Some(point) = stop_motion(&mut row.motion, now, true, &mut height) {
                row.next_update = now;
                stopped(
                    &mut self.events,
                    &mut self.movement_counter,
                    row.guid,
                    point,
                );
            }
        }
    }
}
