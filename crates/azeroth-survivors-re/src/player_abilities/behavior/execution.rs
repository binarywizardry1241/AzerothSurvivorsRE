//! Current target queries and projectile/impact state. Damage and live world
//! operations use canonical ports; this module does not create a fake world.

use super::{RuntimeInstance, unit24};
use crate::{
    bosses::abilities::{CastTarget, SpellCast, native_missile_speed},
    enemies::{NativeRng, Position, ai::Actor},
    player_abilities::catalog::StatusEffect,
};

pub fn distance_squared(a: Position, b: Position) -> f32 {
    let x = a.x - b.x;
    let y = a.y - b.y;
    y * y + x * x
}

/// 1455149f0 /1454ee0d0: live actor state0 only, interpolated XY, inclusive
/// squared radius and explicit excluded GUIDs. Z does not affect targeting.
/// The current comparator141929100 uses f32 total order on distance alone.
pub fn targets_in_radius(
    actors: &[Actor],
    now: f32,
    center: Position,
    radius: f32,
    excluded: &[u64],
) -> Vec<u64> {
    let radius_squared = radius * radius;
    let mut candidates = actors
        .iter()
        .filter_map(|actor| {
            if actor.dead || excluded.contains(&actor.guid) {
                return None;
            }
            let distance = distance_squared(actor.movement.position_at(now), center);
            (radius_squared >= distance).then_some((distance, actor.guid))
        })
        .collect::<Vec<_>>();
    candidates.sort_by(|a, b| a.0.total_cmp(&b.0));
    candidates.into_iter().map(|(_, guid)| guid).collect()
}

/// Current common target count: base-zero means1; otherwise all three bonus
/// sources are added and the result is at least1. Integer addition wraps as
/// in the original; no provisional target cap is imposed here.
pub fn target_count(instance: &RuntimeInstance<'_>, global_bonus: u32) -> u32 {
    if instance.definition.targets == 0 {
        return 1;
    }
    instance
        .definition
        .targets
        .wrapping_add(global_bonus)
        .wrapping_add(instance.target_bonus)
        .wrapping_add(instance.talent_target_bonus)
        .max(1)
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Critical {
    pub chance: f32,
    pub multiplier: f32,
}

/// Independent follow-up gates captured by current Doomguard prepared rows.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct DemonSpellImpact {
    pub nightfall: bool,
    pub conflagrate: bool,
}

/// The four native Game+64 words and four caller-provided words are retained
/// losslessly for deferred hit context restoration (1454a3aca..1454a3ae1).
/// Their world-specific interpretation belongs to the actual run adapter.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct HitContext {
    /// Current hostile pending row+20/+24: optional launch-position tag and
    /// xyz. Keep the bits until impact; LOS samples the victim's live XY then,
    /// independently of the source actor's later movement or removal.
    pub hostile_origin: Option<[u32; 3]>,
    /// Deferred pet impacts capture source2 in the native pending row. Absent
    /// means inherit the synchronous wrapper's current attribution.
    pub captured_source_kind: Option<u8>,
    /// Actual current descriptor captured by a pet attack. The meter uses its
    /// name only when the descriptor carries a nonempty icon, as1458f2ee0 does.
    pub pet_entry: Option<u32>,
    /// Optional native attack labels captured by the actual producing owner.
    pub meter_attack: Option<crate::run_meter::CapturedAttack>,
    /// Current prepared Doomguard row flags+38/+39, retained until impact.
    /// Echo clears both; Shadow Cleave retains only Conflagrate admission.
    pub demon_spell_impact: Option<DemonSpellImpact>,
    pub source_words: [u32; 4],
    pub cast_words: [u32; 4],
    pub overcast: bool,
    /// Captured generic freecast source. Kept separate from the caller's
    /// DoT-plan words so an effect-index tag cannot become a fabricated DoT.
    pub proc_source: Option<usize>,
    /// Final actor-hit argument suppressing its spell-damage log publication.
    pub suppress_damage_log: bool,
}

