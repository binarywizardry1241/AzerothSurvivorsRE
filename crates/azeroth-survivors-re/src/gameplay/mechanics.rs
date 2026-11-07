//! Live adapters for the recovered 0.97.2 enemy and player-ability owners.
//!
//! Numerical combat/spawn rules live in the hash-bound library modules. This
//! adapter supplies their missing shared actor collection, RNG, clock and loot
//! ownership. Native navigation grids, complete stat/proc composition, account
//! persistence and full spell presentation remain separate work.

use azeroth_survivors_re::native_counter::{NativeCounter, SharedCounter};
use azeroth_survivors_re::{
    bosses::abilities::{GroundObject, SpellCast},
    enemies::{
        NativeRng, Position,
        ai::{self, Actor},
        catalog::{EnemyDefinition, ZoneDefinition},
        scaling::{self, ScalingInput},
        spawning::{self, OrdinarySpawner, SpawnPort, Terrain},
        waves::{self, Pattern, StampedeOrder, WavePort, WaveTimers},
    },
    mob_loot::{MobLootState, MobLootWorld, PickupDrop},
    player_abilities::{
        self, AbilityDefinition, RuntimeInstance,
        behavior::{
            self,
            buffs::{self, BuffActions, ShieldReservation},
            dispatch::{self, CastContext, CastPort, ExecutionState},
            execution::{Critical, HitContext, PendingHit, PendingHits, ProjectilePort},
            hit_passives::{HitInput, PassiveHit, RestoredAppearance},
            passive_tick::{LightwellObject, PassiveTickState, ResourceBar},
            periodic::{self, ActorPeriodic},
            state::{self, ControlWindow, Vitals},
            targeting::Target,
            totem_passives::{
                HealingAction, PassiveAttribution, PassivePort, PassiveStarted,
            },
            totems::{self, SummonedObject},
        },
        damage::{self, PowerContext, Victim, VictimContext},
        upgrades::{self, UpgradeKind},
    },
    run_effects::healing::MeterSource,
    run_meter::{CapturedAttack, DamageShare, DamageShares},
    run_progression::RUN_LEVEL_CAP,
    treasure_chests,
};

#[path = "mechanics/announcements.rs"]
mod announcements;
pub use announcements::{AnnouncementLabel, RunAnnouncement};

#[path = "mechanics/player_mover.rs"]
mod player_mover;
pub use player_mover::PlayerMoverEvent;
#[path = "mechanics/showcase.rs"]
mod showcase;
#[path = "mechanics/coop.rs"]
pub mod coop;
pub use coop::{PartyBanner, PartyInput};
#[path = "mechanics/party_achievements.rs"]
mod party_achievements;
#[path = "mechanics/shared_healing.rs"]
mod shared_healing;
#[path = "mechanics/detailed_credit.rs"]
mod detailed_credit;
#[path = "mechanics/detailed_loadout.rs"]
mod detailed_loadout;
#[cfg(test)]
#[path = "mechanics/shared_healing_tests.rs"]
mod shared_healing_tests;

#[path = "mechanics/addon_lists.rs"]
mod addon_lists;
#[path = "mechanics/addon_timers.rs"]
mod addon_timers;
#[path = "mechanics/bosses.rs"]
mod bosses;
#[path = "mechanics/actor_frame.rs"]
mod actor_frame;
#[path = "mechanics/enhancement.rs"]
mod enhancement;
#[path = "mechanics/deathmist.rs"]
mod deathmist;
#[path = "mechanics/affixes.rs"]
mod affixes;
mod wards;
mod raid_hits;
#[path = "mechanics/addon_scalars.rs"]
mod addon_scalars;
#[path = "mechanics/spell_display.rs"]
mod spell_display;
#[path = "mechanics/boundary.rs"]
mod boundary;
#[path = "mechanics/attacks.rs"]
mod attacks;
#[path = "mechanics/pets.rs"]
mod pets;
#[path = "mechanics/kill_feats.rs"]
mod kill_feats;
#[path = "mechanics/loot_companions.rs"]
mod loot_companions;
#[path = "mechanics/demons.rs"]
mod demons;
#[path = "mechanics/demon_spells.rs"]
mod demon_spells;
#[path = "mechanics/demon_post_hit.rs"]
mod demon_post_hit;
#[path = "mechanics/demon_lifecycle.rs"]
mod demon_lifecycle;
#[path = "mechanics/demon_bounce.rs"]
mod demon_bounce;
#[path = "mechanics/callbacks.rs"]
mod callbacks;
#[path = "mechanics/chests.rs"]
mod chests;
#[path = "mechanics/pickups.rs"]
mod pickup_effects;
#[path = "mechanics/choice_controls.rs"]
mod choice_controls;
#[path = "mechanics/choices.rs"]
mod choices;
#[path = "mechanics/completion.rs"]
mod completion;
#[path = "mechanics/effects.rs"]
mod effects;
#[path = "mechanics/guardians.rs"]
mod guardians;
#[path = "mechanics/incoming.rs"]
mod incoming;
#[path = "mechanics/passives.rs"]
mod passives;
#[path = "mechanics/prepared.rs"]
mod prepared;
#[path = "mechanics/progression.rs"]
mod progression;
#[path = "mechanics/terminal_movement.rs"]
mod terminal_movement;
#[path = "mechanics/retirement.rs"]
mod retirement;
pub(super) use retirement::Retirement;
#[path = "mechanics/treasure.rs"]
mod treasure;
pub use bosses::RunBoss;
pub use chests::ChestView;
pub use guardians::{GuardianRewardEvent, RunGuardian};
pub use treasure::TreasureChoice;

/// The same loaded-world resources supply both placement and actor collision.
pub trait RunWorld:
    Terrain + ai::World + azeroth_survivors_re::guardians::placement::LairTerrain + Clone
{
}
impl<T: Terrain + ai::World + azeroth_survivors_re::guardians::placement::LairTerrain + Clone>
    RunWorld for T
{
}

#[derive(Clone, Copy, Debug)]
pub struct RunRules {
    /// Selected 0.121.0 Heroic rank, copied into native Game+0x36f.
    pub heroic_rank: u8,
    pub difficulty: f32,
    pub density_percent: u16,
    pub hp_percent: u16,
    pub damage_percent: u16,
    pub speed_percent: u16,
    pub endless: bool,
}

/// Computed player fields must come from the owning entry/stat recovery.
/// Neutral modifiers do not assert that unported equipment/talents are applied.
#[derive(Clone, Copy, Debug)]
pub struct RunPlayerStats {
    pub maximum_health: f32,
    pub health_per_level: f32,
    pub health_multiplier: f32,
    pub regeneration: f32,
    pub pickup_radius: f32,
    pub luck_bonus: f32,
    pub heal_on_kill: f32,
    pub armor_fraction: f32,
    pub damage_reduction: f32,
    pub damage_multiplier: f32,
    pub cooldown_multiplier: f32,
    pub critical_chance: f32,
    pub critical_multiplier: f32,
    pub experience_multiplier: f32,
    pub gold_multiplier: f32,
    pub native_race: u8,
    pub packed_player_field: u32,
}

#[derive(Clone, Debug)]
pub struct RunActor {
    pub guid: u64,
    /// Adapter chronology preserves the native shared actor vector's order.
    pub allocation_order: u64,
    pub definition: &'static EnemyDefinition,
    /// UNIT level captured by native1454d2910 at creation, never refreshed from run level.
    pub native_level: u32,
    pub actor: Actor,
    pub health: f32,
    pub maximum_health: f32,
    pub control: ControlWindow,
    pub periodic: Vec<ActorPeriodic>,
    pub vulnerability: f32,
    pub vulnerability_until: f32,
    pub additional_damage_taken: f32,
}

