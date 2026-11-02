//! Publish live run visual radii before the client consumes presentation events.
use super::super::RunSession;
use benilla_app::local_client::{LocalSpellScale, LocalSpellScales};
use bevy::prelude::*;

pub(super) fn install(app: &mut App) {
    app.init_resource::<LocalSpellScales>()
        .add_systems(First, publish.after(super::sync_to_client));
}

fn publish(session: Res<RunSession>, mut scales: ResMut<LocalSpellScales>,
    coop:Option<Res<crate::coop_runtime::CoopRuntime>>) {
    if coop.as_ref().is_some_and(|runtime|runtime.is_guest()){return;}
    let rows = session
        .mechanics
        .as_ref()
        .map(|game| game.visual_spell_scales())
        .unwrap_or_default()
        .into_iter()
        .map(|row| LocalSpellScale {
            spell_id: row.spell_id,
            scale: row.scale,
            attached: row.attached,
        })
        .collect::<Vec<_>>();
    if scales.0 != rows {
        scales.0 = rows;
    }
}
