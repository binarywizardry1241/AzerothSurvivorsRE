//! Current kind-nine self-casts (1454e8880 and its original branch targets).
//! These are concrete aura/vital mutations; callers must perform returned
//! combat, stat-recompute and network actions in the real run.

use super::{min_preserving_original_nan, state::{scaled_hit_effect, Vitals}, RuntimeInstance};
use crate::{
    player_abilities::{AbilityDefinition, catalog::StatusEffect, damage::scaled_duration, native_max, native_min},
    run_effects::Effects,
};

const POWER_WORD_SHIELD: u32 = 17;
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

impl Aura {
    /// Received damage and haste buffs already include the caster's bonus.
    /// A self aura keeps its base value and uses the hero's current bonus.
    pub fn buff_strength(&self, buff_bonus: f32) -> f32 {
        let value = if matches!(self.effect.tag, 8 | 9) { self.effect.value } else { 0.0 };
        let factor = if self.source_guid == 0 { 1.0 + buff_bonus } else { 1.0 };
        value * factor
    }
}

pub(super) fn has_active_immunity(auras: &[Aura], now: f32) -> bool {
    auras.iter().any(|aura| aura.effect.tag == 11 && aura.expires_at > now)
}

/// Rejuvenation and selected0.127.0 Battle Shout retain independent caster
/// rows. Refreshing one source must preserve another source's remaining life.
pub fn refresh_aura(auras: &mut Vec<Aura>, aura: Aura) {
    auras.retain(|old| old.spell_id != aura.spell_id
        || (matches!(aura.spell_id, 774 | 6673) && old.source_guid != aura.source_guid));
    auras.push(aura);
}

/// 0.141.1 145fa5b69..145fa5c90: same-spell auras contribute once,
/// using the strongest effective damage/haste value, with the first live
/// row winning an equal-strength tie. Rejuvenation remains cumulative.
/// Native stat candidates preserve unordered clocks/deadlines; competing rows
/// need an ordered future deadline. The tooltip has its own ordered gate.
pub fn effective_auras(auras: &[Aura], now: f32, buff_bonus: f32) -> impl Iterator<Item = &Aura> {
    auras.iter().enumerate().filter(move |(index, aura)| {
        if now >= aura.expires_at { return false; }
        if aura.spell_id == 774 { return true; }
        let value = aura.buff_strength(buff_bonus);
        !auras.iter().enumerate().any(|(other_index, other)| other_index != *index
            && other.spell_id == aura.spell_id && now < other.expires_at
            && {
                let strength = other.buff_strength(buff_bonus);
                strength > value || (strength == value && other_index < *index)
            })
    }).map(|(_, aura)| aura)
}

#[derive(Clone, Debug, Default, PartialEq)]
pub struct AuraTick {
    pub healing: Vec<(AuraHealer, f32)>,
    pub expired: Vec<u32>,
    pub absorb_changed: bool,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct AuraHealer {
    pub source_guid: u64,
    pub spell_id: u32,
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
            result.healing.push((AuraHealer {
                source_guid: aura.source_guid,
                spell_id: aura.spell_id,
            }, amount));
        }
        if now >= aura.expires_at { result.expired.push(aura.spell_id); }
    }
    let ice_expired = result.expired.contains(&ICE_BARRIER);
    if ice_expired {
        vitals.absorb = native_max(vitals.absorb - shield.ice_barrier_absorb, 0.0);
        shield.party_absorb = native_max(shield.party_absorb - shield.ice_barrier_absorb, 0.0);
        shield.ice_barrier_absorb = 0.0;
        result.absorb_changed = true;
    }
    if shield.spell_id != 0 && result.expired.contains(&shield.spell_id) {
        if !(ice_expired && shield.spell_id == ICE_BARRIER) {
            vitals.absorb = (vitals.absorb - shield.amount).max(0.0);
            if shield.spell_id == shield.party_absorb_spell_id {
                shield.party_absorb = native_max(shield.party_absorb - shield.amount, 0.0);
            }
        }
        shield.clear_spell();
        result.absorb_changed = true;
    }
    shield.shared_spell_absorb.retain(|(spell_id, amount)| {
        if !result.expired.contains(spell_id) { return true; }
        vitals.absorb = native_max(vitals.absorb - *amount, 0.0);
        shield.party_absorb = native_max(shield.party_absorb - *amount, 0.0);
        result.absorb_changed = true;
        false
    });
    shield.ice_barrier_absorb =
        min_preserving_original_nan(shield.ice_barrier_absorb, vitals.absorb);
    shield.clamp_party_absorb(vitals.absorb);
    auras.retain(|a| !(now >= a.expires_at));
    result
}

