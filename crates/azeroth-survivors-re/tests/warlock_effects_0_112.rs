//! Current native fixtures. These source regressions were not compiled or run.
use azeroth_survivors_re::{
    player_abilities::AbilityDefinition,
    run_effects::{self, EffectRow, Effects},
};

fn fixture() -> serde_json::Value {
    serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.112.0/warlock-talents/effect-cases.json"
    ))
    .unwrap()
}

fn talent(key: &str) -> &'static run_effects::Talent {
    run_effects::catalog()
        .classes
        .iter()
        .find(|class| class.id == 9)
        .unwrap()
        .talents
        .iter()
        .find(|talent| talent.key == key)
        .unwrap()
}

#[test]
fn current_payloads_match_native_rank_collector() {
    for case in fixture()["cases"].as_array().unwrap() {
        let Some(index) = case["source_effect_index"].as_u64() else {
            continue;
        };
        let definition = talent(case["key"].as_str().unwrap());
        let row = EffectRow::talent(
            &definition.effects[index as usize],
            case["rank"].as_u64().unwrap() as u8,
        );
        let native_tag = case["native_tag"].as_u64().unwrap() as u8;
        let source_tag = match native_tag {
            29..=35 => 253,
            36 => 30,
            37 => 31,
            tag => tag,
        };
        assert_eq!(row.tag(), source_tag, "{case}");
        if source_tag == 253 {
            assert_eq!(row.bytes[63], native_tag, "{case}");
        }
        if let Some(offset) = case["offset"].as_u64() {
            assert_eq!(
                row.float(offset as usize).to_bits(),
                case["value_bits"].as_u64().unwrap() as u32,
                "{case}"
            );
        }
        if let Some(rank) = case["rank_byte"].as_u64() {
            assert_eq!(row.bytes[1], rank as u8, "{case}");
        }
    }
}

#[test]
fn current_rank_weights_and_owned_selectors_reach_spell_lanes() {
    let collect = |key, rank| {
        let mut effects = Effects::default();
        effects.talents = talent(key)
            .effects
            .iter()
            .map(|payload| EffectRow::talent(payload, rank))
            .collect();
        effects.rebuild(None);
        effects
    };
    let bane = collect("bane", 3);
    for key in ["shadow_bolt", "immolate"] {
        let modifiers = bane.spell_modifiers(AbilityDefinition::by_key(key).unwrap());
        assert_eq!(modifiers.cooldown, 1.0 - 0.2_f32);
    }
    assert_eq!(
        bane.spell_modifiers(AbilityDefinition::by_key("hellfire").unwrap())
            .cooldown,
        1.0
    );
    let intensity = collect("intensity", 5);
    assert_eq!(
        intensity
            .spell_modifiers(AbilityDefinition::by_key("soul_fire").unwrap())
            .power,
        1.0 + 0.04_f32 * 5.0
    );
    assert!(
        intensity.stats.is_empty(),
        "Intensity no longer supplies its historical health stat"
    );
    let pain = collect("imp_searing_pain", 3);
    for key in ["searing_pain", "immolate"] {
        assert_eq!(
            pain.spell_modifiers(AbilityDefinition::by_key(key).unwrap())
                .power,
            1.0 + 0.08_f32 * 3.0
        );
    }
}
