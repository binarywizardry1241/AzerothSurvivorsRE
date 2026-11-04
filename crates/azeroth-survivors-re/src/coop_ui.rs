//! Co-op difficulty, filters and run cards: docs/analysis/coop-lobby-ui-0.123.0.md.
//! Current chat, member layout and entry: docs/analysis/coop-lobby-ui-0.127.0.md.
//! Direct-peer rosters and session requests connect through coop_runtime.
use crate::{
    assets::MenuArt,
    localization::Localization,
    menu::{self, DARK, EDGE, GOLD, MUTED, PAPER},
    menu_state::{Dialog, MenuState, Page},
};
use bevy::input::{
    ButtonState,
    keyboard::{Key, KeyboardInput},
};
use bevy::prelude::*;
use bevy::ui::FocusPolicy;
use std::collections::VecDeque;
use azeroth_survivors_re::coop::readycheck::{Answer, Snapshot, Status, SECONDS};

#[path = "coop_forms.rs"]
mod forms;
pub(crate) use forms::FormRequest;
use forms::{Field, Forms};

#[path = "coop_chat.rs"]
mod chat;
#[path = "coop_staff_ui.rs"]
mod staff;
#[path = "coop_ready_ui.rs"]
mod ready;

#[derive(Clone, Copy, Default, PartialEq, Eq)]
pub(crate) enum Tab {
    #[default]
    Lobbies,
    Host,
    Code,
}
#[derive(Component, Clone, Copy)]
enum Click {
    Open,
    Close,
    Tab(Tab),
    Capacity(u8),
    Unlocked,
    NoPassword,
    Zone,
    Difficulty,
    ChangeDifficulty,
    Visibility,
    Field(Field),
    Submit,
    Send,
    Kick(u64),
    Lobby(usize),
    Leave,
    Refresh,
    ReadyAnswer(bool),
    ReadyCancel,
}
#[derive(Component)]
struct Disabled(bool);
#[derive(Component)]
struct Root;
#[derive(Component)]
struct PickerLabel;

/// Read-only presentation inputs. None means no snapshot, not an invented service state.
#[derive(Clone)]
pub(crate) struct LobbyRow {
    pub code: String,
    pub name: String,
    pub description: String,
    pub host: String,
    pub hero_class: String,
    pub host_title: String,
    pub country: String,
    pub zone: String,
    /// Exact received localized zone string used by the native filter/cycle.
    pub zone_key: String,
    pub heroic_rank: i64,
    pub difficulty: String,
    pub lacks: String,
    /// Received eligibility/password metadata; never inferred from visible labels.
    pub unlocked: bool,
    pub has_password: bool,
    pub classes: Vec<String>,
    pub joined: u64,
    pub capacity: u64,
}
#[derive(Clone, Default, PartialEq, Eq)]
pub(crate) struct HeroRow {
    pub hero_identity: u64,
    pub name: String,
    pub class: String,
    pub class_id: u8,
    pub race: u8,
    pub achievement_points: u32,
    pub eligible: bool,
    pub ping_ms: Option<u16>,
    pub country: String,
    pub host: bool,
    pub me: bool,
    pub staff_title: String,
}
#[derive(Clone, PartialEq, Eq)]
pub(crate) struct LobbyView {
    pub name: String,
    pub capacity: u8,
    pub heroes: Vec<HeroRow>,
    pub zone: String,
    pub heroic_rank: u8,
}
#[derive(Resource)]
pub(crate) struct CoopUi {
    tab: Tab,
    /// Current native +0x133: retained UI selection, with zero displayed as five.
    capacity: u8,
    unlocked_only: bool,
    no_password: bool,
    zone_filter: Option<String>,
    difficulty_filter: Option<i64>,
    private: bool,
    forms: Forms,
    requests: VecDeque<FormRequest>,
    /// Native service status; form typing has an independent four-state gate.
    pub status: String,
    pub role: String,
    /// The actual service-assigned party code, separate from the join input.
    pub code: Option<String>,
    pub lobbies: Option<Vec<LobbyRow>>,
    pub lobby: Option<LobbyView>,
    pub(crate) ready_check: Option<(Snapshot, f32)>,
    pub unavailable_reason: Option<String>,
    pub chat: chat::Chat,
    chat_status: String,
    /// Actual retained service handle plus its current Host/Join code.
    pub vouch_code: Option<String>,
}
impl Default for CoopUi {
    fn default() -> Self {
        Self {
            tab: Tab::default(),
            capacity: 0,
            unlocked_only: false,
            no_password: false,
            zone_filter: None,
            difficulty_filter: None,
            private: false,
            forms: Forms::default(),
            requests: VecDeque::new(),
            status: "off".into(),
            role: String::new(),
            code: None,
            lobbies: None,
            lobby: None,
            ready_check: None,
            unavailable_reason: None,
            chat: chat::Chat::default(),
            chat_status: String::new(),
            vouch_code: None,
        }
    }
}
impl CoopUi {
    /// Current1402df1f0 updates the picker badge independently of modal entities.
    fn badge_caption(&self, locale: &Localization) -> String {
        if self.role.is_empty() { return label(locale, "Play with friends"); }
        let count = self.lobby.as_ref().map_or(0, |lobby| lobby.heroes.len()).max(1);
        let mut caption = match self.code.as_deref().filter(|code| !code.is_empty()) {
            Some(code) => label(locale, "Party {code}: {n}/5").replace("{code}", code),
            None => label(locale, "Party: {n}/5"),
        }.replace("{n}", &count.to_string());
        if self.chat.unread != 0 {
            caption.push_str(" · ");
            caption.push_str(&label(locale, "{n} new").replace("{n}", &self.chat.unread.to_string()));
        }
        caption
    }

    /// Current1402af0d0: roster population is independent of per-row eligibility.
    pub(crate) fn waiting_for_players(&self) -> bool {
        self.role == "host" && self.party_active()
            && self.lobby.as_ref().map_or(0, |lobby| lobby.heroes.len()) < 2
    }

    pub(crate) fn ready_modal_visible(&self, now: f32) -> bool {
        self.party_active() && self.ready_check.as_ref().is_some_and(|(snapshot, received)| {
            snapshot.status == Status::Running || now - received <= 2.5
        })
    }

    pub(crate) fn receive_ready_check(&mut self, snapshot: Snapshot, identity: u64, now: f32, locale: &Localization) {
        if !self.party_active() || (snapshot.status == Status::Running && !snapshot.answers.iter().any(|(id, _)| *id == identity))
            || self.ready_check.as_ref().is_some_and(|(previous, _)| *previous == snapshot) {
            return;
        }
        let outcome = match snapshot.status {
            Status::Running => None,
            Status::Ready => Some(("Ready check: everyone is ready.", None)),
            Status::Declined => Some(("Ready check failed. Not ready: {names}", Some(Answer::NotReady))),
            Status::Expired => Some(("Ready check failed. No answer from: {names}", Some(Answer::Pending))),
            Status::Cancelled => Some(("The ready check was called off.", None)),
        };
        if let Some((template, answer)) = outcome {
            let mut text = label(locale, template);
            if let Some(answer) = answer {
                let names = snapshot.answers.iter().filter(|(_, value)| *value == answer)
                    .filter_map(|(id, _)| self.lobby.as_ref()?.heroes.iter().find(|hero| hero.hero_identity == *id))
                    .map(|hero| hero.name.as_str()).collect::<Vec<_>>().join(", ");
                text = text.replace("{names}", &names);
            }
            self.chat.push(chat::Line { sequence: 0, hero_identity: 0, name: String::new(),
                class: 0, text, me: false, system: true });
        }
        self.ready_check = Some((snapshot, now));
    }

