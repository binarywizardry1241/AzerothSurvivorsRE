//! Death Recap presentation. 0.139.2 owners include 0x1402ecd50 (generation and
//! admission), 0x140371760 (canvas), and 0x1402bfdd0 (modal contents).

use benilla_app::local_client::LocalClientInput;
use bevy::prelude::*;

use super::{damage, text};
use crate::gameplay::death_recap::{DamageSource, DeathRecap, HitGroup, KillingBlow, SourceGroup};
use crate::{
    assets::MenuArt,
    canvas::NativeCanvas,
    gameplay::terminal::{Outcome, TerminalState},
    localization::Localization,
    menu::{self, GOLD, MUTED, PAPER},
    menu_state::MenuState,
};

const TITLE: &str = "Death Recap";
const DAMAGE_COLOR: Color = Color::srgb(1., 0.36, 0.30);
const AVOIDABLE_COLOR: Color = Color::srgb(1., 0.82, 0.);

#[derive(Component, Clone, Copy, PartialEq, Eq)]
pub(in crate::gameplay) enum Action {
    Open,
    Close,
}

#[derive(Resource, Default)]
pub(in crate::gameplay) struct RecapModal {
    generation: Option<u64>,
    // Keep the action layer blocked for the input pass that dismisses the
    // modal. Its backdrop is still present until the presentation pass.
    blocks_terminal: bool,
}

impl RecapModal {
    pub(in crate::gameplay) fn blocks_terminal(&self) -> bool {
        self.blocks_terminal
    }
}

fn active_recap<'a>(state: &'a TerminalState, menu: &MenuState) -> Option<&'a DeathRecap> {
    state
        .summary
        .as_ref()
        .filter(|summary| menu.in_run && summary.outcome == Outcome::Defeat)?
        .recap
        .as_ref()
}

pub(in crate::gameplay) fn input(
    state: Res<TerminalState>,
    menu: Res<MenuState>,
    mut modal: ResMut<RecapModal>,
    mut input: ResMut<LocalClientInput>,
    clicks: Query<(&Interaction, &Action), Changed<Interaction>>,
) {
    modal.blocks_terminal = false;
    if active_recap(&state, &menu).is_none() {
        modal.generation = None;
        return;
    }
    if modal
        .generation
        .is_some_and(|generation| generation != state.identity)
    {
        modal.generation = None;
        return;
    }
    let pressed = |action| {
        clicks.iter().any(|(interaction, candidate)| {
            *interaction == Interaction::Pressed && *candidate == action
        })
    };
    if modal.generation.is_some() {
        modal.blocks_terminal = true;
        let escape =
            !input.keyboard_captured && std::mem::take(&mut input.custom_game_menu_requested);
        if escape || pressed(Action::Close) {
            modal.generation = None;
        }
    } else if pressed(Action::Open) {
        modal.generation = Some(state.identity);
        modal.blocks_terminal = true;
    }
}

pub(super) fn open_button(ui: &mut ChildSpawnerCommands, art: &MenuArt, locale: &Localization) {
    button(
        ui,
        art,
        locale.label(TITLE),
        Action::Open,
        Vec2::new(10., 8.),
        17.,
    );
}

fn button(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    label: &str,
    action: Action,
    padding: Vec2,
    font_size: f32,
) {
    ui.spawn((
        Interaction::None,
        action,
        Node {
            padding: UiRect::axes(Val::Px(padding.x), Val::Px(padding.y)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(4.)),
            ..default()
        },
        menu::native_button_gradient(),
        BorderColor::all(menu::BUTTON_EDGE),
        BoxShadow::new(
            Color::BLACK.with_alpha(0.85),
            Val::Px(0.),
            Val::Px(2.),
            Val::Px(0.),
            Val::Px(6.),
        ),
    ))
    .with_children(|child| {
        text(child, art, label, font_size, GOLD, false);
    });
}

#[derive(Default)]
pub(super) struct RenderedModal {
    root: Option<Entity>,
    generation: Option<u64>,
    language: String,
}

pub(super) fn render(
    mut commands: Commands,
    state: Res<TerminalState>,
    menu: Res<MenuState>,
    modal: Res<RecapModal>,
    art: Res<MenuArt>,
    assets: Res<AssetServer>,
    locale: Res<Localization>,
    mut rendered: Local<RenderedModal>,
) {
    let recap = active_recap(&state, &menu).filter(|_| modal.generation == Some(state.identity));
    let generation = recap.map(|_| state.identity);
    if rendered.generation == generation && rendered.language == locale.code() {
        return;
    }
    if let Some(root) = rendered.root.take() {
        commands.entity(root).despawn();
    }
    rendered.generation = generation;
    rendered.language = locale.code().to_owned();
    if let Some(recap) = recap {
        rendered.root = Some(spawn(&mut commands, &art, &assets, &locale, recap));
    }
}

