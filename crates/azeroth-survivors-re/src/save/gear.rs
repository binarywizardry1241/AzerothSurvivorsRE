//! Current 0.109.0 item validation and typed equipment/cosmetic/Seen rows.
//! Native owners and replay limits: docs/analysis/save-gear-0.109.0.md.
//! Current cosmetic preview descriptors: docs/analysis/armory-cosmetics-0.112.0.md.
//! Existing rarity digits0..4 retain their identities; PvP uses5/6 (two faction tables).

use serde::Deserialize;
use std::{
    collections::{BTreeMap, BTreeSet},
    sync::OnceLock,
};

#[derive(Deserialize)]
struct GearClasses {
    classes: Vec<GearClass>,
    preview_items: Vec<PreviewItem>,
}
#[derive(Deserialize)]
struct GearClass {
    id: u8,
    weapon_count: u8,
    pvp_weapon_count: u8,
}

fn catalog() -> &'static GearClasses {
    static CATALOG: OnceLock<GearClasses> = OnceLock::new();
    CATALOG.get_or_init(|| {
        serde_json::from_str(include_str!("../../assets/save-gear-0.97.2.json"))
            .expect("current-revalidated save item and preview data")
    })
}

#[derive(Clone, Copy, Debug, PartialEq, Eq, Deserialize)]
pub struct GearAppearance {
    pub display_id: u32,
    pub inventory_type: u8,
}

#[derive(Deserialize)]
struct PreviewItem {
    id: u32,
    #[serde(flatten)]
    appearance: GearAppearance,
}

/// Compact catalog slot and stored rarity digit; neither is a paperdoll slot/quality.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct GearId {
    pub class: u8,
    pub slot: u8,
    pub rarity_digit: u8,
}

pub fn decode(id: u32) -> Option<GearId> {
    let value = id.checked_sub(100_000)?;
    if value > 11_999 || value % 10 != 0 {
        return None;
    }
    let class = (value / 1_000) as u8;
    let slot = ((value / 100) % 10) as u8;
    let rarity_digit = ((value / 10) % 10) as u8;
    let definition = catalog().classes.iter().find(|entry| entry.id == class)?;
    // Native 0.140.0 145e2cf59 dispatches digit seven to the Tier 0.5
    // catalog. Its supported armor IDs share the compact slot/class encoding.
    if rarity_digit == azeroth_survivors_re::sets::TIER_HALF && slot < 8 {
        return Some(GearId { class, slot, rarity_digit });
    }
    if rarity_digit >= 7 || slot >= 8 + definition.weapon_count {
        return None;
    }
    if rarity_digit >= 5 && slot >= 8 + definition.pvp_weapon_count {
        return None;
    }
    Some(GearId {
        class,
        slot,
        rarity_digit,
    })
}

/// Current 145aa4ea0/145ab44d0: both faction PvP descriptors share the
/// Alliance-digit ownership/star key. Other IDs retain their actual identity.
pub(crate) fn canonical_id(id: u32) -> u32 {
    if decode(id).is_some_and(|piece| piece.rarity_digit == 6) { id - 10 } else { id }
}

/// Native1459a4710 converts the displayed PvP ID for Horde races; saved IDs stay unchanged.
pub(crate) fn faction_item(id: u32, race: u8) -> u32 {
    if matches!(race, 2 | 5 | 6 | 8) && decode(id).is_some_and(|piece| piece.rarity_digit == 5) {
        id + 10
    } else {
        id
    }
}

pub fn preview_item(id: u32, race: u8) -> Option<GearAppearance> {
    if let Some(entry) = azeroth_survivors_re::armory_cosmetics::get(id) {
        return Some(GearAppearance { display_id: entry.display_id, inventory_type: entry.inventory_type });
    }
    decode(id)?;
    let shown = faction_item(id, race);
    catalog()
        .preview_items
        .iter()
        .find(|piece| piece.id == shown)
        .map(|piece| piece.appearance)
}

/// A native class record exists even when both its slot arrays are empty.
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub(crate) struct ClassGear {
    pub class_id: u8,
    pub equip: BTreeMap<usize, u32>,
    pub look: BTreeMap<usize, u32>,
}

