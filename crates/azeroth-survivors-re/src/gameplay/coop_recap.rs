//! 0.139.2 publishes downed and final defeat through owner-private EventBytes.

use super::{ClientId, CoopRuntime, LifecyclePacket, Mechanics, NativeHero, NativeMessage};
use crate::{
    coop_directory::{display_class, display_race, display_zone},
    gameplay::death_recap::DeathRecap,
    localization::Localization,
};
use serde::Serialize;

const EVENT_LIMIT: usize = 65_536;

#[derive(Clone, Copy, Serialize)]
#[serde(untagged)]
enum RecapObject<'a> {
    Captured(&'a DeathRecap),
    Empty {},
}

#[derive(Serialize)]
#[serde(tag = "type", rename_all = "lowercase")]
enum Event<'a> {
    Downed {
        left: bool,
        recap: RecapObject<'a>,
    },
    Defeat {
        time: f32,
        level: u32,
        kills: u32,
        elites: u32,
        guardians: u32,
        bosses: u32,
        damage: f64,
        taken: f64,
        gold: u32,
        chests: u32,
        class: String,
        hero: &'a str,
        race: String,
        bg: String,
        left: bool,
        recap: RecapObject<'a>,
    },
}

impl Event<'_> {
    fn send(self, runtime: &mut CoopRuntime, client: ClientId) -> bool {
        serde_json::to_vec(&self).is_ok_and(|payload| {
            payload.len() <= EVENT_LIMIT
                && runtime.send(
                    Some(client),
                    NativeMessage::Lifecycle(LifecyclePacket::EventBytes(payload)),
                )
        })
    }
}

#[derive(Default)]
pub(super) struct Published {
    fall: Option<(u64, u64)>,
    downed: bool,
    defeat: bool,
}

impl Published {
    pub(super) fn publish(
        &mut self,
        runtime: &mut CoopRuntime,
        client: ClientId,
        hero: &NativeHero,
        game: &Mechanics,
        locale: &Localization,
    ) {
        if !game.dead || game.completed {
            return;
        }
        let fall = Some((hero.guid, game.death_recap_generation()));
        if self.fall != fall {
            *self = Self {
                fall,
                ..Default::default()
            };
        }
        let left = game.abandoned();
        let recap = game
            .death_recap()
            .filter(|_| !left)
            .map_or(RecapObject::Empty {}, RecapObject::Captured);
        if !self.downed {
            self.downed = Event::Downed { left, recap }.send(runtime, client);
            if !self.downed {
                return;
            }
        }
        if !self.defeat && game.party_terminal_phase() == Some(4) {
            let finite = |value: f64| if value.is_finite() { value } else { 0.0 };
            let name = String::from_utf8_lossy(&hero.name);
            self.defeat = Event::Defeat {
                time: game.clock,
                level: game.level,
                kills: game.kills,
                elites: game.elite_kills(),
                guardians: game.guardian_kills(),
                bosses: game.boss_kills(),
                damage: finite(game.effective_damage()),
                taken: finite(game.taken_total()),
                gold: game.gold_earned,
                chests: game.caches_bought(),
                class: display_class(locale, hero.class),
                hero: &name,
                race: display_race(locale, hero.race),
                bg: display_zone(locale, game.zone.key),
                left,
                recap,
            }
            .send(runtime, client);
        }
    }
}

pub(super) fn receive(recap: &mut Option<DeathRecap>, bytes: &[u8]) {
    if bytes.len() > EVENT_LIMIT {
        return;
    }
    if bytes.starts_with(br#"{"type":"defeat""#) {
        #[derive(serde::Deserialize)]
        struct Defeat {
            left: bool,
            recap: serde_json::Value,
        }
        if let Ok(event) = serde_json::from_slice::<Defeat>(bytes) {
            *recap = (!event.left)
                .then(|| serde_json::from_value(event.recap).ok())
                .flatten();
        }
    } else if (bytes.starts_with(br#"{"type":"revived""#)
        || bytes.starts_with(br#"{"type":"victory""#))
        && serde_json::from_slice::<serde_json::Value>(bytes).is_ok()
    {
        *recap = None;
    }
}
