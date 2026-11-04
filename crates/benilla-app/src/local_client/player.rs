//! Local-session lifecycle around the ordinary player controller.
//!
//! This file is a child of `crate::player` so it can reset the controller's own state at a
//! session boundary. Movement, mouse input, capsule collision and camera seating remain in
//! the existing controller; this host neither integrates position nor computes a camera pose.

use bevy::prelude::*;
use bevy::window::{CursorGrabMode, CursorOptions, PrimaryWindow};

use benilla_assets::coords::{bevy_to_wow, wow_to_bevy};
use benilla_protocol::{messages::ObjectType, EntityKind, MoveSpeeds, ObjectFields};
use benilla_world::schedule::WorldStage;
use benilla_world::view::WorldCamera;
use benilla_world::vis_chain::VisChainOnly;
use benilla_world::world_map::CurrentMap;

use crate::local_client::{LocalClientSession, LocalPlayerUi};
use crate::net::{FieldChanged, Guid, GuidIndex, NetEntity, ObjectStore, SelfGuid, UnitSpeeds};

pub use super::state::MovementReport as LocalMovementReport;
use super::{CameraControl, FlyCam, Player, PlayerControlSet};

/// A new run's placement and initial speed. Later speed changes enter through
/// LocalPresentationEvents and the ordinary forced-speed consumer. Changing `identity`
/// starts a new body even when its character guid and map are unchanged.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LocalPlayerRequest {
    pub identity: u64,
    pub map_id: u32,
    pub position_wow: [f32; 3],
    pub facing: f32,
    pub run_speed: f32,
    pub camera_distance: f32,
    /// `None` retains the ordinary controller's login-pitch policy. An explicit pitch is
    /// radians in its up-positive convention, as stored by `FlyCam`.
    pub camera_pitch: Option<f32>,
}

/// The host sets this before beginning a session; presence alone does not start the session.
#[derive(Resource, Default, Clone, Debug)]
pub struct LocalPlayerSpawn {
    pub request: Option<LocalPlayerRequest>,
}

/// Actual outgoing controller reports, replaced each readback frame.
#[derive(Resource, Default, Clone, Debug)]
pub struct LocalMovementReports {
    pub identity: u64,
    pub reports: Vec<LocalMovementReport>,
}

/// Authoritative same-map relocation, delivered through the ordinary teleport consumer.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LocalCorrectionRequest {
    pub identity: u64,
    pub position_wow: [f32; 3],
    pub facing: f32,
}
#[derive(Resource, Default, Clone, Debug)]
pub struct LocalPlayerCorrection {
    pub request: Option<LocalCorrectionRequest>,
}

/// An already-resolved native outfit record. `slot` is the native zero-based equipment slot,
/// 0 head through 18 tabard. A missing row or display zero leaves that slot empty.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct LocalEquipmentDisplay {
    pub slot: u8,
    pub display_id: u32,
    pub inventory_type: u8,
}

#[derive(Resource, Default, Clone, Debug, PartialEq, Eq)]
pub struct LocalPlayerEquipment {
    pub rows: Vec<LocalEquipmentDisplay>,
}

/// The recovered item properties needed for the stock weapon's animation/stow selection.
/// Kept separate from the display records so no incomplete ItemInfo template is fabricated.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct LocalEquipmentMetadata {
    pub slot: u8,
    pub item_class: u8,
    pub item_subclass: u8,
    pub sheath: u8,
    pub material: Option<u8>,
}

#[derive(Resource, Default, Clone, Debug, PartialEq, Eq)]
pub struct LocalPlayerEquipmentMetadata {
    pub rows: Vec<LocalEquipmentMetadata>,
}

/// Present only on the avatar owned by this local host. The ordinary equipment resolver reads
/// the resolved display records directly, then follows its existing model/attachment paths.
#[derive(Component, Default, Clone, Debug, PartialEq, Eq)]
pub(crate) struct LocalEquipmentVisuals {
    pub(crate) rows: Vec<LocalEquipmentDisplay>,
    pub(crate) metadata: Vec<LocalEquipmentMetadata>,
}

