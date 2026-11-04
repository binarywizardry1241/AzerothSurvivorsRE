//! Native marker channel consumer; terrain meshes use the real client effect stream.
#[path = "raid_markers/geometry.rs"]
mod geometry;
#[path = "raid_markers/scripted.rs"]
mod scripted;

use azeroth_survivors_re::raid_markers::{self as native, Markers};
use benilla_assets::coords::wow_to_bevy;
use benilla_world::{
    decal::WorldDecal,
    particles::buffer::{
        begin_effect_frame, EffectBlend, EffectDrawSpec, EffectFog, EffectLighting, EffectQuads,
    },
    view::WorldCamera,
};
use bevy::{
    asset::{AssetId, RenderAssetUsages},
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
    scripted: scripted::Markers,
    identity: Option<u64>,
    outlines: HashMap<u64, (u64, Vec<geometry::Group>)>,
    scripted_body: HashMap<(u64, u8), (u64, f32, Vec<geometry::Group>)>,
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
        renderer.scripted = scripted::Markers::default();
        renderer.outlines.clear();
        renderer.scripted_body.clear();
        renderer.identity = identity;
    }
    if identity.is_none() {
        inbox.0.clear();
        return;
    }
    let now = time.elapsed_secs();
    for value in inbox.0.drain(..) {
        if !renderer.scripted.receive(&value, now) {
            renderer.state.receive(&value, now);
        }
    }
    renderer.state.reap(now);
    let scripted_clock = renderer.scripted.update(now);
    let renderer = &mut *renderer;
    renderer
        .scripted_body
        .retain(|key, _| renderer.scripted.parts.iter().any(|row| row.key == *key));
    let rows = renderer.state.rows.clone();
    renderer
        .outlines
        .retain(|id, _| rows.iter().any(|row| row.id == *id));
    let Ok(cam) = cameras.single() else {
        return;
    };
    if rows.is_empty() && renderer.scripted.parts.is_empty() {
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
            draw_group(
                &mut stream,
                cam,
                renderer.masks[group.mask].id(),
                row.position,
                group,
                rgb,
                alpha,
                glow,
                11692.,
                None,
            );
        }
        draw_columns(&mut stream, cam, renderer.masks[7].id(), row, progress, now);
    }
    for row in &renderer.scripted.parts {
        let scale = row.outline_scale(scripted_clock);
        if renderer
            .scripted_body
            .get(&row.key)
            .is_none_or(|(revision, old_scale, _)| *revision != row.revision || *old_scale != scale)
        {
            renderer.scripted_body.insert(
                row.key,
                (
                    row.revision,
                    scale,
                    geometry::scripted_body(&ground, row, scale),
                ),
            );
        }
        let body = &renderer.scripted_body[&row.key].2;
        let fill = geometry::scripted_fill(&ground, row, scripted_clock);
        let field_uv = row.field_uv();
        for group in body
            .iter()
            .filter(|g| !g.overlay)
            .chain(&fill)
            .chain(body.iter().filter(|g| g.overlay))
        {
            let (rgb, alpha, glow) = row.paint(group.style, now);
            draw_group(
                &mut stream,
                cam,
                renderer.masks[group.mask].id(),
                row.position,
                group,
                rgb,
                alpha,
                glow,
                13192.,
                field_uv,
            );
        }
        if let Some(tower) = row.tower_marker() {
            draw_columns(
                &mut stream,
                cam,
                renderer.masks[7].id(),
                &tower,
                row.progress(),
                now,
            );
        }
    }
}

fn draw_columns(
    stream: &mut EffectQuads,
    cam: Entity,
    texture: AssetId<Image>,
    row: &native::Marker,
    progress: f32,
    now: f32,
) {
    let columns = geometry::columns(row, progress, now);
    if columns.is_empty() {
        return;
    }
    let start = stream.begin();
    stream.verts.extend(columns);
    stream.commit_tris(
        start,
        EffectDrawSpec {
            cam,
            texture,
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

fn draw_group(
    stream: &mut EffectQuads,
    cam: Entity,
    texture: AssetId<Image>,
    position: [f32; 3],
    group: &geometry::Group,
    rgb: [f32; 3],
    alpha: f32,
    glow: f32,
    bias: f32,
    field_uv: Option<([f32; 2], f32)>,
) {
    for (blend, gain) in [(EffectBlend::Alpha, alpha), (EffectBlend::Add, glow)] {
        if gain <= 0. {
            continue;
        }
        let start = stream.begin();
        stream.verts.extend(group.vertices.iter().map(|v| {
            let uv = field_uv.map_or(v.uv, |(center, scale)| {
                [
                    (-v.pos[2] - center[0]) * scale + 0.5,
                    (-v.pos[0] - center[1]) * scale + 0.5,
                ]
            });
            benilla_world::particles::buffer::EffectVertex {
                pos: v.pos,
                uv,
                color: [rgb[0], rgb[1], rgb[2], v.color[3] * gain],
            }
        }));
        stream.commit_tris(
            start,
            EffectDrawSpec {
                cam,
                texture,
                blend,
                fog: EffectFog::Off,
                lighting: EffectLighting::None,
                anchor: wow_to_bevy(position),
                bias,
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
