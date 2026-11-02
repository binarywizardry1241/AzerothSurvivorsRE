//! Selected 0.109.0 encounter warnings, emitted at the owning action's
//! recovered warning stage. Native14595b19d localizes the template before
//!1458c1260 sends RAID_BOSS_EMOTE with the speaker kept separately.
//! See docs/analysis/raid-warnings-0.109.0.md.

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum RaidWarning {
    SweepingGaze,
    Eggs,
    HealingWards,
    ShieldingWards,
    Tether,
    Gaze,
    BurningGround,
    Bomb,
    Crystals,
    Towers,
    StandStill,
    Shielded,
    Weakened,
}

impl RaidWarning {
    /// This selects text only; the actual producer owns admission and emission
    /// timing. Native22 selects the ward warning from payload word0.
    pub const fn for_native_action(tag: u8, payload_kind: u32) -> Option<Self> {
        Some(match tag {
            15 => Self::SweepingGaze,
            22 => match payload_kind {
                0 => Self::Eggs,
                1 => Self::HealingWards,
                _ => Self::ShieldingWards,
            },
            25 => Self::Tether,
            23 => Self::Shielded,
            26 => Self::Gaze,
            28 => Self::BurningGround,
            30 => Self::Bomb,
            33 => Self::Crystals,
            _ => return None,
        })
    }

    /// Keep native `%s` slots intact. The real FrameXML chat/emote consumer
    /// substitutes the localized inline speaker, after template localization.
    pub const fn text(self) -> &'static str {
        match self {
            Self::SweepingGaze => "%s's gaze sweeps the field!",
            Self::Eggs => "Destroy them before they hatch!",
            Self::HealingWards => "%s is healed by its wards! Destroy them!",
            Self::ShieldingWards => "%s is shielded by its wards! Destroy them!",
            Self::Tether => "%s's tether drains you! Get away to break it!",
            Self::Gaze => "%s fixes its gaze on you! Do not move!",
            Self::BurningGround => "The ground burns around you! Stay inside the circle!",
            Self::Bomb => "You are the bomb! Carry it into the horde!",
            Self::Crystals => "Stand in a crystal to weaken %s!",
            Self::Towers => "Get in a tower!",
            Self::StandStill => "Stand still!",
            Self::Shielded => "%s is shielded!",
            Self::Weakened => "%s is weakened!",
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_ward_selector_has_one_catch_all_shield_branch() {
        assert_eq!(RaidWarning::for_native_action(22, 0), Some(RaidWarning::Eggs));
        assert_eq!(RaidWarning::for_native_action(22, 1), Some(RaidWarning::HealingWards));
        for kind in [2, 3, u32::MAX] {
            assert_eq!(RaidWarning::for_native_action(22, kind), Some(RaidWarning::ShieldingWards));
        }
        assert_eq!(RaidWarning::for_native_action(27, 0), None);
    }
}
