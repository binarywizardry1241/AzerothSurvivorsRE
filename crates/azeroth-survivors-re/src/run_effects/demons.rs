//! Special demon actor targeting, cadence and movement in the selected 0.112.0 EXE.
//!
//! Target owner1459586e0; tick145930385..1459331b3. The caller supplies the
//! native radius-query order, live actor health/status and pending missile power.
//! Ordinary pets retain their separate special0 consumer.
use super::{
    pet_tick::{MovementRequest, PetMotion},
    pets::PetDefinition,
};

pub const TARGET_SHA256: &str = "dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a";

#[derive(Clone, Copy, Debug)]
pub struct SummonRequest {
    pub entry: u32,
    pub lifetime: Option<f32>,
    /// Native origin effect index, retained with temporary summons.
    pub effect_index: usize,
    /// Current native follower+70; used by summoned demon attack consumers.
    pub power_multiplier: f32,
    /// Initial raw29 followers use the shared entry ring; temporary summons
    /// use the summoner's recovered random angle.
    pub relative_angle: Option<f32>,
}

/// Current summon wrapper145959bf9..145959db8. Greater companions choose
/// a side before sampling their relative angle; lesser summons use a full turn.
pub fn summon_relative_angle(special: u8, rng: &mut crate::enemies::NativeRng) -> f32 {
    if special >= 5 {
        let positive = rng.next_u64() >> 63 != 0;
        let angle = rng.range_f32(0.35, 0.65);
        (if positive { angle } else { -angle }) * std::f32::consts::PI
    } else {
        rng.range_f32(0.0, std::f32::consts::TAU)
    }
}

pub fn infernal_landing_stun(boss: bool, elite: bool) -> f32 {
    if boss { 2.0 } else if elite { 0.5 } else { 1.5 }
}

#[derive(Clone, Debug)]
pub struct ActorState {
    pub motion: PetMotion,
    pub next_update: f32,
    pub next_attack: f32,
    pub target: Option<u64>,
    /// Doomguard+30/+38: previous primary victim and consecutive casts.
    pub focus: Option<u64>,
    pub focus_casts: u32,
    /// Current Felguard+74: swing count; every third swing has Brutal Momentum.
    pub swings: u32,
    pub expires_at: Option<f32>,
    pub power_multiplier: f32,
}

#[derive(Clone, Copy, Debug)]
pub struct Target<'a> {
    pub guid: u64,
    pub motion: PetMotion,
    pub alive: bool,
    pub selectable_at: f32,
    pub seduction_ready_at: f32,
    pub health: f32,
    pub maximum_health: f32,
    pub boss: bool,
    pub elite: bool,
    pub periodic_spells: &'a [u32],
}
impl Target<'_> {
    fn priority(self) -> u8 {
        u8::from(self.boss) * 2 | u8::from(self.elite)
    }
}

#[derive(Clone, Copy, Debug)]
pub struct Allocation {
    pub target: Option<u64>,
    pub special: u8,
}

#[derive(Clone, Copy, Debug)]
pub struct IncomingMissile {
    pub target: u64,
    pub power: f32,
    pub consumed: bool,
}

pub fn distance(a: [f32; 3], b: [f32; 3]) -> f32 {
    let x = a[0] - b[0];
    let y = a[1] - b[1];
    (x * x + y * y).sqrt()
}

