//! AZSM loadouts project each owner's current authoritative state.

use super::*;
use crate::armory::ArmoryCatalog;
use crate::gameplay::detailed_meter::{
    DetailedLoadout, OwnerRows, Source, hero_id, wire_keys, wire_text,
};

pub(super) struct LoadoutView<'a> {
    pub guid: u64,
    pub race: u8,
    pub class: &'static player_abilities::ClassAbilities,
    pub equipment: &'a [u32; 19],
    pub learned: &'a [RuntimeInstance<'static>],
    pub racial: Option<&'a RuntimeInstance<'static>>,
    pub effects: &'a effects::EffectsState,
    pub treasure: &'a treasure::TreasureState,
    pub credits: Option<&'a OwnerRows>,
}

impl LoadoutView<'_> {
    pub fn capture(&self, armory: &ArmoryCatalog) -> DetailedLoadout {
        let owner = hero_id(self.guid);
        let mut loadout = DetailedLoadout::default();
        let icons = self
            .equipment
            .iter()
            .any(|id| *id != 0)
            .then(crate::native_dbc::item_icon_dictionary)
            .flatten();
        let display_icon = |display: u32| icons.and_then(|rows| rows.get(&display)).cloned();
        loadout.records.push(format!("LE,{owner},0,0,0,,,,"));
        for (index, &id) in self.equipment.iter().enumerate() {
            let slot = index + 1;
            if id == 0 {
                loadout.records.push(format!("LE,{owner},{slot},1,0,,,,"));
                continue;
            }
            let key = format!("item:{id}");
            let instance = format!("inv:{slot}:{id}");
            let (name, localization_key, icon) = if let Some(piece) = armory.piece(id) {
                (
                    piece.name(self.race),
                    piece.tier05_name_key(),
                    display_icon(piece.display_id(self.race)),
                )
            } else if let Some(starter) = armory.starter_items.iter().find(|item| item.id == id) {
                (
                    starter.name.as_str(),
                    Some(format!("starter.{id}")),
                    display_icon(starter.display_id),
                )
            } else if let Some(tabard) = crate::progression::tabard(id) {
                (
                    tabard.name.as_str(),
                    Some(format!("tabard.{id}")),
                    Some(tabard.icon.clone()),
                )
            } else if let Some(cosmetic) = azeroth_survivors_re::armory_cosmetics::get(id) {
                (
                    cosmetic.name.as_str(),
                    Some(format!("cosmetic.{id}")),
                    Some(cosmetic.icon.clone()),
                )
            } else {
                ("", None, None)
            };
            let mut source = Source::new(key.clone(), "item", "known", name);
            source.icon = icon;
            source.localization_key = localization_key;
            source.item_key = Some(key.clone());
            source.item_id = Some(id);
            loadout.sources.push(source);
            loadout.records.push(format!(
                "LE,{owner},{slot},1,1,{},{},,",
                wire_text(&instance),
                wire_text(&key)
            ));
        }
        for (index, instance) in self.learned.iter().enumerate() {
            push_ability(&mut loadout, &owner, instance, true, Some(index + 1));
        }
        if let Some(instance) = self.racial {
            push_ability(&mut loadout, &owner, instance, true, None);
        }
        for row in &self.effects.timed {
            if let Some(definition) = AbilityDefinition::by_key(row.key) {
                push_ability(
                    &mut loadout,
                    &owner,
                    &RuntimeInstance::learned(definition),
                    false,
                    None,
                );
            }
        }
        if let Some(class) = azeroth_survivors_re::run_effects::catalog()
            .classes
            .iter()
            .find(|class| class.id == self.class.class_id)
        {
            for (key, rank) in &self.effects.spell_display_talents {
                let Some(definition) = class.talents.iter().find(|talent| talent.key == *key)
                else {
                    continue;
                };
                let source = Source::talent(definition, *rank);
                let tree = format!("tree:{}.{}", self.class.key, definition.tree_index);
                let effects = self.interned_effect(&source.key);
                loadout.records.push(format!(
                    "LT,{owner},{},{rank},{},,{effects},",
                    wire_text(&source.key),
                    wire_text(&tree)
                ));
                loadout.sources.push(source);
            }
        }
        for jewel in &self.treasure.jewelry {
            let definition = jewel.definition;
            let key = format!("jewel:{}", definition.key);
            let rank = jewel.value.upgrades;
            let instance = format!("run:jewel:{}", definition.key);
            let mut source =
                Source::new(format!("{key}:r{rank}"), "item", "known", definition.name);
            source.localization_key = Some(format!("jewel.{}", definition.key));
            source.icon = Some(definition.icon.into());
            source.item_key = Some(key);
            source.item_instance_key = Some(instance.clone());
            source.rank = Some(rank);
            let category = if definition.slot == 0 {
                "ring"
            } else {
                "trinket"
            };
            loadout.records.push(format!(
                "LJ,{owner},{},{},{category},,",
                wire_text(&instance),
                wire_text(&source.key)
            ));
            loadout.sources.push(source);
        }
        if let Some(amulet) = &self.treasure.amulet {
            let source = Source::amulet(amulet.payload, amulet.picks);
            let effects = self.interned_effect(&source.key);
            loadout.records.push(format!(
                "LJ,{owner},{},{},amulet,,{effects}",
                wire_text(source.item_instance_key.as_deref().unwrap_or_default()),
                wire_text(&source.key)
            ));
            loadout.sources.push(source);
        }
        loadout
    }

    fn interned_effect(&self, key: &str) -> String {
        self.credits
            .filter(|rows| rows.uses_source(key))
            .map_or_else(String::new, |_| wire_text(key))
    }
}

fn push_ability(
    loadout: &mut DetailedLoadout,
    owner: &str,
    instance: &RuntimeInstance<'static>,
    selected: bool,
    slot: Option<usize>,
) {
    let definition = instance.definition;
    let rank = instance.rank;
    let mut effects = vec![Source::ability(definition, Some(rank), false)];
    if definition.pulse_spell_id != 0 && definition.pulse_spell_id != definition.spell_id {
        effects.push(Source::ability(definition, Some(rank), true));
    }
    let effect_keys = wire_keys(effects.iter().map(|effect| effect.key.as_str()));
    let selected = u8::from(selected);
    let slot = slot.map(|slot| slot.to_string()).unwrap_or_default();
    let key = wire_text(&effects[0].key);
    loadout.records.push(format!(
        "LB,{owner},{key},1,{selected},0,{rank},{slot},{effect_keys}"
    ));
    loadout.sources.extend(effects);
}
