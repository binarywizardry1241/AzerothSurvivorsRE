//! Rewards constructors recovered at0.105.0 and revalidated against current0.109.0.
//! See docs/analysis/rewards-menu-0.109.0.md for current owners and validation limits.
use super::*;

fn spacer(ui: &mut ChildSpawnerCommands, height: f32) {
    ui.spawn(Node {
        height: Val::Px(height),
        ..default()
    });
}

#[derive(Clone, Copy)]
enum ControlStyle {
    Command,
    Navigation,
    Companion,
}

fn control(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: &str,
    action: Action,
    selected: bool,
    enabled: bool,
    style: ControlStyle,
) {
    let (size, padding, lift) = match style {
        ControlStyle::Command => (15., [14., 6.], 0.4),
        ControlStyle::Navigation => (16., [12., 8.], 0.),
        ControlStyle::Companion => (14., [10., 5.], 0.),
    };
    let command = matches!(style, ControlStyle::Command);
    let resting = if selected || (command && enabled) {
        GOLD
    } else if enabled {
        EDGE
    } else {
        Color::srgb(0.169, 0.129, 0.071)
    };
    let mut button = ui.spawn((
        Button,
        Node {
            padding: UiRect::axes(Val::Px(padding[0]), Val::Px(padding[1])),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(5.)),
            align_items: if command {
                AlignItems::Center
            } else {
                default()
            },
            justify_content: if command {
                JustifyContent::Center
            } else {
                default()
            },
            ..default()
        },
        BackgroundColor(if command {
            DARK
        } else if selected {
            Color::srgba(0.30, 0.20, 0.06, 0.55)
        } else {
            Color::srgba(0., 0., 0., 0.5)
        }),
        BorderColor::all(resting),
    ));
    if command && enabled {
        button.insert(menu::native_button_gradient());
    }
    if enabled {
        button.insert((
            action,
            crate::hover::NativeHover::new(resting, PAPER, lift),
            UiTransform::default(),
        ));
    }
    button.with_children(|ui| {
        text(
            ui,
            art,
            value,
            size,
            if !enabled {
                Color::srgba(0.725, 0.663, 0.510, 0.35)
            } else if selected {
                GOLD
            } else {
                PAPER
            },
        )
    });
}

fn command(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: &str,
    action: Action,
    enabled: bool,
) {
    control(
        ui,
        art,
        value,
        action,
        false,
        enabled,
        ControlStyle::Command,
    );
}

fn sidebar(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    labels: &MenuCatalog,
    catalog: &Catalog,
    owned: &Progress,
    plan: &Progress,
    view: &ProgressionState,
) {
    let earned = owned.earned_points(catalog);
    let spent = plan.spent(catalog);
    let added = spent.saturating_sub(owned.spent(catalog));
    let edited = plan.perks != owned.perks || plan.tabards != owned.tabards
        || plan.races != owned.races;
    crate::codex::section_heading(ui, art, labels.label("Rewards"));
    ui.spawn((
        Text::new(earned.saturating_sub(spent).to_string()),
        TextFont {
            font: art.font.clone(),
            font_size: 40.,
            ..default()
        },
        TextColor(PAPER),
        menu::native_text_shadow(),
    ))
    .with_children(|score| {
        score.spawn((
            TextSpan::new(format!("  {}", labels.label("points to spend"))),
            TextFont {
                font: art.font.clone(),
                font_size: 14.,
                ..default()
            },
            TextColor(MUTED),
        ));
    });
    text(
        ui,
        art,
        label(
            labels,
            "{earned} earned from achievements · {spent} spent",
            &[("earned", earned.to_string()), ("spent", spent.to_string())],
        ),
        13.,
        MUTED,
    );
    if added > 0 {
        text(
            ui,
            art,
            label(
                labels,
                "This plan spends {spent} more. Confirm locks it in.",
                &[("spent", added.to_string())],
            ),
            13.,
            GOLD,
        );
    }
    ui.spawn(Node {
        column_gap: Val::Px(8.),
        ..default()
    })
    .with_children(|row| {
        command(
            row,
            art,
            labels.label("Confirm"),
            Action::Confirm,
            edited && valid_plan(plan, owned, catalog),
        );
        command(row, art, labels.label("Undo"), Action::Undo, edited);
    });
    spacer(ui, 6.);
    for (tab, name) in ["Perks", "Companions", "Tabards", "Races", "Appearances"].iter().enumerate() {
        control(
            ui,
            art,
            labels.label(name),
            Action::RewardsTab(tab as u8),
            view.rewards_tab == tab as u8,
            true,
            ControlStyle::Navigation,
        );
    }
    spacer(ui, 6.);
    crate::codex::section_heading(ui, art, labels.label("Reset"));
    text(ui, art, label(labels, "Takes back every point spent on perks, to spend again. Tabards and races are kept. {resets} of {total} resets left on this save.", &[("resets", 2_u32.saturating_sub(owned.resets).to_string()), ("total", "2".into())]), 13., MUTED);
    command(
        ui,
        art,
        labels.label(if view.reset_armed {
            "Click again to reset"
        } else {
            "Reset perks"
        }),
        Action::Reset,
        !edited && reset_available(owned),
    );
    text(ui, art, labels.label("Perks, tabards and races are the account's: every hero of every class has them. Earn achievements for more points."), 12., MUTED);
    ui.spawn(Node {
        flex_grow: 1.,
        ..default()
    });
}

