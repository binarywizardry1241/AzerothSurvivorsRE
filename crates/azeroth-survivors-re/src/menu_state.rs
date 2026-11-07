//! Menu selection with individually version-bound save/input recovery.
use crate::{
    catalog::MenuCatalog,
    save::{self, Hero, Pick, RunMods, Save, CLASS_IDS},
};
use bevy::prelude::*;
use std::path::PathBuf;

mod backend;

/// Finish custom account requests before the local server consumes their payloads.
#[derive(SystemSet, Debug, Clone, Copy, Hash, PartialEq, Eq)]
pub(crate) struct AccountInput;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Page {
    Picker,
    Character,
    Collection,
    DropTables,
    Codex,
    Talents,
    Achievements,
    Rewards,
}

impl Page {
    pub const TABS: [(Self, &'static str); 7] = [
        (Self::Character, "Character"),
        (Self::Collection, "Collection"),
        (Self::DropTables, "Drop Tables"),
        (Self::Codex, "Codex"),
        (Self::Talents, "Talents"),
        (Self::Achievements, "Achievements"),
        (Self::Rewards, "Rewards"),
    ];
}

#[derive(Clone, Debug)]
pub enum Dialog {
    Coop,
    /// The native Difficulty resource is open over a retained co-op window.
    CoopDifficulty,
    CoopInspect(u64),
    Menu,
    RunOptions,
    Language,
    RewardsChanges(Page),
    Notice(String, String),
}

#[derive(Resource)]
pub struct MenuState {
    pub class: usize,
    pub race: u8,
    pub sex: u8,
    pub features: [u8; 5],
    pub name: String,
    pub name_focused: bool,
    /// Explicit native roster identity; independent of the editable Pick.
    selected_character_guid: Option<u64>,
    /// Native startup's optional row precedes saved rows and never enters Save.
    startup_character: Option<save::Character>,
    /// 0.97.2 resource949eb6.. tag1 controls picker.entering and content invalidation.
    pub entering: bool,
    /// A live reconstructed run owns input and presentation while this is set.
    pub in_run: bool,
    /// Native tag1 timestamp at +4; the unconnected launch path times out after 30s.
    enter_started_at: Option<f32>,
    pub zone: usize,
    pub heroic_rank: u8,
    /// Native Play captures the week once into the retained run configuration.
    pub(crate) heroic_week: u32,
    /// Again reuses the admitted rank, even if the completed run opened a level.
    pub(crate) heroic_restart_rank: Option<u8>,
    pub run_mods: RunMods,
    pub page: Page,
    pub dialog: Option<Dialog>,
    pub dirty: bool,
    /// Ordered server write snapshots; frontend requests have their own typed queue.
    pending_saves: Vec<Save>,
    /// Frontend requests preserve their payload and order until the server driver drains them.
    pending_commands: Vec<backend::Command>,
    /// Server account ownership is independent of the frontend's imported Save resource.
    pub(crate) backend_save: Save,
    backend_pick: Pick,
    pub save: Save,
    /// Source equivalent of the native Save resource's change tick.
    pub save_revision: u64,
    pub save_path: Option<PathBuf>,
    pub error: Option<String>,
    pub random_state: u64,
}

impl Default for MenuState {
    fn default() -> Self {
        Self::from_save_path(save::native_path())
    }
}

impl MenuState {
    pub(crate) fn close_dialog(&mut self) {
        self.dialog = if matches!(self.dialog, Some(Dialog::CoopDifficulty | Dialog::CoopInspect(_))) {
            Some(Dialog::Coop)
        } else {
            None
        };
        self.dirty = true;
    }

    pub(crate) fn from_save_path(save_path: Option<PathBuf>) -> Self {
        let save = save_path
            .as_deref()
            .map(Save::load)
            .and_then(Result::ok)
            .unwrap_or_default();
        let mut state = Self {
            class: 0,
            race: 1,
            sex: 0,
            features: [0; 5],
            name: "Hero".into(),
            name_focused: false,
            selected_character_guid: None,
            startup_character: None,
            entering: false,
            in_run: false,
            enter_started_at: None,
            zone: 0,
            heroic_rank: 0,
            heroic_week: 0,
            heroic_restart_rank: None,
            run_mods: RunMods::default(),
            page: Page::Picker,
            dialog: None,
            dirty: true,
            pending_saves: Vec::new(),
            pending_commands: Vec::new(),
            backend_pick: save.pick().unwrap_or_else(default_pick),
            backend_save: save.clone(),
            save,
            save_revision: 0,
            save_path,
            error: None,
            random_state: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .map(|d| d.as_nanos() as u64)
                .unwrap_or(0x9e3779b97f4a7c15),
        };
        state.restore_pick(&MenuCatalog::embedded());
        if !crate::progression::grant_account(&mut state.save, None).is_empty() {
            state.backend_save = state.save.clone();
            state.commit_account();
        }
        state
    }
}

impl MenuState {
    /// Current Options inserts the decoded frontend resource and queues Reload16.
    /// Its picker restore independently reads the active file after the best-effort write.
    pub fn import_save(&mut self, imported: Save, catalog: &MenuCatalog) {
        self.pending_commands.push(backend::Command::Reload);
        let active = self.load_active_save();
        self.save = active;
        self.restore_pick(catalog);
        self.save = imported;
        self.save_revision = self.save_revision.wrapping_add(1);
        self.error = None;
        self.dirty = true;
    }

