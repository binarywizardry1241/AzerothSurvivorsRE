//! Native 0.100.1 treasure-cache spawning and population lifecycle.
//!
//! Target SHA-256:
//! 17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b.
//! Target native owners are identified alongside the recovered operations.
//! Catalog byte provenance: `docs/analysis/evidence/0.100.1/treasure-chests/catalog.json`.
//! Historical 0.92 native fixtures remain version-bound regression evidence.
//! This module is executable source, not a binary-layout or save-file adapter.
//! Terrain/entity/UI adapters and a shared RNG seed must come from the owning
//! gameplay engine. The binary adapter supplies placement and lifecycle;
//! the gameplay adapter supplies the current reward delivery and completion.

mod catalog;
pub use catalog::ZONES;

pub const CHEST_KIND: u32 = 2;
pub const CHEST_OBJECT_ENTRY: u32 = 9005;
pub const CHEST_MODEL_ID: u32 = 259;

#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Position {
    pub x: f32,
    pub y: f32,
    pub z: f32,
}

impl Position {
    pub const fn new(x: f32, y: f32, z: f32) -> Self {
        Self { x, y, z }
    }

    fn xy(self) -> [f32; 2] {
        [self.x, self.y]
    }

    // The proximity and candidate-clamp instructions use separate multiply,
    // add and sqrt operations, unlike the shared creator's hypotf call.
    fn planar_distance(self, other: Self) -> f32 {
        let x = self.x - other.x;
        let y = self.y - other.y;
        (x * x + y * y).sqrt()
    }
}

#[derive(Clone, Copy, Debug, Default)]
pub struct EnemyDefinition {
    pub id: u32,
    /// Original unsigned definition field +0x40, consumed by the XP drop branch.
    pub base_experience: u32,
    /// Original float field +0x44, added to the run's death accumulator.
    pub death_accumulator: f32,
    /// Original definition byte +0x4c. Its original source name is unknown.
    pub chest_flag: u8,
}

#[derive(Clone, Copy, Debug)]
pub struct ZoneDefinition {
    pub key: &'static str,
    pub center: Position,
    pub radius: f32,
    pub enemies: &'static [EnemyDefinition],
}

impl ZoneDefinition {
    pub fn by_key(key: &str) -> Option<&'static Self> {
        if key == crate::zones::scholomance::KEY {
            return Some(&SCHOLOMANCE_CACHE_ZONE);
        }
        ZONES.iter().find(|zone| zone.key == key)
    }

    /// Unknown IDs remain unknown; they are not silently classified as normal.
    pub fn enemy(&self, id: u32) -> Option<&EnemyDefinition> {
        self.enemies.iter().find(|enemy| enemy.id == id)
    }
}

static SCHOLOMANCE_CACHE_ZONE: ZoneDefinition = {
    use crate::zones::scholomance as school;
    const ENEMIES: [EnemyDefinition; school::ENEMIES.len()] = {
        let mut rows = [EnemyDefinition {
            id: 0, base_experience: 0, death_accumulator: 0.0, chest_flag: 0,
        }; school::ENEMIES.len()];
        let mut index = 0;
        while index < rows.len() {
            let row = school::ENEMIES[index];
            rows[index] = EnemyDefinition {
                id: row.id,
                base_experience: row.raw_40,
                death_accumulator: row.raw_44,
                chest_flag: row.flag_4c,
            };
            index += 1;
        }
        rows
    };
    ZoneDefinition {
        key: school::KEY,
        center: Position::new(school::SPAWN[0], school::SPAWN[1], school::SPAWN[2]),
        radius: school::RADIUS,
        enemies: &ENEMIES,
    }
};

/// The owning run's clock. Share this with all gameplay systems, rather than
/// advancing a second clock inside the chest timer. Native Game +0x8e4/+0x95f.
#[derive(Clone, Copy, Debug, Default)]
pub struct RunClock {
    pub elapsed: f32,
    /// Native tags: 0 before start, 1 running, 3 paused. Other states are opaque.
    pub state: u8,
}

/// Permission to run stages of a tick that entered the native active body.
/// Later state changes within that same frame do not revoke this token.
#[derive(Clone, Copy, Debug)]
pub struct ActiveTick(());

impl RunClock {
    pub fn is_running(&self) -> bool {
        self.state == 1
    }

    /// Call once at the start of the owning Game tick (0x14549d5f7).
    pub fn advance(&mut self, delta: f32) -> Option<ActiveTick> {
        if self.is_running() {
            self.elapsed += delta;
            Some(ActiveTick(()))
        } else {
            None
        }
    }

