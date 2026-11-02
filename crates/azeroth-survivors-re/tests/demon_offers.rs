//! Source regressions against selected native instruction cases; not run by the
//! source/static-only fixgap workflow.
use azeroth_survivors_re::{
    loot_rewards::{self, amulets},
    player_abilities::{
        AbilityDefinition, RuntimeInstance,
        upgrades::{self, UpgradeKind},
    },
    run_effects::{self, EffectRow, Effects, demon_talents},
};

fn fixture() -> serde_json::Value {
    serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.105.0/demon-offers/native-cases.json"
    ))
    .unwrap()
}

#[test]
fn current_selected_ability_power_matches_native_descriptor_bytes() {
    let manifest: serde_json::Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.105.0/demon-offers/manifest.json"
    ))
    .unwrap();
    assert_eq!(azeroth_survivors_re::player_abilities::ABILITIES.len(), 113);
    assert_eq!(
        AbilityDefinition::by_key("searing_pain")
            .unwrap()
            .base_power,
        50.
    );
    for record in manifest["ability_records"].as_array().unwrap() {
        let raw = record["raw_hex"].as_str().unwrap();
        let native = u32::from_le_bytes(std::array::from_fn(|index| {
            let start = (68 + index) * 2;
            u8::from_str_radix(&raw[start..start + 2], 16).unwrap()
        }));
        let definition = AbilityDefinition::by_key(record["key"].as_str().unwrap()).unwrap();
        assert_eq!(definition.base_power.to_bits(), native);
    }
}

fn current_fixture() -> serde_json::Value {
    serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.112.0/demonic-empowerment/native-cases.json"
    )).unwrap()
}

#[test]
fn empowerment_uses_current_ordinary_upgrades_and_learned_rarity() {
    let fixture = current_fixture();
    for case in fixture["upgrade_cases"].as_array().unwrap() {
        let mut instance = RuntimeInstance::learned(AbilityDefinition::by_key("demonic_empowerment").unwrap());
        instance.cooldown_multiplier = case["cooldown"].as_f64().unwrap() as f32;
        instance.duration_multiplier = case["duration"].as_f64().unwrap() as f32;
        let kind = UpgradeKind::from_tag(case["kind"].as_u64().unwrap() as u8).unwrap();
        assert_eq!(upgrades::magnitude(&instance, kind, case["rarity"].as_u64().unwrap() as usize).to_bits(),
            case["increment_bits"].as_u64().unwrap() as u32, "{case}");
    }
    for case in fixture["learned_rarity_cases"].as_array().unwrap() {
        let mut instance = RuntimeInstance::learned(AbilityDefinition::by_key("demonic_empowerment").unwrap());
        upgrades::apply_learned_rarity(&mut instance, case["rarity"].as_u64().unwrap() as usize);
        assert_eq!(instance.cooldown_multiplier.to_bits(), case["cooldown_bits"].as_u64().unwrap() as u32);
        assert_eq!(instance.power_multiplier.to_bits(), case["power_bits"].as_u64().unwrap() as u32);
    }
    let mut instance = RuntimeInstance::learned(AbilityDefinition::by_key("demonic_empowerment").unwrap());
    assert_eq!(upgrades::eligible_types(&instance, 1., 4), [UpgradeKind::Cooldown, UpgradeKind::Duration]);
    instance.duration_multiplier = 2.;
    assert!(upgrades::eligible_types(&instance, 1., 4).is_empty());
    assert!(upgrades::eligible_types(&instance, 0.5, 4).is_empty());
}

