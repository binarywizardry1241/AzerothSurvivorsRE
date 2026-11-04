//! Shared native lobby-service worker and host/code session admission.
//! Binary protocol and transport proofs: coop-forms-0.115.0.md.
use azeroth_survivors_re::coop::{
    service::{ClientMessage, LobbyProfile},
    websocket::{DirectorySocket, RttSamples, SocketEvent},
};
use bevy::prelude::*;
use std::{
    sync::{
        Arc, Mutex,
        atomic::{AtomicU8, Ordering},
        mpsc,
    },
    thread,
    time::{Duration, Instant},
};

use crate::{
    coop_runtime::{CoopRuntime, CoopSet},
    coop_ui::{CoopUi, FormRequest},
};

// The native rogue-coop worker owns blocking connection establishment. ECS
// submits bytes through its queue and consumes only received binary messages.
enum WorkerCommand {
    Send(Vec<u8>),
    Stop,
}
enum WorkerEvent {
    Connected,
    Binary(Vec<u8>),
    Closed,
}
struct Worker {
    send: mpsc::Sender<WorkerCommand>,
    receive: Mutex<mpsc::Receiver<WorkerEvent>>,
    state: Arc<AtomicU8>,
    rtt: RttSamples,
}
impl Worker {
    fn open(url: String) -> std::io::Result<Self> {
        let (send, commands) = mpsc::channel();
        let (events, receive) = mpsc::channel();
        let state = Arc::new(AtomicU8::new(0));
        let thread_state = state.clone();
        let rtt = RttSamples::default();
        let thread_rtt = rtt.clone();
        thread::Builder::new()
            .name("rogue-coop".into())
            .spawn(move || {
                let Ok(mut socket) = DirectorySocket::connect_with_rtt(&url, thread_rtt) else {
                    thread_state.store(2, Ordering::Release);
                    let _ = events.send(WorkerEvent::Closed);
                    return;
                };
                thread_state.store(1, Ordering::Release);
                let _ = events.send(WorkerEvent::Connected);
                loop {
                    loop {
                        match commands.try_recv() {
                            Ok(WorkerCommand::Send(bytes)) => socket.send_binary(bytes),
                            Ok(WorkerCommand::Stop) | Err(mpsc::TryRecvError::Disconnected) => {
                                // Native close flag precedes outbound drain.
                                // A queued Leave is not guaranteed to reach the socket.
                                socket.close();
                                thread_state.store(2, Ordering::Release);
                                return;
                            }
                            Err(mpsc::TryRecvError::Empty) => break,
                        }
                    }
                    let Ok(incoming) = socket.poll() else { break };
                    let sleep = socket.should_sleep();
                    for event in incoming {
                        match event {
                            SocketEvent::Binary(bytes) => {
                                if events.send(WorkerEvent::Binary(bytes)).is_err() {
                                    thread_state.store(2, Ordering::Release);
                                    return;
                                }
                            }
                            SocketEvent::Closed => {
                                thread_state.store(2, Ordering::Release);
                                let _ = events.send(WorkerEvent::Closed);
                                return;
                            }
                            SocketEvent::Text(_) => {} // Native service ignores Text.
                        }
                    }
                    // Native14586b283 passes (0 seconds, 1,000,000 nanoseconds).
                    if sleep {
                        thread::sleep(Duration::from_millis(1));
                    }
                }
                thread_state.store(2, Ordering::Release);
                let _ = events.send(WorkerEvent::Closed);
            })?;
        Ok(Self {
            send,
            receive: Mutex::new(receive),
            state,
            rtt,
        })
    }
    fn connected(&self) -> bool {
        self.state.load(Ordering::Acquire) == 1
    }
    fn closed(&self) -> bool {
        self.state.load(Ordering::Acquire) == 2
    }
    fn stop(&self) {
        let _ = self.send.send(WorkerCommand::Stop);
    }
    fn submit(&self, message: ClientMessage) {
        if let Ok(bytes) = message.encode() {
            let _ = self.send.send(WorkerCommand::Send(bytes));
        }
    }
    fn start_ping(&self, peer: u32) {
        let mut payload = vec![5];
        payload.extend_from_slice(&0_u64.to_le_bytes());
        self.submit(ClientMessage::Relay { peer, payload });
    }
    fn rtt_ms(&self, peer: u32) -> Option<f32> {
        self.rtt.lock().unwrap().get(&peer).copied()
    }
    fn rtt_samples(&self) -> RttSamples { self.rtt.clone() }
    fn take(&self) -> Vec<WorkerEvent> {
        self.receive
            .lock()
            .expect("co-op worker receiver")
            .try_iter()
            .collect()
    }
}
impl Drop for Worker {
    fn drop(&mut self) {
        self.stop();
    }
}

struct SecondaryConfig {
    url: String,
    alternate: Option<String>,
    auth: azeroth_survivors_re::coop::service::SecondaryAuth,
}

#[derive(Resource, Default)]
struct Service {
    relay_protocol: azeroth_survivors_re::coop::session::RelayProtocol,
    relay_peers: azeroth_survivors_re::coop::session::RelayPeers,
    guest_flags: azeroth_survivors_re::coop::session::SharedGuestFlags,
    secondary_lifetime: Option<azeroth_survivors_re::coop::relay_lifetime::SecondaryLifetime>,
    secondary_config: Option<SecondaryConfig>,
    worker: Option<Worker>,
    secondary: Option<Worker>,
    directory: azeroth_survivors_re::coop::directory::LobbyDirectory,
    last_refresh: f32,
    last_command: f64,
    last_heartbeat: Option<Instant>,
    pending_host: Option<(String, u8)>,
    pending_password: String,
    hosting: bool,
    profile: Option<LobbyProfile>,
    profile_identity: Option<(u64, String)>,
}

pub(crate) struct CoopDirectoryPlugin;
impl Plugin for CoopDirectoryPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<Service>()
            .add_systems(First, poll.before(CoopSet::Network))
            .add_systems(Last, relay.after(CoopSet::Flush));
    }
}

fn profile(
    menu: &crate::menu_state::MenuState,
    runtime: &CoopRuntime,
    capacity: u8,
) -> LobbyProfile {
    let pick = menu.backend_pick();
    let classes = runtime
        .driver
        .as_ref()
        .and_then(|driver| driver.roster())
        .map(|rows| rows.iter().map(|row| row.class).collect::<Vec<_>>())
        .filter(|rows| !rows.is_empty())
        .unwrap_or_else(|| vec![pick.hero.class]);
    LobbyProfile {
        hero: pick.name.clone(),
        class: pick.hero.class,
        zone: pick.zone.clone(),
        opened: !menu.in_run,
        classes,
        max: capacity.min(5),
        heroic_rank: pick.heroic_rank
            .min(menu.backend_save.max_heroic_rank(pick.hero.class, &pick.zone))
            .min(azeroth_survivors_re::heroic::MAX_RANK),
    }
}

