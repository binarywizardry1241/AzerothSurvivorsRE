//! Inner service relay protocol, including the 0.127.0 loss-recovery policy.
//! See docs/analysis/relay-load-0.127.0.md. The outer service codec
//! and its socket ownership remain in their existing modules.

use std::collections::{BTreeMap, HashMap, VecDeque};
use std::time::{Duration, Instant};

const SEND_RATE: f64 = 1_572_864.0;
const MAX_PENDING_BYTES: usize = 16 * 1024 * 1024;
const MAX_BUFFERED_BYTES: usize = 8 * 1024 * 1024;
const MAX_RANGE_REPLY_BYTES: usize = 256 * 1024;

#[derive(Default)]
struct Peer {
    pending: VecDeque<(u64, Vec<u8>)>,
    pending_bytes: usize,
    sent: usize,
    replay_end: usize,
    send_sequence: u64,
    receive_sequence: u64,
    acknowledged_receive: u64,
    control_pending: bool,
    control_clock: Option<Instant>,
    acknowledged_send_clock: Option<Instant>,
    buffered: BTreeMap<u64, Vec<u8>>,
    buffered_bytes: usize,
    highest_receive: u64,
    gap_clock: Option<Instant>,
    gap_request_clock: Option<Instant>,
}

impl Peer {
    fn new(now: Instant) -> Self {
        Self { acknowledged_send_clock: Some(now), ..Self::default() }
    }

    fn acknowledge(&mut self, sequence: u64, now: Instant) {
        let sequence = sequence.min(self.send_sequence);
        let mut advanced = false;
        while self.pending.front().is_some_and(|(sent, _)| *sent <= sequence) {
            let (_, payload) = self.pending.pop_front().unwrap();
            self.pending_bytes -= payload.len();
            self.sent = self.sent.saturating_sub(1);
            self.replay_end = self.replay_end.saturating_sub(1);
            advanced = true;
        }
        if advanced { self.acknowledged_send_clock = Some(now); }
    }

    /// Native145cc1c30: ask for the first hole, at most once per0.6s.
    /// A tail advertised without buffered data has a strict>10s skip boundary.
    fn missing_range(&mut self, now: Instant) -> Option<(u64, u64)> {
        let end = if let Some((&first, _)) = self.buffered.first_key_value() {
            first.wrapping_sub(1)
        } else {
            if self.highest_receive <= self.receive_sequence { return None; }
            let since = *self.gap_clock.get_or_insert(now);
            if seconds_f32(now.saturating_duration_since(since)) > 10.0 {
                self.receive_sequence = self.highest_receive;
                self.gap_clock = None;
                self.gap_request_clock = None;
                return None;
            }
            self.highest_receive
        };
        if self.gap_request_clock.is_some_and(|since| {
            seconds_f32(now.saturating_duration_since(since)) < 0.6
        }) { return None; }
        self.gap_request_clock = Some(now);
        Some((self.receive_sequence.wrapping_add(1), end))
    }

    fn receive_data(&mut self, sequence: u64, payload: &[u8], now: Instant) -> Vec<Vec<u8>> {
        let next = self.receive_sequence.wrapping_add(1);
        if self.control_pending && sequence > next { return Vec::new(); }
        self.highest_receive = self.highest_receive.max(sequence);
        if sequence <= self.receive_sequence || self.buffered.contains_key(&sequence) {
            self.acknowledged_receive = self.acknowledged_receive.min(sequence.saturating_sub(1));
            return Vec::new();
        }
        if sequence > next {
            self.buffered_bytes += payload.len();
            self.buffered.insert(sequence, payload.to_vec());
            let since = *self.gap_clock.get_or_insert(now);
            if self.buffered_bytes <= MAX_BUFFERED_BYTES
                && seconds_f32(now.saturating_duration_since(since)) <= 10.0 {
                return Vec::new();
            }
            // Native pressure/timeout recovery drains the ordered buffered suffix.
            // Preserve this bounded fallback instead of inventing an unbounded wait.
            self.receive_sequence = *self.buffered.last_key_value().unwrap().0;
            self.buffered_bytes = 0;
            self.gap_clock = None;
            self.gap_request_clock = None;
            return std::mem::take(&mut self.buffered).into_values().collect();
        }
        self.receive_sequence = sequence;
        let mut ready = vec![payload.to_vec()];
        while let Some(payload) = self.buffered.remove(&self.receive_sequence.wrapping_add(1)) {
            self.buffered_bytes -= payload.len();
            self.receive_sequence = self.receive_sequence.wrapping_add(1);
            ready.push(payload);
        }
        self.gap_clock = if self.buffered.is_empty() { None } else { Some(now) };
        self.gap_request_clock = None;
        ready
    }
}

