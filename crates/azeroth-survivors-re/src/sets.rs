//! Current 0.121.0 set identity, worn activation and spell descriptors.
//!
//! Native owners: 145ac19f0 (identity), 145ac4160 (activation), 145ac0f90
//! (ordinary/empowered descriptor inputs), and 145ac1b40 (descriptors).
//! See docs/analysis/sets-source-0.121.0.md for evidence and remaining consumers.
//! Descriptors retain native effect tags. In particular native24 is a moving
//! ground effect and must not enter the historical source24 extra-cast path.
use serde::Deserialize;
use std::sync::OnceLock;

pub const TARGET_SHA256: &str = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150";
pub const PAPERDOLL_SLOTS: usize = 19;
pub const ARMOR_SLOTS: usize = 8;
pub const TIERS: usize = 6;
pub const TIER_HALF: u8 = 7;
const ACTIVE_TIER_ORDER: [usize; 7] = [0, 1, 2, 3, 5, TIER_HALF as usize, 4];

/// Projection supplied by the existing gear catalog, not by item-name matching.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Piece {
    pub class_id: u8,
    pub slot: usize,
    pub tier: usize,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct ActiveSet {
    pub tier: u8,
    pub empowered: bool,
}
impl ActiveSet {
    pub fn multiplier(self) -> f32 {
        if self.empowered { 1.5 } else { 1.0 }
    }
}

/// Native activation normalizes the faction-specific PvP digit6 to digit5
/// before the catalog lookup. The ID range/multiple-of-ten guards are native.
pub fn canonical_item(id: u32) -> u32 {
    let Some(value) = id.checked_sub(100_000) else {
        return id;
    };
    if value <= 11_999 && value % 10 == 0 && value / 10 % 10 == 6 {
        id - 10
    } else {
        id
    }
}

/// Character-pane set IDs retain the Horde PvP low-nibble15 discriminator.
/// The lookup here receives the original item ID, matching145ac19f0.
pub fn item_set_id(id: u32, mut lookup: impl FnMut(u32) -> Option<Piece>) -> u32 {
    let Some(piece) = lookup(id) else {
        return 0;
    };
    if piece.class_id == 0 || piece.slot >= ARMOR_SLOTS {
        return 0;
    }
    let tier = if canonical_item(id) != id {
        15
    } else {
        piece.tier as u32
    };
    encode_set_id(piece.class_id, tier)
}

fn encode_set_id(class_id: u8, tier: u32) -> u32 {
    0xa000u32
        .wrapping_add(u32::from(class_id) << 4)
        .wrapping_add(tier)
}

/// All19 authored paperdoll entries participate. Only catalog armor entries
/// with a nonzero class contribute. Count and minimum stars are grouped by
/// tier; the source does not introduce an extra selected-class filter here.
/// The first tier with eight pieces and minimum rank3 wins; rank5 empowers it.
pub fn active(
    gear: &[u32; PAPERDOLL_SLOTS],
    stars: &[u8; PAPERDOLL_SLOTS],
    mut lookup: impl FnMut(u32) -> Option<Piece>,
) -> Option<ActiveSet> {
    let mut counts = [0usize; TIER_HALF as usize + 1];
    let mut minimum = [u8::MAX; TIER_HALF as usize + 1];
    for (&id, &rank) in gear.iter().zip(stars) {
        let Some(piece) = lookup(canonical_item(id)) else {
            continue;
        };
        if piece.class_id == 0 || piece.slot >= ARMOR_SLOTS {
            continue;
        }
        // 0.140.0 145e34f70 includes the Tier 0.5 index and keeps the
        // original first-match ordering for the remaining candidates.
        let count = counts.get_mut(piece.tier).expect("native set tier domain");
        *count += 1;
        minimum[piece.tier] = minimum[piece.tier].min(rank);
    }
    ACTIVE_TIER_ORDER.into_iter().find_map(|tier| {
        (counts[tier] >= ARMOR_SLOTS && minimum[tier] >= 3).then_some(ActiveSet {
            tier: tier as u8,
            empowered: minimum[tier] >= 5,
        })
    })
}

