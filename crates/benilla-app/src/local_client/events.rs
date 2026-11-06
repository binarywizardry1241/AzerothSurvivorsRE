//! Offline authoritative packets use the production inbound handler table.
//!
//! This queue starts no socket and owns no combat rules. The embedding game
//! supplies recovered packet semantics; the normal spell/object/combat handlers
//! retain their DBC visuals, animation, sound and FrameXML event consumers.

use bevy::prelude::*;

pub use benilla_protocol::messages::{
    AttackerState, ChatMessage, CombatTextAttribution, GossipPoi, MoveMode, ObjectType, PeriodicAuraLog, PeriodicTick, SpeedKind,
    SpellDamageLog, SpellHealLog,
};
pub use benilla_protocol::{EntityKind, JumpInfo, MonsterMoveFacing, MoveSpeeds, ObjectFields, SessionEvent};

use super::{LocalActorSet, LocalClientSession};

#[derive(Resource, Default)]
pub struct LocalPresentationEvents(pub Vec<SessionEvent>);

/// Original opcode/payload pairs from an embedding's authoritative transport.
/// Decode through the production protocol and handler table, as a world socket does.
#[derive(Resource, Default)]
pub struct LocalWireEvents(pub Vec<(u16, Vec<u8>)>);

/// The supplied actors and local player are indexed before a cast packet looks
/// them up. Normal engine Net/Input/Stream/Present ordering then handles it.
#[derive(SystemSet, Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub struct LocalPresentationDispatch;

pub struct LocalPresentationPlugin;
impl Plugin for LocalPresentationPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<LocalPresentationEvents>()
            .init_resource::<LocalWireEvents>().add_systems(
            Update,
            dispatch
                .in_set(LocalPresentationDispatch)
                .after(LocalActorSet::Register)
                .after(crate::ui_script::UiInput)
                .before(benilla_world::schedule::WorldStage::Net),
        );
    }
}

fn dispatch(world: &mut World) {
    crate::combat_text::anchors::seat_stream(world);
    crate::combat_text::world_anchors::seat_stream(world);
    let packets = world.get_resource_mut::<LocalWireEvents>().map_or_else(Vec::new, |mut events| std::mem::take(&mut events.0));
    let local = std::mem::take(&mut world.resource_mut::<LocalPresentationEvents>().0);
    if !world.resource::<LocalClientSession>().active {
        return;
    }
    let mut events = Vec::new();
    for (opcode, payload) in packets {
        match benilla_protocol::messages::parse_server_with_tail(opcode, &payload) {
            Ok((packet, tail)) => {
                let mut decoded = benilla_protocol::decode(packet);
                if decoded.len() == 1 && CombatTextAttribution::supports(opcode) {
                    if let Some(attribution) = CombatTextAttribution::from_tail(opcode, &payload[payload.len() - tail..]) {
                        let hit = Box::new(decoded.pop().expect("one typed hit"));
                        events.push(SessionEvent::AttributedCombatHit { hit, attribution });
                    }
                }
                events.extend(decoded);
            }
            Err(error) => warn!("embedding packet {opcode:#x} rejected: {error}"),
        }
    }
    events.extend(complete_object_packets(local));
    crate::net::handlers::dispatch(world, events);
}

/// Deliver the embedding's final packets through the production inbound and
/// chat paths before it calls `LocalClientSession::end`. A frame's ordinary
/// dispatch precedes UI requests, so queuing a departure after that dispatch
/// and immediately ending would otherwise discard its final addon messages.
pub fn flush_events(world: &mut World) {
    dispatch(world);
    crate::ui_chat::feed_chat_once(world);
}

