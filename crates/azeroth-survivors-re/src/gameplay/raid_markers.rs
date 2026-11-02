//! Native marker channel consumer; terrain meshes use the real client effect stream.
#[path = "raid_markers/geometry.rs"]
mod geometry;

use azeroth_survivors_re::raid_markers::{self as native, Markers};
use benilla_assets::coords::wow_to_bevy;
use benilla_world::{
    decal::WorldDecal,
    particles::buffer::{
        EffectBlend, EffectDrawSpec, EffectFog, EffectLighting, EffectQuads, begin_effect_frame,
    },
    view::WorldCamera,
};
use bevy::{
    asset::RenderAssetUsages,
    image::{ImageAddressMode, ImageFilterMode, ImageSampler, ImageSamplerDescriptor},
    prelude::*,
    render::render_resource::{Extent3d, TextureDimension, TextureFormat},
};
use std::collections::HashMap;

use super::RunSession;
use crate::menu_state::MenuState;

#[derive(Resource, Default)]
pub(super) struct MarkerInbox(pub Vec<serde_json::Value>);

#[derive(Resource, Default)]
struct Renderer {
    state: Markers,
    identity: Option<u64>,
    outlines: HashMap<u64, (u64, Vec<geometry::Group>)>,
    masks: Vec<Handle<Image>>,
}

pub(super) struct RaidMarkersPlugin;
impl Plugin for RaidMarkersPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<MarkerInbox>()
            .init_resource::<Renderer>()
            .add_systems(PostUpdate, present.after(begin_effect_frame));
    }
}

fn textures(images: &mut Assets<Image>) -> Vec<Handle<Image>> {
    native::MASK_SIZES
        .into_iter()
        .enumerate()
        .map(|(kind, (width, height))| {
            let (pixels, levels) = native::mask_pixels(kind);
            let mut image = Image::new_uninit(
                Extent3d {
                    width,
                    height,
                    depth_or_array_layers: 1,
                },
                TextureDimension::D2,
                TextureFormat::Rgba8Unorm,
                RenderAssetUsages::default(),
            );
            image.data = Some(pixels);
            image.texture_descriptor.mip_level_count = levels;
            image.sampler = ImageSampler::Descriptor(ImageSamplerDescriptor {
                address_mode_u: ImageAddressMode::ClampToEdge,
                address_mode_v: ImageAddressMode::ClampToEdge,
                mag_filter: ImageFilterMode::Linear,
                min_filter: ImageFilterMode::Linear,
                mipmap_filter: ImageFilterMode::Linear,
                ..Default::default()
            });
            images.add(image)
        })
        .collect()
}

fn present(
    mut renderer: ResMut<Renderer>,
    mut inbox: ResMut<MarkerInbox>,
    session: Res<RunSession>,
    menu: Res<MenuState>,
    time: Res<Time>,
    ground: WorldDecal,
    cameras: Query<Entity, With<WorldCamera>>,
    mut stream: ResMut<EffectQuads>,
    mut images: ResMut<Assets<Image>>,
) {
    let identity = menu.in_run.then_some(session.identity);
    if renderer.identity != identity {
        renderer.state.clear();
        renderer.outlines.clear();
        renderer.identity = identity;
    }
    if identity.is_none() {
        inbox.0.clear();
        return;
    }
    let now = time.elapsed_secs();
    for value in inbox.0.drain(..) {
        renderer.state.receive(&value, now);
    }
    renderer.state.reap(now);
    let rows = renderer.state.rows.clone();
    renderer
        .outlines
        .retain(|id, _| rows.iter().any(|row| row.id == *id));
    let Ok(cam) = cameras.single() else {
        return;
    };
    if rows.is_empty() {
        return;
    }
    if renderer.masks.is_empty() {
        renderer.masks = textures(&mut images);
    }
    let clock = renderer.state.time(now);
    for row in &rows {
        let progress = row.progress(clock);
        if renderer
            .outlines
            .get(&row.id)
            .is_none_or(|(revision, _)| *revision != row.revision)
        {
            renderer
                .outlines
                .insert(row.id, (row.revision, geometry::outline(&ground, row)));
        }
        let outline = &renderer.outlines[&row.id].1;
        let fill = geometry::fill(&ground, row, progress);
        // Native order: body, current fill, then outline. Occupancy style is
        // painted each frame, so hzt's in-list never needs a geometry rebuild.
        for group in outline
            .iter()
            .filter(|g| !g.overlay)
            .chain(fill.iter())
            .chain(outline.iter().filter(|g| g.overlay))
        {
            let Some((rgb, alpha, glow)) = native::paint(row, group.style, progress, now) else {
                continue;
            };
            for (blend, gain) in [(EffectBlend::Alpha, alpha), (EffectBlend::Add, glow)] {
                if gain <= 0. {
                    continue;
                }
                let start = stream.begin();
                stream.verts.extend(group.vertices.iter().map(|v| {
                    benilla_world::particles::buffer::EffectVertex {
                        pos: v.pos,
                        uv: v.uv,
                        color: [rgb[0], rgb[1], rgb[2], v.color[3] * gain],
                    }
                }));
                stream.commit_tris(
                    start,
                    EffectDrawSpec {
                        cam,
                        texture: renderer.masks[group.mask].id(),
                        blend,
                        fog: EffectFog::Off,
                        lighting: EffectLighting::None,
                        anchor: wow_to_bevy(row.position),
                        // Current native ground order: docs/analysis/marker-order-0.117.0.md.
                        bias: 11692.,
                        raster_bias: 32768,
                        raster_slope: 0.,
                        cam_relative: false,
                        no_depth_test: false,
                        main_entity: cam,
                        light: None,
                        clip: None,
                    },
                );
            }
        }
        let columns = geometry::columns(row, progress, now);
        let start = stream.begin();
        stream.verts.extend(columns);
        stream.commit_tris(
            start,
            EffectDrawSpec {
                cam,
                texture: renderer.masks[7].id(),
                blend: EffectBlend::Add,
                fog: EffectFog::Off,
                lighting: EffectLighting::None,
                anchor: wow_to_bevy(row.position),
                bias: 8192.,
                raster_bias: 0,
                raster_slope: 0.,
                cam_relative: false,
                no_depth_test: false,
                main_entity: cam,
                light: None,
                clip: None,
            },
        );
    }
}
