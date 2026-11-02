//! The selected 0.105.0 run's custom, read-only talent window.
//! Native shell: 1401308b0 / 1401a5a10 / 1401a5ce0; shared trees: 14012bb00.
//! See docs/analysis/talent-view-0.105.0.md for evidence and validation limits.

use bevy::{
    prelude::*,
    ui::{FocusPolicy, RelativeCursorPosition},
};

use crate::{
    assets::MenuArt,
    canvas::NativeCanvas,
    catalog::MenuCatalog,
    menu::{self, GOLD, MUTED},
    menu_state::MenuState,
    save::talents::budget,
    talents::{self, Cell, ReadOnlyCell, TalentArt, TalentCatalog},
};

use super::{RunSession, RunSet};

pub(super) struct TalentViewPlugin;

impl Plugin for TalentViewPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<View>()
            .add_systems(Update, rebuild.in_set(RunSet::Present));
    }
}

#[derive(Component)]
struct Root;

#[derive(Component)]
pub(super) struct Close;

#[derive(Resource, Default)]
struct View {
    signature: String,
}

/// Runs in the same input chain before the sole pause writer. No save or
/// allocation-changing action is attached to any cell in this screen.
pub(super) fn input(
    mut session: ResMut<RunSession>,
    cells: Query<(&RelativeCursorPosition, &Cell), With<ReadOnlyCell>>,
    close: Query<&Interaction, (Changed<Interaction>, With<Close>)>,
) {
    if !session.talent_view_open {
        return;
    }
    if close
        .iter()
        .any(|interaction| *interaction == Interaction::Pressed)
    {
        session.talent_view_open = false;
        return;
    }
    if let Some((_, cell)) = cells.iter().find(|(cursor, _)| cursor.cursor_over) {
        if session.talent_view_selected.as_deref() != Some(cell.0.as_str()) {
            session.talent_view_selected = Some(cell.0.clone());
        }
    }
}

fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    color: Color,
    heading: bool,
) {
    ui.spawn((
        Text::new(value),
        TextFont {
            font: if heading {
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
    mut view: ResMut<View>,
    session: Res<RunSession>,
    menu: Res<MenuState>,
    catalog: Res<MenuCatalog>,
    definitions: Res<TalentCatalog>,
    art: Res<MenuArt>,
    images: Res<TalentArt>,
    roots: Query<Entity, With<Root>>,
) {
    let game = session
        .mechanics
        .as_ref()
        .filter(|_| menu.in_run && session.talent_view_open);
    let signature = if let Some(game) = game {
        format!(
            "{}:{:?}:{:?}:{}:{}",
            game.class.class_id,
            session.talent_allocation,
            session.talent_view_selected,
            menu.backend_save.talent_xp(game.class.class_id),
            menu.backend_save.earned_achievements()
                .contains(crate::save::talents::WHITE_DEVILSAUR_ACHIEVEMENT),
        )
    } else {
        String::new()
    };
    if signature == view.signature
        && !catalog.is_changed()
        && !art.is_changed()
        && !images.is_changed()
    {
        return;
    }
    for root in &roots {
        commands.entity(root).despawn();
    }
    view.signature = signature;
    let Some(game) = game else { return };
    let class = definitions.class(game.class.class_id);
    let display_class = catalog
        .classes
        .iter()
        .find(|class| class.key == game.class.key);
    let earned = budget(menu.backend_save.talent_xp(class.id)).0;
    commands
        .spawn((
            Root,
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                ..default()
            },
            GlobalZIndex(5300),
            Interaction::None,
            FocusPolicy::Block,
            BackgroundColor(Color::srgba(0., 0., 0., 0.72)),
        ))
        .with_children(|root| {
            root.spawn((
                NativeCanvas {
                    design: Vec2::new(1600., 860.),
                    max_scale: 1.6,
                },
                Node {
                    position_type: PositionType::Absolute,
                    width: Val::Px(1600.),
                    height: Val::Px(860.),
                    ..default()
                },
            ))
            .with_children(|canvas| {
                canvas
                    .spawn(Node {
                        width: Val::Percent(100.),
                        height: Val::Percent(100.),
                        padding: UiRect::axes(Val::Px(40.), Val::Px(20.)),
                        flex_direction: FlexDirection::Column,
                        row_gap: Val::Px(14.),
                        ..default()
                    })
                    .with_children(|body| {
                        body.spawn(Node {
                            width: Val::Percent(100.),
                            align_items: AlignItems::Center,
                            column_gap: Val::Px(14.),
                            ..default()
                        })
                        .with_children(|header| {
                            header
                                .spawn(Node {
                                    flex_grow: 1.,
                                    flex_direction: FlexDirection::Column,
                                    ..default()
                                })
                                .with_children(|title| {
                                    text(title, &art, catalog.label("Talents"), 42., GOLD, true);
                                    // Selected-target ClassDef supplies the class
                                    // markup color; only the trailing hint is muted.
                                    let (name, color) = display_class
                                        .map(|class| {
                                            (
                                                catalog.label(&class.name),
                                                Color::srgb(
                                                    class.color[0],
                                                    class.color[1],
                                                    class.color[2],
                                                ),
                                            )
                                        })
                                        .unwrap_or(("", GOLD));
                                    title
                                        .spawn((
                                            Text::new(name),
                                            TextFont {
                                                font: art.font.clone(),
                                                font_size: 15.,
                                                ..default()
                                            },
                                            TextColor(color),
                                            menu::native_text_shadow(),
                                        ))
                                        .with_children(|line| {
                                            line.spawn((
                                                TextSpan::new(
                                                    catalog.label("  ·  what this run plays with"),
                                                ),
                                                TextColor(MUTED),
                                            ));
                                        });
                                });
                            header
                                .spawn((
                                    Button,
                                    Close,
                                    menu::Face {
                                        selected: false,
                                        primary: false,
                                        disabled: false,
                                    },
                                    Node {
                                        padding: UiRect::axes(Val::Px(14.), Val::Px(6.)),
                                        border: UiRect::all(Val::Px(1.)),
                                        border_radius: BorderRadius::all(Val::Px(5.)),
                                        align_items: AlignItems::Center,
                                        justify_content: JustifyContent::Center,
                                        ..default()
                                    },
                                    BorderColor::all(menu::BUTTON_EDGE),
                                    menu::native_button_gradient(),
                                ))
                                .with_children(|button| {
                                    text(
                                        button,
                                        &art,
                                        catalog.label("Close"),
                                        18.,
                                        Color::srgb(1., 0.914, 0.659),
                                        false,
                                    )
                                });
                        });
                        body.spawn(Node {
                            width: Val::Percent(100.),
                            flex_grow: 1.,
                            column_gap: Val::Px(18.),
                            ..default()
                        })
                        .with_children(|trees| {
                            for (index, tree) in class.trees.iter().enumerate() {
                                talents::draw_tree(
                                    trees,
                                    &art,
                                    &images,
                                    &catalog,
                                    class,
                                    tree,
                                    &session.talent_allocation,
                                    earned,
                                    session.talent_view_selected.as_deref(),
                                    true,
                                    (class.id == 3 && index == 0).then(|| menu.backend_save
                                        .earned_achievements().contains(crate::save::talents::WHITE_DEVILSAUR_ACHIEVEMENT)),
                                );
                            }
                            talents::draw_details(
                                trees,
                                &art,
                                &images,
                                &catalog,
                                &menu,
                                class,
                                &session.talent_allocation,
                                session.talent_view_selected.as_deref(),
                                true,
                            );
                        });
                    });
            });
        });
}
