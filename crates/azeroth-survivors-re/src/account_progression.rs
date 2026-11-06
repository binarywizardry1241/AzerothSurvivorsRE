//! Account conditions, including current owned-armor, stars, marks and Heroic progress.
//! See achievement-progress-0.121.0.md. Earlier ordinary/cooperative predicates
//! retain their historical provenance and 0.119.0 friend admission.
//! Current cooperative descriptor changes: party-achievements-0.127.0.md.
use serde::Deserialize;
use std::{
    collections::{BTreeMap, BTreeSet},
    sync::OnceLock,
};

pub const CLASSES: [u8; 9] = [1, 2, 3, 4, 5, 7, 8, 9, 11];
#[derive(Deserialize)]
struct Catalog {
    achievements: Vec<Definition>,
    legendary_sets: BTreeMap<u8, Vec<u32>>,
}
#[derive(Debug, Deserialize)]
pub struct Definition {
    pub key: String,
    pub kind: u8,
    pub selector: u8,
    pub target: u64,
    pub zone: Option<usize>,
    pub feat_kind: Option<u32>,
    pub feat_spell: Option<u32>,
    #[serde(default)]
    pub cooperative: Option<CooperativeCondition>,
    #[serde(default)]
    pub current_feat: Option<CurrentFeat>,
}

/// Current145ba6470 variants10..14; their state belongs to the run snapshot.
#[derive(Clone, Copy, Debug, Deserialize)]
#[serde(tag = "type", rename_all = "snake_case")]
pub enum CurrentFeat {
    EndlessBosses { target: u32 },
    RunMarks { target: u32 },
    BossMarks { target: u32 },
    Unpolished { rank: u8 },
    SetVictory { zone: usize, tier: u8 },
    Graduation,
    StraightAs,
}
fn catalog() -> &'static Catalog {
    static CATALOG: OnceLock<Catalog> = OnceLock::new();
    CATALOG.get_or_init(|| {
        #[derive(Deserialize)]
        struct CooperativeCatalog {
            achievements: Vec<Definition>,
        }
        let mut catalog: Catalog = serde_json::from_str(include_str!("../assets/progression.json"))
            .expect("historical native achievement catalog");
        let additions: CooperativeCatalog = serde_json::from_str(include_str!(
            "../assets/coop-achievements-0.117.0.json"
        ))
        .expect("current cooperative achievement catalog");
        catalog.achievements.extend(additions.achievements);
        let current: CooperativeCatalog = serde_json::from_str(include_str!(
            "../assets/run-achievements-0.121.0.json"))
            .expect("current run and cooperative achievement conditions");
        catalog.achievements.extend(current.achievements);
        let additions: CooperativeCatalog = serde_json::from_str(include_str!(
            "../assets/account-achievements-0.121.0.json"
        ))
        .expect("current owned-armor and Heroic account conditions");
        catalog.achievements.extend(additions.achievements);
        // 0.140.0 enumerates seven armor tiers with 83 items per tier.
        catalog.achievements.iter_mut().find(|row| row.key == "pieces:all")
            .expect("The Whole Armory descriptor").target = 581;
        let current: CooperativeCatalog = serde_json::from_str(include_str!(
            "../assets/coop-achievements-0.127.0.json"
        ))
        .expect("current cooperative achievement conditions");
        let mut insertion = None;
        for definition in current.achievements {
            if let Some(index) = catalog.achievements.iter().position(|entry| entry.key == definition.key) {
                catalog.achievements[index] = definition;
                insertion = Some(index + 1);
            } else if let Some(index) = insertion {
                catalog.achievements.insert(index, definition);
                insertion = Some(index + 1);
            } else {
                catalog.achievements.push(definition);
                insertion = Some(catalog.achievements.len());
            }
        }
        let scholomance: CooperativeCatalog = serde_json::from_str(include_str!(
            "../assets/scholomance-achievements-0.140.0.json"
        ))
        .expect("Scholomance achievement descriptors");
        for entry in scholomance.achievements {
            let previous = scholomance_achievement_predecessor(&entry.key);
            let index = catalog.achievements.iter().position(|row| row.key == previous)
                .expect("native Scholomance achievement insertion point") + 1;
            catalog.achievements.insert(index, entry);
        }
        catalog
    })
}
pub fn definitions() -> &'static [Definition] {
    &catalog().achievements
}

pub fn scholomance_achievement_predecessor(key: &str) -> &str {
    match key {
        "collection:t05" => "armoryoflegends",
        "feat:graduation" => "feat:azuregos",
        "feat:straightas" => "feat:graduation",
        "heroic:prepared" => "radiantarmory",
        _ => unreachable!("Scholomance achievement: {key}"),
    }
}

/// Purchased tabards exclude descriptors carrying an earned achievement key.
/// This small catalog view has no dependency on Save parsing or menu resources.
pub fn is_purchasable_tabard(id: u32) -> bool {
    #[derive(Deserialize)]
    struct Tabard {
        id: u32,
        zone: Option<String>,
    }
    #[derive(Deserialize)]
    struct TabardCatalog {
        tabards: Vec<Tabard>,
    }
    static TABARDS: OnceLock<Vec<Tabard>> = OnceLock::new();
    TABARDS
        .get_or_init(|| {
            let mut catalog: TabardCatalog = serde_json::from_str(include_str!(
                "../assets/rewards-catalogs-0.112.0.json"
            ))
            .expect("historical native tabard descriptors");
            let additions: TabardCatalog = serde_json::from_str(include_str!(
                "../assets/party-rewards-0.117.0.json"
            ))
            .expect("current cooperative tabard descriptors");
            catalog.tabards.extend(additions.tabards);
            catalog.tabards
        })
        .iter()
        .any(|tabard| tabard.id == id && tabard.zone.is_none())
}

