//! Retained0.109.0 native22 special actors, extended by0.121.0 Explosive.
//! These have no ordinary enemy definition; damage/death stays separate from
//! ordinary loot. Current template/lifecycle: heroic-affixes-0.121.0.md.

use super::{
    NativeRng, Position, RawBossAbility,
    abilities::{CombatContext, CombatPort, MinionSpawn},
};
use crate::enemies::{
    ai::{Actor, Math},
    catalog::EnemyDefinition,
    scaling::{InitialStats, InitialTiming},
};
use crate::player_abilities::behavior::{periodic::ActorPeriodic, state::ControlWindow};

#[derive(Clone, Copy, Debug)]
pub struct Template {
    pub name: &'static str,
    pub entry: u32,
    pub display: u32,
    pub scale: f32,
}

#[rustfmt::skip]
pub const TEMPLATES: &[Template; 13] = &[
// BEGIN NATIVE WARD TEMPLATES
    Template { name: "Egg Sac", entry: 9600, display: 10056, scale: f32::from_bits(0x3f333333) },
    Template { name: "Fel Totem", entry: 9601, display: 4589, scale: f32::from_bits(0x3fb33333) },
    Template { name: "Hex Totem", entry: 9602, display: 1529, scale: f32::from_bits(0x3fcccccd) },
    Template { name: "Healing Ward", entry: 9603, display: 2030, scale: f32::from_bits(0x3fcccccd) },
    Template { name: "Warding Totem", entry: 9604, display: 4588, scale: f32::from_bits(0x3fb33333) },
    Template { name: "Arcane Crystal", entry: 9605, display: 9832, scale: f32::from_bits(0x3e4ccccd) },
    Template { name: "Soul Crystal", entry: 9606, display: 16135, scale: f32::from_bits(0x3f800000) },
    Template { name: "Web Cocoon", entry: 9607, display: 16213, scale: f32::from_bits(0x3f800000) },
    Template { name: "Spore", entry: 9608, display: 16111, scale: f32::from_bits(0x3f99999a) },
    Template { name: "Restless Spirit", entry: 9609, display: 1825, scale: f32::from_bits(0x3f99999a) },
    Template { name: "Frost Totem", entry: 9610, display: 4587, scale: f32::from_bits(0x3fb33333) },
    Template { name: "Wind Totem", entry: 9611, display: 4590, scale: f32::from_bits(0x3fb33333) },
    Template { name: "Explosive Orb", entry: 9612, display: 16111, scale: f32::from_bits(0x3f666666) },
// END NATIVE WARD TEMPLATES
];

#[derive(Clone, Copy)]
struct Definition {
    config: [u32; 4],
    template: usize,
    count: u32,
    spread: f32,
    health_factor: f32,
    lifetime: f32,
}

#[rustfmt::skip]
const DEFINITIONS: &[Definition] = &[
// BEGIN NATIVE WARD DEFINITIONS
    Definition { config: [0, 2, 0, 0], template: 0, count: 3, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3cf5c28f), lifetime: f32::from_bits(0x41200000) },
    Definition { config: [0, 2, 0, 0], template: 7, count: 2, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3cf5c28f), lifetime: f32::from_bits(0x41200000) },
    Definition { config: [1, 985963430, 0, 0], template: 1, count: 2, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3d0f5c29), lifetime: f32::from_bits(0x41700000) },
    Definition { config: [2, 0, 0, 0], template: 4, count: 3, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3cf5c28f), lifetime: f32::from_bits(0x41700000) },
    Definition { config: [2, 0, 0, 0], template: 2, count: 2, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3cf5c28f), lifetime: f32::from_bits(0x41400000) },
    Definition { config: [1, 985963430, 0, 0], template: 9, count: 3, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3ccccccd), lifetime: f32::from_bits(0x41700000) },
    Definition { config: [1, 985963430, 0, 0], template: 3, count: 1, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3d4ccccd), lifetime: f32::from_bits(0x41700000) },
    Definition { config: [2, 0, 0, 0], template: 4, count: 3, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3cf5c28f), lifetime: f32::from_bits(0x41700000) },
    Definition { config: [0, 2, 0, 0], template: 0, count: 2, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3d23d70a), lifetime: f32::from_bits(0x41200000) },
    Definition { config: [2, 0, 0, 0], template: 2, count: 1, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3d4ccccd), lifetime: f32::from_bits(0x41700000) },
    Definition { config: [1, 985963430, 0, 0], template: 9, count: 2, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3d23d70a), lifetime: f32::from_bits(0x41700000) },
    Definition { config: [1, 985963430, 0, 0], template: 3, count: 1, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3d4ccccd), lifetime: f32::from_bits(0x41700000) },
    Definition { config: [2, 0, 0, 0], template: 5, count: 2, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3d23d70a), lifetime: f32::from_bits(0x41700000) },
    Definition { config: [2, 0, 0, 0], template: 9, count: 2, spread: f32::from_bits(0x40c00000), health_factor: f32::from_bits(0x3cf5c28f), lifetime: f32::from_bits(0x41700000) },
