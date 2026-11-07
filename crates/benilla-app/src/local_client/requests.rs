//! Actual client requests after the ordinary action, macro and cast ladder.
//! The offline embedding replaces the disconnected sender with this local
//! channel. No socket is opened and no button index is interpreted here.

use bevy::prelude::*;
use crossbeam_channel::Receiver;

use super::{LocalClientSession, LocalClientSet};
use crate::net::{ClientCommand, NetCommands};

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum LocalClientRequest {
    QueryTime,
    SetRaidTarget { icon: u8, guid: u64 },
    NameQuery { guid: u64 },
    ItemNameQuery { entry: u32 },
    CastSpell { spell_id: u32 },
    Chat { chat_type: u32, language: Option<u32>, text: String },
    GameObjectUse { guid: u64 },
    GameObjectQuery { entry: u32 },
    CreatureQuery { entry: u32 },
    /// The two wire bytes consumed by AS's inventory refusal branch.
    InventoryChange { opcode: u16, first: u8, second: u8 },
}

#[derive(Resource, Default)]
pub struct LocalClientRequests(pub Vec<LocalClientRequest>);

/// Opt-in projection of outgoing addon chat for an embedding's local owner.
#[derive(Resource, Default)]
pub struct LocalAddonRequests(pub Vec<benilla_ui::script::AddonSend>);

/// A remote authoritative embedding receives the production CMSG bodies before
/// local request projection can discard movement, targets or acknowledgement tails.
#[derive(Resource, Default)]
pub struct LocalWireRequests {
    pub enabled: bool,
    /// Observe the host controller without replacing its local request owner.
    pub observe_movement: bool,
    pub language: u32,
    pub packets: Vec<(u16, Vec<u8>)>,
}

/// Actual CMSG_ITEM_QUERY_SINGLE requests, separated from gameplay verbs so
/// an embedding's ordinary gameplay drain cannot silently discard a query.
#[derive(Resource, Default)]
pub struct LocalItemQueries(pub Vec<(u32, u64)>);

#[derive(Resource)]
struct Requests(Receiver<ClientCommand>);

#[derive(Resource, Default)]
struct PublishedActions {
    player: Option<u64>,
    spells: Vec<(u32, u32)>,
}

pub(super) struct LocalRequestsPlugin;
impl Plugin for LocalRequestsPlugin {
    fn build(&self, app: &mut App) {
        let (sender, receiver) = crossbeam_channel::unbounded();
        app.insert_resource(NetCommands(sender))
            .insert_resource(Requests(receiver))
            .init_resource::<LocalClientRequests>()
            .init_resource::<LocalWireRequests>()
            .init_resource::<LocalItemQueries>()
            .init_resource::<PublishedActions>()
            .add_systems(First, publish_actions.after(LocalClientSet::Lifecycle))
            .add_systems(PostUpdate, collect);
    }
}

/// Current1454f5f00 publishes the whole bar from learned spell identities and
/// racial slot11. Re-publish when those identities change, not on each timer
/// update or VM reload: client-owned drag/macro bindings survive in between.
fn publish_actions(
    session: Res<LocalClientSession>,
    mut previous: ResMut<PublishedActions>,
    mut actions: ResMut<crate::ui_action::ActionSlots>,
) {
    let player = session
        .player
        .as_ref()
        .filter(|_| session.active)
        .map(|p| p.guid);
    let spells = if player.is_some() {
        session
            .actions
            .iter()
            .map(|a| (a.slot, a.spell_id))
            .collect()
    } else {
        Vec::new()
    };
    if previous.player == player && previous.spells == spells {
        return;
    }
    actions.buttons.clear();
    for &(slot, spell_id) in &spells {
        if let Some(slot) = slot.checked_sub(1).filter(|slot| *slot < 120) {
            let slot = slot as u8;
            actions.buttons.insert(
                slot,
                benilla_protocol::messages::ActionButton {
                    slot,
                    action: spell_id,
                    kind: benilla_protocol::messages::ACTION_KIND_SPELL,
                },
            );
        }
    }
    *previous = PublishedActions { player, spells };
}

