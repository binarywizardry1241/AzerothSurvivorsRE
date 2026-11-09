//! Hero picker with 0.97.2 shell/class/zone Node stores revalidated from the current EXE.
//! Owning evidence and open comparisons: docs/analysis/home-screen-0.97.2.md.
use crate::{
    assets::MenuArt,
    catalog::MenuCatalog,
    menu::*,
    menu_state::{MenuState, Page},
    preview::HeroPreviewOutput,
};
use bevy::prelude::*;

#[derive(Component)]
pub(crate) struct ZoneList;
#[derive(Component)]
pub(crate) struct ChosenZone;

#[derive(Component)]
pub(crate) struct EnterSweep;

/// Native content invalidation excludes name-only edits from rebuilding
/// the picker and requesting selected-zone visibility. Other Pick fields,
/// entering and the Save change tick retain their structural invalidation.
#[derive(Resource, Default)]
pub(crate) struct ZoneVisibility {
    last_content: Option<PickerContentKey>,
    pending: bool,
}

#[derive(PartialEq)]
struct PickerContentKey {
    hero: crate::save::Hero,
    zone: String,
    heroic_rank: u8,
    hyper: bool,
    entering: bool,
    save_revision: u64,
}

impl ZoneVisibility {
    pub(crate) fn observe_content(
        &mut self,
        pick: crate::save::Pick,
        entering: bool,
        save_revision: u64,
    ) {
        let content = PickerContentKey {
            hero: pick.hero,
            zone: pick.zone,
            heroic_rank: pick.heroic_rank,
            hyper: pick.hyper,
            entering,
            save_revision,
        };
        if self.last_content.as_ref() != Some(&content) {
            self.last_content = Some(content);
            self.pending = true;
        }
    }
}

#[derive(Component)]
pub(crate) struct HeroNameText;
#[derive(Component)]
pub(crate) struct HeroNameCaret;
#[derive(Component)]
pub(crate) struct HeroNameFrame;
#[derive(Component)]
pub(crate) struct HeroNameButton;

/// 0.109.0 140067b70; the name, excluding its caret, supplies the character count.
fn hero_name_font_size(name: &str) -> f32 {
    let count = name.chars().count();
    if count < 13 {
        23.0
    } else {
        23.0 * (1.0 + (count as f32 - 12.0) * -0.03)
    }
}

/// Native 140079a0f..140079f5c updates the retained name Text and its child font.
/// Keeping these entities also preserves the laid-out portrait and preview size.
pub(crate) fn sync_name(
    state: Res<MenuState>,
    mut names: Query<(&mut Text, &mut TextFont), With<HeroNameText>>,
    mut carets: Query<
        (&mut TextSpan, &mut TextFont),
        (With<HeroNameCaret>, Without<HeroNameText>),
    >,
    mut frames: Query<
        &mut BorderColor,
        (With<HeroNameFrame>, Without<HeroNameButton>),
    >,
    mut buttons: Query<
        (&mut Face, &Interaction, &mut BorderColor),
        With<HeroNameButton>,
    >,
) {
    let font_size = hero_name_font_size(&state.name);
    for (mut text, mut font) in &mut names {
        if text.0 != state.name {
            text.0.clone_from(&state.name);
        }
        if font.font_size != font_size {
            font.font_size = font_size;
        }
    }
    for (mut text, mut font) in &mut carets {
        let caret = if state.name_focused { "|" } else { "" };
        if text.0 != caret {
            text.0 = caret.into();
        }
        if font.font_size != font_size {
            font.font_size = font_size;
        }
    }
    let edge = BorderColor::all(if state.name_focused { GOLD } else { EDGE });
    for mut border in &mut frames {
        if *border != edge {
            *border = edge;
        }
    }
    for (mut face, interaction, mut border) in &mut buttons {
        if face.selected != state.name_focused {
            face.selected = state.name_focused;
            *border = BorderColor::all(if face.selected || *interaction != Interaction::None {
                GOLD
            } else {
                EDGE
            });
        }
    }
}

/// Native 0.97.2 140096af0: one pending adjustment after rebuilding the picker.
pub(crate) fn keep_selected_visible(
    mut request: ResMut<ZoneVisibility>,
    mut lists: Query<(&ComputedNode, &UiGlobalTransform, &mut ScrollPosition), With<ZoneList>>,
    chosen: Query<(&ComputedNode, &UiGlobalTransform), With<ChosenZone>>,
) {
    let (Ok((viewport, view_transform, mut scroll)), Ok((card, card_transform))) =
        (lists.single_mut(), chosen.single())
    else {
        return;
    };
    if !request.pending || viewport.size.y <= 0. || card.size.y <= 0. {
        return;
    }
    request.pending = false;
    let top = |node: &ComputedNode, transform: &UiGlobalTransform| {
        transform.affine().transform_point2(node.size * -0.5).y
    };
    let scale = viewport.inverse_scale_factor;
    let relative = (top(card, card_transform) - top(viewport, view_transform)) * scale;
    let visible = viewport.size.y * scale;
    let height = card.size.y * scale;
    let delta = if relative < 0. {
        relative
    } else if relative + height > visible {
        (relative + height - visible).min(relative)
    } else {
        return;
    };
    let maximum = ((viewport.content_size.y - viewport.size.y) * scale).max(0.);
    scroll.0.y = (scroll.0.y + delta).clamp(0., maximum);
}

