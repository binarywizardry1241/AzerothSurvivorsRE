//! Authored source regressions; not compiled/run in source-only mode.
use azeroth_survivors_re::bosses::{minion_phases::PhaseState,
    raid_area_catalog::{current_schedule, ScheduleState}};

#[test]
fn tower_phase_uses_strict_threshold_and_latches_after_healing() {
    let mut phases = PhaseState::default();
    assert!(phases.take_actions(1493, 50., 100.).is_empty());
    let due = phases.take_actions(1493, 49., 100.);
    assert_eq!(due.len(), 1);
    assert_eq!((due[0].phase_index, due[0].native_tag), (0, 12));
    assert_eq!(due[0].ability.words, [13, 3, 0, 0, 0, 0, 0]);
    assert!(due[0].blocking());
    assert!(phases.take_actions(1493, 100., 100.).is_empty());
    assert!(phases.take_actions(1493, 0., 100.).is_empty());
}

#[test]
fn simultaneous_summon_and_tower_keep_native_phase_order_and_shared_latches() {
    let mut phases = PhaseState::default();
    let due = phases.take_actions(1494, 0., 100.);
    assert_eq!(due.iter().map(|phase| phase.phase_index).collect::<Vec<_>>(), vec![1, 2]);
    assert_eq!(due[0].ability.words, [2, 14, 0, 0, 0, 0, 0]);
    assert!(!due[0].blocking());
    assert_eq!(due[1].ability.words, [13, 4, 0, 0, 0, 0, 0]);
    assert!(phases.take_due(1494, 0., 100.).is_empty());

    let mut old_api = PhaseState::default();
    assert_eq!(old_api.take_due(1494, 40., 100.).len(), 1);
    let later = old_api.take_actions(1494, 0., 100.);
    assert_eq!(later.len(), 1);
    assert_eq!(later[0].phase_index, 2);
}

#[test]
fn phase_blocks_overdue_recurring_tower_without_resetting_its_timer() {
    let schedule = current_schedule(994).unwrap();
    let slot = schedule.moves.iter().position(|row| row.native_tag == 12).unwrap();
    let mut state = ScheduleState::new(994);
    state.cooldowns.fill(f32::INFINITY);
    state.cooldowns[slot] = 0.;
    assert!(state.advance_with_phases(994, 1., false, false, true).is_empty());
    assert_eq!(state.cooldowns[slot], -1.);
    let due = state.advance_with_phases(994, 0., false, false, false);
    assert_eq!(due.len(), 1);
    assert_eq!(due[0].words[0..2], [13, 1]);
    assert_eq!(state.cooldowns[slot], 24.);
}
