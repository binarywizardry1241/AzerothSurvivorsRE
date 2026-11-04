//! Custom-screen device routing. Current contracts: input/pad-0.109.0 reports.
mod focus;
mod policy;
mod touch_view;
mod acquisition;

pub(crate) fn device_plugins(
    plugins: bevy::app::PluginGroupBuilder,
) -> bevy::app::PluginGroupBuilder {
    acquisition::plugins(plugins)
}

use crate::{gameplay::RunSession, menu_state::MenuState, options::OptionsState};
use benilla_app::local_client::{
    LocalClientExtension, LocalClientInput, LocalClientSet, LocalDeviceInput,
};
use bevy::{
    input::{
        keyboard::{Key, KeyboardInput},
        mouse::MouseButtonInput,
        ButtonState,
    },
    prelude::*,
    ui::FocusPolicy,
    window::{CursorMoved, PrimaryWindow},
};

#[derive(SystemSet, Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct DeviceInputSet;

pub struct NativeInputPlugin;
impl Plugin for NativeInputPlugin {
    fn build(&self, app: &mut App) {
        acquisition::register(app);
        for (name, value) in [
            ("padInvertX", "0"),
            ("padInvertY", "0"),
            ("padLookSpeed", "1"),
            ("padZoomSpeed", "1"),
            ("padDeadZone", "0.25"),
        ] {
            let mut extension = app.world_mut().resource_mut::<LocalClientExtension>();
            if !extension.cvar_defaults.iter().any(|row| row.0 == name) {
                extension.cvar_defaults.push((name.into(), value.into()));
            }
        }
        app.init_resource::<DeviceState>()
            .init_resource::<DeviceUiInput>()
            .add_systems(
                Update,
                capture_blocking_ui.in_set(LocalClientSet::OverlayCapture),
            )
            .add_systems(
                Update,
                update
                    .in_set(DeviceInputSet)
                    .before(LocalClientSet::OverlayCapture)
                    .before(crate::localization::LocalizationSet::Input)
                    .before(crate::options::OptionsSet::Input)
                    .before(crate::menu_state::AccountInput)
                    .before(crate::gameplay::RunSet::Input),
            );
    }
}

fn capture_blocking_ui(
    interactions: Query<(&Interaction, &FocusPolicy)>,
    mut extension: ResMut<LocalClientExtension>,
) {
    extension.pointer_over_ui |= interactions.iter().any(|(interaction, policy)| {
        matches!(*interaction, Interaction::Hovered | Interaction::Pressed)
            && *policy == FocusPolicy::Block
    });
}

#[derive(Resource, Default)]
struct DeviceState {
    pad_mode: bool,
    mouse_travel: f32,
    previous_cursor: Option<Vec2>,
    cursor_events: bevy::ecs::message::MessageCursor<CursorMoved>,
    keyboard_events: bevy::ecs::message::MessageCursor<KeyboardInput>,
    mouse_events: bevy::ecs::message::MessageCursor<MouseButtonInput>,
    accept_blocked: bool,
    repeat: policy::Repeat,
    touch: policy::TouchState,
    focus: Option<Entity>,
    previous_center: Option<Vec2>,
    focus_missing: u8,
    ring: Option<Entity>,
    synthetic_input: bool,
    widgets: touch_view::Widgets,
    interface_touch: Option<(u64, Vec2)>,
}

/// Used by controls which distinguish a new pointer press from a held drag.
#[derive(Resource, Default)]
pub(crate) struct DeviceUiInput {
    pub activated: Option<Entity>,
    pub touch_pressed: bool,
    pub touch_held: bool,
}
impl DeviceUiInput {
    pub(crate) fn pressed(&self) -> bool {
        self.activated.is_some() || self.touch_pressed
    }
}
pub(crate) fn activated(input: &DeviceUiInput, entity: Entity) -> bool {
    input.activated == Some(entity)
}

// Terminal actions use Interaction directly in the selected native bundle.
// Admit their typed action alongside the port's existing Button controls;
// Interaction-only overlay roots and tooltip hosts are not actionable controls.
type CustomControl = (
    With<Interaction>,
    Or<(With<Button>, With<crate::gameplay::DeviceTerminalAction>)>,
);

