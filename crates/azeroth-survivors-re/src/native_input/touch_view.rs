//! Hash-bound touch nodes and two pause bars; see input-0.105.0.md.
use super::*;
use bevy::ui::FocusPolicy;

#[derive(Default)]
pub(super) struct Widgets {
    base: Option<Entity>,
    knob: Option<Entity>,
    pause: Option<Entity>,
}
fn circle(size: f32) -> Node {
    Node {
        position_type: PositionType::Absolute,
        width: Val::Px(size),
        height: Val::Px(size),
        border: UiRect::all(Val::Px(2.)),
        border_radius: BorderRadius::all(Val::Px(f32::MAX)),
        ..default()
    }
}
pub(super) fn pause_pressed(world: &World, state: &DeviceState) -> bool {
    state
        .widgets
        .pause
        .and_then(|e| world.get::<Interaction>(e))
        .is_some_and(|i| *i == Interaction::Pressed)
}
pub(super) fn update(world: &mut World, state: &mut DeviceState, size: Vec2, shown: bool) {
    if state.widgets.base.is_none() {
        state.widgets.base = Some(
            world
                .spawn((
                    circle(128.),
                    FocusPolicy::Pass,
                    BorderColor::all(Color::linear_rgba(0.973, 0.824, 0.416, 0.45)),
                    BackgroundColor(Color::linear_rgba(0., 0., 0., 0.14)),
                    GlobalZIndex(3900),
                ))
                .id(),
        );
        state.widgets.knob = Some(
            world
                .spawn((
                    circle(54.),
                    FocusPolicy::Pass,
                    BorderColor::all(Color::linear_rgba(1., 0.914, 0.659, 0.7)),
                    BackgroundColor(Color::linear_rgba(0.690, 0.541, 0.227, 0.45)),
                    GlobalZIndex(3901),
                ))
                .id(),
        );
        let mut node = circle(46.);
        node.align_items = AlignItems::Center;
        node.justify_content = JustifyContent::Center;
        node.column_gap = Val::Px(6.);
        state.widgets.pause = Some(
            world
                .spawn((
                    Button,
                    node,
                    BorderColor::all(Color::linear_rgba(0.973, 0.824, 0.416, 0.6)),
                    BackgroundColor(Color::linear_rgba(0., 0., 0., 0.55)),
                    GlobalZIndex(4070),
                ))
                .with_children(|ui| {
                    for _ in 0..2 {
                        ui.spawn((
                            Node {
                                width: Val::Px(6.),
                                height: Val::Px(18.),
                                border_radius: BorderRadius::all(Val::Px(1.)),
                                ..default()
                            },
                            BackgroundColor(Color::linear_rgba(0.973, 0.824, 0.416, 1.)),
                            FocusPolicy::Pass,
                        ));
                    }
                })
                .id(),
        );
    }
    let (base, knob) = state
        .touch
        .movement
        .map(|(_, base, knob)| (base, knob))
        .unwrap_or((
            Vec2::new(120., size.y - 130.),
            Vec2::new(120., size.y - 130.),
        ));
    let pause = world
        .resource::<LocalClientInput>()
        .rendered_minimap_rect
        .map(|r| Vec2::new((r[0] + r[2]) * 0.5 - 23., r[3] + 14.))
        .unwrap_or(Vec2::new(size.x - 63., 17.));
    for (entity, point) in [
        (state.widgets.base, base - Vec2::splat(64.)),
        (state.widgets.knob, knob - Vec2::splat(27.)),
        (state.widgets.pause, pause),
    ] {
        if let Some(entity) = entity {
            if let Some(mut node) = world.get_mut::<Node>(entity) {
                node.display = if shown { Display::Flex } else { Display::None };
                node.left = Val::Px(point.x);
                node.top = Val::Px(point.y);
            }
        }
    }
    if let Some(mut color) = state
        .widgets
        .base
        .and_then(|e| world.get_mut::<BackgroundColor>(e))
    {
        color.0 = Color::linear_rgba(
            0.,
            0.,
            0.,
            if state.touch.movement.is_some() {
                0.3
            } else {
                0.14
            },
        );
    }
}
