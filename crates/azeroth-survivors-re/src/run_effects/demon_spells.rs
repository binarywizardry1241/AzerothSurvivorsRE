//! Current0.112.0 Infernal/Doomguard/Pit Lord spell scaling. These consumers
//! share learned-spell power without installing a learned spell or its timer.
use crate::{
    loot_rewards::amulets::SpellModifiers,
    player_abilities::{
        AbilityDefinition, RuntimeInstance,
        damage::{self, PowerContext},
    },
};

/// Current145939fb0 copies the complete matching learned instance, including
/// rank, upgrades and current modifier lanes. An unlearned proxy starts fresh,
/// applies current modifiers, then replaces only power with the ordered mean.
pub fn proxy(
    key: &str,
    learned: &[RuntimeInstance<'_>],
    modifiers: SpellModifiers,
) -> RuntimeInstance<'static> {
    let definition = AbilityDefinition::by_key(key).expect("recovered demon spell definition");
    if let Some(instance) = learned.iter().find(|row| row.definition.key == key) {
        return RuntimeInstance {
            definition,
            rank: instance.rank,
            remaining: instance.remaining,
            power_multiplier: instance.power_multiplier,
            cooldown_multiplier: instance.cooldown_multiplier,
            target_bonus: instance.target_bonus,
            area_multiplier: instance.area_multiplier,
            duration_multiplier: instance.duration_multiplier,
            upgrade_counts: instance.upgrade_counts,
            talent_power_multiplier: instance.talent_power_multiplier,
            talent_cooldown_multiplier: instance.talent_cooldown_multiplier,
            talent_target_bonus: instance.talent_target_bonus,
            talent_area_multiplier: instance.talent_area_multiplier,
            talent_duration_multiplier: instance.talent_duration_multiplier,
            health_power: instance.health_power,
            effect_multiplier: instance.effect_multiplier,
        };
    }
    let mut result = RuntimeInstance::learned(definition);
    modifiers.apply(&mut result);
    result.power_multiplier = fallback_power(learned);
    result
}

