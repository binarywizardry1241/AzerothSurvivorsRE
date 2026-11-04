//! 0.105.0 Game+548 is one player-mover sequence, separate from actor Game+908.
//! Packet/initializer contracts: docs/analysis/evidence/0.105.0/terminal/
//! continuation-effects-contracts.json and player-mover-contracts.json.

use super::{Mechanics, RunEvent};

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum PlayerMoverEvent {
    RunSpeed {
        counter: u32,
        speed: f32,
    },
    Teleport {
        counter: u32,
        position: [f32; 3],
        facing: f32,
    },
    Root {
        counter: u32,
        apply: bool,
    },
    Knockback { counter: u32, angle: f32, speed: f32 },
}

#[derive(Debug)]
pub(super) struct PlayerMover {
    sequence: u32,
    run_speed: f32,
    ready: bool,
    raid_root_until: f32,
    raid_root_count: usize,
    raid_root_reopens_at: f32,
}

impl Default for PlayerMover {
    fn default() -> Self {
        // Constructor1459009a9..9c2, Game+548=1 and Game+54c=7.0.
        Self {
            sequence: 1,
            run_speed: 7.0,
            ready: false,
            raid_root_until: 0.0,
            raid_root_count: 0,
            raid_root_reopens_at: 0.0,
        }
    }
}

impl PlayerMover {
    fn raid_root_scale(&mut self, now: f32) -> Option<f32> {
        if self.raid_root_reopens_at > now {
            return None;
        }
        const SCALES: [f32; 5] = [1.0, 0.8, 0.6, 0.4, 0.2];
        let Some(&scale) = SCALES.get(self.raid_root_count) else {
            // The sixth request starts the cooldown. Expiry alone never
            // replenishes the five admitted applications.
            self.raid_root_count = 0;
            self.raid_root_reopens_at = now + 8.0;
            return None;
        };
        self.raid_root_count += 1;
        Some(scale)
    }

    pub(super) fn knockback(&mut self, angle: f32, speed: f32) -> PlayerMoverEvent {
        PlayerMoverEvent::Knockback { counter: self.next(), angle, speed }
    }
    fn next(&mut self) -> u32 {
        let counter = self.sequence;
        self.sequence = self.sequence.wrapping_add(1);
        counter
    }

    fn speed(&mut self, speed: f32) -> Option<PlayerMoverEvent> {
        //1458fa0da..0f5: UCOMISS/JBE also suppresses an unordered difference.
        // Keep the last SENT value; sub-epsilon requests must not drift its baseline.
        if (speed - self.run_speed).abs() > 0.01 {
            self.run_speed = speed;
            let counter = self.next();
            Some(PlayerMoverEvent::RunSpeed { counter, speed })
        } else {
            None
        }
    }

    fn root(&mut self, apply: bool) -> PlayerMoverEvent {
        let counter = self.next();
        PlayerMoverEvent::Root { counter, apply }
    }

    pub(super) fn teleport(&mut self, position: [f32; 3], facing: f32) -> PlayerMoverEvent {
        let counter = self.next();
        PlayerMoverEvent::Teleport {
            counter,
            position,
            facing,
        }
    }
}

impl Mechanics {
    /// Native1458fa0cf multiplies the final movement lane by exactly7.0.
    pub(super) fn refresh_player_run_speed(&mut self) {
        if self.player_mover.ready {
            if let Some(event) = self.player_mover.speed(7.0 * self.movement_multiplier()) {
                self.events.push(RunEvent::PlayerMover(event));
            }
        }
    }

    /// The constructor refreshes movement once after initial equipment/talent/race
    /// composition. Intermediate setup refreshes do not send phantom speed packets.
    pub fn finish_player_entry(&mut self) {
        if !self.player_mover.ready {
            self.player_mover.ready = true;
            self.refresh_player_run_speed();
        }
    }

    pub fn player_run_speed(&self) -> f32 {
        self.player_mover.run_speed
    }

    pub(in crate::gameplay) fn player_mover_sequence(&self) -> u32 {
        self.player_mover.sequence
    }

    ///0.123.0 command6 clears the retained player's aura IDs/flags in its fresh
    /// descriptor, then sends unroot, relocation and the new Game's cached speed
    /// unconditionally. Fresh constructor packets follow this direct publication.
    pub(in crate::gameplay) fn restart_player_entry(
        &mut self, previous_sequence: u32, position: [f32; 3], facing: f32,
    ) {
        let clear_auras = RunEvent::Aura {
            target: self.player_guid,
            spell_id: 0,
            present: true,
            fields: (47..101).map(|field| (field, 0)).collect(),
        };
        self.player_mover.sequence = previous_sequence.wrapping_add(10);
        let unroot = self.player_mover.root(false);
        let teleport = self.player_mover.teleport(position, facing);
        // The ordinary deadband is intentionally bypassed here: the retained
        // client may still hold a previous run's rune speed even when this new
        // Game's initial cached speed is the default7.0.
        let speed = PlayerMoverEvent::RunSpeed {
            counter: self.player_mover.next(),
            speed: self.player_mover.run_speed,
        };
        self.events.splice(0..0, [clear_auras, RunEvent::PlayerMover(unroot),
            RunEvent::PlayerMover(teleport), RunEvent::PlayerMover(speed)]);
    }