/// Native admission and kind-specific scores, including allocation pressure and
/// pending lethal missiles. The32-row scan bound applies before filtering.
pub fn select_target(
    definition: &PetDefinition,
    state: &ActorState,
    now: f32,
    player: [f32; 3],
    level: u32,
    run_damage: f32,
    targets: &[Target<'_>],
    ordered: &[u64],
    focus_ordered: &[u64],
    allocations: &[Allocation],
    missiles: &[IncomingMissile],
) -> Option<u64> {
    let position = state.motion.position_at(now);
    // Current Felguard selects the lowest eligible elite/boss fraction, but
    // retains its current elite while the improvement is at most 15 points.
    if definition.special == 5 {
        let elite = |row: &&Target<'_>| {
            row.alive
                && row.priority() != 0
                && distance(row.motion.position_at(now), player) <= 28.0
        };
        let best = targets
            .iter()
            .filter(elite)
            .filter(|row| row.selectable_at <= now)
            .min_by(|a, b| {
                (a.health / a.maximum_health.max(1.0))
                    .total_cmp(&(b.health / b.maximum_health.max(1.0)))
            });
        let retained = targets.iter().find(|row| Some(row.guid) == state.target).filter(elite);
        if let Some(row) = retained {
            let fraction = row.health / row.maximum_health.max(1.0);
            if best.is_none_or(|best| fraction - 0.15 <= best.health / best.maximum_health.max(1.0)) {
                return Some(row.guid);
            }
        }
        if let Some(row) = best {
            return Some(row.guid);
        }
        // Its fallback takes the first selectable radius-28 target. It does
        // not apply general allocation pressure or pending-missile scoring.
        return ordered.iter().find_map(|id| {
            targets.iter().find(|row| row.guid == *id && row.alive && row.selectable_at <= now)
                .map(|row| row.guid)
        });
    }
    // Doomguard retains its focused elite until a boss is available. The
    // radius query, rather than an unbounded actor lookup, admits this path.
    if definition.special == 7 {
        let current = state.focus.and_then(|id| {
            targets.iter().find(|row| {
                row.guid == id && row.alive && row.priority() != 0 && focus_ordered.contains(&id)
            })
        });
        if let Some(row) = current {
            if row.boss
                || !focus_ordered.iter().any(|id| {
                    targets
                        .iter()
                        .any(|row| row.guid == *id && row.alive && row.boss)
                })
            {
                return Some(row.guid);
            }
        }
        for boss_only in [true, false] {
            if let Some(row) = focus_ordered.iter().find_map(|id| {
                targets.iter().find(|row| {
                    row.guid == *id && row.alive && if boss_only { row.boss } else { row.elite }
                })
            }) {
                return Some(row.guid);
            }
        }
    }
    let estimated = (((level as f32 - 1.0) * 0.12 + 1.0) * definition.damage * run_damage).max(1.0);
    let mut selected = None;
    let mut best = 0.0;
    for id in ordered.iter().take(32) {
        let Some(row) = targets.iter().find(|row| row.guid == *id) else {
            continue;
        };
        if !row.alive || row.selectable_at > now {
            continue;
        }
        let point = row.motion.position_at(now);
        if definition.spell_id == 0 && distance(point, position) > 34.0 {
            continue;
        }
        if row.priority() == 0
            && missiles
                .iter()
                .filter(|missile| missile.target == row.guid && !missile.consumed)
                .fold(-0.0, |sum, missile| sum + missile.power)
                >= row.health
        {
            continue;
        }
        let player_distance = distance(point, player);
        let (bonus, capacity) = if row.boss {
            (2.5, 5.0)
        } else if row.elite {
            (1.5, 3.0)
        } else {
            (0.0, (row.health / estimated).max(1.0).min(2.0))
        };
        let assigned = allocations
            .iter()
            .filter(|other| other.special != 0 && other.target == Some(row.guid))
            .count() as f32;
        let mut score = 3.0 / (player_distance / 6.0 + 1.0)
            - distance(point, position) * if definition.spell_id == 0 { 0.12 } else { 0.03 }
            + bonus
            + assigned * -1.6 / capacity;
        let nearby = |radius: f32, spell: Option<u32>| {
            targets
                .iter()
                .filter(|other| {
                    other.alive
                        && distance(other.motion.position_at(now), point) <= radius
                        && spell.is_none_or(|spell| other.periodic_spells.contains(&spell))
                })
                .count() as f32
        };
        match definition.special {
            1 if !row.periodic_spells.contains(&348) => score += 0.8,
            2 => {
                score += bonus + (1.0 - row.health / row.maximum_health.max(1.0)) * 1.5;
            }
            3 => score += 3.0 / (player_distance / 3.0 + 1.0),
            4 if row.periodic_spells.contains(&172) => {
                score += 1.0;
                if !(row.seduction_ready_at > now) { score += 0.6 }
            }
            6 => score += nearby(5.0, None) * 0.3,
            7 => score += bonus * 2.0,
            _ => {}
        }
        if state.target == Some(row.guid) {
            score += 1.0
        }
        if selected.is_none() || score > best {
            selected = Some(row.guid);
            best = score
        }
    }
    selected
}

