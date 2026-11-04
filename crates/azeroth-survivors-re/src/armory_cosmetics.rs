//! Achievement-gated cosmetics, including the seven 0.117.0 co-op rewards.
//! They resolve appearance only; ordinary gear decoding continues to own stats.
use serde::Deserialize;
use std::sync::OnceLock;

#[derive(Deserialize)]
pub struct Cosmetic {
    pub id: u32,
    pub name: String,
    pub icon: String,
    pub achievement: String,
    pub display_id: u32,
    pub inventory_type: u8,
    pub slot: usize,
}

pub fn all() -> &'static [Cosmetic] {
    #[derive(Deserialize)]
    struct Catalog {
        cosmetics: Vec<Cosmetic>,
    }
    static CATALOG: OnceLock<Catalog> = OnceLock::new();
    &CATALOG
        .get_or_init(|| {
            let mut catalog: Catalog =
                serde_json::from_str(include_str!("../assets/armory-cosmetics-0.112.0.json"))
                    .expect("native cosmetic descriptors");
            let additions: Catalog =
                serde_json::from_str(include_str!("../assets/party-rewards-0.117.0.json"))
                    .expect("current co-op cosmetic descriptors");
            catalog.cosmetics.extend(additions.cosmetics);
            catalog
        })
        .cosmetics
}

pub fn get(id: u32) -> Option<&'static Cosmetic> {
    all().iter().find(|entry| entry.id == id)
}

/// Native 0.140.0 Save::glow_unlocked at 0x145e18ba0. These enchant IDs
/// feed the separate weapon-eligibility and visual resolver.
pub fn weapon_glow_unlocked(id: u32, achieved: impl Fn(&str) -> bool) -> bool {
    match id {
        0 | 1894 => true,
        1900 => achieved("heroic:naxx5"),
        803 => achieved("radiantarmory"),
        1899 => achieved("coop:insane"),
        1898 => achieved("heroic:prepared"),
        _ => false,
    }
}

/// Native145aa57f0 rechecks saved choices, preserving an explicit zero.
/// A missing or no-longer-unlocked selection uses the Icy Chill enchant.
pub fn selected_weapon_glow(saved: Option<u32>, achieved: impl Fn(&str) -> bool) -> u32 {
    saved
        .filter(|id| weapon_glow_unlocked(*id, &achieved))
        .unwrap_or(1894)
}

/// Current preview/world publication uses native paperdoll slots 15..17.
/// Icy Chill is the five-star default; the other selected enchants can be
/// applied at any rank. A missing displayed weapon never publishes a glow.
pub fn weapon_glow(enchant: u32, slot: u8, displayed_item: u32, stars: u8) -> u32 {
    if !(15..=17).contains(&slot) || displayed_item == 0 || (enchant == 1894 && stars < 5) {
        0
    } else {
        enchant
    }
}
