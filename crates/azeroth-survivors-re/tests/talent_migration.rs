//! Current migration expectations use 0.112.0 native results for historical inputs.
//! The original 0.105.0 fixture remains unchanged. Unrun without compilation.
#[allow(dead_code)]
#[path = "../src/hero_name.rs"]
mod hero_name;
#[allow(dead_code)]
#[path = "../src/save.rs"]
mod save;

use save::{Save, talents};
use serde_json::Value;

fn fixtures() -> Value {
    serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/talent-allocations/migration-cases.json"
    ))
    .unwrap()
}

fn xp_for_points(points: u32) -> u32 {
    (0..points).map(|earned| 80 + 15 * earned).sum()
}

fn expected(case: &Value) -> Vec<(String, u8)> {
    case["normalized"]
        .as_array()
        .unwrap()
        .iter()
        .map(|row| {
            (
                row[0].as_str().unwrap().into(),
                row[1].as_u64().unwrap() as u8,
            )
        })
        .collect()
}

#[test]
fn current_native_migration_vectors_reach_load_import_all_specs_and_reopen() {
    for case in fixtures()["cases"].as_array().unwrap() {
        let class = case["class_id"].as_u64().unwrap() as u8;
        let points = case["budget"].as_u64().unwrap() as u32;
        let xp = xp_for_points(points);
        let raw = case["allocation"].as_str().unwrap();
        let expected = expected(case);
        let plain =
            format!("talent|{class}|{xp}|{raw}\nspec|{class}|2|{raw}|{raw}|{raw}\nstat|wins=7\n");
        let imported = Save::import(&save::seal_with_nonce(&plain, [17; 16])).unwrap();
        let loaded = Save::parse(&plain).unwrap();
        assert_eq!(
            loaded.plaintext(),
            case["canonical"].as_str().unwrap(),
            "{}",
            case["label"]
        );
        assert_eq!(
            loaded.plaintext(),
            imported.plaintext(),
            "{}",
            case["label"]
        );
        assert_eq!(loaded.talent_xp(class), u64::from(xp));
        assert_eq!(
            loaded.talent_allocation(class),
            expected,
            "{}",
            case["label"]
        );
        for slot in 0..3 {
            assert_eq!(loaded.talent_spec_allocation(class, slot), expected);
        }
        let allocation = expected.iter().cloned().collect();
        assert_eq!(
            points - talents::spent(talents::catalog().class(class), &allocation),
            case["unspent"].as_u64().unwrap() as u32
        );
        let reopened = Save::parse(&loaded.plaintext()).unwrap();
        assert_eq!(reopened.plaintext(), loaded.plaintext());
        assert!(reopened.plaintext().contains("stat|wins=7\n"));
    }
}

#[test]
fn removed_knowledge_is_refunded_without_renaming_or_reducing_xp() {
    let base = "demonic_familiar:5,demonic_embrace:5,fel_stamina:3,unholy_power:5";
    let xp = xp_for_points(51);
    let mut save = Save::parse(&format!(
        "talent|9|{xp}|{base},felfire_training:3,demonic_knowledge:3\n\
         spec|9|1|{base},imp_shadow_bolt:5,bane:5,aftermath:5|demonic_knowledge:3|{base},soul_link:3\n\
         talent|1|80|imp_heroic:1\n"
    ))
    .unwrap();
    assert_eq!(save.talent_spec(9), 1);
    assert!(
        save.talent_allocation(9)
            .contains(&("felfire_training".into(), 3))
    );
    assert!(!save.plaintext().contains("demonic_knowledge"));
    assert!(!save.plaintext().contains("demonic_supremacy"));
    let live = save.talent_allocation(9);
    assert!(save.select_talent_spec(9, 0).unwrap());
    assert_eq!(save.talent_spec_allocation(9, 1), live);
    assert!(save.talent_allocation(9).contains(&("aftermath".into(), 5)));
    assert_eq!(save.talent_xp(9), u64::from(xp));
    assert_eq!(save.talent_allocation(1), [("imp_heroic".into(), 1)]);
    assert_eq!(save.talent_xp(1), 80);
    assert!(save.select_talent_spec(9, 2).unwrap());
    assert!(save.talent_allocation(9).contains(&("soul_link".into(), 3)));
}

#[test]
fn refunded_points_can_buy_supremacy_and_gate_refunds_keep_dependencies() {
    let class = talents::catalog().class(9);
    let tree = &class.trees[1];
    let find = |key: &str| tree.talents.iter().find(|row| row.key == key).unwrap();
    let mut save = Save::parse(&format!(
        "talent|9|{}|demonic_familiar:5,demonic_embrace:5,fel_stamina:3,unholy_power:5,\
         soul_link:3,felfire_training:3,master_demonologist:3,legion_gate:1,demonic_knowledge:3\n",
        xp_for_points(51)
    ))
    .unwrap();
    let mut allocation: talents::Allocation = save.talent_allocation(9).into_iter().collect();
    assert!(talents::can_learn(
        class,
        tree,
        find("demonic_supremacy"),
        &allocation,
        51
    ));
    assert!(!talents::can_refund(class, find("soul_link"), &allocation));
    assert!(talents::can_refund(class, find("legion_gate"), &allocation));
    allocation.remove("legion_gate");
    assert!(talents::can_refund(class, find("soul_link"), &allocation));
    allocation.insert("demonic_supremacy".into(), 1);
    let xp = save.talent_xp(9) as u32;
    save.set_talent_allocation(9, xp, &allocation.into_iter().collect::<Vec<_>>())
        .unwrap();
    assert!(
        save.talent_allocation(9)
            .contains(&("demonic_supremacy".into(), 1))
    );
    assert_eq!(save.talent_xp(9), u64::from(xp));
}
