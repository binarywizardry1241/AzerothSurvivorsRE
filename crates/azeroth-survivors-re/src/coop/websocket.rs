//! Shared lobby-service transport. AS envelopes and connection policy belong to
//! the service owner. The worker contracts are bound in coop-directory-transport;
//! current raw RTT controls are bound in docs/analysis/coop-dispatch-0.127.0.md.
use std::{
    collections::{HashMap, VecDeque},
    io::ErrorKind,
    net::TcpStream,
    sync::{Arc, Mutex},
    time::{Duration, Instant},
};
use tungstenite::{Error, Message, WebSocket, stream::MaybeTlsStream};

/// Each service transport owns its live peer measurements independently.
pub type RttSamples = Arc<Mutex<HashMap<u32, f32>>>;

fn transport_micros(origin: Instant) -> u64 {
    let elapsed = origin.elapsed();
    elapsed.as_secs().wrapping_mul(1_000_000)
        .wrapping_add(u64::from(elapsed.subsec_nanos() / 1_000))
}

fn stamp_probe(bytes: &mut [u8], now_us: u64) {
    if bytes.len() >= 18 && bytes[0] == 6 && bytes[9] == 5 {
        bytes[10..18].copy_from_slice(&now_us.to_le_bytes());
    }
}

#[derive(Debug, PartialEq)]
enum TransportProbe {
    Pass,
    Reply([u8; 18]),
    Sample { peer: u32, milliseconds: f32 },
}

fn read_probe(bytes: &[u8], now_us: u64) -> TransportProbe {
    // The worker inspects raw service bytes before the directory reader; the
    // embedded length is deliberately not an additional admission condition.
    if bytes.len() < 18 || bytes[0] != 26 { return TransportProbe::Pass; }
    match bytes[9] {
        5 => {
            let mut reply: [u8; 18] = bytes[..18].try_into().unwrap();
            reply[0] = 6;
            reply[9] = 6;
            TransportProbe::Reply(reply)
        }
        6 => {
            let peer = u32::from_le_bytes(bytes[1..5].try_into().unwrap());
            let stamp = u64::from_le_bytes(bytes[10..18].try_into().unwrap());
            TransportProbe::Sample { peer,
                milliseconds: now_us.saturating_sub(stamp) as f32 / 1_000.0 }
        }
        _ => TransportProbe::Pass,
    }
}

pub enum SocketEvent {
    Text(String),
    Binary(Vec<u8>),
    Closed,
}

pub struct DirectorySocket {
    socket: WebSocket<MaybeTlsStream<TcpStream>>,
    outgoing: VecDeque<Vec<u8>>,
    rtt: RttSamples,
    clock_origin: Instant,
    activity: Instant,
    nonblocking: bool,
    idle: bool,
}

impl DirectorySocket {
    /// The handshake may block: the service worker, never an ECS system, owns it.
    pub fn connect(url: &str) -> Result<Self, String> {
        Self::connect_with_rtt(url, RttSamples::default())
    }

    pub fn connect_with_rtt(url: &str, rtt: RttSamples) -> Result<Self, String> {
        let clock_origin = Instant::now();
        let (mut socket, _) = tungstenite::connect(url).map_err(|error| error.to_string())?;
        let stream = tcp(socket.get_mut())?;
        let _ = stream.set_nodelay(true);
        set_mode(stream, true);
        Ok(Self {
            socket,
            outgoing: VecDeque::new(),
            rtt,
            clock_origin,
            activity: Instant::now(),
            nonblocking: true,
            idle: false,
        })
    }

    pub fn send_binary(&mut self, bytes: Vec<u8>) {
        self.outgoing.push_back(bytes);
    }

    fn drain_outgoing(&mut self) -> Result<(), String> {
        while let Some(mut bytes) = self.outgoing.pop_front() {
            stamp_probe(&mut bytes, transport_micros(self.clock_origin));
            // Native resets before the send attempt, even when the stream blocks.
            self.activity = Instant::now();
            match self.socket.send(Message::Binary(bytes.into())) {
                Ok(()) => {}
                // Tungstenite retains the accepted frame. Resending would
                // duplicate the command; the native worker keeps draining.
                Err(Error::Io(error)) if error.kind() == ErrorKind::WouldBlock => {}
                Err(error) => return Err(error.to_string()),
            }
        }
        Ok(())
    }

    /// Native worker sleeps one millisecond only in its nonblocking mode.
    pub fn is_nonblocking(&self) -> bool {
        self.nonblocking
    }

    /// Sleep follows only an idle read; received frames immediately iterate.
    pub fn should_sleep(&self) -> bool {
        self.nonblocking && self.idle
    }