    pub fn pause(&mut self) {
        if self.is_running() {
            self.state = 3;
        }
    }

    pub fn resume(&mut self) {
        if self.state == 3 {
            self.state = 1;
        }
    }
}

/// Original four-word state and transition; no substitute seed generator.
/// The owning Game must share this state with its other random consumers.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct NativeRng {
    pub words: [u64; 4],
}

impl NativeRng {
    pub const fn from_words(words: [u64; 4]) -> Self {
        Self { words }
    }

    /// Shared native xoshiro256++ transition. Other loot systems consume this
    /// same state; they must not seed or maintain an independent copy.
    pub fn next_u64(&mut self) -> u64 {
        let [mut a, mut b, mut c, mut d] = self.words;
        let result = a.wrapping_add(d).rotate_left(23).wrapping_add(a);
        let shifted = b << 17;
        c ^= a;
        d ^= b;
        b ^= c;
        a ^= d;
        c ^= shifted;
        d = d.rotate_left(45);
        self.words = [a, b, c, d];
        result
    }

    /// 0x1454f97c0: a 23-bit mantissa draw and scalar f32 multiply/add.
    /// These are the finite increasing ranges used by chest placement.
    pub fn range_f32(&mut self, lower: f32, upper: f32) -> f32 {
        assert!(lower < upper && (upper - lower).is_finite());
        let width = upper - lower;
        loop {
            let unit = f32::from_bits(0x3f80_0000 | (self.next_u64() >> 41) as u32) - 1.0;
            let scaled = unit * width;
            let result = scaled + lower;
            if result < upper {
                return result;
            }
        }
    }
}

/// Navigation mask already supplied by the engine. Its construction from MPQs
/// is outside the recovered chest algorithm. Nonzero in-range cells reject a
/// regular sample; outside-grid samples continue to the height query.
#[derive(Clone, Copy, Debug)]
pub struct BlockedGrid<'a> {
    pub origin: [f32; 2],
    pub side: usize,
    pub cells: &'a [u8],
}

impl BlockedGrid<'_> {
    fn rejects(&self, xy: [f32; 2]) -> bool {
        let x = xy[0] - self.origin[0];
        let y = xy[1] - self.origin[1];
        if x < 0.0 || y < 0.0 {
            return false;
        }
        let x = x as usize;
        let y = y as usize;
        if x >= self.side || y >= self.side {
            return false;
        }
        // Like the native Vec bounds check: malformed grid lengths fail here,
        // rather than quietly treating a missing in-range cell as clear.
        self.cells[self.side.wrapping_mul(y).wrapping_add(x)] != 0
    }
}

