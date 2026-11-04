//! Live selected-target loot-companion adapter, including Sapphiron9613.
use super::*;
use azeroth_survivors_re::run_effects::{loot_companions as native, pet_tick::PetMotion};

#[derive(Debug, Default)]
pub(super) struct State {
    pub config: native::Config,
    started: bool,
    pub(super) actors: Vec<native::Actor>,
    gold_fraction: f32,
}

impl Mechanics {
    pub fn set_loot_companions(&mut self, config: native::Config) {
        if !self.loot_companion_state.started {
            self.loot_companion_state.config = config;
        }
    }

    pub fn companion_reserved(&self, guid: u64) -> bool {
        self.loot_companion_state
            .actors
            .iter()
            .any(|actor| actor.phase == native::Phase::Fetching(guid))
    }

    pub fn loot_companion_names(&self) -> impl Iterator<Item = (u64, &str)> {
        self.loot_companion_state
            .actors
            .iter()
            .map(|actor| (actor.guid, actor.slot.definition.name.as_str()))
    }

    pub(super) fn begin_loot_companions(
        &mut self,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        let hero_speed = self.movement_multiplier();
        let state = &mut self.loot_companion_state;
        if state.started {
            return;
        }
        state.started = true;
        for (index, slot) in state.config.slots.iter().copied().enumerate() {
            let angle = native::angle(index);
            let xy = [
                player.x + (facing + angle).cos() * 2.0,
                player.y + (facing + angle).sin() * 2.0,
            ];
            let z = world
                .height(xy)
                .or_else(|| world.secondary_height(xy))
                .unwrap_or_else(|| Terrain::fallback_height(world));
            let position = [xy[0], xy[1], z];
            let guid = azeroth_survivors_re::native_counter::creature_guid(
                slot.definition.creature_id,
                &mut self.counter,
            );
            self.events.push(RunEvent::LootCompanion {
                object: SummonedObject {
                    guid,
                    position: Position::from(position),
                    fields: native::fields(slot.definition, guid),
                },
                run_speed: native::speed(hero_speed, state.config.paws),
            });
            state.actors.push(native::Actor {
                slot,
                guid,
                angle,
                motion: PetMotion::stationary(position, self.clock),
                phase: native::Phase::Idle,
                ready_at: self.clock + 1.0,
                next_update: self.clock,
                departed_at: self.clock,
                inventory: Vec::new(),
            });
        }
    }

    pub(super) fn tick_loot_companions(
        &mut self,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        let mut state = std::mem::take(&mut self.loot_companion_state);
        let context = native::Context {
            now: self.clock,
            hero: [player.x, player.y, player.z],
            facing,
            hero_speed: self.movement_multiplier(),
            pickup_radius: self.stats.pickup_radius,
            leash: state.config.leash,
            paws: state.config.paws,
        };
        for index in 0..state.actors.len() {
            let reserved = state
                .actors
                .iter()
                .filter_map(|actor| match actor.phase {
                    native::Phase::Fetching(guid) => Some(guid),
                    _ => None,
                })
                .collect::<Vec<_>>();
            let mut port = Port {
                game: self,
                world,
                gold_fraction: &mut state.gold_fraction,
            };
            native::tick(&mut state.actors[index], context, &reserved, &mut port);
        }
        self.loot_companion_state = state;
    }
}

struct Port<'a, W> {
    game: &'a mut Mechanics,
    world: &'a mut W,
    gold_fraction: &'a mut f32,
}

fn reward(drop: PickupDrop) -> Option<native::Reward> {
    match drop {
        PickupDrop::Experience { amount, .. } => Some(native::Reward { kind: 0, amount }),
        PickupDrop::Gold { amount, .. } => Some(native::Reward { kind: 1, amount }),
        PickupDrop::Rune { rune, .. } => Some(native::Reward {
            kind: rune as u32,
            amount: 0,
        }),
        _ => None,
    }
}

impl<W: RunWorld> native::World for Port<'_, W> {
    fn pickups(&self) -> Vec<native::Pickup> {
        self.game
            .pickups
            .iter()
            .filter_map(|pickup| {
                Some(native::Pickup {
                    guid: pickup.id,
                    kind: reward(pickup.drop)?.kind,
                    position: [
                        pickup.position().x,
                        pickup.position().y,
                        pickup.position().z,
                    ],
                    idle: pickup.flight.is_none(),
                })
            })
            .collect()
    }
    fn take(&mut self, guid: u64) -> Option<native::Reward> {
        let index = self
            .game
            .pickups
            .iter()
            .position(|row| row.id == guid && row.flight.is_none())?;
        let result = reward(self.game.pickups[index].drop)?;
        self.game.remove_pickup_at(index);
        Some(result)
    }
    fn deliver(&mut self, reward: native::Reward, instinct: u8) {
        match reward.kind {
            0 => self.game.credit_pickup_experience(reward.amount, false),
            1 => {
                let amount = if instinct == 1 {
                    let value = reward.amount as f32 * 1.1 + *self.gold_fraction;
                    let whole = value.floor();
                    *self.gold_fraction = value - whole;
                    whole as u32
                } else {
                    reward.amount
                };
                self.game.credit_pickup_gold(amount);
            }
            3 => self
                .game
                .collect_rune(azeroth_survivors_re::run_pickups::Rune::Speed),
            4 => self
                .game
                .collect_rune(azeroth_survivors_re::run_pickups::Rune::Berserking),
            5 => self
                .game
                .collect_rune(azeroth_survivors_re::run_pickups::Rune::Restoration),
            _ => unreachable!("only recovered live pickup rewards are admitted"),
        }
    }
    fn height(&mut self, xy: [f32; 2]) -> Option<f32> {
        self.world.height(xy)
    }
    fn destination_height(&mut self, xy: [f32; 2]) -> f32 {
        self.world
            .height(xy)
            .or_else(|| self.world.secondary_height(xy))
            .unwrap_or_else(|| Terrain::fallback_height(self.world))
    }
    fn movement(&mut self, guid: u64, motion: PetMotion) {
        self.game.movement_counter = self.game.movement_counter.wrapping_add(1);
        self.game.events.push(RunEvent::PetMove {
            guid,
            start: Position::from(motion.from),
            to: Position::from(motion.to),
            duration: motion.duration,
            serial: self.game.movement_counter,
        });
    }
}

