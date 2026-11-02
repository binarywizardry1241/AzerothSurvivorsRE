//! Native hazard lifecycle regressions; authored without compiling/running Rust.
use azeroth_survivors_re::{bosses::{abilities::*, raid_areas::Pending,
    NativeRng, Position, RawBossAbility}, native_counter::NativeCounter};
use serde_json::Value;

#[derive(Default)]
struct Port {
    messages: Vec<Value>, damage: Vec<(f32,u64)>, casts: Vec<(u64,u32,f32)>,
    holds: Vec<(u64,f32)>, blocks: Vec<(u64,f32)>, player: Position, source: Option<Position>,
    visuals: Vec<SpellCast>,
}
impl CombatPort for Port {
    fn raid_marker(&mut self, value: Value) { self.messages.push(value); }
    fn raid_source(&self, _: u64) -> Option<Position> { self.source }
    fn raid_hold(&mut self, guid:u64, seconds:f32) { self.holds.push((guid,seconds)); }
    fn raid_block(&mut self, guid:u64, seconds:f32) { self.blocks.push((guid,seconds)); }
    fn raid_cast(&mut self, guid:u64, spell:u32, seconds:f32) { self.casts.push((guid,spell,seconds)); }
    fn primary_height(&mut self,_:[f32;2])->Option<f32> { Some(4.) }
    fn secondary_height(&mut self,_:[f32;2])->Option<f32> { panic!("primary available") }
    fn fallback_height(&self)->f32 { panic!("primary available") }
    fn ray_fraction(&mut self,_:Position,_:Position)->Option<f32> { None }
    fn cast_spell(&mut self,visual:SpellCast) { self.visuals.push(visual); }
    fn create_ground_object(&mut self,_:GroundObject) { panic!("marker channel owns ground presentation") }
    fn remove_ground_object(&mut self,_:u64) { panic!("no dynamic object") }
    fn spawn_minion(&mut self,_:MinionSpawn,_:&mut NativeRng,_:&mut dyn NativeCounter) { unreachable!() }
    fn begin_charge(&mut self,_:Charge) { unreachable!() }
    fn yell(&mut self,_:u64,_:&'static str) { panic!("neither selected native branch warns") }
    fn player_position(&self)->Position { self.player }
    fn damage_player(&mut self,amount:f32,source:u64) { self.damage.push((amount,source)); }
}
fn point(x:f32)->Position { Position{x,y:0.,z:999.} }
fn context(source:u64)->CombatContext { CombatContext { source_guid:source,player_guid:1,
    now:10.,source:point(0.),player:point(20.),effective_damage:100. } }
fn area()->RawBossAbility { RawBossAbility {words:[5,5740,13812,5f32.to_bits(),1.5f32.to_bits(),2f32.to_bits(),0]} }
fn strike()->RawBossAbility { RawBossAbility {words:[6,8122,5f32.to_bits(),1.6f32.to_bits(),0,0,0]} }

#[test]
fn ground_area_publishes_next_stage_and_ends_at_inclusive_current_position_hit() {
    let mut state=Pending::default(); let mut port=Port{player:point(25.),source:Some(point(0.)),..Default::default()};
    assert!(state.dispatch(&area(),context(7),&mut port)); assert!(port.messages.is_empty());
    assert_eq!(port.blocks,[(7,1.5)]); assert!(port.casts.is_empty());
    state.tick(10.1,&mut port);
    let first=&port.messages[0]; assert_eq!(first["type"],"hz"); assert_eq!(first["id"],1);
    assert_eq!(first["x"],20.); assert_eq!(first["z"],4.); assert_eq!(first["t0"],10.);
    assert_eq!(first["t1"],11.5); assert!(port.messages.last().unwrap().get("in").is_none());
    state.tick(11.499,&mut port); assert!(port.damage.is_empty());
    state.tick(11.5,&mut port); assert_eq!(port.damage,[(200.,7)]);
    assert_eq!(port.messages[port.messages.len()-2]["type"],"hzend");
    assert_eq!(port.visuals[0].spell_id,13812);
}

#[test]
fn expiry_before_first_publication_has_no_creation_or_end_message() {
    let mut state=Pending::default();let mut port=Port{player:point(20.),source:Some(point(0.)),..Default::default()};
    state.dispatch(&area(),context(7),&mut port);state.tick(12.,&mut port);
    assert_eq!(port.messages.len(),1);assert_eq!(port.messages[0]["type"],"hzt");
    assert_eq!(port.damage,[(200.,7)]);
}

#[test]
fn cast_area_follows_alive_source_and_cancels_a_published_marker_when_source_is_gone() {
    let mut state=Pending::default();let mut port=Port{source:Some(point(1.)),..Default::default()};
    state.dispatch(&strike(),context(7),&mut port);assert_eq!(port.casts,[(7,8122,1.3)]);
    assert_eq!(port.holds,[(7,1.3)]);state.tick(10.1,&mut port);
    assert_eq!(port.messages[0]["x"],1.);
    port.source=Some(point(3.));state.tick(10.2,&mut port);
    assert_eq!(port.messages.last().unwrap()["m"][0][1],3.);
    port.source=None;state.tick(10.3,&mut port);
    assert_eq!(port.messages[port.messages.len()-2]["type"],"hzend");
    state.tick(20.,&mut port);assert!(port.damage.is_empty());
}

#[test]
fn same_tick_hits_sum_once_with_last_source_and_end_in_reverse_index_order() {
    let mut state=Pending::default();let mut port=Port{player:point(20.),source:Some(point(0.)),..Default::default()};
    for source in [7,8] { state.dispatch(&area(),context(source),&mut port); }
    state.tick(10.1,&mut port);port.messages.clear();state.tick(11.5,&mut port);
    assert_eq!(port.damage,[(400.,8)]);assert_eq!(port.messages[0]["id"],2);
    assert_eq!(port.messages[1]["id"],1);assert_eq!(port.messages[2]["type"],"hzt");
}
