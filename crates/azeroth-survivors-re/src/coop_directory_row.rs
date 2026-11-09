//! Public directory rows and host-title hover text.
//! The 0.141.0 directory card and its data sources are traced in
//! docs/analysis/native-interface-correspondence-0.141.0.md.
use crate::{
    assets::MenuArt, coop_ui::LobbyRow, hover::NativeHover, localization::Localization, menu,
};
use bevy::{prelude::*, ui::FocusPolicy};

#[derive(Component)]
struct HostTitle;
#[derive(Component)]
struct HostTitleTooltip;

pub(crate) struct DirectoryRowPlugin;
impl Plugin for DirectoryRowPlugin {
    fn build(&self, app: &mut App) {
        app.add_systems(Update, show_host_title);
    }
}

fn show_host_title(
    sources: Query<(&Interaction, &Children), With<HostTitle>>,
    mut tooltips: Query<&mut Node, With<HostTitleTooltip>>,
) {
    for (interaction, children) in &sources {
        for child in children {
            if let Ok(mut node) = tooltips.get_mut(*child) {
                let display = if *interaction == Interaction::None {
                    Display::None
                } else {
                    Display::Flex
                };
                if node.display != display {
                    node.display = display;
                }
            }
        }
    }
}

pub(crate) fn frame(row: &LobbyRow) -> (Node, BorderColor, NativeHover, UiTransform) {
    let titled = !row.host_title.is_empty();
    let resting = if titled {
        Color::srgb(0.56, 0.27, 0.98)
    } else {
        Color::srgb(0.427, 0.333, 0.145)
    };
    let active = if !row.unlocked {
        resting
    } else if titled {
        Color::srgb(0.86, 0.66, 1.)
    } else {
        Color::srgb(0.973, 0.824, 0.416)
    };
    (
        Node {
            flex_shrink: 0.,
            column_gap: Val::Px(14.),
            align_items: AlignItems::Center,
            padding: UiRect::axes(Val::Px(12.), Val::Px(9.)),
            border: UiRect::all(Val::Px(if titled { 2. } else { 1. })),
            border_radius: BorderRadius::all(Val::Px(6.)),
            ..default()
        },
        BorderColor::all(resting),
        NativeHover::new(resting, active, if row.unlocked { 1. } else { 0. }),
        UiTransform::default(),
    )
}

fn label(locale: &Localization, key: &str) -> String {
    locale.lookup(key).unwrap_or(key).to_owned()
}

fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    color: Color,
) {
    ui.spawn((
        Text::new(value.into()),
        TextFont {
            font: art.font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        menu::native_text_shadow(),
    ));
}

/// The current staff-name wrapper shares the directory's retained title hover
/// interface. Return its actual name Text, independently of the13px tooltip.
pub(crate) fn titled_text(ui: &mut ChildSpawnerCommands, art: &MenuArt, subtitle: String,
    title: &str, size: f32) -> Entity {
    let mut name = Entity::PLACEHOLDER;
    ui.spawn((
        Node::default(),
        Interaction::None,
        FocusPolicy::Pass,
        HostTitle,
    ))
    .with_children(|ui| {
        name = ui.spawn((Text::new(subtitle), TextFont { font: art.font.clone(),
            font_size: size, ..default() }, TextColor(Color::srgb(0.56, 0.27, 0.98)),
            menu::native_text_shadow())).id();
        ui.spawn((
            HostTitleTooltip,
            Node {
                display: Display::None,
                position_type: PositionType::Absolute,
                left: Val::Px(0.),
                bottom: Val::Percent(100.),
                margin: UiRect::bottom(Val::Px(4.)),
                padding: UiRect::axes(Val::Px(8.), Val::Px(3.)),
                border: UiRect::all(Val::Px(1.)),
                border_radius: BorderRadius::all(Val::Px(4.)),
                ..default()
            },
            GlobalZIndex(9000),
            FocusPolicy::Pass,
            BackgroundColor(Color::srgba(0.06, 0.02, 0.12, 0.95)),
            BorderColor::all(Color::srgb(0.56, 0.27, 0.98)),
        ))
        .with_children(|ui| text(ui, art, title, 13., Color::srgb(0.86, 0.66, 1.)));
    });
    name
}

/// The directory and Host card use the same difficulty badge.
pub(crate) fn difficulty_pill(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: String,
    heroic: bool,
    size: f32,
) {
    let (edge, caption, fill) = if heroic {
        (
            Color::srgb(1., 0.353, 0.235),
            Color::srgb(1., 0.78, 0.66),
            Color::srgba(0.32, 0.03, 0.02, 0.85),
        )
    } else {
        (menu::EDGE, menu::GOLD, Color::srgba(0., 0., 0., 0.35))
    };
    ui.spawn((
        Node {
            padding: UiRect::axes(Val::Px(8.), Val::Px(2.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(10.)),
            ..default()
        },
        BorderColor::all(edge),
        BackgroundColor(fill),
    ))
    .with_children(|pill| text(pill, art, value, size, caption));
}

fn badge(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    rgb: (f32, f32, f32),
    alpha: f32,
) {
    let (r, g, b) = rgb;
    ui.spawn((
        Node {
            padding: UiRect::axes(Val::Px(6.), Val::Px(1.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(3.)),
            flex_shrink: 0.,
            ..default()
        },
        BorderColor::all(Color::srgba(r, g, b, 0.6)),
    ))
    .with_children(|badge| text(badge, art, value, 11., Color::srgba(r, g, b, alpha)));
}

fn class_icon(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    class: &str,
    leading: bool,
    alpha: f32,
) {
    if let Some(image) = art.icons.get(class) {
        let size = if leading { 40. } else { 18. };
        let mut node = Node {
            width: Val::Px(size),
            height: Val::Px(size),
            flex_shrink: 0.,
            ..default()
        };
        if leading {
            node.border = UiRect::all(Val::Px(1.));
            node.border_radius = BorderRadius::all(Val::Px(4.));
        }
        let mut icon = ui.spawn((
            ImageNode {
                color: Color::srgba(1., 1., 1., alpha),
                ..ImageNode::new(image.clone())
            },
            node,
        ));
        if leading {
            icon.insert(BorderColor::all(Color::srgb(0.169, 0.129, 0.071)));
        }
    }
}

/// Spawn content inside the caller's directory-row button; `frame` supplies its
/// target constructor's border, layout and hover settings independently.
pub(crate) fn spawn(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    locale: &Localization,
    row: &LobbyRow,
) {
    let alpha = if row.unlocked { 1. } else { 0.45 };
    let host_class = row.classes.first().map_or("warrior", String::as_str);
    class_icon(ui, art, host_class, true, alpha);

    ui.spawn(Node {
        flex_grow: 1.,
        flex_direction: FlexDirection::Column,
        row_gap: Val::Px(2.),
        ..default()
    })
    .with_children(|ui| {
        ui.spawn(Node {
            column_gap: Val::Px(8.),
            align_items: AlignItems::Center,
            ..default()
        })
        .with_children(|title| {
            text(title, art, &row.name, 17., Color::srgba(0.949, 0.902, 0.788, alpha));
            if row.has_password {
                badge(title, art, label(locale, "Password"), (0.69, 0.541, 0.227), alpha);
            }
            if !row.country.is_empty() {
                badge(title, art, &row.country, (0.725, 0.663, 0.510), alpha);
            }
        });
        if !row.description.is_empty() {
            text(
                ui,
                art,
                &row.description,
                13.,
                Color::srgba(0.69, 0.541, 0.227, alpha),
            );
        }
        let subtitle = format!("{} · {}", row.host, row.hero_class);
        if row.host_title.is_empty() {
            text(ui, art, subtitle, 12., Color::srgba(0.725, 0.663, 0.510, alpha));
        } else {
            titled_text(ui, art, subtitle, &row.host_title, 12.);
        }
        if !row.unlocked {
            let explanation = if row.lacks == "hyper" {
                label(locale, "You haven't opened Hyper Mode yet.")
            } else if row.lacks == "heroic" {
                label(locale, "You haven't opened {difficulty} of {zone} with this class yet.")
                    .replace("{difficulty}", &row.difficulty).replace("{zone}", &row.zone)
            } else {
                label(locale, "You haven't unlocked {zone} with this class yet.")
                    .replace("{zone}", &row.zone)
            };
            text(
                ui,
                art,
                explanation,
                12.,
                Color::srgb(1., 0.353, 0.235),
            );
        }
    });
    ui.spawn(Node {
        flex_direction: FlexDirection::Column,
        align_items: AlignItems::FlexEnd,
        row_gap: Val::Px(4.),
        flex_shrink: 0.,
        ..default()
    })
    .with_children(|zone| {
        text(zone, art, &row.zone, 14., Color::srgba(0.973, 0.824, 0.416, alpha));
        if row.heroic_rank >= 0 {
            difficulty_pill(zone, art, row.difficulty.clone(), row.heroic_rank as u8 != 0, 12.);
        }
    });
    ui.spawn(Node {
        min_width: Val::Px(84.),
        flex_direction: FlexDirection::Column,
        align_items: AlignItems::Center,
        row_gap: Val::Px(5.),
        flex_shrink: 0.,
        ..default()
    })
    .with_children(|players| {
        players.spawn(Node {
            column_gap: Val::Px(3.),
            align_items: AlignItems::Center,
            ..default()
        })
        .with_children(|members| {
            for class in &row.classes {
                class_icon(members, art, class, false, 1.);
            }
            text(
                members,
                art,
                format!("{}/{}", row.joined, row.capacity),
                18.,
                Color::srgba(0.973, 0.824, 0.416, alpha),
            );
        });
        players.spawn(Node {
            column_gap: Val::Px(4.),
            align_items: AlignItems::Center,
            ..default()
        })
        .with_children(|dots| {
            for slot in 0..row.capacity.clamp(1, 5) {
                let (edge, fill) = if slot < row.joined {
                    let gold = Color::srgba(0.973, 0.824, 0.416, alpha);
                    (gold, gold)
                } else {
                    (Color::srgba(0.69, 0.541, 0.227, alpha), Color::NONE)
                };
                dots.spawn((
                    Node {
                        width: Val::Px(8.),
                        height: Val::Px(8.),
                        border: UiRect::all(Val::Px(1.)),
                        border_radius: BorderRadius::all(Val::Px(4.)),
                        ..default()
                    },
                    BorderColor::all(edge),
                    BackgroundColor(fill),
                ));
            }
        });
    });
}
