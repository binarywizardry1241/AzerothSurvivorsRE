//! AZS/ZONE/RUN/TGT/END projections of the live run owners.
//! Current 0.109.0 field/format/lifecycle evidence and separate gameplay limits:
//! docs/analysis/addon-bridge-0.109.0.md.

use azeroth_survivors_re::enemies::Position;

use super::super::{RunSession, mechanics::Mechanics};
use super::addon_feed::field;
use crate::{localization::Localization, menu_state::MenuState};

pub(super) struct Inputs {
    pub position: Position,
    pub facing: f32,
    pub target: Option<u64>,
}

pub(super) struct Payloads {
    pub stats: String,
    pub zone: String,
    pub run: String,
    pub target: String,
    pub end: String,
}

pub(super) fn localized(locale: &Localization, key: String, fallback: &str) -> String {
    let text = locale.label(&key);
    if text == key {
        fallback.to_owned()
    } else {
        text.to_owned()
    }
}

pub(super) fn unit_kind(game: &Mechanics, guid: u64) -> Option<&'static str> {
    if let Some(boss) = game.bosses.iter().find(|row| row.guid == guid) {
        return Some(if boss.definition.flag_54 != 0 {
            "final"
        } else {
            "boss"
        });
    }
    // Native14591a302: a ward has no boss/guardian header or elite flag.
    if game.ward_actors().iter().any(|row| row.guid == guid) {
        return Some("normal");
    }
    let actor = game.actors.iter().find(|row| row.guid == guid)?;
    Some(if game.guardian_render_scale(guid).is_some() {
        "guardian"
    } else if actor.definition.flag_4c != 0 {
        "elite"
    } else {
        "normal"
    })
}

pub(super) fn unit_name(game: &Mechanics, guid: u64, locale: &Localization) -> Option<String> {
    if let Some(boss) = game.bosses.iter().find(|row| row.guid == guid) {
        return Some(localized(
            locale,
            format!("boss.{}.name", boss.definition.id),
            boss.definition.name,
        ));
    }
    // Native14591a1cc uses14590d9a0, whose null-definition fallback is
    // localized "Enemy". Creature-template display names have another owner.
    if game.ward_actors().iter().any(|row| row.guid == guid) {
        return Some(locale.label("Enemy").to_owned());
    }
    let actor = game.actors.iter().find(|row| row.guid == guid)?;
    Some(localized(
        locale,
        format!("enemy.{}", actor.definition.id),
        actor.definition.name,
    ))
}

fn values<const N: usize>(rows: [(&str, String); N]) -> String {
    rows.into_iter()
        .map(|(key, value)| format!("{key}={value}"))
        .collect::<Vec<_>>()
        .join(";")
}

fn race(race: u8) -> (&'static str, &'static str) {
    // Current descriptor strings, not WoW's uppercase client tokens.
    match race {
        2 => ("orc", "Orc"),
        3 => ("dwarf", "Dwarf"),
        4 => ("nightelf", "Night Elf"),
        5 => ("scourge", "Undead"),
        6 => ("tauren", "Tauren"),
        7 => ("gnome", "Gnome"),
        8 => ("troll", "Troll"),
        _ => ("human", "Human"),
    }
}

pub(super) fn phase(session: &RunSession) -> &'static str {
    let Some(game) = &session.mechanics else {
        return "";
    };
    phase_for(game, session.started, session.paused || session.talent_view_open)
}

pub(super) fn phase_for(game: &Mechanics, started: bool, paused: bool) -> &'static str {
    if !started {
        "ready"
    } else if game.dead {
        "dead"
    } else if game.completed {
        "victory"
    } else if paused {
        "paused"
    } else if game.is_paused_for_choice() || game.cache_choices_active() {
        "choosing"
    } else {
        "playing"
    }
}

