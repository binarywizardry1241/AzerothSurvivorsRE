//! Integration fixtures for the live owners. The flat height provider is a
//! test fixture only; the application binds streamed MPQ terrain/collision.
#[path = "../src/gameplay/mechanics.rs"]
mod mechanics;

use azeroth_survivors_re::enemies::{
    ai::World,
    spawning::{BlockedGrid, PathGrid, Terrain},
    Position,
};
use mechanics::{Mechanics, RunPlayerStats, RunRules};

#[derive(Clone)]
struct FixtureWorld(f32);
impl Terrain for FixtureWorld {
    fn height(&mut self, _: [f32; 2]) -> Option<f32> {
        Some(self.0)
    }
    fn secondary_height(&mut self, _: [f32; 2]) -> Option<f32> {
        None
    }
    fn fallback_height(&self) -> f32 {
        self.0
    }
    fn blocked_grid(&self) -> Option<BlockedGrid<'_>> {
        None
    }
    fn path_grid(&self) -> Option<PathGrid<'_>> {
        None
    }
}
impl World for FixtureWorld {
    fn ray_fraction(&self, _: Position, _: Position) -> Option<f32> {
        None
    }
    fn chase_path(&self, _: Position, _: Position, _: f32) -> Option<[f32; 2]> {
        None
    }
}
impl azeroth_survivors_re::guardians::placement::LairTerrain for FixtureWorld {
    fn adt_height(&self, _: f32, _: f32) -> Option<f32> {
        Some(self.0)
    }
    fn wmo_height(&self, _: f32, _: f32) -> Option<f32> {
        None
    }
    fn fallback_height(&self) -> f32 {
        self.0
    }
    fn blocked_at(&self, _: f32, _: f32) -> bool {
        false
    }
}

fn run() -> Mechanics {
    Mechanics::new(
        "elwynn",
        "warrior",
        RunRules { heroic_rank: 0,
            difficulty: 1.0,
            density_percent: 100,
            hp_percent: 100,
            damage_percent: 100,
            speed_percent: 100,
            endless: false,
        },
        RunPlayerStats {
            maximum_health: 100.0,
            health_per_level: 9.0,
            health_multiplier: 1.0,
            regeneration: 0.8,
            pickup_radius: 9.0,
            luck_bonus: 0.0,
            heal_on_kill: 0.0,
            armor_fraction: 0.0,
            damage_reduction: 0.0,
            damage_multiplier: 1.0,
            cooldown_multiplier: 1.0,
            critical_chance: 0.0,
            critical_multiplier: 2.0,
            experience_multiplier: 1.0,
            gold_multiplier: 1.0,
            native_race: 1,
            packed_player_field: 0,
        },
        [1, 2, 3, 4],
    )
    .unwrap()
}

#[test]
fn admitted_run_spawns_recovered_zone_actors_on_supplied_terrain() {
    let mut run = run();
    let player: Position = run.zone.center.into();
    run.tick(0.1, player, [0.0; 2], 0.0, &mut FixtureWorld(player.z));
    assert!(
        run.actors.len() >= 4,
        "native initial budget plus population top-up"
    );
    for actor in &run.actors {
        assert_eq!(actor.actor.movement.from.z, player.z);
        assert!(run
            .zone
            .enemies
            .iter()
            .any(|definition| definition.id == actor.definition.id));
        assert!(actor.maximum_health > 0.0);
    }
}

#[test]
fn melee_starter_resolves_damage_death_and_recovered_xp_pickup() {
    let mut run = run();
    let player: Position = run.zone.center.into();
    let mut world = FixtureWorld(player.z);
    run.tick(0.1, player, [0.0; 2], 0.0, &mut world);
    let index = run
        .actors
        .iter()
        .position(|row| run.guardian_render_scale(row.guid).is_none())
        .unwrap();
    let guid = run.actors[index].guid;
    let row = &mut run.actors[index];
    row.health = 1.0;
    row.actor.movement = azeroth_survivors_re::enemies::ai::Movement {
        from: player,
        to: player,
        started_at: run.clock,
        duration: 0.0,
    };
    run.tick(0.5, player, [0.0; 2], 0.0, &mut world);
    assert!(
        run.actors
            .iter()
            .find(|row| row.guid == guid)
            .unwrap()
            .actor
            .dead
    );
    assert_eq!(run.kills, 1);
    assert!(run.pickups.iter().any(|pickup| matches!(
        pickup.drop,
        azeroth_survivors_re::mob_loot::PickupDrop::Experience { .. }
    )));
    assert_eq!(run.xp, 0, "kill drops XP; collection owns credit");
}