#[derive(Clone, Debug, Default, PartialEq)]
pub struct ShieldReservation {
    pub spell_id: u32,
    pub amount: f32,
    /// Total Ice Barrier absorb from self and party casts.
    pub(super) ice_barrier_absorb: f32,
    /// Current Game+294 tracks absorb granted by other party members.
    pub(super) party_absorb: f32,
    pub(super) party_absorb_spell_id: u32,
    /// Separate party reservations retain their insertion order for damage.
    pub(super) shared_spell_absorb: Vec<(u32, f32)>,
    pub(super) power_word_shield_cap_bonus: f32,
    pub(super) ice_barrier_cap_bonus: f32,
}

impl ShieldReservation {
    pub fn own_absorb(&self, total: f32) -> f32 {
        native_max(total - self.party_absorb, 0.0)
    }

    pub(super) fn clamp_party_absorb(&mut self, total: f32) {
        self.party_absorb = min_preserving_original_nan(self.party_absorb, total);
    }

    pub(super) fn clear_spell(&mut self) {
        self.spell_id = 0;
        self.amount = 0.0;
    }

    pub(super) fn clear_absorb(&mut self) {
        self.clear_spell();
        self.ice_barrier_absorb = 0.0;
        self.shared_spell_absorb.clear();
    }

    pub(super) fn consume_shared_absorb(&mut self, mut remaining: f32, removed: &mut Vec<u32>) -> f32 {
        self.shared_spell_absorb.retain_mut(|(spell_id, amount)| {
            spend_absorb(&mut remaining, amount);
            if *amount <= 0.0 {
                removed.push(*spell_id);
                false
            } else {
                true
            }
        });
        remaining
    }

    fn counted_ice_barrier(&self, absorb: f32) -> f32 {
        native_max(min_preserving_original_nan(self.ice_barrier_absorb, absorb), 0.0)
    }

    fn power_word_shield_cap(&self, maximum_health: f32) -> f32 {
        native_min(1.0 + self.power_word_shield_cap_bonus, 2.0) * maximum_health
    }

    fn ice_barrier_cap(&self, maximum_health: f32) -> f32 {
        (1.0 + self.ice_barrier_cap_bonus) * maximum_health
    }

    fn counted_power_word_shield(&self) -> f32 {
        let shared = self.shared_spell_absorb.iter()
            .filter(|(spell_id, _)| *spell_id == POWER_WORD_SHIELD)
            .fold(-0.0, |sum, (_, amount)| sum + amount);
        let primary = if self.spell_id == POWER_WORD_SHIELD { self.amount } else { 0.0 };
        primary + shared
    }

    pub fn refresh_capacities(
        &mut self, vitals: &mut Vitals, soul_link_absorb: &mut f32, effects: &Effects,
    ) {
        let bonus = |key| effects.spell_modifiers(
            AbilityDefinition::by_key(key).expect("recovered shield ability"),
        ).absorb_cap_bonus;
        self.ice_barrier_cap_bonus = bonus("ice_barrier");
        self.power_word_shield_cap_bonus = bonus("pw_shield");

        let counted = self.counted_ice_barrier(vitals.absorb);
        let excess = native_max(counted - self.ice_barrier_cap(vitals.maximum_health), 0.0);
        self.ice_barrier_absorb = counted - excess;
        if excess > 0.0 {
            vitals.absorb = native_max(vitals.absorb - excess, 0.0);
            if self.spell_id == ICE_BARRIER {
                self.amount = min_preserving_original_nan(self.amount, self.ice_barrier_absorb);
            }
            *soul_link_absorb = min_preserving_original_nan(*soul_link_absorb, vitals.absorb);
        }

        let mut excess = native_max(self.counted_power_word_shield()
            - self.power_word_shield_cap(vitals.maximum_health), 0.0);
        if excess > 0.0 {
            vitals.absorb = native_max(vitals.absorb - excess, 0.0);
            *soul_link_absorb = min_preserving_original_nan(*soul_link_absorb, vitals.absorb);
            self.clamp_party_absorb(vitals.absorb);
            if self.spell_id == POWER_WORD_SHIELD {
                spend_absorb(&mut excess, &mut self.amount);
            }
            for (spell_id, amount) in &mut self.shared_spell_absorb {
                if *spell_id == POWER_WORD_SHIELD {
                    spend_absorb(&mut excess, amount);
                }
            }
        }
    }

