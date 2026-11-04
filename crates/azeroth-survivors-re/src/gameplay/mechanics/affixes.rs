//! 0.121.0 Heroic affixes. Current native owners and byte receipts are in
//! docs/analysis/heroic-affixes-0.121.0.md. The 0.123.0 Sanguine recipient
//! delta is in docs/analysis/sanguine-recipients-0.123.0.md; parity is unverified.
use super::*;
use std::collections::HashMap;

#[derive(Clone, Copy, Debug)]
pub(super) struct Pool {
    guid: u64,
    marker: u32,
    position: Position,
    expires: f32,
    next_tick: f32,
}

#[derive(Clone, Copy, Debug)]
pub(super) struct Bolstered {
    stacks: u8,
    scale: f32,
}

#[derive(Debug, Default)]
pub(super) struct State {
    active: Vec<u8>,
    rank: u8,
    bolstered: HashMap<u64, Bolstered>,
    pools: Vec<Pool>,
    next_orb: f32,
}

impl State {
    pub(super) fn retire(&mut self, guid: u64) {
        self.bolstered.remove(&guid);
    }
}

impl Mechanics {
    /// The constructor's selector is zone ordinal + seven times config+19c.
    /// The caller supplies the recovered shared discriminator, never local RNG.
    pub fn configure_heroic_affixes(&mut self, rank: u8, week_discriminator: u32) {
        let selector =
            azeroth_survivors_re::heroic::zone_selector(self.zone.key, week_discriminator);
        self.affixes.active = azeroth_survivors_re::heroic::affix_ids(rank, selector);
        self.affixes.rank = rank;
    }

    pub fn active_affix_ids(&self) -> &[u8] {
        &self.affixes.active
    }

    ///145c291e9..145c295cc: the first deadline arms forty seconds from
    /// the first admitted affix tick; subsequent spawns arm now+fifteen.
    pub(super) fn tick_affix_orbs(&mut self, player: Position, world: &mut impl RunWorld) {
        if !self.affixes.active.contains(&2) {
            return;
        }
        let now = self.clock;
        if self.affixes.next_orb == 0.0 {
            self.affixes.next_orb = now + 40.0;
            return;
        }
        if !(now >= self.affixes.next_orb) {
            return;
        }
        self.affixes.next_orb = now + 15.0;
        let Some(baseline) = self.zone.enemies.first() else {
            return;
        };
        let angle = self.rng.range_f32(0.0, std::f32::consts::TAU);
        let radius = self.rng.range_f32(6.0, 14.0);
        let xy = [
            radius * angle.cos() + player.x,
            radius * angle.sin() + player.y,
        ];
        let z = world
            .height(xy)
            .or_else(|| world.secondary_height(xy))
            .unwrap_or_else(|| Terrain::fallback_height(world));
        let maximum =
            scaling::health_polynomial(now / 60.0, self.rules.difficulty * self.zone.scalar_e0, 0)
                * (baseline.base_hp * 4.95);
        let maximum = maximum * azeroth_survivors_re::heroic::health_multiplier(self.affixes.rank);
        self.boss_state.wards.spawn(
            azeroth_survivors_re::bosses::raid_wards::Spawn {
                parent: 0,
                player_guid: self.player_guid,
                template: 12,
                config: [3, 0.4_f32.to_bits(), 0, 0],
                position: Position {
                    x: xy[0],
                    y: xy[1],
                    z,
                },
                maximum_health: maximum + maximum,
                lifetime: 8.0,
            },
            now,
            self.level,
            baseline,
            player,
            &mut self.counter,
        );
        self.events.push(RunEvent::Notification(
            azeroth_survivors_re::loot_rewards::prose::Text::Template {
                key: "An Explosive Orb appears! Destroy it before it bursts!".into(),
                values: Vec::new(),
            },
        ));
    }

    pub(super) fn bolstered_scale(&self, guid: u64) -> Option<f32> {
        self.affixes.bolstered.get(&guid).map(|row| row.scale)
    }