    /// Current1400851d0 restores and account-clamps the64-byte Pick. Page, focus, run/entry
    /// state and explicit roster identity have independent native owners.
    fn restore_pick(&mut self, catalog: &MenuCatalog) {
        let mut pick = self.save.pick().unwrap_or_else(default_pick);
        pick.hero = self.save.clamp_hero(pick.hero);
        self.class = CLASS_IDS.iter().position(|id| *id == pick.hero.class).unwrap_or(0);
        self.race = pick.hero.race;
        self.sex = pick.hero.sex;
        self.features = pick.hero.features;
        self.name = pick.name;
        self.zone = catalog.zones.iter().position(|zone| zone.key == pick.zone).unwrap_or(0);
        self.heroic_rank = pick.heroic_rank;
        self.run_mods = pick.mods;
        self.clamp_zone();
        if self.name == "Hero" {
            self.name = crate::hero_name::random();
        }
    }
    pub fn class_id(&self) -> u8 {
        CLASS_IDS[self.class]
    }
    /// Current packet0x3d at145b1396e selects an explicitly addressed roster row,
    /// copies its identity/appearance, and assigns row+18 to Server+17c8.
    /// This seam does not infer a roster selection from the Pick's name or class.
    pub fn select_roster_character(&mut self, guid: u64) -> bool {
        let Some(character) = self
            .startup_character.iter().cloned().chain(self.backend_save.characters())
            .find(|row| row.guid == guid)
        else {
            return false;
        };
        let Some(class) = CLASS_IDS.iter().position(|id| *id == character.class) else {
            return false;
        };
        if !(1..=8).contains(&character.race) {
            return false;
        }
        self.selected_character_guid = Some(guid);
        self.class = class;
        self.race = character.race;
        self.sex = character.sex;
        self.features = character.features;
        self.name = character.name;
        self.clamp_zone();
        self.mark_dirty();
        true
    }

    /// Validate an earlier explicit selection after menu edits or save replacement.
    /// Comparing its row prevents a stale GUID from receiving another hero's result.
    pub fn selected_roster_guid(&self) -> Option<u64> {
        let guid = self.selected_character_guid?;
        let character = self
            .startup_character.iter().cloned().chain(self.backend_save.characters())
            .find(|row| row.guid == guid)?;
        (character.class == self.class_id()
            && character.race == self.race
            && character.sex == self.sex
            && character.features == self.features
            && character.name == self.name)
            .then_some(guid)
    }

    pub(crate) fn set_startup_character(&mut self, character: Option<save::Character>) {
        self.startup_character = character;
    }

    pub(crate) fn startup_character(&self) -> Option<&save::Character> {
        self.startup_character.as_ref()
    }

    /// Current1458b96cf searches permanent rows before the optional process row.
    /// Its optional-row fallback updates level only, even for the Tester sentinel.
    pub(crate) fn record_character_bests(&mut self, guid: u64, level: u32, seconds: u32) {
        if self.backend_save.record_character_bests(guid, level, seconds) {
            return;
        }
        if let Some(row) = self
            .startup_character
            .as_mut()
            .filter(|row| row.guid == guid)
        {
            row.best_level = row.best_level.max(level);
        }
    }

    /// Ordinary stock login addresses a saved row and does not issue custom
    /// command11 or overwrite the independently stored Pick.
    pub fn begin_roster_enter(&mut self, guid: u64, zone: usize, elapsed: f32) -> bool {
        if self.entering || self.in_run || !self.select_roster_character(guid) { return false; }
        self.zone = zone;
        self.heroic_week = crate::heroic::current_week();
        self.heroic_restart_rank = None;
        self.entering = true;
        self.enter_started_at = Some(elapsed);
        self.mark_dirty();
        true
    }

    pub fn hero(&self) -> Hero {
        Hero {
            class: self.class_id(),
            race: self.race,
            sex: self.sex,
            features: self.features,
        }
    }
    pub fn open_zones(&self) -> usize {
        self.save
            .unlock_value(self.class_id())
            .unwrap_or(1)
            .clamp(1, azeroth_survivors_re::zones::COUNT as u64) as usize
    }
    pub fn max_heroic_rank(&self) -> u8 {
        let zone = &azeroth_survivors_re::guardians::catalog::ZONES[self.zone];
        self.save.max_heroic_rank(self.class_id(), zone.key)
    }
    fn clamp_zone(&mut self) {
        self.zone = self.zone.min(self.open_zones() - 1);
    }
    pub fn choose_class(&mut self, index: usize, catalog: &MenuCatalog) {
        if index >= CLASS_IDS.len() {
            return;
        }
        let current = self.hero();
        let _ = self.save.set_hero(&current);
        // Native picker action emits command11 both before and after changing class.
        self.commit_pick(catalog);
        let hero = self
            .save
            .select_class_hero(&current, CLASS_IDS[index])
            .expect("picker class IDs have native race eligibility");
        self.class = index;
        self.race = hero.race;
        self.sex = hero.sex;
        self.features = hero.features;
        self.clamp_zone();
        self.commit_pick(catalog);
    }
    pub fn choose_race(&mut self, race: u8, catalog: &MenuCatalog) {
        if self.save.allowed_races(self.class_id()).contains(&race) {
            self.race = race;
            // Current armory140257809 preserves features, then clamps against the new race.
            self.commit_pick(catalog);
        }
    }
    pub fn choose_sex(&mut self, sex: u8, catalog: &MenuCatalog) {
        // Current armory1402578b1 also commits when the selected sex is pressed again.
        self.sex = u8::from(sex != 0);
        self.commit_pick(catalog);
    }
    pub fn cycle_feature(&mut self, index: usize, delta: i8, catalog: &MenuCatalog) {
        self.features =
            save::appearance::cycle_features(self.race, self.sex, self.features, index, delta);
        self.commit_pick(catalog);
    }
    pub fn randomize_features(&mut self, catalog: &MenuCatalog) {
        self.features = save::appearance::random_features(self.race, self.sex);
        self.commit_pick(catalog);
    }
    pub fn mark_dirty(&mut self) {
        self.dirty = true;
    }
    /// Account commands persist their own mutation without replacing Pick with live UI edits.
    pub fn commit_account(&mut self) {
        self.mark_dirty();
        self.save_revision = self.save_revision.wrapping_add(1);
        self.pending_saves.push(self.backend_save.clone());
    }
    #[cfg(test)]
    pub(crate) fn account_snapshots(&self) -> &[Save] {
        &self.pending_saves
    }

