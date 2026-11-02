//! Current1458629b0 tooltip append contract, independent of the base description.
//! Byte-bound rules and formatting: coop-spell-text/append-contract.json.
use super::{Mechanics, native_overlay_payload};
use crate::localization::Localization;
use azeroth_survivors_re::player_abilities::RuntimeInstance;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(super) enum Mode {
    Learned,
    Unlearned,
    Racial,
    Talent,
}

pub(super) fn native_tag(instance: &RuntimeInstance<'_>) -> u32 {
    let definition = instance.definition;
    if definition.key == "demonic_empowerment" {
        10
    } else if definition.effect.tag >= 10 {
        definition.effect.tag + 1
    } else {
        definition.effect.tag
    }
}

fn fill(locale: &Localization, template: &str, values: &[(&str, String)]) -> String {
    let mut text = locale.label(template).to_owned();
    for (key, value) in values {
        text = text.replace(&format!("{{{key}}}"), value);
    }
    text
}

fn percent(locale: &Localization, template: &str, value: f32) -> String {
    fill(locale, template, &[("p", format!("{:.0}", value * 100.))])
}

fn targets(locale: &Localization, value: u32) -> String {
    if value == 1 {
        locale.label("+1 target").to_owned()
    } else {
        fill(locale, "+{n} targets", &[("n", value.to_string())])
    }
}

fn times(locale: &Localization, value: u32) -> String {
    match value {
        1 => locale.label("once").to_owned(),
        2 => locale.label("twice").to_owned(),
        _ => fill(locale, "{n} times", &[("n", value.to_string())]),
    }
}

pub(super) fn primary(
    text: String,
    game: &Mechanics,
    instance: &RuntimeInstance<'_>,
    mode: Mode,
    locale: &Localization,
) -> String {
    append(
        text,
        instance,
        mode,
        locale,
        &Inputs {
            stats: game.spell_text_stats().into(),
            damage: game.current_damage_multiplier(),
            cooldown: game.current_cooldown_multiplier(),
            talents: game.spell_talent_lines(instance.definition, locale),
        },
    )
}

struct Inputs {
    stats: BonusStats,
    damage: f32,
    cooldown: f32,
    talents: Vec<String>,
}

struct BonusStats {
    area: f32,
    targets: u32,
    buff_bonus: f32,
    crit: f32,
    crit_damage: f32,
    extra_cast: f32,
}
impl From<azeroth_survivors_re::run_effects::Numeric> for BonusStats {
    fn from(stats: azeroth_survivors_re::run_effects::Numeric) -> Self {
        Self {
            area: stats.area,
            targets: stats.targets,
            buff_bonus: stats.buff_bonus,
            crit: stats.crit,
            crit_damage: stats.crit_damage,
            extra_cast: stats.extra_cast,
        }
    }
}

