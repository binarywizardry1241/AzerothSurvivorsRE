//! Selected-secondary policy from the current service pump145c56f30.
use std::time::Instant;

#[derive(Debug, PartialEq, Eq)]
pub enum Action {
    None,
    Heartbeat,
    Reopen,
    Fallback,
    Failed,
}

pub struct SecondaryLifetime {
    started: Instant,
    received: Instant,
    heartbeat: Instant,
    retry_started: Option<Instant>,
    admitted: bool,
    failed: bool,
    fallback: bool,
}

fn elapsed(now: Instant, from: Instant) -> f32 {
    let duration = now.saturating_duration_since(from);
    duration.as_secs() as f32 + duration.subsec_nanos() as f32 / 1_000_000_000.0
}

impl SecondaryLifetime {
    pub fn new(now: Instant) -> Self {
        Self {
            started: now,
            received: now,
            heartbeat: now,
            retry_started: None,
            admitted: false,
            failed: false,
            fallback: false,
        }
    }

    pub fn with_fallback(now: Instant, available: bool) -> Self {
        Self {
            fallback: available,
            ..Self::new(now)
        }
    }

    /// Every binary arrival refreshes silence time, including a malformed one.
    pub fn received(&mut self, now: Instant) {
        self.received = now;
    }

    /// A valid non-refusal event admits retries and completes any current retry.
    /// A repeated refusal closes the secondary without forwarding it again.
    pub fn admit(&mut self, refused: bool) -> bool {
        if refused {
            self.failed = true;
            !self.admitted
        } else {
            self.admitted = true;
            self.retry_started = None;
            true
        }
    }

    pub fn failed(&self) -> bool {
        self.failed
    }

    pub fn initial_failure(&self) -> bool {
        self.failed && !self.admitted
    }

    /// The factory/authentication/heartbeat transaction samples fresh clocks
    /// after publishing the replacement transport.
    pub fn reopened(&mut self, now: Instant) {
        self.started = now;
        self.received = now;
        self.heartbeat = now;
    }

    pub fn reconnecting(&self) -> bool {
        !self.failed && self.retry_started.is_some()
    }

    pub fn can_send(&self, connected: bool) -> bool {
        connected && !self.failed && self.retry_started.is_none()
    }

    /// State0 is connecting, state1 connected, and state2 closed. The native
    /// retry deadline is evaluated when the selected socket becomes unhealthy.
    pub fn poll(&mut self, state: u8, now: Instant) -> Action {
        if self.failed {
            return Action::Failed;
        }
        let healthy = match state {
            0 => elapsed(now, self.started) <= 8.0,
            1 => elapsed(now, self.received) <= 15.0,
            _ => false,
        };
        if healthy {
            if state == 1 && elapsed(now, self.heartbeat) >= 5.0 {
                self.heartbeat = now;
                return Action::Heartbeat;
            }
            return Action::None;
        }
        if !self.admitted {
            if std::mem::take(&mut self.fallback) {
                self.reopened(now);
                return Action::Fallback;
            }
            self.failed = true;
            return Action::Failed;
        }
        if let Some(started) = self.retry_started {
            if elapsed(now, started) > 45.0 {
                self.failed = true;
                return Action::Failed;
            }
            if elapsed(now, self.started) < 2.0 {
                return Action::None;
            }
        } else {
            self.retry_started = Some(now);
        }
        self.reopened(now);
        Action::Reopen
    }
}