    /// 1400feda0/1400ff0f0 compare the received member identities (+0x80),
    /// preserving new/old row order. The first roster is a seed, not a join.
    pub(crate) fn receive_lobby(&mut self, lobby: LobbyView, locale: &Localization) {
        if let Some(old) = self.lobby.as_ref().filter(|old| !old.heroes.is_empty()) {
            let joined = lobby.heroes.iter()
                .filter(|hero| !old.heroes.iter().any(|other| other.hero_identity == hero.hero_identity))
                .map(|hero| hero.name.clone()).collect::<Vec<_>>();
            let left = old.heroes.iter()
                .filter(|hero| !lobby.heroes.iter().any(|other| other.hero_identity == hero.hero_identity))
                .map(|hero| hero.name.clone()).collect::<Vec<_>>();
            for (names, template) in [(joined, "{name} joined the party."),
                (left, "{name} left the party.")] {
                for name in names {
                    self.chat.push(chat::Line { sequence: 0, hero_identity: 0,
                        name: String::new(), class: 0,
                        text: label(locale, template).replace("{name}", &name),
                        me: false, system: true });
                }
            }
        }
        self.lobby = Some(lobby);
    }

    pub(crate) fn receive_chat(
        &mut self,
        row: azeroth_survivors_re::coop::server_party::NativeLobbyChat,
        local_identity: u64,
    ) {
        self.chat.push(chat::Line {
            sequence: 0, hero_identity: row.hero_identity,
            name: String::from_utf8_lossy(&row.name).into_owned(), class: row.class,
            text: String::from_utf8_lossy(&row.text).into_owned(),
            me: row.hero_identity == local_identity, system: false,
        });
    }

    pub(crate) fn sync_chat_status(&mut self) {
        if self.chat_status == self.status { return; }
        if matches!(self.status.as_str(), "off" | "closed" | "ended" | "refused"
            | "unavailable" | "joining" | "hosting") {
            self.chat.reset();
            self.forms.chat.clear();
            self.ready_check = None;
        }
        self.chat_status.clone_from(&self.status);
    }

    pub fn lists_active(&self) -> bool {
        self.tab == Tab::Lobbies
    }

    pub fn take_requests(&mut self) -> Vec<FormRequest> {
        self.requests.drain(..).collect()
    }

    pub(crate) fn request_leave_run(&mut self) {
        self.requests.push_back(FormRequest::LeaveRun);
    }

    fn select_tab(&mut self, tab: Tab) {
        self.tab = tab;
        self.forms.focus = match tab {
            Tab::Lobbies => {
                self.requests.push_back(FormRequest::Refresh);
                Field::None
            }
            Tab::Host => Field::Name,
            Tab::Code => Field::Code,
        };
    }

    fn submit(&mut self) {
        let request = match self.tab {
            Tab::Lobbies => return,
            Tab::Host => self.forms.host(!self.private, self.capacity),
            Tab::Code => {
                self.status = "joining".into();
                self.forms.join()
            }
        };
        self.requests.push_back(request);
    }

    fn submit_chat(&mut self) {
        let text = std::mem::take(&mut self.forms.chat);
        if !text.trim().is_empty() {
            self.requests.push_back(FormRequest::Chat(text));
        }
    }

    fn kick_member(&mut self, hero_identity: u64) {
        if self.role == "host" {
            self.requests.push_back(FormRequest::Kick(hero_identity));
        }
    }

    fn edit_key(&mut self, party: bool, key: &Key) {
        // Re-read focus for every event: an earlier Tab in this same input
        // batch already selected the next field.
        let field = if party { Field::Chat } else { self.forms.focus };
        match key {
            Key::Character(value) => self.forms.append_field(field, value),
            Key::Space => self.forms.append_field(field, " "),
            Key::Backspace => self.forms.backspace_field(field),
            Key::Tab if !party => self.forms.tab(),
            Key::Enter if party => self.submit_chat(),
            Key::Enter => self.submit(),
            _ => {}
        }
    }

    pub(crate) fn party_active(&self) -> bool {
        forms::party_active(&self.status, &self.role)
    }

    fn select_lobby(&mut self, index: usize) {
        let Some(row) = self.lobbies.as_ref().and_then(|rows| rows.get(index)) else {
            return;
        };
        if !row.unlocked {
            return;
        }
        if row.has_password {
            self.forms.code.clone_from(&row.code);
            self.tab = Tab::Code;
            self.forms.focus = Field::JoinPassword;
        } else {
            self.requests.push_back(FormRequest::Join {
                code: row.code.clone(),
                password: String::new(),
            });
            self.status = "joining".into();
        }
    }

    fn shows(&self, row: &LobbyRow) -> bool {
        (!self.unlocked_only || row.unlocked)
            && (!self.no_password || !row.has_password)
            && self
                .zone_filter
                .as_ref()
                .is_none_or(|key| key == &row.zone_key)
            && self.difficulty_filter.is_none_or(|rank| rank == row.heroic_rank)
    }

    fn cycle_zone(&mut self) {
        // Native event 13 uses distinct raw keys in first-appearance order from
        // the complete received list, including currently filtered-out rows.
        let mut keys = Vec::new();
        if let Some(rows) = &self.lobbies {
            for row in rows {
                if !keys.contains(&row.zone_key.as_str()) {
                    keys.push(row.zone_key.as_str());
                }
            }
        }
        self.zone_filter = match &self.zone_filter {
            None => keys.first().map(|key| (*key).to_owned()),
            Some(current) => keys
                .iter()
                .position(|key| *key == current.as_str())
                .and_then(|index| keys.get(index + 1))
                .map(|key| (*key).to_owned()),
        };
    }

    fn cycle_difficulty(&mut self) {
        // Native collects nonnegative received ranks, then sorts/deduplicates.
        // Hidden rows participate; an absent/last/disappeared selection clears.
        let mut ranks: Vec<_> = self.lobbies.iter().flatten()
            .map(|row| row.heroic_rank).filter(|rank| *rank >= 0).collect();
        ranks.sort_unstable();
        ranks.dedup();
        self.difficulty_filter = match self.difficulty_filter {
            None => ranks.first().copied(),
            Some(current) => ranks.iter().position(|rank| *rank == current)
                .and_then(|index| ranks.get(index + 1)).copied(),
        };
    }
}
pub(crate) fn host_capacity(raw: u8) -> u8 {
    if raw == 0 { 5 } else { raw.min(5) }
}
pub(crate) fn roster_capacity(raw: u8) -> usize {
    usize::from(raw.clamp(1, 5))
}

pub(crate) struct CoopUiPlugin;
impl Plugin for CoopUiPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<CoopUi>().add_systems(
            Update,
            (
                input.run_if(crate::update_ui::menu_input_enabled),
                localize_picker,
                rebuild,
                ready::rebuild,
                chat::synchronize,
                staff::animate,
            )
                .chain()
                .after(crate::options::OptionsSet::Input)
                .before(crate::gameplay::RunSet::Input),
        );
        app.add_systems(PostUpdate, chat::after_layout.after(bevy::ui::UiSystems::Layout));
    }
}
fn label(locale: &Localization, english: &str) -> String {
    if let Some(value) = locale.lookup(english) {
        return value.to_owned();
    }
    static LABELS: std::sync::OnceLock<
        std::collections::BTreeMap<String, std::collections::BTreeMap<String, String>>,
    > = std::sync::OnceLock::new();
    LABELS
        .get_or_init(|| {
            serde_json::from_str(include_str!("../assets/coop-locales.json"))
                .expect("embedded co-op labels")
        })
        .get(locale.code())
        .and_then(|labels| labels.get(english))
        .cloned()
        .unwrap_or_else(|| english.to_owned())
}
fn difficulty_name(locale: &Localization, rank: i64) -> String {
    azeroth_survivors_re::heroic::rank_name(
        (rank as u8).min(azeroth_survivors_re::heroic::MAX_RANK),
        &label(locale, "Normal"), &label(locale, "Heroic"),
    )
}