fn resolved(command: ClientCommand) -> Option<LocalClientRequest> {
    match command {
        ClientCommand::QueryTime => Some(LocalClientRequest::QueryTime),
        ClientCommand::SetRaidTarget { icon, guid } => Some(LocalClientRequest::SetRaidTarget { icon, guid }),
        ClientCommand::RequestRaidTargets => Some(LocalClientRequest::SetRaidTarget { icon: 0xff, guid: 0 }),
        ClientCommand::NameQuery { guid } => Some(LocalClientRequest::NameQuery { guid }),
        ClientCommand::ItemNameQuery { entry, .. } => Some(LocalClientRequest::ItemNameQuery { entry }),
        ClientCommand::Chat { kind, text, language, .. } => Some(LocalClientRequest::Chat {
            chat_type: kind.chat_type(), language, text,
        }),
        ClientCommand::CastSpell { spell_id, .. }
        | ClientCommand::CastSpellCorpse { spell_id, .. }
        | ClientCommand::CastSpellAtDest { spell_id, .. }
        | ClientCommand::CastSpellAtSource { spell_id, .. }
        | ClientCommand::CastSpellGameObject { spell_id, .. }
        | ClientCommand::CastSpellItem { spell_id, .. } => {
            Some(LocalClientRequest::CastSpell { spell_id })
        }
        ClientCommand::GameObjUse { guid } => Some(LocalClientRequest::GameObjectUse { guid }),
        ClientCommand::GameObjectQuery { entry, .. } => {
            Some(LocalClientRequest::GameObjectQuery { entry })
        }
        // AS0.113.2 opcode0x60 consumes only the template entry; GUID is unused.
        ClientCommand::CreatureQuery { entry, .. } => {
            Some(LocalClientRequest::CreatureQuery { entry })
        }
        ClientCommand::AutoEquipItem { bag_index, slot } => Some(
            LocalClientRequest::InventoryChange { opcode: 0x10a, first: bag_index, second: slot }),
        ClientCommand::AutoStoreBagItem { src_bag, src_slot, .. } => Some(
            LocalClientRequest::InventoryChange { opcode: 0x10b, first: src_bag, second: src_slot }),
        ClientCommand::SwapItem { dst_bag, dst_slot, .. } => Some(
            LocalClientRequest::InventoryChange { opcode: 0x10c, first: dst_bag, second: dst_slot }),
        ClientCommand::SwapInvItem { src_slot, dst_slot } => Some(
            LocalClientRequest::InventoryChange { opcode: 0x10d, first: src_slot, second: dst_slot }),
        ClientCommand::DestroyItem { bag_index, slot, .. } => Some(
            LocalClientRequest::InventoryChange { opcode: 0x111, first: bag_index, second: slot }),
        // Other native request opcodes retain their separate embedding owners.
        // In particular136 is an established native no-op, not aura removal.
        _ => None,
    }
}

