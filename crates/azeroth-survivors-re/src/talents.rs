//! Current 0.109.0 between-run talent allocation and saved specifications.
//! Provenance: docs/analysis/talents-page-0.109.0.md.

use std::collections::{BTreeMap, BTreeSet};

use crate::save::talents::{
    Allocation, MAX_POINTS, Talent, TalentClass, TalentTree, budget, can_learn, can_refund,
    exclusive_choice, normalize, previous_rows, rank, spent, tree_spent,
    WHITE_DEVILSAUR, WHITE_DEVILSAUR_ACHIEVEMENT, white_devilsaur,
};
use bevy::{
    prelude::*,
    ui::{FocusPolicy, RelativeCursorPosition},
    window::PrimaryWindow,
};

use crate::{
    assets::{self, MenuArt},
    catalog::MenuCatalog,
    menu::{self, GOLD, MUTED, PAPER},
    menu_state::{MenuState, Page},
    options::OptionsSet,
};

const TREE_WIDTH: f32 = 360.0;
const GRID_HEIGHT: f32 = 520.0;
const ROW_PITCH: f32 = GRID_HEIGHT / 7.0;

pub struct TalentsPlugin;

impl Plugin for TalentsPlugin {
    fn build(&self, app: &mut App) {
        app.insert_resource(TalentCatalog::embedded())
            .init_resource::<TalentArt>()
            .init_resource::<TalentState>()
            .add_systems(Startup, load_art)
            .add_systems(Update, (input, rebuild).chain().after(OptionsSet::Input)
                .in_set(crate::menu_state::AccountInput));
    }
}

