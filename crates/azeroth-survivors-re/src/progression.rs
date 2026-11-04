//! Achievements/Rewards pages, historical catalogs and current cooperative additions.
//! Native evidence: achievements-menu-0.109.0.md / rewards-menu-0.109.0.md /
//! account-command-owners-0.109.0.md. Historical gameplay grant recovery remains
//! separately identified in account-progression-0.100.1.md.
//! Current data/admission: rewards-catalogs-0.112.0.md; appearances: armory-cosmetics-0.112.0.md.
use std::collections::{BTreeMap, BTreeSet};

use bevy::{input::mouse::MouseWheel, prelude::*};
use serde::Deserialize;

use crate::{
    armory::{ArmoryCatalog, GearSave},
    assets::{self, MenuArt},
    canvas::NativeCanvas,
    catalog::MenuCatalog,
    menu::{self, Face},
    menu_state::{Dialog, MenuState, Page},
    options::{OptionsSet, OptionsState},
    save::{Save, SaveError, CLASS_IDS},
};

mod rewards;
mod achievements_sidebar;
#[cfg(test)]
mod race_persistence_tests;

const CATEGORIES: [&str; 7] = ["Zones", "Classes", "Collection", "Feats", "Lifetime", "Co-op", "Heroic"];
// Current1400cb7a0 indexes the relative icon table at1461b1c18 by category+1.
const CATEGORY_ICONS: [&str; 7] = [
    "INV_Misc_Map_01",
    "INV_BannerPVP_02",
    "INV_Chest_Plate16",
    "Ability_Warrior_SavageBlow",
    "INV_Misc_PocketWatch_01",
    "Spell_Holy_PrayerOfHealing02",
    "INV_Misc_Head_Dragon_Black",
];
// Native UI color records around 1458f3558–1458f3914.
const GOLD: Color = Color::srgb(0.973, 0.824, 0.416);
const PAPER: Color = Color::srgb(1., 0.914, 0.659);
const MUTED: Color = Color::srgb(0.725, 0.663, 0.510);
const EDGE: Color = Color::srgb(0.427, 0.333, 0.145);
const DARK: Color = Color::srgba(0., 0., 0., 0.45);
const RED: Color = Color::srgb(1., 0.353, 0.235);
const GREEN: Color = Color::srgb(0.302, 1., 0.416);

pub struct ProgressionPlugin;
impl Plugin for ProgressionPlugin {
    fn build(&self, app: &mut App) {
        app.insert_resource(Catalog::embedded())
            .init_resource::<Art>()
            .init_resource::<ProgressionState>()
            .add_systems(Startup, load_art)
            .add_systems(
                Update,
                (input.run_if(crate::update_ui::menu_input_enabled), rebuild)
                    .chain()
                    .in_set(crate::menu_state::AccountInput)
                    .after(OptionsSet::Input),
            );
    }
}

#[derive(Resource, Deserialize)]
struct Catalog {
    achievements: Vec<Achievement>,
    perks: Vec<Perk>,
    tabards: Vec<Tabard>,
    companions: Vec<Companion>,
}
impl Catalog {
    fn embedded() -> Self {
        #[derive(Deserialize)]
        struct Additions {
            tabard_insertion_index: usize,
            tabards: Vec<Tabard>,
            companions: Vec<Companion>,
        }
        let mut catalog: Self =
            serde_json::from_str(include_str!("../assets/rewards-catalogs-0.112.0.json"))
                .expect("version-bound account and Rewards catalogs");
        #[derive(Deserialize)]
        struct CooperativeAchievements {
            achievements: Vec<Achievement>,
        }
        let cooperative: CooperativeAchievements = serde_json::from_str(include_str!(
            "../assets/coop-achievements-0.117.0.json"
        ))
        .expect("current cooperative achievement descriptors");
        catalog.achievements.extend(cooperative.achievements);
        #[derive(Deserialize)]
        struct CooperativeDescriptions {
            descriptions: BTreeMap<String, String>,
        }
        for embedded in [
            include_str!("../assets/coop-achievement-descriptions-0.119.0.json"),
            include_str!("../assets/hakkar-smoothie-0.119.0.json"),
        ] {
            let descriptions: CooperativeDescriptions = serde_json::from_str(embedded)
                .expect("0.119.0 achievement description keys");
            for (key, description) in descriptions.descriptions {
                catalog.achievements.iter_mut().find(|entry| entry.key == key)
                    .expect("description override has an achievement owner")
                    .description = description;
            }
        }
        let additions: Additions =
            serde_json::from_str(include_str!("../assets/party-rewards-0.117.0.json"))
                .expect("current co-op reward descriptors");
        catalog.tabards.splice(
            additions.tabard_insertion_index..additions.tabard_insertion_index,
            additions.tabards,
        );
        catalog.companions.extend(additions.companions);
        //145b973b0 supplies the complete current order and menu descriptors.
        // Retain previously recovered reward associations by stable key; the
        // descriptor constructor does not redefine their independent catalogs.
        #[derive(Deserialize)]
        struct CurrentAchievements { achievements: Vec<Achievement> }
        let current: CurrentAchievements = serde_json::from_str(include_str!(
            "../assets/achievement-catalog-0.121.0.json"))
            .expect("current native achievement descriptors");
        let mut prior: BTreeMap<_, _> = catalog.achievements.into_iter()
            .map(|entry| (entry.key.clone(), entry.unlocks)).collect();
        catalog.achievements = current.achievements.into_iter().map(|mut entry| {
            entry.unlocks = prior.remove(&entry.key).unwrap_or_default();
            entry
        }).collect();
        let current: CurrentAchievements = serde_json::from_str(include_str!(
            "../assets/coop-achievements-0.127.0.json"
        ))
            .expect("current cooperative achievement descriptors");
        let mut insertion = None;
        for mut entry in current.achievements {
            if let Some(index) = catalog.achievements.iter().position(|row| row.key == entry.key) {
                if entry.unlocks.is_empty() {
                    entry.unlocks = std::mem::take(&mut catalog.achievements[index].unlocks);
                }
                catalog.achievements[index] = entry;
                insertion = Some(index + 1);
            } else if let Some(index) = insertion {
                catalog.achievements.insert(index, entry);
                insertion = Some(index + 1);
            } else {
                catalog.achievements.push(entry);
                insertion = Some(catalog.achievements.len());
            }
        }
        // Native unlock rows retain their descriptor identity until the name
        // lookup (0.119.0 145c3e7f0); their English names are not locale keys.
        for achievement in &mut catalog.achievements {
            for unlock in &mut achievement.unlocks {
                unlock.name_key = crate::armory::cosmetics::all()
                    .iter()
                    .find(|entry| entry.achievement == achievement.key
                        && entry.name == unlock.name && entry.icon == unlock.icon)
                    .map(|entry| UnlockNameKey::Cosmetic(entry.id))
                    .or_else(|| catalog.tabards.iter()
                        .find(|entry| entry.zone.as_deref() == Some(achievement.key.as_str())
                            && entry.name == unlock.name && entry.icon == unlock.icon)
                        .map(|entry| UnlockNameKey::Tabard(entry.id)));
            }
        }
        catalog
    }
    fn achievement(&self, key: &str) -> Option<&Achievement> {
        self.achievements.iter().find(|entry| entry.key == key)
    }
    fn perk(&self, key: &str) -> Option<&Perk> {
        self.perks.iter().find(|entry| entry.key == key)
    }
}

#[derive(Deserialize)]
struct Achievement {
    key: String,
    name: String,
    description: String,
    icon: String,
    points: u32,
    category: usize,
    tokens: BTreeMap<String, String>,
    #[serde(default)]
    unlocks: Vec<Unlock>,
}
#[derive(Deserialize)]
struct Unlock {
    prefix: String,
    name: String,
    icon: String,
    #[serde(skip)]
    name_key: Option<UnlockNameKey>,
}
#[derive(Clone, Copy)]
enum UnlockNameKey {
    Tabard(u32),
    Cosmetic(u32),
}
impl Unlock {
    fn label<'a>(&'a self, labels: &'a MenuCatalog) -> &'a str {
        let key = match self.name_key {
            Some(UnlockNameKey::Tabard(id)) => format!("tabard.{id}"),
            Some(UnlockNameKey::Cosmetic(id)) => format!("cosmetic.{id}"),
            None => return labels.label(&self.name),
        };
        labels.labels.get(&key).map(String::as_str).unwrap_or(&self.name)
    }
}
impl Achievement {
    fn label(&self, catalog: &MenuCatalog, value: &str) -> String {
        let mut output = catalog.label(value).to_owned();
        for (token, value) in &self.tokens {
            output = output.replace(&format!("{{{token}}}"), catalog.label(value));
        }
        output
    }
}
#[derive(Deserialize)]
struct Perk {
    key: String,
    name: String,
    icon: String,
    costs: Vec<u32>,
    descriptions: Vec<String>,
    achievement: String,
    prerequisite: Option<String>,
    category: u8,
}
#[derive(Deserialize)]
struct Tabard {
    id: u32,
    name: String,
    icon: String,
    zone: Option<String>,
    cost: u32,
    display_id: u32,
}

impl Tabard {
    fn available(&self, account: &Progress) -> bool {
        self.zone.as_ref().map_or_else(
            || account.tabards.contains(&self.id),
            |key| account.earned.contains(key),
        )
    }
}

/// Current1459d2e10 adds these earned or purchased IDs to gear validation.
pub(crate) fn available_tabard_ids(save: &Save) -> BTreeSet<u32> {
    static CATALOG: std::sync::OnceLock<Catalog> = std::sync::OnceLock::new();
    let catalog = CATALOG.get_or_init(Catalog::embedded);
    let account = Progress::read_with_menu(save, None);
    catalog.tabards.iter().filter(|tabard| tabard.available(&account))
        .map(|tabard| tabard.id).collect()
}

pub(crate) fn available_cosmetic_ids(save: &Save) -> BTreeSet<u32> {
    let account = Progress::read_with_menu(save, None);
    crate::armory::cosmetics::all()
        .iter()
        .filter(|entry| account.earned.contains(&entry.achievement))
        .map(|entry| entry.id)
        .collect()
}

pub fn tabard_display_id(id: u32) -> Option<u32> {
    static CATALOG: std::sync::OnceLock<Catalog> = std::sync::OnceLock::new();
    CATALOG
        .get_or_init(Catalog::embedded)
        .tabards
        .iter()
        .find(|tabard| tabard.id == id)
        .map(|tabard| tabard.display_id)
}
pub(crate) use azeroth_survivors_re::account_progression::is_purchasable_tabard;
/// Current145b35460: earned points minus purchased perks, tabards and races.
pub fn available_points(save: &Save) -> u32 {
    static CATALOG: std::sync::OnceLock<Catalog> = std::sync::OnceLock::new();
    let catalog = CATALOG.get_or_init(Catalog::embedded);
    let account = Progress::read_with_menu(save, None);
    account
        .earned_points(catalog)
        .saturating_sub(account.spent(catalog))
}
/// Native1458cbba0 counts earned achievements before purchased rewards.
pub(crate) fn earned_points(save: &Save) -> u32 {
    static CATALOG: std::sync::OnceLock<Catalog> = std::sync::OnceLock::new();
    Progress::read_with_menu(save, None).earned_points(CATALOG.get_or_init(Catalog::embedded))
}

