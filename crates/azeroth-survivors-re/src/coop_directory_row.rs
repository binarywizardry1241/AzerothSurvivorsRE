//! Public directory rows and host-title hover text.
//! Current difficulty/lock reasons: docs/analysis/coop-lobby-ui-0.123.0.md;
//! retained base row/tooltip construction: docs/analysis/coop-directory-0.115.0.md.
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
            padding: UiRect::axes(Val::Px(12.), Val::Px(6.)),
            border: UiRect::all(Val::Px(if titled { 2. } else { 1. })),
            border_radius: BorderRadius::all(Val::Px(4.)),
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

/// Spawn content inside the caller's directory-row button; `frame` supplies its
/// target constructor's border, layout and hover settings independently.
pub(crate) fn spawn(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    locale: &Localization,
    row: &LobbyRow,
) {
    let alpha = if row.unlocked { 1. } else { 0.45 };
    ui.spawn(Node {
        flex_grow: 1.,
        flex_direction: FlexDirection::Column,
        ..default()
    })
    .with_children(|ui| {
        let name = if row.has_password {
            format!("{} · {}", row.name, label(locale, "Password"))
        } else {
            row.name.clone()
        };
        text(ui, art, name, 17., Color::srgba(0.949, 0.902, 0.788, alpha));
        if !row.description.is_empty() {
            text(
                ui,
                art,
                &row.description,
                13.,
                Color::srgba(0.69, 0.541, 0.227, alpha),
            );
        }
        let subtitle = label(locale, "{hero} the {class} · {zone}")
            .replace("{hero}", &row.host)
            .replace("{class}", &row.hero_class)
            .replace("{zone}", &row.zone);
        ui.spawn(Node { align_items: AlignItems::Center, ..default() })
            .with_children(|ui| {
                if row.host_title.is_empty() {
                    text(ui, art, subtitle, 12., Color::srgba(0.725, 0.663, 0.510, alpha));
                } else {
                    titled_text(ui, art, subtitle, &row.host_title, 12.);
                }
                if !row.difficulty.is_empty() {
                    let color = if row.heroic_rank > 0 {
                        Color::srgba(1., 0.353, 0.235, alpha)
                    } else {
                        Color::srgba(0.725, 0.663, 0.510, alpha)
                    };
                    text(ui, art, format!(" · {}", row.difficulty), 12., color);
                }
            });
        if !row.unlocked {
            let explanation = if row.lacks == "heroic" {
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
        column_gap: Val::Px(3.),
        align_items: AlignItems::Center,
        ..default()
    })
    .with_children(|ui| {
        for class in &row.classes {
            if let Some(image) = art.icons.get(class) {
                ui.spawn((
                    ImageNode::new(image.clone()),
                    Node {
                        width: Val::Px(22.),
                        height: Val::Px(22.),
                        ..default()
                    },
                ));
            }
        }
        if !row.country.is_empty() {
            text(ui, art, &row.country, 13., Color::srgb(0.725, 0.663, 0.510));
        }
        ui.spawn((
            Text::new(format!("{}/{}", row.joined, row.capacity)),
            TextFont {
                font: art.heading_font.clone(),
                font_size: 20.,
                ..default()
            },
            TextColor(Color::srgba(0.973, 0.824, 0.416, alpha)),
            menu::native_text_shadow(),
        ));
    });
}
