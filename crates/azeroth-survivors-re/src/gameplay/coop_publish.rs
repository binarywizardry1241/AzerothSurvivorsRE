//! Host publication reads one world and the actual swapped hero snapshots.
use super::*;

#[derive(Clone, PartialEq)]
pub(super) struct UnitSnapshot {
    fields: Vec<(u16, u32)>,
}
pub(super) fn install(app: &mut App) {
    app.add_systems(
        First,
        publish_units.after(super::super::visuals::sync_visuals),
    )
    .add_systems(Update, publish.after(RunSet::Tick).before(RunSet::Present));
}
fn emit(
    runtime: &mut CoopRuntime,
    source: u8,
    event: SessionEvent,
    local: &mut LocalPresentationEvents,
) {
    match engine_packets::encode(&event, None) {
        Ok(Some(packet)) => {
            if runtime.route_engine(source, packet) {
                local.0.push(event);
            }
        }
        Ok(None) => {}
        Err(error) => warn!("Co-op packet publication rejected: {error:?}"),
    }
}

fn publish_recipient_state(
    runtime: &mut CoopRuntime, state: &mut CoopGame, client: ClientId,
    native: NativeState, now: f64,
) {
    let periodic = now - state.state_sent_at.get(&client).copied().unwrap_or(0.) >= 1.0;
    if periodic {
        state.state_sent_at.insert(client, now);
    }
    if (periodic || native.flag_8c) && runtime.send(Some(client), NativeMessage::State(native.clone())) {
        state.sent_state.insert(client, native);
    }
}

