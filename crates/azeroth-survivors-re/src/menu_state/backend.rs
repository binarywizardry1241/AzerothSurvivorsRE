//! Current1458bb9f0 account command payloads. UI Save and Server Save have separate owners.
use super::{default_pick, MenuState};
use crate::{catalog::MenuCatalog, save::{self, Pick, Save}};

#[derive(Clone, Debug)]
pub(super) enum Command {
    Pick(Pick),
    Gear(save::gear::ClassGear),
    WeaponGlow { class: u8, enchant: u32 },
    StarUpgrade(u32),
    Talents(u8, Vec<(String, u8)>),
    Spec(u8, u8),
    Reload,
    Rewards(crate::progression::RewardPlan),
    ResetRewards,
    Pets(Vec<String>),
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    #[test]
    fn failed_import_retains_frontend_cache_while_reload_and_pick_use_backend() {
        let catalog = MenuCatalog::embedded();
        let path = std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("../../runtime/source-tests/import-owners")
            .join(format!("{}", std::process::id())).join("characters.txt");
        let old = Save::parse("pick|1|1|0|elwynn|Arthas\nstat|kills=17\n").unwrap();
        old.write(&path).unwrap();
        let mut state = MenuState::from_save_path(Some(path.clone()));
        state.pending_saves.clear();
        let imported = Save::parse("pick|8|7|1|naxx|Alric\nopen|1|naxx\nstat|kills=99\n").unwrap();
        // The caller parsed successfully, but its best-effort write left the old active file.
        state.import_save(imported, &catalog);
        assert_eq!(state.save.statistics()["kills"], 99);
        assert_eq!(state.name, "Arthas");
        state.persist_selection(&catalog);
        assert_eq!(state.backend_save.statistics()["kills"], 17);
        assert_eq!(state.save.statistics()["kills"], 99);
        state.zone = 11;
        state.commit_pick(&catalog);
        state.persist_selection(&catalog);
        assert_eq!(state.backend_pick.zone, "elwynn");
        assert_eq!(state.backend_save.statistics()["kills"], 17);
        assert_eq!(state.save.pick().unwrap().zone, "naxx");
        // Actual custom-menu root recreation is the separate cache-read boundary.
        state.refresh_frontend_save();
        assert_eq!(state.save.statistics()["kills"], 17);
        assert_eq!(state.zone, 0);
        std::fs::remove_dir_all(path.parent().unwrap()).unwrap();
    }

    #[test]
    fn requests_are_revalidated_against_backend_budget_ownership_and_reset_count() {
        let mut state = MenuState::from_save_path(None);
        state.backend_save = Save::parse("resets|4294967295\nstat|kills=17\n").unwrap();
        state.save = Save::parse("items|101000\nequip|1|0:101000\ntalent|1|1000|deflection:3\n").unwrap();
        state.pending_saves.clear();
        state.queue_gear(1);
        state.queue_talents(1);
        state.pending_commands.push(Command::ResetRewards);
        state.pending_commands.push(Command::Pets(vec!["rabbit".into(),"unknown".into(),"owl".into()]));
        state.persist_selection(&MenuCatalog::embedded());
        assert!(crate::armory::GearSave::read(&state.backend_save).equipped.is_empty());
        assert!(state.backend_save.talent_allocation(1).is_empty());
        assert_eq!(state.backend_save.talent_xp(1),0);
        assert!(state.backend_save.plaintext().contains("resets|4294967295"));
        assert_eq!(crate::progression::saved_pets(&state.backend_save),["squirrel","squirrel"]);
        assert!(state.save.plaintext().contains("items|101000"));
        assert_eq!(state.backend_save.statistics()["kills"],17);
    }