#[derive(Default)]
struct Pad {
    left: Vec2,
    right: Vec2,
    dpad: Vec2,
    accept: bool,
    accept_pressed: bool,
    back: bool,
    secondary_pressed: bool,
    pause: bool,
    stored: bool,
    character: bool,
    zoom: f32,
    activity: bool,
}

fn pad(world: &mut World, dead_zone: f32) -> Pad {
    use GamepadButton::*;
    let mut out = Pad::default();
    let (mut zoom_in, mut zoom_out) = (0.0_f32, 0.0_f32);
    let (mut left, mut right, mut up, mut down) = (false, false, false, false);
    let mut query = world.query::<(Entity, &Gamepad)>();
    let pads: Vec<_> = query.iter(world).collect();
    if let Some((_, first)) = pads.first() {
        out.left = policy::stick(first.left_stick(), dead_zone);
        out.right = policy::stick(first.right_stick(), dead_zone);
    }
    for (_, pad) in pads {
        out.accept |= pad.pressed(South);
        out.accept_pressed |= pad.just_pressed(South);
        out.back |= pad.just_pressed(East);
        out.secondary_pressed |= pad.just_pressed(West);
        out.pause |= pad.just_pressed(Start);
        out.stored |= pad.just_pressed(North);
        out.character |= pad.just_pressed(Select);
        left |= pad.pressed(DPadLeft);
        right |= pad.pressed(DPadRight);
        up |= pad.pressed(DPadUp);
        down |= pad.pressed(DPadDown);
        let value = |button| {
            pad.get(button)
                .unwrap_or(if pad.pressed(button) { 1. } else { 0. })
        };
        // Native max(right shoulder, right trigger)-max(left shoulder,left trigger).
        zoom_out = zoom_out.max(value(RightTrigger).max(value(RightTrigger2)));
        zoom_in = zoom_in.max(value(LeftTrigger).max(value(LeftTrigger2)));
        out.activity |= pad.get_just_pressed().next().is_some();
    }
    out.zoom = zoom_out - zoom_in;
    out.dpad = Vec2::new(
        if left {
            -1.
        } else if right {
            1.
        } else {
            0.
        },
        if up {
            1.
        } else if down {
            -1.
        } else {
            0.
        },
    );
    // Current handoff admits a new button edge or a stick strictly above .5;
    // zoom magnitude by itself does not enter pad mode.
    out.activity |= out.left.length() > policy::MODE_THRESHOLD
        || out.right.length() > policy::MODE_THRESHOLD;
    out
}

