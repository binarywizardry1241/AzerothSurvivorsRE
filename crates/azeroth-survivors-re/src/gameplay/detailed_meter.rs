//! Typed AZSM records before the legacy display-label aggregation.

use std::collections::{BTreeMap, BTreeSet, VecDeque};
use std::fmt::Write as _;

use azeroth_survivors_re::player_abilities::AbilityDefinition;

use crate::localization::Localization;

pub(super) fn hero_id(guid: u64) -> String {
    format!("H{}", guid as u32)
}

pub(super) fn wire_text(value: &str) -> String {
    let mut escaped = String::with_capacity(value.len());
    for character in value.chars() {
        if character.is_ascii_control()
            || matches!(character, '%' | ',' | ':' | ';' | '=' | '|' | '~')
        {
            write!(escaped, "%{:02X}", character as u8).unwrap();
        } else {
            escaped.push(character);
        }
    }
    escaped
}

pub(super) fn fnv1a(bytes: &[u8]) -> u64 {
    bytes.iter().fold(0xcbf2_9ce4_8422_2325, |hash, byte| {
        (hash ^ u64::from(*byte)).wrapping_mul(0x0100_0000_01b3)
    })
}

pub(super) fn wire_keys<'a>(keys: impl IntoIterator<Item = &'a str>) -> String {
    keys.into_iter()
        .map(wire_text)
        .collect::<Vec<_>>()
        .join("~")
}

fn optional_number(value: Option<impl ToString>) -> String {
    value.map(|number| number.to_string()).unwrap_or_default()
}

fn amount_text(amount: f64) -> String {
    if amount.is_finite() {
        amount.to_string()
    } else {
        "0".into()
    }
}

#[derive(Clone, Debug)]
pub(super) struct Source {
    pub key: String,
    pub kind: &'static str,
    pub attribution: &'static str,
    pub name: String,
    pub icon: Option<String>,
    pub spell_id: Option<u32>,
    pub localization_key: Option<String>,
    pub ability_key: Option<&'static str>,
    pub talent_key: Option<String>,
    pub item_key: Option<String>,
    pub item_id: Option<u32>,
    pub item_instance_key: Option<String>,
    pub variant_key: Option<String>,
    pub rank: Option<u32>,
}

impl Source {
    pub fn new(
        key: String,
        kind: &'static str,
        attribution: &'static str,
        name: impl Into<String>,
    ) -> Self {
        Self {
            key,
            kind,
            attribution,
            name: name.into(),
            icon: None,
            spell_id: None,
            localization_key: None,
            ability_key: None,
            talent_key: None,
            item_key: None,
            item_id: None,
            item_instance_key: None,
            variant_key: None,
            rank: None,
        }
    }

    pub fn ability(definition: &AbilityDefinition, rank: Option<u32>, pulse: bool) -> Self {
        let mut key = format!("ability:{}", definition.key);
        if let Some(rank) = rank {
            write!(key, ":r{rank}").unwrap();
        }
        if pulse {
            key.push_str(":pulse");
        }
        let mut source = Self::new(key, "ability", "known", definition.name);
        source.spell_id = Some(if pulse {
            definition.pulse_spell_id
        } else {
            definition.spell_id
        })
        .filter(|id| *id != 0);
        source.icon = Some(definition.icon.into());
        source.ability_key = Some(definition.key);
        source.localization_key = Some(format!("ability.{}.name", definition.key));
        source.variant_key = pulse.then(|| "pulse".into());
        source.rank = rank;
        source
    }

    pub fn talent(definition: &azeroth_survivors_re::run_effects::Talent, rank: u8) -> Self {
        let key = &definition.key;
        let mut source = Self::new(
            format!("talent:{key}:r{rank}"),
            "talent",
            "known",
            &definition.name,
        );
        source.icon = Some(definition.icon.clone());
        source.talent_key = Some(key.clone());
        source.rank = Some(u32::from(rank));
        source
    }

