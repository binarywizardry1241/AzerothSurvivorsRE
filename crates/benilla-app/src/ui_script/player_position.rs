//! Local player pose for the embedding's Lua API, sampled on the world frame.

use std::cell::Cell;

use benilla_assets::coords::bevy_to_wow;
use benilla_ui::{mlua, script::UiScript};
use benilla_world::world_map::CurrentMap;
use bevy::prelude::*;

use crate::{
    client_state::ClientState, loading_screen::LoadingScreen, net::PendingTransfer, player::Player,
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
    sample.set(match (state.as_deref(), player.as_deref(), map.as_deref()) {
        (state, _, _) if state.is_none_or(|state| *state.get() != ClientState::InWorld) => {
            Sample::NoWorld
        }
        (_, player, _) if player.is_none_or(|player| !player.active) => Sample::NoPlayer,
        (_, Some(player), Some(map))
            if !loading.is_some_and(|loading| loading.hides_interface())
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
    });
}
