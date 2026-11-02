//! Current AS template serializers feeding the existing client wire decoder.
//! Native producer bytes: docs/analysis/template-query-wire-0.113.2.md.
use benilla_app::local_client::events::SessionEvent;

/// Preserve the packet boundary even for high-bit entries and embedded NULs in
/// user-supplied language strings. Invalid packets follow the decoder's refusal.
pub(super) fn decode(template: SessionEvent) -> Option<SessionEvent> {
    let (opcode, body) = packet(template);
    let packet = benilla_protocol::messages::parse_server(opcode, &body).ok()?;
    benilla_protocol::decode(packet).into_iter().next()
}

fn packet(template:SessionEvent)->(u16,Vec<u8>) {
    let packet=azeroth_survivors_re::coop::engine_packets::encode(&template,None)
        .expect("native query serializer accepts its typed response").expect("query has a packet");
    (packet.opcode,packet.payload)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn clock_responses_preserve_native_wire_bytes() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.113.2/clock-queries.json"
        )).unwrap();
        for case in proof["fixtures"].as_array().unwrap() {
            let unix_time = case["unix_time"].as_u64().unwrap() as u32;
            let (opcode, body) = packet(SessionEvent::ServerUnixTime { unix_time });
            assert_eq!(opcode, 0x1cf);
            assert_eq!(body.iter().map(|b| format!("{b:02x}")).collect::<String>(),
                case["packet_hex"].as_str().unwrap());
        }
    }

    #[test]
    fn name_responses_preserve_current_native_wire_bytes() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.113.2/name-queries.json"
        )).unwrap();
        for case in proof["fixtures"].as_array().unwrap() {
            let (opcode, body) = packet(SessionEvent::PlayerName {
                guid: case["guid"].as_u64().unwrap(),
                name: case["name"].as_str().unwrap().into(),
                race: case["race"].as_u64().unwrap() as u32,
                gender: case["sex"].as_u64().unwrap() as u32,
                class: case["class"].as_u64().unwrap() as u32,
            });
            assert_eq!(opcode, 0x51);
            assert_eq!(body.iter().map(|b| format!("{b:02x}")).collect::<String>(),
                case["packet_hex"].as_str().unwrap());
        }
    }

    fn template(case: &serde_json::Value) -> SessionEvent {
        let entry = case["entry"].as_u64().unwrap() as u32;
        if case["kind"] == "object" {
            SessionEvent::GameObjectInfo {
                entry,
                type_id: case["type_id"].as_u64().unwrap() as u32,
                display_id: case["display_id"].as_u64().unwrap() as u32,
                name: case["name"].as_str().unwrap().into(),
                data: [0; 24],
            }
        } else {
            SessionEvent::CreatureName {
                entry,
                name: case["name"].as_str().map(str::to_owned),
                subname: case["subname"]
                    .as_str()
                    .filter(|s| !s.is_empty())
                    .map(str::to_owned),
                creature_type: case["creature_type"].as_u64().map(|v| v as u32),
                type_flags: 0,
                pet_family: 0,
                rank: case["rank"].as_u64().unwrap_or(0) as u32,
                pet_spell_list: 0,
                display_id: case["display_id"].as_u64().unwrap_or(0) as u32,
                civilian: false,
                racial_leader: false,
            }
        }
    }

    #[test]
    fn serializers_match_current_native_bytes_and_reuse_the_actual_decoder() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.113.2/template-query-wire.json"
        ))
        .unwrap();
        for case in proof["cases"].as_array().unwrap() {
            let (opcode, bytes) = packet(template(case));
            let hex = bytes.iter().map(|b| format!("{b:02x}")).collect::<String>();
            assert_eq!(hex, case["packet_hex"].as_str().unwrap());
            assert_eq!(u64::from(opcode), case["opcode"].as_u64().unwrap());
            let decoded = decode(template(case)).unwrap();
            let actual = match decoded {
                SessionEvent::GameObjectInfo {
                    entry,
                    name,
                    type_id,
                    display_id,
                    data,
                } => serde_json::json!({"kind": "object", "entry": entry, "name": name,
                        "type_id": type_id, "display_id": display_id, "data": data}),
                SessionEvent::GameObjectUnknown { entry } => {
                    serde_json::json!({"kind": "unknown_object", "entry": entry})
                }
                SessionEvent::CreatureName {
                    entry,
                    name,
                    subname,
                    creature_type,
                    type_flags,
                    pet_family,
                    rank,
                    pet_spell_list,
                    display_id,
                    civilian,
                    racial_leader,
                } => serde_json::json!({"kind": "creature", "entry": entry, "name": name,
                        "subname": subname, "creature_type": creature_type, "type_flags": type_flags,
                        "pet_family": pet_family, "rank": rank, "pet_spell_list": pet_spell_list,
                        "display_id": display_id, "civilian": civilian, "racial_leader": racial_leader}),
                _ => panic!("unexpected template event"),
            };
            assert_eq!(actual, case["decoded"]);
        }
    }
}
