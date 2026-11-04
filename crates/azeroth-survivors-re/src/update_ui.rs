//! Updater notification and state-specific dialog, revalidated for 0.109.0.
//!
//! HTTP/file/process adapters are connected behind the exact shipped-executable gate.
//! Validation uses injected hosts only; the RE executable name remains ineligible.
//! Current lifecycle/input evidence is in docs/analysis/updater-0.109.0.md.

use crate::{
    assets::MenuArt,
    canvas::NativeCanvas,
    localization::Localization,
    menu::{self, BUTTON_EDGE, GOLD, MUTED, PAPER},
    update::{
        install::ReadyDelay,
        worker::{self, Shared, State},
        CheckRequest, UpdatePlan,
    },
};
use bevy::app::AppExit;
use bevy::{picking::Pickable, prelude::*, ui::FocusPolicy};
use std::sync::{mpsc, Mutex};

const CHECKING: &str = "Checking for updates…";
const BUSY: &str = "An update is already downloading.";
const CURRENT: &str = "You’re up to date (v{version}).";
const CHECK_ERROR: &str = "Could not check for updates: {error}. Press the button to try again.";
const DATA_WAITING: &str = "New game data is out. It waits in the hero picker’s corner.";
const EXE_WAITING: &str = "v{version} is out. It waits in the hero picker’s corner.";

type CheckResult = Result<Option<UpdatePlan>, String>;

struct PendingCheck {
    result: Mutex<mpsc::Receiver<CheckResult>>,
    startup: bool,
    manual: bool,
}

impl PendingCheck {
    fn spawn(request: CheckRequest, startup: bool) -> Option<Self> {
        let (send, receive) = mpsc::channel();
        std::thread::Builder::new()
            .name("rogue-update".into())
            .spawn(move || {
                let _ = send.send(request.check());
            })
            .ok()?;
        Some(Self {
            result: Mutex::new(receive),
            startup,
            manual: !startup,
        })
    }

    fn poll(&mut self) -> Option<CheckResult> {
        match self.result.get_mut().unwrap().try_recv() {
            Ok(result) => Some(result),
            Err(mpsc::TryRecvError::Empty) => None,
            Err(mpsc::TryRecvError::Disconnected) => {
                Some(Err("could not start the check".into()))
            }
        }
    }
}

struct CheckNotice {
    text: String,
    expires: Option<f32>,
}

#[derive(Component)]
pub(crate) struct ManualCheckButton;

#[derive(Component)]
struct Toast;

/// Current popup1401c78d0/banner1401c6520 read the frontend's tag+0 and bool+13.
/// Keyboard14018dc00 owns the entering tag; login/logout change the menu flag.
#[derive(Resource, Clone, Copy, PartialEq, Eq)]
pub struct NativeUpdateContext {
    pub mode: u32,
    pub menus_enabled: bool,
}

impl Default for NativeUpdateContext {
    fn default() -> Self {
        Self {
            mode: 0,
            menus_enabled: true,
        }
    }
}

impl NativeUpdateContext {
    fn visible(self) -> bool {
        self.mode == 0 && self.menus_enabled
    }

    fn from_frontend(entering: bool, in_run: bool, stock_frontend: bool) -> Self {
        Self {
            mode: entering as u32,
            menus_enabled: !stock_frontend && !in_run,
        }
    }
}

#[derive(Resource, Default)]
pub struct UpdateUi {
    shared: Shared,
    state: State,
    manual_enabled: bool,
    pending_check: Option<PendingCheck>,
    check_notice: Option<CheckNotice>,
    //011351: newer results open the dialog first. Later is not persisted.
    dismissed: bool,
    delay: ReadyDelay,
}
impl UpdateUi {
    pub fn modal_open(&self, context: &NativeUpdateContext) -> bool {
        self.state.modal(self.dismissed, context.visible())
    }

    pub(crate) fn manual_enabled(&self) -> bool {
        self.manual_enabled
    }

