//! Selected 0.115.0 spell descriptions, separate from the card layout.
//! Current expression evidence: docs/analysis/spell-descriptions-0.115.0.md.
//! This reads a choice and snapshots. It consumes no RNG and mutates no run state.
use super::{
    mechanics::RunChoice,
    native_overlays::{Card, CardKind, numeric_spans},
};
use crate::{assets::MenuArt, localization::Localization};
use azeroth_survivors_re::player_abilities::{
    AbilityDefinition, RuntimeInstance, damage,
    upgrades::{self, UpgradeKind},
};
use azeroth_survivors_re::loot_rewards::{AmuletItem, amulets, item_rank_suffix};

/// The native Cards parser marks the optional worn-item record, including an
/// empty name, for confirmation. The local producer creates that record only
/// when an amulet with a different identity replaces the equipped one.
pub fn replaced_amulet<'a>(
    choice: &super::mechanics::TreasureChoice,
    game: &'a super::mechanics::Mechanics,
) -> Option<&'a AmuletItem<&'static amulets::Definition>> {
    let super::mechanics::TreasureChoice::Amulet { definition, .. } = choice else {
        return None;
    };
    game.worn_amulet().filter(|item| item.key != definition.key)
}

/// 0.141.0 cache payload at 0x145fbbf50 and its native description owners. The prose
/// companion retains templates until the active locale renders each branch.
pub fn for_treasure(
    choice: &super::mechanics::TreasureChoice,
    game: &super::mechanics::Mechanics,
    art: &MenuArt,
    locale: &Localization,
) -> Card {
    use super::mechanics::TreasureChoice;
    use azeroth_survivors_re::loot_rewards::{amulets, prose};
    let translate = |key: &str| locale.label(key).to_owned();
    match *choice {
        TreasureChoice::Gold { amount, rarity } => gold_card(amount, rarity, art, locale),
        TreasureChoice::Jewelry { definition, rarity } => {
            let existing = game
                .jewelry()
                .iter()
                .find(|item| item.definition.key == definition.key);
            let worn = game
                .jewelry()
                .iter()
                .filter(|item| item.definition.slot == definition.slot)
                .count() as u64;
            let amount = definition.awarded_increment(
                rarity,
                existing.map(|item| item.value),
                game.remaining_lives(),
            );
            let name = locale
                .lookup(&format!("jewel.{}", definition.key))
                .unwrap_or(definition.name);
            let rank = existing.map(|item| item.value.upgrades.wrapping_add(1));
            let describe = |amount| prose::jewelry_description(definition, amount).render(&translate);
            let text = match existing {
                Some(item) if definition.tag != 15 => {
                    let before = item.value.value;
                    reward_text_diff(&describe(before), describe(before + amount))
                }
                _ => describe(amount),
            };
            Card {
                kind: if definition.slot == 0 {
                    CardKind::Ring
                } else {
                    CardKind::Trinket
                },
                name: name.to_owned(),
                title: treasure_title(name, rank),
                icon_key: definition.icon.to_owned(),
                icon: art.icons.get(definition.icon).cloned(),
                rarity,
                lines: vec![text.clone()],
                text,
                rank: rank.map(u64::from),
                slot_count: existing.is_none().then_some((worn + 1).min(2)),
                worn,
                ..Default::default()
            }
        }
        TreasureChoice::Amulet {
            definition,
            rarity,
            picks,
        } => {
            let same = game.worn_amulet().filter(|item| item.key == definition.key);
            let rank = same.map(|item| item.picks.wrapping_add(1));
            let (shown, shown_rarity) = same.map_or((definition, rarity), |item| {
                (item.payload, item.rarity)
            });
            let describe = |picks| {
                amulets::description_lines(shown, shown_rarity, picks)
                    .unwrap_or_default()
                    .into_iter()
                    .map(|line| line.render(&translate))
                    .collect::<Vec<_>>()
            };
            let lines = if let Some(item) = same {
                describe(item.picks)
                    .into_iter()
                    .zip(describe(item.picks.wrapping_add(1)))
                    .map(|(before, after)| reward_text_diff(&before, after))
                    .collect()
            } else {
                describe(picks)
            };
            let replacement = replaced_amulet(choice, game).map(|item| {
                let lines = amulets::description_lines(item.payload, item.rarity, item.picks)
                    .unwrap_or_default()
                    .iter()
                    .map(|line| line.render(&translate))
                    .collect();
                super::native_overlays::ReplacementItem {
                    name: locale.amulet_name(&item.payload.name, item.payload.ability_key.as_deref()),
                    icon_key: item.payload.icon.clone(),
                    icon: art.icons.get(&item.payload.icon).cloned(),
                    rarity: item.rarity,
                    lines,
                    rank: item.picks,
                }
            });
            let name = locale.amulet_name(&shown.name, shown.ability_key.as_deref());
            Card {
                kind: CardKind::Amulet,
                title: treasure_title(&name, rank),
                name,
                icon_key: shown.icon.clone(),
                icon: art.icons.get(&shown.icon).cloned(),
                rarity,
                text: lines.join(", "),
                lines,
                rank: rank.map(u64::from),
                replaces: replacement.as_ref().map(|item| item.name.clone()),
                replacement,
                ..Default::default()
            }
        }
    }
}

