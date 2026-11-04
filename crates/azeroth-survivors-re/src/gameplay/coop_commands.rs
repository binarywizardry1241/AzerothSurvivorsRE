//! Guest commands enter the same recovered per-hero mechanics as local input.
use super::*;
use azeroth_survivors_re::{
    coop::replication::EnginePacket,
    floor_recovery::{Admission, Recovery, Report},
};
use benilla_protocol::messages::{opcode, parse_movement_info};

pub(super) enum Input {
    Engine(EnginePacket),
    Control { kind: u8, argument: u8, offer: u32 },
}

#[derive(bevy::ecs::system::SystemParam)]
pub(super) struct CommandTerrain<'w> {
    native: ResMut<'w, world::native_floor::NativeFloor>,
    terrain: Option<Res<'w, TerrainStreamer>>,
    tiles: Option<Res<'w, Assets<AdtTile>>>,
}

#[derive(Default)]
pub(super) struct Motion {
    pub recovery: Recovery,
    pub previous: Option<([f32; 3], u32)>,
}

impl CoopGame {
    pub(crate) fn expect_remote_position(
        &mut self,
        client: azeroth_survivors_re::coop::server_party::ClientId,
        position: [f32; 3],
        now: f32,
    ) {
        self.motion.entry(client).or_default().recovery.expect_position(position, now);
    }
}

fn u32_at(body: &[u8], offset: usize) -> Option<u32> {
    Some(u32::from_le_bytes(
        body.get(offset..offset + 4)?.try_into().ok()?,
    ))
}
// The native template-query readers consume up to four bytes, with zeroes for
// an absent suffix; they still answer an empty or truncated query.
pub(super) fn template_entry(body: &[u8]) -> u32 {
    let mut bytes = [0; 4];
    for (to, from) in bytes.iter_mut().zip(body) {
        *to = *from;
    }
    u32::from_le_bytes(bytes)
}
fn u64_at(body: &[u8], offset: usize) -> Option<u64> {
    Some(u64::from_le_bytes(
        body.get(offset..offset + 8)?.try_into().ok()?,
    ))
}
fn movement(opcode: u16) -> bool {
    matches!(opcode,0xb5..=0xc6|0xc8..=0xcb|0xda|0xdb|0xee)
}
fn packed(out: &mut Vec<u8>, guid: u64) {
    let bytes = guid.to_le_bytes();
    out.push(
        bytes
            .iter()
            .enumerate()
            .fold(0, |mask, (i, b)| mask | u8::from(*b != 0) << i),
    );
    out.extend(bytes.into_iter().filter(|byte| *byte != 0));
}

pub(super) fn install(app: &mut App) {
    app.add_systems(Update, apply.after(bootstrap).before(RunSet::Tick));
}

fn apply(
    mut state: ResMut<CoopGame>,
    mut runtime: ResMut<CoopRuntime>,
    mut run: ResMut<RunSession>,
    world: Res<ZoneWorld>,
    mut terrain: CommandTerrain,
    locale: Res<crate::localization::Localization>,
    mut presentation: ResMut<LocalPresentationEvents>,
    armory: Res<crate::armory::ArmoryCatalog>,
    mut item_texts: ResMut<benilla_app::local_client::LocalItemDescriptions>,
) {
    drain(
        &mut state, &mut runtime, &mut run, &world, &mut terrain,
        &locale, &mut presentation, &armory, &mut item_texts,
    );
}

