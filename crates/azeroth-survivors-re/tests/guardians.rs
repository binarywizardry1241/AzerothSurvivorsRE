use azeroth_survivors_re::guardians::{
    catalog::{ZoneDefinition, ZONES},
    scaling::ScalingInput,
    GuardianSpawn, Guardians, Lair, NativeRng, Position, SpawnPort, TARGET_SHA256,
};
use serde_json::Value;

fn input(clock_seconds: f32) -> ScalingInput {
    ScalingInput {
        heroic_rank: 0,
        clock_seconds,
        difficulty: 1.0,
        zone_scale: 999.0,
        guardian_kills: 999,
        hp_percent: 100,
        damage_percent: 100,
        phase: 0,
        endless: false,
        endless_start_seconds: 0.0,
    }
}

fn bits(value: &Value) -> f32 {
    f32::from_bits(value.as_u64().unwrap() as u32)
}

#[derive(Default)]
struct World {
    spawned: Vec<GuardianSpawn>,
    announcements: Vec<(usize, usize)>,
}
impl SpawnPort for World {
    fn create_guardian(&mut self, spawn: GuardianSpawn) {
        self.spawned.push(spawn);
    }
    fn announce_lair_refilled(&mut self, lair: usize, enemy: usize) {
        self.announcements.push((lair, enemy));
    }
}

#[test]
fn unchanged_native_lair_and_shared_rng_outputs() {
    let fixture: Value =
        serde_json::from_str(include_str!("fixtures/guardian-lifecycle-native.json")).unwrap();
    assert_eq!(fixture["target_sha256"], TARGET_SHA256);
    for row in fixture["due"].as_array().unwrap() {
        let lair = Lair {
            enemy_index: 9,
            home: Position::default(),
            active_guid: row["active"].as_bool().unwrap().then_some(7),
            respawn_at: bits(&row["deadline_bits"]),
        };
        assert_eq!(
            lair.spawn_due(bits(&row["clock_bits"])),
            row["spawn"].as_bool().unwrap()
        );
    }
    for row in fixture["facing"].as_array().unwrap() {
        let state = std::array::from_fn(|i| row["state"][i].as_u64().unwrap());
        let mut rng = NativeRng { state };
        assert_eq!(
            rng.range_f32(0.0, f32::from_bits(0x40c90fdb)).to_bits(),
            row["facing_bits"].as_u64().unwrap() as u32
        );
        for (i, value) in rng.state.iter().enumerate() {
            assert_eq!(*value, row["state_after"][i].as_u64().unwrap());
        }
    }
}

#[test]
fn death_deadline_matches_native_and_counts_invalid_lair() {
    // Every native oracle row has one lair; valid/invalid indices exercise the
    // original index guard independently of the unconditional kill increment.
    let fixture: Value =
        serde_json::from_str(include_str!("fixtures/guardian-lifecycle-native.json")).unwrap();
    for row in fixture["death"].as_array().unwrap() {
        let mut system = Guardians::from_lairs(
            &ZONES[0],
            vec![Lair {
                enemy_index: 9,
                home: Position::default(),
                active_guid: Some(7),
                respawn_at: 999.0,
            }],
        );
        // The public component starts a fresh run. Set the recovered prior count
        // through real death transitions, except the separate wrap fixture.
        let kills = row["kills"].as_u64().unwrap() as u32;
        if kills == u32::MAX {
            continue;
        }
        for _ in 0..kills {
            system.record_death(99, 0.0);
        }
        system.record_death(
            row["lair_index"].as_u64().unwrap() as usize,
            bits(&row["clock_bits"]),
        );
        assert_eq!(
            system.guardian_kills(),
            row["kills_after"].as_u64().unwrap() as u32
        );
        assert_eq!(
            system.lairs()[0].active_guid.is_some(),
            row["active_after"].as_bool().unwrap()
        );
        assert_eq!(
            system.lairs()[0].respawn_at.to_bits(),
            row["deadline_bits"].as_u64().unwrap() as u32
        );
    }
}