fn treasure_title(name: &str, rank: Option<u32>) -> String {
    rank.map_or_else(|| name.to_owned(), |rank| format!("{name} {}", item_rank_suffix(rank)))
}

fn reward_text_diff(before: &str, after: String) -> String {
    let before_spans = numeric_spans(before);
    let after_spans = numeric_spans(&after);
    if before_spans.len() != after_spans.len()
        || before_spans.iter().zip(&after_spans).any(|(before, after)| before.1 != after.1)
    {
        return after;
    }
    let mut result = String::new();
    for ((before, _), (after, numeric)) in before_spans.into_iter().zip(after_spans) {
        if numeric && before != after {
            result.push_str(&before);
            result.push_str(" » ");
        }
        result.push_str(&after);
    }
    result
}

fn gold_card(amount: u32, rarity: usize, art: &MenuArt, locale: &Localization) -> Card {
    let name = locale.label("A Pouch of Gold").to_owned();
    let text = translated(locale, "+{g} gold", "g", amount.to_string());
    Card {
        kind: CardKind::Gold,
        title: name.clone(),
        name,
        lines: vec![text.clone()],
        text,
        icon_key: "INV_Misc_Coin_02".to_owned(),
        icon: art.icons.get("native_gold_choice").cloned(),
        rarity,
        ..Default::default()
    }
}

#[derive(Clone, Copy, Debug)]
pub struct Context {
    pub maximum_health: f32,
    pub damage_multiplier: f32,
    pub cooldown_multiplier: f32,
    pub bonuses: DescriptionBonuses,
}

/// Native14547ccf0; Rust's decimal formatter supplies the original rounding.
pub fn number(value: f32) -> String {
    if value >= f32::from_bits(0x411f3333) {
        format!("{value:.0}")
    } else {
        trim_decimal(format!("{value:.1}"))
    }
}
fn trim_decimal(mut value: String) -> String {
    if value.ends_with(".0") {
        value.truncate(value.len() - 2);
    }
    value
}
fn percentage(value: f32) -> String {
    trim_decimal(format!("{:.1}", value * 100.))
}
fn translated(locale: &Localization, template: &str, key: &str, value: String) -> String {
    locale
        .label(template)
        .replace(&format!("{{{key}}}"), &value)
}

fn power_prose(definition: &AbilityDefinition, magnitude: f32) -> (&'static str, f32) {
    match (definition.kind, definition.effect.tag) {
        (9, 6) => ("+{p}% healing", ((1. + magnitude).sqrt() - 1.) * 100.),
        (9, 7) => ("+{p}% absorb", ((1. + magnitude).sqrt() - 1.) * 100.),
        _ => ("+{p}% damage", magnitude * 100.),
    }
}

