//! 0.97.2 level choices: native1454da5f0,1455452d0 and1454ded40.
//! Source/evidence: docs/analysis/playable-zone-entry-0.97.2.md.
//!
//! Candidate selection and rarity/type draws share the actual run RNG. The
//! native overlay companion owns card artwork/prose/localization. Account/save
//! producers of exclusion/first-card/luck fields remain separate.

use super::{Mechanics, RunChoice};
use azeroth_survivors_re::{
    loot_rewards,
    player_abilities::{
        behavior::targeting,
        upgrades::{self, UpgradeKind},
        AbilityDefinition,
    },
};

/// Native run inputs, explicit until their account/talent/banish owners attach.
/// Empty exclusions and zero luck are the neutral fresh-run state. These lists
/// do not automatically suppress every previously offered spell.
#[derive(Debug, Default)]
pub(super) struct ChoiceState {
    /// Current0.123.0 Game+cc4, incremented for every generated offer.
    pub offer: u32,
    pub controls: super::choice_controls::ChoiceControls,
    pub luck_bonus: f32,
    pub extra_first_card: bool,
    pub first_offer_seen: bool,
    pub banished_abilities: Vec<&'static str>,
    pub excluded_new: Vec<&'static str>,
    pub excluded_upgrades: Vec<&'static str>,
    /// Current Game+9ae/9af; storage and explicit draining are distinct flags.
    pub store_levels: bool,
    pub spend_levels: bool,
    /// Completion retains native choice phase2 while clearing displayed rows
    /// and crediting nearby XP, before its source-priority scheduler runs.
    pub completing: bool,
    pub last_position: Option<super::Position>,
}

#[derive(Clone, Copy)]
enum Candidate {
    Learn(&'static AbilityDefinition),
    Upgrade(usize),
}

struct Weighted {
    candidate: Candidate,
    weight: f32,
}

const RARITIES: [&str; 5] = ["Common", "Uncommon", "Rare", "Epic", "Legendary"];

impl Mechanics {
    pub fn choice_offer(&self) -> u32 { self.choice_state.offer }

    pub(super) fn generate_level_choices(&mut self) {
        if self.is_showcase() || self.pending_levels == 0 || self.pending_cache_choices() != 0
            || self.choice_state.completing || !self.choices.is_empty() || self.dead || self.completed {
            return;
        }
        let mut pool = Vec::new();
        if self.abilities.len() < 6 {
            let weight = if self.abilities.len() < 3 { 1.6 } else { 0.9 };
            for key in self.class.pool {
                if self.abilities.iter().any(|row| row.definition.key == *key)
                    || self.choice_state.controls.banished_keys.iter().any(|entry| entry == key)
                    || self.choice_state.banished_abilities.contains(key)
                    || self.choice_state.excluded_new.contains(key)
                    || (*key == "kill_command" && !self.pet_state.can_learn_kill_command())
                    || (*key == "demonic_empowerment" && !self.demon_state.config.enables_empowerment())
                    || (*key == "call_of_flame"
                        && !self.abilities.iter().any(|row| row.definition.kind == 10))
                {
                    continue;
                }
                if let Some(definition) = AbilityDefinition::by_key(key) {
                    pool.push(Weighted { candidate: Candidate::Learn(definition), weight });
                }
            }
        }
        for (index, instance) in self.abilities.iter().enumerate() {
            if self.choice_state.controls.banished_keys.iter().any(|entry| entry == &format!("rank:{}", instance.definition.key))
                || self.choice_state.excluded_upgrades.contains(&instance.definition.key)
                || upgrades::eligible_types(instance, self.current_cooldown_multiplier(), 4).is_empty()
            {
                continue;
            }
            pool.push(Weighted { candidate: Candidate::Upgrade(index), weight: 1.3 });
        }

        // Native completes every candidate draw before converting any selected
        // row into a card. Interleaving rarity draws would change the shared RNG.
        let count = if self.choice_state.extra_first_card && !self.choice_state.first_offer_seen {
            4
        } else {
            3
        };
        let mut selected = Vec::with_capacity(count);
        while selected.len() < count && !pool.is_empty() {
            let total = pool.iter().fold(-0.0f32, |sum, row| sum + row.weight);
            let mut draw = self.rng.range_f32(0.0, total.max(f32::MIN_POSITIVE));
            let mut picked = pool.len() - 1;
            for (index, row) in pool.iter().enumerate() {
                if row.weight > draw {
                    picked = index;
                    break;
                }
                draw -= row.weight;
            }
            selected.push(pool.remove(picked).candidate);
        }

        for candidate in selected {
            let luck = 1.0 + self.choice_state.luck_bonus + (self.level as f32 * 0.01).min(0.3);
            let squared = luck * luck;
            let weights = [60.0, luck * 25.0, squared * 10.0,
                           (luck * squared) * 4.0, squared * squared];
            let mut rarity = loot_rewards::roll_rarity(weights, &mut self.rng);
            match candidate {
                Candidate::Learn(definition) => {
                    self.choices.push(RunChoice {
                        label: format!("{} · Learn {}", RARITIES[rarity], definition.name),
                        ability_key: definition.key,
                        icon: definition.icon,
                        rarity,
                        upgrades: Vec::new(),
                        gold: 0,
                    });
                }
                Candidate::Upgrade(index) => {
                    let instance = &self.abilities[index];
                    let mut kinds = upgrades::eligible_types(instance, self.current_cooldown_multiplier(), rarity);
                    while kinds.is_empty() && rarity < 4 {
                        rarity += 1;
                        kinds = upgrades::eligible_types(instance, self.current_cooldown_multiplier(), rarity);
                    }
                    // Native14540ca10 matches the existing generic shuffle's
                    // high32 multiply/rejection and descending swap sequence.
                    targeting::shuffle(&mut kinds, &mut self.rng);
                    kinds.truncate(if rarity == 4 { 2 } else { 1 });
                    let upgrades_text = kinds.iter().map(|kind| kind_name(*kind)).collect::<Vec<_>>().join(" + ");
                    self.choices.push(RunChoice {
                        label: format!("{} · {} · {}", RARITIES[rarity], instance.definition.name, upgrades_text),
                        ability_key: instance.definition.key,
                        icon: instance.definition.icon,
                        rarity,
                        upgrades: kinds,
                        gold: 0,
                    });
                }
            }
        }
        // Native1454db08e..1454db0f8 supplies one25-gold choice if the final
        // candidate-to-card collection is empty, rather than a fabricated spell.
        if self.choices.is_empty() {
            self.choices.push(RunChoice {
                label: "25 gold".into(), ability_key: "", icon: "", rarity: 0,
                upgrades: Vec::new(), gold: 25,
            });
        }
        self.choice_state.offer = self.choice_state.offer.wrapping_add(1);
    }
}

fn kind_name(kind: UpgradeKind) -> &'static str {
    match kind {
        UpgradeKind::Power => "Power",
        UpgradeKind::Cooldown => "Cooldown",
        UpgradeKind::Targets => "Targets",
        UpgradeKind::Area => "Area",
        UpgradeKind::Duration => "Duration",
    }
}