/// Hero admission14584b690 caps a peer's points at the full catalog total.
pub(crate) fn maximum_achievement_points() -> u32 {
    static CATALOG: std::sync::OnceLock<Catalog> = std::sync::OnceLock::new();
    CATALOG.get_or_init(Catalog::embedded).achievements.iter().map(|row| row.points).sum()
}
#[derive(Deserialize)]
struct Companion {
    key: String,
    name: String,
    icon: String,
    achievement: Option<String>,
    achievement_name: Option<String>,
}

/// Prefix formats are recovered from native 1453ff1b0 and their CSV formatters.
#[derive(Clone, Default, Debug, PartialEq, Eq)]
struct Progress {
    earned: BTreeSet<String>,
    dates: BTreeMap<String, u64>,
    stats: BTreeMap<String, u64>,
    perks: BTreeMap<String, u8>,
    tabards: BTreeSet<u32>,
    races: Vec<u8>,
    companions: Vec<String>,
    resets: u32,
    beaten: BTreeSet<(u8, usize)>,
    seen: BTreeSet<String>,
}

/// Current command17 carries perks, tabards and permanent race purchases.
#[derive(Clone, Debug)]
pub(crate) struct RewardPlan {
    pub(crate) perks: BTreeMap<String, u8>,
    pub(crate) tabards: BTreeSet<u32>,
    pub(crate) races: Vec<u8>,
}
impl RewardPlan {
    pub(crate) fn read(save: &Save) -> Self {
        let value = Progress::read_with_menu(save, None);
        Self { perks: value.perks, tabards: value.tabards, races: value.races }
    }
}
pub(crate) fn saved_pets(save: &Save) -> Vec<String> {
    Progress::read_with_menu(save, None).companions
}
fn replace_reward_records(save: &mut Save, records: &[(&str, String)]) -> Result<(), SaveError> {
    save.replace_runtime_records(
        |line| records.iter().any(|(prefix, _)| line.starts_with(prefix)),
        records.iter().filter(|(_, value)| !value.is_empty())
            .map(|(prefix, value)| format!("{prefix}{value}")),
    );
    Ok(())
}
pub(crate) fn apply_reward_command(save: &mut Save, request: RewardPlan) -> Result<bool, SaveError> {
    let owned = Progress::read_with_menu(save, None);
    let mut plan = owned.clone();
    plan.perks = request.perks;
    plan.tabards = request.tabards;
    // Current145b36190 sorts/deduplicates scalar vectors before validating.
    plan.races = request.races;
    plan.races.sort_unstable();
    plan.races.dedup();
    if !valid_plan(&plan, &owned, &Catalog::embedded()) { return Ok(false); }
    replace_reward_records(save, &[
        ("perk|", plan.perks.iter().map(|(key,rank)| format!("{key}:{rank}")).collect::<Vec<_>>().join(",")),
        ("tabard|", plan.tabards.iter().map(u32::to_string).collect::<Vec<_>>().join(",")),
        ("races|", plan.races.iter().map(u8::to_string).collect::<Vec<_>>().join(",")),
    ])?;
    Ok(true)
}
pub(crate) fn apply_reward_reset(save: &mut Save) -> Result<bool, SaveError> {
    let mut owned = Progress::read_with_menu(save, None);
    if owned.resets >= 2 || owned.perks.is_empty() { return Ok(false); }
    owned.perks.clear();
    owned.resets += 1;
    replace_reward_records(save, &[("perk|", String::new()), ("resets|", owned.resets.to_string())])?;
    Ok(true)
}
pub(crate) fn apply_pet_command(save: &mut Save, pets: Vec<String>) -> Result<(), SaveError> {
    let catalog = Catalog::embedded();
    let mut owned = Progress::read_with_menu(save, None);
    // Current1459cdc50 takes the first two inputs, substituting squirrel for
    // unknown/locked entries; it does not filter those entries out of the slots.
    owned.companions = pets.into_iter().take(2).map(|key| {
        if catalog.companions.iter().any(|entry| entry.key == key &&
            entry.achievement.as_ref().is_none_or(|gate| owned.earned.contains(gate))) { key }
        else { "squirrel".into() }
    }).collect();
    replace_reward_records(save, &[("pets|", owned.companions.join(","))])
}

/// Resolve saved companion looks and purchased instincts through Rewards' parser.
pub(crate) fn account_loot_companions(
    save: &Save,
) -> azeroth_survivors_re::run_effects::loot_companions::Config {
    let progress = Progress::read_with_menu(save, None);
    azeroth_survivors_re::run_effects::loot_companions::saved_config(
        [progress.pet(0), progress.pet(1)],
        |key| progress.rank(key),
        |key| progress.earned.contains(key),
    )
}

/// Use the same purchased-rank parser as Rewards when producing a new run.
pub(crate) fn account_run_grants(
    save: &Save,
    class: u8,
) -> azeroth_survivors_re::run_progression::AccountGrants {
    let progress = Progress::read_with_menu(save, None);
    let mut grants = azeroth_survivors_re::run_progression::account_grants(
        class,
        |key| progress.rank(key),
        |id| save.talent_xp(id) as u32,
    );
    grants.cooperative_luck = azeroth_survivors_re::run_progression::cooperative_luck(
        progress.earned.contains("coop:team"),
    );
    grants
}

impl Progress {
    fn read(save: &Save, menu: &MenuCatalog) -> Self {
        Self::read_with_menu(save, Some(menu))
    }
    fn read_with_menu(save: &Save, menu: Option<&MenuCatalog>) -> Self {
        let mut value = Self { races: save.purchased_races(), ..Self::default() };
        for line in save.plaintext().lines() {
            let fields = line.split('|').collect::<Vec<_>>();
            if fields.len() < 2 {
                continue;
            }
            let entries = fields[1].split(',').filter(|entry| !entry.is_empty());
            match fields[0] {
                "ach" => value.earned.extend(entries.map(str::to_owned)),
                "achat" => value.dates.extend(entries.filter_map(|entry| {
                    let (key, number) = entry.rsplit_once('=')?;
                    Some((key.to_owned(), number.parse().ok()?))
                })),
                "stat" => value.stats.extend(entries.filter_map(|entry| {
                    let (key, number) = entry.split_once('=')?;
                    Some((key.to_owned(), number.parse().ok()?))
                })),
                "perk" => value.perks.extend(entries.filter_map(|entry| {
                    let (key, number) = entry.rsplit_once(':')?;
                    Some((key.to_owned(), number.parse().ok()?))
                })),
                "tabard" => value
                    .tabards
                    .extend(entries.filter_map(|entry| entry.parse::<u32>().ok())),
                "pets" => value.companions = entries.map(str::to_owned).collect(),
                "resets" => value.resets = fields[1].parse().unwrap_or(0),

                "beat" if fields.len() == 3 => {
                    if let Ok(class) = fields[1].parse::<u8>() {
                        for zone in fields[2].split(',') {
                            if let Some(index) = menu.and_then(|menu| {
                                menu.zones.iter().position(|entry| entry.key == zone)
                            }) {
                                value.beaten.insert((class, index));
                            }
                        }
                    }
                }
                _ => {}
            }
        }
        value.seen = save.seen().into_keys().collect();
        value
    }
    fn earned_points(&self, catalog: &Catalog) -> u32 {
        catalog
            .achievements
            .iter()
            .filter(|entry| self.earned.contains(&entry.key))
            .map(|entry| entry.points)
            .sum()
    }
    fn spent(&self, catalog: &Catalog) -> u32 {
        let perks: u32 = catalog
            .perks
            .iter()
            .map(|perk| {
                let rank = usize::from(self.perks.get(&perk.key).copied().unwrap_or(0));
                perk.costs.iter().take(rank).sum::<u32>()
            })
            .sum();
        perks
            + catalog
                .tabards
                .iter()
                .filter(|tabard| self.tabards.contains(&tabard.id))
                .map(|tabard| tabard.cost)
                .sum::<u32>()
            + 100 * self.races.len() as u32
    }
    fn rank(&self, key: &str) -> u8 {
        self.perks.get(key).copied().unwrap_or(0)
    }
    fn pet(&self, slot: usize) -> &str {
        self.companions
            .get(slot)
            .map(String::as_str)
            .unwrap_or("squirrel")
    }
    fn set_pet(&mut self, slot: usize, key: &str) {
        self.companions = vec![self.pet(0).into(), self.pet(1).into()];
        self.companions[slot.min(1)] = key.into();
    }
    fn write_rewards(&self, save: &mut Save) -> Result<(), SaveError> {
        let mut lines = Vec::new();
        // Frontend Confirm uses the same scalar-vector normalization as
        // command17 before assigning and serializing its optimistic account.
        let mut races = self.races.clone();
        races.sort_unstable();
        races.dedup();
        if !self.perks.is_empty() {
            lines.push(format!(
                "perk|{}",
                self.perks
                    .iter()
                    .map(|(key, rank)| format!("{key}:{rank}"))
                    .collect::<Vec<_>>()
                    .join(",")
            ));
        }
        if !self.tabards.is_empty() {
            lines.push(format!(
                "tabard|{}",
                self.tabards
                    .iter()
                    .map(u32::to_string)
                    .collect::<Vec<_>>()
                    .join(",")
            ));
        }
        if !races.is_empty() {
            lines.push(format!("races|{}", races.iter().map(u8::to_string)
                .collect::<Vec<_>>().join(",")));
        }
        if !self.companions.is_empty() {
            lines.push(format!("pets|{}", self.companions.join(",")));
        }
        if self.resets > 0 {
            lines.push(format!("resets|{}", self.resets));
        }
        save.replace_runtime_records(
            |line| ["perk|", "tabard|", "races|", "pets|", "resets|"].iter()
                .any(|prefix| line.starts_with(prefix)),
            lines,
        );
        Ok(())
    }
}

