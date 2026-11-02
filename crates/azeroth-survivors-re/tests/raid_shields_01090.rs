//! Native23/nonblocking presentation and native35/37 queue-order regressions.
//! Authored without compilation or game execution.
use azeroth_survivors_re::{bosses::{abilities::*, raid_areas::Pending,
    raid_shields, raid_warnings::RaidWarning, NativeRng, Position, RawBossAbility},
    enemies::ai::HostMath, native_counter::NativeCounter};

#[derive(Default)]
struct Port {
    protected: Vec<(u64,f32)>, auras: Vec<(u64,u32,bool)>, casts: Vec<SpellCast>,
    warnings: Vec<RaidWarning>, order: Vec<&'static str>, timed: usize,
}
impl CombatPort for Port {
    fn raid_protect(&mut self,g:u64,until:f32) { self.protected.push((g,until)); }
    fn raid_aura(&mut self,g:u64,s:u32,on:bool) { self.auras.push((g,s,on));self.order.push(if on {"add"} else {"remove"}); }
    fn raid_warning(&mut self,_:u64,w:RaidWarning) { self.warnings.push(w); }
    fn raid_cast(&mut self,_:u64,_:u32,_:f32) { self.timed+=1; }
    fn raid_hold(&mut self,_:u64,_:f32) { self.timed+=1; }
    fn raid_block(&mut self,_:u64,_:f32) { self.timed+=1; }
    fn raid_source(&self,_:u64)->Option<Position> { Some(Position::default()) }
    fn primary_height(&mut self,_:[f32;2])->Option<f32> { Some(4.) }
    fn secondary_height(&mut self,_:[f32;2])->Option<f32> { unreachable!() }
    fn fallback_height(&self)->f32 { unreachable!() }
    fn ray_fraction(&mut self,_:Position,_:Position)->Option<f32> { None }
    fn cast_spell(&mut self,v:SpellCast) { self.casts.push(v); }
    fn create_ground_object(&mut self,_:GroundObject) { unreachable!() }
    fn remove_ground_object(&mut self,_:u64) { unreachable!() }
    fn spawn_minion(&mut self,_:MinionSpawn,_:&mut NativeRng,_:&mut dyn NativeCounter) { unreachable!() }
    fn begin_charge(&mut self,_:Charge) { self.order.push("charge"); }
    fn yell(&mut self,_:u64,_:&'static str) { unreachable!() }
    fn player_position(&self)->Position { Position{x:100.,y:100.,z:0.} }
    fn damage_player(&mut self,_:f32,_:u64) { unreachable!() }
}
fn context()->CombatContext { CombatContext { source_guid:7,player_guid:1,now:10.,
    source:Position::default(),player:Position{x:20.,y:0.,z:99.},effective_damage:100. } }
fn shield(index:u32)->RawBossAbility { RawBossAbility {words:[14,index,0,0,0,0,0]} }

#[test]
fn current_shield_record_has_aura_self_visual_warning_and_no_timed_cast() {
    let mut port=Port::default();
    let removal=raid_shields::dispatch(&shield(0),context(),&mut port).unwrap();
    assert_eq!(removal,raid_shields::Removal {source:7,spell:25176,at:30.});
    assert_eq!(port.protected,[(7,30.)]);assert_eq!(port.auras,[(7,25176,true)]);
    assert_eq!(port.warnings,[RaidWarning::Shielded]);
    assert_eq!(port.timed,0);
    assert_eq!(port.casts,[SpellCast {source_guid:7,spell_id:25176,target:CastTarget::None,hit_targets:Vec::new()}]);
}

#[test]
fn aura_removal_and_charge_keep_one_insertion_queue_after_a_late_frame() {
    for shield_first in [true,false] {
        let mut pending=Pending::default();let mut port=Port::default();
        let charge=RawBossAbility {words:[9,100,0,0,0,0,0]};
        let a=if shield_first {shield(1)} else {charge};
        let b=if shield_first {charge} else {shield(1)};
        assert!(pending.dispatch_current(&a,context(),&mut port,&HostMath));
        assert!(pending.dispatch_current(&b,context(),&mut port,&HostMath));
        port.order.clear();pending.tick(15.,&mut port);
        assert_eq!(port.order,if shield_first {vec!["remove","charge"]} else {vec!["charge","remove"]});
        assert!(port.auras.contains(&(7,22812,false)));
    }
}
