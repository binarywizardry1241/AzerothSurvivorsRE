//! 0.97.2 learned rarity, upgrade magnitudes, eligibility and apply order.
//! Native owners and all table locations: player-abilities-0.97.2.md.
//! Magnitude and learned-rarity paths are additionally revalidated in0.100.1;
//! other addresses below retain their explicitly historical0.97.2 provenance.

use super::{RuntimeInstance, catalog::AbilityDefinition, damage, native_max, native_min};

/// Current 0.112.0 ordinary upgrade tags. The descriptor slices, eligibility
/// collector and magnitude/prose consumers use these five lanes. See
/// `docs/analysis/choice-contracts-0.112.0.md`; removed Empowerment haste has no
/// ordinary upgrade tag in this target.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
#[repr(u8)]
pub enum UpgradeKind {
    Power = 0,
    Cooldown = 1,
    Targets = 2,
    Area = 3,
    Duration = 4,
}

impl UpgradeKind {
    pub fn from_tag(tag: u8) -> Option<Self> {
        Some(match tag {
            0 => Self::Power,
            1 => Self::Cooldown,
            2 => Self::Targets,
            3 => Self::Area,
            4 => Self::Duration,
            _ => return None,
        })
    }
}

const POWER: [f32; 5] = [0.18, 0.25, 0.34, 0.46, 0.65];
const COOLDOWN: [f32; 5] = [0.07, 0.10, 0.13, 0.17, 0.23];
const TARGETS: [u32; 5] = [1, 1, 1, 2, 2];
const AREA: [f32; 5] = [0.12, 0.18, 0.25, 0.35, 0.5];
const DURATION: [f32; 5] = [0.15, 0.22, 0.3, 0.4, 0.6];

/// Current0.100.1 0x14550c1f0. `rarity_index` is the upgrade table index0..4, not the
/// learned-rarity tag below. Out-of-domain indices panic as the original does.
pub fn magnitude(instance: &RuntimeInstance<'_>, kind: UpgradeKind, rarity_index: usize) -> f32 {
    assert!(rarity_index < 5);
    match kind {
        UpgradeKind::Power => {
            POWER[rarity_index] / (1.0 + instance.upgrade_counts[kind as usize] as f32 * 0.5)
        }
        UpgradeKind::Cooldown => {
            native_max((instance.cooldown_multiplier + -0.2) / 0.8, 0.0) * COOLDOWN[rarity_index]
        }
        UpgradeKind::Targets => {
            // 0.141.0 gives Soulfire the ordinary twelve-target upgrade budget.
            let cap: u32 = if instance.definition.kind != 11 || instance.definition.key == "soul_fire" {
                12
            } else if matches!(
                instance.definition.key,
                "seal_fate" | "lightwell" | "faerie_fire"
            ) {
                2
            } else {
                0
            };
            cap.saturating_sub(instance.target_bonus)
                .min(TARGETS[rarity_index]) as f32
        }
        UpgradeKind::Area => {
            native_max((5.0 - instance.area_multiplier) * 0.25, 0.0) * AREA[rarity_index]
        }
        UpgradeKind::Duration => {
            native_max((6.0 - instance.duration_multiplier) / 5.0, 0.0) * DURATION[rarity_index]
        }
    }
}

/// Native definition-level applicability 0x14540da00; the permitted type slice
/// is additionally respected by `eligible_types` below.
pub fn supports(definition: &AbilityDefinition, kind: UpgradeKind) -> bool {
    if definition.key == "demonic_empowerment" {
        return definition.upgrade_types.contains(&(kind as u8));
    }
    if definition.kind == 11 {
        return definition.upgrade_types.contains(&(kind as u8))
            && (kind != UpgradeKind::Targets || definition.targets != 0);
    }
    let buff_overlap = definition.kind == 9 && matches!(definition.effect.tag, 8 | 9 | 12);
    match kind {
        UpgradeKind::Power => {
            if definition.kind == 9 {
                matches!(definition.effect.tag, 6 | 7 | 12)
            } else {
                definition.base_power > 0.0
            }
        }
        UpgradeKind::Cooldown => !buff_overlap || definition.duration < definition.base_cooldown,
        UpgradeKind::Targets => {
            definition.targets != 0
                && match definition.kind {
                    0 | 1 | 4 | 5 | 6 | 7 => true,
                    2 | 3 | 8 | 9 => false,
                    _ => definition.radius <= 0.0,
                }
        }
        UpgradeKind::Area => {
            matches!(definition.kind, 2 | 3 | 4 | 8)
                || (definition.kind == 10 && definition.radius > 0.0)
        }
        UpgradeKind::Duration => match definition.kind {
            3 | 6 | 10 => true,
            9 => {
                definition.duration > 0.0
                    && !matches!(definition.effect.tag, 6 | 7)
                    && (!buff_overlap || definition.duration < definition.base_cooldown)
            }
            _ => false,
        },
    }
}

