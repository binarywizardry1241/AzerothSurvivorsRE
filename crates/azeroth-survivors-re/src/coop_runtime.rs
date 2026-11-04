//! Live direct-peer driver and the recovered AS party presentation consumers.
//! Lobby identity is deliberately kept separate from simulation snapshots.

use azeroth_survivors_re::coop::{
    game_party::{Party, class_key},
    replication::{EnginePacket, NativeMessage},
    server_party::{ClientId, LifecyclePacket},
    session::{IncomingMessage, PartyEvent, ReconnectionChange, Session},
    tcp::StartupConfig,
};
use bevy::prelude::*;

#[derive(SystemSet, Clone, Debug, PartialEq, Eq, Hash)]
pub(crate) enum CoopSet {
    Network,
    Apply,
    Flush,
}

struct EngineDispatch {
    source: u8,
    packet: EnginePacket,
    exclude_source: bool,
    localized: Vec<(ClientId, EnginePacket)>,
}

struct ValueDispatch {
    source: u8,
    value: serde_json::Value,
    localized: Vec<(ClientId, serde_json::Value)>,
}

#[derive(Resource, Default)]
pub(crate) struct CoopRuntime {
    pub party: Party,
    pub driver: Option<Session>,
    pub error: Option<String>,
    pub roster_profile: Option<azeroth_survivors_re::coop::server_party::NativeRosterProfile>,
    pub service_commands: Vec<azeroth_survivors_re::coop::session::RelayCommand>,
    /// Supplied by the actual cooperative run owner after bootstrap, never
    /// inferred from a socket, lobby row or a local solo game's dead flag.
    pub shared_running: bool,
    pub incoming: Vec<IncomingMessage>,
    pub party_events: Vec<PartyEvent>,
    pub reconnection_changes: Vec<ReconnectionChange>,
    pub world_guid: Option<u64>,
    pub actor_clients:
        std::collections::HashMap<u8, azeroth_survivors_re::coop::server_party::ClientId>,
    local_events: Vec<String>,
    pub local_admissions: Vec<(u16, [f32; 3], Option<[f32; 3]>)>,
    pub transport_lost: bool,
    /// Lobby text waits for the actual local/admitted Hero in the party owner.
    pub lobby_chat_requests: Vec<String>,
    pub(crate) begin_ready_check: bool,
    pub(crate) cancel_ready_check: bool,
    pub(crate) ready_answer: Option<bool>,
    /// Local request26 carries the actual admitted Hero GUID, never a service ID.
    pub kick_requests: Vec<u64>,
    defer_engine: bool,
    deferred_values: Vec<ValueDispatch>,
    engine_events: Vec<EngineDispatch>,
}

impl CoopRuntime {
    pub(crate) fn is_guest(&self) -> bool {
        self.driver
            .as_ref()
            .is_some_and(|driver| !driver.is_hosting() && driver.denial.is_none())
    }
    pub(crate) fn send(
        &mut self,
        client: Option<azeroth_survivors_re::coop::server_party::ClientId>,
        message: NativeMessage,
    ) -> bool {
        self.driver
            .as_mut()
            .is_some_and(|driver| driver.send_message(client, message))
    }

    /// Exact14584a6e0 ownership classification runs on real engine bytes.
    /// Return whether the local engine is also a native recipient.
    pub(crate) fn route_engine(&mut self, source: u8, packet: EnginePacket) -> bool {
        self.route_engine_localized(source, packet, Vec::new())
    }

    pub(crate) fn route_engine_localized(
        &mut self,
        source: u8,
        packet: EnginePacket,
        localized: Vec<(ClientId, EnginePacket)>,
    ) -> bool {
        let private = azeroth_survivors_re::coop::server_party::owner_only_engine_packet(
            packet.opcode,
            &packet.payload,
        );
        self.dispatch_engine(EngineDispatch { source, packet, exclude_source: false, localized });
        !private || source == 0
    }

