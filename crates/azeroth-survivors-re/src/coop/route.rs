//! Client-event projection admitted to other party members.
//!
//! This deliberately operates on the native text layout, including its strict
//! leading prefix and substring checks; parsing/reserializing arbitrary JSON
//! would admit packets the original route rejects and change their bytes.

const TYPE_PREFIX: &str = "{\"type\":\"";
const INPUT_FIELD: &str = ",\"in\":";
const METER_FIELD: &str = "\"m\":";
const SHARED_BANNERS: [&str; 4] = ["boss", "finalboss", "bossdown", "guardian"];

/// The 0.140.0 guest EventBytes gate examines the initial type, not the rest
/// of the JSON document. Native event-specific consumers parse the body.
pub fn guest_event_allowed(packet: &str) -> bool {
    if packet.len() > 65_536 {
        return false;
    }
    let Some(kind) = packet.strip_prefix(TYPE_PREFIX).and_then(|rest| rest.split('"').next()) else {
        return false;
    };
    matches!(kind, "hz" | "hzt" | "atk" | "atku" | "atkl" | "atka" | "atkx"
        | "start" | "hzend" | "resume" | "banner" | "paused" | "defeat" | "downed"
        | "choices" | "victory" | "endless" | "revived" | "unpaused")
}

/// Return the exact event bytes eligible for forwarding to another hero.
/// Local delivery is independent and must retain the original packet.
///
/// Current 0.140.0 owner `145e95c70..145e9615f` copies hz, hzend and
/// scripted attack messages verbatim. The hzt and banner branches retain
/// the independently recovered input stripping and banner filters.
pub fn forward_to_peers(packet: &str) -> Option<String> {
    let remainder = packet.strip_prefix(TYPE_PREFIX)?;
    let kind = remainder.split('"').next()?;
    match kind {
        "hz" | "hzend" | "atk" | "atku" | "atkl" | "atka" | "atkx" => Some(packet.to_owned()),
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
        for kind in ["hz", "hzend", "atk", "atku", "atkl", "atka", "atkx"] {
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
