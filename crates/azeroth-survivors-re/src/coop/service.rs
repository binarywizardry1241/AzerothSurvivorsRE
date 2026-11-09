//! Binary public-lobby service protocol; base recovery is native 0.115.0.
//! Current rank suffix and writer: docs/analysis/coop-selection-0.123.0.md.
//!
//! Current 0.123.0 selection metadata: docs/analysis/coop-selection-0.123.0.md.
//! These frames belong to the shared WebSocket service. They are distinct from
//! the game-session packet stream carried inside the relay payload. The native
//! encoder is 145b7a740 and its profile writer is 145b7a4f0.

/// The selected host's live lobby advertisement, in native wire order.
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub struct LobbyProfile {
    pub hero: String,
    pub class: u8,
    pub zone: String,
    pub opened: bool,
    pub classes: Vec<u8>,
    pub max: u8,
    /// Current service profile rank, after party capacity.
    pub heroic_rank: u8,
    pub hyper: bool,
}

/// Secondary-connection authentication forwarded by the native service pump.
/// The remaining field meanings are kept opaque until their producer is known.
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub struct SecondaryAuth {
    pub text_1: String,
    pub number_1: u64,
    pub number_2: u32,
    pub text_2: String,
    pub number_3: u64,
    pub data: Vec<u8>,
}

/// Service commands whose producers and complete wire fields are recovered.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum ClientMessage {
    Handshake {
        version: String,
        staff_key: String,
    },
    Refresh,
    Host {
        name: String,
        public: bool,
        description: String,
        password: String,
        profile: LobbyProfile,
    },
    UpdateProfile(LobbyProfile),
    Join {
        code: String,
        password: String,
    },
    Relay {
        peer: u32,
        payload: Vec<u8>,
    },
    Kick(u32),
    Leave,
    Heartbeat,
    /// Request the service profile for the current world and normalized Pick name.
    ProfileRequest {
        guid: u64,
        name: String,
    },
    Authenticate(SecondaryAuth),
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum EncodeError {
    Length,
}

fn bytes(out: &mut Vec<u8>, value: &[u8]) -> Result<(), EncodeError> {
    let length = u32::try_from(value.len()).map_err(|_| EncodeError::Length)?;
    out.extend_from_slice(&length.to_le_bytes());
    out.extend_from_slice(value);
    Ok(())
}

fn string(out: &mut Vec<u8>, value: &str) -> Result<(), EncodeError> {
    bytes(out, value.as_bytes())
}

fn profile(out: &mut Vec<u8>, value: &LobbyProfile) -> Result<(), EncodeError> {
    string(out, &value.hero)?;
    out.push(value.class);
    string(out, &value.zone)?;
    out.push(u8::from(value.opened));
    bytes(out, &value.classes)?;
    out.push(value.max);
    out.push(value.heroic_rank);
    out.push(u8::from(value.hyper));
    Ok(())
}

