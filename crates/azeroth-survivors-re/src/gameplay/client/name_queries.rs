//! Current AS local name fallback, including replies for uncached GUIDs.
//! The native wrapper retains its character independently of the optional Game.
use benilla_app::local_client::{events::SessionEvent, LocalPlayerUi};

pub(crate) fn name_query(guid: u64, player: &LocalPlayerUi) -> Option<SessionEvent> {
    super::query_packets::decode(SessionEvent::PlayerName {
        guid,
        name: player.name.clone(),
        race: u32::from(player.race),
        gender: u32::from(player.sex),
        class: u32::from(player.class),
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn current_native_packets_reach_the_existing_name_decoder() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.113.2/name-queries.json"
        )).unwrap();
        for case in proof["fixtures"].as_array().unwrap() {
            let player = LocalPlayerUi {
                name: case["name"].as_str().unwrap().to_owned(),
                race: case["race"].as_u64().unwrap() as u8,
                sex: case["sex"].as_u64().unwrap() as u8,
                class: case["class"].as_u64().unwrap() as u8,
                ..Default::default()
            };
            let guid = case["guid"].as_u64().unwrap();
            let actual = name_query(guid, &player);
            let expected = &case["decoded"];
            if expected.is_null() {
                assert!(actual.is_none());
            } else {
                let SessionEvent::PlayerName { guid, name, race, gender, class } =
                    actual.expect("native query decodes") else { panic!("wrong event") };
                assert_eq!(serde_json::json!({"guid": guid, "name": name,
                    "race": race, "gender": gender, "class": class}), *expected);
            }
        }
    }
}
