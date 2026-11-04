//! Selected-target ordinary frontend backend: real GlueXML sends the same
//! roster operations as the custom native server; no network worker is used.

use benilla_app::local_client::{
    LocalStockFrontend, LocalStockRealm, LocalStockReply, LocalStockRequest,
};
use bevy::prelude::*;
use azeroth_survivors_re::guardians::catalog::{ZONES, ZoneDefinition};

use crate::{armory::ArmoryCatalog, catalog::MenuCatalog, menu_state::MenuState};

#[derive(Resource, Default)]
struct Connection {
    /// The selected realm's port determines the connection's zone; saved Pick
    /// is independent. The native invalid-port fallback is the first zone.
    zone: usize,
    /// The auth connection captures its realm rows once. A later character
    /// mutation refreshes the roster without rewriting this auth snapshot.
    realms: Vec<LocalStockRealm>,
    /// Credentials and the session key outlive the realmd socket closed by
    /// Enter World. A later query reauthenticates with these retained inputs.
    credentials: bool,
    auth_open: bool,
    /// The world link stays parked across logout and Again, independently of
    /// realmd. Native realm Close is a no-op while this link is retained.
    world_open: bool,
}

impl Connection {
    fn authenticate(&mut self, accepted: bool, characters: usize) {
        *self = Self::default();
        self.credentials = accepted;
        if accepted {
            self.realms = realms(characters);
            self.auth_open = true;
        }
    }

    fn refresh(&mut self, characters: usize) -> Option<Vec<LocalStockRealm>> {
        if !self.credentials {
            return None;
        }
        if !self.auth_open {
            // Current140624a31 -> 140624da3 reopens from retained credentials;
            // the native server captures its new auth snapshot on that link.
            self.realms = realms(characters);
            self.auth_open = true;
        }
        Some(self.realms.clone())
    }

    fn close_logon(&mut self) -> bool {
        if self.world_open {
            return false;
        }
        *self = Self::default();
        true
    }
}

fn zones() -> &'static [ZoneDefinition] {
    ZONES
}

/// Native1459b1260 plus auth serializer1459623b0. The square operation
/// remains f32, preserving the server's mulss population value.
fn realms(characters: usize) -> Vec<LocalStockRealm> {
    zones()
        .iter()
        .enumerate()
        .map(|(index, zone)| LocalStockRealm {
            name: zone.name.to_owned(),
            address: format!("azeroth.local:{}", 8085 + index),
            population: zone.scalar_e0 * zone.scalar_e0,
            characters: characters.min(255) as u8,
            realm_type: 1,
            flags: 0,
            category: 1,
            id: (index + 1) as u8,
        })
        .collect()
}

/// Selected-target client SRP normalization: printable ASCII, 1..16 bytes,
/// uppercased before proof calculation. The local server derives its proof
/// from the submitted account and fixed SURVIVOR password; any valid account
/// is admitted, while a different password fails the client's M2 comparison.
fn valid_credentials(account: &str, password: &str) -> bool {
    let valid = |value: &str| {
        (1..=16).contains(&value.len()) && value.bytes().all(|byte| (0x20..=0x7e).contains(&byte))
    };
    valid(account) && valid(password) && password.eq_ignore_ascii_case("survivor")
}

pub struct StockFrontendPlugin;

impl Plugin for StockFrontendPlugin {
    fn build(&self, app: &mut App) {
        if !app.world().contains_resource::<LocalStockFrontend>() {
            return;
        }
        app.init_resource::<Connection>()
            .add_systems(Startup, configure_startup)
            .add_systems(Update, serve.before(crate::gameplay::RunSet::Input));
    }
}

fn configure_startup(startup: Res<crate::startup::NativeStartup>, mut menu: ResMut<MenuState>) {
    menu.set_startup_character(startup.character.clone());
}

fn cancel_pending_enter(menu: &mut MenuState) {
    // The local handoff is deferred to the gameplay schedule. A superseded
    // link must not leave that old entry armed after cancellation.
    if menu.entering && !menu.in_run {
        menu.return_from_run();
    }
}

