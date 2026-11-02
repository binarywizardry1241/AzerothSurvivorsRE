//! Current 0.109.0 shared border/lift updater140076b00 and query1403aa7c0.
//! Each constructor supplies its two colors and lift; Changed<Interaction>
//! drives all four sides and the optional UI transform. Current provenance:
//! docs/analysis/talents-page-0.109.0.md (shared hover subsection).

use bevy::prelude::*;

pub struct NativeHoverPlugin;

impl Plugin for NativeHoverPlugin {
    fn build(&self, app: &mut App) {
        app.add_systems(Update, update_hover);
    }
}

#[derive(Component, Clone, Copy)]
pub struct NativeHover {
    pub resting: Color,
    pub active: Color,
    pub lift: f32,
}

impl NativeHover {
    pub const fn new(resting: Color, active: Color, lift: f32) -> Self {
        Self {
            resting,
            active,
            lift,
        }
    }
}

fn update_hover(
    mut nodes: Query<
        (
            &Interaction,
            &NativeHover,
            &mut BorderColor,
            Option<&mut UiTransform>,
        ),
        Changed<Interaction>,
    >,
) {
    for (interaction, style, mut border, transform) in &mut nodes {
        let active = *interaction != Interaction::None;
        *border = BorderColor::all(if active { style.active } else { style.resting });
        if let Some(mut transform) = transform {
            transform.translation = Val2::px(0.0, if active { -style.lift } else { 0.0 });
        }
    }
}