/// One service-wide sender budget and ACK clock; sequences and replay cursors
/// belong to individual service peer IDs, independently of game ClientIds.
pub struct Relay {
    peers: HashMap<u32, Peer>,
    credit: f64,
    credit_clock: Instant,
    ack_clock: Instant,
    connected: bool,
    outgoing: Vec<(u32, Vec<u8>)>,
}

impl Default for Relay {
    fn default() -> Self {
        Self::new(Instant::now())
    }
}

pub(super) fn data(sequence: u64, payload: &[u8]) -> Vec<u8> {
    let mut result = header(0, sequence);
    result.extend_from_slice(payload);
    result
}

fn header(tag: u8, sequence: u64) -> Vec<u8> {
    let mut result = Vec::with_capacity(9);
    result.push(tag);
    result.extend_from_slice(&sequence.to_le_bytes());
    result
}

fn range_header(tag: u8, start: u64, end: u64) -> Vec<u8> {
    let mut result = header(tag, start);
    result.extend_from_slice(&end.to_le_bytes());
    result
}

fn control(sequence: u64, response: bool) -> Vec<u8> {
    let mut result = header(2, sequence);
    result.push(u8::from(response));
    result
}

// Native control/ACK comparisons use seconds and nanoseconds converted
// separately to f32. Sender credit uses the corresponding f64 calculation.
fn seconds_f32(elapsed: Duration) -> f32 {
    elapsed.as_secs() as f32 + elapsed.subsec_nanos() as f32 / 1_000_000_000.0
}

impl Relay {
    pub(super) fn new(now: Instant) -> Self {
        Self {
            peers: HashMap::new(),
            credit: SEND_RATE,
            credit_clock: now,
            ack_clock: now,
            connected: true,
            outgoing: Vec::new(),
        }
    }

    pub fn peer_open(&mut self, id: u32) {
        self.peers.insert(id, Peer::new(Instant::now()));
    }

    /// Hosted/Joined clears the inner peer table before admitting a new party.
    /// Service transport, sender credit and clocks belong to the service lifetime.
    pub(super) fn fresh_party(&mut self) {
        self.peers.clear();
        self.outgoing.clear();
    }

    pub(super) fn remove(&mut self, id: u32) {
        self.peers.remove(&id);
    }

    /// Native host Close sends its primary Kick, then drains selected-secondary
    /// pending data before the secondary Kick and inner-row removal.
    pub fn close_peer(&mut self, id: u32, secondary: bool, now: Instant) -> Vec<(u32, Vec<u8>)> {
        let outgoing = if secondary {
            self.send_pending(now);
            self.take_outgoing()
        } else {
            Vec::new()
        };
        self.remove(id);
        outgoing
    }

    /// Native145cbee90 appends before checking the 16 MiB limit. Overflow
    /// discards this peer's relay state and makes its connection fail.
    pub(super) fn queue(&mut self, id: u32, payload: &[u8], now: Instant) -> bool {
        let peer = self.peers.entry(id).or_insert_with(|| Peer::new(now));
        peer.send_sequence = peer.send_sequence.wrapping_add(1);
        peer.pending_bytes += payload.len();
        peer.pending
            .push_back((peer.send_sequence, payload.to_vec()));
        if peer.pending_bytes > MAX_PENDING_BYTES {
            self.peers.remove(&id);
            return false;
        }
        self.send_pending(now);
        true
    }

