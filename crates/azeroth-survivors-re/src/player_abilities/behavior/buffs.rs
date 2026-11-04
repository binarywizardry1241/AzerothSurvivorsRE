//! Current kind-nine self-casts (1454e8880 and its original branch targets).
//! These are concrete aura/vital mutations; callers must perform returned
//! combat, stat-recompute and network actions in the real run.

use super::{min_preserving_original_nan, state::{scaled_hit_effect, Vitals}, RuntimeInstance};
use crate::player_abilities::{catalog::StatusEffect, damage::scaled_duration, native_max, native_min};

const ICE_BARRIER: u32 = 11426;

/// Semantic current32-byte player aura. Self contributions use source0;
/// received cooperative contributions retain the casting hero's GUID.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Aura {
    pub source_guid: u64,
    pub effect: StatusEffect,
    pub spell_id: u32,
    pub expires_at: f32,
    /// Native+28: remaining total healing, consumed proportionally per frame.
    pub healing_power: f32,
}

/// Rejuvenation and selected0.127.0 Battle Shout retain independent caster
/// rows. Refreshing one source must preserve another source's remaining life.
pub fn refresh_aura(auras: &mut Vec<Aura>, aura: Aura) {
    auras.retain(|old| old.spell_id != aura.spell_id
        || (matches!(aura.spell_id, 774 | 6673) && old.source_guid != aura.source_guid));
    auras.push(aura);
}

/// Selected0.127.0 145c19060..145c1920e: same-spell auras contribute once,
/// using the strongest damage/haste value, with the first live row winning
/// an equal-strength tie. Rejuvenation remains independently cumulative.
/// Native stat candidates preserve unordered clocks/deadlines; competing rows
/// need an ordered future deadline. The tooltip has its own ordered gate.
pub fn effective_auras(auras: &[Aura], now: f32) -> impl Iterator<Item = &Aura> {
    auras.iter().enumerate().filter(move |(index, aura)| {
        if now >= aura.expires_at { return false; }
        if aura.spell_id == 774 { return true; }
        let strength = |row: &Aura| if matches!(row.effect.tag, 8 | 9) { row.effect.value } else { 0.0 };
        let value = strength(aura);
        !auras.iter().enumerate().any(|(other_index, other)| other_index != *index
            && other.spell_id == aura.spell_id && now < other.expires_at
            && (strength(other) > value || (strength(other) == value && other_index < *index)))
    }).map(|(_, aura)| aura)
}

#[derive(Clone, Debug, Default, PartialEq)]
pub struct AuraTick {
    pub healing: Vec<(u32, f32)>,
    pub expired: Vec<u32>,
    pub absorb_changed: bool,
}

///14549da10..14549dc3e. Healing uses delta/max(remaining duration,delta),
/// capped at1; it is not a fixed one-second tick. Expiry follows that final
/// fraction, then removes the reserved shield and triggers stat/aura updates.
pub fn tick_auras(auras: &mut Vec<Aura>, now: f32, delta: f32,
                  vitals: &mut Vitals, shield: &mut ShieldReservation) -> AuraTick {
    let mut result = AuraTick::default();
    for aura in auras.iter_mut() {
        if aura.healing_power > 0.0 {
            let amount = (delta / (aura.expires_at - now).max(delta)).min(1.0) * aura.healing_power;
            aura.healing_power -= amount;
            result.healing.push((aura.spell_id, amount));
        }
        if now >= aura.expires_at { result.expired.push(aura.spell_id); }
    }
    let ice_expired = result.expired.contains(&ICE_BARRIER);
    if ice_expired {
        vitals.absorb = native_max(vitals.absorb - shield.ice_barrier_absorb, 0.0);
        shield.ice_barrier_absorb = 0.0;
        result.absorb_changed = true;
    }
    if shield.spell_id != 0 && result.expired.contains(&shield.spell_id) {
        if !(ice_expired && shield.spell_id == ICE_BARRIER) {
            vitals.absorb = (vitals.absorb - shield.amount).max(0.0);
        }
        shield.clear_spell();
        result.absorb_changed = true;
    }
    shield.ice_barrier_absorb =
        min_preserving_original_nan(shield.ice_barrier_absorb, vitals.absorb);
    auras.retain(|a| !(now >= a.expires_at));
    result
}

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct ShieldReservation {
    pub spell_id: u32,
    pub amount: f32,
    /// Game+0x570. Total Ice Barrier absorb from self and party casts.
    pub(super) ice_barrier_absorb: f32,
}