    /// Native command11 commits the complete current Pick, including earlier local edits.
    pub fn commit_pick(&mut self, catalog: &MenuCatalog) {
        self.mark_dirty();
        // Current145427b30 applies the optional asset cache before a full-Pick commit.
        self.features = save::appearance::normalize_features(self.race, self.sex, self.features);
        let pick = Pick {
            hero: self.hero(),
            name: self.name.clone(),
            zone: catalog.zones[self.zone].key.clone(),
            heroic_rank: self.heroic_rank,
            mods: self.run_mods,
        };
        match self
            .save
            .set_hero(&pick.hero)
            .and_then(|()| self.save.set_pick(&pick))
        {
            Ok(()) => {
                self.save_revision = self.save_revision.wrapping_add(1);
                self.pending_commands.push(backend::Command::Pick(pick));
            }
            Err(error) => self.error = Some(error.to_string()),
        }
    }
    /// Current Enter replaces an invalid live name before its full-Pick command11.
    pub fn commit_enter(&mut self, catalog: &MenuCatalog) {
        if crate::hero_name::normalize(&self.name).is_none() {
            self.name = crate::hero_name::random();
        }
        self.commit_pick(catalog);
    }
    /// Current1400c44f0 action3 and pending keyboard Enter converge at1400c54a5.
    /// The live session consumes this request after the full Pick is committed.
    pub fn begin_enter(&mut self, catalog: &MenuCatalog, elapsed: f32) {
        if self.entering {
            return;
        }
        self.commit_enter(catalog);
        self.admit_enter(elapsed);
    }
    /// The host already committed the selected Pick when requesting a Ready Check.
    pub(crate) fn admit_enter(&mut self, elapsed: f32) {
        self.heroic_week = crate::heroic::current_week();
        self.heroic_restart_rank = None;
        self.entering = true;
        self.enter_started_at = Some(elapsed);
        self.mark_dirty();
    }
    /// Native command6 rebuilds the retained run; it does not issue the picker's
    /// command11, normalize its name again or save another Pick.
    pub(crate) fn begin_restart(&mut self, elapsed: f32, heroic_rank: Option<u8>) {
        if self.entering || self.in_run {
            return;
        }
        self.heroic_restart_rank = heroic_rank;
        self.entering = true;
        self.enter_started_at = Some(elapsed);
        self.mark_dirty();
    }
    /// 140067ee0 clears tag1 strictly after 30 seconds when completion is absent.
    pub fn advance_enter(&mut self, elapsed: f32) {
        if self.entering
            && self
                .enter_started_at
                .is_some_and(|started| elapsed - started > 30.)
        {
            self.entering = false;
            self.enter_started_at = None;
            self.mark_dirty();
        }
    }
    pub(crate) fn reject_coop_entry(&mut self) {
        self.entering = false;
        self.enter_started_at = None;
        if !self.in_run {
            self.name_focused = false;
            self.dialog = Some(Dialog::Coop);
        }
        self.mark_dirty();
    }

    pub fn complete_enter(&mut self) {
        self.entering = false;
        self.enter_started_at = None;
        self.in_run = true;
        self.name_focused = false;
        self.dialog = None;
        self.mark_dirty();
    }
    pub fn return_from_run(&mut self) {
        self.in_run = false;
        self.entering = false;
        self.enter_started_at = None;
        self.dialog = None;
        self.page = Page::Picker;
        self.mark_dirty();
    }
    pub fn random_index(&mut self, count: usize) -> usize {
        let mut value = self.random_state;
        value ^= value << 13;
        value ^= value >> 7;
        value ^= value << 17;
        self.random_state = value;
        (value as usize) % count.max(1)
    }
    /// Flush queued native commands in order. Options also calls this before Export.
    pub fn persist_selection(&mut self, _catalog: &MenuCatalog) {
        for snapshot in self.pending_saves.drain(..) {
            if let Some(path) = self.save_path.as_deref() {
                if let Err(error) = snapshot.write(path) {
                    // Native core keeps its state and continues to subsequent commands.
                    eprintln!(
                        "rogue: cannot save characters to {}: {error}",
                        path.display()
                    );
                }
            }
        }
        self.drain_backend_commands(_catalog);
    }
}

fn default_pick() -> Pick {
    Pick { hero: Hero { class: 1, race: 1, sex: 0, features: [0; 5] },
        name: "Hero".into(), zone: "elwynn".into(), heroic_rank: 0, mods: RunMods::default() }
}

#[cfg(test)]
mod class_selection_tests {
    use super::*;
    use serde_json::Value;

