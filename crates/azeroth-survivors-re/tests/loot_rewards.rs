use azeroth_survivors_re::loot_rewards::*;
use azeroth_survivors_re::treasure_chests::NativeRng;
use serde_json::Value;

fn fixture() -> Value {
    serde_json::from_str(include_str!("fixtures/jewelry-0.100.1-native.json")).unwrap()
}

fn bits(value: &Value) -> u32 {
    value.as_u64().unwrap().try_into().unwrap()
}

#[test]
fn retained_amulet_descriptions_match_historical_native_prose() {
    let fixture: Value =
        serde_json::from_str(include_str!("fixtures/amulet-prose-0.100.1-native.json")).unwrap();
    assert_eq!(fixture["target_sha256"], TARGET_SHA256);
    assert_eq!(fixture["cases"].as_array().unwrap().len(), 387);
    let catalog = amulets::catalog();
    let mut differences = Vec::new();
    for case in fixture["cases"].as_array().unwrap() {
        if case["key"] == "star_of_mystaria" {
            assert!(catalog.by_key("star_of_mystaria").is_none(), "current Mystaria is jewelry");
            continue;
        }
        let definition = catalog.by_key(case["key"].as_str().unwrap()).unwrap();
        let Some(lines) =
            amulets::description_lines(definition, definition.rarity, bits(&case["picks"]))
        else {
            differences.push(format!("Unrecovered current prose: {}", definition.key));
            continue;
        };
        let lines = lines
            .iter()
            .map(|text| text.render(&str::to_owned))
            .collect::<Vec<_>>();
        let mut expected: Vec<_> = case["lines"]
            .as_array()
            .unwrap()
            .iter()
            .map(|line| line.as_str().unwrap())
            .collect();
        let cap = amulet_effect_multiplier(definition.rarity, bits(&case["picks"]));
        let current_cap;
        match definition.key.as_str() {
            "legendary:consecration" => {
                // The 0.140.0 Inferno constructor omits the historical damage row.
                expected.remove(2);
            }
            "legendary:pw_shield" => {
                current_cap = format!("Power Word: Shield: +{:.0}% absorb cap", 50.0 * cap);
                expected[0] = &current_cap;
            }
            "legendary:ice_barrier" => {
                current_cap = format!("Ice Barrier: +{:.0}% absorb cap", 100.0 * cap);
                expected[0] = &current_cap;
                expected.remove(2);
            }
            _ => {}
        }
        if lines != expected {
            differences.push(format!(
                "{} picks{}: got {:?}, expected {:?}",
                definition.key, case["picks"], lines, expected
            ));
        }
    }
    assert!(
        differences.is_empty(),
        "{} differences:\n{}",
        differences.len(),
        differences.join("\n")
    );
}

#[test]
fn native_effect_scaling_preserves_magnitude_rounding_and_cooldown_cap() {
    let fixture: Value =
        serde_json::from_str(include_str!("fixtures/effect-scaling-0.100.1-native.json")).unwrap();
    assert_eq!(fixture["target_sha256"], TARGET_SHA256);
    for case in fixture["cases"].as_array().unwrap() {
        let raw = case["raw_hex"].as_str().unwrap();
        let scaled = amulets::scaled_bytes(raw, f32::from_bits(bits(&case["factor_bits"])));
        if let Some(offset) = case["scaled_offset"].as_u64() {
            let offset = offset as usize;
            assert_eq!(
                u32::from_le_bytes(scaled[offset..offset + 4].try_into().unwrap()),
                bits(&case["scaled_bits"]),
                "{}",
                case["name"]
            );
        }
        assert_eq!(scaled[0], u8::from_str_radix(&raw[..2], 16).unwrap());
    }
}

#[test]
fn jewelry_descriptions_match_native_rounding_and_reduction_cap_marker() {
    let fixture: Value =
        serde_json::from_str(include_str!("fixtures/amulet-prose-0.100.1-native.json")).unwrap();
    assert_eq!(fixture["jewelry_cases"].as_array().unwrap().len(), 110);
    for case in fixture["jewelry_cases"].as_array().unwrap() {
        let definition = JewelryDefinition::by_key(case["key"].as_str().unwrap()).unwrap();
        let actual =
            prose::jewelry_description(definition, f32::from_bits(bits(&case["amount_bits"])))
                .render(&str::to_owned);
        assert_eq!(actual, case["text"].as_str().unwrap(), "{case}");
    }
}