fn host_preview(ui: &mut ChildSpawnerCommands, art: &MenuArt,
    locale: &Localization, state: &MenuState) {
    let rank = state.heroic_rank.min(state.max_heroic_rank())
        .min(azeroth_survivors_re::heroic::MAX_RANK);
    let zone = &azeroth_survivors_re::guardians::catalog::ZONES[state.zone];
    selection_card(ui, art, locale, "You host", Some((&state.name, state.class_id())),
        zone.key, rank, true);
}

fn selection_card(ui: &mut ChildSpawnerCommands, art: &MenuArt, locale: &Localization,
    heading: &str, hero: Option<(&str, u8)>, zone: &str, rank: u8, can_change: bool) {
    let border = if rank == 0 { EDGE } else { Color::srgba(1., 0.353, 0.235, 0.7) };
    ui.spawn((Node {
        padding: UiRect::axes(Val::Px(14.), Val::Px(10.)),
        border: UiRect::all(Val::Px(1.)), border_radius: BorderRadius::all(Val::Px(6.)),
        column_gap: Val::Px(14.), align_items: AlignItems::Center, ..default()
    }, BorderColor::all(border), BackgroundColor(Color::srgba(0., 0., 0., 0.32))))
    .with_children(|ui| {
        if let Some((_, class)) = hero {
            let class = azeroth_survivors_re::coop::game_party::class_key(class);
            if let Some(icon) = art.icons.get(class) {
                ui.spawn((ImageNode::new(icon.clone()), Node {
                    width: Val::Px(40.), height: Val::Px(40.), ..default()
                }));
            }
        }
        ui.spawn(Node { flex_direction: FlexDirection::Column, flex_grow: 1.,
            row_gap: Val::Px(3.), ..default() })
            .with_children(|ui| {
                text(ui, art, label(locale, heading), 12., MUTED);
                if let Some((name, class)) = hero {
                    text(ui, art, format!("{} · {}", name,
                        crate::coop_directory::display_class(locale, class)), 17., PAPER);
                }
                ui.spawn(Node { column_gap: Val::Px(10.), align_items: AlignItems::Center, ..default() })
                    .with_children(|ui| {
                        text(ui, art, crate::coop_directory::display_zone(locale, zone), 16., GOLD);
                        text(ui, art, difficulty_name(locale, i64::from(rank)), 13.,
                            if rank == 0 { MUTED } else { Color::srgb(1., 0.353, 0.235) });
                    });
            });
        if can_change {
            control_sized(ui, art, label(locale, "Change difficulty"), Click::ChangeDifficulty,
                false, false, false, 14.);
        }
    });
}
fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    color: Color,
) {
    ui.spawn((
        Text::new(value.into()),
        TextFont {
            font: art.font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        menu::native_text_shadow(),
    ));
}
fn control(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: String,
    click: Click,
    selected: bool,
    selector: bool,
    disabled: bool,
) {
    control_sized(ui, art, value, click, selected, selector, disabled, 15.);
}
fn control_sized(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: String,
    click: Click,
    selected: bool,
    selector: bool,
    disabled: bool,
    size: f32,
) {
    let light = Color::srgb(1., 0.914, 0.659);
    let edge = if selected { light } else { menu::BUTTON_EDGE };
    let mut button = ui.spawn((
        Button,
        click,
        Disabled(disabled),
        Node {
            min_width: Val::Px(if selector { 36. } else { 40. }),
            padding: UiRect::axes(
                Val::Px(if selector { 10. } else { 14. }),
                Val::Px(if selector { 5. } else { 6. }),
            ),
            border: UiRect::all(Val::Px(if selector && selected { 2. } else { 1. })),
            border_radius: BorderRadius::all(Val::Px(4.)),
            justify_content: JustifyContent::Center,
            ..default()
        },
        BackgroundColor(DARK),
        menu::native_button_gradient(),
        BorderColor::all(edge),
    ));
    if !disabled {
        button.insert(crate::hover::NativeHover::new(edge, light, 2.));
    }
    button.with_children(|ui| text(ui, art, value, size, if selected { light } else { MUTED }));
}

/// Current20e930 localizes only its recognized reasons; arbitrary service text
/// remains literal. The phase selects the complete status sentence separately.
fn status_message(view: &CoopUi, locale: &Localization) -> Option<String> {
    let raw = view.unavailable_reason.as_deref().unwrap_or("");
    let reason = if let Some(key) = raw.strip_prefix("locked:") {
        // 0.121.0 140272730: a valid decimal u8 suffix selects the Heroic
        // sentence. Malformed suffixes retain the zone before the first colon.
        let (key, rank) = key.split_once(':').map_or((key, None), |(zone, rank)| {
            (zone, rank.parse::<u8>().ok())
        });
        let zone = azeroth_survivors_re::zones::resolve(key);
        let name = locale
            .lookup(&format!("zone.{}.name", zone.key))
            .unwrap_or(zone.name);
        if let Some(rank) = rank {
            // Native145ac00a0 clamps the parsed byte before the bounded name
            // helper145ac00b0; rank zero deliberately names Normal here.
            let heroic = azeroth_survivors_re::heroic::rank_name(
                rank.min(azeroth_survivors_re::heroic::MAX_RANK),
                &label(locale, "Normal"),
                &label(locale, "Heroic"),
            );
            label(locale, "you haven't opened {heroic} of {zone} with this class yet")
                .replace("{heroic}", &heroic).replace("{zone}", name)
        } else {
            label(locale, "you haven't unlocked {zone} with this class yet").replace("{zone}", name)
        }
    } else if forms::localized_reason(raw) {
        label(locale, raw)
    } else {
        raw.to_owned()
    };
    let template = match view.status.as_str() {
        "joining" => "Joining...",
        "connecting" => "Connecting to the co-op service...",
        "refused" | "denied" => "Could not join: {why}.",
        "ended" | "closed" => "The party ended: {why}.",
        "unavailable" => "Co-op is unavailable: {why}.",
        _ => return None,
    };
    Some(label(locale, template).replace("{why}", &reason))
}

/// Native20cb50/2ee800: a 200px label column and retained text-entry button.
fn form_field(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    view: &CoopUi,
    field: Field,
    caption: String,
    placeholder: String,
) {
    let selected = view.forms.focus == field;
    let light = Color::srgb(1., 0.914, 0.659);
    let edge = if selected { GOLD } else { EDGE };
    ui.spawn(Node {
        align_items: AlignItems::Center,
        ..default()
    })
    .with_children(|ui| {
        ui.spawn(Node {
            width: Val::Px(200.),
            flex_shrink: 0.,
            ..default()
        })
        .with_children(|ui| text(ui, art, caption, 16., PAPER));
        ui.spawn((
            Button,
            Click::Field(field),
            Node {
                flex_grow: 1.,
                padding: UiRect::axes(Val::Px(10.), Val::Px(6.)),
                border: UiRect::all(Val::Px(if selected { 2. } else { 1. })),
                border_radius: BorderRadius::all(Val::Px(3.)),
                ..default()
            },
            BackgroundColor(DARK),
            BorderColor::all(edge),
            crate::hover::NativeHover::new(edge, light, 2.),
        ))
        .with_children(|ui| {
            let color = if view.forms.text(field).is_empty() {
                Color::srgba(0.725, 0.663, 0.510, 0.55)
            } else {
                PAPER
            };
            text(ui, art, view.forms.display(field, &placeholder), 17., color);
        });
    });
}
/// Uses the current generic button dimensions, not the larger Run Options control.
pub(crate) fn picker_button(ui: &mut ChildSpawnerCommands, art: &MenuArt) {
    ui.spawn((
        Button,
        Click::Open,
        Node {
            min_width: Val::Px(40.),
            padding: UiRect::axes(Val::Px(14.), Val::Px(6.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(4.)),
            justify_content: JustifyContent::Center,
            ..default()
        },
        menu::native_button_gradient(),
        BorderColor::all(menu::BUTTON_EDGE),
        crate::hover::NativeHover::new(menu::BUTTON_EDGE, Color::srgb(1., 0.914, 0.659), 2.),
    ))
    .with_children(|ui| {
        ui.spawn((
            PickerLabel,
            Text::new("Co-op"),
            TextFont {
                font: art.font.clone(),
                font_size: 15.,
                ..default()
            },
            TextColor(GOLD),
            menu::native_text_shadow(),
        ));
    });
}
fn localize_picker(locale: Res<Localization>, view: Res<CoopUi>,
    mut texts: Query<&mut Text, With<PickerLabel>>) {
    let value = view.badge_caption(&locale);
    for mut text in &mut texts {
        if text.0 != value {
            text.0.clone_from(&value);
        }
    }
}
fn input(
    mut state: ResMut<MenuState>,
    mut view: ResMut<CoopUi>,
    options: Res<crate::options::OptionsState>,
    buttons: Query<(&Interaction, &Click, Option<&Disabled>), Changed<Interaction>>,
    fields: Query<(&Click, &ComputedNode, &UiGlobalTransform)>,
    mut keyboard: MessageReader<KeyboardInput>,
    mut ime: ResMut<crate::ime::ImeRequest>,
    time: Res<Time>,
    mut runtime: ResMut<crate::coop_runtime::CoopRuntime>,
) {
    let chat_open = !state.in_run && matches!(state.dialog, Some(Dialog::Coop))
        && view.party_active();
    view.bypass_change_detection().chat.set_open(chat_open);
    if state.in_run || state.entering || options.open {
        keyboard.clear();
        return;
    }
    if view.ready_modal_visible(time.elapsed_secs()) {
        if let Some((snapshot, _)) = view.ready_check.as_ref().filter(|(snapshot, _)| snapshot.status == Status::Running) {
            for (interaction, click, disabled) in &buttons {
                if *interaction != Interaction::Pressed || disabled.is_some_and(|disabled| disabled.0) {
                    continue;
                }
                match click {
                    Click::ReadyCancel if view.role == "host" => runtime.cancel_ready_check = true,
                    Click::ReadyAnswer(ready) if view.role == "guest" && snapshot.answers.iter().any(|(id, answer)| {
                        Some(*id) == runtime.world_guid && *answer == Answer::Pending
                    }) => { runtime.ready_answer.get_or_insert(*ready); }
                    _ => {}
                }
            }
        }
        keyboard.clear();
        return;
    }
    for (interaction, click, disabled) in &buttons {
        if *interaction != Interaction::Pressed || disabled.is_some_and(|disabled| disabled.0) {
            continue;
        }
        match click {
            Click::Open if state.dialog.is_none() && state.page == Page::Picker => {
                state.name_focused = false;
                state.dialog = Some(Dialog::Coop);
                state.dirty = true;
            }
            Click::Close => {
                state.dialog = None;
                state.dirty = true;
            }
            Click::Tab(tab) if matches!(state.dialog, Some(Dialog::Coop)) => view.select_tab(*tab),
            Click::Capacity(size)
                if matches!(state.dialog, Some(Dialog::Coop)) && (1..=5).contains(size) =>
            {
                view.capacity = *size
            }
            Click::Unlocked if matches!(state.dialog, Some(Dialog::Coop)) => {
                view.unlocked_only = !view.unlocked_only;
            }
            Click::NoPassword if matches!(state.dialog, Some(Dialog::Coop)) => {
                view.no_password = !view.no_password;
            }
            Click::Zone if matches!(state.dialog, Some(Dialog::Coop)) => view.cycle_zone(),
            Click::Difficulty if matches!(state.dialog, Some(Dialog::Coop)) => view.cycle_difficulty(),
            Click::ChangeDifficulty if matches!(state.dialog, Some(Dialog::Coop)) => {
                state.dialog = Some(Dialog::CoopDifficulty);
                state.dirty = true;
            }
            Click::Visibility if matches!(state.dialog, Some(Dialog::Coop)) => {
                view.private = !view.private;
            }
            Click::Field(field) if matches!(state.dialog, Some(Dialog::Coop)) => {
                view.forms.focus = *field;
            }
            Click::Submit if matches!(state.dialog, Some(Dialog::Coop)) => view.submit(),
            Click::Send if matches!(state.dialog, Some(Dialog::Coop)) && view.party_active() => {
                view.submit_chat();
            }
            Click::Kick(hero_identity) if matches!(state.dialog, Some(Dialog::Coop)) => {
                view.kick_member(*hero_identity);
            }
            Click::Lobby(index) if matches!(state.dialog, Some(Dialog::Coop)) => {
                view.select_lobby(*index)
            }
            Click::Leave if matches!(state.dialog, Some(Dialog::Coop)) => {
                view.requests.push_back(FormRequest::Leave);
                view.status = "off".into();
                view.code = None;
                view.lobby = None;
            }
            Click::Refresh if matches!(state.dialog, Some(Dialog::Coop)) => {
                view.requests.push_back(FormRequest::Refresh);
            }
            _ => {}
        }
    }
    let party = view.party_active();
    let open = !state.in_run && matches!(state.dialog, Some(Dialog::Coop)) && party;
    view.bypass_change_detection().chat.set_open(open);
    let field = if party { Field::Chat } else { view.forms.focus };
    if !matches!(state.dialog, Some(Dialog::Coop)) || field == Field::None {
        keyboard.clear();
        return;
    }
    let position = fields.iter().find_map(|(click, node, transform)| {
        if !matches!(click, Click::Field(selected) if *selected == field) { return None; }
        let center: Vec2 = transform.affine().translation.into();
        Some((center + Vec2::new(-node.size.x * 0.5, node.size.y * 0.5))
            * node.inverse_scale_factor)
    });
    ime.request_typing(position);
    for event in keyboard.read() {
        if event.state != ButtonState::Pressed {
            continue;
        }
        view.edit_key(party, &event.logical_key);
    }
}

fn rebuild(
    mut commands: Commands,
    state: Res<MenuState>,
    view: Res<CoopUi>,
    art: Res<MenuArt>,
    locale: Res<Localization>,
    roots: Query<Entity, With<Root>>,
    panes: Query<Entity, With<chat::Pane>>,
    mut previous_pick: Local<Option<(u8, String, usize, u8, u8)>>,
) {
    let open = !state.in_run && matches!(state.dialog, Some(Dialog::Coop));
    if !open {
        *previous_pick = None;
        for root in &roots {
            commands.entity(root).despawn();
        }
        return;
    }
    let pick = (state.class_id(), state.name.clone(), state.zone,
        state.heroic_rank, state.max_heroic_rank());
    if !roots.is_empty() && !view.is_changed() && !art.is_changed() && !locale.is_changed()
        && previous_pick.as_ref() == Some(&pick) {
        return;
    }
    *previous_pick = Some(pick);
    // Current1402e4490 reparents the existing chat subtree when rebuilding
    // another modal section; preserve its rows, measurements and offset.
    let preserved = if view.party_active() && view.lobby.is_some()
        && !locale.is_changed() && !art.is_changed() {
        panes.iter().next()
    } else { None };
    if let Some(pane) = preserved { commands.entity(pane).remove::<ChildOf>(); }
    for root in &roots {
        commands.entity(root).despawn();
    }
    let mut chat_parent = None;
    commands
        .spawn((
            Root,
            GlobalZIndex(6000),
            Interaction::None,
            FocusPolicy::Block,
            Node {
                position_type: PositionType::Absolute,
                left: Val::Percent(50.), top: Val::Percent(50.),
                width: Val::Px(if view.party_active() { 1120. } else { 820. }),
                height: Val::Px(680.),
                margin: UiRect { left: Val::Px(if view.party_active() { -560. } else { -410. }),
                    top: Val::Px(-340.), ..default() },
                padding: UiRect::axes(Val::Px(36.), Val::Px(24.)),
                flex_direction: FlexDirection::Column,
                row_gap: Val::Px(12.),
                align_items: AlignItems::Stretch,
                ..default()
            },
            menu::native_panel_style(),
        ))
        .with_children(|ui| {
            ui.spawn(Node {
                justify_content: JustifyContent::SpaceBetween,
                align_items: AlignItems::Center,
                ..default()
            })
            .with_children(|ui| {
                text(ui, &art, label(&locale, "Co-op"), 34., GOLD);
            });
            if view.party_active() {
                if let Some(code) = &view.code {
                    if !code.is_empty() {
                        ui.spawn(Node { column_gap: Val::Px(12.), align_items: AlignItems::Center, ..default() })
                            .with_children(|ui| {
                                text(ui, &art, label(&locale, "Lobby code"), 18., PAPER);
                                text(ui, &art, code, 30., Color::srgb(1., 0.914, 0.659));
                            });
                    }
                }
                if let Some(lobby) = &view.lobby {
                if !lobby.zone.is_empty() {
                    selection_card(ui, &art, &locale, "The party's run", None,
                        &lobby.zone, lobby.heroic_rank, view.role == "host");
                }
                let body = ui.spawn(Node { flex_grow: 1., min_height: Val::Px(0.),
                    column_gap: Val::Px(20.), ..default() }).id();
                chat_parent = Some(body);
                ui.commands().entity(body).with_children(|ui| {
                ui.spawn(Node { width: Val::Px(600.), flex_shrink: 0., min_height: Val::Px(0.),
                    flex_direction: FlexDirection::Column, row_gap: Val::Px(8.), ..default() })
                    .with_children(|ui| {
                // Received capacity is independent of the host form default.
                for index in 0..roster_capacity(lobby.capacity) {
                    let hero = lobby.heroes.get(index);
                    let border = match hero {
                        Some(hero) if !hero.eligible => Color::srgba(1., 0.353, 0.235, 0.7),
                        Some(_) => EDGE,
                        None => Color::srgb(0.169, 0.129, 0.071),
                    };
                    ui.spawn((
                        Node {
                            height: Val::Px(54.),
                            flex_shrink: 0.,
                            column_gap: Val::Px(12.),
                            padding: UiRect::axes(Val::Px(12.), Val::Px(5.)),
                            align_items: AlignItems::Center,
                            border: UiRect::all(Val::Px(1.)),
                            border_radius: BorderRadius::all(Val::Px(5.)),
                            ..default()
                        },
                        BorderColor::all(border),
                        BackgroundColor(if hero.is_some() { Color::srgba(0., 0., 0., 0.32) } else { Color::NONE }),
                    ))
                    .with_children(|ui| {
                        if let Some(hero) = lobby.heroes.get(index) {
                            if let Some(icon) = art.icons.get(azeroth_survivors_re::coop::game_party::class_key(hero.class_id)) {
                                ui.spawn((ImageNode::new(icon.clone()), Node { width: Val::Px(38.),
                                    height: Val::Px(38.), flex_shrink: 0., ..default() }));
                            }
                            ui.spawn(Node {
                                flex_direction: FlexDirection::Column,
                                ..default()
                            })
                            .with_children(|ui| {
                                ui.spawn(Node { column_gap: Val::Px(8.), align_items: AlignItems::Center,
                                    ..default() }).with_children(|ui| {
                                    if hero.staff_title.is_empty() {
                                        text(ui, &art, &hero.name, 17., chat::class_color(hero.class_id));
                                    } else {
                                        let entity = crate::coop_directory_row::titled_text(
                                            ui, &art, hero.name.clone(), &hero.staff_title, 17.);
                                        ui.commands().entity(entity).insert(staff::Name);
                                    }
                                    let badge = if hero.host && hero.me { Some("host (you)") }
                                        else if hero.host { Some("host") } else if hero.me { Some("you") }
                                        else { None };
                                    if let Some(badge) = badge { text(ui, &art, label(&locale, badge), 13., GOLD); }
                                });
                                let class = crate::coop_directory::display_class(&locale, hero.class_id);
                                let race = crate::coop_directory::display_race(&locale, hero.race);
                                ui.spawn(Node { column_gap: Val::Px(6.), ..default() })
                                    .with_children(|ui| {
                                        text(ui, &art, class, 13., MUTED);
                                        text(ui, &art, race, 13., chat::class_color(hero.class_id));
                                    });
                            });
                            if !hero.host {
                                let (caption, color) = match hero.ping_ms {
                                    None => ("… ms".into(), Color::srgba(0.725, 0.663, 0.510, 0.55)),
                                    Some(ping) => (format!("{ping} ms"), if ping < 100 {
                                        Color::srgb(0.302, 1., 0.416)
                                    } else if ping < 200 { GOLD } else { Color::srgb(1., 0.353, 0.235) }),
                                };
                                text(ui, &art, caption, 13., color);
                            }
                            if !hero.country.is_empty() { text(ui, &art, &hero.country, 13., MUTED); }
                            if view.role == "host" && !hero.host {
                                control_sized(ui, &art, label(&locale, "Kick"),
                                    Click::Kick(hero.hero_identity), false, false, false, 13.);
                            }
                            if !hero.eligible {
                                let reason = if lobby.heroic_rank == 0 {
                                    label(&locale, "hasn't unlocked this zone")
                                } else {
                                    label(&locale, "hasn't opened {difficulty} here")
                                        .replace("{difficulty}", &difficulty_name(&locale, i64::from(lobby.heroic_rank)))
                                };
                                text(ui, &art, reason, 13., Color::srgb(1., 0.353, 0.235));
                            }
                        } else {
                            text(
                                ui,
                                &art,
                                label(&locale, "Open slot"),
                                15.,
                                Color::srgba(0.725, 0.663, 0.510, 0.55),
                            );
                        }
                    });
                }
                if lobby.heroes.iter().any(|hero| !hero.eligible) {
                    let key = if view.role == "host" {
                        "Heroes marked in red haven't opened this zone or difficulty with their class: they stay behind when you enter. Pick another, or let them change hero."
                    } else {
                        "Heroes marked in red haven't opened this zone or difficulty with their class: they stay behind when the host enters."
                    };
                    text(ui, &art, label(&locale, key), 13., Color::srgb(1., 0.353, 0.235));
                }
                });
                });
                }
            } else {
                ui.spawn(Node {
                    column_gap: Val::Px(6.),
                    ..default()
                })
                .with_children(|ui| {
                    for (tab, name) in [
                        (Tab::Lobbies, "Lobbies"),
                        (Tab::Host, "Host"),
                        (Tab::Code, "Join by code"),
                    ] {
                        control(
                            ui,
                            &art,
                            label(&locale, name),
                            Click::Tab(tab),
                            view.tab == tab,
                            false,
                            false,
                        );
                    }
                });
                match view.tab {
                    Tab::Host => {
                        host_preview(ui, &art, &locale, &state);
                        form_field(ui, &art, &view, Field::Name,
                            label(&locale, "Lobby name"),
                            label(&locale, "{hero}'s run").replace("{hero}", &state.name));
                        form_field(ui, &art, &view, Field::Description,
                            label(&locale, "Description (optional)"), label(&locale, "what the run is about"));
                        text(ui, &art, label(&locale, "Who can find it"), 16., PAPER);
                        control(
                            ui,
                            &art,
                            label(
                                &locale,
                                if view.private {
                                    "Private: by code only"
                                } else {
                                    "Public: in the list"
                                },
                            ),
                            Click::Visibility,
                            false,
                            false,
                            false,
                        );
                        text(ui, &art, label(&locale, "Max players"), 16., PAPER);
                        ui.spawn(Node {
                            column_gap: Val::Px(6.),
                            ..default()
                        })
                        .with_children(|ui| {
                            for size in 1..=5 {
                                control(
                                    ui,
                                    &art,
                                    size.to_string(),
                                    Click::Capacity(size),
                                    host_capacity(view.capacity) == size,
                                    true,
                                    false,
                                );
                            }
                        });
                        form_field(ui, &art, &view, Field::HostPassword,
                            label(&locale, "Password (optional)"), label(&locale, "none"));
                        text(ui, &art, label(&locale,
                            "Everyone who joins needs this zone and difficulty open with their class. Change your hero or zone on the picker."),
                            13., MUTED);
                        control_sized(ui, &art, label(&locale, "Host the lobby"), Click::Submit, false, false, false, 18.);
                    }
                    Tab::Lobbies => {
                        text(
                            ui,
                            &art,
                            label(
                                &locale,
                                "Public lobbies of this version. Click one to join.",
                            ),
                            16.,
                            MUTED,
                        );
                        control(ui, &art, label(&locale, "Refresh"), Click::Refresh, false, false, false);
                        if let Some(lobbies) = &view.lobbies {
                            if !lobbies.is_empty() {
                                ui.spawn(Node {
                                    column_gap: Val::Px(8.),
                                    row_gap: Val::Px(6.),
                                    align_items: AlignItems::Center,
                                    ..default()
                                })
                                .with_children(|ui| {
                                    control(
                                        ui,
                                        &art,
                                        label(&locale, "Can join"),
                                        Click::Unlocked,
                                        view.unlocked_only,
                                        true,
                                        false,
                                    );
                                    control(
                                        ui,
                                        &art,
                                        label(&locale, "No password"),
                                        Click::NoPassword,
                                        view.no_password,
                                        true,
                                        false,
                                    );
                                    let zone = match &view.zone_filter {
                                        Some(key) => {
                                            label(&locale, "Zone: {zone}").replace("{zone}", key)
                                        }
                                        None => label(&locale, "Zone: any"),
                                    };
                                    control(
                                        ui,
                                        &art,
                                        zone,
                                        Click::Zone,
                                        view.zone_filter.is_some(),
                                        true,
                                        false,
                                    );
                                    let difficulty = view.difficulty_filter.map_or_else(
                                        || label(&locale, "Difficulty: any"),
                                        |rank| label(&locale, "Difficulty: {difficulty}").replace(
                                            "{difficulty}", &difficulty_name(&locale, rank)),
                                    );
                                    control(ui, &art, difficulty, Click::Difficulty,
                                        view.difficulty_filter.is_some(), true, false);
                                    let shown =
                                        lobbies.iter().filter(|row| view.shows(row)).count();
                                    if shown < lobbies.len() {
                                        text(
                                            ui,
                                            &art,
                                            label(&locale, "{shown} of {all} shown")
                                                .replace("{shown}", &shown.to_string())
                                                .replace("{all}", &lobbies.len().to_string()),
                                            13.,
                                            MUTED,
                                        );
                                    }
                                });
                            }
                        }
                        crate::scrollbar::kept_list(ui, "coop-lobbies", 12., |ui| {
                            if let Some(lobbies) = &view.lobbies {
                                if lobbies.is_empty() {
                                    text(
                                        ui,
                                        &art,
                                        label(&locale, "No public lobbies right now. Host one!"),
                                        16.,
                                        MUTED,
                                    );
                                } else if !lobbies.iter().any(|row| view.shows(row)) {
                                    text(
                                        ui,
                                        &art,
                                        label(&locale, "No lobby matches the filters."),
                                        16.,
                                        MUTED,
                                    );
                                }
                                // Complete supplied list; no first-eight cutoff or synthetic lobby entries.
                                for (index, lobby) in lobbies.iter().enumerate().filter(|(_, row)| view.shows(row)) {
                                    ui.spawn((
                                        Button,
                                        Click::Lobby(index),
                                        crate::coop_directory_row::frame(lobby),
                                        menu::native_button_gradient(),
                                    ))
                                    .with_children(|ui| {
                                        crate::coop_directory_row::spawn(ui, &art, &locale, lobby);
                                    });
                                }
                            }
                        });
                    }
                    Tab::Code => {
                        form_field(ui, &art, &view, Field::Code,
                            label(&locale, "Lobby code"), "K7QF2".into());
                        form_field(ui, &art, &view, Field::JoinPassword,
                            label(&locale, "Password"), label(&locale, "if it has one"));
                        text(ui, &art, label(&locale,
                            "You play the hero on your picker, in the host's zone."), 13., MUTED);
                        control_sized(ui, &art, label(&locale, "Join"), Click::Submit, false, false, false, 18.);
                    }
                }
            }
            if let Some(message) = status_message(&view, &locale) {
                let color = if matches!(view.status.as_str(), "joining" | "connecting") {
                    MUTED
                } else {
                    Color::srgb(1., 0.353, 0.235)
                };
                text(ui, &art, message, 14., color);
            }
            ui.spawn(Node { column_gap: Val::Px(16.), ..default() }).with_children(|ui| {
                if view.party_active() {
                    control_sized(ui, &art, label(&locale, "Leave the party"), Click::Leave, false, false, false, 16.);
                }
                control_sized(ui, &art, label(&locale, "Close"), Click::Close, false, false, false, 16.);
            });
        });
    if let Some(parent) = chat_parent {
        if let Some(pane) = preserved { commands.entity(parent).add_child(pane); }
        else { chat::spawn(&mut commands, parent, &view, &art, &locale); }
    }
}
#[cfg(test)]
mod tests {
    use super::*;
    use bevy::ecs::system::RunSystemOnce;

    #[test]
    fn kick_controls_keep_the_actual_member_guid_and_only_the_host_can_request_one() {
        let guid = 0x1234_5678_9abc_def0;
        for role in ["host", "guest", ""] {
            let mut view = CoopUi { role: role.into(), status: "joined".into(),
                lobby: Some(LobbyView { name: "party".into(), capacity: 2,
                    zone: "elwynn".into(), heroic_rank: 0,
                    heroes: vec![HeroRow { host: true, hero_identity: 11, ..default() },
                        HeroRow { hero_identity: guid, ..default() }] }), ..default() };
            view.kick_member(guid);
            assert_eq!(view.take_requests(), if role == "host" {
                vec![FormRequest::Kick(guid)]
            } else { Vec::new() });
            let mut world = world(view);
            let targets = world.query::<&Click>().iter(&world).filter_map(|click|
                if let Click::Kick(guid) = click { Some(*guid) } else { None }).collect::<Vec<_>>();
            assert_eq!(targets, if role == "host" { vec![guid] } else { Vec::new() });
        }
    }

    #[test]
    fn tab_changes_the_field_for_later_character_and_backspace_events_in_a_batch() {
        let mut view = CoopUi::default();
        view.forms.focus = Field::Name;
        view.forms.name = "kept".into();
        view.forms.description = "description".into();
        for key in [Key::Tab, Key::Character("界".into())] { view.edit_key(false, &key); }
        assert_eq!(view.forms.name, "kept");
        assert_eq!(view.forms.description, "description界");
        view.forms.focus = Field::Name;
        for key in [Key::Tab, Key::Backspace] { view.edit_key(false, &key); }
        assert_eq!(view.forms.name, "kept");
        assert_eq!(view.forms.description, "description");
    }

    fn world(view: CoopUi) -> World {
        let mut world = World::new();
        let mut state = MenuState::from_save_path(None);
        state.dialog = Some(Dialog::Coop);
        world.insert_resource(state);
        world.insert_resource(view);
        world.insert_resource(MenuArt::default());
        world.insert_resource(Localization::english_for_tests());
        world.run_system_once(rebuild).unwrap();
        world.flush();
        world
    }
    #[test]
    fn selector_and_received_roster_keep_distinct_zero_defaults() {
        assert_eq!(host_capacity(0), 5);
        assert_eq!(roster_capacity(0), 1);
        for value in 1..=5 {
            assert_eq!(host_capacity(value), value);
            assert_eq!(roster_capacity(value), value as usize);
        }
        assert_eq!(host_capacity(255), 5);
        assert_eq!(roster_capacity(255), 5);
    }

    #[test]
    fn forms_retain_text_and_submit_native_values_through_actual_requests() {
        let mut view = CoopUi::default();
        view.select_tab(Tab::Host);
        view.forms.append(" raw host ");
        view.forms.tab();
        view.forms.append("desc");
        view.forms.tab();
        view.forms.append(" pw ");
        view.private = true;
        view.capacity = 2;
        view.submit();
        assert_eq!(
            view.take_requests(),
            vec![FormRequest::Host {
                name: " raw host ".into(),
                password: " pw ".into(),
                description: "desc".into(),
                public: false,
                capacity: 2,
            }]
        );
        assert_eq!(view.status, "off");
        view.select_tab(Tab::Code);
        view.forms.append("k7qf2");
        view.submit();
        assert_eq!(
            view.take_requests(),
            vec![FormRequest::Join {
                code: "K7QF2".into(),
                password: String::new(),
            }]
        );
        assert_eq!(view.status, "joining");
        assert!(!view.party_active());
        view.role = "guest".into();
        assert!(view.party_active());
        view.select_tab(Tab::Lobbies);
        assert_eq!(view.take_requests(), vec![FormRequest::Refresh]);
        assert_eq!(view.forms.name, " raw host ");
        assert_eq!(view.forms.focus, Field::None);
    }

    #[test]
    fn lobby_selection_keeps_original_indices_and_password_join_state() {
        let mut view = CoopUi {
            lobbies: Some(
                (0..3)
                    .map(|i| LobbyRow {
                        code: format!("raw-{i}"),
                        name: String::new(),
                        description: String::new(),
                        host: String::new(),
                hero_class: String::new(), host_title: String::new(), country: String::new(),
                        zone: String::new(),
                        zone_key: String::new(),
                        heroic_rank: -1, difficulty: String::new(), lacks: String::new(),
                        unlocked: i != 0,
                        has_password: i == 1,
                        classes: Vec::new(),
                        joined: 1,
                        capacity: 5,
                    })
                    .collect(),
            ),
            ..Default::default()
        };
        view.forms.join_password = "retained".into();
        view.select_lobby(0);
        view.select_lobby(3);
        assert!(view.take_requests().is_empty());
        view.select_lobby(1);
        assert_eq!(view.forms.code, "raw-1");
        assert_eq!(view.forms.focus, Field::JoinPassword);
        assert_eq!(view.forms.join_password, "retained");
        assert!(view.take_requests().is_empty());
        view.select_lobby(2);
        assert_eq!(
            view.take_requests(),
            vec![FormRequest::Join {
                code: "raw-2".into(),
                password: String::new(),
            }]
        );
    }

    #[test]
    fn native_status_sentences_keep_unknown_reasons_and_locked_zone_fallback() {
        let locale = Localization::english_for_tests();
        let mut view = CoopUi {
            status: "denied".into(),
            unavailable_reason: Some("raw why".into()),
            ..Default::default()
        };
        assert_eq!(
            status_message(&view, &locale).as_deref(),
            Some("Could not join: raw why.")
        );
        view.unavailable_reason = Some("locked:SM".into());
        assert_eq!(
            status_message(&view, &locale).as_deref(),
            Some("Could not join: you haven't unlocked Elwynn Forest with this class yet.")
        );
        view.status = "joining".into();
        assert_eq!(
            status_message(&view, &locale).as_deref(),
            Some("Joining...")
        );
        view.status = "online".into();
        assert!(status_message(&view, &locale).is_none());
    }

    #[test]
    fn the_live_view_keeps_lobbies_after_the_eighth_and_closes_its_root() {
        let rows = (0..12)
            .map(|i| LobbyRow {
                code: format!("CODE{i}"),
                name: format!("lobby-{i}"),
                description: String::new(),
                host: String::new(),
                hero_class: String::new(), host_title: String::new(), country: String::new(),
                zone: String::new(),
                zone_key: String::new(),
                        heroic_rank: -1, difficulty: String::new(), lacks: String::new(),
                unlocked: true,
                has_password: false,
                classes: Vec::new(),
                joined: 1,
                capacity: 5,
            })
            .collect();
        let mut world = world(CoopUi {
            lobbies: Some(rows),
            ..default()
        });
        let labels: Vec<_> = world
            .query::<&Text>()
            .iter(&world)
            .map(|text| text.0.clone())
            .collect();
        for i in 0..12 {
            assert!(labels.contains(&format!("lobby-{i}")));
        }
        world.resource_mut::<MenuState>().dialog = None;
        world.run_system_once(rebuild).unwrap();
        world.flush();
        assert_eq!(
            world
                .query_filtered::<Entity, With<Root>>()
                .iter(&world)
                .count(),
            0
        );
    }

    #[test]
    fn the_live_roster_renders_only_the_selected_capacity() {
        let mut world = world(CoopUi {
            status: "joined".into(),
            role: "host".into(),
            lobby: Some(LobbyView {
                name: "fixture".into(),
                capacity: 2,
                zone: "elwynn".into(),
                heroic_rank: 0,
                heroes: vec![HeroRow {
                    name: "hero".into(),
                    class: "warrior".into(),
                    achievement_points: 10,
                    eligible: true,
                    ..default()
                }],
            }),
            ..default()
        });
        let labels: Vec<_> = world
            .query::<&Text>()
            .iter(&world)
            .map(|text| text.0.clone())
            .collect();
        assert_eq!(
            labels
                .iter()
                .filter(|text| text.as_str() == "Open slot")
                .count(),
            1
        );
    }

    #[test]
    fn live_filters_keep_raw_keys_order_and_distinct_empty_states() {
        let rows = [
            ("shown", "elwynn", true, false),
            ("locked", "duskwood", false, false),
            ("password", "elwynn", true, true),
            ("case-sensitive", "ELWYNN", true, false),
        ]
        .into_iter()
        .map(|(name, key, unlocked, has_password)| LobbyRow {
            code: name.into(),
            name: name.into(),
            description: String::new(),
            host: String::new(),
                hero_class: String::new(), host_title: String::new(), country: String::new(),
            zone: "same translated label".into(),
            zone_key: key.into(),
            heroic_rank: -1, difficulty: String::new(), lacks: String::new(),
            unlocked,
            has_password,
            classes: Vec::new(),
            joined: 1,
            capacity: 5,
        })
        .collect();
        let mut world = world(CoopUi {
            lobbies: Some(rows),
            unlocked_only: true,
            no_password: true,
            ..default()
        });
        fn labels(world: &mut World) -> Vec<String> {
            world
                .query::<&Text>()
                .iter(world)
                .map(|text| text.0.clone())
                .collect()
        }
        let initial = labels(&mut world);
        assert!(initial.contains(&"shown".into()));
        assert!(initial.contains(&"case-sensitive".into()));
        assert!(!initial.contains(&"locked".into()));
        assert!(!initial.contains(&"password".into()));
        assert!(initial.contains(&"2 of 4 shown".into()));
        world.resource_mut::<CoopUi>().cycle_zone();
        world.run_system_once(rebuild).unwrap();
        world.flush();
        assert_eq!(
            world.resource::<CoopUi>().zone_filter.as_deref(),
            Some("elwynn")
        );
        assert!(!labels(&mut world).contains(&"case-sensitive".into()));
        // The locked row still contributes its zone to the next cycle step.
        world.resource_mut::<CoopUi>().cycle_zone();
        world.run_system_once(rebuild).unwrap();
        world.flush();
        assert_eq!(
            world.resource::<CoopUi>().zone_filter.as_deref(),
            Some("duskwood")
        );
        assert!(labels(&mut world).contains(&"No lobby matches the filters.".into()));
        world.resource_mut::<CoopUi>().unlocked_only = false;
        world.run_system_once(rebuild).unwrap();
        world.flush();
        assert!(labels(&mut world).contains(&"locked".into()));
        // A removed selection clears to any; a duplicate key adds no cycle step.
        world.resource_mut::<CoopUi>().cycle_zone();
        assert_eq!(
            world.resource::<CoopUi>().zone_filter.as_deref(),
            Some("ELWYNN")
        );
        world
            .resource_mut::<CoopUi>()
            .lobbies
            .as_mut()
            .unwrap()
            .truncate(1);
        world.resource_mut::<CoopUi>().cycle_zone();
        assert!(world.resource::<CoopUi>().zone_filter.is_none());
        world.resource_mut::<CoopUi>().lobbies = Some(Vec::new());
        world.run_system_once(rebuild).unwrap();
        world.flush();
        let empty = labels(&mut world);
        assert!(empty.contains(&"No public lobbies right now. Host one!".into()));
        assert!(!empty.contains(&"No lobby matches the filters.".into()));
        assert!(!empty.contains(&"Can join".into()));
    }
    #[test]
    fn difficulty_cycle_sorts_distinct_received_ranks_and_keeps_other_filters() {
        let rows = [-1, 3, 0, 3, 256, -2].into_iter().map(|rank| LobbyRow {
            code: String::new(), name: String::new(), description: String::new(),
            host: String::new(), hero_class: String::new(), host_title: String::new(),
            country: String::new(), zone: "zone".into(), zone_key: "zone".into(),
            heroic_rank: rank, difficulty: String::new(), lacks: String::new(),
            unlocked: rank != 3, has_password: false, classes: Vec::new(), joined: 1, capacity: 5,
        }).collect();
        let mut view = CoopUi { lobbies: Some(rows), unlocked_only: true, ..default() };
        for rank in [0, 3, 256] {
            view.cycle_difficulty();
            assert_eq!(view.difficulty_filter, Some(rank));
            assert!(view.lobbies.as_ref().unwrap().iter().filter(|row| view.shows(row))
                .all(|row| row.heroic_rank == rank && row.unlocked));
        }
        view.cycle_difficulty();
        assert_eq!(view.difficulty_filter, None);
        view.difficulty_filter = Some(3);
        view.lobbies.as_mut().unwrap().retain(|row| row.heroic_rank != 3);
        view.cycle_difficulty();
        assert_eq!(view.difficulty_filter, None);
        let locale = Localization::english_for_tests();
        assert_eq!(difficulty_name(&locale, 256), "Normal");
        assert_eq!(difficulty_name(&locale, 5), "Heroic V");
    }

    #[test]
    fn difficulty_done_returns_to_retained_coop_form() {
        let mut state = MenuState::from_save_path(None);
        let mut view = CoopUi::default();
        view.select_tab(Tab::Host);
        view.forms.append("retained lobby");
        state.dialog = Some(Dialog::CoopDifficulty);
        state.close_dialog();
        assert!(matches!(state.dialog, Some(Dialog::Coop)));
        assert_eq!(view.forms.name, "retained lobby");
        assert_eq!(view.forms.focus, Field::Name);
        state.close_dialog();
        assert!(state.dialog.is_none());
    }

    #[test]
    fn received_party_selection_and_ineligible_member_reach_the_live_view() {
        for role in ["host", "guest"] {
            let mut world = world(CoopUi {
                status: "joined".into(), role: role.into(),
                lobby: Some(LobbyView { name: String::new(), capacity: 2,
                    zone: "elwynn".into(), heroic_rank: 2,
                    heroes: vec![HeroRow { name: "locked hero".into(), class: "warrior".into(),
                        achievement_points: 12, eligible: false, ..default() }],
                }), ..default()
            });
            let labels: Vec<_> = world.query::<&Text>().iter(&world).map(|text| text.0.clone()).collect();
            assert!(labels.contains(&"The party's run".into()));
            assert!(labels.contains(&"Heroic II".into()));
            assert!(labels.contains(&"hasn't opened Heroic II here".into()));
            assert_eq!(labels.contains(&"Change difficulty".into()), role == "host");
            assert!(labels.iter().any(|text| text.starts_with("Heroes marked in red")));
        }
    }

    #[test]
    fn run_card_zone_and_difficulty_share_the_native_inner_row() {
        let mut world = world(CoopUi { tab: Tab::Host, ..default() });
        let zone = crate::coop_directory::display_zone(world.resource::<Localization>(), "elwynn");
        let mut texts = world.query::<(&Text, &ChildOf)>();
        let parent = texts.iter(&world).find(|(text, _)| text.0 == "Normal")
            .map(|(_, owner)| owner.parent()).unwrap();
        assert!(texts.iter(&world).any(|(text, owner)| text.0 == zone && owner.parent() == parent));
        let row = world.get::<Node>(parent).unwrap();
        assert_eq!(row.flex_direction, FlexDirection::Row);
        assert_eq!(row.column_gap, Val::Px(10.));
        assert_eq!(row.align_items, AlignItems::Center);
    }

}
