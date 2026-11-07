//! Authored native-oracle comparisons. Not compiled/run in source-only mode.
use azeroth_survivors_re::{bosses::{ai::*,abilities::*,catalog::ZONES,NativeRng,RawBossAbility},enemies::{ai::*,Position}};
use serde_json::Value;

fn fixture() -> Value { serde_json::from_str(include_str!("fixtures/boss-ai-native.json")).unwrap() }
fn f(row: &Value,key: &str) -> f32 { f32::from_bits(row[key].as_u64().unwrap() as u32) }
fn actor() -> Actor {
    Actor {
        guid:42,movement:Movement {from:Position::default(),to:Position::default(),started_at:0.0,duration:0.0},
        next_movement_at:0.0,attack_delay:0.0,attack_interval:2.0,melee_reach:3.0,movement_speed:5.0,
        damage:20.0,movement_angle:0.0,casting:false,cast_ends_at:0.0,dead:false,died_at:0.0,
        fear_until:0.0,stun_until:0.0,forced_escape_until:0.0,escape:None,
        slow:TimedReduction::default(),damage_reduction:TimedReduction::default(),whirlwind_until:0.0,
    }
}

#[test]
fn enrage_boundaries_and_latch_match_native_instructions() {
    for row in fixture()["enrage_cases"].as_array().unwrap() {
        let mut state=BossAiState {enraged:row["latched"].as_bool().unwrap(),cooldowns:vec![],raid_schedule:Default::default(),raid_cast_until:0.0,raid_hold_until:0.0};
        state.advance(&ZONES[0].bosses[0],0,0.0,f(row,"health_bits"),f(row,"max_health_bits"));
        assert_eq!(state.enraged,row["enraged_after"].as_bool().unwrap());
    }
}

#[test]
fn all_boss_ability_timer_slots_match_native_instructions() {
    for row in fixture()["timer_cases"].as_array().unwrap() {
        let zone=ZONES.iter().find(|z|z.key==row["zone"].as_str().unwrap()).unwrap();
        let boss=&zone.bosses[row["boss_index"].as_u64().unwrap() as usize];
        let original_slot=row["ability_index"].as_u64().unwrap() as usize;
        let historical: Value=serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/bosses/catalog.json")).unwrap();
        let old_zone=historical["zones"].as_array().unwrap().iter()
            .find(|z| z["key"]==row["zone"]).unwrap();
        let old=&old_zone["bosses"][row["boss_index"].as_u64().unwrap() as usize]
            ["abilities"][original_slot]["words"];
        if matches!(old[0].as_u64().unwrap(), 1 | 2) { continue; }
        let slot=boss.abilities.iter().position(|ability| ability.words.iter().enumerate()
            .all(|(i, word)| u64::from(*word)==old[i].as_u64().unwrap())).unwrap();
        let mut state=BossAiState {enraged:row["enraged"].as_bool().unwrap(),cooldowns:vec![10000.0;boss.abilities.len()],raid_schedule:Default::default(),raid_cast_until:0.0,raid_hold_until:0.0};
        state.cooldowns[slot]=f(row,"timer_bits");
        let due=state.advance(boss,7,f(row,"elapsed_bits"),100.0,100.0);
        assert_eq!(state.cooldowns[slot].to_bits(),row["after_bits"].as_u64().unwrap() as u32);
        assert_eq!(!due.is_empty(),row["due"].as_bool().unwrap());
        if !due.is_empty() { assert_eq!(due[0].actor_index,7);assert_eq!(due[0].ability.words,boss.abilities[slot].words); }
    }
}

struct TestWorld;
impl World for TestWorld {
    fn ray_fraction(&self,_:Position,_:Position)->Option<f32> {None}
    fn chase_path(&self,_:Position,_:Position,_:f32)->Option<[f32;2]> {None}
}
struct AxisMath;
impl Math for AxisMath {
    fn cos(&self,_:f32)->f32 {1.0}
    fn sin(&self,_:f32)->f32 {0.0}
    fn hypot(&self,x:f32,y:f32)->f32 {x.hypot(y)}
}
fn context() -> Context {
    Context {now:10.0,elapsed:0.0,player:Position::default(),zone_center:Position::default(),zone_radius:120.0}
}