/// Native 0.109.0 145917799..14591781d publishes -1 when the next spawn
/// deadline is reached or unordered. Zero is not a pending countdown.
fn next_boss_seconds(scheduled: Option<f32>, endless: bool, endless_deadline: f32, clock: f32) -> f32 {
    let remaining = match scheduled {
        Some(deadline) => deadline - clock,
        None if endless => endless_deadline - clock,
        None => return -1.0,
    };
    if remaining > 0.0 { remaining } else { -1.0 }
}

/// Actual run rank/vector, English affix keys in stored order, and selected
/// hero identity in the recipient's locale. The run ID belongs to the game.
pub(super) fn zone_snapshot(game: &Mechanics, name: &str, locale: &Localization) -> Option<String> {
    let zone = super::addon_lists::zone_record(game.zone.key)?;
    let final_at = zone.bosses.iter().find(|boss| boss.raw_final)
        .map_or(-1.0, |boss| boss.at_minutes_f32 * 60.0);
    let zone_name = localized(locale, format!("zone.{}.name", zone.key), &zone.name);
    let zone_subtitle = localized(locale, format!("zone.{}.subtitle", zone.key), &zone.subtitle);
    let (race_key, race_name) = race(game.stats.native_race);
    let race_localized = localized(locale, format!("race.{race_key}.name"), race_name);
    let class_name = locale.label(&format!("class.{}.name", game.class.key)).to_owned();
    let gender = game.stats.packed_player_field.to_le_bytes()[2];
    Some(values([
        ("zone", field(&zone.key)),
        ("zname", field(&zone_name)),
        ("zsub", field(&zone_subtitle)),
        ("diff", format!("{:.2}", zone.difficulty_f32)),
        ("len", format!("{final_at:.0}")),
        ("bt", zone.bosses.len().to_string()),
        ("class", game.class.key.into()),
        ("cname", field(&class_name)),
        ("race", field(race_name)),
        ("rname", field(&race_localized)),
        ("hero", field(name)),
        ("gender", gender.to_string()),
        ("map", zone.map_id.to_string()),
        ("heroic", game.rules.heroic_rank.to_string()),
        ("run", game.addon_run_id.clone()),
        ("affixes", game.active_affix_ids().iter().map(|id| match id {
            0 => "bolstering", 1 => "sanguine", 2 => "explosive",
            _ => unreachable!("source-owned Heroic affix ID"),
        }).collect::<Vec<_>>().join(",")),
    ]))
}

pub(super) fn snapshot(
    session: &RunSession,
    _menu: &MenuState,
    inputs: Inputs,
    locale: &Localization,
) -> Option<Payloads> {
    let game = session.mechanics.as_ref()?;
    snapshot_for(game, &session.name, phase(session), inputs, locale)
}

