//! The fourteen 0.119.0 locale catalogs and the recovered external override loader.
//!
//! Current payloads: docs/analysis/locale-catalogs-0.119.0.md. Loader/parser/lookup:
//! docs/analysis/localization-loader-0.119.0.md. Persistence: localization-0.109.0.md. Only explicitly keyed menu definitions
//! are translated; arbitrary text, player names and file names are never searched/replaced.

#[path = "localization/catalogs.rs"]
mod catalogs;

#[path = "localization/amulet_names.rs"]
mod amulet_names;

use crate::{
    assets::MenuArt,
    catalog::MenuCatalog,
    menu_state::{Dialog, MenuState},
};
use bevy::{prelude::*, ui::RelativeCursorPosition};
use std::{collections::BTreeMap, path::PathBuf};

pub const LANGUAGES: [(&str, &str); 14] = [
    ("en", "English"),
    ("pl", "Polski"),
    ("cs", "Čeština"),
    ("de", "Deutsch"),
    ("pt", "Português (Brasil)"),
    ("es", "Español"),
    ("fr", "Français"),
    ("ro", "Română"),
    ("tr", "Türkçe"),
    ("ru", "Русский"),
    ("uk", "Українська"),
    ("zh", "简体中文"),
    ("ja", "日本語"),
    ("ko", "한국어"),
];
const CATALOGS: [&str; 14] = [
    include_str!("../assets/locales/en.json"),
    include_str!("../assets/locales/pl.json"),
    include_str!("../assets/locales/cs.json"),
    include_str!("../assets/locales/de.json"),
    include_str!("../assets/locales/pt.json"),
    include_str!("../assets/locales/es.json"),
    include_str!("../assets/locales/fr.json"),
    include_str!("../assets/locales/ro.json"),
    include_str!("../assets/locales/tr.json"),
    include_str!("../assets/locales/ru.json"),
    include_str!("../assets/locales/uk.json"),
    include_str!("../assets/locales/zh.json"),
    include_str!("../assets/locales/ja.json"),
    include_str!("../assets/locales/ko.json"),
];

#[derive(Resource, Debug)]
pub struct Localization {
    index: usize,
    catalogs: Vec<BTreeMap<String, String>>,
    path: Option<PathBuf>,
    pub error: Option<String>,
}
impl Default for Localization {
    fn default() -> Self {
        // Native1458ecea0/1458edf70 use the save-data file helper, independently
        // of the engine's BENILLA_HOME and capture/configuration paths.
        let save_directory = crate::save::native_base_directory();
        let path = save_directory.as_ref().map(|base| base.join("language.txt"));
        let saved = path
            .as_deref()
            .and_then(|path| std::fs::read_to_string(path).ok())
            .and_then(|code| language_index(code.trim()));
        let index = saved
            .or_else(|| {
                ["LC_ALL", "LC_MESSAGES", "LANG"]
                    .into_iter()
                    .filter_map(|key| std::env::var(key).ok())
                    .find(|value| !value.is_empty())
                    .and_then(|value| language_index(&locale_prefix(&value)))
            })
            .unwrap_or(0);
        Self {
            index,
            catalogs: catalogs::load(save_directory.as_deref()),
            path,
            error: None,
        }
    }
}
impl Localization {
    /// A party member's display locale uses the loaded catalogs without
    /// changing the host's selection or writing language.txt.
    pub(crate) fn for_code(&self, code: &str) -> Self {
        let index = language_index(code).unwrap_or(0);
        let mut catalogs = vec![BTreeMap::new(); LANGUAGES.len()];
        catalogs[0] = self.catalogs[0].clone();
        if index != 0 {
            catalogs[index] = self.catalogs[index].clone();
        }
        Self { index, catalogs, path: None, error: None }
    }
    #[cfg(test)]
    pub(crate) fn english_for_tests() -> Self {
        Self {
            index: 0,
            catalogs: CATALOGS.iter()
                .map(|catalog| serde_json::from_str(catalog).unwrap()).collect(),
            path: None,
            error: None,
        }
    }