fn collect(
    session: Res<LocalClientSession>,
    channel: Res<Requests>,
    mut requests: ResMut<LocalClientRequests>,
    mut addon: Option<ResMut<LocalAddonRequests>>,
    mut items: ResMut<LocalItemQueries>,
    mut wire: ResMut<LocalWireRequests>,
) {
    if !session.active {
        requests.0.clear();
        items.0.clear();
        if let Some(addon) = addon.as_deref_mut() {
            addon.0.clear();
        }
    }
    if !wire.enabled && !wire.observe_movement { wire.packets.clear(); }
    let (sender, receiver) = std::sync::mpsc::channel();
    let mut writer = benilla_protocol::WorldWriter::packets(wire.language,
        move |opcode, body| {
            sender.send((opcode, body.to_vec()))?;
            Ok(())
        });
    for command in channel.0.try_iter() {
        if session.active {
            if let (Some(addon), ClientCommand::AddonMessage { distribution, text }) =
                (addon.as_deref_mut(), &command)
            {
                addon.0.push(benilla_ui::script::AddonSend {
                    distribution: *distribution,
                    text: text.clone(),
                });
            }
            if wire.enabled {
                // These requests stay on the native guest's local engine port.
                if matches!(&command, ClientCommand::QueryTime | ClientCommand::ItemNameQuery { .. }) {
                    requests.0.extend(resolved(command));
                    continue;
                }
                if let Err(error) = crate::net::io::write_command(&mut writer, command) {
                    warn!("embedding command encoding failed: {error}");
                }
                continue;
            }
            // Solo AS admission consumes the same stamped packet as a host.
            // Encode it even when no co-op observer needs the body.
            if matches!(&command, ClientCommand::Move{..}
                | ClientCommand::ForceSpeedAck{..} | ClientCommand::KnockBackAck{..}) {
                let ordinary = matches!(&command, ClientCommand::Move{..});
                if let Err(error)=crate::net::io::write_command(&mut writer,command){warn!("embedding movement encoding failed: {error}");}
                for packet in receiver.try_iter() {
                    if wire.observe_movement && ordinary { wire.packets.push(packet); }
                }
                continue;
            }
            if let ClientCommand::ItemQuery { entry, guid } = command {
                items.0.push((entry, guid));
                continue;
            }
            if let Some(request) = resolved(command) {
                requests.0.push(request);
            }
        }
    }
    if wire.enabled {
        wire.packets.extend(receiver.try_iter());
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use bevy::ecs::system::RunSystemOnce;

    #[test]
    fn remote_commands_keep_targets_and_do_not_execute_the_local_projection() {
        let mut app = App::new();
        app.init_resource::<LocalClientSession>().add_plugins(LocalRequestsPlugin);
        app.world_mut().resource_mut::<LocalClientSession>().active = true;
        app.world_mut().resource_mut::<LocalWireRequests>().enabled = true;
        let sender = app.world().resource::<NetCommands>().0.clone();
        let guid = 0xf110_0023_2d00_0007;
        sender.send(ClientCommand::CastSpell { spell_id: 116, target: Some(guid) }).unwrap();
        sender.send(ClientCommand::CastSpellAtDest { spell_id: 10, dest: [1., 2., 3.] }).unwrap();
        sender.send(ClientCommand::SetRaidTarget { icon: 7, guid }).unwrap();
        app.world_mut().run_system_once(collect).unwrap();
        use benilla_protocol::messages as wire;
        assert_eq!(app.world().resource::<LocalWireRequests>().packets, vec![
            (wire::opcode::CMSG_CAST_SPELL, wire::cast_spell(116, Some(guid))),
            (wire::opcode::CMSG_CAST_SPELL, wire::cast_spell_at_dest(10, [1., 2., 3.])),
            (wire::opcode::MSG_RAID_TARGET_UPDATE, wire::raid_target_set(7, guid)),
        ]);
        assert!(app.world().resource::<LocalClientRequests>().0.is_empty());
        assert!(app.world().resource::<LocalItemQueries>().0.is_empty());
    }

    #[test]
    fn hosting_observes_full_movement_and_preserves_local_queries() {
        let mut app=App::new();
        app.init_resource::<LocalClientSession>().add_plugins(LocalRequestsPlugin);
        app.world_mut().resource_mut::<LocalClientSession>().active=true;
        app.world_mut().resource_mut::<LocalWireRequests>().observe_movement=true;
        let sender=app.world().resource::<NetCommands>().0.clone();
        sender.send(ClientCommand::Move{kind:crate::net::MoveKind::Heartbeat,timestamp:None,flags:0x2000,
            pos:[1.,2.,3.],orientation:1.25,pitch:0.,fall_time:42,
            jump:Some(benilla_protocol::JumpInfo{zspeed:-7.,cos_angle:1.,sin_angle:0.,xy_speed:5.}),transport:None}).unwrap();
        sender.send(ClientCommand::QueryTime).unwrap();
        app.world_mut().run_system_once(collect).unwrap();
        let packets=&app.world().resource::<LocalWireRequests>().packets;
        assert_eq!(packets.len(),1);assert_eq!(packets[0].0,0xee);
        let movement=benilla_protocol::messages::parse_movement_info(&packets[0].1).unwrap();
        assert_eq!(movement.position.x,1.);assert_eq!(movement.fall_time,42);
        assert_eq!(movement.jump.unwrap().xy_speed,5.);
        assert_eq!(app.world().resource::<LocalClientRequests>().0,[LocalClientRequest::QueryTime]);
    }

    #[test]
    fn remote_query_time_uses_the_native_local_exception() {
        let mut app=App::new();
        app.init_resource::<LocalClientSession>().add_plugins(LocalRequestsPlugin);
        app.world_mut().resource_mut::<LocalClientSession>().active=true;
        app.world_mut().resource_mut::<LocalWireRequests>().enabled=true;
        app.world().resource::<NetCommands>().0.send(ClientCommand::QueryTime).unwrap();
        app.world_mut().run_system_once(collect).unwrap();
        assert!(app.world().resource::<LocalWireRequests>().packets.is_empty());
        assert_eq!(app.world().resource::<LocalClientRequests>().0,[LocalClientRequest::QueryTime]);
    }

    #[test]
    fn item_queries_switch_from_local_to_wire_when_guest_synchronization_enables_forwarding() {
        let mut app = App::new();
        app.init_resource::<LocalClientSession>().add_plugins(LocalRequestsPlugin);
        app.world_mut().resource_mut::<LocalClientSession>().active = true;
        let sender = app.world().resource::<NetCommands>().0.clone();
        let entry = 101_000;
        let guid = 0x4000_0000_0000_0100;
        sender.send(ClientCommand::ItemQuery { entry, guid }).unwrap();
        sender.send(ClientCommand::QueryTime).unwrap();
        app.world_mut().run_system_once(collect).unwrap();
        assert_eq!(app.world().resource::<LocalItemQueries>().0, [(entry, guid)]);
        assert_eq!(app.world().resource::<LocalClientRequests>().0, [LocalClientRequest::QueryTime]);
        assert!(app.world().resource::<LocalWireRequests>().packets.is_empty());

        app.world_mut().resource_mut::<LocalItemQueries>().0.clear();
        app.world_mut().resource_mut::<LocalClientRequests>().0.clear();
        app.world_mut().resource_mut::<LocalWireRequests>().enabled = true;
        sender.send(ClientCommand::ItemQuery { entry, guid }).unwrap();
        sender.send(ClientCommand::QueryTime).unwrap();
        app.world_mut().run_system_once(collect).unwrap();
        assert!(app.world().resource::<LocalItemQueries>().0.is_empty());
        assert_eq!(app.world().resource::<LocalClientRequests>().0, [LocalClientRequest::QueryTime]);
        assert_eq!(app.world().resource::<LocalWireRequests>().packets,
            [(benilla_protocol::messages::opcode::CMSG_ITEM_QUERY_SINGLE,
                benilla_protocol::messages::item_query(entry, guid))]);
    }

    #[test]
    fn raid_target_commands_keep_wire_icon_and_full_guid() {
        assert_eq!(resolved(ClientCommand::RequestRaidTargets),
            Some(LocalClientRequest::SetRaidTarget { icon: 0xff, guid: 0 }));
        for icon in [0, 7, 8, 254, 255] {
            for guid in [0, 1, u64::MAX] {
                assert_eq!(resolved(ClientCommand::SetRaidTarget { icon, guid }),
                    Some(LocalClientRequest::SetRaidTarget { icon, guid }));
            }
        }
    }

    #[test]
    fn item_name_queries_stay_local_after_guest_synchronization() {
        let mut app = App::new();
        app.init_resource::<LocalClientSession>().add_plugins(LocalRequestsPlugin);
        app.world_mut().resource_mut::<LocalClientSession>().active = true;
        let sender = app.world().resource::<NetCommands>().0.clone();
        for guest in [false, true] {
            app.world_mut().resource_mut::<LocalWireRequests>().enabled = guest;
            sender.send(ClientCommand::ItemNameQuery { entry: 101010, guid: u64::MAX }).unwrap();
            app.world_mut().run_system_once(collect).unwrap();
            assert!(app.world().resource::<LocalWireRequests>().packets.is_empty());
            assert_eq!(std::mem::take(&mut app.world_mut().resource_mut::<LocalClientRequests>().0),
                [LocalClientRequest::ItemNameQuery { entry: 101010 }]);
        }
    }

    #[test]
    fn inventory_request_prefixes_preserve_the_actual_wire_order() {
        use benilla_protocol::messages as wire;
        let cases = [
            (ClientCommand::AutoEquipItem { bag_index: 255, slot: 2 },
                0x10a, wire::auto_equip_item(255, 2)),
            (ClientCommand::AutoStoreBagItem { src_bag: 255, src_slot: 3, dst_bag: 20 },
                0x10b, wire::auto_store_bag_item(255, 3, 20)),
            (ClientCommand::SwapItem { dst_bag: 21, dst_slot: 4, src_bag: 255, src_slot: 5 },
                0x10c, wire::swap_item(21, 4, 255, 5)),
            (ClientCommand::SwapInvItem { src_slot: 6, dst_slot: 7 },
                0x10d, wire::swap_inv_item(6, 7)),
            (ClientCommand::DestroyItem { bag_index: 255, slot: 8, count: 1 },
                0x111, wire::destroy_item(255, 8, 1)),
        ];
        for (command, opcode, bytes) in cases {
            assert_eq!(resolved(command), Some(LocalClientRequest::InventoryChange {
                opcode, first: bytes[0], second: bytes[1],
            }));
        }
    }

    #[test]
    fn name_query_preserves_every_guid_bit() {
        for guid in [0, 1, 0x8000_0000_0000_0000, u64::MAX] {
            assert_eq!(resolved(ClientCommand::NameQuery { guid }),
                Some(LocalClientRequest::NameQuery { guid }));
        }
    }

    #[test]
    fn wall_clock_request_uses_the_local_query_channel() {
        assert_eq!(resolved(ClientCommand::QueryTime), Some(LocalClientRequest::QueryTime));
    }
    #[test]
    fn resolved_requests_keep_actual_cast_and_object_identity_in_order() {
        let mut app = App::new();
        app.init_resource::<LocalClientSession>()
            .add_plugins(LocalRequestsPlugin);
        app.world_mut().resource_mut::<LocalClientSession>().active = true;
        let sender = app.world().resource::<NetCommands>().0.clone();
        sender
            .send(ClientCommand::CastSpell {
                spell_id: 116,
                target: Some(77),
            })
            .unwrap();
        sender
            .send(ClientCommand::GameObjUse {
                guid: 0xf11000000000232d,
            })
            .unwrap();
        sender
            .send(ClientCommand::GameObjectQuery {
                entry: 9005,
                guid: 0xf11000232d000007,
            })
            .unwrap();
        sender
            .send(ClientCommand::CastSpellAtDest {
                spell_id: 10,
                dest: [1., 2., 3.],
            })
            .unwrap();
        sender.send(ClientCommand::ItemQuery { entry: 101_000, guid: 0x4000_0000_0000_0100 }).unwrap();
        sender.send(ClientCommand::CreatureQuery { entry: 600, guid: u64::MAX }).unwrap();
        app.world_mut().run_system_once(collect).unwrap();
        assert_eq!(
            app.world().resource::<LocalClientRequests>().0,
            vec![
                LocalClientRequest::CastSpell { spell_id: 116 },
                LocalClientRequest::GameObjectUse {
                    guid: 0xf11000000000232d
                },
                LocalClientRequest::GameObjectQuery { entry: 9005 },
                LocalClientRequest::CastSpell { spell_id: 10 },
                LocalClientRequest::CreatureQuery { entry: 600 },
            ]
        );
        assert_eq!(app.world().resource::<LocalItemQueries>().0,
            [(101_000, 0x4000_0000_0000_0100)]);
        app.world_mut().resource_mut::<LocalClientSession>().active = false;
        app.world_mut().run_system_once(collect).unwrap();
        assert!(app.world().resource::<LocalClientRequests>().0.is_empty());
        assert!(app.world().resource::<LocalItemQueries>().0.is_empty());
    }

    #[test]
    fn authoritative_identity_change_republishes_but_timer_does_not_erase_a_macro() {
        let mut app = App::new();
        app.init_resource::<LocalClientSession>()
            .init_resource::<PublishedActions>()
            .init_resource::<crate::ui_action::ActionSlots>();
        {
            let mut session = app.world_mut().resource_mut::<LocalClientSession>();
            session.active = true;
            session.player = Some(super::super::LocalPlayerUi {
                guid: 1,
                ..default()
            });
            session.actions.push(super::super::LocalActionUi {
                slot: 1,
                spell_id: 116,
                ..default()
            });
        }
        app.world_mut().run_system_once(publish_actions).unwrap();
        let macro_button = benilla_protocol::messages::ActionButton {
            slot: 0,
            action: 7,
            kind: benilla_protocol::messages::ACTION_KIND_MACRO,
        };
        app.world_mut()
            .resource_mut::<crate::ui_action::ActionSlots>()
            .buttons
            .insert(0, macro_button);
        app.world_mut().resource_mut::<LocalClientSession>().actions[0].cooldown =
            Some(super::super::LocalCooldown {
                remaining: 2.,
                duration: 5.,
            });
        app.world_mut().run_system_once(publish_actions).unwrap();
        assert_eq!(
            app.world()
                .resource::<crate::ui_action::ActionSlots>()
                .buttons[&0]
                .action,
            7
        );
        app.world_mut().resource_mut::<LocalClientSession>().actions[0].spell_id = 133;
        app.world_mut().run_system_once(publish_actions).unwrap();
        assert_eq!(
            app.world()
                .resource::<crate::ui_action::ActionSlots>()
                .buttons[&0]
                .action,
            133
        );
    }

    #[test]
    fn current_native_publications_match_the_live_action_table_including_racial_overwrite() {
        let fixtures: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/local-requests/native.json"
        ))
        .unwrap();
        for row in fixtures["publications"].as_array().unwrap() {
            let mut app = App::new();
            let mut session = LocalClientSession {
                active: true,
                player: Some(super::super::LocalPlayerUi {
                    guid: 1,
                    ..default()
                }),
                ..default()
            };
            for pair in row["pairs"].as_array().unwrap() {
                session.actions.push(super::super::LocalActionUi {
                    slot: pair[0].as_u64().unwrap() as u32 + 1,
                    spell_id: pair[1].as_u64().unwrap() as u32,
                    ..default()
                });
            }
            app.insert_resource(session)
                .init_resource::<PublishedActions>()
                .init_resource::<crate::ui_action::ActionSlots>();
            app.world_mut().run_system_once(publish_actions).unwrap();
            let pairs = row["pairs"].clone();
            let expected = fixtures["tables"]
                .as_array()
                .unwrap()
                .iter()
                .find(|table| table["pairs"] == pairs)
                .unwrap();
            let actions = app.world().resource::<crate::ui_action::ActionSlots>();
            for (slot, value) in expected["expected"].as_array().unwrap().iter().enumerate() {
                assert_eq!(
                    actions
                        .buttons
                        .get(&(slot as u8))
                        .map_or(0, |button| button.action),
                    value.as_u64().unwrap() as u32,
                    "learned={} slot={slot}",
                    row["learned"]
                );
            }
        }
    }
}
