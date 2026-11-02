//! The native meter's presentation baselines and eleven-second rate history.
//! This state never mutates combat accounting or terminal totals.

use super::super::mechanics::Mechanics;
use crate::localization::Localization;
use azeroth_survivors_re::{run_effects::healing::MeterEntry, run_meter::MeterMode};
use std::collections::BTreeMap;

#[derive(Clone, Debug, PartialEq)]
pub(super) struct Row {
    pub name: String,
    pub icon: String,
    pub talent: bool,
    pub color: Option<[f32; 3]>,
    pub total: f64,
    pub rate: f64,
    pub share: f64,
    pub fill: f32,
    pub breakdown: Vec<(String, f64)>,
}

#[derive(Clone, Debug, Default, PartialEq)]
pub(super) struct Snapshot {
    pub rows: Vec<Row>,
    pub total: f64,
    pub seconds: f64,
    pub rate: f64,
    pub current: f64,
    pub live: bool,
    pub party_available: bool,
}

#[derive(Default)]
pub(super) struct View {
    reset: bool,
    started: f64,
    totals: [f64; 2],
    lines: [BTreeMap<(String, bool), f64>; 2],
    parts: [BTreeMap<(String, bool, String), f64>; 2],
    samples: Vec<(f64, [f64; 4])>,
}

fn raw_rows(entries: &[MeterEntry], locale: &Localization) -> Vec<Row> {
    let mut rows = Vec::<Row>::new();
    for entry in entries {
        let name = locale.label(entry.source.name).to_owned();
        let index = rows
            .iter()
            .position(|row| row.name == name && row.talent == entry.source.talent)
            .unwrap_or_else(|| {
                rows.push(Row {
                    name,
                    icon: entry.source.icon.to_owned(),
                    talent: entry.source.talent,
                    color: None,
                    total: 0.,
                    rate: 0.,
                    share: 0.,
                    fill: 0.,
                    breakdown: Vec::new(),
                });
                rows.len() - 1
            });
        let row = &mut rows[index];
        row.total += entry.total;
        for part in &entry.breakdown {
            let name = locale.label(part.name).to_owned();
            if let Some((_, total)) = row.breakdown.iter_mut().find(|(key, _)| *key == name) {
                *total += part.total;
            } else {
                row.breakdown.push((name, part.total));
            }
        }
    }
    rows
}

/// Current145983f40 wire rows are already localized and damage-sorted. Own
/// received labels/icons rather than requiring static combat catalogue names.
fn replica_rows(value: Option<&serde_json::Value>) -> Vec<Row> {
    value.and_then(serde_json::Value::as_array).into_iter().flatten().filter_map(|row| {
        Some(Row { name:row.get("name")?.as_str()?.to_owned(),
            icon:row.get("icon")?.as_str()?.to_owned(),talent:row.get("proc").and_then(serde_json::Value::as_bool).unwrap_or(false),color:None,
            total:row.get("dmg")?.as_f64()?,rate:0.0,share:0.0,fill:0.0,
            breakdown:row.get("parts").and_then(serde_json::Value::as_array).into_iter().flatten()
                .filter_map(|part|Some((part.get("name")?.as_str()?.to_owned(),part.get("dmg")?.as_f64()?))).collect(),
        })
    }).collect()
}

/// Current1401a5180 adapts each hero separately into the ordinary meter shape.
/// Hero names are identities; top labels are already localized by the HUD producer.
fn party_rows(value: Option<&serde_json::Value>, locale: &Localization) -> Vec<Row> {
    value.and_then(serde_json::Value::as_array).into_iter().flatten().map(|row| {
        let hero = row.get("name").and_then(serde_json::Value::as_str).unwrap_or("");
        let top = row.get("top").and_then(serde_json::Value::as_array);
        let first = top.and_then(|rows| rows.first());
        let name = first.and_then(|row| row.get("name")).and_then(serde_json::Value::as_str)
            .map_or_else(|| hero.to_owned(), |spell| format!("{hero} · {spell}"));
        let icon = first.and_then(|row| row.get("icon")).and_then(serde_json::Value::as_str)
            .unwrap_or("").to_owned();
        let total = row.get("dmg").and_then(serde_json::Value::as_f64).unwrap_or(0.0);
        let mut breakdown: Vec<_> = top.into_iter().flatten().filter_map(|part| {
            Some((part.get("name")?.as_str()?.to_owned(),
                part.get("dmg").and_then(serde_json::Value::as_f64).unwrap_or(0.0)))
        }).collect();
        let other = total - top.into_iter().flatten()
            .filter_map(|part| part.get("dmg").and_then(serde_json::Value::as_f64)).sum::<f64>();
        if other >= 1.0 {
            breakdown.push((locale.label("Other spells").to_owned(), other));
        }
        // The existing party producer supplies canonical #RRGGBB class colors.
        let color = if let Some(text) = row.get("color").and_then(serde_json::Value::as_str) {
            let gold = super::GOLD.to_srgba();
            text.strip_prefix('#')
                .filter(|hex| hex.len() == 6 && hex.is_ascii())
                .and_then(|hex| u32::from_str_radix(hex, 16).ok())
                .map(|rgb| [(rgb >> 16) as u8, (rgb >> 8) as u8, rgb as u8])
                .map(|rgb| rgb.map(|part| f32::from(part) / 255.0))
                // Current140275f84's failed string parse returns GOLD.
                .unwrap_or([gold.red, gold.green, gold.blue])
        } else {
            // Current1400fdfc0's missing/nonstring override uses palette0.
            super::PALETTE[0]
        };
        Row { name, icon, talent:false, color:Some(color),
            total,rate:0.0,share:0.0,fill:0.0,breakdown }
    }).collect()
}

