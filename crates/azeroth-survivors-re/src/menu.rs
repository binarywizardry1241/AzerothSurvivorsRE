//! Reconstructed picker navigation. Native logic evidence is indexed in docs/analysis.
use crate::{
    assets::MenuArt,
    catalog::MenuCatalog,
    menu_state::{Dialog, MenuState, Page},
    options::{OptionsSet, OptionsState},
    preview::{HeroLook, HeroPreview, HeroPreviewOutput},
};
use bevy::{
    app::AppExit,
    input::{
        keyboard::{Key, KeyboardInput},
        ButtonState,
    },
    prelude::*,
    window::PrimaryWindow,
};

pub const GOLD: Color = Color::srgb(0.973, 0.824, 0.416);
pub const EDGE: Color = Color::srgb(0.427, 0.333, 0.145);
pub const PAPER: Color = Color::srgb(0.949, 0.902, 0.788);
pub const MUTED: Color = Color::srgb(0.725, 0.663, 0.510);
pub const DARK: Color = Color::srgba(0.025, 0.020, 0.012, 0.94);
const RED: Color = Color::srgb(0.19, 0.025, 0.018);

/// Native0a1200: raw gamma-space stops after to_srgba, then Color::LinearRgba.
pub fn native_button_gradient() -> BackgroundGradient {
    BackgroundGradient::from(LinearGradient {
        angle: std::f32::consts::PI,
        stops: vec![
            Color::linear_rgba(0.231, 0.051, 0.043, 1.0).into(),
            Color::linear_rgba(0.102, 0.020, 0.020, 1.0).into(),
        ],
        ..default()
    })
}
pub const BUTTON_EDGE: Color = Color::srgb(0.690, 0.541, 0.227);
pub fn native_text_shadow() -> TextShadow {
    TextShadow {
        color: Color::srgba(0.0, 0.0, 0.0, 0.85),
        offset: Vec2::new(0.0, 1.5),
    }
}
/// Native common frame0a1ce0; callers retain their own layout constraints.
pub fn native_panel_style() -> (BackgroundGradient, BorderColor, BoxShadow) {
    (
        BackgroundGradient::from(LinearGradient {
            angle: std::f32::consts::PI,
            stops: vec![
                Color::linear_rgba(0.078, 0.059, 0.035, 0.90).into(),
                Color::linear_rgba(0.031, 0.024, 0.016, 0.93).into(),
            ],
            ..default()
        }),
        BorderColor::all(EDGE),
        BoxShadow::new(
            Color::srgba(0., 0., 0., 0.6),
            Val::Px(0.),
            Val::Px(14.),
            Val::Px(0.),
            Val::Px(40.),
        ),
    )
}
pub fn native_panel(
    ui: &mut ChildSpawnerCommands,
    mut node: Node,
    build: impl FnOnce(&mut ChildSpawnerCommands),
) {
    node.border = UiRect::all(Val::Px(1.));
    node.border_radius = BorderRadius::all(Val::Px(10.));
    ui.spawn((node, native_panel_style())).with_children(build);
}

pub struct MenuPlugin;
impl Plugin for MenuPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<MenuState>()
            .init_resource::<CanvasSize>()
            .init_resource::<crate::picker::ZoneVisibility>();
        if app.world().contains_resource::<benilla_app::local_client::LocalStockFrontend>() {
            // Stock GlueXML owns selection/input. Keep the same account-save
            // owner so ordinary character operations and run results persist.
            app.add_systems(Update, persist.after(OptionsSet::Input).after(crate::menu_state::AccountInput)
                .before(crate::gameplay::RunSet::Input));
            return;
        }
        app.add_systems(
                PostUpdate,
                crate::picker::keep_selected_visible.after(bevy::ui::UiSystems::Layout),
            )
            .add_systems(
                Update,
                (
                    persist,
                    normalize_appearance,
                    input.run_if(crate::update_ui::menu_input_enabled),
                    crate::picker::sync_name,
                    rotate_preview.run_if(crate::update_ui::menu_input_enabled),
                    sync_preview,
                    rebuild,
                    paint,
                )
                    .chain()
                    .after(crate::localization::LocalizationSet::Input)
                    .before(OptionsSet::Input),
            )
            .add_systems(Update, backend_commands.after(OptionsSet::Input).after(crate::menu_state::AccountInput)
                .before(crate::gameplay::RunSet::Input));
    }
}
#[derive(Component)]
struct Root;
#[derive(Component)]
pub struct PreviewInteraction;
#[derive(Component)]
pub struct PreviewTurnRate(pub f32);
#[derive(Resource, Default)]
struct CanvasSize(Vec2);
#[derive(Component, Clone)]
pub enum Action {
    Class(usize),
    Race(u8),
    Sex(u8),
    Feature(usize, i8),
    Zone(usize),
    Name,
    RandomName,
    Page(Page),
    Picker,
    Menu,
    Options,
    Close,
    Quit,
    Support,
    Community,
    RunOptions,
    Heroic(u8),
    Language,
    Enter,
    Unavailable(String),
}
#[derive(Component)]
pub(crate) struct Face {
    pub(crate) selected: bool,
    pub(crate) primary: bool,
    pub(crate) disabled: bool,
}
#[derive(Component)]
pub(crate) struct NativeStaticFrame;

