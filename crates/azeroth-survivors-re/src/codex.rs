//! Current 0.109.0 account-wide Codex: 142 entries and all fourteen locales.
//! Native constructors/formatters supply the source data; browsing is read-only.
//! See docs/analysis/codex-0.109.0.md for target evidence and comparison limits.
use std::collections::{BTreeMap, BTreeSet};

use bevy::{prelude::*, ui::FocusPolicy};
use serde::Deserialize;

use crate::{
    assets::{self, MenuArt},
    catalog::MenuCatalog,
    hover::NativeHover,
    localization::Localization,
    menu::{self, GOLD, MUTED},
    menu_state::{MenuState, Page},
    options::{OptionsSet, OptionsState},
    save::CLASS_IDS,
};

const RARITIES: [&str; 5] = ["Common", "Uncommon", "Rare", "Epic", "Legendary"];
const STAT: Color = Color::srgb(0.302, 1.0, 0.416);
const INTRO: &str = "Every ring, trinket and amulet a run has offered you, on any hero. The ones still in shadow have yet to come up: battleground caches, elites and guardians offer them.";
const INTRO_CLASSES: &str = "Rings, trinkets and most amulets come up for every class. Legendary amulets remake one spell each, so each class has its own.";
const FOOTER: &str = "Every piece a run has offered you, on any hero. Caches, elites and guardians offer them. Click one to read it.";
const EMPOWERED: &str =
    "Offered again while worn, it is empowered: its numbers grow toward three times their own.";
const LEGENDARY_NOTE: &str =
    "Offered only once your hero knows the spell. Offered again while worn, it is empowered.";

pub struct CodexPlugin;
impl Plugin for CodexPlugin {
    fn build(&self, app: &mut App) {
        app.insert_resource(CodexCatalog::embedded())
            .insert_resource(CodexText::embedded())
            .init_resource::<CodexArt>()
            .init_resource::<CodexState>()
            .add_systems(Startup, load_art)
            .add_systems(
                Update,
                (input.run_if(crate::update_ui::menu_input_enabled), rebuild)
                    .chain()
                    .after(OptionsSet::Input),
            );
    }
}

#[derive(Resource, Deserialize)]
struct CodexCatalog {
    entries: Vec<Entry>,
}
impl CodexCatalog {
    fn embedded() -> Self {
        let mut catalog: Self = serde_json::from_str(include_str!("../assets/codex-0.105.0.json"))
            .expect("SHA-bound selected-target Codex catalog");
        let delta = JewelryDelta::embedded();
        // Current native jewelry order puts Mystaria after Soulstone. Its
        // unchanged key preserves Seen ownership from the former amulet.
        catalog.entries.retain(|entry| entry.key != delta.entry.key);
        let at = catalog.entries.iter().position(|entry| entry.key == delta.after)
            .expect("current jewelry predecessor") + 1;
        catalog.entries.insert(at, delta.entry);
        catalog
    }
}
#[derive(Deserialize)]
struct Entry {
    key: String,
    name: String,
    icon: String,
    group: String,
    quality: u8,
    descriptions: Vec<String>,
    #[serde(default)]
    class_id: u8,
    #[serde(default)]
    spell: String,
    #[serde(default)]
    spell_icon: String,
    #[serde(default)]
    tag_label: String,
    #[serde(default)]
    growth: String,
}
/// Exact native formatter outputs, evaluated against each shipped locale catalog.
/// Names and composed descriptions are already translated and must not be looked up again.
#[derive(Resource, Deserialize)]
struct CodexText(BTreeMap<String, BTreeMap<String, EntryText>>);
impl CodexText {
    fn embedded() -> Self {
        #[derive(Deserialize)]
        struct Delta {
            locales: BTreeMap<String, BTreeMap<String, EntryText>>,
        }
        let mut text: Self =
            serde_json::from_str(include_str!("../assets/codex-locales-0.105.0.json"))
                .expect("current-revalidated Codex base text");
        let delta: Delta =
            serde_json::from_str(include_str!("../assets/codex-locale-delta-0.109.0.json"))
                .expect("current native Codex locale corrections");
        for (code, rows) in delta.locales {
            text.0.entry(code).or_default().extend(rows);
        }
        for (code, rows) in JewelryDelta::embedded().locales {
            text.0.entry(code).or_default().extend(rows);
        }
        text
    }
    fn language(&self, code: &str) -> &BTreeMap<String, EntryText> {
        self.0.get(code).expect("native Codex language")
    }
}
#[derive(Deserialize)]
struct EntryText {
    name: String,
    descriptions: Vec<String>,
    #[serde(default)]
    tag_label: String,
    #[serde(default)]
    growth: String,
}