fn reward_icon(ui: &mut ChildSpawnerCommands, images: &Art, key: &str, locked: bool) {
    if let Some(image) = images.icons.get(key) {
        ui.spawn((
            ImageNode {
                image: image.clone(),
                color: if locked {
                    Color::srgb(0.30, 0.28, 0.26)
                } else {
                    Color::WHITE
                },
                ..default()
            },
            Node {
                width: Val::Px(28.),
                height: Val::Px(28.),
                flex_shrink: 0.,
                ..default()
            },
        ));
    }
}

fn appearance_card(
    ui: &mut ChildSpawnerCommands,
    highlighted: bool,
    filled: bool,
    enabled: bool,
    action: Action,
    build: impl FnOnce(&mut ChildSpawnerCommands),
) -> Entity {
    let edge = if highlighted {
        GOLD
    } else {
        Color::srgb(0.169, 0.129, 0.071)
    };
    let mut card = ui.spawn((
        Button,
        Node {
            padding: UiRect::axes(Val::Px(6.), Val::Px(4.)),
            column_gap: Val::Px(8.),
            align_items: AlignItems::Center,
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(5.)),
            ..default()
        },
        BackgroundColor(if filled {
            Color::srgba(0.22, 0.15, 0.05, 0.55)
        } else {
            DARK
        }),
        BorderColor::all(edge),
    ));
    if enabled {
        card.insert((
            action,
            crate::hover::NativeHover::new(edge, PAPER, 0.),
            UiTransform::default(),
        ));
    }
    card.with_children(build).id()
}

