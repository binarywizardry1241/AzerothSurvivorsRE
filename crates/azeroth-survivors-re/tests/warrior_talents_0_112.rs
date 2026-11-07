//! Current native fixtures; these source regressions require compilation to run.
use azeroth_survivors_re::{
    player_abilities::damage::{self, Victim, VictimContext},
    run_effects,
};
use serde_json::Value;

fn fixtures() -> Value {
    serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/warrior-talents/native-cases.json"
    ))
    .unwrap()
}

#[test]
fn current_warrior_rank_payloads_reach_equipped_stat_lanes() {
    let catalog = run_effects::catalog();
    let warrior = catalog.classes.iter().find(|class| class.id == 1).unwrap();
    for case in fixtures()["rank_cases"].as_array().unwrap() {
        let talent = warrior
            .talents
            .iter()
            .find(|talent| talent.key == case["key"].as_str().unwrap())
            .unwrap();
        let row = run_effects::EffectRow::talent(
            &talent.effects[0],
            case["rank"].as_u64().unwrap() as u8,
        );
        let mut effects = run_effects::Effects::default();
        effects.talents.push(row);
        effects.rebuild(None);
        let stat = case["stat"].as_u64().unwrap() as u8;
        assert_eq!(
            effects.sum(stat).to_bits(),
            case["amount_bits"].as_u64().unwrap() as u32
        );
        assert_eq!(
            effects.sum(16),
            0.0,
            "Warrior replacements no longer add weapon power"
        );
    }
}

#[test]
fn victim_periodic_state_matches_current_native_damage_prefix() {
    for case in fixtures()["damage_cases"].as_array().unwrap() {
        let rank = case["rank"].as_u64().unwrap() as f32;
        let count = case["periodic_rows"].as_u64().unwrap();
        let context = case["context"].as_str().unwrap();
        let active = |name| context == name || context == "combined";
        let mut effects = vec![
            (21, 0.03_f32 * rank),
            (23, 0.3),
            (16, 0.25),
            (18, 0.1),
            (19, 0.2),
            (20, 0.3),
            (28, 0.4),
        ];
        if context == "duplicates" {
            effects.extend([(21, 0.02), (21, -0.01)]);
        }
        let victim = Victim {
            health: if active("execute") { 29.0 } else { 100.0 },
            maximum_health: 100.0,
            primary_boss: active("boss"),
            // Guardian membership must not independently enable Trauma.
            guardian: true,
            has_periodic: count != 0,
            native_flag_158: 0,
            slow_until: 0.0,
            stun_until: if active("control") { 11.0 } else { 0.0 },
            forced_escape_until: 0.0,
            vulnerability: 0.125,
            vulnerability_until: if active("vulnerable") { 11.0 } else { 0.0 },
            demoralizing_amplification: 0.0,
            additional_damage_taken: if context == "combined" { 0.03125 } else { 0.0 },
            dead: false,
        };
        let result = damage::victim_multiplier(
            &victim,
            &VictimContext {
                run_state: 1,
                now: 10.0,
                player_absorb: if active("shield") { 10.0 } else { 0.0 },
                talent_effects: &effects,
                spell_amplification: 0.0,
                elemental_sunder: 0.0,
                packlord_amplification: 0.0,
            },
        );
        assert_eq!(
            result.to_bits(),
            case["multiplier_bits"].as_u64().unwrap() as u32,
            "rank {rank}, rows {count}, context {context}"
        );
    }
}

#[test]
fn bloodlust_shield_matches_native_order_and_reserved_expiry() {
    use azeroth_survivors_re::player_abilities::behavior::{buffs, state::Vitals};
    use azeroth_survivors_re::player_abilities::{AbilityDefinition, RuntimeInstance};
    let fixture: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/buff-potency/bounded-cases.json"
    ))
    .unwrap();
    for case in fixture["cases"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|case| case["kind"] == "shield_full_order")
    {
        let f = |key: &str| case[key].as_f64().unwrap() as f32;
        let mut definition = *AbilityDefinition::by_key("pw_shield").unwrap();
        definition.effect.value = f("effect");
        let mut instance = RuntimeInstance::learned(&definition);
        instance.effect_multiplier = f("effect_multiplier");
        instance.power_multiplier = f("power");
        instance.talent_power_multiplier = f("talent_power");
        let mut vitals = Vitals {
            health: f("maximum_health"),
            maximum_health: f("maximum_health"),
            absorb: 0.0,
            absorb_applied_at: 0.0,
            absorb_same_tick_count: 0,
        };
        let mut shield = buffs::ShieldReservation::default();
        let mut auras = Vec::new();
        let actions = buffs::apply_self_buff(
            &instance,
            10.0,
            false,
            f("buff_bonus"),
            &mut vitals,
            &mut shield,
            &mut auras,
        )
        .unwrap();
        assert!(actions.absorb_changed);
        assert_eq!(shield.amount.to_bits(), f("native_amount").to_bits());
        assert_eq!(vitals.absorb.to_bits(), shield.amount.to_bits());
        let expires = auras[0].expires_at;
        assert_eq!(
            buffs::apply_self_buff(
                &instance,
                10.0,
                false,
                f("buff_bonus"),
                &mut vitals,
                &mut shield,
                &mut auras
            ),
            Err(buffs::BuffFailure::AlreadyActive)
        );
        buffs::tick_auras(&mut auras, expires, 0.1, &mut vitals, &mut shield);
        assert_eq!(vitals.absorb, 0.0);
        assert_eq!(shield, buffs::ShieldReservation::default());
    }
}
