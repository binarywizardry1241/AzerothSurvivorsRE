//! Selected 0.105.0 meter accounting. The canonical actor hit owner supplies
//! damage capped to the victim's positive previous HP, before proc/death work.
//! Source resolution and optional attack labels belong to the admitted hit.

use std::collections::BTreeMap;

use crate::{
    bosses::death::{self, BossDeathState, BossMeterTiming},
    player_abilities::{AbilityDefinition, ABILITIES},
    run_effects::healing::{HealingMeter, MeterBreakdown, MeterSource},
};

/// Selected resolver1458f2ee0 searches learned definitions, then the current
/// racial, then the static catalog. Either primary or pulse ID identifies a
/// definition; a primary ID alone is not unique across the catalog.
pub fn source_definition(
    spell_id: u32,
    learned: impl IntoIterator<Item = &'static AbilityDefinition>,
    racial: Option<&'static AbilityDefinition>,
) -> Option<&'static AbilityDefinition> {
    if spell_id == 0 {
        return None;
    }
    let matches = |definition: &AbilityDefinition| {
        definition.spell_id == spell_id || definition.pulse_spell_id == spell_id
    };
    learned
        .into_iter()
        .find(|definition| matches(definition))
        .or_else(|| racial.filter(|definition| matches(definition)))
        .or_else(|| ABILITIES.iter().find(|definition| matches(definition)))
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum MeterMode {
    #[default]
    Damage,
    Healing,
    Boss,
    Party,
}

/// Captured native Game+140..168 attack attribution. Bit storage retains the
/// exact bonus while keeping deferred hit context Copy/Eq.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct CapturedAttack {
    pub primary: &'static str,
    pub secondary: Option<&'static str>,
    pub bonus_bits: u32,
    pub suppressed: bool,
}

impl CapturedAttack {
    pub fn single(primary: &'static str) -> Self {
        Self { primary, secondary: None, bonus_bits: 0, suppressed: false }
    }

    /// The 0.140.0 companion hit key uses the primary label, even when
    /// the accounting amount is split with a secondary attack.
    pub fn source_key(self) -> Option<String> {
        (!self.suppressed).then(|| {
            format!("demon:{}", self.primary.to_ascii_lowercase().replace(' ', "_"))
        })
    }

    pub fn components(self, kind: u8, amount: f64) -> Vec<MeterBreakdown> {
        captured_attack_breakdown(
            kind,
            self.suppressed,
            amount,
            self.primary,
            self.secondary,
            f32::from_bits(self.bonus_bits),
        )
    }
}

/// Native1458f27a0 inner split, after the caller admits sourcekind2 and its
/// suppression marker is not2. A secondary attack shares the admitted damage.
/// Its Option tests the pointer, so Some("") still splits the amount.
pub fn attack_breakdown(
    amount: f64,
    primary: &'static str,
    secondary: Option<&'static str>,
    bonus: f32,
) -> Vec<MeterBreakdown> {
    if let Some(secondary) = secondary.filter(|_| bonus > 0.0) {
        let bonus = f64::from(bonus);
        let fraction = bonus / (1.0 + bonus);
        vec![
            MeterBreakdown {
                name: primary,
                total: amount * (1.0 - fraction),
            },
            MeterBreakdown {
                name: secondary,
                total: amount * fraction,
            },
        ]
    } else {
        vec![MeterBreakdown {
            name: primary,
            total: amount,
        }]
    }
}

/// Full selected-target admission gate. The ordinary pet planner has no
/// recovered custom attack labels; special-demon producers may supply their
/// captured labels here without deriving them from a preceding log event.
pub fn captured_attack_breakdown(
    kind: u8,
    suppressed: bool,
    amount: f64,
    primary: &'static str,
    secondary: Option<&'static str>,
    bonus: f32,
) -> Vec<MeterBreakdown> {
    if kind != 2 || suppressed {
        Vec::new()
    } else {
        attack_breakdown(amount, primary, secondary, bonus)
    }
}

