//! AS0.113.2 Creature-query branch and opcode0x61 response, with the six
//! recovered 0.117.0 companion additions, 0.121.0 Explosive Orb identity and
//! 0.141.0 Scholomance Risen Guard identity.
//! See the creature-queries and white-devilsaur reports for native provenance.
//! Reuse the existing CreatureName cache/Lua events; no alternate unit metadata owner.
use std::sync::OnceLock;

use crate::{catalog::MenuCatalog, localization::Localization};
use azeroth_survivors_re::{
    guardians::catalog::ZONES,
    run_effects::pets::{DREAD_LORD, MATRIARCH},
};
use benilla_app::local_client::events::SessionEvent;

pub(crate) fn creature_query(entry: u32, locale: &Localization) -> Option<SessionEvent> {
    super::query_packets::decode(query_with(entry, |key, fallback| {
        locale.lookup(key).unwrap_or(fallback).to_owned()
    }))
}

fn query_with(entry: u32, text: impl Fn(&str, &str) -> String) -> SessionEvent {
    let mut template = None;
    for zone in ZONES {
        if let Some(enemy) = zone.enemies.iter().find(|row| row.id == entry) {
            static MENU: OnceLock<MenuCatalog> = OnceLock::new();
            let fallback = &MENU
                .get_or_init(MenuCatalog::embedded)
                .zones
                .iter()
                .find(|row| row.key == zone.key)
                .expect("native zone has menu definition")
                .subtitle;
            template = Some((
                text(&format!("enemy.{entry}"), enemy.name),
                text(&format!("zone.{}.subtitle", zone.key), fallback),
                enemy.raw_2c,
                u32::from(enemy.flag_4c),
                enemy.model_id,
            ));
            break;
        }
        if let Some(boss) = zone.bosses.iter().find(|row| row.id == entry) {
            template = Some((
                text(&format!("boss.{entry}.name"), boss.name),
                String::new(),
                boss.raw_3c,
                3,
                boss.model_id,
            ));
            break;
        }
    }
    if template.is_none() {
        if let Some(&(_, name, key, subtitle, kind, display)) =
            SPECIALS.iter().find(|row| row.0 == entry)
        {
            template = Some((
                if key.is_empty() {
                    name.to_owned()
                } else {
                    text(key, name)
                },
                if subtitle.is_empty() {
                    String::new()
                } else {
                    text(subtitle, subtitle)
                },
                kind,
                0,
                display,
            ));
        }
    }
    let (name, subname, creature_type, rank, display_id) = match template {
        Some((name, subname, kind, rank, display)) => (
            Some(name),
            (!subname.is_empty()).then_some(subname),
            Some(kind),
            rank,
            display,
        ),
        // Native miss sets bit31; the ordinary decoder removes it even if the
        // requested entry already had bit31 set. A valid empty name stays Some.
        None => (None, None, None, 0, 0),
    };
    SessionEvent::CreatureName {
        entry: if name.is_some() {
            entry
        } else {
            entry & 0x7fff_ffff
        },
        name,
        subname,
        creature_type,
        rank,
        display_id,
        type_flags: 0,
        pet_family: 0,
        pet_spell_list: 0,
        civilian: false,
        racial_leader: false,
    }
}

