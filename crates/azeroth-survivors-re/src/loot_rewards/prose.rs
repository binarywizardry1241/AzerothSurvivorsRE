//! Selected-target native treasure descriptions145424a90/1455526c0.
//! Expressions retain localization templates and nested ability references;
//! their renderer receives the application's real locale lookup.

use super::{
    JewelryDefinition,
    amulets::{self, Definition, EffectRecord},
};
use crate::player_abilities::AbilityDefinition;

#[derive(Clone, Debug, PartialEq)]
pub enum Text {
    Literal(String),
    Percent(f32),
    Template {
        key: String,
        values: Vec<(String, Text)>,
    },
    Ability {
        key: String,
        fallback: String,
    },
    UpperFirst(Box<Text>),
    Concat(Vec<Text>),
}

impl Text {
    pub fn render(&self, label: &impl Fn(&str) -> String) -> String {
        self.render_with_percent(label, &|amount| format!("{:.0}%", amount * 100.0))
    }

    /// The character-panel constructor uses full stat precision, while reward
    /// cards use integer percentages. Preserve one effect expression tree.
    pub fn render_with_percent(
        &self, label: &impl Fn(&str) -> String, percent: &impl Fn(f32) -> String,
    ) -> String {
        match self {
            Self::Literal(value) => value.clone(),
            Self::Percent(value) => percent(*value),
            Self::Template { key, values } => {
                let mut value = label(key);
                for (key, replacement) in values {
                    value = value.replace(&format!("{{{key}}}"), &replacement.render_with_percent(label, percent));
                }
                value
            }
            Self::Ability { key, fallback } => {
                let value = label(key);
                if value == *key {
                    label(fallback)
                } else {
                    value
                }
            }
            Self::UpperFirst(value) => {
                let value = value.render_with_percent(label, percent);
                let mut chars = value.chars();
                chars
                    .next()
                    .map(|first| first.to_uppercase().collect::<String>() + chars.as_str())
                    .unwrap_or_default()
            }
            Self::Concat(values) => values.iter().map(|value| value.render_with_percent(label, percent)).collect(),
        }
    }
}

fn literal(value: impl ToString) -> Text {
    Text::Literal(value.to_string())
}
fn template(key: &str, values: Vec<(&str, Text)>) -> Text {
    Text::Template {
        key: key.to_owned(),
        values: values
            .into_iter()
            .map(|(key, value)| (key.to_owned(), value))
            .collect(),
    }
}
fn ability(key: &str) -> Option<Text> {
    let definition = AbilityDefinition::by_key(key)?;
    Some(Text::Ability {
        key: format!("ability.{key}.name"),
        fallback: definition.name.to_owned(),
    })
}
fn percent(value: f32) -> Text {
    Text::Percent(value)
}
fn integral(value: f32) -> Text {
    literal(format!("{value:.0}"))
}
fn number(value: f32) -> Text {
    if value >= f32::from_bits(0x411f_3333) {
        integral(value)
    } else {
        let mut value = format!("{value:.1}");
        if value.ends_with(".0") {
            value.truncate(value.len() - 2);
        }
        literal(value)
    }
}
fn float(bytes: &[u8; 64], offset: usize) -> f32 {
    f32::from_le_bytes(bytes[offset..offset + 4].try_into().unwrap())
}
fn word(bytes: &[u8; 64], offset: usize) -> u32 {
    u32::from_le_bytes(bytes[offset..offset + 4].try_into().unwrap())
}
fn key(record: &EffectRecord) -> Option<&str> {
    record
        .strings
        .iter()
        .find_map(|s| AbilityDefinition::by_key(&s.value).map(|_| s.value.as_str()))
}
fn hits(record: &EffectRecord, critical: bool) -> Option<Text> {
    if let Some(key) = key(record) {
        Some(template("{spell}'s hits", vec![("spell", ability(key)?)]))
    } else {
        Some(template(
            if critical {
                "your critical hits"
            } else {
                "your hits"
            },
            vec![],
        ))
    }
}
fn rate_limit(text: Text, limit: u32) -> Text {
    if limit == 0 {
        text
    } else {
        Text::Concat(vec![
            text,
            template(", at most {n} times a second", vec![("n", literal(limit))]),
        ])
    }
}

