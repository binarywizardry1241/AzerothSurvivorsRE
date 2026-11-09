//! Primary-boss runtime adapter. All scheduling, scaling, AI, ability and
//! death arithmetic is delegated to the hash-bound recovered source owners.

use super::*;
use super::incoming::DamageKind;
#[path = "gandling.rs"]
mod gandling;
#[path = "barov.rs"]
mod barov;
#[path = "kirtonos.rs"]
mod kirtonos;
#[path = "krastinov.rs"]
mod krastinov;
#[path = "ras.rs"]
mod ras;
#[path = "scripted_arena.rs"]
mod scripted_arena;
use azeroth_survivors_re::{
    bosses as native,
    mob_loot::{EquipmentRoll, MobLootWorld},
};

#[derive(Clone, Debug)]
pub struct RunBoss {
    pub guid: u64,
    pub allocation_order: u64,
    pub definition: &'static native::BossDefinition,
    pub native_level: u32,
    pub actor: Actor,
    pub health: f32,
    pub maximum_health: f32,
    pub ai: native::ai::BossAiState,
    pub minion_phases: native::minion_phases::PhaseState,
    kirtonos_forms: native::raid_transforms::KirtonosForms,
    gandling: Option<gandling::Script>,
    barov: Option<barov::Script>,
    kirtonos: Option<kirtonos::Script>,
    krastinov: Option<krastinov::Script>,
    ras: Option<ras::Script>,
    pub control: ControlWindow,
    pub periodic: Vec<ActorPeriodic>,
    pub additional_damage_taken: f32,
    pub vulnerability: f32,
    pub vulnerability_until: f32,
}

impl RunBoss {
    pub(super) fn hit_victim(&self, demoralizing_amplification: f32) -> Victim {
        Victim {
            health: self.health,
            maximum_health: self.maximum_health,
            primary_boss: true,
            guardian: false,
            has_periodic: !self.periodic.is_empty(),
            native_flag_158: 0,
            slow_until: self.actor.slow.until,
            stun_until: self.actor.stun_until,
            forced_escape_until: self.actor.forced_escape_until,
            vulnerability: self.vulnerability,
            vulnerability_until: self.vulnerability_until,
            demoralizing_amplification,
            additional_damage_taken: self.additional_damage_taken,
            dead: self.actor.dead,
        }
    }

    pub(super) fn target(&self) -> Target {
        Target {
            actor: self.actor,
            health: self.health,
            maximum_health: self.maximum_health,
            has_metadata: true,
            flagged: false,
            periodic_stacks: self
                .periodic
                .iter()
                .filter(|dot| dot.owner_kind == 0 && dot.ticks_remaining > 0)
                .map(|dot| (dot.spell_id, 1))
                .collect(),
        }
    }
}

#[derive(Clone, Copy, Debug, Default)]
pub(super) struct OtherRaidDeadlines {
    pub(super) hold_until: f32,
}

#[derive(Debug)]
pub(super) struct BossState {
    pub(super) scheduler: native::spawning::Scheduler,
    pub(super) death: native::death::BossDeathState,
    pub(super) completion: native::death::CompletionState,
    effects: native::abilities::PendingEffects,
    gandling: gandling::State,
    pub(super) defenses: std::collections::HashMap<u64, native::raid_shields::RaidDefense>,
    pub(super) wards: native::raid_wards::WardState,
    pub(super) forms: std::collections::HashMap<u64, native::raid_transforms::TransformFields>,
    pub(super) player_override: Option<(Position, f32)>,
    pub(super) aim_report: Option<native::prediction::MovementReport>,
    pub(super) aim_flags: u32,
    pub(super) other_deadlines: std::collections::HashMap<u64, OtherRaidDeadlines>,
    pub(super) pending_actions: Vec<(usize,native::RawBossAbility)>,
    pub(super) magnet_deadlines: Vec<azeroth_survivors_re::run_pickups::MagnetWindow>,
    pub(super) equipment: progression::EquipmentDrops,
    pub(super) shared_equipment: Option<Vec<(u64, &'static native::BossDefinition)>>,
    /// Current Game+cd8 is world state, excluded from the private hero swap.
    pub(super) endless_bosses: u32,
    pub(super) shared_killing_blows: Vec<(u8, azeroth_survivors_re::account_progression::BossKillingBlow)>,
    pub(super) party_feats: super::party_achievements::State,
    pub(super) shared_boss_flags: Vec<(u8, azeroth_survivors_re::coop::replication::BossFlagRow)>,
}

impl BossState {
    pub(super) fn retirement_ground_objects(&self, bosses: &[RunBoss]) -> Vec<u64> {
        self.effects.impacts.iter().filter_map(|row| row.remove_object)
            .chain(self.effects.raid_areas.object_guids())
            .chain(self.gandling.object_guids())
            .chain(bosses.iter().filter_map(|row| row.barov.as_ref()).flat_map(barov::Script::burn_guids))
            .filter(|guid| *guid != 0).collect()
    }

    pub(super) fn allocate_affix_marker(&mut self) -> u32 {
        self.effects.raid_areas.allocate_marker_id()
    }

    pub(super) fn phase(&self) -> u32 {
        self.completion.phase
    }
    pub(super) fn endless_started_at(&self) -> f32 {
        self.completion.phase_started_at
    }
    pub(super) fn continue_endless(&mut self, now: f32, hyper: bool) {
        self.scheduler.endless_deadline = now + native::spawning::endless_interval_seconds(hyper);
        self.completion.endless_enabled = true;
        self.completion.run_state = 1;
    }
    pub(super) fn new(endless: bool) -> Self {
        Self {
            scheduler: native::spawning::Scheduler::default(),
            death: native::death::BossDeathState {
                boss_kills: 0,
                clear_marker: 2,
                clear_marked_at: 0.0,
            },
            completion: native::death::CompletionState {
                phase: 0,
                phase_started_at: 0.0,
                run_state: 1,
                endless_enabled: endless,
                victories: 0,
            },
            effects: native::abilities::PendingEffects::default(),
            gandling: gandling::State::default(),
            defenses: std::collections::HashMap::new(),
            wards: native::raid_wards::WardState::default(),
            forms: std::collections::HashMap::new(),
            player_override: None,
            aim_report: None,
            aim_flags: 0,
            other_deadlines: std::collections::HashMap::new(),
            pending_actions: Vec::new(),
            magnet_deadlines: Vec::new(),
            equipment: progression::EquipmentDrops::default(),
            shared_equipment: None,
            endless_bosses: 0,
            shared_killing_blows: Vec::new(),
            party_feats: Default::default(),
            shared_boss_flags: Vec::new(),
        }
    }
}

impl Mechanics {
    /// Raw flags are retained before floor admission; accepted pose/time stay separate.
    pub fn record_boss_movement_flags(&mut self, flags: u32) {
        self.boss_state.aim_flags = flags;
    }

    /// Only an admitted report refreshes the boss aiming pose/facing/clock.
    pub fn record_boss_movement_report(&mut self, position: Position, facing: f32, flags: u32) {
        self.record_boss_movement_flags(flags);
        self.boss_state.aim_report = Some(native::prediction::MovementReport {
            position, facing, flags, accepted_at: self.clock,
        });
    }

