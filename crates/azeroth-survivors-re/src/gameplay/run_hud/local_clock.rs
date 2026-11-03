//! Device wall clock shared by the minimap label and the addon callback.

use std::sync::{
    Arc,
    atomic::{AtomicBool, Ordering},
};

use benilla_app::local_client::{LocalClientInput, local_hour_minute};
use benilla_ui::script::UiScript;
use bevy::{picking::Pickable, prelude::*, time::Real, ui::FocusPolicy};

use super::HudSettings;
use crate::{assets::MenuArt, localization::Localization, menu_state::MenuState};

/// The addon VM captures a reader that stays current across language changes.
#[derive(Resource)]
pub(super) struct ClockFormat(Arc<AtomicBool>);

impl FromWorld for ClockFormat {
    fn from_world(world: &mut World) -> Self {
        Self(Arc::new(AtomicBool::new(
            world.resource::<Localization>().code() != "en",
        )))
    }
}

pub(super) fn sync_format(locale: Res<Localization>, format: Res<ClockFormat>) {
    if locale.is_changed() {
        format.0.store(locale.code() != "en", Ordering::Relaxed);
    }
}

fn clock_text(hour: u32, minute: u32, is_24_hour: bool) -> String {
    if is_24_hour {
        format!("{hour:02}:{minute:02}")
    } else {
        let period = if hour < 12 { "AM" } else { "PM" };
        let hour = match hour % 12 {
            0 => 12,
            hour => hour,
        };
        format!("{hour}:{minute:02} {period}")
    }
}

pub(in crate::gameplay) fn install_lua(world: &World, script: &UiScript) -> Result<(), String> {
    let format = world.resource::<ClockFormat>().0.clone();
    let lua = script.lua();
    let read = lua
        .create_function(move |_, ()| {
            let (hour, minute) = local_hour_minute();
            let is_24_hour = format.load(Ordering::Relaxed);
            Ok((
                clock_text(hour, minute, is_24_hour),
                hour,
                minute,
                is_24_hour,
            ))
        })
        .map_err(|error| error.to_string())?;
    lua.globals()
        .set("AZS_NativeLocalTime", read)
        .map_err(|error| error.to_string())
}

#[derive(Component)]
pub(super) struct ClockRoot;

#[derive(Component)]
pub(super) struct ClockText;

pub(super) fn sync(
    mut commands: Commands,
    input: Res<LocalClientInput>,
    settings: Res<HudSettings>,
    menu: Res<MenuState>,
    format: Res<ClockFormat>,
    art: Res<MenuArt>,
    time: Res<Time<Real>>,
    mut root: Query<(&mut Node, &mut Visibility), With<ClockRoot>>,
    mut text: Query<&mut Text, With<ClockText>>,
    mut sampled_at: Local<Option<f64>>,
) {
    let Ok((mut node, mut visibility)) = root.single_mut() else {
        if root.is_empty() {
            commands
                .spawn((
                    ClockRoot,
                    Node {
                        position_type: PositionType::Absolute,
                        justify_content: JustifyContent::Center,
                        ..default()
                    },
                    Visibility::Hidden,
                    GlobalZIndex(3990),
                    FocusPolicy::Pass,
                    Pickable::IGNORE,
                ))
                .with_children(|root| {
                    root.spawn((
                        ClockText,
                        Text::new(""),
                        TextFont {
                            font: art.font.clone(),
                            font_size: 12.,
                            ..default()
                        },
                        TextColor(Color::srgb(0.949, 0.902, 0.788)),
                        crate::menu::native_text_shadow(),
                        Pickable::IGNORE,
                    ));
                });
            *sampled_at = None;
        }
        return;
    };

    let rect = input.rendered_minimap_rect.filter(|rect| {
        menu.in_run
            && !input.loading_screen_covering
            && settings.shown("localClock")
            && rect[2] - rect[0] > 1.
            && !text.is_empty()
    });
    if let Some([min_x, _, max_x, max_y]) = rect {
        let scale = settings.scale;
        let left = Val::Px(min_x / scale);
        let top = Val::Px((max_y + 4.) / scale);
        let width = Val::Px((max_x - min_x) / scale);
        if (node.left, node.top, node.width) != (left, top, width) {
            (node.left, node.top, node.width) = (left, top, width);
        }
        visibility.set_if_neq(Visibility::Inherited);
    } else {
        visibility.set_if_neq(Visibility::Hidden);
    }

    let Ok(mut text) = text.single_mut() else {
        return;
    };
    let now = time.elapsed_secs_f64();
    if sampled_at.is_some_and(|previous| now - previous < 1.) {
        return;
    }
    *sampled_at = Some(now);
    let (hour, minute) = local_hour_minute();
    let value = clock_text(hour, minute, format.0.load(Ordering::Relaxed));
    if text.0 != value {
        text.0 = value;
    }
}
