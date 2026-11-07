//! Ordinary combat-pet movement and attack deadlines in the historical 0.105.0 EXE.
//! Current ordinary contracts: docs/analysis/ordinary-weapons-pets-0.110.0.md.
//!
//! Tick owner145904e91..14590777e; movement owner14592ea80..14592ed7a.
//! The caller supplies the native ordered enemy query and resolves terrain for a
//! requested destination. Special Demonology dispatch remains with its own owner.

use super::pets::PetDefinition;

#[derive(Clone, Copy, Debug)]
pub struct PetMotion {
    pub from: [f32; 3],
    pub to: [f32; 3],
    pub started_at: f32,
    pub duration: f32,
}

impl PetMotion {
    pub fn stationary(position: [f32; 3], now: f32) -> Self {
        Self {
            from: position,
            to: position,
            started_at: now,
            duration: 0.0,
        }
    }

    /// Native interpolation is component-wise and has no navigation projection.
    pub fn position_at(self, now: f32) -> [f32; 3] {
        if self.duration <= 0.0 {
            return self.to;
        }
        let progress = ((now - self.started_at) / self.duration).clamp(0.0, 1.0);
        std::array::from_fn(|axis| progress * (self.to[axis] - self.from[axis]) + self.from[axis])
    }

    /// Height resolution belongs to the live world's terrain provider. Native
    /// movement uses horizontal distance and rejects a move shorter than0.3.
    pub fn begin_move(&mut self, now: f32, destination: [f32; 3], speed: f32) -> bool {
        let from = self.position_at(now);
        let distance = distance(from, destination);
        if distance < 0.3 {
            return false;
        }
        *self = Self {
            from,
            to: destination,
            started_at: now,
            duration: distance / speed,
        };
        true
    }
}

#[derive(Clone, Debug)]
pub struct PetTickState {
    pub motion: PetMotion,
    pub next_update: f32,
    pub next_attack: f32,
    pub target_guid: Option<u64>,
}

#[derive(Clone, Copy, Debug)]
pub struct Target {
    pub guid: u64,
    pub motion: PetMotion,
    /// The existing target remains eligible while its native state is not1.
    pub retained_target_eligible: bool,
    /// Native actor(+18 !=u64::MAX)*2 | actor(+15c).
    pub priority: u8,
}

#[derive(Clone, Copy, Debug)]
pub struct TickContext {
    pub now: f32,
    pub player_position: [f32; 3],
    pub player_facing: f32,
    /// Native game+48c, before the common7units/sec factor.
    pub player_speed_multiplier: f32,
    /// Native pet+68, captured during creation.
    pub relative_angle: f32,
}

#[derive(Clone, Copy, Debug)]
pub struct MovementRequest {
    pub destination: [f32; 2],
    pub speed: f32,
}

#[derive(Clone, Copy, Debug, Default)]
pub struct TickPlan {
    pub processed: bool,
    pub movement: Option<MovementRequest>,
    pub attack: Option<u64>,
}

fn distance(a: [f32; 3], b: [f32; 3]) -> f32 {
    let x = a[0] - b[0];
    let y = a[1] - b[1];
    (x * x + y * y).sqrt()
}

/// The ordinary ranged query has radius28; ordinary melee has radius26. The
/// live caller must preserve the recovered query's priority/distance ordering.
pub fn query_radius(definition: &PetDefinition) -> f32 {
    if definition.spell_id != 0 { 28.0 } else { 26.0 }
}

/// Selected ordinary ranged pet: Water Elemental's116 Frostbolt has speed28.
/// Native145906b38..b6d snapshots horizontal travel time at attack creation.
pub fn normal_ranged_impact_at(
    definition: &PetDefinition,
    now: f32,
    from: [f32; 3],
    target: [f32; 3],
) -> Option<f32> {
    (definition.special == 0 && definition.spell_id == 116)
        .then(|| distance(from, target) / 28.0 + now)
}

/// The ordinary Water Elemental queues the native Frost slow alongside its
/// snapshotted power. Its pending effect is consumed even at nonpositive power.
pub fn normal_ranged_effect(
    definition: &PetDefinition,
) -> Option<crate::player_abilities::StatusEffect> {
    (definition.special == 0 && definition.spell_id == 116).then_some(
        crate::player_abilities::StatusEffect {
            tag: 1,
            value: 0.3,
            duration: 2.0,
        },
    )
}

