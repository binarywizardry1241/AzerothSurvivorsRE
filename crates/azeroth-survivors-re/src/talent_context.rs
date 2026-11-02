//! Selected 0.115.0 terminal talent-XP event and its independent UI context.
//! Native event producer: 145889ce0; consumer: 140160020 / 140075900.

use serde_json::{Value, json};

/// The native context retains the entire received Value until its run ends.
/// Parsing belongs to the terminal consumer, not the event dispatch boundary.
#[derive(Clone, Debug, Default)]
pub(crate) struct Context {
    active: bool,
    talent: Option<Value>,
    revision: u32,
}

impl Context {
    pub(crate) fn activate(&mut self) {
        *self = Self {
            active: true,
            ..Self::default()
        };
    }

    pub(crate) fn clear(&mut self) {
        *self = Self::default();
    }

    pub(crate) fn accept(&mut self, value: Value) -> bool {
        if !self.active || value.get("type").and_then(Value::as_str) != Some("talentxp") {
            return false;
        }
        self.talent = Some(value);
        self.revision = self.revision.wrapping_add(1);
        true
    }

    pub(crate) fn value(&self) -> Option<&Value> {
        self.talent.as_ref()
    }

    pub(crate) fn revision(&self) -> u32 {
        self.revision
    }

    pub(crate) fn snapshot(&self) -> Option<Snapshot> {
        Snapshot::read(self.talent.as_ref()?)
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct Snapshot {
    pub gained: u32,
    pub before: u32,
    pub total: u32,
    pub class_name: String,
    pub parts: Vec<(String, u32)>,
}

impl Snapshot {
    /// Native terminal construction admits only an object-valued talent field.
    /// Numeric fields accept any JSON number, clamp before subtraction, and
    /// truncate fractions. A present nonnumeric `before` keeps the fallback.
    pub(crate) fn read(value: &Value) -> Option<Self> {
        value.as_object()?;
        let gained = number(value.get("xp")).unwrap_or(0);
        let total = number(value.get("total")).unwrap_or(0);
        let before = number(value.get("before")).unwrap_or_else(|| total.saturating_sub(gained));
        let parts = value
            .get("parts")
            .and_then(Value::as_array)
            .into_iter()
            .flatten()
            .filter_map(|part| {
                let xp = number(part.get("xp"))?;
                (xp != 0).then(|| {
                    (
                        part.get("name")
                            .and_then(Value::as_str)
                            .unwrap_or("")
                            .to_owned(),
                        xp,
                    )
                })
            })
            .collect();
        Some(Self {
            gained,
            before,
            total,
            class_name: value
                .get("class")
                .and_then(Value::as_str)
                .unwrap_or("")
                .to_owned(),
            parts,
        })
    }
}

fn number(value: Option<&Value>) -> Option<u32> {
    value?
        .as_f64()
        .map(|value| value.max(0.).min(f64::from(u32::MAX)) as u32)
}

/// Terminal presentation and the native event use zero progress/cost at cap.
/// The account allocation budget retains its separate post-cap return values.
fn display_budget(xp: u32) -> (u32, u32, u32) {
    let (points, into, next) = crate::save::talents::budget(u64::from(xp));
    if points == crate::save::talents::MAX_POINTS {
        (points, 0, 0)
    } else {
        (points, into as u32, next)
    }
}

/// Native backend emission preserves the requested XP delta independently of
/// save saturation. Parts pass through the native i64-to-f64 conversion;
/// integral magnitudes below 1e15 use the native integer formatting branch.
pub(crate) fn request(
    gain: u32,
    before: u32,
    total: u32,
    class_name: &str,
    parts: &[(String, i64)],
) -> Value {
    let old_points = display_budget(before).0;
    let (points, into, next) = display_budget(total);
    let parts = parts
        .iter()
        .filter(|(_, xp)| *xp > 0)
        .map(|(name, xp)| {
            let value = *xp as f64;
            let xp = if value < 1e15 {
                json!(value as i64)
            } else {
                json!(value)
            };
            json!({ "name": name, "xp": xp })
        })
        .collect::<Vec<_>>();
    json!({
        "type": "talentxp", "xp": gain,
        "before": before, "total": total,
        "points": points, "gained": points.wrapping_sub(old_points),
        "into": into, "next": next,
        "class": class_name, "parts": parts,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn numeric_clamping_precedes_fallback_and_explicit_before_wins() {
        let value = json!({"xp": 81.75, "total": u64::MAX, "before": "400"});
        let snapshot = Snapshot::read(&value).unwrap();
        assert_eq!((snapshot.gained, snapshot.before), (81, u32::MAX - 81));
        assert_eq!(
            Snapshot::read(&json!({"xp": 90, "total": 20}))
                .unwrap()
                .before,
            0
        );
        assert_eq!(
            Snapshot::read(&json!({"xp": 90, "total": 20, "before": -1.5}))
                .unwrap()
                .before,
            0
        );
        assert_eq!(
            Snapshot::read(&json!({"xp": 90, "total": 20, "before": 7.5}))
                .unwrap()
                .before,
            7
        );
    }

    #[test]
    fn part_parser_retains_empty_names_order_and_duplicate_positive_rows() {
        let snapshot = Snapshot::read(&json!({"parts": [
            {"name": "ignored", "xp": 0.9}, {"xp": 7.75},
            {"name": 4, "xp": u64::MAX}, {"name": "same", "xp": 2},
            {"name": "same", "xp": 2}, {"name": "ignored", "xp": -1}, null,
        ]}))
        .unwrap();
        assert_eq!(
            snapshot.parts,
            [
                ("".into(), 7),
                ("".into(), u32::MAX),
                ("same".into(), 2),
                ("same".into(), 2)
            ]
        );
        assert_eq!(snapshot.class_name, "");
        assert!(Snapshot::read(&Value::Null).is_none());
    }

    #[test]
    fn context_preserves_raw_value_and_repeated_requests_advance_revision() {
        let value = json!({"type": "talentxp", "xp": "unparsed", "extra": [1, 2]});
        let mut context = Context::default();
        assert!(!context.accept(value.clone()));
        context.activate();
        assert!(context.accept(value.clone()));
        assert!(context.accept(value.clone()));
        assert_eq!(context.value(), Some(&value));
        assert_eq!(context.revision(), 2);
        context.revision = u32::MAX;
        assert!(context.accept(value));
        assert_eq!(context.revision(), 0);
        context.clear();
        assert!(context.snapshot().is_none());
    }

    #[test]
    fn event_keeps_full_delta_when_the_saved_total_saturates_and_zeroes_capped_progress() {
        let value = request(
            100,
            u32::MAX - 1,
            u32::MAX,
            "Warrior",
            &[
                ("zero".into(), 0),
                ("negative".into(), -1),
                ("Time survived".into(), 100),
            ],
        );
        assert_eq!(value["xp"].as_u64(), Some(100));
        assert_eq!(
            (
                value["points"].as_u64(),
                value["into"].as_u64(),
                value["next"].as_u64()
            ),
            (Some(51), Some(0), Some(0))
        );
        assert_eq!(
            value["parts"],
            json!([{"name": "Time survived", "xp": 100}])
        );
    }
}
