//! Shared scrollbar and named-list input, revalidated against 0.109.0.
//! See home-screen-0.97.2.md and historical progression-scrollbar-consumers.json.
//! See menu-input-0.97.2.md for current drag/hover evidence and remaining input gaps.
use bevy::{
    input::mouse::{MouseScrollUnit, MouseWheel},
    prelude::*,
    ui::FocusPolicy,
    window::PrimaryWindow,
};
use std::collections::BTreeMap;

use crate::options::OptionsSet;

const EDGE: Color = Color::srgb(0.69, 0.541, 0.227);
const DARK_EDGE: Color = Color::srgb(0.169, 0.129, 0.071);
const GOLD: Color = Color::srgb(0.973, 0.824, 0.416);

pub struct NativeScrollbarPlugin;
impl Plugin for NativeScrollbarPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<Dragging>()
            .init_resource::<KeptPositions>()
            .add_systems(
                Update,
                (kept_wheel, begin_drag, continue_drag, synchronize)
                    .chain()
                    .after(benilla_app::local_client::LocalClientSet::Feed)
                    .before(OptionsSet::Input),
            );
    }
}

/// Construction-site identity retained by callers; shared input queries are global.
#[derive(Clone, Copy)]
pub enum InputScope {
    Options,
    Armory,
    Picker,
    Language,
    Meter,
}

/// Native 0.97.2 `scrollbar::Kept`: named offsets survive rebuilding UI entities.
#[derive(Component)]
pub struct Kept {
    key: &'static str,
}
impl Kept {
    pub const fn new(key: &'static str, _scope: InputScope) -> Self {
        Self { key }
    }
}
/// Current secondary-page retained list: a flexible row reserves the ordinary
/// scrollbar lane while only its min-height-zero body scrolls.
pub fn kept_list(
    ui: &mut ChildSpawnerCommands,
    key: &'static str,
    gap: f32,
    build: impl FnOnce(&mut ChildSpawnerCommands),
) {
    ui.spawn(Node {
        flex_grow: 1.,
        min_height: Val::Px(0.),
        column_gap: Val::Px(8.),
        ..default()
    })
    .with_children(|row| {
        let target = row
            .spawn((
                Node {
                    flex_grow: 1.,
                    min_height: Val::Px(0.),
                    flex_direction: FlexDirection::Column,
                    row_gap: Val::Px(gap),
                    overflow: Overflow::scroll_y(),
                    ..default()
                },
                ScrollPosition::default(),
                Kept::new(key, InputScope::Armory),
            ))
            .with_children(build)
            .id();
        spawn(row, target, 1., InputScope::Armory);
    });
}

#[derive(Resource, Default)]
struct KeptPositions(BTreeMap<&'static str, f32>);

/// 140072320 consumes all wheel messages and restores newly added Kept nodes.
/// Wheel input uses the physical window cursor; touch fallback belongs to dragging.
fn kept_wheel(
    mut wheel: MessageReader<MouseWheel>,
    windows: Query<&Window, With<PrimaryWindow>>,
    mut cache: ResMut<KeptPositions>,
    mut lists: Query<(
        &Kept,
        &ComputedNode,
        &UiGlobalTransform,
        &mut ScrollPosition,
    )>,
) {
    let amount = wheel.read().fold(-0.0, |sum, event| {
        sum + event.y
            * match event.unit {
                MouseScrollUnit::Line => 40.,
                MouseScrollUnit::Pixel => 1.,
            }
    });
    let cursor = windows
        .single()
        .ok()
        .and_then(Window::physical_cursor_position);
    let over = |node: &ComputedNode, transform: &UiGlobalTransform| {
        cursor.is_some_and(|p| {
            let affine = transform.affine();
            let min = affine.transform_point2(node.size * -0.5);
            let max = affine.transform_point2(node.size * 0.5);
            p.cmpge(min).all() && p.cmple(max).all()
        })
    };
    let top = lists
        .iter()
        .filter(|(_, node, transform, _)| over(node, transform))
        .map(|(_, node, _, _)| node.stack_index)
        .max();
    for (kept, node, transform, mut position) in &mut lists {
        let mut next = if position.is_added() {
            cache.0.get(kept.key).copied().unwrap_or(0.)
        } else {
            position.0.y
        };
        if top == Some(node.stack_index) && over(node, transform)
        {
            next -= amount;
        }
        next = if node.size.y > 0. {
            next.max(0.)
                .min(((node.content_size.y - node.size.y) * node.inverse_scale_factor).max(0.))
        } else {
            next.max(0.)
        };
        cache.0.insert(kept.key, next);
        if position.0.y != next {
            position.0.y = next;
        }
    }
}
#[derive(Component)]
struct Track {
    target: Entity,
}
#[derive(Component)]
struct Thumb;
#[derive(Clone, Copy)]
struct Drag {
    track: Entity,
    target: Entity,
    start_cursor_y: f32,
    start_scroll_y: f32,
}
#[derive(Resource, Default)]
struct Dragging(Option<Drag>);

/// Current 14004c680. `scale` retains the Options owner's existing local pixel scaling.
pub fn spawn(
    ui: &mut ChildSpawnerCommands,
    target: Entity,
    scale: f32,
    _scope: InputScope,
) -> Entity {
    ui.spawn((
        Track { target },
        Interaction::None,
        FocusPolicy::Block,
        Visibility::Hidden,
        Node {
            width: Val::Px(8. * scale),
            border_radius: BorderRadius::all(Val::Px(4. * scale)),
            ..default()
        },
        BackgroundColor(Color::srgba(0., 0., 0., 0.45)),
    ))
    .with_children(|ui| {
        ui.spawn((
            Thumb,
            Interaction::None,
            FocusPolicy::Block,
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                border: UiRect::all(Val::Px(scale)),
                border_radius: BorderRadius::all(Val::Px(4. * scale)),
                ..default()
            },
            BackgroundColor(EDGE),
            BorderColor::all(DARK_EDGE),
        ));
    })
    .id()
}

