//! The recovered cache field over the run's canonical shared pickup vector.
//! A temporary semantic view carries native lifecycle operations; mutations
//! return to the same RunPickup owner used by drops, collection and rendering.

use std::collections::{HashMap, HashSet};

use super::*;
use azeroth_survivors_re::treasure_chests as native;

#[derive(Debug, Default)]
pub(super) struct ChestState {
    pub(super) system: native::ChestSystem,
    initialized: bool,
    created: HashMap<u64, f32>,
    facing: HashMap<u64, f32>,
    choice_requested: bool,
}

impl ChestState {
    pub(super) fn for_rank(heroic_rank: u8) -> Self {
        Self { system: native::ChestSystem::for_rank(heroic_rank), ..Self::default() }
    }

    pub(super) fn swap_world(&mut self, other: &mut Self) {
        std::mem::swap(&mut self.initialized, &mut other.initialized);
        std::mem::swap(&mut self.created, &mut other.created);
        std::mem::swap(&mut self.facing, &mut other.facing);
    }
}

#[derive(Clone, Copy, Debug)]
pub struct ChestView {
    pub id: u64,
    pub position: Position,
    pub price: u32,
}

impl Mechanics {
    /// The complete recovered pool uses the live compositor, synchronous
    /// generic callbacks, object presentation and actual GO request owner.
    pub fn cache_rewards_available(&self) -> bool {
        true
    }
    pub fn cache_facing(&self, id: u64) -> Option<f32> {
        self.chest_state.facing.get(&id).copied()
    }
    pub fn cache_price(&self) -> u32 {
        if let Some(value) = self.replica_hud().and_then(|hud| hud.get("chestCost")).and_then(serde_json::Value::as_u64) {
            return value.min(u64::from(u32::MAX)) as u32;
        }
        self.chest_state.system.price
    }
    pub fn caches_bought(&self) -> u32 {
        self.replica_state().map_or(self.chest_state.system.bought, |state| state.caches_bought)
    }
    pub fn pending_cache_choices(&self) -> u32 {
        self.chest_state.system.pending_choices
    }
    pub fn set_cache_on_click(&mut self, enabled: bool) {
        self.chest_state.system.cache_on_click = enabled;
    }
    pub fn cache_records(&self) -> Vec<ChestView> {
        self.pickups
            .iter()
            .filter_map(|pickup| match pickup.drop {
                PickupDrop::Cache { position } => Some(ChestView {
                    id: pickup.id,
                    position: Position {
                        x: position.x,
                        y: position.y,
                        z: position.z,
                    },
                    price: self.cache_price(),
                }),
                _ => None,
            })
            .collect()
    }
    pub fn nearest_cache(&self, player: Position) -> Option<ChestView> {
        self.cache_records()
            .into_iter()
            .filter(|cache| {
                let dx = cache.position.x - player.x;
                let dy = cache.position.y - player.y;
                dx * dx + dy * dy <= 100.0
            })
            .min_by(|a, b| {
                let distance = |cache: &ChestView| {
                    (cache.position.x - player.x).powi(2) + (cache.position.y - player.y).powi(2)
                };
                distance(a).total_cmp(&distance(b))
            })
    }
    pub fn click_cache(
        &mut self,
        id: u64,
        player: Position,
        world: &mut impl RunWorld,
    ) -> native::Interaction {
        if !self.cache_rewards_available() {
            return native::Interaction::Ignored;
        }
        if self.dead || self.completed || self.is_paused_for_choice() {
            return native::Interaction::Ignored;
        }
        self.process_chests(player, world, Some(id), false)
    }
    pub(super) fn tick_chests(
        &mut self,
        player: Position,
        _velocity: [f32; 2],
        world: &mut impl RunWorld,
    ) {
        self.process_chests(player, world, None, true);
    }

