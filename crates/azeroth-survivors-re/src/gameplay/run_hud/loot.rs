//! Selected 0.105.0 equipment notices: producer1458971b7,
//! card1401b2970 and seven-second lifetime/animation140279050.
use super::{super::RunSession, HudSettings};
use crate::{armory::ArmoryCatalog, assets::MenuArt, localization::Localization};
use benilla_app::local_client::LocalClientLoadingCover;
use bevy::{picking::Pickable, prelude::*};

struct Row {
    id: u32,
    is_new: bool,
    born: f32,
}

#[derive(Resource, Default)]
pub(crate) struct LootNotices {
    rows: Vec<Row>,
    revision: u64,
    rendered: Option<(usize, u64)>,
    root: Option<Entity>,
}

impl LootNotices {
    pub(crate) fn push(&mut self, id: u32, is_new: bool, now: f32) {
        self.rows.push(Row {
            id,
            is_new,
            born: now,
        });
        self.revision = self.revision.wrapping_add(1);
    }
}

#[derive(Component)]
pub(super) struct Born(f32);

fn colors(rarity: usize) -> (Color, Color, Color) {
    //1401b2b33: the five native rows, indexed by wire rarity minus1.
    let (name, edge, background) = match rarity {
        1 => ([0.118, 1., 0.], [0.075, 0.541, 0.], [0.067, 0.161, 0.047]),
        2 => (
            [0.231, 0.612, 1.],
            [0.039, 0.310, 0.612],
            [0.047, 0.110, 0.200],
        ),
        3 | 5 | 7 => (
            [0.761, 0.486, 1.],
            [0.420, 0.122, 0.659],
            [0.133, 0.063, 0.227],
        ),
        4 => (
            [1., 0.604, 0.165],
            [0.698, 0.329, 0.],
            [0.227, 0.114, 0.020],
        ),
        _ => ([0.910; 3], [0.541; 3], [0.165, 0.161, 0.145]),
    };
    (
        Color::srgb(name[0], name[1], name[2]),
        Color::srgb(edge[0], edge[1], edge[2]),
        Color::srgba(background[0], background[1], background[2], 0.92),
    )
}

pub(super) fn sync(
    mut commands: Commands,
    mut state: ResMut<LootNotices>,
    time: Res<Time>,
    session: Res<RunSession>,
    settings: Res<HudSettings>,
    loading: LocalClientLoadingCover,
    art: Res<MenuArt>,
    armory: Res<ArmoryCatalog>,
    locale: Res<Localization>,
) {
    let Some(game) = session.mechanics.as_ref() else {
        if let Some(root) = state.root.take() {
            commands.entity(root).despawn();
        }
        state.rows.clear();
        state.rendered = None;
        return;
    };
    let now = time.elapsed_secs();
    // Native ScreenState+80 is the current `choices` JSON, and+ea is pause.
    // Terminal messages clear both; terminal visibility alone does not freeze loot.
    let choosing = game.is_paused_for_choice();
    let covered = loading.covering();
    if session.paused || choosing || covered {
        for row in &mut state.rows {
            row.born = (row.born + time.delta_secs()).min(now);
        }
    }
    state.rows.retain(|row| now - row.born < 7.);
    let visibility = if settings.shown("loot") && !covered {
        Visibility::Inherited
    } else {
        Visibility::Hidden
    };
    if let Some(root) = state.root {
        commands.entity(root).insert(visibility);
    }
    let key = (state.rows.len(), state.revision);
    if state.rendered == Some(key) && state.root.is_some() {
        return;
    }
    if let Some(root) = state.root.take() {
        commands.entity(root).despawn();
    }
    state.rendered = Some(key);
    if state.rows.is_empty() {
        return;
    }
    state.root = Some(
        commands
            .spawn((
                Node {
                    position_type: PositionType::Absolute,
                    right: Val::Px(24.),
                    top: Val::Percent(38.),
                    row_gap: Val::Px(8.),
                    align_items: AlignItems::FlexEnd,
                    flex_direction: FlexDirection::Column,
                    ..default()
                },
                GlobalZIndex(6100),
                visibility,
                Pickable::IGNORE,
            ))
            .with_children(|root| {
                for row in &state.rows {
                    let Some(piece) = armory.piece(row.id) else {
                        continue;
                    };
                    let (name, edge, background) = colors(piece.rarity);
                    root.spawn((
                        Born(row.born),
                        Node {
                            min_width: Val::Px(280.),
                            padding: UiRect {
                                left: Val::Px(8.),
                                right: Val::Px(16.),
                                top: Val::Px(7.),
                                bottom: Val::Px(7.),
                            },
                            column_gap: Val::Px(10.),
                            align_items: AlignItems::Center,
                            border: UiRect::all(Val::Px(1.)),
                            border_radius: BorderRadius::all(Val::Px(8.)),
                            ..default()
                        },
                        UiTransform::default(),
                        BackgroundColor(background),
                        BorderColor::all(edge),
                        BoxShadow::new(
                            name.with_alpha(0.35),
                            Val::Px(0.),
                            Val::Px(0.),
                            Val::Px(0.),
                            Val::Px(14.),
                        ),
                    ))
                    .with_children(|card| {
                        let mut icon = card.spawn((
                            Node {
                                width: Val::Px(40.),
                                height: Val::Px(40.),
                                border: UiRect::all(Val::Px(2.)),
                                border_radius: BorderRadius::all(Val::Px(5.)),
                                ..default()
                            },
                            BorderColor::all(name),
                        ));
                        if let Some(image) = art
                            .icons
                            .get(&format!("gear.{}", piece.display_id(game.stats.native_race)))
                        {
                            icon.insert(ImageNode::new(image.clone()));
                        }
                        card.spawn(Node {
                            flex_direction: FlexDirection::Column,
                            row_gap: Val::Px(2.),
                            ..default()
                        })
                        .with_children(|body| {
                            label(
                                body,
                                &art,
                                format!(
                                    "{} · {}",
                                    locale.label("hud.loot"),
                                    locale.label(&format!("slot.{}", piece.slot))
                                ),
                                11.,
                                Color::srgb(0.725, 0.663, 0.510),
                            );
                            let title = piece.tier05_name_key()
                                .and_then(|key| locale.lookup(&key))
                                .unwrap_or_else(|| piece.name(game.stats.native_race));
                            label(body, &art, title, 17., name);
                            label(
                                body,
                                &art,
                                locale.label(if row.is_new {
                                    "hud.new_in_collection"
                                } else {
                                    "hud.already_collected"
                                }),
                                12.,
                                if row.is_new {
                                    Color::srgb(0.302, 1., 0.416)
                                } else {
                                    Color::srgb(0.725, 0.663, 0.510)
                                },
                            );
                        });
                    });
                }
            })
            .id(),
    );
}

fn label(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    text: impl Into<String>,
    size: f32,
    color: Color,
) {
    ui.spawn((
        Text::new(text),
        TextFont {
            font: art.font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        crate::menu::native_text_shadow(),
    ));
}

pub(super) fn animate(
    time: Res<Time>,
    mut rows: Query<(&Born, &mut UiTransform, &mut BackgroundColor)>,
) {
    for (born, mut transform, mut background) in &mut rows {
        let progress = (time.elapsed_secs() - born.0) / 7.;
        let entrance = (progress / 0.05).min(1.);
        transform.translation = bevy::ui::Val2::px((1. - entrance) * 60., 0.);
        let fade = if progress > 0.85 {
            (1. - progress) / 0.15
        } else {
            1.
        };
        background.0 = background.0.with_alpha(fade.clamp(0., 1.) * 0.92);
    }
}