fn column(gap: f32) -> Node {
    Node {
        flex_direction: FlexDirection::Column,
        row_gap: Val::Px(gap),
        ..default()
    }
}
fn row(gap: f32) -> Node {
    Node {
        column_gap: Val::Px(gap),
        align_items: AlignItems::Center,
        ..default()
    }
}
fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    color: Color,
    title: bool,
) {
    text_in_node(ui, art, value, size, color, title, Node::default());
}
fn text_in_node(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    color: Color,
    title: bool,
    node: Node,
) {
    ui.spawn((
        Text::new(value.into()),
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
        native_text_shadow(),
        node,
    ));
}
fn image(ui: &mut ChildSpawnerCommands, art: &MenuArt, key: &str, node: Node) {
    if let Some(handle) = art.icons.get(key) {
        ui.spawn((ImageNode::new(handle.clone()), node));
    }
}
fn class_image(ui: &mut ChildSpawnerCommands, art: &MenuArt, class: &str, node: Node, tint: Color) {
    // 0x14011a2a0 uses pixel Rects in UI-CharacterCreate-Classes, not ClassDef.icon.
    // Column edges are literally [0,64,127,190,253] in the original PE.
    let (column, y) = match class {
        "warrior" => (0, 0.),
        "mage" => (1, 0.),
        "rogue" => (2, 0.),
        "druid" => (3, 0.),
        "hunter" => (0, 64.),
        "shaman" => (1, 64.),
        "priest" => (2, 64.),
        "warlock" => (3, 64.),
        "paladin" => (0, 128.),
        _ => return,
    };
    let edges = [0., 64., 127., 190., 253.];
    if let Some(atlas) = art.icons.get("class.atlas") {
        ui.spawn((
            ImageNode {
                color: tint,
                rect: Some(Rect::new(edges[column], y, edges[column + 1], y + 64.)),
                ..ImageNode::new(atlas.clone())
            },
            node,
        ));
    }
}
fn clickable(
    ui: &mut ChildSpawnerCommands,
    action: Action,
    node: Node,
    selected: bool,
    primary: bool,
    disabled: bool,
    children: impl FnOnce(&mut ChildSpawnerCommands),
) -> Entity {
    ui.spawn((
        Button,
        action,
        Face {
            selected,
            primary,
            disabled,
        },
        node,
        BackgroundColor(if primary {
            Color::srgb(0.19, 0.025, 0.018)
        } else {
            DARK
        }),
        BorderColor::all(if selected { GOLD } else { EDGE }),
    ))
    .with_children(children)
    .id()
}
fn border(mut node: Node, width: f32, radius: f32) -> Node {
    node.border = UiRect::all(Val::Px(width));
    node.border_radius = BorderRadius::all(Val::Px(radius));
    node
}
fn pane(
    ui: &mut ChildSpawnerCommands,
    grow: f32,
    children: impl FnOnce(&mut ChildSpawnerCommands),
) {
    // 0x14011a470/11dd10/11cbd0. The common panel helper adds its frame.
    let node = border(
        Node {
            flex_grow: grow,
            flex_basis: Val::Px(0.),
            min_height: Val::Px(0.),
            padding: UiRect::axes(Val::Px(18.), Val::Px(14.)),
            ..column(12.)
        },
        1.,
        10.,
    );
    native_panel(ui, node, children);
}
fn section(ui: &mut ChildSpawnerCommands, art: &MenuArt, title: &str) {
    // 0x1401e83a0: shared 22px heading with flanking rules.
    ui.spawn(Node {
        width: Val::Percent(100.),
        ..row(12.)
    })
    .with_children(|line| {
        line.spawn((
            Node {
                height: Val::Px(1.),
                flex_grow: 1.,
                ..default()
            },
            BackgroundColor(EDGE),
        ));
        text(line, art, title, 22., GOLD, true);
        line.spawn((
            Node {
                height: Val::Px(1.),
                flex_grow: 1.,
                ..default()
            },
            BackgroundColor(EDGE),
        ));
    });
}
fn rule(ui: &mut ChildSpawnerCommands) {
    ui.spawn((
        Node {
            width: Val::Percent(100.),
            height: Val::Px(1.),
            ..default()
        },
        // 0a1700: transparent→GOLD alpha.25→transparent, height1.
        BackgroundGradient::from(LinearGradient {
            angle: std::f32::consts::FRAC_PI_2,
            stops: vec![
                Color::linear_rgba(0.973, 0.824, 0.416, 0.).into(),
                Color::linear_rgba(0.973, 0.824, 0.416, 0.25).into(),
                Color::linear_rgba(0.973, 0.824, 0.416, 0.).into(),
            ],
            ..default()
        }),
    ));
}

#[derive(Clone, Copy, Default, PartialEq, Eq)]
pub(crate) enum EntryAvailability {
    #[default]
    Available,
    WaitingForPlayers,
    WaitingForHost,
}