pub(super) fn snapshot_for(
    game: &Mechanics, name: &str, phase: &str, inputs: Inputs, locale: &Localization,
) -> Option<Payloads> {
    let zone = super::addon_lists::zone_record(game.zone.key)?;
    let progress = game.addon_progress();
    let final_at = zone
        .bosses
        .iter()
        .find(|boss| boss.raw_final)
        .map_or(-1.0, |boss| boss.at_minutes_f32 * 60.0);
    let next = zone.bosses.get(progress.bosses_spawned);
    let next_seconds = next_boss_seconds(
        next.map(|boss| boss.at_minutes_f32 * 60.0),
        game.rules.endless,
        progress.endless_deadline,
        game.clock,
    );
    let next_name = next.map_or_else(String::new, |boss| {
        localized(locale, format!("boss.{}.name", boss.id), &boss.name)
    });
    let zone_name = localized(locale, format!("zone.{}.name", zone.key), &zone.name);
    // Current145918710 /145916cfd read active Game+305; the menu can
    // already hold an independently edited or imported hero while a run lives.
    let (race_key, race_name) = race(game.stats.native_race);
    let race_localized = localized(locale, format!("race.{race_key}.name"), race_name);
    let class_name = locale
        .label(&format!("class.{}.name", game.class.key))
        .to_owned();
    let alive_bosses = game.bosses.iter().filter(|row| !row.actor.dead).count();
    let alive = game.actors.iter().filter(|row| !row.actor.dead).count()
        + alive_bosses
        + game
            .ward_actors()
            .iter()
            .filter(|row| !row.actor.dead)
            .count();
    let elites = game
        .actors
        .iter()
        .filter(|row| {
            !row.actor.dead
                && row.definition.flag_4c != 0
                && game.guardian_render_scale(row.guid).is_none()
        })
        .count();
    let awake = game
        .actors
        .iter()
        .filter(|row| !row.actor.dead && game.guardian_awake(row.guid))
        .count();
    let held = game
        .guardian_lairs()
        .iter()
        .filter(|lair| lair.active_guid.is_some())
        .count();
    let footer = game.choice_footer();
    let (proc_key, proc_value, proc_maximum) = game.addon_proc();
    let proc_value = (proc_value * 100.0).round() / 100.0;
    let mut facing = inputs.facing % std::f32::consts::TAU;
    if facing < 0.0 {
        facing += std::f32::consts::TAU;
    }
    let dealt = game
        .damage_meter()
        .iter()
        .fold(0.0_f64, |sum, row| sum + row.total)
        .round();
    let run = values([
        ("t", format!("{:.2}", game.clock)),
        ("ph", phase.into()),
        ("lvl", game.level.to_string()),
        ("xp", game.xp.to_string()),
        ("xpn", game.xp_required().to_string()),
        ("hp", format!("{:.0}", game.health().max(0.0))),
        ("hpm", format!("{:.0}", game.max_health())),
        ("sh", format!("{:.0}", game.execution.vitals.absorb)),
        ("gold", game.gold.to_string()),
        ("kills", game.kills.to_string()),
        ("en", alive.to_string()),
        ("el", elites.to_string()),
        ("bu", alive_bosses.to_string()),
        ("gu", held.to_string()),
        ("ga", awake.to_string()),
        ("lairs", game.guardian_lairs().len().to_string()),
        ("bs", progress.bosses_spawned.to_string()),
        ("bt", zone.bosses.len().to_string()),
        ("nb", format!("{next_seconds:.1}")),
        ("nbn", field(&next_name)),
        ("fin", format!("{final_at:.0}")),
        (
            "left",
            format!(
                "{:.1}",
                if game.rules.endless || final_at <= 0.0 {
                    -1.0
                } else {
                    (final_at - game.clock).max(0.0)
                }
            ),
        ),
        ("endl", u8::from(game.rules.endless).to_string()),
        ("won", u8::from(progress.won).to_string()),
        ("lives", game.remaining_lives().to_string()),
        ("rr", footer.rerolls.to_string()),
        ("rrc", footer.reroll_cost.to_string()),
        ("chest", game.cache_price().to_string()),
        ("dealt", format!("{dealt:.0}")),
        ("bk", game.boss_kills().to_string()),
        ("gk", game.guardian_kills().to_string()),
        ("ek", game.elite_kills().to_string()),
        ("ck", game.caches_bought().to_string()),
        ("taken", format!("{:.0}", game.taken_total().round())),
        ("ge", game.gold_earned.to_string()),
        ("owed", progress.owed.to_string()),
        ("sl", game.stored_levels().to_string()),
        ("proc", proc_key.into()),
        ("pv", proc_value.to_string()),
        ("pm", proc_maximum.to_string()),
        ("px", format!("{:.1}", inputs.position.x)),
        ("py", format!("{:.1}", inputs.position.y)),
        ("pz", format!("{:.1}", inputs.position.z)),
        ("pf", format!("{facing:.3}")),
    ]);
    let zone_payload = zone_snapshot(game, name, locale)?;
    let end = if game.dead || game.completed {
        values([
            (
                "result",
                if game.completed {
                    "victory"
                } else if game.abandoned() {
                    "left"
                } else {
                    "defeat"
                }
                .into(),
            ),
            ("t", format!("{:.1}", game.clock)),
            ("lvl", game.level.to_string()),
            ("kills", game.kills.to_string()),
            ("elites", game.elite_kills().to_string()),
            ("guardians", game.guardian_kills().to_string()),
            ("bosses", game.boss_kills().to_string()),
            ("dmg", format!("{:.0}", game.effective_damage().round())),
            ("taken", format!("{:.0}", game.taken_total().round())),
            ("gold", game.gold_earned.to_string()),
            ("chests", game.caches_bought().to_string()),
            ("magnets", game.collected_magnets().to_string()),
            ("endl", u8::from(game.rules.endless).to_string()),
            ("hero", field(name)),
            ("class", game.class.key.into()),
            ("cname", field(&class_name)),
            ("race", field(race_name)),
            ("rname", field(&race_localized)),
            ("zone", field(&zone.key)),
            ("zname", field(&zone_name)),
        ])
    } else {
        String::new()
    };
    Some(Payloads {
        stats: game.addon_stats(),
        zone: zone_payload,
        run,
        target: target(game, inputs.target, locale),
        end,
    })
}