impl LocalEquipmentVisuals {
    pub(crate) fn item(&self, slot: u8) -> Option<&LocalEquipmentDisplay> {
        self.rows
            .iter()
            .rev()
            .find(|row| row.slot == slot)
            .filter(|row| row.display_id != 0)
    }

    pub(crate) fn traits(&self, slot: u8) -> Option<&LocalEquipmentMetadata> {
        self.metadata.iter().rev().find(|row| row.slot == slot)
    }
}

/// The ordinary controller's resolved body state, after input and before world streaming.
#[derive(Resource, Default, Clone, Copy, Debug, PartialEq)]
pub struct LocalPlayerPose {
    /// The request identity of this actual body, so a host rejects a prior run's readback.
    pub identity: u64,
    pub active: bool,
    pub settling: bool,
    pub position_wow: [f32; 3],
    /// Last actual controller movement report, using its existing transition/
    /// heartbeat policy. It is distinct from the per-render-frame pose.
    pub reported_position_wow: [f32; 3],
    pub facing: f32,
    pub move_flags: u32,
    pub planar_speed: f32,
}

#[derive(SystemSet, Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum LocalPlayerSet {
    Prepare,
    Hold,
    Readback,
    /// The ordinary client's camera visibility gate. An external menu compositor can order
    /// its own world-preview visibility override after this set.
    CameraGate,
}

#[derive(Resource, Default)]
struct LocalBody {
    identity: Option<(u64, u64)>,
    entity: Option<Entity>,
    snapshot: Option<LocalPlayerUi>,
    /// Last frame whose paused interval has already been removed from the controller clocks.
    paused_at: Option<f32>,
    cursor_return: Option<Vec2>,
    release_cursor: bool,
    correction_counter: u32,
}

/// Installed beside the full client's existing `PlayerPlugin`, once. Networking remains the
/// enclosing local-client plugin's responsibility; this plugin opens no connection.
pub struct LocalPlayerPlugin;

impl Plugin for LocalPlayerPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<LocalPlayerSpawn>()
            .init_resource::<LocalPlayerPose>()
            .init_resource::<LocalMovementReports>()
            .init_resource::<LocalPlayerCorrection>()
            .init_resource::<LocalPlayerEquipment>()
            .init_resource::<LocalPlayerEquipmentMetadata>()
            .init_resource::<LocalBody>()
            .configure_sets(Update, LocalPlayerSet::Prepare.before(WorldStage::Net))
            .configure_sets(
                Update,
                LocalPlayerSet::Hold
                    .in_set(WorldStage::Input)
                    .after(crate::bindings::BindingSet)
                    .after(super::camera::latch_world_mouse)
                    .before(super::follow::steer_follow)
                    .before(super::approach::steer_approach)
                    .before(PlayerControlSet),
            )
            .configure_sets(
                Update,
                LocalPlayerSet::Readback
                    .after(WorldStage::Input)
                    .before(WorldStage::Stream),
            )
            .configure_sets(Update, PlayerControlSet.run_if(controller_enabled))
            .add_systems(
                Update,
                (sync_body, queue_correction)
                    .chain()
                    .in_set(LocalPlayerSet::Prepare),
            )
            .add_systems(Update, hold_input.in_set(LocalPlayerSet::Hold))
            .add_systems(
                Update,
                paused_mover_edges
                    .after(WorldStage::Net)
                    .before(LocalPlayerSet::Hold),
            )
            .add_systems(Update, read_pose.in_set(LocalPlayerSet::Readback));
    }
}

fn controller_enabled(session: Res<LocalClientSession>, player: Res<Player>) -> bool {
    // A paused entry still adopts its first body once: that starts the existing settle hold
    // and publishes the destination focus, without which loading could never finish.
    session.active && (!session.paused || !player.active)
}