impl Service {
    fn ping_worker(&self) -> Option<&Worker> {
        // The dynamic transport's presence selects it even while unready;
        // readiness never falls back to the initial directory connection.
        if let Some(worker) = &self.secondary {
            (worker.connected() && self.secondary_lifetime.as_ref()
                .is_none_or(|state| state.can_send(true))).then_some(worker)
        } else {
            self.worker.as_ref().filter(|worker| worker.connected())
        }
    }

    fn share_rtt_sources(&self) {
        use azeroth_survivors_re::coop::session::{service_rtt_sources, ServiceRttSources};
        let endpoint = |worker: &Worker| (worker.state.clone(), worker.rtt_samples());
        service_rtt_sources(&self.relay_peers, ServiceRttSources {
            primary: self.worker.as_ref().map(endpoint), secondary: self.secondary.as_ref().map(endpoint),
        });
    }
    fn ensure(&mut self, view: &mut CoopUi, now: f64) -> bool {
        if self.worker.is_some() {
            return true;
        }
        let config = azeroth_survivors_re::coop::tcp::StartupConfig::from_env();
        let Ok(worker) = Worker::open(config.lobby_url) else {
            view.status = "unavailable".into();
            view.unavailable_reason = Some("the co-op service cannot be reached".into());
            return false;
        };
        worker.submit(ClientMessage::Handshake {
            version: azeroth_survivors_re::coop::server_party::GAME_VERSION.into(),
            staff_key: staff_key(),
        });
        self.relay_protocol = Default::default();
        self.relay_peers = Default::default();
        self.guest_flags = Default::default();
        self.secondary = None;
        self.secondary_lifetime = None;
        self.secondary_config = None;
        self.worker = Some(worker);
        self.last_command = now;
        self.last_heartbeat = Some(Instant::now());
        view.status = "connecting".into();
        true
    }
    fn send(&self, message: ClientMessage) {
        if let Some(worker) = &self.worker {
            worker.submit(message);
        }
    }

    fn close(&mut self) {
        // Native terminal close writes to, then closes, the primary before
        // doing the same to the selected secondary.
        if let Some(primary) = self.worker.take() {
            primary.submit(ClientMessage::Leave);
        }
        if let Some(secondary) = self.secondary.take() {
            secondary.submit(ClientMessage::Leave);
        }
        self.secondary_lifetime = None;
        self.secondary_config = None;
    }

    fn heartbeat(&self) {
        // Current service pump145aeb92f..145aeb9ef checks each transport
        // independently. A closed lobby must not starve the selected relay.
        if let Some(worker) = self.worker.as_ref().filter(|worker| worker.connected()) {
            worker.submit(ClientMessage::Heartbeat);
        }
    }

    fn secondary_failed(&self) -> bool {
        self.secondary.is_some()
            && self.secondary_lifetime.as_ref().map_or_else(
                || self.secondary.as_ref().is_some_and(Worker::closed),
                |state| state.failed(),
            )
    }

    fn relay_connected(&self) -> bool {
        if let Some(worker) = &self.secondary {
            worker.connected()
                && self
                    .secondary_lifetime
                    .as_ref()
                    .is_none_or(|state| state.can_send(true))
        } else {
            self.worker.as_ref().is_some_and(Worker::connected)
        }
    }
}