// END NATIVE WARD DEFINITIONS
];

#[derive(Clone, Copy, Debug)]
pub struct Spawn {
    pub parent: u64,
    pub player_guid: u64,
    pub template: usize,
    pub config: [u32; 4],
    pub position: Position,
    pub maximum_health: f32,
    pub lifetime: f32,
}

/// The four config words retain the native discriminant/data layout. Kind0
/// stores hatch count+enemy index; kind1 stores a healing fraction; kind2 is
/// queried by the parent damage multiplier while the ward remains alive.
#[derive(Clone, Debug)]
pub struct Ward {
    pub guid: u64,
    pub player_guid: u64,
    pub allocation_order: u64,
    pub parent: u64,
    pub template: &'static Template,
    pub config: [u32; 4],
    pub native_level: u32,
    pub actor: Actor,
    pub health: f32,
    pub maximum_health: f32,
    pub control: ControlWindow,
    pub periodic: Vec<ActorPeriodic>,
    pub vulnerability: f32,
    pub vulnerability_until: f32,
    pub additional_damage_taken: f32,
    pub expires: f32,
    pub next_action: f32,
}

impl Ward {
    ///14596ed40: full UNIT snapshot; health fields ceil before saturation.
    pub fn fields(&self) -> Vec<(u16, u32)> {
        let scale = self.template.scale;
        vec![
            (0, self.guid as u32),
            (1, (self.guid >> 32) as u32),
            (2, 9),
            (3, self.template.entry),
            (4, scale.to_bits()),
            (16, self.player_guid as u32),
            (17, (self.player_guid >> 32) as u32),
            (22, self.health.max(0.).ceil() as u32),
            (28, self.maximum_health.ceil() as u32),
            (34, self.native_level),
            (35, 14),
            (36, 0x100),
            (46, 0),
            (126, 2000),
            (127, 2000),
            (129, (scale * 0.5).to_bits()),
            (130, (scale * 1.5).to_bits()),
            (131, self.template.display),
            (132, self.template.display),
            (134, 5f32.to_bits()),
            (135, 10f32.to_bits()),
            (145, 1f32.to_bits()),
        ]
    }
}

#[derive(Clone, Copy, Debug)]
pub struct Action {
    pub guid: u64,
    pub config: [u32; 4],
    pub position: Position,
    pub expired: bool,
}

#[derive(Clone, Debug, PartialEq)]
pub enum Effect {
    Remove {
        guid: u64,
    },
    Heal {
        parent: u64,
        fraction: f32,
        spell: u32,
    },
    Explode {
        guid: u64,
        position: Position,
        fraction: f32,
    },
    Hatch {
        guid: u64,
        count: u32,
        enemy_index: usize,
        position: Position,
    },
}

#[derive(Clone, Debug, Default)]
pub struct WardState {
    pub actors: Vec<Ward>,
}