fn input(
    mut state: ResMut<MenuState>,
    mut rewards: ResMut<crate::progression::ProgressionState>,
    mut armory: ResMut<crate::armory::ArmoryState>,
    native: Res<crate::armory::ArmoryCatalog>,
    catalog: Res<MenuCatalog>,
    mut options: ResMut<OptionsState>,
    clicks: Query<(&Interaction, &Action, &Face), (Changed<Interaction>, With<Button>)>,
    keys: Res<ButtonInput<KeyCode>>,
    mut keyboard: MessageReader<KeyboardInput>,
    mut exit: MessageWriter<AppExit>,
    time: Res<Time>,
    device: Option<Res<benilla_app::local_client::LocalDeviceInput>>,
    (coop, mut runtime): (Res<crate::coop_ui::CoopUi>, ResMut<crate::coop_runtime::CoopRuntime>),
    mut ime: ResMut<crate::ime::ImeRequest>,
    name_fields: Query<(&ComputedNode, &UiGlobalTransform), With<crate::picker::HeroNameButton>>,
) {
    if state.in_run || coop.ready_modal_visible(time.elapsed_secs()) {
        keyboard.clear();
        return;
    }
    if matches!(state.dialog, Some(Dialog::Coop)) {
        if keys.just_pressed(KeyCode::Escape)
            || device.as_ref().is_some_and(|device| device.menu_requested) {
            state.dialog = None;
            state.dirty = true;
        }
        keyboard.clear();
        return;
    }
    state.advance_enter(time.elapsed_secs());
    // Current 140099b40 skips actions while tag1 has a nonnegative timestamp.
    if state.entering {
        keyboard.clear();
        return;
    }
    if options.open {
        keyboard.clear();
        return;
    }
    let mut enter_requested = false;
    let heroic_before = state.heroic_rank;
    for (interaction, action, face) in &clicks {
        if *interaction != Interaction::Pressed || face.disabled {
            continue;
        }
        if state.dialog.is_some()
            && matches!(
                action,
                Action::Class(_)
                    | Action::Race(_)
                    | Action::Sex(_)
                    | Action::Name
                    | Action::RandomName
                    | Action::Page(_)
                    | Action::Enter
            )
        {
            continue;
        }
        state.name_focused = matches!(action, Action::Name);
        match action {
            Action::Class(index)=>state.choose_class(*index,&catalog),
            Action::Race(race)=>state.choose_race(*race,&catalog),
            Action::Zone(index)=>if *index<state.open_zones() {state.zone=*index;state.mark_dirty();},
            Action::Sex(sex)=>state.choose_sex(*sex,&catalog),
            Action::Feature(i,d)=>state.cycle_feature(*i,*d,&catalog),
            Action::Name=>{},
            Action::RandomName=>random_name(&mut state),
            Action::Page(page)=>request_page(&mut state,&mut rewards,&mut armory,&native,*page),
            Action::Picker=>request_page(&mut state,&mut rewards,&mut armory,&native,Page::Picker),
            Action::Menu=>state.dialog=Some(Dialog::Menu),
            Action::Options=>{state.dialog=None;options.open=true;},
            Action::Close=>state.close_dialog(),
            Action::Quit=>{exit.write(AppExit::Success);},
            Action::Community | Action::Support=>{
                #[cfg(target_os="windows")]
                let command="explorer";
                #[cfg(target_os="macos")]
                let command="open";
                #[cfg(not(any(target_os="windows",target_os="macos")))]
                let command="xdg-open";
                let destination=if matches!(action, Action::Support) {"https://wow.aethus.pl/support"} else {"https://discord.gg/azerothsurvivors"};
                if let Err(error)=std::process::Command::new(command).arg(destination).spawn() {warn!("could not open menu link: {error}");}
            },
            Action::RunOptions=>state.dialog=Some(Dialog::RunOptions),
            Action::Heroic(rank)=>if *rank <= state.max_heroic_rank() { state.heroic_rank=(*rank).min(azeroth_survivors_re::heroic::MAX_RANK); },
            Action::Language=>state.dialog=if matches!(state.dialog,Some(Dialog::Language)) {None} else {Some(Dialog::Language)},
            Action::Enter=>enter_requested=true,
            Action::Unavailable(title)=>state.dialog=Some(Dialog::Notice(title.clone(),"This screen's native behavior is still being recovered from the 0.92.0 executable.".into())),
        }
        // 0.109.0 updates name text/font in place, preserving the portrait pane.
        if !matches!(action, Action::RandomName) {
            state.dirty = true;
        }
    }
    // Current140289500 compares the final rank after processing pressed rows.
    // Selection stays open and publishes one changed Pick.
    if state.heroic_rank != heroic_before {
        state.commit_pick(&catalog);
    }
    if enter_requested {
        // Native action3 sets a local request; the shared post-loop path commits it.
        if !coop.waiting_for_players() {
            request_enter(&mut state, &catalog, time.elapsed_secs(), &mut runtime);
        }
        keyboard.clear();
        return;
    }
    if keys.just_pressed(KeyCode::Escape) || device.as_ref().is_some_and(|device| device.menu_requested) {
        if state.name_focused {
            state.name_focused = false;
        } else if state.dialog.is_some() {
            state.close_dialog();
        } else if state.page != Page::Picker {
            request_page(&mut state, &mut rewards, &mut armory, &native, Page::Picker);
        } else {
            state.dialog = Some(Dialog::Menu);
        }
        state.dirty = true;
    }
    if state.name_focused && state.dialog.is_none() {
        // Current1401f6602 publishes the focused field's measured bottom-left
        // in logical coordinates; a missing row retains the previous caret.
        let position = name_fields.iter().next().map(|(node, transform)| {
            let center: Vec2 = transform.affine().translation.into();
            (center + Vec2::new(-node.size.x * 0.5, node.size.y * 0.5))
                * node.inverse_scale_factor
        });
        ime.request_typing(position);
        let mut edited = state.name.clone();
        for event in keyboard.read() {
            if event.state != ButtonState::Pressed {
                continue;
            }
            match &event.logical_key {
                Key::Backspace => {
                    edited.pop();
                }
                Key::Character(text) => crate::hero_name::append(&mut edited, text),
                Key::Space => crate::hero_name::append(&mut edited, " "),
                _ => {}
            }
        }
        if edited != state.name {
            state.name = crate::hero_name::titlecase(&edited);
        }
    } else {
        keyboard.clear();
    }
    if keys.just_pressed(KeyCode::Enter) || keys.just_pressed(KeyCode::NumpadEnter) {
        if state.dialog.is_none() && state.page == Page::Picker && !state.entering
            && !coop.waiting_for_players() {
            // Current 140067ee0 has no name-focus exception for either Enter key.
            request_enter(&mut state, &catalog, time.elapsed_secs(), &mut runtime);
        }
    }
}

