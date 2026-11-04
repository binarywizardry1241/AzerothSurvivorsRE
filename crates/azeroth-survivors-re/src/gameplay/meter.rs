//! Selected 0.105.0 custom meter screen, separate from the Vanilla interface.
//! Owning instructions and static checks: docs/analysis/run-meters-0.105.0.md.
//! Minimap button layout is revalidated against 0.113.2 under gap #56.
//! Current0.121.0 Party DPS inputs/view: docs/analysis/party-meter-ui-0.121.0.md.

mod settings;
mod view;

use super::{RunSession, RunSet};
use crate::{
    assets::MenuArt, localization::Localization, menu_state::MenuState, options::OptionsState,
};
use azeroth_survivors_re::run_meter::MeterMode;
use benilla_app::local_client::{LocalClientExtension, LocalClientInput, LocalClientSet};
use benilla_assets::{LockRecover, WorldAssets};
use bevy::{
    app::Propagate,
    color::Luminance,
    prelude::*,
    reflect::GetPath,
    ui::{
        ComputedUiRenderTargetInfo, DefaultUiCamera, FocusPolicy, RelativeCursorPosition, UiSystems,
    },
    window::PrimaryWindow,
};
use settings::Settings;
use std::collections::{BTreeMap, BTreeSet};

const GOLD: Color = Color::srgb(0.973, 0.824, 0.416);
const MUTED: Color = Color::srgb(0.725, 0.663, 0.510);
const PAPER: Color = Color::srgb(0.949, 0.902, 0.788);
const ICON: &str = "Ability_DualWield";
const TRACKING: &str = "Interface\\Minimap\\Minimap-TrackingBorder.blp";
const PALETTE: [[f32; 3]; 8] = [
    [0.78, 0.25, 0.16],
    [0.25, 0.47, 0.82],
    [0.85, 0.62, 0.15],
    [0.44, 0.27, 0.72],
    [0.25, 0.63, 0.30],
    [0.75, 0.37, 0.60],
    [0.22, 0.62, 0.64],
    [0.62, 0.55, 0.42],
];

#[derive(Component)]
struct Canvas;
#[derive(Component)]
struct MeterWindow;
#[derive(Component)]
struct MeterButton;
#[derive(Component)]
struct MinimapIcon;
#[derive(Component)]
struct ModeMenu;
#[derive(Component)]
struct Rows;
#[derive(Component)]
struct Title;
#[derive(Component)]
struct Rate;
#[derive(Component)]
struct Value(usize);
#[derive(Component)]
struct Fill(usize);
#[derive(Component)]
struct HoverRow(usize);
#[derive(Component)]
struct Tip;
#[derive(Component, Clone, Copy)]
enum Action {
    Toggle,
    Close,
    Reset,
    Modes,
    Mode(MeterMode),
    Move,
    Resize,
}

struct Drag {
    resize: bool,
    pointer: Vec2,
    position: Vec2,
    size: Vec2,
}

#[derive(Default)]
struct Mirror {
    menu: Option<String>,
    client: Option<String>,
    effective: String,
}

#[derive(Resource)]
struct Meter {
    settings: Settings,
    menu: bool,
    drag: Option<Drag>,
    identity: Option<u64>,
    view: view::View,
    snapshot: view::Snapshot,
    root: Option<Entity>,
    row_keys: Vec<(String, bool, String, Option<[f32; 3]>)>,
    row_mode: MeterMode,
    row_locale: String,
    row_party_available: bool,
    icons: BTreeMap<String, Handle<Image>>,
    attempted: BTreeSet<String>,
    mirrors: [Mirror; 3],
    scale: f32,
    shown: bool,
    on_top: bool,
}

impl Default for Meter {
    fn default() -> Self {
        Self {
            settings: Settings::load(),
            menu: false,
            drag: None,
            identity: None,
            view: Default::default(),
            snapshot: Default::default(),
            root: None,
            row_keys: Vec::new(),
            row_mode: MeterMode::Damage,
            row_locale: String::new(),
            row_party_available: false,
            icons: BTreeMap::new(),
            attempted: BTreeSet::new(),
            mirrors: Default::default(),
            scale: 1.,
            shown: true,
            on_top: true,
        }
    }
}