impl WardState {
    /// Current145be8d10 has no population cap and clamps template indices to12.
    /// Game+ca4 is the same wrapping creature counter used by ordinary actors;
    /// native22 and Explosive allocate no independent serial stream.
    pub fn spawn(
        &mut self,
        request: Spawn,
        now: f32,
        run_level: u32,
        baseline: &EnemyDefinition,
        player: Position,
        counter: &mut dyn crate::native_counter::NativeCounter,
    ) -> &Ward {
        let template = &TEMPLATES[request.template.min(12)];
        let (guid, allocation_order) =
            crate::native_counter::creature_guid_with_order(template.entry, counter);
        let maximum_health = if request.maximum_health > 1. {
            request.maximum_health
        } else {
            1.
        };
        let actor = Actor::new(
            guid,
            request.position,
            now,
            InitialStats {
                health: maximum_health,
                max_health: maximum_health,
                damage: 0.,
                movement_speed: 0.,
                attack_interval: baseline.raw_38,
                melee_reach: baseline.scale * 1.2 + f32::from_bits(0x400ccccd),
                initial_attack_delay: baseline.raw_38 * 0.5,
            },
            InitialTiming {
                facing: (player.y - request.position.y).atan2(player.x - request.position.x),
                next_movement_at: now,
            },
        );
        self.actors.push(Ward {
            guid,
            allocation_order,
            parent: request.parent,
            player_guid: request.player_guid,
            template,
            config: request.config,
            native_level: run_level.min(63),
            actor,
            health: maximum_health,
            maximum_health,
            control: ControlWindow::default(),
            periodic: Vec::new(),
            vulnerability: 0.,
            vulnerability_until: 0.,
            additional_damage_taken: 0.,
            expires: now + request.lifetime,
            next_action: now + 1.,
        });
        self.actors.last().unwrap()
    }

    ///145971afd..1b49 deliberately has no range/expiry check. Actor removal or
    /// the common dead flag ends protection, even if its expiry action is queued.
    pub fn protects(&self, parent: u64) -> bool {
        self.actors
            .iter()
            .any(|row| !row.actor.dead && row.config[0] == 2 && row.parent == parent)
    }

    ///145978959..1b88: this follows ordinary aura tick/deferred-damage collection
    /// but bypasses ordinary attacks/movement. Advance the deadline once per
    /// admitted frame; overdue time never causes catch-up healing.
    pub fn collect_due(&mut self, now: f32) -> Vec<Action> {
        let mut result = Vec::new();
        for row in &mut self.actors {
            if row.actor.dead {
                continue;
            }
            let expired = now >= row.expires;
            if !expired && !(now >= row.next_action) {
                continue;
            }
            row.next_action = now + 1.;
            result.push(Action {
                guid: row.guid,
                config: row.config,
                position: row.actor.movement.position_at(now),
                expired,
            });
        }
        result
    }

    ///14597c56c..c7fc rechecks both actors after deferred damage/abilities.
    /// An already dead ward does nothing. A missing/dead parent removes it.
    pub fn resolve(&self, action: Action, parent_alive: bool) -> Option<Effect> {
        let ward = self
            .actors
            .iter()
            .find(|row| row.guid == action.guid && !row.actor.dead)?;
        // Current145c2238d handles the affix kind before parent lookup.
        if action.config[0] == 3 {
            return action.expired.then_some(Effect::Explode {
                guid: action.guid, position: action.position,
                fraction: f32::from_bits(action.config[1]),
            });
        }
        if !parent_alive {
            return Some(Effect::Remove { guid: action.guid });
        }
        Some(match action.config[0] {
            0 if action.expired => Effect::Hatch {
                guid: action.guid,
                count: action.config[1],
                enemy_index: (u64::from(action.config[2]) | (u64::from(action.config[3]) << 32))
                    as usize,
                position: action.position,
            },
            1 if !action.expired => Effect::Heal {
                parent: ward.parent,
                fraction: f32::from_bits(action.config[1]),
                spell: 2054,
            },
            _ if action.expired => Effect::Remove { guid: action.guid },
            _ => return None,
        })
    }

    /// Native Vec retain preserves the surviving actors' original order.
    pub fn remove(&mut self, guid: u64) {
        self.actors.retain(|row| row.guid != guid);
    }

