//! Authored for later compilation; intentionally not run in source-only mode.
use azeroth_survivors_re::enemies::{ai::*, catalog::ZONES, Position};
use serde_json::Value;

fn fixture() -> Value {
    serde_json::from_str(include_str!("fixtures/enemy-ai-0.97.2-native.json")).unwrap()
}
fn f(row: &Value, field: &str) -> f32 {
    f32::from_bits(row[field].as_u64().unwrap() as u32)
}
fn actor() -> Actor {
    Actor {
        guid: 42,
        movement: Movement { from: Position::default(), to: Position::default(), started_at: 0.0, duration: 0.0 },
        next_movement_at: 0.0, attack_delay: 0.0, attack_interval: 3.2,
        melee_reach: 3.0, movement_speed: 5.0, damage: 20.0, movement_angle: 0.0,
        casting: false, cast_ends_at: 0.0, dead: false, died_at: 0.0,
        fear_until: 0.0, stun_until: 0.0, forced_escape_until: 0.0,
        escape: None, slow: TimedReduction::default(), damage_reduction: TimedReduction::default(), whirlwind_until: 0.0,
    }
}
fn context() -> Context {
    Context { now: 10.0, elapsed: 0.0, player: Position::default(), zone_center: Position::default(), zone_radius: 120.0 }
}
struct UnusedWorld;
impl World for UnusedWorld {
    fn sight_clear(&self, _: Position, _: Position) -> bool { true }
    fn ray_fraction(&self, _: Position, _: Position) -> Option<f32> { panic!("unexpected ray query") }
    fn chase_path(&self, _: Position, _: Position, _: f32) -> Option<[f32; 2]> { panic!("unexpected path query") }
}

#[test]
fn native_movement_branch_boundaries() {
    for row in fixture()["movement_cases"].as_array().unwrap() {
        let result = movement_due(f(row,"range_bits"),f(row,"distance_bits"),row["outside"].as_bool().unwrap(),f(row,"now_bits"),f(row,"deadline_bits"));
        let actual = match result { Some(false)=>0, Some(true)=>1, None=>2 };
        assert_eq!(actual,row["result"].as_u64().unwrap());
    }
}

#[test]
fn native_cast_completion_and_no_range_recheck() {
    for row in fixture()["completion_cases"].as_array().unwrap() {
        let mut definition = ZONES[0].enemies[0];
        definition.raw_cast = [row["tag"].as_u64().unwrap() as u32,133,18_f32.to_bits(),1.8_f32.to_bits()];
        let mut enemy = actor();
        enemy.casting = true;
        enemy.cast_ends_at = f(row,"ends_at_bits");
        let mut input = context(); input.now=f(row,"now_bits");input.player.x=10000.0;
        let actions=enemy.tick(&definition,input,&UnusedWorld,&HostMath);
        assert_eq!(enemy.casting,row["casting_after"].as_bool().unwrap());
        assert_eq!(actions.iter().any(|a|matches!(a,Action::CompleteCast {spell_id:133,..})),row["complete"].as_bool().unwrap());
    }
}

#[test]
fn native_attack_timer_and_spell_windup() {
    for row in fixture()["attack_cases"].as_array().unwrap() {
        let mut definition=ZONES[0].enemies[0];
        definition.raw_cast=[row["tag"].as_u64().unwrap() as u32,133,18_f32.to_bits(),1.8_f32.to_bits()];
        let mut enemy=actor();enemy.attack_delay=f(row,"delay_bits");enemy.attack_interval=f(row,"interval_bits");
        let actions=enemy.tick(&definition,context(),&UnusedWorld,&HostMath);
        assert_eq!(enemy.attack_delay.to_bits(),row["after_bits"].as_u64().unwrap() as u32);
        assert_eq!(!actions.is_empty(),row["due"].as_bool().unwrap());
    }
    for row in fixture()["cast_start_cases"].as_array().unwrap() {
        let mut definition=ZONES[0].enemies[0];
        definition.raw_cast=[1,133,18_f32.to_bits(),f(row,"duration_bits").to_bits()];
        let mut enemy=actor();
        let actions=enemy.tick(&definition,context(),&UnusedWorld,&HostMath);
        assert!(matches!(actions.as_slice(),[Action::BeginCast {spell_id:133,..}]));
        assert_eq!(enemy.cast_ends_at.to_bits(),row["ends_at_bits"].as_u64().unwrap() as u32);
    }
}

#[test]
fn native_chase_duration_and_refresh_limits() {
    for row in fixture()["timing_cases"].as_array().unwrap() {
        let (duration,refresh)=chase_timing(Position { x:f(row,"length_bits"),y:0.0,z:999.0 },Position::default(),f(row,"speed_bits"));
        assert_eq!(duration.to_bits(),row["duration_bits"].as_u64().unwrap() as u32);
        assert_eq!((f(row,"now_bits")+refresh).to_bits(),row["next_movement_at_bits"].as_u64().unwrap() as u32);
    }
}

#[test]
fn stun_freezes_attack_timer_and_dead_actors_expire_strictly_after_delay() {
    let definition=&ZONES[0].enemies[0];
    let mut enemy=actor();enemy.attack_delay=2.0;enemy.stun_until=11.0;
    let mut input=context();input.elapsed=0.5;
    assert!(enemy.tick(definition,input,&UnusedWorld,&HostMath).is_empty());
    assert_eq!(enemy.attack_delay,2.0);
    enemy.dead=true;enemy.died_at=0.0;input.now=1.2;
    assert!(enemy.tick(definition,input,&UnusedWorld,&HostMath).is_empty());
    input.now=1.201;
    assert_eq!(enemy.tick(definition,input,&UnusedWorld,&HostMath),vec![Action::Remove {guid:42}]);
}

