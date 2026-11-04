//! Current general healing1454a54c0: health, overheal conversion, pool and log gate.
use super::EffectRow;
use crate::player_abilities::{
    behavior::{min_preserving_original_nan, state::Vitals},
    native_max, native_min,
};

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct MeterSource {
    pub name: &'static str,
    pub icon: &'static str,
    pub talent: bool,
}
pub const LEECH: MeterSource = MeterSource {
    name: "Leech",
    icon: "Spell_Shadow_LifeDrain02",
    talent: false,
};
pub const REGENERATION: MeterSource = MeterSource {
    name: "Regeneration",
    icon: "Spell_Nature_Rejuvenation",
    talent: false,
};
/// Current145c17b17..145c17b6e supplies this explicit death-healing override.
pub const HEALING_ON_KILL: MeterSource = MeterSource {
    name: "Healing on Kill",
    icon: "Spell_Shadow_DeathPact",
    talent: false,
};
/// Selected1458f3517..3584, credited only when Soul Link's shield is consumed.
pub const SOUL_LINK: MeterSource = MeterSource {
    name: "Soul Link",
    icon: "Spell_Shadow_GatherShadows",
    talent: false,
};

/// 0.127.0 145c27310..2751e reads these lanes separately on each hit.
/// Keeping them separate preserves native f32 addition order when timed and
/// permanent stat14 contributions are present.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct LeechBase {
    pub class: f32,
    pub jewelry: f32,
}

impl LeechBase {
    pub fn total(self, temporary: &[(u8, f32)], permanent: &[(u8, f32)]) -> f32 {
        self.total_from(temporary.iter().copied(), permanent)
    }

    pub fn total_from(self, temporary: impl IntoIterator<Item = (u8, f32)>, permanent: &[(u8, f32)]) -> f32 {
        let sum = |rows: &[(u8, f32)]| rows.iter()
            .filter(|(tag, _)| *tag == 14)
            .fold(-0.0_f32, |total, (_, value)| total + value);
        let temporary = temporary.into_iter().filter(|(tag, _)| *tag == 14)
            .fold(-0.0_f32, |total, (_, value)| total + value);
        ((temporary + self.class) + sum(permanent)) + self.jewelry
    }
}
#[derive(Clone, Debug, PartialEq)]
pub struct MeterBreakdown {
    pub name: &'static str,
    pub total: f64,
}
#[derive(Clone, Debug, PartialEq)]
pub struct MeterEntry {
    pub source: MeterSource,
    pub total: f64,
    pub breakdown: Vec<MeterBreakdown>,
}
#[derive(Debug, Default)]
pub struct HealingMeter {
    pub entries: Vec<MeterEntry>,
}
impl HealingMeter {
    ///1454a53bc/1455021b0: skip ordered nonpositive amounts, widen once to f64.
    pub fn record(&mut self, source: MeterSource, actual: f32) {
        self.record_with_breakdown(source, actual, &[]);
    }

    /// Selected 0.105.0 owner14595f3c0 keys rows by name and proc flag. The
    /// icon belongs to the first admitted row; it does not split later totals.
    /// The caller supplies the recovered attack label, when one exists.
    pub fn record_with_breakdown(
        &mut self,
        source: MeterSource,
        actual: f32,
        breakdown: &[MeterBreakdown],
    ) {
        if actual <= 0.0 {
            return;
        }
        self.record_total(source, f64::from(actual), breakdown);
    }

    /// The shared native record owner adds every supplied amount, including a
    /// zero-damage row. Effective healing applies its gate before calling it.
    pub fn record_total(
        &mut self,
        source: MeterSource,
        actual: f64,
        breakdown: &[MeterBreakdown],
    ) {
        let index = if let Some(index) = self.entries.iter().position(|entry| {
            entry.source.name == source.name && entry.source.talent == source.talent
        }) {
            index
        } else {
            self.entries.push(MeterEntry {
                source,
                total: 0.0,
                breakdown: Vec::new(),
            });
            self.entries.len() - 1
        };
        let entry = &mut self.entries[index];
        entry.total += actual;
        for contribution in breakdown {
            if let Some(row) = entry.breakdown.iter_mut().find(|row| row.name == contribution.name) {
                row.total += contribution.total;
            } else {
                entry.breakdown.push(contribution.clone());
            }
        }
    }
}