/// Retained cooperative conditions, with the current descriptor's exact-rank
/// gate. Historical ordinary definitions keep their own target provenance.
#[derive(Debug, Deserialize)]
#[serde(tag = "type", rename_all = "snake_case")]
pub enum CooperativeCondition {
    FirstVictory,
    ZoneHistory {
        zones: Vec<usize>,
    },
    Victory {
        zone: Option<usize>,
        no_deaths: bool,
        max_modifiers: bool,
        party: CooperativeParty,
    },
    Boss {
        boss_id: u32,
        spells: Vec<u32>,
        max_modifiers: bool,
        /// Current mode 2 compares the effective Heroic rank for equality.
        #[serde(default)]
        heroic_rank: Option<u8>,
        party: CooperativeParty,
    },
    Survival {
        zone: usize,
        heroic_rank: u8,
        seconds: u32,
        minimum_members: usize,
    },
}

#[derive(Debug, Deserialize)]
#[serde(tag = "kind", rename_all = "snake_case")]
pub enum CooperativeParty {
    Class { class: u8 },
    Talent { class: u8, key: String },
    HighestSpell { class: u8, key: String },
    Any,
    DifferentClasses,
    SameClass,
    Five,
    SameSet,
}

impl CooperativeParty {
    /// 0.119.0 145b33760 requires at least two members for Any. Five-member
    /// compositions retain raw class bytes and both independent talent bits.
    fn matches(&self, members: &[crate::coop::replication::NativeFeatMember]) -> bool {
        if matches!(self, Self::Any) {
            return members.len() >= 2;
        }
        if matches!(self, Self::SameSet) {
            return members.len() >= 3 && members[0].active_set != 0
                && members.iter().all(|member| member.active_set == members[0].active_set);
        }
        if matches!(self, Self::Five) { return members.len() == 5; }
        if members.len() != 5 {
            return false;
        }
        match self {
            Self::Class { class } => members.iter().all(|member| member.class == *class),
            Self::Talent { class, key } => {
                let flag = match key.as_str() {
                    "tranquility" => 1,
                    "bladestorm" => 2,
                    _ => return false,
                };
                members.iter().all(|member| member.class == *class && member.byte & flag != 0)
            }
            Self::HighestSpell { class, key } => {
                let Some(spell) = crate::player_abilities::AbilityDefinition::by_key(key) else {
                    return false;
                };
                members.iter().all(|member| {
                    member.class == *class && member.word != 0 && member.word == spell.spell_id
                })
            }
            Self::DifferentClasses => members.iter().enumerate().all(|(index, member)| {
                members[..index].iter().all(|prior| prior.class != member.class)
            }),
            Self::SameClass => members.iter().all(|member| member.class == members[0].class),
            Self::Any | Self::Five | Self::SameSet => unreachable!(),
        }
    }
}

/// 0.119.0 145b42bf0 evaluates the host's captured party context, including the
/// membership at each lethal event. The recipient need not own the lethal hit.
/// Account/history predicates are evaluated separately by `progress`.
pub fn eligible_cooperative_keys(
    zone: usize,
    run: RunSnapshot,
    context: &crate::coop::replication::NativeCoopFeats,
) -> Vec<String> {
    definitions()
        .iter()
        .filter(|definition| match &definition.cooperative {
            Some(CooperativeCondition::Victory {
                zone: required_zone,
                no_deaths,
                max_modifiers,
                party,
            }) => {
                run.won
                    && required_zone.is_none_or(|required| required == zone)
                    && party.matches(&context.members)
                    && (!no_deaths || context.word_30 == 0)
                    && (!max_modifiers || context.heroic_rank >= 3)
            }
            Some(CooperativeCondition::Boss { boss_id, spells, max_modifiers, heroic_rank, party }) => {
                (!max_modifiers || context.heroic_rank >= 3)
                    && heroic_rank.is_none_or(|rank| run.heroic_rank == rank)
                    && context.events.iter().any(|event| {
                        event.word_18 == *boss_id
                            && party.matches(&event.members)
                            && (spells.is_empty()
                                || (event.kind_21 != 2 && spells.contains(&event.word_1c)))
                    })
            }
            Some(CooperativeCondition::Survival { zone: required_zone, heroic_rank,
                seconds, minimum_members }) => {
                let first_fall = f32::from_bits(context.first_fall_bits);
                zone == *required_zone
                    && context.heroic_rank.min(run.heroic_rank) == *heroic_rank
                    && run.elapsed >= *seconds as f32
                    && (first_fall < 0.0 || first_fall >= *seconds as f32)
                    && usize::from(context.initial_member_count) >= *minimum_members
            }
            _ => false,
        })
        .map(|definition| definition.key.clone())
        .collect()
}

#[derive(Default, Deserialize)]
#[serde(default)]
pub struct Account {
    pub beaten: BTreeSet<(u8, usize)>,
    pub cooperative_beaten: BTreeSet<usize>,
    pub talent_xp: BTreeMap<u8, u32>,
    pub gear: BTreeSet<u32>,
    pub stars: BTreeMap<u32, u8>,
    pub heroic_clears: BTreeMap<(u8, usize), u8>,
    pub prepared_classes: BTreeSet<u8>,
    pub seen: usize,
    #[serde(deserialize_with = "account_statistics")]
    pub statistics: [u64; 8],
}
fn account_statistics<'de, D: serde::Deserializer<'de>>(deserializer: D) -> Result<[u64; 8], D::Error> {
    let values = Vec::<u64>::deserialize(deserializer)?;
    if !matches!(values.len(), 7 | 8) {
        return Err(serde::de::Error::custom("expected seven historical or eight current account counters"));
    }
    let mut counters = [0; 8];
    counters[..values.len()].copy_from_slice(&values);
    Ok(counters)
}

