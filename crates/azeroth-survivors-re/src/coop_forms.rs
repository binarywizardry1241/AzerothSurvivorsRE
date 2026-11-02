//! Host/code fields retain0.115.0 provenance; current0.127.0 adds Chat field6.
//! See docs/analysis/coop-lobby-ui-0.127.0.md for its current input contract.
//!
//! Strings are retained across tab changes and modal dismissal. Editing counts
//! Unicode scalar values; only the five-character lobby code is ASCII-only.

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) enum FormRequest {
    Host {
        name: String,
        password: String,
        description: String,
        public: bool,
        capacity: u8,
    },
    Join {
        code: String,
        password: String,
    },
    Leave,
    Refresh,
    Chat(String),
    Kick(u64),
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
#[repr(u8)]
pub(crate) enum Field {
    #[default]
    None = 0,
    Name = 1,
    Description = 2,
    HostPassword = 3,
    Code = 4,
    JoinPassword = 5,
    Chat = 6,
}

impl Field {
    fn limit(self) -> usize {
        match self {
            Self::None => 0,
            Self::Description => 120,
            Self::Code => 5,
            Self::Chat => 160,
            _ => 32,
        }
    }

    fn next(self) -> Self {
        match self {
            Self::Name => Self::Description,
            Self::Description => Self::HostPassword,
            Self::HostPassword => Self::Name,
            Self::Code => Self::JoinPassword,
            Self::JoinPassword => Self::Code,
            Self::None => Self::None,
            Self::Chat => Self::Chat,
        }
    }

    fn masked(self) -> bool {
        matches!(self, Self::HostPassword | Self::JoinPassword)
    }
}

#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub(crate) struct Forms {
    pub name: String,
    pub description: String,
    pub host_password: String,
    pub code: String,
    pub join_password: String,
    pub chat: String,
    pub focus: Field,
}

impl Forms {
    pub fn text(&self, field: Field) -> &str {
        match field {
            Field::None => "",
            Field::Name => &self.name,
            Field::Description => &self.description,
            Field::HostPassword => &self.host_password,
            Field::Code => &self.code,
            Field::JoinPassword => &self.join_password,
            Field::Chat => &self.chat,
        }
    }

    fn field_mut(&mut self, field: Field) -> Option<&mut String> {
        match field {
            Field::None => None,
            Field::Name => Some(&mut self.name),
            Field::Description => Some(&mut self.description),
            Field::HostPassword => Some(&mut self.host_password),
            Field::Code => Some(&mut self.code),
            Field::JoinPassword => Some(&mut self.join_password),
            Field::Chat => Some(&mut self.chat),
        }
    }

    pub fn append(&mut self, input: &str) {
        self.append_field(self.focus, input);
    }

    pub fn append_field(&mut self, field: Field, input: &str) {
        let Some(value) = self.field_mut(field) else { return };
        let mut count = value.chars().count();
        for mut character in input.chars() {
            if character.is_control() || count >= field.limit() {
                continue;
            }
            if field == Field::Code {
                if !character.is_ascii_alphanumeric() {
                    continue;
                }
                character = character.to_ascii_uppercase();
            }
            value.push(character);
            count += 1;
        }
    }

    pub fn space(&mut self) {
        if self.focus != Field::Code {
            self.append(" ");
        }
    }

    pub fn backspace(&mut self) {
        self.backspace_field(self.focus);
    }

    pub fn backspace_field(&mut self, field: Field) {
        if let Some(value) = self.field_mut(field) {
            value.pop();
        }
    }

    pub fn tab(&mut self) {
        self.focus = self.focus.next();
    }

    pub fn display(&self, field: Field, placeholder: &str) -> String {
        let value = self.text(field);
        let mut display = if field == Field::Chat && value.is_empty() {
            String::new()
        } else if value.is_empty() {
            placeholder.to_owned()
        } else if field.masked() {
            "•".repeat(value.chars().count())
        } else if field == Field::Chat && value.chars().count() >= 47 {
            let suffix = value.chars().rev().take(45).collect::<String>();
            format!("…{}", suffix.chars().rev().collect::<String>())
        } else {
            value.to_owned()
        };
        if field == Field::Chat || self.focus == field {
            display.push('|');
        }
        display
    }