pub(super) fn drain(
    state: &mut CoopGame,
    runtime: &mut CoopRuntime,
    run: &mut RunSession,
    world: &ZoneWorld,
    terrain: &mut CommandTerrain<'_>,
    locale: &crate::localization::Localization,
    presentation: &mut LocalPresentationEvents,
    armory: &crate::armory::ArmoryCatalog,
    item_texts: &mut benilla_app::local_client::LocalItemDescriptions,
) {
    if runtime.is_guest() || !world.ready {
        return;
    }
    let started = run.started;
    let Some(game) = run.mechanics.as_mut() else {
        return;
    };
    let Some((streamer, tiles)) = terrain.terrain.as_deref().zip(terrain.tiles.as_deref()) else {
        return;
    };
    let Some(floor) = terrain.native.terrain() else {
        return;
    };
    let Some(zone) = azeroth_survivors_re::floor_recovery::Zone::for_key(game.zone.key) else {
        return;
    };
    while let Some((client, input)) = state.commands.pop_front() {
        let Some(guid) = state.admitted.get(&client).copied() else {
            continue;
        };
        let Some(slot) = game.party_slot(guid) else {
            continue;
        };
        let packet = match input {
            Input::Engine(packet) => packet,
            Input::Control { kind, argument, offer } => {
                let stale = game.with_party_hero(slot, |hero|
                    !azeroth_survivors_re::coop::pick::admits(kind, offer, hero.choice_offer())
                ).unwrap_or(false);
                let applied = game.party_control(slot, kind, argument, offer, |xy| {
                    azeroth_survivors_re::floor_recovery::Terrain::height(floor, xy)
                });
                // Stale picks and missing-card requests republish the current offer.
                if (applied && matches!(kind, 0..=3 | 6 | 10)) || stale {
                    let revision = state.choice_generations.entry(client).or_default();
                    *revision = revision.wrapping_add(1).max(1);
                }
                continue;
            }
        };
        if movement(packet.opcode) {
            let Ok(info) = parse_movement_info(&packet.payload) else {
                continue;
            };
            let mut point = [info.position.x, info.position.y, info.position.z];
            if !point.iter().all(|value| value.is_finite()) || !info.orientation.is_finite() {
                continue;
            }
            let reported = point;
            let motion = state.motion.entry(client).or_default();
            game.with_party_hero(slot, |hero| hero.record_boss_movement_flags(info.flags));
            let admission = motion.recovery.admit_timestamped(
                zone,
                Report {
                    position: point,
                    facing: info.orientation,
                    flags: info.flags,
                    phase: u8::from(started),
                    now: game.clock,
                },
                info.timestamp,
                floor,
            );
            match admission {
                Admission::Ignored => continue,
                Admission::Accepted => {}
                Admission::Corrected(corrected) => {
                    point = corrected;
                    game.with_party_hero(slot, |game| {
                        game.relocate_player(point, info.orientation)
                    });
                }
            }
            // Current floor145b0ac16 excludes the swapped remote actor from
            // ready-to-running. Only the host's local movement starts the run.
            let velocity = motion.previous.map_or([0.; 2], |(prior, stamp)| {
                let elapsed = info.timestamp.wrapping_sub(stamp) as f32 / 1000.;
                if elapsed > 0. && info.flags & 0xf != 0 {
                    [
                        (point[0] - prior[0]) / elapsed,
                        (point[1] - prior[1]) / elapsed,
                    ]
                } else {
                    [0.; 2]
                }
            });
            motion.previous = Some((point, info.timestamp));
            game.with_party_hero(slot, |hero| {
                hero.record_boss_movement_report(Position::from(point), info.orientation, info.flags);
            });
            game.party_input(
                slot,
                mechanics::PartyInput {
                    position: Position::from(point),
                    facing: info.orientation,
                    velocity,
                },
            );
            // Current145c099a7 rebroadcasts only when floor admission's final
            // XYZ exactly equals the report. The owner-only correction is already
            // queued above; a corrected move must not echo a stale guest pose.
            if point != reported {
                continue;
            }
            // The server supplies actor identity and preserves the original
            // movement body, including its timestamp and conditional tails.
            let mut body = Vec::with_capacity(packet.payload.len() + 9);
            packed(&mut body, guid);
            body.extend_from_slice(&packet.payload);
            let relay = EnginePacket {
                opcode: packet.opcode,
                payload: body,
            };
            if runtime.route_movement(slot, relay.clone()) {
                if let Ok(events) = relay.decode_server() {
                    presentation.0.extend(events);
                }
            }
            continue;
        }
        let language = state
            .profiles
            .get(&client)
            .map(|hero| String::from_utf8_lossy(&hero.bytes_30).into_owned())
            .unwrap_or_else(|| locale.code().to_owned());
        let member_locale = locale.for_code(&language);
        let mut replies = Vec::new();
        match packet.opcode {
            opcode::CMSG_MESSAGECHAT => {
                if let Some(request) = meter_request(&packet.payload) {
                    state.addon_publishers.entry(client).or_default().request(request);
                }
            }
            opcode::CMSG_NAME_QUERY => {
                if let Some(requested) = u64_at(&packet.payload, 0) {
                    let hero = state
                        .local
                        .iter()
                        .chain(state.world_profiles.values())
                        .find(|hero| hero.guid == requested);
                    if let Some(hero) = hero {
                        replies.push(player_name(hero));
                    }
                }
            }
            opcode::CMSG_QUERY_TIME => {
                if let Some(reply) = client::clock_queries::query_time() {
                    replies.push(reply);
                }
            }
            opcode::CMSG_CREATURE_QUERY => {
                let entry = template_entry(&packet.payload);
                if let Some(reply) =
                    client::creature_queries::creature_query(entry, &member_locale)
                {
                    replies.push(reply);
                }
            }
            opcode::CMSG_GAMEOBJECT_QUERY => {
                let entry = template_entry(&packet.payload);
                if let Some(reply) =
                    client::object_queries::gameobject_query(entry, &member_locale)
                {
                    replies.push(reply);
                }
            }
            opcode::CMSG_ITEM_QUERY_SINGLE => {
                let entry = template_entry(&packet.payload);
                let stars = game.with_party_hero(slot, |hero| hero.item_star_rank(entry))
                    .flatten().unwrap_or(0);
                replies.push(
                    state
                        .inventory
                        .entry(client)
                        .or_default()
                        .query(entry, stars, &armory, &locale, &language, item_texts),
                );
            }
            opcode::CMSG_CAST_SPELL => {
                // The cast denial uses the same zero-filled prefix as a template query.
                let spell_id = template_entry(&packet.payload);
                replies.push(SessionEvent::CastResult {
                    spell_id,
                    success: false,
                    reason: Some(0x17),
                    arg: None,
                });
            }
            opcode::CMSG_GOSSIP_SELECT_OPTION => {
                // The GUID is ignored. The option is an independent, zero-filled u32.
                let option = template_entry(packet.payload.get(8..).unwrap_or_default());
                let applied = game
                    .with_party_hero(slot, |hero| match option {
                        9 => hero.reroll_choices(),
                        10 => hero.skip_choices(),
                        // Forwarded Again/Menu are discarded; Endless is a guest no-op.
                        20..=22 => false,
                        index if !hero.dead && !hero.completed => hero.choose(index as usize),
                        _ => false,
                    })
                    .unwrap_or(false);
                if applied {
                    let revision = state.choice_generations.entry(client).or_default();
                    *revision = revision.wrapping_add(1).max(1);
                }
            }
            opcode::CMSG_GAMEOBJ_USE => {
                if let Some(object) = u64_at(&packet.payload, 0) {
                    if started {
                        let mut ground = WorldTerrain {
                            streamer,
                            tiles,
                            collision: None,
                            fallback: world.position_wow[2],
                            native: Some(floor),
                        };
                        let point = game
                            .party_snapshot()
                            .heroes
                            .iter()
                            .find(|hero| hero.slot == usize::from(slot))
                            .map(|hero| hero.position);
                        if let Some(point) = point {
                            game.with_party_hero(slot, |game| {
                                game.click_cache(object, Position::from(point), &mut ground)
                            });
                        }
                    }
                }
            }
            0x10a | 0x10b | 0x10c | 0x10d | 0x111 => {
                let first = packet.payload.first().copied().unwrap_or_default();
                let second = packet.payload.get(1).copied().unwrap_or_default();
                if let Some(event) = client::inventory_requests::refused(packet.opcode, first, second) {
                    replies.push(event);
                }
            }
            // Other opcodes retain their native default until their owner is connected.
            _ => {}
        }
        for event in replies {
            if let Ok(Some(encoded)) = engine_packets::encode(&event, Some(guid)) {
                let message = engine_packets::item_message(encoded, |id|
                    item_texts.0.iter().find(|(entry, _)| *entry == id).map(|(_, text)| text.clone()));
                runtime.send(Some(client), message);
            }
        }
    }
}

