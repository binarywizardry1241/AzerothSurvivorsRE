//! Lair guardians share the live ordinary actor/target registry and run RNG.
//! Current0.112.0 placement/scaling/rewards are revalidated in
//! docs/analysis/raid-guardian-lifecycle-0.112.0.md; signature/input ownership
//! remains in docs/analysis/raid-inputs-0.112.0.md.

use std::collections::HashMap;

use super::*;
use azeroth_survivors_re::guardians::{
    self as native,
    ai::GuardianDecision,
    rewards::{DeathPort, StrengthPort},
};

#[derive(Clone, Debug)]
pub struct RunGuardian {
    pub lair_index: usize,
    pub home: native::Position,
    pub ai: native::ai::GuardianAiState,
    pub raid: native::signatures::State,
    pub render_scale: f32,
}

#[derive(Clone, Debug)]
pub enum GuardianRewardEvent {
    Sound(u32),
    Account { name: String },
    JewelryChoice(native::rewards::GuardianChoiceRequest),
}

#[derive(Default)]
pub(super) struct GuardianState {
    system: Option<native::Guardians>,
    actors: HashMap<u64, RunGuardian>,
    pub(super) pending_strength: u32,
    pub(super) pending_jewelry: u32,
    pub(super) reward_events: Vec<GuardianRewardEvent>,
    pub(super) shared_strength: u32,
    pub(super) personal_kills: u32,
}

impl std::fmt::Debug for GuardianState {
    fn fmt(&self, out: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        out.debug_struct("GuardianState")
            .field("actors", &self.actors)
            .field("pending_strength", &self.pending_strength)
            .field("pending_jewelry", &self.pending_jewelry)
            .finish()
    }
}

impl GuardianState {
    /// Native vector removal drops the guardian's actor-owned phase state;
    /// lair placement, shared kills and pending rewards have other lifetimes.
    pub(super) fn retire_actor(&mut self, guid: u64) {
        self.actors.remove(&guid);
    }

    pub(super) fn raid_replace_moves(&mut self, guid: u64, index: usize) {
        if let Some(row) = self.actors.get_mut(&guid) { row.raid.replace_moves(index); }
    }
    pub(super) fn raid_hold_until_mut(&mut self, guid: u64) -> Option<&mut f32> {
        self.actors.get_mut(&guid).map(|row| &mut row.raid.hold_until)
    }
    pub(super) fn raid_cast_until_mut(&mut self, guid: u64) -> Option<&mut f32> {
        self.actors.get_mut(&guid).map(|row| &mut row.raid.cast_until)
    }
    pub(super) fn render_scale(&self, guid: u64) -> Option<f32> {
        self.actors.get(&guid).map(|row| row.render_scale)
    }
    pub(super) fn contains(&self, guid: u64) -> bool {
        self.actors.contains_key(&guid)
    }
    pub(super) fn passive_awake(&self, guid: u64) -> Option<u8> {
        self.actors
            .get(&guid)
            .map(|guardian| u8::from(guardian.ai.awake))
    }
}

fn gpos(position: Position) -> native::Position {
    native::Position {
        x: position.x,
        y: position.y,
        z: position.z,
    }
}

fn epos(position: native::Position) -> Position {
    Position {
        x: position.x,
        y: position.y,
        z: position.z,
    }
}

fn scaling_input(
    now: f32,
    zone_key: &str,
    rules: RunRules,
    kills: u32,
    phase: u32,
    endless_started_at: f32,
) -> native::scaling::ScalingInput {
    native::scaling::ScalingInput {
        heroic_rank: rules.heroic_rank,
        clock_seconds: now,
        hyper_half_minutes: azeroth_survivors_re::bosses::spawning::hyper_half_minutes(zone_key, rules.hyper),
        difficulty: rules.difficulty,
        zone_scale: 1.0,
        guardian_kills: kills,
        hp_percent: rules.hp_percent,
        damage_percent: rules.damage_percent,
        phase,
        endless: rules.endless,
        endless_start_seconds: endless_started_at,
    }
}

