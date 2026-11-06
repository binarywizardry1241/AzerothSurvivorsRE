//! Live source integration regressions for the current shared-heal owner.
use super::*;
use super::rng_integration::{TerrainFixture, class_run};

fn druid() -> Mechanics {
    let mut game = class_run("druid", 0);
    game.set_store_levels(true);
    game.abilities = vec![RuntimeInstance::learned(
        AbilityDefinition::by_key("rejuvenation").unwrap(),
    )];
    game.abilities[0].remaining = 0.0;
    game.execution.vitals.health = 40.0;
    game.execution.vitals.maximum_health = 100.0;
    game
}

fn guid(slot: u8) -> u64 {
    100 + u64::from(slot) * 100
}

fn party(count: u8) -> Mechanics {
    assert!((2..=5).contains(&count));
    let mut game = druid();
    game.player_guid = guid(0);
    game.set_party_local_name("Druid 0".into());
    let center: Position = game.zone.center.into();
    for slot in 1..count {
        game.admit_party_hero(slot, guid(slot), format!("Druid {slot}"),
            druid(), center, 0.0).unwrap();
    }
    game.party_input(0, PartyInput {
        position: center, facing: 0.0, velocity: [0.0; 2],
    });
    for (slot, _) in game.party_members() {
        game.with_party_hero(slot, |hero| {
            hero.execution.vitals.health = 40.0;
            hero.execution.vitals.maximum_health = 100.0;
            hero.abilities[0].remaining = 0.0;
        }).unwrap();
    }
    game.events.clear();
    game.take_party_events();
    game
}

fn set_casts(game: &mut Mechanics, casting: &[u8]) {
    for (slot, _) in game.party_members() {
        game.with_party_hero(slot, |hero| {
            hero.abilities[0].remaining = if casting.contains(&slot) {
                0.0
            } else {
                f32::INFINITY
            };
        }).unwrap();
    }
}

fn tick(game: &mut Mechanics) {
    let input = game.party_pose(0).unwrap();
    game.tick_party(0.01, input.position, input.velocity, input.facing,
        &mut TerrainFixture);
}

fn rejuvenations(game: &mut Mechanics, slot: u8) -> Vec<buffs::Aura> {
    game.with_party_hero(slot, |hero| hero.execution.auras.iter()
        .filter(|row| row.spell_id == 774).copied().collect()).unwrap()
}

#[test]
fn stoneform_cast_shields_a_party_recipient_using_their_maximum_health() {
    let mut game = party(2);
    set_casts(&mut game, &[]);
    let mut racial = RuntimeInstance::learned(racial_definition(3).unwrap());
    racial.remaining = 0.0;
    game.racial = Some(racial);
    game.with_party_hero(1, |hero| {
        hero.execution.vitals.maximum_health = 200.0;
    }).unwrap();
    tick(&mut game);

    assert!((game.execution.vitals.absorb - 63.0).abs() < 0.0001);
    game.with_party_hero(1, |hero| {
        assert!((hero.execution.vitals.absorb - 126.0).abs() < 0.0001);
        assert_eq!(hero.execution.shield.spell_id, 20594);
        let aura = hero.execution.auras.iter().find(|aura| aura.spell_id == 20594).unwrap();
        assert_eq!(aura.source_guid, 0);
        assert_eq!(aura.expires_at, hero.clock + 8.0_f32 * 1.4);
    }).unwrap();
}

