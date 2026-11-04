//! Current 0.112.0 Demonology definitions and Empowerment composition.
//! Current Effect64 numeric tags are translated into the compositor's retained
//! internal tags; special army contracts remain separately owned.
//! Source: evidence/0.112.0/warlock-talents/definitions.json.
use super::{Payload, Talent};

/// Current 0.112.0 localized description, separately verified by its formatter.
pub const EMPOWERMENT_DESCRIPTION: &str = "Your demons deal {d}% more damage for {dur} sec. Cast once enemies are within 30 yd and a demon fights for you.";

/// The 0.139.2 label changes without changing the serialized talent key.
pub const PACT_KEY: &str = "pact_of_the_annihilan";
pub const PACT_NAME: &str = "Pact of the Nathrezim";
pub const PACT_DESCRIPTION: &str = concat!(
    "Capstone. Summons a Dread Lord for {v} sec every 30 sec, reduced by CDR (min 13 sec). Up to 2 active.\n",
    "Felseeker inherits your Searing Pain upgrades and deals 25% more damage to its primary target. It hits up to 6 enemies.\n",
    "Exclusive with Butcher.",
);

pub const KEYS: [&str; 14] = [
    "demonic_familiar",
    "demonic_embrace",
    "fel_stamina",
    "unholy_power",
    "soul_devourer",
    "soul_link",
    "felfire_training",
    "master_demonologist",
    "legion_gate",
    "demonic_supremacy",
    "summon_infernal",
    "summon_doomguard",
    PACT_KEY,
    "butcher",
];
pub const OLD_KEYS: [&str; 13] = [
    "demonic_embrace",
    "fel_intellect",
    "fel_stamina",
    "imp_health_funnel",
    "summon_imp",
    "unholy_power",
    "imp_succubus",
    "master_demonologist",
    "demonic_pact",
    "demonic_knowledge",
    "imp_enslave",
    "demonic_sacrifice",
    "felguard",
];

#[derive(Clone, Copy, Debug, Default)]
pub struct Config {
    pub familiar_rank: u8,
    pub devourer_rank: u8,
    pub link_rank: u8,
    pub gate: bool,
    pub supremacy: bool,
    pub infernal_rank: u8,
    pub doomguard_rank: u8,
    pub pit_lord: bool,
    pub felguard: bool,
    pub damage_bonus: f32,
    pub crit_bonus: f32,
    pub imp_bonus: f32,
    pub echo_chance: f32,
    pub supremacy_bonus: f32,
}
impl Config {
    pub fn from_allocation(allocation: &[(String, u8)]) -> Self {
        let rank = |key: &str, max: u8| {
            allocation
                .iter()
                .find(|(k, _)| k == key)
                .map_or(0, |(_, rank)| (*rank).min(max))
        };
        let familiar_rank = rank("demonic_familiar", 5);
        let master = rank("master_demonologist", 3);
        Self {
            familiar_rank,
            devourer_rank: rank("soul_devourer", 3),
            link_rank: rank("soul_link", 3),
            gate: rank("legion_gate", 1) != 0,
            supremacy: rank("demonic_supremacy", 1) != 0,
            infernal_rank: rank("summon_infernal", 3),
            doomguard_rank: rank("summon_doomguard", 3),
            pit_lord: rank(PACT_KEY, 1) != 0,
            felguard: rank("butcher", 1) != 0,
            damage_bonus: f32::from_bits(0x3d4c_cccd) * f32::from(rank("unholy_power", 5)),
            crit_bonus: f32::from_bits(0x3cf5_c28f) * f32::from(master),
            imp_bonus: f32::from_bits(0x3d23_d70a) * f32::from(familiar_rank),
            echo_chance: f32::from_bits(0x3d4c_cccd) * f32::from(rank("felfire_training", 3)),
            // Current Supremacy replaces its historical flat damage bonus
            // with rank-dependent effects in the four lesser-demon talents.
            supremacy_bonus: 0.0,
        }
    }
    pub fn infernal_supremacy_bonus(self) -> f32 {
        if self.supremacy { f32::from(self.familiar_rank) * 0.01 } else { 0.0 }
    }
    pub fn doomguard_supremacy_bonus(self) -> f32 {
        if self.supremacy { f32::from(self.devourer_rank) * 0.02 } else { 0.0 }
    }
    /// Current 1458f2a52..1458f2b8d appends this stat-5 contribution
    /// to the refresh scratch copy, after detecting live Supremacy stat 32.
    pub fn supremacy_damage_reduction(self) -> f32 {
        if self.supremacy { f32::from(self.link_rank) * 0.01 } else { 0.0 }
    }
    /// Current 14595cec8..14595cfe7: supremacists must own a greater summon, and ordinary
    /// armies must own a combat demon/grant; a scalar demon bonus alone is insufficient.
    pub fn enables_empowerment(self) -> bool {
        self.infernal_rank != 0
            || self.doomguard_rank != 0
            || self.pit_lord
            || self.felguard
            || (!self.supremacy
                && (self.familiar_rank != 0
                    || self.devourer_rank != 0
                    || self.link_rank != 0
                    || self.gate))
    }
}

/// Replace all three Warlock trees in current native definition order. Moved
/// talents share the same persisted allocation, and spell consumers must use
/// their current effects and per-rank numeric overrides as well as their menu.
pub(super) fn overlay(talents: &mut Vec<Talent>) {
    #[derive(serde::Deserialize)]
    struct Current {
        target_sha256: String,
        talents: Vec<EffectDescriptor>,
    }
    #[derive(serde::Deserialize)]
    struct EffectDescriptor {
        key: String,
        name: String,
        icon: String,
        effects: Vec<Payload>,
    }
    #[derive(serde::Deserialize)]
    struct TreeCatalog { trees: Vec<Tree> }
    #[derive(serde::Deserialize)]
    struct Tree { talents: Vec<TreeEntry> }
    #[derive(serde::Deserialize)]
    struct TreeEntry {
        key: String,
        description: String,
    }
    let current: Current = serde_json::from_str(include_str!(
        "../../assets/warlock-effects-0.112.0.json"
    )).expect("current Warlock effects");
    assert_eq!(current.target_sha256,
        "dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a");
    let tree_catalog: TreeCatalog = serde_json::from_str(include_str!(
        "../../assets/warlock-talents-0.112.0.json"
    )).expect("current Warlock tree ownership");
    *talents = current.talents.into_iter().map(|talent| {
        let (index, entry) = tree_catalog.trees.iter().enumerate().find_map(|(index, tree)| {
            tree.talents.iter().find(|entry| entry.key == talent.key)
                .map(|entry| (index, entry))
        }).expect("Warlock effect descriptor has a current tree entry");
        let (name, description) = if talent.key == PACT_KEY {
            (PACT_NAME.into(), PACT_DESCRIPTION.into())
        } else {
            (talent.name, entry.description.clone())
        };
        Talent {
            key: talent.key,
            name,
            icon: talent.icon,
            description,
            tree_index: index as u8,
            effects: talent.effects,
        }
    }).collect();
}

/// Current 145925d75..145925da8 uses the ordinary Battle Shout aura
/// composition. Rank power, spell-power and the removed haste lane do not enter
/// the payload. The demon consumer applies current buff power exactly once.
pub fn empowerment_effect(
    instance: &crate::player_abilities::RuntimeInstance<'_>,
) -> Option<crate::player_abilities::StatusEffect> {
    if instance.definition.key != "demonic_empowerment" {
        return None;
    }
    Some(crate::player_abilities::StatusEffect {
        tag: 10,
        value: instance.definition.effect.value * instance.effect_multiplier,
        duration: 0.0,
    })
}