#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub(crate) struct Records {
    pub owned: BTreeSet<u32>,
    pub classes: Vec<ClassGear>,
    pub seen: BTreeMap<String, u8>,
    /// Native 0.121.0 stores tenths of a displayed mark, keyed by class.
    /// Encounter order is retained; a later class row replaces and moves it.
    pub marks: Vec<(u8, u32)>,
    /// Current parser sorts (ID, count) then deduplicates by ID, keeping the
    /// lowest nonzero clamped count for repeated IDs.
    pub stars: Vec<(u32, u8)>,
    pub pity: Vec<(u32, u8)>,
}

fn valid_class(class: u8) -> bool {
    class <= 11 && 0x0bbeu16 & (1 << class) != 0
}

/// Current 145ab6a50: `u32:u8`, nonzero count, synthetic gear only, then cap.
/// Token whitespace is significant; `+` is accepted by the integer parser.
fn ranked_piece(value: &str, cap: u8) -> Option<(u32, u8)> {
    let (id, rank) = value.split_once(':')?;
    let id = id.parse::<u32>().ok()?;
    let rank = rank.parse::<u8>().ok()?;
    (rank != 0 && decode(id).is_some()).then_some((id, rank.min(cap)))
}

fn slot_pair(value: &str) -> Option<(usize, u32)> {
    let (slot, id) = value.split_once(':')?;
    let slot = slot.parse::<usize>().ok()?;
    (slot < 19).then_some((slot, id.parse::<u32>().ok()?))
}

pub(crate) fn seen<'a>(lines: impl IntoIterator<Item = &'a str>) -> BTreeMap<String, u8> {
    let mut output = BTreeMap::<String, u8>::new();
    for line in lines {
        let Some(values) = line.trim().strip_prefix("seen|") else {
            continue;
        };
        for value in values.split(',') {
            let Some((key, quality)) = value.split_once('=') else {
                continue;
            };
            if key.is_empty() {
                continue;
            }
            let Ok(quality) = quality.parse::<u8>() else {
                continue;
            };
            let highest = output.entry(key.to_owned()).or_default();
            *highest = (*highest).max(quality.min(4));
        }
    }
    output
}

