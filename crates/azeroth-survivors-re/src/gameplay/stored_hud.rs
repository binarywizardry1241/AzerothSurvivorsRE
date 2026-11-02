//! Selected 0.109.0 custom HUD constructor14020ccd0 and stored-level updater
//!14028c9f0. docs/analysis/run-hud-0.109.0.md owns their current gates, labels,
//! class atlas, hover and color interpolation. The ready-label pulse is owned
//! separately by docs/analysis/hud-ready-0.109.0.md.
use bevy::prelude::*;
use crate::{assets::MenuArt, localization::Localization, menu_state::MenuState};
use super::{RunSession, RunSet};

const GOLD: Color = Color::srgb(0.973, 0.824, 0.416);
const PAPER: Color = Color::srgb(1., 0.914, 0.659);
const EDGE: Color = Color::srgb(0.690, 0.541, 0.227);
pub const CLASS_ATLAS: &str = "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes.blp";

/// The owning input system consumes this only while its Node is displayed.
#[derive(Component)]
pub(super) struct OpenStoredLevels;
#[derive(Component)]
struct Ready;
#[derive(Component)]
struct ReadyLabel;
#[derive(Component)]
struct Count;
#[derive(Component)]
struct Level;
#[derive(Component)]
struct StoredButton { hover: f32 }
#[derive(Resource)]
struct Hud {
    root: Option<Entity>,
    class: u8,
    locale: String,
}
impl Default for Hud {
    fn default() -> Self { Self { root: None, class: 0, locale: String::new() } }
}
pub(super) struct StoredHudPlugin;
impl Plugin for StoredHudPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<Hud>()
            .add_systems(Update, (sync, animate, animate_ready).chain().in_set(RunSet::Present));
    }
}

fn text(ui: &mut ChildSpawnerCommands, font: Handle<Font>, value: &str, size: f32,
        color: Color, shadow: TextShadow) -> Entity {
    ui.spawn((Text::new(value), TextFont { font, font_size: size, ..default() },
        TextColor(color), shadow)).id()
}
/// Current class lookup14588d790 and atlas-rectangle leaf140063ba0.
fn class_rect(class: u8) -> Rect {
    let (column, row) = match class {
        2 => (0,2), 3 => (0,1), 4 => (2,0), 5 => (2,1), 7 => (1,1),
        8 => (1,0), 9 => (3,1), 11 => (3,0), _ => (0,0),
    };
    let x = [0.,64.,127.,190.,253.];
    Rect::new(x[column], row as f32 * 64., x[column+1], (row+1) as f32 * 64.)
}
fn spawn(commands: &mut Commands, art: &MenuArt, locale: &Localization, class: u8) -> Entity {
    commands.spawn((Node { position_type: PositionType::Absolute, width: Val::Percent(100.),
        height: Val::Percent(100.), ..default() }, GlobalZIndex(4000)))
        .with_children(|root| {
            root.spawn((Ready, Node { position_type: PositionType::Absolute,
                top: Val::Percent(36.), width: Val::Percent(100.),
                justify_content: JustifyContent::Center, ..default() }))
                .with_children(|row| {
                    let label = text(row, art.heading_font.clone(), locale.label("hud.move_to_begin"),
                        40., GOLD, crate::menu::native_text_shadow());
                    row.commands().entity(label).insert(ReadyLabel);
                });
            root.spawn(Node { position_type: PositionType::Absolute, bottom: Val::Px(190.),
                width: Val::Percent(100.), justify_content: JustifyContent::Center, ..default() })
                .with_children(|row| {
                    row.spawn((Button, OpenStoredLevels, StoredButton { hover: 0. }, UiTransform::default(),
                        Node { display: Display::None, align_items: AlignItems::Center,
                            column_gap: Val::Px(12.), padding: UiRect { left: Val::Px(7.),
                                right: Val::Px(18.), top: Val::Px(7.), bottom: Val::Px(7.) },
                            border: UiRect::all(Val::Px(1.)), border_radius: BorderRadius::all(Val::Px(8.)),
                            ..default() }, crate::menu::native_button_gradient(), BorderColor::all(EDGE),
                        BoxShadow::new(GOLD.with_alpha(0.35), Val::Px(0.), Val::Px(0.), Val::Px(0.), Val::Px(18.))))
                        .with_children(|button| {
                            let mut icon = button.spawn((Node { width: Val::Px(40.), height: Val::Px(40.),
                                border: UiRect::all(Val::Px(2.)), border_radius: BorderRadius::all(Val::Percent(50.)),
                                ..default() }, BorderColor::all(GOLD),
                                BoxShadow::new(Color::srgba(0.,0.,0.,0.85),Val::Px(0.),Val::Px(2.),Val::Px(0.),Val::Px(6.))));
                            if let Some(image) = art.icons.get(CLASS_ATLAS) {
                                icon.insert(ImageNode { image: image.clone(), rect: Some(class_rect(class)), ..default() });
                            }
                            icon.with_children(|icon| {
                                icon.spawn((Node { position_type: PositionType::Absolute,
                                    right: Val::Px(-8.), top: Val::Px(-8.), min_width: Val::Px(20.), height: Val::Px(20.),
                                    padding: UiRect::horizontal(Val::Px(4.)), border: UiRect::all(Val::Px(1.)),
                                    border_radius: BorderRadius::all(Val::Px(10.)), align_items: AlignItems::Center,
                                    justify_content: JustifyContent::Center, ..default() },
                                    BorderColor::all(GOLD), BackgroundColor(GOLD)))
                                    .with_children(|badge| {
                                        badge.spawn((Count, Text::new(""), TextFont { font: art.font.clone(),
                                            font_size: 20., ..default() }, TextColor(Color::BLACK)));
                                    });
                            });
                            button.spawn(Node { flex_direction: FlexDirection::Column, ..default() })
                                .with_children(|labels| {
                                    text(labels,art.heading_font.clone(),locale.label("Level Up!"),24.,PAPER,
                                        TextShadow { color: Color::srgb(0.42,0.23,0.02),offset: Vec2::new(0.,2.) });
                                    labels.spawn((Level,Text::new(""),TextFont { font: art.font.clone(),font_size: 11.,..default() },
                                        TextColor(EDGE),crate::menu::native_text_shadow()));
                                });
                        });
                });
        }).id()
}

