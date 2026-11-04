//! Read-only inspection of the current roster subject and its wire17 appendix.
use azeroth_survivors_re::coop::server_party::NativeInspection;
use bevy::{prelude::*, ui::FocusPolicy};

use crate::{
    armory::{self, ArmoryCatalog, GearSave},
    assets::MenuArt,
    canvas::NativeCanvas,
    catalog::MenuCatalog,
    menu::{self, DARK, EDGE, GOLD, MUTED, PAPER},
    menu_state::{Dialog, MenuState},
    options::OptionsState,
    preview::HeroPreviewOutput,
    progression,
    talents::{self, TalentArt, TalentCatalog, TreeMode},
    tooltip::{InspectionTooltip, NativeTooltip},
};

use super::{CoopUi, HeroRow};

#[derive(Clone, Copy, Default, PartialEq, Eq)]
enum Tab {
    #[default]
    Character,
    Talents,
    Achievements,
}

#[derive(Component, Clone, Copy)]
enum Click {
    Close,
    Tab(Tab),
}

#[derive(Component)]
struct Root;

#[derive(Resource, Default)]
pub(super) struct View {
    identity: Option<u64>,
    tab: Tab,
}

#[derive(Clone)]
struct Subject {
    identity: u64,
    name: String,
    class: u8,
    race: u8,
    data: Option<NativeInspection>,
    achievement_points: u32,
    host: bool,
    me: bool,
    tab: Tab,
}

impl Subject {
    fn matches(&self, hero: &HeroRow, tab: Tab) -> bool {
        self.identity == hero.hero_identity
            && self.name == hero.name
            && self.class == hero.class_id
            && self.race == hero.race
            && self.data == hero.inspection
            && self.tab == tab
            && self.achievement_points == hero.achievement_points
            && self.host == hero.host
            && self.me == hero.me
    }
}

pub(super) fn input(
    mut state: ResMut<MenuState>,
    mut view: ResMut<View>,
    coop: Res<CoopUi>,
    options: Res<OptionsState>,
    time: Res<Time>,
    actions: Query<(&Click, &Interaction), Changed<Interaction>>,
) {
    if !matches!(state.dialog, Some(Dialog::CoopInspect(_)))
        || state.in_run
        || state.entering
        || options.open
        || coop.ready_modal_visible(time.elapsed_secs())
    {
        return;
    }
    for (&action, &interaction) in &actions {
        if interaction != Interaction::Pressed {
            continue;
        }
        match action {
            Click::Close => {
                state.close_dialog();
                return;
            }
            Click::Tab(tab) => view.tab = tab,
        }
    }
}

