//! Offline transport for the ordinary GlueXML frontend. The embedding owns
//! roster mutations; the existing glue manager retains its dialogs and verbs.

use bevy::prelude::*;

pub use benilla_protocol::wire::Vector3d as LocalStockPosition;
pub use benilla_protocol::CharEnumItem as LocalStockEquipment;
pub use benilla_protocol::{
    CharCreateReq as LocalStockCreate, Character as LocalStockCharacter,
    RealmInfo as LocalStockRealm,
};

#[derive(Clone, Debug)]
pub enum LocalStockRequest {
    Authenticate(benilla_ui::script::GlueCredentials),
    Realms,
    Connect(LocalStockRealm),
    Enumerate,
    Create(LocalStockCreate),
    Delete(u64),
    Enter(u64),
    LeaveWorld,
    /// Close the realmd link at the login/realm park. At character select the
    /// native parked world link ignores this request.
    CloseLogon,
    Abandon,
}

#[derive(Clone, Debug)]
pub enum LocalStockReply {
    /// Native client credential normalization or server-proof verification
    /// failed as an ordinary transport error, without an AuthReject byte.
    AuthenticationFailed,
    /// A realm refresh before credentials have established a logon link.
    /// A retained closed link with valid credentials reauthenticates instead.
    RealmListUnavailable,
    Authenticated(LocalStockRealm),
    Realms(Vec<LocalStockRealm>),
    Roster(Vec<LocalStockCharacter>),
    Created(u8),
    Deleted(u8),
}

/// Insert before [`super::LocalClientPlugin`] to let the real GlueXML screens
/// own the frontend while retaining the embedding's local in-world authority.
#[derive(Resource, Default)]
pub struct LocalStockFrontend {
    pub requests: Vec<LocalStockRequest>,
    pub replies: Vec<LocalStockReply>,
    pub(crate) authenticated: bool,
    pub(crate) bootstrapped: bool,
}

impl LocalStockFrontend {
    /// Invalidate a superseded local link without restarting the GlueXML bootstrap.
    pub fn invalidate_authentication(&mut self) {
        self.authenticated = false;
    }
}

pub(super) fn bootstrap(
    mut frontend: Option<ResMut<LocalStockFrontend>>,
    manager: NonSend<crate::ui_script::glue_mgr::SharedGlueMgr>,
) {
    let Some(frontend) = frontend.as_deref_mut() else {
        return;
    };
    if frontend.bootstrapped {
        return;
    }
    frontend.bootstrapped = true;
    // Selected-target argv145878d40 supplies these credentials in ordinary
    // mode. This begins the normal manager login, without a socket worker.
    manager.get_mut().begin_local_login();
}

/// The ordinary network policy receives CharListMessage; local roster replies
/// seat those same rows directly. Reuse its one-shot and Enter World consumer
/// after the glue manager has loaded the actual character-selection screen.
pub(super) fn startup_pick(
    mut roster: ResMut<crate::glue_session::roster::Roster>,
    mut pick: ResMut<crate::glue_session::roster::RunPick>,
    rig: Option<Res<crate::run_mode::RigCharacter>>,
    mut exit: MessageWriter<AppExit>,
) {
    use crate::glue_session::roster::{read_environment_character, take_environment_character, RunPick};
    read_environment_character(&mut roster, rig.as_deref());
    if roster.chars.is_empty() || roster.pending_pick.is_some() { return; }
    if let Some(result) = take_environment_character(&mut roster) {
        match result {
            Ok(guid) => *pick = RunPick::enter_once(guid),
            Err(why) if crate::run_mode::fatal_when_driverless(&why) => {
                exit.write(AppExit::error());
            }
            Err(_) => {}
        }
    }
}
