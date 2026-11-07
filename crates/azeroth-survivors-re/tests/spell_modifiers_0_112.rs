//! Current evaluator fixtures. These source regressions were not compiled/run.
use azeroth_survivors_re::{
    loot_rewards::amulets,
    player_abilities::AbilityDefinition,
    run_effects::{self, EffectRow, Effects, Payload},
};
use serde_json::Value;

fn fixture() -> Value {
    serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/demonic-empowerment/spell-modifier-cases.json"
    ))
    .unwrap()
}

fn lanes(value: amulets::SpellModifiers) -> [u32; 7] {
    [
        value.power.to_bits(),
        value.cooldown.to_bits(),
        value.targets,
        value.area.to_bits(),
        value.duration.to_bits(),
        value.health_power.to_bits(),
        value.effect.to_bits(),
    ]
}

fn assert_native(value: amulets::SpellModifiers, case: &Value) {
    let expected: [u32; 7] =
        std::array::from_fn(|index| case["lane_bits"][index].as_u64().unwrap() as u32);
    assert_eq!(lanes(value), expected, "{case}");
}

fn row(payload: &Value) -> EffectRow {
    let payload: &'static Payload =
        Box::leak(Box::new(serde_json::from_value(payload.clone()).unwrap()));
    EffectRow::talent(payload, 1)
}

#[test]
fn seven_lanes_follow_current_all_key_list_school_and_kind_selectors() {
    let fixture = fixture();
    for case in fixture["selector_cases"].as_array().unwrap() {
        let definition = AbilityDefinition::by_key(case["ability_key"].as_str().unwrap()).unwrap();
        let mut effects = Effects::default();
        effects.talents.push(row(&case["payload"]));
        effects.rebuild(None);
        assert_native(effects.spell_modifiers(definition), case);
        let selector = match case["selector"].as_u64().unwrap() {
            0 => Some(amulets::Selector::All),
            1 => Some(amulets::Selector::Key {
                key: "shadow_bolt".into(),
            }),
            _ => None,
        };
        if let Some(selector) = selector {
            let mut aggregate = amulets::Aggregate::default();
            aggregate.spells.push((
                selector,
                case["modifier"].as_u64().unwrap() as u8,
                if case["modifier"] == 2 { 2.0 } else { 0.25 },
            ));
            assert_native(aggregate.spell_modifiers(definition), case);
        }
    }
    let case = &fixture["combined_case"];
    let mut effects = Effects::default();
    effects.talents = case["payloads"]
        .as_array()
        .unwrap()
        .iter()
        .map(row)
        .collect();
    effects.rebuild(None);
    assert_native(
        effects.spell_modifiers(AbilityDefinition::by_key("shadow_bolt").unwrap()),
        case,
    );
}

#[test]
fn current_talents_and_medallion_reach_the_same_native_modifier_lanes() {
    let catalog = run_effects::catalog();
    let talents = &catalog
        .classes
        .iter()
        .find(|class| class.id == 9)
        .unwrap()
        .talents;
    for case in fixture()["current_cases"].as_array().unwrap() {
        let mut effects = Effects::default();
        if let Some(key) = case["talent_key"].as_str() {
            let talent = talents.iter().find(|talent| talent.key == key).unwrap();
            effects.talents = talent
                .effects
                .iter()
                .map(|payload| EffectRow::talent(payload, case["rank"].as_u64().unwrap() as u8))
                .collect();
            effects.rebuild(None);
        } else {
            let definition = amulets::catalog()
                .by_key(case["amulet_key"].as_str().unwrap())
                .unwrap();
            effects.rebuild(Some((definition, definition.rarity, 1)));
        }
        assert_native(
            effects.spell_modifiers(
                AbilityDefinition::by_key(case["ability_key"].as_str().unwrap()).unwrap(),
            ),
            case,
        );
    }
}