    /// Current145c2ba80 sends an admitted movement report to every other actor,
    /// excluding its source. Keep it in the shared ordered publication queue.
    pub(crate) fn route_movement(
        &mut self,
        source: u8,
        packet: azeroth_survivors_re::coop::replication::EnginePacket,
    ) -> bool {
        self.dispatch_engine(EngineDispatch {
            source, packet, exclude_source: true, localized: Vec::new(),
        });
        source != 0
    }

    fn dispatch_engine(&mut self, dispatch: EngineDispatch) {
        if self.defer_engine {
            self.engine_events.push(dispatch);
        } else {
            self.route_clients(dispatch);
        }
    }

    fn take_local_admission(&mut self, opcode: u16, point: [f32; 3]) -> Option<[f32; 3]> {
        let index = self.local_admissions.iter().position(|(old_opcode, old, _)| *old_opcode == opcode && *old == point)?;
        self.local_admissions.remove(index).2
    }
    /// Real object registrations must precede this frame's queued movement/casts.
    pub(crate) fn route_world(
        &mut self,
        source: u8,
        packet: azeroth_survivors_re::coop::replication::EnginePacket,
    ) {
        self.route_clients(EngineDispatch {
            source, packet, exclude_source: false, localized: Vec::new(),
        });
    }

    fn route_clients(&mut self, dispatch: EngineDispatch) {
        let EngineDispatch { source, packet, exclude_source, localized } = dispatch;
        let private = azeroth_survivors_re::coop::server_party::owner_only_engine_packet(
            packet.opcode,
            &packet.payload,
        );
        if let Some(driver) = &mut self.driver {
            let recipients: Vec<_> = self
                .actor_clients
                .iter()
                .filter_map(|(slot, client)| {
                    ((if exclude_source { *slot != source } else { !private || *slot == source })
                        && driver.server.clients().iter().any(|row| {
                            row.id == *client && row.synchronized && row.closing_since.is_none()
                        }))
                    .then_some(*client)
                })
                .collect();
            for client in recipients {
                let packet = localized.iter()
                    .find_map(|(recipient, packet)| (*recipient == client).then_some(packet))
                    .unwrap_or(&packet);
                driver.send_message(Some(client), packet.clone().into_message());
            }
        }
    }
    pub(crate) fn flush_engine_events(&mut self) {
        self.defer_engine = false;
        for dispatch in std::mem::take(&mut self.engine_events) {
            self.route_clients(dispatch);
        }
        for ValueDispatch { source, value, localized } in std::mem::take(&mut self.deferred_values) {
            self.send_value_localized_from(source, &value, localized);
        }
    }
    pub(crate) fn send_value(&mut self, value: &serde_json::Value) {
        self.send_value_from(0, value);
    }
    pub(crate) fn send_value_from(&mut self, source: u8, value: &serde_json::Value) {
        self.send_value_localized_from(source, value, Vec::new());
    }
    pub(crate) fn send_value_localized_from(
        &mut self,
        source: u8,
        value: &serde_json::Value,
        localized: Vec<(ClientId, serde_json::Value)>,
    ) {
        if self.defer_engine {
            self.deferred_values.push(ValueDispatch { source, value: value.clone(), localized });
            return;
        }
        let Some(original) = native_event_text(value) else {
            return;
        };
        let forwarded = azeroth_survivors_re::coop::route::forward_to_peers(&original);
        if source != 0 {
            if let Some(text) = &forwarded {
                self.local_events.push(text.clone());
            }
        }
        if let Some(driver) = &mut self.driver {
            let recipients: Vec<_> = self
                .actor_clients
                .iter()
                .filter_map(|(slot, client)| {
                    driver
                        .server
                        .clients()
                        .iter()
                        .any(|row| {
                            row.id == *client && row.synchronized && row.closing_since.is_none()
                        })
                        .then_some((*slot, *client))
                })
                .collect();
            for (slot, client) in recipients {
                let text = if slot == source {
                    Some(original.as_str())
                } else {
                    forwarded.as_deref()
                };
                if let Some(text) = text {
                    let localized = localized.iter()
                        .find_map(|(recipient, value)| (*recipient == client).then_some(value))
                        .and_then(native_event_text);
                    let text = localized.as_deref().unwrap_or(text);
                    driver.send_message(
                        Some(client),
                        NativeMessage::Lifecycle(
                            azeroth_survivors_re::coop::server_party::LifecyclePacket::EventBytes(
                                text.as_bytes().to_vec(),
                            ),
                        ),
                    );
                }
            }
        }
    }
    /// Preserve the final decoded banner batch and transport commands across
    /// world teardown; their existing consumers run after the Apply systems.
    pub(crate) fn close_lost_driver(&mut self) {
        if let Some(driver) = &mut self.driver {
            self.local_events.extend(driver.take_events());
            driver.close();
            self.service_commands.extend(driver.take_service_commands());
        }
        self.driver = None;
    }
    pub(crate) fn take_events(&mut self) -> Vec<String> {
        let mut events = std::mem::take(&mut self.local_events);
        if let Some(driver) = &mut self.driver {
            events.extend(driver.take_events());
        }
        events
    }
}