    fn apply_raid_post_actions(&mut self, actions: Vec<RaidPostAction>, player: Position,
        world: &mut impl RunWorld) {
        for action in actions {
            match action {
                RaidPostAction::Heal {source,fraction,spell} => wards::heal_source(
                    &mut self.actors,&mut self.bosses,&mut self.boss_state.wards,
                    &mut self.events,source,fraction,spell),
                RaidPostAction::Expose {source,until} => {
                    let alive = self.bosses.iter().any(|row| row.guid == source && !row.actor.dead)
                        || self.actors.iter().any(|row| row.guid == source && !row.actor.dead)
                        || self.boss_state.wards.actors.iter().any(|row| row.guid == source && !row.actor.dead);
                    if alive {
                        let defense = self.boss_state.defenses.entry(source).or_default();
                        defense.exposed_until = until; defense.shield_until = 0.0;
                        let name = if let Some(row) = self.bosses.iter().find(|row| row.guid == source) {
                            AnnouncementLabel::boss(row.definition.id,row.definition.name)
                        } else if let Some(row) = self.actors.iter().find(|row| row.guid == source) {
                            AnnouncementLabel::enemy(row.definition.id,row.definition.name)
                        } else { AnnouncementLabel::literal("Enemy") };
                        self.events.push(RunEvent::Announcement(RunAnnouncement::raid_warning(
                            name,native::raid_warnings::RaidWarning::Weakened)));
                    }
                }
                RaidPostAction::Spawn {kind,index,position} => {
                    let live_bosses = self.bosses.iter().filter(|row| !row.actor.dead).count()
                        + self.boss_state.wards.actors.iter().filter(|row| !row.actor.dead).count();
                    if self.zone.enemies.is_empty() || self.actors.iter().filter(|row| !row.actor.dead).count()
                        + live_bosses >= scaling::population_limit(self.rules.density_percent) { continue; }
                    // Native31's first eight bytes are one usize definition
                    // index, not an ordinary/elite enum or a ground-object ID.
                    let native_index = u64::from(kind) | (u64::from(index)<<32);
                    let selected = native_index.min((self.zone.enemies.len()-1) as u64) as usize;
                    let mut port = SpawnAdapter {party_health_multiplier:self.party_health_factors()[0],
                        zone:self.zone,rules:self.rules,
                        phase:self.boss_state.phase(),endless_started_at:self.boss_state.endless_started_at(),
                        now:self.clock,run_level:self.level,player,velocity:[0.0;2],actors:&mut self.actors,
                        live_bosses,counter:&mut self.counter,world,events:&mut self.events};
                    port.create(selected,Some(position),&mut self.rng);
                }
            }
        }
    }
    ///145917ffc..145918069 calls the shared constructor for all five zone
    /// rows. It leaves the normal schedule cursor at its constructor value.
    pub(super) fn spawn_showcase_bosses(
        &mut self,
        player: Position,
        velocity: [f32; 2],
        world: &mut impl RunWorld,
    ) {
        let Some(zone) = native::catalog::ZoneDefinition::by_key(self.zone.key) else {
            return;
        };
        let mut port = BossSpawner {
            party_health_multiplier: self.party_health_factors()[1],
            scripted_hero_count: self.active_scripted_targets().count().max(1),
            zone,
            rules: self.rules,
            phase: self.boss_state.phase(),
            endless_started_at: self.boss_state.endless_started_at(),
            now: self.clock,
            run_level: self.level,
            player,
            velocity,
            world,
            counter: &mut self.counter,
            rows: &mut self.bosses,
            forms: &mut self.boss_state.forms,
            events: &mut self.events,
        };
        native::spawning::startup_bosses(zone, 1, &mut self.rng, &mut port);
    }

    /// Selected 0.105.0 serializer1458fad90: positive remaining time only.
    /// Keep the schedule cursor separate from the live rows: dead bosses are
    /// removed, and a showcase can create bosses without advancing the cursor.
    pub fn hud_next_boss(&self) -> Option<f32> {
        if let Some(hud)=self.replica_hud().filter(|_|self.replica_state().is_some()) {
            return hud.get("nextBoss").and_then(serde_json::Value::as_f64).map(|value|value as f32);
        }
        let scheduler = &self.boss_state.scheduler;
        let deadline = if scheduler.next_primary < native::spawning::PRIMARY_COUNT {
            let boss = native::catalog::ZoneDefinition::by_key(self.zone.key)?
                .bosses.get(scheduler.next_primary)?;
            native::spawning::primary_minutes(boss.time_minutes, self.rules.hyper) * 60.0
        } else if self.rules.endless {
            scheduler.endless_deadline
        } else {
            return None;
        };
        let remaining = deadline - self.clock;
        (remaining > 0.).then_some(remaining)
    }

    pub fn boss_kills(&self) -> u32 {
        self.replica_state().map_or(self.boss_state.death.boss_kills, |state| state.boss_kills)
    }
    /// Recovered drops are queued for the completion/account persistence owner;
    /// this adapter does not silently equip or write them to the menu save.
    pub fn queued_equipment(&self) -> Vec<u32> {
        self.boss_state.equipment.pending()
    }

    pub(super) fn spawn_due_bosses(
        &mut self,
        player: Position,
        velocity: [f32; 2],
        world: &mut impl RunWorld,
    ) {
        let Some(zone) = native::catalog::ZoneDefinition::by_key(self.zone.key) else {
            return;
        };
        let mut port = BossSpawner {
            party_health_multiplier: self.party_health_factors()[1],
            scripted_hero_count: self.active_scripted_targets().count().max(1),
            zone,
            rules: self.rules,
            phase: self.boss_state.phase(),
            endless_started_at: self.boss_state.endless_started_at(),
            now: self.clock,
            run_level: self.level,
            player,
            velocity,
            world,
            counter: &mut self.counter,
            rows: &mut self.bosses,
            forms: &mut self.boss_state.forms,
            events: &mut self.events,
        };
        self.boss_state.scheduler.tick_for_rank(
            zone,
            self.clock,
            self.rules.endless,
            false,
            &mut self.rng,
            &mut port,
            self.rules.heroic_rank,
            self.rules.hyper,
        );
    }

    pub(super) fn resolve_boss_effects(
        &mut self,
        elapsed: f32,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        self.expire_raid_root();
        // Defense metadata has the same lifetime as its real source actor.
        let actors = &self.actors;
        let bosses = &self.bosses;
        let wards = &self.boss_state.wards;
        self.boss_state.defenses.retain(|guid, _| actors.iter().any(|row| row.guid == *guid)
            || bosses.iter().any(|row| row.guid == *guid)
            || wards.actors.iter().any(|row| row.guid == *guid));
        let scripted_active = self.zone.key == azeroth_survivors_re::zones::scholomance::KEY
            || bosses.iter().any(|row| row.gandling.is_some() || row.kirtonos.is_some()
                || row.ras.is_some() || row.krastinov.is_some() || row.barov.is_some());
        let scripted_heroes = if !scripted_active || self.coop.active_slot != 0 {
            Vec::new()
        } else if self.has_party() {
            self.active_scripted_targets()
                .map(|(guid, position)| gandling::HeroPose { guid, position })
                .collect()
        } else if self.active_run_state() {
            vec![gandling::HeroPose { guid: self.player_guid, position: player }]
        } else {
            Vec::new()
        };
        let mut incoming = Vec::new();
        let mut port = BossCombat {
            aim_report: self.boss_state.aim_report,
            aim_flags: self.boss_state.aim_flags,
            player_run_speed: self.player_run_speed(),
            party_health_multiplier: self.party_health_factors()[0],
            player_guid: self.player_guid,
            cooperative: self.has_party(), active_slot: self.coop.active_slot, source_targets: &self.coop.targets,
            player_active: self.active_run_state(),
            run_level: self.level,
            phase: self.boss_state.phase(),
            endless_started_at: self.boss_state.endless_started_at(),
            actors: &mut self.actors,
            bosses: &mut self.bosses,
            guardian_state: &mut self.guardian_state,
            defenses: &mut self.boss_state.defenses,
            wards: &mut self.boss_state.wards, forms: &mut self.boss_state.forms,
            other_deadlines: &mut self.boss_state.other_deadlines, object_counter: self.counter.clone(),
            player_mover: &mut self.player_mover, player_override: &mut self.boss_state.player_override,
            generic: &mut self.effect_state.generic,
            endless_enabled: self.boss_state.completion.endless_enabled,
            world,
            rules: self.rules,
            zone: self.zone,
            now: self.clock,
            player,
            events: &mut self.events,
            movement_counter: &mut self.movement_counter,
            incoming: &mut incoming,
            damage_event_boundary: None, knockback: None, root: None, bomb_bursts: Vec::new(), post_actions: Vec::new(),
        };
        self.boss_state.effects.resolve_due_with_rng(self.clock, elapsed, &mut port,
            &mut self.rng, &mut self.counter);
        let mut scripted_moves = Vec::new();
        if scripted_active {
            if port.active_slot == 0 {
                let state = &mut self.boss_state.gandling;
                port.advance_kirtonos(state, &scripted_heroes);
                port.advance_ras(state, &scripted_heroes, &mut self.rng);
                port.advance_krastinov(state, &scripted_heroes);
                port.advance_barov(state, &scripted_heroes);
                port.advance_gandling(state, &scripted_heroes);
            }
            port.sample_gandling(&mut self.boss_state.gandling, elapsed, &mut scripted_moves);
        }
        let boundary = port.damage_event_boundary;
        let knockback = port.knockback;
        let root = port.root;
        let bomb_bursts = std::mem::take(&mut port.bomb_bursts);
        let post_actions = std::mem::take(&mut port.post_actions);
        let player = port.player;
        let facing = port.player_override.as_ref().map_or(facing, |(_, angle)| *angle);
        // Native aggregate victim damage precedes its phase-gated launch and
        // the separate delayed-visual queue. Preserve that order through the
        // adapter's deferred damage calls.
        let trailing = boundary.map(|index| self.events.split_off(index)).unwrap_or_default();
        let mut scripted_player = player;
        let mut scripted_moves = scripted_moves.into_iter().peekable();
        for (index, (amount, source_guid, spell_id)) in incoming.into_iter().enumerate() {
            self.damage_player_from(amount, DamageKind::Mechanic(spell_id), source_guid, scripted_player, facing, world);
            if scripted_moves.peek().is_some_and(|(hit, _)| *hit == index) {
                let (_, motion) = scripted_moves.next().unwrap();
                match motion {
                    gandling::Motion::Push { origin, fallback, distance } => {
                        self.apply_kirtonos_push(origin, fallback, distance, scripted_player, facing, world);
                    }
                    gandling::Motion::Hook { origin } => {
                        self.apply_krastinov_hook(origin, scripted_player, world);
                    }
                    gandling::Motion::Rush { origin, angle } => {
                        self.apply_krastinov_rush_push(origin, angle, scripted_player, facing, world);
                    }
                }
                if let Some((position, _)) = self.boss_state.player_override {
                    scripted_player = position;
                }
            }
        }
        if let Some((source, spell, duration)) = root {
            self.apply_raid_root(source, spell, duration);
        }
        if self.active_run_state() {
            if let Some((angle, speed)) = knockback {
                let event = self.player_mover.knockback(angle, speed);
                self.events.push(RunEvent::PlayerMover(event));
            }
        }
        self.apply_raid_bomb_hits(bomb_bursts, player, facing, world);
        self.apply_raid_post_actions(post_actions, player, world);
        self.events.extend(trailing);
    }