#[cfg(test)]
mod tests {
    use super::super::rng_integration::{TerrainFixture, class_run};
    use super::*;

    #[test]
    fn saved_sapphiron_spawns_once_through_the_live_native_actor_event() {
        let mut game = class_run("mage", 0);
        game.set_loot_companions(native::saved_config(
            ["sapphiron", "squirrel"],
            |key| u8::from(key == "companion"),
            |key| key == "feat:nou",
        ));
        let mut world = TerrainFixture;
        let player = game.zone.center.into();
        game.begin_loot_companions(player, 0., &mut world);
        game.begin_loot_companions(player, 0., &mut world);
        let created = game
            .events
            .iter()
            .filter_map(|event| match event {
                RunEvent::LootCompanion { object, run_speed } => Some((object, *run_speed)),
                _ => None,
            })
            .collect::<Vec<_>>();
        assert_eq!(created.len(), 1);
        let (object, speed) = created[0];
        assert_eq!((object.guid >> 24) & 0xffffff, 9613);
        assert_eq!(object.guid >> 48, 0xf130);
        let field = |key| object.fields.iter().find(|(id, _)| *id == key).unwrap().1;
        assert_eq!(field(131), 16033);
        assert_eq!(field(4), 0.07f32.to_bits());
        assert_eq!((field(22), field(28), field(34), field(35)), (1, 1, 1, 35));
        assert_eq!(field(46), 0x02000002);
        assert_eq!(speed, 14.);
        assert_eq!(
            game.loot_companion_names().collect::<Vec<_>>(),
            vec![(object.guid, "Sapphiron")]
        );
    }

    #[test]
    fn rune_hound_fetches_within_pickup_stat_and_either_owner_collects_once() {
        use azeroth_survivors_re::run_pickups::Rune;

        for hero_reaches_rune in [false, true] {
            let mut game = class_run("mage", 0);
            game.set_loot_companions(native::saved_config(
                ["squirrel"; 2],
                |key| u8::from(matches!(key, "companion" | "instinct_runes")),
                |_| true,
            ));
            let mut world = TerrainFixture;
            let player: Position = game.zone.center.into();
            game.begin_loot_companions(player, 0., &mut world);
            game.pickups.push(RunPickup {
                id: 7,
                created_at: 0.,
                drop: PickupDrop::Rune {
                    rune: Rune::Speed,
                    position: treasure_chests::Position::new(player.x + 5., player.y, player.z),
                },
                flight: None,
                facing: 0.,
                auxiliary: [None; 2],
            });

            game.clock = 1.;
            game.tick_pickup_collection(player);
            game.tick_loot_companions(player, 0., &mut world);
            assert!(game.companion_reserved(7));

            let player = if hero_reaches_rune {
                Position {
                    x: player.x + 2.,
                    ..player
                }
            } else {
                player
            };
            game.clock = 2.;
            game.tick_pickup_collection(player);
            game.tick_loot_companions(player, 0., &mut world);
            assert!(game.pickups.is_empty());
            assert_eq!(
                game.loot_companion_state.actors[0].inventory.len(),
                usize::from(!hero_reaches_rune)
            );

            for time in [3., 4., 5.] {
                game.clock = time;
                game.tick_pickup_collection(player);
                game.tick_loot_companions(player, 0., &mut world);
            }
            let removals = game
                .events
                .iter()
                .filter(|event| matches!(event, RunEvent::RemoveObject(7)));
            assert_eq!(removals.count(), 1);
            let grants = game.events.iter().filter(|event| {
                matches!(event, RunEvent::Spell(cast) if cast.spell_id == Rune::Speed.spell())
            });
            assert_eq!(grants.count(), 1);
        }
    }

    #[test]
    fn live_delivery_keeps_the_shared_fractional_gold_bank_and_run_counter() {
        let mut game = class_run("mage", 0);
        let mut world = TerrainFixture;
        let mut fraction = 0.;
        let before = game.gold;
        let earned = game.gold_earned;
        let published = game
            .events
            .iter()
            .filter(|event| matches!(event, RunEvent::PlayerValues(_)))
            .count();
        {
            let mut port = Port {
                game: &mut game,
                world: &mut world,
                gold_fraction: &mut fraction,
            };
            for _ in 0..10 {
                native::World::deliver(&mut port, native::Reward { kind: 1, amount: 1 }, 1);
            }
        }
        assert_eq!(game.gold, before + 11);
        assert_eq!(game.gold_earned, earned + 11);
        assert!(fraction >= 0. && fraction < 1.);
        assert_eq!(
            game.events
                .iter()
                .filter(|event| matches!(event, RunEvent::PlayerValues(_)))
                .count(),
            published + 10
        );
    }
}