impl RunActor {
    fn hit_victim(&self, guardian: bool, demoralizing_amplification: f32) -> Victim {
        Victim {
            health: self.health,
            maximum_health: self.maximum_health,
            primary_boss: false,
            guardian,
            has_periodic: !self.periodic.is_empty(),
            native_flag_158: self.definition.flag_4c,
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
}

/// Current1454d2910, retained in run-effects/actor-create.asm: the byte argument is
/// forwarded from ordinary definition+4c, but actual guardian and boss callers pass1.
fn native_actor_level(run_level: u32, elite: u8) -> u32 {
    run_level.wrapping_add(3 * u32::from(elite)).min(63)
}

#[derive(Clone, Copy, Debug)]
pub struct RunPickup {
    pub id: u64,
    pub created_at: f32,
    pub drop: PickupDrop,
    pub flight: Option<ai::Movement>,
    pub facing: f32,
    pub auxiliary: [Option<u64>; 2],
}

impl RunPickup {
    pub fn position(&self) -> Position {
        let position = match self.drop {
            PickupDrop::Experience { position, .. }
            | PickupDrop::Gold { position, .. }
            | PickupDrop::Cache { position }
            | PickupDrop::Rune { position, .. }
            | PickupDrop::Magnet { position } => position,
        };
        Position {
            x: position.x,
            y: position.y,
            z: position.z,
        }
    }

    pub fn position_at(&self, now: f32) -> Position {
        // Current magnet coin sweep sets only a collection deadline; it emits
        // no GameObject movement packet. XP owns the actual flight path.
        if matches!(self.drop, PickupDrop::Gold { .. }) { return self.position(); }
        self.flight
            .map_or_else(|| self.position(), |movement| movement.position_at(now))
    }
}

/// Presentation events expose recovered casts/damage without substituting
/// invented spell graphics for the engine's DBC spell visual owner.
#[derive(Clone, Debug)]
pub enum RunEvent {
    ActorFields { target: u64, fields: Vec<(u16,u32)> },
    ActorHealing { target: u64, spell_id: u32, amount: f32, fields: Vec<(u16,u32)> },
    /// Native marker-channel JSON (hz/hzt/hzend/reset), distinct from packets
    /// and ordinary HUD messages. Encounter producers are owned by gap #42.
    RaidMarker(serde_json::Value),
    /// 145950b00: the same caster's native SpellStart/animation, no target.
    RaidCast { source: u64, spell_id: u32, seconds: f32 },
    RaidTransformCast { source: u64, spell_id: u32, seconds: f32 },
    RaidSpellGo(SpellCast),
    /// Current14597b9eb: ordinary/guardian cast start targets the live player.
    ActorCast { source: u64, spell_id: u32, seconds: f32 },
    RaidFacing { source: u64, position: Position, serial: u32, angle: f32 },
    RaidCharge { source: u64, movement: ai::Movement, serial: u32, duration_ms: u32 },
    /// One ordered packet from the shared player-mover owner (Game+548).
    PlayerMover(PlayerMoverEvent),
    /// Current14544f390 handles each newly granted key once, in native catalog order.
    Achievement(String),
    ///145b2e580 emits this only for a newly raised class/zone clear record.
    /// The current frontend ignores its JSON; the system-chat path presents it.
    HeroicProgress { class: u8, zone_key: &'static str, rank: u8, open: u8 },
    /// 0.115.0 backend terminal XP award, delivered to its own frontend only.
    TalentXp {
        gain: u32,
        before: u32,
        total: u32,
        class_key: &'static str,
        parts: [i64; 7],
    },
    Spell(SpellCast),
    Damage {
        /// Native actor-hit logging always names Game+3e8 as attacker.
        source: u64,
        /// Deferred impact/object attribution retained separately from the log.
        causal_source: u64,
        target: u64,
        spell_id: u32,
        school: u8,
        raw_power: f32,
        amount: f32,
        critical: bool,
        source_kind: u8,
        meter_attribution: Option<(azeroth_survivors_re::run_effects::healing::MeterSource, String)>,
        /// Native14545f6d0 receives a literal false from actor-hit.
        periodic: bool,
        emit_log: bool,
    },
    /// Explicit native14545c690 attack intent; emitted by its actual caller,
    /// separately from the canonical actor health mutation.
    Melee {
        source: u64,
        target: u64,
        amount: u32,
        critical: bool,
    },
    /// Native actor-periodic log precedes the health mutation and records the
    /// unmodified per-tick request through145464140.
    PeriodicDamage {
        source: u64,
        target: u64,
        spell_id: u32,
        school: u8,
        amount: f32,
    },
    EnemyDied {
        guid: u64,
    },
    PlayerDamage {
        amount: f32,
        fields: [(u16, u32); 2],
    },
    Healing {
        amount: f32,
        /// Absent for regeneration, leech and provenance-only effects whose
        /// native producer does not supply a healing spell packet identity.
        context: Option<HealingContext>,
        emit_log: bool,
        fields: [(u16, u32); 2],
    },
    Ground(GroundObject),
    GroundMoved { target: u64, position: Position },
    Totem(SummonedObject),
    Pet(SummonedObject),
    LootCompanion { object: SummonedObject, run_speed: f32 },
    PetMove {
        guid: u64,
        start: Position,
        to: Position,
        duration: f32,
        serial: u32,
    },

    PickupMove {
        guid: u64,
        start: Position,
        to: Position,
        duration: f32,
        serial: u32,
    },
    RemoveObject(u64),
    Announcement(RunAnnouncement),
    /// Current1454c69e0 publishes field34, rather than SMSG_LEVELUP_INFO.
    LevelUp(u32),
    /// Localized native14545dc90 system chat, including exact numeric tokens.
    SystemMessage(azeroth_survivors_re::loot_rewards::prose::Text),
    /// Native SMSG_NOTIFICATION text, kept on the existing engine event path.
    Notification(azeroth_survivors_re::loot_rewards::prose::Text),
    Toast {
        kind: &'static str,
        name: azeroth_survivors_re::loot_rewards::prose::Text,
        text: azeroth_survivors_re::loot_rewards::prose::Text,
    },
    PartyBanner(PartyBanner),
    BossBanner { id: u32, name: &'static str, final_boss: bool },
    ZoneUnlocked { key: String, name: String },
    ///1458a9ae0: ordinary gossip POI; absent name clears at the player's XY.
    GuardianFlag { position: Position, enemy: Option<(u32, &'static str, bool)> },
    EquipmentLoot { id: u32, is_new: bool },
    /// Current successful-item chat; addon loot-card fields remain separate.
    GearReceipt { id: u32, race: u8, is_new: bool, marks_tenths: u32 },
    /// Current tag20/local mark recipient, after saved balance mutation.
    MarksEarned { earned: f32, total_tenths: u32 },
    PlayerValues(Vec<(u16, u32)>),
    CacheNotice(treasure_chests::ChestMessage),
    PlaySound(u32),
    Account {
        kind: &'static str,
        name: AnnouncementLabel,
    },
    PlayerDied,
    Victory,
    Magnet(Position),
    Aura {
        target: u64,
        spell_id: u32,
        present: bool,
        /// Native event-time aura fields; player aura publication has its own owner.
        fields: Vec<(u16, u32)>,
    },
    Appearance {
        target: u64,
        model: u32,
        scale: f32,
    },
    RestoreAppearance {
        target: u64,
        appearance: RestoredAppearance,
    },
    ResourceBar(ResourceBar),
    Lightwell(LightwellObject),
    BoundaryPillar(LightwellObject),
    ScriptedUnit(LightwellObject),
    PickupObject(LightwellObject),
    PassiveStarted(PassiveStarted),
    StoppedMovement {
        target: u64,
        position: Position,
        serial: u32,
    },
    /// Choice phase packet from the frozen simulation clock. Terrain is
    /// sampled when projecting the captured endpoints into client packets.
    ChoiceMovement {
        source: u64,
        from: Position,
        continuation: Option<(Position, f32)>,
        serial: u32,
    },
    ActorMovement { source: u64, movement: ai::Movement, serial: u32 },
    /// 0.105.0 actor dispatch14593d7e0: a nonpositive-duration move
    /// faces Game+460, rather than sending the distinct moveType1 stop.
    StationaryFacing {
        source: u64,
        position: Position,
        serial: u32,
        target: u64,
    },
    MissingPassiveBinding {
        target: u64,
        owner: &'static str,
    },
}

/// The shared actor movement dispatcher increments its serial for both travel
/// and facing. Preserve travel as an actual packet intent as well as the local
/// interpolation, so remote clients receive its canonical shared serial.
fn publish_actor_movement(
    events: &mut Vec<RunEvent>,
    counter: &mut u32,
    source: u64,
    movement: ai::Movement,
) {
    *counter = counter.wrapping_add(1);
    if movement.duration <= 0.0 {
        events.push(RunEvent::StationaryFacing {
            source,
            position: movement.from,
            serial: *counter,
            target: 1,
        });
    } else {
        events.push(RunEvent::ActorMovement { source, movement, serial: *counter });
    }
}

/// Actual producer identity for a spell-associated player heal. This does
/// not imply a packet for anonymous healing or reuse a preceding cast event.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct HealingContext {
    pub source: u64,
    pub target: u64,
    pub spell_id: u32,
    pub critical: bool,
}

#[derive(Clone, Copy, Debug)]
struct PendingHealing {
    requested: f32,
    context: Option<HealingContext>,
    general_owner: bool,
    manual: bool,
    meter_source: Option<azeroth_survivors_re::run_effects::healing::MeterSource>,
    meter_effect: Option<usize>,
}
impl PendingHealing {
    fn anonymous(requested: f32) -> Self {
        Self {
            requested,
            context: None,
            general_owner: true,
            manual: false,
            meter_source: Some(azeroth_survivors_re::run_effects::healing::LEECH),
            meter_effect: None,
        }
    }
    fn leech(requested: f32) -> Self {
        Self { manual: true, ..Self::anonymous(requested) }
    }
    fn on_kill(requested: f32) -> Self {
        Self { meter_source: Some(azeroth_survivors_re::run_effects::healing::HEALING_ON_KILL),
            ..Self::anonymous(requested) }
    }
    fn apply(
        self, vitals: &mut Vitals, rows: &[azeroth_survivors_re::run_effects::EffectRow],
        state: &mut azeroth_survivors_re::run_effects::healing::HealingState, spell_id: u32,
        heroic_rank: u8,
    ) -> azeroth_survivors_re::run_effects::healing::HealingResult {
        use azeroth_survivors_re::run_effects::healing;
        if self.manual { return self.apply_manual(vitals, heroic_rank); }
        // Current 0.121.0 applies Withering before health clamping and before
        // the general owner can convert overheal or accumulate its pool.
        let requested = self.requested * azeroth_survivors_re::heroic::healing_factor(heroic_rank);
        healing::apply(vitals, rows, state, requested, spell_id)
    }
    fn apply_manual(self, vitals: &mut Vitals, heroic_rank: u8)
        -> azeroth_survivors_re::run_effects::healing::HealingResult {
        use azeroth_survivors_re::run_effects::healing;
        let requested = self.requested * azeroth_survivors_re::heroic::healing_factor(heroic_rank);
        let actual = azeroth_survivors_re::run_pickups::direct_heal(
            &mut vitals.health, vitals.maximum_health, requested);
        healing::HealingResult { actual, overheal: 0.0, emit_log: false, log_amount: 0,
            fields: healing::vital_fields(vitals) }
    }
    fn spell(requested: f32, spell_id: u32) -> Self {
        Self {
            requested,
            general_owner: true,
            manual: false,
            meter_source: None,
            meter_effect: None,
            context: (spell_id != 0).then_some(HealingContext {
                source: 1,
                target: 1,
                spell_id,
                critical: false,
            }),
        }
    }
    fn secondary(requested: f32, spell_id: u32) -> Self {
        Self {
            general_owner: false,
            meter_source: Some(azeroth_survivors_re::run_effects::healing::LEECH),
            ..Self::spell(requested, spell_id)
        }
    }
}

/// Current145c33515..3363b consumes Leech before status/death/proc tails.
/// Execution-aware hits lend the live vitals; nested legacy callbacks retain
/// their request until the enclosing execution boundary drains it.
fn leech_after_hit(
    amount: f32,
    fraction: f32,
    heroic_rank: u8,
    vitals: Option<&mut Vitals>,
    pending: &mut Vec<PendingHealing>,
    meter: &mut azeroth_survivors_re::run_effects::healing::HealingMeter,
    events: &mut Vec<RunEvent>,
) -> Option<f32> {
    if !(fraction > 0.0) { return None; }
    let healing = PendingHealing::leech(amount * fraction);
    let Some(vitals) = vitals else { pending.push(healing); return None; };
    let result = healing.apply_manual(vitals, heroic_rank);
    meter.record(healing.meter_source.expect("Leech owns its healing meter"), result.actual);
    events.push(RunEvent::Healing {
        amount: result.actual,
        context: healing.context,
        emit_log: result.emit_log,
        fields: result.fields,
    });
    Some(result.actual)
}

/// A recovered native level-choice card selected by the native pool/rarity
/// adapter; presentation uses the current definition's English label.
#[derive(Clone, Debug)]
pub struct RunChoice {
    pub label: String,
    pub ability_key: &'static str,
    pub icon: &'static str,
    pub rarity: usize,
    pub upgrades: Vec<UpgradeKind>,
    pub gold: u32,
}

/// A successful native cooldown publication; retry timers do not publish a cooldown.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct RunCooldown {
    pub started_at: f32,
    pub duration: f32,
}

impl RunCooldown {
    fn published(now: f32, remaining: f32) -> Self {
        //14549ec3d..ec5f and the racial counterpart serialize saturated,
        // truncated u32 milliseconds; the client receives that value.
        let milliseconds = (remaining * 1000.0) as u32;
        Self {
            started_at: now,
            duration: milliseconds as f32 / 1000.0,
        }
    }
}

/// Native race-record mapping to the separate Game+378 instance. These definitions are
/// already in the source-owned catalog and never enter the learned six-spell pool.
pub fn racial_definition(race: u8) -> Option<&'static AbilityDefinition> {
    let key = match race {
        1 => "perception",
        2 => "blood_fury",
        3 => "stoneform",
        4 => "shadowmeld",
        5 => "will_of_the_forsaken",
        6 => "war_stomp",
        7 => "escape_artist",
        8 => "berserking",
        _ => return None,
    };
    AbilityDefinition::by_key(key)
}

/// Current14549ee60..ee90. The racial branch has its own quarter-second floor and does not
/// append the ordinary effect11 duration or invoke the ordinary after-success proc owner.
pub fn racial_interval(instance: &RuntimeInstance<'_>, global_cooldown: f32) -> f32 {
    let interval = instance.definition.base_cooldown * 1.4;
    let interval = interval * instance.cooldown_multiplier;
    let interval = interval * instance.talent_cooldown_multiplier;
    (interval * global_cooldown).max(0.25)
}

#[derive(Debug)]
pub struct Mechanics {
    /// Actual world identity supplied by the native player bootstrap owner.
    pub player_guid: u64,
    pub(super) addon_run_id: String,
    pub(super) detailed_meter: super::detailed_meter::Ledger,
    equipment_ids: [u32; 19],
    ranged_gun: bool,
    pub(super) coop: coop::CoopSimulation,
    pub zone: &'static ZoneDefinition,
    pub class: &'static player_abilities::ClassAbilities,
    pub rules: RunRules,
    affixes: affixes::State,
    pub stats: RunPlayerStats,
    pub actors: Vec<RunActor>,
    pub bosses: Vec<RunBoss>,
    pub pickups: Vec<RunPickup>,
    pub abilities: Vec<RuntimeInstance<'static>>,
    pub racial: Option<RuntimeInstance<'static>>,
    pub racial_cooldown: Option<RunCooldown>,
    pub execution: ExecutionState<'static>,
    pub clock: f32,
    /// Current Game+d30; initialized to zero and reset only by an actual revival.
    alive_since: f32,
    fall_epoch: f32,
    pub level: u32,
    pub xp: u32,
    pub gold: u32,
    pub gold_earned: u32,
    pub kills: u32,
    elite_kills: u32,
    pub choices: Vec<RunChoice>,
    /// Presentation requests from the most recently admitted run tick.
    /// Drained by client presentation. Inputs may append before the run tick.
    pub events: Vec<RunEvent>,
    pub dead: bool,
    pub completed: bool,
    /// Current Game+a63 distinguishes a deliberate departure from defeat.
    abandoned: bool,
    boundary_started: bool,
    boundary_objects: Vec<u64>,
    taken_damage: super::addon_meters::TakenLedger,
    damage_history: super::death_recap::DamageHistory,
    death_recap: Option<super::death_recap::DeathRecap>,
    death_recap_generation: u64,
    pub(super) recap_spells: Option<std::sync::Arc<benilla_formats::SpellCatalog>>,
    addon_flag: Option<usize>,
    world_flag: addon_lists::WorldFlag,
    showcase: showcase::State,
    published_cooldowns: Vec<(u32, RunCooldown)>,
    rng: NativeRng,
    counter: SharedCounter,
    spawner: OrdinarySpawner,
    waves: WaveTimers,
    loot: MobLootState,
    pending_healing: Vec<PendingHealing>,
    pending_absorb: Vec<f32>,
    pending_levels: u32,
    passive_state: PassiveTickState,
    movement_counter: u32,
    player_mover: player_mover::PlayerMover,
    native_7e4: u32,
    boss_state: bosses::BossState,
    guardian_state: guardians::GuardianState,
    choice_state: choices::ChoiceState,
    chest_state: chests::ChestState,
    pickup_state: pickup_effects::State,
    treasure_state: treasure::TreasureState,
    effect_state: effects::EffectsState,
    weapon_state: azeroth_survivors_re::run_effects::weapon::State,
    pet_state: pets::State,
    loot_companion_state: loot_companions::State,
    demon_state: demons::State,
}

impl Mechanics {
    pub fn visual_spell_scales(&self) -> Vec<player_abilities::visual_scale::SpellScale> {
        //145928460/145928710: timed26 owns a neutral instance plus its
        // interval override, then refreshes its spell modifiers. Learned
        // upgrades are not copied into this stored auxiliary visual record.
        let auxiliary: Vec<_> = self.effect_state.timed.iter().filter_map(|row| {
            let definition = AbilityDefinition::by_key(row.key)?;
            let mut instance = RuntimeInstance::learned(definition);
            self.effect_state.equipped.spell_modifiers(definition).apply(&mut instance);
            Some(instance)
        }).collect();
        let mut scales = player_abilities::visual_scale::collect(
            self.abilities.iter().chain(self.racial.iter()).chain(auxiliary.iter()),
            self.effect_state.numeric.area,
        );
        if let Some(infernal) = self.demon_infernal_visual_scale() {
            scales.push(infernal);
        }
        scales
    }

    /// Native model/scale state shared by packet publication and live meshes.
    pub fn actor_appearance(&self, guid: u64) -> Option<(u32, f32)> {
        self.effect_state
            .generic
            .appearance_overrides
            .get(&guid)
            .copied()
            .or_else(|| self.boss_state.forms.get(&guid).map(|row| (row.display,row.scale)))
            .or_else(|| {
                self.actors.iter().find(|row| row.guid == guid).map(|row| {
                    (
                        row.definition.model_id,
                        self.guardian_render_scale(guid)
                            .or_else(|| self.bolstered_scale(guid))
                            .unwrap_or(row.definition.scale),
                    )
                })
            })
            .or_else(|| {
                self.bosses
                    .iter()
                    .find(|row| row.guid == guid)
                    .map(|row| (row.definition.model_id, row.definition.scale))
            })
            .or_else(|| self.boss_state.wards.actors.iter().find(|row| row.guid == guid)
                .map(|row| (row.template.display, row.template.scale)))
    }

    /// Persisted form equipment and mount descriptors also belong to the
    /// first UNIT snapshot, before a later ObjectValues event can arrive.
    pub fn actor_form_fields(&self, guid: u64) -> Option<&[(u16, u32)]> {
        self.boss_state.forms.get(&guid).map(|form| form.fields.as_slice())
    }

    pub fn ward_actors(&self) -> &[azeroth_survivors_re::bosses::raid_wards::Ward] {
        &self.boss_state.wards.actors
    }

    pub fn new(
        zone_key: &str,
        class_key: &str,
        rules: RunRules,
        stats: RunPlayerStats,
        seed: [u64; 4],
    ) -> Result<Self, String> {
        let zone_key = azeroth_survivors_re::zones::resolve(zone_key).key;
        let zone = ZoneDefinition::by_key(zone_key)
            .ok_or_else(|| format!("No recovered enemy catalog for {zone_key}"))?;
        let class = player_abilities::CLASSES
            .iter()
            .find(|class| class.key == class_key)
            .ok_or_else(|| format!("No recovered ability catalog for {class_key}"))?;
        let starter = AbilityDefinition::by_key(class.starter)
            .ok_or_else(|| format!("Missing recovered starter {}", class.starter))?;
        if seed == [0; 4] {
            return Err("The shared run RNG requires a nonzero seed".into());
        }
        Ok(Self {
            player_guid: 1,
            addon_run_id: String::new(),
            detailed_meter: Default::default(),
            equipment_ids: [0; 19],
            ranged_gun: false,
            coop: coop::CoopSimulation::default(),
            zone,
            class,
            rules,
            affixes: affixes::State::default(),
            stats,
            actors: Vec::new(),
            bosses: Vec::new(),
            pickups: Vec::new(),
            abilities: vec![RuntimeInstance::learned(starter)],
            racial: racial_definition(stats.native_race).map(RuntimeInstance::learned),
            racial_cooldown: None,
            execution: ExecutionState {
                seen_spells: Vec::new(),
                pending: PendingHits::default(),
                ground: Vec::new(),
                totems: Vec::new(),
                auras: Vec::new(),
                divine_shield_expires_at: f32::NEG_INFINITY,
                vitals: Vitals {
                    health: stats.maximum_health * stats.health_multiplier,
                    maximum_health: stats.maximum_health * stats.health_multiplier,
                    absorb: 0.0,
                    absorb_applied_at: 0.0,
                    absorb_same_tick_count: 0,
                },
                shield: ShieldReservation::default(),
            },
            clock: 0.0,
            alive_since: 0.0,
            fall_epoch: 0.0,
            level: 1,
            xp: 0,
            gold: 0,
            gold_earned: 0,
            kills: 0,
            elite_kills: 0,
            choices: Vec::new(),
            events: Vec::new(),
            dead: false,
            completed: false,
            abandoned: false,
            boundary_started: false,
            boundary_objects: Vec::new(),
            taken_damage: super::addon_meters::TakenLedger::default(),
            damage_history: Default::default(),
            death_recap: None,
            death_recap_generation: 0,
            recap_spells: None,
            addon_flag: None,
            world_flag: Default::default(),
            showcase: showcase::State::default(),
            published_cooldowns: Vec::new(),
            rng: NativeRng::from_words(seed),
            counter: SharedCounter::default(),
            spawner: OrdinarySpawner::new(),
            waves: WaveTimers::new(),
            loot: MobLootState::default(),
            pending_healing: Vec::new(),
            pending_absorb: Vec::new(),
            pending_levels: 0,
            passive_state: PassiveTickState::default(),
            movement_counter: 0,
            player_mover: player_mover::PlayerMover::default(),
            native_7e4: 0,
            boss_state: bosses::BossState::new(rules.endless),
            guardian_state: guardians::GuardianState::default(),
            choice_state: choices::ChoiceState {
                controls: choice_controls::ChoiceControls {
                    free_rerolls: azeroth_survivors_re::heroic::free_rerolls_base(rules.heroic_rank),
                    ..Default::default()
                },
                luck_bonus: stats.luck_bonus,
                ..Default::default()
            },
            chest_state: chests::ChestState::for_rank(rules.heroic_rank),
            pickup_state: pickup_effects::State::default(),
            treasure_state: treasure::TreasureState::default(),
            effect_state: effects::EffectsState::new(stats),
            weapon_state: azeroth_survivors_re::run_effects::weapon::State::new(0.0),
            pet_state: pets::State::default(),
            loot_companion_state: loot_companions::State::default(),
            demon_state: demons::State::default(),
        })
    }

    pub fn health(&self) -> f32 {
        self.execution.vitals.health
    }
    pub fn max_health(&self) -> f32 {
        self.execution.vitals.maximum_health
    }
    /// Current threshold1454c6ad3..6aec calls roundf14577322f.
    pub fn xp_required(&self) -> u32 {
        let n = self.level.saturating_sub(1) as f32;
        let quadratic = (0.35 * n) * n;
        let linear = n * 4.0 + 5.0;
        (quadratic + linear).round() as u32
    }
    pub fn is_paused_for_choice(&self) -> bool {
        !self.choices.is_empty() || self.replica_phase() == Some(azeroth_survivors_re::coop::client_state::RunPhase::Choosing)
    }

    /// Current mode1 gates use an open offer, not the stored-level count.
    /// Cache offers populate the same choices vector as earned-level offers.
    fn active_run_state(&self) -> bool {
        !self.dead && !self.completed && !self.is_paused_for_choice()
    }

    pub(super) fn current_cooldown_multiplier(&self) -> f32 {
        aura_cooldown(
            self.effect_state.numeric.recovery,
            &self.execution.auras,
            self.clock,
            self.effect_state.numeric.buff_bonus,
        )
    }

    pub fn current_damage_multiplier(&self) -> f32 {
        aura_damage(
            self.stats.damage_multiplier + 0.03 * self.level.saturating_sub(1) as f32,
            &self.execution.auras,
            self.clock,
            self.effect_state.numeric.buff_bonus,
        )
    }

    /// Last native successful-cast publication, independent of the auto-cast
    /// scheduler's initial delay and no-target/failed-cast retry timers.
    pub fn ability_cooldown(&self, spell_id: u32) -> Option<RunCooldown> {
        self.published_cooldowns
            .iter()
            .find_map(|(id, cooldown)| (*id == spell_id).then_some(*cooldown))
    }

    pub fn class_resource(&self) -> Option<ResourceBar> {
        self.passive_state.resource_bar
    }

    /// Shared recovered threshold; XP credited here is collected XP, not kill
    /// XP. Drops remain in the loaded world until the pickup owner collects.
    pub fn add_experience(&mut self, amount: u32) {
        use azeroth_survivors_re::loot_rewards::prose::Text;
        self.xp = self.xp.wrapping_add(amount);
        // 0.127.0 XP owner145c2b58e admits levels through119, then stops at120.
        while self.level < RUN_LEVEL_CAP && self.xp >= self.xp_required() {
            self.xp -= self.xp_required();
            let before = self.effect_state.numeric;
            let old_stacks = (self.level / 15).min(3);
            self.level = self.level.saturating_add(1);
            self.pending_levels = self.pending_levels.wrapping_add(1);
            self.events.push(RunEvent::LevelUp(self.level));
            self.refresh_effects();
            let after = self.effect_state.numeric;
            self.events.push(RunEvent::SystemMessage(Text::Template {
                key: "You have gained {damage}% damage, {health} maximum health and {regen} health per second.".into(),
                values: vec![
                    ("damage".into(), Text::Literal(format!("{:.0}", (after.damage - before.damage) * 100.0))),
                    ("health".into(), Text::Literal(format!("{:.0}", after.health - before.health))),
                    ("regen".into(), Text::Literal(format!("{:.2}", after.regeneration - before.regeneration))),
                ],
            }));
            let stacks = (self.level / 15).min(3);
            if stacks > old_stacks
                && self
                    .abilities
                    .iter()
                    .any(|ability| ability.definition.kind == 6)
            {
                self.events.push(RunEvent::SystemMessage(Text::Template {
                    key: "Your damage over time spells now stack {n} times on one enemy.".into(),
                    values: vec![("n".into(), Text::Literal((stacks + 1).to_string()))],
                }));
            }
            //1454c6fd6..709e is inside the earned-level loop, after messages.
            // Its inline heal has no spell identity, overheal conversion or pool.
            self.heal_level_up();
        }
        self.events.push(RunEvent::PlayerValues(vec![
            (716, self.xp),
            (717, self.xp_required()),
        ]));
        self.maybe_generate_level_choices();
    }

    fn heal_level_up(&mut self) {
        use azeroth_survivors_re::run_effects::healing::MeterSource;
        self.apply_healing(PendingHealing {
            requested: self.max_health() * 0.2,
            context: None,
            general_owner: false,
            manual: false,
            meter_source: Some(MeterSource {
                name: "Level Up",
                icon: "Spell_Holy_HolyBolt",
                talent: false,
            }),
            meter_effect: None,
        });
    }

    pub fn choose(&mut self, index: usize) -> bool {
        if self.dead || self.completed {
            return false;
        }
        if self.cache_choices_active() {
            return self.choose_cache_reward(index);
        }
        let Some(choice) = self.choices.get(index).cloned() else {
            return false;
        };
        if choice.gold != 0 {
            self.credit_pickup_gold(choice.gold);
        } else if !choice.upgrades.is_empty() {
            let Some(instance) = self
                .abilities
                .iter_mut()
                .find(|row| row.definition.key == choice.ability_key)
            else {
                return false;
            };
            for kind in choice.upgrades {
                upgrades::apply(instance, kind, choice.rarity);
            }
        } else {
            let Some(definition) = AbilityDefinition::by_key(choice.ability_key) else {
                return false;
            };
            let mut instance = RuntimeInstance::learned(definition);
            upgrades::apply_learned_rarity(&mut instance, choice.rarity);
            self.abilities.push(instance);
        }
        if choice.gold == 0 {
            self.effect_state
                .seen
                .push((choice.ability_key.into(), choice.rarity as u8));
        }
        self.pending_levels = self.pending_levels.saturating_sub(1);
        self.choice_state.first_offer_seen = true;
        self.refresh_effects();
        self.complete_choice();
        true
    }

    /// Return the final forced player position from this admitted frame.
    pub fn tick(
        &mut self,
        delta: f32,
        mut player: Position,
        velocity: [f32; 2],
        mut facing: f32,
        world: &mut impl RunWorld,
    ) -> Option<Position> {
        self.validate_prepared_loadout();
        self.tick_stage(delta, player, velocity, facing, world, false)
    }

    fn tick_stage(&mut self, delta: f32, mut player: Position, velocity: [f32; 2],
        mut facing: f32, world: &mut impl RunWorld, player_only: bool) -> Option<Position> {
        if self.dead || self.completed || self.is_paused_for_choice() || delta <= 0.0 {
            return None;
        }
        // Current local Server::update caps elapsed time at 100ms before the
        // Game clock and simulation consumers. An ordered comparison retains
        // the native NaN propagation; f32::min would replace NaN with the cap.
        let delta = if delta > 0.1 { 0.1 } else { delta };
        let mut forced_position = None;
        self.begin_showcase(player, velocity, world);
        self.begin_pets(player, facing, world);
        self.begin_loot_companions(player, facing, world);
        self.begin_demons(player, facing, world);
        self.finish_showcase_entry(player, velocity, world);
        self.begin_pickups();
        if !player_only { self.begin_boundary(world); self.clock += delta; }
        self.tick_showcase(player, velocity, world);
        let now = self.clock;
        let rules = self.rules;
        let aura_tick = buffs::tick_auras(
            &mut self.execution.auras,
            now,
            delta,
            &mut self.execution.vitals,
            &mut self.execution.shield,
        );
        let regeneration = azeroth_survivors_re::run_effects::healing::regeneration_amount(
            self.stats.regeneration, self.effect_state.numeric.calm_regen,
            self.execution.vitals.maximum_health, now, self.effect_state.incoming.last_hit_at, delta,
        );
        let batch = azeroth_survivors_re::run_effects::healing::apply_batch_for_rank(
            &mut self.execution.vitals,
            &self.effect_state.equipped.rows,
            &mut self.effect_state.generic.healing,
            regeneration,
            &aura_tick.healing,
            self.rules.heroic_rank,
        );
        if let Some(fields) = batch.fields {
            self.events.push(RunEvent::Healing {
                amount: batch.actual,
                context: None,
                emit_log: false,
                fields,
            });
        }
        self.effect_state.generic.healing_meter.record(
            azeroth_survivors_re::run_effects::healing::REGENERATION,
            batch.regeneration,
        );
        self.record_detailed_heal(
            self.player_guid, 0, azeroth_survivors_re::run_effects::healing::REGENERATION,
            batch.regeneration, false,
        );
        for (healer, actual) in batch.credits {
            let spell_id = healer.spell_id;
            let source = azeroth_survivors_re::run_effects::healing::meter_source(
                0,
                [0; 4],
                [0; 4],
                None,
                &self.effect_state.meter_sources,
                spell_id,
                self.meter_definition(spell_id),
            );
            self.record_detailed_heal(healer.source_guid, spell_id, source, actual, true);
            self.effect_state
                .generic
                .healing_meter
                .record(source, actual);
        }
        self.effect_state.generic.flush_cooldowns(
            &self.abilities, &self.effect_state.equipped, &self.execution.auras,
            now, &mut self.published_cooldowns,
        );
        let mut context = self.cast_context(player, facing);
        let mut passive_context = behavior::passive_tick::TickContext {
            now,
            delta,
            player_guid: self.player_guid,
            player,
            power: context.power,
            global_cooldown: self.current_cooldown_multiplier(),
            global_area: context.global_area,
            global_target_bonus: context.global_target_bonus,
        };
        let extra_cast_factor =
            self.effect_state.numeric.extra_cast - self.effect_state.equipped.sum(13);
        let cooperative_luck = self.active_cooperative_luck();
        let mut port = CombatAdapter {
            detailed_meter: &mut self.detailed_meter,
            party_healing: self.coop.healing_port(),
            player_guid: self.player_guid,
            showcase: self.showcase.enabled,
            actors: &mut self.actors,
            bosses: &mut self.bosses,
            pets: &mut self.pet_state.rows,
            hunter_mark: self.passive_state.hunters_mark.guid,
            boss_state: &mut self.boss_state,
            guardian_state: &mut self.guardian_state,
            affixes: &mut self.affixes,
            pickups: &mut self.pickups,
            object_counter: self.counter.clone(),
            loot: &mut self.loot,
            kills: &mut self.kills,
            elite_kills: &mut self.elite_kills,
            events: &mut self.events,
            healing: &mut self.pending_healing,
            absorbs: &mut self.pending_absorb,
            now,
            run_level: self.level,
            player,
            zone: self.zone,
            rules,
            stats: RunPlayerStats {
                maximum_health: self.execution.vitals.maximum_health,
                ..self.stats
            },
            class_id: self.class.class_id,
            player_absorb: self.execution.vitals.absorb,
            equipped: &self.effect_state.equipped,
            meter_sources: &self.effect_state.meter_sources,
            meter_abilities: self.abilities.iter().map(|row| (row.definition, row.rank)).collect(),
            meter_racial: self.racial.map(|row| row.definition),
            meter_spells: self.recap_spells.as_deref(),
            aura_provenance: &self.effect_state.display_provenance,
            rescue_ready_at: self.effect_state.incoming.lethal_talent_ready_at,
            soul_link_absorb: &mut self.effect_state.incoming.soul_link_absorb,
            special_demons: self.demon_state.rows.len(),
            racial_cooldown: self
                .racial
                .as_ref()
                .filter(|row| row.definition.effect.tag == 11)
                .map(|row| row.remaining),
            movement_counter: &mut self.movement_counter,
            numeric: &mut self.effect_state.numeric,
            stats_recomputed: false,
            pre_stats: self.effect_state.pre_stats,
            cooperative_luck,
            base_stats: self.effect_state.base,
            base_leech: self.effect_state.base_leech,
            generic: &mut self.effect_state.generic,
            extra_cast: false,
            extra_cast_factor: extra_cast_factor,
            leech: self.effect_state.leech,
            world,
            attribution: PassiveAttribution {
                source_kind: 0,
                source_words: [0; 4],
                cast_words: [0; 4],
            },
        };
        // Current14549e46b..ed86 ordinary loop, then14549ed8b racial, precede
        // class-special ticks, pending impacts and the shared ground/totem queues.
        port.flush_vitals(&mut self.execution.vitals);
        {
            let mut passive = passives::PassiveCombat {
                core: &mut port,
                learned: &mut self.abilities,
                state: &mut self.passive_state,
                context: passive_context,
                cast_context: context,
                first_periodic: false,
                native_7e4: &mut self.native_7e4,
                object_counter: None,
                native_30: false,
            };
            passive.weapon_tick(
                &mut self.weapon_state,
                delta,
                &mut self.execution,
                &mut self.rng,
                &mut self.counter,
            );
        }
        context = port.current_context(context, &self.execution);
        passive_context.power = context.power;
        passive_context.global_area = context.global_area;
        passive_context.global_target_bonus = context.global_target_bonus;
        passive_context.global_cooldown = aura_cooldown(
            port.numeric.recovery,
            &self.execution.auras,
            now,
            port.numeric.buff_bonus,
        );
        {
            let mut scheduler = AbilityScheduler {
                context,
                execution: &mut self.execution,
                rng: &mut self.rng,
                counter: &mut self.counter,
                port: &mut port,
                passive_context,
                passive_state: &mut self.passive_state,
                native_7e4: &mut self.native_7e4,
                published_cooldowns: &mut self.published_cooldowns,
                demon_state: &mut self.demon_state,
            };
            behavior::tick_cooldowns(&mut self.abilities, delta, &mut scheduler);
            if let Some(racial) = self.racial.as_mut() {
                if let Some(cooldown) = scheduler.tick_racial(racial, &mut self.abilities, delta) {
                    self.racial_cooldown = Some(cooldown);
                }
            }
            //1454b0dea..0e66 expires temporary stats after ordinary/racial
            // casts, before the ordered timed26 loop and healing-pool stage.
            if scheduler.port.generic.temporary.expire(now) {
                scheduler
                    .port
                    .refresh_numeric(scheduler.execution);
            }
            scheduler.tick_timed(&mut self.effect_state.timed, &mut self.abilities, delta);
            scheduler.port.generic.flush_cooldowns(
                &self.abilities, scheduler.port.equipped, &scheduler.execution.auras,
                now, scheduler.published_cooldowns,
            );
        }
        context = port.current_context(context, &self.execution);
        passive_context.power = context.power;
        passive_context.global_area = context.global_area;
        passive_context.global_target_bonus = context.global_target_bonus;
        passive_context.global_cooldown = aura_cooldown(
            port.numeric.recovery,
            &self.execution.auras,
            now,
            port.numeric.buff_bonus,
        );
        {
            let mut passive = passives::PassiveCombat {
                core: &mut port,
                learned: &mut self.abilities,
                state: &mut self.passive_state,
                context: passive_context,
                cast_context: context,
                first_periodic: false,
                native_7e4: &mut self.native_7e4,
                object_counter: Some(&mut self.counter),
                native_30: false,
            };
            // Current1454b110c pool publication precedes class-special tick.
            let object_counter = passive
                .object_counter
                .take()
                .expect("live run object serial");
            passive.core.expire_deathmist_brand();
            passive.pulse_healing_pool(&mut self.execution, &mut self.rng, object_counter);
            passive.resolve_seeds_of_life(&mut self.execution, &mut self.rng, object_counter);
            passive.object_counter = Some(object_counter);
            let object_counter = passive
                .object_counter
                .take()
                .expect("live run object serial");
            passive.demon_prepare(
                &mut self.demon_state, facing, &mut self.execution,
                &mut self.rng, object_counter,
            );
            passive.pet_tick(
                facing,
                &mut self.execution,
                &mut self.rng,
                object_counter,
            );
            passive.demon_tick(
                &mut self.demon_state, facing, &mut self.execution,
                &mut self.rng, object_counter,
            );
            passive.object_counter = Some(object_counter);
            // Current class-special consumers precede impacts/ground/totems.
            behavior::passive_tick::tick(&mut self.rng, &mut passive);
            let object_counter = passive
                .object_counter
                .take()
                .expect("live run object serial");
            let mut due = Vec::new();
            self.execution.pending.0.retain(|hit| {
                if now >= hit.resolves_at && !hit.damages_player {
                    due.push(*hit);
                    false
                } else {
                    true
                }
            });
            for hit in due {
                passive.pending_demon_spell_hit(hit, &mut self.rng, &mut self.execution, object_counter);
            }
            let targets = actor_targets(passive.core.actors, passive.core.bosses, &passive.core.boss_state.wards, passive.core.object_counter.sequence());
            dispatch::tick_ground(
                context,
                &targets,
                &mut self.execution,
                &mut self.rng,
                &mut passive,
                object_counter,
            );
            // Selected0.105.0 deadline and cap eviction share the same live
            // expiry callback, including cooldown packets and passive hits.
            totems::tick_totems(
                context,
                &mut self.execution.totems,
                &mut self.execution.pending,
                &mut self.execution.vitals,
                self.effect_state.equipped.rows.len(),
                &mut self.rng,
                &mut passive,
            );
        }
        port.flush_vitals(&mut self.execution.vitals);
        let refreshed = port.stats_recomputed.then_some((port.stats, port.leech));
        drop(port);
        if let Some((stats, leech)) = refreshed {
            self.accept_refreshed_stats(stats, leech);
        }

        // Immediate cast heals and secondary player effects are committed once
        // after each dispatched ability stage, avoiding duplicate vital writes.
        for healing in std::mem::take(&mut self.pending_healing) {
            self.apply_healing(healing);
        }
        for fraction in std::mem::take(&mut self.pending_absorb) {
            self.execution.vitals.absorb_effect(now, fraction);
        }
        let mut due_hostile = Vec::new();
        self.execution.pending.0.retain(|hit| {
            if hit.damages_player && now >= hit.resolves_at {
                due_hostile.push(*hit);
                false
            } else {
                true
            }
        });
        for hit in due_hostile {
            //145c69bf2..145c69c1f: test the captured launch position against
            //the victim's current position after detaching due impacts. A wall
            //consumes the hit without damage, even if its source has gone.
            if let Some(origin) = hit.context.hostile_origin {
                let from = Position { x: f32::from_bits(origin[0]),
                    y: f32::from_bits(origin[1]), z: f32::from_bits(origin[2]) };
                if !world.sight_clear(from, player) { continue; }
            }
            self.damage_player_from(
                hit.damage, incoming::DamageKind::Spell(hit.spell_id),
                hit.source_guid, player, facing, world,
            );
        }
        // Current145900736 continues the admitted frame after lethal damage.
        // Individual damage/movement callbacks retain their own mode gates.
        if !player_only {
            self.resolve_boss_effects(delta, player, facing, world);
            self.expire_scripted_attacks(world);
        }
        if let Some((point, angle)) = self.boss_state.player_override.take() {
            player = point; facing = angle;
            forced_position = Some(point);
        }
        if !player_only { self.tick_actor_frame(delta, player, facing, world); }
        if let Some((point, angle)) = self.boss_state.player_override.take() {
            player = point; facing = angle;
            forced_position = Some(point);
        }
        self.tick_pickup_collection(player);
        self.refresh_player_run_speed();
        // Current1459035f4 gates companions, but145904118's independent
        // scheduling-suppression flag is zero in the normal constructor.
        if self.active_run_state() {
            self.tick_loot_companions(player, facing, world);
        }
        if !player_only { self.spawn_scheduled_world(delta, player, velocity, world); }
        if !player_only && self.active_run_state() {
            self.finish_boss_completion(world);
        }
        self.drain_guardian_strength();
        self.publish_player_auras();
        forced_position
    }

    /// Native145904118..1459073b2 schedules the world after actor/pickup
    /// stages, before completion145907826 and strength145907959.
    fn spawn_scheduled_world(
        &mut self,
        delta: f32,
        player: Position,
        velocity: [f32; 2],
        world: &mut impl RunWorld,
    ) {
        let now = self.clock;
        let rules = self.rules;
        let active_bosses: Vec<_> = self
            .bosses
            .iter()
            .filter(|row| !row.actor.dead)
            .map(|row| {
                if row.definition.flag_54 == 0 {
                    spawning::ActiveBoss::Ordinary
                } else {
                    spawning::ActiveBoss::Flagged
                }
            })
            .collect();
        self.tick_affix_pools();
        self.tick_affix_orbs(player, world);
        let input = spawning::TickInput {
            clock_seconds: now,
            delta_seconds: delta,
            density_percent: rules.density_percent,
            cooperative_density: self.party_scaling().map(|scaling| scaling.density),
            active_bosses: &active_bosses,
            suppressed: false,
            endless: rules.endless,
            endless_phase_one: self.boss_state.phase() == 1,
            endless_started_at: self.boss_state.endless_started_at(),
        };
        let mut spawn = SpawnAdapter {
            party_health_multiplier: self.party_health_factors()[0],
            zone: self.zone,
            rules,
            phase: self.boss_state.phase(),
            endless_started_at: self.boss_state.endless_started_at(),
            now,
            run_level: self.level,
            player,
            velocity,
            actors: &mut self.actors,
            live_bosses: active_bosses.len()+self.boss_state.wards.actors.iter().filter(|row| !row.actor.dead).count(),
            counter: &mut self.counter,
            world,
            events: &mut self.events,
        };
        if !spawning::admitted_enemy_indices(self.zone, now / 60.0).is_empty() {
            self.spawner.tick_with_expf(
                self.zone,
                input,
                &mut self.rng,
                &mut self.loot.death_accumulator,
                f32::exp,
                &mut spawn,
            );
            self.waves
                .tick_elite_for_rank(self.zone, input, &mut self.rng, &mut spawn, self.rules.heroic_rank);
            let mut wave_terrain = spawn.world.clone();
            self.waves.tick_pattern(
                self.zone,
                input,
                player,
                velocity,
                rules.speed_percent,
                &mut self.rng,
                &mut wave_terrain,
                &mut HostPlacementMath,
                &mut spawn,
            );
        }
        // Native145906574/1459067a5/1459068e6 produces runes, chests and magnets
        // after primary bosses and before guardian construction145906a63.
        self.spawn_due_bosses(player, velocity, world);
        self.tick_runes(player, world);
        self.tick_chests(player, velocity, world);
        self.tick_forced_magnet(player, world);
        self.spawn_due_guardians(world);
    }

    fn publish_actor_aura_updates(&mut self, mut updates: Vec<callbacks::ActorAuraUpdate>) {
        // Native14597c250..275 drains all removals before the separate
        // applications queue14597c2c0..2e2. Stable sorting preserves actor
        // insertion order inside each queue.
        updates.sort_by_key(|update| matches!(update, callbacks::ActorAuraUpdate::Applications { .. }));
        for update in updates {
            let (target, spell_id, applications) = match update {
                callbacks::ActorAuraUpdate::Remove { target, spell_id } => {
                    (target, spell_id, false)
                }
                callbacks::ActorAuraUpdate::Applications { target, spell_id } => {
                    (target, spell_id, true)
                }
            };
            let periodic = self
                .actors
                .iter()
                .find(|row| row.guid == target)
                .map(|row| &row.periodic)
                .or_else(|| {
                    self.bosses
                        .iter()
                        .find(|row| row.guid == target)
                        .map(|row| &row.periodic)
                })
                .or_else(|| self.boss_state.wards.actors.iter().find(|row| row.guid == target)
                    .map(|row| &row.periodic));
            let Some(periodic) = periodic else {
                continue;
            };
            if applications {
                if let Some(fields) = self
                    .effect_state
                    .generic
                    .aura_slots
                    .entry(target)
                    .or_default()
                    .update_applications(spell_id, periodic)
                {
                    self.events.push(RunEvent::Aura {
                        target,
                        spell_id,
                        present: true,
                        fields,
                    });
                }
            } else {
                self.events.extend(
                    self.effect_state
                        .generic
                        .aura_event(target, spell_id, false, periodic),
                );
            }
        }
    }

    /// Current1454b70d2 actor-update follows all player cast/impact/ground/totem
    /// stages. Its collected periodic requests retain that same late ordering.
    fn resolve_actor_periodic(
        &mut self,
        periodic_hits: Vec<periodic::PeriodicTick>,
        delta: f32,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        if periodic_hits.is_empty() {
            return;
        }
        let now = self.clock;
        let rules = self.rules;
        let context = self.cast_context(player, facing);
        let passive_context = behavior::passive_tick::TickContext {
            now,
            delta,
            player_guid: self.player_guid,
            player,
            power: context.power,
            global_cooldown: self.current_cooldown_multiplier(),
            global_area: context.global_area,
            global_target_bonus: context.global_target_bonus,
        };
        let extra_cast_factor =
            self.effect_state.numeric.extra_cast - self.effect_state.equipped.sum(13);
        let cooperative_luck = self.active_cooperative_luck();
        let mut port = CombatAdapter {
            detailed_meter: &mut self.detailed_meter,
            party_healing: self.coop.healing_port(),
            player_guid: self.player_guid,
            showcase: self.showcase.enabled,
            actors: &mut self.actors,
            bosses: &mut self.bosses,
            pets: &mut self.pet_state.rows,
            hunter_mark: self.passive_state.hunters_mark.guid,
            boss_state: &mut self.boss_state,
            guardian_state: &mut self.guardian_state,
            affixes: &mut self.affixes,
            pickups: &mut self.pickups,
            object_counter: self.counter.clone(),
            loot: &mut self.loot,
            kills: &mut self.kills,
            elite_kills: &mut self.elite_kills,
            events: &mut self.events,
            healing: &mut self.pending_healing,
            absorbs: &mut self.pending_absorb,
            now,
            run_level: self.level,
            player,
            zone: self.zone,
            rules,
            stats: RunPlayerStats {
                maximum_health: self.execution.vitals.maximum_health,
                ..self.stats
            },
            class_id: self.class.class_id,
            player_absorb: self.execution.vitals.absorb,
            equipped: &self.effect_state.equipped,
            meter_sources: &self.effect_state.meter_sources,
            meter_abilities: self.abilities.iter().map(|row| (row.definition, row.rank)).collect(),
            meter_racial: self.racial.map(|row| row.definition),
            meter_spells: self.recap_spells.as_deref(),
            aura_provenance: &self.effect_state.display_provenance,
            rescue_ready_at: self.effect_state.incoming.lethal_talent_ready_at,
            soul_link_absorb: &mut self.effect_state.incoming.soul_link_absorb,
            special_demons: self.demon_state.rows.len(),
            racial_cooldown: self
                .racial
                .as_ref()
                .filter(|row| row.definition.effect.tag == 11)
                .map(|row| row.remaining),
            movement_counter: &mut self.movement_counter,
            numeric: &mut self.effect_state.numeric,
            stats_recomputed: false,
            pre_stats: self.effect_state.pre_stats,
            cooperative_luck,
            base_stats: self.effect_state.base,
            base_leech: self.effect_state.base_leech,
            generic: &mut self.effect_state.generic,
            extra_cast: false,
            extra_cast_factor: extra_cast_factor,
            leech: self.effect_state.leech,
            world,
            attribution: PassiveAttribution {
                source_kind: 0,
                source_words: [0; 4],
                cast_words: [0; 4],
            },
        };
        {
            let mut passive = passives::PassiveCombat {
                core: &mut port,
                learned: &mut self.abilities,
                state: &mut self.passive_state,
                context: passive_context,
                cast_context: context,
                first_periodic: false,
                native_7e4: &mut self.native_7e4,
                object_counter: None,
                native_30: false,
            };
            let object_counter = &mut self.counter;
            for hit in periodic_hits {
                // Current Soul Devourer modifies Felhunter hits; it no longer
                // adds a critical roll to subsequent Agony ticks.
                let power = hit.raw_power;
                let critical = false;
                passive.core.events.push(RunEvent::PeriodicDamage {
                    source: self.player_guid,
                    target: hit.target_guid,
                    spell_id: hit.spell_id,
                    school: hit.school,
                    amount: power,
                });
                let attribution = passive.core.attribution;
                passive.core.attribution.source_kind = 1;
                passive.native_30 = hit.owner_kind != 0;
                passive.first_periodic = hit.first_player_tick;
                let mut effect = player_abilities::StatusEffect {
                    tag: 0,
                    value: 0.0,
                    duration: 0.0,
                };
                if hit.leech_fraction != 0.0 {
                    effect.tag = 5;
                    effect.value = hit.leech_fraction;
                }
                passive.hit_with_execution(
                    PendingHit {
                        context: HitContext {
                            // Current14593dd6c/14593df1f..14593df7c copies
                            // the periodic row's first16 bytes into Game+30.
                            source_words: [
                                hit.owner_kind as u32, (hit.owner_kind >> 32) as u32,
                                hit.owner_guid as u32, (hit.owner_guid >> 32) as u32,
                            ],
                            suppress_damage_log: true,
                            meter_periodic: true,
                            meter_actor: hit.meter_actor,
                            ..Default::default()
                        },
                        target_guid: hit.target_guid,
                        source_guid: hit.effect_owner.unwrap_or(hit.owner_guid),
                        effect,
                        resolves_at: now,
                        spell_id: hit.spell_id,
                        damage: power,
                        critical,
                        damages_player: false,
                        school: hit.school,
                    },
                    &mut self.rng,
                    &mut self.execution,
                    object_counter,
                );
                passive.core.attribution = attribution;
                passive.native_30 = false;
                passive.first_periodic = false;
            }
        }
        port.flush_vitals(&mut self.execution.vitals);
        let refreshed = port.stats_recomputed.then_some((port.stats, port.leech));
        drop(port);
        if let Some((stats, leech)) = refreshed {
            self.accept_refreshed_stats(stats, leech);
        }
    }

    fn cast_context(&self, player: Position, facing: f32) -> CastContext {
        CastContext {
            now: self.clock,
            player_guid: self.player_guid,
            player,
            facing: [facing.cos(), facing.sin()],
            summon_facing: [facing.cos(), facing.sin()],
            power: PowerContext {
                maximum_health: self.max_health(),
                damage_multiplier: self.current_damage_multiplier(),
            },
            global_area: self.effect_state.numeric.area,
            global_target_bonus: self.effect_state.numeric.targets,
            global_dot_stack_bonus: (self.level / 15).min(3),
            global_dot_tick_bonus: self.effect_state.numeric.dot_tick,
            shield_bonus: self.effect_state.numeric.buff_bonus,
            hit_context: HitContext::default(),
            aimed_shot_focus: 0,
            chain_no_decay: self.effect_state.equipped.chain_no_decay(),
            native_race: self.stats.native_race,
            packed_player_field: self.stats.packed_player_field,
        }
    }

    fn heal(&mut self, amount: f32) {
        self.apply_healing(PendingHealing::anonymous(amount));
    }
    fn meter_definition(&self, spell_id: u32) -> Option<&'static AbilityDefinition> {
        azeroth_survivors_re::run_meter::source_definition(
            spell_id,
            self.abilities.iter().map(|instance| instance.definition),
            self.racial.as_ref().map(|instance| instance.definition),
        )
    }
    fn apply_healing(&mut self, mut healing: PendingHealing) {
        if let Some(context) = healing.context.as_mut() {
            if context.source == 1 && context.target == 1 {
                context.source = self.player_guid;
                context.target = self.player_guid;
            }
        }
        let spell_id = if healing.general_owner {
            healing.context.map_or(0, |context| context.spell_id)
        } else {
            0
        };
        let result = healing.apply(
            &mut self.execution.vitals,
            &self.effect_state.equipped.rows,
            &mut self.effect_state.generic.healing,
            spell_id,
            self.rules.heroic_rank,
        );
        let source = healing.meter_source.unwrap_or_else(|| {
            azeroth_survivors_re::run_effects::healing::meter_source(
                0,
                [0; 4],
                [0; 4],
                None,
                &self.effect_state.meter_sources,
                spell_id,
                self.meter_definition(spell_id),
            )
        });
        self.record_detailed_heal(
            healing.context.map_or(self.player_guid, |context| context.source),
            healing.context.map_or(0, |context| context.spell_id),
            source, result.actual, false,
        );
        self.effect_state
            .generic
            .healing_meter
            .record(source, result.actual);
        self.events.push(RunEvent::Healing {
            amount: result.actual,
            context: healing.context,
            emit_log: result.emit_log,
            fields: result.fields,
        });
    }

    /// Current14548fd49..49001a, retained in run-entry/player-damage.asm:
    /// a ready invulnerability racial dispatches at one HP before death. Failure
    /// restores the lethal HP and does not install the normal tick's .5 retry.
    fn try_lethal_racial(
        &mut self,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) -> bool {
        if !self
            .racial
            .as_ref()
            .is_some_and(|racial| racial.definition.effect.tag == 11 && racial.remaining <= 0.0)
        {
            return false;
        }
        let lethal_health = self.execution.vitals.health;
        self.execution.vitals.health = 1.0;
        let context = self.cast_context(player, facing);
        let passive_context = behavior::passive_tick::TickContext {
            now: self.clock,
            delta: 0.0,
            player_guid: self.player_guid,
            player,
            power: context.power,
            global_cooldown: self.current_cooldown_multiplier(),
            global_area: context.global_area,
            global_target_bonus: context.global_target_bonus,
        };
        let extra_cast_factor =
            self.effect_state.numeric.extra_cast - self.effect_state.equipped.sum(13);
        let cooperative_luck = self.active_cooperative_luck();
        let mut port = CombatAdapter {
            detailed_meter: &mut self.detailed_meter,
            party_healing: self.coop.healing_port(),
            player_guid: self.player_guid,
            showcase: self.showcase.enabled,
            actors: &mut self.actors,
            bosses: &mut self.bosses,
            pets: &mut self.pet_state.rows,
            hunter_mark: self.passive_state.hunters_mark.guid,
            boss_state: &mut self.boss_state,
            guardian_state: &mut self.guardian_state,
            affixes: &mut self.affixes,
            pickups: &mut self.pickups,
            object_counter: self.counter.clone(),
            loot: &mut self.loot,
            kills: &mut self.kills,
            elite_kills: &mut self.elite_kills,
            events: &mut self.events,
            healing: &mut self.pending_healing,
            absorbs: &mut self.pending_absorb,
            now: self.clock,
            run_level: self.level,
            player,
            zone: self.zone,
            rules: self.rules,
            stats: RunPlayerStats {
                maximum_health: self.execution.vitals.maximum_health,
                ..self.stats
            },
            class_id: self.class.class_id,
            player_absorb: self.execution.vitals.absorb,
            equipped: &self.effect_state.equipped,
            meter_sources: &self.effect_state.meter_sources,
            meter_abilities: self.abilities.iter().map(|row| (row.definition, row.rank)).collect(),
            meter_racial: self.racial.map(|row| row.definition),
            meter_spells: self.recap_spells.as_deref(),
            aura_provenance: &self.effect_state.display_provenance,
            rescue_ready_at: self.effect_state.incoming.lethal_talent_ready_at,
            soul_link_absorb: &mut self.effect_state.incoming.soul_link_absorb,
            special_demons: self.demon_state.rows.len(),
            racial_cooldown: self
                .racial
                .as_ref()
                .filter(|row| row.definition.effect.tag == 11)
                .map(|row| row.remaining),
            movement_counter: &mut self.movement_counter,
            numeric: &mut self.effect_state.numeric,
            stats_recomputed: false,
            pre_stats: self.effect_state.pre_stats,
            cooperative_luck,
            base_stats: self.effect_state.base,
            base_leech: self.effect_state.base_leech,
            generic: &mut self.effect_state.generic,
            extra_cast: false,
            extra_cast_factor: extra_cast_factor,
            leech: self.effect_state.leech,
            world,
            attribution: PassiveAttribution {
                source_kind: 0,
                source_words: [0; 4],
                cast_words: [0; 4],
            },
        };
        let mut scheduler = AbilityScheduler {
            context,
            execution: &mut self.execution,
            rng: &mut self.rng,
            counter: &mut self.counter,
            port: &mut port,
            passive_context,
            passive_state: &mut self.passive_state,
            native_7e4: &mut self.native_7e4,
            published_cooldowns: &mut self.published_cooldowns,
            demon_state: &mut self.demon_state,
        };
        let cooldown = scheduler.cast_racial(
            self.racial.as_mut().expect("ready racial checked"),
            &mut self.abilities,
        );
        let refreshed = port.stats_recomputed.then_some((port.stats, port.leech));
        drop(port);
        if let Some((stats, leech)) = refreshed {
            self.accept_refreshed_stats(stats, leech);
        }
        if let Some(cooldown) = cooldown {
            self.racial_cooldown = Some(cooldown);
            true
        } else {
            self.execution.vitals.health = lethal_health;
            false
        }
    }
}

// Current14590d854..14590da6b folds raw recovery, then adds one and inverts once.
fn aura_cooldown(raw: f32, auras: &[buffs::Aura], now: f32, buff_bonus: f32) -> f32 {
    1.0 / (recovery_with_auras(raw, auras, now, buff_bonus) + 1.0)
}

fn recovery_with_auras(raw: f32, auras: &[buffs::Aura], now: f32, buff_bonus: f32) -> f32 {
    buffs::effective_auras(auras, now, buff_bonus)
        .filter(|aura| aura.effect.tag == 9)
        .fold(raw, |sum, aura| sum + aura.buff_strength(buff_bonus))
}

fn aura_movement(base: f32, auras: &[buffs::Aura], now: f32) -> f32 {
    let bonus = auras
        .iter()
        .filter(|aura| now < aura.expires_at && aura.spell_id == 23451)
        .fold(0.0, |sum, _| sum + 0.6);
    (base + bonus).min(2.2)
}

fn aura_damage(mut base: f32, auras: &[buffs::Aura], now: f32, buff_bonus: f32) -> f32 {
    //1454a7180..7204 visits each live aura in its original row order.
    for aura in buffs::effective_auras(auras, now, buff_bonus) {
        if aura.effect.tag == 8 {
            base += aura.buff_strength(buff_bonus);
        }
        if aura.spell_id == 23505 {
            base += 0.5;
        }
    }
    base
}

fn actor_targets(actors: &[RunActor], bosses: &[RunBoss],
    wards: &azeroth_survivors_re::bosses::raid_wards::WardState, current: u64) -> Vec<Target> {
    let mut rows: Vec<_> = actors.iter().map(|row| (row.allocation_order, Target {
        actor: row.actor, health: row.health, maximum_health: row.maximum_health,
        has_metadata: false, flagged: row.definition.flag_4c != 0,
        periodic_stacks: row.periodic.iter().filter(|dot| dot.owner_kind == 0 && dot.ticks_remaining > 0)
            .map(|dot| (dot.spell_id,1)).collect(),
    })).chain(bosses.iter().map(|row| (row.allocation_order,row.target())))
        .chain(wards.actors.iter().map(|row| (row.allocation_order,Target {
            actor: row.actor, health: row.health, maximum_health: row.maximum_health,
            has_metadata: false, flagged: false,
            periodic_stacks: row.periodic.iter().filter(|dot| dot.owner_kind == 0 && dot.ticks_remaining > 0)
                .map(|dot| (dot.spell_id,1)).collect(),
        }))).collect();
    rows.sort_by_key(|(order,_)| std::cmp::Reverse(current.wrapping_sub(*order)));
    rows.into_iter().map(|(_,target)| target).collect()
}

struct HostPlacementMath;
impl spawning::PlacementMath for HostPlacementMath {
    fn cos(&mut self, angle: f32) -> f32 {
        angle.cos()
    }
    fn sin(&mut self, angle: f32) -> f32 {
        angle.sin()
    }
    fn atan2(&mut self, y: f32, x: f32) -> f32 {
        y.atan2(x)
    }
    fn hypot(&mut self, x: f32, y: f32) -> f32 {
        x.hypot(y)
    }
}

struct SpawnAdapter<'a, W> {
    party_health_multiplier: f32,
    zone: &'static ZoneDefinition,
    rules: RunRules,
    phase: u32,
    endless_started_at: f32,
    now: f32,
    run_level: u32,
    player: Position,
    velocity: [f32; 2],
    actors: &'a mut Vec<RunActor>,
    live_bosses: usize,
    counter: &'a mut dyn NativeCounter,
    world: &'a mut W,
    events: &'a mut Vec<RunEvent>,
}

impl<W: RunWorld> SpawnAdapter<'_, W> {
    fn create(&mut self, index: usize, position: Option<Position>, rng: &mut NativeRng) -> u64 {
        let definition = &self.zone.enemies[index];
        let position = position.unwrap_or_else(|| {
            spawning::sample_position(
                self.zone,
                self.player,
                self.velocity,
                0.5,
                rng,
                self.world,
                &mut HostPlacementMath,
            )
        });
        let timing = scaling::initial_timing(self.now, rng);
        let stats = scaling::initial_stats_for_heroic_zone(
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
            self.zone.key,
            self.rules.heroic_rank,
        );
        let mut stats = stats;
        stats.health *= self.party_health_multiplier;
        stats.max_health *= self.party_health_multiplier;
        let (guid, allocation_order) =
            azeroth_survivors_re::native_counter::creature_guid_with_order(definition.id, self.counter);
        self.actors.push(RunActor {
            guid,
            allocation_order,
            definition,
            native_level: native_actor_level(self.run_level, definition.flag_4c),
            actor: Actor::new(guid, position, self.now, stats, timing),
            health: stats.health,
            maximum_health: stats.max_health,
            control: ControlWindow::for_enemy(definition.flag_4c != 0),
            periodic: Vec::new(),
            vulnerability: 0.0,
            vulnerability_until: 0.0,
            additional_damage_taken: 0.0,
        });
        guid
    }
}

