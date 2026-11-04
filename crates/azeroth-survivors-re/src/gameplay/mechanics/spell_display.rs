//! Current145901de0 display inputs; reads live state without combat mutations.
use super::*;
use crate::localization::Localization;
use azeroth_survivors_re::run_effects::{EffectRow, Numeric};
use serde::Deserialize;
use std::sync::OnceLock;

#[derive(Deserialize)]
struct DisplayCatalog {
    target_sha256: String,
    classes: Vec<DisplayClass>,
    permanent: Vec<Permanent>,
}
#[derive(Deserialize)]
struct DisplayClass {
    id: u8,
    talents: Vec<DisplayTalent>,
}
#[derive(Deserialize)]
struct DisplayTalent {
    key: String,
    name: String,
    spells: Vec<String>,
}
#[derive(Deserialize)]
struct Permanent {
    class_id: u8,
    id: u32,
    name: String,
    description: String,
    numeric_values: Vec<Option<String>>,
}

pub struct AuxiliaryEffect {
    pub effect: EffectRow,
    /// Actor metadata identity drives both world auras and resource IDs.
    pub identity: Option<String>,
    /// The recipient may read a different translated title for that identity.
    pub name: Option<String>,
    pub stacks: u32,
}
fn catalog() -> &'static DisplayCatalog {
    static VALUE: OnceLock<DisplayCatalog> = OnceLock::new();
    VALUE.get_or_init(|| {
        let mut catalog: DisplayCatalog = serde_json::from_str(include_str!(
            "../../../assets/native-spell-talents-0.115.0.json"
        ))
        .expect("current spell display talent projection");
        assert_eq!(
            catalog.target_sha256,
            "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
        );
        // Wyvern Sting's live timer supplies the current spell tooltip row.
        let effects = azeroth_survivors_re::run_effects::catalog().classes.iter()
            .find(|class| class.id == 3).expect("native Hunter effects");
        let wyvern = effects.talents.iter().find(|talent| talent.key == "wyvern_sting")
            .expect("native Wyvern Sting");
        let timer = wyvern.effects.iter().find_map(|payload| {
            azeroth_survivors_re::run_effects::actions::TimedCast::from_effect(
                &EffectRow::talent(payload, 1), 0.0,
            )
        }).expect("native Wyvern Sting timed cast");
        let hunter = catalog.classes.iter_mut().find(|class| class.id == 3)
            .expect("Hunter tooltip projection");
        let wyvern = hunter.talents.iter_mut().find(|talent| talent.key == "wyvern_sting")
            .expect("Wyvern Sting tooltip projection");
        let old_trap = wyvern.spells.iter_mut().find(|spell| spell.as_str() == "explosive_trap")
            .expect("retained Wyvern Sting trap row");
        *old_trap = timer.key.to_owned();
        catalog
    })
}

impl Mechanics {
    fn armor_set_provenance(&self, index: usize, locale: &Localization) -> Option<String> {
        let state = &self.effect_state;
        if !(state.set_generic_start..state.set_generic_start + state.set_generic_count).contains(&index) {
            return None;
        }
        let descriptor = state.set_descriptor?;
        let key = if descriptor.tier == 5 {
            format!("set.pvp.{}", state.set_meter_name)
        } else {
            format!("set.{}.{}", self.class.key, descriptor.tier)
        };
        Some(locale.lookup(&key).unwrap_or(state.set_meter_name).to_owned())
    }
    /// Capture the actual actor locale before its talent/amulet metadata builds.
    /// The locale and metadata move with each hero's existing EffectsState.
    pub fn set_spell_display_locale(&mut self, locale: &Localization) {
        self.effect_state.display_locale = Some(locale.for_code(locale.code()));
        self.refresh_spell_display_names();
    }

    pub(super) fn refresh_spell_display_names(&mut self) {
        let talent_count = self.effect_state.equipped.generic_talent_count();
        let generated_key = self
            .worn_amulet()
            .and_then(|item| item.payload.ability_key.as_deref());
        let names = self
            .effect_state
            .provenance
            .iter()
            .enumerate()
            .map(|(index, provenance)| {
                if let Some(locale) = &self.effect_state.display_locale {
                    if let Some(name) = self.armor_set_provenance(index, locale) {
                        name
                    } else if index < talent_count {
                        locale.label(provenance).to_owned()
                    } else {
                        locale.amulet_name(provenance, generated_key)
                    }
                } else {
                    (*provenance).to_owned()
                }
            })
            .collect();
        self.effect_state.display_provenance = names;
    }

    pub fn spell_text_stats(&self) -> Numeric {
        self.effect_state.numeric
    }

    ///1459c2b50 retains each matching selected talent once, in definition
    /// order.14586b890 tests all its payloads; global selectors do not imply
    /// tooltip relevance. The constructor groups these already localized names.
    pub fn spell_talent_lines(
        &self,
        definition: &AbilityDefinition,
        locale: &Localization,
    ) -> Vec<String> {
        let Some(class) = catalog()
            .classes
            .iter()
            .find(|class| class.id == self.class.class_id)
        else {
            return Vec::new();
        };
        class
            .talents
            .iter()
            .filter(|talent| {
                self.effect_state
                    .spell_display_talents
                    .contains(&talent.key)
                    && talent.spells.iter().any(|key| key == definition.key)
            })
            .map(|talent| locale.label(&talent.name).to_owned())
            .collect()
    }

