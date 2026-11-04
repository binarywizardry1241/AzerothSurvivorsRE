//! Current145b2e8eb..145b2f1e0 Heroic clear presentation.
//! The native frontend ignores the accompanying type="heroic" JSON. Its
//! visible consumer is the ordinary green system-chat packet, not a toast.

use crate::catalog::MenuCatalog;

fn localized(key: &str, fallback: &str, label: &impl Fn(&str) -> String) -> String {
    let value = label(key);
    if value == key { fallback.to_owned() } else { value }
}

pub(super) fn message(class: u8, zone_key: &str, rank: u8, open: u8,
    catalog: &MenuCatalog, label: &impl Fn(&str) -> String) -> String
{
    let class_key = azeroth_survivors_re::coop::game_party::class_key(class);
    let class = catalog.classes.iter().find(|row| row.key == class_key)
        .expect("native class descriptor has a catalog fallback");
    let class_name = localized(&format!("class.{class_key}.name"), &class.name, label);
    let zone = azeroth_survivors_re::zones::resolve(zone_key);
    let zone_name = localized(&format!("zone.{}.name", zone.key), zone.name, label);
    let tier = if zone.key == azeroth_survivors_re::zones::scholomance::KEY {
        7 // Current locale and Tier 0.5 descriptors use rarity.7.
    } else {
        azeroth_survivors_re::mob_loot::BOSS_ZONES.iter()
            .find(|row| row.key == zone.key).expect("retained zone has a gear tier").tier
    };
    let set_key = format!("rarity.{tier}");
    let set = localized(&set_key, catalog.label(&set_key), label);
    //145afff40 localizes the rarity key; the victory owner looks up its result
    // once more before passing the set name to the named-template formatter.
    let set = label(&set);
    let name = |rank| azeroth_survivors_re::heroic::rank_name(
        rank, &label("Normal"), &label("Heroic"));
    let mut text = label("{heroic} of {zone} beaten: your {class}s' {set} gear may now go to {stars} stars.")
        .replace("{heroic}", &name(rank)).replace("{zone}", &zone_name)
        .replace("{class}", &class_name).replace("{set}", &set)
        .replace("{stars}", &rank.to_string());
    // This compares against the ceiling after recording the clear. It is not
    // a before/after ceiling-change test: another class may already have opened V.
    if open > rank {
        text.push(' ');
        text.push_str(&label("{heroic} is open to every class.").replace("{heroic}", &name(open)));
    }
    format!("|cff40ff40{text}|r")
}