fn fallback_power(learned: &[RuntimeInstance<'_>]) -> f32 {
    if learned.is_empty() { return 1.0; }
    let sum = learned.iter().fold(-0.0_f32, |sum, row| sum + row.power_multiplier);
    (sum / learned.len() as f32).max(1.0)
}

/// Doomguard reads learned power/cooldown but evaluates fresh current modifiers;
/// Pit Lord reads learned power/targets and supplies neutral modifier lanes.
/// These owners do not use the full learned clone used by Coil.
pub fn direct_proxy(
    key: &str,
    learned: &[RuntimeInstance<'_>],
    modifiers: SpellModifiers,
) -> RuntimeInstance<'static> {
    let definition = AbilityDefinition::by_key(key).expect("recovered demon spell definition");
    let mut result = RuntimeInstance::learned(definition);
    if let Some(instance) = learned.iter().find(|row| row.definition.key == key) {
        result.power_multiplier = instance.power_multiplier;
        result.cooldown_multiplier = instance.cooldown_multiplier;
        result.target_bonus = instance.target_bonus;
    } else {
        result.power_multiplier = fallback_power(learned);
    }
    modifiers.apply(&mut result);
    result
}

/// Current14595c078..14595c182 admits only Fire-school power modifiers.
/// Keyed or unconditional spell modifiers do not strengthen native Imp bolts.
pub fn imp_fire_multiplier(rows: &[super::EffectRow]) -> f32 {
    rows.iter().filter(|row| row.tag() == 31 && row.bytes[8] == 3
        && row.bytes[9] == 2 && row.bytes[36] == 0)
        .fold(-0.0, |sum, row| sum + row.float(32)) + 1.0
}

/// Current14595abf0 pulse reads learned power/area and evaluates fresh modifiers.
/// Its independent main-tick clock reads learned cooldown through direct_proxy.
pub fn infernal_proxy(
    learned: &[RuntimeInstance<'_>],
    modifiers: SpellModifiers,
) -> RuntimeInstance<'static> {
    let definition = AbilityDefinition::by_key("hellfire").expect("current Hellfire");
    let mut result = RuntimeInstance::learned(definition);
    if let Some(instance) = learned.iter().find(|row| row.definition.key == "hellfire") {
        result.power_multiplier = instance.power_multiplier;
        result.area_multiplier = instance.area_multiplier;
    } else {
        result.power_multiplier = fallback_power(learned);
    }
    modifiers.apply(&mut result);
    result
}

///145950159..1ed. The descriptor scalar is applied after the complete spell
/// power expression, before the common demon power/critical owner.
pub fn power(instance: &RuntimeInstance<'_>, context: &PowerContext, descriptor: f32) -> f32 {
    damage::effective_power(instance, context) * descriptor
}

/// The native radius keeps learned area and current effect modifiers, followed
/// by the common70-yard logarithmic soft cap.
pub fn infernal_radius(instance: &RuntimeInstance<'_>, global_area: f32) -> f32 {
    crate::player_abilities::behavior::periodic::area_radius(instance, global_area)
}

/// Current 14593011c..1459301c8 uses the same Hellfire interval as the
/// player, with an independent half-second lower bound.
pub fn infernal_interval(instance: &RuntimeInstance<'_>, global_cooldown: f32) -> f32 {
    damage::base_interval(instance, global_cooldown).max(0.5)
}

///145950423..4ec (Doomguard) and145951622..164b (Pit Lord). Pit Lord
/// adds two bolts and intentionally ignores spell-modifier target bonuses.
pub fn target_count(instance: &RuntimeInstance<'_>, global: u32, pit_lord: bool) -> u32 {
    if instance.definition.targets == 0 {
        return if pit_lord { 3 } else { 1 };
    }
    let total = instance
        .definition
        .targets
        .wrapping_add(instance.target_bonus)
        .wrapping_add(global)
        .wrapping_add(if pit_lord {
            0
        } else {
            instance.talent_target_bonus
        });
    let admitted = total.wrapping_add(u32::from(total == 0));
    admitted.wrapping_add(if pit_lord { 2 } else { 0 })
}

///145950241..2da. Only an admitted elite/primary boss accrues focus. The
/// current cast uses the previous count; echoes read it without advancing it.
pub fn doomguard_focus(
    previous: &mut Option<u64>,
    count: &mut u32,
    target: u64,
    eligible: bool,
    echo: bool,
    rank: u8,
) -> f32 {
    let same = eligible && *previous == Some(target);
    let bonus = if same {
        let cap = u32::from(rank.clamp(1, 3)) + 2;
        (*count).min(cap) as f32 * 0.2
    } else {
        0.0
    };
    if !echo {
        *previous = eligible.then_some(target);
        *count = if eligible {
            if same { count.wrapping_add(1) } else { 1 }
        } else {
            0
        };
    }
    bonus
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn historical_native_power_vectors_match_float_bits() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.105.0/demon-spells/native-vectors.json"
        ))
        .unwrap();
        assert_eq!(fixture["target_sha256"], super::super::pets::TARGET_SHA256);
        for row in fixture["cases"]["power"].as_array().unwrap() {
            let f = |key: &str| f32::from_bits(row[key].as_u64().unwrap() as u32);
            let mut instance = RuntimeInstance::learned(
                AbilityDefinition::by_key(row["key"].as_str().unwrap()).unwrap(),
            );
            instance.power_multiplier = f("coefficient_bits");
            instance.talent_power_multiplier = f("modifier_bits");
            instance.health_power = f("health_modifier_bits");
            let actual = power(
                &instance,
                &PowerContext {
                    maximum_health: f("health_bits"),
                    damage_multiplier: f("damage_bits"),
                },
                f("descriptor_bits"),
            );
            assert_eq!(
                actual.to_bits(),
                row["output_bits"].as_u64().unwrap() as u32
            );
        }

    }

    #[test]
    fn historical_target_count_and_fallback_vectors_match() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.105.0/demon-spells/native-vectors.json"
        ))
        .unwrap();
        for row in fixture["cases"]["targets"].as_array().unwrap() {
            let mut definition = *AbilityDefinition::by_key("shadow_bolt").unwrap();
            definition.targets = row["base"].as_u64().unwrap() as u32;
            let mut instance = RuntimeInstance::learned(&definition);
            instance.target_bonus = row["learned"].as_u64().unwrap() as u32;
            instance.talent_target_bonus = row["modifiers"].as_u64().unwrap() as u32;
            assert_eq!(
                target_count(
                    &instance,
                    row["global_count"].as_u64().unwrap() as u32,
                    row["pit_lord"].as_bool().unwrap()
                ),
                row["output"].as_u64().unwrap() as u32
            );
        }
        for row in fixture["cases"]["fallback"].as_array().unwrap() {
            let learned = row["input_bits"]
                .as_array()
                .unwrap()
                .iter()
                .map(|value| {
                    let mut spell =
                        RuntimeInstance::learned(AbilityDefinition::by_key("corruption").unwrap());
                    spell.power_multiplier = f32::from_bits(value.as_u64().unwrap() as u32);
                    spell
                })
                .collect::<Vec<_>>();
            assert_eq!(
                proxy("shadow_bolt", &learned, SpellModifiers::default())
                    .power_multiplier
                    .to_bits(),
                row["output_bits"].as_u64().unwrap() as u32
            );
        }
    }

    #[test]
    fn unlearned_demon_spells_use_ordered_mean_without_copying_other_upgrades() {
        let mut rows = vec![
            RuntimeInstance::learned(AbilityDefinition::by_key("corruption").unwrap()),
            RuntimeInstance::learned(AbilityDefinition::by_key("immolate").unwrap()),
        ];
        rows[0].power_multiplier = 1.5;
        rows[1].power_multiplier = 2.5;
        rows[0].target_bonus = 8;
        let unlearned = proxy("shadow_bolt", &rows, SpellModifiers::default());
        assert_eq!(unlearned.power_multiplier, 2.0);
        assert_eq!(unlearned.target_bonus, 0);
        assert_eq!(unlearned.area_multiplier, 1.0);
        let own = proxy("corruption", &rows, SpellModifiers::default());
        assert_eq!(own.power_multiplier, 1.5);
        assert_eq!(own.target_bonus, 8);
    }

    #[test]
    fn current_native_infernal_pulse_deadlines_match_float_bits() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.112.0/demon-spell-math/native-vectors.json"
        )).unwrap();
        assert_eq!(fixture["target_sha256"], super::super::demons::TARGET_SHA256);
        assert_eq!(fixture["interval"].as_array().unwrap().len(), 252);
        for row in fixture["interval"].as_array().unwrap() {
            let f = |key: &str| f32::from_bits(row[key].as_u64().unwrap() as u32);
            let mut instance = RuntimeInstance::learned(AbilityDefinition::by_key("hellfire").unwrap());
            instance.cooldown_multiplier = f("cooldown_bits");
            instance.talent_cooldown_multiplier = f("modifier_bits");
            let deadline = f("now_bits") + infernal_interval(&instance, f("global_bits"));
            assert_eq!(deadline.to_bits(), row["deadline_bits"].as_u64().unwrap() as u32, "{row}");
        }
    }

    #[test]
    fn current_native_focus_rank_caps_resets_and_wrapping_match() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.112.0/demon-spell-math/native-vectors.json"
        )).unwrap();
        assert_eq!(fixture["focus"].as_array().unwrap().len(), 280);
        for row in fixture["focus"].as_array().unwrap() {
            let mut previous = Some(row["previous"].as_u64().unwrap());
            let mut count = row["count"].as_u64().unwrap() as u32;
            let bonus = doomguard_focus(&mut previous, &mut count,
                row["target"].as_u64().unwrap(), row["eligible"].as_bool().unwrap(), false,
                row["rank"].as_u64().unwrap_or(0) as u8);
            assert_eq!(bonus.to_bits(), row["bonus_bits"].as_u64().unwrap() as u32, "{row}");
            assert_eq!(previous.unwrap_or(0), row["next_previous"].as_u64().unwrap(), "{row}");
            assert_eq!(count, row["next_count"].as_u64().unwrap() as u32, "{row}");
        }
    }

    #[test]
    fn current_imp_fire_selector_and_complete_power_order_match_native() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.112.0/demon-spell-math/native-additional-cases.json"
        )).unwrap();
        assert_eq!(fixture["imp"].as_array().unwrap().len(), 480);
        for row in fixture["imp"].as_array().unwrap() {
            let f = |value: &serde_json::Value| f32::from_bits(value.as_u64().unwrap() as u32);
            let effects = row["modifiers"].as_array().unwrap().iter().map(|item| {
                let mut bytes = [0; 64];
                bytes[0] = 31;
                bytes[8] = item["kind"].as_u64().unwrap() as u8;
                bytes[9] = item["school"].as_u64().unwrap() as u8;
                bytes[36] = item["lane"].as_u64().unwrap() as u8;
                bytes[32..36].copy_from_slice(&f(&item["amount_bits"]).to_le_bytes());
                super::super::EffectRow { bytes, strings: &[], lists: &[] }
            }).collect::<Vec<_>>();
            let familiar = row["stats"].as_array().unwrap().iter()
                .filter(|item| item["tag"].as_u64() == Some(30))
                .fold(-0.0, |sum, item| sum + f(&item["amount_bits"]));
            let definition = super::super::pets::definition(9512).unwrap();
            assert_eq!(definition.damage.to_bits(), row["descriptor_damage_bits"].as_u64().unwrap() as u32);
            let power = super::super::demons::common_base(definition,
                row["level"].as_u64().unwrap() as u32, f(&row["global_damage_bits"]), 1.0)
                * (familiar + 1.0) * imp_fire_multiplier(&effects);
            assert_eq!(power.to_bits(), row["power_bits"].as_u64().unwrap() as u32, "{row}");
        }
    }

    #[test]
    fn current_infernal_visual_uses_fresh_area_modifiers() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.112.0/demon-spell-math/native-additional-cases.json"
        )).unwrap();
        for row in fixture["visual"].as_array().unwrap().iter()
            .filter(|row| row["special"].as_u64() == Some(6)) {
            let f = |value: &serde_json::Value| f32::from_bits(value.as_u64().unwrap() as u32);
            let learned = row["learned_area_bits"].as_u64().map(|bits| {
                let mut instance = RuntimeInstance::learned(AbilityDefinition::by_key("hellfire").unwrap());
                instance.area_multiplier = f32::from_bits(bits as u32);
                instance.talent_area_multiplier = 9.0; // stale cached lane must be ignored
                instance
            }).into_iter().collect::<Vec<_>>();
            let instance = infernal_proxy(&learned, SpellModifiers {
                area: f(&row["modifier_area_bits"]), ..Default::default()
            });
            let scale = infernal_radius(&instance, f(&row["global_area_bits"])) / 10.0;
            let expected = f(&row["rows"][0]["scale_bits"]);
            assert!((scale - expected).abs() <= expected.abs().max(1.0) * 0.000001, "{row}");
        }
    }
}