impl ShieldReservation {
    pub(super) fn clear_spell(&mut self) {
        self.spell_id = 0;
        self.amount = 0.0;
    }

    fn counted_ice_barrier(&self, absorb: f32) -> f32 {
        native_max(min_preserving_original_nan(self.ice_barrier_absorb, absorb), 0.0)
    }

    pub fn cap_ice_barrier_after_stat_refresh(
        &mut self, vitals: &mut Vitals, soul_link_absorb: &mut f32,
    ) {
        let counted = self.counted_ice_barrier(vitals.absorb);
        let excess = native_max(counted - vitals.maximum_health, 0.0);
        self.ice_barrier_absorb = counted - excess;
        if excess > 0.0 {
            vitals.absorb = native_max(vitals.absorb - excess, 0.0);
            if self.spell_id == ICE_BARRIER {
                self.amount = min_preserving_original_nan(self.amount, self.ice_barrier_absorb);
            }
            *soul_link_absorb = min_preserving_original_nan(*soul_link_absorb, vitals.absorb);
        }
    }

    pub fn receive_party_shield(&mut self, vitals: &mut Vitals, spell_id: u32, coefficient: f32) {
        let mut amount = vitals.maximum_health * coefficient;
        if spell_id == ICE_BARRIER {
            let counted = self.counted_ice_barrier(vitals.absorb);
            amount = ice_barrier_capacity(vitals.maximum_health, counted, amount);
            self.ice_barrier_absorb = counted + amount;
        }
        vitals.absorb += amount;
        if self.spell_id == 0 {
            self.spell_id = spell_id;
            self.amount = amount;
        }
    }
}

fn ice_barrier_capacity(maximum_health: f32, counted: f32, amount: f32) -> f32 {
    native_min(native_max(maximum_health - counted, 0.0), native_max(0.0, amount))
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum BuffFailure { NoNearbyActor, AlreadyActive, HealthAboveThreshold }

/// Current kind14 shared-heal payload. Coefficient is prepared by the caster;
/// each recipient multiplies it by its own maximum health.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SharedHealing {
    pub spell_id: u32,
    pub coefficient: f32,
    pub duration: f32,
}

/// Selected0.127.0 party event0: the caster supplies the actual scaled status
/// and lifetime; each recipient retains that caster and its own expiry clock.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SharedAura {
    pub spell_id: u32,
    pub effect: StatusEffect,
    pub duration: f32,
}

/// Current145b86da0 kind14 recipient. Positive-duration rows keep their
/// independent caster/expiry/healing; a nonpositive duration requests the
/// receiver's separate direct-health path instead. Unordered duration takes
/// that same native branch.
pub fn receive_shared_healing(
    auras: &mut Vec<Aura>,
    source_guid: u64,
    healing: SharedHealing,
    now: f32,
    maximum_health: f32,
) -> Option<f32> {
    let amount = maximum_health * healing.coefficient;
    if !(healing.duration > 0.0) {
        return Some(amount);
    }
    refresh_aura(auras, Aura {
        source_guid,
        effect: StatusEffect { tag: 6, value: healing.coefficient, duration: 0.0 },
        spell_id: healing.spell_id,
        expires_at: now + healing.duration,
        healing_power: amount,
    });
    None
}

/// A successful cast emits the native no-unit-target visual. An immediate
/// heal is passed to the actual145493fc0-equivalent healing/combat-log port;
/// it is deliberately not also added to Vitals here.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct BuffActions {
    pub immediate_heal: Option<f32>,
    pub shared_healing: Option<SharedHealing>,
    pub shared_aura: Option<SharedAura>,
    pub aura_changed: bool,
    pub recompute_stats: bool,
    pub absorb_changed: bool,
}

/// `nearby_actor` is the native base radius query within30 XY units. Its
/// state-zero restriction and inclusive bound are supplied by execution.rs.
/// `shield_bonus` is current Game+0x498, not the generic damage multiplier.
pub fn apply_self_buff(
    instance: &RuntimeInstance<'_>,
    now: f32,
    nearby_actor: bool,
    shield_bonus: f32,
    vitals: &mut Vitals,
    shield: &mut ShieldReservation,
    auras: &mut Vec<Aura>,
) -> Result<BuffActions, BuffFailure> {
    apply_self_buff_with_party(instance, now, nearby_actor, false,
        shield_bonus, vitals, shield, auras)
}

