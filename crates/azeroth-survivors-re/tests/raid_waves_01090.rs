//! Current native27 wave integration cases; authored without compiling or running Rust.
use azeroth_survivors_re::{bosses::{abilities::*, raid_area_catalog::current_schedule,
    raid_areas::Pending, NativeRng, Position, RawBossAbility}, native_counter::NativeCounter};
use serde_json::Value;

#[derive(Default)]
struct Port {
    messages: Vec<Value>, damage: Vec<(f32,u64)>, casts: Vec<SpellCast>,
    windups: Vec<(u64,u32,f32)>, holds: Vec<f32>, blocks: Vec<f32>, player: Position,
}
impl CombatPort for Port {
    fn raid_marker(&mut self,v:Value) { self.messages.push(v); }
    // The common gate requires a living source; fixed rings keep captured XY.
    fn raid_source(&self,_:u64)->Option<Position> { Some(point(500.)) }
    fn raid_hold(&mut self,_:u64,v:f32) { self.holds.push(v); }
    fn raid_block(&mut self,_:u64,v:f32) { self.blocks.push(v); }
    fn raid_cast(&mut self,g:u64,s:u32,v:f32) { self.windups.push((g,s,v)); }
    fn primary_height(&mut self,_:[f32;2])->Option<f32> { Some(4.) }
    fn secondary_height(&mut self,_:[f32;2])->Option<f32> { unreachable!() }
    fn fallback_height(&self)->f32 { unreachable!() }
    fn ray_fraction(&mut self,_:Position,_:Position)->Option<f32> { unreachable!() }
    fn cast_spell(&mut self,v:SpellCast) { self.casts.push(v); }
    fn create_ground_object(&mut self,_:GroundObject) { panic!("marker channel owns presentation") }
    fn remove_ground_object(&mut self,_:u64) { unreachable!() }
    fn spawn_minion(&mut self,_:MinionSpawn,_:&mut NativeRng,_:&mut dyn NativeCounter) { unreachable!() }
    fn begin_charge(&mut self,_:Charge) { unreachable!() }
    fn yell(&mut self,_:u64,_:&'static str) { panic!("native27 has no invented warning") }
    fn player_position(&self)->Position { self.player }
    fn damage_player(&mut self,a:f32,s:u64) { self.damage.push((a,s)); }
}
fn point(x:f32)->Position { Position{x,y:0.,z:999.} }
fn context()->CombatContext { CombatContext {source_guid:7,player_guid:1,now:10.,
    source:point(0.),player:point(50.),effective_damage:100.} }
fn wave(id:u32)->RawBossAbility {
    current_schedule(id).unwrap().moves.iter().find(|r|r.native_tag==27).unwrap().ability
}

#[test]
fn first_circle_and_later_rings_keep_native_tell_and_visual_order() {
    let mut pending=Pending::default();let mut port=Port::default();
    assert!(pending.dispatch(&wave(792),context(),&mut port));assert!(port.messages.is_empty());
    assert_eq!(port.holds,[1.6]);assert_eq!(port.windups,[(7,6524,1.6)]);
    assert_eq!(port.blocks,[(4f32*0.8)+1.6]);
    pending.tick(10.1,&mut port);
    assert_eq!(port.messages.iter().filter(|m|m["type"]=="hz").count(),1);
    assert_eq!(port.messages[0]["shape"],"circle");assert_eq!(port.messages[0]["r"],5.);
    assert_eq!(port.messages[0]["x"],0.);assert_eq!(port.messages[0]["z"],4.);
    port.messages.clear();pending.tick(11.1,&mut port);
    assert_eq!(port.messages[0]["shape"],"donut");assert_eq!(port.messages[0]["inner"],5.);
    assert_eq!(port.messages[0]["r"],10.);assert_eq!(port.messages[0]["t0"],11.);
    pending.tick(11.7,&mut port);
    assert_eq!(port.casts.len(),1);assert_eq!(port.casts[0].spell_id,6524);
    assert_eq!(port.casts[0].target,CastTarget::Ground(Position{x:0.,y:0.,z:4.}));
    assert!(port.casts[0].hit_targets.is_empty());
    pending.tick(30.,&mut port);assert_eq!(port.casts.len(),1);
}

#[test]
fn donut_damage_tests_current_player_xy_and_both_inclusive_boundaries() {
    for (x,hits) in [(4.999,false),(5.,true),(10.,true),(10.001,false)] {
        let mut pending=Pending::default();let mut port=Port{player:point(100.),..Default::default()};
        pending.dispatch(&wave(792),context(),&mut port);
        pending.tick(11.7,&mut port); // First circle has expired outside the player.
        port.player=point(x);pending.tick(12.5,&mut port);
        assert_eq!(port.damage.len(),usize::from(hits),"distance{x}");
        if hits { assert_eq!(port.damage,[(160.,7)]); }
    }
}

#[test]
fn all_current_wave_slots_keep_six_native_payload_fields_and_real_scheduler_cooldowns() {
    for (boss,slot,spell,count,cooldown) in [(792,1,6524,4,12.),(1294,1,19798,5,12.),
        (991,2,23860,4,11.),(393,3,21097,4,16.),(1093,2,20566,4,14.)] {
        let schedule=current_schedule(boss).unwrap();
        let row=schedule.moves.iter().find(|r|r.native_tag==27).unwrap();
        assert_eq!(row.native_slot,slot);assert_eq!(f32::from_bits(row.ability.words[6]),cooldown);
        let mut pending=Pending::default();let mut port=Port{player:point(100.),..Default::default()};
        pending.dispatch(&row.ability,context(),&mut port);
        for step in 0..50 { pending.tick(10.+step as f32*0.1,&mut port); }
        // One circle and count-1 rings eventually publish, using the shared IDs.
        let markers=port.messages.iter().filter(|m|m["type"]=="hz").collect::<Vec<_>>();
        assert_eq!(markers.len(),count);assert_eq!(port.windups[0].1,spell);
        assert_eq!(markers[0]["id"],1);assert_eq!(markers.last().unwrap()["id"],count);
    }
}
