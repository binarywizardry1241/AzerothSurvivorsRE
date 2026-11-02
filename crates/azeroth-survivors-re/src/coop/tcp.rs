//! Native co-op TCP framing and nonblocking stream lifecycle (0.115.0).
//!
//! The original `coop/tcp.rs` owners and limits are recorded in
//! `docs/analysis/coop-transport-0.115.0.md`. Packet contents belong to the
//! session protocol; this layer never substitutes its own JSON envelope.

use std::io::{self, ErrorKind, Read, Write};
use std::net::{Ipv4Addr, Shutdown, SocketAddr, TcpListener, TcpStream, ToSocketAddrs};
use std::time::Duration;

pub const MAX_RECEIVED_PACKET: usize = 0x10_0000;
const READ_CHUNK: usize = 0x4000;
const CONNECT_TIMEOUT: Duration = Duration::from_secs(5);

/// The target retains receive/send buffers separately from the live flag.
/// Buffered complete packets remain readable after the peer closes its stream.
#[derive(Debug)]
pub struct TcpConnection {
    stream: TcpStream,
    received: Vec<u8>,
    pending: Vec<u8>,
    alive: bool,
}

impl TcpConnection {
    /// Resolve the first address, as the native constructor does; connection
    /// failure is returned to the owning session instead of trying other hosts.
    pub fn connect(address: impl ToSocketAddrs) -> io::Result<Self> {
        let address = address
            .to_socket_addrs()?
            .next()
            .ok_or_else(|| io::Error::new(ErrorKind::NotFound, "no such host"))?;
        Self::from_stream(TcpStream::connect_timeout(&address, CONNECT_TIMEOUT)?)
    }

    pub fn from_stream(stream: TcpStream) -> io::Result<Self> {
        stream.set_nodelay(true)?;
        stream.set_nonblocking(true)?;
        Ok(Self {
            stream,
            received: Vec::new(),
            pending: Vec::new(),
            alive: true,
        })
    }

    pub fn is_alive(&self) -> bool {
        self.alive
    }

    /// The native send method appends a little-endian u32 byte count and the
    /// payload, then pumps. Its one-MiB bound is on receive, not on send.
    pub fn send(&mut self, payload: &[u8]) {
        self.pending
            .extend_from_slice(&(payload.len() as u32).to_le_bytes());
        self.pending.extend_from_slice(payload);
        self.pump();
    }

    /// Pump and remove exactly one complete frame. None can mean an incomplete
    /// frame or a dead stream; callers distinguish them with `is_alive()`.
    pub fn receive(&mut self) -> Option<Vec<u8>> {
        self.pump();
        take_frame(&mut self.received, &mut self.alive)
    }

    /// Drain socket reads before pending writes. Interrupted operations retry;
    /// WouldBlock retains all incomplete state for the next ordinary pump.
    pub fn pump(&mut self) {
        if !self.alive {
            return;
        }
        let mut chunk = [0_u8; READ_CHUNK];
        loop {
            match self.stream.read(&mut chunk) {
                Ok(0) => {
                    self.alive = false;
                    break;
                }
                Ok(count) => self.received.extend_from_slice(&chunk[..count]),
                Err(error) if error.kind() == ErrorKind::WouldBlock => break,
                Err(error) if error.kind() == ErrorKind::Interrupted => continue,
                Err(_) => {
                    self.alive = false;
                    break;
                }
            }
        }
        // The native pump reaches this write stage even when its read stage
        // has just observed EOF/error; an already-dead call above does no I/O.
        while !self.pending.is_empty() {
            match self.stream.write(&self.pending) {
                Ok(0) => {
                    self.alive = false;
                    break;
                }
                Ok(count) => {
                    self.pending.drain(..count);
                }
                Err(error) if error.kind() == ErrorKind::WouldBlock => break,
                Err(error) if error.kind() == ErrorKind::Interrupted => continue,
                Err(_) => {
                    self.alive = false;
                    break;
                }
            }
        }
    }

    /// One last ordinary pump precedes the native both-directions shutdown.
    pub fn close(&mut self) {
        self.pump();
        let _ = self.stream.shutdown(Shutdown::Both);
        self.alive = false;
    }
}

fn take_frame(received: &mut Vec<u8>, alive: &mut bool) -> Option<Vec<u8>> {
    if received.len() < 4 {
        return None;
    }
    let length = u32::from_le_bytes(received[..4].try_into().unwrap()) as usize;
    if length > MAX_RECEIVED_PACKET {
        *alive = false;
        return None;
    }
    let end = 4 + length;
    if received.len() < end {
        return None;
    }
    let payload = received[4..end].to_vec();
    received.drain(..end);
    Some(payload)
}

/// Native host listener: wildcard IPv4 binding, nonblocking accepts, and the
/// same configured stream constructor as outgoing connections.
#[derive(Debug)]
pub struct TcpHost {
    listener: TcpListener,
}

impl TcpHost {
    pub fn bind(port: u16) -> io::Result<Self> {
        let listener = TcpListener::bind((Ipv4Addr::UNSPECIFIED, port))?;
        listener.set_nonblocking(true)?;
        Ok(Self { listener })
    }