fn companion_looks(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &Art,
    labels: &MenuCatalog,
    catalog: &Catalog,
    owned: &Progress,
    plan: &Progress,
    view: &ProgressionState,
) {
    let slots = usize::from(plan.rank("companion") > 0) + usize::from(plan.rank("second") > 0);
    let slots = slots.max(1);
    let selected_slot = view.companion_slot.min(slots - 1);
    ui.spawn(Node {
        column_gap: Val::Px(10.),
        align_items: AlignItems::Center,
        ..default()
    })
    .with_children(|row| {
        for slot in 0..slots {
            let pet = catalog
                .companions
                .iter()
                .find(|pet| pet.key == owned.pet(slot))
                .unwrap_or(&catalog.companions[0]);
            let template = if slots == 1 {
                "Your companion: {name}"
            } else if slot == 0 {
                "First companion: {name}"
            } else {
                "Second companion: {name}"
            };
            control(
                row,
                art,
                &label(
                    labels,
                    template,
                    &[("name", labels.label(&pet.name).into())],
                ),
                Action::PetSlot(slot),
                selected_slot == slot,
                true,
                ControlStyle::Companion,
            );
        }
        text(
            row,
            art,
            labels.label("Pick a slot, then a look."),
            12.,
            MUTED,
        );
    });
    crate::scrollbar::kept_list(ui, "rewards-companion-looks", 8., |ui| {
    ui.spawn(Node {
        display: Display::Grid,
        grid_template_columns: RepeatedGridTrack::flex(4, 1.),
        column_gap: Val::Px(8.),
        row_gap: Val::Px(6.),
        ..default()
    })
    .with_children(|grid| {
        for pet in &catalog.companions {
            let available = pet
                .achievement
                .as_ref()
                .is_none_or(|key| owned.earned.contains(key));
            let worn = owned.pet(selected_slot) == pet.key;
            appearance_card(
                grid,
                worn,
                available,
                available && !worn,
                Action::Pet(selected_slot, pet.key.clone()),
                |row| {
                    reward_icon(row, images, &pet.icon, !available);
                    row.spawn(Node {
                        flex_direction: FlexDirection::Column,
                        ..default()
                    })
                    .with_children(|body| {
                        text(
                            body,
                            art,
                            labels.label(&pet.name),
                            13.,
                            if available { PAPER } else { MUTED },
                        );
                        let caption = if worn {
                            labels.label("Worn").into()
                        } else if available {
                            labels.label("Wear").into()
                        } else if let Some(name) = &pet.achievement_name {
                            labels.label(name).into()
                        } else {
                            pet.achievement
                                .as_ref()
                                .map(|key| achievement_name(catalog, labels, key))
                                .unwrap_or_default()
                        };
                        text(body, art, caption, 11., if worn { GREEN } else { MUTED });
                    });
                },
            );
        }
    });
    });
}

fn tabards(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &Art,
    labels: &MenuCatalog,
    catalog: &Catalog,
    owned: &Progress,
    plan: &Progress,
    menu: &MenuState,
) {
    text(ui, art, label(labels, "A look for your {class}s' tabard slot; it adds nothing. Battleground tabards come with their zone's achievement.", &[("class", labels.label(&labels.classes[menu.class].name).into())]), 12., MUTED);
    let worn = worn_tabard(&menu.save, menu.class_id());
    ui.spawn(Node {
        display: Display::Grid,
        grid_template_columns: RepeatedGridTrack::flex(3, 1.),
        column_gap: Val::Px(10.),
        row_gap: Val::Px(8.),
        ..default()
    })
    .with_children(|grid| {
        for tabard in &catalog.tabards {
            let available = tabard.available(owned);
            let planned = !available && plan.tabards.contains(&tabard.id);
            let mut candidate = plan.clone();
            if !candidate.tabards.remove(&tabard.id) {
                candidate.tabards.insert(tabard.id);
            }
            let enabled =
                available || (tabard.zone.is_none() && valid_plan(&candidate, owned, catalog));
            let action = if available {
                Action::WearTabard(Some(tabard.id))
            } else {
                Action::BuyTabard(tabard.id)
            };
            appearance_card(
                grid,
                enabled,
                available || planned,
                enabled && worn != Some(tabard.id),
                action,
                |row| {
                    reward_icon(row, images, &tabard.icon, !available && !planned);
                    row.spawn(Node {
                        flex_direction: FlexDirection::Column,
                        ..default()
                    })
                    .with_children(|body| {
                        text(
                            body,
                            art,
                            labels
                                .labels
                                .get(&format!("tabard.{}", tabard.id))
                                .unwrap_or(&tabard.name),
                            13.,
                            PAPER,
                        );
                        let caption = if worn == Some(tabard.id) {
                            labels.label("Worn").into()
                        } else if available {
                            labels.label("Wear").into()
                        } else if let Some(zone) = &tabard.zone {
                            achievement_name(catalog, labels, zone)
                        } else if planned {
                            label(
                                labels,
                                "In plan ({cost})",
                                &[("cost", tabard.cost.to_string())],
                            )
                        } else {
                            label(labels, "Buy {cost}", &[("cost", tabard.cost.to_string())])
                        };
                        text(
                            body,
                            art,
                            caption,
                            11.,
                            if worn == Some(tabard.id) || planned {
                                GREEN
                            } else {
                                GOLD
                            },
                        );
                    });
                },
            );
        }
    });
    if worn.is_some() {
        command(
            ui,
            art,
            labels.label("Take the tabard off"),
            Action::WearTabard(None),
            true,
        );
    }
}