fn spawn(
    commands: &mut Commands,
    art: &MenuArt,
    assets: &AssetServer,
    locale: &Localization,
    recap: &DeathRecap,
) -> Entity {
    commands
        .spawn((
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                ..default()
            },
            BackgroundColor(Color::BLACK.with_alpha(0.78)),
            GlobalZIndex(6600),
            Interaction::None,
            bevy::ui::FocusPolicy::Block,
        ))
        .with_children(|root| {
            root.spawn((
                NativeCanvas {
                    design: Vec2::new(620., 700.),
                    max_scale: 1.3,
                },
                Node {
                    position_type: PositionType::Absolute,
                    width: Val::Px(620.),
                    height: Val::Px(700.),
                    align_items: AlignItems::Center,
                    justify_content: JustifyContent::Center,
                    ..default()
                },
            ))
            .with_children(|canvas| {
                menu::native_panel(
                    canvas,
                    Node {
                        width: Val::Px(604.),
                        flex_direction: FlexDirection::Column,
                        align_items: AlignItems::Center,
                        padding: UiRect::axes(Val::Px(22.), Val::Px(18.)),
                        row_gap: Val::Px(8.),
                        ..default()
                    },
                    |panel| content(panel, art, assets, locale, recap),
                );
            });
        })
        .id()
}

fn content(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    assets: &AssetServer,
    locale: &Localization,
    recap: &DeathRecap,
) {
    text(
        ui,
        art,
        locale.label(TITLE),
        38.,
        Color::srgb(0.88, 0.23, 0.17),
        true,
    );
    let mut subtitle = locale
        .label("{n} damage taken in the last {secs} seconds")
        .replace("{n}", &damage(f64::from(recap.total)))
        .replace("{secs}", &format!("{:.1}", recap.secs));
    if recap.absorbed >= 1. {
        subtitle.push_str("  ·  ");
        subtitle.push_str(&absorbed(locale, recap.absorbed));
    }
    text(ui, art, subtitle, 13., MUTED, false);

    section(ui, art, locale.label("Final Blows"), |list| {
        for (index, hit) in recap.hits.iter().enumerate() {
            hit_row(
                list,
                art,
                assets,
                locale,
                hit,
                index + 1 == recap.hits.len(),
            );
        }
    });
    if !recap.by.is_empty() {
        section(ui, art, locale.label("Damage by Source"), |list| {
            let total = f64::from(recap.total).max(1.);
            let largest = recap
                .by
                .iter()
                .map(|source| f64::from(source.n))
                .fold(1., f64::max);
            for source in &recap.by {
                source_row(list, art, assets, source, total, largest);
            }
        });
    }
    if recap.total >= 1. && recap.avoidable >= 1. {
        let share = (f64::from(recap.avoidable) / f64::from(recap.total) * 100.)
            .round()
            .clamp(1., 100.);
        text(
            ui,
            art,
            locale
                .label("{pct}% of it came from mechanics you could have stepped out of.")
                .replace("{pct}", &format!("{share:.0}")),
            13.,
            AVOIDABLE_COLOR,
            false,
        );
    }
    button(
        ui,
        art,
        locale.label("Close"),
        Action::Close,
        Vec2::new(26., 9.),
        16.,
    );
}

fn section(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    title: &str,
    build: impl FnOnce(&mut ChildSpawnerCommands),
) {
    ui.spawn(Node {
        width: Val::Percent(100.),
        flex_direction: FlexDirection::Column,
        row_gap: Val::Px(4.),
        ..default()
    })
    .with_children(|list| {
        text(list, art, title, 15., GOLD, false);
        build(list);
    });
}

