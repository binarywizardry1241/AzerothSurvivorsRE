//! Native party sessions over TCP or the public service's peer relay.
//!
//! The public lobby service and remaining game-message schemas have separate
//! owners. Unsupported frames remain explicit inputs, rather than being
//! decoded using a replacement protocol or a fabricated party snapshot.

use super::replication::{EnginePacket, NativeMessage, decode_frame, encode_batch};
use super::route;
use super::server_party::{
    ClientId, HostConfig, JoinAccepted, JoinRequest, LifecyclePacket, MAX_MESSAGES_PER_CLIENT_TICK,
    MembershipEvent, NativeLobbyChat, PartyServer, REJECTION_DRAIN_SECONDS, encode_lifecycle,
};
use super::tcp::{DirectTcp, StartupConfig, TcpConnection, TcpHost};
use std::collections::{HashMap, VecDeque};
use std::io;
use std::sync::{Arc, Mutex};
use std::sync::atomic::{AtomicU8, Ordering};
use std::time::Instant;

#[derive(Default)]
struct RelayEndpoint {
    alive: bool,
    reconnecting: bool,
    received: VecDeque<Vec<u8>>,
}

#[derive(Default)]
pub struct RelayHostState {
    peers: HashMap<u32, RelayEndpoint>,
    waiting: VecDeque<u32>,
    countries: HashMap<u32, String>,
    rtt: ServiceRttSources,
}

pub type ServiceRttEndpoint = (Arc<AtomicU8>, super::websocket::RttSamples);
#[derive(Default)]
pub struct ServiceRttSources {
    /// The initial directory-URL worker.
    pub primary: Option<ServiceRttEndpoint>,
    /// The dynamic service port, selected whenever its handle is present.
    pub secondary: Option<ServiceRttEndpoint>,
}
pub fn service_rtt_sources(hosts: &RelayPeers, sources: ServiceRttSources) {
    hosts.lock().unwrap().rtt = sources;
}
impl ServiceRttSources {
    fn sample(&self, id: u32) -> Option<f32> {
        // Native145cc9401 selects by presence; readiness belongs only to ping
        // admission. Missing samples never fall back to the other transport.
        self.secondary.as_ref().or(self.primary.as_ref())
            .and_then(|(_, samples)| samples.lock().unwrap().get(&id).copied())
    }
}

pub type RelayPeers = Arc<Mutex<RelayHostState>>;
pub type RelayProtocol = Arc<Mutex<super::relay::Relay>>;

/// Wire33 belongs to the service, independently of endpoint/handle lifetime.
pub fn service_country(hosts: &RelayPeers, id: u32, country: &str) {
    let country = String::from_utf8(super::server_party::normalize_lobby_country(country.as_bytes()))
        .expect("normalized ASCII country");
    hosts.lock().unwrap().countries.insert(id, country);
}

/// Hosted21 alone starts a fresh country-map lifetime; ordinary closes retain it.
pub fn service_country_reset(hosts: &RelayPeers) {
    hosts.lock().unwrap().countries.clear();
}

/// The native service outlives individual guest handles and local Leave.
#[derive(Default)]
pub struct GuestFlags {
    pub active: bool,
    pub reconnecting: bool,
    fatal: bool,
    received: VecDeque<Vec<u8>>,
}

impl GuestFlags {
    pub fn control(&mut self, reconnecting: bool) {
        self.reconnecting = reconnecting && self.active;
    }
}

pub type SharedGuestFlags = Arc<Mutex<GuestFlags>>;

/// Current Hosted/Joined service cases reset inner sequencing and unread guest
/// payloads before publishing admission. Hosted retains the active guest byte;
/// Joined sets it. Host endpoints/listener backlog have separate lifetimes.
pub fn service_party_reset(protocol: &RelayProtocol, flags: &SharedGuestFlags, joined: bool) {
    let mut guest = flags.lock().unwrap();
    if joined {
        guest.active = true;
    }
    protocol.lock().unwrap().fresh_party();
    guest.received.clear();
    guest.fatal = false;
    guest.reconnecting = false;
}

/// Closed27 clears inner replay/control state after closing the selected
/// secondary. Buffered guest input and its remaining flags survive until the
/// next Hosted/Joined admission.
pub fn service_party_ended(protocol: &RelayProtocol) {
    protocol.lock().unwrap().fresh_party();
}

/// The native service consumes active guest input even without a game handle.
/// A later handle reads this same inbox; local Leave does not discard it.
pub fn service_guest_receive(
    protocol: &RelayProtocol,
    flags: &SharedGuestFlags,
    payload: &[u8],
) -> bool {
    let mut guest = flags.lock().unwrap();
    if !guest.active {
        return false;
    }
    guest.received.extend(protocol.lock().unwrap().receive(0, payload, Instant::now()));
    true
}

/// Wire24 publishes a service-owned endpoint and listener backlog entry even
/// while the Game is Off; creating a later handle does not clear either queue.
pub fn service_peer_open(protocol: &RelayProtocol, hosts: &RelayPeers, id: u32) {
    hosts.lock().unwrap().peers.insert(
        id,
        RelayEndpoint {
            alive: true,
            ..Default::default()
        },
    );
    protocol.lock().unwrap().peer_open(id);
    hosts.lock().unwrap().waiting.push_back(id);
}

pub fn service_peer_closed(hosts: &RelayPeers, id: u32) {
    if let Some(peer) = hosts.lock().unwrap().peers.get_mut(&id) {
        peer.alive = false;
    }
}

/// Wire25 is permanent departure, unlike the temporary wire31/32 flags. The
/// endpoint keeps already delivered input for the ordinary session drain, but
/// the service drops that peer's sequence/replay row even without an endpoint.
pub fn service_peer_departed(protocol: &RelayProtocol, hosts: &RelayPeers, id: u32) {
    service_peer_closed(hosts, id);
    protocol.lock().unwrap().remove(id);
}

pub fn service_peer_reconnecting(hosts: &RelayPeers, id: u32, reconnecting: bool) {
    if let Some(peer) = hosts.lock().unwrap().peers.get_mut(&id) {
        peer.reconnecting = reconnecting;
    }
}

pub fn service_relay_reset(protocol: &RelayProtocol, hosts: &RelayPeers, flags: &SharedGuestFlags) {
    protocol.lock().unwrap().reset_transport(Instant::now());
    flags.lock().unwrap().reconnecting = false;
    for peer in hosts.lock().unwrap().peers.values_mut() {
        peer.reconnecting = false;
    }
}

pub fn service_relay_fallback(protocol: &RelayProtocol) {
    protocol.lock().unwrap().initial_fallback();
}

pub fn service_host_receive(
    protocol: &RelayProtocol,
    hosts: &RelayPeers,
    id: u32,
    payload: &[u8],
) -> bool {
    let mut hosts = hosts.lock().unwrap();
    let Some(peer) = hosts.peers.get_mut(&id) else {
        return false;
    };
    peer.received.extend(protocol.lock().unwrap().receive(id, payload, Instant::now()));
    true
}

/// The service owns its WebSocket. Session packets retain their native binary
/// envelopes inside wire6; they never become a direct address or JSON message.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum RelayCommand {
    Send { id: u32, payload: Vec<u8> },
    /// Raw service probe5 bypasses the reliable inner relay's0..4 envelopes.
    TransportPing { id: u32 },
    Close { id: u32 },
    Leave,
    GuestLeave,
}

enum Connection {
    Tcp(TcpConnection),
    Relay {
        id: u32,
        guest: bool,
        enabled: bool,
        peers: RelayPeers,
        guest_flags: SharedGuestFlags,
        protocol: RelayProtocol,
        outgoing: Vec<RelayCommand>,
    },
}

impl Connection {
    fn start_ping(&mut self) {
        if let Self::Relay { id, outgoing, .. } = self {
            outgoing.push(RelayCommand::TransportPing { id: *id });
        }
    }
    fn rtt_ms(&self) -> Option<f32> {
        match self {
            Self::Tcp(_) => None,
            Self::Relay { id, peers, .. } => peers.lock().unwrap().rtt.sample(*id),
        }
    }
    fn country(&self) -> String {
        match self {
            Self::Tcp(_) => String::new(),
            Self::Relay { id, peers, .. } => peers.lock().unwrap().countries
                .get(id).cloned().unwrap_or_default(),
        }
    }
    fn relay(
        id: u32,
        guest: bool,
        peers: RelayPeers,
        protocol: RelayProtocol,
        guest_flags: SharedGuestFlags,
    ) -> Self {
        if guest {
            peers.lock().unwrap().peers.insert(
                id,
                RelayEndpoint {
                    alive: true,
                    reconnecting: false,
                    received: VecDeque::new(),
                },
            );
        }
        Self::Relay {
            id,
            guest,
            enabled: true,
            peers,
            guest_flags,
            protocol,
            outgoing: Vec::new(),
        }
    }
    fn send(&mut self, payload: &[u8]) {
        match self {
            Self::Tcp(connection) => connection.send(payload),
            Self::Relay {
                id,
                guest,
                enabled,
                peers,
                protocol,
                guest_flags,
                ..
            } => {
                let can_send = if *guest {
                    *enabled
                } else {
                    peers
                        .lock()
                        .unwrap()
                        .peers
                        .get(id)
                        .is_some_and(|peer| peer.alive)
                };
                if !can_send {
                    return;
                }
                let queued = protocol.lock().unwrap().queue(*id, payload, Instant::now());
                if !queued {
                    if *guest {
                        guest_flags.lock().unwrap().fatal = true;
                    }
                    if let Some(peer) = peers.lock().unwrap().peers.get_mut(id) {
                        peer.alive = false;
                    }
                }
            }
        }
    }
    fn receive(&mut self) -> Option<Vec<u8>> {
        match self {
            Self::Tcp(connection) => connection.receive(),
            Self::Relay {
                guest: true,
                guest_flags,
                ..
            } => guest_flags.lock().unwrap().received.pop_front(),
            Self::Relay { id, peers, .. } => peers
                .lock()
                .unwrap()
                .peers
                .get_mut(id)
                .and_then(|peer| peer.received.pop_front()),
        }
    }
    fn is_alive(&self) -> bool {
        match self {
            Self::Tcp(connection) => connection.is_alive(),
            Self::Relay {
                guest: true,
                enabled: false,
                ..
            } => false,
            Self::Relay {
                guest: true,
                id,
                peers,
                guest_flags,
                ..
            } => {
                let flags = guest_flags.lock().unwrap();
                let buffered = !flags.received.is_empty();
                !flags.fatal
                    && (flags.active || buffered)
                    && (buffered
                        || peers
                            .lock()
                            .unwrap()
                            .peers
                            .get(id)
                            .is_some_and(|peer| peer.alive))
            }
            Self::Relay { id, peers, .. } => peers
                .lock()
                .unwrap()
                .peers
                .get(id)
                .is_some_and(|peer| peer.alive || !peer.received.is_empty()),
        }
    }
    fn is_reconnecting(&self) -> bool {
        match self {
            Self::Tcp(_) => false,
            Self::Relay {
                guest: true,
                enabled: false,
                ..
            } => false,
            Self::Relay {
                guest: true,
                guest_flags,
                ..
            } => guest_flags.lock().unwrap().reconnecting,
            Self::Relay { id, peers, .. } => peers
                .lock()
                .unwrap()
                .peers
                .get(id)
                .is_some_and(|peer| peer.alive && peer.reconnecting),
        }
    }
    fn close(&mut self) {
        match self {
            Self::Tcp(connection) => connection.close(),
            Self::Relay {
                id,
                guest,
                enabled,
                peers,
                protocol,
                outgoing,
                ..
            } => {
                if *guest {
                    if *enabled {
                        outgoing.push(RelayCommand::GuestLeave);
                    }
                } else {
                    let active = peers
                        .lock()
                        .unwrap()
                        .peers
                        .remove(id)
                        .is_some_and(|peer| peer.alive);
                    if active {
                        outgoing.push(RelayCommand::Close { id: *id });
                    } else {
                        protocol.lock().unwrap().remove(*id);
                    }
                }
                *enabled = false;
            }
        }
    }
    fn take_relay_commands(&mut self) -> Vec<RelayCommand> {
        match self {
            Self::Relay { outgoing, .. } => std::mem::take(outgoing),
            Self::Tcp(_) => Vec::new(),
        }
    }
    fn relay_lost(&mut self) {
        if let Self::Relay {
            id, peers, enabled, ..
        } = self
        {
            *enabled = false;
            if let Some(peer) = peers.lock().unwrap().peers.get_mut(id) {
                peer.alive = false;
            }
        }
    }
}

