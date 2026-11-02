//! Primary-boss aiming recovered at 0.121.0 145bf22a0..145bf29b6.
//! The separate 0.127.0 hazard-position contract is in mograine-marks-0.127.0.md.
//! The input is the admitted movement report, never a frame-position delta.

use super::{abilities::{CombatContext, CombatPort, missile_travel_delay},
    raid_native_catalog::ACTIONS, Position, RawBossAbility};

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct MovementReport {
    pub position: Position,
    pub facing: f32,
    pub flags: u32,
    pub accepted_at: f32,
}

impl MovementReport {
    /// The native movement domain uses bits 0/1 and 2/3 as signed axes.
    /// Opposed flags cancel. Bit 0x1000 suppresses both axes; 0x100 uses 2.5.
    pub fn velocity(self, run_speed: f32) -> [f32; 2] {
        let forward = i32::from(self.flags & 1 != 0) - i32::from(self.flags & 2 != 0);
        let strafe = i32::from(self.flags & 4 != 0) - i32::from(self.flags & 8 != 0);
        if self.flags & 0x1000 != 0 || (forward == 0 && strafe == 0) {
            return [0.0; 2];
        }
        // MAXSS returns its second operand for an unordered first operand.
        let run_speed = if run_speed > 1.0 { run_speed } else { 1.0 };
        let speed = if self.flags & 0x100 != 0 { 2.5 }
            else if strafe == 0 && forward < 0 { 4.5 } else { run_speed };
        let angle = self.facing + (strafe as f32).atan2(forward as f32);
        [angle.cos() * speed, angle.sin() * speed]
    }
}

fn clipped(from: Position, to: Position, port: &mut impl CombatPort) -> Position {
    let Some(fraction) = port.ray_fraction(from, to) else { return to };
    // Native UCOMISS/JAE leaves an unordered ray result on the clipping lane.
    if fraction >= 1.0 { return to; }
    let dx = to.x - from.x;
    let dy = to.y - from.y;
    let length = (dy * dy + dx * dx).sqrt();
    let length = if length > 0.5 { length } else { 0.5 };
    let fraction = fraction - 0.5 / length;
    let fraction = if fraction > 0.0 { fraction } else { 0.0 };
    Position { x: dx * fraction + from.x, y: dy * fraction + from.y,
        z: (to.z - from.z) * fraction + from.z }
}

fn clamped(mut point: Position, port: &impl CombatPort) -> Position {
    if let Some((center, radius)) = port.raid_zone_bounds() {
        let dx = point.x - center[0];
        let dy = point.y - center[1];
        let length = dx.hypot(dy);
        let radius = radius - 4.0;
        if !(0.01 > length) && !(radius >= length) {
            point.x = dx / length * radius + center[0];
            point.y = dy / length * radius + center[1];
        }
    }
    point
}

/// 0.127.0 ground-hazard admission keeps the grounded admitted point and
/// independently projects report lag. Tracking uses the first point; escape
/// admission also checks the second. There is no boss lead or zone clamp.
pub fn hazard_positions(report: MovementReport, run_speed: f32, now: f32,
    port: &mut impl CombatPort) -> (Position, Position) {
    let mut accepted = report.position;
    accepted.z = port.primary_height([accepted.x, accepted.y])
        .or_else(|| port.secondary_height([accepted.x, accepted.y]))
        .unwrap_or(accepted.z);
    let velocity = report.velocity(run_speed);
    let lag = (now - report.accepted_at) + 0.0;
    let lag = if 0.0 > lag { 0.0 } else { lag };
    let lag = if 1.0 < lag { 1.0 } else { lag };
    let projected = Position { x: velocity[0] * lag + report.position.x,
        y: velocity[1] * lag + report.position.y, z: report.position.z };
    (accepted, clipped(accepted, projected, port))
}

/// Terrain/collision remain the existing engine interfaces. Only primary
/// height is sampled here; failed samples retain the preceding native Z.
pub fn aim(report: MovementReport, run_speed: f32, rank: u8, now: f32,
    windup: f32, primary_boss: bool, port: &mut impl CombatPort) -> Position {
    let mut point = report.position;
    point.z = port.primary_height([point.x, point.y]).unwrap_or(point.z);
    if !primary_boss { return point; }
    let velocity = report.velocity(run_speed);
    let lag = (now - report.accepted_at) + 0.0;
    // Current MAXSS/MINSS operand order, including its unordered lanes.
    let lag = if 0.0 > lag { 0.0 } else { lag };
    let lag = if 1.0 < lag { 1.0 } else { lag };
    let extrapolated = Position { x: velocity[0] * lag + report.position.x,
        y: velocity[1] * lag + report.position.y, z: report.position.z };
    point = clipped(point, extrapolated, port);
    point = clamped(point, port);
    point.z = port.primary_height([point.x, point.y]).unwrap_or(point.z);

    let scale = crate::heroic::warning_factor(rank);
    let seconds = (f32::from(rank) * 0.1 + 0.15) * (windup * scale);
    let mut dx = velocity[0] * seconds;
    let mut dy = velocity[1] * seconds;
    let length = dx.hypot(dy);
    if 0.05 > length { return point; }
    if length > 9.0 {
        let scale = 9.0 / length;
        dx *= scale;
        dy *= scale;
    }
    let led = Position { x: point.x + dx, y: point.y + dy, z: point.z };
    let mut led = clamped(clipped(point, led, port), port);
    led.z = port.primary_height([led.x, led.y]).unwrap_or(led.z);
    led
}

/// The nine current native call sites project once per action, before its
/// random offsets. Delayed sequence children re-enter with their own windup.
/// Matching six semantic payload words deliberately omits scheduler repeat.
pub fn windup(record: &RawBossAbility, context: CombatContext) -> Option<f32> {
    let w = record.words;
    match w[0] {
        1 => Some(missile_travel_delay(w[1], context.source, context.player)),
        5 => Some(f32::from_bits(w[4])),
        9 => Some(1.0),
        10 | 17 => {
            let action = if w[0] == 17 { ACTIONS.get(w[1] as usize) }
                else { ACTIONS.iter().find(|row| row.ability.words[..6] == w[..6]) }?;
            let index = match action.native_tag {
                8 | 9 | 15 | 16 => 3,
                10 | 17 => 4,
                _ => return None,
            };
            Some(f32::from_bits(action.words[index]))
        }
        _ => None,
    }
}