impl Mechanics {
    pub fn guardian_awake(&self, guid: u64) -> bool {
        self.guardian_state.actors.get(&guid).is_some_and(|guardian| guardian.ai.awake)
    }

    pub fn guardian_render_scale(&self, guid: u64) -> Option<f32> {
        self.guardian_state
            .actors
            .get(&guid)
            .map(|row| row.render_scale)
    }
    pub fn guardian_kills(&self) -> u32 {
        if let Some(state) = self.replica_state() { return state.guardian_kills; }
        self.guardian_state.personal_kills
    }
    pub fn guardian_lairs(&self) -> &[native::Lair] {
        self.guardian_state
            .system
            .as_ref()
            .map_or(&[], native::Guardians::lairs)
    }
    pub fn guardian_rewards(&self) -> &[GuardianRewardEvent] {
        &self.guardian_state.reward_events
    }
    pub fn pending_guardian_jewelry(&self) -> u32 {
        self.guardian_state.pending_jewelry
    }

    pub(super) fn finish_guardian_jewelry_choice(&mut self) {
        self.guardian_state.pending_jewelry = self.guardian_state.pending_jewelry.saturating_sub(1);
    }

    pub(super) fn spawn_due_guardians(&mut self, world: &mut impl RunWorld) {
        // Current Begin14590f612 skips lair construction in showcase;
        // subsequent lair timers therefore have no rows to spawn/announce.
        if self.is_showcase() {
            return;
        }
        let Some(zone) = native::catalog::ZoneDefinition::by_key(self.zone.key) else {
            return;
        };
        if self.guardian_state.system.is_none() {
            let candidates_exist = !zone.guardian_enemy_indices.is_empty()
                || zone
                    .enemies
                    .iter()
                    .any(|enemy| enemy.flag_4c == 1 && enemy.raw_48.is_finite());
            self.guardian_state.system = Some(if candidates_exist {
                native::Guardians::initialize(zone, world, false)
            } else {
                native::Guardians::from_lairs(zone, Vec::new())
            });
        }
        let input = scaling_input(
            self.clock, self.zone.key, self.rules, self.guardian_kills(),
            self.boss_state.phase(), self.boss_state.endless_started_at(),
        );
        let mut port = GuardianSpawner {
            spawns: Vec::new(),
            announcements: Vec::new(),
        };
        // This is a temporary view of the SAME four words, committed before
        // another random consumer runs. It is never seeded independently.
        let mut rng = native::NativeRng {
            state: self.rng.words,
        };
        self.guardian_state.system.as_mut().expect("initialized above")
            .set_guardian_kills(self.guardian_state.personal_kills);
        self.guardian_state
            .system
            .as_mut()
            .expect("initialized above")
            .spawn_due_with_signatures(
                input,
                self.rules.speed_percent,
                false,
                &mut self.counter,
                &mut rng,
                f32::powf,
                &mut port,
            );
        self.rng.words = rng.state;
        if !port.spawns.is_empty() { self.invalidate_world_flag(); }
        for spawn in port.spawns {
            let Some(definition) = self.zone.enemies.get(spawn.enemy_index) else {
                continue;
            };
            // Current14598384e applies the cooperative factor after HP options.
            let health = spawn.health * self.party_health_factors()[1];
            let stats = scaling::InitialStats {
                health,
                max_health: health,
                damage: spawn.damage,
                movement_speed: spawn.movement_speed,
                attack_interval: spawn.attack_interval,
                melee_reach: spawn.melee_reach,
                initial_attack_delay: spawn.initial_attack_delay,
            };
            // Current145907172..14590718f stores the run clock as the initial
            // move deadline, with no second movement-deadline random draw.
            let timing = scaling::InitialTiming {
                facing: spawn.facing,
                next_movement_at: self.clock,
            };
            self.actors.push(RunActor {
                guid: spawn.guid,
                allocation_order: spawn.allocation_order,
                definition,
                // Current145906c44 passes1 into UNIT helper14593c570.
                native_level: native_actor_level(self.level, 1),
                actor: Actor::new(spawn.guid, epos(spawn.home), self.clock, stats, timing),
                health,
                maximum_health: health,
                control: ControlWindow::for_enemy(true),
                periodic: Vec::new(),
                vulnerability: 0.0,
                vulnerability_until: 0.0,
                additional_damage_taken: 0.0,
            });
            self.guardian_state.actors.insert(
                spawn.guid,
                RunGuardian {
                    lair_index: spawn.lair_index,
                    home: spawn.home,
                    ai: native::ai::GuardianAiState {
                        awake: false,
                        cooldowns: spawn.ability_cooldowns,
                    },
                    raid: native::signatures::State::for_variant(definition.id,
                        spawn.signature_variant.expect("current guardian constructor selects its signature")),
                    render_scale: spawn.scale,
                },
            );
        }
        for (_, index) in port.announcements {
            let enemy = &zone.enemies[index];
            self.events.push(RunEvent::Announcement(RunAnnouncement::emote(
                AnnouncementLabel::enemy(enemy.id, enemy.name), "%s claims its lair once more.")));
        }
    }