    fn show_notice(&mut self, text: String, expires: Option<f32>) {
        self.check_notice = Some(CheckNotice { text, expires });
    }
}

/// The native full-window modal blocks menu input beneath it.
pub fn menu_input_enabled(state: Res<UpdateUi>, context: Res<NativeUpdateContext>) -> bool {
    !state.modal_open(&context)
}

pub struct UpdateUiPlugin;

#[derive(SystemSet, Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum UpdateUiSet {
    Input,
}

impl Plugin for UpdateUiPlugin {
    fn build(&self, app: &mut App) {
        let stock_frontend = app
            .world()
            .contains_resource::<benilla_app::local_client::LocalStockFrontend>();
        app.init_resource::<UpdateUi>()
            .insert_resource(NativeUpdateContext::from_frontend(
                false,
                false,
                stock_frontend,
            ))
            .add_systems(Startup, start_check)
            .add_systems(PreUpdate, sync_context)
            .add_systems(
                Update,
                (manual_input, poll_state, input, finish_ready)
                    .chain()
                    .in_set(UpdateUiSet::Input),
            )
            .add_systems(
                Update,
                (
                    sync_context,
                    rebuild,
                    rebuild_body,
                    animate,
                    refresh_progress,
                    draw_check_notice,
                )
                    .chain()
                    .after(UpdateUiSet::Input)
                    .after(crate::gameplay::RunSet::Input),
            );
    }
}

/// The custom frontend's initial bool+13 is false in stock GlueXML mode.
/// Current login140192bf9 clears it; logout1401928c2 restores bool+12.
/// Keep input and drawing on the same live lifecycle, without using page/dialog state.
fn sync_context(
    menu: Res<crate::menu_state::MenuState>,
    stock_frontend: Option<Res<benilla_app::local_client::LocalStockFrontend>>,
    mut context: ResMut<NativeUpdateContext>,
) {
    let next =
        NativeUpdateContext::from_frontend(menu.entering, menu.in_run, stock_frontend.is_some());
    if *context != next {
        *context = next;
    }
}