    /// Native corpse expiry is strict, independently of the ward lifetime.
    pub fn expired_corpses(&self, now: f32) -> Vec<u64> {
        self.actors
            .iter()
            .filter(|row| row.actor.dead && now - row.actor.died_at > 1.2)
            .map(|row| row.guid)
            .collect()
    }
}

/// Native healing14594dd30 returns no event for zero/missing health. The caller
/// publishes ceil(newHP) field22 then the parent-to-parent spell heal log.
pub fn heal_amount(health: f32, maximum_health: f32, fraction: f32) -> f32 {
    let requested = fraction * maximum_health;
    let missing = maximum_health - health;
    let capped = if missing.is_nan() || requested < missing {
        requested
    } else {
        missing
    };
    if capped > 0. { capped } else { 0. }
}

///14597c6d1..c745 passes exact coordinates to ordinary creation. Its live
/// population cap/catalog clamp and shared RNG/GUID counter remain in that lane.
pub fn hatch_positions(
    count: u32,
    enemy_index: usize,
    position: Position,
    math: &impl Math,
) -> Vec<MinionSpawn> {
    (0..count)
        .map(|index| {
            let angle = (index as f32 / count as f32) * std::f32::consts::TAU;
            MinionSpawn {
                enemy_index,
                position: Position {
                    x: math.cos(angle) * 1.5 + position.x,
                    y: math.sin(angle) * 1.5 + position.y,
                    z: position.z,
                },
            }
        })
        .collect()
}

/// Semantic15 carries the selected-target native22 record index.
pub fn dispatch(
    record: &RawBossAbility,
    context: CombatContext,
    port: &mut impl CombatPort,
    rng: &mut NativeRng,
    math: &impl Math,
) -> bool {
    if record.words[0] != 15 {
        return false;
    }
    let Some(definition) = DEFINITIONS.get(record.words[1] as usize) else {
        return false;
    };
    let Some(maximum_health) = port.raid_source_maximum_health(context.source_guid) else {
        return true;
    };
    let count = definition.count.max(1);
    let step = std::f32::consts::PI / count as f32;
    let aim = (context.player.y - context.source.y).atan2(context.player.x - context.source.x);
    for index in 0..count {
        let distance = rng.range_f32(f32::from_bits(0x3f19999a), 1.) * definition.spread;
        let angle = ((index as f32 + 0.5) - (count as f32 * 0.5)) * step + aim;
        let mut position = Position {
            x: distance * math.cos(angle) + context.source.x,
            y: distance * math.sin(angle) + context.source.y,
            z: context.source.z,
        };
        if let Some(fraction) = port.ray_fraction(context.source, position) {
            if !(fraction >= 1.) {
                let length = ((position.y - context.source.y).powi(2)
                    + (position.x - context.source.x).powi(2))
                .sqrt();
                let fraction = (fraction - 0.5 / length.max(0.5)).max(0.);
                position.x = (position.x - context.source.x) * fraction + context.source.x;
                position.y = (position.y - context.source.y) * fraction + context.source.y;
            }
        }
        if let Some((center, radius)) = port.raid_zone_bounds() {
            let dx = position.x - center[0];
            let dy = position.y - center[1];
            let length = math.hypot(dx, dy);
            if !(length < 0.01) && !(radius - 4. >= length) {
                position.x = (dx / length) * (radius - 4.) + center[0];
                position.y = (dy / length) * (radius - 4.) + center[1];
            }
        }
        position.z = port
            .primary_height([position.x, position.y])
            .unwrap_or(context.source.z);
        port.raid_spawn_ward(Spawn {
            parent: context.source_guid,
            player_guid: context.player_guid,
            template: definition.template,
            config: definition.config,
            position,
            maximum_health: definition.health_factor * maximum_health,
            lifetime: definition.lifetime,
        });
    }
    port.raid_warning(
        context.source_guid,
        match definition.config[0] {
            0 => super::raid_warnings::RaidWarning::Eggs,
            1 => super::raid_warnings::RaidWarning::HealingWards,
            _ => super::raid_warnings::RaidWarning::ShieldingWards,
        },
    );
    true
}