/// Inbound root/unroot remains live while an embedding pauses its simulation.
/// The ordinary controller is gated off then; leaving these in its two-frame
/// message buffer would drop a victory root before the summary was dismissed.
fn paused_mover_edges(
    mut commands: Commands,
    body: Query<Entity, With<super::Embodied>>,
    session: Res<LocalClientSession>,
    time: Res<Time>,
    mut player: ResMut<Player>,
    net: Res<crate::net::NetCommands>,
    mut modes: ResMut<Messages<crate::net::MoveModeMessage>>,
    mut speeds: ResMut<Messages<crate::net::SpeedChangeMessage>>,
    mut teleports: ResMut<Messages<crate::net::TeleportMessage>>,
    mut cameras: Query<&mut FlyCam, With<WorldCamera>>,
) {
    if session.active && session.paused && player.active {
        let Ok(mut cam) = cameras.single_mut() else { return };
        // This is the only controller in an offline session. Drain rather than
        // retain a second reader that would replay the grant when it resumes.
        for teleport in teleports.drain() {
            super::wire_in::apply_teleport(&mut player, &mut cam, &teleport,
                time.elapsed_secs(), &net);
        }
        for mode in modes.drain() {
            let ended = super::wire_in::apply_move_mode(&mut player, &mode, &net);
            if let (true, Ok(entity)) = (ended, body.single()) {
                crate::creature_anim::end_precast(
                    &mut commands, entity, crate::creature_anim::PrecastTail::Run,
                );
            }
        }
        super::movement_net::ack_speeds_undriven(&net.0, &player,
            &speeds.drain().collect::<Vec<_>>());
    }
}

#[allow(clippy::too_many_arguments)]
fn sync_body(
    mut commands: Commands,
    session: Res<LocalClientSession>,
    spawn: Res<LocalPlayerSpawn>,
    equipment: Res<LocalPlayerEquipment>,
    equipment_metadata: Res<LocalPlayerEquipmentMetadata>,
    mut local: ResMut<LocalBody>,
    mut player: ResMut<Player>,
    mut rig: ResMut<CameraControl>,
    mut self_guid: ResMut<SelfGuid>,
    mut index: ResMut<GuidIndex>,
    mut current_map: ResMut<CurrentMap>,
    mut names: ResMut<crate::names::NameCache>,
    mut bodies: Query<(
        &mut ObjectStore,
        &mut NetEntity,
        &mut LocalEquipmentVisuals,
    )>,
    mut edges: MessageWriter<FieldChanged>,
) {
    let wanted = session
        .active
        .then_some(session.player.as_ref())
        .flatten()
        .zip(spawn.request);
    let Some((character, request)) = wanted else {
        if local.identity.is_some() {
            remove_body(&mut commands, &mut local, &mut index, &mut self_guid);
            *player = Player::default();
        }
        return;
    };
    if !valid_request(&request) || character.guid == 0 || character.display_id == 0 {
        return;
    }

    let identity = (request.identity, character.guid);
    if local.identity != Some(identity) {
        // A direct local run switch may happen during a look gesture. Keep the old stash before
        // resetting its rig; the host must never leave the OS cursor captured by a dead body.
        local.cursor_return = rig.cursor_stash;
        local.release_cursor = true;
        remove_body(&mut commands, &mut local, &mut index, &mut self_guid);
        *player = Player::default();
        player.login_pitch = request.camera_pitch;
        player.report_capture = Some(Vec::new());
        local.correction_counter = 0;
        *rig = CameraControl::default();
        rig.distance = request.camera_distance;
        rig.target_distance = request.camera_distance;
        rig.collision_distance = request.camera_distance;
        rig.self_fade_alpha = 1.0;
        *current_map = CurrentMap(request.map_id);
        self_guid.0 = Some(character.guid);
        // Do not add SelfPlayer/Embodied here: the existing tag/create/embodiment chain owns
        // those markers and its world-enter cascade, just as for a streamed player create.
        let entity = commands
            .spawn((
                Guid(character.guid),
                NetEntity {
                    kind: EntityKind::Player,
                    display_id: Some(character.display_id),
                    scale: character.scale,
                },
                Transform::from_translation(wow_to_bevy(request.position_wow))
                    .with_rotation(Quat::from_rotation_y(request.facing)),
                Visibility::default(),
                ObjectStore(player_fields(character).into_created(ObjectType::Player)),
                UnitSpeeds(local_speeds(request.run_speed)),
                LocalEquipmentVisuals {
                    rows: equipment.rows.clone(),
                    metadata: equipment_metadata.rows.clone(),
                },
            ))
            .vis_chain_only()
            .id();
        index.0.insert(character.guid, entity);
        names.insert_player(
            character.guid,
            character.name.clone(),
            Some((character.race, character.class, character.sex)),
        );
        local.identity = Some(identity);
        local.entity = Some(entity);
        local.snapshot = Some(character.clone());
        return;
    }

    let Some(entity) = local.entity else { return };
    let Ok((mut store, mut net, mut visuals)) = bodies.get_mut(entity) else {
        return;
    };
    if visuals.rows != equipment.rows || visuals.metadata != equipment_metadata.rows {
        visuals.rows.clone_from(&equipment.rows);
        visuals.metadata.clone_from(&equipment_metadata.rows);
    }
    if local.snapshot.as_ref() != Some(character) {
        store
            .0
            .merge_diff(player_fields(character), |field, old, new| {
                edges.write(FieldChanged {
                    at: crate::lanes::stamp(),
                    entity,
                    guid: character.guid,
                    kind: ObjectType::Player,
                    index: field,
                    old,
                    new,
                });
            });
        net.display_id = Some(character.display_id);
        net.scale = character.scale;
        names.insert_player(
            character.guid,
            character.name.clone(),
            Some((character.race, character.class, character.sex)),
        );
        local.snapshot = Some(character.clone());
    }
}

