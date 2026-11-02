//! Source regressions for the bounded 0.119.0 Rejuvenation contracts.
use azeroth_survivors_re::{
    player_abilities::{
        AbilityDefinition, RuntimeInstance,
        behavior::{buffs, state::Vitals},
        catalog::StatusEffect,
    },
    run_effects::healing,
};

fn vitals(health: f32, maximum_health: f32) -> Vitals {
    Vitals {
        health,
        maximum_health,
        absorb: 0.0,
        absorb_applied_at: 0.0,
        absorb_same_tick_count: 0,
    }
}

fn aura(source_guid: u64, expires_at: f32, healing_power: f32) -> buffs::Aura {
    buffs::Aura {
        source_guid,
        effect: StatusEffect { tag: 6, value: 0.3, duration: 0.0 },
        spell_id: 774,
        expires_at,
        healing_power,
    }
}

#[test]
fn five_sources_survive_another_casters_renewal() {
    let mut auras = vec![
        aura(0, 12.0, 12.0),
        aura(11, 13.0, 24.0),
        aura(22, 14.0, 36.0),
        aura(33, 15.0, 48.0),
        aura(44, 16.0, 60.0),
    ];
    let unchanged: Vec<_> = auras.iter().copied()
        .filter(|row| row.source_guid != 22).collect();
    let renewed = aura(22, 30.0, 200.0);
    buffs::refresh_aura(&mut auras, renewed);
    assert_eq!(auras.len(), 5);
    assert_eq!(auras.iter().filter(|row| row.source_guid == 22).count(), 1);
    assert_eq!(auras.last(), Some(&renewed));
    assert_eq!(auras.iter().copied().filter(|row| row.source_guid != 22)
        .collect::<Vec<_>>(), unchanged);
}

#[test]
fn self_recast_renews_only_source_zero() {
    let definition = AbilityDefinition::by_key("rejuvenation").unwrap();
    let instance = RuntimeInstance::learned(definition);
    let others = [aura(11, 13.0, 24.0), aura(22, 14.0, 36.0),
        aura(33, 15.0, 48.0), aura(44, 16.0, 60.0)];
    let mut auras = vec![aura(0, 12.0, 12.0)];
    auras.extend(others);
    let mut health = vitals(40.0, 100.0);
    let mut shield = buffs::ShieldReservation::default();
    let first = buffs::apply_self_buff(&instance, 10.0, false, 0.0,
        &mut health, &mut shield, &mut auras).unwrap();
    assert!(first.immediate_heal.is_none());
    assert_eq!(health.health, 40.0, "HoT creation must not apply an immediate heal");
    assert_eq!(auras.len(), 5);
    assert_eq!(&auras[..4], &others);
    assert_eq!(auras[4].source_guid, 0);
    assert_eq!(auras[4].spell_id, 774);
    assert!(auras[4].expires_at > 10.0);
    assert!(auras[4].healing_power > 0.0);
    let original_power = auras[4].healing_power;
    buffs::apply_self_buff(&instance, 11.0, false, 0.0,
        &mut health, &mut shield, &mut auras).unwrap();
    assert_eq!(auras.len(), 5);
    assert_eq!(&auras[..4], &others);
    assert_eq!(auras[4].source_guid, 0);
    assert_eq!(auras[4].healing_power, original_power);
    assert!(auras[4].expires_at > 27.0);
}

#[test]
fn other_spells_still_replace_all_sources_of_that_spell() {
    let mut first = aura(11, 13.0, 24.0);
    first.spell_id = 8936;
    let mut second = aura(22, 14.0, 36.0);
    second.spell_id = 8936;
    let preserved = aura(33, 15.0, 48.0);
    let mut auras = vec![first, preserved, second];
    let mut replacement = aura(44, 30.0, 200.0);
    replacement.spell_id = 8936;
    buffs::refresh_aura(&mut auras, replacement);
    assert_eq!(auras, [preserved, replacement]);
}

#[test]
fn five_independent_rows_tick_before_one_effective_healing_clamp() {
    let mut auras: Vec<_> = [0, 11, 22, 33, 44].into_iter()
        .map(|source| aura(source, 10.0, 100.0)).collect();
    let mut health = vitals(75.0, 100.0);
    let mut shield = buffs::ShieldReservation::default();
    let tick = buffs::tick_auras(&mut auras, 0.0, 1.0, &mut health, &mut shield);
    assert_eq!(tick.healing, [(774, 10.0); 5]);
    assert_eq!(auras.len(), 5);
    assert!(auras.iter().all(|row| row.healing_power == 90.0));
    let result = healing::apply_batch(&mut health, &[],
        &mut healing::HealingState::default(), 5.0, &tick.healing);
    assert_eq!(health.health, 100.0);
    assert_eq!(result.actual, 25.0);
    assert_eq!(result.regeneration, 5.0);
    assert_eq!(result.credits, [(774, 4.0); 5],
        "duplicate spell IDs must retain separate proportional credits");
}

#[test]
fn one_sources_expiry_does_not_remove_another_sources_remaining_heal() {
    let mut auras = vec![aura(0, 1.0, 10.0), aura(11, 3.0, 20.0)];
    let mut health = vitals(40.0, 100.0);
    let tick = buffs::tick_auras(&mut auras, 1.0, 1.0,
        &mut health, &mut buffs::ShieldReservation::default());
    assert_eq!(tick.healing, [(774, 10.0), (774, 10.0)]);
    assert_eq!(tick.expired, [774]);
    assert_eq!(auras, [aura(11, 3.0, 10.0)]);
}

