use azeroth_survivors_re::player_abilities::{AbilityDefinition, RuntimeInstance, visual_scale};
use serde_json::Value;

fn f(value: &Value) -> f32 {
    value.as_f64().unwrap() as f32
}
fn u(value: &Value) -> u32 {
    value.as_u64().unwrap() as u32
}

#[test]
fn current_native_scale_table_vectors() {
    let fixture: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.105.0/spell-presentation/native.json"
    ))
    .unwrap();
    for case in fixture["scale_publication"].as_array().unwrap() {
        let rows = case["instances"].as_array().unwrap();
        let definitions: Vec<_> = rows
            .iter()
            .map(|row| {
                let mut definition = *AbilityDefinition::by_spell_id(u(&row[0])).unwrap();
                definition.kind = u(&row[1]) as u8;
                definition.range = f(&row[2]);
                definition.radius = f(&row[3]);
                definition
            })
            .collect();
        let instances: Vec<_> = definitions
            .iter()
            .zip(rows)
            .map(|(definition, row)| {
                let mut instance = RuntimeInstance::learned(definition);
                instance.area_multiplier = f(&row[4]);
                instance.talent_area_multiplier = f(&row[5]);
                instance
            })
            .collect();
        let mut calls = 0;
        let actual = visual_scale::collect_with_log1p(&instances, f(&case["global_area"]), |arg| {
            let call = &case["log1p_calls"][calls];
            calls += 1;
            assert_eq!(arg.to_bits(), u(&call[0]));
            f32::from_bits(u(&call[1]))
        });
        assert_eq!(calls, case["log1p_calls"].as_array().unwrap().len());
        assert_eq!(actual.len(), case["output"].as_array().unwrap().len());
        for (actual, expected) in actual.iter().zip(case["output"].as_array().unwrap()) {
            assert_eq!(
                (
                    actual.spell_id,
                    actual.scale.to_bits(),
                    u32::from(actual.attached)
                ),
                (u(&expected[0]), u(&expected[1]), u(&expected[2]))
            );
        }
    }
}
