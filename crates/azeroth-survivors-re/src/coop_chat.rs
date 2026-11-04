//! Lobby chat state from the selected 0.127.0 co-op UI owners.
//!
//! 1402af200 appends at most eighty rows. 1402e12e0 supplies the independent
//! `me` and system flags; 1402deba0 clears unread when the window opens.
use std::collections::VecDeque;
use bevy::prelude::*;
use super::{Click, Field, CoopUi, label, text, control_sized, MenuArt, Localization, MUTED, PAPER};

pub(crate) const HISTORY_LIMIT: usize = 80;

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct Line {
    pub sequence: u64,
    pub hero_identity: u64,
    pub name: String,
    pub class: u8,
    pub text: String,
    pub me: bool,
    pub system: bool,
}

#[derive(Default)]
pub(crate) struct Chat {
    pub lines: VecDeque<Line>,
    pub revision: u64,
    pub epoch: u64,
    pub unread: u64,
    pub open: bool,
}

impl Chat {
    pub fn push(&mut self, mut line: Line) {
        if !line.me && !line.system && !self.open {
            self.unread = self.unread.wrapping_add(1);
        }
        self.revision = self.revision.wrapping_add(1);
        line.sequence = self.revision;
        self.lines.push_back(line);
        if self.lines.len() > HISTORY_LIMIT {
            self.lines.pop_front();
        }
    }

    pub fn reset(&mut self) {
        self.lines.clear();
        self.unread = 0;
        self.revision = self.revision.wrapping_add(1);
        self.epoch = self.epoch.wrapping_add(1);
    }

    pub fn set_open(&mut self, open: bool) {
        if open && !self.open {
            self.unread = 0;
        }
        self.open = open;
    }
}

/// 1402e5540 follows the end within four logical pixels, or for an own message.
/// Remote/system arrivals keep an earlier reading position.
pub(crate) fn follow_end(scroll_y: f32, maximum: f32, own_message: bool) -> bool {
    own_message || scroll_y >= maximum - 4.
}

#[derive(Component)]
pub(super) struct Pane;
#[derive(Component)]
pub(super) struct List {
    epoch: u64,
    revision: u64,
    last_sequence: u64,
    follow_pending: bool,
}
#[derive(Component)]
pub(super) struct Row(u64);
#[derive(Component)]
pub(super) struct Empty;
#[derive(Component)]
pub(super) struct Draft;
#[derive(Component)]
pub(super) struct Placeholder;
#[derive(Component)]
pub(super) struct Counter;

pub(super) fn class_color(class: u8) -> Color {
    let raw = azeroth_survivors_re::coop::game_party::class_color(class).trim_start_matches('#');
    u32::from_str_radix(raw, 16).map_or(PAPER, |rgb|
        Color::srgb_u8((rgb >> 16) as u8, (rgb >> 8) as u8, rgb as u8))
}

fn staff_name(view: &CoopUi, line: &Line) -> bool {
    line.hero_identity != 0 && view.lobby.as_ref().is_some_and(|lobby|
        lobby.heroes.iter().any(|hero| hero.hero_identity == line.hero_identity
            && !hero.staff_title.is_empty()))
}

fn line(ui: &mut ChildSpawnerCommands, art: &MenuArt, line: &Line, staff: bool) {
    ui.spawn((Row(line.sequence), Node {
        flex_shrink: 0.,
        column_gap: Val::Px(if line.system { 0. } else { 7. }),
        padding: if line.system { UiRect::axes(Val::Px(0.), Val::Px(3.)) }
            else { UiRect::axes(Val::Px(6.), Val::Px(4.)) },
        border_radius: BorderRadius::all(Val::Px(if line.system { 0. } else { 4. })),
        align_items: AlignItems::Start,
        ..default()
    }, BackgroundColor(if line.me { Color::srgba(0.973, 0.824, 0.416, 0.07) }
        else { Color::NONE }))).with_children(|ui| {
        if line.system {
            text(ui, art, &line.text, 12., MUTED);
        } else {
            let key = azeroth_survivors_re::coop::game_party::class_key(line.class);
            if let Some(icon) = art.icons.get(key) {
                ui.spawn((ImageNode::new(icon.clone()), Node { width: Val::Px(18.),
                    height: Val::Px(18.), flex_shrink: 0., ..default() }));
            }
            let mut name = ui.spawn((Text::new(format!("{}: ", line.name)), TextFont {
                font: art.font.clone(), font_size: 14., ..default()
            }, TextColor(if staff { Color::srgb(0.56, 0.27, 0.98) } else { class_color(line.class) }),
                Node { min_width: Val::Px(0.), flex_grow: 1., ..default() }, crate::menu::native_text_shadow()));
            if staff { name.insert(super::staff::Name); }
            name.with_children(|ui| {
                    ui.spawn((TextSpan::new(&line.text), TextColor(PAPER)));
            });
        }
    });
}

