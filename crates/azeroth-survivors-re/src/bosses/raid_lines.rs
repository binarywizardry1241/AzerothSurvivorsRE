//! Current 0.109.0 native7 warned charge and its native35 delayed movement.
//! Evidence: docs/analysis/raid-lines-0.109.0.md. The old instantaneous charge
//! remains a historical ability; this path owns a one-second line warning.

use super::{Area, Pending};
use crate::bosses::{
    abilities::{CastTarget, Charge, CombatContext, CombatPort, SpellCast},
    Position, RawBossAbility,
};
use crate::enemies::ai::{Math, Movement};

#[derive(Clone, Debug)]
struct DelayedAction {
    source: u64,
    at: f32,
    kind: DelayedKind,
}

#[derive(Clone, Debug)]
pub(crate) enum DelayedKind {
    Charge(Position),
    RemoveAura(u32),
    Ability(RawBossAbility),
    Pull,
}

#[derive(Clone, Debug, Default)]
pub(crate) struct PendingLines {
    rows: Vec<DelayedAction>,
}

/// Native collision margin operates on XY distance and interpolates XYZ.
/// A missing ray result is the unobstructed lane. The destination's primary
/// height sample is applied afterward; it has no secondary/fallback lookup.
fn clipped_endpoint(from: Position, to: Position, fraction: Option<f32>) -> Position {
    let Some(fraction) = fraction else { return to };
    if fraction >= 1.0 { return to; }
    let dx = to.x - from.x;
    let dy = to.y - from.y;
    let length = (dy * dy + dx * dx).sqrt().max(0.5);
    let fraction = (fraction - 0.5 / length).max(0.0);
    Position {
        x: dx * fraction + from.x,
        y: dy * fraction + from.y,
        z: (to.z - from.z) * fraction + from.z,
    }
}

impl Pending {
    /// Semantic9 carries native7's spell; word6 remains the scheduler cooldown.
    pub(super) fn dispatch_line(&mut self, record: &RawBossAbility, context: CombatContext,
        port: &mut impl CombatPort, math: &impl Math) -> bool {
        if record.words[0] != 9 { return false; }
        let dx = context.player.x - context.source.x;
        let dy = context.player.y - context.source.y;
        let angle = dy.atan2(dx);
        let extended = (dy * dy + dx * dx).sqrt() + 6.0;
        // Dispatch captures player ground Z using primary-only sampling.
        let target = Position {
            x: math.cos(angle) * extended + context.source.x,
            y: math.sin(angle) * extended + context.source.y,
            z: port.primary_height([context.player.x, context.player.y])
                .unwrap_or(context.player.z),
        };
        let fraction = port.ray_fraction(context.source, target);
        let mut destination = clipped_endpoint(context.source, target, fraction);
        destination.z = port.primary_height([destination.x, destination.y])
            .unwrap_or(destination.z);
        let dx = context.source.x - destination.x;
        let dy = context.source.y - destination.y;
        let length = (dy * dy + dx * dx).sqrt().max(4.0);
        let scaled = port.raid_source_scale(context.source_guid)
            * f32::from_bits(0x3f99999a);
        // MAXSS/MINSS select their second operand when unordered. Preserve a
        // malformed native size rather than silently turning it into four.
        let width = if 4.0 > scaled { 4.0 } else { scaled };
        let width = if 7.0 < width { 7.0 } else { width };
        port.raid_block(context.source_guid, f32::from_bits(0x3fcccccd));
        port.raid_hold_facing(context.source_guid, length / 40.0 + 1.0, angle);
        port.raid_cast(context.source_guid, record.words[1], 1.0);
        let mut area = Area::danger(context, context.source, length, 1.0,
            context.effective_damage + context.effective_damage, port.heroic_rank());
        // Every hazard constructor uses the common primary/secondary/default
        // height chain for the marker origin, independently of movement Z.
        area.center = super::ground(port, area.center);
        area.line = Some((angle, width));
        self.push(area);
        self.lines.rows.push(DelayedAction { source: context.source_guid,
            kind: DelayedKind::Charge(destination), at: 1.0 + context.now });
        true
    }
}

impl PendingLines {
    pub(crate) fn pull_at(&mut self, source: u64, at: f32) {
        self.rows.push(DelayedAction { source, at, kind: DelayedKind::Pull });
    }
    pub(crate) fn ability_at(&mut self, source: u64, ability: RawBossAbility, at: f32) {
        self.rows.push(DelayedAction { source, at, kind: DelayedKind::Ability(ability) });
    }

    /// Native18's children share this vector with movement and aura removals.
    /// Removal precedes source admission; appended due children remain visible.
    pub(crate) fn take_due(&mut self, now: f32, index: &mut usize,
        selected: impl Fn(u64) -> bool) -> Option<(u64, DelayedKind)> {
        while *index < self.rows.len() {
            if !selected(self.rows[*index].source) { *index += 1; continue; }
            if self.rows[*index].at > now { *index += 1; continue; }
            let row = self.rows.remove(*index);
            return Some((row.source, row.kind));
        }
        None
    }

    pub(crate) fn apply(source: u64, kind: DelayedKind, now: f32, port: &mut impl CombatPort) {
        let Some(mut from) = port.raid_source(source) else { return; };
        let destination = match kind {
            DelayedKind::RemoveAura(spell) => { port.raid_aura(source, spell, false); return; }
            DelayedKind::Charge(destination) => destination,
            DelayedKind::Ability(_) => return,
            DelayedKind::Pull => { port.raid_pull(source); return; }
        };
        from.z = port.primary_height([from.x, from.y]).unwrap_or(from.z);
        let dx = from.x - destination.x;
        let dy = from.y - destination.y;
        let duration = ((dy * dy + dx * dx).sqrt() / 40.0)
            .max(f32::from_bits(0x3e19999a));
        port.begin_raid_charge(Charge { source_guid: source,
            movement: Movement { from, to: destination, started_at: now, duration },
            duration_ms: (duration * 1000.0) as u32,
            next_move_at: (now + duration) + f32::from_bits(0x3e4ccccd),
            attack_delay: duration + f32::from_bits(0x3ecccccd) });
        port.cast_spell(SpellCast { source_guid: source, spell_id: 100,
            target: CastTarget::Ground(destination), hit_targets: Vec::new() });
    }
    /// Native37 shares insertion order and alive-source admission with35.
    pub(super) fn remove_aura_at(&mut self, source: u64, spell: u32, at: f32) {
        self.rows.push(DelayedAction { source, at, kind: DelayedKind::RemoveAura(spell) });
    }

    /// The native queue removes an admitted record before its alive-source
    /// lookup and processes the shifted row at the same index. It runs before
    /// hazard damage/publication. No endpoint impact is added by native35.
    pub(super) fn tick(&mut self, now: f32, port: &mut impl CombatPort) {
        let mut index = 0;
        while let Some((source, kind)) = self.take_due(now, &mut index,
            |source| port.raid_source_selected(source)) {
            Self::apply(source, kind, now, port);
        }
    }
}
