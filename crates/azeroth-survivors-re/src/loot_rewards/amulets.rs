//! Current native amulet definitions and the recovered pool/modifier stages.
//!
//! Constructors1454255d0/145425af0, pool145538080, exclusions145531520,
//! aggregate145451740 and spell modifiers145451c30. This module deliberately
//! retains generic passive tags for their actual consumers. A catalogue or
//! spell modifier result does not make the complete equipped-effect path ready.
//! All 129 retained definitions plus Legionlord were revalidated against the
//! selected 0.105.0 constructor/tables by recover-equipment-catalog-0.105.0.py.
//! Payloads retain the internal 30/31 stat/spell tags and historical pointer
//! provenance; selected native 35/36 variants have the same decoded values.

use std::sync::OnceLock;

use serde::Deserialize;

use crate::player_abilities::{AbilityDefinition, behavior::RuntimeInstance};
use crate::treasure_chests::NativeRng;

pub use super::prose::amulet_lines as description_lines;

#[derive(Debug, Deserialize)]
pub struct Catalog {
    pub target_sha256: String,
    pub generated: Vec<Definition>,
    pub shared: Vec<Definition>,
}

impl Catalog {
    pub fn by_key(&self, key: &str) -> Option<&Definition> {
        self.shared
            .iter()
            .chain(&self.generated)
            .find(|definition| definition.key == key)
    }
}

#[derive(Debug, Deserialize)]
pub struct Definition {
    pub ability_key: Option<String>,
    pub key: String,
    pub name: String,
    pub icon: String,
    pub rarity: usize,
    pub effects: Vec<EffectRecord>,
}

#[derive(Debug, Deserialize)]
pub struct EffectRecord {
    pub effect: Effect,
    /// Forensic words may contain original PE pointers. Runtime consumers must
    /// use decoded values and these owned strings, never dereference a word.
    pub raw_hex: String,
    pub strings: Vec<EffectString>,
}

#[derive(Debug, Deserialize)]
pub struct EffectString {
    pub offset: usize,
    pub value: String,
}

/// 0.100.1 iterator14554e050 and scalar leaf1454848a0..145484c07.
/// Scale only the variant's magnitude. Durations, chance selectors, proc limits
/// and rescue cooldowns are copied unchanged.
pub fn scaled_bytes(raw_hex: &str, factor: f32) -> [u8; 64] {
    scale_effect(raw_hex, factor, false)
}

fn scale_effect(raw_hex: &str, factor: f32, equipped_amulet: bool) -> [u8; 64] {
    assert_eq!(raw_hex.len(), 128, "native Effect64 record");
    let mut bytes = [0; 64];
    for (index, byte) in bytes.iter_mut().enumerate() {
        *byte = u8::from_str_radix(&raw_hex[index * 2..index * 2 + 2], 16)
            .expect("source-owned Effect64 hex");
    }
    let offset = match bytes[0] {
        0 | 2 | 3 | 4 | 5 | 7 | 11 | 13 | 15 | 16 | 17 | 18 | 22 | 30 => Some(4),
        // Current Enhancement damage fractions and proc payloads. Earthbreaker's
        // radius is stored independently. Tempest chance alone saturates.
        55..=58 => Some(4),
        61..=63 => Some(4),
        6 | 9 | 12 => Some(8),
        8 => Some(if bytes[8..12] == [255; 4] { 12 } else { 4 }),
        31 => Some(32),
        // Current native tags 49–53 copy the complete Shock necklace row.
        _ => None,
    };
    if let Some(offset) = offset {
        let base = f32::from_le_bytes(bytes[offset..offset + 4].try_into().unwrap());
        let mut amount = base * factor;
        if bytes[0] == 56 {
            amount = amount.min(1.0);
        }
        if bytes[0] == 61 {
            amount = amount.min(0.2);
        }
        if bytes[0] == 31 {
            match bytes[36] {
                1 => amount = amount.min(0.5),
                2 if equipped_amulet => amount = scale_target_bonus(base, factor),
                2 => amount = (amount + 0.0001).floor(),
                _ => {}
            }
        }
        bytes[offset..offset + 4].copy_from_slice(&amount.to_le_bytes());
    }
    bytes
}

