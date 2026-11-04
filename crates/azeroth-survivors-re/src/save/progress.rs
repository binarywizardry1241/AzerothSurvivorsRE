//! Legacy nine-zone migration and current 0.109.0 open/beat unlock restoration.
//! Revalidated through the complete parser/serializer in docs/analysis/save-schema-0.109.0.md.

use serde::Deserialize;
use std::collections::BTreeSet;
use std::sync::OnceLock;

// This is the old on-disk ordinal table, not the current catalog order.
const LEGACY_ZONES: [&str; 9] = [
    "elwynn", "duskwood", "wsg", "ab", "feralas", "arena", "av", "brm", "aq",
];

#[derive(Deserialize)]
struct Catalog {
    zones: Vec<Zone>,
}
#[derive(Deserialize)]
pub(super) struct Zone {
    pub(super) key: String,
}

pub(super) fn zones() -> &'static [Zone] {
    static CATALOG: OnceLock<Catalog> = OnceLock::new();
    &CATALOG
        .get_or_init(|| {
            serde_json::from_str(include_str!("../../assets/menu.json"))
                .expect("recovered current menu zone keys")
        })
        .zones
}

pub(super) fn normalized_zone(value: &str) -> &str {
    zones()
        .iter()
        .find(|zone| zone.key == value)
        .unwrap_or(&zones()[0])
        .key
        .as_str()
}

fn record(line: &str) -> Option<(u8, u64)> {
    let fields: Vec<_> = line.trim().split('|').collect();
    if fields.len() != 3 {
        return None;
    }
    let class = fields[1].parse::<u8>().ok()?;
    let key = match fields[0] {
        "unlock" => {
            let old = fields[2].parse::<u64>().ok()?.clamp(1, 9);
            LEGACY_ZONES[(old - 1) as usize]
        }
        "open" => fields[2],
        _ => return None,
    };
    let ordinal = zones().iter().position(|zone| zone.key == key)? + 1;
    Some((class, ordinal as u64))
}

pub(super) fn values(lines: &[String]) -> Vec<(u8, u64)> {
    // Current14589e380 collects/sorts/deduplicates beat pairs, then merges
    // min(zone_index + 2, zone count) into each class's maximum.
    // Keep the explicit open/legacy records first, as in the native loader.
    let mut beaten = BTreeSet::new();
    for line in lines {
        let fields: Vec<_> = line.trim().split('|').collect();
        if fields.len() != 3 || fields[0] != "beat" {
            continue;
        }
        let Ok(class) = fields[1].parse::<u8>() else {
            continue;
        };
        for key in fields[2].split(',') {
            if let Some(index) = zones().iter().position(|zone| zone.key == key) {
                beaten.insert((class, index));
            }
        }
    }
    let mut values: Vec<(u8, u64)> = Vec::new();
    for (class, value) in lines.iter().filter_map(|line| record(line)).chain(
        beaten
            .into_iter()
            .map(|(class, index)| (class, (index + 2).min(zones().len()) as u64)),
    ) {
        if let Some((_, highest)) = values.iter_mut().find(|(id, _)| *id == class) {
            *highest = (*highest).max(value);
        } else {
            values.push((class, value));
        }
    }
    values
}

#[cfg(test)]
mod tests {
    use super::*;

    // Static-derived expectations, not executed in this source-only session.
    #[test]
    fn old_ordinals_resolve_keys_before_current_ordinals() {
        let lines = ["unlock|1|4", "unlock|2|9", "open|1|sm", "open|1|wsg"].map(str::to_owned);
        assert_eq!(values(&lines), [(1, 8), (2, 12)]);
        assert_eq!(
            super::super::schema::normalize(&lines, false),
            ["open|1|sm", "open|2|aq"]
        );
    }

    #[test]
    fn inserting_scholomance_preserves_keyed_unlocks_and_heroic_clears() {
        use super::super::Save;
        let save = Save::parse(concat!(
            "open|1|brm\n",
            "beat|2|brm\n",
            "open|3|aq\n",
            "beat|4|aq,naxx\n",
            "hbeat|4|aq:3,naxx:5\n",
        )).unwrap();
        assert_eq!([1, 2, 3, 4].map(|class| save.unlock_value(class)), [
            Some(10), Some(11), Some(12), Some(13),
        ]);
        assert_eq!(save.heroic_cleared_rank(4, "aq"), 3);
        assert_eq!(save.heroic_cleared_rank(4, "naxx"), 5);
        assert_eq!(save.heroic_cleared_rank(4, "scholomance"), 0);
        assert_eq!(save.max_heroic_rank(4, "aq"), 4);
        assert_eq!(save.max_heroic_rank(4, "naxx"), 5);
        assert!(save.plaintext().contains("hbeat|4|aq:3,naxx:5"));
    }
}

