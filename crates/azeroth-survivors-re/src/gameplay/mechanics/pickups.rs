//! Live 0.105.0 runes/magnets and their native GameObject/buff consumers.
use super::*;
use azeroth_survivors_re::{
    loot_rewards::prose::Text,
    player_abilities::behavior::passive_tick::{LightwellSpawn, lightwell_object},
    run_pickups::{self, MAGNET_OBJECTS, RUNE_PICKUP_RADIUS, Rune},
};

#[derive(Debug, Default)]
pub(super) struct State {
    initialized: bool,
    next_rune: f32,
    collected_magnets: u32,
    player: Position,
}

#[cfg(test)]
impl State {
    pub(super) fn isolated() -> Self {
        Self {
            initialized: true,
            next_rune: f32::INFINITY,
            ..Self::default()
        }
    }
}

pub(super) fn planar(from: Position, to: Position) -> f32 {
    let dx = from.x - to.x;
    let dy = from.y - to.y;
    (dx * dx + dy * dy).sqrt()
}

/// Current0.112.0 shared pickup entry145944382..145944415. Its CRT hypot
/// and ordered radius admission differ from the scalar movement norms.
fn clamp_reward_xy(mut position: Position, world: &mut impl RunWorld,
                   zone: &'static ZoneDefinition) -> Position {
    let dx = position.x - zone.center[0];
    let dy = position.y - zone.center[1];
    let distance = dx.hypot(dy);
    let radius = (zone.radius - 2.0).max(1.0);
    if !(radius >= distance) {
        position.x = zone.center[0] + dx / distance * radius;
        position.y = zone.center[1] + dy / distance * radius;
        // The entry performs this query even though each creation arm later
        // resolves its final height again. XP aggregation skips that final query.
        let _ = reward_height(position, world);
    }
    position
}

fn reward_height(position: Position, world: &mut impl RunWorld) -> f32 {
    world.height([position.x, position.y])
        .or_else(|| world.secondary_height([position.x, position.y]))
        .unwrap_or_else(|| Terrain::fallback_height(world))
}

/// Current shared creator145944310: actual death-output XP/gold consumers.
/// Existing cache and special-object owners retain their explicit interfaces.
pub(super) fn create_reward(
    drop: PickupDrop, pickups: &mut Vec<RunPickup>, counter: &mut dyn NativeCounter,
    rng: &mut NativeRng, world: &mut impl RunWorld, zone: &'static ZoneDefinition,
    now: f32, events: &mut Vec<RunEvent>,
) {
    let (amount, input, experience) = match drop {
        PickupDrop::Experience { amount, position } => (amount, position, true),
        PickupDrop::Gold { amount, position } => (amount, position, false),
        PickupDrop::Cache { position } => {
            chests::create_death_cache(pickups, counter, world, zone, now, position, rng, events);
            return;
        }
        PickupDrop::Rune { .. } | PickupDrop::Magnet { .. } => {
            create(drop, pickups, counter, rng, world, zone, now, events);
            return;
        }
    };
    let mut position = clamp_reward_xy(Position { x: input.x, y: input.y, z: input.z }, world, zone);
    if experience {
        let mut stationary = 0;
        let mut closest: Option<(usize, f32)> = None;
        for (index, row) in pickups.iter().enumerate() {
            if row.flight.is_some() || !matches!(row.drop, PickupDrop::Experience { .. }) { continue; }
            stationary += 1;
            let point = row.position();
            let dx = point.x - position.x;
            let dy = point.y - position.y;
            let squared = dx * dx + dy * dy;
            if closest.is_none_or(|(_, old)| old.total_cmp(&squared).is_gt()) {
                closest = Some((index, squared));
            }
        }
        if stationary >= 45 {
            if let Some((index, _)) = closest {
                if let PickupDrop::Experience { amount: existing, .. } = &mut pickups[index].drop {
                    *existing = existing.wrapping_add(amount);
                }
            }
            return;
        }
    }
    position.z = reward_height(position, world);
    let object = if experience {
        let guid = azeroth_survivors_re::native_counter::creature_guid(9001, counter);
        let display = if amount < 20 { 1825 } else { 16587 };
        let scale: f32 = if amount < 4 { 0.22 } else if amount < 20 { 0.35 } else { 0.9 };
        LightwellObject { guid, position, orientation: 0.0, object_type: 3, fields: vec![
            (0, guid as u32), (1, (guid >> 32) as u32), (2, 9), (3, 9001),
            (4, scale.to_bits()), (22, 1), (28, 1), (34, 1), (35, 35),
            (46, 0x0200_0002), (129, 0.1_f32.to_bits()), (130, 0.1_f32.to_bits()),
            (131, display), (132, display),
        ] }
    } else {
        lightwell_object(LightwellSpawn { center: position, entry: 9004, display: 2614,
            scale: 0.6, native_kind: 5, native_flags: 0 }, counter, rng, f32::sin, f32::cos)
    };
    let id = object.guid;
    let facing = object.orientation;
    events.push(RunEvent::PickupObject(object));
    let position = treasure_chests::Position::new(position.x, position.y, position.z);
    let drop = if experience { PickupDrop::Experience { amount, position } }
        else { PickupDrop::Gold { amount, position } };
    pickups.push(RunPickup { id, created_at: now, drop, flight: None, facing, auxiliary: [None; 2] });
}

