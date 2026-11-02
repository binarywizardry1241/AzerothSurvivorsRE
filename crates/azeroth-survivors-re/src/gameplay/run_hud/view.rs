//! Selected custom HUD hierarchy and live display updates. Timer rows follow
//! docs/analysis/build-countdowns-0.112.0.md. Other selected 0.109.0
//! constructor14020ccd0 and updater14028e670 are revalidated in
//! docs/analysis/run-hud-0.109.0.md; historical constructor fixtures retain their
//! actual target provenance and do not establish current rendered parity.

use bevy::{
    picking::Pickable,
    prelude::*,
    ui::{FocusPolicy, RelativeCursorPosition},
};

use super::{
    super::{mechanics::Mechanics, RunSession},
    HudSettings,
};
use crate::{assets::MenuArt, localization::Localization, menu_state::MenuState, talents::TalentArt};

const GOLD: Color = Color::srgb(0.973, 0.824, 0.416);
const MUTED: Color = Color::srgb(0.725, 0.663, 0.510);
const RED: Color = Color::srgb(1., 0.353, 0.235);

/// Only the native tally and build roots are movable HUD parts.
#[derive(Component)]
pub(super) struct HudPart(pub &'static str);

#[derive(Component)]
pub(super) enum Label {
    Clock,
    NextBoss,
    Kills,
    Gold,
    BuildCountdown(usize),
}

#[derive(Component)]
pub(super) struct BossFill(BarKey);

/// Replica HUD rows have ordered presentation identity, not world GUIDs.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
enum BarKey { World(u64), ReplicaRow(usize) }

#[derive(Component)]
pub(super) struct Shown(&'static str);

struct Bar {
    key: BarKey,
    name: String,
    health: f32,
    maximum_health: f32,
}

fn name(locale: &Localization, key: String, fallback: &str) -> String {
    let value = locale.label(&key);
    if value == key {
        fallback.to_owned()
    } else {
        value.to_owned()
    }
}

/// Native order is the live primary vector followed by awake lair guardians
/// in the ordinary actor vector. Sleepers and dead rows never enter this list.
fn bars(game: &Mechanics, locale: &Localization) -> Vec<Bar> {
    if let Some(hud)=game.replica_hud() {
        return hud.get("bosses").and_then(serde_json::Value::as_array).into_iter().flatten()
            .enumerate().filter_map(|(index,row)|Some(Bar {
                key:BarKey::ReplicaRow(index),name:row.get("name")?.as_str()?.to_owned(),
                health:row.get("hp")?.as_f64()? as f32,
                maximum_health:row.get("hpMax")?.as_f64()? as f32,
            })).collect();
    }
    game.bosses
        .iter()
        .filter(|boss| !boss.actor.dead)
        .map(|boss| Bar {
            key: BarKey::World(boss.guid),
            name: name(
                locale,
                format!("boss.{}.name", boss.definition.id),
                boss.definition.name,
            ),
            health: boss.health,
            maximum_health: boss.maximum_health,
        })
        .chain(
            game.actors
                .iter()
                .filter(|actor| !actor.actor.dead && game.guardian_awake(actor.guid))
                .map(|actor| Bar {
                    key: BarKey::World(actor.guid),
                    name: name(
                        locale,
                        format!("enemy.{}", actor.definition.id),
                        actor.definition.name,
                    ),
                    health: actor.health,
                    maximum_health: actor.maximum_health,
                }),
        )
        .collect()
}

fn health_percent(health: f32, maximum_health: f32) -> f32 {
    // Current1402900d0..1402900f8 widens serialized f32 vitals to doubles,
    // divides/multiplies/clamps there, and narrows only the final percentage.
    (f64::from(health) / f64::from(maximum_health).max(1.) * 100.).clamp(0., 100.) as f32
}

#[derive(Default)]
pub(super) struct ViewState {
    root: Option<Entity>,
    boss_root: Option<Entity>,
    build_root: Option<Entity>,
    locale: String,
    bosses: String,
    build: String,
}

/// Native maxsd(0,time), saturating float-to-u64 conversion and two decimal
/// fields. Minutes have a minimum width of two rather than a two-digit cap.
fn clock(value: f64) -> String {
    let seconds = value.max(0.) as u64;
    format!("{:02}:{:02}", seconds / 60, seconds % 60)
}

fn next_boss(game: &Mechanics, locale: &Localization) -> String {
    game.hud_next_boss()
        .map(|remaining| {
            locale
                .label("hud.next_boss")
                .replace("{time}", &clock(f64::from(remaining)))
        })
        .unwrap_or_else(|| {
            if game.rules.endless {
                locale.label("hud.endless").to_owned()
            } else {
                String::new()
            }
        })
}

fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    color: Color,
) -> Entity {
    ui.spawn((
        Text::new(value.into()),
        TextFont {
            font: art.font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        TextShadow {
            color: Color::srgba(0., 0., 0., 0.85),
            offset: Vec2::new(0., 1.5),
        },
        Pickable::IGNORE,
    ))
    .id()
}

fn spawn_clock(
    root: &mut ChildSpawnerCommands,
    game: &Mechanics,
    art: &MenuArt,
    locale: &Localization,
    settings: &HudSettings,
    bars: &[Bar],
) -> Entity {
    let mut boss_root = None;
    root.spawn((
        Node {
            position_type: PositionType::Absolute,
            top: Val::Px(8.),
            width: Val::Percent(100.),
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::Center,
            row_gap: Val::Px(2.),
            ..default()
        },
        FocusPolicy::Pass,
        Pickable::IGNORE,
    ))
    .with_children(|ui| {
        let entity = text(ui, art, clock(f64::from(game.clock)), 32., GOLD);
        ui.commands().entity(entity).insert((
            Label::Clock,
            Shown("clock"),
            visibility(settings.shown("clock")),
        ));
        let entity = text(ui, art, next_boss(game, locale), 14., MUTED);
        ui.commands().entity(entity).insert((
            Label::NextBoss,
            Shown("clock"),
            visibility(settings.shown("clock")),
        ));
        boss_root = Some(spawn_bars(ui, bars, art, settings.shown("bosses")));
    });
    boss_root.expect("the constructor creates its boss container")
}

/// Current14028dfd0 writes Inherited/Hidden and retains occupied layout.
fn visibility(shown: bool) -> Visibility {
    if shown {
        Visibility::Inherited
    } else {
        Visibility::Hidden
    }
}

fn spawn_bars(root: &mut ChildSpawnerCommands, bars: &[Bar], art: &MenuArt, shown: bool) -> Entity {
    root.spawn((
        Shown("bosses"),
        visibility(shown),
        Node {
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::Center,
            margin: UiRect::top(Val::Px(8.)),
            row_gap: Val::Px(6.),
            ..default()
        },
        FocusPolicy::Pass,
        Pickable::IGNORE,
    ))
    .with_children(|rows| spawn_bar_rows(rows, bars, art))
    .id()
}

fn spawn_bar_rows(rows: &mut ChildSpawnerCommands, bars: &[Bar], art: &MenuArt) {
    for (index, bar) in bars.iter().enumerate() {
        rows.spawn((
            Node {
                flex_direction: FlexDirection::Column,
                align_items: AlignItems::Center,
                row_gap: Val::Px(3.),
                ..default()
            },
            Pickable::IGNORE,
        ))
        .with_children(|row| {
            text(row, art, &bar.name, if index == 0 { 17. } else { 15. }, RED);
            row.spawn((
                Node {
                    width: Val::Px(if bars.len() == 1 { 520. } else { 420. }),
                    height: Val::Px(if index == 0 { 14. } else { 11. }),
                    border: UiRect::all(Val::Px(1.)),
                    border_radius: BorderRadius::all(Val::Px(3.)),
                    overflow: Overflow::clip(),
                    ..default()
                },
                BackgroundColor(Color::srgb(0.13, 0., 0.)),
                BorderColor::all(Color::srgb(0.427, 0.333, 0.145)),
                Pickable::IGNORE,
            ))
            .with_children(|meter| {
                meter.spawn((
                    BossFill(bar.key),
                    Node {
                        width: Val::Percent(health_percent(bar.health, bar.maximum_health)),
                        height: Val::Percent(100.),
                        ..default()
                    },
                    BackgroundGradient::from(LinearGradient {
                        angle: std::f32::consts::PI,
                        stops: vec![
                            Color::linear_rgba(0.93, 0.20, 0.20, 1.).into(),
                            Color::linear_rgba(0.56, 0., 0., 1.).into(),
                        ],
                        ..default()
                    }),
                    Pickable::IGNORE,
                ));
            });
        });
    }
}

fn tally_node() -> Node {
    Node {
        position_type: PositionType::Absolute,
        right: Val::Px(200.),
        top: Val::Px(10.),
        column_gap: Val::Px(16.),
        padding: UiRect::axes(Val::Px(12.), Val::Px(5.)),
        border_radius: BorderRadius::all(Val::Px(4.)),
        ..default()
    }
}

fn build_node() -> Node {
    Node {
        position_type: PositionType::Absolute,
        left: Val::Px(10.),
        top: Val::Px(120.),
        flex_direction: FlexDirection::Column,
        row_gap: Val::Px(4.),
        ..default()
    }
}

fn gold(game: &Mechanics, locale: &Localization) -> String {
    locale
        .label("hud.gold_cache")
        .replace("{gold}", &game.gold.to_string())
        .replace("{cost}", &game.cache_price().to_string())
}

fn spawn_tally(
    root: &mut ChildSpawnerCommands,
    game: &Mechanics,
    art: &MenuArt,
    locale: &Localization,
    settings: &HudSettings,
) {
    let mut node = tally_node();
    settings.apply("tally", &mut node);
    root.spawn((
        HudPart("tally"),
        Shown("tally"),
        visibility(settings.shown("tally")),
        node,
        UiTransform::default(),
        Interaction::None,
        RelativeCursorPosition::default(),
        FocusPolicy::Block,
        BackgroundColor(Color::srgba(0., 0., 0., 0.45)),
    ))
    .with_children(|ui| {
        for (key, value, label) in [
            ("hud.kills", game.kills.to_string(), Label::Kills),
            ("hud.gold", gold(game, locale), Label::Gold),
        ] {
            ui.spawn((
                Text::new(format!("{} ", locale.label(key))),
                TextFont {
                    font: art.font.clone(),
                    font_size: 15.,
                    ..default()
                },
                TextColor(MUTED),
                TextShadow {
                    color: Color::srgba(0., 0., 0., 0.85),
                    offset: Vec2::new(0., 1.5),
                },
                Pickable::IGNORE,
            ))
            .with_children(|text| {
                text.spawn((
                    label,
                    TextSpan::new(value),
                    TextFont {
                        font: art.font.clone(),
                        font_size: 17.,
                        ..default()
                    },
                    TextColor(GOLD),
                ));
            });
        }
    });
}

/// Current build projection has ability, jewelry and recurring-talent rows.
/// Only the recurring-talent icons carry numeric countdowns.
fn spawn_build(
    root: &mut ChildSpawnerCommands,
    icons: &[Vec<Option<Handle<Image>>>; 3],
    timers: &[f32],
    art: &MenuArt,
    settings: &HudSettings,
) -> Entity {
    let mut node = build_node();
    settings.apply("build", &mut node);
    root.spawn((
        HudPart("build"),
        Shown("build"),
        visibility(settings.shown("build")),
        node,
        UiTransform::default(),
        Interaction::None,
        RelativeCursorPosition::default(),
        FocusPolicy::Block,
    ))
    .with_children(|build| spawn_build_rows(build, icons, timers, art))
    .id()
}

fn spawn_build_rows(
    build: &mut ChildSpawnerCommands,
    icons: &[Vec<Option<Handle<Image>>>; 3],
    timers: &[f32],
    art: &MenuArt,
) {
    for (row_index, icons) in icons.iter().enumerate() {
        if row_index == 2 && icons.is_empty() {
            continue;
        }
        build
            .spawn((
                Node {
                    column_gap: Val::Px(3.),
                    ..default()
                },
                FocusPolicy::Pass,
            ))
            .with_children(|row| {
                for (index, image) in icons.iter().enumerate() {
                    let mut icon = row.spawn((
                        Node {
                            width: Val::Px(28.),
                            height: Val::Px(28.),
                            border: UiRect::all(Val::Px(1.)),
                            border_radius: BorderRadius::all(Val::Px(3.)),
                            align_items: AlignItems::Center,
                            justify_content: JustifyContent::Center,
                            ..default()
                        },
                        BorderColor::all(Color::BLACK),
                        Pickable::IGNORE,
                    ));
                    if let Some(image) = image {
                        icon.insert(ImageNode::new(image.clone()));
                    }
                    if row_index == 2 {
                        icon.with_children(|icon| {
                            let label = text(
                                icon, art, countdown(timers.get(index).copied()), 13., GOLD,
                            );
                            icon.commands().entity(label).insert(Label::BuildCountdown(index));
                        });
                    }
                }
            });
    }
}

/// Current HUD updater ceil()s the serialized remaining seconds. The native
/// custom number serializer emits 0 for nonfinite values; only a missing row
/// clears the label.
fn countdown(remaining: Option<f32>) -> String {
    remaining
        .map(|remaining| {
            let value = if remaining.is_finite() { f64::from(remaining).ceil() } else { 0. };
            format!("{value}")
        })
        .unwrap_or_default()
}

#[allow(clippy::too_many_arguments)]
pub(super) fn sync(
    mut commands: Commands,
    session: Res<RunSession>,
    menu: Res<MenuState>,
    art: Res<MenuArt>,
    talent_art: Res<TalentArt>,
    locale: Res<Localization>,
    settings: Res<HudSettings>,
    mut state: Local<ViewState>,
    mut labels: Query<(&Label, &mut Text)>,
    mut spans: Query<(&Label, &mut TextSpan)>,
    mut fills: Query<(&BossFill, &mut Node)>,
    mut parts: Query<(&Shown, &mut Node, &mut Visibility, Option<&HudPart>), Without<BossFill>>,
) {
    let Some(game) = session.mechanics.as_ref().filter(|_| menu.in_run) else {
        if let Some(root) = state.root.take() {
            commands.entity(root).despawn();
        }
        *state = ViewState::default();
        return;
    };
    let bars = bars(game, &locale);
    // These native decorative rows rebuild only when the icon vectors change.
    // Cooldown, rank and damage changes do not discard draggable root entities.
    let ability_icons: Vec<_> = if let Some(hud)=game.replica_hud() {
        hud.get("abilities").and_then(serde_json::Value::as_array).into_iter().flatten()
            .filter_map(|row|Some((row.get("key")?.as_str()?,row.get("icon")?.as_str()?))).collect()
    } else { game
        .abilities
        .iter()
        .map(|ability| (ability.definition.key, ability.definition.icon))
        .collect() };
    let item_icons: Vec<_> = if let Some(hud)=game.replica_hud() {
        hud.get("jewelry").and_then(serde_json::Value::as_array).into_iter().flatten()
            .filter_map(|row|row.get("icon")?.as_str()).collect()
    } else { [0, 1]
        .into_iter()
        .flat_map(|slot| {
            game.jewelry()
                .iter()
                .filter(move |item| item.definition.slot == slot)
                .map(|item| item.definition.icon)
        })
        .chain(game.worn_amulet().map(|item| item.payload.icon.as_str()))
        .collect() };
    let build_timers = game.hud_build_timers();
    let timer_icons: Vec<_> = build_timers.iter().map(|(icon, _)| *icon).collect();
    let timers: Vec<_> = build_timers.iter().map(|(_, remaining)| *remaining).collect();
    let boss_signature = format!(
        "{:?}",
        bars.iter()
            .map(|bar| (bar.key, &bar.name))
            .collect::<Vec<_>>()
    );
    let build_signature = format!("{:?}:{:?}:{:?}", ability_icons, item_icons, timer_icons);
    let icons = [
        ability_icons
            .iter()
            .map(|(key, icon)| {
                art.icons
                    .get(if icon.is_empty() {
                        "native_hud_questionmark"
                    } else {
                        *key
                    })
                    .cloned()
            })
            .collect(),
        item_icons
            .iter()
            .map(|key| {
                art.icons
                    .get(if key.is_empty() {
                        "native_hud_questionmark"
                    } else {
                        *key
                    })
                    .cloned()
            })
            .collect(),
        timer_icons
            .iter()
            .map(|key| {
                if key.is_empty() {
                    art.icons.get("native_hud_questionmark").cloned()
                } else {
                    talent_art.icon(key).cloned()
                }
            })
            .collect(),
    ];
    if state.root.is_none()
        || state.locale != locale.code()
        || art.is_changed()
        || talent_art.is_changed()
        || locale.is_changed()
    {
        if let Some(root) = state.root.take() {
            commands.entity(root).despawn();
        }
        let mut boss_root = None;
        let mut build_root = None;
        state.root = Some(
            commands
                .spawn((
                    Node {
                        position_type: PositionType::Absolute,
                        width: Val::Percent(100.),
                        height: Val::Percent(100.),
                        ..default()
                    },
                    GlobalZIndex(4000),
                    FocusPolicy::Pass,
                    Pickable::IGNORE,
                ))
                .with_children(|root| {
                    boss_root = Some(spawn_clock(root, game, &art, &locale, &settings, &bars));
                    spawn_tally(root, game, &art, &locale, &settings);
                    build_root = Some(spawn_build(root, &icons, &timers, &art, &settings));
                })
                .id(),
        );
        state.boss_root = boss_root;
        state.build_root = build_root;
        state.bosses = boss_signature;
        state.build = build_signature;
        state.locale = locale.code().to_owned();
        return;
    }
    if state.bosses != boss_signature {
        commands
            .entity(state.boss_root.expect("live HUD boss container"))
            .despawn_children()
            .with_children(|rows| spawn_bar_rows(rows, &bars, &art));
        state.bosses = boss_signature;
    }
    if state.build != build_signature {
        commands
            .entity(state.build_root.expect("live HUD build container"))
            .despawn_children()
            .with_children(|rows| spawn_build_rows(rows, &icons, &timers, &art));
        state.build = build_signature;
    }
    for (kind, mut text) in &mut labels {
        let value = match kind {
            Label::Clock => clock(f64::from(game.clock)),
            Label::NextBoss => next_boss(game, &locale),
            Label::BuildCountdown(index) => countdown(timers.get(*index).copied()),
            _ => continue,
        };
        if text.0 != value {
            text.0 = value;
        }
    }
    for (kind, mut text) in &mut spans {
        let value = match kind {
            Label::Kills => game.kills.to_string(),
            Label::Gold => gold(game, &locale),
            _ => continue,
        };
        if text.0 != value {
            text.0 = value;
        }
    }
    for (guid, mut node) in &mut fills {
        if let Some(bar) = bars.iter().find(|bar| bar.key == guid.0) {
            node.width = Val::Percent(health_percent(bar.health, bar.maximum_health));
        }
    }
    for (part, mut node, mut visible, movable) in &mut parts {
        *visible = visibility(settings.shown(part.0));
        if let Some(movable) = movable {
            let mut position = if movable.0 == "tally" {
                tally_node()
            } else {
                build_node()
            };
            settings.apply(movable.0, &mut position);
            node.left = position.left;
            node.right = position.right;
            node.top = position.top;
            node.bottom = position.bottom;
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_clock_truncates_saturates_and_keeps_long_minutes() {
        for (value, expected) in [
            (-1., "00:00"),
            (0., "00:00"),
            (59.99, "00:59"),
            (60., "01:00"),
            (6000., "100:00"),
            (f64::NAN, "00:00"),
        ] {
            assert_eq!(clock(value), expected);
        }
    }

    #[test]
    fn native_bar_denominator_and_fill_bounds() {
        for (health, maximum, expected) in [
            (50., 100., 50.),
            (-10., 100., 0.),
            (200., 100., 100.),
            (0.5, 0., 50.),
            (0.5, -10., 50.),
        ] {
            assert_eq!(health_percent(health, maximum), expected);
        }
        // A float division would produce the adjacent 0x42055556 value.
        assert_eq!(health_percent(1., 3.).to_bits(), 0x4205_5555);
    }
}