    pub fn code(&self) -> &'static str {
        LANGUAGES[self.index].0
    }
    pub fn name(&self) -> &'static str {
        LANGUAGES[self.index].1
    }
    pub(crate) fn lookup(&self, key: &str) -> Option<&str> {
        self.catalogs[self.index]
            .get(key)
            .or_else(|| self.catalogs[0].get(key))
            .map(String::as_str)
    }
    pub fn label<'a>(&'a self, key: &'a str) -> &'a str {
        self.lookup(key).unwrap_or(key)
    }
    /// Current generated amulets translate their constructed name parts;
    /// shared amulets and ordinary effect names use literal-name lookup.
    pub(crate) fn amulet_name(&self, name: &str, ability_key: Option<&str>) -> String {
        amulet_names::localized(name, ability_key,
            |key| self.lookup(key).map(str::to_owned))
    }
    pub fn select(&mut self, index: usize, catalog: &mut MenuCatalog) {
        if index >= LANGUAGES.len() {
            return;
        }
        self.index = index;
        if let Some(path) = &self.path {
            let write = || -> std::io::Result<()> {
                if let Some(parent) = path.parent() {
                    std::fs::create_dir_all(parent)?;
                }
                std::fs::write(path, self.code())
            };
            self.error = write().err().map(|error| error.to_string());
        }
        self.apply(catalog);
    }
    fn apply(&self, catalog: &mut MenuCatalog) {
        *catalog = self.menu_catalog();
    }
    /// Build display definitions for this locale without selecting or persisting it.
    pub(crate) fn menu_catalog(&self) -> MenuCatalog {
        // Rebuild from source definitions so a second language never uses the first translation
        // as a lookup key. These are the native catalog keys and exact literal-name lookups.
        let mut translated = MenuCatalog::embedded();
        // Current145b29ab0 searches selected then English; label callers retain
        // their key fallback. Preserve that priority in every MenuCatalog consumer.
        translated.labels = self.catalogs[0].clone();
        translated.labels.extend(self.catalogs[self.index].clone());
        translated.title = self.label("game.title").into();
        for class in &mut translated.classes {
            class.name = self.label(&format!("class.{}.name", class.key)).into();
            class.blurb = self.label(&format!("class.{}.blurb", class.key)).into();
            class.starting_spell = self
                .lookup(&format!("ability.{}.name", class.starting_spell_key))
                .unwrap_or(&class.starting_spell)
                .into();
            class.spell_names = class
                .spell_keys
                .iter()
                .zip(&class.spell_names)
                .map(|(key, fallback)| {
                    self.lookup(&format!("ability.{key}.name"))
                        .unwrap_or(fallback)
                        .into()
                })
                .collect();
        }
        for race in &mut translated.races {
            race.name = self.label(&format!("race.{}.name", race.key)).into();
            race.blurb = (1..=3)
                .filter_map(|line| {
                    let key = format!("race.{}.line{line}", race.key);
                    self.lookup(&key).map(str::to_owned)
                })
                .collect::<Vec<_>>()
                .join("\n");
        }
        for zone in &mut translated.zones {
            zone.name = self.label(&format!("zone.{}.name", zone.key)).into();
            zone.subtitle = self.label(&format!("zone.{}.subtitle", zone.key)).into();
            zone.blurb = self.label(&format!("zone.{}.blurb", zone.key)).into();
            for (enemy, key) in zone.enemies.iter_mut().zip(&zone.enemy_keys) {
                if let Some(value) = self.lookup(key) {
                    *enemy = value.to_owned();
                }
            }
            for boss in &mut zone.bosses {
                if let Some(value) = self.lookup(&boss.key) {
                    boss.name = value.to_owned();
                }
            }
            if let Some(boss) = zone.bosses.last() {
                zone.boss = boss.name.clone();
            }
        }
        for ability in &mut translated.abilities {
            // Selected native1458744e0 keeps the descriptor's name when its
            // generated translation key is absent.
            ability.name = self
                .lookup(&format!("ability.{}.name", ability.key))
                .unwrap_or(&ability.name)
                .into();
            ability.description = self.label(&format!("ability.{}.desc", ability.key)).into();
        }
        translated
    }
}
fn language_index(code: &str) -> Option<usize> {
    LANGUAGES.iter().position(|(id, _)| *id == code)
}
fn locale_prefix(value: &str) -> String {
    value
        .split(['-', '_', '.'])
        .next()
        .unwrap_or("")
        .to_ascii_lowercase()
}

/// Replace only named tokens in a known native catalog template.
pub fn format(catalog: &MenuCatalog, key: &str, tokens: &[(&str, String)]) -> String {
    let mut result = catalog.label(key).to_string();
    for (name, value) in tokens {
        result = result.replace(&format!("{{{name}}}"), value);
    }
    result
}
/// The native tab key used by each screen. The same key is shared by picker and armory tabs.
pub fn tab_key(page: crate::menu_state::Page) -> &'static str {
    use crate::menu_state::Page;
    match page {
        Page::Character => "armory.tab.character",
        Page::Collection => "armory.tab.collection",
        Page::DropTables => "armory.tab.drops",
        Page::Codex => "armory.tab.codex",
        Page::Talents => "picker.talents",
        Page::Achievements => "armory.tab.achievements",
        Page::Rewards => "armory.tab.rewards",
        Page::Picker => "picker.class",
    }
}