#[test]
fn ice_barriers_share_capacity_through_damage_stat_refresh_and_expiry() {
    let mut game = party(3);
    set_casts(&mut game, &[]);
    game.with_party_hero(1, |hero| {
        hero.execution.vitals.absorb = 20.0;
    }).unwrap();
    for slot in [0, 2] {
        game.with_party_hero(slot, |hero| {
            let definition = AbilityDefinition::by_key("ice_barrier").unwrap();
            hero.abilities[0] = RuntimeInstance::learned(definition);
            hero.abilities[0].remaining = 0.0;
        }).unwrap();
    }
    tick(&mut game);

    assert_eq!(game.execution.vitals.absorb, 100.0);
    game.with_party_hero(1, |hero| {
        let execution = &mut hero.execution;
        assert_eq!(execution.vitals.absorb, 120.0);
        assert_eq!(execution.auras.iter().filter(|aura| aura.spell_id == 11426).count(), 1);
        assert_eq!(execution.shield.spell_id, 11426);
        let depletion = behavior::incoming::apply_damage(
            &mut execution.vitals, &mut execution.shield, &mut execution.auras,
            &mut hero.effect_state.incoming, hero.clock, 65.0, 0.0,
        ).unwrap();
        assert_eq!(depletion.removed_auras, [11426]);
        assert_eq!(execution.vitals.absorb, 55.0);

        let mut barrier = RuntimeInstance::learned(AbilityDefinition::by_key("ice_barrier").unwrap());
        barrier.effect_multiplier = 4.0;
        buffs::apply_self_buff(
            &barrier, hero.clock, true, 0.0, &mut execution.vitals, &mut execution.shield,
            &mut execution.auras,
        ).unwrap();
        assert_eq!(execution.shield.amount, 100.0);
        assert_eq!(execution.vitals.absorb, 120.0);

        let damage = behavior::incoming::apply_damage(
            &mut execution.vitals, &mut execution.shield, &mut execution.auras,
            &mut hero.effect_state.incoming, hero.clock, 10.0, 0.0,
        ).unwrap();
        assert_eq!(damage.absorbed, 10.0);
        assert_eq!(execution.vitals.absorb, 110.0);

        let mut numeric = hero.effect_state.numeric;
        numeric.health = 40.0;
        effects::EffectsState::apply_health(
            execution, &mut hero.effect_state.incoming.soul_link_absorb, &numeric,
            &hero.effect_state.equipped,
        );
        assert_eq!(execution.vitals.absorb, 60.0);
        assert_eq!(execution.shield.amount, 40.0);
        let expires = execution.auras.iter().find(|aura| aura.spell_id == 11426)
            .unwrap().expires_at;
        let expired = buffs::tick_auras(
            &mut execution.auras, expires, 0.01, &mut execution.vitals, &mut execution.shield,
        );
        assert!(expired.expired.contains(&11426));
        assert_eq!(execution.vitals.absorb, 20.0);
        assert_eq!(execution.shield, buffs::ShieldReservation::default());
    }).unwrap();
}

#[test]
fn priest_talisman_caps_cast_and_recipient_absorb_without_growing_unreserved_shields() {
    use azeroth_survivors_re::loot_rewards::amulets;

    let talisman = amulets::catalog().by_key("legendary:pw_shield").unwrap();
    let definition = AbilityDefinition::by_key("pw_shield").unwrap();
    let mut instance = RuntimeInstance::learned(definition);
    instance.power_multiplier = 100.0;
    for (picks, cap) in [(None, 100.0), (Some(1), 150.0), (Some(2000), 200.0)] {
        let mut hero = druid();
        let execution = &mut hero.execution;
        let link = &mut hero.effect_state.incoming;
        execution.vitals.absorb = 80.0;
        link.soul_link_absorb = 80.0;
        behavior::incoming::apply_damage(
            &mut execution.vitals, &mut execution.shield, &mut execution.auras,
            link, 0.0, 20.0, 0.0,
        ).unwrap();
        assert_eq!(execution.shield.amount, 0.0);
        let equipped = &mut hero.effect_state.equipped;
        equipped.rebuild(picks.map(|count| (talisman, talisman.rarity, count)));
        execution.shield.refresh_capacities(
            &mut execution.vitals, &mut link.soul_link_absorb, equipped,
        );

        let actions = buffs::apply_self_buff(
            &instance, 0.0, false, 0.0, &mut execution.vitals,
            &mut execution.shield, &mut execution.auras,
        ).unwrap();
        assert_eq!(execution.shield.amount, cap);
        assert_eq!(execution.vitals.absorb, 60.0 + cap);
        assert!(actions.shared_aura.unwrap().effect.value > 2.0);

        let mut recipient = druid();
        recipient.execution.shield.refresh_capacities(
            &mut recipient.execution.vitals, &mut recipient.effect_state.incoming.soul_link_absorb,
            equipped,
        );
        recipient.execution.shield.receive_party_shield(&mut recipient.execution.vitals, 17, 4.0);
        assert_eq!(recipient.execution.vitals.absorb, cap);
    }
}