#[derive(Clone, Copy)]
struct Metrics {
    maximum: f32,
    ratio: f32,
}
fn metrics(node: &ComputedNode) -> Metrics {
    // Current 140071480 converts visible/content to logical units before subtracting.
    let visible = node.size.y * node.inverse_scale_factor;
    let content = node.content_size.y * node.inverse_scale_factor;
    Metrics {
        maximum: (content - visible).max(0.),
        ratio: (visible / content.max(1.)).clamp(0.08, 1.),
    }
}
fn track_scroll(fraction: f32, metrics: Metrics) -> f32 {
    ((fraction.clamp(0., 1.) - metrics.ratio * 0.5) / (1. - metrics.ratio).max(0.001)).clamp(0., 1.)
        * metrics.maximum
}
fn drag_scroll(
    drag: Drag,
    cursor_y: f32,
    scale: f32,
    track_height: f32,
    metrics: Metrics,
) -> Option<f32> {
    let travel = (1. - metrics.ratio) * track_height;
    (travel > 0.).then(|| {
        (drag.start_scroll_y
            + ((cursor_y - drag.start_cursor_y) * scale / travel) * metrics.maximum)
            .clamp(0., metrics.maximum)
    })
}

fn continue_drag(
    mut dragging: ResMut<Dragging>,
    mouse: Res<ButtonInput<MouseButton>>,
    touches: Res<Touches>,
    windows: Query<&Window, With<PrimaryWindow>>,
    tracks: Query<(Entity, &Track, &Interaction, &ComputedNode, &UiGlobalTransform)>,
    nodes: Query<&ComputedNode>,
    mut positions: Query<&mut ScrollPosition>,
) {
    if let Some(drag) = dragging.0 {
        let Ok((_, _, _, track_node, _)) = tracks.get(drag.track) else {
            dragging.0 = None;
            return;
        };
        if !mouse.pressed(MouseButton::Left) && touches.iter().next().is_none() {
            dragging.0 = None;
            return;
        }
        let (Ok(target), Ok(mut position), Ok(window)) = (
            nodes.get(drag.target),
            positions.get_mut(drag.target),
            windows.single(),
        ) else {
            dragging.0 = None;
            return;
        };
        // Native140196df0 uses a valid window cursor first, then the first
        // pressed Touches entry, retaining arbitrary hashmap iteration order.
        if let Some(cursor) = scrollbar_cursor(window, &touches) {
            if let Some(next) = drag_scroll(
                drag,
                cursor.y,
                window.scale_factor(),
                track_node.size.y,
                metrics(target),
            ) {
                if position.0.y != next {
                    position.0.y = next;
                }
            }
        }
        return;
    }
}