/// Current evaluator returns an unclamped numerator/denominator; feats have no partial progress.
pub fn progress(definition: &Definition, account: &Account) -> Option<(u64, u64)> {
    if let Some(condition) = &definition.cooperative {
        return match condition {
            CooperativeCondition::FirstVictory => {
                Some((u64::from(!account.cooperative_beaten.is_empty()), 1))
            }
            CooperativeCondition::ZoneHistory { zones } => Some((
                zones.iter().filter(|zone| account.cooperative_beaten.contains(zone)).count() as u64,
                zones.len() as u64,
            )),
            CooperativeCondition::Victory { .. } | CooperativeCondition::Boss { .. }
                | CooperativeCondition::Survival { .. } => None,
        };
    }
    if definition.key == "heroic:all3" {
        let total = crate::zones::COUNT as u64;
        return Some((total - account.missing_heroic_zones(definition.selector).count() as u64, total));
    }
    let have = match definition.kind {
        0 => u64::from(CLASSES.iter().any(|c| {
            account
                .beaten
                .contains(&(*c, usize::from(definition.selector)))
        })),
        1 => CLASSES
            .iter()
            .filter(|c| {
                account
                    .beaten
                    .contains(&(**c, usize::from(definition.selector)))
            })
            .count() as u64,
        2 => u64::from((0..12).any(|zone| account.beaten.contains(&(definition.selector, zone)))),
        3 => u64::from(
            account
                .beaten
                .contains(&(definition.selector, definition.zone?)),
        ),
        4 => CLASSES
            .iter()
            .filter(|c| talent_points(account.talent_xp.get(c).copied().unwrap_or(0)) >= 51)
            .count() as u64,
        5 => account.gear.len() as u64,
        6 => {
            // Current1459f4ef0 selects the later class on equal f32 ratios.
            // Empty denominator is treated as1 for comparison only.
            let mut best = (
                catalog()
                    .legendary_sets
                    .values()
                    .flatten()
                    .filter(|id| account.gear.contains(id))
                    .count() as u64,
                catalog()
                    .legendary_sets
                    .values()
                    .map(Vec::len)
                    .sum::<usize>() as u64,
            );
            for class in CLASSES {
                let items = &catalog().legendary_sets[&class];
                let candidate = (
                    items.iter().filter(|id| account.gear.contains(id)).count() as u64,
                    items.len() as u64,
                );
                if (candidate.0 as f32 / candidate.1.max(1) as f32)
                    >= (best.0 as f32 / best.1.max(1) as f32)
                {
                    best = candidate;
                }
            }
            return Some(best);
        }
        7 => {
            // Native Codex conditions specify a percentage of listed items.
            let total = crate::loot_rewards::codex_keys().count() as u64;
            let target = (total * u64::from(definition.selector)).div_ceil(100);
            return Some((account.seen as u64, target));
        }
        8 => {
            let have = *account.statistics.get(usize::from(definition.selector))?;
            // Current145ba563f: lifetime marks retain tenths in Save, while
            // account progress and its denominator display whole marks.
            if definition.selector == 7 {
                return Some((have / 10, definition.target / 10));
            }
            have
        }
        9 => return None,
        // Current145ba4260 kinds27..36. These inspect the account's owned
        // armor/rank records, independently of equipped or appearance slots.
        27 => return Some((u64::from(account.stars.values()
            .any(|rank| *rank >= definition.selector)), 1)),
        28 => return Some((u64::from(CLASSES.iter().any(|class| ARMOR_TIERS.iter()
            .any(|tier| account.armor_pieces(*class, *tier, 1) >= 4))), 1)),
        29 => return Some((ARMOR_TIERS.iter().map(|tier| CLASSES.iter()
            .filter(|class| account.armor_pieces(**class, *tier, 1) == 8).count() as u64)
            .max().unwrap_or(0), 9)),
        30 => return Some((u64::from(account.heroic_clears.values()
            .any(|rank| *rank >= definition.selector)), 1)),
        31 => return Some(((0..12).filter(|zone| account.heroic_clears.iter()
            .any(|((_, cleared_zone), rank)| cleared_zone == zone && *rank >= definition.selector))
            .count() as u64, 12)),
        32 => return Some((u64::from(account.heroic_clears.iter()
            .any(|((_, zone), rank)| Some(*zone) == definition.zone
                && *rank >= definition.selector)), 1)),
        33 => return Some((u64::from(CLASSES.iter().any(|class| ARMOR_TIERS.iter()
            .any(|tier| account.armor_pieces(*class, *tier, definition.selector) == 8))), 1)),
        34 => return Some((CLASSES.iter().map(|class| ARMOR_TIERS.iter()
            .filter(|tier| account.armor_pieces(*class, **tier, 3) == 8).count() as u64)
            .max().unwrap_or(0), 6)),
        35 => return Some((CLASSES.iter()
            .filter(|class| account.armor_pieces(**class, 4, 3) == 8).count() as u64, 9)),
        36 => return Some((CLASSES.iter().filter(|class| ARMOR_TIERS.iter()
            .any(|tier| account.armor_pieces(**class, *tier, 5) == 8)).count() as u64, 9)),
        41 => return Some((account.prepared_classes.len() as u64, CLASSES.len() as u64)),
        40 => {
            let items = CLASSES.into_iter().flat_map(|class| {
                (0..8).map(move |slot| crate::tier05::item_id(class, slot))
                    .chain(crate::tier05::weapon_ids(class))
            });
            return Some(items.fold((0, 0), |(have, total), id| {
                (have + u64::from(account.gear.contains(&id)), total + 1)
            }));
        }
        _ => return None,
    };
    Some((have, definition.target))
}