    pub fn amulet(
        definition: &'static azeroth_survivors_re::loot_rewards::amulets::Definition,
        rank: u32,
    ) -> Self {
        let key = format!("amulet:{}", definition.key);
        let mut source = Self::new(format!("{key}:r{rank}"), "item", "known", &definition.name);
        source.icon = Some(definition.icon.clone());
        source.ability_key = definition.ability_key.as_deref();
        source.item_key = Some(key);
        source.item_instance_key = Some("run:amulet".into());
        source.rank = Some(rank);
        source
    }

    pub fn encode(&self, locale: &Localization) -> String {
        let (status, icon) = match self.icon.as_deref().filter(|icon| !icon.is_empty()) {
            Some(icon) if icon.contains('\\') => ("r", wire_text(icon)),
            Some(icon) => ("r", wire_text(&format!("Interface\\Icons\\{icon}"))),
            None if matches!(self.kind, "system" | "generic") => ("m", "not_applicable".into()),
            None => ("m", "not_available".into()),
        };
        let name = if self.key.starts_with("amulet:") {
            wire_text(&locale.amulet_name(&self.name, self.ability_key))
        } else {
            wire_text(
                self.localization_key
                    .as_deref()
                    .and_then(|key| locale.lookup(key))
                    .unwrap_or_else(|| locale.label(&self.name)),
            )
        };
        [
            "S".into(),
            wire_text(&self.key),
            self.kind.into(),
            self.attribution.into(),
            name,
            locale.code().into(),
            status.into(),
            icon,
            optional_number(self.spell_id),
            String::new(),
            String::new(),
            wire_text(self.localization_key.as_deref().unwrap_or_default()),
            wire_text(self.ability_key.unwrap_or_default()),
            wire_text(self.talent_key.as_deref().unwrap_or_default()),
            wire_text(self.item_key.as_deref().unwrap_or_default()),
            optional_number(self.item_id),
            wire_text(self.item_instance_key.as_deref().unwrap_or_default()),
            wire_text(self.variant_key.as_deref().unwrap_or_default()),
            optional_number(self.rank),
        ]
        .join(",")
    }
}

#[derive(Clone, Debug)]
pub(super) struct Portrait {
    pub key: String,
    pub path: Option<String>,
}

#[derive(Clone, Debug)]
pub(super) struct Actor {
    pub id: String,
    pub kind: &'static str,
    pub name: String,
    pub name_is_localized: bool,
    pub state: &'static str,
    pub portrait: Portrait,
    pub class_key: Option<&'static str>,
    pub parent: Option<u64>,
    pub owner: Option<u64>,
    pub creature_entry: Option<u32>,
    pub pet_family_key: Option<&'static str>,
    pub summon_key: Option<&'static str>,
    pub totem_key: Option<&'static str>,
}

impl Actor {
    pub fn hero(guid: u64, name: String, class_key: &'static str, race: u8, sex: u8) -> Self {
        let race = match race {
            1 => Some("Human"),
            2 => Some("Orc"),
            3 => Some("Dwarf"),
            4 => Some("NightElf"),
            5 => Some("Scourge"),
            6 => Some("Tauren"),
            7 => Some("Gnome"),
            8 => Some("Troll"),
            _ => None,
        };
        let sex = if sex == 1 { "Female" } else { "Male" };
        let id = hero_id(guid);
        let portrait = match race {
            Some(race) => Portrait {
                key: format!("pt:hero:{race}.{sex}"),
                path: Some(format!(
                    "Interface\\CharacterFrame\\TemporaryPortrait-{sex}-{race}"
                )),
            },
            None => Portrait {
                key: "pt:hero".into(),
                path: Some("Interface\\CharacterFrame\\TemporaryPortrait".into()),
            },
        };
        Self {
            id,
            kind: "hero",
            name,
            name_is_localized: false,
            state: "present",
            portrait,
            class_key: Some(class_key),
            parent: None,
            owner: None,
            creature_entry: None,
            pet_family_key: None,
            summon_key: None,
            totem_key: None,
        }
    }

