//! Native picker tooltip placement (1280a0) and text rows (20f4b0).
use crate::{
    assets::MenuArt,
    menu,
    menu_state::MenuState,
    options::{OptionsSet, OptionsState},
};
use bevy::{prelude::*, ui::FocusPolicy, window::PrimaryWindow};

#[derive(Component, Clone, PartialEq, Eq)]
pub struct NativeTooltip {
    pub title: String,
    pub subtitle: String,
    pub body: String,
}
#[derive(Component)]
pub(crate) struct InspectionTooltip;
pub struct NativeTooltipPlugin;
impl Plugin for NativeTooltipPlugin {
    fn build(&self, app: &mut App) {
        app.add_systems(Update, rebuild.after(OptionsSet::Input));
    }
}
#[derive(Component)]
struct Root;

pub(crate) fn position(node: &mut Node, cursor: Vec2, size: Vec2) {
    node.left = Val::Px(if cursor.x + 18.0 + 320.0 > size.x {
        (cursor.x - 12.0 - 320.0).max(0.0)
    } else {
        cursor.x + 18.0
    });
    if cursor.y > size.y * 0.6 {
        node.top = Val::Auto;
        node.bottom = Val::Px(size.y - cursor.y + 8.0);
    } else {
        node.top = Val::Px(cursor.y + 20.0);
        node.bottom = Val::Auto;
    }
}
pub(crate) fn frame(cursor: Vec2, size: Vec2) -> Node {
    let mut node = Node {
        position_type: PositionType::Absolute,
        width: Val::Px(320.0),
        padding: UiRect::axes(Val::Px(12.0), Val::Px(9.0)),
        border: UiRect::all(Val::Px(1.0)),
        border_radius: BorderRadius::all(Val::Px(5.0)),
        flex_direction: FlexDirection::Column,
        row_gap: Val::Px(4.0),
        ..default()
    };
    position(&mut node, cursor, size);
    node
}

pub(crate) fn spawn_frame(commands: &mut Commands, node: Node, z: i32) -> Entity {
    commands.spawn((
        node,
        GlobalZIndex(z),
        FocusPolicy::Pass,
        BackgroundColor(Color::srgba(0.02, 0.02, 0.06, 0.94)),
        BorderColor::all(Color::srgb(0.55, 0.55, 0.58)),
        BoxShadow::new(
            Color::linear_rgba(0.0, 0.0, 0.0, 0.85),
            Val::Px(0.0), Val::Px(3.0), Val::Px(0.0), Val::Px(10.0),
        ),
    )).id()
}
fn rebuild(
    mut commands: Commands,
    art: Res<MenuArt>,
    menu_state: Res<MenuState>,
    options: Res<OptionsState>,
    windows: Query<&Window, With<PrimaryWindow>>,
    sources: Query<(Entity, &Interaction, &NativeTooltip, Option<&InspectionTooltip>)>,
    coop: Option<Res<crate::coop_ui::CoopUi>>,
    time: Res<Time>,
    mut roots: Query<(Entity, &mut Node), With<Root>>,
    mut previous: Local<Option<(Entity, NativeTooltip)>>,
) {
    let Ok(window) = windows.single() else {
        return;
    };
    let cursor = window.cursor_position();
    let inspection = matches!(menu_state.dialog, Some(crate::menu_state::Dialog::CoopInspect(_)));
    let active = if options.open || cursor.is_none()
        || (menu_state.dialog.is_some() && !inspection)
        || (inspection && coop.is_some_and(|view| view.ready_modal_visible(time.elapsed_secs())))
    {
        None
    } else {
        sources
            .iter()
            .find(|(_, interaction, _, inspect)| inspect.is_some() == inspection
                && **interaction != Interaction::None)
            .map(|(entity, _, text, _)| (entity, text.clone()))
    };
    if active == *previous && !art.is_changed() {
        if let Some(cursor) = cursor {
            for (_, mut node) in &mut roots {
                position(
                    &mut node,
                    cursor,
                    Vec2::new(window.width(), window.height()),
                );
            }
        }
        return;
    }
    *previous = active.clone();
    for (entity, _) in &mut roots {
        commands.entity(entity).despawn();
    }
    let (Some((_, text)), Some(cursor)) = (active, cursor) else {
        return;
    };
    let node = frame(cursor, Vec2::new(window.width(), window.height()));
    let root = spawn_frame(&mut commands, node, if inspection { 6090 } else { 5100 });
    commands.entity(root).insert(Root)
        .with_children(|ui| {
            for (value, size, color) in [
                (&text.title, 16.0, Color::WHITE),
                (&text.subtitle, 12.0, menu::MUTED),
                (&text.body, 13.0, menu::GOLD),
            ] {
                ui.spawn((
                    Text::new(value),
                    TextFont {
                        font: art.font.clone(),
                        font_size: size,
                        ..default()
                    },
                    TextColor(color),
                    menu::native_text_shadow(),
                ));
            }
        });
}