const ARMOR_TIERS: [u8; 6] = [0, 1, 2, 3, 5, 4];

impl Account {
    pub fn missing_heroic_zones(&self, rank: u8)
        -> impl Iterator<Item = &'static crate::guardians::catalog::ZoneDefinition> + '_
    {
        crate::guardians::catalog::ZONES.iter().filter(move |zone| {
            let index = crate::mob_loot::BOSS_ZONES.iter().position(|row| row.key == zone.key)
                .unwrap_or(crate::mob_loot::BOSS_ZONES.len());
            !self.heroic_clears.iter().any(|((_, cleared), earned)| {
                *cleared == index && *earned >= rank
            })
        })
    }

    /// Current145ba3940 tests eight constructed IDs in the raw owned set,
    /// then their canonical rank keys. Tier6 shares tier5's rank key, but
    /// the owned test itself retains the requested (clamped) tier identity.
    pub fn armor_pieces(&self, class: u8, tier: u8, minimum_stars: u8) -> usize {
        let tier = tier.min(5);
        (0..8).filter(|slot| {
            let id = 100_000 + u32::from(class) * 1_000 + slot * 100 + u32::from(tier) * 10;
            self.gear.contains(&id) && self.stars.get(&id).copied().unwrap_or(0) >= minimum_stars
        }).count()
    }
}
fn talent_points(mut xp: u32) -> u32 {
    let mut points = 0;
    while points < 51 {
        let cost = 80 + 15 * points;
        if xp < cost {
            break;
        }
        xp -= cost;
        points += 1;
    }
    points
}
#[derive(Clone, Copy, Debug, Default, PartialEq, Deserialize)]
pub struct RunSnapshot {
    pub elapsed: f32,
    pub normalized_kills: u32,
    pub guardians: u32,
    pub caches: u32,
    pub won: bool,
    pub bare: bool,
    /// Current producers use Heroic III admission. Historical from_run keeps
    /// the older reward-cap interpretation for its explicitly old input API.
    pub full_reward: bool,
    #[serde(default)]
    pub heroic_rank: u8,
    #[serde(default)]
    pub zone: Option<usize>,
    #[serde(default)]
    pub endless_bosses: u32,
    #[serde(default)]
    pub run_marks: f32,
    #[serde(default)]
    pub max_boss_marks: f32,
    #[serde(default)]
    pub max_equipment_stars: u8,
    #[serde(default)]
    pub active_set: u8,
    #[serde(default)]
    pub enhancement: bool,
}
impl RunSnapshot {
    /// Current145b0f490 uses the captured class/zone account cap at grant time.
    /// The historical full_reward field carries the current Heroic-III gate.
    pub fn with_heroic_cap(mut self, cap: u8) -> Self {
        self.heroic_rank = self.heroic_rank.min(cap);
        self.full_reward = self.heroic_rank >= 3;
        self
    }

    /// Current0.121.0 captures raw kills and Heroic III admission. The field
    /// names remain compatible with the historical snapshot representation.
    pub fn from_heroic_run(
        elapsed: f32, kills: u32, guardians: u32, caches: u32, won: bool,
        gear: [u32; 19], heroic_rank: u8,
    ) -> Self {
        Self { elapsed, normalized_kills: kills, guardians, caches, won, heroic_rank,
            bare: gear.into_iter().all(|id| id == 0), full_reward: heroic_rank >= 3,
            ..Self::default() }
    }

    /// Historical1454502d0 Run Options projection. Current live callers use
    /// from_heroic_run; wrapper/account admission is still supplied by the caller.
    pub fn from_run(
        elapsed: f32,
        kills: u32,
        guardians: u32,
        caches: u32,
        won: bool,
        gear: [u32; 19],
        mods: [u16; 4],
    ) -> Self {
        let [density, health, damage, speed] = mods.map(f32::from);
        let first = ((density - 100.) / 100.) * 0.05 + ((health - 100.) / 100.) * 0.4;
        let first = first + ((damage - 100.) / 100.) * 0.6;
        let reward = ((((speed - 100.) / 100.) * 2.) + first + 1.).min(2.);
        Self {
            elapsed,
            heroic_rank: 0,
            normalized_kills: (kills as f32 / (density / 100.)) as u32,
            guardians,
            caches,
            won,
            bare: gear.into_iter().all(|id| id == 0),
            full_reward: reward >= f32::from_bits(0x3ffffcb9),
            ..Self::default()
        }
    }
}
pub fn meets_feat(definition: &Definition, run: RunSnapshot) -> bool {
    meets_feat_with_killing_blows(definition, run, &[])
}

/// Compatibility entry for the original pair-only feat history. Current
/// boss predicates also require the enriched records passed below.
pub fn meets_feat_with_killing_blows(
    definition: &Definition,
    run: RunSnapshot,
    killing_blows: &[(u32, u32)],
) -> bool {
    meets_feat_with_events(definition, run, killing_blows, &[], &[])
}

/// Current twelve-byte boss kill record, written before death callbacks.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Deserialize)]
pub struct BossKillingBlow {
    pub boss_id: u32,
    pub spell_id: u32,
    pub school: u8,
    pub source_kind: u8,
    pub melee: bool,
}

impl From<&crate::coop::replication::StateRow> for BossKillingBlow {
    fn from(row: &crate::coop::replication::StateRow) -> Self {
        Self {
            boss_id: row.word_00, spell_id: row.word_04, school: row.byte_08,
            source_kind: row.kind_09, melee: row.flag_0a,
        }
    }
}

impl From<&BossKillingBlow> for crate::coop::replication::StateRow {
    fn from(row: &BossKillingBlow) -> Self {
        Self {
            word_00: row.boss_id, word_04: row.spell_id, byte_08: row.school,
            kind_09: row.source_kind, flag_0a: row.melee,
        }
    }
}

