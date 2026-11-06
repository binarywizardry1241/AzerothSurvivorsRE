//! The recovered run's connection to the existing MPQ world engine.
//!
//! Map identifiers and spawn values come from the current-target entry
//! recovery. The engine owns WDT/ADT/WMO decoding, residency and collision. This
//! adapter mirrors the ordinary client's resolved player pose into the mechanics;
//! it never drives the avatar, camera or stream focus.

mod ground;
pub mod native_floor;
pub use native_floor::NativeFloor;

use benilla_assets::{coords::wow_to_bevy, AdtTile, MapCatalogRes, WorldAssets};
use benilla_world::{
    collision::WorldCollision,
    schedule::WorldStage,
    terrain_stream::{terrain_height_under, TerrainStreamer, WorldLoadProgress},
};
use bevy::prelude::*;

use crate::preview::HeroWorldRender;

// Existing engine player/state.rs step ceiling and walkable normal, and
// net/motion/spline.rs floor-clamp drop. This bounded bridge is not the full
// player movement query: these bounded rays serve native mechanic spawn/collision ports.
use ground::{CLAMP_DOWN as GROUND_CLAMP_DOWN, STEP_UP as GROUND_STEP_UP};
const WALKABLE_NORMAL_Y: f32 = 0.642_788;

/// A new identity starts a fresh run even when the same map is selected again.
/// The camera fields remain an entry-data compatibility bridge; this adapter does not apply them.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ZoneWorldRequest {
    pub identity: u64,
    pub map_id: u32,
    pub center_wow: [f32; 3],
    pub spawn_wow: [f32; 3],
    pub spawn_facing: f32,
    pub camera_offset: [f32; 3],
    pub camera_target_height: f32,
}

#[derive(Resource, Default)]
pub struct ZoneWorld {
    pub request: Option<ZoneWorldRequest>,
    pub position_wow: [f32; 3],
    pub facing: f32,
    pub moving: bool,
    pub ready: bool,
    pub load_fraction: f32,
    pub status: String,
    last_request: Option<ZoneWorldRequest>,
}

/// Temporary compatibility resource for the run UI while it moves to the ordinary controller.
/// No world system consumes or integrates this motion.
#[derive(Resource, Default)]
pub struct ZoneMotion {
    pub direction: Vec2,
    pub speed: f32,
    pub enabled: bool,
}

#[derive(SystemSet, Debug, Hash, PartialEq, Eq, Clone)]
pub enum ZoneWorldSet {
    Prepare,
    Ready,
}

pub struct ZoneWorldPlugin;

impl Plugin for ZoneWorldPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<ZoneWorld>()
            .init_resource::<NativeFloor>()
            .init_resource::<ZoneMotion>()
            .init_resource::<HeroWorldRender>()
            .configure_sets(
                Update,
                (
                    ZoneWorldSet::Prepare.in_set(WorldStage::Input),
                    ZoneWorldSet::Ready.in_set(WorldStage::Present),
                ),
            )
            .add_systems(Update, prepare.in_set(ZoneWorldSet::Prepare))
            .add_systems(
                Update,
                sync_pose
                    .after(benilla_app::local_client::LocalPlayerSet::Readback)
                    .before(WorldStage::Stream),
            )
            .add_systems(Update, publish_ready.in_set(ZoneWorldSet::Ready))
            .add_systems(
                Update,
                prepare_floor
                    .after(publish_ready)
                    .before(super::RunSet::Tick),
            );
    }
}

fn prepare_floor(
    mut world: ResMut<ZoneWorld>,
    mut floor: ResMut<NativeFloor>,
    session: Res<super::RunSession>,
    assets: Option<Res<WorldAssets>>,
    maps: Option<Res<MapCatalogRes>>,
) {
    let Some(request) = world.request else { return };
    let Some(game) = session.mechanics.as_ref() else {
        world.ready = false;
        return;
    };
    let (Some(assets), Some(maps)) = (assets, maps) else {
        world.ready = false;
        return;
    };
    let Some(map) = maps.0.directory(request.map_id) else {
        world.ready = false;
        world.status = format!("No map directory for {}", request.map_id);
        return;
    };
    floor.ensure(&game.zone.key, map, request.center_wow, &assets);
    if floor.terrain_ref().is_none() {
        world.ready = false;
        world.status = floor.error.as_ref().map_or_else(
            || "Loading world".to_owned(),
            |error| format!("World data could not be loaded: {error}"),
        );
    }
}