pub(in crate::gameplay) fn publish(
    mut runtime: ResMut<CoopRuntime>,
    mut state: ResMut<CoopGame>,
    mut run: ResMut<RunSession>,
    time: Res<Time>,
    bridge: Res<client::BridgeCatalog>,
    armory: Res<crate::armory::ArmoryCatalog>,
    locale: Res<crate::localization::Localization>,
    mut presentation: ResMut<LocalPresentationEvents>,
    world: Res<ZoneWorld>,
) {
    let hosting = runtime.driver.as_ref().is_some_and(|driver| driver.is_hosting());
    if !hosting {
        state.addon_publishers.clear();
    }
    if runtime.is_guest() {
        return;
    }
    let started = run.started;
    let addon_paused = run.paused || run.talent_view_open;
    let identity = run.identity;
    let Some(game) = run.mechanics.as_mut() else {
        for client in state.admitted.keys().copied().collect::<Vec<_>>() {
            runtime.send(Some(client), NativeMessage::End);
            if let Some(driver) = runtime.driver.as_mut() {
                driver.server.world_hero_removed(client);
            }
        }
        state.admitted.clear();
        state.profiles.clear();
        state.world_profiles.clear();
        state.units.clear();
        state.sent_players.clear();
        state.host_identity = None;
        state.sent_actions.clear();
        state.inventory.clear();
        state.sent_seen.clear();
        state.state_sent_at.clear();
        state.sent_state.clear();
        runtime.actor_clients.clear();
        return;
    };
    // Keep End delivery/cache cleanup above; an offline process identity or a
    // retained old profile does not make the local run a cooperative host.
    if !hosting {
        return;
    }
    runtime.party = game.localized_party_snapshot(&locale);
    runtime.shared_running = started && game.party_shared_running();
    if !world.ready {
        return;
    }
    let Some(creation) = &bridge.creation else {
        return;
    };
    let local_profile = state.local.clone();
    let mut members = state
        .world_profiles
        .iter()
        .filter_map(|(guid, hero)| {
            game.party_slot(*guid).and_then(|slot| {
                let client = state
                    .admitted
                    .iter()
                    .find_map(|(client, assigned)| (*assigned == *guid).then_some(*client));
                Some((slot, client, hero.clone()))
            })
        })
        .collect::<Vec<_>>();
    if let Some(hero) = local_profile {
        members.push((0, None, hero));
    }
    members.sort_by_key(|row| row.0);
    let now = time.elapsed_secs_f64();
    let mut detailed_owners = None;
    for (slot, client, hero) in members {
        if let Some(client) = client {
            let synced =
                runtime.driver.as_ref().is_some_and(|driver| {
                    driver.server.clients().iter().any(|row| {
                        row.id == client && row.synchronized && row.closing_since.is_none()
                    })
                });
            if !synced {
                if let Some(native) = game.with_party_hero(slot, |game| game.native_state()) {
                    publish_recipient_state(&mut runtime, &mut state, client, native, now);
                }
                continue;
            }
        }
        let Some(display) = creation.body_display(hero.race, hero.sex) else {
            continue;
        };
        let addon_due = client.is_some_and(|client|
            state.addon_publishers.entry(client).or_default().due(identity, now));
        if addon_due && detailed_owners.is_none() {
            detailed_owners = Some(game.detailed_owners(&armory));
        }
        let addon_pose = addon_due.then(|| game.addon_party_pose(slot)).flatten();
        let Some((fields, native, learned, attack, inventory, equipment, boss_rewards, seen, addon, detailed)) = game
            .with_party_hero(slot, |game| {
                let player = client::player_ui(
                    game,
                    &appearance(&hero),
                    &String::from_utf8_lossy(&hero.name),
                    display,
                    crate::coop_profile::outfit(&hero, &armory),
                );
                let learned = game
                    .abilities
                    .iter()
                    .map(|row| row.definition.spell_id)
                    .collect::<Vec<_>>();
                let attack = game
                    .racial
                    .as_ref()
                    .map_or(0, |row| row.definition.spell_id);
                let inventory = client
                    .map(|client| {
                        state
                            .inventory
                            .entry(client)
                            .or_default()
                            .publish(identity, &hero, game, &armory, &locale)
                    })
                    .unwrap_or_default();
                let equipment = if client.is_some() {
                    game.drain_equipment_grants()
                } else {
                    Vec::new()
                };
                let boss_rewards = if client.is_some() {
                    game.drain_boss_rewards()
                } else {
                    (0.0, Vec::new())
                };
                let seen = if client.is_some() {
                    game.seen_abilities().to_vec()
                } else {
                    Vec::new()
                };
                let fields = player_snapshot_fields(game, &player, &hero)
                    .raw_fields()
                    .collect::<Vec<_>>();
                let recipient_locale = locale.for_code(
                    std::str::from_utf8(&hero.bytes_30).unwrap_or("en"));
                let addon = addon_pose.map_or_else(Vec::new, |(position, facing)| {
                    let target = client.and_then(|client| runtime.driver.as_ref()?.peer_selection(client));
                    client::recipient_addon_snapshot(game, &String::from_utf8_lossy(&hero.name),
                        started, addon_paused, (position, facing, target), &recipient_locale, &bridge)
                });
                let detailed = client.filter(|_| addon_due).map_or_else(Vec::new, |client| {
                    state.addon_publishers.entry(client).or_default().detailed.publish(
                        game,
                        detailed_owners.as_deref().unwrap_or_default(),
                        client::recipient_phase(game, started, addon_paused),
                        &recipient_locale,
                    )
                });
                (
                    fields,
                    game.native_state(),
                    learned,
                    attack,
                    inventory,
                    equipment,
                    boss_rewards,
                    seen,
                    addon,
                    detailed,
                )
            })
        else {
            continue;
        };
        let changed = state.sent_players.get(&hero.guid).map_or_else(
            || fields.clone(),
            |previous| {
                fields
                    .iter()
                    .copied()
                    .filter(|row| !previous.contains(row))
                    .collect()
            },
        );
        if !changed.is_empty() {
            emit(
                &mut runtime,
                slot,
                SessionEvent::ObjectValues {
                    guid: hero.guid,
                    fields: benilla_protocol::ObjectFields::from_pairs(&changed),
                },
                &mut presentation,
            );
        }
        state.sent_players.insert(hero.guid, fields);
        let Some(client) = client else { continue };
        let synced = runtime.driver.as_ref().is_some_and(|driver| {
            driver
                .server
                .clients()
                .iter()
                .any(|row| row.id == client && row.synchronized && row.closing_since.is_none())
        });
        if !synced {
            continue;
        }
        let publisher = state.addon_publishers.entry(client).or_default();
        if addon_due {
            for event in publisher.changed_from(addon, hero.guid) {
                if let Ok(Some(packet)) = engine_packets::encode(&event, Some(hero.guid)) {
                    runtime.send(Some(client), packet.into_message());
                }
            }
            if !detailed.into_iter().all(|event| {
                engine_packets::encode(&event, Some(hero.guid))
                    .ok()
                    .flatten()
                    .is_some_and(|packet| runtime.send(Some(client), packet.into_message()))
            }) {
                publisher.detailed.replay();
            }
        }
        for event in inventory {
            if let Ok(Some(packet)) = engine_packets::encode(&event, Some(hero.guid)) {
                runtime.send(Some(client), packet.into_message());
            }
        }
        let mut action = learned.clone();
        action.push(attack);
        if state.sent_actions.get(&client) != Some(&action) {
            runtime.send(
                Some(client),
                azeroth_survivors_re::coop::bootstrap::action_buttons(&learned, attack)
                    .into_message(),
            );
            state.sent_actions.insert(client, action);
        }
        if !equipment.is_empty() {
            runtime.send(Some(client), NativeMessage::EquipmentGrants(equipment));
        }
        if boss_rewards.0 != 0.0 || !boss_rewards.1.is_empty() {
            runtime.send(Some(client), NativeMessage::MarksAndPity {
                marks_bits: boss_rewards.0.to_bits(), missed_items: boss_rewards.1,
            });
        }
        let unsent = seen
            .iter()
            .filter(|row| {
                state
                    .sent_seen
                    .get(&client)
                    .is_none_or(|previous| !previous.contains(row))
            })
            .cloned()
            .collect::<Vec<_>>();
        if !unsent.is_empty() && runtime.send(Some(client), NativeMessage::StringRanks(unsent)) {
            state.sent_seen.insert(client, seen);
        }
        publish_recipient_state(&mut runtime, &mut state, client, native, now);
    }
}