// Only query-specific templates absent from the shared enemy/boss catalogs.
// (entry, raw name, name key, subname key, creature type, display ID).
const SPECIALS: &[(u32, &str, &str, &str, u32, u32)] = &[
    (9001, "Experience", "Experience", "", 10, 1825),
    (9500, "Totem", "Totem", "", 11, 4589),
    (9510, "Wolf", "Wolf", "Companion", 1, 165),
    (9511, "Raptor", "Raptor", "Companion", 1, 1959),
    (9512, "Imp", "Imp", "Companion", 1, 4449),
    (9514, "Felguard", "Felguard", "Companion", 1, 5047),
    (9515, "Treant", "Treant", "Companion", 1, 2078),
    (9516, "Spirit Wolf", "Spirit Wolf", "Companion", 1, 776),
    (
        9517,
        "Water Elemental",
        "Water Elemental",
        "Companion",
        1,
        110,
    ),
    (9518, "Felhunter", "Felhunter", "Companion", 1, 850),
    (9519, "Voidwalker", "Voidwalker", "Companion", 1, 1130),
    (9520, "Succubus", "Succubus", "Companion", 1, 4162),
    (9521, "Infernal", "Infernal", "Companion", 1, 169),
    (9522, "Doomguard", "Doomguard", "Companion", 1, 433),
    (
        DREAD_LORD.entry,
        DREAD_LORD.name,
        DREAD_LORD.name,
        "Companion",
        1,
        DREAD_LORD.model,
    ),
    (9530, "White Devilsaur", "White Devilsaur", "Companion", 1, 5239),
    (9531, "White Devilsaur", "White Devilsaur", "Companion", 1, 5239),
    (MATRIARCH.entry, MATRIARCH.name, MATRIARCH.name, "Companion", 1, MATRIARCH.model),
    (9600, "Egg Sac", "object.9600.name", "", 10, 10056),
    (9601, "Fel Totem", "object.9601.name", "", 10, 4589),
    (9602, "Hex Totem", "object.9602.name", "", 10, 1529),
    (9603, "Healing Ward", "object.9603.name", "", 10, 2030),
    (9604, "Warding Totem", "object.9604.name", "", 10, 4588),
    (9605, "Arcane Crystal", "object.9605.name", "", 10, 9832),
    (9606, "Soul Crystal", "object.9606.name", "", 10, 16135),
    (9607, "Web Cocoon", "object.9607.name", "", 10, 16213),
    (9608, "Spore", "object.9608.name", "", 10, 16111),
    (9609, "Restless Spirit", "object.9609.name", "", 10, 1825),
    (9610, "Frost Totem", "object.9610.name", "", 10, 4587),
    (9611, "Wind Totem", "object.9611.name", "", 10, 4590),
    (9612, "Explosive Orb", "object.9612.name", "", 10, 16111),
    (9613, "", "", "", 8, 16033),
    (9614, "Risen Guard", "object.9614.name", "", 10, 7848),
    (9615, "", "", "", 8, 14352),
    (9616, "", "", "", 8, 15556),
    (9617, "", "", "", 8, 1061),
    (9618, "", "", "", 8, 433),
    (9619, "", "", "", 8, 5305),
    (9620, "", "", "", 8, 448),
    (9621, "", "", "", 8, 11583),
    (9622, "", "", "", 8, 9994),
    (9623, "", "", "", 8, 2429),
    (9624, "", "", "", 8, 2041),
    (9625, "", "", "", 8, 11380),
    (9626, "", "", "", 8, 16622),
];

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn risen_guard_localizes_the_name_on_the_existing_query_route() {
        for (translation, expected) in [
            (None, "Risen Guard"),
            (Some("Garde ressuscité"), "Garde ressuscité"),
            (Some(""), ""),
        ] {
            let event = query_with(9614, |key, fallback| {
                assert_eq!(key, "object.9614.name");
                assert_eq!(fallback, "Risen Guard");
                translation.unwrap_or(fallback).to_owned()
            });
            let response = super::super::query_packets::decode(event).unwrap();
            assert!(matches!(
                response,
                SessionEvent::CreatureName {
                    entry: 9614, name: Some(name), subname: None,
                    creature_type: Some(10), rank: 0, display_id: 7848, ..
                } if name == expected
            ));
        }
    }

    #[test]
    fn explosive_orb_matches_current_localized_identity_and_empty_override() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/orb-source.json"
        )).unwrap();
        for case in proof["cases"].as_array().unwrap() {
            let expected = case["name"].as_str().unwrap();
            let event = query_with(9612, |key, fallback| {
                assert_eq!(key, "object.9612.name");
                assert_eq!(fallback, "Explosive Orb");
                expected.into()
            });
            let packet = azeroth_survivors_re::coop::engine_packets::encode(&event, None)
                .unwrap().unwrap();
            assert_eq!(packet.opcode, 0x61);
            assert_eq!(packet.payload.iter().map(|b| format!("{b:02x}")).collect::<String>(),
                case["packet_hex"].as_str().unwrap());
            let SessionEvent::CreatureName {
                entry, name, subname, creature_type, rank, display_id,
                type_flags, pet_family, pet_spell_list, civilian, racial_leader,
            } = event else { panic!("creature response") };
            assert_eq!(entry, 9612);
            assert_eq!(name.as_deref(), Some(expected));
            assert_eq!(subname, None);
            assert_eq!(creature_type, Some(10));
            assert_eq!(display_id, 16111);
            assert_eq!([rank, type_flags, pet_family, pet_spell_list], [0; 4]);
            assert!(!civilian && !racial_leader);
        }
    }

    #[test]
    fn current_white_and_cooperative_companion_templates_match_native_fixture() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/white-devilsaur-integration.json"
        ))
        .unwrap();
        let rows = fixture["creature_templates"].as_array().unwrap();
        assert_eq!(rows.len(), 6);
        for row in rows {
            let entry = row["entry"].as_u64().unwrap() as u32;
            let SessionEvent::CreatureName {
                name, subname, creature_type, rank, display_id, type_flags,
                pet_family, pet_spell_list, civilian, racial_leader, ..
            } = query_with(entry, |key, fallback| {
                assert!(entry == 9530 || entry == 9531);
                assert!(key == "White Devilsaur" || key == "Companion");
                fallback.into()
            }) else { panic!("creature response") };
            assert_eq!(name.as_deref(), row["name"].as_str());
            assert_eq!(subname.as_deref(), row["subname"].as_str().filter(|v| !v.is_empty()));
            assert_eq!(creature_type.map(u64::from), row["type"].as_u64());
            assert_eq!(u64::from(display_id), row["display"].as_u64().unwrap());
            assert_eq!([rank, type_flags, pet_family, pet_spell_list], [0; 4]);
            assert!(!civilian && !racial_leader);
        }
    }

    fn check(row: &serde_json::Value, event: SessionEvent, name: &str, subname: &str) {
        let SessionEvent::CreatureName {
            entry,
            name: actual_name,
            subname: actual_subname,
            creature_type,
            type_flags,
            pet_family,
            rank,
            pet_spell_list,
            display_id,
            civilian,
            racial_leader,
        } = event
        else {
            panic!("creature response")
        };
        assert_eq!(u64::from(entry), row["entry"].as_u64().unwrap());
        assert_eq!(actual_name.as_deref(), Some(name), "entry={entry}");
        assert_eq!(
            actual_subname.as_deref(),
            (!subname.is_empty()).then_some(subname)
        );
        let fields = row["fields"].as_array().unwrap();
        assert_eq!(creature_type.map(u64::from), fields[1].as_u64());
        for (index, value) in [
            (0, type_flags),
            (2, pet_family),
            (3, rank),
            (5, pet_spell_list),
            (6, display_id),
        ] {
            assert_eq!(
                u64::from(value),
                fields[index].as_u64().unwrap(),
                "entry={entry}"
            );
        }
        assert!(!civilian && !racial_leader);
    }

    #[test]
    fn every_native_template_matches_in_all_languages_and_with_missing_keys() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/creature-queries.json"
        ))
        .unwrap();
        let catalogs: Vec<serde_json::Value> = [
            include_str!("../../../assets/locales/en.json"),
            include_str!("../../../assets/locales/pl.json"),
            include_str!("../../../assets/locales/cs.json"),
            include_str!("../../../assets/locales/de.json"),
            include_str!("../../../assets/locales/pt.json"),
            include_str!("../../../assets/locales/es.json"),
            include_str!("../../../assets/locales/fr.json"),
            include_str!("../../../assets/locales/ro.json"),
            include_str!("../../../assets/locales/tr.json"),
            include_str!("../../../assets/locales/ru.json"),
            include_str!("../../../assets/locales/uk.json"),
            include_str!("../../../assets/locales/zh.json"),
            include_str!("../../../assets/locales/ja.json"),
            include_str!("../../../assets/locales/ko.json"),
        ]
        .into_iter()
        .map(|source| serde_json::from_str(source).unwrap())
        .collect();
        for row in fixture["hits"].as_array().unwrap() {
            let entry = row["entry"].as_u64().unwrap() as u32;
            // The 0.121.0 Orb and 0.141.0 Risen Guard supersede these empty rows.
            if matches!(entry, 9612 | 9614) {
                continue;
            }
            let name_key = row["name_key"].as_str().unwrap();
            let subname_key = row["subname_key"].as_str().unwrap();
            let raw_name = row["raw_name"].as_str().unwrap();
            let raw_subname = row["raw_subname"].as_str().unwrap();
            check(
                row,
                query_with(entry, |_, fallback| fallback.into()),
                raw_name,
                raw_subname,
            );
            for catalog in &catalogs {
                let text = |key: &str, fallback: &str| {
                    catalog
                        .get(key)
                        .or_else(|| catalogs[0].get(key))
                        .and_then(|v| v.as_str())
                        .unwrap_or(fallback)
                        .to_owned()
                };
                let name = text(name_key, raw_name);
                let subname = text(subname_key, raw_subname);
                check(row, query_with(entry, text), &name, &subname);
            }
        }
        for entry in [0, 9513, 65535, 65536, 0x7fff_ffff, 0x8000_0258, u32::MAX] {
            let SessionEvent::CreatureName {
                entry: actual,
                name,
                subname,
                creature_type,
                type_flags,
                pet_family,
                rank,
                pet_spell_list,
                display_id,
                civilian,
                racial_leader,
            } = query_with(entry, |_, _| panic!("unknown entry must not translate"))
            else {
                unreachable!()
            };
            assert_eq!(actual, entry & 0x7fff_ffff);
            assert!(name.is_none() && subname.is_none() && creature_type.is_none());
            assert_eq!(
                [type_flags, pet_family, rank, pet_spell_list, display_id],
                [0; 5]
            );
            assert!(!civilian && !racial_leader);
        }
    }
}
