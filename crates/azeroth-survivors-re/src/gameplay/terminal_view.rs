//! End summary hierarchy revalidated against the selected 0.109.0 executable.
//! Owners: root140287980, content140203a30, talent1400c4070/140253f10,
//! loot140285760/14020c180. Rendering parity remains unverified.

use bevy::prelude::*;

mod recap;
pub(super) use recap::{RecapModal, input as recap_input};

use crate::{
    assets::MenuArt,
    canvas::NativeCanvas,
    localization::Localization,
    menu::{self, GOLD, MUTED, PAPER},
    menu_state::MenuState,
};

use super::{
    RunSet,
    terminal::{
        Outcome, TalentSummary, TerminalAction, TerminalLoot, TerminalState, TerminalSummary,
    },
};

#[derive(Default)]
struct Rendered {
    root: Option<Entity>,
    identity: Option<u64>,
    language: String,
}

#[derive(Resource, Default)]
struct XpClock {
    born: f32,
    before: u32,
    gained: u32,
    parts: usize,
    class_name: String,
    last_points: u32,
    pop_at: Option<f32>,
}

#[derive(Component)]
enum XpText {
    Counter,
    Part { index: usize, color: Color },
    Bar,
    Points,
    Pop,
}

#[derive(Component)]
struct XpFill;

#[derive(Component)]
struct XpFlash;

pub(super) fn install(app: &mut App) {
    app.add_systems(
        Update,
        super::terminal::capture_pointer
            .in_set(benilla_app::local_client::LocalClientSet::OverlayCapture),
    );
    app.init_resource::<XpClock>()
        .init_resource::<RecapModal>()
        .add_systems(Update, (render, animate_xp).chain().in_set(RunSet::Present))
        .add_systems(Update, recap::render.in_set(RunSet::Present));
}

fn render(
    mut commands: Commands,
    state: Res<TerminalState>,
    menu: Res<MenuState>,
    art: Res<MenuArt>,
    assets: Res<AssetServer>,
    locale: Res<Localization>,
    time: Res<Time>,
    mut clock: ResMut<XpClock>,
    mut rendered: Local<Rendered>,
) {
    let summary = state.summary.as_ref().filter(|_| menu.in_run);
    if summary.is_none() {
        if let Some(root) = rendered.root.take() {
            commands.entity(root).despawn();
        }
        rendered.identity = None;
        return;
    }
    if rendered.root.is_some()
        && rendered.identity == Some(state.identity)
        && rendered.language == locale.code()
    {
        return;
    }
    if let Some(root) = rendered.root.take() {
        commands.entity(root).despawn();
    }
    if let Some(talent) = summary.unwrap().talent.as_ref() {
        let before = talent
            .before
            .unwrap_or_else(|| talent.total.saturating_sub(talent.gained));
        *clock = XpClock {
            born: time.elapsed_secs(),
            before,
            gained: talent.gained,
            parts: talent.parts.iter().filter(|(_, xp)| *xp > 0).count(),
            class_name: talent.class_name.clone(),
            last_points: talent_budget(before).0,
            pop_at: None,
        };
    }
    rendered.root = Some(spawn(&mut commands, &art, &assets, &locale, summary.unwrap()));
    rendered.identity = Some(state.identity);
    rendered.language = locale.code().to_owned();
}

fn spawn(
    commands: &mut Commands,
    art: &MenuArt,
    assets: &AssetServer,
    locale: &Localization,
    summary: &TerminalSummary,
) -> Entity {
    // 14027762e..14027777a: fullscreen blocking root, black alpha .55, z6500.
    let root = commands
        .spawn((
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                ..default()
            },
            BackgroundColor(Color::srgba(0., 0., 0., 0.55)),
            GlobalZIndex(6500),
            Interaction::None,
            bevy::ui::FocusPolicy::Block,
        ))
        .id();
    // 1401af648..1401af788: design560x700, max1.3, centered children.
    let canvas = commands
        .spawn((
            Node {
                position_type: PositionType::Absolute,
                width: Val::Px(560.),
                height: Val::Px(700.),
                align_items: AlignItems::Center,
                justify_content: JustifyContent::Center,
                ..default()
            },
            NativeCanvas {
                design: Vec2::new(560., 700.),
                max_scale: 1.3,
            },
        ))
        .id();
    commands.entity(root).add_child(canvas);
    commands.entity(canvas).with_children(|ui| {
        menu::native_panel(
            ui,
            Node {
                flex_direction: FlexDirection::Column,
                align_items: AlignItems::Center,
                row_gap: Val::Px(10.),
                padding: UiRect::axes(Val::Px(30.), Val::Px(22.)),
                ..default()
            },
            |panel| content(panel, art, assets, locale, summary),
        );
    });
    root
}

