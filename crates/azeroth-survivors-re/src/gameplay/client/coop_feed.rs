//! Project received native co-op state into the existing FrameXML addon API.
//! This adapter has no simulation, actor defaults or replacement wire schema.

use serde_json::Value;

use super::super::{RunSession, world::ZoneWorld};
use super::{
    BridgeState,
    addon_feed::{AddonMessage, field},
    addon_scalars,
};
use crate::{localization::Localization, menu_state::MenuState};
use azeroth_survivors_re::coop::{
    game_party::{Party, PartyHero, PartySpell},
};
use benilla_app::local_client::{
    LocalClientExtension, LocalClientInput, events::LocalPresentationEvents,
};

/// Called at the ordinary bridge point after co-op receive and before client
/// Lifecycle. The authoritative engine packets still own bodies/actions/auras.
pub(super) fn publish(
    session: &RunSession,
    menu: &MenuState,
    world: &ZoneWorld,
    input: &LocalClientInput,
    locale: &Localization,
    state: &mut BridgeState,
    extension: &mut LocalClientExtension,
    packets: &mut LocalPresentationEvents,
) {
    let Some(game) = session.mechanics.as_ref().filter(|_| menu.in_run) else {
        state.addon.idle(input.ui_time);
        extension.custom_game_menu = false;
        extension.script_update = super::talent_view::publication(false, false);
        return;
    };
    extension.custom_game_menu = true;
    extension.script_update = super::talent_view::publication(true, session.talent_view_open);
    if game.replica_phase().is_none() {
        return;
    }
    if !state.addon.due(session.identity, input.ui_time) {
        return;
    }
    let Some(scalars) = addon_scalars::snapshot(
        session,
        menu,
        addon_scalars::Inputs {
            position: world.position_wow.into(),
            facing: world.facing,
            target: None,
        },
        locale,
    ) else {
        return;
    };
    let mut end = Line::select(
        &scalars.end,
        &[
            "result",
            "t",
            "lvl",
            "kills",
            "guardians",
            "bosses",
            "gold",
            "chests",
            "endl",
            "hero",
            "class",
            "cname",
            "race",
            "rname",
            "zone",
            "zname",
        ],
    );
    let mut snapshot = Vec::new();
    if let Some(hud) = game
        .replica_hud()
        .filter(|hud| hud["type"].as_str() == Some("hud"))
    {
        if let Some(rows) = hud["meter"].as_array() {
            if let Some(total) = rows
                .iter()
                .map(|row| number(&row["dmg"]))
                .sum::<Option<f64>>()
            {
                if !end.0.is_empty() {
                    end.put("dmg", format!("{total:.0}"));
                }
            }
        }
        snapshot.extend(hud_messages(hud));
    }
    // Unknown gear-stat lanes, actor/debuff/map/pet/taken snapshots and complete
    // timer periods are absent from these native messages. Do not emit the
    // guest template's zero/empty simulation in their place.
    // AZSZONE/AZSRUN/AZSTOTEMS arrive as actual host recipient addon packets. A guest
    // template has no authoritative affix/totem vector and must not overwrite
    // those snapshots with its empty local simulation.
    snapshot.push(AddonMessage::new("AZSEND", end.finish()));
    packets.0.extend(state.addon.changed_from(snapshot, game.player_guid));
}

fn number(value: &Value) -> Option<f64> {
    value.as_f64().filter(|value| value.is_finite())
}

#[derive(Default)]
struct Line(Vec<(String, String)>);
impl Line {
    fn select(source: &str, keys: &[&str]) -> Self {
        Self(
            source
                .split(';')
                .filter_map(|entry| {
                    let (key, value) = entry.split_once('=')?;
                    keys.contains(&key).then(|| (key.into(), value.into()))
                })
                .collect(),
        )
    }
    fn put(&mut self, key: &str, value: String) {
        if let Some(row) = self.0.iter_mut().find(|row| row.0 == key) {
            row.1 = value;
        } else {
            self.0.push((key.into(), value));
        }
    }
    fn finish(self) -> String {
        self.0
            .into_iter()
            .map(|(key, value)| format!("{key}={value}"))
            .collect::<Vec<_>>()
            .join(";")
    }
}