    pub fn companion(
        id: String,
        kind: &'static str,
        name: &'static str,
        owner: u64,
        creature_entry: Option<u32>,
    ) -> Self {
        let portrait = match kind {
            "pet" | "summon" => Portrait {
                key: "pt:pet".into(),
                path: Some("Interface\\CharacterFrame\\TemporaryPortrait-Pet".into()),
            },
            "enemy" => Portrait {
                key: "pt:monster".into(),
                path: Some("Interface\\CharacterFrame\\TemporaryPortrait-Monster".into()),
            },
            "system" => Portrait {
                key: "pt:none".into(),
                path: None,
            },
            _ => Portrait {
                key: "pt:none:avail".into(),
                path: None,
            },
        };
        Self {
            portrait,
            id,
            kind,
            name: name.into(),
            name_is_localized: true,
            state: "present",
            class_key: None,
            parent: Some(owner),
            owner: Some(owner),
            creature_entry,
            pet_family_key: None,
            summon_key: None,
            totem_key: None,
        }
    }

    pub fn encode(&self, locale: &Localization) -> String {
        let name = if self.name_is_localized {
            locale.label(&self.name)
        } else {
            &self.name
        };
        let (status, value) = match &self.portrait.path {
            Some(path) => ("r", wire_text(path)),
            None if self.kind == "system" => ("m", "not_applicable".into()),
            None => ("m", "not_available".into()),
        };
        [
            "A".into(),
            wire_text(&self.id),
            self.kind.into(),
            wire_text(name),
            locale.code().into(),
            self.state.into(),
            wire_text(&self.portrait.key),
            status.into(),
            value,
            wire_text(self.class_key.unwrap_or_default()),
            self.parent.map(hero_id).unwrap_or_default(),
            self.owner
                .filter(|_| self.state == "present")
                .map(hero_id)
                .unwrap_or_default(),
            optional_number(self.creature_entry),
            wire_text(self.pet_family_key.unwrap_or_default()),
            wire_text(self.summon_key.unwrap_or_default()),
            wire_text(self.totem_key.unwrap_or_default()),
        ]
        .join(",")
    }
}

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub(super) enum Owner {
    Known(u64),
    Unowned,
    Unknown,
}

impl Owner {
    fn wire(self) -> (&'static str, String) {
        match self {
            Self::Known(guid) => ("k", hero_id(guid)),
            Self::Unowned => ("u", String::new()),
            Self::Unknown => ("x", String::new()),
        }
    }
}

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub(super) enum Metric {
    Damage,
    Healing,
}

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub(super) enum CreditKind {
    Damage,
    Healing,
    Absorb,
}

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub(super) enum School {
    Known(u8),
    Unknown,
    NotApplicable,
}

pub(super) struct Credit {
    pub actor: Option<Actor>,
    pub source: Source,
    pub origins: Vec<Source>,
    pub source_owner: Owner,
    pub recipient_actor: Option<Actor>,
    pub recipient_owner: Owner,
    pub metric: Metric,
    pub kind: CreditKind,
    pub school: School,
    pub periodic: bool,
    pub reflected: bool,
    pub proc: bool,
    pub amount: f64,
}

#[derive(Clone, Debug, Eq, PartialEq)]
struct RowKey {
    actor: String,
    source: String,
    origins: Vec<String>,
    source_owner: Owner,
    recipient_actor: Option<String>,
    recipient_owner: Owner,
    metric: Metric,
    kind: CreditKind,
    school: School,
    periodic: bool,
    reflected: bool,
    proc: bool,
}

#[derive(Debug)]
pub(super) struct Counter {
    pub id: usize,
    key: RowKey,
    ordinal: u64,
    amount: f64,
    qualifying: f64,
    encounter_amount: f64,
    encounter_id: Option<u32>,
}

impl Counter {
    pub fn revision(&self) -> (u64, u64, u64, u32) {
        (
            self.amount.to_bits(),
            self.qualifying.to_bits(),
            self.encounter_amount.to_bits(),
            self.encounter_id.unwrap_or(0),
        )
    }

    pub fn actor_id(&self) -> &str {
        &self.key.actor
    }

    pub fn recipient_actor_id(&self) -> Option<&str> {
        self.key.recipient_actor.as_deref()
    }