/// Current0.109.0 Game+708 effective total, per-spell map and two damage line sets.
/// Healing remains owned by the same shared generic-effect state as before.
#[derive(Debug, Default)]
pub struct DamageMeters {
    pub damage: HealingMeter,
    pub boss: HealingMeter,
    pub started_at: f32,
    pub total: f64,
    pub spell_totals: BTreeMap<u32, f64>,
}

#[derive(Clone, Copy)]
pub struct DamageShare {
    pub source: MeterSource,
    pub fraction: f32,
}

#[derive(Clone, Copy, Default)]
pub struct DamageShares {
    pub effect: Option<DamageShare>,
    pub howl: Option<DamageShare>,
}

fn record_damage(meter: &mut HealingMeter, source: MeterSource, effective: f32,
    breakdown: &[MeterBreakdown], shares: DamageShares) {
    let effective = f64::from(effective);
    // Native 145f1b866 separates Howl before applying the ordinary effect share.
    let howl_total = shares.howl.map_or(0.0, |share| effective * f64::from(share.fraction));
    let base_total = effective - howl_total;
    if let Some(share) = shares.effect {
        // 0.140.0 145f43e1e..145f43ea4 widens the fraction before splitting.
        let fraction = f64::from(share.fraction);
        meter.record_total(source, base_total * (1.0 - fraction), breakdown);
        meter.record_total(share.source, base_total * fraction, &[]);
    } else {
        meter.record_total(source, base_total, breakdown);
    }
    if let Some(share) = shares.howl.filter(|_| howl_total > 0.0) {
        meter.record_total(share.source, howl_total, &[MeterBreakdown {
            name: "Howl",
            total: howl_total,
        }]);
    }
}

impl DamageMeters {
    /// Current145971b66..145971b98 caps and widens the hit for the run total.
    /// The per-spell map shares that effective value; log suppression does not
    /// suppress these accounting writes.
    pub fn record(
        &mut self,
        source: MeterSource,
        spell_id: u32,
        effective: f32,
        breakdown: &[MeterBreakdown],
    ) {
        self.record_with_share(source, spell_id, effective, breakdown, None);
    }

    pub fn record_with_share(&mut self, source: MeterSource, spell_id: u32, effective: f32,
        breakdown: &[MeterBreakdown], share: Option<DamageShare>) {
        self.record_with_shares(source, spell_id, effective, breakdown, DamageShares {
            effect: share,
            howl: None,
        });
    }

    pub fn record_with_shares(&mut self, source: MeterSource, spell_id: u32, effective: f32,
        breakdown: &[MeterBreakdown], shares: DamageShares) {
        self.total += f64::from(effective);
        *self.spell_totals.entry(spell_id).or_default() += f64::from(effective);
        record_damage(&mut self.damage, source, effective, breakdown, shares);
    }

    /// Only the shared hit owner's primary-boss arm starts a segment. A hit
    /// after a stopped/empty segment clears the prior rows before insertion.
    pub fn record_boss(
        &mut self,
        death: &mut BossDeathState,
        now: f32,
        source: MeterSource,
        effective: f32,
        breakdown: &[MeterBreakdown],
    ) {
        self.record_boss_with_share(death, now, source, effective, breakdown, None);
    }

    pub fn record_boss_with_share(&mut self, death: &mut BossDeathState, now: f32,
        source: MeterSource, effective: f32, breakdown: &[MeterBreakdown], share: Option<DamageShare>) {
        self.record_boss_with_shares(death, now, source, effective, breakdown, DamageShares {
            effect: share,
            howl: None,
        });
    }

    pub fn record_boss_with_shares(&mut self, death: &mut BossDeathState, now: f32,
        source: MeterSource, effective: f32, breakdown: &[MeterBreakdown], shares: DamageShares) {
        death::begin_boss_meter(
            &mut death.clear_marker,
            &mut self.started_at,
            &mut self.boss.entries,
            now,
        );
        record_damage(&mut self.boss, source, effective, breakdown, shares);
    }

