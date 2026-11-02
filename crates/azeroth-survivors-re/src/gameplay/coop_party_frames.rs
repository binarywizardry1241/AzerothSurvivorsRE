//! Current party status uses ordinary GroupList packets at its native owners.
use super::*;
use azeroth_survivors_re::coop::party_frames::{Client, Member, packet};

pub(super) fn install(app: &mut App) {
    app.add_systems(
        Update,
        solo_initial
            .after(RunSet::Input)
            .after(super::bootstrap)
            .before(benilla_app::local_client::events::LocalPresentationDispatch),
    );
}

/// Offline Begin has no network profile/bootstrap owner. It still publishes
/// the same actor-zero empty list once the actual local world is ready.
fn solo_initial(
    run: Res<RunSession>,
    world: Res<ZoneWorld>,
    runtime: Res<CoopRuntime>,
    mut state: ResMut<CoopGame>,
    mut wire: ResMut<LocalWireEvents>,
) {
    if runtime.driver.is_some() || !world.ready || state.initial_list_identity == Some(run.identity)
    {
        return;
    }
    let Some(game) = run
        .mechanics
        .as_ref()
        .filter(|game| !game.is_party_replica())
    else {
        return;
    };
    initial(&runtime, game, &mut wire);
    state.initial_list_identity = Some(run.identity);
}

fn members(game: &Mechanics, clients: &[Client]) -> Vec<Member> {
    game.party_snapshot()
        .heroes
        .iter()
        .filter(|hero| !hero.finished)
        .filter_map(|hero| {
            let slot = hero.slot as u8;
            let guid = game.party_guid(slot)?;
            let online = slot == 0
                || clients
                    .iter()
                    .find(|client| client.world_hero == Some(guid))
                    .is_some_and(|client| !client.reconnecting);
            Some(Member {
                slot,
                guid,
                name: hero.name.clone(),
                online,
            })
        })
        .collect()
}

/// Begin builds actor zero after all contexts exist, before remote connection
/// rows are assigned. Use that real assignment/cache view, including defaults.
pub(super) fn initial(runtime: &CoopRuntime, game: &Mechanics, wire: &mut LocalWireEvents) {
    let clients = runtime
        .driver
        .as_ref()
        .map(|driver| driver.party_frame_clients())
        .unwrap_or_default();
    let packet = packet(&members(game, &clients), 0, game.party_guid(0).unwrap_or(0));
    wire.0.push((packet.opcode, packet.payload));
}

/// Call once at each recovered owner: completed world synchronization, actual
/// connection-row retirement, or a nonempty sampled host reconnection batch.
/// No byte deduplication or revision coalescing suppresses these occurrences.
/// Game's cooperative flag is enabled by remote admission and survives departure.
pub(super) fn fanout(
    runtime: &mut CoopRuntime,
    game: &Mechanics,
    local_active: bool,
    presentation: &mut LocalPresentationEvents,
) {
    let Some(driver) = runtime.driver.as_ref() else {
        return;
    };
    let clients = driver.party_frame_clients();
    fanout_with_clients(runtime, game, local_active, presentation, &clients);
}

pub(super) fn fanout_with_clients(
    runtime: &mut CoopRuntime,
    game: &Mechanics,
    local_active: bool,
    presentation: &mut LocalPresentationEvents,
    clients: &[Client],
) {
    if !game.has_party() {
        return;
    }
    let Some(_) = runtime.driver.as_ref().filter(|driver| driver.is_hosting()) else {
        return;
    };
    let members = members(game, clients);
    let recipients: Vec<_> = game
        .party_members()
        .into_iter()
        .filter_map(|(slot, guid)| {
            if slot == 0 {
                local_active.then_some((slot, None))
            } else {
                clients
                    .iter()
                    .find(|client| client.world_hero == Some(guid) && client.synchronized)
                    .map(|client| (slot, Some(client.id)))
            }
        })
        .collect();
    for (slot, client) in recipients {
        let packet = packet(&members, slot, game.party_guid(0).unwrap_or(0));
        if let Some(client) = client {
            runtime.send(Some(client), packet.into_message());
        } else if let Ok(events) = packet.decode_server() {
            presentation.0.extend(events);
        }
    }
}