    #[test]
    fn every_purchased_race_survives_all_class_picker_and_backend_commands() {
        let catalog = MenuCatalog::embedded();
        let save = Save::parse("races|1,2,3,4,5,6,7,8\n").unwrap();
        let mut state = state_for(Hero { class: 1, race: 1, ..Default::default() }, save);
        for (index, class) in CLASS_IDS.into_iter().enumerate() {
            state.choose_class(index, &catalog);
            for race in 1..=8 {
                state.choose_race(race, &catalog);
                state.persist_selection(&catalog);
                assert_eq!((state.class_id(), state.race), (class, race));
                assert_eq!((state.backend_pick.hero.class, state.backend_pick.hero.race), (class, race));
                assert_eq!(state.backend_save.pick().unwrap().hero.race, race);
                assert_eq!(state.backend_save.purchased_races(), [1, 2, 3, 4, 5, 6, 7, 8]);
            }
        }
    }

    #[test]
    fn class_restore_and_account_clamp_use_purchases_after_typed_loading() {
        let catalog = MenuCatalog::embedded();
        let row = "hero|11|2|1|0,0,0,0,0\npick|11|2|1|elwynn|Fixture\n";
        for (ownership, expected) in [("races|2\n", 2), ("", 6)] {
            let save = Save::parse(&format!("{ownership}{row}")).unwrap();
            // Typed records retain the race; the account/menu clamp decides access.
            assert_eq!(save.pick().unwrap().hero.race, 2);
            assert_eq!(save.heroes()[0].race, 2);
            let current = Hero { class: 1, race: 2, sex: 1, features: [0; 5] };
            assert_eq!(save.select_class_hero(&current, 11).unwrap().race, expected);
            let mut state = state_for(current, save);
            state.restore_pick(&catalog);
            assert_eq!(state.race, expected);
        }
    }

    #[test]
    fn pick_command_uses_backend_ownership_without_borrowing_frontend_purchases() {
        let catalog = MenuCatalog::embedded();
        let save = Save::parse("races|2\n").unwrap();
        let mut state = state_for(Hero { class: 11, race: 6, ..Default::default() }, save);
        state.backend_save = Save::default();
        state.choose_race(2, &catalog);
        assert_eq!(state.race, 2);
        state.persist_selection(&catalog);
        assert_eq!(state.backend_pick.hero.race, 6);
        assert!(state.backend_save.purchased_races().is_empty());
        assert_eq!(state.save.purchased_races(), [2]);
    }

    fn state_for(hero: Hero, save: Save) -> MenuState {
        // Default resolves the real active path; these tests use explicit in-memory state.
        MenuState {
            class: CLASS_IDS.iter().position(|id| *id == hero.class).unwrap(),
            race: hero.race,
            sex: hero.sex,
            features: hero.features,
            name: "Fixture".into(),
            name_focused: false,
            selected_character_guid: None,
            startup_character: None,
            entering: false,
            in_run: false,
            enter_started_at: None,
            zone: 0,
            heroic_rank: 0,
            heroic_week: 0,
            heroic_restart_rank: None,
            run_mods: RunMods::default(),
            page: Page::Picker,
            dialog: None,
            dirty: false,
            pending_saves: Vec::new(),
            pending_commands: Vec::new(),
            backend_pick: save.pick().unwrap_or_else(default_pick),
            backend_save: save.clone(),
            save,
            save_revision: 0,
            save_path: None,
            error: None,
            random_state: 0,
        }
    }

