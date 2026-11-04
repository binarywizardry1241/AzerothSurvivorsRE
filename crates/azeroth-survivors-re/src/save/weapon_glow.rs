//! Class weapon-glow rows, including the 0.140.0 Lifestealing selection.
//! Raw recognized choices survive load; achievement admission belongs to the
//! getter/setter, so a locked stored selection is retained and resolves to Icy Chill.
use super::{Save, CLASS_IDS};
use azeroth_survivors_re::armory_cosmetics;

pub(super) fn rows(lines: &[String]) -> Vec<(u8, u32)> {
    let mut choices = Vec::new();
    for line in lines {
        let fields: Vec<_> = line.trim().split('|').collect();
        let ["glow", class, enchant] = fields.as_slice() else {
            continue;
        };
        let (Ok(class), Ok(enchant)) = (class.parse::<u8>(), enchant.parse::<u32>()) else {
            continue;
        };
        if !CLASS_IDS.contains(&class) || !matches!(enchant, 0 | 803 | 1894 | 1898 | 1899 | 1900) {
            continue;
        }
        // The native parser removes a preceding class row, then appends this
        // valid row. Invalid later rows never erase an earlier selection.
        choices.retain(|(old_class, _)| *old_class != class);
        choices.push((class, enchant));
    }
    choices
}

pub(super) fn records(lines: &[String]) -> Vec<String> {
    rows(lines)
        .into_iter()
        .map(|(class, enchant)| format!("glow|{class}|{enchant}"))
        .collect()
}

impl Save {
    pub fn weapon_glow(&self, class: u8) -> u32 {
        let saved = rows(&self.lines)
            .into_iter()
            .find(|(owner, _)| *owner == class)
            .map(|(_, enchant)| enchant);
        let achieved = self.earned_achievements();
        armory_cosmetics::selected_weapon_glow(saved, |key| achieved.contains(key))
    }

    /// Returns whether the current account admits this selection. The normal
    /// account-command owner persists accepted changes; this method performs no I/O.
    pub fn set_weapon_glow(&mut self, class: u8, enchant: u32) -> bool {
        let achieved = self.earned_achievements();
        if !armory_cosmetics::weapon_glow_unlocked(enchant, |key| achieved.contains(key)) {
            return false;
        }
        let mut choices = rows(&self.lines);
        choices.retain(|(owner, _)| *owner != class);
        choices.push((class, enchant));
        self.replace_runtime_records(
            |line| line.starts_with("glow|"),
            choices
                .into_iter()
                .map(|(owner, choice)| format!("glow|{owner}|{choice}")),
        );
        true
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn achievement_unlocks_a_retained_glow_without_changing_its_first_date() {
        for (enchant, achievement) in [(1899, "coop:insane"), (1898, "heroic:prepared")] {
            let line = format!("glow|1|{enchant}");
            let mut save = Save::parse(&format!("{line}\nglow|2|0\n")).unwrap();
            assert_eq!(save.weapon_glow(1), 1894);
            let locked = save.plaintext();
            assert!(locked.contains(line.as_str()));
            assert!(!save.set_weapon_glow(1, enchant));
            assert_eq!(save.plaintext(), locked);
            let keys = vec![achievement.to_owned()];
            assert_eq!(save.grant_achievements(&keys, Some(1000)), keys);
            assert_eq!(save.weapon_glow(1), enchant);
            assert!(save.set_weapon_glow(1, enchant));
            assert_eq!(save.weapon_glow(2), 0);
            assert!(save.grant_achievements(&keys, Some(2000)).is_empty());
            let restored = Save::parse(&save.plaintext()).unwrap();
            assert_eq!(restored.weapon_glow(1), enchant);
            assert_eq!(restored.achievement_dates().get(achievement), Some(&1000));
            assert_eq!(armory_cosmetics::weapon_glow(enchant, 15, 123, 0), enchant);
            assert_eq!(armory_cosmetics::weapon_glow(enchant, 15, 0, 5), 0);
        }
    }
}