#[test]
fn current_empowerment_upgrade_eligibility_and_apply_match_native_boundaries() {
    let fixture: serde_json::Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.112.0/demonic-empowerment/upgrade-flow-cases.json"
    )).unwrap();
    let definition = AbilityDefinition::by_key("demonic_empowerment").unwrap();
    for case in fixture["supports_cases"].as_array().unwrap() {
        let kind = UpgradeKind::from_tag(case["kind"].as_u64().unwrap() as u8).unwrap();
        assert_eq!(upgrades::supports(definition, kind), case["supported"].as_bool().unwrap());
    }
    for case in fixture["eligible_cases"].as_array().unwrap() {
        let mut instance = RuntimeInstance::learned(definition);
        let f = |key: &str| case[key].as_f64().unwrap() as f32;
        instance.cooldown_multiplier = f("cooldown");
        instance.duration_multiplier = f("duration");
        instance.talent_cooldown_multiplier = f("talent_cooldown");
        instance.talent_duration_multiplier = f("talent_duration");
        let actual: Vec<u8> = upgrades::eligible_types(&instance, f("global_cooldown"), case["rarity"].as_u64().unwrap() as usize)
            .into_iter().map(|kind| kind as u8).collect();
        let expected: Vec<u8> = case["offered"].as_array().unwrap().iter().map(|kind| kind.as_u64().unwrap() as u8).collect();
        assert_eq!(actual, expected, "{case}");
    }
    for case in fixture["apply_cases"].as_array().unwrap() {
        let mut instance = RuntimeInstance::learned(definition);
        instance.rank = case["initial_rank"].as_u64().unwrap() as u32;
        instance.upgrade_counts[1] = case["initial_count"].as_u64().unwrap() as u32;
        instance.upgrade_counts[4] = instance.upgrade_counts[1];
        instance.remaining = 0.75;
        instance.power_multiplier = 1.25;
        instance.cooldown_multiplier = 0.6;
        instance.duration_multiplier = 1.5;
        for kind in case["kinds"].as_array().unwrap() {
            upgrades::apply(&mut instance, UpgradeKind::from_tag(kind.as_u64().unwrap() as u8).unwrap(), case["rarity"].as_u64().unwrap() as usize);
        }
        assert_eq!(instance.rank, case["rank"].as_u64().unwrap() as u32, "{case}");
        for (actual, key) in [(instance.remaining, "remaining_bits"), (instance.power_multiplier, "power_bits"),
            (instance.cooldown_multiplier, "cooldown_bits"), (instance.duration_multiplier, "duration_bits")] {
            assert_eq!(actual.to_bits(), case[key].as_u64().unwrap() as u32, "{case}");
        }
        assert_eq!([instance.upgrade_counts[1], instance.upgrade_counts[4]],
            [case["counts"][0].as_u64().unwrap() as u32, case["counts"][1].as_u64().unwrap() as u32], "{case}");
    }
}

#[test]
fn legionlord_uses_current_generic_scaling_and_live_modifiers() {
    let definition = amulets::catalog().by_key(amulets::LEGIONLORD_KEY).unwrap();
    assert_eq!(definition.effects.len(), 3);
    for case in current_fixture()["scaling_cases"].as_array().unwrap() {
        for (index, record) in definition.effects.iter().enumerate() {
            let raw = amulets::scaled_bytes(&record.raw_hex, case["factor"].as_f64().unwrap() as f32);
            assert_eq!(u32::from_le_bytes(raw[32..36].try_into().unwrap()),
                case["amount_bits"][index].as_u64().unwrap() as u32);
        }
    }
    let mut effects = Effects::default();
    effects.rebuild(Some((definition, 4, 1)));
    let mut instance = RuntimeInstance::learned(AbilityDefinition::by_key("demonic_empowerment").unwrap());
    effects.spell_modifiers(instance.definition).apply(&mut instance);
    assert_eq!(instance.talent_duration_multiplier, 2.);
    assert_eq!(instance.talent_cooldown_multiplier, 1. - 0.35);
    assert_eq!(instance.effect_multiplier, 2.);
    let before = demon_talents::empowerment_effect(&instance).unwrap();
    instance.power_multiplier = 500.;
    instance.talent_power_multiplier = 10.;
    assert_eq!(demon_talents::empowerment_effect(&instance).unwrap(), before);
    assert_eq!(before.duration, 0.);
}