#[test]
fn current_damage_and_movement_modifiers_match_native_instructions() {
    for row in fixture()["damage_cases"].as_array().unwrap() {
        let mut combat=actor();combat.damage=f(row,"base_bits");
        combat.damage_reduction=TimedReduction {fraction:f(row,"fraction_bits"),until:f(row,"until_bits")};
        let snapshot=AbilityActor {actor:combat,enraged:row["enraged"].as_bool().unwrap()};
        assert_eq!(effective_ability_damage(snapshot,f(row,"now_bits")).to_bits(),row["after_bits"].as_u64().unwrap() as u32);
    }
    for row in fixture()["speed_cases"].as_array().unwrap() {
        let mut combat=actor();combat.movement_speed=f(row,"base_bits");
        combat.movement.from.x=10.0;combat.movement.to.x=10.0;
        combat.slow=TimedReduction {fraction:f(row,"fraction_bits"),until:f(row,"until_bits")};
        let from=combat.movement.to;
        let destination=Position {x:combat.melee_reach*0.8,y:0.0,z:0.0};
        let expected=chase_timing(from,destination,f(row,"after_bits")).0;
        let mut state=BossAiState {enraged:row["enraged"].as_bool().unwrap(),cooldowns:vec![],raid_schedule:Default::default(),raid_cast_until:0.0,raid_hold_until:0.0};
        let mut input=context();input.now=f(row,"now_bits");
        let mut legacy_boss = ZONES[0].bosses[0];
        legacy_boss.id = 0;
        let output=state.tick(&legacy_boss,0,&mut combat,100.0,100.0,input,&TestWorld,&AxisMath);
        assert!(matches!(output.common_actions.as_slice(),[Action::Move(_)]));
        assert_eq!(combat.movement.duration.to_bits(),expected.to_bits());
    }
}

#[test]
fn native_status_order_prevents_enrage_and_timers_while_spawn_stunned() {
    let boss=&ZONES[0].bosses[0];let mut state=BossAiState::new(boss);
    let before=state.cooldowns.clone();let mut combat=actor();combat.stun_until=11.0;
    let output=state.tick(boss,0,&mut combat,29.0,100.0,context(),&TestWorld,&AxisMath);
    assert!(output.abilities.is_empty());assert!(output.common_actions.is_empty());
    assert!(!state.enraged);assert_eq!(state.cooldowns,before);
    let mut input=context();input.now=11.0;
    let output=state.tick(boss,0,&mut combat,29.0,100.0,input,&TestWorld,&AxisMath);
    assert!(state.enraged);
    assert_eq!(output.common_actions,vec![Action::Melee {source_guid:42,damage:20.0*1.4}]);
    assert_eq!(combat.attack_delay,2.0);
}

#[test]
fn current_phase_summon_waits_for_the_admitted_actor_stage() {
    use azeroth_survivors_re::bosses::minion_phases::PhaseState;
    let boss = &ZONES[0].bosses[4];
    let mut state = BossAiState::new(boss);
    state.cooldowns.fill(f32::INFINITY);
    let mut phases = PhaseState::default();
    let mut combat = actor();
    combat.stun_until = 11.0;
    let blocked = state.tick_with_minion_phases(boss, 4, &mut combat, 49.0, 100.0,
        context(), &TestWorld, &AxisMath, &mut phases);
    assert!(blocked.abilities.is_empty() && blocked.phase_yells.is_empty());
    let mut input = context();
    input.now = 11.0;
    let due = state.tick_with_minion_phases(boss, 4, &mut combat, 49.0, 100.0,
        input, &TestWorld, &AxisMath, &mut phases);
    assert_eq!(due.abilities.len(), 1);
    assert_eq!(due.abilities[0].ability.words, [2, 8, 0, 0, 0, 0, 0]);
    assert_eq!(due.phase_yells.len(), 1);
    assert_eq!(due.phase_yells[0].boss_id, 694);
}

#[test]
fn overshoot_discards_catchup_and_keeps_slot_order() {
    let boss=&ZONES[0].bosses[0];let mut state=BossAiState::new(boss);
    let due=state.advance(boss,2,100.0,100.0,100.0);
    assert_eq!(due.len(),boss.abilities.len());
    for (request,ability) in due.iter().zip(boss.abilities) { assert_eq!(request.ability.words,ability.words); }
}

