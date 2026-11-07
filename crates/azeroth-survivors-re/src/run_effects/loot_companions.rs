//! Selected0.105.0 loot-companion actors: creation, follow and collection.
//! Owners145917cc0,14590cc7c,14592f1a0/560/7a0; see companion-actors report.
//! Current co-op descriptors: party-rewards-0.117.0.md; existing actor contracts
//! retain their historical provenance.
use super::pet_tick::PetMotion;
use crate::run_pickups::RUNE_PICKUP_RADIUS;
use serde::Deserialize;
use std::sync::OnceLock;

#[derive(Debug, Deserialize)]
pub struct Definition {
    pub key: String,
    pub name: String,
    pub achievement: Option<String>,
    pub display_id: u32,
    pub scale: f32,
    pub creature_id: u32,
}

pub fn definitions() -> &'static [Definition] {
    #[derive(Deserialize)]
    struct Registry {
        companions: Vec<Definition>,
    }
    static REGISTRY: OnceLock<Registry> = OnceLock::new();
    &REGISTRY
        .get_or_init(|| {
            let mut registry: Registry =
                serde_json::from_str(include_str!("../../assets/rewards-catalogs-0.112.0.json"))
                    .expect("native companion descriptors");
            let additions: Registry =
                serde_json::from_str(include_str!("../../assets/party-rewards-0.117.0.json"))
                    .expect("current co-op companion descriptors");
            registry.companions.extend(additions.companions);
            registry
        })
        .companions
}

#[derive(Clone, Copy, Debug)]
pub struct Slot {
    pub definition: &'static Definition,
    pub instinct: u8,
}

#[derive(Debug, Default)]
pub struct Config {
    pub slots: Vec<Slot>,
    pub leash: u8,
    pub paws: u8,
}