    pub fn local_addr(&self) -> io::Result<SocketAddr> {
        self.listener.local_addr()
    }

    /// The original accept entry returns no connection on accept or socket
    /// configuration errors. Successful peers have TCP_NODELAY and nonblocking
    /// mode before they become visible to session code.
    pub fn accept(&self) -> Option<TcpConnection> {
        let (stream, _) = self.listener.accept().ok()?;
        TcpConnection::from_stream(stream).ok()
    }
}

/// Native startup inputs, independent of the menu's host/code commands.
/// Invalid or absent host ports fall through to the direct join address; a
/// valid host port wins even when opening its listener subsequently fails.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum DirectTcp {
    Host { port: u16 },
    Join { address: String },
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct StartupConfig {
    pub lobby_url: String,
    pub password: String,
    pub direct: Option<DirectTcp>,
}

impl StartupConfig {
    /// `140014810` reads the ordinary Unicode environment values. Errors
    /// (including a non-Unicode value) use the same absent-value branches.
    pub fn from_env() -> Self {
        Self::from_values(
            std::env::var("WOW_ROGUE_COOP_URL").ok(),
            std::env::var("WOW_ROGUE_COOP_PASSWORD").ok(),
            std::env::var("WOW_ROGUE_COOP_HOST").ok(),
            std::env::var("WOW_ROGUE_COOP_JOIN").ok(),
        )
    }

    pub fn from_values(
        lobby_url: Option<String>,
        password: Option<String>,
        host: Option<String>,
        join: Option<String>,
    ) -> Self {
        let direct = match host.and_then(|value| value.parse::<u16>().ok()) {
            Some(port) => Some(DirectTcp::Host { port }),
            None => join.map(|address| DirectTcp::Join { address }),
        };
        Self {
            // Native fallback replaces https:// with wss:// in the ordinary
            // https://wow.aethus.pl/ base and appends coop/lobby/.
            lobby_url: lobby_url.unwrap_or_else(|| "wss://wow.aethus.pl/coop/lobby/".to_owned()),
            password: password.unwrap_or_default(),
            direct,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn fragmented_frames_wait_without_consuming_and_coalesced_frames_stay_ordered() {
        let bytes = [3, 0, 0, 0, 0xff, 0, 7, 0, 0, 0, 0];
        let mut received = Vec::new();
        let mut alive = true;
        for byte in &bytes[..6] {
            received.push(*byte);
            let before = received.clone();
            assert_eq!(take_frame(&mut received, &mut alive), None);
            assert_eq!(received, before);
        }
        received.extend_from_slice(&bytes[6..]);
        assert_eq!(
            take_frame(&mut received, &mut alive),
            Some(vec![0xff, 0, 7])
        );
        assert_eq!(take_frame(&mut received, &mut alive), Some(vec![]));
        assert!(alive);
        assert!(received.is_empty());
    }

    #[test]
    fn exact_limit_is_admitted_and_oversize_header_closes_without_consuming() {
        let mut received = (MAX_RECEIVED_PACKET as u32).to_le_bytes().to_vec();
        received.resize(4 + MAX_RECEIVED_PACKET, 0x5a);
        let mut alive = true;
        assert_eq!(
            take_frame(&mut received, &mut alive).unwrap().len(),
            MAX_RECEIVED_PACKET
        );
        assert!(alive);
        received.extend_from_slice(&((MAX_RECEIVED_PACKET + 1) as u32).to_le_bytes());
        let before = received.clone();
        assert_eq!(take_frame(&mut received, &mut alive), None);
        assert!(!alive);
        assert_eq!(received, before);
    }

    #[test]
    fn complete_packets_buffered_before_eof_still_deliver() {
        let mut received = vec![1, 0, 0, 0, 42];
        let mut alive = false;
        assert_eq!(take_frame(&mut received, &mut alive), Some(vec![42]));
        assert!(!alive);
    }

    #[test]
    fn direct_host_admission_and_join_fallback_use_untrimmed_native_values() {
        for value in ["0", "+0", "65535"] {
            assert!(matches!(
                StartupConfig::from_values(
                    None,
                    None,
                    Some(value.into()),
                    Some("peer:1234".into())
                )
                .direct,
                Some(DirectTcp::Host { .. })
            ));
        }
        for value in ["", "-1", "65536", " 1234", "1234 ", "+"] {
            assert_eq!(
                StartupConfig::from_values(
                    None,
                    None,
                    Some(value.into()),
                    Some("peer:1234".into())
                )
                .direct,
                Some(DirectTcp::Join {
                    address: "peer:1234".into()
                })
            );
        }
        let empty =
            StartupConfig::from_values(Some(String::new()), Some(String::new()), None, None);
        assert_eq!(empty.lobby_url, "");
        assert_eq!(empty.password, "");
        assert_eq!(empty.direct, None);
        assert_eq!(
            StartupConfig::from_values(None, None, None, None).lobby_url,
            "wss://wow.aethus.pl/coop/lobby/"
        );
    }
}
