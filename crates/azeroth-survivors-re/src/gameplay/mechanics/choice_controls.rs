//! Selected 0.113.2 choice transactions:1459729a0,14596efc0,14596ee30.
//! See docs/analysis/as-ui-contracts-0.113.2-reward-controls.md. These controls use the same
//! candidate generator and run RNG as the initial offer. Account/talent grants
//! must populate extra counters explicitly; the native base grants three rerolls.

use super::{Mechanics, RunChoice, TreasureChoice};

#[derive(Debug)]
pub struct ChoiceControls {
    pub free_rerolls: u32,
    pub paid_rerolls: u32,
    pub banishes: u32,
    pub skip_enabled: bool,
    pub banished_keys: Vec<String>,
}

impl Default for ChoiceControls {
    fn default() -> Self {
        Self {
            free_rerolls: 3,
            paid_rerolls: 0,
            banishes: 0,
            skip_enabled: false,
            banished_keys: Vec::new(),
        }
    }
}

#[derive(Debug, Clone, Copy)]
pub struct ChoiceFooter {
    pub rerolls: u32,
    pub reroll_cost: u32,
    pub can_reroll: bool,
    pub banishes: u32,
    /// The native JSON displays the unmodified amount. The transaction applies
    /// the run's gold multiplier and roundf separately.
    pub skip_gold: Option<u32>,
}

///1459729a0 uses checked exponentiation and multiplication, saturating the
/// displayed/charged result to u32::MAX on overflow. A free reroll costs zero.
fn paid_cost(count: u32) -> u32 {
    3u32.checked_pow(count)
        .and_then(|power| power.checked_mul(100))
        .unwrap_or(u32::MAX)
}

/// Native145964f70: a learned-card key and its upgrade-card key differ. A
/// banished upgrade suppresses subsequent upgrade offers, retaining the spell.
pub(super) fn banish_key(choice: &RunChoice) -> Option<String> {
    if choice.gold != 0 || choice.ability_key.is_empty() {
        return None;
    }
    Some(if choice.upgrades.is_empty() {
        choice.ability_key.to_owned()
    } else {
        format!("rank:{}", choice.ability_key)
    })
}

impl Mechanics {
    fn choice_offer_active(&self) -> bool {
        !self.choices.is_empty() && !self.dead && !self.completed
    }

    /// The owning account/talent adapter can supply already-recovered grants.
    /// Calling this does not invent or calculate an account entitlement.
    pub fn set_choice_grants(&mut self, free_rerolls: u32, banishes: u32, skip_enabled: bool) {
        let state = &mut self.choice_state.controls;
        state.free_rerolls = free_rerolls;
        state.banishes = banishes;
        state.skip_enabled = skip_enabled;
    }

    pub fn choice_footer(&self) -> ChoiceFooter {
        let state = &self.choice_state.controls;
        let cost = if state.free_rerolls != 0 {
            0
        } else {
            paid_cost(state.paid_rerolls)
        };
        ChoiceFooter {
            rerolls: state.free_rerolls,
            reroll_cost: cost,
            can_reroll: self.choice_offer_active() && (state.free_rerolls != 0 || self.gold >= cost),
            banishes: state.banishes,
            skip_gold: state.skip_enabled.then_some((self.cache_price() >> 2).max(10)),
        }
    }

    pub fn can_banish_choice(&self, index: usize) -> bool {
        self.choice_offer_active()
            && self.choice_state.controls.banishes != 0
            && self.banish_choice_key(index).is_some()
    }

    fn banish_choice_key(&self, index: usize) -> Option<String> {
        // Current145964f70 refuses owned jewelry and the currently worn
        // amulet. Their upgrade/empower cards must remain available.
        match self.cache_reward(index) {
            Some(TreasureChoice::Jewelry { definition, .. })
                if self.jewelry().iter().any(|item| item.definition.key == definition.key) => return None,
            Some(TreasureChoice::Amulet { definition, .. })
                if self.worn_amulet().is_some_and(|item| item.key == definition.key) => return None,
            _ => {}
        }
        self.choices.get(index).and_then(banish_key)
    }

    pub fn reroll_choices(&mut self) -> bool {
        if !self.choice_footer().can_reroll {
            return false;
        }
        let state = &mut self.choice_state.controls;
        if state.free_rerolls != 0 {
            state.free_rerolls -= 1;
        } else {
            self.gold -= paid_cost(state.paid_rerolls);
            state.paid_rerolls = state.paid_rerolls.wrapping_add(1);
        }
        self.regenerate_active_choices();
        true
    }

    pub fn banish_choice(&mut self, index: usize) -> bool {
        if !self.can_banish_choice(index) {
            return false;
        }
        let key = self.banish_choice_key(index).unwrap();
        let state = &mut self.choice_state.controls;
        state.banishes -= 1;
        state.banished_keys.push(key);
        self.regenerate_active_choices();
        true
    }

    pub fn skip_choices(&mut self) -> bool {
        if !self.choice_offer_active() || !self.choice_state.controls.skip_enabled {
            return false;
        }
        // Both native Skip inputs award gold through the shared party queue.
        self.credit_pickup_gold((self.cache_price() >> 2).max(10));
        // Each source consumes its own counter before shared completion sweeps
        // XP, schedules the next offer or publishes the short resume aura.
        if self.cache_choices_active() {
            self.complete_treasure_choice();
        } else {
            self.pending_levels = self.pending_levels.saturating_sub(1);
            self.choice_state.first_offer_seen = true;
            self.complete_choice();
        }
        true
    }
}