    /// Deliver every newly contiguous payload in order, through the service-owned
    /// inbox. Data after a hole stays buffered until replay or native fallback.
    pub(super) fn receive(&mut self, id: u32, bytes: &[u8], now: Instant) -> Vec<Vec<u8>> {
        if bytes.len() < 9 || bytes[0] > 4
            || (bytes[0] == 2 && bytes.len() < 10)
            || (bytes[0] >= 3 && bytes.len() < 17) {
            return Vec::new();
        }
        let sequence = u64::from_le_bytes(bytes[1..9].try_into().unwrap());
        let peer = self.peers.entry(id).or_insert_with(|| Peer::new(now));
        let mut ready = Vec::new();
        match bytes[0] {
            0 => ready = peer.receive_data(sequence, &bytes[9..], now),
            1 => peer.acknowledge(sequence, now),
            2 => {
                peer.acknowledge(sequence, now);
                peer.sent = 0;
                peer.replay_end = peer.pending.len();
                peer.control_pending = false;
                peer.control_clock = None;
                if bytes[9] == 0 {
                    self.outgoing.push((id, control(peer.receive_sequence, true)));
                }
                return ready;
            }
            3 => {
                let end = u64::from_le_bytes(bytes[9..17].try_into().unwrap()).min(peer.send_sequence);
                peer.acknowledged_send_clock = Some(now);
                let mut bytes = 0usize;
                for (sent, payload) in peer.pending.iter().take(peer.sent) {
                    if sequence <= *sent && *sent <= end {
                        let previous = bytes;
                        bytes += payload.len();
                        if previous != 0 && bytes > MAX_RANGE_REPLY_BYTES { break; }
                        self.outgoing.push((id, data(*sent, payload)));
                    }
                }
                return ready;
            }
            4 => {
                peer.acknowledge(sequence, now);
                let sent = u64::from_le_bytes(bytes[9..17].try_into().unwrap());
                if peer.control_pending || sent <= peer.highest_receive { return ready; }
                peer.highest_receive = sent;
            }
            _ => unreachable!(),
        }
        if !peer.control_pending && bytes[0] != 1 {
            if let Some((start, end)) = peer.missing_range(now) {
                self.outgoing.push((id, range_header(3, start, end)));
            }
        }
        ready
    }

    /// Reopening/re-authenticating a selected secondary transport pauses each
    /// existing peer until the sequence handshake has completed.
    pub(super) fn reset_transport(&mut self, now: Instant) {
        for (&id, peer) in &mut self.peers {
            peer.control_pending = true;
            peer.control_clock = Some(now);
            self.outgoing
                .push((id, control(peer.receive_sequence, false)));
        }
    }

    /// The first alternate endpoint replays queued bytes without starting the
    /// admitted transport's control/reconnection exchange.
    pub(super) fn initial_fallback(&mut self) {
        for peer in self.peers.values_mut() {
            peer.sent = 0;
        }
    }

    pub fn set_connected(&mut self, connected: bool) {
        self.connected = connected;
    }