    pub fn receive_party_shield(&mut self, vitals: &mut Vitals, spell_id: u32, coefficient: f32) {
        let amount = vitals.maximum_health * coefficient;
        let added = if spell_id == ICE_BARRIER {
            let counted = self.counted_ice_barrier(vitals.absorb);
            let added = ice_barrier_capacity(self.ice_barrier_cap(vitals.maximum_health), counted, amount);
            self.ice_barrier_absorb = counted + added;
            if self.spell_id == 0 {
                self.spell_id = spell_id;
                self.amount = added;
            }
            added
        } else {
            let remaining = if spell_id == POWER_WORD_SHIELD {
                native_max(self.power_word_shield_cap(vitals.maximum_health)
                    - self.counted_power_word_shield(), 0.0)
            } else {
                f32::INFINITY
            };
            if self.spell_id == 0 {
                self.spell_id = spell_id;
                self.amount = min_preserving_original_nan(amount, remaining);
                self.amount
            } else {
                let existing = if self.spell_id == spell_id {
                    Some(&mut self.amount)
                } else {
                    self.shared_spell_absorb.iter_mut().find(|(key, _)| *key == spell_id)
                        .map(|(_, held)| held)
                };
                if let Some(held) = existing {
                    let added = native_min(remaining, native_max(0.0, amount - *held));
                    *held += added;
                    added
                } else {
                    let added = min_preserving_original_nan(amount, remaining);
                    self.shared_spell_absorb.push((spell_id, added));
                    added
                }
            }
        };
        vitals.absorb += added;
        self.party_absorb += added;
        self.party_absorb_spell_id = spell_id;
    }
}

fn spend_absorb(remaining: &mut f32, amount: &mut f32) {
    let spent = min_preserving_original_nan(*remaining, *amount);
    *amount -= spent;
    *remaining -= spent;
}