/// SetTip's current ID decoder. Only the low class byte and tier nibble
/// participate after the native lower-bound check; no extra high-prefix mask
/// is introduced. Low nibble15 selects the Horde PvP title/registration domain.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct SetIdentity {
    pub class_id: u8,
    pub tier: u8,
    pub horde_pvp: bool,
}
impl SetIdentity {
    pub fn item_set_id(self) -> u32 {
        encode_set_id(self.class_id,
            if self.horde_pvp { 15 } else { u32::from(self.tier) })
    }
}
pub fn decode_set_id(id: u32) -> Option<SetIdentity> {
    if id < 0xa000 {
        return None;
    }
    let class_id = (id >> 4) as u8;
    let nibble = (id & 15) as u8;
    let tier = if nibble == 15 { 5 } else { nibble };
    (class_id <= 11 && (0x0bbeu16 >> class_id) & 1 != 0 && (tier < 6 || tier == TIER_HALF)).then_some(SetIdentity {
        class_id,
        tier,
        horde_pvp: nibble == 15,
    })
}

/// Canonical native four-piece descriptor rows selected by SetTip145ac1180.
/// This lookup supplies data only; the actual worn/star activation gate belongs
/// to the caller. Native numeric11 carries an integer target count; the other
/// fields below retain their exact float bits. Tags13/14 keep their identities
/// for the current numeric consumer instead of being silently discarded.
pub fn four_piece_effects(tier: u8) -> &'static [(u8, f32)] {
    const ROWS: [&[(u8, f32)]; TIERS] = [
        &[
            (9, f32::from_bits(0x3e800000)),
            (8, f32::from_bits(0x3e99999a)),
        ],
        &[(13, f32::from_bits(0x3c75c28f))],
        &[(11, 1.0)],
        &[(12, f32::from_bits(0x3d75c28f))],
        &[(4, f32::from_bits(0x3e99999a))],
        &[(14, f32::from_bits(0x3df5c28f))],
    ];
    ROWS.get(usize::from(tier)).copied().unwrap_or(&[])
}

/// Current145affbe0 counts every decoded armor entry whose parallel star byte
/// is nonzero. Iterator145c7bec0 then visits tiers0..5 in order and keeps counts
/// greater than3. This gate differs from the eight-piece minimum-rank check.
pub fn four_piece_tiers(
    gear: &[u32; PAPERDOLL_SLOTS],
    stars: &[u8; PAPERDOLL_SLOTS],
    mut lookup: impl FnMut(u32) -> Option<Piece>,
) -> Vec<u8> {
    let mut counts = [0usize; TIER_HALF as usize + 1];
    for (&id, &rank) in gear.iter().zip(stars) {
        let Some(piece) = lookup(canonical_item(id)) else { continue; };
        if piece.class_id == 0 || piece.slot >= ARMOR_SLOTS || rank == 0 {
            continue;
        }
        *counts.get_mut(piece.tier).expect("native set tier domain") += 1;
    }
    ACTIVE_TIER_ORDER.into_iter().filter(|&tier| counts[tier] >= 4)
        .map(|tier| tier as u8).collect()
}

/// Owned native payload data. Pointer/length words have been removed; strings
/// retain their semantic field offsets. Consumers must explicitly translate
/// the current native variant domain before constructing historical EffectRow.
#[derive(Debug, Deserialize)]
pub struct NativeEffect {
    pub raw_hex: String,
    pub strings: Vec<crate::loot_rewards::amulets::EffectString>,
    #[serde(default)]
    pub lists: Vec<NativeKeyList>,
}
#[derive(Debug, Deserialize)]
pub struct NativeKeyList {
    pub offset: usize,
    pub values: Vec<String>,
}
impl NativeEffect {
    pub fn bytes(&self) -> [u8; 64] {
        assert_eq!(self.raw_hex.len(), 128, "native Effect64 payload");
        std::array::from_fn(|i| {
            u8::from_str_radix(&self.raw_hex[i * 2..i * 2 + 2], 16)
                .expect("source-owned set effect hex")
        })
    }
}

#[derive(Debug, Deserialize)]
pub struct Descriptor {
    pub class_id: u8,
    pub tier: u8,
    pub empowered: bool,
    pub spell_key: String,
    pub description: String,
    pub display_values: [f32; 2],
    pub effects: Vec<NativeEffect>,
}
#[derive(Deserialize)]
struct Catalog {
    target_sha256: String,
    entries: Vec<Descriptor>,
}
fn catalog() -> &'static Catalog {
    static CATALOG: OnceLock<Catalog> = OnceLock::new();
    CATALOG.get_or_init(|| {
        let value: Catalog = serde_json::from_str(include_str!("../assets/sets-0.121.0.json"))
            .expect("current native set descriptors");
        assert_eq!(value.target_sha256, TARGET_SHA256);
        value
    })
}