struct RayWorld;
impl World for RayWorld {
    fn ray_fraction(&self, _: Position, _: Position) -> Option<f32> { None }
    fn chase_path(&self, _: Position, _: Position, _: f32) -> Option<[f32; 2]> { panic!("fear must use a ray") }
}

#[test]
fn native_fear_refresh_preserves_addition_order() {
    for row in fixture()["fear_cases"].as_array().unwrap() {
        let mut enemy=actor();let mut input=context();
        input.now=f(row,"now_bits");enemy.fear_until=input.now+100.0;
        let actions=enemy.tick(&ZONES[0].enemies[0],input,&RayWorld,&HostMath);
        assert!(matches!(actions.as_slice(),[Action::Move(_)]));
        assert_eq!(enemy.next_movement_at.to_bits(),row["next_movement_at_bits"].as_u64().unwrap() as u32);
    }
}

#[test]
fn shared_control_count_survives_expiry_and_covers_mixed_kinds() {
    use azeroth_survivors_re::player_abilities::{behavior::state::{self, ControlWindow}, catalog::StatusEffect};
    let mut enemy = actor();
    let mut control = ControlWindow::default();
    assert!(state::apply_control(&mut enemy, &mut control, true, 10., 10., Position::default()));
    state::expire_control(&mut enemy, &mut control, 21.);
    assert_eq!(control.applications, 1);
    assert_eq!(control.immune_until, 0.);
    assert!(state::apply_actor_reduction_or_fear(&mut enemy, &mut control, true, 30.,
        StatusEffect { tag: 4, value: 10., duration: 0. }));
    assert_eq!(enemy.forced_escape_until, 38.);
    assert_eq!(control.admit(&mut enemy, 50., 10.), Some(6.));
    assert_eq!(control.applications, 3);
}

#[test]
fn sixth_control_clears_all_kinds_and_admits_at_immunity_boundary() {
    use azeroth_survivors_re::player_abilities::behavior::state::ControlWindow;
    let mut enemy = actor();
    let mut control = ControlWindow::default();
    for duration in [10., 8., 6., 4., 2.] {
        assert_eq!(control.admit(&mut enemy, 10., 10.), Some(duration));
    }
    enemy.stun_until = 20.;
    enemy.fear_until = 30.;
    enemy.forced_escape_until = 40.;
    assert_eq!(control.admit(&mut enemy, 11., 10.), None);
    assert_eq!((enemy.stun_until, enemy.fear_until, enemy.forced_escape_until), (11., 11., 11.));
    assert_eq!(enemy.next_movement_at, 11.);
    assert_eq!(control.applications, 0);
    assert_eq!(control.admit(&mut enemy, 18.999, 10.), None);
    assert_eq!(control.admit(&mut enemy, 19., 10.), Some(10.));
}

#[test]
fn elite_control_cap_precedes_diminishing_returns_and_slows_do_not_count() {
    use azeroth_survivors_re::player_abilities::{behavior::state::{self, ControlWindow}, catalog::StatusEffect};
    let mut enemy = actor();
    let mut control = ControlWindow::for_enemy(true);
    assert!(state::apply_actor_reduction_or_fear(&mut enemy, &mut control, true, 10.,
        StatusEffect { tag: 1, value: 0.5, duration: 4. }));
    assert_eq!(control.applications, 0);
    assert_eq!(control.admit(&mut enemy, 10., 10.), Some(1.));
    assert_eq!(control.admit(&mut enemy, 10., 10.), Some(0.8));
}

struct SightWorld(bool);
impl World for SightWorld {
    fn ray_fraction(&self, _: Position, _: Position) -> Option<f32> { None }
    fn sight_clear(&self, _: Position, _: Position) -> bool { self.0 }
    fn chase_path(&self, _: Position, _: Position, _: f32) -> Option<[f32; 2]> { None }
}

#[test]
fn blocked_caster_walks_close_retries_on_movement_clock_and_casts_when_clear() {
    let mut definition = ZONES[0].enemies[0];
    definition.raw_cast = [1, 133, 18_f32.to_bits(), 1.8_f32.to_bits()];
    let mut enemy = actor();
    enemy.movement.from.x = 10.0;
    enemy.movement.to.x = 10.0;
    let input = context();
    let actions = enemy.tick(&definition, input, &SightWorld(false), &HostMath);
    let [Action::Move(movement)] = actions.as_slice() else { panic!("blocked caster must chase") };
    assert!(!enemy.casting);
    assert!((movement.to.x.hypot(movement.to.y) - 1.5).abs() < 0.00001);
    assert!(enemy.tick(&definition, input, &SightWorld(false), &HostMath).is_empty(),
        "same-clock retries wait for the ordinary movement deadline");
    let actions = enemy.tick(&definition, input, &SightWorld(true), &HostMath);
    assert!(actions.iter().any(|action| matches!(action, Action::BeginCast { spell_id: 133, .. })));
}

#[test]
fn caster_completion_rechecks_sight_without_restarting_the_attack_timer() {
    let mut definition = ZONES[0].enemies[0];
    definition.raw_cast = [1, 133, 18_f32.to_bits(), 1.8_f32.to_bits()];
    for clear in [false, true] {
        let mut enemy = actor();
        enemy.casting = true;
        enemy.cast_ends_at = 10.0;
        enemy.attack_delay = 2.0;
        let actions = enemy.tick(&definition, context(), &SightWorld(clear), &HostMath);
        assert!(!enemy.casting);
        assert_eq!(enemy.attack_delay, 2.0);
        assert_eq!(actions.iter().any(|action| matches!(action, Action::CompleteCast { .. })), clear);
    }
}