fn target(game: &Mechanics, selected: Option<u64>, locale: &Localization) -> String {
    let Some(guid) = selected.filter(|guid| *guid != 0) else {
        return "kind=none".into();
    };
    if guid == game.player_guid {
        return "kind=player".into();
    }
    let Some(kind) = unit_kind(game, guid) else {
        return "kind=other".into();
    };
    let (dead, health, maximum, state, elite) =
        if let Some(boss) = game.bosses.iter().find(|row| row.guid == guid) {
            (
                boss.actor.dead,
                boss.health,
                boss.maximum_health,
                u8::from(boss.ai.enraged),
                1,
            )
        } else if let Some(row) = game.ward_actors().iter().find(|row| row.guid == guid) {
            (row.actor.dead, row.health, row.maximum_health, 0, 0)
        } else {
            let row = game
                .actors
                .iter()
                .find(|row| row.guid == guid)
                .expect("classified actor");
            (
                row.actor.dead,
                row.health,
                row.maximum_health,
                u8::from(game.guardian_awake(guid)),
                u8::from(kind == "guardian" || row.definition.flag_4c != 0),
            )
        };
    if dead {
        return format!("kind=dead;id={}", guid as u32);
    }
    values([
        ("kind", kind.into()),
        ("id", (guid as u32).to_string()),
        (
            "name",
            field(&unit_name(game, guid, locale).expect("classified actor name")),
        ),
        ("hp", format!("{:.0}", health.max(0.0))),
        ("hpm", format!("{maximum:.0}")),
        ("state", state.to_string()),
        ("elite", elite.to_string()),
    ])
}

#[cfg(test)]
mod tests {
    use super::super::super::mechanics::{RunPlayerStats, RunRules};
    use super::*;

    fn session() -> RunSession {
        let game = Mechanics::new(
            "elwynn",
            "warrior",
            RunRules { heroic_rank: 0,
                difficulty: 1.0,
                density_percent: 100,
                hp_percent: 100,
                damage_percent: 100,
                speed_percent: 100,
                endless: false,
            },
            RunPlayerStats {
                maximum_health: 100.0,
                health_per_level: 9.0,
                health_multiplier: 1.0,
                regeneration: 0.0,
                pickup_radius: 9.0,
                luck_bonus: 0.0,
                heal_on_kill: 0.0,
                armor_fraction: 0.0,
                damage_reduction: 0.0,
                damage_multiplier: 1.0,
                cooldown_multiplier: 1.0,
                critical_chance: 0.0,
                critical_multiplier: 2.0,
                experience_multiplier: 1.0,
                gold_multiplier: 1.0,
                native_race: 1,
                packed_player_field: 0x0101,
            },
            [1, 2, 3, 4],
        )
        .unwrap();
        RunSession {
            mechanics: Some(game),
            name: "Hero,=;\t\n".into(),
            started: true,
            ..Default::default()
        }
    }

