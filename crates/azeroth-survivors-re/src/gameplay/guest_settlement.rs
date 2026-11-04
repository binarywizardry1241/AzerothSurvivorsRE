//! 0.119.0 guest summary/account transactions over a retained accepted snapshot.
//! World construction and client presentation are separate from account ownership.

use azeroth_survivors_re::{
    account_progression::{BossKillingBlow, RunSnapshot},
    coop::{
        client_state::RunProjection,
        game_party::class_key,
        replication::{BossFlagRow, NativeCoopFeats, NativeState},
    },
    run_progression::{self, RunResult, TerminalDelivery},
};

use super::mechanics::{Mechanics, RunEvent};
use crate::menu_state::MenuState;

/// Current145c27820 clear admission is separate from summary XP/count delivery.
/// Retain the captured class/zone/rank and commit the Normal/Heroic records even
/// when the completed fight still has queued choices or lacks a local world.
pub(super) fn persist_victory(
    menu: &mut MenuState,
    guid: Option<u64>,
    class: u8,
    zone_key: &'static str,
    heroic_rank: u8,
    won: bool,
    notice_ready: bool,
) -> Vec<RunEvent> {
    if !won || guid.is_none_or(|guid| guid == crate::startup::TESTER_GUID) {
        return Vec::new();
    }
    //145c278ec captures the existing class ceiling before the Normal insert.
    // A first Normal clear cannot manufacture Heroic eligibility in this call.
    let effective_rank = heroic_rank.min(menu.backend_save.max_heroic_rank(class, zone_key));
    // Keep repeated accepted snapshots inert even though the textual Save
    // adapter would otherwise move an already-present Normal row to the end.
    let already_beaten = azeroth_survivors_re::guardians::catalog::ZONES.iter()
        .position(|zone| zone.key == zone_key)
        .is_some_and(|zone| menu.backend_save.beaten_zones().contains(&(class, zone)));
    if already_beaten && effective_rank <= menu.backend_save.heroic_cleared_rank(class, zone_key)
    {
        return Vec::new();
    }
    let before = menu.backend_save.plaintext();
    let notice = match menu.backend_save.record_run_victory_notice(class, zone_key, effective_rank) {
        Ok(notice) => notice,
        Err(error) => {
            menu.error = Some(error.to_string());
            return Vec::new();
        }
    };
    if menu.backend_save.plaintext() != before {
        menu.commit_account();
    }
    notice.filter(|_| notice_ready).map(|(rank, open)| RunEvent::HeroicProgress {
        class, zone_key, rank, open,
    }).into_iter().collect()
}

/// Native ZoneKey captures selected roster identity and the Veteran multiplier.
/// Neither may be recomputed from later picker/account state during teardown.
#[derive(Clone, Copy, Debug)]
pub(super) struct Entry {
    pub roster_guid: Option<u64>,
    pub veteran_bonus: f32,
}

/// Guest accounting outlives world construction. A terminal State15 can be
/// delivered while only the accepted cache exists; these same checkpoints must
/// then follow that cache into Mechanics and its later close transaction.
#[derive(Clone, Debug)]
pub(super) struct Checkpoints {
    pub result_saved: bool,
    pub xp_parts: [i64; 7],
    pub counts: [u32; 5],
    pub last_terminal_phase: u8,
}

impl Default for Checkpoints {
    fn default() -> Self {
        Self { result_saved: false, xp_parts: [0; 7], counts: [0; 5], last_terminal_phase: 0xff }
    }
}

impl Checkpoints {
    /// Current State15 publishes the cache before this exact terminal-edge
    /// admission. An ordinary/nonterminal snapshot never resets the marker.
    pub(super) fn admit_terminal_state(&mut self, state: &NativeState) -> bool {
        if !state.flag_8c {
            return false;
        }
        let phase = if state.byte_8f < 6 { state.byte_8f } else { 0 };
        if phase == self.last_terminal_phase {
            return false;
        }
        self.last_terminal_phase = phase;
        true
    }

    pub(super) fn acknowledge_summary(&mut self, snapshot: &Snapshot, guid: Option<u64>) {
        if guid.is_none() || !snapshot.summary_admitted() {
            return;
        }
        if let Some(delivery) = snapshot.delivery() {
            self.xp_parts = delivery.xp_parts;
            self.result_saved = true;
        }
    }

    pub(super) fn acknowledge_account(&mut self, snapshot: &Snapshot, guid: Option<u64>) {
        if guid.is_some_and(|guid| guid != crate::startup::TESTER_GUID) {
            self.counts = snapshot.counts();
        }
    }

    pub(super) fn apply_to_game(&self, game: &mut Mechanics) {
        game.restore_guest_checkpoints(
            self.xp_parts, self.counts, self.result_saved, self.last_terminal_phase,
        );
    }
}

