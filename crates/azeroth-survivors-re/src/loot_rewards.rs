//! Hash-bound 0.100.1 cache choice and jewelry arithmetic.
//!
//! Native owners: cache candidates/selection1454f3ed0; jewelry increment
//!145424420..145424a82; amulet description scaling1454251d0.
//! This source requires the actual run inventory, exclusions and shared RNG.
//! The amulets companion contains current definitions and category expansion.
//! Live application, UI and scheduling are supplied by gameplay/mechanics.
//! See docs/analysis/treasure-pipeline-0.100.1.md for current integration limits.

pub mod amulets;
#[path = "loot_rewards/catalog_01120.rs"]
mod catalog;
pub mod prose;
pub use catalog::{AMULET_STEPS, JEWELRY, RARITY_MULTIPLIERS};
pub const SEAL_OF_THE_DAMNED_TICK_CAP: f32 = 1.0;

use crate::treasure_chests::NativeRng;

pub const TARGET_VERSION: &str = "0.100.1";
pub const TARGET_SHA256: &str = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b";

/// Account discovery counts the jewelry and amulets listed in the Codex.
pub fn codex_keys() -> impl Iterator<Item = &'static str> {
    JEWELRY.iter().map(|entry| entry.key)
        .chain(amulets::catalog().shared.iter().map(|entry| entry.key.as_str()))
        .chain(amulets::codex_legendary().iter().map(|(_, entry)| entry.key.as_str()))
}

pub fn item_rank_suffix(rank: u32) -> &'static str {
    const SUFFIXES: [&str; 11] = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"];
    SUFFIXES.get(rank as usize).copied().unwrap_or("X+")
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct JewelryDefinition {
    pub key: &'static str,
    pub name: &'static str,
    pub icon: &'static str,
    pub description: &'static str,
    pub base: f32,
    /// Stable source tag. Current native tag 6 is source 19 (Mystaria);
    /// native tags 7..19 map to source 6..18. See jewelry-0.112.0.md.
    pub tag: u8,
    /// Native +0x45: zero is a ring, one a trinket.
    pub slot: u8,
}