struct DeferredPort { actors:Vec<Option<AbilityActor>>, yells:Vec<u64> }
impl CombatPort for DeferredPort {
    fn primary_height(&mut self,_:[f32;2])->Option<f32> {panic!("unexpected terrain")}
    fn secondary_height(&mut self,_:[f32;2])->Option<f32> {panic!("unexpected terrain")}
    fn fallback_height(&self)->f32 {panic!("unexpected terrain")}
    fn ray_fraction(&mut self,_:Position,_:Position)->Option<f32> {panic!("unexpected ray")}
    fn cast_spell(&mut self,_:SpellCast) {panic!("unexpected spell")}
    fn create_ground_object(&mut self,_:GroundObject) {panic!("unexpected object")}
    fn remove_ground_object(&mut self,_:u64) {panic!("unexpected object")}
    fn spawn_minion(&mut self,_:MinionSpawn,_:&mut NativeRng,_:&mut dyn azeroth_survivors_re::native_counter::NativeCounter) {panic!("unexpected minion")}
    fn begin_charge(&mut self,_:Charge) {panic!("unexpected charge")}
    fn yell(&mut self,guid:u64,_:&'static str) {self.yells.push(guid)}
    fn player_position(&self)->Position {Position::default()}
    fn damage_player(&mut self,_:f32,_:u64, _: u32) {panic!("unexpected damage")}
}
impl DispatchPort for DeferredPort {
    fn ability_actor(&self,index:usize)->Option<AbilityActor> {self.actors.get(index).copied().flatten()}
    fn player_guid(&self)->u64 {99}
}

#[test]
fn deferred_dispatch_rechecks_bounds_and_dead_state_and_honors_terminator() {
    let live=actor();let mut dead=live;dead.dead=true;
    let mut port=DeferredPort {actors:vec![Some(AbilityActor{actor:dead,enraged:false}),Some(AbilityActor{actor:live,enraged:false})],yells:vec![]};
    let ability=RawBossAbility {words:[2,0,0,0,0,0,0]};
    let requests=[QueuedAbility {actor_index:99,ability},QueuedAbility {actor_index:0,ability},
        QueuedAbility {actor_index:1,ability},QueuedAbility {actor_index:99,ability:RawBossAbility {words:[u32::MAX,0,0,0,0,0,0]}},QueuedAbility {actor_index:1,ability}];
    let mut rng=NativeRng::from_words([1,2,3,4]);let mut counter:u32=0;
    let count=dispatch_queued(&requests,10.0,&mut rng,&mut counter,&mut PendingEffects::default(),&mut port,&AxisMath).unwrap();
    assert_eq!(count,1);assert_eq!(port.yells,vec![42]);assert_eq!(counter,0);
}


#[test]
fn current_circle_catalog_replaces_old_live_producers_without_duplicate_minions() {
    use azeroth_survivors_re::bosses::raid_area_catalog::current_schedule;
    for zone in ZONES {
        for boss in zone.bosses {
            let schedule = current_schedule(boss.id).unwrap();
            let mut state = BossAiState::new(boss);
            for (timer, row) in state.raid_schedule.cooldowns.iter().zip(schedule.moves) {
                assert_eq!(*timer, f32::from_bits(row.ability.words[6]) * 0.6);
            }
            state.cooldowns.fill(0.0);
            state.raid_schedule.cooldowns.fill(0.0);
            let mut combat = actor();
            let output = state.tick(boss, 3, &mut combat, 100.0, 100.0,
                context(), &TestWorld, &AxisMath);
            assert!(output.abilities.iter().all(|request| !matches!(request.ability.words[0], 0 | 3)));
            assert_eq!(output.abilities.iter().filter(|request| request.ability.words[0] == 2).count(), 1);
            assert!(output.abilities.iter().filter(|request| matches!(request.ability.words[0], 5 | 6)).count() <= 1);
        }
    }
}

#[test]
fn current_extra_ground_slot_waits_overdue_until_the_cast_gate_expires() {
    let boss = &ZONES.iter().find(|zone| zone.key == "feralas").unwrap().bosses[1];
    assert_eq!(boss.id, 891);
    let mut state = BossAiState::new(boss);
    state.cooldowns.fill(f32::INFINITY);
    state.raid_schedule.cooldowns.fill(0.0);
    let mut combat = actor();
    let first = state.tick(boss, 0, &mut combat, 100.0, 100.0,
        context(), &TestWorld, &AxisMath);
    assert_eq!(first.abilities.iter().map(|request| request.ability.words[0]).collect::<Vec<_>>(), vec![5, 2]);
    // Alzzin has two native ground slots. The first occupies this tick's
    // blocking admission; the second retains its overdue remaining duration.
    assert_eq!(state.raid_schedule.cooldowns[1], 0.0);
    state.raid_cast_until = 11.0;
    let blocked = state.tick(boss, 0, &mut combat, 100.0, 100.0,
        context(), &TestWorld, &AxisMath);
    assert!(blocked.abilities.is_empty());
    assert_eq!(state.raid_schedule.cooldowns[1], 0.0);
    let mut input = context(); input.now = 11.0;
    let second = state.tick(boss, 0, &mut combat, 100.0, 100.0,
        input, &TestWorld, &AxisMath);
    assert_eq!(second.abilities.len(), 1);
    assert_eq!(second.abilities[0].ability.words[0], 5);
    assert_eq!(second.abilities[0].ability.words[1], 0);
}

#[test]
fn current_raid_hold_freezes_the_whole_admitted_boss_stage() {
    let boss = &ZONES[0].bosses[1];
    let mut state = BossAiState::new(boss);
    state.raid_schedule.cooldowns.fill(0.0);
    state.raid_hold_until = 11.0;
    let before = state.raid_schedule.clone();
    let mut combat = actor();
    let output = state.tick(boss, 0, &mut combat, 1.0, 100.0,
        context(), &TestWorld, &AxisMath);
    assert!(output.common_actions.is_empty() && output.abilities.is_empty());
    assert!(!state.enraged);
    assert_eq!(state.raid_schedule, before);
    assert_eq!(combat.attack_delay, 0.0);
}