    pub fn poll(&mut self, connected: bool, now: Instant) {
        self.connected = connected;
        if connected {
            let ack_due = seconds_f32(now.saturating_duration_since(self.ack_clock)) >= 1.0;
            for (&id, peer) in &mut self.peers {
                if peer.control_pending && peer.control_clock.is_none_or(|clock| {
                    seconds_f32(now.saturating_duration_since(clock)) >= 3.0
                }) {
                    peer.control_clock = Some(now);
                    self.outgoing.push((id, control(peer.receive_sequence, false)));
                    continue;
                }
                let elapsed = peer.acknowledged_send_clock.map_or(0.0, |clock| {
                    seconds_f32(now.saturating_duration_since(clock))
                });
                if ack_due {
                    if peer.sent != 0 && !peer.control_pending && elapsed >= 1.0 {
                        let sent = peer.pending[peer.sent - 1].0;
                        peer.acknowledged_receive = peer.receive_sequence;
                        self.outgoing.push((id, range_header(4, peer.receive_sequence, sent)));
                    } else if peer.acknowledged_receive < peer.receive_sequence {
                        peer.acknowledged_receive = peer.receive_sequence;
                        self.outgoing.push((id, header(1, peer.receive_sequence)));
                    }
                }
                if !peer.control_pending {
                    if let Some((start, end)) = peer.missing_range(now) {
                        self.outgoing.push((id, range_header(3, start, end)));
                    }
                    if peer.sent != 0 && elapsed >= 5.0 {
                        peer.acknowledged_send_clock = Some(now);
                        let (sequence, payload) = peer.pending.front().unwrap();
                        self.outgoing.push((id, data(*sequence, payload)));
                    }
                }
            }
            if ack_due { self.ack_clock = now; }
        }
        self.send_pending(now);
    }

    fn send_pending(&mut self, now: Instant) {
        if !self.connected {
            return;
        }
        let elapsed = now.saturating_duration_since(self.credit_clock);
        let seconds = elapsed.as_secs() as f64 + elapsed.subsec_nanos() as f64 / 1_000_000_000.0;
        self.credit = (self.credit + seconds * SEND_RATE).min(SEND_RATE);
        self.credit_clock = now;
        for (&id, peer) in &mut self.peers {
            while !peer.control_pending && peer.sent < peer.pending.len() {
                let replay = peer.sent < peer.replay_end;
                if replay && self.credit <= 0.0 {
                    break;
                }
                let (sequence, payload) = &peer.pending[peer.sent];
                // Only the retained replay prefix uses credit. Fresh suffixes
                // bypass it; a whole replay payload may take credit below zero.
                if replay {
                    self.credit -= payload.len() as f64;
                }
                self.outgoing.push((id, data(*sequence, payload)));
                peer.sent += 1;
            }
        }
    }

    pub fn take_outgoing(&mut self) -> Vec<(u32, Vec<u8>)> {
        std::mem::take(&mut self.outgoing)
    }

    pub(super) fn lost(&mut self) {
        self.connected = false;
        self.peers.clear();
        self.outgoing.clear();
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn fresh_party_discards_old_sequences_without_restarting_the_service() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        relay.set_connected(false);
        assert!(relay.queue(7, b"previous party", now));
        relay.reset_transport(now);
        relay.credit = 3.0;
        relay.fresh_party();
        assert!(relay.peers.is_empty());
        assert!(relay.take_outgoing().is_empty());
        assert!(!relay.connected);
        assert_eq!(relay.credit, 3.0);
        assert_eq!(relay.credit_clock, now);
        assert_eq!(relay.ack_clock, now);
        assert!(relay.queue(7, b"next party", now));
        assert_eq!(relay.peers[&7].send_sequence, 1);
        assert!(!relay.peers[&7].control_pending);
    }

