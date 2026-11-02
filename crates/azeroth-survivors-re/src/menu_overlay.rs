//! Native Escape Menu: 356600 supplies420×(160+54*button_count), 1c8d40 builds it.
use crate::{
    assets::MenuArt,
    canvas::NativeCanvas,
    catalog::MenuCatalog,
    menu::{self, Action, Face, GOLD, MUTED},
    menu_state::{Dialog, MenuState},
    options::OptionsSet,
};
use bevy::{prelude::*, ui::FocusPolicy};

pub struct MenuOverlayPlugin;
impl Plugin for MenuOverlayPlugin {
    fn build(&self, app: &mut App) {
        app.add_systems(Update, rebuild.after(OptionsSet::Input));
    }
}
#[derive(Component, Clone)]
struct Root;
fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: &str,
    size: f32,
    color: Color,
    title: bool,
) {
    ui.spawn((
        Text::new(value),
        TextFont {
            font: if title {
                art.heading_font.clone()
            } else {
                art.font.clone()
            },
            font_size: size,
            ..default()
        },
        TextColor(color),
        menu::native_text_shadow(),
    ));
}
fn rebuild(
    mut commands: Commands,
    state: Res<MenuState>,
    art: Res<MenuArt>,
    catalog: Res<MenuCatalog>,
    roots: Query<Entity, With<Root>>,
    mut previous: Local<bool>,
) {
    let open = matches!(state.dialog, Some(Dialog::Menu));
    if open == *previous && (!open || (!art.is_changed() && !catalog.is_changed())) {
        return;
    }
    *previous = open;
    for entity in &roots {
        commands.entity(entity).despawn();
    }
    if !open {
        return;
    }
    let rows = [
        (catalog.label("menu.back").to_owned(), Action::Close),
        (catalog.label("picker.options").to_owned(), Action::Options),
        (catalog.label("menu.quit").to_owned(), Action::Quit),
    ];
    spawn(&mut commands, Root, &art, catalog.label("picker.menu"),
        catalog.label("menu.escape_back"), &rows, 400);
}

/// The shared native Escape panel, also revalidated for the 0.105.0 run pause
/// constructor14027a720 / child builder1401b3d20. Actions remain caller-owned.
pub(crate) fn spawn<M: Component + Clone, A: Component + Clone>(
    commands: &mut Commands, marker: M, art: &MenuArt,
    title: &str, hint: &str, rows: &[(String, A)], layer: i32,
) {
    let height = 160. + 54. * rows.len() as f32;
    commands.spawn((
        marker.clone(),
        Node {
            position_type: PositionType::Absolute,
            width: Val::Percent(100.),
            height: Val::Percent(100.),
            ..default()
        },
        BackgroundColor(Color::srgba(0., 0., 0., 0.55)),
        GlobalZIndex(layer),
        Interaction::None,
        FocusPolicy::Block,
    ));
    commands
        .spawn((
            marker,
            NativeCanvas {
                design: Vec2::new(420., height),
                max_scale: 1.3,
            },
            GlobalZIndex(layer + 1),
            Node {
                position_type: PositionType::Absolute,
                width: Val::Px(420.),
                height: Val::Px(height),
                align_items: AlignItems::Center,
                justify_content: JustifyContent::Center,
                ..default()
            },
        ))
        .with_children(|canvas| {
            menu::native_panel(
                canvas,
                Node {
                    padding: UiRect::axes(Val::Px(30.), Val::Px(22.)),
                    flex_direction: FlexDirection::Column,
                    row_gap: Val::Px(12.),
                    align_items: AlignItems::Center,
                    ..default()
                },
                |panel| {
                    text(panel, art, title, 46., GOLD, true);
                    text(
                        panel,
                        art,
                        hint,
                        15.,
                        MUTED,
                        false,
                    );
                    panel
                        .spawn(Node {
                            min_width: Val::Px(240.),
                            flex_direction: FlexDirection::Column,
                            row_gap: Val::Px(10.),
                            margin: UiRect::top(Val::Px(6.)),
                            align_items: AlignItems::Stretch,
                            ..default()
                        })
                        .with_children(|buttons| {
                            for (label, action) in rows {
                                buttons
                                    .spawn((
                                        Button,
                                        menu::NativeStaticFrame,
                                        action.clone(),
                                        Face {
                                            selected: false,
                                            primary: true,
                                            disabled: false,
                                        },
                                        Node {
                                            padding: UiRect::axes(Val::Px(22.), Val::Px(10.)),
                                            border: UiRect::all(Val::Px(1.)),
                                            border_radius: BorderRadius::all(Val::Px(4.)),
                                            justify_content: JustifyContent::Center,
                                            ..default()
                                        },
                                        BackgroundColor(Color::NONE),
                                        BorderColor::all(menu::BUTTON_EDGE),
                                        menu::native_button_gradient(),
                                        BoxShadow::new(
                                            Color::srgba(0., 0., 0., 0.85),
                                            Val::Px(0.),
                                            Val::Px(2.),
                                            Val::Px(0.),
                                            Val::Px(6.),
                                        ),
                                    ))
                                    .with_children(|button| {
                                        text(button, art, label, 17., GOLD, false)
                                    });
                            }
                        });
                },
            );
        });
}
