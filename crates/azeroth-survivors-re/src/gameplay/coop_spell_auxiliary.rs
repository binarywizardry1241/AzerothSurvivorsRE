//! Current145901de0 auxiliary resource rows, after ordinary spell resources.
use super::mechanics::Mechanics;
use crate::localization::Localization;
use azeroth_survivors_re::{coop::replication::ResourceRow, run_effects};
use azeroth_survivors_re::player_abilities::behavior::buffs::{Aura, effective_auras};

fn row(id: u32, name: String, text: String) -> ResourceRow {
    ResourceRow {
        id,
        name,
        text_18: text.clone(),
        text_30: text,
        optional: [None, None, None, None],
    }
}

/// 0.141.1 145f51390 updates the aura tooltip of an existing Battle Shout
/// resource from the strongest effective contribution, including a friend.
pub(super) fn active_battle_shout(
    rows: &mut [ResourceRow],
    auras: &[Aura],
    now: f32,
    buff_bonus: f32,
    locale: &Localization,
) {
    let Some(aura) = effective_auras(auras, now, buff_bonus)
        .find(|aura| aura.spell_id == 6673 && now < aura.expires_at) else { return; };
    if aura.effect.tag != 8 { return; }
    let Some(row) = rows.iter_mut().find(|row| row.id == aura.spell_id) else { return; };
    let percent = aura.buff_strength(buff_bonus) * 100.0;
    row.text_30 = locale.label("Damage increased by {p}%.")
        .replace("{p}", &format!("{percent:.0}"));
}

pub(super) fn append(rows: &mut Vec<ResourceRow>, game: &Mechanics, locale: &Localization) {
    rows.push(row(
        23451,
        locale.label("Speed").to_owned(),
        locale.label("Movement speed increased by 60%.").to_owned(),
    ));
    rows.push(row(
        23505,
        locale.label("Berserking").to_owned(),
        locale.label("Damage increased by 50%.").to_owned(),
    ));
    let effects = game.spell_auxiliary_effects(locale);
    //1458f72c0: first raw18/20/31, first19, then every15. Current raw31
    // Soul Link uses the source's reserved253/31 identity.
    let first_shield = effects.iter().position(|entry| {
        let effect = &entry.effect;
        matches!(effect.tag(), 18 | 20) || effect.tag() == 253 && effect.bytes[63] == 31
    });
    let first_rescue = effects.iter().position(|entry| entry.effect.tag() == 19);
    let selected = first_shield
        .map(|index| (index, 0))
        .into_iter()
        .chain(first_rescue.map(|index| (index, 2)))
        .chain(
            effects
                .iter()
                .enumerate()
                .filter(|(_, entry)| entry.effect.tag() == 15)
                .map(|(index, _)| (index, 1)),
        );
    for (index, kind) in selected {
        let entry = &effects[index];
        let effect = &entry.effect;
        let name = entry.name.clone().unwrap_or_default();
        // Both native callers alias the same actor-localized Game+850 name.
        // A recipient's translated title cannot select a different aura ID.
        let id = run_effects::player_auras::player_aura_alias(
            entry.identity.as_deref().unwrap_or(""),
            kind,
        );
        let text = match kind {
            0 => locale.label("Absorbs {n} damage.").replace(
                "{n}",
                &shield_amount(game.execution.vitals.absorb).to_string(),
            ),
            1 => stat_description(
                effect.bytes[1],
                effect.float(4) * entry.stacks as f32,
                locale,
            )
            .unwrap_or_default(),
            _ => locale
                .label("You were saved from death, and can't be again until this wears off.")
                .to_owned(),
        };
        rows.push(row(id, name, text));
    }
    // Native effect12, retained source11: learned cooldown markers precede
    // the racial marker and deliberately share IDs across learned abilities.
    for (instance, racial) in game
        .abilities
        .iter()
        .map(|instance| (instance, false))
        .chain(game.racial.iter().map(|instance| (instance, true)))
    {
        if instance.definition.effect.tag != 11 {
            continue;
        }
        let name = locale
            .lookup(&format!("ability.{}.name", instance.definition.key))
            .unwrap_or(instance.definition.name)
            .to_owned();
        let text = locale
            .label("{spell} can't protect you again until this wears off.")
            .replace("{spell}", &name);
        rows.push(row(if racial { 6788 } else { 25771 }, name, text));
    }
    //14585c430 resolves each permanent25 spell ID against the current class's
    // talent descriptors;145855690 always formats rank1 for this display path.
    for entry in &effects {
        let effect = &entry.effect;
        if effect.tag() != 25 {
            continue;
        }
        let id = effect.word(4);
        let Some((fallback, text)) = game.spell_permanent_description(id, locale) else {
            continue;
        };
        rows.push(row(id, entry.name.clone().unwrap_or(fallback), text));
    }

    // 0.140.0 resource owner 145f3c6c0 publishes the shared debuff
    // and the two equipped Enhancement buff descriptions.
    rows.push(row(
        7386,
        locale.label("Elemental Sunder").to_owned(),
        locale.label("Taking 10% increased Fire and Nature damage.").to_owned(),
    ));
    let enhancement_rank = |subtype| {
        effects.iter().find_map(|entry| {
            let effect = &entry.effect;
            (effect.tag() == 54 && effect.bytes[4] == subtype)
                .then_some(u32::from(effect.bytes[5]))
        })
    };
    for (subtype, id, name, template, per_rank) in [
        (10, 16280, "Flurry", "Rockbiter Weapon and Stormstrike cooldowns recover {p}% faster.", 6),
        (3, 16246, "Shattering Elements", "Your next different Shock deals +{p}% damage.", 4),
    ] {
        if let Some(rank) = enhancement_rank(subtype) {
            let text = locale.label(template).replace("{p}", &(rank * per_rank).to_string());
            rows.push(row(id, locale.label(name).to_owned(), text));
        }
    }
    // 145f3dfbe..145f3e5f0 appends Stormguard only to the Lightning
    // Shield aura text. The ordinary spell description is independent.
    if let Some(rank) = enhancement_rank(1).filter(|&rank| rank > 0) {
        let Some(shield) = rows.iter_mut().find(|row| row.id == 324) else {
            return;
        };
        if !shield.text_30.is_empty() {
            shield.text_30.push('\n');
        }
        shield.text_30.push_str(
            &locale.label("Stormguard: you take {p}% less damage.")
                .replace("{p}", &(rank * 3).to_string()),
        );
    }
}