#[test]
fn mage_talisman_grows_only_ice_barrier_capacity() {
    use azeroth_survivors_re::loot_rewards::amulets;

    let talisman = amulets::catalog().by_key("legendary:ice_barrier").unwrap();
    let definition = AbilityDefinition::by_key("ice_barrier").unwrap();
    let mut hero = druid();
    let equipped = &mut hero.effect_state.equipped;
    equipped.rebuild(Some((talisman, talisman.rarity, 1)));
    let modifiers = equipped.spell_modifiers(definition);
    assert_eq!((modifiers.power, modifiers.effect, modifiers.absorb_cap_bonus), (1.0, 1.0, 1.0));
    let execution = &mut hero.execution;
    execution.shield.refresh_capacities(
        &mut execution.vitals, &mut hero.effect_state.incoming.soul_link_absorb, equipped,
    );
    let mut instance = RuntimeInstance::learned(definition);
    modifiers.apply(&mut instance);
    buffs::apply_self_buff(
        &instance, 0.0, false, 0.0, &mut execution.vitals,
        &mut execution.shield, &mut execution.auras,
    ).unwrap();
    assert!((execution.vitals.absorb - 63.0).abs() < 0.00001);
    execution.shield.receive_party_shield(&mut execution.vitals, 11426, 2.0);
    assert_eq!(execution.vitals.absorb, 200.0);
}

#[test]
fn same_spell_party_shields_share_only_the_strongest_reservation() {
    let mut hero = party(3);
    let position = hero.zone.center.into();
    let input = PartyInput { position, facing: 0.0, velocity: [0.0; 2] };
    let execution = &mut hero.execution;
    execution.shield.receive_party_shield(&mut execution.vitals, 20594, 0.2);
    let event = |source_slot, coefficient, duration| shared_healing::Event {
        source_slot,
        source_guid: guid(source_slot),
        position,
        payload: shared_healing::Payload::Aura(buffs::SharedAura {
            spell_id: 17,
            effect: player_abilities::StatusEffect { tag: 7, value: coefficient, duration: 0.0 },
            duration,
        }),
    };
    hero.clock = 1.0;
    hero.receive_party_healing(&[event(1, 0.8, 4.0), event(2, 0.3, 9.0)], input);
    assert_eq!(hero.execution.vitals.absorb, 100.0);
    let aura = hero.execution.auras.iter().find(|row| row.spell_id == 17).unwrap();
    assert_eq!((aura.source_guid, aura.expires_at), (0, 10.0));
    let definition = AbilityDefinition::by_key("pw_shield").unwrap();
    let instance = RuntimeInstance::learned(definition);
    let execution = &mut hero.execution;
    assert_eq!(
        buffs::apply_self_buff(
            &instance, 2.0, false, 0.0, &mut execution.vitals,
            &mut execution.shield, &mut execution.auras,
        ),
        Err(buffs::BuffFailure::AlreadyActive),
    );
    assert_eq!(execution.shield.spell_id, 20594);
    assert_eq!(execution.vitals.absorb, 100.0);
    buffs::tick_auras(&mut execution.auras, 5.0, 0.0, &mut execution.vitals, &mut execution.shield);
    assert_eq!(execution.vitals.absorb, 100.0);
    buffs::tick_auras(&mut execution.auras, 10.0, 0.0, &mut execution.vitals, &mut execution.shield);
    assert_eq!(execution.vitals.absorb, 20.0);
    assert_eq!(execution.shield.amount, 20.0);

    // The self writer also counts a held shared row when the aura is absent.
    execution.shield.receive_party_shield(&mut execution.vitals, 17, 0.8);
    buffs::apply_self_buff(
        &instance, 11.0, false, 0.0, &mut execution.vitals,
        &mut execution.shield, &mut execution.auras,
    ).unwrap();
    assert_eq!((execution.shield.spell_id, execution.shield.amount), (17, 20.0));
    assert_eq!(execution.vitals.absorb, 100.0);
}

