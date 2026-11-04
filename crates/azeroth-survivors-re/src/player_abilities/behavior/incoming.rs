//! Incoming-player effect consumers recovered from the selected 0.100.1 PE.
//! Owner 1454a0910, REA ev_5c5548a8713328ddd2482bd9b5a8b809dfd17cd725a0d629299f89876896c599.
//! The run calls these stages in order: apply, synchronous reactive callbacks,
//! racial rescue, first talent19 rescue, Soulstone rescue, final death.

use super::{
    buffs::{Aura, ShieldReservation},
    min_preserving_original_nan,
    state::Vitals,
};
use crate::{
    enemies::{NativeRng, Position, ai::Actor},
    player_abilities::{catalog::StatusEffect, native_max},
};

/// Game+110/+114 retain absorbed damage until an absorb aura is removed.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct IncomingState {
    /// Selected0.105.0 Game+190: Soul Link's contribution within Vitals.absorb.
    /// It is credited after a reserved spell shield, never applied a second time.
    pub soul_link_absorb: f32,
    pub absorbed_pending: f32,
    pub absorbed_maximum: f32,
    pub last_hit_at: f32,
    /// Game+118. Shared by the first equipped talent19, not per-row.
    pub lethal_talent_ready_at: f32,
}

#[derive(Clone, Debug, PartialEq)]
pub struct DamageApplied {
    pub amount: f32,
    pub absorbed: f32,
    pub soul_link_absorbed: f32,
    pub removed_auras: Vec<u32>,
    /// Meter callback for shield absorption, after aura removal/stat refresh.
    pub completed_absorption: Option<f32>,
}

/// 1454a0980..0c41. The caller owns phase/special-run/dead gates. Armor
/// applies to every hit; physical classification controls later callbacks.
pub fn apply_damage(
    vitals: &mut Vitals,
    reservation: &mut ShieldReservation,
    auras: &mut Vec<Aura>,
    state: &mut IncomingState,
    now: f32,
    raw_damage: f32,
    armor_fraction: f32,
) -> Option<DamageApplied> {
    apply_damage_with_crowd(vitals, reservation, auras, state, now, raw_damage,
        armor_fraction, 0.0)
}