    pub fn boss_timing(&self, death: &BossDeathState, now: f32) -> Option<BossMeterTiming> {
        death::boss_meter_timing(
            death.clear_marker,
            self.started_at,
            death.clear_marked_at,
            now,
        )
    }
}

#[cfg(test)]
#[test]
fn shield_slam_health_share_splits_the_capped_amount_in_both_meters() {
    let spell = MeterSource { name: "Shield Slam", icon: "", talent: false };
    let set = MeterSource { name: "Heroism", icon: "", talent: true };
    let fraction = 0.045_f32;
    let share = Some(DamageShare { source: set, fraction });
    let mut meters = DamageMeters::default();
    let mut death = BossDeathState::default();
    meters.record_with_share(spell, 23922, 7.25, &[], share);
    meters.record_boss_with_share(&mut death, 4.0, spell, 7.25, &[], share);

    assert_eq!(meters.total, 7.25);
    assert_eq!(meters.spell_totals[&23922], 7.25);
    for rows in [&meters.damage.entries, &meters.boss.entries] {
        assert_eq!(rows.len(), 2);
        assert_eq!(rows[0].source, spell);
        assert_eq!(rows[0].total, 7.25 * (1.0 - f64::from(fraction)));
        assert_eq!(rows[1].source, set);
        assert_eq!(rows[1].total, 7.25 * f64::from(fraction));
    }
}

