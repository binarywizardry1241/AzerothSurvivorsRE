//! Native fixture checks authored for later compilation; not run now.
use azeroth_survivors_re::bosses::{
    catalog::{BossDefinition,ZoneDefinition,ZONES},
    placement::{admit_distance,prefer_later_distance,uniform_point},
    spawning::{Scheduler,SpawnPort,startup_bosses},NativeRng,
};
use serde_json::Value;
#[path = "fixtures/legacy_boss_zones.rs"]
mod legacy_boss_zones;
fn fixture() -> Value {serde_json::from_str(include_str!("fixtures/boss-spawning-native.json")).unwrap()}
fn f(v: &Value) -> f32 {f32::from_bits(v.as_u64().unwrap() as u32)}
fn words(v: &Value) -> [u64;4] {std::array::from_fn(|i|v[i].as_u64().unwrap())}
#[derive(Default)]struct Port(Vec<(usize,u32)>, bool);
impl SpawnPort for Port {
    fn has_living_primary_boss(&self) -> bool { self.1 }
    fn spawn_boss(&mut self,index:usize,definition:&'static BossDefinition,_:&mut NativeRng) {self.0.push((index,definition.id));}
}
#[test]
fn native_primary_and_endless_schedule_and_rng_match() {
    let zones = legacy_boss_zones::by_historical_ordinal();
    for row in fixture()["schedule"].as_array().unwrap() {
        let zone=zones[row["zone_index"].as_u64().unwrap() as usize];
        let mut schedule=Scheduler {next_primary:row["next_primary"].as_u64().unwrap() as usize,endless_deadline:f(&row["deadline_bits"])};
        let mut rng=NativeRng::from_words(words(&row["seed"]));let mut port=Port::default();
        schedule.tick(zone,f(&row["clock_bits"]),row["endless"].as_bool().unwrap(),false,&mut rng,&mut port);
        let expected:Vec<_>=row["calls"].as_array().unwrap().iter().map(|v|v["index"].as_u64().unwrap() as usize).collect();
        assert_eq!(port.0.iter().map(|v|v.0).collect::<Vec<_>>(),expected);
        assert_eq!(schedule.next_primary,row["next_after"].as_u64().unwrap() as usize);
        assert_eq!(schedule.endless_deadline.to_bits(),row["deadline_after"].as_u64().unwrap() as u32);
        assert_eq!(rng.words,words(&row["rng_after"]));
    }
}

#[test]
fn scholomance_waits_for_live_primary_and_catches_up_one_boss_at_a_time() {
    let zone = ZoneDefinition::by_key("scholomance").unwrap();
    let mut schedule = Scheduler { next_primary: 1, endless_deadline: 0.0 };
    let mut rng = NativeRng::from_words([1, 2, 3, 4]);
    let mut port = Port(Vec::new(), true);
    assert_eq!(schedule.tick(zone, 960.0, false, false, &mut rng, &mut port), None);
    assert_eq!(schedule.next_primary, 1);
    assert!(port.0.is_empty());
    assert_eq!(rng.words, [1, 2, 3, 4]);

    port.1 = false;
    assert_eq!(schedule.tick(zone, 960.0, false, false, &mut rng, &mut port), Some(1));
    assert_eq!(schedule.next_primary, 2);
    assert_eq!(port.0, [(1, 10508)]);

    port.1 = true;
    assert_eq!(schedule.tick(&ZONES[0], 960.0, false, false, &mut rng, &mut port), Some(2));
}
#[test]
fn native_point_admission_total_order_and_uniform_rng_match() {
    let fixture=fixture();
    for row in fixture["point_filters"].as_array().unwrap() {
        assert_eq!(admit_distance(f(&row["distance_bits"])),row["admitted"].as_bool().unwrap());
    }
    for row in fixture["farthest_comparisons"].as_array().unwrap() {
        assert_eq!(prefer_later_distance(f(&row["current_bits"]),f(&row["candidate_bits"])),row["choose_candidate"].as_bool().unwrap());
    }
    for row in fixture["point_draws"].as_array().unwrap() {
        let mut rng=NativeRng::from_words(words(&row["seed"]));
        assert_eq!(uniform_point(row["count"].as_u64().unwrap() as usize,&mut rng),row["index"].as_u64().unwrap() as usize);
        assert_eq!(rng.words,words(&row["rng_after"]));
    }
}
#[test]
fn suppression_and_raw_startup_flag_preserve_recovered_scope() {
    let mut scheduler=Scheduler::default();let mut rng=NativeRng::from_words([1,2,3,4]);let mut port=Port::default();
    assert!(scheduler.tick(&ZONES[0],10000.0,true,true,&mut rng,&mut port).is_none());
    assert_eq!(scheduler.next_primary,0);assert_eq!(rng.words,[1,2,3,4]);
    startup_bosses(&ZONES[0],0,&mut rng,&mut port);assert!(port.0.is_empty());
    startup_bosses(&ZONES[0],1,&mut rng,&mut port);
    assert_eq!(port.0.iter().map(|p|p.0).collect::<Vec<_>>(),vec![0,1,2,3,4]);
    assert_eq!(scheduler.next_primary,0);
}
