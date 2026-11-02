//! Current Doomguard pending impact tail145900a09..1459013e6. The launch
//! owner captures independent Nightfall/Conflagrate flags; gear cleaves are
//! prepared at launch and never generated again by this impact consumer.
use super::*;
use azeroth_survivors_re::{run_effects::EffectRow, run_meter::CapturedAttack};

fn nightfall_row(row: &EffectRow) -> bool {
    row.tag() == 9 && row.word(16) == 0 && row.bytes[24] == 1 && row.key(32) == Some("shadow_bolt")
}
fn conflagrate_row(row: &EffectRow) -> bool {
    row.tag() == 4 && row.word(16) == 348
}

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    pub(super) fn pending_demon_spell_hit(
        &mut self,
        hit: PendingHit,
        rng: &mut NativeRng,
        execution: &mut ExecutionState<'_>,
        counter: &mut dyn NativeCounter,
    ) {
        let Some(gates) = hit.context.demon_spell_impact else {
            self.pending_hit_with_execution(hit, rng, execution, counter);
            return;
        };
        let before = actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        )
        .into_iter()
        .find(|row| row.actor.guid == hit.target_guid);
        let admitted = before.is_some_and(|row| !row.actor.dead);
        let conflagrate = gates.conflagrate
            && admitted
            && self
                .core
                .periodic_rows(hit.target_guid)
                .is_some_and(|rows| rows.iter().any(|row| row.spell_id == 348));
        // Native Nightfall and Conflagrate are explicitly admitted after the
        // ordinary impact; they also run when its nonpositive power skips damage.
        self.pending_hit_with_execution(hit, rng, execution, counter);
        if !admitted {
            return;
        }
        if gates.nightfall && self.core.equipped.talents.iter().any(nightfall_row) {
            let alive = actor_targets(
                self.core.actors,
                self.core.bosses,
                &self.core.boss_state.wards,
                self.core.object_counter.sequence(),
            )
            .into_iter()
            .any(|row| row.actor.guid == hit.target_guid && !row.actor.dead);
            if alive {
                if let Some((index, row)) = self
                    .core
                    .equipped
                    .rows
                    .iter()
                    .enumerate()
                    .find(|(_, row)| nightfall_row(row))
                    .map(|(i, row)| (i, row.clone()))
                {
                    if let Some(periodic) = self.core.periodic_rows_mut(hit.target_guid) {
                        let spell = row.word(4);
                        let retained = periodic
                            .iter()
                            .filter(|dot| {
                                dot.owner_kind != 0
                                    && dot.owner_guid == index as u64
                                    && dot.spell_id == spell
                            })
                            .fold(-0.0, |sum, dot| {
                                sum + dot.power_per_tick * dot.ticks_remaining as f32
                            });
                        let duration = row.float(12);
                        periodic::install_dot(
                            periodic,
                            1,
                            index as u64,
                            spell,
                            5,
                            periodic::DotPlan {
                                total_power: row.float(8) * hit.damage + retained,
                                duration,
                                ticks: duration.round().max(1.0) as u32,
                            },
                            self.context.now,
                            0.0,
                            1,
                        );
                        self.core.actor_aura(hit.target_guid, spell, true);
                    }
                }
            }
        }
        if !conflagrate || !self.core.equipped.talents.iter().any(conflagrate_row) {
            return;
        }
        let Some(row) = self
            .core
            .equipped
            .rows
            .iter()
            .find(|row| conflagrate_row(row))
            .cloned()
        else {
            return;
        };
        // Immolate was captured before damage. The retained actor supplies its
        // current position after callbacks, including a lethal primary impact.
        let Some(center) = actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        )
        .into_iter()
        .find(|row| row.actor.guid == hit.target_guid)
        .map(|row| row.actor.movement.position_at(self.context.now)) else {
            return;
        };
        let actors = actor_targets(
            self.core.actors,
            self.core.bosses,
            &self.core.boss_state.wards,
            self.core.object_counter.sequence(),
        );
        let targets = behavior::targeting::radius_targets(
            &actors,
            self.context.now,
            center,
            row.float(8),
            &[hit.target_guid],
        )
        .into_iter()
        .map(|row| row.actor.guid)
        .collect::<Vec<_>>();
        let power = (row.float(4) * hit.damage) * 0.25;
        for target in targets {
            self.hit_with_execution(
                PendingHit {
                    context: HitContext {
                        captured_source_kind: Some(2),
                        pet_entry: hit.context.pet_entry,
                        meter_attack: Some(CapturedAttack {
                            primary: "Conflagrate",
                            secondary: None,
                            bonus_bits: 0,
                            suppressed: false,
                        }),
                        source_words: hit.context.source_words,
                        cast_words: hit.context.cast_words,
                        suppress_damage_log: true,
                        ..Default::default()
                    },
                    target_guid: target,
                    source_guid: hit.source_guid,
                    effect: player_abilities::StatusEffect {
                        tag: 0,
                        value: 0.0,
                        duration: 0.0,
                    },
                    resolves_at: self.context.now,
                    spell_id: 0,
                    damage: power,
                    critical: false,
                    damages_player: false,
                    school: hit.school,
                },
                rng,
                execution,
                counter,
            );
        }
    }
}