pub(crate) fn build(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    catalog: &MenuCatalog,
    state: &MenuState,
    preview: &HeroPreviewOutput,
    armory: &crate::armory::ArmoryCatalog,
    entry: EntryAvailability,
) {
    // 0x140207f90 supplies the entire picker flow; only overlays live outside it.
    ui.spawn(Node {
        width: Val::Percent(100.),
        height: Val::Percent(100.),
        padding: UiRect::axes(Val::Px(48.), Val::Px(18.)),
        align_items: AlignItems::Center,
        ..column(14.)
    })
    .with_children(|root| {
        root.spawn(Node {
            align_items: AlignItems::Center,
            ..column(2.)
        })
        .with_children(|header| {
            // 0x140205500: title54, tab15, tab padding14/5, border1/radius5.
            text(header, art, &catalog.title, 54., GOLD, true);
            header.spawn(row(8.)).with_children(|tabs| {
                for (page, _) in Page::TABS {
                    let title = catalog.label(crate::localization::tab_key(page));
                    clickable(
                        tabs,
                        Action::Page(page),
                        border(
                            Node {
                                padding: UiRect::axes(Val::Px(14.), Val::Px(5.)),
                                ..row(0.)
                            },
                            1.,
                            5.,
                        ),
                        false,
                        false,
                        false,
                        |button| text(button, art, title, 15., GOLD, false),
                    );
                }
            });
        });
        root.spawn(Node {
            width: Val::Percent(100.),
            flex_grow: 1.,
            min_height: Val::Px(0.),
            column_gap: Val::Px(22.),
            ..default()
        })
        .with_children(|panes| {
            pane(panes, 1., |body| classes(body, art, catalog, state));
            pane(panes, 1.18, |body| {
                hero(body, art, catalog, state, preview, armory)
            });
            pane(panes, 1., |body| zones(body, art, catalog, state));
        });
        footer(root, art, catalog, state, entry);
    });
}
fn classes(ui: &mut ChildSpawnerCommands, art: &MenuArt, catalog: &MenuCatalog, state: &MenuState) {
    let class = &catalog.classes[state.class];
    section(ui, art, catalog.label("picker.class"));
    ui.spawn(Node {
        display: Display::Grid,
        grid_template_columns: RepeatedGridTrack::auto(3),
        row_gap: Val::Px(12.),
        column_gap: Val::Px(22.),
        padding: UiRect::vertical(Val::Px(4.)),
        align_self: AlignSelf::Center,
        justify_content: JustifyContent::Center,
        ..default()
    })
    .with_children(|grid| {
        for (index, class) in catalog.classes.iter().enumerate() {
            grid.spawn(Node {
                align_items: AlignItems::Center,
                ..column(5.)
            })
            .with_children(|tile| {
                // 60px is the literal argument at0x1401fd8dd, not a screenshot estimate.
                let selected = index == state.class;
                let icon = clickable(
                    tile,
                    Action::Class(index),
                    border(
                        Node {
                            width: Val::Px(60.),
                            height: Val::Px(60.),
                            ..default()
                        },
                        2.,
                        8.,
                    ),
                    selected,
                    false,
                    false,
                    |button| {
                        class_image(
                            button,
                            art,
                            &class.key,
                            Node {
                                width: Val::Percent(100.),
                                height: Val::Percent(100.),
                                ..default()
                            },
                            if selected {
                                Color::WHITE
                            } else {
                                Color::srgb(0.74, 0.72, 0.68)
                            },
                        )
                    },
                );
                // 1ffe50: selected scale1.06 and class-color glow; otherwise black drop shadow.
                tile.commands_mut().entity(icon).insert((
                    crate::hover::NativeHover::new(
                        if selected {
                            GOLD
                        } else {
                            Color::srgb(0.169, 0.129, 0.071)
                        },
                        if selected { GOLD } else { BUTTON_EDGE },
                        2.,
                    ),
                    UiTransform::from_scale(Vec2::splat(if selected { 1.06 } else { 1.0 })),
                    BoxShadow::new(
                        if selected {
                            Color::linear_rgba(class.color[0], class.color[1], class.color[2], 0.75)
                        } else {
                            Color::linear_rgba(0., 0., 0., 0.85)
                        },
                        Val::Px(0.),
                        Val::Px(if selected { 0. } else { 4. }),
                        Val::Px(if selected { 2. } else { 0. }),
                        Val::Px(if selected { 16. } else { 10. }),
                    ),
                ));
                // Current 0x140244c40 writes TextLayout { Left, NoWrap } at
                // 0x1402455db. CJK class names use this same single-line label.
                tile.spawn((
                    Text::new(class.name.clone()),
                    TextFont {
                        font: art.font.clone(),
                        font_size: 12.,
                        ..default()
                    },
                    TextColor(if selected {
                        Color::srgb(class.color[0], class.color[1], class.color[2])
                    } else {
                        MUTED
                    }),
                    TextLayout::new_with_no_wrap(),
                    native_text_shadow(),
                ));
            });
        }
    });
    rule(ui);
    text(
        ui,
        art,
        &class.name,
        22.,
        Color::srgb(class.color[0], class.color[1], class.color[2]),
        false,
    );
    // 1fde45 and1fdff9: native blurb is MUTED Text with min-height40.
    text_in_node(
        ui,
        art,
        &class.blurb,
        15.,
        MUTED,
        false,
        Node {
            min_height: Val::Px(40.),
            ..default()
        },
    );
    ui.spawn(row(8.)).with_children(|stats| {
        for (name, value) in [
            (
                catalog.label("picker.health"),
                format!("{}", class.base_health as u32),
            ),
            (
                catalog.label("picker.starts_with"),
                class.starting_spell.clone(),
            ),
            (
                catalog.label("picker.zones_open"),
                crate::localization::format(
                    catalog,
                    "picker.zones_open_value",
                    &[
                        ("n", state.open_zones().to_string()),
                        ("total", catalog.zones.len().to_string()),
                    ],
                ),
            ),
        ] {
            stats
                .spawn((
                    border(
                        Node {
                            flex_grow: 1.,
                            flex_basis: Val::Px(0.),
                            padding: UiRect::axes(Val::Px(9.), Val::Px(6.)),
                            ..column(0.)
                        },
                        1.,
                        6.,
                    ),
                    BackgroundColor(Color::srgba(0., 0., 0., 0.4)),
                    BorderColor::all(Color::srgb(0.227, 0.180, 0.094)),
                ))
                .with_children(|stat| {
                    text(stat, art, name, 11., MUTED, false);
                    text(stat, art, value, 16., PAPER, false);
                });
        }
    });
    text(
        ui,
        art,
        catalog.label("picker.spell_pool"),
        11.,
        MUTED,
        false,
    );
    ui.spawn(Node {
        flex_wrap: FlexWrap::Wrap,
        column_gap: Val::Px(5.),
        row_gap: Val::Px(5.),
        ..default()
    })
    .with_children(|spells| {
        for key in &class.spell_keys {
            let starting = *key == class.starting_spell_key;
            let Some(tooltip) = crate::ability_tooltip::picker(key, catalog, starting) else {
                continue;
            };
            let resting = if starting { GOLD } else { Color::BLACK };
            let mut icon = spells.spawn((
                Interaction::None,
                tooltip,
                UiTransform::default(),
                crate::hover::NativeHover::new(resting, Color::srgb(1., 0.914, 0.659), 1.),
                border(
                    Node {
                        width: Val::Px(34.),
                        height: Val::Px(34.),
                        ..default()
                    },
                    if starting { 2. } else { 1. },
                    4.,
                ),
                BorderColor::all(resting),
            ));
            if let Some(handle) = art.icons.get(key) {
                icon.insert(ImageNode {
                    color: Color::srgb(0.74, 0.72, 0.68),
                    ..ImageNode::new(handle.clone())
                });
            }
        }
    });
}
fn hero(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    catalog: &MenuCatalog,
    state: &MenuState,
    preview: &HeroPreviewOutput,
    armory: &crate::armory::ArmoryCatalog,
) {
    let class = &catalog.classes[state.class];
    let race = catalog
        .races
        .iter()
        .find(|race| race_id_for(&race.key) == state.race);
    let faction = race.map(|r| r.faction.as_str()).unwrap_or("ALLIANCE");
    let alliance = faction.eq_ignore_ascii_case("alliance");
    let faction_label = catalog.label(if alliance {
        "picker.alliance"
    } else {
        "picker.horde"
    });
    let gear = crate::armory::GearSave::read_for(&state.save, state.class_id(), state.race);
    let gear_class = armory.class(state.class_id());
    ui.spawn(Node {
        padding: UiRect::top(Val::Px(6.)),
        ..row(18.)
    })
    .with_children(|header| {
        header
            .spawn((
                border(
                    Node {
                        width: Val::Px(124.),
                        height: Val::Px(168.),
                        flex_shrink: 0.,
                        ..default()
                    },
                    2.,
                    12.,
                ),
                ImageNode {
                    color: if matches!(state.dialog, Some(crate::menu_state::Dialog::CoopInspect(_))) {
                        Color::NONE
                    } else {
                        Color::WHITE
                    },
                    ..ImageNode::new(preview.image.clone())
                },
                BackgroundColor(Color::BLACK),
                BorderColor::all(EDGE),
                PreviewInteraction,
                bevy::ui::RelativeCursorPosition::default(),
            ))
            .with_children(|portrait| {
                portrait
                    .spawn((
                        border(
                            Node {
                                position_type: PositionType::Absolute,
                                left: Val::Px(-8.),
                                top: Val::Px(-6.),
                                padding: UiRect::axes(Val::Px(7.), Val::Px(1.)),
                                ..default()
                            },
                            1.,
                            10.,
                        ),
                        BackgroundColor(DARK),
                        BorderColor::all(EDGE),
                    ))
                    .with_children(|badge| {
                        text(
                            badge,
                            art,
                            faction_label,
                            10.,
                            if alliance {
                                Color::srgb(0.4, 0.6, 1.)
                            } else {
                                Color::srgb(0.9, 0.2, 0.15)
                            },
                            false,
                        )
                    });
                portrait
                    .spawn((
                        border(
                            Node {
                                position_type: PositionType::Absolute,
                                right: Val::Px(-6.),
                                bottom: Val::Px(-4.),
                                width: Val::Px(46.),
                                height: Val::Px(46.),
                                ..default()
                            },
                            2.,
                            23.,
                        ),
                        BackgroundColor(DARK),
                        BorderColor::all(EDGE),
                    ))
                    .with_children(|badge| {
                        class_image(
                            badge,
                            art,
                            &class.key,
                            Node {
                                width: Val::Percent(100.),
                                height: Val::Percent(100.),
                                ..default()
                            },
                            Color::WHITE,
                        )
                    });
            });
        header
            .spawn(Node {
                flex_grow: 1.,
                min_width: Val::Px(0.),
                ..column(8.)
            })
            .with_children(|details| {
                details
                    .spawn((
                        border(
                            Node {
                                width: Val::Percent(100.),
                                height: Val::Px(42.),
                                ..row(0.)
                            },
                            1.,
                            6.,
                        ),
                        BackgroundColor(DARK),
                        BorderColor::all(if state.name_focused { GOLD } else { EDGE }),
                        HeroNameFrame,
                    ))
                    .with_children(|entry| {
                        let name_button = clickable(
                            entry,
                            Action::Name,
                            Node {
                                flex_grow: 1.,
                                height: Val::Percent(100.),
                                padding: UiRect::horizontal(Val::Px(10.)),
                                ..row(0.)
                            },
                            state.name_focused,
                            false,
                            false,
                            |field| {
                                let font_size = hero_name_font_size(&state.name);
                                field
                                    .spawn((
                                        HeroNameText,
                                        Text::new(state.name.clone()),
                                        TextFont {
                                            font: art.font.clone(),
                                            font_size,
                                            ..default()
                                        },
                                        TextColor(GOLD),
                                        native_text_shadow(),
                                    ))
                                    .with_children(|name| {
                                        name.spawn((
                                            HeroNameCaret,
                                            TextSpan::new(if state.name_focused { "|" } else { "" }),
                                            TextFont {
                                                font: art.font.clone(),
                                                font_size,
                                                ..default()
                                            },
                                            TextColor(GOLD),
                                        ));
                                    });
                            },
                        );
                        entry.commands().entity(name_button).insert(HeroNameButton);
                        clickable(
                            entry,
                            Action::RandomName,
                            Node {
                                height: Val::Percent(100.),
                                padding: UiRect::horizontal(Val::Px(12.)),
                                border: UiRect::left(Val::Px(1.)),
                                ..row(0.)
                            },
                            false,
                            true,
                            false,
                            |button| {
                                text(
                                    button,
                                    art,
                                    catalog.label("picker.random"),
                                    13.,
                                    GOLD,
                                    false,
                                )
                            },
                        );
                    });
                text(
                    details,
                    art,
                    format!(
                        "{} {}",
                        race.map(|r| r.name.as_str()).unwrap_or("Human"),
                        class.name
                    ),
                    17.,
                    PAPER,
                    false,
                );
                text(
                    details,
                    art,
                    catalog.label(if state.sex == 0 {
                        "common.male"
                    } else {
                        "common.female"
                    }),
                    13.,
                    MUTED,
                    false,
                );
            });
    });
    section(ui, art, catalog.label("picker.equipment"));
    ui.spawn(Node {
        justify_content: JustifyContent::Center,
        ..row(4.)
    })
    .with_children(|equipment| {
        for (native_slot, armory_slot, slot) in [
            (0, 0, "Head"),
            (2, 1, "Shoulder"),
            (4, 2, "Chest"),
            (9, 7, "Hands"),
            (8, 6, "Wrist"),
            (5, 3, "Waist"),
            (6, 4, "Legs"),
            (7, 5, "Feet"),
            (15, 8, "MainHand"),
            (16, 9, "SecondaryHand"),
            (17, 8, "Ranged"),
        ] {
            // 0x1453dff40 admits only slots with a piece in the selected class catalog.
            if !gear_class
                .items
                .iter()
                .any(|piece| piece.slot_id == native_slot)
            {
                continue;
            }
            let icon = gear
                .worn(state.class_id(), armory_slot)
                .and_then(|id| armory.piece(id))
                .map(|piece| format!("gear.{}", piece.display_id(state.race)))
                .unwrap_or_else(|| format!("slot.{slot}"));
            clickable(
                equipment,
                Action::Page(Page::Character),
                border(
                    Node {
                        width: Val::Px(40.),
                        height: Val::Px(40.),
                        flex_shrink: 0.,
                        ..default()
                    },
                    2.,
                    5.,
                ),
                false,
                false,
                false,
                |button| {
                    image(
                        button,
                        art,
                        &icon,
                        Node {
                            width: Val::Percent(100.),
                            height: Val::Percent(100.),
                            ..default()
                        },
                    )
                },
            );
        }
    });
    ui.spawn(row(8.)).with_children(|progress| {
        text(
            progress,
            art,
            catalog.label("picker.collection"),
            10.,
            MUTED,
            false,
        );
        progress.spawn(Node {
            flex_grow: 1.,
            ..default()
        });
        text(
            progress,
            art,
            format!(
                "{} / {}",
                gear.count(armory, state.class_id()),
                gear_class.items.len()
            ),
            10.,
            GOLD,
            false,
        );
    });
    let summary = crate::armory::equipment_summary(&state.save, state.class_id(), armory, catalog);
    let summary_color = if summary.is_some() {
        Color::srgb(0.302, 1., 0.416)
    } else {
        Color::srgb(0.725, 0.663, 0.510)
    };
    text(
        ui,
        art,
        summary.unwrap_or_else(|| catalog.label("picker.no_gear").to_owned()),
        12.,
        summary_color,
        false,
    );
    ui.spawn(Node {
        width: Val::Percent(100.),
        ..row(12.)
    })
    .with_children(|actions| {
        for (title, subtitle, page) in [
            (
                catalog.label("picker.armory"),
                catalog.label("picker.armory_sub").to_owned(),
                Page::Character,
            ),
            (
                catalog.label("picker.talents"),
                crate::localization::format(
                    catalog,
                    "picker.points_of",
                    &[
                        (
                            "n",
                            crate::talents::available_points(&state.save, state.class_id())
                                .to_string(),
                        ),
                        ("max", "51".into()),
                    ],
                ),
                Page::Talents,
            ),
        ] {
            clickable(
                actions,
                Action::Page(page),
                border(
                    Node {
                        flex_grow: 1.,
                        flex_basis: Val::Px(0.),
                        align_items: AlignItems::Center,
                        padding: UiRect::axes(Val::Px(12.), Val::Px(6.)),
                        ..column(0.)
                    },
                    1.,
                    6.,
                ),
                false,
                true,
                false,
                |button| {
                    text(button, art, title, 24., GOLD, true);
                    text(button, art, subtitle, 11., PAPER, false);
                },
            );
        }
    });
    if let Some(race) = race {
        rule(ui);
        ui.spawn(Node {
            align_items: AlignItems::Start,
            ..row(12.)
        })
        .with_children(|racial| {
            let ability = match state.race {
                1 => "perception",
                2 => "blood_fury",
                3 => "stoneform",
                4 => "shadowmeld",
                5 => "will_of_the_forsaken",
                6 => "war_stomp",
                7 => "escape_artist",
                8 => "berserking",
                _ => "perception",
            };
            image(
                racial,
                art,
                ability,
                border(
                    Node {
                        width: Val::Px(44.),
                        height: Val::Px(44.),
                        flex_shrink: 0.,
                        ..default()
                    },
                    1.,
                    6.,
                ),
            );
            racial
                .spawn(Node {
                    min_width: Val::Px(0.),
                    flex_grow: 1.,
                    ..column(3.)
                })
                .with_children(|info| {
                    text(info, art, &race.name, 20., GOLD, false);
                    for line in race.blurb.lines() {
                        text(info, art, format!("• {line}"), 14., PAPER, false);
                    }
                });
        });
    }
}
fn zone_dots(ui: &mut ChildSpawnerCommands, index: usize, count: usize) {
    // 2037e0: one7px marker per zone, filled red through this card's index.
    ui.spawn(Node {
        column_gap: Val::Px(3.),
        ..default()
    })
    .with_children(|dots| {
        for marker in 0..count {
            dots.spawn((
                Node {
                    width: Val::Px(7.),
                    height: Val::Px(7.),
                    border: UiRect::all(Val::Px(1.)),
                    border_radius: BorderRadius::all(Val::Percent(50.)),
                    ..default()
                },
                BorderColor::all(Color::BLACK),
                BackgroundColor(if marker <= index {
                    Color::srgb(1., 0.353, 0.235)
                } else {
                    Color::srgb(0.25, 0.20, 0.14)
                }),
            ));
        }
    });
}