impl<W: RunWorld> SpawnPort for SpawnAdapter<'_, W> {
    fn live_entity_count(&self) -> usize {
        self.actors.iter().filter(|row| !row.actor.dead).count() + self.live_bosses
    }
    fn live_ordinary_count(&self) -> usize {
        self.actors
            .iter()
            .filter(|row| !row.actor.dead && row.definition.flag_4c == 0)
            .count()
    }
    fn create_enemy(&mut self, index: usize, rng: &mut NativeRng) {
        self.create(index, None, rng);
    }
}

impl<W: RunWorld> WavePort for SpawnAdapter<'_, W> {
    fn enemy_position(&self, guid: u64, now: f32) -> Option<Position> {
        self.actors.iter().find(|row| row.guid == guid).map(|row| row.actor.movement.position_at(now))
    }
    fn live_entity_count(&self) -> usize {
        SpawnPort::live_entity_count(self)
    }
    fn create_enemy(
        &mut self,
        index: usize,
        position: Option<Position>,
        rng: &mut NativeRng,
    ) -> u64 {
        self.create(index, position, rng)
    }
    fn order_stampede(&mut self, guid: u64, order: StampedeOrder) {
        if let Some(row) = self.actors.iter_mut().find(|row| row.guid == guid) {
            waves::apply_stampede(&mut row.actor, order);
        }
    }
    fn announce_pattern(&mut self, pattern: Pattern, index: usize) {
        let enemy = &self.zone.enemies[index];
        self.events.push(RunEvent::Announcement(RunAnnouncement::emote(
            AnnouncementLabel::enemy(enemy.id, enemy.name), pattern.message())));
    }
    fn announce_elite(&mut self, index: usize) {
        let enemy = &self.zone.enemies[index];
        self.events.push(RunEvent::Announcement(RunAnnouncement::emote(
            AnnouncementLabel::enemy(enemy.id, enemy.name), "%s approaches!")));
    }
}

