//! Historical0.109.0 RunMods display rules (14590e3c0 and14590e4a0).
//! The current Difficulty menu and live run input use Heroic rank instead.
//! Native ranges/steps/input and numeric vectors: docs/analysis/run-options-0.109.0.md.

/// The difficulty value keeps growing after the reward cap.
pub fn difficulty(percentages: [u16; 4]) -> f32 {
    let increase = percentages.map(|value| (f32::from(value) - 100.0) / 100.0);
    // Preserve the native scalar addition order following its packed float operations.
    let density_health = increase[1] * 0.4 + increase[0] * 0.05;
    let damage = density_health + increase[2] * 0.6;
    increase[3] * 2.0 + damage + 1.0
}

pub fn reward(percentages: [u16; 4]) -> f32 {
    difficulty(percentages).min(2.0)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn formulas_match_historical_native_vectors() {
        let vectors: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.109.0/runmods/native-vectors.json"
        )).unwrap();
        for row in vectors["formulas"].as_array().unwrap() {
            let values = std::array::from_fn(|index| row["values"][index].as_u64().unwrap() as u16);
            assert_eq!(format!("{:08x}", difficulty(values).to_bits()), row["difficulty_bits"]);
            assert_eq!(format!("{:08x}", reward(values).to_bits()), row["reward_bits"]);
        }
    }
}