/// Current14019f0e0/1401a1620: permanent account races and reversible plan edits.
fn races(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    labels: &MenuCatalog,
    catalog: &Catalog,
    owned: &Progress,
    plan: &Progress,
    menu: &MenuState,
) {
    text(ui, art, label(labels,
        "Open a race to every class, its racial and passives with it, for {cost} points each. Bought for good: resets keep it.",
        &[("cost", "100".into())]), 12., MUTED);
    let remaining = owned.earned_points(catalog).saturating_sub(plan.spent(catalog));
    ui.spawn(Node {
        display: Display::Grid,
        grid_template_columns: RepeatedGridTrack::flex(2, 1.),
        column_gap: Val::Px(10.),
        row_gap: Val::Px(8.),
        ..default()
    }).with_children(|grid| {
        for race in &labels.races {
            let id = menu::race_id_for(&race.key);
            if !(1..=8).contains(&id) { continue; }
            let bought = owned.races.contains(&id);
            let planned = !bought && plan.races.contains(&id);
            let enabled = !bought && (planned || remaining >= 100);
            let caption = if bought {
                labels.label("Every class").to_owned()
            } else if planned {
                label(labels, "In plan ({cost})", &[("cost", "100".into())])
            } else if enabled {
                label(labels, "Buy {cost}", &[("cost", "100".into())])
            } else {
                label(labels, "{cost} points", &[("cost", "100".into())])
            };
            let classes = labels.classes.iter().zip(CLASS_IDS).filter(|(_, class)| {
                !crate::save::allowed_races(*class).contains(&id)
            }).map(|(class, _)| labels.label(&class.name)).collect::<Vec<_>>().join(", ");
            let card = appearance_card(grid, bought, bought || planned, enabled, Action::BuyRace(id), |row| {
                if let Some(mut portrait) = crate::armory::race_portrait(art, id, menu.sex, true) {
                    portrait.color = Color::srgba(1., 1., 1., if bought || planned { 1. } else { 0.4 });
                    row.spawn((portrait, Node {
                        width: Val::Px(40.), height: Val::Px(40.), flex_shrink: 0., ..default()
                    }));
                }
                row.spawn(Node { flex_direction: FlexDirection::Column, row_gap: Val::Px(2.), ..default() })
                    .with_children(|body| {
                        text(body, art, labels.label(&format!("race.{}.name", race.key)), 15.,
                            if bought || planned { Color::srgb(0.949, 0.902, 0.788) } else { MUTED });
                        text(body, art, label(labels, "Opens it to: {classes}", &[("classes", classes)]), 11., MUTED);
                        text(body, art, &caption, 13., if bought || planned { GREEN } else if enabled { GOLD } else { MUTED });
                    });
            });
            grid.commands().entity(card).insert(Node {
                padding: UiRect::axes(Val::Px(8.), Val::Px(6.)),
                column_gap: Val::Px(10.), align_items: AlignItems::Center,
                border: UiRect::all(Val::Px(1.)),
                border_radius: BorderRadius::all(Val::Px(5.)), ..default()
            });
        }
    });
}

