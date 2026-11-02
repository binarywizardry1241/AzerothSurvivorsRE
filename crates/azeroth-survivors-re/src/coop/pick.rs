//! Offer-bound choice state. Current HUD choosing admission controls retry and
//! missing-card requests; see docs/analysis/coop-picks-0.127.0.md.
use serde_json::Value;

#[derive(Default)]
pub struct Client {
    retained: Option<Value>,
    offer: u32,
    pending_since: Option<f64>,
    missing_since: Option<f64>,
    last_request: Option<f64>,
    revision: u64,
}

impl Client {
    pub fn receive(&mut self, bytes: &[u8]) -> bool {
        // The native receiver requires this exact prefix before reading type.
        if !bytes.starts_with(b"{\"type\":\"") {
            return false;
        }
        let Ok(value) = serde_json::from_slice::<Value>(bytes) else {
            return false;
        };
        match value.get("type").and_then(Value::as_str) {
            Some("resume") => {
                self.retained = None;
                self.pending_since = None;
            }
            Some("choices") => {
                self.offer = value.get("offer").and_then(Value::as_u64)
                    .and_then(|offer| u32::try_from(offer).ok()).unwrap_or(0);
                self.retained = Some(value);
                self.pending_since = None;
            }
            _ => return false,
        }
        self.revision = self.revision.wrapping_add(1);
        true
    }

    pub fn offer(&self) -> u32 { self.offer }
    pub fn revision(&self) -> u64 { self.revision }
    pub fn visible(&self) -> Option<&Value> {
        self.retained.as_ref().filter(|_| self.pending_since.is_none())
    }

    /// Call only after the control was accepted by the outgoing queue.
    pub fn selected(&mut self, now: f64) {
        if self.retained.is_some() {
            self.pending_since = Some(now);
            self.revision = self.revision.wrapping_add(1);
        }
    }

    fn retry(&mut self, now: f64) {
        if self.pending_since.is_some_and(|at| now - at > 4.0) {
            self.pending_since = None;
            self.revision = self.revision.wrapping_add(1);
        }
    }

    /// A HUD packet is the native retry clock. Return whether its absent-card
    /// state needs Control10; receiving no packets never triggers a request.
    pub fn receive_hud(&mut self, text: &str, now: f64) -> bool {
        let choosing = text.contains("\"phase\":\"choosing\"");
        if self.pending_since.is_some() {
            if choosing {
                self.retry(now);
            } else {
                self.retained = None;
                self.pending_since = None;
                self.revision = self.revision.wrapping_add(1);
            }
        }
        if !choosing || self.retained.is_some() {
            self.missing_since = None;
            self.last_request = None;
            return false;
        }
        let since = *self.missing_since.get_or_insert(now);
        // Native compares the threshold against elapsed using UCOMISD/JBE;
        // these less-than rejections also retain its unordered-clock result.
        if now - since < 3.0 || self.last_request.is_some_and(|at| now - at < 3.0) {
            return false;
        }
        self.last_request = Some(now);
        true
    }

    pub fn clear(&mut self) {
        self.retained = None;
        self.pending_since = None;
        self.missing_since = None;
        self.last_request = None;
        self.revision = self.revision.wrapping_add(1);
    }
}

/// serde_json's map order does not guarantee the native receiver's type prefix.
pub fn choices_json(mut value: Value) -> String {
    value.as_object_mut().expect("choice payload object").remove("type");
    let tail = value.to_string();
    format!("{{\"type\":\"choices\",{}", &tail[1..])
}

/// Zero is the native compatibility wildcard, including a wrapping counter.
pub fn admits(kind: u8, received: u32, current: u32) -> bool {
    !matches!(kind, 0 | 3) || received == 0 || received == current
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn authoritative_messages_own_the_pending_offer_and_retry() {
        let mut state = Client::default();
        assert!(state.receive(br#"{"type":"choices","offer":17,"choices":[{}]}"#));
        state.selected(10.0);
        assert!(state.visible().is_none());
        state.retry(14.0);
        assert!(state.visible().is_none());
        state.retry(14.001);
        assert!(state.visible().is_some());
        state.selected(20.0);
        assert!(state.receive(br#"{"type":"choices","offer":18,"choices":[{}]}"#));
        assert_eq!(state.offer(), 18);
        assert!(state.visible().is_some());
        state.selected(30.0);
        assert!(state.receive(br#"{"type":"resume"}"#));
        state.retry(100.0);
        assert!(state.visible().is_none());
    }
    #[test]
    fn zero_and_exact_identity_are_the_only_pick_admissions() {
        for kind in 0..10 {
            assert!(admits(kind, 0, 42));
            assert!(admits(kind, 42, 42));
            assert_eq!(admits(kind, 41, 42), !matches!(kind, 0 | 3));
            assert_eq!(admits(kind, u32::MAX, 0), !matches!(kind, 0 | 3));
        }
    }
    #[test]
    fn emitted_choices_reach_the_exact_native_prefix() {
        let bytes = choices_json(serde_json::json!({"type":"choices", "offer":7,
            "banishes":2, "choices":[]}));
        let mut state = Client::default();
        assert!(state.receive(bytes.as_bytes()));
        assert_eq!(state.offer(), 7);
        assert!(!state.receive(br#" {"type":"resume"}"#));
    }

    #[test]
    fn running_hud_discards_a_dismissed_offer_before_the_retry_deadline() {
        let mut state = Client::default();
        state.receive(br#"{"type":"choices","offer":17,"choices":[{}]}"#);
        state.selected(10.0);
        assert!(!state.receive_hud(r#"{"phase":"running"}"#, 11.0));
        assert!(!state.receive_hud(r#"{"phase":"choosing"}"#, 20.0));
        assert!(state.visible().is_none());
        assert!(state.receive_hud(r#"{"phase":"choosing"}"#, 23.0));
        assert!(state.visible().is_none());
        state.receive(br#"{"type":"choices","offer":18,"choices":[{}]}"#);
        assert!(state.visible().is_some());
    }

    #[test]
    fn missing_choices_request_on_hud_after_three_seconds_and_repeat_at_three() {
        let mut state = Client::default();
        let hud = r#"{"phase":"choosing"}"#;
        assert!(!state.receive_hud(hud, 10.0));
        assert!(!state.receive_hud(hud, 12.999));
        assert!(state.receive_hud(hud, 13.0));
        assert!(!state.receive_hud(hud, 15.999));
        assert!(state.receive_hud(hud, 16.0));
        assert!(!state.receive_hud(r#"{"phase":"running"}"#, 17.0));
        assert!(!state.receive_hud(hud, 20.0));
        assert!(state.receive_hud(hud, 23.0));
        state.receive(br#"{"type":"choices","offer":7,"choices":[{}]}"#);
        assert!(!state.receive_hud(hud, 30.0));
        state.selected(31.0);
        assert!(!state.receive_hud(hud, 35.0));
        assert!(state.visible().is_none());
        assert!(!state.receive_hud(hud, 35.001));
        assert!(state.visible().is_some());
        assert!(!state.receive_hud(hud, 100.0));
        state.clear();
        assert!(!state.receive_hud(hud, 200.0));
        assert!(state.receive_hud(hud, 203.0));
    }

    #[test]
    fn hud_retry_uses_the_native_exact_choosing_substring() {
        let mut state = Client::default();
        assert!(!state.receive_hud(r#"{"phase": "choosing"}"#, 10.0));
        assert!(!state.receive_hud(r#"{"phase":"choosing"}"#, 20.0));
        assert!(state.receive_hud(r#"{"phase":"choosing"}"#, 23.0));
    }
}
