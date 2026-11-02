//! Guardian rules with historical placement/scaling/reward provenance and
//! selected current 0.109.0 signature scheduling. The live gameplay adapter
//! supplies real actors, terrain, spells, rewards and network publication.

pub mod addon;
pub mod ai;
pub mod catalog;
pub mod placement;
pub mod rewards;
pub mod scaling;
pub mod signatures;
mod signature_catalog;

use catalog::ZoneDefinition;
use scaling::{guardian_damage_with_powf, guardian_health_with_powf, ScalingInput};

pub const TARGET_VERSION: &str = "0.97.2";
pub const TARGET_SHA256: &str = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589";
pub const RESPAWN_SECONDS: f32 = 180.0;
pub const INITIAL_SPAWN_SECONDS: f32 = 20.0;

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Position {
    pub x: f32,
    pub y: f32,
    pub z: f32,
}

impl From<[f32; 3]> for Position {
    fn from([x, y, z]: [f32; 3]) -> Self {
        Self { x, y, z }
    }
}

/// Semantic equivalent of the native 0x28-byte lair record (Game+0x588).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Lair {
    pub enemy_index: usize,
    pub home: Position,
    pub active_guid: Option<u64>,
    pub respawn_at: f32,
}

impl Lair {
    pub fn new(enemy_index: usize, home: Position) -> Self {
        Self {
            enemy_index,
            home,
            active_guid: None,
            respawn_at: INITIAL_SPAWN_SECONDS,
        }
    }

    /// Native ordered comparison also refuses a NaN clock/deadline.
    pub fn spawn_due(self, clock_seconds: f32) -> bool {
        self.active_guid.is_none() && clock_seconds >= self.respawn_at
    }
}

/// The run's shared RNG state. Never seed a separate guardian-only stream.
/// Transition revalidated at 1454a99e0..1454a9a3a in the 0.97.2 EXE.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct NativeRng {
    pub state: [u64; 4],
}

impl NativeRng {
    pub fn next_u64(&mut self) -> u64 {
        let [mut a, mut b, mut c, mut d] = self.state;
        let result = a.wrapping_add(d).rotate_left(23).wrapping_add(a);
        let shift = b << 17;
        c ^= a;
        d ^= b;
        b ^= c;
        a ^= d;
        c ^= shift;
        d = d.rotate_left(45);
        self.state = [a, b, c, d];
        result
    }

    pub fn range_f32(&mut self, min: f32, max: f32) -> f32 {
        loop {
            let unit = f32::from_bits(0x3f80_0000 | (self.next_u64() >> 41) as u32) - 1.0;
            let result = unit * (max - min) + min;
            if result < max {
                return result;
            }
        }
    }
}

/// Native spawn parameters; the engine must create the real creature and
/// initialize its ordinary enemy state as well as its guardian state.
#[derive(Clone, Copy, Debug)]
pub struct GuardianSpawn {
    pub guid: u64,
    /// Capture the paired allocation before this spawn crosses a batched port.
    pub allocation_order: u64,
    pub lair_index: usize,
    pub enemy_index: usize,
    pub home: Position,
    pub clock_seconds: f32,
    pub health: f32,
    pub damage: f32,
    pub scale: f32,
    pub movement_speed: f32,
    pub attack_interval: f32,
    pub melee_reach: f32,
    pub initial_attack_delay: f32,
    pub facing: f32,
    pub ability_cooldowns: [f32; 3],
    /// The selected current signature list. Historical fixture creation leaves
    /// this absent and does not consume the newer constructor's random draw.
    pub signature_variant: Option<usize>,
}

/// Required boundary to the real engine. The native creation path is
/// synchronous; allocation failure is not converted into a made-up retry.
pub trait SpawnPort {
    fn create_guardian(&mut self, spawn: GuardianSpawn);
    fn announce_lair_refilled(&mut self, lair_index: usize, enemy_index: usize);
}

