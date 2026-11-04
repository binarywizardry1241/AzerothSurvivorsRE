//! Numeric stat/spell composition and retained native effect payloads for 0.100.1.
//! The exact PE switch destinations are retained in run-effects/tables-and-payloads.json.
//! Generic milestone rows remain intact for their separate synchronous consumers.
use std::sync::OnceLock;
pub mod actions;
pub mod addon_timers;
pub mod conditions;
pub mod demon_effects;
pub mod demon_spells;
pub mod demon_talents;
pub mod demons;
pub mod forms;
pub mod healing;
pub mod milestones;
pub mod pet_power;
pub mod pet_tick;
pub mod loot_companions;
pub mod pets;
pub mod player_auras;
pub mod presentation;
pub mod weapon;
use crate::{
    loot_rewards::{
        SEAL_OF_THE_DAMNED_TICK_CAP,
        amulets::{self, SpellModifiers},
    },
    player_abilities::{
        AbilityDefinition,
        behavior::{
            incoming::LethalProtection, passive_tick::GearBounce, totem_passives::TalentEffect,
        },
    },
};
use serde::Deserialize;

pub const TARGET_SHA256: &str = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b";

/// Current actor-hit1454d8108..8258 consumes cast tokens before generic effects.
/// Failed/no-target casts still insert these tokens at the cast-owner entry.
pub fn hit_event(
    mut event: conditions::Event,
    effects_enabled: bool,
    first_tokens: &mut Vec<u32>,
    critical_tokens: &mut Vec<u32>,
) -> Option<conditions::Event> {
    if !effects_enabled || event.source_kind == 3 {
        return None;
    }
    fn consume(tokens: &mut Vec<u32>, spell: u32) -> bool {
        if let Some(index) = tokens.iter().position(|id| *id == spell) {
            tokens.swap_remove(index);
            true
        } else {
            false
        }
    }
    event.kind = u8::from(event.source_kind == 1);
    event.first_periodic = event.source_kind == 1 && event.first_periodic;
    event.first_hit =
        (event.source_kind == 0 || event.first_periodic) && consume(first_tokens, event.spell_id);
    event.first_critical =
        event.source_kind == 0 && event.critical && consume(critical_tokens, event.spell_id);
    Some(event)
}
#[derive(Debug)]
pub struct Catalog {
    target_sha256: String,
    pub classes: Vec<TalentClass>,
}
#[derive(Debug)]
pub struct TalentClass {
    pub id: u8,
    pub leech_bits: u32,
    pub talents: Vec<Talent>,
}
#[derive(Debug, Deserialize)]
pub struct Talent {
    pub key: String,
    pub name: String,
    pub icon: String,
    pub description: String,
    pub effects: Vec<Payload>,
}
#[derive(Debug, Deserialize)]
pub struct Payload {
    #[serde(alias = "payload")]
    raw_hex: String,
    strings: Vec<amulets::EffectString>,
    #[serde(default)]
    lists: Vec<KeyList>,
    #[serde(default)]
    rank_values: Vec<f32>,
}
type KeyList = crate::sets::NativeKeyList;
#[derive(Deserialize)]
struct SourceCatalog {
    target_sha256: String,
    classes: Vec<SourceClass>,
}
#[derive(Deserialize)]
struct SourceClass {
    id: u8,
    leech_bits: u32,
    trees: Vec<SourceTree>,
}
#[derive(Deserialize)]
struct SourceTree {
    talents: Vec<Talent>,
}
#[derive(Deserialize)]
struct WarriorReplacements {
    talents: Vec<Talent>,
}
#[derive(Deserialize)]
struct CurrentTalentReplacements {
    target_sha256: String,
    classes: std::collections::BTreeMap<u8, Vec<Talent>>,
}
pub fn catalog() -> &'static Catalog {
    static VALUE: OnceLock<Catalog> = OnceLock::new();
    VALUE.get_or_init(|| {
        let value: SourceCatalog = serde_json::from_str(include_str!("../assets/talents.json"))
            .expect("current native talent effects");
        assert_eq!(value.target_sha256, TARGET_SHA256);
        let mut replacements: CurrentTalentReplacements = serde_json::from_str(include_str!(
            "../assets/talent-replacements-0.140.0.json"
        ))
        .expect("current Priest and Hunter talent replacements");
        assert_eq!(
            replacements.target_sha256,
            "27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9",
        );
        Catalog {
            target_sha256: value.target_sha256,
            classes: value
                .classes
                .into_iter()
                .map(|class| TalentClass {
                    id: class.id,
                    // Selected 0.127.0 Mage descriptor14703cc68+88. Other
                    // class rows retain their independently recovered values.
                    leech_bits: if class.id == 8 { 0x3ba3d70a } else { class.leech_bits },
                    talents: {
                        let mut talents: Vec<_> = class
                            .trees
                            .into_iter()
                            .flat_map(|tree| tree.talents)
                            .collect();
                        let class_replacements = if class.id == 1 {
                            let warrior: WarriorReplacements = serde_json::from_str(include_str!(
                                "../assets/warrior-talents-0.112.0.json"
                            ))
                            .expect("recovered 0.112.0 Warrior replacements");
                            warrior.talents
                        } else {
                            replacements.classes.remove(&class.id).unwrap_or_default()
                        };
                        for replacement in class_replacements {
                            let talent = talents
                                .iter_mut()
                                .find(|talent| talent.key == replacement.key)
                                .expect("retained class talent save key");
                            *talent = replacement;
                        }
                        if class.id == 9 {
                            demon_talents::overlay(&mut talents);
                        }
                        talents
                    },
                })
                .collect(),
        }
    })
}
#[derive(Clone, Debug)]
pub struct EffectRow {
    pub bytes: [u8; 64],
    strings: &'static [amulets::EffectString],
    lists: &'static [KeyList],
}
impl EffectRow {
    /// Current145b38120 separates native37/38 into stat/spell lanes. Generic
    /// native24 is the new moving-ground selector, distinct from source24's
    /// historical extra-attempt payload. Keep its slot in generic effect order.
    pub fn armor_set(payload: &'static crate::sets::NativeEffect) -> Self {
        let mut bytes = payload.bytes();
        match bytes[0] {
            0..=23 | 70 => {}
            24 => {
                bytes[0] = 253;
                bytes[63] = 36;
            }
            37 => bytes[0] = 30,
            38 | 73 => bytes[0] = 31,
            42 => bytes[0] = 29,
            64 => {},
            tag => panic!("unsupported recovered armor-set effect variant {tag}"),
        }
        Self { bytes, strings: &payload.strings, lists: &payload.lists }
    }
    fn decode(hex: &str) -> [u8; 64] {
        assert_eq!(hex.len(), 128);
        std::array::from_fn(|i| {
            u8::from_str_radix(&hex[i * 2..i * 2 + 2], 16).expect("native effect hex")
        })
    }
    pub fn talent(payload: &'static Payload, rank: u8) -> Self {
        let mut value = Self {
            bytes: Self::decode(&payload.raw_hex),
            strings: &payload.strings,
            lists: &payload.lists,
        };
        if value.bytes[0] == 253 && matches!(value.bytes[63], 30 | 33) {
            value.bytes[1] = rank.clamp(1, 3);
        } else if value.bytes[0] == 253 && value.bytes[63] == 31 {
            // Current Soul Link retains the ordered raw31 contribution used
            // by Voidwalker's grant; it is not the internal spell31 variant.
            let amount = value.float(4) * f32::from(rank);
            value.bytes[4..8].copy_from_slice(&amount.to_le_bytes());
        } else if value.bytes[0] == 253 && value.bytes[63] == 35 {
            // Current 14599dd24..14599dd51: Soul Reaping's scalar grows
            // by half its base per further rank, rather than rank times base.
            let factor = ((f32::from(rank) - 1.0) * 0.5 + 1.0).max(1.0);
            let amount = value.float(4) * factor;
            value.bytes[4..8].copy_from_slice(&amount.to_le_bytes());
        } else {
            let factor = if matches!(value.bytes[0], 30 | 31) && !payload.rank_values.is_empty() {
                let index = usize::from(rank.saturating_sub(1)).min(payload.rank_values.len() - 1);
                payload.rank_values[index]
            } else {
                f32::from(rank)
            };
            value.scale(factor);
        }
        value
    }
    pub fn amulet(payload: &'static amulets::EffectRecord, multiplier: f32) -> Self {
        let mut value = Self {
            bytes: Self::decode(&payload.raw_hex),
            strings: &payload.strings,
            lists: &[],
        };
        value.scale(multiplier);
        value
    }
    pub fn tag(&self) -> u8 {
        self.bytes[0]
    }
    /// Native 0.112.0 aggregate1458975c0 diverts stat36/spell37 before
    /// assigning a generic effect index. Their internal tags are30/31.
    pub fn is_generic(&self) -> bool {
        !matches!(self.tag(), 30 | 31)
    }
    pub fn float(&self, at: usize) -> f32 {
        f32::from_le_bytes(self.bytes[at..at + 4].try_into().unwrap())
    }
    pub fn word(&self, at: usize) -> u32 {
        u32::from_le_bytes(self.bytes[at..at + 4].try_into().unwrap())
    }
    pub fn key(&self, at: usize) -> Option<&'static str> {
        self.strings
            .iter()
            .find(|s| s.offset == at)
            .map(|s| s.value.as_str())
    }
    /// 1454848a0 rank leaf and14554e050 equipped-scale iterator. Integer
    /// payloads, selectors and duration/cooldown fields are never blanket-scaled.
    pub fn scale(&mut self, factor: f32) {
        let hex = self
            .bytes
            .iter()
            .map(|byte| format!("{byte:02x}"))
            .collect::<String>();
        self.bytes = amulets::scaled_bytes(&hex, factor);
    }
    pub fn matches(&self, at: usize, definition: &AbilityDefinition) -> bool {
        match self.bytes[at] {
            0 => true,
            1 => self.key(at + 8) == Some(definition.key),
            2 => self
                .lists
                .iter()
                .find(|l| l.offset == at + 8)
                .is_some_and(|l| l.values.iter().any(|key| key == definition.key)),
            3 => self.bytes[at + 1] == definition.school,
            4 => self.bytes[at + 1] == definition.kind,
            _ => false,
        }
    }
}
#[derive(Clone, Debug, Default)]
pub struct Effects {
    pub gear: Vec<(u8, f32)>,
    pub talents: Vec<EffectRow>,
    /// Allocation key and rank in generic talent row order. Set and amulet
    /// rows follow this prefix and use separate source descriptors.
    pub meter_talents: Vec<(&'static str, u8)>,
    /// Native Game+828: only generic effects, in talent then amulet order.
    pub rows: Vec<EffectRow>,
    /// Numeric spell modifiers have their own native vector and no proc index.
    pub spell_rows: Vec<EffectRow>,
    pub stats: Vec<(u8, f32)>,
    pub callbacks: Vec<TalentEffect<'static>>,
    pub equipment_chance: f32,
}
impl Effects {
    pub fn ground_follows(&self, definition: &AbilityDefinition) -> bool {
        self.rows.iter().any(|row| row.tag() == 253 && row.bytes[63] == 36
            && row.matches(8, definition))
    }
    pub fn generic_talent_count(&self) -> usize {
        self.talents.iter().filter(|row| row.is_generic()).count()
    }

