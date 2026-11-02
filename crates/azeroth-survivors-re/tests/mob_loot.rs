use azeroth_survivors_re::mob_loot::*;
use azeroth_survivors_re::treasure_chests::{EnemyDefinition, NativeRng, Position};
use serde_json::Value;

fn oracle() -> Value {
    let value: Value =
        serde_json::from_str(include_str!("fixtures/mob-loot-0.97.2-native.json")).unwrap();
    assert_eq!(value["version"], "0.97.2");
    assert_eq!(
        value["sha256"],
        "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
    );
    value
}

fn n(value: &Value) -> u32 {
    value.as_u64().unwrap().try_into().unwrap()
}
fn f(value: &Value) -> f32 {
    f32::from_bits(n(value))
}
fn words(value: &Value) -> [u64; 4] {
    value
        .as_array()
        .unwrap()
        .iter()
        .map(|item| item.as_str().unwrap().parse().unwrap())
        .collect::<Vec<_>>()
        .try_into()
        .unwrap()
}

#[derive(Default)]
struct World {
    pickups: Vec<PickupDrop>,
    height_queries: Vec<[f32; 2]>,
}
impl MobLootWorld for World {
    fn create_pickup(&mut self, pickup: PickupDrop) {
        self.pickups.push(pickup);
    }
    fn resolved_height(&mut self, xy: [f32; 2]) -> f32 {
        self.height_queries.push(xy);
        7.25
    }
}

#[test]
fn ordinary_death_pickups_and_rng_match_252_native_branches() {
    let oracle = oracle();
    let cases = oracle["death_cases"].as_array().unwrap();
    assert_eq!(cases.len(), 252);
    for (index, case) in cases.iter().enumerate() {
        let definition = EnemyDefinition {
            id: 0,
            chest_flag: n(&case["flag"]) as u8,
            base_experience: n(&case["experience"]),
            death_accumulator: 1.5,
        };
        let mut state = MobLootState {
            death_accumulator: 2.5,
        };
        let mut rng = NativeRng::from_words(words(&case["seed"]));
        let mut world = World::default();
        state.enemy_death(
            Some(&definition),
            n(&case["density"]) as u16,
            Position::new(10., 20., 3.),
            &mut rng,
            &mut world,
        );
        assert_eq!(
            state.death_accumulator.to_bits(),
            n(&case["accumulator_bits"]),
            "case {index}"
        );
        assert_eq!(rng.words, words(&case["rng_after"]), "case {index}");
        let expected: Vec<PickupDrop> = case["pickups"]
            .as_array()
            .unwrap()
            .iter()
            .map(|pickup| {
                let xyz = pickup["position_bits"].as_array().unwrap();
                let position = Position::new(f(&xyz[0]), f(&xyz[1]), f(&xyz[2]));
                match n(&pickup["kind"]) {
                    0 => PickupDrop::Experience {
                        amount: n(&pickup["amount"]),
                        position,
                    },
                    1 => PickupDrop::Gold {
                        amount: n(&pickup["amount"]),
                        position,
                    },
                    2 => PickupDrop::Cache { position },
                    _ => panic!("unexpected native pickup kind"),
                }
            })
            .collect();
        assert_eq!(world.pickups, expected, "case {index}");
        assert_eq!(
            world.height_queries.len(),
            usize::from(definition.chest_flag != 0)
        );
    }
}

#[test]
fn all_class_zone_boss_candidate_pools_match_original_native_routine() {
    let oracle = oracle();
    let cases = oracle["boss_cases"].as_array().unwrap();
    assert_eq!(cases.len(), 780);
    for case in cases {
        let actual = boss_candidates(
            n(&case["class_id"]) as u8,
            n(&case["zone"]) as usize,
            n(&case["boss"]) as usize,
        );
        let expected: Vec<_> = case["candidates"]
            .as_array()
            .unwrap()
            .iter()
            .map(|candidate| EquipmentCandidate {
                item_id: n(&candidate["item_id"]),
                base_chance: f(&candidate["chance_bits"]),
            })
            .collect();
        assert_eq!(
            actual, expected,
            "class {}, zone {}, boss {}",
            case["class_id"], case["zone"], case["boss"]
        );
    }
    assert!(boss_candidates(1, 12, 0).is_empty());
    assert!(boss_candidates(1, 0, 5).is_empty());
}

#[test]
fn equipment_run_option_multiplier_matches_original_sse_order() {
    for case in oracle()["multiplier_cases"].as_array().unwrap() {
        let options: [u16; 4] = case["options"]
            .as_array()
            .unwrap()
            .iter()
            .map(|value| n(value) as u16)
            .collect::<Vec<_>>()
            .try_into()
            .unwrap();
        assert_eq!(
            equipment_drop_multiplier(options).to_bits(),
            n(&case["result_bits"]),
            "{options:?}"
        );
    }
}

#[test]
fn permanent_boss_equipment_queue_and_rng_match_2160_native_rolls() {
    let oracle = oracle();
    let cases = oracle["equipment_cases"].as_array().unwrap();
    assert_eq!(cases.len(), 2160);
    for (index, case) in cases.iter().enumerate() {
        let options = case["options"]
            .as_array()
            .unwrap()
            .iter()
            .map(|value| n(value) as u16)
            .collect::<Vec<_>>()
            .try_into()
            .unwrap();
        let roll = EquipmentRoll {
            extra_pickup_mode: case["extra"].as_bool().unwrap(),
            additive_chance: f(&case["additive_bits"]),
            run_options: options,
        };
        let mut rng = NativeRng::from_words(words(&case["seed"]));
        let actual = roll_boss_equipment(
            n(&case["class_id"]) as u8,
            n(&case["zone"]) as usize,
            n(&case["boss"]) as usize,
            roll,
            &mut rng,
        );
        let expected: Vec<u32> = case["queued"].as_array().unwrap().iter().map(n).collect();
        assert_eq!(actual, expected, "equipment native case {index}");
        assert_eq!(
            rng.words,
            words(&case["rng_after"]),
            "equipment RNG case {index}"
        );
    }
}

#[test]
fn unknown_definition_and_suppressed_equipment_preserve_shared_rng() {
    let mut state = MobLootState::default();
    let mut world = World::default();
    let mut rng = NativeRng::from_words([1, 2, 3, 4]);
    state.enemy_death(None, 100, Position::default(), &mut rng, &mut world);
    let roll = EquipmentRoll {
        extra_pickup_mode: true,
        additive_chance: 1.0,
        run_options: [100; 4],
    };
    assert!(roll_boss_equipment(4, 0, 4, roll, &mut rng).is_empty());
    assert_eq!(rng.words, [1, 2, 3, 4]);
    assert!(world.pickups.is_empty());
}