pub(super) fn rebuild(
    mut commands: Commands,
    mut state: ResMut<MenuState>,
    mut view: ResMut<View>,
    coop: Res<CoopUi>,
    art: Res<MenuArt>,
    labels: Res<MenuCatalog>,
    armory: Res<ArmoryCatalog>,
    preview: Res<HeroPreviewOutput>,
    definitions: Res<TalentCatalog>,
    images: Res<TalentArt>,
    achievement_art: Res<progression::Art>,
    roots: Query<Entity, With<Root>>,
    mut drawn: Local<Option<Subject>>,
) {
    let Some(Dialog::CoopInspect(identity)) = state.dialog else {
        if drawn.take().is_some() {
            for root in &roots {
                commands.entity(root).despawn();
            }
        }
        view.identity = None;
        return;
    };
    let Some(hero) = coop
        .inspection_target(identity)
        .filter(|_| !state.in_run && !state.entering)
    else {
        for root in &roots {
            commands.entity(root).despawn();
        }
        *drawn = None;
        view.identity = None;
        state.close_dialog();
        return;
    };
    if view.identity != Some(identity) {
        view.identity = Some(identity);
        view.tab = Tab::default();
    }
    let tab = view.tab;
    if drawn
        .as_ref()
        .is_some_and(|previous| previous.matches(hero, tab))
        && !labels.is_changed()
        && !art.is_changed()
        && !preview.is_changed()
        && !images.is_changed()
        && !achievement_art.is_changed()
    {
        return;
    }
    for root in &roots {
        commands.entity(root).despawn();
    }
    *drawn = Some(Subject {
        identity,
        name: hero.name.clone(),
        class: hero.class_id,
        race: hero.race,
        data: hero.inspection.clone(),
        tab,
        achievement_points: hero.achievement_points,
        host: hero.host,
        me: hero.me,
    });
    let Some(data) = hero.inspection.as_ref() else {
        return;
    };
    let class = crate::save::CLASS_IDS
        .contains(&hero.class_id)
        .then(|| definitions.class(hero.class_id));
    let ranks = class.map(|class| {
        use crate::save::talents::{MAX_POINTS, decode_allocation, normalize};
        normalize(class, &decode_allocation(&data.talents), MAX_POINTS)
    });
    commands
        .spawn((
            Root,
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                ..default()
            },
            Interaction::None,
            FocusPolicy::Block,
            GlobalZIndex(6080),
            BackgroundColor(Color::srgba(0., 0., 0., 0.72)),
        ))
        .with_children(|root| {
            root.spawn((
                NativeCanvas {
                    design: Vec2::new(1560., 880.),
                    max_scale: 1.5,
                },
                Node {
                    position_type: PositionType::Absolute,
                    width: Val::Px(1560.),
                    height: Val::Px(880.),
                    ..default()
                },
            ))
            .with_children(|canvas| {
                menu::native_panel(
                    canvas,
                    Node {
                        width: Val::Percent(100.),
                        height: Val::Percent(100.),
                        padding: UiRect::axes(Val::Px(28.), Val::Px(18.)),
                        flex_direction: FlexDirection::Column,
                        row_gap: Val::Px(12.),
                        ..default()
                    },
                    |panel| {
                        panel
                            .spawn(Node {
                                width: Val::Percent(100.),
                                column_gap: Val::Px(8.),
                                align_items: AlignItems::Center,
                                ..default()
                            })
                            .with_children(|header| {
                                let class_key = azeroth_survivors_re::coop::game_party::class_key(
                                    hero.class_id,
                                );
                                if let Some(image) = art.icons.get(class_key) {
                                    header.spawn((
                                        ImageNode::new(image.clone()),
                                        Node {
                                            width: Val::Px(58.),
                                            height: Val::Px(58.),
                                            flex_shrink: 0.,
                                            ..default()
                                        },
                                    ));
                                }
                                header
                                    .spawn(Node {
                                        flex_grow: 1.,
                                        flex_direction: FlexDirection::Column,
                                        ..default()
                                    })
                                    .with_children(|caption| {
                                        caption.spawn((
                                            Text::new(&hero.name),
                                            TextFont {
                                                font: art.heading_font.clone(),
                                                font_size: 38.,
                                                ..default()
                                            },
                                            TextColor(GOLD),
                                            menu::native_text_shadow(),
                                        ));
                                        let race = labels
                                            .races
                                            .iter()
                                            .find(|race| menu::race_id_for(&race.key) == hero.race)
                                            .map_or("", |race| race.name.as_str());
                                        let class = labels
                                            .classes
                                            .iter()
                                            .find(|class| class_key == class.key);
                                        let class = class.map_or("", |class| class.name.as_str());
                                        let sex = labels.label(if data.sex == 0 {
                                            "common.male"
                                        } else {
                                            "common.female"
                                        });
                                        let role = match (hero.host, hero.me) {
                                            (true, true) => Some("host (you)"),
                                            (true, false) => Some("host"),
                                            (false, true) => Some("you"),
                                            (false, false) => None,
                                        };
                                        if let Some(role) = role {
                                            super::text(
                                                caption,
                                                &art,
                                                labels.label(role),
                                                14.,
                                                GOLD,
                                            );
                                        }
                                        super::text(
                                            caption,
                                            &art,
                                            format!("{sex} {race} · {class}"),
                                            16.,
                                            MUTED,
                                        );
                                        super::text(
                                            caption,
                                            &art,
                                            labels.label("{n} achievement points").replace(
                                                "{n}",
                                                &hero.achievement_points.to_string(),
                                            ),
                                            16.,
                                            MUTED,
                                        );
                                    });
                                for (page, key) in [
                                    (Tab::Character, "armory.tab.character"),
                                    (Tab::Talents, "picker.talents"),
                                    (Tab::Achievements, "armory.tab.achievements"),
                                ] {
                                    let title = labels.label(key);
                                    let text = if page == Tab::Talents
                                        && let Some((class, ranks)) = class.zip(ranks.as_ref())
                                    {
                                        let spent = crate::save::talents::spent(class, ranks);
                                        format!("{title} ({spent})")
                                    } else {
                                        title.to_owned()
                                    };
                                    armory::header_button(
                                        header,
                                        &art,
                                        &text,
                                        Click::Tab(page),
                                        tab == page,
                                        16.,
                                    );
                                }
                                armory::header_button(
                                    header,
                                    &art,
                                    labels.label("Close"),
                                    Click::Close,
                                    true,
                                    16.,
                                );
                            });
                        match tab {
                            Tab::Character => {
                                equipment(panel, &art, &labels, &armory, &preview, hero, data)
                            }
                            Tab::Talents => {
                                if let Some((class, ranks)) = class.zip(ranks.as_ref()) {
                                    talent_trees(panel, &art, &labels, &images, class, ranks, data);
                                }
                            }
                            Tab::Achievements => progression::draw_inspection_achievements(
                                panel,
                                &art,
                                &achievement_art,
                                &labels,
                                &data.achievements,
                            ),
                        }
                    },
                );
            });
        });
}