pub trait Terrain {
    /// Original primary height query 0x1454627f0, including surface rules.
    fn height(&mut self, xy: [f32; 2]) -> Option<f32>;
    /// Optional secondary provider 0x145467bf0. Return None when the native
    /// resource has no provider (tag -1), or its query result tag is not 1.
    /// Regular candidate retries use only the primary query. The final sample,
    /// projected creator query, final creator query and enemy offset use this
    /// provider only when their primary query returned None.
    fn secondary_height(&mut self, xy: [f32; 2]) -> Option<f32>;
    fn fallback_height(&self) -> f32;
    fn blocked_grid(&self) -> Option<BlockedGrid<'_>>;
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ChestSpawn {
    pub position: Position,
    pub object_entry: u32,
    pub model_id: u32,
    pub scale: f32,
    pub object_type: u8,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ChestMessage {
    /// Localized native key: "This cache needs {n} gold."
    NeedsGold { n: u32 },
    /// Localized native key: "Right-click a cache to buy it."
    ClickRequired,
}

/// Required ports to the owning engine. There are no dummy production
/// implementations: a menu build alone cannot render/interact with chests.
pub trait ChestWorld {
    fn spawn_chest(&mut self, spawn: ChestSpawn) -> u64;
    /// Production object creation consumes the owning run's yaw draw
    /// (0.97.2 creator1454d2850). Recorder ports can retain the simpler hook.
    fn spawn_chest_with_rng(&mut self, spawn: ChestSpawn, _rng: &mut NativeRng) -> u64 {
        self.spawn_chest(spawn)
    }
    fn remove_entities(&mut self, primary: u64, auxiliary: &[u64]);
    /// Native update field key 0x498, remaining gold multiplied by 10000.
    fn gold_field_changed(&mut self, value: u32);
    /// Native queued client command tag 0x2d2, value 0x4b4 after purchase.
    fn client_command(&mut self, tag: u16, value: u32);
    fn message(&mut self, message: ChestMessage);
    /// Connect to the native-equivalent choice owner. It may change the live
    /// run state; later purchases in the same gathered batch see that state.
    fn request_cache_choice(&mut self, clock: &mut RunClock);
}

/// Shared pickup-list view: non-chest kinds may coexist in the same Vec.
/// Source layout is intentionally not represented as the native 72-byte ABI.
#[derive(Clone, Debug)]
pub struct Pickup {
    pub kind: u32,
    pub entity: u64,
    pub auxiliary_entities: Vec<u64>,
    pub position: Position,
    pub created_at: f32,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct CreatedChest {
    pub entity: u64,
    pub evicted: Option<u64>,
}

/// All inputs shared with the actual Game; no map, entity IDs, or RNG seed is
/// manufactured by the chest subsystem.
pub struct ChestField<'a, T, W> {
    pub player: Position,
    pub zone: &'a ZoneDefinition,
    pub terrain: &'a mut T,
    pub world: &'a mut W,
    pub rng: &'a mut NativeRng,
    pub pickups: &'a mut Vec<Pickup>,
}

/// At five or more chests, select one minimum timestamp using float total
/// ordering; equal timestamps preserve the first record (0x1454c83e7).
pub fn chest_to_evict(pickups: &[Pickup]) -> Option<usize> {
    if pickups.iter().filter(|p| p.kind == CHEST_KIND).count() < 5 {
        return None;
    }
    let mut oldest: Option<usize> = None;
    for (index, pickup) in pickups.iter().enumerate() {
        if pickup.kind == CHEST_KIND
            && oldest.is_none_or(|old| {
                pickup
                    .created_at
                    .total_cmp(&pickups[old].created_at)
                    .is_lt()
            })
        {
            oldest = Some(index);
        }
    }
    oldest
}

impl<T: Terrain, W: ChestWorld> ChestField<'_, T, W> {
    /// 0x1454c2a20: 12 regular candidates, then one less-restricted fallback.
    pub fn sample_position(&mut self) -> Position {
        for _ in 0..12 {
            let candidate = self.draw_near_player();
            let candidate = clamp_sqrt(candidate, self.zone, self.zone.radius);
            if self
                .terrain
                .blocked_grid()
                .is_some_and(|grid| grid.rejects(candidate.xy()))
            {
                continue;
            }
            if let Some(height) = self.terrain.height(candidate.xy()) {
                if (height - self.player.z).abs() < 25.0 {
                    return Position {
                        z: height,
                        ..candidate
                    };
                }
            }
        }
        // Native fallback deliberately skips the mask, height-difference and
        // helper boundary checks. The shared creator still clamps afterward.
        let candidate = self.draw_near_player();
        let z = resolved_height(self.terrain, candidate.xy());
        Position { z, ..candidate }
    }

    fn draw_near_player(&mut self) -> Position {
        let angle = self.rng.range_f32(0.0, std::f32::consts::TAU);
        let radius = self.rng.range_f32(18.0, 50.0);
        Position::new(
            self.player.x + radius * angle.cos(),
            self.player.y + radius * angle.sin(),
            self.player.z,
        )
    }

    /// Shared kind-2 creation arm 0x1454c825c. All sources use this path.
    pub fn create_chest(&mut self, requested: Position, clock: &RunClock) -> CreatedChest {
        let x = requested.x - self.zone.center.x;
        let y = requested.y - self.zone.center.y;
        let radius = (self.zone.radius - 2.0).max(1.0);
        let length = x.hypot(y);
        let mut position = requested;
        if length > radius {
            position.x = self.zone.center.x + (x / length) * radius;
            position.y = self.zone.center.y + (y / length) * radius;
            // Preserve the original projected-position query, even though the
            // shared arm performs another height query before entity creation.
            let _ = resolved_height(self.terrain, position.xy());
        }
        let evicted = chest_to_evict(self.pickups).map(|index| self.remove(index).entity);
        position.z = resolved_height(self.terrain, position.xy());
        let entity = self.world.spawn_chest_with_rng(
            ChestSpawn {
                position,
                object_entry: CHEST_OBJECT_ENTRY,
                model_id: CHEST_MODEL_ID,
                scale: 1.0,
                object_type: 3,
            },
            self.rng,
        );
        self.pickups.push(Pickup {
            kind: CHEST_KIND,
            entity,
            auxiliary_entities: Vec::new(),
            position,
            created_at: clock.elapsed,
        });
        CreatedChest { entity, evicted }
    }

    fn spawn_near_player(&mut self, clock: &RunClock) -> CreatedChest {
        let position = self.sample_position();
        self.create_chest(position, clock)
    }

    fn remove(&mut self, index: usize) -> Pickup {
        // Vec::remove preserves record order, matching native memmove rather
        // than swap_remove; this matters for equal-timestamp eviction.
        let pickup = self.pickups.remove(index);
        self.world
            .remove_entities(pickup.entity, &pickup.auxiliary_entities);
        pickup
    }
}

/// Native height chain 0x1454606b0, also inlined by sample/creation owners.
/// Primary and secondary absence are distinct from a valid height of zero.
fn resolved_height(terrain: &mut impl Terrain, xy: [f32; 2]) -> f32 {
    terrain
        .height(xy)
        .or_else(|| terrain.secondary_height(xy))
        .unwrap_or_else(|| terrain.fallback_height())
}

fn clamp_sqrt(candidate: Position, zone: &ZoneDefinition, radius: f32) -> Position {
    let length = candidate.planar_distance(zone.center);
    if length > radius {
        Position::new(
            zone.center.x + ((candidate.x - zone.center.x) / length) * radius,
            zone.center.y + ((candidate.y - zone.center.y) / length) * radius,
            candidate.z,
        )
    } else {
        candidate
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum TimedAttempt {
    NotDue,
    PopulationFull,
    Created(CreatedChest),
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Interaction {
    Ignored,
    ClickRequired,
    InsufficientGold,
    Purchased { entity: u64, paid: u32 },
}

#[derive(Clone, Debug)]
pub struct ChestSystem {
    pub heroic_rank: u8,
    pub next_attempt: f32,
    pub price: u32,
    pub bought: u32,
    pub pending_choices: u32,
    pub cache_on_click: bool,
    pub click_hint_shown: bool,
    pub last_gold_message: f32,
    /// Recovered Game +0x958. Default off; its enable path and extra pickup
    /// batch owner are unresolved. This flag only suppresses choice requests.
    pub extra_pickup_mode: bool,
}

impl Default for ChestSystem {
    fn default() -> Self {
        Self {
            heroic_rank: 0,
            next_attempt: 60.0,
            price: 20,
            bought: 0,
            pending_choices: 0,
            cache_on_click: false,
            click_hint_shown: false,
            last_gold_message: 0.0,
            extra_pickup_mode: false,
        }
    }
}

impl ChestSystem {
    pub fn for_rank(heroic_rank: u8) -> Self {
        Self { heroic_rank, price: crate::heroic::cache_initial_price(heroic_rank), ..Self::default() }
    }

    /// Native deferred start is accepted in state 0 only. A fresh Game owns a
    /// fresh clock, pickups and ChestSystem; this does not invent a restart reset.
    pub fn start_run<T: Terrain, W: ChestWorld>(
        &mut self,
        clock: &mut RunClock,
        field: &mut ChestField<'_, T, W>,
    ) -> bool {
        if clock.state != 0 {
            return false;
        }
        clock.state = 1;
        field.spawn_near_player(clock);
        field.spawn_near_player(clock);
        true
    }

    /// Call if the owning Game reaches its timer stage in this active tick.
    /// The native branch does not recheck run state after earlier systems may
    /// have changed it. One attempt, no catch-up loop (0x1454a95ea).
    pub fn timed_attempt<T: Terrain, W: ChestWorld>(
        &mut self,
        clock: &RunClock,
        _tick: ActiveTick,
        field: &mut ChestField<'_, T, W>,
    ) -> TimedAttempt {
        if !(clock.elapsed >= self.next_attempt) {
            return TimedAttempt::NotDue;
        }
        self.next_attempt = clock.elapsed + 70.0;
        if field
            .pickups
            .iter()
            .filter(|p| p.kind == CHEST_KIND)
            .count()
            >= 3
        {
            TimedAttempt::PopulationFull
        } else {
            TimedAttempt::Created(field.spawn_near_player(clock))
        }
    }

    /// Invoke once from the eligible native-equivalent enemy death path, not
    /// from every damage event or a boss/guardian reward callback.
    pub fn enemy_death<T: Terrain, W: ChestWorld>(
        &mut self,
        clock: &RunClock,
        definition: &EnemyDefinition,
        position: Position,
        field: &mut ChestField<'_, T, W>,
    ) -> Option<CreatedChest> {
        if definition.chest_flag == 0 {
            return None;
        }
        let mut position = Position::new(position.x + 2.0, position.y - 1.0, position.z);
        position.z = resolved_height(field.terrain, position.xy());
        Some(field.create_chest(position, clock))
    }

    /// Walking candidates are collected once then processed in reverse. The
    /// owning engine may change run state while opening a choice in this batch.
    pub fn walk<T: Terrain, W: ChestWorld>(
        &mut self,
        clock: &mut RunClock,
        _tick: ActiveTick,
        gold: &mut u32,
        field: &mut ChestField<'_, T, W>,
    ) -> u32 {
        let candidates: Vec<_> = field
            .pickups
            .iter()
            .enumerate()
            .filter(|(_, p)| {
                p.kind == CHEST_KIND && p.position.planar_distance(field.player) <= 3.0
            })
            .map(|(index, _)| index)
            .collect();
        let mut purchases = 0;
        for index in candidates.into_iter().rev() {
            if self.cache_on_click {
                if !self.click_hint_shown {
                    self.click_hint_shown = true;
                    field.world.message(ChestMessage::ClickRequired);
                }
            } else if matches!(
                self.buy(index, clock, gold, field),
                Interaction::Purchased { .. }
            ) {
                purchases += 1;
            }
        }
        purchases
    }

    /// Explicit cache interaction: current active state, matching chest entity,
    /// and at most 10 planar units. The click-only setting is not a requirement.
    pub fn click<T: Terrain, W: ChestWorld>(
        &mut self,
        clock: &mut RunClock,
        gold: &mut u32,
        entity: u64,
        field: &mut ChestField<'_, T, W>,
    ) -> Interaction {
        if !clock.is_running() {
            return Interaction::Ignored;
        }
        let Some(index) = field
            .pickups
            .iter()
            .position(|p| p.entity == entity && p.kind == CHEST_KIND)
        else {
            return Interaction::Ignored;
        };
        if field.pickups[index].position.planar_distance(field.player) > 10.0 {
            return Interaction::Ignored;
        }
        self.buy(index, clock, gold, field)
    }

    fn buy<T: Terrain, W: ChestWorld>(
        &mut self,
        index: usize,
        clock: &mut RunClock,
        gold: &mut u32,
        field: &mut ChestField<'_, T, W>,
    ) -> Interaction {
        if *gold < self.price {
            if clock.elapsed - self.last_gold_message > 4.0 {
                self.last_gold_message = clock.elapsed;
                field
                    .world
                    .message(ChestMessage::NeedsGold { n: self.price });
            }
            return Interaction::InsufficientGold;
        }
        let paid = self.price;
        *gold -= paid;
        // Preserve separate scalar f32 operations and Rust's saturating cast.
        let multiplied = paid as f32 * 1.3_f32;
        self.price = (multiplied + crate::heroic::cache_cost_increment(self.heroic_rank)) as u32;
        field.world.gold_field_changed(coinage(*gold));
        self.bought = self.bought.wrapping_add(1);
        self.pending_choices = self.pending_choices.wrapping_add(1);
        let pickup = field.remove(index);
        field.world.client_command(0x2d2, 0x4b4);
        if clock.is_running() && self.pending_choices != 0 && !self.extra_pickup_mode {
            field.world.request_cache_choice(clock);
        }
        Interaction::Purchased {
            entity: pickup.entity,
            paid,
        }
    }
}

/// Current world positions for the native AZSCHESTS adapter. Its exact float
/// string formatting, minimap conversion and delivery schedule remain owned by
/// the future addon bridge; no substitute serialization is introduced here.
pub fn chest_positions(pickups: &[Pickup]) -> impl Iterator<Item = (u32, Position)> + '_ {
    pickups
        .iter()
        .filter(|p| p.kind == CHEST_KIND)
        .map(|p| (p.entity as u32, p.position))
}

/// Current1454e56e1 publishes the wrapping copper value in player field1176.
pub fn coinage(gold: u32) -> u32 { gold.wrapping_mul(10000) }

#[cfg(test)]
mod coinage_tests {
    #[test]
    fn player_coinage_matches_current_native_wrapping_values() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.100.1/cache-feedback/native.json"
        )).unwrap();
        for row in fixture["coinage"].as_array().unwrap() {
            assert_eq!(super::coinage(row["gold"].as_u64().unwrap() as u32),
                row["copper"].as_u64().unwrap() as u32);
        }
    }
}