    pub(super) fn tick_guardian(
        &mut self,
        index: usize,
        delta: f32,
        player: Position,
        world: &mut impl RunWorld,
        frame: &mut actor_frame::ActorFrame,
    ) {
        let mut due = Vec::new();
        let cooperative = self.has_party();
        {
            let row = &mut self.actors[index];
            let Some(guardian) = self.guardian_state.actors.get_mut(&row.guid) else {
                return;
            };
            if row.actor.dead {
                return;
            }
            let position = row.actor.movement.position_at(self.clock);
            let context = ai::Context {
                now: self.clock,
                elapsed: delta,
                player,
                zone_center: self.zone.center.into(),
                zone_radius: self.zone.radius,
            };
            // These shared early-return lanes precede unique guardian work.
            if self.clock < row.actor.fear_until
                || self.clock < row.actor.stun_until
                || self.clock < row.actor.forced_escape_until
                || row.actor.escape.is_some()
                || self.clock < guardian.raid.hold_until
            {
                frame.collect(row.guid,
                    row.actor.tick_with_stage_and_hold(
                        Some(row.definition), context, world, &ai::HostMath,
                        ai::CombatModifiers::default(), guardian.raid.hold_until, |_, _| {}));
                return;
            }
            let home = guardian.home;
            let leash_target = if cooperative && guardian.ai.awake
                && native::ai::distance_xy(home, gpos(player)) > native::ai::LEASH_RADIUS
            {
                self.coop.snapshot.guardian_leash_target([home.x, home.y, home.z])
            } else {
                None
            };
            let leash_player = if let Some(hero) = leash_target {
                frame.guardian_retargets.push((row.guid, hero.slot as u8));
                row.actor.next_movement_at = self.clock;
                Position::from(hero.position)
            } else {
                player
            };
            match guardian.ai.evaluate(
                gpos(position),
                home,
                gpos(leash_player),
                row.health,
                row.maximum_health,
            ) {
                GuardianDecision::Idle => {
                    return_home(row, home, self.clock, false, frame);
                    return;
                }
                GuardianDecision::Reset { restored_health } => {
                    row.health = restored_health;
                    guardian.raid.reset();
                    if let Some(defense) = self.boss_state.defenses.get_mut(&row.guid) {
                        defense.reset();
                    }
                    row.periodic.clear();
                    row.actor.slow = ai::TimedReduction::default();
                    row.actor.casting = false;
                    return_home(row, home, self.clock, true, frame);
                    frame.guardian_resets.push(row.guid);
                    return;
                }
                GuardianDecision::Engage => {
                    // Native145979a85 queues only the GUID here. Rescaling,
                    // fields and the aggro yell follow periodic/raid/wards.
                    frame.engaged.push(row.guid);
                }
                GuardianDecision::Combat => {}
            }
            let health = row.health;
            let maximum = row.maximum_health;
            let hold_until = guardian.raid.hold_until;
            let mut admitted = native::signatures::Due::default();
            let actions = row.actor.tick_with_stage_and_hold(
                Some(row.definition), context, world, &ai::HostMath,
                ai::CombatModifiers::default(), hold_until, |_, _| {
                    admitted = guardian.raid.advance_for_rank(self.clock, delta, health, maximum, self.rules.heroic_rank);
                });
            for (_phase, yell) in admitted.phase_yells {
                frame.emotes.push(RunAnnouncement::emote(
                    AnnouncementLabel::enemy(row.definition.id, row.definition.name), yell));
            }
            due.extend(admitted.abilities.into_iter().map(|ability| (frame.actor_index, ability)));
            frame.collect(row.guid, actions);
        }
        self.boss_state.pending_actions.extend(due);
    }

