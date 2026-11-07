//! Current 0.109.0 typed Save families, duplicate rules and canonical serialization order.
//! See docs/analysis/save-schema-0.109.0.md; unknown/malformed records are discarded.
//! Current 0.117.0 purchased-tabard admission: docs/analysis/tabard-admission-0.117.0.md.
//! Current 0.120.0 race records/domain: docs/analysis/race-account-0.120.0.md.
use super::{
    appearance, gear, joined, parse_features, progress, talents, Character, Hero, Pick, RunMods,
};
use serde::Deserialize;
use std::{
    collections::{BTreeMap, BTreeSet},
    sync::OnceLock,
};

pub(super) const STAT_KEYS: [&str; 8] = [
    "kills",
    "gold",
    "guardians",
    "bosses",
    "runs",
    "wins",
    "caches",
    "marks",
];

#[derive(Deserialize)]
struct Catalog {
    perks: Vec<Perk>,
}
#[derive(Deserialize)]
struct Perk {
    key: String,
    costs: Vec<u32>,
}
fn catalog() -> &'static Catalog {
    static CATALOG: OnceLock<Catalog> = OnceLock::new();
    CATALOG.get_or_init(|| {
        serde_json::from_str(include_str!("../../assets/rewards-catalogs-0.112.0.json"))
            .expect("current revalidated Rewards metadata")
    })
}

pub(super) fn characters(lines: &[String]) -> Vec<Character> {
    lines
        .iter()
        .filter_map(|line| {
            let f = line.trim().split('|').collect::<Vec<_>>();
            if f.len() < 10 {
                return None;
            }
            Some(Character {
                guid: f[0].parse::<u64>().ok()?,
                name: f[1].to_owned(),
                race: f[2].parse::<u64>().ok()? as u8,
                class: f[3].parse::<u64>().ok()? as u8,
                sex: f[4].parse::<u64>().ok()? as u8,
                features: parse_features(f[5])?,
                best_level: f[6].parse::<u64>().ok()? as u32,
                best_seconds: f[7].parse::<u64>().ok()? as u32,
                runs: f[8].parse::<u64>().ok()? as u32,
                wins: f[9].parse::<u64>().ok()? as u32,
            })
        })
        .collect()
}

pub(super) fn heroes(lines: &[String], loading: bool) -> Vec<Hero> {
    let mut heroes = Vec::<Hero>::new();
    for line in lines {
        let fields = line.trim().split('|').collect::<Vec<_>>();
        let ["hero", class, race, sex, features] = fields.as_slice() else {
            continue;
        };
        let (Ok(class), Ok(race), Ok(sex), Some(features)) = (
            class.parse::<u8>(),
            race.parse::<u8>(),
            sex.parse::<u8>(),
            parse_features(features),
        ) else {
            continue;
        };
        if !super::CLASS_IDS.contains(&class) || !(1..=8).contains(&race) {
            continue;
        }
        let sex = u8::from(sex != 0);
        let features = if loading {
            appearance::normalize_features(race, sex, features)
        } else {
            features
        };
        heroes.retain(|hero| hero.class != class);
        heroes.push(Hero {
            class,
            race,
            sex,
            features,
        });
    }
    heroes
}

pub(super) fn pick(lines: &[String], loading: bool) -> Option<Pick> {
    lines.iter().find_map(|line| {
        let f = line.trim().split('|').collect::<Vec<_>>();
        if !(6..=8).contains(&f.len()) || f[0] != "pick" {
            return None;
        }
        let mut pick = Pick {
            hero: Hero {
                class: f[1].parse::<u8>().ok()?,
                race: f[2].parse::<u8>().ok()?,
                sex: u8::from(f[3].parse::<u8>().ok()? != 0),
                features: f
                    .get(6)
                    .and_then(|value| parse_features(value))
                    .unwrap_or_default(),
            },
            zone: f[4].to_owned(),
            name: f[5].to_owned(),
            heroic_rank: f.get(7).map_or(0, |value| azeroth_survivors_re::heroic::parse_rank(value)),
            mods: RunMods::default(),
        };
        if loading {
            pick = pick.normalized();
        }
        Some(pick)
    })
}

fn csv<'a>(lines: &'a [String], prefix: &'a str) -> impl Iterator<Item = &'a str> {
    lines
        .iter()
        .filter_map(move |line| line.trim().strip_prefix(prefix))
        .flat_map(|row| row.split(','))
}

/// 0.120.0 `145c1e760` / `145c48790`: all trimmed-prefix rows contribute
/// valid ordinary u8 race IDs. The loader sorts and deduplicates their union.
pub(super) fn purchased_races(lines: &[String]) -> Vec<u8> {
    csv(lines, "races|")
        .filter_map(|token| token.parse::<u8>().ok())
        .filter(|race| (1..=8).contains(race))
        .collect::<BTreeSet<_>>()
        .into_iter()
        .collect()
}