fn zone_enemies(catalog: &MenuCatalog, key: &str) -> String {
    use azeroth_survivors_re::enemies::catalog::ZoneDefinition;

    // 0.141.0 140026ac0 skips flag-1 enemies when building the picker preview.
    ZoneDefinition::by_key(key)
        .into_iter()
        .flat_map(|zone| zone.enemies)
        .filter(|enemy| enemy.flag_4c != 1)
        .map(|enemy| {
            catalog
                .labels
                .get(&format!("enemy.{}", enemy.id))
                .map_or(enemy.name, String::as_str)
        })
        .collect::<Vec<_>>()
        .join(", ")
}

fn zones(ui: &mut ChildSpawnerCommands, art: &MenuArt, catalog: &MenuCatalog, state: &MenuState) {
    section(ui, art, catalog.label("picker.zone"));
    // 0.97.2 24bddf: bounded row, then a Kept ZoneList and shared scrollbar.
    ui.spawn(Node {
        width: Val::Percent(100.),
        flex_grow: 1.,
        min_height: Val::Px(0.),
        column_gap: Val::Px(4.),
        ..default()
    })
    .with_children(|scroll_row| {
        let list = scroll_row
            .spawn((
                Node {
                    flex_grow: 1.,
                    min_height: Val::Px(0.),
                    padding: UiRect::right(Val::Px(4.)),
                    overflow: Overflow::scroll_y(),
                    ..column(4.)
                },
                ScrollPosition::default(),
                ZoneList,
                crate::scrollbar::Kept::new("picker-zones", crate::scrollbar::InputScope::Picker),
            ))
            .with_children(|list| {
                for (index, zone) in catalog.zones.iter().enumerate() {
                    let selected = index == state.zone;
                    let locked = index >= state.open_zones();
                    // 0x140206410 gives unselected min-height38, border2, radius9.
                    let card = clickable(
                        list,
                        Action::Zone(index),
                        border(
                            Node {
                                width: Val::Percent(100.),
                                min_height: Val::Px(if selected { 0. } else { 38. }),
                                // 0.141.0 1403aa82d: the scroll viewport owns height overflow.
                                flex_shrink: 0.,
                                overflow: Overflow::hidden(),
                                ..column(0.)
                            },
                            2.,
                            9.,
                        ),
                        selected,
                        false,
                        locked,
                        |card| {
                            if let Some(handle) = art.icons.get(&zone.key) {
                                card.spawn((
                                    ImageNode {
                                        color: if locked {
                                            Color::srgb(0.16, 0.15, 0.15)
                                        } else {
                                            // 2072dc→144c52bc0 mixes in the base Srgba space.
                                            use bevy::color::Mix;
                                            Color::srgb(0.62, 0.60, 0.58)
                                                .mix(&Color::WHITE, if selected { 0.2 } else { 0. })
                                        },
                                        rect: Some(if selected {
                                            Rect::new(0., 61.44, 512., 409.6)
                                        } else {
                                            Rect::new(0., 204.8, 512., 276.48)
                                        }),
                                        ..ImageNode::new(handle.clone())
                                    },
                                    Node {
                                        position_type: PositionType::Absolute,
                                        width: Val::Percent(100.),
                                        height: Val::Percent(100.),
                                        ..default()
                                    },
                                ));
                            }
                            // Native 207594–207723: a left→right darkening gradient is a
                            // separate absolute child between the opaque image and its text.
                            card.spawn((
                                Node {
                                    position_type: PositionType::Absolute,
                                    width: Val::Percent(100.),
                                    height: Val::Percent(100.),
                                    ..default()
                                },
                                BackgroundGradient::from(LinearGradient {
                                    angle: std::f32::consts::FRAC_PI_2,
                                    stops: vec![
                                        Color::linear_rgba(0., 0., 0., 0.88).into(),
                                        Color::linear_rgba(0., 0., 0., 0.45).into(),
                                        Color::linear_rgba(0., 0., 0., 0.10).into(),
                                    ],
                                    ..default()
                                }),
                            ));
                            card.spawn(Node {
                                width: Val::Percent(100.),
                                padding: UiRect::axes(
                                    Val::Px(if selected { 14. } else { 12. }),
                                    Val::Px(if selected { 7. } else { 1. }),
                                ),
                                ..column(if selected { 2. } else { 0. })
                            })
                            .with_children(|content| {
                                if selected {
                                    content
                                        .spawn(Node {
                                            justify_content: JustifyContent::SpaceBetween,
                                            ..row(10.)
                                        })
                                        .with_children(|header| {
                                            text(header, art, &zone.name, 25., GOLD, true);
                                            zone_dots(header, index, catalog.zones.len());
                                        });
                                } else {
                                    text(
                                        content,
                                        art,
                                        &zone.name,
                                        19.,
                                        if locked {
                                            Color::srgb(0.45, 0.42, 0.37)
                                        } else {
                                            GOLD
                                        },
                                        true,
                                    );
                                }
                                if selected {
                                    text(
                                        content,
                                        art,
                                        &zone.subtitle,
                                        14.,
                                        Color::srgb(1., 0.6, 0.42),
                                        false,
                                    );
                                    text(content, art, &zone.blurb, 13., PAPER, false);
                                    text(
                                        content,
                                        art,
                                        zone_enemies(catalog, &zone.key),
                                        12.,
                                        MUTED,
                                        false,
                                    );
                                    // 20f910: wrapping boss row with top margin3, gaps5/4;
                                    // each native chip has padding7/1, border1 and radius10.
                                    content
                                        .spawn(Node {
                                            flex_wrap: FlexWrap::Wrap,
                                            column_gap: Val::Px(5.),
                                            row_gap: Val::Px(4.),
                                            margin: UiRect::top(Val::Px(3.)),
                                            ..default()
                                        })
                                        .with_children(|bosses| {
                                            for (index, boss) in zone.bosses.iter().enumerate() {
                                                let final_boss = index + 1 == zone.bosses.len();
                                                let border_color = if final_boss {
                                                    Color::srgb(1., 0.604, 0.165)
                                                } else {
                                                    Color::srgb(0.35, 0.16, 0.09)
                                                };
                                                let foreground = if final_boss {
                                                    Color::srgb(1., 0.604, 0.165)
                                                } else {
                                                    Color::srgb(1., 0.69, 0.54)
                                                };
                                                bosses
                                                    .spawn((
                                                        border(
                                                            Node {
                                                                padding: UiRect::axes(
                                                                    Val::Px(7.),
                                                                    Val::Px(1.),
                                                                ),
                                                                ..default()
                                                            },
                                                            1.,
                                                            10.,
                                                        ),
                                                        BorderColor::all(border_color),
                                                        BackgroundColor(Color::srgba(
                                                            0., 0., 0., 0.65,
                                                        )),
                                                    ))
                                                    .with_children(|chip| {
                                                        text(
                                                            chip,
                                                            art,
                                                            format!(
                                                                "{}:00 · {}",
                                                                boss.minute as u32, boss.name
                                                            ),
                                                            11.,
                                                            foreground,
                                                            false,
                                                        );
                                                    });
                                            }
                                        });
                                } else if locked && index > 0 {
                                    let previous = &catalog.zones[index - 1];
                                    text(
                                        content,
                                        art,
                                        crate::localization::format(
                                            catalog,
                                            "picker.locked_zone",
                                            &[
                                                ("boss", previous.boss.clone()),
                                                ("zone", previous.name.clone()),
                                            ],
                                        ),
                                        11.,
                                        Color::srgb(0.45, 0.42, 0.37),
                                        false,
                                    );
                                } else if !locked {
                                    zone_dots(content, index, catalog.zones.len());
                                }
                            });
                        },
                    );
                    if selected {
                        list.commands().entity(card).insert(ChosenZone);
                    }
                    list.commands().entity(card).insert((
                        BorderColor::all(if selected {
                            GOLD
                        } else {
                            Color::srgb(0.169, 0.129, 0.071)
                        }),
                        BackgroundColor(Color::BLACK),
                        BoxShadow::new(
                            if selected {
                                Color::linear_rgba(0.973, 0.824, 0.416, 0.35)
                            } else {
                                Color::linear_rgba(0., 0., 0., 0.85)
                            },
                            Val::Px(0.),
                            Val::Px(if selected { 0. } else { 4. }),
                            Val::Px(0.),
                            Val::Px(if selected { 22. } else { 12. }),
                        ),
                    ));
                    if !locked {
                        list.commands()
                            .entity(card)
                            .insert(crate::hover::NativeHover::new(
                                if selected {
                                    GOLD
                                } else {
                                    Color::srgb(0.169, 0.129, 0.071)
                                },
                                if selected { GOLD } else { BUTTON_EDGE },
                                2.,
                            ));
                    }
                }
            })
            .id();
        crate::scrollbar::spawn(scroll_row, list, 1., crate::scrollbar::InputScope::Picker);
    });
}