struct Peer {
    id: ClientId,
    connection: Connection,
    drained: bool,
    reconnecting: bool,
    outgoing: Vec<NativeMessage>,
    last_ping: f64,
    ping_ms: Option<u16>,
}

impl Peer {
    fn flush(&mut self, now: f64) {
        // The host clock precedes existing queued traffic, including a forced
        // flush before the immediate kick denial.
        if !self.outgoing.is_empty() {
            self.outgoing.insert(0, NativeMessage::Time((now * 1000.0) as u64 as u32));
        }
        if let Ok(Some(bytes)) = encode_batch(&self.outgoing) {
            self.connection.send(&bytes);
            self.outgoing.clear();
        }
    }

    fn send_denied(&mut self, reason: Vec<u8>, now: f64) {
        self.flush(now);
        let denied = encode_lifecycle(&LifecyclePacket::Denied(reason))
            .expect("bounded native denial reason");
        self.connection.send(&denied);
    }
}

/// A decoded native message and its actual transport origin.
#[derive(Clone, Debug)]
pub struct IncomingMessage {
    pub client: Option<ClientId>,
    pub message: NativeMessage,
}

/// Sampled transport transitions. Application/world gates apply after sampling,
/// so multiple service controls in one pump do not fabricate intermediate chat.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ReconnectionChange {
    Host(bool),
    Relay(bool),
    Peer {
        client: ClientId,
        reconnecting: bool,
    },
}

/// Ordered internal world edges, never encoded as transport lifecycle tags.
#[derive(Clone, Debug)]
pub enum PartyEvent {
    Incoming(IncomingMessage),
    Membership(MembershipEvent),
    /// Captured after this row's Left, before another row can retire.
    Removed {
        client: ClientId,
        clients: Vec<super::party_frames::Client>,
    },
}

struct HostTick {
    now: f64,
    index: usize,
    frames: usize,
    pending: VecDeque<NativeMessage>,
}

fn lobby_ping_sample(now_ms: u32, sent: u32, transport: Option<f32>, previous: Option<u16>) -> Option<u16> {
    let sample = transport.map(|milliseconds| milliseconds.round() as u32)
        .unwrap_or_else(|| now_ms.wrapping_sub(sent));
    if sample > 9999 { return previous; }
    Some(previous.map_or(sample as u16,
        |old| ((sample + 2 * u32::from(old)) / 3) as u16))
}

pub struct Session {
    pub server: PartyServer,
    /// Guest delay/history belongs to the admitted party, surviving a ZoneKey.
    pub smooth: super::smooth::Smooth,
    listener: Option<TcpHost>,
    peers: Vec<Peer>,
    upstream: Option<Connection>,
    service: bool,
    // Party relay availability, independent of the directory's primary socket.
    relay_alive: bool,
    guest_flags: SharedGuestFlags,
    upstream_reconnecting: bool,
    relay_commands: Vec<RelayCommand>,
    relay_peers: RelayPeers,
    relay_protocol: RelayProtocol,
    relay_retry_active: bool,
    relay_retry_previous: bool,
    relay_initial_failure: bool,
    accepted: Option<JoinAccepted>,
    events: Vec<String>,
    messages: Vec<IncomingMessage>,
    upstream_outgoing: Vec<NativeMessage>,
    last_host_flush: f64,
    party_events: VecDeque<PartyEvent>,
    host_tick: Option<HostTick>,
    roster: Option<super::server_party::NativeRoster>,
    ready_check: Option<super::readycheck::Check>,
    ready_updates: Vec<super::readycheck::Snapshot>,
    lobby_chat: Vec<NativeLobbyChat>,
    chat_times: HashMap<ClientId, VecDeque<f64>>,
    lobby_ping: bool,
    pub denial: Option<Vec<u8>>,
}

impl Session {
    fn empty() -> Self {
        Self {
            server: PartyServer::default(),
            smooth: super::smooth::Smooth::default(),
            listener: None,
            peers: Vec::new(),
            upstream: None,
            service: false,
            relay_alive: false,
            guest_flags: SharedGuestFlags::default(),
            upstream_reconnecting: false,
            relay_commands: Vec::new(),
            relay_peers: RelayPeers::default(),
            relay_protocol: Arc::new(Mutex::new(super::relay::Relay::new(Instant::now()))),
            relay_retry_active: false,
            relay_retry_previous: false,
            relay_initial_failure: false,
            accepted: None,
            events: Vec::new(),
            messages: Vec::new(),
            upstream_outgoing: Vec::new(),
            last_host_flush: 0.0,
            party_events: VecDeque::new(),
            host_tick: None,
            roster: None,
            ready_check: None,
            ready_updates: Vec::new(),
            lobby_chat: Vec::new(),
            chat_times: HashMap::new(),
            lobby_ping: true,
            denial: None,
        }
    }

    /// Startup owner140014810 chooses a valid host port before the join input.
    /// A bind/connect failure is returned without changing that selection.
    pub fn open(config: &StartupConfig) -> io::Result<Self> {
        let mut session = Self::empty();
        match &config.direct {
            Some(DirectTcp::Host { port }) => {
                session.listener = Some(TcpHost::bind(*port)?);
                session.server.host(HostConfig {
                    password: config.password.as_bytes().to_vec(),
                    capacity: 5,
                });
            }
            Some(DirectTcp::Join { address }) => {
                let mut connection = TcpConnection::connect(address.as_str())?;
                let packet = LifecyclePacket::Join(JoinRequest::current(
                    config.password.as_bytes().to_vec(),
                ));
                connection.send(&encode_lifecycle(&packet).expect("bounded startup strings"));
                session.upstream = Some(Connection::Tcp(connection));
            }
            None => {}
        }
        Ok(session)
    }

    /// Native Created event installs a relay listener, then ordinary binary
    /// admission handles every service-assigned peer (145878832/145891be0).
    pub fn service_host(config: HostConfig) -> Self {
        Self::service_host_with_relay(config, RelayProtocol::default())
    }

    pub fn service_host_with_relay(config: HostConfig, protocol: RelayProtocol) -> Self {
        let mut session = Self::empty();
        session.relay_protocol = protocol;
        session.service = true;
        session.relay_alive = true;
        session.server.host(config);
        session
    }

    /// Joined installs the host endpoint id0 and immediately sends the same
    /// protocol4/version/password handshake as TCP (145891df0/145825dd0).
    pub fn service_join(password: Vec<u8>) -> Self {
        Self::service_join_with_relay(password, RelayProtocol::default())
    }

    pub fn service_join_with_relay(password: Vec<u8>, protocol: RelayProtocol) -> Self {
        let flags = SharedGuestFlags::default();
        flags.lock().unwrap().active = true;
        Self::service_join_with_flags(password, protocol, flags)
    }

    pub fn service_join_with_flags(
        password: Vec<u8>,
        protocol: RelayProtocol,
        flags: SharedGuestFlags,
    ) -> Self {
        let mut session = Self::empty();
        session.guest_flags = flags;
        session.relay_protocol = protocol;
        session.service = true;
        session.relay_alive = true;
        let mut upstream = Connection::relay(
            0,
            true,
            session.relay_peers.clone(),
            session.relay_protocol.clone(),
            session.guest_flags.clone(),
        );
        let packet = LifecyclePacket::Join(JoinRequest::current(password));
        upstream.send(&encode_lifecycle(&packet).expect("bounded service strings"));
        session.upstream = Some(upstream);
        session
    }

    pub fn is_service(&self) -> bool {
        self.service
    }

    pub fn share_guest_flags(&mut self, flags: SharedGuestFlags) {
        self.guest_flags = flags.clone();
        if let Some(Connection::Relay { guest_flags, .. }) = &mut self.upstream {
            *guest_flags = flags;
        }
    }

    /// Native listener145824440 returns each id supplied by the service. The
    /// separately assigned local ClientId still belongs to PartyServer.
    pub fn service_peer_open(&mut self, id: u32) -> Option<ClientId> {
        if !self.service || !self.relay_alive || !self.is_hosting() {
            return None;
        }
        service_peer_open(&self.relay_protocol, &self.relay_peers, id);
        self.accept_service_peers()
            .into_iter()
            .rev()
            .find_map(|(peer, client)| (peer == id).then_some(client))
    }

    pub fn share_relay_peers(&mut self, peers: RelayPeers) {
        self.relay_peers = peers.clone();
        for peer in &mut self.peers {
            if let Connection::Relay { peers: current, .. } = &mut peer.connection {
                *current = peers.clone();
            }
        }
    }

    fn accept_service_peers(&mut self) -> Vec<(u32, ClientId)> {
        let waiting = self
            .relay_peers
            .lock()
            .unwrap()
            .waiting
            .drain(..)
            .collect::<Vec<_>>();
        let mut accepted = Vec::new();
        for id in waiting {
            let client = self.server.accept_connection();
            self.peers.push(Peer {
                id: client,
                connection: Connection::relay(
                    id,
                    false,
                    self.relay_peers.clone(),
                    self.relay_protocol.clone(),
                    self.guest_flags.clone(),
                ),
                drained: false,
                reconnecting: false,
                outgoing: Vec::new(),
                last_ping: f64::NEG_INFINITY,
                ping_ms: None,
            });
            accepted.push((id, client));
        }
        accepted
    }

    /// Consume the inner sequence/control envelope before passing admitted
    /// payloads to the ordinary game decoder. This is separate from TCP framing.
    pub fn service_receive(&mut self, id: u32, payload: Vec<u8>) -> bool {
        //14581783f uses the shared guest flag before routing id0 into the
        //guest queue. Closed27 disables future arrivals without discarding
        //buffered frames or disabling the connection's later Leave command.
        if id == 0 {
            return service_guest_receive(&self.relay_protocol, &self.guest_flags, &payload);
        }
        service_host_receive(&self.relay_protocol, &self.relay_peers, id, &payload)
    }

    pub fn service_peer_closed(&mut self, id: u32) {
        if let Some(peer) = self.relay_peers.lock().unwrap().peers.get_mut(&id) {
            peer.alive = false;
        }
    }

    /// Service31/32 change temporary reconnect state, independently of wire25
    /// departure. Peer zero is the active guest; unknown host IDs stay absent.
    pub fn service_peer_reconnecting(&mut self, id: u32, reconnecting: bool) {
        if id == 0 {
            self.guest_flags.lock().unwrap().control(reconnecting);
            return;
        }
        if let Some(peer) = self.relay_peers.lock().unwrap().peers.get_mut(&id) {
            peer.reconnecting = reconnecting;
        }
    }