fn achievement_inputs(save: &Save) -> azeroth_survivors_re::account_progression::Account {
    let stats = save.statistics();
    let plain = save.plaintext();
    let gear = crate::save::gear::Records::read(plain.lines());
    azeroth_survivors_re::account_progression::Account {
        beaten: save.beaten_zones(),
        cooperative_beaten: save.cooperative_beaten_zones(),
        talent_xp: CLASS_IDS
            .into_iter()
            .map(|class| (class, save.talent_xp(class) as u32))
            .collect(),
        gear: gear.owned,
        stars: gear.stars.into_iter().collect(),
        heroic_clears: save.heroic_clears(),
        seen: save.seen().len(),
        statistics: [
            "kills",
            "gold",
            "guardians",
            "bosses",
            "runs",
            "wins",
            "caches",
            "marks",
        ]
        .map(|key| stats.get(key).copied().unwrap_or(0)),
    }
}
/// Current0.112.0 1459b6410; startup/reload leaves retroactive grants undated.
pub(crate) fn grant_account(save: &mut Save, earned_at: Option<u64>) -> Vec<String> {
    save.normalize_achievement_inputs();
    let account = achievement_inputs(save);
    let keys = azeroth_survivors_re::account_progression::definitions()
        .iter()
        .filter(|definition| {
            azeroth_survivors_re::account_progression::progress(definition, &account)
                .is_some_and(|(have, total)| have >= total)
        })
        .map(|definition| definition.key.clone())
        .collect::<Vec<_>>();
    save.grant_achievements(&keys, earned_at)
}
/// Current0.112.0 1459b5e40. Root owns wrapper eligibility and flush scheduling.
pub(crate) fn grant_run_feats(
    save: &mut Save,
    snapshot: azeroth_survivors_re::account_progression::RunSnapshot,
    killing_blows: &[(u32, u32)],
    boss_killing_blows: &[azeroth_survivors_re::account_progression::BossKillingBlow],
    damaged_by_bosses: &[u32],
    earned_at: u64,
) -> Vec<String> {
    let keys = azeroth_survivors_re::account_progression::definitions()
        .iter()
        .filter(|definition| {
            azeroth_survivors_re::account_progression::meets_feat_with_events(
                definition, snapshot, killing_blows, boss_killing_blows, damaged_by_bosses,
            )
        })
        .map(|definition| definition.key.clone())
        .collect::<Vec<_>>();
    save.grant_achievements(&keys, Some(earned_at))
}
/// Current0.117.0 party predicates retain the shared event/member snapshots;
/// ordinary account/history grants keep their independent save transaction.
pub(crate) fn grant_party_feats(
    save: &mut Save,
    zone: usize,
    run: azeroth_survivors_re::account_progression::RunSnapshot,
    context: &azeroth_survivors_re::coop::replication::NativeCoopFeats,
    earned_at: u64,
) -> Vec<String> {
    let keys = azeroth_survivors_re::account_progression::eligible_cooperative_keys(
        zone, run, context,
    );
    save.grant_achievements(&keys, Some(earned_at))
}
fn progress(
    entry: &Achievement,
    _account: &Progress,
    save: &Save,
    _gear: &GearSave,
    _armory: &ArmoryCatalog,
) -> Option<(u64, u64)> {
    let definition = azeroth_survivors_re::account_progression::definitions()
        .iter()
        .find(|definition| definition.key == entry.key)?;
    azeroth_survivors_re::account_progression::progress(definition, &achievement_inputs(save))
        .map(|(have, total)| (have.min(total), total))
}

fn valid_plan(plan: &Progress, owned: &Progress, catalog: &Catalog) -> bool {
    if owned.perks.iter().any(|(key, rank)| plan.rank(key) < *rank)
        || !owned.tabards.is_subset(&plan.tabards)
        || plan.races.iter().any(|race| !(1..=8).contains(race))
        || owned.races.iter().any(|race| !plan.races.contains(race))
        || plan.spent(catalog) > owned.earned_points(catalog)
    {
        return false;
    }
    for (key, rank) in &plan.perks {
        let Some(perk) = catalog.perk(key) else {
            return false;
        };
        if usize::from(*rank) > perk.costs.len() {
            return false;
        }
        if *rank > owned.rank(key) && !owned.earned.contains(&perk.achievement) {
            return false;
        }
        // Current1458d7a5c checks an explicit row's prerequisite even at rank0.
        if perk
            .prerequisite
            .as_ref()
            .is_some_and(|key| plan.rank(key) == 0)
        {
            return false;
        }
    }
    let instincts = ["instinct_gold", "instinct_wisps", "instinct_runes"]
        .iter()
        .filter(|key| plan.rank(key) > 0)
        .count();
    if instincts > usize::from(plan.rank("companion") + plan.rank("second")) {
        return false;
    }
    plan.tabards.iter().all(|id| {
        catalog
            .tabards
            .iter()
            .any(|tabard| tabard.id == *id && tabard.zone.is_none())
    })
}

/// Current frontend1458e5690 checks the vector count, including retained zero
/// ranks. The render admission separately excludes an edited plan.
fn reset_available(owned: &Progress) -> bool {
    owned.resets < 2 && !owned.perks.is_empty()
}

#[derive(Resource, Default)]
struct Art {
    icons: BTreeMap<String, Handle<Image>>,
    dragon: Handle<Image>,
    glow_star: Handle<Image>,
    earned_card: Handle<Image>,
    progress_bar: Handle<Image>,
}
fn load_art(catalog: Res<Catalog>, mut art: ResMut<Art>, mut images: ResMut<Assets<Image>>) {
    let Some(directory) = assets::data_directory() else {
        return;
    };
    let Ok(mut chain) = benilla_formats::open_chain(&directory) else {
        return;
    };
    let art = &mut *art;
    for (path, handle) in [
        (
            "Interface\\DialogFrame\\UI-DialogBox-Gold-Dragon.blp",
            &mut art.dragon,
        ),
        ("Interface\\Buttons\\GlowStar.blp", &mut art.glow_star),
        (
            "Interface\\PaperDollInfoFrame\\UI-Character-Skills-Bar.blp",
            &mut art.progress_bar,
        ),
        (
            "Interface\\ItemTextFrame\\ItemText-Bronze-TopLeft.blp",
            &mut art.earned_card,
        ),
    ] {
        if let Ok(image) = assets::read_image(&mut chain, path) {
            *handle = images.add(image);
        }
    }
    let mut names = BTreeSet::new();
    names.extend(catalog.achievements.iter().map(|entry| entry.icon.as_str()));
    names.extend(catalog.achievements.iter().flat_map(|entry| {
        entry.unlocks.iter().map(|unlock| unlock.icon.as_str())
    }));
    names.extend(catalog.perks.iter().map(|entry| entry.icon.as_str()));
    names.extend(catalog.tabards.iter().map(|entry| entry.icon.as_str()));
    names.extend(catalog.companions.iter().map(|entry| entry.icon.as_str()));
    names.extend(crate::armory::cosmetics::all().iter().map(|entry| entry.icon.as_str()));
    names.extend(CATEGORY_ICONS);
    names.insert("INV_Misc_Note_01");
    for name in names {
        if let Ok(image) = assets::read_image(&mut chain, &format!("Interface\\Icons\\{name}.blp"))
        {
            art.icons.insert(name.to_owned(), images.add(image));
        }
    }
}

#[derive(Clone, Copy, Debug, Default, Eq, PartialEq)]
enum CompanionTab {
    #[default]
    Perks,
    Looks,
}

#[derive(Resource, Default)]
pub struct ProgressionState {
    category: Option<usize>,
    rewards_tab: u8,
    companion_tab: CompanionTab,
    companion_slot: usize,
    plan: Option<Progress>,
    reset_armed: bool,
    scroll: f32,
    signature: String,
    previous_page: Option<Page>,
    baseline: Option<Progress>,
}

impl ProgressionState {
    /// Current14013ead0 retains the Rewards destination until Confirm/Discard.
    pub(crate) fn request_page(&mut self, menu: &mut MenuState, destination: Page) {
        let owned = Progress::read_with_menu(&menu.save, None);
        let edited = self
            .plan
            .as_ref()
            .is_some_and(|plan| plan.perks != owned.perks || plan.tabards != owned.tabards
                || plan.races != owned.races);
        if menu.page == Page::Rewards && destination != Page::Rewards && edited {
            menu.dialog = Some(Dialog::RewardsChanges(destination));
        } else {
            menu.page = destination;
            menu.dialog = None;
        }
    }
}
#[derive(Component)]
struct Root;
#[derive(Component)]
struct Viewport;
#[derive(Component, Clone)]
enum Action {
    Category(Option<usize>),
    RewardsTab(u8),
    CompanionTab(CompanionTab),
    Rank(String, i8),
    Confirm,
    Undo,
    Reset,
    BuyTabard(u32),
    BuyRace(u8),
    WearTabard(Option<u32>),
    ShowCosmetic(usize, Option<u32>),
    PetSlot(usize),
    Pet(usize, String),
    ConfirmLeave,
    DiscardLeave,
    KeepEditing,
}