fn poll(
    mut service: ResMut<Service>,
    mut runtime: ResMut<CoopRuntime>,
    mut view: ResMut<CoopUi>,
    mut menu: ResMut<crate::menu_state::MenuState>,
    catalog: Res<crate::catalog::MenuCatalog>,
    locale: Res<crate::localization::Localization>,
    time: Res<Time>,
    (
        mut guest,
        mut run,
        mut world,
        mut inbound,
        mut presentation,
        mut notifications,
        local,
        mut commands,
    ): (
        ResMut<crate::gameplay::GuestRun>,
        ResMut<crate::gameplay::RunSession>,
        ResMut<crate::gameplay::world::ZoneWorld>,
        ResMut<benilla_app::local_client::events::LocalWireEvents>,
        ResMut<benilla_app::local_client::events::LocalPresentationEvents>,
        ResMut<crate::gameplay::RunNotifications>,
        Res<benilla_app::local_client::LocalClientSession>,
        Commands,
    ),
) {
    use azeroth_survivors_re::coop::{
        directory_wire::{self, DirectoryResponse},
        server_party::HostConfig,
        session::Session,
    };
    let off = !runtime.is_guest()
        && !runtime
            .driver
            .as_ref()
            .is_some_and(|driver| driver.is_hosting());
    if service.worker.is_some()
        && azeroth_survivors_re::coop::directory_lifetime::idle_due(
            off,
            time.elapsed_secs_f64(),
            service.last_command,
        )
    {
        service.close();
        service.profile_identity = None;
        service.profile = None;
        runtime.roster_profile = None;
        // Native idle teardown publishes no phase/reason change and retains
        // the last directory/filter presentation snapshot.
    }
    let selected_connected = service.relay_connected();
    service
        .relay_protocol
        .lock()
        .unwrap()
        .set_connected(selected_connected);
    let mut received = service
        .worker
        .as_ref()
        .map(Worker::take)
        .unwrap_or_default()
        .into_iter()
        .map(|event| (false, event))
        .collect::<Vec<_>>();
    if let Some(secondary) = &service.secondary {
        received.extend(secondary.take().into_iter().map(|event| (true, event)));
    }
    for (from_secondary, event) in received {
        match event {
            WorkerEvent::Connected => {
                if !from_secondary && view.role.is_empty() {
                    view.status = "online".into();
                }
            }
            WorkerEvent::Closed => {
                // A secondary's closed socket first enters its native retry
                // state machine; only permanent failure tears down the party.
                if !from_secondary {
                    transport_closed(&mut service, &mut runtime, &mut view, false);
                }
            }
            WorkerEvent::Binary(bytes) => {
                if from_secondary {
                    if let Some(state) = &mut service.secondary_lifetime {
                        state.received(Instant::now());
                    }
                }
                let Some(response) = directory_wire::decode_response(&bytes) else {
                    continue;
                };
                if from_secondary {
                    let refused = matches!(response, DirectoryResponse::Text { tag: 23, .. });
                    if let Some(state) = &mut service.secondary_lifetime {
                        let forward = state.admit(refused);
                        if refused {
                            if let Some(worker) = &service.secondary {
                                worker.stop();
                            }
                        }
                        if !forward {
                            continue;
                        }
                    }
                }
                match response {
                    DirectoryResponse::Country { peer, country } => {
                        azeroth_survivors_re::coop::session::service_country(
                            &service.relay_peers, peer, &country);
                    }
                    DirectoryResponse::Lobbies(rows) => {
                        let message = directory_wire::lobbies_message(
                            &rows,
                            menu.backend_save
                                .unlock_value(menu.backend_pick().hero.class)
                                .unwrap_or(1)
                                .clamp(1, azeroth_survivors_re::zones::COUNT as u64),
                            |id| display_class(&locale, id),
                            |key| display_zone(&locale, key),
                            |key| menu.backend_save.max_heroic_rank(menu.backend_pick().hero.class, key),
                            |rank| azeroth_survivors_re::heroic::rank_name(rank,
                                locale.lookup("Normal").unwrap_or("Normal"),
                                locale.lookup("Heroic").unwrap_or("Heroic")),
                        );
                        if service.directory.accept(&message) {
                            publish_directory(&service.directory, &mut view);
                        }
                    }
                    DirectoryResponse::Text { tag: 21, text } => {
                        // Native relay receipt sends its control reply before
                        // the next service event can retire these peer rows.
                        drain_service_relay(&mut service);
                        azeroth_survivors_re::coop::session::service_country_reset(&service.relay_peers);
                        azeroth_survivors_re::coop::session::service_party_reset(
                            &service.relay_protocol,
                            &service.guest_flags,
                            false,
                        );
                        view.code = Some(text);
                        view.status = "hosting".into();
                        if menu.in_run || runtime.driver.is_some() {
                            continue;
                        }
                        let Some((password, capacity)) = service.pending_host.clone() else {
                            continue;
                        };
                        if !initialize_identity(&mut runtime) {
                            continue;
                        }
                        let mut driver = Session::service_host_with_relay(
                            HostConfig {
                                password: password.into_bytes(),
                                capacity,
                            },
                            service.relay_protocol.clone(),
                        );
                        driver.share_relay_peers(service.relay_peers.clone());
                        driver.share_guest_flags(service.guest_flags.clone());
                        runtime.driver = Some(driver);
                        service.hosting = true;
                        view.role = "host".into();
                        view.status = "hosting".into();
                        view.unavailable_reason = None;
                    }
                    DirectoryResponse::Text { tag: 22, text } => {
                        drain_service_relay(&mut service);
                        azeroth_survivors_re::coop::session::service_party_reset(
                            &service.relay_protocol,
                            &service.guest_flags,
                            true,
                        );
                        view.code = Some(text);
                        if menu.in_run || runtime.driver.is_some() {
                            continue;
                        }
                        if !initialize_identity(&mut runtime) {
                            continue;
                        }
                        let mut driver = Session::service_join_with_flags(
                            service.pending_password.as_bytes().to_vec(),
                            service.relay_protocol.clone(),
                            service.guest_flags.clone(),
                        );
                        // Native guest construction submits the protocol4
                        // handshake before the subsequent wire10 profile request.
                        for command in driver.take_service_commands() {
                            send_relay(&mut service, command);
                        }
                        runtime.driver = Some(driver);
                        service.hosting = false;
                        view.role = "guest".into();
                        view.status = "joining".into();
                        view.unavailable_reason = None;
                    }
                    DirectoryResponse::Text { tag: 23, text } => {
                        view.receive_failure(&mut menu, "denied", text);
                    }
                    DirectoryResponse::Text { tag: 27, text } => {
                        drain_service_relay(&mut service);
                        service.guest_flags.lock().unwrap().active = false;
                        view.code = None;
                        view.receive_failure(&mut menu, "closed", text);
                        runtime.roster_profile = None;
                        service.profile_identity = None;
                        service.secondary = None;
                        service.secondary_lifetime = None;
                        service.secondary_config = None;
                        azeroth_survivors_re::coop::session::service_party_ended(
                            &service.relay_protocol,
                        );
                        if let Some(driver) = &mut runtime.driver {
                            driver.service_party_closed();
                        }
                    }
                    DirectoryResponse::Number { tag: 24, value } => {
                        azeroth_survivors_re::coop::session::service_peer_open(
                            &service.relay_protocol,
                            &service.relay_peers,
                            value,
                        );
                    }
                    DirectoryResponse::Number { tag: 25, value } => {
                        // Replies produced by earlier service events have already
                        // crossed the native send boundary before this departure.
                        drain_service_relay(&mut service);
                        azeroth_survivors_re::coop::session::service_peer_departed(
                            &service.relay_protocol,
                            &service.relay_peers,
                            value,
                        );
                    }
                    DirectoryResponse::Number {
                        tag: tag @ (31 | 32),
                        value,
                    } => {
                        if value == 0 {
                            service.guest_flags.lock().unwrap().control(tag == 31);
                        } else {
                            azeroth_survivors_re::coop::session::service_peer_reconnecting(
                                &service.relay_peers,
                                value,
                                tag == 31,
                            );
                        }
                    }
                    DirectoryResponse::Bytes { value, bytes } => {
                        if value == 0 {
                            azeroth_survivors_re::coop::session::service_guest_receive(
                                &service.relay_protocol,
                                &service.guest_flags,
                                &bytes,
                            );
                        } else {
                            azeroth_survivors_re::coop::session::service_host_receive(
                                &service.relay_protocol,
                                &service.relay_peers,
                                value,
                                &bytes,
                            );
                        }
                        // Native receive submits replies before the next service
                        // event can replace or close the selected transport.
                        drain_service_relay(&mut service);
                    }
                    DirectoryResponse::Structured29 {
                        strings,
                        numbers,
                        bytes,
                    } => {
                        let [first, second, third] = strings;
                        runtime.roster_profile = Some(
                            azeroth_survivors_re::coop::server_party::NativeRosterProfile {
                                bytes_00: first.into_bytes(),
                                value_60: numbers[0],
                                bytes_18: second.into_bytes(),
                                bytes_30: third.into_bytes(),
                                value_68: numbers[1],
                                bytes_48: bytes,
                            },
                        );
                    }
                    DirectoryResponse::Structured30 {
                        strings,
                        numbers,
                        value,
                        bytes,
                    } => {
                        let [url, first, second] = strings;
                        if let Some(old) = service.secondary.take() {
                            old.submit(ClientMessage::Leave);
                            drop(old);
                        }
                        service.secondary_lifetime = None;
                        service.secondary_config = None;
                        if let Ok(worker) = Worker::open(url.clone()) {
                            let auth = azeroth_survivors_re::coop::service::SecondaryAuth {
                                text_1: first,
                                number_1: numbers[0],
                                number_2: value,
                                text_2: second,
                                number_3: numbers[1],
                                data: bytes,
                            };
                            worker.submit(ClientMessage::Authenticate(auth.clone()));
                            worker.submit(ClientMessage::Heartbeat);
                            let alternate =
                                azeroth_survivors_re::coop::relay_lifetime::alternate_endpoint(&url);
                            let fallback = alternate.is_some();
                            service.secondary_config = Some(SecondaryConfig {
                                url,
                                alternate,
                                auth,
                            });
                            service.secondary_lifetime = Some(
                                azeroth_survivors_re::coop::relay_lifetime::SecondaryLifetime::with_fallback(
                                    Instant::now(),
                                    fallback,
                                ),
                            );
                            service.secondary = Some(worker);
                        }
                    }
                    _ => {}
                }
            }
        }
    }
    poll_secondary(&mut service, &mut runtime, &mut view);
    if let Some(driver) = &mut runtime.driver {
        driver.service_relay_initial_failure(
            service.secondary_config.is_some()
                && service
                    .secondary_lifetime
                    .as_ref()
                    .is_some_and(|state| state.initial_failure()),
        );
        driver.service_relay_retrying(
            service.secondary.is_some()
                && service
                    .secondary_lifetime
                    .as_ref()
                    .is_some_and(|state| state.reconnecting()),
        );
    }
    // Native host liveness checks the retained selected secondary even when
    // its Closed event was observed while the Game was still Off.
    if runtime
        .driver
        .as_ref()
        .is_some_and(|driver| driver.is_hosting())
        && service.secondary_failed()
    {
        transport_closed(&mut service, &mut runtime, &mut view, true);
    }
    let selected_connected = service.relay_connected();
    service
        .relay_protocol
        .lock()
        .unwrap()
        .poll(selected_connected, Instant::now());
    let now = Instant::now();
    if service.worker.is_some() {
        match service.last_heartbeat {
            None => service.last_heartbeat = Some(now),
            Some(last) if last.elapsed().as_secs_f32() >= 30.0 => {
                service.heartbeat();
                service.last_heartbeat = Some(now);
            }
            _ => {}
        }
    } else if service.worker.is_none() {
        service.last_heartbeat = None;
    }
    if let Some(driver) = &runtime.driver {
        if driver.is_service()
            && !driver.is_hosting()
            && driver.accepted().is_some()
            && view.status == "joining"
        {
            view.status = "joined".into();
        }
    }
    if service.worker.is_some() && view.code.as_ref().is_some_and(|code| !code.is_empty()) {
        if let Some(guid) = runtime.world_guid.filter(|guid| *guid != 0) {
            let name = menu.backend_pick().clone().normalized().name;
            let identity = (guid, name.clone());
            if service.profile_identity.as_ref() != Some(&identity) {
                service.send(ClientMessage::ProfileRequest { guid, name });
                service.profile_identity = Some(identity);
            }
        }
    }
    if service.hosting {
        let capacity = runtime
            .driver
            .as_ref()
            .map(|driver| driver.server.capacity())
            .unwrap_or(5);
        let current = profile(&menu, &runtime, capacity);
        if service.profile.as_ref() != Some(&current) {
            service.send(ClientMessage::UpdateProfile(current.clone()));
            service.profile = Some(current);
        }
    }
    let requests = view.bypass_change_detection().take_requests();
    let explicit_refresh = requests
        .iter()
        .any(|request| matches!(request, FormRequest::Refresh));
    for request in requests {
        if service.worker.is_some() {
            service.last_command = time.elapsed_secs_f64();
        }
        match request {
            FormRequest::Kick(hero_identity) => {
                runtime.kick_requests.push(hero_identity);
            }
            FormRequest::Chat(text) => {
                if runtime.driver.is_some() {
                    runtime.lobby_chat_requests.push(text);
                }
            }
            FormRequest::Refresh => {
                service.last_refresh = time.elapsed_secs();
                if service.ensure(&mut view, time.elapsed_secs_f64()) {
                    service.send(ClientMessage::Refresh);
                }
            }
            FormRequest::Host {
                name,
                password,
                description,
                public,
                capacity,
            } => {
                // Native command12 precedes Host21, including the ordinary
                // full-Pick normalization/account/save path.
                menu.commit_pick(&catalog);
                menu.drain_backend_commands(&catalog);
                if menu.in_run || runtime.driver.is_some() {
                    continue;
                }
                if service.ensure(&mut view, time.elapsed_secs_f64()) {
                    let value = profile(&menu, &runtime, capacity);
                    service.pending_host = Some((password.clone(), capacity));
                    service.profile = Some(value.clone());
                    service.send(ClientMessage::Host {
                        name,
                        password,
                        description,
                        public,
                        profile: value,
                    });
                }
            }
            FormRequest::Join { code, password } => {
                menu.commit_pick(&catalog);
                menu.drain_backend_commands(&catalog);
                if menu.in_run || runtime.driver.is_some() {
                    continue;
                }
                if service.ensure(&mut view, time.elapsed_secs_f64()) {
                    service.pending_password.clone_from(&password);
                    service.send(ClientMessage::Join { code, password });
                }
            }
            request @ (FormRequest::Leave | FormRequest::LeaveRun) => {
                let end_run = request == FormRequest::LeaveRun;
                let was_guest = runtime.is_guest();
                if end_run && !was_guest {
                    continue;
                }
                if end_run {
                    if let Some(mut driver) = runtime.driver.take() {
                        driver.leave_guest_run(time.elapsed_secs_f64());
                        for command in driver.take_service_commands() {
                            send_relay(&mut service, command);
                        }
                    }
                    service.close();
                }
                // Both departures settle the cached run before discarding it.
                if was_guest {
                    let now = std::time::SystemTime::now()
                        .duration_since(std::time::UNIX_EPOCH)
                        .map_or(0, |duration| duration.as_secs());
                    let messages = guest.settle(
                        &mut run,
                        &mut menu,
                        &catalog,
                        Some(&locale),
                        &mut notifications,
                        now,
                        time.elapsed_secs(),
                        true,
                    );
                    guest.leave();
                    world.request = None;
                    run.mechanics = None;
                    run.started = false;
                    run.paused = false;
                    if local.active || menu.in_run {
                        menu.return_from_run();
                    }
                    crate::gameplay::queue_guest_delivery(
                        &mut commands,
                        &mut inbound,
                        &mut presentation,
                        messages,
                        local
                            .active
                            .then_some(benilla_protocol::SessionEnd::LoggedOut),
                    );
                }
                if !end_run {
                    if let Some(mut driver) = runtime.driver.take() {
                        driver.leave(time.elapsed_secs_f64(), |command| send_relay(&mut service, command));
                    }
                    service.close();
                }
                service.hosting = false;
                service.profile_identity = None;
                runtime.party.clear();
                runtime.shared_running = false;
                runtime.actor_clients.clear();
                runtime.roster_profile = None;
                view.role.clear();
                view.code = None;
                view.lobby = None;
                view.status = if end_run { "ended" } else { "off" }.into();
                if end_run {
                    view.unavailable_reason = Some("you left the run".into());
                }
            }
        }
    }
    if !explicit_refresh
        && azeroth_survivors_re::coop::directory_refresh::due(
            matches!(menu.dialog, Some(crate::menu_state::Dialog::Coop)),
            view.lists_active(),
            &view.role,
            &view.status,
            time.elapsed_secs(),
            &mut service.last_refresh,
        )
    {
        if service.worker.is_some() {
            service.last_command = time.elapsed_secs_f64();
        }
        if service.ensure(&mut view, time.elapsed_secs_f64()) {
            service.send(ClientMessage::Refresh);
        }
    }
    // Presence may change while receiving events or processing form requests.
    // Publish the selected handles before the same frame's Network/Pong pass.
    service.share_rtt_sources();
    // The vouch caller retains the service handle independently of readiness.
    let vouch_code = service.worker.as_ref().and(view.code.clone());
    if view.vouch_code != vouch_code { view.vouch_code = vouch_code; }
}