fn cosmetic_card(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &Art,
    labels: &MenuCatalog,
    catalog: &Catalog,
    entry: &crate::armory::cosmetics::Cosmetic,
    available: bool,
    shown: bool,
) {
    let edge = if shown {
        GOLD
    } else {
        Color::srgb(0.169, 0.129, 0.071)
    };
    let mut card = ui.spawn((
        Button,
        Node {
            padding: UiRect::axes(Val::Px(8.), Val::Px(6.)),
            column_gap: Val::Px(10.),
            align_items: AlignItems::Center,
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(5.)),
            ..default()
        },
        BackgroundColor(if available {
            Color::srgba(0.22, 0.15, 0.05, 0.55)
        } else {
            DARK
        }),
        BorderColor::all(edge),
    ));
    if available {
        card.insert((
            Action::ShowCosmetic(entry.slot, (!shown).then_some(entry.id)),
            crate::hover::NativeHover::new(edge, PAPER, 0.),
            UiTransform::default(),
        ));
    }
    card.with_children(|row| {
        if let Some(image) = images.icons.get(&entry.icon) {
            row.spawn((
                ImageNode {
                    color: if available {
                        Color::WHITE
                    } else {
                        Color::srgb(0.6, 0.6, 0.6)
                    },
                    ..ImageNode::new(image.clone())
                },
                Node {
                    width: Val::Px(40.),
                    height: Val::Px(40.),
                    flex_shrink: 0.,
                    ..default()
                },
            ));
        }
        row.spawn(Node {
            flex_grow: 1.,
            flex_direction: FlexDirection::Column,
            row_gap: Val::Px(2.),
            ..default()
        })
        .with_children(|body| {
            text(
                body,
                art,
                crate::armory::cosmetic_name(labels, entry),
                15.,
                if available {
                    Color::srgb(0.949, 0.902, 0.788)
                } else {
                    MUTED
                },
            );
            text(body, art, labels.label("Cosmetic · any class"), 11., MUTED);
            if let Some(achievement) = catalog.achievement(&entry.achievement) {
                text(
                    body,
                    art,
                    label(
                        labels,
                        "{name}: {how}",
                        &[
                            ("name", achievement.label(labels, &achievement.name)),
                            ("how", achievement.label(labels, &achievement.description)),
                        ],
                    ),
                    12.,
                    if available {
                        Color::srgb(0.69, 0.541, 0.227)
                    } else {
                        MUTED
                    },
                );
            }
            text(
                body,
                art,
                labels.label(if !available {
                    "Not yet earned"
                } else if shown {
                    "Shown"
                } else {
                    "Show"
                }),
                13.,
                if !available {
                    MUTED
                } else if shown {
                    PAPER
                } else {
                    GOLD
                },
            );
        });
    });
}

fn appearances(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &Art,
    labels: &MenuCatalog,
    catalog: &Catalog,
    owned: &Progress,
    menu: &MenuState,
) {
    let entries = crate::armory::cosmetics::all();
    let collected = entries
        .iter()
        .filter(|entry| owned.earned.contains(&entry.achievement))
        .count();
    text(ui, art, label(labels,
        "Looks any class can show; they add nothing. Each comes with an achievement. {n} of {total} collected.",
        &[("n", collected.to_string()), ("total", entries.len().to_string())]), 12., MUTED);
    let gear = GearSave::read_for(&menu.save, menu.class_id(), menu.race);
    crate::scrollbar::kept_list(ui, "rewards-appearances", 8., |list| {
        for slot in [0, 14] {
            text(
                list,
                art,
                labels.label(&format!("slot.{slot}")).to_uppercase(),
                11.,
                Color::srgb(0.69, 0.541, 0.227),
            );
            list.spawn(Node {
                display: Display::Grid,
                grid_template_columns: RepeatedGridTrack::flex(2, 1.),
                column_gap: Val::Px(8.),
                row_gap: Val::Px(6.),
                ..default()
            })
            .with_children(|grid| {
                for entry in entries.iter().filter(|entry| entry.slot == slot) {
                    let available = owned.earned.contains(&entry.achievement);
                    let shown = gear.cosmetic(menu.class_id(), slot) == Some(entry.id);
                    cosmetic_card(grid, art, images, labels, catalog, entry, available, shown);
                }
            });
        }
    });
}

