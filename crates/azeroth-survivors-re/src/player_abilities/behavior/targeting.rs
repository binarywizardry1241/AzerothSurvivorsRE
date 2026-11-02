//! Current native query ordering. Extra actor combat fields are supplied by
//! the actual world; the existing AI Actor intentionally has no fake HP pool.

use super::execution::distance_squared;
use crate::enemies::{ai::Actor, NativeRng, Position};

#[derive(Clone, Debug)]
pub struct Target {
    pub actor: Actor,
    pub health: f32,              // Actor+240
    pub maximum_health: f32,      // Actor+244
    pub has_metadata: bool,       // Actor+24 != -1 (boss metadata)
    pub flagged: bool,            // Actor+344 !=0 (elite definition flag)
    /// Active kind-zero periodic stacks by spell ID (count>0 only).
    pub periodic_stacks: Vec<(u32, usize)>,
}

impl Target {
    pub fn periodic_count(&self, spell_id: u32) -> usize {
        self.periodic_stacks.iter().filter(|(spell, _)| *spell == spell_id)
            .map(|(_, count)| *count).sum()
    }

    ///14552bae0: the native avoid-target deadline is last, then metadata/elite/ordinary order.
    pub fn priority(&self, now: f32) -> u8 {
        if !(self.actor.fear_until <= now) { 3 }
        else if self.has_metadata { 0 }
        else if self.flagged { 1 }
        else { 2 }
    }
}

pub fn radius_targets<'a>(targets: &'a [Target], now: f32, center: Position,
                          radius: f32, excluded: &[u64]) -> Vec<&'a Target> {
    let radius_squared = radius * radius;
    let mut result = targets.iter().filter(|t| !t.actor.dead
        && !excluded.contains(&t.actor.guid)
        && radius_squared >= distance_squared(t.actor.movement.position_at(now), center))
        .collect::<Vec<_>>();
    result.sort_by(|a, b| distance_squared(a.actor.movement.position_at(now), center)
        .total_cmp(&distance_squared(b.actor.movement.position_at(now), center)));
    result
}

///1454ee2a0: ordinary targets within6yd are health-sorted; those farther away
/// retain the base distance order. Boss/elite priority precedes that group.
pub fn ordered_targets<'a>(targets: &'a [Target], now: f32, center: Position,
                           radius: f32) -> Vec<&'a Target> {
    let mut base = radius_targets(targets, now, center, radius, &[]);
    base.sort_by_key(|t| t.priority(now));
    let mut result = Vec::with_capacity(base.len());
    for priority in 0..4 {
        let group = base.iter().copied().filter(|t| t.priority(now) == priority);
        if priority != 2 { result.extend(group); continue; }
        let (mut near, far): (Vec<_>, Vec<_>) = group.partition(|t|
            distance_squared(t.actor.movement.position_at(now), center) <= 36.0);
        near.sort_by(|a, b| a.health.total_cmp(&b.health));
        result.extend(near);
        result.extend(far);
    }
    result
}

///1454f1030 execute comparator: prioritize bosses/elites, then sub30% ordinary
/// targets, then healthy ordinary targets, then avoided targets. Ratio breaks
/// ties except healthy ordinary targets, whose native comparison ratio is0.
pub fn order_execute(targets: &mut Vec<&Target>, now: f32) {
    let key = |t: &Target| {
        if !(t.actor.fear_until <= now) { return (4, 0.0); }
        let ratio = t.health / t.maximum_health;
        if t.has_metadata { (0, ratio) }
        else if t.flagged { (1, ratio) }
        else if ratio < 0.3 { (2, ratio) }
        else { (3, 0.0) }
    };
    targets.sort_by(|a, b| {
        let a = key(a); let b = key(b);
        a.0.cmp(&b.0).then_with(|| a.1.total_cmp(&b.1))
    });
}

///14552c020/14552d410: high-health candidates first within native priority,
/// skip actors already at the current per-spell stack cap, then prefer bosses
/// and flagged elites followed by the fewest existing ordinary stacks.
pub fn dot_targets<'a>(targets: &'a [Target], now: f32, center: Position,
                       radius: f32, spell_id: u32, stack_bonus: u32,
                       count: u32) -> Vec<&'a Target> {
    let mut candidates = radius_targets(targets, now, center, radius, &[]);
    candidates.sort_by(|a, b| a.priority(now).cmp(&b.priority(now)).then_with(||
        (b.health / b.maximum_health.max(1.0)).total_cmp(&(a.health / a.maximum_health.max(1.0)))));
    let cap = stack_bonus.min(3) as usize + 1;
    candidates.retain(|t| t.periodic_count(spell_id) < cap);
    candidates.sort_by_key(|t| if t.has_metadata || t.flagged { 0 }
        else { t.periodic_count(spell_id) + 1 });
    candidates.truncate(count as usize);
    candidates
}

///145530e40: facing dot strictly>0.5, XY distance strictly>.01 and<=range.
/// The caller uses the current imported cosf/sinf (or its exact Math port).
pub fn cone_targets<'a>(targets: &'a [Target], now: f32, center: Position,
                        radius: f32, facing: [f32; 2]) -> Vec<&'a Target> {
    targets.iter().filter(|t| {
        if t.actor.dead { return false; }
        let p = t.actor.movement.position_at(now);
        let x = p.x - center.x; let y = p.y - center.y;
        let distance = (y * y + x * x).sqrt();
        distance <= radius && distance > 0.01
            && (y * facing[1] + x * facing[0]) / distance > 0.5
    }).collect()
}

///145512e00: last maximum wins, across at most24 distance-ordered candidate
/// centers. Density includes every live actor, including actors out of range
/// of the player but in range of this candidate's eventual area.
pub fn ground_center(targets: &[Target], now: f32, player: Position,
                     range: f32, radius: f32) -> Option<Position> {
    let candidates = radius_targets(targets, now, player, range, &[]);
    let mut best = None;
    let mut best_count = 0;
    for target in candidates.into_iter().take(24) {
        let center = target.actor.movement.position_at(now);
        let count = targets.iter().filter(|t| !t.actor.dead
            && distance_squared(t.actor.movement.position_at(now), center) <= radius * radius).count();
        if count >= best_count { best = Some(center); best_count = count; }
    }
    best
}

///14540cb60: current shuffle uses high32-bit multiply/rejection for u32-size
/// lists, rather than modulo. Every rejected sample advances the shared RNG.
pub fn shuffle<T>(items: &mut [T], rng: &mut NativeRng) {
    for bound in (2..=items.len()).rev() {
        items.swap(bound - 1, random_index(bound, rng));
    }
}

/// Current1459eabc0 shares shuffle's UniformInt arithmetic. Even a one-row
/// choice draws RNG; an empty candidate list is rejected before this owner.
pub fn random_index(bound: usize, rng: &mut NativeRng) -> usize {
    assert!(bound > 0);
    if bound <= u32::MAX as usize {
        let bound = bound as u32;
        let zone = bound.wrapping_shl(bound.leading_zeros()).wrapping_sub(1);
        loop {
            let product = (rng.next_u64() >> 32) * u64::from(bound);
            if product as u32 <= zone { break (product >> 32) as usize; }
        }
    } else {
        let bound = bound as u64;
        let zone = bound.wrapping_shl(bound.leading_zeros()).wrapping_sub(1);
        loop {
            let product = u128::from(rng.next_u64()) * u128::from(bound);
            if product as u64 <= zone { break (product >> 64) as usize; }
        }
    }
}