/// Current145bcde35..145bce155 applies an admitted crowd reduction after
/// ordinary armor and before absorption. The caller counts the live actors.
pub fn apply_damage_with_crowd(
    vitals: &mut Vitals,
    reservation: &mut ShieldReservation,
    auras: &mut Vec<Aura>,
    state: &mut IncomingState,
    now: f32,
    raw_damage: f32,
    armor_fraction: f32,
    crowd_reduction: f32,
) -> Option<DamageApplied> {
    if auras
        .iter()
        .any(|aura| aura.effect.tag == 11 && aura.expires_at > now)
    {
        return None;
    }
    let mut amount = (1.0 - armor_fraction) * raw_damage;
    if crowd_reduction > 0.0 {
        amount *= 1.0 - crowd_reduction;
    }
    let mut result = DamageApplied {
        amount,
        absorbed: 0.0,
        soul_link_absorbed: 0.0,
        removed_auras: Vec::new(),
        completed_absorption: None,
    };
    if vitals.absorb > 0.0 {
        let old_absorb = vitals.absorb;
        let absorbed = min_preserving_original_nan(amount, old_absorb);
        vitals.absorb -= absorbed;
        reservation.ice_barrier_absorb = native_max(reservation.ice_barrier_absorb - absorbed, 0.0);
        let reserved_spell = reservation.spell_id;
        let unreserved_absorption = if reserved_spell == 0 {
            absorbed
        } else {
            native_max(absorbed - reservation.amount, 0.0)
        };
        let reserved_depleted = reserved_spell != 0 && absorbed >= reservation.amount;
        if absorbed < reservation.amount || reserved_spell == 0 {
            reservation.amount -= absorbed;
        } else {
            reservation.clear_spell();
        }
        amount -= absorbed;
        result.absorbed = absorbed;
        // Selected1458f34a7..35c3: spell reservation has first claim. Soul
        // Link contributes to the already-subtracted total shield, and only
        // its consumed share enters the healing meter. Preserve MINSS/NaN
        // ordering and the ordered-positive admission gate of this owner.
        let soul_link = min_preserving_original_nan(unreserved_absorption, state.soul_link_absorb);
        if soul_link > 0.0 {
            state.soul_link_absorb -= soul_link;
            result.soul_link_absorbed = soul_link;
        }
        state.soul_link_absorb = min_preserving_original_nan(state.soul_link_absorb, vitals.absorb);
        let remove_all_shields = vitals.absorb <= 0.0;
        if remove_all_shields {
            *reservation = ShieldReservation::default();
        }
        auras.retain(|aura| {
            let remove = if remove_all_shields {
                aura.effect.tag == 7
            } else {
                reserved_depleted && aura.spell_id == reserved_spell
            };
            if remove {
                result.removed_auras.push(aura.spell_id);
            }
            !remove
        });
        state.absorbed_pending += absorbed;
        let maximum = native_max(state.absorbed_maximum, old_absorb);
        if !maximum.is_nan() {
            state.absorbed_maximum = maximum;
        }
        // Native recomputes even when the requested removal found no aura.
        if remove_all_shields || reserved_depleted {
            let credit =
                min_preserving_original_nan(state.absorbed_pending, state.absorbed_maximum);
            state.absorbed_pending = 0.0;
            state.absorbed_maximum = 0.0;
            if !(credit <= 0.0) {
                result.completed_absorption = Some(credit);
            }
        }
    }
    vitals.health -= amount;
    state.last_hit_at = now;
    result.amount = amount;
    Some(result)
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ReactiveHit {
    pub target_guid: u64,
    pub spell_id: u32,
    pub school: u8,
    pub damage: f32,
    /// Only the gear22 branch replaces the native source-kind with3. Aura12
    /// uses the caller's existing attribution, as the original instructions do.
    pub passive_source: bool,
}

pub trait ReactivePort {
    fn auras(&self) -> &[Aura];
    fn thorns_bonus(&self) -> f32;
    fn damage_multiplier(&self) -> f32;
    fn gear22_sum(&self) -> f32;
    fn run_active(&self) -> bool;
    /// Must resolve immediately and pass the same RNG through any downstream
    /// hit/death callbacks before the next reactive stage reads run state.
    fn hit(&mut self, hit: ReactiveHit, rng: &mut NativeRng);
}

/// 1454a0e43..10c2. No random draw belongs to this owner. A positive aura12
/// sum uses its FIRST tag12 row's spell, even if that row itself has expired.
/// If aura12 exists but cannot retaliate (nonphysical/zero source), the native
/// skips gear retaliation too. Otherwise gear22 reflects original RAW damage.
pub fn reactive_effects(
    now: f32,
    raw_damage: f32,
    source_guid: u64,
    physical: bool,
    rng: &mut NativeRng,
    port: &mut impl ReactivePort,
) {
    let mut power = -0.0_f32;
    for aura in port.auras() {
        if aura.effect.tag == 12 && aura.expires_at > now {
            power += aura.effect.value;
        }
    }
    if power > 0.0 {
        if source_guid == 0 || !physical {
            return;
        }
        let spell_id = port
            .auras()
            .iter()
            .find(|aura| aura.effect.tag == 12)
            .map_or(467, |aura| aura.spell_id);
        let damage = (port.thorns_bonus() + 1.0) * power * port.damage_multiplier();
        port.hit(
            ReactiveHit {
                target_guid: source_guid,
                spell_id,
                school: 3,
                damage,
                passive_source: false,
            },
            rng,
        );
        if !port.run_active() {
            return;
        }
    } else if source_guid == 0 || !physical || !port.run_active() {
        return;
    }
    let factor = port.gear22_sum();
    if raw_damage > 0.0 && factor > 0.0 {
        port.hit(
            ReactiveHit {
                target_guid: source_guid,
                spell_id: 467,
                school: 3,
                damage: raw_damage * factor,
                passive_source: true,
            },
            rng,
        );
    }
}

/// First talent19 row payload; its native 64-byte row is read at +4/+8/+12.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LethalProtection {
    pub cooldown: f32,
    pub health_fraction: f32,
    pub invulnerability_seconds: f32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct TalentRescue {
    pub visual_spell: u32,
    pub aura_changed: bool,
}

/// 1454a151a..1753. Call only after lethal racial rescue failed. Caller must
/// choose the FIRST tag19 row; a cooling first row does not try later rows.
pub fn rescue_with_talent(
    protection: Option<LethalProtection>,
    now: f32,
    vitals: &mut Vitals,
    auras: &mut Vec<Aura>,
    state: &mut IncomingState,
) -> Option<TalentRescue> {
    let protection = protection?;
    if state.lethal_talent_ready_at > now {
        return None;
    }
    state.lethal_talent_ready_at = now + protection.cooldown;
    vitals.health = protection.health_fraction * vitals.maximum_health;
    let aura_changed = protection.invulnerability_seconds > 0.0;
    if aura_changed {
        // A direct append, no deduplication/replacement or duration clamp.
        auras.push(Aura {
            source_guid: 0,
            effect: StatusEffect {
                tag: 11,
                value: 0.0,
                duration: 0.0,
            },
            spell_id: 1856,
            expires_at: now + protection.invulnerability_seconds,
            healing_power: 0.0,
        });
    }
    Some(TalentRescue {
        visual_spell: if aura_changed { 1856 } else { 20594 },
        aura_changed,
    })
}

/// Current 0.127.0 145c13684..13720 replaces spell1020 after consuming a
/// Soulstone, restoring half health and emitting21169, before the15237 burst.
/// The incoming guard145c12470 uses this same live aura even in the same tick.
pub fn soulstone_grace(auras: &mut Vec<Aura>, now: f32) {
    super::buffs::refresh_aura(auras, Aura {
        source_guid: 0,
        effect: StatusEffect {
            tag: 11, // Current native raw12: damage immunity.
            value: 0.0,
            duration: 0.0,
        },
        spell_id: 1020,
        expires_at: now + 2.0,
        healing_power: 0.0,
    });
}

/// 1455405b0: stable actor-storage order, live only, strict XY distance²<144.
/// Unlike ordinary ordered queries this does not sort by distance/priority.
pub fn soulstone_targets(actors: &[Actor], now: f32, player: Position) -> Vec<u64> {
    actors
        .iter()
        .filter(|actor| !actor.dead)
        .filter_map(|actor| {
            let position = actor.movement.position_at(now);
            let x = position.x - player.x;
            let y = position.y - player.y;
            (x * x + y * y < 144.0).then_some(actor.guid)
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    fn vitals() -> Vitals {
        Vitals {
            health: 10.0,
            maximum_health: 100.0,
            absorb: 20.0,
            absorb_applied_at: 0.0,
            absorb_same_tick_count: 0,
        }
    }
    #[test]
    fn soulstone_grace_replaces_resume_aura_and_protects_until_exact_deadline() {
        let mut auras = vec![Aura {
            source_guid: 0,
            effect: StatusEffect { tag: 11, value: 0.0, duration: 0.0 },
            spell_id: 1020,
            expires_at: 900.0,
            healing_power: 0.0,
        }];
        soulstone_grace(&mut auras, 10.0);
        assert_eq!(auras.len(), 1);
        assert_eq!(auras[0].expires_at, 12.0);
        for now in [10.0, f32::from_bits(12.0f32.to_bits() - 1)] {
            let mut health = vitals();
            health.health = 50.0;
            health.absorb = 0.0;
            assert!(apply_damage(&mut health, &mut ShieldReservation::default(),
                &mut auras, &mut IncomingState::default(), now, 500.0, 0.0).is_none());
            assert_eq!(health.health, 50.0);
        }
        let mut health = vitals();
        health.health = 50.0;
        health.absorb = 0.0;
        assert!(apply_damage(&mut health, &mut ShieldReservation::default(),
            &mut auras, &mut IncomingState::default(), 12.0, 500.0, 0.0).is_some());
        assert_eq!(health.health, -450.0);
    }
    #[test]
    fn depletion_removes_all_absorb_auras_before_lethal_health() {
        let mut health = vitals();
        let mut reservation = ShieldReservation {
            spell_id: 17,
            amount: 10.0,
            ..Default::default()
        };
        let mut auras = vec![Aura {
            source_guid: 0,
            effect: StatusEffect {
                tag: 7,
                value: 0.0,
                duration: 0.0,
            },
            spell_id: 17,
            expires_at: 5.0,
            healing_power: 0.0,
        }];
        let mut state = IncomingState::default();
        let result = apply_damage(
            &mut health,
            &mut reservation,
            &mut auras,
            &mut state,
            2.0,
            50.0,
            0.2,
        )
        .unwrap();
        assert_eq!(result.amount, 20.0);
        assert_eq!(health.health, -10.0);
        assert_eq!(result.completed_absorption, Some(20.0));
        assert!(auras.is_empty());
        assert_eq!(reservation, ShieldReservation::default());
    }
    #[test]
    fn soul_link_credit_matches_native_reservation_and_subset_order() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.105.0/run-meters/accounting/native-vectors.json"
        )).unwrap();
        assert_eq!(
            fixture["target_sha256"],
            "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
        );
        for case in fixture["cases"]["absorb_order"].as_array().unwrap() {
            let f = |key: &str| f32::from_bits(case[key].as_u64().unwrap() as u32);
            let mut health = vitals();
            health.health = 100.0;
            health.absorb = f("total_bits");
            let mut reservation = ShieldReservation {
                spell_id: case["reserved_spell"].as_u64().unwrap() as u32,
                amount: f("reserved_bits"),
                ..Default::default()
            };
            let mut state = IncomingState {
                soul_link_absorb: f("link_bits"),
                ..Default::default()
            };
            let actual = apply_damage(
                &mut health,
                &mut reservation,
                &mut Vec::new(),
                &mut state,
                1.0,
                f("incoming_bits"),
                0.0,
            )
            .unwrap();
            assert_eq!(
                actual.absorbed.to_bits(),
                case["absorbed_bits"].as_u64().unwrap() as u32
            );
            assert_eq!(
                actual.soul_link_absorbed.to_bits(),
                case["credit_bits"].as_u64().unwrap() as u32
            );
            assert_eq!(
                health.absorb.to_bits(),
                case["remaining_total_bits"].as_u64().unwrap() as u32
            );
            assert_eq!(
                state.soul_link_absorb.to_bits(),
                case["remaining_link_bits"].as_u64().unwrap() as u32
            );
            // The surrounding native owner clears reservations on total depletion.
            if health.absorb > 0.0 {
                assert_eq!(
                    reservation.spell_id,
                    case["remaining_reserved_spell"].as_u64().unwrap() as u32
                );
                assert_eq!(
                    reservation.amount.to_bits(),
                    case["remaining_reserved_bits"].as_u64().unwrap() as u32
                );
            }
            assert_eq!(
                health.health,
                100.0 - (f("incoming_bits") - actual.absorbed)
            );
        }
    }
    #[test]
    fn rescue_uses_shared_deadline_and_does_not_consume_stone() {
        let mut health = vitals();
        health.health = -4.0;
        let mut auras = Vec::new();
        let mut state = IncomingState::default();
        let protection = Some(LethalProtection {
            cooldown: 60.0,
            health_fraction: 0.25,
            invulnerability_seconds: 2.0,
        });
        assert_eq!(
            rescue_with_talent(protection, 1.0, &mut health, &mut auras, &mut state)
                .unwrap()
                .visual_spell,
            1856
        );
        assert_eq!(health.health, 25.0);
        assert_eq!(auras[0].expires_at, 3.0);
        assert!(
            rescue_with_talent(protection, 60.0, &mut health, &mut auras, &mut state).is_none()
        );
        assert!(
            rescue_with_talent(protection, 61.0, &mut health, &mut auras, &mut state).is_some()
        );
    }
}