fn equipment(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    labels: &MenuCatalog,
    catalog: &ArmoryCatalog,
    preview: &HeroPreviewOutput,
    hero: &HeroRow,
    data: &NativeInspection,
) {
    let gear = armory::coop_gear(
        hero.class_id,
        hero.race,
        &data.equipped,
        &data.looks,
        &data.stars,
    );
    let outfitted = gear.menu_outfit(catalog, hero.class_id, hero.race);
    ui.spawn(Node {
        column_gap: Val::Px(14.),
        flex_grow: 1.,
        min_height: Val::Px(0.),
        ..default()
    })
    .with_children(|row| {
        let slots = |ui: &mut ChildSpawnerCommands, slots: [usize; 5]| {
            ui.spawn(Node {
                width: Val::Px(290.),
                flex_shrink: 0.,
                row_gap: Val::Px(12.),
                flex_direction: FlexDirection::Column,
                ..default()
            })
            .with_children(|column| {
                for slot in slots {
                    equipment_slot(
                        column,
                        art,
                        labels,
                        catalog,
                        hero,
                        data,
                        &gear,
                        outfitted[slot],
                        slot,
                    );
                }
            });
        };
        slots(row, [0, 2, 14, 4, 8]);
        row.spawn(Node {
            flex_grow: 1.,
            min_height: Val::Px(0.),
            row_gap: Val::Px(8.),
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::Center,
            ..default()
        })
        .with_children(|center| {
            center.spawn((
                ImageNode::new(preview.image.clone()),
                menu::InspectPreview,
                menu::PreviewInteraction,
                Interaction::None,
                Node {
                    width: Val::Px(440.),
                    height: Val::Px(560.),
                    flex_shrink: 0.,
                    ..default()
                },
            ));
            center
                .spawn(Node {
                    align_items: AlignItems::Center,
                    column_gap: Val::Px(10.),
                    ..default()
                })
                .with_children(|turn| {
                    let rate = crate::preview::TURN_RADIANS_PER_SECOND;
                    armory::image_control(
                        turn,
                        art,
                        "armory.turn_left",
                        (menu::PreviewTurnRate(-rate), menu::InspectPreview),
                        30.,
                    );
                    super::text(turn, art, labels.label("armory.drag_to_turn"), 12., MUTED);
                    armory::image_control(
                        turn,
                        art,
                        "armory.turn_right",
                        (menu::PreviewTurnRate(rate), menu::InspectPreview),
                        30.,
                    );
                });
            center
                .spawn(Node {
                    column_gap: Val::Px(8.),
                    ..default()
                })
                .with_children(|weapons| {
                    for slot in [15, 16, 17] {
                        equipment_slot(
                            weapons,
                            art,
                            labels,
                            catalog,
                            hero,
                            data,
                            &gear,
                            outfitted[slot],
                            slot,
                        );
                    }
                });
        });
        slots(row, [9, 5, 6, 7, 18]);
        equipment_summary(row, art, labels, catalog, hero.class_id, data, &gear);
    });
}