/// Retire each recipient's actual published item objects while the old party
/// mapping still exists. Item GUIDs are private and must bypass world broadcast.
pub(in crate::gameplay) fn retire_inventory(world: &mut World) {
    let pending = if let Some(mut state) = world.get_resource_mut::<CoopGame>() {
        state.inventory.iter_mut().map(|(client, inventory)| (*client, inventory.retire()))
            .collect::<Vec<_>>()
    } else { Vec::new() };
    let Some(mut runtime) = world.get_resource_mut::<CoopRuntime>() else { return };
    for (client, events) in pending {
        for event in events {
            if let Ok(Some(packet)) = engine_packets::encode(&event, None) {
                runtime.send(Some(client), packet.into_message());
            }
        }
    }
}

pub(in crate::gameplay) fn publish_units(
    mut runtime: ResMut<CoopRuntime>,
    mut state: ResMut<CoopGame>,
    run: Res<RunSession>,
    units: Query<(
        &LocalUnitVisual,
        &Transform,
        Option<&benilla_app::local_client::LocalUnitPath>,
    )>,
) {
    if runtime.is_guest() {
        runtime.flush_engine_events();
        return;
    }
    let Some(game) = run.mechanics.as_ref() else {
        runtime.flush_engine_events();
        return;
    };
    // The same actual actor descriptors and paths used by the host renderer are
    // sent to guests; the guest never advances a second AI/combat world.
    let mut current = HashSet::new();
    for (unit, transform, path) in &units {
        if game.party_slot(unit.guid).is_some() {
            continue;
        }
        current.insert(unit.guid);
        let fields = unit.fields.raw_fields().collect::<Vec<_>>();
        let snapshot = UnitSnapshot {
            fields: fields.clone(),
        };
        if let Some(previous) = state.units.get(&unit.guid) {
            let changed = fields
                .iter()
                .copied()
                .filter(|row| !previous.fields.contains(row))
                .collect::<Vec<_>>();
            if !changed.is_empty() {
                let event = SessionEvent::ObjectValues {
                    guid: unit.guid,
                    fields: benilla_protocol::ObjectFields::from_pairs(&changed),
                };
                if let Ok(Some(packet)) = engine_packets::encode(&event, None) {
                    runtime.route_world(0, packet);
                }
            }
        } else if let Some(event) = unit_create(unit, transform, path) {
            if let Ok(Some(packet)) = engine_packets::encode(&event, None) {
                runtime.route_world(0, packet);
            }
        }
        state.units.insert(unit.guid, snapshot);
    }
    let removed = state
        .units
        .keys()
        .copied()
        .filter(|guid| !current.contains(guid))
        .collect::<Vec<_>>();
    for guid in removed {
        state.units.remove(&guid);
        if let Ok(Some(packet)) = engine_packets::encode(&SessionEvent::ObjectDestroyed(guid), None)
        {
            runtime.route_world(0, packet);
        }
    }
    runtime.flush_engine_events();
}
