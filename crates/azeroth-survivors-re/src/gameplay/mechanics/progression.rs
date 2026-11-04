//! Connect actual run terminal totals and reward queues to the save owner.
use super::*;
use azeroth_survivors_re::run_progression::{self, RunResult, TerminalDelivery};
use azeroth_survivors_re::coop::replication::EquipmentGrant;

/// Keep account-delivery ownership separate from the run summary's ordered loot.
#[derive(Debug, Default)]
pub(super) struct EquipmentDrops {
    pending: Vec<EquipmentGrant>,
    history: Vec<u32>,
    pity: std::collections::BTreeMap<u32, u8>,
    owned: std::collections::BTreeSet<u32>,
    pending_misses: Vec<u32>,
    pending_marks: f32,
    marks_total: f32,
    max_boss_marks: f32,
    boss_serial: u32,
    duplicate_marks: crate::save::gear_rewards::DuplicateMarks,
}

impl EquipmentDrops {
    pub(super) fn roll_boss(&mut self, class: u8, zone: usize, boss: usize,
        roll: azeroth_survivors_re::mob_loot::EquipmentRoll, heroic_rank: u8,
        endless_bosses: Option<u32>, rng: &mut azeroth_survivors_re::treasure_chests::NativeRng)
    {
        if roll.extra_pickup_mode { return; }
        let reward = azeroth_survivors_re::mob_loot::roll_boss_rewards(class, zone, boss,
            roll, heroic_rank, endless_bosses, &mut self.pity, &self.owned, rng);
        self.pending_marks += reward.marks;
        self.marks_total += reward.marks;
        self.max_boss_marks = self.max_boss_marks.max(reward.marks);
        self.boss_serial = self.boss_serial.wrapping_add(1);
        self.pending_misses.extend(reward.missed_ids);
        for id in reward.items {
            self.owned.insert(id);
            self.pending.push(EquipmentGrant { item_id: id, boss_key: self.boss_serial,
                boss_marks_bits: reward.marks.to_bits() });
            self.history.push(id);
        }
    }
    pub(super) fn queue(&mut self, id: u32) {
        self.pending.push(EquipmentGrant { item_id: id, ..Default::default() });
        self.history.push(id);
    }
    pub(super) fn pending(&self) -> Vec<u32> {
        self.pending.iter().map(|grant| grant.item_id).collect()
    }
    fn drain(&mut self) -> Vec<EquipmentGrant> {
        std::mem::take(&mut self.pending)
    }
}

impl Mechanics {
    /// Current constructor clones the account's piece counters into each
    /// recipient's run. Successful rolls clear this copy before any save tick.
    pub fn set_equipment_pity(&mut self, pity: &[(u32, u8)]) {
        self.boss_state.equipment.pity = pity.iter().copied().collect();
    }

    pub fn set_equipment_ownership(&mut self, owned: impl IntoIterator<Item = u32>) {
        self.boss_state.equipment.owned = owned.into_iter().collect();
    }

    /// This queue is independent of successful equipment and retains miss order.
    pub fn drain_boss_rewards(&mut self) -> (f32, Vec<u32>) {
        let state = &mut self.boss_state.equipment;
        (std::mem::take(&mut state.pending_marks), std::mem::take(&mut state.pending_misses))
    }

    pub fn run_marks(&self) -> f32 {
        self.boss_state.equipment.duplicate_marks.run_marks(self.base_run_marks())
    }
    pub fn max_boss_marks(&self) -> f32 {
        self.boss_state.equipment.duplicate_marks.max_boss_marks(self.base_max_boss_marks())
    }
    pub fn base_run_marks(&self) -> f32 {
        self.replica_state().map_or(self.boss_state.equipment.marks_total, |state| state.run_marks)
    }

    pub fn base_max_boss_marks(&self) -> f32 {
        self.replica_state().map_or(self.boss_state.equipment.max_boss_marks, |state| state.max_boss_marks)
    }