/// 0.140.0 prep iterator 0x14605c190 and class admission 0x145e1fbb0.
pub(super) fn prepared_classes(lines: &[String]) -> BTreeSet<u8> {
    csv(lines, "prep|")
        .filter_map(|token| token.parse::<u8>().ok())
        .filter(|class| super::CLASS_IDS.contains(class))
        .collect()
}

fn csv_record(output: &mut Vec<String>, prefix: &str, values: impl IntoIterator<Item = String>) {
    let values = values.into_iter().collect::<Vec<_>>();
    if !values.is_empty() {
        output.push(format!("{prefix}|{}", values.join(",")));
    }
}

pub(super) fn statistics(lines: &[String]) -> BTreeMap<String, u64> {
    let mut stats = BTreeMap::<String, u64>::new();
    for entry in csv(lines, "stat|") {
        let Some((key, number)) = entry.split_once('=') else {
            continue;
        };
        let Ok(number) = number.parse::<u64>() else {
            continue;
        };
        if STAT_KEYS.contains(&key) {
            let value = stats.entry(key.to_owned()).or_default();
            *value = (*value).max(number);
        }
    }
    stats
}

pub(super) fn achievement_dates(lines: &[String]) -> BTreeMap<String, u64> {
    let mut dates = BTreeMap::<String, u64>::new();
    for entry in csv(lines, "achat|") {
        let Some((key, number)) = entry.split_once('=') else {
            continue;
        };
        let Ok(number) = number.parse::<u64>() else {
            continue;
        };
        dates
            .entry(key.to_owned())
            .and_modify(|value| *value = (*value).min(number))
            .or_insert(number);
    }
    dates
}