/// Nine supported classes, six tiers, both actual multiplier domains. Invalid
/// class/tier values return None, matching the constructor's empty variant.
pub fn descriptor(class_id: u8, tier: u8, empowered: bool) -> Option<&'static Descriptor> {
    match (class_id, tier) {
        (1, TIER_HALF) => Some(heroism(empowered)),
        (2, TIER_HALF) => Some(soulforge(empowered)),
        (3, 2) => Some(giantstalker(empowered)),
        (3, TIER_HALF) => Some(beastmaster(empowered)),
        (4, TIER_HALF) => Some(darkmantle(empowered)),
        (5, TIER_HALF) => Some(vestments_of_the_virtuous(empowered)),
        (7, TIER_HALF) => Some(five_thunders(empowered)),
        (8, TIER_HALF) => Some(sorcerer(empowered)),
        (11, TIER_HALF) => Some(tier_half_druid(empowered)),
        _ => catalog().entries.iter().find(|entry| {
            entry.class_id == class_id && entry.tier == tier && entry.empowered == empowered
        }),
    }
}

pub const DARKMANTLE_SPELLS: [&str; 2] = ["backstab", "eviscerate"];

fn spell_list_modifier(keys: &[&str], selector: u8, amount: f32) -> NativeEffect {
    let mut bytes = [0; 64];
    bytes[0] = 73;
    bytes[8] = 2;
    bytes[32..36].copy_from_slice(&amount.to_le_bytes());
    bytes[36] = selector;
    NativeEffect {
        raw_hex: bytes.iter().map(|byte| format!("{byte:02x}")).collect(),
        strings: Vec::new(),
        lists: vec![NativeKeyList {
            offset: 16,
            values: keys.iter().map(|key| (*key).to_owned()).collect(),
        }],
    }
}