    pub(super) fn expire_scripted_attacks(&mut self, elapsed: f32, world: &mut impl RunWorld) {
        self.boss_state.gandling.publish_launches(
            self.clock,
            elapsed,
            self.zone,
            world,
            &mut self.events,
        );
        let blood_hits = self.boss_state.gandling.take_blood_hits();
        for (_, _, source, count) in blood_hits {
            self.apply_kirtonos_blood(source, count as usize);
        }
        for (source, point) in self.boss_state.gandling.take_immolate_impacts() {
            self.apply_barov_immolate(source, point, world);
        }
        self.boss_state.gandling.expire(self.clock, &mut self.events);
    }

    pub(super) fn tick_boss(
        &mut self,
        index: usize,
        delta: f32,
        player: Position,
        world: &mut impl RunWorld,
        frame: &mut actor_frame::ActorFrame,
    ) {
        let row = &mut self.bosses[index];
        let result = row.ai.tick_with_minion_phases_for_rank(
            row.definition, index, &mut row.actor, row.health, row.maximum_health,
            ai::Context { now: self.clock, elapsed: delta, player,
                zone_center: self.zone.center.into(), zone_radius: self.zone.radius },
            world, &ai::HostMath, &mut row.minion_phases, self.rules.heroic_rank,
        );
        frame.collect(row.guid, result.common_actions);
        // Current primary phases use the GUID-bearing0x0c packet queue;
        // guardian phases use the later0x5a queue instead.
        frame.yells.extend(result.phase_yells.into_iter().filter(|phase|
            native::abilities::initial_raid_action_enabled_for_rank(phase.native_tag, self.rules.heroic_rank)
        ).map(|phase|
            RunAnnouncement::Yell {
                guid: row.guid,
                name: AnnouncementLabel::boss(row.definition.id, row.definition.name),
                text: AnnouncementLabel::boss_phase(row.definition.id, phase.phase_index, phase.yell),
            }));
        self.boss_state.pending_actions.extend(result.abilities.into_iter()
            .map(|request| (frame.actor_index, request.ability)));
    }

    /// Current guardian signatures dispatch into the same hazard vector,
    /// serials and client event channel as primary bosses.
    pub(super) fn dispatch_pending_raid_requests(&mut self, player: Position,
        world: &mut impl RunWorld) -> Vec<(f32, u64, u32)> {
        let requests = std::mem::take(&mut self.boss_state.pending_actions);
        if !self.has_party() { return self.dispatch_raid_requests(requests, player, world); }
        for request @ (actor_index, ability) in requests {
            if ability.words[0] == u32::MAX { break; }
            let current = self.counter.sequence();
            let mut sources: Vec<_> = self.actors.iter().map(|row| (row.allocation_order, row.guid))
                .chain(self.bosses.iter().map(|row| (row.allocation_order, row.guid)))
                .chain(self.boss_state.wards.actors.iter().map(|row| (row.allocation_order, row.guid))).collect();
            sources.sort_by_key(|(allocated, _)| std::cmp::Reverse(current.wrapping_sub(*allocated)));
            let Some(&(_, guid)) = sources.get(actor_index) else { continue; };
            let slot = self.coop.targets.get(&guid).copied().unwrap_or(0);
            let Some(input) = self.party_input_for(slot) else { continue; };
            self.with_party_hero(slot, |game| {
                let incoming = game.dispatch_raid_requests(vec![request], input.position, world);
                for (amount, source, spell_id) in incoming {
                    game.damage_player_from(amount, DamageKind::Mechanic(spell_id), source, input.position, input.facing, world);
                }
            });
        }
        Vec::new()
    }

    fn dispatch_raid_requests(&mut self, requests: Vec<(usize, native::RawBossAbility)>, player: Position,
        world: &mut impl RunWorld) -> Vec<(f32, u64, u32)> {
        // Selected0.109.0 SHA76e7fb48: all493 current semantic records,
        // including recursive children, use queued hazards or non-damage
        // producers. Historical immediate AreaStrike is unreachable here;
        // check-actor-frame-order guards that boundary for this exact target.
        let mut incoming = Vec::new();
        let mut port = BossCombat {
            aim_report: self.boss_state.aim_report,
            aim_flags: self.boss_state.aim_flags,
            player_run_speed: self.player_run_speed(),
            party_health_multiplier: self.party_health_factors()[0],
            player_guid: self.player_guid,
            cooperative: self.has_party(), active_slot: self.coop.active_slot, source_targets: &self.coop.targets,
            player_active: self.active_run_state(),
            run_level: self.level, phase: self.boss_state.phase(),
            endless_started_at: self.boss_state.endless_started_at(),
            actors: &mut self.actors, bosses: &mut self.bosses,
            guardian_state: &mut self.guardian_state,
            defenses: &mut self.boss_state.defenses,
            wards: &mut self.boss_state.wards, forms: &mut self.boss_state.forms,
            other_deadlines: &mut self.boss_state.other_deadlines, object_counter: self.counter.clone(),
            player_mover: &mut self.player_mover, player_override: &mut self.boss_state.player_override,
            generic: &mut self.effect_state.generic,
            endless_enabled: self.boss_state.completion.endless_enabled, world, rules: self.rules,
            zone: self.zone, now: self.clock, player, events: &mut self.events,
            movement_counter: &mut self.movement_counter, incoming: &mut incoming,
            damage_event_boundary: None, knockback: None, root: None, bomb_bursts: Vec::new(), post_actions: Vec::new(),
        };
        for (actor_index, ability) in requests {
            use native::abilities::CombatPort;
            // Current native queue checks the terminator, then suppresses
            // towers/gaze before actor lookup; collection retains its state.
            if ability.words[0] == u32::MAX { break; }
            if !native::abilities::queued_action_enabled_for_rank(&ability, port.rules.heroic_rank) { continue; }
            // Native145957954 resolves the saved shared-vector index AFTER
            // stable corpse compaction. Earlier actions may append actors;
            // out-of-bounds slots return silently, and dead slots are refused.
            let current = port.object_counter.sequence();
            let mut sources: Vec<_> = port.actors.iter().map(|row| (row.allocation_order,row.guid))
                .chain(port.bosses.iter().map(|row| (row.allocation_order,row.guid)))
                .chain(port.wards.actors.iter().map(|row| (row.allocation_order,row.guid))).collect();
            sources.sort_by_key(|(allocated,_)| std::cmp::Reverse(current.wrapping_sub(*allocated)));
            let Some(&(_,guid)) = sources.get(actor_index) else { continue; };
            let Some(context) = port.raid_context(guid,self.clock) else { continue };
            if let Err(error) = native::abilities::dispatch_live(&ability, context,
                    &mut self.rng, &mut self.counter, &mut self.boss_state.effects,
                    &mut port, &ai::HostMath) {
                    bevy::log::warn!("Unrecovered current raid ability tag {}", error.0);
            }
        }
        incoming
    }