    pub fn record_equipment_receipt(&mut self, grant: &EquipmentGrant, earned_tenths: u32) {
        self.boss_state.equipment.duplicate_marks.record(grant, earned_tenths);
    }

    pub fn set_duplicate_marks(&mut self, marks: crate::save::gear_rewards::DuplicateMarks) {
        self.boss_state.equipment.duplicate_marks = marks;
    }

    pub fn endless_boss_kills(&self) -> u32 {
        self.replica_state().map_or(self.boss_state.endless_bosses, |state| state.boss_counter)
    }
    /// Current14594b330 admits active phases1..3 into terminal phase4.
    /// Health remains unchanged; the shared stop owner resolves only primary height.
    pub fn abandon(&mut self, height: impl FnMut([f32; 2]) -> Option<f32>) {
        if !self.dead && !self.completed {
            self.discard_choice_offers();
            self.abandoned = true;
            self.dead = true;
            self.fall_epoch = self.clock;
            self.record_party_fall();
            if !self.has_party() { self.freeze_world_movements(height); }
            self.queue_party_fall_banner();
        }
    }
    /// Native item ownership is consumed during live ticks, independently of final
    /// class XP/counters. Moving the queue prevents a retry from duplicating items.
    pub fn drain_equipment(&mut self) -> Vec<u32> {
        self.drain_equipment_grants().into_iter().map(|grant| grant.item_id).collect()
    }
    pub fn drain_equipment_grants(&mut self) -> Vec<EquipmentGrant> {
        self.boss_state.equipment.drain()
    }

    /// All equipment earned during this run, retaining repeated drops and order
    /// after the separate account delivery queue has been drained.
    pub fn run_equipment(&self) -> &[u32] {
        &self.boss_state.equipment.history
    }
    /// Current Game+758 counter, independent of account-delivery queues.
    pub fn elite_kills(&self) -> u32 {
        self.elite_kills
    }
    /// Current145ccc577 publishes the final-boss phase for every local run,
    /// including a solo choice before the terminal summary. The latch also
    /// stays set after the victory summary resumes endless.
    pub fn victory_reached(&self) -> bool {
        self.replica_state().map_or(self.effect_state.victory_reached || self.completed
            || self.boss_state.completion.phase != 0, |state| state.won)
    }
    /// Current1458feff0 resumes every hero after shared victory. Living heroes
    /// use145903b80; zero-health heroes return to down state4. The deadline
    /// starts on this click; scaling keeps the earlier final-boss timestamp.
    pub fn continue_endless(&mut self) -> bool {
        if self.has_party() {
            if self.replica_state().is_some() || self.party_terminal_phase() != Some(5) { return false; }
            for (slot, _) in self.party_members() {
                self.with_party_hero(slot, |game| {
                    if !(game.health() <= 0.0) { game.continue_hero_endless(); }
                    else { game.completed = false; game.dead = true; }
                });
            }
            return true;
        }
        self.continue_hero_endless()
    }
    fn continue_hero_endless(&mut self) -> bool {
        if !self.completed || self.dead {
            return false;
        }
        self.boss_state.continue_endless(self.clock);
        self.rules.endless = true;
        self.completed = false;
        self.root_player(false);
        true
    }
    /// Idempotent highest-seen merging belongs to Save::record_seen.
    pub fn seen_abilities(&self) -> &[(String, u8)] {
        &self.effect_state.seen
    }
    pub fn set_account_grants(&mut self, grants: run_progression::AccountGrants) {
        // AccountGrants carries the retained Normal base of three plus the
        // purchased perk. The current Game constructor selects its rank base.
        let free_rerolls = grants.free_rerolls.wrapping_sub(3)
            .wrapping_add(azeroth_survivors_re::heroic::free_rerolls_base(self.rules.heroic_rank));
        self.set_choice_grants(free_rerolls, grants.banishes, grants.skip);
        self.choice_state.extra_first_card = grants.opening;
        self.effect_state.equipped.equipment_chance = grants.equipment_chance;
        self.effect_state.talent_xp_bonus = grants.veteran_bonus;
        self.effect_state.cooperative_luck = grants.cooperative_luck;
        if self.has_party() {
            self.refresh_effects();
        }
    }
    /// Current0.112.0 tick1458b0828..0a9e invokes the summary on a changed terminal
    /// phase only. Explicit Again/Menu still invoke it independently.
    pub fn take_terminal_phase_edge(&mut self) -> bool {
        let phase = if self.completed {
            5
        } else if self.dead {
            4
        } else {
            return false;
        };
        if self.effect_state.last_terminal_phase == phase {
            return false;
        }
        self.effect_state.last_terminal_phase = phase;
        true
    }