fn input(
    mut view: ResMut<ProgressionState>,
    mut menu: ResMut<MenuState>,
    labels: Res<MenuCatalog>,
    catalog: Res<Catalog>,
    options: Res<OptionsState>,
    mut armory: ResMut<crate::armory::ArmoryState>,
    native: Res<ArmoryCatalog>,
    actions: Query<(&Interaction, &Action), Changed<Interaction>>,
    mut viewport: Query<(&ComputedNode, &mut ScrollPosition), With<Viewport>>,
    mut wheel: MessageReader<MouseWheel>,
) {
    if !matches!(menu.page, Page::Achievements | Page::Rewards) {
        wheel.clear();
        return;
    }
    let mut owned = Progress::read(&menu.save, &labels);
    if view.baseline.as_ref() != Some(&owned) {
        let same_allocation = view.baseline.as_ref().is_some_and(|old| {
            old.perks == owned.perks
                && old.tabards == owned.tabards
                && old.races == owned.races
                && old.resets == owned.resets
                && old.earned == owned.earned
        });
        if same_allocation {
            if let Some(plan) = &mut view.plan {
                plan.companions = owned.companions.clone();
            }
        } else {
            view.plan = Some(owned.clone());
        }
        view.baseline = Some(owned.clone());
        view.reset_armed = false;
    }
    if view.previous_page != Some(menu.page) {
        view.scroll = 0.;
        view.reset_armed = false;
        view.previous_page = Some(menu.page);
    }
    let leaving = matches!(menu.dialog, Some(Dialog::RewardsChanges(_)));
    if options.open || (menu.dialog.is_some() && !leaving) {
        wheel.clear();
        return;
    }
    // Native14018a920 consumes wheel events for every AchList, without a cursor test.
    let delta = wheel
        .read()
        .map(|event| {
            event.y
                * match event.unit {
                    bevy::input::mouse::MouseScrollUnit::Line => 40.,
                    bevy::input::mouse::MouseScrollUnit::Pixel => 1.,
                }
        })
        .sum::<f32>();
    for (node, mut position) in &mut viewport {
        let maximum = ((node.content_size.y - node.size.y) * node.inverse_scale_factor).max(0.);
        let current = if position.is_added() {
            view.scroll
        } else {
            position.0.y
        };
        let next = (current - delta).clamp(0., maximum);
        if position.0.y != next {
            position.0.y = next;
        }
        if view.scroll != next {
            view.scroll = next;
        }
    }
    for (interaction, action) in &actions {
        if *interaction != Interaction::Pressed {
            continue;
        }
        if leaving
            && !matches!(
                action,
                Action::ConfirmLeave | Action::DiscardLeave | Action::KeepEditing
            )
        {
            continue;
        }
        if !matches!(action, Action::Reset) {
            view.reset_armed = false;
        }
        let mut changed = false;
        match action {
            Action::Category(category) => {
                view.category = *category;
                view.scroll = 0.;
            }
            Action::RewardsTab(tab) => {
                view.rewards_tab = *tab;
                view.scroll = 0.;
                view.reset_armed = false;
            }
            Action::CompanionTab(tab) => view.companion_tab = *tab,
            Action::Rank(key, delta) => {
                let mut candidate = view.plan.clone().unwrap_or_else(|| owned.clone());
                let old = candidate.rank(key);
                let rank = old.saturating_add_signed(*delta);
                if rank == 0 {
                    candidate.perks.remove(key);
                } else {
                    candidate.perks.insert(key.clone(), rank);
                }
                if valid_plan(&candidate, &owned, &catalog) {
                    view.plan = Some(candidate);
                }
                view.reset_armed = false;
            }
            Action::Confirm => {
                // Current140105ab0 takes the pending plan before validation.
                // A rejected plan is discarded; a valid one queues persistence.
                if let Some(plan) = view.plan.take() {
                    if valid_plan(&plan, &owned, &catalog) {
                        match plan.write_rewards(&mut menu.save) {
                            Ok(()) => { menu.queue_rewards(); changed = true; },
                            Err(error) => menu.error = Some(error.to_string()),
                        }
                    }
                }
                view.reset_armed = false;
            }
            Action::Undo => {
                view.plan = Some(owned.clone());
                view.reset_armed = false;
            }
            Action::Reset if reset_available(&owned) => {
                if view.reset_armed {
                    let mut reset = owned.clone();
                    reset.perks.clear();
                    reset.resets += 1;
                    match reset.write_rewards(&mut menu.save) {
                        Ok(()) => {
                            view.plan = Some(reset);
                            menu.queue_reward_reset();
                            changed = true;
                        }
                        Err(error) => menu.error = Some(error.to_string()),
                    }
                    view.reset_armed = false;
                } else {
                    view.reset_armed = true;
                }
            }
            Action::BuyTabard(id) => {
                let mut candidate = view.plan.clone().unwrap_or_else(|| owned.clone());
                if !candidate.tabards.remove(id) {
                    candidate.tabards.insert(*id);
                }
                if valid_plan(&candidate, &owned, &catalog) {
                    view.plan = Some(candidate);
                }
            }
            Action::BuyRace(id) => {
                let mut candidate = view.plan.clone().unwrap_or_else(|| owned.clone());
                if let Some(index) = candidate.races.iter().position(|race| race == id) {
                    candidate.races.remove(index);
                } else {
                    candidate.races.push(*id);
                }
                if valid_plan(&candidate, &owned, &catalog) {
                    view.plan = Some(candidate);
                }
            }
            Action::WearTabard(id) => {
                if id.is_none_or(|id| {
                    catalog
                        .tabards
                        .iter()
                        .any(|entry| entry.id == id && entry.available(&owned))
                }) {
                    let class = menu.class_id();
                    match wear_tabard(&mut menu.save, class, *id) {
                        Ok(()) => { menu.queue_gear(class); changed = true; },
                        Err(error) => menu.error = Some(error.to_string()),
                    }
                }
            }
            Action::ShowCosmetic(slot, look) => {
                if *slot < 19 && look.is_none_or(|id| crate::armory::cosmetics::get(id).is_some_and(|entry| {
                    entry.slot == *slot && owned.earned.contains(&entry.achievement)
                })) {
                    let class = menu.class_id();
                    let mut gear = GearSave::read_for(&menu.save, class, menu.race);
                    if gear.set_look(&native, class, *slot, *look) {
                        match gear.apply(&mut menu.save) {
                            Ok(()) => { menu.queue_gear(class); changed = true; },
                            Err(error) => menu.error = Some(error.to_string()),
                        }
                    }
                }
            }
            Action::PetSlot(slot) => view.companion_slot = *slot,
            Action::Pet(slot, key) => {
                if catalog.companions.iter().any(|entry| {
                    entry.key == *key
                        && entry
                            .achievement
                            .as_ref()
                            .is_none_or(|gate| owned.earned.contains(gate))
                }) {
                    let mut candidate = owned.clone();
                    // The look card carries the slot admitted by the renderer.
                    candidate.set_pet(*slot, key);
                    match candidate.write_rewards(&mut menu.save) {
                        Ok(()) => {
                            menu.queue_pets();
                            changed = true;
                            if let Some(plan) = &mut view.plan {
                                plan.companions = candidate.companions;
                            }
                        }
                        Err(error) => menu.error = Some(error.to_string()),
                    }
                }
            }
            Action::ConfirmLeave | Action::DiscardLeave => {
                if let Some(Dialog::RewardsChanges(destination)) = menu.dialog.clone() {
                    if matches!(action, Action::ConfirmLeave) {
                        if let Some(plan) = view.plan.take() {
                            if valid_plan(&plan, &owned, &catalog) {
                                match plan.write_rewards(&mut menu.save) {
                                    Ok(()) => { menu.queue_rewards(); changed = true; },
                                    Err(error) => menu.error = Some(error.to_string()),
                                }
                            }
                        }
                    } else {
                        view.plan = Some(owned.clone());
                    }
                    // Current1401168ce continues to the requested destination
                    // after Confirm, including an absent/rejected plan.
                    let previous = menu.page;
                    menu.page = destination;
                    menu.dialog = None;
                    armory.enter_page(previous, destination, &native, menu.class_id());
                }
            }
            Action::KeepEditing => menu.dialog = None,
            _ => {}
        }
        if changed {
            // The native query continues through every admitted row. Later
            // rows see the account mutated by earlier commands in this batch.
            owned = Progress::read(&menu.save, &labels);
            view.baseline = Some(owned.clone());
        }
    }
}

fn worn_tabard(save: &Save, class: u8) -> Option<u32> {
    save.plaintext()
        .lines()
        .filter_map(|line| {
            let fields = line.split('|').collect::<Vec<_>>();
            if fields.len() != 3 || fields[0] != "look" || fields[1].parse::<u8>().ok()? != class {
                return None;
            }
            fields[2].split(',').find_map(|entry| {
                let (slot, id) = entry.split_once(':')?;
                (slot == "18").then(|| id.parse().ok()).flatten()
            })
        })
        .last()
}
fn wear_tabard(save: &mut Save, class: u8, id: Option<u32>) -> Result<(), SaveError> {
    let prefix = format!("look|{class}|");
    let plain = save.plaintext();
    let mut slots = BTreeMap::<u8, u32>::new();
    for value in plain.lines().filter_map(|line| line.strip_prefix(&prefix)) {
        slots.extend(value.split(',').filter_map(|entry| {
            let (slot, id) = entry.split_once(':')?;
            Some((slot.parse::<u8>().ok()?, id.parse::<u32>().ok()?))
        }));
    }
    let mut lines = Vec::new();
    if let Some(id) = id {
        slots.insert(18, id);
    } else {
        slots.remove(&18);
    }
    if !slots.is_empty() {
        lines.push(format!(
            "{prefix}{}",
            slots
                .iter()
                .map(|(slot, id)| format!("{slot}:{id}"))
                .collect::<Vec<_>>()
                .join(",")
        ));
    }
    save.replace_runtime_records(|line| line.starts_with(&prefix), lines);
    Ok(())
}

fn label(catalog: &MenuCatalog, template: &str, tokens: &[(&str, String)]) -> String {
    let mut text = catalog.label(template).to_owned();
    for (key, value) in tokens {
        text = text.replace(&format!("{{{key}}}"), value);
    }
    text
}
fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    color: Color,
) {
    ui.spawn((
        Text::new(value),
        TextFont {
            font: art.font.clone(),
            font_size: size,
            ..default()
        },
        TextColor(color),
        TextShadow {
            offset: Vec2::new(0., 1.5),
            color: Color::srgba(0., 0., 0., 0.85),
        },
    ));
}

/// Current14552d690 uses whole UTC days and localized month abbreviations.
fn earned_date(seconds: u64, labels: &MenuCatalog) -> String {
    let days = (seconds / 86_400).min(i64::MAX as u64 - 719_468) as i64 + 719_468;
    let era = days / 146_097;
    let day_of_era = days - era * 146_097;
    let year_of_era =
        (day_of_era - day_of_era / 1460 + day_of_era / 36524 - day_of_era / 146096) / 365;
    let mut year = year_of_era + era * 400;
    let day_of_year = day_of_era - (365 * year_of_era + year_of_era / 4 - year_of_era / 100);
    let month_part = (5 * day_of_year + 2) / 153;
    let day = day_of_year - (153 * month_part + 2) / 5 + 1;
    let month = month_part + if month_part < 10 { 3 } else { -9 };
    year += i64::from(month <= 2);
    label(
        labels,
        "{d} {month} {y}",
        &[
            ("d", day.to_string()),
            (
                "month",
                labels
                    .label(
                        [
                            "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
                            "Nov", "Dec",
                        ][(month - 1) as usize],
                    )
                    .into(),
            ),
            ("y", year.to_string()),
        ],
    )
}
fn bar_flow(ui: &mut ChildSpawnerCommands, images: &Art, height: f32, fraction: f32) {
    let fraction = fraction.clamp(0., 1.);
    ui.spawn((
        Node {
            width: Val::Percent(100.),
            height: Val::Px(height),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(height * 0.5)),
            overflow: Overflow::clip(),
            ..default()
        },
        BackgroundColor(Color::srgba(0., 0., 0., 0.7)),
        BorderColor::all(Color::srgb(0.30, 0.24, 0.13)),
    ))
    .with_children(|ui| {
        ui.spawn((
            ImageNode {
                image: images.progress_bar.clone(),
                color: if fraction >= 1. {
                    Color::srgb(0.55, 1., 0.45)
                } else {
                    Color::srgb(1., 0.78, 0.30)
                },
                ..default()
            },
            Node {
                width: Val::Percent(fraction * 100.),
                height: Val::Percent(100.),
                ..default()
            },
        ));
    });
}