fn prepare(mut world: ResMut<ZoneWorld>, mut hero: ResMut<HeroWorldRender>) {
    // The real client self entity owns world rendering. The menu's preview can continue to
    // exist, but must never acquire a second live world pose during a run.
    hero.pose = None;
    let Some(request) = world.request else {
        if world.last_request.take().is_some() {
            world.ready = false;
            world.moving = false;
            world.load_fraction = 0.0;
        }
        return;
    };
    if world.last_request != Some(request) {
        world.last_request = Some(request);
        world.position_wow = request.spawn_wow;
        world.facing = request.spawn_facing;
        world.moving = false;
        world.ready = false;
        world.load_fraction = 0.0;
        world.status = format!("Loading map {}", request.map_id);
        info!(
            "run world: map {} at {:?}",
            request.map_id, request.spawn_wow
        );
    }
}

fn sync_pose(pose: Res<benilla_app::local_client::LocalPlayerPose>, mut world: ResMut<ZoneWorld>) {
    if world
        .request
        .is_some_and(|request| request.identity == pose.identity)
        && pose.active
    {
        world.position_wow = pose.position_wow;
        world.facing = pose.facing;
        world.moving = pose.planar_speed > 0.01;
    } else {
        world.moving = false;
    }
}

fn publish_ready(
    mut world: ResMut<ZoneWorld>,
    progress: Option<Res<WorldLoadProgress>>,
    pose: Res<benilla_app::local_client::LocalPlayerPose>,
    floor: Res<NativeFloor>,
) {
    if world.request.is_none() {
        return;
    }
    let Some(progress) = progress else { return };
    let (tx, ty) = benilla_formats::world_to_tile(world.position_wow[0], world.position_wow[1]);
    let matching_focus = progress.focus_tile == Some((tx as i32, ty as i32));
    world.load_fraction = if matching_focus {
        progress.fraction()
    } else {
        0.0
    };
    let was_ready = world.ready;
    world.ready = pose.active
        && world
            .request
            .is_some_and(|request| request.identity == pose.identity)
        && !pose.settling
        && matching_focus
        && progress.focus_resident
        && progress.presentable()
        && floor.terrain_ref().is_some();
    if world.ready && !was_ready {
        world.status = "World ready".into();
        info!("run world ready: {:?}", world.position_wow);
    } else if !world.ready {
        world.status = format!("Loading world: {} / {}", progress.ready, progress.total);
    }
}

/// Borrowed view of the real streamed map for the recovered mechanics ports.
/// A ready run borrows the fixed-region native cache. The streamed query path
/// remains for callers outside that run; no ray replaces a present native cache.
#[derive(Clone, Copy)]
pub struct WorldTerrain<'a, 'w, 's> {
    pub streamer: &'a TerrainStreamer,
    pub tiles: &'a Assets<AdtTile>,
    pub collision: Option<&'a WorldCollision<'w, 's>>,
    pub fallback: f32,
    pub native: Option<&'a azeroth_survivors_re::floor_recovery::map::NativeTerrain>,
}

impl WorldTerrain<'_, '_, '_> {
    pub fn adt_height(&self, x: f32, y: f32) -> Option<f32> {
        terrain_height_under(
            self.streamer,
            self.tiles,
            wow_to_bevy([x, y, self.fallback]),
        )
    }

    pub fn static_height(&self, x: f32, y: f32) -> Option<f32> {
        let collision = self.collision?;
        // Trace from the actor's own floor band. A high overhead ray chooses
        // the roof or an upper storey in multi-floor WMOs such as SM/Naxx.
        let origin = wow_to_bevy([x, y, self.fallback + GROUND_STEP_UP]);
        let hit = collision.ray_body(origin, Dir3::NEG_Y, GROUND_STEP_UP + GROUND_CLAMP_DOWN)?;
        if hit.normal.y < WALKABLE_NORMAL_Y {
            return None;
        }
        Some(origin.y - hit.distance)
    }

    pub fn ground_height(&self, x: f32, y: f32) -> Option<f32> {
        // Terrain above the feet can be a cave's ceiling. It competes with
        // the WMO floor only inside the same near-foot vertical window.
        ground::choose_floor(
            self.fallback,
            self.adt_height(x, y),
            self.static_height(x, y),
        )
    }

    /// The game's primary spawn provider describes the walk surface. Raw ADT
    /// alone puts actors below WMO courtyard/bridge floors. Keep the unbounded
    /// ADT answer for distant terrain outside this actor's near-foot window.
    pub fn walk_height(&self, x: f32, y: f32) -> Option<f32> {
        if let Some(native) = self.native {
            return native.height([x, y]);
        }
        self.ground_height(x, y).or_else(|| self.adt_height(x, y))
    }

    pub fn secondary_height(&self, x: f32, y: f32) -> Option<f32> {
        if let Some(native) = self.native {
            return native
                .primary
                .indoor
                .as_ref()?
                .grid()
                .nearest([x, y])
                .map(|point| point[2]);
        }
        self.static_height(x, y)
    }

    fn native_blocked(&self, x: f32, y: f32) -> bool {
        let Some(grid) = self.native.and_then(|native| native.occupancy.as_ref()) else {
            return false;
        };
        let x = x - grid.origin[0];
        let y = y - grid.origin[1];
        x >= 0.0
            && y >= 0.0
            && x < grid.side as f32
            && y < grid.side as f32
            && grid.cells[y as usize * grid.side + x as usize] != 0
    }

    pub fn collision_fraction(&self, from: [f32; 3], to: [f32; 3]) -> Option<f32> {
        let collision = self.collision?;
        let origin = wow_to_bevy(from);
        let movement = wow_to_bevy(to) - origin;
        let direction = Dir3::new(movement).ok()?;
        collision
            .ray_body(origin, direction, movement.length())
            .map(|hit| hit.distance / movement.length())
    }
}

