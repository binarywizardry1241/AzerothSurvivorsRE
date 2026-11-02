//! Native facing packets through the actual offline scheduling and client handlers.
use super::*;
use crate::local_client::{
    events::{LocalPresentationEvents, LocalPresentationPlugin},
    LocalActorsPlugin, LocalClientSession, LocalUnitEngineVisual, LocalUnitPath,
};
use benilla_assets::coords::wow_to_bevy;

fn client() -> App {
    crate::game_plugins::schedule_tests::headless_client_with(|app| {
        app.insert_resource(LocalClientSession {
            active: true,
            ..default()
        })
        .add_plugins((LocalActorsPlugin, LocalPresentationPlugin));
    })
}

fn packets() -> Vec<SessionEvent> {
    let fixture: serde_json::Value = serde_json::from_str(include_str!(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/../../docs/analysis/evidence/0.105.0/mob-movement/stationary-facing-fixtures.json"
    )))
    .unwrap();
    fixture["cases"]
        .as_array()
        .unwrap()
        .iter()
        .flat_map(|row| {
            let hex = row["packet_hex"].as_str().unwrap();
            let body: Vec<_> = (0..hex.len())
                .step_by(2)
                .map(|i| u8::from_str_radix(&hex[i..i + 2], 16).unwrap())
                .collect();
            benilla_protocol::decode(benilla_protocol::messages::parse_server(0xdd, &body).unwrap())
        })
        .collect()
}

const SOURCE: u64 = 0xf130000258000001;
const START: [f32; 3] = [1., 2., 40.];

fn mob(app: &mut App) -> Entity {
    let entity = app
        .world_mut()
        .spawn((
            Guid(SOURCE),
            NetEntity {
                kind: EntityKind::Unit,
                display_id: None,
                scale: 1.,
            },
            ObjectStore(ObjectFields::default()),
            LocalUnitEngineVisual,
            LocalUnitPath {
                from: START,
                to: START,
                started_at: 1.,
                duration_ms: 0,
                elapsed: 0.,
                facing: 2.2,
            },
            Transform::from_translation(wow_to_bevy(START)).with_scale(Vec3::splat(2.)),
        ))
        .id();
    app.world_mut()
        .resource_mut::<GuidIndex>()
        .0
        .insert(SOURCE, entity);
    entity
}

#[test]
fn stationary_facing_native_packets_win_over_the_local_stopped_pose_and_stay_settled() {
    for packet in packets() {
        let mut app = client();
        let mob = mob(&mut app);
        let target = app
            .world_mut()
            .spawn(Transform::from_translation(wow_to_bevy([4., 6., 80.])))
            .id();
        app.world_mut()
            .resource_mut::<GuidIndex>()
            .0
            .insert(1, target);
        app.world_mut()
            .resource_mut::<LocalPresentationEvents>()
            .0
            .push(packet);
        app.update();
        let pose = app.world().get::<Transform>(mob).unwrap();
        let expected = Quat::from_rotation_y(4.0_f32.atan2(3.));
        assert!(pose.rotation.abs_diff_eq(expected, 1e-5));
        assert_eq!(pose.translation, wow_to_bevy(START));
        assert_eq!(pose.scale, Vec3::splat(2.));
        // This packet resolves its target once. A changed target position and
        // the repeated host snapshot must not invent another facing packet.
        app.world_mut()
            .get_mut::<Transform>(target)
            .unwrap()
            .translation = wow_to_bevy([-4., -6., 80.]);
        app.update();
        assert!(app
            .world()
            .get::<Transform>(mob)
            .unwrap()
            .rotation
            .abs_diff_eq(expected, 1e-5));
    }
}

#[test]
fn stationary_facing_keeps_the_prior_heading_for_a_missing_or_coincident_target() {
    for target_position in [None, Some([START[0], START[1], 80.])] {
        let mut app = client();
        let mob = mob(&mut app);
        app.update(); // Seed the display-facing smoother with the old pose.
        assert!(app.world().get::<crate::net::DisplayFacing>(mob).is_some());
        app.world_mut()
            .get_mut::<LocalUnitPath>(mob)
            .unwrap()
            .started_at = 2.;
        app.world_mut()
            .get_mut::<LocalUnitPath>(mob)
            .unwrap()
            .facing = 0.75;
        if let Some(point) = target_position {
            let target = app
                .world_mut()
                .spawn(Transform::from_translation(wow_to_bevy(point)))
                .id();
            app.world_mut()
                .resource_mut::<GuidIndex>()
                .0
                .insert(1, target);
        }
        app.world_mut()
            .resource_mut::<LocalPresentationEvents>()
            .0
            .push(packets().remove(0));
        for _ in 0..3 {
            app.update();
        }
        assert!(app
            .world()
            .get::<Transform>(mob)
            .unwrap()
            .rotation
            .abs_diff_eq(Quat::from_rotation_y(2.2), 1e-5));
    }
}

#[test]
fn stationary_facing_raw_pose_resets_the_display_fallback_when_no_packet_owns_it() {
    let mut app = client();
    let mob = mob(&mut app);
    app.update();
    assert!(app.world().get::<crate::net::DisplayFacing>(mob).is_some());
    let mut path = app.world_mut().get_mut::<LocalUnitPath>(mob).unwrap();
    path.started_at = 2.;
    path.facing = 0.75;
    drop(path);
    for _ in 0..3 {
        app.update();
    }
    assert!(app
        .world()
        .get::<Transform>(mob)
        .unwrap()
        .rotation
        .abs_diff_eq(Quat::from_rotation_y(0.75), 1e-5));
}