fn f32_value(value: &Value) -> f32 {
    f32::from_bits(bits(value))
}

fn ability(kind: u8, subtype: u32) -> AbilityEligibility {
    AbilityEligibility {
        native_kind_at_117: kind,
        native_subtype_at_104: subtype,
    }
}

fn inventory<'a>(
    worn: &'a [WornJewelry<'a>],
    abilities: &'a [AbilityEligibility],
) -> CacheInventory<'a> {
    CacheInventory {
        worn,
        excluded_keys: &[],
        base_ability: ability(0, 0),
        learned_abilities: abilities,
        remaining_lives: 0,
        has_amulet: false,
    }
}

fn worn(key: &str, value: f32) -> WornJewelry<'static> {
    WornJewelry {
        definition: JewelryDefinition::by_key(key).unwrap(),
        value: JewelryValue { value, upgrades: 2 },
    }
}

#[test]
fn every_numeric_increment_matches_unchanged_native_instructions() {
    let fixture = fixture();
    assert_eq!(fixture["sha256"], TARGET_SHA256);
    assert_eq!(fixture["cases"].as_array().unwrap().len(), 660);
    for case in fixture["cases"].as_array().unwrap() {
        let definition = JewelryDefinition::by_key(case["key"].as_str().unwrap()).unwrap();
        let existing = case["existing"].as_bool().unwrap().then(|| JewelryValue {
            value: f32_value(&case["current_bits"]),
            upgrades: bits(&case["upgrades"]),
        });
        assert_eq!(
            definition
                .increment(bits(&case["rarity"]) as usize, existing)
                .to_bits(),
            bits(&case["increment_bits"]),
            "native increment: {case}"
        );
    }
}

#[test]
fn rarity_weights_match_native_branches_including_level_cap() {
    for case in fixture()["rarity_cases"].as_array().unwrap() {
        let actual = rarity_weights(
            f32_value(&case["run_rarity_bits"]),
            bits(&case["level"]),
            f32_value(&case["source_bonus_bits"]),
            case["amulet"].as_bool().unwrap(),
        );
        let expected: Vec<_> = case["weight_bits"]
            .as_array()
            .unwrap()
            .iter()
            .map(bits)
            .collect();
        assert_eq!(actual.map(f32::to_bits).as_slice(), expected, "{case}");
        let total = (((actual[1] + actual[0]) + actual[2]) + actual[3]) + actual[4];
        assert_eq!(total.to_bits(), bits(&case["total_bits"]));
    }
}

#[test]
fn source_catalog_matches_all_current_native_records() {
    let fixture: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.112.0/jewelry/validation.json"
    )).unwrap();
    assert_eq!(fixture["target"]["version"], "0.112.0");
    assert_eq!(JEWELRY.len(), fixture["rows"].as_array().unwrap().len());
    for (definition, record) in JEWELRY.iter().zip(fixture["rows"].as_array().unwrap()) {
        assert_eq!(definition.key, record["key"].as_str().unwrap());
        assert_eq!(definition.base.to_bits(), bits(&record["base_bits"]));
        assert_eq!(u32::from(definition.tag), bits(&record["source_tag"]));
        assert_eq!(u32::from(definition.slot), bits(&record["slot"]));
    }
    assert!(JewelryDefinition::by_key("unknown-native-key").is_none());
}

#[test]
fn mystaria_growth_matches_current_native_increments_and_remains_uncapped() {
    let fixture: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.112.0/jewelry/validation.json"
    )).unwrap();
    let definition = JewelryDefinition::by_key("star_of_mystaria").unwrap();
    assert_eq!((definition.tag, definition.slot), (19, 1));
    assert!(definition.value_cap().is_infinite());
    assert!(definition.offering_ceiling().is_infinite());
    for case in fixture["star_cases"].as_array().unwrap() {
        let existing = case["present"].as_bool().unwrap().then(|| JewelryValue {
            value: f32_value(&case["current_bits"]), upgrades: bits(&case["upgrades"]),
        });
        assert_eq!(definition.increment(bits(&case["rarity"]) as usize, existing).to_bits(),
                   bits(&case["increment_bits"]), "{case}");
    }
    let text: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.112.0/jewelry/text-validation.json"
    )).unwrap();
    for case in text["cap_cases"].as_array().unwrap() {
        let actual = prose::jewelry_description(definition, f32_value(&case["amount_bits"]))
            .render(&str::to_owned);
        assert_eq!(actual, case["text"].as_str().unwrap());
    }
}