#[allow(clippy::too_many_arguments)]
fn sync(mut commands: Commands, mut state: ResMut<Hud>, session: Res<RunSession>, menu: Res<MenuState>,
        art: Res<MenuArt>, locale: Res<Localization>, settings: Res<super::run_hud::HudSettings>,
        mut nodes: Query<(&mut Node, Option<&Ready>, Option<&StoredButton>)>,
        mut counts: Query<&mut Text, (With<Count>, Without<Level>)>,
        mut levels: Query<&mut Text, (With<Level>, Without<Count>)>) {
    let Some(game) = session.mechanics.as_ref().filter(|_| menu.in_run) else {
        if let Some(root) = state.root.take() { commands.entity(root).despawn(); }
        return;
    };
    let class = menu.class_id();
    if state.root.is_some() && (state.class != class || state.locale != locale.code()) {
        commands.entity(state.root.take().unwrap()).despawn();
    }
    if state.root.is_none() {
        state.root = Some(spawn(&mut commands,&art,&locale,class));
        state.class = class; state.locale = locale.code().to_owned();
    }
    let ready = !session.started && !game.dead && !game.completed && !session.paused && !game.is_paused_for_choice();
    let stored = game.stored_levels() > 0 && settings.shown("levels") && !game.dead && !game.completed
        && !session.paused && !game.is_paused_for_choice();
    for (mut node,is_ready,is_stored) in &mut nodes {
        if is_ready.is_some() { node.display = if ready { Display::Flex } else { Display::None }; }
        if is_stored.is_some() { node.display = if stored { Display::Flex } else { Display::None }; }
    }
    for mut label in &mut counts { label.0 = game.stored_levels().to_string(); }
    for mut label in &mut levels { label.0 = locale.label("LEVEL {n}").replace("{n}",&game.level.to_string()); }
}

/// Selected 0.109.0 updater 140290b37..140290b60 uses the application's
/// elapsed time, not the run clock. It updates this color even while hidden.
fn ready_alpha(elapsed: f32) -> f32 {
    (elapsed * 4.5).sin().abs() * 0.45 + 0.55
}

fn animate_ready(time: Res<Time>, mut labels: Query<&mut TextColor, With<ReadyLabel>>) {
    for mut color in &mut labels {
        color.0 = GOLD.with_alpha(ready_alpha(time.elapsed_secs()));
    }
}

fn animate(time: Res<Time>, mut buttons: Query<(&Interaction,&Node,&mut StoredButton,
    &mut BorderColor,&mut BoxShadow,&mut UiTransform)>) {
    for (interaction,node,mut button,mut border,mut shadow,mut transform) in &mut buttons {
        if node.display == Display::None { continue; }
        let target = if *interaction == Interaction::None { 0. } else { 1. };
        button.hover += (target-button.hover) * (time.delta_secs()*14.).min(1.);
        let h = button.hover;
        let pulse = (time.elapsed_secs()*2.6).sin()*0.5+0.5;
        let t = h.max(pulse*0.35);
        // Current Color::mix144c84ca0 preserves Srgba and uses weighted sums.
        // Keep its f32 operation order rather than the rearranged a+(b-a)*t.
        let remaining = 1. - t;
        *border = BorderColor::all(Color::srgb(0.690*remaining+t,
            0.541*remaining+0.914*t,0.227*remaining+0.659*t));
        *shadow = BoxShadow(vec![
            ShadowStyle { color: Color::srgba(0.,0.,0.,0.7),x_offset: Val::Px(0.),y_offset: Val::Px(6.),
                spread_radius: Val::Px(0.),blur_radius: Val::Px(18.) },
            ShadowStyle { color: GOLD.with_alpha(0.2+pulse*0.25+h*0.3),x_offset: Val::Px(0.),y_offset: Val::Px(0.),
                spread_radius: Val::Px(0.),blur_radius: Val::Px(20.+h*8.) },
        ]);
        transform.translation = bevy::ui::Val2::px(0.,h*-3.);
        transform.scale = Vec2::splat(1.+h*0.03);
    }
}