fn poll_secondary(service: &mut Service, runtime: &mut CoopRuntime, view: &mut CoopUi) {
    use azeroth_survivors_re::coop::relay_lifetime::Action;
    let Some(worker) = &service.secondary else {
        return;
    };
    let Some(lifetime) = &mut service.secondary_lifetime else {
        return;
    };
    let state = worker.state.load(Ordering::Acquire);
    match lifetime.poll(state, Instant::now()) {
        Action::None => {}
        Action::Heartbeat => worker.submit(ClientMessage::Heartbeat),
        Action::Failed => {
            worker.stop();
            transport_closed(service, runtime, view, true);
        }
        action @ (Action::Reopen | Action::Fallback) => {
            worker.stop();
            if let Some(config) = &mut service.secondary_config {
                if action == Action::Fallback {
                    if let Some(alternate) = config.alternate.take() {
                        config.url = alternate;
                    }
                }
                if let Ok(worker) = Worker::open(config.url.clone()) {
                    worker.submit(ClientMessage::Authenticate(config.auth.clone()));
                    worker.submit(ClientMessage::Heartbeat);
                    service.secondary = Some(worker);
                    lifetime.reopened(Instant::now());
                }
            }
            if action == Action::Fallback {
                azeroth_survivors_re::coop::session::service_relay_fallback(&service.relay_protocol);
            } else {
                azeroth_survivors_re::coop::session::service_relay_reset(
                    &service.relay_protocol,
                    &service.relay_peers,
                    &service.guest_flags,
                );
            }
        }
    }
}