/// Current1459b5e40: all boss predicates use the lethal hit's captured
/// attribution. Damage from a boss is remembered before retaliation, even
/// when absorption leaves zero HP damage. Neither predicate needs a victory.
pub fn meets_feat_with_events(
    definition: &Definition,
    run: RunSnapshot,
    killing_blows: &[(u32, u32)],
    boss_killing_blows: &[BossKillingBlow],
    damaged_by_bosses: &[u32],
) -> bool {
    meets_feat_with_history(
        definition, run, killing_blows, boss_killing_blows, damaged_by_bosses, &[], &[],
    )
}

pub fn meets_feat_with_history(
    definition: &Definition,
    run: RunSnapshot,
    killing_blows: &[(u32, u32)],
    boss_killing_blows: &[BossKillingBlow],
    damaged_by_bosses: &[u32],
    personal_boss_killing_blows: &[BossKillingBlow],
    boss_flags: &[crate::coop::replication::BossFlagRow],
) -> bool {
    if let Some(condition) = &definition.current_feat {
        return match *condition {
            CurrentFeat::EndlessBosses { target } => run.endless_bosses >= target,
            CurrentFeat::RunMarks { target } => run.run_marks + 0.001 >= target as f32,
            CurrentFeat::BossMarks { target } => run.max_boss_marks + 0.001 >= target as f32,
            CurrentFeat::Unpolished { rank } => run.won && run.heroic_rank >= rank
                && run.max_equipment_stars == 0,
            CurrentFeat::SetVictory { zone, tier } => run.won && run.zone == Some(zone)
                && run.active_set == tier + 1,
            CurrentFeat::Graduation => run.enhancement
                && personal_boss_killing_blows.iter().any(|hit| {
                    hit.boss_id == 1853 && hit.spell_id == 17364 && hit.source_kind != 2
                }),
            CurrentFeat::StraightAs => boss_flags.iter().any(|row| {
                u64::from(row.boss_id) == definition.target && row.flags & 1 != 0
            }),
        };
    }
    if definition.cooperative.is_some() || definition.kind != 9 {
        return false;
    }
    match definition.feat_kind {
        Some(kind @ 0..=7) => {
            if kind == 7 && damaged_by_bosses.contains(&(definition.target as u32)) {
                return false;
            }
            boss_killing_blows.iter().any(|hit| {
                u64::from(hit.boss_id) == definition.target && match kind {
                    0 => hit.source_kind != 2 && Some(hit.spell_id) == definition.feat_spell,
                    1 => hit.source_kind != 2 && hit.spell_id != 0 && hit.school == definition.selector,
                    2 => hit.school == definition.selector,
                    3 => hit.source_kind == 1 && hit.school == 0,
                    4 => hit.source_kind == 2,
                    5 => hit.melee,
                    6 => hit.source_kind != 2 && matches!(hit.spell_id, 324 | 467 | 20925),
                    7 => true,
                    _ => unreachable!(),
                }
            })
        }
        Some(8) => u64::from(run.normalized_kills) >= definition.target,
        Some(9) => run.guardians >= 4 && run.elapsed <= 480.,
        Some(10) => run.won && run.elapsed >= definition.target as f32,
        Some(11) => run.won && run.bare,
        Some(12) => run.won && run.caches == 0,
        Some(13) => run.won && run.full_reward,
        Some(14) => killing_blows.contains(&(
            definition.target as u32,
            (definition.target >> 32) as u32,
        )),
        _ => false,
    }
}

/// Current14593f52e..5e9 tests the original spell before visual normalization.
/// Its physical ability scan admits kinds2/5/7 with positive base power.
pub fn killing_blow_is_melee(source_kind: u8, spell: u32) -> bool {
    source_kind == 0 && (spell == 0 || crate::player_abilities::ABILITIES.iter().any(|ability| {
        ability.spell_id == spell && ability.school == 0
            && matches!(ability.kind, 2 | 5 | 7) && ability.base_power > 0.0
    }))
}