#[test]
fn xp_uses_current_threshold_and_native_three_card_generator() {
    let mut run = run();
    assert_eq!(run.xp_required(), 5);
    run.add_experience(5);
    assert_eq!((run.level, run.xp), (2, 0));
    assert_eq!(run.choices.len(), 3);
    for choice in &run.choices {
        assert!(run.class.pool.contains(&choice.ability_key));
        assert!(choice.rarity <= 4);
    }
}

#[test]
fn experience_enters_flight_before_grant_and_level_growth_preserves_damage() {
    use azeroth_survivors_re::{mob_loot::PickupDrop, treasure_chests};
    let mut run = run();
    let player: Position = run.zone.center.into();
    run.execution.vitals.health = 50.0;
    run.pickups.push(mechanics::RunPickup {
        created_at: 0.0,
        id: 77,
        drop: PickupDrop::Experience {
            amount: 5,
            position: treasure_chests::Position::new(player.x, player.y, player.z),
        },
        flight: None,
        facing: 0.0,
        auxiliary: [None; 2],
    });
    assert!(!run.try_collect_pickup(77, player));
    assert_eq!(run.xp, 0);
    assert_eq!(run.pickups[0].flight.unwrap().duration, 0.12);
    run.tick(0.13, player, [0.0; 2], 0.0, &mut FixtureWorld(player.z));
    assert_eq!(run.level, 2);
    assert_eq!(run.max_health(), 109.0);
    assert!(
        run.health() > 80.8 && run.health() < 81.8,
        "native frame regeneration precedes arriving XP; level refresh adds max-HP delta, then heals20% of the new maximum"
    );
    assert!(run.pickups.iter().all(|pickup| pickup.id != 77));
}

#[test]
fn primary_boss_schedule_uses_native_definition_and_constructor_health() {
    let mut run = run();
    let zone = azeroth_survivors_re::bosses::catalog::ZoneDefinition::by_key("elwynn").unwrap();
    let definition = &zone.bosses[0];
    run.clock = definition.time_minutes * 60.0;
    let player: Position = run.zone.center.into();
    run.tick(0.01, player, [0.0; 2], 0.0, &mut FixtureWorld(player.z));
    assert_eq!(run.bosses.len(), 1);
    assert!(std::ptr::eq(run.bosses[0].definition, definition));
    let expected = definition.base_hp * 5.75 * zone.scalar_e0;
    assert_eq!(run.bosses[0].maximum_health, expected);
    assert!(run.bosses[0].actor.stun_until > run.clock);
    assert_eq!(run.events.iter().filter(|event|
        matches!(event, mechanics::RunEvent::PlaySound(8174))).count(), 1);
}

#[test]
fn scheduled_voiced_boss_uses_the_live_sound_event_owner_once() {
    let mut run = run();
    let zone = azeroth_survivors_re::bosses::catalog::ZoneDefinition::by_key("elwynn").unwrap();
    let player: Position = run.zone.center.into();
    // Catch up three due entries through the real scheduler. Rhahk'Zor is
    // the first voiced entry; the two preceding bosses have no voice kit.
    run.clock = zone.bosses[2].time_minutes * 60.0;
    let mut world = FixtureWorld(player.z);
    for expected in [vec![8174], vec![8174], vec![8174, 5774], vec![]] {
        run.tick(0.01, player, [0.0; 2], 0.0, &mut world);
        let actual: Vec<_> = run.events.iter().filter_map(|event| match event {
            mechanics::RunEvent::PlaySound(id) if *id == 8174 || *id == 5774 => Some(*id),
            _ => None,
        }).collect();
        assert_eq!(actual, expected);
    }
    assert_eq!(run.bosses.len(), 3);
}

#[test]
fn actual_melee_health_uses_raw_fractional_damage_not_packet_rounding() {
    let mut run = run();
    let player: Position = run.zone.center.into();
    let mut world = FixtureWorld(player.z);
    run.tick(0.01, player, [0.0; 2], 0.0, &mut world);
    run.stats.armor_fraction = 0.5;
    run.abilities[0].remaining = 1000.0;
    let index = run
        .actors
        .iter()
        .position(|row| run.guardian_render_scale(row.guid).is_none())
        .unwrap();
    let row = &mut run.actors[index];
    row.actor.damage = 1.0;
    row.actor.attack_delay = 0.0;
    row.actor.movement = azeroth_survivors_re::enemies::ai::Movement {
        from: player,
        to: player,
        started_at: run.clock,
        duration: 0.0,
    };
    run.tick(0.01, player, [0.0; 2], 0.0, &mut world);
    assert_eq!(run.health(), 99.5);
}

