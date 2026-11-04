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
    let mut counts = [0usize; TIERS];
    for (&id, &rank) in gear.iter().zip(stars) {
        let Some(piece) = lookup(canonical_item(id)) else { continue; };
        if piece.class_id == 0 || piece.slot >= ARMOR_SLOTS || rank == 0
            || piece.tier == usize::from(TIER_HALF)
        {
            continue;
        }
        *counts.get_mut(piece.tier).expect("native set tier domain0..5") += 1;
    }
    (0..TIERS).filter(|&tier| counts[tier] >= 4).map(|tier| tier as u8).collect()
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
        (3, 2) => Some(giantstalker(empowered)),
        (3, TIER_HALF) => Some(beastmaster(empowered)),
        (11, TIER_HALF) => Some(tier_half_druid(empowered)),
        _ => catalog().entries.iter().find(|entry| {
            entry.class_id == class_id && entry.tier == tier && entry.empowered == empowered
        }),
    }
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
