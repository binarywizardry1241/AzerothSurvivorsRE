//! Selected announcement intents. The native helpers keep the inline
//! speaker separate from the body: FrameXML owns `%s` substitution and display.
//! Current raid warning/name contracts: docs/analysis/raid-warnings-0.109.0.md.
//! Earlier arrival owners: docs/analysis/arrival-announcements-0.105.0.md.

use benilla_app::local_client::events::ChatMessage;

#[derive(Clone, Debug, PartialEq)]
pub struct AnnouncementLabel {
    key: String,
    fallback: String,
}

impl AnnouncementLabel {
    fn new(key: String, fallback: &str) -> Self {
        Self {
            key,
            fallback: fallback.to_owned(),
        }
    }

    pub fn enemy(id: u32, name: &str) -> Self {
        // Current14590da23 uses the `enemy.{id}` compact format template;
        // only the boss branch appends `.name`.
        Self::new(format!("enemy.{id}"), name)
    }

    pub fn boss(id: u32, name: &str) -> Self {
        Self::new(format!("boss.{id}.name"), name)
    }

    pub fn literal(key: &str) -> Self {
        Self::new(key.to_owned(), key)
    }

    pub fn boss_yell(id: u32, fallback: &str) -> Self {
        Self::new(format!("boss.{id}.yell"), fallback)
    }

    pub fn boss_phase(id: u32, phase_index: u8, fallback: &str) -> Self {
        Self::new(format!("boss.{id}.phase{}", phase_index + 1), fallback)
    }

    pub(in crate::gameplay) fn render(&self, label: &impl Fn(&str) -> String) -> String {
        let value = label(&self.key);
        if value == self.key {
            self.fallback.clone()
        } else {
            value
        }
    }
}

#[derive(Clone, Debug, PartialEq)]
pub enum RunAnnouncement {
    ///1458a9500: RAID_BOSS_EMOTE, inline name, zero target GUID, raw body.
    Emote {
        name: AnnouncementLabel,
        text: AnnouncementLabel,
    },
    ///1458aae00: MONSTER_YELL, actual source GUID and inline speaker name.
    Yell {
        guid: u64,
        name: AnnouncementLabel,
        text: AnnouncementLabel,
    },
}

impl RunAnnouncement {
    pub fn emote(name: AnnouncementLabel, text: &str) -> Self {
        Self::Emote {
            name,
            text: AnnouncementLabel::literal(text),
        }
    }

    /// Current1458c1260: warning text shares RAID_BOSS_EMOTE with arrival
    /// notices. It does not use MonsterYell or a custom replacement overlay.
    pub fn raid_warning(
        name: AnnouncementLabel,
        warning: azeroth_survivors_re::bosses::raid_warnings::RaidWarning,
    ) -> Self {
        Self::emote(name, warning.text())
    }

