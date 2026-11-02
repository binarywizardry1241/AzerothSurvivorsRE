//! Current native positional startup and its process-lifetime optional roster row.
//! Current0.109.0 selector14000eb00 and factory1458cf500 are independently
//! recovered in docs/analysis/stock-lifecycle-0.109.0.md.

use bevy::prelude::Resource;

use crate::{
    catalog::MenuCatalog,
    save::{Character, CLASS_IDS},
};

pub(crate) const TESTER_GUID: u64 = 0x00ff_ffff;

#[derive(Resource, Default)]
pub(crate) struct NativeStartup {
    pub(crate) realm: Option<usize>,
    pub(crate) character: Option<Character>,
}

impl NativeStartup {
    pub(crate) fn positional(arguments: &[String], catalog: &MenuCatalog) -> Self {
        let realm = arguments.first().map(|zone| zone_index(zone));
        let character = arguments.get(1).map(|class| {
            // Current1458cf500 matches class keys with ASCII case folding; an unknown
            // key selects Warrior. The native race matcher removes spaces
            // from the definition's English name, but not from the argument.
            let index = catalog
                .classes
                .iter()
                .position(|row| row.key.eq_ignore_ascii_case(class))
                .unwrap_or(0);
            let class = CLASS_IDS[index];
            let allowed = crate::save::allowed_races(class);
            let race = arguments
                .get(2)
                .and_then(|value| {
                    catalog.races.iter().enumerate().find_map(|(index, row)| {
                        let id = index as u8 + 1;
                        (row.name.replace(' ', "").eq_ignore_ascii_case(value)
                            && allowed.contains(&id))
                        .then_some(id)
                    })
                })
                .unwrap_or(allowed[0]);
            Character {
                guid: TESTER_GUID,
                name: arguments
                    .get(3)
                    .and_then(|value| crate::hero_name::normalize(value))
                    .unwrap_or_else(|| "Tester".into()),
                race,
                class,
                sex: u8::from(
                    arguments
                        .get(4)
                        .is_some_and(|value| value.eq_ignore_ascii_case("female")),
                ),
                features: [0; 5],
                best_level: 1,
                best_seconds: 0,
                runs: 0,
                wins: 0,
            }
        });
        Self { realm, character }
    }

    /// Current145890450 supplies these ordinary client inputs. Its existing GlueXML
    /// realm/roster policies consume them once and retain manual return behavior.
    pub(crate) fn configure_client(&self, catalog: &MenuCatalog) {
        if let Some(index) = self.realm {
            std::env::set_var("WOW_REALM", &catalog.zones[index].name);
        }
        if let Some(character) = &self.character {
            std::env::set_var("WOW_CHAR", &character.name);
        }
    }
}

/// Current14588d0d0 uses exact lowercase abbreviations and otherwise selects Elwynn.
fn zone_index(value: &str) -> usize {
    match value {
        "duskwood" => 1,
        "wsg" => 2,
        "ungoro" => 3,
        "ab" => 4,
        "feralas" => 5,
        "arena" => 6,
        "sm" => 7,
        "av" => 8,
        "brm" => 9,
        "aq" => 10,
        "naxx" => 11,
        _ => 0,
    }
}