/// Current shared catalogue's native stat tags. No invented prose is produced
/// for an unrecognized tag; the caller keeps that reconstruction gap visible.
fn stat_description(tag: u8, amount: f32) -> Option<Text> {
    let (key, name, value) = match tag {
        0 => ("+{p} damage", "p", percent(amount)),
        1 => ("-{p} cooldowns", "p", percent(amount)),
        2 => ("+{p} max health", "p", percent(amount)),
        3 => ("+{p} critical strike", "p", percent(amount)),
        4 => ("+{p} critical strike damage", "p", percent(amount)),
        5 => ("+{p} damage reduction", "p", percent(amount)),
        6 => (
            "+{v} health per second",
            "v",
            literal(format!("{amount:.1}")),
        ),
        7 => ("+{p} movement speed", "p", percent(amount)),
        11 => ("+{p} gold", "p", percent(amount)),
        12 => ("+{p} luck", "p", percent(amount)),
        13 => ("{p} chance for a spell to cast twice", "p", percent(amount)),
        14 => (
            "Heals you for {p} of all damage dealt",
            "p",
            percent(amount),
        ),
        15 => (
            "Each kill heals {v} health",
            "v",
            literal(format!("{amount:.1}")),
        ),
        22 => (
            "Melee attackers take {p} of the damage they deal",
            "p",
            percent(amount),
        ),
        _ => return None,
    };
    Some(template(key, vec![(name, value)]))
}

