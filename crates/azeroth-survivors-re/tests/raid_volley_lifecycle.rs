//! Current hazard regression source; not compiled or run by static recovery.
use azeroth_survivors_re::{bosses::{abilities::*, NativeRng, Position, RawBossAbility},
    enemies::ai::HostMath, native_counter::NativeCounter};
use serde_json::Value;

#[derive(Default)]
struct Port {
    messages: Vec<Value>, damage: Vec<(f32,u64)>, casts: Vec<SpellCast>,
    heights: u32, player: Position, before_endless: bool, dead: bool,
}
impl CombatPort for Port {
    fn raid_marker(&mut self, message: Value) { self.messages.push(message); }
    fn raid_source(&self, _: u64) -> Option<Position> {
        if self.dead { None } else { Some(Position::default()) }
    }
    fn raid_damage_multiplier(&self) -> f32 { if self.before_endless { 2. } else { 1. } }
    fn primary_height(&mut self, _: [f32;2]) -> Option<f32> {
        self.heights += 1; Some(self.heights as f32)
    }
    fn secondary_height(&mut self, _: [f32;2]) -> Option<f32> { unreachable!() }
    fn fallback_height(&self) -> f32 { unreachable!() }
    fn ray_fraction(&mut self, _: Position, _: Position) -> Option<f32> { None }
    fn cast_spell(&mut self, request: SpellCast) { self.casts.push(request); }
    fn create_ground_object(&mut self, _: GroundObject) { panic!("volley has no dynamic object") }
    fn remove_ground_object(&mut self, _: u64) { panic!("volley has no dynamic object") }
    fn spawn_minion(&mut self, _: MinionSpawn, _: &mut NativeRng, _: &mut dyn NativeCounter) { unreachable!() }
    fn begin_charge(&mut self, _: Charge) { unreachable!() }
    fn yell(&mut self, _: u64, _: &'static str) { unreachable!() }
    fn player_position(&self) -> Position { self.player }
    fn damage_player(&mut self, amount: f32, source: u64) { self.damage.push((amount,source)); }
}
fn context(source: u64) -> CombatContext {
    CombatContext { source_guid: source, player_guid: 1, now: 0.,
        source: Position::default(), player: Position::default(), effective_damage: 100. }
}
fn volley(state: &mut PendingEffects, port: &mut Port, source: u64) {
    dispatch(&RawBossAbility { words: [1,26053,1,0,0,0,0] },context(source),
        &mut NativeRng::from_words([1,2,3,4]), &mut 0u32,state,port,&HostMath).unwrap();
}

#[test]
fn living_fixed_volley_resamples_marker_ground_after_the_cast() {
    let mut state=PendingEffects::default();let mut port=Port::default();
    volley(&mut state,&mut port,7);
    assert!(state.impacts.is_empty());assert!(port.messages.is_empty());
    assert_eq!(port.casts[0].target,CastTarget::Ground(Position{x:0.,y:0.,z:1.}));
    state.resolve_due(0.1,&mut port);
    assert_eq!(port.messages[0]["type"],"hz");assert_eq!(port.messages[0]["id"],1);
    assert_eq!(port.messages[0]["z"],2.);assert_eq!(port.messages[0]["r"],2.5);
    assert_eq!(port.messages[0]["t1"],0.6f32);
    port.player=Position{x:2.5,y:0.,z:10000.};
    state.resolve_due(0.6,&mut port);
    assert_eq!(port.damage,[(45.,7)]);assert_eq!(port.casts.len(),1);
}

#[test]
fn dead_source_cancels_unpublished_volley_without_retracting_its_initial_cast() {
    let mut state=PendingEffects::default();let mut port=Port{dead:true,..Default::default()};
    volley(&mut state,&mut port,7);
    assert_eq!(port.casts.len(),1);
    let heights=port.heights;state.resolve_due(0.1,&mut port);
    assert_eq!(port.heights,heights);assert!(port.damage.is_empty());
    assert_eq!(port.messages.len(),1);assert_eq!(port.messages[0]["type"],"hzt");
    port.messages.clear();state.resolve_due(10.,&mut port);
    assert!(port.messages.is_empty() && port.damage.is_empty());
    assert_eq!(port.casts.len(),1);
}

#[test]
fn death_after_volley_publication_ends_marker_once_and_prevents_due_damage() {
    let mut state=PendingEffects::default();let mut port=Port::default();
    volley(&mut state,&mut port,7);state.resolve_due(0.1,&mut port);
    port.dead=true;port.messages.clear();state.resolve_due(0.6,&mut port);
    assert_eq!(port.messages[0]["type"],"hzend");assert_eq!(port.messages[0]["id"],1);
    assert_eq!(port.messages[1]["type"],"hzt");assert!(port.damage.is_empty());
    port.messages.clear();state.resolve_due(10.,&mut port);
    assert!(port.messages.is_empty() && port.damage.is_empty());
    assert_eq!(port.casts.len(),1);
}

#[test]
fn simultaneous_volleys_sum_once_keep_last_source_and_end_markers_in_reverse_order() {
    let mut state=PendingEffects::default();let mut port=Port::default();
    volley(&mut state,&mut port,7);volley(&mut state,&mut port,8);
    state.resolve_due(0.1,&mut port);port.messages.clear();
    state.resolve_due(0.6,&mut port);
    assert_eq!(port.damage,[(90.,8)]);
    assert_eq!(port.messages[0]["type"],"hzend");assert_eq!(port.messages[0]["id"],2);
    assert_eq!(port.messages[1]["id"],1);assert_eq!(port.messages[2]["type"],"hzt");
    assert!(port.messages[2].get("in").is_none());
    port.messages.clear();state.resolve_due(1.,&mut port);
    assert!(port.messages.is_empty());assert_eq!(port.damage.len(),1);
}

#[test]
fn circles_and_volleys_share_one_serial_and_the_same_due_damage_accumulator() {
    let mut state=PendingEffects::default();let mut port=Port::default();
    state.raid_areas.dispatch(&RawBossAbility{words:[5,0,0,5f32.to_bits(),
        0.6f32.to_bits(),2f32.to_bits(),0]},context(7),&mut port);
    volley(&mut state,&mut port,8);state.resolve_due(0.1,&mut port);
    assert_eq!(port.messages[0]["id"],1);assert_eq!(port.messages[1]["id"],2);
    state.resolve_due(0.6,&mut port);assert_eq!(port.damage,[(245.,8)]);
}

#[test]
fn pre_endless_damage_multiplier_applies_once_to_the_accumulated_hit() {
    let mut state=PendingEffects::default();
    let mut port=Port{before_endless:true,..Default::default()};
    volley(&mut state,&mut port,7);volley(&mut state,&mut port,8);
    state.resolve_due(0.6,&mut port);assert_eq!(port.damage,[(180.,8)]);
}

#[test]
fn unpublished_volley_expiry_has_no_create_or_end_pair_and_uses_current_player_xy() {
    let mut state=PendingEffects::default();let mut port=Port::default();
    volley(&mut state,&mut port,7);port.player.x=2.501;
    state.resolve_due(1.,&mut port);
    assert!(port.damage.is_empty());assert_eq!(port.messages.len(),1);
    assert_eq!(port.messages[0]["type"],"hzt");
}