/// Native1454a0520 precedence, revalidated against selected0.105.0 resolver
///1458f2ee0. The live hit adapter supplies a captured icon-bearing pet override;
/// absent that descriptor, kind2 retains this exact Pets fallback.
/// Callers supply actual effect provenance and learned/catalog identity.
pub fn meter_source(
    kind: u8,
    source_words: [u32; 4],
    cast_words: [u32; 4],
    effect: Option<usize>,
    provenance: &[MeterSource],
    spell_id: u32,
    definition: Option<&crate::player_abilities::AbilityDefinition>,
) -> MeterSource {
    if kind == 2 {
        return MeterSource {
            name: "Pets",
            icon: "Ability_Hunter_BeastCall",
            talent: false,
        };
    }
    let index = meter_effect_index(kind, source_words, cast_words, effect);
    if let Some(source) = index.and_then(|index| provenance.get(index)) {
        return *source;
    }
    if spell_id != 0 {
        if let Some(definition) = definition {
            return MeterSource {
                name: definition.name,
                icon: definition.icon,
                talent: false,
            };
        }
        if spell_id == 15237 {
            return MeterSource {
                name: "Soulstone",
                icon: "Spell_Holy_HolyNova",
                talent: false,
            };
        }
        if spell_id == 467 && kind == 3 {
            return MeterSource {
                name: "Thorns",
                icon: "Spell_Nature_Thorns",
                talent: true,
            };
        }
    }
    if kind == 3 {
        MeterSource {
            name: "Talents",
            icon: "Ability_Marksmanship",
            talent: true,
        }
    } else if spell_id == 0 {
        MeterSource {
            name: "Melee",
            icon: "INV_Sword_04",
            talent: false,
        }
    } else {
        MeterSource {
            name: "Other",
            icon: "INV_Misc_QuestionMark",
            talent: false,
        }
    }
}

pub fn meter_effect_index(
    kind: u8,
    source_words: [u32; 4],
    cast_words: [u32; 4],
    effect: Option<usize>,
) -> Option<usize> {
    let pair = |words: [u32; 4], at: usize| u64::from(words[at]) | (u64::from(words[at + 1]) << 32);
    match kind {
        2 => None,
        3 => (pair(source_words, 0) == 1).then(|| pair(source_words, 2) as usize),
        _ if effect.is_some() || pair(cast_words, 0) != 0 => {
            effect.or_else(|| Some(pair(cast_words, 2) as usize))
        }
        1 if pair(source_words, 0) == 1 => Some(pair(source_words, 2) as usize),
        _ => None,
    }
}

#[derive(Clone, Copy, Debug, Default)]
pub struct HealingState {
    /// Game+120, accumulated only while a variant21 row is equipped.
    pub pool: f32,
    /// Game+124, one-second publication deadline for the first variant21.
    pub ready_at: f32,
    /// Current Game+0x2a3 prevents Seed of Life hits from feeding Tranquility.
    pub seed_impact: bool,
}
#[derive(Clone, Copy, Debug)]
pub struct HealingPulse {
    pub effect_index: usize,
    pub radius: f32,
    pub power: f32,
    pub visual_spell: u32,
}
impl HealingState {
    /// Native1454b110c..13b6 consumes its pool before the radius query, even
    /// when no victim exists. Unordered clock/pool comparisons pass the gates.
    pub fn take_pulse(&mut self, rows: &[EffectRow], now: f32) -> Option<HealingPulse> {
        let (effect_index, row) = rows.iter().enumerate().find(|(_, row)| row.tag() == 21)?;
        if self.ready_at > now || self.pool < 1.0 {
            return None;
        }
        let power = row.float(4) * self.pool;
        self.pool = 0.0;
        self.ready_at = now + 1.0;
        Some(HealingPulse {
            effect_index,
            radius: row.float(8),
            power,
            visual_spell: row.word(12),
        })
    }
}
#[derive(Clone, Copy, Debug)]
pub struct HealingResult {
    pub actual: f32,
    pub overheal: f32,
    pub emit_log: bool,
    pub log_amount: u32,
    pub fields: [(u16, u32); 2],
}
#[derive(Clone, Debug)]
pub struct BatchHealingResult {
    pub actual: f32,
    pub regeneration: f32,
    /// Native8-byte input rows retain their order, including duplicate spells.
    pub credits: Vec<(u32, f32)>,
    pub fields: Option<[(u16, u32); 2]>,
}

/// Current145bcb438..145bcb487 admits gear/set tag13 after three seconds
/// without a landed hit. The ordinary flat regeneration remains unconditional.
pub fn regeneration_amount(flat: f32, calm_fraction: f32, maximum_health: f32,
    now: f32, last_hit_at: f32, elapsed: f32) -> f32 {
    let calm = if now - last_hit_at >= 3.0 { calm_fraction * maximum_health } else { 0.0 };
    (calm + flat) * elapsed
}