#[derive(Deserialize)]
struct JewelryDelta {
    after: String,
    entry: Entry,
    locales: BTreeMap<String, BTreeMap<String, EntryText>>,
}
impl JewelryDelta {
    fn embedded() -> Self {
        serde_json::from_str(include_str!("../assets/jewelry-codex-0.112.0.json"))
            .expect("current native jewelry/Codex delta")
    }
}
#[derive(Resource, Default)]
struct CodexArt(BTreeMap<String, Handle<Image>>);
#[derive(Resource, Default)]
struct CodexState {
    selected: Option<String>,
    signature: String,
}
#[derive(Component)]
struct Root;
#[derive(Component)]
struct Select(String);

fn quality_color(quality: u8) -> Color {
    // Native rarity palette recovered through1453deda0 and Codex icon constructor.
    match quality {
        1 => Color::srgb(0.118, 1., 0.),
        2 => Color::srgb(0.231, 0.612, 1.),
        3 => Color::srgb(0.761, 0.486, 1.),
        4 => Color::srgb(1., 0.604, 0.165),
        _ => Color::srgb(0.91, 0.91, 0.91),
    }
}
fn border_color(quality: u8) -> Color {
    // Native140320f80 separate, darker border palette at14590aa24/34/44.
    match quality {
        1 => Color::srgb(0.075, 0.541, 0.),
        2 => Color::srgb(0.039, 0.310, 0.612),
        3 => Color::srgb(0.420, 0.122, 0.659),
        4 => Color::srgb(0.698, 0.329, 0.),
        _ => Color::srgb(0.541, 0.541, 0.541),
    }
}
fn load_art(
    catalog: Res<CodexCatalog>,
    mut art: ResMut<CodexArt>,
    mut images: ResMut<Assets<Image>>,
) {
    let Some(directory) = assets::data_directory() else {
        return;
    };
    let Ok(mut chain) = benilla_formats::open_chain(&directory) else {
        return;
    };
    let icons: BTreeSet<_> = catalog
        .entries
        .iter()
        .flat_map(|entry| [&entry.icon, &entry.spell_icon])
        .filter(|icon| !icon.is_empty())
        .cloned()
        .collect();
    for icon in icons {
        if let Ok(image) = assets::read_image(&mut chain, &format!("Interface\\Icons\\{icon}.blp"))
        {
            art.0.insert(icon, images.add(image));
        }
    }
}
fn input(
    menu: Res<MenuState>,
    options: Res<OptionsState>,
    mut state: ResMut<CodexState>,
    buttons: Query<(&Interaction, &Select), Changed<Interaction>>,
) {
    if menu.page != Page::Codex || options.open || menu.dialog.is_some() {
        return;
    }
    for (interaction, select) in &buttons {
        if *interaction == Interaction::Pressed && state.selected.as_ref() != Some(&select.0) {
            state.selected = Some(select.0.clone());
        }
    }
}
fn label(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    text: impl Into<String>,
    size: f32,
    color: Color,
) {
    ui.spawn((
        Text::new(text),
        TextFont {
            font: art.font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        menu::native_text_shadow(),
    ));
}

/// Current140364670: only jewelry takes its highest seen rarity.
fn entry_quality(entry: &Entry, discovered: Option<u8>) -> u8 {
    if matches!(entry.group.as_str(), "rings" | "trinkets") {
        discovered.unwrap_or(0)
    } else {
        entry.quality
    }
}

fn tile(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &CodexArt,
    entry: &Entry,
    discovered: Option<u8>,
    selected: bool,
    bounds: [f32; 4],
    interactive: bool,
) {
    let known = discovered.is_some();
    // Current140364670: shared amulets keep their record quality; legendary is4.
    let quality = entry_quality(entry, discovered);
    let mut node = Node {
        width: Val::Px(bounds[2]),
        height: Val::Px(bounds[3]),
        align_items: AlignItems::Center,
        justify_content: JustifyContent::Center,
        ..default()
    };
    node.border = UiRect::all(Val::Px(2.));
    node.border_radius = BorderRadius::all(Val::Px(6.));
    let border = if selected {
        Color::srgb(1., 0.914, 0.659)
    } else if known {
        border_color(quality)
    } else {
        Color::srgb(0.169, 0.129, 0.071)
    };
    let glow = if selected {
        Color::linear_rgba(0.973, 0.824, 0.416, 0.8)
    } else if known {
        let rarity = quality_color(quality).to_srgba();
        Color::linear_rgba(rarity.red, rarity.green, rarity.blue, 0.25)
    } else {
        Color::linear_rgba(0., 0., 0., 0.85)
    };
    let mut entity = ui.spawn((
        node,
        BackgroundColor(Color::BLACK),
        BorderColor::all(border),
        BoxShadow::new(
            glow,
            Val::Px(0.),
            Val::Px(0.),
            Val::Px(if selected { 2. } else { 0. }),
            Val::Px(if selected { 14. } else { 6. }),
        ),
        UiTransform::default(),
    ));
    // The native ImageNode shares its rounded, bordered Node with the button.
    if let Some(handle) = images.0.get(&entry.icon) {
        entity.insert(ImageNode {
            color: if known {
                Color::WHITE
            } else {
                Color::srgb(0.16, 0.15, 0.15)
            },
            ..ImageNode::new(handle.clone())
        });
    }
    if interactive {
        entity.insert((
            Button,
            Select(entry.key.clone()),
            NativeHover::new(
                border,
                if known {
                    quality_color(quality)
                } else {
                    Color::srgb(0.690, 0.541, 0.227)
                },
                2.,
            ),
        ));
    }
    entity.with_children(|cell| {
        if !known {
            label(
                cell,
                art,
                "?",
                bounds[2] * 0.42,
                Color::srgb(0.4, 0.36, 0.3),
            );
        }
        if !entry.spell_icon.is_empty() {
            let size = bounds[2] * 0.42;
            let badge = Node {
                position_type: PositionType::Absolute,
                right: Val::Px(-5.),
                bottom: Val::Px(-5.),
                width: Val::Px(size),
                height: Val::Px(size),
                border: UiRect::all(Val::Px(1.)),
                border_radius: BorderRadius::all(Val::Px(3.)),
                ..default()
            };
            // Native1401e12a0: ImageNode and black1px border share the rounded badge.
            if let Some(handle) = images.0.get(&entry.spell_icon) {
                cell.spawn((
                    badge,
                    BorderColor::all(Color::BLACK),
                    ImageNode::new(handle.clone()),
                ));
            }
        }
    });
}
fn substitute(catalog: &MenuCatalog, template: &str, values: &[(&str, String)]) -> String {
    let mut text = catalog.label(template).to_owned();
    for (key, value) in values {
        text = text.replace(&format!("{{{key}}}"), value);
    }
    text
}
/// Native1400a1700 forces a1px-high horizontal rule with transparent/opaque/transparent
/// stops. The converted raw sRGB floats are stored as LinearRgba (native tag1).
pub fn native_rule(ui: &mut ChildSpawnerCommands, mut node: Node, color: [f32; 4]) {
    node.height = Val::Px(1.);
    let stop = |alpha| Color::linear_rgba(color[0], color[1], color[2], alpha);
    ui.spawn((
        node,
        BackgroundGradient::from(LinearGradient {
            angle: std::f32::consts::FRAC_PI_2,
            stops: vec![stop(0.).into(), stop(color[3]).into(), stop(0.).into()],
            ..default()
        }),
    ));
}
/// Native1401e83a0 section-heading component; only reuse for verified callers.
pub fn section_heading(ui: &mut ChildSpawnerCommands, art: &MenuArt, title: &str) {
    ui.spawn(Node {
        width: Val::Percent(100.),
        column_gap: Val::Px(12.),
        align_items: AlignItems::Center,
        ..default()
    })
    .with_children(|row| {
        native_rule(
            row,
            Node {
                flex_grow: 1.,
                ..default()
            },
            [0.690, 0.541, 0.227, 1.],
        );
        row.spawn((
            Text::new(title),
            TextFont {
                font: art.heading_font.clone(),
                font_size: 22.,
                ..default()
            },
            TextColor(GOLD),
            menu::native_text_shadow(),
        ));
        native_rule(
            row,
            Node {
                flex_grow: 1.,
                ..default()
            },
            [0.690, 0.541, 0.227, 1.],
        );
    });
}
fn panel_node(width: Val, grow: f32) -> Node {
    // Native140321b90: exact shared Codex pane constraints.
    Node {
        width,
        flex_grow: grow,
        flex_shrink: if grow == 0. { 0. } else { 1. },
        flex_direction: FlexDirection::Column,
        padding: UiRect::axes(Val::Px(16.), Val::Px(12.)),
        row_gap: Val::Px(8.),
        ..default()
    }
}
fn detail(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &CodexArt,
    catalog: &MenuCatalog,
    entry: Option<&Entry>,
    localized: &BTreeMap<String, EntryText>,
    discoveries: &BTreeMap<String, u8>,
) {
    menu::native_panel(ui, panel_node(Val::Px(330.), 0.), |panel| {
        section_heading(panel, art, catalog.label("Details"));
        let Some(entry) = entry else {
            label(panel, art, catalog.label(INTRO), 14., MUTED);
            label(panel, art, catalog.label(INTRO_CLASSES), 14., MUTED);
            return;
        };
        let entry_text = localized.get(&entry.key).expect("native Codex text entry");
        let known = discoveries.get(&entry.key).copied();
        let spell_name = catalog
            .abilities
            .iter()
            .find(|ability| ability.key == entry.spell)
            .map(|ability| ability.name.as_str())
            .unwrap_or(&entry.spell);
        let subtitle = match entry.group.as_str() {
            "legendary" => substitute(
                catalog,
                "Legendary amulet · remakes {spell}",
                &[("spell", spell_name.into())],
            ),
            "amulets" => substitute(
                catalog,
                "{rarity} amulet",
                &[(
                    "rarity",
                    catalog
                        .label(RARITIES[entry.quality.min(4) as usize])
                        .into(),
                )],
            ),
            _ => format!(
                "{} · {}",
                catalog.label(if entry.group == "rings" {
                    "Ring"
                } else {
                    "Trinket"
                }),
                entry_text.tag_label.as_str()
            ),
        };
        panel
            .spawn(Node {
                column_gap: Val::Px(12.),
                align_items: AlignItems::Center,
                ..default()
            })
            .with_children(|header| {
                // Current14021f8bd inserts the interactive48px tile directly
                // into this row; the native Node keeps its default shrink.
                tile(
                    header,
                    art,
                    images,
                    entry,
                    known,
                    true,
                    [0., 0., 48., 48.],
                    true,
                );
                header
                    .spawn(Node {
                        flex_direction: FlexDirection::Column,
                        ..default()
                    })
                    .with_children(|text| {
                        label(
                            text,
                            art,
                            if known.is_some() {
                                &entry_text.name
                            } else {
                                catalog.label("Undiscovered")
                            },
                            16.,
                            known
                                .map(|_| quality_color(entry_quality(entry, known)))
                                .unwrap_or(MUTED),
                        );
                        label(text, art, subtitle, 12., MUTED);
                    });
            });
        let Some(highest) = known else {
            label(panel,art,catalog.label(if entry.group=="legendary" {
                "Not offered yet. A legendary pick of an amulet can remake this spell once your hero knows it."
            } else {"Not offered yet. Open battleground caches and slay elites and guardians to find it."}),13.,MUTED);
            return;
        };
        if matches!(entry.group.as_str(), "rings" | "trinkets") {
            label(
                panel,
                art,
                substitute(
                    catalog,
                    "SEEN UP TO {rarity}",
                    &[(
                        "rarity",
                        catalog.label(RARITIES[highest as usize]).to_uppercase(),
                    )],
                ),
                12.,
                quality_color(highest),
            );
            label(panel, art, catalog.label("A NEW ONE, BY RARITY"), 11., GOLD);
            for (index, description) in entry_text.descriptions.iter().enumerate() {
                panel
                    .spawn(Node {
                        column_gap: Val::Px(8.),
                        ..default()
                    })
                    .with_children(|row| {
                        row.spawn(Node {
                            width: Val::Px(84.),
                            flex_shrink: 0.,
                            ..default()
                        })
                        .with_children(|title| {
                            label(
                                title,
                                art,
                                catalog.label(RARITIES[index]),
                                13.,
                                quality_color(index as u8),
                            )
                        });
                        label(row, art, description, 13., STAT);
                    });
            }
            label(panel, art, &entry_text.growth, 12., MUTED);
        } else {
            for description in &entry_text.descriptions {
                label(panel, art, description, 13., STAT);
            }
            label(
                panel,
                art,
                catalog.label(if entry.group == "legendary" {
                    LEGENDARY_NOTE
                } else {
                    EMPOWERED
                }),
                12.,
                MUTED,
            );
        }
    });
}
fn rebuild(
    mut commands: Commands,
    mut state: ResMut<CodexState>,
    menu: Res<MenuState>,
    catalog: Res<MenuCatalog>,
    definitions: Res<CodexCatalog>,
    localized: Res<CodexText>,
    language: Res<Localization>,
    art: Res<MenuArt>,
    images: Res<CodexArt>,
    roots: Query<Entity, With<Root>>,
) {
    let discoveries = menu.save.seen();
    let signature = format!(
        "{:?}:{}:{}:{:?}:{:?}",
        menu.page,
        language.code(),
        menu.class_id(),
        discoveries,
        state.selected
    );
    if signature == state.signature
        && !art.is_changed()
        && !catalog.is_changed()
        && !images.is_changed()
    {
        return;
    }
    for root in &roots {
        commands.entity(root).despawn();
    }
    state.signature = signature;
    if menu.page != Page::Codex {
        return;
    }
    commands
        .spawn((
            Root,
            Node {
                position_type: PositionType::Absolute,
                width: Val::Px(1600.),
                height: Val::Px(900.),
                ..default()
            },
            crate::canvas::NativeCanvas::main_menu(),
            GlobalZIndex(5401),
            FocusPolicy::Pass,
        ))
        .with_children(|canvas| {
            canvas
                .spawn(crate::armory::shell_node())
                .with_children(|ui| {
                    crate::armory::build_header_row(ui, &art, &catalog, &menu);
                    ui.spawn(crate::armory::body_node()).with_children(|body| {
                        menu::native_panel(body, panel_node(Val::Auto, 1.), |panel| {
                            section_heading(panel, &art, catalog.label("Codex"));
                            label(
                                panel,
                                &art,
                                catalog.label(
                                    "LEGENDARY AMULETS · EACH CLASS ITS OWN, ONE FOR EVERY SPELL",
                                ),
                                11.,
                                GOLD,
                            );
                            let max_columns = definitions
                                .entries
                                .iter()
                                .filter(|entry| entry.group == "amulets")
                                .count();
                            let groups: Vec<_> = CLASS_IDS
                                .iter()
                                .enumerate()
                                .map(|(index, class_id)| {
                                    let class = &catalog.classes[index];
                                    (
                                        definitions
                                            .entries
                                            .iter()
                                            .filter(|entry| entry.class_id == *class_id)
                                            .collect::<Vec<_>>(),
                                        class.name.as_str(),
                                        Color::srgb(class.color[0], class.color[1], class.color[2]),
                                        *class_id == menu.class_id(),
                                    )
                                })
                                .collect();
                            draw_grid(
                                panel,
                                &art,
                                &images,
                                &catalog,
                                &discoveries,
                                &state,
                                &groups,
                                max_columns,
                            );
                            native_rule(
                                panel,
                                Node {
                                    margin: UiRect::vertical(Val::Px(8.)),
                                    ..default()
                                },
                                [0.690, 0.541, 0.227, 1.],
                            );
                            label(
                                panel,
                                &art,
                                catalog.label("ALL CLASSES · OFFERED TO EVERY HERO"),
                                11.,
                                GOLD,
                            );
                            let groups: Vec<_> = [
                                ("rings", "Rings"),
                                ("trinkets", "Trinkets"),
                                ("amulets", "Amulets"),
                            ]
                            .iter()
                            .map(|(group, title)| {
                                (
                                    definitions
                                        .entries
                                        .iter()
                                        .filter(|entry| entry.group == *group)
                                        .collect::<Vec<_>>(),
                                    catalog.label(title),
                                    GOLD,
                                    false,
                                )
                            })
                            .collect();
                            draw_grid(
                                panel,
                                &art,
                                &images,
                                &catalog,
                                &discoveries,
                                &state,
                                &groups,
                                max_columns,
                            );
                            let total = definitions
                                .entries
                                .iter()
                                .filter(|entry| discoveries.contains_key(&entry.key))
                                .count();
                            panel
                                .spawn(Node {
                                    flex_direction: FlexDirection::Column,
                                    row_gap: Val::Px(6.),
                                    margin: UiRect::top(Val::Auto),
                                    ..default()
                                })
                                .with_children(|footer| {
                                    footer
                                        .spawn(Node {
                                            column_gap: Val::Px(10.),
                                            justify_content: JustifyContent::SpaceBetween,
                                            ..default()
                                        })
                                        .with_children(|row| {
                                            label(row, &art, catalog.label(FOOTER), 12., MUTED);
                                            label(
                                                row,
                                                &art,
                                                format!("{total} / {}", definitions.entries.len()),
                                                13.,
                                                GOLD,
                                            );
                                        });
                                    let mut progress = Node {
                                        width: Val::Percent(100.),
                                        height: Val::Px(8.),
                                        ..default()
                                    };
                                    progress.border = UiRect::all(Val::Px(1.));
                                    // Native140320620 clips its fill to the outer radius4 frame.
                                    progress.border_radius = BorderRadius::all(Val::Px(4.));
                                    progress.overflow = Overflow::clip();
                                    footer
                                        .spawn((
                                            progress,
                                            BackgroundColor(Color::srgba(0., 0., 0., 0.6)),
                                            BorderColor::all(Color::srgb(0.169, 0.129, 0.071)),
                                        ))
                                        .with_children(|bar| {
                                            bar.spawn((
                                                Node {
                                                    width: Val::Percent(
                                                        (total as f32
                                                            / definitions.entries.len() as f32)
                                                            .clamp(0., 1.)
                                                            * 100.,
                                                    ),
                                                    height: Val::Percent(100.),
                                                    ..default()
                                                },
                                                BackgroundGradient::from(LinearGradient {
                                                    angle: std::f32::consts::FRAC_PI_2,
                                                    stops: vec![
                                                        Color::linear_rgba(0.690, 0.541, 0.227, 1.)
                                                            .into(),
                                                        Color::linear_rgba(1., 0.914, 0.659, 1.)
                                                            .into(),
                                                    ],
                                                    ..default()
                                                }),
                                            ));
                                        });
                                });
                        });
                        detail(
                            body,
                            &art,
                            &images,
                            &catalog,
                            state.selected.as_ref().and_then(|key| {
                                definitions.entries.iter().find(|entry| entry.key == *key)
                            }),
                            localized.language(language.code()),
                            &discoveries,
                        );
                    });
                });
        });
}
#[allow(clippy::too_many_arguments)]
fn draw_grid(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &CodexArt,
    catalog: &MenuCatalog,
    discoveries: &BTreeMap<String, u8>,
    state: &CodexState,
    groups: &[(Vec<&Entry>, &str, Color, bool)],
    max_columns: usize,
) {
    // Native1401da720..77e and1401db5cb..:120px label plus max_group_count42px tracks.
    // The grid is centered within its panel and both track gaps are6px.
    let mut node = Node {
        display: Display::Grid,
        align_self: AlignSelf::Center,
        ..default()
    };
    node.grid_template_columns = vec![
        GridTrack::px(120.),
        RepeatedGridTrack::px(max_columns as u16, 42.),
    ];
    node.row_gap = Val::Px(6.);
    node.column_gap = Val::Px(6.);
    node.align_items = AlignItems::Center;
    ui.spawn(node).with_children(|grid| {
        for (entries, title, color, own) in groups {
            let count = entries
                .iter()
                .filter(|entry| discoveries.contains_key(&entry.key))
                .count();
            let count = if *own {
                substitute(
                    catalog,
                    "{seen}/{all}  ·  your hero",
                    &[
                        ("seen", count.to_string()),
                        ("all", entries.len().to_string()),
                    ],
                )
            } else {
                format!("{count}/{}", entries.len())
            };
            grid.spawn(Node {
                width: Val::Px(120.),
                flex_direction: FlexDirection::Column,
                ..default()
            })
            .with_children(|title_node| {
                label(title_node, art, *title, 15., *color);
                label(title_node, art, count, 11., MUTED);
            });
            for entry in entries {
                grid.spawn(Node {
                    width: Val::Px(42.),
                    height: Val::Px(42.),
                    ..default()
                })
                .with_children(|cell| {
                    tile(
                        cell,
                        art,
                        images,
                        entry,
                        discoveries.get(&entry.key).copied(),
                        state.selected.as_deref() == Some(&entry.key),
                        [0., 0., 42., 42.],
                        true,
                    );
                });
            }
            for _ in entries.len()..max_columns {
                grid.spawn(Node::default());
            }
        }
    });
}
