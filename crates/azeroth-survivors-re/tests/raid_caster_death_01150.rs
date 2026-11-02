//! 0.115.0 common source-gate/removal regressions; intentionally not compiled/run.
//! Existing catalog inputs keep their documented 0.109.0 producer provenance.
use azeroth_survivors_re::{
    bosses::{abilities::*, raid_native_catalog::native_action, NativeRng, Position, RawBossAbility},
    enemies::ai::HostMath,
    native_counter::NativeCounter,
};
use serde_json::Value;

#[derive(Debug, PartialEq)]
enum Event {
    Marker(String, u32),
    Create(u64),
    Remove(u64),
    Spell(u32),
    Damage,
    Spawn,
}

#[derive(Default)]
struct Port {
    sources: Vec<u64>,
    player: Position,
    markers: Vec<Value>,
    objects: Vec<GroundObject>,
    removed: Vec<u64>,
    casts: Vec<SpellCast>,
    damage: Vec<(f32, u64)>,
    spawns: Vec<(u32, u32, Position)>,
    events: Vec<Event>,
    object_counter: u32,
    height_reads: usize,
}

impl CombatPort for Port {
    fn raid_source(&self, guid: u64) -> Option<Position> {
        self.sources.contains(&guid).then_some(point(500.))
    }
    fn raid_marker(&mut self, value: Value) {
        self.events.push(Event::Marker(value["type"].as_str().unwrap().to_owned(),
            value["id"].as_u64().unwrap_or(0) as u32));
        self.markers.push(value);
    }
    fn raid_dynamic_object(&mut self, spell: u32, radius: f32, point: Position) -> u64 {
        let object=ground_object(&mut self.object_counter,1,spell,radius,point);
        let guid=object.guid;self.create_ground_object(object);guid
    }
    fn raid_spawn_at(&mut self, kind: u32, index: u32, point: Position) {
        self.spawns.push((kind,index,point));self.events.push(Event::Spawn);
    }
    fn primary_height(&mut self, _: [f32;2]) -> Option<f32> {
        self.height_reads+=1;Some(4.)
    }
    fn secondary_height(&mut self, _: [f32;2]) -> Option<f32> { unreachable!() }
    fn fallback_height(&self) -> f32 { unreachable!() }
    fn ray_fraction(&mut self, _: Position, _: Position) -> Option<f32> { unreachable!() }
    fn cast_spell(&mut self, cast: SpellCast) {
        self.events.push(Event::Spell(cast.spell_id));self.casts.push(cast);
    }
    fn create_ground_object(&mut self, object: GroundObject) {
        self.events.push(Event::Create(object.guid));self.objects.push(object);
    }
    fn remove_ground_object(&mut self, guid: u64) {
        self.events.push(Event::Remove(guid));self.removed.push(guid);
    }
    fn spawn_minion(&mut self, _: MinionSpawn, _: &mut NativeRng, _: &mut dyn NativeCounter) { unreachable!() }
    fn begin_charge(&mut self, _: Charge) { unreachable!() }
    fn yell(&mut self, _: u64, _: &'static str) { unreachable!() }
    fn player_position(&self) -> Position { self.player }
    fn damage_player(&mut self, amount: f32, source: u64) {
        self.events.push(Event::Damage);self.damage.push((amount,source));
    }
}

fn point(x: f32) -> Position { Position{x,y:0.,z:4.} }
fn context(source_guid: u64) -> CombatContext {
    CombatContext {source_guid,player_guid:1,now:10.,source:point(0.),
        player:point(20.),effective_damage:100.}
}
fn circle() -> RawBossAbility {
    RawBossAbility {words:[5,0,0,5f32.to_bits(),5f32.to_bits(),2f32.to_bits(),0]}
}
fn queue_extra(state: &mut PendingEffects, port: &mut Port, index: usize, source: u64) {
    assert!(state.raid_areas.dispatch_current_with_rng(&native_action(index),context(source),
        port,&mut NativeRng::from_words([1,2,3,4]),&HostMath));
}
fn marker(kind: &str, id: u32) -> Event { Event::Marker(kind.to_owned(),id) }

#[test]
fn published_fixed_hazards_cancel_in_reverse_order_and_remove_active_object_before_marker() {
    let mut state=PendingEffects::default();
    let mut port=Port {sources:vec![7,8],player:point(20.),..Default::default()};
    state.raid_areas.dispatch(&circle(),context(7),&mut port); // id1, dying source.
    state.raid_areas.dispatch(&circle(),context(8),&mut port); // id2, living source.
    queue_extra(&mut state,&mut port,0x45,7); // id3: 5740, 3s tell, 8s Aftershock.
    state.resolve_due(10.1,&mut port);
    state.resolve_due(13.,&mut port);
    assert_eq!(port.objects.len(),1);
    let object=port.objects[0].guid;
    let casts=port.casts.len();let heights=port.height_reads;
    assert!(port.markers.iter().any(|v|v["id"]==3 && v["kind"]=="pool"));
    port.events.clear();port.damage.clear();port.markers.clear();

    port.sources.retain(|guid|*guid!=7);
    // The active Aftershock tick is due now, and the fixed circle is still pending.
    state.resolve_due(14.,&mut port);
    assert_eq!(port.events,[Event::Remove(object),marker("hzend",3),
        marker("hzend",1),marker("hzt",0)]);
    assert_eq!(port.height_reads,heights);
    assert!(port.damage.is_empty() && port.spawns.is_empty());
    assert_eq!(port.casts.len(),casts);assert_eq!(port.objects.len(),1);

    port.events.clear();state.resolve_due(14.,&mut port);
    assert_eq!(port.events,[marker("hzt",0)]);
    // Reappearance of the same GUID cannot resurrect a removed hazard/object.
    port.sources.push(7);state.resolve_due(14.5,&mut port);
    state.resolve_due(15.,&mut port);
    assert_eq!(port.damage,[(200.,8)]); // The other source's fixed row survived.
    assert_eq!(port.removed,[object]);assert_eq!(port.objects.len(),1);
    assert_eq!(port.casts.len(),casts);assert!(port.spawns.is_empty());
    let ended:Vec<_>=port.markers.iter().filter(|v|v["type"]=="hzend")
        .map(|v|v["id"].as_u64().unwrap()).collect();
    assert_eq!(ended,[3,1,2]);
    port.markers.clear();state.resolve_due(30.,&mut port);
    assert!(port.markers.is_empty());assert_eq!(port.damage,[(200.,8)]);
}

#[test]
fn missing_source_cancels_unpublished_fixed_aftershock_and_spawn_rows_before_kind_updates() {
    let mut state=PendingEffects::default();let mut port=Port {player:point(20.),..Default::default()};
    state.raid_areas.dispatch(&circle(),context(7),&mut port);
    queue_extra(&mut state,&mut port,0x45,7);
    queue_extra(&mut state,&mut port,0x3e,7); // Existing three-meteor spawn action.
    let heights=port.height_reads;
    state.resolve_due(20.,&mut port);
    assert_eq!(port.events,[marker("hzt",0)]);
    assert_eq!(port.height_reads,heights);
    assert!(port.damage.is_empty() && port.objects.is_empty() && port.removed.is_empty());
    assert!(port.casts.is_empty() && port.spawns.is_empty());
    port.events.clear();port.sources.push(7);state.resolve_due(30.,&mut port);
    assert!(port.events.is_empty());
}

#[test]
fn aftershock_natural_expiry_uses_the_same_single_object_then_marker_cleanup() {
    let mut state=PendingEffects::default();
    let mut port=Port {sources:vec![7],player:point(20.),..Default::default()};
    queue_extra(&mut state,&mut port,0x45,7);
    state.resolve_due(10.1,&mut port);state.resolve_due(13.,&mut port);
    let object=port.objects[0].guid;port.events.clear();port.damage.clear();
    state.resolve_due(21.,&mut port);
    assert_eq!(port.events,[Event::Remove(object),marker("hzend",1),marker("hzt",0)]);
    assert!(port.damage.is_empty());
    port.events.clear();state.resolve_due(22.,&mut port);
    assert!(port.events.is_empty());assert_eq!(port.removed,[object]);
}