/// Native string policy removes the final authority port suffix and keeps the
/// scheme/path. The existing WebSocket URL implementation supplies its default
/// port; this deliberately does not normalize or reinterpret the endpoint.
pub fn alternate_endpoint(url: &str) -> Option<String> {
    let (scheme, rest) = url.split_once("://")?;
    let (authority, path) = rest.split_once('/').unwrap_or((rest, ""));
    let (host, _) = authority.rsplit_once(':')?;
    Some(format!("{scheme}://{host}/{path}"))
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::time::Duration;

    #[test]
    fn initial_fallback_is_once_and_restarts_all_attempt_clocks() {
        let now = Instant::now();
        let mut state = SecondaryLifetime::with_fallback(now, true);
        let fallback = now + Duration::from_millis(8001);
        assert_eq!(state.poll(0, fallback), Action::Fallback);
        assert!(!state.failed());
        assert!(!state.reconnecting());
        assert_eq!(state.poll(0, fallback + Duration::from_secs(8)), Action::None);
        assert_eq!(
            state.poll(2, fallback + Duration::from_secs(8)),
            Action::Failed
        );
        assert!(state.initial_failure());
    }

    #[test]
    fn admission_and_refusal_do_not_take_initial_fallback() {
        let now = Instant::now();
        let mut admitted = SecondaryLifetime::with_fallback(now, true);
        admitted.admit(false);
        assert_eq!(admitted.poll(2, now), Action::Reopen);
        assert!(!admitted.initial_failure());
        let mut refused = SecondaryLifetime::with_fallback(now, true);
        refused.admit(true);
        assert_eq!(refused.poll(2, now), Action::Failed);
        assert!(refused.initial_failure());
    }

    #[test]
    fn alternate_endpoint_preserves_native_authority_and_path_policy() {
        assert_eq!(
            alternate_endpoint("wss://relay:8443/path:q?x#y"),
            Some("wss://relay/path:q?x#y".into())
        );
        assert_eq!(
            alternate_endpoint("ws://relay:8080"),
            Some("ws://relay/".into())
        );
        assert_eq!(
            alternate_endpoint("wss://[::1]:8443/a"),
            Some("wss://[::1]/a".into())
        );
        assert_eq!(alternate_endpoint("wss://relay/path:port"), None);
        assert_eq!(alternate_endpoint("relay:8443/path"), None);
    }

    #[test]
    fn first_attempt_limits_and_heartbeat_use_native_boundaries() {
        let now = Instant::now();
        let mut state = SecondaryLifetime::new(now);
        assert_eq!(state.poll(0, now + Duration::from_secs(8)), Action::None);
        assert_eq!(
            state.poll(0, now + Duration::from_millis(8001)),
            Action::Failed
        );
        let mut state = SecondaryLifetime::new(now);
        assert_eq!(
            state.poll(1, now + Duration::from_secs(5)),
            Action::Heartbeat
        );
        assert_eq!(
            state.poll(1, now + Duration::from_secs(15)),
            Action::Heartbeat
        );
        assert_eq!(
            state.poll(1, now + Duration::from_millis(15001)),
            Action::Failed
        );
    }

    #[test]
    fn admitted_socket_retries_until_a_valid_event_or_deadline() {
        let now = Instant::now();
        let mut state = SecondaryLifetime::new(now);
        state.admit(false);
        assert_eq!(state.poll(2, now), Action::Reopen);
        assert!(state.reconnecting());
        assert!(!state.can_send(true));
        assert_eq!(
            state.poll(2, now + Duration::from_millis(1999)),
            Action::None
        );
        assert_eq!(state.poll(2, now + Duration::from_secs(2)), Action::Reopen);
        assert_eq!(state.poll(2, now + Duration::from_secs(45)), Action::Reopen);
        assert_eq!(
            state.poll(2, now + Duration::from_millis(45001)),
            Action::Failed
        );
        let mut state = SecondaryLifetime::new(now);
        state.admit(false);
        state.poll(2, now);
        state.received(now + Duration::from_secs(1));
        state.admit(false);
        assert!(!state.reconnecting());
        assert!(state.can_send(true));
    }

    #[test]
    fn malformed_arrivals_refresh_silence_but_do_not_admit_retry() {
        let now = Instant::now();
        let mut state = SecondaryLifetime::new(now);
        state.received(now + Duration::from_secs(10));
        assert_eq!(
            state.poll(1, now + Duration::from_secs(25)),
            Action::Heartbeat
        );
        assert_eq!(state.poll(2, now + Duration::from_secs(25)), Action::Failed);
        let mut state = SecondaryLifetime::new(now);
        assert!(state.admit(true));
        assert!(state.failed());
        let mut state = SecondaryLifetime::new(now);
        state.admit(false);
        assert!(!state.admit(true));
        assert!(state.failed());
    }
}