    pub(super) fn finish_boss_completion(&mut self, world: &mut impl RunWorld) {
        if native::death::finish_normal_run(&mut self.boss_state.completion) {
            self.completed = true;
            self.effect_state.victory_reached = true;
            self.root_player(true);
            self.freeze_world_movements(|xy| world.height(xy));
            self.events.push(RunEvent::Victory);
        }
    }
}

struct BossSpawner<'a, W> {
    party_health_multiplier: f32,
    scripted_hero_count: usize,
    zone: &'static native::catalog::ZoneDefinition,
    rules: RunRules,
    phase: u32,
    endless_started_at: f32,
    now: f32,
    run_level: u32,
    player: Position,
    velocity: [f32; 2],
    world: &'a mut W,
    counter: &'a mut dyn NativeCounter,
    rows: &'a mut Vec<RunBoss>,
    forms: &'a mut std::collections::HashMap<u64, native::raid_transforms::TransformFields>,
    events: &'a mut Vec<RunEvent>,
}

impl<W: RunWorld> native::spawning::SpawnPort for BossSpawner<'_, W> {
    fn has_living_primary_boss(&self) -> bool {
        self.rows.iter().any(|row| !row.actor.dead)
    }

    fn spawn_boss(&mut self, index: usize, definition: &'static native::BossDefinition, rng: &mut NativeRng) {
        self.spawn_boss_with_health_factor(index, definition, rng, 1.0);
    }
    fn spawn_boss_with_health_factor(
        &mut self, _: usize, definition: &'static native::BossDefinition,
        rng: &mut NativeRng, health_factor: f32,
    ) {
        let position = native::placement::sample_position(
            self.zone,
            self.player,
            self.velocity,
            rng,
            self.world,
            &mut HostPlacementMath,
        );
        let stats = native::scaling::initial_heroic_stats(
            ScalingInput {
                clock_seconds: self.now,
                difficulty: self.rules.difficulty,
                zone_scale: self.zone.scalar_e0,
                hp_percent: self.rules.hp_percent,
                damage_percent: self.rules.damage_percent,
                speed_percent: self.rules.speed_percent,
                phase: self.phase,
                endless: self.rules.endless,
                endless_start_seconds: self.endless_started_at,
            },
            definition,
            self.rules.heroic_rank,
        );
        let mut stats = stats;
        stats.health *= self.party_health_multiplier;
        stats.max_health *= self.party_health_multiplier;
        stats.health *= health_factor;
        stats.max_health *= health_factor;
        let (guid, allocation_order) =
            azeroth_survivors_re::native_counter::creature_guid_with_order(definition.id, self.counter);
        self.rows.push(RunBoss {
            guid,
            allocation_order,
            definition,
            // Current1454d11f0 passes1 into the shared1454d2910 constructor.
            native_level: native_actor_level(self.run_level, 1),
            actor: native::ai::make_combat_actor(guid, position, self.now, &stats),
            health: stats.health,
            maximum_health: stats.max_health,
            ai: native::ai::BossAiState::new(definition),
            minion_phases: native::minion_phases::PhaseState::default(),
            kirtonos_forms: native::raid_transforms::KirtonosForms::default(),
            gandling: (definition.id == gandling::ENTRY).then(|| gandling::Script::new(self.now)),
            barov: (definition.id == barov::ENTRY).then(|| barov::Script::new(self.now)),
            kirtonos: (definition.id == kirtonos::ENTRY)
                .then(|| kirtonos::Script::new(self.now, self.scripted_hero_count)),
            krastinov: (definition.id == krastinov::ENTRY).then(|| krastinov::Script::new(self.now)),
            ras: (definition.id == ras::ENTRY).then(|| ras::Script::new(self.now)),
            control: ControlWindow::for_enemy(true),
            periodic: Vec::new(),
            additional_damage_taken: 0.0,
            vulnerability: 0.0,
            vulnerability_until: 0.0,
        });
        if let Some(fields) = native::raid_transforms::initial_boss_fields(
            definition.id, definition.model_id, definition.scale,
        ) {
            self.events.push(RunEvent::ActorFields { target: guid, fields: fields.fields.clone() });
            self.forms.insert(guid, fields);
        }
        let name = AnnouncementLabel::boss(definition.id, definition.name);
        self.events.push(RunEvent::Announcement(RunAnnouncement::Yell { guid,
            name: name.clone(), text: AnnouncementLabel::boss_yell(definition.id, definition.yell) }));
        self.events.push(RunEvent::Announcement(RunAnnouncement::emote(
            name, "%s enters the battlefield!")));
        self.events.extend(
            native::spawning::arrival_sounds(definition).map(RunEvent::PlaySound),
        );
        self.events.push(RunEvent::BossBanner { id: definition.id, name: definition.name,
            final_boss: definition.flag_54 != 0 });
    }
}

struct BossCombat<'a, W> {
    aim_report: Option<native::prediction::MovementReport>,
    aim_flags: u32,
    player_run_speed: f32,
    party_health_multiplier: f32,
    player_guid: u64,
    cooperative: bool,
    active_slot: u8,
    source_targets: &'a std::collections::HashMap<u64, u8>,
    player_active: bool,
    run_level: u32,
    phase: u32,
    endless_started_at: f32,
    actors: &'a mut Vec<RunActor>,
    bosses: &'a mut Vec<RunBoss>,
    guardian_state: &'a mut guardians::GuardianState,
    defenses: &'a mut std::collections::HashMap<u64, native::raid_shields::RaidDefense>,
    wards: &'a mut native::raid_wards::WardState,
    forms: &'a mut std::collections::HashMap<u64, native::raid_transforms::TransformFields>,
    other_deadlines: &'a mut std::collections::HashMap<u64, OtherRaidDeadlines>,
    object_counter: SharedCounter,
    player_mover: &'a mut player_mover::PlayerMover,
    player_override: &'a mut Option<(Position, f32)>,
    generic: &'a mut callbacks::State,
    endless_enabled: bool,
    world: &'a mut W,
    rules: RunRules,
    zone: &'static ZoneDefinition,
    now: f32,
    player: Position,
    events: &'a mut Vec<RunEvent>,
    movement_counter: &'a mut dyn NativeCounter,
    incoming: &'a mut Vec<(f32, u64, u32)>,
    damage_event_boundary: Option<usize>,
    knockback: Option<(f32, f32)>,
    root: Option<(u64, u32, f32)>,
    bomb_bursts: Vec<(Position,f32,f32,u32)>,
    post_actions: Vec<RaidPostAction>,
}

enum RaidPostAction {
    Spawn { kind: u32, index: u32, position: Position },
    Expose { source: u64, until: f32 },
    Heal { source: u64, fraction: f32, spell: u32 },
}