/// Native class-passive cooldown eligibility0x14541b790 / minimum0x14541b8b0.
fn passive_cooldown_available(instance: &RuntimeInstance<'_>, global_multiplier: f32) -> bool {
    let interval = damage::base_interval(instance, global_multiplier);
    match instance.definition.key {
        "faerie_fire" => false,
        "redemption" => {
            let value = (instance.definition.base_cooldown * 0.1) * 1.4 / interval;
            let value = native_min(value, 0.2) * instance.effect_multiplier;
            f32::from_bits(0x3e4ac083) > value // .198
        }
        key => {
            interval > passive_minimum_interval(key) * f32::from_bits(0x3f8147ae) //1.01
        }
    }
}

/// Native14541b8b0, shared by upgrade gates and class-special proc scheduling.
pub fn passive_minimum_interval(key: &str) -> f32 {
    match key {
        "bloodrage" => 8.0,
        "hunters_mark" | "seal_fate" => 2.0,
        "soul_fire" | "polymorph" => 3.0,
        "lightwell" => 6.0,
        "call_of_flame" => 1.5,
        _ => 0.0,
    }
}

/// Ordered native iterator0x145472190, collected by0x1455292b0. The menu offer
/// builder first probes index4. The index is also the native targets gate:
/// targets are excluded at index0, even though their magnitude table contains1.
/// Current 0.112.0 Empowerment kinds1/4, uptime and magnitude boundaries are
/// independently checked against iterator145896530 and supports1458967f0.
pub fn eligible_types(
    instance: &RuntimeInstance<'_>,
    global_multiplier: f32,
    rarity_index: usize,
) -> Vec<UpgradeKind> {
    assert!(rarity_index < 5);
    instance
        .definition
        .upgrade_types
        .iter()
        .filter_map(|tag| UpgradeKind::from_tag(*tag))
        .filter(|kind| {
            if !supports(instance.definition, *kind) {
                return false;
            }
            if matches!(kind, UpgradeKind::Cooldown | UpgradeKind::Duration)
                && instance.definition.kind == 9
                && (matches!(instance.definition.effect.tag, 8 | 9 | 12)
                    || instance.definition.key == "demonic_empowerment")
                && damage::scaled_duration(instance)
                    >= damage::base_interval(instance, global_multiplier)
            {
                return false;
            }
            if *kind == UpgradeKind::Targets && rarity_index == 0 {
                return false;
            }
            if *kind == UpgradeKind::Cooldown
                && instance.definition.kind == 11
                && !passive_cooldown_available(instance, global_multiplier)
            {
                return false;
            }
            magnitude(instance, *kind, rarity_index) >= f32::from_bits(0x3ba3d70a) //.005
        })
        .collect()
}

/// Apply one selected upgrade0x1454e4aac..0x1454e4b63. The native apply path
/// trusts the offered selection. Bundles call this in order, without resetting
/// the running cooldown. Each kind also grants the shared rank-power growth.
/// Current Empowerment's ordinary kinds1/4 follow accept1459673e9..1459674fa.
pub fn apply(instance: &mut RuntimeInstance<'_>, kind: UpgradeKind, rarity_index: usize) -> f32 {
    instance.rank = instance.rank.wrapping_add(1);
    let increment = magnitude(instance, kind, rarity_index);
    match kind {
        UpgradeKind::Power => instance.power_multiplier *= 1.0 + increment,
        UpgradeKind::Cooldown => instance.cooldown_multiplier -= increment,
        UpgradeKind::Targets => {
            instance.target_bonus = instance.target_bonus.wrapping_add(increment as u32)
        }
        UpgradeKind::Area => instance.area_multiplier += increment,
        UpgradeKind::Duration => instance.duration_multiplier += increment,
    }
    instance.upgrade_counts[kind as usize] = instance.upgrade_counts[kind as usize].wrapping_add(1);
    let levels = instance.rank.saturating_sub(2) as f32;
    instance.power_multiplier *= 1.0 + 0.04 / (1.0 + levels * 0.125);
    increment
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum LearnedBonus {
    None,
    Power(f32),
    Cooldown(f32),
}

/// Current0.100.1 0x145420e20. Learned-rarity tag0 has no bonus; tags1..5 index the
/// five tables with tag-1. This tag domain differs from upgrade rarity0..4.
pub fn apply_learned_rarity(instance: &mut RuntimeInstance<'_>, rarity_tag: usize) -> LearnedBonus {
    if rarity_tag == 0 {
        return LearnedBonus::None;
    }
    assert!(rarity_tag <= 5);
    let definition = instance.definition;
    let power = match definition.kind {
        9 => matches!(definition.effect.tag, 6 | 7 | 12),
        11 => definition.upgrade_types.contains(&0),
        _ => definition.base_power > 0.0,
    };
    if power {
        let value = POWER[rarity_tag - 1];
        instance.power_multiplier *= 1.0 + value;
        LearnedBonus::Power(value)
    } else {
        let value = COOLDOWN[rarity_tag - 1];
        instance.cooldown_multiplier *= 1.0 - value;
        LearnedBonus::Cooldown(value)
    }
}
