//! Exact client-event projection admitted to other party members (0.115.0).
//!
//! This deliberately operates on the native text layout, including its strict
//! leading prefix and substring checks; parsing/reserializing arbitrary JSON
//! would admit packets the original route rejects and change their bytes.

const TYPE_PREFIX: &str = "{\"type\":\"";
const INPUT_FIELD: &str = ",\"in\":";
const METER_FIELD: &str = "\"m\":";
const SHARED_BANNERS: [&str; 4] = ["boss", "finalboss", "bossdown", "guardian"];

/// Return the exact event bytes eligible for forwarding to another hero.
/// Local delivery is independent and must retain the original packet.
///
/// Native owner `14584a210..14584a68d`: hz/hzend pass through; hzt needs m,
/// strips the trailing input payload and adds keep; only four banner kinds
/// cross the player boundary. Everything else stays local.
pub fn forward_to_peers(packet: &str) -> Option<String> {
    let remainder = packet.strip_prefix(TYPE_PREFIX)?;
    let kind = remainder.split('"').next()?;
    match kind {
        "hz" | "hzend" => Some(packet.to_owned()),
        "hzt" if packet.contains(METER_FIELD) => {
            let end = packet.find(INPUT_FIELD).unwrap_or(packet.len() - 1);
            // Like the native string slicing path, malformed UTF-8 boundaries
            // are not silently repaired or used to infer a valid event.
            Some(format!("{},\"keep\":true}}", &packet[..end]))
        }
        "banner"
            if SHARED_BANNERS
                .iter()
                .any(|kind| packet.contains(&format!("\"kind\":\"{kind}\""))) =>
        {
            Some(packet.to_owned())
        }
        _ => None,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn local_events_and_different_json_layouts_are_not_broadcast() {
        for packet in [
            "",
            "{}",
            " {\"type\":\"hz\"}",
            "{\"type\": \"hz\"}",
            "{\"type\":\"damage\"}",
            "{\"type\":\"hzt\",\"in\":[]}",
        ] {
            assert_eq!(forward_to_peers(packet), None);
        }
    }

    #[test]
    fn hazard_tick_keeps_visual_state_and_removes_local_inputs() {
        let packet = "{\"type\":\"hzt\",\"m\":[],\"in\":[{\"local\":1}]}";
        assert_eq!(
            forward_to_peers(packet),
            Some("{\"type\":\"hzt\",\"m\":[],\"keep\":true}".into())
        );
        assert_eq!(
            forward_to_peers("{\"type\":\"hzt\",\"m\":[]}"),
            Some("{\"type\":\"hzt\",\"m\":[],\"keep\":true}".into())
        );
    }

    #[test]
    fn only_recovered_shared_banner_kinds_and_hazard_lifecycles_cross_players() {
        for kind in ["hz", "hzend"] {
            let packet = format!("{{\"type\":\"{kind}\",\"x\":1}}");
            assert_eq!(forward_to_peers(&packet), Some(packet));
        }
        for kind in ["boss", "finalboss", "bossdown", "guardian"] {
            let packet = format!("{{\"type\":\"banner\",\"kind\":\"{kind}\"}}");
            assert_eq!(forward_to_peers(&packet), Some(packet));
        }
        assert_eq!(
            forward_to_peers("{\"type\":\"banner\",\"kind\":\"levelup\"}"),
            None
        );
    }
}