impl<W: RunWorld> native::abilities::CombatPort for BossCombat<'_, W> {
    fn heroic_rank(&self) -> u8 { self.rules.heroic_rank }
    fn raid_hazard_positions(&mut self) -> (Position, Position) {
        let mut report = self.aim_report.unwrap_or(native::prediction::MovementReport {
            position: self.player, facing: 0.0, flags: 0, accepted_at: 0.0,
        });
        // The live admitted/forced pose can change without a fresh movement
        // report; facing, report clock and raw intent retain their own owners.
        report.position = self.player;
        report.flags = self.aim_flags;
        native::prediction::hazard_positions(report, self.player_run_speed, self.now, self)
    }
    fn raid_aim(&mut self, context: native::abilities::CombatContext, windup: f32) -> Position {
        let mut report = self.aim_report.unwrap_or(native::prediction::MovementReport {
            position: context.player, facing: 0.0, flags: 0, accepted_at: 0.0,
        });
        report.flags = self.aim_flags;
        let primary_boss = self.bosses.iter().any(|row| row.guid == context.source_guid);
        native::prediction::aim(report, self.player_run_speed, self.rules.heroic_rank,
            context.now, windup, primary_boss, self)
    }
    fn raid_source_selected(&self, guid: u64) -> bool {
        !self.cooperative || self.source_targets.get(&guid).copied().unwrap_or(0) == self.active_slot
    }
    fn raid_transform(&mut self, source: u64, index: usize) {
        let action = native::raid_native_catalog::ACTIONS[index];
        // Universal native cast/hold precede both optional recurring lanes and
        // the appearance helper's separate definition-pointer gate.
        self.raid_cast(source,action.words[4],1.0);
        self.raid_hold(source,1.0);
        let base = if let Some(row) = self.bosses.iter().find(|row| row.guid == source && !row.actor.dead) {
            Some((row.definition.model_id,row.definition.scale))
        } else if let Some(row) = self.actors.iter().find(|row| row.guid == source && !row.actor.dead) {
            Some((row.definition.model_id,self.guardian_state.render_scale(source).unwrap_or(row.definition.scale)))
        } else { None };
        if action.native_tag != 2 {
            if let Some((display,scale)) = base {
                let fields = native::raid_transforms::raid_transform_fields(index,display,scale);
                self.events.push(RunEvent::ActorFields {target:source,fields:fields.fields.clone()});
                self.forms.insert(source,fields);
            }
        }
        if let Some(row) = self.bosses.iter_mut().find(|row| row.guid == source && !row.actor.dead) {
            row.ai.raid_schedule.replace_moves(index);
        }
        self.guardian_state.raid_replace_moves(source,index);
    }
    fn raid_heal_source(&mut self, source: u64, fraction: f32, spell: u32) {
        self.post_actions.push(RaidPostAction::Heal {source,fraction,spell});
    }

    fn raid_teleport(&mut self, source: u64, destination: Position, angle: f32) {
        let actor = self.bosses.iter_mut().find(|row| row.guid == source).map(|row| &mut row.actor)
            .or_else(|| self.actors.iter_mut().find(|row| row.guid == source).map(|row| &mut row.actor))
            .or_else(|| self.wards.actors.iter_mut().find(|row| row.guid == source).map(|row| &mut row.actor));
        let Some(actor) = actor else { return };
        actor.movement = ai::Movement {from:destination,to:destination,started_at:self.now,duration:0.0};
        actor.movement_angle = angle;
    }
    fn raid_context(&self, guid: u64, now: f32) -> Option<native::abilities::CombatContext> {
        let snapshot = self.bosses.iter().find(|row| row.guid == guid && !row.actor.dead)
            .map(|row| native::ai::AbilityActor { actor: row.actor, enraged: row.ai.enraged })
            .or_else(|| self.actors.iter().find(|row| row.guid == guid && !row.actor.dead)
                .map(|row| native::ai::AbilityActor { actor: row.actor, enraged: false }))
            .or_else(|| self.wards.actors.iter().find(|row| row.guid == guid && !row.actor.dead)
                .map(|row| native::ai::AbilityActor { actor: row.actor, enraged: false }))?;
        Some(native::abilities::CombatContext { source_guid: guid, player_guid: self.player_guid,
            now, source: snapshot.actor.movement.position_at(now), player: self.player,
            effective_damage: native::ai::effective_ability_damage(snapshot, now) })
    }
    fn raid_source_maximum_health(&self, guid: u64) -> Option<f32> {
        self.bosses.iter().find(|row| row.guid == guid && !row.actor.dead).map(|row| row.maximum_health)
            .or_else(|| self.actors.iter().find(|row| row.guid == guid && !row.actor.dead).map(|row| row.maximum_health))
            .or_else(|| self.wards.actors.iter().find(|row| row.guid == guid && !row.actor.dead).map(|row| row.maximum_health))
    }
    fn raid_spawn_ward(&mut self, request: native::raid_wards::Spawn) {
        let Some(baseline) = self.zone.enemies.first() else { return };
        self.wards.spawn(request, self.now, self.run_level, baseline, self.player,
            &mut self.object_counter);
    }
    fn raid_expose(&mut self, guid: u64, until: f32) {
        self.post_actions.push(RaidPostAction::Expose {source:guid,until});
    }
    fn raid_spawn_at(&mut self, kind: u32, index: u32, position: Position) {
        self.post_actions.push(RaidPostAction::Spawn {kind,index,position});
    }
    fn raid_whirlwind(&mut self, guid: u64, until: f32) {
        if let Some(row) = self.bosses.iter_mut().find(|row| row.guid == guid) {
            row.actor.whirlwind_until = until;
        } else if let Some(row) = self.actors.iter_mut().find(|row| row.guid == guid) {
            row.actor.whirlwind_until = until;
        } else if let Some(row) = self.wards.actors.iter_mut().find(|row| row.guid == guid) {
            row.actor.whirlwind_until = until;
        }
    }
    fn raid_dynamic_object(&mut self, spell: u32, radius: f32, point: Position) -> u64 {
        let object = native::abilities::ground_object(&mut self.object_counter, 1, spell, radius, point);
        let guid = object.guid;
        self.events.push(RunEvent::Ground(object));
        guid
    }
    fn raid_pull(&mut self, source: u64) {
        // Current delayed native36 removes its queue row/source-admits first,
        // then14591684a requires mode1 before player movement.
        if !self.player_active { return; }
        let actor = self.bosses.iter().find(|row| row.guid == source && !row.actor.dead).map(|row| row.actor)
            .or_else(|| self.actors.iter().find(|row| row.guid == source && !row.actor.dead).map(|row| row.actor))
            .or_else(|| self.wards.actors.iter().find(|row| row.guid == source && !row.actor.dead).map(|row| row.actor));
        let Some(actor) = actor else { return };
        let from = actor.movement.position_at(self.now);
        let angle = (self.player.y-from.y).atan2(self.player.x-from.x);
        let reach = actor.melee_reach + 1.5;
        let mut point = Position { x: angle.cos()*reach+from.x,
            y: angle.sin()*reach+from.y, z: from.z };
        if let Some(fraction) = self.world.ray_fraction(from, point) {
            if !(fraction >= 1.0) {
                let dx = point.x-from.x; let dy = point.y-from.y;
                let length = (dy * dy + dx * dx).sqrt().max(0.5);
                let fraction = (fraction-0.5/length).max(0.0);
                point = Position { x:(point.x-from.x)*fraction+from.x,
                    y:(point.y-from.y)*fraction+from.y, z:from.z };
            }
        }
        let dx = point.x-self.zone.center[0]; let dy = point.y-self.zone.center[1];
        let distance = dx.hypot(dy); let radius = self.zone.radius-4.0;
        if distance >= 0.01 && distance > radius {
            point.x = (dx/distance)*radius+self.zone.center[0];
            point.y = (dy/distance)*radius+self.zone.center[1];
        }
        point.z = self.world.height([point.x,point.y]).unwrap_or(point.z)+0.5;
        let facing = angle+std::f32::consts::PI;
        self.player = point;
        *self.player_override = Some((point,facing));
        self.events.push(RunEvent::PlayerMover(self.player_mover.teleport(
            [point.x,point.y,point.z],facing)));
        self.events.push(RunEvent::Spell(SpellCast { source_guid: source, spell_id:21147,
            target:native::abilities::CastTarget::Ground(point),hit_targets:Vec::new() }));
    }
    fn raid_damage_multiplier(&self) -> f32 {
        azeroth_survivors_re::heroic::raid_damage_factor(self.rules.heroic_rank, self.endless_enabled)
    }
    fn raid_marker(&mut self, message: serde_json::Value) {
        self.events.push(RunEvent::RaidMarker(message));
    }
    fn raid_source(&self, guid: u64) -> Option<Position> {
        self.bosses.iter().find(|row| row.guid == guid && !row.actor.dead)
            .map(|row| row.actor.movement.position_at(self.now))
            .or_else(|| self.actors.iter().find(|row| row.actor.guid == guid && !row.actor.dead)
                .map(|row| row.actor.movement.position_at(self.now)))
            .or_else(|| self.wards.actors.iter().find(|row| row.guid == guid && !row.actor.dead)
                .map(|row| row.actor.movement.position_at(self.now)))
    }
    fn raid_source_scale(&self, guid: u64) -> f32 {
        self.bosses.iter().find(|row| row.guid == guid).map(|row| row.definition.scale)
            .or_else(|| self.guardian_state.render_scale(guid))
            .or_else(|| self.actors.iter().find(|row| row.guid == guid).map(|row| row.definition.scale))
            .or_else(|| self.wards.actors.iter().find(|row| row.guid == guid).map(|row| row.template.scale))
            .unwrap_or(1.)
    }
    fn primary_height(&mut self, xy: [f32; 2]) -> Option<f32> {
        self.world.height(xy)
    }
    fn secondary_height(&mut self, xy: [f32; 2]) -> Option<f32> {
        self.world.secondary_height(xy)
    }
    fn fallback_height(&self) -> f32 {
        Terrain::fallback_height(self.world)
    }
    fn ray_fraction(&mut self, from: Position, to: Position) -> Option<f32> {
        self.world.ray_fraction(from, to)
    }
    fn cast_spell(&mut self, request: SpellCast) {
        self.events.push(RunEvent::Spell(request));
    }
    fn create_ground_object(&mut self, object: GroundObject) {
        self.events.push(RunEvent::Ground(object));
    }
    fn remove_ground_object(&mut self, guid: u64) {
        self.events.push(RunEvent::RemoveObject(guid));
    }
    fn spawn_minion(
        &mut self,
        request: native::abilities::MinionSpawn,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        if self.actors.iter().filter(|row| !row.actor.dead).count()
            + self.bosses.iter().filter(|row| !row.actor.dead).count()
            + self.wards.actors.iter().filter(|row| !row.actor.dead).count()
            >= scaling::population_limit(self.rules.density_percent)
        {
            return;
        }
        let mut port = SpawnAdapter {
            party_health_multiplier: self.party_health_multiplier,
            zone: self.zone,
            rules: self.rules,
            phase: self.phase,
            endless_started_at: self.endless_started_at,
            now: self.now,
            run_level: self.run_level,
            player: self.player,
            velocity: [0.0; 2],
            actors: self.actors,
            counter,
            live_bosses: self.bosses.iter().filter(|row| !row.actor.dead).count()
                + self.wards.actors.iter().filter(|row| !row.actor.dead).count(),
            world: self.world,
            events: self.events,
        };
        port.create(request.enemy_index, Some(request.position), rng);
    }
    fn begin_charge(&mut self, request: native::abilities::Charge) {
        let actor = self.bosses.iter_mut().find(|row| row.guid == request.source_guid).map(|row| &mut row.actor)
            .or_else(|| self.actors.iter_mut().find(|row| row.guid == request.source_guid).map(|row| &mut row.actor))
            .or_else(|| self.wards.actors.iter_mut().find(|row| row.guid == request.source_guid).map(|row| &mut row.actor));
        if let Some(actor) = actor {
            actor.movement = request.movement;
            actor.next_movement_at = request.next_move_at;
            actor.attack_delay = request.attack_delay;
        }
    }
    fn begin_raid_charge(&mut self, request: native::abilities::Charge) {
        let actor = if let Some(row) = self.bosses.iter_mut().find(|row| row.guid == request.source_guid) {
            &mut row.actor
        } else if let Some(row) = self.actors.iter_mut().find(|row| row.guid == request.source_guid) {
            &mut row.actor
        } else if let Some(row) = self.wards.actors.iter_mut().find(|row| row.guid == request.source_guid) {
            &mut row.actor
        } else { return };
        actor.movement = request.movement;
        actor.next_movement_at = request.next_move_at;
        actor.attack_delay = if request.attack_delay.is_nan() || actor.attack_delay > request.attack_delay {
            actor.attack_delay
        } else { request.attack_delay };
        self.events.push(RunEvent::RaidCharge { source: request.source_guid,
            movement: request.movement, serial: self.movement_counter.next(),
            duration_ms: request.duration_ms });
    }
    fn raid_zone_bounds(&self) -> Option<([f32;2],f32)> {
        Some(([self.zone.center[0],self.zone.center[1]],self.zone.radius))
    }
    fn raid_bomb_damage(&mut self, center: Position, radius: f32, damage: f32, spell: u32) {
        self.damage_event_boundary.get_or_insert(self.events.len());
        self.bomb_bursts.push((center,radius,damage,spell));
    }
    fn raid_protect(&mut self, guid: u64, until: f32) {
        self.defenses.entry(guid).or_default().protect(until);
    }
    fn raid_aura(&mut self, guid: u64, spell: u32, present: bool) {
        let periodic = self.bosses.iter().find(|row| row.guid == guid && !row.actor.dead)
            .map(|row| row.periodic.as_slice())
            .or_else(|| self.actors.iter().find(|row| row.guid == guid && !row.actor.dead)
                .map(|row| row.periodic.as_slice()))
            .or_else(|| self.wards.actors.iter().find(|row| row.guid == guid && !row.actor.dead)
                .map(|row| row.periodic.as_slice()));
        let Some(periodic) = periodic else { return };
        if let Some(event) = self.generic.aura_event(guid, spell, present, periodic) {
            self.events.push(event);
        }
    }
    fn raid_knockback(&mut self, angle: f32, speed: f32) {
        self.damage_event_boundary.get_or_insert(self.events.len());
        self.knockback = Some((angle, speed));
    }
    fn raid_warning(&mut self, guid: u64, warning: native::raid_warnings::RaidWarning) {
        let name = if let Some(row) = self.bosses.iter().find(|row| row.guid == guid) {
            AnnouncementLabel::boss(row.definition.id, row.definition.name)
        } else if let Some(row) = self.actors.iter().find(|row| row.guid == guid) {
            AnnouncementLabel::enemy(row.definition.id, row.definition.name)
        } else { AnnouncementLabel::literal("Enemy") };
        self.events.push(RunEvent::Announcement(RunAnnouncement::raid_warning(name, warning)));
    }
    fn raid_hold_facing(&mut self, source_guid: u64, seconds: f32, angle: f32) {
        let before = self.events.len();
        self.raid_hold(source_guid, seconds);
        if self.events.len() == before { return; }
        if let Some(RunEvent::StoppedMovement { target, position, serial }) = self.events.last().cloned() {
            if target == source_guid {
                *self.events.last_mut().unwrap() = RunEvent::RaidFacing {
                    source: target, position, serial, angle,
                };
            }
        }
    }
    fn raid_hold(&mut self, source_guid: u64, seconds: f32) {
        let (actor, deadline) = if let Some(row) = self.bosses.iter_mut()
            .find(|row| row.guid == source_guid) {
            (&mut row.actor, &mut row.ai.raid_hold_until)
        } else if let Some(row) = self.actors.iter_mut()
            .find(|row| row.actor.guid == source_guid) {
            let deadline = self.guardian_state.raid_hold_until_mut(source_guid)
                .unwrap_or_else(|| &mut self.other_deadlines.entry(source_guid).or_default().hold_until);
            (&mut row.actor, deadline)
        } else if let Some(row) = self.wards.actors.iter_mut().find(|row| row.guid == source_guid) {
            (&mut row.actor, &mut self.other_deadlines.entry(source_guid).or_default().hold_until)
        } else { return };
        let point = actor.movement.position_at(self.now);
        let height = self.world.height([point.x, point.y]);
        native::cast_presentation::hold(actor, deadline, self.now, seconds, height);
        self.events.push(RunEvent::StoppedMovement {
            target: source_guid, position: actor.movement.to,
            serial: self.movement_counter.next(),
        });
    }
    fn raid_cast(&mut self, source_guid: u64, spell_id: u32, seconds: f32) {
        self.events.push(RunEvent::RaidCast { source: source_guid, spell_id, seconds });
    }
    fn raid_block(&mut self, source_guid: u64, seconds: f32) {
        if let Some(row) = self.bosses.iter_mut().find(|row| row.guid == source_guid) {
            row.ai.raid_cast_until = native::cast_presentation::block_until(
                row.ai.raid_cast_until, self.now, seconds);
        } else if let Some(deadline) = self.guardian_state.raid_cast_until_mut(source_guid) {
            *deadline = native::cast_presentation::block_until(*deadline, self.now, seconds);
        }
    }
    fn yell(&mut self, guid: u64, text: &'static str) {
        if let Some(boss) = self.bosses.iter().find(|row| row.guid == guid) {
            self.events.push(RunEvent::Announcement(RunAnnouncement::Yell { guid,
                name: AnnouncementLabel::boss(boss.definition.id, boss.definition.name),
                text: AnnouncementLabel::literal(text) }));
        } else if let Some(actor) = self.actors.iter().find(|row| row.actor.guid == guid) {
            self.events.push(RunEvent::Announcement(RunAnnouncement::Yell { guid,
                name: AnnouncementLabel::enemy(actor.definition.id, actor.definition.name),
                text: AnnouncementLabel::literal(text) }));
        } else if self.wards.actors.iter().any(|row| row.guid == guid) {
            self.events.push(RunEvent::Announcement(RunAnnouncement::Yell { guid,
                name: AnnouncementLabel::literal("Enemy"), text: AnnouncementLabel::literal(text) }));
        }
    }
    fn player_position(&self) -> Position {
        self.player
    }
    fn damage_player(&mut self, amount: f32, source_guid: u64, spell_id: u32) {
        self.damage_event_boundary.get_or_insert(self.events.len());
        self.incoming.push((amount, source_guid, spell_id));
    }
    fn raid_root(&mut self, source: u64, spell: u32, duration: f32) {
        self.damage_event_boundary.get_or_insert(self.events.len());
        self.root = Some((source, spell, duration));
    }
}