/// Native lair lifetime and guardian counter. Combat/death dispatch must call
/// `record_death` once at the recovered guardian branch in death processing.
pub struct Guardians {
    pub zone: &'static ZoneDefinition,
    lairs: Vec<Lair>,
    guardian_kills: u32,
}

impl Guardians {
    /// Run initialization after the native caller has admitted guardian lairs.
    /// Selection cycles through finite flagged enemies in definition order;
    /// zones with an explicit list (Naxxramas) use that list instead.
    pub fn initialize(
        zone: &'static ZoneDefinition,
        terrain: &impl placement::LairTerrain,
        suppressed: bool,
    ) -> Self {
        if suppressed {
            return Self::from_lairs(zone, Vec::new());
        }
        let candidates: Vec<_> = if zone.guardian_enemy_indices.is_empty() {
            zone.enemies
                .iter()
                .enumerate()
                .filter(|(_, enemy)| enemy.flag_4c == 1 && enemy.raw_48.is_finite())
                .map(|(index, _)| index)
                .collect()
        } else {
            zone.guardian_enemy_indices.to_vec()
        };
        assert!(
            !candidates.is_empty(),
            "selected native zone has no guardian candidates"
        );
        let positions = placement::make_lair_positions(zone, terrain);
        Self::from_lairs(
            zone,
            positions
                .into_iter()
                .enumerate()
                .map(|(slot, home)| Lair::new(candidates[slot % candidates.len()], home))
                .collect(),
        )
    }

    /// Lairs must come from the recovered placement/selection path, with the
    /// caller's actual terrain. No synthetic terrain or default zone is used.
    pub fn from_lairs(zone: &'static ZoneDefinition, lairs: Vec<Lair>) -> Self {
        assert!(lairs
            .iter()
            .all(|lair| lair.enemy_index < zone.enemies.len()));
        Self {
            zone,
            lairs,
            guardian_kills: 0,
        }
    }

    pub fn lairs(&self) -> &[Lair] {
        &self.lairs
    }
    pub fn guardian_kills(&self) -> u32 {
        self.guardian_kills
    }

    /// Current Game+7a4 belongs to the active hero, while lair placement and
    /// respawn state stay in the shared world. The live party adapter binds
    /// this counter before invoking the ordinary spawn/death owners.
    pub fn set_guardian_kills(&mut self, kills: u32) { self.guardian_kills = kills; }

    /// Called inside the native outer active-tick gate. `suppressed` is the
    /// separate Game+0x958 gate; it suppresses respawning, not death timers.
    /// The clock is the run clock, which the caller stops while paused.
    pub fn spawn_due(
        &mut self,
        input: ScalingInput,
        speed_percent: u16,
        suppressed: bool,
        guid_counter: &mut dyn crate::native_counter::NativeCounter,
        rng: &mut NativeRng,
        powf: impl FnMut(f32, f32) -> f32,
        port: &mut impl SpawnPort,
    ) {
        self.spawn_due_inner(input, speed_percent, suppressed, guid_counter, rng, powf, port, false);
    }

    /// Current signature choice belongs inside each lair's constructor; doing
    /// it after collecting every spawn would reorder the shared RNG stream.
    pub fn spawn_due_with_signatures(
        &mut self, input: ScalingInput, speed_percent: u16, suppressed: bool,
        guid_counter: &mut dyn crate::native_counter::NativeCounter,
        rng: &mut NativeRng, powf: impl FnMut(f32, f32) -> f32, port: &mut impl SpawnPort,
    ) {
        self.spawn_due_inner(input, speed_percent, suppressed, guid_counter, rng, powf, port, true);
    }