fn grid() -> Node {
    Node {
        width: Val::Percent(100.),
        display: Display::Grid,
        grid_template_columns: RepeatedGridTrack::flex(2, 1.),
        column_gap: Val::Px(10.),
        row_gap: Val::Px(8.),
        ..default()
    }
}
/// Native140172650 inserts commas every three decimal digits.
fn count(value: u64) -> String {
    let digits = value.to_string();
    digits
        .chars()
        .enumerate()
        .flat_map(|(index, digit)| {
            let comma = index > 0 && (digits.len() - index).is_multiple_of(3);
            comma
                .then_some(',')
                .into_iter()
                .chain(std::iter::once(digit))
        })
        .collect()
}

fn achievement_card(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &Art,
    labels: &MenuCatalog,
    entry: &Achievement,
    account: &Progress,
    partial: Option<(u64, u64)>,
) {
    let earned = account.earned.contains(&entry.key);
    let partial = partial.filter(|(_, total)| !earned && *total >= 2);
    // Native14016f950 wrapper; Grid rows stretch naturally to the taller card.
    ui.spawn((
        Node {
            min_width: Val::Px(0.),
            min_height: Val::Px(76.),
            padding: UiRect::axes(Val::Px(10.), Val::Px(8.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(7.)),
            align_items: AlignItems::Center,
            column_gap: Val::Px(12.),
            ..default()
        },
        BackgroundColor(if earned {
            Color::srgba(0.12, 0.08, 0.03, 0.92)
        } else {
            Color::srgba(0.03, 0.03, 0.035, 0.75)
        }),
        BorderColor::all(if earned {
            Color::srgb(0.78, 0.60, 0.25)
        } else {
            Color::srgb(0.169, 0.129, 0.071)
        }),
    ))
    .with_children(|ui| {
        if earned {
            let cover = || Node {
                position_type: PositionType::Absolute,
                left: Val::Px(0.),
                right: Val::Px(0.),
                top: Val::Px(0.),
                bottom: Val::Px(0.),
                ..default()
            };
            ui.spawn((
                ImageNode {
                    image: images.earned_card.clone(),
                    color: Color::srgba(1., 0.85, 0.60, 0.13),
                    ..default()
                },
                cover(),
            ));
            ui.spawn((
                cover(),
                BackgroundGradient::from(LinearGradient {
                    angle: std::f32::consts::FRAC_PI_2,
                    stops: vec![
                        Color::linear_rgba(1., 0.80, 0.35, 0.10).into(),
                        Color::linear_rgba(0., 0., 0., 0.).into(),
                    ],
                    ..default()
                }),
            ));
        }
        // Native14016e440: 50px framed achievement icon, independent of perk icons.
        if let Some(image) = images.icons.get(&entry.icon) {
            ui.spawn((
                ImageNode {
                    image: image.clone(),
                    color: if earned {
                        Color::linear_rgba(1., 1., 1., 1.)
                    } else {
                        Color::srgb(0.42, 0.40, 0.38)
                    },
                    ..default()
                },
                Node {
                    width: Val::Px(50.),
                    height: Val::Px(50.),
                    flex_shrink: 0.,
                    border: UiRect::all(Val::Px(2.)),
                    border_radius: BorderRadius::all(Val::Px(6.)),
                    ..default()
                },
                BackgroundColor(Color::linear_rgba(0., 0., 0., 1.)),
                BorderColor::all(if earned {
                    GOLD
                } else {
                    Color::srgb(0.169, 0.129, 0.071)
                }),
                BoxShadow::new(
                    if earned {
                        Color::linear_rgba(0.973, 0.824, 0.416, 0.5)
                    } else {
                        Color::linear_rgba(0., 0., 0., 0.85)
                    },
                    Val::Px(0.),
                    Val::Px(if earned { 0. } else { 2. }),
                    Val::Px(if earned { 1. } else { 0. }),
                    Val::Px(if earned { 10. } else { 4. }),
                ),
            ));
        }
        ui.spawn(Node {
            flex_direction: FlexDirection::Column,
            row_gap: Val::Px(3.),
            flex_grow: 1.,
            flex_basis: Val::Px(0.),
            min_width: Val::Px(0.),
            ..default()
        })
        .with_children(|body| {
            text(
                body,
                art,
                entry.label(labels, &entry.name),
                16.,
                if earned {
                    PAPER
                } else {
                    Color::srgb(0.55, 0.52, 0.46)
                },
            );
            text(
                body,
                art,
                entry.label(labels, &entry.description),
                12.,
                if earned {
                    Color::srgb(0.949, 0.902, 0.788)
                } else {
                    MUTED
                },
            );
            if let Some((have, total)) = partial {
                body.spawn(Node {
                    width: Val::Percent(100.),
                    align_items: AlignItems::Center,
                    column_gap: Val::Px(8.),
                    margin: UiRect::top(Val::Px(2.)),
                    ..default()
                })
                .with_children(|row| {
                    row.spawn(Node {
                        flex_grow: 1.,
                        min_width: Val::Px(0.),
                        ..default()
                    })
                    .with_children(|ui| bar_flow(ui, images, 9., have as f32 / total as f32));
                    text(
                        row,
                        art,
                        format!("{} / {}", count(have), count(total)),
                        11.,
                        MUTED,
                    );
                });
            }
            for unlock in &entry.unlocks {
                body.spawn(Node {
                    align_items: AlignItems::Center,
                    column_gap: Val::Px(6.),
                    margin: UiRect::top(Val::Px(1.)),
                    ..default()
                })
                .with_children(|row| {
                    if let Some(image) = images.icons.get(&unlock.icon) {
                        row.spawn((
                            ImageNode {
                                image: image.clone(),
                                color: if earned {
                                    Color::WHITE
                                } else {
                                    Color::srgb(0.45, 0.45, 0.45)
                                },
                                ..default()
                            },
                            Node {
                                width: Val::Px(16.),
                                height: Val::Px(16.),
                                flex_shrink: 0.,
                                border: UiRect::all(Val::Px(1.)),
                                border_radius: BorderRadius::all(Val::Px(2.)),
                                ..default()
                            },
                            BorderColor::all(Color::linear_rgba(0., 0., 0., 1.)),
                        ));
                    }
                    text(
                        row,
                        art,
                        format!(
                            "{}: {}",
                            labels.label(&unlock.prefix),
                            unlock.label(labels)
                        ),
                        12.,
                        if earned {
                            Color::srgb(0.55, 0.78, 0.60)
                        } else {
                            Color::srgb(0.30, 0.44, 0.34)
                        },
                    );
                });
            }
        });
        ui.spawn(Node {
            width: Val::Px(74.),
            flex_shrink: 0.,
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::Center,
            row_gap: Val::Px(4.),
            ..default()
        })
        .with_children(|badge| {
            badge
                .spawn((
                    Node {
                        width: Val::Px(44.),
                        height: Val::Px(44.),
                        border: UiRect::all(Val::Px(2.)),
                        border_radius: BorderRadius::MAX,
                        justify_content: JustifyContent::Center,
                        align_items: AlignItems::Center,
                        ..default()
                    },
                    BackgroundGradient::from(RadialGradient {
                        position: UiPosition::CENTER.at(Val::Percent(-15.), Val::Percent(-20.)),
                        shape: RadialGradientShape::FarthestCorner,
                        stops: vec![
                            ColorStop::new(
                                if earned {
                                    Color::linear_rgba(0.95, 0.75, 0.32, 1.)
                                } else {
                                    Color::linear_rgba(0.14, 0.13, 0.12, 1.)
                                },
                                Val::Percent(0.),
                            ),
                            ColorStop::new(
                                if earned {
                                    Color::linear_rgba(0.48, 0.30, 0.07, 1.)
                                } else {
                                    Color::linear_rgba(0.05, 0.05, 0.05, 1.)
                                },
                                Val::Percent(70.),
                            ),
                        ],
                        ..default()
                    }),
                    BorderColor::all(if earned {
                        GOLD
                    } else {
                        Color::srgb(0.169, 0.129, 0.071)
                    }),
                ))
                .with_children(|ui| {
                    text(
                        ui,
                        art,
                        entry.points.to_string(),
                        16.,
                        if earned {
                            Color::WHITE
                        } else {
                            Color::srgb(0.55, 0.52, 0.46)
                        },
                    );
                    if earned {
                        ui.spawn((
                            ImageNode::new(images.glow_star.clone()),
                            menu::rect([-1., -2., 14., 14.]),
                        ));
                    }
                });
            if earned {
                text(
                    badge,
                    art,
                    account
                        .dates
                        .get(&entry.key)
                        .map(|value| earned_date(*value, labels))
                        .unwrap_or_else(|| labels.label("Earned").into()),
                    10.,
                    MUTED,
                );
            }
        });
    });
}

// Native 1401c13a0: 11px label followed by the shared fading rule.
fn small_heading(ui: &mut ChildSpawnerCommands, art: &MenuArt, value: &str) {
    ui.spawn(Node {
        column_gap: Val::Px(8.),
        align_items: AlignItems::Center,
        margin: UiRect::top(Val::Px(4.)),
        ..default()
    })
    .with_children(|row| {
        text(row, art, value, 11., Color::srgb(0.69, 0.541, 0.227));
        crate::codex::native_rule(
            row,
            Node {
                flex_grow: 1.,
                ..default()
            },
            [0.69, 0.541, 0.227, 0.5],
        );
    });
}

fn draw_achievements(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &Art,
    labels: &MenuCatalog,
    catalog: &Catalog,
    account: &Progress,
    save: &Save,
    view: &ProgressionState,
    gear: &GearSave,
    armory: &ArmoryCatalog,
) {
    let earned = catalog
        .achievements
        .iter()
        .filter(|entry| account.earned.contains(&entry.key))
        .count();
    let points = account.earned_points(catalog);
    // Current sidebar/medallion consumers take totals from the live catalog.
    // The 0.92 constants (66 / 1365) no longer describe that catalog.
    let total_points: u32 = catalog.achievements.iter().map(|entry| entry.points).sum();
    let total_achievements = catalog.achievements.len();
    let counts = (0..CATEGORIES.len())
        .map(|category| {
            let rows = catalog
                .achievements
                .iter()
                .filter(|entry| entry.category == category)
                .collect::<Vec<_>>();
            let have = rows
                .iter()
                .filter(|entry| account.earned.contains(&entry.key))
                .count();
            let pts: u32 = rows
                .iter()
                .filter(|entry| account.earned.contains(&entry.key))
                .map(|entry| entry.points)
                .sum();
            (
                have,
                rows.len(),
                pts,
                rows.iter().map(|entry| entry.points).sum::<u32>(),
            )
        })
        .collect::<Vec<_>>();
    menu::native_panel(ui, Node {
        width: Val::Px(300.), flex_shrink: 0., min_height: Val::Px(0.),
        flex_direction: FlexDirection::Column,
        padding: UiRect::axes(Val::Px(16.), Val::Px(12.)),
        row_gap: Val::Px(8.), ..default()
    }, |left| achievements_sidebar::draw(left, art, images, labels, points, total_points,
        earned, total_achievements, &counts, view.category));
    menu::native_panel(
        ui,
        Node {
            flex_direction: FlexDirection::Column,
            row_gap: Val::Px(10.),
            padding: UiRect::axes(Val::Px(18.), Val::Px(12.)),
            min_height: Val::Px(0.),
            overflow: Overflow::clip(),
            flex_grow: 1.,
            flex_basis: Val::Px(0.),
            ..default()
        },
        |right| {
            crate::codex::section_heading(
                right,
                art,
                labels.label(
                    view.category
                        .map(|category| CATEGORIES[category])
                        .unwrap_or("Summary"),
                ),
            );
            if let Some(category) = view.category {
                let (have, all, points, total) = counts[category];
                // Native1401c2810: summary text followed by a flexible eight-pixel bar.
                right
                    .spawn(Node {
                        column_gap: Val::Px(16.),
                        align_items: AlignItems::Center,
                        ..default()
                    })
                    .with_children(|row| {
                        text(
                            row,
                            art,
                            label(
                                labels,
                                "{have} of {all} earned  ·  {pts} of {pall} points",
                                &[
                                    ("have", have.to_string()),
                                    ("all", all.to_string()),
                                    ("pts", points.to_string()),
                                    ("pall", total.to_string()),
                                ],
                            ),
                            13.,
                            MUTED,
                        );
                        row.spawn(Node {
                            flex_grow: 1.,
                            flex_direction: FlexDirection::Column,
                            ..default()
                        })
                        .with_children(|ui| bar_flow(ui, images, 8., have as f32 / all as f32));
                    });
                right
                    .spawn(Node {
                        flex_grow: 1.,
                        min_height: Val::Px(0.),
                        column_gap: Val::Px(4.),
                        ..default()
                    })
                    .with_children(|body| {
                        let target = body
                            .spawn((
                                Node {
                                    flex_grow: 1.,
                                    min_height: Val::Px(0.),
                                    flex_direction: FlexDirection::Column,
                                    overflow: Overflow::scroll_y(),
                                    ..default()
                                },
                                Viewport,
                                ScrollPosition(Vec2::new(0., view.scroll)),
                            ))
                            .with_children(|ui| {
                                ui.spawn(Node {
                                    padding: UiRect::right(Val::Px(6.)),
                                    ..grid()
                                })
                                .with_children(|ui| {
                                    for entry in catalog
                                        .achievements
                                        .iter()
                                        .filter(|entry| entry.category == category)
                                    {
                                        achievement_card(
                                            ui,
                                            art,
                                            images,
                                            labels,
                                            entry,
                                            account,
                                            progress(entry, account, save, gear, armory),
                                        );
                                    }
                                });
                            })
                            .id();
                        crate::scrollbar::spawn(
                            body,
                            target,
                            1.,
                            crate::scrollbar::InputScope::Armory,
                        );
                    });
                right.spawn((
                    Node {
                        position_type: PositionType::Absolute,
                        left: Val::Px(1.),
                        right: Val::Px(1.),
                        bottom: Val::Px(1.),
                        height: Val::Px(34.),
                        border_radius: BorderRadius {
                            top_left: Val::Px(0.),
                            top_right: Val::Px(0.),
                            bottom_left: Val::Px(10.),
                            bottom_right: Val::Px(10.),
                        },
                        ..default()
                    },
                    BackgroundGradient::from(LinearGradient {
                        angle: std::f32::consts::PI,
                        stops: vec![
                            Color::linear_rgba(0., 0., 0., 0.).into(),
                            Color::linear_rgba(0.031, 0.024, 0.016, 0.95).into(),
                        ],
                        ..default()
                    }),
                    bevy::ui::FocusPolicy::Pass,
                ));
            } else {
                small_heading(right, art, labels.label("RECENTLY EARNED"));
                let mut recent = catalog
                    .achievements
                    .iter()
                    .filter(|entry| account.earned.contains(&entry.key))
                    .collect::<Vec<_>>();
                recent.sort_by_key(|entry| {
                    std::cmp::Reverse((
                        account.dates.get(&entry.key).copied().unwrap_or(0),
                        entry.points,
                    ))
                });
                if recent.is_empty() {
                    text(right, art, labels.label("Nothing yet. Win a zone, collect gear or survive long into a run: every hero counts."), 14., PAPER);
                } else {
                    right.spawn(grid()).with_children(|ui| {
                        for entry in recent.iter().take(4) {
                            achievement_card(ui, art, images, labels, entry, account, None);
                        }
                    });
                }
                small_heading(right, art, labels.label("PROGRESS"));
                right
                    .spawn(Node {
                        column_gap: Val::Px(18.),
                        row_gap: Val::Px(10.),
                        ..grid()
                    })
                    .with_children(|ui| {
                        for (category, (have, all, pts, total)) in counts.iter().enumerate() {
                            ui.spawn((
                                Interaction::None,
                                Action::Category(Some(category)),
                                Node {
                                    align_items: AlignItems::Center,
                                    column_gap: Val::Px(10.),
                                    ..default()
                                },
                            ))
                            .with_children(|row| {
                                if let Some(image) = images.icons.get(CATEGORY_ICONS[category]) {
                                    row.spawn((
                                        ImageNode::new(image.clone()),
                                        Node {
                                            width: Val::Px(32.),
                                            height: Val::Px(32.),
                                            flex_shrink: 0.,
                                            border: UiRect::all(Val::Px(1.)),
                                            border_radius: BorderRadius::all(Val::Px(4.)),
                                            ..default()
                                        },
                                        BorderColor::all(EDGE),
                                    ));
                                }
                                row.spawn(Node {
                                    flex_grow: 1.,
                                    min_width: Val::Px(0.),
                                    flex_direction: FlexDirection::Column,
                                    row_gap: Val::Px(4.),
                                    ..default()
                                })
                                .with_children(|column| {
                                    column
                                        .spawn(Node {
                                            width: Val::Percent(100.),
                                            justify_content: JustifyContent::SpaceBetween,
                                            ..default()
                                        })
                                        .with_children(|row| {
                                            text(
                                                row,
                                                art,
                                                labels.label(CATEGORIES[category]),
                                                15.,
                                                GOLD,
                                            );
                                            text(
                                                row,
                                                art,
                                                label(
                                                    labels,
                                                    "{have} / {all}  ·  {pts} of {pall} points",
                                                    &[
                                                        ("have", have.to_string()),
                                                        ("all", all.to_string()),
                                                        ("pts", pts.to_string()),
                                                        ("pall", total.to_string()),
                                                    ],
                                                ),
                                                12.,
                                                MUTED,
                                            );
                                        });
                                    bar_flow(column, images, 12., *have as f32 / *all as f32);
                                });
                            });
                        }
                    });
                let mut partial = catalog
                    .achievements
                    .iter()
                    .filter(|entry| !account.earned.contains(&entry.key))
                    .filter_map(|entry| {
                        progress(entry, account, save, gear, armory)
                            .filter(|(have, total)| *have > 0 && *total >= 2)
                            .map(|value| (entry, value))
                    })
                    .collect::<Vec<_>>();
                partial.sort_by(|(_, (a, total_a)), (_, (b, total_b))| {
                    (*b as f32 / *total_b as f32).total_cmp(&(*a as f32 / *total_a as f32))
                });
                if !partial.is_empty() {
                    small_heading(right, art, labels.label("ALMOST THERE"));
                    right.spawn(grid()).with_children(|ui| {
                        for (entry, value) in partial.iter().take(4) {
                            achievement_card(ui, art, images, labels, entry, account, Some(*value));
                        }
                    });
                }
            }
        },
    );
}

fn achievement_name(catalog: &Catalog, labels: &MenuCatalog, key: &str) -> String {
    catalog
        .achievement(key)
        .map(|entry| entry.label(labels, &entry.name))
        .unwrap_or_else(|| key.into())
}
fn perk_card(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &Art,
    labels: &MenuCatalog,
    catalog: &Catalog,
    perk: &Perk,
    owned: &Progress,
    plan: &Progress,
) {
    let rank = usize::from(plan.rank(&perk.key)).min(perk.costs.len());
    let unlocked = owned.rank(&perk.key) > 0 || owned.earned.contains(&perk.achievement);
    let has_prerequisite = perk
        .prerequisite
        .as_ref()
        .is_none_or(|key| plan.rank(key) > 0);
    let mut increased = plan.clone();
    increased.perks.insert(perk.key.clone(), rank as u8 + 1);
    let mut decreased = plan.clone();
    decreased
        .perks
        .insert(perk.key.clone(), rank.saturating_sub(1) as u8);
    let can_increase = rank < perk.costs.len() && valid_plan(&increased, owned, catalog);
    let can_decrease =
        rank > usize::from(owned.rank(&perk.key)) && valid_plan(&decreased, owned, catalog);
    // Native 140188ab0 wrapper and 1402220b0 children use intrinsic text layout.
    ui.spawn((
        Node {
            flex_grow: 1.,
            flex_basis: Val::Px(0.),
            min_width: Val::Px(0.),
            min_height: Val::Px(70.),
            padding: UiRect::axes(Val::Px(10.), Val::Px(7.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(6.)),
            align_items: AlignItems::Center,
            column_gap: Val::Px(12.),
            ..default()
        },
        BackgroundColor(if rank > 0 {
            Color::srgba(0.22, 0.15, 0.05, 0.55)
        } else {
            Color::srgba(0., 0., 0., 0.45)
        }),
        BorderColor::all(if rank > 0 {
            Color::srgb(0.427, 0.333, 0.145)
        } else {
            Color::srgb(0.169, 0.129, 0.071)
        }),
    ))
    .with_children(|ui| {
        if let Some(handle) = images.icons.get(&perk.icon) {
            ui.spawn((
                ImageNode {
                    image: handle.clone(),
                    color: if unlocked {
                        Color::linear_rgba(1., 1., 1., 1.)
                    } else {
                        Color::srgb(0.30, 0.28, 0.26)
                    },
                    ..default()
                },
                Node {
                    width: Val::Px(44.),
                    height: Val::Px(44.),
                    flex_shrink: 0.,
                    border: UiRect::all(Val::Px(2.)),
                    border_radius: BorderRadius::all(Val::Px(5.)),
                    ..default()
                },
                BackgroundColor(Color::linear_rgba(0., 0., 0., 1.)),
                BorderColor::all(if unlocked {
                    Color::srgb(0.69, 0.541, 0.227)
                } else {
                    Color::srgb(0.169, 0.129, 0.071)
                }),
            ));
        }
        ui.spawn(Node {
            flex_direction: FlexDirection::Column,
            row_gap: Val::Px(3.),
            flex_grow: 1.,
            min_width: Val::Px(0.),
            flex_basis: Val::Px(0.),
            ..default()
        })
        .with_children(|body| {
            body.spawn(Node {
                align_items: AlignItems::Center,
                column_gap: Val::Px(10.),
                ..default()
            })
            .with_children(|row| {
                text(
                    row,
                    art,
                    labels.label(&perk.name),
                    16.,
                    if unlocked { PAPER } else { MUTED },
                );
                for index in 0..perk.costs.len() {
                    row.spawn((
                        Node {
                            width: Val::Px(10.),
                            height: Val::Px(10.),
                            border: UiRect::all(Val::Px(1.)),
                            border_radius: BorderRadius::MAX,
                            flex_shrink: 0.,
                            ..default()
                        },
                        BackgroundColor(if index < usize::from(owned.rank(&perk.key)) {
                            GOLD
                        } else if index < rank {
                            Color::srgb(0.302, 1., 0.416)
                        } else {
                            Color::srgb(0.169, 0.129, 0.071)
                        }),
                        BorderColor::all(EDGE),
                    ));
                }
            });
            if !unlocked {
                text(
                    body,
                    art,
                    label(
                        labels,
                        "Earn the achievement {name} to unlock.",
                        &[("name", achievement_name(catalog, labels, &perk.achievement))],
                    ),
                    12.,
                    RED,
                );
            } else if !has_prerequisite {
                if let Some(parent) = perk.prerequisite.as_ref().and_then(|key| catalog.perk(key)) {
                    text(
                        body,
                        art,
                        label(
                            labels,
                            "Needs {name}.",
                            &[("name", labels.label(&parent.name).into())],
                        ),
                        12.,
                        RED,
                    );
                }
            }
            let current = rank.saturating_sub(1);
            text(
                body,
                art,
                labels.label(&perk.descriptions[current]),
                12.,
                if unlocked { PAPER } else { MUTED },
            );
            if rank > 0 && rank < perk.descriptions.len() {
                text(
                    body,
                    art,
                    label(
                        labels,
                        "Next rank: {next}",
                        &[("next", labels.label(&perk.descriptions[rank]).into())],
                    ),
                    12.,
                    MUTED,
                );
            }
        });
        ui.spawn(Node {
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::FlexEnd,
            row_gap: Val::Px(4.),
            flex_shrink: 0.,
            ..default()
        })
        .with_children(|controls| {
            text(
                controls,
                art,
                if rank == perk.costs.len() {
                    labels.label("Max rank").into()
                } else {
                    label(labels, "{c} points", &[("c", perk.costs[rank].to_string())])
                },
                12.,
                MUTED,
            );
            controls
                .spawn(Node {
                    column_gap: Val::Px(6.),
                    ..default()
                })
                .with_children(|row| {
                    for (value, delta, enabled) in [("-", -1, can_decrease), ("+", 1, can_increase)]
                    {
                        let mut button = row.spawn((
                            Button,
                            Face {
                                selected: false,
                                primary: false,
                                disabled: !enabled,
                            },
                            Node {
                                width: Val::Px(28.),
                                height: Val::Px(28.),
                                justify_content: JustifyContent::Center,
                                align_items: AlignItems::Center,
                                border: UiRect::all(Val::Px(1.)),
                                border_radius: BorderRadius::all(Val::Px(3.)),
                                ..default()
                            },
                            BackgroundColor(if enabled {
                                Color::srgb(0.15, 0.105, 0.035)
                            } else {
                                DARK
                            }),
                            BorderColor::all(if enabled {
                                EDGE
                            } else {
                                Color::srgb(0.169, 0.129, 0.071)
                            }),
                        ));
                        if enabled {
                            button.insert((
                                Action::Rank(perk.key.clone(), delta),
                                crate::hover::NativeHover::new(EDGE, PAPER, 0.4),
                                UiTransform::default(),
                            ));
                        }
                        button.with_children(|ui| {
                            text(
                                ui,
                                art,
                                value,
                                17.,
                                if enabled {
                                    PAPER
                                } else {
                                    Color::srgba(0.725, 0.663, 0.510, 0.35)
                                },
                            )
                        });
                    }
                });
        });
    });
}

fn rebuild(
    mut commands: Commands,
    roots: Query<Entity, With<Root>>,
    menu: Res<MenuState>,
    labels: Res<MenuCatalog>,
    art: Res<MenuArt>,
    images: Res<Art>,
    catalog: Res<Catalog>,
    mut view: ResMut<ProgressionState>,
    armory: Res<ArmoryCatalog>,
) {
    let signature = format!(
        "{:?}:{}:{}:{:?}:{}:{:?}:{:?}:{}:{}:{}:{:?}",
        menu.page,
        menu.class_id(),
        menu.save.plaintext(),
        view.category,
        view.rewards_tab,
        view.companion_tab,
        view.plan,
        view.reset_armed,
        view.companion_slot,
        labels.is_changed(),
        menu.dialog,
    );
    if signature == view.signature {
        return;
    }
    view.signature = signature;
    for root in &roots {
        commands.entity(root).despawn();
    }
    if !matches!(menu.page, Page::Achievements | Page::Rewards) {
        view.previous_page = None;
        return;
    }
    let account = Progress::read(&menu.save, &labels);
    let gear = GearSave::read(&menu.save);
    commands
        .spawn((
            Root,
            NativeCanvas::main_menu(),
            Node {
                position_type: PositionType::Absolute,
                width: Val::Px(1600.),
                height: Val::Px(900.),
                ..default()
            },
            GlobalZIndex(5401),
        ))
        .with_children(|ui| {
            if menu.page == Page::Achievements {
                ui.spawn(crate::armory::shell_node()).with_children(|shell| {
                    crate::armory::build_header_row(shell, &art, &labels, &menu);
                    shell.spawn(crate::armory::body_node()).with_children(|body| {
                        draw_achievements(
                            body, &art, &images, &labels, &catalog, &account, &menu.save, &view,
                            &gear, &armory,
                        );
                    });
                });
            } else {
                rewards::draw(ui, &art, &images, &labels, &catalog, &account, &menu, &view);
            }
        });
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn runtime_mutations_retain_zero_rank_until_the_actual_loader_runs() {
        let mut save = Save::parse("items|101000\ntalent|1|80|\npets|rabbit\nstat|kills=77\n").unwrap();
        assert!(apply_reward_command(&mut save,RewardPlan {
            perks:[("rerolls".into(),0)].into(),tabards:Default::default(),races:Vec::new(),
        }).unwrap());
        // Both optimistic reward edits and the separate backend commands must
        // leave the purchased vector nonempty until Reset or a true file load.
        Progress::read_with_menu(&save,None).write_rewards(&mut save).unwrap();
        assert_eq!(saved_pets(&save),["rabbit"]);
        wear_tabard(&mut save,1,Some(90011)).unwrap();
        GearSave::read(&save).apply(&mut save).unwrap();
        crate::armory::apply_gear_command(&mut save,1,crate::save::gear::ClassGear {
            class_id:1,equip:Default::default(),look:Default::default(),
        }).unwrap();
        apply_pet_command(&mut save,vec!["unknown".into()]).unwrap();
        save.set_talent_allocation(1,80,&[("imp_heroic".into(),1)]).unwrap();
        save.select_talent_spec(1,1).unwrap();
        let hero = crate::save::Hero {class:1,race:1,sex:0,features:[0;5]};
        save.set_hero(&hero).unwrap();
        save.set_pick(&crate::save::Pick {hero,name:"Arthas".into(),zone:"elwynn".into(),heroic_rank:0,mods:Default::default()}).unwrap();
        save.add_equipment(&[101050]);
        save.record_seen(&[("jewelry.a".into(),2)]);
        assert_eq!(RewardPlan::read(&save).perks,BTreeMap::from([("rerolls".into(),0)]));
        assert!(save.plaintext().contains("perk|rerolls:0\n"));
        let owned = Progress::read_with_menu(&save,None);
        assert!(reset_available(&owned));
        assert_eq!(save.statistics()["kills"],77);
        let mut reloaded = Save::parse(&save.plaintext()).unwrap();
        assert!(RewardPlan::read(&reloaded).perks.is_empty());
        assert!(!apply_reward_reset(&mut reloaded).unwrap());
        assert!(apply_reward_reset(&mut save).unwrap());
        assert!(RewardPlan::read(&save).perks.is_empty());
        assert_eq!(Progress::read_with_menu(&save,None).resets,1);
        assert_eq!(saved_pets(&save),["squirrel"]);
    }

    #[test]
    fn recovered_catalog_totals() {
        let catalog = Catalog::embedded();
        assert_eq!(catalog.achievements.len(), 98);
        assert_eq!(
            catalog
                .achievements
                .iter()
                .map(|entry| entry.points)
                .sum::<u32>(),
            2270
        );
        assert_eq!(catalog.perks.len(), 13);
        assert_eq!(catalog.tabards.len(), 21);
        assert_eq!(catalog.companions.len(), 26);
    }

    #[test]
    fn companion_selection_matches_current_native_slots_and_round_trips() {
        #[derive(Deserialize)]
        struct Case {
            before: Vec<String>,
            slot: usize,
            selected: String,
            after: Vec<String>,
        }
        #[derive(Deserialize)]
        struct Fixtures {
            companion_selection: Vec<Case>,
        }
        let fixtures: Fixtures = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.105.0/rewards-menu/input-vectors.json"
        ))
        .unwrap();
        for case in fixtures.companion_selection {
            let mut account = Progress {
                companions: case.before,
                ..default()
            };
            account.set_pet(case.slot, &case.selected);
            assert_eq!(account.companions, case.after);
            let mut save = Save::default();
            account.write_rewards(&mut save).unwrap();
            assert_eq!(Progress::read_with_menu(&save, None).companions, case.after);
        }
    }

    #[test]
    fn rewards_navigation_keeps_the_allocation_until_the_dialog_is_resolved() {
        let mut menu = MenuState::from_save_path(None);
        menu.page = Page::Rewards;
        let saved = menu.save.plaintext();
        let owned = Progress::read_with_menu(&menu.save, None);
        let mut plan = owned.clone();
        plan.perks.insert("rerolls".into(), 1);
        let mut view = ProgressionState {
            plan: Some(plan.clone()),
            ..default()
        };
        for destination in [
            Page::Picker,
            Page::Character,
            Page::Achievements,
            Page::Talents,
        ] {
            view.request_page(&mut menu, destination);
            assert_eq!(menu.page, Page::Rewards);
            assert!(
                matches!(menu.dialog, Some(Dialog::RewardsChanges(page)) if page == destination)
            );
            assert_eq!(view.plan.as_ref(), Some(&plan));
            assert_eq!(menu.save.plaintext(), saved);
        }
        view.request_page(&mut menu, Page::Rewards);
        assert!(menu.dialog.is_none());
        view.plan = Some(owned.clone());
        view.plan.as_mut().unwrap().set_pet(0, "rabbit");
        view.request_page(&mut menu, Page::Character);
        assert_eq!(menu.page, Page::Character);
        assert!(menu.dialog.is_none());
        menu.page = Page::Rewards;
        view.plan = Some(owned);
        view.plan.as_mut().unwrap().tabards.insert(90011);
        view.request_page(&mut menu, Page::Picker);
        assert!(matches!(
            menu.dialog,
            Some(Dialog::RewardsChanges(Page::Picker))
        ));
    }
    #[test]
    fn plan_needs_achievement_points_and_prerequisites() {
        let catalog = Catalog::embedded();
        let mut owned = Progress::default();
        let mut plan = owned.clone();
        plan.perks.insert("rerolls".into(), 1);
        assert!(!valid_plan(&plan, &owned, &catalog));
        owned
            .earned
            .extend(catalog.achievements.iter().map(|entry| entry.key.clone()));
        plan = owned.clone();
        plan.perks.insert("leash".into(), 0);
        assert!(!valid_plan(&plan, &owned, &catalog));
        plan.perks.insert("leash".into(), 1);
        assert!(!valid_plan(&plan, &owned, &catalog));
        plan.perks.insert("companion".into(), 1);
        assert!(valid_plan(&plan, &owned, &catalog));
        plan.perks.insert("instinct_gold".into(), 1);
        plan.perks.insert("instinct_wisps".into(), 1);
        assert!(!valid_plan(&plan, &owned, &catalog));
        plan.perks.insert("second".into(), 1);
        assert!(valid_plan(&plan, &owned, &catalog));
    }
    #[test]
    fn free_tabards_use_full_native_achievement_key() {
        let catalog = Catalog::embedded();
        let mut account = Progress::default();
        for tabard in catalog.tabards.iter().filter(|entry| entry.zone.is_some()) {
            assert!(!tabard.available(&account));
            account.tabards.insert(tabard.id);
            assert!(!tabard.available(&account), "legacy purchase needs its current feat");
            let gate = tabard.zone.as_ref().unwrap();
            assert!(catalog.achievement(gate).is_some());
            account.earned.insert(gate.clone());
            assert!(tabard.available(&account));
            account.earned.clear();
            assert!(!tabard.available(&account));
        }
    }
    #[test]
    fn account_write_preserves_progress_and_other_looks() {
        let labels = MenuCatalog::embedded();
        let mut save = Save::parse("ach|zone:elwynn,count:runs10\nstat|kills=123,gold=5000\nunknown|retained\nlook|1|2:101100\n").unwrap();
        let mut account = Progress::read(&save, &labels);
        account.perks.insert("rerolls".into(), 1);
        account.resets = 1;
        account.write_rewards(&mut save).unwrap();
        wear_tabard(&mut save, 1, Some(90011)).unwrap();
        assert_eq!(worn_tabard(&save, 1), Some(90011));
        assert!(save.plaintext().contains("look|1|2:101100,18:90011"));
        assert!(!save.plaintext().contains("unknown|retained"));
        assert_eq!(Progress::read(&save, &labels).stats["kills"], 123);
        assert_eq!(Progress::read(&save, &labels).rank("rerolls"), 1);
    }
}