/// Owned inputs shared by the live replica and the pre-world accepted cache.
/// Queries do not acknowledge either native checkpoint. The caller owns those
/// acknowledgements, and removes a pre-world cache only after both transactions.
pub(super) struct Snapshot {
    phase: u8,
    heroic_rank: u8,
    notice_ready: bool,
    result: RunResult,
    delivery: Option<TerminalDelivery>,
    counts: [u32; 5],
    delta_counts: [u32; 5],
    feats: RunSnapshot,
    killing_blows: Vec<(u32, u32)>,
    boss_killing_blows: Vec<BossKillingBlow>,
    personal_boss_killing_blows: Vec<BossKillingBlow>,
    damaged_by_bosses: Vec<u32>,
    boss_flags: Vec<BossFlagRow>,
    cooperative: Option<NativeCoopFeats>,
    class_key: &'static str,
}

impl Snapshot {
    pub(super) fn with_duplicate_marks(mut self, marks: &crate::save::gear_rewards::DuplicateMarks) -> Self {
        marks.apply(&mut self.feats);
        self
    }

    pub(super) fn from_mechanics(game: &Mechanics, starting_gear: [u32; 19]) -> Option<Self> {
        let phase = game.replica_phase()?.native();
        let (counts, delta_counts) = game.account_count_delivery();
        Some(Self {
            phase,
            heroic_rank: game.heroic_rank(),
            notice_ready: game.guest_notice_ready(),
            result: game.summary_result()?,
            delivery: game.summary_delivery(),
            counts,
            delta_counts,
            feats: game.feat_snapshot(starting_gear),
            killing_blows: game.killing_blows().to_vec(),
            boss_killing_blows: game.boss_killing_blows().to_vec(),
            personal_boss_killing_blows: game.personal_boss_killing_blows().to_vec(),
            damaged_by_bosses: game.damaged_by_bosses().to_vec(),
            boss_flags: game.boss_flags().to_vec(),
            cooperative: game.cooperative_feat_context(),
            class_key: game.class.key,
        })
    }

    /// The caller supplies a validated State15 and its original ZoneKey entry.
    /// Checkpoints include any earlier terminal delivery before world creation.
    pub(super) fn from_cached(state: &NativeState, entry: Entry, checkpoints: &Checkpoints) -> Self {
        let projection = RunProjection::read(state);
        let zone = azeroth_survivors_re::zones::resolve(&projection.zone);
        let zone_index = azeroth_survivors_re::guardians::catalog::ZONES
            .iter()
            .position(|row| row.key == zone.key)
            .expect("resolved native zone belongs to the zone catalog");
        let counts = state.words_70;
        let xp_parts = run_progression::talent_experience_parts_heroic(
            projection.kills,
            projection.boss_kills,
            projection.clock,
            projection.won,
            zone_index,
            projection.heroic_rank,
            entry.veteran_bonus,
        );
        let talent_xp = run_progression::talent_experience_total(xp_parts);
        let delta_counts = std::array::from_fn(|index| {
            counts[index].saturating_sub(checkpoints.counts[index])
        });
        let delta_xp_parts = std::array::from_fn(|index| {
            xp_parts[index].wrapping_sub(checkpoints.xp_parts[index])
        });
        let first_result = !checkpoints.result_saved;
        let result = RunResult {
            class: projection.class,
            zone_key: zone.key,
            counts,
            won: projection.won,
            talent_xp,
            level: projection.level,
            seconds: projection.clock as u32,
        };
        Self {
            phase: projection.phase.native(),
            heroic_rank: projection.heroic_rank,
            notice_ready: false,
            delivery: (first_result || counts != checkpoints.counts || xp_parts != checkpoints.xp_parts)
                .then(|| TerminalDelivery {
                result: result.clone(),
                delta_counts,
                xp_parts,
                delta_xp_parts,
                talent_xp: run_progression::talent_experience_total(delta_xp_parts),
                first_result,
            }),
            result,
            counts,
            delta_counts,
            feats: RunSnapshot {
                elapsed: projection.clock,
                normalized_kills: projection.kills,
                guardians: projection.guardian_kills,
                caches: projection.caches_bought,
                won: projection.won,
                bare: projection.bare,
                full_reward: projection.heroic_rank >= 3,
                heroic_rank: projection.heroic_rank,
                zone: Some(zone_index),
                endless_bosses: projection.boss_counter,
                run_marks: projection.run_marks,
                max_boss_marks: projection.max_boss_marks,
                max_equipment_stars: projection.max_equipment_stars,
                active_set: projection.active_set,
                enhancement: state.enhancement,
            },
            killing_blows: state.pairs.iter().map(|row| (row[0], row[1])).collect(),
            boss_killing_blows: state.rows.iter().map(BossKillingBlow::from).collect(),
            personal_boss_killing_blows: state.secondary_rows.iter().map(BossKillingBlow::from).collect(),
            damaged_by_bosses: state.words.clone(),
            boss_flags: state.boss_flags.clone(),
            cooperative: state.coop.clone(),
            class_key: class_key(projection.class),
        }
    }

