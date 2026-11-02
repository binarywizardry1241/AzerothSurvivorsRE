//! Current0.109.0 complete guardian recurring lists, health phases and reset.
//! Records and scheduling survive current initial-request/announcement filters.
//! Hash-bound inputs and recursive sequence/replacement records are checked.
//! Compilation, gameplay and native parity remain unverified.

use crate::bosses::RawBossAbility;
use crate::enemies::NativeRng;

#[derive(Clone, Copy, Debug)]
pub struct Move {
    pub native_tag: u8,
    pub cooldown: f32,
    pub ability: Option<RawBossAbility>,
}

#[derive(Clone, Copy, Debug)]
pub struct Phase {
    pub native_tag: u8,
    pub threshold: f32,
    pub yell: &'static str,
    pub ability: Option<RawBossAbility>,
}

#[derive(Clone, Copy, Debug)]
pub struct Signature {
    pub enemy_id: u32,
    /// Base moves followed by each native alternate list. Sentinel has three
    /// alternate lists; all other current kinds have only their base list.
    pub variants: &'static [&'static [Move]],
    pub phases: &'static [Phase],
}

pub fn signature(enemy_id: u32) -> Option<&'static Signature> {
    super::signature_catalog::SIGNATURES.iter().find(|row| row.enemy_id == enemy_id)
}

/// Draw at the native guardian constructor, before another lair can spawn.
/// Both historical and current RNG wrappers expose the same four owning words.
pub fn choose_variant(enemy_id: u32, mut next: impl FnMut() -> u64) -> usize {
    let random = loop {
        let value = next();
        if value & (1 << 57) == 0 { break value; }
    };
    let variants = signature(enemy_id).map_or(1, |row| row.variants.len());
    ((random >> 58) as usize) % variants
}

/// Native normalization and bit mask at14597a321..14597a34a. Retain unknown
/// tags here because their admission still affects a later recovered action.
pub fn nonblocking(tag: u8) -> bool {
    let normalized = tag.checked_sub(3).unwrap_or(29);
    normalized < 32 && (0xa018_0006_u32 & (1 << normalized)) != 0
}

#[derive(Clone, Debug)]
pub struct State {
    pub enemy_id: u32,
    pub variant: usize,
    pub replacement: Option<usize>,
    pub cooldowns: Vec<f32>,
    pub phases_used: u32,
    pub cast_until: f32,
    pub hold_until: f32,
}

#[derive(Debug, Default)]
pub struct Due {
    pub abilities: Vec<RawBossAbility>,
    pub phase_yells: Vec<(usize, &'static str)>,
}

impl State {
    ///14593e130..14593e24f draws from the owning run RNG even if there are
    /// no alternate lists. The same selected list survives a leash reset.
    pub fn new(enemy_id: u32, rng: &mut NativeRng) -> Self {
        let variant = choose_variant(enemy_id, || rng.next_u64());
        Self::for_variant(enemy_id, variant)
    }

    pub fn for_variant(enemy_id: u32, variant: usize) -> Self {
        let moves = signature(enemy_id).map_or(&[][..], |row| row.variants[variant]);
        Self { enemy_id, variant, replacement: None,
            cooldowns: moves.iter().map(|row| row.cooldown * 0.5).collect(),
            phases_used: 0, cast_until: 0.0, hold_until: 0.0 }
    }

    ///145899f39..14589a15e restores the original selected list, rebuilds
    /// its initial timers and clears phase latches. It retains cast/hold
    /// deadlines: those are separate fields and this native lane omits them.
    pub fn reset(&mut self) {
        let moves = signature(self.enemy_id).map_or(&[][..], |row| row.variants[self.variant]);
        self.cooldowns = moves.iter().map(|row| row.cooldown * 0.5).collect();
        self.phases_used = 0;
        self.replacement = None;
    }

    pub fn replace_moves(&mut self, action_index: usize) {
        let row = crate::bosses::raid_native_catalog::ACTIONS[action_index];
        self.replacement = Some(action_index);
        self.cooldowns = row.children.iter().map(|&index|
            crate::bosses::raid_native_catalog::ACTIONS[index].repeat * 0.5 + 1.).collect();
    }

    /// Call after the shared dead/fear/stun/hold/escape admission gates.
    /// Current health controls guardian repeat scaling without a latched boss
    /// enrage. Phase requests precede recurring slots; overdue blocked timers
    /// continue decreasing and do not reset until admitted.
    pub fn advance(&mut self, now: f32, elapsed: f32, health: f32, maximum: f32) -> Due {
        self.advance_for_rank(now, elapsed, health, maximum, 0)
    }

    pub fn advance_for_rank(&mut self, now: f32, elapsed: f32, health: f32, maximum: f32,
        heroic_rank: u8) -> Due {
        let Some(signature) = signature(self.enemy_id) else { return Due::default() };
        let mut due = Due::default();
        let mut blocking_queued = false;
        // Native MAXSS chooses its numeric second operand for a NaN maximum.
        let denominator = if maximum > 1.0 { maximum } else { 1.0 };
        let ratio = health / denominator;
        for (index, phase) in signature.phases.iter().take(32).enumerate() {
            let bit = 1_u32 << index;
            if self.phases_used & bit == 0 && ratio < phase.threshold {
                self.phases_used |= bit;
                blocking_queued |= !nonblocking(phase.native_tag);
                if let Some(ability) = phase.ability { due.abilities.push(ability); }
                // Native latches/queues the phase before omitting the disabled
                // tower/gaze announcement; recurring admission keeps its state.
                if crate::bosses::abilities::initial_raid_action_enabled_for_rank(phase.native_tag, heroic_rank) {
                    due.phase_yells.push((index, phase.yell));
                }
            }
        }
        let scale = if maximum * 0.3 > health { 0.7 } else { 1.0 };
        let dynamic;
        let moves = if let Some(index) = self.replacement {
            dynamic = crate::bosses::raid_native_catalog::ACTIONS[index].children.iter().map(|&index| {
                let row = crate::bosses::raid_native_catalog::ACTIONS[index];
                Move { native_tag: row.native_tag, cooldown: row.repeat, ability: Some(row.ability) }
            }).collect::<Vec<_>>();
            dynamic.as_slice()
        } else { signature.variants[self.variant] };
        assert_eq!(moves.len(), self.cooldowns.len(), "native guardian move bounds failure");
        for (row, timer) in moves.iter().zip(&mut self.cooldowns) {
            *timer -= elapsed;
            let blocking = !nonblocking(row.native_tag);
            if *timer <= 0.0 && (!blocking || (!(self.cast_until > now) && !blocking_queued)) {
                *timer = row.cooldown * scale;
                blocking_queued |= blocking;
                if let Some(ability) = row.ability { due.abilities.push(ability); }
            }
        }
        due
    }
}