/// Current helper1459598b0: ordinary periods pass through; special demons
/// except Doomguard use the live global cooldown clock with a half-second floor.
/// Doomguard's learned Shadow Bolt/modifier route is supplied by its spell owner.
pub fn attack_interval(definition: &PetDefinition, cooldown: f32) -> f32 {
    if definition.special == 0 { definition.period }
    else { (definition.period * cooldown).max(0.5) }
}

#[derive(Clone, Copy, Debug, Default)]
pub struct AttackStats {
    pub demon_damage: f32,
    pub demon_crit: f32,
    pub empowerment: f32,
    /// Current native Game+4cc health bonus and Game+4a0 armor respectively.
    pub health_bonus: f32,
    pub damage_reduction: f32,
    pub devourer_rank: u8,
    pub supremacy: bool,
}

/// Current 14595c200 scales every hit before its independent critical draw.
/// Native kind branches retain their actual data-table values, independently
/// of the rank description formatter. Echoes advance this same RNG owner.
pub fn critical_attack(
    base: f32,
    definition: &PetDefinition,
    power_multiplier: f32,
    stats: AttackStats,
    target: Option<&Target<'_>>,
    player_crit: f32,
    crit_multiplier: f32,
    draw: f32,
) -> (f32, bool) {
    let mut multiplier = power_multiplier * (stats.demon_damage + 1.0 + stats.empowerment) * 1.3;
    match definition.special {
        1 => multiplier *= 1.05,
        2 if stats.devourer_rank != 0 => {
            let fraction = target.map_or(0.0, |row| {
                (1.0 - row.health / row.maximum_health.max(1.0)).clamp(0.0, 1.0)
            });
            let rank = usize::from(stats.devourer_rank - 1);
            multiplier *= (fraction * [0.005, 0.01, 0.02][rank]) * 100.0 + 1.0;
        }
        3 => {
            multiplier *= ((stats.health_bonus.max(0.0) * 2.0 + 1.0)
                + stats.damage_reduction * 3.0) * 1.1;
        }
        4 if target.is_some_and(|row| row.periodic_spells.contains(&172)) => multiplier *= 1.2,
        5 if target.is_some_and(|row| {
            (1.0 - row.health / row.maximum_health.max(1.0)).clamp(0.0, 1.0) > 0.7
        }) => multiplier *= 1.5,
        7 if stats.supremacy && target.is_some_and(|row| row.boss || row.elite) => {
            multiplier *= f32::from(stats.devourer_rank) * 0.02 + 1.0;
        }
        _ => {}
    }
    let critical = (player_crit + stats.demon_crit).min(1.0) > draw;
    let power = base * multiplier;
    (if critical { power * crit_multiplier } else { power }, critical)
}

pub fn common_base(definition: &PetDefinition, level: u32, damage: f32, multiplier: f32) -> f32 {
    let growth = (level as f32 - 1.0) * 0.12 + 1.0;
    growth * definition.damage * damage * multiplier
}

#[derive(Clone, Copy, Debug, Default)]
pub struct TickPlan {
    pub movement: Option<MovementRequest>,
    pub attack: Option<u64>,
}

