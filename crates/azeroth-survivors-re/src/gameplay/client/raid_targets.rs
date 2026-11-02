//! Solo raid-target board and responses recovered from AS 0.115.0.
//! See docs/analysis/raid-targets-0.115.0.md for exact native ranges and limits.

use benilla_app::local_client::{events::{LocalPresentationEvents, SessionEvent},
    LocalClientSession, LocalClientSet};
use bevy::prelude::*;

#[derive(Resource, Default)]
pub(crate) struct RaidTargets {
    icons: [u64; 8],
    identity: Option<u64>,
}

const POPUP: &str = include_str!(
    "../../../../../docs/analysis/evidence/0.115.0/raid-targets/popup.lua"
);

pub(super) fn appends() -> Vec<(String, String)> {
    vec![(r"Interface\FrameXML\WorldStateFrame.lua".into(), POPUP.into())]
}

pub(super) fn install(app: &mut App) {
    // Seat the reset packet before Update dispatch and the first new-run unit
    // snapshots. The ordinary request drain still follows native logout handling.
    app.init_resource::<RaidTargets>().add_systems(First,
        reset.after(super::sync_to_client).before(LocalClientSet::Lifecycle));
}

fn decode(body: &[u8]) -> SessionEvent {
    let packet = benilla_protocol::messages::parse_server(0x321, body)
        .expect("native raid-target packet");
    benilla_protocol::decode(packet).into_iter().next().expect("raid-target event")
}

impl RaidTargets {
    pub(crate) fn list(&self) -> SessionEvent {
        let mut body = vec![1];
        for (icon, &guid) in self.icons.iter().enumerate() {
            if guid != 0 {
                body.push(icon as u8);
                body.extend_from_slice(&guid.to_le_bytes());
            }
        }
        decode(&body)
    }

    pub(crate) fn set(&mut self, icon: u8, guid: u64) -> Vec<SessionEvent> {
        if icon == 0xff { return vec![self.list()]; }
        let selected = usize::from(icon);
        if selected >= self.icons.len() { return Vec::new(); }
        let mut changed = Vec::new();
        if guid != 0 {
            for (other, value) in self.icons.iter_mut().enumerate() {
                if other != selected && *value == guid {
                    *value = 0;
                    changed.push(other);
                }
            }
        }
        if self.icons[selected] != guid {
            self.icons[selected] = guid;
            changed.push(selected);
        }
        changed.into_iter().map(|slot| {
            let mut body = vec![0, slot as u8];
            body.extend_from_slice(&self.icons[slot].to_le_bytes());
            decode(&body)
        }).collect()
    }
}

fn reset(
    session: Res<super::super::RunSession>,
    local: Res<LocalClientSession>,
    mut board: ResMut<RaidTargets>,
    mut presentation: ResMut<LocalPresentationEvents>,
) {
    if local.active && board.identity != Some(session.identity) {
        board.icons = [0; 8];
        board.identity = Some(session.identity);
        presentation.0.push(board.list());
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_duplicate_cleanup_precedes_the_selected_slot() {
        let mut board = RaidTargets { icons: [1, 2, 3, 4, 5, 6, 7, 8], identity: None };
        assert!(matches!(&board.set(0, 7)[..], [
            SessionEvent::RaidTargetSet { icon: 6, guid: 0 },
            SessionEvent::RaidTargetSet { icon: 0, guid: 7 },
        ]));
        assert!(board.set(0, 7).is_empty());
        assert!(board.set(8, 7).is_empty());
        assert!(matches!(&board.set(0, 0)[..], [SessionEvent::RaidTargetSet { icon: 0, guid: 0 }]));
        assert!(matches!(board.list(), SessionEvent::RaidTargetList { entries }
            if entries == vec![(1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (7, 8)]));
    }

    #[test]
    fn new_run_resets_the_board_but_same_identity_and_inactive_ticks_do_not() {
        let mut app = App::new();
        app.init_resource::<super::super::super::RunSession>()
            .insert_resource(LocalClientSession { active: true, ..Default::default() })
            .init_resource::<RaidTargets>()
            .init_resource::<LocalPresentationEvents>();
        install(&mut app);
        // Production registration must already publish before any Update work.
        app.world_mut().run_schedule(First);
        assert!(matches!(&app.world().resource::<LocalPresentationEvents>().0[..],
            [SessionEvent::RaidTargetList { entries }] if entries.is_empty()));
        app.world_mut().resource_mut::<LocalPresentationEvents>().0.clear();
        app.world_mut().resource_mut::<RaidTargets>().set(7, 99);
        app.update();
        assert!(app.world().resource::<LocalPresentationEvents>().0.is_empty());
        assert_eq!(app.world().resource::<RaidTargets>().icons[7], 99);
        app.world_mut().resource_mut::<LocalClientSession>().active = false;
        app.update();
        assert_eq!(app.world().resource::<RaidTargets>().icons[7], 99);
        app.world_mut().resource_mut::<LocalClientSession>().active = true;
        app.world_mut().resource_mut::<super::super::super::RunSession>().identity += 1;
        app.update();
        assert!(matches!(&app.world().resource::<LocalPresentationEvents>().0[..],
            [SessionEvent::RaidTargetList { entries }] if entries.is_empty()));
        assert_eq!(app.world().resource::<RaidTargets>().icons, [0; 8]);
    }
}
