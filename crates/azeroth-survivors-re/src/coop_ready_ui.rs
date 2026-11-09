//! Ready Check modal for the current AS lobby snapshot.

use super::*;
use crate::canvas::NativeCanvas;

#[derive(Component)]
pub(super) struct ReadyRoot;
#[derive(Component)]
pub(super) struct ReadyCanvas;
#[derive(Component)]
pub(super) struct TimeText;
#[derive(Component)]
pub(super) struct TimeBar;

pub(super) fn rebuild(
    mut commands: Commands,
    state: Res<MenuState>,
    view: Res<CoopUi>,
    art: Res<MenuArt>,
    locale: Res<Localization>,
    time: Res<Time>,
    roots: Query<Entity, With<ReadyRoot>>,
    canvases: Query<Entity, With<ReadyCanvas>>,
    mut clocks: Query<&mut Text, With<TimeText>>,
    mut bars: Query<&mut Node, With<TimeBar>>,
    mut previous: Local<Option<(Snapshot, Option<LobbyView>, bool)>>,
) {
    let snapshot = view
        .ready_check
        .as_ref()
        .filter(|_| !state.in_run && view.ready_modal_visible(time.elapsed_secs()));
    let input = snapshot.map(|(snapshot, _)| {
        (
            Snapshot {
                left: 0,
                ..snapshot.clone()
            },
            view.lobby.clone(),
            view.role == "host",
        )
    });
    if *previous == input
        && !art.is_changed()
        && !locale.is_changed()
        && (snapshot.is_none() || !canvases.is_empty())
    {
        if let Some((snapshot, _)) = snapshot {
            for mut clock in &mut clocks {
                let current = time_label(&locale, snapshot.left);
                if clock.0 != current {
                    clock.0 = current;
                }
            }
            for mut bar in &mut bars {
                let current = time_width(snapshot.left);
                if bar.width != current {
                    bar.width = current;
                }
            }
        }
        return;
    }
    *previous = input;
    let Some((snapshot, _)) = snapshot else {
        for root in &roots {
            commands.entity(root).despawn();
        }
        return;
    };
    let host = view.role == "host";
    if let Ok(canvas) = canvases.single() {
        // 0x1400ea36e rebuilds descendants of the existing ReadyCanvas.
        commands
            .entity(canvas)
            .despawn_children()
            .with_children(|ui| {
                content(ui, snapshot, view.lobby.as_ref(), host, &art, &locale);
            });
        return;
    }
    for root in &roots {
        commands.entity(root).despawn();
    }
    commands
        .spawn((
            ReadyRoot,
            GlobalZIndex(5800),
            Interaction::None,
            FocusPolicy::Block,
            BackgroundColor(Color::srgba(0., 0., 0., 0.55)),
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                ..default()
            },
        ))
        .with_children(|root| {
            // 0x14032b1e0 gives the Node and Canvas the same 460×400 size.
            root.spawn((
                ReadyCanvas,
                NativeCanvas {
                    design: Vec2::new(460., 400.),
                    max_scale: 1.4,
                },
                Node {
                    position_type: PositionType::Absolute,
                    width: Val::Px(460.),
                    height: Val::Px(400.),
                    ..default()
                },
            ))
            .with_children(|ui| {
                content(ui, snapshot, view.lobby.as_ref(), host, &art, &locale);
            });
        });
}