fn transport_closed(
    service: &mut Service,
    runtime: &mut CoopRuntime,
    view: &mut CoopUi,
    secondary: bool,
) {
    let host = runtime
        .driver
        .as_ref()
        .is_some_and(|driver| driver.is_hosting());
    // Current frame145b08a00..145b08aca keeps the service wrapper and party
    // when only the primary fails. State0 (connecting) also passes the native
    // secondary !=2 predicate. Retaining the closed primary prevents an
    // invented reconnect/replacement while its selected relay still owns play.
    if !secondary
        && (host || runtime.is_guest())
        && runtime
            .driver
            .as_ref()
            .is_some_and(|driver| driver.is_service())
        && service.secondary.is_some()
        && !service.secondary_failed()
    {
        return;
    }
    // A host checks actual selected-relay loss before primary failure, even
    // when both Closed events arrive in the same poll.
    let secondary = secondary || (host && service.secondary_failed());
    if secondary && !host {
        if runtime.driver.is_none() {
            // Off mode does not inspect secondary failure. Retain its state
            // until replacement or the ordinary service lifetime teardown.
            return;
        }
        // Native guest liveness observes the selected relay, but its local
        // close still queues Leave through the surviving primary connection.
        if let Some(driver) = &mut runtime.driver {
            driver.service_peer_closed(0);
        }
    } else {
        service.worker = None;
        service.secondary = None;
        service.secondary_lifetime = None;
        service.secondary_config = None;
        if let Some(driver) = &mut runtime.driver {
            driver.service_lost();
        }
        runtime.roster_profile = None;
        service.profile_identity = None;
    }
    if host {
        service.hosting = false;
        runtime.transport_lost = true;
        view.role.clear();
        view.code = None;
        view.lobby = None;
    }
    view.status = "unavailable".into();
    view.unavailable_reason = Some(
        if secondary {
            "the co-op relay cannot be reached"
        } else {
            "the co-op service cannot be reached"
        }
        .into(),
    );
}

fn initialize_identity(runtime: &mut CoopRuntime) -> bool {
    if runtime.world_guid.is_some() {
        runtime.error = None;
        return true;
    }
    let mut seed = [0u8; 8];
    if let Err(error) = getrandom::fill(&mut seed) {
        runtime.error = Some(format!("Cannot initialize co-op identity: {error}"));
        return false;
    }
    runtime.error = None;
    runtime.world_guid = Some(
        azeroth_survivors_re::coop::server_party::native_world_identity(u64::from_le_bytes(seed)),
    );
    true
}

fn send_relay(service: &mut Service, command: azeroth_survivors_re::coop::session::RelayCommand) {
    use azeroth_survivors_re::coop::session::RelayCommand;
    match command {
        RelayCommand::TransportPing { id } => {
            if let Some(worker) = service.ping_worker() { worker.start_ping(id); }
        }
        RelayCommand::Send { id, payload } => {
            let message = ClientMessage::Relay { peer: id, payload };
            if service.secondary.is_none() {
                service.send(message.clone());
            }
            if let Some(secondary) = &service.secondary {
                secondary.submit(message);
            }
        }
        RelayCommand::Close { id } => {
            service.send(ClientMessage::Kick(id));
            let secondary = service.secondary.is_some();
            let outgoing =
                service
                    .relay_protocol
                    .lock()
                    .unwrap()
                    .close_peer(id, secondary, Instant::now());
            for (peer, payload) in outgoing {
                send_relay(service, RelayCommand::Send { id: peer, payload });
            }
            if let Some(secondary) = &service.secondary {
                secondary.submit(ClientMessage::Kick(id));
            }
        }
        command @ (RelayCommand::Leave | RelayCommand::GuestLeave) => {
            service.send(ClientMessage::Leave);
            if matches!(command, RelayCommand::GuestLeave) {
                if let Some(secondary) = &service.secondary {
                    secondary.submit(ClientMessage::Leave);
                }
            }
            service.secondary = None;
            service.secondary_lifetime = None;
            service.secondary_config = None;
        }
    }
}
fn drain_service_relay(service: &mut Service) {
    let outgoing = service.relay_protocol.lock().unwrap().take_outgoing();
    for (id, payload) in outgoing {
        send_relay(
            service,
            azeroth_survivors_re::coop::session::RelayCommand::Send { id, payload },
        );
    }
}

fn relay(
    mut service: ResMut<Service>,
    mut runtime: ResMut<CoopRuntime>,
    mut exits: MessageReader<bevy::app::AppExit>,
    time: Res<Time>,
) {
    // The native pump owns control/replay output even while the Game is Off.
    drain_service_relay(&mut service);
    for command in std::mem::take(&mut runtime.service_commands) {
        send_relay(&mut service, command);
    }
    if exits.read().next().is_some() {
        if let Some(mut driver) = runtime.driver.take() {
            driver.leave(time.elapsed_secs_f64(), |command| send_relay(&mut service, command));
        }
        service.close();
        runtime.party.clear();
        return;
    }
    let mut refused = false;
    if let Some(driver) = &mut runtime.driver {
        refused = driver.denial.is_some();
        for command in driver.take_service_commands() {
            send_relay(&mut service, command);
        }
    }
    // Network already published the native refused/Off projection. Retain its
    // queued Leave until this drain, then stop treating the rejected endpoint
    // as a guest while a later form request is being submitted.
    if refused {
        runtime.driver = None;
    }
}