#[derive(SystemSet, Debug, Clone, PartialEq, Eq, Hash)]
pub enum LocalizationSet {
    Input,
}
pub struct LocalizationPlugin;
impl Plugin for LocalizationPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<Localization>()
            .add_systems(Startup, initialize.before(crate::assets::load_menu_art))
            .add_systems(
                Update,
                input
                    .run_if(crate::update_ui::menu_input_enabled)
                    .in_set(LocalizationSet::Input)
                    .after(crate::update_ui::UpdateUiSet::Input),
            );
    }
}
fn initialize(locale: Res<Localization>, mut catalog: ResMut<MenuCatalog>) {
    locale.apply(&mut catalog);
}
#[derive(Component)]
struct Choice(usize);
#[derive(Component)]
struct Popover;
#[derive(Component)]
struct LanguageList;
fn input(
    mut locale: ResMut<Localization>,
    mut catalog: ResMut<MenuCatalog>,
    mut state: ResMut<MenuState>,
    mouse: Res<ButtonInput<MouseButton>>,
    choices: Query<(&Choice, &Interaction), (Changed<Interaction>, With<Button>)>,
    popovers: Query<&RelativeCursorPosition, With<Popover>>,
    actions: Query<(&crate::menu::Action, &Interaction), (Changed<Interaction>, With<Button>)>,
    device: Option<Res<crate::native_input::DeviceUiInput>>,
) {
    if !matches!(state.dialog, Some(Dialog::Language)) || !(mouse.just_pressed(MouseButton::Left)
        || device.as_ref().is_some_and(|d| d.pressed())) {
        return;
    }
    let mut selected = false;
    for (choice, interaction) in &choices {
        if *interaction == Interaction::Pressed {
            // Current14002fff3 closes for every pressed choice, but only a
            // different code invokes persistence and rebuilds locale consumers.
            if choice.0 != locale.index {
                locale.select(choice.0, &mut catalog);
            }
            state.dialog = None;
            state.dirty = true;
            selected = true;
        }
    }
    if selected {
        return;
    }
    // The list is a popover, with no full-screen dimming or modal shield. A click outside closes
    // it; the ordinary menu input then processes the button beneath that click.
    if actions.iter().any(|(action, interaction)| {
        matches!(action, crate::menu::Action::Language) && *interaction == Interaction::Pressed
    }) {
        return;
    }
    if !popovers.is_empty() && !popovers.iter().any(|position| position.cursor_over()) {
        state.dialog = None;
        state.dirty = true;
    }
}

