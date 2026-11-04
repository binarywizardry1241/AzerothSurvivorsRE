//! 0.127.0 amulet replacement modal. Native owners and scalar input proof:
//! docs/analysis/amulet-confirmation-0.127.0.md.

use super::{
    BORDER, Card, Enabled, GOLD, MUTED, OverlayAction, PALE, PresentedCard, ReplacementItem, TEXT,
};
use crate::{assets::MenuArt, canvas::NativeCanvas, localization::Localization};
use benilla_app::{
    UiKeyboardCapture,
    local_client::{LocalClientExtension, LocalClientInput},
};
use bevy::{prelude::*, ui::FocusPolicy};

#[derive(Component)]
pub(in crate::gameplay) struct Root;

/// The parser constructs its optional replacement record for an amulet's
/// string-valued `replaces`, even when that string is empty.
pub(in crate::gameplay) fn payload_requires_confirmation(row: &serde_json::Value) -> bool {
    row["kind"].as_str() == Some("amulet") && row["replaces"].as_str().is_some()
}

/// Publish the 0.141.0 confirmation gate before FrameXML consumes the ordered
/// records. The modal still reads the original typed key state.
pub(in crate::gameplay) fn capture_enter(
    presentation: Res<super::super::ChoicePresentation>,
    keyboard: Res<UiKeyboardCapture>,
    keys: Res<ButtonInput<KeyCode>>,
    mut held: Local<[bool; 2]>,
    mut extension: ResMut<LocalClientExtension>,
) {
    let owns_enter = presentation.confirming.is_some() && !keyboard.is_typing();
    for (key, held) in [KeyCode::Enter, KeyCode::NumpadEnter]
        .into_iter()
        .zip(held.iter_mut())
    {
        let captured = owns_enter || *held;
        if captured {
            extension.ignored_physical_keys.push(key);
        }
        *held = captured && keys.pressed(key);
    }
}

/// Native keyboard handling precedes the pointer result. Enter and numpad Enter
/// accept, the shared Escape request cancels, and typing captures only keys.
pub(in crate::gameplay) fn decision(
    keys: &ButtonInput<KeyCode>,
    input: &LocalClientInput,
    pointer: Option<OverlayAction>,
) -> Option<bool> {
    if !input.keyboard_captured {
        if input.custom_game_menu_requested {
            return Some(false);
        }
        if keys.just_pressed(KeyCode::Enter) || keys.just_pressed(KeyCode::NumpadEnter) {
            return Some(true);
        }
    }
    match pointer {
        Some(OverlayAction::Confirm) => Some(true),
        Some(OverlayAction::Cancel) => Some(false),
        _ => None,
    }
}

/// Keep the ordinary card hierarchy and its opening clock. Only this separate
/// 6060 modal root changes on pending slot/cancel/accept/revision transitions.
pub(in crate::gameplay) fn sync(
    mut commands: Commands,
    presentation: Res<super::super::ChoicePresentation>,
    art: Res<MenuArt>,
    locale: Res<Localization>,
    cards: Query<(&OverlayAction, &PresentedCard)>,
    roots: Query<Entity, With<Root>>,
    mut previous: Local<Option<(usize, u32)>>,
) {
    let pending = presentation
        .confirming
        .map(|(index, at)| (index, at.to_bits()))
        .filter(|(index, _)| {
            cards.iter().any(|(action, card)| {
                *action == OverlayAction::Select(*index) && card.0.replacement.is_some()
            })
        });
    if pending == *previous && !art.is_changed() && !locale.is_changed() {
        return;
    }
    *previous = pending;
    for root in &roots {
        commands.entity(root).despawn();
    }
    let Some((index, _)) = pending else {
        return;
    };
    let Some((_, PresentedCard(card))) = cards
        .iter()
        .find(|(action, _)| **action == OverlayAction::Select(index))
    else {
        return;
    };
    let Some(worn) = &card.replacement else {
        return;
    };
    spawn(&mut commands, &art, &locale, card, worn);
}

fn spawn(
    commands: &mut Commands,
    art: &MenuArt,
    locale: &Localization,
    card: &Card,
    worn: &ReplacementItem,
) {
    commands.spawn((Root, GlobalZIndex(6060), FocusPolicy::Block, Interaction::None,
        BackgroundColor(Color::srgba(0., 0., 0., f32::from_bits(0x3f1e_b852))),
        Node { position_type: PositionType::Absolute, width: Val::Percent(100.), height: Val::Percent(100.), ..default() }))
        .with_children(|root| {
            root.spawn((NativeCanvas { design: Vec2::new(1280., 760.), max_scale: 1.35 },
                Node { position_type: PositionType::Absolute, width: Val::Px(1280.), height: Val::Px(760.),
                    align_items: AlignItems::Center, justify_content: JustifyContent::Center, ..default() }))
                .with_children(|canvas| {
                    canvas.spawn((Node { width: Val::Px(660.), padding: UiRect {
                        left: Val::Px(28.), right: Val::Px(28.), top: Val::Px(22.), bottom: Val::Px(24.) },
                        border: UiRect::all(Val::Px(1.)), border_radius: BorderRadius::all(Val::Px(10.)),
                        flex_direction: FlexDirection::Column, align_items: AlignItems::Center,
                        row_gap: Val::Px(12.), ..default() }, crate::menu::native_panel_style()))
                        .with_children(|panel| {
                            label(panel, art, locale.label("AMULET"), 12., GOLD, false);
                            label(panel, art, locale.label("Your amulet will be replaced"), 34., PALE, true);
                            super::text(panel, art, locale.label("You wear one amulet at a time. The one you wear now is lost for good."),
                                15., MUTED, false, Node { width: Val::Percent(80.), ..default() });
                            panel.spawn(Node { width: Val::Percent(100.), align_items: AlignItems::Center,
                                justify_content: JustifyContent::SpaceBetween, ..default() })
                                .with_children(|row| {
                                    preview(row, art, locale, worn, false);
                                    label(row, art, "»", 40., GOLD, false);
                                    preview(row, art, locale, &ReplacementItem { name: card.name.clone(),
                                        icon_key: card.icon_key.clone(),
                                        icon: card.icon.clone(), rarity: card.rarity,
                                        rank: card.rank.unwrap_or(1).min(u64::from(u32::MAX)) as u32,
                                        lines: card.lines.clone() }, true);
                                });
                            panel.spawn(Node { align_items: AlignItems::Center, column_gap: Val::Px(6.), ..default() })
                                .with_children(|row| {
                                    action(row, art, locale.label("Cancel"), "Esc", OverlayAction::Cancel);
                                    action(row, art, locale.label("Confirm"), "Enter", OverlayAction::Confirm);
                                });
                        });
                });
        });
}

