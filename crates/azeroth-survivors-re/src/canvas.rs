//! Primary-window Canvas fit, revalidated for selected 0.109.0 owners
//! 14018f300 / 140190700; see docs/analysis/overlay-canvas-0.109.0.md.
//!
//! The executable changes each root's layout/render-target scale. Scaling a UiTransform instead
//! enlarges already-rasterized glyphs and does not reproduce its text or clipping behavior.

use bevy::{
    app::Propagate,
    prelude::*,
    reflect::GetPath,
    ui::{ComputedUiRenderTargetInfo, DefaultUiCamera, UiSystems},
    window::PrimaryWindow,
};

#[derive(Component, Clone, Copy)]
pub struct NativeCanvas {
    pub design: Vec2,
    pub max_scale: f32,
}

impl NativeCanvas {
    pub const fn main_menu() -> Self {
        Self {
            design: Vec2::new(1600.0, 900.0),
            max_scale: 1.6,
        }
    }
}

pub struct NativeCanvasPlugin;

impl Plugin for NativeCanvasPlugin {
    fn build(&self, app: &mut App) {
        app.add_systems(
            PostUpdate,
            fit_canvas
                .in_set(UiSystems::Prepare)
                .after(bevy::ui::update::propagate_ui_target_cameras)
                .before(UiSystems::Propagate),
        );
    }
}

fn fit_canvas(
    mut commands: Commands,
    windows: Query<&Window, With<PrimaryWindow>>,
    default_camera: DefaultUiCamera,
    cameras: Query<&Camera>,
    ui_scale: Res<UiScale>,
    mut canvases: Query<(Entity, &NativeCanvas, &mut Node)>,
) {
    let Ok(window) = windows.single() else {
        return;
    };
    let Some(camera) = default_camera
        .get()
        .and_then(|entity| cameras.get(entity).ok())
    else {
        return;
    };
    let logical = Vec2::new(window.width(), window.height());
    let physical = camera.physical_viewport_size().unwrap_or(UVec2::ZERO);
    let target_scale = camera.target_scaling_factor().unwrap_or(1.0) * ui_scale.0;

    for (entity, canvas, mut node) in &mut canvases {
        let scale = (logical.x / canvas.design.x)
            .min(logical.y / canvas.design.y)
            .min(canvas.max_scale)
            .max(0.1);
        let offset = (logical / scale - canvas.design) * 0.5;
        let left = Val::Px(offset.x);
        let top = Val::Px(offset.y);
        if node.left != left || node.top != top {
            node.left = left;
            node.top = top;
        }

        // Bevy exposes this component through Reflect while its fields are crate-private.
        // Use that supported typed API rather than depending on Rust's field offsets.
        let mut target = ComputedUiRenderTargetInfo::default();
        *target
            .path_mut::<f32>("scale_factor")
            .expect("Bevy target scale field") = target_scale * scale;
        *target
            .path_mut::<UVec2>("physical_size")
            .expect("Bevy target size field") = physical;
        commands.entity(entity).insert(Propagate(target));
    }
}