pub fn popover(ui: &mut ChildSpawnerCommands, art: &MenuArt, locale: &Localization) {
    // Native 0x1402707e0 bounds the outer lane between top58 and bottom16. Its framed
    // child has max-height100%, then a min-height0 row with the scrolling language list.
    ui.spawn(Node {
        position_type: PositionType::Absolute,
        right: Val::Px(16.),
        top: Val::Px(58.),
        bottom: Val::Px(16.),
        flex_direction: FlexDirection::Column,
        align_items: AlignItems::FlexEnd,
        ..default()
    })
    .with_children(|lane| {
        lane.spawn((
            Popover,
            RelativeCursorPosition::default(),
            Node {
                min_width: Val::Px(200.),
                min_height: Val::Px(0.),
                max_height: Val::Percent(100.),
                padding: UiRect::all(Val::Px(8.)),
                flex_direction: FlexDirection::Column,
                row_gap: Val::Px(4.),
                border: UiRect::all(Val::Px(1.)),
                border_radius: BorderRadius::all(Val::Px(10.)),
                ..default()
            },
            BorderColor::all(Color::srgb(0.427, 0.333, 0.145)),
            BackgroundGradient::from(LinearGradient {
                angle: std::f32::consts::PI,
                stops: vec![
                    Color::linear_rgba(0.078, 0.059, 0.035, 0.90).into(),
                    Color::linear_rgba(0.031, 0.024, 0.016, 0.93).into(),
                ],
                ..default()
            }),
            BoxShadow::new(
                Color::srgba(0., 0., 0., 0.6),
                Val::Px(0.),
                Val::Px(14.),
                Val::Px(0.),
                Val::Px(40.),
            ),
        ))
        .with_children(|panel| {
            panel.spawn((
                Text::new(locale.label("picker.language")),
                TextFont {
                    font: art.font.clone(),
                    font_size: 12.,
                    ..default()
                },
                TextColor(Color::srgb(0.725, 0.663, 0.510)),
                Node {
                    margin: UiRect {
                        left: Val::Px(6.),
                        right: Val::Px(0.),
                        top: Val::Px(2.),
                        bottom: Val::Px(4.),
                    },
                    ..default()
                },
            ));
            panel
                .spawn(Node {
                    min_height: Val::Px(0.),
                    column_gap: Val::Px(4.),
                    ..default()
                })
                .with_children(|row| {
                    let viewport = row
                        .spawn((
                            LanguageList,
                            Name::new("language-list"),
                            crate::scrollbar::Kept::new(
                                "language-list",
                                crate::scrollbar::InputScope::Language,
                            ),
                            Node {
                                min_height: Val::Px(0.),
                                flex_grow: 1.,
                                flex_direction: FlexDirection::Column,
                                row_gap: Val::Px(4.),
                                overflow: Overflow::scroll_y(),
                                ..default()
                            },
                            ScrollPosition::default(),
                        ))
                        .with_children(|list| {
                            for (index, (_, name)) in LANGUAGES.iter().enumerate() {
                                let selected = index == locale.index;
                                let edge = if selected {
                                    Color::srgb(0.973, 0.824, 0.416)
                                } else {
                                    Color::srgb(0.169, 0.129, 0.071)
                                };
                                list.spawn((
                                    Button,
                                    Choice(index),
                                    Node {
                                        padding: UiRect::axes(Val::Px(14.), Val::Px(7.)),
                                        border: UiRect::all(Val::Px(1.)),
                                        border_radius: BorderRadius::all(Val::Px(4.)),
                                        ..default()
                                    },
                                    BorderColor::all(edge),
                                    BackgroundColor(if selected {
                                        Color::srgba(0.35, 0.10, 0.06, 0.8)
                                    } else {
                                        Color::srgba(0., 0., 0., 0.4)
                                    }),
                                ))
                                .with_children(|button| {
                                    button.spawn((
                                        Text::new(*name),
                                        TextFont {
                                            font: art.font.clone(),
                                            font_size: 17.,
                                            ..default()
                                        },
                                        TextColor(if selected {
                                            Color::srgb(1., 0.914, 0.659)
                                        } else {
                                            Color::srgb(0.949, 0.902, 0.788)
                                        }),
                                    ));
                                });
                            }
                        })
                        .id();
                    crate::scrollbar::spawn(
                        row,
                        viewport,
                        1.,
                        crate::scrollbar::InputScope::Language,
                    );
                });
        });
    });
}

#[cfg(test)]
mod tests {
    use super::*;

    fn recipient_host() -> Localization {
        Localization {
            index: 3,
            catalogs: CATALOGS.iter()
                .map(|text| serde_json::from_str(text).unwrap())
                .collect(),
            path: Some(PathBuf::from("language.txt")),
            error: Some("existing host error".into()),
        }
    }

    #[test]
    fn recipient_catalogs_rebuild_without_changing_host_selection() {
        let host = recipient_host();
        let original_catalogs = host.catalogs.clone();
        for (code, expected) in [
            ("pl", "Demoniczne Wzmocnienie"),
            ("en", "Demonic Empowerment"),
            ("pl", "Demoniczne Wzmocnienie"),
        ] {
            let member = host.for_code(code);
            let catalog = member.menu_catalog();
            assert_eq!(member.code(), code);
            assert!(member.path.is_none());
            assert_eq!(catalog.label("ability.demonic_empowerment.name"), expected);
            assert_eq!(catalog.abilities.iter()
                .find(|row| row.key == "demonic_empowerment").unwrap().name, expected);
        }
        assert_eq!(host.code(), "de");
        assert_eq!(host.path.as_deref(), Some(std::path::Path::new("language.txt")));
        assert_eq!(host.error.as_deref(), Some("existing host error"));
        assert_eq!(host.catalogs, original_catalogs);
    }