pub(super) fn killer(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    assets: &AssetServer,
    locale: &Localization,
    blow: &KillingBlow,
) {
    ui.spawn((
        Node {
            width: Val::Percent(100.),
            align_items: AlignItems::Center,
            column_gap: Val::Px(14.),
            padding: UiRect::axes(Val::Px(14.), Val::Px(10.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(6.)),
            ..default()
        },
        BorderColor::all(Color::srgb(0.88, 0.23, 0.17).with_alpha(0.6)),
        BackgroundGradient::from(LinearGradient {
            angle: std::f32::consts::FRAC_PI_2,
            stops: vec![
                Color::srgba(0.35, 0.04, 0.03, 0.70).into(),
                Color::srgba(0.12, 0.02, 0.02, 0.40).into(),
            ],
            ..default()
        }),
    ))
    .with_children(|row| {
        icon(row, assets, &blow.source, 42.);
        row.spawn(Node {
            flex_direction: FlexDirection::Column,
            flex_grow: 1.,
            ..default()
        })
        .with_children(|labels| {
            text(labels, art, locale.label("Killed by"), 11., MUTED, false);
            text(labels, art, &blow.source.what, 17., PAPER, false);
            who(labels, art, locale, &blow.source, 13.);
        });
        row.spawn(Node {
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::End,
            ..default()
        })
        .with_children(|numbers| {
            text(
                numbers,
                art,
                damage(f64::from(blow.n)),
                26.,
                DAMAGE_COLOR,
                false,
            );
            if blow.overkill >= 1. {
                text(
                    numbers,
                    art,
                    locale
                        .label("{n} overkill")
                        .replace("{n}", &damage(f64::from(blow.overkill))),
                    11.,
                    MUTED,
                    false,
                );
            }
        });
    });
}

fn hit_row(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    assets: &AssetServer,
    locale: &Localization,
    hit: &HitGroup,
    last: bool,
) {
    let stops = if last {
        [
            Color::srgba(0.42, 0.05, 0.03, 0.75),
            Color::srgba(0.16, 0.02, 0.02, 0.45),
        ]
    } else {
        let opacity = if hit.source.rank == "boss" { 0. } else { 0.05 };
        [Color::srgba(1., 0.9, 0.7, opacity); 2]
    };
    ui.spawn((
        Node {
            align_items: AlignItems::Center,
            column_gap: Val::Px(8.),
            padding: UiRect::axes(Val::Px(4.), Val::Px(2.)),
            border_radius: BorderRadius::all(Val::Px(4.)),
            ..default()
        },
        BackgroundGradient::from(LinearGradient {
            angle: std::f32::consts::FRAC_PI_2,
            stops: stops.into_iter().map(Into::into).collect(),
            ..default()
        }),
    ))
    .with_children(|row| {
        row.spawn(Node {
            width: Val::Px(42.),
            flex_shrink: 0.,
            ..default()
        })
        .with_children(|time| {
            let age = if hit.ago < 0.05 {
                "0.0s".to_owned()
            } else {
                format!("-{:.1}s", hit.ago)
            };
            text(time, art, age, 12., MUTED, false);
        });
        icon(row, assets, &hit.source, 28.);
        row.spawn(Node {
            flex_direction: FlexDirection::Column,
            flex_grow: 1.,
            ..default()
        })
        .with_children(|labels| {
            text(
                labels,
                art,
                counted(&hit.source.what, hit.count),
                14.,
                PAPER,
                false,
            );
            who(labels, art, locale, &hit.source, 12.);
            if last {
                text(
                    labels,
                    art,
                    locale.label("Killing blow"),
                    11.,
                    DAMAGE_COLOR,
                    false,
                );
            }
        });
        row.spawn(Node {
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::End,
            ..default()
        })
        .with_children(|numbers| {
            text(
                numbers,
                art,
                damage(f64::from(hit.n)),
                16.,
                DAMAGE_COLOR,
                false,
            );
            if hit.abs >= 1. {
                text(numbers, art, absorbed(locale, hit.abs), 10., MUTED, false);
            }
            let hp = hit.hp.clamp(0., 1.);
            bar(
                numbers,
                Val::Px(64.),
                7.,
                hp * 100.,
                Color::srgb(0.85 - 0.6 * hp, 0.20 + 0.65 * hp, 0.15),
            );
        });
    });
}

fn source_row(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    assets: &AssetServer,
    source: &SourceGroup,
    total: f64,
    largest: f64,
) {
    let details = &source.source;
    let amount = f64::from(source.n);
    let share = amount / total * 100.;
    let bar_share = (amount / largest * 100.) as f32;
    let tint = if details.mechanic {
        AVOIDABLE_COLOR
    } else {
        match details.rank.as_str() {
            "mob" | "none" => Color::srgb(0.80, 0.28, 0.17),
            _ => rank_color(details),
        }
    };
    ui.spawn(Node {
        align_items: AlignItems::Center,
        column_gap: Val::Px(7.),
        ..default()
    })
    .with_children(|row| {
        icon(row, assets, details, 22.);
        row.spawn((
            Node {
                min_width: Val::Px(0.),
                height: Val::Px(22.),
                flex_grow: 1.,
                border: UiRect::all(Val::Px(1.)),
                border_radius: BorderRadius::all(Val::Px(3.)),
                overflow: Overflow::clip(),
                ..default()
            },
            BackgroundColor(Color::srgba(0.169, 0.129, 0.071, 0.45)),
            BorderColor::all(Color::srgb(0.169, 0.129, 0.071)),
        ))
        .with_children(|track| {
            track.spawn((
                Node {
                    position_type: PositionType::Absolute,
                    width: Val::Percent(bar_share.clamp(0., 100.)),
                    height: Val::Percent(100.),
                    ..default()
                },
                BackgroundGradient::from(LinearGradient {
                    angle: std::f32::consts::FRAC_PI_2,
                    stops: vec![tint.with_alpha(0.55).into(), tint.with_alpha(0.25).into()],
                    ..default()
                }),
            ));
            track
                .spawn(Node {
                    width: Val::Percent(100.),
                    height: Val::Percent(100.),
                    padding: UiRect::axes(Val::Px(7.), Val::Px(0.)),
                    align_items: AlignItems::Center,
                    column_gap: Val::Px(7.),
                    ..default()
                })
                .with_children(|labels| {
                    text(labels, art, &details.what, 12., PAPER, false);
                    if source.count > 1 {
                        text(labels, art, format!("×{}", source.count), 11., MUTED, false);
                    }
                    if !details.who.is_empty() {
                        text(labels, art, &details.who, 11., rank_color(details), false);
                    }
                    labels.spawn(Node {
                        flex_grow: 1.,
                        ..default()
                    });
                    text(
                        labels,
                        art,
                        format!("{}  ({share:.0}%)", damage(amount)),
                        12.,
                        GOLD,
                        false,
                    );
                });
        });
    });
}

fn bar(ui: &mut ChildSpawnerCommands, width: Val, height: f32, pct: f32, color: Color) {
    ui.spawn((
        Node {
            width,
            height: Val::Px(height),
            flex_shrink: 0.,
            ..default()
        },
        BackgroundColor(Color::srgba(0.169, 0.129, 0.071, 0.85)),
    ))
    .with_children(|track| {
        track.spawn((
            Node {
                width: Val::Percent(pct.clamp(0., 100.)),
                height: Val::Percent(100.),
                ..default()
            },
            BackgroundColor(color),
        ));
    });
}

fn who(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    locale: &Localization,
    source: &DamageSource,
    size: f32,
) {
    if source.who.is_empty() && !source.mechanic {
        return;
    }
    let line = text(ui, art, &source.who, size, rank_color(source), false);
    if source.mechanic {
        let label = locale.label("Avoidable");
        let value = if source.who.is_empty() {
            label.to_owned()
        } else {
            format!("  ·  {label}")
        };
        ui.commands().entity(line).with_children(|line| {
            line.spawn((
                TextSpan::new(value),
                TextFont {
                    font: art.font.clone(),
                    font_size: size,
                    ..default()
                },
                TextColor(AVOIDABLE_COLOR),
            ));
        });
    }
}

fn rank_color(source: &DamageSource) -> Color {
    match source.rank.as_str() {
        "boss" => Color::srgb(1., 0.5, 0.),
        "elite" => Color::srgb(0.71, 0.42, 1.),
        "object" => AVOIDABLE_COLOR,
        _ => PAPER,
    }
}

fn icon(ui: &mut ChildSpawnerCommands, assets: &AssetServer, source: &DamageSource, size: f32) {
    let icon = source.icon.rsplit(['\\', '/']).next().unwrap_or_default();
    let icon = icon
        .strip_suffix(".blp")
        .or_else(|| icon.strip_suffix(".BLP"))
        .unwrap_or(icon);
    let icon = if !icon.is_empty()
        && icon.len() <= 100
        && icon
            .bytes()
            .all(|byte| byte.is_ascii_alphanumeric() || matches!(byte, b'_' | b'-'))
    {
        icon
    } else {
        "INV_Misc_QuestionMark"
    };
    ui.spawn((
        ImageNode::new(assets.load(format!("mpq://Interface/Icons/{icon}.blp"))),
        Node {
            width: Val::Px(size),
            height: Val::Px(size),
            flex_shrink: 0.,
            ..default()
        },
    ));
}

fn counted(name: &str, count: u32) -> String {
    if count > 1 {
        format!("{name} ×{count}")
    } else {
        name.to_owned()
    }
}

fn absorbed(locale: &Localization, amount: f32) -> String {
    locale
        .label("{n} absorbed")
        .replace("{n}", &damage(f64::from(amount)))
}