fn effect_description(definition: &Definition, record: &EffectRecord, bytes: &[u8; 64]) -> Option<Text> {
    let value = |at| float(bytes, at);
    Some(match bytes[0] {
        30 if bytes[8] == 19 && definition.ability_key.as_deref() == Some("stormstrike") =>
            template(
                "{spell}: +{p} damage to bosses and elites",
                vec![("spell", ability("stormstrike")?), ("p", percent(value(4)))],
            ),
        30 => return stat_description(bytes[8], value(4)),
        49 => template(
            "{spell} slows by {pct} for {secs} sec",
            vec![
                ("spell", ability(key(record)?)?),
                ("pct", percent(value(24))),
                ("secs", number(value(28))),
            ],
        ),
        50 => template(
            "{spell} deals {bonus} more damage to already chilled enemies",
            vec![("spell", ability(key(record)?)?), ("bonus", percent(value(24)))],
        ),
        51 => template(
            "{spell} deals {bonus} more damage to enemies below {below} health",
            vec![
                ("spell", ability(key(record)?)?),
                ("bonus", percent(value(28))),
                ("below", percent(value(24))),
            ],
        ),
        52 => template(
            "A kill with {spell} cuts its remaining cooldown by {frac}",
            vec![("spell", ability(key(record)?)?), ("frac", percent(value(24)))],
        ),
        53 => template(
            "Each tick of {spell} also hits {n} nearby enemies within {radius} yd for {frac} damage",
            vec![
                ("spell", ability(key(record)?)?),
                ("n", literal(u32::from_le_bytes(bytes[24..28].try_into().unwrap()))),
                ("radius", number(value(32))),
                ("frac", percent(value(28))),
            ],
        ),
        55 => template(
            "{spell}'s primary hit unleashes a seismic shockwave, dealing {p} damage to enemies within {r} yd.",
            vec![
                ("spell", ability("rockbiter")?),
                ("p", percent(value(4))),
                ("r", number(value(8))),
            ],
        ),
        56 | 57 => template(
            if bytes[0] == 56 { "{spell}: {p} chance to cast a free {cast}" }
            else { "{spell}'s free {cast} deals {p} damage" },
            vec![
                ("spell", ability("stormstrike")?),
                ("cast", ability("chain_lightning")?),
                ("p", percent(value(4))),
            ],
        ),
        58 => template(
            "{spell} instantly deals {p} of your remaining {dot} damage to enemies hit, without removing {dot}.",
            vec![
                ("spell", ability("fire_nova")?),
                ("dot", ability("flame_shock")?),
                ("p", percent(value(4))),
            ],
        ),
        31 => {
            let who = if let Some(key) = key(record) {
                ability(key)?
            } else {
                template("Your spells", vec![])
            };
            let amount = value(32);
            let (pattern, name, value) = match bytes[36] {
                0 => {
                    let definition = key(record).and_then(AbilityDefinition::by_key);
                    match definition.map(|d| (d.kind, d.effect.tag)) {
                        Some((9, 6)) => (
                            "{who}: +{g} healing",
                            "g",
                            percent((1.0 + amount).sqrt() - 1.0),
                        ),
                        Some((9, 7)) => (
                            "{who}: +{g} absorb",
                            "g",
                            percent((1.0 + amount).sqrt() - 1.0),
                        ),
                        _ if definition
                            .is_some_and(|definition| definition.key == "demonic_empowerment") =>
                        {
                            ("{who}: +{v} demon damage", "v", percent(amount))
                        }
                        _ => ("{who}: +{v} damage", "v", percent(amount)),
                    }
                }
                1 => ("{who}: -{v} cooldown", "v", percent(amount)),
                2 => (
                    if amount == 1.0 {
                        "{who}: +{n} target"
                    } else {
                        "{who}: +{n} targets"
                    },
                    "n",
                    integral(amount),
                ),
                3 => ("{who}: +{v} area", "v", percent(amount)),
                4 => ("{who}: +{v} duration", "v", percent(amount)),
                5 => ("{who}: +{v} of max health as damage", "v", percent(amount)),
                amulets::ABSORB_CAP_MODIFIER => ("{who}: +{v} absorb cap", "v", percent(amount)),
                6 => {
                    let definition = AbilityDefinition::by_key(key(record)?)?;
                    let (pattern, name) = match (definition.kind, definition.effect.tag) {
                        (_, 10) if definition.key == "demonic_empowerment" => {
                            ("{who}: +{v} strength", "v")
                        }
                        (_, 10) => ("{who}: +{v} weakening", "v"),
                        (_, 8 | 9) => ("{who}: +{v} strength", "v"),
                        (_, 3) => ("{who}: +{v} stun duration", "v"),
                        (_, 7) => ("{who}: +{g} absorb", "g"),
                        (11, 0) => ("{who}: +{v} proc rate", "v"),
                        _ => return None,
                    };
                    (pattern, name, percent(amount))
                }
                _ => return None,
            };
            template(pattern, vec![("who", who), (name, value)])
        }
        61 => template(
            "Wolf: Howl makes {n} nearby enemies take {p} more damage from you",
            vec![("n", literal(u32::from_le_bytes(bytes[8..12].try_into().unwrap()))),
                 ("p", percent(value(4)))],
        ),
        62 => template(
            "Raptor: {spell} bleeds nearby enemies for {p} of its strike damage over {secs} sec",
            vec![("spell", ability("kill_command")?), ("p", percent(value(4))),
                 ("secs", number(value(12)))],
        ),
        63 => template(
            "Devilsaur Matriarch: {spell} unleashes a devastating shockwave",
            vec![("spell", ability("kill_command")?)],
        ),
        3 => template(
            "A broken shield bursts for {frac} of what it absorbed on enemies within {radius} yd",
            vec![("frac", percent(value(4))), ("radius", number(value(8)))],
        ),
        4 => rate_limit(
            template(
                "{hits} splash {frac} on enemies within {radius} yd",
                vec![
                    ("hits", hits(record, bytes[24] == 2)?),
                    ("frac", percent(value(4))),
                    ("radius", number(value(8))),
                ],
            ),
            word(bytes, 20),
        ),
        6 => template(
            if word(bytes, 4) == 1 {
                "{hits} leap to 1 more enemy for {frac}"
            } else {
                "{hits} leap to {n} more enemies for {frac}"
            },
            vec![
                ("hits", hits(record, false)?),
                ("n", literal(word(bytes, 4))),
                ("frac", percent(value(8))),
            ],
        ),
        7 => template(
            "{chance} chance for {hits} to strike again for {frac}",
            vec![
                ("chance", percent(value(4))),
                ("hits", hits(record, false)?),
                ("frac", percent(value(12))),
            ],
        ),
        8 => {
            if word(bytes, 8) != 3 {
                return None;
            }
            if key(record).is_none() {
                template(
                    "{chance} chance to stun a melee attacker for {s} sec",
                    vec![("chance", percent(value(4))), ("s", number(value(12)))],
                )
            } else {
                template(
                    "{hits} stun for {s} sec",
                    vec![("hits", hits(record, false)?), ("s", number(value(12)))],
                )
            }
        }
        9 => template(
            "{hits} burn and bleed for {frac} more over {dur} sec",
            vec![
                ("hits", hits(record, bytes[16] == 2)?),
                ("frac", percent(value(8))),
                ("dur", number(value(12))),
            ],
        ),
        10 => template(
            "A kill with {who} readies it again at once",
            vec![("who", ability(key(record)?)?)],
        ),
        11 => {
            let body = if let Some(key) = key(record) {
                template(
                    if bytes[1] == 1 {
                        "Enemies that die with {spell} on them explode for {frac} of their max health"
                    } else {
                        "Enemies {spell} kills explode for {frac} of their max health"
                    },
                    vec![("spell", ability(key)?), ("frac", percent(value(4)))],
                )
            } else {
                template(
                    "Enemies you kill explode for {frac} of their max health",
                    vec![("frac", percent(value(4)))],
                )
            };
            rate_limit(body, word(bytes, 16))
        }
        12 => {
            let spell = AbilityDefinition::by_spell_id(word(bytes, 4))?;
            rate_limit(
                template(
                    "Enemies you kill during {spell} explode for {frac} of their max health",
                    vec![("spell", ability(spell.key)?), ("frac", percent(value(8)))],
                ),
                word(bytes, 20),
            )
        }
        13 => template(
            "{spell} explodes a second time for {frac} of its damage",
            vec![
                ("spell", ability(key(record)?)?),
                ("frac", percent(value(4))),
            ],
        ),
        15 => template(
            "While {spell} heals you, {p} of the damage you deal heals you too",
            vec![("spell", ability(key(record)?)?), ("p", percent(value(4)))],
        ),
        18 => template(
            "{spell} also shields you for {frac} of your max health",
            vec![
                ("spell", ability(key(record)?)?),
                ("frac", percent(value(4))),
            ],
        ),
        19 => template(
            "A killing blow leaves you at {heal} health instead, once every {cd} sec",
            vec![("heal", percent(value(8))), ("cd", number(value(4)))],
        ),
        22 => template(
            "Every totem pulse heals you {frac} of max health",
            vec![("frac", percent(value(4)))],
        ),
        23 => template("Chains lose nothing on each jump", vec![]),
        _ => return None,
    })
}