impl<W: RunWorld> native::ai::DispatchPort for BossCombat<'_, W> {
    fn ability_actor(&self, index: usize) -> Option<native::ai::AbilityActor> {
        self.bosses.get(index).map(|row| native::ai::AbilityActor {
            actor: row.actor,
            enraged: row.ai.enraged,
        })
    }
    fn player_guid(&self) -> u64 {
        self.player_guid
    }
}

impl<W: RunWorld> CombatAdapter<'_, W> {
    pub(super) fn hit_boss(&mut self, hit: PendingHit, rng: &mut NativeRng,
        vitals: Option<&mut Vitals>, packlord: f32, packlord_attack: Option<(u32, CapturedAttack)>,
        share: Option<DamageShare>) -> Option<HitInput> {
        let leech = self.current_leech();
        let darkmantle = self.darkmantle_bonus(hit.target_guid);
        let deathmist_kind = self.deathmist_ability_kind(hit.target_guid, hit.spell_id);
        let secondary_source = (hit.effect.tag == 5).then(|| self.healing_source(hit.spell_id));
        let secondary_effect = secondary_source.and_then(|_| self.detailed_effect_index());
        let (meter_source, meter_attribution, meter_attack) = self.hit_meter(&hit, packlord_attack);
        let effect_stats = self.effect_stats();
        let Some(index) = self
            .bosses
            .iter()
            .position(|row| row.guid == hit.target_guid && !row.actor.dead)
        else {
            return None;
        };
        let row = &mut self.bosses[index];
        if let Some(plan) = hit.dot_plan() {
            periodic::install_dot(
                &mut row.periodic,
                0,
                hit.source_guid,
                hit.spell_id,
                hit.school,
                plan,
                self.now,
                if hit.effect.tag == 5 {
                    hit.effect.value
                } else {
                    0.0
                },
                1,
            );
            self.events.extend(self.generic.aura_event(
                row.guid,
                hit.spell_id,
                true,
                &row.periodic,
            ));
            return None;
        }
        let mut victim = row.hit_victim(self.generic.demoralizing_amplification.get(&row.guid)
            .map_or(0.0, |window| window.value_at(self.now)));
        let raid_multiplier = self.boss_state.defenses.get(&row.guid).copied().unwrap_or_default()
            .multiplier_with_ward(self.now, self.boss_state.wards.protects(row.guid))
            * row.ras.as_ref().map_or(1.0, |script| script.damage_multiplier(self.now));
        let spell_amplification = enhancement::spell_amplification(
            self.equipped, hit.spell_id, self.now, &row.control,
            &victim, self.attribution.source_kind, self.player_absorb, deathmist_kind,
        );
        let Some(result) = damage::apply_hit_with_darkmantle(
            &mut victim,
            hit.damage,
            &VictimContext {
                run_state: 1,
                now: self.now,
                player_absorb: self.player_absorb,
                talent_effects: &effect_stats,
                spell_amplification,
                elemental_sunder: row.control.elemental_sunder(hit.school, self.now),
                packlord_amplification: packlord,
            },
            raid_multiplier, darkmantle,
        ) else {
            return None;
        };
        row.health = victim.health;
        let breakdown = meter_attack
            .map(|attack| attack.components(2, f64::from(result.effective)))
            .unwrap_or_default();
        let shares = Self::damage_shares(share, result.packlord_fraction, self.generic.white_devilsaur);
        let definition = row.definition;
        self.note_detailed_boss(hit.target_guid, definition);
        self.record_detailed_damage(
            &hit, result.effective, meter_source, meter_attribution.as_ref().map(|row| row.1.as_str()),
            meter_attack, shares, Some(hit.target_guid),
        );
        self.generic.damage_meters.record_with_shares(
            meter_source, hit.spell_id, result.effective, &breakdown, shares,
        );
        self.generic.damage_meters.record_boss_with_shares(
            &mut self.boss_state.death, self.now, meter_source, result.effective, &breakdown, shares,
        );
        self.events.push(RunEvent::Damage {
            source: self.player_guid,
            causal_source: hit.source_guid,
            target: hit.target_guid,
            spell_id: hit.spell_id,
            school: hit.school,
            raw_power: hit.damage,
            amount: result.amount,
            critical: hit.critical,
            source_kind: self.attribution.source_kind,
            meter_attribution,
            periodic: false,
            emit_log: hit.spell_id != 0 && !hit.context.suppress_damage_log,
        });
        if let Some(actual) = leech_after_hit(result.amount, leech, self.rules.heroic_rank, vitals,
            self.healing, &mut self.generic.healing_meter, self.events)
        {
            self.record_detailed_self_heal(0, azeroth_survivors_re::run_effects::healing::LEECH, actual, None);
        }
        let row = &mut self.bosses[index];
        let position = row.actor.movement.position_at(self.now);
        let summary = HitInput {
            victim_guid: row.guid,
            position,
            raw_power: hit.damage,
            remaining_health: row.health,
            spell_id: hit.spell_id,
            critical: hit.critical,
        };
        if !result.lethal {
            self.events.extend(self.generic.apply_actor_status(
                &mut row.actor,
                &mut row.control,
                false,
                &row.periodic,
                self.now,
                hit.effect,
                hit.spell_id,
                self.equipped,
                self.movement_counter,
                self.world,
            ));
        }
        match hit.effect.tag {
            5 => self.healing.push(PendingHealing {
                meter_source: secondary_source,
                meter_effect: secondary_effect,
                ..PendingHealing::secondary(hit.damage * hit.effect.value, hit.spell_id)
            }),
            6 => self.healing.push(PendingHealing::secondary(
                self.stats.maximum_health * hit.effect.value,
                hit.spell_id,
            )),
            7 => self.absorbs.push(hit.effect.value),
            _ => {}
        }
        if !result.lethal {
            return Some(summary);
        }
        let killing_blow = azeroth_survivors_re::account_progression::BossKillingBlow {
            boss_id: row.definition.id,
            spell_id: azeroth_survivors_re::account_progression::killing_spell(hit.spell_id),
            school: hit.school,
            source_kind: self.attribution.source_kind,
            melee: azeroth_survivors_re::account_progression::killing_blow_is_melee(
                self.attribution.source_kind, hit.spell_id,
            ),
        };
        self.generic.killing_blows.push((killing_blow.boss_id, killing_blow.spell_id));
        self.generic.boss_killing_blows.push(killing_blow);
        self.generic.personal_boss_killing_blows.push(killing_blow);
        // Current145bd5f30 snapshots shared membership at the lethal hit,
        // before death callbacks can change the world or the hero context.
        if self.boss_state.shared_equipment.is_some() {
            // 0.120.2 captures the native hero slot before its private context
            // is restored. The existing party port carries that active slot.
            self.boss_state.shared_killing_blows.push((self.party_healing.source_slot, killing_blow));
            self.boss_state.party_feats.events.push(
                azeroth_survivors_re::coop::replication::NativeFeatEvent {
                    word_18: killing_blow.boss_id,
                    word_1c: killing_blow.spell_id,
                    byte_20: killing_blow.school,
                    kind_21: killing_blow.source_kind,
                    flag_22: killing_blow.melee,
                    members: self.boss_state.party_feats.members.clone(),
                },
            );
        }
        row.actor.dead = true;
        row.actor.died_at = self.now;
        let definition = row.definition;
        let guid = row.guid;
        if row.gandling.is_some() {
            // The native death callback reads this source's live rows before removing them.
            let result = self.boss_state.gandling.finish(guid, row.health, self.now, self.events);
            self.generic.boss_flags.push(result);
            if self.boss_state.shared_equipment.is_some() {
                self.boss_state.shared_boss_flags.push((self.party_healing.source_slot, result));
            }
        } else {
            self.boss_state.gandling.retire_source(guid, self.now, self.events);
            if let Some(script) = &mut row.barov {
                script.remove_burns(self.events);
            }
        }
        let endless_bosses = if !self.showcase && self.boss_state.completion.phase != 0 {
            self.boss_state.endless_bosses = self.boss_state.endless_bosses.wrapping_add(1);
            Some(self.boss_state.endless_bosses)
        } else { None };
        if let Some(queue) = self.boss_state.shared_equipment.as_mut() {
            // Native16B records retain only collector and boss definition.
            // Remote distribution reads the then-current shared phase/counter.
            queue.push((self.player_guid, definition));
        }
        *self.kills = self.kills.wrapping_add(1);
        // Current primary creator1459306d4 supplies Actor+15c=1, so the
        // shared death owner increments elites before its separate boss count.
        *self.elite_kills = self.elite_kills.wrapping_add(1);
        if self.stats.heal_on_kill > 0.0 {
            self.healing
                .push(PendingHealing::on_kill(self.stats.heal_on_kill));
        }
        self.events.push(RunEvent::EnemyDied { guid });
        let remaining = self.bosses.iter().any(|boss| !boss.actor.dead);
        if !remaining {
            self.detailed_meter.finish_encounter(self.now);
        }
        //145935a18 bypasses only the equipment admission/draw branch. Boss
        // kill counters, ordinary drops, attraction and phase transition remain.
        let zone_index = if self.showcase {
            usize::MAX
        } else {
            native::catalog::ZONES
                .iter()
                .position(|zone| zone.key == self.zone.key)
                .unwrap_or(usize::MAX)
        };
        let mut port = BossDeathPort {
            pickups: self.pickups,
            counter: self.object_counter.clone(),
            world: self.world,
            events: self.events,
            equipment: &mut self.boss_state.equipment,
            movement_counter: self.movement_counter,
            now: self.now,
            player: self.player,
            zone: self.zone,
            definition,
            heroic_rank: self.rules.heroic_rank,
            endless_bosses,
        };
        native::death::on_boss_death(
            &mut self.boss_state.death,
            &mut self.boss_state.completion,
            &mut self.boss_state.magnet_deadlines,
            definition,
            definition.name,
            native::death::BossDeathInput {
                guid,
                now: self.now,
                position,
                remaining_live_primary_boss: remaining,
                class: self.class_id,
                zone_index,
                equipment: EquipmentRoll {
                    extra_pickup_mode: false,
                    additive_chance: self.equipped.equipment_chance,
                    run_options: [
                        self.rules.density_percent,
                        self.rules.hp_percent,
                        self.rules.damage_percent,
                        self.rules.speed_percent,
                    ],
                },
            },
            rng,
            &mut port,
        );
        Some(summary)
    }
}

