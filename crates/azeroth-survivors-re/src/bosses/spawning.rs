//! Primary boss schedule revalidated against0.112.0 tick145904d79/14590649b.
//! See docs/analysis/raid-boss-lifecycle-0.112.0.md; older offsets below retain
//! the historical recovery provenance where explicitly versioned.
//! Active-run and ordinary-spawn suppression gates belong to the owning tick.

use super::catalog::{BossDefinition, ZoneDefinition};
use super::NativeRng;

pub const PRIMARY_COUNT: usize = 5;
pub const ENDLESS_INTERVAL_SECONDS: f32 = 300.0;

pub fn primary_minutes(minutes: f32, hyper: bool) -> f32 {
    if hyper { minutes * 0.5 } else { minutes }
}

pub fn final_boss_minutes(zone_key: &str, hyper: bool) -> Option<f32> {
    ZoneDefinition::by_key(zone_key)?
        .bosses.get(PRIMARY_COUNT - 1)
        .map(|boss| primary_minutes(boss.time_minutes, hyper))
}

pub fn endless_interval_seconds(hyper: bool) -> f32 {
    if hyper { 150.0 } else { ENDLESS_INTERVAL_SECONDS }
}

pub fn hyper_half_minutes(zone_key: &str, hyper: bool) -> Option<f32> {
    hyper.then(|| final_boss_minutes(zone_key, true).unwrap_or(10.0))
}

/// Native0.143.0 doubles mob progression up to the shortened final-boss
/// deadline, then keeps that lead while advancing at one minute per minute.
pub fn effective_enemy_minutes(clock_seconds: f32, hyper_half_minutes: Option<f32>) -> f32 {
    let minutes = clock_seconds / 60.0;
    let Some(half) = hyper_half_minutes else { return minutes; };
    let accelerated = minutes.min(half);
    accelerated + accelerated + (minutes - half).max(0.0)
}

/// Current0.112.0 creator14593bc2e/14593bcb1 queues SMSG_PLAY_SOUND(8174),
/// then the definition's +0x50 voice kit only when it is nonzero. Both are
/// ordinary 2D SoundEntries kits; the client owns MPQ resolution and playback.
pub fn arrival_sounds(definition: &BossDefinition) -> impl Iterator<Item = u32> {
    [8174, definition.raw_50].into_iter().filter(|&id| id != 0)
}

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Scheduler {
    /// Current Game+0x9e8, initialized to zero in the fresh Game constructor.
    pub next_primary: usize,
    /// Current Game+0xaa8, initialized to zero, consulted after all five entries.
    pub endless_deadline: f32,
}

pub trait SpawnPort {
    fn has_living_primary_boss(&self) -> bool;

    /// Bind to the actual boss constructor. Creation uses the same run RNG.
    fn spawn_boss(&mut self, index: usize, definition: &'static BossDefinition, rng: &mut NativeRng);
    fn spawn_boss_with_health_factor(&mut self, index: usize, definition: &'static BossDefinition,
        rng: &mut NativeRng, health_factor: f32) {
        assert_eq!(health_factor, 1.0, "Heroic Council requires a scaled boss spawn port");
        self.spawn_boss(index, definition, rng);
    }
}

/// Exact native five-entry multiply/reject draw. Accepted index is the high
/// product word; native rejects when low-product bits63..61 exceed four.
pub fn endless_index(rng: &mut NativeRng) -> usize {
    loop {
        let product = u128::from(rng.next_u64()) * 5;
        if (product as u64) >> 61 <= 4 {
            return (product >> 64) as usize;
        }
    }
}

impl Scheduler {
    /// At most one scheduled or endless entry per admitted active tick.
    /// Heroic V's final scheduled entry also creates its selected Council ally.
    /// Current Game+0xadb suppresses the schedule along with ordinary spawns.
    /// The primary index advances before creation and is never rolled back.
    pub fn tick(&mut self, zone: &ZoneDefinition, clock_seconds: f32, endless: bool,
                suppressed: bool, rng: &mut NativeRng, port: &mut impl SpawnPort) -> Option<usize> {
        self.tick_for_rank(zone, clock_seconds, endless, suppressed, rng, port, 0, false)
    }

    pub fn tick_for_rank(&mut self, zone: &ZoneDefinition, clock_seconds: f32, endless: bool,
        suppressed: bool, rng: &mut NativeRng, port: &mut impl SpawnPort, heroic_rank: u8, hyper: bool) -> Option<usize> {
        if suppressed { return None; }
        if self.next_primary < PRIMARY_COUNT {
            let index = self.next_primary;
            // 0.140.0 scans the primary actor population for Scholomance only.
            if zone.key == "scholomance" && port.has_living_primary_boss() {
                return None;
            }
            if !(clock_seconds / 60.0 >= primary_minutes(zone.bosses[index].time_minutes, hyper)) {
                return None;
            }
            self.next_primary += 1;
            port.spawn_boss(index, &zone.bosses[index], rng);
            if heroic_rank >= 5 && zone.bosses[index].flag_54 & 1 != 0 {
                let friend = crate::enemies::waves::uniform_index(4, rng);
                port.spawn_boss_with_health_factor(friend, &zone.bosses[friend], rng, 0.6);
            }
            Some(index)
        } else if endless && clock_seconds >= self.endless_deadline {
            let index = endless_index(rng);
            port.spawn_boss(index, &zone.bosses[index], rng);
            self.endless_deadline = clock_seconds + endless_interval_seconds(hyper);
            Some(index)
        } else { None }
    }
}

/// Current Begin14590d7a0 creates all five bosses when raw Game+0xad8 is set.
/// This is the same run flag that separately suppresses guardian lair respawn.
/// Its fresh default is zero. This branch does not advance the schedule index.
pub fn startup_bosses(zone: &ZoneDefinition, raw_958: u8, rng: &mut NativeRng,
                      port: &mut impl SpawnPort) {
    if raw_958 != 0 {
        for (index, definition) in zone.bosses.iter().take(PRIMARY_COUNT).enumerate() {
            port.spawn_boss(index, definition, rng);
        }
    }
}