fn update(world: &mut World) {
    let now = world.resource::<Time>().elapsed_secs();
    let dt = world.resource::<Time>().delta_secs();
    let (size, focused, window_entity) = {
        let mut q = world.query_filtered::<(Entity, &Window), With<PrimaryWindow>>();
        let Ok((entity, window)) = q.single(world) else {
            return;
        };
        (
            Vec2::new(window.width(), window.height()),
            window.focused,
            entity,
        )
    };
    let read = |world: &World, key: &str, fallback: f32| {
        benilla_app::local_client::device_cvar(world, key)
            .or_else(|| world.resource::<OptionsState>().engine_cvar(key))
            .and_then(|s| s.trim().parse::<f32>().ok())
            .unwrap_or(fallback)
    };
    let dead_zone = read(world, "padDeadZone", 0.25).clamp(0., 0.9);
    let look_speed = policy::speed(read(world, "padLookSpeed", 1.));
    let zoom_speed = policy::speed(read(world, "padZoomSpeed", 1.));
    let invert_x = read(world, "padInvertX", 0.) != 0.;
    let invert_y = read(world, "padInvertY", 0.) != 0.;
    let pad = pad(world, dead_zone);
    let touches: Vec<_> = world
        .resource::<Touches>()
        .iter()
        .map(|t| (t.id(), t.position()))
        .collect();
    let touch_pressed = world
        .resource::<Touches>()
        .iter_just_pressed()
        .next()
        .is_some();
    let keyboard = world
        .resource::<ButtonInput<KeyCode>>()
        .get_just_pressed()
        .next()
        .is_some();
    let mouse = world
        .resource::<ButtonInput<MouseButton>>()
        .get_just_pressed()
        .next()
        .is_some();
    let native = world.resource::<LocalClientInput>();
    let captured = native.keyboard_captured;
    let covered = native.loading_screen_covering;
    let in_run = world.resource::<MenuState>().in_run;
    let gameplay = in_run
        && world.resource::<RunSession>().playing()
        && world.resource::<crate::gameplay::world::ZoneWorld>().ready
        && !world.resource::<OptionsState>().open
        && !covered;
    let mut state = world.remove_resource::<DeviceState>().unwrap();
    // Native readers stop after the first Pressed message, retaining later
    // messages for the next pass. Repeats are messages too; ButtonInput's
    // deduplicated just-pressed set cannot reproduce this lifetime.
    let handoff_keyboard = state
        .keyboard_events
        .read(world.resource::<Messages<KeyboardInput>>())
        .any(|event| event.state == ButtonState::Pressed);
    let handoff_mouse = state
        .mouse_events
        .read(world.resource::<Messages<MouseButtonInput>>())
        .any(|event| event.state == ButtonState::Pressed);
    // Current1401c2e35 consumes the synthetic-input latch once and skips all
    // keyboard/mouse/travel handoff for that pass, not just the Right edge.
    let synthetic_input = std::mem::take(&mut state.synthetic_input);
    // Current1401c2db0 visits every queued CursorMoved position, retaining the
    // previous point even outside pad mode and during a synthetic-input pass.
    // Sampling only the final Window position loses travel that doubles back.
    let mut cursor_travel = 0.;
    for event in state
        .cursor_events
        .read(world.resource::<Messages<CursorMoved>>())
    {
        if let Some(previous) = state.previous_cursor {
            cursor_travel += previous.distance(event.position);
        }
        state.previous_cursor = Some(event.position);
    }
    if !pad.accept {
        state.accept_blocked = false;
    }
    if !gameplay && pad.accept {
        state.accept_blocked = true;
    }
    if !synthetic_input && pad.activity && focused {
        if !state.pad_mode {
            state.mouse_travel = 0.;
        }
        state.pad_mode = true;
    } else if state.pad_mode && !synthetic_input {
        state.mouse_travel += cursor_travel;
        if handoff_keyboard || handoff_mouse || state.mouse_travel > 12. {
            state.pad_mode = false;
            state.focus = None;
        }
    }
    if touch_pressed {
        state.touch.enabled = true;
    }
    if touches.is_empty() && (keyboard || mouse) {
        state.touch.enabled = false;
    }
    let custom_press = touch_pressed
        && world
            .query_filtered::<&Interaction, CustomControl>()
            .iter(world)
            .any(|interaction| *interaction == Interaction::Pressed);
    let mut pointer = None;
    if let Some((id, point)) = state.interface_touch {
        if let Some(&(_, point)) = touches
            .iter()
            .find(|touch| touch.0 == id)
            .filter(|_| focused && gameplay)
        {
            state.interface_touch = Some((id, point));
            pointer = Some(benilla_app::local_client::LocalTouchPointer {
                position: point,
                pressed: false,
                released: false,
                canceled: false,
            });
        } else {
            let released = world.resource::<Touches>().get_released(id).is_some();
            pointer = Some(benilla_app::local_client::LocalTouchPointer {
                position: point,
                pressed: false,
                released,
                canceled: !released || !focused || !gameplay,
            });
            state.interface_touch = None;
        }
    } else if focused && gameplay && !custom_press {
        if let Some((id, point)) = world
            .resource::<Touches>()
            .iter_just_pressed()
            .map(|touch| (touch.id(), touch.position()))
            .find(|(_, point)| {
                benilla_app::local_client::touch_over_interface(world, size, *point)
            })
        {
            state.interface_touch = Some((id, point));
            // A UI press cannot simultaneously own the floating movement stick.
            if state.touch.movement.is_some_and(|touch| touch.0 == id) {
                state.touch.movement = None;
            }
            pointer = Some(benilla_app::local_client::LocalTouchPointer {
                position: point,
                pressed: true,
                released: false,
                canceled: false,
            });
        }
    }
    let gameplay_touches: Vec<_> = touches
        .iter()
        .copied()
        .filter(|touch| {
            state
                .interface_touch
                .is_none_or(|pointer| pointer.0 != touch.0)
        })
        .filter(|touch| {
            state
                .touch
                .movement
                .is_some_and(|movement| movement.0 == touch.0)
                || !custom_press
                    && !benilla_app::local_client::touch_over_interface(world, size, touch.1)
        })
        .collect();
    let touch = state.touch.step(
        &gameplay_touches,
        Some(size.x),
        focused && gameplay && !captured,
    );
    {
        let mut output = world.resource_mut::<LocalDeviceInput>();
        output.commands.clear();
        output.menu_requested = focused && state.pad_mode && pad.pause;
        output.touch = pointer;
        output.jump_held = false;
        output.movement = None;
        output.look = Vec2::ZERO;
        output.zoom = 0.;
        if focused && gameplay && !captured {
            output.movement = touch.movement;
            output.look = touch.look;
            output.zoom = touch.zoom;
            if state.pad_mode {
                if pad.left != Vec2::ZERO {
                    output.movement = Some(policy::direction(pad.left));
                }
                output.look += Vec2::new(
                    pad.right.x * if invert_x { 2.6 } else { -2.6 },
                    pad.right.y * if invert_y { -1.5 } else { 1.5 },
                ) * look_speed
                    * dt;
                output.zoom += pad.zoom * 9. * zoom_speed * dt;
                output.jump_held = pad.accept && !state.accept_blocked;
            }
        }
    }
    world.insert_resource(DeviceUiInput {
        activated: None,
        touch_pressed,
        touch_held: !touches.is_empty(),
    });
    if focused && state.pad_mode && !captured {
        if gameplay && pad.character {
            publish_key(world, &mut state, window_entity, KeyCode::KeyC, Key::Character("c".into()));
        }
        if gameplay && pad.stored {
            world
                .resource_mut::<LocalClientExtension>()
                .cvar_writes
                .push(("spendLevels".into(), "1".into()));
        }
        if !gameplay {
            focus::update(world, &mut state, &pad, size, now, window_entity);
        } else {
            focus::deactivate(world, &mut state);
        }
    } else {
        focus::deactivate(world, &mut state);
    }
    // A touch already routed to a client frame must not also be a custom UI
    // activation. Custom Bevy controls use their own real touch Interaction.
    if pointer.is_some() {
        world.resource_mut::<DeviceUiInput>().touch_pressed = false;
    }
    if !focused {
        state.accept_blocked |= pad.accept;
        state.touch.clear();
        state.focus = None;
    }
    let show_touch = focused && gameplay && state.touch.enabled && !captured;
    if show_touch && touch_view::pause_pressed(world, &state) && (touch_pressed || mouse) {
        pulse_key(
            world,
            &mut state,
            window_entity,
            KeyCode::Escape,
            Key::Escape,
        );
    }
    touch_view::update(world, &mut state, size, show_touch);
    world.insert_resource(state);
}