fn remove_body(
    commands: &mut Commands,
    local: &mut LocalBody,
    index: &mut GuidIndex,
    self_guid: &mut SelfGuid,
) {
    let entity = local.entity.take();
    if let Some((_, guid)) = local.identity.take() {
        // The inbound LoggedOut/disconnect handler can claim and despawn this
        // body before the local session ends. Only the owner still in the
        // shared index may queue its removal; a cached Entity is not ownership.
        // This also covers a removal queued but not applied yet.
        if let Some(entity) = entity.filter(|entity| index.0.get(&guid) == Some(entity)) {
            index.0.remove(&guid);
            // An externally destroyed body can leave a stale index entry. Check
            // the complete entity generation before queuing, including reserved
            // bodies whose spawn is still in this command buffer.
            if let Ok(mut body) = commands.get_entity(entity) {
                body.despawn();
            }
        }
        // A replacement body registered under the same GUID owns SelfGuid now.
        if self_guid.0 == Some(guid) && !index.0.contains_key(&guid) {
            self_guid.0 = None;
        }
    }
    local.snapshot = None;
    local.paused_at = None;
}

fn valid_request(request: &LocalPlayerRequest) -> bool {
    request.position_wow.iter().all(|v| v.is_finite())
        && request.facing.is_finite()
        && request.run_speed.is_finite()
        && request.run_speed > 0.0
        && request.camera_distance.is_finite()
        && request.camera_distance >= 0.0
        && request.camera_pitch.is_none_or(f32::is_finite)
}

/// The controller's existing fallback ratios/constants, supplied as an ordinary unit speed
/// block so every consumer (movement, animation and camera) sees the same current speed.
fn local_speeds(run: f32) -> MoveSpeeds {
    MoveSpeeds {
        walk: run * super::state::WALK_RATIO,
        run,
        run_back: run * super::state::RUN_BACK_RATIO,
        swim: super::swim::SWIM_SPEED,
        swim_back: super::swim::SWIM_BACK_SPEED,
        turn_rate: super::state::TURN_RATE,
    }
}

