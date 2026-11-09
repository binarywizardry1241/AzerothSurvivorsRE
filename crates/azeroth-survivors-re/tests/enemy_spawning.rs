//! Authored source tests for later compilation; not run in static recovery mode.
use azeroth_survivors_re::enemies::{catalog::ZoneDefinition, spawning::*, waves::*, NativeRng, Position};
use serde_json::Value;

fn fixtures() -> Value {
    serde_json::from_str(include_str!("../../../docs/analysis/evidence/enemies/spawning-fixtures.json")).unwrap()
}
fn number(row: &Value, key: &str) -> u32 { row[key].as_u64().unwrap() as u32 }
fn float(row: &Value, key: &str) -> f32 { f32::from_bits(number(row, key)) }
fn input() -> TickInput<'static> {
    TickInput { clock_seconds: 0.0, delta_seconds: 0.0, density_percent: 100,
        effective_minutes: 0.0,
        cooperative_density: None,
        active_bosses: &[], suppressed: false, endless: false,
        endless_phase_one: false, endless_started_at: 0.0 }
}

#[test]
fn selected_native_admission_and_weights() {
    let native = fixtures();
    for row in native["admission"].as_array().unwrap() {
        let zone = ZoneDefinition::by_key(row["zone"].as_str().unwrap()).unwrap();
        let indices = admitted_enemy_indices(zone, float(row, "minutes_bits"));
        assert_eq!(indices.contains(&(number(row, "enemy_index") as usize)), row["admitted"].as_bool().unwrap());
    }
    for row in native["weights"].as_array().unwrap() {
        let zone = ZoneDefinition::by_key(row["zone"].as_str().unwrap()).unwrap();
        let enemy = &zone.enemies[number(row, "enemy_index") as usize];
        assert_eq!(selection_weight(enemy, float(row, "minutes_bits")).to_bits(), number(row, "weight_bits"));
    }
}

#[test]
fn selected_native_budget_arithmetic() {
    let native = fixtures();
    for row in native["budget"].as_array().unwrap() {
        let bosses: Vec<_> = match row["boss"].as_bool() {
            Some(false) => vec![ActiveBoss::Ordinary], Some(true) => vec![ActiveBoss::Flagged], None => vec![],
        };
        let clock_seconds = float(row, "clock_bits");
        let input = TickInput { clock_seconds, effective_minutes: clock_seconds / 60.0,
            delta_seconds: float(row, "delta_bits"),
            density_percent: number(row, "density") as u16, active_bosses: &bosses,
            endless: row["endless"].as_bool().unwrap(), endless_phase_one: row["phase_one"].as_bool().unwrap(),
            endless_started_at: float(row, "start_bits"), ..input() };
        let mut spawner = OrdinarySpawner { budget: float(row, "initial_bits") };
        // Native retained range starts after the external expf result; credit
        // is already decayed. A factor of one isolates the original arithmetic.
        let mut credit = float(row, "credit_bits");
        spawner.advance_budget_with_expf(input, &mut credit, |_| 1.0);
        assert_eq!(spawner.budget.to_bits(), number(row, "budget_bits"));
    }
    for row in native["population"].as_array().unwrap() {
        let factor = float(row, "boss_factor_bits");
        let bosses: Vec<_> = if factor == 0.3 { vec![ActiveBoss::Flagged] }
            else if factor == 0.45 { vec![ActiveBoss::Ordinary] } else { vec![] };
        let clock_seconds = float(row, "minutes_bits") * 60.0;
        let input = TickInput { clock_seconds, effective_minutes: clock_seconds / 60.0,
            density_percent: number(row, "density") as u16, active_bosses: &bosses, ..input() };
        assert_eq!(population_target(input).saturating_sub(number(row, "live") as usize), number(row, "missing") as usize);
    }
}

#[test]
fn native_uniform_formations_and_intervals() {
    let native = fixtures();
    for row in native["uniform"].as_array().unwrap() {
        let mut words = [0; 4];
        for (index, value) in row["state"].as_array().unwrap().iter().enumerate() { words[index] = value.as_u64().unwrap(); }
        let mut rng = NativeRng::from_words(words);
        assert_eq!(uniform_index(number(row, "count") as usize, &mut rng), number(row, "index") as usize);
        for (index, value) in row["state_after"].as_array().unwrap().iter().enumerate() { assert_eq!(rng.words[index], value.as_u64().unwrap()); }
    }
    for row in native["formations"].as_array().unwrap() {
        let pattern = match row["kind"].as_str().unwrap() {
            "count-swarm" => Pattern::Swarm, "count-wall" => Pattern::Wall, "count-pack" => Pattern::Pack, _ => unreachable!(),
        };
        assert_eq!(formation_count(pattern, float(row, "minutes_bits"), number(row, "density") as u16), number(row, "count") as usize);
    }
    for row in native["intervals"].as_array().unwrap() {
        let minutes = float(row, "minutes_bits");
        assert_eq!((elite_interval(minutes) + minutes * 60.0).to_bits(), number(row, "elite_at_bits"));
        assert_eq!((pattern_interval(minutes) + minutes * 60.0).to_bits(), number(row, "pattern_at_bits"));
    }
}