    /// Native pool collection precedes ordinary spawning. Expiry wins over a
    /// due heal; each surviving pool advances its stored deadline by one second.
    pub(super) fn tick_affix_pools(&mut self) {
        if self.affixes.active.is_empty() {
            return;
        }
        let now = self.clock;
        for pool in &mut self.affixes.pools {
            if now >= pool.expires || !(now >= pool.next_tick) {
                continue;
            }
            pool.next_tick += 1.0;
            // Current145ca02b0 admits only living horde records: dead+b0=0,
            // ward+d0 absent, boss+18 absent and guardian+58 absent. The
            // adapter stores bosses/wards separately and guardians in actors.
            for row in self.actors.iter_mut().filter(|row| {
                !row.actor.dead && !self.guardian_state.contains(row.guid)
            }) {
                if in_radius(row.actor.movement.position_at(now), pool.position, 36.0) {
                    heal_pool(
                        row.guid,
                        &mut row.health,
                        row.maximum_health,
                        &mut self.events,
                    );
                }
            }
        }
        // Native removes expired indices in reverse after all due heals.
        for index in (0..self.affixes.pools.len()).rev() {
            if !(now >= self.affixes.pools[index].expires) {
                continue;
            }
            let pool = self.affixes.pools.remove(index);
            if pool.guid != 0 {
                self.events.push(RunEvent::RemoveObject(pool.guid));
            }
            self.events.push(RunEvent::RaidMarker(serde_json::json!({
                "type": "hzend", "id": pool.marker,
            })));
        }
    }
}

fn in_radius(left: Position, right: Position, radius_squared: f32) -> bool {
    let x = left.x - right.x;
    let y = left.y - right.y;
    x * x + y * y <= radius_squared
}

fn heal_pool(guid: u64, health: &mut f32, maximum: f32, events: &mut Vec<RunEvent>) {
    let requested = maximum * 0.1;
    let missing = maximum - *health;
    let amount = if missing.is_nan() || requested < missing {
        requested
    } else {
        missing
    };
    let amount = if amount > 0.0 { amount } else { 0.0 };
    if !(amount > 0.0) {
        return;
    }
    *health += amount;
    events.push(RunEvent::ActorFields {
        target: guid,
        fields: vec![(22, health.ceil() as u32)],
    });
}

