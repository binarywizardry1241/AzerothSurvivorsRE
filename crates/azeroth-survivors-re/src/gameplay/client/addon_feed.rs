//! Addon publication: five polls per real second, changed
//! payloads only, through the existing inbound CHAT_MSG_ADDON packet path.
//! The interval and changed-byte gates are revalidated against 0.109.0.

use std::collections::BTreeMap;

use benilla_app::local_client::events::{ChatMessage, SessionEvent};

use super::detailed_feed::Recipient;

pub(super) use super::super::addon_meters::field;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(in crate::gameplay) enum MeterRequest {
    Full,
    Party,
    Lines,
}

impl MeterRequest {
    pub fn parse(text: &str) -> Option<Self> {
        match text.strip_prefix("AZSMREQ\t")?.trim() {
            "full" => Some(Self::Full),
            "party" => Some(Self::Party),
            "lines" => Some(Self::Lines),
            _ => None,
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub(in crate::gameplay) struct AddonMessage {
    pub prefix: &'static str,
    pub payload: String,
}

impl AddonMessage {
    pub fn new(prefix: &'static str, payload: String) -> Self {
        Self { prefix, payload }
    }

    /// Native1458c35d0 sends chat type6, LANG_ADDON, the actual player GUID,
    /// and prefix + TAB + payload. The client resolves channel/sender and
    /// invokes the API frame before later addon registrations.
    pub(super) fn packet_from(self, player_guid: u64) -> SessionEvent {
        SessionEvent::Chat(ChatMessage {
            chat_type: 6,
            language: u32::MAX,
            sender_guid: player_guid,
            target_guid: 0,
            sender_name: None,
            channel: None,
            text: format!("{}\t{}", self.prefix, self.payload),
            chat_tag: 0,
        })
    }
}

#[derive(Default)]
pub(in crate::gameplay) struct Publisher {
    identity: Option<u64>,
    polled_at: f64,
    cached: BTreeMap<&'static str, String>,
    pub(in crate::gameplay) detailed: Recipient,
}

impl Publisher {
    /// The Game-absent server still advances its poll clock. Menu/Logout retains
    /// its old payloads; successful next-Game creation owns their invalidation.
    pub fn idle(&mut self, now: f64) {
        self.poll_due(now);
    }

    /// A new Game clears the previous identity's payloads.
    pub fn due(&mut self, identity: u64, now: f64) -> bool {
        let key = Some(identity);
        if self.identity != key {
            self.identity = key;
            self.cached.clear();
            self.detailed.reset_run();
        }
        self.poll_due(now)
    }

    pub fn request(&mut self, request: MeterRequest) {
        match request {
            MeterRequest::Full => {
                self.cached.clear();
                self.detailed.replay();
            }
            MeterRequest::Party => self.detailed.include_party(),
            MeterRequest::Lines => self.cached.clear(),
        }
    }

    fn poll_due(&mut self, now: f64) -> bool {
        // Native UCOMISD/JB at 1458af483 skips both a short interval and an
        // unordered clock. A NaN must not poison the retained poll timestamp.
        if now - self.polled_at >= 0.2 {
            self.polled_at = now;
            true
        } else {
            false
        }
    }

    pub fn changed(&mut self, snapshot: Vec<AddonMessage>) -> Vec<SessionEvent> {
        self.changed_from(snapshot, 1)
    }

    /// Co-op bodies retain their admitted identity rather than solo GUID one.
    pub fn changed_from(
        &mut self,
        snapshot: Vec<AddonMessage>,
        player_guid: u64,
    ) -> Vec<SessionEvent> {
        snapshot
            .into_iter()
            .filter_map(|message| {
                if self.cached.get(message.prefix).map_or("", String::as_str) == message.payload {
                    return None;
                }
                self.cached.insert(message.prefix, message.payload.clone());
                Some(message.packet_from(player_guid))
            })
            .collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn admitted_guest_identity_is_preserved_without_changing_cache_keys() {
        let mut publisher = Publisher::default();
        let snapshot = || vec![AddonMessage::new("AZSRUN", "ph=playing".into())];
        let packets = publisher.changed_from(snapshot(), 0xf130_1234_0000_0042);
        let SessionEvent::Chat(chat) = &packets[0] else {
            panic!("addon chat")
        };
        assert_eq!(chat.sender_guid, 0xf130_1234_0000_0042);
        assert_eq!(chat.text, "AZSRUN\tph=playing");
        assert!(
            publisher
                .changed_from(snapshot(), 0xf130_1234_0000_0042)
                .is_empty()
        );
    }

    #[test]
    fn changed_streams_include_clears_and_new_run_hydration() {
        let snapshot = || {
            vec![
                AddonMessage::new("AZSUNITS", "boss,7,Boss,1,2,0".into()),
                AddonMessage::new("AZSCHESTS", String::new()),
            ]
        };
        let mut publisher = Publisher::default();
        assert!(publisher.due(1, 1.0));
        assert_eq!(publisher.changed(snapshot()).len(), 1);
        assert!(!publisher.due(1, 1.1));
        assert!(publisher.due(1, 1.25));
        assert!(publisher.changed(snapshot()).is_empty());
        assert_eq!(
            publisher
                .changed(vec![AddonMessage::new("AZSUNITS", String::new())])
                .len(),
            1
        );
        publisher.changed(snapshot());
        assert!(!publisher.due(1, 1.26));
        assert!(!publisher.cached.is_empty(), "the client VM does not clear server payloads");
        assert!(publisher.due(1, 1.5));
        assert!(publisher.changed(snapshot()).is_empty());
        assert!(!publisher.due(2, 1.6));
        assert!(publisher.cached.is_empty());
        assert!(publisher.due(2, 1.75));
        assert_eq!(publisher.changed(snapshot()).len(), 1);
    }

    #[test]
    fn lines_request_replays_a_recipient_without_resetting_the_poll_clock() {
        assert_eq!(MeterRequest::parse("AZSMREQ\tfull"), Some(MeterRequest::Full));
        assert_eq!(MeterRequest::parse("AZSMREQ\t party "), Some(MeterRequest::Party));
        assert_eq!(MeterRequest::parse("AZSMREQ\tlines"), Some(MeterRequest::Lines));
        assert_eq!(MeterRequest::parse("AZSMREQ\tfuller"), None);
        assert_eq!(MeterRequest::parse("OTHER\tfull"), None);
        let mut publisher = Publisher::default();
        let snapshot = || vec![AddonMessage::new("AZSZONE", "run=1-1".into())];
        assert!(publisher.due(1, 1.0));
        assert_eq!(publisher.changed(snapshot()).len(), 1);
        publisher.request(MeterRequest::Party);
        assert!(publisher.changed(snapshot()).is_empty());
        publisher.request(MeterRequest::Lines);
        assert!(!publisher.due(1, 1.125));
        assert!(publisher.due(1, 1.25));
        assert_eq!(publisher.changed(snapshot()).len(), 1);
        assert!(publisher.changed(snapshot()).is_empty());
    }

    #[test]
    fn solo_revive_empty_payload_uses_the_ordinary_cache_lifetime() {
        let empty = || vec![AddonMessage::new("AZSREVIVE", String::new())];
        let mut publisher = Publisher::default();
        assert!(publisher.due(1, 1.0));
        assert!(publisher.changed(empty()).is_empty());
        // A synthetic prior payload exercises the existing clear branch only;
        // the live solo producer never constructs nonempty party revive data.
        publisher.changed(vec![AddonMessage::new("AZSREVIVE", "down=1".into())]);
        let clears = publisher.changed(empty());
        assert_eq!(clears.len(), 1);
        let SessionEvent::Chat(packet) = &clears[0] else { panic!("addon chat") };
        assert_eq!(packet.text, "AZSREVIVE\t");
        assert!(publisher.changed(empty()).is_empty());
        assert!(publisher.due(2, 1.25));
        assert!(publisher.changed(empty()).is_empty());
    }

    #[test]
    fn unordered_poll_time_does_not_advance_the_native_gate() {
        let mut publisher = Publisher::default();
        assert!(publisher.due(1, 1.0));
        assert!(!publisher.due(1, f64::NAN));
        assert!(!publisher.due(1, 1.1));
        assert!(publisher.due(1, 1.25));
    }

    #[test]
    fn constructor_and_run_resets_keep_the_server_poll_cadence() {
        let mut publisher = Publisher::default();
        assert!(!publisher.due(1, f64::NAN));
        assert!(!publisher.due(1, 0.199));
        assert!(publisher.due(1, 0.2));
        publisher.changed(vec![AddonMessage::new("AZSRUN", "ph=playing".into())]);
        assert!(!publisher.due(2, 0.25));
        assert!(publisher.cached.is_empty(), "new run clears before the poll gate");
        assert_eq!(publisher.polled_at, 0.2);

        publisher.changed(vec![AddonMessage::new("AZSRUN", "ph=playing".into())]);
        publisher.idle(0.4);
        assert_eq!(publisher.polled_at, 0.4, "an idle server still polls");
        assert_eq!(publisher.identity, Some(2));
        assert!(!publisher.cached.is_empty(), "Menu leaves invalidation to the next Game");
        publisher.idle(f64::NAN);
        assert_eq!(publisher.polled_at, 0.4);
        assert!(!publisher.due(3, 0.45));
        assert!(publisher.due(3, 0.65));
    }

    #[test]
    fn native_addon_packet_preserves_delimiters_and_empty_lists() {
        let SessionEvent::Chat(packet) = AddonMessage::new("AZSUNITS", String::new()).packet_from(1)
        else {
            panic!("addon chat")
        };
        assert_eq!(
            (packet.chat_type, packet.language, packet.sender_guid),
            (6, u32::MAX, 1)
        );
        assert_eq!(packet.text, "AZSUNITS\t");
    }
}
