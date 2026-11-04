//! Current-target addon lists. These project the live mechanics, not a second
//! simulation. Original list order, field precision and empty clears are kept.

use std::sync::LazyLock;

use azeroth_survivors_re::{
    enemies::Position,
    player_abilities::{behavior::totem_passives, damage},
};
use benilla_formats::WorldMapArea;
use serde::Deserialize;

use crate::{gameplay::mechanics::Mechanics, localization::Localization};

use super::{
    BridgeCatalog,
    addon_feed::{AddonMessage, field},
    addon_scalars,
};

#[derive(Deserialize)]
pub(super) struct ZoneBoss {
    pub id: u32,
    pub name: String,
    pub at_minutes_f32: f32,
    #[serde(rename = "final")]
    pub raw_final: bool,
}

#[derive(Deserialize)]
pub(super) struct ZoneRecord {
    pub key: String,
    pub name: String,
    pub subtitle: String,
    pub map_id: u32,
    pub area_id: u32,
    pub center: [f32; 2],
    pub difficulty_f32: f32,
    pub bosses: Vec<ZoneBoss>,
}

#[derive(Deserialize)]
struct SpellMetadata {
    key: String,
    name: String,
    icon: String,
    spell: u32,
}

static ZONES: LazyLock<Vec<ZoneRecord>> = LazyLock::new(|| {
    use azeroth_survivors_re::zones::scholomance as school;
    let mut zones: Vec<ZoneRecord> =
        serde_json::from_str(include_str!("../../../assets/addon-zones-0.105.0.json"))
            .expect("retained addon zone metadata");
    zones.insert(school::INDEX, ZoneRecord {
        key: school::KEY.into(),
        name: school::NAME.into(),
        subtitle: school::SUBTITLE.into(),
        map_id: school::MAP,
        area_id: school::AREA,
        center: [school::SPAWN[0], school::SPAWN[1]],
        difficulty_f32: school::DIFFICULTY,
        bosses: school::BOSSES.iter().map(|row| ZoneBoss {
            id: row.id,
            name: row.name.into(),
            at_minutes_f32: row.time_minutes,
            raw_final: row.flag_54 != 0,
        }).collect(),
    });
    zones
});
static SPELLS: LazyLock<Vec<SpellMetadata>> = LazyLock::new(|| {
    serde_json::from_str(include_str!(
        "../../../assets/addon-spell-metadata-0.112.0.json"
    ))
    .expect("current addon spell metadata")
});

pub(super) fn zone_record(key: &str) -> Option<&'static ZoneRecord> {
    ZONES.iter().find(|zone| zone.key == key)
}

/// 0.109.0 14591b3f0: exact map/area first; otherwise the smallest same-map rectangle
/// containing the zone center. The first row wins equal-area ties.
fn map_basis<'a>(zone: &ZoneRecord, catalog: &'a BridgeCatalog) -> Option<&'a WorldMapArea> {
    let maps = catalog.map_areas.as_ref()?;
    let rows = maps.iter().map(|(_, area)| area).collect::<Vec<_>>();
    select_map(zone, &rows)
}

fn select_map<'a>(zone: &ZoneRecord, rows: &[&'a WorldMapArea]) -> Option<&'a WorldMapArea> {
    if let Some(area) = rows
        .iter()
        .copied()
        .find(|area| area.map_id == zone.map_id && area.area_id == zone.area_id)
    {
        return Some(area);
    }
    let [x, y] = zone.center;
    rows.iter()
        .copied()
        .filter(|area| {
            area.map_id == zone.map_id
                && area.loc_right <= y
                && y <= area.loc_left
                && area.loc_bottom <= x
                && x <= area.loc_top
        })
        .reduce(|previous, next| {
            let size = |area: &WorldMapArea| {
                ((area.loc_top - area.loc_bottom) * (area.loc_left - area.loc_right)).abs()
            };
            if size(previous).to_bits() <= size(next).to_bits() {
                previous
            } else {
                next
            }
        })
}

fn coordinates(point: [f32; 3], basis: Option<&WorldMapArea>) -> String {
    let [x, y, z] = point;
    let [mx, my] = basis.map_or([-1., -1.], |basis| {
        [
            (basis.loc_left - y) / (basis.loc_left - basis.loc_right),
            (basis.loc_top - x) / (basis.loc_top - basis.loc_bottom),
        ]
    });
    format!("{x:.1},{y:.1},{z:.1},{mx:.4},{my:.4}")
}

fn unit_state(game: &Mechanics, guid: u64) -> u8 {
    game.bosses.iter().find(|row| row.guid == guid).map_or_else(
        || game.addon_guardian_awake(guid).unwrap_or(0),
        |row| u8::from(row.ai.enraged),
    )
}