pub(super) fn attract_experience(
    pickups: &mut [RunPickup],
    player: Position,
    now: f32,
    serial: &mut u32,
    events: &mut Vec<RunEvent>,
) {
    for pickup in pickups {
        if pickup.flight.is_some() || !matches!(pickup.drop, PickupDrop::Experience { .. }) {
            continue;
        }
        let from = pickup.position();
        let duration = run_pickups::flight_duration([from.x, from.y], [player.x, player.y]);
        pickup.flight = Some(ai::Movement {
            from,
            to: player,
            started_at: now,
            duration,
        });
        *serial = serial.wrapping_add(1);
        events.push(RunEvent::PickupMove {
            guid: pickup.id,
            start: from,
            to: player,
            duration,
            serial: *serial,
        });
    }
}

/// Native shared creator145939820, kind3..6. Ordinary XP/gold/caches retain
/// their existing owners. Every special object consumes the shared serial/RNG.
pub(super) fn create(
    drop: PickupDrop,
    pickups: &mut Vec<RunPickup>,
    counter: &mut dyn NativeCounter,
    rng: &mut NativeRng,
    world: &mut impl RunWorld,
    zone: &'static ZoneDefinition,
    now: f32,
    events: &mut Vec<RunEvent>,
) {
    let (mut position, profiles): (_, Vec<_>) = match drop {
        PickupDrop::Rune { rune, position } => (
            Position {
                x: position.x,
                y: position.y,
                z: position.z,
            },
            vec![rune.descriptor()],
        ),
        PickupDrop::Magnet { position } => (
            Position {
                x: position.x,
                y: position.y,
                z: position.z,
            },
            MAGNET_OBJECTS.to_vec(),
        ),
        _ => unreachable!("special pickup creator requires a rune or magnet"),
    };
    position = clamp_reward_xy(position, world, zone);
    position.z = reward_height(position, world);
    let mut ids = Vec::new();
    let mut facing = 0.0;
    for (index, (entry, display, scale)) in profiles.into_iter().enumerate() {
        let object = lightwell_object(
            LightwellSpawn {
                center: position,
                entry,
                display,
                scale,
                native_kind: 5,
                native_flags: if index == 0 { 0 } else { 16 },
            },
            counter,
            rng,
            f32::sin,
            f32::cos,
        );
        if index == 0 {
            facing = object.orientation;
        }
        ids.push(object.guid);
        events.push(RunEvent::PickupObject(object));
    }
    let drop = match drop {
        PickupDrop::Rune { rune, .. } => PickupDrop::Rune {
            rune,
            position: treasure_chests::Position::new(position.x, position.y, position.z),
        },
        _ => PickupDrop::Magnet {
            position: treasure_chests::Position::new(position.x, position.y, position.z),
        },
    };
    pickups.push(RunPickup {
        id: ids[0],
        created_at: now,
        drop,
        flight: None,
        facing,
        auxiliary: [ids.get(1).copied(), ids.get(2).copied()],
    });
}