// 0.141.0 140148070 updates the strip from the elapsed menu clock.
pub(crate) fn animate_enter_sweep(time: Res<Time>, mut sweeps: Query<&mut Node, With<EnterSweep>>) {
    let phase = (time.elapsed_secs() / 3.2).fract();
    let left = Val::Px(if phase < 0.55 {
        -200.
    } else {
        ((phase - 0.55) / 0.45) * 900. - 200.
    });
    for mut sweep in &mut sweeps {
        if sweep.left != left {
            sweep.left = left;
        }
    }
}

fn footer(ui: &mut ChildSpawnerCommands, art: &MenuArt, catalog: &MenuCatalog, state: &MenuState,
    entry: EntryAvailability) {
    let zone = &catalog.zones[state.zone];
    let hyper = state.hyper_mode();
    ui.spawn(Node {
        align_items: AlignItems::Center,
        ..column(7.)
    })
    .with_children(|footer| {
        footer.spawn(row(18.)).with_children(|actions| {
            let run_options = clickable(
                actions,
                Action::RunOptions,
                border(
                    Node {
                        padding: UiRect::axes(Val::Px(20.), Val::Px(8.)),
                        align_items: AlignItems::Center,
                        ..column(0.)
                    },
                    1.,
                    6.,
                ),
                false,
                true,
                false,
                |button| {
                    text(
                        button,
                        art,
                        catalog.label("picker.run_options"),
                        17.,
                        GOLD,
                        false,
                    );
                    let modified = state.heroic_rank != 0 || hyper;
                    let subtitle = if modified {
                        crate::run_options::difficulty_name(state.heroic_rank, hyper, |key| catalog.label(key))
                    } else {
                        catalog.label("picker.normal_difficulty").to_owned()
                    };
                    text(
                        button,
                        art,
                        subtitle,
                        12.,
                        if modified {
                            Color::srgb(1., 0.353, 0.235)
                        } else {
                            Color::srgb(0.725, 0.663, 0.510)
                        },
                        false,
                    );
                },
            );
            actions.commands().entity(run_options).insert((
                crate::hover::NativeHover::new(BUTTON_EDGE, Color::srgb(1., 0.914, 0.659), 2.),
                native_button_gradient(),
                BoxShadow::new(
                    Color::linear_rgba(0., 0., 0., 0.85),
                    Val::Px(0.),
                    Val::Px(2.),
                    Val::Px(0.),
                    Val::Px(6.),
                ),
            ));
            let enter = clickable(
                actions,
                Action::Enter,
                border(
                    Node {
                        padding: UiRect {
                            left: Val::Px(56.),
                            right: Val::Px(56.),
                            top: Val::Px(10.),
                            bottom: Val::Px(9.),
                        },
                        align_items: AlignItems::Center,
                        overflow: Overflow::hidden(),
                        ..column(0.)
                    },
                    2.,
                    8.,
                ),
                true,
                true,
                entry != EntryAvailability::Available,
                |button| {
                    // 0.141.0 1403a7c1a–1403a7f37: a clipped gradient child behind the text.
                    button.spawn((
                        EnterSweep,
                        Node {
                            position_type: PositionType::Absolute,
                            left: Val::Px(-200.),
                            top: Val::Px(0.),
                            bottom: Val::Px(0.),
                            width: Val::Px(120.),
                            ..default()
                        },
                        BackgroundGradient::from(LinearGradient {
                            angle: std::f32::consts::FRAC_PI_2,
                            stops: vec![
                                Color::NONE.into(),
                                Color::linear_rgba(1., 0.9, 0.63, 0.3).into(),
                                Color::NONE.into(),
                            ],
                            ..default()
                        }),
                    ));
                    text(
                        button,
                        art,
                        crate::localization::format(
                            catalog,
                            match entry {
                                EntryAvailability::WaitingForPlayers => "Waiting for players",
                                EntryAvailability::WaitingForHost => "Waiting for the host",
                                EntryAvailability::Available if state.entering => "picker.entering",
                                EntryAvailability::Available => "picker.enter",
                            },
                            &[("zone", zone.name.clone())],
                        ),
                        32.,
                        GOLD,
                        true,
                    );
                    let hint = match entry {
                        EntryAvailability::WaitingForPlayers => catalog
                            .label("Co-op needs at least two players. Share your lobby code.")
                            .to_owned(),
                        EntryAvailability::WaitingForHost => catalog
                            .label("You come along when the host enters the zone.")
                            .to_owned(),
                        EntryAvailability::Available => crate::localization::format(
                            catalog,
                            "picker.awaits",
                            &[
                                ("subtitle", zone.subtitle.clone()),
                                ("boss", zone.boss.clone()),
                                ("minute", if hyper { (zone.minute as f32 * 0.5).to_string() } else { zone.minute.to_string() }),
                            ],
                        ),
                    };
                    text(button, art, hint, 13., PAPER, false);
                },
            );
            actions.commands().entity(enter).insert((
                crate::hover::NativeHover::new(GOLD, Color::srgb(1., 0.914, 0.659), 2.),
                // 204133–20424f: native Enter has its own three-stop red gradient.
                BackgroundGradient::from(LinearGradient {
                    angle: std::f32::consts::PI,
                    stops: vec![
                        Color::linear_rgba(0.478, 0.102, 0.063, 1.).into(),
                        Color::linear_rgba(0.227, 0.031, 0.024, 1.).into(),
                        Color::linear_rgba(0.133, 0.016, 0.016, 1.).into(),
                    ],
                    ..default()
                }),
                BoxShadow::new(
                    Color::linear_rgba(1., 0.42, 0.1, 0.35),
                    Val::Px(0.),
                    Val::Px(0.),
                    Val::Px(2.),
                    Val::Px(30.),
                ),
            ));
            crate::coop_ui::picker_button(actions, art);
        });
        text(
            footer,
            art,
            catalog.label("picker.controls_hint"),
            13.,
            MUTED,
            false,
        );
    });
}