    #[test]
    fn recipient_catalogs_use_english_fallback_and_preserve_unknown_keys() {
        let mut host = recipient_host();
        host.catalogs[0].insert("recipient.english".into(), "English fallback".into());
        host.catalogs[0].insert("recipient.selected".into(), "English value".into());
        host.catalogs[1].insert("recipient.selected".into(), "Polish override".into());
        let member = host.for_code("pl").menu_catalog();
        assert_eq!(member.label("recipient.english"), "English fallback");
        assert_eq!(member.label("recipient.selected"), "Polish override");
        assert_eq!(member.label("recipient.absent"), "recipient.absent");

        let unsupported = host.for_code("unsupported");
        assert_eq!(unsupported.code(), "en");
        assert_eq!(unsupported.menu_catalog().label("recipient.selected"), "English value");
        assert_eq!(host.code(), "de");
    }

    #[test]
    fn current_spell_uses_native_translation_across_locale_changes() {
        let mut locale = Localization {
            index: 0,
            catalogs: CATALOGS[..2]
                .iter()
                .map(|text| serde_json::from_str(text).unwrap())
                .collect(),
            path: None,
            error: None,
        };
        let mut catalog = MenuCatalog::embedded();
        for index in [0, 1, 0] {
            locale.index = index;
            let expected = ["Demonic Empowerment", "Demoniczne Wzmocnienie"][index];
            assert_eq!(
                locale.lookup("ability.demonic_empowerment.name"),
                Some(expected)
            );
            locale.apply(&mut catalog);
            assert_eq!(
                catalog.label("ability.demonic_empowerment.name"),
                expected
            );
            let spell = catalog
                .abilities
                .iter()
                .find(|spell| spell.key == "demonic_empowerment")
                .unwrap();
            assert_eq!(spell.name, expected);
            let warlock = catalog
                .classes
                .iter()
                .find(|class| class.key == "warlock")
                .unwrap();
            assert_eq!(warlock.spell_names.last().unwrap(), expected);
            let cleave = catalog
                .abilities
                .iter()
                .find(|spell| spell.key == "cleave")
                .unwrap();
            assert_eq!(cleave.name, locale.label("ability.cleave.name"));
            let tooltip =
                crate::ability_tooltip::picker("demonic_empowerment", &catalog, false).unwrap();
            assert_eq!(tooltip.title, expected);
        }
    }
    #[test]
    fn native_catalogs_retain_current_equal_key_sets() {
        let catalogs: Vec<BTreeMap<String, String>> = CATALOGS
            .iter()
            .map(|text| serde_json::from_str(text).unwrap())
            .collect();
        for locale in &catalogs[1..] {
            assert!(catalogs[0].keys().eq(locale.keys()));
        }
        for locale in &catalogs {
            assert!(!locale["zone.scholomance.blurb"].is_empty());
            assert!(!locale["boss.1853.yell"].is_empty());
            assert!(!locale["t05.13937"].is_empty());
        }
        assert_eq!(catalogs[1]["picker.class"], "Klasa");
        assert_eq!(catalogs[2]["picker.language"], "Jazyk");
        assert_eq!(catalogs[7]["picker.language"], "Limbă");
        assert_eq!(catalogs[10]["picker.language"], "Мова");
        assert_eq!(catalogs[11]["picker.language"], "语言");
        assert_eq!(catalogs[12]["picker.language"], "言語");
        assert_eq!(catalogs[0]["opt.storeLevels"], "Store Level-Ups");
        assert_eq!(catalogs[0]["Zone: any"], "Zone: any");
        assert_eq!(catalogs[1]["Unlocked zones"], "Odblokowane strefy");
        assert_eq!(catalogs[3]["No password"], "Ohne Passwort");
        assert_eq!(catalogs[11]["No lobby matches the filters."], "没有符合筛选条件的大厅。");
        assert_eq!(catalogs[12]["Zone: {zone}"], "ゾーン：{zone}");
        assert_eq!(catalogs[13]["{shown} of {all} shown"], "{all}개 중 {shown}개 표시");
    }
    #[test]
    fn environment_locale_prefix_matches_native_separators() {
        assert_eq!(locale_prefix("PT_BR.UTF-8"), "pt");
        assert_eq!(locale_prefix("de-DE"), "de");
        assert_eq!(locale_prefix("RO_ro.UTF-8"), "ro");
        assert_eq!(locale_prefix("CS_cz.UTF-8"), "cs");
        assert_eq!(language_index("cs"), Some(2));
        assert_eq!(language_index("ro"), Some(7));
        assert_eq!(language_index("uk"), Some(10));
        assert_eq!(language_index("ja"), Some(12));
        assert_eq!(language_index("unknown"), None);
    }
}