fn scale_target_bonus(base: f32, factor: f32) -> f32 {
    let maximum = ((base * 3.0 - 0.001).ceil() - 1.0).max(0.0);
    (base * factor + 0.0001).floor().min(maximum)
}

pub(super) fn future_target_ranks(
    definition: &Definition,
    rarity: usize,
    picks: u32,
) -> Option<Vec<u32>> {
    let targets = definition
        .effects
        .iter()
        .filter_map(|record| match &record.effect {
            Effect::Spell { modifier: 2, amount_bits, .. } => Some(f32::from_bits(*amount_bits)),
            _ => None,
        })
        .collect::<Vec<_>>();
    if targets.is_empty() {
        return None;
    }
    let total_at = |factor| {
        targets.iter().fold(0u32, |total, &base| {
            total.wrapping_add(scale_target_bonus(base, factor) as u32)
        })
    };
    let mut factor = super::amulet_effect_multiplier(rarity, picks);
    let mut previous = total_at(factor);
    let mut ranks = Vec::new();
    for rank in (picks..2000).map(|rank| rank + 1) {
        if factor >= 3.0 {
            break;
        }
        factor = super::amulet_effect_multiplier(rarity, rank);
        let total = total_at(factor);
        if total > previous {
            ranks.push(rank);
            previous = total;
        }
    }
    Some(ranks)
}

pub const LEGIONLORD_KEY: &str = "legendary:demonic_empowerment";
pub(crate) const ABSORB_CAP_MODIFIER: u8 = 9;

/// Current 0.112.0 Legionlord uses the ordinary equipped-effect scaling
/// path, as The Eternal Talisman does. The native cooldown lane is modifier 1,
/// so the ordinary additive cooldown ceiling applies after effect scaling.
pub fn equipped_bytes(
    _definition: &Definition,
    record: &EffectRecord,
    rarity: usize,
    picks: u32,
) -> [u8; 64] {
    scale_effect(&record.raw_hex, super::amulet_effect_multiplier(rarity, picks), true)
}

/// The two numeric aggregate variants are decoded from native Effect64.
/// The other variants must reach their hit/timer/cast/stat consumers intact.
#[derive(Clone, Debug, Deserialize)]
#[serde(tag = "kind", rename_all = "snake_case")]
pub enum Effect {
    Stat {
        stat_tag: u8,
        amount_bits: u32,
    },
    Spell {
        selector: Selector,
        modifier: u8,
        amount_bits: u32,
    },
    Passive {
        tag: u8,
    },
}

/// The current 130 amulet definitions use these two native selectors. The
/// general evaluator also accepts school/kind/key-list selectors; those occur
/// in other producers and are outside this catalogue's decoded domain.
#[derive(Clone, Debug, Deserialize)]
#[serde(tag = "kind", rename_all = "snake_case")]
pub enum Selector {
    All,
    Key { key: String },
}

impl Selector {
    fn matches(&self, definition: &AbilityDefinition) -> bool {
        match self {
            Self::All => true,
            Self::Key { key } => key == definition.key,
        }
    }
}