impl super::Save {
    pub fn statistics(&self) -> std::collections::BTreeMap<String, u64> {
        super::schema::statistics(&self.lines)
    }

    /// Current terminal account consumer14543f4f0: kills/gold/guardians/bosses/caches.
    /// The caller supplies only the unsaved nonnegative deltas and invokes this once per result.
    pub fn apply_run_result(
        &mut self,
        class: u8,
        zone_key: &str,
        counts: [u32; 5],
        won: bool,
        talent_xp: u32,
        _level: u32,
        _seconds: u32,
    ) -> Result<(), super::SaveError> {
        self.apply_run_result_delta(class, zone_key, counts, won, talent_xp, true)
    }

    /// Selected 0.105.0 account owners1458a1690/145896520 retain snapshots
    /// through endless continuation. Counts/XP are deltas; runs, wins and zone
    /// unlocks are applied only for the first terminal result of the same run.
    pub fn apply_run_result_delta(
        &mut self,
        class: u8,
        zone_key: &str,
        counts: [u32; 5],
        won: bool,
        talent_xp: u32,
        first_result: bool,
    ) -> Result<(), super::SaveError> {
        if !super::CLASS_IDS.contains(&class) || !zones().iter().any(|zone| zone.key == zone_key) {
            return Err(super::SaveError::InvalidRecord("run result"));
        }
        self.apply_run_counts(counts);
        if talent_xp != 0 {
            self.grant_terminal_xp(class, talent_xp)?;
        }
        if first_result {
            self.apply_run_totals(won);
            if won {
                self.open_next_zone(class, zone_key)?;
                self.record_beaten_zone(class, zone_key)?;
            }
        }
        Ok(())
    }

    /// Current0.112.0 tick1458b0b02 adds these five deltas after the summary writes.
    pub(crate) fn apply_run_counts(&mut self, counts: [u32; 5]) {
        self.add_statistics([
            ("kills", u64::from(counts[0])),
            ("gold", u64::from(counts[1])),
            ("guardians", u64::from(counts[2])),
            ("bosses", u64::from(counts[3])),
            ("caches", u64::from(counts[4])),
        ]);
    }

    /// Current summary1458bb859 counts the first result independently of showcase.
    pub(crate) fn apply_run_totals(&mut self, won: bool) {
        self.add_statistics([("runs", 1), ("wins", u64::from(won))]);
    }

    pub(super) fn add_statistics<const N: usize>(&mut self, amounts: [(&str, u64); N]) {
        let mut stats = self.statistics();
        for (key, amount) in amounts {
            let value = stats.entry(key.into()).or_default();
            *value = value.saturating_add(amount);
        }
        self.lines.retain(|line| !line.trim().starts_with("stat|"));
        self.lines.push(format!(
            "stat|{}",
            stats
                .iter()
                .map(|(key, value)| format!("{key}={value}"))
                .collect::<Vec<_>>()
                .join(",")
        ));
    }

    /// Current1458d2fe0 saturates the saved total; the summary immediately saves it.
    pub(crate) fn grant_terminal_xp(
        &mut self,
        class: u8,
        amount: u32,
    ) -> Result<(), super::SaveError> {
        if amount == 0 {
            return Ok(());
        }
        self.add_terminal_talent_xp(class, amount)
    }

    /// Current1458bb119 opens only a newly reached next zone, before result counts.
    pub(crate) fn open_next_zone(
        &mut self,
        class: u8,
        zone_key: &str,
    ) -> Result<bool, super::SaveError> {
        if !super::CLASS_IDS.contains(&class) {
            return Err(super::SaveError::InvalidRecord("run result"));
        }
        let Some(index) = zones().iter().position(|zone| zone.key == zone_key) else {
            return Err(super::SaveError::InvalidRecord("run result"));
        };
        if index + 1 == zones().len() {
            return Ok(false);
        }
        let open = (index + 2) as u64;
        if self.unlock_value(class).unwrap_or(0) >= open {
            return Ok(false);
        }
        let legacy = format!("unlock|{class}|");
        let prefix = format!("open|{class}|");
        self.lines
            .retain(|line| !line.trim().starts_with(&prefix) && !line.trim().starts_with(&legacy));
        self.lines
            .push(format!("open|{class}|{}", zones()[open as usize - 1].key));
        Ok(true)
    }