impl Records {
    pub fn read<'a>(lines: impl IntoIterator<Item = &'a str>) -> Self {
        let lines = lines.into_iter().collect::<Vec<_>>();
        let mut output = Self {
            seen: seen(lines.iter().copied()),
            ..Self::default()
        };
        for line in lines {
            let line = line.trim();
            if let Some(values) = line.strip_prefix("stars|") {
                output.stars.extend(values.split(',').filter_map(|value| ranked_piece(value, 5)));
                continue;
            }
            if let Some(values) = line.strip_prefix("pity|") {
                output.pity.extend(values.split(',').filter_map(|value| ranked_piece(value, u8::MAX)));
                continue;
            }
            if let Some(values) = line.strip_prefix("items|") {
                output.owned.extend(values.split(',').filter_map(|value| {
                    let id = value.parse::<u32>().ok()?;
                    decode(id).map(|_| id)
                }));
                continue;
            }
            let fields = line.split('|').collect::<Vec<_>>();
            let [kind, class, slots] = fields.as_slice() else {
                continue;
            };
            if *kind == "marks" {
                if let (Ok(class), Ok(amount)) = (class.parse::<u8>(), slots.parse::<u32>()) {
                    if valid_class(class) {
                        output.marks.retain(|(saved, _)| *saved != class);
                        output.marks.push((class, amount));
                    }
                }
                continue;
            }
            if !matches!(*kind, "equip" | "look") {
                continue;
            }
            let Ok(class) = class.parse::<u8>() else {
                continue;
            };
            let record = output.class_mut(class);
            for (slot, id) in slots.split(',').filter_map(slot_pair) {
                if *kind == "look" {
                    record.look.insert(slot, id);
                } else if id == 0 {
                    record.equip.remove(&slot);
                } else {
                    record.equip.insert(slot, id);
                }
            }
        }
        for values in [&mut output.stars, &mut output.pity] {
            values.sort_unstable();
            values.dedup_by_key(|(id, _)| *id);
        }
        output
    }

    pub fn class_mut(&mut self, class_id: u8) -> &mut ClassGear {
        let index = self
            .classes
            .iter()
            .position(|row| row.class_id == class_id)
            .unwrap_or_else(|| {
                self.classes.push(ClassGear {
                    class_id,
                    ..ClassGear::default()
                });
                self.classes.len() - 1
            });
        &mut self.classes[index]
    }

    pub fn append(&self, output: &mut Vec<String>) {
        if !self.owned.is_empty() {
            output.push(format!(
                "items|{}",
                self.owned
                    .iter()
                    .map(u32::to_string)
                    .collect::<Vec<_>>()
                    .join(",")
            ));
        }
        // Native1458a4b04 writes both rows in first-encounter class order.
        for record in &self.classes {
            for (kind, slots) in [("equip", &record.equip), ("look", &record.look)] {
                let slots = slots
                    .iter()
                    .filter(|(slot, id)| **slot < 19 && (kind == "look" || **id != 0))
                    .map(|(slot, id)| format!("{slot}:{id}"))
                    .collect::<Vec<_>>();
                output.push(format!("{kind}|{}|{}", record.class_id, slots.join(",")));
            }
        }
        if !self.seen.is_empty() {
            output.push(format!(
                "seen|{}",
                self.seen
                    .iter()
                    .map(|(key, quality)| format!("{key}={quality}"))
                    .collect::<Vec<_>>()
                    .join(",")
            ));
        }
        for (class, amount) in &self.marks {
            output.push(format!("marks|{class}|{amount}"));
        }
        for (kind, values) in [("stars", &self.stars), ("pity", &self.pity)] {
            if !values.is_empty() {
                let values = values.iter().map(|(id, rank)| format!("{id}:{rank}"))
                    .collect::<Vec<_>>().join(",");
                output.push(format!("{kind}|{values}"));
            }
        }
    }
}

pub(super) fn write(lines: &[String]) -> Vec<String> {
    let records = Records::read(lines.iter().map(String::as_str));
    let mut output = lines
        .iter()
        .filter(|line| !is_record(line))
        .cloned()
        .collect::<Vec<_>>();
    records.append(&mut output);
    output
}