fn hud_messages(hud: &Value) -> Vec<AddonMessage> {
    let mut messages = Vec::new();
    let mut stats = Line::default();
    for (key, source, precision) in [
        ("hp", "hpMax", 0),
        ("dmg", "damage", 3),
        ("cd", "cooldown", 3),
        ("crit", "crit", 3),
        ("arm", "armor", 3),
        ("reg", "regen", 2),
        ("spd", "speed", 3),
        ("pick", "pickup", 1),
    ] {
        if let Some(value) = number(&hud[source]) {
            stats.put(key, format!("{value:.precision$}"));
        }
    }
    if !stats.0.is_empty() {
        messages.push(AddonMessage::new("AZS", stats.finish()));
    }
    if let Some(rows) = hud["abilities"].as_array() {
        let rows = rows
            .iter()
            .filter_map(|row| {
                Some(format!(
                    "{},{},{},{:.1},{:.1}",
                    field(row["key"].as_str()?),
                    row["spell"].as_u64()?,
                    row["rank"].as_u64()?,
                    number(&row["cd"])?.max(0.),
                    number(&row["cdMax"])?
                ))
            })
            .collect::<Vec<_>>();
        messages.push(AddonMessage::new("AZSSPELLS", rows.join(";")));
    }
    if let Some(rows) = hud["buffs"].as_array() {
        messages.push(AddonMessage::new(
            "AZSBUFFS",
            rows.iter()
                .filter_map(|row| {
                    Some(format!(
                        "{},{:.1}",
                        row["spell"].as_u64()?,
                        number(&row["left"])?
                    ))
                })
                .collect::<Vec<_>>()
                .join(";"),
        ));
    }
    if let Some(clock) = number(&hud["time"]) {
        for (prefix, key, seconds) in [
            ("AZSMETER", "meter", Some(clock)),
            ("AZSHEAL", "healing", Some(clock)),
            ("AZSBOSSDMG", "bossMeter", number(&hud["bossMeter"]["secs"])),
        ] {
            let rows = if key == "bossMeter" {
                hud[key]["lines"].as_array()
            } else {
                hud[key].as_array()
            };
            if let (Some(rows), Some(seconds)) = (rows, seconds) {
                let entries = rows.iter().filter_map(|row| {
                    Some((
                        row["name"].as_str()?.into(),
                        row["proc"].as_bool()?,
                        number(&row["dmg"])?,
                    ))
                });
                messages.push(AddonMessage::new(
                    prefix,
                    super::super::addon_meters::meter_totals(entries, seconds as f32),
                ));
            } else if key == "bossMeter" && hud[key].as_object().is_some_and(|row| row.is_empty()) {
                messages.push(AddonMessage::new(prefix, String::new()));
            }
        }
        if let Some(rows) = hud["partyMeter"].as_array() {
            let heroes = rows
                .iter()
                .enumerate()
                .filter_map(|(slot, row)| {
                    let class = [1, 2, 3, 4, 5, 7, 8, 9, 11].into_iter().find(|class| {
                        azeroth_survivors_re::coop::game_party::class_key(*class)
                            == row["class"].as_str().unwrap_or("")
                    })?;
                    let spells = row["top"]
                        .as_array()?
                        .iter()
                        .filter_map(|spell| {
                            Some(PartySpell {
                                name: spell["name"].as_str()?.into(),
                                damage: number(&spell["dmg"])?,
                            })
                        })
                        .collect();
                    Some(PartyHero {
                        slot,
                        name: row["name"].as_str()?.into(),
                        class,
                        damage: number(&row["dmg"])?,
                        spells,
                        ..Default::default()
                    })
                })
                .collect();
            messages.push(AddonMessage::new(
                "AZSPARTY",
                Party {
                    active: true,
                    meter_captured: true,
                    heroes,
                    ..Default::default()
                }
                .meter_payload(clock as f32),
            ));
            // The producer includes `revive` only while this hero can recover.
            // Omission therefore clears the old progress rather than retaining it.
            let mut revive = if let Some(share) = number(&hud["revive"]) {
                format!(
                    "down=1;share={:.2};by={}",
                    share.clamp(0., 1.),
                    field(hud["revivedBy"].as_str().unwrap_or(""))
                )
            } else {
                "down=0".into()
            };
            if let (Some(name), Some(share)) = (
                hud["rescue"]["name"].as_str(),
                number(&hud["rescue"]["share"]),
            ) {
                revive.push_str(&format!(";reviving={};rshare={share:.2}", field(name)));
            }
            messages.push(AddonMessage::new("AZSREVIVE", revive));
        }
    }
    messages
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn received_values_use_existing_addon_precision_and_meter_serializer() {
        let rows = hud_messages(&json!({"time":2.0,"damage":1.25,"hpMax":120,
            "abilities":[{"key":"fireball","spell":133,"rank":2,"cd":0.25,"cdMax":1.5}],
            "buffs":[{"spell":139,"left":3.25}],
            "meter":[{"name":"Bolt,;=\tÉ","proc":false,"dmg":12.0},
                {"name":"Bolt","proc":true,"dmg":36.0}],
            "partyMeter":[{"name":"Friend","class":"mage","dmg":48.,
                "top":[{"name":"Fireball","dmg":48.}]}],"revive":0.5,"revivedBy":"Friend"}));
        let get = |prefix| {
            rows.iter()
                .find(|row| row.prefix == prefix)
                .map(|row| row.payload.as_str())
                .unwrap()
        };
        assert_eq!(get("AZS"), "hp=120;dmg=1.250");
        assert_eq!(get("AZSSPELLS"), "fireball,133,2,0.2,1.5");
        assert_eq!(get("AZSBUFFS"), "139,3.2");
        assert_eq!(
            get("AZSMETER"),
            "Bolt,36,18.0,0.7500,1;Bolt    É,12,6.0,0.2500,0"
        );
        assert_eq!(get("AZSPARTY"), "Friend,mage,48,24.0,1.0000,Fireball,24.0");
        assert_eq!(get("AZSREVIVE"), "down=1;share=0.50;by=Friend");
    }

    #[test]
    fn missing_collections_are_not_fabricated_and_received_empty_lists_clear() {
        assert!(hud_messages(&json!({"time":1.})).is_empty());
        let rows = hud_messages(&json!({"time":1.,"abilities":[],"buffs":[],"meter":[],
            "healing":[],"bossMeter":{},"partyMeter":[]}));
        assert_eq!(rows.iter().filter(|row| row.payload.is_empty()).count(), 6);
        assert_eq!(rows.last().unwrap().payload, "down=0");
        assert!(!rows.iter().any(|row| matches!(
            row.prefix,
            "AZSTIMERS" | "AZSDEBUFFS" | "AZSPETS" | "AZSTAKEN"
        )));
    }
}
