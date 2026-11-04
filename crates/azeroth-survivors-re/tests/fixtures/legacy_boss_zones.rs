use azeroth_survivors_re::bosses::catalog::ZoneDefinition;
use serde_json::Value;

/// Resolve pre-Scholomance fixture ordinals through the historical zone keys.
pub fn by_historical_ordinal() -> Vec<&'static ZoneDefinition> {
    let catalog: Value = serde_json::from_str(include_str!(
        "../../../../docs/analysis/evidence/0.97.2/bosses/catalog.json"
    ))
    .unwrap();
    catalog["zones"]
        .as_array()
        .unwrap()
        .iter()
        .map(|row| ZoneDefinition::by_key(row["key"].as_str().unwrap()).unwrap())
        .collect()
}
