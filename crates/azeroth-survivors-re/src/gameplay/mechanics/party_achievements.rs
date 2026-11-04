//! Current0.121.0 shared party-feat inputs, separate from private hero history.
use super::*;
use azeroth_survivors_re::coop::replication::{NativeFeatEvent, NativeFeatMember};

#[derive(Debug, Default)]
pub(super) struct State {
    pub members: Vec<NativeFeatMember>,
    pub events: Vec<NativeFeatEvent>,
    pub deaths: u32,
    pub initial_member_count: u8,
    pub first_fall: Option<f32>,
}

/// Native145b7d10a/145c22000: a tied highest rank has no selected spell.
pub(super) fn member(class: u8, abilities: &[RuntimeInstance<'_>], talents: &[(String, u8)], active_set: u8) -> NativeFeatMember {
    let highest = abilities.iter().map(|row| row.rank).max();
    let mut best = abilities.iter().filter(|row| Some(row.rank) == highest);
    let word = best.next().filter(|_| best.next().is_none())
        .map_or(0, |row| row.definition.spell_id);
    let byte = u8::from(talents.iter().any(|(key, _)| key == "tranquility"))
        | (u8::from(talents.iter().any(|(key, _)| key == "bladestorm")) << 1);
    NativeFeatMember { class, word, byte, active_set }
}
