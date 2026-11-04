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
fn battle_shout_keeps_two_casters_and_uses_the_weaker_aura_after_expiry() {
    let mut game = party(2);
    let center = game.zone.center.into();
    super::rng_integration::fixture_enemies(&mut game, &[3.0], &mut TerrainFixture);
    for slot in 0..2 {
        game.with_party_hero(slot, |hero| {
            let mut shout = RuntimeInstance::learned(AbilityDefinition::by_key("battle_shout").unwrap());
            shout.effect_multiplier = if slot == 0 { 3.0 } else { 1.0 };
            shout.duration_multiplier = if slot == 0 { 0.25 } else { 1.0 };
            shout.remaining = 0.0;
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
            let strong = rows.iter().max_by(|a, b| a.effect.value.total_cmp(&b.effect.value)).unwrap();
            let weak = rows.iter().min_by(|a, b| a.effect.value.total_cmp(&b.effect.value)).unwrap();
            assert!(strong.effect.value > weak.effect.value);
            assert!(strong.expires_at < weak.expires_at);
            assert_eq!(buffs::effective_auras(&rows, hero.clock).next(), Some(strong));
            hero.clock = strong.expires_at;
            assert_eq!(buffs::effective_auras(&rows, hero.clock).next(), Some(weak));
            assert_eq!(hero.current_damage_multiplier(), aura_damage(
                hero.stats.damage_multiplier + 0.03 * hero.level.saturating_sub(1) as f32,
                &[*weak], hero.clock, hero.effect_state.numeric.buff_bonus));
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