#[cfg(test)]
mod current_grant_tests {
    use super::*;
    #[test]
    fn grants_and_dates_match_complete_native_account_cases() {
        let fixtures:serde_json::Value=serde_json::from_str(include_str!("../../../docs/analysis/evidence/0.112.0/achievement-grants/native-account-vectors.json")).unwrap();
        let menu = MenuCatalog::default();
        for state in fixtures["states"].as_array().unwrap() {
            let input = &state["input"];
            let mut lines = Vec::new();
            if let Some(rows) = input["beaten"].as_array() {
                for row in rows {
                    lines.push(format!(
                        "beat|{}|{}",
                        row[0],
                        menu.zones[row[1].as_u64().unwrap() as usize].key
                    ));
                }
            }
            // Multiple native beat pairs for one class are serialized in one row.
            let mut beaten: BTreeMap<u8, Vec<String>> = BTreeMap::new();
            for line in lines.drain(..) {
                let fields: Vec<_> = line.split('|').collect();
                beaten
                    .entry(fields[1].parse().unwrap())
                    .or_default()
                    .push(fields[2].to_owned());
            }
            lines.extend(
                beaten
                    .into_iter()
                    .map(|(class, keys)| format!("beat|{class}|{}", keys.join(","))),
            );
            if let Some(rows) = input["open"].as_array() {
                for row in rows {
                    lines.push(format!(
                        "open|{}|{}",
                        row[0],
                        menu.zones[row[1].as_u64().unwrap() as usize - 1].key
                    ));
                }
            }
            if let Some(xp) = input["talent_xp"].as_object() {
                for (class, xp) in xp {
                    lines.push(format!("talent|{class}|{xp}|"));
                }
            }
            if let Some(items) = input["gear"].as_array() {
                lines.push(format!(
                    "items|{}",
                    items
                        .iter()
                        .map(ToString::to_string)
                        .collect::<Vec<_>>()
                        .join(",")
                ));
            }
            if let Some(seen) = input["seen"].as_u64() {
                lines.push(format!(
                    "seen|{}",
                    (0..seen)
                        .map(|i| format!("jewelry.fixture{i}=0"))
                        .collect::<Vec<_>>()
                        .join(",")
                ));
            }
            if let Some(stats) = input["statistics"].as_array() {
                lines.push(format!(
                    "stat|{}",
                    [
                        "kills",
                        "gold",
                        "guardians",
                        "bosses",
                        "runs",
                        "wins",
                        "caches"
                    ]
                    .iter()
                    .zip(stats)
                    .map(|(key, value)| format!("{key}={value}"))
                    .collect::<Vec<_>>()
                    .join(",")
                ));
            }
            if let Some(heroes) = input["characters"].as_array() {
                for (index, row) in heroes.iter().enumerate() {
                    lines.push(format!(
                        "{}|Hero|1|1|0|0,0,0,0,0|1|0|{}|{}",
                        index + 1,
                        row[0],
                        row[1]
                    ));
                }
            }
            let mut save = Save::parse(&lines.join("\n")).unwrap();
            let granted = grant_account(&mut save, Some(1_700_000_000));
            let expected: Vec<String> =
                serde_json::from_value(state["new_in_catalog_order"].clone()).unwrap();
            assert_eq!(granted, expected, "{}", input["name"]);
            let dates: BTreeMap<String, u64> =
                serde_json::from_value(state["dates"].clone()).unwrap();
            assert_eq!(save.achievement_dates(), dates, "{}", input["name"]);
            assert!(grant_account(&mut save, Some(1_800_000_000)).is_empty());
            assert_eq!(save.achievement_dates(), dates);
        }
    }
}

