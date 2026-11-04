//! 0.113.2 ordinary equipment and temporary jewelry publication.
//! Native ownership and static limits: docs/analysis/equipped-inventory-0.113.2.md.
//! Appearance overrides remain in `outfit`; these records describe actual items.
//! Current generated names: docs/analysis/amulet-names-0.115.0.md.

use std::{collections::BTreeMap, sync::{OnceLock, atomic::{AtomicU32, Ordering}}};

use azeroth_survivors_re::loot_rewards::{SEAL_OF_THE_DAMNED_TICK_CAP, amulets};
use benilla_app::local_client::{
    events::{LocalPresentationEvents, ObjectFields, SessionEvent},
    ItemInfo, ItemSpellEntry, LocalClientSession, LocalClientSet, LocalItemDescriptions, LocalItemQueries,
    LocalItemSets,
};
use bevy::prelude::*;
use serde::Deserialize;

use super::super::{mechanics::Mechanics, RunSession};
use crate::{armory::ArmoryCatalog, catalog::MenuCatalog, localization::Localization,
    menu_state::MenuState};

const ITEM_GUID: u64 = 0x4000_0000_0000_0000;
// Current14597ffe5 allocates from one process-wide atomic, shared by all heroes.
static NEXT_JEWELRY: AtomicU32 = AtomicU32::new(0);

pub(super) fn install(app: &mut App) {
    app.init_resource::<Publisher>()
        .add_systems(First, leave.before(super::sync_to_client))
        .add_systems(First, sync.after(super::sync_to_client).before(LocalClientSet::Lifecycle));
}

/// Native Game+358 rows. Identity compares the slot, translated name, quality and
/// complete text lines; equal rows retain the complete previous record.
#[derive(Clone, Debug, PartialEq)]
struct Item {
    slot: u8,
    entry: u32,
    guid: u64,
    name: String,
    display: u32,
    quality: u32,
    class: u32,
    subclass: u32,
    inventory_type: u32,
    sheath: u32,
    armor: u32,
    health: i32,
    item_set: u32,
    lines: Vec<String>,
    flavor: String,
}

impl Item {
    fn create(&self, owner: u64) -> SessionEvent {
        SessionEvent::ItemCreate {
            guid: self.guid,
            container: false,
            fields: ObjectFields::from_pairs(&[
                (0, self.guid as u32), (1, (self.guid >> 32) as u32),
                (2, 3), (3, self.entry), (4, 1.0f32.to_bits()),
                (6, owner as u32), (7, (owner >> 32) as u32),
                (8, owner as u32), (9, (owner >> 32) as u32), (14, 1),
            ]),
        }
    }

    fn template(&self, texts: &mut LocalItemDescriptions) -> ItemInfo {
        // Current1459b1d90 keeps four individual lines; the fifth joins all remaining
        // lines with the native "\nEquip: " separator. The registry interns full text.
        let mut lines = self.lines.iter().take(4).cloned().collect::<Vec<_>>();
        if self.lines.len() > 4 { lines.push(self.lines[4..].join("\nEquip: ")); }
        let spells = lines.into_iter().enumerate().map(|(index, text)| {
            let spell_id = texts.intern(&text);
            ItemSpellEntry { index: index as u8, spell_id, trigger: 1, charges: 0,
                cooldown_ms: -1, category: 0, category_cooldown_ms: -1 }
        }).collect();
        ItemInfo {
            class: self.class, subclass: self.subclass, name: self.name.clone(),
            display_info_id: self.display, quality: self.quality, flags: 0,
            buy_price: 0, sell_price: 0, inventory_type: self.inventory_type,
            allowable_class: -1, allowable_race: -1, item_level: 60,
            required_level: 0, required_skill: 0, required_skill_rank: 0,
            required_spell: 0, required_honor_rank: 0, required_city_rank: 0,
            required_rep_faction: 0, required_rep_rank: 0, max_count: 0,
            stackable: 1, container_slots: 0, stats: vec![(1, self.health)],
            damages: Vec::new(), dmg_min: 0.0, dmg_max: 0.0, dmg_type: 0,
            armor: self.armor, resistances: [0; 6], delay_ms: 2000,
            ammo_type: 0, ranged_mod_range: 0.0, spells, spell_charges_0: 0,
            use_spell: None, bonding: u32::from(!self.lines.is_empty()),
            description: self.flavor.clone(), page_text: 0, language_id: 0,
            page_material: 0, start_quest: 0, lock_id: 0, material: 0,
            sheath: self.sheath, random_property: 0, block: 0, item_set: self.item_set,
            max_durability: 0, area: 0, map: 0, bag_family: 0,
        }
    }
}

#[derive(Resource, Default)]
struct Publisher {
    identity: Option<u64>,
    rows: Vec<Item>,
    inputs: Option<Inputs>,
    set_language: Option<&'static str>,
}