    pub fn take_reconnection_changes(&mut self) -> Vec<ReconnectionChange> {
        let mut changes = Vec::new();
        if self.is_hosting() {
            for peer in &mut self.peers {
                if !peer.connection.is_alive() {
                    continue;
                }
                let reconnecting = peer.connection.is_reconnecting();
                if reconnecting != peer.reconnecting {
                    peer.reconnecting = reconnecting;
                    changes.push(ReconnectionChange::Peer {
                        client: peer.id,
                        reconnecting,
                    });
                }
            }
        } else if let Some(upstream) = &self.upstream {
            if upstream.is_alive() {
                let reconnecting = upstream.is_reconnecting();
                if reconnecting != self.upstream_reconnecting {
                    self.upstream_reconnecting = reconnecting;
                    changes.push(ReconnectionChange::Host(reconnecting));
                }
            }
        }
        changes
    }

    /// Wire27 clears the service's guest flag and secondary socket. It leaves
    /// the primary service and host listener alive (1458172c8/145878945).
    /// A guest drains received packets before its ordinary dead-peer teardown,
    /// whose close still sends Leave through the live primary service.
    pub fn service_party_closed(&mut self) {
        self.guest_flags.lock().unwrap().active = false;
        if !self.is_hosting() {
            self.service_peer_closed(0);
        }
    }

    /// Loss of the party transport never queues commands back to it. Primary
    /// lobby loss alone does not call this while a selected relay survives.
    /// Buffered packets remain readable before ordinary session teardown.
    pub fn service_lost(&mut self) {
        self.relay_alive = false;
        self.relay_commands.clear();
        self.relay_protocol.lock().unwrap().lost();
        for peer in &mut self.peers {
            peer.connection.relay_lost();
            peer.connection.take_relay_commands();
        }
        if let Some(upstream) = &mut self.upstream {
            upstream.relay_lost();
            upstream.take_relay_commands();
        }
    }

    pub fn take_service_commands(&mut self) -> Vec<RelayCommand> {
        let mut encoded: Vec<_> = self
            .relay_protocol
            .lock()
            .unwrap()
            .take_outgoing()
            .into_iter()
            .map(|(id, payload)| RelayCommand::Send { id, payload })
            .collect();
        encoded.append(&mut self.relay_commands);
        self.relay_commands = encoded;
        for peer in &mut self.peers {
            self.relay_commands
                .extend(peer.connection.take_relay_commands());
        }
        if let Some(upstream) = &mut self.upstream {
            self.relay_commands.extend(upstream.take_relay_commands());
        }
        let (mut pings, commands): (Vec<_>, Vec<_>) = std::mem::take(&mut self.relay_commands)
            .into_iter().partition(|command| matches!(command, RelayCommand::TransportPing { .. }));
        pings.extend(commands);
        pings
    }

    /// Relay clocks use monotonic time and the selected socket's connected
    /// state, independently of game pause and the simulation clock.
    pub fn service_relay_poll(&mut self, connected: bool) {
        self.relay_protocol
            .lock()
            .unwrap()
            .poll(connected, Instant::now());
    }

    pub fn service_relay_retrying(&mut self, reconnecting: bool) {
        self.relay_retry_active = reconnecting;
    }

    /// Native guest trait +48 observes selected-relay failure before its first
    /// admission. An admitted relay's eventual loss remains ordinary host-left.
    pub fn service_relay_initial_failure(&mut self, failed: bool) {
        self.relay_initial_failure = failed;
    }

    pub fn relay_unreachable(&self) -> bool {
        self.service && !self.is_hosting() && self.relay_initial_failure
    }

    /// The separate native +40 getter reports a selected-secondary retry,
    /// rather than the remote peer's wire31/32 reconnecting flag (+38).
    pub fn take_relay_retry_change(&mut self) -> Option<bool> {
        let active = if self.is_hosting() {
            let active = self
                .peers
                .iter()
                .any(|peer| matches!(&peer.connection, Connection::Relay { .. }))
                && self.relay_alive
                && self.relay_retry_active;
            if !active && !self.peers.iter().any(|peer| peer.connection.is_alive()) {
                return None;
            }
            active
        } else {
            if !self.upstream.as_ref().is_some_and(Connection::is_alive) {
                return None;
            }
            self.relay_alive && self.relay_retry_active
        };
        if active == self.relay_retry_previous {
            return None;
        }
        self.relay_retry_previous = active;
        Some(active)
    }

    pub fn service_relay_reset(&mut self) {
        service_relay_reset(&self.relay_protocol, &self.relay_peers, &self.guest_flags);
    }

    pub fn accepted(&self) -> Option<JoinAccepted> {
        self.accepted
    }
    /// The party-list producer reads the sampled reconnect cache, including
    /// while a dead endpoint still has buffered input awaiting retirement.
    pub fn client_reconnecting(&self, client: ClientId) -> Option<bool> {
        self.peers
            .iter()
            .find(|peer| peer.id == client)
            .map(|peer| peer.reconnecting)
    }
    pub fn is_hosting(&self) -> bool {
        self.server.is_hosting()
    }
    pub fn connected(&self) -> bool {
        self.listener.is_some()
            || (self.service && self.relay_alive && self.is_hosting())
            || ((!self.service || self.relay_alive)
                && self.upstream.as_ref().is_some_and(Connection::is_alive))
    }

    /// Application owners consume each edge before asking for the next one.
    /// This preserves the native per-peer loop while world callbacks mutate the
    /// real assigned/synchronized row before another message can inspect it.
    pub fn begin_host_tick(&mut self, now: f64) {
        if self.service && self.relay_alive && self.is_hosting() {
            self.accept_service_peers();
        }
        while let Some(connection) = self.listener.as_ref().and_then(TcpHost::accept) {
            self.peers.push(Peer {
                id: self.server.accept_connection(),
                connection: Connection::Tcp(connection),
                drained: false,
                reconnecting: false,
                outgoing: Vec::new(),
                last_ping: f64::NEG_INFINITY,
                ping_ms: None,
            });
        }
        for peer in &mut self.peers {
            peer.drained = false;
            if self.lobby_ping && self.server.clients().iter().any(|row|
                row.id == peer.id && row.joined && row.closing_since.is_none())
                && now - peer.last_ping >= 2. {
                peer.last_ping = now;
                peer.connection.start_ping();
                peer.outgoing.push(NativeMessage::Lifecycle(LifecyclePacket::Ping(
                    (now * 1000.) as u64 as u32)));
            }
        }
        self.collect_membership();
        self.host_tick = Some(HostTick {
            now,
            index: 0,
            frames: 0,
            pending: VecDeque::new(),
        });
    }

    pub fn next_host_event(&mut self) -> Option<PartyEvent> {
        if let Some(event) = self.party_events.pop_front() {
            return Some(event);
        }
        let mut tick = self.host_tick.take()?;
        loop {
            if let Some(message) = tick.pending.pop_front() {
                let client = self.peers[tick.index].id;
                let Some(state) = self
                    .server
                    .clients()
                    .iter()
                    .find(|row| row.id == client)
                    .filter(|row| row.closing_since.is_none())
                else {
                    continue;
                };
                let joined = state.joined;
                let synchronized = state.synchronized;
                let assigned = state.world_hero.is_some();
                match message {
                    NativeMessage::Lifecycle(LifecyclePacket::Pong(sent)) if joined => {
                        let peer = &mut self.peers[tick.index];
                        peer.ping_ms = lobby_ping_sample((tick.now * 1000.) as u64 as u32,
                            sent, peer.connection.rtt_ms(), peer.ping_ms);
                    }
                    NativeMessage::Lifecycle(LifecyclePacket::Join(request)) => {
                        if let Some(result) = self.server.admit(client, &request, tick.now) {
                            let packet = match result {
                                Ok(accepted) => LifecyclePacket::Accepted(accepted),
                                Err(reason) => {
                                    LifecyclePacket::Denied(reason.reason().as_bytes().to_vec())
                                }
                            };
                            self.peers[tick.index]
                                .outgoing
                                .push(NativeMessage::Lifecycle(packet));
                        }
                    }
                    NativeMessage::Lifecycle(LifecyclePacket::EventBytes(_)) => {}
                    NativeMessage::Lifecycle(LifecyclePacket::Disconnect) if joined => {
                        self.peers[tick.index].connection.close();
                        self.retire_client(client);
                    }
                    NativeMessage::Lifecycle(LifecyclePacket::EngineCommand { .. }) if synchronized => {
                        self.party_events
                            .push_back(PartyEvent::Incoming(IncomingMessage {
                                client: Some(client),
                                message,
                            }));
                    }
                    NativeMessage::Lifecycle(LifecyclePacket::Synchronize)
                        if joined && assigned && !synchronized =>
                    {
                        self.party_events
                            .push_back(PartyEvent::Incoming(IncomingMessage {
                                client: Some(client),
                                message,
                            }));
                    }
                    NativeMessage::Lifecycle(LifecyclePacket::Hero(_))
                    | NativeMessage::Lifecycle(LifecyclePacket::LobbyChat(_))
                    | NativeMessage::Lifecycle(LifecyclePacket::ReadyAnswer(_))
                    | NativeMessage::Control { .. }
                        if joined =>
                    {
                        self.party_events
                            .push_back(PartyEvent::Incoming(IncomingMessage {
                                client: Some(client),
                                message,
                            }));
                    }
                    _ => {}
                }
                self.collect_membership();
                if let Some(event) = self.party_events.pop_front() {
                    self.host_tick = Some(tick);
                    return Some(event);
                }
                continue;
            }
            if tick.index >= self.peers.len() {
                return None;
            }
            if tick.frames < MAX_MESSAGES_PER_CLIENT_TICK {
                if let Some(bytes) = self.peers[tick.index].connection.receive() {
                    tick.frames += 1;
                    if let Ok(messages) = decode_frame(&bytes) {
                        tick.pending.extend(messages);
                    }
                    continue;
                }
                self.peers[tick.index].drained = true;
                let peer = &self.peers[tick.index];
                let expired = self.server.clients().iter().any(|row| {
                    row.id == peer.id
                        && row
                            .closing_since
                            .is_some_and(|since| tick.now - since > REJECTION_DRAIN_SECONDS)
                });
                if expired || !peer.connection.is_alive() {
                    let peer = &mut self.peers[tick.index];
                    if expired {
                        peer.connection.close();
                    }
                    self.relay_commands
                        .extend(peer.connection.take_relay_commands());
                    let client = peer.id;
                    self.retire_client(client);
                    self.peers.remove(tick.index);
                    tick.frames = 0;
                    if let Some(event) = self.party_events.pop_front() {
                        self.host_tick = Some(tick);
                        return Some(event);
                    }
                    continue;
                }
            }
            // A capped peer is retained even if EOF is already known. Its
            // remaining complete frames must precede retirement next tick.
            tick.index += 1;
            tick.frames = 0;
        }
    }