fn meter_request(body: &[u8]) -> Option<client::addon_feed::MeterRequest> {
    use benilla_protocol::messages::{CHAT_TYPE_PARTY, LANGUAGE_ADDON};
    if u32_at(body, 0) != Some(CHAT_TYPE_PARTY) || u32_at(body, 4) != Some(LANGUAGE_ADDON) {
        return None;
    }
    let text = body.get(8..)?.strip_suffix(&[0])?;
    client::addon_feed::MeterRequest::parse(std::str::from_utf8(text).ok()?)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn addon_replay_requires_the_addon_party_wire_body() {
        use benilla_protocol::messages::{CHAT_TYPE_PARTY, LANGUAGE_ADDON, messagechat};
        use client::addon_feed::MeterRequest;
        let full = messagechat(CHAT_TYPE_PARTY, LANGUAGE_ADDON, "AZSMREQ\tfull");
        assert_eq!(meter_request(&full), Some(MeterRequest::Full));
        assert_eq!(meter_request(&full[..full.len() - 1]), None);
        assert_eq!(meter_request(&messagechat(CHAT_TYPE_PARTY, 0, "AZSMREQ\tfull")), None);
        let party = messagechat(CHAT_TYPE_PARTY, LANGUAGE_ADDON, "AZSMREQ\tparty");
        assert_eq!(meter_request(&party), Some(MeterRequest::Party));
    }
    #[test]
    fn template_queries_zero_fill_only_the_missing_entry_bytes() {
        let body = [0x29, 0x23, 0x04, 0x80, 0xff, 0xff];
        for (length, entry) in [0u32, 0x29, 0x2329, 0x42329, 0x80042329]
            .into_iter()
            .enumerate()
        {
            assert_eq!(template_entry(&body[..length]), entry);
        }
        assert_eq!(template_entry(&body), 0x80042329);
    }
    #[test]
    fn movement_dispatch_does_not_accept_native_noop_c7() {
        assert!(movement(0xb5));
        assert!(movement(0xee));
        assert!(!movement(0xc7));
        assert!(!movement(0x13d));
        assert_eq!(u64_at(&[1; 7], 0), None);
        assert_eq!(u32_at(&[1; 3], 0), None);
    }
}