    pub fn source_keys(&self) -> impl Iterator<Item = &str> {
        std::iter::once(self.key.source.as_str()).chain(self.key.origins.iter().map(String::as_str))
    }

    pub fn encode(&self, owner: u64) -> String {
        let key = &self.key;
        let metric = match key.metric {
            Metric::Damage => "d",
            Metric::Healing => "h",
        };
        let kind = match key.kind {
            CreditKind::Damage => "d",
            CreditKind::Healing => "h",
            CreditKind::Absorb => "a",
        };
        let (school, mask) = match key.school {
            School::Known(mask) => ("k", mask.to_string()),
            School::Unknown => ("u", String::new()),
            School::NotApplicable => ("n", String::new()),
        };
        let (source_status, source_owner) = key.source_owner.wire();
        let (recipient_status, recipient_owner) = key.recipient_owner.wire();
        [
            "R".into(),
            hero_id(owner),
            self.id.to_string(),
            metric.into(),
            wire_text(&key.actor),
            wire_text(&key.source),
            wire_keys(key.origins.iter().map(String::as_str)),
            (if key.periodic { "p" } else { "n" }).into(),
            (if key.reflected { "r" } else { "n" }).into(),
            kind.into(),
            u8::from(key.proc).to_string(),
            school.into(),
            mask,
            self.ordinal.to_string(),
            source_status.into(),
            source_owner,
            wire_text(key.recipient_actor.as_deref().unwrap_or_default()),
            recipient_status.into(),
            recipient_owner,
            amount_text(self.amount),
            amount_text(self.qualifying),
            amount_text(self.encounter_amount),
            self.encounter_id.unwrap_or(0).to_string(),
        ]
        .join(",")
    }
}

#[derive(Debug, Default)]
struct KnotEntry {
    through: f64,
    at: f64,
    qualifying_through: f64,
    qualifying_at: f64,
}

#[derive(Debug)]
pub(super) struct Knot {
    pub clock: f32,
    entries: Vec<(usize, KnotEntry)>,
}

impl Knot {
    pub fn encode(&self, owner: u64) -> String {
        let mut record = format!(
            "K,{},{},",
            hero_id(owner),
            amount_text(f64::from(self.clock))
        );
        for (index, (id, entry)) in self.entries.iter().enumerate() {
            if index > 0 {
                record.push('~');
            }
            write!(
                record,
                "{id}:{}:{}:{}:{}",
                amount_text(entry.through),
                amount_text(entry.at),
                amount_text(entry.qualifying_through),
                amount_text(entry.qualifying_at)
            )
            .unwrap();
        }
        record
    }
}

#[derive(Debug, Default)]
pub(super) struct OwnerRows {
    counters: Vec<Counter>,
    history: VecDeque<Knot>,
    merge_from: f32,
    truncated: bool,
}

impl OwnerRows {
    pub fn counters(&self) -> &[Counter] {
        &self.counters
    }

    pub fn history(&self) -> &VecDeque<Knot> {
        &self.history
    }

    pub fn uses_source(&self, key: &str) -> bool {
        self.counters
            .iter()
            .any(|counter| counter.source_keys().any(|source| source == key))
    }

    pub fn history_floor(&self) -> f32 {
        self.history
            .front()
            .filter(|_| self.truncated)
            .map_or(0.0, |bucket| bucket.clock)
    }

