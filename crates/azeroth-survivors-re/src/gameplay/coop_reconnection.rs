//! Sampled service reconnection changes use the existing engine chat path.
use super::*;
use crate::localization::{LANGUAGES, Localization};
use azeroth_survivors_re::coop::{
    reconnection::{Notice, packet},
    session::ReconnectionChange,
};

pub(super) fn install(app: &mut App) {
    app.add_systems(
        First,
        publish
            .after(CoopSet::Apply)
            .before(super::publication::publish_units)
            .before(LocalClientSet::Lifecycle),
    );
}

/// Native145b45840 accepts exactly a recognized two-byte locale. An invalid
/// member code restores the selected global language, rather than English.
fn recipient_locale(locale: &Localization, hero: Option<&NativeHero>) -> Option<Localization> {
    let code = std::str::from_utf8(&hero?.bytes_30).ok()?;
    LANGUAGES
        .iter()
        .any(|(known, _)| *known == code)
        .then(|| locale.for_code(code))
}

fn publish(
    mut runtime: ResMut<CoopRuntime>,
    state: Res<CoopGame>,
    run: Res<RunSession>,
    local: Res<LocalClientSession>,
    locale: Res<Localization>,
    mut presentation: ResMut<LocalPresentationEvents>,
) {
    // Sampling already advanced the connection caches, even if this frame's
    // world/port gate discards the notice. Do not defer it until a later run.
    let changes = std::mem::take(&mut runtime.reconnection_changes);
    if runtime.is_guest() {
        if state.sync_sent && local.active {
            for change in changes {
                let notice = match change {
                    ReconnectionChange::Host(value) => Notice::Host(value),
                    ReconnectionChange::Relay(value) => Notice::Relay(value),
                    ReconnectionChange::Peer { .. } => continue,
                };
                presentation
                    .0
                    .push(notice.message(&|key| locale.label(key).to_owned()));
            }
        }
        return;
    }
    if !runtime
        .driver
        .as_ref()
        .is_some_and(|driver| driver.is_hosting())
    {
        return;
    }
    let Some(game) = run.mechanics.as_ref() else {
        return;
    };
    let changed = !changes.is_empty();
    for change in changes {
        match change {
            ReconnectionChange::Relay(value) if local.active => {
                let member = recipient_locale(&locale, state.local.as_ref());
                let member = member.as_ref().unwrap_or(&locale);
                presentation
                    .0
                    .push(Notice::Relay(value).message(&|key| member.label(key).to_owned()));
            }
            ReconnectionChange::Peer {
                client,
                reconnecting,
            } => {
                let Some(guid) = runtime.driver.as_ref().and_then(|driver| {
                    driver
                        .server
                        .clients()
                        .iter()
                        .find(|row| row.id == client)
                        .and_then(|row| row.world_hero)
                }) else {
                    continue;
                };
                let Some(affected) = game.party_slot(guid) else {
                    continue;
                };
                let Some(hero) = state
                    .world_profiles
                    .get(&guid)
                    .or_else(|| state.profiles.get(&client))
                else {
                    continue;
                };
                let name = String::from_utf8_lossy(&hero.name);
                let notice = Notice::Peer {
                    name: &name,
                    reconnecting,
                };
                for (slot, recipient_guid) in game.party_members() {
                    if slot == affected {
                        continue;
                    }
                    if slot == 0 {
                        if local.active {
                            let member = recipient_locale(&locale, state.local.as_ref());
                            let member = member.as_ref().unwrap_or(&locale);
                            presentation
                                .0
                                .push(notice.message(&|key| member.label(key).to_owned()));
                        }
                        continue;
                    }
                    let recipient = runtime
                        .driver
                        .as_ref()
                        .and_then(|driver| {
                            driver.server.clients().iter().find(|row| {
                                row.world_hero == Some(recipient_guid) && row.synchronized
                            })
                        })
                        .map(|row| row.id);
                    let Some(recipient) = recipient else { continue };
                    let member =
                        recipient_locale(&locale, state.world_profiles.get(&recipient_guid));
                    let member = member.as_ref().unwrap_or(&locale);
                    if let Ok(packet) = packet(notice, |key| member.label(key).to_owned()) {
                        runtime.send(Some(recipient), packet.into_message());
                    }
                }
            }
            _ => {}
        }
    }
    if changed {
        super::party_frames::fanout(&mut runtime, game, local.active, &mut presentation);
    }
}