fn append(
    mut text: String,
    instance: &RuntimeInstance<'_>,
    mode: Mode,
    locale: &Localization,
    inputs: &Inputs,
) -> String {
    let definition = instance.definition;
    let tag = native_tag(instance);
    let stats = &inputs.stats;
    // These comparisons use the literal f32 thresholds in the selected image.
    let increased = f32::from_bits(0x3f80a3d7); // 1.005
    let decreased = f32::from_bits(0x3f7eb852); // 0.995
    let epsilon = f32::from_bits(0x3ba3d70a); // 0.005
    if mode != Mode::Racial && tag == 12 {
        let interval = azeroth_survivors_re::player_abilities::damage::base_interval(
            instance, inputs.cooldown,
        );
        let duration = azeroth_survivors_re::player_abilities::damage::scaled_duration(instance);
        text.push(' ');
        text.push_str(&fill(
            locale,
            "Its cooldown starts when the immunity ends: {total} sec from one cast to the next.",
            &[("total", native_overlay_payload::number(interval + duration))],
        ));
    }
    let ordinary_damage = definition.kind != 9 && definition.base_power > 0.;
    let reflected_damage = definition.kind == 9 && tag == 13;
    let mut upgrades = Vec::new();
    if instance.power_multiplier > increased {
        let power = instance.power_multiplier;
        if ordinary_damage || reflected_damage {
            upgrades.push(percent(locale, "+{p}% damage", power - 1.));
        } else if definition.kind == 9 && matches!(tag, 6 | 7) {
            upgrades.push(percent(
                locale,
                if tag == 7 {
                    "+{p}% absorb"
                } else {
                    "+{p}% healing"
                },
                power.sqrt() - 1.,
            ));
        }
    }
    if instance.cooldown_multiplier < decreased {
        upgrades.push(percent(
            locale,
            "-{p}% cooldown",
            1. - instance.cooldown_multiplier,
        ));
    }
    if instance.target_bonus != 0 {
        upgrades.push(targets(locale, instance.target_bonus));
    }
    if instance.area_multiplier > increased {
        upgrades.push(percent(locale, "+{p}% area", instance.area_multiplier - 1.));
    }
    if instance.duration_multiplier > increased {
        upgrades.push(percent(
            locale,
            "+{p}% duration",
            instance.duration_multiplier - 1.,
        ));
    }
    let mut bonuses = Vec::new();
    let damage = inputs.damage;
    if (ordinary_damage || reflected_damage) && (damage - 1.).abs() > epsilon {
        bonuses.push(fill(
            locale,
            "{sign}{p}% damage",
            &[
                ("sign", if damage < 1. { "-" } else { "+" }.to_owned()),
                ("p", format!("{:.0}", (damage - 1.).abs() * 100.)),
            ],
        ));
    }
    let cooldown = inputs.cooldown;
    if cooldown < decreased {
        bonuses.push(percent(locale, "-{p}% cooldown", 1. - cooldown));
    }
    if (matches!(definition.kind, 2 | 3 | 4 | 8)
        || (definition.kind == 10 && definition.radius > 0.))
        && (stats.area - 1.).abs() > epsilon
    {
        bonuses.push(percent(locale, "+{p}% area", stats.area - 1.));
    }
    if definition.targets != 0 && stats.targets != 0 {
        bonuses.push(targets(locale, stats.targets));
    }
    if definition.kind == 9 && matches!(tag, 7..=10 | 13) && stats.buff_bonus > epsilon {
        bonuses.push(percent(locale, "+{p}% buff power", stats.buff_bonus));
    }
    let talents = inputs.talents.clone();
    let mut extras = Vec::new();
    if ordinary_damage && definition.kind != 6 {
        extras.push(fill(
            locale,
            "{p}% chance to crit for {crit}% damage",
            &[
                ("p", format!("{:.0}", stats.crit * 100.)),
                ("crit", format!("{:.0}", stats.crit_damage * 100.)),
            ],
        ));
    }
    if mode != Mode::Racial && definition.kind != 11 && stats.extra_cast > epsilon {
        let whole = stats.extra_cast.floor() as u32;
        let fraction = stats.extra_cast - stats.extra_cast.trunc();
        extras.push(if whole == 0 {
            percent(locale, "{p}% chance to cast twice", fraction)
        } else if fraction <= epsilon {
            fill(
                locale,
                "Casts {times}",
                &[("times", times(locale, whole.wrapping_add(1)))],
            )
        } else {
            fill(
                locale,
                "Casts {times}, {p}% chance to cast {more}",
                &[
                    ("times", times(locale, whole.wrapping_add(1))),
                    ("p", format!("{:.0}", fraction * 100.)),
                    ("more", times(locale, whole.wrapping_add(2))),
                ],
            )
        });
    }
    let groups = [
        ("|cffffffff", "Upgrades: ", upgrades),
        ("|cff1eff00", "Your bonuses: ", bonuses),
        ("|cff71d5ff", "Talents: ", talents),
        ("|cffffffff", "", extras),
    ]
    .into_iter()
    .filter(|(_, _, rows)| !rows.is_empty())
    .map(|(color, heading, rows)| format!("{color}{}{}|r", locale.label(heading), rows.join(", ")))
    .collect::<Vec<_>>();
    if !groups.is_empty() {
        text.push_str("\n\n");
        text.push_str(&groups.join("\n"));
    }
    let suffix = match mode {
        Mode::Learned => None,
        Mode::Unlearned => Some("Not learned yet: a level-up may offer it."),
        Mode::Racial => Some("Racial: casts on its own."),
        Mode::Talent => Some("A talent casts it on its own."),
    };
    if let Some(suffix) = suffix {
        text.push_str("\n\n|cff9d9d9d");
        text.push_str(locale.label(suffix));
        text.push_str("|r");
    }
    text
}