    #[test]
    fn restored_pick_matches_current_native_paths_and_keeps_other_state() {
        let vectors: Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/import-restore/native-vectors.json"
        )).unwrap();
        let catalog = MenuCatalog::embedded();
        for row in vectors["restore"].as_array().unwrap() {
            let input = &row["pick"];
            let mut plain = String::from("hero|1|2|1|0,0,0,0,0\n");
            if !input.is_null() {
                let hero = &input[3];
                let mods = input[2].as_array().unwrap().iter()
                    .map(|value| value.as_u64().unwrap().to_string()).collect::<Vec<_>>().join(",");
                plain.push_str(&format!("pick|{}|{}|{}|{}|{}|0,0,0,0,0|{}\n",
                    hero[0],hero[1],hero[2],input[1].as_str().unwrap(),input[0].as_str().unwrap(),mods));
                if let Some(count) = row["opened"].as_u64() {
                    let zone = &catalog.zones[count.clamp(1,12) as usize-1].key;
                    plain.push_str(&format!("open|{}|{}\n",hero[0],zone));
                }
            }
            let mut state = state_for(Hero {class:1,race:1,sex:0,features:[0;5]},Save::parse(&plain).unwrap());
            state.selected_character_guid = Some(99);
            state.page = Page::Codex;
            state.name_focused = true;
            state.in_run = true;
            state.entering = true;
            state.restore_pick(&catalog);
            let expected = &row["result"];
            assert_eq!(state.class_id(),expected["hero"][0].as_u64().unwrap() as u8);
            assert_eq!(state.race,expected["hero"][1].as_u64().unwrap() as u8);
            assert_eq!(state.sex,expected["hero"][2].as_u64().unwrap() as u8);
            assert_eq!(state.features,[0;5]);
            assert_eq!(catalog.zones[state.zone].key,expected["zone"].as_str().unwrap());
            // Retain the identity/other-state vectors; current rank parsing
            // rejects their historical percentage tuple and selects Normal.
            assert_eq!(state.run_mods, RunMods::default());
            assert_eq!(state.heroic_rank, 0);
            if expected["random"].as_u64() == Some(1) {
                assert!(!state.name.is_empty() && state.name != "Hero");
            } else { assert_eq!(state.name,expected["name"].as_str().unwrap()); }
            assert_eq!(state.selected_character_guid,Some(99));
            assert_eq!(state.page,Page::Codex);
            assert!(state.name_focused && state.in_run && state.entering);
        }
    }

    #[test]
    fn terminal_bests_prefer_saved_rows_then_update_only_transient_level() {
        let mut state = state_for(
            Hero {
                class: 1,
                race: 1,
                sex: 0,
                features: [0; 5],
            },
            Save::parse("").unwrap(),
        );
        state.set_startup_character(Some(save::Character {
            guid: 0x00ff_ffff,
            name: "Tester".into(),
            race: 1,
            class: 1,
            sex: 0,
            features: [0; 5],
            best_level: 1,
            best_seconds: 2,
            runs: 3,
            wins: 4,
        }));
        state.record_character_bests(0x00ff_fffe, 50, 1000);
        assert_eq!(state.startup_character().unwrap().best_level, 1);
        state.record_character_bests(0x00ff_ffff, 50, 1000);
        let row = state.startup_character().unwrap();
        assert_eq!(
            (row.best_level, row.best_seconds, row.runs, row.wins),
            (50, 2, 3, 4)
        );
        state.record_character_bests(0x00ff_ffff, 40, 2000);
        assert_eq!(state.startup_character().unwrap().best_level, 50);
        state.backend_save = Save::parse("16777215|Saved|1|1|0|0,0,0,0,0|1|2|3|4\n").unwrap();
        state.record_character_bests(0x00ff_ffff, 60, 3000);
        let row = &state.backend_save.characters()[0];
        assert_eq!(
            (row.best_level, row.best_seconds, row.runs, row.wins),
            (60, 3000, 3, 4)
        );
        assert_eq!(state.startup_character().unwrap().best_level, 50);
    }

    #[test]
    fn login_prefers_optional_duplicate_but_summary_bests_prefer_saved_row() {
        let save = Save::parse("16777215|Saved|1|1|0|0,0,0,0,0|1|2|3|4\n").unwrap();
        let mut state = state_for(Hero { class: 1, race: 1, sex: 0, features: [0; 5] }, save);
        let mut optional = state.backend_save.characters()[0].clone();
        optional.name = "Transient".into();
        state.set_startup_character(Some(optional));
        assert!(state.select_roster_character(0x00ff_ffff));
        assert_eq!(state.name, "Transient");
        assert_eq!(state.selected_roster_guid(), Some(0x00ff_ffff));
        state.record_character_bests(0x00ff_ffff, 50, 1000);
        assert_eq!(state.backend_save.characters()[0].best_level, 50);
        assert_eq!(state.startup_character().unwrap().best_level, 1);
    }

    #[test]
    fn roster_identity_requires_explicit_valid_guid_and_invalidates_after_edits() {
        let save =
            Save::parse("42|Hero|1|1|0|0,0,0,0,0|50|1200|2|1\n43|Other|1|8|0|0,0,0,0,0|1|0|0|0\n")
                .unwrap();
        let mut state = state_for(
            Hero {
                class: 1,
                race: 1,
                sex: 0,
                features: [0; 5],
            },
            save,
        );
        // Matching editable fields alone never selects a saved roster GUID.
        state.name = "Hero".into();
        assert_eq!(state.selected_roster_guid(), None);
        assert!(!state.select_roster_character(99));
        assert!(!state.select_roster_character(0x00ff_ffff));
        assert!(state.select_roster_character(43));
        assert_eq!(state.selected_roster_guid(), Some(43));
        assert_eq!((state.class_id(), state.name.as_str()), (8, "Other"));
        state.name = "Changed".into();
        assert_eq!(state.selected_roster_guid(), None);
        assert!(state.select_roster_character(42));
        state.backend_save.remove_character(42);
        assert_eq!(state.selected_roster_guid(), None);
    }

    #[test]
    fn stock_entry_keeps_custom_pick_separate_and_retains_shared_run_modifiers() {
        let save = Save::parse("42|Stock|1|1|0|0,0,0,0,0|1|0|0|0\npick|8|7|0|wsg|Custom|0,0,0,0,0|200,200,200,200\n").unwrap();
        let mut state = state_for(Hero { class: 1, race: 1, sex: 0, features: [0; 5] }, save);
        state.run_mods.0[0] = 200;
        let before = state.save.plaintext();
        assert!(state.begin_roster_enter(42, 0, 4.0));
        assert_eq!(state.selected_roster_guid(), Some(42));
        assert_eq!(state.run_mods.0[0], 200);
        assert!(state.entering);
        assert_eq!(state.save.plaintext(), before);
        assert!(state.pending_saves.is_empty());
    }

    #[test]
    fn transient_startup_identity_survives_again_without_entering_the_save() {
        let catalog = MenuCatalog::embedded();
        let args = ["naxx", "druid", "tauren", "Changed", "female"].map(String::from);
        let startup = crate::startup::NativeStartup::positional(&args, &catalog);
        let save = Save::parse("42|Saved|1|1|0|0,0,0,0,0|1|0|0|0\n").unwrap();
        let mut state = state_for(Hero { class: 1, race: 1, sex: 0, features: [0; 5] }, save);
        let before = state.save.plaintext();
        state.set_startup_character(startup.character);
        let guid = crate::startup::TESTER_GUID;
        assert!(state.begin_roster_enter(guid, 11, 1.0));
        assert_eq!(state.selected_roster_guid(), Some(guid));
        assert_eq!((state.zone, state.class_id(), state.race, state.sex), (11, 11, 6, 1));
        state.complete_enter();
        state.return_from_run();
        assert!(state.begin_roster_enter(guid, 11, 4.0));
        assert_eq!(state.zone, 11);
        assert_eq!(state.save.plaintext(), before);
        assert!(state.pending_saves.is_empty());
        assert_eq!(state.save.characters().len(), 1);
    }

    fn saved_state() -> MenuState {
        let save = Save::parse(
            "unlock|1|3\nhero|1|1|0|0,0,0,0,0\npick|1|1|0|elwynn|Before|0,0,0,0,0|100,100,100,100\n",
        )
        .unwrap();
        let mut state = state_for(save.pick().unwrap().hero, save);
        state.name = "Before".into();
        state
    }

    fn fixture_path(label: &str) -> PathBuf {
        let unique = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_nanos();
        PathBuf::from(env!("CARGO_MANIFEST_DIR")).join(format!(
            "../../runtime/menu-persistence-tests/{label}-{unique}/characters.txt"
        ))
    }

    #[test]
    fn picker_class_switches_match_native_fixture_without_accessing_player_files() {
        let fixtures: Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/save/class-selection-fixtures.json"
        ))
        .unwrap();
        let hero = |value: &Value| Hero {
            class: value[0].as_u64().unwrap() as u8,
            race: value[1].as_u64().unwrap() as u8,
            sex: value[2].as_u64().unwrap() as u8,
            features: std::array::from_fn(|i| value[i + 3].as_u64().unwrap() as u8),
        };
        for case in fixtures["cases"].as_array().unwrap() {
            let current = hero(&case["input"]);
            let mut save = Save::default();
            if !case["saved_hero"].is_null() {
                save.set_hero(&hero(&case["saved_hero"])).unwrap();
            }
            let mut state = state_for(current.clone(), save);
            let destination = case["destination_class"].as_u64().unwrap() as u8;
            let index = CLASS_IDS.iter().position(|id| *id == destination).unwrap();
            assert_ne!(index, state.class);
            state.choose_class(index, &MenuCatalog::embedded());
            assert_eq!(state.hero(), hero(&case["native_output"]), "{case}");
            assert!(state.save.heroes().contains(&current));
        }
    }

    #[test]
    fn restart_preserves_pick_and_does_not_repeat_enter_normalization() {
        let mut state = saved_state();
        let before = state.save.plaintext();
        // Enter would replace this invalid editable name and save a new Pick.
        state.name = "1".into();
        state.heroic_week = 1234;
        state.heroic_rank = 5;
        state.begin_restart(4.0, Some(1));
        assert!(state.entering);
        assert_eq!(state.enter_started_at, Some(4.0));
        assert_eq!(state.heroic_restart_rank, Some(1));
        assert_eq!(state.heroic_week, 1234);
        assert_eq!(state.heroic_rank, 5);
        assert_eq!(state.name, "1");
        assert_eq!(state.save.plaintext(), before);
        assert!(state.pending_saves.is_empty());
        assert_eq!(state.save_revision, 0);
        state.begin_restart(9.0, Some(2));
        assert_eq!(state.enter_started_at, Some(4.0));
        assert_eq!(state.heroic_restart_rank, Some(1));
    }

    #[test]
    fn local_edits_do_not_write_until_a_full_pick_event() {
        let catalog = MenuCatalog::embedded();
        let mut state = saved_state();
        let path = fixture_path("local-edits");
        state.save.write(&path).unwrap();
        let before = std::fs::read(&path).unwrap();
        state.save_path = Some(path.clone());

        state.name = "Typedname".into();
        state.mark_dirty();
        state.persist_selection(&catalog);
        assert_eq!(std::fs::read(&path).unwrap(), before);
        state.name = crate::hero_name::random();
        state.zone = 1;
        state.mark_dirty();
        state.persist_selection(&catalog);
        assert_eq!(std::fs::read(&path).unwrap(), before);
        assert_eq!(state.save.pick().unwrap().name, "Before");

        state.run_mods.0[0] = 125;
        state.commit_pick(&catalog);
        assert_eq!(state.pending_commands.len(), 1);
        state.persist_selection(&catalog);
        let written = Save::load(&path).unwrap().pick().unwrap();
        assert_eq!(written.name, state.name);
        assert_eq!(written.zone, catalog.zones[1].key);
        // The retained historical modifier field is not the current rank wire.
        assert_eq!(written.mods, RunMods::default());
        assert_eq!(written.heroic_rank, state.heroic_rank);
        std::fs::remove_dir_all(path.parent().unwrap()).unwrap();
    }

    #[test]
    fn account_events_preserve_the_previously_committed_pick() {
        let catalog = MenuCatalog::embedded();
        let mut state = saved_state();
        let path = fixture_path("account-event");
        state.save.write(&path).unwrap();
        state.save_path = Some(path.clone());
        let committed_pick = state.save.pick();
        state.name = "Localedit".into();
        state.zone = 1;
        state.mark_dirty();
        state
            .backend_save
            .set_talent_allocation(1, 80, &[("imp_heroic".into(), 1)])
            .unwrap();
        state.commit_account();
        state.persist_selection(&catalog);
        let written = Save::load(&path).unwrap();
        assert_eq!(written.pick(), committed_pick);
        assert_eq!(written.talent_xp(1), 80);
        assert_eq!(state.name, "Localedit");
        assert_eq!(state.zone, 1);
        std::fs::remove_dir_all(path.parent().unwrap()).unwrap();
    }

    #[test]
    fn class_switch_keeps_both_native_command_snapshots() {
        let catalog = MenuCatalog::embedded();
        let mut state = saved_state();
        state.name = "Localedit".into();
        state.zone = 1;
        state.choose_class(CLASS_IDS.iter().position(|id| *id == 8).unwrap(), &catalog);
        assert_eq!(state.pending_commands.len(), 2);
        let backend::Command::Pick(old) = &state.pending_commands[0] else { panic!("Pick11") };
        let backend::Command::Pick(new) = &state.pending_commands[1] else { panic!("Pick11") };
        assert_eq!(old.hero.class, 1);
        assert_eq!(old.zone, catalog.zones[1].key);
        assert_eq!(new.hero.class, 8);
        assert_eq!(new.zone, "elwynn");
        assert_eq!(old.name, "Localedit");
        assert_eq!(new.name, "Localedit");
        state.persist_selection(&catalog);
        assert_eq!(state.backend_save.heroes().len(), 2);
    }

    #[test]
    fn selecting_the_current_class_still_commits_both_native_commands() {
        let catalog = MenuCatalog::embedded();
        let mut state = saved_state();
        let path = fixture_path("same-class");
        state.save.write(&path).unwrap();
        state.save_path = Some(path.clone());
        state.name = "Localedit".into();
        state.zone = 1;
        state.features = [1, 2, 3, 4, 5];
        let current = state.hero();

        state.choose_class(state.class, &catalog);
        assert_eq!(state.pending_commands.len(), 2);
        for command in &state.pending_commands {
            let backend::Command::Pick(pick) = command else { panic!("Pick11") };
            assert_eq!(pick.name, "Localedit");
            assert_eq!(pick.zone, catalog.zones[1].key);
            assert_eq!(pick.hero, current);
        }
        state.persist_selection(&catalog);
        let written = Save::load(&path).unwrap().pick().unwrap();
        assert_eq!(written.name, "Localedit");
        assert_eq!(written.zone, catalog.zones[1].key);
        assert_eq!(written.hero, current);
        std::fs::remove_dir_all(path.parent().unwrap()).unwrap();
    }

    #[test]
    fn ordinary_write_failure_does_not_block_a_later_event() {
        let catalog = MenuCatalog::embedded();
        let mut state = saved_state();
        let path = fixture_path("write-retry");
        std::fs::create_dir_all(&path).unwrap();
        state.save_path = Some(path.clone());
        state.name = "Firstevent".into();
        state.commit_pick(&catalog);
        state.persist_selection(&catalog);
        assert!(state.error.is_none());
        assert!(state.pending_saves.is_empty());
        assert_eq!(state.save.pick().unwrap().name, "Firstevent");

        std::fs::remove_dir(&path).unwrap();
        state.name = "Nextname".into();
        state.commit_pick(&catalog);
        state.persist_selection(&catalog);
        assert_eq!(Save::load(&path).unwrap().pick().unwrap().name, "Nextname");
        assert!(state.error.is_none());
        std::fs::remove_dir_all(path.parent().unwrap()).unwrap();
    }

    #[test]
    fn a_previous_validation_message_does_not_hold_later_commands() {
        let catalog = MenuCatalog::embedded();
        let mut state = saved_state();
        state.error = Some("fixture validation failure".into());
        state.name = "Localedit".into();
        state.commit_pick(&catalog);
        state.commit_account();
        assert_eq!(state.pending_commands.len(), 1);
        assert_eq!(state.pending_saves.len(), 1);
        assert_eq!(state.save.pick().unwrap().name, "Localedit");
    }

    #[test]
    fn damaged_startup_has_no_write_hold_after_its_native_backup() {
        let catalog = MenuCatalog::embedded();
        let path = fixture_path("damaged-startup");
        std::fs::create_dir_all(path.parent().unwrap()).unwrap();
        std::fs::write(&path, "RSE1:broken").unwrap();
        let mut state = MenuState::from_save_path(Some(path.clone()));
        assert!(state.error.is_none());
        assert!(state.save.pick().is_none());
        assert_eq!(
            std::fs::read_to_string(path.parent().unwrap().join("characters.unreadable.1.txt"))
                .unwrap(),
            "RSE1:broken"
        );
        state.name = "Recovered".into();
        state.commit_pick(&catalog);
        state.persist_selection(&catalog);
        assert_eq!(Save::load(&path).unwrap().pick().unwrap().name, "Recovered");
        std::fs::remove_dir_all(path.parent().unwrap()).unwrap();
    }

    #[test]
    fn unreadable_startup_allows_a_later_write_without_a_backup() {
        let catalog = MenuCatalog::embedded();
        let path = fixture_path("unreadable-startup");
        std::fs::create_dir_all(&path).unwrap();
        let mut state = MenuState::from_save_path(Some(path.clone()));
        assert!(state.error.is_none());
        assert!(state.save.pick().is_none());
        assert_eq!(
            std::fs::read_dir(path.parent().unwrap()).unwrap().count(),
            1
        );
        std::fs::remove_dir(&path).unwrap();
        state.name = "Recovered".into();
        state.commit_pick(&catalog);
        state.persist_selection(&catalog);
        assert_eq!(Save::load(&path).unwrap().pick().unwrap().name, "Recovered");
        std::fs::remove_dir_all(path.parent().unwrap()).unwrap();
    }

    #[test]
    fn startup_zone_clamp_matches_recorded_native_outputs() {
        let catalog = MenuCatalog::embedded();
        let fixtures: Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/catalog-zone-policy-fixtures.json"
        ))
        .unwrap();
        let cases = fixtures["selection_cases"].as_array().unwrap();
        assert_eq!(cases.len(), 216);
        // Translate fixture indices and counts from the twelve-zone order.
        let index = |old: usize| old + usize::from(old >= azeroth_survivors_re::zones::scholomance::INDEX);
        for case in cases {
            let class = case["class_id"].as_u64().unwrap() as u8;
            let save = if let Some(unlocked) = case["stored_unlock"].as_u64() {
                // Fixture counts are typed native Save fields, not legacy text ordinals.
                let key = &catalog.zones[index((unlocked.clamp(1, 12) - 1) as usize)].key;
                Save::parse(&format!("open|{class}|{key}\n")).unwrap()
            } else {
                Save::default()
            };
            let mut state = state_for(
                Hero {
                    class,
                    race: 1,
                    sex: 0,
                    features: [0; 5],
                },
                save,
            );
            state.zone = index(case["input_zone_index"].as_u64().unwrap() as usize);
            state.clamp_zone();
            assert_eq!(
                catalog.zones[state.zone].key,
                case["native_zone_key"].as_str().unwrap(),
                "{case}"
            );
        }
        for case in fixtures["count_cases"].as_array().unwrap() {
            let class = case["class_id"].as_u64().unwrap() as u8;
            let save = case["stored_unlock"]
                .as_u64()
                .map_or_else(Save::default, |n| {
                    let key = &catalog.zones[index((n.clamp(1, 12) - 1) as usize)].key;
                    Save::parse(&format!("open|{class}|{key}\n")).unwrap()
                });
            let state = state_for(
                Hero {
                    class,
                    race: 1,
                    sex: 0,
                    features: [0; 5],
                },
                save,
            );
            assert_eq!(
                state.open_zones(),
                index(case["native_open_zones"].as_u64().unwrap() as usize - 1) + 1,
                "{case}"
            );
        }
    }

    #[test]
    fn beaten_zone_unlock_repair_reaches_picker_access_and_selection_clamp() {
        let mut state = state_for(
            Hero {
                class: 1,
                race: 1,
                sex: 0,
                features: [0; 5],
            },
            Save::parse("beat|1|aq\nbeat|8|wsg\n").unwrap(),
        );
        assert_eq!(state.open_zones(), 13);
        state.zone = 12;
        state.clamp_zone();
        assert_eq!(state.zone, 12);
        state.class = CLASS_IDS.iter().position(|id| *id == 8).unwrap();
        assert_eq!(state.open_zones(), 4);
        state.clamp_zone();
        assert_eq!(state.zone, 3);
    }

    #[test]
    fn startup_retroactive_grants_are_undated_and_queue_only_new_keys() {
        let path = fixture_path("retroactive-achievements");
        Save::parse("beat|1|elwynn\nunknown|keep\n")
            .unwrap()
            .write(&path)
            .unwrap();
        let mut state = MenuState::from_save_path(Some(path.clone()));
        assert!(!state.save.earned_achievements().is_empty());
        assert!(state.save.achievement_dates().is_empty());
        assert_eq!(state.pending_saves.len(), 1);
        state.persist_selection(&MenuCatalog::embedded());
        let once = Save::load(&path).unwrap().plaintext();
        assert!(once.contains("unknown|keep"));
        let state = MenuState::from_save_path(Some(path.clone()));
        assert!(state.pending_saves.is_empty());
        assert_eq!(Save::load(&path).unwrap().plaintext(), once);
        std::fs::remove_dir_all(path.parent().unwrap()).unwrap();
    }

    #[test]
    fn no_saved_pick_starts_with_the_native_default_hero() {
        let path = fixture_path("hero-without-pick");
        Save::parse("hero|1|2|1|2,3,4,5,6\n")
            .unwrap()
            .write(&path)
            .unwrap();
        let state = MenuState::from_save_path(Some(path.clone()));
        assert_eq!(
            state.hero(),
            Hero {
                class: 1,
                race: 1,
                sex: 0,
                features: [0; 5]
            }
        );
        assert_eq!(state.zone, 0);
        assert!(state.error.is_none());
        assert_eq!(state.save.heroes()[0].race, 2);
        std::fs::remove_dir_all(path.parent().unwrap()).unwrap();
    }
}
