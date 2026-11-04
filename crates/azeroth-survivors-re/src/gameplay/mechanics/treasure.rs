//! Current-target cache expansion and accepted-reward ownership.
//!
//! 0.100.1 generation1454f3ed0 and shared selection owner1454f6270.
//! The same run RNG, purse, learned spells and stat compositor are used by
//! ordinary play. Offers remain separate from inventory until accepted.

use super::{Mechanics, RunChoice};
use azeroth_survivors_re::{
    loot_rewards::{self as native, amulets},
    player_abilities::AbilityDefinition,
};

#[derive(Clone, Copy, Debug)]
pub enum TreasureChoice {
    Jewelry {
        definition: &'static native::JewelryDefinition,
        rarity: usize,
    },
    Amulet {
        definition: &'static amulets::Definition,
        rarity: usize,
        picks: u32,
    },
    Gold {
        amount: u32,
        rarity: usize,
    },
}

impl TreasureChoice {
    pub fn key(&self) -> &'static str {
        match self {
            Self::Jewelry { definition, .. } => definition.key,
            Self::Amulet { definition, .. } => definition.key.as_str(),
            Self::Gold { .. } => "",
        }
    }
    pub fn rarity(&self) -> usize {
        match *self {
            Self::Jewelry { rarity, .. }
            | Self::Amulet { rarity, .. }
            | Self::Gold { rarity, .. } => rarity,
        }
    }
    fn display_choice(self) -> RunChoice {
        let (label, icon, gold) = match self {
            Self::Jewelry { definition, .. } => (definition.name, definition.icon, 0),
            Self::Amulet { definition, .. } =>
                (definition.name.as_str(), definition.icon.as_str(), 0),
            Self::Gold { amount, .. } => ("A Pouch of Gold", "", amount),
        };
        RunChoice {
            label: label.to_owned(),
            ability_key: self.key(),
            icon,
            rarity: self.rarity(),
            upgrades: Vec::new(),
            gold,
        }
    }
}

#[derive(Debug, Default)]
pub(super) struct TreasureState {
    pub(super) jewelry: Vec<native::JewelryItem>,
    pub(super) amulet: Option<native::AmuletItem<&'static amulets::Definition>>,
    remaining_lives: u32,
    offers: Vec<TreasureChoice>,
    /// Native choice source2 has its own pending counter and rarity bonus.
    guardian: bool,
}

