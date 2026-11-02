//! Selected 0.105.0 WOW_ROGUE_SHOWCASE run branch. Native owners and limits:
//! docs/analysis/showcase-0.105.0.md. This flag is independent of the optional
//! command-line Tester roster row and the ordinary saved character identity.

use super::*;

#[derive(Debug, Default)]
pub(super) struct State {
    pub enabled: bool,
    started: bool,
    world_started: bool,
    next_spawn: f32,
}

#[cfg(test)]
mod tests {
    use super::super::rng_integration::{TerrainFixture, class_run};
    use super::*;

    #[test]
    fn showcase_replaces_the_pool_and_retains_cross_list_duplicates() {
        let mut game = class_run("warrior", 0);
        let before = game.abilities.len();
        game.set_showcase(false);
        assert_eq!(game.abilities.len(), before);
        game.set_showcase(true);
        assert_eq!(
            game.abilities.len(),
            game.class.pool.len() + EXTRA_ABILITIES.len()
        );
        assert_eq!(
            game.abilities
                .iter()
                .filter(|row| row.definition.key == "whirlwind")
                .count(),
            2
        );
        assert!(
            game.abilities
                .iter()
                .all(|row| row.rank == 1 && row.remaining == 0.5)
        );
    }

    #[test]
    fn showcase_tick_clears_only_pending_levels_and_restores_health() {
        let mut game = class_run("priest", 0);
        game.set_showcase(true);
        game.showcase.next_spawn = f32::INFINITY;
        game.pending_levels = 7;
        game.level = 8;
        game.xp = 3;
        game.execution.vitals.health = 1.0;
        let player = game.zone.center.into();
        game.tick_showcase(player, [0.0; 2], &mut TerrainFixture);
        assert_eq!((game.level, game.xp, game.pending_levels), (8, 3, 0));
        assert_eq!(game.health(), game.max_health());
    }

    #[test]
    fn showcase_batches_once_at_the_deadline_without_catching_up() {
        let mut game = class_run("priest", 0);
        game.set_showcase(true);
        let player = game.zone.center.into();
        game.tick_showcase(player, [0.0; 2], &mut TerrainFixture);
        let count = game.zone.enemies.len();
        assert_eq!(game.actors.len(), count);
        assert_eq!(game.showcase.next_spawn, 12.0);
        game.clock = 11.5;
        game.tick_showcase(player, [0.0; 2], &mut TerrainFixture);
        assert_eq!(game.actors.len(), count);
        game.clock = 40.0;
        game.tick_showcase(player, [0.0; 2], &mut TerrainFixture);
        assert_eq!(game.actors.len(), count * 2);
        assert_eq!(game.showcase.next_spawn, 52.0);
    }

    #[test]
    fn showcase_damage_has_no_absorption_meter_or_reactive_side_effects() {
        let mut game = class_run("priest", 0);
        game.set_showcase(true);
        game.execution.vitals.absorb = 25.0;
        let health = game.health();
        let player = game.zone.center.into();
        game.events.clear();
        game.damage_player(1_000_000.0, true, 10, player, 0.0, &mut TerrainFixture);
        assert_eq!(game.health(), health);
        assert_eq!(game.execution.vitals.absorb, 25.0);
        assert_eq!(game.taken_total(), 0.0);
        assert!(!game.dead);
        assert!(game.events.is_empty());
    }
}

///1458e5d80 scans every class/tree/talent, collecting unique variant26 keys
/// in native order. Begin appends them without deduplicating against the class
/// pool. Keeping that second list separate preserves intentional duplicates.
const EXTRA_ABILITIES: &[&str] = &[
    "whirlwind",
    "holy_wrath",
    "explosive_trap",
    "sinister_strike",
    "gouge",
    "penance",
    "holy_nova",
    "chain_lightning",
    "searing_totem",
    "frost_nova",
    "rain_of_fire",
    "starfire",
    "swipe",
    "rejuvenation",
];

/// Original precomputed f32 coordinates, rather than fresh host trigonometry.
/// Each point uses the current player's XY and current player Z before the
/// shared pickup creator performs its own placement/identity work.
const PICKUP_OFFSETS: [[f32; 2]; 9] = [
    [25.0, 0.0],
    [f32::from_bits(0x418b_5762), f32::from_bits(0x418f_78a2)],
    [f32::from_bits(0xbf3a_e089), f32::from_bits(0x41c7_ea2b)],
    [f32::from_bits(0xc193_7a90), f32::from_bits(0x4187_17b6)],
    [f32::from_bits(0xc1c7_a8b1), f32::from_bits(0xbfba_cc23)],
    [f32::from_bits(0xc182_ba8e), f32::from_bits(0xc197_5c4a)],
    [f32::from_bits(0x400b_ffa9), f32::from_bits(0xc1c7_3ba1)],
    [f32::from_bits(0x419b_1cf8), f32::from_bits(0xc17c_81b6)],
    [f32::from_bits(0x41c6_a311), f32::from_bits(0x403a_7a98)],
];

impl Mechanics {
    /// Call after the entry equipment/talent compositor, before the first
    /// gameplay tick. Native145917d45 replaces learned rows with every class
    /// pool entry, then appends the global variant26 list; rank remains one.
    pub fn set_showcase(&mut self, enabled: bool) {
        self.showcase.enabled = enabled;
        self.chest_state.system.extra_pickup_mode = enabled;
        if !enabled {
            return;
        }
        self.abilities = self
            .class
            .pool
            .iter()
            .copied()
            .chain(EXTRA_ABILITIES.iter().copied())
            .map(|key| {
                let definition = AbilityDefinition::by_key(key)
                    .expect("current showcase definition has a connected source owner");
                let mut instance = RuntimeInstance::learned(definition);
                self.effect_state
                    .equipped
                    .spell_modifiers(definition)
                    .apply(&mut instance);
                instance
            })
            .collect();
    }

