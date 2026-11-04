//! Local player pose for the embedding's Lua API, sampled on the world frame.

use std::cell::Cell;

use benilla_assets::coords::{bevy_to_wow, wow_to_bevy};
use benilla_ui::{mlua, script::UiScript};
use benilla_world::world_map::CurrentMap;
use bevy::prelude::*;

use crate::{
    client_state::ClientState,
    loading_screen::LoadingScreen,
    net::PendingTransfer,
    player::{MoverLock, Player},
};

#[derive(Clone, Copy)]
enum Sample {
    NoWorld,
    NoPlayer,
    NotReady,
    Ready {
        map: u32,
        position: [f32; 3],
        facing: f32,
        frame: u64,
    },
}

pub(crate) fn world_position(script: &UiScript) -> Option<Vec3> {
    let sample = script.lua().app_data_ref::<Cell<Sample>>()?;
    match sample.get() {
        Sample::Ready { position, .. } => Some(wow_to_bevy(position)),
        _ => None,
    }
}

pub(crate) fn install_lua(script: &UiScript) -> mlua::Result<()> {
    let lua = script.lua();
    let _ = lua.set_app_data(Cell::new(Sample::NotReady));
    let getter = lua.create_function(|lua, ()| {
        let sample = lua
            .app_data_ref::<Cell<Sample>>()
            .map_or(Sample::NotReady, |sample| sample.get());
        match sample {
            Sample::NoWorld => lua.pack_multi("NO_WORLD"),
            Sample::NoPlayer => lua.pack_multi("NO_PLAYER"),
            Sample::NotReady => lua.pack_multi("NOT_READY"),
            Sample::Ready {
                map,
                position: [x, y, z],
                facing,
                frame,
            } => lua.pack_multi(("ok", map, x, y, z, facing, frame as f64)),
        }
    })?;
    lua.globals().set("AZS_NativePlayerSample", getter)
}

pub(super) fn sample_frame(
    script: Option<NonSend<UiScript>>,
    state: Option<Res<State<ClientState>>>,
    player: Option<Res<Player>>,
    mover: Option<Res<MoverLock>>,
    map: Option<Res<CurrentMap>>,
    loading: Option<Res<LoadingScreen>>,
    transfer: Option<Res<PendingTransfer>>,
    mut frame: Local<u64>,
) {
    let Some(script) = script else { return };
    let Some(sample) = script.lua().app_data_ref::<Cell<Sample>>() else {
        return;
    };
    *frame = frame.wrapping_add(1);
    sample.set(
        match (state.as_deref(), player.as_deref(), map.as_deref()) {
            (state, _, _) if state.is_none_or(|state| *state.get() != ClientState::InWorld) => {
                Sample::NoWorld
            }
            (_, player, _) if player.is_none_or(|player| !player.active) => Sample::NoPlayer,
            (_, Some(player), Some(map))
                if !mover.is_some_and(|lock| lock.foreign_mover.is_some() || lock.reseat)
                    && !loading.is_some_and(|loading| loading.hides_interface())
                    && !transfer.is_some_and(|transfer| transfer.0.is_some())
                    && !player.holds_the_frame() =>
            {
                Sample::Ready {
                    map: map.0,
                    position: bevy_to_wow(player.pos),
                    facing: player.facing().rem_euclid(std::f32::consts::TAU),
                    frame: *frame,
                }
            }
            _ => Sample::NotReady,
        },
    );
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_pose_sample_follows_on_update_and_precedes_paint() {
        let mut app = crate::game_plugins::schedule_tests::headless_client();
        assert!(crate::test_support::runs_before(
            &mut app,
            super::super::extract::tick_script,
            sample_frame,
        ));
        assert!(crate::test_support::runs_before(
            &mut app,
            sample_frame,
            super::super::extract::paint_script,
        ));
    }

    #[test]
    fn a_foreign_or_reseating_mover_cannot_supply_the_hero_pose() {
        let script = UiScript::new().unwrap();
        install_lua(&script).unwrap();
        let mut app = App::new();
        let mut player = Player::default();
        player.active = true;
        app.insert_non_send_resource(script)
            .insert_resource(State::new(ClientState::InWorld))
            .insert_resource(CurrentMap(0))
            .insert_resource(player)
            .init_resource::<MoverLock>()
            .add_systems(Update, sample_frame);
        fn sample(app: &mut App) -> Sample {
            app.update();
            app.world()
                .non_send_resource::<UiScript>()
                .lua()
                .app_data_ref::<Cell<Sample>>()
                .unwrap()
                .get()
        }

        app.world_mut().resource_mut::<MoverLock>().control_lost = true;
        assert!(matches!(
            sample(&mut app),
            Sample::Ready {
                map: 0,
                frame: 1,
                ..
            }
        ));
        app.world_mut().resource_mut::<MoverLock>().foreign_mover = Some(7);
        assert!(matches!(sample(&mut app), Sample::NotReady));
        *app.world_mut().resource_mut::<MoverLock>() = MoverLock {
            reseat: true,
            ..Default::default()
        };
        assert!(matches!(sample(&mut app), Sample::NotReady));
        app.world_mut().resource_mut::<MoverLock>().reseat = false;
        assert!(matches!(
            sample(&mut app),
            Sample::Ready {
                map: 0,
                frame: 4,
                ..
            }
        ));
    }
}