    /// Standalone transport consumers retain the same ordered edges. The live
    /// AS owner uses begin/next so callbacks execute before this pump advances.
    pub fn tick(&mut self, now: f64) {
        self.begin_host_tick(now);
        let mut completed = VecDeque::new();
        while let Some(event) = self.next_host_event() { completed.push_back(event); }
        self.party_events = completed;
        let receiving = self.denial.is_none();
        if let Some(upstream) = self.upstream.as_mut().filter(|_| receiving) {
            'receive: while let Some(bytes) = upstream.receive() {
                let Ok(messages) = decode_frame(&bytes) else {
                    continue;
                };
                for message in messages {
                    match &message {
                        NativeMessage::Lifecycle(LifecyclePacket::Ping(stamp)) => {
                            self.upstream_outgoing.push(NativeMessage::Lifecycle(
                                LifecyclePacket::Pong(*stamp)));
                        }
                        NativeMessage::Lifecycle(LifecyclePacket::Accepted(accepted)) => {
                            self.accepted = Some(*accepted)
                        }
                        NativeMessage::Lifecycle(LifecyclePacket::Denied(reason)) => {
                            self.denial = Some(reason.clone());
                            self.accepted = None;
                            self.roster = None;
                            //145bd8419 moves the guest to Off before publishing
                            //"refused", closing this actual transport first.
                            upstream.close();
                        }
                        NativeMessage::Lifecycle(LifecyclePacket::Roster(rows)) => {
                            self.roster = Some(rows.clone())
                        }
                        NativeMessage::Lifecycle(LifecyclePacket::EventBytes(event)) => {
                            self.events
                                .push(String::from_utf8_lossy(event).into_owned());
                        }
                        NativeMessage::Lifecycle(LifecyclePacket::LobbyChat(chat)) => {
                            self.lobby_chat.push(chat.clone());
                        }
                        NativeMessage::Lifecycle(LifecyclePacket::ReadyCheck(snapshot))
                            if self.accepted.is_some() && self.lobby_ping =>
                        {
                            self.ready_updates.push(snapshot.clone());
                        }
                        _ => {}
                    }
                    let refused = matches!(&message, NativeMessage::Lifecycle(LifecyclePacket::Denied(_)));
                    self.messages.push(IncomingMessage {
                        client: None,
                        message,
                    });
                    // Current145bd8419 switches to Off before dropping the
                    // old guest role. No later decoded or outer frame runs.
                    if refused { break 'receive; }
                }
            }
            if !upstream.is_alive() {
                self.accepted = None;
                self.roster = None;
            }
        }
        self.flush(now);
    }

    /// Hosting flushes no faster than the native1/60s gate. Guest inputs do not
    /// use that host gate. Multiple queued messages use native raw-DEFLATE tag19.
    pub fn flush(&mut self, now: f64) {
        if self.is_hosting() && now - self.last_host_flush >= 1.0 / 60.0 {
            self.last_host_flush = now;
            for peer in &mut self.peers {
                peer.flush(now);
            }
        }
        if let Some(upstream) = &mut self.upstream {
            if let Ok(Some(bytes)) = encode_batch(&self.upstream_outgoing) {
                upstream.send(&bytes);
                self.upstream_outgoing.clear();
            }
        }
    }

    /// Flush the joined peer and send its locked reason before starting the
    /// ordinary rejection drain on that connection.
    pub fn reject_hero(&mut self, client: ClientId, reason: Vec<u8>, now: f64) {
        if !self.server.clients().iter().any(|row| {
            row.id == client && row.joined && row.closing_since.is_none()
        }) {
            return;
        }
        let Some(peer) = self.peers.iter_mut().find(|peer| peer.id == client) else { return };
        peer.send_denied(reason, now);
        self.server.begin_closing(client, now);
        self.collect_membership();
    }

    /// Native local request26 forces this peer's pending output before wire3,
    /// closes its actual transport, then runs ordinary party retirement.
    pub fn kick_client(&mut self, client: ClientId, now: f64) -> bool {
        if !self.is_hosting() { return false; }
        let Some(index) = self.peers.iter().position(|peer| peer.id == client) else {
            return false;
        };
        let peer = &mut self.peers[index];
        peer.send_denied(b"the host sent you away".to_vec(), now);
        peer.connection.close();
        self.relay_commands.extend(peer.connection.take_relay_commands());
        self.peers.remove(index);
        if let Some(tick) = &mut self.host_tick {
            if index < tick.index {
                tick.index -= 1;
            } else if index == tick.index {
                tick.frames = 0;
                tick.pending.clear();
            }
        }
        self.retire_client(client);
        true
    }

    /// A host recipient is an actual admitted connection, while None names the
    /// guest's upstream host. No slot or GUID is guessed from the transport.
    pub fn send_message(&mut self, client: Option<ClientId>, message: NativeMessage) -> bool {
        if let Some(client) = client {
            if !self
                .server
                .clients()
                .iter()
                .any(|row| row.id == client && row.joined && row.closing_since.is_none())
            {
                return false;
            }
            if let Some(peer) = self.peers.iter_mut().find(|peer| peer.id == client) {
                peer.outgoing.push(message);
                return true;
            }
        } else if self.upstream.as_ref().is_some_and(Connection::is_alive) {
            self.upstream_outgoing.push(message);
            return true;
        }
        false
    }

    /// Queue a real initial-world stream only after the caller's actor insertion.
    /// As in145892220, publication precedes the synchronized flag.
    pub fn synchronize(&mut self, client: ClientId, packets: Vec<EnginePacket>) -> bool {
        if !self.server.clients().iter().any(|row| {
            row.id == client
                && row.joined
                && row.world_hero.is_some()
                && !row.synchronized
                && row.closing_since.is_none()
        }) {
            return false;
        }
        for packet in packets {
            if !self.send_message(Some(client), packet.into_message()) {
                return false;
            }
        }
        self.server.world_synchronization_completed(client)
    }

    pub fn take_messages(&mut self) -> Vec<IncomingMessage> {
        std::mem::take(&mut self.messages)
    }

    fn forward_event(&mut self, event: &str, except: Option<ClientId>) {
        let Some(event) = route::forward_to_peers(event) else {
            return;
        };
        let packet = NativeMessage::Lifecycle(LifecyclePacket::EventBytes(event.into_bytes()));
        for peer in &mut self.peers {
            if Some(peer.id) != except
                && self.server.clients().iter().any(|row| {
                    row.id == peer.id
                        && row.joined
                        && row.world_hero.is_some()
                        && row.closing_since.is_none()
                })
            {
                peer.outgoing.push(packet.clone());
            }
        }
    }

    /// Preserve the locally delivered original. Host-side projection applies
    /// only to copies sent to other heroes. Guest engine commands use their
    /// separately recovered opcode/bytes protocol, never this presentation tag.
    pub fn send_event(&mut self, event: &str) {
        if self.is_hosting() {
            self.forward_event(event, None);
        }
    }

    pub fn take_events(&mut self) -> Vec<String> {
        std::mem::take(&mut self.events)
    }

    /// 145bd7620: a remote lobby sender gets four accepted messages in five
    /// seconds. The caller first resolves its actual normalized Hero and text.
    pub fn admit_lobby_chat(&mut self, client: ClientId, now: f64) -> bool {
        if !self.server.clients().iter().any(|row| row.id == client
            && row.joined && row.closing_since.is_none()) {
            return false;
        }
        let times = self.chat_times.entry(client).or_default();
        times.retain(|then| !(now - *then >= 5.));
        if times.len() > 3 { return false; }
        times.push_back(now);
        true
    }

    /// 145bd2db0 sends the authoritative identity to every joined live lobby
    /// recipient and publishes the same row locally. In-run admission belongs
    /// to the actual game owner; transport presence does not fabricate a Hero.
    pub fn publish_lobby_chat(&mut self, chat: NativeLobbyChat) {
        if !self.is_hosting() { return; }
        let recipients = self.server.clients().iter()
            .filter(|row| row.joined && row.closing_since.is_none())
            .map(|row| row.id).collect::<Vec<_>>();
        for client in recipients {
            self.send_message(Some(client),
                NativeMessage::Lifecycle(LifecyclePacket::LobbyChat(chat.clone())));
        }
        self.lobby_chat.push(chat);
    }

    pub fn take_lobby_chat(&mut self) -> Vec<NativeLobbyChat> {
        std::mem::take(&mut self.lobby_chat)
    }

    ///145bb6ee6 supplies empty sender metadata; the host replaces it using the
    /// actual admitted Hero. A merely connected pre-admission guest cannot chat.
    pub fn send_guest_lobby_chat(&mut self, text: Vec<u8>) -> bool {
        if self.is_hosting() || self.accepted.is_none() || self.denial.is_some() {
            return false;
        }
        self.send_message(None, NativeMessage::Lifecycle(LifecyclePacket::LobbyChat(
            NativeLobbyChat { hero_identity: 0, name: Vec::new(), class: 0, text })))
    }

    pub fn set_lobby_ping(&mut self, enabled: bool) {
        self.lobby_ping = enabled;
        if !enabled {
            self.ready_check = None;
        }
    }

    pub fn answer_ready_check(&mut self, hero_identity: u64, ready: bool) {
        if let Some(check) = &mut self.ready_check {
            check.answer(hero_identity, ready);
        }
    }

    pub fn send_ready_answer(&mut self, ready: bool) {
        if !self.is_hosting() && self.accepted.is_some() && self.denial.is_none() {
            self.send_message(None, NativeMessage::Lifecycle(LifecyclePacket::ReadyAnswer(ready)));
        }
    }

    /// Consume a host action against the same normalized roster just published to peers.
    pub fn advance_ready_check(&mut self, now: f64, begin: bool, cancel: bool) -> bool {
        use super::readycheck::{Check, Status};
        if !self.is_hosting() || !self.lobby_ping {
            self.ready_check = None;
            return false;
        }
        if self.ready_check.is_none() && !begin {
            return false;
        }
        let members = self.roster.iter().flat_map(|roster| &roster.entries)
            .map(|row| row.hero_identity).collect::<Vec<_>>();
        if self.ready_check.is_none() && begin {
            self.ready_check = Check::begin(now, &members);
        }
        let Some(snapshot) = self.ready_check.as_mut().and_then(|check| check.update(now, &members, cancel)) else {
            return false;
        };
        if snapshot.status != Status::Running {
            self.ready_check = None;
        }
        let ready = snapshot.status == Status::Ready;
        let recipients = self.server.clients().iter()
            .filter(|row| row.joined && row.closing_since.is_none())
            .map(|row| row.id).collect::<Vec<_>>();
        for client in recipients {
            self.send_message(Some(client), NativeMessage::Lifecycle(LifecyclePacket::ReadyCheck(snapshot.clone())));
        }
        self.ready_updates.push(snapshot);
        ready
    }

    pub fn take_ready_checks(&mut self) -> Vec<super::readycheck::Snapshot> {
        std::mem::take(&mut self.ready_updates)
    }

    pub fn peer_lobby_metadata(&self, client: ClientId) -> (Option<u16>, String) {
        self.peers.iter().find(|peer| peer.id == client)
            .map_or((None, String::new()), |peer| (peer.ping_ms, peer.connection.country()))
    }

    pub fn host_country(&self) -> String {
        if !self.service { return String::new(); }
        self.relay_peers.lock().unwrap().countries.get(&0).cloned().unwrap_or_default()
    }
    /// Publish actual normalized profiles in native party order.
    pub fn publish_roster(&mut self, rows: Vec<super::server_party::NativeRosterEntry>, zone: String, heroic_rank: u8) {
        let roster = super::server_party::NativeRoster { entries: rows, zone, heroic_rank };
        if self.roster.as_ref() == Some(&roster) {
            return;
        }
        self.roster = Some(roster.clone());
        let recipients = self
            .server
            .clients()
            .iter()
            .filter(|row| row.joined && row.closing_since.is_none())
            .map(|row| row.id)
            .collect::<Vec<_>>();
        for client in recipients {
            self.send_message(
                Some(client),
                NativeMessage::Lifecycle(LifecyclePacket::Roster(roster.clone())),
            );
        }
    }
    pub fn roster(&self) -> Option<&[super::server_party::NativeRosterEntry]> {
        self.roster.as_ref().map(|roster| roster.entries.as_slice())
    }
    pub fn roster_snapshot(&self) -> Option<&super::server_party::NativeRoster> {
        self.roster.as_ref()
    }
    pub fn party_frame_clients(&self) -> Vec<super::party_frames::Client> {
        self.server
            .clients()
            .iter()
            .map(|row| super::party_frames::Client {
                id: row.id,
                world_hero: row.world_hero,
                synchronized: row.synchronized,
                // Online collection reads the cache even if the endpoint is dead.
                reconnecting: self.client_reconnecting(row.id).unwrap_or(false),
            })
            .collect()
    }
    fn collect_membership(&mut self) {
        self.party_events.extend(
            self.server
                .take_membership_events()
                .into_iter()
                .map(PartyEvent::Membership),
        );
    }
    fn retire_client(&mut self, client: ClientId) {
        if !self.server.clients().iter().any(|row| row.id == client) {
            return;
        }
        self.server.disconnect(client);
        self.chat_times.remove(&client);
        self.collect_membership();
        self.party_events.push_back(PartyEvent::Removed {
            client,
            clients: self.party_frame_clients(),
        });
    }
    pub fn take_party_events(&mut self) -> Vec<PartyEvent> {
        self.party_events.drain(..).collect()
    }