#[test]
fn worn_items_remain_offered_at_full_slots_and_new_items_obey_two_per_slot() {
    let items = [
        worn("accuria", 0.3),
        worn("quick_strike", 0.2),
        worn("earthstrike", 0.2),
        worn("hoj", 0.1),
    ];
    let input = inventory(&items, &[]);
    let candidates = cache_candidates(&input);
    let jewelry: Vec<_> = candidates
        .iter()
        .filter_map(|candidate| match candidate.seed {
            CacheSeed::Jewelry(definition) => Some((definition.key, candidate.weight)),
            _ => None,
        })
        .collect();
    assert_eq!(
        jewelry,
        [
            ("accuria", 2.0),
            ("quick_strike", 2.0),
            ("earthstrike", 2.0),
            ("hoj", 2.0)
        ]
    );
    assert_eq!(candidates.last().unwrap().seed, CacheSeed::NewAmulet);
}

#[test]
fn exclusion_and_special_spell_gates_match_native_predicates() {
    let mut input = inventory(&[], &[]);
    let has = |candidates: &[WeightedSeed<'_>], key: &str| {
        candidates.iter().any(|candidate|
        matches!(candidate.seed, CacheSeed::Jewelry(definition) if definition.key == key))
    };
    let candidates = cache_candidates(&input);
    assert!(!has(&candidates, "war_horn"));
    assert!(!has(&candidates, "seal_damned"));
    input.base_ability = ability(9, 12);
    assert!(has(&cache_candidates(&input), "war_horn"));
    input.base_ability = ability(6, 0);
    assert!(!has(&cache_candidates(&input), "seal_damned"));
    let abilities = [ability(6, 0), ability(9, 7)];
    input.learned_abilities = &abilities;
    input.excluded_keys = &["accuria"];
    let candidates = cache_candidates(&input);
    assert!(has(&candidates, "seal_damned"));
    assert!(has(&candidates, "war_horn"));
    assert!(!has(&candidates, "accuria"));
}

#[test]
fn soulstone_refill_and_finite_offering_cutoffs_use_live_state() {
    let items = [worn("hoj", 0.54), worn("soulstone", 1.0)];
    let mut input = inventory(&items, &[]);
    input.remaining_lives = 2;
    let candidates = cache_candidates(&input);
    assert!(!candidates.iter().any(|candidate| matches!(candidate.seed,
        CacheSeed::Jewelry(definition) if definition.key == "hoj" || definition.key == "soulstone")));
    input.remaining_lives = 1;
    assert!(cache_candidates(&input)
        .iter()
        .any(|candidate| matches!(candidate.seed,
        CacheSeed::Jewelry(definition) if definition.key == "soulstone")));
    assert!(JewelryDefinition::by_key("accuria")
        .unwrap()
        .value_cap()
        .is_infinite());
    assert!(JewelryDefinition::by_key("dark_iron")
        .unwrap()
        .value_cap()
        .is_infinite());
}

#[test]
fn category_draws_are_distinct_and_precede_later_reward_expansion() {
    let mut rng = NativeRng::from_words([1, 2, 3, 4]);
    let input = inventory(&[], &[]);
    let choices = draw_cache_seeds(&input, &mut rng);
    assert_eq!(choices.len(), 3);
    assert!(choices
        .iter()
        .enumerate()
        .all(|(i, choice)| !choices[..i].contains(choice)));
    let after_categories = rng.words;
    let _ = roll_rarity(rarity_weights(0.0, 1, 0.0, false), &mut rng);
    assert_ne!(after_categories, rng.words);
}

#[test]
fn gold_fallback_and_amulet_multiplier_boundaries() {
    assert_eq!(fallback_gold(20), 60);
    assert_eq!(fallback_gold(121), 60);
    assert_eq!(fallback_gold(400), 200);
    for rarity in 0..5 {
        assert_eq!(amulet_effect_multiplier(rarity, 0), 1.0);
        assert_eq!(amulet_effect_multiplier(rarity, 1), 1.0);
        assert_eq!(next_amulet_effect_multiplier(rarity, u32::MAX), 1.0);
        assert!(amulet_effect_multiplier(rarity, 2) > amulet_effect_multiplier(rarity, 1));
        assert!(amulet_effect_multiplier(rarity, 10) <= 3.0);
    }
}

