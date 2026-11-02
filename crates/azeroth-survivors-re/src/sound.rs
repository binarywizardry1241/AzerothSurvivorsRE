//! Recovered custom-picker theme, using the engine's existing audio seam.
//! The backend is shared source, not a new player implementation. Its complete
//! native revision/DSP parity and rebuilt playback remain unverified.

use crate::menu_audio::gain;

#[path = "../../benilla-app/src/sound/limiter.rs"]
mod limiter;
#[path = "../../benilla-app/src/sound/meter.rs"]
mod meter;
#[path = "../../benilla-app/src/sound/mix_tap.rs"]
mod mix_tap;
#[path = "../../benilla-app/src/sound/mixer.rs"]
mod mixer;
#[path = "../../benilla-app/src/sound/output/mod.rs"]
mod output;

use benilla_assets::{read_loose_or_chain, LooseFiles, LooseIndex, LooseIndexCell, LooseOpen};
use bevy::{prelude::*, window::PrimaryWindow};
use std::sync::{Arc, Mutex};

use crate::menu_audio::{Settings, THEME};
use crate::options::OptionsState;

pub struct MenuAudioPlugin;

struct MenuAudio {
    mixer: Option<mixer::Mixer>,
    assets: Option<(Mutex<benilla_formats::Chain>, LooseFiles)>,
    handle: Option<mixer::StreamingSoundHandle<kira::sound::FromFileError>>,
    watch: mixer::StreamWatch,
}

impl Plugin for MenuAudioPlugin {
    fn build(&self, app: &mut App) {
        let silent = ["WOW_NOSOUND", "WOW_CAPTURE"]
            .into_iter()
            .find(|name| std::env::var_os(name).is_some());
        let mixer = if let Some(name) = silent {
            info!("${name} set — audio disabled");
            None
        } else {
            match mixer::Mixer::new(None) {
                Ok(mixer) => Some(mixer),
                Err(error) => {
                    warn!("no audio device — running silent: {error:#}");
                    None
                }
            }
        };
        app.insert_non_send_resource(MenuAudio {
            mixer,
            assets: None,
            handle: None,
            watch: mixer::StreamWatch::new("glue music"),
        })
        .add_systems(Startup, load_audio_assets)
        .add_systems(Update, (apply_output, start_theme, watch_theme).chain());
    }
}

fn load_audio_assets(mut audio: NonSendMut<MenuAudio>) {
    audio.assets = crate::assets::data_directory().and_then(|directory| {
        let chain = benilla_formats::open_chain(&directory).ok()?;
        // Both lookups must use the selected Data directory, including the
        // development helper's fallback when WOW_DATA was not explicitly set.
        let install = Arc::new(LooseIndexCell::new(move || {
            LooseIndex::build(directory.parent(), &directory)
        }));
        Some((
            Mutex::new(chain),
            LooseFiles {
                install: Some(install),
                addons: None,
            },
        ))
    });
}

fn apply_output(
    mut audio: NonSendMut<MenuAudio>,
    options: Res<OptionsState>,
    windows: Query<&Window, With<PrimaryWindow>>,
    mut last_master: Local<Option<(bool, f32, bool)>>,
    mut last_gate: Local<Option<bool>>,
) {
    let settings = Settings::read(|name| options.engine_cvar(name));
    let cur = (settings.enabled, settings.master, settings.limiter);
    let open = settings.output_open(windows.single().ok().map(|window| window.focused));
    let master_changed = *last_master != Some(cur);
    let gate_changed = *last_gate != Some(open);
    *last_master = Some(cur);
    *last_gate = Some(open);
    let Some(mixer) = audio.mixer.as_mut() else {
        return;
    };
    if master_changed {
        mixer.set_master(settings.master_amp());
        mixer.set_limiter(settings.limiter);
    }
    if gate_changed {
        mixer.set_output_gate(open);
    }
    mixer.poll_health();
}

fn start_theme(mut audio: NonSendMut<MenuAudio>, options: Res<OptionsState>) {
    if audio.handle.is_some() || audio.mixer.is_none() {
        return;
    }
    let Some((chain, loose)) = audio.assets.as_ref() else {
        return;
    };
    let data = read_loose_or_chain(chain, loose, THEME, LooseOpen::Index)
        .ok_or_else(|| anyhow::anyhow!("not in the loose files or the patch chain"))
        .and_then(mixer::stream_from_bytes);
    let data = match data {
        Ok(data) => data,
        Err(error) => {
            debug!("glue music: {THEME} — {error:#}");
            return;
        }
    };
    let amp = Settings::read(|name| options.engine_cvar(name)).theme_amp();
    match audio
        .mixer
        .as_mut()
        .unwrap()
        .play_stream(data.volume(mixer::amp_to_db(amp)))
    {
        Ok(handle) => {
            info!("glue music: {THEME}");
            audio.handle = Some(handle);
            audio.watch.reset();
        }
        Err(error) => debug!("glue music: {error:#}"),
    }
}

fn watch_theme(mut audio: NonSendMut<MenuAudio>, options: Res<OptionsState>) {
    let audio = &mut *audio;
    let Some(handle) = audio.handle.as_mut() else {
        return;
    };
    let amp = Settings::read(|name| options.engine_cvar(name)).theme_amp();
    handle.set_volume(mixer::amp_to_db(amp), mixer::glide());
    if handle.state() == kira::sound::PlaybackState::Stopped {
        info!("glue music: stream ended");
        audio.handle = None;
        audio.watch.reset();
        return;
    }
    audio.watch.feed(handle);
}
