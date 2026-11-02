//! 0.109.0 event publication: native14594b0d0 / formatter1458ea070.
//! Unlike snapshots, every banner is sent, even when equal or HUD-hidden.

use std::sync::atomic::{AtomicU32, Ordering};

use benilla_app::local_client::events::SessionEvent;

use super::addon_feed::AddonMessage;

// Native 14808a5c8 starts at one. It belongs to the process, not a run or VM.
static NEXT_ID: AtomicU32 = AtomicU32::new(1);

pub(super) fn payload(id: u32, kind: &str, boss: bool, name: &str, text: &str) -> String {
    // The native wire leaves commas/semicolon/equals in the final text whole.
    // Only the name has the extra field-delimiter replacement pass.
    let clean = |value: &str, name: bool| {
        value
            .chars()
            .map(|ch| {
                if matches!(ch, '\t' | '\n' | '\r') || (name && matches!(ch, ';' | '=')) {
                    ' '
                } else {
                    ch
                }
            })
            .collect::<String>()
    };
    format!(
        "id={id};kind={kind};boss={};name={};text={}",
        u8::from(boss),
        clean(name, true),
        clean(text, false)
    )
}

pub(in crate::gameplay) fn packet(kind: &str, boss: bool, name: &str, text: &str) -> SessionEvent {
    AddonMessage::new(
        "AZSBANNER",
        payload(
            NEXT_ID.fetch_add(1, Ordering::Relaxed),
            kind,
            boss,
            name,
            text,
        ),
    )
    .packet()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn wire_keeps_final_text_and_unicode_and_cleans_only_native_delimiters() {
        assert_eq!(
            payload(u32::MAX, "guardian", true, "É,中;=\t\n\r", "🙂,;=\t\n\r"),
            "id=4294967295;kind=guardian;boss=1;name=É,中     ;text=🙂,;=   "
        );
        assert_eq!(
            payload(0, "cache", false, "", ""),
            "id=0;kind=cache;boss=0;name=;text="
        );
    }

    #[test]
    fn repeated_banners_are_distinct_immediate_chat_packets() {
        let first = packet("magnet", false, "", "Same");
        let second = packet("magnet", false, "", "Same");
        let SessionEvent::Chat(first) = first else {
            panic!("addon packet")
        };
        let SessionEvent::Chat(second) = second else {
            panic!("addon packet")
        };
        assert_eq!(
            (first.chat_type, first.language, first.sender_guid),
            (6, u32::MAX, 1)
        );
        assert!(first.text.starts_with("AZSBANNER\tid="));
        assert_ne!(first.text, second.text);
    }
}