pub(super) struct MeterPlugin;
impl Plugin for MeterPlugin {
    fn build(&self, app: &mut App) {
        // The meter also works without the separate custom run HUD's registry.
        let mut extension = app.world_mut().resource_mut::<LocalClientExtension>();
        for name in ["hudMeter", "hudScale", "meterOnTop"] {
            if !extension
                .cvar_defaults
                .iter()
                .any(|(key, _)| key.eq_ignore_ascii_case(name))
            {
                extension.cvar_defaults.push((name.into(), "1".into()));
            }
        }
        app.init_resource::<Meter>()
            .add_systems(
                Update,
                capture_pointer.in_set(LocalClientSet::OverlayCapture),
            )
            .add_systems(Update, cvars.in_set(RunSet::Input).before(super::controls))
            .add_systems(
                Update,
                input
                    .in_set(LocalClientSet::OverlayInput)
                    .after(LocalClientSet::Input),
            )
            .add_systems(Update, (present, paint).chain().in_set(RunSet::Present))
            .add_systems(
                PostUpdate,
                fit.in_set(UiSystems::Prepare)
                    .after(bevy::ui::update::propagate_ui_target_cameras)
                    .before(UiSystems::Propagate),
            );
    }
}

fn capture_pointer(
    meter: Res<Meter>,
    menu: Res<MenuState>,
    session: Res<RunSession>,
    nodes: Query<(
        &RelativeCursorPosition,
        Option<&MeterWindow>,
        Option<&MeterButton>,
    )>,
    mut extension: ResMut<LocalClientExtension>,
) {
    extension.pointer_drag_capture |= meter.drag.is_some();
    extension.pointer_over_ui |= meter.drag.is_some()
        || (menu.in_run
            && session.mechanics.is_some()
            && meter.shown
            && nodes.iter().any(|(cursor, window, button)| {
                cursor.cursor_over && (button.is_some() || (window.is_some() && meter.settings.open))
            }));
}

fn cvars(
    mut meter: ResMut<Meter>,
    input: Res<LocalClientInput>,
    mut options: ResMut<OptionsState>,
    mut extension: ResMut<LocalClientExtension>,
) {
    for (index, name) in ["hudMeter", "hudScale", "meterOnTop"]
        .into_iter()
        .enumerate()
    {
        let mirror = &mut meter.mirrors[index];
        let menu = options.cvar(name).map(str::to_owned);
        let client = input
            .cvars
            .iter()
            .find(|(key, _)| key.eq_ignore_ascii_case(name))
            .map(|(_, value)| value.clone());
        let pending = extension
            .cvar_writes
            .iter()
            .any(|(key, _)| key.eq_ignore_ascii_case(name));
        if menu != mirror.menu {
            if let Some(value) = &menu {
                mirror.effective.clone_from(value);
                if client.as_ref() != Some(value) && !pending {
                    extension.cvar_writes.push((name.into(), value.clone()));
                }
            }
        } else if !pending && client != mirror.client {
            if let Some(value) = &client {
                mirror.effective.clone_from(value);
                options.set_engine_cvar(name, value);
            }
        }
        if mirror.effective.is_empty() && menu.is_none() && client.is_none() {
            mirror.effective = "1".into();
        }
        mirror.menu = options.cvar(name).map(str::to_owned);
        mirror.client = client;
    }
    meter.shown = meter.mirrors[0].effective.trim() != "0";
    meter.scale = meter.mirrors[1]
        .effective
        .trim()
        .parse::<f32>()
        .ok()
        .filter(|v| v.is_finite())
        .map_or(1., |v| v.clamp(0.5, 2.));
    meter.on_top = meter.mirrors[2].effective.trim() != "0";
}

fn position(settings: &Settings, viewport: Vec2, scale: f32) -> Vec2 {
    settings.position.unwrap_or(Vec2::new(
        viewport.x - settings.size.x * scale - 16.,
        viewport.y * 0.42,
    ))
}