fn shield_amount(absorb: f32) -> u32 {
    absorb.max(0.).round() as u32
}

///145844b50 uses its own percentage/decimal rules rather than damage rounding.
fn decimal(value: f32) -> String {
    let rounded = (value * 10.).round() / 10.;
    if rounded.fract() == 0. {
        format!("{rounded:.0}")
    } else {
        format!("{rounded:.1}")
    }
}

fn stat_description(tag: u8, amount: f32, locale: &Localization) -> Option<String> {
    let template = *STAT_TEMPLATES.get(usize::from(tag))?;
    let value = if matches!(tag, 6 | 15 | 25 | 26) {
        decimal(amount)
    } else {
        let percent = amount * 100.;
        format!(
            "{}%",
            if percent.abs() < 10. {
                decimal(percent)
            } else {
                format!("{:.0}", percent.round())
            }
        )
    };
    Some(
        locale
            .label(template)
            .replace("{p}", &value)
            .replace("{v}", &value),
    )
}

const STAT_TEMPLATES: [&str; 33] = [
    "Increases all damage you deal by {p}.",
    "Reduces the cooldown of your spells by {p}.",
    "Increases your maximum health by {p}.",
    "Improves your chance to get a critical strike by {p}.",
    "Increases the damage of your critical strikes by {p}.",
    "Reduces all damage taken by {p}.",
    "Restores {v} health per second.",
    "Increases your movement speed by {p}.",
    "Increases the area of effect of your spells by {p}.",
    "Increases the range you pick up loot from by {p}.",
    "Increases experience gained by {p}.",
    "Increases gold found by {p}.",
    "Increases your luck by {p}.",
    "Gives your spells a {p} chance to cast twice.",
    "Heals you for {p} of all damage you deal.",
    "Each enemy you kill restores {v} health.",
    "Increases your weapon damage by {p}.",
    "Increases the damage your pets deal by {p}.",
    "Increases damage dealt to crowd-controlled enemies by {p}.",
    "Increases damage dealt to elites and bosses by {p}.",
    "Increases damage dealt to enemies below 30% health by {p}.",
    "Increases damage dealt to afflicted enemies by {p}.",
    "Melee attackers take {p} of the damage they deal you.",
    "Your damage, haste, shield and thorns buffs are {p} stronger.",
    "Restores {p} of your maximum health per second.",
    "Increases all damage you deal by {v}% for every 10% damage reduction you have.",
    "Each 1% of damage reduction past the cap increases your damage by {v}%.",
    "Raises your damage reduction cap by {p}.",
    "Increases all damage you deal by {p} while a shield holds.",
    "Improves your demons' chance to get a critical strike by {p}.",
    "Increases the damage of your Imps' Firebolts by {p}.",
    "Gives your demons' attacks a {p} chance to strike again.",
    "Increases the damage of your Infernal and Doomguard by {p}.",
];

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    #[test]
    fn current_native_battle_shout_tooltip_uses_the_received_winner() {
        use crate::player_abilities::{StatusEffect, behavior::buffs::Aura};
        let proof: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/battle-shout.json"
        )).unwrap();
        let locale = Localization::english_for_tests();
        for case in proof["aura_consumers"].as_array().unwrap() {
            let f = |value: &Value| f32::from_bits(value.as_u64().unwrap() as u32);
            let auras = case["rows"].as_array().unwrap().iter().map(|row| Aura {
                source_guid: row[0].as_u64().unwrap(),
                effect: StatusEffect { tag: row[1].as_u64().unwrap() as u32,
                    value: f(&row[2]), duration: 0.0 },
                spell_id: row[3].as_u64().unwrap() as u32,
                expires_at: f(&row[4]), healing_power: 0.0,
            }).collect::<Vec<_>>();
            let buff_bonus = f(&case["buff_bonus"]);
            let mut rows = vec![row(6673, "Battle Shout".into(), "original".into())];
            active_battle_shout(&mut rows, &auras, f(&case["now"]), buff_bonus, &locale);
            let expected = if case["tooltip_percent"].is_null() { "original".into() }
                else { format!("Damage increased by {:.0}%.", f(&case["tooltip_percent"])) };
            assert_eq!(rows[0].text_30, expected);
            assert_eq!(rows[0].text_18, "original");
            let mut absent = Vec::new();
            active_battle_shout(&mut absent, &auras, f(&case["now"]), buff_bonus, &locale);
            assert!(absent.is_empty(), "native override only updates an existing resource");
        }
    }

    #[test]
    fn current_native_absorb_display_rounding() {
        let proof: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.115.0/coop-spell-text/auxiliary-contract.json"
        ))
        .unwrap();
        for row in proof["shield_cases"].as_array().unwrap() {
            assert_eq!(
                shield_amount(f32::from_bits(row["amount_bits"].as_u64().unwrap() as u32)),
                row["value"].as_u64().unwrap() as u32
            );
        }
    }

    #[test]
    fn current_native_stat_and_alias_vectors() {
        let proof: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.115.0/coop-spell-text/auxiliary-contract.json"
        ))
        .unwrap();
        let locale = Localization::english_for_tests();
        for row in proof["stat_cases"].as_array().unwrap() {
            let amount = f32::from_bits(row["amount_bits"].as_u64().unwrap() as u32);
            assert_eq!(
                stat_description(row["tag"].as_u64().unwrap() as u8, amount, &locale).unwrap(),
                row["text"].as_str().unwrap()
            );
        }
        for row in proof["alias_cases"].as_array().unwrap() {
            assert_eq!(
                run_effects::player_auras::player_aura_alias(
                    row["name"].as_str().unwrap(),
                    row["kind"].as_u64().unwrap() as u8
                ),
                row["id"].as_u64().unwrap() as u32
            );
        }
    }
}
