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
    let mut counts = [0usize; TIERS];
    let mut minimum = [u8::MAX; TIERS];
    for (&id, &rank) in gear.iter().zip(stars) {
        let Some(piece) = lookup(canonical_item(id)) else {
            continue;
        };
        if piece.class_id == 0 || piece.slot >= ARMOR_SLOTS {
            continue;
        }
        // Native145ac427b explicitly rejects an out-of-domain catalog tier.
        let count = counts
            .get_mut(piece.tier)
            .expect("native set tier domain0..5");
        *count += 1;
        minimum[piece.tier] = minimum[piece.tier].min(rank);
    }
    (0..TIERS).find_map(|tier| {
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
    (class_id <= 11 && (0x0bbeu16 >> class_id) & 1 != 0 && tier < 6).then_some(SetIdentity {
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
        if piece.class_id == 0 || piece.slot >= ARMOR_SLOTS || rank == 0 {
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
    catalog().entries.iter().find(|entry| {
        entry.class_id == class_id && entry.tier == tier && entry.empowered == empowered
    })
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
