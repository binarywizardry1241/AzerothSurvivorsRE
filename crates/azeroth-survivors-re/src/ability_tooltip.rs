//! Menu-only base spell tooltips with a current AZS demon text correction.
//! Historical base: ability-tooltips-0.92.md; current: demon-picker-tooltips-0.112.0.md.
//!
//! `extract-menu-ability-tooltips.py` executes the bounded native formatter with
//! the historical 0.92 level-zero class stats and initial AbilityInstance.
//! Current demon cases execute their actual 0.112 wrapper140040d90.
//! Templates and nested token expressions remain separate for native locales.
use std::{collections::BTreeMap, sync::OnceLock};

use serde::Deserialize;

use crate::{catalog::MenuCatalog, tooltip::NativeTooltip};

#[derive(Deserialize)]
#[serde(untagged)]
enum TextExpression {
    Format {
        template: String,
        values: BTreeMap<String, TextExpression>,
    },
    Concatenation {
        concat: Vec<TextExpression>,
    },
    Literal {
        literal: String,
    },
}
impl TextExpression {
    fn render(&self, catalog: &MenuCatalog) -> String {
        match self {
            Self::Literal { literal } => literal.clone(),
            Self::Concatenation { concat } => {
                concat.iter().map(|item| item.render(catalog)).collect()
            }
            Self::Format { template, values } => {
                let mut text = catalog.label(template).to_owned();
                for (key, value) in values {
                    text = text.replace(&format!("{{{key}}}"), &value.render(catalog));
                }
                text
            }
        }
    }
}
#[derive(Deserialize)]
struct SpellText {
    subtitle: TextExpression,
    body: TextExpression,
}
fn entries() -> &'static BTreeMap<String, SpellText> {
    static ENTRIES: OnceLock<BTreeMap<String, SpellText>> = OnceLock::new();
    ENTRIES.get_or_init(|| {
        #[derive(Deserialize)]
        struct Delta {
            entries: BTreeMap<String, SpellText>,
        }
        let mut entries: BTreeMap<String, SpellText> =
            serde_json::from_str(include_str!("../assets/ability-tooltips.json"))
                .expect("hash-bound 0.92 picker spell tooltip expressions");
        let delta: Delta = serde_json::from_str(include_str!(
            "../assets/ability-tooltip-delta-0.112.0.json"
        ))
        .expect("current AZS demon picker tooltip correction");
        entries.extend(delta.entries);
        entries.insert(
            "stormstrike".into(),
            serde_json::from_str(include_str!("../assets/stormstrike-tooltip-0.139.2.json"))
                .expect("current Stormstrike picker tooltip"),
        );
        entries
    })
}

/// Native spell-pool/start-spell text, independent of gameplay or hero upgrades.
/// `starting` is the caller's optional starting-spell annotation.
pub fn picker(key: &str, catalog: &MenuCatalog, starting: bool) -> Option<NativeTooltip> {
    let text = entries().get(key)?;
    let ability = catalog
        .abilities
        .iter()
        .find(|ability| ability.key == key)?;
    let mut subtitle = text.subtitle.render(catalog);
    if starting {
        subtitle.push_str(" · ");
        subtitle.push_str(catalog.label("picker.starting_spell"));
    }
    Some(NativeTooltip {
        title: ability.name.clone(),
        subtitle,
        body: text.body.render(catalog),
    })
}
