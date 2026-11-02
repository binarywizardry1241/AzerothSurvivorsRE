//! 0.121.0 Heroic clear records and account/class admission.
//! Native parser145aa6a10, writer145aaf840, queries145aa3b80/145aa4080
//! and monotone clear mutation145aa3f70. Gameplay/parity remain unverified.

use std::collections::{BTreeMap, BTreeSet};

fn normal_clears(lines: &[String]) -> BTreeSet<(u8, usize)> {
    let mut result = BTreeSet::new();
    for line in lines {
        let fields = line.trim().split('|').collect::<Vec<_>>();
        let ["beat", class, keys] = fields.as_slice() else { continue };
        let Ok(class) = class.parse::<u8>() else { continue };
        for key in keys.split(',') {
            if let Some(zone) = super::progress::zones().iter().position(|zone| zone.key == key) {
                result.insert((class, zone));
            }
        }
    }
    result
}

/// The loader merges repeated class/zone pairs by their maximum, after parsing
/// the rank as u8 and clamping it to five. A zero rank is absent, not a clear.
pub(super) fn clears(lines: &[String]) -> BTreeMap<(u8, usize), u8> {
    let mut result = BTreeMap::<(u8, usize), u8>::new();
    for line in lines {
        let fields = line.trim().split('|').collect::<Vec<_>>();
        let ["hbeat", class, entries] = fields.as_slice() else { continue };
        let Ok(class) = class.parse::<u8>() else { continue };
        if !super::CLASS_IDS.contains(&class) { continue; }
        for entry in entries.split(',') {
            let Some((key, rank)) = entry.split_once(':') else { continue };
            let Ok(rank) = rank.parse::<u8>() else { continue };
            if rank == 0 { continue; }
            let Some(zone) = super::progress::zones().iter().position(|zone| zone.key == key) else {
                continue;
            };
            result.entry((class, zone)).and_modify(|old| *old = (*old).max(rank.min(5)))
                .or_insert(rank.min(5));
        }
    }
    result
}

pub(super) fn records(values: &BTreeMap<(u8, usize), u8>) -> Vec<String> {
    let mut classes = BTreeMap::<u8, Vec<String>>::new();
    for (&(class, zone), rank) in values {
        classes.entry(class).or_default()
            .push(format!("{}:{rank}", super::progress::zones()[zone].key));
    }
    classes.into_iter().map(|(class, entries)| format!("hbeat|{class}|{}", entries.join(",")))
        .collect()
}

impl super::Save {
    /// Current account predicates inspect the retained clear records across
    /// all classes, independently of the selected class's admission ceiling.
    pub fn heroic_clears(&self) -> BTreeMap<(u8, usize), u8> {
        clears(&self.lines)
    }

    /// Current typed clear value, as distinct from the next unlocked rank.
    pub fn heroic_cleared_rank(&self, class: u8, zone_key: &str) -> u8 {
        let Some(zone) = super::progress::zones().iter().position(|zone| zone.key == zone_key) else {
            return 0;
        };
        clears(&self.lines).get(&(class, zone)).copied().unwrap_or(0)
    }

    /// 145aa4080: any class's Normal clear opens I account-wide. The highest
    /// Heroic clear of this zone opens its successor, capped at V.
    pub fn heroic_zone_max(&self, zone_key: &str) -> u8 {
        let Some(zone) = super::progress::zones().iter().position(|zone| zone.key == zone_key) else {
            return 0;
        };
        if !normal_clears(&self.lines).iter().any(|(_, key)| *key == zone) { return 0; }
        clears(&self.lines).iter().filter(|((_, key), _)| *key == zone)
            .map(|(_, rank)| *rank).max().map_or(1, |rank| (rank + 1).min(5))
    }

    /// 145aa3b80 additionally requires this selected class's Normal clear.
    pub fn max_heroic_rank(&self, class: u8, zone_key: &str) -> u8 {
        let Some(zone) = super::progress::zones().iter().position(|zone| zone.key == zone_key) else {
            return 0;
        };
        if !normal_clears(&self.lines).contains(&(class, zone)) { return 0; }
        self.heroic_zone_max(zone_key)
    }