/// Native writer preserves selected upgrade order and computes all magnitudes
/// against the current instance, without applying the preceding display rows.
pub fn upgrade_lines(
    instance: &RuntimeInstance<'_>,
    kinds: &[UpgradeKind],
    rarity: usize,
    context: &Context,
    locale: &Localization,
) -> Vec<String> {
    kinds
        .iter()
        .map(|kind| {
            let magnitude = upgrades::magnitude(instance, *kind, rarity);
            let (template, value) = match kind {
                UpgradeKind::Power if instance.definition.key == "demonic_empowerment" => {
                    ("+{p}% demon damage", magnitude * 100.)
                }
                UpgradeKind::Power => power_prose(instance.definition, magnitude),
                UpgradeKind::Cooldown => {
                    if instance.definition.key == "redemption" {
                        let d = instance.definition;
                        let chance = |multiplier: f32| {
                            let interval = (((d.base_cooldown * 1.4) * multiplier)
                                * instance.talent_cooldown_multiplier)
                                * context.cooldown_multiplier;
                            let interval = if interval > 0.25 { interval } else { 0.25 };
                            let amount = ((d.base_cooldown * 0.1) * 1.4) / interval;
                            (if amount < 0.2 { amount } else { 0.2 }) * instance.effect_multiplier
                        };
                        let before = percentage(chance(instance.cooldown_multiplier));
                        let after = percentage(chance(instance.cooldown_multiplier - magnitude));
                        return locale
                            .label("burst chance {before}% » {after}%")
                            .replace("{before}", &before)
                            .replace("{after}", &after);
                    }
                    ("-{p}% cooldown", magnitude * 100.)
                }
                UpgradeKind::Targets => {
                    return translated(locale, "+{n} targets", "n", (magnitude as u32).to_string());
                }
                UpgradeKind::Area => ("+{p}% area", magnitude * 100.),
                UpgradeKind::Duration => ("+{p}% duration", magnitude * 100.),
            };
            translated(locale, template, "p", format!("{value:.0}"))
        })
        .collect()
}

/// Spell and fallback gold payloads from the same 0.141.0 card constructor.
pub fn for_choice(
    choice: &RunChoice,
    game: &super::mechanics::Mechanics,
    context: &Context,
    art: &MenuArt,
    locale: &Localization,
) -> Card {
    if choice.gold != 0 {
        return gold_card(choice.gold, choice.rarity, art, locale);
    }
    let Some(definition) = AbilityDefinition::by_key(choice.ability_key) else {
        return Card::default();
    };
    let name = locale
        .lookup(&format!("ability.{}.name", definition.key))
        .unwrap_or(definition.name);
    let mut card = Card {
        name: name.to_owned(),
        icon_key: definition.icon.to_owned(),
        icon: art.icons.get(choice.ability_key).cloned(),
        rarity: choice.rarity,
        ..Default::default()
    };
    if choice.upgrades.is_empty() {
        card.kind = CardKind::NewSpell;
        card.title = locale.label("New: {spell}").replace("{spell}", name);
        let (instance, bonus) = game.preview_spell(definition, choice.rarity);
        card.text = description(&instance, context, &context.bonuses, locale).unwrap_or_default();
        card.lines.push(card.text.clone());
        let bonus_line = match bonus {
            upgrades::LearnedBonus::None => None,
            upgrades::LearnedBonus::Power(value) => Some(power_prose(definition, value)),
            upgrades::LearnedBonus::Cooldown(value) => Some(("-{p}% cooldown", value * 100.)),
        };
        if let Some((template, value)) = bonus_line {
            let bonus = translated(locale, template, "p", format!("{value:.0}"));
            card.text.push_str(&format!(" ({bonus})"));
            card.lines.push(bonus);
        }
        card.slot_count = Some((game.abilities.len() as u64 + 1).min(6));
    } else if let Some(instance) = game
        .abilities
        .iter()
        .find(|instance| instance.definition.key == choice.ability_key)
    {
        card.kind = CardKind::UpgradeSpell;
        let rank = instance.rank.wrapping_add(1);
        card.rank = Some(u64::from(rank));
        card.title = locale
            .label("{spell} rank {rank}")
            .replace("{rank}", &rank.to_string())
            .replace("{spell}", name);
        card.lines = upgrade_lines(instance, &choice.upgrades, choice.rarity, context, locale);
        card.text = card.lines.join(", ");
    }
    card
}

/// Native description reads of the stat row at Game+470. These fields remain
/// explicit so the owning stat compositor can provide its actual values.
#[derive(Clone, Copy, Debug)]
pub struct DescriptionBonuses {
    pub area_multiplier: f32,
    pub buff_bonus: f32,
    pub dot_tick_bonus: f32,
    pub global_targets: u32,
}
impl Default for DescriptionBonuses {
    fn default() -> Self {
        Self {
            area_multiplier: 1.,
            buff_bonus: 0.,
            dot_tick_bonus: 0.,
            global_targets: 0,
        }
    }
}