/// The enclosing tick has already applied expiry, update deadline and target
/// selection. Its ring and melee surround offsets use native pet GUID low16.
pub fn tick_plan(
    state: &mut ActorState,
    definition: &PetDefinition,
    guid: u64,
    relative_angle: f32,
    facing: f32,
    now: f32,
    player: [f32; 3],
    speed_multiplier: f32,
    target: Option<&Target<'_>>,
    period: f32,
) -> TickPlan {
    let mut plan = TickPlan::default();
    if now < state.next_update {
        return plan;
    }
    state.next_update = now + 0.25;
    let position = state.motion.position_at(now);
    let angle = relative_angle + facing;
    let radius = if definition.special >= 5 { 4.5 } else { 2.8 };
    let ring = [
        player[0] + angle.cos() * radius,
        player[1] + angle.sin() * radius,
        player[2],
    ];
    let speed = speed_multiplier * 7.0;
    if distance(position, player) > 40.0 {
        plan.movement = Some(MovementRequest {
            destination: [ring[0], ring[1]],
            speed: speed * 3.0,
        });
        return plan;
    }
    if definition.spell_id != 0 {
        if distance(position, ring) > 3.5 {
            plan.movement = Some(MovementRequest {
                destination: [ring[0], ring[1]],
                speed: speed.max(7.0) * 1.15,
            })
        }
        if now >= state.next_attack {
            state.target = target.map(|row| row.guid);
            if let Some(row) = target {
                state.target = Some(row.guid);
                state.next_attack = now + period;
                plan.attack = state.target;
            }
        }
        if state.next_attack > now {
            state.next_update = state.next_update.min(state.next_attack);
        }
    } else if let Some(row) = target {
        state.target = Some(row.guid);
        if distance(position, row.motion.position_at(now)) <= 3.5 && now >= state.next_attack {
            state.next_attack = now + period;
            plan.attack = state.target;
        }
        if state.next_attack > now {
            state.next_update = state.next_update.min(state.next_attack);
        }
        let mut destination = row.motion.position_at(now + 0.25);
        let angle = relative_angle + (guid as u16 as f32) * 2.4;
        destination[0] += angle.cos() * 1.3;
        destination[1] += angle.sin() * 1.3;
        let distance = distance(position, destination);
        if distance > 2.6 {
            let fraction = (distance - 1.6) / distance;
            plan.movement = Some(MovementRequest {
                destination: [
                    position[0] + (destination[0] - position[0]) * fraction,
                    position[1] + (destination[1] - position[1]) * fraction,
                ],
                speed: (speed * 2.2).max(16.0),
            });
        }
    } else {
        state.target = None;
        if distance(position, ring) > 4.0 {
            plan.movement = Some(MovementRequest {
                destination: [ring[0], ring[1]],
                speed: speed.max(7.0) * 1.2,
            })
        }
    }
    plan
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    fn float(row: &Value, key: &str) -> f32 {
        row[key].as_f64().unwrap() as f32
    }
    fn id(row: &Value, key: &str) -> Option<u64> {
        row[key].as_u64()
    }
    fn point(row: &Value, key: &str) -> [f32; 3] {
        std::array::from_fn(|i| row[key][i].as_f64().unwrap() as f32)
    }

    #[test]
    fn current_native_demon_damage_vectors() {
        let data: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/demon-damage/critical-vectors.json"
        )).unwrap();
        assert_eq!(data["target_sha256"], "dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a");
        for row in data["cases"].as_array().unwrap() {
            let mut definition = super::super::pets::DEFINITIONS[0];
            definition.special = row["kind"].as_u64().unwrap() as u8;
            let kind = row["target"].as_str().unwrap();
            let spells = if row["corruption"].as_bool().unwrap() { vec![172] } else { vec![] };
            let target = Target {
                guid: 51, motion: PetMotion::stationary([0.; 3], 10.), alive: true,
                selectable_at: 0., seduction_ready_at: 0., health: float(row, "health"),
                maximum_health: 100., boss: kind == "boss", elite: kind == "elite",
                periodic_spells: &spells,
            };
            let critical = row["critical"].as_bool().unwrap();
            let actual = critical_attack(30., &definition, 1.25, AttackStats {
                demon_damage: 0.2, demon_crit: 0.1, empowerment: 0.4 * (1.0 + 0.25),
                health_bonus: 0.3, damage_reduction: 0.12,
                devourer_rank: row["rank"].as_u64().unwrap() as u8,
                supremacy: row["supremacy"].as_bool().unwrap(),
            }, (kind != "missing").then_some(&target), if critical { 1. } else { -0.2 }, 1.7, 0.0);
            assert_eq!(actual.0.to_bits(), row["damage_bits"].as_u64().unwrap() as u32);
            assert_eq!(actual.1, critical);
        }
    }

    #[test]
    fn selected_exe_target_vectors() {
        let data: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/demon-actors/native-target-cases.json"
        ))
        .unwrap();
        assert_eq!(data["target_sha256"], TARGET_SHA256);
        assert_eq!(data["cases"].as_array().unwrap().len(), 151);
        for case in data["cases"].as_array().unwrap() {
            let input = &case["input"];
            let kind = input["kind"].as_u64().unwrap() as u8;
            let definition = super::super::pets::DEFINITIONS
                .iter()
                .find(|row| row.special == kind)
                .unwrap();
            let now = float(input, "now");
            let spells = input["targets"]
                .as_array()
                .unwrap()
                .iter()
                .map(|row| {
                    row["spells"]
                        .as_array()
                        .unwrap()
                        .iter()
                        .map(|spell| spell.as_u64().unwrap() as u32)
                        .collect::<Vec<_>>()
                })
                .collect::<Vec<_>>();
            let targets = input["targets"]
                .as_array()
                .unwrap()
                .iter()
                .enumerate()
                .map(|(i, row)| Target {
                    guid: row["guid"].as_u64().unwrap(),
                    motion: PetMotion::stationary(point(row, "position"), now),
                    alive: row["alive"].as_bool().unwrap(),
                    selectable_at: float(row, "selectable_at"),
                    seduction_ready_at: row["seduction_ready_at"].as_f64().unwrap_or(0.0) as f32,
                    health: float(row, "health"),
                    maximum_health: float(row, "maximum_health"),
                    boss: row["boss"].as_bool().unwrap(),
                    elite: row["elite"].as_bool().unwrap(),
                    periodic_spells: &spells[i],
                })
                .collect::<Vec<_>>();
            let state = ActorState {
                motion: PetMotion::stationary(point(input, "position"), now),
                next_update: now,
                next_attack: now,
                target: id(input, "retained"),
                focus: id(input, "focus"),
                focus_casts: 0,
                swings: 0,
                expires_at: None,
                power_multiplier: 1.0,
            };
            let allocations = input["allocations"]
                .as_array()
                .unwrap()
                .iter()
                .map(|row| Allocation {
                    target: row.as_u64(),
                    special: kind,
                })
                .collect::<Vec<_>>();
            let missiles = input["missiles"]
                .as_array()
                .unwrap()
                .iter()
                .map(|row| IncomingMissile {
                    target: row["target"].as_u64().unwrap(),
                    power: float(row, "power"),
                    consumed: row["consumed"].as_bool().unwrap(),
                })
                .collect::<Vec<_>>();
            let query = case["queries"].as_array().unwrap();
            let ordered_input = query.last().map_or(&input["ordered"], |q| &q["ordered"]);
            let ordered = ordered_input
                .as_array()
                .unwrap()
                .iter()
                .map(|row| row.as_u64().unwrap())
                .collect::<Vec<_>>();
            let focus_ordered = query.first().map_or(ordered.clone(), |q| q["ordered"].as_array().unwrap().iter().map(|v| v.as_u64().unwrap()).collect::<Vec<_>>());
            assert_eq!(
                select_target(
                    definition,
                    &state,
                    now,
                    point(input, "player"),
                    input["level"].as_u64().unwrap() as u32,
                    float(input, "run_damage"),
                    &targets,
                    &ordered,
                    &focus_ordered,
                    &allocations,
                    &missiles
                ),
                case["selected"].as_u64(),
                "kind{kind}: {}",
                input["name"]
            );
        }
    }
    #[test]
    fn current_native_non_doomguard_cadence_vectors() {
        let data: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/demon-actors/native-clock-cases.json"
        )).unwrap();
        assert_eq!(data["target_sha256"], TARGET_SHA256);
        for row in data["cases"].as_array().unwrap() {
            let kind = row["kind"].as_u64().unwrap() as u8;
            if kind == 7 { continue; } // Learned Shadow Bolt belongs to demon_spells.
            let definition = super::super::pets::DEFINITIONS.iter()
                .find(|definition| definition.special == kind).unwrap();
            let cooldown = f32::from_bits(row["cooldown_bits"].as_u64().unwrap() as u32);
            assert_eq!(attack_interval(definition, cooldown).to_bits(),
                row["interval_bits"].as_u64().unwrap() as u32, "{row}");
        }
    }

    #[test]
    fn current_native_summon_angles_and_infernal_landing_vectors() {
        let data: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/demon-actors/native-landing-cases.json"
        )).unwrap();
        assert_eq!(data["target_sha256"], TARGET_SHA256);
        assert_eq!(data["cases"].as_array().unwrap().len(), 84);
        for row in data["cases"].as_array().unwrap() {
            let input = &row["input"];
            let output = &row["output"];
            let kind = input["kind"].as_u64().unwrap() as u8;
            let seed = std::array::from_fn(|i| input["seed"][i].as_u64().unwrap());
            let mut rng = crate::enemies::NativeRng::from_words(seed);
            assert_eq!(summon_relative_angle(kind, &mut rng).to_bits(),
                output["angle_bits"].as_u64().unwrap() as u32, "{row}");
            assert_eq!(rng.words, std::array::from_fn(|i| output["rng_after"][i].as_u64().unwrap()));
            if kind != 6 { continue; }
            let definition = super::super::pets::DEFINITIONS.iter()
                .find(|definition| definition.special == kind).unwrap();
            let base = common_base(definition, input["level"].as_u64().unwrap() as u32, 1.7, 2.25);
            for hit in output["hits"].as_array().unwrap() {
                assert_eq!(base.to_bits(), hit["base_bits"].as_u64().unwrap() as u32, "{row}");
            }
            for stun in output["stuns"].as_array().unwrap() {
                let guid = stun["target"].as_u64().unwrap();
                assert_eq!(infernal_landing_stun(guid == 12, guid == 11).to_bits(),
                    stun["duration_bits"].as_u64().unwrap() as u32, "{row}");
            }
            let radius = super::super::demon_effects::infernal_landing_radius(float(input, "area"));
            let native = f32::from_bits(output["query_radius_bits"].as_u64().unwrap() as u32);
            // The native harness supplies log1p through an explicitly declared seam.
            assert!((radius - native).abs() <= 0.00002, "{row}");
        }
    }

    #[test]
    fn current_native_ranged_update_deadlines_wake_for_pending_attack() {
        let data: Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/demon-actors/native-update-cases.json"
        )).unwrap();
        for row in data["cases"].as_array().unwrap() {
            let f = |key: &str| f32::from_bits(row[key].as_u64().unwrap() as u32);
            let definition = super::super::pets::DEFINITIONS.iter()
                .find(|d| u64::from(d.special) == row["kind"].as_u64().unwrap()).unwrap();
            let now = f("now_bits");
            let mut state = ActorState { motion: PetMotion::stationary([0.; 3], now),
                next_update: now, next_attack: f("attack_bits"), target: None, focus: None,
                focus_casts: 0, swings: 0, expires_at: None, power_multiplier: 1.0 };
            tick_plan(&mut state, definition, 1, 0.0, 0.0, now, [0.; 3], 1.0, None, 1.0);
            assert_eq!(state.next_update.to_bits(), row["update_bits"].as_u64().unwrap() as u32, "{row}");
        }
    }

}