fn item_name(catalog: &ArmoryCatalog, labels: &MenuCatalog, id: u32, race: u8) -> Option<String> {
    catalog
        .piece(id)
        .map(|piece| armory::piece_name(labels, piece, race))
        .or_else(|| {
            catalog
                .starter_items
                .iter()
                .find(|item| item.id == id)
                .map(|item| armory::starter_name(labels, item).into())
        })
        .or_else(|| {
            armory::cosmetics::get(id).map(|entry| armory::cosmetic_name(labels, entry).into())
        })
}

fn equipment_slot(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    labels: &MenuCatalog,
    catalog: &ArmoryCatalog,
    hero: &HeroRow,
    data: &NativeInspection,
    gear: &GearSave,
    appearance: u32,
    slot: usize,
) {
    let race = hero.race;
    let id = data.equipped[slot];
    let piece = catalog.piece(id);
    let stars = data.stars[slot];
    let slot_key = format!("slot.{slot}");
    let slot_name = if slot == 18 {
        labels.label("Tabard")
    } else if slot == 8 {
        labels.label("Wrist")
    } else {
        labels.label(&slot_key)
    };
    let name = item_name(catalog, labels, id, race)
        .or_else(|| item_name(catalog, labels, appearance, race))
        .unwrap_or_else(|| slot_name.into());
    let subtitle = if piece.is_some() {
        crate::localization::format(
            labels,
            "armory.stars",
            &[("n", stars.to_string()), ("of", "5".into())],
        )
    } else {
        slot_name.to_owned()
    };
    let mut body = Vec::new();
    if let Some(piece) = piece {
        body.push(labels.label("armory.card_bonuses").into());
        body.extend(
            piece
                .effects_at_stars(stars)
                .into_iter()
                .map(|(tag, value)| armory::localized_bonus(labels, u32::from(tag), value)),
        );
        if piece.slot < 8 {
            let worn = data
                .equipped
                .iter()
                .filter_map(|id| catalog.piece(*id))
                .filter(|row| row.slot < 8 && row.rarity == piece.rarity)
                .count();
            body.push(format!(
                "{} ({worn}/8)",
                armory::set_name(labels, hero.class_id, piece.rarity)
            ));
            set_bonuses(
                &mut body,
                labels,
                catalog,
                hero.class_id,
                gear,
                piece.rarity,
                false,
            );
        }
    }
    if let Some(shown) = data.looks[slot] {
        body.push(if shown == 0 {
            labels.label("Hidden: the hero shows nothing here.").into()
        } else if let Some(look) = item_name(catalog, labels, shown, race) {
            labels.label("Shown as {name}").replace("{name}", &look)
        } else {
            labels.label("Shown as another piece.").into()
        });
    }
    ui.spawn((
        Button,
        Node {
            column_gap: Val::Px(8.),
            padding: UiRect::axes(Val::Px(8.), Val::Px(6.)),
            align_items: AlignItems::Center,
            border: UiRect::all(Val::Px(1.)),
            ..default()
        },
        BackgroundColor(DARK),
        BorderColor::all(EDGE),
        InspectionTooltip,
        NativeTooltip {
            title: name.clone(),
            subtitle: subtitle.clone(),
            body: body.join("\n"),
        },
    ))
    .with_children(|cell| {
        if let Some(icon) = catalog
            .appearance(if id != 0 { id } else { appearance }, race)
            .and_then(|item| art.icons.get(&format!("gear.{}", item.display_id)))
        {
            cell.spawn((
                ImageNode::new(icon.clone()),
                Node {
                    width: Val::Px(50.),
                    height: Val::Px(50.),
                    flex_shrink: 0.,
                    ..default()
                },
            ));
        }
        cell.spawn(Node {
            flex_direction: FlexDirection::Column,
            ..default()
        })
        .with_children(|labels| {
            super::text(labels, art, name, 14., PAPER);
            super::text(labels, art, subtitle, 12., MUTED);
        });
    });
}

