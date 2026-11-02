//! Native30 player-bomb contracts; authored without compiling/running Rust.
use azeroth_survivors_re::{bosses::{abilities::*, raid_area_catalog::current_schedule,
    raid_areas::Pending, raid_warnings::RaidWarning, NativeRng, Position, RawBossAbility},
    enemies::ai::HostMath, native_counter::NativeCounter};
use serde_json::Value;

#[derive(Default)]
struct Port {
    player: Position, markers: Vec<Value>, casts: Vec<SpellCast>,
    warnings: Vec<RaidWarning>, starts: Vec<(u32, f32)>, blocks: Vec<f32>,
    player_damage: Vec<(f32, u64)>, bursts: Vec<(Position, f32, f32, u32)>,
    order: Vec<&'static str>,
}
impl CombatPort for Port {
    fn raid_marker(&mut self, v: Value) { self.markers.push(v); self.order.push("marker"); }
    fn raid_source(&self, _: u64) -> Option<Position> { Some(context().source) }
    fn raid_damage_multiplier(&self) -> f32 { 2.0 }
    fn raid_warning(&mut self, _: u64, v: RaidWarning) { self.warnings.push(v); }
    fn raid_bomb_damage(&mut self, center: Position, radius: f32, damage: f32, spell: u32) {
        self.bursts.push((center, radius, damage, spell)); self.order.push("burst");
    }
    fn raid_block(&mut self, _: u64, seconds: f32) { self.blocks.push(seconds); }
    fn raid_cast(&mut self, _: u64, spell: u32, seconds: f32) { self.starts.push((spell, seconds)); }
    fn raid_hold(&mut self, _: u64, _: f32) { panic!("native30 has no movement hold"); }
    fn primary_height(&mut self, _: [f32; 2]) -> Option<f32> { Some(4.0) }
    fn secondary_height(&mut self, _: [f32; 2]) -> Option<f32> { unreachable!(); }
    fn fallback_height(&self) -> f32 { unreachable!(); }
    fn ray_fraction(&mut self, _: Position, _: Position) -> Option<f32> { unreachable!(); }
    fn cast_spell(&mut self, v: SpellCast) { self.casts.push(v); self.order.push("spell"); }
    fn create_ground_object(&mut self, _: GroundObject) { panic!("bomb has no dynamic object"); }
    fn remove_ground_object(&mut self, _: u64) { unreachable!(); }
    fn spawn_minion(&mut self, _: MinionSpawn, _: &mut NativeRng, _: &mut dyn NativeCounter) { unreachable!(); }
    fn begin_charge(&mut self, _: Charge) { unreachable!(); }
    fn yell(&mut self, _: u64, _: &'static str) { panic!("warning uses native raid emote"); }
    fn player_position(&self) -> Position { self.player }
    fn damage_player(&mut self, amount: f32, source: u64) {
        self.player_damage.push((amount, source)); self.order.push("player-damage");
    }
}
fn point(x: f32) -> Position { Position { x, y: 0.0, z: 4.0 } }
fn context() -> CombatContext { CombatContext { source_guid: 77, player_guid: 1,
    source: point(100.0), player: point(20.0), now: 10.0, effective_damage: 100.0 } }
fn bomb(id: u32) -> RawBossAbility {
    current_schedule(id).unwrap().moves.iter().find(|v| v.native_tag == 30).unwrap().ability
}

#[test]
fn initial_spell_and_warning_are_separate_from_later_ground_explosion() {
    let mut pending = Pending::default(); let mut port = Port::default();
    assert!(pending.dispatch_current(&bomb(192), context(), &mut port, &HostMath));
    assert_eq!(port.blocks, [5.0]); assert_eq!(port.starts, [(20475, 5.0)]);
    assert_eq!(port.warnings, [RaidWarning::Bomb]); assert!(port.markers.is_empty());
    assert_eq!(port.casts, [SpellCast { source_guid: 77, spell_id: 20475,
        target: CastTarget::Unit(1), hit_targets: vec![1] }]);
    assert!(port.bursts.is_empty() && port.player_damage.is_empty());
}

#[test]
fn player_follow_locks_strictly_and_keeps_publishing_move_rows_after_lock() {
    let mut pending = Pending::default(); let mut port = Port { player: point(1.0), ..Default::default() };
    pending.dispatch_current(&bomb(192), context(), &mut port, &HostMath);
    pending.tick(10.1, &mut port); assert_eq!(port.markers[0]["x"], 1.0);
    port.player = point(10.0); pending.tick(13.3, &mut port);
    port.markers.clear(); port.player = point(100.0);
    // Native follows only before now+max(5-1.6,0), never at equality.
    let lock = (5.0_f32 - 1.6_f32) + 10.0_f32;
    pending.tick(lock, &mut port);
    assert_eq!(port.markers.last().unwrap()["m"][0][1], 10.0);
    assert_eq!(port.markers.last().unwrap()["m"][0][4], 0.0);
    port.markers.clear(); pending.tick(14.9, &mut port);
    assert_eq!(port.markers.last().unwrap()["m"][0][1], 10.0);
    pending.tick(15.0, &mut port);
    assert_eq!(port.bursts, [(point(10.0), 7.0, 1500.0, 20475)]);
    assert!(port.player_damage.is_empty());
    assert_eq!(port.casts[1].target, CastTarget::Ground(point(10.0)));
}

#[test]
fn late_first_tick_keeps_captured_center_and_enemy_burst_does_not_require_player_hit() {
    let mut pending = Pending::default(); let mut port = Port { player: point(100.0), ..Default::default() };
    pending.dispatch_current(&bomb(193), context(), &mut port, &HostMath);
    pending.tick(16.0, &mut port);
    assert_eq!(port.bursts, [(point(20.0), 7.0, 1800.0, 21056)]);
    assert!(port.player_damage.is_empty());
    assert!(port.markers.iter().all(|v| v["type"] == "hzt"));
    pending.tick(20.0, &mut port); assert_eq!(port.bursts.len(), 1);
}

#[test]
fn player_damage_uses_encounter_multiplier_and_precedes_unscaled_enemy_burst() {
    let mut pending = Pending::default(); let mut port = Port { player: point(20.0), ..Default::default() };
    pending.dispatch_current(&bomb(192), context(), &mut port, &HostMath);
    port.order.clear(); pending.tick(15.0, &mut port);
    assert_eq!(port.player_damage, [(360.0, 77)]);
    assert_eq!(port.bursts, [(point(20.0), 7.0, 1500.0, 20475)]);
    let player = port.order.iter().position(|v| *v == "player-damage").unwrap();
    let burst = port.order.iter().position(|v| *v == "burst").unwrap();
    assert!(player < burst);
}

#[test]
fn all_three_native_bomb_slots_preserve_distinct_enemy_factor_and_repeat() {
    for (boss, slot, spell, enemy_factor, repeat) in [(192, 1, 20475, 15.0, 14.0),
        (193, 3, 21056, 18.0, 18.0), (1494, 5, 27819, 20.0, 16.0)] {
        let row = current_schedule(boss).unwrap().moves.iter().find(|v| v.native_tag == 30).unwrap();
        assert_eq!(row.native_slot, slot); assert_eq!(row.ability.words[0..2], [12, spell]);
        assert_eq!(f32::from_bits(row.ability.words[5]), enemy_factor);
        assert_eq!(f32::from_bits(row.ability.words[6]), repeat);
    }
}

#[test]
fn mixed_tower_and_bomb_end_messages_follow_original_vector_indices() {
    let mut pending = Pending::default();
    let mut port = Port { player: point(100.0), ..Default::default() };
    let mut rng = NativeRng::from_words([1, 2, 3, 4]);
    let tower = RawBossAbility { words: [13, 1, 0, 0, 0, 0, 0] };
    pending.dispatch_current_with_rng(&tower, context(), &mut port, &mut rng, &HostMath);
    pending.dispatch_current(&bomb(192), context(), &mut port, &HostMath);
    pending.tick(10.1, &mut port);
    port.markers.clear(); pending.tick(15.0, &mut port);
    let ended: Vec<_> = port.markers.iter().filter(|v| v["type"] == "hzend")
        .map(|v| v["id"].as_u64().unwrap()).collect();
    assert_eq!(ended, [4, 3, 2, 1]);
}

#[test]
fn failed_tower_groups_add_to_existing_damage_in_native_float_order() {
    let mut pending = Pending::default();
    let mut port = Port { player: point(100.0), ..Default::default() };
    let mut circle_context = context();
    circle_context.player = point(100.0);
    circle_context.effective_damage = 16_777_216.0;
    let circle = RawBossAbility { words: [5, 0, 0, 1.0_f32.to_bits(),
        5.0_f32.to_bits(), 1.0_f32.to_bits(), 0] };
    pending.dispatch(&circle, circle_context, &mut port);
    let tower = RawBossAbility { words: [13, 1, 0, 0, 0, 0, 0] };
    let mut tower_context = context(); tower_context.player = point(0.0);
    tower_context.effective_damage = 0.2; // factor5 gives one damage per failed group.
    let mut rng = NativeRng::from_words([1, 2, 3, 4]);
    for _ in 0..2 {
        pending.dispatch_current_with_rng(&tower, tower_context, &mut port, &mut rng, &HostMath);
    }
    pending.tick(15.0, &mut port);
    assert_eq!(port.player_damage, [(33_554_432.0, 77)]);
}