    #[test]
    fn backend_account_snapshot_does_not_clone_imported_frontend_or_local_pick() {
        let mut state = MenuState::from_save_path(None);
        state.pending_saves.clear();
        state.save = Save::parse("stat|kills=99\n").unwrap();
        state.backend_save = Save::parse("stat|kills=17\n").unwrap();
        state.name = "Localedit".into();
        state.commit_account();
        assert_eq!(state.pending_saves[0].statistics()["kills"],17);
        assert!(state.pending_saves[0].pick().is_none());
    }

    #[test]
    fn reward_and_pet_commands_match_complete_current_native_helper_vectors() {
        let vectors: Value = serde_json::from_str(include_str!("../../../../docs/analysis/evidence/reward-admission/cases.json")).unwrap();
        let historical: Value = serde_json::from_str(include_str!("../../../../docs/analysis/evidence/account-command-helpers/native-vectors.json")).unwrap();
        let catalog: Value = serde_json::from_str(include_str!("../../assets/rewards-catalogs-0.112.0.json")).unwrap();
        let all = catalog["achievements"].as_array().unwrap().iter()
            .map(|row| row["key"].as_str().unwrap()).collect::<Vec<_>>().join(",");
        for row in vectors["rewards"].as_array().unwrap() {
            let owned: std::collections::BTreeMap<String,u8> = serde_json::from_value(row["owned"].clone()).unwrap();
            let tabs: Vec<u32> = serde_json::from_value(row["owned_tabards"].clone()).unwrap();
            let mut save = Save::parse(&format!("ach|{}\nperk|{}\ntabard|{}\npets|rabbit,owl\nresets|2\nstat|kills=77\n",
                if row["earned"] == "all" { &all } else { "" },
                owned.iter().map(|(k,v)|format!("{k}:{v}")).collect::<Vec<_>>().join(","),
                tabs.iter().map(u32::to_string).collect::<Vec<_>>().join(","))).unwrap();
            let request = crate::progression::RewardPlan {
                perks:serde_json::from_value(row["request"].clone()).unwrap(),
                tabards:serde_json::from_value::<Vec<u32>>(row["tabards"].clone()).unwrap().into_iter().collect(),
                races:Default::default(),
            };
            let before_pets = crate::progression::saved_pets(&save);
            let expected = if row["accepted"] == true { request.clone() }
                else { crate::progression::RewardPlan::read(&save) };
            let accepted = crate::progression::apply_reward_command(&mut save,request).unwrap();
            assert_eq!(accepted,row["accepted"].as_bool().unwrap(),"{row}");
            let actual = crate::progression::RewardPlan::read(&save);
            assert_eq!(actual.perks,expected.perks,"{row}");
            assert_eq!(actual.tabards,expected.tabards,"{row}");
            let serialized_perks = if expected.perks.is_empty() { String::new() } else {
                format!("perk|{}", expected.perks.iter().map(|(key,rank)| format!("{key}:{rank}")).collect::<Vec<_>>().join(","))
            };
            assert_eq!(save.plaintext().lines().find(|line|line.starts_with("perk|")).unwrap_or(""),
                serialized_perks,"{row}");
            assert_eq!(crate::progression::saved_pets(&save),before_pets);
            assert!(save.plaintext().contains("resets|2"));
            assert_eq!(save.statistics()["kills"],77);
        }
        for row in vectors["pets"].as_array().unwrap() {
            let earned:Vec<String> = if row["earned"] == "all" { all.split(',').map(str::to_owned).collect() }
                else { serde_json::from_value(row["earned"].clone()).unwrap() };
            let mut save = Save::parse(&format!("ach|{}\nresets|4294967295\nstat|kills=77\n",earned.join(","))).unwrap();
            crate::progression::apply_pet_command(&mut save,serde_json::from_value(row["input"].clone()).unwrap()).unwrap();
            let expected:Vec<String> = serde_json::from_value(row["output"].clone()).unwrap();
            assert_eq!(crate::progression::saved_pets(&save),expected,"{row}");
            assert!(save.plaintext().contains("resets|4294967295"));
        }
        // Historical serializer/reload/Reset coverage retains its original target.
        for row in historical["zero_rank_lifecycle"].as_array().unwrap() {
            let key = row["key"].as_str().unwrap();
            let resets = row["resets_before"].as_u64().unwrap();
            let mut save = Save::parse(&format!("pets|rabbit\nresets|{resets}\nstat|kills=77\n")).unwrap();
            assert!(crate::progression::apply_reward_command(&mut save,crate::progression::RewardPlan {
                perks:[(key.to_owned(),0)].into(),tabards:Default::default(),
                races:Default::default(),
            }).unwrap());
            assert!(save.plaintext().lines().any(|line|line == row["serialized_before"].as_str().unwrap()));
            if row["reload"] == true { save = Save::parse(&save.plaintext()).unwrap(); }
            assert_eq!(crate::progression::apply_reward_reset(&mut save).unwrap(),row["writes"] == 1,"{row}");
            assert_eq!(crate::progression::RewardPlan::read(&save).perks,
                serde_json::from_value::<std::collections::BTreeMap<String,u8>>(row["perks"].clone()).unwrap(),"{row}");
            assert_eq!(save.plaintext().lines().find(|line|line.starts_with("perk|")).unwrap_or(""),
                row["serialized_perks"].as_str().unwrap(),"{row}");
            assert_eq!(save.statistics()["kills"],77);
            assert_eq!(crate::progression::saved_pets(&save),["rabbit"]);
            let after = row["resets"].as_u64().unwrap();
            assert_eq!(save.plaintext().lines().find_map(|line|line.strip_prefix("resets|").map(str::to_owned))
                .unwrap_or_else(||"0".into()),after.to_string(),"{row}");
        }
    }
}

