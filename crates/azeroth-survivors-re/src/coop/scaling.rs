//! 0.127.0 party-count arithmetic. Live heroes select the extra-player term;
//! the retained other-hero collection separately selects the party reduction.
//! See docs/analysis/coop-scaling-0.127.0.md.

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PartyScaling {
    pub health: [f32; 2],
    pub density: f32,
    pub incoming_damage: f32,
}

impl PartyScaling {
    pub fn new(live_heroes: usize, zone_index: usize, has_other_heroes: bool) -> Self {
        let zone = if zone_index < 3 { 0.7 } else { 1.0 };
        let extra = (live_heroes.max(1) - 1) as f32 * zone;
        let party = if has_other_heroes { 0.8 } else { 1.0 };
        Self {
            health: [(extra * 0.72 + 1.0) * party, (extra * 1.04 + 1.0) * party],
            density: extra * 0.312 + 1.0,
            incoming_damage: (extra * 0.064 + 1.0) * party,
        }
    }

    /// The same denominator is used by the private XP/gold grants.
    pub fn reward(self) -> f32 { 1.0 / self.density }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn party_presence_is_independent_of_the_live_hero_count() {
        let solo = PartyScaling::new(1, 3, false);
        assert_eq!(solo.health, [1.0; 2]);
        assert_eq!(solo.incoming_damage, 1.0);
        let downed_party = PartyScaling::new(1, 3, true);
        assert_eq!(downed_party.health, [0.8; 2]);
        assert_eq!(downed_party.incoming_damage, 0.8);
        assert_eq!(downed_party.density, 1.0);
    }

}
