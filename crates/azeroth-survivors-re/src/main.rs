//! Native menu and recovered playable-zone integration.

mod ability_tooltip;
mod addons;
mod armory;
mod assets;
mod background;
mod canvas;
mod catalog;
mod codex;
mod coop_ui;
mod coop_directory_row;
mod coop_runtime;
mod coop_directory;
mod coop_profile;
mod community_icon;
mod discord;
mod game_window;
mod gameplay;
mod hero_name;
mod ime;
mod hover;
mod localization;
mod legacy_config;
mod menu;
mod menu_audio;
mod menu_compositor;
mod menu_fonts;
mod menu_gamma;
mod menu_overlay;
mod menu_scene;
mod menu_state;
mod native_input;
mod native_bindings;
mod native_dbc;
mod options;
mod options_config;
mod options_globals;
mod picker;
mod preview;
mod progression;
mod run_mods;
pub(crate) use azeroth_survivors_re::heroic;
mod run_options;
mod run_seed;
mod save;
mod save_browser;
mod scrollbar;
mod stock_frontend;
mod startup;
// The IO backend is compiled by normal builds. Unit fixtures exercise policy
// without opening a device or importing the engine's live audio test harness.
#[cfg(not(test))]
#[allow(dead_code, unused_imports)]
mod sound;
#[cfg(not(test))]
mod cvars {
    pub(crate) use crate::options_config::boot_cvar;
}
mod talents;
mod talent_context;
mod tooltip;
mod update;
mod update_ui;

use std::path::PathBuf;

use bevy::app::AppExit;
use bevy::prelude::*;
use bevy::render::view::screenshot::{save_to_disk, Screenshot};
use bevy::window::WindowResolution;

#[derive(Resource)]
struct Capture {
    path: PathBuf,
    frames: u32,
}

