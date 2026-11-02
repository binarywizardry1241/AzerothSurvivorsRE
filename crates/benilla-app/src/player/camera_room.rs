//! Selected 0.105.0 Scarlet Monastery camera correction, 140b07260.
//! Native contracts and limits: docs/analysis/camera-room-0.105.0.md.

use super::{CameraControl, Player, camera::FlyCam};
use benilla_world::{
    collision::WorldCollision, view::WorldCamera, world_map::CurrentMap, world_point::WorldPoint,
};
use bevy::prelude::*;

const MAX_PITCH: f32 = f32::from_bits(0x3fb2_b8c3); // 80 degrees

/// Correct the placed eye, retaining the ordinary controller's requested pose.
/// The native state is one Local<f32>; failed map/length/pivot gates reset it.
pub(super) fn correct_view(
    time: Res<Time>,
    map: Option<Res<CurrentMap>>,
    player: Res<Player>,
    rig: Res<CameraControl>,
    world: WorldPoint,
    collision: WorldCollision,
    mut camera: Query<&mut Transform, (With<WorldCamera>, With<FlyCam>)>,
    mut tilt: Local<f32>,
) {
    let Ok(mut eye) = camera.single_mut() else {
        return;
    };
    let pivot = player.pos + Vec3::Y * rig.pivot.probe().0;
    let Some((position, rotation)) = correct_pose(
        map.as_ref().map(|m| m.0),
        pivot,
        *eye,
        time.delta_secs(),
        &mut tilt,
        |point| world.camera_room_at(point),
        |origin, movement| collision.cast_camera(origin, movement, false),
    ) else {
        return;
    };
    eye.translation = position;
    eye.rotation = rotation;
}

fn direction(horizontal: Vec3, pitch: f32) -> Vec3 {
    horizontal.normalize() * pitch.cos() + Vec3::Y * pitch.sin()
}

fn correct_pose(
    map: Option<u32>,
    pivot: Vec3,
    eye: Transform,
    dt: f32,
    tilt: &mut f32,
    inside: impl Fn(Vec3) -> bool,
    cast: impl Fn(Vec3, Vec3) -> Option<f32>,
) -> Option<(Vec3, Quat)> {
    let offset = eye.translation - pivot;
    let distance = offset.length();
    let horizontal = Vec3::new(offset.x, 0.0, offset.z);
    if map != Some(189) || !(distance >= 2.0) || !(horizontal.length() > 0.001) || !inside(pivot) {
        *tilt = 0.0;
        return None;
    }
    let base = (offset.y / distance).asin();
    let mut target = 0.0;
    if base < MAX_PITCH && !inside(eye.translation) {
        target = MAX_PITCH - base;
        for step in 1..=10 {
            let delta = (step as f32 * (MAX_PITCH - base)) / 10.0;
            let ray = direction(horizontal, base + delta) * distance;
            if inside(pivot + ray) && cast(pivot, ray).is_none_or(|hit| hit >= distance * 0.97) {
                target = delta;
                break;
            }
        }
    }
    let rate = if target > *tilt { 12.0 } else { 2.5 };
    *tilt += (target - *tilt) * (1.0 - (-rate * dt).exp());
    if *tilt < 0.0001 && inside(eye.translation) {
        return None;
    }
    let pitch = (base + *tilt).min(base.max(MAX_PITCH));
    let ray = direction(horizontal, pitch);
    let mut reach = cast(pivot, ray * distance).map_or(distance, |hit| hit.min(distance));
    if !inside(pivot + ray * reach) {
        let mut low = 0.0;
        for _ in 0..8 {
            let mid = (reach + low) * 0.5;
            if inside(pivot + ray * mid) {
                low = mid;
            } else {
                reach = mid;
            }
        }
        reach = low;
    }
    Some((
        pivot + ray * reach,
        Quat::from_rotation_arc(offset / distance, ray) * eye.rotation,
    ))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn leaving_map_or_first_person_clears_the_local_bias() {
        let mut tilt = 0.5;
        let eye = Transform::from_xyz(0.0, 1.0, 10.0);
        assert!(
            correct_pose(
                Some(0),
                Vec3::ZERO,
                eye,
                0.1,
                &mut tilt,
                |_| panic!("map gate precedes world queries"),
                |_, _| None
            )
            .is_none()
        );
        assert_eq!(tilt, 0.0);
        tilt = 0.5;
        assert!(
            correct_pose(
                Some(189),
                eye.translation,
                eye,
                0.1,
                &mut tilt,
                |_| panic!("distance gate precedes world queries"),
                |_, _| None
            )
            .is_none()
        );
        assert_eq!(tilt, 0.0);
    }

    #[test]
    fn a_room_that_accepts_a_steeper_pitch_keeps_the_distance() {
        let mut tilt = 0.0;
        let eye = Transform::from_xyz(0.0, 0.0, 20.0);
        let (position, _) = correct_pose(
            Some(189),
            Vec3::ZERO,
            eye,
            1.0,
            &mut tilt,
            |p| p.z < 18.0,
            |_, _| None,
        )
        .unwrap();
        assert!(tilt > 0.0);
        assert!((position.length() - 20.0).abs() < 0.0001);
        assert!(position.z < 18.0);
    }

    #[test]
    fn blocked_pitch_falls_back_to_the_last_inside_bisection_bound() {
        let mut tilt = 0.0;
        let eye = Transform::from_xyz(0.0, 0.0, 20.0);
        let (position, _) = correct_pose(
            Some(189),
            Vec3::ZERO,
            eye,
            0.0,
            &mut tilt,
            |p| p.z <= 5.0,
            |_, _| Some(12.0),
        )
        .unwrap();
        assert_eq!(position.z, 4.96875); // eight bisections of [0,12]
    }
}