pub fn catalog() -> &'static Catalog {
    static CATALOG: OnceLock<Catalog> = OnceLock::new();
    CATALOG.get_or_init(|| {
        let mut catalog: Catalog =
            serde_json::from_str(include_str!("../../assets/native-amulets-0.100.1.json"))
                .expect("source-owned current amulet catalogue");
        assert_eq!(catalog.target_sha256, super::TARGET_SHA256);
        #[derive(Deserialize)]
        struct Current {
            target_sha256: String,
            definition: Definition,
        }
        let current: Current =
            serde_json::from_str(include_str!("../../assets/legionlord-0.112.0.json"))
                .expect("selected Legionlord definition");
        assert_eq!(
            current.target_sha256,
            "dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a"
        );
        // 0.112.0 moves Mystaria to the jewelry table. Keep the historical
        // asset's provenance while exposing only the current shared pool.
        catalog.shared.retain(|row| row.key != "star_of_mystaria");
        catalog.generated.push(current.definition);
        // Installed 0.140.0 constructor 0x145deb11c..0x145deb286 keeps
        // Earthshaker independently constructible for Explosive Trap.
        catalog.generated.push(Definition {
            ability_key: Some("kill_command".into()),
            key: "legendary:kill_command".into(),
            name: "Heart of the Packlord".into(),
            icon: "INV_Jewelry_Necklace_AhnQiraj_03".into(),
            rarity: 4,
            effects: [
                (61, "3d0000009a99193e06000000000020410000a0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
                (62, "3e000000cdcccc3e0000c0400000a040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
                (63, "3f0000009a99993e0000c04000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
            ].into_iter().map(|(tag, raw_hex)| EffectRecord {
                effect: Effect::Passive { tag },
                raw_hex: raw_hex.into(),
                strings: vec![],
            }).collect(),
        });
        // Current generic constructor1458a1730 uses the current Soulfire name;
        // preserve the historical descriptor asset and unchanged collection key.
        catalog.generated.iter_mut().find(|row| row.key == "legendary:soul_fire")
            .expect("current Soulfire amulet").name = "Charm of the Fated Hour: Soulfire".into();
        // 0.140.0 constructor skips Inferno's keyed power lane before appending
        // the on-kill explosion. Keep the retained catalogue bytes historical.
        catalog
            .generated
            .iter_mut()
            .find(|row| row.key == "legendary:consecration")
            .expect("current Inferno amulet")
            .effects
            .retain(|row| !matches!(&row.effect, Effect::Spell { modifier: 0, .. }));
        // 0.140.0 replaces the direct absorb bonuses with modifier 9.
        // Cooldown reduction and the shield-triggered burst remain.
        for (key, amount) in [("legendary:pw_shield", 0.5_f32), ("legendary:ice_barrier", 1.0)] {
            let effects = &mut catalog.generated.iter_mut()
                .find(|row| row.key == key).expect("current shield Talisman").effects;
            effects.retain(|row| !matches!(row.effect, Effect::Spell { modifier: 6, .. }));
            let row = effects.iter_mut()
                .find(|row| matches!(row.effect, Effect::Spell { modifier: 0, .. }))
                .expect("historical Talisman absorb lane");
            let Effect::Spell { modifier, amount_bits, .. } = &mut row.effect else {
                unreachable!("recovered Talisman spell lane");
            };
            *modifier = ABSORB_CAP_MODIFIER;
            *amount_bits = amount.to_bits();
            row.raw_hex.replace_range(64..74, &format!(
                "{:08x}{ABSORB_CAP_MODIFIER:02x}", amount_bits.swap_bytes(),
            ));
        }
        #[derive(Deserialize)]
        struct Enhancement {
            target_sha256: String,
            definitions: Vec<Definition>,
        }
        let enhancement: Enhancement = serde_json::from_str(include_str!(
            "../../assets/enhancement-amulets-0.140.0.json"
        )).expect("current Enhancement legendary amulets");
        assert_eq!(
            enhancement.target_sha256,
            "27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9"
        );
        for definition in enhancement.definitions {
            if let Some(old) = catalog.generated.iter_mut().find(|row| row.key == definition.key) {
                *old = definition;
            } else {
                catalog.generated.push(definition);
            }
        }
        catalog
    })
}

/// Native order: shared definitions of the sampled rarity, then eligible
/// learned-spell legendaries when rarity 4 was sampled. The current worn key
/// and banished keys are removed while preserving the remaining order.
/// Selection and its shared-RNG draw are a later stage.
pub fn offering_pool<'a>(
    catalogue: &'a Catalog,
    rarity: usize,
    learned: &[&AbilityDefinition],
    worn_key: Option<&str>,
    banished_keys: &[&str],
) -> Vec<&'a Definition> {
    let mut pool: Vec<_> = catalogue
        .shared
        .iter()
        .filter(|definition| definition.rarity == rarity)
        .collect();
    if rarity == 4 {
        for ability in learned {
            // 0.140.0 0x146020620 skips these keys before the constructor.
            if matches!(ability.key, "lightning_shield" | "healing_wave" | "explosive_trap") {
                continue;
            }
            pool.push(
                catalogue
                    .generated
                    .iter()
                    .find(|definition| definition.ability_key.as_deref() == Some(ability.key))
                    .expect("each current definition has a native legendary amulet"),
            );
        }
    }
    pool.retain(|definition| {
        worn_key != Some(definition.key.as_str())
            && !banished_keys.contains(&definition.key.as_str())
    });
    pool
}