struct BossDeathPort<'a, W> {
    pickups: &'a mut Vec<RunPickup>,
    counter: SharedCounter,
    world: &'a mut W,
    events: &'a mut Vec<RunEvent>,
    equipment: &'a mut progression::EquipmentDrops,
    movement_counter: &'a mut u32,
    now: f32,
    player: Position,
    zone: &'static ZoneDefinition,
    definition: &'static native::BossDefinition,
    heroic_rank: u8,
    endless_bosses: Option<u32>,
}
impl<W: RunWorld> MobLootWorld for BossDeathPort<'_, W> {
    fn create_pickup(&mut self, drop: PickupDrop) {
        let id = pickup_identity(drop, &mut self.counter);
        self.pickups.push(RunPickup {
            id,
            created_at: self.now,
            drop,
            flight: None,
            facing: 0.0,
            auxiliary: [None; 2],
        });
    }
    fn create_pickup_with_rng(&mut self, drop: PickupDrop, rng: &mut NativeRng) {
        pickup_effects::create_reward(drop, self.pickups, &mut self.counter, rng,
            self.world, self.zone, self.now, self.events);
    }
    fn resolved_height(&mut self, xy: [f32; 2]) -> f32 {
        self.world
            .height(xy)
            .or_else(|| self.world.secondary_height(xy))
            .unwrap_or_else(|| Terrain::fallback_height(self.world))
    }
}
impl<W: RunWorld> native::death::DeathPort for BossDeathPort<'_, W> {
    fn roll_boss_equipment(&mut self, class: u8, zone: usize, boss: usize,
        roll: EquipmentRoll, rng: &mut NativeRng)
    {
        self.equipment.roll_boss(class, zone, boss, roll, self.heroic_rank, self.endless_bosses, rng);
    }
    fn announce_boss_death(&mut self, guid: u64, name: &str, text: &'static str) {
        self.events.push(RunEvent::Announcement(RunAnnouncement::Yell { guid,
            name: AnnouncementLabel::boss(self.definition.id, name),
            text: AnnouncementLabel::literal(text) }));
    }
    fn account_event(&mut self, event: native::death::BossAccountEvent<'_>) {
        self.events.push(RunEvent::Account {
            kind: event.event_type,
            name: AnnouncementLabel::boss(self.definition.id, event.name),
        });
    }
    fn queue_equipment(&mut self, id: u32) {
        self.equipment.queue(id);
    }
    fn create_boss_magnet(&mut self, position: Position) {
        self.events.push(RunEvent::Magnet(position));
    }
    fn create_boss_magnet_with_rng(&mut self, position: Position, rng: &mut NativeRng) {
        pickup_effects::create(PickupDrop::Magnet { position: treasure_chests::Position::new(position.x, position.y, position.z) },
            self.pickups, &mut self.counter, rng, self.world, self.zone, self.now, self.events);
    }
    fn attract_idle_experience(&mut self) {
        pickup_effects::attract_experience(self.pickups, self.player, self.now, self.movement_counter, self.events);
    }
}