pub fn saved_config(
    looks: [&str; 2],
    mut rank: impl FnMut(&str) -> u8,
    mut unlocked: impl FnMut(&str) -> bool,
) -> Config {
    let count = usize::from(rank("companion") != 0) + usize::from(rank("second") != 0);
    let instincts = [
        ("instinct_gold", 1),
        ("instinct_wisps", 2),
        ("instinct_runes", 3),
    ]
    .into_iter()
    .filter_map(|(key, code)| (rank(key) != 0).then_some(code))
    .collect::<Vec<_>>();
    let default = definitions()
        .iter()
        .find(|row| row.key == "squirrel")
        .unwrap();
    let slots = looks
        .into_iter()
        .take(count)
        .enumerate()
        .map(|(index, key)| Slot {
            definition: definitions()
                .iter()
                .find(|row| row.key == key)
                .filter(|row| row.achievement.as_deref().is_none_or(&mut unlocked))
                .unwrap_or(default),
            instinct: instincts.get(index).copied().unwrap_or(0),
        })
        .collect();
    Config {
        slots,
        leash: rank("leash"),
        paws: rank("paws"),
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Reward {
    pub kind: u32,
    pub amount: u32,
}

#[derive(Clone, Copy, Debug)]
pub struct Pickup {
    pub guid: u64,
    pub kind: u32,
    pub position: [f32; 3],
    pub idle: bool,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Phase {
    Idle,
    Fetching(u64),
    Returning,
}

#[derive(Debug)]
pub struct Actor {
    pub slot: Slot,
    pub guid: u64,
    pub angle: f32,
    pub motion: PetMotion,
    pub phase: Phase,
    pub ready_at: f32,
    pub next_update: f32,
    pub departed_at: f32,
    pub inventory: Vec<Reward>,
}

pub fn angle(slot: usize) -> f32 {
    (slot as f32 * 0.35 + 1.15) * std::f32::consts::PI
}
pub fn speed(hero: f32, paws: u8) -> f32 {
    hero.max(1.0) * ((f32::from(paws) * 0.2 + 1.0) * 14.0)
}
pub fn rest(paws: u8) -> f32 {
    [2.0, 1.6, 1.3, 1.0][usize::from(paws.min(3))]
}
pub fn sweep_radius(pickup_radius: f32) -> f32 {
    (pickup_radius * 0.25).max(4.0)
}
pub fn reach(pickup_radius: f32, leash: u8) -> f32 {
    f32::from(leash) * 10.0 + 25.0 + pickup_radius
}
pub fn distance(a: [f32; 3], b: [f32; 3]) -> f32 {
    let x = a[0] - b[0];
    let y = a[1] - b[1];
    (x * x + y * y).sqrt()
}

fn priority(kind: u32, instinct: u8) -> Option<u8> {
    match kind {
        0 => Some(u8::from(instinct != 2)),
        1 => Some(u8::from(instinct != 1)),
        3..=5 if instinct == 3 => Some(0),
        _ => None,
    }
}

/// Native selection sorts by instinct then distance from the current companion,
/// retaining the first equal candidate; admission uses distance from the hero.
pub fn select(
    pickups: &[Pickup],
    reserved: &[u64],
    from: [f32; 3],
    hero: [f32; 3],
    radius: f32,
    leash: u8,
    instinct: u8,
) -> Option<Pickup> {
    pickups
        .iter()
        .copied()
        .filter(|row| row.idle && !reserved.contains(&row.guid))
        .filter(|row| {
            let d = distance(row.position, hero);
            let hero_radius = match row.kind {
                3..=5 => RUNE_PICKUP_RADIUS,
                _ => radius,
            };
            hero_radius < d && d <= reach(radius, leash)
        })
        .filter_map(|row| priority(row.kind, instinct).map(|p| (row, p)))
        .min_by(|(a, pa), (b, pb)| {
            pa.cmp(pb)
                .then_with(|| distance(a.position, from).total_cmp(&distance(b.position, from)))
        })
        .map(|(row, _)| row)
}

pub fn fields(definition: &Definition, guid: u64) -> Vec<(u16, u32)> {
    vec![
        (0, guid as u32),
        (1, (guid >> 32) as u32),
        (2, 9),
        (3, definition.creature_id),
        (4, definition.scale.to_bits()),
        (22, 1),
        (28, 1),
        (34, 1),
        (35, 35),
        (46, 0x02000002),
        (129, 0.3f32.to_bits()),
        (130, 0.5f32.to_bits()),
        (131, definition.display_id),
        (132, definition.display_id),
        (145, 1.0f32.to_bits()),
    ]
}

pub trait World {
    fn pickups(&self) -> Vec<Pickup>;
    fn take(&mut self, guid: u64) -> Option<Reward>;
    fn deliver(&mut self, reward: Reward, instinct: u8);
    fn height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn destination_height(&mut self, xy: [f32; 2]) -> f32;
    fn movement(&mut self, guid: u64, motion: PetMotion);
}

fn move_to(actor: &mut Actor, xy: [f32; 2], now: f32, speed: f32, world: &mut impl World) {
    let mut from = actor.motion.position_at(now);
    if let Some(z) = world.height([from[0], from[1]]) {
        from[2] = z;
    }
    let distance = distance(from, [xy[0], xy[1], 0.]);
    if distance < 0.3 {
        return;
    }
    let to = [xy[0], xy[1], world.destination_height(xy)];
    actor.motion = PetMotion {
        from,
        to,
        started_at: now,
        duration: distance / speed,
    };
    world.movement(actor.guid, actor.motion);
}

fn sweep(actor: &mut Actor, now: f32, radius: f32, world: &mut impl World) {
    let from = actor.motion.position_at(now);
    let ids = world
        .pickups()
        .into_iter()
        .filter(|row| row.idle && priority(row.kind, actor.slot.instinct).is_some())
        .filter(|row| {
            distance(row.position, from)
                <= sweep_radius(radius)
                    * if row.kind == 0 && actor.slot.instinct == 2 {
                        2.0
                    } else {
                        1.0
                    }
        })
        .map(|row| row.guid)
        .collect::<Vec<_>>();
    for id in ids {
        if let Some(reward) = world.take(id) {
            actor.inventory.push(reward);
        }
    }
}

#[derive(Clone, Copy)]
pub struct Context {
    pub now: f32,
    pub hero: [f32; 3],
    pub facing: f32,
    pub hero_speed: f32,
    pub pickup_radius: f32,
    pub leash: u8,
    pub paws: u8,
}

pub fn tick(actor: &mut Actor, context: Context, reserved: &[u64], world: &mut impl World) {
    let Context {
        now,
        hero,
        facing,
        hero_speed,
        pickup_radius,
        leash,
        paws,
    } = context;
    let speed = speed(hero_speed, paws);
    match actor.phase {
        Phase::Idle => {
            if now < actor.next_update {
                return;
            }
            actor.next_update = now + 0.25;
            let from = actor.motion.position_at(now);
            if now >= actor.ready_at {
                if let Some(target) = select(
                    &world.pickups(),
                    reserved,
                    from,
                    hero,
                    pickup_radius,
                    leash,
                    actor.slot.instinct,
                ) {
                    actor.phase = Phase::Fetching(target.guid);
                    actor.departed_at = now;
                    move_to(
                        actor,
                        [target.position[0], target.position[1]],
                        now,
                        speed,
                        world,
                    );
                    return;
                }
            }
            let angle = facing + actor.angle;
            let to = [hero[0] + angle.cos() * 2.2, hero[1] + angle.sin() * 2.2];
            let far = distance(from, hero) > 60.0;
            if !far && distance(from, [to[0], to[1], hero[2]]) <= 3.5 {
                return;
            }
            move_to(actor, to, now, if far { speed * 3.0 } else { speed }, world);
        }
        Phase::Fetching(target) => {
            sweep(actor, now, pickup_radius, world);
            let current = world
                .pickups()
                .into_iter()
                .find(|row| row.guid == target && row.idle);
            if current.is_some() && now < actor.motion.started_at + actor.motion.duration {
                return;
            }
            if current.is_some() {
                if let Some(reward) = world.take(target) {
                    actor.inventory.push(reward);
                }
            }
            if now - actor.departed_at < 15.0 {
                if let Some(target) = select(
                    &world.pickups(),
                    reserved,
                    actor.motion.position_at(now),
                    hero,
                    pickup_radius,
                    leash,
                    actor.slot.instinct,
                ) {
                    actor.phase = Phase::Fetching(target.guid);
                    move_to(
                        actor,
                        [target.position[0], target.position[1]],
                        now,
                        speed,
                        world,
                    );
                    return;
                }
            }
            actor.phase = if actor.inventory.is_empty() {
                actor.ready_at = now;
                Phase::Idle
            } else {
                actor.next_update = now;
                Phase::Returning
            };
        }
        Phase::Returning => {
            sweep(actor, now, pickup_radius, world);
            if distance(actor.motion.position_at(now), hero) <= 2.5 {
                for reward in std::mem::take(&mut actor.inventory) {
                    world.deliver(reward, actor.slot.instinct);
                }
                actor.phase = Phase::Idle;
                actor.ready_at = now + rest(paws);
            } else if now >= actor.next_update {
                actor.next_update = now + 0.25;
                move_to(actor, [hero[0], hero[1]], now, speed, world);
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    fn fixture() -> serde_json::Value {
        serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/companions/native-vectors.json"
        ))
        .unwrap()
    }
    fn point(value: &serde_json::Value) -> [f32; 3] {
        std::array::from_fn(|i| value[i].as_f64().unwrap() as f32)
    }
    #[test]
    fn selection_speed_angles_and_sweep_match_native_instructions() {
        let fixture = fixture();
        for case in fixture["selection_cases"].as_array().unwrap() {
            let rows = case["pickups"]
                .as_array()
                .unwrap()
                .iter()
                .map(|row| Pickup {
                    guid: row["guid"].as_u64().unwrap(),
                    kind: row["kind"].as_u64().unwrap() as u32,
                    idle: row["idle"].as_bool().unwrap(),
                    position: point(&row["position"]),
                })
                .collect::<Vec<_>>();
            let reserved = case["reserved"]
                .as_array()
                .unwrap()
                .iter()
                .map(|v| v.as_u64().unwrap())
                .collect::<Vec<_>>();
            let selected = select(
                &rows,
                &reserved,
                point(&case["from_position"]),
                [0.; 3],
                case["radius"].as_f64().unwrap() as f32,
                case["leash"].as_u64().unwrap() as u8,
                case["instinct"].as_u64().unwrap() as u8,
            )
            .map(|row| row.guid);
            assert_eq!(selected, case["selected"].as_u64(), "{}", case["name"]);
        }
        for case in fixture["speed_cases"].as_array().unwrap() {
            assert_eq!(
                speed(
                    case["hero"].as_f64().unwrap() as f32,
                    case["paws"].as_u64().unwrap() as u8
                )
                .to_bits(),
                case["speed_bits"].as_u64().unwrap() as u32
            );
        }
        for case in fixture["angle_cases"].as_array().unwrap() {
            assert_eq!(
                angle(case["slot"].as_u64().unwrap() as usize).to_bits(),
                case["angle_bits"].as_u64().unwrap() as u32
            );
        }
        for case in fixture["sweep_cases"].as_array().unwrap() {
            let mut actor = fixture_actor();
            actor.slot.instinct = case["instinct"].as_u64().unwrap() as u8;
            let mut world = TestWorld {
                rows: vec![Pickup {
                    guid: 7,
                    kind: case["kind"].as_u64().unwrap() as u32,
                    position: [case["distance"].as_f64().unwrap() as f32, 0., 0.],
                    idle: true,
                }],
                ..Default::default()
            };
            sweep(&mut actor, 0., 9., &mut world);
            assert_eq!(
                !actor.inventory.is_empty(),
                case["accepted"].as_bool().unwrap()
            );
        }
    }

    #[derive(Default)]
    struct TestWorld {
        rows: Vec<Pickup>,
        delivered: Vec<Reward>,
        moves: Vec<PetMotion>,
    }
    impl World for TestWorld {
        fn pickups(&self) -> Vec<Pickup> {
            self.rows.clone()
        }
        fn take(&mut self, guid: u64) -> Option<Reward> {
            let at = self.rows.iter().position(|row| row.guid == guid)?;
            Some(Reward {
                kind: self.rows.remove(at).kind,
                amount: 10,
            })
        }
        fn deliver(&mut self, reward: Reward, _: u8) {
            self.delivered.push(reward);
        }
        fn height(&mut self, _: [f32; 2]) -> Option<f32> {
            Some(0.)
        }
        fn destination_height(&mut self, _: [f32; 2]) -> f32 {
            0.
        }
        fn movement(&mut self, _: u64, motion: PetMotion) {
            self.moves.push(motion);
        }
    }
    fn fixture_actor() -> Actor {
        Actor {
            slot: Slot {
                definition: definitions().iter().find(|d| d.key == "sapphiron").unwrap(),
                instinct: 0,
            },
            guid: 9613,
            angle: angle(0),
            motion: PetMotion::stationary([0.; 3], 0.),
            phase: Phase::Idle,
            ready_at: 1.,
            next_update: 0.,
            departed_at: 0.,
            inventory: Vec::new(),
        }
    }
    fn context(now: f32) -> Context {
        Context {
            now,
            hero: [0.; 3],
            facing: 0.,
            hero_speed: 1.,
            pickup_radius: 9.,
            leash: 0,
            paws: 0,
        }
    }
    #[test]
    fn actual_trip_carries_successive_pickups_then_delivers_and_rests() {
        let mut actor = fixture_actor();
        let mut world = TestWorld {
            rows: vec![
                Pickup {
                    guid: 1,
                    kind: 0,
                    position: [12., 0., 0.],
                    idle: true,
                },
                Pickup {
                    guid: 2,
                    kind: 1,
                    position: [25., 0., 0.],
                    idle: true,
                },
            ],
            ..Default::default()
        };
        tick(&mut actor, context(1.), &[], &mut world);
        assert_eq!(actor.phase, Phase::Fetching(1));
        tick(&mut actor, context(1.9), &[1], &mut world);
        assert_eq!(actor.phase, Phase::Fetching(2));
        assert_eq!(actor.departed_at, 1.);
        tick(&mut actor, context(3.), &[2], &mut world);
        assert_eq!(actor.phase, Phase::Returning);
        assert_eq!(actor.inventory.len(), 2);
        tick(&mut actor, context(3.1), &[], &mut world);
        tick(&mut actor, context(5.), &[], &mut world);
        assert_eq!(actor.phase, Phase::Idle);
        assert_eq!(actor.ready_at, 7.);
        assert_eq!(
            world.delivered,
            vec![
                Reward {
                    kind: 0,
                    amount: 10
                },
                Reward {
                    kind: 1,
                    amount: 10
                }
            ]
        );
    }
    #[test]
    fn deadline_releases_next_target_and_far_follow_keeps_native_offset_at_triple_speed() {
        let mut actor = fixture_actor();
        actor.phase = Phase::Fetching(1);
        actor.departed_at = 0.;
        actor.motion = PetMotion::stationary([12., 0., 0.], 0.);
        let mut world = TestWorld {
            rows: vec![
                Pickup {
                    guid: 1,
                    kind: 0,
                    position: [12., 0., 0.],
                    idle: true,
                },
                Pickup {
                    guid: 2,
                    kind: 1,
                    position: [25., 0., 0.],
                    idle: true,
                },
            ],
            ..Default::default()
        };
        tick(&mut actor, context(15.), &[1], &mut world);
        assert_eq!(actor.phase, Phase::Returning);
        assert_eq!(world.rows.len(), 1);
        let mut actor = fixture_actor();
        actor.motion = PetMotion::stationary([100., 0., 0.], 0.);
        let mut world = TestWorld::default();
        tick(&mut actor, context(0.), &[], &mut world);
        let movement = world.moves[0];
        assert_eq!(movement.to[0], actor.angle.cos() * 2.2);
        assert_eq!(
            movement.duration,
            distance(movement.from, movement.to) / 42.
        );
    }
    #[test]
    fn saved_sapphiron_requires_the_earned_gate_and_preserves_both_slot_looks() {
        let ranks = |key: &str| {
            u8::from(matches!(
                key,
                "companion" | "second" | "instinct_gold" | "instinct_wisps"
            ))
        };
        let locked = saved_config(["sapphiron", "owl"], ranks, |_| false);
        assert_eq!(locked.slots[0].definition.key, "squirrel");
        let open = saved_config(["sapphiron", "owl"], ranks, |key| key == "feat:nou");
        assert_eq!(open.slots[0].definition.key, "sapphiron");
        assert_eq!(open.slots[0].instinct, 1);
        // Owl has its own independent achievement gate; it is not unlocked by no u.
        assert_eq!(open.slots[1].definition.key, "squirrel");
        assert_eq!(open.slots[1].instinct, 2);
        assert!(
            saved_config(["sapphiron"; 2], |_| 0, |_| true)
                .slots
                .is_empty()
        );
    }
}
