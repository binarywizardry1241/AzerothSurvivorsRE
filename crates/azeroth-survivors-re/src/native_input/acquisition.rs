//! Current Windows backend selection and XInput producer. See input-0.109.0.md.
//!
//! Other platforms retain the existing Bevy device backend. They cannot claim
//! Windows slot/driver equivalence from this adapter.
use bevy::{app::PluginGroupBuilder, prelude::*};

pub(super) fn plugins(plugins: PluginGroupBuilder) -> PluginGroupBuilder {
    #[cfg(target_os = "windows")]
    if windows::selected() != windows::Backend::Gilrs {
        return plugins.disable::<bevy::gilrs::GilrsPlugin>();
    }
    plugins
}

pub(super) fn register(app: &mut App) {
    #[cfg(target_os = "windows")]
    windows::register(app);
    #[cfg(not(target_os = "windows"))]
    let _ = app;
}

#[cfg(target_os = "windows")]
mod windows {
    use bevy::{
        input::{gamepad::*, InputSystems},
        prelude::*,
    };
    use std::{ffi::c_void, sync::OnceLock};

    #[derive(Clone, Copy, PartialEq, Eq)]
    pub(super) enum Backend {
        Gilrs,
        XInput,
        Off,
    }

    pub(super) fn selected() -> Backend {
        static BACKEND: OnceLock<Backend> = OnceLock::new();
        *BACKEND.get_or_init(|| match std::env::var("WOW_PAD").as_deref() {
            Ok("xinput") => Backend::XInput,
            Ok("gilrs" | "wgi") => Backend::Gilrs,
            Ok("off") => Backend::Off,
            _ => {
                // Current140367ba0 checks the exported symbol, without calling it.
                let wine = unsafe {
                    let module = GetModuleHandleA(c"ntdll.dll".as_ptr().cast());
                    !module.is_null()
                        && !GetProcAddress(module, c"wine_get_version".as_ptr().cast()).is_null()
                };
                if wine {
                    Backend::XInput
                } else {
                    Backend::Gilrs
                }
            }
        })
    }

    #[repr(C)]
    #[derive(Clone, Copy, Default, PartialEq, Eq)]
    struct Sample {
        buttons: u16,
        left_trigger: u8,
        right_trigger: u8,
        left_x: i16,
        left_y: i16,
        right_x: i16,
        right_y: i16,
    }

    #[repr(C)]
    #[derive(Default)]
    struct State {
        packet: u32,
        sample: Sample,
    }

    type GetState = unsafe extern "system" fn(u32, *mut State) -> u32;

    #[link(name = "kernel32")]
    extern "system" {
        fn LoadLibraryA(name: *const u8) -> *mut c_void;
        fn GetModuleHandleA(name: *const u8) -> *mut c_void;
        fn GetProcAddress(module: *mut c_void, name: *const u8) -> *mut c_void;
    }

    #[derive(Resource)]
    struct Acquisition {
        get_state: GetState,
        slots: [Option<(Entity, Sample)>; 4],
        next_probe: f32,
    }

    pub(super) fn register(app: &mut App) {
        if selected() != Backend::XInput {
            return;
        }
        let mut get_state = None;
        for name in [c"xinput1_4.dll", c"xinput1_3.dll", c"xinput9_1_0.dll"] {
            // The selected target retains the loaded module for the process.
            // Only the exact XInputGetState ABI is called through this pointer.
            unsafe {
                let module = LoadLibraryA(name.as_ptr().cast());
                if !module.is_null() {
                    let symbol = GetProcAddress(module, c"XInputGetState".as_ptr().cast());
                    if !symbol.is_null() {
                        get_state = Some(std::mem::transmute::<*mut c_void, GetState>(symbol));
                        break;
                    }
                }
            }
        }
        let Some(get_state) = get_state else {
            warn!("pad: no XInput on this system, gamepads off");
            return;
        };
        app.insert_resource(Acquisition {
            get_state,
            slots: [None; 4],
            next_probe: 0.,
        })
        .add_systems(PreUpdate, poll.before(InputSystems));
    }

