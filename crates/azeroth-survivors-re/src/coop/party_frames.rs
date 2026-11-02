//! Current AS party rows use the existing SMSG_GROUP_LIST/FrameXML consumer.
//! See docs/analysis/coop-party-frames-0.123.0.md.
use super::replication::EnginePacket;

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Member {
    pub slot: u8,
    pub guid: u64,
    pub name: String,
    /// Native slot zero is online; assigned remote rows invert the sampled
    /// transport-reconnecting byte. This is independent of alive/dead state.
    pub online: bool,
}

/// The exact connection/cache view at one publication occurrence. Retirement
/// keeps this before a later removal can change another actor's online bit.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Client {
    pub id: super::server_party::ClientId,
    pub world_hero: Option<u64>,
    pub synchronized: bool,
    pub reconnecting: bool,
}

/// Native145c2d740/145c97350 omit the recipient and abandoned hero contexts.
/// The caller supplies the latter admission through its actual world roster.
pub fn packet(members: &[Member], recipient: u8, host_guid: u64) -> EnginePacket {
    let rows: Vec<_> = members.iter().filter(|row| row.slot != recipient).collect();
    let mut payload = vec![0, 0];
    payload.extend_from_slice(&(rows.len() as u32).to_le_bytes());
    for row in &rows {
        payload.extend_from_slice(row.name.as_bytes());
        payload.push(0);
        payload.extend_from_slice(&row.guid.to_le_bytes());
        payload.extend_from_slice(&[u8::from(row.online), 0]);
    }
    payload.extend_from_slice(&if rows.is_empty() { 0 } else { host_guid }.to_le_bytes());
    if !rows.is_empty() {
        payload.push(0);
        payload.extend_from_slice(&0u64.to_le_bytes());
        payload.extend_from_slice(&[2, 0]);
    }
    EnginePacket {
        opcode: benilla_protocol::messages::opcode::SMSG_GROUP_LIST,
        payload,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use benilla_protocol::SessionEvent;

    #[test]
    fn recipient_rows_keep_native_order_names_and_reconnect_state() {
        let members = [
            Member {
                slot: 0,
                guid: 41,
                name: "Host".into(),
                online: true,
            },
            Member {
                slot: 1,
                guid: 42,
                name: "Ärie".into(),
                online: false,
            },
            Member {
                slot: 2,
                guid: 43,
                name: "Friend".into(),
                online: true,
            },
        ];
        let packet = packet(&members, 1, 41);
        let events = packet.decode_server().unwrap();
        let SessionEvent::GroupList {
            group_type,
            own_flags,
            members,
            leader,
            loot,
        } = &events[0]
        else {
            panic!("ordinary group list expected")
        };
        assert_eq!((*group_type, *own_flags, *leader), (0, 0, 41));
        assert_eq!(
            members
                .iter()
                .map(|row| (row.guid, row.status))
                .collect::<Vec<_>>(),
            [(41, 1), (43, 1)]
        );
        assert_eq!(loot.unwrap().threshold, 2);
        let local = super::packet(
            &[
                Member {
                    slot: 0,
                    guid: 41,
                    name: "Host".into(),
                    online: true,
                },
                Member {
                    slot: 1,
                    guid: 42,
                    name: "Ärie".into(),
                    online: false,
                },
            ],
            0,
            41,
        )
        .decode_server()
        .unwrap();
        assert!(matches!(&local[0], SessionEvent::GroupList { members, .. }
            if members[0].name == "Ärie" && members[0].status == 0));
    }

    #[test]
    fn the_last_remaining_recipient_gets_the_native_empty_list() {
        let packet = packet(
            &[Member {
                slot: 0,
                guid: 41,
                name: "Host".into(),
                online: true,
            }],
            0,
            41,
        );
        assert_eq!(packet.payload, vec![0; 14]);
        assert!(matches!(&packet.decode_server().unwrap()[0],
            SessionEvent::GroupList { members, leader: 0, loot: None, .. } if members.is_empty()));
    }
}