    ///14597c822..cd0f re-finds the queued guardian after ward actions. The
    /// original does not reject a dead actor: health-ratio scaling preserves0.
    pub(super) fn resolve_guardian_engagements(&mut self, guids: Vec<u64>) {
        let kills = self.guardian_kills();
        let party_health = self.party_health_factors()[1];
        for guid in guids {
            if !self.guardian_state.contains(guid) { continue; }
            let Some(row) = self.actors.iter_mut().find(|row| row.guid == guid) else { continue; };
            let Some(zone) = native::catalog::ZoneDefinition::by_key(self.zone.key) else { continue; };
            let Some(definition) = zone.enemies.iter().find(|definition| definition.id == row.definition.id) else { continue; };
            let mut input = scaling_input(self.clock, self.zone.key, self.rules, kills,
                self.boss_state.phase(), self.boss_state.endless_started_at());
            input.zone_scale = zone.scalar_e0;
            let mut vitals = native::scaling::GuardianVitals {
                hp: row.health, max_hp: row.maximum_health, damage: row.actor.damage,
            };
            vitals.rescale(native::scaling::guardian_health(input, definition.base_hp, zone.hp_knots) * party_health,
                native::scaling::guardian_damage(input, definition.base_damage));
            row.health = vitals.hp;
            row.maximum_health = vitals.max_hp;
            row.actor.damage = vitals.damage;
            // Native14597ca55..14597cc87 publishes both updated unit fields
            // before the aggro text, even when neither scalar increased.
            self.events.push(RunEvent::ActorFields { target: guid,
                fields: vec![(22, row.health.ceil() as u32), (28, row.maximum_health.ceil() as u32)] });
            self.events.push(RunEvent::Announcement(RunAnnouncement::Yell {
                guid, name: AnnouncementLabel::enemy(row.definition.id, row.definition.name),
                text: AnnouncementLabel::literal("Who dares enter my lair?"),
            }));
        }
    }

    pub(super) fn resolve_guardian_resets(&mut self, guids: Vec<u64>) {
        let effects = &mut self.effect_state.generic;
        for guid in guids {
            let Some(row) = self.actors.iter().find(|row| row.guid == guid) else {
                continue;
            };
            if !row.actor.dead {
                let spells = effects.aura_slots.get(&guid).map_or([0; 16], |slots| slots.spells);
                for spell_id in spells {
                    if spell_id != 0 && spell_id != callbacks::DARKMANTLE_AURA {
                        self.events.extend(effects.aura_event(guid, spell_id, false, &row.periodic));
                    }
                }
            }
            self.events.push(RunEvent::ActorFields {
                target: guid,
                fields: vec![(22, row.maximum_health.ceil() as u32)],
            });
        }
    }

