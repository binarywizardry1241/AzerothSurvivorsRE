//! Current 0.121.0 Difficulty selection, including the six native rank rows.
//! Evidence and static UI submission checks: docs/analysis/difficulty-ui-0.121.0.md.
//! Retained co-op return path: docs/analysis/coop-lobby-ui-0.123.0.md.
use crate::{
    assets::MenuArt,
    canvas::NativeCanvas,
    catalog::MenuCatalog,
    menu::{Action, EDGE, Face},
    menu_state::{Dialog, MenuState},
    options::OptionsSet,
};
use azeroth_survivors_re::heroic;
use bevy::{prelude::*, ui::FocusPolicy};

const GOLD: Color = Color::srgb(0.973, 0.824, 0.416);
const MUTED: Color = Color::srgb(0.725, 0.663, 0.510);
const PAPER: Color = Color::srgb(0.949, 0.902, 0.788);
const HIGHLIGHT: Color = Color::srgb(1., 0.914, 0.659);
const HELP: &str = "Heroic makes {zone} harder for more marks, boss loot and talent experience. Beating Heroic N here opens the next level for every class, and lets this class's gear from here go to N stars.";

pub struct RunOptionsPlugin;
impl Plugin for RunOptionsPlugin {
    fn build(&self, app: &mut App) {
        app.add_systems(Update, rebuild.after(OptionsSet::Input));
    }
}
#[derive(Component)]
struct Root;

pub(crate) fn rank_name(rank: u8, catalog: &MenuCatalog) -> String {
    heroic::rank_name(rank, catalog.label("Normal"), catalog.label("Heroic"))
}

// Native140277c10 formats to two decimals, then removes trailing zeroes and dots.
fn number(value: f32) -> String {
    format!("{value:.2}")
        .trim_end_matches('0')
        .trim_end_matches('.')
        .to_owned()
}

fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
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
        crate::menu::native_text_shadow(),
    ));
}

fn rule(ui: &mut ChildSpawnerCommands) {
    ui.spawn((
        Node {
            width: Val::Percent(100.),
            height: Val::Px(1.),
            flex_shrink: 0.,
            ..default()
        },
        BackgroundColor(EDGE),
    ));
}