/// Current game-tick1454af9ee..4aff01 combines regeneration and player HoTs
/// before one HP clamp. Regeneration has first claim on effective healing;
/// remaining healing is distributed proportionally in original aura order.
pub fn apply_batch(
    vitals: &mut Vitals,
    rows: &[EffectRow],
    state: &mut HealingState,
    regeneration: f32,
    queued: &[(u32, f32)],
) -> BatchHealingResult {
    apply_batch_for_rank(vitals, rows, state, regeneration, queued, 0)
}

/// Current 0.121.0 scales regeneration and the accumulated HoT amount before
/// their shared clamp. Per-spell credit retains each original queued amount.
pub fn apply_batch_for_rank(
    vitals: &mut Vitals, rows: &[EffectRow], state: &mut HealingState,
    regeneration: f32, queued: &[(u32, f32)], heroic_rank: u8,
) -> BatchHealingResult {
    let multiplier = crate::heroic::healing_factor(heroic_rank);
    let regeneration = regeneration * multiplier;
    let total = queued.iter().fold(0.0, |sum, (_, amount)| sum + amount) * multiplier;
    let before = vitals.health;
    let updated = vitals.maximum_health > before;
    if updated {
        vitals.health =
            min_preserving_original_nan((before + regeneration) + total, vitals.maximum_health);
    }
    let actual = vitals.health - before;
    let regenerated = regeneration.min(native_max(actual, 0.0));
    let mut credits = Vec::new();
    if total > 0.0 {
        let effective = native_min(
            total,
            native_max(0.0, (vitals.health - before) - regeneration),
        );
        for &(spell_id, amount) in queued {
            let credited = (amount * effective) / total;
            if !(credited <= 0.0) {
                credits.push((spell_id, credited));
            }
        }
        credit_healing(vitals, rows, state, effective, total - effective);
    }
    BatchHealingResult {
        actual,
        regeneration: regenerated,
        credits,
        fields: updated.then(|| vital_fields(vitals)),
    }
}
/// Anonymous heals still update health/meter and fields. Only nonzero-spell
/// calls process variants20/21 and can emit the native spell-heal packet.
pub fn apply(
    vitals: &mut Vitals,
    rows: &[EffectRow],
    state: &mut HealingState,
    requested: f32,
    spell_id: u32,
) -> HealingResult {
    let before = vitals.health;
    vitals.health = min_preserving_original_nan(before + requested, vitals.maximum_health);
    let actual = vitals.health - before;
    let overheal = native_max(requested - actual, 0.0);
    if spell_id != 0 {
        credit_healing(vitals, rows, state, native_max(actual, 0.0), overheal);
    }
    HealingResult {
        actual,
        overheal,
        emit_log: spell_id != 0 && actual >= 1.0,
        log_amount: actual as u32,
        fields: vital_fields(vitals),
    }
}
/// 0.140.0 145f9d163 and 145f8d1b5. Lost overheal does not enter the
/// pool. Tree of Life still absorbs normally during Seed of Life impacts.
fn credit_healing(
    vitals: &mut Vitals,
    rows: &[EffectRow],
    state: &mut HealingState,
    actual: f32,
    excess: f32,
) {
    let before = vitals.absorb;
    let mut added = 0.0;
    if excess > 0.0 {
        if let Some(row) = rows.iter().find(|row| row.tag() == 20) {
            let cap = row.float(4) * vitals.maximum_health;
            if cap > before {
                vitals.absorb = min_preserving_original_nan(before + excess, cap);
                added = vitals.absorb - before;
            }
        }
    }
    let credited = actual + added;
    if credited > 0.0 && !state.seed_impact && rows.iter().any(|row| row.tag() == 21) {
        state.pool += credited;
    }
}
pub fn vital_fields(vitals: &Vitals) -> [(u16, u32); 2] {
    [
        (22, native_max(vitals.health, 0.0).ceil() as u32),
        (28, vitals.maximum_health.ceil() as u32),
    ]
}
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn mage_leech_keeps_timed_class_permanent_and_jewelry_rounding_order() {
        let mage = super::super::catalog().classes.iter().find(|class| class.id == 8).unwrap();
        assert_eq!(mage.leech_bits, 0x3ba3d70a);
        let base = LeechBase { class: f32::from_bits(mage.leech_bits), jewelry: 0.01 };
        let actual = base.total(&[(14, 0.001), (5, 10.0)], &[(14, 0.001)]);
        assert_eq!(actual.to_bits(), 0x3c8b4396);
        let old_grouping = (base.class + base.jewelry) + (0.001_f32 + 0.001);
        assert_eq!(old_grouping.to_bits(), 0x3c8b4395);
        assert_eq!(base.total(&[], &[]), base.class + base.jewelry);
    }
    #[test]
    fn current_native_frame_batch_healing_vectors_match() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.100.1/run-effects/healing-native.json"
        ))
        .unwrap();
        let eq = |value: f32, expected: &serde_json::Value| {
            let bits = expected.as_u64().unwrap() as u32;
            value.to_bits() == bits || value.is_nan() && f32::from_bits(bits).is_nan()
        };
        for case in fixture["batches"].as_array().unwrap() {
            let f = |key: &str| f32::from_bits(case[key].as_u64().unwrap() as u32);
            let mut vitals = Vitals {
                health: f("health_bits"),
                maximum_health: 100.0,
                absorb: 3.0,
                absorb_applied_at: 0.0,
                absorb_same_tick_count: 0,
            };
            let mut state = HealingState {
                pool: 7.0,
                ready_at: 0.0,
                ..Default::default()
            };
            let rows = case["rows"]
                .as_array()
                .unwrap()
                .iter()
                .map(|row| {
                    let mut bytes = [0; 64];
                    bytes[0] = row["tag"].as_u64().unwrap() as u8;
                    bytes[4..8].copy_from_slice(
                        &(row["value_bits"].as_u64().unwrap() as u32).to_le_bytes(),
                    );
                    EffectRow {
                        bytes,
                        strings: &[],
                        lists: &[],
                    }
                })
                .collect::<Vec<_>>();
            let queued = case["queued"]
                .as_array()
                .unwrap()
                .iter()
                .map(|row| {
                    (
                        row["spell_id"].as_u64().unwrap() as u32,
                        f32::from_bits(row["amount_bits"].as_u64().unwrap() as u32),
                    )
                })
                .collect::<Vec<_>>();
            let result = apply_batch(
                &mut vitals,
                &rows,
                &mut state,
                f("regeneration_bits"),
                &queued,
            );
            let expected = &case["expected"];
            for (key, value) in [
                ("health_bits", vitals.health),
                ("absorb_bits", vitals.absorb),
                ("regeneration_bits", result.regeneration),
            ] {
                assert!(eq(value, &expected[key]), "{key} {value:?}; {case}");
            }
            assert_eq!(
                result.fields.is_some(),
                expected["updated"].as_bool().unwrap(),
                "{case}"
            );
            assert_eq!(
                result.credits.len(),
                expected["credits"].as_array().unwrap().len(),
                "{case}"
            );
            for ((spell_id, amount), expected) in result
                .credits
                .iter()
                .zip(expected["credits"].as_array().unwrap())
            {
                assert_eq!(
                    *spell_id,
                    expected["spell_id"].as_u64().unwrap() as u32,
                    "{case}"
                );
                assert!(eq(*amount, &expected["amount_bits"]), "{case}");
            }
        }
    }
    #[test]
    fn current_native_healing_overheal_and_pool_vectors_match() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.100.1/run-effects/healing-native.json"
        ))
        .unwrap();
        assert_eq!(fixture["target_sha256"], super::super::TARGET_SHA256);
        for case in fixture["cases"].as_array().unwrap() {
            let f = |key: &str| f32::from_bits(case[key].as_u64().unwrap() as u32);
            let mut vitals = Vitals {
                health: f("health_bits"),
                maximum_health: f("maximum_bits"),
                absorb: f("absorb_bits"),
                absorb_applied_at: 0.0,
                absorb_same_tick_count: 0,
            };
            let mut state = HealingState {
                pool: f("pool_bits"),
                ready_at: 0.0,
                ..Default::default()
            };
            let rows = case["rows"]
                .as_array()
                .unwrap()
                .iter()
                .map(|row| {
                    let mut bytes = [0; 64];
                    bytes[0] = row["tag"].as_u64().unwrap() as u8;
                    bytes[4..8].copy_from_slice(
                        &(row["value_bits"].as_u64().unwrap() as u32).to_le_bytes(),
                    );
                    EffectRow {
                        bytes,
                        strings: &[],
                        lists: &[],
                    }
                })
                .collect::<Vec<_>>();
            let result = apply(
                &mut vitals,
                &rows,
                &mut state,
                f("requested_bits"),
                case["spell_id"].as_u64().unwrap() as u32,
            );
            for (name, value) in [
                ("health_bits", vitals.health),
                ("actual_bits", result.actual),
                ("absorb_bits", vitals.absorb),
            ] {
                let expected = case["expected"][name].as_u64().unwrap() as u32;
                assert!(
                    value.to_bits() == expected
                        || value.is_nan() && f32::from_bits(expected).is_nan(),
                    "{name}: {value:?} != {expected:#x}; {case}"
                );
            }
            assert_eq!(
                result.emit_log,
                case["expected"]["emit_log"].as_bool().unwrap(),
                "{case}"
            );
            if result.emit_log {
                assert_eq!(
                    result.log_amount,
                    case["expected"]["log_amount"].as_u64().unwrap() as u32,
                    "{case}"
                );
            }
        }
    }
    #[test]
    fn tranquility_counts_effective_health_and_only_the_shield_delta() {
        let row = |tag, value: f32| {
            let mut bytes = [0; 64];
            bytes[0] = tag;
            bytes[4..8].copy_from_slice(&value.to_le_bytes());
            EffectRow { bytes, strings: &[], lists: &[] }
        };
        let rows = [row(20, 0.1), row(21, 1.0)];
        let start = Vitals {
            health: 95.0,
            maximum_health: 100.0,
            absorb: 8.0,
            absorb_applied_at: 0.0,
            absorb_same_tick_count: 0,
        };
        for seed_impact in [false, true] {
            let mut state = HealingState { seed_impact, ..Default::default() };
            let mut vitals = start.clone();
            apply(&mut vitals, &rows, &mut state, 20.0, 774);
            assert_eq!(vitals.absorb, 10.0);
            assert_eq!(state.pool, if seed_impact { 0.0 } else { 7.0 });
            apply(&mut vitals, &rows, &mut state, 20.0, 774);
            assert_eq!(state.pool, if seed_impact { 0.0 } else { 7.0 });

            let mut state = HealingState { seed_impact, ..Default::default() };
            let mut vitals = start.clone();
            apply_batch(&mut vitals, &rows, &mut state, 3.0, &[(774, 20.0)]);
            assert_eq!(vitals.absorb, 10.0);
            assert_eq!(state.pool, if seed_impact { 0.0 } else { 4.0 });
        }
    }

    #[test]
    fn current_native_healing_pool_pulse_gates_match() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.100.1/run-effects/healing-native.json"
        ))
        .unwrap();
        for case in fixture["pulses"].as_array().unwrap() {
            let f = |key: &str| f32::from_bits(case[key].as_u64().unwrap() as u32);
            let mut state = HealingState {
                pool: f("pool_bits"),
                ready_at: f("deadline_bits"),
                ..Default::default()
            };
            let rows = case["rows"]
                .as_array()
                .unwrap()
                .iter()
                .map(|row| {
                    let mut bytes = [0; 64];
                    bytes[0] = row["tag"].as_u64().unwrap() as u8;
                    for (at, key) in [(4, "strength_bits"), (8, "radius_bits"), (12, "visual")] {
                        bytes[at..at + 4]
                            .copy_from_slice(&(row[key].as_u64().unwrap() as u32).to_le_bytes());
                    }
                    EffectRow {
                        bytes,
                        strings: &[],
                        lists: &[],
                    }
                })
                .collect::<Vec<_>>();
            let action = state.take_pulse(&rows, f("clock_bits"));
            let expected = &case["expected"];
            let eq = |value: f32, bits: u32| {
                value.to_bits() == bits || value.is_nan() && f32::from_bits(bits).is_nan()
            };
            assert!(
                eq(state.pool, expected["pool_bits"].as_u64().unwrap() as u32),
                "{case}"
            );
            assert!(
                eq(
                    state.ready_at,
                    expected["deadline_bits"].as_u64().unwrap() as u32
                ),
                "{case}"
            );
            match action {
                None => assert!(expected["action"].is_null(), "{case}"),
                Some(action) => {
                    let expected = &expected["action"];
                    assert_eq!(
                        action.effect_index,
                        expected["index"].as_u64().unwrap() as usize,
                        "{case}"
                    );
                    assert_eq!(
                        action.visual_spell,
                        expected["visual"].as_u64().unwrap() as u32,
                        "{case}"
                    );
                    assert!(
                        eq(
                            action.radius,
                            expected["radius_bits"].as_u64().unwrap() as u32
                        ),
                        "{case}"
                    );
                    assert!(
                        eq(
                            action.power,
                            expected["power_bits"].as_u64().unwrap() as u32
                        ),
                        "{case}"
                    );
                }
            }
        }
    }
}