fn content(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    assets: &AssetServer,
    locale: &Localization,
    summary: &TerminalSummary,
) {
    let (title, title_color) = match summary.outcome {
        Outcome::Victory => ("end.victory", Color::srgb(1., 0.604, 0.165)),
        Outcome::Defeat => ("end.fallen", Color::srgb(0.88, 0.23, 0.17)),
        Outcome::Left => ("end.left", Color::srgb(0.88, 0.23, 0.17)),
    };
    text(ui, art, locale.label(title), 46., title_color, true);
    text(
        ui,
        art,
        format!(
            "{}, {} {} · {}",
            summary.hero, summary.race_name, summary.class_name, summary.zone_name
        ),
        15.,
        PAPER,
        false,
    );
    if let Some(recap) = summary.recap.as_ref().filter(|_| summary.outcome == Outcome::Defeat) {
        recap::killer(ui, art, assets, locale, &recap.killer);
    }
    if let Some(zone) = &summary.unlocked_zone {
        text(
            ui,
            art,
            locale.label("end.zone_unlocked").replace("{zone}", zone),
            16.,
            Color::srgb(0.302, 1., 0.416),
            false,
        );
    }
    if let Some(talent) = &summary.talent {
        talent_summary(ui, art, locale, talent);
    }
    if !summary.loot.is_empty() {
        loot_summary(ui, art, locale, &summary.loot);
    }
    ui.spawn(Node {
        display: Display::Grid,
        grid_template_columns: RepeatedGridTrack::auto(2),
        column_gap: Val::Px(24.),
        row_gap: Val::Px(4.),
        margin: UiRect::axes(Val::Px(0.), Val::Px(10.)),
        ..default()
    })
    .with_children(|grid| {
        for (label, value) in [
            ("end.survived", survived(summary.time_seconds)),
            ("end.level", summary.level.to_string()),
            ("hud.kills", summary.kills.to_string()),
            ("end.elites", summary.elites.to_string()),
            ("end.guardians", summary.guardians.to_string()),
            ("end.bosses", summary.bosses.to_string()),
            ("end.damage_dealt", damage(summary.damage)),
            ("end.damage_taken", damage(summary.taken)),
            ("end.gold_earned", summary.gold.to_string()),
            ("end.caches_opened", summary.chests.to_string()),
        ] {
            text(grid, art, locale.label(label), 15., MUTED, false);
            text(grid, art, value, 15., GOLD, false);
        }
    });
    ui.spawn(Node {
        column_gap: Val::Px(12.),
        ..default()
    })
    .with_children(|buttons| {
        button(
            buttons,
            art,
            locale.label("end.again"),
            TerminalAction::Again,
        );
        if summary.outcome == Outcome::Victory {
            button(
                buttons,
                art,
                locale.label("end.endless"),
                TerminalAction::Endless,
            );
        }
        button(
            buttons,
            art,
            locale.label(if summary.return_to_main_menu {
                "menu.main_menu"
            } else {
                "menu.character_select"
            }),
            TerminalAction::Menu,
        );
        if summary.outcome == Outcome::Defeat && summary.recap.is_some() {
            recap::open_button(buttons, art, locale);
        }
    });
}

fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    color: Color,
    heading: bool,
) -> Entity {
    ui.spawn((
        Text::new(value.into()),
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
    ))
    .id()
}

