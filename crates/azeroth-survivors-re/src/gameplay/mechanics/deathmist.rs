//! Current Tier 0.5 single-target brand and effect-owned burn.
use super::*;
use azeroth_survivors_re::run_effects::{EffectRow, conditions::Event};

const BRAND_AURA: u32 = 17800;
const BURN_AURA: u32 = 12654;

#[derive(Clone, Copy, Debug)]
pub(super) struct Brand {
    target: u64,
    expires: f32,
}

impl<W: RunWorld> CombatAdapter<'_, W> {
    fn deathmist_victim(&self, guid: u64) -> Option<(Victim, &ControlWindow)> {
        let demoralizing = self.generic.demoralizing_amplification.get(&guid)
            .map_or(0.0, |window| window.value_at(self.now));
        if let Some(row) = self.bosses.iter().find(|row| row.guid == guid) {
            return Some((row.hit_victim(demoralizing), &row.control));
        }
        if let Some(row) = self.actors.iter().find(|row| row.guid == guid) {
            return Some((row.hit_victim(self.guardian_state.contains(guid), demoralizing), &row.control));
        }
        self.boss_state.wards.actors.iter().find(|row| row.guid == guid)
            .map(|row| (wards::ward_hit_victim(row, demoralizing), &row.control))
    }

    pub(super) fn deathmist_ability_kind(&self, guid: u64, spell: u32) -> Option<u8> {
        let brand = self.generic.deathmist_brand?;
        if spell == 0 || self.attribution.source_kind != 0 || brand.target != guid
            || !(brand.expires > self.now)
        {
            return None;
        }
        // 145fb56e0 checks class pool keys before live learned definitions.
        let pool = player_abilities::CLASSES.iter().find(|class| class.class_id == self.class_id)
            .map_or(&[][..], |class| class.pool);
        pool.iter().filter_map(|key| AbilityDefinition::by_key(key))
            .chain(self.meter_abilities.iter().map(|row| row.0))
            .chain(self.meter_racial)
            .chain(AbilityDefinition::by_key("explosive_trap"))
            .find(|ability| ability.spell_id == spell || ability.pulse_spell_id == spell)
            .map(|ability| ability.kind)
    }

    pub(super) fn expire_deathmist_brand(&mut self) {
        let Some(brand) = self.generic.deathmist_brand else { return; };
        let alive = self.deathmist_victim(brand.target).is_some_and(|(victim, _)| !victim.dead);
        if self.now >= brand.expires || !alive {
            self.generic.deathmist_brand = None;
            if alive {
                self.actor_aura(brand.target, BRAND_AURA, false);
            }
        }
    }

    pub(super) fn deathmist_brand_event(&mut self, row: &EffectRow, index: usize, event: Event,
        definition: Option<&AbilityDefinition>, guid: u64, raw_hit: f32, vitals: &Vitals) {
        // 145fbea7b checks the first configured Conflagrate condition, then
        // searches for a stored Immolate row without filtering its ticks.
        let conflagrate = self.equipped.rows.iter().find(|candidate| candidate.tag() == 4
            && candidate.word(16) == 348 && candidate.word(24) != u32::MAX);
        if !conflagrate.is_some_and(|candidate| candidate.condition_matches(
            24, &event, definition, vitals.health, vitals.maximum_health,
        )) || !self.periodic_rows(guid).is_some_and(|rows| rows.iter().any(|dot| dot.spell_id == 348)) {
            return;
        }
        let Some((victim, control)) = self.deathmist_victim(guid) else { return; };
        let burn = row.float(8);
        let burn_power = if burn > 0.0 && !victim.dead {
            // 145fbeb95 and 145fbeba7 sample post-hit state before
            // moving or refreshing the existing brand.
            let effects = self.effect_stats();
            let base = damage::victim_multiplier(&victim, &VictimContext {
                run_state: 1,
                now: self.now,
                player_absorb: vitals.absorb,
                talent_effects: &effects,
                spell_amplification: 0.0,
                elemental_sunder: 0.0,
                packlord_amplification: 0.0,
            }).max(0.01);
            let amp = enhancement::spell_amplification(
                self.equipped, event.spell_id, self.now, control, &victim,
                event.source_kind, vitals.absorb, self.deathmist_ability_kind(guid, event.spell_id),
            );
            Some((((base + amp) * raw_hit) / base) * burn)
        } else {
            None
        };

        if let Some(previous) = self.generic.deathmist_brand
            && previous.target != guid
            && self.deathmist_victim(previous.target).is_some_and(|(victim, _)| !victim.dead)
        {
            self.actor_aura(previous.target, BRAND_AURA, false);
        }
        self.generic.deathmist_brand = Some(Brand { target: guid, expires: self.now + 10.0 });
        if !victim.dead {
            self.actor_aura(guid, BRAND_AURA, true);
        }

        let Some(power) = burn_power else { return; };
        let now = self.now;
        let Some(rows) = self.periodic_rows_mut(guid) else { return; };
        // 145ee0d10 sums unspent power for this effect index, removes
        // matching rows in order, and appends four one-second ticks.
        let owner = index as u64;
        let retained = rows.iter().filter(|dot| dot.owner_kind != 0
            && dot.owner_guid == owner && dot.spell_id == BURN_AURA)
            .fold(-0.0, |sum, dot| sum + dot.power_per_tick * dot.ticks_remaining as f32);
        rows.retain(|dot| !(dot.owner_kind == 1 && dot.owner_guid == owner && dot.spell_id == BURN_AURA));
        periodic::install_dot(rows, 1, owner, BURN_AURA, 2, periodic::DotPlan {
            total_power: power + retained,
            duration: 4.0,
            ticks: 4,
        }, now, 0.0, 1);
        self.actor_aura(guid, BURN_AURA, true);
    }
}