#[test]
fn primary_hits_gain_bloodrage_while_periodic_ticks_keep_source_one_gate() {
    use azeroth_survivors_re::player_abilities::{
        behavior::periodic::ActorPeriodic, AbilityDefinition, RuntimeInstance,
    };
    let mut run = run();
    run.abilities.push(RuntimeInstance::learned(
        AbilityDefinition::by_key("bloodrage").unwrap(),
    ));
    let player: Position = run.zone.center.into();
    let mut world = FixtureWorld(player.z);
    run.tick(0.01, player, [0.0; 2], 0.0, &mut world);
    let index = run
        .actors
        .iter()
        .position(|row| run.guardian_render_scale(row.guid).is_none())
        .unwrap();
    let row = &mut run.actors[index];
    row.health = 1000.0;
    row.maximum_health = 1000.0;
    row.actor.movement = azeroth_survivors_re::enemies::ai::Movement {
        from: player,
        to: player,
        started_at: run.clock,
        duration: 0.0,
    };
    run.abilities[0].remaining = 0.0;
    run.tick(0.5, player, [0.0; 2], 0.0, &mut world);
    assert!(
        run.actors[index].health < 1000.0,
        "first actual primary hit"
    );
    //14549e46b ordinary casts precede1454a0987's class-special tick. The
    // first hit can spend only the initial .01s bank, whose credit is less
    // than one published tenth. This frame regenerates the .5s bank AFTER it.
    assert_eq!(run.class_resource().unwrap().value, 0);
    let after_first_hit = run.actors[index].health;
    run.abilities[0].remaining = 0.0;
    run.tick(0.01, player, [0.0; 2], 0.0, &mut world);
    assert!(
        run.actors[index].health < after_first_hit,
        "second actual primary hit spends the previously regenerated bank"
    );
    run.abilities[0].remaining = 100.0;
    let bar = run
        .class_resource()
        .expect("native passive tick publishes actual resource state");
    assert_eq!(bar.field, 24);
    assert!(bar.value > 0);
    run.actors[index].periodic.push(ActorPeriodic {
        owner_kind: 0,
        owner_guid: 1,
        spell_id: 772,
        power_per_tick: 1.0,
        interval: 1.0,
        next_tick_at: run.clock,
        ticks_remaining: 1,
        initial_ticks: 1,
        leech_fraction: 0.0,
        school: 0,
    });
    run.tick(0.1, player, [0.0; 2], 0.0, &mut world);
    assert_eq!(
        run.class_resource().unwrap().value,
        bar.value,
        "source-one DoT must not gain normal source-zero Bloodrage credit"
    );
}

#[test]
fn stopped_run_does_not_advance_or_spawn() {
    let mut run = run();
    run.dead = true;
    let player: Position = run.zone.center.into();
    run.tick(1.0, player, [0.0; 2], 0.0, &mut FixtureWorld(player.z));
    assert_eq!(run.clock, 0.0);
    assert!(run.actors.is_empty());
}