fn sample(
    game: &mut Mechanics,
    player: Position,
    world: &mut impl RunWorld,
    inner: f32,
    outer: f32,
) -> Position {
    //145933a30: twelve mask/floor attempts, then one unrestricted fallback.
    let draw = |rng: &mut NativeRng| {
        let angle = rng.range_f32(0.0, std::f32::consts::TAU);
        let radius = rng.range_f32(inner, outer);
        Position {
            x: player.x + radius * angle.cos(),
            y: player.y + radius * angle.sin(),
            z: player.z,
        }
    };
    for _ in 0..12 {
        let mut point = draw(&mut game.rng);
        let dx = point.x - game.zone.center[0];
        let dy = point.y - game.zone.center[1];
        let length = (dx * dx + dy * dy).sqrt();
        if length > game.zone.radius {
            point.x = game.zone.center[0] + dx / length * game.zone.radius;
            point.y = game.zone.center[1] + dy / length * game.zone.radius;
        }
        if world.blocked_grid().is_some_and(|grid| {
            let x = point.x - grid.origin[0];
            let y = point.y - grid.origin[1];
            x >= 0.0
                && y >= 0.0
                && (x as usize) < grid.side
                && (y as usize) < grid.side
                && grid.cells[y as usize * grid.side + x as usize] != 0
        }) {
            continue;
        }
        if let Some(z) = world.height([point.x, point.y]) {
            if (z - player.z).abs() < 25.0 {
                point.z = z;
                return point;
            }
        }
    }
    let mut point = draw(&mut game.rng);
    point.z = world
        .height([point.x, point.y])
        .or_else(|| world.secondary_height([point.x, point.y]))
        .unwrap_or_else(|| Terrain::fallback_height(world));
    point
}

impl Mechanics {
    pub(super) fn begin_pickups(&mut self) {
        if self.pickup_state.initialized {
            return;
        }
        self.pickup_state.initialized = true;
        let seconds = azeroth_survivors_re::bosses::catalog::ZoneDefinition::by_key(self.zone.key)
            .map_or(1200.0, |zone| zone.bosses[4].time_minutes * 60.0);
        self.boss_state.magnet_deadlines = run_pickups::magnet_windows(&mut self.rng, seconds);
    }

    fn spawn_special(&mut self, drop: PickupDrop, world: &mut impl RunWorld) {
        create(
            drop,
            &mut self.pickups,
            &mut self.counter,
            &mut self.rng,
            world,
            self.zone,
            self.clock,
            &mut self.events,
        );
    }

    pub(super) fn tick_runes(&mut self, player: Position, world: &mut impl RunWorld) {
        if self.clock < self.pickup_state.next_rune {
            return;
        }
        self.pickup_state.next_rune = self.clock + 45.0;
        if self
            .pickups
            .iter()
            .filter(|pickup| matches!(pickup.drop, PickupDrop::Rune { .. }))
            .count()
            > 1
        {
            return;
        }
        let rune = match azeroth_survivors_re::mob_loot::range_u32(&mut self.rng, 0, 3) {
            0 => Rune::Speed,
            1 => Rune::Berserking,
            _ => Rune::Restoration,
        };
        let position = sample(self, player, world, 15.0, 40.0);
        self.spawn_special(
            PickupDrop::Rune {
                rune,
                position: treasure_chests::Position::new(position.x, position.y, position.z),
            },
            world,
        );
    }

    pub(super) fn tick_forced_magnet(&mut self, player: Position, world: &mut impl RunWorld) {
        if self
            .boss_state
            .magnet_deadlines
            .first()
            .is_some_and(|window| self.clock >= window.forced_at)
        {
            self.boss_state.magnet_deadlines.remove(0);
            let position = sample(self, player, world, 25.0, 50.0);
            self.spawn_special(
                PickupDrop::Magnet {
                    position: treasure_chests::Position::new(position.x, position.y, position.z),
                },
                world,
            );
            self.events.push(RunEvent::Toast { kind: "magnet", name: Text::Literal(String::new()), text: Text::Template {
                key: "A magnet has appeared! Look for its pillar of light.".into(),
                values: vec![],
            }});
        }
    }