#[derive(Component)]
struct Root;
#[derive(Component)]
struct Shade;
#[derive(Component)]
struct Panel;
#[derive(Component)]
struct Body;
#[derive(Component, Default)]
struct ProgressFill(f32);
#[derive(Component)]
struct Percent;
#[derive(Component)]
struct ProgressDetail;
#[derive(Component)]
struct Sheen;
#[derive(Component, Clone, Copy)]
enum Act {
    Install,
    Later,
    Reopen,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum View {
    Hidden,
    Banner,
    Modal,
}

#[derive(Default)]
struct Drawn {
    key: Option<(u8, String, Handle<Font>, Handle<Font>)>,
    opened_at: f32,
}

fn start_check(mut state: ResMut<UpdateUi>) {
    let Some(request) = CheckRequest::from_environment() else {
        return;
    };
    state.manual_enabled = true;
    state.pending_check = PendingCheck::spawn(request, true);
}

fn poll_state(
    mut state: ResMut<UpdateUi>,
    context: Res<NativeUpdateContext>,
    coop: Res<crate::coop_ui::CoopUi>,
    locale: Res<Localization>,
    time: Res<Time>,
) {
    if let Some(result) = state.pending_check.as_mut().and_then(PendingCheck::poll) {
        let PendingCheck { startup, manual, .. } = state.pending_check.take().unwrap();
        let now = time.elapsed_secs();
        match result {
            Ok(Some(plan)) => {
                if manual {
                    // 0x1401a9690: a non-menu or active party leaves the plan
                    // available at the picker badge instead of opening the dialog.
                    state.dismissed = !context.visible()
                        || matches!(coop.status.as_str(), "hosting" | "joining" | "joined" | "left");
                    if state.dismissed {
                        let label = if plan.executable.is_some() { EXE_WAITING } else { DATA_WAITING };
                        state.show_notice(
                            locale.label(label).replace("{version}", &plan.version),
                            Some(now + 9.),
                        );
                    } else {
                        state.check_notice = None;
                    }
                }
                if !matches!(state.shared.snapshot(), State::Downloading { .. } | State::Ready(_)) {
                    if startup {
                        state.shared.checked(Some(plan));
                    } else {
                        state.shared.publish(State::Available(plan));
                    }
                }
            }
            Ok(None) if manual => state.show_notice(
                locale.label(CURRENT).replace("{version}", env!("CARGO_PKG_VERSION")),
                Some(now + 5.),
            ),
            Err(error) if manual => state.show_notice(
                locale.label(CHECK_ERROR).replace("{error}", &error),
                Some(now + 9.),
            ),
            _ => {}
        }
    }
    let next = state.shared.snapshot();
    if next != state.state {
        state.state = next;
    }
}

fn manual_input(
    mut state: ResMut<UpdateUi>,
    context: Res<NativeUpdateContext>,
    locale: Res<Localization>,
    time: Res<Time>,
    buttons: Query<&Interaction, (Changed<Interaction>, With<ManualCheckButton>)>,
) {
    if !context.visible() || !buttons.iter().any(|press| *press == Interaction::Pressed) {
        return;
    }
    let Some(request) = CheckRequest::manual_from_environment() else {
        return;
    };
    let now = time.elapsed_secs();
    if matches!(state.state, State::Downloading { .. } | State::Ready(_)) {
        state.show_notice(locale.label(BUSY).to_owned(), Some(now + 5.));
        return;
    }
    if let Some(pending) = &mut state.pending_check {
        pending.manual = true;
    } else {
        state.pending_check = PendingCheck::spawn(request, false);
        if state.pending_check.is_none() {
            state.show_notice(
                locale.label(CHECK_ERROR).replace("{error}", "could not start the check"),
                Some(now + 9.),
            );
            return;
        }
    }
    state.show_notice(locale.label(CHECKING).to_owned(), None);
}

/// 0.139.2 0x1401aaaa0 and 0x1403a9fb0 own the independent update toast.
fn draw_check_notice(
    mut commands: Commands,
    mut state: ResMut<UpdateUi>,
    art: Res<MenuArt>,
    time: Res<Time>,
    toasts: Query<Entity, With<Toast>>,
    mut drawn: Local<Option<(String, Handle<Font>)>>,
) {
    if state
        .check_notice
        .as_ref()
        .is_some_and(|notice| notice.expires.is_some_and(|end| time.elapsed_secs() > end))
    {
        state.check_notice = None;
    }
    let key = state
        .check_notice
        .as_ref()
        .map(|notice| (notice.text.clone(), art.font.clone()));
    if *drawn == key {
        return;
    }
    *drawn = key;
    for toast in &toasts {
        commands.entity(toast).despawn();
    }
    let Some((label, font)) = drawn.as_ref() else {
        return;
    };
    commands
        .spawn((
            Toast,
            Pickable::IGNORE,
            GlobalZIndex(6350),
            Node {
                position_type: PositionType::Absolute,
                top: Val::Px(64.),
                width: Val::Percent(100.),
                justify_content: JustifyContent::Center,
                ..default()
            },
        ))
        .with_children(|root| {
            root.spawn((
                Pickable::IGNORE,
                Node {
                    max_width: Val::Px(520.),
                    padding: UiRect::axes(Val::Px(18.), Val::Px(9.)),
                    border: UiRect::all(Val::Px(1.)),
                    border_radius: BorderRadius::all(Val::Px(10.)),
                    ..default()
                },
                menu::native_panel_style(),
            ))
            .with_children(|panel| {
                text(panel, font, 15., PAPER, label.as_str());
            });
        });
}

fn input(
    mut state: ResMut<UpdateUi>,
    buttons: Query<(&Interaction, &Act), (Changed<Interaction>, With<Button>)>,
) {
    for (interaction, action) in &buttons {
        if *interaction != Interaction::Pressed {
            continue;
        }
        match action {
            Act::Later => state.dismissed = true,
            Act::Reopen => state.dismissed = false,
            Act::Install => {
                state.shared.start();
                state.state = state.shared.snapshot();
            }
        }
    }
}
fn finish_ready(
    mut state: ResMut<UpdateUi>,
    time: Res<Time>,
    locale: Res<Localization>,
    mut exit: MessageWriter<AppExit>,
) {
    let current = state.state.clone();
    let result = worker::advance_ready_with(
        &mut worker::NativeApply,
        &current,
        &mut state.delay,
        time.elapsed_secs(),
        &[],
        |error| {
            locale
                .label("Could not put the update in place: {error}")
                .replace("{error}", error)
        },
    );
    match result {
        Some(Ok(())) => {
            exit.write(AppExit::Success);
        }
        Some(Err(failed)) => {
            state.shared.publish(failed.clone());
            state.state = failed;
        }
        None => {}
    }
}

fn rebuild(
    mut commands: Commands,
    state: Res<UpdateUi>,
    context: Res<NativeUpdateContext>,
    locale: Res<Localization>,
    art: Res<MenuArt>,
    roots: Query<Entity, With<Root>>,
    time: Res<Time>,
    mut drawn: Local<Drawn>,
) {
    let view = if state.state.modal(state.dismissed, context.visible()) {
        View::Modal
    } else if state.state.banner(state.dismissed, context.visible()) {
        View::Banner
    } else {
        View::Hidden
    };
    let key = (
        view as u8,
        locale.code().to_owned(),
        art.font.clone(),
        art.heading_font.clone(),
    );
    if drawn.key.as_ref() == Some(&key) {
        return;
    }
    if view == View::Modal
        && drawn
            .key
            .as_ref()
            .is_none_or(|key| key.0 != View::Modal as u8)
    {
        drawn.opened_at = time.elapsed_secs();
    }
    drawn.key = Some(key);
    for root in &roots {
        commands.entity(root).despawn();
    }
    let Some(plan) = state.state.plan().filter(|_| view != View::Hidden) else {
        return;
    };
    if view == View::Banner {
        commands
            .spawn((
                Root,
                Button,
                Act::Reopen,
                UiTransform::default(),
                GlobalZIndex(6300),
                Node {
                    position_type: PositionType::Absolute,
                    right: Val::Px(14.),
                    bottom: Val::Px(32.),
                    padding: UiRect::axes(Val::Px(16.), Val::Px(7.)),
                    border: UiRect::all(Val::Px(1.)),
                    border_radius: BorderRadius::all(Val::Px(4.)),
                    ..default()
                },
                menu::native_button_gradient(),
                BorderColor::all(GOLD),
                BoxShadow::new(
                    Color::linear_rgba(1., 0.7, 0.25, 0.5),
                    Val::Px(0.),
                    Val::Px(0.),
                    Val::Px(1.),
                    Val::Px(10.),
                ),
            ))
            .with_children(|ui| {
                text(
                    ui,
                    &art.font,
                    14.,
                    Color::srgb(1., 0.914, 0.659),
                    locale
                        .label("v{version} is out · Update")
                        .replace("{version}", &plan.version),
                );
            });
        return;
    }
    let opened_at = drawn.opened_at;
    commands
        .spawn((
            Root,
            Shade,
            Opened(opened_at),
            GlobalZIndex(6300),
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                ..default()
            },
            BackgroundColor(Color::NONE),
            Interaction::None,
            FocusPolicy::Block,
        ))
        .with_children(|shade| {
            shade
                .spawn((
                    NativeCanvas {
                        design: Vec2::new(600., 420.),
                        max_scale: 1.3,
                    },
                    Node {
                        position_type: PositionType::Absolute,
                        width: Val::Px(600.),
                        height: Val::Px(420.),
                        align_items: AlignItems::Center,
                        justify_content: JustifyContent::Center,
                        ..default()
                    },
                ))
                .with_children(|canvas| {
                    canvas
                        .spawn((
                            Panel,
                            Opened(opened_at),
                            UiTransform::from_scale(Vec2::splat(0.6)),
                            Node {
                                width: Val::Px(540.),
                                padding: UiRect::axes(Val::Px(36.), Val::Px(26.)),
                                border: UiRect::all(Val::Px(2.)),
                                border_radius: BorderRadius::all(Val::Px(10.)),
                                flex_direction: FlexDirection::Column,
                                align_items: AlignItems::Center,
                                row_gap: Val::Px(12.),
                                overflow: Overflow::clip(),
                                ..default()
                            },
                            menu::native_panel_style(),
                        ))
                        .with_children(|panel| {
                            for index in 0..16 {
                                let (spark, size) = Spark::at(index);
                                panel.spawn((
                                    spark,
                                    Node {
                                        position_type: PositionType::Absolute,
                                        width: Val::Px(size),
                                        height: Val::Px(size),
                                        border_radius: BorderRadius::all(Val::Percent(50.)),
                                        ..default()
                                    },
                                    BackgroundColor(Color::srgba(1., 0.8, 0.35, 0.)),
                                ));
                            }
                            panel.spawn((
                                Body,
                                Node {
                                    width: Val::Percent(100.),
                                    flex_direction: FlexDirection::Column,
                                    align_items: AlignItems::Center,
                                    row_gap: Val::Px(12.),
                                    ..default()
                                },
                            ));
                        });
                });
        });
}

