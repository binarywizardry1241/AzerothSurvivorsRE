//! 0.140.0 Prepared loadout, use and solo victory admission.
use super::*;
use azeroth_survivors_re::{run_effects::conditions::Event, sets};

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub(super) enum Use {
    #[default]
    Ineligible,
    Pending,
    Confirmed,
}

impl Use {
    pub(super) fn confirm(&mut self) {
        if *self == Self::Pending {
            *self = Self::Confirmed;
        }
    }
}

fn required_talents(class: u8) -> &'static [&'static str] {
    match class {
        1 => &["titan", "fortified"],
        2 => &["hammer_righteous", "ardent_defender"],
        3 => &["bestial_wrath"],
        4 => &["shadow_dance"],
        5 => &["shadowform", "shadowy_apparitions"],
        7 => &["enh_stormbound_echoes"],
        8 => &["water_elemental", "splitting_ice"],
        9 => &["rain_of_chaos", "conflagrate"],
        11 => &["tranquility", "swiftmend"],
        _ => &[],
    }
}

impl Mechanics {
    fn prepared_loadout(&self) -> bool {
        let class = self.class.class_id;
        let talents = required_talents(class);
        if talents.is_empty()
            || !talents.iter().all(|key| {
                self.effect_state
                    .spell_display_talents
                    .iter()
                    .any(|talent| talent.as_str() == *key)
            })
        {
            return false;
        }
        let piece = |id| {
            crate::save::gear::decode(id).map(|row| sets::Piece {
                class_id: row.class,
                slot: usize::from(row.slot),
                tier: usize::from(row.set_tier()),
            })
        };
        let matching = self
            .equipment_ids
            .iter()
            .filter_map(|&id| piece(sets::canonical_item(id)))
            .filter(|row| {
                row.class_id == class
                    && row.slot < sets::ARMOR_SLOTS
                    && row.tier == usize::from(sets::TIER_HALF)
            })
            .count();
        matching >= sets::ARMOR_SLOTS
            && sets::active(&self.equipment_ids, &self.equipment_stars(), piece)
                .is_some_and(|set| set.tier == sets::TIER_HALF)
    }

    pub fn begin_prepared_scholomance(&mut self) {
        if self.zone.key == "scholomance"
            && self.heroic_rank() == 5
            && !self.has_party()
            && self.prepared_loadout()
        {
            self.effect_state.generic.prepared = Use::Pending;
        }
    }

    pub(super) fn validate_prepared_loadout(&mut self) {
        if self.effect_state.generic.prepared != Use::Ineligible && !self.prepared_loadout() {
            self.effect_state.generic.prepared = Use::Ineligible;
        }
    }

    pub fn prepared_scholomance_clear(&self) -> bool {
        self.effect_state.generic.prepared == Use::Confirmed
            && !self.has_party()
            && self.victory_reached()
            && self.zone.key == "scholomance"
            && self.heroic_rank() == 5
            && self.prepared_loadout()
    }
}

fn admitted_hit(event: Event, key: Option<&str>, expected: &[&str]) -> bool {
    (event.kind == 0 || event.first_periodic)
        && event.source_kind != 2
        && key.is_some_and(|key| expected.contains(&key))
}

impl<W: RunWorld> CombatAdapter<'_, W> {
    pub(super) fn prepared_important_victim(&self, guid: u64) -> bool {
        self.bosses
            .iter()
            .any(|row| row.guid == guid && !row.actor.dead)
            || self.actors.iter().any(|row| {
                row.guid == guid
                    && !row.actor.dead
                    && (row.definition.flag_4c != 0 || self.guardian_state.contains(guid))
            })
    }

    pub(super) fn note_prepared_event(
        &mut self,
        event: Event,
        definition: Option<&AbilityDefinition>,
        victim: u64,
    ) {
        if self.generic.prepared != Use::Pending {
            return;
        }
        let key = definition.map(|spell| spell.key);
        let used = match self.class_id {
            1 => admitted_hit(event, key, &["shield_slam"]),
            2 => admitted_hit(event, key, &["hammer_of_justice"]),
            3 => {
                event.kind == 0
                    && event.source_kind == 2
                    && self.generic.meter_pet_entry == Some(9532)
            }
            4 => {
                admitted_hit(event, key, &["backstab", "eviscerate"])
                    && self.prepared_important_victim(victim)
            }
            5 => event.kind == 1 && event.source_kind != 2 && key == Some("sw_pain"),
            7 => admitted_hit(event, key, &["stormstrike"]),
            8 => event.kind == 0 && event.source_kind == 2 && event.spell_id == 116,
            9 => {
                self.prepared_important_victim(victim)
                    && self
                        .equipped
                        .rows
                        .iter()
                        .find(|row| {
                            row.tag() == 4 && row.word(16) == 348 && row.word(24) != u32::MAX
                        })
                        .is_some_and(|row| row.condition_matches(24, &event, definition, 0.0, 0.0))
                    && self
                        .periodic_rows(victim)
                        .is_some_and(|rows| rows.iter().any(|row| row.spell_id == 348))
            }
            _ => false,
        };
        if used {
            self.generic.prepared.confirm();
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::rng_integration::class_run;
    use super::*;

    #[test]
    fn prepared_clear_needs_current_loadout_and_confirmed_use() {
        let mut game = class_run("warrior", 1);
        game.zone = azeroth_survivors_re::zones::resolve("scholomance");
        game.rules.heroic_rank = 5;
        let mut equipment = [0; 19];
        let mut stars = [0; 19];
        for slot in 0..sets::ARMOR_SLOTS {
            equipment[slot] = azeroth_survivors_re::tier05::item_id(1, slot as u8);
            stars[slot] = 3;
        }
        let allocation = [("titan".into(), 1), ("fortified".into(), 1)];
        game.configure_armor_set(equipment, stars);
        game.configure_effects(&allocation[..1], &[]);
        game.begin_prepared_scholomance();
        assert_eq!(game.effect_state.generic.prepared, Use::Ineligible);
        game.configure_effects(&allocation, &[]);
        game.begin_prepared_scholomance();
        assert_eq!(game.effect_state.generic.prepared, Use::Pending);
        game.effect_state.victory_reached = true;
        assert!(!game.prepared_scholomance_clear());
        game.effect_state.generic.prepared.confirm();
        assert!(game.prepared_scholomance_clear());

        stars[0] = 2;
        game.configure_armor_set(equipment, stars);
        game.validate_prepared_loadout();
        assert_eq!(game.effect_state.generic.prepared, Use::Ineligible);
        assert!(!game.prepared_scholomance_clear());
    }
}