    pub fn collected_magnets(&self) -> u32 {
        self.pickup_state.collected_magnets
    }

    pub(super) fn collect_rune(&mut self, rune: Rune) {
        use azeroth_survivors_re::run_effects::healing::MeterSource;
        let spell_id = rune.spell();
        if rune == Rune::Restoration {
            let maximum = self.max_health();
            let actual =
                run_pickups::direct_heal(&mut self.execution.vitals.health, maximum,
                    (maximum * 0.5) * azeroth_survivors_re::heroic::healing_factor(self.rules.heroic_rank));
            let source = MeterSource {
                name: "Restoration",
                icon: "Spell_Holy_Heal",
                talent: false,
            };
            self.record_detailed_heal(self.player_guid, 0, source, actual, false);
            self.effect_state.generic.healing_meter.record(source, actual);
            self.events.push(RunEvent::PlayerValues(vec![
                (22, self.health().max(0.0).ceil() as u32),
                (28, maximum.ceil() as u32),
            ]));
        } else {
            self.execution
                .auras
                .retain(|aura| aura.spell_id != spell_id);
            self.execution.auras.push(buffs::Aura {
                source_guid: 0,
                effect: player_abilities::StatusEffect {
                    tag: 0,
                    value: 0.0,
                    duration: 0.0,
                },
                spell_id,
                expires_at: self.clock + rune.duration(),
                healing_power: 0.0,
            });
        }
        self.events.push(RunEvent::Spell(SpellCast {
            source_guid: self.player_guid,
            spell_id,
            target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(self.player_guid),
            hit_targets: vec![self.player_guid],
        }));
        if rune != Rune::Restoration {
            self.refresh_effects();
        }
        let name = Text::Template {
            key: match rune {
                Rune::Speed => "object.rune_speed",
                Rune::Berserking => "object.rune_berserk",
                Rune::Restoration => "object.rune_restore",
            }.into(),
            values: vec![],
        };
        self.events.push(RunEvent::Toast { kind: "rune", name: name.clone(),
            text: Text::Concat(vec![name, Text::Literal("!".into())]) });
    }

    // Native 0x145f57850 (0.140.0) stably removes the row, then publishes its primary
    // object and auxiliary objects in order before the caller applies rewards.
    pub(super) fn remove_pickup_at(&mut self, index: usize) -> RunPickup {
        let pickup = self.pickups.remove(index);
        self.events.push(RunEvent::RemoveObject(pickup.id));
        self.events.extend(
            pickup.auxiliary.into_iter().flatten().map(RunEvent::RemoveObject),
        );
        pickup
    }

    pub fn collect_pickup(&mut self, id: u64) -> bool {
        let Some(index) = self.pickups.iter().position(|pickup| pickup.id == id) else {
            return false;
        };
        let pickup = self.pickups[index];
        if matches!(pickup.drop, PickupDrop::Cache { .. }) {
            return false;
        }
        if matches!(pickup.drop, PickupDrop::Experience { .. })
            && !pickup
                .flight
                .is_some_and(|flight| self.clock >= flight.started_at + flight.duration)
        {
            return false;
        }
        let pickup = self.remove_pickup_at(index);
        match pickup.drop {
            PickupDrop::Experience { amount, .. } => self.credit_pickup_experience(amount, !self.has_party()),
            PickupDrop::Gold { amount, .. } => self.credit_pickup_gold(amount),
            PickupDrop::Rune { rune, .. } => self.collect_rune(rune),
            PickupDrop::Magnet { .. } => {
                self.pickup_state.collected_magnets =
                    self.pickup_state.collected_magnets.wrapping_add(1);
                attract_experience(
                    &mut self.pickups,
                    self.pickup_state.player,
                    self.clock,
                    &mut self.movement_counter,
                    &mut self.events,
                );
                for pickup in &mut self.pickups {
                    if pickup.flight.is_none() && matches!(pickup.drop, PickupDrop::Gold { .. }) {
                        pickup.flight = Some(ai::Movement {
                            from: pickup.position(),
                            to: self.pickup_state.player,
                            started_at: self.clock,
                            duration: run_pickups::flight_duration(
                                [pickup.position().x, pickup.position().y],
                                [self.pickup_state.player.x, self.pickup_state.player.y],
                            ),
                        });
                    }
                }
                self.events.push(RunEvent::PlaySound(120));
                self.events.push(RunEvent::Toast { kind: "magnet", name: Text::Literal(String::new()), text: Text::Template {
                    key: "Magnet! Everything on the field comes to you.".into(),
                    values: vec![],
                }});
            }
            PickupDrop::Cache { .. } => unreachable!(),
        }
        true
    }