/// Semantic fields of native80-byte pending hit (Game+0x4f8 vector).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PendingHit {
    pub context: HitContext,
    pub target_guid: u64,
    pub source_guid: u64,
    pub effect: StatusEffect,
    pub resolves_at: f32,
    pub spell_id: u32,
    pub damage: f32,
    pub critical: bool,
    /// Native+73; true is routed to player damage instead of actor damage.
    pub damages_player: bool,
    pub school: u8,
}

impl PendingHit {
    /// Current caller-context variant1 schedules an actor DoT at impact. Its
    /// direct damage is zero; the ordinary impact still consumes a crit draw.
    /// The adapter uses periodic::install_dot with current stack cap1..4 and
    /// status5's value as leech fraction, then emits the native aura update.
    pub fn dot_plan(&self) -> Option<super::periodic::DotPlan> {
        let words = self.context.cast_words;
        (words[0] == 1).then_some(super::periodic::DotPlan {
            total_power: f32::from_bits(words[1]),
            duration: f32::from_bits(words[2]),
            ticks: words[3],
        })
    }
}

#[derive(Default, Debug)]
pub struct PendingHits(pub Vec<PendingHit>);

/// Bind the canonical hit/death handler and secondary status application.
/// `resolve` must restore the captured hit context around that operation,
/// matching the original queue consumer; this is not a second damage formula.
pub trait ImpactPort {
    fn resolve(&mut self, hit: PendingHit, queue: &mut PendingHits);
}

impl PendingHits {
    /// The native partition detaches this frame's due records before resolving
    /// them. New impacts emitted by a hit remain queued for a later pass.
    pub fn resolve_due(&mut self, now: f32, port: &mut impl ImpactPort) {
        let mut due = Vec::new();
        self.0.retain(|hit| {
            if now >= hit.resolves_at {
                due.push(*hit);
                false
            } else {
                true
            }
        });
        for hit in due {
            port.resolve(hit, self);
        }
    }
}

pub trait ProjectilePort {
    /// Emit the actual native spell visual through the existing packet port.
    /// Native ammo/DBC visual resolution remains the packet/world adapter's
    /// responsibility; do not replace it with an invented animation.
    fn cast_spell(&mut self, cast: SpellCast);
}

#[derive(Clone, Copy, Debug)]
pub struct ProjectileCast {
    pub source_guid: u64,
    pub source: Position,
    pub now: f32,
    pub extra_delay: f32,
    pub raw_power: f32,
    pub critical: Critical,
    pub context: HitContext,
    pub effect: StatusEffect,
}

/// 1454ef3b0: cast visual first, sample the current moving victim, determine
/// travel time from the current native speed lookup, roll crit at launch,
/// then append a delayed impact. Zero speed means no travel-time term.
pub fn launch_projectile(
    instance: &RuntimeInstance<'_>,
    target: &Actor,
    request: ProjectileCast,
    rng: &mut NativeRng,
    pending: &mut PendingHits,
    port: &mut impl ProjectilePort,
) {
    let definition = instance.definition;
    let destination = target.movement.position_at(request.now);
    port.cast_spell(SpellCast {
        source_guid: request.source_guid,
        spell_id: definition.spell_id,
        target: CastTarget::Unit(target.guid),
        hit_targets: vec![target.guid],
    });
    let speed = native_missile_speed(definition.spell_id);
    let travel = if speed > 0.0 {
        distance_squared(request.source, destination).sqrt() / speed
    } else {
        0.0
    };
    let critical = unit24(rng) < request.critical.chance;
    let damage = if critical {
        request.raw_power * request.critical.multiplier
    } else {
        request.raw_power
    };
    pending.0.push(PendingHit {
        context: request.context,
        target_guid: target.guid,
        source_guid: request.source_guid,
        effect: request.effect,
        resolves_at: (travel + request.extra_delay) + request.now,
        spell_id: definition.spell_id,
        damage,
        critical,
        damages_player: false,
        school: definition.school,
    });
}