fn publish_directory(
    directory: &azeroth_survivors_re::coop::directory::LobbyDirectory,
    view: &mut CoopUi,
) {
    view.lobbies = directory.snapshot.as_ref().map(|rows| {
        rows.iter()
            .map(|row| crate::coop_ui::LobbyRow {
                code: row.code.clone(),
                name: row.name.clone(),
                description: row.description.clone(),
                host: row.hero.clone(),
                hero_class: row.class.clone(),
                host_title: row.host_title.clone(),
                country: row.country.clone(),
                zone: row.zone.clone(),
                zone_key: row.zone.clone(),
                heroic_rank: row.heroic,
                difficulty: row.difficulty.clone(),
                lacks: row.lacks.clone(),
                unlocked: row.opened,
                has_password: row.locked,
                classes: row
                    .classes
                    .iter()
                    .map(|id| azeroth_survivors_re::coop::game_party::class_key(*id).to_owned())
                    .collect(),
                joined: row.players,
                capacity: row.max,
            })
            .collect()
    });
}

///1458e2590 treats the environment override as a FILE PATH. The literal
/// `none` disables it. No key contents enter diagnostics or saved evidence.
fn staff_key() -> String {
    staff_key_path(|key| std::env::var(key))
        .and_then(|path| std::fs::read_to_string(path).ok())
        .map(|value| value.trim().to_owned())
        .unwrap_or_default()
}
fn staff_key_path(
    mut environment: impl FnMut(&str) -> Result<String, std::env::VarError>,
) -> Option<std::path::PathBuf> {
    use std::path::PathBuf;
    match environment("WOW_ROGUE_STAFF_KEY") {
        Ok(value) if value == "none" => None,
        Ok(value) => Some(value.into()),
        Err(_) => {
            let base = environment("APPDATA")
                .ok()
                .map(PathBuf::from)
                .or_else(|| environment("XDG_DATA_HOME").ok().map(PathBuf::from))
                .or_else(|| {
                    environment("HOME")
                        .ok()
                        .map(|home| PathBuf::from(home).join(".local").join("share"))
                })?;
            Some(base.join("wenilla-rogue").join("staff.key"))
        }
    }
}

fn native_catalog() -> &'static crate::catalog::MenuCatalog {
    static CATALOG: std::sync::OnceLock<crate::catalog::MenuCatalog> = std::sync::OnceLock::new();
    CATALOG.get_or_init(crate::catalog::MenuCatalog::embedded)
}
pub(crate) fn display_class(locale: &crate::localization::Localization, id: u8) -> String {
    let key = azeroth_survivors_re::coop::game_party::class_key(id);
    native_catalog()
        .classes
        .iter()
        .find(|row| row.key == key)
        .map(|row| {
            locale
                .lookup(&format!("class.{}.name", row.key))
                .unwrap_or(&row.name)
                .to_owned()
        })
        .unwrap_or_default()
}
pub(crate) fn display_zone(locale: &crate::localization::Localization, key: &str) -> String {
    native_catalog()
        .zones
        .iter()
        .find(|row| row.key == key)
        .map(|row| {
            locale
                .lookup(&format!("zone.{}.name", row.key))
                .unwrap_or(&row.name)
                .to_owned()
        })
        .unwrap_or_else(|| key.to_owned())
}

pub(crate) fn display_race(locale: &crate::localization::Localization, id: u8) -> String {
    native_catalog().races.iter().find(|row| crate::menu::race_id_for(&row.key) == id)
        .map(|row| locale.lookup(&format!("race.{}.name", row.key))
            .unwrap_or(&row.name).to_owned()).unwrap_or_default()
}

#[cfg(test)]
mod tests {
    use super::*;
    use azeroth_survivors_re::coop::{server_party::HostConfig, session::Session};

    // Queue-only workers: these regressions never establish a socket/thread.
    fn worker(state: u8) -> (Worker, mpsc::Receiver<WorkerCommand>) {
        let (send, commands) = mpsc::channel();
        let (_, receive) = mpsc::channel();
        (
            Worker {
                send,
                receive: Mutex::new(receive),
                state: Arc::new(AtomicU8::new(state)),
                rtt: RttSamples::default(),
            },
            commands,
        )
    }

    #[test]
    fn terminal_service_close_submits_leave_before_retiring_each_transport() {
        let (primary, primary_commands) = worker(1);
        let (secondary, secondary_commands) = worker(1);
        let mut service = Service {
            worker: Some(primary),
            secondary: Some(secondary),
            ..Default::default()
        };
        service.close();
        service.close();
        for commands in [primary_commands, secondary_commands] {
            let WorkerCommand::Send(bytes) = commands.try_recv().unwrap() else {
                panic!("Leave must precede Stop");
            };
            assert_eq!(bytes, [8]);
            assert!(matches!(commands.try_recv(), Ok(WorkerCommand::Stop)));
            assert!(commands.try_recv().is_err());
        }
    }

    #[test]
    fn worker_transport_ping_bypasses_reliable_sequence_envelopes() {
        let (worker, commands) = worker(1);
        worker.start_ping(u32::MAX);
        let WorkerCommand::Send(bytes) = commands.try_recv().unwrap() else { panic!("ping"); };
        let mut expected = vec![6];
        expected.extend_from_slice(&u32::MAX.to_le_bytes());
        expected.extend_from_slice(&9_u32.to_le_bytes());
        expected.push(5);
        expected.extend_from_slice(&0_u64.to_le_bytes());
        assert_eq!(bytes, expected);
    }

    #[test]
    fn worker_transport_rtt_handle_remains_live() {
        let (worker, _) = worker(1);
        assert_eq!(worker.rtt_ms(37), None);
        let samples = worker.rtt_samples();
        samples.lock().unwrap().insert(37, 12.25);
        assert_eq!(worker.rtt_ms(37), Some(12.25));
        samples.lock().unwrap().insert(37, 0.0);
        assert_eq!(worker.rtt_ms(37), Some(0.0));
    }

    #[test]
    fn published_rtt_sources_follow_dynamic_creation_and_removal_in_the_same_pass() {
        fn sample(service: &Service) -> Option<u16> {
            use azeroth_survivors_re::coop::{
                replication::{encode_batch, NativeMessage},
                server_party::{JoinRequest, LifecyclePacket},
            };
            let mut session = Session::service_host_with_relay(
                HostConfig { password: Vec::new(), capacity: 2 }, service.relay_protocol.clone());
            session.share_relay_peers(service.relay_peers.clone());
            let client = session.service_peer_open(7).unwrap();
            assert!(session.server.admit(client, &JoinRequest::current(Vec::new()), 0.).unwrap().is_ok());
            let pong = encode_batch(&[NativeMessage::Lifecycle(LifecyclePacket::Pong(0))])
                .unwrap().unwrap();
            assert!(session.service_receive(7, relay_packet(&pong)));
            session.tick(1.0);
            session.peer_lobby_metadata(client).0
        }
        let mut service = Service::default();
        let (initial, _initial_commands) = worker(1);
        initial.rtt.lock().unwrap().insert(7, 12.5);
        service.worker = Some(initial);
        service.share_rtt_sources();
        assert_eq!(sample(&service), Some(13));
        let (dynamic, _dynamic_commands) = worker(0);
        service.secondary = Some(dynamic);
        service.share_rtt_sources();
        assert_eq!(sample(&service), Some(1000), "new empty dynamic transport uses the app-clock fallback");
        service.secondary.as_ref().unwrap().rtt.lock().unwrap().insert(7, 37.25);
        assert_eq!(sample(&service), Some(37), "the published map remains live while unready");
        service.secondary = None;
        service.share_rtt_sources();
        assert_eq!(sample(&service), Some(13), "removal selects the initial handle immediately");
    }