    pub fn rebuild(&mut self, amulet: Option<(&'static amulets::Definition, usize, u32)>) {
        let mut inputs = self.talents.clone();
        if let Some((definition, rarity, picks)) = amulet {
            inputs
                .extend(definition.effects.iter().map(|record| EffectRow {
                    bytes: amulets::equipped_bytes(definition, record, rarity, picks),
                    strings: &record.strings,
                    lists: &[],
                }));
        }
        self.rows.clear();
        self.spell_rows.clear();
        self.stats.clear();
        for row in inputs {
            if row.tag() == 30 {
                let tag = row.bytes[8];
                let amount = row.float(4);
                if let Some((_, sum)) = self.stats.iter_mut().find(|(kind, _)| *kind == tag) {
                    *sum += amount;
                } else {
                    self.stats.push((tag, amount));
                }
            } else if row.tag() == 31 {
                self.spell_rows.push(row);
            } else {
                self.rows.push(row);
            }
        }
        self.callbacks = self.passive_effects();
    }
    pub fn sum(&self, tag: u8) -> f32 {
        self.stats
            .iter()
            .filter(|(key, _)| *key == tag)
            .fold(-0.0, |sum, (_, value)| sum + value)
    }
    pub fn spell_modifiers(&self, definition: &AbilityDefinition) -> SpellModifiers {
        let mut result = SpellModifiers::default();
        let (mut cooldown, mut targets) = (0.0, 0.0);
        for row in &self.spell_rows {
            if !row.matches(8, definition) {
                continue;
            }
            let amount = row.float(32);
            match row.bytes[36] {
                0 => result.power += amount,
                1 => cooldown += amount,
                2 => targets += amount,
                3 => result.area += amount,
                4 => result.duration += amount,
                5 => result.health_power += amount,
                6 => result.effect += amount,
                amulets::ABSORB_CAP_MODIFIER => result.absorb_cap_bonus += amount,
                _ => {}
            }
        }
        result.cooldown = (1.0 - cooldown).max(0.4);
        result.targets = targets.round() as u32;
        result
    }
    pub fn passive_effects(&self) -> Vec<TalentEffect<'static>> {
        self.rows
            .iter()
            .filter_map(|row| match row.tag() {
                13 => Some(TalentEffect {
                    tag: 13,
                    amount: row.float(4),
                    key: row.key(8),
                }),
                22 => Some(TalentEffect {
                    tag: 22,
                    amount: row.float(4),
                    key: None,
                }),
                _ => None,
            })
            .collect()
    }
    pub fn lethal_protection(&self) -> Option<LethalProtection> {
        self.rows
            .iter()
            .find(|row| row.tag() == 19)
            .map(|row| LethalProtection {
                cooldown: row.float(4),
                health_fraction: row.float(8),
                invulnerability_seconds: row.float(12),
            })
    }
    pub fn gear_bounce(&self, key: &str) -> Option<GearBounce> {
        self.rows
            .iter()
            .find(|row| {
                row.tag() == 6
                    && row.word(16) == 0
                    && row.bytes[24] == 1
                    && row.key(32) == Some(key)
            })
            .map(|row| GearBounce {
                count: row.word(4),
                power_multiplier: row.float(8),
            })
    }
    pub fn extra_attempts(&self) -> u32 {
        self.rows
            .iter()
            .filter(|row| row.tag() == 24)
            .fold(0, |sum, row| sum.wrapping_add(row.word(4)))
    }
}

/// Scalar accumulators retain native stage ordering: race/base, worn gear,
/// jewelry, aggregate stats, active auras, then caps/conversions. Their tags
/// have different meanings in each producer; only the native mapping joins them.
#[derive(Clone, Copy, Debug)]
pub struct Numeric {
    pub health: f32,
    pub health_multiplier: f32,
    pub damage: f32,
    pub recovery: f32,
    pub crit: f32,
    pub crit_damage: f32,
    pub armor: f32,
    pub armor_cap: f32,
    pub regeneration: f32,
    pub regeneration_fraction: f32,
    /// Current gear/set tag13, admitted only after three seconds without a hit.
    pub calm_regen: f32,
    pub crowd_armor: f32,
    pub move_speed: f32,
    pub pickup: f32,
    pub experience: f32,
    pub gold: f32,
    pub area: f32,
    pub targets: u32,
    pub luck: f32,
    pub extra_cast: f32,
    pub heal_on_kill: f32,
    pub buff_bonus: f32,
    pub dot_tick: f32,
    pub armor_damage: f32,
    pub excess_armor_damage: f32,
}
impl Numeric {
    pub fn apply_gear(&mut self, rows: &[(u8, f32)]) {
        for &(tag, value) in rows {
            match tag {
                0 => self.damage += value,
                1 => self.recovery += value,
                2 => self.health += value,
                3 => self.crit += value,
                4 => self.crit_damage += value,
                5 => self.move_speed += value,
                6 => self.armor += value,
                7 => self.regeneration += value,
                8 => self.pickup *= 1.0 + value,
                9 => self.gold += value,
                10 => self.area += value,
                11 => self.targets = self.targets.wrapping_add(value as u32),
                12 => self.extra_cast += value,
                13 => self.calm_regen += value,
                14 => self.crowd_armor += value,
                _ => {}
            }
        }
    }
    pub fn apply_jewelry(&mut self, tag: u8, value: f32, base: f32) {
        match tag {
            0 => self.damage += value,
            1 => self.recovery += value,
            2 => self.health_multiplier += value,
            3 => self.crit += value,
            4 => self.crit_damage += value,
            5 => {
                self.armor += value.min(base * 3.0);
                self.health_multiplier += value * 4.0
            }
            6 => self.regeneration += value,
            7 => self.area += value,
            8 => self.extra_cast += value,
            9 => self.move_speed += value,
            10 => self.pickup *= 1.0 + value,
            11 => self.experience += value,
            12 => self.gold += value,
            13 => self.luck += value,
            14 => self.heal_on_kill += value,
            16 => self.buff_bonus += value,
            18 => self.dot_tick = (self.dot_tick + value).min(SEAL_OF_THE_DAMNED_TICK_CAP),
            // 0.112.0 native tag 6; stable source tag 19. Health keeps
            // growing while this item's independent mitigation stops at 12%.
            19 => {
                self.health_multiplier += value;
                self.armor += (value * f32::from_bits(0x3e23_d70a))
                    .min(f32::from_bits(0x3df5_c28f));
            }
            _ => {}
        }
    }
    pub fn apply_stats(&mut self, rows: &[(u8, f32)]) {
        for &(tag, value) in rows {
            match tag {
                0 => self.damage += value,
                1 => self.recovery += value,
                2 => self.health_multiplier += value,
                3 => self.crit += value,
                4 => self.crit_damage += value,
                5 => self.armor += value,
                6 => self.regeneration += value,
                7 => self.move_speed += value,
                8 => self.area += value,
                9 => self.pickup *= 1.0 + value,
                10 => self.experience += value,
                11 => self.gold += value,
                12 => self.luck += value,
                13 => self.extra_cast += value,
                15 => self.heal_on_kill += value,
                23 => self.buff_bonus += value,
                24 => self.regeneration_fraction += value,
                25 => self.armor_damage += value,
                26 => self.excess_armor_damage += value,
                27 => self.armor_cap += value,
                _ => {}
            }
        }
    }
    pub fn finish(&mut self) {
        self.health *= self.health_multiplier;
        self.regeneration += self.health * self.regeneration_fraction;
        let excess = (self.armor - self.armor_cap).max(0.0);
        self.armor = self.armor.min(self.armor_cap);
        self.damage += (self.armor * self.armor_damage) / 10.0 + excess * self.excess_armor_damage;
        if self.crit > 1.0 {
            self.crit_damage = self.crit_damage + self.crit - 1.0;
            self.crit = 1.0;
        }
        self.move_speed = self.move_speed.min(2.2);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn generic_indices_and_numeric_partitions_match_current_native_aggregate() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.112.0/gameplay-frontiers/contracts.json"
        ))
        .unwrap();
        for case in fixture["aggregate_order_fixtures"].as_array().unwrap() {
            let mut effects = Effects::default();
            effects.talents = case["native_inputs_hex"]
                .as_array()
                .unwrap()
                .iter()
                .map(|value| {
                    let mut bytes = EffectRow::decode(value.as_str().unwrap());
                    let native_tag = bytes[0];
                    bytes[0] = match native_tag {
                        29..=35 => {
                            bytes[63] = native_tag;
                            253
                        }
                        36 => 30,
                        37 => 31,
                        tag => tag,
                    };
                    EffectRow { bytes, strings: &[], lists: &[] }
                })
                .collect();
            effects.rebuild(None);
            let tags: Vec<_> = effects.rows.iter().map(|row| {
                if row.tag() == 253 { row.bytes[63] } else { row.tag() }
            }).collect();
            let expected: Vec<_> = case["native_generic_tags"].as_array().unwrap()
                .iter().map(|value| value.as_u64().unwrap() as u8).collect();
            assert_eq!(tags, expected, "{case}");
            let indices: Vec<_> = effects.rows.iter().map(|row| row.word(56) as u64).collect();
            let expected: Vec<u64> = serde_json::from_value(case["native_generic_input_indices"].clone()).unwrap();
            assert_eq!(indices, expected, "{case}");
            assert_eq!(effects.spell_rows.len(), case["spell_count"].as_u64().unwrap() as usize);
            let stats: Vec<_> = effects.stats.iter().map(|(tag, amount)| {
                [u64::from(*tag), u64::from(amount.to_bits())]
            }).collect();
            let expected: Vec<[u64; 2]> = serde_json::from_value(case["stat_tag_value_bits"].clone()).unwrap();
            assert_eq!(stats, expected, "{case}");
            effects.talents.clear();
            effects.rebuild(None);
            assert!(effects.rows.is_empty());
            assert!(effects.spell_rows.is_empty());
            assert!(effects.stats.is_empty());
            assert!(effects.callbacks.is_empty());
        }
    }

    #[test]
    fn hit_tokens_match_all_800_selected_native_cases() {
        use conditions::Event;
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.100.1/treasure-interface/hit-token-native.json"
        ))
        .unwrap();
        assert_eq!(fixture["target_sha256"], TARGET_SHA256);
        let words = |value: &serde_json::Value| {
            value
                .as_array()
                .unwrap()
                .iter()
                .map(|word| word.as_u64().unwrap() as u32)
                .collect::<Vec<_>>()
        };
        for case in fixture["cases"].as_array().unwrap() {
            let mut first = words(&case["first_tokens"]);
            let mut critical = words(&case["critical_tokens"]);
            let actual = hit_event(
                Event {
                    spell_id: fixture["spell_id"].as_u64().unwrap() as u32,
                    school: 2,
                    source_kind: case["source"].as_u64().unwrap() as u8,
                    critical: case["critical"].as_bool().unwrap(),
                    first_periodic: case["periodic_flag"].as_bool().unwrap(),
                    ..Default::default()
                },
                case["enabled"].as_bool().unwrap(),
                &mut first,
                &mut critical,
            );
            let expected = &case["event"];
            if expected.is_null() {
                assert_eq!(actual, None, "{case}");
            } else {
                let byte = |name: &str| expected[name].as_u64().unwrap() as u8;
                assert_eq!(
                    actual,
                    Some(Event {
                        spell_id: expected["spell_id"].as_u64().unwrap() as u32,
                        school: byte("school"),
                        kind: byte("kind"),
                        source_kind: byte("source_kind"),
                        critical: byte("critical") != 0,
                        first_hit: byte("first_hit") != 0,
                        first_critical: byte("first_critical") != 0,
                        first_periodic: byte("first_periodic") != 0,
                    }),
                    "{case}"
                );
            }
            assert_eq!(first, words(&case["remaining_first"]), "{case}");
            assert_eq!(critical, words(&case["remaining_critical"]), "{case}");
        }
    }
    #[test]
    fn current_talent_payloads_keep_native_selectors_and_rank_scaling() {
        let cls = catalog()
            .classes
            .iter()
            .find(|class| class.id == 1)
            .unwrap();
        let improved = cls
            .talents
            .iter()
            .find(|talent| talent.key == "imp_rend")
            .unwrap();
        let row = EffectRow::talent(&improved.effects[0], 3);
        let mut effects = Effects {
            talents: vec![row],
            ..Default::default()
        };
        effects.rebuild(None);
        let rend = AbilityDefinition::by_key("rend").unwrap();
        let strike = AbilityDefinition::by_key("smite").unwrap();
        assert_eq!(effects.spell_modifiers(rend).power, 1.0 + 0.15_f32 * 3.0);
        assert_eq!(effects.spell_modifiers(strike).power, 1.0);
    }
    #[test]
    fn list_selectors_resolve_owned_keys_instead_of_pe_pointers() {
        let cls = catalog()
            .classes
            .iter()
            .find(|class| class.id == 1)
            .unwrap();
        let talent = cls
            .talents
            .iter()
            .find(|talent| talent.key == "imp_execute")
            .unwrap();
        let row = EffectRow::talent(&talent.effects[0], 2);
        assert!(row.matches(8, AbilityDefinition::by_key("execute").unwrap()));
        assert!(row.matches(8, AbilityDefinition::by_key("mortal_strike").unwrap()));
        assert!(!row.matches(8, AbilityDefinition::by_key("rend").unwrap()));
    }
    #[test]
    fn all_recovered_spell_selectors_are_resolved() {
        for class in &catalog().classes {
            for talent in &class.talents {
                for payload in &talent.effects {
                    let row = EffectRow::talent(payload, 1);
                    if row.tag() == 31 {
                        match row.bytes[8] {
                            0 | 3 | 4 => {}
                            1 => assert!(row.key(16).is_some(), "{}", talent.key),
                            2 => assert!(
                                row.lists.iter().any(|list| list.offset == 16),
                                "{}",
                                talent.key
                            ),
                            _ => panic!("unknown selector {}", talent.key),
                        }
                    }
                }
            }
        }
    }
}
