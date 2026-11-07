//! Current 0.120.2 service reconnection notices, carried by ordinary engine chat.
//!
//! Callers sample transport changes before applying the recovered world and
//! recipient gates. They also supply the selected recipient's locale lookup.
//! See docs/analysis/service-peer-flags.md.

use super::{engine_packets, replication::EnginePacket};
use benilla_protocol::{SessionEvent, messages::ChatMessage};

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Notice<'a> {
    /// The guest observes whether the upstream host is reconnecting.
    Host(bool),
    /// Other world actors observe this peer's state in their own locale.
    Peer { name: &'a str, reconnecting: bool },
    /// The local connection's separate relay retry state.
    Relay(bool),
}

pub fn render(notice: Notice<'_>, mut label: impl FnMut(&str) -> String) -> String {
    let key = match notice {
        Notice::Host(false) => "The host is back.",
        Notice::Host(true) => "The host lost connection, reconnecting...",
        Notice::Peer { reconnecting: false, .. } => "{hero} is back.",
        Notice::Peer { reconnecting: true, .. } => "{hero} lost connection, reconnecting...",
        Notice::Relay(false) => "Reconnected to the party.",
        Notice::Relay(true) => "Your connection to the party dropped, reconnecting...",
    };
    let text = label(key);
    match notice {
        Notice::Peer { name, .. } => substitute_hero(&text, name),
        _ => text,
    }
}

//145b4f3f0 pairs each opening brace with the next closing brace. Unknown or
//unterminated fields survive, and inserted names are never scanned again.
fn substitute_hero(mut text: &str, name: &str) -> String {
    let mut out = String::with_capacity(text.len());
    while let Some(open) = text.find('{') {
        out.push_str(&text[..open]);
        let field = &text[open + 1..];
        let Some(close) = field.find('}') else {
            out.push_str(&text[open..]);
            return out;
        };
        if &field[..close] == "hero" {
            out.push_str(name);
        } else {
            out.push_str(&text[open..open + close + 2]);
        }
        text = &field[close + 1..];
    }
    out.push_str(text);
    out
}

impl Notice<'_> {
    /// Native145c3f980 writes system chat10, universal language, a zero sender
    /// and zero chat tag, retaining the shared engine's real chat consumer.
    pub fn message(self, label: &impl Fn(&str) -> String) -> SessionEvent {
        SessionEvent::Chat(ChatMessage {
            chat_type: 0x0a,
            language: 0,
            sender_guid: 0,
            target_guid: 0,
            sender_name: None,
            channel: None,
            text: render(self, label),
            chat_tag: 0,
        })
    }
}

pub fn packet(
    notice: Notice<'_>,
    label: impl Fn(&str) -> String,
) -> Result<EnginePacket, engine_packets::EncodeError> {
    engine_packets::encode(&notice.message(&label), None)?
        .ok_or(engine_packets::EncodeError::Unsupported)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn all_native_notice_edges_use_system_chat() {
        for (notice, text) in [
            (Notice::Host(false), "The host is back."),
            (Notice::Host(true), "The host lost connection, reconnecting..."),
            (Notice::Peer { name: "Ärie", reconnecting: false }, "Ärie is back."),
            (Notice::Peer { name: "Ärie", reconnecting: true }, "Ärie lost connection, reconnecting..."),
            (Notice::Relay(false), "Reconnected to the party."),
            (Notice::Relay(true), "Your connection to the party dropped, reconnecting..."),
        ] {
            let packet = packet(notice, str::to_owned).unwrap();
            assert_eq!(packet.opcode, 0x96);
            assert_eq!(packet.payload[0], 10);
            assert_eq!(&packet.payload[1..13], &[0; 12]);
            assert_eq!(u32::from_le_bytes(packet.payload[13..17].try_into().unwrap()), text.len() as u32 + 1);
            assert_eq!(&packet.payload[17..packet.payload.len() - 2], text.as_bytes());
            assert_eq!(&packet.payload[packet.payload.len() - 2..], &[0, 0]);
            let messages = packet.decode_server().unwrap();
            assert!(matches!(&messages[..], [SessionEvent::Chat(chat)]
                if chat.text == text && chat.chat_type == 10 && chat.language == 0
                    && chat.sender_guid == 0 && chat.chat_tag == 0));
        }
    }

    #[test]
    fn recipient_translation_precedes_non_recursive_name_substitution() {
        let text = render(Notice::Peer { name: "{hero}|cff00ff00Arie|r", reconnecting: false }, |key| {
            assert_eq!(key, "{hero} is back.");
            "{hero} ist zurück.".into()
        });
        assert_eq!(text, "{hero}|cff00ff00Arie|r ist zurück.");
        assert_eq!(substitute_hero("{{hero}} {unknown} {hero} {hero", "Ärie"),
                   "{{hero}} {unknown} Ärie {hero");
    }
}