    /// The report-driven correction uses serializer1458b57d0 (opcode0xc7).
    /// Its floor owner already supplies the adjusted XYZ; do not add another Z offset.
    pub fn relocate_player(&mut self, position: [f32; 3], facing: f32) {
        let event = self.player_mover.teleport(position, facing);
        self.events.push(RunEvent::PlayerMover(event));
    }

    pub(super) fn root_player(&mut self, apply: bool) {
        let event = self.player_mover.root(apply);
        self.events.push(RunEvent::PlayerMover(event));
    }

    pub(super) fn expire_raid_root(&mut self) {
        let until = self.player_mover.raid_root_until;
        if until > 0.0 && self.clock >= until {
            self.player_mover.raid_root_until = 0.0;
            self.root_player(false);
        }
    }

    pub(super) fn apply_raid_root(&mut self, source: u64, spell: u32, duration: f32) {
        use azeroth_survivors_re::bosses::abilities::{CastTarget, SpellCast};

        if !self.active_run_state() {
            return;
        }
        let Some(scale) = self.player_mover.raid_root_scale(self.clock) else {
            return;
        };
        self.events.push(RunEvent::Spell(SpellCast {
            source_guid: source,
            spell_id: spell,
            target: CastTarget::Unit(self.player_guid),
            hit_targets: vec![self.player_guid],
        }));
        let until = self.player_mover.raid_root_until;
        if !(until > 0.0) {
            self.root_player(true);
        }
        self.player_mover.raid_root_until = until.max(duration * scale + self.clock);
    }

