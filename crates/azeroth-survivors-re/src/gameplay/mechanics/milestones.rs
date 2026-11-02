//! Synchronous current generic1 milestone casts and5 maximum-health conversion.
//! Proof: run-effects/milestone-native.json; generic2 remains request-only in
//! the pure module until the real companion lifecycle is implemented.
use super::*;
use azeroth_survivors_re::run_effects::{EffectRow, milestones};

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    /// Both generic0 and1 enter the same native freecast tail1454cde33.
    pub(super) fn generic_freecast(
        &mut self,
        row: &EffectRow,
        index: usize,
        definition: Option<&'static AbilityDefinition>,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        let instance = match row.key(16) {
            Some(key) => self.free_instance(key),
            None => definition.and_then(|definition| self.free_instance(definition.key)),
        };
        let Some(instance) = instance else { return };
        let original = self.core.attribution;
        let original_source = self.core.generic.source;
        self.core.generic.source = Some(index);
        let words = [1, 0, index as u32, (index as u64 >> 32) as u32];
        self.core.attribution.source_words = words;
        self.core.attribution.cast_words = words;
        self.core.generic.depth = self.core.generic.depth.wrapping_add(1);
        let context = CastContext {
            hit_context: HitContext {
                hostile_origin: None,
                captured_source_kind: None,
                pet_entry: None,
                meter_attack: None,
                demon_spell_impact: None,
                source_words: words,
                cast_words: [0; 4],
                overcast: self.core.extra_cast,
                proc_source: Some(index),
                suppress_damage_log: false,
            },
            ..self.core.current_context(self.cast_context, execution)
        };
        let targets = actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        );
        dispatch::cast(&instance, context, &targets, execution, rng, counter, self);
        self.core.flush_vitals(&mut execution.vitals);
        self.core.generic.depth = self.core.generic.depth.wrapping_sub(1);
        self.core.attribution = original;
        self.core.generic.source = original_source;
    }

    /// Conditions were checked from the native offsets before entering here.
    pub(super) fn milestone_event(
        &mut self,
        row: &EffectRow,
        index: usize,
        event: Event,
        definition: Option<&'static AbilityDefinition>,
        victim_guid: u64,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        match row.tag() {
            1 => {
                let Some(count) = self.core.generic.counters.get_mut(index) else {
                    return;
                };
                // An absent rate slot bypasses the native cap; the count slot
                // remains mandatory. Ordinary refreshed runs have both slots.
                let mut absent_timestamps = Vec::new();
                let rate_slot_exists = self.core.generic.timestamps.len() > index;
                let timestamps = self
                    .core
                    .generic
                    .timestamps
                    .get_mut(index)
                    .unwrap_or(&mut absent_timestamps);
                let mut effect = row.clone();
                if !rate_slot_exists {
                    effect.bytes[8..12].fill(0);
                }
                if milestones::advance_counter(&effect, count, timestamps, self.context.now) {
                    self.generic_freecast(row, index, definition, execution, rng, counter);
                }
            }
            5 => {
                let Some((_, maximum)) = self.core.target_health(victim_guid) else {
                    return;
                };
                let amount = milestones::conversion_amount(row, maximum).unwrap();
                self.effect_hit_with_suppression(
                    index,
                    victim_guid,
                    event.spell_id,
                    event.school,
                    amount,
                    event.spell_id == 0,
                    execution,
                    rng,
                    counter,
                );
            }
            _ => {}
        }
    }
}
