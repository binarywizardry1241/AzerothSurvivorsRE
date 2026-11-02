//! Current 0.109.0 earned keys and optional first-earned Unix timestamps.
//! Typed date parsing/duplicates share save/schema.rs; see docs/analysis/save-schema-0.109.0.md.
use super::Save;
use std::collections::{BTreeMap, BTreeSet};

impl Save {
    pub fn earned_achievements(&self) -> BTreeSet<String> {
        self.lines
            .iter()
            .filter_map(|line| line.trim().strip_prefix("ach|"))
            .flat_map(|row| row.split(','))
            .filter(|key| !key.is_empty())
            .map(str::to_owned)
            .collect()
    }
    pub fn achievement_dates(&self) -> BTreeMap<String, u64> {
        super::schema::achievement_dates(&self.lines)
    }
    /// Native stamps only a newly inserted key when the caller supplies a date.
    /// Startup/reload grants use None; previously earned undated keys stay undated.
    pub fn grant_achievements(&mut self, keys: &[String], earned_at: Option<u64>) -> Vec<String> {
        let mut earned = self.earned_achievements();
        let mut dates = self.achievement_dates();
        let mut granted = Vec::new();
        for key in keys {
            if key.is_empty()
                || key.contains(['|', ',', '=', '\r', '\n'])
                || !earned.insert(key.clone())
            {
                continue;
            }
            if let Some(seconds) = earned_at {
                dates.entry(key.clone()).or_insert(seconds);
            }
            granted.push(key.clone());
        }
        if granted.is_empty() {
            return granted;
        }
        self.lines
            .retain(|line| !line.trim().starts_with("ach|") && !line.trim().starts_with("achat|"));
        self.lines.push(format!(
            "ach|{}",
            earned.into_iter().collect::<Vec<_>>().join(",")
        ));
        if !dates.is_empty() {
            self.lines.push(format!(
                "achat|{}",
                dates
                    .iter()
                    .map(|(key, seconds)| format!("{key}={seconds}"))
                    .collect::<Vec<_>>()
                    .join(",")
            ));
        }
        granted
    }
    pub fn beaten_zones(&self) -> BTreeSet<(u8, usize)> {
        self.lines
            .iter()
            .filter_map(|line| {
                let mut fields = line.trim().split('|');
                if fields.next() != Some("beat") {
                    return None;
                }
                let class = fields.next()?.parse::<u8>().ok()?;
                Some((class, fields.next()?))
            })
            .flat_map(|(class, row)| {
                row.split(',').filter_map(move |key| {
                    super::progress::zones()
                        .iter()
                        .position(|zone| zone.key == key)
                        .map(|index| (class, index))
                })
            })
            .collect()
    }
    /// Current14552fae0 derives prior clears from open-zone ordinals and maxes
    /// lifetime runs/wins against the permanent roster before testing definitions.
    pub fn normalize_achievement_inputs(&mut self) -> bool {
        let before = self.plaintext();
        let mut beaten = self.beaten_zones();
        for (class, open) in super::progress::values(&self.lines) {
            for zone in 0..open.saturating_sub(1) as usize {
                beaten.insert((class, zone));
            }
        }
        let mut stats = self.statistics();
        let heroes = self.characters();
        for (key, sum) in [
            (
                "runs",
                heroes.iter().map(|hero| u64::from(hero.runs)).sum::<u64>(),
            ),
            (
                "wins",
                heroes.iter().map(|hero| u64::from(hero.wins)).sum::<u64>(),
            ),
        ] {
            if sum > stats.get(key).copied().unwrap_or(0) {
                stats.insert(key.to_owned(), sum);
            }
        }
        self.lines
            .retain(|line| !line.trim().starts_with("beat|") && !line.trim().starts_with("stat|"));
        for class in super::CLASS_IDS {
            let keys = super::progress::zones()
                .iter()
                .enumerate()
                .filter(|(index, _)| beaten.contains(&(class, *index)))
                .map(|(_, zone)| zone.key.as_str())
                .collect::<Vec<_>>();
            if !keys.is_empty() {
                self.lines.push(format!("beat|{class}|{}", keys.join(",")));
            }
        }
        if !stats.is_empty() {
            self.lines.push(format!(
                "stat|{}",
                stats
                    .iter()
                    .map(|(key, value)| format!("{key}={value}"))
                    .collect::<Vec<_>>()
                    .join(",")
            ));
        }
        before != self.plaintext()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn grant_retains_first_date_and_keeps_legacy_undated_keys_undated() {
        let mut save =
            Save::parse("ach|legacy,dated\nachat|dated=100\nspec|1|0|||\nunknown|keep\n").unwrap();
        let keys = ["legacy", "dated", "new", "new"].map(str::to_owned);
        assert_eq!(save.grant_achievements(&keys, Some(200)), ["new"]);
        assert_eq!(
            save.achievement_dates(),
            BTreeMap::from([("dated".into(), 100), ("new".into(), 200)])
        );
        assert!(save.grant_achievements(&keys, Some(300)).is_empty());
        assert!(!save.plaintext().contains("unknown|keep"));
        assert_eq!(
            save.grant_achievements(&["retroactive".into()], None),
            ["retroactive"]
        );
        assert!(!save.achievement_dates().contains_key("retroactive"));
    }
}