fn request_enter(
    state: &mut MenuState, catalog: &MenuCatalog, elapsed: f32,
    runtime: &mut crate::coop_runtime::CoopRuntime,
) {
    if runtime.driver.as_ref().is_some_and(|driver| driver.is_hosting()) {
        state.commit_enter(catalog);
        runtime.begin_ready_check = true;
    } else if !runtime.is_guest() {
        state.begin_enter(catalog, elapsed);
    }
}
fn random_name(state: &mut MenuState) {
    state.name = crate::hero_name::random();
}
fn persist(mut state: ResMut<MenuState>, catalog: Res<MenuCatalog>) {
    state.persist_selection(&catalog);
}
fn backend_commands(mut state: ResMut<MenuState>, catalog: Res<MenuCatalog>) {
    state.drain_backend_commands(&catalog);
}
fn normalize_appearance(mut state: ResMut<MenuState>) {
    let features = crate::save::appearance::normalize_features(state.race, state.sex, state.features);
    if state.features != features {
        state.features = features;
        state.mark_dirty();
    }
}
/// Current14013ead0 routes dirty Rewards first; admitted navigation also owns
/// Armory focus and the selected item's initial drop-zone projection.
fn request_page(
    state: &mut MenuState,
    rewards: &mut crate::progression::ProgressionState,
    armory: &mut crate::armory::ArmoryState,
    native: &crate::armory::ArmoryCatalog,
    destination: Page,
) {
    let previous = state.page;
    rewards.request_page(state, destination);
    if state.page == destination && state.dialog.is_none() {
        armory.enter_page(previous, destination, native, state.class_id());
    }
}