    pub fn run_result(&self) -> Option<RunResult> {
        if self.effect_state.result_saved {
            return None;
        }
        self.terminal_result()
    }
    /// Stable terminal projection: saving the account result does not remove
    /// the summary inputs while the finished run remains visible.
    pub fn terminal_result(&self) -> Option<RunResult> {
        if !self.dead && !self.completed {
            return None;
        }
        self.summary_result()
    }

    /// Explicit Again/Menu invoke native summary1458b9fb0 in any started phase.
    pub fn summary_result(&self) -> Option<RunResult> {
        let xp_parts = self.summary_xp_parts()?;
        Some(RunResult {
            class: self.class.class_id,
            zone_key: self.zone.key,
            counts: self.terminal_counts(),
            won: self.victory_reached(),
            talent_xp: run_progression::talent_experience_total(xp_parts),
            level: self.level,
            seconds: self.clock as u32,
        })
    }

    fn terminal_counts(&self) -> [u32; 5] {
        [
            self.kills,
            self.gold_earned,
            self.guardian_kills(),
            self.boss_kills(),
            self.caches_bought(),
        ]
    }

    /// Account delivery has its own checkpoint, independent of the summary's
    /// started-phase, XP and first-result admission (0.119.0 145b15590).
    pub fn account_count_delivery(&self) -> ([u32; 5], [u32; 5]) {
        let counts = self.terminal_counts();
        let delta = std::array::from_fn(|index| {
            counts[index].saturating_sub(self.effect_state.terminal_counts[index])
        });
        (counts, delta)
    }

    pub fn mark_account_counts_saved(&mut self, counts: [u32; 5]) {
        self.effect_state.terminal_counts = counts;
    }

    /// World bootstrap adopts any settlement already delivered from the
    /// accepted guest cache; creating its Mechanics must not reset that debt.
    pub fn restore_guest_checkpoints(&mut self, xp_parts: [i64; 7], counts: [u32; 5],
        result_saved: bool, last_terminal_phase: u8) {
        self.effect_state.terminal_xp_parts = xp_parts;
        self.effect_state.terminal_counts = counts;
        self.effect_state.result_saved = result_saved;
        self.effect_state.last_terminal_phase = last_terminal_phase;
    }

    /// Cumulative native XP components, retained independently of delivery.
    pub fn terminal_xp_parts(&self) -> Option<[i64; 7]> {
        if !self.dead && !self.completed {
            return None;
        }
        self.summary_xp_parts()
    }

    /// Guests retain the host's accepted State15 rank. Local play uses the
    /// run's immutable configuration rather than later picker/account edits.
    pub fn heroic_rank(&self) -> u8 {
        self.replica_state().map_or(self.rules.heroic_rank, |state| state.heroic_rank)
    }

    fn summary_xp_parts(&self) -> Option<[i64; 7]> {
        let zone = azeroth_survivors_re::bosses::catalog::ZONES
            .iter()
            .position(|zone| zone.key == self.zone.key)?;
        Some(run_progression::talent_experience_parts_heroic(
            self.kills,
            self.boss_kills(),
            self.clock,
            self.victory_reached(),
            zone,
            self.heroic_rank(),
            self.effect_state.talent_xp_bonus,
        ))
    }