    fn fields(payload: &str) -> std::collections::BTreeMap<&str, &str> {
        payload
            .split(';')
            .filter_map(|entry| entry.split_once('='))
            .collect()
    }

    #[test]
    fn zone_uses_actual_affix_order_and_recipient_identity() {
        let mut session = session();
        let game = session.mechanics.as_mut().unwrap();
        game.rules.heroic_rank = 5;
        game.configure_heroic_affixes(5, 0);
        let expected = game.active_affix_ids().iter().map(|id| match id {
            0 => "bolstering", 1 => "sanguine", 2 => "explosive", _ => unreachable!(),
        }).collect::<Vec<_>>().join(",");
        let payload = zone_snapshot(game, "Other,hero", &Localization::english_for_tests()).unwrap();
        let zone = fields(&payload);
        assert_eq!(zone["heroic"], "5");
        assert_eq!(zone["affixes"], expected);
        assert_eq!(zone["hero"], "Other hero");
        assert!(!zone.contains_key("mods"));
        game.clock = 1000.0;
        assert_eq!(zone_snapshot(game, "Other,hero", &Localization::english_for_tests()).unwrap(), payload);
    }

    #[test]
    fn recipient_run_uses_the_live_clock_phase_and_captured_mover() {
        let mut session = session();
        let game = session.mechanics.as_mut().unwrap();
        game.clock = 123.375;
        let payload = snapshot_for(game, "Guest", phase_for(game, true, true), Inputs {
            position: Position { x: 12.5, y: -3.5, z: 8.0 }, facing: 1.0, target: None,
        }, &Localization::english_for_tests()).unwrap();
        let run = fields(&payload.run);
        assert_eq!(run.len(), 44);
        assert_eq!(run["t"], "123.38");
        assert_eq!(run["ph"], "paused");
        assert_eq!((run["px"], run["py"], run["pz"], run["pf"]),
            ("12.5", "-3.5", "8.0", "1.000"));
        assert_eq!(fields(&payload.zone)["hero"], "Guest");
    }

    #[test]
    fn scalar_snapshot_uses_current_zone_and_exact_numeric_wire_units() {
        let mut session = session();
        let game = session.mechanics.as_mut().unwrap();
        game.clock = 12.375;
        game.execution.vitals.absorb = 7.0;
        let locale = Localization::english_for_tests();
        let menu = MenuState::from_save_path(None);
        let payloads = snapshot(
            &session,
            &menu,
            Inputs {
                position: Position {
                    x: 1.25,
                    y: -2.5,
                    z: 3.0,
                },
                facing: -std::f32::consts::FRAC_PI_2,
                target: None,
            },
            &locale,
        )
        .unwrap();
        let run = fields(&payloads.run);
        assert_eq!(run.len(), 44);
        assert_eq!(run["t"], "12.38");
        assert_eq!(run["ph"], "playing");
        assert_eq!(run["sh"], "7");
        assert_eq!(run["pf"], "4.712");
        assert_eq!(run["pm"], "0");
        assert_eq!(payloads.target, "kind=none");
        assert!(!payloads.zone.ends_with(';'));
        let zone = fields(&payloads.zone);
        assert_eq!(zone["diff"], "0.82");
        assert_eq!(zone["len"], "960");
        assert_eq!(zone["race"], "Human");
        assert_eq!(zone["heroic"], "0");
        assert_eq!(zone["affixes"], "");
        assert!(!zone.contains_key("mods"));
        assert_eq!(zone["hero"], "Hero    \n");
        assert!(payloads.end.is_empty());
    }