pub(super) fn snapshot(
    game: &Mechanics,
    locale: &Localization,
    catalog: &BridgeCatalog,
    _position: Position,
) -> Vec<AddonMessage> {
    let zone = zone_record(game.zone.key);
    let progress = game.addon_progress();
    let schedule = zone.map_or_else(String::new, |zone| {
        zone.bosses
            .iter()
            .enumerate()
            .map(|(index, boss)| {
                let state = if index >= progress.bosses_spawned {
                    "due"
                } else if game
                    .bosses
                    .iter()
                    .any(|row| !row.actor.dead && row.definition.id == boss.id)
                {
                    "up"
                } else {
                    "dead"
                };
                format!(
                    "{},{:.0},{},{},{}",
                    index + 1,
                    boss.at_minutes_f32 * 60.,
                    field(&addon_scalars::localized(
                        locale,
                        format!("boss.{}.name", boss.id),
                        &boss.name
                    )),
                    u8::from(boss.raw_final),
                    state
                )
            })
            .collect::<Vec<_>>()
            .join(";")
    });

    //0.109.0 1459bcd00 includes every living boss/guardian/ordinary elite. Sort by
    //kind(final,boss,guardian,elite) then the low32 spawn ID, and cap at40.
    let mut units = game
        .bosses
        .iter()
        .filter(|row| !row.actor.dead)
        .map(|row| (row.guid, row.health, row.maximum_health))
        .chain(
            game.actors
                .iter()
                .filter(|row| {
                    !row.actor.dead
                        && (row.definition.flag_4c != 0
                            || game.addon_guardian_awake(row.guid).is_some())
                })
                .map(|row| (row.guid, row.health, row.maximum_health)),
        )
        .collect::<Vec<_>>();
    let priority = |guid| match addon_scalars::unit_kind(game, guid).unwrap_or("normal") {
        "final" => 0,
        "boss" => 1,
        "guardian" => 2,
        _ => 3,
    };
    units.sort_by_key(|(guid, _, _)| (priority(*guid), *guid as u32));
    let unit_rows = units
        .iter()
        .take(40)
        .map(|&(guid, hp, hpm)| {
            format!(
                "{},{},{},{:.0},{:.0},{}",
                addon_scalars::unit_kind(game, guid).unwrap(),
                guid as u32,
                field(&addon_scalars::unit_name(game, guid, locale).unwrap_or_default()),
                if hp <= 0. { 0. } else { hp },
                hpm,
                unit_state(game, guid)
            )
        })
        .collect::<Vec<_>>()
        .join(";");

    // Debuffs cover every living boss/guardian, independently of the40-unit
    // display cap. Their unit order follows the same kind/ID comparator.
    let debuffs = units
        .iter()
        .filter(|(guid, _, _)| priority(*guid) < 3)
        .flat_map(|&(guid, _, _)| {
            game.addon_debuffs(guid)
                .into_iter()
                .map(move |aura| (guid, aura))
        })
        .map(|(guid, aura)| {
            let metadata = SPELLS.iter().find(|row| row.spell == aura.spell);
            let dbc = crate::native_dbc::spell(aura.spell);
            let permanent = metadata
                .is_some_and(|row| matches!(row.key.as_str(), "faerie_fire" | "hunters_mark"));
            let name = metadata.map_or_else(
                || dbc.map_or_else(String::new, |spell| spell.name.clone()),
                |row| {
                    addon_scalars::localized(locale, format!("ability.{}.name", row.key), &row.name)
                },
            );
            let icon = metadata
                .map(|row| format!("Interface\\Icons\\{}", row.icon))
                .or_else(|| dbc.map(|spell| spell.icon.clone()))
                .unwrap_or_default();
            let dispel = dbc.map_or("", |spell| spell.dispel);
            let (duration, ends) = if permanent {
                (-1., -1.)
            } else {
                (aura.duration, aura.ends)
            };
            format!(
                "{},{},{},{:.1},{:.1},{},{},{},{}",
                guid as u32,
                aura.spell,
                aura.stacks,
                duration,
                ends,
                u8::from(permanent),
                field(dispel),
                field(&icon),
                field(&name)
            )
        })
        .collect::<Vec<_>>()
        .join(";");

    let spells = game
        .abilities
        .iter()
        .chain(game.racial.iter())
        .map(|instance| {
            let definition = instance.definition;
            let interval = if definition.kind == 11 {
                if matches!(definition.key, "redemption" | "faerie_fire") {
                    0.
                } else {
                    totem_passives::passive_interval(instance, game.current_cooldown_multiplier())
                }
            } else {
                damage::base_interval(instance, game.current_cooldown_multiplier())
            };
            format!(
                "{},{},{},{:.1},{:.1}",
                field(definition.key),
                definition.spell_id,
                instance.rank,
                if instance.remaining > 0. {
                    instance.remaining
                } else {
                    0.
                },
                interval
            )
        })
        .collect::<Vec<_>>()
        .join(";");
    let buffs = game
        .execution
        .auras
        .iter()
        .filter(|aura| game.clock < aura.expires_at)
        .map(|aura| format!("{},{:.1}", aura.spell_id, aura.expires_at - game.clock))
        .collect::<Vec<_>>()
        .join(";");
    let [chests, lairs] = destination_messages(game, locale, catalog);
    vec![
        AddonMessage::new("AZSBOSSES", schedule),
        AddonMessage::new("AZSUNITS", unit_rows),
        AddonMessage::new("AZSDEBUFFS", debuffs),
        AddonMessage::new("AZSSPELLS", spells),
        AddonMessage::new("AZSBUFFS", buffs),
        chests,
        lairs,
    ]
}