fn input(
    mut meter: ResMut<Meter>,
    session: Res<RunSession>,
    menu: Res<MenuState>,
    mouse: Res<ButtonInput<MouseButton>>,
    touches: Res<Touches>,
    windows: Query<&Window, With<PrimaryWindow>>,
    nodes: Query<(&Action, Ref<Interaction>, &RelativeCursorPosition)>,
    hover: Query<&RelativeCursorPosition, With<MeterWindow>>,
    mut extension: ResMut<LocalClientExtension>,
) {
    if !menu.in_run || session.mechanics.is_none() || !meter.shown {
        if meter.drag.take().is_some() {
            meter.settings.save();
        }
        return;
    }
    extension.pointer_over_ui |= meter.drag.is_some()
        || (meter.settings.open && hover.iter().any(|cursor| cursor.cursor_over));
    // The retained move/resize owner finishes the drag before querying the cursor.
    let touch = touches.iter().next();
    if meter.drag.is_some() && !mouse.pressed(MouseButton::Left) && touch.is_none() {
        meter.drag = None;
        meter.settings.save();
        return;
    }
    let Ok(window) = windows.single() else { return };
    let Some(pointer) = window.cursor_position().or_else(|| touch.map(|touch| touch.position())) else {
        return;
    };
    if let Some((resize, start, position, size)) = meter
        .drag
        .as_ref()
        .map(|drag| (drag.resize, drag.pointer, drag.position, drag.size))
    {
        let delta = pointer - start;
        if resize {
            meter.settings.size = settings::bounded_size(size + delta / meter.scale);
        } else {
            meter.settings.position = Some(position + delta);
        }
        return;
    }
    let pressed = nodes
        .iter()
        .filter(|(_, interaction, _)| {
            interaction.is_changed() && **interaction == Interaction::Pressed
        })
        .filter(|(action, _, _)| matches!(action, Action::Toggle) || meter.settings.open)
        .map(|(action, _, _)| *action)
        .min_by_key(|action| match action {
            Action::Move => 2,
            Action::Resize => 1,
            _ => 0,
        });
    let Some(action) = pressed else { return };
    extension.pointer_over_ui = true;
    match action {
        Action::Toggle => {
            meter.settings.open = !meter.settings.open;
            meter.menu = false;
            meter.settings.save();
        }
        Action::Close => {
            meter.settings.open = false;
            meter.menu = false;
            meter.settings.save();
        }
        Action::Reset => {
            if matches!(meter.settings.mode, MeterMode::Damage | MeterMode::Healing) {
                meter.view.reset();
            }
            meter.menu = false;
        }
        Action::Modes => meter.menu = !meter.menu,
        Action::Mode(mode) => {
            if meter.settings.mode != mode {
                meter.settings.mode = mode;
                meter.settings.save();
            }
            meter.menu = false;
        }
        Action::Move | Action::Resize => {
            meter.menu = false;
            meter.drag = Some(Drag {
                resize: matches!(action, Action::Resize),
                pointer,
                position: position(
                    &meter.settings,
                    Vec2::new(window.width(), window.height()),
                    meter.scale,
                ),
                size: meter.settings.size,
            });
        }
    }
}