fn label(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: &str,
    size: f32,
    color: Color,
    heading: bool,
) {
    super::text(ui, art, value, size, color, heading, Node::default());
}

fn preview(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    locale: &Localization,
    item: &ReplacementItem,
    new: bool,
) {
    let rarity = item.rarity.min(4);
    let tint = super::rgb(if new { TEXT[rarity] } else { BORDER[rarity] });
    ui.spawn((
        Node {
            width: Val::Px(250.),
            padding: UiRect {
                left: Val::Px(14.),
                right: Val::Px(14.),
                top: Val::Px(12.),
                bottom: Val::Px(14.),
            },
            border: UiRect::all(Val::Px(2.)),
            border_radius: BorderRadius::all(Val::Px(12.)),
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::Center,
            row_gap: Val::Px(6.),
            ..default()
        },
        BorderColor::all(tint.with_alpha(if new { 1. } else { 0.8 })),
        BackgroundGradient::from(LinearGradient {
            angle: f32::from_bits(0x403e_2e93),
            stops: vec![
                ColorStop::new(super::linear(super::TINT[rarity], 1.), Val::Percent(0.)),
                ColorStop::new(
                    Color::linear_rgba(0.051, 0.039, 0.027, 1.),
                    Val::Percent(55.),
                ),
                ColorStop::new(
                    Color::linear_rgba(0.020, 0.016, 0.012, 1.),
                    Val::Percent(100.),
                ),
            ],
            ..default()
        }),
        BoxShadow::new(
            tint.with_alpha(if new { 0.35 } else { 0. }),
            Val::Px(0.),
            Val::Px(0.),
            Val::Px(1.),
            Val::Px(22.),
        ),
    ))
    .with_children(|column| {
        label(
            column,
            art,
            locale.label(if new { "NEW" } else { "WORN NOW" }),
            11.,
            if new {
                Color::srgb(0.302, 1., 0.416)
            } else {
                MUTED
            },
            false,
        );
        if let Some(icon) = &item.icon {
            column.spawn((
                ImageNode {
                    image: icon.clone(),
                    color: Color::WHITE.with_alpha(if new { 1. } else { 0.7 }),
                    ..default()
                },
                Node {
                    width: Val::Px(64.),
                    height: Val::Px(64.),
                    border: UiRect::all(Val::Px(2.)),
                    border_radius: BorderRadius::all(Val::Px(8.)),
                    ..default()
                },
                BorderColor::all(tint),
            ));
        }
        label(column, art, &item.name, 18., tint, false);
        if item.rank > 1 {
            label(
                column,
                art,
                &locale
                    .label("RANK {n}")
                    .replace("{n}", &item.rank.to_string()),
                12.,
                MUTED,
                false,
            );
        }
        column
            .spawn(Node {
                width: Val::Percent(70.),
                flex_direction: FlexDirection::Column,
                align_items: AlignItems::Center,
                row_gap: Val::Px(3.),
                ..default()
            })
            .with_children(|lines| {
                for line in &item.lines {
                    super::number_text(lines, art, line);
                }
            });
        if !new {
            label(
                column,
                art,
                locale.label("Lost if you take this one"),
                12.,
                Color::srgb(1., 0.353, 0.235),
                false,
            );
        }
    });
}

fn action(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: &str,
    key: &str,
    action: OverlayAction,
) {
    let mut node = super::button_node(false);
    node.min_width = Val::Px(150.);
    node.justify_content = JustifyContent::Center;
    ui.spawn((
        Button,
        action,
        Enabled(true),
        node,
        super::button_gradient(),
        BorderColor::all(crate::menu::BUTTON_EDGE),
    ))
    .with_children(|button| {
        label(button, art, value, 17., GOLD, false);
        button
            .spawn((
                Node {
                    padding: UiRect::axes(Val::Px(5.), Val::Px(0.)),
                    border: UiRect::all(Val::Px(1.)),
                    border_radius: BorderRadius::all(Val::Px(3.)),
                    ..default()
                },
                BorderColor::all(crate::menu::EDGE),
            ))
            .with_children(|badge| label(badge, art, key, 11., MUTED, false));
    });
}
