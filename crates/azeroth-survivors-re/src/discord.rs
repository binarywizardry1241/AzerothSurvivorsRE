//! Activity builder and publisher, including the 0.139.2 zone/difficulty label.
//! Native wire/worker and platform limits live in discord/transport.rs.
mod transport;

use crate::{
    catalog::MenuCatalog,
    coop_ui::CoopUi,
    localization::Localization,
    menu_state::MenuState,
    options::{OptionsSet, OptionsState},
};
use bevy::prelude::*;
use serde_json::{Value, json};
use std::{
    sync::mpsc,
    time::{SystemTime, UNIX_EPOCH},
};

#[derive(Resource, Default)]
pub(crate) struct RunSnapshot {
    pub in_run: bool,
    pub live: Option<Value>,
    pub entry: Option<Value>,
    pub terminal: Option<Value>,
}

#[derive(Resource, Default)]
struct Publisher {
    last_poll: f32,
    previous: Option<Option<Value>>,
    sender: Option<mpsc::Sender<Option<Value>>>,
    start: Option<i64>,
}

#[derive(SystemSet, Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub(crate) enum DiscordSet {
    Snapshot,
    Publish,
}

pub struct DiscordPlugin;
impl Plugin for DiscordPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<Publisher>()
            .init_resource::<RunSnapshot>()
            .configure_sets(
                Update,
                (DiscordSet::Snapshot, DiscordSet::Publish)
                    .chain()
                    .after(crate::gameplay::RunSet::Present)
                    .after(OptionsSet::Input),
            )
            .add_systems(Update, publish.in_set(DiscordSet::Publish));
    }
}

fn publish(
    time: Res<Time>,
    menu: Res<MenuState>,
    options: Res<OptionsState>,
    catalog: Res<MenuCatalog>,
    locale: Res<Localization>,
    run: Res<RunSnapshot>,
    coop: Option<Res<CoopUi>>,
    stock: Option<Res<benilla_app::local_client::LocalStockFrontend>>,
    mut publisher: ResMut<Publisher>,
) {
    let now = time.elapsed_secs();
    if publisher.previous.is_some() && now - publisher.last_poll < 1.0 {
        return;
    }
    publisher.last_poll = now;
    // The native publisher registers archived discordPresence=1 once. The
    // Options registry registers that same recovered descriptor at startup.
    let activity = if options.engine_cvar("discordPresence").unwrap_or("1").trim() == "0" {
        None
    } else {
        let epoch = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .map_or(0, |duration| duration.as_secs() as i64);
        activity(
            stock.is_none(),
            run.in_run,
            &menu.name,
            menu.class,
            menu.race,
            menu.zone,
            menu.heroic_rank.min(menu.max_heroic_rank()),
            coop.as_deref().and_then(PartyActivity::from_coop).as_ref(),
            &run,
            &catalog,
            &locale,
            epoch,
            &mut publisher.start,
        )
    };
    if publisher.previous.as_ref() == Some(&activity) {
        return;
    }
    if publisher.sender.is_none() && activity.is_some() {
        let (sender, receiver) = mpsc::channel();
        transport::start(receiver);
        publisher.sender = Some(sender);
    }
    if let Some(sender) = &publisher.sender {
        let _ = sender.send(activity.clone());
    }
    publisher.previous = Some(activity);
}

fn translate(locale: &Localization, key: &str, args: &[(&str, String)]) -> String {
    let mut text = locale.label(key).to_owned();
    for (name, value) in args {
        text = text.replace(&format!("{{{name}}}"), value);
    }
    text
}
fn number(value: &Value) -> f64 {
    value.as_f64().unwrap_or(0.0)
}
fn text(value: &Value) -> &str {
    value.as_str().unwrap_or("")
}
fn zone_with_difficulty(zone: &str, rank: u8, locale: &Localization) -> String {
    let difficulty = azeroth_survivors_re::heroic::rank_name(
        rank.min(5),
        locale.label("Normal"),
        locale.label("Heroic"),
    );
    format!("{zone} ({difficulty})")
}

struct PartyActivity<'a> {
    code: &'a str,
    size: usize,
    friends: String,
}

impl<'a> PartyActivity<'a> {
    fn from_coop(coop: &'a CoopUi) -> Option<Self> {
        if !coop.party_active() {
            return None;
        }
        let code = coop.code.as_deref().filter(|code| !code.is_empty())?;
        let heroes = coop
            .lobby
            .as_ref()
            .map_or(&[][..], |lobby| lobby.heroes.as_slice());
        Some(Self {
            code,
            size: heroes.len().max(1),
            friends: heroes
                .iter()
                .filter(|hero| !hero.me)
                .map(|hero| hero.name.as_str())
                .collect::<Vec<_>>()
                .join(", "),
        })
    }

