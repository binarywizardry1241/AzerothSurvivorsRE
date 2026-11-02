//! Use the actual client world/UI compositor; the reconstruction only supplies menu visibility.
use bevy::prelude::*;
use benilla_app::local_client::LocalPlayerSet;
use benilla_world::view::WorldCamera;
use crate::menu_scene::{MenuSceneCamera, MenuSceneRuntime, MenuSceneSet};

pub(crate) struct MenuCompositorPlugin;
fn adopt(mut commands: Commands, cameras: Query<Entity, (With<WorldCamera>, Without<MenuSceneCamera>)>) {
    for entity in &cameras { commands.entity(entity).insert(MenuSceneCamera); }
}
fn gate(runtime: Res<MenuSceneRuntime>, menu: Res<crate::menu_state::MenuState>,
    mut cameras: Query<&mut Camera, With<WorldCamera>>) {
    if !menu.in_run {
        for mut camera in &mut cameras { camera.is_active = runtime.renderable(); }
    }
}
impl Plugin for MenuCompositorPlugin {
    fn build(&self, app: &mut App) {
        if app.world().contains_resource::<benilla_app::local_client::LocalStockFrontend>() {
            return;
        }
        app.add_systems(Update, adopt.before(MenuSceneSet::Camera))
            .add_systems(Update, gate.after(LocalPlayerSet::CameraGate).after(MenuSceneSet::Ready));
    }
}