/// Plan only native special0 pets. A different special tag has additional
/// target and ability consumers and must be dispatched through those consumers.
pub fn normal_tick(
    state: &mut PetTickState,
    definition: &PetDefinition,
    context: TickContext,
    targets: &[Target],
    ordered_candidate_ids: &[u64],
) -> TickPlan {
    assert_eq!(
        definition.special, 0,
        "ordinary pet tick requires native special0"
    );
    if context.now < state.next_update {
        return TickPlan::default();
    }
    state.next_update = context.now + 0.25;
    let mut result = TickPlan {
        processed: true,
        ..TickPlan::default()
    };
    let position = state.motion.position_at(context.now);
    let player_speed = context.player_speed_multiplier * 7.0;
    let follow_speed = player_speed.max(7.0);
    let angle = context.relative_angle + context.player_facing;
    let ring = [
        context.player_position[0] + angle.cos() * 2.8,
        context.player_position[1] + angle.sin() * 2.8,
        context.player_position[2],
    ];
    if distance(position, context.player_position) > 40.0 {
        result.movement = Some(MovementRequest {
            destination: [ring[0], ring[1]],
            speed: player_speed * 3.0,
        });
        return result;
    }
    if definition.spell_id != 0 {
        if distance(position, ring) > 3.5 {
            result.movement = Some(MovementRequest {
                destination: [ring[0], ring[1]],
                speed: follow_speed * 1.15,
            });
        }
        // UCOMISS/JAE admits only ordered, elapsed deadlines (0.110.0).
        if !(context.now >= state.next_attack) {
            return result;
        }
        state.target_guid = ordered_candidate_ids.first().copied();
        if let Some(target) = state.target_guid {
            state.next_attack = context.now + definition.period;
            result.attack = Some(target);
        }
        return result;
    }
    let current = state.target_guid.and_then(|guid| {
        targets.iter().find(|target| {
            target.guid == guid
                && target.retained_target_eligible
                && distance(
                    target.motion.position_at(context.now),
                    context.player_position,
                ) < 32.0
        })
    });
    let candidate = ordered_candidate_ids.iter().find_map(|guid| {
        targets.iter().find(|target| {
            target.guid == *guid
                && distance(
                    target.motion.position_at(context.now),
                    context.player_position,
                ) < 28.0
        })
    });
    let target = match (current, candidate) {
        (Some(old), Some(new)) if old.priority >= new.priority => Some(old),
        (_, Some(new)) => Some(new),
        (old, None) => old,
    };
    let Some(target) = target else {
        state.target_guid = None;
        if distance(position, ring) > 4.0 {
            result.movement = Some(MovementRequest {
                destination: [ring[0], ring[1]],
                speed: follow_speed * 1.2,
            });
        }
        return result;
    };
    state.target_guid = Some(target.guid);
    if distance(position, target.motion.position_at(context.now)) <= 3.5
        && context.now >= state.next_attack
    {
        state.next_attack = context.now + definition.period;
        result.attack = Some(target.guid);
    }
    let destination = target.motion.position_at(context.now + 0.25);
    let distance = distance(position, destination);
    if distance > 2.6 {
        let fraction = (distance + -1.6) / distance;
        result.movement = Some(MovementRequest {
            destination: [
                (destination[0] - position[0]) * fraction + position[0],
                (destination[1] - position[1]) * fraction + position[1],
            ],
            speed: (player_speed * 2.2).max(16.0),
        });
    }
    result
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde::Deserialize;

    #[derive(Deserialize)]
    struct Fixture {
        target_sha256: String,
        cases: Vec<Case>,
        impact_cases: Vec<ImpactCase>,
    }
    #[derive(Deserialize)]
    struct ImpactCase {
        now: f32,
        #[serde(rename = "from_")]
        from: [f32; 3],
        target: [f32; 3],
        impact_at: f32,
        effect_tag: u32,
        effect_value: f32,
        effect_duration: f32,
    }
    #[derive(Deserialize)]
    struct Motion {
        from_: [f32; 3],
        to: [f32; 3],
        started_at: f32,
        duration: f32,
    }
    impl Motion {
        fn native(&self) -> PetMotion {
            PetMotion {
                from: self.from_,
                to: self.to,
                started_at: self.started_at,
                duration: self.duration,
            }
        }
    }
    #[derive(Deserialize)]
    struct TargetInput {
        guid: u64,
        motion: Motion,
        retained_target_eligible: bool,
        priority: u8,
    }
    #[derive(Deserialize)]
    struct Input {
        name: String,
        now: f32,
        player_position: [f32; 3],
        player_speed_multiplier: f32,
        period: f32,
        ranged: bool,
        motion: Motion,
        next_update: f32,
        next_attack: f32,
        target_guid: Option<u64>,
        targets: Vec<TargetInput>,
        ordered_candidate_ids: Vec<u64>,
    }
    #[derive(Deserialize)]
    struct ExpectedMovement {
        destination: [f32; 2],
        speed: f32,
    }
    #[derive(Deserialize)]
    struct Output {
        processed: bool,
        movement: Option<ExpectedMovement>,
        attack: Option<u64>,
        next_update: f32,
        next_attack: f32,
        target_guid: Option<u64>,
    }
    #[derive(Deserialize)]
    struct Case {
        input: Input,
        output: Output,
    }

    #[test]
    fn ordinary_plans_match_unchanged_selected_pet_loop() {
        let fixture: Fixture = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/power-scaling/pet-tick/native-tick.json"
        ))
        .unwrap();
        assert_eq!(
            fixture.target_sha256,
            "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
        );
        assert_eq!(fixture.cases.len(), 60);
        for case in fixture.cases {
            let input = case.input;
            let expected = case.output;
            let mut state = PetTickState {
                motion: input.motion.native(),
                next_update: input.next_update,
                next_attack: input.next_attack,
                target_guid: input.target_guid,
            };
            let mut definition = *super::super::pets::definition(9510).unwrap();
            definition.spell_id = if input.ranged { 75 } else { 0 };
            definition.period = input.period;
            definition.special = 0;
            let targets = input
                .targets
                .iter()
                .map(|target| Target {
                    guid: target.guid,
                    motion: target.motion.native(),
                    retained_target_eligible: target.retained_target_eligible,
                    priority: target.priority,
                })
                .collect::<Vec<_>>();
            let actual = normal_tick(
                &mut state,
                &definition,
                TickContext {
                    now: input.now,
                    player_position: input.player_position,
                    player_facing: 0.0,
                    player_speed_multiplier: input.player_speed_multiplier,
                    relative_angle: 0.0,
                },
                &targets,
                &input.ordered_candidate_ids,
            );
            assert_eq!(actual.processed, expected.processed, "{}", input.name);
            assert_eq!(actual.attack, expected.attack, "{}", input.name);
            assert_eq!(state.target_guid, expected.target_guid, "{}", input.name);
            assert_eq!(
                state.next_update.to_bits(),
                expected.next_update.to_bits(),
                "{}",
                input.name
            );
            assert_eq!(
                state.next_attack.to_bits(),
                expected.next_attack.to_bits(),
                "{}",
                input.name
            );
            match (actual.movement, expected.movement) {
                (Some(actual), Some(expected)) => {
                    assert_eq!(
                        actual.destination.map(f32::to_bits),
                        expected.destination.map(f32::to_bits),
                        "{}",
                        input.name
                    );
                    assert_eq!(
                        actual.speed.to_bits(),
                        expected.speed.to_bits(),
                        "{}",
                        input.name
                    );
                }
                (None, None) => {}
                _ => panic!("{} movement presence differs", input.name),
            }
        }
        let definition = super::super::pets::definition(9517).unwrap();
        for case in fixture.impact_cases {
            assert_eq!(
                normal_ranged_impact_at(definition, case.now, case.from, case.target)
                    .unwrap()
                    .to_bits(),
                case.impact_at.to_bits()
            );
            let effect = normal_ranged_effect(definition).unwrap();
            assert_eq!(u32::from(effect.tag), case.effect_tag);
            assert_eq!(effect.value.to_bits(), case.effect_value.to_bits());
            assert_eq!(effect.duration.to_bits(), case.effect_duration.to_bits());
        }
    }
}