    pub(super) fn drain_guardian_strength(&mut self) {
        let mut strength = std::mem::take(&mut self.guardian_state.pending_strength);
        let mut jewelry = std::mem::take(&mut self.guardian_state.pending_jewelry);
        let request = native::rewards::drain_strength_awards(&mut strength, &mut jewelry, self);
        self.guardian_state.pending_strength = strength;
        self.guardian_state.pending_jewelry = jewelry;
        if let Some(request) = request {
            self.guardian_state
                .reward_events
                .push(GuardianRewardEvent::JewelryChoice(request));
            self.generate_guardian_choices();
        }
    }
}

impl StrengthPort for Mechanics {
    fn level_and_experience(&self) -> (u32, u32) {
        (self.level, self.xp)
    }
    fn add_experience(&mut self, amount: u32) {
        Mechanics::add_experience(self, amount);
    }
    fn run_state(&self) -> u8 {
        if self.active_run_state() {
            1
        } else if self.dead {
            4
        } else if self.completed {
            5
        } else {
            2
        }
    }
    fn suppression_958(&self) -> bool {
        false
    }
}

fn return_home(row: &mut RunActor, home: native::Position, now: f32, reset: bool,
    frame: &mut actor_frame::ActorFrame) {
    let movement = row.actor.movement;
    let current = movement.position_at(now);
    let dx = home.x - current.x;
    let dy = home.y - current.y;
    let distance = (dx * dx + dy * dy).sqrt();
    if !reset && (!(distance > 2.0)
        || (movement.duration > 0.0 && now < movement.started_at + movement.duration))
    {
        return;
    }
    let duration = distance / row.actor.movement_speed_at(now).max(0.5);
    row.actor.movement = ai::Movement {
        from: current,
        to: epos(home),
        started_at: now,
        duration,
    };
    if reset {
        row.actor.next_movement_at = now + duration;
    }
    frame.collect(row.guid, vec![ai::Action::Move(row.actor.movement)]);
}

struct GuardianSpawner {
    spawns: Vec<native::GuardianSpawn>,
    announcements: Vec<(usize, usize)>,
}
impl native::SpawnPort for GuardianSpawner {
    fn create_guardian(&mut self, spawn: native::GuardianSpawn) {
        self.spawns.push(spawn);
    }
    fn announce_lair_refilled(&mut self, lair: usize, enemy: usize) {
        self.announcements.push((lair, enemy));
    }
}

impl<W: RunWorld> CombatAdapter<'_, W> {
    pub(super) fn guardian_death(&mut self, guid: u64, position: Position, rng: &mut NativeRng) {
        let Some(guardian) = self.guardian_state.actors.get(&guid) else {
            return;
        };
        let lair = guardian.lair_index;
        let Some(row) = self.actors.iter().find(|row| row.guid == guid) else {
            return;
        };
        let name = row.definition.name;
        let enemy_id = row.definition.id;
        let Some(system) = self.guardian_state.system.as_mut() else {
            return;
        };
        system.set_guardian_kills(self.guardian_state.personal_kills);
        let mut port = GuardianDeath {
            pickups: self.pickups,
            counter: self.object_counter.clone(),
            world: self.world,
            events: self.events,
            rewards: &mut self.guardian_state.reward_events,
            strength: if self.boss_state.shared_equipment.is_some() {
                &mut self.guardian_state.shared_strength
            } else { &mut self.guardian_state.pending_strength },
            magnet_deadlines: &mut self.boss_state.magnet_deadlines,
            zone: self.zone,
            now: self.now,
            rng,
            enemy_id,
        };
        system.guardian_died_for_rank(
            lair, self.now, name, gpos(position), &mut port, self.rules.heroic_rank, self.rules.hyper,
        );
        self.guardian_state.personal_kills = system.guardian_kills();
    }
}