    pub fn chat(&self, lookup: &impl Fn(&str) -> Option<String>) -> ChatMessage {
        let (chat_type, sender_guid, name, text) = match self {
            Self::Emote { name, text } => (0x5a, 0, name, text),
            Self::Yell { guid, name, text } => (0x0c, *guid, name, text),
        };
        ChatMessage {
            chat_type,
            language: 0,
            sender_guid,
            target_guid: 0,
            sender_name: Some(lookup(&name.key).unwrap_or_else(|| name.fallback.clone())),
            channel: None,
            text: lookup(&text.key).unwrap_or_else(|| text.fallback.clone()),
            chat_tag: 0,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn arrival_preserves_separate_localized_name_and_percent_slot() {
        let event = RunAnnouncement::emote(
            AnnouncementLabel::enemy(603, "Riverpaw Gnoll"),
            "%s approaches!",
        );
        let message = event.chat(&|key| match key {
            "enemy.603" => Some("Gnoll localisé".into()),
            "%s approaches!" => Some("%s approche !".into()),
            _ => None,
        });
        assert_eq!(
            (message.chat_type, message.sender_guid, message.target_guid),
            (0x5a, 0, 0)
        );
        assert_eq!(message.sender_name.as_deref(), Some("Gnoll localisé"));
        assert_eq!(message.text, "%s approche !");
        assert_eq!((message.language, message.chat_tag), (0, 0));
        assert!(message.channel.is_none());
    }

    #[test]
    fn raid_warning_keeps_localized_guardian_and_raw_speaker_slot() {
        use azeroth_survivors_re::bosses::raid_warnings::RaidWarning;
        let event = RunAnnouncement::raid_warning(
            AnnouncementLabel::enemy(1311, "Guardian"), RaidWarning::Tether);
        let message = event.chat(&|key| match key {
            "enemy.1311" => Some("Gardien".into()),
            "%s's tether drains you! Get away to break it!" => Some("%s vous lie ! Éloignez-vous !".into()),
            _ => None,
        });
        assert_eq!((message.chat_type, message.sender_guid, message.target_guid), (0x5a, 0, 0));
        assert_eq!(message.sender_name.as_deref(), Some("Gardien"));
        assert_eq!(message.text, "%s vous lie ! Éloignez-vous !");
        assert_eq!((message.language, message.chat_tag), (0, 0));
        assert!(message.channel.is_none());
    }

    #[test]
    fn boss_yell_keeps_actor_guid_and_independent_key_fallbacks() {
        let event = RunAnnouncement::Yell {
            guid: 0xf1300002b2000007,
            name: AnnouncementLabel::boss(690, "Hogger"),
            text: AnnouncementLabel::boss_yell(690, "Grrr... fresh meat!"),
        };
        let fallback = event.chat(&|_| None);
        assert_eq!(fallback.chat_type, 0x0c);
        assert_eq!(fallback.sender_guid, 0xf1300002b2000007);
        assert_eq!(fallback.sender_name.as_deref(), Some("Hogger"));
        assert_eq!(fallback.text, "Grrr... fresh meat!");
        let localized = event.chat(&|key| match key {
            "boss.690.yell" => Some("Viande fraîche !".into()),
            _ => None,
        });
        assert_eq!(localized.sender_name, fallback.sender_name);
        assert_eq!(localized.text, "Viande fraîche !");
    }

    #[test]
    fn scheduled_arrival_keeps_yell_notice_sound_order_and_does_not_replay() {
        use super::super::{
            RunEvent,
            rng_integration::{TerrainFixture, class_run},
        };
        let mut game = class_run("priest", 0);
        let zone = azeroth_survivors_re::bosses::catalog::ZoneDefinition::by_key("elwynn").unwrap();
        let definition = &zone.bosses[0];
        game.events.clear();
        game.clock = definition.time_minutes * 60.0;
        game.spawn_due_bosses(game.zone.center.into(), [0.0; 2], &mut TerrainFixture);
        let guid = game.bosses[0].guid;
        let RunEvent::Announcement(yell) = &game.events[0] else {
            panic!("entry yell first")
        };
        let yell = yell.chat(&|_| None);
        assert_eq!((yell.chat_type, yell.sender_guid), (0x0c, guid));
        assert_eq!(yell.sender_name.as_deref(), Some(definition.name));
        assert_eq!(yell.text, definition.yell);
        let RunEvent::Announcement(notice) = &game.events[1] else {
            panic!("arrival notice second")
        };
        let notice = notice.chat(&|_| None);
        assert_eq!(notice.chat_type, 0x5a);
        assert_eq!(notice.sender_name.as_deref(), Some(definition.name));
        assert_eq!(notice.text, "%s enters the battlefield!");
        assert!(matches!(game.events[2], RunEvent::PlaySound(8174)));
        game.events.clear();
        game.spawn_due_bosses(game.zone.center.into(), [0.0; 2], &mut TerrainFixture);
        assert!(game.events.is_empty());
    }
}