#[cfg(test)]
mod tests {
    use super::*;
    use azeroth_survivors_re::player_abilities::AbilityDefinition;
    use serde_json::Value;

    // Expectations are produced by unchanged current native append instructions;
    // these regression tests are authored but remain uncompiled in fixgap.
    #[test]
    fn all_native_append_vectors() {
        let fixture: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.115.0/coop-spell-text/append-fixtures.json"
        ))
        .unwrap();
        let locale = Localization::english_for_tests();
        let expected = fixture["expected"].as_array().unwrap();
        for row in fixture["results"].as_array().unwrap() {
            let key = row["key"].as_str().unwrap();
            let definition = AbilityDefinition::by_key(key).unwrap();
            for (scenario, input) in fixture["inputs"].as_array().unwrap().iter().enumerate() {
                let float = |map: &str, offset: &str, default: f32| {
                    input[map][offset].as_f64().map_or(default, |n| n as f32)
                };
                let word =
                    |map: &str, offset: &str| input[map][offset].as_u64().unwrap_or(0) as u32;
                let mut instance = RuntimeInstance::learned(definition);
                instance.power_multiplier = float("instance_f32", "16", 1.);
                instance.cooldown_multiplier = float("instance_f32", "20", 1.);
                instance.target_bonus = word("instance_u32", "24");
                instance.area_multiplier = float("instance_f32", "28", 1.);
                instance.duration_multiplier = float("instance_f32", "32", 1.);
                instance.talent_power_multiplier = float("instance_f32", "56", 1.);
                instance.talent_cooldown_multiplier = float("instance_f32", "60", 1.);
                instance.talent_area_multiplier = float("instance_f32", "68", 1.);
                instance.talent_duration_multiplier = float("instance_f32", "72", 1.);
                let inputs = Inputs {
                    stats: BonusStats {
                        area: float("stats_f32", "40", 1.),
                        targets: word("stats_u32", "52"),
                        buff_bonus: float("stats_f32", "64", 0.),
                        crit: float("stats_f32", "12", 0.),
                        crit_damage: float("stats_f32", "16", 1.),
                        extra_cast: float("stats_f32", "56", 0.),
                    },
                    damage: float("stats_f32", "4", 1.),
                    cooldown: float("stats_f32", "8", 1.),
                    talents: input["talents"]
                        .as_array()
                        .unwrap()
                        .iter()
                        .map(|s| s.as_str().unwrap().to_owned())
                        .collect(),
                };
                for (mode_index, mode) in
                    [Mode::Learned, Mode::Unlearned, Mode::Racial, Mode::Talent]
                        .into_iter()
                        .enumerate()
                {
                    let index = row["primary_indices"][scenario * 4 + mode_index]
                        .as_u64()
                        .unwrap() as usize;
                    let actual = append(
                        input["base"].as_str().unwrap().to_owned(),
                        &instance,
                        mode,
                        &locale,
                        &inputs,
                    );
                    assert_eq!(
                        actual,
                        expected[index].as_str().unwrap(),
                        "{key}, scenario {scenario}, {mode:?}"
                    );
                }
            }
        }
    }
}