    #[test]
    fn initial_fallback_replays_without_an_admitted_control_exchange() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        assert!(relay.queue(7, b"handshake", now));
        assert_eq!(relay.take_outgoing(), vec![(7, data(1, b"handshake"))]);
        relay.initial_fallback();
        assert_eq!(relay.peers[&7].sent, 0);
        assert!(!relay.peers[&7].control_pending);
        assert!(relay.take_outgoing().is_empty());
        relay.poll(true, now);
        assert_eq!(relay.take_outgoing(), vec![(7, data(1, b"handshake"))]);
    }

    fn sorted_outgoing(relay: &mut Relay) -> Vec<(u32, Vec<u8>)> {
        let mut messages = relay.take_outgoing();
        messages.sort_by_key(|(id, _)| *id);
        messages
    }

    #[test]
    fn malformed_inner_frames_do_not_create_state_or_deliver_game_bytes() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        for bytes in [
            vec![],
            vec![0; 8],
            header(2, 1),
            header(3, 1),
            header(255, 1),
        ] {
            assert_eq!(relay.receive(77, &bytes, now), Vec::<Vec<u8>>::new());
        }
        assert!(relay.peers.is_empty());
        assert!(relay.take_outgoing().is_empty());

        assert_eq!(relay.receive(77, &data(1, &[]), now), vec![Vec::new()]);
        assert_eq!(relay.peers[&77].receive_sequence, 1);
    }

    #[test]
    fn forward_gap_buffers_and_replay_releases_all_objects_in_order() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        assert_eq!(relay.receive(7, &data(1, b"create"), now), vec![b"create".to_vec()]);
        assert!(relay.receive(7, &data(3, b"destroy"), now).is_empty());
        assert_eq!(relay.peers[&7].receive_sequence, 1);
        assert_eq!(relay.take_outgoing(), vec![(7, range_header(3, 2, 2))]);
        assert!(relay.receive(7, &data(3, b"duplicate"), now).is_empty());
        assert_eq!(relay.receive(7, &data(2, b"update"), now),
            vec![b"update".to_vec(), b"destroy".to_vec()]);
        assert!(relay.peers[&7].buffered.is_empty());
        assert_eq!(relay.peers[&7].buffered_bytes, 0);
        assert!(relay.take_outgoing().is_empty());
    }

    #[test]
    fn reconnect_control_preserves_buffers_but_rejects_new_forward_gaps() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        relay.receive(1, &data(2, b"held"), now);
        relay.take_outgoing();
        relay.reset_transport(now);
        assert_eq!(relay.take_outgoing(), vec![(1, control(0, false))]);
        assert!(relay.receive(1, &data(3, b"new gap"), now).is_empty());
        assert_eq!(relay.peers[&1].highest_receive, 2);
        assert_eq!(relay.receive(1, &data(1, b"next"), now),
            vec![b"next".to_vec(), b"held".to_vec()]);
        assert!(relay.take_outgoing().is_empty());
    }

    #[test]
    fn wrapped_receive_stays_older_under_current_unsigned_comparisons() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        relay.peer_open(1);
        relay.peers.get_mut(&1).unwrap().receive_sequence = u64::MAX;
        relay.peers.get_mut(&1).unwrap().send_sequence = u64::MAX;
        assert!(relay.receive(1, &data(0, b"wrapped"), now).is_empty());
        assert_eq!(relay.peers[&1].receive_sequence, u64::MAX);
        assert!(relay.queue(1, b"outgoing", now));
        assert_eq!(relay.take_outgoing(), vec![(1, data(0, b"outgoing"))]);
    }

    #[test]
    fn acknowledgements_drain_bytes_and_adjust_the_sent_cursor() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        for payload in [b"a".as_slice(), b"bb".as_slice(), b"ccc".as_slice()] {
            assert!(relay.queue(8, payload, now));
        }
        relay.take_outgoing();
        assert_eq!(relay.peers[&8].sent, 3);

        let mut acknowledgement = header(1, 1);
        acknowledgement.extend_from_slice(b"unused suffix");
        assert_eq!(relay.receive(8, &acknowledgement, now), Vec::<Vec<u8>>::new());
        let peer = &relay.peers[&8];
        assert_eq!(peer.pending.front(), Some(&(2, b"bb".to_vec())));
        assert_eq!(peer.pending.len(), 2);
        assert_eq!(peer.pending_bytes, 5);
        assert_eq!(peer.sent, 2);
        assert!(relay.take_outgoing().is_empty());

        relay.poll(false, now);
        assert!(relay.queue(8, b"unsent", now));
        relay.receive(8, &header(1, u64::MAX), now);
        let peer = &relay.peers[&8];
        assert!(peer.pending.is_empty());
        assert_eq!(peer.pending_bytes, 0);
        assert_eq!(peer.sent, 0);
    }

    #[test]
    fn control_request_replies_and_replays_only_the_unacknowledged_tail() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        assert!(relay.queue(5, b"acknowledged", now));
        assert!(relay.queue(5, b"retained", now));
        relay.take_outgoing();
        relay.receive(5, &data(1, b"inbound"), now);
        relay.reset_transport(now);
        assert_eq!(relay.take_outgoing(), vec![(5, control(1, false))]);

        assert_eq!(relay.receive(5, &control(1, false), now), Vec::<Vec<u8>>::new());
        assert_eq!(relay.take_outgoing(), vec![(5, control(1, true))]);
        let peer = &relay.peers[&5];
        assert_eq!(peer.pending.len(), 1);
        assert_eq!(peer.pending_bytes, b"retained".len());
        assert_eq!(peer.sent, 0);
        assert_eq!(peer.replay_end, 1);
        assert!(!peer.control_pending);
        assert_eq!(peer.control_clock, None);
        relay.poll(true, now);
        assert_eq!(relay.take_outgoing(), vec![(5, data(2, b"retained"))]);

        let mut response = control(1, true);
        response[9] = 9;
        response.extend_from_slice(b"unused suffix");
        relay.receive(5, &response, now);
        assert!(relay.take_outgoing().is_empty());
        assert_eq!(relay.peers[&5].sent, 0);
        relay.poll(true, now);
        assert_eq!(relay.take_outgoing(), vec![(5, data(2, b"retained"))]);
    }

    #[test]
    fn acknowledgement_deadline_is_global_one_second_and_requires_transport() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        relay.receive(1, &data(1, b"one"), now);
        relay.receive(2, &data(1, b"two"), now);
        relay.poll(true, now + Duration::from_millis(999));
        assert!(relay.take_outgoing().is_empty());
        relay.poll(false, now + Duration::from_secs(1));
        assert_eq!(relay.ack_clock, now);
        relay.poll(true, now + Duration::from_secs(1));
        assert_eq!(sorted_outgoing(&mut relay), vec![(1, header(1, 1)), (2, header(1, 1))]);
        relay.receive(3, &data(1, b"new peer"), now + Duration::from_millis(1_100));
        relay.poll(true, now + Duration::from_millis(1_999));
        assert!(relay.take_outgoing().is_empty());
        relay.poll(true, now + Duration::from_secs(2));
        assert_eq!(relay.take_outgoing(), vec![(3, header(1, 1))]);
    }

    #[test]
    fn lost_final_payload_and_ack_recover_without_transport_replacement() {
        let now = Instant::now();
        let mut sender = Relay::new(now);
        let mut receiver = Relay::new(now);
        sender.queue(1, b"bootstrap", now);
        sender.take_outgoing(); // lost final data has no later sequence to expose it
        sender.poll(true, now + Duration::from_secs(1));
        assert_eq!(sender.take_outgoing(), vec![(1, range_header(4, 0, 1))]);
        receiver.receive(1, &range_header(4, 0, 1), now + Duration::from_secs(1));
        assert_eq!(receiver.take_outgoing(), vec![(1, range_header(3, 1, 1))]);
        sender.receive(1, &range_header(3, 1, 1), now + Duration::from_secs(1));
        assert_eq!(sender.take_outgoing(), vec![(1, data(1, b"bootstrap"))]);
        assert_eq!(receiver.receive(1, &data(1, b"bootstrap"), now + Duration::from_secs(1)),
            vec![b"bootstrap".to_vec()]);
        receiver.poll(true, now + Duration::from_secs(2));
        receiver.take_outgoing(); // lost ACK
        sender.poll(true, now + Duration::from_secs(6));
        let retried = sender.take_outgoing();
        assert!(retried.contains(&(1, data(1, b"bootstrap"))));
        assert!(receiver.receive(1, &data(1, b"bootstrap"), now + Duration::from_secs(6)).is_empty());
        receiver.poll(true, now + Duration::from_secs(6));
        assert_eq!(receiver.take_outgoing(), vec![(1, header(1, 1))]);
        sender.receive(1, &header(1, 1), now + Duration::from_secs(6));
        assert!(sender.peers[&1].pending.is_empty());
    }

    #[test]
    fn range_replies_keep_first_large_payload_and_cap_following_payloads() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        relay.queue(1, &vec![1; MAX_RANGE_REPLY_BYTES + 1], now);
        relay.queue(1, b"next", now);
        relay.take_outgoing();
        relay.receive(1, &range_header(3, 1, u64::MAX), now);
        let reply = relay.take_outgoing();
        assert_eq!(reply.len(), 1);
        assert_eq!(reply[0].1.len(), MAX_RANGE_REPLY_BYTES + 10);
        assert_eq!(relay.peers[&1].sent, 2);
    }

    #[test]
    fn wide_range_request_does_not_publish_an_unsent_queue_suffix() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        assert!(relay.queue(1, b"sent", now));
        relay.take_outgoing();
        relay.poll(false, now);
        assert!(relay.queue(1, b"fresh", now));
        assert_eq!(relay.peers[&1].sent, 1);
        relay.receive(1, &range_header(3, 1, u64::MAX), now);
        assert_eq!(relay.take_outgoing(), vec![(1, data(1, b"sent"))]);
        assert_eq!(relay.peers[&1].sent, 1);
        assert_eq!(relay.peers[&1].pending.len(), 2);
    }

    #[test]
    fn gap_requests_retry_at_six_tenths_and_tail_timeout_is_strict() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        relay.receive(1, &range_header(4, 0, 2), now);
        assert_eq!(relay.take_outgoing(), vec![(1, range_header(3, 1, 2))]);
        relay.poll(true, now + Duration::from_millis(599));
        assert!(relay.take_outgoing().is_empty());
        relay.poll(true, now + Duration::from_millis(600));
        assert_eq!(relay.take_outgoing(), vec![(1, range_header(3, 1, 2))]);
        relay.poll(true, now + Duration::from_secs(10));
        assert_eq!(relay.peers[&1].receive_sequence, 0);
        relay.take_outgoing();
        relay.poll(true, now + Duration::from_millis(10_001));
        assert_eq!(relay.peers[&1].receive_sequence, 2);
    }

    #[test]
    fn pending_control_pauses_data_and_retries_at_three_seconds() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        relay.peer_open(4);
        relay.reset_transport(now);
        assert_eq!(relay.take_outgoing(), vec![(4, control(0, false))]);
        assert!(relay.queue(4, b"held", now));
        assert!(relay.take_outgoing().is_empty());
        relay.receive(4, &data(1, b"incoming"), now);
        relay.poll(true, now + Duration::from_secs(2));
        assert_eq!(relay.take_outgoing(), vec![(4, header(1, 1))]);
        relay.poll(true, now + Duration::from_millis(2_999));
        assert!(relay.take_outgoing().is_empty());
        relay.poll(true, now + Duration::from_secs(3));
        assert_eq!(relay.take_outgoing(), vec![(4, control(1, false))]);
        assert_eq!(relay.peers[&4].sent, 0);
        relay.receive(4, &control(0, true), now + Duration::from_secs(3));
        relay.poll(true, now + Duration::from_secs(3));
        assert_eq!(relay.take_outgoing(), vec![(4, data(1, b"held"))]);
    }

    #[test]
    fn only_replay_prefix_uses_shared_credit_and_fresh_suffix_keeps_its_order() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        relay.credit = 1.0;
        assert!(relay.queue(1, b"ab", now));
        assert_eq!(relay.take_outgoing(), vec![(1, data(1, b"ab"))]);
        assert_eq!(relay.credit, 1.0);
        relay.receive(1, &control(0, true), now);
        assert_eq!(relay.peers[&1].replay_end, 1);
        relay.poll(true, now);
        assert_eq!(relay.take_outgoing(), vec![(1, data(1, b"ab"))]);
        assert_eq!(relay.credit, -1.0);
        assert!(relay.queue(1, b"fresh", now));
        assert_eq!(relay.take_outgoing(), vec![(1, data(2, b"fresh"))]);
        assert_eq!(relay.credit, -1.0);
        // A later control freezes both retained messages as a replay prefix.
        relay.receive(1, &control(0, true), now);
        assert!(relay.queue(1, b"behind replay", now));
        assert!(relay.take_outgoing().is_empty());
        assert_eq!(relay.peers[&1].sent, 0);
        relay.poll(true, now + Duration::from_secs(1));
        assert_eq!(
            relay.take_outgoing(),
            vec![
                (1, data(1, b"ab")),
                (1, data(2, b"fresh")),
                (1, data(3, b"behind replay"))
            ]
        );
        assert_eq!(relay.credit, SEND_RATE - 8.0);
        relay.receive(1, &header(1, 1), now + Duration::from_secs(1));
        assert_eq!(relay.peers[&1].sent, 2);
        assert_eq!(relay.peers[&1].replay_end, 1);
        relay.receive(1, &header(1, 2), now + Duration::from_secs(1));
        assert_eq!(relay.peers[&1].replay_end, 0);
    }

    #[test]
    fn acknowledgement_is_clamped_before_draining_wrapped_sequences() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        relay.peer_open(1);
        relay.peers.get_mut(&1).unwrap().send_sequence = u64::MAX - 1;
        assert!(relay.queue(1, b"before wrap", now));
        assert!(relay.queue(1, b"wrapped", now));
        relay.take_outgoing();
        relay.receive(1, &header(1, u64::MAX), now);
        assert_eq!(relay.peers[&1].pending.len(), 2);
        assert_eq!(relay.peers[&1].sent, 2);
    }

    #[test]
    fn pending_limit_allows_exactly_sixteen_mib_then_removes_the_overflowing_peer() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        relay.poll(false, now);
        assert!(relay.queue(3, &vec![0; MAX_PENDING_BYTES], now));
        assert!(relay.queue(3, &[], now));
        assert_eq!(relay.peers[&3].pending_bytes, MAX_PENDING_BYTES);
        assert!(!relay.queue(3, &[1], now));
        assert!(!relay.peers.contains_key(&3));
        assert!(relay.take_outgoing().is_empty());
        assert!(relay.queue(3, b"fresh", now));
        assert_eq!(relay.peers[&3].send_sequence, 1);
    }

    #[test]
    fn host_close_drains_refilled_secondary_replay_before_removing_pending_state() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        assert!(relay.queue(7, b"retained", now));
        relay.take_outgoing();
        relay.receive(7, &control(0, true), now);
        relay.credit = 0.0;
        assert!(relay.queue(7, b"held", now));
        assert!(relay.take_outgoing().is_empty());
        assert_eq!(
            relay.close_peer(7, true, now + Duration::from_secs(1)),
            vec![(7, data(1, b"retained")), (7, data(2, b"held"))]
        );
        assert!(!relay.peers.contains_key(&7));
        assert!(relay.queue(8, b"retained", now + Duration::from_secs(1)));
        relay.take_outgoing();
        relay.receive(8, &control(0, true), now);
        relay.credit = 0.0;
        assert!(relay.queue(8, b"held", now + Duration::from_secs(1)));
        assert!(
            relay
                .close_peer(8, false, now + Duration::from_secs(2))
                .is_empty()
        );
        assert!(!relay.peers.contains_key(&8));
    }

    #[test]
    fn removal_reopens_cleanly_and_transport_loss_discards_outgoing_state() {
        let now = Instant::now();
        let mut relay = Relay::new(now);
        assert!(relay.queue(6, b"old", now));
        relay.take_outgoing();
        relay.receive(6, &data(1, b"old incoming"), now);
        relay.remove(6);
        relay.peer_open(6);
        assert_eq!(
            relay.receive(6, &data(1, b"new incoming"), now),
            vec![b"new incoming".to_vec()]
        );
        assert!(relay.queue(6, b"new", now));
        assert_eq!(relay.take_outgoing(), vec![(6, data(1, b"new"))]);
        relay.reset_transport(now);
        relay.lost();
        assert!(!relay.connected);
        assert!(relay.peers.is_empty());
        assert!(relay.take_outgoing().is_empty());
    }
}
