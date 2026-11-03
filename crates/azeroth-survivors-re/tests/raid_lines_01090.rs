//! Native7/35 source integration cases, authored without compilation or game use.
use azeroth_survivors_re::{
    bosses::{abilities::*, raid_area_catalog::current_schedule, raid_areas::Pending,
        NativeRng, Position, RawBossAbility},
    enemies::ai::HostMath,
    native_counter::NativeCounter,
};
use serde_json::Value;

#[derive(Default)]
struct Port {
    player: Position,
    source: Option<Position>,
    scale: f32,
    height: Option<f32>,
    fraction: Option<f32>,
    markers: Vec<Value>,
    charges: Vec<Charge>,
    casts: Vec<SpellCast>,
    holds: Vec<(f32, f32)>,
    blocks: Vec<f32>,
    starts: Vec<(u32, f32)>,
    damage: Vec<(f32, u64)>,
    order: Vec<&'static str>,
}
impl CombatPort for Port {
    fn raid_marker(&mut self, v: Value) { self.markers.push(v); self.order.push("marker"); }
    fn raid_source(&self, _: u64) -> Option<Position> { self.source }
    fn raid_source_scale(&self, _: u64) -> f32 { self.scale }
    fn raid_hold_facing(&mut self, _: u64, seconds: f32, angle: f32) { self.holds.push((seconds, angle)); }
    fn raid_block(&mut self, _: u64, seconds: f32) { self.blocks.push(seconds); }
    fn raid_cast(&mut self, _: u64, spell: u32, seconds: f32) { self.starts.push((spell, seconds)); }
    fn primary_height(&mut self, _: [f32; 2]) -> Option<f32> { self.height }
    fn secondary_height(&mut self, _: [f32; 2]) -> Option<f32> { None }
    fn fallback_height(&self) -> f32 { 9.0 }
    fn ray_fraction(&mut self, _: Position, _: Position) -> Option<f32> { self.fraction }
    fn cast_spell(&mut self, v: SpellCast) { self.casts.push(v); self.order.push("cast"); }
    fn create_ground_object(&mut self, _: GroundObject) { panic!("line has no dynamic object"); }
    fn remove_ground_object(&mut self, _: u64) { unreachable!(); }
    fn spawn_minion(&mut self, _: MinionSpawn, _: &mut NativeRng, _: &mut dyn NativeCounter) { unreachable!(); }
    fn begin_charge(&mut self, _: Charge) { panic!("native35 uses its current mutation lane"); }
    fn begin_raid_charge(&mut self, v: Charge) { self.charges.push(v); self.order.push("movement"); }
    fn yell(&mut self, _: u64, _: &'static str) { panic!("no invented native7 warning text"); }
    fn player_position(&self) -> Position { self.player }
    fn damage_player(&mut self, amount: f32, source: u64, _: u32) { self.damage.push((amount, source)); }
}
fn point(x: f32, y: f32, z: f32) -> Position { Position { x, y, z } }
fn context() -> CombatContext {
    CombatContext { source_guid: 77, player_guid: 1, now: 10.0,
        source: point(0.0, 0.0, 2.0), player: point(20.0, 0.0, 3.0), effective_damage: 100.0 }
}
fn line() -> RawBossAbility { RawBossAbility { words: [9, 100, 0, 0, 0, 0, 0] } }
fn port() -> Port {
    Port { player: point(100.0, 100.0, 3.0), source: Some(context().source),
        scale: 4.0, height: Some(4.0), ..Default::default() }
}

#[test]
fn line_warns_then_moves_then_sends_ground_spell_without_an_endpoint_impact() {
    let mut pending = Pending::default(); let mut port = port();
    assert!(pending.dispatch_current(&line(), context(), &mut port, &HostMath));
    assert!(port.markers.is_empty() && port.charges.is_empty() && port.casts.is_empty());
    assert_eq!(port.blocks, [1.6]); assert_eq!(port.starts, [(100, 1.0)]);
    assert_eq!(port.holds, [(26.0 / 40.0 + 1.0, 0.0)]);
    pending.tick(10.1, &mut port);
    let marker = &port.markers[0];
    assert_eq!(marker["shape"], "line"); assert_eq!(marker["kind"], "danger");
    assert_eq!(marker["len"], 26.0); assert_eq!(marker["w"], 4.0_f32 * 1.2_f32);
    assert_eq!(marker["t0"], 10.0); assert_eq!(marker["t1"], 11.0);
    port.order.clear(); pending.tick(11.0, &mut port);
    assert_eq!(port.order[0..2], ["movement", "cast"]);
    assert_eq!(port.charges.len(), 1);
    let charge = port.charges[0];
    assert_eq!(charge.movement.from, point(0.0, 0.0, 4.0));
    assert_eq!(charge.movement.to, point(26.0, 0.0, 4.0));
    assert_eq!(charge.movement.duration, 26.0 / 40.0);
    assert_eq!(charge.duration_ms, 650);
    assert_eq!(charge.next_move_at, (11.0 + 26.0 / 40.0) + 0.2);
    assert_eq!(charge.attack_delay, 26.0 / 40.0 + 0.4);
    assert_eq!(port.casts, [SpellCast { source_guid: 77, spell_id: 100,
        target: CastTarget::Ground(point(26.0, 0.0, 4.0)), hit_targets: Vec::new() }]);
    pending.tick(100.0, &mut port);
    assert_eq!(port.charges.len(), 1); assert_eq!(port.casts.len(), 1);
    assert!(port.damage.is_empty());
}

#[test]
fn dead_caster_cancels_delayed_movement_and_unpublished_fixed_warning() {
    let mut pending = Pending::default(); let mut port = port();
    pending.dispatch_current(&line(), context(), &mut port, &HostMath);
    port.source = None; port.player = point(15.0, 0.0, 1000.0);
    pending.tick(11.0, &mut port);
    assert!(port.charges.is_empty() && port.casts.is_empty());
    assert!(port.damage.is_empty());
    // A cancelled row that never published emits neither hz nor hzend.
    assert!(port.markers.iter().all(|m| m["type"] == "hzt"));
}

#[test]
fn delayed_move_uses_current_source_and_captured_destination_even_after_late_tick() {
    let mut pending = Pending::default(); let mut port = port();
    pending.dispatch_current(&line(), context(), &mut port, &HostMath);
    port.source = Some(point(24.0, 0.0, 7.0));
    port.player = point(-100.0, -100.0, 1.0);
    pending.tick(12.0, &mut port);
    assert_eq!(port.charges[0].movement.from, point(24.0, 0.0, 4.0));
    assert_eq!(port.charges[0].movement.to, point(26.0, 0.0, 4.0));
    assert_eq!(port.charges[0].movement.started_at, 12.0);
    assert_eq!(port.charges[0].movement.duration, 0.15);
    assert!(port.damage.is_empty());
}

#[test]
fn collision_margin_and_primary_failure_preserve_interpolated_destination_z() {
    let mut pending = Pending::default(); let mut port = port();
    port.height = None; port.fraction = Some(0.5);
    pending.dispatch_current(&line(), context(), &mut port, &HostMath);
    pending.tick(11.0, &mut port);
    let destination = port.charges[0].movement.to;
    let fraction = 0.5_f32 - 0.5_f32 / 26.0_f32;
    assert_eq!(destination, point(26.0 * fraction, 0.0, (3.0 - 2.0) * fraction + 2.0));
    assert_eq!(port.charges[0].movement.from.z, 2.0);
}

#[test]
fn line_includes_both_endpoints_and_exact_half_width_and_ignores_z() {
    for (x, y, hit) in [(0.0, 0.0, true), (26.0, 0.0, true),
        (10.0, 2.4, true), (10.0, -2.4, true),
        (-0.001, 0.0, false), (26.001, 0.0, false), (10.0, 2.401, false)] {
        let mut pending = Pending::default(); let mut port = port();
        pending.dispatch_current(&line(), context(), &mut port, &HostMath);
        port.player = point(x, y, 1000.0); pending.tick(11.0, &mut port);
        assert_eq!(port.damage.len(), usize::from(hit), "x={x}, y={y}");
    }
}

#[test]
fn every_primary_line_slot_uses_current_scheduler_order_and_cooldown() {
    for (boss, slot, repeat) in [(692, 2, 11.0), (693, 0, 8.0), (791, 0, 8.0),
        (192, 2, 9.0), (1291, 2, 9.0), (1294, 0, 8.0), (1593, 2, 8.0),
        (1594, 0, 8.0), (894, 4, 8.0), (992, 0, 7.0), (1392, 1, 8.0),
        (1393, 0, 7.0), (390, 0, 7.0), (1090, 0, 7.0), (1190, 2, 9.0),
        (1191, 1, 8.0), (1492, 3, 10.0)] {
        let schedule = current_schedule(boss).unwrap();
        let row = schedule.moves.iter().find(|r| r.native_tag == 7).unwrap();
        assert_eq!(row.native_slot, slot); assert_eq!(row.ability.words[0..2], [9, 100]);
        assert_eq!(f32::from_bits(row.ability.words[6]), repeat);
    }
}