    /// Explicit role departure flushes queued game traffic, sends Disconnect
    /// as its own frame, then closes each transport before advancing.
    pub fn leave(&mut self, now: f64, mut submit: impl FnMut(RelayCommand)) {
        let disconnect = encode_lifecycle(&LifecyclePacket::Disconnect)
            .expect("fixed native disconnect packet");
        for index in 0..self.peers.len() {
            let peer = &mut self.peers[index];
            peer.flush(now);
            peer.connection.send(&disconnect);
            peer.connection.close();
            self.take_service_commands().into_iter().for_each(&mut submit);
        }
        self.disconnect_upstream(now, &disconnect);
        if let Some(upstream) = &mut self.upstream {
            upstream.close();
        }
        self.take_service_commands().into_iter().for_each(submit);
        self.finish_close();
    }

    /// A guest ending a run writes Disconnect, then the frontend closes the
    /// entire service. The guest handle must not close the secondary first.
    pub fn leave_guest_run(&mut self, now: f64) {
        let disconnect = encode_lifecycle(&LifecyclePacket::Disconnect)
            .expect("fixed native disconnect packet");
        self.disconnect_upstream(now, &disconnect);
        // TCP still needs its ordinary socket close. A service guest only owns
        // a shared handle, and the terminal service action closes its sockets.
        if let Some(Connection::Tcp(upstream)) = &mut self.upstream {
            upstream.close();
        }
        self.finish_close();
    }

    fn disconnect_upstream(&mut self, now: f64, disconnect: &[u8]) {
        self.flush(now);
        if let Some(upstream) = &mut self.upstream {
            upstream.send(disconnect);
        }
    }

    pub fn close(&mut self) {
        let leave_service = self.service && self.relay_alive && self.is_hosting();
        for peer in &mut self.peers {
            peer.connection.close();
            self.relay_commands
                .extend(peer.connection.take_relay_commands());
        }
        if let Some(upstream) = &mut self.upstream {
            upstream.close();
            self.relay_commands.extend(upstream.take_relay_commands());
        }
        if leave_service {
            self.relay_commands.push(RelayCommand::Leave);
        }
        self.finish_close();
    }

    fn finish_close(&mut self) {
        self.peers.clear();
        self.chat_times.clear();
        self.lobby_chat.clear();
        self.ready_check = None;
        self.ready_updates.clear();
        self.upstream = None;
        self.listener = None;
        self.relay_alive = false;
        self.accepted = None;
        self.roster = None;
        self.host_tick = None;
        self.server.close();
        self.events.clear();
        self.messages.clear();
        self.upstream_outgoing.clear();
        self.smooth = super::smooth::Smooth::default();
        self.collect_membership();
    }
}

#[cfg(test)]
mod relay_protocol_tests {
    use super::*;

    #[test]
    fn guest_departure_flushes_pending_traffic_before_a_separate_disconnect() {
        for end_run in [false, true] {
            let mut guest = Session::service_join(Vec::new());
            guest.take_service_commands();
            guest.upstream_outgoing.push(NativeMessage::Time(23));
            let mut commands = Vec::new();
            if end_run {
                guest.leave_guest_run(1.);
                commands.extend(guest.take_service_commands());
            } else {
                guest.leave(1., |command| commands.push(command));
            }
            let [RelayCommand::Send { id: 0, payload: queued },
                RelayCommand::Send { id: 0, payload: disconnect }, tail @ ..] =
                commands.as_slice()
            else {
                panic!("departure must preserve two separate frames");
            };
            assert_eq!(&queued[9..], &[21, 23, 0, 0, 0]);
            assert_eq!(&disconnect[9..], &[16]);
            if end_run {
                assert!(tail.is_empty());
            } else {
                assert_eq!(tail, [RelayCommand::GuestLeave]);
            }
            assert!(!guest.connected());
        }
    }

    #[test]
    fn denied_stops_the_current_decoded_batch_and_later_buffered_frames() {
        let mut guest = Session::service_join(Vec::new());
        guest.take_service_commands();
        let accepted = LifecyclePacket::Accepted(JoinAccepted { slot: 1, capacity: 2 });
        let first = encode_batch(&[
            NativeMessage::Lifecycle(accepted.clone()), NativeMessage::Time(7),
            NativeMessage::Lifecycle(LifecyclePacket::Denied(b"the host sent you away".to_vec())),
            NativeMessage::Lifecycle(accepted.clone()),
            NativeMessage::Lifecycle(LifecyclePacket::Roster(super::super::server_party::NativeRoster {
                entries: Vec::new(), zone: "elwynn".into(), heroic_rank: 0 })),
        ]).unwrap().unwrap();
        let later = encode_lifecycle(&accepted).unwrap();
        {
            let mut flags = guest.guest_flags.lock().unwrap();
            flags.active = true;
            flags.received.extend([first, later]);
        }
        guest.tick(1.);
        let messages = guest.take_messages();
        assert_eq!(messages.len(), 3);
        assert!(matches!(messages[0].message, NativeMessage::Lifecycle(LifecyclePacket::Accepted(_))));
        assert!(matches!(messages[1].message, NativeMessage::Time(7)));
        assert!(matches!(messages[2].message, NativeMessage::Lifecycle(LifecyclePacket::Denied(_))));
        assert_eq!(guest.denial.as_deref(), Some(b"the host sent you away".as_slice()));
        assert!(guest.accepted().is_none() && guest.roster().is_none());
        assert_eq!(guest.take_service_commands(), [RelayCommand::GuestLeave]);
        guest.tick(2.);
        assert!(guest.take_messages().is_empty());
        assert!(guest.accepted().is_none() && guest.roster().is_none());
        assert!(guest.take_service_commands().is_empty());
    }

    #[test]
    fn kick_flushes_pending_output_then_denies_closes_and_retires_the_actual_peer() {
        let mut host = Session::service_host(HostConfig { password: Vec::new(), capacity: 5 });
        let client = host.service_peer_open(73).unwrap();
        let retained = host.service_peer_open(99).unwrap();
        let request = JoinRequest::current(Vec::new());
        assert!(host.server.admit(client, &request, 2.).unwrap().is_ok());
        assert!(host.server.admit(retained, &request, 2.).unwrap().is_ok());
        host.collect_membership();
        host.take_party_events();
        host.take_service_commands();
        assert!(host.send_message(Some(client), NativeMessage::Time(77)));
        // The ordinary host cadence has not elapsed; kick must still flush.
        host.last_host_flush = 2.;
        assert!(host.kick_client(client, 2.001));
        let commands = host.take_service_commands();
        assert_eq!(commands.len(), 3);
        let RelayCommand::Send { id, payload } = &commands[0] else { panic!() };
        assert_eq!(*id, 73);
        assert_eq!(payload[0], 0, "reliable relay data envelope");
        let pending = decode_frame(&payload[9..]).unwrap();
        assert!(matches!(pending.as_slice(), [NativeMessage::Time(2001), NativeMessage::Time(77)]));
        let RelayCommand::Send { id, payload } = &commands[1] else { panic!() };
        assert_eq!(*id, 73);
        assert_eq!(&payload[9..], b"\x03\x16\0\0\0the host sent you away");
        assert_eq!(commands[2], RelayCommand::Close { id: 73 });
        assert_eq!(host.server.clients().iter().map(|row| row.id).collect::<Vec<_>>(), [retained]);
        assert_eq!(host.peers.iter().map(|peer| peer.id).collect::<Vec<_>>(), [retained]);
        let events = host.take_party_events();
        assert!(matches!(&events[0], PartyEvent::Membership(MembershipEvent::Left { client: id, .. }) if *id == client));
        assert!(matches!(&events[1], PartyEvent::Removed { client: id, clients } if *id == client && clients.len() == 1 && clients[0].id == retained));
        assert!(!host.kick_client(client, 2.002));
        assert!(host.take_service_commands().is_empty());
    }

    #[test]
    fn kick_requires_the_host_role_and_an_actual_connection() {
        let mut guest = Session::empty();
        assert!(!guest.kick_client(ClientId(1), 0.));
        let mut host = Session::service_host(HostConfig { password: Vec::new(), capacity: 5 });
        assert!(!host.kick_client(ClientId(1), 0.));
        assert!(host.take_service_commands().is_empty());
    }

    #[test]
    fn locked_hero_denial_flushes_the_peer_and_keeps_the_transport_for_rejection_drain() {
        let mut host = Session::service_host(HostConfig { password: Vec::new(), capacity: 2 });
        let client = host.service_peer_open(73).unwrap();
        let request = JoinRequest::current(Vec::new());
        let accepted = host.server.admit(client, &request, 2.).unwrap().unwrap();
        host.collect_membership();
        host.take_party_events();
        host.take_service_commands();
        assert!(host.send_message(Some(client), NativeMessage::Lifecycle(LifecyclePacket::Accepted(accepted))));

        host.reject_hero(client, b"locked:elwynn:1".to_vec(), 2.001);

        let commands = host.take_service_commands();
        let [RelayCommand::Send { id: 73, payload: pending },
            RelayCommand::Send { id: 73, payload: denied }] = commands.as_slice() else { panic!() };
        assert!(matches!(decode_frame(&pending[9..]).unwrap().as_slice(),
            [NativeMessage::Time(_), NativeMessage::Lifecycle(LifecyclePacket::Accepted(_))]));
        assert!(matches!(decode_frame(&denied[9..]).unwrap().as_slice(),
            [NativeMessage::Lifecycle(LifecyclePacket::Denied(reason))] if reason.as_slice() == b"locked:elwynn:1"));
        assert_eq!(host.peers[0].id, client);
        assert_eq!(host.server.clients()[0].closing_since, Some(2.001));
        assert!(matches!(host.take_party_events().as_slice(),
            [PartyEvent::Membership(MembershipEvent::Left { client: id, .. })] if *id == client));
    }

    #[test]
    fn lobby_pong_cannot_seed_a_latency_sample_before_join_admission() {
        let mut host = Session::service_host(HostConfig { password: Vec::new(), capacity: 2 });
        let client = host.service_peer_open(77).unwrap();
        host.begin_host_tick(1.0);
        host.host_tick.as_mut().unwrap().pending
            .push_back(NativeMessage::Lifecycle(LifecyclePacket::Pong(0)));
        while host.next_host_event().is_some() {}
        assert_eq!(host.peer_lobby_metadata(client).0, None);
        let request = super::super::server_party::JoinRequest::current(Vec::new());
        assert!(host.server.admit(client, &request, 1.1).unwrap().is_ok());
        host.begin_host_tick(2.0);
        host.host_tick.as_mut().unwrap().pending
            .push_back(NativeMessage::Lifecycle(LifecyclePacket::Pong(1950)));
        while host.next_host_event().is_some() {}
        assert_eq!(host.peer_lobby_metadata(client).0, Some(50));
    }