struct CombatAdapter<'a, W> {
    player_guid: u64,
    detailed_meter: &'a mut super::detailed_meter::Ledger,
    party_healing: shared_healing::Port<'a>,
    showcase: bool,
    actors: &'a mut Vec<RunActor>,
    bosses: &'a mut Vec<RunBoss>,
    pets: &'a mut [pets::Pet],
    hunter_mark: Option<u64>,
    boss_state: &'a mut bosses::BossState,
    guardian_state: &'a mut guardians::GuardianState,
    affixes: &'a mut affixes::State,
    pickups: &'a mut Vec<RunPickup>,
    object_counter: SharedCounter,
    loot: &'a mut MobLootState,
    kills: &'a mut u32,
    elite_kills: &'a mut u32,
    events: &'a mut Vec<RunEvent>,
    healing: &'a mut Vec<PendingHealing>,
    absorbs: &'a mut Vec<f32>,
    now: f32,
    run_level: u32,
    player: Position,
    zone: &'static ZoneDefinition,
    rules: RunRules,
    stats: RunPlayerStats,
    class_id: u8,
    player_absorb: f32,
    equipped: &'a azeroth_survivors_re::run_effects::Effects,
    meter_sources: &'a [azeroth_survivors_re::run_effects::healing::MeterSource],
    meter_abilities: Vec<(&'static AbilityDefinition, u32)>,
    meter_racial: Option<&'static AbilityDefinition>,
    meter_spells: Option<&'a benilla_formats::SpellCatalog>,
    aura_provenance: &'a [String],
    rescue_ready_at: f32,
    soul_link_absorb: &'a mut f32,
    special_demons: usize,
    racial_cooldown: Option<f32>,
    movement_counter: &'a mut u32,
    numeric: &'a mut azeroth_survivors_re::run_effects::Numeric,
    stats_recomputed: bool,
    pre_stats: azeroth_survivors_re::run_effects::Numeric,
    cooperative_luck: Option<f32>,
    base_stats: RunPlayerStats,
    base_leech: azeroth_survivors_re::run_effects::healing::LeechBase,
    generic: &'a mut callbacks::State,
    world: &'a mut W,
    attribution: PassiveAttribution,
    extra_cast: bool,
    extra_cast_factor: f32,
    leech: f32,
}

impl<W: RunWorld> CombatAdapter<'_, W> {
    /// Current145c27310 resolves live temporary rows at each hit. The ordinary
    /// cast stage precedes expiry compaction, so the frame's cached stat cannot
    /// decide whether an expiring leech contribution still applies.
    fn current_leech(&self) -> f32 {
        self.base_leech.total_from(
            self.generic.temporary.contributions(&self.equipped.rows, self.now),
            &self.equipped.stats,
        )
    }

    /// Current self-buff/shared-status owners call14549e650 synchronously;
    /// its diff must survive an aura removed again later in this same frame.
    fn publish_player_auras(
        &mut self,
        execution: &ExecutionState<'_>,
        learned: &[RuntimeInstance<'_>],
    ) {
        use azeroth_survivors_re::run_effects::player_auras::{
            PlayerAuraInputs, PlayerCooldownAura,
        };
        let mut cooldowns = learned
            .iter()
            .filter(|row| row.definition.effect.tag == 11)
            .map(|row| PlayerCooldownAura {
                racial: false,
                remaining: row.remaining,
            })
            .collect::<Vec<_>>();
        if let Some(remaining) = self.racial_cooldown {
            cooldowns.push(PlayerCooldownAura {
                racial: true,
                remaining,
            });
        }
        let aura_provenance = self.aura_provenance.iter()
            .map(String::as_str).collect::<Vec<_>>();
        let fields = self.generic.player_auras.publish(PlayerAuraInputs {
            now: self.now,
            auras: &execution.auras,
            effects: &self.equipped.rows,
            provenance: &aura_provenance,
            temporary: &self.generic.temporary.entries,
            absorb: execution.vitals.absorb,
            rescue_ready_at: self.rescue_ready_at,
            cooldowns: &cooldowns,
        });
        if !fields.is_empty() {
            self.events.push(RunEvent::Aura {
                target: self.player_guid,
                spell_id: 0,
                present: true,
                fields,
            });
        }
    }
    fn healing_source(
        &self,
        spell_id: u32,
    ) -> azeroth_survivors_re::run_effects::healing::MeterSource {
        if self.attribution.source_kind == 2 {
            if let Some(source) = Self::named_pet_source(self.generic.meter_pet_entry) {
                return source;
            }
        }
        azeroth_survivors_re::run_effects::healing::meter_source(
            self.attribution.source_kind,
            self.attribution.source_words,
            self.attribution.cast_words,
            self.generic.source,
            self.meter_sources,
            spell_id,
            azeroth_survivors_re::run_meter::source_definition(
                spell_id, self.meter_abilities.iter().map(|row| row.0), self.meter_racial,
            ),
        )
    }
    fn named_pet_source(
        entry: Option<u32>,
    ) -> Option<azeroth_survivors_re::run_effects::healing::MeterSource> {
        let definition = entry.and_then(azeroth_survivors_re::run_effects::pets::definition)?;
        let icon = definition.icon.filter(|icon| !icon.is_empty())?;
        Some(azeroth_survivors_re::run_effects::healing::MeterSource {
            name: definition.name,
            icon,
            talent: false,
        })
    }
    fn damage_source(
        &self,
        hit: &PendingHit,
    ) -> azeroth_survivors_re::run_effects::healing::MeterSource {
        if self.attribution.source_kind == 2 {
            if let Some(source) = Self::named_pet_source(hit.context.pet_entry) {
                return source;
            }
        }
        if self.is_resonant_damage() {
            return azeroth_survivors_re::run_effects::healing::meter_source(
                0, [0; 4], [0; 4], None, &[], hit.spell_id,
                azeroth_survivors_re::run_meter::source_definition(
                    hit.spell_id, self.meter_abilities.iter().map(|row| row.0), self.meter_racial,
                ),
            );
        }
        self.healing_source(hit.spell_id)
    }

    fn command_pet_meter_source(entry: u32, white_devilsaur: bool) -> MeterSource {
        use azeroth_survivors_re::run_effects::pets;
        let definition = pets::definition(entry).expect("recovered Kill Command pet");
        let appearance = if white_devilsaur {
            pets::white_devilsaur_appearance(definition)
        } else {
            definition
        };
        // The native icon lookup uses the granting talent for these two descriptors.
        let icon = match appearance.entry {
            9510 => "Ability_Hunter_BeastTaming",
            9511 => "Ability_Druid_FerociousBite",
            _ => appearance.icon.unwrap_or_default(),
        };
        MeterSource { name: appearance.name, icon, talent: false }
    }

    fn packlord_pet_attack(&self, hit: &PendingHit) -> Option<(u32, CapturedAttack)> {
        let [owner, high, lo, hi] = hit.context.source_words;
        if owner != 1 || high != 0 {
            return None;
        }
        let index = (u64::from(lo) | (u64::from(hi) << 32)) as usize;
        match (self.attribution.source_kind, self.equipped.rows.get(index)?.tag()) {
            (1, 62) => Some((9511, CapturedAttack::single("Bleed"))),
            (3, 63) => Some((9532, CapturedAttack::single("Shockwave"))),
            _ => None,
        }
    }

    fn hit_meter(
        &self, hit: &PendingHit, packlord_attack: Option<(u32, CapturedAttack)>,
    ) -> (MeterSource, Option<(MeterSource, String)>, Option<CapturedAttack>) {
        let captured = hit.context.meter_attack.or(self.generic.meter_attack);
        let companion = self.attribution.source_kind == 2;
        let command_attack = if companion && hit.spell_id == 883 {
            hit.context.pet_entry.filter(|entry| pets::is_command_pet(*entry)).zip(captured)
        } else {
            None
        };
        if let Some((entry, attack)) = command_attack.or(packlord_attack) {
            let source = Self::command_pet_meter_source(entry, self.generic.white_devilsaur);
            return (source, attack.source_key().map(|key| (source, key)), Some(attack));
        }
        let source = self.damage_source(hit);
        (source, self.damage_attribution(hit, source), captured.filter(|_| companion))
    }

    fn damage_shares(share: Option<DamageShare>, howl_fraction: f32, white_devilsaur: bool) -> DamageShares {
        DamageShares {
            effect: share,
            howl: (howl_fraction > 0.0).then(|| DamageShare {
                source: Self::command_pet_meter_source(9510, white_devilsaur),
                fraction: howl_fraction,
            }),
        }
    }
    fn is_resonant_damage(&self) -> bool {
        // 0x145f90dfa and 0x145fd1c02 bypass the talent descriptor for
        // Resonant Shocks while the actual combat event keeps source kind 3.
        self.attribution.source_kind == 3
            && azeroth_survivors_re::run_effects::healing::meter_effect_index(
                3, self.attribution.source_words, self.attribution.cast_words, self.generic.source,
            )
            .and_then(|index| self.equipped.rows.get(index))
            .is_some_and(|row| row.tag() == 54 && row.bytes[4] == 2)
    }

    fn effect_meter_key(&self, index: usize) -> Option<String> {
        if let Some((key, rank)) = self.equipped.meter_talents.get(index) {
            return Some(format!("talent:{key}:r{rank}"));
        }
        let row = self.equipped.rows.get(index)?;
        let after_talents = index.checked_sub(self.equipped.meter_talents.len())?;
        if let Some((class, set)) = self.equipped.meter_sets.get(after_talents) {
            // 0.141.0 145e086b0 constructs the set key. 145efd9f0 keeps it
            // for generic rows and appends the English effect slug for these three.
            let empowerment = if set.empowered { ".empowered" } else { "" };
            let effect = match row.tag() {
                66 => ":thunderburst",
                69 => ":deathmist_burn",
                70 => ":seed_of_life",
                _ => "",
            };
            return Some(format!("set:{class}.{}{empowerment}{effect}", set.tier));
        }
        let (key, picks) = self.equipped.meter_amulet?;
        Some(format!("amulet:{key}:r{picks}"))
    }

    /// Select the primary key independently of the ordinary meter's label.
    fn damage_attribution(
        &self, hit: &PendingHit, source: azeroth_survivors_re::run_effects::healing::MeterSource,
    ) -> Option<(azeroth_survivors_re::run_effects::healing::MeterSource, String)> {
        let spell = hit.spell_id;
        let resonant = self.is_resonant_damage();
        let kind = if resonant { 0 } else { self.attribution.source_kind };
        let companion = kind == 2;
        if companion {
            if let Some(key) = hit.context.meter_attack.or(self.generic.meter_attack)
                .and_then(azeroth_survivors_re::run_meter::CapturedAttack::source_key)
            {
                return Some((source, key));
            }
        }
        let effect_index = azeroth_survivors_re::run_effects::healing::meter_effect_index(
            kind,
            self.attribution.source_words,
            self.attribution.cast_words,
            self.generic.source,
        )
        .filter(|_| !resonant)
        .filter(|&index| self.meter_sources.get(index) == Some(&source));
        let effect_key = effect_index.and_then(|index| self.effect_meter_key(index));
        let sourced_cast = kind == 0
            && (self.generic.source.is_some() || self.attribution.cast_words[..2] != [0, 0]);
        // Native 145fa4313 promotes only Windfury (54/4) over the cast's
        // ability. Flametongue and Frostbrand keep the ability primary.
        let windfury = effect_index.and_then(|index| self.equipped.rows.get(index))
            .is_some_and(|row| row.tag() == 54 && row.bytes[4] == 4);
        if !sourced_cast || spell == 0 || windfury {
            if let Some(key) = effect_key {
                return Some((source, key));
            }
        }
        // The fixed descriptors are separate from provenance-bearing talents.
        let fixed_key = match (kind, spell, source.name) {
            (3, 467, "Thorns") => Some("thorns"),
            (0 | 1 | 3, 15237, "Soulstone") => Some("soulstone"),
            (3, _, "Talents") => Some("talents"),
            _ => None,
        };
        if let Some(key) = fixed_key {
            return Some((source, key.to_owned()));
        }
        if spell == 0 {
            return (companion || source.name == "Melee")
                .then(|| (source, "melee".into()));
        }
        let Some(definition) = azeroth_survivors_re::run_meter::source_definition(
            spell, self.meter_abilities.iter().map(|row| row.0), self.meter_racial,
        ) else {
            // Native 145fa36b0 uses the DBC spell when it has a display name.
            let key = effect_key.unwrap_or_else(|| {
                if self.meter_spells.and_then(|catalog| catalog.get(spell))
                    .is_some_and(|entry| !entry.name.is_empty())
                {
                    format!("spell:{spell}")
                } else {
                    "other".into()
                }
            });
            return Some((source, key));
        };
        if !companion && effect_key.is_none()
            && (source.name, source.icon) != (definition.name, definition.icon)
        {
            return None;
        }
        let mut key = format!("ability:{}", definition.key);
        if let Some((_, rank)) = self.meter_abilities.iter()
            .find(|(learned, _)| std::ptr::eq(*learned, definition))
        {
            key.push_str(&format!(":r{rank}"));
        }
        if definition.spell_id != spell {
            key.push_str(":pulse");
        }
        Some((source, key))
    }
    fn apply_queued_healing(&mut self, vitals: &mut Vitals, healing: PendingHealing) {
        let spell_id = if healing.general_owner {
            healing.context.map_or(0, |context| context.spell_id)
        } else {
            0
        };
        let result = healing.apply(vitals, &self.equipped.rows, &mut self.generic.healing, spell_id,
            self.rules.heroic_rank);
        let source = healing.meter_source.unwrap_or_else(|| {
            self.healing_source(healing.context.map_or(0, |context| context.spell_id))
        });
        self.record_detailed_self_heal(
            healing.context.map_or(0, |context| context.spell_id), source, result.actual,
            healing.meter_effect,
        );
        self.generic.healing_meter.record(source, result.actual);
        self.events.push(RunEvent::Healing {
            amount: result.actual,
            context: healing.context,
            emit_log: result.emit_log,
            fields: result.fields,
        });
    }
    fn flush_leech(&mut self, vitals: &mut Vitals) {
        let mut leech = Vec::new();
        self.healing.retain(|healing| {
            if healing.manual { leech.push(*healing); false } else { true }
        });
        for healing in leech { self.apply_queued_healing(vitals, healing); }
    }
    fn flush_vitals(&mut self, vitals: &mut Vitals) {
        for healing in std::mem::take(self.healing) { self.apply_queued_healing(vitals, healing); }
        for fraction in std::mem::take(self.absorbs) {
            vitals.absorb_effect(self.now, fraction);
        }
        self.player_absorb = vitals.absorb;
    }

    fn hit(&mut self, hit: PendingHit, rng: &mut NativeRng,
        vitals: Option<&mut Vitals>, share: Option<DamageShare>) -> Option<HitInput> {
        // 0.140.0 0x145f4333b..0x145f434c4 skips pet hits, pet-origin
        // effects and Packlord bleed before looking up the active hero's Howl.
        let packlord_attack = self.packlord_pet_attack(&hit);
        let packlord = if self.attribution.source_kind == 2 || hit.context.pet_entry.is_some()
            || packlord_attack.is_some()
        {
            0.0
        } else {
            self.generic.packlord_howl_at(hit.target_guid, self.party_healing.source_slot, self.now)
                .map_or(0.0, |howl| howl.scale)
        };
        if self.bosses.iter().any(|row| row.guid == hit.target_guid) {
            return self.hit_boss(hit, rng, vitals, packlord, packlord_attack, share);
        }
        if self.boss_state.wards.actors.iter().any(|row| row.guid == hit.target_guid) {
            return self.hit_ward(hit, rng, vitals, packlord, packlord_attack, share);
        }
        let darkmantle = self.darkmantle_bonus(hit.target_guid);
        let deathmist_kind = self.deathmist_ability_kind(hit.target_guid, hit.spell_id);
        let leech = self.current_leech();
        let secondary_source = (hit.effect.tag == 5).then(|| self.healing_source(hit.spell_id));
        let secondary_effect = secondary_source.and_then(|_| self.detailed_effect_index());
        let (meter_source, meter_attribution, meter_attack) = self.hit_meter(&hit, packlord_attack);
        let effect_stats = self.effect_stats();
        let Some(index) = self
            .actors
            .iter()
            .position(|row| row.guid == hit.target_guid)
        else {
            return None;
        };
        let row = &mut self.actors[index];
        if row.actor.dead {
            return None;
        }
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
            // DoT installation is not an extra minimum-one direct hit.
            return None;
        }
        let mut victim = row.hit_victim(
            self.guardian_state.contains(row.guid),
            self.generic.demoralizing_amplification.get(&row.guid)
                .map_or(0.0, |window| window.value_at(self.now)),
        );
        let raid_multiplier = if victim.guardian {
            self.boss_state.defenses.get(&row.guid).copied().unwrap_or_default()
                .multiplier_with_ward(self.now, self.boss_state.wards.protects(row.guid))
        } else { 1.0 };
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
            raid_multiplier,
            darkmantle,
        ) else {
            return None;
        };
        row.health = victim.health;
        let breakdown = meter_attack
            .map(|attack| attack.components(2, f64::from(result.effective)))
            .unwrap_or_default();
        let shares = Self::damage_shares(share, result.packlord_fraction, self.generic.white_devilsaur);
        self.record_detailed_damage(
            &hit, result.effective, meter_source, meter_attribution.as_ref().map(|row| row.1.as_str()),
            meter_attack, shares, None,
        );
        self.generic.damage_meters.record_with_shares(
            meter_source, hit.spell_id, result.effective, &breakdown, shares,
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
        let row = &mut self.actors[index];
        let position = row.actor.movement.position_at(self.now);
        let summary = HitInput {
            victim_guid: row.guid,
            position,
            raw_power: hit.damage,
            remaining_health: row.health,
            spell_id: hit.spell_id,
            critical: hit.critical,
        };
        // The native caller applies actor status after canonical damage;
        // a victim killed by this hit fails the shared status live-state gate.
        if !result.lethal {
            self.events.extend(self.generic.apply_actor_status(
                &mut row.actor,
                &mut row.control,
                true,
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
        if result.lethal {
            row.actor.dead = true;
            row.actor.died_at = self.now;
            *self.kills = self.kills.wrapping_add(1);
            // Current1459352c4 tests the copied Actor+15c byte for nonzero.
            if row.definition.flag_4c != 0 {
                *self.elite_kills = self.elite_kills.wrapping_add(1);
            }
            if self.stats.heal_on_kill > 0.0 {
                self.healing
                    .push(PendingHealing::on_kill(self.stats.heal_on_kill));
            }
            self.events.push(RunEvent::EnemyDied { guid: row.guid });
            if self.guardian_state.contains(row.guid) {
                let guid = row.guid;
                self.guardian_death(guid, position, rng);
                return Some(summary);
            }
            let enemy_id = row.definition.id;
            let elite = row.definition.flag_4c != 0;
            let guid = row.guid;
            self.affix_death(guid, position, elite);
            let definition = treasure_chests::ZoneDefinition::by_key(self.zone.key)
                .and_then(|zone| zone.enemy(enemy_id));
            let mut loot_world = LootAdapter {
                pickups: self.pickups,
                counter: self.object_counter.clone(),
                world: self.world,
                zone: self.zone,
                now: self.now,
                events: self.events,
            };
            self.loot.enemy_death(
                definition,
                self.rules.density_percent,
                treasure_chests::Position::new(position.x, position.y, position.z),
                rng,
                &mut loot_world,
            );
        }
        Some(summary)
    }
}

impl<W: RunWorld> ProjectilePort for CombatAdapter<'_, W> {
    fn cast_spell(&mut self, cast: SpellCast) {
        self.events.push(RunEvent::Spell(cast));
    }
}

impl<W: RunWorld> CastPort for CombatAdapter<'_, W> {
    fn execute_threshold(&self, definition: &AbilityDefinition) -> f32 {
        self.equipped.execute_threshold(definition)
    }
    fn party_needs_healing(&self) -> bool {
        self.party_healing.needs_healing(self.player)
    }
    fn share_healing(&mut self, healing: buffs::SharedHealing) {
        self.party_healing.enqueue(self.player_guid, self.player, healing);
    }
    fn share_aura(&mut self, aura: buffs::SharedAura) {
        self.party_healing.enqueue_aura(self.player_guid, self.player, aura);
    }
    fn has_special_demons(&self) -> bool { self.special_demons != 0 }
    fn command_pets(&mut self, instance: &RuntimeInstance<'_>, context: CastContext,
                    targets: &[Target]) -> bool {
        self.queue_kill_command(instance, context, targets, self.hunter_mark)
    }
    fn critical(&self) -> Critical {
        Critical {
            chance: self.stats.critical_chance,
            multiplier: self.stats.critical_multiplier,
        }
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
    fn target_health(&self, guid: u64) -> Option<(f32, f32)> {
        self.actors
            .iter()
            .find(|row| row.guid == guid && !row.actor.dead)
            .map(|row| (row.health, row.maximum_health))
            .or_else(|| {
                self.bosses
                    .iter()
                    .find(|row| row.guid == guid && !row.actor.dead)
                    .map(|row| (row.health, row.maximum_health))
            })
            .or_else(|| self.boss_state.wards.actors.iter()
                .find(|row| row.guid == guid && !row.actor.dead)
                .map(|row| (row.health,row.maximum_health)))
    }
    fn direct_hit(&mut self, hit: PendingHit, rng: &mut NativeRng) {
        self.hit(hit, rng, None, None);
    }
    fn heal(&mut self, spell: u32, amount: f32) {
        let meter_source = Some(self.healing_source(spell));
        let meter_effect = self.detailed_effect_index();
        self.healing.push(PendingHealing {
            meter_source,
            meter_effect,
            ..PendingHealing::spell(amount, spell)
        });
    }
    fn create_ground(&mut self, object: GroundObject) {
        self.events.push(RunEvent::Ground(object));
    }
    fn ground_follows(&self, definition: &AbilityDefinition) -> bool {
        self.equipped.ground_follows(definition)
    }
    fn move_ground(&mut self, target: u64, position: Position) {
        self.events.push(RunEvent::GroundMoved { target, position });
    }
    fn create_totem(&mut self, definition: &AbilityDefinition, object: SummonedObject) {
        self.note_detailed_totem(object.guid, definition);
        self.events.push(RunEvent::Totem(object));
    }
    fn remove_object(&mut self, guid: u64) {
        self.detailed_meter.despawn_actor(guid);
        self.events.push(RunEvent::RemoveObject(guid));
    }
    fn finish_buff(&mut self, spell: u32, actions: BuffActions) {
        if let Some(amount) = actions.immediate_heal {
            self.heal(spell, amount);
        }
    }
}

impl<W: RunWorld> PassivePort for CombatAdapter<'_, W> {
    fn heroic_rank(&self) -> u8 { self.rules.heroic_rank }
    fn targets(&self) -> Vec<Target> {
        actor_targets(self.actors, self.bosses, &self.boss_state.wards, self.object_counter.sequence())
    }
    fn attribution(&self) -> PassiveAttribution {
        self.attribution
    }
    fn set_attribution(&mut self, attribution: PassiveAttribution) {
        self.attribution = attribution;
    }
    fn passive_hit(&mut self, hit: PassiveHit, rng: &mut NativeRng) {
        self.hit(
            PendingHit {
                context: HitContext {
                    hostile_origin: None,
                    source_words: self.attribution.source_words,
                    captured_source_kind: None,
                    pet_entry: None,
                    meter_attack: None,
                    demon_spell_impact: None,
                    cast_words: self.attribution.cast_words,
                    overcast: false,
                    proc_source: self.generic.source,
                    suppress_damage_log: false,
                    effect_critical_procs: false,
                    meter_periodic: false,
                    meter_reflected: false,
                    meter_actor: None,
                },
                target_guid: hit.target_guid,
                source_guid: self.player_guid,
                effect: player_abilities::StatusEffect {
                    tag: 0,
                    value: 0.0,
                    duration: 0.0,
                },
                resolves_at: self.now,
                spell_id: hit.spell_id,
                damage: hit.damage,
                critical: hit.critical,
                damages_player: false,
                school: hit.school,
            },
            rng,
            None,
            None,
        );
    }
    fn emit_passive_started(&mut self, _: PassiveStarted) {}
    fn emit_healing(&mut self, action: HealingAction) {
        if action.record_in_meter {
            let effect = match action.source {
                behavior::totem_passives::HealingSource::Talent { .. } => self
                    .equipped
                    .rows
                    .iter()
                    .position(|row| row.tag() == 22),
                behavior::totem_passives::HealingSource::Leech => None,
            };
            let source = effect.and_then(|index| self.meter_sources.get(index)).copied()
                .unwrap_or(azeroth_survivors_re::run_effects::healing::LEECH);
            self.generic.healing_meter.record(source, action.actual);
            self.record_detailed_self_heal(0, source, action.actual, effect);
        }
        self.events.push(RunEvent::Healing {
            amount: action.actual,
            context: None,
            emit_log: false,
            fields: [(22, action.health_field), (28, action.maximum_health_field)],
        });
    }
}