#[test]
fn legionlord_remains_available_past_ten_and_repeated_picks_wrap() {
    let definition = amulets::catalog().by_key(amulets::LEGIONLORD_KEY).unwrap();
    let item = |picks| loot_rewards::AmuletItem {
        key: definition.key.clone(), rarity: 4, picks, payload: definition,
    };
    for (old, expected) in [(10, 11), (u32::MAX, 0)] {
        let mut worn = Some(item(old));
        loot_rewards::apply_amulet(&mut worn, item(1));
        assert_eq!(worn.unwrap().picks, expected);
    }
    let inventory = loot_rewards::CacheInventory {
        worn: &[], excluded_keys: &[],
        base_ability: loot_rewards::AbilityEligibility { native_kind_at_117: 0, native_subtype_at_104: 0 },
        learned_abilities: &[], remaining_lives: 0, has_amulet: true,
    };
    assert!(loot_rewards::cache_candidates(&inventory).iter()
        .any(|row| matches!(row.seed, loot_rewards::CacheSeed::EmpowerAmulet)));
}

#[test]
fn generic_amulet_scaling_uses_native_signed_exponent_conversion_and_next_wrap() {
    for case in current_fixture()["generic_scaling_exponent_cases"].as_array().unwrap() {
        let rarity = case["rarity"].as_u64().unwrap() as usize;
        let picks = case["picks"].as_u64().unwrap() as u32;
        let retention = f32::from_bits(case["retention_bits"].as_u64().unwrap() as u32);
        let exponent = f32::from_bits(case["exponent_bits"].as_u64().unwrap() as u32);
        // Native fixtures capture the inputs before powf. This comparison
        // checks source conversion/composition using the same host powf;
        // it does not establish Windows CRT powf bit parity.
        let expected = 3.0 - 2.0 * retention.powf(exponent);
        let actual = if case["next_rank"].as_bool().unwrap() {
            loot_rewards::next_amulet_effect_multiplier(rarity, picks)
        } else {
            loot_rewards::amulet_effect_multiplier(rarity, picks)
        };
        assert_eq!(actual.to_bits(), expected.to_bits(), "{case}");
    }
}

#[test]
fn scorched_earth_keeps_native_hellfire_power_and_status_bindings() {
    let talents = &run_effects::catalog()
        .classes
        .iter()
        .find(|row| row.id == 9)
        .unwrap()
        .talents;
    assert!(
        talents
            .iter()
            .position(|row| row.key == "summon_infernal")
            .unwrap()
            < talents
                .iter()
                .position(|row| row.key == "aftermath")
                .unwrap()
    );
    let talent = talents.iter().find(|row| row.key == "aftermath").unwrap();
    assert_eq!(talent.name, "Scorched Earth");
    assert_eq!(talent.effects.len(), 2);
    for rank in 1..=5 {
        let mut effects = Effects::default();
        effects.talents = talent
            .effects
            .iter()
            .map(|row| EffectRow::talent(row, rank))
            .collect();
        effects.rebuild(None);
        for case in fixture()["scorched_earth_modifier_cases"]
            .as_array()
            .unwrap()
            .iter()
            .filter(|case| case["rank"] == rank)
        {
            let definition = AbilityDefinition::by_key(if case["matches"] == true {
                "hellfire"
            } else {
                "demonic_empowerment"
            })
            .unwrap();
            let modifiers = effects.spell_modifiers(definition);
            assert_eq!(
                modifiers.power.to_bits(),
                case["lane_bits"][0].as_u64().unwrap() as u32
            );
        }
        let status = &effects.rows[0];
        assert_eq!(status.tag(), 8);
        assert_eq!(
            status.float(4),
            f32::from_bits(0x3cf5_c28f) * f32::from(rank)
        );
        assert_eq!(status.word(8), 1);
        assert_eq!(status.float(12), 0.4);
        assert_eq!(status.float(16), 3.);
        let mut event = run_effects::conditions::Event {
            spell_id: 1949,
            kind: 0,
            first_periodic: true,
            ..Default::default()
        };
        let hellfire = AbilityDefinition::by_key("hellfire").unwrap();
        assert!(status.condition_matches(24, &event, Some(hellfire), 100., 100.));
        event.source_kind = 2;
        // The native Infernal owner captures/applies this status separately.
        assert!(!status.condition_matches(24, &event, Some(hellfire), 100., 100.));
    }
}
