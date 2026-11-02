//! Current 0.100.1 replacement footer HoverTip1401f9880,
//! wrapper140113b60 and amulet body1401f2c20.
//! Owning byte ranges/constants: treasure-interface/tooltip-owners.json.
use super::{ReplacementItem, TEXT, rgb};
use crate::{assets::MenuArt, localization::Localization, menu};
use bevy::{prelude::*, ui::FocusPolicy};

#[derive(Component, Clone)]
pub struct ReplacementTooltip(pub ReplacementItem);

#[derive(Component)]
pub(crate) struct Root;

/// The replacement footer row owns its tooltip. Native left/right-10 expand
/// the auto-width frame beyond that row; its bottom is above the footer.
fn frame() -> Node {
    Node {
        position_type: PositionType::Absolute,
        left: Val::Px(-10.0),
        right: Val::Px(-10.0),
        bottom: Val::Percent(100.0),
        margin: UiRect::bottom(Val::Px(6.0)),
        padding: UiRect::axes(Val::Px(12.0), Val::Px(10.0)),
        border: UiRect::all(Val::Px(1.0)),
        border_radius: BorderRadius::all(Val::Px(6.0)),
        flex_direction: FlexDirection::Column,
        align_items: AlignItems::Center,
        row_gap: Val::Px(4.0),
        ..default()
    }
}

/// Native validates eight hex digits but passes the final six to its RGB
/// parser, so the WoW alpha byte is ignored. Unknown pipe sequences remain
/// literal text, including a doubled pipe; |r restores the default body gold.
pub(super) fn spans(text: &str, default_color: Color) -> Vec<(String, Color)> {
    let mut result = Vec::new();
    let mut color = default_color;
    let mut remaining = text;
    while let Some(at) = remaining.find('|') {
        if at != 0 { result.push((remaining[..at].to_owned(), color)); }
        remaining = &remaining[at..];
        if let Some(after) = remaining.strip_prefix("|r") {
            color = default_color;
            remaining = after;
        } else if remaining.as_bytes().get(..10).is_some_and(|bytes|
            &bytes[..2] == b"|c" && bytes[2..].iter().all(u8::is_ascii_hexdigit)) {
            let rgb = u32::from_str_radix(&remaining[4..10], 16).unwrap();
            color = Color::srgb_u8((rgb >> 16) as u8, (rgb >> 8) as u8, rgb as u8);
            remaining = &remaining[10..];
        } else {
            result.push(("|".to_owned(), color));
            remaining = &remaining[1..];
        }
    }
    if !remaining.is_empty() { result.push((remaining.to_owned(), color)); }
    result
}

pub fn rebuild(
    mut commands: Commands,
    art: Res<MenuArt>,
    locale: Res<Localization>,
    presentation: Res<super::super::ChoicePresentation>,
    sources: Query<(Entity, &Interaction, &ReplacementTooltip)>,
    roots: Query<Entity, With<Root>>,
    mut previous: Local<Option<Entity>>,
) {
    let active = if presentation.closing.is_some() || presentation.confirming.is_some() { None }
        else { sources.iter().find(|(_, interaction, _)| **interaction != Interaction::None) };
    let identity = active.as_ref().map(|(entity, _, _)| *entity);
    if identity == *previous && !art.is_changed() && !locale.is_changed() { return; }
    *previous = identity;
    for entity in &roots { commands.entity(entity).despawn(); }
    let Some((host, _, data)) = active else { return };
    let item = &data.0;
    let tint = rgb(TEXT[item.rarity.min(4)]);
    commands.spawn((Root, ChildOf(host), frame(), GlobalZIndex(6050), FocusPolicy::Pass,
        BackgroundColor(Color::srgba(0.02, 0.02, 0.06, 0.96)),
        BorderColor::all(tint.with_alpha(0.8)),
        BoxShadow::new(Color::linear_rgba(0.0, 0.0, 0.0, 0.85),
            Val::Px(0.0), Val::Px(3.0), Val::Px(0.0), Val::Px(12.0))))
        .with_children(|ui| {
            let font = |size| TextFont { font: art.font.clone(), font_size: size, ..default() };
            ui.spawn((Text::new(locale.label("WORN NOW")), font(11.0),
                TextColor(super::MUTED), menu::native_text_shadow()));
            ui.spawn(Node { align_items: AlignItems::Center, column_gap: Val::Px(8.0), ..default() })
                .with_children(|row| {
                    if let Some(icon) = &item.icon {
                        row.spawn((ImageNode::new(icon.clone()), Node {
                            width: Val::Px(30.0), height: Val::Px(30.0),
                            border: UiRect::all(Val::Px(1.0)),
                            border_radius: BorderRadius::all(Val::Px(4.0)), ..default()
                        }, BorderColor::all(tint)));
                    }
                    row.spawn((Text::new(&item.name), font(16.0), TextColor(tint), menu::native_text_shadow()));
                });
            if item.rank >= 2 {
                ui.spawn((Text::new(locale.label("RANK {n}").replace("{n}", &item.rank.to_string())),
                    font(12.0), TextColor(super::MUTED), menu::native_text_shadow()));
            }
            for line in &item.lines {
                let values = super::numeric_spans(line);
                let line_font = font(15.0);
                ui.spawn((Text::default(), line_font.clone(),
                    TextColor(Color::srgb(0.949, 0.902, 0.788)),
                    TextLayout::new_with_justify(Justify::Center), menu::native_text_shadow()))
                    .with_children(|text| {
                        for (value, numeric) in values {
                            text.spawn((TextSpan::new(value), line_font.clone(), TextColor(if numeric {
                                Color::srgb(0.302, 1.0, 0.416)
                            } else { Color::srgb(0.949, 0.902, 0.788) })));
                        }
                    });
            }
            ui.spawn((Text::new(locale.label("Lost if you take this one")), font(12.0),
                TextColor(Color::srgb(1.0, 0.353, 0.235)), menu::native_text_shadow()));
        });
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn wow_color_alpha_is_ignored_and_reset_restores_native_gold() {
        let output = spans("a|c00112233red|r gold", super::super::GOLD);
        assert_eq!(output.iter().map(|(text,_)|text.as_str()).collect::<String>(), "ared gold");
        assert_eq!(output[1].1, Color::srgb_u8(0x11,0x22,0x33));
        assert_eq!(output[2].1, super::super::GOLD);
        assert_eq!(spans("|| |c123oops", Color::WHITE).iter().map(|(text,_)|text.as_str()).collect::<String>(), "|| |c123oops");
    }
    #[test]
    fn current_replacement_tooltip_expands_above_its_footer() {
        let node = frame();
        assert_eq!(node.width, Val::Auto);
        assert_eq!(node.left, Val::Px(-10.0));
        assert_eq!(node.right, Val::Px(-10.0));
        assert_eq!(node.bottom, Val::Percent(100.0));
        assert_eq!(node.top, Val::Auto);
        assert_eq!(node.margin.bottom, Val::Px(6.0));
    }
}