fn content(
    ui: &mut ChildSpawnerCommands,
    snapshot: &Snapshot,
    lobby: Option<&LobbyView>,
    host: bool,
    art: &MenuArt,
    locale: &Localization,
) {
    // 0x1400dca00 fills the Canvas with the common native frame.
    ui.spawn((
        Node {
            width: Val::Percent(100.),
            height: Val::Percent(100.),
            padding: UiRect::axes(Val::Px(30.), Val::Px(20.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(10.)),
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::Stretch,
            row_gap: Val::Px(10.),
            ..default()
        },
        menu::native_panel_style(),
        Interaction::None,
        FocusPolicy::Block,
    ))
    .with_children(|panel| panel_content(panel, snapshot, lobby, host, art, locale));
}

fn panel_content(
    ui: &mut ChildSpawnerCommands,
    snapshot: &Snapshot,
    lobby: Option<&LobbyView>,
    host: bool,
    art: &MenuArt,
    locale: &Localization,
) {
    let gold = Color::srgb(1., 0.914, 0.659);
    let paper = Color::srgb(0.949, 0.902, 0.788);
    let muted = Color::srgb(0.725, 0.663, 0.510);
    let green = Color::srgb(0.302, 1., 0.416);
    let red = Color::srgb(1., 0.353, 0.235);
    ui.spawn(Node {
        justify_content: JustifyContent::Center,
        ..default()
    })
    .with_children(|title| text(title, art, label(locale, "Ready Check"), 30., gold));
    let running = snapshot.status == Status::Running;
    let awaiting_local = lobby
        .and_then(|lobby| lobby.heroes.iter().find(|hero| hero.me))
        .is_some_and(|hero| snapshot.answers.contains(&(hero.hero_identity, Answer::Pending)));
    // The running view gives the host and guests who already answered the
    // waiting caption. Pending guests get the invitation and answer buttons.
    let waiting = host || !awaiting_local;
    let message = match snapshot.status {
        Status::Running if waiting => "Waiting for the party to answer...",
        Status::Running => "{host} wants to enter {zone}. Are you ready?",
        Status::Ready => "Everyone is ready!",
        Status::Declined => "Not everyone is ready.",
        Status::Expired => "Not everyone answered in time.",
        Status::Cancelled => "The ready check was called off.",
    };
    let mut message = label(locale, message);
    if let Some(lobby) = lobby.filter(|_| running && !waiting) {
        message = message
            .replace(
                "{zone}",
                &crate::coop_directory::display_zone(locale, &lobby.zone),
            )
            .replace(
                "{host}",
                lobby.heroes.first().map_or("", |hero| hero.name.as_str()),
            );
    }
    let message_color = match snapshot.status {
        Status::Running if waiting => muted,
        Status::Running => paper,
        Status::Ready => green,
        Status::Declined | Status::Expired => red,
        Status::Cancelled => muted,
    };
    ui.spawn(Node {
        justify_content: JustifyContent::Center,
        ..default()
    })
    .with_children(|description| text(description, art, message, 15., message_color));
    ui.spawn((
        Node {
            width: Val::Percent(100.),
            height: Val::Px(1.),
            ..default()
        },
        BackgroundColor(EDGE),
    ));
    for (id, answer) in &snapshot.answers {
        let Some(hero) =
            lobby.and_then(|lobby| lobby.heroes.iter().find(|hero| hero.hero_identity == *id))
        else {
            continue;
        };
        let (caption, color) = match answer {
            Answer::Ready => ("Ready", green),
            Answer::NotReady => ("Not ready", red),
            _ if running => ("Waiting...", muted),
            _ => ("No answer", muted),
        };
        ui.spawn(Node {
            align_items: AlignItems::Center,
            padding: UiRect::axes(Val::Px(8.), Val::Px(3.)),
            column_gap: Val::Px(10.),
            ..default()
        })
        .with_children(|row| {
            if let Some(icon) = art.icons.get(&hero.class) {
                row.spawn((
                    ImageNode::new(icon.clone()),
                    Node {
                        width: Val::Px(24.),
                        height: Val::Px(24.),
                        ..default()
                    },
                ));
            }
            let name = if hero.host {
                label(locale, "{name} (leader)").replace("{name}", &hero.name)
            } else {
                hero.name.clone()
            };
            text(row, art, name, 16., paper);
            row.spawn(Node {
                flex_grow: 1.,
                ..default()
            });
            text(row, art, label(locale, caption), 15., color);
        });
    }
    ui.spawn(Node {
        flex_grow: 1.,
        ..default()
    });
    if running {
        countdown(ui, art, locale, snapshot.left);
        ui.spawn(Node {
            justify_content: JustifyContent::Center,
            column_gap: Val::Px(16.),
            ..default()
        })
        .with_children(|buttons| {
            if host {
                answer_button(buttons, art, label(locale, "Cancel"), Click::ReadyCancel);
            } else if awaiting_local {
                answer_button(
                    buttons,
                    art,
                    label(locale, "Ready"),
                    Click::ReadyAnswer(true),
                );
                answer_button(
                    buttons,
                    art,
                    label(locale, "Not Ready"),
                    Click::ReadyAnswer(false),
                );
            }
        });
    }
}

fn countdown(ui: &mut ChildSpawnerCommands, art: &MenuArt, locale: &Localization, left: u8) {
    ui.spawn(Node {
        align_items: AlignItems::Center,
        column_gap: Val::Px(10.),
        ..default()
    })
    .with_children(|row| {
        row.spawn((
            Node {
                flex_grow: 1.,
                height: Val::Px(8.),
                border: UiRect::all(Val::Px(1.)),
                border_radius: BorderRadius::all(Val::Px(4.)),
                ..default()
            },
            BorderColor::all(EDGE),
            BackgroundColor(Color::srgba(0., 0., 0., 0.4)),
        ))
        .with_children(|rail| {
            rail.spawn((
                TimeBar,
                Node {
                    height: Val::Percent(100.),
                    width: time_width(left),
                    border_radius: BorderRadius::all(Val::Px(3.)),
                    ..default()
                },
                BackgroundColor(menu::BUTTON_EDGE),
            ));
        });
        row.spawn((
            TimeText,
            Text::new(time_label(locale, left)),
            TextFont {
                font: art.font.clone(),
                font_size: 14.,
                ..default()
            },
            TextColor(MUTED),
            menu::native_text_shadow(),
        ));
    });
}

// The shared Answer constructor at 0x1400dc440 also serves host Cancel.
fn answer_button(ui: &mut ChildSpawnerCommands, art: &MenuArt, value: String, click: Click) {
    let edge = menu::BUTTON_EDGE;
    let active = Color::srgb(1., 0.914, 0.659);
    ui.spawn((
        Interaction::None,
        click,
        Node {
            min_width: Val::Px(110.),
            padding: UiRect::axes(Val::Px(16.), Val::Px(7.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(4.)),
            justify_content: JustifyContent::Center,
            ..default()
        },
        BorderColor::all(edge),
        menu::native_button_gradient(),
        BoxShadow::new(
            Color::srgba(0., 0., 0., 0.85),
            Val::Px(0.),
            Val::Px(2.),
            Val::Px(0.),
            Val::Px(6.),
        ),
        crate::hover::NativeHover::new(edge, active, 0.),
    ))
    .with_children(|ui| text(ui, art, value, 17., GOLD));
}

fn time_label(locale: &Localization, left: u8) -> String {
    label(locale, "{n} sec").replace("{n}", &left.to_string())
}

fn time_width(left: u8) -> Val {
    Val::Percent((f32::from(left) / f32::from(SECONDS) * 100.).min(100.))
}