    fn relay_packet(payload: &[u8]) -> Vec<u8> {
        let mut bytes = vec![0, 1, 0, 0, 0, 0, 0, 0, 0];
        bytes.extend_from_slice(payload);
        bytes
    }

    fn party(host: bool) -> CoopRuntime {
        let mut runtime = CoopRuntime::default();
        runtime.driver = Some(if host {
            Session::service_host(HostConfig {
                password: Vec::new(),
                capacity: 5,
            })
        } else {
            Session::service_join(Vec::new())
        });
        runtime.shared_running = true;
        runtime.world_guid = Some(42);
        runtime
    }

    #[test]
    fn earlier_control_reply_reaches_the_selected_transport_before_departure() {
        use azeroth_survivors_re::coop::session::{
            service_host_receive, service_peer_departed, service_peer_open,
        };
        let (primary, primary_commands) = worker(1);
        let (secondary, secondary_commands) = worker(1);
        let mut service = Service::default();
        service.worker = Some(primary);
        service.secondary = Some(secondary);
        service_peer_open(&service.relay_protocol, &service.relay_peers, 7);
        let mut control = vec![2];
        control.extend_from_slice(&0u64.to_le_bytes());
        control.push(0);
        assert!(service_host_receive(
            &service.relay_protocol,
            &service.relay_peers,
            7,
            &control
        ));
        // Native receive emitted this response before the later Wire25.
        drain_service_relay(&mut service);
        service_peer_departed(&service.relay_protocol, &service.relay_peers, 7);
        service
            .relay_protocol
            .lock()
            .unwrap()
            .poll(true, Instant::now() + std::time::Duration::from_secs(10));
        drain_service_relay(&mut service);
        *control.last_mut().unwrap() = 1;
        let expected = ClientMessage::Relay {
            peer: 7,
            payload: control,
        }
        .encode()
        .unwrap();
        let WorkerCommand::Send(actual) = secondary_commands.try_recv().unwrap() else {
            panic!()
        };
        assert_eq!(actual, expected);
        assert!(secondary_commands.try_recv().is_err());
        assert!(primary_commands.try_recv().is_err());
    }

    #[test]
    fn off_guest_control_output_uses_the_service_drain_without_a_session() {
        let (primary, commands) = worker(1);
        let mut service = Service::default();
        service.worker = Some(primary);
        service.guest_flags.lock().unwrap().active = true;
        assert!(azeroth_survivors_re::coop::session::service_guest_receive(
            &service.relay_protocol,
            &service.guest_flags,
            &relay_packet(&[1]),
        ));
        let mut control = relay_packet(&[0]);
        control[0] = 2;
        azeroth_survivors_re::coop::session::service_guest_receive(
            &service.relay_protocol,
            &service.guest_flags,
            &control,
        );
        drain_service_relay(&mut service);
        let WorkerCommand::Send(bytes) = commands.try_recv().unwrap() else {
            panic!()
        };
        assert_eq!(bytes[0], 6);
        assert_eq!(&bytes[1..5], &[0; 4]);
        assert_eq!(&bytes[5..9], &10u32.to_le_bytes());
        assert_eq!(&bytes[9..], &[2, 1, 0, 0, 0, 0, 0, 0, 0, 1]);
        assert!(commands.try_recv().is_err());
        let (secondary, secondary_commands) = worker(1);
        service.secondary = Some(secondary);
        send_relay(
            &mut service,
            azeroth_survivors_re::coop::session::RelayCommand::GuestLeave,
        );
        let WorkerCommand::Send(primary) = commands.try_recv().unwrap() else {
            panic!()
        };
        let WorkerCommand::Send(secondary) = secondary_commands.try_recv().unwrap() else {
            panic!()
        };
        assert_eq!(primary, vec![8]);
        assert_eq!(secondary, vec![8]);
    }

    #[test]
    fn prior_control_reply_reaches_the_worker_before_fresh_party_or_closed_retirement() {
        for tag in [21, 22, 27] {
            let (primary, primary_commands) = worker(1);
            let (secondary, secondary_commands) = worker(1);
            let mut service = Service::default();
            service.worker = Some(primary);
            service.secondary = Some(secondary);
            service.guest_flags.lock().unwrap().active = true;
            assert!(azeroth_survivors_re::coop::session::service_guest_receive(
                &service.relay_protocol, &service.guest_flags, &relay_packet(&[7]),
            ));
            let mut control = relay_packet(&[0]);
            control[0] = 2;
            azeroth_survivors_re::coop::session::service_guest_receive(
                &service.relay_protocol, &service.guest_flags, &control,
            );
            // The same ordering is required at the start of each actual arm.
            drain_service_relay(&mut service);
            if tag == 27 {
                service.guest_flags.lock().unwrap().active = false;
                service.secondary = None;
                azeroth_survivors_re::coop::session::service_party_ended(&service.relay_protocol);
            } else {
                azeroth_survivors_re::coop::session::service_party_reset(
                    &service.relay_protocol, &service.guest_flags, tag == 22,
                );
            }
            let WorkerCommand::Send(bytes) = secondary_commands.try_recv().unwrap() else { panic!() };
            assert_eq!(&bytes[..9], &[6, 0, 0, 0, 0, 10, 0, 0, 0]);
            assert_eq!(&bytes[9..], &[2, 1, 0, 0, 0, 0, 0, 0, 0, 1]);
            if tag == 27 {
                assert!(matches!(secondary_commands.try_recv(), Ok(WorkerCommand::Stop)));
            }
            assert!(secondary_commands.try_recv().is_err());
            assert!(primary_commands.try_recv().is_err());
            assert!(service.relay_protocol.lock().unwrap().take_outgoing().is_empty());
        }
    }

    #[test]
    fn secondary_metadata_does_not_block_the_primary_after_teardown() {
        use azeroth_survivors_re::coop::relay_lifetime::SecondaryLifetime;
        let (primary, _) = worker(1);
        let mut service = Service::default();
        service.worker = Some(primary);
        let mut state = SecondaryLifetime::new(Instant::now());
        state.admit(true);
        service.secondary_lifetime = Some(state);
        assert!(service.relay_connected());
    }

    #[test]
    fn admitted_secondary_retry_retains_party_while_blocking_data() {
        use azeroth_survivors_re::coop::relay_lifetime::{Action, SecondaryLifetime};
        let (primary, _) = worker(2);
        let (secondary, _) = worker(1);
        let mut service = Service::default();
        service.worker = Some(primary);
        service.secondary = Some(secondary);
        let now = Instant::now();
        let mut state = SecondaryLifetime::new(now);
        state.admit(false);
        assert_eq!(state.poll(2, now), Action::Reopen);
        service.secondary_lifetime = Some(state);
        let mut runtime = party(true);
        transport_closed(&mut service, &mut runtime, &mut CoopUi::default(), false);
        assert!(runtime.driver.as_ref().unwrap().connected());
        assert!(!service.secondary_failed());
        assert!(!service.relay_connected());
    }

