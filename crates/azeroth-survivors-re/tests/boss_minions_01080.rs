//! Authored selected-target regressions; not compiled in the source-only repair.
use azeroth_survivors_re::bosses::{
    ai::BossAiState,
    catalog::{BossDefinition, ZONES},
    minion_phases::{PhaseState, PHASE_SUMMONS},
    scaling::initial_ability_timers,
};
use serde_json::Value;

fn catalog() -> Value {
    serde_json::from_str(include_str!("../../../docs/analysis/evidence/boss-minions/catalog.json")).unwrap()
}

fn native() -> Value {
    serde_json::from_str(include_str!("../../../docs/analysis/evidence/boss-minions/native.json")).unwrap()
}

fn boss(id: u32) -> &'static BossDefinition {
    ZONES.iter().flat_map(|zone| zone.bosses).find(|boss| boss.id == id).unwrap()
}

#[test]
fn every_boss_has_exactly_one_current_summon_record_and_initial_timer() {
    let current = catalog();
    assert_eq!(current["target_sha256"], "dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b");
    let rows = current["bosses"].as_array().unwrap();
    assert_eq!(rows.len(), 60);
    for row in rows {
        let boss = boss(row["boss_id"].as_u64().unwrap() as u32);
        let slots: Vec<_> = boss.abilities.iter().enumerate().filter(|(_, ability)| ability.words[0] == 2).collect();
        assert_eq!(slots.len(), 1);
        let (slot, ability) = slots[0];
        assert_eq!(u64::from(ability.words[1]), row["scheduled"]["count"].as_u64().unwrap());
        let repeat_bits = row["scheduled"]["cooldown_bits"].as_u64().unwrap() as u32;
        assert_eq!(ability.words[6], repeat_bits);
        assert_eq!(initial_ability_timers(boss)[slot].to_bits(), (f32::from_bits(repeat_bits) * 0.6).to_bits());
    }
}

#[test]
fn repeat_timers_follow_current_native_normal_and_enraged_cases() {
    for row in native()["cases"]["repeat"].as_array().unwrap() {
        let boss = boss(row["boss_id"].as_u64().unwrap() as u32);
        let slot = boss.abilities.iter().position(|ability| ability.words[0] == 2).unwrap();
        let mut state = BossAiState::new(boss);
        state.enraged = row["enraged"].as_bool().unwrap();
        state.cooldowns.fill(f32::INFINITY);
        state.cooldowns[slot] = 0.0;
        let due = state.advance(boss, 7, 0.0, 100.0, 100.0);
        assert_eq!(due.len(), 1);
        assert_eq!(due[0].actor_index, 7);
        assert_eq!(state.cooldowns[slot].to_bits(), row["result_bits"].as_u64().unwrap() as u32);
    }
}

#[test]
fn phase_latches_and_strict_boundaries_match_the_native_instruction_cases() {
    assert_eq!(PHASE_SUMMONS.len(), 9);
    for row in native()["cases"]["phase_gate"].as_array().unwrap() {
        let id = row["boss_id"].as_u64().unwrap() as u32;
        let mut state = PhaseState::default();
        if row["latched"].as_bool().unwrap() {
            assert_eq!(state.take_due(id, 0.0, 1.0).len(), 1);
        }
        let ratio = f32::from_bits(row["ratio_bits"].as_u64().unwrap() as u32);
        let due = state.take_due(id, ratio, 1.0);
        assert_eq!(!due.is_empty(), row["fired"].as_bool().unwrap());
        if let Some(phase) = due.first() {
            assert_eq!(u64::from(phase.phase_index), row["phase_index"].as_u64().unwrap());
            assert_eq!(phase.ability().words[1], phase.count);
        }
        state.take_due(id, 1.0, 1.0);
        let first = state.take_due(id, 0.0, 1.0);
        assert_eq!(first.len(), usize::from(!row["latched"].as_bool().unwrap() && !row["fired"].as_bool().unwrap()));
        assert!(state.take_due(id, 0.0, 1.0).is_empty());
    }
}

#[test]
fn spawn_definition_cycle_matches_current_native_indices() {
    for row in native()["cases"]["minion_index"].as_array().unwrap() {
        assert_eq!(azeroth_survivors_re::bosses::abilities::minion_enemy_index(
            row["index"].as_u64().unwrap() as u32), row["enemy_index"].as_u64().unwrap() as usize);
    }
}