#[test]
fn jewelry_application_preserves_order_tracks_picks_and_keeps_highest_rarity() {
    let mut items = Vec::new();
    let mut lives = 0;
    let first = apply_jewelry(&mut items, &mut lives, "accuria", 3).unwrap();
    assert!(first.new_item);
    assert_eq!(items[0].value.upgrades, 1);
    assert_eq!(items[0].rarity, 3);
    let initial = items[0].value.value;
    apply_jewelry(&mut items, &mut lives, "quick_strike", 0).unwrap();
    let repeated = apply_jewelry(&mut items, &mut lives, "accuria", 0).unwrap();
    assert_eq!(repeated.index, 0);
    assert!(!repeated.new_item);
    assert_eq!(items.len(), 2);
    assert_eq!(items[0].value.value, initial + repeated.added);
    assert_eq!(items[0].value.upgrades, 2);
    assert_eq!(items[0].rarity, 3);
    let before = items.clone();
    assert!(apply_jewelry(&mut items, &mut lives, "unrecovered", 4).is_none());
    assert_eq!(items, before);
    items[0].value.upgrades = u32::MAX;
    apply_jewelry(&mut items, &mut lives, "accuria", 4).unwrap();
    assert_eq!(items[0].value.upgrades, 0);
    assert_eq!(items[0].rarity, 4);
}

#[test]
fn soulstone_application_refills_actual_lives_and_clamps_record_increment() {
    let mut items = Vec::new();
    let mut lives = 1;
    let fresh = apply_jewelry(&mut items, &mut lives, "soulstone", 4).unwrap();
    assert_eq!(fresh.lives_added, 1);
    assert_eq!(lives, 2);
    assert_eq!(items[0].value.value, 1.0);
    let full = apply_jewelry(&mut items, &mut lives, "soulstone", 4).unwrap();
    assert_eq!(full.added, 0.0);
    assert_eq!(items[0].value.upgrades, 2);
    lives = 0;
    apply_jewelry(&mut items, &mut lives, "soulstone", 0).unwrap();
    assert_eq!(lives, 1);
    assert_eq!(items[0].value.value, 2.0);
}

#[test]
fn same_amulet_key_empowers_existing_payload_while_new_key_replaces_it() {
    let mut current = Some(AmuletItem {
        key: "recovered-a".into(),
        rarity: 1,
        picks: 1,
        payload: vec![7, 8],
    });
    let same = AmuletItem {
        key: "recovered-a".into(),
        rarity: 4,
        picks: 7,
        payload: vec![99],
    };
    assert_eq!(apply_amulet(&mut current, same), AmuletChange::Empowered);
    let worn = current.as_ref().unwrap();
    assert_eq!((worn.rarity, worn.picks), (1, 2));
    assert_eq!(worn.payload, [7, 8]);
    current.as_mut().unwrap().picks = u32::MAX;
    assert_eq!(
        apply_amulet(
            &mut current,
            AmuletItem {
                key: "recovered-a".into(),
                rarity: 0,
                picks: 1,
                payload: vec![]
            }
        ),
        AmuletChange::Empowered
    );
    assert_eq!(current.as_ref().unwrap().picks, 0);
    let other = AmuletItem {
        key: "recovered-b".into(),
        rarity: 3,
        picks: 1,
        payload: vec![20],
    };
    assert_eq!(
        apply_amulet(&mut current, other.clone()),
        AmuletChange::Replaced
    );
    assert_eq!(current, Some(other));
}

#[test]
fn empowerment_enables_a_new_war_horn_through_the_actual_reward_pool() {
    let empowerment = azeroth_survivors_re::player_abilities::AbilityDefinition::by_key(
        "demonic_empowerment",
    ).unwrap();
    let learned = [ability(empowerment.kind, empowerment.effect.tag)];
    let pool = cache_candidates(&inventory(&[], &learned));
    assert!(pool.iter().any(|row| matches!(row.seed,
        CacheSeed::Jewelry(definition) if definition.key == "war_horn")));
    assert!(!cache_candidates(&inventory(&[], &[])).iter().any(|row| matches!(row.seed,
        CacheSeed::Jewelry(definition) if definition.key == "war_horn")));
}