#[derive(serde::Deserialize)]
#[serde(untagged)]
enum TextExpression {
    Format {
        template: String,
        values: std::collections::BTreeMap<String, TextExpression>,
    },
    Concatenation {
        concat: Vec<TextExpression>,
    },
    Literal {
        literal: String,
    },
}
impl TextExpression {
    fn render(&self, locale: &Localization) -> String {
        match self {
            Self::Format { template, values } => {
                let mut out = locale.label(template).to_owned();
                for (key, value) in values {
                    out = out.replace(&format!("{{{key}}}"), &value.render(locale));
                }
                out
            }
            Self::Concatenation { concat } => concat.iter().map(|x| x.render(locale)).collect(),
            Self::Literal { literal } => literal.clone(),
        }
    }
}
#[derive(serde::Deserialize)]
struct NumberExpression {
    call: String,
    expression: serde_json::Value,
    precision: Option<serde_json::Value>,
}
#[derive(serde::Deserialize)]
struct Description {
    expression: TextExpression,
    numbers: Vec<NumberExpression>,
    plural: Option<Box<Description>>,
    singular_overlap: Option<Box<Description>>,
    plural_no_overlap: Option<Box<Description>>,
}
#[derive(serde::Deserialize)]
struct DescriptionCatalog {
    entries: std::collections::BTreeMap<String, Description>,
}
fn descriptions() -> &'static DescriptionCatalog {
    static DATA: std::sync::OnceLock<DescriptionCatalog> = std::sync::OnceLock::new();
    DATA.get_or_init(|| {
        serde_json::from_str(include_str!(
            "../../assets/native-spell-descriptions-0.115.0.json"
        ))
        .expect("SHA-bound0.115.0 native description expression catalog")
    })
}
fn scalar(
    expr: &serde_json::Value,
    instance: &RuntimeInstance<'_>,
    context: &Context,
    bonuses: &DescriptionBonuses,
) -> f32 {
    if let Some(number) = expr.as_f64() {
        return number as f32;
    }
    if let Some(offset) = expr.get("instance").and_then(serde_json::Value::as_u64) {
        return match offset {
            16 => instance.power_multiplier,
            20 => instance.cooldown_multiplier,
            28 => instance.area_multiplier,
            32 => instance.duration_multiplier,
            56 => instance.talent_power_multiplier,
            60 => instance.talent_cooldown_multiplier,
            68 => instance.talent_area_multiplier,
            72 => instance.talent_duration_multiplier,
            76 => instance.health_power,
            80 => instance.effect_multiplier,
            _ => panic!("unrecovered native description instance field {offset}"),
        };
    }
    if let Some(offset) = expr
        .get("instance_integer")
        .and_then(serde_json::Value::as_u64)
    {
        return match offset {
            24 => instance.target_bonus as f32,
            64 => instance.talent_target_bonus as f32,
            _ => panic!("unrecovered native description integer field {offset}"),
        };
    }
    if let Some(offset) = expr.get("stats").and_then(serde_json::Value::as_u64) {
        return match offset {
            0 => context.maximum_health,
            4 => context.damage_multiplier,
            8 => context.cooldown_multiplier,
            40 => bonuses.area_multiplier,
            64 => bonuses.buff_bonus,
            72 => bonuses.dot_tick_bonus,
            _ => panic!("unrecovered native description stat field {offset}"),
        };
    }
    if let Some(offset) = expr
        .get("stats_integer")
        .and_then(serde_json::Value::as_u64)
    {
        return match offset {
            52 => bonuses.global_targets as f32,
            _ => panic!("unrecovered native description integer stat field {offset}"),
        };
    }
    let op = expr.as_array().expect("native scalar expression");
    let a = scalar(&op[1], instance, context, bonuses);
    let b = op
        .get(2)
        .map(|b| scalar(b, instance, context, bonuses))
        .unwrap_or(0.);
    match op[0].as_str().expect("native scalar operation") {
        "mul" => a * b,
        "div" => a / b,
        "add" => a + b,
        "sub" => a - b,
        "sqrt" => a.sqrt(),
        "abs" => a.abs(),
        "round" => a.round(),
        "trunc" => a.trunc(),
        "ceil" => a.ceil(),
        "ln_1p" => a.ln_1p(),
        "float" => a,
        "max" => {
            if a > b {
                a
            } else {
                b
            }
        }
        "min" => {
            if a < b {
                a
            } else {
                b
            }
        }
        "iadd" => (a as u32).wrapping_add(b as u32) as f32,
        "isub" => (a as u32).wrapping_sub(b as u32) as f32,
        other => panic!("unrecovered native description operation {other}"),
    }
}

