//! 0.140.0 Scholomance equipment records and compact save IDs.

use serde::Deserialize;
use std::sync::OnceLock;

pub const ARMOR_DROP_SLOTS: [[u8; 2]; 4] = [[0, 1], [2, 3], [4, 5], [6, 7]];

#[derive(Deserialize)]
pub struct Item {
    pub native_id: u32,
    pub name: String,
    pub display_id: u32,
    pub item_class: u32,
    pub item_subclass: u32,
    pub inventory_type: u32,
    pub sheath: u32,
    pub slot_id: u8,
    pub effects: Vec<(u8, f32)>,
    pub five_star_effects: Vec<f32>,
}

#[derive(Deserialize)]
pub struct Class {
    pub id: u8,
    pub name: String,
    pub items: Vec<Item>,
}

#[derive(Deserialize)]
struct Catalog {
    target_sha256: String,
    classes: Vec<Class>,
}

pub fn class(id: u8) -> Option<&'static Class> {
    static CATALOG: OnceLock<Catalog> = OnceLock::new();
    let catalog = CATALOG.get_or_init(|| {
        let value: Catalog =
            serde_json::from_str(include_str!("../assets/scholomance-gear-0.140.0.json"))
                .expect("Scholomance Tier 0.5 equipment catalog");
        assert_eq!(
            value.target_sha256,
            "27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9"
        );
        value
    });
    catalog.classes.iter().find(|entry| entry.id == id)
}

pub fn item_id(class: u8, slot: u8) -> u32 {
    100_070 + u32::from(class) * 1000 + u32::from(slot) * 100
}

pub fn item(class_id: u8, slot: u8) -> Option<&'static Item> {
    class(class_id)?.items.get(usize::from(slot))
}

pub fn weapon_ids(class_id: u8) -> impl Iterator<Item = u32> {
    let slots = class(class_id).map_or(0, |entry| entry.items.len()) as u8;
    (8..slots).map(move |slot| item_id(class_id, slot))
}