#[cfg(test)]
#[test]
fn packlord_howl_splits_the_effective_hit_before_other_meter_credit() {
    let shot = MeterSource { name: "Auto Shot", icon: "", talent: false };
    let wolf = MeterSource { name: "Wolf", icon: "Ability_Hunter_BeastTaming", talent: false };
    let effect = MeterSource { name: "Effect", icon: "", talent: true };
    let shares = DamageShares {
        howl: Some(DamageShare { source: wolf, fraction: 0.125 }),
        effect: Some(DamageShare { source: effect, fraction: 0.25 }),
    };
    let mut meters = DamageMeters::default();
    let mut death = BossDeathState::default();
    meters.record_with_shares(shot, 75, 8.0, &[], shares);
    meters.record_boss_with_shares(&mut death, 5.0, shot, 8.0, &[], shares);

    assert_eq!(meters.total, 8.0);
    assert_eq!(meters.spell_totals[&75], 8.0);
    for rows in [&meters.damage.entries, &meters.boss.entries] {
        assert_eq!(rows.iter().map(|row| row.total).sum::<f64>(), 8.0);
        assert_eq!((rows[0].source, rows[0].total), (shot, 5.25));
        assert_eq!((rows[1].source, rows[1].total), (effect, 1.75));
        assert_eq!((rows[2].source, rows[2].total), (wolf, 1.0));
        assert_eq!((rows[2].breakdown[0].name, rows[2].breakdown[0].total), ("Howl", 1.0));
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const SOURCE: MeterSource = MeterSource {
        name: "Shadow Bolt",
        icon: "Spell_Shadow_ShadowBolt",
        talent: false,
    };

    #[test]
    fn meter_definition_lookup_preserves_learned_racial_and_pulse_precedence() {
        let penance = AbilityDefinition::by_key("penance").unwrap();
        assert_eq!(
            source_definition(25912, [penance], None).unwrap().key,
            "penance"
        );
        assert_eq!(
            source_definition(25912, [], Some(penance)).unwrap().key,
            "penance"
        );
        assert_eq!(
            source_definition(25912, [], None).unwrap().key,
            "holy_shock"
        );
        assert_eq!(
            source_definition(8187, [], None).unwrap().key,
            "magma_totem"
        );
        assert_eq!(
            source_definition(3606, [], None).unwrap().key,
            "searing_totem"
        );
        assert!(source_definition(0, [penance], None).is_none());
    }

    fn native_vectors() -> serde_json::Value {
        let vectors: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.105.0/run-meters/accounting/native-vectors.json"
        ))
        .unwrap();
        assert_eq!(
            vectors["target_sha256"].as_str().unwrap(),
            "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
        );
        vectors
    }

    fn label(value: &serde_json::Value) -> &'static str {
        Box::leak(value.as_str().unwrap().to_owned().into_boxed_str())
    }

    #[test]
    fn current_native_record_snapshots_preserve_keys_icons_and_nested_amounts() {
        let vectors = native_vectors();
        let mut meter = HealingMeter::default();
        for case in vectors["cases"]["record"].as_array().unwrap() {
            let source = MeterSource {
                name: label(&case["name"]),
                icon: label(&case["icon"]),
                talent: case["talent"].as_bool().unwrap(),
            };
            let components = case["components"]
                .as_array()
                .unwrap()
                .iter()
                .map(|row| MeterBreakdown {
                    name: label(&row["name"]),
                    total: f64::from_bits(row["total_bits"].as_u64().unwrap()),
                })
                .collect::<Vec<_>>();
            meter.record_total(
                source,
                f64::from_bits(case["amount_bits"].as_u64().unwrap()),
                &components,
            );
            let expected = case["rows"].as_array().unwrap();
            assert_eq!(meter.entries.len(), expected.len());
            for (actual, expected) in meter.entries.iter().zip(expected) {
                assert_eq!(actual.source.name, expected["name"].as_str().unwrap());
                assert_eq!(actual.source.icon, expected["icon"].as_str().unwrap());
                assert_eq!(actual.source.talent, expected["talent"].as_bool().unwrap());
                assert_eq!(
                    actual.total.to_bits(),
                    expected["total_bits"].as_u64().unwrap()
                );
                let expected_breakdown = expected["breakdown"].as_array().unwrap();
                assert_eq!(actual.breakdown.len(), expected_breakdown.len());
                for (actual, expected) in actual.breakdown.iter().zip(expected_breakdown) {
                    assert_eq!(actual.name, expected["name"].as_str().unwrap());
                    assert_eq!(
                        actual.total.to_bits(),
                        expected["total_bits"].as_u64().unwrap()
                    );
                }
            }
        }
    }

    #[test]
    fn current_native_captured_attack_splits_match_instruction_vectors() {
        let vectors = native_vectors();
        for case in vectors["cases"]["breakdown"].as_array().unwrap() {
            let secondary = (!case["secondary"].is_null()).then(|| label(&case["secondary"]));
            let actual = captured_attack_breakdown(
                case["kind"].as_u64().unwrap() as u8,
                case["suppressed"].as_bool().unwrap(),
                f64::from_bits(case["amount_bits"].as_u64().unwrap()),
                label(&case["primary"]),
                secondary,
                f32::from_bits(case["bonus_bits"].as_u64().unwrap() as u32),
            );
            let expected = case["output"].as_array().unwrap();
            assert_eq!(actual.len(), expected.len(), "{}", case["name"]);
            for (actual, expected) in actual.iter().zip(expected) {
                assert_eq!(
                    actual.name,
                    expected["name"].as_str().unwrap(),
                    "{}",
                    case["name"]
                );
                assert_eq!(
                    actual.total.to_bits(),
                    expected["total_bits"].as_u64().unwrap(),
                    "{}",
                    case["name"]
                );
            }
        }
    }

    #[test]
    fn effective_totals_include_suppressed_melee_and_merge_spell_ids() {
        let mut meters = DamageMeters::default();
        meters.record(SOURCE, 686, 12.25, &[]);
        meters.record(SOURCE, 686, 3.5, &[]);
        meters.record(
            MeterSource {
                name: "Melee",
                ..SOURCE
            },
            0,
            1.0,
            &[],
        );
        assert_eq!(meters.total, 16.75);
        assert_eq!(meters.spell_totals.get(&686), Some(&15.75));
        assert_eq!(meters.spell_totals.get(&0), Some(&1.0));
    }

    #[test]
    fn same_name_and_proc_merge_but_keep_first_icon_and_attack_totals() {
        let mut meters = DamageMeters::default();
        meters.record(SOURCE, 686, 8.0, &attack_breakdown(8.0, "Bolt", None, 0.0));
        meters.record(
            MeterSource {
                icon: "Different",
                ..SOURCE
            },
            686,
            2.0,
            &attack_breakdown(2.0, "Bolt", None, 0.0),
        );
        meters.record(
            MeterSource {
                talent: true,
                ..SOURCE
            },
            686,
            4.0,
            &attack_breakdown(4.0, "Echo", None, 0.0),
        );
        let rows = &meters.damage.entries;
        assert_eq!(rows.len(), 2);
        assert_eq!(rows[0].total, 10.0);
        assert_eq!(rows[0].source.icon, SOURCE.icon);
        assert_eq!(rows[0].breakdown.len(), 1);
        assert_eq!(rows[0].breakdown[0].total, 10.0);
        assert_eq!(rows[1].total, 4.0);
    }

    #[test]
    fn overlapping_bosses_share_segment_and_next_fight_resets_only_boss_rows() {
        let mut meters = DamageMeters::default();
        let mut death = BossDeathState {
            boss_kills: 0,
            clear_marker: 2,
            clear_marked_at: 0.0,
        };
        assert_eq!(meters.boss_timing(&death, 9.0), None);
        meters.record(SOURCE, 686, 4.0, &[]);
        meters.record_boss(&mut death, 10.0, SOURCE, 4.0, &[]);
        meters.record_boss(&mut death, 11.0, SOURCE, 3.0, &[]);
        assert_eq!(meters.started_at, 10.0);
        assert_eq!(meters.boss.entries[0].total, 7.0);
        assert_eq!(meters.boss_timing(&death, 12.0).unwrap().seconds, 2.0);
        death.clear_marker = 1;
        death.clear_marked_at = 13.0;
        assert_eq!(meters.boss_timing(&death, 30.0).unwrap().seconds, 3.0);
        meters.record_boss(&mut death, 31.0, SOURCE, 2.0, &[]);
        assert_eq!(meters.started_at, 31.0);
        assert_eq!(meters.boss.entries[0].total, 2.0);
        assert_eq!(meters.damage.entries[0].total, 4.0);
    }

    #[test]
    fn secondary_attack_splits_the_effective_amount_without_extra_damage() {
        let rows = attack_breakdown(9.0, "Melee", Some("Cleave"), 0.5);
        assert_eq!(rows[0].total, 9.0 * (1.0 - 0.5_f64 / 1.5));
        assert_eq!(rows[1].total, 9.0 * (0.5_f64 / 1.5));
        assert_eq!(rows.iter().map(|row| row.total).sum::<f64>(), 9.0);
        assert_eq!(attack_breakdown(9.0, "Melee", Some("Cleave"), 0.0).len(), 1);
        assert_eq!(attack_breakdown(9.0, "", None, 0.0)[0].name, "");
        assert_eq!(
            attack_breakdown(9.0, "Melee", Some("Cleave"), f32::NAN).len(),
            1
        );
        assert_eq!(attack_breakdown(9.0, "Melee", Some(""), 0.5).len(), 2);
        assert_eq!(attack_breakdown(9.0, "Melee", None, 0.5).len(), 1);
    }

    #[test]
    fn zero_effective_damage_still_admits_a_damage_row() {
        let mut meters = DamageMeters::default();
        meters.record(SOURCE, 686, 0.0, &[]);
        assert_eq!(meters.damage.entries.len(), 1);
        assert_eq!(meters.damage.entries[0].total, 0.0);
        assert_eq!(meters.spell_totals.get(&686), Some(&0.0));
        let mut healing = HealingMeter::default();
        healing.record(SOURCE, 0.0);
        assert!(healing.entries.is_empty());
    }
}