fn button(ui: &mut ChildSpawnerCommands, art: &MenuArt, value: &str, action: Action, size: f32) {
    ui.spawn((
        Button,
        action,
        Face {
            selected: false,
            primary: true,
            disabled: false,
        },
        Node {
            padding: UiRect::axes(Val::Px(14.), Val::Px(6.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(4.)),
            align_items: AlignItems::Center,
            justify_content: JustifyContent::Center,
            flex_shrink: 0.,
            ..default()
        },
        BackgroundColor(Color::srgb(0.19, 0.025, 0.018)),
        BorderColor::all(crate::menu::BUTTON_EDGE),
        crate::menu::native_button_gradient(),
    ))
    .with_children(|ui| text(ui, art, value, size, GOLD, false));
}

fn rank_color(rank: u8) -> Color {
    if rank == 0 {
        return GOLD;
    }
    let fraction = f32::from(rank - 1) * 0.25;
    Color::srgb(
        1. - fraction * 0.07,
        0.62 - fraction * 0.48,
        0.22 - fraction * 0.10,
    )
}

fn chip(ui: &mut ChildSpawnerCommands, art: &MenuArt, value: String, color: Color) {
    ui.spawn((
        Node {
            padding: UiRect::axes(Val::Px(7.), Val::Px(2.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(9.)),
            ..default()
        },
        BackgroundColor(color.with_alpha(0.06)),
        BorderColor::all(color.with_alpha(0.25)),
    ))
    .with_children(|ui| text(ui, art, value, 11., color, false));
}

fn rank_row(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    catalog: &MenuCatalog,
    state: &MenuState,
    rank: u8,
    maximum: u8,
) {
    let selected = state.heroic_rank == rank;
    let available = rank <= maximum;
    let tint = rank_color(rank);
    let border = if selected {
        HIGHLIGHT
    } else if available {
        tint.with_alpha(0.35)
    } else {
        Color::srgb(0.169, 0.129, 0.071)
    };
    let mut row = ui.spawn((
        Button,
        Action::Heroic(rank),
        Face {
            selected,
            primary: false,
            disabled: !available,
        },
        crate::menu::NativeStaticFrame,
        Node {
            padding: UiRect::axes(Val::Px(12.), Val::Px(7.)),
            column_gap: Val::Px(14.),
            align_items: AlignItems::Center,
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(6.)),
            flex_shrink: 0.,
            ..default()
        },
        BorderColor::all(border),
        BackgroundColor(Color::NONE),
        BackgroundGradient::from(LinearGradient {
            angle: std::f32::consts::FRAC_PI_2,
            stops: vec![
                tint.with_alpha(if selected {
                    0.22
                } else if available {
                    0.10
                } else {
                    0.03
                })
                .into(),
                Color::srgba(0., 0., 0., if selected { 0.25 } else { 0.40 }).into(),
            ],
            ..default()
        }),
    ));
    if available {
        row.insert(crate::hover::NativeHover::new(border, HIGHLIGHT, 0.));
    }
    row.with_children(|ui| {
        ui.spawn(Node {
            width: Val::Px(124.),
            flex_shrink: 0.,
            flex_direction: FlexDirection::Column,
            row_gap: Val::Px(4.),
            ..default()
        })
        .with_children(|title| {
            text(
                title,
                art,
                rank_name(rank, catalog),
                22.,
                if selected {
                    HIGHLIGHT
                } else if available {
                    tint
                } else {
                    MUTED
                },
                true,
            );
            title
                .spawn(Node {
                    column_gap: Val::Px(3.),
                    ..default()
                })
                .with_children(|bars| {
                    for index in 1..=heroic::MAX_RANK {
                        bars.spawn((
                            Node {
                                width: Val::Px(18.),
                                height: Val::Px(4.),
                                border_radius: BorderRadius::all(Val::Px(2.)),
                                ..default()
                            },
                            BackgroundColor(if index <= rank {
                                if available {
                                    tint
                                } else {
                                    MUTED.with_alpha(0.5)
                                }
                            } else {
                                Color::srgba(1., 1., 1., 0.08)
                            }),
                        ));
                    }
                });
        });
        ui.spawn(Node {
            flex_grow: 1.,
            flex_direction: FlexDirection::Column,
            row_gap: Val::Px(4.),
            ..default()
        })
        .with_children(|body| {
            body.spawn(Node {
                flex_wrap: FlexWrap::Wrap,
                column_gap: Val::Px(5.),
                row_gap: Val::Px(4.),
                ..default()
            })
            .with_children(|chips| {
                let color = if available { PAPER } else { MUTED };
                if rank == 0 {
                    chip(
                        chips,
                        art,
                        catalog.label("The zone as it is").to_owned(),
                        color,
                    );
                } else {
                    chip(
                        chips,
                        art,
                        catalog
                            .label("Health x{n}")
                            .replace("{n}", &number(heroic::health_multiplier(rank))),
                        color,
                    );
                    chip(
                        chips,
                        art,
                        catalog
                            .label("Damage x{n}")
                            .replace("{n}", &number(heroic::damage_multiplier(rank))),
                        color,
                    );
                }
                chip(
                    chips,
                    art,
                    catalog
                        .label("Marks x{n}")
                        .replace("{n}", &number(heroic::marks_multiplier(rank))),
                    color,
                );
                if rank != 0 {
                    chip(
                        chips,
                        art,
                        catalog
                            .label("Loot and talent experience x{n}")
                            .replace("{n}", &number(heroic::reward_multiplier(rank))),
                        color,
                    );
                }
            });
            if !available {
                let zone = catalog.label(&catalog.zones[state.zone].name);
                // A later-zone clear does not establish this exact class/zone
                // Normal clear. The shared admission helper returns zero here.
                let reason = if maximum == 0 {
                    catalog
                        .label("Beat {zone} on normal with this class to open Heroic.")
                        .replace("{zone}", zone)
                } else {
                    catalog
                        .label("Beat {heroic} here with any class to open it.")
                        .replace("{heroic}", &rank_name(rank - 1, catalog))
                };
                text(body, art, reason, 12., MUTED, false);
            } else if let Some(descriptor) = heroic::descriptor(rank) {
                for description in descriptor.twists {
                    body.spawn(Node {
                        column_gap: Val::Px(7.),
                        align_items: AlignItems::Center,
                        ..default()
                    })
                    .with_children(|line| {
                        line.spawn((
                            Node {
                                width: Val::Px(6.),
                                height: Val::Px(6.),
                                flex_shrink: 0.,
                                border_radius: BorderRadius::all(Val::Px(1.)),
                                ..default()
                            },
                            BackgroundColor(tint),
                        ));
                        text(line, art, catalog.label(description), 12., PAPER, false);
                    });
                }
            }
        });
        ui.spawn((
            Node {
                width: Val::Px(16.),
                height: Val::Px(16.),
                flex_shrink: 0.,
                border: UiRect::all(Val::Px(1.5)),
                border_radius: BorderRadius::MAX,
                align_items: AlignItems::Center,
                justify_content: JustifyContent::Center,
                ..default()
            },
            BorderColor::all(if selected {
                HIGHLIGHT
            } else if available {
                Color::srgb(0.427, 0.333, 0.145)
            } else {
                Color::srgb(0.169, 0.129, 0.071)
            }),
        ))
        .with_children(|radio| {
            if selected {
                radio.spawn((
                    Node {
                        width: Val::Px(8.),
                        height: Val::Px(8.),
                        border_radius: BorderRadius::MAX,
                        ..default()
                    },
                    BackgroundColor(HIGHLIGHT),
                ));
            }
        });
    });
}

// Current145ababa0/145ababe0 are the live name/description getters used by
//14014a3b0, with numeric IDs supplied by the shared Heroic selector.
const AFFIX_LABELS: [(&str, &str); 3] = [
    (
        "Bolstering",
        "A death makes the enemies near it tougher and stronger, stacking.",
    ),
    (
        "Sanguine",
        "A slain elite leaves a pool that heals enemies standing in it.",
    ),
    (
        "Explosive",
        "Orbs come out of the horde: only direct hits hurt them, so kill them before they burst.",
    ),
];

fn weekly_affixes(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    catalog: &MenuCatalog,
    selector: u64,
) {
    let mut seen = [false; 3];
    let mut rows = Vec::new();
    // Native140276f90 enumerates every displayed rank, retaining the first
    // rank at which each weekly affix appears, independently of selected rank.
    for rank in 1..=heroic::MAX_RANK {
        for id in heroic::affix_ids(rank, selector) {
            if !seen[usize::from(id)] {
                seen[usize::from(id)] = true;
                rows.push((id, rank));
            }
        }
    }
    if rows.is_empty() {
        return;
    }
    ui.spawn((
        Node {
            padding: UiRect::axes(Val::Px(12.), Val::Px(8.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(6.)),
            flex_direction: FlexDirection::Column,
            row_gap: Val::Px(5.),
            ..default()
        },
        BackgroundColor(Color::srgba(0., 0., 0., 0.35)),
        BorderColor::all(Color::srgb(0.169, 0.129, 0.071)),
    ))
    .with_children(|body| {
        text(
            body,
            art,
            catalog.label("This week's affixes"),
            17.,
            GOLD,
            false,
        );
        for (id, first_rank) in rows {
            let (name, description) = AFFIX_LABELS[usize::from(id)];
            body.spawn(Node {
                column_gap: Val::Px(10.),
                align_items: AlignItems::Center,
                ..default()
            })
            .with_children(|line| {
                line.spawn(Node {
                    width: Val::Px(124.),
                    flex_shrink: 0.,
                    ..default()
                })
                .with_children(|label| {
                    text(
                        label,
                        art,
                        catalog.label(name),
                        13.,
                        rank_color(first_rank),
                        false,
                    )
                });
                text(line, art, catalog.label(description), 12., PAPER, false);
                line.spawn(Node {
                    flex_grow: 1.,
                    ..default()
                });
                text(
                    line,
                    art,
                    catalog
                        .label("from {heroic}")
                        .replace("{heroic}", &rank_name(first_rank, catalog)),
                    11.,
                    MUTED,
                    false,
                );
            });
        }
    });
}

fn rebuild(
    mut commands: Commands,
    state: Res<MenuState>,
    art: Res<MenuArt>,
    catalog: Res<MenuCatalog>,
    roots: Query<Entity, With<Root>>,
    mut previous: Local<Option<(usize, u8, u8, u64)>>,
) {
    let open = matches!(state.dialog, Some(Dialog::RunOptions | Dialog::CoopDifficulty));
    if !open {
        if previous.take().is_some() {
            for root in &roots {
                commands.entity(root).despawn();
            }
        }
        return;
    }
    let maximum = state.max_heroic_rank();
    let snapshot = (state.zone, state.heroic_rank, maximum, state.save_revision);
    if *previous == Some(snapshot) && !art.is_changed() && !catalog.is_changed() {
        return;
    }
    *previous = Some(snapshot);
    for root in &roots {
        commands.entity(root).despawn();
    }
    commands.spawn((
        Root,
        Node {
            position_type: PositionType::Absolute,
            width: Val::Percent(100.),
            height: Val::Percent(100.),
            ..default()
        },
        BackgroundColor(Color::srgba(0., 0., 0., 0.68)),
        GlobalZIndex(100),
        Interaction::None,
        FocusPolicy::Block,
    ));
    commands
        .spawn((
            Root,
            NativeCanvas {
                design: Vec2::new(860., 700.),
                max_scale: 1.4,
            },
            Node {
                position_type: PositionType::Absolute,
                width: Val::Px(860.),
                height: Val::Px(700.),
                ..default()
            },
            GlobalZIndex(101),
        ))
        .with_children(|canvas| {
            canvas
                .spawn((
                    Node {
                        width: Val::Percent(100.),
                        height: Val::Percent(100.),
                        flex_direction: FlexDirection::Column,
                        align_items: AlignItems::Stretch,
                        padding: UiRect::axes(Val::Px(28.), Val::Px(18.)),
                        row_gap: Val::Px(7.),
                        border: UiRect::all(Val::Px(1.)),
                        border_radius: BorderRadius::all(Val::Px(10.)),
                        ..default()
                    },
                    BackgroundGradient::from(LinearGradient {
                        angle: std::f32::consts::PI,
                        stops: vec![
                            Color::linear_rgba(0.078, 0.059, 0.035, 0.90).into(),
                            Color::linear_rgba(0.031, 0.024, 0.016, 0.93).into(),
                        ],
                        ..default()
                    }),
                    BorderColor::all(Color::srgb(0.427, 0.333, 0.145)),
                    BoxShadow::new(
                        Color::srgba(0., 0., 0., 0.6),
                        Val::Px(0.),
                        Val::Px(14.),
                        Val::Px(0.),
                        Val::Px(40.),
                    ),
                ))
                .with_children(|body| {
                    let zone = catalog.label(&catalog.zones[state.zone].name);
                    body.spawn(Node {
                        flex_direction: FlexDirection::Column,
                        align_items: AlignItems::Center,
                        row_gap: Val::Px(2.),
                        ..default()
                    })
                    .with_children(|header| {
                        text(
                            header,
                            &art,
                            catalog.label("Difficulty"),
                            34.,
                            HIGHLIGHT,
                            true,
                        );
                        text(header, &art, zone, 15., MUTED, false);
                    });
                    rule(body);
                    text(
                        body,
                        &art,
                        catalog.label(HELP).replace("{zone}", zone),
                        12.,
                        MUTED,
                        false,
                    );
                    for rank in 0..=heroic::MAX_RANK {
                        rank_row(body, &art, &catalog, &state, rank, maximum);
                    }
                    weekly_affixes(
                        body,
                        &art,
                        &catalog,
                        heroic::zone_selector(
                            &catalog.zones[state.zone].key,
                            heroic::current_week(),
                        ),
                    );
                    body.spawn(Node {
                        flex_grow: 1.,
                        ..default()
                    });
                    body.spawn(Node {
                        justify_content: JustifyContent::Center,
                        ..default()
                    })
                    .with_children(|footer| {
                        button(footer, &art, catalog.label("Done"), Action::Close, 16.)
                    });
                });
        });
}