fn serve(
    mut frontend: ResMut<LocalStockFrontend>,
    mut connection: ResMut<Connection>,
    mut menu: ResMut<MenuState>,
    catalog: Res<MenuCatalog>,
    armory: Res<ArmoryCatalog>,
    time: Res<Time>,
) {
    for request in std::mem::take(&mut frontend.requests) {
        match request {
            LocalStockRequest::Authenticate(credentials) => {
                cancel_pending_enter(&mut menu);
                let accepted = valid_credentials(&credentials.account, &credentials.password);
                connection.authenticate(accepted,
                    menu.backend_save.characters().len() + usize::from(menu.startup_character().is_some()));
                // A new login supersedes its previous link and any replies
                // still queued for it, including a canceled world connect.
                frontend.invalidate_authentication();
                frontend.replies.clear();
                if accepted {
                    frontend
                        .replies
                        .push(LocalStockReply::Realms(connection.realms.clone()));
                } else {
                    frontend.replies.push(LocalStockReply::AuthenticationFailed);
                }
            }
            LocalStockRequest::Realms => {
                let count = menu.backend_save.characters().len() + usize::from(menu.startup_character().is_some());
                frontend.replies.push(match connection.refresh(count) {
                    Some(rows) => LocalStockReply::Realms(rows),
                    None => LocalStockReply::RealmListUnavailable,
                });
            }
            LocalStockRequest::Connect(realm) => {
                if !connection.credentials { continue; }
                // The native listener derives its zone from the requested
                // port starting at 8085. A stale/invalid port uses Elwynn, as native.
                connection.zone = realm
                    .address
                    .rsplit_once(':')
                    .and_then(|(_, port)| port.parse::<usize>().ok())
                    .and_then(|port| port.checked_sub(8085))
                    .filter(|index| *index < zones().len())
                    .unwrap_or(0);
                connection.world_open = true;
                // The client retains the selected realm record; only the
                // server's world definition uses the port-derived fallback.
                frontend.replies.push(LocalStockReply::Authenticated(realm));
            }
            LocalStockRequest::Enumerate => {
                if !connection.world_open { continue; }
                let rows = crate::gameplay::stock_roster(
                    &menu.backend_save,
                    &zones()[connection.zone].key,
                    &armory,
                    menu.startup_character(),
                );
                frontend.replies.push(LocalStockReply::Roster(rows));
            }
            LocalStockRequest::Create(request) => {
                if !connection.world_open { continue; }
                let startup = menu.startup_character().cloned();
                let result = menu.backend_save.create_roster_character(
                    &request.name,
                    request.race,
                    request.class,
                    request.gender,
                    [
                        request.skin,
                        request.face,
                        request.hair_style,
                        request.hair_color,
                        request.facial_hair,
                    ],
                    startup.as_ref(),
                );
                if result == 0x2e {
                    menu.commit_account();
                    menu.persist_selection(&catalog);
                }
                frontend.replies.push(LocalStockReply::Created(result));
            }
            LocalStockRequest::Delete(guid) => {
                if !connection.world_open { continue; }
                // Native packet38 removes every duplicate matching GUID,
                // persists even on a miss, and always returns success39.
                menu.backend_save.remove_character(guid);
                menu.commit_account();
                menu.persist_selection(&catalog);
                frontend.replies.push(LocalStockReply::Deleted(0x39));
            }
            LocalStockRequest::Enter(guid) => {
                if !connection.world_open { continue; }
                // The ordinary client closes realmd at Enter World, retaining
                // credentials/session key for world links and later queries.
                connection.auth_open = false;
                if !menu.entering && !menu.in_run && menu.select_roster_character(guid) {
                    // A locked requested zone falls back to this class's
                    // highest unlocked zone (14589cdbf..14589ce59).
                    let index = if guid == crate::startup::TESTER_GUID { connection.zone }
                        else { connection.zone.min(menu.backend_save.unlock_value(menu.class_id()).unwrap_or(1).clamp(1,12) as usize - 1) };
                    menu.begin_roster_enter(guid, index, time.elapsed_secs());
                }
            }
            LocalStockRequest::LeaveWorld => {
                cancel_pending_enter(&mut menu);
                // Realm changes/canceled world connects retain their separate
                // auth link and its captured twelve-realm holder.
                frontend.replies.clear();
                frontend.invalidate_authentication();
                connection.world_open = false;
            }
            LocalStockRequest::CloseLogon => {
                if connection.close_logon() {
                    cancel_pending_enter(&mut menu);
                    frontend.replies.clear();
                    frontend.invalidate_authentication();
                }
            }
            LocalStockRequest::Abandon => {
                cancel_pending_enter(&mut menu);
                // The local transport has no worker that can outlive a
                // canceled link. Drop replies still queued for that link.
                frontend.replies.clear();
                frontend.invalidate_authentication();
                *connection = Connection::default();
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn realms_keep_native_zone_order_ports_ids_and_population() {
        let rows = realms(300);
        assert_eq!(rows.len(), 13);
        assert_eq!(rows[0].name, "Elwynn Forest");
        assert_eq!(rows[10].name, "Scholomance");
        assert_eq!(rows[12].name, "Naxxramas");
        for (index, (row, zone)) in rows.iter().zip(zones()).enumerate() {
            assert_eq!(row.address, format!("azeroth.local:{}", 8085 + index));
            assert_eq!(
                (row.realm_type, row.flags, row.category, row.id),
                (1, 0, 1, (index + 1) as u8)
            );
            assert_eq!(
                row.population.to_bits(),
                (zone.scalar_e0 * zone.scalar_e0).to_bits()
            );
            assert_eq!(row.characters, 255);
        }
    }

    #[test]
    fn local_srp_credentials_keep_native_case_and_normalization_boundaries() {
        for account in ["HERO", "Other", " ", "1234567890123456"] {
            assert!(valid_credentials(account, "suRViVor"));
        }
        for (account, password) in [
            ("", "survivor"),
            ("é", "survivor"),
            ("12345678901234567", "survivor"),
            ("HERO", "wrong"),
            ("HERO", " survivor"),
            ("HERO\n", "survivor"),
        ] {
            assert!(!valid_credentials(account, password));
        }
    }
}