#[allow(clippy::too_many_arguments)]
fn hold_input(
    session: Res<LocalClientSession>,
    time: Res<Time>,
    mut local: ResMut<LocalBody>,
    mut player: ResMut<Player>,
    mut rig: ResMut<CameraControl>,
    mut bindings: ResMut<crate::bindings::BindingsState>,
    mut windows: Query<(&mut Window, &mut CursorOptions), With<PrimaryWindow>>,
) {
    let held = !session.active || session.paused;
    let now = time.elapsed_secs();
    if held || local.release_cursor {
        let cursor_only = !held;
        local.release_cursor = false;
        let returned = local.cursor_return.take();
        if !cursor_only {
            // The terrain release keeps running while the local controller is paused. Account
            // for each held frame now, before it reads the settle deadline, not only on resume.
            if let Some(paused_at) = local.paused_at.replace(now) {
                shift_pause_clocks(&mut player, (now - paused_at).max(0.0));
            }
            player.autorun = false;
            player.auto_forward = false;
            *bindings = default();
        }
        rig.world_mouse = default();
        rig.look = None;
        rig.toggled = false;
        rig.device_look = false;
        let stash = rig.cursor_stash.take().or(returned);
        let released = std::mem::take(&mut rig.cursor_released);
        if let Ok((mut window, mut cursor)) = windows.single_mut() {
            cursor.grab_mode = CursorGrabMode::None;
            cursor.visible = true;
            if !released {
                if let Some(position) = stash {
                    window.set_cursor_position(Some(position));
                }
            }
        }
    } else if let Some(paused_at) = local.paused_at.take() {
        shift_pause_clocks(&mut player, (now - paused_at).max(0.0));
    }
}

fn shift_pause_clocks(player: &mut Player, elapsed: f32) {
    if let Some(since) = &mut player.airborne_since {
        *since += elapsed;
    }
    player.last_heartbeat += elapsed;
    if player.settling {
        player.settle_since += elapsed;
        player.settle_deadline += elapsed;
    }
}

fn queue_correction(
    session: Res<LocalClientSession>,
    mut local: ResMut<LocalBody>,
    mut correction: ResMut<LocalPlayerCorrection>,
    mut teleports: MessageWriter<crate::net::TeleportMessage>,
) {
    let Some(request) = correction.request.take() else {
        return;
    };
    let Some((identity, guid)) = local.identity.filter(|_| session.active) else {
        return;
    };
    if request.identity != identity
        || !request.facing.is_finite()
        || !request.position_wow.iter().all(|value| value.is_finite())
    {
        return;
    }
    local.correction_counter = local.correction_counter.wrapping_add(1);
    teleports.write(crate::net::TeleportMessage {
        guid,
        counter: local.correction_counter,
        position: request.position_wow,
        orientation: request.facing,
    });
}

fn read_pose(
    session: Res<LocalClientSession>,
    mut player: ResMut<Player>,
    local: Res<LocalBody>,
    mut pose: ResMut<LocalPlayerPose>,
    mut reports: ResMut<LocalMovementReports>,
    cameras: Query<&FlyCam, With<WorldCamera>>,
) {
    // Requiring the real rig also makes an accidentally duplicated/missing world camera visible
    // to the host as inactive rather than claiming a player the controller cannot drive.
    if !session.active || local.entity.is_none() || cameras.single().is_err() {
        *pose = LocalPlayerPose::default();
        *reports = LocalMovementReports::default();
        if let Some(pending) = &mut player.report_capture {
            pending.clear();
        }
        return;
    }
    reports.identity = local.identity.map_or(0, |(identity, _)| identity);
    reports.reports = player
        .report_capture
        .as_mut()
        .map(std::mem::take)
        .unwrap_or_default();
    *pose = LocalPlayerPose {
        identity: local.identity.map_or(0, |(identity, _)| identity),
        active: player.active && !player.detached,
        settling: player.settling || player.world_stale,
        position_wow: bevy_to_wow(player.pos),
        reported_position_wow: player.last_pos,
        facing: player.facing(),
        move_flags: player.move_flags(),
        planar_speed: if session.paused {
            0.0
        } else {
            player.planar_speed()
        },
    };
}