pub(super) fn draw(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &Art,
    labels: &MenuCatalog,
    catalog: &Catalog,
    owned: &Progress,
    menu: &MenuState,
    view: &ProgressionState,
) {
    let plan = view.plan.as_ref().unwrap_or(owned);
    ui.spawn(crate::armory::shell_node()).with_children(|shell| {
        crate::armory::build_header_row(shell, art, labels, menu);
        shell.spawn(crate::armory::body_node()).with_children(|body| {
            let pane = |width, grow| Node {
                width,
                flex_grow: grow,
                flex_shrink: if grow == 0. { 0. } else { 1. },
                min_height: Val::Px(0.),
                flex_direction: FlexDirection::Column,
                padding: UiRect::axes(Val::Px(16.), Val::Px(12.)),
                row_gap: Val::Px(10.),
                ..default()
            };
            menu::native_panel(body, pane(Val::Px(300.), 0.), |left| sidebar(left, art, labels, catalog, owned, plan, view));
            menu::native_panel(body, pane(Val::Auto, 1.), |right| {
                let perks = |ui: &mut ChildSpawnerCommands| {
                    ui.spawn(Node {
                        display: Display::Grid,
                        grid_template_columns: RepeatedGridTrack::flex(2, 1.),
                        row_gap: Val::Px(8.),
                        column_gap: Val::Px(10.),
                        ..default()
                    }).with_children(|grid| {
                        for perk in catalog.perks.iter().filter(|perk| perk.category == view.rewards_tab) {
                            perk_card(grid, art, images, labels, catalog, perk, owned, plan);
                        }
                    });
                };
                if view.rewards_tab == 1 {
                    right.spawn(Node {
                        width: Val::Percent(100.),
                        column_gap: Val::Px(12.),
                        align_items: AlignItems::Center,
                        ..default()
                    }).with_children(|row| {
                        control(
                            row, art, labels.label("Companion Perks"),
                            Action::CompanionTab(CompanionTab::Perks),
                            view.companion_tab == CompanionTab::Perks, true, ControlStyle::Companion,
                        );
                        row.spawn(Node { flex_grow: 1., ..default() }).with_children(|heading| {
                            crate::codex::section_heading(heading, art, labels.label("Companions"));
                        });
                        control(
                            row, art, labels.label("Companions"),
                            Action::CompanionTab(CompanionTab::Looks),
                            view.companion_tab == CompanionTab::Looks, true, ControlStyle::Companion,
                        );
                    });
                    match view.companion_tab {
                        CompanionTab::Perks => {
                            crate::scrollbar::kept_list(right, "rewards-companion-perks", 8., |list| {
                                text(list, art, labels.label("Companions follow every hero of every class and fetch coins and experience wisps for you. Instincts go one to a companion, the first bought to the first."), 12., MUTED);
                                perks(list);
                            });
                        }
                        CompanionTab::Looks => {
                            companion_looks(right, art, images, labels, catalog, owned, plan, view);
                        }
                    }
                    return;
                }
                crate::codex::section_heading(right, art, labels.label(["Perks", "Companions", "Tabards", "Races", "Appearances"][usize::from(view.rewards_tab)]));
                match view.rewards_tab {
                    4 => appearances(right, art, images, labels, catalog, owned, menu),
                    3 => races(right, art, labels, catalog, owned, plan, menu),
                    2 => tabards(right, art, images, labels, catalog, owned, plan, menu),
                    _ => perks(right),
                }
            });
        });
    });
    if matches!(menu.dialog, Some(Dialog::RewardsChanges(_))) {
        ui.spawn((
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                align_items: AlignItems::Center,
                justify_content: JustifyContent::Center,
                ..default()
            },
            Interaction::default(),
            BackgroundColor(Color::srgba(0., 0., 0., 0.6)),
            GlobalZIndex(5411),
        )).with_children(|shade| {
            menu::native_panel(shade, Node {
                width: Val::Px(460.),
                flex_direction: FlexDirection::Column,
                align_items: AlignItems::Center,
                padding: UiRect::axes(Val::Px(24.), Val::Px(20.)),
                row_gap: Val::Px(12.),
                ..default()
            }, |dialog| {
                dialog.spawn((Text::new(labels.label("Unsaved changes")), TextFont { font: art.heading_font.clone(), font_size: 26., ..default() }, TextColor(GOLD), menu::native_text_shadow()));
                dialog.spawn((
                    Text::new(labels.label("You have changed your perks, tabards or races without confirming. Confirm the changes before you go?")),
                    TextFont { font: art.font.clone(), font_size: 15., ..default() },
                    TextColor(menu::PAPER),
                    TextLayout::new_with_justify(Justify::Center),
                    menu::native_text_shadow(),
                    Node { max_width: Val::Px(400.), ..default() },
                ));
                dialog.spawn(Node { column_gap: Val::Px(10.), margin: UiRect::top(Val::Px(4.)), ..default() }).with_children(|row| {
                    command(row, art, labels.label("Confirm"), Action::ConfirmLeave, valid_plan(plan, owned, catalog));
                    command(row, art, labels.label("Discard"), Action::DiscardLeave, true);
                    command(row, art, labels.label("Keep editing"), Action::KeepEditing, true);
                });
            });
        });
    }
}