impl<W: RunWorld> CombatAdapter<'_, W> {
    ///145c17235: only ordinary/elite deaths enter this lane; bosses, guardians
    /// and ward actors have their own native optional owner fields.
    pub(super) fn affix_death(&mut self, guid: u64, position: Position, elite: bool) {
        if self.affixes.active.is_empty() {
            return;
        }
        if self.affixes.active.contains(&0) {
            for row in self.actors.iter_mut().filter(|row| {
                row.guid != guid && !row.actor.dead && !self.guardian_state.contains(row.guid)
            }) {
                if !in_radius(row.actor.movement.position_at(self.now), position, 144.0) {
                    continue;
                }
                let state = self.affixes.bolstered.entry(row.guid).or_insert(Bolstered {
                    stacks: 0,
                    scale: row.definition.scale,
                });
                if state.stacks > 9 {
                    continue;
                }
                let old = f32::from(state.stacks);
                let ratio = ((old + 1.0) * 0.2 + 1.0) / (old * 0.2 + 1.0);
                state.stacks += 1;
                row.health *= ratio;
                row.maximum_health *= ratio;
                row.actor.damage *= ratio;
                state.scale *= 1.05;
                self.events.push(RunEvent::ActorFields {
                    target: row.guid,
                    fields: vec![
                        (22, row.health.ceil() as u32),
                        (28, row.maximum_health.ceil() as u32),
                        (4, state.scale.to_bits()),
                    ],
                });
            }
        }
        if elite && self.affixes.active.contains(&1) {
            let marker = self.boss_state.allocate_affix_marker();
            let height = self
                .world
                .height([position.x, position.y])
                .or_else(|| self.world.secondary_height([position.x, position.y]))
                .unwrap_or_else(|| Terrain::fallback_height(self.world));
            let position = Position {
                z: height,
                ..position
            };
            let object = azeroth_survivors_re::bosses::abilities::ground_object(
                &mut self.object_counter,
                self.player_guid,
                26573,
                6.0,
                position,
            );
            let pool = Pool {
                guid: object.guid,
                marker,
                position,
                expires: self.now + 15.0,
                next_tick: self.now + 1.0,
            };
            self.events.push(RunEvent::Ground(object));
            self.affixes.pools.push(pool);
            self.events.push(RunEvent::RaidMarker(serde_json::json!({
                "type":"hz", "id":pool.marker, "kind":"mend", "x":position.x,
                "y":position.y, "z":position.z, "a":0, "shape":"circle", "r":6.0,
                "t0":self.now, "t1":pool.expires, "t":self.now,
            })));
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use super::super::rng_integration::{class_run, fixture_enemies, TerrainFixture};

    fn stationary(position: Position) -> ai::Movement {
        ai::Movement { from: position, to: position, started_at: 0.0, duration: 0.0 }
    }

    #[test]
    fn sanguine_heals_only_living_horde_including_elites_at_the_radius_boundary() {
        let mut game = class_run("warrior", 1);
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[0.0, 6.0, 0.0, 6.01], &mut terrain);
        game.actors[1].definition = game.zone.enemies.iter()
            .find(|row| row.flag_4c != 0).unwrap();
        let horde = game.actors.iter().map(|row| row.guid).collect::<Vec<_>>();
        game.actors[2].actor.dead = true;
        game.clock = 20.0;
        game.spawn_due_guardians(&mut terrain);
        assert!(game.actors.iter().any(|row| game.guardian_state.contains(row.guid)));
        let center: Position = game.zone.center.into();
        for row in &mut game.actors {
            row.health = 40.0;
            row.maximum_health = 100.0;
            if game.guardian_state.contains(row.guid) {
                row.actor.movement = stationary(center);
            }
        }
        let schedule = azeroth_survivors_re::bosses::catalog::ZONES.iter()
            .find(|zone| zone.key == game.zone.key).unwrap();
        game.clock = schedule.bosses[0].time_minutes * 60.0;
        game.spawn_due_bosses(center, [0.0; 2], &mut terrain);
        assert!(!game.bosses.is_empty());
        for row in &mut game.bosses {
            row.health = 40.0;
            row.maximum_health = 100.0;
            row.actor.movement = stationary(center);
        }
        game.boss_state.wards.spawn(
            azeroth_survivors_re::bosses::raid_wards::Spawn {
                parent: 0, player_guid: game.player_guid, template: 3,
                config: [1, 0.1_f32.to_bits(), 0, 0], position: center,
                maximum_health: 100.0, lifetime: 100.0,
            },
            20.0, game.level, &game.zone.enemies[0], center, &mut game.counter,
        );
        game.boss_state.wards.actors[0].health = 40.0;
        game.clock = 21.0;
        game.affixes.active = vec![1];
        game.affixes.pools.push(Pool {
            guid: 0, marker: 1, position: center, expires: 36.0, next_tick: 21.0,
        });
        game.events.clear();
        game.tick_affix_pools();
        for row in &game.actors {
            let expected = if row.guid == horde[0] || row.guid == horde[1] { 50.0 } else { 40.0 };
            assert_eq!(row.health, expected);
        }
        assert!(game.bosses.iter().all(|row| row.health == 40.0));
        assert_eq!(game.boss_state.wards.actors[0].health, 40.0);
        let updated = game.events.iter().filter_map(|event| match event {
            RunEvent::ActorFields { target, fields } if fields.iter().any(|row| row.0 == 22) => Some(*target),
            _ => None,
        }).collect::<Vec<_>>();
        assert_eq!(updated, horde[..2]);
    }

    #[test]
    fn sanguine_keeps_expiry_priority_deadline_cadence_and_missing_health_cap() {
        let mut game = class_run("warrior", 1);
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[0.0], &mut terrain);
        game.actors[0].health = 95.0;
        game.actors[0].maximum_health = 100.0;
        game.affixes.active = vec![1];
        game.affixes.pools.push(Pool {
            guid: 0, marker: 1, position: game.zone.center.into(),
            expires: 15.0, next_tick: 1.0,
        });
        game.clock = 10.0;
        game.tick_affix_pools();
        assert_eq!(game.actors[0].health, 100.0);
        assert_eq!(game.affixes.pools[0].next_tick, 2.0);
        game.actors[0].health = 50.0;
        game.clock = 15.0;
        game.tick_affix_pools();
        assert_eq!(game.actors[0].health, 50.0);
        assert!(game.affixes.pools.is_empty());
    }
}