#[test]
fn battle_shout_keeps_two_casters_and_uses_the_weaker_aura_after_expiry() {
    let mut game = party(2);
    let center = game.zone.center.into();
    super::rng_integration::fixture_enemies(&mut game, &[3.0], &mut TerrainFixture);
    for slot in 0..2 {
        game.with_party_hero(slot, |hero| {
            let mut shout = RuntimeInstance::learned(AbilityDefinition::by_key("battle_shout").unwrap());
            shout.effect_multiplier = if slot == 0 { 1.0 } else { 1.25 };
            shout.duration_multiplier = if slot == 0 { 0.25 } else { 1.0 };
            shout.remaining = 0.0;
            let bonus = if slot == 0 { 0.5 } else { 0.125 };
            hero.effect_state.pre_stats.buff_bonus = bonus;
            hero.effect_state.numeric.buff_bonus = bonus;
            hero.abilities = vec![shout];
            hero.clock = 1.0;
        }).unwrap();
    }
    game.tick_party(0.01, center, [0.0; 2], 0.0, &mut TerrainFixture);
    let mut snapshots = Vec::new();
    for slot in 0..2 {
        let rows = game.with_party_hero(slot, |hero| {
            hero.abilities[0].remaining = f32::INFINITY;
            let rows = hero.execution.auras.iter().filter(|aura| aura.spell_id == 6673)
                .copied().collect::<Vec<_>>();
            assert_eq!(rows.len(), 2);
            let (strong_source, weak_source) = if slot == 0 { (0, guid(1)) } else { (guid(0), 0) };
            let strong = rows.iter().find(|row| row.source_guid == strong_source).unwrap();
            let weak = rows.iter().find(|row| row.source_guid == weak_source).unwrap();
            let bonus = hero.effect_state.numeric.buff_bonus;
            let base_shout = hero.abilities[0].definition.effect.value;
            assert_eq!(strong.effect.value, base_shout * if slot == 0 { 1.0 } else { 1.5 });
            assert_eq!(weak.effect.value, base_shout * 1.25 * if slot == 0 { 1.125 } else { 1.0 });
            assert!(strong.expires_at < weak.expires_at);
            assert_eq!(buffs::effective_auras(&rows, hero.clock, bonus).next(), Some(strong));
            let base_damage = hero.stats.damage_multiplier + 0.03 * hero.level.saturating_sub(1) as f32;
            assert_eq!(hero.current_damage_multiplier(), base_damage + base_shout * 1.5);
            hero.clock = strong.expires_at;
            assert_eq!(buffs::effective_auras(&rows, hero.clock, bonus).next(), Some(weak));
            assert_eq!(hero.current_damage_multiplier(), base_damage + base_shout * 1.25 * 1.125);
            rows
        }).unwrap();
        snapshots.push(rows);
    }
    assert!(game.leave_party_hero(1));
    assert_eq!(game.execution.auras.iter().filter(|aura| aura.spell_id == 6673).count(), 2,
        "leaving the party cannot cancel already received shout contributions");
    let old_remote = snapshots[0].iter().find(|aura| aura.source_guid == guid(1)).unwrap();
    assert!(game.execution.auras.contains(old_remote));
}