#[test]
fn full_health_caster_can_cast_for_a_party_member_but_not_alone() {
    let definition = AbilityDefinition::by_key("rejuvenation").unwrap();
    let instance = RuntimeInstance::learned(definition);
    let mut health = vitals(100.0, 100.0);
    let mut shield = buffs::ShieldReservation::default();
    let mut auras = Vec::new();
    assert_eq!(buffs::apply_self_buff(&instance, 10.0, false, 0.0,
        &mut health, &mut shield, &mut auras),
        Err(buffs::BuffFailure::HealthAboveThreshold));
    assert!(auras.is_empty());
    let actions = buffs::apply_self_buff_with_party(&instance, 10.0,
        false, true, 0.0, &mut health, &mut shield, &mut auras).unwrap();
    assert!(actions.shared_healing.is_some());
    assert_eq!(auras.len(), 1);
    assert_eq!(auras[0].source_guid, 0);
    assert_eq!(health.health, 100.0);
}

#[test]
fn shared_coefficient_is_independent_of_casters_maximum_health() {
    let mut definition = *AbilityDefinition::by_key("rejuvenation").unwrap();
    definition.effect.value = 0.25;
    let mut instance = RuntimeInstance::learned(&definition);
    instance.power_multiplier = 4.0;
    instance.talent_power_multiplier = 9.0;
    let mut payloads = Vec::new();
    for maximum in [100.0, 1000.0] {
        let mut health = vitals(0.0, maximum);
        let mut auras = Vec::new();
        let actions = buffs::apply_self_buff(&instance, 10.0, false, 0.0,
            &mut health, &mut buffs::ShieldReservation::default(), &mut auras).unwrap();
        payloads.push(actions.shared_healing.unwrap());
        assert_eq!(auras[0].healing_power.to_bits(),
            ((maximum * 0.25) * (6.0_f32 * 1.4)).to_bits());
    }
    assert_eq!(payloads[0], payloads[1]);
    assert_eq!(payloads[0].coefficient.to_bits(), 2.1_f32.to_bits());
    assert_eq!(payloads[0].spell_id, 774);
}

#[test]
fn regrowth_heals_self_immediately_and_shares_its_raw_zero_duration() {
    let definition = AbilityDefinition::by_key("regrowth").unwrap();
    let instance = RuntimeInstance::learned(definition);
    let mut health = vitals(40.0, 100.0);
    let preserved = aura(11, 13.0, 24.0);
    let mut auras = vec![preserved];
    let actions = buffs::apply_self_buff(&instance, 10.0, false, 0.0,
        &mut health, &mut buffs::ShieldReservation::default(), &mut auras).unwrap();
    assert!(actions.immediate_heal.unwrap() > 0.0);
    assert!(!actions.aura_changed);
    assert_eq!(health.health, 40.0, "the real healing owner commits the immediate result");
    assert_eq!(auras, [preserved]);
    let shared = actions.shared_healing.unwrap();
    assert_eq!(shared.spell_id, 8936);
    assert_eq!(shared.duration.to_bits(), 0.0_f32.to_bits());
    assert!(shared.coefficient > 0.0);
}

#[test]
fn shared_receiver_uses_its_maximum_health_and_preserves_other_casters() {
    let local = aura(0, 12.0, 12.0);
    let other = aura(11, 13.0, 24.0);
    let mut auras = vec![local, other, aura(22, 14.0, 36.0)];
    let payload = buffs::SharedHealing { spell_id: 774, coefficient: 0.25, duration: 6.0 };
    assert_eq!(buffs::receive_shared_healing(&mut auras, 22, payload, 10.0, 240.0), None);
    assert_eq!(&auras[..2], &[local, other]);
    assert_eq!(auras.len(), 3);
    let received = auras[2];
    assert_eq!((received.source_guid, received.spell_id), (22, 774));
    assert_eq!((received.expires_at, received.healing_power), (16.0, 60.0));
    assert_eq!(received.effect, StatusEffect { tag: 6, value: 0.25, duration: 0.0 });
}

#[test]
fn nonpositive_shared_duration_requests_direct_healing_without_aura_mutation() {
    for duration in [0.0, -0.0, -1.0] {
        let preserved = aura(11, 13.0, 24.0);
        let mut auras = vec![preserved];
        let payload = buffs::SharedHealing { spell_id: 8936, coefficient: 0.25, duration };
        assert_eq!(buffs::receive_shared_healing(&mut auras, 22, payload, 10.0, 240.0), Some(60.0));
        assert_eq!(auras, [preserved]);
    }
}

#[test]
fn unordered_raw_duration_uses_the_native_immediate_heal_branch() {
    let mut definition = *AbilityDefinition::by_key("rejuvenation").unwrap();
    definition.duration = f32::NAN;
    let instance = RuntimeInstance::learned(&definition);
    let mut health = vitals(40.0, 100.0);
    let mut auras = Vec::new();
    let actions = buffs::apply_self_buff(&instance, 10.0, false, 0.0,
        &mut health, &mut buffs::ShieldReservation::default(), &mut auras).unwrap();
    assert!(actions.immediate_heal.is_some());
    assert!(auras.is_empty());
    let shared = actions.shared_healing.unwrap();
    assert!(shared.duration.is_nan());
    assert!(buffs::receive_shared_healing(&mut auras, 101, shared, 10.0, 200.0).is_some());
    assert!(auras.is_empty());
}
