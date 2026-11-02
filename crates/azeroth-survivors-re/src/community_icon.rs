//! Native utility bitmap, revalidated against the current 0.109.0 image.
//! The native producer maps each of the 40×30 alpha bytes to (255,255,255,a).
//! Current pixel producer/input and historical source: menu-utilities-0.109.0.md.

use bevy::{
    asset::RenderAssetUsages,
    prelude::Image,
    render::render_resource::{Extent3d, TextureDimension, TextureFormat},
};
use serde::Deserialize;

#[derive(Deserialize)]
struct Mask {
    width: u32,
    height: u32,
    alpha_rows: Vec<String>,
}

pub fn image() -> Image {
    let mask: Mask = serde_json::from_str(include_str!("../assets/community-icon.json"))
        .expect("embedded native community alpha data");
    assert_eq!(mask.alpha_rows.len(), mask.height as usize);
    let mut pixels = Vec::with_capacity(mask.width as usize * mask.height as usize * 4);
    for row in mask.alpha_rows {
        assert_eq!(row.len(), mask.width as usize * 2);
        for at in (0..row.len()).step_by(2) {
            let alpha = u8::from_str_radix(&row[at..at + 2], 16).expect("native alpha hex");
            pixels.extend_from_slice(&[255, 255, 255, alpha]);
        }
    }
    Image::new(
        Extent3d {
            width: mask.width,
            height: mask.height,
            depth_or_array_layers: 1,
        },
        TextureDimension::D2,
        pixels,
        TextureFormat::Rgba8UnormSrgb,
        RenderAssetUsages::RENDER_WORLD,
    )
}