impl JewelryDefinition {
    pub fn by_key(key: &str) -> Option<&'static Self> {
        JEWELRY.iter().find(|definition| definition.key == key)
    }

    /// The numeric increment helper's cap. Several current tags deliberately
    /// have positive infinity here: do not impose the older five-pick ceiling.
    pub fn value_cap(&self) -> f32 {
        match self.tag {
            0..=5 | 7 | 19 => f32::INFINITY,
            6 | 14 | 17 => self.base * 3.0,
            8 => 0.6,
            18 => self.base * 10.0,
            _ => self.base * 5.0,
        }
    }

    /// Cache eligibility has a separate 90%-of-cap cutoff, computed as two
    /// scalar multiplications. Soulstone is governed by live remaining lives.
    pub fn offering_ceiling(&self) -> f32 {
        match self.tag {
            0..=5 | 7 | 19 => f32::INFINITY,
            6 | 14 | 17 => (3.0 * self.base) * 0.9,
            8 => f32::from_bits(0x3f0a_3d71), // native 0.54, not 0.6 * 0.9
            18 => (10.0 * self.base) * 0.9,
            _ => (5.0 * self.base) * 0.9,
        }
    }

    ///145424420: return the amount a pick adds, rather than the new total.
    /// The owning application must apply the result and its native state change.
    pub fn increment(&self, rarity: usize, existing: Option<JewelryValue>) -> f32 {
        if self.tag == 15 {
            return if rarity >= 3 { 2.0 } else { 1.0 };
        }
        let current = existing.map_or(0.0, |value| value.value);
        let initial_bonus = if existing.is_some() { 1.0 } else { 1.5 };
        let raw = (RARITY_MULTIPLIERS[rarity.min(4)] * self.base) * initial_bonus;
        let remaining = (self.value_cap() - current).max(0.0);
        if matches!(self.tag, 0 | 1 | 3 | 4 | 7 | 8) {
            let denominator = existing.map_or(1.0, |value| 1.0 + value.upgrades as f32 * 0.08);
            return (raw / denominator).min(remaining);
        }
        if matches!(self.tag, 2 | 5 | 19) {
            // The native compiler unrolls these 16 small integration steps.
            // The transition at three base values changes the growth curve;
            // it does not create a hard ceiling.
            let threshold = self.base * 3.0;
            let step = raw * 0.0625;
            let mut total = current;
            for _ in 0..16 {
                let growth = if threshold >= total {
                    1.0 + (-0.75 * total) / threshold
                } else {
                    let ratio = threshold / total;
                    (ratio * ratio) * 0.25
                };
                total += step * growth;
            }
            return total - current;
        }
        ((raw * remaining) / self.value_cap()).min(remaining)
    }

    pub fn awarded_increment(
        &self,
        rarity: usize,
        existing: Option<JewelryValue>,
        remaining_lives: u32,
    ) -> f32 {
        let amount = self.increment(rarity, existing);
        if self.tag == 15 {
            amount.min(2_u32.saturating_sub(remaining_lives) as f32)
        } else {
            amount
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct JewelryValue {
    pub value: f32,
    pub upgrades: u32,
}

#[derive(Clone, Copy, Debug)]
pub struct WornJewelry<'a> {
    pub definition: &'a JewelryDefinition,
    pub value: JewelryValue,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct JewelryItem {
    pub definition: &'static JewelryDefinition,
    pub rarity: usize,
    /// Native +0x10 value and +0x14 pick count; a fresh item starts at one.
    pub value: JewelryValue,
}

impl JewelryItem {
    pub fn worn(&self) -> WornJewelry<'_> {
        WornJewelry {
            definition: self.definition,
            value: self.value,
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct JewelryChange {
    pub index: usize,
    pub added: f32,
    pub new_item: bool,
    pub lives_added: u32,
}

/// Apply the confirmed inventory arm of1454f6270: increment call1454f6d1f,
/// live soulstone clamp1454f6d3d, existing item update1454f6de5 and new item
/// append1454f6e3c. Offer eligibility is the separate
/// earlier owner; this function does not recheck slots or introduce a reroll.
/// The caller must perform the native stat/UI/choice-completion stages afterward.
pub fn apply_jewelry(
    items: &mut Vec<JewelryItem>,
    remaining_lives: &mut u32,
    key: &str,
    rarity: usize,
) -> Option<JewelryChange> {
    let definition = JewelryDefinition::by_key(key)?;
    let existing = items.iter().position(|item| item.definition.key == key);
    let added = definition.awarded_increment(
        rarity,
        existing.map(|index| items[index].value),
        *remaining_lives,
    );
    let mut lives_added = 0;
    if definition.tag == 15 {
        lives_added = added as u32;
        *remaining_lives = remaining_lives.wrapping_add(lives_added);
    }
    let new_item = existing.is_none();
    let index = if let Some(index) = existing {
        let item = &mut items[index];
        item.value.value += added;
        item.value.upgrades = item.value.upgrades.wrapping_add(1);
        item.rarity = item.rarity.max(rarity);
        index
    } else {
        let index = items.len();
        items.push(JewelryItem {
            definition,
            rarity,
            value: JewelryValue {
                value: added,
                upgrades: 1,
            },
        });
        index
    };
    Some(JewelryChange {
        index,
        added,
        new_item,
        lives_added,
    })
}

/// The owning amulet definition/effect decoder supplies the actual payload.
/// A generic payload preserves recovered bytes or typed effects without
/// inventing effect variants in the inventory mutation layer.
#[derive(Clone, Debug, PartialEq)]
pub struct AmuletItem<T> {
    pub key: String,
    pub rarity: usize,
    pub picks: u32,
    pub payload: T,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum AmuletChange {
    Replaced,
    Empowered,
}

/// Accepted-reward owner1454f6270: same key empowers the currently worn amulet,
/// preserving its rarity and payload. A different key replaces the whole item.
/// The caller refreshes the live equipped effects after either path.
pub fn apply_amulet<T>(worn: &mut Option<AmuletItem<T>>, chosen: AmuletItem<T>) -> AmuletChange {
    if let Some(current) = worn.as_mut().filter(|item| item.key == chosen.key) {
        current.picks = current.picks.wrapping_add(1);
        AmuletChange::Empowered
    } else {
        *worn = Some(chosen);
        AmuletChange::Replaced
    }
}

/// Stable source projection of the ability fields used by reward eligibility.
/// Effect tags retain their source meaning: current native immunity12 and
/// reflection13 are source11 and12. Do not pass unconverted raw native tags.
#[derive(Clone, Copy, Debug)]
pub struct AbilityEligibility {
    pub native_kind_at_117: u8,
    pub native_subtype_at_104: u32,
}

impl AbilityEligibility {
    pub fn enables_war_horn(self) -> bool {
        self.native_kind_at_117 == 9 && matches!(self.native_subtype_at_104, 7 | 8 | 9 | 10 | 12)
    }

    pub fn enables_seal_damned(self) -> bool {
        self.native_kind_at_117 == 6
    }
}

/// Run input to native cache candidate generation. No default creates a fake
/// inventory or silently assigns ability predicates.
pub struct CacheInventory<'a> {
    pub worn: &'a [WornJewelry<'a>],
    pub excluded_keys: &'a [&'a str],
    pub base_ability: AbilityEligibility,
    pub learned_abilities: &'a [AbilityEligibility],
    pub remaining_lives: u32,
    pub has_amulet: bool,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum CacheSeed<'a> {
    Jewelry(&'a JewelryDefinition),
    NewAmulet,
    EmpowerAmulet,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct WeightedSeed<'a> {
    pub weight: f32,
    pub seed: CacheSeed<'a>,
}

///1454f3ed0: ordered candidates, before any RNG draw.
pub fn cache_candidates<'a>(inventory: &CacheInventory<'a>) -> Vec<WeightedSeed<'a>> {
    let counts = [
        inventory
            .worn
            .iter()
            .filter(|item| item.definition.slot == 0)
            .count(),
        inventory
            .worn
            .iter()
            .filter(|item| item.definition.slot != 0)
            .count(),
    ];
    let has_horn_spell = inventory.base_ability.enables_war_horn()
        || inventory
            .learned_abilities
            .iter()
            .any(|ability| ability.enables_war_horn());
    // This predicate scans learned spells only, matching the original loop.
    let has_seal_spell = inventory
        .learned_abilities
        .iter()
        .any(|ability| ability.enables_seal_damned());
    let mut candidates = Vec::new();
    for definition in &JEWELRY {
        if inventory.excluded_keys.contains(&definition.key) {
            continue;
        }
        let existing = inventory
            .worn
            .iter()
            .find(|item| item.definition.key == definition.key);
        let weight = if let Some(item) = existing {
            let available = if definition.tag == 15 {
                inventory.remaining_lives < 2
            } else {
                definition.offering_ceiling() > item.value.value
            };
            if !available {
                continue;
            }
            2.0
        } else {
            if (definition.tag == 16 && !has_horn_spell)
                || (definition.tag == 18 && !has_seal_spell)
                || counts[usize::from(definition.slot != 0)] > 1
            {
                continue;
            }
            0.5
        };
        candidates.push(WeightedSeed {
            weight,
            seed: CacheSeed::Jewelry(definition),
        });
    }
    candidates.push(WeightedSeed {
        weight: 2.5,
        seed: CacheSeed::NewAmulet,
    });
    if inventory.has_amulet {
        candidates.push(WeightedSeed {
            weight: 1.0,
            seed: CacheSeed::EmpowerAmulet,
        });
    }
    candidates
}

///1454f4629: choose up to three distinct seeds using the real shared RNG.
/// Native ordered removal, summation order and strict boundary are preserved.
/// Amulet expansion and rarity draws run *after all three* seed draws.
pub fn draw_cache_seeds<'a>(
    inventory: &CacheInventory<'a>,
    rng: &mut NativeRng,
) -> Vec<CacheSeed<'a>> {
    let mut candidates = cache_candidates(inventory);
    let mut selected = Vec::new();
    for _ in 0..3 {
        if candidates.is_empty() {
            break;
        }
        let total = candidates
            .iter()
            .fold(-0.0_f32, |sum, candidate| sum + candidate.weight);
        let mut draw = rng.range_f32(0.0, total.max(f32::MIN_POSITIVE));
        let mut index = candidates.len() - 1;
        for (at, candidate) in candidates.iter().enumerate() {
            if draw < candidate.weight {
                index = at;
                break;
            }
            draw -= candidate.weight;
        }
        selected.push(candidates.remove(index).seed);
    }
    selected
}

