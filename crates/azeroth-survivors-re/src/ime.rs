//! Custom-screen and FrameXML input-method window publication.
//! The current commit forwarder publishes to both keyboard message streams.
use bevy::{
    ecs::message::MessageCursor,
    input::{keyboard::{Key, KeyboardInput, NativeKeyCode}, ButtonState, InputSystems},
    prelude::*,
    window::{Ime, PrimaryWindow, WindowEvent},
};

/// A custom text field renews its focus request every frame. A missing caret
/// uses the native chat anchor; the real interface supplies its own typing flag.
#[derive(Resource, Default)]
pub(crate) struct ImeRequest {
    requested: bool,
    position: Option<Vec2>,
    previous_enabled: Option<bool>,
    previous_position: Vec2,
}

impl ImeRequest {
    pub(crate) fn request_typing(&mut self, position: Option<Vec2>) {
        self.requested = true;
        if let Some(position) = position {
            self.position = Some(position);
        }
    }
}

pub(crate) struct ImePlugin;

/// Native filter and end-of-frame publisher share the last keyboard boundary.
/// Cloning it for inspection must not consume messages or advance that boundary.
#[derive(Resource, Default)]
struct KeyboardBoundary(MessageCursor<KeyboardInput>);

impl Plugin for ImePlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<ImeRequest>()
            .init_resource::<KeyboardBoundary>()
            .add_systems(
                PreUpdate,
                (discard_process_keys, forward_commits).chain().before(InputSystems),
            )
            .add_systems(
                PostUpdate,
                (publish, snapshot_keyboard_boundary).chain().after(bevy::ui::UiSystems::Layout),
            );
    }
}

/// Native1402dd560 drains/requeues unread keyboard records only when a Process
/// record occurs. Its technical key never reaches text or action consumers.
fn discard_process_keys(
    mut messages: ResMut<Messages<KeyboardInput>>,
    boundary: Res<KeyboardBoundary>,
) {
    let mut cursor = boundary.0.clone();
    let mut unread = cursor.clone();
    if !cursor.read(&messages).any(|event| event.logical_key == Key::Process) {
        return;
    }
    let retained: Vec<_> = unread.read(&messages)
        .filter(|event| event.logical_key != Key::Process).cloned().collect();
    messages.clear();
    messages.write_batch(retained);
}

fn snapshot_keyboard_boundary(
    messages: Res<Messages<KeyboardInput>>,
    mut boundary: ResMut<KeyboardBoundary>,
) {
    boundary.0.clear(&messages);
}

/// Native1402dde10 concatenates this frame's commits, strips C0/C1 controls,
/// and publishes one logical press/release pair. This bridge consumes only
/// Commit; preedit display is a separate platform/native boundary.
fn forward_commits(
    mut ime: MessageReader<Ime>,
    windows: Query<Entity, With<PrimaryWindow>>,
    mut keyboard: MessageWriter<KeyboardInput>,
    mut window_events: MessageWriter<WindowEvent>,
) {
    let mut committed = String::new();
    for event in ime.read() {
        if let Ime::Commit { value, .. } = event {
            committed.extend(value.chars().filter(|c| !c.is_control()));
        }
    }
    if committed.is_empty() { return; }
    let Some(window) = windows.iter().next() else { return; };
    for key in commit_keys(&committed, window) {
        // The custom fields read KeyboardInput. FrameXML and its binding pass
        // read the ordered WindowEvent stream instead.
        window_events.write(WindowEvent::KeyboardInput(key.clone()));
        keyboard.write(key);
    }
}

fn commit_keys(text: &str, window: Entity) -> [KeyboardInput; 2] {
    [ButtonState::Pressed, ButtonState::Released].map(|state| KeyboardInput {
        key_code: KeyCode::Unidentified(NativeKeyCode::Unidentified),
        logical_key: Key::Character(text.into()),
        state,
        text: (state == ButtonState::Pressed).then(|| text.into()),
        repeat: false,
        window,
    })
}