/// Current cache expansion uses the full64-bit RNG output and a rejection
/// zone. Even a one-element pool consumes draws; an empty filtered pool takes
/// fallback's first shared definition without drawing instead.
pub fn draw_new_amulet<'a>(
    catalogue: &'a Catalog,
    rarity: usize,
    learned: &[&AbilityDefinition],
    worn_key: Option<&str>,
    banished_keys: &[&str],
    rng: &mut NativeRng,
) -> &'a Definition {
    let pool = offering_pool(catalogue, rarity, learned, worn_key, banished_keys);
    if pool.is_empty() {
        return catalogue
            .shared
            .first()
            .expect("native first shared amulet");
    }
    let count = pool.len() as u64;
    let zone = (count << count.leading_zeros()).wrapping_sub(1);
    loop {
        let product = u128::from(rng.next_u64()) * u128::from(count);
        if product as u64 <= zone {
            return pool[(product >> 64) as usize];
        }
    }
}

/// The original category payload before presentation or application. Amulet
/// picks retain the current worn count for empowerment offers; the confirmed
/// repeated-key application owner increments it when the choice is accepted.
#[derive(Debug)]
pub enum CacheReward<'a> {
    Jewelry {
        definition: &'a super::JewelryDefinition,
        rarity: usize,
    },
    Amulet {
        definition: &'a Definition,
        rarity: usize,
        picks: u32,
    },
    Gold {
        amount: u32,
        rarity: usize,
    },
}

pub struct CacheContext<'a> {
    pub learned: &'a [&'a AbilityDefinition],
    pub worn_amulet: Option<&'a super::AmuletItem<&'a Definition>>,
    pub run_rarity: f32,
    pub level: u32,
    pub source_bonus: f32,
    pub current_cache_price: u32,
}

/// Native1454f3ed0: complete every weighted seed draw before any rarity or
/// amulet draw, then expand in selected order. A short result receives exactly
/// one rarity2 fallback-gold card. This produces actual category payloads;
/// it does not apply inventory, stats, passives, account state or completion.
pub fn draw_cache_rewards<'a>(
    catalogue: &'a Catalog,
    inventory: &super::CacheInventory<'a>,
    context: &CacheContext<'a>,
    rng: &mut NativeRng,
) -> Vec<CacheReward<'a>> {
    assert_eq!(inventory.has_amulet, context.worn_amulet.is_some());
    let selected = super::draw_cache_seeds(inventory, rng);
    let mut rewards = Vec::with_capacity(4);
    for seed in selected {
        match seed {
            super::CacheSeed::Jewelry(definition) => {
                let rarity = super::roll_rarity(
                    super::rarity_weights(
                        context.run_rarity,
                        context.level,
                        context.source_bonus,
                        false,
                    ),
                    rng,
                );
                rewards.push(CacheReward::Jewelry { definition, rarity });
            }
            super::CacheSeed::NewAmulet => {
                let rarity = super::roll_rarity(
                    super::rarity_weights(
                        context.run_rarity,
                        context.level,
                        context.source_bonus,
                        true,
                    ),
                    rng,
                );
                let definition = draw_new_amulet(
                    catalogue,
                    rarity,
                    context.learned,
                    context.worn_amulet.map(|item| item.key.as_str()),
                    inventory.excluded_keys,
                    rng,
                );
                rewards.push(CacheReward::Amulet {
                    definition,
                    rarity: definition.rarity,
                    picks: 1,
                });
            }
            super::CacheSeed::EmpowerAmulet => {
                let worn = context
                    .worn_amulet
                    .expect("native empowerment seed requires a worn amulet");
                rewards.push(CacheReward::Amulet {
                    definition: worn.payload,
                    rarity: worn.rarity,
                    picks: worn.picks,
                });
            }
        }
    }
    if rewards.len() < 3 {
        rewards.push(CacheReward::Gold {
            amount: super::fallback_gold(context.current_cache_price),
            rarity: 2,
        });
    }
    rewards
}