/// Native145934623..4654 normalizes three ability visuals before recording.
pub fn killing_spell(spell: u32) -> u32 {
    match spell {
        16038 => 8349,
        14186 => 2098,
        5308 => 20647,
        _ => spell,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn scholomance_collection_needs_both_paired_weapons_and_accepts_existing_items() {
        let definition = definitions().iter().find(|row| row.key == "collection:t05").unwrap();
        let mut account = Account::default();
        for class in CLASSES {
            account.gear.extend((0..8).map(|slot| crate::tier05::item_id(class, slot)));
            account.gear.extend(crate::tier05::weapon_ids(class));
        }
        assert_eq!(progress(definition, &account), Some((83, 83)));
        account.gear.remove(&crate::tier05::item_id(7, 9));
        account.gear.insert(107_060);
        assert_eq!(progress(definition, &account), Some((82, 83)));
    }

    #[test]
    fn graduation_counts_the_recipients_own_nonpet_stormstrike() {
        let definition = definitions().iter().find(|row| row.key == "feat:graduation").unwrap();
        let hit = BossKillingBlow { boss_id: 1853, spell_id: 17364, school: 0,
            source_kind: 0, melee: true };
        let run = RunSnapshot { enhancement: true, ..RunSnapshot::default() };
        let earned = |run, shared: &[BossKillingBlow], personal: &[BossKillingBlow]| {
            meets_feat_with_history(definition, run, &[], shared, &[], personal, &[])
        };
        assert!(earned(run, &[], &[hit]));
        assert!(!earned(run, &[hit], &[]));
        assert!(!earned(RunSnapshot::default(), &[], &[hit]));
        assert!(!earned(run, &[], &[BossKillingBlow { source_kind: 2, ..hit }]));
        assert!(!earned(run, &[], &[BossKillingBlow { spell_id: 1, ..hit }]));
    }

    #[test]
    fn prepared_progress_uses_only_the_saved_class_record() {
        let definition = definitions().iter().find(|row| row.key == "heroic:prepared").unwrap();
        let mut account = Account::default();
        let zone = crate::mob_loot::BOSS_ZONES.len();
        account.heroic_clears.extend(CLASSES.map(|class| ((class, zone), 5)));
        assert_eq!(progress(definition, &account), Some((0, 9)));
        account.prepared_classes.extend(CLASSES[..8].iter().copied());
        assert_eq!(progress(definition, &account), Some((8, 9)));
        account.prepared_classes.insert(CLASSES[8]);
        assert_eq!(progress(definition, &account), Some((9, 9)));
    }

    #[test]
    fn heroic_across_azeroth_includes_scholomance_in_world_order() {
        let definition = definitions().iter().find(|row| row.key == "heroic:all3").unwrap();
        let mut account = Account::default();
        let old_zones = crate::mob_loot::BOSS_ZONES.len();
        account.heroic_clears.extend((0..old_zones).map(|zone| ((1, zone), 3)));
        account.heroic_clears.insert((4, old_zones), 2);
        assert_eq!(progress(definition, &account), Some((12, 13)));
        assert_eq!(account.missing_heroic_zones(3).map(|zone| zone.key).collect::<Vec<_>>(),
            ["scholomance"]);
        account.heroic_clears.insert((4, old_zones), 3);
        assert_eq!(progress(definition, &account), Some((13, 13)));
    }

    #[test]
    fn owned_armor_heroic_and_marks_match_current_native_cases() {
        #[derive(Deserialize)]
        struct Input {
            name: String,
            owned: Vec<u32>,
            stars: Vec<(u32, u8)>,
            hbeat: Vec<(usize, u8, u8)>,
            #[serde(default)]
            marks: u64,
        }
        #[derive(Deserialize)]
        struct Fixture {
            inputs: Vec<Input>,
            cases: Vec<(String, u8, u64, u64, u64)>,
        }
        let fixture: Fixture = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.121.0/achievement-progress-cases.json"
        )).unwrap();
        for (name, native_kind, minimum, numerator, denominator) in fixture.cases {
            let input = fixture.inputs.iter().find(|input| input.name == name).unwrap();
            let mut account = Account {
                gear: input.owned.iter().copied().collect(),
                stars: input.stars.iter().copied().collect(),
                heroic_clears: input.hbeat.iter()
                    .map(|(zone, class, rank)| ((*class, *zone), *rank)).collect(),
                ..Account::default()
            };
            account.statistics[7] = input.marks;
            let definition = Definition {
                key: String::new(),
                kind: if native_kind == 23 { 8 } else { native_kind },
                selector: if native_kind == 23 { 7 } else { minimum as u8 },
                target: minimum,
                zone: (native_kind == 32).then_some(11),
                feat_kind: None,
                feat_spell: None,
                cooperative: None,
                current_feat: None,
            };
            assert_eq!(progress(&definition, &account), Some((numerator, denominator)),
                "{name}, kind={native_kind}, minimum={minimum}");
        }
    }

    #[test]
    fn cooperative_predicates_preserve_historical_vectors_with_friend_admission() {
        use crate::coop::replication::{NativeCoopFeats, NativeFeatEvent, NativeFeatMember};
        #[derive(Deserialize)]
        struct Member { class: u8, word: u32, byte: u8 }
        impl Member {
            fn native(self) -> NativeFeatMember {
                NativeFeatMember { class: self.class, word: self.word, byte: self.byte, active_set: 0 }
            }
        }
        #[derive(Deserialize)]
        struct Event {
            boss: u32, spell: u32, members: Vec<Member>,
            #[serde(default)] school: u8,
            #[serde(default)] source_kind: u8,
            #[serde(default)] melee: bool,
        }
        #[derive(Deserialize)]
        struct Context { members: Vec<Member>, deaths: u32, max_modifiers: bool, events: Vec<Event> }
        #[derive(Deserialize)]
        struct Case { name: String, zone: usize, won: bool, context: Context, keys: Vec<String> }
        #[derive(Deserialize)]
        struct Fixtures { cases: Vec<Case> }
        let fixtures: Fixtures = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.117.0/coop-achievements/predicates-native.json"
        )).unwrap();
        for case in fixtures.cases {
            let context = NativeCoopFeats {
                members: case.context.members.into_iter().map(Member::native).collect(),
                word_30: case.context.deaths,
                heroic_rank: if case.context.max_modifiers { 3 } else { 0 },
                initial_member_count: 0, first_fall_bits: (-1.0_f32).to_bits(),
                events: case.context.events.into_iter().map(|event| NativeFeatEvent {
                    word_18: event.boss, word_1c: event.spell,
                    byte_20: event.school, kind_21: event.source_kind, flag_22: event.melee,
                    members: event.members.into_iter().map(Member::native).collect(),
                }).collect(),
            };
            // Preserve the 0.117.0 oracle itself. Since 0.118.0, only its
            // singleton Any admissions change; boss events use their own
            // captured population independently of the current victory roster.
            let mut expected = case.keys;
            expected.retain(|key| match key.as_str() {
                "coop:odds" | "coop:bump" => context.members.len() >= 2,
                "coop:oldgods" => context.events.iter().any(|event| {
                    event.word_18 == 1194 && event.members.len() >= 2
                }),
                _ => true,
            });
            assert_eq!(eligible_cooperative_keys(case.zone,
                RunSnapshot { won: case.won, heroic_rank: 3, ..RunSnapshot::default() }, &context),
                expected, "{}", case.name);
        }
    }

    #[test]
    fn photosynthesis_requires_exact_effective_heroic_three_and_the_lethal_party() {
        use crate::coop::replication::{NativeCoopFeats, NativeFeatEvent, NativeFeatMember};
        let mut context = NativeCoopFeats {
            members: Vec::new(), word_30: 0, heroic_rank: 0,
            initial_member_count: 0, first_fall_bits: (-1.0_f32).to_bits(),
            events: vec![NativeFeatEvent {
                word_18: 1494, word_1c: 740, byte_20: 0, kind_21: 0, flag_22: false,
                members: vec![NativeFeatMember {
                    class: 11, word: 0, byte: 1, active_set: 0,
                }; 5],
            }],
        };
        let earned = |rank, context: &NativeCoopFeats| eligible_cooperative_keys(
            11, RunSnapshot { heroic_rank: rank, ..RunSnapshot::default() }, context,
        ).iter().any(|key| key == "coop:photosynthesis");
        for rank in 0..=5 {
            assert_eq!(earned(rank, &context), rank == 3);
        }
        // The current group can have changed after the lethal snapshot.
        context.members = vec![NativeFeatMember { class: 1, word: 0, byte: 0, active_set: 0 }];
        assert!(earned(3, &context));
        for (boss, spell, kind) in [(1493, 740, 0), (1494, 1, 0), (1494, 740, 2)] {
            context.events[0].word_18 = boss;
            context.events[0].word_1c = spell;
            context.events[0].kind_21 = kind;
            assert!(!earned(3, &context));
        }
        context.events[0].word_18 = 1494;
        context.events[0].word_1c = 740;
        context.events[0].kind_21 = 0;
        context.events[0].members[0].byte = 0;
        assert!(!earned(3, &context));
        context.events[0].members[0].byte = 1;
        context.events[0].members.pop();
        assert!(!earned(3, &context));
    }

    #[test]
    fn insane_uses_starting_members_and_first_party_fall_at_heroic_five() {
        use crate::coop::replication::NativeCoopFeats;
        let mut context = NativeCoopFeats {
            members: Vec::new(), word_30: 10, heroic_rank: 5, initial_member_count: 3,
            first_fall_bits: (-1.0_f32).to_bits(), events: Vec::new(),
        };
        let baseline = RunSnapshot { elapsed: 2400.0, heroic_rank: 5, zone: Some(11),
            ..RunSnapshot::default() };
        let earned = |zone, run, context: &NativeCoopFeats| eligible_cooperative_keys(zone, run, context)
            .iter().any(|key| key == "coop:insane");
        assert!(earned(11, baseline, &context));
        assert!(!earned(10, baseline, &context));
        for rank in [0, 1, 2, 3, 4] {
            assert!(!earned(11, RunSnapshot { heroic_rank: rank, ..baseline }, &context));
        }
        for (elapsed, first_fall, expected) in [
            (2399.99, -1.0_f32, false), (2400.0, -1.0, true),
            (2400.0, -0.0, false), (2400.0, 2399.99, false),
            (2400.0, 2400.0, true), (3000.0, 2400.01, true),
            (3000.0, 0.0, false), (f32::NAN, -1.0, false),
        ] {
            context.first_fall_bits = first_fall.to_bits();
            assert_eq!(earned(11, RunSnapshot { elapsed, ..baseline }, &context), expected);
        }
        context.first_fall_bits = (-1.0_f32).to_bits();
        assert!(!earned(11, baseline.with_heroic_cap(4), &context));
        assert!(earned(11, baseline.with_heroic_cap(5), &context));
        context.heroic_rank = 4;
        assert!(!earned(11, baseline, &context));
        context.heroic_rank = 5;
        context.initial_member_count = 2;
        assert!(!earned(11, baseline, &context));
        let keys: Vec<_> = definitions().iter().map(|row| row.key.as_str()).collect();
        let position = keys.iter().position(|key| *key == "coop:photosynthesis").unwrap();
        assert_eq!(keys[position + 1], "coop:insane");
    }

    #[test]
    fn cooperative_friend_admission_uses_each_event_and_victory_population() {
        use crate::coop::replication::{NativeCoopFeats, NativeFeatEvent, NativeFeatMember};
        let members = |count| vec![NativeFeatMember { class: 1, word: 0, byte: 0, active_set: 0 }; count];
        for current_count in 0..=5 {
            for event_count in 0..=5 {
                let context = NativeCoopFeats {
                    members: members(current_count),
                    word_30: 0,
                    heroic_rank: 3, initial_member_count: 0, first_fall_bits: (-1.0_f32).to_bits(),
                    events: vec![NativeFeatEvent {
                        word_18: 1194,
                        word_1c: 0,
                        byte_20: 0,
                        kind_21: 0,
                        flag_22: false,
                        members: members(event_count),
                    }],
                };
                let keys = eligible_cooperative_keys(
                    1, RunSnapshot { won: true, ..RunSnapshot::default() }, &context,
                );
                for key in ["coop:odds", "coop:bump"] {
                    assert_eq!(keys.iter().any(|candidate| candidate == key), current_count >= 2,
                        "{key}: current={current_count}, event={event_count}");
                }
                assert_eq!(keys.iter().any(|key| key == "coop:oldgods"), event_count >= 2,
                    "current={current_count}, event={event_count}");
                assert_eq!(keys.iter().any(|key| key == "coop:fiveofakind"), current_count == 5);
            }
        }
    }

    #[test]
    fn cooperative_history_is_independent_of_solo_class_clears() {
        let mut account = Account::default();
        account.beaten = CLASSES.into_iter().flat_map(|class| (0..12).map(move |zone| (class,zone))).collect();
        let definition = |key: &str| definitions().iter().find(|row| row.key == key).unwrap();
        assert_eq!(progress(definition("coop:together"), &account), Some((0,1)));
        account.cooperative_beaten = [2,4,8].into();
        assert_eq!(progress(definition("coop:together"), &account), Some((1,1)));
        assert_eq!(progress(definition("coop:team"), &account), Some((2,2)));
        assert_eq!(progress(definition("coop:dragonslayers"), &account), Some((1,2)));
        assert_eq!(progress(definition("coop:end"), &account), Some((3,12)));
    }

    #[test]
    fn current_boss_feats_match_original_native_attribution_vectors() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.112.0/achievement-grants/native-vectors.json"
        )).unwrap();
        for case in fixture["cases"].as_array().unwrap() {
            let definition = definitions().iter().find(|row| row.key == case["key"].as_str().unwrap()).unwrap();
            let hit: BossKillingBlow = serde_json::from_value(case["hit"].clone()).unwrap();
            let damaged: Vec<u32> = serde_json::from_value(case["damaged_by_bosses"].clone()).unwrap();
            assert_eq!(meets_feat_with_events(definition, RunSnapshot::default(), &[], &[hit], &damaged),
                case["matches"].as_bool().unwrap(), "{} {}", case["key"], case["name"]);
            assert!(!meets_feat_with_events(definition, RunSnapshot::default(), &[], &[], &damaged));
        }
        for spell in fixture["checks"]["melee_spell_ids"].as_array().unwrap() {
            let spell = spell.as_u64().unwrap() as u32;
            assert!(killing_blow_is_melee(0, spell));
            for source in 1..=3 { assert!(!killing_blow_is_melee(source, spell)); }
        }
        assert!(killing_blow_is_melee(0, 0));
        assert!(!killing_blow_is_melee(0, 116));
    }
    #[test]
    fn no_u_matches_selected_native_pair_vectors_without_a_victory_requirement() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.105.0/no-u/native-vectors.json"
        )).unwrap();
        let definition = definitions().iter().find(|row| row.key == "feat:nou").unwrap();
        for case in fixture["membership_cases"].as_array().unwrap() {
            let pairs = case["pairs"].as_array().unwrap().iter().map(|pair| (
                pair[0].as_u64().unwrap() as u32, pair[1].as_u64().unwrap() as u32,
            )).collect::<Vec<_>>();
            assert_eq!(meets_feat_with_killing_blows(definition, RunSnapshot::default(), &pairs),
                case["matches"].as_bool().unwrap(), "{}", case["name"]);
        }
        for case in fixture["record_cases"].as_array().unwrap() {
            if let Some(pair) = case["pair"].as_array() {
                assert_eq!(killing_spell(case["spell"].as_u64().unwrap() as u32),
                    pair[1].as_u64().unwrap() as u32);
            }
        }
    }
    #[test]
    fn account_progress_matches_native_instruction_cases() {
        const CURRENT_CODEX_COUNT: u64 = 141;
        let fixtures:serde_json::Value=serde_json::from_str(include_str!("../../../docs/analysis/evidence/0.112.0/achievement-grants/native-account-vectors.json")).unwrap();
        for state in fixtures["states"].as_array().unwrap() {
            let mut account: Account = serde_json::from_value(state["input"].clone()).unwrap();
            account.seen = account.seen.min(CURRENT_CODEX_COUNT as usize);
            for (key, expected) in fixtures["keys"].as_array().unwrap().iter()
                .zip(state["progress"].as_array().unwrap()) {
                let key = key.as_str().unwrap();
                let definition = definitions()
                    .iter()
                    .find(|definition| definition.key == key)
                    .unwrap();
                let pair = expected.as_array().map(|pair| {
                    let have = pair[0].as_u64().unwrap();
                    let target = pair[1].as_u64().unwrap();
                    match key {
                        "codex:50" => (have.min(CURRENT_CODEX_COUNT), target),
                        "codex:100" => (have.min(CURRENT_CODEX_COUNT), CURRENT_CODEX_COUNT),
                        _ => (have, target),
                    }
                });
                assert_eq!(
                    progress(definition, &account),
                    pair,
                    "{} {key}",
                    state["input"]["name"]
                );
            }
        }
    }
}