fn ice_barrier_capacity(capacity: f32, counted: f32, amount: f32) -> f32 {
    native_min(native_max(capacity - counted, 0.0), native_max(0.0, amount))
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
/// `buff_bonus` is the caster's buff potency stat (0.141.1 Game+0x69c).
pub fn apply_self_buff(
    instance: &RuntimeInstance<'_>,
    now: f32,
    nearby_actor: bool,
    buff_bonus: f32,
    vitals: &mut Vitals,
    shield: &mut ShieldReservation,
    auras: &mut Vec<Aura>,
) -> Result<BuffActions, BuffFailure> {
    apply_self_buff_with_party(instance, now, nearby_actor, false,
        buff_bonus, vitals, shield, auras)
}

pub fn apply_self_buff_with_party(
    instance: &RuntimeInstance<'_>,
    now: f32,
    nearby_actor: bool,
    party_needs_healing: bool,
    buff_bonus: f32,
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
            let mut amount = (buff_bonus + 1.0) * ((power_root * 1.4) * health_power);
            if definition.spell_id == ICE_BARRIER {
                let other_reservation = if shield.spell_id == ICE_BARRIER {
                    0.0
                } else {
                    shield.amount
                };
                let other_absorb = native_max(vitals.absorb - shield.ice_barrier_absorb, 0.0);
                amount = ice_barrier_capacity(shield.ice_barrier_cap(vitals.maximum_health), 0.0, amount);
                vitals.absorb = native_max(other_absorb - other_reservation, 0.0) + amount;
                shield.ice_barrier_absorb = amount;
            } else {
                vitals.absorb = native_max(vitals.absorb - shield.amount, 0.0);
                if definition.spell_id == POWER_WORD_SHIELD {
                    shield.clear_spell();
                    let capacity = native_max(shield.power_word_shield_cap(vitals.maximum_health)
                        - shield.counted_power_word_shield(), 0.0);
                    amount = native_min(amount, capacity);
                }
                vitals.absorb += amount;
            }
            shield.spell_id = definition.spell_id;
            shield.amount = amount;
            actions.absorb_changed = true;
            // Kind 15 carries the caster's uncapped coefficient and duration.
            let coefficient = ((power_root * 1.4) * effect_power) * (buff_bonus + 1.0);
            actions.shared_aura = Some(SharedAura {
                spell_id: definition.spell_id,
                effect: StatusEffect { tag, value: coefficient, duration: 0.0 },
                duration,
            });
        }
        6 => {
            if 0.85 * vitals.maximum_health < vitals.health && !party_needs_healing {
                return Err(BuffFailure::HealthAboveThreshold);
            }
            // 0.140.0 145f80213..145f80222 applies selector 7 to both
            // this recipient's heal and the outgoing party coefficient.
            let factor = (power_root * 1.4) * instance.healing_multiplier;
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
            // 0.140.0 145f7ea38..145f7ea7e tests the effect and deadline
            // of every aura before any of the immunity casts can apply.
            if has_active_immunity(auras, now) {
                return Err(BuffFailure::AlreadyActive);
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
        // 0.141.1 145f49010 scales the outgoing copy after storing the self aura.
        if matches!(effect.tag, 8 | 9) {
            effect.value *= 1.0 + buff_bonus;
        }
        actions.shared_aura = Some(SharedAura { spell_id: definition.spell_id, effect, duration });
    }
    Ok(actions)
}

#[cfg(test)]
mod feralheart_tests {
    use super::*;
    use crate::{player_abilities::AbilityDefinition, run_effects::{EffectRow, Effects}, sets};

    #[test]
    fn feralheart_scales_both_local_and_shared_healing_coefficients() {
        let descriptor = sets::tier_half_four_piece(11).unwrap();
        let mut effects = Effects::default();
        effects.talents.extend(descriptor.effects.iter().map(EffectRow::armor_set));
        effects.rebuild(None);

        for key in ["regrowth", "rejuvenation"] {
            let definition = AbilityDefinition::by_key(key).unwrap();
            let mut instance = RuntimeInstance::learned(definition);
            effects.spell_modifiers(definition).apply(&mut instance);
            let mut vitals = Vitals {
                health: 50.0, maximum_health: 100.0, absorb: 0.0,
                absorb_applied_at: 0.0, absorb_same_tick_count: 0,
            };
            let mut shield = ShieldReservation::default();
            let mut auras = Vec::new();
            let actions = apply_self_buff(&instance, 1.0, true, 0.0, &mut vitals, &mut shield, &mut auras)
                .unwrap();
            let factor = 1.4_f32 * 1.2;
            assert_eq!(auras[0].healing_power, (100.0 * definition.effect.value) * factor);
            assert_eq!(actions.shared_healing.unwrap().coefficient, factor * definition.effect.value);
        }
    }
}

#[cfg(test)]
mod immunity_tests {
    use super::*;
    use crate::player_abilities::AbilityDefinition;

    #[test]
    fn protections_exclude_each_other_until_the_active_aura_expires() {
        let keys = ["divine_shield", "will_of_the_forsaken", "shadowmeld"];
        for active in keys {
            for attempted in keys {
                let first = RuntimeInstance::learned(AbilityDefinition::by_key(active).unwrap());
                let second =
                    RuntimeInstance::learned(AbilityDefinition::by_key(attempted).unwrap());
                let mut vitals = Vitals {
                    health: 30.0,
                    maximum_health: 100.0,
                    absorb: 0.0,
                    absorb_applied_at: 0.0,
                    absorb_same_tick_count: 0,
                };
                let mut shield = ShieldReservation::default();
                let mut auras = Vec::new();
                apply_self_buff(&first, 0.0, true, 0.0, &mut vitals, &mut shield, &mut auras)
                    .unwrap();
                let expiry = auras[0].expires_at;
                assert!(matches!(
                    apply_self_buff(
                        &second, expiry - 0.1, true, 0.0, &mut vitals, &mut shield, &mut auras,
                    ),
                    Err(BuffFailure::AlreadyActive)
                ));
                assert_eq!(auras.len(), 1);
                assert_eq!(auras[0].expires_at, expiry);
                apply_self_buff(&second, expiry, true, 0.0, &mut vitals, &mut shield, &mut auras)
                    .unwrap();
            }
        }
    }
}