    /// 145aa3f70 retains the highest cleared rank independently per class/zone.
    /// Account callers retain their own save timing and victory admission.
    pub fn record_heroic_victory(&mut self, class: u8, zone_key: &str, rank: u8)
        -> Result<bool, super::SaveError>
    {
        let Some(zone) = super::progress::zones().iter().position(|zone| zone.key == zone_key) else {
            return Err(super::SaveError::InvalidRecord("Heroic clear"));
        };
        if !super::CLASS_IDS.contains(&class) {
            return Err(super::SaveError::InvalidRecord("Heroic clear"));
        }
        if rank == 0 { return Ok(false); }
        let rank = rank.min(5);
        let mut values = clears(&self.lines);
        if values.get(&(class, zone)).is_some_and(|old| *old >= rank) { return Ok(false); }
        values.insert((class, zone), rank);
        self.replace_runtime_records(|line| line.trim().starts_with("hbeat|"), records(&values));
        Ok(true)
    }

    /// 145b2e580 records the ordinary beaten pair first. Its 145b0f490
    /// getter then limits the captured run rank by the class's current ceiling
    /// before the Heroic-clear mutation, for local and accepted guest results.
    pub(crate) fn record_run_victory(&mut self, class: u8, zone_key: &str, rank: u8)
        -> Result<bool, super::SaveError>
    {
        self.record_run_victory_notice(class, zone_key, rank).map(|notice| notice.is_some())
    }

    ///145b2e8c6 preserves the effective cleared rank;145b2edb0 compares it
    /// with the post-clear account ceiling for the optional open-rank sentence.
    pub(crate) fn record_run_victory_notice(&mut self, class: u8, zone_key: &str, rank: u8)
        -> Result<Option<(u8, u8)>, super::SaveError>
    {
        self.record_beaten_zone(class, zone_key)?;
        let rank = rank.min(self.max_heroic_rank(class, zone_key));
        Ok(self.record_heroic_victory(class, zone_key, rank)?
            .then(|| (rank, self.heroic_zone_max(zone_key))))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn account_ceiling_and_class_admission_are_independent() {
        let mut save = super::super::Save::default();
        save.lines = ["beat|1|elwynn", "hbeat|2|elwynn:3"].map(str::to_owned).to_vec();
        assert_eq!(save.heroic_zone_max("elwynn"), 4);
        assert_eq!(save.max_heroic_rank(1, "elwynn"), 4);
        assert_eq!(save.max_heroic_rank(2, "elwynn"), 0);
        assert_eq!(save.heroic_zone_max("duskwood"), 0);
        assert!(save.record_heroic_victory(1, "elwynn", 255).unwrap());
        assert_eq!(save.max_heroic_rank(1, "elwynn"), 5);
        assert!(!save.record_heroic_victory(1, "elwynn", 2).unwrap());
        assert!(!save.record_heroic_victory(1, "elwynn", 0).unwrap());
    }

    #[test]
    fn malformed_rows_cannot_erase_a_higher_clear() {
        let rows = ["hbeat|1|elwynn:2,elwynn:4,duskwood:255", "hbeat|1|elwynn:1",
            "hbeat|1|elwynn:256", "hbeat|6|elwynn:5", "hbeat|1|elwynn:0",
            "hbeat|1|elwynn:5|extra", "hbeat|1|unknown:5"].map(str::to_owned);
        assert_eq!(records(&clears(&rows)), ["hbeat|1|elwynn:4,duskwood:5"]);
    }

    #[test]
    fn terminal_clear_uses_the_class_ceiling_after_the_normal_clear() {
        let mut save = super::super::Save::default();
        assert!(save.record_run_victory(1, "elwynn", 5).unwrap());
        assert_eq!(save.heroic_cleared_rank(1, "elwynn"), 1);
        assert_eq!(save.max_heroic_rank(1, "elwynn"), 2);
        assert!(save.record_run_victory(2, "elwynn", 5).unwrap());
        assert_eq!(save.heroic_cleared_rank(2, "elwynn"), 2);
        assert_eq!(save.max_heroic_rank(1, "elwynn"), 3);
    }
    #[test]
    fn clear_notice_uses_the_current_account_ceiling_even_when_it_was_already_open() {
        let mut save = super::super::Save::default();
        save.lines = ["beat|1|elwynn", "beat|2|elwynn", "hbeat|2|elwynn:4"]
            .map(str::to_owned).to_vec();
        assert_eq!(save.record_run_victory_notice(1, "elwynn", 1).unwrap(), Some((1, 5)));
        assert_eq!(save.record_run_victory_notice(1, "elwynn", 1).unwrap(), None);
        assert_eq!(save.record_run_victory_notice(1, "elwynn", 5).unwrap(), Some((5, 5)));
        assert_eq!(save.record_run_victory_notice(1, "elwynn", 0).unwrap(), None);
    }
}