fn rotate_preview(
    mut preview: ResMut<HeroPreview>,
    state: Res<MenuState>,
    options: Res<OptionsState>,
    panes: Query<&Interaction, With<PreviewInteraction>>,
    arrows: Query<(&Interaction, &PreviewTurnRate)>,
    windows: Query<&Window, With<PrimaryWindow>>,
    time: Res<Time>,
    mut previous_x: Local<Option<f32>>,
) {
    let enabled = state.page == Page::Character && !state.entering && !options.open;
    if enabled {
        for (interaction, rate) in &arrows {
            if *interaction == Interaction::Pressed {
                preview.yaw += rate.0 * time.delta_secs();
            }
        }
    }
    let cursor = windows.single().ok().and_then(Window::cursor_position);
    if !enabled || !panes.iter().any(|interaction| *interaction == Interaction::Pressed) || cursor.is_none() {
        *previous_x = None;
        return;
    }
    // Native1403a29aa consumes consecutive logical cursor positions; the first
    // pressed frame only seeds its local Option. This is not raw mouse motion.
    let x = cursor.unwrap().x;
    if let Some(previous) = previous_x.replace(x) {
        preview.yaw += (x - previous) * crate::preview::DRAG_RADIANS_PER_LOGICAL_PIXEL;
    }
}
pub(crate) fn sync_preview(
    state: Res<MenuState>,
    mut preview: ResMut<HeroPreview>,
    windows: Query<&Window, With<PrimaryWindow>>,
    panes: Query<(&ComputedNode, &bevy::ui::UiGlobalTransform), With<PreviewInteraction>>,
) {
    // Current1408757e0 updates the shared GX aspect from live logical window
    // dimensions. Keep its last/default value while the window has zero height.
    if let Ok(window) = windows.single() {
        if window.height() > 0.0 {
            let aspect = window.width() / window.height();
            if (aspect - preview.display_aspect).abs() > 0.0001 {
                preview.display_aspect = aspect;
            }
        }
    }
    let look = HeroLook {
        class: state.class_id(),
        race: state.race,
        sex: state.sex,
        skin: state.features[0],
        face: state.features[1],
        hair_style: state.features[2],
        hair_color: state.features[3],
        facial_hair: state.features[4],
    };
    if preview.look != look {
        preview.look = look;
    }
    let gear = crate::armory::GearSave::read_for(&state.save, state.class_id(), state.race);
    static OUTFITS: std::sync::OnceLock<crate::armory::ArmoryCatalog> = std::sync::OnceLock::new();
    let outfits = OUTFITS.get_or_init(crate::armory::ArmoryCatalog::embedded);
    let resolved = gear.menu_outfit(outfits, state.class_id(), state.race);
    let stars = gear.equipment_stars(state.class_id());
    let selected_glow = state.save.weapon_glow(state.class_id());
    preview.weapon_enchants = std::array::from_fn(|index| {
        let slot = 15 + index;
        crate::armory::cosmetics::weapon_glow(selected_glow, slot as u8, resolved[slot], stars[slot])
    });
    let equipment = resolved.map(|id| {
        let item = outfits.appearance(id, state.race);
        Some(crate::preview::HeroGearItem {
            display_id: item.map_or(0, |item| item.display_id),
            inv_type: item.map_or(0, |item| item.inventory_type),
        })
    });
    if preview.equipment != equipment {
        preview.equipment = equipment;
    }
    let visible = !state.in_run && matches!(state.page, Page::Picker | Page::Character) && !state.entering;
    if let Some((size, logical_aspect)) = panes
        .iter()
        .map(|(node, transform)| {
            let scale = Vec2::new(
                // Current1400fc450 uses the affine decomposition's signed X
                // scale; mirrored panes therefore fail its nonzero size gate.
                transform.matrix2.x_axis.length() * transform.matrix2.determinant().signum(),
                transform.matrix2.y_axis.length(),
            );
            let physical = (node.size() * scale)
                .round()
                .as_uvec2()
                .min(UVec2::splat(2048));
            (physical, node.size().x / node.size().y.max(1.0))
        })
        .next()
    {
        if preview.size != size {
            preview.size = size;
        }
        let aspect = if state.page == Page::Character {
            crate::preview::ARMORY_ASPECT
        } else { logical_aspect };
        if preview.aspect != aspect {
            preview.aspect = aspect;
        }
    } else if visible && preview.size != UVec2::ZERO {
        preview.size = UVec2::ZERO;
    }
    let fixed_yaw = state.page == Page::Picker;
    if preview.fixed_yaw != fixed_yaw { preview.fixed_yaw = fixed_yaw; }
    if preview.visible != visible {
        preview.visible = visible;
    }
}
fn rebuild(
    mut commands: Commands,
    mut state: ResMut<MenuState>,
    art: Res<MenuArt>,
    catalog: Res<MenuCatalog>,
    preview: Res<HeroPreviewOutput>,
    roots: Query<Entity, With<Root>>,
    windows: Query<&Window, With<PrimaryWindow>>,
    mut size: ResMut<CanvasSize>,
    mut zone_visibility: ResMut<crate::picker::ZoneVisibility>,
    locale: Res<crate::localization::Localization>,
    armory: Res<crate::armory::ArmoryCatalog>,
    armory_view: Res<crate::armory::ArmoryState>,
    coop: Res<crate::coop_ui::CoopUi>,
    update: Res<crate::update_ui::UpdateUi>,
    mut previous_waiting: Local<bool>,
) {
    if state.in_run {
        for root in &roots {
            commands.entity(root).despawn();
        }
        return;
    }
    // Current 0.112.0 root1400545e0 reloads the independent Save resource when the custom
    // menu has no root. Ordinary content updates retain the existing cache.
    if roots.is_empty() {
        state.refresh_frontend_save();
    }
    let Ok(window) = windows.single() else {
        return;
    };
    let dimensions = Vec2::new(window.width(), window.height());
    let waiting = coop.waiting_for_players();
    if !state.dirty && size.0 == dimensions && !art.is_changed() && !preview.is_changed()
        && *previous_waiting == waiting {
        return;
    }
    *previous_waiting = waiting;
    state.dirty = false;
    size.0 = dimensions;
    zone_visibility.observe_content(
        crate::save::Pick {
            hero: state.hero(),
            name: state.name.clone(),
            zone: catalog.zones[state.zone].key.clone(),
            heroic_rank: state.heroic_rank,
            mods: state.run_mods,
        },
        state.entering,
        state.save_revision,
    );
    for root in &roots {
        commands.entity(root).despawn();
    }
    commands
        .spawn((
            Root,
            crate::background::PickerBackdropRoot,
            crate::canvas::NativeCanvas::main_menu(),
            GlobalZIndex(0),
            Node {
                position_type: PositionType::Absolute,
                width: Val::Px(1600.),
                height: Val::Px(900.),
                ..default()
            },
        ))
        .with_children(|canvas| {
            crate::picker::build(canvas, &art, &catalog, &state, &preview, &armory, waiting);
            if let Some(error) = &state.error {
                caption(
                    canvas,
                    &art,
                    format!("Save: {error}"),
                    13.,
                    [50., 850., 1300., 26.],
                    Color::srgb(1., 0.3, 0.2),
                    false,
                );
            }
            if let Some(dialog) = &state.dialog {
                if !matches!(dialog, Dialog::Language) {
                    dialog_ui(canvas, &art, dialog);
                }
            }
        });
    // 0.97.2 root 097180 keeps these in window coordinates, outside PickerCanvas.
    // 09809f: right16/top16/gap10; 098416/098742: bottom10, left/right14.
    commands
        .spawn((
            Root,
            crate::background::PickerBackdropRoot,
            GlobalZIndex(5001),
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                ..default()
            },
        ))
        .with_children(|window| {
            window
                .spawn(Node {
                    position_type: PositionType::Absolute,
                    right: Val::Px(16.),
                    top: Val::Px(16.),
                    column_gap: Val::Px(10.),
                    ..default()
                })
                .with_children(|controls| {
                    utility_button(
                        controls,
                        &art,
                        catalog.label("picker.support"),
                        Action::Support,
                    );
                    community_button(controls, &art);
                    utility_button(controls, &art, locale.name(), Action::Language);
                    // 0.139.2 0x14039656f inserts a tagged updater button before Options.
                    if update.manual_enabled() {
                        utility_button(
                            controls,
                            &art,
                            locale.label("Check for Updates"),
                            crate::update_ui::ManualCheckButton,
                        );
                    }
                    utility_button(
                        controls,
                        &art,
                        catalog.label("picker.options"),
                        Action::Options,
                    );
                    utility_button(controls, &art, "X", Action::Quit);
                });
            for (label, right) in [
                ("Made by Aethus (zuzia miau miau)".to_owned(), false),
                (
                    format!("v{} ({})", catalog.version, catalog.build_revision),
                    true,
                ),
            ] {
                window.spawn((
                    Text::new(label),
                    TextFont {
                        font: art.font.clone(),
                        font_size: 12.,
                        ..default()
                    },
                    TextColor(MUTED),
                    native_text_shadow(),
                    Node {
                        position_type: PositionType::Absolute,
                        left: if right { Val::Auto } else { Val::Px(14.) },
                        right: if right { Val::Px(14.) } else { Val::Auto },
                        bottom: Val::Px(10.),
                        ..default()
                    },
                ));
            }
        });
    if state.page != Page::Picker {
        // 043f10: Armory is a higher full-window overlay; the picker remains beneath it.
        commands.spawn((
            Root,
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                ..default()
            },
            GlobalZIndex(5400),
            Interaction::None,
            bevy::ui::FocusPolicy::Block,
            BackgroundColor(Color::srgba(0.012, 0.010, 0.008, 0.97)),
            BackgroundGradient::from(RadialGradient {
                position: UiPosition::CENTER.at(Val::Percent(0.), Val::Percent(-20.)),
                shape: RadialGradientShape::FarthestCorner,
                stops: vec![
                    ColorStop::new(Color::linear_rgba(0.30, 0.17, 0.06, 0.35), Val::Percent(0.)),
                    ColorStop::new(Color::linear_rgba(0., 0., 0., 0.), Val::Percent(70.)),
                ],
                ..default()
            }),
        ));
        if matches!(
            state.page,
            Page::Character | Page::Collection | Page::DropTables
        ) {
            commands
                .spawn((
                    Root,
                    crate::canvas::NativeCanvas::main_menu(),
                    GlobalZIndex(5401),
                    Node {
                        position_type: PositionType::Absolute,
                        width: Val::Px(1600.),
                        height: Val::Px(900.),
                        ..default()
                    },
                ))
                .with_children(|canvas| {
                    crate::armory::build(
                        canvas,
                        &art,
                        &catalog,
                        &state,
                        &preview,
                        &armory,
                        &armory_view,
                    )
                });
        }
    }
    if matches!(state.dialog, Some(Dialog::Language)) {
        commands
            .spawn((
                Root,
                Node {
                    position_type: PositionType::Absolute,
                    width: Val::Percent(100.),
                    height: Val::Percent(100.),
                    ..default()
                },
                // 0.97.2 toggle wrapper 1401d8c4e: language root is above controls.
                GlobalZIndex(5003),
            ))
            .with_children(|window| crate::localization::popover(window, &art, &locale));
    }
}
pub fn rect(bounds: [f32; 4]) -> Node {
    Node {
        position_type: PositionType::Absolute,
        left: Val::Px(bounds[0]),
        top: Val::Px(bounds[1]),
        width: Val::Px(bounds[2]),
        height: Val::Px(bounds[3]),
        ..default()
    }
}