    pub fn feat_snapshot(&self, starting_gear: [u32; 19]) -> azeroth_survivors_re::account_progression::RunSnapshot {
        use azeroth_survivors_re::account_progression::RunSnapshot;
        if let Some(state) = self.replica_state() {
            return RunSnapshot { elapsed: self.clock,
                normalized_kills: self.kills,
                guardians: state.guardian_kills, caches: state.caches_bought,
                won: state.won, bare: state.bare,
                full_reward: state.heroic_rank >= 3, heroic_rank: state.heroic_rank,
                zone: azeroth_survivors_re::guardians::catalog::ZONES.iter().position(|zone|
                    zone.key == azeroth_survivors_re::zones::resolve(&state.zone).key),
                endless_bosses: state.boss_counter,
                run_marks: self.run_marks(),
                max_boss_marks: self.max_boss_marks(),
                max_equipment_stars: state.max_equipment_stars,
                active_set: state.active_set,
                enhancement: self.graduation_enhancement() };
        }
        let mut snapshot = RunSnapshot::from_heroic_run(self.clock, self.kills,
            self.guardian_kills(), self.caches_bought(), self.victory_reached(),
            starting_gear, self.heroic_rank());
        snapshot.zone = azeroth_survivors_re::guardians::catalog::ZONES.iter()
            .position(|zone| zone.key == self.zone.key);
        snapshot.endless_bosses = self.endless_boss_kills();
        snapshot.run_marks = self.run_marks();
        snapshot.max_boss_marks = self.max_boss_marks();
        snapshot.max_equipment_stars = self.equipment_stars().into_iter().max().unwrap_or(0);
        snapshot.active_set = self.effect_state.set_descriptor.map_or(0, |set| set.tier + 1);
        snapshot.enhancement = self.graduation_enhancement();
        snapshot
    }

    /// Current1458b9fb0 delivers new terminal deltas after endless continuation
    /// while its first-result flag prevents duplicate run/win/unlock rewards.
    /// Reading the projection never advances its saved snapshots.
    pub fn terminal_delivery(&self) -> Option<TerminalDelivery> {
        self.terminal_result()?;
        self.summary_delivery()
    }

    pub fn summary_delivery(&self) -> Option<TerminalDelivery> {
        let result = self.summary_result()?;
        let xp_parts = self.summary_xp_parts()?;
        let (_, delta_counts) = self.account_count_delivery();
        let delta_xp_parts = std::array::from_fn(|index| {
            xp_parts[index].wrapping_sub(self.effect_state.terminal_xp_parts[index])
        });
        let first_result = !self.effect_state.result_saved;
        // Zero/negative XP still changes the snapshot and must be acknowledged.
        if !first_result
            && result.counts == self.effect_state.terminal_counts
            && xp_parts == self.effect_state.terminal_xp_parts
        {
            return None;
        }
        Some(TerminalDelivery {
            result,
            delta_counts,
            xp_parts,
            delta_xp_parts,
            talent_xp: run_progression::talent_experience_total(delta_xp_parts),
            first_result,
        })
    }

    /// Acknowledge the exact transaction that was saved, including zero XP and
    /// negative component deltas. A continuation retains all three snapshots.
    pub fn mark_terminal_delivery_saved(&mut self, delivery: &TerminalDelivery) {
        self.mark_terminal_summary_saved(delivery, true);
    }

    /// Current summary always acknowledges XP/first result; the later tick count
    /// owner acknowledges five counters only for a valid, non-showcase account.
    pub fn mark_terminal_summary_saved(&mut self, delivery: &TerminalDelivery, counts_saved: bool) {
        if counts_saved {
            self.mark_account_counts_saved(delivery.result.counts);
        }
        self.effect_state.terminal_xp_parts = delivery.xp_parts;
        self.effect_state.result_saved = true;
    }

