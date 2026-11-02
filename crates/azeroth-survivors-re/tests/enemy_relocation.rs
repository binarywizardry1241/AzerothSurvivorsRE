//! Authored native-oracle coverage; not compiled or run in source-only mode.
use azeroth_survivors_re::enemies::{
    ai::{Actor, Movement, TimedReduction},
    relocation::{apply_relocation, distant_guids, Candidate},
    Position,
};
use serde_json::Value;

fn fixture() -> Value {
    serde_json::from_str(include_str!("fixtures/enemy-relocation-native.json")).unwrap()
}
fn f(value: &Value) -> f32 {
    f32::from_bits(value.as_u64().unwrap() as u32)
}
fn position(bits: &Value) -> Position {
    Position { x: f(&bits[0]), y: f(&bits[1]), z: bits.get(2).map(f).unwrap_or(0.0) }
}
fn actor() -> Actor {
    Actor {
        guid: 42,
        movement: Movement { from: Position::default(), to: Position::default(), started_at: 0.0, duration: 0.0 },
        next_movement_at: 0.0, attack_delay: 2.5, attack_interval: 3.2,
        melee_reach: 3.0, movement_speed: 5.0, damage: 20.0, movement_angle: 0.0,
        casting: true, cast_ends_at: 999.0, dead: false, died_at: 0.0,
        fear_until: 0.0, stun_until: 0.0, forced_escape_until: 0.0,
        escape: None, slow: TimedReduction::default(), damage_reduction: TimedReduction::default(), whirlwind_until: 0.0,
    }
}

#[test]
fn native_selection_preserves_gates_interpolation_order_and_four_actor_limit() {
    let fixture = fixture();
    assert_eq!(fixture["target_sha256"], "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589");
    for row in fixture["selection_cases"].as_array().unwrap() {
        let candidates: Vec<_> = row["actors"].as_array().unwrap().iter().map(|actor| Candidate {
            guid: actor["guid"].as_u64().unwrap(),
            movement: Movement {
                from: position(&actor["from_bits"]), to: position(&actor["to_bits"]),
                started_at: f(&actor["started_at_bits"]), duration: f(&actor["duration_bits"]),
            },
            dead: actor["dead"].as_bool().unwrap(),
            definition_present: actor["definition_present"].as_bool().unwrap(),
            boss_index: actor["boss_index"].as_u64().map(|v| v as usize),
            lair_index: actor["lair_index"].as_u64().map(|v| v as usize),
            raw_78: actor["raw_78"].as_u64().unwrap() as u8,
        }).collect();
        let expected: Vec<_> = row["selected_guids"].as_array().unwrap().iter()
            .map(|v| v.as_u64().unwrap()).collect();
        assert_eq!(distant_guids(&candidates, f(&row["now_bits"]), position(&row["player_bits"])), expected,
                   "{}", row["name"]);
    }
}

#[test]
fn native_reset_cancels_cast_keeps_attack_timer_and_wraps_packet_sequence() {
    for row in fixture()["reset_cases"].as_array().unwrap() {
        let mut actor = actor();
        let mut sequence = row["counter_before"].as_u64().unwrap() as u32;
        let request = apply_relocation(&mut actor, position(&row["position_bits"]), f(&row["now_bits"]), &mut sequence);
        for (actual, expected) in [(actor.movement.from, &row["from_bits"]), (actor.movement.to, &row["to_bits"])] {
            for (actual, expected) in [actual.x, actual.y, actual.z].iter().zip(expected.as_array().unwrap()) {
                assert_eq!(actual.to_bits(), expected.as_u64().unwrap() as u32);
            }
        }
        for (actual, key) in [(actor.movement.started_at, "started_at_bits"),
            (actor.movement.duration, "duration_bits"), (actor.next_movement_at, "next_movement_bits"),
            (actor.cast_ends_at, "cast_ends_at_bits"), (actor.attack_delay, "attack_delay_bits")] {
            assert_eq!(actual.to_bits(), row[key].as_u64().unwrap() as u32);
        }
        assert!(!actor.casting);
        assert_eq!(sequence, row["counter_after"].as_u64().unwrap() as u32);
        assert_eq!(request.sequence, row["packet_counter"].as_u64().unwrap() as u32);
        assert_eq!(request.guid, row["packet_guid"].as_u64().unwrap());
    }
}