#[cfg(test)]
mod run_tests {
    use super::*;
    #[test]
    fn snapshots_and_feats_match_native_boundaries_and_utc_grants() {
        let fixtures: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.100.1/account-progression/native-run-fixtures.json"
        ))
        .unwrap();
        for row in fixtures["cases"].as_array().unwrap() {
            if row["snapshot"].is_null() {
                continue;
            }
            let input = &row["input"];
            let actual = RunSnapshot::from_run(
                input["elapsed"].as_f64().unwrap() as f32,
                input["kills"].as_u64().unwrap() as u32,
                input["guardians"].as_u64().unwrap() as u32,
                input["caches"].as_u64().unwrap() as u32,
                input["won"].as_bool().unwrap(),
                std::array::from_fn(|i| input["gear"][i].as_u64().unwrap() as u32),
                std::array::from_fn(|i| input["mods"][i].as_u64().unwrap() as u16),
            );
            let expected: RunSnapshot = serde_json::from_value(row["snapshot"].clone()).unwrap();
            assert_eq!(actual, expected, "{}", input["name"]);
            let actual: Vec<_> = definitions()
                .iter()
                .filter(|definition| meets_feat(definition, actual))
                .map(|definition| definition.key.clone())
                .collect();
            let expected: Vec<String> =
                serde_json::from_value(row["new_in_catalog_order"].clone()).unwrap();
            assert_eq!(actual, expected, "{}", input["name"]);
        }
    }
}