    fn spawn_due_inner(
        &mut self, input: ScalingInput, speed_percent: u16, suppressed: bool,
        guid_counter: &mut dyn crate::native_counter::NativeCounter,
        rng: &mut NativeRng, mut powf: impl FnMut(f32, f32) -> f32,
        port: &mut impl SpawnPort, current_signatures: bool,
    ) {
        if suppressed {
            return;
        }
        let input = ScalingInput {
            zone_scale: self.zone.scalar_e0,
            guardian_kills: self.guardian_kills,
            ..input
        };
        for (lair_index, lair) in self.lairs.iter_mut().enumerate() {
            if !lair.spawn_due(input.clock_seconds) {
                continue;
            }
            let definition = self.zone.enemies[lair.enemy_index];
            let health =
                guardian_health_with_powf(input, definition.base_hp, self.zone.hp_knots, &mut powf);
            let damage = guardian_damage_with_powf(input, definition.base_damage, &mut powf);
            let scale = definition.scale * 1.35;
            let (guid, allocation_order) =
                crate::native_counter::creature_guid_with_order(definition.id, guid_counter);
            let facing = rng.range_f32(0.0, f32::from_bits(0x40c9_0fdb));
            let signature_variant = current_signatures.then(||
                signatures::choose_variant(definition.id, || rng.next_u64()));
            port.create_guardian(GuardianSpawn {
                guid,
                allocation_order,
                lair_index,
                enemy_index: lair.enemy_index,
                home: lair.home,
                clock_seconds: input.clock_seconds,
                health,
                damage,
                scale,
                movement_speed: definition.raw_3c * (f32::from(speed_percent) / 100.0),
                attack_interval: definition.raw_38,
                melee_reach: scale * 1.2 + 2.2,
                initial_attack_delay: definition.raw_38 * 0.5,
                facing,
                ability_cooldowns: [4.5, 3.5, 8.0],
                signature_variant,
            });
            lair.active_guid = Some(guid);
            // Native suppresses the announcement for initial startup/early ticks.
            if input.clock_seconds > 21.0 {
                port.announce_lair_refilled(lair_index, lair.enemy_index);
            }
        }
    }

    /// Native death branch updates a valid lair; it increments the run counter
    /// even if the actor's lair index is out of range. Reward dispatch is owned
    /// by rewards.rs and the actual run's entity/death processing.
    pub fn record_death(&mut self, lair_index: usize, clock_seconds: f32) -> u32 {
        self.record_death_for_rank(lair_index, clock_seconds, 0)
    }

    pub fn record_death_for_rank(&mut self, lair_index: usize, clock_seconds: f32, heroic_rank: u8) -> u32 {
        if let Some(lair) = self.lairs.get_mut(lair_index) {
            lair.active_guid = None;
            lair.respawn_at = clock_seconds + crate::heroic::guardian_respawn_seconds(heroic_rank);
        }
        self.guardian_kills = self.guardian_kills.wrapping_add(1);
        self.guardian_kills
    }

    /// Called once by the actual actor death owner. This preserves lair/counter
    /// mutation before the ordered reward effects, without a replacement save,
    /// inventory, pickup list or modal UI inside the guardian component.
    pub fn guardian_died(
        &mut self,
        lair_index: usize,
        clock_seconds: f32,
        localized_name: &str,
        death_position: Position,
        port: &mut impl rewards::DeathPort,
    ) {
        self.guardian_died_for_rank(lair_index, clock_seconds, localized_name, death_position, port, 0);
    }

    pub fn guardian_died_for_rank(
        &mut self, lair_index: usize, clock_seconds: f32, localized_name: &str,
        death_position: Position, port: &mut impl rewards::DeathPort, heroic_rank: u8,
    ) {
        let kills = self.record_death_for_rank(lair_index, clock_seconds, heroic_rank);
        rewards::emit_guardian_death(
            kills,
            localized_name,
            [death_position.x, death_position.y, death_position.z],
            port,
        );
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn native_counter_wraps_instead_of_saturating() {
        let mut system = Guardians::from_lairs(&catalog::ZONES[0], Vec::new());
        system.guardian_kills = u32::MAX;
        assert_eq!(system.record_death(99, 0.0), 0);
    }
}
