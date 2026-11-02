//! Authoritative offline paths use the ordinary spline/ground/gait pipeline.

use std::time::{Duration, Instant};

use benilla_assets::coords::wow_to_bevy;
use bevy::prelude::*;

use crate::net::{DisplayFacing, Guid, Spline, SplineElapsed};
use benilla_protocol::{MonsterMoveFacing, SessionEvent};

use super::{LocalClientSession, LocalUnitEngineVisual};

/// A ground path from the host's current actor state. Endpoint heights have
/// already passed through the game's terrain port. `started_at` identifies a
/// new path; `elapsed` advances with the run clock, including across UI pauses.
/// A zero duration is a stopped/relocated pose, installed only when it changes.
#[derive(Component, Clone, Copy, Debug)]
pub struct LocalUnitPath {
    pub from: [f32; 3],
    pub to: [f32; 3],
    pub started_at: f32,
    pub duration_ms: u32,
    pub elapsed: f32,
    pub facing: f32,
}

impl LocalUnitPath {
    fn key(self) -> [u32; 9] {
        [
            self.from[0].to_bits(),
            self.from[1].to_bits(),
            self.from[2].to_bits(),
            self.to[0].to_bits(),
            self.to[1].to_bits(),
            self.to[2].to_bits(),
            self.started_at.to_bits(),
            self.duration_ms,
            self.facing.to_bits(),
        ]
    }
}

#[derive(Component)]
pub(crate) struct FollowingPath {
    key: [u32; 9],
    start: Instant,
}

/// Run before the normal Net stage so it samples the path and then grounds it.
/// Never overwrite its terrain-resolved pose with the host's raw XYZ chord.
pub(crate) fn follow_paths(
    mut commands: Commands,
    session: Res<LocalClientSession>,
    packets: Option<Res<super::events::LocalPresentationEvents>>,
    mut units: Query<
        (
            Entity,
            &LocalUnitPath,
            Option<&Guid>,
            Option<&mut FollowingPath>,
            &mut Transform,
        ),
        With<LocalUnitEngineVisual>,
    >,
) {
    if !session.active {
        return;
    }
    for (entity, path, guid, following, mut transform) in &mut units {
        let key = path.key();
        let changed = following.as_ref().is_none_or(|old| old.key != key);
        let start = if changed {
            Instant::now()
        } else {
            following.as_ref().unwrap().start
        };
        let age = Duration::from_secs_f32(
            path.elapsed
                .max(0.0)
                .min(Duration::from_millis(u64::from(path.duration_ms)).as_secs_f32()),
        );
        if changed {
            if path.duration_ms == 0 {
                transform.translation = wow_to_bevy(path.to);
                // The pending packet owns the heading, even when its target
                // cannot resolve. In that case the client keeps the old yaw;
                // the host's unrelated orbit angle must not replace it first.
                let packet_facing = guid.is_some_and(|guid| {
                    packets.as_ref().is_some_and(|packets| {
                        packets.0.iter().any(|packet| {
                            matches!(packet,
                        SessionEvent::MonsterMove { guid: source, facing, .. }
                        if *source == guid.0 && !matches!(facing, MonsterMoveFacing::None))
                        })
                    })
                });
                if !packet_facing {
                    transform.rotation = Quat::from_rotation_y(path.facing);
                    commands.entity(entity).remove::<DisplayFacing>();
                }
                commands.entity(entity).remove::<(Spline, SplineElapsed)>();
            } else {
                commands.entity(entity).insert(Spline {
                    points: vec![path.from, path.to],
                    start,
                    duration: Duration::from_millis(u64::from(path.duration_ms)),
                    // Internal continuity token, not a replacement game counter.
                    id: path.started_at.to_bits(),
                    grounded: true,
                    run_mode: true,
                    deck: None,
                });
            }
            if let Some(mut following) = following {
                following.key = key;
                following.start = start;
            } else {
                commands.entity(entity).insert(FollowingPath { key, start });
            }
        }
        if path.duration_ms != 0 {
            commands.entity(entity).insert(SplineElapsed(age));
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn path_speed_uses_actual_duration_and_stopped_poses_do_not_erase_grounding() {
        let mut app = App::new();
        app.insert_resource(LocalClientSession {
            active: true,
            ..default()
        })
        .add_systems(Update, follow_paths);
        let path = LocalUnitPath {
            from: [0., 0., 10.],
            to: [18., 0., 10.],
            started_at: 1.,
            duration_ms: 4000,
            elapsed: 0.,
            facing: 0.,
        };
        let body = app
            .world_mut()
            .spawn((path, LocalUnitEngineVisual, Transform::default()))
            .id();
        app.update();
        assert_eq!(app.world().get::<Spline>(body).unwrap().speed(), 4.5);
        // The same displacement under a slow takes twice as long. Base move
        // speed must not continue driving a run animation at the old rate.
        app.world_mut()
            .get_mut::<LocalUnitPath>(body)
            .unwrap()
            .duration_ms = 8000;
        app.update();
        assert_eq!(app.world().get::<Spline>(body).unwrap().speed(), 2.25);
        // Relocation is a new zero-duration pose, not an animated flight.
        app.world_mut().entity_mut(body).insert(LocalUnitPath {
            from: [40., 20., 3.],
            to: [40., 20., 3.],
            started_at: 5.,
            duration_ms: 0,
            elapsed: 0.,
            facing: 1.,
        });
        app.update();
        assert!(app.world().get::<Spline>(body).is_none());
        assert!(app.world().get::<SplineElapsed>(body).is_none());
        let expected = wow_to_bevy([40., 20., 3.]);
        assert_eq!(
            app.world().get::<Transform>(body).unwrap().translation,
            expected
        );
        // Emulate the ordinary ground owner's resolved height. The next host
        // snapshot must leave it in place instead of restoring raw spawn Z.
        app.world_mut()
            .get_mut::<Transform>(body)
            .unwrap()
            .translation
            .y += 0.2;
        app.update();
        assert_eq!(
            app.world().get::<Transform>(body).unwrap().translation.y,
            expected.y + 0.2
        );
    }
}