    pub fn poll(&mut self) -> Result<Vec<SocketEvent>, String> {
        self.idle = false;
        let nonblocking = self.activity.elapsed().as_secs() == 0;
        if nonblocking != self.nonblocking {
            set_mode(tcp(self.socket.get_mut())?, nonblocking);
            self.nonblocking = nonblocking;
        }
        self.drain_outgoing()?;
        let mut events = Vec::new();
        // One received message per worker iteration, including empty Binary.
        match self.socket.read() {
            Ok(Message::Binary(bytes)) => {
                self.activity = Instant::now();
                match read_probe(&bytes, transport_micros(self.clock_origin)) {
                    TransportProbe::Pass => events.push(SocketEvent::Binary(bytes.to_vec())),
                    TransportProbe::Reply(reply) => {
                        // Native145b92549 sends the reply in the receive path,
                        // before its consumed-frame gate can publish app data.
                        self.send_binary(reply.to_vec());
                        self.drain_outgoing()?;
                    }
                    TransportProbe::Sample { peer, milliseconds } => {
                        self.rtt.lock().unwrap().insert(peer, milliseconds);
                    }
                }
            }
            Ok(Message::Close(_)) | Err(Error::ConnectionClosed | Error::AlreadyClosed) => {
                events.push(SocketEvent::Closed);
                return Ok(events);
            }
            // Native ignores Text and control messages without refreshing activity.
            Ok(_) => {}
            Err(Error::Io(error))
                if matches!(error.kind(), ErrorKind::WouldBlock | ErrorKind::TimedOut) =>
            {
                // Only the idle-read branch flushes and may sleep. Any
                // flush error (including WouldBlock) ends the worker.
                self.socket.flush().map_err(|error| error.to_string())?;
                self.idle = true;
            }
            Err(error) => return Err(error.to_string()),
        }
        Ok(events)
    }

    pub fn close(&mut self) {
        let _ = self.socket.close(None);
        let _ = self.socket.flush();
    }
}
impl Drop for DirectorySocket {
    fn drop(&mut self) {
        self.close();
    }
}

fn set_mode(stream: &TcpStream, nonblocking: bool) {
    // Native drops socket-option failures and continues the worker.
    let _ = stream.set_nonblocking(nonblocking);
    let _ = stream.set_read_timeout(Some(Duration::from_millis(40)));
}
fn tcp(stream: &mut MaybeTlsStream<TcpStream>) -> Result<&mut TcpStream, String> {
    match stream {
        MaybeTlsStream::Plain(stream) => Ok(stream),
        MaybeTlsStream::Rustls(stream) => Ok(&mut stream.sock),
        _ => Err("Unsupported lobby TLS stream".to_owned()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn probe(outer: u8, kind: u8, peer: u32, stamp: u64) -> Vec<u8> {
        let mut bytes = vec![outer];
        bytes.extend_from_slice(&peer.to_le_bytes());
        bytes.extend_from_slice(&9_u32.to_le_bytes());
        bytes.push(kind);
        bytes.extend_from_slice(&stamp.to_le_bytes());
        bytes
    }

    #[test]
    fn outgoing_ping_is_stamped_at_the_raw_service_boundary() {
        let mut bytes = probe(6, 5, 37, 1);
        bytes[5..9].copy_from_slice(&0xffff_ffff_u32.to_le_bytes());
        bytes.push(99);
        let prefix = bytes[..10].to_vec();
        stamp_probe(&mut bytes, 1_234_567);
        assert_eq!(&bytes[..10], prefix);
        assert_eq!(&bytes[10..18], 1_234_567_u64.to_le_bytes());
        assert_eq!(bytes[18], 99);
        for (outer, kind) in [(26, 5), (6, 6), (6, 0)] {
            let mut bytes = probe(outer, kind, 37, 1);
            let original = bytes.clone();
            stamp_probe(&mut bytes, 2);
            assert_eq!(bytes, original);
        }
        let mut short = probe(6, 5, 37, 1);
        short.truncate(17);
        let original = short.clone();
        stamp_probe(&mut short, 2);
        assert_eq!(short, original);
    }

    #[test]
    fn incoming_ping_echoes_exactly_eighteen_bytes_without_a_length_guard() {
        let mut bytes = probe(26, 5, u32::MAX, 42);
        bytes[5..9].copy_from_slice(&0_u32.to_le_bytes());
        bytes.extend_from_slice(&[77, 88]);
        let TransportProbe::Reply(reply) = read_probe(&bytes, 100) else { panic!("reply"); };
        assert_eq!((reply[0], reply[9]), (6, 6));
        assert_eq!(&reply[1..9], &bytes[1..9]);
        assert_eq!(&reply[10..18], &bytes[10..18]);
        assert_eq!(reply.len(), 18);
    }

    #[test]
    fn incoming_pong_keeps_fractional_milliseconds_and_saturates_future_stamps() {
        for (stamp, now, expected) in [(1_000, 1_999, 0.999_f32),
            (1_000, 1_000, 0.0), (1_001, 1_000, 0.0),
            (0, u64::MAX, u64::MAX as f32 / 1_000.0)] {
            let bytes = probe(26, 6, 37, stamp);
            assert_eq!(read_probe(&bytes, now),
                TransportProbe::Sample { peer: 37, milliseconds: expected });
        }
        for (outer, kind) in [(6, 6), (26, 0), (26, 4), (26, 7)] {
            assert_eq!(read_probe(&probe(outer, kind, 37, 1), 2), TransportProbe::Pass);
        }
        let bytes = probe(26, 6, 37, 1);
        for length in 0..18 { assert_eq!(read_probe(&bytes[..length], 2), TransportProbe::Pass); }
    }
}
