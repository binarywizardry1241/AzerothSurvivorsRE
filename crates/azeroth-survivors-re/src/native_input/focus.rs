use super::*;
use bevy::ui::{FocusPolicy, UiGlobalTransform, UiStack};
use std::collections::{HashMap, HashSet};

struct Target {
    entity: Entity,
    rect: Rect,
}

fn targets(world: &mut World, size: Vec2) -> Vec<Target> {
    let scale = {
        let mut q = world.query_filtered::<&Window, With<PrimaryWindow>>();
        q.single(world).map_or(1., |w| w.scale_factor()).max(0.01)
    };
    let stack: HashMap<_, _> = world
        .resource::<UiStack>()
        .uinodes
        .iter()
        .enumerate()
        .map(|(index, entity)| (*entity, index))
        .collect();
    let mut query = world.query_filtered::<(
        Entity,
        &ComputedNode,
        &UiGlobalTransform,
        &InheritedVisibility,
        Option<&crate::menu::Face>,
        Option<&crate::gameplay::DeviceChoiceEnabled>,
    ), With<Interaction>>();
    let mut out = Vec::new();
    for (entity, node, transform, visibility, face, enabled) in query.iter(world) {
        if !visibility.get()
            || node.size.min_element() < 1.
            || face.is_some_and(|f| f.disabled)
            || enabled.is_some_and(|e| !e.0)
        {
            continue;
        }
        let rect = bounds(node, transform, scale);
        let extent = rect.size();
        if extent.x * extent.y > size.x * size.y * 0.5 {
            continue;
        }
        out.push(Target { entity, rect });
    }
    // Native excludes candidate ancestors, then tests later Block nodes at
    // each candidate's center. A global maximum-layer filter loses uncovered
    // controls on lower layers, and cannot represent siblings' draw order.
    let mut ancestors = HashSet::new();
    for target in &out {
        let mut entity = target.entity;
        while let Some(parent) = world.get::<ChildOf>(entity) {
            entity = parent.parent();
            ancestors.insert(entity);
        }
    }
    let mut query = world.query::<(
        Entity,
        &ComputedNode,
        &UiGlobalTransform,
        &InheritedVisibility,
        &FocusPolicy,
    )>();
    let occluders: Vec<_> = query
        .iter(world)
        .filter(|(_, node, _, visible, policy)| {
            visible.get() && node.size.min_element() >= 1. && matches!(policy, FocusPolicy::Block)
        })
        .filter_map(|(entity, node, transform, _, _)| {
            stack
                .get(&entity)
                .map(|index| (entity, *index, bounds(node, transform, scale)))
        })
        .collect();
    out.retain(|target| {
        let Some(index) = stack.get(&target.entity) else {
            return false;
        };
        !ancestors.contains(&target.entity)
            && !occluders.iter().any(|(entity, other, rect)| {
                other > index
                    && rect.contains(target.rect.center())
                    && *entity != target.entity
                    && !is_ancestor(world, *entity, target.entity)
                    && !is_ancestor(world, target.entity, *entity)
            })
    });
    out
}

fn bounds(node: &ComputedNode, transform: &UiGlobalTransform, scale: f32) -> Rect {
    let half = node.size * 0.5;
    let affine = transform.affine();
    let inverse_scale = scale.recip();
    // Current native policy transforms these two opposite corners. Clipping,
    // viewport intersection or a four-corner hull would change its candidates.
    Rect::from_corners(
        affine.transform_point2(-half) * inverse_scale,
        affine.transform_point2(half) * inverse_scale,
    )
}

fn is_ancestor(world: &World, ancestor: Entity, mut entity: Entity) -> bool {
    while let Some(parent) = world.get::<ChildOf>(entity) {
        entity = parent.parent();
        if entity == ancestor {
            return true;
        }
    }
    false
}

fn reveal(world: &mut World, target: &Target) {
    let scale = {
        let mut query = world.query_filtered::<&Window, With<PrimaryWindow>>();
        query.single(world).map_or(1., |window| window.scale_factor())
    };
    let mut entity = target.entity;
    while let Some(parent) = world.get::<ChildOf>(entity) {
        entity = parent.parent();
        if !world.get::<Node>(entity).is_some_and(|node|
            node.overflow.y == bevy::ui::OverflowAxis::Scroll)
            || world.get::<ScrollPosition>(entity).is_none() {
            continue;
        }
        let (Some(node), Some(transform), Some(position)) = (
            world.get::<ComputedNode>(entity), world.get::<UiGlobalTransform>(entity),
            world.get::<ScrollPosition>(entity),
        ) else { return; };
        let ratio = transform.affine().matrix2.y_axis.length().max(0.01)
            / (scale * node.inverse_scale_factor).max(0.01);
        let maximum = ((node.content_size.y - node.size.y) * node.inverse_scale_factor).max(0.);
        let next = policy::reveal_offset(target.rect, bounds(node, transform, scale.max(0.01)),
            position.0.y, ratio, maximum);
        if let Some(next) = next {
            world.get_mut::<ScrollPosition>(entity).unwrap().0.y = next;
            crate::options::device_scroll_position(world, next);
        }
        // Native stops at the nearest matching vertical scroll ancestor.
        return;
    }
}

