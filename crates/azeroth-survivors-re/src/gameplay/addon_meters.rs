//! Addon meter wire projection, revalidated against0.109.0.
//!
//! Native owners1459a79a0/145919820 sort existing accounting rows, preserve
//! their proc identity and publish rounded damage, one-decimal rate and a
//! four-decimal share. Accounting stays with the shared combat/healing owners.

use azeroth_survivors_re::{
    player_abilities::{ABILITIES, CLASSES},
    loot_rewards::amulets,
    run_effects::healing::{MeterEntry, MeterSource},
};
use std::collections::BTreeMap;

use super::mechanics::Mechanics;
use crate::localization::Localization;

/// Native Game+6d0's ordered category map. Keep category keys until wire
/// publication: the serializer sorts by accumulated damage, not the key.
#[derive(Debug, Default)]
pub(super) struct TakenLedger {
    pub categories: BTreeMap<&'static str, f64>,
    pub total: f64,
}

impl TakenLedger {
    pub(super) fn record(&mut self, category: &'static str, amount: f32) {
        let amount = f64::from(amount);
        self.total += amount;
        *self.categories.entry(category).or_default() += amount;
    }
}

impl Mechanics {
    /// AZSMETER, AZSHEAL, AZSBOSSDMG and AZSTAKEN, in native prefix order.
    pub fn addon_meter_lines(&self, locale: &Localization) -> [String; 4] {
        let boss = self.boss_meter_timing().map_or_else(String::new, |timing| {
            meter_line(self.boss_meter(), timing.seconds, |source| {
                source_name(source, locale)
            })
        });
        [
            meter_line(self.damage_meter(), self.clock, |source| {
                source_name(source, locale)
            }),
            meter_line(self.healing_meter(), self.clock, |source| {
                source_name(source, locale)
            }),
            boss,
            taken_line(self.damage_taken()),
        ]
    }

    pub fn total_healing(&self) -> f64 {
        self.healing_meter().iter().map(|row| row.total).sum()
    }
}

/// Native1458f2ee0 resolves localized identity before aggregation; its wire
/// serializer receives the resulting name unchanged. Source accounting keeps
/// static semantic descriptors, so project them here through the same keys.
pub(super) fn source_name(source: MeterSource, locale: &Localization) -> String {
    // These are literal fallback arms in the native resolver, without a
    // translation lookup. Thorns here is the provenance-free spell467 arm.
    if matches!(
        source.name,
        "Pets" | "Melee" | "Other" | "Talents" | "Thorns" | "Soulstone"
    ) {
        return source.name.to_owned();
    }
    if !source.talent {
        if let Some(ability) = ABILITIES
            .iter()
            .find(|ability| ability.name == source.name && ability.icon == source.icon)
        {
            let key = format!("ability.{}.name", ability.key);
            let translated = locale.label(&key);
            return if translated == key {
                source.name
            } else {
                translated
            }
            .to_owned();
        }
    }
    // Current native provenance already contains the constructor's localized
    // name. Source accounting retains the stable English name/icon identity.
    if source.talent {
        if let Some(class) = CLASSES.iter().find(|class| {
            azeroth_survivors_re::tier05::class(class.class_id)
                .is_some_and(|set| set.name == source.name)
        }) {
            let key = format!("set.{}.{}", class.key, azeroth_survivors_re::sets::TIER_HALF);
            return locale.lookup(&key).unwrap_or(source.name).to_owned();
        }
        if let Some(amulet) = amulets::catalog().generated.iter()
            .find(|row| row.name == source.name && row.icon == source.icon)
        {
            return locale.amulet_name(&amulet.name, amulet.ability_key.as_deref());
        }
    }
    // Other talent provenance, named pets, Leech and Regeneration use their
    // actual literal label as the native translation key.
    locale.label(source.name).to_owned()
}

fn meter_line(
    entries: &[MeterEntry],
    seconds: f32,
    label: impl Fn(MeterSource) -> String,
) -> String {
    meter_totals(
        entries.iter().map(|entry| (label(entry.source), entry.source.talent, entry.total)),
        seconds,
    )
}