    /// Current tick1458b0be8 calls1458d3580 for the beaten pair after the summary.
    pub(crate) fn record_beaten_zone(
        &mut self,
        class: u8,
        zone_key: &str,
    ) -> Result<(), super::SaveError> {
        if !super::CLASS_IDS.contains(&class) || !zones().iter().any(|zone| zone.key == zone_key) {
            return Err(super::SaveError::InvalidRecord("run result"));
        }
        let prefix = format!("beat|{class}|");
        let mut beaten = self
            .lines
            .iter()
            .filter_map(|line| line.trim().strip_prefix(&prefix))
            .flat_map(|row| row.split(','))
            .map(str::to_owned)
            .collect::<std::collections::BTreeSet<_>>();
        beaten.insert(zone_key.to_owned());
        self.lines.retain(|line| !line.trim().starts_with(&prefix));
        let keys = zones()
            .iter()
            .filter(|zone| beaten.contains(&zone.key))
            .map(|zone| zone.key.as_str())
            .collect::<Vec<_>>()
            .join(",");
        self.lines.push(format!("beat|{class}|{keys}"));
        Ok(())
    }

    /// Current1458bb05f/bb859 match the selected roster GUID, independently
    /// maxes level/seconds, and wraps the per-character u32 run/win counters.
    /// The real client UnitGUID and embedding's session generation are unrelated.
    pub fn record_character_result(
        &mut self,
        guid: u64,
        level: u32,
        seconds: u32,
        won: bool,
    ) -> bool {
        self.record_character_result_delta(guid, level, seconds, won, true)
    }

    /// Current1458bb05f updates these maxima before the first-result guard.
    /// A later endless terminal can improve a best without another run/win.
    pub fn record_character_bests(&mut self, guid: u64, level: u32, seconds: u32) -> bool {
        self.record_character_result_delta(guid, level, seconds, false, false)
    }

    fn record_character_result_delta(
        &mut self,
        guid: u64,
        level: u32,
        seconds: u32,
        won: bool,
        first_result: bool,
    ) -> bool {
        for line in &mut self.lines {
            let fields: Vec<_> = line.trim().split('|').collect();
            if fields.len() != 10 || fields[0].parse::<u64>() != Ok(guid) {
                continue;
            }
            let (Ok(best_level), Ok(best_seconds), Ok(runs), Ok(wins)) = (
                fields[6].parse::<u32>(),
                fields[7].parse::<u32>(),
                fields[8].parse::<u32>(),
                fields[9].parse::<u32>(),
            ) else {
                continue;
            };
            let mut values = fields[..6]
                .iter()
                .map(|value| (*value).to_owned())
                .collect::<Vec<_>>();
            values.extend([
                best_level.max(level).to_string(),
                best_seconds.max(seconds).to_string(),
                runs.wrapping_add(u32::from(first_result)).to_string(),
                wins.wrapping_add(u32::from(first_result && won))
                    .to_string(),
            ]);
            *line = values.join("|");
            return true;
        }
        false
    }

    pub fn add_equipment(&mut self, ids: &[u32]) {
        let mut owned = self
            .lines
            .iter()
            .filter_map(|line| line.trim().strip_prefix("items|"))
            .flat_map(|row| row.split(','))
            .filter_map(|id| id.parse::<u32>().ok())
            .chain(ids.iter().copied())
            .filter(|id| super::gear::decode(*id).is_some())
            .collect::<std::collections::BTreeSet<_>>();
        self.lines.retain(|line| !line.trim().starts_with("items|"));
        if !owned.is_empty() {
            self.lines.push(format!(
                "items|{}",
                owned
                    .iter()
                    .map(u32::to_string)
                    .collect::<Vec<_>>()
                    .join(",")
            ));
        }
        owned.clear();
    }

    pub fn record_seen(&mut self, values: &[(String, u8)]) {
        let mut seen = self.seen();
        for (key, quality) in values {
            if key.is_empty() || key.contains(['|', ',', '=', '\r', '\n']) {
                continue;
            }
            let previous = seen.entry(super::gear::canonical_seen_key(key).to_owned()).or_default();
            *previous = (*previous).max((*quality).min(4));
        }
        self.lines.retain(|line| !line.trim().starts_with("seen|"));
        if !seen.is_empty() {
            self.lines.push(format!(
                "seen|{}",
                seen.iter()
                    .map(|(key, quality)| format!("{key}={quality}"))
                    .collect::<Vec<_>>()
                    .join(",")
            ));
        }
    }
}

