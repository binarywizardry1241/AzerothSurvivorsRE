//! The 0.97.2 engine's menu scene: map activation, world loading and camera drive.
//!
//! The parent application installs the shared world plugins and creates the
//! `WorldCamera`; this plugin drives that engine from the recovered menu request.
//! Native ownership and remaining validation limits: docs/analysis/menu-scene-0.97.2.md.

mod residency;

use crate::{
    background::{MenuScene, SceneRequest},
    menu_state::{MenuState, Page},
};
use benilla_assets::AdtTile;
use benilla_world::{
    schedule::WorldStage,
    terrain_stream::{terrain_height_under, TerrainStreamer, ViewFocus, WorldLoadProgress},
    view::{CameraPoseSet, WorldCamera},
    world_map::CurrentMap,
};
use bevy::prelude::*;

use residency::{RequestIdentity, Stabilization};

pub struct MenuScenePlugin;

/// The compositor creates one camera carrying this and `WorldCamera`. Keeping
/// the hero preview on its separate camera prevents the scene driver rotating it.
#[derive(Component)]
pub struct MenuSceneCamera;

/// The game publisher runs before `Prepare`; its cover/fade consumes `Ready`.
/// The shared engine streams after the recovered camera has been placed.
#[derive(SystemSet, Debug, Hash, PartialEq, Eq, Clone)]
pub enum MenuSceneSet {
    Prepare,
    Camera,
    Ready,
}

impl Plugin for MenuScenePlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<MenuScene>()
            .init_resource::<MenuSceneRuntime>()
            .init_resource::<benilla_app::local_client::LocalMenuSceneActive>()
            .init_resource::<ViewFocus>()
            .configure_sets(
                Update,
                (
                    MenuSceneSet::Prepare.in_set(WorldStage::Input),
                    MenuSceneSet::Camera
                        .in_set(WorldStage::Input)
                        .after(MenuSceneSet::Prepare)
                        .before(CameraPoseSet),
                    MenuSceneSet::Ready.in_set(WorldStage::Present),
                ),
            );
        if app.world().contains_resource::<benilla_app::local_client::LocalStockFrontend>() {
            return;
        }
        app.add_systems(Update, prepare.in_set(MenuSceneSet::Prepare))
            .add_systems(Update, drive_camera.in_set(MenuSceneSet::Camera))
            .add_systems(Update, publish_ready.in_set(MenuSceneSet::Ready));
    }
}

/// The engine side of the native shared request, active, mask and ready lanes.
/// `request` updates every frame, whereas stabilization keys on map and zone only.
#[derive(Resource, Default)]
pub struct MenuSceneRuntime {
    pub request: Option<SceneRequest>,
    pub active: bool,
    pub ready: bool,
    /// Native setter 1406cc240. A foreground model pane masks the world without
    /// tearing down its residency or resetting the native ready latch.
    pub masked: bool,
    stabilization: Stabilization,
    ground_lift: f32,
}

impl MenuSceneRuntime {
    /// Native helper 1406cc6e0: the request discriminant, before stabilization.
    pub fn requested(&self) -> bool {
        self.request.is_some()
    }

    /// Native helper 1406cc520: the active world is not masked by a model pane.
    pub fn renderable(&self) -> bool {
        self.active && !self.masked
    }

    /// Native helper 1406cc600 does not include the model-pane mask.
    pub fn presentable(&self) -> bool {
        self.active && self.ready
    }

    pub fn stable_frames(&self) -> u32 {
        self.stabilization.frames()
    }
}

fn prepare(
    menu: Res<MenuScene>,
    state: Res<MenuState>,
    mut runtime: ResMut<MenuSceneRuntime>,
    mut world_active: ResMut<benilla_app::local_client::LocalMenuSceneActive>,
    mut focus: ResMut<ViewFocus>,
    current_map: Option<ResMut<CurrentMap>>,
) {
    if state.in_run {
        runtime.stabilization.observe(None);
        runtime.active = false;
        runtime.ready = false;
        runtime.request = None;
        world_active.0 = false;
        return;
    }
    let identity = menu.request.map(|request| RequestIdentity {
        map: request.map_id,
        zone: request.zone_index,
    });
    // Current-target TypeID 1b93c1ca... binds backdrop mask byte +0x72
    // to the native armory umbrella open flag, across all of its tabs.
    runtime.masked = state.page != Page::Picker;
    runtime.request = menu.request;
    runtime.stabilization.observe(identity);
    runtime.active = runtime.stabilization.active();
    runtime.ready = runtime.stabilization.ready();

    // Current1409abfc0 combines this retained lane with the ordinary client
    // state in one WorldLive publisher. Do not overwrite WorldLive later in
    // Input: that would expose a false falling edge to the next Net stage.
    world_active.0 = runtime.active;
    if !runtime.active {
        return;
    }
    if let (Some(request), Some(mut map)) = (runtime.request, current_map) {
        if map.0 != request.map_id {
            map.0 = request.map_id;
        }
    }
    // The shared world streamer follows the menu camera, without an attached
    // avatar or a stale character-entry anchor from the ordinary game route.
    *focus = ViewFocus::camera();
}

fn drive_camera(
    time: Res<Time>,
    mut runtime: ResMut<MenuSceneRuntime>,
    terrain: Option<Res<TerrainStreamer>>,
    tiles: Option<Res<Assets<AdtTile>>>,
    mut cameras: Query<&mut Transform, (With<MenuSceneCamera>, With<WorldCamera>)>,
) {
    let request = runtime.request.filter(|_| runtime.active);
    let Some(request) = request else {
        // Native 14070f3df resets the local clearance lift while inactive.
        runtime.ground_lift = 0.0;
        return;
    };
    let ground = terrain
        .as_deref()
        .zip(tiles.as_deref())
        .and_then(|(terrain, tiles)| {
            terrain_height_under(
                terrain,
                tiles,
                benilla_assets::coords::wow_to_bevy(request.eye.into()),
            )
        });
    let pose = request.camera_pose(ground, &mut runtime.ground_lift, time.delta_secs());
    for mut camera in &mut cameras {
        if *camera != pose {
            *camera = pose;
        }
    }
}

fn publish_ready(
    mut runtime: ResMut<MenuSceneRuntime>,
    progress: Option<Res<WorldLoadProgress>>,
    mut menu: ResMut<MenuScene>,
) {
    runtime.stabilization.resolve(progress.as_deref());
    runtime.ready = runtime.stabilization.ready();
    menu.ready = runtime.presentable();
}