    fn record(
        &mut self,
        key: RowKey,
        clock: f32,
        ordinal: u64,
        encounter: Option<u32>,
        amount: f64,
    ) {
        let index = self
            .counters
            .iter()
            .position(|counter| counter.key == key)
            .unwrap_or_else(|| {
                let index = self.counters.len();
                self.counters.push(Counter {
                    id: index + 1,
                    key,
                    ordinal,
                    amount: 0.0,
                    qualifying: 0.0,
                    encounter_amount: 0.0,
                    encounter_id: None,
                });
                index
            });
        let counter = &mut self.counters[index];
        counter.amount += amount;
        let mut qualifying_at = 0.0;
        if let Some(encounter) = encounter {
            if counter.encounter_id != Some(encounter) {
                counter.encounter_id = Some(encounter);
                counter.encounter_amount = 0.0;
            }
            counter.qualifying += amount;
            counter.encounter_amount += amount;
            qualifying_at = amount;
        }

        let last_clock = self.history.back().map(|last| last.clock);
        // The last bucket's timestamp can advance without moving its merge boundary.
        let merge = last_clock
            .is_some_and(|last| clock == last || (clock > last && clock - self.merge_from <= 0.2));
        if merge {
            let last = self.history.back_mut().unwrap();
            if clock > last.clock {
                last.clock = clock;
                for (_, entry) in &mut last.entries {
                    entry.at = 0.0;
                    entry.qualifying_at = 0.0;
                }
            }
        } else {
            if let Some(last) = last_clock {
                self.merge_from = last;
            }
            self.history.push_back(Knot {
                clock,
                entries: Vec::new(),
            });
        }
        let entries = &mut self.history.back_mut().unwrap().entries;
        let entry_index = entries
            .iter()
            .position(|(id, _)| *id == counter.id)
            .unwrap_or_else(|| {
                entries.push((counter.id, KnotEntry::default()));
                entries.len() - 1
            });
        let entry = &mut entries[entry_index].1;
        entry.through = counter.amount;
        entry.at += amount;
        entry.qualifying_through = counter.qualifying;
        entry.qualifying_at += qualifying_at;
        while self
            .history
            .get(1)
            .is_some_and(|next| next.clock <= clock - 120.0)
        {
            self.history.pop_front();
            self.truncated = true;
        }
    }
}

#[derive(Debug)]
pub(super) struct Encounter {
    pub id: u32,
    pub start: f32,
    pub end: Option<(f32, u64)>,
    pub start_fence: u64,
    pub bosses: Vec<u64>,
}

#[derive(Debug, Default)]
pub(super) struct Ledger {
    actors: BTreeMap<String, Actor>,
    actor_guids: BTreeMap<u64, String>,
    live_actors: BTreeSet<u64>,
    sources: BTreeMap<String, Source>,
    owners: BTreeMap<u64, OwnerRows>,
    encounter: Option<Encounter>,
    fence: u64,
}

impl Ledger {
    pub fn actors(&self) -> impl Iterator<Item = &Actor> {
        self.actors.values()
    }

    pub fn sources(&self) -> impl Iterator<Item = &Source> {
        self.sources.values()
    }

    pub fn actor_by_id(&self, id: &str) -> Option<&Actor> {
        self.actors.get(id)
    }

    pub fn source_by_key(&self, key: &str) -> Option<&Source> {
        self.sources.get(key)
    }

    pub fn actor(&self, guid: u64) -> Option<&Actor> {
        self.actors.get(self.actor_guids.get(&guid)?)
    }

    pub fn note_guid_actor(&mut self, guid: u64, actor: Actor) {
        self.actor_guids.insert(guid, actor.id.clone());
        self.live_actors.insert(guid);
        self.note_actor(actor);
    }

    pub fn despawn_actor(&mut self, guid: u64) {
        if !self.live_actors.remove(&guid) {
            return;
        }
        if let Some(id) = self.actor_guids.get(&guid) {
            if self
                .live_actors
                .iter()
                .any(|live| self.actor_guids.get(live) == Some(id))
            {
                return;
            }
            if let Some(actor) = self.actors.get_mut(id) {
                actor.state = "despawned";
            }
        }
    }

    pub fn note_actor(&mut self, actor: Actor) {
        self.actors.insert(actor.id.clone(), actor);
    }

    pub fn owner(&self, guid: u64) -> Option<&OwnerRows> {
        self.owners.get(&guid)
    }

    pub fn encounter(&self) -> Option<&Encounter> {
        self.encounter.as_ref()
    }

    pub fn fence(&self) -> u64 {
        self.fence
    }