    fn process_chests(
        &mut self,
        player: Position,
        world: &mut impl RunWorld,
        click: Option<u64>,
        tick: bool,
    ) -> native::Interaction {
        let Some(zone) = native::ZoneDefinition::by_key(self.zone.key) else {
            return native::Interaction::Ignored;
        };
        let rewards_available = self.cache_rewards_available();
        let mut state = std::mem::take(&mut self.chest_state);
        // Death caches already completed the shared native kind2 creator,
        // including identity, cap eviction, height and yaw at the death edge.
        for pickup in &self.pickups {
            if matches!(pickup.drop, PickupDrop::Cache { .. }) {
                state.created.entry(pickup.id).or_insert(pickup.created_at);
                state.facing.entry(pickup.id).or_insert(pickup.facing);
            }
        }
        let mut records: Vec<_> = self.pickups.iter().map(pickup_record).collect();
        let mut spawned = Vec::new();
        let mut clock = native::RunClock {
            elapsed: self.clock,
            state: 1,
        };
        let mut terrain = ChestTerrain(world);
        let mut port = ChestPort {
            counter: &mut self.counter,
            spawned: &mut spawned,
            facing: &mut state.facing,
            choice_requested: &mut state.choice_requested,
            events: &mut self.events,
        };
        let mut field = native::ChestField {
            player: native::Position::new(player.x, player.y, player.z),
            zone,
            terrain: &mut terrain,
            world: &mut port,
            rng: &mut self.rng,
            pickups: &mut records,
        };
        if tick && !state.initialized {
            clock.state = 0;
            state.system.start_run(&mut clock, &mut field);
            state.initialized = true;
        }
        let mut result = native::Interaction::Ignored;
        if tick {
            if let Some(active) = clock.advance(0.0) {
                state.system.timed_attempt(&clock, active, &mut field);
            }
        }
        if rewards_available {
            if let Some(id) = click {
                result = state
                    .system
                    .click(&mut clock, &mut self.gold, id, &mut field);
            } else if tick {
                if let Some(active) = clock.advance(0.0) {
                    state
                        .system
                        .walk(&mut clock, active, &mut self.gold, &mut field);
                }
            }
        }
        drop(field);
        let retained: HashSet<_> = records.iter().map(|pickup| pickup.entity).collect();
        self.pickups.retain(|pickup| retained.contains(&pickup.id));
        for (id, spawn) in spawned {
            if retained.contains(&id) {
                self.pickups.push(RunPickup {
                    id,
                    created_at: self.clock,
                    drop: PickupDrop::Cache {
                        position: spawn.position,
                    },
                    flight: None,
                    facing: state.facing.get(&id).copied().unwrap_or(0.0),
                    auxiliary: [None; 2],
                });
                state.created.insert(id, self.clock);
            }
        }
        state.created.retain(|id, _| retained.contains(id));
        state.facing.retain(|id, _| retained.contains(id));
        self.chest_state = state;
        if self.chest_state.choice_requested {
            self.chest_state.choice_requested = false;
            self.generate_cache_choices();
        }
        result
    }
}

fn pickup_record(pickup: &RunPickup) -> native::Pickup {
    let (kind, position) = match pickup.drop {
        PickupDrop::Experience { position, .. } => (0, position),
        PickupDrop::Gold { position, .. } => (1, position),
        PickupDrop::Cache { position } => (2, position),
        PickupDrop::Rune { rune, position } => (rune as u32, position),
        PickupDrop::Magnet { position } => (6, position),
    };
    native::Pickup {
        kind,
        entity: pickup.id,
        auxiliary_entities: pickup.auxiliary.into_iter().flatten().collect(),
        position,
        created_at: pickup.created_at,
    }
}