fn button(ui: &mut ChildSpawnerCommands, art: &MenuArt, label: &str, action: TerminalAction) {
    ui.spawn((
        // Current native bundle has Interaction directly, without a Button
        // marker or the picker's Hover component. Focus still observes this
        // Interaction through the ordinary UI node path.
        Interaction::None,
        action,
        Node {
            padding: UiRect::axes(Val::Px(22.), Val::Px(10.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(4.)),
            ..default()
        },
        menu::native_button_gradient(),
        BorderColor::all(menu::BUTTON_EDGE),
        BoxShadow::new(
            Color::srgba(0., 0., 0., 0.85),
            Val::Px(0.),
            Val::Px(2.),
            Val::Px(0.),
            Val::Px(6.),
        ),
    ))
    .with_children(|child| {
        text(child, art, label, 17., GOLD, false);
    });
}

fn survived(seconds: f64) -> String {
    let seconds = seconds.max(0.) as u64;
    format!("{}:{:02}", seconds / 60, seconds % 60)
}

fn damage(value: f64) -> String {
    // Current helper140285c50 rounds before converting to saturating u64 and
    // inserts a comma before each remaining group of three decimal digits.
    let raw = (value.round() as u64).to_string();
    let mut grouped = String::with_capacity(raw.len() + raw.len() / 3);
    for (index, digit) in raw.chars().enumerate() {
        if index != 0 && (raw.len() - index) % 3 == 0 {
            grouped.push(',');
        }
        grouped.push(digit);
    }
    grouped
}

fn talent_summary(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    locale: &Localization,
    talent: &TalentSummary,
) {
    let before = talent
        .before
        .unwrap_or_else(|| talent.total.saturating_sub(talent.gained));
    let (points, into, next) = talent_budget(before);
    let cyan = Color::srgb(0.443, 0.835, 1.);
    ui.spawn((
        Node {
            width: Val::Px(420.),
            flex_direction: FlexDirection::Column,
            padding: UiRect::axes(Val::Px(14.), Val::Px(10.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(6.)),
            row_gap: Val::Px(5.),
            ..default()
        },
        BorderColor::all(cyan.with_alpha(0.45)),
        BackgroundColor(Color::srgba(0.03, 0.08, 0.14, 0.75)),
    ))
    .with_children(|panel| {
        panel
            .spawn(Node {
                align_items: AlignItems::Center,
                justify_content: JustifyContent::SpaceBetween,
                ..default()
            })
            .with_children(|row| {
                text(
                    row,
                    art,
                    locale.label("Talent experience"),
                    15.,
                    cyan,
                    false,
                );
                let counter = text(row, art, "+0", 26., Color::srgb(0.8, 0.95, 1.), true);
                row.commands().entity(counter).insert(XpText::Counter);
            });
        panel
            .spawn(Node {
                display: Display::Grid,
                grid_template_columns: vec![GridTrack::flex(1.), GridTrack::auto()],
                row_gap: Val::Px(2.),
                ..default()
            })
            .with_children(|parts| {
                // Current14012a2e0 clamps to u32 and filters zero, including negatives.
                for (index, (name, xp)) in talent.parts.iter().filter(|(_, xp)| *xp > 0).enumerate()
                {
                    for (value, color) in [
                        (locale.label(name).to_owned(), MUTED),
                        (format!("+{}", (*xp).min(i64::from(u32::MAX))), cyan),
                    ] {
                        let entity = text(parts, art, value, 13., color.with_alpha(0.), false);
                        parts
                            .commands()
                            .entity(entity)
                            .insert((XpText::Part { index, color }, UiTransform::default()));
                    }
                }
            });
        panel
            .spawn((
                Node {
                    height: Val::Px(14.),
                    margin: UiRect::top(Val::Px(4.)),
                    border: UiRect::all(Val::Px(1.)),
                    border_radius: BorderRadius::all(Val::Px(3.)),
                    overflow: Overflow::clip(),
                    align_items: AlignItems::Center,
                    justify_content: JustifyContent::Center,
                    ..default()
                },
                BorderColor::all(cyan.with_alpha(0.35)),
                BackgroundColor(Color::srgba(0., 0., 0., 0.6)),
            ))
            .with_children(|bar| {
                bar.spawn((
                    XpFill,
                    Node {
                        position_type: PositionType::Absolute,
                        width: Val::Percent(if next == 0 {
                            100.
                        } else {
                            into as f32 * 100. / next as f32
                        }),
                        height: Val::Percent(100.),
                        ..default()
                    },
                    BackgroundGradient::from(LinearGradient {
                        angle: std::f32::consts::PI,
                        stops: vec![
                            Color::linear_rgba(0.45, 0.8, 1., 1.).into(),
                            Color::linear_rgba(0.13, 0.42, 0.75, 1.).into(),
                        ],
                        ..default()
                    }),
                ));
                bar.spawn((
                    XpFlash,
                    Node {
                        position_type: PositionType::Absolute,
                        width: Val::Percent(100.),
                        height: Val::Percent(100.),
                        ..default()
                    },
                    BackgroundColor(Color::srgba(1., 1., 1., 0.)),
                ));
                let value = text(bar, art, bar_text(locale, into, next), 10., PAPER, false);
                bar.commands().entity(value).insert(XpText::Bar);
            });
        panel
            .spawn(Node {
                align_items: AlignItems::Center,
                justify_content: JustifyContent::SpaceBetween,
                ..default()
            })
            .with_children(|row| {
                let value = text(
                    row,
                    art,
                    points_text(locale, &talent.class_name, points),
                    13.,
                    MUTED,
                    false,
                );
                row.commands().entity(value).insert(XpText::Points);
                let value = text(row, art, "", 14., GOLD.with_alpha(0.), false);
                row.commands()
                    .entity(value)
                    .insert((XpText::Pop, UiTransform::default()));
            });
    });
}

fn loot_summary(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    locale: &Localization,
    loot: &[TerminalLoot],
) {
    text(
        ui,
        art,
        locale.label("end.loot_new").replace(
            "{n}",
            &loot.iter().filter(|item| item.is_new).count().to_string(),
        ),
        13.,
        MUTED,
        false,
    );
    ui.spawn(Node {
        max_width: Val::Px(500.),
        flex_wrap: FlexWrap::Wrap,
        row_gap: Val::Px(6.),
        column_gap: Val::Px(10.),
        justify_content: JustifyContent::Center,
        ..default()
    })
    .with_children(|list| {
        for item in loot {
            let color = loot_color(item.rarity);
            list.spawn(Node {
                align_items: AlignItems::Center,
                column_gap: Val::Px(6.),
                ..default()
            })
            .with_children(|row| {
                let mut icon = row.spawn((
                    Node {
                        width: Val::Px(26.),
                        height: Val::Px(26.),
                        border: UiRect::all(Val::Px(1.)),
                        border_radius: BorderRadius::all(Val::Px(4.)),
                        ..default()
                    },
                    BorderColor::all(color),
                ));
                if let Some(image) = &item.icon {
                    icon.insert(ImageNode::new(image.clone()));
                }
                text(row, art, &item.name, 14., color, false);
                if item.is_new {
                    text(
                        row,
                        art,
                        format!("  {}", locale.label("end.new")),
                        11.,
                        Color::srgb(0.302, 1., 0.416),
                        false,
                    );
                }
            });
        }
    });
}

fn loot_color(rarity: usize) -> Color {
    // Current item-loop14020c180 selects rarity colors by native rarity minus one.
    match rarity {
        1 => Color::srgb(0.118, 1., 0.),
        2 => Color::srgb(0.231, 0.612, 1.),
        3 | 5 => Color::srgb(0.761, 0.486, 1.),
        4 => Color::srgb(1., 0.604, 0.165),
        _ => Color::srgb(0.91, 0.91, 0.91),
    }
}

fn talent_budget(xp: u32) -> (u32, u64, u32) {
    let (points, into, next) = crate::save::talents::budget(u64::from(xp));
    if points == crate::save::talents::MAX_POINTS {
        (points, 0, 0)
    } else {
        (points, into, next)
    }
}

fn bar_text(locale: &Localization, into: u64, next: u32) -> String {
    if next == 0 {
        locale.label("Every talent point earned").to_owned()
    } else {
        format!("{into} / {next}")
    }
}

fn points_text(locale: &Localization, class: &str, points: u32) -> String {
    locale
        .label("{class} talent points: {points} / {max}")
        .replace("{class}", class)
        .replace("{points}", &points.to_string())
        .replace("{max}", &crate::save::talents::MAX_POINTS.to_string())
}

// Preserve the current updater's subtract/add cancellation and f32 rounding.
fn cubic_tail(remaining: f32) -> f32 {
    (remaining * remaining * remaining - 1.) + 1.
}

fn animate_xp(
    time: Res<Time>,
    locale: Res<Localization>,
    mut clock: ResMut<XpClock>,
    mut labels: Query<(&XpText, &mut Text, &mut TextColor, Option<&mut UiTransform>)>,
    mut fills: Query<&mut Node, With<XpFill>>,
    mut flashes: Query<&mut BackgroundColor, With<XpFlash>>,
) {
    if labels.is_empty() {
        return;
    }
    let now = time.elapsed_secs();
    let age = now - clock.born;
    let initial_points = talent_budget(clock.before).0;
    // Current1400cf1d7/2fd use wrapping u32 sums, including saved XP near MAX.
    let after_points = talent_budget(clock.before.wrapping_add(clock.gained)).0;
    let duration = (0.9 + after_points.wrapping_sub(initial_points) as f32 * 0.45).min(3.2);
    let progress = ((age - (clock.parts as f32 * 0.22 + 0.35 + 0.2)) / duration).clamp(0., 1.);
    let remaining = 1. - progress;
    let counted = (clock.gained as f32 * (1. - remaining * remaining * remaining)).round() as u32;
    let (points, into, next) = talent_budget(clock.before.wrapping_add(counted));
    if clock.last_points < points {
        clock.last_points = points;
        clock.pop_at = Some(now);
    }
    let pop_age = clock.pop_at.map(|born| now - born);
    for (kind, mut value, mut color, transform) in &mut labels {
        match kind {
            XpText::Counter => value.0 = format!("+{counted}"),
            XpText::Part { index, color: base } => {
                let progress = ((age - 0.35 - *index as f32 * 0.22) * 4.).clamp(0., 1.);
                color.0 = base.with_alpha(progress);
                if let Some(mut transform) = transform {
                    let remaining = 1. - progress;
                    transform.translation = Val2::px(12. * cubic_tail(remaining), 0.);
                }
            }
            XpText::Bar => value.0 = bar_text(&locale, into, next),
            XpText::Points => value.0 = points_text(&locale, &clock.class_name, points),
            XpText::Pop => {
                if let Some(age) = pop_age {
                    let gained = points.wrapping_sub(initial_points);
                    value.0 = if gained == 1 {
                        locale.label("+1 talent point!").to_owned()
                    } else {
                        locale
                            .label("+{n} talent points!")
                            .replace("{n}", &gained.to_string())
                    };
                    color.0 = GOLD.with_alpha((age / 0.12).min(1.));
                    if let Some(mut transform) = transform {
                        let remaining = 1. - (age / 0.35).clamp(0., 1.);
                        transform.scale = Vec2::splat(1. + cubic_tail(remaining) * 0.6);
                    }
                }
            }
        }
    }
    for mut node in &mut fills {
        node.width = Val::Percent(
            if next == 0 || pop_age.is_some_and(|age| age < 0.15 && into * 4 < u64::from(next)) {
                100.
            } else {
                into as f32 * 100. / next as f32
            },
        );
    }
    for mut color in &mut flashes {
        color.0 = Color::srgba(
            1.,
            1.,
            1.,
            pop_age.map_or(0., |age| (1. - age / 0.45).max(0.) * 0.6),
        );
    }
}