/// 0.140.0 145e30990 mode 0 is independent of the active eight-piece selection.
pub fn tier_half_four_piece(class: u8) -> Option<&'static Descriptor> {
    static DEATHMIST: OnceLock<Descriptor> = OnceLock::new();
    static BEASTMASTER: OnceLock<Descriptor> = OnceLock::new();
    static VESTMENTS: OnceLock<Descriptor> = OnceLock::new();
    static HEROISM: OnceLock<Descriptor> = OnceLock::new();
    static SOULFORGE: OnceLock<Descriptor> = OnceLock::new();
    static DARKMANTLE: OnceLock<Descriptor> = OnceLock::new();
    static FIVE_THUNDERS: OnceLock<Descriptor> = OnceLock::new();
    static SORCERER: OnceLock<Descriptor> = OnceLock::new();
    static FERALHEART: OnceLock<Descriptor> = OnceLock::new();
    match class {
        1 => Some(HEROISM.get_or_init(|| {
            use crate::loot_rewards::amulets::EffectString;

            let mut bytes = [0; 64];
            bytes[0] = 59;
            bytes[40..44].copy_from_slice(&0.10_f32.to_le_bytes());
            Descriptor {
                class_id: 1,
                tier: TIER_HALF,
                empowered: false,
                spell_key: "shield_slam".to_owned(),
                description: "Fortified holds shielding up to 50% of your maximum health (62% with Shield Mastery). Shield Slam deals 10% more damage while Fortified protects you.".to_owned(),
                display_values: [0.0; 2],
                effects: vec![NativeEffect {
                    raw_hex: bytes.iter().map(|byte| format!("{byte:02x}")).collect(),
                    strings: vec![
                        EffectString { offset: 8, value: "shield_slam".to_owned() },
                        EffectString { offset: 24, value: "fortified".to_owned() },
                    ],
                    lists: Vec::new(),
                }],
            }
        })),
        2 => Some(SOULFORGE.get_or_init(|| Descriptor {
            class_id: 2,
            tier: TIER_HALF,
            empowered: false,
            spell_key: "hammer_of_justice".to_owned(),
            description: "Hammer of the Righteous's shield explosions deal 75% of absorbed damage instead of 50%.".to_owned(),
            display_values: [0.0; 2],
            effects: Vec::new(),
        })),
        3 => Some(BEASTMASTER.get_or_init(|| Descriptor {
            class_id: 3,
            tier: TIER_HALF,
            empowered: false,
            spell_key: "bestial_wrath".to_owned(),
            description: "Bestial Wrath causes pet bites to strike 5 additional enemies for 150% damage each.".to_owned(),
            display_values: [0.0; 2],
            effects: Vec::new(),
        })),
        4 => Some(DARKMANTLE.get_or_init(|| Descriptor {
            class_id: 4,
            tier: TIER_HALF,
            empowered: false,
            spell_key: "backstab".to_owned(),
            description: "Backstab and Eviscerate deal double damage below 40% enemy health instead of 30%.".to_owned(),
            display_values: [0.0; 2],
            effects: vec![spell_list_modifier(&DARKMANTLE_SPELLS, 8, 0.40)],
        })),
        5 => Some(VESTMENTS.get_or_init(|| Descriptor {
            class_id: 5,
            tier: TIER_HALF,
            empowered: false,
            spell_key: "sw_pain".to_owned(),
            description: "Shadowy Apparitions has an 8% chance to fire a free Mind Blast per Shadow Word: Pain tick, increased from 4%.".to_owned(),
            display_values: [0.0; 2],
            effects: Vec::new(),
        })),
        7 => Some(FIVE_THUNDERS.get_or_init(|| Descriptor {
            class_id: 7,
            tier: TIER_HALF,
            empowered: false,
            spell_key: "stormstrike".to_owned(),
            description: "Stormstrike deals 15% more damage and has 35% reduced cooldown.".to_owned(),
            display_values: [0.0; 2],
            effects: vec![spell_modifier("stormstrike", 0, 0.15), spell_modifier("stormstrike", 1, 0.35)],
        })),
        8 => Some(SORCERER.get_or_init(|| Descriptor {
            class_id: 8,
            tier: TIER_HALF,
            empowered: false,
            spell_key: "frostbolt".to_owned(),
            description: "Splitting Ice reaches 7 yd instead of 5 yd and deals 125% damage instead of 100%.".to_owned(),
            display_values: [0.0; 2],
            effects: Vec::new(),
        })),
        11 => Some(FERALHEART.get_or_init(|| Descriptor {
            class_id: 11,
            tier: TIER_HALF,
            empowered: false,
            spell_key: "regrowth".to_owned(),
            description: "Regrowth and Rejuvenation heal 20% more; Tranquility reaches 15 yd instead of 12 yd.".to_owned(),
            display_values: [0.0; 2],
            effects: vec![spell_list_modifier(&["regrowth", "rejuvenation"], 7, 0.20)],
        })),
        9 => Some(DEATHMIST.get_or_init(|| Descriptor {
            class_id: 9,
            tier: TIER_HALF,
            empowered: false,
            spell_key: "immolate".to_owned(),
            description: "Conflagrate explodes for 35% of the triggering direct hit's damage within 8 yd.".to_owned(),
            display_values: [0.0; 2],
            effects: Vec::new(),
        })),
        _ => None,
    }
}

fn spell_modifier(key: &str, selector: u8, amount: f32) -> NativeEffect {
    let mut bytes = [0; 64];
    bytes[0] = 73;
    bytes[8] = 1;
    bytes[32..36].copy_from_slice(&amount.to_le_bytes());
    bytes[36] = selector;
    NativeEffect {
        raw_hex: bytes.iter().map(|byte| format!("{byte:02x}")).collect(),
        strings: vec![crate::loot_rewards::amulets::EffectString { offset: 16, value: key.to_owned() }],
        lists: Vec::new(),
    }
}

fn vestments_of_the_virtuous(empowered: bool) -> &'static Descriptor {
    static DESCRIPTORS: OnceLock<[Descriptor; 2]> = OnceLock::new();
    &DESCRIPTORS.get_or_init(|| [
        (false, "Shadowform death explosions deal 8% of the defeated enemy's maximum health instead of 4%; Shadow Word: Pain jumps to 2 enemies."),
        (true, "Shadowy Apparitions chance rises to 12%; Shadowform explosions deal 10% maximum health; Shadow Word: Pain jumps to 3 enemies."),
    ].map(|(empowered, description)| Descriptor {
        class_id: 5,
        tier: TIER_HALF,
        empowered,
        spell_key: "sw_pain".to_owned(),
        description: description.to_owned(),
        display_values: [0.0; 2],
        effects: Vec::new(),
    }))[usize::from(empowered)]
}

