//! Exercise the real local cleanup and inbound logout, including command-buffer boundaries.
use super::*;
use bevy::ecs::world::CommandQueue;

const GUID: u64 = 7;

fn cached(entity: Entity) -> LocalBody {
    LocalBody {
        identity: Some((1, GUID)),
        entity: Some(entity),
        snapshot: Some(LocalPlayerUi {
            guid: GUID,
            ..default()
        }),
        paused_at: Some(4.0),
        ..default()
    }
}

fn retire(
    world: &World,
    local: &mut LocalBody,
    index: &mut GuidIndex,
    self_guid: &mut SelfGuid,
) -> CommandQueue {
    let mut queue = CommandQueue::default();
    remove_body(
        &mut Commands::new(&mut queue, world),
        local,
        index,
        self_guid,
    );
    assert!(local.identity.is_none());
    assert!(local.entity.is_none());
    assert!(local.snapshot.is_none());
    assert!(local.paused_at.is_none());
    queue
}

#[test]
fn local_departure_retires_its_body_and_children_once() {
    let mut world = World::new();
    let body = world.spawn_empty().id();
    let child = world.spawn(ChildOf(body)).id();
    let other = world.spawn_empty().id();
    let mut local = cached(body);
    let mut index = GuidIndex::default();
    index.0.extend([(GUID, body), (8, other)]);
    let mut self_guid = SelfGuid(Some(GUID));
    let mut queue = retire(&world, &mut local, &mut index, &mut self_guid);
    assert!(!queue.is_empty());
    assert_eq!(index.0.get(&GUID), None);
    assert_eq!(self_guid.0, None);
    queue.apply(&mut world);
    assert!(world.get_entity(body).is_err());
    assert!(world.get_entity(child).is_err());
    assert!(world.get_entity(other).is_ok());
    assert_eq!(index.0.get(&8), Some(&other));
    assert!(retire(&world, &mut local, &mut index, &mut self_guid).is_empty());
}

#[test]
fn actual_inbound_logout_leaves_no_second_local_despawn_command() {
    let mut app = App::new();
    app.add_plugins(crate::net::NetPlugin { connect: false })
        .init_resource::<crate::spell::Cooldowns>();
    let body = app.world_mut().spawn_empty().id();
    let mut local = cached(body);
    app.world_mut()
        .resource_mut::<GuidIndex>()
        .0
        .insert(GUID, body);
    app.world_mut().resource_mut::<SelfGuid>().0 = Some(GUID);

    // The same production handler dispatch used by local_client::events::flush_events.
    crate::net::handlers::dispatch(
        app.world_mut(),
        vec![benilla_protocol::SessionEvent::LoggedOut],
    );
    assert!(app.world().get_entity(body).is_err());
    assert!(app.world().resource::<GuidIndex>().0.get(&GUID).is_none());
    assert_eq!(app.world().resource::<SelfGuid>().0, None);
    let mut index = app.world_mut().remove_resource::<GuidIndex>().unwrap();
    let mut self_guid = app.world_mut().remove_resource::<SelfGuid>().unwrap();
    // Assert no stale command is enqueued, independently of log/error handlers.
    assert!(retire(app.world(), &mut local, &mut index, &mut self_guid).is_empty());
}

#[test]
fn inbound_removal_claim_wins_even_before_its_commands_apply() {
    let mut world = World::new();
    let body = world.spawn_empty().id();
    let mut local = cached(body);
    let mut index = GuidIndex::default();
    index.0.insert(GUID, body);
    let mut self_guid = SelfGuid(Some(GUID));
    let mut inbound = CommandQueue::default();
    // LoggedOut/disconnect takes the index entry when it queues the first removal.
    let taken = index.0.remove(&GUID).unwrap();
    self_guid.0 = None;
    Commands::new(&mut inbound, &world).entity(taken).despawn();
    assert!(
        world.get_entity(body).is_ok(),
        "the first removal is still pending"
    );
    assert!(retire(&world, &mut local, &mut index, &mut self_guid).is_empty());
    inbound.apply(&mut world);
    assert!(world.get_entity(body).is_err());
}

#[test]
fn stale_index_never_targets_a_reused_entity_generation() {
    let mut world = World::new();
    let body = world.spawn_empty().id();
    let mut local = cached(body);
    let mut index = GuidIndex::default();
    index.0.insert(GUID, body);
    let mut self_guid = SelfGuid(Some(GUID));
    world.despawn(body);
    let replacement = world.spawn_empty().id();
    assert_eq!(body.index(), replacement.index());
    assert_ne!(body, replacement);
    assert!(retire(&world, &mut local, &mut index, &mut self_guid).is_empty());
    assert!(world.get_entity(replacement).is_ok());
    assert!(!index.0.contains_key(&GUID));
    assert_eq!(self_guid.0, None);
}

#[test]
fn stale_cache_cannot_unregister_a_replacement_with_the_same_guid() {
    let mut world = World::new();
    let body = world.spawn_empty().id();
    let mut local = cached(body);
    world.despawn(body);
    let replacement = world.spawn_empty().id();
    let mut index = GuidIndex::default();
    index.0.insert(GUID, replacement);
    let mut self_guid = SelfGuid(Some(GUID));
    assert!(retire(&world, &mut local, &mut index, &mut self_guid).is_empty());
    assert_eq!(index.0.get(&GUID), Some(&replacement));
    assert_eq!(self_guid.0, Some(GUID));
    assert!(world.get_entity(replacement).is_ok());
}

#[test]
fn a_reserved_local_body_can_be_retired_before_its_spawn_applies() {
    let mut world = World::new();
    let mut queue = CommandQueue::default();
    let mut commands = Commands::new(&mut queue, &world);
    let body = commands.spawn_empty().id();
    let mut local = cached(body);
    let mut index = GuidIndex::default();
    index.0.insert(GUID, body);
    let mut self_guid = SelfGuid(Some(GUID));
    remove_body(&mut commands, &mut local, &mut index, &mut self_guid);
    queue.apply(&mut world);
    assert!(world.get_entity(body).is_err());
    assert!(local.entity.is_none());
    assert!(index.0.is_empty());
    assert_eq!(self_guid.0, None);
}