fn set_bonuses(
    out: &mut Vec<String>,
    labels: &MenuCatalog,
    catalog: &ArmoryCatalog,
    class: u8,
    gear: &GearSave,
    tier: usize,
    active_only: bool,
) {
    let (one, three, empowered) = armory::worn_set_progress(catalog, gear, class, tier);
    let four = armory::set_four_bonus(labels, class, tier as u8);
    let eight = armory::set_eight_bonus(labels, class, tier as u8, empowered);
    for (need, have, text) in [(4, one, Some(four)), (8, three, eight)] {
        if (!active_only || have >= need)
            && let Some(text) = text.filter(|text| !text.is_empty())
        {
            out.push(format!("({}/{need}) {text}", have.min(need)));
        }
    }
}

fn equipment_summary(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    labels: &MenuCatalog,
    catalog: &ArmoryCatalog,
    class: u8,
    data: &NativeInspection,
    gear: &GearSave,
) {
    menu::native_panel(
        ui,
        Node {
            width: Val::Px(380.),
            flex_shrink: 0.,
            flex_direction: FlexDirection::Column,
            row_gap: Val::Px(8.),
            padding: UiRect::all(Val::Px(12.)),
            ..default()
        },
        |side| {
            crate::codex::section_heading(side, art, labels.label("picker.equipment"));
            let pieces = data
                .equipped
                .iter()
                .filter(|id| catalog.piece(**id).is_some())
                .count();
            let total: u32 = data.stars.iter().map(|rank| u32::from(*rank)).sum();
            super::text(side, art, total.to_string(), 34., GOLD);
            super::text(
                side,
                art,
                crate::localization::format(
                    labels,
                    "of {most} stars on {n} pieces",
                    &[
                        ("most", (pieces * 5).to_string()),
                        ("n", pieces.to_string()),
                    ],
                ),
                12.,
                MUTED,
            );
            let mut bonuses = Vec::new();
            for tier in [
                0,
                1,
                2,
                3,
                4,
                5,
                usize::from(azeroth_survivors_re::sets::TIER_HALF),
            ] {
                set_bonuses(&mut bonuses, labels, catalog, class, gear, tier, true);
            }
            if !bonuses.is_empty() {
                crate::codex::section_heading(side, art, labels.label("Set bonuses"));
                for line in bonuses {
                    super::text(side, art, line, 14., PAPER);
                }
            }
            if let Some(sum) = armory::equipment_summary_for(gear, class, catalog, labels) {
                crate::codex::section_heading(side, art, labels.label("All together"));
                super::text(side, art, sum, 14., PAPER);
            }
            super::text(
                side,
                art,
                labels.label("Point at a piece to read it."),
                12.,
                MUTED,
            );
        },
    );
}

fn talent_trees(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    labels: &MenuCatalog,
    images: &TalentArt,
    class: &crate::save::talents::TalentClass,
    ranks: &crate::save::talents::Allocation,
    data: &NativeInspection,
) {
    use crate::save::talents::{MAX_POINTS, WHITE_DEVILSAUR_ACHIEVEMENT};
    let keys = crate::coop_profile::achievement_keys();
    let devilsaur = data.achievements.iter().any(|(id, _)| {
        keys.get(usize::from(*id))
            .is_some_and(|key| key == WHITE_DEVILSAUR_ACHIEVEMENT)
    });
    ui.spawn(Node {
        column_gap: Val::Px(14.),
        ..default()
    })
    .with_children(|trees| {
        for (index, tree) in class.trees.iter().enumerate() {
            talents::draw_tree(
                trees,
                art,
                images,
                labels,
                class,
                tree,
                ranks,
                MAX_POINTS,
                None,
                TreeMode::Inspect,
                (class.id == 3 && index == 0).then_some(devilsaur),
            );
        }
    });
}