/// Native route.rs requires type first and removes the final local occupancy
/// field from hzt. Keep those ordering requirements around the existing marker
/// values; JSON string escaping remains owned by serde_json.
fn native_event_text(value: &serde_json::Value) -> Option<String> {
    let object = value.as_object()?;
    let kind = object.get("type")?.as_str()?;
    let mut output = format!("{{\"type\":{}", serde_json::to_string(kind).ok()?);
    for (key, value) in object {
        if key == "type" || key == "in" {
            continue;
        }
        output.push(',');
        output.push_str(&serde_json::to_string(key).ok()?);
        output.push(':');
        output.push_str(&serde_json::to_string(value).ok()?);
    }
    if let Some(value) = object.get("in") {
        output.push_str(",\"in\":");
        output.push_str(&serde_json::to_string(value).ok()?);
    }
    output.push('}');
    Some(output)
}

pub(crate) struct CoopPlugin;
impl Plugin for CoopPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<CoopRuntime>()
            .configure_sets(First, (CoopSet::Network, CoopSet::Apply).chain())
            .add_systems(Startup, start)
            .add_systems(First, poll.in_set(CoopSet::Network))
            .add_systems(Last, flush.in_set(CoopSet::Flush));
    }
}

fn start(mut runtime: ResMut<CoopRuntime>, mut view: ResMut<crate::coop_ui::CoopUi>,
    seeds: Res<crate::run_seed::RunSeeds>) {
    // The local custom roster and any later cooperative session share the
    // once-process identity. An offline identity does not open a session.
    runtime.world_guid = Some(seeds.player_guid());
    let config = StartupConfig::from_env();
    if config.direct.is_none() {
        return;
    }
    match Session::open(&config) {
        Ok(driver) => {
            view.role = if driver.is_hosting() { "host" } else { "guest" }.into();
            view.status = if driver.is_hosting() { "hosting" } else { "joining" }.into();
            runtime.driver = Some(driver);
        },
        Err(error) => runtime.error = Some(error.to_string()),
    }
}