    #[test]
    fn lobby_rtt_prefers_live_transport_rounds_before_conversion_and_smooths_integers() {
        assert_eq!(lobby_ping_sample(5000, 0, Some(10.5), None), Some(11));
        assert_eq!(lobby_ping_sample(5000, 0, Some(10.5), Some(20)), Some(17));
        assert_eq!(lobby_ping_sample(4, u32::MAX - 5, None, None), Some(10));
        assert_eq!(lobby_ping_sample(10000, 0, None, Some(42)), Some(42));
        assert_eq!(lobby_ping_sample(0, 0, Some(9999.49), None), Some(9999));
        assert_eq!(lobby_ping_sample(0, 0, Some(9999.5), None), None);
        assert_eq!(lobby_ping_sample(0, 0, Some(f32::NAN), None), Some(0));
    }

    #[test]
    fn transport_sample_selects_dynamic_presence_without_readiness_fallback() {
        let primary = Arc::new(AtomicU8::new(1));
        let secondary = Arc::new(AtomicU8::new(1));
        let mut samples = ServiceRttSources {
            primary: Some((primary.clone(), Arc::new(Mutex::new(HashMap::from([(7, 5.), (8, 12.)]))))),
            secondary: Some((secondary.clone(), Arc::new(Mutex::new(HashMap::from([(7, 80.)]))))),
        };
        assert_eq!(samples.sample(7), Some(80.));
        secondary.store(0, Ordering::Release);
        assert_eq!(samples.sample(7), Some(80.));
        assert_eq!(samples.sample(8), None);
        samples.secondary = None;
        assert_eq!(samples.sample(7), Some(5.));
        primary.store(2, Ordering::Release);
        assert_eq!(samples.sample(7), Some(5.));
    }

    #[test]
    fn country_updates_are_dynamic_and_outlive_endpoint_close_until_hosted_reset() {
        let peers = RelayPeers::default();
        let protocol = RelayProtocol::default();
        let flags = SharedGuestFlags::default();
        service_peer_open(&protocol, &peers, 12);
        let connection = Connection::relay(12, false, peers.clone(), protocol, flags);
        service_country(&peers, 12, "\u{2003}gb\n");
        assert_eq!(connection.country(), "GB");
        service_peer_closed(&peers, 12);
        assert_eq!(connection.country(), "GB");
        service_country(&peers, 12, "XX");
        assert_eq!(connection.country(), "");
        service_country(&peers, 12, "US");
        service_country_reset(&peers);
        assert_eq!(connection.country(), "");
    }

    #[test]
    fn fresh_party_admission_discards_guest_input_and_flags_before_the_new_handle() {
        for (active, joined) in [(false, false), (true, false), (false, true), (true, true)] {
            let protocol = RelayProtocol::default();
            let flags = SharedGuestFlags::default();
            {
                let mut guest = flags.lock().unwrap();
                guest.active = active;
                guest.reconnecting = true;
                guest.fatal = true;
                guest.received.push_back(b"previous party".to_vec());
            }
            let mut first =
                Session::service_join_with_flags(Vec::new(), protocol.clone(), flags.clone());
            first.take_service_commands();
            service_party_reset(&protocol, &flags, joined);
            {
                let guest = flags.lock().unwrap();
                assert_eq!(guest.active, active || joined);
                assert!(!guest.reconnecting);
                assert!(!guest.fatal);
                assert!(guest.received.is_empty());
            }
            let mut second =
                Session::service_join_with_flags(Vec::new(), protocol.clone(), flags.clone());
            let RelayCommand::Send { payload, .. } = second.take_service_commands().remove(0)
            else {
                panic!()
            };
            assert_eq!(u64::from_le_bytes(payload[1..9].try_into().unwrap()), 1);
            assert_eq!(second.upstream.as_mut().unwrap().receive(), None);
        }
    }

    #[test]
    fn envelope_admission_keeps_peer_zero_on_the_guest_route() {
        let mut host = Session::service_host(HostConfig {
            password: Vec::new(),
            capacity: 5,
        });
        host.service_peer_open(0).unwrap();
        host.service_peer_open(7).unwrap();
        assert!(!host.service_receive(0, crate::coop::relay::data(1, b"reserved")));
        assert!(host.service_receive(7, vec![0, 1]));
        assert_eq!(host.peers[1].connection.receive(), None);
        assert!(host.service_receive(7, crate::coop::relay::data(1, b"first")));
        assert!(host.service_receive(7, crate::coop::relay::data(1, b"duplicate")));
        assert_eq!(host.peers[1].connection.receive(), Some(b"first".to_vec()));
        assert_eq!(host.peers[1].connection.receive(), None);
    }

    #[test]
    fn encoded_payloads_precede_close_and_overflow_is_fatal_for_a_guest() {
        let mut guest = Session::service_join(Vec::new());
        guest.close();
        let commands = guest.take_service_commands();
        assert!(matches!(
            commands.as_slice(),
            [RelayCommand::Send { .. }, RelayCommand::GuestLeave]
        ));
        let mut guest = Session::service_join(Vec::new());
        guest.take_service_commands();
        guest.service_receive(0, crate::coop::relay::data(1, b"buffered"));
        guest
            .upstream
            .as_mut()
            .unwrap()
            .send(&vec![0; 16 * 1024 * 1024 + 1]);
        assert!(!guest.upstream.as_ref().unwrap().is_alive());
        assert_eq!(
            guest.upstream.as_mut().unwrap().receive(),
            Some(b"buffered".to_vec())
        );
        guest.close();
        assert_eq!(
            guest.take_service_commands(),
            vec![RelayCommand::GuestLeave]
        );
    }

    #[test]
    fn off_host_endpoints_keep_backlog_input_and_flags_for_later_handles() {
        let protocol = RelayProtocol::default();
        let hosts = RelayPeers::default();
        service_peer_open(&protocol, &hosts, 7);
        assert!(service_host_receive(
            &protocol,
            &hosts,
            7,
            &crate::coop::relay::data(1, b"old")
        ));
        service_peer_open(&protocol, &hosts, 7);
        assert!(service_host_receive(
            &protocol,
            &hosts,
            7,
            &crate::coop::relay::data(1, b"new")
        ));
        service_peer_reconnecting(&hosts, 7, true);
        let mut host = Session::service_host_with_relay(
            HostConfig {
                password: Vec::new(),
                capacity: 5,
            },
            protocol,
        );
        host.share_relay_peers(hosts.clone());
        assert_eq!(host.accept_service_peers().len(), 2);
        assert!(hosts.lock().unwrap().waiting.is_empty());
        assert_eq!(host.peers[0].connection.receive(), Some(b"new".to_vec()));
        assert_eq!(host.peers[1].connection.receive(), None);
        assert!(
            host.peers
                .iter()
                .all(|peer| peer.connection.is_reconnecting())
        );
        let flags = SharedGuestFlags::default();
        flags.lock().unwrap().active = true;
        flags.lock().unwrap().reconnecting = true;
        service_relay_reset(&host.relay_protocol, &hosts, &flags);
        assert!(!flags.lock().unwrap().reconnecting);
        assert!(
            host.peers
                .iter()
                .all(|peer| !peer.connection.is_reconnecting())
        );
        assert!(
            host.relay_protocol
                .lock()
                .unwrap()
                .take_outgoing()
                .iter()
                .any(|(id, bytes)| *id == 7 && bytes[0] == 2 && bytes[9] == 0)
        );
    }

    #[test]
    fn guest_sequence_survives_handles_until_the_service_peer_open_event() {
        let protocol = RelayProtocol::default();
        let mut first = Session::service_join_with_relay(Vec::new(), protocol.clone());
        let RelayCommand::Send { payload, .. } = first.take_service_commands().remove(0) else {
            panic!()
        };
        assert_eq!(u64::from_le_bytes(payload[1..9].try_into().unwrap()), 1);
        first.close();
        first.take_service_commands();
        let mut second = Session::service_join_with_relay(Vec::new(), protocol.clone());
        let RelayCommand::Send { payload, .. } = second.take_service_commands().remove(0) else {
            panic!()
        };
        assert_eq!(u64::from_le_bytes(payload[1..9].try_into().unwrap()), 2);
        protocol.lock().unwrap().peer_open(0);
        second.close();
        second.take_service_commands();
        let mut third = Session::service_join_with_relay(Vec::new(), protocol);
        let RelayCommand::Send { payload, .. } = third.take_service_commands().remove(0) else {
            panic!()
        };
        assert_eq!(u64::from_le_bytes(payload[1..9].try_into().unwrap()), 1);
    }

    #[test]
    fn guest_inbox_and_sequence_admission_survive_leave_and_off_delivery() {
        let protocol = RelayProtocol::default();
        let flags = SharedGuestFlags::default();
        flags.lock().unwrap().active = true;
        let mut first = Session::service_join_with_relay(Vec::new(), protocol.clone());
        first.share_guest_flags(flags.clone());
        first.service_receive(0, crate::coop::relay::data(1, b"before Leave"));
        first.close();
        first.take_service_commands();
        assert!(service_guest_receive(
            &protocol,
            &flags,
            &crate::coop::relay::data(2, b"while Off")
        ));
        let mut second = Session::service_join_with_relay(Vec::new(), protocol.clone());
        second.share_guest_flags(flags.clone());
        assert_eq!(
            second.upstream.as_mut().unwrap().receive(),
            Some(b"before Leave".to_vec())
        );
        assert_eq!(
            second.upstream.as_mut().unwrap().receive(),
            Some(b"while Off".to_vec())
        );
        second.service_receive(0, crate::coop::relay::data(2, b"duplicate"));
        assert_eq!(second.upstream.as_mut().unwrap().receive(), None);
        flags.lock().unwrap().active = false;
        assert!(!service_guest_receive(
            &protocol,
            &flags,
            &crate::coop::relay::data(3, b"after Closed27")
        ));
    }

    #[test]
    fn guest_fatal_overflow_belongs_to_the_service_and_survives_a_new_handle() {
        let protocol = RelayProtocol::default();
        let flags = SharedGuestFlags::default();
        flags.lock().unwrap().active = true;
        let mut first = Session::service_join_with_relay(Vec::new(), protocol.clone());
        first.share_guest_flags(flags.clone());
        first
            .upstream
            .as_mut()
            .unwrap()
            .send(&vec![0; 16 * 1024 * 1024 + 1]);
        assert!(flags.lock().unwrap().fatal);
        first.close();
        let mut second = Session::service_join_with_relay(Vec::new(), protocol);
        second.share_guest_flags(flags);
        assert!(!second.upstream.as_ref().unwrap().is_alive());
        assert!(
            Session::service_join(Vec::new())
                .upstream
                .as_ref()
                .unwrap()
                .is_alive()
        );
        // Initial Join must use the real service flags before its first send.
        let protocol = RelayProtocol::default();
        assert!(
            protocol
                .lock()
                .unwrap()
                .queue(0, &vec![0; 16 * 1024 * 1024], Instant::now())
        );
        let flags = SharedGuestFlags::default();
        flags.lock().unwrap().active = true;
        let joined = Session::service_join_with_flags(Vec::new(), protocol, flags.clone());
        assert!(flags.lock().unwrap().fatal);
        assert!(!joined.upstream.as_ref().unwrap().is_alive());
    }