    pub fn mark_run_result_saved(&mut self) {
        if let Some(delivery) = self.terminal_delivery() {
            self.mark_terminal_delivery_saved(&delivery);
        } else {
            self.effect_state.result_saved = true;
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::rng_integration::{TerrainFixture, class_run};
    use super::*;

    #[test]
    fn solo_final_clear_with_pending_choice_reaches_state_and_save_before_summary() {
        let mut game = class_run("warrior", 1);
        game.rules.heroic_rank = 1;
        game.add_experience(5);
        assert!(game.is_paused_for_choice() && !game.has_party());
        // The current final-death owner sets this shared phase before choices
        // allow finish_boss_completion to publish the terminal result.
        game.boss_state.completion.phase = 1;
        assert!(!game.completed && !game.effect_state.victory_reached);
        let state = game.native_state();
        assert_eq!(state.byte_8f, 2);
        assert!(state.flag_8d && !state.flag_8c);
        assert!(game.terminal_result().is_none());

        let mut menu = crate::menu_state::MenuState::from_save_path(None);
        // A legitimate Heroic run already has this class's Normal clear.
        menu.backend_save.record_beaten_zone(1, "elwynn").unwrap();
        crate::gameplay::persist_run_at(
            &mut game, &mut menu, Some(42), [0; 19], false, true, 100, false,
        );
        assert_eq!(menu.backend_save.heroic_cleared_rank(1, "elwynn"), 1);
        assert!(menu.backend_save.statistics().is_empty());
        assert_eq!(menu.backend_save.talent_xp(1), 0);
        assert!(!game.effect_state.result_saved);
        assert_eq!(game.effect_state.terminal_counts, [0; 5]);
        assert_eq!(game.effect_state.terminal_xp_parts, [0; 7]);
        assert!(game.is_paused_for_choice() && !game.completed);
        let saved = menu.backend_save.plaintext();
        let writes = menu.account_snapshots().len();
        crate::gameplay::persist_run_at(
            &mut game, &mut menu, Some(42), [0; 19], false, true, 200, false,
        );
        assert_eq!(menu.backend_save.plaintext(), saved);
        assert_eq!(menu.account_snapshots().len(), writes);
    }

    #[test]
    fn solo_pending_choice_without_final_phase_does_not_publish_or_save_a_clear() {
        let mut game = class_run("warrior", 1);
        game.add_experience(5);
        assert!(game.is_paused_for_choice() && !game.has_party());
        assert_eq!(game.boss_state.completion.phase, 0);
        let state = game.native_state();
        assert_eq!(state.byte_8f, 2);
        assert!(!state.flag_8d && !state.flag_8c);
        let mut menu = crate::menu_state::MenuState::from_save_path(None);
        crate::gameplay::persist_run_at(
            &mut game, &mut menu, Some(42), [0; 19], false, true, 100, false,
        );
        assert!(menu.backend_save.beaten_zones().is_empty());
        assert_eq!(menu.backend_save.heroic_cleared_rank(1, "elwynn"), 0);
        assert!(menu.backend_save.statistics().is_empty());
        assert_eq!(menu.backend_save.talent_xp(1), 0);
    }

    #[test]
    fn zero_delta_endless_terminal_still_improves_saved_character_bests() {
        let mut menu = crate::menu_state::MenuState::from_save_path(None);
        menu.backend_save = crate::save::Save::parse("42|Hero|1|1|0|0,0,0,0,0|1|0|0|0\n").unwrap();
        let mut game = class_run("priest", 0);
        game.completed = true;
        game.effect_state.victory_reached = true;
        game.clock = 60.;
        game.level = 20;
        crate::gameplay::persist_run_at(
            &mut game,
            &mut menu,
            Some(42),
            [0; 19],
            false,
            true,
            1700000000,
            false,
        );
        assert!(game.terminal_delivery().is_none());
        assert!(game.continue_endless());
        game.dead = true;
        game.level = 21;
        assert!(game.terminal_delivery().is_none());
        crate::gameplay::persist_run_at(
            &mut game,
            &mut menu,
            Some(42),
            [0; 19],
            false,
            true,
            1700000001,
            false,
        );
        let hero = &menu.backend_save.characters()[0];
        assert_eq!(
            (hero.best_level, hero.best_seconds, hero.runs, hero.wins),
            (21, 60, 1, 1)
        );
    }

    #[test]
    fn terminal_delivery_queries_do_not_acknowledge_and_only_save_the_delivered_snapshot() {
        let mut game = class_run("priest", 0);
        game.clock = 60.0;
        game.kills = 100;
        game.gold_earned = 9;
        game.dead = true;
        let first = game.terminal_delivery().unwrap();
        assert!(first.first_result);
        assert_eq!(first.delta_counts, [100, 9, 0, 0, 0]);
        assert_eq!(first.delta_xp_parts, [12, 10, 0, 0, 0, 0, 0]);
        assert_eq!(first.talent_xp, 22);
        assert_eq!(game.terminal_delivery(), Some(first.clone()));
        game.gold_earned = 12;
        game.mark_terminal_delivery_saved(&first);
        let pending = game.terminal_delivery().unwrap();
        assert!(!pending.first_result);
        assert_eq!(pending.delta_counts, [0, 3, 0, 0, 0]);
        assert_eq!(pending.talent_xp, 0);
        assert_eq!(game.run_result(), None);
        game.mark_terminal_delivery_saved(&pending);
        assert_eq!(game.terminal_delivery(), None);
        game.clock = 120.0;
        game.kills = 200;
        let later = game.terminal_delivery().unwrap();
        assert!(!later.first_result);
        assert_eq!(later.delta_counts, [100, 0, 0, 0, 0]);
        assert_eq!(later.delta_xp_parts, [12, 10, 0, 0, 0, 0, 0]);
        assert_eq!(later.talent_xp, 22);
    }

    #[test]
    fn zero_xp_and_saturated_count_decreases_still_advance_terminal_snapshots() {
        let mut game = class_run("priest", 0);
        game.clock = 60.0;
        game.gold_earned = 10;
        game.dead = true;
        let first = game.terminal_delivery().unwrap();
        game.mark_terminal_delivery_saved(&first);
        // Preserve a negative part delta rather than filtering positive rows
        // before account arithmetic. Lower counters use unsigned saturation.
        game.clock = 55.0;
        game.gold_earned = 1;
        let lower = game.terminal_delivery().unwrap();
        assert_eq!(lower.delta_counts, [0; 5]);
        assert_eq!(lower.delta_xp_parts, [-1, 0, 0, 0, 0, 0, 0]);
        assert_eq!(lower.talent_xp, 0);
        game.mark_terminal_delivery_saved(&lower);
        assert_eq!(game.terminal_delivery(), None);
        game.gold_earned = 2;
        assert_eq!(
            game.terminal_delivery().unwrap().delta_counts,
            [0, 1, 0, 0, 0]
        );
    }

    #[test]
    fn abandoning_an_offer_preserves_earned_levels_and_purchased_reward_counters() {
        let mut game = class_run("priest", 0);
        game.set_store_levels(true);
        game.add_experience(5);
        game.chest_state.system.pending_choices = 2;
        game.generate_cache_choices();
        assert!(!game.choices.is_empty());
        assert!(game.cache_choices_active());
        let stored = game.stored_levels();
        game.abandon(|_| None);
        assert!(game.choices.is_empty());
        assert!(!game.cache_choices_active());
        assert_eq!(game.stored_levels(), stored);
        assert_eq!(game.pending_cache_choices(), 2);
    }

    #[test]
    fn terminal_taken_damage_uses_mitigation_absorb_and_lethal_overkill() {
        let mut game = class_run("priest", 0);
        game.effect_state.base.armor_fraction = 0.25;
        game.refresh_effects();
        game.execution.vitals.absorb = 20.0;
        let player = game.zone.center.into();
        game.damage_player(20.0, true, 0, player, 0.0, &mut TerrainFixture);
        assert_eq!(game.health(), 100.0);
        assert_eq!(game.taken_total(), 0.0);
        game.damage_player(40.0, false, 0, player, 0.0, &mut TerrainFixture);
        assert_eq!(game.health(), 75.0);
        assert_eq!(game.taken_total(), 25.0);
        game.damage_player(200.0, false, 0, player, 0.0, &mut TerrainFixture);
        assert!(game.dead);
        assert_eq!(game.health(), 0.0);
        assert_eq!(
            game.taken_total(),
            175.0,
            "lethal damage keeps its full applied amount"
        );
        game.mark_run_result_saved();
        game.damage_player(20.0, true, 0, player, 0.0, &mut TerrainFixture);
        assert_eq!(game.taken_total(), 175.0);
    }

    #[test]
    fn terminal_result_survives_account_delivery_without_a_second_account_result() {
        let mut game = class_run("priest", 0);
        assert_eq!(game.terminal_result(), None);
        game.clock = 61.5;
        game.kills = 12;
        game.gold_earned = 9;
        game.abandon(|_| None);
        let result = game.terminal_result().unwrap();
        assert_eq!(game.run_result(), Some(result.clone()));
        game.mark_run_result_saved();
        assert_eq!(game.run_result(), None);
        assert_eq!(game.terminal_result(), Some(result));
    }

    #[test]
    fn explicit_summary_leaves_live_equipment_seen_and_feats_for_the_tick() {
        let mut game = class_run("warrior", 0);
        game.configure_effects(&[], &[]);
        game.clock = 480.;
        game.kills = 2500;
        game.boss_state.equipment.queue(101000);
        let mut menu = crate::menu_state::MenuState::from_save_path(None);
        crate::gameplay::persist_run_at(
            &mut game,
            &mut menu,
            Some(42),
            [0; 19],
            false,
            true,
            1700000000,
            true,
        );
        assert_eq!(game.queued_equipment(), vec![101000]);
        assert!(menu.backend_save.seen().is_empty());
        assert!(crate::armory::GearSave::read(&menu.backend_save).owned.is_empty());
        assert!(menu.backend_save.earned_achievements().is_empty());
        assert_eq!(menu.backend_save.statistics()["runs"], 1);
        crate::gameplay::persist_run_at(
            &mut game,
            &mut menu,
            Some(42),
            [0; 19],
            false,
            true,
            1700000001,
            false,
        );
        assert!(game.queued_equipment().is_empty());
        assert!(!menu.backend_save.seen().is_empty());
        assert!(
            crate::armory::GearSave::read(&menu.backend_save)
                .owned
                .contains(&101000)
        );
        assert!(!menu.backend_save.earned_achievements().is_empty());
    }

    #[test]
    fn run_loot_survives_delivery_and_keeps_later_repeated_drops() {
        let mut game = class_run("priest", 0);
        for id in [100, 200, 100] {
            game.boss_state.equipment.queue(id);
        }
        assert_eq!(game.queued_equipment(), vec![100, 200, 100]);
        assert_eq!(game.run_equipment(), &[100, 200, 100]);
        assert_eq!(game.drain_equipment(), vec![100, 200, 100]);
        assert!(game.queued_equipment().is_empty());
        assert!(game.drain_equipment().is_empty());
        game.boss_state.equipment.queue(200);
        assert_eq!(game.queued_equipment(), vec![200]);
        assert_eq!(game.run_equipment(), &[100, 200, 100, 200]);
        assert_eq!(game.drain_equipment(), vec![200]);
        assert_eq!(game.run_equipment(), &[100, 200, 100, 200]);
        assert!(class_run("priest", 0).run_equipment().is_empty());
    }
}