/// Run death producers enter the actual kind2 creator synchronously. The
/// later cache scheduler adopts this finished entity; it never allocates again.
pub(super) fn create_death_cache(
    pickups: &mut Vec<RunPickup>,
    counter: &mut dyn NativeCounter,
    world: &mut impl RunWorld,
    zone: &'static ZoneDefinition,
    now: f32,
    position: native::Position,
    rng: &mut NativeRng,
    events: &mut Vec<RunEvent>,
) {
    let mut records = pickups.iter().map(pickup_record).collect::<Vec<_>>();
    let mut spawned = Vec::new();
    let mut facing = HashMap::new();
    let mut choice_requested = false;
    let mut terrain = ChestTerrain(world);
    let mut port = ChestPort {
        counter,
        spawned: &mut spawned,
        facing: &mut facing,
        choice_requested: &mut choice_requested,
        events,
    };
    let mut field = native::ChestField {
        player: native::Position::new(zone.center[0], zone.center[1], zone.center[2]),
        zone: native::ZoneDefinition::by_key(zone.key).expect("current cache zone"),
        terrain: &mut terrain,
        world: &mut port,
        rng,
        pickups: &mut records,
    };
    field.create_chest(
        position,
        &native::RunClock {
            elapsed: now,
            state: 1,
        },
    );
    let retained = records
        .iter()
        .map(|pickup| pickup.entity)
        .collect::<HashSet<_>>();
    pickups.retain(|pickup| retained.contains(&pickup.id));
    for (id, spawn) in spawned {
        pickups.push(RunPickup {
            id,
            created_at: now,
            drop: PickupDrop::Cache {
                position: spawn.position,
            },
            flight: None,
            facing: facing.get(&id).copied().unwrap_or(0.0),
            auxiliary: [None; 2],
        });
    }
}

#[cfg(test)]
mod tests {
    use super::super::rng_integration::{class_run, fixture_enemies, TerrainFixture};
    use super::*;

    fn prepared(seed: u64) -> Mechanics {
        let mut game = class_run("priest", 0);
        game.configure_effects(&[], &[]);
        game.rng = NativeRng::from_words([seed.wrapping_mul(0x9e37_79b9_7f4a_7c15), 2, 3, 4]);
        game.set_store_levels(true);
        game.add_experience(5);
        game.set_cache_on_click(true);
        let player = game.zone.center.into();
        game.tick_chests(player, [0.; 2], &mut TerrainFixture);
        assert_eq!(game.cache_records().len(), 2);
        game
    }