/// Descriptor fields in the vendored client's 5875 layout, not native-AS memory offsets. The
/// local game provides the values; using the ordinary descriptor keeps rendering and UI readers
/// on the same player identity. Equipment slots are one-based, with item *entries* as values.
pub(crate) fn player_fields(player: &LocalPlayerUi) -> ObjectFields {
    use benilla_protocol::field::{
        FIELD_PLAYER_FIELD_COINAGE, FIELD_PLAYER_VISIBLE_ITEM_1_CREATOR,
    };
    let appearance = &player.appearance;
    let mut fields = vec![
        (0, player.guid as u32),
        (1, (player.guid >> 32) as u32),
        (2, 1 | 8 | 16),
        (4, player.scale.to_bits()),
        (22, player.health),
        (28, player.max_health),
        (34, player.level),
        (35, player.faction_template),
        (
            36,
            u32::from_le_bytes([player.race, player.class, player.sex, player.power_type]),
        ),
        (131, player.display_id),
        (132, player.display_id),
        (
            193,
            u32::from_le_bytes([
                appearance.skin,
                appearance.face,
                appearance.hair_style,
                appearance.hair_color,
            ]),
        ),
        (
            194,
            u32::from(appearance.facial_hair) | (u32::from(player.rest_state) << 24),
        ),
        (190, if player.resting { 0x20 } else { 0 }),
        (716, player.xp),
        (717, player.xp_max),
        (1175, player.rested_xp),
        (FIELD_PLAYER_FIELD_COINAGE, player.gold),
    ];
    if player.power_type < 5 {
        fields.push((23 + u16::from(player.power_type), player.power));
        fields.push((29 + u16::from(player.power_type), player.max_power));
    }
    // Explicit zeros clear an item removed after a level-up or loadout change.
    for slot in 1..=19u8 {
        let entry = appearance
            .equipment
            .iter()
            .find(|(s, _)| *s == slot)
            .map_or(0, |(_, entry)| *entry);
        fields.push((
            FIELD_PLAYER_VISIBLE_ITEM_1_CREATOR + 2 + 12 * u16::from(slot - 1),
            entry,
        ));
    }
    ObjectFields::from_pairs(&fields)
}