fn five_thunders(empowered: bool) -> &'static Descriptor {
    static DESCRIPTORS: OnceLock<[Descriptor; 2]> = OnceLock::new();
    &DESCRIPTORS.get_or_init(|| {
        [
            (false, 0.25_f32, 6.0_f32,
                "Every Stormstrike causes Thunderburst, dealing Nature damage equal to 25% of its damage to enemies within 6 yd."),
            (true, 0.50_f32, 8.0_f32,
                "Thunderburst deals 50% of Stormstrike damage and reaches 8 yd."),
        ].map(|(empowered, fraction, radius, description)| {
            let mut bytes = [0; 64];
            bytes[0] = 66;
            bytes[4..8].copy_from_slice(&fraction.to_le_bytes());
            bytes[8..12].copy_from_slice(&radius.to_le_bytes());
            Descriptor {
                class_id: 7,
                tier: TIER_HALF,
                empowered,
                spell_key: "stormstrike".to_owned(),
                description: description.to_owned(),
                display_values: [0.0; 2],
                effects: vec![NativeEffect {
                    raw_hex: bytes.iter().map(|byte| format!("{byte:02x}")).collect(),
                    strings: Vec::new(),
                    lists: Vec::new(),
                }],
            }
        })
    })[usize::from(empowered)]
}

fn darkmantle(empowered: bool) -> &'static Descriptor {
    static DESCRIPTORS: OnceLock<[Descriptor; 2]> = OnceLock::new();
    &DESCRIPTORS.get_or_init(|| {
        [
            (false, 0.35_f32, 1_u32,
                "Backstab and Eviscerate mark bosses and elites for death; marked targets take 35% more damage from you. One target maximum."),
            (true, 0.40_f32, 2_u32,
                "Marked for Death increases to 40% damage and two targets. The double-damage threshold rises to 45% health."),
        ].map(|(empowered, amount, cap, description)| {
            let mut mark = [0; 64];
            mark[0] = 65;
            mark[4..8].copy_from_slice(&amount.to_le_bytes());
            mark[8..12].copy_from_slice(&cap.to_le_bytes());
            let mut effects = vec![NativeEffect {
                raw_hex: mark.iter().map(|byte| format!("{byte:02x}")).collect(),
                strings: Vec::new(),
                lists: Vec::new(),
            }];
            if empowered {
                effects.push(spell_list_modifier(&DARKMANTLE_SPELLS, 8, 0.45));
            }
            Descriptor {
                class_id: 4,
                tier: TIER_HALF,
                empowered,
                spell_key: "backstab".to_owned(),
                description: description.to_owned(),
                display_values: [0.0; 2],
                effects,
            }
        })
    })[usize::from(empowered)]
}

/// 0.140.0 145e30ac5..145e30b43 publishes the keyed shield explosion.
fn soulforge(empowered: bool) -> &'static Descriptor {
    use crate::loot_rewards::amulets::EffectString;

    static DESCRIPTORS: OnceLock<[Descriptor; 2]> = OnceLock::new();
    &DESCRIPTORS.get_or_init(|| {
        [
            (false, 0.40_f32,
                "Hammer of Justice deals 1.75% of the target's maximum health instead of 1.5% and explodes for 40% of your remaining shield absorption within 10 yd of its target."),
            (true, 0.65_f32,
                "Hammer of Justice deals 1.9% of target maximum health; the explosion deals 65% of remaining shield absorption."),
        ].map(|(empowered, fraction, description)| {
            let mut bytes = [0; 64];
            bytes[0] = 60;
            bytes[8] = 1;
            bytes[16] = 1;
            bytes[40..44].copy_from_slice(&fraction.to_le_bytes());
            bytes[44..48].copy_from_slice(&10.0_f32.to_le_bytes());
            bytes[48..52].copy_from_slice(&15237_u32.to_le_bytes());
            bytes[52] = 1;
            Descriptor {
                class_id: 2,
                tier: TIER_HALF,
                empowered,
                spell_key: "hammer_of_justice".to_owned(),
                description: description.to_owned(),
                display_values: [0.0; 2],
                effects: vec![NativeEffect {
                    raw_hex: bytes.iter().map(|byte| format!("{byte:02x}")).collect(),
                    strings: vec![EffectString { offset: 24, value: "hammer_of_justice".to_owned() }],
                    lists: Vec::new(),
                }],
            }
        })
    })[usize::from(empowered)]
}