    #[test]
    fn cache_creation_matches_current_native_descriptor_and_shared_rng() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/cache-lifecycle/manifest.json"
        )).unwrap();
        for row in fixture["native_replay"]["descriptor_fixtures"].as_array().unwrap() {
            let mut counter = row["counter"].as_u64().unwrap() as u32;
            let mut rng = NativeRng::from_words(std::array::from_fn(|index| row["rng"][index].as_u64().unwrap()));
            let mut spawned = Vec::new();
            let mut facing = HashMap::new();
            let mut choice_requested = false;
            let mut events = Vec::new();
            let id = native::ChestWorld::spawn_chest_with_rng(&mut ChestPort {
                counter: &mut counter, spawned: &mut spawned, facing: &mut facing,
                choice_requested: &mut choice_requested, events: &mut events,
            }, native::ChestSpawn {
                position: native::Position::new(4.0, -2.0, 17.5),
                object_entry: native::CHEST_OBJECT_ENTRY, model_id: native::CHEST_MODEL_ID,
                scale: 1.0, object_type: 3,
            }, &mut rng);
            assert_eq!(events.len(), 1);
            let RunEvent::PickupObject(object) = &events[0] else { panic!("cache must enter the real client") };
            assert_eq!(id, row["guid"].as_u64().unwrap());
            assert_eq!(object.guid, id);
            assert_eq!(object.object_type, 5);
            assert_eq!(object.fields.len(), 16);
            assert_eq!(object.orientation.to_bits(), row["yaw_bits"].as_u64().unwrap() as u32);
            assert_eq!(counter, row["next_counter"].as_u64().unwrap() as u32);
            assert_eq!(rng.words, std::array::from_fn(|index| row["next_rng"][index].as_u64().unwrap()));
            for field in row["fields"].as_array().unwrap() {
                let key = field[0].as_u64().unwrap() as u16;
                let expected = field[1].as_u64().unwrap() as u32;
                let actual = object.fields.iter().find(|pair| pair.0 == key).unwrap().1;
                if key == 12 || key == 13 {
                    // The fixture records host sinf/cosf seams, not Windows CRT bit parity.
                    assert!((f32::from_bits(actual) - f32::from_bits(expected)).abs() < 0.000001);
                } else { assert_eq!(actual, expected, "field {key}"); }
            }
            assert_eq!(spawned.len(), 1);
            assert_eq!(spawned[0].0, id);
            assert_eq!(facing[&id], object.orientation);
            assert!(!choice_requested);
        }
    }

    #[test]
    fn rejected_cache_stays_closed_and_purchase_removes_its_client_object_once() {
        let mut game = prepared(1);
        let caches = game.cache_records();
        let objects = game.events.iter().filter_map(|event| match event {
            RunEvent::PickupObject(object) => Some(object), _ => None,
        }).collect::<Vec<_>>();
        assert_eq!(objects.len(), caches.len());
        for cache in &caches {
            let object = objects.iter().find(|object| object.guid == cache.id).unwrap();
            assert!(object.fields.contains(&(14, 1)), "ready state selects the held closed pose");
            assert!(object.fields.contains(&(8, native::CHEST_MODEL_ID)));
        }
        let cache = caches[0];
        game.clock = 5.0;
        game.gold = game.cache_price() - 1;
        game.events.clear();
        assert_eq!(game.click_cache(cache.id, cache.position, &mut TerrainFixture), native::Interaction::InsufficientGold);
        assert!(game.cache_records().iter().any(|row| row.id == cache.id));
        assert!(!game.events.iter().any(|event| matches!(event, RunEvent::RemoveObject(_) | RunEvent::PickupObject(_))));
        game.gold = game.cache_price();
        game.events.clear();
        assert!(matches!(game.click_cache(cache.id, cache.position, &mut TerrainFixture), native::Interaction::Purchased { entity, .. } if entity == cache.id));
        assert!(!game.cache_records().iter().any(|row| row.id == cache.id));
        let removed = game.events.iter().position(|event| matches!(event, RunEvent::RemoveObject(id) if *id == cache.id)).unwrap();
        let sound = game.events.iter().position(|event| matches!(event, RunEvent::PlaySound(1204))).unwrap();
        assert!(removed < sound);
        assert_eq!(game.click_cache(cache.id, cache.position, &mut TerrainFixture), native::Interaction::Ignored);
        assert_eq!(game.events.iter().filter(|event| matches!(event, RunEvent::RemoveObject(id) if *id == cache.id)).count(), 1);
        assert_eq!((game.caches_bought(), game.pending_cache_choices()), (1, 1));
    }

    #[test]
    fn death_cache_population_uses_the_same_create_and_oldest_removal_route() {
        let game = class_run("priest", 0);
        let mut pickups = Vec::new();
        let mut counter = 0u32;
        let mut rng = NativeRng::from_words([1, 2, 3, 4]);
        let mut events = Vec::new();
        for now in 0..6 {
            create_death_cache(&mut pickups, &mut counter, &mut TerrainFixture,
                game.zone, now as f32,
                native::Position::new(game.zone.center[0], game.zone.center[1], game.zone.center[2]),
                &mut rng, &mut events);
        }
        let created = events.iter().filter_map(|event| match event {
            RunEvent::PickupObject(object) => Some(object), _ => None,
        }).collect::<Vec<_>>();
        assert_eq!((created.len(), pickups.len(), counter), (6, 5, 6));
        let removed = events.iter().filter_map(|event| match event {
            RunEvent::RemoveObject(id) => Some(*id), _ => None,
        }).collect::<Vec<_>>();
        assert_eq!(removed, vec![created[0].guid]);
        for pickup in &pickups {
            let object = created.iter().find(|object| object.guid == pickup.id).unwrap();
            assert_eq!(pickup.facing, object.orientation);
        }
    }

    #[test]
    fn cache_feedback_uses_native_notice_coinage_and_purchase_sound() {
        let mut game = prepared(1);
        let cache = game.cache_records()[0];
        game.clock = 5.0;
        game.gold = 19;
        game.events.clear();
        assert_eq!(
            game.click_cache(cache.id, cache.position, &mut TerrainFixture),
            native::Interaction::InsufficientGold
        );
        assert!(game.events.iter().any(|event| matches!(
            event,
            RunEvent::CacheNotice(native::ChestMessage::NeedsGold { n: 20 })
        )));
        game.gold = 31;
        game.events.clear();
        assert!(matches!(
            game.click_cache(cache.id, cache.position, &mut TerrainFixture),
            native::Interaction::Purchased { paid: 20, .. }
        ));
        assert_eq!(game.gold, 11);
        assert!(game.events.iter().any(|event| matches!(event,
            RunEvent::PlayerValues(fields) if fields == &vec![(1176,110000)])));
        assert_eq!(
            game.events
                .iter()
                .filter(|event| matches!(event, RunEvent::PlaySound(1204)))
                .count(),
            1
        );
        assert!(!game
            .events
            .iter()
            .any(|event| matches!(event, RunEvent::CacheNotice(_))));
    }

    #[test]
    fn actual_cache_purchase_generated_amulet_acceptance_and_live_bounce_are_one_transaction_path()
    {
        // Exercise an actual generated shared amulet from the unchanged pool.
        // The bounded seed selection is test setup; production eligibility,
        // rarity and expansion remain the native complete pool.
        let seed=(1..=4096).find(|&seed| {
            let mut game=prepared(seed);
            let cache=game.cache_records()[0];game.gold=20;
            assert!(matches!(game.click_cache(cache.id,cache.position,&mut TerrainFixture),
                native::Interaction::Purchased {..}));
            (0..game.choices.len()).any(|i|game.cache_reward(i).is_some_and(|r|r.key()=="enlightenment"))
        }).expect("native complete cache pool offers enlightenment in the bounded deterministic seeds");
        let mut game = prepared(seed);
        let cache = game.cache_records()[0];
        assert_eq!(cache.id & 0xffff_ffff_ff00_0000, 0xf110_0023_2d00_0000);
        game.gold = 19;
        let before_rng = game.rng.words;
        assert_eq!(
            game.click_cache(cache.id, cache.position, &mut TerrainFixture),
            native::Interaction::InsufficientGold
        );
        assert_eq!(
            (game.gold, game.cache_price(), game.pending_cache_choices()),
            (19, 20, 0)
        );
        assert_eq!(game.rng.words, before_rng);
        assert!(game.cache_records().iter().any(|row| row.id == cache.id));
        game.gold = 20;
        assert!(matches!(
            game.click_cache(cache.id, cache.position, &mut TerrainFixture),
            native::Interaction::Purchased { .. }
        ));
        assert_eq!(
            (
                game.gold,
                game.cache_price(),
                game.caches_bought(),
                game.pending_cache_choices()
            ),
            (0, 31, 1, 1)
        );
        assert!(!game.cache_records().iter().any(|row| row.id == cache.id));
        assert!(game.is_paused_for_choice());
        let index = (0..game.choices.len())
            .find(|&i| {
                game.cache_reward(i)
                    .is_some_and(|r| r.key() == "enlightenment")
            })
            .unwrap();
        let reward_rng = game.rng.words;
        assert!(!game.choose(usize::MAX));
        assert!(game.worn_amulet().is_none());
        assert_eq!(game.pending_cache_choices(), 1);
        assert_eq!(game.rng.words, reward_rng);
        let stored = game.stored_levels();
        assert_eq!(stored, 1);
        assert!(game.choose(index));
        assert_eq!(game.worn_amulet().unwrap().key, "enlightenment");
        assert_eq!(
            (game.pending_cache_choices(), game.stored_levels()),
            (0, stored)
        );
        assert!(!game.cache_choices_active());
        assert!(
            !game.choose(index),
            "a consumed reward cannot be applied again"
        );
        assert_eq!(game.worn_amulet().unwrap().picks, 1);

        // The accepted inventory row reaches the normal live hit bridge,
        // rather than being injected into a test-only callback collection.
        game.abilities[0].remaining = 100.;
        fixture_enemies(&mut game, &[3., 4.], &mut TerrainFixture);
        for enemy in &mut game.actors {
            enemy.health = 1000.;
            enemy.maximum_health = 1000.;
        }
        let primary = game.actors[0].guid;
        let bounce = game.actors[1].guid;
        game.events.clear();
        game.execution.pending.0.push(PendingHit {
            context: HitContext::default(),
            target_guid: primary,
            source_guid: 1,
            effect: player_abilities::StatusEffect {
                tag: 0,
                value: 0.,
                duration: 0.,
            },
            resolves_at: game.clock,
            spell_id: 585,
            damage: 100.,
            critical: false,
            damages_player: false,
            school: 1,
        });
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.; 2], 0., &mut TerrainFixture);
        assert_eq!(game.actors[0].health, 900.);
        assert_eq!(game.actors[1].health, 970.);
        assert!(game
            .events
            .iter()
            .any(|event| matches!(event,RunEvent::Spell(cast)
            if cast.spell_id==585 && cast.hit_targets==vec![bounce])));
        assert!(game.events.iter().any(
            |event| matches!(event,RunEvent::Damage {target,amount,source_kind:3,..}
            if *target==bounce && (*amount-30.).abs()<0.0001)
        ));
        assert_eq!(
            (
                game.caches_bought(),
                game.pending_cache_choices(),
                game.stored_levels()
            ),
            (1, 0, stored)
        );
    }
}

