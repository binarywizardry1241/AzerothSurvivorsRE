//! Authored during static recovery; intentionally not compiled or run.
use azeroth_survivors_re::bosses::{abilities::*, NativeRng, Position, RawBossAbility};
use azeroth_survivors_re::enemies::ai::Math;
use serde_json::Value;
use std::cell::RefCell;

fn fixtures() -> Value { serde_json::from_str(include_str!("../../../docs/analysis/evidence/0.97.2/bosses/abilities-fixtures.json")).unwrap() }
fn number(row: &Value, key: &str) -> u32 { row[key].as_u64().unwrap() as u32 }
fn float(row: &Value, key: &str) -> f32 { f32::from_bits(number(row,key)) }
fn point(value: &Value) -> Position { Position { x: f32::from_bits(value[0].as_u64().unwrap() as u32), y: f32::from_bits(value[1].as_u64().unwrap() as u32), z: 0.0 } }
fn position(x:f32,y:f32,z:f32) -> Position { Position{x,y,z} }
fn context() -> CombatContext { CombatContext { source_guid: 99, player_guid: 7, now: 120.0, source: position(0.0,0.0,9.0), player: position(24.0,0.0,0.0), effective_damage: 100.0 } }

#[test]
fn hardcoded_spell_lookups_match_native_instructions() {
    for row in fixtures()["lookups"].as_array().unwrap() {
        assert_eq!(native_spell_radius(number(row,"spell_id")).map(f32::to_bits), row["radius_bits"].as_u64().map(|v|v as u32));
        assert_eq!(native_missile_speed(number(row,"spell_id")).to_bits(),number(row,"missile_speed_bits"));
    }
}

#[test]
fn geometry_and_minion_selection_match_native_instructions() {
    let native=fixtures();
    for row in native["charge_duration"].as_array().unwrap() {
        assert_eq!(charge_duration(point(&row["start_bits"]),point(&row["end_bits"])).to_bits(),number(row,"duration_bits"));
    }
    for row in native["charge_clip"].as_array().unwrap() {
        let result=charge_endpoint(point(&row["start_bits"]),point(&row["end_bits"]),float(row,"fraction_bits"));
        assert_eq!(result.x.to_bits(),row["clipped_bits"][0].as_u64().unwrap() as u32);
        assert_eq!(result.y.to_bits(),row["clipped_bits"][1].as_u64().unwrap() as u32);
    }
    for row in native["minion_indices"].as_array().unwrap() { assert_eq!(minion_enemy_index(number(row,"index")),number(row,"enemy_index") as usize); }
    for row in native["area_range"].as_array().unwrap() {
        assert_eq!(in_radius(position(0.0,0.0,999.0),point(&row["player_bits"]),float(row,"radius_bits")),row["hit"].as_bool().unwrap());
    }
}

#[derive(Default)]
struct AxisMath { angles: RefCell<Vec<f32>> }
impl Math for AxisMath {
    fn cos(&self, angle:f32)->f32 { self.angles.borrow_mut().push(angle); 1.0 }
    fn sin(&self, _:f32)->f32 { 0.0 }
    fn hypot(&self,x:f32,y:f32)->f32 { (x*x+y*y).sqrt() }
}

#[test]
fn volley_random_consumption_matches_native_instructions() {
    for row in fixtures()["missile_draws"].as_array().unwrap() {
        let mut words=[0;4];
        for (index,value) in row["state"].as_array().unwrap().iter().enumerate(){words[index]=value.as_u64().unwrap();}
        let mut rng=NativeRng::from_words(words);let math=AxisMath::default();
        let xy=missile_aim_xy(number(row,"index"),number(row,"count"),position(0.0,0.0,0.0),&mut rng,&math);
        assert_eq!(math.angles.borrow()[0].to_bits(),number(row,"angle_bits"));
        assert_eq!(xy[0].to_bits(),number(row,"radius_bits"));
        for (index,value) in row["state_after"].as_array().unwrap().iter().enumerate(){assert_eq!(rng.words[index],value.as_u64().unwrap());}
    }
}