    pub fn is_showcase(&self) -> bool {
        self.showcase.enabled
    }

    pub(super) fn begin_showcase(
        &mut self,
        player: Position,
        velocity: [f32; 2],
        world: &mut impl RunWorld,
    ) {
        if !self.showcase.enabled || self.showcase.started {
            return;
        }
        self.showcase.started = true;
        self.spawn_showcase_bosses(player, velocity, world);
    }

    /// Shared Begin tail145919894..145919949 follows the pet producers and
    /// omitted lair branch: four ordinary enemy0 rows, then two caches, before
    /// the magnet schedule and boundary object constructors consume their RNG.
    pub(super) fn finish_showcase_entry(
        &mut self,
        player: Position,
        velocity: [f32; 2],
        world: &mut impl RunWorld,
    ) {
        if !self.showcase.enabled || self.showcase.world_started {
            return;
        }
        self.showcase.world_started = true;
        let mut spawn = SpawnAdapter {
            party_health_multiplier: self.party_health_factors()[0],
            zone: self.zone,
            rules: self.rules,
            phase: self.boss_state.phase(),
            endless_started_at: self.boss_state.endless_started_at(),
            now: self.clock,
            run_level: self.level,
            player,
            velocity,
            actors: &mut self.actors,
            live_bosses: self.bosses.iter().filter(|row| !row.actor.dead).count()
                + self
                    .boss_state
                    .wards
                    .actors
                    .iter()
                    .filter(|row| !row.actor.dead)
                    .count(),
            counter: &mut self.counter,
            world,
            events: &mut self.events,
        };
        for _ in 0..4 {
            spawn.create(0, None, &mut self.rng);
        }
        self.tick_chests(player, velocity, world);
    }

    ///145901e36..1459021ba: one batch on an admitted tick at/after the
    /// deadline, then now+12, with no catch-up loop for overshoot. The ordinary
    /// world scheduler still has its own independent timers.
    pub(super) fn tick_showcase(
        &mut self,
        player: Position,
        velocity: [f32; 2],
        world: &mut impl RunWorld,
    ) {
        if !self.showcase.enabled {
            return;
        }
        self.execution.vitals.health = self.execution.vitals.maximum_health;
        // Game+9f4 is the pending level-choice count; raw XP and level at
        // Game+4dc/+4d8 continue to advance through the ordinary XP owner.
        self.pending_levels = 0;
        if !(self.clock >= self.showcase.next_spawn) {
            return;
        }
        self.showcase.next_spawn = self.clock + 12.0;
        let count = self.zone.enemies.len();
        let mut spawn = SpawnAdapter {
            party_health_multiplier: self.party_health_factors()[0],
            zone: self.zone,
            rules: self.rules,
            phase: self.boss_state.phase(),
            endless_started_at: self.boss_state.endless_started_at(),
            now: self.clock,
            run_level: self.level,
            player,
            velocity,
            actors: &mut self.actors,
            live_bosses: self.bosses.iter().filter(|row| !row.actor.dead).count()
                + self
                    .boss_state
                    .wards
                    .actors
                    .iter()
                    .filter(|row| !row.actor.dead)
                    .count(),
            counter: &mut self.counter,
            world,
            events: &mut self.events,
        };
        for index in 0..count {
            let angle = (index as f32 / count as f32) * f32::from_bits(0x40c9_0fdb);
            let xy = [player.x + angle.cos() * 14.0, player.y + angle.sin() * 14.0];
            let z = spawn
                .world
                .height(xy)
                .or_else(|| spawn.world.secondary_height(xy))
                .unwrap_or_else(|| Terrain::fallback_height(spawn.world));
            spawn.create(
                index,
                Some(Position {
                    x: xy[0],
                    y: xy[1],
                    z,
                }),
                &mut self.rng,
            );
        }
        for (index, [x, y]) in PICKUP_OFFSETS.into_iter().enumerate() {
            let position = treasure_chests::Position::new(player.x + x, player.y + y, player.z);
            let drop = match index {
                0 => PickupDrop::Experience {
                    amount: 1,
                    position,
                },
                1 => PickupDrop::Experience {
                    amount: 5,
                    position,
                },
                2 => PickupDrop::Experience {
                    amount: 30,
                    position,
                },
                3 => PickupDrop::Gold {
                    amount: 1,
                    position,
                },
                4 => PickupDrop::Cache { position },
                5 => PickupDrop::Rune {
                    rune: azeroth_survivors_re::run_pickups::Rune::Speed,
                    position,
                },
                6 => PickupDrop::Rune {
                    rune: azeroth_survivors_re::run_pickups::Rune::Berserking,
                    position,
                },
                7 => PickupDrop::Rune {
                    rune: azeroth_survivors_re::run_pickups::Rune::Restoration,
                    position,
                },
                _ => PickupDrop::Magnet { position },
            };
            if matches!(drop, PickupDrop::Rune { .. } | PickupDrop::Magnet { .. }) {
                pickup_effects::create(
                    drop,
                    &mut self.pickups,
                    &mut self.counter,
                    &mut self.rng,
                    world,
                    self.zone,
                    self.clock,
                    &mut self.events,
                );
            } else {
                LootAdapter {
                    pickups: &mut self.pickups,
                    counter: self.counter.clone(),
                    now: self.clock,
                    world,
                    zone: self.zone,
                    events: &mut self.events,
                }
                .create_pickup_with_rng(drop, &mut self.rng);
            }
        }
    }
}