    #[test]
    fn active_identity_survives_disagreeing_editable_menu_through_run_end() {
        let mut session = session();
        let game = session.mechanics.as_mut().unwrap();
        game.stats.native_race = 8;
        game.stats.packed_player_field = u32::from_le_bytes([8, 1, 1, 0]);
        let mut menu = MenuState::from_save_path(None);
        menu.race = 3;
        menu.sex = 0;
        let locale = Localization::english_for_tests();
        let inputs = || Inputs {
            position: Position::default(),
            facing: 0.0,
            target: None,
        };
        let live = snapshot(&session, &menu, inputs(), &locale).unwrap();
        let zone = fields(&live.zone);
        assert_eq!(zone["race"], "Troll");
        assert_eq!(zone["rname"], "Troll");
        assert_eq!(zone["gender"], "1");
        assert!(live.end.is_empty());

        session.mechanics.as_mut().unwrap().abandon(|_| None);
        menu.race = 2;
        menu.sex = 255;
        let terminal = snapshot(&session, &menu, inputs(), &locale).unwrap();
        assert_eq!(terminal.zone, live.zone);
        let end = fields(&terminal.end);
        assert_eq!(end["result"], "left");
        assert_eq!(end["race"], "Troll");
        assert_eq!(end["rname"], "Troll");
    }

    #[test]
    fn next_boss_sentinel_matches_reached_and_unordered_native_deadlines() {
        for (deadline, clock, expected) in [
            (60.0, 59.75, 0.25),
            (60.0, 60.0, -1.0),
            (60.0, 61.0, -1.0),
            (f32::NAN, 0.0, -1.0),
            (60.0, f32::NAN, -1.0),
        ] {
            assert_eq!(next_boss_seconds(Some(deadline), false, 0.0, clock), expected);
            assert_eq!(next_boss_seconds(None, true, deadline, clock), expected);
        }
        assert_eq!(next_boss_seconds(None, false, 60.0, 0.0), -1.0);

        // The real serializer preserves the next boss's name while its
        // deadline has been reached; the ordinary producer owns spawning.
        let mut session = session();
        let game = session.mechanics.as_mut().unwrap();
        game.clock = super::super::addon_lists::zone_record(game.zone.key).unwrap()
            .bosses[0].at_minutes_f32 * 60.0;
        let locale = Localization::english_for_tests();
        let payloads = snapshot(&session, &MenuState::from_save_path(None), Inputs {
            position: Position::default(), facing: 0.0, target: None,
        }, &locale).unwrap();
        let run = fields(&payloads.run);
        assert_eq!(run["nb"], "-1.0");
        assert!(!run["nbn"].is_empty());
    }

    #[test]
    fn departure_result_retains_earned_totals_and_actual_collected_magnets() {
        let mut session = session();
        let game = session.mechanics.as_mut().unwrap();
        game.gold = 10;
        game.gold_earned = 99;
        game.kills = 7;
        for id in [1001,1002] {
            game.pickups.push(super::super::super::mechanics::RunPickup {
                id, created_at: 0.0,
                drop: azeroth_survivors_re::mob_loot::PickupDrop::Magnet {
                    position: azeroth_survivors_re::treasure_chests::Position::default() },
                flight: None, facing: 0.0, auxiliary: [None;2],
            });
            assert!(game.try_collect_pickup(id,Position::default()));
            assert!(!game.try_collect_pickup(id,Position::default()));
        }
        game.abandon(|_| None);
        let locale = Localization::english_for_tests();
        let menu = MenuState::from_save_path(None);
        let payloads = snapshot(
            &session,
            &menu,
            Inputs {
                position: Position {
                    x: 0.0,
                    y: 0.0,
                    z: 0.0,
                },
                facing: 0.0,
                target: Some(1),
            },
            &locale,
        )
        .unwrap();
        let end = fields(&payloads.end);
        assert_eq!(end["result"], "left");
        assert_eq!(end["gold"], "99");
        assert_eq!(end["kills"], "7");
        assert_eq!(end["magnets"], "2");
        assert_eq!(payloads.target, "kind=player");
    }
}