fn begin_drag(
    mut dragging: ResMut<Dragging>,
    touches: Res<Touches>,
    windows: Query<&Window, With<PrimaryWindow>>,
    tracks: Query<(
        Entity,
        &Track,
        &Interaction,
        &ComputedNode,
        &UiGlobalTransform,
    )>,
    pressed_tracks: Query<Entity, (With<Track>, Changed<Interaction>)>,
    pressed_thumbs: Query<(&ChildOf, &Interaction), (With<Thumb>, Changed<Interaction>)>,
    nodes: Query<&ComputedNode>,
    mut positions: Query<&mut ScrollPosition>,
) {
    // Current 1400732d0 starts from a changed Pressed interaction; it does not
    // separately require a mouse-button press, and accepts an active touch.
    let Ok(window) = windows.single() else {
        return;
    };
    let Some(cursor) = scrollbar_cursor(window, &touches) else {
        return;
    };
    // Current 1400732d0 tests Pressed changes on thumbs before the track branch.
    for (parent, interaction) in &pressed_thumbs {
        if *interaction != Interaction::Pressed {
            continue;
        }
        let Ok((entity, track, _, _, _)) = tracks.get(parent.parent()) else {
            continue;
        };
        if let Ok(position) = positions.get(track.target) {
            dragging.0 = Some(Drag {
                track: entity,
                target: track.target,
                start_cursor_y: cursor.y,
                start_scroll_y: position.0.y,
            });
            return;
        }
    }
    if dragging.0.is_some() {
        return;
    }
    for entity in &pressed_tracks {
        let Ok((_, track, interaction, track_node, transform)) = tracks.get(entity) else {
            continue;
        };
        if *interaction != Interaction::Pressed {
            continue;
        }
        let (Ok(target), Ok(mut position)) =
            (nodes.get(track.target), positions.get_mut(track.target))
        else {
            continue;
        };
        let top = transform
            .affine()
            .transform_point2(track_node.size * -0.5)
            .y;
        let fraction = (cursor.y * window.scale_factor() - top) / track_node.size.y.max(1.);
        let next = track_scroll(fraction, metrics(target));
        position.0.y = next;
        dragging.0 = Some(Drag {
            track: entity,
            target: track.target,
            start_cursor_y: cursor.y,
            start_scroll_y: next,
        });
        return;
    }
}

fn scrollbar_cursor(window: &Window, touches: &Touches) -> Option<Vec2> {
    window
        .cursor_position()
        .or_else(|| touches.iter().next().map(|touch| touch.position()))
}

fn synchronize(
    dragging: Res<Dragging>,
    mut tracks: Query<(Entity, &Track, &Children, &mut Visibility)>,
    targets: Query<(&ComputedNode, &ScrollPosition)>,
    mut thumbs: Query<(&mut Node, &mut BackgroundColor, &Interaction), With<Thumb>>,
) {
    for (entity, track, children, mut visibility) in &mut tracks {
        let Ok((node, position)) = targets.get(track.target) else {
            continue;
        };
        let metrics = metrics(node);
        let next_visibility = if metrics.maximum <= 1. {
            Visibility::Hidden
        } else {
            Visibility::Inherited
        };
        if *visibility != next_visibility {
            *visibility = next_visibility;
        }
        let fraction = if metrics.maximum > 0. {
            (position.0.y / metrics.maximum).clamp(0., 1.)
        } else {
            0.
        };
        let height = Val::Percent(metrics.ratio * 100.);
        let top = Val::Percent((1. - metrics.ratio) * fraction * 100.);
        let active = dragging.0.is_some_and(|drag| drag.track == entity);
        for child in children.iter() {
            if let Ok((mut node, mut color, interaction)) = thumbs.get_mut(child) {
                if node.height != height {
                    node.height = height;
                }
                if node.top != top {
                    node.top = top;
                }
                let next = if active || *interaction != Interaction::None {
                    GOLD
                } else {
                    EDGE
                };
                if color.0 != next {
                    color.0 = next;
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn native_geometry_numeric_fixtures() {
        let mut node = ComputedNode::default();
        node.size.y = 10.;
        node.content_size.y = 1000.;
        node.inverse_scale_factor = 1.;
        let m = metrics(&node);
        assert_eq!(m.maximum, 990.);
        assert_eq!(m.ratio, 0.08);
        assert!((track_scroll(0.5, m) - 495.).abs() < 0.0001);
        node.size.y = 199.;
        node.content_size.y = 200.;
        assert!(metrics(&node).maximum <= 1.);
    }
    #[test]
    fn native_drag_preserves_grab_offset() {
        let drag = Drag {
            track: Entity::PLACEHOLDER,
            target: Entity::PLACEHOLDER,
            start_cursor_y: 100.,
            start_scroll_y: 30.,
        };
        let m = Metrics {
            maximum: 80.,
            ratio: 0.2,
        };
        assert_eq!(drag_scroll(drag, 100., 2., 200., m), Some(30.));
        assert_eq!(drag_scroll(drag, 110., 2., 200., m), Some(40.));
        assert!((track_scroll(0.25, m) - 15.).abs() < 0.0001);
    }
}