    /// The accepted cache does not imply a synchronized local client. Native
    ///145b2e8f4/145b134eb admit guest notices only while that client is ready.
    pub(super) fn with_notice_ready(mut self, ready: bool) -> Self {
        self.notice_ready = ready;
        self
    }

    pub(super) fn summary_admitted(&self) -> bool {
        matches!(self.phase, 1..=5)
    }

    pub(super) fn delivery(&self) -> Option<&TerminalDelivery> {
        self.delivery.as_ref()
    }

    pub(super) fn counts(&self) -> [u32; 5] {
        self.counts
    }

    pub(super) fn victory(&self, menu: &mut MenuState, guid: Option<u64>) -> Vec<RunEvent> {
        persist_victory(menu, guid, self.result.class, self.result.zone_key,
            self.heroic_rank, self.result.won, self.notice_ready)
    }

    /// Native summary precedes the independent account transaction. Ready and
    /// unknown phases do not acknowledge XP/first-result checkpoints.
    pub(super) fn summary(&self, menu: &mut MenuState, guid: Option<u64>, _now: u64) -> Vec<RunEvent> {
        if !self.summary_admitted() {
            return Vec::new();
        }
        let Some(guid) = guid else { return Vec::new() };
        let eligible = guid != crate::startup::TESTER_GUID;
        let mut events = Vec::new();
        if let Some(delivery) = self.delivery.as_ref().filter(|row| eligible && row.talent_xp != 0) {
            let before = menu.backend_save.talent_xp(self.result.class) as u32;
            if let Err(error) = menu.backend_save.grant_terminal_xp(self.result.class, delivery.talent_xp) {
                menu.error = Some(error.to_string());
            } else {
                menu.commit_account();
                events.push(RunEvent::TalentXp {
                    gain: delivery.talent_xp,
                    before,
                    total: menu.backend_save.talent_xp(self.result.class) as u32,
                    class_key: self.class_key,
                    parts: delivery.delta_xp_parts,
                });
            }
        }
        menu.record_character_bests(guid, self.result.level, self.result.seconds);
        if self.delivery.as_ref().is_some_and(|row| row.first_result) {
            if eligible && self.result.won {
                match menu.backend_save.open_next_zone(self.result.class, self.result.zone_key) {
                    Ok(true) => menu.commit_account(),
                    Ok(false) => {}
                    Err(error) => menu.error = Some(error.to_string()),
                }
            }
            menu.backend_save.record_character_result(
                guid, self.result.level, self.result.seconds, self.result.won,
            );
            if eligible {
                menu.backend_save.apply_run_totals(self.result.won);
            }
        }
        // The native summary Save is unconditional after an admitted snapshot.
        menu.commit_account();
        events
    }

    /// Current145bae320 evaluates accepted guest snapshots before terminal
    /// admission. This path owns only new feat keys, dates and notifications.
    pub(super) fn live_feats(&self, menu: &mut MenuState, guid: Option<u64>, now: u64) -> Vec<RunEvent> {
        if guid.is_none_or(|guid| guid == crate::startup::TESTER_GUID)
            || !(1..=5).contains(&self.phase)
        {
            return Vec::new();
        }
        let feats = self.feats.with_heroic_cap(menu.backend_save.max_heroic_rank(
            self.result.class, self.result.zone_key));
        let mut granted = crate::progression::grant_run_feats(
            &mut menu.backend_save, feats, &self.killing_blows,
            &self.boss_killing_blows, &self.damaged_by_bosses, &self.personal_boss_killing_blows,
            &self.boss_flags, now,
        );
        if let Some(context) = &self.cooperative {
            if let Some(zone) = azeroth_survivors_re::guardians::catalog::ZONES.iter()
                .position(|row| row.key == self.result.zone_key)
            {
                granted.extend(crate::progression::grant_party_feats(
                    &mut menu.backend_save, zone, feats, context, now,
                ));
            }
        }
        if !granted.is_empty() {
            menu.commit_account();
        }
        granted.into_iter().map(RunEvent::Achievement).collect()
    }

