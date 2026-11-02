//! Explicit embedding spell displays over the real FrameXML tooltip cache.
//! An empty list preserves the ordinary client. No spell or visual is created.
use benilla_ui::script::{SpellTooltipView, TextPart, TooltipText};
use bevy::prelude::*;

#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub struct LocalSpellDescription {
    pub spell_id: u32,
    pub name: String,
    pub description: String,
    pub secondary: String,
    pub rank: Option<String>,
    pub range: Option<String>,
    pub cast: Option<String>,
    pub cooldown: Option<String>,
}

#[derive(Resource, Default)]
pub struct LocalSpellDescriptions(pub Vec<LocalSpellDescription>);

pub(super) fn install(app: &mut App) {
    app.init_resource::<LocalSpellDescriptions>().add_systems(
        Update,
        publish
            .in_set(crate::ui_script::UiFeed)
            .after(super::LocalClientSet::Feed)
            .after(crate::ui_tooltip::SpellTooltipFeed),
    );
}

fn plain(text: String) -> TooltipText {
    TooltipText(vec![TextPart::Text(text)])
}

fn publish(mut vm: crate::script_calls::VmWith<()>, rows: Res<LocalSpellDescriptions>) {
    // Ordinary views may be rebuilt by player/DBC changes in the same frame.
    // Seat the authoritative overrides afterwards, including on a new Lua VM.
    vm.turn(|script, _| {
        let Some(script) = script else {
            return;
        };
        // The replacement API preserves current1402fb150's first-ID match.
        // Empty input removes every embedding override on this same VM.
        script.replace_spell_tooltip_overrides(rows.0.iter().map(|row| {
            //1451c6d20/1451c7065: aura mode falls back to primary when
            // the secondary body is empty.
            let body = if row.secondary.is_empty() {
                &row.description
            } else {
                &row.secondary
            };
            (
                row.spell_id,
                SpellTooltipView {
                    name: row.name.clone(),
                    rank: row.rank.clone(),
                    range: row.range.clone().map(plain),
                    cast_time: row.cast.clone().map(plain),
                    cooldown: row.cooldown.clone().map(plain),
                    description: plain(row.description.clone()),
                    ..Default::default()
                },
                plain(body.clone()),
            )
        }));
    });
}
