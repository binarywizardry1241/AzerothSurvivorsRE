//! Authored selected-target regressions; intentionally not compiled here.
use azeroth_survivors_re::bosses::{
    abilities::{missile_aim_xy, missile_travel_delay}, ai::BossAiState,
    catalog::{BossDefinition, ZONES}, scaling::initial_ability_timers, NativeRng, Position,
};
use azeroth_survivors_re::enemies::ai::Math;
use serde_json::Value;
use std::cell::RefCell;

fn catalog() -> Value {
    serde_json::from_str(include_str!("../../../docs/analysis/evidence/0.108.0/boss-volleys/catalog.json")).unwrap()
}
fn native() -> Value {
    serde_json::from_str(include_str!("../../../docs/analysis/evidence/0.108.0/boss-volleys/native.json")).unwrap()
}
fn boss(id: u32) -> &'static BossDefinition {
    ZONES.iter().flat_map(|zone| zone.bosses).find(|boss| boss.id == id).unwrap()
}
fn point(value: &Value) -> Position {
    Position { x: f32::from_bits(value[0].as_u64().unwrap() as u32),
        y: f32::from_bits(value[1].as_u64().unwrap() as u32), z: 10000. }
}

#[test]
fn current_volley_membership_spells_counts_and_initial_timers_match_all_sixty_bosses() {
    let current = catalog();
    assert_eq!(current["target_sha256"], "dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b");
    assert_eq!(current["bosses"].as_array().unwrap().len(), 60);
    let mut total = 0;
    for row in current["bosses"].as_array().unwrap() {
        let definition = boss(row["boss_id"].as_u64().unwrap() as u32);
        let actual: Vec<_> = definition.abilities.iter().enumerate().filter(|(_, a)| a.words[0] == 1).collect();
        let expected = row["scheduled"].as_array().unwrap();
        assert_eq!(actual.len(), expected.len());
        for ((slot, ability), expected) in actual.into_iter().zip(expected) {
            total += 1;
            assert_eq!(u64::from(ability.words[1]), expected["spell_id"].as_u64().unwrap());
            assert_eq!(u64::from(ability.words[2]), expected["count"].as_u64().unwrap());
            let repeat = expected["cooldown_bits"].as_u64().unwrap() as u32;
            assert_eq!(ability.words[6], repeat);
            assert_eq!(initial_ability_timers(definition)[slot].to_bits(), (f32::from_bits(repeat) * 0.6).to_bits());
        }
    }
    assert_eq!(total, 26);
    assert!(boss(894).abilities.iter().all(|a| a.words[0] != 1));
    assert_eq!(boss(1192).abilities.iter().find(|a| a.words[0] == 1).unwrap().words[1], 26053);
}

#[test]
fn current_volley_repeat_timers_match_both_native_enrage_lanes() {
    for case in native()["cases"]["repeat"].as_array().unwrap() {
        let definition = boss(case["boss_id"].as_u64().unwrap() as u32);
        let slot = definition.abilities.iter().position(|a| a.words[0] == 1).unwrap();
        let mut state = BossAiState::new(definition);
        state.enraged = case["enraged"].as_bool().unwrap();
        state.cooldowns.fill(f32::INFINITY);
        state.cooldowns[slot] = 0.;
        let due = state.advance(definition, 7, 0., 100., 100.);
        assert_eq!(due.len(), 1);
        assert_eq!(due[0].actor_index, 7);
        assert_eq!(state.cooldowns[slot].to_bits(), case["result_bits"].as_u64().unwrap() as u32);
    }
}

#[test]
fn both_current_flight_lanes_enforce_the_native_floor_and_spell_speed() {
    for case in native()["cases"]["flight"].as_array().unwrap() {
        let actual = missile_travel_delay(case["spell_id"].as_u64().unwrap() as u32,
            point(&case["source_bits"]), point(&case["center_bits"]));
        assert_eq!(actual.to_bits(), case["delay_bits"].as_u64().unwrap() as u32);
    }
}

#[derive(Default)]
struct AxisMath(RefCell<Vec<f32>>);
impl Math for AxisMath {
    fn cos(&self, angle: f32) -> f32 { self.0.borrow_mut().push(angle); 1. }
    fn sin(&self, _: f32) -> f32 { 0. }
    fn hypot(&self, x: f32, y: f32) -> f32 { x.hypot(y) }
}

#[test]
fn current_aim_draw_order_preserves_the_shared_native_rng() {
    for case in native()["cases"]["aim"].as_array().unwrap() {
        let mut initial = [0; 4];
        for (i, word) in case["state"].as_array().unwrap().iter().enumerate() { initial[i] = word.as_u64().unwrap(); }
        let mut rng = NativeRng::from_words(initial);
        let math = AxisMath::default();
        let xy = missile_aim_xy(case["index"].as_u64().unwrap() as u32,
            case["count"].as_u64().unwrap() as u32, Position::default(), &mut rng, &math);
        assert_eq!(math.0.borrow()[0].to_bits(), case["angle_bits"].as_u64().unwrap() as u32);
        assert_eq!(xy[0].to_bits(), case["radius_bits"].as_u64().unwrap() as u32);
        for (i, word) in case["state_after"].as_array().unwrap().iter().enumerate() { assert_eq!(rng.words[i], word.as_u64().unwrap()); }
    }
}
