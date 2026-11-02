//! Current local QueryTime response; wall-clock sampling is independent of Game.
use std::time::{SystemTime, UNIX_EPOCH};
use benilla_app::local_client::events::SessionEvent;

pub(crate) fn query_time() -> Option<SessionEvent> {
    query_at(SystemTime::now())
}

fn query_at(now: SystemTime) -> Option<SessionEvent> {
    let unix_time = now.duration_since(UNIX_EPOCH).map_or(0, |d| d.as_secs() as u32);
    super::query_packets::decode(SessionEvent::ServerUnixTime { unix_time })
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::time::Duration;

    #[test]
    fn native_epoch_rounding_and_wire_wrap_reach_the_actual_decoder() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.113.2/clock-queries.json"
        )).unwrap();
        for case in proof["fixtures"].as_array().unwrap() {
            let ticks = case["ticks"].as_u64().unwrap();
            // FILETIME values with the sign bit set are invalid SystemTime
            // instances in the native Windows representation, tested natively only.
            if ticks >= 1 << 63 { continue; }
            let epoch = 116_444_736_000_000_000_u64;
            let delta = ticks.abs_diff(epoch);
            let duration = Duration::new(delta / 10_000_000, (delta % 10_000_000 * 100) as u32);
            let now = if ticks < epoch { UNIX_EPOCH - duration } else { UNIX_EPOCH + duration };
            let Some(SessionEvent::ServerUnixTime { unix_time }) = query_at(now) else {
                panic!("clock response must decode")
            };
            assert_eq!(u64::from(unix_time), case["unix_time"].as_u64().unwrap());
        }
    }
}
