//! Recovered 0.115.0 in-run party consumers. See coop-game-party-0.115.0.md.
//! The revive helper/clock contract is recovered against 0.119.0; see
//! revive-choice-0.119.0.md. Other consumers retain their owning proof.
//!
//! Slots are native party indices: local is zero, remote heroes start at one.
//! A lobby roster is not an in-run snapshot and must not populate these rows.
use std::fmt::Write;

pub const REVIVE_SECONDS: f32 = 6.0;
pub const REVIVE_RADIUS_SQUARED: f32 = 25.0;
pub const RETARGET_FACTOR: f32 = 0.7;

#[derive(Clone, Debug, Default)]
pub struct PartySpell {
    /// Already localized by the native spell-name/substitution owner.
    pub name: String,
    pub damage: f64,
}

#[derive(Clone, Debug, Default)]
pub struct PartyHero {
    pub slot: usize,
    pub name: String,
    pub class: u8,
    pub position: [f32; 3],
    /// Only 1 is an AI target. States 1 and 2 remain nearby revive helpers;
    /// only state 1 advances the clock, while chooser-only presence holds it.
    pub state: u8,
    pub finished: bool,
    pub health: f32,
    pub max_health: f32,
    pub damage: f64,
    /// Native damage-sorted spell rows, highest first; equal rows retain order.
    pub spells: Vec<PartySpell>,
    pub revive_elapsed: f32,
}

impl PartyHero {
    pub fn can_revive(&self) -> bool {
        matches!(self.state, 1 | 2)
    }

    pub fn down(&self) -> bool {
        self.state == 4 && !self.finished
    }
}

#[derive(Clone, Debug)]
pub struct ReviveInteraction {
    pub helper: usize,
    pub target: usize,
    pub helper_name: String,
    pub target_name: String,
    pub share: f32,
}

/// The simulation caller dispatches the normal health/state/effect consumers.
/// This event does not synthesize an undocumented network message.
#[derive(Clone, Copy, Debug)]
pub struct Revived {
    pub slot: usize,
    pub health: f32,
    pub immunity_spell: u32,
    pub immunity_expires: f32,
}

#[derive(Clone, Debug, Default)]
pub struct Party {
    /// Current run rank, copied with the admitted host game configuration.
    pub heroic_rank: u8,
    /// True only after the actual cooperative run is admitted.
    pub active: bool,
    /// Native damage rows do not exist before the first one-second capture.
    pub meter_captured: bool,
    /// Local first, then native remote order; identities are explicit slot values.
    pub heroes: Vec<PartyHero>,
    pub interactions: Vec<ReviveInteraction>,
}

fn distance_squared(a: [f32; 3], b: [f32; 3]) -> f32 {
    let dx = a[0] - b[0];
    let dy = a[1] - b[1];
    dx * dx + dy * dy
}

/// Current1459e6cb0 replaces only the four native addon separators.
fn sanitize(text: &str) -> String {
    text.chars()
        .map(|c| if matches!(c, '\t' | ',' | ';' | '=') { ' ' } else { c })
        .collect()
}

pub fn class_key(class: u8) -> &'static str {
    match class {
        2 => "paladin",
        3 => "hunter",
        4 => "rogue",
        5 => "priest",
        7 => "shaman",
        8 => "mage",
        9 => "warlock",
        11 => "druid",
        _ => "warrior",
    }
}

/// Current14590f0f0 partyMeter projection reads class+0x50 through the
///1473328f0 table, with the warrior descriptor as its native default.
pub fn class_color(class: u8) -> &'static str {
    match class {
        2 => "#F58CBA", 3 => "#ABD473", 4 => "#FFF569", 5 => "#FFFFFF",
        7 => "#0070DE", 8 => "#69CCF0", 9 => "#9482C9", 11 => "#FF7D0A",
        _ => "#C79C6E",
    }
}

impl Party {
    pub fn clear(&mut self) {
        *self = Self::default();
    }