pub(super) fn spawn(commands: &mut Commands, parent: Entity, view: &CoopUi,
    art: &MenuArt, locale: &Localization) {
    commands.entity(parent).with_children(|ui| {
        ui.spawn((Pane, Node { flex_direction: FlexDirection::Column, flex_grow: 1.,
            flex_basis: Val::Px(0.), min_width: Val::Px(0.), min_height: Val::Px(0.),
            padding: UiRect::all(Val::Px(12.)), border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(8.)),
            row_gap: Val::Px(8.), ..default() },
            BackgroundGradient::from(LinearGradient { angle: std::f32::consts::PI,
                stops: vec![Color::linear_rgba(0., 0., 0., 0.42).into(),
                    Color::linear_rgba(0.05, 0.02, 0.01, 0.55).into()], ..default() }),
            BorderColor::all(super::EDGE))).with_children(|ui| {
            text(ui, art, label(locale, "Party chat"), 16., Color::srgb(1., 0.914, 0.659));
            text(ui, art, label(locale, "Until the run begins"), 12.,
                Color::srgba(0.725, 0.663, 0.510, 0.55));
            ui.spawn(Node { flex_grow: 1., min_height: Val::Px(0.), column_gap: Val::Px(8.),
                ..default() }).with_children(|ui| {
                let target = ui.spawn((List { epoch: view.chat.epoch, revision: view.chat.revision,
                    last_sequence: view.chat.lines.back().map_or(0, |line| line.sequence),
                    follow_pending: true }, Node { flex_grow: 1., min_width: Val::Px(0.),
                    min_height: Val::Px(0.), flex_direction: FlexDirection::Column,
                    row_gap: Val::Px(3.), overflow: Overflow::scroll_y(), ..default() },
                    ScrollPosition::default(), crate::scrollbar::Kept::new("coop-chat",
                        crate::scrollbar::InputScope::Picker)))
                    .with_children(|ui| {
                        if view.chat.lines.is_empty() {
                            ui.spawn((Empty, Text::new(label(locale, "No messages yet. Say hello to your party!")),
                                TextFont { font: art.font.clone(), font_size: 14., ..default() },
                                TextColor(MUTED), crate::menu::native_text_shadow()));
                        }
                        for row in &view.chat.lines { line(ui, art, row, staff_name(view, row)); }
                    }).id();
                crate::scrollbar::spawn(ui, target, 1., crate::scrollbar::InputScope::Picker);
            });
            ui.spawn(Node { column_gap: Val::Px(8.), align_items: AlignItems::Center, ..default() })
                .with_children(|ui| {
                    ui.spawn((Button, Click::Field(Field::Chat), Node { flex_grow: 1.,
                        min_width: Val::Px(0.), padding: UiRect::axes(Val::Px(10.), Val::Px(6.)),
                        border: UiRect::all(Val::Px(1.)), border_radius: BorderRadius::all(Val::Px(3.)),
                        ..default() }, BackgroundColor(super::DARK), BorderColor::all(super::GOLD)))
                        .with_children(|ui| {
                            ui.spawn((Draft, Text::default(), TextFont { font: art.font.clone(),
                                font_size: 15., ..default() }, TextColor(PAPER),
                                crate::menu::native_text_shadow()));
                            ui.spawn((Placeholder, Text::default(), TextFont { font: art.font.clone(),
                                font_size: 15., ..default() }, TextColor(Color::srgba(0.725, 0.663, 0.510, 0.55)),
                                crate::menu::native_text_shadow()));
                        });
                    ui.spawn((Counter, Text::default(), TextFont { font: art.font.clone(),
                        font_size: 12., ..default() }, TextColor(MUTED)));
                    control_sized(ui, art, label(locale, "Send"), Click::Send, false, false, false, 14.);
                });
        });
    });
}