fn poll(
    mut runtime: ResMut<CoopRuntime>,
    time: Res<Time>,
    run: Res<crate::gameplay::RunSession>,
    mut menu: ResMut<crate::menu_state::MenuState>,
    locale: Res<crate::localization::Localization>,
    mut view: ResMut<crate::coop_ui::CoopUi>,
    mut wire: ResMut<benilla_app::local_client::LocalWireRequests>,
) {
    wire.observe_movement = runtime
        .driver
        .as_ref()
        .is_some_and(|driver| driver.is_hosting());
    runtime.local_admissions.clear();
    runtime.defer_engine = true;
    let runtime = &mut *runtime;
    view.bypass_change_detection().sync_chat_status();
    let chat_identity = runtime.world_guid;
    let vouch_code = view.vouch_code.clone();
    let unix_seconds = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH)
        .map_or(0, |duration| duration.as_secs());
    if let Some(driver) = &mut runtime.driver {
        driver.set_lobby_ping(run.mechanics.is_none());
        driver
            .server
            .set_run_under_way(run.started && run.mechanics.is_some());
        if driver.is_hosting() {
            driver.begin_host_tick(time.elapsed_secs_f64());
        } else {
            driver.tick(time.elapsed_secs_f64());
        }
        if driver.is_service() && !driver.is_hosting() && driver.accepted().is_some()
            && view.status == "joining" {
            view.status = "joined".into();
        }
        let messages = if driver.is_hosting() { Vec::new() } else { driver.take_messages() };
        if !driver.is_hosting() && !driver.connected() {
            // A refused handshake is a distinct native Off transition, before
            // the ordinary disconnected-host world teardown.
            if driver.denial.is_none() {
                runtime.transport_lost = true;
                view.status = "ended".into();
                view.role.clear();
                view.unavailable_reason = Some(
                    if messages.last().is_some_and(|message| matches!(
                        message.message, NativeMessage::Lifecycle(LifecyclePacket::Disconnect)
                    )) {
                        "the host closed the party"
                    } else if driver.relay_unreachable() {
                        "the co-op relay cannot be reached"
                    } else {
                        "the host left"
                    }
                    .into(),
                );
            }
        }
        if !driver.is_hosting() {
            runtime.incoming.extend(messages);
            runtime.party_events.extend(driver.take_party_events());
            runtime.reconnection_changes.extend(driver.take_reconnection_changes());
            if let Some(reconnecting) = driver.take_relay_retry_change() {
                runtime.reconnection_changes.push(ReconnectionChange::Relay(reconnecting));
            }
        }
        if let Some(reason) = &driver.denial {
            if !view.role.is_empty() { view.role.clear(); }
            let reason = String::from_utf8_lossy(reason);
            if view.status != "refused" || view.unavailable_reason.as_deref() != Some(reason.as_ref()) {
                view.receive_failure(&mut menu, "refused", reason.into_owned());
            }
        }
        // Only an actual received roster populates presentation. Its rows are
        // account identity, not remote actor positions, HP or combat state.
        if let (Some(capacity), Some(rows)) = (
            driver
                .accepted()
                .map(|row| row.capacity)
                .or_else(|| driver.is_hosting().then_some(driver.server.capacity())),
            driver.roster_snapshot().filter(|_| view.party_active()),
        ) {
            let lobby = crate::coop_ui::LobbyView {
                name: String::new(),
                capacity,
                zone: rows.zone.clone(),
                heroic_rank: rows.heroic_rank,
                heroes: rows.entries
                    .iter()
                    .enumerate()
                    .map(|(index, row)| crate::coop_ui::HeroRow {
                        hero_identity: row.hero_identity,
                        name: String::from_utf8_lossy(&row.name).into_owned(),
                        class: class_key(row.class).to_owned(),
                        class_id: row.class,
                        race: row.race,
                        achievement_points: row.achievement_points,
                        eligible: row.eligible,
                        ping_ms: row.ping_ms,
                        country: String::from_utf8_lossy(&row.country).into_owned(),
                        inspection: row.inspection.clone(),
                        host: index == 0,
                        me: chat_identity == Some(row.hero_identity),
                        staff_title: azeroth_survivors_re::coop::staff::title(
                            row, &rows.entries, vouch_code.as_deref(), unix_seconds).unwrap_or_default(),
                    })
                    .collect(),
            };
            if view.lobby.as_ref() != Some(&lobby) {
                view.receive_lobby(lobby, &locale);
            }
        } else if !driver.is_hosting() && view.lobby.is_some() {
            view.lobby = None;
        }
        view.bypass_change_detection().sync_chat_status();
        if let Some(identity) = chat_identity {
            for snapshot in driver.take_ready_checks() {
                view.receive_ready_check(snapshot, identity, time.elapsed_secs(), &locale);
            }
            for row in driver.take_lobby_chat() {
                view.bypass_change_detection().receive_chat(row, identity);
            }
        }
    } else if view.ready_check.is_some() {
        view.ready_check = None;
    }
    if let Some(error) = &runtime.error {
        if view.status != "unavailable" { view.status = "unavailable".into(); }
        if view.unavailable_reason.as_ref() != Some(error) {
            view.unavailable_reason = Some(error.clone());
        }
    }
    // The actual gameplay owner publishes admitted hero snapshots after its
    // shared-world tick. Transport/roster presence never fabricates that state.
    if run.mechanics.is_none() && !runtime.is_guest() {
        runtime.party.clear();
        runtime.shared_running = false;
    }
}

