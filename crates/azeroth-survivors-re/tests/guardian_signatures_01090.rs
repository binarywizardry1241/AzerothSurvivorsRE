use azeroth_survivors_re::guardians::signatures::{nonblocking, signature, State};

#[test]
fn taskmaster_uses_its_current_minion_count_and_half_initial_timer() {
    let mut state = State::for_variant(609, 0);
    assert_eq!(state.cooldowns, [4.5, 5.0, 7.5]);
    let due = state.advance(20.0, 7.5, 100.0, 100.0);
    assert_eq!(due.abilities.len(), 1);
    assert_eq!(due.abilities[0].words[..2], [2, 4]);
    // Its unreconstructed charge still owns the blocking slot; it is never
    // replaced by the historical generic Thunder Clap.
    assert_eq!(state.cooldowns, [9.0, -2.5, 15.0]);
}

#[test]
fn cast_and_earlier_action_holds_preserve_overdue_timers() {
    let mut state = State::for_variant(710, 0);
    state.cooldowns.fill(0.0);
    let due = state.advance(10.0, 0.0, 100.0, 100.0);
    assert_eq!(due.abilities.len(), 1);
    assert_eq!(due.abilities[0].words[0], 5); // Current ground circle.
    assert_eq!(state.cooldowns[2], 0.0); // Circular strike remains overdue.
    state.cast_until = 11.0;
    assert!(state.advance(10.5, 0.5, 100.0, 100.0).abilities.is_empty());
    assert_eq!(state.cooldowns[2], -0.5);
    let due = state.advance(11.0, 0.5, 100.0, 100.0);
    assert_eq!(due.abilities.len(), 1);
    assert_eq!(due.abilities[0].words[0], 6);
}

#[test]
fn guardian_low_health_repeat_scale_is_not_boss_enrage() {
    let mut state = State::for_variant(609, 0);
    state.cooldowns = vec![1000.0, 1000.0, 0.0];
    state.advance(1.0, 0.0, 29.0, 100.0);
    assert_eq!(state.cooldowns[2], 15.0 * 0.7);
    state.cooldowns[2] = 0.0;
    state.advance(2.0, 0.0, 100.0, 100.0);
    assert_eq!(state.cooldowns[2], 15.0);
}

#[test]
fn strict_phase_latches_reset_without_changing_sentinel_variant_or_deadlines() {
    let mut state = State::for_variant(711, 0);
    assert!(state.advance(1.0, 0.0, 50.0, 100.0).phase_yells.is_empty());
    let due = state.advance(2.0, 0.0, 49.0, 100.0);
    assert_eq!(due.phase_yells.len(), 1);
    assert_eq!(due.abilities[0].words[..2], [2, 4]);
    assert!(state.advance(3.0, 0.0, 49.0, 100.0).phase_yells.is_empty());
    state.reset();
    assert_eq!(state.advance(4.0, 0.0, 49.0, 100.0).phase_yells.len(), 1);

    let definition = signature(1110).unwrap();
    assert_eq!(definition.variants.len(), 4);
    for variant in 0..4 {
        let mut sentinel = State::for_variant(1110, variant);
        sentinel.cooldowns.fill(-100.0);
        sentinel.phases_used = u32::MAX;
        sentinel.cast_until = 20.0;
        sentinel.hold_until = 30.0;
        sentinel.reset();
        assert_eq!(sentinel.variant, variant);
        assert_eq!(sentinel.phases_used, 0);
        assert_eq!(sentinel.cast_until, 20.0);
        assert_eq!(sentinel.hold_until, 30.0);
        assert_eq!(sentinel.cooldowns, definition.variants[variant].iter()
            .map(|row| row.cooldown * 0.5).collect::<Vec<_>>());
    }
}

#[test]
fn native_nonblocking_mask_keeps_unreconstructed_owners_visible() {
    for tag in 0..36 {
        assert_eq!(nonblocking(tag), matches!(tag, 0 | 1 | 2 | 4 | 5 | 22 | 23 | 32 | 34));
    }
    assert!(signature(1409).is_none());
}
