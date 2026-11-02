//! Historical guardian state and combat inputs recovered from the 0.97.2 EXE.
//! The live 0.109.0 recurring abilities use `signatures`, rather than the
//! historical universal three-ability contract retained for provenance/tests.
//!
//! Owning code: `14550a0a0..14550a1cf` (state decisions) and
//! `1454caa55..1454cae7d` (guardian timers). Terrain, movement packets,
//! spell rendering and actor collections require the original engine adapters.

use super::{placement::LairTerrain, Position};

pub const INITIAL_COOLDOWNS: [f32; 3] = [4.5, 3.5, 8.0];
pub const REPEAT_COOLDOWNS: [f32; 3] = [9.0, 7.0, 16.0];
pub const MINION_YELL: &str = "Minions, to me!";

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum GuardianAbility {
    /// Native ability discriminant 4, spell 100.
    Charge,
    /// Native ability discriminant 3, spell 6343, radius 8, damage factor 1.4.
    AreaStrike,
    /// Native ability discriminant 2, four adds at radius 5.
    SummonMinions,
}

pub const ABILITIES: [GuardianAbility; 3] = [
    GuardianAbility::Charge,
    GuardianAbility::AreaStrike,
    GuardianAbility::SummonMinions,
];

/// Original ability records at VA 1469aab94, retained without an invented ABI.
pub const ABILITY_WORDS: [[u32; 7]; 3] = [
    [4, 100, 0, 0, 0, 0, 9.0_f32.to_bits()],
    [
        3,
        6343,
        8.0_f32.to_bits(),
        1.4_f32.to_bits(),
        0,
        0,
        7.0_f32.to_bits(),
    ],
    [2, 4, 0, 0, 0, 0, 16.0_f32.to_bits()],
];

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Movement {
    pub from: Position,
    pub to: Position,
    pub started_at: f32,
    pub duration: f32,
}