struct LootAdapter<'a, W> {
    pickups: &'a mut Vec<RunPickup>,
    counter: SharedCounter,
    world: &'a mut W,
    zone: &'static ZoneDefinition,
    now: f32,
    events: &'a mut Vec<RunEvent>,
}
fn pickup_identity(drop: PickupDrop, counter: &mut dyn NativeCounter) -> u64 {
    match drop {
        PickupDrop::Experience { .. } => {
            azeroth_survivors_re::native_counter::creature_guid(9001, counter)
        }
        PickupDrop::Gold { .. } => {
            azeroth_survivors_re::native_counter::gameobject_guid(9004, counter)
        }
        PickupDrop::Cache { .. } => {
            azeroth_survivors_re::native_counter::gameobject_guid(9005, counter)
        }
        PickupDrop::Rune { rune, .. } => azeroth_survivors_re::native_counter::gameobject_guid(rune.descriptor().0, counter),
        PickupDrop::Magnet { .. } => azeroth_survivors_re::native_counter::gameobject_guid(9009, counter),
    }
}
impl<W: RunWorld> MobLootWorld for LootAdapter<'_, W> {
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

struct AbilityScheduler<'a, 'b, W> {
    context: CastContext,
    execution: &'a mut ExecutionState<'static>,
    rng: &'a mut NativeRng,
    counter: &'a mut dyn NativeCounter,
    port: &'a mut CombatAdapter<'b, W>,
    passive_context: behavior::passive_tick::TickContext,
    passive_state: &'a mut PassiveTickState,
    native_7e4: &'a mut u32,
    published_cooldowns: &'a mut Vec<(u32, RunCooldown)>,
    demon_state: &'a mut demons::State,
}
impl<W: RunWorld> AbilityScheduler<'_, '_, W> {
    fn tick_timed(
        &mut self,
        timed: &mut [azeroth_survivors_re::run_effects::actions::TimedCast],
        learned: &mut [RuntimeInstance<'_>],
        delta: f32,
    ) {
        use azeroth_survivors_re::run_effects::actions;
        use behavior::SchedulerPort;
        for row in timed {
            if !row.elapse(delta) {
                continue;
            }
            let mut snapshot = actions::free_instance(row.key, learned, self.port.equipped)
                .expect("current native timed definition");
            //1454b0fbe replaces the free instance's timer before actual dispatch.
            snapshot.remaining = row.remaining;
            let global_before = aura_cooldown(
                self.port.numeric.recovery,
                &self.execution.auras,
                self.context.now,
                self.port.numeric.buff_bonus,
            );
            let fallback = actions::timed_fallback(&snapshot, global_before);
            let success = self.cast(learned, snapshot);
            let global_after = aura_cooldown(
                self.port.numeric.recovery,
                &self.execution.auras,
                self.context.now,
                self.port.numeric.buff_bonus,
            );
            row.complete_after_cast(success, fallback, global_after);
            if success {
                // No echo count, cooldown packet or talent attribution is added.
                self.publish_cast_event(learned, snapshot);
            }
        }
    }

    fn tick_racial(
        &mut self,
        racial: &mut RuntimeInstance<'_>,
        learned: &mut [RuntimeInstance<'_>],
        delta: f32,
    ) -> Option<RunCooldown> {
        racial.remaining -= delta;
        // Native UCOMISS/JB skips both positive and unordered values.
        if !(racial.remaining <= 0.0) {
            return None;
        }
        let cooldown = self.cast_racial(racial, learned);
        if cooldown.is_none() {
            racial.remaining = 0.5;
        }
        cooldown
    }

    fn cast_racial(
        &mut self,
        racial: &mut RuntimeInstance<'_>,
        learned: &mut [RuntimeInstance<'_>],
    ) -> Option<RunCooldown> {
        use behavior::SchedulerPort;
        self.port.racial_cooldown =
            (racial.definition.effect.tag == 11).then_some(racial.remaining);
        if !self.cast(learned, *racial) {
            return None;
        }
        let global = aura_cooldown(
            self.port.numeric.recovery,
            &self.execution.auras,
            self.context.now,
            self.context.shield_bonus,
        );
        let duration = racial_interval(racial, global);
        racial.remaining = duration;
        self.port.racial_cooldown = (racial.definition.effect.tag == 11).then_some(duration);
        self.publish_cast_event(learned, *racial);
        Some(RunCooldown::published(self.context.now, duration))
    }

    fn publish_cast_event(
        &mut self,
        learned: &mut [RuntimeInstance<'_>],
        snapshot: RuntimeInstance<'_>,
    ) {
        if self.port.generic.depth != 0 || self.port.equipped.rows.is_empty() {
            return;
        }
        let mut context = self.port.current_context(self.context, self.execution);
        context.power.damage_multiplier = aura_damage(
            self.port.numeric.damage,
            &self.execution.auras,
            context.now,
            context.shield_bonus,
        );
        context.power.maximum_health = self.execution.vitals.maximum_health;
        let mut passive_context = self.passive_context;
        passive_context.power = context.power;
        passive_context.global_cooldown = aura_cooldown(
            self.port.numeric.recovery,
            &self.execution.auras,
            context.now,
            context.shield_bonus,
        );
        let mut passive = passives::PassiveCombat {
            core: self.port,
            learned,
            state: self.passive_state,
            context: passive_context,
            cast_context: context,
            first_periodic: false,
            native_7e4: self.native_7e4,
            object_counter: None,
            native_30: false,
        };
        //1454b0680..06c1 ordinary success and1454b1087..10c7 racial success.
        passive.generic_event_with_demons(
            azeroth_survivors_re::run_effects::conditions::Event {
                spell_id: snapshot.definition.spell_id,
                school: snapshot.definition.school,
                kind: 3,
                ..Default::default()
            },
            0.0,
            0,
            None,
            self.execution,
            self.rng,
            self.counter,
            Some(self.demon_state),
        );
    }
}
impl<W: RunWorld> behavior::SchedulerPort for AbilityScheduler<'_, '_, W> {
    fn cooldown_elapsed(&self, instance: &RuntimeInstance<'_>, delta: f32) -> f32 {
        enhancement::cooldown_elapsed(
            &self.port.equipped.rows, &self.execution.auras, self.context.now,
            instance.definition.key, delta,
        )
    }
    fn cast(&mut self, learned: &mut [RuntimeInstance<'_>], snapshot: RuntimeInstance<'_>) -> bool {
        // Definitions in this module originate solely from the static catalog.
        let Some(definition) = AbilityDefinition::by_key(snapshot.definition.key) else {
            return false;
        };
        let snapshot = RuntimeInstance {
            definition,
            ..snapshot
        };
        let mut context = self.port.current_context(self.context, self.execution);
        context.hit_context.overcast = self.port.extra_cast;
        context.power.damage_multiplier = aura_damage(
            self.port.numeric.damage,
            &self.execution.auras,
            context.now,
            context.shield_bonus,
        );
        let mut passive_context = self.passive_context;
        passive_context.power = context.power;
        passive_context.global_cooldown = aura_cooldown(
            self.port.numeric.recovery,
            &self.execution.auras,
            context.now,
            context.shield_bonus,
        );
        let targets = actor_targets(self.port.actors, self.port.bosses, &self.port.boss_state.wards, self.port.object_counter.sequence());
        let mut passive = passives::PassiveCombat {
            core: self.port,
            learned,
            state: self.passive_state,
            context: passive_context,
            cast_context: context,
            first_periodic: false,
            native_7e4: self.native_7e4,
            object_counter: None,
            native_30: false,
        };
        let success = passive.cast_with_enhancement(
            &snapshot,
            context,
            &targets,
            self.execution,
            self.rng,
            self.counter,
        );
        passive.core.flush_vitals(&mut self.execution.vitals);
        success
    }
    fn cooldown(&self, instance: &RuntimeInstance<'_>) -> f32 {
        damage::cooldown(
            instance,
            aura_cooldown(
                self.port.numeric.recovery,
                &self.execution.auras,
                self.context.now,
                self.context.shield_bonus,
            ),
        )
    }
    fn after_success(
        &mut self,
        learned: &mut [RuntimeInstance<'_>],
        snapshot: RuntimeInstance<'_>,
    ) {
        self.publish_cast_event(learned, snapshot);
        //1454b06cf..0958 finishes all count/RNG draws before issuing echoes.
        let factor = self.port.equipped.sum(13) + self.port.extra_cast_factor;
        let count =
            behavior::extra_cast_count(factor, self.port.equipped.extra_attempts(), self.rng);
        self.port.extra_cast = true;
        for _ in 0..count {
            self.cast(learned, snapshot);
        }
        self.port.extra_cast = false;
    }
    fn publish_cooldown(&mut self, spell_id: u32, remaining: f32) {
        let key = AbilityDefinition::by_spell_id(spell_id).map_or("", |definition| definition.key);
        let remaining = enhancement::cooldown_wall_time(
            &self.port.equipped.rows, &self.execution.auras, self.context.now, key, remaining,
        );
        let cooldown = RunCooldown::published(self.context.now, remaining);
        if let Some((_, previous)) = self
            .published_cooldowns
            .iter_mut()
            .find(|(id, _)| *id == spell_id)
        {
            *previous = cooldown;
        } else {
            self.published_cooldowns.push((spell_id, cooldown));
        }
    }
}

#[cfg(test)]
mod rng_integration {
    use super::*;
    #[derive(Clone)]
    pub(super) struct TerrainFixture;
    impl Terrain for TerrainFixture {
        fn height(&mut self, _: [f32; 2]) -> Option<f32> {
            Some(0.0)
        }
        fn secondary_height(&mut self, _: [f32; 2]) -> Option<f32> {
            None
        }
        fn fallback_height(&self) -> f32 {
            0.0
        }
        fn blocked_grid(&self) -> Option<spawning::BlockedGrid<'_>> {
            None
        }
        fn path_grid(&self) -> Option<spawning::PathGrid<'_>> {
            None
        }
    }
    impl ai::World for TerrainFixture {
        fn ray_fraction(&self, _: Position, _: Position) -> Option<f32> {
            None
        }
        fn chase_path(&self, _: Position, _: Position, _: f32) -> Option<[f32; 2]> {
            None
        }
    }
    impl azeroth_survivors_re::guardians::placement::LairTerrain for TerrainFixture {
        fn adt_height(&self, _: f32, _: f32) -> Option<f32> {
            Some(0.0)
        }
        fn wmo_height(&self, _: f32, _: f32) -> Option<f32> {
            None
        }
        fn fallback_height(&self) -> f32 {
            0.0
        }
        fn blocked_at(&self, _: f32, _: f32) -> bool {
            false
        }
    }

    fn racial_run(race: u8) -> Mechanics {
        class_run("warrior", race)
    }

    pub(super) fn class_run(class: &str, race: u8) -> Mechanics {
        let mut game = Mechanics::new(
            "elwynn",
            class,
            RunRules { heroic_rank: 0,
                difficulty: 1.0,
                density_percent: 100,
                hp_percent: 100,
                damage_percent: 100,
                speed_percent: 100,
                endless: false,
            },
            RunPlayerStats {
                maximum_health: 100.0,
                health_per_level: 9.0,
                health_multiplier: 1.0,
                regeneration: 0.0,
                pickup_radius: 9.0,
                luck_bonus: 0.0,
                heal_on_kill: 0.0,
                armor_fraction: 0.0,
                damage_reduction: 0.0,
                damage_multiplier: 1.0,
                cooldown_multiplier: 1.0,
                critical_chance: 0.0,
                critical_multiplier: 2.0,
                experience_multiplier: 1.0,
                gold_multiplier: 1.0,
                native_race: race,
                packed_player_field: u32::from_le_bytes([race, 1, 0, 0]),
            },
            [1, 2, 3, 4],
        )
        .unwrap();
        // These shared fixtures isolate the spell/schedule owners. Friendly
        // attack integration tests explicitly re-enable the native stages.
        game.weapon_state.remaining = f32::INFINITY;
        game.pet_state.started = true;
        game.boundary_started = true;
        game.pickup_state = pickup_effects::State::isolated();
        game
    }

    pub(super) fn fixture_enemies(
        game: &mut Mechanics,
        distances: &[f32],
        terrain: &mut TerrainFixture,
    ) {
        let player = game.zone.center.into();
        let mut spawn = SpawnAdapter {
            party_health_multiplier: game.party_health_factors()[0],
            zone: game.zone,
            rules: game.rules,
            phase: game.boss_state.phase(),
            endless_started_at: game.boss_state.endless_started_at(),
            now: game.clock,
            run_level: game.level,
            player,
            velocity: [0.0; 2],
            actors: &mut game.actors,
            live_bosses: 0,
            counter: &mut game.counter,
            world: terrain,
            events: &mut game.events,
        };
        for distance in distances {
            spawn.create(
                0,
                Some(Position {
                    x: player.x + distance,
                    ..player
                }),
                &mut game.rng,
            );
        }
    }

    fn fixture_hit(game: &mut Mechanics, guid: u64, damage: f32) {
        game.execution.pending.0.push(PendingHit {
            context: HitContext::default(),
            target_guid: guid,
            source_guid: 1,
            effect: player_abilities::StatusEffect {
                tag: 0,
                value: 0.0,
                duration: 0.0,
            },
            resolves_at: game.clock,
            spell_id: 585,
            damage,
            critical: false,
            damages_player: false,
            school: 1,
        });
    }

    #[test]
    fn mage_leech_heals_full_overkill_for_each_damage_source_and_withering() {
        for rank in [0, 5] {
            for kind in 0..4 {
                let mut game = class_run("mage", 0);
                game.rules.heroic_rank = rank;
                game.configure_effects(&[], &[]);
                game.abilities.clear();
                game.racial = None;
                game.execution.vitals.health = 50.0;
                fixture_enemies(&mut game, &[3.0], &mut TerrainFixture);
                game.actors[0].health = 1.0;
                game.actors[0].maximum_health = 1.0;
                game.actors[0].actor.attack_delay = 100.0;
                let guid = game.actors[0].guid;
                fixture_hit(&mut game, guid, 200.0);
                game.execution.pending.0.last_mut().unwrap().context.captured_source_kind = Some(kind);
                let player = game.zone.center.into();
                game.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
                let expected = if rank == 5 { 0.5 } else { 1.0 };
                assert_eq!(game.health(), 50.0 + expected, "rank{rank}/source{kind}");
                let leech = game.healing_meter().iter().find(|row|
                    row.source == azeroth_survivors_re::run_effects::healing::LEECH).unwrap();
                assert_eq!(leech.total, f64::from(expected));
                assert_eq!(game.effective_damage(), 1.0, "damage meter still caps overkill");
                let healed = game.events.iter().position(|event|
                    matches!(event, RunEvent::Healing { amount, context: None, .. } if *amount == expected)).unwrap();
                let died = game.events.iter().position(|event|
                    matches!(event, RunEvent::EnemyDied { guid: dead } if *dead == guid)).unwrap();
                assert!(healed < died, "the hit heals before its death/loot tail");
            }
        }
    }

    #[test]
    fn mage_periodic_ticks_consume_the_class_leech_once_without_an_installation_hit() {
        let mut game = class_run("mage", 0);
        game.configure_effects(&[], &[]);
        game.abilities.clear();
        game.racial = None;
        game.execution.vitals.health = 50.0;
        fixture_enemies(&mut game, &[3.0], &mut TerrainFixture);
        game.actors[0].health = 1000.0;
        game.actors[0].maximum_health = 1000.0;
        game.actors[0].actor.attack_delay = 100.0;
        game.actors[0].periodic.push(periodic::ActorPeriodic {
            owner_kind: 0, owner_guid: game.player_guid, effect_owner: None, meter_actor: None, spell_id: 1449,
            power_per_tick: 200.0, interval: 2.0, next_tick_at: 0.0,
            ticks_remaining: 1, initial_ticks: 1, leech_fraction: 0.0, school: 6,
        });
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert_eq!(game.health(), 51.0);
        assert_eq!(game.actors[0].health, 800.0);
        let leech = game.healing_meter().iter().find(|row|
            row.source == azeroth_survivors_re::run_effects::healing::LEECH).unwrap();
        assert_eq!(leech.total, 1.0);
    }

    #[test]
    fn ordinary_hit_excludes_expired_leech_before_the_later_stat_compaction() {
        use azeroth_survivors_re::{loot_rewards::amulets, run_effects::EffectRow};
        let mut game = class_run("priest", 0);
        game.configure_effects(&[], &[]);
        let row = amulets::catalog().by_key("legendary:renew").unwrap().effects.iter()
            .find(|row| row.raw_hex.starts_with("0f")).unwrap();
        game.effect_state.equipped.talents.push(EffectRow::amulet(row, 1.0));
        game.effect_state.talent_provenance.resize(
            game.effect_state.equipped.generic_talent_count(), "");
        game.refresh_effects();
        let base = game.effect_state.leech;
        let index = game.effect_state.equipped.rows.iter()
            .position(|row| row.tag() == 15 && row.bytes[1] == 14).unwrap();
        let row = &game.effect_state.equipped.rows[index];
        game.effect_state.generic.temporary.activate(index, row, 0.0);
        let expiry = row.float(12);
        game.clock = expiry - 0.01;
        game.effect_state.leech = base + row.float(4);
        let mut smite = RuntimeInstance::learned(AbilityDefinition::by_key("smite").unwrap());
        smite.remaining = 0.0;
        game.abilities = vec![smite];
        game.racial = None;
        game.execution.vitals.health = 50.0;
        fixture_enemies(&mut game, &[3.0], &mut TerrainFixture);
        game.actors[0].health = 10000.0;
        game.actors[0].maximum_health = 10000.0;
        game.actors[0].actor.attack_delay = 100.0;
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
        let damage: f32 = game.events.iter().filter_map(|event| match event {
            RunEvent::Damage { amount, .. } => Some(*amount), _ => None,
        }).sum();
        assert!(damage > 0.0);
        assert_eq!(game.clock, expiry);
        let leech = game.healing_meter().iter()
            .find(|row| row.source == azeroth_survivors_re::run_effects::healing::LEECH)
            .map_or(0.0, |row| row.total);
        assert_eq!(leech, f64::from(damage * base));
        assert!(game.effect_state.generic.temporary.entries.is_empty());
    }

    #[test]
    fn mage_leech_reaches_health_gated_freecasts_before_they_are_admitted() {
        use azeroth_survivors_re::{loot_rewards::amulets::EffectString, run_effects::EffectRow};
        let mut game = class_run("mage", 0);
        game.configure_effects(&[], &[]);
        let strings = Box::leak(Box::new([EffectString { offset: 16, value: "holy_light".into() }]));
        let mut freecast = EffectRow { bytes: [0; 64], strings, lists: &[] };
        freecast.bytes[4..8].copy_from_slice(&1.0_f32.to_le_bytes());
        game.effect_state.equipped.talents.push(freecast);
        game.effect_state.talent_provenance.resize(game.effect_state.equipped.generic_talent_count(), "");
        game.refresh_effects();
        game.abilities.clear();
        game.racial = None;
        game.execution.vitals.health = game.max_health() * 0.85 - 0.1;
        fixture_enemies(&mut game, &[3.0], &mut TerrainFixture);
        game.actors[0].health = 1000.0;
        game.actors[0].maximum_health = 1000.0;
        game.actors[0].actor.attack_delay = 100.0;
        let guid = game.actors[0].guid;
        fixture_hit(&mut game, guid, 200.0);
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert!(game.health() > game.max_health() * 0.85);
        let heal_spell = AbilityDefinition::by_key("holy_light").unwrap().spell_id;
        assert!(!game.events.iter().any(|event|
            matches!(event, RunEvent::Spell(cast) if cast.spell_id == heal_spell)),
            "post-hit leech closes the high-health heal gate before the freecast");
    }

    #[test]
    fn deferred_demon_damage_retains_descriptor_and_attack_after_army_expiry() {
        let mut game = class_run("warlock", 0);
        game.abilities[0].remaining = f32::INFINITY;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0], &mut terrain);
        let target = game.actors[0].guid;
        game.actors[0].health = 7.0;
        game.actors[0].actor.attack_delay = 100.0;
        fixture_hit(&mut game, target, 100.0);
        let hit = game.execution.pending.0.last_mut().unwrap();
        hit.source_guid = 999;
        hit.spell_id = 686;
        hit.school = 5;
        hit.context.captured_source_kind = Some(2);
        hit.context.pet_entry = Some(9522);
        hit.context.meter_attack = Some(azeroth_survivors_re::run_meter::CapturedAttack {
            primary: "Shadow Bolt", secondary: Some("Doom Bringer"),
            bonus_bits: 1.0_f32.to_bits(), suppressed: false,
        });
        // No live demon is required when its captured projectile arrives.
        assert!(game.demon_state.rows.is_empty());
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        let row = game.damage_meter().iter().find(|row| row.source.name == "Doomguard").unwrap();
        assert_eq!(row.total, 7.0);
        assert_eq!(row.breakdown.iter().map(|row| row.total).sum::<f64>(), 7.0);
        assert_eq!(row.breakdown.iter().find(|row| row.name == "Doom Bringer").unwrap().total, 3.5);
        assert_eq!(game.spell_damage(686), 7.0);
        assert_eq!(game.effective_damage(), 7.0);
        assert!(game.events.iter().any(|event| matches!(
            event,
            RunEvent::Damage {
                target: hit_target, meter_attribution: Some((source, key)), ..
            } if *hit_target == target && source.name == "Doomguard" && key == "demon:shadow_bolt"
        )));
    }

    #[test]
    fn live_soul_link_credit_follows_reserved_shield_and_is_not_double_absorption() {
        let mut game = class_run("warlock", 0);
        let mut terrain = TerrainFixture;
        game.execution.vitals.absorb = 25.0;
        game.execution.shield.spell_id = 17;
        game.execution.shield.amount = 10.0;
        game.effect_state.incoming.soul_link_absorb = 15.0;
        let before = game.execution.vitals.health;
        let player = game.zone.center.into();
        game.damage_player(18.0, false, 0, player, 0.0, &mut terrain);
        assert_eq!(game.execution.vitals.health, before);
        assert_eq!(game.execution.vitals.absorb, 7.0);
        assert_eq!(game.effect_state.incoming.soul_link_absorb, 7.0);
        assert_eq!(game.healing_meter().iter().find(|row| row.source.name == "Soul Link").unwrap().total, 8.0);
        game.damage_player(12.0, false, 0, player, 0.0, &mut terrain);
        assert_eq!(game.execution.vitals.health, before - 5.0);
        assert_eq!(game.effect_state.incoming.soul_link_absorb, 0.0);
        assert_eq!(game.healing_meter().iter().find(|row| row.source.name == "Soul Link").unwrap().total, 15.0);
    }

    #[test]
    fn effective_damage_caps_direct_and_periodic_overkill_at_the_health_mutation() {
        let mut game = class_run("priest", 0);
        game.abilities[0].remaining = f32::INFINITY;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0, 4.0], &mut terrain);
        game.actors[0].health = 7.0;
        game.actors[1].health = 5.0;
        for row in &mut game.actors {
            row.actor.attack_delay = 100.0;
        }
        let direct = game.actors[0].guid;
        let periodic = game.actors[1].guid;
        fixture_hit(&mut game, direct, 100.0);
        game.actors[1].periodic.push(periodic::ActorPeriodic {
            owner_kind: 0,
            owner_guid: 1,
            effect_owner: None,
            meter_actor: None,
            spell_id: 589,
            power_per_tick: 100.0,
            interval: 2.0,
            next_tick_at: 0.0,
            ticks_remaining: 1,
            initial_ticks: 1,
            leech_fraction: 0.0,
            school: 5,
        });
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.effective_damage(), 12.0);
        assert!(game.events.iter().any(|event| matches!(event,
            RunEvent::PeriodicDamage {target, amount, ..}
                if *target == periodic && *amount == 100.0)));
        // The periodic log and full overkill events must not become extra credits.
        fixture_hit(&mut game, direct, 100.0);
        fixture_hit(&mut game, periodic, 100.0);
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.effective_damage(), 12.0);
        assert_eq!(class_run("priest", 0).effective_damage(), 0.0);
    }

    #[test]
    fn effective_damage_uses_the_same_total_for_primary_boss_hits() {
        let mut game = class_run("priest", 0);
        game.abilities[0].remaining = f32::INFINITY;
        let mut terrain = TerrainFixture;
        let player = game.zone.center.into();
        let zone = azeroth_survivors_re::bosses::catalog::ZONES
            .iter()
            .find(|zone| zone.key == game.zone.key)
            .unwrap();
        game.clock = zone.bosses[0].time_minutes * 60.0;
        game.spawn_due_bosses(player, [0.0; 2], &mut terrain);
        assert_eq!(game.bosses.len(), 1);
        game.bosses[0].health = 11.0;
        let guid = game.bosses[0].guid;
        fixture_hit(&mut game, guid, 100.0);
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.effective_damage(), 11.0);
        assert!(game.bosses.iter().any(|boss| boss.guid == guid && boss.actor.dead));
        assert_eq!(game.elite_kills(), 1, "the primary boss carries Actor+15c=1");
    }

    #[test]
    fn terminal_elite_counter_counts_only_first_death_of_flagged_actors() {
        let mut game = class_run("priest", 0);
        game.abilities[0].remaining = f32::INFINITY;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0, 4.0], &mut terrain);
        game.actors[1].definition = game.zone.enemies.iter()
            .find(|definition| definition.flag_4c != 0)
            .unwrap();
        let victims = [game.actors[0].guid, game.actors[1].guid];
        for row in &mut game.actors {
            row.health = 1.0;
            row.actor.attack_delay = 100.0;
        }
        for guid in victims {
            fixture_hit(&mut game, guid, 100.0);
        }
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.kills, 2);
        assert_eq!(game.elite_kills(), 1);
        game.mark_run_result_saved();
        for guid in victims {
            fixture_hit(&mut game, guid, 100.0);
        }
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.elite_kills(), 1);
        assert_eq!(class_run("priest", 0).elite_kills(), 0);
    }

    #[test]
    fn new_normal_spawns_wait_until_after_this_frames_actor_update() {
        let mut game = class_run("priest", 0);
        game.abilities[0].remaining = 100.0;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0], &mut terrain);
        let existing = game.actors[0].guid;
        game.actors[0].actor.attack_delay = 100.0;
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert!(
            game.actors.len() > 1,
            "native normal spawn budget must create new actors"
        );
        assert_eq!(
            game.actors
                .iter()
                .find(|row| row.guid == existing)
                .unwrap()
                .actor
                .attack_delay,
            100.0 - 0.01
        );
        for row in game.actors.iter().filter(|row| row.guid != existing) {
            assert_eq!(
                row.actor.attack_delay,
                0.5 * row.definition.raw_38,
                "new native world actors do not lose an attack delta before their first actor update"
            );
        }
    }

    #[test]
    fn rampage_counts_real_deaths_preserves_refresh_and_freecasts_on_the_seventh() {
        let mut game = class_run("warrior", 0);
        game.configure_effects(&[("rampage".into(), 1)], &[]);
        game.abilities[0].remaining = 100.0;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0; 8], &mut terrain);
        let victims = game.actors[..7]
            .iter()
            .map(|row| row.guid)
            .collect::<Vec<_>>();
        let survivor = game.actors[7].guid;
        for row in &mut game.actors {
            row.health = 10000.0;
            row.maximum_health = 10000.0;
            row.actor.attack_delay = 100.0;
        }
        let index = game
            .effect_state
            .equipped
            .rows
            .iter()
            .position(|row| row.tag() == 1)
            .unwrap();
        let whirlwind = AbilityDefinition::by_key("whirlwind").unwrap().spell_id;
        let player = game.zone.center.into();
        for (number, guid) in victims.into_iter().enumerate() {
            fixture_hit(&mut game, guid, 10001.0);
            game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
            let count = game
                .events
                .iter()
                .filter(|event| {
                    matches!(event,
                RunEvent::Spell(cast) if cast.spell_id==whirlwind)
                })
                .count();
            assert_eq!(count, usize::from(number == 6));
            assert_eq!(
                game.effect_state.generic.counters[index],
                if number == 6 { 0 } else { number as u32 + 1 }
            );
            if number == 2 {
                game.refresh_effects();
                assert_eq!(game.effect_state.generic.counters[index], 3);
            }
        }
        assert!(game.events.iter().any(|event| matches!(event,
            RunEvent::Damage{target,spell_id,amount,..}
                if *target==survivor && *spell_id==whirlwind && *amount>0.0)));
        assert_eq!(
            game.abilities.len(),
            1,
            "milestone freecasts do not learn a duplicate spell"
        );
        assert_eq!(game.effect_state.generic.depth, 0);
        assert_eq!(game.effect_state.generic.source, None);
    }

    #[test]
    fn hot_streak_retains_a_rate_rejected_trigger_and_consumes_only_the_first_critical() {
        let mut game = class_run("mage", 0);
        game.configure_effects(&[("hot_streak".into(), 1)], &[]);
        game.abilities[0].remaining = 100.0;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0], &mut terrain);
        let guid = game.actors[0].guid;
        game.actors[0].health = 10000.0;
        game.actors[0].maximum_health = 10000.0;
        game.actors[0].actor.attack_delay = 100.0;
        let index = game
            .effect_state
            .equipped
            .rows
            .iter()
            .position(|row| row.tag() == 1)
            .unwrap();
        game.clock = 10.0;
        game.effect_state.generic.counters[index] = 3;
        game.effect_state.generic.timestamps[index] = vec![9.8, 9.9];
        let fireball = AbilityDefinition::by_key("fireball").unwrap().spell_id;
        let pyroblast = AbilityDefinition::by_key("pyroblast").unwrap().spell_id;
        let queue_critical = |game: &mut Mechanics, token: bool| {
            fixture_hit(game, guid, 1.0);
            let hit = game.execution.pending.0.last_mut().unwrap();
            hit.spell_id = fireball;
            hit.school = 2;
            hit.critical = true;
            // The pending hit follows a cast that inserted its native token.
            if token {
                game.effect_state.generic.first_criticals.push(fireball);
            }
        };
        queue_critical(&mut game, true);
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.effect_state.generic.counters[index], 4);
        assert!(!game.events.iter().any(|event| matches!(event,
            RunEvent::Spell(cast) if cast.spell_id==pyroblast)));
        game.refresh_effects();
        assert_eq!(game.effect_state.generic.counters[index], 4);
        // A second critical victim from that same cast has no remaining token.
        queue_critical(&mut game, false);
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.effect_state.generic.counters[index], 4);
        game.clock = 11.0;
        queue_critical(&mut game, true);
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.effect_state.generic.counters[index], 0);
        assert_eq!(
            game.events
                .iter()
                .filter(|event| matches!(event,
            RunEvent::Spell(cast) if cast.spell_id==pyroblast))
                .count(),
            1
        );
        assert_eq!(
            game.effect_state.generic.timestamps[index],
            vec![game.clock]
        );
    }

    #[test]
    fn shadow_dance_replaces_the_starter_and_refresh_keeps_its_live_instance() {
        let mut baseline = class_run("rogue", 0);
        baseline.configure_effects(&[("shadow_dance".into(), 0)], &[]);
        assert_eq!(baseline.abilities.len(), 1);
        assert_eq!(baseline.abilities[0].definition.key, "sinister_strike");
        let mut game = class_run("rogue", 0);
        game.configure_effects(&[("shadow_dance".into(), 1)], &[]);
        assert_eq!(
            game.abilities.len(),
            1,
            "replacement consumes the starter slot"
        );
        assert_eq!(game.abilities[0].definition.key, "backstab");
        assert!(
            !game
                .abilities
                .iter()
                .any(|row| row.definition.key == "sinister_strike")
        );
        assert_eq!(game.effect_state.equipped.talents[0].tag(), 28);
        assert_eq!(game.effect_state.equipped.talents[1].tag(), 4);
        game.abilities[0].remaining = 7.25;
        game.refresh_effects();
        assert_eq!(game.abilities.len(), 1);
        assert_eq!(game.abilities[0].definition.key, "backstab");
        assert_eq!(game.abilities[0].remaining, 7.25);
    }

    #[test]
    fn shadow_weaving_converts_live_maximum_health_with_original_metadata_and_no_extra_rng() {
        let prepare = |enabled| {
            let mut game = class_run("priest", 0);
            if enabled {
                game.configure_effects(&[("shadow_weaving".into(), 1)], &[]);
            }
            game.abilities[0].remaining = 100.0;
            game.effect_state.numeric.damage = 9.0;
            game.stats.damage_multiplier = 9.0;
            fixture_enemies(&mut game, &[3.0], &mut TerrainFixture);
            game.actors[0].health = 10000.0;
            game.actors[0].maximum_health = 10000.0;
            game.actors[0].actor.attack_delay = 100.0;
            let guid = game.actors[0].guid;
            fixture_hit(&mut game, guid, 1.0);
            let hit = game.execution.pending.0.last_mut().unwrap();
            hit.spell_id = 589;
            hit.school = 5;
            game
        };
        let mut baseline = prepare(false);
        let mut enhanced = prepare(true);
        let player = baseline.zone.center.into();
        baseline.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
        enhanced.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert_eq!(baseline.rng.words, enhanced.rng.words);
        let guid = enhanced.actors[0].guid;
        assert_eq!(baseline.actors[0].health - enhanced.actors[0].health, 50.0);
        let hits = enhanced
            .events
            .iter()
            .filter_map(|event| match event {
                RunEvent::Damage {
                    target,
                    spell_id,
                    school,
                    raw_power,
                    source_kind,
                    critical,
                    emit_log,
                    ..
                } if *target == guid => Some((
                    *spell_id,
                    *school,
                    *raw_power,
                    *source_kind,
                    *critical,
                    *emit_log,
                )),
                _ => None,
            })
            .collect::<Vec<_>>();
        assert_eq!(
            hits,
            vec![
                (589, 5, 1.0, 0, false, true),
                (589, 5, 50.0, 3, false, true)
            ],
            "source3 conversion preserves original metadata, has no global multiplier and cannot recurse"
        );
    }

    #[test]
    fn timed_talent_preserves_startup_and_refresh_timer_then_retries_real_targeting() {
        let mut game = class_run("warrior", 0);
        game.configure_effects(&[("bladestorm".into(), 1)], &[]);
        // Current Bladestorm contains both startup grant27 and timed grant26.
        assert_eq!(game.abilities.len(), 2);
        assert_eq!(
            game.abilities
                .iter()
                .filter(|row| row.definition.key == "whirlwind")
                .count(),
            1
        );
        assert_eq!(game.effect_state.timed.len(), 1);
        assert_eq!(
            (
                game.effect_state.timed[0].key,
                game.effect_state.timed[0].remaining
            ),
            ("whirlwind", 1.5)
        );
        game.effect_state.timed[0].remaining = 0.7;
        game.refresh_effects();
        assert_eq!(game.effect_state.timed[0].remaining, 0.7);
        game.effect_state.timed[0].remaining = 1.5;
        for ability in &mut game.abilities {
            ability.remaining = 100.0;
        }
        let player = game.zone.center.into();
        let mut terrain = TerrainFixture;
        game.tick(1.5, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(
            game.effect_state.timed[0].remaining, 0.3,
            "normal world creation follows this failed timed cast"
        );
        assert!(
            game.execution
                .seen_spells
                .contains(&AbilityDefinition::by_key("whirlwind").unwrap().spell_id)
        );
        fixture_enemies(&mut game, &[3.0], &mut terrain);
        for row in &mut game.actors {
            row.health = 10000.0;
            row.maximum_health = 10000.0;
            row.actor.attack_delay = 100.0;
        }
        game.tick(0.31, player, [0.0; 2], 0.0, &mut terrain);
        let spell = AbilityDefinition::by_key("whirlwind").unwrap().spell_id;
        assert_eq!(
            game.events
                .iter()
                .filter(|event| matches!(event,RunEvent::Spell(cast) if cast.spell_id==spell))
                .count(),
            1
        );
        assert!(game.events.iter().any(|event| matches!(event,RunEvent::Damage {spell_id,amount,..} if *spell_id==spell && *amount>0.0)));
        assert_eq!(game.effect_state.timed[0].remaining, 3.0);
        assert_eq!(
            game.abilities.len(),
            2,
            "the timed grant adds no learned duplicate"
        );
        let learned = game
            .abilities
            .iter()
            .find(|row| row.definition.key == "whirlwind")
            .unwrap();
        assert_eq!(
            learned.remaining,
            (100.0_f32 - 1.5) - 0.31,
            "timed scheduling does not reset its independent learned timer"
        );
        assert!(game.ability_cooldown(spell).is_none());
    }

    #[test]
    fn timed_casts_do_not_draw_or_apply_ordinary_echo_attempts() {
        let prepare = |extra| {
            let mut game = class_run("warrior", 0);
            game.configure_effects(&[("bladestorm".into(), 1)], &[]);
            for ability in &mut game.abilities {
                ability.remaining = 100.0;
                ability.power_multiplier = 3.0;
            }
            game.effect_state.numeric.extra_cast = extra;
            fixture_enemies(&mut game, &[3.0, 5.0], &mut TerrainFixture);
            for row in &mut game.actors {
                row.health = 10000.0;
                row.maximum_health = 10000.0;
                row.actor.attack_delay = 100.0;
            }
            game
        };
        let mut ordinary = prepare(0.0);
        let mut echo = prepare(100.0);
        let player = ordinary.zone.center.into();
        ordinary.tick(5.0, player, [0.0; 2], 0.0, &mut TerrainFixture);
        echo.tick(5.0, player, [0.0; 2], 0.0, &mut TerrainFixture);
        let spell = AbilityDefinition::by_key("whirlwind").unwrap().spell_id;
        for game in [&ordinary, &echo] {
            assert_eq!(
                game.events
                    .iter()
                    .filter(|event| matches!(event,RunEvent::Spell(cast) if cast.spell_id==spell))
                    .count(),
                1,
                "large elapsed time also makes only one attempt"
            );
        }
        assert_eq!(
            ordinary.rng, echo.rng,
            "timed stage has no ordinary echo-count RNG draw"
        );
        assert_eq!(
            ordinary
                .actors
                .iter()
                .map(|row| row.health)
                .collect::<Vec<_>>(),
            echo.actors.iter().map(|row| row.health).collect::<Vec<_>>()
        );
    }

    #[test]
    fn timed_rejuvenation_runs_successful_cast_callbacks_without_a_learned_slot() {
        use azeroth_survivors_re::{
            loot_rewards::amulets,
            run_effects::{EffectRow, healing::MeterSource},
        };
        let mut game = class_run("druid", 0);
        game.configure_effects(&[("tree_of_life".into(), 1)], &[]);
        // Use the unchanged current legendary cast-trigger row as a fixture.
        let amulet = amulets::catalog().by_key("legendary:rejuvenation").unwrap();
        let row = amulet
            .effects
            .iter()
            .find(|row| matches!(row.effect, amulets::Effect::Passive { tag: 15 }))
            .unwrap();
        game.effect_state
            .equipped
            .talents
            .push(EffectRow::amulet(row, 1.0));
        game.effect_state
            .talent_provenance
            .push(amulet.name.as_str());
        game.effect_state.talent_meter_sources.push(MeterSource {
            name: amulet.name.as_str(),
            icon: amulet.icon.as_str(),
            talent: true,
        });
        game.refresh_effects();
        for ability in &mut game.abilities {
            ability.remaining = 100.0;
        }
        game.execution.vitals.health = 1.0;
        let player = game.zone.center.into();
        game.tick(1.5, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert!(game.execution.auras.iter().any(|row| row.spell_id == 774));
        assert_eq!(game.effect_state.generic.temporary.entries.len(), 1);
        assert!(game.effect_state.leech >= 0.05);
        assert!(
            !game
                .abilities
                .iter()
                .any(|row| row.definition.key == "rejuvenation")
        );
        assert!(game.ability_cooldown(774).is_none());
        assert_eq!(game.effect_state.timed[0].remaining, 6.0);
    }

    #[test]
    fn shield_applies_before_due_hostile_impact_and_both_aura_edges_are_published() {
        let mut game = class_run("priest", 0);
        game.abilities = vec![RuntimeInstance::learned(
            AbilityDefinition::by_key("pw_shield").unwrap(),
        )];
        game.abilities[0].remaining = 0.0;
        let player = game.zone.center.into();
        game.execution.pending.0.push(PendingHit {
            context: HitContext::default(),
            target_guid: 1,
            source_guid: 99,
            effect: player_abilities::StatusEffect {
                tag: 0,
                value: 0.0,
                duration: 0.0,
            },
            resolves_at: 0.0,
            spell_id: 133,
            damage: game.max_health() + 1.0,
            critical: false,
            damages_player: true,
            school: 2,
        });
        game.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert!(
            !game.dead,
            "native self-cast precedes this otherwise-lethal pending impact"
        );
        let edges = game
            .events
            .iter()
            .filter_map(|event| match event {
                RunEvent::Aura {
                    target: 1, fields, ..
                } => Some(fields),
                _ => None,
            })
            .collect::<Vec<_>>();
        assert!(
            edges.len() >= 2,
            "aura applied and consumed in one frame must preserve both native publications"
        );
        assert!(edges.iter().all(|fields| !fields.is_empty()));
        assert!(edges.iter().any(|fields| fields.contains(&(47, 17))));
        assert!(edges.iter().any(|fields| fields.contains(&(47, 0))));
    }

    #[test]
    fn rescue_publishes_full_player_aura_descriptor_before_its_visual() {
        let mut game = class_run("rogue", 0);
        game.configure_effects(&[("cheat_death".into(), 1)], &[]);
        game.clock = 2500.0;
        game.alive_since = 2000.0;
        game.events.clear();
        let player = game.zone.center.into();
        game.damage_player(200.0, false, 99, player, 0.0, &mut TerrainFixture);
        assert!(!game.dead);
        assert_eq!(game.alive_since, 2000.0, "rescue before phase4 is not a revival");
        let aura = game
            .events
            .iter()
            .position(
                |event| matches!(event,RunEvent::Aura {target:1,fields,..} if !fields.is_empty()),
            )
            .unwrap();
        let visual = game
            .events
            .iter()
            .position(|event| matches!(event,RunEvent::Spell(cast) if cast.spell_id==1856))
            .unwrap();
        assert!(aura < visual);
        assert!(
            !game.events.iter().any(
                |event| matches!(event,RunEvent::Aura {target:1,fields,..} if fields.is_empty())
            )
        );
    }

    #[test]
    fn stationary_facing_is_published_once_when_a_live_chase_stops() {
        let mut game = class_run("warrior", 0);
        game.abilities.clear();
        let player: Position = game.zone.center.into();
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[0.5], &mut terrain);
        let row = &mut game.actors[0];
        let guid = row.guid;
        // Already in range, but still on an active chase. The angle belongs
        // to its old orbit; only the target-facing packet supplies the turn.
        let from = row.actor.movement.to;
        row.actor.movement = ai::Movement {
            from,
            to: Position { x: from.x + 0.1, ..from },
            started_at: game.clock,
            duration: 1.0,
        };
        row.actor.movement_angle = 2.0;
        game.movement_counter = u32::MAX;
        game.events.clear();
        game.tick(0.01, player, [0.; 2], 0., &mut terrain);
        let faces: Vec<_> = game.events.iter().filter_map(|event| match event {
            RunEvent::StationaryFacing { source, position, serial, target } =>
                Some((*source, *position, *serial, *target)),
            _ => None,
        }).collect();
        assert_eq!(faces.len(), 1);
        assert_eq!((faces[0].0, faces[0].2, faces[0].3), (guid, 0, 1));
        assert_eq!(faces[0].1, game.actors[0].actor.movement.from);
        assert_eq!(game.actors[0].actor.movement.duration, 0.);
        game.events.clear();
        game.tick(0.01, player, [0.; 2], 0., &mut terrain);
        assert!(!game.events.iter().any(|event| matches!(event, RunEvent::StationaryFacing { .. })));
        assert_eq!(game.movement_counter, 0);
    }

    #[test]
    fn stationary_facing_dispatch_counts_travel_and_preserves_raw_start() {
        let mut events = Vec::new();
        let mut serial = u32::MAX - 1;
        let from = Position { x: 1., y: 2., z: 40. };
        let to = Position { x: 7., y: 8., z: 50. };
        let mut movement = ai::Movement { from, to, started_at: 5., duration: 1. };
        publish_actor_movement(&mut events, &mut serial, 17, movement);
        assert_eq!(serial, u32::MAX);
        assert!(matches!(events.last(), Some(RunEvent::ActorMovement {
            source: 17, movement: actual, serial: u32::MAX }) if *actual == movement));
        for duration in [0., -0., -1.] {
            movement.duration = duration;
            publish_actor_movement(&mut events, &mut serial, 17, movement);
            assert!(matches!(events.last(), Some(RunEvent::StationaryFacing {
                source: 17, position, target: 1, ..
            }) if *position == from));
        }
        assert_eq!(serial, 2);
        movement.duration = f32::NAN;
        publish_actor_movement(&mut events, &mut serial, 17, movement);
        assert_eq!(serial, 3);
        assert_eq!(events.len(), 5, "unordered duration follows native travel branch");
        assert!(matches!(events.last(), Some(RunEvent::ActorMovement { serial: 3, movement, .. })
            if movement.duration.is_nan()));
    }

    #[test]
    fn stun_stop_uses_shared_serial_and_precedes_native_aura_publication() {
        let mut game = class_run("priest", 0);
        game.abilities[0].remaining = 100.0;
        game.movement_counter = 7;
        let mut terrain = TerrainFixture;
        let player = game.zone.center.into();
        fixture_enemies(&mut game, &[3.0, 5.0], &mut terrain);
        let guids = game
            .actors
            .iter()
            .take(2)
            .map(|row| row.guid)
            .collect::<Vec<_>>();
        for guid in &guids {
            fixture_hit(&mut game, *guid, 1.0);
            game.execution.pending.0.last_mut().unwrap().effect = player_abilities::StatusEffect {
                tag: 3,
                value: 0.5,
                duration: 0.0,
            };
        }
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        let stops = game
            .events
            .iter()
            .enumerate()
            .filter_map(|(index, event)| match event {
                RunEvent::StoppedMovement { target, serial, .. } => Some((index, *target, *serial)),
                _ => None,
            })
            .collect::<Vec<_>>();
        assert_eq!(stops.len(), 2);
        assert_eq!((stops[0].2, stops[1].2), (8, 9));
        for (stop, target, _) in stops {
            let aura = game
                .events
                .iter()
                .position(|event| {
                    matches!(event,
                RunEvent::Aura {target:guid,spell_id:585,present:true,..} if *guid==target)
                })
                .unwrap();
            assert!(stop < aura);
        }
        game.events.clear();
        fixture_hit(&mut game, guids[0], 1.0);
        game.execution.pending.0.last_mut().unwrap().effect = player_abilities::StatusEffect {
            tag: 3,
            value: 0.1,
            duration: 0.0,
        };
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert!(
            !game
                .events
                .iter()
                .any(|event| matches!(event, RunEvent::StoppedMovement { .. }))
        );
        assert_eq!(game.movement_counter, 9);
    }

    #[test]
    fn polymorph_restores_canonical_native_appearance_before_publication() {
        let mut game = class_run("mage", 0);
        game.abilities[0].remaining = 100.0;
        game.abilities.push(RuntimeInstance::learned(
            AbilityDefinition::by_key("polymorph").unwrap(),
        ));
        let player = game.zone.center.into();
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0], &mut terrain);
        let guid = game.actors[0].guid;
        game.actors[0].health = 1000.0;
        game.actors[0].maximum_health = 1000.0;
        let original = game.actor_appearance(guid).unwrap();
        game.passive_state.polymorph_guids.push(guid);
        game.actors[0].actor.fear_until = 10.0;
        game.effect_state
            .generic
            .appearance_overrides
            .insert(guid, (856, 1.0));
        assert_eq!(game.actor_appearance(guid), Some((856, 1.0)));
        fixture_hit(&mut game, guid, 1.0);
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.actor_appearance(guid), Some(original));
        assert!(game.events.iter().any(|event| matches!(event,
            RunEvent::RestoreAppearance { target,appearance } if *target==guid
                && appearance.metadata_word_36==original.0 && appearance.actor_float_264==original.1)));
    }

    #[test]
    fn physical_swing_logs_before_immunity_refuses_player_health_mutation() {
        let mut game = class_run("priest", 0);
        game.abilities[0].remaining = 100.0;
        let player = game.zone.center.into();
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[0.5], &mut terrain);
        game.actors[0].actor.damage = 10.0;
        game.actors[0].actor.attack_delay = 0.0;
        let guid = game.actors[0].guid;
        let health = game.execution.vitals.health;
        game.execution.auras.push(buffs::Aura {
            source_guid: 0,
            effect: player_abilities::StatusEffect {
                tag: 11,
                value: 0.0,
                duration: 10.0,
            },
            spell_id: 642,
            expires_at: 10.0,
            healing_power: 0.0,
        });
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.execution.vitals.health, health);
        assert!(game.events.iter().any(|event| matches!(event,
            RunEvent::Melee {source,target:1,amount,critical:false} if *source==guid && *amount>=1)));
        assert!(
            !game
                .events
                .iter()
                .any(|event| matches!(event, RunEvent::PlayerDamage { .. }))
        );
    }

    #[test]
    fn hot_batch_preserves_regeneration_priority_and_spell_meter_proportions() {
        let mut game = class_run("druid", 0);
        game.configure_effects(
            &[("tree_of_life".into(), 1), ("tranquility".into(), 1)],
            &[],
        );
        for ability in &mut game.abilities {
            ability.remaining = 100.0;
        }
        game.stats.regeneration = 2.0;
        game.execution.vitals.health = game.max_health() - 5.0;
        for (spell_id, healing_power) in [(774, 20.0), (139, 40.0)] {
            game.execution.auras.push(buffs::Aura {
                source_guid: 0,
                effect: player_abilities::StatusEffect {
                    tag: 6,
                    value: 0.0,
                    duration: 1.0,
                },
                spell_id,
                expires_at: 1.0,
                healing_power,
            });
        }
        let player = game.zone.center.into();
        game.tick(0.1, player, [0.0; 2], 0.0, &mut TerrainFixture);
        let meter = game.healing_meter();
        let credit = |name: &str| {
            meter
                .iter()
                .find(|entry| entry.source.name == name)
                .unwrap()
                .total
        };
        assert!((credit("Regeneration") - 0.2).abs() < 0.00001);
        assert!((credit("Renew") / credit("Rejuvenation") - 2.0).abs() < 0.00001);
        assert!((credit("Renew") + credit("Rejuvenation") - 4.8).abs() < 0.00001);
        assert!(game.execution.vitals.absorb > 1.8);
        assert_eq!(game.effect_state.generic.healing.ready_at, 1.1);
        assert!(
            !game
                .events
                .iter()
                .any(|event| matches!(event, RunEvent::Healing { emit_log: true, .. }))
        );
    }

    #[test]
    fn player_impact_kills_before_same_frame_enemy_melee_stage() {
        let mut game = class_run("priest", 0);
        game.abilities[0].remaining = 100.0;
        game.execution.vitals.health = 1.0;
        let player = game.zone.center.into();
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[0.5], &mut terrain);
        let enemy = &mut game.actors[0];
        enemy.health = 1.0;
        enemy.actor.damage = 1000.0;
        enemy.actor.attack_delay = 0.0;
        let guid = enemy.guid;
        fixture_hit(&mut game, guid, 1000.0);
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert!(
            !game.dead,
            "native player impacts precede an otherwise lethal actor melee"
        );
        assert_eq!(game.kills, 1);
        assert!(
            !game
                .events
                .iter()
                .any(|event| matches!(event, RunEvent::PlayerDamage { .. }))
        );
        assert!(
            game.actors
                .iter()
                .find(|row| row.guid == guid)
                .unwrap()
                .actor
                .dead
        );
    }

    #[test]
    fn native_spell_overheal_feeds_absorb_and_tranquility_before_actor_stage() {
        let mut game = class_run("druid", 0);
        game.configure_effects(
            &[("tree_of_life".into(), 1), ("tranquility".into(), 1)],
            &[],
        );
        for ability in &mut game.abilities {
            ability.remaining = 100.0;
        }
        let player = game.zone.center.into();
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0], &mut terrain);
        game.actors[0].health = 1000.0;
        game.actors[0].maximum_health = 1000.0;
        game.execution.vitals.health = game.max_health() - 5.0;
        game.apply_healing(PendingHealing::spell(20.0, 774));
        assert_eq!(game.execution.vitals.absorb, 15.0);
        assert_eq!(game.effect_state.generic.healing.pool, 20.0);
        assert!(game.events.iter().any(
            |event| matches!(event,RunEvent::Healing {amount,emit_log:true,..}if*amount==5.0)
        ));
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.effect_state.generic.healing.pool, 0.0);
        assert_eq!(game.effect_state.generic.healing.ready_at, 1.01);
        assert!(game.events.iter().any(|event|matches!(event,RunEvent::Damage {spell_id:740,raw_power,source_kind:3,..}if*raw_power==60.0)));
    }

    #[test]
    fn ordinary_cooldown_publication_excludes_initial_and_failed_cast_timers() {
        let mut game = class_run("paladin", 0);
        let holy_light = AbilityDefinition::by_key("holy_light").unwrap();
        assert!(game.class.pool.contains(&holy_light.key));
        game.abilities = vec![RuntimeInstance::learned(holy_light)];
        assert_eq!(game.abilities[0].remaining, 0.5);
        assert_eq!(game.ability_cooldown(holy_light.spell_id), None);
        let player = game.zone.center.into();
        game.tick(0.5, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert_eq!(game.abilities[0].remaining, 0.2);
        assert_eq!(game.ability_cooldown(holy_light.spell_id), None);
        game.execution.vitals.health = 50.0;
        game.tick(0.2, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert!(game.health() > 50.0, "actual self-heal was dispatched");
        let published = game.ability_cooldown(holy_light.spell_id).unwrap();
        assert_eq!(
            published,
            RunCooldown::published(game.clock, game.abilities[0].remaining)
        );
        game.stats.cooldown_multiplier = 0.5;
        game.effect_state.numeric.recovery = 1.0;
        game.tick(0.1, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert_eq!(
            game.ability_cooldown(holy_light.spell_id),
            Some(published),
            "live stat changes do not rewrite an already emitted cooldown packet"
        );
    }

    #[test]
    fn published_cooldowns_use_native_millisecond_truncation_and_saturation() {
        assert_eq!(RunCooldown::published(2.0, 1.2349).duration, 1.234);
        assert_eq!(RunCooldown::published(2.0, f32::NAN).duration, 0.0);
        assert_eq!(RunCooldown::published(2.0, -1.0).duration, 0.0);
        assert_eq!(
            RunCooldown::published(2.0, f32::INFINITY).duration,
            u32::MAX as f32 / 1000.0
        );
    }

    #[test]
    fn separate_racial_shield_cast_uses_real_vitals_without_consuming_a_learned_slot() {
        let mut game = racial_run(3);
        assert_eq!(game.racial.as_ref().unwrap().remaining, 0.5);
        assert_eq!(game.abilities.len(), 1);
        let player = game.zone.center.into();
        game.tick(0.5, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert_eq!(game.abilities.len(), 1);
        assert_eq!(game.racial.as_ref().unwrap().definition.key, "stoneform");
        assert!((game.execution.vitals.absorb - 63.0).abs() < 0.0001);
        assert!(
            game.execution
                .auras
                .iter()
                .any(|aura| aura.spell_id == 20594)
        );
        assert_eq!(
            game.racial_cooldown,
            Some(RunCooldown {
                started_at: 0.5,
                duration: 42.0
            })
        );
        assert_eq!(game.racial.as_ref().unwrap().remaining, 42.0);
    }

    #[test]
    fn racial_failed_health_gate_uses_half_second_retry_without_publishing_a_cooldown() {
        let mut game = racial_run(5);
        let player = game.zone.center.into();
        game.tick(0.5, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert_eq!(game.health(), 100.0);
        assert_eq!(game.racial.as_ref().unwrap().remaining, 0.5);
        assert_eq!(game.racial_cooldown, None);
        assert!(
            !game
                .execution
                .auras
                .iter()
                .any(|aura| aura.spell_id == 7744)
        );
        let shadow = RuntimeInstance::learned(AbilityDefinition::by_key("shadowmeld").unwrap());
        assert_eq!(
            racial_interval(&shadow, 1.0),
            105.0,
            "racial success excludes ordinary effect11 duration addition"
        );
    }

    #[test]
    fn ready_racial_rescues_a_lethal_hit_and_protects_the_following_hit() {
        // Current shared player-hit14548fd49..49001a dispatches at one HP,
        // then the next hit sees the newly installed kind11 aura.
        let mut game = racial_run(5);
        game.racial.as_mut().unwrap().remaining = 0.0;
        let player = game.zone.center.into();
        let before_rng = game.rng;
        game.damage_player(150.0, true, 0, player, 0.0, &mut TerrainFixture);
        assert_eq!(game.taken_total(), 150.0);
        assert_eq!(game.health(), 1.0);
        assert!(!game.dead);
        assert_eq!(game.racial.as_ref().unwrap().remaining, 84.0);
        assert_eq!(
            game.racial_cooldown,
            Some(RunCooldown {
                started_at: 0.0,
                duration: 84.0
            })
        );
        assert_eq!(game.rng, before_rng, "self-cast consumes no random draw");
        game.damage_player(500.0, false, 0, player, 0.0, &mut TerrainFixture);
        assert_eq!(game.taken_total(), 150.0, "invulnerability adds no taken damage");
        assert_eq!(game.health(), 1.0);
        assert!(
            !game
                .events
                .iter()
                .any(|event| matches!(event, RunEvent::PlayerDied))
        );
        assert_eq!(game.abilities.len(), 1);
    }

    #[test]
    fn failed_lethal_racial_restores_health_and_does_not_install_tick_retry() {
        let mut game = racial_run(5);
        game.racial.as_mut().unwrap().remaining = 0.0;
        // Exercise the actual dispatch's failure branch: one HP exceeds35%
        // of this fixture maximum, so the temporary one HP must be restored.
        game.execution.vitals.maximum_health = 1.0;
        game.execution.vitals.health = 0.5;
        let player = game.zone.center.into();
        game.damage_player(1.0, false, 0, player, 0.0, &mut TerrainFixture);
        assert_eq!(
            game.health(),
            0.0,
            "0.100.1 final death clamps health to zero at1454a19cd"
        );
        assert!(game.dead);
        assert_eq!(game.racial.as_ref().unwrap().remaining, 0.0);
        assert_eq!(game.racial_cooldown, None);
        assert!(
            !game
                .execution
                .auras
                .iter()
                .any(|aura| aura.spell_id == 7744)
        );
    }

    #[test]
    fn real_gold_creator_consumes_yaw_between_loot_chance_and_next_owner() {
        let mut actual = NativeRng::from_words([1, 2, 3, 4]);
        let mut expected = actual;
        // A flagged enemy's XP and fixed15 gold consume no amount draw.
        // Its guaranteed gold chance still draws, followed by object yaw.
        azeroth_survivors_re::mob_loot::unit24(&mut expected);
        let yaw = expected.range_f32(0.0, std::f32::consts::TAU);
        let cache_yaw = expected.range_f32(0.0, std::f32::consts::TAU);
        let mut pickups = Vec::new();
        let mut counter = SharedCounter::default();
        let mut terrain = TerrainFixture;
        let mut events = Vec::new();
        let mut port = LootAdapter {
            pickups: &mut pickups,
            counter: counter.clone(),
            world: &mut terrain,
            zone: ZoneDefinition::by_key("elwynn").unwrap(),
            now: 7.0,
            events: &mut events,
        };
        MobLootState::default().enemy_death(
            Some(&treasure_chests::EnemyDefinition {
                id: 1,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 1,
            }),
            100,
            treasure_chests::Position::default(),
            &mut actual,
            &mut port,
        );
        assert_eq!(actual.words, expected.words);
        let gold = pickups
            .iter()
            .find(|pickup| matches!(pickup.drop, PickupDrop::Gold { .. }))
            .unwrap();
        assert_eq!(gold.facing.to_bits(), yaw.to_bits());
        assert_eq!(pickups.len(), 3, "XP, gold and actual cache request");
        let cache = pickups
            .iter()
            .find(|pickup| matches!(pickup.drop, PickupDrop::Cache { .. }))
            .unwrap();
        assert_eq!(cache.facing.to_bits(), cache_yaw.to_bits());
        assert_eq!(
            pickups.iter().map(|pickup| pickup.id).collect::<Vec<_>>(),
            vec![
                0xf130_0023_2900_0001,
                0xf110_0023_2c00_0002,
                0xf110_0023_2d00_0003
            ]
        );
        assert_eq!(
            scaling::creature_guid(600, &mut counter),
            0xf130_0002_5800_0004
        );
    }

    #[test]
    fn death_cache_is_adopted_without_a_second_serial_or_yaw_draw() {
        let mut game = class_run("priest", 0);
        let player: Position = game.zone.center.into();
        let mut terrain = TerrainFixture;
        game.tick_chests(player, [0.0; 2], &mut terrain);
        game.clock = 4.0;
        chests::create_death_cache(
            &mut game.pickups,
            &mut game.counter,
            &mut terrain,
            game.zone,
            game.clock,
            treasure_chests::Position::new(player.x, player.y, player.z),
            &mut game.rng,
            &mut game.events,
        );
        let cache = *game.pickups.last().unwrap();
        let serial = game.counter.value();
        let rng = game.rng;
        game.tick_chests(player, [0.0; 2], &mut terrain);
        assert_eq!(game.counter.value(), serial);
        assert_eq!(game.rng, rng);
        let adopted = game
            .pickups
            .iter()
            .find(|pickup| pickup.id == cache.id)
            .unwrap();
        assert_eq!((adopted.created_at, adopted.facing), (4.0, cache.facing));
        assert_eq!(game.cache_facing(cache.id), Some(cache.facing));
    }
    #[test]
    fn loadout_effects_reach_live_stats_and_spell_consumers() {
        let mut game = class_run("warrior", 1);
        game.configure_effects(
            &[
                ("deflection".into(), 5),
                ("anticipation".into(), 5),
                ("imp_rend".into(), 3),
            ],
            &[(2, 20.0), (11, 1.0)],
        );
        assert_eq!(game.stats.armor_fraction, 0.01_f32 * 5.0);
        assert_eq!(game.max_health(), 120.0 * (1.0 + 0.03_f32 * 5.0));
        assert_eq!(
            game.cast_context(game.zone.center.into(), 0.0)
                .global_target_bonus,
            1
        );
        let rend = AbilityDefinition::by_key("rend").unwrap();
        assert_eq!(
            game.effect_state.equipped.spell_modifiers(rend).power,
            1.0 + 0.15_f32 * 3.0
        );
        game.add_experience(game.xp_required());
        assert_eq!(game.max_health(), 129.0 * (1.0 + 0.03_f32 * 5.0));
    }
    #[test]
    fn current_level_threshold_uses_roundf_instead_of_ceilf() {
        let mut game = class_run("warrior", 1);
        for (level, required) in [(1, 5), (2, 9), (3, 14), (4, 20), (5, 27), (15, 130)] {
            game.level = level;
            assert_eq!(game.xp_required(), required, "level{level}");
        }
    }
    #[test]
    fn cap120_preserves_final_level_choices_and_stops_new_levels_in_endless() {
        for endless in [false, true] {
            for stored in [false, true] {
                let mut game = class_run("warrior", 1);
                game.rules.endless = endless;
                game.set_store_levels(stored);
                game.level = 118;
                let first = game.xp_required();
                game.level = 119;
                let second = game.xp_required();
                game.level = 118;
                game.events.clear();
                game.add_experience(first + second + 7);
                assert_eq!((game.level, game.xp, game.pending_levels), (120, 7, 2));
                assert_eq!(game.events.iter().filter_map(|event| match event {
                    RunEvent::LevelUp(level) => Some(*level), _ => None,
                }).collect::<Vec<_>>(), [119, 120]);
                if stored {
                    assert!(game.choices.is_empty());
                    game.open_stored_levels();
                }
                assert!(!game.choices.is_empty(), "the final earned card remains admissible at120");
                assert!(game.choose(0));
                assert_eq!(game.pending_levels, 1);
                assert!(game.choose(0));
                assert_eq!(game.pending_levels, 0);
                game.events.clear();
                game.add_experience(game.xp_required());
                assert_eq!(game.level, 120);
                assert_eq!(game.pending_levels, 0);
                assert!(game.choices.is_empty());
                assert!(!game.events.iter().any(|event| matches!(event, RunEvent::LevelUp(_))));
            }
        }
    }

    #[test]
    fn xp_batch_heals_each_earned_level_after_its_own_message_and_stat_refresh() {
        let mut game = class_run("warrior", 0);
        game.execution.vitals.health = 1.0;
        game.events.clear();
        game.add_experience(14); //5 +9, two earned levels in one native XP call.
        assert_eq!((game.level, game.xp, game.pending_levels), (3, 0, 2));
        let heals = game
            .events
            .iter()
            .filter_map(|event| match event {
                RunEvent::Healing {
                    amount, emit_log, ..
                } => {
                    assert!(!emit_log);
                    Some(*amount)
                }
                _ => None,
            })
            .collect::<Vec<_>>();
        assert_eq!(heals.len(), 2);
        assert_eq!(
            game.max_health(),
            118.0,
            "fixture begins at100 HP and gains9 per level"
        );
        assert!((heals[0] - 109.0 * 0.2).abs() < 0.00001);
        assert!((heals[1] - 118.0 * 0.2).abs() < 0.00001);
        assert!(
            (game.health() - (((1.0 + 9.0) + 109.0 * 0.2 + 9.0) + 118.0 * 0.2)).abs() < 0.00001
        );
        let meter = game
            .healing_meter()
            .iter()
            .find(|row| row.source.name == "Level Up")
            .unwrap();
        assert_eq!(meter.source.icon, "Spell_Holy_HolyBolt");
        assert_eq!(meter.total, f64::from(heals[0]) + f64::from(heals[1]));
        let order = game
            .events
            .iter()
            .filter_map(|event| match event {
                RunEvent::LevelUp(_) => Some("level"),
                RunEvent::SystemMessage(text) => {
                    assert_eq!(
                        text.render(&|key| key.to_owned()),
                        "You have gained 3% damage, 9 maximum health and 0.08 health per second."
                    );
                    Some("message")
                }
                RunEvent::Healing { .. } => Some("heal"),
                RunEvent::PlayerValues(fields) => {
                    assert_eq!(fields, &vec![(716, 0), (717, 14)]);
                    Some("xp")
                }
                _ => None,
            })
            .collect::<Vec<_>>();
        assert_eq!(
            order,
            ["level", "message", "heal", "level", "message", "heal", "xp"]
        );
    }
    #[test]
    fn inline_level_heal_matches_selected_native_instruction_vectors() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/run-effects/level-progression-native.json"
        ))
        .unwrap();
        for case in fixture["cases"].as_array().unwrap() {
            let input = |key: &str| f32::from_bits(case[key].as_u64().unwrap() as u32);
            let mut game = class_run("warrior", 0);
            game.execution.vitals.health = input("health_bits");
            game.execution.vitals.maximum_health = input("maximum_bits");
            game.heal_level_up();
            let expected = &case["expected"];
            let matches = |value: f32, key: &str| {
                let value_bits = expected[key].as_u64().unwrap() as u32;
                value.to_bits() == value_bits
                    || value.is_nan() && f32::from_bits(value_bits).is_nan()
            };
            assert!(matches(game.health(), "health_bits"), "{case}");
            let Some(RunEvent::Healing {
                amount,
                emit_log: false,
                ..
            }) = game.events.last()
            else {
                panic!("inline level heal");
            };
            assert!(matches(*amount, "actual_bits"), "{case}");
            assert_eq!(
                !game.healing_meter().is_empty(),
                expected["record_meter"].as_bool().unwrap(),
                "{case}"
            );
            assert_eq!(game.effect_state.generic.healing.pool, 0.0);
        }
    }
    #[test]
    fn level_periodic_stack_message_requires_a_learned_dot_and_a_stack_increase() {
        for (key, expected) in [("rend", 2), ("cleave", 1)] {
            let mut game = class_run("warrior", 0);
            game.level = 14;
            game.abilities = vec![RuntimeInstance::learned(
                AbilityDefinition::by_key(key).unwrap(),
            )];
            game.refresh_effects();
            game.events.clear();
            game.add_experience(game.xp_required());
            let messages = game
                .events
                .iter()
                .filter_map(|event| match event {
                    RunEvent::SystemMessage(text) => Some(text.render(&|key| key.to_owned())),
                    _ => None,
                })
                .collect::<Vec<_>>();
            assert_eq!(messages.len(), expected, "{key}");
            if expected == 2 {
                assert_eq!(
                    messages[1],
                    "Your damage over time spells now stack 2 times on one enemy."
                );
            }
        }
    }
    #[test]
    fn collected_xp_and_gold_round_while_xp_keeps_the_native_one_minimum() {
        let mut game = class_run("warrior", 1);
        game.stats.experience_multiplier = 1.2;
        game.stats.gold_multiplier = 1.2;
        game.pickups.push(RunPickup {
            created_at: 0.0,
            id: 1,
            drop: PickupDrop::Experience {
                amount: 2,
                position: treasure_chests::Position::default(),
            },
            flight: Some(ai::Movement {
                from: Position::default(),
                to: Position::default(),
                started_at: 0.0,
                duration: 0.0,
            }),
            facing: 0.0,
            auxiliary: [None; 2],
        });
        game.pickups.push(RunPickup {
            created_at: 0.0,
            id: 2,
            drop: PickupDrop::Gold {
                amount: 2,
                position: treasure_chests::Position::default(),
            },
            flight: None,
            facing: 0.0,
            auxiliary: [None; 2],
        });
        assert!(game.collect_pickup(1));
        assert_eq!(game.xp, 2);
        assert!(game.collect_pickup(2));
        assert_eq!(game.gold, 2);
        game.stats.experience_multiplier = 0.0;
        game.pickups.push(RunPickup {
            created_at: 0.0,
            id: 3,
            drop: PickupDrop::Experience {
                amount: 2,
                position: treasure_chests::Position::default(),
            },
            flight: Some(ai::Movement {
                from: Position::default(),
                to: Position::default(),
                started_at: 0.0,
                duration: 0.0,
            }),
            facing: 0.0,
            auxiliary: [None; 2],
        });
        assert!(game.collect_pickup(3));
        assert_eq!(game.xp, 3);
    }
    #[test]
    fn lethal_talent_uses_live_shared_deadline_after_racial_fails() {
        let mut game = class_run("warrior", 1);
        game.configure_effects(&[("last_stand".into(), 1)], &[]);
        let player = game.zone.center.into();
        game.damage_player(200.0, true, 0, player, 0.0, &mut TerrainFixture);
        assert!(!game.dead);
        assert_eq!(game.health(), game.max_health() * 0.4);
        game.damage_player(200.0, true, 0, player, 0.0, &mut TerrainFixture);
        assert!(
            game.dead,
            "a second lethal hit does not bypass the shared talent deadline"
        );
    }

    #[test]
    fn divine_shield_echoes_and_forced_retries_share_one_ten_second_admission() {
        let mut game = class_run("paladin", 0);
        game.configure_effects(&[], &[]);
        game.racial = None;
        let mut shield = RuntimeInstance::learned(AbilityDefinition::by_key("divine_shield").unwrap());
        shield.remaining = 0.0;
        shield.duration_multiplier = 100.0;
        shield.cooldown_multiplier = 0.0;
        game.abilities = vec![shield];
        game.effect_state.numeric.extra_cast = 4.0;
        game.execution.vitals.health = 20.0;
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
        let first = game.clock;
        let expires = game.execution.divine_shield_expires_at;
        assert_eq!(expires, first + 6.0);
        assert_eq!(game.execution.auras.iter().filter(|aura| aura.spell_id == 642).count(), 1);
        assert_eq!(game.execution.auras.iter().find(|aura| aura.spell_id == 642).unwrap().expires_at,
            first + 6.0);
        assert_eq!(game.events.iter().filter(|event|
            matches!(event, RunEvent::Spell(cast) if cast.spell_id == 642)).count(), 1,
            "echo attempts do not replace the admitted shield");
        for elapsed in [5.0, 6.1, 9.9] {
            game.clock = first + elapsed;
            game.abilities[0].remaining = 0.0;
            game.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
            assert_eq!(game.execution.divine_shield_expires_at, expires);
            if elapsed >= 6.0 {
                assert!(!game.execution.auras.iter().any(|aura| aura.spell_id == 642));
            }
        }
        game.clock = first + 10.0;
        game.abilities[0].remaining = 0.0;
        game.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert_eq!(game.execution.divine_shield_expires_at, game.clock + 6.0);
        assert!(game.execution.auras.iter().any(|aura| aura.spell_id == 642));
    }

    #[test]
    fn divine_shield_unordered_health_admits_without_bypassing_retrigger_gate() {
        let mut game = class_run("paladin", 0);
        game.configure_effects(&[], &[]);
        game.racial = None;
        let mut shield = RuntimeInstance::learned(AbilityDefinition::by_key("divine_shield").unwrap());
        shield.remaining = 0.0;
        game.abilities = vec![shield];
        game.execution.vitals.health = f32::NAN;
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
        let expires = game.execution.divine_shield_expires_at;
        assert!(expires > game.clock);
        assert!(game.execution.auras.iter().any(|aura| aura.spell_id == 642));
        game.abilities[0].remaining = 0.0;
        game.tick(0.01, player, [0.0; 2], 0.0, &mut TerrainFixture);
        assert_eq!(game.execution.divine_shield_expires_at, expires);
    }

    #[test]
    fn divine_intervention_free_shield_respects_the_previous_shield_expiry() {
        let mut game = class_run("paladin", 0);
        game.configure_effects(&[("divine_intervention".into(), 1)], &[]);
        game.racial = None;
        game.execution.divine_shield_expires_at = 6.0;
        game.clock = 1.0;
        let player = game.zone.center.into();
        game.damage_player(1000.0, true, 0, player, 0.0, &mut TerrainFixture);
        assert!(!game.dead);
        assert!(!game.execution.auras.iter().any(|aura| aura.spell_id == 642));
        assert_eq!(game.execution.divine_shield_expires_at, 6.0);
        let shield = RuntimeInstance::learned(AbilityDefinition::by_key("divine_shield").unwrap());
        game.clock = 6.0 + player_abilities::damage::base_interval(&shield, 0.0);
        game.effect_state.incoming.lethal_talent_ready_at = 0.0;
        game.damage_player(1000.0, true, 0, player, 0.0, &mut TerrainFixture);
        assert!(!game.dead);
        assert_eq!(game.execution.divine_shield_expires_at,
            game.clock + player_abilities::damage::scaled_duration(&shield));
        assert!(game.execution.auras.iter().any(|aura| aura.spell_id == 642));
    }

    #[test]
    fn equipped_buff_potency_reaches_auras_and_live_speed_obeys_expiry() {
        let mut game = class_run("warrior", 1);
        game.configure_effects(&[], &[]);
        game.effect_state.numeric.buff_bonus = 0.25;
        game.execution.auras.extend([
            buffs::Aura {
                source_guid: 0,
                effect: player_abilities::StatusEffect {
                    tag: 8,
                    value: 0.2,
                    duration: 1.0,
                },
                spell_id: 1,
                expires_at: 2.0,
                healing_power: 0.0,
            },
            buffs::Aura {
                source_guid: 0,
                effect: player_abilities::StatusEffect {
                    tag: 9,
                    value: 0.4,
                    duration: 1.0,
                },
                spell_id: 2,
                expires_at: 2.0,
                healing_power: 0.0,
            },
            buffs::Aura {
                source_guid: 0,
                effect: player_abilities::StatusEffect {
                    tag: 0,
                    value: 0.0,
                    duration: 1.0,
                },
                spell_id: 23451,
                expires_at: 2.0,
                healing_power: 0.0,
            },
        ]);
        assert_eq!(game.current_damage_multiplier(), 1.0 + 0.2 * 1.25);
        assert_eq!(game.current_cooldown_multiplier(), 1.0 / (1.0 + 0.4 * 1.25));
        assert_eq!(game.movement_multiplier(), 1.6);
        game.clock = 2.0;
        assert_eq!(game.current_damage_multiplier(), 1.0);
        assert_eq!(game.current_cooldown_multiplier(), 1.0);
        assert_eq!(game.movement_multiplier(), 1.0);
    }

    #[test]
    fn chastise_fires_once_per_critical_smite_cast_without_an_old_cooldown() {
        let mut game = class_run("priest", 0);
        game.configure_effects(&[("chastise".into(), 1)], &[]);
        game.stats.critical_chance = 1.0;
        let player: Position = game.zone.center.into();
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0, 4.0], &mut terrain);
        for actor in &mut game.actors {
            actor.health = 10000.0;
            actor.maximum_health = 10000.0;
        }
        let nova = AbilityDefinition::by_key("holy_nova").unwrap().spell_id;
        for _ in 0..2 {
            game.events.clear();
            game.abilities[0].remaining = 0.0;
            game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
            let immediate = game
                .events
                .iter()
                .filter(|event| matches!(event,RunEvent::Spell(cast) if cast.spell_id==nova))
                .count();
            game.events.clear();
            game.tick(0.5, player, [0.0; 2], 0.0, &mut terrain);
            assert_eq!(
                immediate
                    + game
                        .events
                        .iter()
                        .filter(
                            |event| matches!(event,RunEvent::Spell(cast) if cast.spell_id==nova)
                        )
                        .count(),
                1,
                "two critical Smite victims share one Nova; a new cast within one second permits it again"
            );
        }
    }

    #[test]
    fn dot_spread_skips_owned_active_rows_and_restores_initial_tick_count() {
        let mut game = class_run("priest", 0);
        game.configure_effects(&[("shadowform".into(), 1)], &[]);
        game.abilities[0].remaining = 100.0;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0, 4.0, 5.0, 20.0], &mut terrain);
        for actor in &mut game.actors {
            actor.health = 10000.0;
            actor.maximum_health = 10000.0;
        }
        let victim = game.actors[0].guid;
        game.actors[0].health = 1.0;
        let dot = periodic::ActorPeriodic {
            owner_kind: 0,
            owner_guid: 1,
            effect_owner: None,
            meter_actor: None,
            spell_id: 589,
            power_per_tick: 7.0,
            interval: 2.0,
            next_tick_at: 100.0,
            ticks_remaining: 1,
            initial_ticks: 4,
            leech_fraction: 0.1,
            school: 5,
        };
        game.actors[0].periodic.push(dot);
        game.actors[1].periodic.push(dot);
        fixture_hit(&mut game, victim, 100.0);
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert!(game.actors[0].actor.dead);
        assert_eq!(
            game.actors[1].periodic[0], dot,
            "already-active owner/spell is excluded before limiting targets"
        );
        let transferred = game.actors[2].periodic[0];
        assert_eq!(
            (transferred.ticks_remaining, transferred.initial_ticks),
            (3, 4),
            "restores four original ticks, then the later actor-update executes its first tick in this frame"
        );
        assert!(game.events.iter().any(|event| matches!(event,
            RunEvent::PeriodicDamage {target,spell_id:589,amount,..}
                if *target==game.actors[2].guid && *amount==7.0)));
        assert_eq!(
            (transferred.power_per_tick, transferred.interval),
            (7.0, 2.0)
        );
        assert_eq!(
            (
                transferred.owner_kind,
                transferred.owner_guid,
                transferred.leech_fraction,
                transferred.school
            ),
            (0, 1, 0.1, 5)
        );
        assert!(game.actors[3].periodic.is_empty());
    }

    #[test]
    fn shield_kill_explosion_obeys_aura_and_two_per_second_gate() {
        use azeroth_survivors_re::run_effects::EffectRow;
        let mut game = class_run("paladin", 0);
        game.configure_effects(&[], &[]);
        let amulet = azeroth_survivors_re::loot_rewards::amulets::catalog()
            .by_key("legendary:divine_shield")
            .unwrap();
        let row = amulet
            .effects
            .iter()
            .find(|row| row.raw_hex.starts_with("0c"))
            .unwrap();
        game.effect_state
            .equipped
            .talents
            .push(EffectRow::amulet(row, 1.0));
        game.effect_state
            .talent_provenance
            .resize(game.effect_state.equipped.generic_talent_count(), "");
        game.refresh_effects();
        game.abilities[0].remaining = 100.0;
        game.execution.auras.push(buffs::Aura {
            source_guid: 0,
            effect: player_abilities::StatusEffect {
                tag: 0,
                value: 0.0,
                duration: 10.0,
            },
            spell_id: 642,
            expires_at: 10.0,
            healing_power: 0.0,
        });
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0, 5.0, 13.0, 15.0, 23.0, 25.0], &mut terrain);
        for (index, actor) in game.actors.iter_mut().enumerate() {
            actor.health = if index % 2 == 0 { 1.0 } else { 1000.0 };
            actor.maximum_health = if index % 2 == 0 { 100.0 } else { 1000.0 };
        }
        for index in [0, 2, 4] {
            let guid = game.actors[index].guid;
            fixture_hit(&mut game, guid, 100.0);
        }
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.actors[1].health, 980.0);
        assert_eq!(game.actors[3].health, 980.0);
        assert_eq!(
            game.actors[5].health, 1000.0,
            "the third qualified kill is rate limited"
        );
        assert_eq!(game.events.iter().filter(|event| matches!(event,
            RunEvent::Spell(cast) if cast.spell_id==15237 && matches!(cast.target,azeroth_survivors_re::bosses::abilities::CastTarget::Ground(_)))).count(),2);
    }

    #[test]
    fn generic_bounce_uses_original_hit_power_and_does_not_recurse() {
        use azeroth_survivors_re::{loot_rewards::amulets, run_effects::EffectRow};
        let mut game = class_run("priest", 0);
        game.configure_effects(&[], &[]);
        let row = amulets::catalog()
            .by_key("legendary:smite")
            .unwrap()
            .effects
            .iter()
            .find(|row| row.raw_hex.starts_with("06"))
            .unwrap();
        game.effect_state
            .equipped
            .talents
            .push(EffectRow::amulet(row, 1.0));
        game.effect_state
            .talent_provenance
            .resize(game.effect_state.equipped.generic_talent_count(), "");
        game.refresh_effects();
        game.abilities[0].remaining = 100.0;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0, 4.0, 5.0, 6.0], &mut terrain);
        for actor in &mut game.actors {
            actor.health = 1000.0;
            actor.maximum_health = 1000.0;
        }
        game.actors[0].additional_damage_taken = 1.0;
        let guid = game.actors[0].guid;
        fixture_hit(&mut game, guid, 100.0);
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.actors[0].health, 800.0);
        assert_eq!(game.actors[1].health, 970.0);
        assert_eq!(game.actors[2].health, 970.0);
        assert_eq!(game.effective_damage(), 260.0);
        assert_eq!(
            game.actors[3].health, 1000.0,
            "source3 bounces do not dispatch further bounces"
        );
    }

    #[test]
    fn renew_temporary_leech_applies_before_the_next_same_frame_hit_and_expires() {
        use azeroth_survivors_re::{loot_rewards::amulets, run_effects::EffectRow};
        let mut game = class_run("priest", 0);
        game.configure_effects(&[], &[]);
        let row = amulets::catalog()
            .by_key("legendary:renew")
            .unwrap()
            .effects
            .iter()
            .find(|row| row.raw_hex.starts_with("0f"))
            .unwrap();
        game.effect_state
            .equipped
            .talents
            .push(EffectRow::amulet(row, 1.0));
        game.effect_state
            .talent_provenance
            .resize(game.effect_state.equipped.generic_talent_count(), "");
        game.refresh_effects();
        let base_leech = game.effect_state.leech;
        game.abilities = vec!["renew", "smite"]
            .into_iter()
            .map(|key| {
                let mut instance =
                    RuntimeInstance::learned(AbilityDefinition::by_key(key).unwrap());
                instance.remaining = 0.0;
                instance
            })
            .collect();
        game.execution.vitals.health = 50.0;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0], &mut terrain);
        game.actors[0].health = 10000.0;
        game.actors[0].maximum_health = 10000.0;
        game.actors[0].actor.attack_delay = 100.0;
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        let damage = game
            .events
            .iter()
            .filter_map(|event| match event {
                RunEvent::Damage { amount, .. } => Some(*amount),
                _ => None,
            })
            .sum::<f32>();
        assert!(damage > 0.0);
        assert_eq!(game.effect_state.leech, base_leech + 0.05);
        assert!((game.health() - (50.0 + damage * (base_leech + 0.05))).abs() < 0.0001);
        for ability in &mut game.abilities {
            ability.remaining = 100.0;
        }
        game.tick(10.0, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.effect_state.leech, base_leech);
        assert!(game.effect_state.generic.temporary.entries.is_empty());
    }

    #[test]
    fn status_proc_stuns_without_inventing_a_second_damage_hit() {
        use azeroth_survivors_re::{loot_rewards::amulets, run_effects::EffectRow};
        let mut game = class_run("warrior", 0);
        game.configure_effects(&[], &[]);
        let row = amulets::catalog()
            .by_key("legendary:whirlwind")
            .unwrap()
            .effects
            .iter()
            .find(|row| row.raw_hex.starts_with("08"))
            .unwrap();
        game.effect_state
            .equipped
            .talents
            .push(EffectRow::amulet(row, 1.0));
        game.effect_state
            .talent_provenance
            .resize(game.effect_state.equipped.generic_talent_count(), "");
        game.refresh_effects();
        game.abilities[0].remaining = 100.0;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0], &mut terrain);
        game.actors[0].health = 1000.0;
        game.actors[0].maximum_health = 1000.0;
        let guid = game.actors[0].guid;
        fixture_hit(&mut game, guid, 20.0);
        let hit = game.execution.pending.0.last_mut().unwrap();
        hit.spell_id = AbilityDefinition::by_key("whirlwind").unwrap().spell_id;
        hit.school = 0;
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.actors[0].health, 980.0);
        assert_eq!(game.actors[0].actor.stun_until, 1.51);
        let spell_id = AbilityDefinition::by_key("whirlwind").unwrap().spell_id;
        assert!(game.events.iter().any(
            |event| matches!(event,RunEvent::Aura {target,present:true,fields,..}
            if*target==guid && fields.contains(&(79,spell_id)))
        ));
        game.tick(1.5, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.actors[0].actor.stun_until, 0.0);
        assert!(game.events.iter().any(
            |event| matches!(event,RunEvent::Aura {target,present:false,fields,..}
            if*target==guid && fields.contains(&(79,0)))
        ));
    }

    #[test]
    fn periodic_death_explosion_accepts_a_stored_exhausted_matching_dot() {
        use azeroth_survivors_re::{loot_rewards::amulets, run_effects::EffectRow};
        let mut game = class_run("priest", 0);
        game.configure_effects(&[], &[]);
        let row = amulets::catalog()
            .by_key("legendary:sw_pain")
            .unwrap()
            .effects
            .iter()
            .find(|row| row.raw_hex.starts_with("0b"))
            .unwrap();
        game.effect_state
            .equipped
            .talents
            .push(EffectRow::amulet(row, 1.0));
        game.effect_state
            .talent_provenance
            .resize(game.effect_state.equipped.generic_talent_count(), "");
        game.refresh_effects();
        game.abilities[0].remaining = 100.0;
        let mut terrain = TerrainFixture;
        fixture_enemies(&mut game, &[3.0, 4.0], &mut terrain);
        game.actors[0].health = 1.0;
        game.actors[0].maximum_health = 100.0;
        game.actors[1].health = 1000.0;
        game.actors[1].maximum_health = 1000.0;
        game.actors[0].periodic.push(periodic::ActorPeriodic {
            owner_kind: 1,
            owner_guid: 77,
            effect_owner: None,
            meter_actor: None,
            spell_id: 589,
            power_per_tick: 7.0,
            interval: 2.0,
            next_tick_at: 100.0,
            ticks_remaining: 0,
            initial_ticks: 4,
            leech_fraction: 0.0,
            school: 5,
        });
        let guid = game.actors[0].guid;
        fixture_hit(&mut game, guid, 100.0);
        let player = game.zone.center.into();
        game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
        assert_eq!(game.actors[1].health, 980.0);
    }
}