#[test]
fn initial_spawn_pause_boundary_and_respawn_use_run_state() {
    let zone = ZoneDefinition::by_key("elwynn").unwrap();
    let home = Position {
        x: 12.0,
        y: 34.0,
        z: 56.0,
    };
    let mut system = Guardians::from_lairs(zone, vec![Lair::new(9, home)]);
    let mut world = World::default();
    let mut rng = NativeRng {
        state: [1, 2, 3, 4],
    };
    let mut counter:u32 = 0xff_ffff;
    let mut powf = |_: f32, _: f32| -> f32 { panic!("normal run must not invoke powf") };
    system.spawn_due(
        input(20.0),
        100,
        true,
        &mut counter,
        &mut rng,
        &mut powf,
        &mut world,
    );
    assert!(world.spawned.is_empty());
    system.spawn_due(
        input(19.999),
        100,
        false,
        &mut counter,
        &mut rng,
        &mut powf,
        &mut world,
    );
    assert!(world.spawned.is_empty());
    system.spawn_due(
        input(20.0),
        100,
        false,
        &mut counter,
        &mut rng,
        &mut powf,
        &mut world,
    );
    assert_eq!(world.spawned.len(), 1);
    assert!(world.announcements.is_empty());
    assert_eq!(world.spawned[0].home, home);
    assert_eq!(
        world.spawned[0].guid,
        0xf130000000000000 | (u64::from(zone.enemies[9].id) << 24)
    );
    let before = world.spawned[0].health;
    // Input's invented zone scale and stale kill count are replaced by the
    // actual selected zone/current run, as in the native owner.
    assert_eq!(
        before,
        azeroth_survivors_re::guardians::scaling::guardian_health(
            ScalingInput {
                zone_scale: zone.scalar_e0,
                guardian_kills: 0,
                ..input(20.0)
            },
            zone.enemies[9].base_hp,
            zone.hp_knots
        )
    );
    system.record_death(0, 30.0);
    system.spawn_due(
        input(209.999),
        100,
        false,
        &mut counter,
        &mut rng,
        &mut powf,
        &mut world,
    );
    assert_eq!(world.spawned.len(), 1);
    system.spawn_due(
        input(210.0),
        120,
        false,
        &mut counter,
        &mut rng,
        &mut powf,
        &mut world,
    );
    assert_eq!(world.spawned.len(), 2);
    assert_eq!(world.announcements, [(0, 9)]);
    assert!(world.spawned[1].health > before);
    assert_eq!(
        world.spawned[1].movement_speed,
        zone.enemies[9].raw_3c * 1.2
    );
    system.spawn_due(
        input(9999.0),
        100,
        false,
        &mut counter,
        &mut rng,
        &mut powf,
        &mut world,
    );
    assert_eq!(world.spawned.len(), 2);
}

#[test]
fn current_named_guardian_scales_reach_the_actual_spawn_port() {
    let current: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.127.0/creature-sizes/reach-native.json"
    )).unwrap();
    let mut checked = 0;
    for row in current["cases"].as_array().unwrap().iter()
        .filter(|row| row["kind"] == "guardians" && row["id"].is_u64()) {
        let id = row["id"].as_u64().unwrap() as u32;
        let (zone, index) = ZONES.iter().find_map(|zone| zone.enemies.iter()
            .position(|definition| definition.id == id).map(|index| (zone, index))).unwrap();
        assert_eq!(zone.enemies[index].scale.to_bits(), row["scale_bits"].as_u64().unwrap() as u32);
        let mut system = Guardians::from_lairs(zone, vec![Lair::new(index, Position::default())]);
        let mut world = World::default();
        let mut counter: u32 = 0;
        system.spawn_due(input(20.), 100, false, &mut counter,
            &mut NativeRng { state: [1, 2, 3, 4] }, &mut |_, _| 1., &mut world);
        assert_eq!(world.spawned.len(), 1);
        assert_eq!(world.spawned[0].melee_reach.to_bits(), row["melee_reach_bits"].as_u64().unwrap() as u32);
        checked += 1;
    }
    assert_eq!(checked, 7);
}