    pub fn host(&self, public: bool, capacity: u8) -> FormRequest {
        FormRequest::Host {
            name: self.name.clone(),
            password: self.host_password.clone(),
            description: self.description.clone(),
            public,
            capacity: if capacity == 0 { 5 } else { capacity.min(5) },
        }
    }

    pub fn join(&self) -> FormRequest {
        FormRequest::Join {
            // Native145b79680 also normalizes programmatic/prefilled values.
            // Direct directory-row joins preserve their received code instead.
            code: self
                .code
                .bytes()
                .filter(u8::is_ascii_alphanumeric)
                .map(|byte| char::from(byte.to_ascii_uppercase()))
                .collect(),
            password: self.join_password.clone(),
        }
    }
}

pub(crate) fn party_active(status: &str, role: &str) -> bool {
    !role.is_empty() && matches!(status, "hosting" | "joining" | "joined" | "left")
}

pub(crate) fn localized_reason(reason: &str) -> bool {
    matches!(
        reason,
        "the host left"
            | "the co-op service cannot be reached"
            | "the co-op relay cannot be reached"
            | "too many tries; wait a minute"
            | "that lobby name isn't allowed"
            | "a different version of the game"
            | "you left the run"
            | "the run is under way"
            | "that description isn't allowed"
            | "wrong password"
            | "the host sent you away"
            | "no lobby with that code"
            | "too many lobbies open; try again later"
            | "that lobby plays a different version of the game"
            | "the party is full"
            | "already in a lobby"
            | "co-op needs the game's site"
            | "that password is too long"
            | "the host closed the party"
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn chat_counts_unicode_scalars_and_keeps_the_real_draft_when_display_is_shortened() {
        let mut forms = Forms { focus: Field::Name, name: "kept".into(), ..Default::default() };
        assert_eq!(forms.display(Field::Chat, "placeholder"), "|");
        forms.append_field(Field::Chat, &format!("\0{}\u{7f}", "友🐉".repeat(100)));
        assert_eq!(forms.chat.chars().count(), 160);
        assert_eq!(forms.name, "kept");
        assert_eq!(forms.focus, Field::Name);
        let display = forms.display(Field::Chat, "placeholder");
        assert_eq!(display.chars().count(), 47);
        assert!(display.starts_with('…') && display.ends_with('|'));
        assert_eq!(forms.chat.chars().count(), 160);
        forms.backspace_field(Field::Chat);
        assert_eq!(forms.chat.chars().count(), 159);
    }

    #[test]
    fn unicode_limits_controls_backspace_and_masks_follow_native_fields() {
        let mut forms = Forms {
            focus: Field::Name,
            ..Default::default()
        };
        forms.append(&format!("\0{}\u{7f}\u{9f}", "é🐉".repeat(20)));
        assert_eq!(forms.name.chars().count(), 32);
        forms.backspace();
        assert_eq!(forms.name.chars().count(), 31);
        forms.tab();
        forms.append(&"界".repeat(125));
        assert_eq!(forms.description.chars().count(), 120);
        forms.tab();
        forms.append("é🐉");
        assert_eq!(forms.display(Field::HostPassword, "none"), "••|");
        forms.tab();
        assert_eq!(forms.focus, Field::Name);
    }

    #[test]
    fn code_input_and_submission_normalize_only_ascii_letters_and_digits() {
        let mut forms = Forms {
            focus: Field::Code,
            ..Default::default()
        };
        forms.append("k 7-éqf2x");
        forms.space();
        assert_eq!(forms.code, "K7QF2");
        forms.tab();
        forms.append(" p🔒 ");
        forms.tab();
        assert_eq!(forms.focus, Field::Code);
        forms.code = "  k7-qf2é  ".into();
        assert_eq!(
            forms.join(),
            FormRequest::Join {
                code: "K7QF2".into(),
                password: " p🔒 ".into()
            }
        );
        assert_eq!(
            forms.host(true, 0),
            FormRequest::Host {
                name: String::new(),
                password: String::new(),
                description: String::new(),
                public: true,
                capacity: 5,
            }
        );
    }
}