///1454f489b/1454f4954: native cache rarity distribution. `run_rarity` is
/// Game+0x49c; `level` is Game+0x410; caller bonus is the choice source parameter.
pub fn rarity_weights(run_rarity: f32, level: u32, source_bonus: f32, amulet: bool) -> [f32; 5] {
    let level_bonus = (level as f32 * 0.01).min(0.3);
    let bonus = if amulet {
        0.5 + source_bonus
    } else {
        source_bonus
    };
    let strength = ((run_rarity + 1.0) + level_bonus) + bonus;
    let squared = strength * strength;
    [
        60.0,
        strength * 25.0,
        squared * 10.0,
        (strength * squared) * 4.0,
        squared * squared,
    ]
}

pub fn roll_rarity(weights: [f32; 5], rng: &mut NativeRng) -> usize {
    // Native assembly adds uncommon+common, then rare/epic/legendary.
    let total = (((weights[1] + weights[0]) + weights[2]) + weights[3]) + weights[4];
    let mut draw = rng.range_f32(0.0, total);
    for (rarity, weight) in weights.into_iter().enumerate() {
        if draw < weight {
            return rarity;
        }
        draw -= weight;
    }
    0 // Native's exhausted-range fallback, including float boundary rounding.
}

/// Native card fallback is one gold card when the constructed list has fewer
/// than three cards; it does not fill every empty slot with a second gold card.
pub fn fallback_gold(current_cache_price: u32) -> u32 {
    (current_cache_price >> 1).max(60)
}

/// Current 1458a1550: pick count one is the initial item. Native first
/// saturates unsigned subtraction, then converts the result as signed i32.
/// Host powf has not been established bit-identical to the Windows CRT.
pub fn amulet_effect_multiplier(rarity: usize, picks: u32) -> f32 {
    let exponent = picks.saturating_sub(1) as i32 as f32;
    let retention = 1.0 + AMULET_STEPS[rarity.min(4)] * -0.5;
    3.0 - 2.0 * retention.powf(exponent)
}

/// Current 1458a0e10 uses one wrapping increment before the same exponent rule to
/// describe the next empowerment. Actual repeated-item mutation increments
/// only the pick count, then the stat owner consumes that count.
pub fn next_amulet_effect_multiplier(rarity: usize, picks: u32) -> f32 {
    amulet_effect_multiplier(rarity, picks.wrapping_add(1))
}