#[derive(Default)]
struct Port { casts:Vec<SpellCast>, objects:Vec<GroundObject>, removed:Vec<u64>, minions:Vec<MinionSpawn>, charges:Vec<Charge>, damage:Vec<(f32,u64)>, yells:Vec<&'static str>, player:Position, ray:Option<f32>, markers:Vec<Value> }
impl CombatPort for Port {
    fn raid_marker(&mut self,message:Value){self.markers.push(message);}
    fn raid_source(&self,_:u64)->Option<Position>{Some(context().source)}
    fn primary_height(&mut self,_:[f32;2])->Option<f32>{Some(4.0)}
    fn secondary_height(&mut self,_:[f32;2])->Option<f32>{panic!("primary exists")}
    fn fallback_height(&self)->f32{panic!("primary exists")}
    fn ray_fraction(&mut self,_:Position,_:Position)->Option<f32>{self.ray}
    fn cast_spell(&mut self,request:SpellCast){self.casts.push(request);}
    fn create_ground_object(&mut self,object:GroundObject){self.objects.push(object);}
    fn remove_ground_object(&mut self,guid:u64){self.removed.push(guid);}
    fn spawn_minion(&mut self,request:MinionSpawn,_:&mut NativeRng,_:&mut dyn azeroth_survivors_re::native_counter::NativeCounter){self.minions.push(request);}
    fn begin_charge(&mut self,request:Charge){self.charges.push(request);}
    fn yell(&mut self,_:u64,text:&'static str){self.yells.push(text);}
    fn player_position(&self)->Position{self.player}
    fn damage_player(&mut self,amount:f32,source:u64){self.damage.push((amount,source));}
}

#[test]
fn ground_area_uses_real_object_fields_and_delayed_current_position_hit() {
    let mut effects=PendingEffects::default();let mut port=Port::default();let mut counter:u32=0xffff_ffff;
    let mut rng=NativeRng::from_words([1,2,3,4]);
    let raw=RawBossAbility{words:[0,5740,13812,9.0_f32.to_bits(),1.5_f32.to_bits(),2.6_f32.to_bits(),5.0_f32.to_bits()]};
    dispatch(&raw,context(),&mut rng,&mut counter,&mut effects,&mut port,&AxisMath::default()).unwrap();
    assert_eq!(counter,0);assert_eq!(port.objects[0].guid,0xf100_0000_0000_0000);
    assert_eq!(port.objects[0].fields.iter().find(|(key,_)|*key==4).unwrap().1,(9.0_f32/8.0).to_bits());
    assert!(port.damage.is_empty());assert_eq!(effects.impacts[0].resolves_at,121.5);
    port.player=position(33.0,0.0,10000.0);effects.resolve_due(121.499,&mut port);assert!(port.damage.is_empty());
    effects.resolve_due(121.5,&mut port);assert_eq!(port.damage,vec![(2.6_f32*100.0,0)]);
    assert_eq!(port.casts[0].spell_id,13812);assert_eq!(port.removed,vec![port.objects[0].guid]);assert!(effects.impacts.is_empty());
}

#[test]
fn direct_strike_casts_when_missed_and_charge_schedules_arrival_strike() {
    let mut effects=PendingEffects::default();let mut port=Port::default();let mut counter:u32=0;
    let mut rng=NativeRng::from_words([1,2,3,4]);let math=AxisMath::default();
    let raw=RawBossAbility{words:[3,6343,8.0_f32.to_bits(),1.4_f32.to_bits(),0,0,0]};
    dispatch(&raw,context(),&mut rng,&mut counter,&mut effects,&mut port,&math).unwrap();
    assert_eq!(port.casts.len(),1);assert!(port.casts[0].hit_targets.is_empty());assert!(port.damage.is_empty());
    dispatch(&RawBossAbility{words:[4,100,0,0,0,0,0]},context(),&mut rng,&mut counter,&mut effects,&mut port,&math).unwrap();
    assert_eq!(port.charges[0].movement.duration,1.1);assert_eq!(port.charges[0].movement.from.z,4.0);
    assert_eq!(port.charges[0].next_move_at,121.1_f32+0.2);assert_eq!(port.charges[0].attack_delay,1.1_f32+0.3);
    assert_eq!(effects.impacts[0].impact_spell,6343);assert_eq!(effects.impacts[0].radius,4.5);assert_eq!(effects.impacts[0].damage,200.0);
    assert!(port.damage.is_empty());port.player=position(100.0,0.0,0.0);effects.resolve_due(122.0,&mut port);
    assert!(port.damage.is_empty());assert_eq!(port.casts.last().unwrap().spell_id,6343);
}

#[test]
fn summon_and_volley_do_more_than_visual_casts() {
    let mut effects=PendingEffects::default();let mut port=Port::default();let mut counter:u32=0;
    let mut rng=NativeRng::from_words([1,2,3,4]);let math=AxisMath::default();
    dispatch(&RawBossAbility{words:[2,7,0,0,0,0,0]},context(),&mut rng,&mut counter,&mut effects,&mut port,&math).unwrap();
    assert_eq!(port.yells,vec!["Minions, to me!"]);assert_eq!(port.minions.iter().map(|m|m.enemy_index).collect::<Vec<_>>(),vec![0,0,1,0,0,1,0]);
    dispatch(&RawBossAbility{words:[1,686,7,0,0,0,0]},context(),&mut rng,&mut counter,&mut effects,&mut port,&math).unwrap();
    assert!(effects.impacts.is_empty());assert_eq!(port.casts.len(),7);
    effects.resolve_due(120.1,&mut port);
    let markers:Vec<_>=port.markers.iter().filter(|row|row["type"]=="hz").collect();
    assert_eq!(markers.len(),7);assert!(markers.iter().all(|row|row["r"]==2.5));
    assert_eq!(markers[0]["x"],24.0);assert_eq!(markers[0]["t1"],121.2_f32);
}

#[test]
fn current_volley_in_melee_waits_until_the_six_tenths_deadline() {
    let mut effects = PendingEffects::default();
    let mut port = Port::default();
    let mut counter: u32 = 0;
    let mut rng = NativeRng::from_words([1, 2, 3, 4]);
    let mut context = context();
    context.now = 0.0;
    context.source = Position::default();
    context.player = Position::default();
    dispatch(&RawBossAbility { words: [1, 26053, 1, 0, 0, 0, 0] }, context,
        &mut rng, &mut counter, &mut effects, &mut port, &AxisMath::default()).unwrap();
    assert!(effects.impacts.is_empty());
    assert_eq!(port.casts[0].spell_id, 26053);
    effects.resolve_due(f32::from_bits(0.6_f32.to_bits() - 1), &mut port);
    assert_eq!(port.markers[0]["t1"],0.6_f32);
    assert!(port.damage.is_empty());
    effects.resolve_due(0.6, &mut port);
    assert_eq!(port.damage.iter().map(|row| row.0).collect::<Vec<_>>(), vec![45.0]);
    assert!(effects.impacts.is_empty());
}
