//! Authored source regressions; no compilation/game result is claimed.
use azeroth_survivors_re::{bosses::{Position, RawBossAbility, raid_areas::Pending,
    abilities::{CombatContext, CombatPort, SpellCast, GroundObject, MinionSpawn, Charge}},
    enemies::{NativeRng, ai::HostMath}, native_counter::NativeCounter};

#[derive(Default)]
struct Port { player: Position, markers: Vec<serde_json::Value>, hits: Vec<(f32,u64)>, spells: Vec<SpellCast> }
impl CombatPort for Port {
    fn raid_marker(&mut self,v:serde_json::Value){self.markers.push(v)}
    fn raid_source(&self,_:u64)->Option<Position>{Some(Position{x:50.,y:50.,z:3.})}
    fn primary_height(&mut self,_:[f32;2])->Option<f32>{Some(7.)}
    fn secondary_height(&mut self,_:[f32;2])->Option<f32>{None}
    fn fallback_height(&self)->f32{0.}
    fn ray_fraction(&mut self,_:Position,_:Position)->Option<f32>{None}
    fn cast_spell(&mut self,v:SpellCast){self.spells.push(v)}
    fn create_ground_object(&mut self,_:GroundObject){}
    fn remove_ground_object(&mut self,_:u64){}
    fn spawn_minion(&mut self,_:MinionSpawn,_:&mut NativeRng,_:&mut dyn NativeCounter){}
    fn begin_charge(&mut self,_:Charge){}
    fn yell(&mut self,_:u64,_:&'static str){}
    fn player_position(&self)->Position{self.player}
    fn damage_player(&mut self,v:f32,guid:u64){self.hits.push((v,guid))}
}
fn pool()->(Pending,Port){
    let mut pending=Pending::default();
    let mut port=Port {player:Position{x:20.,y:0.,z:7.},..Default::default()};
    let context=CombatContext{source_guid:99,player_guid:1,now:10.,source:Position{x:50.,y:50.,z:3.},
        player:Position{x:0.,y:0.,z:2.},effective_damage:100.};
    let record=RawBossAbility{words:[11,5740,12_f32.to_bits(),2_f32.to_bits(),5_f32.to_bits(),0.4_f32.to_bits(),0]};
    assert!(pending.dispatch_current(&record,context,&mut port,&HostMath));
    (pending,port)
}
#[test]
fn activation_replaces_warning_and_periodic_damage_uses_captured_center(){
    let (mut pending,mut port)=pool();pending.tick(10.,&mut port);
    assert_eq!(port.markers[0]["kind"],"danger");assert_eq!(port.markers[0]["r"],52.);
    pending.tick(12.,&mut port);
    assert!(port.markers.iter().any(|v|v["kind"]=="pool" && v["t1"]==17.));
    assert_eq!(port.hits,[(40.,99)]);assert_eq!(port.spells.len(),1);
}
#[test]
fn overdue_periods_advance_once_per_update_and_expiry_wins(){
    let (mut pending,mut port)=pool();pending.tick(12.,&mut port);
    pending.tick(16.,&mut port);assert_eq!(port.hits.len(),2);
    pending.tick(16.,&mut port);assert_eq!(port.hits.len(),3);
    pending.tick(17.,&mut port);assert_eq!(port.hits.len(),3);
    assert!(port.markers.iter().any(|v|v["type"]=="hzend"));
}
#[test]
fn safe_inner_circle_and_outer_boundary_are_distinct(){
    let (mut pending,mut port)=pool();port.player.x=11.999;pending.tick(12.,&mut port);
    assert!(port.hits.is_empty());port.player.x=12.;pending.tick(12.5,&mut port);
    port.player.x=52.;pending.tick(13.,&mut port);assert_eq!(port.hits.len(),2);
    port.player.x=52.001;pending.tick(13.5,&mut port);assert_eq!(port.hits.len(),2);
}