#[cfg(test)]
mod current_date_tests {
    use super::*;
    #[test]
    fn dates_match_native_whole_utc_day_calendar_cases() {
        let fixtures: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.100.1/account-progression/native-date-fixtures.json"
        ))
        .unwrap();
        let catalog = MenuCatalog::default();
        for row in fixtures["cases"].as_array().unwrap() {
            assert_eq!(
                earned_date(row["seconds"].as_u64().unwrap(), &catalog),
                row["formatted"].as_str().unwrap()
            );
        }
    }
}

/// Current14544f390 emits the system line and a separate structured UI event.
#[derive(Clone, Debug)]
pub(crate) struct AchievementNotification {
    pub key: String,
    pub name: String,
    pub text: String,
    pub icon: String,
    pub points: u32,
    pub system_line: String,
}
pub(crate) fn achievement_notification(
    key: &str,
    labels: &MenuCatalog,
) -> Option<AchievementNotification> {
    static CATALOG: std::sync::OnceLock<Catalog> = std::sync::OnceLock::new();
    let entry = CATALOG.get_or_init(Catalog::embedded).achievement(key)?;
    let name = entry.label(labels, &entry.name);
    let points = label(labels, "{n} points", &[("n", entry.points.to_string())]);
    Some(AchievementNotification {
        key: entry.key.clone(),
        name: name.clone(),
        text: entry.label(labels, &entry.description),
        icon: entry.icon.clone(),
        points: entry.points,
        system_line: format!(
            "|cffffd100{}|r |cffffff00[{name}]|r |cff9d9d9d({points})|r",
            labels.label("Achievement earned:")
        ),
    })
}