#[test]
fn five_scheduled_druids_deliver_five_contributions_and_renew_one_each() {
    let mut game = party(5);
    tick(&mut game);
    let mut before = Vec::new();
    for slot in 0..5 {
        let auras = rejuvenations(&mut game, slot);
        let mut sources: Vec<_> = auras.iter().map(|row| row.source_guid).collect();
        sources.sort_unstable();
        let mut expected = vec![0];
        expected.extend((0..5).filter(|other| *other != slot).map(guid));
        expected.sort_unstable();
        assert_eq!(sources, expected, "recipient {slot} needs self zero and four real caster GUIDs");
        assert_eq!(auras.len(), 5);
        assert!(auras.iter().all(|row| row.healing_power > 0.0));
        for row in &auras {
            let duration = if row.source_guid == 0 { 16.8_f32 } else { 12.0 };
            assert_eq!(row.expires_at.to_bits(), (game.clock + duration).to_bits(),
                "self uses scaled duration while peers receive the raw twelve seconds");
        }
        before.push(auras);
    }
    let first_delivery = game.take_party_events();
    for slot in 1..5 {
        assert!(first_delivery.iter().any(|(source_slot, source_guid, events)| {
            (*source_slot, *source_guid) == (slot, guid(slot))
                && events.iter().any(|event| matches!(event,
                    RunEvent::Aura { target, fields, .. }
                        if *target == guid(slot) && !fields.is_empty()))
        }), "recipient {slot} must publish its actual private aura fields");
    }

    set_casts(&mut game, &[0]);
    tick(&mut game);
    for slot in 0..5 {
        let after = rejuvenations(&mut game, slot);
        let renewed_source = if slot == 0 { 0 } else { guid(0) };
        assert_eq!(after.len(), 5);
        for old in &before[usize::from(slot)] {
            let rows: Vec<_> = after.iter().filter(|row| row.source_guid == old.source_guid).collect();
            assert_eq!(rows.len(), 1, "recasting cannot duplicate a caster's contribution");
            if old.source_guid == renewed_source {
                assert!(rows[0].expires_at > old.expires_at);
            } else {
                assert_eq!(rows[0].expires_at, old.expires_at,
                    "recasting one druid cannot renew another druid's lifetime");
            }
        }
    }
    let later_delivery = game.take_party_events();
    for slot in 1..5 {
        assert!(later_delivery.iter().any(|(source_slot, source_guid, events)| {
            (*source_slot, *source_guid) == (slot, guid(slot))
                && events.iter().any(|event| matches!(event,
                    RunEvent::Healing { amount, fields, .. }
                        if *amount > 0.0 && fields.iter().any(|(field, _)| *field == 22)))
        }), "recipient {slot} must publish effective HoT healing through its own event queue");
    }
}

#[test]
fn shared_heal_includes_thirty_yards_and_excludes_beyond_it() {
    let mut game = party(3);
    set_casts(&mut game, &[0]);
    let center: Position = game.zone.center.into();
    game.party_input(1, PartyInput {
        position: Position { x: center.x + 30.0, ..center },
        facing: 0.0, velocity: [0.0; 2],
    });
    game.party_input(2, PartyInput {
        position: Position { x: center.x + 30.25, ..center },
        facing: 0.0, velocity: [0.0; 2],
    });
    tick(&mut game);
    let own = rejuvenations(&mut game, 0);
    assert_eq!(own.len(), 1);
    assert_eq!(own[0].source_guid, 0, "the origin slot must not receive its own shared duplicate");
    let boundary = rejuvenations(&mut game, 1);
    assert_eq!(boundary.len(), 1);
    assert_eq!(boundary[0].source_guid, guid(0));
    assert!(rejuvenations(&mut game, 2).is_empty());
}

