//! Current1402b7530 title and ordered help rows. The native caller supplies
//! its qualified piece count; collection ownership remains a separate hint.
use super::{ArmoryCatalog, GearSave, MenuArt, MenuCatalog, MenuState, Page, SetTip};
use bevy::{prelude::*, window::PrimaryWindow};
use crate::options::OptionsState;

#[derive(Component)]
pub(super) struct Root;

fn content(labels: &MenuCatalog, catalog: &ArmoryCatalog, state: &MenuState,
    gear: &GearSave, tip: SetTip) -> (String, Vec<String>)
{
    let eight = tip.required == 8;
    let stars = if eight { 3 } else { 1 };
    let class = state.class_id();
    let zones = crate::save::Save::star_zone_indices(tip.tier)
        .filter_map(|index| catalog.zones.get(index))
        .map(|zone| super::zone_label(labels, zone)).collect::<Vec<_>>().join(" · ");
    let mut lines = vec![crate::localization::format(labels,
        if eight { "armory.set_tip8" } else { "armory.set_tip4" },
        &[("n", tip.qualified_count.min(usize::from(tip.required)).to_string())])];
    let cap = state.save.star_cap(class, tip.tier);
    lines.push(if cap < stars {
        crate::localization::format(labels, "armory.set_tip_stars", &[
            ("class", labels.classes[state.class].name.clone()),
            ("heroic", azeroth_survivors_re::heroic::rank_name(stars.min(5),
                labels.label("Normal"), labels.label("Heroic"))),
            ("zones", zones.clone()), ("stars", stars.to_string()),
        ])
    } else {
        crate::localization::format(labels, "armory.set_tip_open", &[("cap", cap.to_string())])
    });
    let owned = super::collection_set_progress(catalog, gear, class, usize::from(tip.tier))
        .pieces.iter().take(8).filter(|piece| piece.is_some()).count();
    if owned < 8 {
        lines.push(crate::localization::format(labels, "armory.set_tip_pieces", &[
            ("n", owned.to_string()), ("of", "8".into()), ("zones", zones),
        ]));
    }
    let title = crate::localization::format(labels,
        if eight { "armory.set_tip_title8" } else { "armory.set_tip_title4" },
        &[("set", super::set_name(labels, class, usize::from(tip.tier)))]);
    (title, lines)
}

pub(super) fn update(
    mut commands: Commands,
    art: Res<MenuArt>,
    labels: Res<MenuCatalog>,
    catalog: Res<ArmoryCatalog>,
    state: Res<MenuState>,
    options: Res<OptionsState>,
    windows: Query<&Window, With<PrimaryWindow>>,
    sources: Query<(Entity, &Interaction, &SetTip)>,
    mut roots: Query<(Entity, &mut Node), With<Root>>,
    mut previous: Local<Option<(Entity, SetTip)>>,
) {
    let Ok(window) = windows.single() else { return; };
    let cursor = window.cursor_position();
    let active = if !options.open && state.dialog.is_none() && cursor.is_some()
        && matches!(state.page, Page::Character | Page::Collection | Page::DropTables)
    {
        sources.iter().find(|(_, interaction, _)| **interaction != Interaction::None)
            .map(|(entity, _, tip)| (entity, *tip))
    } else { None };
    let size = Vec2::new(window.width(), window.height());
    if active == *previous && !art.is_changed() && !labels.is_changed() && !state.is_changed() {
        if let Some(cursor) = cursor {
            for (_, mut node) in &mut roots { crate::tooltip::position(&mut node, cursor, size); }
        }
        return;
    }
    *previous = active;
    for (entity, _) in &mut roots { commands.entity(entity).despawn(); }
    let (Some((_, tip)), Some(cursor)) = (active, cursor) else { return; };
    let gear = GearSave::read_for(&state.save, state.class_id(), state.race);
    let (title, lines) = content(&labels, &catalog, &state, &gear, tip);
    let node = crate::tooltip::frame(cursor, size);
    let root = crate::tooltip::spawn_frame(&mut commands, node, 5100);
    commands.entity(root).insert(Root).with_children(|ui| {
        super::flow_text(ui, &art, title, 16., Color::WHITE, false);
        for line in lines { super::flow_text(ui, &art, line, 13., super::GOLD, false); }
    });
}