impl MenuState {
    #[cfg(test)]
    pub(crate) fn account_commands(&self) -> Vec<&'static str> {
        self.pending_commands.iter().map(|request| match request {
            Command::Pick(_) => "Pick", Command::Gear(_) => "Gear",
            Command::WeaponGlow { .. } => "WeaponGlow",
            Command::StarUpgrade(_) => "StarUpgrade",
            Command::Talents(..) => "Talents", Command::Spec(..) => "Spec",
            Command::Reload => "Reload", Command::Rewards(_) => "Rewards",
            Command::ResetRewards => "Reset", Command::Pets(_) => "Pets",
        }).collect()
    }
    pub(crate) fn backend_pick(&self) -> &Pick { &self.backend_pick }

    pub(crate) fn load_active_save(&self) -> Save {
        self.save_path.as_deref().map(Save::load).and_then(Result::ok).unwrap_or_default()
    }

    /// Native140074b60 refreshes this independent frontend cache when its menu root is rebuilt.
    pub(crate) fn refresh_frontend_save(&mut self) {
        self.save = self.load_active_save();
        self.clamp_zone();
        self.save_revision = self.save_revision.wrapping_add(1);
        self.dirty = true;
    }

    fn queue_account_command(&mut self, command: Command) {
        self.pending_commands.push(command);
        self.save_revision = self.save_revision.wrapping_add(1);
        self.dirty = true;
    }

    pub(crate) fn queue_gear(&mut self, class: u8) {
        let plain = self.save.plaintext();
        let records = save::gear::Records::read(plain.lines());
        let row = records.classes.into_iter().find(|row| row.class_id == class)
            .unwrap_or_else(|| save::gear::ClassGear {class_id: class, ..Default::default()});
        self.queue_account_command(Command::Gear(row));
    }
    pub(crate) fn queue_weapon_glow(&mut self, class: u8, enchant: u32) {
        self.queue_account_command(Command::WeaponGlow { class, enchant });
    }
    pub(crate) fn queue_star_upgrade(&mut self, id: u32) {
        // Current1402c16e5 queues the ID and requests a frontend content/cache
        // refresh. Preserve its optimistic Save rather than replacing it with
        // the independent backend account or forcing a file reload.
        self.queue_account_command(Command::StarUpgrade(id));
    }
    pub(crate) fn queue_talents(&mut self, class: u8) {
        self.queue_account_command(Command::Talents(class, self.save.talent_allocation(class)));
    }
    pub(crate) fn queue_spec(&mut self, class: u8, slot: u8) {
        self.queue_account_command(Command::Spec(class, slot));
    }
    pub(crate) fn queue_rewards(&mut self) {
        self.queue_account_command(Command::Rewards(crate::progression::RewardPlan::read(&self.save)));
    }
    pub(crate) fn queue_reward_reset(&mut self) {
        self.queue_account_command(Command::ResetRewards);
    }
    pub(crate) fn queue_pets(&mut self) {
        self.queue_account_command(Command::Pets(crate::progression::saved_pets(&self.save)));
    }

    /// Called by the existing update driver, with no added clock or guessed thread delay.
    /// Backend commands never install their Save into the frontend resource.
    pub(crate) fn drain_backend_commands(&mut self, catalog: &MenuCatalog) {
        for command in std::mem::take(&mut self.pending_commands) {
            let result = match command {
                Command::Pick(pick) => {
                    // Current145b1bdb8/145b1bdd6 normalize, then clamp against
                    // this backend account before updating its Hero and Pick.
                    let mut pick = pick.normalized();
                    pick.hero = self.backend_save.clamp_hero(pick.hero);
                    let opened = self.backend_save.unlock_value(pick.hero.class).unwrap_or(1).clamp(1,12) as usize;
                    let zone = catalog.zones.iter().position(|zone| zone.key == pick.zone).unwrap_or(0);
                    pick.zone = catalog.zones[zone.min(opened-1)].key.clone();
                    self.backend_pick = pick.clone();
                    self.backend_save.set_hero(&pick.hero).and_then(|()| self.backend_save.set_pick(&pick)).map(|()| true)
                }
                Command::Gear(row) => crate::armory::apply_gear_command(&mut self.backend_save, self.backend_pick.hero.race, row).map(|()| true),
                Command::WeaponGlow { class, enchant } => Ok(self.backend_save.set_weapon_glow(class, enchant)),
                Command::StarUpgrade(id) => {
                    // Current145b2a8dc revalidates ownership, cap and currency.
                    // Rejection neither grants achievements nor writes a file.
                    if self.backend_save.upgrade_star(id).is_ok() {
                        drop(crate::progression::grant_account(&mut self.backend_save, None));
                        Ok(true)
                    } else {
                        Ok(false)
                    }
                }
                Command::Talents(class, values) => {
                    let xp = self.backend_save.talent_xp(class) as u32;
                    self.backend_save.set_talent_allocation(class, xp, &values).map(|()| true)
                }
                Command::Spec(class, slot) => self.backend_save.select_talent_spec(class, slot),
                Command::Reload => {
                    self.backend_save = self.load_active_save();
                    // Reload16 clones optional Pick as stored: no frontend clamp/random-name call.
                    self.backend_pick = self.backend_save.pick().unwrap_or_else(default_pick);
                    Ok(!crate::progression::grant_account(&mut self.backend_save, None).is_empty())
                }
                Command::Rewards(plan) => crate::progression::apply_reward_command(&mut self.backend_save, plan),
                Command::ResetRewards => crate::progression::apply_reward_reset(&mut self.backend_save),
                Command::Pets(pets) => crate::progression::apply_pet_command(&mut self.backend_save, pets).map(|()| true),
            };
            match result {
                Ok(true) => if let Some(path) = self.save_path.as_deref() {
                    if let Err(error) = self.backend_save.write(path) {
                        eprintln!("rogue: cannot save characters to {}: {error}", path.display());
                    }
                },
                Ok(false) => {},
                Err(error) => eprintln!("rogue: account command rejected: {error}"),
            }
        }
    }
}