/// The embedding supplies one logical object block per native update packet. Upstream's
/// handler now separates writes from notifications; close each packet before the next run
/// event can inspect its state. First-pass GUIDs also need their explicit notify position.
pub(crate) fn complete_object_packets(events: Vec<SessionEvent>) -> Vec<SessionEvent> {
    use benilla_protocol::{guid, NotifyBlock};

    let mut framed = Vec::with_capacity(events.len());
    for event in events {
        let notify = match &event {
            SessionEvent::ObjectCreate { guid: id, kind, .. } if guid::first_pass(*id) => {
                Some((*id, NotifyBlock::Create(*kind)))
            }
            SessionEvent::ItemCreate { guid: id, .. } if guid::first_pass(*id) => {
                Some((*id, NotifyBlock::ItemCreate))
            }
            SessionEvent::ObjectValues { guid: id, fields } if guid::first_pass(*id) => Some((
                *id,
                NotifyBlock::Values(fields.raw_fields().map(|(field, _)| field).collect()),
            )),
            _ => None,
        };
        let block = matches!(
            event,
            SessionEvent::ObjectCreate { .. }
                | SessionEvent::ItemCreate { .. }
                | SessionEvent::ObjectValues { .. }
                | SessionEvent::ObjectMove { .. }
                | SessionEvent::ObjectsRemoved(_)
                | SessionEvent::ObjectsNear(_)
        );
        framed.push(event);
        if let Some((guid, block)) = notify {
            framed.push(SessionEvent::ObjectNotify { guid, block });
        }
        if block {
            framed.push(SessionEvent::ObjectUpdateEnd);
        }
    }
    framed
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::net::NetHandlerApp;
    use benilla_protocol::SessionEventKind;

    #[test]
    fn local_values_notify_before_the_following_presentation_event() {
        let framed = complete_object_packets(vec![
            SessionEvent::ObjectValues {
                guid: 1,
                fields: ObjectFields::from_pairs(&[(22, 42)]),
            },
            SessionEvent::PlaySound { sound_id: 888 },
        ]);
        assert!(matches!(
            &framed[..],
            [
                SessionEvent::ObjectValues { guid: 1, .. },
                SessionEvent::ObjectUpdateEnd,
                SessionEvent::PlaySound { sound_id: 888 }
            ]
        ));
    }

    #[test]
    fn first_pass_values_retain_their_sent_field_mask() {
        let guid = 0x6000_0000_0000_0017;
        let framed = complete_object_packets(vec![SessionEvent::ObjectValues {
            guid,
            fields: ObjectFields::from_pairs(&[(22, 42), (131, 49)]),
        }]);
        assert!(matches!(&framed[..], [SessionEvent::ObjectValues { .. },
            SessionEvent::ObjectNotify { guid: id, block: benilla_protocol::NotifyBlock::Values(fields) },
            SessionEvent::ObjectUpdateEnd] if *id == guid && fields == &[22, 131]));
    }

    #[derive(Resource, Default)]
    struct Observed(Vec<u32>);
    #[derive(Resource)]
    struct CastWasApplied;

    fn spell(In(event): In<SessionEvent>, mut commands: Commands, mut observed: ResMut<Observed>) {
        if let SessionEvent::SpellGo { spell_id, .. } = event {
            observed.0.push(spell_id);
            commands.insert_resource(CastWasApplied);
        }
    }
    fn damage(
        In(event): In<SessionEvent>,
        cast: Res<CastWasApplied>,
        mut observed: ResMut<Observed>,
    ) {
        let _ = cast;
        if let SessionEvent::SpellDamageLog(log) = event {
            observed.0.push(log.damage);
        }
    }

    #[test]
    fn local_packets_use_registered_handlers_in_order_and_apply_each_commands() {
        let mut app = App::new();
        app.init_resource::<LocalClientSession>()
            .init_resource::<LocalPresentationEvents>()
            .init_resource::<Observed>()
            .net_handler(SessionEventKind::SpellGo, spell)
            .net_handler(SessionEventKind::SpellDamageLog, damage);
        app.world_mut().resource_mut::<LocalClientSession>().active = true;
        app.world_mut().resource_mut::<LocalPresentationEvents>().0 = vec![
            SessionEvent::SpellGo {
                caster: 1,
                spell_id: 133,
                cast_flags: 0,
                hits: vec![2],
                unit_caster: 1,
                target_mask: 2,
                source: None,
                misses: vec![],
                target: Some(2),
                go_target: None,
                dest: None,
                ammo_display_id: None,
                ammo_inventory_type: None,
                item_caster: None,
            },
            SessionEvent::SpellDamageLog(SpellDamageLog {
                target: 2,
                attacker: 1,
                spell_id: 133,
                damage: 42,
                school: 2,
                absorb: 0,
                resist: 0,
                periodic: false,
                blocked: 0,
                hit_info: 0,
            }),
        ];
        dispatch(app.world_mut());
        assert_eq!(app.world().resource::<Observed>().0, [133, 42]);
        assert!(app
            .world()
            .resource::<LocalPresentationEvents>()
            .0
            .is_empty());
        dispatch(app.world_mut());
        assert_eq!(app.world().resource::<Observed>().0, [133, 42]);
    }
    #[test]
    fn a_closed_local_session_discards_stale_presentation_packets() {
        let mut app = App::new();
        app.init_resource::<LocalClientSession>()
            .init_resource::<LocalPresentationEvents>();
        app.world_mut()
            .resource_mut::<LocalPresentationEvents>()
            .0
            .push(SessionEvent::ObjectDestroyed(10));
        dispatch(app.world_mut());
        assert!(app
            .world()
            .resource::<LocalPresentationEvents>()
            .0
            .is_empty());
    }
}