struct ChestTerrain<'a, W>(&'a mut W);
impl<W: RunWorld> native::Terrain for ChestTerrain<'_, W> {
    fn height(&mut self, xy: [f32; 2]) -> Option<f32> {
        Terrain::height(self.0, xy)
    }
    fn secondary_height(&mut self, xy: [f32; 2]) -> Option<f32> {
        Terrain::secondary_height(self.0, xy)
    }
    fn fallback_height(&self) -> f32 {
        Terrain::fallback_height(self.0)
    }
    fn blocked_grid(&self) -> Option<native::BlockedGrid<'_>> {
        Terrain::blocked_grid(self.0).map(|grid| native::BlockedGrid {
            origin: grid.origin,
            side: grid.side,
            cells: grid.cells,
        })
    }
}

struct ChestPort<'a> {
    counter: &'a mut dyn NativeCounter,
    spawned: &'a mut Vec<(u64, native::ChestSpawn)>,
    facing: &'a mut HashMap<u64, f32>,
    choice_requested: &'a mut bool,
    events: &'a mut Vec<RunEvent>,
}
impl native::ChestWorld for ChestPort<'_> {
    fn spawn_chest(&mut self, spawn: native::ChestSpawn) -> u64 {
        // The GO creator shares the object serial and packs entry/counter
        // into 24-bit GUID lanes (0.113.2 creator14595464f..1459546e6).
        let id =
            azeroth_survivors_re::native_counter::gameobject_guid(spawn.object_entry, self.counter);
        self.spawned.push((id, spawn));
        id
    }
    fn spawn_chest_with_rng(&mut self, spawn: native::ChestSpawn, rng: &mut NativeRng) -> u64 {
        // 0.113.2 creator145954610 publishes the ordinary GAMEOBJECT
        // descriptor before appending its pickup. Reuse that client route:
        // its GO state machine owns the closed pose, picking and teardown.
        let object = player_abilities::behavior::passive_tick::lightwell_object(
            player_abilities::behavior::passive_tick::LightwellSpawn {
                center: Position { x: spawn.position.x, y: spawn.position.y, z: spawn.position.z },
                entry: spawn.object_entry,
                display: spawn.model_id,
                scale: spawn.scale,
                native_kind: u32::from(spawn.object_type),
                native_flags: 0,
            },
            self.counter,
            rng,
            f32::sin,
            f32::cos,
        );
        let id = object.guid;
        self.facing.insert(id, object.orientation);
        self.events.push(RunEvent::PickupObject(object));
        self.spawned.push((id, spawn));
        id
    }
    fn remove_entities(&mut self, primary: u64, auxiliary: &[u64]) {
        self.events.push(RunEvent::RemoveObject(primary));
        self.events
            .extend(auxiliary.iter().copied().map(RunEvent::RemoveObject));
    }
    fn gold_field_changed(&mut self, value: u32) {
        self.events
            .push(RunEvent::PlayerValues(vec![(1176, value)]));
    }
    fn client_command(&mut self, tag: u16, value: u32) {
        if tag == 0x2d2 {
            self.events.push(RunEvent::PlaySound(value));
        }
    }
    fn message(&mut self, message: native::ChestMessage) {
        self.events.push(RunEvent::CacheNotice(message));
    }
    fn request_cache_choice(&mut self, clock: &mut native::RunClock) {
        // Native opening pauses immediately; later gathered purchases still
        // increment their pending counter without generating another overlay.
        clock.pause();
        *self.choice_requested = true;
    }
}