fn main() {
    benilla_formats::Chain::use_survivors_archive_layout();
    legacy_config::migrate();
    let mut arguments = std::env::args().skip(1);
    let mut check_data = false;
    let mut check_preview = false;
    let mut capture = None;
    let mut start_zone = None;
    let mut positional = Vec::new();
    while let Some(argument) = arguments.next() {
        match argument.as_str() {
            "--data-dir" => {
                let directory = arguments.next().expect("--data-dir requires a directory");
                std::env::set_var("WOW_DATA", directory);
            }
            "--font-dir" => {
                let directory = arguments.next().expect("--font-dir requires a directory");
                std::env::set_var("AZS_FONT_DIR", directory);
            }
            "--check-data" => check_data = true,
            "--check-preview" => check_preview = true,
            "--capture" => {
                capture = Some(PathBuf::from(
                    arguments.next().expect("--capture requires a PNG path"),
                ))
            }
            "--zone" => start_zone = Some(arguments.next().expect("--zone requires a zone key")),
            "--version" => {
                println!(
                    "Azeroth Survivors RE {} — main-menu milestone",
                    env!("CARGO_PKG_VERSION")
                );
                return;
            }
            "--help" | "-h" => {
                println!("AzerothSurvivorsRE [zone [class [race [name [female]]]]] [--data-dir Data] [--font-dir Fonts] [--check-data] [--check-preview] [--zone key] [--capture output.png] [--version]");
                return;
            }
            _ if !argument.starts_with('-') => positional.push(argument),
            _ => {
                eprintln!("Unknown argument: {argument}");
                std::process::exit(2);
            }
        }
    }
    // Current1400015ba samples this clock once, after argument collection.
    let run_seeds = run_seed::RunSeeds::default();
    let catalog = catalog::MenuCatalog::embedded();
    if check_preview {
        if let Err(error) = preview::check_assets() {
            eprintln!("{error}");
            std::process::exit(1);
        }
        return;
    }
    if check_data {
        if let Err(error) = assets::check_data(&catalog) {
            eprintln!("{error}");
            std::process::exit(1);
        }
        return;
    }
    #[cfg(windows)]
    benilla_app::install_windows_fault_reporting(benilla_app::BuildId {
        version: env!("CARGO_PKG_VERSION"),
        describe: env!("BENILLA_GIT_DESCRIBE"),
        sha: env!("BENILLA_GIT_SHA"),
        short: env!("BENILLA_GIT_SHORT"),
        date: env!("BENILLA_GIT_DATE"),
        profile: env!("BENILLA_PROFILE"),
        extended: true,
        ..Default::default()
    });
    let mut app = App::new();
    app.insert_resource(run_seeds);
    let native_startup = startup::NativeStartup::positional(&positional, &catalog);
    native_startup.configure_client(&catalog);
    // Current0.109.0 startup14000eb00: an explicit zone quickstart wins over the
    // exact-one WOW_ROGUE_GLUE switch. The default remains the custom picker.
    let stock_frontend = start_zone.is_none()
        && (!positional.is_empty()
            || std::env::var_os("WOW_ROGUE_GLUE").as_deref() == Some(std::ffi::OsStr::new("1")));
    if stock_frontend {
        app.init_resource::<benilla_app::local_client::LocalStockFrontend>();
    }
    app.insert_resource(native_startup);
    // Asset sources must precede DefaultPlugins; the world and the picker use
    // the same user-supplied patch chain, selected by --data-dir / WOW_DATA.
    if let Some(directory) = assets::data_directory() {
        std::env::set_var("WOW_DATA", &directory);
        if let Err(error) = benilla_assets::register_mpq_source(&mut app, &directory) {
            eprintln!("Could not register menu world data: {error:#}");
        }
    }
    let plugins = DefaultPlugins.set(WindowPlugin {
        primary_window: Some(Window {
            title: "Azeroth Survivors".into(),
            focused: !benilla_world::bgwin::background_run(),
            resolution: WindowResolution::new(1600, 900),
            ..default()
        }),
        ..default()
    });
    #[cfg(windows)]
    let plugins = plugins.set(bevy::log::LogPlugin {
        custom_layer: |_| Some(Box::new(benilla_world::log_ring::LogRing)),
        ..default()
    });
    app.insert_resource(catalog)
        .init_resource::<assets::MenuArt>()
        .insert_resource(ClearColor(Color::srgb(0.025, 0.021, 0.018)))
        .add_plugins(native_input::device_plugins(plugins));
    benilla_app::local_client::set_enchant_glow_priority(true);
    benilla_assets::register_asset_loaders(&mut app);
    app.add_plugins(benilla_world::world_plugins::WorldPlugins)
        .add_plugins(benilla_world::bgwin::BgWinPlugin)
        .add_plugins(benilla_app::LocalClientPlugin)
        .add_systems(Startup, assets::load_menu_art)
        .add_plugins((
            menu_scene::MenuScenePlugin,
            menu_compositor::MenuCompositorPlugin,
        ))
        .add_plugins((
            localization::LocalizationPlugin,
            menu_fonts::MenuFontsPlugin,
            ime::ImePlugin,
            menu::MenuPlugin,
            background::BackgroundPlugin,
            hover::NativeHoverPlugin,
            canvas::NativeCanvasPlugin,
            menu_gamma::UiGammaPlugin,
            preview::HeroPreviewPlugin,
            options::OptionsPlugin,
            run_options::RunOptionsPlugin,
            menu_overlay::MenuOverlayPlugin,
            armory::ArmoryPlugin,
            talents::TalentsPlugin,
            progression::ProgressionPlugin,
        ))
        .add_plugins(codex::CodexPlugin)
        .add_plugins(scrollbar::NativeScrollbarPlugin)
        .add_plugins(coop_ui::CoopUiPlugin)
        .add_plugins(coop_directory_row::DirectoryRowPlugin)
        .add_plugins(coop_runtime::CoopPlugin)
        .add_plugins(coop_directory::CoopDirectoryPlugin)
        .add_plugins(game_window::GameWindowPlugin)
        .add_plugins(tooltip::NativeTooltipPlugin)
        .add_plugins(update_ui::UpdateUiPlugin)
        .add_plugins(gameplay::GameplayPlugin)
        .add_plugins(discord::DiscordPlugin)
        .add_plugins(native_input::NativeInputPlugin)
        .add_plugins(stock_frontend::StockFrontendPlugin)
        .insert_resource(gameplay::StartZone(start_zone));

    if let Some(path) = capture {
        app.insert_resource(Capture { path, frames: 0 })
            .add_systems(Update, capture_menu);
    }
    app.run();
}

fn capture_menu(
    mut commands: Commands,
    mut capture: ResMut<Capture>,
    mut exit: MessageWriter<AppExit>,
    session: Res<gameplay::RunSession>,
    world: Res<gameplay::world::ZoneWorld>,
) {
    if let Some(game) = session.mechanics.as_ref() {
        // A zone capture must show the resident live level, not its loading cover.
        if !world.ready || (session.started && !game.dead && !game.is_paused_for_choice() && game.clock < 5.0) {
            return;
        }
    }
    capture.frames += 1;
    if capture.frames == 60 {
        if let Some(parent) = capture.path.parent() {
            let _ = std::fs::create_dir_all(parent);
        }
        commands
            .spawn(Screenshot::primary_window())
            .observe(save_to_disk(capture.path.clone()));
    }
    if capture.frames >= 180 {
        exit.write(AppExit::Success);
    }
}