impl View {
    pub fn reset(&mut self) {
        self.reset = true;
        self.samples.clear();
    }

    pub fn snapshot(
        &mut self,
        game: &Mechanics,
        mode: MeterMode,
        locale: &Localization,
    ) -> Snapshot {
        let replica=game.replica_hud();
        // Native1401c8fdf reads the HUD snapshot clock before selecting a mode.
        // A guest's separately received State clock can lag this snapshot.
        let now = replica.map_or_else(|| f64::from(game.clock), |hud| {
            hud.get("time").and_then(serde_json::Value::as_f64).unwrap_or(0.0)
        });
        let damage = replica.map_or_else(||raw_rows(game.damage_meter(),locale),|hud|replica_rows(hud.get("meter")));
        let healing = replica.map_or_else(||raw_rows(game.healing_meter(),locale),|hud|replica_rows(hud.get("healing")));
        let boss = replica.map_or_else(||raw_rows(game.boss_meter(),locale),|hud|replica_rows(hud.get("bossMeter").and_then(|row|row.get("lines"))));
        let host_party;
        let party_value = if let Some(hud) = replica {
            hud.get("partyMeter")
        } else if game.has_party() {
            host_party = serde_json::Value::Array(game.party_meter_hud(locale));
            Some(&host_party)
        } else {
            None
        };
        let party_available = party_value.is_some_and(|value| !value.is_null());
        let party = party_rows(party_value, locale);
        let party_total = party.iter().map(|row| row.total).sum::<f64>();
        let cumulative = replica.map_or_else(|| [
            damage.iter().map(|row| row.total).sum::<f64>().round(),
            healing.iter().map(|row| row.total).sum::<f64>().round(),
            boss.iter().map(|row| row.total).sum(),
            party_total,
        ],|hud| [hud.get("dealt").and_then(serde_json::Value::as_f64).unwrap_or(0.0),
            hud.get("healed").and_then(serde_json::Value::as_f64).unwrap_or(0.0),
            hud.get("bossMeter").and_then(|row|row.get("dealt")).and_then(serde_json::Value::as_f64).unwrap_or(0.0),
            party_total]);
        if self.samples.last().is_some_and(|(time, _)| *time > now) || now < self.started {
            *self = Self::default();
        }
        if self.reset {
            self.started = now;
            self.totals = [cumulative[0], cumulative[1]];
            for (index, rows) in [&damage, &healing].into_iter().enumerate() {
                self.lines[index].clear();
                self.parts[index].clear();
                for row in rows {
                    self.lines[index].insert((row.name.clone(), row.talent), row.total);
                    for (name, total) in &row.breakdown {
                        self.parts[index]
                            .insert((row.name.clone(), row.talent, name.clone()), *total);
                    }
                }
            }
            self.reset = false;
        }
        let totals = [
            (cumulative[0] - self.totals[0]).max(0.),
            (cumulative[1] - self.totals[1]).max(0.),
            cumulative[2],
            cumulative[3],
        ];
        if self.samples.last().is_none_or(|(time, _)| *time < now) {
            self.samples.push((now, totals));
        }
        self.samples.retain(|(time, _)| now - *time <= 11.);
        let index = match mode {
            MeterMode::Damage => 0,
            MeterMode::Healing => 1,
            MeterMode::Boss => 2,
            MeterMode::Party => 3,
        };
        let current = self
            .samples
            .iter()
            .find(|(_, values)| values[index] <= totals[index])
            .filter(|(time, _)| now - *time >= 1.)
            .map_or(0., |(time, values)| {
                (totals[index] - values[index]) / (now - *time)
            });
        let timing = replica.map_or_else(||game.boss_meter_timing(),|hud| {
            let row=hud.get("bossMeter")?;
            Some(azeroth_survivors_re::bosses::death::BossMeterTiming {
                seconds:row.get("secs")?.as_f64()? as f32,live:row.get("live")?.as_bool()?,
            })
        });
        let seconds = if index == 2 {
            timing.map_or(0., |timing| f64::from(timing.seconds))
        } else if index == 3 {
            now
        } else {
            now - self.started
        }
        .max(1.);
        let mut rows = match mode {
            MeterMode::Damage => damage,
            MeterMode::Healing => healing,
            MeterMode::Boss => boss,
            MeterMode::Party => party,
        };
        if index < 2 {
            for row in &mut rows {
                row.total = (row.total
                    - self.lines[index]
                        .get(&(row.name.clone(), row.talent))
                        .copied()
                        .unwrap_or(0.))
                .max(0.);
                for (name, total) in &mut row.breakdown {
                    *total = (*total
                        - self.parts[index]
                            .get(&(row.name.clone(), row.talent, name.clone()))
                            .copied()
                            .unwrap_or(0.))
                    .max(0.);
                }
            }
        }
        if index == 3 {
            // Current1401a1ed0 skips baselines for Boss/Party and admits >=1.
            rows.retain(|row| row.total >= 1.0);
        } else {
            rows.retain(|row| row.total > 0.);
        }
        rows.sort_by(|a, b| {
            b.total
                .partial_cmp(&a.total)
                .unwrap_or(std::cmp::Ordering::Equal)
        });
        let top = rows.first().map_or(1., |row| row.total.max(1.));
        for row in &mut rows {
            row.rate = row.total / seconds;
            row.share = row.total * 100. / totals[index].max(1.);
            row.fill = (row.total * 100. / top) as f32;
        }
        Snapshot {
            rows,
            total: totals[index],
            seconds,
            rate: totals[index] / seconds,
            current,
            live: timing.is_some_and(|timing| timing.live),
            party_available,
        }
    }
}

