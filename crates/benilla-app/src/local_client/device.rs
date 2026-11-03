//! Semantic device input for an offline embedding, consumed by the ordinary
//! controller and binding VM. The host owns device selection and UI admission.
use bevy::prelude::*;

#[derive(Resource, Default)]
pub struct LocalDeviceInput {
    /// Camera-relative direction, radians: zero forward, positive right.
    pub movement: Option<f32>,
    /// This frame's orbit yaw/pitch deltas in the controller's convention.
    pub look: Vec2,
    /// This frame's distance delta, positive outwards.
    pub zoom: f32,
    /// Commands run through the real Bindings.xml/Lua body, down then up.
    pub commands: Vec<String>,
    /// One frame's logical menu/back request, independent of keyboard bindings.
    pub menu_requested: bool,
    pub touch: Option<LocalTouchPointer>,
    pub jump_held: bool,
    jump_was_held: bool,
}

impl LocalDeviceInput {
    pub(crate) fn take_commands(&mut self) -> Vec<(String, bool)> {
        let mut commands = Vec::new();
        if self.jump_held != self.jump_was_held {
            commands.push(("JUMP".into(), self.jump_held));
            self.jump_was_held = self.jump_held;
        }
        for command in std::mem::take(&mut self.commands) {
            commands.push((command.clone(), true));
            commands.push((command, false));
        }
        commands
    }
}

#[derive(Clone, Copy, Debug)]
pub struct LocalTouchPointer {
    pub position: Vec2,
    pub pressed: bool,
    pub released: bool,
    pub canceled: bool,
}

/// Hit the actual laid-out FrameXML tree; a world-frame hit remains gameplay.
pub fn touch_over_interface(world: &World, size: Vec2, point: Vec2) -> bool {
    let Some(script) = world.get_non_send_resource::<benilla_ui::script::UiScript>() else {
        return false;
    };
    let widescreen = world.get_resource::<crate::video::Widescreen>();
    let screen = crate::ui_script::UiScreen::of(size, widescreen.is_none_or(|mode| mode.0));
    let point = crate::ui_script::window_to_ui(screen, point);
    script
        .hit_test(point.x, point.y)
        .is_some_and(|id| !script.is_world_frame(id))
}

pub fn device_cvar<'a>(world: &'a World, name: &str) -> Option<&'a str> {
    world.get_resource::<crate::cvars::Cvars>()?.get(name)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn a_hold_runs_jump_binding_on_edges_and_release_survives_suppression() {
        let mut input = LocalDeviceInput::default();
        input.jump_held = true;
        assert_eq!(input.take_commands(), vec![("JUMP".into(), true)]);
        assert!(input.take_commands().is_empty());
        input.jump_held = false;
        assert_eq!(input.take_commands(), vec![("JUMP".into(), false)]);
        input.jump_held = true;
        assert_eq!(input.take_commands(), vec![("JUMP".into(), true)]);
    }
    #[test]
    fn one_shots_keep_their_order_and_complete_the_up_half() {
        let mut input = LocalDeviceInput::default();
        input.commands.push("TOGGLECHARACTER0".into());
        assert_eq!(
            input.take_commands(),
            vec![
                ("TOGGLECHARACTER0".into(), true),
                ("TOGGLECHARACTER0".into(), false)
            ]
        );
        assert!(input.take_commands().is_empty());
    }
}
