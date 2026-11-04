//! Current 0.109.0 movable HUD activation140289f40, drag140286ca0 and
//! placement1402892c0. See docs/analysis/run-hud-0.109.0.md.

use benilla_app::local_client::{LocalClientExtension, LocalClientInput};
use bevy::{
    prelude::*,
    ui::{RelativeCursorPosition, UiGlobalTransform},
    window::PrimaryWindow,
};

use super::{layout, settings::HudSettings, view::HudPart};
use crate::menu_state::MenuState;

struct Drag {
    index: usize,
    pointer: Vec2,
    position: Vec2,
}

#[derive(Resource)]
pub(super) struct LayoutState {
    drag: Option<Drag>,
    path: Option<std::path::PathBuf>,
}

impl FromWorld for LayoutState {
    fn from_world(world: &mut World) -> Self {
        let path = crate::save::native_base_directory().map(|base| base.join("hud.txt"));
        world.resource_mut::<HudSettings>().positions =
            path.as_ref().map_or([None; 2], |path| layout::read(path));
        Self { drag: None, path }
    }
}

/// Publish hover before FrameXML input; action handling below can add a drag.
pub(super) fn capture_pointer(
    state: Res<LayoutState>,
    settings: Res<HudSettings>,
    menu: Res<MenuState>,
    session: Res<super::super::RunSession>,
    nodes: Query<(&HudPart, &RelativeCursorPosition)>,
    mut extension: ResMut<LocalClientExtension>,
) {
    extension.pointer_drag_capture |= state.drag.is_some();
    extension.pointer_over_ui |= state.drag.is_some()
        || (menu.in_run
            && session.mechanics.is_some()
            && (session.paused
                || nodes
                    .iter()
                    .any(|(part, cursor)| settings.shown(part.0) && cursor.cursor_over)));
}

pub(super) fn input(
    mut state: ResMut<LayoutState>,
    mut settings: ResMut<HudSettings>,
    menu: Res<MenuState>,
    session: Res<super::super::RunSession>,
    mouse: Res<ButtonInput<MouseButton>>,
    touches: Res<Touches>,
    windows: Query<&Window, With<PrimaryWindow>>,
    nodes: Query<(
        &HudPart,
        Ref<Interaction>,
        &ComputedNode,
        &UiGlobalTransform,
        &RelativeCursorPosition,
    )>,
    mut extension: ResMut<LocalClientExtension>,
) {
    let in_run = menu.in_run && session.mechanics.is_some();
    extension.pointer_over_ui |= state.drag.is_some()
        || in_run
            && (session.paused
                || nodes
                    .iter()
                    .any(|(part, _, _, _, cursor)| settings.shown(part.0) && cursor.cursor_over));
    // The native secondary resource is Bevy Touches. It reads the first
    // currently pressed map entry directly, without scaling or choosing an ID.
    let touch = touches.iter().next();
    let pointer = windows.single().ok().and_then(|window| {
        window.cursor_position().or_else(|| touch.map(|touch| touch.position()))
    });
    if let Some(drag) = state.drag.as_ref() {
        if !mouse.pressed(MouseButton::Left) && touch.is_none() {
            state.drag = None;
            if let Some(path) = &state.path {
                if let Err(error) = layout::write(path, &settings.positions) {
                    warn!("hud: cannot save layout: {error}");
                }
            }
        } else if let Some(pointer) = pointer {
            settings.positions[drag.index] = Some(drag.position + pointer - drag.pointer);
        }
        return;
    }
    // Native140286ca0 updates the retained drag independently of ScreenState.
    // A session transition can remove the HUD before the pointer is released;
    // finish that drag and persist it before admitting another run's presses.
    if !in_run {
        return;
    }
    let Some(pointer) = pointer else {
        return;
    };
    for (part, interaction, computed, transform, _) in &nodes {
        if !interaction.is_changed()
            || *interaction != Interaction::Pressed
            || !settings.shown(part.0)
        {
            continue;
        }
        let Some(index) = layout::PARTS.iter().position(|key| *key == part.0) else {
            continue;
        };
        let position = transform.affine().transform_point2(computed.size * -0.5)
            * computed.inverse_scale_factor
            * settings.scale;
        state.drag = Some(Drag {
            index,
            pointer,
            position,
        });
        extension.pointer_over_ui = true;
        break;
    }
}

pub(super) fn place(
    settings: Res<HudSettings>,
    input: Res<LocalClientInput>,
    windows: Query<&Window, With<PrimaryWindow>>,
    mut nodes: Query<(&HudPart, &ComputedNode, &mut Node)>,
) {
    let Ok(window) = windows.single() else {
        return;
    };
    let viewport = Vec2::new(window.width(), window.height());
    for (part, computed, mut node) in &mut nodes {
        let position = layout::PARTS
            .iter()
            .position(|key| *key == part.0)
            .and_then(|index| settings.positions[index]);
        let Some(position) = position else {
            settings.apply(part.0, &mut node);
            if part.0 == "tally" {
                if let Some(rect) = input
                    .rendered_minimap_rect
                    .filter(|rect| rect[2] - rect[0] > 1.)
                {
                    node.right = Val::Px((viewport.x - rect[0] + 10.).max(10.) / settings.scale);
                }
            }
            continue;
        };
        if computed.size == Vec2::ZERO {
            continue;
        }
        let size = computed.size * computed.inverse_scale_factor * settings.scale;
        let position = layout::clamp(position, viewport, size) / settings.scale;
        node.left = Val::Px(position.x);
        node.top = Val::Px(position.y);
        node.right = Val::Auto;
        node.bottom = Val::Auto;
    }
}