/// Reconcile only arrived/evicted rows. Existing entities and measured scroll
/// position survive both incoming messages and unrelated modal reconstruction.
pub(super) fn synchronize(mut commands: Commands, view: Res<CoopUi>, art: Res<MenuArt>,
    locale: Res<Localization>, mut lists: Query<(Entity, &mut List, &ComputedNode, &mut ScrollPosition, Option<&Children>)>,
    rows: Query<(&Row, &ComputedNode)>, empty: Query<Entity, With<Empty>>,
    mut texts: Query<(&mut Text, &mut TextColor, &mut Node, Option<&Draft>, Option<&Counter>, Option<&Placeholder>),
        Or<(With<Draft>, With<Counter>, With<Placeholder>)>>) {
    for (mut value, mut color, mut node, draft, counter, placeholder) in &mut texts {
        if draft.is_some() {
            value.0 = view.forms.display(Field::Chat, &label(&locale, "Say something... (Enter)"));
            color.0 = if view.forms.chat.is_empty() { super::GOLD } else { PAPER };
        } else if counter.is_some() {
            let n = view.forms.chat.chars().count();
            value.0 = if n >= 120 { format!("{n}/160") } else { String::new() };
            node.display = if n >= 120 { Display::Flex } else { Display::None };
            color.0 = if n >= 160 { Color::srgb(1., 0.353, 0.235) } else { MUTED };
        } else if placeholder.is_some() {
            value.0 = if view.forms.chat.is_empty() { label(&locale, "Say something... (Enter)") }
                else { String::new() };
            node.display = if view.forms.chat.is_empty() { Display::Flex } else { Display::None };
        }
    }
    for (entity, mut list, node, mut position, children) in &mut lists {
        if list.epoch == view.chat.epoch && list.revision == view.chat.revision { continue; }
        let maximum = ((node.content_size.y - node.size.y) * node.inverse_scale_factor).max(0.);
        let own = view.chat.lines.iter().any(|row| row.sequence > list.last_sequence && row.me);
        let follow = node.size.y * node.inverse_scale_factor <= 0.
            || follow_end(position.0.y, maximum, own);
        let reset = list.epoch != view.chat.epoch;
        let mut removed_height = 0.;
        for child in children.into_iter().flat_map(|children| children.iter()) {
            if let Ok((row, measured)) = rows.get(child) {
                if reset || !view.chat.lines.iter().any(|line| line.sequence == row.0) {
                    removed_height += measured.size.y * measured.inverse_scale_factor + 3.;
                    commands.entity(child).despawn();
                }
            }
        }
        if !follow { position.0.y = (position.0.y - removed_height).max(0.); }
        for entity in &empty { commands.entity(entity).despawn(); }
        commands.entity(entity).with_children(|ui| {
            if view.chat.lines.is_empty() {
                ui.spawn((Empty, Text::new(label(&locale, "No messages yet. Say hello to your party!")),
                    TextFont { font: art.font.clone(), font_size: 14., ..default() },
                    TextColor(MUTED), crate::menu::native_text_shadow()));
            }
            for row in view.chat.lines.iter().filter(|row| reset || row.sequence > list.last_sequence) {
                line(ui, &art, row, staff_name(&view, row));
            }
        });
        list.epoch = view.chat.epoch;
        list.revision = view.chat.revision;
        list.last_sequence = view.chat.lines.back().map_or(0, |row| row.sequence);
        list.follow_pending = follow || reset;
    }
}

pub(super) fn after_layout(mut lists: Query<(&mut List, &ComputedNode, &mut ScrollPosition)>) {
    for (mut list, node, mut position) in &mut lists {
        if std::mem::take(&mut list.follow_pending) {
            position.0.y = ((node.content_size.y - node.size.y) * node.inverse_scale_factor).max(0.);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn line(me: bool, system: bool) -> Line {
        Line { sequence: 0, hero_identity: 7, name: "朋友".into(), class: 8,
            text: "hello".into(), me, system }
    }

    #[test]
    fn unread_counts_only_remote_chat_and_history_evicts_the_oldest() {
        let mut chat = Chat::default();
        chat.push(line(true, false));
        chat.push(line(false, true));
        assert_eq!(chat.unread, 0);
        for _ in 0..81 { chat.push(line(false, false)); }
        assert_eq!(chat.unread, 81);
        assert_eq!(chat.lines.len(), 80);
        assert_eq!(chat.lines.front().unwrap().sequence, 4);
        chat.set_open(true);
        assert_eq!(chat.unread, 0);
        chat.push(line(false, false));
        assert_eq!(chat.unread, 0);
        chat.reset();
        assert!(chat.lines.is_empty());
        assert_eq!(chat.epoch, 1);
    }

    #[test]
    fn remote_arrivals_keep_a_scrolled_up_position_but_own_messages_follow() {
        assert!(!follow_end(95.9, 100., false));
        assert!(follow_end(96., 100., false));
        assert!(follow_end(0., 100., true));
    }
}