fn label(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    text: impl Into<String>,
    size: f32,
    color: Color,
) -> Entity {
    ui.spawn((
        Text::new(text),
        TextFont {
            font: art.font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        crate::menu::native_text_shadow(),
        Pickable::IGNORE,
    ))
    .id()
}
fn button(ui: &mut ChildSpawnerCommands, action: Action, text: &str, art: &MenuArt) {
    let mode = matches!(action, Action::Mode(_));
    let close = matches!(action, Action::Close);
    let bordered = matches!(action, Action::Modes | Action::Reset);
    ui.spawn((
        Button,
        action,
        RelativeCursorPosition::default(),
        Node {
            width: if close { Val::Px(16.) } else { Val::Auto },
            height: if mode { Val::Auto } else { Val::Px(16.) },
            padding: if mode {
                UiRect::axes(Val::Px(6.), Val::Px(2.))
            } else if close {
                UiRect::default()
            } else {
                UiRect::horizontal(Val::Px(4.))
            },
            border: UiRect::all(Val::Px(if bordered { 1. } else { 0. })),
            border_radius: BorderRadius::all(Val::Px(3.)),
            align_items: AlignItems::Center,
            justify_content: if mode {
                JustifyContent::Default
            } else {
                JustifyContent::Center
            },
            ..default()
        },
        BackgroundColor(Color::NONE),
        BorderColor::all(crate::menu::EDGE.with_alpha(0.8)),
    ))
    .with_children(|ui| {
        let size = match action {
            Action::Close => 13.,
            Action::Reset => 10.,
            Action::Mode(_) => 12.,
            _ => 11.,
        };
        let color = match action {
            Action::Modes => GOLD,
            Action::Reset | Action::Close => MUTED,
            _ => PAPER,
        };
        label(ui, art, text, size, color);
    });
}

/// 14016c400 and 140171380 assign these states directly; neither eases them.
fn paint(
    meter: Res<Meter>,
    buttons: Query<&Interaction, With<MeterButton>>,
    mut icons: Query<&mut ImageNode, With<MinimapIcon>>,
    mut actions: Query<(&Action, &Interaction, &mut BackgroundColor)>,
) {
    let active = meter.settings.open
        || buttons
            .iter()
            .any(|interaction| *interaction != Interaction::None);
    for mut icon in &mut icons {
        icon.color = if active {
            Color::WHITE
        } else {
            Color::srgb(0.78, 0.78, 0.78)
        };
    }
    for (action, interaction, mut background) in &mut actions {
        if matches!(
            action,
            Action::Modes | Action::Reset | Action::Close | Action::Mode(_)
        ) {
            background.0 = if *interaction != Interaction::None {
                Color::srgba(1., 0.85, 0.4, 0.18)
            } else if matches!(action, Action::Mode(mode) if *mode == meter.settings.mode) {
                Color::srgba(1., 0.85, 0.4, 0.1)
            } else {
                Color::NONE
            };
        }
    }
}
fn mode_name(mode: MeterMode) -> &'static str {
    match mode {
        MeterMode::Damage => "Damage Done",
        MeterMode::Healing => "Healing Done",
        MeterMode::Boss => "Boss Damage",
        MeterMode::Party => "Party DPS",
    }
}
fn fill_gradient(rgb: [f32; 3]) -> BackgroundGradient {
    let darker = Color::srgb(rgb[0], rgb[1], rgb[2]).darker(0.12).to_srgba();
    BackgroundGradient::from(LinearGradient {
        angle: std::f32::consts::FRAC_PI_2,
        stops: vec![
            Color::linear_rgba(rgb[0], rgb[1], rgb[2], 0.95).into(),
            Color::linear_rgba(darker.red, darker.green, darker.blue, 0.75).into(),
        ],
        ..default()
    })
}
fn spawn(commands: &mut Commands, art: &MenuArt, meter: &Meter, locale: &Localization) -> Entity {
    commands
        .spawn((
            Canvas,
            Node {
                position_type: PositionType::Absolute,
                ..default()
            },
            FocusPolicy::Pass,
            Pickable::IGNORE,
        ))
        .with_children(|canvas| {
            canvas
                .spawn((
                    MeterButton,
                    Button,
                    Action::Toggle,
                    RelativeCursorPosition::default(),
                    Node {
                        // Placement uses live window/FrameXML geometry on the next pass.
                        display: Display::None,
                        position_type: PositionType::Absolute,
                        width: Val::Px(31.),
                        height: Val::Px(31.),
                        ..default()
                    },
                    UiTransform::default(),
                    GlobalZIndex(4060),
                ))
                .with_children(|ui| {
                    // The tracking texture includes transparent padding. Preserve
                    // its native 53px quad and the independently anchored inset.
                    ui.spawn((
                        Node {
                            position_type: PositionType::Absolute,
                            left: Val::Px(6.),
                            top: Val::Px(5.),
                            width: Val::Px(21.),
                            height: Val::Px(21.),
                            border_radius: BorderRadius::MAX,
                            ..default()
                        },
                        BackgroundColor(Color::srgba(0., 0., 0., 0.8)),
                        Pickable::IGNORE,
                    ));
                    if let Some(icon) = meter.icons.get(ICON) {
                        ui.spawn((
                            MinimapIcon,
                            ImageNode::new(icon.clone()),
                            Node {
                                position_type: PositionType::Absolute,
                                left: Val::Px(7.),
                                top: Val::Px(6.),
                                width: Val::Px(19.),
                                height: Val::Px(19.),
                                ..default()
                            },
                            Pickable::IGNORE,
                        ));
                    }
                    if let Some(border) = meter.icons.get(TRACKING) {
                        ui.spawn((
                            ImageNode::new(border.clone()),
                            Node {
                                position_type: PositionType::Absolute,
                                left: Val::Px(0.),
                                top: Val::Px(0.),
                                width: Val::Px(53.),
                                height: Val::Px(53.),
                                ..default()
                            },
                            Pickable::IGNORE,
                        ));
                    }
                });
            canvas
                .spawn((
                    MeterWindow,
                    Button,
                    RelativeCursorPosition::default(),
                    Node {
                        display: Display::None,
                        position_type: PositionType::Absolute,
                        width: Val::Px(meter.settings.size.x),
                        height: Val::Px(meter.settings.size.y),
                        flex_direction: FlexDirection::Column,
                        border: UiRect::all(Val::Px(1.)),
                        border_radius: BorderRadius::all(Val::Px(10.)),
                        ..default()
                    },
                    crate::menu::native_panel_style(),
                    GlobalZIndex(4050),
                ))
                .with_children(|window| {
                    window
                        .spawn((
                            Button,
                            Action::Move,
                            RelativeCursorPosition::default(),
                            Node {
                                width: Val::Percent(100.),
                                height: Val::Px(22.),
                                flex_shrink: 0.,
                                padding: UiRect {
                                    left: Val::Px(7.),
                                    right: Val::Px(3.),
                                    ..default()
                                },
                                align_items: AlignItems::Center,
                                column_gap: Val::Px(6.),
                                border: UiRect::bottom(Val::Px(1.)),
                                ..default()
                            },
                            BorderColor::all(crate::menu::EDGE.with_alpha(0.7)),
                        ))
                        .insert(BackgroundGradient::from(LinearGradient {
                            angle: std::f32::consts::PI,
                            stops: vec![
                                Color::linear_rgba(0.23, 0.17, 0.08, 0.95).into(),
                                Color::linear_rgba(0.12, 0.09, 0.04, 0.95).into(),
                            ],
                            ..default()
                        }))
                        .with_children(|header| {
                            let entity =
                                label(header, art, mode_name(meter.settings.mode), 13., GOLD);
                            header.commands().entity(entity).insert(Title);
                            button(header, Action::Modes, "^", art);
                            header
                                .spawn((
                                    Node {
                                        flex_grow: 1.,
                                        min_width: Val::Px(0.),
                                        justify_content: JustifyContent::FlexEnd,
                                        overflow: Overflow::clip(),
                                        ..default()
                                    },
                                    Pickable::IGNORE,
                                ))
                                .with_children(|ui| {
                                    let entity = label(ui, art, "", 11., MUTED);
                                    ui.commands().entity(entity).insert(Rate);
                                });
                            button(header, Action::Reset, locale.label("Reset"), art);
                            button(header, Action::Close, "x", art);
                        });
                    window.spawn((
                        Rows,
                        Node {
                            flex_direction: FlexDirection::Column,
                            flex_grow: 1.,
                            min_height: Val::Px(0.),
                            padding: UiRect::all(Val::Px(3.)),
                            row_gap: Val::Px(2.),
                            overflow: Overflow::clip_y(),
                            ..default()
                        },
                        Pickable::IGNORE,
                    ));
                    window.spawn((
                        Button,
                        Action::Resize,
                        RelativeCursorPosition::default(),
                        Node {
                            position_type: PositionType::Absolute,
                            right: Val::Px(1.),
                            bottom: Val::Px(1.),
                            width: Val::Px(14.),
                            height: Val::Px(14.),
                            ..default()
                        },
                        BackgroundGradient::from(LinearGradient {
                            angle: 2.3561945,
                            stops: vec![
                                ColorStop::new(Color::NONE, Val::Percent(50.)),
                                ColorStop::new(
                                    Color::linear_rgba(0.690, 0.541, 0.227, 0.85),
                                    Val::Percent(50.),
                                ),
                            ],
                            ..default()
                        }),
                    ));
                    window
                        .spawn((
                            ModeMenu,
                            Node {
                                position_type: PositionType::Absolute,
                                left: Val::Px(4.),
                                top: Val::Px(24.),
                                display: Display::None,
                                flex_direction: FlexDirection::Column,
                                border: UiRect::all(Val::Px(1.)),
                                border_radius: BorderRadius::all(Val::Px(4.)),
                                padding: UiRect::all(Val::Px(3.)),
                                row_gap: Val::Px(1.),
                                ..default()
                            },
                            BackgroundColor(Color::srgba(0.02, 0.02, 0.05, 0.96)),
                            BorderColor::all(crate::menu::EDGE),
                            ZIndex(10),
                        ))
                        .with_children(|ui| {
                            for mode in [MeterMode::Damage, MeterMode::Healing, MeterMode::Boss, MeterMode::Party] {
                                button(ui, Action::Mode(mode), locale.label(mode_name(mode)), art);
                            }
                        });
                });
        })
        .id()
}