#[cfg(test)]
mod lifetime_tests;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn paused_session_consumes_root_and_unroot_without_replaying_or_advancing_pose() {
        let (tx, rx) = crossbeam_channel::unbounded();
        let mut app = App::new();
        app.insert_resource(LocalClientSession { active:true, paused:true, ..default() })
            .insert_resource(Player { active:true, pos:Vec3::new(1.0,2.0,3.0), ..default() })
            .insert_resource(crate::net::NetCommands(tx))
            .init_resource::<Time>()
            .add_message::<crate::net::MoveModeMessage>()
            .add_message::<crate::net::SpeedChangeMessage>()
            .add_message::<crate::net::TeleportMessage>()
            .add_systems(Update, paused_mover_edges);
        app.world_mut().spawn((WorldCamera, FlyCam {yaw:0.0,pitch:-0.5,speed:100.0}));
        for (counter,apply) in [(7,true),(8,false)] {
            app.world_mut().write_message(crate::net::MoveModeMessage {
                guid:1,counter,mode:benilla_protocol::MoveMode::Root,apply,
            });
            app.update();
            assert_eq!(app.world().resource::<Player>().modes.rooted,apply);
            assert_eq!(app.world().resource::<Player>().pos,Vec3::new(1.0,2.0,3.0));
            let acks:Vec<_>=rx.try_iter().filter_map(|command|match command {
                crate::net::ClientCommand::MoveModeAck {counter,apply,..}=>Some((counter,apply)),
                _=>None,
            }).collect();
            assert_eq!(acks,vec![(counter,apply)]);
            app.update();
            assert!(rx.try_recv().is_err());
        }
        app.world_mut().resource_mut::<LocalClientSession>().paused=false;
        assert_eq!(app.world().resource::<Messages<crate::net::MoveModeMessage>>().len(),0);
    }

    #[test]
    fn local_body_descriptor_preserves_character_appearance_and_item_entries() {
        let player = LocalPlayerUi {
            guid: 0x1234_5678_90ab_cdef,
            race: 4,
            class: 3,
            sex: 1,
            display_id: 56,
            scale: 1.0,
            health: 91,
            max_health: 120,
            power_type: 3,
            power: 71,
            max_power: 100,
            rest_state: 2,
            rested_xp: 123,
            resting: false,
            appearance: crate::local_client::LocalAppearance {
                skin: 2,
                face: 3,
                hair_style: 4,
                hair_color: 5,
                facial_hair: 6,
                equipment: vec![(1, 123), (16, 456)],
            },
            ..default()
        };
        let fields = player_fields(&player).into_created(ObjectType::Player);
        assert_eq!(fields.unit_race(), Some(4));
        assert_eq!(fields.unit_gender(), Some(1));
        assert_eq!(fields.player_skin(), Some(2));
        assert_eq!(fields.player_face(), Some(3));
        assert_eq!(fields.player_hair_style(), Some(4));
        assert_eq!(fields.player_hair_color(), Some(5));
        assert_eq!(fields.player_facial_hair(), Some(6));
        assert_eq!(fields.player_visible_item_entry(0), Some(123));
        assert_eq!(fields.player_visible_item_entry(15), Some(456));
        assert_eq!(fields.player_visible_item_entry(1), None);
        assert_eq!(fields.unit_power_type(), 3);
        assert_eq!(fields.unit_power(3), Some(71));
        assert_eq!(fields.player_rest_state(), Some(2));
        assert_eq!(fields.player_rest_state_experience(), Some(123));
    }

    #[test]
    fn pausing_mid_jump_preserves_the_arc_age_when_control_resumes() {
        let mut player = Player {
            airborne_since: Some(10.0),
            last_heartbeat: 11.0,
            settling: true,
            settle_since: 9.0,
            settle_deadline: 15.0,
            ..default()
        };
        shift_pause_clocks(&mut player, 30.0);
        assert_eq!(player.airborne_since, Some(40.0));
        assert_eq!(player.last_heartbeat, 41.0);
        assert_eq!(player.settle_since, 39.0);
        assert_eq!(player.settle_deadline, 45.0);
    }

    /// Use the real pause and terrain-release systems: the host holds control throughout a
    /// cold load, and unchanged counters can mean a large asset is still being decoded.
    fn loading_app() -> App {
        use benilla_world::terrain_stream::WorldLoadProgress;
        let mut app = App::new();
        let player = Player {
            active: true,
            settling: true,
            settle_deadline: super::super::SETTLE_TIMEOUT,
            ..default()
        };
        let wow = bevy_to_wow(player.pos);
        let (tx, ty) = benilla_formats::world_to_tile(wow[0], wow[1]);
        app.insert_resource(Time::<()>::default())
            .insert_resource(LocalClientSession {
                active: true,
                paused: true,
                ..default()
            })
            .insert_resource(player)
            .insert_resource(WorldLoadProgress {
                ready: 1,
                total: 2,
                focus_resident: true,
                focus_tile: Some((tx as i32, ty as i32)),
                colliders_pending: 1,
                ..default()
            })
            .init_resource::<LocalBody>()
            .init_resource::<CameraControl>()
            .init_resource::<crate::bindings::BindingsState>()
            .add_systems(
                Update,
                (
                    hold_input,
                    super::super::world_focus::release_post_snap_hold,
                )
                    .chain(),
            );
        app.update();
        app
    }

    fn loading_frame(app: &mut App) {
        app.world_mut()
            .resource_mut::<Time>()
            .advance_by(std::time::Duration::from_secs(1));
        app.update();
    }

    #[test]
    fn a_cold_local_load_keeps_the_settle_hold_until_residency_even_while_paused() {
        use benilla_world::terrain_stream::WorldLoadProgress;
        let mut app = loading_app();
        for _ in 0..18 {
            loading_frame(&mut app);
            let player = app.world().resource::<Player>();
            assert!(
                player.settling,
                "loading pause expired before colliders arrived"
            );
            assert!(player.settle_deadline > app.world().resource::<Time>().elapsed_secs());
        }
        {
            let mut progress = app.world_mut().resource_mut::<WorldLoadProgress>();
            progress.ready = 2;
            progress.scene_ready = true;
            progress.colliders_pending = 0;
        }
        loading_frame(&mut app);
        assert!(
            !app.world().resource::<Player>().settling,
            "residency must release the hold while the host is still paused for readiness"
        );
    }

    #[test]
    fn resuming_after_a_loading_pause_keeps_the_ordinary_stall_backstop() {
        let mut app = loading_app();
        for _ in 0..18 {
            loading_frame(&mut app);
        }
        app.world_mut().resource_mut::<LocalClientSession>().paused = false;
        loading_frame(&mut app);
        let deadline = app.world().resource::<Player>().settle_deadline;
        loading_frame(&mut app);
        assert_eq!(
            app.world().resource::<Player>().settle_deadline,
            deadline,
            "the paused interval must not be added twice or keep extending after resume"
        );
        for _ in 0..7 {
            loading_frame(&mut app);
        }
        assert!(
            !app.world().resource::<Player>().settling,
            "an unpaused stalled stream still takes the native timeout path"
        );
    }

    #[test]
    fn readback_names_the_actual_body_identity_and_clears_it_at_session_end() {
        let mut app = App::new();
        let entity = app.world_mut().spawn_empty().id();
        app.insert_resource(LocalClientSession {
            active: true,
            ..default()
        })
        .insert_resource(Player {
            active: true,
            pos: wow_to_bevy([1.0, 2.0, 3.0]),
            ..default()
        })
        .insert_resource(LocalBody {
            identity: Some((7, 0xaa)),
            entity: Some(entity),
            ..default()
        })
        .init_resource::<LocalPlayerPose>()
        .init_resource::<LocalMovementReports>()
        .init_resource::<LocalPlayerCorrection>()
        .add_systems(Update, read_pose);
        app.world_mut().spawn((
            WorldCamera,
            FlyCam {
                yaw: 0.0,
                pitch: -0.5,
                speed: 100.0,
            },
        ));
        app.update();
        let pose = app.world().resource::<LocalPlayerPose>();
        assert_eq!(pose.identity, 7);
        assert!(pose.active);
        assert_eq!(pose.position_wow, [1.0, 2.0, 3.0]);
        app.world_mut().resource_mut::<LocalClientSession>().end();
        app.update();
        assert_eq!(
            *app.world().resource::<LocalPlayerPose>(),
            LocalPlayerPose::default()
        );
    }
    #[test]
    fn correction_routes_only_the_current_body_through_normal_teleport_messages() {
        let mut app = App::new();
        app.insert_resource(LocalClientSession {
            active: true,
            ..default()
        })
        .insert_resource(LocalBody {
            identity: Some((7, 42)),
            ..default()
        })
        .init_resource::<LocalPlayerCorrection>()
        .add_message::<crate::net::TeleportMessage>()
        .add_systems(Update, queue_correction);
        let send = |app: &mut App, identity, position_wow| {
            app.world_mut()
                .resource_mut::<LocalPlayerCorrection>()
                .request = Some(LocalCorrectionRequest {
                identity,
                position_wow,
                facing: 1.25,
            });
            app.update();
            app.world_mut()
                .resource_mut::<Messages<crate::net::TeleportMessage>>()
                .drain()
                .collect::<Vec<_>>()
        };
        assert!(send(&mut app, 6, [1., 2., 3.]).is_empty());
        assert!(send(&mut app, 7, [f32::NAN, 2., 3.]).is_empty());
        let first = send(&mut app, 7, [1., 2., 3.]);
        assert_eq!(first.len(), 1);
        assert_eq!(
            (
                first[0].guid,
                first[0].counter,
                first[0].position,
                first[0].orientation
            ),
            (42, 1, [1., 2., 3.], 1.25)
        );
        let next = send(&mut app, 7, [4., 5., 6.]);
        assert_eq!(next[0].counter, 2);
        app.world_mut().resource_mut::<LocalClientSession>().end();
        assert!(send(&mut app, 7, [1., 2., 3.]).is_empty());
    }
}