    fn attract_nearby_experience(&mut self, index: usize, player: Position, reserved: bool) {
        let pickup = &mut self.pickups[index];
        let from = pickup.position();
        let distance = planar(from, player);
        //145902a94..145902b90: old, unreserved XP bypasses the radius at
        // speed 32. Reserved XP still uses the ordinary radius/speed 24 path.
        let old_unreserved = self.clock - pickup.created_at > 6.0 && !reserved;
        if matches!(pickup.drop, PickupDrop::Experience { .. })
            && pickup.flight.is_none()
            && (old_unreserved || distance <= self.stats.pickup_radius)
        {
            let duration = (distance / if old_unreserved { 32.0 } else { 24.0 }).max(0.12);
            pickup.flight = Some(ai::Movement {
                from,
                to: player,
                started_at: self.clock,
                duration,
            });
            self.movement_counter = self.movement_counter.wrapping_add(1);
            self.events.push(RunEvent::PickupMove {
                guid: pickup.id,
                start: from,
                to: player,
                duration,
                serial: self.movement_counter,
            });
        }
    }

    fn pickup_collectible(&self, pickup: &RunPickup, player: Position) -> bool {
        let due = pickup
            .flight
            .is_some_and(|flight| self.clock >= flight.started_at + flight.duration);
        let nearby = match pickup.drop {
            PickupDrop::Gold { .. } => {
                planar(pickup.position(), player) <= self.stats.pickup_radius
            }
            PickupDrop::Rune { .. } | PickupDrop::Magnet { .. } => {
                planar(pickup.position(), player) <= RUNE_PICKUP_RADIUS
            }
            _ => false,
        };
        nearby || due
    }

    //1459028e1..1459035f4: activate XP forwards, freeze admission, then
    // consume backwards. A reward may open choices without aborting this stage.
    pub(super) fn tick_pickup_collection(&mut self, player: Position) {
        self.pickup_state.player = player;
        let reserved: Vec<_> = self.pickups.iter()
            .map(|pickup| self.companion_reserved(pickup.id)).collect();
        for (index, reserved) in reserved.into_iter().enumerate() {
            self.attract_nearby_experience(index, player, reserved);
        }
        let collect: Vec<_> = self.pickups.iter()
            .filter(|pickup| self.pickup_collectible(pickup, player))
            .map(|pickup| pickup.id).collect();
        for id in collect.into_iter().rev() {
            self.collect_pickup(id);
        }
    }

    pub fn try_collect_pickup(&mut self, id: u64, player: Position) -> bool {
        self.pickup_state.player = player;
        let Some(index) = self.pickups.iter().position(|pickup| pickup.id == id) else {
            return false;
        };
        let reserved = self.companion_reserved(id);
        self.attract_nearby_experience(index, player, reserved);
        self.pickup_collectible(&self.pickups[index], player) && self.collect_pickup(id)
    }
}

#[cfg(test)]
mod tests {
    use super::super::rng_integration::{TerrainFixture, class_run};
    use super::*;

    fn center(game: &Mechanics) -> Position {
        game.zone.center.into()
    }

