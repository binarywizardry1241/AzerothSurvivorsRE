//! Selected 0.109.0 pause actions14028b370 / panel14028bce0 / children1402082f0.
//! The 0.112.5 Escape producer/consumer is recovered separately: the native
//! custom-menu request precedes Lua bindings, with custom-screen priority.

use benilla_app::local_client::{LocalClientInput, SessionRequest};
use bevy::prelude::*;

use super::super::RunSession;
use crate::{
    assets::MenuArt, localization::Localization, menu_state::MenuState, options::OptionsState,
};

#[derive(Resource, Default)]
pub(crate) struct Pause {
    pub open: bool,
    options: bool,
    confirmation: Option<f32>,
}

impl Pause {
    pub fn paused(&self, options: &OptionsState) -> bool {
        self.open || self.options && options.open
    }
}

#[derive(Component, Clone)]
pub(super) struct Root;

#[derive(Component, Clone, Copy)]
pub(super) enum Action {
    Resume,
    Options,
    EndRun,
    Quit,
}

/// Only the End Run row owns native Confirm. An early repeat does not extend
/// the first press's deadline; an expired repeat starts a fresh three seconds.
fn confirmed(at: &mut Option<f32>, now: f32) -> bool {
    match *at {
        Some(start) if now - start >= 0.35 && now - start < 3. => {
            *at = None;
            true
        }
        Some(start) if now - start < 0.35 => false,
        _ => {
            *at = Some(now);
            false
        }
    }
}

pub(super) fn input(
    mut state: ResMut<Pause>,
    menu: Res<MenuState>,
    mut session: ResMut<RunSession>,
    mut native: ResMut<LocalClientInput>,
    mut options: ResMut<OptionsState>,
    time: Res<Time>,
    floor: Res<super::super::world::NativeFloor>,
    clicks: Query<(&Interaction, &Action), Changed<Interaction>>,
    mut exit: MessageWriter<AppExit>,
    coop: Option<Res<crate::coop_runtime::CoopRuntime>>,
    mut coop_ui: ResMut<crate::coop_ui::CoopUi>,
    choice: Res<super::super::ChoicePresentation>,
) {
    if !menu.in_run || session.mechanics.is_none() {
        *state = Pause::default();
        return;
    }
    // The amulet modal owns the shared Escape request while it is pending.
    // Leave it available for the later confirmation handler in this pass.
    if choice.confirming.is_some() {
        return;
    }
    let options_were_open = state.options;
    if state.options && !options.open {
        state.options = false;
    }
    // The current native consumer takes the request once. Options has already
    // handled its close/capture branch; the talent viewer precedes pause.
    let requested = std::mem::take(&mut native.custom_game_menu_requested)
        && !native.keyboard_captured;
    // Native resumes an existing pause before checking absent choice/reward
    // payloads for a new pause. Both offers use the live choices vector here.
    if requested && !options.open && !options_were_open {
        if session.talent_view_open {
            session.talent_view_open = false;
            session.talent_view_selected = None;
        } else if state.open {
            state.open = false;
        } else if !session.mechanics.as_ref().unwrap().is_paused_for_choice() {
            state.open = true;
        }
        state.confirmation = None;
    }
    if !state.open {
        return;
    }
    let now = time.elapsed_secs();
    if state.confirmation.is_some_and(|at| now - at >= 3.) {
        state.confirmation = None;
    }
    for (interaction, action) in &clicks {
        if *interaction != Interaction::Pressed {
            continue;
        }
        match action {
            Action::Resume => {
                state.open = false;
                state.confirmation = None;
            }
            Action::Options => {
                state.open = false;
                state.options = true;
                options.open = true;
            }
            Action::Quit => {
                exit.write(AppExit::Success);
            }
            Action::EndRun => {
                let terminal = session
                    .mechanics
                    .as_ref()
                    .is_some_and(|game| game.dead || game.completed);
                if !session.started || terminal {
                    state.open = false;
                    native.session_requests.push(SessionRequest::Logout);
                } else if confirmed(&mut state.confirmation, now) {
                    if coop.as_deref().is_some_and(|runtime| runtime.is_guest()) {
                        coop_ui.request_leave_run();
                    } else {
                        session.mechanics.as_mut().unwrap().abandon(|xy| floor.terrain_ref().and_then(|terrain| terrain.height(xy)));
                        session.ended_by_player = true;
                    }
                    state.open = false;
                }
            }
        }
    }
}

pub(super) fn sync(
    mut commands: Commands,
    state: Res<Pause>,
    session: Res<RunSession>,
    art: Res<MenuArt>,
    locale: Res<Localization>,
    roots: Query<Entity, With<Root>>,
    mut previous: Local<Option<String>>,
) {
    let stamp = state.open.then(|| {
        format!(
            "{}:{}:{}:{}:{}",
            session.identity,
            session.started,
            session
                .mechanics
                .as_ref()
                .is_some_and(|game| game.dead || game.completed),
            state.confirmation.is_some(),
            locale.code()
        )
    });
    if *previous == stamp && !art.is_changed() {
        return;
    }
    *previous = stamp;
    for root in &roots {
        commands.entity(root).despawn();
    }
    if !state.open {
        return;
    }
    let terminal = session
        .mechanics
        .as_ref()
        .is_some_and(|game| game.dead || game.completed);
    let end_key = if !session.started || terminal {
        "menu.character_select"
    } else if state.confirmation.is_some() {
        "menu.confirm"
    } else {
        "menu.end_run"
    };
    // The native unstarted-run request opens the pregame menu state; it shares
    // this shell, but uses Back/Main Menu rather than Resume/Paused.
    let (title, back, hint) = if session.started {
        ("menu.paused", "menu.resume", "menu.escape_resume")
    } else {
        ("picker.menu", "menu.back", "menu.escape_back")
    };
    let rows = [
        (locale.label(back).to_owned(), Action::Resume),
        (locale.label("picker.options").to_owned(), Action::Options),
        (locale.label(end_key).to_owned(), Action::EndRun),
        (locale.label("menu.quit").to_owned(), Action::Quit),
    ];
    crate::menu_overlay::spawn(
        &mut commands,
        Root,
        &art,
        locale.label(title),
        locale.label(hint),
        &rows,
        6400,
    );
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn confirmation_requires_the_original_press_window() {
        let mut at = None;
        assert!(!confirmed(&mut at, 10.));
        assert!(!confirmed(&mut at, 10.1));
        assert_eq!(at, Some(10.));
        assert!(confirmed(&mut at, 10.5));
        assert!(!confirmed(&mut at, 20.));
        assert!(!confirmed(&mut at, 23.));
        assert_eq!(at, Some(23.));
        assert!(confirmed(&mut at, 23.5));
    }
}