/// 0.140.0 145e309c1..145e30a78. The two raw 73 modifiers change
/// the existing Shield Slam cast. Raw 71 identifies its max-HP meter share.
fn heroism(empowered: bool) -> &'static Descriptor {
    use crate::loot_rewards::amulets::EffectString;

    static DESCRIPTORS: OnceLock<[Descriptor; 2]> = OnceLock::new();
    &DESCRIPTORS.get_or_init(|| {
        [
            (false, 0.20_f32, 0.045_f32,
                "Shield Slam deals 20% more damage and additional Physical damage equal to 4.5% of your maximum health."),
            (true, 0.30_f32, 0.06_f32,
                "Shield Slam deals 30% more damage and additional Physical damage equal to 6% of your maximum health."),
        ].map(|(empowered, power, health, description)| {
            let mut meter = [0; 64];
            meter[0] = 71;
            meter[24..28].copy_from_slice(&health.to_le_bytes());
            Descriptor {
                class_id: 1,
                tier: TIER_HALF,
                empowered,
                spell_key: "shield_slam".to_owned(),
                description: description.to_owned(),
                display_values: [0.0; 2],
                effects: vec![spell_modifier("shield_slam", 0, power), spell_modifier("shield_slam", 5, health), NativeEffect {
                    raw_hex: meter.iter().map(|byte| format!("{byte:02x}")).collect(),
                    strings: vec![EffectString { offset: 8, value: "shield_slam".to_owned() }],
                    lists: Vec::new(),
                }],
            }
        })
    })[usize::from(empowered)]
}

/// 0.140.0 145e30990 class 8 emits raw67 and appends raw68 in mode 2.
fn sorcerer(empowered: bool) -> &'static Descriptor {
    use crate::loot_rewards::amulets::EffectString;

    static DESCRIPTORS: OnceLock<[Descriptor; 2]> = OnceLock::new();
    &DESCRIPTORS.get_or_init(|| {
        [
            (false, 1.0_f32,
                "Water Elemental Frostbolts also trigger Splitting Ice and deal 100% more damage to bosses and elites."),
            (true, 1.5_f32,
                "Splitting Ice deals 150% damage. Water Elemental Frostbolts deal 150% more damage to bosses and elites. Your Frostbolt also deals 50% more damage to bosses and elites."),
        ].map(|(empowered, pet_bonus, description)| {
            let mut pet = [0; 64];
            pet[0] = 67;
            pet[4..8].copy_from_slice(&pet_bonus.to_le_bytes());
            let mut effects = vec![NativeEffect {
                raw_hex: pet.iter().map(|byte| format!("{byte:02x}")).collect(),
                strings: Vec::new(),
                lists: Vec::new(),
            }];
            if empowered {
                let mut player = [0; 64];
                player[0] = 68;
                player[24..28].copy_from_slice(&0.5_f32.to_le_bytes());
                effects.push(NativeEffect {
                    raw_hex: player.iter().map(|byte| format!("{byte:02x}")).collect(),
                    strings: vec![EffectString { offset: 8, value: "frostbolt".to_owned() }],
                    lists: Vec::new(),
                });
            }
            Descriptor {
                class_id: 8,
                tier: TIER_HALF,
                empowered,
                spell_key: "frostbolt".to_owned(),
                description: description.to_owned(),
                display_values: [0.0; 2],
                effects,
            }
        })
    })[usize::from(empowered)]
}