pub(super) fn normalize(lines: &[String], loading: bool) -> Vec<String> {
    let mut output = Vec::new();
    for row in characters(lines) {
        output.push(format!(
            "{}|{}|{}|{}|{}|{}|{}|{}|{}|{}",
            row.guid,
            row.name,
            row.race,
            row.class,
            row.sex,
            joined(&row.features),
            row.best_level,
            row.best_seconds,
            row.runs,
            row.wins
        ));
    }
    if let Some(pick) = pick(lines, loading) {
        output.push(format!(
            "pick|{}|{}|{}|{}|{}|{}|{}",
            pick.hero.class,
            pick.hero.race,
            pick.hero.sex,
            pick.zone,
            pick.name,
            joined(&pick.hero.features),
            pick.heroic_rank
        ));
    }
    output.extend(progress::values(lines).into_iter().map(|(class, count)| {
        format!(
            "open|{class}|{}",
            progress::zones()[(count - 1) as usize].key
        )
    }));
    let records = gear::Records::read(lines.iter().map(String::as_str));
    let mut gear_rows = Vec::new();
    records.append(&mut gear_rows);
    output.extend(
        gear_rows
            .iter()
            .filter(|line| !line.starts_with("seen|"))
            .cloned(),
    );
    let (talent_rows, spec_rows) = talents::normalized_rows(lines);
    output.extend(talent_rows);
    output.extend(spec_rows);
    output.extend(
        gear_rows
            .into_iter()
            .filter(|line| line.starts_with("seen|")),
    );

    let achievements = csv(lines, "ach|")
        .filter(|key| !key.is_empty())
        .map(str::to_owned)
        .collect::<BTreeSet<_>>();
    csv_record(&mut output, "ach", achievements);
    csv_record(
        &mut output,
        "achat",
        achievement_dates(lines)
            .into_iter()
            .map(|(key, number)| format!("{key}={number}")),
    );
    let stats = statistics(lines);
    if stats.values().any(|value| *value != 0) {
        csv_record(
            &mut output,
            "stat",
            STAT_KEYS
                .iter()
                .map(|key| format!("{key}={}", stats.get(*key).copied().unwrap_or(0))),
        );
    }
    output.extend(super::weapon_glow::records(lines));
    output.extend(super::heroic::prepared_record(&prepared_classes(lines)));
    output.extend(super::heroic::records(&super::heroic::clears(lines)));
    let mut beaten = BTreeMap::<u8, BTreeSet<usize>>::new();
    for line in lines {
        let fields = line.trim().split('|').collect::<Vec<_>>();
        let ["beat", class, zones] = fields.as_slice() else {
            continue;
        };
        let Ok(class) = class.parse::<u8>() else {
            continue;
        };
        for zone in zones.split(',') {
            if let Some(index) = progress::zones().iter().position(|row| row.key == zone) {
                beaten.entry(class).or_default().insert(index);
            }
        }
    }
    for (class, zones) in beaten {
        output.push(format!(
            "beat|{class}|{}",
            zones
                .into_iter()
                .map(|index| progress::zones()[index].key.as_str())
                .collect::<Vec<_>>()
                .join(",")
        ));
    }
    if let Some(row) = super::coop_history::record(&super::coop_history::zones(lines)) {
        output.push(row);
    }
    let mut perks = BTreeMap::<String, u8>::new();
    for entry in csv(lines, "perk|") {
        let Some((key, rank)) = entry.split_once(':') else {
            continue;
        };
        let Ok(rank) = rank.parse::<u8>() else {
            continue;
        };
        if loading && rank == 0 {
            continue;
        }
        let Some(definition) = catalog().perks.iter().find(|row| row.key == key) else {
            continue;
        };
        let rank = rank.min(definition.costs.len() as u8);
        perks
            .entry(key.to_owned())
            .and_modify(|value| *value = (*value).min(rank))
            .or_insert(rank);
    }
    csv_record(
        &mut output,
        "perk",
        perks.into_iter().map(|(key, rank)| format!("{key}:{rank}")),
    );
    let tabards = csv(lines, "tabard|")
        .filter_map(|value| value.parse::<u32>().ok())
        .filter(|id| azeroth_survivors_re::account_progression::is_purchasable_tabard(*id))
        .collect::<BTreeSet<_>>();
    csv_record(
        &mut output,
        "tabard",
        tabards.into_iter().map(|id| id.to_string()),
    );
    csv_record(
        &mut output,
        "races",
        purchased_races(lines).into_iter().map(|id| id.to_string()),
    );
    if let Some(pets) = lines
        .iter()
        .find_map(|line| line.trim().strip_prefix("pets|"))
    {
        csv_record(
            &mut output,
            "pets",
            pets.split(',').take(2).map(|key| {
                azeroth_survivors_re::run_effects::loot_companions::definitions()
                    .iter()
                    .find(|row| row.key == key)
                    .map_or("squirrel", |row| row.key.as_str())
                    .to_owned()
            }),
        );
    }
    if let Some(resets) = lines
        .iter()
        .find_map(|line| line.trim().strip_prefix("resets|")?.parse::<u32>().ok())
    {
        if resets != 0 {
            output.push(format!("resets|{resets}"));
        }
    }
    for hero in heroes(lines, loading) {
        output.push(format!(
            "hero|{}|{}|{}|{}",
            hero.class,
            hero.race,
            hero.sex,
            joined(&hero.features)
        ));
    }
    output
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn all_typed_families_match_current_full_native_round_trips() {
        let fixtures: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/save-schema/fixtures.json"
        ))
        .unwrap();
        for case in fixtures["cases"].as_array().unwrap() {
            let save = super::super::Save::parse(case["input"].as_str().unwrap()).unwrap();
            let expected = case["expected"].as_str().unwrap();
            assert_eq!(save.plaintext(), expected, "{case}");
            assert_eq!(
                super::super::Save::parse(expected).unwrap().plaintext(),
                expected,
                "{case}"
            );
        }
    }

    #[test]
    fn purchased_csv_values_match_the_current_native_descriptor_gate() {
        let fixtures: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/tabard-admission/purchases.json"
        ))
        .unwrap();
        for case in fixtures["cases"].as_array().unwrap() {
            // The trailing delimiter leaves each supplied token unchanged by
            // whole-record trimming. This tests the per-value admission seam.
            let lines = [format!("tabard|{},", case["input"].as_str().unwrap())];
            let normalized = normalize(&lines, true);
            let actual = normalized
                .iter()
                .find_map(|line| line.strip_prefix("tabard|"));
            let expected = case["accepted"].as_bool().unwrap().then(|| {
                case["parsed_u32"].as_u64().unwrap().to_string()
            });
            assert_eq!(actual, expected.as_deref(), "{case}");
        }
    }

    #[test]
    fn gated_tabards_are_not_purchases_and_keep_their_earned_look_state() {
        let save = super::super::Save::parse(
            "ach|feat:herod,coop:odds\ntabard|90024,90016,90011,90025,90011\nlook|1|18:90025\n",
        )
        .unwrap();
        let plain = save.plaintext();
        assert!(plain.contains("tabard|90011,90024\n"));
        assert!(plain.contains("ach|coop:odds,feat:herod\n"));
        assert!(plain.contains("look|1|18:90025\n"));
        assert_eq!(super::super::Save::parse(&plain).unwrap().plaintext(), plain);
    }

    #[test]
    fn optional_appearance_cache_matches_current_native_clamp() {
        let fixtures: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/save-schema/fixtures.json"
        ))
        .unwrap();
        for case in fixtures["appearance_cases"].as_array().unwrap() {
            let ranges = case["counts"].as_array().map(|rows| {
                rows.iter()
                    .map(|row| {
                        (
                            (
                                row["race"].as_u64().unwrap() as u8,
                                row["sex"].as_u64().unwrap() as u8,
                            ),
                            serde_json::from_value::<[u8; 5]>(row["values"].clone()).unwrap(),
                        )
                    })
                    .collect::<appearance::AppearanceRanges>()
            });
            let features = serde_json::from_value::<[u8; 5]>(case["features"].clone()).unwrap();
            let expected = serde_json::from_value::<[u8; 5]>(case["expected"].clone()).unwrap();
            assert_eq!(
                appearance::normalize_with_ranges(
                    case["race"].as_u64().unwrap() as u8,
                    case["sex"].as_u64().unwrap() as u8,
                    features,
                    ranges.as_ref()
                ),
                expected
            );
        }
    }
}