pub(super) fn compact(value: f64) -> String {
    let value = value.max(0.);
    if value >= 1_000_000. {
        format!("{:.1}m", value / 1_000_000.)
    } else if value >= 1_000. {
        format!("{:.1}k", value / 1_000.)
    } else {
        format!("{value:.0}")
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn replica_meter_retains_received_identity_and_breakdown_without_a_catalogue_lookup() {
        let value=serde_json::json!([{"name":"Flamme du membre","icon":"RemoteIcon",
            "dmg":123.,"proc":true,"parts":[{"name":"Impact","dmg":100.},
                {"name":"Brûlure","dmg":23.}]}]);
        let rows=replica_rows(Some(&value));
        drop(value);
        assert_eq!(rows[0].name,"Flamme du membre");
        assert_eq!(rows[0].icon,"RemoteIcon");
        assert_eq!((rows[0].total,rows[0].talent),(123.,true));
        assert_eq!(rows[0].breakdown,vec![("Impact".into(),100.),("Brûlure".into(),23.)]);
    }

    #[test]
    fn party_adapter_matches_current_native_rows_and_keeps_equal_name_heroes() {
        let fixture:serde_json::Value=serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.121.0/party-meter-ui.json"
        )).unwrap();
        let locale = Localization::english_for_tests().for_code("fr");
        for case in fixture["fixture"]["party_rows"].as_array().unwrap() {
            let value = serde_json::Value::Array(vec![case["input"].clone()]);
            let rows = party_rows(Some(&value), &locale);
            drop(value);
            let row = &rows[0];
            let native = &case["native"];
            assert_eq!(row.name, native["name"].as_str().unwrap());
            assert_eq!(row.icon, native["icon"].as_str().unwrap());
            assert_eq!(row.total, native["dmg"].as_f64().unwrap());
            assert!(!row.talent);
            let parts = native["parts"].as_array().unwrap().iter().map(|part| {
                (part["name"].as_str().unwrap().to_owned(), part["dmg"].as_f64().unwrap())
            }).collect::<Vec<_>>();
            assert_eq!(row.breakdown, parts);
        }
        let hero = fixture["fixture"]["party_rows"][0]["input"].clone();
        let repeated = serde_json::Value::Array(vec![hero.clone(), hero]);
        let rows = party_rows(Some(&repeated), &locale);
        assert_eq!(rows.len(), 2);
        assert_eq!(rows[0].name, rows[1].name);
        assert_eq!(rows[0].color, Some([105.0/255.0,204.0/255.0,240.0/255.0]));
    }

    #[test]
    fn party_color_native_vectors_preserve_distinct_fallbacks_and_f32_values() {
        let fixture:serde_json::Value=serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.121.0/party-meter-ui.json"
        )).unwrap();
        let locale = Localization::english_for_tests();
        for case in fixture["fixture"]["colors"].as_array().unwrap() {
            let mut hero = serde_json::json!({"name":"Twin","dmg":1.0,"top":[]});
            if !case["missing"].as_bool().unwrap() {
                hero["color"] = case["input"].clone();
            }
            let value = serde_json::Value::Array(vec![hero]);
            let row = party_rows(Some(&value), &locale).pop().unwrap();
            let actual = row.color.unwrap().map(f32::to_bits).to_vec();
            let expected = case["native_rgba_bits"].as_array().unwrap().iter().take(3)
                .map(|bits| u32::from_str_radix(bits.as_str().unwrap().trim_start_matches("0x"), 16).unwrap())
                .collect::<Vec<_>>();
            assert_eq!(actual, expected, "{case}");
        }
    }
}