    /// The terminal UI may resume between regular packet-dispatch frames.
    /// Drain only mover packets before its notice; preserve all other run events.
    pub(crate) fn drain_player_mover(&mut self) -> Vec<PlayerMoverEvent> {
        let mut movers = Vec::new();
        self.events.retain(|event| {
            if let RunEvent::PlayerMover(mover) = event {
                movers.push(*mover);
                false
            } else {
                true
            }
        });
        movers
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn raid_root_publishes_target_then_root_and_diminishes_until_the_sixth_request() {
        use azeroth_survivors_re::bosses::abilities::CastTarget;

        let mut game = super::super::tests::class_run("warrior", 1);
        for (index, scale) in [1.0, 0.8, 0.6, 0.4, 0.2].into_iter().enumerate() {
            game.clock = index as f32 * 3.0 + 1.0;
            game.expire_raid_root();
            game.events.clear();
            game.apply_raid_root(88, 745, 2.0);
            assert_eq!(game.player_mover.raid_root_until, game.clock + 2.0 * scale);
            assert!(matches!(&game.events[..], [
                RunEvent::Spell(cast),
                RunEvent::PlayerMover(PlayerMoverEvent::Root { apply: true, .. }),
            ] if cast.source_guid == 88 && cast.spell_id == 745
                && cast.target == CastTarget::Unit(game.player_guid)
                && cast.hit_targets == [game.player_guid]));
        }
        game.clock = game.player_mover.raid_root_until;
        game.events.clear();
        game.expire_raid_root();
        assert!(matches!(&game.events[..], [
            RunEvent::PlayerMover(PlayerMoverEvent::Root { apply: false, .. }),
        ]));
        game.events.clear();
        game.apply_raid_root(88, 745, 2.0);
        game.clock += 7.0;
        game.apply_raid_root(88, 745, 2.0);
        assert!(game.events.is_empty());
        game.clock += 1.0;
        game.apply_raid_root(88, 745, 2.0);
        assert_eq!(game.player_mover.raid_root_until, game.clock + 2.0);
    }

    #[test]
    fn again_clears_old_aura_fields_and_unconditionally_restores_fresh_run_speed() {
        use azeroth_survivors_re::run_pickups::Rune;
        let mut old = super::super::tests::class_run("warrior", 1);
        old.finish_player_entry();
        old.collect_rune(Rune::Speed);
        assert!(old.player_run_speed() > 7.0);
        assert!(old.player_auras().iter().flatten().any(|aura| aura.spell_id == 23451));
        let previous = old.player_mover_sequence();
        let mut next = super::super::tests::class_run("warrior", 1);
        next.finish_player_entry();
        let fresh_auras = *next.player_auras();
        next.restart_player_entry(previous, [1.0, 2.0, 3.0], 0.5);
        assert!(matches!(&next.events[0], RunEvent::Aura { target, fields, .. }
            if *target == next.player_guid && fields == &(47..101).map(|field| (field, 0)).collect::<Vec<_>>()));
        assert_eq!(next.drain_player_mover(), [
            PlayerMoverEvent::Root { counter: previous.wrapping_add(10), apply: false },
            PlayerMoverEvent::Teleport { counter: previous.wrapping_add(11),
                position: [1.0, 2.0, 3.0], facing: 0.5 },
            PlayerMoverEvent::RunSpeed { counter: previous.wrapping_add(12), speed: 7.0 },
        ]);
        assert_eq!(next.player_mover_sequence(), previous.wrapping_add(13));
        assert_eq!(*next.player_auras(), fresh_auras);
        assert!(next.execution.auras.is_empty());
    }

    #[test]
    fn again_retains_new_entry_bonuses_constructor_packets_and_wrapping_serials() {
        let mut next = super::super::tests::class_run("warrior", 1);
        next.set_base_movement_multiplier(1.2);
        next.finish_player_entry();
        let fresh_speed = next.player_run_speed();
        next.restart_player_entry(u32::MAX - 11, [4.0, 5.0, 6.0], 1.0);
        assert_eq!(next.drain_player_mover(), [
            PlayerMoverEvent::Root { counter: u32::MAX - 1, apply: false },
            PlayerMoverEvent::Teleport { counter: u32::MAX, position: [4.0, 5.0, 6.0], facing: 1.0 },
            PlayerMoverEvent::RunSpeed { counter: 0, speed: fresh_speed },
            PlayerMoverEvent::RunSpeed { counter: 1, speed: fresh_speed },
        ]);
        assert_eq!(next.player_mover_sequence(), 1);
    }

    #[test]
    fn entry_composes_initial_speed_once_and_each_run_starts_with_a_fresh_sequence() {
        let mut game = super::super::tests::class_run("warrior", 1);
        game.set_base_movement_multiplier(1.1);
        game.set_base_movement_multiplier(1.2);
        assert!(game.drain_player_mover().is_empty());
        assert_eq!(game.player_run_speed(), 7.0);
        game.finish_player_entry();
        let speed = 7.0 * game.movement_multiplier();
        assert_eq!(
            game.drain_player_mover(),
            vec![PlayerMoverEvent::RunSpeed { counter: 1, speed }]
        );
        game.finish_player_entry();
        assert!(game.drain_player_mover().is_empty());
        game.relocate_player([1.0, 2.0, 3.0], 0.5);
        game.events.push(RunEvent::PlaySound(888));
        game.root_player(true);
        assert_eq!(
            game.drain_player_mover(),
            vec![
                PlayerMoverEvent::Teleport {
                    counter: 2,
                    position: [1.0, 2.0, 3.0],
                    facing: 0.5
                },
                PlayerMoverEvent::Root {
                    counter: 3,
                    apply: true
                }
            ]
        );
        assert!(
            game.events
                .iter()
                .any(|event| matches!(event, RunEvent::PlaySound(888)))
        );
        let mut next = super::super::tests::class_run("warrior", 1);
        next.finish_player_entry();
        next.root_player(true);
        assert_eq!(
            next.drain_player_mover(),
            vec![PlayerMoverEvent::Root {
                counter: 1,
                apply: true
            }]
        );
    }

    #[test]
    fn speed_teleport_root_and_unroot_share_one_wrapping_sequence() {
        let mut mover = PlayerMover::default();
        // Native constructor refresh need not consume sequence1.
        assert_eq!(mover.speed(7.0), None);
        let packets = vec![
            mover.speed(8.0).unwrap(),
            mover.teleport([1.0, 2.0, 3.0], 0.5),
            mover.root(true),
            mover.root(false),
        ];
        assert_eq!(
            packets,
            vec![
                PlayerMoverEvent::RunSpeed {
                    counter: 1,
                    speed: 8.0
                },
                PlayerMoverEvent::Teleport {
                    counter: 2,
                    position: [1.0, 2.0, 3.0],
                    facing: 0.5
                },
                PlayerMoverEvent::Root {
                    counter: 3,
                    apply: true
                },
                PlayerMoverEvent::Root {
                    counter: 4,
                    apply: false
                }
            ]
        );
        mover.sequence = u32::MAX;
        assert_eq!(
            mover.root(true),
            PlayerMoverEvent::Root {
                counter: u32::MAX,
                apply: true
            }
        );
        assert_eq!(
            mover.root(false),
            PlayerMoverEvent::Root {
                counter: 0,
                apply: false
            }
        );
        assert_eq!(mover.sequence, 1);
    }

    #[test]
    fn speed_deadband_and_unordered_values_preserve_the_sent_baseline() {
        let mut mover = PlayerMover::default();
        assert_eq!(mover.speed(7.005), None);
        assert_eq!(mover.speed(f32::NAN), None);
        assert_eq!(mover.run_speed, 7.0);
        assert_eq!(mover.sequence, 1);
        assert_eq!(
            mover.speed(7.011),
            Some(PlayerMoverEvent::RunSpeed {
                counter: 1,
                speed: 7.011
            })
        );
        assert_eq!(mover.run_speed, 7.011);
        assert_eq!(mover.sequence, 2);
    }
}
