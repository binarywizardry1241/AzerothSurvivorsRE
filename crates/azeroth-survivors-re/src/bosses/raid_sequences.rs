//! Current native18 combinations. Later children re-read the live caster and
//! player through the common native deferred-action vector, before hazards.

use super::{abilities::{self, CombatContext, CombatPort, PendingEffects, UnknownAbilityTag},
    raid_native_catalog::{ACTIONS, native_action}, NativeRng, RawBossAbility};
use crate::{enemies::ai::Math, native_counter::NativeCounter};

pub fn dispatch_sequence(record: &RawBossAbility, context: CombatContext,
    rng: &mut NativeRng, counter: &mut dyn NativeCounter, effects: &mut PendingEffects,
    port: &mut impl CombatPort, math: &impl Math) -> Result<bool, UnknownAbilityTag> {
    if record.words[0] != 16 { return Ok(false); }
    let action = &ACTIONS[record.words[1] as usize];
    if action.native_tag != 18 { return Ok(false); }
    port.raid_block(context.source_guid, action.blocking_duration());
    let Some((&first, rest)) = action.children.split_first() else { return Ok(true); };
    abilities::dispatch_live(&native_action(first), context, rng, counter, effects, port, math)?;
    let spacing = f32::from_bits(action.words[4]);
    for (index, &child) in rest.iter().enumerate() {
        let at = (index + 1) as f32 * spacing + context.now;
        effects.raid_areas.lines.ability_at(context.source_guid, native_action(child), at);
    }
    Ok(true)
}