fn meter_totals(
    entries: impl IntoIterator<Item = (String, bool, f64)>,
    seconds: f32,
) -> String {
    let mut sorted = Vec::<(String, bool, f64)>::new();
    for entry in entries {
        if let Some(row) = sorted
            .iter_mut()
            .find(|row| row.0 == entry.0 && row.1 == entry.1)
        {
            row.2 += entry.2;
        } else {
            sorted.push(entry);
        }
    }
    // Native stable total-order sort: preserve admission order for tied rows.
    sorted.sort_by(|left, right| right.2.total_cmp(&left.2));
    let total = sorted.iter().fold(-0.0, |total, row| total + row.2);
    let seconds = f64::from(if seconds > 1.0 { seconds } else { 1.0 });
    sorted
        .iter()
        .map(|row| {
            format!(
                "{},{:.0},{:.1},{:.4},{}",
                field(&row.0),
                row.2.round(),
                row.2 / seconds,
                row.2 / total,
                u8::from(row.1),
            )
        })
        .collect::<Vec<_>>()
        .join(";")
}

fn taken_line(entries: &BTreeMap<&'static str, f64>) -> String {
    let mut sorted = entries.iter().collect::<Vec<_>>();
    sorted.sort_by(|left, right| right.1.total_cmp(left.1));
    sorted
        .into_iter()
        .map(|(source, total)| format!("{},{:.0}", field(source), total.round()))
        .collect::<Vec<_>>()
        .join(";")
}

/// Native1459b9b70 replaces only these four delimiters, preserving all other
/// Unicode scalar values. In particular it does not trim or collapse spaces.
pub(super) fn field(value: &str) -> String {
    value
        .chars()
        .map(|ch| {
            if matches!(ch, '\t' | ',' | ';' | '=') {
                ' '
            } else {
                ch
            }
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use azeroth_survivors_re::run_effects::healing::MeterSource;

    fn entry(name: &'static str, total: f64, proc: bool) -> MeterEntry {
        MeterEntry {
            source: MeterSource {
                name,
                icon: "",
                talent: proc,
            },
            total,
            breakdown: Vec::new(),
        }
    }

    #[test]
    fn meter_wire_preserves_proc_rows_effective_totals_and_native_precisions() {
        let rows = [entry("Bolt,;=\té", 12.5, false), entry("Bolt", 37.5, true)];
        assert_eq!(
            meter_line(&rows, 2.0, |source| source.name.to_owned()),
            "Bolt,38,18.8,0.7500,1;Bolt    é,13,6.2,0.2500,0"
        );
        assert_eq!(
            meter_line(&rows[..1], 0.0, |source| source.name.to_owned()),
            "Bolt    é,13,12.5,1.0000,0"
        );
        assert_eq!(meter_line(&[], 3.0, |source| source.name.to_owned()), "");
    }

    #[test]
    fn localized_identity_merges_before_sort_and_wire_sanitization() {
        let rows = [
            entry("first", 2.0, false),
            entry("second", 3.0, false),
            entry("first", 4.0, true),
        ];
        assert_eq!(
            meter_line(&rows, 1.0, |_| "Traduit;é".to_owned()),
            "Traduit é,5,5.0,0.5556,0;Traduit é,4,4.0,0.4444,1"
        );
        let locale = Localization::english_for_tests();
        assert_eq!(
            source_name(
                MeterSource {
                    name: "Shadow Bolt",
                    icon: "Spell_Shadow_ShadowBolt",
                    talent: false
                },
                &locale
            ),
            "Shadow Bolt"
        );
        assert_eq!(
            source_name(
                MeterSource {
                    name: "Talents",
                    icon: "Ability_Marksmanship",
                    talent: true
                },
                &locale
            ),
            "Talents"
        );
    }

    #[test]
    fn taken_wire_orders_accumulated_categories_and_keeps_zero_credits() {
        let mut ledger = TakenLedger::default();
        ledger.record("mob melee", 2.5);
        ledger.record("area", 0.0);
        ledger.record("mob melee", 5.0);
        ledger.record("boss spell", 10.25);
        assert_eq!(ledger.total, 17.75);
        assert_eq!(
            taken_line(&ledger.categories),
            "boss spell,10;mob melee,8;area,0"
        );
    }
}