impl ClientMessage {
    /// One complete native service frame, sent as one WebSocket binary message.
    /// Strings and byte vectors have a little-endian u32 byte count and no NUL.
    pub fn encode(&self) -> Result<Vec<u8>, EncodeError> {
        let mut out = Vec::new();
        match self {
            Self::Handshake { version, staff_key } => {
                out.push(1);
                out.extend_from_slice(&3u32.to_le_bytes());
                string(&mut out, version)?;
                string(&mut out, staff_key)?;
                out.push(1);
            }
            Self::Refresh => out.push(2),
            Self::Host {
                name,
                public,
                description,
                password,
                profile: value,
            } => {
                out.push(3);
                string(&mut out, name)?;
                out.push(u8::from(*public));
                string(&mut out, description)?;
                string(&mut out, password)?;
                profile(&mut out, value)?;
            }
            Self::UpdateProfile(value) => {
                out.push(4);
                profile(&mut out, value)?;
            }
            Self::Join { code, password } => {
                out.push(5);
                string(&mut out, code)?;
                string(&mut out, password)?;
            }
            Self::Relay { peer, payload } => {
                out.push(6);
                out.extend_from_slice(&peer.to_le_bytes());
                bytes(&mut out, payload)?;
            }
            Self::Kick(peer) => {
                out.push(7);
                out.extend_from_slice(&peer.to_le_bytes());
            }
            Self::Leave => out.push(8),
            Self::Heartbeat => out.push(9),
            Self::ProfileRequest { guid, name } => {
                out.push(10);
                out.extend_from_slice(&guid.to_le_bytes());
                bytes(&mut out, name.as_bytes())?;
            }
            Self::Authenticate(value) => {
                out.push(11);
                string(&mut out, &value.text_1)?;
                out.extend_from_slice(&value.number_1.to_le_bytes());
                out.extend_from_slice(&value.number_2.to_le_bytes());
                string(&mut out, &value.text_2)?;
                out.extend_from_slice(&value.number_3.to_le_bytes());
                bytes(&mut out, &value.data)?;
            }
        }
        Ok(out)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn handshake_uses_protocol_three_and_a_binary_frame() {
        assert_eq!(
            ClientMessage::Handshake {
                version: "0.115.0".into(),
                staff_key: String::new()
            }
            .encode()
            .unwrap(),
            [
                1, 3, 0, 0, 0, 7, 0, 0, 0, b'0', b'.', b'1', b'1', b'5', b'.', b'0', 0, 0, 0, 0, 1
            ]
        );
        assert_eq!(ClientMessage::Refresh.encode().unwrap(), [2]);
    }

    #[test]
    fn host_preserves_profile_byte_vectors_and_field_order() {
        let value = LobbyProfile {
            hero: "H".into(),
            class: 7,
            zone: "Z".into(),
            opened: true,
            classes: vec![7, 9],
            max: 5,
            heroic_rank: 3,
            hyper: true,
        };
        let expected_profile = [
            1, 0, 0, 0, b'H', 7, 1, 0, 0, 0, b'Z', 1, 2, 0, 0, 0, 7, 9, 5, 3, 1,
        ];
        assert_eq!(
            ClientMessage::UpdateProfile(value.clone())
                .encode()
                .unwrap(),
            [vec![4], expected_profile.to_vec()].concat()
        );
        let mut expected = vec![3, 1, 0, 0, 0, b'N', 0, 1, 0, 0, 0, b'D', 1, 0, 0, 0, b'P'];
        expected.extend(expected_profile);
        assert_eq!(
            ClientMessage::Host {
                name: "N".into(),
                public: false,
                description: "D".into(),
                password: "P".into(),
                profile: value,
            }
            .encode()
            .unwrap(),
            expected
        );
    }

    #[test]
    fn join_and_relay_keep_lengths_in_bytes_and_peer_width() {
        assert_eq!(
            ClientMessage::Join {
                code: "A".into(),
                password: "é".into()
            }
            .encode()
            .unwrap(),
            [5, 1, 0, 0, 0, b'A', 2, 0, 0, 0, 0xc3, 0xa9]
        );
        assert_eq!(
            ClientMessage::Relay {
                peer: 0x78563412,
                payload: vec![0, 255]
            }
            .encode()
            .unwrap(),
            [6, 0x12, 0x34, 0x56, 0x78, 2, 0, 0, 0, 0, 255]
        );
        assert_eq!(
            ClientMessage::Kick(u32::MAX).encode().unwrap(),
            [7, 255, 255, 255, 255]
        );
        assert_eq!(ClientMessage::Leave.encode().unwrap(), [8]);
        assert_eq!(ClientMessage::Heartbeat.encode().unwrap(), [9]);
    }

    #[test]
    fn profile_request_keeps_world_identity_and_name_byte_length() {
        assert_eq!(
            ClientMessage::ProfileRequest {
                guid: 0x0807060504030201,
                name: "é".into(),
            }
            .encode()
            .unwrap(),
            [10, 1, 2, 3, 4, 5, 6, 7, 8, 2, 0, 0, 0, 0xc3, 0xa9],
        );
    }

    #[test]
    fn secondary_authentication_keeps_native_mixed_word_widths() {
        assert_eq!(
            ClientMessage::Authenticate(SecondaryAuth {
                text_1: "A".into(),
                number_1: 1,
                number_2: 2,
                text_2: "B".into(),
                number_3: 3,
                data: vec![0xff],
            })
            .encode()
            .unwrap(),
            [
                11, 1, 0, 0, 0, b'A', 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, b'B', 3, 0,
                0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0xff,
            ]
        );
    }
}