#[cfg(test)]
mod terminal_tests {
    use super::*;
    use super::super::rng_integration::class_run;

    #[test]
    fn phase_summons_create_real_actors_once_after_the_phase_yell() {
        use super::super::rng_integration::TerrainFixture;
        let mut game = class_run("priest", 0);
        game.clock = 10.0;
        let player = game.zone.center.into();
        game.spawn_showcase_bosses(player, [0.0; 2], &mut TerrainFixture);
        for row in &mut game.bosses {
            row.ai.cooldowns.fill(f32::INFINITY);
            row.actor.stun_until = 0.0;
            if row.definition.id == 694 { row.health = row.maximum_health * 0.49; }
        }
        game.events.clear();
        let before = game.actors.len();
        game.tick_actor_frame(0.0, player, 0.0, &mut TerrainFixture);
        assert_eq!(game.actors.len(), before + 8);
        for (index, row) in game.actors[before..].iter().enumerate() {
            assert_eq!(row.definition.id, game.zone.enemies[usize::from(index % 3 == 2)].id);
        }
        let yells: Vec<_> = game.events.iter().filter_map(|event| match event {
            RunEvent::Announcement(RunAnnouncement::Emote { text, .. }
                | RunAnnouncement::Yell { text, .. }) => Some(text),
            _ => None,
        }).collect();
        assert_eq!(yells.len(), 2);
        assert_eq!(*yells[0], AnnouncementLabel::boss_phase(694, 0, "Fools! Our cause is righteous!"));
        assert_eq!(*yells[1], AnnouncementLabel::literal("Minions, to me!"));
        game.tick_actor_frame(0.0, player, 0.0, &mut TerrainFixture);
        assert_eq!(game.actors.len(), before + 8);
    }

    #[test]
    fn victory_endless_and_later_death_keep_win_xp_and_deliver_only_new_totals() {
        let mut game = class_run("priest", 0);
        assert!(!game.continue_endless());
        game.clock = 300.0;
        game.kills = 100;
        game.execution.vitals.health = 37.0;
        game.xp = 4;
        game.boss_state.completion.phase = 1;
        game.boss_state.completion.phase_started_at = 290.0;
        game.boss_state.scheduler.next_primary = native::spawning::PRIMARY_COUNT;
        game.finish_boss_completion(&mut super::super::rng_integration::TerrainFixture);
        assert!(game.completed && game.victory_reached());
        let first = game.terminal_delivery(false).unwrap();
        assert!(first.first_result && first.result.won);
        assert_eq!(first.xp_parts[3], 200);
        game.mark_terminal_delivery_saved(&first);
        assert!(game.continue_endless());
        assert!(!game.completed);
        assert!(game.rules.endless && game.victory_reached());
        assert_eq!(game.health(), 37.0);
        assert_eq!(game.xp, 4);
        assert_eq!(game.boss_state.completion.phase, 1);
        assert_eq!(game.boss_state.endless_started_at(), 290.0);
        assert_eq!(game.boss_state.scheduler.endless_deadline, 600.0);
        assert_eq!(game.boss_state.completion.run_state, 1);
        assert!(game.boss_state.completion.endless_enabled);
        assert_eq!(game.terminal_delivery(false), None);
        assert!(!game.continue_endless());
        game.clock = 360.0;
        game.kills = 200;
        game.dead = true;
        let later = game.terminal_delivery(false).unwrap();
        assert!(!later.first_result);
        assert!(later.result.won, "victory stays set after the later defeat");
        assert_eq!(later.delta_counts, [100, 0, 0, 0, 0]);
        assert_eq!(later.delta_xp_parts, [12, 10, 0, 0, 0, 0, 0]);
        assert_eq!(later.talent_xp, 22);
        assert_eq!(game.run_result(false), None);
        game.mark_terminal_delivery_saved(&later);
        assert_eq!(game.terminal_delivery(false), None);
    }
}