#[test]
fn direct_party_heal_credits_effective_amount_before_the_log_gate() {
    let mut game = party(2);
    let input = game.party_pose(0).unwrap();
    game.rules.heroic_rank = 5;
    game.execution.vitals.health = 90.0;
    let mut event = shared_healing::Event {
        source_slot: 1,
        source_guid: guid(1),
        position: input.position,
        payload: shared_healing::Payload::Healing(buffs::SharedHealing {
            spell_id: 331,
            coefficient: 0.125,
            duration: 0.0,
        }),
    };
    game.receive_party_healing(&[event], input);
    assert_eq!(game.health(), 100.0);
    assert!(matches!(
        game.events.last(),
        Some(RunEvent::Healing {
            amount: 10.0,
            context: Some(HealingContext { source, target, spell_id: 331, .. }),
            ..
        }) if (*source, *target) == (guid(1), guid(0))
    ));
    assert_eq!(game.healing_meter()[0].source.name, "Healing Wave");
    assert_eq!(game.healing_meter()[0].total, 10.0);

    game.events.clear();
    game.execution.vitals.health = 99.5;
    game.receive_party_healing(&[event, event], input);
    assert!(game.events.is_empty());
    assert_eq!(game.healing_meter()[0].total, 10.5);

    event.source_slot = 0;
    game.execution.vitals.health = 90.0;
    game.receive_party_healing(&[event], input);
    assert_eq!(game.health(), 90.0);
    assert_eq!(game.healing_meter()[0].total, 10.5);
}

#[test]
fn choosing_downed_and_abandoned_heroes_reject_shared_healing() {
    let mut game = party(5);
    set_casts(&mut game, &[0]);
    game.with_party_hero(1, |hero| {
        hero.choices.push(RunChoice {
            label: "Pending choice".into(), ability_key: "rejuvenation",
            icon: "Spell_Nature_Rejuvenation", rarity: 0,
            upgrades: Vec::new(), gold: 0,
        });
    }).unwrap();
    game.with_party_hero(2, |hero| {
        hero.dead = true;
        hero.execution.vitals.health = 0.0;
    }).unwrap();
    assert!(game.leave_party_hero(3));
    tick(&mut game);
    for slot in [1, 2, 3] {
        assert!(rejuvenations(&mut game, slot).is_empty(),
            "recipient {slot} is outside the active healing state");
    }
    assert_eq!(rejuvenations(&mut game, 4).len(), 1);
    assert_eq!(rejuvenations(&mut game, 0).len(), 1);
}

#[test]
fn received_aura_keeps_its_lifetime_after_caster_departure() {
    let mut game = party(2);
    set_casts(&mut game, &[1]);
    tick(&mut game);
    let before = rejuvenations(&mut game, 0);
    assert_eq!(before.len(), 1);
    assert_eq!(before[0].source_guid, guid(1));
    let health_before = game.health();
    assert!(game.leave_party_hero(1));
    tick(&mut game);
    let after = rejuvenations(&mut game, 0);
    assert_eq!(after.len(), 1);
    assert_eq!(after[0].source_guid, guid(1));
    assert_eq!(after[0].expires_at, before[0].expires_at);
    assert!(after[0].healing_power < before[0].healing_power);
    assert!(game.health() > health_before);
}

#[test]
fn full_health_host_requires_an_injured_active_nearby_peer() {
    for (label, peer_health, distance, choosing, admitted) in [
        ("active injured peer at thirty yards", 40.0, 30.0, false, true),
        ("choosing peer", 40.0, 0.0, true, false),
        ("peer at the exact injury threshold", 85.0, 0.0, false, false),
        ("injured peer outside thirty yards", 40.0, 30.25, false, false),
    ] {
        let mut game = party(2);
        set_casts(&mut game, &[0]);
        game.execution.vitals.health = 100.0;
        game.with_party_hero(1, |hero| {
            hero.execution.vitals.health = peer_health;
            if choosing {
                hero.choices.push(RunChoice {
                    label: "Pending choice".into(), ability_key: "rejuvenation",
                    icon: "Spell_Nature_Rejuvenation", rarity: 0,
                    upgrades: Vec::new(), gold: 0,
                });
            }
        }).unwrap();
        let center: Position = game.zone.center.into();
        game.party_input(1, PartyInput {
            position: Position { x: center.x + distance, ..center },
            facing: 0.0, velocity: [0.0; 2],
        });
        tick(&mut game);
        let own = rejuvenations(&mut game, 0);
        assert_eq!(own.len(), usize::from(admitted), "{label}");
        assert_eq!(game.events.iter().any(|event| matches!(event,
            RunEvent::Spell(cast) if cast.spell_id == 774)), admitted, "{label}");
    }
}
