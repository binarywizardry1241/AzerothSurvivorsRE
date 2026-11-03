//! Per-hero history and terminal payload recovered from the 0.139.2 EXE.

use serde::{Deserialize, Serialize};
use std::collections::VecDeque;

const WINDOW: f32 = 10.0;
const HISTORY_LIMIT: usize = 400;
const HIT_GROUP_LIMIT: usize = 8;
const SOURCE_LIMIT: usize = 6;
const GROUP_INTERVAL: f32 = 1.0;

#[derive(Clone, Debug, PartialEq, Deserialize, Serialize)]
pub(super) struct DamageSource {
    pub who: String,
    pub rank: String,
    pub what: String,
    pub icon: String,
    pub mechanic: bool,
}

impl DamageSource {
    fn same_action(&self, other: &Self) -> bool {
        self.who == other.who && self.what == other.what
    }
}

#[derive(Clone, Debug)]
pub(super) struct DamageRecord {
    pub source: DamageSource,
    pub time: f32,
    pub amount: f32,
    pub absorbed: f32,
    pub health: f32,
    pub max_health: f32,
}

#[derive(Clone, Debug, Default)]
pub(super) struct DamageHistory {
    records: VecDeque<DamageRecord>,
}

impl DamageHistory {
    pub fn record(&mut self, hit: DamageRecord) {
        let cutoff = hit.time - WINDOW;
        while self.records.len() >= HISTORY_LIMIT
            || self
                .records
                .front()
                .is_some_and(|first| !(first.time >= cutoff))
        {
            self.records.pop_front();
        }
        self.records.push_back(hit);
    }

    pub fn recap(&self, now: f32) -> Option<DeathRecap> {
        DeathRecap::from_records(&self.records, now)
    }
}

#[derive(Clone, Debug, PartialEq, Deserialize, Serialize)]
pub(super) struct KillingBlow {
    #[serde(flatten)]
    pub source: DamageSource,
    pub n: f32,
    pub overkill: f32,
}

#[derive(Clone, Debug, PartialEq, Deserialize, Serialize)]
pub(super) struct HitGroup {
    #[serde(flatten)]
    pub source: DamageSource,
    pub ago: f32,
    pub n: f32,
    pub abs: f32,
    pub count: u32,
    pub hp: f32,
}

#[derive(Clone, Debug, PartialEq, Deserialize, Serialize)]
pub(super) struct SourceGroup {
    #[serde(flatten)]
    pub source: DamageSource,
    pub n: f32,
    pub count: u32,
}

#[derive(Clone, Debug, PartialEq, Deserialize, Serialize)]
pub(super) struct DeathRecap {
    pub secs: f32,
    pub total: f32,
    pub absorbed: f32,
    pub avoidable: f32,
    pub maxhp: f32,
    pub killer: KillingBlow,
    pub hits: Vec<HitGroup>,
    pub by: Vec<SourceGroup>,
}

impl DeathRecap {
    fn from_records(records: &VecDeque<DamageRecord>, now: f32) -> Option<Self> {
        let cutoff = now - WINDOW;
        let mut window = records.iter().filter(|hit| hit.time >= cutoff);
        let first = window.next()?;
        let mut last = first;
        let mut total = -0.0;
        let mut absorbed = -0.0;
        let mut avoidable = -0.0;
        let mut hits: Vec<(&DamageRecord, f32, f32, u32)> = Vec::new();
        let mut sources: Vec<(&DamageSource, f32, u32)> = Vec::new();

        for hit in std::iter::once(first).chain(window) {
            last = hit;
            total += hit.amount;
            absorbed += hit.absorbed;
            if hit.source.mechanic {
                avoidable += hit.amount;
            }

            if let Some((latest, amount, shield, count)) = hits.last_mut().filter(|(latest, ..)| {
                latest.source.same_action(&hit.source) && hit.time - latest.time <= GROUP_INTERVAL
            }) {
                *latest = hit;
                *amount += hit.amount;
                *shield += hit.absorbed;
                *count += 1;
            } else {
                hits.push((hit, hit.amount, hit.absorbed, 1));
            }

            if let Some((_, amount, count)) = sources
                .iter_mut()
                .find(|(source, ..)| source.same_action(&hit.source))
            {
                *amount += hit.amount;
                *count += 1;
            } else {
                sources.push((&hit.source, hit.amount, 1));
            }
        }

        let skip = hits.len().saturating_sub(HIT_GROUP_LIMIT);
        let hits = hits
            .into_iter()
            .skip(skip)
            .map(|(latest, n, abs, count)| HitGroup {
                source: latest.source.clone(),
                ago: positive_or_zero(now - latest.time),
                n: n.round(),
                abs: abs.round(),
                count,
                hp: (latest.health / latest.max_health.max(1.0)).clamp(0.0, 1.0),
            })
            .collect();
        sources.sort_by(|left, right| right.1.total_cmp(&left.1));
        let by = sources
            .into_iter()
            .take(SOURCE_LIMIT)
            .map(|(source, n, count)| SourceGroup {
                source: source.clone(),
                n: n.round(),
                count,
            })
            .collect();

        Some(Self {
            secs: (now - first.time).clamp(0.0, WINDOW),
            total: total.round(),
            absorbed: absorbed.round(),
            avoidable: avoidable.round(),
            maxhp: last.max_health.round(),
            killer: KillingBlow {
                source: last.source.clone(),
                n: last.amount.round(),
                overkill: positive_or_zero(-last.health).round(),
            },
            hits,
            by,
        })
    }
}

/// MAXSS with +0 as the second operand returns +0 on equality or unordered input.
fn positive_or_zero(value: f32) -> f32 {
    if value > 0.0 { value } else { 0.0 }
}
