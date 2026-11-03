//! Ready Check modal for the current AS lobby snapshot.

use super::*;

#[derive(Component)]
pub(super) struct ReadyRoot;
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
    mut clocks: Query<&mut Text, With<TimeText>>,
    mut bars: Query<&mut Node, With<TimeBar>>,
    mut previous: Local<Option<(Snapshot, Option<LobbyView>)>>,
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
        )
    });
    if *previous == input && !art.is_changed() && !locale.is_changed() {
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
    for root in &roots {
        commands.entity(root).despawn();
    }
    let Some((snapshot, _)) = snapshot else {
        return;
    };
    let lobby = &view.lobby;
    commands
        .spawn((
            ReadyRoot,
            GlobalZIndex(6100),
            Interaction::None,
            FocusPolicy::Block,
            BackgroundColor(Color::srgba(0., 0., 0., 0.55)),
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                align_items: AlignItems::Center,
                justify_content: JustifyContent::Center,
                ..default()
            },
        ))
        .with_children(|root| {
            menu::native_panel(
                root,
                Node {
                    width: Val::Px(400.),
                    padding: UiRect::all(Val::Px(18.)),
                    row_gap: Val::Px(8.),
                    flex_direction: FlexDirection::Column,
                    ..default()
                },
                |ui| {
                    let gold = Color::srgb(1., 0.914, 0.659);
                    let paper = Color::srgb(0.949, 0.902, 0.788);
                    let muted = Color::srgb(0.725, 0.663, 0.510);
                    let green = Color::srgb(0.302, 1., 0.416);
                    let red = Color::srgb(1., 0.353, 0.235);
                    text(ui, &art, label(&locale, "Ready Check"), 30., gold);
                    let running = snapshot.status == Status::Running;
                    let message = match snapshot.status {
                        Status::Running => "{host} wants to enter {zone}. Are you ready?",
                        Status::Ready => "Everyone is ready!",
                        Status::Declined => "Not everyone is ready.",
                        Status::Expired => "Not everyone answered in time.",
                        Status::Cancelled => "The ready check was called off.",
                    };
                    let mut message = label(&locale, message);
                    if let Some(lobby) = lobby.as_ref().filter(|_| running) {
                        message = message
                            .replace(
                                "{zone}",
                                &crate::coop_directory::display_zone(&locale, &lobby.zone),
                            )
                            .replace(
                                "{host}",
                                lobby.heroes.first().map_or("", |hero| hero.name.as_str()),
                            );
                    }
                    let message_color = match snapshot.status {
                        Status::Running => paper,
                        Status::Ready => green,
                        Status::Declined | Status::Expired => red,
                        Status::Cancelled => muted,
                    };
                    text(ui, &art, message, 15., message_color);
                    if running {
                        ui.spawn((
                            TimeText,
                            Text::new(time_label(&locale, snapshot.left)),
                            TextFont {
                                font: art.font.clone(),
                                font_size: 14.,
                                ..default()
                            },
                            TextColor(muted),
                            menu::native_text_shadow(),
                        ));
                        ui.spawn((
                            Node {
                                height: Val::Px(4.),
                                ..default()
                            },
                            BackgroundColor(DARK),
                        ))
                        .with_children(|bar| {
                            bar.spawn((
                                TimeBar,
                                Node {
                                    height: Val::Percent(100.),
                                    width: time_width(snapshot.left),
                                    ..default()
                                },
                                BackgroundColor(Color::srgb(0.427, 0.333, 0.145)),
                            ));
                        });
                    }
                    let mut awaiting_local = false;
                    for (id, answer) in &snapshot.answers {
                        let Some(hero) = lobby.as_ref().and_then(|lobby| {
                            lobby.heroes.iter().find(|hero| hero.hero_identity == *id)
                        }) else {
                            continue;
                        };
                        awaiting_local |= hero.me && *answer == Answer::Pending;
                        let (caption, color) = match answer {
                            Answer::Ready => ("Ready", green),
                            Answer::NotReady => ("Not ready", red),
                            _ if running => ("Waiting...", muted),
                            _ => ("No answer", muted),
                        };
                        ui.spawn(Node {
                            align_items: AlignItems::Center,
                            column_gap: Val::Px(8.),
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
                                label(&locale, "{name} (leader)").replace("{name}", &hero.name)
                            } else {
                                hero.name.clone()
                            };
                            text(row, &art, name, 16., paper);
                            row.spawn(Node {
                                flex_grow: 1.,
                                ..default()
                            });
                            text(row, &art, label(&locale, caption), 15., color);
                        });
                    }
                    if running {
                        ui.spawn(Node {
                            justify_content: JustifyContent::Center,
                            column_gap: Val::Px(8.),
                            ..default()
                        })
                        .with_children(|buttons| {
                            if view.role == "host" {
                                control(
                                    buttons,
                                    &art,
                                    label(&locale, "Cancel"),
                                    Click::ReadyCancel,
                                    false,
                                    false,
                                    false,
                                );
                            } else if awaiting_local {
                                control(
                                    buttons,
                                    &art,
                                    label(&locale, "Ready"),
                                    Click::ReadyAnswer(true),
                                    true,
                                    false,
                                    false,
                                );
                                control(
                                    buttons,
                                    &art,
                                    label(&locale, "Not Ready"),
                                    Click::ReadyAnswer(false),
                                    false,
                                    false,
                                    false,
                                );
                            }
                        });
                    }
                },
            )
        });
}

fn time_label(locale: &Localization, left: u8) -> String {
    label(locale, "{n} sec").replace("{n}", &left.to_string())
}

fn time_width(left: u8) -> Val {
    Val::Percent((f32::from(left) / f32::from(SECONDS) * 100.).min(100.))
}