#[cfg(test)]
mod current_notification_tests {
    use super::*;
    #[test]
    fn achievement_system_lines_match_native_producer_for_all72_definitions() {
        let fixture:serde_json::Value=serde_json::from_str(include_str!("../../../docs/analysis/evidence/0.100.1/account-progression/native-notification-fixtures.json")).unwrap();
        let labels = MenuCatalog::default();
        for event in fixture["events"].as_array().unwrap() {
            let notification =
                achievement_notification(event["key"].as_str().unwrap(), &labels).unwrap();
            assert_eq!(
                notification.system_line,
                event["system_line"].as_str().unwrap()
            );
        }
    }
}

#[cfg(test)]
mod unlock_name_tests {
    use super::*;

    #[test]
    fn every_appearance_unlock_uses_its_registry_id_and_exact_fallback() {
        let catalog = Catalog::embedded();
        let mut labels = MenuCatalog::default();
        let mut appearances = 0;
        for entry in &catalog.achievements {
            for unlock in &entry.unlocks {
                if unlock.prefix != "Reward" {
                    assert!(unlock.name_key.is_none());
                    continue;
                }
                let key = match unlock.name_key {
                    Some(UnlockNameKey::Tabard(id)) => format!("tabard.{id}"),
                    Some(UnlockNameKey::Cosmetic(id)) => format!("cosmetic.{id}"),
                    None => panic!("appearance unlock lacks an ID: {}", entry.key),
                };
                labels.labels.remove(&key);
                labels.labels.insert(unlock.name.clone(), "literal override".into());
                assert_eq!(unlock.label(&labels), unlock.name);
                for value in ["translated name", "", key.as_str()] {
                    labels.labels.insert(key.clone(), value.into());
                    assert_eq!(unlock.label(&labels), value);
                }
                appearances += 1;
            }
        }
        assert_eq!(appearances, 22);
    }

    #[test]
    fn companion_and_perk_unlock_names_keep_literal_lookup() {
        let catalog = Catalog::embedded();
        let mut labels = MenuCatalog::default();
        let mut literals = 0;
        for entry in &catalog.achievements {
            for unlock in &entry.unlocks {
                if unlock.name_key.is_some() {
                    continue;
                }
                labels.labels.insert(unlock.name.clone(), "translated literal".into());
                assert_eq!(unlock.label(&labels), "translated literal");
                literals += 1;
            }
        }
        assert_eq!(literals, 35);
    }
}