/// Shared world destinations with the active recipient's guardian flag and locale.
pub(super) fn destination_messages(
    game: &Mechanics,
    locale: &Localization,
    catalog: &BridgeCatalog,
) -> [AddonMessage; 2] {
    let basis = zone_record(game.zone.key).and_then(|zone| map_basis(zone, catalog));
    let chests = game
        .cache_records()
        .iter()
        .map(|row| {
            format!(
                "{},{}",
                row.id as u32,
                coordinates([row.position.x, row.position.y, row.position.z], basis)
            )
        })
        .collect::<Vec<_>>()
        .join(";");

    let flagged = game.addon_flagged_lair();
    let lairs =
        game.guardian_lairs()
            .iter()
            .enumerate()
            .map(|(index, lair)| {
                let holder = lair.active_guid.and_then(|guid| {
                    game.actors
                        .iter()
                        .find(|row| row.guid == guid && !row.actor.dead)
                });
                let (state, id, name, left) = holder.map_or_else(
                    || {
                        let name = game.zone.enemies.get(lair.enemy_index).map_or_else(
                            String::new,
                            |row| {
                                addon_scalars::localized(
                                    locale,
                                    format!("enemy.{}", row.id),
                                    row.name,
                                )
                            },
                        );
                        ("empty", 0, name, (lair.respawn_at - game.clock).max(0.))
                    },
                    |row| {
                        (
                            if game.addon_guardian_awake(row.guid).unwrap_or(0) == 0 {
                                "asleep"
                            } else {
                                "awake"
                            },
                            row.guid as u32,
                            addon_scalars::unit_name(game, row.guid, locale).unwrap_or_default(),
                            -1.,
                        )
                    },
                );
                format!(
                    "{},{},{},{},{:.0},{},{}",
                    index + 1,
                    state,
                    field(&name),
                    id,
                    left,
                    coordinates([lair.home.x, lair.home.y, lair.home.z], basis),
                    u8::from(flagged == Some(index))
                )
            })
            .collect::<Vec<_>>()
            .join(";");
    [
        AddonMessage::new("AZSCHESTS", chests),
        AddonMessage::new("AZSLAIRS", lairs),
    ]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn current_api_metadata_is_complete_without_changing_gameplay_catalog_provenance() {
        assert_eq!(ZONES.len(), 12);
        assert_eq!(SPELLS.len(), 113);
        assert!(ZONES.iter().all(|zone| zone.bosses.len() == 5));
        assert_eq!(
            zone_record("elwynn").unwrap().bosses[4].at_minutes_f32 * 60.,
            960.
        );
        assert!(
            SPELLS
                .iter()
                .any(|spell| spell.key == "arcane_power" && spell.spell == 12042)
        );
    }

    #[test]
    fn map_selection_matches_unchanged_current_native_vectors() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.105.0/addon-bridge/lists/map-native.json"
        ))
        .unwrap();
        for case in fixture["cases"].as_array().unwrap() {
            let raw: Vec<(u32, u32, f32, f32, f32, f32)> =
                serde_json::from_value(case["rows"].clone()).unwrap();
            let rows = raw
                .into_iter()
                .map(|(map_id, area_id, left, right, top, bottom)| WorldMapArea {
                    map_id,
                    area_id,
                    name: String::new(),
                    loc_left: left,
                    loc_right: right,
                    loc_top: top,
                    loc_bottom: bottom,
                })
                .collect::<Vec<_>>();
            let refs = rows.iter().collect::<Vec<_>>();
            let actual = if case["null_table"].as_bool().unwrap() {
                None
            } else {
                select_map(zone_record("elwynn").unwrap(), &refs)
            };
            let actual =
                actual.and_then(|selected| rows.iter().position(|row| std::ptr::eq(row, selected)));
            assert_eq!(
                actual,
                case["selected_index"].as_u64().map(|index| index as usize),
                "{case}"
            );
        }
    }

    #[test]
    fn world_coordinates_preserve_native_axis_order_precision_and_missing_map_sentinel() {
        let basis = WorldMapArea {
            map_id: 0,
            area_id: 12,
            name: String::new(),
            loc_left: 100.,
            loc_right: 0.,
            loc_top: 200.,
            loc_bottom: 0.,
        };
        assert_eq!(
            coordinates([50., 25., 3.], Some(&basis)),
            "50.0,25.0,3.0,0.7500,0.7500"
        );
        assert_eq!(
            coordinates([50., 25., 3.], None),
            "50.0,25.0,3.0,-1.0000,-1.0000"
        );
    }
}