    pub fn record(
        &mut self,
        clock: f32,
        credit: Credit,
        owners: impl IntoIterator<Item = u64>,
        boss: Option<u64>,
    ) {
        if !credit.amount.is_finite() || credit.amount <= 0.0 {
            return;
        }
        let mut owners = owners.into_iter().filter(|owner| *owner != 0).peekable();
        if owners.peek().is_none() {
            return;
        }

        if let Some(boss) = boss {
            if let Some(active) = self
                .encounter
                .as_mut()
                .filter(|encounter| encounter.end.is_none())
            {
                if !active.bosses.contains(&boss) {
                    active.bosses.push(boss);
                }
            } else {
                let id = self
                    .encounter
                    .as_ref()
                    .map_or(1, |prior| prior.id.wrapping_add(1).max(1));
                self.encounter = Some(Encounter {
                    id,
                    start: clock,
                    end: None,
                    start_fence: self.fence,
                    bosses: vec![boss],
                });
            }
        }
        self.fence = self.fence.wrapping_add(1);
        let encounter = self
            .encounter
            .as_ref()
            .filter(|encounter| {
                encounter.end.is_none() && (boss.is_some() || credit.metric == Metric::Healing)
            })
            .map(|encounter| encounter.id);

        let key = RowKey {
            actor: credit
                .actor
                .as_ref()
                .map_or_else(String::new, |actor| actor.id.clone()),
            source: credit.source.key.clone(),
            origins: credit
                .origins
                .iter()
                .map(|source| source.key.clone())
                .collect(),
            source_owner: credit.source_owner,
            recipient_actor: credit
                .recipient_actor
                .as_ref()
                .map(|actor| actor.id.clone()),
            recipient_owner: credit.recipient_owner,
            metric: credit.metric,
            kind: credit.kind,
            school: credit.school,
            periodic: credit.periodic,
            reflected: credit.reflected,
            proc: credit.proc,
        };
        if let Some(actor) = credit.actor {
            self.note_actor(actor);
        }
        if let Some(actor) = credit.recipient_actor {
            self.note_actor(actor);
        }
        for source in std::iter::once(credit.source).chain(credit.origins) {
            self.sources.entry(source.key.clone()).or_insert(source);
        }
        let mut credited = Vec::new();
        for owner in owners {
            if credited.contains(&owner) {
                continue;
            }
            credited.push(owner);
            self.owners.entry(owner).or_default().record(
                key.clone(),
                clock,
                self.fence,
                encounter,
                credit.amount,
            );
        }
    }

    pub fn finish_encounter(&mut self, clock: f32) {
        if let Some(active) = self
            .encounter
            .as_mut()
            .filter(|encounter| encounter.end.is_none())
        {
            active.end = Some((clock, self.fence));
        }
    }
}

#[derive(Debug, Default)]
pub(super) struct DetailedLoadout {
    pub records: Vec<String>,
    pub sources: Vec<Source>,
}

#[derive(Debug)]
pub(super) struct DetailedOwner {
    pub guid: u64,
    pub active: bool,
    pub actor: Actor,
    pub loadout: DetailedLoadout,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn advancing_a_history_bucket_does_not_extend_its_merge_boundary() {
        let mut rows = OwnerRows::default();
        let key = RowKey {
            actor: hero_id(1),
            source: "ability:cleave:r1".into(),
            origins: Vec::new(),
            source_owner: Owner::Known(1),
            recipient_actor: None,
            recipient_owner: Owner::Unowned,
            metric: Metric::Damage,
            kind: CreditKind::Damage,
            school: School::Known(1),
            periodic: false,
            reflected: false,
            proc: false,
        };
        for (index, clock) in [0.0, 0.1, 0.19, 0.21, 0.29, 0.40].into_iter().enumerate() {
            rows.record(key.clone(), clock, (index + 1) as u64, Some(1), 2.0);
        }
        assert_eq!(
            rows.history
                .iter()
                .map(|bucket| bucket.clock)
                .collect::<Vec<_>>(),
            [0.19, 0.29, 0.40]
        );
        assert_eq!(rows.history[0].entries[0].1.through, 6.0);
        assert_eq!(rows.history[0].entries[0].1.at, 2.0);
        assert_eq!(rows.history[2].entries[0].1.qualifying_through, 12.0);
        assert_eq!(rows.counters[0].ordinal, 1);
    }
}