/// Native 0.140.0 145e30baa..145e30c18, with values at 1473ea130.
/// Both use the live eight-piece activation state from 145e34f70.
fn tier_half_druid(empowered: bool) -> &'static Descriptor {
    static DESCRIPTORS: OnceLock<[Descriptor; 2]> = OnceLock::new();
    &DESCRIPTORS.get_or_init(|| {
        [
            (false,
                "Every qualifying Tranquility healing cast plants Seed of Life on a priority enemy; after 1.5 sec it deals 60% of the Tranquility hit's damage to that target and 5 nearby enemies within 6 yd.",
                "460000009a99193f050000000000c040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
            (true,
                "Seed of Life deals 100% of the Tranquility hit's damage, striking its target and 7 nearby enemies within 8 yd. Seed of Life also strikes bosses and elites twice.",
                "460000000000803f0700000000000041010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
        ].map(|(empowered, description, raw_hex)| Descriptor {
            class_id: 11,
            tier: TIER_HALF,
            empowered,
            spell_key: "regrowth".to_owned(),
            description: description.to_owned(),
            display_values: [0.0; 2],
            effects: vec![NativeEffect {
                raw_hex: raw_hex.to_owned(),
                strings: Vec::new(),
                lists: Vec::new(),
            }],
        })
    })[usize::from(empowered)]
}

fn giantstalker(empowered: bool) -> &'static Descriptor {
    static CURRENT: OnceLock<[Descriptor; 2]> = OnceLock::new();
    &CURRENT.get_or_init(|| [false, true].map(|empowered| {
        // 0.140.0 0x145e32b56: native tag 73 selects Kill Command for
        // cooldown lane 1 and damage lane 0 at the existing set multiplier.
        let multiplier = ActiveSet { tier: 2, empowered }.multiplier();
        let effect = |modifier: u8, amount: f32| {
            let mut bytes = [0; 64];
            bytes[0] = 73;
            bytes[8] = 1;
            bytes[32..36].copy_from_slice(&amount.to_le_bytes());
            bytes[36] = modifier;
            NativeEffect {
                raw_hex: bytes.iter().map(|byte| format!("{byte:02x}")).collect(),
                strings: vec![crate::loot_rewards::amulets::EffectString {
                    offset: 16, value: "kill_command".into(),
                }],
                lists: vec![],
            }
        };
        Descriptor {
            class_id: 3, tier: 2, empowered,
            spell_key: "kill_command".into(),
            description: "Kill Command's cooldown is {v}% shorter and it deals {v2}% more damage.".into(),
            display_values: [20.0 * multiplier, f32::from_bits(0x41f00001) * multiplier],
            effects: vec![effect(1, 0.2 * multiplier), effect(0, 0.3 * multiplier)],
        }
    }))[usize::from(empowered)]
}

fn beastmaster(empowered: bool) -> &'static Descriptor {
    static CURRENT: OnceLock<[Descriptor; 2]> = OnceLock::new();
    &CURRENT.get_or_init(|| [false, true].map(|empowered| {
        // 0.140.0 0x145e30c4e / 0x145e30edf grant the same descriptor and
        // select the mark-only bonus for mode 1 or 2.
        let mut pet = [0; 64];
        pet[0] = 42;
        pet[8..16].copy_from_slice(&crate::run_effects::pets::MATRIARCH.native_address.to_le_bytes());
        let mut bite = [0; 64];
        bite[0] = 64;
        bite[4..8].copy_from_slice(&(if empowered { 1.0f32 } else { 0.5 }).to_le_bytes());
        Descriptor {
            class_id: 3, tier: TIER_HALF, empowered,
            spell_key: "hunters_mark".into(),
            description: if empowered {
                "The Devilsaur Matriarch's bites deal 100% additional damage against Hunter's Mark targets instead of 50%."
            } else {
                "Gain an additional permanent Devilsaur Matriarch. Her bites deal 150% of Wolf base bite damage, and 50% more against Hunter's Mark targets."
            }.into(),
            display_values: [0.0; 2],
            effects: [pet, bite].iter().map(|bytes| NativeEffect {
                raw_hex: bytes.iter().map(|byte| format!("{byte:02x}")).collect(),
                strings: vec![], lists: vec![],
            }).collect(),
        }
    }))[usize::from(empowered)]
}

pub fn equipped_descriptor(
    class_id: u8,
    gear: &[u32; PAPERDOLL_SLOTS],
    stars: &[u8; PAPERDOLL_SLOTS],
    lookup: impl FnMut(u32) -> Option<Piece>,
) -> Option<&'static Descriptor> {
    let state = active(gear, stars, lookup)?;
    descriptor(class_id, state.tier, state.empowered)
}