/// Current native regular/passive description formatter. The expression catalog
/// preserves native template keys and f32 operation order, including dynamic
/// target/rank grammar. All113 selected-target definitions, including
/// Empowerment, use the same recovered current catalog.
pub fn description(
    instance: &RuntimeInstance<'_>,
    context: &Context,
    bonuses: &DescriptionBonuses,
    locale: &Localization,
) -> Option<String> {
    if instance.definition.key == "kill_command" {
        use azeroth_survivors_re::player_abilities::catalog::KILL_COMMAND_DESCRIPTION;
        return Some(locale.label(KILL_COMMAND_DESCRIPTION).into());
    }
    let row = selected_description(instance, context, bonuses)?;
    let live_number = match instance.definition.key {
        "divine_shield" => Some((3, number(damage::scaled_duration(instance)))),
        "soul_fire" => {
            let count = azeroth_survivors_re::player_abilities::behavior::execution::target_count(
                instance,
                bonuses.global_targets,
            );
            // The plural template puts its integer target count in number6.
            (count > 1).then(|| (6, count.to_string()))
        }
        _ => None,
    };
    Some(render_description(row, instance, context, bonuses, locale, live_number))
}

fn render_description(
    row: &Description,
    instance: &RuntimeInstance<'_>,
    context: &Context,
    bonuses: &DescriptionBonuses,
    locale: &Localization,
    live_number: Option<(usize, String)>,
) -> String {
    let mut text = row.expression.render(locale);
    for (index, item) in row.numbers.iter().enumerate() {
        // Native area display uses logarithmic softening only beyond70 yd.
        // Model this branch explicitly rather than retaining only an extraction
        // sample's taken/not-taken math path.
        // Live values share their producers with gameplay. Historical writer
        // fixtures retain the extracted expressions.
        let value = match &live_number {
            Some((slot, value)) if *slot == index => value.clone(),
            _ => {
                let value = numeric_value(item, instance, context, bonuses);
                match &item.precision {
                    Some(serde_json::Value::String(value_type)) if value_type == "integer" => {
                        (value as u32).to_string()
                    }
                    Some(serde_json::Value::Number(precision)) => format!(
                        "{value:.precision$}",
                        precision = precision.as_u64().expect("native decimal precision") as usize
                    ),
                    _ => number(value),
                }
            }
        };
        text = text.replace(&format!("{{number{index}}}"), &value);
    }
    text
}

/// Native Lightwell independently chooses target grammar and the optional
/// overlapping-well sentence. Reuse its recovered count expression for that
/// decision so the formatter and sentence cannot disagree.
fn selected_description<'a>(
    instance: &RuntimeInstance<'_>,
    context: &Context,
    bonuses: &DescriptionBonuses,
) -> Option<&'a Description> {
    select_description_from(descriptions(), instance, context, bonuses)
}

fn select_description_from<'a>(
    catalog: &'a DescriptionCatalog,
    instance: &RuntimeInstance<'_>,
    context: &Context,
    bonuses: &DescriptionBonuses,
) -> Option<&'a Description> {
    let original = catalog.entries.get(instance.definition.key)?;
    let plural = azeroth_survivors_re::player_abilities::behavior::execution::target_count(
        instance,
        bonuses.global_targets,
    ) > 1;
    let mut row = if plural {
        original.plural.as_deref().unwrap_or(original)
    } else {
        original
    };
    if instance.definition.key == "lightwell" {
        let overlap = original
            .plural
            .as_ref()?
            .numbers
            .iter()
            .find(|number| matches!(number.call.as_str(), "0x1454eb2e7" | "0x14596d275"))
            .is_some_and(|number| numeric_value(number, instance, context, bonuses) > 1.);
        row = match (plural, overlap) {
            (false, true) => original.singular_overlap.as_deref()?,
            (true, false) => original.plural_no_overlap.as_deref()?,
            _ => row,
        };
    }
    Some(row)
}

