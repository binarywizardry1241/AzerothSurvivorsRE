//! Combat-pet power, recovered from the historical 0.105.0 EXE.
//! Current ordinary contracts: docs/analysis/ordinary-weapons-pets-0.110.0.md.
//!
//! Melee owner145906479..145906a0d and ranged owner1459062ef..14590634b.
//! Stat17 is read here, rather than by the ordinary spell-power consumer.

/// Both attack paths read the ordered current stat vector afresh. Keep each
/// multiply separate: the native level growth is additional to run damage.
pub fn attack_power(base: f32, level: u32, damage: f32, stats: &[(u8, f32)]) -> f32 {
    let bonus = stats
        .iter()
        .filter(|(tag, _)| *tag == 17)
        .fold(-0.0_f32, |sum, (_, value)| sum + value);
    let growth = level as f32 - 1.0;
    let growth = growth * 0.12;
    let growth = growth + 1.0;
    let power = base * growth;
    let power = power * damage;
    power * (bonus + 1.0)
}

/// Equality is an ordinary hit. Negative/zero power is passed to the canonical
/// hit owner, which owns its minimum-damage rule.
pub fn critical_power(power: f32, chance: f32, multiplier: f32, draw: f32) -> f32 {
    if chance > draw {
        power * multiplier
    } else {
        power
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde::Deserialize;

    #[derive(Deserialize)]
    struct Fixture {
        target_sha256: String,
        cases: Vec<Case>,
    }
    #[derive(Deserialize)]
    struct Case {
        rows: Vec<(u8, u32)>,
        level: u32,
        base_bits: u32,
        damage_bits: u32,
        chance_bits: u32,
        draw_bits: u32,
        critical_multiplier_bits: u32,
        power_bits: u32,
        ranged_power_bits: u32,
        ranged_critical_bits: u32,
    }

    #[test]
    fn melee_and_ranged_match_unchanged_selected_instructions() {
        let fixtures: Fixture = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/power-scaling/pet-power/native-power.json"
        ))
        .unwrap();
        assert_eq!(
            fixtures.target_sha256,
            "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
        );
        assert_eq!(fixtures.cases.len(), 288);
        for case in fixtures.cases {
            let rows = case
                .rows
                .iter()
                .map(|&(tag, bits)| (tag, f32::from_bits(bits)))
                .collect::<Vec<_>>();
            let power = attack_power(
                f32::from_bits(case.base_bits),
                case.level,
                f32::from_bits(case.damage_bits),
                &rows,
            );
            let multiplier = f32::from_bits(case.critical_multiplier_bits);
            assert_eq!(power.to_bits(), case.ranged_power_bits);
            assert_eq!((power * multiplier).to_bits(), case.ranged_critical_bits);
            assert_eq!(
                critical_power(
                    power,
                    f32::from_bits(case.chance_bits),
                    multiplier,
                    f32::from_bits(case.draw_bits)
                )
                .to_bits(),
                case.power_bits
            );
        }
    }
}