#[test]
fn expired_stampede_removes_live_actor_without_death_rewards_and_frees_population() {
    use azeroth_survivors_re::enemies::ai::{Escape, Movement};
    let mut run = run();
    let player: Position = run.zone.center.into();
    let mut world = FixtureWorld(player.z);
    run.tick(0.01, player, [0.0; 2], 0.0, &mut world);
    let before = run.actors.len();
    let before_guids = run.actors.iter().map(|row|row.guid).collect::<Vec<_>>();
    let pickups_before = run.pickups.len();
    let guid = run.actors[0].guid;
    let position = Position {
        x: player.x + 50.0,
        ..player
    };
    run.actors[0].actor.movement = Movement {
        from: position,
        to: position,
        started_at: run.clock,
        duration: 0.0,
    };
    run.actors[0].actor.escape = Some(Escape {
        target: position,
        until: run.clock,
    });
    run.tick(0.01, player, [0.0; 2], 0.0, &mut world);
    assert!(run.actors.iter().all(|row| row.guid != guid));
    assert_eq!(run.actors.len(), before,
        "current actor-update removes the stampede before the same frame's normal population top-up");
    let replacements = run.actors.iter().filter(|row|!before_guids.contains(&row.guid)).collect::<Vec<_>>();
    assert_eq!(replacements.len(), 1, "the freed slot creates exactly one replacement");
    assert_eq!(replacements[0].actor.attack_delay, 0.5 * replacements[0].definition.raw_38,
        "the replacement has not received an actor update in its creation frame");
    assert_eq!((run.kills, run.xp, run.gold), (0, 0, 0));
    assert_eq!(run.pickups.len(), pickups_before);
    assert!(!run.events.iter().any(|event| matches!(event,
        mechanics::RunEvent::EnemyDied { guid: dead } if *dead == guid)));
    run.tick(0.01, player, [0.0; 2], 0.0, &mut world);
    assert_eq!(
        run.actors.len(),
        before,
        "the following frame does not allocate a second replacement"
    );
    assert!(run.actors.iter().all(|row| row.guid != guid));
    assert_eq!(run.kills, 0);
}

#[test]
fn increased_xp_attraction_radius_does_not_extend_fixed_gold_collection_range() {
    use azeroth_survivors_re::{mob_loot::PickupDrop, treasure_chests};
    let mut run = run();
    run.stats.pickup_radius = 11.7; // Recovered Dwarf XP radius9*1.3.
    let player: Position = run.zone.center.into();
    let outside_gold = treasure_chests::Position::new(player.x + 9.25, player.y, player.z);
    for (id, drop) in [
        (
            1,
            PickupDrop::Gold {
                amount: 2,
                position: outside_gold,
            },
        ),
        (
            2,
            PickupDrop::Experience {
                amount: 2,
                position: outside_gold,
            },
        ),
        (
            3,
            PickupDrop::Gold {
                amount: 2,
                position: treasure_chests::Position::new(player.x + 9.0, player.y, player.z),
            },
        ),
    ] {
        run.pickups.push(mechanics::RunPickup {
            created_at: 0.0,
            id,
            drop,
            flight: None,
            facing: 0.0,
            auxiliary: [None; 2],
        });
    }
    assert!(!run.try_collect_pickup(1, player));
    assert!(
        !run.try_collect_pickup(2, player),
        "XP starts flight before credit"
    );
    assert!(run
        .pickups
        .iter()
        .find(|pickup| pickup.id == 2)
        .unwrap()
        .flight
        .is_some());
    assert!(
        run.try_collect_pickup(3, player),
        "native fixed gold bound includes equality"
    );
    assert_eq!((run.gold, run.xp), (2, 0));
    assert!(run.pickups.iter().any(|pickup| pickup.id == 1));
}

#[test]
fn guardian_spawn_and_shared_combat_death_update_lair_rewards() {
    use azeroth_survivors_re::mob_loot::PickupDrop;
    let mut run = run();
    let player: Position = run.zone.center.into();
    let mut world = FixtureWorld(player.z);
    run.clock = 20.0;
    run.tick(0.01, player, [0.0; 2], 0.0, &mut world);
    assert_eq!(
        run.actors
            .iter()
            .filter(|row| run.guardian_render_scale(row.guid).is_some())
            .count(),
        4
    );
    let index = run
        .actors
        .iter()
        .position(|row| run.guardian_render_scale(row.guid).is_some())
        .unwrap();
    let guid = run.actors[index].guid;
    let row = &mut run.actors[index];
    row.health = 1.0;
    row.actor.movement = azeroth_survivors_re::enemies::ai::Movement {
        from: player,
        to: player,
        started_at: run.clock,
        duration: 0.0,
    };
    run.abilities[0].remaining = 0.0;
    run.tick(0.1, player, [0.0; 2], 0.0, &mut world);
    assert!(
        run.actors
            .iter()
            .find(|row| row.guid == guid)
            .unwrap()
            .actor
            .dead
    );
    assert_eq!(run.guardian_kills(), 1);
    assert!(run
        .guardian_lairs()
        .iter()
        .any(|lair| lair.active_guid.is_none() && lair.respawn_at == run.clock + 180.0));
    assert!(run
        .pickups
        .iter()
        .any(|pickup| matches!(pickup.drop, PickupDrop::Gold { amount: 30, .. })));
    assert_eq!(
        run.level, 2,
        "guardian strength is consumed by the actual shared XP owner"
    );
}