#[derive(PartialEq)]
struct Inputs {
    identity: u64,
    language: &'static str,
    jewelry: Vec<(&'static str, usize, u32, u32)>,
    amulet: Option<(&'static str, usize, u32)>,
}

impl Publisher {
    fn take_rows(&mut self) -> Vec<Item> {
        self.identity = None;
        self.inputs = None;
        std::mem::take(&mut self.rows)
    }

    fn remove(&mut self) -> Vec<SessionEvent> {
        let rows = self.take_rows();
        if rows.is_empty() { return Vec::new() }
        vec![SessionEvent::ObjectsRemoved(rows
            .into_iter().map(|item| item.guid).collect())]
    }

    fn retire(&mut self) -> Vec<SessionEvent> {
        self.take_rows().into_iter()
            .map(|item| SessionEvent::ObjectDestroyed(item.guid)).collect()
    }

    fn publish(&mut self, identity: u64, owner: u64, mut ordinary: Vec<Item>,
        mut jewelry: Vec<Item>) -> Vec<SessionEvent>
    {
        let new_run = self.identity != Some(identity);
        let mut events = if new_run { self.remove() } else { Vec::new() };
        let old_slots = self.rows.iter().map(|item| (item.slot, item.guid))
            .collect::<BTreeMap<_, _>>();
        for item in &mut jewelry {
            if let Some(previous) = self.rows.iter().find(|previous| {
                previous.slot == item.slot && previous.name == item.name
                    && previous.quality == item.quality && previous.lines == item.lines
            }) {
                *item = previous.clone();
            } else {
                item.entry = 900_000 + NEXT_JEWELRY.fetch_add(1, Ordering::Relaxed) % 100_000_000;
                item.guid = ITEM_GUID | u64::from(item.entry);
            }
        }
        // Baselines and validated frozen gear occupy ordinary catalog slots;
        // run jewelry uses only1/10..13. Neither source can consume the other.
        debug_assert!(ordinary.iter().all(|item| !jewelry.iter().any(|row| row.slot == item.slot)));
        ordinary.extend(jewelry);
        for item in &ordinary {
            if !self.rows.iter().any(|old| old.guid == item.guid && old.entry == item.entry) {
                events.push(item.create(owner));
            }
        }
        let mut fields = Vec::new();
        for slot in 0..19u8 {
            let guid = ordinary.iter().find(|item| item.slot == slot).map_or(0, |item| item.guid);
            if new_run || old_slots.get(&slot).copied().unwrap_or(0) != guid {
                let field = 486 + u16::from(slot) * 2;
                fields.extend([(field, guid as u32), (field + 1, (guid >> 32) as u32)]);
            }
        }
        if !fields.is_empty() {
            events.push(SessionEvent::ObjectValues { guid: owner,
                fields: ObjectFields::from_pairs(&fields) });
        }
        let removed = self.rows.iter().filter(|old| !ordinary.iter().any(|item| item.guid == old.guid))
            .map(|item| item.guid).collect::<Vec<_>>();
        if !removed.is_empty() { events.push(SessionEvent::ObjectsRemoved(removed)); }
        self.rows = ordinary;
        self.identity = Some(identity);
        events
    }
}

/// Current command6's Game+3a8 item pass uses each retained record's actual ID.
/// Take the publisher's exact records so ordinary equip reconciliation cannot
/// preserve an item which has already been destroyed during Again.
pub(in crate::gameplay) fn retire(world: &mut World) -> Vec<SessionEvent> {
    if !world.contains_resource::<Publisher>() { return Vec::new(); }
    world.resource_mut::<Publisher>().retire()
}

/// Flush the ordinary removal handlers while the old connection still exists.
/// The parent may end the session later in First, before ordinary packet dispatch.
fn leave(world: &mut World) {
    let leaving = {
        let menu = world.resource::<MenuState>();
        let session = world.resource::<RunSession>();
        !menu.entering && (!menu.in_run || session.mechanics.is_none())
    };
    if leaving && world.resource::<LocalClientSession>().active {
        let events = world.resource_mut::<Publisher>().remove();
        world.resource_mut::<LocalPresentationEvents>().0.extend(events);
        benilla_app::local_client::events::flush_events(world);
    }
}

fn sync(
    session: Res<RunSession>, menu: Res<MenuState>, armory: Res<ArmoryCatalog>,
    labels: Res<MenuCatalog>, locale: Res<Localization>, client: Res<LocalClientSession>,
    mut publisher: ResMut<Publisher>, mut packets: ResMut<LocalPresentationEvents>,
    mut queries: ResMut<LocalItemQueries>, mut texts: ResMut<LocalItemDescriptions>,
    mut sets: ResMut<LocalItemSets>,
    coop:Option<Res<crate::coop_runtime::CoopRuntime>>,
) {
    // Set metadata and ranked activation are local client callbacks even
    // when the item templates arrive from the cooperative host.
    if menu.in_run && client.active && publisher.set_language != Some(locale.code()) {
        sets.records = item_sets(&armory, &labels);
        sets.normalize = Some(|id| azeroth_survivors_re::sets::decode_set_id(id)
            .map(azeroth_survivors_re::sets::SetIdentity::item_set_id));
        sets.bonus_activation = Some(set_bonus_active);
        sets.intern_bonus_descriptions = true;
        publisher.set_language = Some(locale.code());
    }
    let ranked_items = session.entry_hero.as_ref().filter(|_| menu.in_run && client.active)
        .map_or([(0, 0); 19], |hero| std::array::from_fn(|slot| {
            (crate::save::gear::faction_item(session.starting_gear[slot], hero.race),
                session.starting_stars[slot])
        }));
    if sets.ranked_items != ranked_items {
        sets.ranked_items = ranked_items;
    }
    if coop.as_ref().is_some_and(|runtime|runtime.is_guest()) {
        answer_guest_local_queries(client.active, &armory, &labels, &mut queries,
            &mut texts, &mut packets);
        return;
    }
    let Some(game) = session.mechanics.as_ref().filter(|_| menu.in_run && client.active) else {
        queries.0.clear();
        return;
    };
    let Some(player) = client.player.as_ref() else { return };
    let hero = session.entry_hero.as_ref();
    let race = hero.map_or(player.race, |hero| hero.race);
    let class = hero.map_or(player.class, |hero| hero.class);
    let inputs = Inputs { identity: session.identity, language: locale.code(),
        jewelry: game.jewelry().iter().map(|row| (row.definition.key, row.rarity,
            row.value.value.to_bits(), row.value.upgrades)).collect(),
        amulet: game.worn_amulet().map(|row| (row.payload.key.as_str(), row.rarity, row.picks)) };
    if publisher.inputs.as_ref() != Some(&inputs) {
        let ordinary = equipped(&armory, &labels, race, class, session.starting_gear,
            game.equipment_stars());
        packets.0.extend(publisher.publish(session.identity, player.guid, ordinary,
            temporary(game, &locale, &labels)));
        publisher.inputs = Some(inputs);
    }
    // Collected after the previous UI feed, answered before the gameplay's
    // separate request drain. No query or template is synthesized by the addon.
    for (entry, _guid) in std::mem::take(&mut queries.0) {
        let published = publisher.rows.iter().find(|item| item.entry == entry);
        let stars = game.item_star_rank(entry)
            .unwrap_or_else(|| menu.backend_save.star_count(entry));
        let definition = definition(&armory, &labels, entry, stars);
        let info = definition.as_ref().or(published)
            .map(|item| Box::new(item.template(&mut texts)));
        packets.0.push(SessionEvent::ItemTemplate { entry, info });
    }
}

fn answer_guest_local_queries(
    active: bool, armory: &ArmoryCatalog, labels: &MenuCatalog,
    queries: &mut LocalItemQueries, texts: &mut LocalItemDescriptions,
    packets: &mut LocalPresentationEvents,
) {
    // These demands were collected while the native guest forwarding gate was
    // still closed. Resolve the ordinary constructor without host/run star state;
    // synchronized host replies arrive on their independent wire path.
    for (entry, _guid) in std::mem::take(&mut queries.0) {
        if active {
            let info = definition(armory, labels, entry, 0)
                .map(|item| Box::new(item.template(texts)));
            packets.0.push(SessionEvent::ItemTemplate { entry, info });
        }
    }
}

/// Native 0x145e34820 compares the selected tier with the four-piece tier
/// list or the single active eight-piece tier. The set ID's class byte does
/// not gate activation. Unsupported thresholds retain the engine fallback.
fn set_bonus_active(set_id: u32, threshold: u32, gear: &[u32; 19],
    stars: &[u8; 19]) -> Option<bool>
{
    use azeroth_survivors_re::sets;
    if set_id < 0xa000 { return None; }
    let tier = match (set_id & 15) as u8 {
        15 => 5,
        tier @ (0..=5 | 7) => tier,
        _ => return None,
    };
    let lookup = |id| {
        let piece = crate::save::gear::decode(id)?;
        Some(sets::Piece {
            class_id: piece.class,
            slot: usize::from(piece.slot),
            tier: usize::from(piece.rarity_digit),
        })
    };
    match threshold {
        4 => Some(sets::four_piece_tiers(gear, stars, lookup).contains(&tier)),
        8 => Some(sets::active(gear, stars, lookup).is_some_and(|active| active.tier == tier)),
        _ => None,
    }
}

/// Publish named members and bonus descriptions for the existing tooltip.
fn item_sets(catalog: &ArmoryCatalog, labels: &MenuCatalog)
    -> std::collections::HashMap<u32, benilla_ui::script::ItemSetView>
{
    use azeroth_survivors_re::sets;
    let mut output = std::collections::HashMap::new();
    for class in &catalog.classes {
        for tier in (0..sets::TIERS).chain(std::iter::once(usize::from(sets::TIER_HALF))) {
            for horde in [false, true] {
                if horde && tier != 5 { continue; }
                let members = (0..sets::ARMOR_SLOTS).map(|slot| {
                    let id = 100_000 + u32::from(class.id) * 1_000
                        + slot as u32 * 100 + tier as u32 * 10 + u32::from(horde) * 10;
                    catalog.piece(id).map(|piece| (id,
                        Some(crate::armory::piece_name(labels, piece, 1))))
                }).collect::<Option<Vec<_>>>();
                let Some(members) = members else { continue; };
                let four = crate::armory::set_four_bonus(labels, class.id, tier as u8);
                let mut bonuses = Vec::new();
                if !four.is_empty() {
                    bonuses.push((4, labels.label("{bonus} (pieces at {stars}+ stars)")
                        .replace("{bonus}", &four).replace("{stars}", "1")));
                }
                if let Some(eight) = crate::armory::set_eight_bonus(labels, class.id, tier as u8, false) {
                    let text = if tier == usize::from(sets::TIER_HALF) {
                        let empowered = crate::armory::set_eight_bonus(labels, class.id, tier as u8, true)
                            .unwrap_or_default();
                        labels.label("{bonus} (all eight at {stars}+ stars) At {max}: {empowered}")
                            .replace("{empowered}", &empowered)
                    } else {
                        labels.label("{bonus} (all eight at {stars}+ stars; half again as strong at {max})").to_owned()
                    };
                    bonuses.push((8, text.replace("{bonus}", &eight).replace("{stars}", "3").replace("{max}", "5")));
                }
                let id = sets::SetIdentity { class_id: class.id,
                    tier: tier as u8, horde_pvp: horde }.item_set_id();
                output.insert(id, benilla_ui::script::ItemSetView {
                    name: crate::armory::set_name(labels, class.id, tier),
                    members, bonuses, ..Default::default()
                });
            }
        }
    }
    output
}

fn equipped(catalog: &ArmoryCatalog, labels: &MenuCatalog, race: u8, class: u8,
    saved: [u32; 19], stars: [u8; 19]) -> Vec<Item>
{
    let mut ids = catalog.starters.iter().find(|row| row.race == race && row.class == class)
        .map_or([0; 19], |row| row.slots);
    for (slot, id) in saved.into_iter().enumerate().filter(|(_, id)| *id != 0) {
        ids[slot] = crate::save::gear::faction_item(id, race);
    }
    if catalog.piece(ids[15]).is_some_and(|piece| piece.inventory_type == 17) { ids[16] = 0; }
    ids.into_iter().enumerate().filter_map(|(slot, id)| {
        let mut item = definition(catalog, labels, id, stars[slot])?;
        item.slot = slot as u8;
        item.guid = ITEM_GUID | (0x100 + slot as u64);
        Some(item)
    }).collect()
}

/// The native query constructor resolves the requested ID, independently of
/// the caller's race or current equipment. PvP IDs encode their own faction;
/// `equipped` converts the saved ID before reaching this ordinary constructor.
fn definition(catalog: &ArmoryCatalog, labels: &MenuCatalog, id: u32, stars: u8) -> Option<Item> {
    let mut item = empty(0);
    item.entry = id;
    if let Some(piece) = catalog.piece(id) {
        item.item_set = azeroth_survivors_re::sets::item_set_id(id, |id| {
            crate::save::gear::decode(id).map(|piece| azeroth_survivors_re::sets::Piece {
                class_id: piece.class,
                slot: usize::from(piece.slot),
                tier: usize::from(piece.set_tier()),
            })
        });
        item.name = crate::armory::piece_name(labels, piece, 1);
        item.display = piece.display_id(1);
        item.class = piece.item_class;
        item.subclass = piece.item_subclass;
        item.inventory_type = piece.inventory_type;
        item.sheath = piece.sheath;
        item.quality = match piece.rarity {
            4 if piece.item_class != 2 => 4,
            5 | 7 => 4,
            rarity => rarity as u32 + 1,
        };
        let effects = piece.effects_at_stars(stars);
        item.health = effects.iter().filter(|(tag, _)| *tag == 2)
            .fold(0i32, |sum, (_, value)| sum.wrapping_add(value.round() as i32));
        item.lines = effects.iter().filter_map(|&(tag, value)| {
            let text = crate::armory::effect_line(labels, u32::from(tag), value);
            (!text.is_empty()).then_some(text)
        }).collect();
        item.flavor = labels.label(if stars == 0 { "item.not_upgraded" } else { "item.upgraded" })
            .replace("{n}", &stars.to_string()).replace("{of}", "5");
        item.armor = armor(piece.item_class, piece.item_subclass, piece.rarity);
    } else if let Some(starter) = catalog.starter_items.iter().find(|item| item.id == id) {
        item.name = crate::armory::starter_name(labels, starter).to_owned();
        item.display = starter.display_id;
        item.class = starter.item_class;
        item.subclass = starter.item_subclass;
        item.inventory_type = starter.inventory_type;
        item.sheath = starter.sheath;
        item.quality = 1;
    } else if let Some(display) = crate::progression::tabard_display_id(id) {
        item.name = tabard_name(labels, id)?;
        item.display = display;
        item.class = 4;
        item.inventory_type = 19;
        item.quality = if crate::progression::is_purchasable_tabard(id) { 2 } else { 3 };
    } else if let Some(cosmetic) = azeroth_survivors_re::armory_cosmetics::get(id) {
        item.name = crate::armory::cosmetic_name(labels, cosmetic).to_owned();
        item.display = cosmetic.display_id;
        item.inventory_type = u32::from(cosmetic.inventory_type);
        item.quality = 2;
    } else { return None }
    Some(item)
}

fn armor(class: u32, subclass: u32, rarity: usize) -> u32 {
    if class != 4 { return 0 }
    let scale = [1.0f32, 1.7, 2.5, 3.5, 4.6, 4.0, 4.0, 4.3][rarity.min(7)];
    if subclass == 6 { (300.0 * scale) as u32 }
    else { (([0.0f32, 6.0, 12.0, 22.0, 40.0][subclass.min(4) as usize] * scale) * 4.0) as u32 }
}

pub(crate) fn item_name(catalog: &ArmoryCatalog, labels: &MenuCatalog, entry: u32) -> SessionEvent {
    let name = definition(catalog, labels, entry, 0).map(|item| item.name);
    SessionEvent::ItemName { entry: entry & 0x7fff_ffff, name }
}

fn empty(slot: u8) -> Item {
    Item { slot, entry: 0, guid: 0, name: String::new(), display: 0, quality: 0,
        class: 4, subclass: 0, inventory_type: 0, sheath: 0, armor: 0, health: 0,
        item_set: 0, lines: Vec::new(), flavor: String::new() }
}

fn ranked(name: &str, picks: u32) -> String {
    match picks {
        0 | 1 => name.to_owned(),
        2..=10 => format!("{name} {}", ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"][picks as usize]),
        _ => format!("{name} X+"),
    }
}

fn temporary(game: &Mechanics, locale: &Localization, labels: &MenuCatalog) -> Vec<Item> {
    let mut output = Vec::new();
    for category in 0..=1 {
        for (index, row) in game.jewelry().iter().filter(|row| row.definition.slot == category).take(2).enumerate() {
            let mut item = empty((10 + category * 2) + index as u8);
            let name = locale.lookup(&format!("jewel.{}", row.definition.key)).unwrap_or(row.definition.name);
            item.name = ranked(name, row.value.upgrades);
            item.display = icon_display(row.definition.icon);
            item.quality = row.rarity as u32 + 1;
            item.inventory_type = 11 + u32::from(category);
            item.lines = jewelry_lines(labels, row.definition.tag, row.value.value, row.definition.base);
            output.push(item);
        }
    }
    if let Some(row) = game.worn_amulet() {
        let mut item = empty(1);
        item.name = ranked(&locale.amulet_name(&row.payload.name,
            row.payload.ability_key.as_deref()), row.picks);
        item.display = icon_display(&row.payload.icon);
        item.quality = row.rarity as u32 + 1;
        item.inventory_type = 2;
        item.lines = amulet_lines(labels, row.payload, row.rarity, row.picks);
        if let Some(line) = azeroth_survivors_re::loot_rewards::prose::amulet_target_upgrades(
            row.payload, row.rarity, row.picks,
        ) {
            item.lines.push(line.render(&|key| labels.label(key).to_owned()));
        }
        output.push(item);
    }
    output
}

/// Current145849050 builds character-panel sentences, independently from the
/// reward card's compact description. Stable source tags retain Mystaria19.
fn jewelry_lines(labels: &MenuCatalog, tag: u8, amount: f32, base: f32) -> Vec<String> {
    let ordinary = |tag, value| crate::armory::effect_line(labels, tag, value);
    let stat = |key: &str, value| labels.label(key)
        .replace("{p}", &crate::armory::native_percent(value))
        .replace("{v}", &crate::armory::native_decimal(value));
    let health = |value| stat("Increases your maximum health by {p}.", value);
    match tag {
        0 | 1 | 3 | 4 => vec![ordinary(u32::from(tag), amount)],
        2 => vec![health(amount)],
        5 | 19 => {
            let reduction = if tag == 5 { amount.min(base * 3.0) }
                else { (amount * f32::from_bits(0x3e23_d70a)).min(f32::from_bits(0x3df5_c28f)) };
            let mut armor = ordinary(6, reduction);
            let capped = if tag == 5 { amount >= base * 3.0 + f32::from_bits(0xb586_37bd) }
                else { amount * f32::from_bits(0x3e23_d70a) >= f32::from_bits(0x3df5_c209) };
            if capped {
                // Native removes only a final ASCII/full-width period before
                // appending the localized max marker, then restores it.
                let punctuation = armor.chars().last().filter(|c| matches!(c, '.' | '。'));
                if punctuation.is_some() { armor.pop(); }
                armor.push_str(labels.label(" (max)"));
                if let Some(punctuation) = punctuation { armor.push(punctuation); }
            }
            if tag == 5 { vec![armor, health(amount * 4.0)] }
            else { vec![health(amount), armor] }
        }
        6 => vec![ordinary(7, amount)],
        7 => vec![ordinary(10, amount)],
        8 => vec![ordinary(12, amount)],
        9 => vec![ordinary(5, amount)],
        10 => vec![ordinary(8, amount)],
        11 => vec![stat("Increases experience gained by {p}.", amount)],
        12 => vec![ordinary(9, amount)],
        13 => vec![stat("Increases your luck by {p}.", amount)],
        14 => vec![stat("Each enemy you kill restores {v} health.", amount)],
        15 => vec![labels.label("Returns you to life at half health when you die. Holds {n} lives at most.").replace("{n}", "2")],
        16 => vec![stat("Your damage, haste, shield and thorns buffs are {p} stronger.", amount)],
        17 => vec![stat("Heals you for {p} of all damage you deal.", amount)],
        18 => vec![labels.label("Your damage over time spells tick {v}% faster: more ticks, and more damage, in the same time. {max}% at most.")
            .replace("{v}", &format!("{:.0}", amount * 100.0))
            .replace("{max}", &format!("{:.0}", SEAL_OF_THE_DAMNED_TICK_CAP * 100.0))],
        _ => Vec::new(),
    }
}

fn stat_line(labels: &MenuCatalog, tag: u8, value: f32) -> String {
    let gear_tag = match tag {
        0 | 1 | 3 | 4 => Some(u32::from(tag)),
        5 => Some(6), 6 => Some(7), 7 => Some(5), 8 => Some(10),
        9 => Some(8), 11 => Some(9), 13 => Some(12), _ => None,
    };
    if let Some(tag) = gear_tag { return crate::armory::effect_line(labels, tag, value); }
    let key = match tag {
        2 => "Increases your maximum health by {p}.",
        10 => "Increases experience gained by {p}.",
        12 => "Increases your luck by {p}.",
        14 => "Heals you for {p} of all damage you deal.",
        15 => "Each enemy you kill restores {v} health.",
        16 => "Increases your weapon damage by {p}.",
        17 => "Increases the damage your pets deal by {p}.",
        18 => "Increases damage dealt to crowd-controlled enemies by {p}.",
        19 => "Increases damage dealt to elites and bosses by {p}.",
        20 => "Increases damage dealt to enemies below 30% health by {p}.",
        21 => "Increases damage dealt to afflicted enemies by {p}.",
        22 => "Melee attackers take {p} of the damage they deal you.",
        23 => "Your damage, haste, shield and thorns buffs are {p} stronger.",
        _ => return String::new(),
    };
    labels.label(key).replace("{p}", &crate::armory::native_percent(value))
        .replace("{v}", &crate::armory::native_decimal(value))
}

/// Native1459a9e30 shares effect expressions with reward cards, while its stat
/// sentences, spell-modifier keys, percentage precision and punctuation differ.
fn amulet_lines(labels: &MenuCatalog, definition: &amulets::Definition,
    rarity: usize, picks: u32) -> Vec<String>
{
    let Some(texts) = amulets::description_lines(definition, rarity, picks) else { return Vec::new() };
    definition.effects.iter().zip(texts).map(|(record, text)| {
        let bytes = amulets::equipped_bytes(definition, record, rarity, picks);
        if bytes[0] == 30 {
            return stat_line(labels, bytes[8], f32::from_le_bytes(bytes[4..8].try_into().unwrap()));
        }
        let all = matches!(&record.effect, amulets::Effect::Spell { selector: amulets::Selector::All, .. });
        let translate = |key: &str| {
            let sentence = match key {
                "{who}: +{g} healing" => "Increases the healing of {who} by {g}.",
                "{who}: +{g} absorb" => "Increases the absorb of {who} by {g}.",
                "{who}: +{v} absorb cap" => "Increases the absorb cap of {who} by {v}.",
                "{who}: +{v} damage" => "Increases the damage of {who} by {v}.",
                "{who}: +{v} demon damage" => "Increases the damage of {who} by {v}.",
                "{who}: -{v} cooldown" => "Reduces the cooldown of {who} by {v}.",
                "{who}: +{n} target" if all => "{who} strike 1 more target.",
                "{who}: +{n} target" => "{who} strikes 1 more target.",
                "{who}: +{n} targets" => "{who} strikes {n} more targets.",
                "{who}: +{v} area" => "Increases the area of {who} by {v}.",
                "{who}: +{v} duration" => "Increases the duration of {who} by {v}.",
                "{who}: +{v} of max health as damage" => "{who} deals an extra {v} of your maximum health.",
                "{who}: +{v} strength" => "Increases the strength of {who} by {v}.",
                "{who}: +{v} weakening" => "Increases how much {who} weakens enemies by {v}.",
                "{who}: +{v} stun duration" => "Increases the stun duration of {who} by {v}.",
                "{who}: +{v} proc rate" => "{who} procs {v} more often.",
                _ => key,
            };
            labels.label(sentence).to_owned()
        };
        let mut line = if bytes[0] == 31 {
            text.render_with_percent(&translate, &crate::armory::native_percent)
        } else { text.render(&translate) };
        // Current passive formatter always appends one literal ASCII period.
        // Spell modifier/stat sentence keys already include their punctuation.
        if bytes[0] != 31 { line.push('.'); }
        line
    }).collect()
}

fn icon_display(icon: &str) -> u32 {
    #[derive(Deserialize)] struct Icons { rows: Vec<Icon> }
    #[derive(Deserialize)] struct Icon { icon: String, display_id: u32 }
    static ICONS: OnceLock<Icons> = OnceLock::new();
    ICONS.get_or_init(|| serde_json::from_str(include_str!("../../../assets/inventory-icons-0.113.2.json"))
        .expect("current native icon/display table")).rows.iter()
        .find(|row| row.icon.eq_ignore_ascii_case(icon)).map_or(0, |row| row.display_id)
}

fn tabard_name(labels: &MenuCatalog, id: u32) -> Option<String> {
    #[derive(Deserialize)] struct Catalog { tabards: Vec<Tabard> }
    #[derive(Deserialize)] struct Tabard { id: u32, name: String }
    static CATALOG: OnceLock<Catalog> = OnceLock::new();
    CATALOG.get_or_init(|| {
        let mut catalog: Catalog = serde_json::from_str(include_str!(
            "../../../assets/rewards-catalogs-0.112.0.json"
        )).expect("native tabard names");
        let additions: Catalog = serde_json::from_str(include_str!(
            "../../../assets/party-rewards-0.117.0.json"
        )).expect("current co-op tabard name");
        catalog.tabards.extend(additions.tabards);
        catalog
    }).tabards.iter().find(|tabard| tabard.id == id)
        .map(|tabard| labels.labels.get(&format!("tabard.{id}"))
            .unwrap_or(&tabard.name).to_owned())
}

#[cfg(test)]
mod tests {
    use super::*;

    fn ring(value: &str) -> Item {
        let mut row = empty(10);
        row.name = "Band".into();
        row.display = 9835;
        row.quality = 2;
        row.inventory_type = 11;
        row.lines = vec![value.into()];
        row
    }

    #[test]
    fn retirement_takes_only_the_selected_publishers_actual_item_ids() {
        let mut first = RemoteInventory::default();
        let mut second = RemoteInventory::default();
        let mut item = ring("retained");
        item.guid = ITEM_GUID | 0x100;
        item.entry = 42;
        first.publisher.publish(1, 10, vec![item.clone()], Vec::new());
        second.publisher.publish(1, 20, vec![item.clone()], Vec::new());
        assert!(matches!(first.retire().as_slice(),
            [SessionEvent::ObjectDestroyed(guid)] if *guid == item.guid));
        assert!(first.retire().is_empty());
        assert_eq!(second.publisher.rows.len(), 1, "private owners may use identical item GUIDs");
        let replacement = first.publisher.publish(2, 10, vec![item], Vec::new());
        assert!(matches!(replacement.first(), Some(SessionEvent::ItemCreate { .. })));
    }

    #[test]
    fn real_entry_items_keep_baseline_and_faction_identity_without_looks() {
        let catalog = ArmoryCatalog::embedded();
        let labels = MenuCatalog::embedded();
        let mut saved = [0; 19];
        saved[0] = 101_050;
        let rows = equipped(&catalog, &labels, 2, 1, saved, [0; 19]);
        let head = rows.iter().find(|row| row.slot == 0).unwrap();
        assert_eq!((head.entry, head.display, head.guid),
            (101_060, 30374, ITEM_GUID | 0x100));
        assert!(rows.iter().any(|row| row.slot == 3));
        // No cosmetic map reaches this function. In particular a hidden head
        // appearance cannot remove its real equipped item, link or tooltip.
        let mut slots = std::collections::BTreeSet::new();
        assert!(rows.iter().all(|row| slots.insert(row.slot)));
        assert!(rows.iter().all(|row| !matches!(row.slot, 1 | 10..=13)));
        // Generic ItemQuery IDs encode their own faction, even before a run
        // has ever equipped that definition.
        assert_eq!(definition(&catalog, &labels, 101_050, 0).unwrap().display, 30316);
        assert_eq!(definition(&catalog, &labels, 101_060, 0).unwrap().display, 30374);
        assert!(definition(&catalog, &labels, 123_456_789, 0).is_none());
        for starter in &catalog.starters {
            let mut publisher = Publisher::default();
            let ordinary = equipped(&catalog, &labels, starter.race, starter.class, [0; 19], [0; 19]);
            let jewelry = [1, 10, 11, 12, 13].into_iter().map(|slot| {
                let mut row = ring("effect");
                row.slot = slot;
                row
            }).collect();
            publisher.publish(1, 1, ordinary, jewelry);
            let mut slots = std::collections::BTreeSet::new();
            assert!(publisher.rows.iter().all(|row| slots.insert(row.slot)));
        }
    }

    #[test]
    fn upgrading_replaces_the_dynamic_entry_unchanged_rows_retain_it() {
        let mut publisher = Publisher::default();
        let first = publisher.publish(1, 1, Vec::new(), vec![ring("old")]);
        assert!(matches!(first.first(), Some(SessionEvent::ItemCreate { .. })));
        let old = publisher.rows[0].clone();
        assert!((900_000..100_900_000).contains(&old.entry));
        assert!(publisher.publish(1, 1, Vec::new(), vec![ring("old")]).is_empty());
        let mut display_only = ring("old");
        display_only.display = 12345;
        assert!(publisher.publish(1, 1, Vec::new(), vec![display_only]).is_empty());
        assert_eq!(publisher.rows[0].display, old.display);
        let next = publisher.publish(1, 1, Vec::new(), vec![ring("new")]);
        let upgraded = publisher.rows[0].entry;
        assert_ne!(upgraded, old.entry);
        assert!(matches!(&next[..], [SessionEvent::ItemCreate { .. },
            SessionEvent::ObjectValues { .. }, SessionEvent::ObjectsRemoved(ids)] if ids == &[old.guid]));
        let removed = publisher.publish(1, 1, Vec::new(), Vec::new());
        assert!(matches!(&removed[..], [SessionEvent::ObjectValues { fields, .. },
            SessionEvent::ObjectsRemoved(_)] if fields.player_inv_slot(10) == Some(0)));
        publisher.publish(2, 1, Vec::new(), vec![ring("new")]);
        assert_ne!(publisher.rows[0].entry, old.entry);
        assert_ne!(publisher.rows[0].entry, upgraded);
    }

    #[test]
    fn dynamic_item_ids_do_not_collide_between_party_members_or_reconnects() {
        let mut host = Publisher::default();
        let mut guest = Publisher::default();
        host.publish(1, 1, Vec::new(), vec![ring("host")]);
        guest.publish(1, 2, Vec::new(), vec![ring("guest")]);
        let first = host.rows[0].clone();
        let second = guest.rows[0].clone();
        assert_ne!(first.entry, second.entry);
        assert_ne!(first.guid, second.guid);
        drop(guest);
        let mut reconnected = Publisher::default();
        reconnected.publish(1, 2, Vec::new(), vec![ring("guest")]);
        assert_ne!(reconnected.rows[0].entry, first.entry);
        assert_ne!(reconnected.rows[0].entry, second.entry);
        assert!(host.publish(1, 1, Vec::new(), vec![ring("host")]).is_empty());
        assert_eq!(host.rows[0], first);
    }

    #[test]
    fn template_text_ids_survive_runs_and_join_only_the_fifth_spell() {
        let mut texts = LocalItemDescriptions::default();
        let mut row = ring("one");
        row.lines = ["one", "two", "three", "four", "five", "six"]
            .into_iter().map(str::to_owned).collect();
        let info = row.template(&mut texts);
        assert_eq!(info.spells.len(), 5);
        assert_eq!(texts.0[4], (0x00f0_0004, "five\nEquip: six".into()));
        assert_eq!(info.stats, [(1, 0)]);
        assert_eq!((info.item_level, info.delay_ms, info.bonding), (60, 2000, 1));
        assert!(info.spells.iter().all(|spell| spell.trigger == 1 && spell.cooldown_ms == -1));
        let again = row.template(&mut texts);
        assert_eq!(again.spells, info.spells);
        assert_eq!(texts.0.len(), 5);
        assert_eq!(ranked("Band", 1), "Band");
        assert_eq!(ranked("Band", 2), "Band II");
        assert_eq!(ranked("Band", 10), "Band X");
        assert_eq!(ranked("Band", 11), "Band X+");
    }

    #[test]
    fn item_effect_ids_share_the_prior_set_callback_registry_history() {
        let mut texts = LocalItemDescriptions::default();
        assert_eq!(texts.intern("set four"), 0x00f0_0000);
        assert_eq!(texts.intern("set eight"), 0x00f0_0001);
        let mut row = ring("set four");
        row.lines.push("equipment".into());
        let info = row.template(&mut texts);
        assert_eq!(info.spells.iter().map(|spell| spell.spell_id).collect::<Vec<_>>(),
            vec![0x00f0_0000, 0x00f0_0002]);
        assert_eq!(texts.intern("set eight"), 0x00f0_0001);
        assert_eq!(texts.0.len(), 3);
    }

    #[test]
    fn queued_guest_local_queries_answer_only_ordinary_zero_star_templates() {
        let catalog = ArmoryCatalog::embedded();
        let labels = MenuCatalog::embedded();
        let entry = 101_000;
        let ordinary = definition(&catalog, &labels, entry, 0).unwrap();
        let mut queries = LocalItemQueries(vec![(entry, 42), (900_001, 0), (u32::MAX, 0)]);
        let mut texts = LocalItemDescriptions::default();
        let first = texts.intern("prior callback text");
        let mut packets = LocalPresentationEvents::default();
        answer_guest_local_queries(true, &catalog, &labels, &mut queries, &mut texts, &mut packets);
        assert!(queries.0.is_empty());
        let SessionEvent::ItemTemplate { entry: actual, info: Some(info) } = &packets.0[0] else {
            panic!("ordinary guest query did not receive a template");
        };
        assert_eq!(*actual, entry);
        assert_eq!(info.name, ordinary.name);
        assert_eq!(info.stats, [(1, ordinary.health)]);
        assert_eq!(info.description, ordinary.flavor);
        assert!(matches!(&packets.0[1], SessionEvent::ItemTemplate { entry: 900_001, info: None }));
        assert!(matches!(&packets.0[2], SessionEvent::ItemTemplate { info: None, .. }));
        assert_eq!(texts.intern("prior callback text"), first);

        let before = texts.0.clone();
        queries.0.push((entry, 0));
        packets.0.clear();
        answer_guest_local_queries(false, &catalog, &labels, &mut queries, &mut texts, &mut packets);
        assert!(queries.0.is_empty());
        assert!(packets.0.is_empty());
        assert_eq!(texts.0, before, "an absent engine port cannot construct or intern a template");
    }

    #[test]
    fn temporary_lines_match_current_native_constructor_vectors() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../tests/fixtures/equipped-inventory-0.113.2.json"
        )).unwrap();
        let labels = MenuCatalog::embedded();
        let lines = |row: &serde_json::Value| row["lines"].as_array().unwrap().iter()
            .map(|line| line.as_str().unwrap().to_owned()).collect::<Vec<_>>();
        for row in fixture["jewelry"].as_array().unwrap() {
            let tag = row["tag"].as_u64().unwrap() as u8;
            let mut expected = lines(row);
            if tag == 18 {
                for line in &mut expected {
                    *line = line.replace("40% at most.", "100% at most.");
                }
            }
            assert_eq!(jewelry_lines(&labels, tag,
                row["amount"].as_f64().unwrap() as f32, row["base"].as_f64().unwrap() as f32), expected);
        }
        for row in fixture["amulets"].as_array().unwrap() {
            let definition = amulets::catalog().by_key(row["key"].as_str().unwrap()).unwrap();
            let mut expected = lines(row);
            let rarity = row["rarity"].as_u64().unwrap() as usize;
            let picks = row["picks"].as_u64().unwrap() as u32;
            let cap = azeroth_survivors_re::loot_rewards::amulet_effect_multiplier(rarity, picks);
            match definition.key.as_str() {
                "legendary:consecration" => {
                    // The 0.140.0 Inferno constructor omits the historical damage row.
                    expected.remove(2);
                }
                "legendary:pw_shield" => {
                    expected[0] = format!("Increases the absorb cap of Power Word: Shield by {}.",
                        crate::armory::native_percent(0.5 * cap));
                }
                "legendary:ice_barrier" => {
                    expected[0] = format!("Increases the absorb cap of Ice Barrier by {}.",
                        crate::armory::native_percent(cap));
                    expected.remove(2);
                }
                _ => {}
            }
            assert_eq!(amulet_lines(&labels, definition, rarity, picks), expected, "{}", definition.key);
        }
    }
}