#[cfg(test)]
mod result_tests {
    use super::super::Save;
    #[test]
    fn endless_result_adds_only_progress_after_the_first_terminal_grant() {
        let mut save = Save::parse("talent|1|80|\n").unwrap();
        save.apply_run_result_delta(1, "elwynn", [100, 20, 1, 5, 2], true, 200, true)
            .unwrap();
        let unlocked = save.unlock_value(1);
        save.apply_run_result_delta(1, "elwynn", [25, 7, 0, 1, 1], true, 30, false)
            .unwrap();
        let stats = save.statistics();
        assert_eq!(stats["kills"], 125);
        assert_eq!(stats["gold"], 27);
        assert_eq!(stats["bosses"], 6);
        assert_eq!(stats["runs"], 1);
        assert_eq!(stats["wins"], 1);
        assert_eq!(save.talent_xp(1), 310);
        assert_eq!(save.unlock_value(1), unlocked);
    }

    #[test]
    fn result_updates_final_zone_progress_and_preserves_specs_and_pick() {
        let mut save = Save::parse("talent|1|80|imp_heroic:1\nspec|1|2|||imp_heroic:1\nopen|1|naxx\nunknown|keep\nstat|kills=18446744073709551614,custom=9\n").unwrap();
        save.apply_run_result(1, "naxx", [8, 20, 2, 5, 1], true, 95, 50, 1200)
            .unwrap();
        assert_eq!(save.statistics()["kills"], u64::MAX);
        assert_eq!(save.statistics()["runs"], 1);
        assert_eq!(save.statistics()["wins"], 1);
        assert!(!save.statistics().contains_key("custom"));
        assert_eq!(save.unlock_value(1), Some(13));
        assert_eq!(save.talent_xp(1), 175);
        assert_eq!(save.talent_spec(1), 2);
        assert!(save.plaintext().contains("beat|1|naxx"));
        assert!(!save.plaintext().contains("unknown|keep"));
    }

    #[test]
    fn roster_results_match_guid_and_keep_independent_bests_and_wrapping_counts() {
        let mut save = Save::parse("42|Hero|1|1|0|0,0,0,0,0|50|1200|4294967295|4294967295\n43|Other|1|1|0|0,0,0,0,0|1|0|0|0\nunknown|keep\n").unwrap();
        assert!(save.record_character_result(42, 60, 900, true));
        let hero = &save.characters()[0];
        assert_eq!(
            (hero.best_level, hero.best_seconds, hero.runs, hero.wins),
            (60, 1200, 0, 0)
        );
        assert_eq!(save.characters()[1].runs, 0);
        assert!(save.record_character_bests(42, 80, 3600));
        let hero = &save.characters()[0];
        assert_eq!(
            (hero.best_level, hero.best_seconds, hero.runs, hero.wins),
            (80, 3600, 0, 0)
        );
        assert!(save.record_character_bests(42, 70, 2400));
        let hero = &save.characters()[0];
        assert_eq!(
            (hero.best_level, hero.best_seconds, hero.runs, hero.wins),
            (80, 3600, 0, 0)
        );
        let before = save.plaintext();
        assert!(!save.record_character_result(0x00ff_ffff, 99, 9999, true));
        assert!(!save.record_character_result(99, 99, 9999, true));
        assert_eq!(save.plaintext(), before);
    }

    #[test]
    fn rewards_are_deduplicated_and_loss_never_unlocks() {
        let mut save = Save::parse("items|101000\nseen|jewelry.a=2\n").unwrap();
        save.add_equipment(&[101000, 101010, 999999]);
        save.record_seen(&[("jewelry.a".into(), 1), ("jewelry.b".into(), 255)]);
        save.apply_run_result(1, "elwynn", [1, 0, 0, 0, 0], false, 1, 1, 2)
            .unwrap();
        assert!(save.plaintext().contains("items|101000,101010"));
        assert_eq!(save.seen()["jewelry.a"], 2);
        assert_eq!(save.seen()["jewelry.b"], 4);
        assert_eq!(save.unlock_value(1), None);
    }
}
