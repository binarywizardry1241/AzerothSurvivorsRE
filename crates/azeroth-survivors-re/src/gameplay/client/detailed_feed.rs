//! Recipient-scoped AZSM frame replay and multipart publication.

use std::{
    collections::{BTreeMap, BTreeSet},
    fmt::Write as _,
};

use benilla_app::local_client::events::SessionEvent;

use crate::localization::Localization;

use super::super::{
    detailed_meter::{Actor, DetailedOwner, Source, fnv1a, hero_id, wire_text},
    mechanics::Mechanics,
};
use super::addon_feed::AddonMessage;

#[derive(Default)]
pub(in crate::gameplay) struct Recipient {
    party: bool,
    full: bool,
    sequence: u64,
    header: Option<String>,
    metadata: BTreeMap<String, u64>,
    counters: BTreeMap<(u64, usize), (u64, u64, u64, u32)>,
    loadouts: BTreeMap<u64, u64>,
    history: BTreeMap<u64, f32>,
}

enum Descriptor<'a> {
    Actor(&'a Actor),
    Source(&'a Source),
}

impl<'a> Descriptor<'a> {
    fn identity(&self) -> (char, &'a str) {
        match self {
            Self::Actor(actor) => ('A', &actor.id),
            Self::Source(source) => ('S', &source.key),
        }
    }

    fn encode(&self, locale: &Localization) -> String {
        match self {
            Self::Actor(actor) => actor.encode(locale),
            Self::Source(source) => source.encode(locale),
        }
    }
}

impl Recipient {
    pub(super) fn reset_run(&mut self) {
        *self = Self {
            party: self.party,
            ..Self::default()
        };
    }

    pub(in crate::gameplay) fn replay(&mut self) {
        self.full = true;
    }

    pub(super) fn include_party(&mut self) {
        self.party = true;
        self.replay();
    }

    pub(in crate::gameplay) fn publish(
        &mut self,
        game: &Mechanics,
        owners: &[DetailedOwner],
        phase: &str,
        locale: &Localization,
    ) -> Vec<SessionEvent> {
        let guid = game.player_guid;
        let run = &game.addon_run_id;
        if run.is_empty() || !owners.iter().any(|owner| owner.guid == guid) {
            return Vec::new();
        }
        let ledger = &game.detailed_meter;
        let full = std::mem::take(&mut self.full) || self.header.is_none();
        if full {
            self.metadata.clear();
            self.counters.clear();
            self.loadouts.clear();
            self.history.clear();
        }
        let in_party = game.has_party();
        let party_included = in_party && self.party;
        let party_state = if !in_party {
            "solo"
        } else if owners
            .iter()
            .any(|owner| owner.guid != guid && owner.active)
        {
            "active"
        } else {
            "ended"
        };
        let heroes: Vec<_> = owners
            .iter()
            .enumerate()
            .map(|(index, owner)| {
                let status = if owner.active { "present" } else { "departed" };
                format!("H,{},{status},{}", hero_id(owner.guid), index + 1)
            })
            .collect();
        let selected = owners
            .iter()
            .filter(|owner| party_included || owner.guid == guid);
        let mut descriptors: Vec<_> = owners
            .iter()
            .map(|owner| Descriptor::Actor(&owner.actor))
            .collect();
        let mut rows = Vec::new();
        let mut loadout_rows = Vec::new();
        let mut history_floor: f32 = 0.0;
        for owner in selected.clone() {
            let owner_guid = owner.guid;
            let loadout = owner.loadout.records.join(";");
            let revision = fnv1a(loadout.as_bytes());
            if self.loadouts.insert(owner_guid, revision) != Some(revision) {
                loadout_rows.push(format!("LX,{},{revision:x}", hero_id(owner_guid)));
                loadout_rows.extend(owner.loadout.records.iter().cloned());
            }
            let Some(credits) = ledger.owner(owner_guid) else {
                continue;
            };
            for counter in credits.counters() {
                let actor_ids =
                    std::iter::once(counter.actor_id()).chain(counter.recipient_actor_id());
                descriptors.extend(
                    actor_ids
                        .filter_map(|id| ledger.actor_by_id(id))
                        .map(Descriptor::Actor),
                );
                let revision = counter.revision();
                if self.counters.insert((owner_guid, counter.id), revision) != Some(revision) {
                    rows.push(counter.encode(owner_guid));
                }
            }
            // The native frame visits each owner's actor table before its
            // source table. Counter IDs retain the credit admission order.
            descriptors.extend(
                credits
                    .counters()
                    .iter()
                    .flat_map(|counter| counter.source_keys())
                    .filter_map(|key| ledger.source_by_key(key))
                    .map(Descriptor::Source),
            );
            history_floor = history_floor.max(credits.history_floor());
            let cursor = self.history.entry(owner_guid).or_insert(f32::NEG_INFINITY);
            for knot in credits.history() {
                if knot.clock > *cursor {
                    rows.push(knot.encode(owner_guid));
                    *cursor = knot.clock;
                }
            }
        }

        rows.extend(loadout_rows);
        descriptors.extend(
            selected
                .flat_map(|owner| owner.loadout.sources.iter())
                .map(Descriptor::Source),
        );
        if let Some(encounter) = ledger.encounter() {
            descriptors.extend(
                encounter
                    .bosses
                    .iter()
                    .filter_map(|guid| ledger.actor(*guid))
                    .map(Descriptor::Actor),
            );
        }
        let mut seen = BTreeSet::new();
        let mut metadata_revisions = String::new();
        let mut metadata_rows = Vec::new();
        for descriptor in descriptors {
            let (prefix, id) = descriptor.identity();
            if !seen.insert((prefix, id)) {
                continue;
            }
            let key = format!("{prefix}{}", wire_text(id));
            let row = descriptor.encode(locale);
            let hash = fnv1a(row.as_bytes());
            write!(metadata_revisions, "{key}={hash:x};").unwrap();
            if self.metadata.insert(key, hash) != Some(hash) {
                metadata_rows.push(row);
            }
        }
        let metadata_revision = fnv1a(metadata_revisions.as_bytes());
        let language = locale.code();
        let mut header = [
            wire_text(run),
            wire_text(&format!("{run}.host")),
            "e1".into(),
            clock_text(game.clock),
            phase.into(),
            language.into(),
            format!("l.{language}"),
            ledger.fence().to_string(),
            format!("{metadata_revision:x}"),
            hero_id(guid),
            party_state.into(),
            if in_party {
                wire_text(&format!("party:{run}"))
            } else {
                String::new()
            },
            u8::from(party_included).to_string(),
            clock_text(history_floor),
        ]
        .join(",");
        if let Some(encounter) = ledger.encounter() {
            let state = if encounter.end.is_some() { "c" } else { "a" };
            let end_clock = encounter
                .end
                .map(|(clock, _)| clock_text(clock))
                .unwrap_or_default();
            let end_fence = encounter
                .end
                .map(|(_, fence)| fence.to_string())
                .unwrap_or_default();
            let bosses = encounter
                .bosses
                .iter()
                .map(|guid| format!("E{}", *guid as u32))
                .collect::<Vec<_>>()
                .join("~");
            write!(
                header,
                ",{},{state},{},{end_clock},{},{end_fence},{bosses}",
                encounter.id,
                clock_text(encounter.start),
                encounter.start_fence
            )
            .unwrap();
        } else {
            header.push_str(",,,,,,,");
        }
        let signature = format!("{header}|{}", heroes.join(";"));
        if !full
            && rows.is_empty()
            && metadata_rows.is_empty()
            && self.header.as_ref() == Some(&signature)
        {
            return Vec::new();
        }
        self.header = Some(signature);
        let predecessor = if full { 0 } else { self.sequence };
        self.sequence = self.sequence.wrapping_add(1);
        let frame = format!("F,{predecessor},{},{header}", u8::from(full));
        let records = std::iter::once(frame)
            .chain(heroes)
            .chain(metadata_rows)
            .chain(rows);
        multipart(records, self.sequence)
            .into_iter()
            .map(|part| AddonMessage::new("AZSM", part).packet_from(guid))
            .collect()
    }
}

fn clock_text(clock: f32) -> String {
    if clock.is_finite() {
        f64::from(clock).to_string()
    } else {
        "0".into()
    }
}

fn multipart(records: impl IntoIterator<Item = String>, sequence: u64) -> Vec<String> {
    let mut parts = Vec::new();
    let mut part = String::new();
    for record in records {
        if !part.is_empty() {
            // The native guard adds the record length before writing the separator.
            if part.len() + record.len() > 7_999 {
                parts.push(std::mem::take(&mut part));
            } else {
                part.push(';');
            }
        }
        part.push_str(&record);
    }
    if !part.is_empty() {
        parts.push(part);
    }
    let count = parts.len();
    parts
        .into_iter()
        .enumerate()
        .map(|(index, part)| format!("v=1;seq={sequence};i={};n={count}|{part}", index + 1))
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parts_follow_the_native_byte_boundary_without_splitting_utf8_records() {
        let first = "é".repeat(3_999);
        let parts = multipart([first.clone(), "x".into(), "y".into()], 7);
        assert_eq!(
            parts,
            [
                format!("v=1;seq=7;i=1;n=2|{first};x"),
                "v=1;seq=7;i=2;n=2|y".into()
            ]
        );
    }

    #[test]
    fn a_new_run_keeps_party_opt_in_and_restarts_the_recipient_replay() {
        let mut recipient = Recipient {
            sequence: 4,
            header: Some("old".into()),
            ..Recipient::default()
        };
        recipient.include_party();
        recipient.history.insert(2, 3.0);
        recipient.reset_run();
        assert!(recipient.party);
        assert_eq!(recipient.sequence, 0);
        assert!(recipient.header.is_none() && recipient.history.is_empty());
    }
}
