//! Current AS inventory move/destroy refusals; native1458646d0/1458d5730.
use benilla_app::local_client::events::SessionEvent;

pub(crate) fn refused(opcode: u16, first: u8, second: u8) -> Option<SessionEvent> {
    let (reason, slot) = match opcode {
        0x10a | 0x10b | 0x10c => (0x15, second),
        0x10d => (0x15, first),
        0x111 => (0x18, second),
        _ => return None,
    };
    let guid = if slot < 19 {
        0x4000_0000_0000_0100 | u64::from(slot)
    } else {
        0
    };
    let mut body = vec![reason];
    body.extend_from_slice(&guid.to_le_bytes());
    body.extend_from_slice(&0u64.to_le_bytes());
    body.push(0);
    let packet = benilla_protocol::messages::parse_server(0x112, &body).ok()?;
    benilla_protocol::decode(packet).into_iter().next()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn current_native_refusals_reach_the_existing_inventory_decoder() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.113.2/inventory-refusals.json"
        ))
        .unwrap();
        for row in proof["source_fixtures"].as_array().unwrap() {
            let event = refused(
                row["opcode"].as_u64().unwrap() as u16,
                row["first"].as_u64().unwrap() as u8,
                row["second"].as_u64().unwrap() as u8,
            );
            assert!(matches!(event, Some(SessionEvent::InventoryFailure {
                reason, required_level: None, item_guid, item2_guid: 0, bag_slot: 0,
            }) if u64::from(reason) == row["reason"].as_u64().unwrap()
                && item_guid == row["guid"].as_u64().unwrap()));
        }
        assert!(refused(0x10e, 0, 0).is_none());
    }
}
