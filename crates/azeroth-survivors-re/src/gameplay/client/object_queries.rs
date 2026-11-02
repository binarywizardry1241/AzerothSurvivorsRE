//! Current 0.113.2 incoming1458646d0, name145809000 and packet1458d58f0.
//! Native/decoder boundary and fixtures: docs/analysis/template-query-wire-0.113.2.md.
use crate::localization::Localization;
use benilla_app::local_client::events::SessionEvent;

pub(crate) fn gameobject_query(entry: u32, locale: &Localization) -> Option<SessionEvent> {
    super::query_packets::decode(query_with(entry, |key, fallback| {
        locale.lookup(key).unwrap_or(fallback).to_owned()
    }))
}

fn query_with(entry: u32, text: impl FnOnce(&str, &str) -> String) -> SessionEvent {
    let (type_id, display_id) = match entry.checked_sub(9005) {
        Some(index @ 0..=8) => (
            if index == 0 { 3 } else { 5 },
            [259, 5931, 5995, 5991, 342, 3271, 2232, 6671, 4831][index as usize],
        ),
        _ => (5, 2614),
    };
    let (key, fallback) = match entry {
        9001..=9003 => ("object.xp", "Experience"),
        9004 => ("object.gold", "Gold"),
        9005 => ("object.cache", "Battleground Cache"),
        9006 => ("object.rune_speed", "Speed Rune"),
        9007 => ("object.rune_berserk", "Berserker Rune"),
        9008 => ("object.rune_restore", "Restoration Rune"),
        9009..=9011 => ("object.magnet", "Magnet"),
        9012 => ("object.lightwell", "Lightwell"),
        9013 => ("object.edge", "Edge of the Battlefield"),
        _ => ("object.object", "Object"),
    };
    let name = text(key, fallback);
    SessionEvent::GameObjectInfo {
        entry,
        type_id,
        display_id,
        name,
        data: [0; 24],
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn current_templates_match_native_selectors_names_and_zero_data() {
        let cases: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.113.2/object-queries.json"
        ))
        .unwrap();
        let locale = Localization::english_for_tests();
        for row in cases["cases"].as_array().unwrap() {
            let entry = row["entry"].as_u64().unwrap() as u32;
            let SessionEvent::GameObjectInfo {
                entry: actual,
                type_id,
                display_id,
                name,
                data,
            } = gameobject_query(entry, &locale).unwrap()
            else {
                unreachable!()
            };
            assert_eq!(actual, entry);
            assert_eq!(u64::from(type_id), row["type_id"].as_u64().unwrap());
            assert_eq!(u64::from(display_id), row["display_id"].as_u64().unwrap());
            assert_eq!(name, locale.label(row["key"].as_str().unwrap()));
            assert_eq!(data, [0; 24]);
        }
    }
    #[test]
    fn raw_fallback_and_unknown_entry_match_the_existing_decoder_boundary() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.113.2/object-queries.json"
        ))
        .unwrap();
        for row in proof["cases"].as_array().unwrap() {
            let entry = row["entry"].as_u64().unwrap() as u32;
            let SessionEvent::GameObjectInfo { name, .. } = query_with(entry, |_, raw| raw.into())
            else {
                unreachable!()
            };
            assert_eq!(name, row["raw_name"].as_str().unwrap());
        }
        for entry in [0x8000_0000, 0x8000_232d, u32::MAX] {
            assert!(
                matches!(gameobject_query(entry, &Localization::english_for_tests()),
                Some(SessionEvent::GameObjectUnknown { entry: actual }) if actual == entry & 0x7fff_ffff)
            );
        }
    }
}