pub(super) fn update(
    world: &mut World,
    state: &mut DeviceState,
    pad: &Pad,
    size: Vec2,
    now: f32,
    window: Entity,
) {
    let targets = targets(world, size);
    let previous = state.focus;
    if state.focus.is_some() && !targets.iter().any(|t| Some(t.entity) == state.focus) {
        state.focus = None;
        state.focus_missing = 0;
    }
    if state.focus.is_none() {
        // Native .4c saturates at 255. A remembered position waits until the
        // third missing-focus pass; the initial window-center search is immediate.
        state.focus_missing = state.focus_missing.saturating_add(1);
        if state.focus_missing >= 3 || state.previous_center.is_none() {
            let from = state.previous_center.unwrap_or(size * 0.5);
            state.focus = targets
                .iter()
                .min_by(|a, b| {
                    a.rect
                        .center()
                        .distance_squared(from)
                        .total_cmp(&b.rect.center().distance_squared(from))
                })
                .map(|t| t.entity);
        }
    }
    let direction = IVec2::new(
        if pad.dpad.x < 0. || pad.left.x < -policy::NAV_THRESHOLD {
            -1
        } else if pad.dpad.x > 0. || pad.left.x > policy::NAV_THRESHOLD {
            1
        } else {
            0
        },
        if pad.dpad.y > 0. || pad.left.y > policy::NAV_THRESHOLD {
            -1
        } else if pad.dpad.y < 0. || pad.left.y < -policy::NAV_THRESHOLD {
            1
        } else {
            0
        },
    );
    if state.focus.is_some() && state.repeat.tick(direction, now) {
        if let Some(target) = targets.iter().find(|t| Some(t.entity) == state.focus) {
            let slider = direction.y == 0
                && crate::options::device_slider(world, target.entity, direction.x);
            if !slider {
                let direction = direction.as_vec2().normalize();
                state.focus = targets
                    .iter()
                    .filter(|t| t.entity != target.entity)
                    .filter_map(|t| {
                        policy::focus_score(target.rect.center(), t.rect.center(), direction)
                            .map(|score| (t.entity, score))
                    })
                    .min_by(|a, b| a.1.total_cmp(&b.1))
                    .map(|t| t.0)
                    .or(state.focus);
            }
        }
    }
    if previous != state.focus {
        if let Some(previous) = previous {
            if let Some(mut cursor) = world.get_mut::<bevy::ui::RelativeCursorPosition>(previous) {
                cursor.cursor_over = false;
            }
            if let Some(mut interaction) = world.get_mut::<Interaction>(previous) {
                *interaction = Interaction::None;
            }
        }
    }
    let activated = state.focus.filter(|_| pad.accept_pressed);
    if pad.back && state.focus.is_some() {
        world.resource_mut::<LocalDeviceInput>().menu_requested = true;
    }
    if pad.secondary_pressed && state.focus.is_some() {
        pulse_secondary(world, state, window);
    }
    if let Some(entity) = activated {
        if let Some(mut interaction) = world.get_mut::<Interaction>(entity) {
            *interaction = Interaction::Pressed;
        }
        world.resource_mut::<DeviceUiInput>().activated = Some(entity);
    }
    if let Some(target) = targets.iter().find(|t| Some(t.entity) == state.focus) {
        if let Some(mut cursor) = world.get_mut::<bevy::ui::RelativeCursorPosition>(target.entity) {
            cursor.cursor_over = true;
            cursor.normalized = Some(Vec2::ZERO);
        }
        state.previous_center = Some(target.rect.center());
        if activated != Some(target.entity) {
            if let Some(mut interaction) = world.get_mut::<Interaction>(target.entity) {
                if *interaction != Interaction::Hovered {
                    *interaction = Interaction::Hovered;
                }
            }
        }
        let node = Node {
            position_type: PositionType::Absolute,
            left: Val::Px(target.rect.min.x - 3.),
            top: Val::Px(target.rect.min.y - 3.),
            width: Val::Px(target.rect.width() + 6.),
            height: Val::Px(target.rect.height() + 6.),
            border: UiRect::all(Val::Px(1.)),
            ..default()
        };
        if let Some(mut ring) = state.ring.and_then(|e| world.get_entity_mut(e).ok()) {
            ring.insert((node, Visibility::Visible));
        } else {
            state.ring = Some(
                world
                    .spawn((
                        node,
                        FocusPolicy::Pass,
                        Pickable::IGNORE,
                        BorderColor::all(Color::srgba(1., 0.914, 0.659, 1.)),
                        BoxShadow::new(
                            Color::linear_rgba(0.973, 0.824, 0.416, 0.6),
                            Val::Px(0.),
                            Val::Px(0.),
                            Val::Px(1.),
                            Val::Px(8.),
                        ),
                        GlobalZIndex(100_000),
                        Visibility::Visible,
                    ))
                    .id(),
            );
        }
        reveal(world, target);
    } else {
        hide(world, state);
    }
}

pub(super) fn hide(world: &mut World, state: &mut DeviceState) {
    if let Some(mut node) = state.ring.and_then(|e| world.get_mut::<Node>(e)) {
        node.display = Display::None;
    }
}

pub(super) fn deactivate(world: &mut World, state: &mut DeviceState) {
    state.focus = None;
    state.repeat = policy::Repeat::default();
    hide(world, state);
}