/// Recipient catalogs are rebuilt from canonical keys, never host-translated
/// strings. Cache them for the member's language without persisting a selection.
struct ItemLocale {
    code: String,
    locale: Localization,
    labels: MenuCatalog,
}
impl ItemLocale {
    fn new(host: &Localization, code: &str) -> Self {
        let locale = host.for_code(code);
        let labels = locale.menu_catalog();
        Self { code: code.to_owned(), locale, labels }
    }
}

/// A distinct per-hero native inventory publisher over the same item constructors.
/// Only the owning guest receives these private object/template packets.
#[derive(Default)]
pub(crate) struct RemoteInventory {
    publisher: Publisher,
    display: Option<ItemLocale>,
}
impl RemoteInventory {
    pub(crate) fn retire(&mut self) -> Vec<SessionEvent> {
        self.publisher.retire()
    }

    fn set_locale(&mut self, host: &Localization, code: &str) {
        if self.display.as_ref().is_none_or(|display| display.code != code) {
            self.display = Some(ItemLocale::new(host, code));
        }
    }

    pub(crate) fn publish(&mut self, identity: u64,
        hero: &azeroth_survivors_re::coop::server_party::NativeHero,
        game: &Mechanics, armory: &ArmoryCatalog, host: &Localization) -> Vec<SessionEvent> {
        self.set_locale(host, &String::from_utf8_lossy(&hero.bytes_30));
        let display = self.display.as_ref().expect("recipient item locale");
        self.publisher.publish(identity, hero.guid,
            equipped(armory, &display.labels, hero.race, hero.class, hero.words_188,
                game.equipment_stars()),
            temporary(game, &display.locale, &display.labels))
    }

    pub(crate) fn query(&mut self, entry: u32, stars: u8, armory: &ArmoryCatalog,
        host: &Localization, code: &str, texts: &mut LocalItemDescriptions) -> SessionEvent {
        self.set_locale(host, code);
        let display = self.display.as_ref().expect("recipient item locale");
        let published = self.publisher.rows.iter().find(|item| item.entry == entry);
        let item = definition(armory, &display.labels, entry, stars);
        let info = item.as_ref().or(published)
            .map(|item| Box::new(item.template(texts)));
        SessionEvent::ItemTemplate { entry, info }
    }

    pub(crate) fn query_name(&mut self, entry: u32, armory: &ArmoryCatalog,
        host: &Localization, code: &str) -> SessionEvent {
        self.set_locale(host, code);
        let display = self.display.as_ref().expect("recipient item locale");
        item_name(armory, &display.labels, entry)
    }
}