fn utility_button(ui: &mut ChildSpawnerCommands, art: &MenuArt, label: &str, action: impl Component) {
    ui.spawn((
        Button,
        NativeStaticFrame,
        action,
        Face {
            selected: false,
            primary: true,
            disabled: false,
        },
        Node {
            padding: UiRect::axes(Val::Px(18.), Val::Px(8.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(4.)),
            ..default()
        },
        BackgroundColor(Color::NONE),
        BorderColor::all(BUTTON_EDGE),
        native_button_gradient(),
        BoxShadow::new(
            Color::srgba(0., 0., 0., 0.85),
            Val::Px(0.),
            Val::Px(2.),
            Val::Px(0.),
            Val::Px(6.),
        ),
    ))
    .with_children(|button| {
        button.spawn((
            Text::new(label),
            TextFont {
                font: art.font.clone(),
                font_size: 15.,
                ..default()
            },
            TextColor(GOLD),
            native_text_shadow(),
        ));
    });
}

fn community_button(ui: &mut ChildSpawnerCommands, art: &MenuArt) {
    let Some(icon) = art.icons.get("community") else {
        return;
    };
    let mut node = Node::default();
    node.padding = UiRect::axes(Val::Px(14.), Val::Px(8.));
    node.border = UiRect::all(Val::Px(1.));
    node.border_radius = BorderRadius::all(Val::Px(4.));
    node.align_items = AlignItems::Center;
    node.justify_content = JustifyContent::Center;
    ui.spawn((
        Button,
        NativeStaticFrame,
        Action::Community,
        Face {
            selected: false,
            primary: true,
            disabled: false,
        },
        node,
        BackgroundColor(Color::NONE),
        BorderColor::all(BUTTON_EDGE),
        native_button_gradient(),
        BoxShadow::new(
            Color::srgba(0., 0., 0., 0.85),
            Val::Px(0.),
            Val::Px(2.),
            Val::Px(0.),
            Val::Px(6.),
        ),
    ))
    .with_children(|button| {
        button.spawn((
            ImageNode {
                color: GOLD,
                ..ImageNode::new(icon.clone())
            },
            Node {
                width: Val::Px(24.),
                height: Val::Px(18.),
                flex_shrink: 0.,
                ..default()
            },
        ));
    });
}
pub fn caption(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    bounds: [f32; 4],
    color: Color,
    center: bool,
) {
    ui.spawn((
        Text::new(value.into()),
        TextFont {
            font: art.font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        native_text_shadow(),
        TextLayout::new_with_justify(if center {
            Justify::Center
        } else {
            Justify::Left
        }),
        rect(bounds),
    ));
}
pub fn heading(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    bounds: [f32; 4],
    center: bool,
) {
    ui.spawn((
        Text::new(value.into()),
        TextFont {
            font: art.heading_font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(GOLD),
        native_text_shadow(),
        TextLayout::new_with_justify(if center {
            Justify::Center
        } else {
            Justify::Left
        }),
        rect(bounds),
    ));
}
pub fn panel(
    ui: &mut ChildSpawnerCommands,
    bounds: [f32; 4],
    build: impl FnOnce(&mut ChildSpawnerCommands),
) {
    native_panel(ui, rect(bounds), build);
}
pub fn button(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    action: Action,
    bounds: [f32; 4],
    selected: bool,
    primary: bool,
    disabled: bool,
) {
    let utility = matches!(action, Action::Options | Action::Language | Action::Quit);
    let native_red = primary || utility;
    let mut node = rect(bounds);
    node.border = UiRect::all(Val::Px(if selected { 1.5 } else { 1. }));
    node.border_radius = BorderRadius::all(Val::Px(4.));
    node.align_items = AlignItems::Center;
    node.justify_content = JustifyContent::Center;
    let mut entity = ui.spawn((
        Button,
        action,
        Face {
            selected,
            primary,
            disabled,
        },
        node,
        BackgroundColor(if primary { RED } else { DARK }),
        BorderColor::all(if selected {
            GOLD
        } else if native_red {
            BUTTON_EDGE
        } else {
            EDGE
        }),
    ));
    if native_red {
        entity.insert(native_button_gradient());
    }
    if utility {
        entity.insert(NativeStaticFrame);
    }
    entity.with_children(|child| {
        child.spawn((
            Text::new(value.into()),
            TextFont {
                font: art.font.clone(),
                font_size: if utility { 15. } else { 14. },
                ..default()
            },
            TextColor(if disabled { MUTED } else { GOLD }),
            native_text_shadow(),
            TextLayout::new_with_justify(Justify::Center),
        ));
    });
}
pub fn picture(ui: &mut ChildSpawnerCommands, art: &MenuArt, key: &str, bounds: [f32; 4]) {
    if let Some(image) = art.icons.get(key) {
        ui.spawn((ImageNode::new(image.clone()), rect(bounds)));
    }
}
fn paint(
    mut buttons: Query<
        (
            &Interaction,
            &Action,
            &Face,
            &mut BorderColor,
            &mut BackgroundColor,
        ),
        (
            Changed<Interaction>,
            Without<crate::hover::NativeHover>,
            Without<NativeStaticFrame>,
        ),
    >,
) {
    for (interaction, action, face, mut border, mut color) in &mut buttons {
        let hovered = *interaction != Interaction::None && !face.disabled;
        if matches!(action, Action::Zone(_)) {
            *border = BorderColor::all(if face.selected {
                GOLD
            } else if hovered {
                BUTTON_EDGE
            } else {
                Color::srgb(0.169, 0.129, 0.071)
            });
            color.0 = Color::BLACK;
            continue;
        }
        let native_red =
            face.primary || matches!(action, Action::Options | Action::Language | Action::Quit);
        *border = BorderColor::all(if hovered || face.selected {
            GOLD
        } else if native_red {
            BUTTON_EDGE
        } else {
            EDGE
        });
        color.0 = if face.primary {
            if hovered {
                Color::srgb(0.28, 0.04, 0.02)
            } else {
                RED
            }
        } else if hovered {
            Color::srgb(0.09, 0.07, 0.04)
        } else {
            DARK
        };
    }
}
pub fn race_id_for(key: &str) -> u8 {
    match key {
        "human" => 1,
        "orc" => 2,
        "dwarf" => 3,
        "night_elf" | "nightelf" => 4,
        "undead" | "scourge" => 5,
        "tauren" => 6,
        "gnome" => 7,
        "troll" => 8,
        _ => 0,
    }
}
fn recovery_page(ui: &mut ChildSpawnerCommands, art: &MenuArt, state: &MenuState) {
    let title = Page::TABS
        .iter()
        .find(|(page, _)| *page == state.page)
        .map(|(_, title)| *title)
        .unwrap_or("Armory");
    panel(ui, [160., 137., 1280., 650.], |body| {
        heading(body, art, title, 36., [40., 30., 1200., 60.], true);
        caption(
            body,
            art,
            "Native screen code recovery is in progress.",
            18.,
            [240., 260., 800., 50.],
            PAPER,
            true,
        );
    });
    button(
        ui,
        art,
        "Back",
        Action::Picker,
        [700., 805., 200., 50.],
        false,
        true,
        false,
    );
}
fn dialog_ui(ui: &mut ChildSpawnerCommands, art: &MenuArt, dialog: &Dialog) {
    if matches!(
        dialog,
        Dialog::Coop | Dialog::CoopDifficulty | Dialog::RunOptions | Dialog::Menu | Dialog::RewardsChanges(_)
    ) {
        return;
    }
    ui.spawn((
        rect([0., 0., 1600., 900.]),
        BackgroundColor(Color::srgba(0., 0., 0., 0.68)),
        GlobalZIndex(100),
    ))
    .with_children(|shade| match dialog {
        Dialog::Coop => {}
        Dialog::Menu => {}
        Dialog::RunOptions | Dialog::CoopDifficulty => {}
        Dialog::Language => {}
        Dialog::RewardsChanges(_) => {}
        Dialog::Notice(title, body_text) => panel(shade, [450., 275., 700., 350.], |body| {
            heading(body, art, title, 36., [30., 25., 640., 60.], true);
            caption(
                body,
                art,
                body_text,
                17.,
                [45., 115., 610., 130.],
                PAPER,
                true,
            );
            button(
                body,
                art,
                "Back",
                Action::Close,
                [255., 275., 190., 42.],
                false,
                true,
                false,
            );
        }),
    });
}
