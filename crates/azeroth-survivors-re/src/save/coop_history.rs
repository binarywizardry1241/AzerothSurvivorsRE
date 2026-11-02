//! Cooperative zone history, recovered from the 0.117.0 Save readers/writer.
//! The account-wide family is independent of per-class `beat|` and `open|`.

use super::{progress, Save};
use std::collections::BTreeSet;

pub(super) fn zones(lines: &[String]) -> BTreeSet<usize> {
    lines
        .iter()
        .filter_map(|line| line.trim().strip_prefix("coopbeat|"))
        .flat_map(|row| row.split(','))
        .filter_map(|key| progress::zones().iter().position(|zone| zone.key == key))
        .collect()
}

pub(super) fn record(zones: &BTreeSet<usize>) -> Option<String> {
    (!zones.is_empty()).then(|| {
        format!(
            "coopbeat|{}",
            zones
                .iter()
                .filter_map(|index| progress::zones().get(*index))
                .map(|zone| zone.key.as_str())
                .collect::<Vec<_>>()
                .join(",")
        )
    })
}

impl Save {
    pub fn cooperative_beaten_zones(&self) -> BTreeSet<usize> {
        zones(&self.lines)
    }

    /// The caller supplies the native won + cooperative-context admission.
    /// Unknown keys do not acquire the ordinary runtime Elwynn fallback.
    pub fn mark_cooperative_victory(&mut self, zone: &str) -> bool {
        let Some(index) = progress::zones().iter().position(|row| row.key == zone) else {
            return false;
        };
        let mut beaten = self.cooperative_beaten_zones();
        if !beaten.insert(index) {
            return false;
        }
        self.lines
            .retain(|line| !line.trim().starts_with("coopbeat|"));
        self.lines.push(record(&beaten).expect("new cooperative victory"));
        true
    }
}