struct GuardianDeath<'a, W> {
    pickups: &'a mut Vec<RunPickup>,
    counter: SharedCounter,
    world: &'a mut W,
    events: &'a mut Vec<RunEvent>,
    rewards: &'a mut Vec<GuardianRewardEvent>,
    strength: &'a mut u32,
    magnet_deadlines: &'a mut Vec<azeroth_survivors_re::run_pickups::MagnetWindow>,
    zone: &'static ZoneDefinition,
    now: f32,
    rng: &'a mut NativeRng,
    enemy_id: u32,
}
impl<W: RunWorld> DeathPort for GuardianDeath<'_, W> {
    fn announce(&mut self, text: &'static str, name: &str) {
        self.events.push(RunEvent::Announcement(RunAnnouncement::emote(
            AnnouncementLabel::enemy(self.enemy_id, name), text)));
    }
    fn play_sound(&mut self, id: u32) {
        self.rewards.push(GuardianRewardEvent::Sound(id));
        self.events.push(RunEvent::PlaySound(id));
    }
    fn account_event(&mut self, event: native::rewards::GuardianAccountEvent<'_>) {
        self.events.push(RunEvent::Account {
            kind: event.event_type,
            name: AnnouncementLabel::enemy(self.enemy_id, event.name),
        });
    }
    fn create_gold_pickup(&mut self, position: [f32; 3], amount: u32) {
        let drop = PickupDrop::Gold {
            amount,
            position: treasure_chests::Position::new(position[0], position[1], position[2]),
        };
        pickup_effects::create_reward(drop, self.pickups, &mut self.counter, self.rng,
            self.world, self.zone, self.now, self.events);
    }
    fn attempt_scheduled_magnet(&mut self, position: [f32; 3]) {
        if let Some(position) = native::rewards::attempt_scheduled_magnet(
            self.magnet_deadlines,
            self.now,
            position,
            || azeroth_survivors_re::mob_loot::unit24(self.rng),
        ) {
            pickup_effects::create(PickupDrop::Magnet { position: treasure_chests::Position::new(position[0], position[1], position[2]) },
                self.pickups, &mut self.counter, self.rng, self.world, self.zone, self.now, self.events);
        }
    }
    fn queue_strength_award(&mut self) {
        *self.strength = self.strength.wrapping_add(1);
    }
}

#[cfg(test)]
mod choice_tests {
    use super::*;

    fn game() -> Mechanics {
        super::super::rng_integration::class_run("warrior", 1)
    }

    #[test]
    fn guardian_equipment_waits_for_its_strength_level_choice_then_reaches_acceptance() {
        let mut game = game();
        game.guardian_state.pending_strength = 1;
        game.drain_guardian_strength();
        assert_eq!((game.level, game.pending_levels, game.pending_guardian_jewelry()), (2, 1, 1));
        assert!(game.is_paused_for_choice());
        assert!(!game.cache_choices_active());
        assert!(game.choose(0));
        assert_eq!(game.pending_levels, 0);
        assert!(game.guardian_choices_active());
        assert!(game.cache_reward(0).is_some());
        assert!(game.choose(0));
        assert_eq!(game.pending_guardian_jewelry(), 0);
        assert!(!game.is_paused_for_choice());
    }

    #[test]
    fn stored_strength_levels_keep_two_independent_guardian_choices_and_reject_bad_indices() {
        let mut game = game();
        game.set_store_levels(true);
        game.set_choice_grants(3, 2, true);
        game.guardian_state.pending_strength = 2;
        game.drain_guardian_strength();
        assert_eq!((game.stored_levels(), game.pending_guardian_jewelry()), (2, 2));
        assert!(game.guardian_choices_active());
        assert!(game.reroll_choices());
        assert_eq!((game.pending_guardian_jewelry(), game.stored_levels(), game.choice_footer().rerolls), (2, 2, 2));
        let banish = (0..game.choices.len()).find(|index| game.can_banish_choice(*index)).unwrap();
        assert!(game.banish_choice(banish));
        assert!(game.guardian_choices_active());
        assert_eq!((game.pending_guardian_jewelry(), game.stored_levels(), game.choice_footer().banishes), (2, 2, 1));
        let before = (game.rng.words, game.gold, game.gold_earned, game.choices.len());
        assert!(!game.choose(usize::MAX));
        assert_eq!((game.rng.words, game.gold, game.gold_earned, game.choices.len()), before);
        assert_eq!(game.pending_guardian_jewelry(), 2);
        assert!(game.choose(0));
        assert_eq!((game.stored_levels(), game.pending_guardian_jewelry()), (2, 1));
        assert!(game.guardian_choices_active());
        let skip = ((game.cache_price() >> 2).max(10) as f32 * game.stats.gold_multiplier).round() as u32;
        let gold = (game.gold, game.gold_earned);
        assert!(game.skip_choices());
        assert_eq!((game.gold, game.gold_earned), (gold.0.wrapping_add(skip), gold.1.wrapping_add(skip)));
        assert_eq!((game.stored_levels(), game.pending_guardian_jewelry()), (2, 0));
        assert!(!game.choice_state.first_offer_seen);
        assert!(!game.is_paused_for_choice());
        assert!(!game.spending_levels());
        game.open_stored_levels();
        assert!(!game.cache_choices_active());
        assert!(game.choose(0));
        assert_eq!(game.stored_levels(), 1);
    }