pub fn apply_self_buff_with_party(
    instance: &RuntimeInstance<'_>,
    now: f32,
    nearby_actor: bool,
    party_needs_healing: bool,
    shield_bonus: f32,
    vitals: &mut Vitals,
    shield: &mut ShieldReservation,
    auras: &mut Vec<Aura>,
) -> Result<BuffActions, BuffFailure> {
    let definition = instance.definition;
    let tag = definition.effect.tag;
    let duration = scaled_duration(instance).max(0.1);
    let power_root = (instance.power_multiplier * instance.talent_power_multiplier).sqrt();
    let mut actions = BuffActions {
        immediate_heal: None, shared_healing: None, shared_aura: None, aura_changed: true,
        recompute_stats: false, absorb_changed: false,
    };
    let mut effect = scaled_hit_effect(instance);
    let mut healing_power = 0.0;
    match tag {
        10 if definition.key == "demonic_empowerment" => {
            if !nearby_actor { return Err(BuffFailure::NoNearbyActor); }
            // Current 0.112.0 aura10 carries demon damage only. Its payload
            // uses the same effect-strength lane as Battle Shout; current buff
            // power applies once at the demon consumer.
            effect = crate::run_effects::demon_talents::empowerment_effect(instance)
                .expect("current Empowerment damage payload");
            actions.recompute_stats = true;
        }
        7 => {
            if auras.iter().any(|a| a.spell_id == definition.spell_id) {
                return Err(BuffFailure::AlreadyActive);
            }
            // 0.139.2 prepares the effect/health lane before applying buff strength.
            let effect_power = instance.effect_multiplier * definition.effect.value;
            let health_power = vitals.maximum_health * effect_power;
            let mut amount = (shield_bonus + 1.0) * ((power_root * 1.4) * health_power);
            if definition.spell_id == ICE_BARRIER {
                let other_reservation = if shield.spell_id == ICE_BARRIER {
                    0.0
                } else {
                    shield.amount
                };
                let other_absorb = native_max(vitals.absorb - shield.ice_barrier_absorb, 0.0);
                amount = ice_barrier_capacity(vitals.maximum_health, 0.0, amount);
                vitals.absorb = native_max(other_absorb - other_reservation, 0.0) + amount;
                shield.ice_barrier_absorb = amount;
            } else {
                vitals.absorb = (vitals.absorb - shield.amount).max(0.0) + amount;
            }
            shield.spell_id = definition.spell_id;
            shield.amount = amount;
            actions.absorb_changed = true;
            if definition.spell_id == ICE_BARRIER || definition.key == "stoneform" {
                // Kind 15 carries the caster's coefficient and scaled duration.
                let coefficient = ((power_root * 1.4) * effect_power) * (shield_bonus + 1.0);
                actions.shared_aura = Some(SharedAura {
                    spell_id: definition.spell_id,
                    effect: StatusEffect { tag, value: coefficient, duration: 0.0 },
                    duration,
                });
            }
        }
        6 => {
            if 0.85 * vitals.maximum_health < vitals.health && !party_needs_healing {
                return Err(BuffFailure::HealthAboveThreshold);
            }
            let factor = power_root * 1.4;
            let amount = (vitals.maximum_health * definition.effect.value) * factor;
            actions.shared_healing = Some(SharedHealing {
                spell_id: definition.spell_id,
                coefficient: factor * definition.effect.value,
                duration: definition.duration,
            });
            if !(definition.duration > 0.0) {
                actions.immediate_heal = Some(amount);
                actions.aura_changed = false;
                return Ok(actions);
            }
            healing_power = amount;
        }
        11 => {
            // Native UCOMISS/JA rejects only ordered values above the threshold.
            if vitals.health > vitals.maximum_health * 0.35 {
                return Err(BuffFailure::HealthAboveThreshold);
            }
        }
        _ => {
            if !nearby_actor { return Err(BuffFailure::NoNearbyActor); }
            if tag == 12 {
                effect.value = instance.talent_power_multiplier * instance.power_multiplier
                    * definition.effect.value;
            }
            actions.recompute_stats = true;
        }
    }
    refresh_aura(auras, Aura { source_guid: 0, effect, spell_id: definition.spell_id,
        expires_at: now + duration, healing_power });
    if definition.key == "battle_shout" {
        actions.shared_aura = Some(SharedAura { spell_id: definition.spell_id, effect, duration });
    }
    Ok(actions)
}
