//! Current 0.109.0 activity builder/publisher (14006b460/14007b510).
//! Native wire/worker and platform limits live in discord/transport.rs.
mod transport;

use crate::{
    catalog::MenuCatalog,
    localization::Localization,
    menu_state::MenuState,
    options::{OptionsSet, OptionsState},
};
use bevy::prelude::*;
use serde_json::{json, Value};
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
        return Some(json!({
            "details": locale.label("Choosing a hero"),
            "state": translate(locale, "{hero} the {race} {class}", &[("hero",hero.into()),("race",race.name.clone()),("class",class.name.clone())]),
            "assets": {"large_image":"logo", "large_text":"Azeroth Survivors",
                "small_image":format!("https://wow.zamimg.com/images/wow/icons/large/classicon_{}.jpg",class.key),
                "small_text":translate(locale,"Next stop: {zone}",&[("zone",zone.name.clone())])},
            "buttons":button,
        }));
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
    let bg = text(&entry["bg"]);
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
    let mut assets = json!({"large_image":"logo","large_text":if subtitle.is_empty() {bg.into()} else {format!("{bg}: {subtitle}")}});
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
    fn activity_matches_current_native_english_vectors() {
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
                &snapshot,
                &catalog,
                &locale,
                input.get("epoch").and_then(Value::as_i64).unwrap_or(1000),
                &mut start,
            );
            assert_eq!(
                actual.unwrap_or(Value::Null),
                case["activity"],
                "{}",
                case["name"]
            );
            assert_eq!(
                serde_json::to_value(start).unwrap(),
                case["start"],
                "{}",
                case["name"]
            );
        }
    }
}