    #[test]
    fn shared_completion_prioritizes_cache_then_guardian_then_stored_levels() {
        let mut game = game();
        game.set_store_levels(true);
        game.add_experience(5);
        game.chest_state.system.pending_choices = 1;
        game.guardian_state.pending_jewelry = 1;
        game.complete_choice();
        assert!(game.cache_choices_active());
        assert!(!game.guardian_choices_active());
        assert!(game.choose(0));
        assert_eq!((game.pending_cache_choices(), game.pending_guardian_jewelry()), (0, 1));
        assert!(game.guardian_choices_active());
        assert!(game.choose(0));
        assert_eq!((game.pending_cache_choices(), game.pending_guardian_jewelry(), game.stored_levels()), (0, 0, 1));
        assert!(!game.is_paused_for_choice());
    }

    #[test]
    fn guardian_completion_swept_xp_queues_levels_behind_the_remaining_guardian_offer() {
        let mut game = game();
        game.guardian_state.pending_jewelry = 2;
        game.generate_guardian_choices();
        let player: Position = game.zone.center.into();
        game.set_choice_player_position(player);
        game.pickups.push(RunPickup {
            created_at: 0.0, id: 1,
            drop: PickupDrop::Experience {
                amount: game.xp_required(),
                position: treasure_chests::Position::new(player.x, player.y, player.z),
            },
            flight: None, facing: 0.0, auxiliary: [None; 2],
        });
        assert!(game.choose(0));
        assert_eq!((game.level, game.pending_levels, game.pending_guardian_jewelry()), (2, 1, 1));
        assert!(game.pickups.is_empty());
        assert!(game.guardian_choices_active(), "swept XP cannot preempt the next guardian offer");
        assert!(!game.choice_state.first_offer_seen);
        assert!(game.choose(0));
        assert_eq!((game.pending_levels, game.pending_guardian_jewelry()), (1, 0));
        assert!(!game.cache_choices_active());
        assert!(game.is_paused_for_choice());
        assert!(game.choose(0));
        assert_eq!(game.pending_levels, 0);
        assert!(game.choice_state.first_offer_seen);
    }

    #[test]
    fn queued_guardian_rewards_do_not_block_rerolling_the_open_strength_level_offer() {
        let mut game = game();
        game.guardian_state.pending_strength = 1;
        game.drain_guardian_strength();
        assert_eq!((game.pending_levels, game.pending_guardian_jewelry()), (1, 1));
        assert!(!game.cache_choices_active());
        assert!(game.reroll_choices());
        assert_eq!((game.pending_levels, game.pending_guardian_jewelry(), game.choice_footer().rerolls), (1, 1, 2));
        assert!(game.is_paused_for_choice());
        assert!(!game.cache_choices_active());
        assert!(game.choose(0));
        assert!(game.guardian_choices_active());
        assert_eq!((game.pending_levels, game.pending_guardian_jewelry()), (0, 1));
    }
}
