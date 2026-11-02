//! Historical 0.109.0 RaceTip layout with the 0.120.0 account-aware footer.
use super::{class_name, Action, MenuArt, MenuCatalog, MenuState, Page, GOLD};
use bevy::{prelude::*, ui::FocusPolicy, window::PrimaryWindow};

#[derive(Component)]
pub(super) struct Root;

fn position(node: &mut Node, cursor: Vec2, width: f32) {
    node.left = Val::Px(if cursor.x + 18. + 430. > width {
        (cursor.x - 12. - 430.).max(0.)
    } else {
        cursor.x + 18.
    });
    node.top = Val::Px(cursor.y + 20.);
}

pub(super) fn update(
    mut commands: Commands,
    art: Res<MenuArt>,
    catalog: Res<MenuCatalog>,
    state: Res<MenuState>,
    windows: Query<&Window, With<PrimaryWindow>>,
    sources: Query<(Entity, &Interaction, &Action)>,
    mut roots: Query<(Entity, &mut Node), With<Root>>,
    mut previous: Local<Option<(Entity, u8, u8)>>,
) {
    let Ok(window) = windows.single() else { return };
    let cursor = window.cursor_position();
    let active = if state.page == Page::Character && cursor.is_some() {
        sources.iter().find_map(|(entity, interaction, action)| {
            if *interaction == Interaction::None {
                return None;
            }
            match action {
                Action::Race(race) => Some((entity, *race, state.class_id())),
                _ => None,
            }
        })
    } else {
        None
    };
    if active == *previous && !art.is_changed() && !catalog.is_changed() && !state.is_changed() {
        if let Some(cursor) = cursor {
            for (_, mut node) in &mut roots {
                position(&mut node, cursor, window.width());
            }
        }
        return;
    }
    *previous = active;
    for (entity, _) in &mut roots {
        commands.entity(entity).despawn();
    }
    let (Some((_, race_id, class)), Some(cursor)) = (active, cursor) else {
        return;
    };
    let Some(race) = catalog
        .races
        .iter()
        .find(|race| crate::menu::race_id_for(&race.key) == race_id)
    else {
        return;
    };
    let edge = Color::srgb(0.690, 0.541, 0.227);
    let mut node = Node {
        position_type: PositionType::Absolute,
        width: Val::Px(430.),
        padding: UiRect::axes(Val::Px(12.), Val::Px(10.)),
        border: UiRect::all(Val::Px(1.)),
        border_radius: BorderRadius::all(Val::Px(5.)),
        column_gap: Val::Px(12.),
        ..default()
    };
    position(&mut node, cursor, window.width());
    commands
        .spawn((
            Root,
            node,
            GlobalZIndex(5500),
            FocusPolicy::Pass,
            BackgroundColor(Color::srgba(0.06, 0.04, 0.02, 0.95)),
            BorderColor::all(edge),
            BoxShadow::new(
                Color::linear_rgba(0., 0., 0., 0.85),
                Val::Px(0.),
                Val::Px(3.),
                Val::Px(0.),
                Val::Px(10.),
            ),
        ))
        .with_children(|ui| {
            let mut image = ui.spawn((
                Node {
                    width: Val::Px(40.),
                    height: Val::Px(40.),
                    flex_shrink: 0.,
                    border: UiRect::all(Val::Px(1.)),
                    border_radius: BorderRadius::all(Val::Px(5.)),
                    ..default()
                },
                BorderColor::all(edge),
            ));
            // Current 0.113.2 1402c75a0 uses the racial ability icon here;
            // the sex-specific race atlas belongs to the Appearance buttons.
            if let Some(handle) = crate::gameplay::mechanics::racial_definition(race_id)
                .and_then(|ability| art.icons.get(ability.key))
            {
                image.insert(ImageNode::new(handle.clone()));
            }
            ui.spawn(Node {
                flex_direction: FlexDirection::Column,
                row_gap: Val::Px(3.),
                flex_grow: 1.,
                min_width: Val::Px(0.),
                ..default()
            })
            .with_children(|ui| {
                super::flow_text(ui, &art, &race.name, 18., GOLD, false);
                for line in race.blurb.lines() {
                    ui.spawn((
                        Text::new("• "),
                        TextFont {
                            font: art.font.clone(),
                            font_size: 13.,
                            ..default()
                        },
                        TextColor(edge),
                        crate::menu::native_text_shadow(),
                    ))
                    .with_child((
                        TextSpan::new(line),
                        TextFont {
                            font: art.font.clone(),
                            font_size: 13.,
                            ..default()
                        },
                        TextColor(Color::srgb(0.949, 0.902, 0.788)),
                    ));
                }
                if !state.save.allowed_races(class).contains(&race_id) {
                    let name = catalog
                        .classes
                        .get(
                            crate::save::CLASS_IDS
                                .iter()
                                .position(|id| *id == class)
                                .unwrap_or(0),
                        )
                        .map(|entry| entry.name.as_str())
                        .unwrap_or_else(|| class_name(class));
                    let text = catalog.label("armory.not_open_to").replace("{class}", name);
                    super::flow_text(ui, &art, text, 12., Color::srgb(1., 0.353, 0.235), false);
                    super::flow_text(
                        ui,
                        &art,
                        catalog.label("Open it to every class on the Rewards tab, under Races."),
                        12.,
                        crate::menu::MUTED,
                        false,
                    );
                }
            });
        });
}