fn numeric_value(
    item: &NumberExpression,
    instance: &RuntimeInstance<'_>,
    context: &Context,
    bonuses: &DescriptionBonuses,
) -> f32 {
    if matches!(
        item.call.as_str(),
        "0x14548791b"
            | "0x1454e9ea2"
            | "0x145488690"
            | "0x14585cb7b"
            | "0x14596c2d2"
            | "0x14585d8f0"
    ) {
        let radius = scalar(&item.expression, instance, context, bonuses);
        if radius > 70. {
            ((radius - 70.) / 10.).ln_1p() * 10. + 70.
        } else {
            radius
        }
    } else {
        scalar(&item.expression, instance, context, bonuses)
    }
}

#[cfg(test)]
mod native_tests {
    use super::*;
    use serde_json::Value;

    #[test]
    fn reward_comparison_marks_changed_numbers_only_for_matching_spans() {
        assert_eq!(
            reward_text_diff("Gain +3% for 8 sec", "Gain +4% for 8 sec".to_owned()),
            "Gain +3% » +4% for 8 sec"
        );
        assert_eq!(
            reward_text_diff("More targets at rank 3", "Target upgrades complete.".to_owned()),
            "Target upgrades complete."
        );
    }

    fn historical_instance(key: &str, inputs: &Value) -> RuntimeInstance<'static> {
        let definition = if key == "searing_pain" {
            // These immutable 0.100.1 writer fixtures predate the selected
            // target's power50 descriptor. Keep their original power40 input.
            static HISTORICAL: std::sync::OnceLock<AbilityDefinition> = std::sync::OnceLock::new();
            HISTORICAL.get_or_init(|| AbilityDefinition {
                base_power: 40.,
                ..*AbilityDefinition::by_key("searing_pain").unwrap()
            })
        } else {
            AbilityDefinition::by_key(key).unwrap()
        };
        instance_with_inputs(definition, inputs)
    }

    fn instance_with_inputs(
        definition: &'static AbilityDefinition,
        inputs: &Value,
    ) -> RuntimeInstance<'static> {
        let mut instance = RuntimeInstance::learned(definition);
        for (offset, value) in inputs["instance_f32"].as_object().unwrap() {
            let value = value.as_f64().unwrap() as f32;
            *match offset.as_str() {
                "16" => &mut instance.power_multiplier,
                "20" => &mut instance.cooldown_multiplier,
                "28" => &mut instance.area_multiplier,
                "32" => &mut instance.duration_multiplier,
                "56" => &mut instance.talent_power_multiplier,
                "60" => &mut instance.talent_cooldown_multiplier,
                "68" => &mut instance.talent_area_multiplier,
                "72" => &mut instance.talent_duration_multiplier,
                "76" => &mut instance.health_power,
                "80" => &mut instance.effect_multiplier,
                other => panic!("unrecognized fixture float{other}"),
            } = value;
        }
        for (offset, value) in inputs["instance_u32"].as_object().unwrap() {
            let value = value.as_u64().unwrap() as u32;
            *match offset.as_str() {
                "8" => &mut instance.rank,
                "24" => &mut instance.target_bonus,
                "64" => &mut instance.talent_target_bonus,
                other => panic!("unrecognized fixture word{other}"),
            } = value;
        }
        for (index, value) in inputs["upgrade_counts"]
            .as_array()
            .unwrap()
            .iter()
            .enumerate()
        {
            instance.upgrade_counts[index] = value.as_u64().unwrap() as u32;
        }
        instance
    }

    fn context(inputs: &Value) -> Context {
        let stats = &inputs["stats_f32"];
        let value = |key: &str, fallback| {
            stats
                .get(key)
                .map_or(fallback, |value| value.as_f64().unwrap() as f32)
        };
        Context {
            maximum_health: value("0", 120.),
            damage_multiplier: value("4", 1.),
            cooldown_multiplier: value("8", 1.),
            bonuses: DescriptionBonuses {
                area_multiplier: value("40", 1.),
                buff_bonus: value("64", 0.),
                dot_tick_bonus: value("72", 0.),
                global_targets: inputs["stats_u32"]["52"].as_u64().unwrap_or(0) as u32,
            },
        }
    }

    #[test]
    fn historical_descriptions_match_native_inputs_and_large_area_branch() {
        let fixture: Value = serde_json::from_str(include_str!(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/../../docs/analysis/evidence/0.100.1/native-overlays/prose-fixtures.json"
        )))
        .unwrap();
        let catalog: DescriptionCatalog = serde_json::from_str(include_str!(
            "../../assets/native-spell-descriptions-0.100.1.json"
        ))
        .unwrap();
        let locale = Localization::english_for_tests();
        let mut differences = Vec::new();
        for scenario in [
            "baseline",
            "modified",
            "large_area",
            "singular_overlap",
            "plural_no_overlap",
        ] {
            let context = context(&fixture["inputs"][scenario]);
            let rows = if matches!(scenario, "singular_overlap" | "plural_no_overlap") {
                fixture["lightwell_variants"][scenario].as_array().unwrap()
            } else {
                fixture[scenario].as_array().unwrap()
            };
            assert_eq!(
                rows.len(),
                if matches!(scenario, "singular_overlap" | "plural_no_overlap") {
                    1
                } else {
                    112
                }
            );
            for row in rows {
                let key = row["key"].as_str().unwrap();
                let instance = historical_instance(key, &fixture["inputs"][scenario]);
                let mut expected = row["text"].as_str().unwrap().to_owned();
                let definition =
                    select_description_from(&catalog, &instance, &context, &context.bonuses)
                        .unwrap();
                for (index, cell) in row["numbers"].as_array().unwrap().iter().enumerate() {
                    let expected_number = cell[1].as_f64().unwrap() as f32;
                    let expression = &definition.numbers[index];
                    let actual = numeric_value(expression, &instance, &context, &context.bonuses);
                    if actual.to_bits() != expected_number.to_bits() {
                        differences.push(format!(
                            "{scenario}:{key}:{} actual{actual} expected{expected_number}",
                            cell[0]
                        ));
                    }
                    let rendered = match &cell[3] {
                        Value::String(kind) if kind == "integer" => {
                            (expected_number as u32).to_string()
                        }
                        Value::Number(precision) => format!(
                            "{expected_number:.precision$}",
                            precision = precision.as_u64().unwrap() as usize
                        ),
                        _ => number(expected_number),
                    };
                    expected = expected.replace(&format!("{{number{index}}}"), &rendered);
                }
                let actual =
                    render_description(definition, &instance, &context, &context.bonuses, &locale, None);
                if actual != expected {
                    differences.push(format!(
                        "{scenario}:{key}:text actual{actual:?} expected{expected:?}"
                    ));
                }
            }
        }
        assert!(
            differences.is_empty(),
            "{} differences:\n{}",
            differences.len(),
            differences.join("\n")
        );
    }

    #[test]
    fn current_descriptions_match_selected_native_grammar_and_numeric_cases() {
        let fixture: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.115.0/spell-descriptions/cases.json"
        ))
        .unwrap();
        let locale = Localization::english_for_tests();
        assert_eq!(descriptions().entries.len(), 113);
        for (scenario, rows) in fixture["cases"].as_object().unwrap() {
            let inputs = &fixture["inputs"][scenario];
            let context = context(inputs);
            for row in rows.as_array().unwrap() {
                let key = row["key"].as_str().unwrap();
                let instance =
                    instance_with_inputs(AbilityDefinition::by_key(key).unwrap(), inputs);
                let selected = selected_description(&instance, &context, &context.bonuses).unwrap();
                let numbers = row["numbers"].as_array().unwrap();
                assert_eq!(selected.numbers.len(), numbers.len(), "{scenario}:{key}");
                let mut expected = row["text"].as_str().unwrap().to_owned();
                for (index, cell) in numbers.iter().enumerate() {
                    let value = cell["value"].as_f64().unwrap() as f32;
                    assert_eq!(
                        numeric_value(
                            &selected.numbers[index],
                            &instance,
                            &context,
                            &context.bonuses
                        )
                        .to_bits(),
                        value.to_bits(),
                        "{scenario}:{key}:{index}"
                    );
                    let formatted = match &cell["precision"] {
                        Value::String(kind) if kind == "integer" => (value as u32).to_string(),
                        Value::Number(precision) => format!(
                            "{value:.precision$}",
                            precision = precision.as_u64().unwrap() as usize
                        ),
                        _ => number(value),
                    };
                    expected = expected.replace(&format!("{{number{index}}}"), &formatted);
                }
                let actual = if key == "soul_fire" {
                    // This fixture predates the live 0.141.0 target count.
                    render_description(selected, &instance, &context, &context.bonuses, &locale, None)
                } else {
                    description(&instance, &context, &context.bonuses, &locale).unwrap()
                };
                assert_eq!(actual, expected, "{scenario}:{key}");
            }
        }
    }

    #[test]
    fn historical_upgrade_magnitudes_and_lines_match_native_writer() {
        let fixture: Value = serde_json::from_str(include_str!(
            "../../tests/fixtures/upgrade-prose-0.100.1-native.json"
        ))
        .unwrap();
        let locale = Localization::english_for_tests();
        let kinds = [
            UpgradeKind::Power,
            UpgradeKind::Cooldown,
            UpgradeKind::Targets,
            UpgradeKind::Area,
            UpgradeKind::Duration,
        ];
        assert_eq!(fixture["cases"].as_array().unwrap().len(), 1120);
        for case in fixture["cases"].as_array().unwrap() {
            let key = case["key"].as_str().unwrap();
            let scenario = if case["modified"].as_bool().unwrap() {
                "modified"
            } else {
                "baseline"
            };
            let instance = historical_instance(key, &fixture["inputs"][scenario]);
            let context = context(&fixture["inputs"][scenario]);
            let rarity = case["rarity"].as_u64().unwrap() as usize;
            for (index, kind) in kinds.iter().enumerate() {
                if key == "soul_fire" && *kind == UpgradeKind::Targets {
                    continue; // 0.141.0 widened the historical budget.
                }
                assert_eq!(
                    upgrades::magnitude(&instance, *kind, rarity).to_bits(),
                    (case["magnitudes"][index].as_f64().unwrap() as f32).to_bits(),
                    "{scenario}:{key}:{rarity}:{kind:?}"
                );
            }
            let mut actual = upgrade_lines(&instance, &kinds, rarity, &context, &locale);
            let mut expected = case["lines"]
                .as_array()
                .unwrap()
                .iter()
                .map(|line| line.as_str().unwrap())
                .collect::<Vec<_>>();
            if key == "soul_fire" {
                actual.remove(2);
                expected.remove(2);
            }
            assert_eq!(actual, expected, "{scenario}:{key}:{rarity}");
        }
    }

    #[test]
    fn soulfire_upgrades_and_tooltip_include_targets_past_three() {
        let mut instance = RuntimeInstance::learned(AbilityDefinition::by_key("soul_fire").unwrap());
        let locale = Localization::english_for_tests();
        let context = Context {
            maximum_health: 120.,
            damage_multiplier: 1.,
            cooldown_multiplier: 1.,
            bonuses: DescriptionBonuses::default(),
        };
        assert!(description(&instance, &context, &context.bonuses, &locale)
            .unwrap()
            .contains("the toughest enemy"));

        for (rarity, count) in [(4, 2), (4, 2), (4, 2), (4, 2), (4, 2), (1, 1), (4, 1), (4, 0)] {
            assert_eq!(
                upgrades::apply(&mut instance, UpgradeKind::Targets, rarity),
                count as f32
            );
        }
        assert_eq!(instance.target_bonus, 12);
        assert!(!upgrades::eligible_types(&instance, 1., 4).contains(&UpgradeKind::Targets));
        instance.talent_target_bonus = 1;
        let bonuses = DescriptionBonuses { global_targets: 1, ..context.bonuses };
        assert!(description(&instance, &context, &bonuses, &locale)
            .unwrap()
            .contains("each of the 15 toughest enemies"));
    }

    #[test]
    fn empowerment_description_matches_current_localized_literal_and_native_numbers() {
        let fixture: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.112.0/demonic-empowerment/native-cases.json"
        )).unwrap();
        let locale = Localization::english_for_tests();
        for case in fixture["empowerment_description_cases"].as_array().unwrap() {
            let mut instance = RuntimeInstance::learned(AbilityDefinition::by_key("demonic_empowerment").unwrap());
            let f = |key: &str| case[key].as_f64().unwrap() as f32;
            instance.effect_multiplier = f("effect_multiplier");
            let bonuses = DescriptionBonuses { buff_bonus: f("buff_bonus"), ..Default::default() };
            let context = Context { maximum_health: 120., damage_multiplier: 1., cooldown_multiplier: 1., bonuses };
            let percent = |key: &str| format!("{:.0}", f32::from_bits(case[key].as_u64().unwrap() as u32));
            let expected = fixture["empowerment_description_template"].as_str().unwrap()
                .replace("{d}", &percent("damage_percent_bits"))
                .replace("{dur}", "11");
            assert_eq!(description(&instance, &context, &bonuses, &locale).unwrap(), expected, "{case}");
        }
    }
}
