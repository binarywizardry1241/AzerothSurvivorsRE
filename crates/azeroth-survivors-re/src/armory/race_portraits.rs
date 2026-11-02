//! Current 0.113.2 Appearance atlas/image/button contract (1402cafd0).
use super::{Action, Face, MenuArt, GOLD};
use bevy::prelude::*;

pub(crate) fn portrait(art: &MenuArt, race: u8, sex: u8, allowed: bool) -> Option<ImageNode> {
    let (x, row) = match race {
        1 => (0., 0.),
        2 => (192., 64.),
        3 => (64., 0.),
        4 => (192., 0.),
        5 => (64., 64.),
        6 => (0., 64.),
        7 => (128., 0.),
        8 => (128., 64.),
        _ => return None,
    };
    let y = row + f32::from(sex) * 128.;
    Some(ImageNode {
        rect: Some(Rect::new(x, y, x + 64., y + 64.)),
        color: if allowed {
            Color::WHITE
        } else {
            Color::srgb(0.25, 0.25, 0.25)
        },
        ..ImageNode::new(art.icons.get(crate::assets::RACE_ATLAS)?.clone())
    })
}

pub(super) fn spawn(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    race: u8,
    sex: u8,
    selected: bool,
    allowed: bool,
) {
    let mut button = ui.spawn((
        Button,
        Action::Race(race),
        Face {
            selected,
            primary: false,
            disabled: !allowed,
        },
        crate::menu::NativeStaticFrame,
        Node {
            width: Val::Px(37.),
            height: Val::Px(37.),
            border: UiRect::all(Val::Px(2.)),
            border_radius: BorderRadius::all(Val::Px(6.)),
            ..default()
        },
        BackgroundColor(Color::BLACK),
        BorderColor::all(if selected {
            GOLD
        } else {
            Color::srgb(0.169, 0.129, 0.071)
        }),
        BoxShadow::new(
            if selected {
                Color::srgba(0.973, 0.824, 0.416, 0.7)
            } else {
                Color::srgba(0., 0., 0., 0.85)
            },
            Val::Px(0.),
            Val::Px(0.),
            Val::Px(if selected { 1. } else { 0. }),
            Val::Px(if selected { 12. } else { 6. }),
        ),
    ));
    if let Some(image) = portrait(art, race, sex, allowed) {
        button.insert(image);
    }
}