impl Movement {
    /// The native actor position interpolator; guardian state uses only XY.
    pub fn position_at(self, now: f32) -> Position {
        if self.duration <= 0.0 {
            return self.to;
        }
        let fraction = (now - self.started_at) / self.duration;
        // MAXSS/MINSS choose their second operand for unordered comparisons.
        let fraction = if 0.0 > fraction { 0.0 } else { fraction };
        let fraction = if 1.0 < fraction { 1.0 } else { fraction };
        Position {
            x: fraction * (self.to.x - self.from.x) + self.from.x,
            y: fraction * (self.to.y - self.from.y) + self.from.y,
            z: fraction * (self.to.z - self.from.z) + self.from.z,
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum GuardianDecision {
    /// Native result 0: stay home, or resume a completed return path when
    /// farther than two XY units from home. Combat timers do not advance.
    Idle,
    /// Native result 1: engage and refresh scaling at the current run time.
    Engage,
    /// Native result 2: restore health, clear periodic effects and slow fields,
    /// cancel the current cast and move home. Timers retain their values.
    Reset { restored_health: f32 },
    /// Native result 3: continue ordinary actor combat.
    Combat,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct GuardianAiState {
    pub awake: bool,
    pub cooldowns: [f32; 3],
}

impl Default for GuardianAiState {
    fn default() -> Self {
        Self {
            awake: false,
            cooldowns: INITIAL_COOLDOWNS,
        }
    }
}

fn distance_xy(a: Position, b: Position) -> f32 {
    let dx = a.x - b.x;
    let dy = a.y - b.y;
    // The EXE uses these scalar multiplies, add and sqrt, not hypotf.
    (dy * dy + dx * dx).sqrt()
}

impl GuardianAiState {
    /// `14550a0a0`. A caller applies reset effects to its actual actor state.
    /// Lair lookup failure in the caller substitutes the current actor position.
    pub fn evaluate(
        &mut self,
        current: Position,
        home: Position,
        player: Position,
        health: f32,
        max_health: f32,
    ) -> GuardianDecision {
        if self.awake {
            // Leash is the player's distance from home, rather than the
            // guardian's distance from home or from the player.
            if distance_xy(home, player) > 97.5 {
                self.awake = false;
                return GuardianDecision::Reset {
                    restored_health: max_health,
                };
            }
            return GuardianDecision::Combat;
        }

        let close_to_home = distance_xy(current, home) <= 3.0;
        let player_nearby = distance_xy(current, player) <= 20.0;
        if health < max_health || (close_to_home && player_nearby) {
            self.awake = true;
            GuardianDecision::Engage
        } else {
            GuardianDecision::Idle
        }
    }

    /// `1454cad3b..1454cae18`, called only after the original actor's earlier
    /// dead/stun/path gates and an Engage/Combat decision. Every elapsed timer
    /// fires once in slot order; overshoot is discarded by the original.
    pub fn advance_cooldowns(
        &mut self,
        elapsed: f32,
        health: f32,
        max_health: f32,
    ) -> Vec<GuardianAbility> {
        let repeat_scale = if max_health * 0.3 > health { 0.7 } else { 1.0 };
        let mut due = Vec::with_capacity(3);
        for (index, timer) in self.cooldowns.iter_mut().enumerate() {
            *timer -= elapsed;
            // Unordered comparisons take the native JB skip branch.
            if *timer <= 0.0 {
                *timer = REPEAT_COOLDOWNS[index] * repeat_scale;
                due.push(ABILITIES[index]);
            }
        }
        due
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct MinionSpawn {
    pub enemy_index: usize,
    pub xy: [f32; 2],
}

/// `1454ccd73..1454ccf1f`. Height is queried by the caller at each XY position.
pub fn minion_spawns(guardian: Position) -> [MinionSpawn; 4] {
    std::array::from_fn(|index| {
        let angle = index as f32 / 4.0 * f32::from_bits(0x40c9_0fdb);
        MinionSpawn {
            enemy_index: usize::from(index % 3 == 2),
            xy: [
                angle.cos() * 5.0 + guardian.x,
                angle.sin() * 5.0 + guardian.y,
            ],
        }
    })
}

/// `1454cd9cc..1454cda07`: a charge always lasts at least 1.1 seconds.
/// Endpoint collision/terrain queries happen before this calculation.
pub fn charge_duration(from: Position, collision_adjusted_to: Position) -> f32 {
    let duration = distance_xy(from, collision_adjusted_to) / 24.0;
    if duration > 1.1 {
        duration
    } else {
        1.1
    }
}

/// Contact with a ray obstacle is backed off half a unit before charging.
/// `ray_fraction` is the original engine's segment query result.
pub fn charge_endpoint(from: Position, target: Position, ray_fraction: f32) -> Position {
    if ray_fraction >= 1.0 {
        return target;
    }
    let margin = 0.5 / distance_xy(from, target).max(0.5);
    let fraction = (ray_fraction - margin).max(0.0);
    Position {
        x: (target.x - from.x) * fraction + from.x,
        y: (target.y - from.y) * fraction + from.y,
        // Native charge re-samples endpoint terrain after segment clipping.
        z: target.z,
    }
}

#[derive(Clone, Copy, Debug)]
pub struct CombatContext {
    pub source_guid: u64,
    pub player_guid: u64,
    pub now: f32,
    pub guardian: Position,
    pub player: Position,
    /// Ordinary actor damage after its active damage modifier. Boss-only
    /// enrage does not apply to the guardian path.
    pub effective_damage: f32,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct AreaStrikeRequest {
    pub source_guid: u64,
    pub spell_id: u32,
    pub center: Position,
    pub radius: f32,
    pub damage: f32,
    pub resolves_at: f32,
    /// Direct area attacks display their spell even for `Some(false)`.
    /// Deferred attacks use `None`: query the player's position at resolution.
    pub player_in_range: Option<bool>,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ChargeRequest {
    pub source_guid: u64,
    pub target_guid: u64,
    pub spell_id: u32,
    pub movement: Movement,
    /// Actor+0x12c, overwritten by the native charge.
    pub next_move_at: f32,
    /// Actor+0x130 is a remaining attack delay, not an absolute timestamp.
    pub attack_delay: f32,
    pub followup: AreaStrikeRequest,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct MinionRequest {
    pub enemy_index: usize,
    pub position: Position,
}

/// Engine operations used by the three recovered unique guardian abilities.
/// Production implementations must bind actual collision, terrain, spell,
/// network and actor systems. This trait supplies no replacement world.
pub trait GuardianCombatPort: LairTerrain {
    /// Original XY ray query. `None` represents an absent collision grid.
    fn ray_fraction(&self, from: Position, to: Position) -> Option<f32>;
    fn cast_area_strike(&mut self, request: AreaStrikeRequest);
    /// Emit spell100 on the player, install the movement and its two timing
    /// fields, and schedule the arrival area attack. Do not hit immediately.
    fn begin_charge(&mut self, request: ChargeRequest);
    fn yell(&mut self, source_guid: u64, text: &'static str);
    fn spawn_minion(&mut self, request: MinionRequest);
}

fn combat_height<T: LairTerrain + ?Sized>(terrain: &T, x: f32, y: f32) -> f32 {
    terrain
        .adt_height(x, y)
        .or_else(|| terrain.wmo_height(x, y))
        .unwrap_or_else(|| terrain.fallback_height())
}

impl GuardianAbility {
    /// Native ability dispatch `1454ccbb0..1454cdd0b`. Ordinary actor gates
    /// (dead, stun, cast, path, melee and aura processing) precede this stage.
    pub fn dispatch<P: GuardianCombatPort + ?Sized>(self, context: CombatContext, port: &mut P) {
        match self {
            Self::AreaStrike => {
                port.cast_area_strike(AreaStrikeRequest {
                    source_guid: context.source_guid,
                    spell_id: 6343,
                    center: context.guardian,
                    radius: 8.0,
                    damage: context.effective_damage * 1.4,
                    resolves_at: context.now,
                    player_in_range: Some(distance_xy(context.guardian, context.player) <= 8.0),
                });
            }
            Self::SummonMinions => {
                port.yell(context.source_guid, MINION_YELL);
                for spawn in minion_spawns(context.guardian) {
                    port.spawn_minion(MinionRequest {
                        enemy_index: spawn.enemy_index,
                        position: Position {
                            x: spawn.xy[0],
                            y: spawn.xy[1],
                            z: combat_height(port, spawn.xy[0], spawn.xy[1]),
                        },
                    });
                }
            }
            Self::Charge => {
                let target = Position {
                    z: combat_height(port, context.player.x, context.player.y),
                    ..context.player
                };
                let ray_fraction = port.ray_fraction(context.guardian, target).unwrap_or(1.0);
                let mut destination = charge_endpoint(context.guardian, target, ray_fraction);
                destination.z = combat_height(port, destination.x, destination.y);
                // Native movement's source Z is sampled from ADT if available;
                // otherwise it retains the interpolated actor Z.
                let from = Position {
                    z: port
                        .adt_height(context.guardian.x, context.guardian.y)
                        .unwrap_or(context.guardian.z),
                    ..context.guardian
                };
                let duration = charge_duration(from, destination);
                let arrives_at = context.now + duration;
                port.begin_charge(ChargeRequest {
                    source_guid: context.source_guid,
                    target_guid: context.player_guid,
                    spell_id: 100,
                    movement: Movement {
                        from,
                        to: destination,
                        started_at: context.now,
                        duration,
                    },
                    next_move_at: arrives_at + 0.2,
                    attack_delay: duration + 0.3,
                    followup: AreaStrikeRequest {
                        source_guid: context.source_guid,
                        spell_id: 6343,
                        center: destination,
                        radius: 4.5,
                        damage: context.effective_damage * 2.0,
                        resolves_at: arrives_at,
                        player_in_range: None,
                    },
                });
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    fn position(x: f32, y: f32) -> Position {
        Position { x, y, z: 0.0 }
    }

    #[test]
    fn detection_and_leash_boundaries_are_inclusive_in_xy() {
        let mut state = GuardianAiState::default();
        let home = position(0.0, 0.0);
        let player = Position {
            x: 20.0,
            y: 0.0,
            z: 900.0,
        };
        assert_eq!(
            state.evaluate(home, home, player, 100.0, 100.0),
            GuardianDecision::Engage
        );
        assert_eq!(
            state.evaluate(home, home, position(97.5, 0.0), 75.0, 100.0),
            GuardianDecision::Combat
        );
        assert_eq!(
            state.evaluate(home, home, position(97.501, 0.0), 75.0, 100.0),
            GuardianDecision::Reset {
                restored_health: 100.0
            }
        );
        assert!(!state.awake);
    }

    #[test]
    fn a_damaged_guardian_wakes_even_while_far_from_home() {
        let mut state = GuardianAiState::default();
        assert_eq!(
            state.evaluate(
                position(50.0, 0.0),
                position(0.0, 0.0),
                position(80.0, 0.0),
                99.0,
                100.0
            ),
            GuardianDecision::Engage
        );
    }

    #[test]
    fn healthy_returning_guardian_requires_home_proximity() {
        let mut state = GuardianAiState::default();
        assert_eq!(
            state.evaluate(
                position(3.001, 0.0),
                position(0.0, 0.0),
                position(3.001, 0.0),
                100.0,
                100.0
            ),
            GuardianDecision::Idle
        );
        assert_eq!(
            state.evaluate(
                position(3.0, 0.0),
                position(0.0, 0.0),
                position(3.0, 0.0),
                100.0,
                100.0
            ),
            GuardianDecision::Engage
        );
    }

    #[test]
    fn cooldowns_fire_once_and_use_the_health_at_expiry() {
        let mut state = GuardianAiState::default();
        assert_eq!(
            state.advance_cooldowns(4.0, 100.0, 100.0),
            vec![GuardianAbility::AreaStrike]
        );
        assert_eq!(state.cooldowns, [0.5, 7.0, 4.0]);
        assert_eq!(state.advance_cooldowns(20.0, 29.0, 100.0), ABILITIES);
        assert_eq!(state.cooldowns, [9.0 * 0.7, 7.0 * 0.7, 16.0 * 0.7]);
        state.cooldowns = [0.0; 3];
        state.advance_cooldowns(0.0, 100.0 * 0.3, 100.0);
        assert_eq!(state.cooldowns, REPEAT_COOLDOWNS);
    }

    #[test]
    fn reset_preserves_ability_timers() {
        let mut state = GuardianAiState {
            awake: true,
            cooldowns: [1.0, 2.0, 3.0],
        };
        state.evaluate(
            position(0.0, 0.0),
            position(0.0, 0.0),
            position(100.0, 0.0),
            50.0,
            100.0,
        );
        assert_eq!(state.cooldowns, [1.0, 2.0, 3.0]);
    }

    #[test]
    fn minion_roster_and_charge_minimum_match_native_rules() {
        let spawns = minion_spawns(position(0.0, 0.0));
        assert_eq!(spawns.map(|spawn| spawn.enemy_index), [0, 0, 1, 0]);
        assert_eq!(spawns[0].xy, [5.0, 0.0]);
        assert_eq!(
            charge_duration(position(0.0, 0.0), position(24.0, 0.0)),
            1.1
        );
        assert_eq!(
            charge_duration(position(0.0, 0.0), position(48.0, 0.0)),
            2.0
        );
        assert_eq!(
            charge_endpoint(position(0.0, 0.0), position(10.0, 0.0), 0.5).x,
            4.5
        );
    }

    fn fixture_float(value: &Value) -> f32 {
        f32::from_bits(value.as_u64().unwrap() as u32)
    }

    fn fixture_position(value: &Value) -> Position {
        Position {
            x: fixture_float(&value[0]),
            y: fixture_float(&value[1]),
            z: fixture_float(&value[2]),
        }
    }

    #[test]
    fn decisions_and_timers_match_unchanged_native_instructions() {
        let fixture: Value =
            serde_json::from_str(include_str!("../../tests/fixtures/guardian-ai-native.json"))
                .unwrap();
        assert_eq!(fixture["target_sha256"], super::super::TARGET_SHA256);
        for row in fixture["decision_cases"].as_array().unwrap() {
            let mut state = GuardianAiState {
                awake: row["awake"].as_bool().unwrap(),
                ..Default::default()
            };
            let movement = Movement {
                from: fixture_position(&row["from_bits"]),
                to: fixture_position(&row["to_bits"]),
                started_at: fixture_float(&row["started_bits"]),
                duration: fixture_float(&row["duration_bits"]),
            };
            let decision = state.evaluate(
                movement.position_at(fixture_float(&row["now_bits"])),
                fixture_position(&row["home_bits"]),
                fixture_position(&row["player_bits"]),
                fixture_float(&row["health_bits"]),
                fixture_float(&row["max_health_bits"]),
            );
            let native_decision = row["decision"].as_u64().unwrap();
            assert_eq!(
                match decision {
                    GuardianDecision::Idle => 0,
                    GuardianDecision::Engage => 1,
                    GuardianDecision::Reset { restored_health } => {
                        assert_eq!(
                            restored_health.to_bits(),
                            row["health_after_bits"].as_u64().unwrap() as u32
                        );
                        assert_eq!(row["effects_after"], 0);
                        assert_eq!(row["slow_after_bits"], 0);
                        assert_eq!(row["slow_until_after_bits"], 0);
                        2
                    }
                    GuardianDecision::Combat => 3,
                },
                native_decision,
                "{row}"
            );
            assert_eq!(state.awake, row["awake_after"].as_bool().unwrap());
        }
        for row in fixture["timer_cases"].as_array().unwrap() {
            let index = row["index"].as_u64().unwrap() as usize;
            let mut state = GuardianAiState {
                awake: true,
                cooldowns: [1000.0; 3],
            };
            state.cooldowns[index] = fixture_float(&row["timer_bits"]);
            let scale = fixture_float(&row["repeat_scale_bits"]);
            let due = state.advance_cooldowns(
                fixture_float(&row["elapsed_bits"]),
                if scale < 1.0 { 20.0 } else { 100.0 },
                100.0,
            );
            assert_eq!(
                due.contains(&ABILITIES[index]),
                row["due"].as_bool().unwrap()
            );
            assert_eq!(
                state.cooldowns[index].to_bits(),
                row["after_bits"].as_u64().unwrap() as u32,
                "{row}"
            );
        }
    }
}