#[derive(Resource)]
pub(crate) struct TalentCatalog(crate::save::talents::Catalog);
impl TalentCatalog {
    fn embedded() -> Self {
        Self(crate::save::talents::Catalog::embedded())
    }
    pub(crate) fn class(&self, id: u8) -> &TalentClass {
        self.0.class(id)
    }
}
impl std::ops::Deref for TalentCatalog {
    type Target = crate::save::talents::Catalog;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl Talent {
    fn description(&self, rank: u8, catalog: &MenuCatalog) -> String {
        let rank = rank.max(1).min(self.max_rank) as usize;
        let description = if rank == usize::from(self.max_rank) {
            self.max_rank_description.as_deref().unwrap_or(&self.description)
        } else {
            &self.description
        };
        let text = catalog.label(description);
        let mut text = self.numeric_values
            .get(rank - 1)
            .and_then(Option::as_ref)
            .map(|value| text.replace("{v}", value))
            .unwrap_or_else(|| text.into());
        if let Some(Some(value)) = self.secondary_numeric_values.get(rank - 1) {
            text = text.replace("{v2}", value);
        }
        // Current 0.112.0 formatter appends the Supremacy description for every
        // inspected rank, independently of the currently allocated talents.
        if let Some(template) = &self.supremacy_description {
            let mut extra = catalog.label(template).to_string();
            if let Some(Some(value)) = self.supremacy_numeric_values.get(rank - 1) {
                extra = extra.replace("{v}", value);
            }
            text.push('\n');
            text.push_str(&extra);
        }
        text
    }
}

pub fn available_points(save: &crate::save::Save, class: u8) -> u32 {
    let definitions = TalentCatalog::embedded();
    let class_def = definitions.class(class);
    let earned = budget(save.talent_xp(class)).0;
    let allocation = normalize(class_def, &save.talent_allocation(class), earned);
    earned.saturating_sub(spent(class_def, &allocation))
}

fn talent_center(talent: &Talent) -> Vec2 {
    Vec2::new(
        (f32::from(talent.column) + 0.5) * 90.0,
        (f32::from(talent.row) + 0.5) * ROW_PITCH,
    )
}

/// Current 0.109.0 14010b540: rotate a vertical bar around its center, clipping a
/// combined 46px from the center-to-center length. This handles off-column
/// prerequisites, including the current two Feral capstones.
fn prerequisite_link(
    ui: &mut ChildSpawnerCommands,
    parent: &Talent,
    child: &Talent,
    allocation: &Allocation,
) {
    let start = talent_center(parent);
    let end = talent_center(child);
    let delta = end - start;
    let height = (delta.length() - 46.0).max(0.0);
    let center = (start + end) * 0.5;
    let direction = delta.try_normalize().unwrap_or(Vec2::Y);
    let rotation = (-direction.x).atan2(direction.y);
    let unlocked = rank(allocation, parent) >= parent.max_rank;
    ui.spawn((
        Node {
            border_radius: BorderRadius::all(Val::Px(2.0)),
            ..menu::rect([center.x - 2.0, center.y - height * 0.5, 4.0, height])
        },
        UiTransform::from_rotation(Rot2::radians(rotation)),
        BackgroundColor(if unlocked {
            GOLD
        } else {
            Color::srgb(0.35, 0.30, 0.22)
        }),
        BoxShadow::new(
            if unlocked {
                Color::srgba(0.973, 0.824, 0.416, 0.6)
            } else {
                Color::srgba(0.0, 0.0, 0.0, 0.85)
            },
            Val::Px(0.0),
            Val::Px(0.0),
            Val::Px(0.0),
            Val::Px(6.0),
        ),
    ));
}

#[derive(Resource, Default)]
pub(crate) struct TalentArt {
    images: BTreeMap<String, Handle<Image>>,
}

impl TalentArt {
    pub(crate) fn icon(&self, key: &str) -> Option<&Handle<Image>> {
        self.images.get(key)
    }
}

#[derive(Resource, Default)]
pub struct TalentState {
    selected: Option<String>,
    signature: String,
    scale: f32,
}

fn load_art(
    definitions: Res<TalentCatalog>,
    mut art: ResMut<TalentArt>,
    mut images: ResMut<Assets<Image>>,
) {
    let Some(directory) = assets::data_directory() else {
        return;
    };
    let Ok(mut chain) = benilla_formats::open_chain(&directory) else {
        return;
    };
    let mut icons = BTreeSet::new();
    for class in &definitions.classes {
        for tree in &class.trees {
            icons.insert(tree.icon.clone());
            icons.extend(tree.talents.iter().map(|talent| talent.icon.clone()));
            for part in ["TopLeft", "TopRight", "BottomLeft", "BottomRight"] {
                let key = format!("{}-{part}", tree.background);
                let path = format!("Interface\\TalentFrame\\{key}.blp");
                if let Ok(image) = assets::read_image(&mut chain, &path) {
                    art.images.insert(key, images.add(image));
                }
            }
        }
    }
    icons.insert("Ability_Hunter_Pet_Raptor".into());
    for icon in icons {
        let path = format!("Interface\\Icons\\{icon}.blp");
        if let Ok(image) = assets::read_image(&mut chain, &path) {
            art.images.insert(icon, images.add(image));
        }
    }
}

#[derive(Component)]
struct Root;
#[derive(Component)]
pub(crate) struct Cell(pub(crate) String);
/// Selectable for inspection, with no allocation-changing action attached.
#[derive(Component)]
pub(crate) struct ReadOnlyCell;
#[derive(Component)]
enum Action {
    Learn(String),
    Refund(String),
    RightRefund(String),
    Reset,
    WhiteDevilsaur,
    Spec(u8),
}

fn input(
    mut state: ResMut<TalentState>,
    mut menu: ResMut<MenuState>,
    definitions: Res<TalentCatalog>,
    mouse: Res<ButtonInput<MouseButton>>,
    cells: Query<(&Interaction, &Cell)>,
    changed_cells: Query<(&Interaction, &Cell), Changed<Interaction>>,
    actions: Query<(&Interaction, &Action), (Changed<Interaction>, With<Button>)>,
) {
    if menu.page != Page::Talents {
        return;
    }
    let class_id = menu.class_id();
    // Current1401184f0 retains inspection on hover-out and visits every
    // changed hovered/pressed cell. Hit testing belongs to the UI focus owner.
    for (interaction, cell) in &changed_cells {
        if *interaction != Interaction::None {
            state.selected = Some(cell.0.clone());
        }
    }
    let class = definitions.class(class_id);
    // Current140117cf0 consumes every changed Pressed action. UI activation
    // has no extra physical-left-button gate; keyboard/touch activation shares it.
    let mut requests = actions
        .iter()
        .filter(|(interaction, _)| **interaction == Interaction::Pressed)
        .map(|(_, action)| match action {
            Action::Learn(key) => Action::Learn(key.clone()),
            Action::Refund(key) => Action::Refund(key.clone()),
            Action::RightRefund(key) => Action::RightRefund(key.clone()),
            Action::Reset => Action::Reset,
            Action::WhiteDevilsaur => Action::WhiteDevilsaur,
            Action::Spec(slot) => Action::Spec(*slot),
        })
        .collect::<Vec<_>>();
    if mouse.just_pressed(MouseButton::Right) {
        for (interaction, cell) in &cells {
            if *interaction == Interaction::Hovered {
                requests.push(Action::RightRefund(cell.0.clone()));
            }
        }
    }
    for request in requests {
        apply_action(&mut state, &mut menu, class, request);
    }
}

fn apply_action(
    state: &mut TalentState,
    menu: &mut MenuState,
    class: &TalentClass,
    request: Action,
) {
    let class_id = class.id;
    let earned = budget(menu.save.talent_xp(class_id)).0;
    let mut allocation = normalize(class, &menu.save.talent_allocation(class_id), earned);
    let mut edited = false;
    if let Action::Refund(key) = &request {
        state.selected = Some(key.clone());
    }
    match request {
        Action::Spec(slot) => match menu.save.select_talent_spec(class_id, slot) {
            Ok(true) => menu.queue_spec(class_id, slot),
            Ok(false) => {}
            Err(error) => {
                menu.error = Some(error.to_string());
                menu.dirty = true;
            }
        },
        Action::Reset => {
            let white = white_devilsaur(&allocation);
            allocation.clear();
            if white {
                allocation.insert(WHITE_DEVILSAUR.into(), 1);
            }
            edited = true;
        }
        Action::WhiteDevilsaur => {
            state.selected = Some(WHITE_DEVILSAUR.into());
            if class_id == 3 && menu.save.earned_achievements().contains(WHITE_DEVILSAUR_ACHIEVEMENT) {
                if white_devilsaur(&allocation) {
                    allocation.remove(WHITE_DEVILSAUR);
                } else {
                    allocation.insert(WHITE_DEVILSAUR.into(), 1);
                }
                edited = true;
            }
        }
        Action::Learn(key) => {
            state.selected = Some(key.clone());
            if let Some((tree, talent)) = class.trees.iter().find_map(|tree| {
                tree.talents
                    .iter()
                    .find(|talent| talent.key == key)
                    .map(|talent| (tree, talent))
            }) {
                if can_learn(class, tree, talent, &allocation, earned) {
                    *allocation.entry(key).or_default() += 1;
                    edited = true;
                }
            }
        }
        Action::Refund(key) | Action::RightRefund(key) => {
            if let Some(talent) = class
                .trees
                .iter()
                .flat_map(|tree| &tree.talents)
                .find(|talent| talent.key == key)
            {
                if can_refund(class, talent, &allocation) {
                    let value = allocation.get(&key).copied().unwrap_or(0);
                    if value <= 1 {
                        allocation.remove(&key);
                    } else {
                        allocation.insert(key, value - 1);
                    }
                    edited = true;
                }
            }
        }
    }
    if edited {
        let xp = menu.save.talent_xp(class_id).min(u64::from(u32::MAX)) as u32;
        let values = allocation.into_iter().collect::<Vec<_>>();
        match menu.save.set_talent_allocation(class_id, xp, &values) {
            Ok(()) => menu.queue_talents(class_id),
            Err(error) => {
                menu.error = Some(error.to_string());
                menu.dirty = true;
            }
        }
    }
}

fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    color: Color,
) {
    ui.spawn((
        Text::new(value),
        TextFont {
            font: art.font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        menu::native_text_shadow(),
    ));
}

fn translated(catalog: &MenuCatalog, template: &str, replacements: &[(&str, String)]) -> String {
    let mut output = catalog.label(template).to_owned();
    for (key, value) in replacements {
        output = output.replace(&format!("{{{key}}}"), value);
    }
    output
}

fn icon(
    ui: &mut ChildSpawnerCommands,
    images: &TalentArt,
    key: &str,
    bounds: [f32; 4],
    tint: Color,
) {
    if let Some(image) = images.images.get(key) {
        let mut image = ImageNode::new(image.clone());
        image.color = tint;
        ui.spawn((image, menu::rect(bounds)));
    }
}

fn action_button(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    label: &str,
    action: Action,
    enabled: bool,
) {
    let action = if enabled { Some(action) } else { None };
    let mut entity = ui.spawn((
        Node {
            padding: UiRect::axes(Val::Px(14.0), Val::Px(6.0)),
            border: UiRect::all(Val::Px(1.0)),
            border_radius: BorderRadius::all(Val::Px(5.0)),
            ..default()
        },
        BackgroundColor(Color::srgba(0.0, 0.0, 0.0, 0.5)),
        BorderColor::all(if enabled {
            menu::BUTTON_EDGE
        } else {
            Color::srgb(0.169, 0.129, 0.071)
        }),
    ));
    if let Some(action) = action {
        entity.insert((
            Button,
            action,
            crate::hover::NativeHover::new(menu::BUTTON_EDGE, Color::srgb(1.0, 0.914, 0.659), 0.0),
            UiTransform::default(),
            menu::native_button_gradient(),
        ));
    }
    entity.with_children(|ui| {
        text(
            ui,
            art,
            label,
            15.0,
            Color::srgba(0.973, 0.824, 0.416, if enabled { 1.0 } else { 0.35 }),
        )
    });
}

pub(crate) fn draw_tree(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &TalentArt,
    catalog: &MenuCatalog,
    class: &TalentClass,
    tree: &TalentTree,
    allocation: &Allocation,
    earned: u32,
    selected: Option<&str>,
    read_only: bool,
    white_enabled: Option<bool>,
) {
    // Current14010a2f0: content-sized cards stretch in the shared Armory body row.
    menu::native_panel(
        ui,
        Node {
            flex_shrink: 0.,
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::Center,
            padding: UiRect::all(Val::Px(10.)),
            row_gap: Val::Px(8.),
            ..default()
        },
        |card| {
            // Current14026f360: the growing name leaves the intrinsic count at right.
            card.spawn(Node {
                width: Val::Px(TREE_WIDTH),
                column_gap: Val::Px(10.),
                align_items: AlignItems::Center,
                ..default()
            })
            .with_children(|header| {
                if let Some(image) = images.images.get(&tree.icon) {
                    header.spawn((
                        ImageNode::new(image.clone()),
                        Node {
                            width: Val::Px(30.),
                            height: Val::Px(30.),
                            border: UiRect::all(Val::Px(1.)),
                            border_radius: BorderRadius::all(Val::Px(4.)),
                            ..default()
                        },
                        BorderColor::all(menu::BUTTON_EDGE),
                    ));
                }
                header.spawn((
                    Text::new(catalog.label(&tree.name)),
                    TextFont {
                        font: art.heading_font.clone(),
                        font_size: 24.,
                        ..default()
                    },
                    TextColor(GOLD),
                    menu::native_text_shadow(),
                    Node {
                        flex_grow: 1.,
                        ..default()
                    },
                ));
                let used = tree_spent(tree, allocation);
                header.spawn((
                    Text::new(format!("{} {}", used, catalog.label("points"))),
                    TextFont {
                        font: art.font.clone(),
                        font_size: 15.,
                        ..default()
                    },
                    TextColor(if used > 0 {
                        Color::srgb(1., 0.914, 0.659)
                    } else {
                        MUTED
                    }),
                    menu::native_text_shadow(),
                ));
            });
            card.spawn((
                Node {
                    width: Val::Px(TREE_WIDTH),
                    height: Val::Px(GRID_HEIGHT),
                    border: UiRect::all(Val::Px(1.0)),
                    border_radius: BorderRadius::all(Val::Px(4.0)),
                    overflow: Overflow::clip(),
                    ..default()
                },
                BackgroundColor(Color::BLACK),
                BorderColor::all(Color::srgb(0.169, 0.129, 0.071)),
            ))
            .with_children(|grid| {
                // Current140106ed0 crops the four TalentFrame quadrants with these fixed transforms.
                for (part, x, y, w, h) in [
                    ("TopLeft", 0.0, 0.0, 256.0, 256.0),
                    ("TopRight", 256.0, 0.0, 64.0, 256.0),
                    ("BottomLeft", 0.0, 256.0, 256.0, 128.0),
                    ("BottomRight", 256.0, 256.0, 64.0, 128.0),
                ] {
                    icon(
                        grid,
                        images,
                        &format!("{}-{part}", tree.background),
                        [
                            x * 1.580_547_1 - 57.082_06,
                            y * 1.580_547_1,
                            w * 1.580_547_1 + 1.5,
                            h * 1.580_547_1 + 1.5,
                        ],
                        Color::srgb(0.75, 0.72, 0.68),
                    );
                }
                // Current constructor emits links before cells, using both endpoints.
                for talent in &tree.talents {
                    for key in talent
                        .prerequisite
                        .iter()
                        .map(String::as_str)
                        .chain(talent.alternative_prerequisite.iter().map(String::as_str))
                    {
                        if let Some(parent) = tree.talents.iter().find(|talent| talent.key == key) {
                            prerequisite_link(grid, parent, talent, allocation);
                        }
                    }
                }
                for talent in &tree.talents {
                    let value = rank(allocation, talent);
                    // Current140107b65 readonly branch clears availability but
                    // retains the unlimited-budget test for the locked tint.
                    let enabled = !read_only && can_learn(class, tree, talent, allocation, earned);
                    // Current cell140107ad0 distinguishes an empty budget from
                    // row/prerequisite/exclusive locks with an unlimited check.
                    let otherwise_learnable = can_learn(class, tree, talent, allocation, u32::MAX);
                    let chosen = selected == Some(talent.key.as_str());
                    let center = talent_center(talent);
                    let left = center.x - 23.0;
                    let top = center.y - 23.0;
                    let border = if chosen {
                        Color::srgb(1.0, 0.914, 0.659)
                    } else if value == talent.max_rank {
                        Color::srgb(0.973, 0.824, 0.416)
                    } else if value > 0 || enabled {
                        Color::srgb(0.302, 1.0, 0.416)
                    } else if talent.milestone {
                        Color::srgba(0.64, 0.21, 0.93, 0.6)
                    } else {
                        Color::srgb(0.169, 0.129, 0.071)
                    };
                    let mut cell = grid.spawn((
                        Button,
                        Cell(talent.key.clone()),
                        RelativeCursorPosition::default(),
                        Node {
                            border: UiRect::all(Val::Px(2.0)),
                            border_radius: BorderRadius::all(Val::Px(if talent.milestone {
                                10.0
                            } else {
                                5.0
                            })),
                            ..menu::rect([left, top, 46.0, 46.0])
                        },
                        BorderColor::all(border),
                        crate::hover::NativeHover::new(border, Color::srgb(1.0, 0.914, 0.659), 0.0),
                        UiTransform::default(),
                        BoxShadow::new(
                            if talent.milestone {
                                Color::srgba(0.64, 0.21, 0.93, if value > 0 { 0.9 } else { 0.45 })
                            } else if chosen {
                                Color::srgba(0.973, 0.824, 0.416, 0.8)
                            } else {
                                Color::srgba(0.0, 0.0, 0.0, 0.85)
                            },
                            Val::Px(0.0),
                            Val::Px(0.0),
                            Val::Px(if talent.milestone { 2.0 } else { 0.0 }),
                            Val::Px(if talent.milestone { 12.0 } else { 5.0 }),
                        ),
                    ));
                    if let Some(image) = images.images.get(&talent.icon) {
                        let mut image = ImageNode::new(image.clone());
                        let brightness = if value > 0 || enabled {
                            1.0
                        } else if otherwise_learnable {
                            0.55
                        } else {
                            0.22
                        };
                        image.color = Color::srgb(brightness, brightness, brightness);
                        cell.insert(image);
                    }
                    if read_only {
                        cell.insert(ReadOnlyCell);
                    } else {
                        cell.insert(Action::Learn(talent.key.clone()));
                    }
                    cell.with_children(|cell| {
                        cell.spawn((
                            // Current14026b440: intrinsic badge, anchored outside
                            // the lower-right corner, so font metrics own its size.
                            Node {
                                position_type: PositionType::Absolute,
                                right: Val::Px(-8.0),
                                bottom: Val::Px(-8.0),
                                padding: UiRect::horizontal(Val::Px(4.0)),
                                border: UiRect::all(Val::Px(1.0)),
                                border_radius: BorderRadius::all(Val::Px(4.0)),
                                ..default()
                            },
                            BackgroundColor(Color::srgba(0.0, 0.0, 0.0, 0.9)),
                            BorderColor::all(Color::srgb(0.169, 0.129, 0.071)),
                        ))
                        .with_children(|badge| {
                            text(
                                badge,
                                art,
                                format!("{value}/{}", talent.max_rank),
                                11.0,
                                if value == talent.max_rank {
                                    GOLD
                                } else if value > 0 || enabled {
                                    Color::srgb(0.302, 1.0, 0.416)
                                } else {
                                    MUTED
                                },
                            )
                        });
                    });
                }
                if let Some(enabled) = white_enabled {
                    draw_white_devilsaur_cell(grid, art, images, catalog, allocation, selected,
                        enabled, read_only);
                }
            });
            // Current tree footer140107820: rows grow for wrapped translated labels.
            card.spawn(Node {
                width: Val::Px(TREE_WIDTH),
                flex_direction: FlexDirection::Column,
                margin: UiRect::top(Val::Px(4.)),
                row_gap: Val::Px(6.),
                ..default()
            })
            .with_children(|milestones| {
                let mut rows = BTreeMap::<u8, Vec<&Talent>>::new();
                for talent in tree.talents.iter().filter(|talent| talent.milestone) {
                    rows.entry(talent.row).or_default().push(talent);
                }
                for (row, talents) in rows {
                    let learned = talents.iter().any(|talent| rank(allocation, talent) > 0);
                    milestones
                        .spawn(Node {
                            column_gap: Val::Px(8.),
                            align_items: AlignItems::Center,
                            ..default()
                        })
                        .with_children(|line| {
                            // Current140269d70 groups choices on the same row. The
                            // footer icons are visual; only grid cells own inspection.
                            for talent in &talents {
                                if let Some(image) = images.images.get(&talent.icon) {
                                    let mut image = ImageNode::new(image.clone());
                                    let known = rank(allocation, talent) > 0;
                                    let brightness = if known { 1. } else { 0.4 };
                                    image.color = Color::srgb(brightness, brightness, brightness);
                                    line.spawn((
                                        image,
                                        Node {
                                            width: Val::Px(26.),
                                            height: Val::Px(26.),
                                            flex_shrink: 0.,
                                            border: UiRect::all(Val::Px(1.)),
                                            border_radius: BorderRadius::all(Val::Px(6.)),
                                            ..default()
                                        },
                                        BorderColor::all(if known {
                                            Color::srgb(0.64, 0.21, 0.93)
                                        } else {
                                            Color::srgb(0.169, 0.129, 0.071)
                                        }),
                                    ));
                                }
                            }
                            let names = talents
                                .iter()
                                .map(|talent| catalog.label(&talent.name))
                                .collect::<Vec<_>>()
                                .join(" / ");
                            text(
                                line,
                                art,
                                translated(
                                    catalog,
                                    "{n} points · {name}",
                                    &[("n", (u32::from(row) * 5).to_string()), ("name", names)],
                                ),
                                12.,
                                if learned {
                                    Color::srgb(0.443, 0.835, 1.)
                                } else {
                                    MUTED
                                },
                            );
                        });
                }
            });
        },
    );
}

fn draw_white_devilsaur_cell(
    grid: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &TalentArt,
    catalog: &MenuCatalog,
    allocation: &Allocation,
    selected: Option<&str>,
    enabled: bool,
    read_only: bool,
) {
    let on = white_devilsaur(allocation);
    let chosen = selected == Some(WHITE_DEVILSAUR);
    let border = if chosen { Color::srgb(1.0, 0.914, 0.659) }
        else if on { GOLD }
        else if enabled { Color::srgb(0.302, 1.0, 0.416) }
        else { Color::srgb(0.169, 0.129, 0.071) };
    // Native14010ce70: exact fixed lower-right cell of Hunter tree zero.
    let mut cell = grid.spawn((
        Button,
        Cell(WHITE_DEVILSAUR.into()),
        RelativeCursorPosition::default(),
        Node {
            border: UiRect::all(Val::Px(2.0)),
            border_radius: BorderRadius::all(Val::Px(5.0)),
            ..menu::rect([292.0, f32::from_bits(0x43e5_edb7), 46.0, 46.0])
        },
        BorderColor::all(border),
        crate::hover::NativeHover::new(border, Color::srgb(1.0, 0.914, 0.659), 0.0),
        UiTransform::default(),
    ));
    if let Some(image) = images.icon("Ability_Hunter_Pet_Raptor") {
        let mut image = ImageNode::new(image.clone());
        let brightness = if on { 1.0 } else if enabled { 0.55 } else { 0.22 };
        image.color = Color::srgb(brightness, brightness, brightness);
        cell.insert(image);
    }
    if read_only {
        cell.insert(ReadOnlyCell);
    } else if enabled {
        cell.insert(Action::WhiteDevilsaur);
    }
    cell.with_children(|cell| {
        cell.spawn((
            Node {
                position_type: PositionType::Absolute,
                right: Val::Px(-8.0), bottom: Val::Px(-8.0),
                padding: UiRect::horizontal(Val::Px(4.0)),
                border: UiRect::all(Val::Px(1.0)),
                border_radius: BorderRadius::all(Val::Px(4.0)),
                ..default()
            },
            BackgroundColor(Color::srgba(0.0, 0.0, 0.0, 0.9)),
            BorderColor::all(Color::srgb(0.169, 0.129, 0.071)),
        )).with_children(|badge| text(badge, art, catalog.label(if on { "On" } else { "Off" }),
            11.0, if on { GOLD } else if enabled { Color::srgb(0.302, 1.0, 0.416) } else { MUTED }));
    });
}

fn draw_white_devilsaur_details(
    body: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &TalentArt,
    catalog: &MenuCatalog,
    menu: &MenuState,
    allocation: &Allocation,
    read_only: bool,
) {
    let on = white_devilsaur(allocation);
    let enabled = (if read_only { &menu.backend_save } else { &menu.save })
        .earned_achievements().contains(WHITE_DEVILSAUR_ACHIEVEMENT);
    body.spawn(Node { column_gap: Val::Px(12.), align_items: AlignItems::Center, ..default() })
        .with_children(|header| {
            if let Some(image) = images.icon("Ability_Hunter_Pet_Raptor") {
                header.spawn((ImageNode::new(image.clone()), Node {
                    width: Val::Px(48.), height: Val::Px(48.), flex_shrink: 0.,
                    border: UiRect::all(Val::Px(2.)),
                    border_radius: BorderRadius::all(Val::Px(6.)), ..default()
                }, BorderColor::all(if on { GOLD } else { Color::srgb(0.690, 0.541, 0.227) })));
            }
            header.spawn(Node { flex_direction: FlexDirection::Column, min_width: Val::Px(0.),
                flex_shrink: 1., ..default() }).with_children(|labels| {
                text(labels, art, catalog.label("White Devilsaur"), 18., PAPER);
                text(labels, art, catalog.label(if on { "On · no talent point" }
                    else { "Off · no talent point" }), 13., MUTED);
            });
        });
    if !enabled {
        text(body, art, translated(catalog, "Requires the achievement {name}",
            &[("name", catalog.label("Jurassic Pack").into())]), 13.,
            Color::srgb(1., 0.353, 0.235));
    }
    text(body, art, catalog.label("The wolf Tame Beast brings and the raptor Bestial Wrath adds each take the look of a White Devilsaur: two bodies, biting exactly as the wolf and the raptor do. Only the look changes. Tame Beast and Bestial Wrath still need their points."), 14., PAPER);
    if !read_only {
        action_button(body, art, catalog.label(if on { "Turn off" } else { "Turn on" }),
            Action::WhiteDevilsaur, enabled);
    }
}

pub(crate) fn draw_details(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &TalentArt,
    catalog: &MenuCatalog,
    menu: &MenuState,
    class: &TalentClass,
    allocation: &Allocation,
    selected: Option<&str>,
    read_only: bool,
) {
    let (earned, into, next) = budget(menu.save.talent_xp(class.id));
    let used = spent(class, allocation);
    // Current14010a2f0 owns padding on the310px pane itself, including its border.
    menu::native_panel(
        ui,
        Node {
            width: Val::Px(310.0),
            min_height: Val::Px(0.0),
            flex_shrink: 0.,
            padding: UiRect::axes(Val::Px(16.0), Val::Px(12.0)),
            row_gap: Val::Px(9.0),
            flex_direction: FlexDirection::Column,
            ..default()
        },
        |body| {
            // Current14026ba20 calls the common1e83a0 section-heading builder.
            // Current14026dfa0 emits three selectable spec cards with a title and tree totals.
            if !read_only {
                let active = menu.save.talent_spec(class.id);
                body.spawn(Node {
                    width: Val::Percent(100.),
                    column_gap: Val::Px(6.),
                    ..default()
                })
                .with_children(|row| {
                    for slot in 0..3 {
                        let values = menu.save.talent_spec_allocation(class.id, slot);
                        let values = values.into_iter().collect::<Allocation>();
                        let totals = class
                            .trees
                            .iter()
                            .map(|tree| tree_spent(tree, &values))
                            .collect::<Vec<_>>();
                        let summary = if spent(class, &values) == 0 {
                            catalog.label("Empty").to_owned()
                        } else {
                            format!("{}/{}/{}", totals[0], totals[1], totals[2])
                        };
                        let mut card = row.spawn((
                            Node {
                                flex_grow: 1.,
                                flex_direction: FlexDirection::Column,
                                align_items: AlignItems::Center,
                                padding: UiRect::axes(Val::Px(6.), Val::Px(5.)),
                                border: UiRect::all(Val::Px(1.)),
                                border_radius: BorderRadius::all(Val::Px(5.)),
                                ..default()
                            },
                            BorderColor::all(if slot == active {
                                GOLD
                            } else {
                                menu::BUTTON_EDGE
                            }),
                        ));
                        if slot == active {
                            card.insert(BoxShadow::new(
                                Color::srgba(0.973, 0.824, 0.416, 0.35),
                                Val::Px(0.),
                                Val::Px(0.),
                                Val::Px(0.),
                                Val::Px(10.),
                            ));
                        } else {
                            card.insert((
                                Button,
                                Action::Spec(slot),
                                crate::hover::NativeHover::new(
                                    menu::BUTTON_EDGE,
                                    Color::srgb(1.0, 0.914, 0.659),
                                    0.0,
                                ),
                                UiTransform::default(),
                                menu::native_button_gradient(),
                            ));
                        }
                        card.with_children(|card| {
                            text(
                                card,
                                art,
                                translated(catalog, "Spec {n}", &[("n", (slot + 1).to_string())]),
                                14.,
                                if slot == active {
                                    Color::srgb(1.0, 0.914, 0.659)
                                } else {
                                    GOLD
                                },
                            );
                            text(card, art, summary, 11., MUTED);
                        });
                    }
                });
            }
            crate::codex::section_heading(body, art, catalog.label("Talent Points"));
            body.spawn((
                Text::new(if read_only {
                    translated(catalog, "{spent} spent", &[("spent", used.to_string())])
                } else {
                    translated(
                        catalog,
                        "{left} to spend",
                        &[("left", earned.saturating_sub(used).to_string())],
                    )
                }),
                TextFont {
                    font: art.heading_font.clone(),
                    font_size: 30.0,
                    ..default()
                },
                TextColor(if !read_only && earned > used {
                    Color::srgb(0.302, 1.0, 0.416)
                } else {
                    GOLD
                }),
                menu::native_text_shadow(),
            ));
            let totals = class
                .trees
                .iter()
                .map(|tree| tree_spent(tree, allocation).to_string())
                .collect::<Vec<_>>();
            text(
                body,
                art,
                translated(
                    catalog,
                    "{spent} of {earned} earned spent · {a}/{b}/{c} · {max} at most",
                    &[
                        ("spent", used.to_string()),
                        ("earned", earned.to_string()),
                        ("a", totals[0].clone()),
                        ("b", totals[1].clone()),
                        ("c", totals[2].clone()),
                        ("max", MAX_POINTS.to_string()),
                    ],
                ),
                13.0,
                MUTED,
            );
            text(
                body,
                art,
                if earned == MAX_POINTS {
                    catalog.label("Every talent point earned.").to_owned()
                } else {
                    translated(
                        catalog,
                        "Talent experience {into} / {next} to the next point",
                        &[("into", into.to_string()), ("next", next.to_string())],
                    )
                },
                12.0,
                if earned == MAX_POINTS { GOLD } else { MUTED },
            );
            body.spawn((
                Node {
                    width: Val::Percent(100.0),
                    height: Val::Px(8.0),
                    border: UiRect::all(Val::Px(1.0)),
                    border_radius: BorderRadius::all(Val::Px(4.0)),
                    ..default()
                },
                BackgroundColor(Color::srgba(0.0, 0.0, 0.0, 0.6)),
                BorderColor::all(Color::srgb(0.169, 0.129, 0.071)),
            ))
            .with_children(|track| {
                track.spawn((
                    Node {
                        width: Val::Percent(if earned == MAX_POINTS {
                            // Native14026c7dd divides cap sentinels0/0; the
                            // progress helper preserves that negative quiet NaN.
                            f32::from_bits(0xffc0_0000)
                        } else {
                            (into as f32 / next as f32 * 100.0).clamp(0.0, 100.0)
                        }),
                        height: Val::Percent(100.0),
                        ..default()
                    },
                    BackgroundGradient::from(LinearGradient {
                        angle: std::f32::consts::FRAC_PI_2,
                        stops: vec![
                            Color::linear_rgba(0.16, 0.42, 0.62, 1.0).into(),
                            Color::linear_rgba(0.443, 0.835, 1.0, 1.0).into(),
                        ],
                        ..default()
                    }),
                ));
            });
            if read_only {
                text(body, art, catalog.label("Talents are spent in the armory's Talents tab, between runs. Respecs are free."), 12., MUTED);
            } else {
                text(
                    body,
                    art,
                    translated(
                        catalog,
                        "Every run pays your {class}s talent experience: time survived, kills, bosses and a win, more in harder zones. Respecs are free.",
                        &[("class", catalog.classes[menu.class].name.clone())],
                    ),
                    12.0,
                    MUTED,
                );
                action_button(body, art, catalog.label("Reset"), Action::Reset, used > 0);
            }
            body.spawn((
                Node {
                    width: Val::Percent(100.0),
                    height: Val::Px(1.0),
                    ..default()
                },
                BackgroundGradient::from(LinearGradient {
                    angle: std::f32::consts::FRAC_PI_2,
                    stops: vec![
                        Color::linear_rgba(0.973, 0.824, 0.416, 0.0).into(),
                        Color::linear_rgba(0.973, 0.824, 0.416, 0.25).into(),
                        Color::linear_rgba(0.973, 0.824, 0.416, 0.0).into(),
                    ],
                    ..default()
                }),
            ));
            crate::scrollbar::kept_list(body, "talent-details", 9., |body| {
            if class.id == 3 && selected == Some(WHITE_DEVILSAUR) {
                draw_white_devilsaur_details(body, art, images, catalog, menu, allocation, read_only);
                return;
            }
            let selected = selected.and_then(|key| {
                class.trees.iter().find_map(|tree| {
                    tree.talents
                        .iter()
                        .find(|talent| talent.key == key)
                        .map(|talent| (tree, talent))
                })
            });
            let Some((tree, talent)) = selected else {
                let prompt = if read_only {
                    "Point at a talent to read it. The milestones at 10, 20 and 30 points change how your spells play."
                } else {
                    "Point at a talent to read it. Click to spend a point, right-click to take one back. A row opens at 5 points spent in its tree; the milestones at 10, 20 and 30 points change how your spells play."
                };
                text(body, art, catalog.label(prompt), 14.0, MUTED);
                return;
            };
            let current = rank(allocation, talent);
            body.spawn(Node {
                column_gap: Val::Px(12.0),
                align_items: AlignItems::Center,
                ..default()
            })
            .with_children(|header| {
                if let Some(image) = images.images.get(&talent.icon) {
                    header.spawn((
                        ImageNode::new(image.clone()),
                        Node {
                            width: Val::Px(48.0),
                            height: Val::Px(48.0),
                            flex_shrink: 0.0,
                            border: UiRect::all(Val::Px(2.0)),
                            border_radius: BorderRadius::all(Val::Px(6.0)),
                            ..default()
                        },
                        BorderColor::all(if talent.milestone {
                            Color::srgb(0.64, 0.21, 0.93)
                        } else {
                            menu::BUTTON_EDGE
                        }),
                    ));
                }
                header
                    .spawn(Node {
                        flex_direction: FlexDirection::Column,
                        flex_shrink: 1.0,
                        min_width: Val::Px(0.0),
                        ..default()
                    })
                    .with_children(|name| {
                        text(name, art, catalog.label(&talent.name), 18.0, PAPER);
                        text(
                            name,
                            art,
                            translated(
                                catalog,
                                "Rank {rank}/{ranks}",
                                &[
                                    ("rank", current.to_string()),
                                    ("ranks", talent.max_rank.to_string()),
                                ],
                            ),
                            13.0,
                            MUTED,
                        );
                    });
            });
            if previous_rows(tree, allocation, talent.row) < u32::from(talent.row) * 5 {
                text(
                    body,
                    art,
                    translated(
                        catalog,
                        "Requires {need} points in {ct}",
                        &[
                            ("need", (u32::from(talent.row) * 5).to_string()),
                            ("ct", catalog.label(&tree.name).into()),
                        ],
                    ),
                    13.0,
                    Color::srgb(1.0, 0.353, 0.235),
                );
            }
            let requirements = talent
                .prerequisite
                .iter()
                .chain(&talent.alternative_prerequisite)
                .filter_map(|key| tree.talents.iter().find(|required| &required.key == key))
                .collect::<Vec<_>>();
            if let Some(first) = requirements.first() {
                if !requirements
                    .iter()
                    .any(|required| rank(allocation, required) >= required.max_rank)
                {
                    let names = requirements
                        .iter()
                        .map(|required| catalog.label(&required.name))
                        .collect::<Vec<_>>()
                        .join(catalog.label(" or "));
                    let template = if first.max_rank == 1 {
                        "Requires 1 rank in {name}"
                    } else {
                        "Requires {n} ranks in {name}"
                    };
                    text(
                        body,
                        art,
                        translated(
                            catalog,
                            template,
                            &[("n", first.max_rank.to_string()), ("name", names)],
                        ),
                        13.0,
                        Color::srgb(1.0, 0.353, 0.235),
                    );
                }
            }
            if let Some(chosen) = exclusive_choice(tree, talent, allocation) {
                // Current140108dbc..140108f46: localized blocker, 13px red.
                text(
                    body,
                    art,
                    translated(
                        catalog,
                        "You already chose {name}",
                        &[("name", catalog.label(&chosen.name).into())],
                    ),
                    13.0,
                    Color::srgb(1.0, 0.353, 0.235),
                );
            }
            text(body, art, talent.description(current, catalog), 14.0, GOLD);
            if current > 0 && current < talent.max_rank {
                text(body, art, catalog.label("Next rank:"), 13.0, PAPER);
                text(
                    body,
                    art,
                    talent.description(current + 1, catalog),
                    14.0,
                    GOLD,
                );
            }
            if talent.milestone {
                text(
                    body,
                    art,
                    catalog.label("A milestone: it changes how your spells play."),
                    12.0,
                    Color::srgb(0.443, 0.835, 1.0),
                );
            }
            // Current14010931a description consumer omits both mutation
            // controls in the run viewer while retaining all rank/gate prose.
            if !read_only {
                body.spawn(Node {
                    column_gap: Val::Px(8.0),
                    ..default()
                })
                .with_children(|buttons| {
                    action_button(
                        buttons,
                        art,
                        catalog.label("Learn"),
                        Action::Learn(talent.key.clone()),
                        can_learn(class, tree, talent, allocation, earned),
                    );
                    action_button(
                        buttons,
                        art,
                        catalog.label("Unlearn"),
                        Action::Refund(talent.key.clone()),
                        can_refund(class, talent, allocation),
                    );
                });
            }
            });
        },
    );
}

fn rebuild(
    mut commands: Commands,
    mut view: ResMut<TalentState>,
    menu: Res<MenuState>,
    catalog: Res<MenuCatalog>,
    definitions: Res<TalentCatalog>,
    art: Res<MenuArt>,
    images: Res<TalentArt>,
    roots: Query<Entity, With<Root>>,
    windows: Query<&Window, With<PrimaryWindow>>,
) {
    let dimensions = windows
        .single()
        .map(|window| Vec2::new(window.width(), window.height()))
        .unwrap_or(Vec2::new(1600.0, 900.0));
    let scale = (dimensions.x / 1600.0)
        .min(dimensions.y / 900.0)
        .min(1.6)
        .max(0.1);
    let signature = format!(
        "{:?}:{}:{}:{:?}:{:?}:{:?}:{:?}:{}",
        menu.page,
        menu.class_id(),
        menu.save.talent_xp(menu.class_id()),
        menu.save.talent_allocation(menu.class_id()),
        view.selected,
        menu.error,
        (
            menu.save.talent_spec(menu.class_id()),
            (0..3)
                .map(|slot| menu.save.talent_spec_allocation(menu.class_id(), slot))
                .collect::<Vec<_>>()
        ),
        menu.save.earned_achievements().contains(WHITE_DEVILSAUR_ACHIEVEMENT),
    );
    if signature == view.signature
        && (view.scale - scale).abs() < 0.001
        && !catalog.is_changed()
        && !art.is_changed()
        && !images.is_changed()
    {
        return;
    }
    for root in &roots {
        commands.entity(root).despawn();
    }
    view.signature = signature;
    view.scale = scale;
    if menu.page != Page::Talents {
        return;
    }
    let class = definitions.class(menu.class_id());
    let earned = budget(menu.save.talent_xp(menu.class_id())).0;
    let allocation = normalize(class, &menu.save.talent_allocation(menu.class_id()), earned);
    commands
        .spawn((
            Root,
            Node {
                position_type: PositionType::Absolute,
                width: Val::Px(1600.0),
                height: Val::Px(900.0),
                ..default()
            },
            crate::canvas::NativeCanvas::main_menu(),
            GlobalZIndex(5401),
            FocusPolicy::Pass,
        ))
        .with_children(|ui| {
            ui.spawn(crate::armory::shell_node())
                .with_children(|shell| {
                    crate::armory::build_header_row(shell, &art, &catalog, &menu);
                    shell
                        .spawn(Node {
                            min_height: Val::Px(0.),
                            ..crate::armory::body_node()
                        })
                        .with_children(|body| {
                            for (index, tree) in class.trees.iter().enumerate() {
                                draw_tree(
                                    body,
                                    &art,
                                    &images,
                                    &catalog,
                                    class,
                                    tree,
                                    &allocation,
                                    earned,
                                    view.selected.as_deref(),
                                    false,
                                    (class.id == 3 && index == 0).then(|| menu.save
                                        .earned_achievements().contains(WHITE_DEVILSAUR_ACHIEVEMENT)),
                                );
                            }
                            draw_details(
                                body,
                                &art,
                                &images,
                                &catalog,
                                &menu,
                                class,
                                &allocation,
                                view.selected.as_deref(),
                                false,
                            );
                        });
                });
        });
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_xp_thresholds_and_cap() {
        assert_eq!(budget(0), (0, 0, 80));
        assert_eq!(budget(79), (0, 79, 80));
        assert_eq!(budget(80), (1, 0, 95));
        assert_eq!(budget(174), (1, 94, 95));
        assert_eq!(budget(175), (2, 0, 110));
        assert_eq!(budget(u64::MAX).0, 51);
    }

    #[test]
    fn row_gate_counts_only_previous_rows() {
        let defs = TalentCatalog::embedded();
        let class = defs.class(1);
        let tree = &class.trees[0];
        let target = tree
            .talents
            .iter()
            .find(|talent| talent.key == "imp_rend")
            .unwrap();
        let allocation =
            Allocation::from([("imp_heroic".into(), 4), ("tactical_mastery".into(), 5)]);
        assert!(!can_learn(class, tree, target, &allocation, 51));
        let allocation = Allocation::from([("imp_heroic".into(), 5)]);
        assert!(can_learn(class, tree, target, &allocation, 51));
    }

    #[test]
    fn refund_refuses_row_and_prerequisite_cascades() {
        let defs = TalentCatalog::embedded();
        let class = defs.class(1);
        let tree = &class.trees[0];
        let find = |key: &str| {
            tree.talents
                .iter()
                .find(|talent| talent.key == key)
                .unwrap()
        };
        let mut allocation = Allocation::from([
            ("imp_heroic".into(), 5),
            ("deflection".into(), 5),
            ("deep_wounds".into(), 1),
        ]);
        assert!(!can_refund(class, find("imp_heroic"), &allocation));
        assert!(can_refund(class, find("deep_wounds"), &allocation));
        allocation.extend([
            ("imp_rend".into(), 3),
            ("tactical_mastery".into(), 5),
            ("anger_management".into(), 3),
            ("sweeping_strikes".into(), 1),
        ]);
        assert!(!can_refund(class, find("deep_wounds"), &allocation));
        assert!(can_refund(class, find("sweeping_strikes"), &allocation));
    }

    #[test]
    fn native_earned_point_round_trip_preserves_xp() {
        let mut save = crate::save::Save::parse("talent|1|80|imp_heroic:1\n").unwrap();
        assert_eq!(available_points(&save, 1), 0);
        save.set_talent_allocation(1, 80, &[]).unwrap();
        assert_eq!(available_points(&save, 1), 1);
        assert_eq!(save.talent_xp(1), 80);
    }

    // Authored from the 0.97.2 static evidence; not run in source-only mode.
    #[test]
    fn current_catalog_has_both_druid_capstones() {
        let defs = TalentCatalog::embedded();
        assert_eq!(defs.classes.len(), 9);
        assert_eq!(
            defs.classes
                .iter()
                .map(|class| class.trees.len())
                .sum::<usize>(),
            27
        );
        assert_eq!(
            defs.classes
                .iter()
                .flat_map(|class| &class.trees)
                .map(|tree| tree.talents.len())
                .sum::<usize>(),
            355
        );
        assert_eq!(defs.class(9).trees[1].talents.len(), 14);
        let feral = &defs.class(11).trees[1];
        assert_eq!(feral.talents.len(), 14);
        let bear = feral
            .talents
            .iter()
            .find(|talent| talent.key == "leader_of_pack")
            .unwrap();
        let cat = feral
            .talents
            .iter()
            .find(|talent| talent.key == "cat_form")
            .unwrap();
        assert_eq!(
            (&*bear.name, bear.row, bear.column, bear.max_rank),
            ("Dire Bear Form", 6, 0, 1)
        );
        assert_eq!(
            (&*cat.name, cat.row, cat.column, cat.max_rank),
            ("Cat Form", 6, 2, 1)
        );
        assert_eq!(bear.prerequisite.as_deref(), Some("blood_frenzy"));
        assert_eq!(cat.prerequisite.as_deref(), Some("blood_frenzy"));
        assert!(bear.description.contains("Shred instead of Wrath"));
        assert!(cat.description.contains("Shred instead of Wrath"));
    }

    #[test]
    fn current_druid_capstones_block_one_another() {
        let defs = TalentCatalog::embedded();
        let class = defs.class(11);
        let tree = &class.trees[1];
        let find = |key: &str| {
            tree.talents
                .iter()
                .find(|talent| talent.key == key)
                .unwrap()
        };
        let mut allocation = tree
            .talents
            .iter()
            .filter(|talent| talent.row < 6)
            .map(|talent| (talent.key.clone(), talent.max_rank))
            .collect::<Allocation>();
        assert!(can_learn(class, tree, find("cat_form"), &allocation, 51));
        assert!(can_learn(
            class,
            tree,
            find("leader_of_pack"),
            &allocation,
            51
        ));
        allocation.insert("leader_of_pack".into(), 1);
        assert!(!can_learn(class, tree, find("cat_form"), &allocation, 51));
        assert_eq!(
            exclusive_choice(tree, find("cat_form"), &allocation)
                .unwrap()
                .key,
            "leader_of_pack"
        );
        assert!(can_refund(class, find("leader_of_pack"), &allocation));
        allocation.remove("leader_of_pack");
        allocation.insert("cat_form".into(), 1);
        assert!(!can_learn(
            class,
            tree,
            find("leader_of_pack"),
            &allocation,
            51
        ));
    }

    #[test]
    fn current_normalization_uses_native_row_tree_column_order() {
        let defs = TalentCatalog::embedded();
        let class = defs.class(11);
        let tree = &class.trees[1];
        let mut raw = vec![
            ("cat_form".into(), 255),
            ("leader_of_pack".into(), 255),
            ("unknown".into(), 255),
        ];
        raw.extend(
            tree.talents
                .iter()
                .filter(|talent| talent.row < 6)
                .map(|talent| (talent.key.clone(), 255)),
        );
        let allocation = normalize(class, &raw, 51);
        assert_eq!(spent(class, &allocation), 40);
        assert_eq!(allocation.get("leader_of_pack"), Some(&1));
        assert!(!allocation.contains_key("cat_form"));
        assert!(!allocation.contains_key("unknown"));
        let constrained = normalize(class, &raw, 25);
        assert_eq!(spent(class, &constrained), 25);
        assert!(!constrained.contains_key("leader_of_pack"));
    }
}