fn image(meter: &mut Meter, key: &str, assets: Option<&WorldAssets>, images: &mut Assets<Image>) {
    if key.is_empty() || meter.attempted.contains(key) {
        return;
    }
    let Some(assets) = assets else { return };
    meter.attempted.insert(key.to_owned());
    let path = if key.contains('\\') {
        key.to_owned()
    } else {
        format!("Interface\\Icons\\{key}.blp")
    };
    if let Ok(image) = crate::assets::read_image(&mut assets.chain.lock_recover(), &path) {
        meter.icons.insert(key.to_owned(), images.add(image));
    }
}

#[allow(clippy::too_many_arguments)]
fn present(
    mut commands: Commands,
    mut meter: ResMut<Meter>,
    session: Res<RunSession>,
    menu: Res<MenuState>,
    art: Res<MenuArt>,
    locale: Res<Localization>,
    input: Res<LocalClientInput>,
    windows: Query<&Window, With<PrimaryWindow>>,
    assets: Option<Res<WorldAssets>>,
    mut images: ResMut<Assets<Image>>,
    mut nodes: Query<
        (
            Entity,
            &mut Node,
            Option<&MeterWindow>,
            Option<&MeterButton>,
            Option<&ModeMenu>,
            Option<&Action>,
            Option<&mut UiTransform>,
        ),
        Without<Fill>,
    >,
    row_parents: Query<Entity, With<Rows>>,
    mut labels: Query<(&mut Text, Option<&Title>, Option<&Rate>, Option<&Value>)>,
    mut fills: Query<(&Fill, &mut Node), (With<Fill>, Without<MeterWindow>)>,
    hovers: Query<(&Interaction, Option<&HoverRow>, Option<&MeterButton>)>,
    tips: Query<Entity, With<Tip>>,
) {
    for tip in &tips {
        commands.entity(tip).despawn();
    }
    let Some(game) = session.mechanics.as_ref().filter(|_| menu.in_run) else {
        if let Some(root) = meter.root.take() {
            commands.entity(root).despawn();
        }
        meter.identity = None;
        return;
    };
    if meter.identity != Some(session.identity) {
        meter.identity = Some(session.identity);
        meter.view = Default::default();
        meter.row_locale.clear();
    }
    let mode = meter.settings.mode;
    meter.snapshot = meter.view.snapshot(game, mode, &locale);
    for key in [ICON, TRACKING] {
        image(&mut meter, key, assets.as_deref(), &mut images);
    }
    let keys = meter
        .snapshot
        .rows
        .iter()
        .map(|row| (row.name.clone(), row.talent, row.icon.clone(), row.color))
        .collect::<Vec<_>>();
    for (_, _, key, _) in &keys {
        image(&mut meter, key, assets.as_deref(), &mut images);
    }
    if meter.root.is_none() {
        meter.root = Some(spawn(&mut commands, &art, &meter, &locale));
        meter.row_locale.clear();
    }
    let Ok(window) = windows.single() else { return };
    let viewport = Vec2::new(window.width(), window.height());
    let minimap = input
        .minimap_rect
        .filter(|rect| (rect[2] - rect[0]) * viewport.x > 1.);
    let origin = position(&meter.settings, viewport, meter.scale) / meter.scale;
    for (_, mut node, is_window, is_button, is_menu, action, transform) in &mut nodes {
        if is_window.is_some() {
            node.display = if meter.shown && meter.settings.open {
                Display::Flex
            } else {
                Display::None
            };
            node.left = Val::Px(origin.x);
            node.top = Val::Px(origin.y);
            node.width = Val::Px(meter.settings.size.x);
            node.height = Val::Px(meter.settings.size.y);
        }
        if is_button.is_some() {
            node.display = if meter.shown && minimap.is_some() {
                Display::Flex
            } else {
                Display::None
            };
            if let Some([left, top, right, bottom]) = minimap {
                let factor = (right - left) * viewport.x / 140.;
                node.left = Val::Px(
                    ((left + right) * viewport.x * 0.5 - 75.175407 * factor) / meter.scale - 15.5,
                );
                node.top = Val::Px(
                    ((top + bottom) * viewport.y * 0.5 + 27.361612 * factor) / meter.scale - 15.5,
                );
                // Scale the whole native 31px button about its center, including
                // its overhanging border and picking. Cancel the Canvas zoom once.
                if let Some(mut transform) = transform {
                    transform.scale = Vec2::splat(factor / meter.scale);
                }
            }
        }
        if is_menu.is_some() {
            node.display = if meter.menu {
                Display::Flex
            } else {
                Display::None
            };
        }
        if matches!(action, Some(Action::Reset)) {
            node.display = if matches!(mode, MeterMode::Damage | MeterMode::Healing) {
                Display::Flex
            } else {
                Display::None
            };
        }
    }
    let z = if meter.on_top && game.is_paused_for_choice() {
        6040
    } else {
        4050
    };
    for (entity, _, is_window, _, _, _, _) in &nodes {
        if is_window.is_some() {
            commands.entity(entity).insert(GlobalZIndex(z));
        }
    }
    if meter.row_keys != keys || meter.row_mode != mode || meter.row_locale != locale.code()
        || meter.row_party_available != meter.snapshot.party_available {
        let mut populated = false;
        for parent in &row_parents {
            populated = true;
            commands.entity(parent).despawn_children();
            commands.entity(parent).with_children(|ui| {
                if meter.snapshot.rows.is_empty() {
                    let empty = match mode {
                        MeterMode::Damage => "No damage yet.",
                        MeterMode::Healing => "No healing yet.",
                        MeterMode::Boss => "No boss fought yet.",
                        MeterMode::Party if !meter.snapshot.party_available => "Only in a party.",
                        MeterMode::Party => "No damage yet.",
                    };
                    label(ui, &art, locale.label(empty), 11., MUTED);
                }
                for (index, row) in meter.snapshot.rows.iter().enumerate() {
                    let color = row.color.unwrap_or(PALETTE[index % 8]);
                    ui.spawn((
                        HoverRow(index),
                        Interaction::None,
                        Node {
                            width: Val::Percent(100.),
                            height: Val::Px(18.),
                            flex_shrink: 0.,
                            align_items: AlignItems::Center,
                            padding: UiRect::horizontal(Val::Px(4.)),
                            ..default()
                        },
                        BackgroundColor(Color::srgba(1., 1., 1., 0.05)),
                    ))
                    .with_children(|ui| {
                        ui.spawn((
                            Fill(index),
                            Node {
                                position_type: PositionType::Absolute,
                                left: Val::Px(0.),
                                top: Val::Px(0.),
                                width: Val::Percent(row.fill),
                                height: Val::Percent(100.),
                                ..default()
                            },
                            fill_gradient(color),
                            Pickable::IGNORE,
                        ));
                        if let Some(icon) = meter.icons.get(&row.icon) {
                            ui.spawn((
                                ImageNode::new(icon.clone()),
                                Node {
                                    width: Val::Px(16.),
                                    height: Val::Px(16.),
                                    margin: UiRect::right(Val::Px(4.)),
                                    ..default()
                                },
                                Pickable::IGNORE,
                            ));
                        }
                        ui.spawn((
                            Node {
                                flex_grow: 1.,
                                min_width: Val::Px(0.),
                                overflow: Overflow::clip(),
                                ..default()
                            },
                            Pickable::IGNORE,
                        ))
                        .with_children(|ui| {
                            label(
                                ui,
                                &art,
                                format!("{}. {}", index + 1, row.name),
                                12.,
                                if row.talent {
                                    Color::srgb(0.55, 0.8, 1.)
                                } else {
                                    PAPER
                                },
                            );
                        });
                        if row.talent {
                            ui.spawn((
                                Node {
                                    padding: UiRect::horizontal(Val::Px(3.)),
                                    border: UiRect::all(Val::Px(1.)),
                                    border_radius: BorderRadius::all(Val::Px(3.)),
                                    flex_shrink: 0.,
                                    ..default()
                                },
                                BorderColor::all(Color::srgba(0.55, 0.8, 1., 0.6)),
                                BackgroundColor(Color::srgba(0., 0., 0., 0.35)),
                                Pickable::IGNORE,
                            ))
                            .with_children(|ui| {
                                label(ui, &art, "proc", 9., Color::srgb(0.55, 0.8, 1.));
                            });
                        }
                        let id = label(ui, &art, "", 11., PAPER);
                        ui.commands().entity(id).insert(Value(index));
                    });
                }
            });
        }
        if populated {
            meter.row_keys = keys;
            meter.row_mode = mode;
            meter.row_locale = locale.code().to_owned();
            meter.row_party_available = meter.snapshot.party_available;
        }
    }
    for (mut text, title, rate, value) in &mut labels {
        if title.is_some() {
            text.0 = locale.label(mode_name(mode)).to_owned();
        }
        if rate.is_some() {
            let snapshot = &meter.snapshot;
            text.0 = if mode == MeterMode::Boss && !snapshot.live {
                locale
                    .label("{dps} dps · {time}")
                    .replace("{dps}", &view::compact(snapshot.rate))
                    .replace(
                        "{time}",
                        &format!(
                            "{}:{:02}",
                            snapshot.seconds as u32 / 60,
                            snapshot.seconds as u32 % 60
                        ),
                    )
            } else {
                let (template, field) = if mode == MeterMode::Healing {
                    ("{hps} hps · now {current}", "{hps}")
                } else {
                    ("{dps} dps · now {current}", "{dps}")
                };
                locale
                    .label(template)
                    .replace(field, &view::compact(snapshot.rate))
                    .replace("{current}", &view::compact(snapshot.current))
            };
        }
        if let Some(Value(index)) = value {
            if let Some(row) = meter.snapshot.rows.get(*index) {
                text.0 = format!(
                    "{} ({}, {:.0}%)",
                    view::compact(row.total),
                    view::compact(row.rate),
                    row.share
                );
            }
        }
    }
    for (Fill(index), mut node) in &mut fills {
        if let Some(row) = meter.snapshot.rows.get(*index) {
            node.width = Val::Percent(row.fill);
        }
    }
    if !meter.shown {
        return;
    }
    let Some(pointer) = window.cursor_position() else {
        return;
    };
    let hovered = hovers
        .iter()
        .find(|(interaction, row, _)| **interaction != Interaction::None && row.is_some())
        .and_then(|(_, row, _)| row.and_then(|HoverRow(index)| meter.snapshot.rows.get(*index)));
    let lines =
        if meter.settings.open {
            hovered.filter(|row| !row.breakdown.is_empty()).map(|row| {
                let mut lines = vec![row.name.clone()];
                lines.extend(row.breakdown.iter().map(|(name, total)| {
                    format!("{name}: {:.1}%", total * 100. / row.total.max(1.))
                }));
                lines
            })
        } else {
            None
        };
    let lines = lines.or_else(|| {
        hovers
            .iter()
            .any(|(interaction, _, button)| button.is_some() && *interaction != Interaction::None)
            .then(|| {
                vec![
                    locale.label("Damage Meter").to_owned(),
                    locale.label("Click to show or hide.").to_owned(),
                ]
            })
    });
    if let Some(lines) = lines {
        let tip = commands
            .spawn((
                Tip,
                Node {
                    position_type: PositionType::Absolute,
                    right: Val::Px(((viewport.x - pointer.x) / meter.scale + 10.).max(0.)),
                    top: Val::Px(pointer.y / meter.scale + 12.),
                    padding: UiRect::all(Val::Px(6.)),
                    border: UiRect::all(Val::Px(1.)),
                    flex_direction: FlexDirection::Column,
                    ..default()
                },
                BackgroundColor(Color::srgb(0.02, 0.02, 0.04)),
                BorderColor::all(GOLD),
                GlobalZIndex(6045),
                Pickable::IGNORE,
            ))
            .with_children(|ui| {
                for (index, line) in lines.into_iter().enumerate() {
                    label(
                        ui,
                        &art,
                        line,
                        if index == 0 { 12. } else { 11. },
                        if index == 0 { GOLD } else { PAPER },
                    );
                }
            })
            .id();
        if let Some(root) = meter.root {
            commands.entity(root).add_child(tip);
        }
    }
}

/// Match the native Zoomed-root layout scale without scaling the stock client
/// or relying on the separate HUD implementation's global UiScale setting.
fn fit(
    mut commands: Commands,
    meter: Res<Meter>,
    windows: Query<&Window, With<PrimaryWindow>>,
    camera: DefaultUiCamera,
    cameras: Query<&Camera>,
    mut roots: Query<(Entity, &mut Node), With<Canvas>>,
) {
    let Ok(window) = windows.single() else { return };
    let Some(camera) = camera.get().and_then(|entity| cameras.get(entity).ok()) else {
        return;
    };
    for (entity, mut node) in &mut roots {
        node.width = Val::Px(window.width() / meter.scale);
        node.height = Val::Px(window.height() / meter.scale);
        let mut target = ComputedUiRenderTargetInfo::default();
        *target
            .path_mut::<f32>("scale_factor")
            .expect("Bevy target scale") =
            camera.target_scaling_factor().unwrap_or(1.) * meter.scale;
        *target
            .path_mut::<UVec2>("physical_size")
            .expect("Bevy target size") = camera.physical_viewport_size().unwrap_or(UVec2::ZERO);
        commands.entity(entity).insert(Propagate(target));
    }
}