pub(crate) fn is_record(line: &str) -> bool {
    ["items|", "equip|", "look|", "seen|", "marks|", "stars|", "pity|"]
        .iter()
        .any(|prefix| line.trim().starts_with(prefix))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn current_marks_stars_and_pity_survive_normalization_and_gear_mutation() {
        let rows = [
            "marks|1|10", "marks|4|0", "marks|1|4294967295", "marks|6|99",
            "marks|11|+8", "marks|11|4294967296", "marks|256|1",
            "stars|101010:255,101000:4,101010:2,101000:0,101000:1,38:3,101000:256",
            "pity|101010:255,101000:4,101010:2,101000:0,101000:1,101000:-1",
        ];
        let mut records = Records::read(rows);
        assert_eq!(records.marks, [(4, 0), (1, u32::MAX), (11, 8)]);
        assert_eq!(records.stars, [(101000, 1), (101010, 2)]);
        assert_eq!(records.pity, [(101000, 1), (101010, 2)]);
        records.class_mut(1).equip.insert(0, 101000);
        let mut written = Vec::new();
        records.append(&mut written);
        assert_eq!(Records::read(written.iter().map(String::as_str)), records);
        assert!(written.iter().any(|line| line == "stars|101000:1,101010:2"));
        assert!(written.iter().any(|line| line == "pity|101000:1,101010:2"));
        assert!(rows.iter().all(|line| is_record(line)));
    }

    #[test]
    fn ranked_tokens_keep_unsigned_widths_and_native_caps() {
        for (token, expected) in [
            ("101000:255", Some((101000, 5))),
            ("+101000:+2", Some((101000, 2))),
            ("101000:0", None), ("101000:256", None),
            ("101000: 1", None), ("101000:1:2", None),
            ("101000:-1", None), ("4294967296:1", None),
        ] {
            assert_eq!(ranked_piece(token, 5), expected, "{token}");
        }
        assert_eq!(ranked_piece("101000:255", u8::MAX), Some((101000, 255)));
    }

    fn native() -> serde_json::Value {
        serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.109.0/save-gear/fixtures.json"
        ))
        .unwrap()
    }

    #[test]
    fn typed_rows_match_current_original_parser_vectors() {
        let fixtures = native();
        for case in fixtures["gear-rows"].as_array().unwrap() {
            let records = Records::read(case["input"].as_str().unwrap().lines());
            let actual = records
                .classes
                .iter()
                .map(|row| {
                    serde_json::json!({
                        "class_id": row.class_id, "equip": row.equip, "look": row.look,
                    })
                })
                .collect::<Vec<_>>();
            assert_eq!(serde_json::to_value(actual).unwrap(), case["expected"]);
            let mut lines = Vec::new();
            records.append(&mut lines);
            assert_eq!(Records::read(lines.iter().map(String::as_str)), records);
        }
        for case in fixtures["seen"].as_array().unwrap() {
            assert_eq!(
                serde_json::to_value(seen(case["input"].as_str().unwrap().lines())).unwrap(),
                case["expected"]
            );
        }
        for case in fixtures["slot-token"].as_array().unwrap() {
            let actual = slot_pair(case["token"].as_str().unwrap());
            assert_eq!(actual.map(|pair| pair.0 as u64), case["slot"].as_u64());
            assert_eq!(actual.map(|pair| u64::from(pair.1)), case["item"].as_u64());
        }
    }

    #[test]
    fn native_slot_serialization_keeps_explicit_hidden_looks() {
        for case in native()["serialize-slot"].as_array().unwrap() {
            let mut record = ClassGear {
                class_id: 1,
                ..ClassGear::default()
            };
            let kind = case["kind"].as_str().unwrap();
            for (slot, value) in case["values"].as_array().unwrap().iter().enumerate() {
                if let Some(id) = value.as_u64() {
                    if kind == "look" {
                        record.look.insert(slot, id as u32);
                    } else {
                        record.equip.insert(slot, id as u32);
                    }
                }
            }
            let records = Records {
                classes: vec![record],
                ..Records::default()
            };
            let mut output = Vec::new();
            records.append(&mut output);
            let actual = output[usize::from(kind == "look")]
                .split('|')
                .nth(2)
                .unwrap();
            let expected = case["expected"]
                .as_array()
                .unwrap()
                .iter()
                .map(|v| v.as_str().unwrap())
                .collect::<Vec<_>>()
                .join(",");
            assert_eq!(actual, expected);
        }
        assert_eq!(
            write(&["equip|255|".to_owned()]),
            ["equip|255|", "look|255|"]
        );
    }

    // Static-derived expectations, not executed in this source-only session.
    #[test]
    fn keeps_legendary_and_both_pvp_variants_without_renumbering() {
        for digit in 0..=6 {
            assert_eq!(
                decode(101_000 + digit * 10).unwrap().rarity_digit,
                digit as u8
            );
        }
        assert_eq!(decode(101_070).unwrap().rarity_digit, 7);
        for id in [0, 38, 101_001, 101_080, 101_900, 106_000, 112_000] {
            assert!(decode(id).is_none(), "{id}");
        }
        assert!(decode(104_960).is_some());
        let lines = ["items|101060,101040,101050,101040,38,999999".to_owned()];
        assert_eq!(write(&lines), ["items|101040,101050,101060"]);
    }

    #[test]
    fn preview_uses_current_faction_display_without_changing_the_saved_id() {
        for race in [1, 3, 4, 7] {
            assert_eq!(preview_item(101_050, race).unwrap().display_id, 30316);
        }
        for race in [2, 5, 6, 8] {
            assert_eq!(preview_item(101_050, race).unwrap().display_id, 30374);
        }
        assert_eq!(preview_item(101_060, 1).unwrap().display_id, 30374);
        let weapon = preview_item(101_850, 2).unwrap();
        assert_eq!((weapon.display_id, weapon.inventory_type), (31998, 17));
        assert_eq!(decode(101_050).unwrap().rarity_digit, 5);
    }
}