    #[test]
    fn local_secondary_retry_change_is_separate_and_cached() {
        let mut guest = Session::service_join(Vec::new());
        guest.service_relay_retrying(true);
        assert_eq!(guest.take_relay_retry_change(), Some(true));
        assert_eq!(guest.take_relay_retry_change(), None);
        guest.service_relay_retrying(false);
        assert_eq!(guest.take_relay_retry_change(), Some(false));
        guest.service_relay_retrying(true);
        guest.take_relay_retry_change();
        guest.close();
        assert_eq!(guest.take_relay_retry_change(), None);
        let mut host = Session::service_host(HostConfig {
            password: Vec::new(),
            capacity: 5,
        });
        host.service_relay_retrying(true);
        assert_eq!(host.take_relay_retry_change(), None);
        host.service_peer_open(7).unwrap();
        host.service_peer_closed(7);
        assert_eq!(host.take_relay_retry_change(), Some(true));
        host.service_relay_retrying(false);
        assert_eq!(host.take_relay_retry_change(), None);
        host.service_peer_open(8).unwrap();
        assert_eq!(host.take_relay_retry_change(), Some(false));
    }
}

#[cfg(test)]
mod reconnection_tests {
    use super::*;
    use crate::coop::server_party::NativeHero;

    #[test]
    fn temporary_retry_keeps_the_admitted_member_until_permanent_departure_drains() {
        let mut host = Session::service_host(HostConfig {
            password: Vec::new(),
            capacity: 5,
        });
        let client = host.service_peer_open(7).unwrap();
        assert!(
            host.server
                .admit(client, &JoinRequest::current(Vec::new()), 0.)
                .unwrap()
                .is_ok()
        );
        host.tick(0.);
        host.take_party_events();
        host.service_peer_reconnecting(7, true);
        host.tick(1000.);
        assert!(
            host.server
                .clients()
                .iter()
                .any(|row| row.id == client && row.joined)
        );
        assert!(host.take_party_events().is_empty());
        host.service_peer_reconnecting(7, false);
        host.tick(1001.);
        assert!(
            host.server
                .clients()
                .iter()
                .any(|row| row.id == client && row.joined)
        );
        assert!(host.take_party_events().is_empty());
        let buffered =
            encode_lifecycle(&LifecyclePacket::EventBytes(b"buffered".to_vec())).unwrap();
        host.relay_peers
            .lock()
            .unwrap()
            .peers
            .get_mut(&7)
            .unwrap()
            .received
            .extend(std::iter::repeat_n(
                buffered,
                MAX_MESSAGES_PER_CLIENT_TICK + 1,
            ));
        service_peer_departed(&host.relay_protocol, &host.relay_peers, 7);
        host.tick(1002.);
        assert!(
            host.server
                .clients()
                .iter()
                .any(|row| row.id == client && row.joined)
        );
        assert!(host.take_party_events().is_empty());
        host.tick(1003.);
        assert!(!host.server.clients().iter().any(|row| row.id == client));
        assert!(
            matches!(host.take_party_events().as_slice(), [PartyEvent::Membership(MembershipEvent::Left { client: departed, .. }), PartyEvent::Removed { client: removed, .. }] if *departed == client && *removed == client)
        );
        // Dropping the native handle releases its shared owner; it does not
        // delete the retained service endpoint or turn departure into Kick.
        assert!(host.relay_peers.lock().unwrap().peers.contains_key(&7));
        assert!(host.take_service_commands().iter().all(|command| !matches!(
            command,
            RelayCommand::Close { .. } | RelayCommand::Leave | RelayCommand::GuestLeave
        )));
    }

    fn assigned_host(ids: &[u32]) -> (Session, Vec<ClientId>) {
        let mut host = Session::service_host(HostConfig {
            password: Vec::new(),
            capacity: 5,
        });
        let mut clients = Vec::new();
        for id in ids {
            let client = host.service_peer_open(*id).unwrap();
            assert!(
                host.server
                    .admit(client, &JoinRequest::current(Vec::new()), 0.)
                    .unwrap()
                    .is_ok()
            );
            assert!(host.server.world_hero_added(client, 100 + u64::from(*id)));
            clients.push(client);
        }
        host.tick(0.);
        host.take_party_events();
        (host, clients)
    }

    fn inbox(host: &mut Session, id: u32, packets: &[LifecyclePacket]) {
        let mut peers = host.relay_peers.lock().unwrap();
        for packet in packets {
            peers
                .peers
                .get_mut(&id)
                .unwrap()
                .received
                .push_back(encode_lifecycle(packet).unwrap());
        }
    }

    #[test]
    fn disconnect_requires_a_joined_transport_row() {
        let (mut host, clients) = assigned_host(&[7]);
        let waiting = host.service_peer_open(8).unwrap();
        inbox(&mut host, 8, &[LifecyclePacket::Disconnect]);
        host.tick(1.);
        assert!(host.server.clients().iter().any(|row| row.id == waiting));

        inbox(&mut host, 7, &[LifecyclePacket::Disconnect]);
        host.tick(2.);
        assert!(!host.server.clients().iter().any(|row| row.id == clients[0]));
    }

    #[test]
    fn sync_then_later_departure_keeps_the_actual_row_until_application_returns() {
        let (mut host, clients) = assigned_host(&[7, 8]);
        inbox(
            &mut host,
            7,
            &[LifecyclePacket::Synchronize, LifecyclePacket::Synchronize],
        );
        service_peer_departed(&host.relay_protocol, &host.relay_peers, 8);
        host.begin_host_tick(1.);
        assert!(
            matches!(host.next_host_event(), Some(PartyEvent::Incoming(IncomingMessage {
            client: Some(client), message: NativeMessage::Lifecycle(LifecyclePacket::Synchronize),
        })) if client == clients[0])
        );
        assert!(host.server.clients().iter().any(|row| row.id == clients[1]));
        // The application completes the stream before the next wire request.
        assert!(host.synchronize(clients[0], Vec::new()));
        assert!(
            matches!(host.next_host_event(), Some(PartyEvent::Membership(
            MembershipEvent::Left { client, .. })) if client == clients[1])
        );
        assert!(
            matches!(host.next_host_event(), Some(PartyEvent::Removed { client, .. })
            if client == clients[1])
        );
        assert!(host.next_host_event().is_none()); // repeated Sync was rejected
    }

    #[test]
    fn earlier_departure_precedes_later_sync_and_each_removal_keeps_its_view() {
        let (mut host, clients) = assigned_host(&[7, 8, 9]);
        service_peer_departed(&host.relay_protocol, &host.relay_peers, 7);
        service_peer_departed(&host.relay_protocol, &host.relay_peers, 8);
        inbox(&mut host, 9, &[LifecyclePacket::Synchronize]);
        host.begin_host_tick(1.);
        assert!(
            matches!(host.next_host_event(), Some(PartyEvent::Membership(
            MembershipEvent::Left { client, .. })) if client == clients[0])
        );
        let Some(PartyEvent::Removed { clients: first, .. }) = host.next_host_event() else {
            panic!("first removal")
        };
        assert_eq!(
            first.iter().map(|row| row.id).collect::<Vec<_>>(),
            clients[1..]
        );
        assert!(!first[0].reconnecting); // dead endpoint still has the sampled cache
        assert!(
            matches!(host.next_host_event(), Some(PartyEvent::Membership(
            MembershipEvent::Left { client, .. })) if client == clients[1])
        );
        let Some(PartyEvent::Removed {
            clients: second, ..
        }) = host.next_host_event()
        else {
            panic!("second removal")
        };
        assert_eq!(
            second.iter().map(|row| row.id).collect::<Vec<_>>(),
            clients[2..]
        );
        assert!(
            matches!(host.next_host_event(), Some(PartyEvent::Incoming(IncomingMessage {
            client: Some(client), message: NativeMessage::Lifecycle(LifecyclePacket::Synchronize),
        })) if client == clients[2])
        );
        assert!(host.synchronize(clients[2], Vec::new()));
        assert!(host.next_host_event().is_none());
    }

    #[test]
    fn a_profile_does_not_admit_sync_before_the_world_owner_assigns_an_actor() {
        let (mut host, clients) = assigned_host(&[7]);
        assert!(host.server.world_hero_removed(clients[0]));
        // Reuse an ordinary profile fixture; Session does not invent its world.
        let hero = NativeHero {
            guid: 107,
            name: b"Peer".to_vec(),
            class: 1,
            race: 1,
            sex: 0,
            features: [0; 5],
            words_188: [0; 19],
            optional_words_b8: [None; 19],
            equipment_stars: [0; 19],
            pity: Vec::new(),
            heroic_unlocks: Vec::new(),
            weapon_glow: 0,
            bytes_18: Vec::new(),
            words_170: [0; 2],
            bytes_17e: [0; 2],
            float_178_bits: 0,
            key_150: Vec::new(),
            rank_158: 0,
            key_160: Vec::new(),
            rank_168: 0,
            bytes_17c: [0; 2],
            cooperative_luck_bits: 0,
            bytes_1d8: [0; 3],
            profile: None,
            achievement_points: 0,
            byte_1e3: 0,
            bytes_30: b"en".to_vec(),
        };
        inbox(
            &mut host,
            7,
            &[
                LifecyclePacket::Hero(Box::new(hero)),
                LifecyclePacket::Synchronize,
            ],
        );
        host.begin_host_tick(1.);
        assert!(matches!(
            host.next_host_event(),
            Some(PartyEvent::Incoming(IncomingMessage {
                message: NativeMessage::Lifecycle(LifecyclePacket::Hero(_)),
                ..
            }))
        ));
        // Hero storage is not actor assignment. The native caller ignores the
        // same-batch Sync rather than deferring it past later world bootstrap.
        assert!(host.next_host_event().is_none());
        assert!(!host.synchronize(clients[0], Vec::new()));
        assert!(host.server.world_hero_added(clients[0], 107));
        inbox(&mut host, 7, &[LifecyclePacket::Synchronize]);
        host.begin_host_tick(2.);
        assert!(matches!(
            host.next_host_event(),
            Some(PartyEvent::Incoming(IncomingMessage {
                message: NativeMessage::Lifecycle(LifecyclePacket::Synchronize),
                ..
            }))
        ));
        assert!(host.synchronize(clients[0], Vec::new()));
        assert!(host.next_host_event().is_none());
    }

    #[test]
    fn permanent_departure_drops_replay_but_preserves_the_delivered_inbox() {
        let mut host = Session::service_host(HostConfig {
            password: Vec::new(),
            capacity: 5,
        });
        host.service_peer_open(11).unwrap();
        host.service_peer_reconnecting(11, true);
        host.relay_peers
            .lock()
            .unwrap()
            .peers
            .get_mut(&11)
            .unwrap()
            .received
            .push_back(b"already delivered".to_vec());
        let now = Instant::now();
        host.relay_protocol.lock().unwrap().set_connected(false);
        assert!(
            host.relay_protocol
                .lock()
                .unwrap()
                .queue(11, b"stale pending", now)
        );
        service_peer_departed(&host.relay_protocol, &host.relay_peers, 11);
        let peers = host.relay_peers.lock().unwrap();
        let peer = peers.peers.get(&11).unwrap();
        assert!(!peer.alive && peer.reconnecting);
        assert_eq!(
            peer.received.front().unwrap().as_slice(),
            b"already delivered"
        );
        drop(peers);
        // Buffered game commands cannot recreate the departed peer's inner row.
        host.peers[0].connection.send(b"late buffered response");
        let mut protocol = host.relay_protocol.lock().unwrap();
        protocol.set_connected(true);
        assert!(protocol.queue(11, b"fresh", now));
        assert_eq!(
            protocol.take_outgoing(),
            [(11, super::super::relay::data(1, b"fresh"))]
        );
    }