    fn metadata(&self) -> Value {
        let hash = self
            .code
            .bytes()
            .fold(0xcbf2_9ce4_8422_2325u64, |hash, byte| {
                (hash ^ u64::from(byte)).wrapping_mul(0x100_0000_01b3)
            });
        json!({"id": format!("azs-{hash:x}"), "size": [self.size, 5]})
    }
}

fn grouped(value: u64) -> String {
    let digits = value.to_string();
    digits
        .chars()
        .enumerate()
        .flat_map(|(index, ch)| {
            let comma = index != 0 && (digits.len() - index).is_multiple_of(3);
            comma.then_some(',').into_iter().chain(std::iter::once(ch))
        })
        .collect()
}

#[allow(clippy::too_many_arguments)]
fn activity(
    menus: bool,
    in_run: bool,
    hero: &str,
    class: usize,
    race: u8,
    zone: usize,
    menu_rank: u8,
    party: Option<&PartyActivity<'_>>,
    snapshot: &RunSnapshot,
    catalog: &MenuCatalog,
    locale: &Localization,
    epoch: i64,
    start: &mut Option<i64>,
) -> Option<Value> {
    let button =
        json!([{"label": locale.label("Play in your browser"), "url": "https://wow.aethus.pl/"}]);
    if !in_run {
        *start = None;
        if !menus {
            return None;
        }
        let class = catalog.classes.get(class).unwrap_or(&catalog.classes[0]);
        let race = catalog
            .races
            .get(usize::from(race.saturating_sub(1)))
            .unwrap_or(&catalog.races[0]);
        let zone = catalog.zones.get(zone).unwrap_or(&catalog.zones[0]);
        let mut result = json!({
            "details": locale.label(if party.is_some() { "In a co-op lobby" } else { "Choosing a hero" }),
            "state": translate(locale, "{hero} the {race} {class}", &[("hero",hero.into()),("race",race.name.clone()),("class",class.name.clone())]),
            "assets": {"large_image":"logo", "large_text":"Azeroth Survivors",
                "small_image":format!("https://wow.zamimg.com/images/wow/icons/large/classicon_{}.jpg",class.key),
                "small_text":translate(locale,"Next stop: {zone}",&[("zone",zone_with_difficulty(&zone.name, menu_rank, locale))])},
            "buttons":button,
        });
        if let Some(party) = party {
            result["party"] = party.metadata();
        }
        return Some(result);
    }
    let entry = snapshot.entry.as_ref()?;
    let empty = Value::Null;
    let live = snapshot.live.as_ref().unwrap_or(&empty);
    let summary = snapshot.terminal.as_ref();
    let level = number(
        &summary
            .and_then(|row| row.get("level"))
            .filter(|row| row.is_number())
            .unwrap_or(&live["level"]),
    )
    .max(1.0) as u64;
    let kills = number(
        &summary
            .and_then(|row| row.get("kills"))
            .filter(|row| row.is_number())
            .unwrap_or(&live["kills"]),
    ) as u64;
    let kills = translate(locale, "{n} kills", &[("n", grouped(kills))]);
    let rank = entry["heroic"].as_u64().unwrap_or(0) as u8;
    let bg = zone_with_difficulty(text(&entry["bg"]), rank, locale);
    let bg = bg.as_str();
    let hero = text(&entry["hero"]);
    let class_name = text(&entry["class"]);
    let race = text(&entry["race"]);
    let args = [
        ("hero", hero.into()),
        ("level", level.to_string()),
        ("class", class_name.into()),
        ("race", race.into()),
    ];
    let details = translate(
        locale,
        if hero.is_empty() {
            "Level {level} {race} {class}"
        } else {
            "{hero}, level {level} {race} {class}"
        },
        &args,
    );
    let phase = text(&live["phase"]);
    let inactive = summary.is_some() || matches!(phase, "paused" | "ready" | "dead");
    let state = if let Some(summary) = summary {
        translate(
            locale,
            if text(&summary["type"]) == "victory" {
                "🏆 Conquered {bg} · {kills}"
            } else {
                "💀 Fell in {bg} · {kills}"
            },
            &[("bg", bg.into()), ("kills", kills)],
        )
    } else if phase == "dead" {
        translate(
            locale,
            "💀 Fell in {bg} · {kills}",
            &[("bg", bg.into()), ("kills", kills)],
        )
    } else if phase == "ready" {
        translate(locale, "Gearing up in {bg}", &[("bg", bg.into())])
    } else if phase == "paused" {
        translate(locale, "Catching a breath in {bg}", &[("bg", bg.into())])
    } else if let Some(boss) = live.get("boss").filter(|row| row.is_object()) {
        let name = boss["name"]
            .as_str()
            .unwrap_or_else(|| locale.label("a boss"));
        let hp = number(&boss["hp"]) * 100.0 / boss["hpMax"].as_f64().unwrap_or(1.0).max(1.0);
        translate(
            locale,
            "⚔️ Fighting {name} ({hp}%)",
            &[("name", name.into()), ("hp", format!("{hp:.0}"))],
        )
    } else if phase == "choosing" {
        translate(locale, "Choosing a reward · {kills}", &[("kills", kills)])
    } else if live["endless"].as_bool() == Some(true) {
        translate(
            locale,
            "♾️ Endless onslaught · {kills}",
            &[("kills", kills)],
        )
    } else {
        translate(
            locale,
            "Surviving {bg} · {kills}",
            &[("bg", bg.into()), ("kills", kills)],
        )
    };
    let subtitle = text(&entry["subtitle"]);
    let mut small_text = String::new();
    let class = catalog.classes.iter().find(|row| row.name == class_name);
    if let Some(class) = class {
        small_text.clone_from(&class.name);
    }
    if let Some(meters) = live["meter"].as_array().filter(|_| class.is_some()) {
        if let Some(best) = meters
            .iter()
            .max_by(|left, right| number(&left["dmg"]).total_cmp(&number(&right["dmg"])))
        {
            let name = text(&best["name"]);
            if !name.is_empty() {
                let rate = number(&live["dealt"]) / live["time"].as_f64().unwrap_or(1.0).max(1.0);
                let rate = if rate < 1000.0 {
                    format!("{rate:.0}")
                } else {
                    format!("{:.1}k", rate / 1000.0)
                };
                let leader = format!("{name} leads, {rate} DPS");
                if small_text.is_empty() {
                    small_text = leader;
                } else {
                    small_text = format!("{small_text} · {leader}");
                }
            }
        }
    }
    let mut large_text = if subtitle.is_empty() {
        bg.into()
    } else {
        format!("{bg}: {subtitle}")
    };
    if let Some(party) = party.filter(|party| !party.friends.is_empty()) {
        let friends = translate(
            locale,
            "Co-op with {friends}",
            &[("friends", party.friends.clone())],
        );
        large_text = format!("{friends} · {large_text}");
    }
    let mut assets = json!({"large_image":"logo","large_text":large_text});
    if let Some(class) = class {
        assets["small_image"] = format!(
            "https://wow.zamimg.com/images/wow/icons/large/classicon_{}.jpg",
            class.key
        )
        .into();
    }
    if !small_text.is_empty() {
        assets["small_text"] = small_text.into();
    }
    let mut result = json!({"details":details,"state":state,"assets":assets,"buttons":button});
    if let Some(party) = party {
        result["party"] = party.metadata();
    }
    if inactive {
        *start = None;
    } else {
        let candidate = epoch.wrapping_sub(number(&live["time"]) as i64);
        if start.is_none_or(|previous| previous.abs_diff(candidate) >= 4) {
            *start = Some(candidate);
        }
        result["timestamps"] = json!({"start":start.unwrap()});
    }
    Some(result)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn activity_preserves_historical_english_vectors_with_current_zone_labels() {
        let vectors: Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.109.0/discord-presence/native-vectors.json"
        ))
        .unwrap();
        let catalog = MenuCatalog::embedded();
        let locale = Localization::english_for_tests();
        for case in vectors["cases"].as_array().unwrap() {
            let input = &case["input"];
            if input.get("language").is_some_and(|code| code != "en") {
                continue;
            }
            let optional = |key: &str| input.get(key).filter(|value| !value.is_null()).cloned();
            let snapshot = RunSnapshot {
                live: optional("live"),
                entry: optional("entry"),
                terminal: optional("terminal"),
                ..default()
            };
            let mut start = input.get("previous_start").and_then(Value::as_i64);
            let class = input.get("class_id").and_then(Value::as_u64).unwrap_or(1) as u8;
            let class = crate::save::CLASS_IDS
                .iter()
                .position(|id| *id == class)
                .unwrap_or(0);
            let zone = input
                .get("zone")
                .and_then(Value::as_str)
                .unwrap_or("elwynn");
            let zone = catalog
                .zones
                .iter()
                .position(|row| row.key == zone)
                .unwrap_or(0);
            let actual = activity(
                input["menu"].as_bool().unwrap(),
                input["inrun"].as_bool().unwrap(),
                input
                    .get("selection_name")
                    .and_then(Value::as_str)
                    .unwrap_or("Hero"),
                class,
                input.get("race_id").and_then(Value::as_u64).unwrap_or(1) as u8,
                zone,
                0,
                None,
                &snapshot,
                &catalog,
                &locale,
                input.get("epoch").and_then(Value::as_i64).unwrap_or(1000),
                &mut start,
            );
            let mut expected = case["activity"].clone();
            if expected.is_object() && input["inrun"] == true {
                let bg = text(&input["entry"]["bg"]);
                let labelled = format!("{bg} (Normal)");
                let asset = text(&expected["assets"]["large_text"]);
                expected["assets"]["large_text"] =
                    format!("{labelled}{}", &asset[bg.len()..]).into();
                let state = text(&expected["state"]);
                for prefix in [
                    "Gearing up in ",
                    "Catching a breath in ",
                    "Surviving ",
                    "🏆 Conquered ",
                    "💀 Fell in ",
                ] {
                    if let Some(suffix) = state
                        .strip_prefix(prefix)
                        .and_then(|rest| rest.strip_prefix(bg))
                    {
                        expected["state"] = format!("{prefix}{labelled}{suffix}").into();
                        break;
                    }
                }
            } else if expected.is_object() {
                expected["assets"]["small_text"] =
                    format!("{} (Normal)", text(&expected["assets"]["small_text"])).into();
            }
            assert_eq!(actual.unwrap_or(Value::Null), expected, "{}", case["name"]);
            assert_eq!(
                serde_json::to_value(start).unwrap(),
                case["start"],
                "{}",
                case["name"]
            );
        }
    }

    #[test]
    fn current_zone_label_uses_localized_admitted_rank_across_run_phases() {
        let catalog = MenuCatalog::embedded();
        let locale = Localization::english_for_tests();
        let mut snapshot = RunSnapshot {
            entry: Some(json!({
                "bg": "Naxxramas", "subtitle": "Necropolis", "heroic": 3,
                "hero": "Hero", "class": "Warrior", "race": "Human",
            })),
            ..default()
        };
        for (phase, outcome, expected) in [
            (
                "playing",
                None,
                "Surviving Naxxramas (Heroic III) · 0 kills",
            ),
            (
                "paused",
                None,
                "Catching a breath in Naxxramas (Heroic III)",
            ),
            ("ready", None, "Gearing up in Naxxramas (Heroic III)"),
            (
                "playing",
                Some("victory"),
                "🏆 Conquered Naxxramas (Heroic III) · 0 kills",
            ),
            (
                "playing",
                Some("defeat"),
                "💀 Fell in Naxxramas (Heroic III) · 0 kills",
            ),
        ] {
            snapshot.live = Some(json!({"phase": phase}));
            snapshot.terminal = outcome.map(|outcome| json!({"type": outcome}));
            let actual = activity(
                true, true, "", 0, 1, 0, 5, None, &snapshot, &catalog, &locale, 1000, &mut None,
            )
            .unwrap();
            assert_eq!(actual["state"], expected);
            assert_eq!(
                actual["assets"]["large_text"],
                "Naxxramas (Heroic III): Necropolis"
            );
        }
        let de = locale.for_code("de");
        assert_eq!(
            zone_with_difficulty("Naxxramas", 3, &de),
            format!("Naxxramas ({} III)", de.label("Heroic"))
        );
        assert_eq!(
            zone_with_difficulty("Naxxramas", 6, &locale),
            "Naxxramas (Heroic V)"
        );
    }

    #[test]
    fn party_presence_uses_lobby_code_roster_and_local_member_marker() {
        use crate::coop_ui::{HeroRow, LobbyView};

        let mut coop = CoopUi::default();
        coop.status = "joining".into();
        coop.code = Some("abc".into());
        assert!(PartyActivity::from_coop(&coop).is_none());
        coop.role = "guest".into();
        let party = PartyActivity::from_coop(&coop).unwrap();
        assert_eq!(
            party.metadata(),
            json!({"id": "azs-e71fa2190541574b", "size": [1, 5]})
        );
        assert!(party.friends.is_empty());

        coop.lobby = Some(LobbyView {
            name: String::new(),
            capacity: 3,
            heroes: vec![
                HeroRow {
                    name: "One".into(),
                    ..default()
                },
                HeroRow {
                    name: "Local".into(),
                    me: true,
                    ..default()
                },
                HeroRow {
                    name: "Two".into(),
                    ..default()
                },
            ],
            zone: "elwynn".into(),
            heroic_rank: 0,
        });
        let party = PartyActivity::from_coop(&coop).unwrap();
        assert_eq!(party.friends, "One, Two");
        assert_eq!(party.metadata()["size"], json!([3, 5]));
    }
}