fn pulse_key(
    world: &mut World,
    state: &mut DeviceState,
    window: Entity,
    key_code: KeyCode,
    logical_key: Key,
) {
    if world.resource::<ButtonInput<KeyCode>>().pressed(key_code) {
        return;
    }
    publish_key(world, state, window, key_code, logical_key);
}

fn publish_key(
    world: &mut World,
    state: &mut DeviceState,
    window: Entity,
    key_code: KeyCode,
    logical_key: Key,
) {
    state.synthetic_input = true;
    for state in [ButtonState::Pressed, ButtonState::Released] {
        world
            .resource_mut::<Messages<KeyboardInput>>()
            .write(KeyboardInput {
                key_code,
                logical_key: logical_key.clone(),
                state,
                text: match (&state, &logical_key) {
                    (ButtonState::Pressed, Key::Character(text)) => Some(text.clone()),
                    _ => None,
                },
                repeat: false,
                window,
            });
    }
}

// Current1401c4ef2..1401c4fae sends a Right mouse press/release on West/X.
// Real menu consumers own the secondary action (including talent refunds and
// Armory equipment); the focus adapter must not substitute a Reroll button.
fn pulse_secondary(world: &mut World, state: &mut DeviceState, window: Entity) {
    state.synthetic_input = true;
    for state in [ButtonState::Pressed, ButtonState::Released] {
        world
            .resource_mut::<Messages<MouseButtonInput>>()
            .write(MouseButtonInput {
                button: MouseButton::Right,
                state,
                window,
            });
    }
}