impl azeroth_survivors_re::enemies::spawning::Terrain for WorldTerrain<'_, '_, '_> {
    fn height(&mut self, xy: [f32; 2]) -> Option<f32> {
        self.walk_height(xy[0], xy[1])
    }
    fn secondary_height(&mut self, xy: [f32; 2]) -> Option<f32> {
        WorldTerrain::secondary_height(self, xy[0], xy[1])
    }
    fn fallback_height(&self) -> f32 {
        self.native.map_or(self.fallback, |native| native.fallback)
    }
    fn blocked_grid(&self) -> Option<azeroth_survivors_re::enemies::spawning::BlockedGrid<'_>> {
        self.native
            .and_then(|native| native.occupancy.as_ref())
            .map(|grid| grid.grid())
    }
    fn path_grid(&self) -> Option<azeroth_survivors_re::enemies::spawning::PathGrid<'_>> {
        self.native
            .and_then(|native| native.navigation.as_ref())
            .map(|field| azeroth_survivors_re::enemies::spawning::PathGrid {
                populated_cells: field.populated_cells,
                distances: &field.distances,
            })
    }
}

impl azeroth_survivors_re::enemies::ai::World for WorldTerrain<'_, '_, '_> {
    fn actor_movement_height(&self, xy: [f32; 2]) -> Option<f32> {
        self.native?.actor_movement_height(xy)
    }

    fn sight_clear(
        &self,
        from: azeroth_survivors_re::enemies::Position,
        to: azeroth_survivors_re::enemies::Position,
    ) -> bool {
        self.native.and_then(|native| native.occupancy.as_ref()).is_none_or(|grid| {
            azeroth_survivors_re::floor_recovery::navigation::sight_clear(
                grid.grid(), [from.x, from.y], [to.x, to.y],
            )
        })
    }
    fn ray_fraction(
        &self,
        from: azeroth_survivors_re::enemies::Position,
        to: azeroth_survivors_re::enemies::Position,
    ) -> Option<f32> {
        if let Some(grid) = self.native.and_then(|native| native.occupancy.as_ref()) {
            return Some(
                azeroth_survivors_re::floor_recovery::navigation::segment_fraction(
                    grid.grid(),
                    [from.x, from.y],
                    [to.x, to.y],
                ),
            );
        }
        self.collision_fraction([from.x, from.y, from.z], [to.x, to.y, to.z])
    }
    fn chase_path(
        &self,
        from: azeroth_survivors_re::enemies::Position,
        to: azeroth_survivors_re::enemies::Position,
        search: f32,
    ) -> Option<[f32; 2]> {
        let native = self.native?;
        native.navigation.as_ref()?.chase(
            native.occupancy.as_ref()?.grid(),
            [from.x, from.y],
            [to.x, to.y],
            search,
        )
    }
}

impl azeroth_survivors_re::guardians::placement::LairTerrain for WorldTerrain<'_, '_, '_> {
    fn adt_height(&self, x: f32, y: f32) -> Option<f32> {
        self.walk_height(x, y)
    }
    fn wmo_height(&self, x: f32, y: f32) -> Option<f32> {
        self.secondary_height(x, y)
    }
    fn fallback_height(&self) -> f32 {
        self.native.map_or(self.fallback, |native| native.fallback)
    }
    fn blocked_at(&self, x: f32, y: f32) -> bool {
        self.native_blocked(x, y)
    }
}