    pub fn spell_permanent_description(
        &self,
        id: u32,
        locale: &Localization,
    ) -> Option<(String, String)> {
        let row = catalog()
            .permanent
            .iter()
            .find(|row| row.class_id == self.class.class_id && row.id == id)?;
        Some((
            locale.label(&row.name).to_owned(),
            render_permanent(row, locale),
        ))
    }

    /// Native display selects the first shield, first rescue and every temporary
    /// stat before formatting them. Preserve original order and provenance here.
    /// Display stacks have a minimum of one, even for a retained zero-stack row.
    pub fn spell_auxiliary_effects(&self, locale: &Localization) -> Vec<AuxiliaryEffect> {
        let talent_count = self.effect_state.equipped.generic_talent_count();
        let generated_key = self
            .worn_amulet()
            .and_then(|item| item.payload.ability_key.as_deref());
        self.effect_state
            .equipped
            .rows
            .iter()
            .enumerate()
            .map(|(index, row)| {
                let stacks = self
                    .effect_state
                    .generic
                    .temporary
                    .entries
                    .iter()
                    .find(|entry| entry.effect_index == index)
                    .map_or(1, |entry| entry.stacks.max(1));
                let name = self
                    .effect_state
                    .provenance
                    .get(index)
                    .copied()
                    .map(|provenance| {
                        if let Some(name) = self.armor_set_provenance(index, locale) {
                            name
                        } else if index < talent_count {
                            locale.label(provenance).to_owned()
                        } else {
                            locale.amulet_name(provenance, generated_key)
                        }
                    });
                let identity = self
                    .effect_state
                    .provenance
                    .get(index)
                    .and_then(|_| self.effect_state.display_provenance.get(index))
                    .cloned();
                AuxiliaryEffect {
                    effect: row.clone(),
                    identity,
                    name,
                    stacks,
                }
            })
            .collect()
    }
}

fn render_permanent(row: &Permanent, locale: &Localization) -> String {
    let mut text = locale.label(&row.description).to_owned();
    if let Some(Some(value)) = row.numeric_values.first() {
        text = text.replace("{v}", value);
    }
    text
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn actor_locale_aliases_survive_recipient_translation_and_refresh() {
        use azeroth_survivors_re::run_effects::{
            actions::TemporaryStat, player_auras::player_aura_alias,
        };
        let english = Localization::english_for_tests();
        let french = english.for_code("fr");
        let mut game = super::super::rng_integration::class_run("warrior", 1);
        game.set_spell_display_locale(&french);
        game.configure_effects(&[("flurry".into(), 1)], &[]);
        let index = game
            .effect_state
            .provenance
            .iter()
            .position(|name| *name == "Flurry")
            .unwrap();
        game.effect_state
            .generic
            .temporary
            .entries
            .push(TemporaryStat {
                effect_index: index,
                stacks: 1,
                expires: 10.,
            });
        game.publish_player_auras();
        let id = game.player_auras()[0].unwrap().spell_id;
        assert_eq!(id, player_aura_alias("Rafale", 1));
        assert_ne!(id, player_aura_alias("Flurry", 1));
        for code in ["en", "fr", "de"] {
            let recipient = english.for_code(code);
            let rows = game.spell_auxiliary_effects(&recipient);
            let entry = &rows[index];
            assert_eq!(entry.identity.as_deref(), Some("Rafale"));
            assert_eq!(entry.name.as_deref(), Some(recipient.label("Flurry")));
            assert_eq!(player_aura_alias(entry.identity.as_deref().unwrap(), 1), id);
        }
        game.refresh_effects();
        assert_eq!(game.effect_state.display_provenance[index], "Rafale");
        assert_eq!(game.player_auras()[0].unwrap().spell_id, id);
        assert_eq!(
            game.effect_state.provenance[index], "Flurry",
            "raw combat/meter provenance remains intact"
        );
    }

    #[test]
    fn permanent_descriptions_match_current_native_rank_one() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../assets/native-spell-talents-0.115.0.json"
        ))
        .unwrap();
        let locale = Localization::english_for_tests();
        assert_eq!(
            catalog()
                .classes
                .iter()
                .map(|class| class.talents.len())
                .sum::<usize>(),
            355
        );
        for value in proof["permanent"].as_array().unwrap() {
            let row = catalog()
                .permanent
                .iter()
                .find(|row| {
                    u64::from(row.class_id) == value["class_id"].as_u64().unwrap()
                        && u64::from(row.id) == value["id"].as_u64().unwrap()
                })
                .unwrap();
            assert_eq!(
                render_permanent(row, &locale),
                value["rendered_rank1"].as_str().unwrap()
            );
        }
    }
}