    #[test]
    fn primary_loss_keeps_host_and_guest_party_for_connecting_or_open_secondary() {
        for host in [false, true] {
            for state in [0, 1] {
                let (primary, _primary_commands) = worker(2);
                let (secondary, secondary_commands) = worker(state);
                let mut service = Service::default();
                service.worker = Some(primary);
                service.secondary = Some(secondary);
                service.hosting = host;
                let mut runtime = party(host);
                let mut view = CoopUi::default();
                view.role = if host { "host" } else { "guest" }.into();
                view.status = if host { "hosting" } else { "joined" }.into();
                view.code = Some("party-code".into());
                let phase = view.status.clone();
                transport_closed(&mut service, &mut runtime, &mut view, false);
                assert!(service.worker.is_some());
                assert!(service.secondary.is_some());
                assert_eq!(service.hosting, host);
                assert!(runtime.driver.as_ref().unwrap().connected());
                assert!(runtime.shared_running);
                assert_eq!(runtime.world_guid, Some(42));
                assert!(!runtime.transport_lost);
                assert_eq!(view.status, phase);
                assert_eq!(view.code.as_deref(), Some("party-code"));
                assert!(view.unavailable_reason.is_none());
                assert!(secondary_commands.try_recv().is_err());
                let driver = runtime.driver.as_mut().unwrap();
                if host {
                    // New peer admission belongs to the selected relay too.
                    assert!(driver.service_peer_open(77).is_some());
                    assert!(driver.service_receive(77, relay_packet(&[1, 2, 3])));
                } else {
                    assert!(driver.service_receive(0, relay_packet(&[1, 2, 3])));
                    // Pending native handshake still goes through the relay.
                    for command in driver.take_service_commands() {
                        send_relay(&mut service, command);
                    }
                    assert!(matches!(
                        secondary_commands.try_recv(),
                        Ok(WorkerCommand::Send(_))
                    ));
                }
            }
        }
    }

    #[test]
    fn actual_secondary_loss_still_ends_party_after_primary_loss_in_either_order() {
        for host in [false, true] {
            for primary_first in [false, true] {
                let (primary, _primary_commands) = worker(2);
                let (secondary, _secondary_commands) = worker(1);
                let secondary_state = secondary.state.clone();
                let mut service = Service::default();
                service.worker = Some(primary);
                service.secondary = Some(secondary);
                let mut runtime = party(host);
                let mut view = CoopUi::default();
                if primary_first {
                    transport_closed(&mut service, &mut runtime, &mut view, false);
                }
                secondary_state.store(2, Ordering::Release);
                transport_closed(&mut service, &mut runtime, &mut view, !primary_first);
                assert!(!runtime.driver.as_ref().unwrap().connected());
                assert_eq!(runtime.transport_lost, host);
                if host {
                    assert!(service.secondary.is_none());
                    assert!(service.worker.is_none());
                    assert_eq!(
                        view.unavailable_reason.as_deref(),
                        Some("the co-op relay cannot be reached")
                    );
                }
            }
        }
    }

    #[test]
    fn primary_loss_without_selected_relay_and_off_mode_retain_failure_path() {
        for active in [false, true] {
            let (primary, _commands) = worker(2);
            let mut service = Service::default();
            service.worker = Some(primary);
            let mut runtime = if active {
                party(true)
            } else {
                CoopRuntime::default()
            };
            let mut view = CoopUi::default();
            transport_closed(&mut service, &mut runtime, &mut view, false);
            assert!(service.worker.is_none());
            assert_eq!(view.status, "unavailable");
            if let Some(driver) = &runtime.driver {
                assert!(!driver.connected());
            }
        }
    }

    #[test]
    fn explicit_leave_after_primary_loss_still_closes_the_selected_relay() {
        for host in [false, true] {
            let (primary, _primary_commands) = worker(2);
            let (secondary, _secondary_commands) = worker(1);
            let mut service = Service::default();
            service.worker = Some(primary);
            service.secondary = Some(secondary);
            let mut runtime = party(host);
            let mut view = CoopUi::default();
            transport_closed(&mut service, &mut runtime, &mut view, false);
            let driver = runtime.driver.as_mut().unwrap();
            driver.take_service_commands();
            driver.close();
            for command in driver.take_service_commands() {
                send_relay(&mut service, command);
            }
            assert!(!driver.connected());
            assert!(service.secondary.is_none());
        }
    }

    #[test]
    fn refused_guest_is_off_even_while_its_driver_awaits_the_final_drain() {
        use azeroth_survivors_re::coop::server_party::{LifecyclePacket, encode_lifecycle};
        let (primary, _primary_commands) = worker(2);
        let (secondary, _secondary_commands) = worker(1);
        let mut service = Service::default();
        service.worker = Some(primary);
        service.secondary = Some(secondary);
        let mut runtime = party(false);
        let driver = runtime.driver.as_mut().unwrap();
        let denied = encode_lifecycle(&LifecyclePacket::Denied(b"refused".to_vec())).unwrap();
        assert!(driver.service_receive(0, relay_packet(&denied)));
        driver.tick(0.1);
        assert!(driver.denial.is_some());
        let mut view = CoopUi::default();
        transport_closed(&mut service, &mut runtime, &mut view, false);
        assert!(service.worker.is_none());
        assert!(service.secondary.is_none());
        assert_eq!(view.status, "unavailable");
    }

    #[test]
    fn staff_path_override_disable_and_unicode_environment_fallback_are_separate() {
        let path = |pairs: &[(&str, &str)]| {
            staff_key_path(|key| {
                pairs
                    .iter()
                    .find(|(name, _)| *name == key)
                    .map(|(_, value)| (*value).to_owned())
                    .ok_or(std::env::VarError::NotPresent)
            })
        };
        assert_eq!(
            path(&[("WOW_ROGUE_STAFF_KEY", "none"), ("HOME", "/fixture")]),
            None
        );
        assert_eq!(
            path(&[("WOW_ROGUE_STAFF_KEY", ""), ("HOME", "/fixture")]),
            Some("".into())
        );
        assert_eq!(
            path(&[("WOW_ROGUE_STAFF_KEY", "/fixture/key")]),
            Some("/fixture/key".into())
        );
        assert_eq!(
            path(&[
                ("APPDATA", "/first"),
                ("XDG_DATA_HOME", "/second"),
                ("HOME", "/third")
            ]),
            Some("/first/wenilla-rogue/staff.key".into())
        );
        assert_eq!(
            path(&[("XDG_DATA_HOME", "/second"), ("HOME", "/third")]),
            Some("/second/wenilla-rogue/staff.key".into())
        );
        assert_eq!(
            path(&[("HOME", "/third")]),
            Some("/third/.local/share/wenilla-rogue/staff.key".into())
        );
    }
}