    #[test]
    fn departure_without_an_outer_endpoint_still_removes_only_its_inner_row() {
        let protocol = RelayProtocol::default();
        let peers = RelayPeers::default();
        let now = Instant::now();
        protocol.lock().unwrap().set_connected(false);
        assert!(protocol.lock().unwrap().queue(11, b"gone", now));
        assert!(protocol.lock().unwrap().queue(22, b"retained", now));
        service_peer_departed(&protocol, &peers, 11);
        assert!(peers.lock().unwrap().peers.is_empty());
        let mut protocol = protocol.lock().unwrap();
        protocol.set_connected(true);
        assert!(protocol.queue(11, b"fresh", now));
        assert!(protocol.queue(22, b"next", now));
        let outgoing = protocol.take_outgoing();
        assert_eq!(outgoing.len(), 3);
        assert!(outgoing.contains(&(11, super::super::relay::data(1, b"fresh"))));
        assert!(outgoing.contains(&(22, super::super::relay::data(1, b"retained"))));
        assert!(outgoing.contains(&(22, super::super::relay::data(2, b"next"))));
    }

    #[test]
    fn local_leave_keeps_service_flags_and_rejoin_starts_a_fresh_sample_cache() {
        let flags = SharedGuestFlags::default();
        flags.lock().unwrap().active = true;
        let mut first = Session::service_join(Vec::new());
        first.share_guest_flags(flags.clone());
        first.service_peer_reconnecting(0, true);
        assert_eq!(
            first.take_reconnection_changes(),
            [ReconnectionChange::Host(true)]
        );
        first.close();
        assert!(flags.lock().unwrap().active);
        flags.lock().unwrap().control(true);
        assert!(flags.lock().unwrap().reconnecting);
        let mut second = Session::service_join(Vec::new());
        second.share_guest_flags(flags.clone());
        assert_eq!(
            second.take_reconnection_changes(),
            [ReconnectionChange::Host(true)]
        );
        second.service_party_closed();
        assert!(!flags.lock().unwrap().active);
        assert!(flags.lock().unwrap().reconnecting);
        flags.lock().unwrap().control(true);
        assert!(!flags.lock().unwrap().reconnecting);
    }

    #[test]
    fn guest_controls_sample_final_state_without_closing_or_dropping_packets() {
        let mut guest = Session::service_join(Vec::new());
        guest
            .guest_flags
            .lock()
            .unwrap()
            .received
            .push_back(vec![9]);
        guest.service_peer_reconnecting(0, true);
        guest.service_peer_reconnecting(0, false);
        assert!(guest.take_reconnection_changes().is_empty());
        guest.service_peer_reconnecting(0, true);
        assert_eq!(
            guest.take_reconnection_changes(),
            [ReconnectionChange::Host(true)]
        );
        assert!(guest.take_reconnection_changes().is_empty());
        assert!(guest.connected());
        assert_eq!(guest.upstream.as_mut().unwrap().receive(), Some(vec![9]));
        guest.service_peer_reconnecting(0, false);
        assert_eq!(
            guest.take_reconnection_changes(),
            [ReconnectionChange::Host(false)]
        );
        assert!(guest.connected());
    }

    #[test]
    fn host_controls_leave_unknown_and_dead_peers_alone_and_share_reopened_state() {
        let mut host = Session::service_host(HostConfig {
            password: Vec::new(),
            capacity: 5,
        });
        host.service_peer_reconnecting(77, true);
        assert!(host.relay_peers.lock().unwrap().peers.is_empty());
        let old = host.service_peer_open(77).unwrap();
        host.service_peer_reconnecting(77, true);
        assert_eq!(
            host.take_reconnection_changes(),
            [ReconnectionChange::Peer {
                client: old,
                reconnecting: true
            }]
        );
        host.service_peer_open(77).unwrap();
        assert_eq!(
            host.take_reconnection_changes(),
            [ReconnectionChange::Peer {
                client: old,
                reconnecting: false
            }]
        );
        host.service_peer_closed(77);
        host.service_peer_reconnecting(77, true);
        assert!(host.take_reconnection_changes().is_empty());
        assert!(host.peers.iter().all(|p| !p.connection.is_reconnecting()));
    }

    #[test]
    fn selected_transport_reset_clears_flags_without_erasing_live_endpoints() {
        let mut host = Session::service_host(HostConfig {
            password: Vec::new(),
            capacity: 5,
        });
        let client = host.service_peer_open(8).unwrap();
        host.service_peer_reconnecting(8, true);
        host.take_reconnection_changes();
        host.service_relay_reset();
        assert_eq!(
            host.take_reconnection_changes(),
            [ReconnectionChange::Peer {
                client,
                reconnecting: false
            }]
        );
        assert!(host.peers[0].connection.is_alive());
        let zero = host.service_peer_open(0).unwrap();
        host.service_peer_reconnecting(0, true);
        assert!(!host.take_reconnection_changes().iter().any(
            |change| matches!(change, ReconnectionChange::Peer { client, .. } if *client == zero)
        ));
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn initial_relay_failure_reason_is_guest_only() {
        let mut guest = Session::service_join(Vec::new());
        assert!(!guest.relay_unreachable());
        guest.service_relay_initial_failure(true);
        assert!(guest.relay_unreachable());
        guest.service_relay_initial_failure(false);
        assert!(!guest.relay_unreachable());
        let mut direct = Session::empty();
        direct.service_relay_initial_failure(true);
        assert!(!direct.relay_unreachable());
        let mut host = Session::service_host(HostConfig {
            password: Vec::new(),
            capacity: 5,
        });
        host.service_relay_initial_failure(true);
        assert!(!host.relay_unreachable());
    }

    #[test]
    fn service_packets_reach_native_admission_without_tcp_framing() {
        let mut host = Session::service_host(HostConfig {
            password: b"secret".to_vec(),
            capacity: 3,
        });
        let client = host.service_peer_open(77).unwrap();
        let mut guest = Session::service_join(b"secret".to_vec());
        let commands = guest.take_service_commands();
        let [RelayCommand::Send { id: 0, payload }] = commands.as_slice() else {
            panic!("guest must send the real native handshake through endpoint0")
        };
        assert_eq!(&payload[..9], &[0, 1, 0, 0, 0, 0, 0, 0, 0]);
        assert_eq!(payload[9], 1);
        assert!(host.service_receive(77, payload.clone()));
        host.tick(0.1);
        assert!(
            host.server
                .clients()
                .iter()
                .any(|row| row.id == client && row.joined)
        );
        let commands = host.take_service_commands();
        let [RelayCommand::Send { id: 77, payload }] = commands.as_slice() else {
            panic!("host acceptance must retain its service-assigned peer id")
        };
        assert!(guest.service_receive(0, payload.clone()));
        guest.tick(0.1);
        assert_eq!(guest.accepted().unwrap().capacity, 3);
        assert!(host.connected());
        assert!(guest.connected());
    }

    #[test]
    fn service_denial_drains_then_closes_the_actual_peer() {
        let mut host = Session::service_host(HostConfig {
            password: b"correct".to_vec(),
            capacity: 2,
        });
        host.service_peer_open(91).unwrap();
        let mut guest = Session::service_join(b"wrong".to_vec());
        let RelayCommand::Send { payload, .. } = guest.take_service_commands().remove(0) else {
            panic!("missing handshake")
        };
        host.service_receive(91, payload);
        host.tick(0.1);
        let commands = host.take_service_commands();
        assert!(matches!(
            commands.as_slice(),
            [RelayCommand::Send { id: 91, .. }]
        ));
        let RelayCommand::Send { payload, .. } = &commands[0] else {
            unreachable!()
        };
        guest.service_receive(0, payload.clone());
        guest.tick(0.1);
        assert!(guest.denial.is_some());
        assert!(!guest.connected());
        assert_eq!(
            guest.take_service_commands(),
            vec![RelayCommand::GuestLeave]
        );
        assert_eq!(host.server.clients().len(), 1);
        host.tick(10.1);
        assert!(host.take_service_commands().is_empty());
        host.tick(10.100_001);
        assert_eq!(
            host.take_service_commands(),
            vec![RelayCommand::Close { id: 91 }]
        );
        assert!(host.server.clients().is_empty());
    }

    #[test]
    fn service_remote_close_preserves_queued_packets_and_never_echoes_leave() {
        let mut guest = Session::service_join(Vec::new());
        guest.take_service_commands();
        let accepted = LifecyclePacket::Accepted(JoinAccepted {
            slot: 2,
            capacity: 4,
        });
        let payload = encode_lifecycle(&accepted).unwrap();
        assert!(guest.service_receive(0, crate::coop::relay::data(1, &payload)));
        guest.service_lost();
        guest.tick(0.1);
        assert!(!guest.connected());
        assert_eq!(guest.take_messages().len(), 1);
        guest.close();
        assert!(guest.take_service_commands().is_empty());

        let mut guest = Session::service_join(Vec::new());
        guest.take_service_commands();
        guest.close();
        assert_eq!(
            guest.take_service_commands(),
            vec![RelayCommand::GuestLeave]
        );
    }

    #[test]
    fn repeated_service_id_replaces_the_shared_queue_for_every_native_handle() {
        let mut host = Session::service_host(HostConfig {
            password: Vec::new(),
            capacity: 5,
        });
        let old = host.service_peer_open(7).unwrap();
        host.service_receive(7, crate::coop::relay::data(1, b"discarded old queue"));
        host.service_peer_closed(7);
        let new = host.service_peer_open(7).unwrap();
        assert_ne!(old, new);
        host.service_receive(7, crate::coop::relay::data(1, b"latest queue"));
        //1458178eb replaces Map[id]; native handles retain (shared Arc,id),
        //so the older handle also reads the newly installed queue.
        assert_eq!(
            host.peers[0].connection.receive(),
            Some(b"latest queue".to_vec())
        );
        assert_eq!(host.peers[1].connection.receive(), None);
        assert!(host.peers.iter().all(|peer| peer.connection.is_alive()));
        host.service_peer_closed(7);
        assert!(host.peers.iter().all(|peer| !peer.connection.is_alive()));
    }

    #[test]
    fn service_party_closed_preserves_primary_and_native_host_role() {
        let mut host = Session::service_host(HostConfig {
            password: Vec::new(),
            capacity: 5,
        });
        host.service_party_closed();
        assert!(host.is_hosting());
        assert!(host.connected());
        assert!(host.take_service_commands().is_empty());
        host.service_peer_open(7).unwrap();
        host.service_peer_closed(7);
        //Closed27 leaves the host map intact. Native wire26 still appends
        //to an existing host peer even after its alive flag was cleared.
        assert!(host.service_receive(7, crate::coop::relay::data(1, b"host queued after close")));
        assert_eq!(
            host.peers[0].connection.receive(),
            Some(b"host queued after close".to_vec())
        );

        let mut guest = Session::service_join(Vec::new());
        guest.take_service_commands();
        let accepted = LifecyclePacket::Accepted(JoinAccepted {
            slot: 1,
            capacity: 5,
        });
        guest.service_receive(
            0,
            crate::coop::relay::data(1, &encode_lifecycle(&accepted).unwrap()),
        );
        guest.service_party_closed();
        let late = LifecyclePacket::EventBytes(b"arrived after Closed27".to_vec());
        assert!(!guest.service_receive(
            0,
            crate::coop::relay::data(2, &encode_lifecycle(&late).unwrap())
        ));
        guest.tick(0.1);
        assert_eq!(guest.take_messages().len(), 1);
        assert!(!guest.connected());
        guest.close();
        assert_eq!(
            guest.take_service_commands(),
            vec![RelayCommand::GuestLeave]
        );
    }
}