    /// Current helper snapshot: XY radius includes its boundary. Choosers
    /// remain interaction rows, but progress counts only state-1 helpers. Each
    /// additional active helper adds 20% to the first helper's rate.
    pub fn update_revives(&mut self, delta: f32, clock: f32) -> Vec<Revived> {
        self.interactions.clear();
        if !self.active {
            return Vec::new();
        }
        // Native collects all helper positions before changing any downed state.
        let helpers: Vec<_> = self.heroes.iter().filter(|hero| hero.can_revive())
            .map(|hero| (hero.slot, hero.position, hero.name.clone(), hero.state == 1)).collect();
        let mut revived = Vec::new();
        for hero in &mut self.heroes {
            if !hero.down() {
                continue;
            }
            let nearby: Vec<_> = helpers.iter().filter(|(slot, position, _, _)| {
                *slot != hero.slot && distance_squared(*position, hero.position) <= REVIVE_RADIUS_SQUARED
            }).collect();
            let advancing = nearby.iter().filter(|(_, _, _, active)| *active).count();
            hero.revive_elapsed = if nearby.is_empty() {
                (hero.revive_elapsed - delta).max(0.0)
            } else if advancing != 0 {
                hero.revive_elapsed + (1.0 + (advancing - 1) as f32 * 0.2) * delta
            } else {
                hero.revive_elapsed
            };
            if hero.revive_elapsed >= crate::heroic::revive_seconds(self.heroic_rank) {
                // Current revive resets the timer/state and restores the rank
                // health share, then refreshes the1020 effect for2s.
                hero.revive_elapsed = 0.0;
                hero.state = 1;
                hero.health = hero.max_health * crate::heroic::revive_health(self.heroic_rank);
                revived.push(Revived { slot: hero.slot, health: hero.health,
                    immunity_spell: 1020, immunity_expires: clock + 2.0 });
            } else {
                let share = (hero.revive_elapsed / crate::heroic::revive_seconds(self.heroic_rank)).max(0.0).min(1.0);
                for (helper, _, helper_name, _) in nearby {
                    self.interactions.push(ReviveInteraction { helper: *helper,
                        target: hero.slot, helper_name: helper_name.clone(),
                        target_name: hero.name.clone(), share });
                }
            }
        }
        revived
    }

    /// 1458f74f0: nearest eligible hero wins initially, with native hysteresis
    /// before replacing an existing target. Equal distances retain input order.
    pub fn select_target(&self, position: [f32; 3], current: Option<usize>) -> Option<usize> {
        if !self.active {
            return current;
        }
        let mut nearest: Option<(&PartyHero, f32)> = None;
        for hero in self.heroes.iter().filter(|hero| hero.state == 1) {
            let distance = distance_squared(position, hero.position);
            if nearest.is_none_or(|(_, best)| distance.total_cmp(&best).is_lt()) {
                nearest = Some((hero, distance));
            }
        }
        let Some((nearest, distance)) = nearest else { return current };
        let previous = current.and_then(|slot| self.heroes.iter()
            .find(|hero| hero.slot == slot && hero.state == 1));
        match previous {
            Some(previous) if distance >= distance_squared(position, previous.position)
                * RETARGET_FACTOR * RETARGET_FACTOR => Some(previous.slot),
            _ => Some(nearest.slot),
        }
    }

    /// 1458f48a0/1459e5520: native seven-column party meter wire payload.
    /// Damage stays f64 until serialization; run time has native f32 precision.
    pub fn meter_payload(&self, clock: f32) -> String {
        if !self.active || !self.meter_captured {
            return String::new();
        }
        let mut rows: Vec<_> = self.heroes.iter().collect();
        rows.sort_by(|a, b| b.damage.total_cmp(&a.damage));
        let total: f64 = rows.iter().map(|hero| hero.damage).sum();
        let seconds = f64::from(clock.max(1.0));
        let denominator = total.max(1.0);
        let mut output = String::new();
        for hero in rows {
            if !output.is_empty() {
                output.push(';');
            }
            let (top_name, top_damage) = hero.spells.first()
                .map_or(("", 0.0), |spell| (spell.name.as_str(), spell.damage));
            let _ = write!(output, "{},{},{:.0},{:.1},{:.4},{},{:.1}",
                sanitize(&hero.name), class_key(hero.class), hero.damage.round(),
                hero.damage / seconds, hero.damage / denominator,
                sanitize(top_name), top_damage / seconds);
        }
        output
    }

