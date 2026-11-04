//! Authored native-oracle coverage; intentionally not compiled/run in source-only mode.
use azeroth_survivors_re::{
    bosses::{death::{self, BossAccountEvent, BossDeathInput, BossDeathState, CompletionState, CompletionPort, DeathPort, ExperiencePickup}, NativeRng, Position},
    mob_loot::{EquipmentRoll,MobLootWorld,PickupDrop},
};
use serde_json::Value;
#[path = "fixtures/legacy_boss_zones.rs"]
mod legacy_boss_zones;
fn n(r:&Value,k:&str)->u64 {r[k].as_u64().unwrap()}
fn f(r:&Value,k:&str)->f32 {f32::from_bits(n(r,k) as u32)}
fn fixture()->Value {serde_json::from_str(include_str!("fixtures/boss-death-native.json")).unwrap()}
#[derive(Default)]
struct World {pickups:Vec<(u32,Option<u32>,[u32;3])>,events:Vec<String>,accounts:Vec<String>,equipment:Vec<u32>,packets:Vec<(u16,u64,u32)>}
fn bits(p:Position)->[u32;3] {[p.x.to_bits(),p.y.to_bits(),p.z.to_bits()]}
impl MobLootWorld for World {
    fn create_pickup(&mut self,pickup:PickupDrop) {
        let (kind,amount,p)=match pickup {
            PickupDrop::Experience{amount,position}=>(0,Some(amount),position),
            PickupDrop::Gold{amount,position}=>(1,Some(amount),position),
            PickupDrop::Cache{position}=>(2,None,position),
            _ => panic!("historical fixture unexpectedly emitted a new pickup kind"),
        };
        self.pickups.push((kind,amount,[p.x.to_bits(),p.y.to_bits(),p.z.to_bits()]));
    }
    fn resolved_height(&mut self,_:[f32;2])->f32 {panic!("boss death arm preserves supplied Z")}
}
impl DeathPort for World {
    fn announce_boss_death(&mut self,_:u64,_:&str,text:&'static str) {assert_eq!(text,"Impossible...");self.events.push("announce".into());}
    fn account_event(&mut self,event:BossAccountEvent<'_>) {assert_eq!(event.event_type,"bossdown");self.accounts.push(event.name.into());}
    fn queue_equipment(&mut self,item:u32) {self.equipment.push(item);}
    fn roll_boss_equipment(&mut self,class:u8,zone:usize,boss:usize,roll:EquipmentRoll,rng:&mut NativeRng) {
        for id in azeroth_survivors_re::mob_loot::roll_boss_equipment(class,zone,boss,roll,rng) {self.queue_equipment(id);}
    }
    fn create_boss_magnet(&mut self,p:Position) {self.pickups.push((6,None,bits(p)));}
    fn attract_idle_experience(&mut self) {self.events.push("attract_idle_experience".into());}
}
impl CompletionPort for World {
    fn freeze_world_movements(&mut self) {self.events.push("complete_run_owner".into());}
    fn completion_packet(&mut self,opcode:u16,guid:u64,previous:u32) {self.events.push("completion_packet".into());self.packets.push((opcode,guid,previous));}
    fn account_statistics_event(&mut self,kind:&'static str) {assert_eq!(kind,"victory");self.events.push("victory_account".into());}
}
#[test]
fn primary_boss_rewards_phase_and_meter_match_native_arm() {
    let fixture=fixture();assert_eq!(fixture["target_sha256"],"a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589");
    assert_eq!(fixture["death_cases"].as_array().unwrap().len(),300);
    let zones = legacy_boss_zones::by_historical_ordinal();
    for row in fixture["death_cases"].as_array().unwrap() {
        let definition=&zones[n(row,"zone_index") as usize].bosses[n(row,"boss_index") as usize];
        let mut state=BossDeathState {boss_kills:n(row,"kills_before") as u32,clear_marker:n(row,"marker_before") as u32,clear_marked_at:f(row,"marker_time_before_bits")};
        let mut completion=CompletionState {phase:n(row,"phase_before") as u32,phase_started_at:f(row,"phase_start_before_bits"),run_state:1,endless_enabled:false,victories:0};
        let mut deadlines:Vec<f32>=row["magnet_deadlines_before_bits"].as_array().unwrap().iter().map(|v|f32::from_bits(v.as_u64().unwrap() as u32)).collect();
        let mut world=World::default();let mut rng=NativeRng::from_words([1,2,3,4]);
        let input=BossDeathInput {guid:0xf130000000000001,now:f(row,"clock_bits"),position:Position{x:123.,y:456.,z:17.},remaining_live_primary_boss:row["remaining_live_primary_boss"].as_bool().unwrap(),class:4,zone_index:n(row,"zone_index") as usize,
            // The native fixture stubs candidate generation empty. A negative
            // source chance suppresses queued items while existing mob_loot's
            // independent fixtures own the gear RNG/candidate comparison.
            equipment:EquipmentRoll {extra_pickup_mode:row["equipment_suppressed"].as_bool().unwrap(),additive_chance:-1000.,run_options:[100;4]}};
        death::on_boss_death(&mut state,&mut completion,&mut deadlines,definition,definition.name,input,&mut rng,&mut world);
        assert_eq!(state.boss_kills,n(row,"kills_after") as u32);
        assert_eq!(state.clear_marker,n(row,"marker_after") as u32);
        assert_eq!(state.clear_marked_at.to_bits(),n(row,"marker_time_after_bits") as u32);
        assert_eq!(completion.phase,n(row,"phase_after") as u32);
        assert_eq!(completion.phase_started_at.to_bits(),n(row,"phase_start_after_bits") as u32);
        let expected:Vec<u32>=row["magnet_deadlines_after_bits"].as_array().unwrap().iter().map(|v|v.as_u64().unwrap() as u32).collect();
        assert_eq!(deadlines.into_iter().map(f32::to_bits).collect::<Vec<_>>(),expected);
        let expected:Vec<(u32,Option<u32>,[u32;3])>=row["pickups"].as_array().unwrap().iter().map(|p|(n(p,"kind") as u32,p["amount"].as_u64().map(|v|v as u32),std::array::from_fn(|i|p["position_bits"][i].as_u64().unwrap() as u32))).collect();
        assert_eq!(world.pickups,expected);
        let expected:Vec<String>=row["events"].as_array().unwrap().iter().map(|v|v.as_str().unwrap().into()).collect();assert_eq!(world.events,expected);
        assert_eq!(world.accounts,vec![definition.name.to_owned()]);assert!(world.equipment.is_empty());
    }
}
#[test]
fn deferred_completion_gate_and_callback_order_match_native() {
    let fixture=fixture();assert_eq!(fixture["completion_cases"].as_array().unwrap().len(),32);
    for row in fixture["completion_cases"].as_array().unwrap() {
        let mut state=CompletionState {phase:n(row,"phase") as u32,phase_started_at:0.,run_state:n(row,"run_state_before") as u8,endless_enabled:row["endless"].as_bool().unwrap(),victories:n(row,"victories_before") as u32};
        let mut world=World::default();let fired=death::finish_normal_run_with_port(&mut state,0,&mut world);
        assert_eq!(state.run_state,n(row,"run_state_after") as u8);assert_eq!(state.victories,n(row,"victories_after") as u32);
        let expected:Vec<String>=row["events"].as_array().unwrap().iter().map(|v|v.as_str().unwrap().into()).collect();assert_eq!(world.events,expected);
        if fired {assert_eq!(world.packets,vec![(0xe8,0,u32::MAX)]);assert!(!death::finish_normal_run_with_port(&mut state,0,&mut world));}
    }
}
#[test]
fn idle_experience_attraction_matches_native_filter_and_travel() {
    let fixture=fixture();let native=&fixture["attraction"];
    let mut pickups:Vec<ExperiencePickup>=native["pickups"].as_array().unwrap().iter().map(|row|ExperiencePickup {guid:n(row,"guid"),kind:n(row,"kind") as u32,state:n(row,"state_before") as u32,position:Position {x:f32::from_bits(row["position_bits"][0].as_u64().unwrap() as u32),y:f32::from_bits(row["position_bits"][1].as_u64().unwrap() as u32),z:f32::from_bits(row["position_bits"][2].as_u64().unwrap() as u32)},arrives_at:f(row,"arrives_before_bits")}).collect();
    let moves=death::attract_idle_experience(&mut pickups,Position{x:0.,y:0.,z:9.},f(native,"clock_bits"));
    for (actual,row) in pickups.iter().zip(native["pickups"].as_array().unwrap()) {assert_eq!(actual.state,n(row,"state_after") as u32);assert_eq!(actual.arrives_at.to_bits(),n(row,"arrives_after_bits") as u32);}
    assert_eq!(moves.len(),native["moves"].as_array().unwrap().len());
    for (actual,row) in moves.iter().zip(native["moves"].as_array().unwrap()) {assert_eq!(actual.guid,n(row,"guid"));assert_eq!(actual.duration.to_bits(),n(row,"duration_bits") as u32);}
}
#[test]
fn boss_meter_start_stop_and_serialized_timing_match_native() {
    let fixture=fixture();for row in fixture["meter_cases"].as_array().unwrap() {
        let mut marker=n(row,"marker_before") as u32;let mut started=f(row,"started_before_bits");let mut lines=vec![1,2,3];
        death::begin_boss_meter(&mut marker,&mut started,&mut lines,f(row,"now_bits"));
        assert_eq!(marker,n(row,"marker_after") as u32);assert_eq!(started.to_bits(),n(row,"started_after_bits") as u32);assert_eq!(lines.len(),n(row,"line_count_after") as usize);
        let timing=death::boss_meter_timing(n(row,"marker_before") as u32,f(row,"started_before_bits"),f(row,"stopped_bits"),f(row,"now_bits"));
        assert_eq!(timing.is_none(),row["serialized_empty"].as_bool().unwrap());if let Some(timing)=timing {assert_eq!(timing.seconds.to_bits(),n(row,"seconds_bits") as u32);assert_eq!(timing.live,n(row,"marker_before")!=1);}
    }
}
