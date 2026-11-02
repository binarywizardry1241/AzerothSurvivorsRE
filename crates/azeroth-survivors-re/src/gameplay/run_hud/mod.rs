//! Custom run HUD. Selected constructors, controls and settings are revalidated
//! against 0.109.0; docs/analysis/run-hud-0.109.0.md records the exact limits.

mod controls;
mod layout;
mod loot;
mod pause;
mod settings;
mod view;
pub(crate) use pause::Pause;
pub(crate) use settings::{defaults, owns_cvar, HudSettings};
pub(crate) use loot::LootNotices;

use super::RunSet;
use bevy::prelude::*;

pub(super) struct RunHudPlugin;

impl Plugin for RunHudPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<HudSettings>()
            .init_resource::<LootNotices>()
            .init_resource::<controls::LayoutState>()
            .init_resource::<Pause>()
            .add_systems(
                Update,
                controls::capture_pointer
                    .in_set(benilla_app::local_client::LocalClientSet::OverlayCapture),
            )
            .add_systems(
                Update,
                (settings::sync, pause::input, controls::input)
                    .chain()
                    .before(super::controls)
                    .in_set(RunSet::Input)
                    .in_set(benilla_app::local_client::LocalClientSet::OverlayInput),
            )
            .add_systems(
                Update,
                (view::sync, controls::place, pause::sync, loot::sync, loot::animate)
                    .chain()
                    .in_set(RunSet::Present),
            );
    }
}