//019290 compares only the nonempty/category pair and replaces the body's children.
//Downloading progress publications do not respawn the outer modal or reset its opening clock.
fn rebuild_body(
    mut commands: Commands,
    state: Res<UpdateUi>,
    locale: Res<Localization>,
    art: Res<MenuArt>,
    bodies: Query<Entity, With<Body>>,
    mut drawn: Local<Option<(Entity, u8, String, Handle<Font>, Handle<Font>)>>,
) {
    let Some(entity) = bodies.iter().next() else {
        *drawn = None;
        return;
    };
    let Some(plan) = state.state.plan() else {
        return;
    };
    let key = (
        entity,
        state.state.kind(),
        locale.code().to_owned(),
        art.font.clone(),
        art.heading_font.clone(),
    );
    if drawn.as_ref() == Some(&key) {
        return;
    }
    *drawn = Some(key);
    commands
        .entity(entity)
        .despawn_children()
        .with_children(|body| {
            let heading = match &state.state {
                State::Available(_) => plan.heading_key(),
                State::Downloading { .. } => "Downloading",
                State::Ready(_) => "Restarting…",
                State::Failed { .. } => "The update failed",
                State::Empty => return,
            };
            text(body, &art.heading_font, 40., GOLD, locale.label(heading));
            if !matches!(state.state, State::Failed { .. }) && plan.executable.is_some() {
                body.spawn((
                    Text::new(format!("v{}  ", env!("CARGO_PKG_VERSION"))),
                    TextFont {
                        font: art.font.clone(),
                        font_size: 17.,
                        ..default()
                    },
                    TextColor(MUTED),
                    menu::native_text_shadow(),
                ))
                .with_children(|line| {
                    line.spawn((
                        TextSpan::new("»  "),
                        TextFont {
                            font: art.font.clone(),
                            font_size: 17.,
                            ..default()
                        },
                        TextColor(BUTTON_EDGE),
                    ));
                    line.spawn((
                        TextSpan::new(format!("v{}", plan.version)),
                        TextFont {
                            font: art.font.clone(),
                            font_size: 19.,
                            ..default()
                        },
                        TextColor(Color::srgb(0.302, 1., 0.416)),
                    ));
                });
            }
            match &state.state {
                State::Available(_) => {
                    body.spawn((
                        Node {
                            width: Val::Percent(80.),
                            height: Val::Px(1.),
                            margin: UiRect::vertical(Val::Px(4.)),
                            ..default()
                        },
                        BackgroundGradient::from(LinearGradient {
                            angle: std::f32::consts::FRAC_PI_2,
                            stops: vec![
                                Color::linear_rgba(0.690, 0.541, 0.227, 0.).into(),
                                Color::linear_rgba(0.690, 0.541, 0.227, 1.).into(),
                                Color::linear_rgba(0.690, 0.541, 0.227, 0.).into(),
                            ],
                            ..default()
                        }),
                    ));
                    if !plan.notes.is_empty() {
                        body.spawn((
                            Text::new(&plan.notes),
                            TextFont {
                                font: art.font.clone(),
                                font_size: 15.,
                                ..default()
                            },
                            TextColor(PAPER),
                            menu::native_text_shadow(),
                            TextLayout::new_with_justify(Justify::Center),
                            Node {
                                width: Val::Px(460.),
                                ..default()
                            },
                        ));
                    }
                    text(
                        body,
                        &art.font,
                        13.,
                        MUTED,
                        locale
                            .label("{size} download · the game restarts when it is done")
                            .replace("{size}", &size_label(plan.wire_size(), &locale)),
                    );
                    body.spawn(Node {
                        margin: UiRect::top(Val::Px(8.)),
                        column_gap: Val::Px(14.),
                        ..default()
                    })
                    .with_children(|row| {
                        footer_button(
                            row,
                            &art,
                            locale.label("Download & restart"),
                            Act::Install,
                            true,
                        );
                        footer_button(row, &art, locale.label("Later"), Act::Later, false);
                    });
                }
                State::Failed { error, .. } => {
                    body.spawn((
                        Text::new(error),
                        TextFont {
                            font: art.font.clone(),
                            font_size: 15.,
                            ..default()
                        },
                        TextColor(Color::srgb(1., 0.353, 0.235)),
                        menu::native_text_shadow(),
                        TextLayout::new_with_justify(Justify::Center),
                        Node {
                            max_width: Val::Px(460.),
                            ..default()
                        },
                    ));
                    body.spawn(Node {
                        margin: UiRect::top(Val::Px(8.)),
                        column_gap: Val::Px(14.),
                        ..default()
                    })
                    .with_children(|row| {
                        footer_button(row, &art, locale.label("Try again"), Act::Install, true);
                        footer_button(row, &art, locale.label("Later"), Act::Later, false);
                    });
                }
                State::Downloading { .. } | State::Ready(_) => {
                    body.spawn((
                        Percent,
                        Text::new("0%"),
                        TextFont {
                            font: art.font.clone(),
                            font_size: 30.,
                            ..default()
                        },
                        TextColor(Color::srgb(1., 0.914, 0.659)),
                        menu::native_text_shadow(),
                    ));
                    body.spawn((
                        Node {
                            width: Val::Px(440.),
                            height: Val::Px(22.),
                            padding: UiRect::all(Val::Px(3.)),
                            border: UiRect::all(Val::Px(1.)),
                            border_radius: BorderRadius::all(Val::Px(11.)),
                            ..default()
                        },
                        BackgroundColor(Color::srgba(0., 0., 0., 0.6)),
                        BorderColor::all(BUTTON_EDGE),
                        BoxShadow::new(
                            Color::linear_rgba(0., 0., 0., 0.7),
                            Val::Px(0.),
                            Val::Px(1.),
                            Val::Px(0.),
                            Val::Px(4.),
                        ),
                    ))
                    .with_children(|bar| {
                        bar.spawn((
                            ProgressFill::default(),
                            Node {
                                width: Val::Px(0.),
                                height: Val::Percent(100.),
                                border_radius: BorderRadius::all(Val::Px(8.)),
                                overflow: Overflow::clip(),
                                ..default()
                            },
                            BackgroundGradient::from(LinearGradient {
                                angle: std::f32::consts::PI,
                                stops: vec![
                                    Color::linear_rgba(1., 0.914, 0.659, 1.).into(),
                                    Color::linear_rgba(0.973, 0.824, 0.416, 1.).into(),
                                    Color::linear_rgba(0.588, 0.392, 0.110, 1.).into(),
                                ],
                                ..default()
                            }),
                            BoxShadow::new(
                                Color::linear_rgba(1., 0.7, 0.25, 0.55),
                                Val::Px(0.),
                                Val::Px(0.),
                                Val::Px(1.),
                                Val::Px(10.),
                            ),
                        ))
                        .with_children(|fill| {
                            fill.spawn((
                                Sheen,
                                Node {
                                    position_type: PositionType::Absolute,
                                    left: Val::Px(-80.),
                                    width: Val::Px(70.),
                                    height: Val::Percent(100.),
                                    ..default()
                                },
                                BackgroundGradient::from(LinearGradient {
                                    angle: std::f32::consts::FRAC_PI_2,
                                    stops: vec![
                                        Color::linear_rgba(1., 1., 1., 0.).into(),
                                        Color::linear_rgba(1., 1., 1., 0.65).into(),
                                        Color::linear_rgba(1., 1., 1., 0.).into(),
                                    ],
                                    ..default()
                                }),
                            ));
                        });
                    });
                    body.spawn((
                        ProgressDetail,
                        Text::new(""),
                        TextFont {
                            font: art.font.clone(),
                            font_size: 13.,
                            ..default()
                        },
                        TextColor(MUTED),
                        menu::native_text_shadow(),
                    ));
                }
                State::Empty => {}
            }
        });
}
fn size_label(bytes: u64, locale: &Localization) -> String {
    locale
        .label("{n} MB")
        .replace("{n}", &format!("{:.1}", bytes as f64 / 1_048_576.))
}
fn progress_detail(state: &State, locale: &Localization) -> Option<String> {
    match state {
        State::Downloading { progress, .. } => {
            let mut label = locale
                .label("{done} of {total}")
                .replace("{done}", &size_label(progress.done, locale))
                .replace("{total}", &size_label(progress.total, locale));
            if progress.bytes_per_second > 0. {
                label.push_str(
                    &locale
                        .label(" · {rate}/s · {secs}s left")
                        .replace(
                            "{rate}",
                            &size_label(progress.bytes_per_second as u64, locale),
                        )
                        .replace(
                            "{secs}",
                            &format!(
                                "{:.0}",
                                (progress.total.saturating_sub(progress.done) as f64
                                    / progress.bytes_per_second)
                                    .ceil()
                            ),
                        ),
                );
            }
            Some(label)
        }
        State::Ready(plan) => Some(
            locale
                .label("{size} · checked")
                .replace("{size}", &size_label(plan.wire_size(), locale)),
        ),
        _ => None,
    }
}
fn refresh_progress(
    state: Res<UpdateUi>,
    locale: Res<Localization>,
    time: Res<Time>,
    mut fills: Query<(&mut ProgressFill, &mut Node), Without<Sheen>>,
    mut percentages: Query<&mut Text, (With<Percent>, Without<ProgressDetail>)>,
    mut details: Query<&mut Text, (With<ProgressDetail>, Without<Percent>)>,
    mut sheen: Query<&mut Node, (With<Sheen>, Without<ProgressFill>)>,
) {
    let Some(target) = worker::target_ratio(&state.state) else {
        return;
    };
    let mut percent = None;
    for (mut value, mut node) in &mut fills {
        value.0 = worker::smooth_ratio(value.0, target, time.delta_secs());
        node.width = Val::Percent(value.0 * 100.);
        percent = Some(format!("{:.0}%", value.0 * 100.));
    }
    if let Some(label) = percent {
        for mut text in &mut percentages {
            if text.0 != label {
                text.0 = label.clone();
            }
        }
    }
    if let Some(label) = progress_detail(&state.state, &locale) {
        for mut text in &mut details {
            if text.0 != label {
                text.0 = label.clone();
            }
        }
    }
    for mut node in &mut sheen {
        node.left = Val::Px(fract(time.elapsed_secs() / 1.4) * 560. - 80.);
    }
}