    #[test]
    fn magnet_uses_three_real_objects_and_counts_only_successful_collection() {
        let mut game = class_run("priest", 0);
        let player = center(&game);
        game.spawn_special(
            PickupDrop::Magnet {
                position: treasure_chests::Position::new(player.x, player.y, player.z),
            },
            &mut TerrainFixture,
        );
        let pickup = game.pickups[0];
        assert_eq!(game.collected_magnets(), 0);
        let objects = game
            .events
            .iter()
            .filter_map(|event| {
                if let RunEvent::PickupObject(object) = event {
                    Some(object)
                } else {
                    None
                }
            })
            .collect::<Vec<_>>();
        assert_eq!(objects.len(), 3);
        for (object, (entry, display, scale)) in objects.iter().zip(MAGNET_OBJECTS) {
            assert!(object.fields.contains(&(3, entry)));
            assert!(object.fields.contains(&(8, display)));
            assert!(object.fields.contains(&(4, scale.to_bits())));
        }
        game.events.clear();
        assert!(game.try_collect_pickup(pickup.id, Position { z: 500., ..player }));
        assert_eq!(game.collected_magnets(), 1);
        assert!(!game.try_collect_pickup(pickup.id, player));
        let removed = game
            .events
            .iter()
            .filter_map(|event| {
                if let RunEvent::RemoveObject(id) = event {
                    Some(*id)
                } else {
                    None
                }
            })
            .collect::<Vec<_>>();
        assert_eq!(
            removed,
            [Some(pickup.id), pickup.auxiliary[0], pickup.auxiliary[1]]
                .into_iter()
                .flatten()
                .collect::<Vec<_>>()
        );
    }

    #[test]
    fn magnet_flights_leave_active_paths_alone_and_gold_waits_for_its_deadline() {
        let mut game = class_run("priest", 0);
        let player = center(&game);
        for (id, drop) in [
            (
                11,
                PickupDrop::Experience {
                    amount: 1,
                    position: treasure_chests::Position::new(player.x + 80., player.y, player.z),
                },
            ),
            (
                12,
                PickupDrop::Gold {
                    amount: 2,
                    position: treasure_chests::Position::new(player.x + 40., player.y, player.z),
                },
            ),
            (
                13,
                PickupDrop::Magnet {
                    position: treasure_chests::Position::new(player.x, player.y, player.z),
                },
            ),
        ] {
            game.pickups.push(RunPickup {
                id,
                created_at: 0.,
                drop,
                flight: None,
                facing: 0.,
                auxiliary: [None; 2],
            });
        }
        game.clock = 10.;
        assert!(game.try_collect_pickup(13, player));
        assert_eq!(game.pickups[0].flight.unwrap().duration, 2.);
        assert_eq!(game.pickups[1].flight.unwrap().duration, 1.);
        assert!(
            game.events
                .iter()
                .any(|event| matches!(event, RunEvent::PickupMove { guid: 11, .. }))
        );
        assert!(
            !game
                .events
                .iter()
                .any(|event| matches!(event, RunEvent::PickupMove { guid: 12, .. }))
        );
        assert!(!game.try_collect_pickup(12, player));
        game.clock = 11.;
        assert!(game.try_collect_pickup(12, player));
        assert_eq!(game.gold, 2);
        assert!(!game.try_collect_pickup(12, player));
    }

    #[test]
    fn rune_refresh_and_restoration_reach_the_actual_buff_and_healing_owners() {
        let mut game = class_run("priest", 0);
        game.clock = 50.;
        game.collect_rune(Rune::Speed);
        game.clock = 52.;
        game.collect_rune(Rune::Speed);
        assert_eq!(
            game.execution
                .auras
                .iter()
                .filter(|aura| aura.spell_id == 23451)
                .count(),
            1
        );
        assert_eq!(
            game.execution
                .auras
                .iter()
                .find(|aura| aura.spell_id == 23451)
                .unwrap()
                .expires_at,
            62.
        );
        assert!(
            game.player_auras()
                .iter()
                .flatten()
                .any(|aura| aura.spell_id == 23451 && aura.expires_at == 62.)
        );
        game.execution.vitals.maximum_health = 100.;
        game.execution.vitals.health = 95.;
        game.events.clear();
        game.collect_rune(Rune::Restoration);
        assert_eq!(game.health(), 100.);
        let row = game
            .healing_meter()
            .iter()
            .find(|row| row.source.name == "Restoration")
            .unwrap();
        assert_eq!(row.total, 5.);
        assert!(
            game.events
                .iter()
                .any(|event| matches!(event,RunEvent::Spell(cast) if cast.spell_id==23493))
        );
        assert!(
            !game
                .events
                .iter()
                .any(|event| matches!(event, RunEvent::Healing { emit_log: true, .. }))
        );
    }
}