    /// 1458f5310: native local-context revive payload, not a party-wide roster.
    pub fn revive_payload(&self, local_slot: usize, running: bool) -> String {
        if !self.active {
            return String::new();
        }
        let Some(hero) = self.heroes.iter().find(|hero| hero.slot == local_slot) else {
            return String::new();
        };
        let mut output = if hero.down() && running {
            let by = self.interactions.iter().find(|row| row.target == local_slot)
                .map_or("", |row| row.helper_name.as_str());
            format!("down=1;share={:.2};by={}",
                (hero.revive_elapsed / crate::heroic::revive_seconds(self.heroic_rank)).max(0.0).min(1.0), sanitize(by))
        } else {
            "down=0".to_owned()
        };
        if hero.can_revive() {
            // Native Iterator::max_by chooses the later row when shares tie.
            if let Some(row) = self.interactions.iter().filter(|row| row.helper == local_slot)
                .max_by(|a, b| a.share.total_cmp(&b.share)) {
                let _ = write!(output, ";reviving={};rshare={:.2}",
                    sanitize(&row.target_name), row.share);
            }
        }
        output
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn hero(slot: usize, state: u8, x: f32) -> PartyHero {
        PartyHero { slot, state, position: [x, 0.0, 0.0],
            name: format!("hero{slot}"), max_health: 120.0, ..Default::default() }
    }

    #[test]
    fn helper_boundary_and_parallel_helpers_keep_single_clock() {
        let mut party = Party { active: true,
            heroes: vec![hero(0, 4, 0.0), hero(1, 1, 5.0), hero(2, 2, -5.0)],
            ..Default::default() };
        assert!(party.update_revives(3.0, 10.0).is_empty());
        assert_eq!(party.heroes[0].revive_elapsed, 3.0);
        assert_eq!(party.interactions.len(), 2);
        assert_eq!(party.revive_payload(0, true), "down=1;share=0.50;by=hero1");
        assert_eq!(party.revive_payload(1, true), "down=0;reviving=hero0;rshare=0.50");
        let restored = party.update_revives(3.0, 13.0);
        assert_eq!(restored.len(), 1);
        assert_eq!(restored[0].health, 60.0);
        assert_eq!(restored[0].immunity_spell, 1020);
        assert_eq!(restored[0].immunity_expires, 15.0);
        assert_eq!(party.heroes[0].state, 1);
        assert_eq!(party.heroes[0].revive_elapsed, 0.0);
        assert!(party.interactions.is_empty());
    }

    #[test]
    fn unsupported_helpers_decay_progress_and_finished_heroes_stay_finished() {
        let mut down = hero(0, 4, 0.0);
        down.revive_elapsed = 0.5;
        let mut party = Party { active: true,
            heroes: vec![down, hero(1, 3, 0.0), hero(2, 1, 5.001)],
            ..Default::default() };
        party.update_revives(1.0, 10.0);
        assert_eq!(party.heroes[0].revive_elapsed, 0.0);
        party.heroes[0].finished = true;
        party.heroes[1].state = 1;
        party.update_revives(8.0, 18.0);
        assert_eq!(party.heroes[0].state, 4);
        assert!(party.interactions.is_empty());
    }

    #[test]
    fn choice_helpers_hold_progress_until_one_fights_or_all_leave() {
        let mut down = hero(0, 4, 0.0);
        down.revive_elapsed = 2.0;
        let mut party = Party { active: true,
            heroes: vec![down, hero(1, 2, 5.0), hero(2, 2, -5.0)],
            ..Default::default() };
        assert!(party.update_revives(0.5, 10.0).is_empty());
        assert_eq!(party.heroes[0].revive_elapsed, 2.0);
        assert_eq!(party.interactions.len(), 2);
        assert_eq!(party.revive_payload(0, true), "down=1;share=0.33;by=hero1");
        assert_eq!(party.revive_payload(1, true), "down=0;reviving=hero0;rshare=0.33");

        // One active friend advances once even while another still chooses.
        party.heroes[2].state = 1;
        assert!(party.update_revives(0.5, 10.5).is_empty());
        assert_eq!(party.heroes[0].revive_elapsed, 2.5);
        party.heroes[2].state = 2;
        party.update_revives(0.5, 11.0);
        assert_eq!(party.heroes[0].revive_elapsed, 2.5);

        // Losing the final nearby helper decays rather than holding/resetting.
        party.heroes[1].position[0] = 5.001;
        party.heroes[2].state = 4;
        party.update_revives(0.5, 11.5);
        assert_eq!(party.heroes[0].revive_elapsed, 2.0);
        assert!(party.interactions.is_empty());
    }

    #[test]
    fn chooser_resume_completes_local_and_remote_revives() {
        for down_slot in [0, 1] {
            let helper_slot = 1 - down_slot;
            let mut down = hero(down_slot, 4, 0.0);
            down.revive_elapsed = 5.5;
            let mut party = Party { active: true,
                heroes: vec![down, hero(helper_slot, 2, 0.0)],
                ..Default::default() };
            assert!(party.update_revives(1.0, 20.0).is_empty());
            assert_eq!(party.heroes[0].revive_elapsed, 5.5);
            assert_eq!(party.interactions[0].helper, helper_slot);
            party.heroes[1].state = 1;
            let revived = party.update_revives(0.5, 20.5);
            assert_eq!(revived.len(), 1);
            assert_eq!(revived[0].slot, down_slot);
            assert_eq!(revived[0].health, 60.0);
            assert_eq!(revived[0].immunity_spell, 1020);
            assert_eq!(revived[0].immunity_expires, 22.5);
            assert_eq!(party.heroes[0].state, 1);
            assert_eq!(party.heroes[0].revive_elapsed, 0.0);
            assert!(party.interactions.is_empty());
        }
    }

    #[test]
    fn parallel_revivers_count_fighters_without_counting_choosers() {
        for down_slot in [0, 1] {
            for fighters in 1..=4 {
                let mut heroes = vec![hero(down_slot, 4, 0.0)];
                for index in 0..4 {
                    let slot = (0..5).filter(|slot| *slot != down_slot).nth(index).unwrap();
                    heroes.push(hero(slot, if index < fighters { 1 } else { 2 }, 0.0));
                }
                let mut party = Party { active: true, heroes, ..Default::default() };
                assert!(party.update_revives(1.0, 10.0).is_empty());
                let expected = 1.0 + (fighters - 1) as f32 * 0.2;
                assert_eq!(party.heroes[0].revive_elapsed, expected);
                assert_eq!(party.interactions.len(), 4);
                for row in &party.interactions {
                    assert_eq!(row.share, expected / 6.0);
                }
                // A helper opening cards stops contributing its bonus without
                // discarding accumulated progress or the interaction row.
                party.heroes[1].state = 2;
                party.update_revives(0.5, 10.5);
                let remaining = fighters - 1;
                let increment = if remaining == 0 { 0.0 }
                    else { (1.0 + (remaining - 1) as f32 * 0.2) * 0.5 };
                assert_eq!(party.heroes[0].revive_elapsed, expected + increment);
            }
        }
    }

    #[test]
    fn targeting_retains_current_until_strict_hysteresis_threshold() {
        let mut party = Party { active: true,
            heroes: vec![hero(0, 1, 10.0), hero(1, 1, 8.0)],
            ..Default::default() };
        assert_eq!(party.select_target([0.0; 3], Some(0)), Some(0));
        party.heroes[1].position[0] = 6.0;
        assert_eq!(party.select_target([0.0; 3], Some(0)), Some(1));
        party.heroes[1].state = 2;
        assert_eq!(party.select_target([0.0; 3], Some(1)), Some(0));
        party.heroes[0].state = 4;
        assert_eq!(party.select_target([0.0; 3], Some(1)), Some(1));
    }

    #[test]
    fn party_wire_payload_uses_raw_damage_and_stable_equal_order() {
        let mut first = hero(0, 1, 0.0);
        first.name = "A,=;\t".into();
        first.class = 8;
        first.damage = 12.5;
        first.spells.push(PartySpell { name: "top;spell".into(), damage: 10.0 });
        let mut second = hero(1, 1, 0.0);
        second.damage = 12.5;
        let party = Party { active: true, meter_captured: true,
            heroes: vec![first, second], ..Default::default() };
        assert_eq!(party.meter_payload(2.0),
            "A    ,mage,13,6.2,0.5000,top spell,5.0;hero1,warrior,13,6.2,0.5000,,0.0");
        assert_eq!(Party::default().meter_payload(1.0), "");
        assert_eq!(Party::default().revive_payload(0, true), "");
    }

    #[test]
    fn equal_revive_shares_choose_last_target() {
        let party = Party { heroic_rank: 0, active: true, meter_captured: false, heroes: vec![hero(0, 1, 0.0)],
            interactions: vec![
                ReviveInteraction { helper: 0, target: 1, helper_name: "h".into(),
                    target_name: "one".into(), share: 0.5 },
                ReviveInteraction { helper: 0, target: 2, helper_name: "h".into(),
                    target_name: "two".into(), share: 0.5 },
            ] };
        assert_eq!(party.revive_payload(0, true), "down=0;reviving=two;rshare=0.50");
    }
}