/// Return None if the selected catalogue introduces an unrecovered variant.
/// Every present catalogue row is checked against original native prose vectors.
pub fn amulet_lines(definition: &Definition, rarity: usize, picks: u32) -> Option<Vec<Text>> {
    definition
        .effects
        .iter()
        .map(|record| {
            effect_description(
                definition,
                record,
                &amulets::equipped_bytes(definition, record, rarity, picks),
            )
            .map(|text| Text::UpperFirst(Box::new(text)))
        })
        .collect()
}

pub fn amulet_target_upgrades(definition: &Definition, rarity: usize, picks: u32) -> Option<Text> {
    let ranks = amulets::future_target_ranks(definition, rarity, picks)?;
    Some(match ranks.as_slice() {
        [] => template("Target upgrades complete.", vec![]),
        [rank] => template(
            "Another target at amulet rank {rank}.",
            vec![("rank", literal(rank))],
        ),
        ranks => template(
            "More targets at amulet ranks {ranks}.",
            vec![(
                "ranks",
                literal(ranks.iter().map(u32::to_string).collect::<Vec<_>>().join(", ")),
            )],
        ),
    })
}

/// Native145424a90 takes an actual magnitude, so both current totals and the
/// offer's increment use this one formatter. It does not invent item deltas.
pub fn jewelry_description(definition: &JewelryDefinition, amount: f32) -> Text {
    let value = match definition.tag {
        5 => {
            let value = amount.min(definition.base * 3.0) * 100.0;
            let mut rendered = format!("{value:.1}");
            if rendered.ends_with(".0") {
                rendered.truncate(rendered.len() - 2);
            }
            literal(rendered)
        }
        6 | 14 => literal(format!("{amount:.1}")),
        15 => integral(amount),
        17 => literal(format!("{:.1}", amount * 100.0)),
        _ => integral(amount * 100.0),
    };
    let mystaria_reduction = amount * f32::from_bits(0x3e23_d70a);
    let max =
        if definition.tag == 5 && amount >= definition.base * 3.0 + f32::from_bits(0xb586_37bd)
            || definition.tag == 19 && mystaria_reduction >= f32::from_bits(0x3df5_c209) {
            template(" (max)", vec![])
        } else {
            literal("")
        };
    template(
        definition.description,
        vec![
            ("v", value),
            ("h", if definition.tag == 19 {
                // Current 14589e7f1/1458aa2a0: multiply, cap, then one
                // decimal percent with the trailing .0 removed.
                let value = mystaria_reduction.min(f32::from_bits(0x3df5_c28f)) * 100.0;
                let mut rendered = format!("{value:.1}");
                if rendered.ends_with(".0") {
                    rendered.truncate(rendered.len() - 2);
                }
                literal(rendered)
            } else {
                integral((amount * 4.0) * 100.0)
            }),
            ("max", max),
        ],
    )
}

#[cfg(test)]
mod percent_render_tests {
    use super::*;

    #[test]
    fn default_reward_percent_stays_integer_and_nested_override_is_explicit() {
        let text = template("Gain {p}", vec![("p", percent(0.01234))]);
        let label = |key: &str| key.to_owned();
        assert_eq!(text.render(&label), "Gain 1%");
        assert_eq!(text.render_with_percent(&label, &|value| format!("{:.1}%", value * 100.0)), "Gain 1.2%");
        assert_eq!(text.render(&label), "Gain 1%");
    }
}