/// Native145451740: repeated stat tags add into the first matching row. Spell
/// modifiers and generic passives retain insertion order. Provenance strings
/// belong to the separate description layer and are not fabricated here.
#[derive(Clone, Debug, Default)]
pub struct Aggregate {
    pub stats: Vec<(u8, f32)>,
    pub spells: Vec<(Selector, u8, f32)>,
    pub passive_tags: Vec<u8>,
}

impl Aggregate {
    pub fn append(&mut self, effect: &Effect) {
        match effect {
            Effect::Stat {
                stat_tag,
                amount_bits,
            } => {
                let amount = f32::from_bits(*amount_bits);
                if let Some((_, value)) = self.stats.iter_mut().find(|(tag, _)| tag == stat_tag) {
                    *value += amount;
                } else {
                    self.stats.push((*stat_tag, amount));
                }
            }
            Effect::Spell {
                selector,
                modifier,
                amount_bits,
            } => {
                self.spells
                    .push((selector.clone(), *modifier, f32::from_bits(*amount_bits)));
            }
            Effect::Passive { tag } => self.passive_tags.push(*tag),
        }
    }

    /// This is an explicit completeness check for the numeric subset; callers
    /// must not use it as permission to discard the retained generic passives.
    pub fn has_unapplied_passives(&self) -> bool {
        !self.passive_tags.is_empty()
    }

    /// The modifier lanes are additive. This clamps cooldown to 0.4 and
    /// rounds the sum of target bonuses. Amounts must already have passed the
    /// native equipped-effect scaling stage for the current empowerment count.
    pub fn spell_modifiers(&self, definition: &AbilityDefinition) -> SpellModifiers {
        let mut result = SpellModifiers::default();
        let mut cooldown_reduction = 0.0f32;
        let mut targets = 0.0f32;
        for (selector, modifier, amount) in &self.spells {
            if !selector.matches(definition) {
                continue;
            }
            match *modifier {
                0 => result.power += amount,
                1 => cooldown_reduction += amount,
                2 => targets += amount,
                3 => result.area += amount,
                4 => result.duration += amount,
                5 => result.health_power += amount,
                6 => result.effect += amount,
                7 => result.healing += amount,
                ABSORB_CAP_MODIFIER => result.absorb_cap_bonus += amount,
                _ => unreachable!("unmapped amulet spell modifier"),
            }
        }
        result.cooldown = (1.0 - cooldown_reduction).max(0.4);
        result.targets = targets.round() as u32;
        result
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SpellModifiers {
    pub power: f32,
    pub cooldown: f32,
    pub targets: u32,
    pub area: f32,
    pub duration: f32,
    pub health_power: f32,
    pub effect: f32,
    pub healing: f32,
    pub absorb_cap_bonus: f32,
}

impl Default for SpellModifiers {
    fn default() -> Self {
        Self {
            power: 1.0,
            cooldown: 1.0,
            targets: 0,
            area: 1.0,
            duration: 1.0,
            health_power: 0.0,
            effect: 1.0,
            healing: 1.0,
            absorb_cap_bonus: 0.0,
        }
    }
}

impl SpellModifiers {
    /// Reward refresh overwrites the current modifier lanes, retaining
    /// learned rank/upgrades/remaining cooldown and ordinary multipliers.
    pub fn apply(self, instance: &mut RuntimeInstance<'_>) {
        instance.talent_power_multiplier = self.power;
        instance.talent_cooldown_multiplier = self.cooldown;
        instance.talent_target_bonus = self.targets;
        instance.talent_area_multiplier = self.area;
        instance.talent_duration_multiplier = self.duration;
        instance.health_power = self.health_power;
        instance.effect_multiplier = self.effect;
        instance.healing_multiplier = self.healing;
    }
}