fn flush(
    mut runtime: ResMut<CoopRuntime>,
    time: Res<Time>,
    mut wire: ResMut<benilla_app::local_client::LocalWireRequests>,
) {
    let packets = std::mem::take(&mut wire.packets);
    if runtime.is_guest() {
        for (opcode, mut payload) in packets {
            if opcode == benilla_protocol::messages::opcode::MSG_MOVE_TELEPORT_ACK {
                let Some(packed) = azeroth_survivors_re::coop::engine_packets::pack_teleport_ack(&payload) else {
                    continue;
                };
                payload = packed;
            }
            runtime.send(
                None,
                azeroth_survivors_re::coop::replication::EnginePacket { opcode, payload }
                    .into_message(),
            );
        }
    } else if let Some(guid) = runtime.world_guid
        .filter(|_| runtime.driver.as_ref().is_some_and(|driver| driver.is_hosting())) {
        for (opcode, payload) in packets {
            let Ok(info) = benilla_protocol::messages::parse_movement_info(&payload) else {
                continue;
            };
            let original = [info.position.x, info.position.y, info.position.z];
            let Some(point) = runtime.take_local_admission(opcode, original) else {
                continue;
            };
            if point != original { continue; }
            let bytes = guid.to_le_bytes();
            let mut body = vec![
                bytes
                    .iter()
                    .enumerate()
                    .fold(0, |mask, (i, b)| mask | u8::from(*b != 0) << i),
            ];
            body.extend(bytes.into_iter().filter(|byte| *byte != 0));
            body.extend(payload);
            runtime.route_movement(
                0,
                azeroth_survivors_re::coop::replication::EnginePacket {
                    opcode,
                    payload: body,
                },
            );
        }
    }
    if let Some(driver) = &mut runtime.driver {
        driver.flush(time.elapsed_secs_f64());
    }
}

#[cfg(test)]
mod correction_admission_tests {
    use super::*;

    #[test]
    fn repeated_pose_consumes_its_own_admission_including_a_rejected_record() {
        let p = [1., 2., 3.];
        let q = [4., 5., 6.];
        let mut runtime = CoopRuntime::default();
        runtime.local_admissions = vec![(0xb5, p, Some(p)), (0xb5, q, None), (0xb5, p, None)];
        assert_eq!(runtime.take_local_admission(0xb5, p), Some(p));
        assert_eq!(runtime.take_local_admission(0xb7, p), None);
        assert_eq!(runtime.take_local_admission(0xb5, q), None);
        assert_eq!(runtime.take_local_admission(0xb5, p), None);
        assert!(runtime.local_admissions.is_empty());
    }

    #[test]
    fn movement_and_owner_events_keep_one_deferred_publication_order() {
        let mut runtime = CoopRuntime::default();
        runtime.defer_engine = true;
        assert!(runtime.route_movement(2, EnginePacket { opcode: 0xb5, payload: vec![] }));
        assert!(!runtime.route_engine(2, EnginePacket { opcode: 0xc7, payload: vec![] }));
        let translated = EnginePacket { opcode: 0x96, payload: vec![0x5a, 2] };
        assert!(runtime.route_engine_localized(
            0, EnginePacket { opcode: 0x96, payload: vec![0x5a, 1] },
            vec![(ClientId(7), translated.clone())],
        ));
        assert!(!runtime.route_movement(0, EnginePacket { opcode: 0xb7, payload: vec![] }));
        let routes: Vec<_> = runtime.engine_events.iter()
            .map(|dispatch| (dispatch.source, dispatch.packet.opcode, dispatch.exclude_source))
            .collect();
        assert_eq!(routes, vec![(2, 0xb5, true), (2, 0xc7, false), (0, 0x96, false), (0, 0xb7, true)]);
        assert_eq!(runtime.engine_events[2].localized, vec![(ClientId(7), translated)]);
    }
}