fn text(
    ui: &mut ChildSpawnerCommands,
    font: &Handle<Font>,
    size: f32,
    color: Color,
    value: impl Into<String>,
) {
    ui.spawn((
        Text::new(value),
        TextFont {
            font: font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        menu::native_text_shadow(),
    ));
}

fn footer_button(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    label: &str,
    action: Act,
    primary: bool,
) {
    ui.spawn((
        Button,
        action,
        UiTransform::default(),
        Node {
            padding: UiRect::axes(Val::Px(if primary { 28. } else { 22. }), Val::Px(10.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(4.)),
            ..default()
        },
        menu::native_button_gradient(),
        BorderColor::all(if primary { GOLD } else { BUTTON_EDGE }),
        BoxShadow::new(
            Color::linear_rgba(0., 0., 0., 0.85),
            Val::Px(0.),
            Val::Px(2.),
            Val::Px(0.),
            Val::Px(6.),
        ),
    ))
    .with_children(|ui| {
        text(ui, &art.font, 17., Color::srgb(1., 0.914, 0.659), label);
    });
}

#[derive(Component)]
struct Opened(f32);

#[derive(Component, Clone, Copy)]
struct Spark {
    base_x: f32,
    speed: f32,
    phase: f32,
}
fn fract(value: f32) -> f32 {
    value - value.trunc()
}
impl Spark {
    fn at(index: u32) -> (Self, f32) {
        let index = index as f32;
        (
            Self {
                base_x: fract(index * 0.618_034) * 100.,
                speed: fract(index * 0.731) * 0.12 + 0.1,
                phase: fract(index * 0.293),
            },
            fract(index * 1.37) * 2.5 + 2.,
        )
    }
}

fn animate(
    time: Res<Time>,
    mut shades: Query<(&Opened, &mut BackgroundColor), (With<Shade>, Without<Spark>)>,
    mut panels: Query<(&Opened, &mut UiTransform), (With<Panel>, Without<Act>)>,
    mut buttons: Query<(&Interaction, &mut UiTransform), (With<Act>, Without<Panel>)>,
    mut sparks: Query<(&Spark, &mut Node, &mut BackgroundColor), Without<Shade>>,
) {
    let elapsed = time.elapsed_secs();
    for (opened, mut color) in &mut shades {
        let t = ((elapsed - opened.0) / 0.45).clamp(0., 1.);
        color.0 = Color::srgba(0., 0., 0., t * 0.62);
    }
    for (opened, mut transform) in &mut panels {
        let q = ((elapsed - opened.0) / 0.45).clamp(0., 1.) - 1.;
        let back = 1. + 2.701_58 * q * q * q + 1.701_58 * q * q;
        transform.scale = Vec2::splat(back * 0.4 + 0.6);
    }
    for (interaction, mut transform) in &mut buttons {
        transform.scale = Vec2::splat(match interaction {
            Interaction::Pressed => 0.97,
            Interaction::Hovered => 1.05,
            Interaction::None => 1.,
        });
    }
    for (spark, mut node, mut color) in &mut sparks {
        let t = fract(spark.speed * elapsed + spark.phase);
        node.left = Val::Percent(spark.base_x + 2. * (9. * t + 6. * spark.phase).sin());
        node.top = Val::Percent(100. - 110. * t);
        color.0 = Color::srgba(1., 0.8, 0.35, (std::f32::consts::PI * t).sin() * 0.7);
    }
}