fn publish(
    mut state: ResMut<ImeRequest>,
    capture: Option<Res<benilla_app::UiKeyboardCapture>>,
    mut windows: Query<&mut Window, With<PrimaryWindow>>,
) {
    let requested = state.requested;
    let enabled = requested || capture.as_ref().is_some_and(|capture| capture.is_typing());
    state.requested = false;
    if !enabled { state.position = None; }
    let Ok(mut window) = windows.single_mut() else { return };
    // Exact vector1462777d0: 2% of logical width and80% of logical height.
    let position = if requested { state.position } else { None }
        .unwrap_or(Vec2::new(window.width() * 0.02, window.height() * 0.8));
    let cached_position = if enabled { position } else { Vec2::ZERO };
    if state.previous_enabled == Some(enabled) && state.previous_position == cached_position {
        return;
    }
    if window.ime_enabled != enabled { window.ime_enabled = enabled; }
    if enabled && window.ime_position != position { window.ime_position = position; }
    state.previous_enabled = Some(enabled);
    state.previous_position = cached_position;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn commits_join_unicode_and_preserve_noncontrol_whitespace() {
        let mut app = App::new();
        app.add_message::<Ime>().add_message::<KeyboardInput>().add_message::<WindowEvent>();
        app.add_systems(Update, forward_commits);
        let window = app.world_mut().spawn(PrimaryWindow).id();
        for value in ["\t小", "米\u{85} \u{a0}é"] {
            app.world_mut().write_message(Ime::Commit { window, value: value.into() });
        }
        app.world_mut().write_message(Ime::Preedit {
            window, value: "未確定".into(), cursor: Some((0, 3)),
        });
        app.update();
        let events: Vec<_> = app.world_mut().resource_mut::<Messages<KeyboardInput>>()
            .drain().collect();
        let ordered: Vec<_> = app.world_mut().resource_mut::<Messages<WindowEvent>>()
            .drain().collect();
        assert_eq!(
            ordered,
            events.iter().cloned().map(WindowEvent::KeyboardInput).collect::<Vec<_>>(),
        );
        assert_eq!(events.len(), 2);
        for (event, state) in events.iter().zip([ButtonState::Pressed, ButtonState::Released]) {
            assert_eq!(event.logical_key, Key::Character("小米 \u{a0}é".into()));
            assert_eq!(event.key_code, KeyCode::Unidentified(NativeKeyCode::Unidentified));
            assert_eq!(event.state, state);
            assert!(!event.repeat);
            assert_eq!(event.window, window);
        }
        assert_eq!(events[0].text.as_deref(), Some("小米 \u{a0}é"));
        assert_eq!(events[1].text, None);
    }

    #[test]
    fn technical_process_key_is_removed_before_committed_text_is_published() {
        let mut app = App::new();
        app.add_message::<Ime>().add_message::<KeyboardInput>().add_message::<WindowEvent>();
        app.init_resource::<KeyboardBoundary>();
        app.add_systems(Update, (discard_process_keys, forward_commits).chain());
        app.add_systems(PostUpdate, snapshot_keyboard_boundary);
        let window = app.world_mut().spawn(PrimaryWindow).id();
        let mut process = commit_keys("", window)[0].clone();
        process.logical_key = Key::Process;
        app.world_mut().write_message(process);
        app.world_mut().write_message(Ime::Commit { window, value: "안녕".into() });
        app.update();
        let events: Vec<_> = app.world_mut().resource_mut::<Messages<KeyboardInput>>()
            .drain().collect();
        assert_eq!(events.len(), 2);
        assert!(events.iter().all(|event| event.logical_key == Key::Character("안녕".into())));
    }

    #[test]
    fn a_later_process_key_does_not_republish_the_previous_commit() {
        let mut app = App::new();
        app.add_message::<Ime>().add_message::<KeyboardInput>().add_message::<WindowEvent>();
        app.init_resource::<KeyboardBoundary>();
        app.add_systems(Update, (discard_process_keys, forward_commits).chain());
        app.add_systems(PostUpdate, snapshot_keyboard_boundary);
        let window = app.world_mut().spawn(PrimaryWindow).id();
        app.world_mut().write_message(Ime::Commit { window, value: "小米".into() });
        app.update();
        let mut process = commit_keys("", window)[0].clone();
        process.logical_key = Key::Process;
        app.world_mut().write_message(process);
        app.world_mut().write_message(Ime::Commit { window, value: "安".into() });
        app.update();
        let events: Vec<_> = app.world_mut().resource_mut::<Messages<KeyboardInput>>()
            .drain().collect();
        assert_eq!(events.len(), 2);
        assert!(events.iter().all(|event| event.logical_key == Key::Character("安".into())));
    }
}