    /// Native account admission is independent of summary phase and showcase.
    /// Exact nonnegative deltas and retained lethal/current membership snapshots
    /// enter the existing immutable Save/achievement consumers before teardown.
    pub(super) fn account(&self, menu: &mut MenuState, guid: Option<u64>, now: u64) -> Vec<RunEvent> {
        if guid.is_none_or(|guid| guid == crate::startup::TESTER_GUID) {
            return Vec::new();
        }
        let mut events = self.victory(menu, guid);
        menu.backend_save.apply_run_counts(self.delta_counts);
        let feats = self.feats.with_heroic_cap(menu.backend_save.max_heroic_rank(
            self.result.class, self.result.zone_key));
        let mut granted = crate::progression::grant_run_feats(
            &mut menu.backend_save,
            feats,
            &self.killing_blows,
            &self.boss_killing_blows,
            &self.damaged_by_bosses,
            &self.personal_boss_killing_blows,
            &self.boss_flags,
            now,
        );
        if let Some(context) = &self.cooperative {
            if self.feats.won && context.members.len() >= 2 {
                menu.backend_save.mark_cooperative_victory(self.result.zone_key);
            }
            if let Some(zone) = azeroth_survivors_re::guardians::catalog::ZONES.iter()
                .position(|row| row.key == self.result.zone_key)
            {
                granted.extend(crate::progression::grant_party_feats(
                    &mut menu.backend_save, zone, feats, context, now,
                ));
            }
        }
        granted.extend(crate::progression::grant_account(&mut menu.backend_save, Some(now)));
        menu.commit_account();
        events.extend(granted.into_iter().map(RunEvent::Achievement));
        events
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use azeroth_survivors_re::coop::replication::NativeFeatMember;

    fn entry(guid: u64) -> Entry {
        Entry { roster_guid: Some(guid), veteran_bonus: 0.0 }
    }

    fn state(phase: u8, won: bool) -> NativeState {
        NativeState {
            float_68_bits: 600_f32.to_bits(), byte_8f: phase, flag_8c: false,
            word_6c: 20, flag_8d: won, words_70: [2500, 9, 0, 1, 2],
            heroic_rank: 0, boss_counter: 0, max_equipment_stars: 0, active_set: 0,
            float_84_bits: 1_f32.to_bits(), float_88_bits: 1_f32.to_bits(),
            flag_8e: false, byte_90: 1, text: "elwynn".into(),
            pairs: Vec::new(), rows: Vec::new(), words: Vec::new(),
            secondary_rows: Vec::new(), enhancement: false, boss_flags: Vec::new(),
            coop: Some(NativeCoopFeats {
                members: [1, 5].into_iter().map(|class| NativeFeatMember { class, word: 0, byte: 0, active_set: 0 }).collect(),
                word_30: 0, heroic_rank: 0, initial_member_count: 2,
                first_fall_bits: (-1.0_f32).to_bits(), events: Vec::new(),
            }),
        }
    }

    fn menu() -> MenuState {
        let mut menu = MenuState::from_save_path(None);
        menu.backend_save = crate::save::Save::parse("42|Hero|1|1|0|0,0,0,0,0|1|0|0|0\n").unwrap();
        menu
    }

    fn replica(state: &NativeState) -> Mechanics {
        use super::super::mechanics::{RunPlayerStats, RunRules};
        let mut game = Mechanics::new(
            &state.text, "warrior",
            RunRules { heroic_rank: 0, difficulty: 1.0, density_percent: 100, hp_percent: 100,
                damage_percent: 100, speed_percent: 100, endless: false },
            RunPlayerStats {
                maximum_health: 100.0, health_per_level: 9.0, health_multiplier: 1.0,
                regeneration: 0.0, pickup_radius: 5.0, luck_bonus: 0.0,
                heal_on_kill: 0.0, armor_fraction: 0.0, damage_reduction: 0.0,
                damage_multiplier: 1.0, cooldown_multiplier: 1.0,
                critical_chance: 0.0, critical_multiplier: 1.5,
                experience_multiplier: 1.0, gold_multiplier: 1.0,
                native_race: 1, packed_player_field: 0x0101,
            },
            [1, 2, 3, 4],
        ).unwrap();
        game.apply_replica_native(state);
        game
    }

    fn close_live(game: &mut Mechanics, menu: &mut MenuState, now: u64) -> Vec<RunEvent> {
        // Exercise the actual caller, including the guest showcase exemption.
        super::super::persist_run_at(game, menu, Some(42), [0; 19], true, true, now, true);
        std::mem::take(&mut game.events)
    }

    #[test]
    fn guest_settlement_stays_separate_from_the_live_feat_poll() {
        let mut game = replica(&state(1, false));
        let mut menu = menu();
        let before = menu.backend_save.plaintext();
        super::super::persist_run_at(&mut game, &mut menu, Some(42), [0; 19], false, true, 99, false);
        assert_eq!(menu.backend_save.plaintext(), before);
        assert!(menu.account_snapshots().is_empty());
        close_live(&mut game, &mut menu, 100);
        assert_eq!(menu.backend_save.statistics().get("kills"), Some(&2500));
        assert_eq!(menu.backend_save.achievement_dates().get("feat:kills2500"), Some(&100));
    }

    #[test]
    fn live_replica_repeated_close_acknowledges_independent_xp_and_count_checkpoints() {
        let mut value = state(1, false);
        let mut game = replica(&value);
        let mut menu = menu();
        close_live(&mut game, &mut menu, 100);
        let first_save = menu.backend_save.plaintext();
        assert!(close_live(&mut game, &mut menu, 200).is_empty());
        assert_eq!(menu.backend_save.plaintext(), first_save);
        value.words_70[0] += 100;
        game.apply_replica_native(&value);
        close_live(&mut game, &mut menu, 300);
        assert_eq!(menu.backend_save.statistics().get("kills"), Some(&2600));
        assert_eq!(menu.backend_save.statistics().get("runs"), Some(&1));
        assert_eq!(menu.backend_save.achievement_dates().get("feat:kills2500"), Some(&100));
        value.words_70[0] = 10;
        game.apply_replica_native(&value);
        close_live(&mut game, &mut menu, 400);
        value.words_70[0] = 11;
        game.apply_replica_native(&value);
        close_live(&mut game, &mut menu, 500);
        assert_eq!(menu.backend_save.statistics().get("kills"), Some(&2601));
        assert_eq!(menu.backend_save.statistics().get("runs"), Some(&1));
    }

    #[test]
    fn a_standing_guest_earns_insane_before_a_later_down_state_without_count_delivery() {
        let mut value = state(1, false);
        value.text = "naxx".into();
        value.heroic_rank = 5;
        value.float_68_bits = 2400.0_f32.to_bits();
        let context = value.coop.as_mut().unwrap();
        context.heroic_rank = 5;
        context.initial_member_count = 3;
        value.coop.as_mut().unwrap().members.push(NativeFeatMember {
            class: 8, word: 0, byte: 0, active_set: 0,
        });
        let mut menu = menu();
        menu.backend_save = crate::save::Save::parse(
            "42|Hero|1|1|0|0,0,0,0,0|1|0|0|0\nbeat|1|naxx\nhbeat|1|naxx:4\n",
        ).unwrap();
        let counts_before = menu.backend_save.statistics();
        let checkpoints = Checkpoints::default();
        let standing = Snapshot::from_cached(&value, entry(42), &checkpoints);
        let events = standing.live_feats(&mut menu, Some(42), 100);
        assert!(events.iter().any(|event| matches!(event,
            RunEvent::Achievement(key) if key == "coop:insane")));
        assert_eq!(menu.backend_save.statistics(), counts_before);
        assert_eq!(checkpoints.counts, [0; 5]);
        assert!(standing.live_feats(&mut menu, Some(42), 150).is_empty());
        value.byte_8f = 4;
        value.float_68_bits = 2401.0_f32.to_bits();
        value.coop.as_mut().unwrap().first_fall_bits = 2401.0_f32.to_bits();
        let down = Snapshot::from_cached(&value, entry(42), &checkpoints);
        assert!(down.live_feats(&mut menu, Some(42), 200).is_empty());
        down.account(&mut menu, Some(42), 300);
        assert_eq!(menu.backend_save.achievement_dates().get("coop:insane"), Some(&100));
        assert_eq!(menu.backend_save.statistics().get("kills"), Some(&2500));
    }

    #[test]
    fn gandling_result_reaches_the_cached_and_live_guest_save_once() {
        let mut value = state(1, false);
        value.text = "scholomance".into();
        let checkpoints = Checkpoints::default();
        for flags in [0, 1] {
            value.boss_flags = vec![BossFlagRow { boss_id: 1853, flags }];
            let cached = Snapshot::from_cached(&value, entry(42), &checkpoints);
            let replica = replica(&value);
            let live = Snapshot::from_mechanics(&replica, [0; 19]).unwrap();
            let mut menu = menu();
            let earned = cached.live_feats(&mut menu, Some(42), 100);
            assert_eq!(earned.iter().any(|event| matches!(
                event, RunEvent::Achievement(key) if key == "feat:straightas"
            )), flags != 0);
            let repeated = live.live_feats(&mut menu, Some(42), 200);
            assert!(!repeated.iter().any(|event| matches!(
                event, RunEvent::Achievement(key) if key == "feat:straightas"
            )));
            assert_eq!(menu.backend_save.achievement_dates().get("feat:straightas").copied(),
                (flags != 0).then_some(100));
        }
    }

    #[test]
    fn cached_party_first_fall_matches_live_replica_snapshot() {
        for marker in [-1.0_f32, 0.0, 2399.0, 2400.0, 2401.0] {
            let mut value = state(1, false);
            value.float_68_bits = 2500.0_f32.to_bits();
            value.coop.as_mut().unwrap().first_fall_bits = marker.to_bits();
            let cached = Snapshot::from_cached(&value, entry(42), &Checkpoints::default());
            let live = replica(&value).cooperative_feat_context();
            assert_eq!(cached.cooperative.as_ref().unwrap().first_fall_bits, marker.to_bits());
            assert_eq!(live, cached.cooperative);
        }
    }

    #[test]
    fn cached_terminal_then_bootstrap_and_close_preserve_delivered_checkpoints() {
        let entry = entry(42);
        let mut value = state(5, true);
        value.flag_8c = true;
        let mut checkpoints = Checkpoints::default();
        assert!(checkpoints.admit_terminal_state(&value));
        let snapshot = Snapshot::from_cached(&value, entry, &checkpoints);
        let mut menu = menu();
        snapshot.summary(&mut menu, entry.roster_guid, 100);
        checkpoints.acknowledge_summary(&snapshot, entry.roster_guid);
        snapshot.account(&mut menu, entry.roster_guid, 100);
        checkpoints.acknowledge_account(&snapshot, entry.roster_guid);
        let statistics = menu.backend_save.statistics();
        let xp = menu.backend_save.talent_xp(1);
        let dates = menu.backend_save.achievement_dates();
        assert!(!checkpoints.admit_terminal_state(&value));
        let repeated = Snapshot::from_cached(&value, entry, &checkpoints);
        assert!(repeated.delivery().is_none());
        assert!(repeated.summary(&mut menu, entry.roster_guid, 200).is_empty());
        assert!(repeated.account(&mut menu, entry.roster_guid, 200).is_empty());
        let mut game = replica(&value);
        checkpoints.apply_to_game(&mut game);
        assert!(Snapshot::from_mechanics(&game, [0; 19]).unwrap().delivery().is_none());
        assert!(close_live(&mut game, &mut menu, 300).is_empty());
        assert_eq!(menu.backend_save.statistics(), statistics);
        assert_eq!(menu.backend_save.talent_xp(1), xp);
        assert_eq!(menu.backend_save.achievement_dates(), dates);
    }

    #[test]
    fn terminal_state_gate_keeps_marker_across_nonterminal_and_clamps_unknown_phase() {
        let mut checkpoints = Checkpoints::default();
        assert_eq!(checkpoints.last_terminal_phase, 0xff);
        let mut value = state(0, false);
        assert!(!checkpoints.admit_terminal_state(&value));
        assert_eq!(checkpoints.last_terminal_phase, 0xff);
        value.flag_8c = true;
        assert!(checkpoints.admit_terminal_state(&value));
        assert_eq!(checkpoints.last_terminal_phase, 0);
        value.byte_8f = 255;
        assert!(!checkpoints.admit_terminal_state(&value));
        value.byte_8f = 4;
        assert!(checkpoints.admit_terminal_state(&value));
        value.flag_8c = false;
        value.byte_8f = 1;
        assert!(!checkpoints.admit_terminal_state(&value));
        assert_eq!(checkpoints.last_terminal_phase, 4);
        value.flag_8c = true;
        value.byte_8f = 4;
        assert!(!checkpoints.admit_terminal_state(&value));
        value.byte_8f = 5;
        assert!(checkpoints.admit_terminal_state(&value));
    }

    #[test]
    fn cached_running_guest_saves_summary_then_account_without_world_construction() {
        let entry = entry(42);
        let snapshot = Snapshot::from_cached(&state(1, false), entry, &Checkpoints::default());
        let mut menu = menu();
        let mut events = snapshot.summary(&mut menu, entry.roster_guid, 100);
        assert_eq!(menu.backend_save.statistics().get("runs"), Some(&1));
        assert_eq!(menu.backend_save.statistics().get("kills"), None);
        let summary_writes = menu.account_snapshots().len();
        events.extend(snapshot.account(&mut menu, entry.roster_guid, 100));
        assert_eq!(menu.backend_save.statistics().get("kills"), Some(&2500));
        assert_eq!(menu.backend_save.achievement_dates().get("feat:kills2500"), Some(&100));
        assert!(menu.account_snapshots()[..summary_writes].iter().all(|save|
            save.statistics().get("kills").copied().unwrap_or(0) == 0));
        assert!(events.iter().any(|event| matches!(event, RunEvent::TalentXp { gain, .. } if *gain > 0)));
        assert!(events.iter().any(|event| matches!(event, RunEvent::Achievement(key) if key == "feat:kills2500")));
    }

    #[test]
    fn cached_victory_keeps_existing_dates_and_writes_both_zone_histories() {
        let entry = entry(42);
        let snapshot = Snapshot::from_cached(&state(5, true), entry, &Checkpoints::default());
        let mut menu = menu();
        menu.backend_save.grant_achievements(&["feat:kills2500".into()], Some(7));
        snapshot.summary(&mut menu, entry.roster_guid, 100);
        snapshot.account(&mut menu, entry.roster_guid, 100);
        assert!(menu.backend_save.beaten_zones().contains(&(1, 0)));
        assert!(menu.backend_save.cooperative_beaten_zones().contains(&0));
        assert_eq!(menu.backend_save.achievement_dates().get("feat:kills2500"), Some(&7));
        assert_eq!(menu.backend_save.achievement_dates().get("coop:together"), Some(&100));
        assert_eq!(menu.backend_save.statistics().get("wins"), Some(&1));
    }

    #[test]
    fn two_player_guest_earns_united_front_from_new_settled_clears() {
        let mut menu = menu();
        for zone in ["wsg", "ab"] {
            menu.backend_save.record_beaten_zone(1, zone).unwrap();
        }
        let entry = entry(42);
        let mut value = state(2, true);
        value.text = "wsg".into();
        let snapshot = Snapshot::from_cached(&value, entry, &Checkpoints::default());
        snapshot.live_feats(&mut menu, entry.roster_guid, 90);
        assert!(menu.backend_save.cooperative_beaten_zones().is_empty());
        assert_eq!(crate::progression::account_run_grants(&menu.backend_save, 1).cooperative_luck, 0.0);

        value.flag_8c = true;
        value.byte_8f = 5;
        let snapshot = Snapshot::from_cached(&value, entry, &Checkpoints::default());
        snapshot.account(&mut menu, entry.roster_guid, 100);
        assert_eq!(menu.backend_save.cooperative_beaten_zones(), [2].into());
        assert!(!menu.backend_save.earned_achievements().contains("coop:team"));

        value.text = "ab".into();
        let mut game = replica(&value);
        let earned = close_live(&mut game, &mut menu, 200);
        assert!(earned.iter().any(|event| matches!(event,
            RunEvent::Achievement(key) if key == "coop:team")));
        assert!(!close_live(&mut game, &mut menu, 300).iter().any(|event| matches!(event,
            RunEvent::Achievement(key) if key == "coop:team")));
        let restored = crate::save::Save::parse(&menu.backend_save.plaintext()).unwrap();
        assert_eq!(restored.cooperative_beaten_zones(), [2, 4].into());
        assert_eq!(restored.achievement_dates().get("coop:team"), Some(&200));
        assert_eq!(crate::progression::account_run_grants(&restored, 1).cooperative_luck, 0.1);
    }

    #[test]
    fn nonterminal_choice_snapshot_saves_clear_without_acknowledging_summary_or_counts() {
        let entry = entry(42);
        let mut value = state(2, true);
        value.heroic_rank = 1;
        let checkpoints = Checkpoints::default();
        let snapshot = Snapshot::from_cached(&value, entry, &checkpoints).with_notice_ready(true);
        let mut menu = menu();
        menu.backend_save.record_beaten_zone(1, "elwynn").unwrap();
        let events = snapshot.victory(&mut menu, entry.roster_guid);
        assert!(menu.backend_save.beaten_zones().contains(&(1, 0)));
        assert_eq!(menu.backend_save.heroic_cleared_rank(1, "elwynn"), 1);
        assert_eq!(menu.account_snapshots().len(), 1);
        assert!(matches!(events.as_slice(), [RunEvent::HeroicProgress { rank: 1, open: 2, .. }]));
        assert!(snapshot.victory(&mut menu, entry.roster_guid).is_empty());
        assert_eq!(menu.account_snapshots().len(), 1);
        assert_eq!(menu.backend_save.talent_xp(1), 0);
        assert!(menu.backend_save.statistics().is_empty());
        assert!(!checkpoints.result_saved);
        assert_eq!(checkpoints.xp_parts, [0; 7]);
        assert_eq!(checkpoints.counts, [0; 5]);
        assert_eq!(checkpoints.last_terminal_phase, 0xff);
        assert!(snapshot.delivery().is_some(), "summary delivery remains unacknowledged");
    }

    #[test]
    fn immediate_clear_keeps_guid_admission_and_notice_readiness_independent() {
        let mut value = state(2, true);
        value.heroic_rank = 1;
        let snapshot = Snapshot::from_cached(&value, entry(42), &Checkpoints::default());
        let mut menu = menu();
        menu.backend_save.record_beaten_zone(1, "elwynn").unwrap();
        let before = menu.backend_save.plaintext();
        for guid in [None, Some(crate::startup::TESTER_GUID)] {
            assert!(snapshot.victory(&mut menu, guid).is_empty());
        }
        assert_eq!(menu.backend_save.plaintext(), before);
        assert!(menu.account_snapshots().is_empty());
        // Zero is an eligible captured GUID; an unready local client suppresses
        // the notice while keeping the immediate durable clear.
        assert!(snapshot.victory(&mut menu, Some(0)).is_empty());
        assert_eq!(menu.backend_save.heroic_cleared_rank(1, "elwynn"), 1);
        assert_eq!(menu.account_snapshots().len(), 1);
        assert!(menu.backend_save.statistics().is_empty());
    }

    #[test]
    fn clear_only_helper_preserves_normal_and_class_zone_heroic_ceiling() {
        let mut menu = menu();
        assert!(persist_victory(&mut menu, Some(42), 1, "duskwood", 0, true, true).is_empty());
        assert!(menu.backend_save.beaten_zones().contains(&(1, 1)));
        assert_eq!(menu.backend_save.heroic_cleared_rank(1, "duskwood"), 0);
        let writes = menu.account_snapshots().len();
        assert!(persist_victory(&mut menu, Some(42), 1, "duskwood", 0, true, true).is_empty());
        assert_eq!(menu.account_snapshots().len(), writes);
        menu.backend_save.record_heroic_victory(2, "elwynn", 3).unwrap();
        menu.backend_save.record_beaten_zone(2, "elwynn").unwrap();
        // Another class opens the account ceiling, but this class still lacks
        // its own Normal clear when the captured rank is bounded.
        let first = persist_victory(&mut menu, Some(42), 1, "elwynn", 1, true, true);
        assert!(first.is_empty());
        assert!(menu.backend_save.beaten_zones().contains(&(1, 0)));
        assert_eq!(menu.backend_save.heroic_cleared_rank(1, "elwynn"), 0);
        let events = persist_victory(&mut menu, Some(42), 1, "elwynn", 4, true, true);
        assert!(matches!(events.as_slice(), [RunEvent::HeroicProgress { class: 1, rank: 4, open: 5, .. }]));
        assert_eq!(menu.backend_save.heroic_cleared_rank(1, "elwynn"), 4);
        assert_eq!(menu.backend_save.heroic_cleared_rank(2, "elwynn"), 3);
        assert_eq!(menu.backend_save.heroic_cleared_rank(1, "duskwood"), 0);
        assert!(persist_victory(&mut menu, Some(42), 1, "elwynn", 4, true, true).is_empty());
        assert!(menu.backend_save.statistics().is_empty());
        assert_eq!(menu.backend_save.talent_xp(1), 0);
    }

    #[test]
    fn ready_and_unknown_phases_skip_summary_but_keep_independent_account_delivery() {
        for phase in [0, 6, 255] {
            let entry = entry(42);
            let snapshot = Snapshot::from_cached(&state(phase, false), entry, &Checkpoints::default());
            let mut menu = menu();
            assert!(snapshot.summary(&mut menu, entry.roster_guid, 100).is_empty());
            assert!(menu.account_snapshots().is_empty());
            snapshot.account(&mut menu, entry.roster_guid, 100);
            assert_eq!(menu.backend_save.statistics().get("runs"), None);
            assert_eq!(menu.backend_save.statistics().get("kills"), Some(&2500));
            assert_eq!(menu.backend_save.talent_xp(1), 0);
        }
    }

    #[test]
    fn tester_preserves_summary_bests_without_account_grants_or_xp() {
        let entry = entry(crate::startup::TESTER_GUID);
        let snapshot = Snapshot::from_cached(&state(5, true), entry, &Checkpoints::default());
        let mut menu = menu();
        assert!(snapshot.summary(&mut menu, entry.roster_guid, 100).is_empty());
        let writes = menu.account_snapshots().len();
        assert!(snapshot.account(&mut menu, entry.roster_guid, 100).is_empty());
        assert_eq!(menu.account_snapshots().len(), writes);
        assert!(menu.backend_save.statistics().is_empty());
        assert_eq!(menu.backend_save.talent_xp(1), 0);
        assert!(menu.backend_save.cooperative_beaten_zones().is_empty());
    }

    #[test]
    fn captured_veteran_bonus_survives_later_account_changes() {
        let entry = Entry { roster_guid: Some(42), veteran_bonus: 0.4 };
        let snapshot = Snapshot::from_cached(&state(1, false), entry, &Checkpoints::default());
        let expected = snapshot.delivery().unwrap().talent_xp;
        let mut menu = menu();
        menu.backend_save.grant_terminal_xp(1, 1000).unwrap();
        let events = snapshot.summary(&mut menu, entry.roster_guid, 100);
        assert!(events.iter().any(|event| matches!(event, RunEvent::TalentXp { gain, before: 1000, .. } if *gain == expected)));
        assert_ne!(snapshot.delivery().unwrap().xp_parts[6], 0);
    }
}