#[derive(Default)]
struct Counter { live: usize, ordinary: usize, indices: Vec<usize> }
impl SpawnPort for Counter {
    fn live_entity_count(&self) -> usize { self.live }
    fn live_ordinary_count(&self) -> usize { self.ordinary }
    fn create_enemy(&mut self, enemy_index: usize, _: &mut NativeRng) {
        self.indices.push(enemy_index); self.live += 1; self.ordinary += 1;
    }
}

#[test]
fn initial_budget_and_top_up_share_live_state_and_cap() {
    let zone = ZoneDefinition::by_key("elwynn").unwrap();
    let mut spawner = OrdinarySpawner::new();
    let mut credit = 0.0;
    let mut rng = NativeRng::from_words([1,2,3,4]);
    let mut port = Counter::default();
    let result = spawner.tick_with_expf(zone, input(), &mut rng, &mut credit, |_| 1.0, &mut port);
    assert_eq!(result, SpawnedThisTick { budget: 3, population: 1 });
    assert_eq!(port.live, 4);
    assert!(port.indices.iter().all(|&index| index == 0));
    assert_eq!(spawner.budget, 0.0);
    let mut full = Counter { live: 50, ..Counter::default() };
    spawner.budget = 100.0;
    let result = spawner.tick_with_expf(zone, input(), &mut rng, &mut credit, |_| 1.0, &mut full);
    assert_eq!(result, SpawnedThisTick::default());
    assert_eq!(spawner.budget, 1.0);
    assert_eq!(full.live, 50);
}

#[test]
fn suppressed_tick_preserves_shared_credit_budget_and_rng() {
    let zone = ZoneDefinition::by_key("elwynn").unwrap();
    let mut spawner = OrdinarySpawner::new();
    let mut credit = 12.0;
    let mut rng = NativeRng::from_words([1,2,3,4]);
    let before = rng;
    let mut port = Counter::default();
    spawner.tick_with_expf(zone, TickInput { suppressed: true, ..input() }, &mut rng, &mut credit,
        |_| panic!("suppressed native stage must not call expf"), &mut port);
    assert_eq!(credit, 12.0); assert_eq!(spawner.budget, 3.0); assert_eq!(rng, before);
    assert!(port.indices.is_empty());
    assert_eq!(WaveTimers::new(), WaveTimers { elite_at: 240.0, wave_at: 60.0, previous_pattern: 255 });
}

struct FlatTerrain { calls: usize }
impl Terrain for FlatTerrain {
    fn height(&mut self, _: [f32;2]) -> Option<f32> { self.calls += 1; Some(0.0) }
    fn secondary_height(&mut self, _: [f32;2]) -> Option<f32> { panic!("primary surface exists") }
    fn fallback_height(&self) -> f32 { panic!("primary surface exists") }
    fn blocked_grid(&self) -> Option<BlockedGrid<'_>> { None }
    fn path_grid(&self) -> Option<PathGrid<'_>> { None }
}
struct AxisMath;
impl PlacementMath for AxisMath {
    fn cos(&mut self, _:f32) -> f32 { 1.0 }
    fn sin(&mut self, _:f32) -> f32 { 0.0 }
    fn atan2(&mut self, _:f32, _:f32) -> f32 { 0.0 }
    fn hypot(&mut self, x:f32, y:f32) -> f32 { (x*x+y*y).sqrt() }
}

#[test]
fn primary_sampler_uses_ordinary_ring_and_real_height_query() {
    let zone = ZoneDefinition::by_key("elwynn").unwrap();
    let player = Position::from(zone.center);
    let player = Position { z: 0.0, ..player };
    let mut terrain = FlatTerrain { calls: 0 };
    let mut rng = NativeRng::from_words([1,2,3,4]);
    let position = sample_position(zone, player, [0.0,0.0], 0.5, &mut rng, &mut terrain, &mut AxisMath);
    assert!((26.0..36.0).contains(&(position.x-player.x)));
    assert_eq!(position.y, player.y); assert_eq!(position.z, 0.0); assert_eq!(terrain.calls, 1);
}