impl Mechanics {
    /// Selected14591d4c0 destroys active choice rows and resets their source.
    /// Earned stored levels and purchased pending rewards remain run counters.
    pub(super) fn discard_choice_offers(&mut self) {
        self.choices.clear();
        self.treasure_state.offers.clear();
        self.choice_state.world_paused = false;
    }
    pub fn jewelry(&self) -> &[native::JewelryItem] {
        &self.treasure_state.jewelry
    }
    pub fn worn_amulet(&self) -> Option<&native::AmuletItem<&'static amulets::Definition>> {
        self.treasure_state.amulet.as_ref()
    }
    pub fn remaining_lives(&self) -> u32 {
        self.treasure_state.remaining_lives
    }
    pub fn consume_life(&mut self) -> bool {
        if self.treasure_state.remaining_lives == 0 {
            return false;
        }
        self.treasure_state.remaining_lives -= 1;
        true
    }
    /// Cache and guardian equipment offers share the native display/accept path.
    pub fn cache_choices_active(&self) -> bool {
        !self.treasure_state.offers.is_empty()
    }
    pub fn guardian_choices_active(&self) -> bool {
        self.cache_choices_active() && self.treasure_state.guardian
    }
    pub fn cache_reward(&self, index: usize) -> Option<&TreasureChoice> {
        self.treasure_state.offers.get(index)
    }

    /// Cache, guardian and earned/stored level counters are independent.
    /// Selection is transactional: invalid indices mutate neither inventory nor
    /// counters. Shared completion runs after the actual effect refresh.
    pub(super) fn choose_cache_reward(&mut self, index: usize) -> bool {
        let pending = if self.treasure_state.guardian {
            self.pending_guardian_jewelry()
        } else {
            self.pending_cache_choices()
        };
        if self.dead || self.completed || pending == 0 {
            return false;
        }
        let Some(reward) = self.treasure_state.offers.get(index).copied() else {
            return false;
        };
        match reward {
            TreasureChoice::Jewelry { definition, rarity } => {
                let state = &mut self.treasure_state;
                native::apply_jewelry(&mut state.jewelry, &mut state.remaining_lives,
                    definition.key, rarity).expect("source-owned jewelry key");
            }
            TreasureChoice::Amulet { definition, rarity, picks } => {
                native::apply_amulet(&mut self.treasure_state.amulet, native::AmuletItem {
                    key: definition.key.clone(), rarity, picks, payload: definition,
                });
            }
            TreasureChoice::Gold { amount, .. } => {
                self.credit_pickup_gold(amount);
            }
        }
        self.refresh_effects();
        self.complete_treasure_choice();
        true
    }

    pub(super) fn complete_treasure_choice(&mut self) {
        if self.treasure_state.guardian {
            self.finish_guardian_jewelry_choice();
        } else {
            self.chest_state.system.pending_choices = self.chest_state.system.pending_choices.saturating_sub(1);
        }
        self.treasure_state.offers.clear();
        self.complete_choice();
    }

    /// Native reroll/banish retains the current source and its pending counter.
    pub(super) fn regenerate_active_choices(&mut self) {
        let treasure = self.cache_choices_active();
        let guardian = self.treasure_state.guardian;
        self.choices.clear();
        if treasure {
            self.treasure_state.offers.clear();
            self.generate_treasure_choices(guardian);
        } else {
            self.generate_level_choices();
        }
    }

    /// Called by the shared completion scheduler and by the purchase adapter.
    /// Native weighted category draws all precede rarity/amulet expansion.
    pub(super) fn generate_cache_choices(&mut self) {
        self.generate_treasure_choices(false);
    }

    pub(super) fn generate_guardian_choices(&mut self) {
        self.generate_treasure_choices(true);
    }

    fn generate_treasure_choices(&mut self, guardian: bool) {
        let pending = if guardian {
            self.pending_guardian_jewelry()
        } else {
            self.pending_cache_choices()
        };
        if self.is_showcase() || pending == 0 || !self.choices.is_empty()
            || self.dead || self.completed {
            return;
        }
        let worn: Vec<_> = self.treasure_state.jewelry.iter().map(|item| item.worn()).collect();
        let excluded: Vec<_> = self.choice_state.controls.banished_keys.iter()
            .map(String::as_str).collect();
        let learned: Vec<_> = self.abilities.iter().map(|row| row.definition).collect();
        let eligibility = |definition: &AbilityDefinition| native::AbilityEligibility {
            native_kind_at_117: definition.kind,
            native_subtype_at_104: definition.effect.tag,
        };
        let learned_eligibility: Vec<_> = learned.iter().map(|row| eligibility(row)).collect();
        let base_ability = self.racial.as_ref().map(|row| eligibility(row.definition))
            .unwrap_or(native::AbilityEligibility {
                native_kind_at_117: 0, native_subtype_at_104: 0,
            });
        let inventory = native::CacheInventory {
            worn: &worn, excluded_keys: &excluded, base_ability,
            learned_abilities: &learned_eligibility,
            remaining_lives: self.treasure_state.remaining_lives,
            has_amulet: self.treasure_state.amulet.is_some(),
        };
        let context = amulets::CacheContext {
            learned: &learned,
            worn_amulet: self.treasure_state.amulet.as_ref(),
            run_rarity: self.stats.luck_bonus,
            level: self.level,
            source_bonus: if guardian {
                azeroth_survivors_re::guardians::rewards::GUARDIAN_JEWELRY_CHOICE.generation_parameter
            } else {
                0.0
            },
            current_cache_price: self.cache_price(),
        };
        let offers = amulets::draw_cache_rewards(amulets::catalog(), &inventory, &context, &mut self.rng)
            .into_iter().map(|offer| match offer {
                amulets::CacheReward::Jewelry { definition, rarity } =>
                    TreasureChoice::Jewelry {
                        definition: native::JewelryDefinition::by_key(definition.key)
                            .expect("source-owned jewelry key"), rarity,
                    },
                amulets::CacheReward::Amulet { definition, rarity, picks } =>
                    TreasureChoice::Amulet {
                        definition: amulets::catalog().by_key(&definition.key)
                            .expect("source-owned amulet key"), rarity, picks,
                    },
                amulets::CacheReward::Gold { amount, rarity } =>
                    TreasureChoice::Gold { amount, rarity },
            }).collect::<Vec<_>>();
        // Current 14595d7bb..14595d970 records every displayed jewelry/amulet
        // offer, before acceptance. Gold and ordinary ability cards are skipped;
        // the existing live save adapter merges maximum quality by key.
        self.effect_state.seen.extend(offers.iter().filter_map(|offer| match offer {
            TreasureChoice::Jewelry { definition, rarity } => Some((definition.key.to_owned(), *rarity as u8)),
            TreasureChoice::Amulet { definition, rarity, .. } => Some((definition.key.clone(), *rarity as u8)),
            TreasureChoice::Gold { .. } => None,
        }));
        self.choices = offers.iter().copied().map(TreasureChoice::display_choice).collect();
        self.treasure_state.offers = offers;
        self.treasure_state.guardian = guardian;
        self.choice_state.offer = self.choice_state.offer.wrapping_add(1);
        self.pause_choice_movements();
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use super::super::{RunPlayerStats, RunRules};

    fn game() -> Mechanics {
        Mechanics::new("elwynn", "warrior", RunRules { heroic_rank: 0,
            difficulty: 1.0, density_percent: 100, hp_percent: 100,
            damage_percent: 100, speed_percent: 100, endless: false,
        }, RunPlayerStats {
            maximum_health: 100.0, health_per_level: 9.0, health_multiplier: 1.0,
            regeneration: 0.0, pickup_radius: 5.0, luck_bonus: 0.0, heal_on_kill: 0.0,
            armor_fraction: 0.0, damage_reduction: 0.0, damage_multiplier: 1.0,
            cooldown_multiplier: 1.0, critical_chance: 0.0, critical_multiplier: 1.5,
            experience_multiplier: 1.0, gold_multiplier: 1.0, native_race: 1,
            packed_player_field: 0x0101,
        }, [1, 2, 3, 4]).unwrap()
    }

    fn offer(game: &mut Mechanics, reward: TreasureChoice) {
        game.chest_state.system.pending_choices += 1;
        game.choices = vec![reward.display_choice()];
        game.treasure_state.offers = vec![reward];
    }

    #[test]
    fn every_generated_offer_advances_identity_including_wrap_and_reroll() {
        let mut game = game();
        game.choice_state.offer = u32::MAX;
        game.pending_levels = 2;
        game.generate_level_choices();
        assert!(!game.choices.is_empty());
        assert_eq!(game.choice_offer(), 0);
        assert!(game.reroll_choices());
        assert_eq!(game.choice_offer(), 1);
        game.discard_choice_offers();
        game.chest_state.system.pending_choices = 1;
        game.generate_cache_choices();
        assert_eq!(game.choice_offer(), 2);
        // Re-entering an already open offer does not allocate another identity.
        game.generate_cache_choices();
        assert_eq!(game.choice_offer(), 2);
    }

    #[test]
    fn cache_reroll_banish_and_skip_keep_their_source_and_use_the_current_cache_price() {
        let mut game = game();
        game.set_choice_grants(0, 1, true);
        game.gold = 100;
        game.chest_state.system.price = 400;
        offer(&mut game, TreasureChoice::Gold { amount: 60, rarity: 2 });
        assert!(!game.can_banish_choice(0));
        assert!(game.reroll_choices());
        assert_eq!((game.gold, game.pending_cache_choices()), (0, 1));
        assert!(game.cache_choices_active());
        assert!(!game.guardian_choices_active());
        let banish = (0..game.choices.len()).find(|index| game.can_banish_choice(*index)).unwrap();
        assert!(game.banish_choice(banish));
        assert_eq!((game.choice_footer().banishes, game.pending_cache_choices()), (0, 1));
        assert_eq!(game.choice_footer().skip_gold, Some(100));
        assert!(game.skip_choices());
        assert_eq!((game.gold, game.gold_earned, game.pending_cache_choices()), (100, 100, 0));
        assert!(!game.is_paused_for_choice());
        assert!(!game.choice_state.first_offer_seen);
        assert!(game.jewelry().is_empty() && game.worn_amulet().is_none());
    }

    #[test]
    fn equipment_banish_refuses_owned_upgrades_but_admits_new_equipment() {
        let mut game = game();
        game.set_choice_grants(3, 2, true);
        let ring = native::JewelryDefinition::by_key("accuria").unwrap();
        offer(&mut game, TreasureChoice::Jewelry { definition: ring, rarity: 0 });
        assert!(game.can_banish_choice(0));
        native::apply_jewelry(&mut game.treasure_state.jewelry,
            &mut game.treasure_state.remaining_lives, ring.key, 0).unwrap();
        assert!(!game.can_banish_choice(0));
        assert!(!game.banish_choice(0));
        let mark = amulets::catalog().by_key("mark_of_fordring").unwrap();
        game.treasure_state.offers[0] = TreasureChoice::Amulet { definition: mark, rarity: 0, picks: 1 };
        game.choices[0] = game.treasure_state.offers[0].display_choice();
        assert!(game.can_banish_choice(0));
        native::apply_amulet(&mut game.treasure_state.amulet, native::AmuletItem {
            key: mark.key.clone(), rarity: 0, picks: 1, payload: mark,
        });
        assert!(!game.can_banish_choice(0));
        assert!(!game.banish_choice(0));
        assert_eq!(game.choice_footer().banishes, 2);
    }

    #[test]
    fn cache_acceptance_updates_live_stats_without_spending_a_stored_level() {
        let mut game = game();
        game.set_store_levels(true);
        game.add_experience(5);
        assert_eq!(game.stored_levels(), 1);
        offer(&mut game, TreasureChoice::Jewelry {
            definition: native::JewelryDefinition::by_key("accuria").unwrap(), rarity: 2,
        });
        assert!(game.choose(0));
        assert_eq!(game.stored_levels(), 1);
        assert_eq!(game.pending_cache_choices(), 0);
        assert_eq!(game.jewelry().len(), 1);
        assert!(game.stats.damage_multiplier > 1.0);
        assert!(!game.choose(0), "a completed cache cannot deliver twice");
        assert_eq!(game.jewelry()[0].value.upgrades, 1);
    }

    #[test]
    fn mystaria_is_a_trinket_and_refreshes_health_and_armor_without_replacing_an_amulet() {
        let mut game = game();
        let mark = amulets::catalog().by_key("mark_of_fordring").unwrap();
        offer(&mut game, TreasureChoice::Amulet { definition: mark, rarity: 0, picks: 1 });
        assert!(game.choose(0));
        let definition = native::JewelryDefinition::by_key("star_of_mystaria").unwrap();
        offer(&mut game, TreasureChoice::Jewelry { definition, rarity: 0 });
        assert!(game.choose(0));
        assert_eq!(game.worn_amulet().unwrap().key, "mark_of_fordring");
        assert_eq!(game.jewelry()[0].definition.slot, 1);
        let value = game.jewelry()[0].value.value;
        assert_eq!(game.stats.health_multiplier.to_bits(), (1.0 + value).to_bits());
        assert_eq!(game.stats.armor_fraction.to_bits(), (value * 0.16).to_bits());
        game.treasure_state.jewelry[0].value.value = 2.0;
        game.refresh_effects();
        assert_eq!(game.stats.health_multiplier, 3.0);
        assert_eq!(game.stats.armor_fraction, 0.12);
    }

    #[test]
    fn displayed_cache_equipment_is_seen_before_acceptance_in_offer_order() {
        let mut game = game();
        game.effect_state.seen.clear();
        game.chest_state.system.pending_choices = 1;
        game.generate_cache_choices();
        let offered: Vec<_> = game.treasure_state.offers.iter().filter_map(|offer| match offer {
            TreasureChoice::Gold { .. } => None,
            _ => Some((offer.key().to_owned(), offer.rarity() as u8)),
        }).collect();
        assert!(!offered.is_empty());
        assert_eq!(game.seen_abilities(), offered.as_slice());
        assert!(game.jewelry().is_empty());
        assert!(game.worn_amulet().is_none());
        game.generate_cache_choices();
        assert_eq!(game.seen_abilities(), offered.as_slice(), "retaining an open offer does not record it twice");
    }

    #[test]
    fn amulet_empowerment_preserves_payload_then_replacement_recomputes_effects() {
        let mut game = game();
        let mark = amulets::catalog().by_key("mark_of_fordring").unwrap();
        offer(&mut game, TreasureChoice::Amulet { definition: mark, rarity: 0, picks: 1 });
        assert!(game.choose(0));
        let before = game.stats.damage_multiplier;
        offer(&mut game, TreasureChoice::Amulet { definition: mark, rarity: 4, picks: 99 });
        assert!(game.choose(0));
        let worn = game.worn_amulet().unwrap();
        assert_eq!((worn.rarity, worn.picks), (0, 2));
        assert!(std::ptr::eq(worn.payload, mark));
        assert!(game.stats.damage_multiplier > before);
        let talvash = amulets::catalog().by_key("talvash").unwrap();
        offer(&mut game, TreasureChoice::Amulet { definition: talvash, rarity: talvash.rarity, picks: 1 });
        assert!(game.choose(0));
        assert_eq!(game.stats.damage_multiplier, 1.0);
        assert!(game.stats.cooldown_multiplier < 1.0);
        assert_eq!(game.worn_amulet().unwrap().key, "talvash");
        let fresh = self::game();
        assert!(fresh.worn_amulet().is_none());
        assert!(fresh.jewelry().is_empty());
    }

    #[test]
    fn equal_descriptor_counts_can_shrink_the_generic_effect_suffix() {
        let mut game = game();
        game.configure_effects(&[("rampage".into(), 1)], &[]);
        let execute = amulets::catalog().by_key("legendary:execute").unwrap();
        let onyxia = amulets::catalog().by_key("onyxia_tooth").unwrap();
        assert_eq!(execute.effects.len(), onyxia.effects.len());
        offer(&mut game, TreasureChoice::Amulet {
            definition: execute, rarity: execute.rarity, picks: 1,
        });
        assert!(game.choose(0));
        let base = game.effect_state.equipped.generic_talent_count();
        let length = game.effect_state.equipped.rows.len();
        assert_eq!(base, 1);
        assert_eq!(length, base + 2);
        game.effect_state.generic.deadlines.fill(123.0);
        game.effect_state.generic.counters.fill(3);
        game.effect_state.generic.timestamps.fill(vec![0.1, 0.2]);
        game.effect_state.generic.temporary.entries = vec![
            azeroth_survivors_re::run_effects::actions::TemporaryStat {
                effect_index: 0, stacks: 2, expires: 100.0,
            },
            azeroth_survivors_re::run_effects::actions::TemporaryStat {
                effect_index: base, stacks: 3, expires: 100.0,
            },
        ];
        offer(&mut game, TreasureChoice::Amulet {
            definition: onyxia, rarity: onyxia.rarity, picks: 1,
        });
        assert!(game.choose(0));
        assert_eq!(game.worn_amulet().unwrap().key, "onyxia_tooth");
        assert_eq!(game.effect_state.equipped.rows.len(), base + 1);
        assert_eq!(game.effect_state.generic.deadlines.len(), base + 1);
        assert_eq!(game.effect_state.generic.counters.len(), base + 1);
        assert_eq!(game.effect_state.generic.timestamps.len(), base + 1);
        assert_eq!(game.effect_state.generic.deadlines[0], 123.0);
        assert_eq!(game.effect_state.generic.counters[0], 3);
        assert_eq!(game.effect_state.generic.timestamps[0], vec![0.1, 0.2]);
        assert!(game.effect_state.generic.deadlines[base..].iter().all(|v| *v == 0.0));
        assert!(game.effect_state.generic.counters[base..].iter().all(|v| *v == 0));
        assert!(game.effect_state.generic.timestamps[base..].iter().all(Vec::is_empty));
        assert_eq!(game.effect_state.generic.temporary.entries.len(), 1);
        assert_eq!(game.effect_state.generic.temporary.entries[0].effect_index, 0);
    }

    #[test]
    fn invalid_selection_preserves_pending_reward_and_gold_delivery_is_once() {
        let mut game = game();
        game.stats.gold_multiplier = 1.5;
        game.gold = 10;
        offer(&mut game, TreasureChoice::Gold { amount: 60, rarity: 2 });
        let rng_before = game.rng.words;
        assert!(!game.choose(3));
        assert_eq!((game.gold, game.gold_earned, game.pending_cache_choices()), (10, 0, 1));
        assert_eq!(game.rng.words, rng_before);
        assert!(game.choose(0));
        assert_eq!((game.gold, game.gold_earned, game.pending_cache_choices()), (100, 90, 0));
        assert!(!game.choose(0));
        assert_eq!((game.gold, game.gold_earned), (100, 90));
    }
}