    // Current145dfd788 table, including the last two inline literal entries.
    const BUTTONS: [(u16, GamepadButton); 14] = [
        (0x0001, GamepadButton::DPadUp),
        (0x0002, GamepadButton::DPadDown),
        (0x0004, GamepadButton::DPadLeft),
        (0x0008, GamepadButton::DPadRight),
        (0x0010, GamepadButton::Start),
        (0x0020, GamepadButton::Select),
        (0x0040, GamepadButton::LeftThumb),
        (0x0080, GamepadButton::RightThumb),
        (0x0100, GamepadButton::LeftTrigger),
        (0x0200, GamepadButton::RightTrigger),
        (0x1000, GamepadButton::South),
        (0x2000, GamepadButton::East),
        (0x4000, GamepadButton::West),
        (0x8000, GamepadButton::North),
    ];

    fn poll(
        mut commands: Commands,
        time: Res<Time>,
        mut acquisition: ResMut<Acquisition>,
        mut raw: MessageWriter<RawGamepadEvent>,
        mut connections: MessageWriter<GamepadConnectionEvent>,
        mut buttons: MessageWriter<RawGamepadButtonChangedEvent>,
        mut axes: MessageWriter<RawGamepadAxisChangedEvent>,
    ) {
        let now = time.elapsed_secs();
        let probe = now >= acquisition.next_probe;
        if probe {
            acquisition.next_probe = now + 2.;
        }
        for slot in 0..4 {
            let previous = acquisition.slots[slot];
            if previous.is_none() && !probe {
                continue;
            }
            let mut state = State::default();
            // A packet-number change alone never generates value events.
            let success = unsafe { (acquisition.get_state)(slot as u32, &mut state) == 0 };
            if !success {
                if let Some((entity, _)) = acquisition.slots[slot].take() {
                    let event =
                        GamepadConnectionEvent::new(entity, GamepadConnection::Disconnected);
                    raw.write(event.clone().into());
                    connections.write(event);
                }
                continue;
            }
            let entity = if let Some((entity, _)) = previous {
                entity
            } else {
                // Reconnection allocates a new entity. Disconnected entities
                // retain the ordinary Bevy connection system's lifetime.
                let entity = commands.spawn_empty().id();
                let event = GamepadConnectionEvent::new(
                    entity,
                    GamepadConnection::Connected {
                        name: format!("XInput Controller {}", slot + 1),
                        vendor_id: None,
                        product_id: None,
                    },
                );
                raw.write(event.clone().into());
                connections.write(event);
                entity
            };
            let sample = state.sample;
            let old = previous.map(|(_, value)| value);
            acquisition.slots[slot] = Some((entity, sample));
            if old == Some(sample) {
                continue;
            }
            for (mask, button) in BUTTONS {
                if old.is_none_or(|old| (old.buttons ^ sample.buttons) & mask != 0) {
                    let value = if sample.buttons & mask != 0 { 1. } else { 0. };
                    let event = RawGamepadButtonChangedEvent::new(entity, button, value);
                    raw.write(event.clone().into());
                    buttons.write(event);
                }
            }
            for (button, value, old_value) in [
                (
                    GamepadButton::LeftTrigger2,
                    sample.left_trigger,
                    old.map(|s| s.left_trigger),
                ),
                (
                    GamepadButton::RightTrigger2,
                    sample.right_trigger,
                    old.map(|s| s.right_trigger),
                ),
            ] {
                if old_value != Some(value) {
                    let event =
                        RawGamepadButtonChangedEvent::new(entity, button, f32::from(value) / 255.);
                    raw.write(event.clone().into());
                    buttons.write(event);
                }
            }
            for (axis, value, old_value) in [
                (
                    GamepadAxis::LeftStickX,
                    sample.left_x,
                    old.map(|s| s.left_x),
                ),
                (
                    GamepadAxis::LeftStickY,
                    sample.left_y,
                    old.map(|s| s.left_y),
                ),
                (
                    GamepadAxis::RightStickX,
                    sample.right_x,
                    old.map(|s| s.right_x),
                ),
                (
                    GamepadAxis::RightStickY,
                    sample.right_y,
                    old.map(|s| s.right_y),
                ),
            ] {
                if old_value != Some(value) {
                    let event = RawGamepadAxisChangedEvent::new(
                        entity,
                        axis,
                        (f32::from(value) / 32767.).clamp(-1., 1.),
                    );
                    raw.write(event.clone().into());
                    axes.write(event);
                }
            }
        }
    }
}
