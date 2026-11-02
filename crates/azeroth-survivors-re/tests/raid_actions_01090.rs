//! Current native8/19 regressions; authored without compiling or running Rust.
use azeroth_survivors_re::{bosses::{abilities::*, raid_areas::Pending, NativeRng,
    Position, RawBossAbility}, enemies::ai::HostMath, native_counter::NativeCounter};
use serde_json::Value;

#[derive(Default)]
struct Port {
    player: Position, source: Option<Position>, height: Option<f32>, messages: Vec<Value>,
    casts: Vec<SpellCast>, damage: Vec<(f32,u64)>, knocks: Vec<(f32,f32)>,
    faced: Vec<(f32,f32)>, order: Vec<&'static str>,
}
impl CombatPort for Port {
    fn raid_marker(&mut self,v:Value) { self.messages.push(v); self.order.push("marker"); }
    fn raid_source(&self,_:u64)->Option<Position> { self.source }
    fn raid_hold_facing(&mut self,_:u64,seconds:f32,angle:f32) { self.faced.push((seconds,angle)); }
    fn raid_knockback(&mut self,a:f32,v:f32) { self.knocks.push((a,v)); self.order.push("knockback"); }
    fn primary_height(&mut self,_:[f32;2])->Option<f32> { self.height }
    fn secondary_height(&mut self,_:[f32;2])->Option<f32> { Some(6.) }
    fn fallback_height(&self)->f32 { 8. }
    fn ray_fraction(&mut self,_:Position,_:Position)->Option<f32> { unreachable!() }
    fn cast_spell(&mut self,v:SpellCast) { self.casts.push(v); self.order.push("spell"); }
    fn create_ground_object(&mut self,_:GroundObject) { panic!("native8/19 use hazard markers") }
    fn remove_ground_object(&mut self,_:u64) { unreachable!() }
    fn spawn_minion(&mut self,_:MinionSpawn,_:&mut NativeRng,_:&mut dyn NativeCounter) { unreachable!() }
    fn begin_charge(&mut self,_:Charge) { unreachable!() }
    fn yell(&mut self,_:u64,_:&'static str) { unreachable!() }
    fn player_position(&self)->Position { self.player }
    fn damage_player(&mut self,a:f32,s:u64) { self.damage.push((a,s)); self.order.push("damage"); }
}
fn point(x:f32,y:f32,z:f32)->Position { Position{x,y,z} }
fn context()->CombatContext { CombatContext {source_guid:7,player_guid:1,now:10.,
    source:point(0.,0.,777.),player:point(20.,0.,888.),effective_damage:100.} }
fn record(index:u32)->RawBossAbility { RawBossAbility {words:[10,index,0,0,0,0,0]} }

#[test]
fn cone_keeps_fixed_aim_and_separate_player_height_visual_after_hazard_damage() {
    // Boss692 slot0, spell6304, range11, arc80deg, windup1.1, factor1.8.
    for (height,visual_z,hazard_z) in [(Some(4.),4.,4.),(None,888.,6.)] {
        let mut pending=Pending::default();let mut port=Port{height,player:point(10.,0.,999.),source:Some(point(40.,0.,777.)),..Default::default()};
        assert!(pending.dispatch_current(&record(0),context(),&mut port,&HostMath));
        assert_eq!(port.faced,[(1.1f32+0.3,0.)]);
        pending.tick(10.1,&mut port);
        assert_eq!(port.messages[0]["shape"],"cone");assert_eq!(port.messages[0]["z"],hazard_z);
        pending.tick(11.2,&mut port);
        assert_eq!(port.damage,[(100.*1.8,7)]);
        assert_eq!(port.casts.len(),1);
        assert_eq!(port.casts[0].target,CastTarget::Ground(point(5.5,0.,visual_z)));
        assert!(port.order.iter().position(|x|*x=="damage").unwrap()
            < port.order.iter().position(|x|*x=="spell").unwrap());
        // The living source moved; fixed aim and the queued visual stay captured.
        assert_ne!(port.source.unwrap().x,context().source.x);
    }
}

#[test]
fn cone_checks_range_before_strict_half_yard_near_center_admission() {
    for (position,hit) in [(point(-0.49,0.,0.),true),(point(-0.5,0.,0.),false),
        (point(0.,5.,0.),false),(point(11.,0.,0.),true),(point(11.01,0.,0.),false)] {
        let mut pending=Pending::default();let mut port=Port{height:Some(4.),player:position,source:Some(context().source),..Default::default()};
        pending.dispatch_current(&record(0),context(),&mut port,&HostMath);
        pending.tick(12.,&mut port);assert_eq!(!port.damage.is_empty(),hit);
    }
}

#[test]
fn following_circle_uses_current_source_and_last_hit_knockback_after_damage() {
    // Boss692 slot1, spell20549, radius8, factor1.4, horizontal12.
    let mut pending=Pending::default();let mut port=Port {height:Some(4.),source:Some(point(5.,0.,0.)),
        player:point(5.5,0.,100.),..Default::default()};
    pending.dispatch_current(&record(1),context(),&mut port,&HostMath);
    pending.tick(10.1,&mut port);assert_eq!(port.messages[0]["x"],5.);
    pending.tick(11.4,&mut port);
    assert_eq!(port.damage,[(100.*1.4,7)]);assert_eq!(port.knocks,[(0.,12.)]);
    assert_eq!(port.casts[0].target,CastTarget::Ground(point(5.,0.,4.)));
    assert!(port.order.iter().position(|x|*x=="spell").unwrap()
        < port.order.iter().position(|x|*x=="damage").unwrap());
    assert!(port.order.iter().position(|x|*x=="damage").unwrap()
        < port.order.iter().position(|x|*x=="knockback").unwrap());
}

#[test]
fn a_dead_following_caster_cancels_its_circle_and_hit_visual() {
    let mut pending=Pending::default();let mut port=Port {height:Some(4.),source:Some(point(0.,0.,0.)),
        player:point(0.,0.,0.),..Default::default()};
    pending.dispatch_current(&record(1),context(),&mut port,&HostMath);
    pending.tick(10.1,&mut port);port.source=None;pending.tick(12.,&mut port);
    assert!(port.damage.is_empty() && port.knocks.is_empty() && port.casts.is_empty());
    assert!(port.messages.iter().any(|v|v["type"]=="hzend"));
}

#[test]
fn dead_fixed_cone_cancels_damage_but_keeps_its_independently_queued_visual() {
    for published in [false,true] {
        let mut pending=Pending::default();let mut port=Port {height:Some(4.),
            source:published.then_some(context().source),player:point(5.,0.,999.),..Default::default()};
        pending.dispatch_current(&record(0),context(),&mut port,&HostMath);
        pending.tick(10.1,&mut port);
        port.source=None;port.messages.clear();pending.tick(10.2,&mut port);
        assert_eq!(port.messages.iter().filter(|v|v["type"]=="hzend").count(),usize::from(published));
        assert!(port.damage.is_empty() && port.casts.is_empty());
        let messages=port.messages.len();pending.tick(12.,&mut port);
        assert_eq!(port.messages.len(),messages);assert!(port.damage.is_empty());
        assert_eq!(port.casts,[SpellCast {source_guid:7,spell_id:6304,
            target:CastTarget::Ground(point(5.5,0.,4.)),hit_targets:Vec::new()}]);
        pending.tick(20.,&mut port);assert_eq!(port.casts.len(),1);
    }
}
