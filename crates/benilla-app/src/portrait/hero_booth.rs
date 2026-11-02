//! The custom menu's `hero` booth, recovered from the selected 0.109.0 EXE.
//!
//! The request feeds the existing dressing-room assembler. The booth consumes its completed
//! revision and uses the production rig, hand grip, riders, camera-facing cards and item effects.
//! It keeps the old bake while asynchronous models/materials load and retries each frame.

use std::collections::HashMap;

use benilla_assets::materials::WowModelMaterial;
use benilla_protocol::CharEnumItem;
use bevy::camera::{visibility::RenderLayers, RenderTarget};
use bevy::ecs::system::SystemParam;
use bevy::prelude::*;
use bevy::render::render_resource::{Buffer, Extent3d};
use bevy::render::renderer::{RenderDevice, RenderQueue};

use super::booth::{
    clear_booth_rig, spawn_booth_effects, spawn_booth_model, BoothBillboardSpec, BoothEffects,
    BoothInstance, BoothMotion, BoothPart, BoothRider, BoothTwins,
};
use super::{
    body_frame, booth_anchors, booth_view_shape, framing::pane_root_scale, light::material_variant,
    wake_booth, Booth, BoothCam, BoothPanes, Booths, DressUpBake, DressUpLook, DressUpPreview,
    GxAspect, PortraitAnchors, VariantLane, HERO_LAYER,
};

const TOKEN: &str = "hero";

/// A fully resolved nineteen-slot menu request, independent of any live player or Lua widget.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct LocalHeroLook {
    pub race: u8,
    pub sex: u8,
    pub skin: u8,
    pub face: u8,
    pub hair_style: u8,
    pub hair_color: u8,
    pub facial_hair: u8,
    pub equipment: [CharEnumItem; 19],
    /// Main hand, off hand and ranged enchant IDs supplied by the embedding game.
    pub weapon_enchants: [u32; 3],
}

#[derive(Resource)]
pub struct LocalHeroPreview {
    pub look: Option<LocalHeroLook>,
    /// Physical dimensions are capped independently. Both zero keeps a live target.
    pub size: UVec2,
    /// Logical pane aspect, independent of capped physical dimensions.
    pub aspect: f32,
    pub yaw: f32,
}

impl Default for LocalHeroPreview {
    fn default() -> Self {
        Self {
            look: None,
            size: UVec2::new(124, 168),
            aspect: 124. / 168.,
            yaw: 0.35,
        }
    }
}

#[derive(Resource, Default)]
pub struct LocalHeroPreviewOutput {
    pub image: Handle<Image>,
    pub ready: bool,
}

#[derive(SystemSet, Clone, Copy, Debug, Hash, PartialEq, Eq)]
pub enum LocalHeroPreviewSet {
    Feed,
    Render,
}

#[derive(Resource, Default)]
pub(crate) struct HeroBoothState {
    active: bool,
    requested: Option<DressUpLook>,
    camera: Option<Entity>,
    size: UVec2,
    revision: Option<u64>,
    anchors: Option<PortraitAnchors>,
    light: Option<Buffer>,
    variants: HashMap<AssetId<WowModelMaterial>, Handle<WowModelMaterial>>,
}

/// The native bridge's appearance request reaches the real shared dress-up builder, after the
/// VM's ordinary dressing-room producer. A withdrawn menu request releases only its own look.
pub(crate) fn feed(
    request: Res<LocalHeroPreview>,
    creation: Option<Res<crate::entities::CharCreate>>,
    mut preview: ResMut<DressUpPreview>,
    mut state: ResMut<HeroBoothState>,
) {
    let look = request.look.and_then(|look| {
        Some(DressUpLook {
            display_id: creation.as_deref()?.0.body_display(look.race, look.sex)?,
            race: look.race,
            sex: look.sex,
            skin: look.skin,
            face: look.face,
            hair_style: look.hair_style,
            hair_color: look.hair_color,
            facial_hair: look.facial_hair,
            equipment: look.equipment,
            weapon_enchants: look.weapon_enchants,
            emblem: None,
        })
    });
    if request.look.is_some() || state.active {
        if preview.look != look {
            preview.look = look;
        }
    }
    state.active = request.look.is_some();
    state.requested = look;
}

#[derive(SystemParam)]
pub(crate) struct HeroRender<'w> {
    images: ResMut<'w, Assets<Image>>,
    materials: ResMut<'w, Assets<WowModelMaterial>>,
    palettes: ResMut<'w, benilla_world::rig_palette::RigPalettes>,
    mirrors: ResMut<'w, benilla_world::rig_palette::RigPaletteMirrors>,
    anim_data: Option<Res<'w, crate::creature_anim::AnimData>>,
    device: Res<'w, RenderDevice>,
    queue: Res<'w, RenderQueue>,
}

pub(crate) fn sync(
    mut commands: Commands,
    request: Res<LocalHeroPreview>,
    bake: Res<DressUpBake>,
    creatures: Option<Res<crate::entities::Creatures>>,
    gx: Res<GxAspect>,
    mut state: ResMut<HeroBoothState>,
    mut output: ResMut<LocalHeroPreviewOutput>,
    mut booths: ResMut<Booths>,
    mut panes: ResMut<BoothPanes>,
    mut render: HeroRender,
    mut cameras: Query<(&mut Transform, &mut Projection, &mut RenderTarget), With<BoothCam>>,
) {
    if request.look.is_none() {
        panes.0.remove(TOKEN);
        if let Some(booth) = booths.0.remove(TOKEN) {
            commands.entity(booth.root).despawn();
        }
        if let Some(camera) = state.camera.take() {
            commands.entity(camera).despawn();
        }
        state.revision = None;
        state.anchors = None;
        state.size = UVec2::ZERO;
        if output.ready || output.image != Handle::default() {
            output.image = Handle::default();
            output.ready = false;
        }
        return;
    }
    // Current140c1763c.. promotes each zero axis to one on creation. A later
    // request skips resize only when both raw axes are zero.
    let size = request.size.min(UVec2::splat(2048)).max(UVec2::ONE);
    if !booths.0.contains_key(TOKEN) {
        let image = render
            .images
            .add(super::new_target_image_sized(size.x, size.y));
        let layers = RenderLayers::layer(HERO_LAYER);
        let root = commands
            .spawn((Transform::IDENTITY, Visibility::Visible, layers.clone()))
            .id();
        let camera = commands
            .spawn((
                booth_view_shape(),
                Camera {
                    order: -50,
                    is_active: false,
                    clear_color: ClearColorConfig::Custom(Color::NONE),
                    ..default()
                },
                RenderTarget::Image(image.clone().into()),
                benilla_world::ffx_glow::FfxGlow::UI_PANE,
                Projection::Perspective(default()),
                Transform::IDENTITY,
                layers.clone(),
                BoothCam(TOKEN.into()),
            ))
            .id();
        booths
            .0
            .insert(TOKEN.into(), Booth::new(layers, root, image.clone()));
        state.camera = Some(camera);
        state.size = size;
        output.image = image;
    }
    let Some(booth) = booths.0.get_mut(TOKEN) else {
        return;
    };
    if request.size != UVec2::ZERO && state.size != size {
        if let Some(image) = render.images.get_mut(&booth.target) {
            image.resize(Extent3d {
                width: size.x,
                height: size.y,
                depth_or_array_layers: 1,
            });
        }
        state.size = size;
        booth.wake = booth.wake.max(super::BOOTH_SETTLE_FRAMES);
    }
    if state.light.is_none() {
        let blob =
            benilla_world::lighting::LightBlob::model([0.7; 3], [0.8, 0.8, 0.64], Vec3::NEG_X)
                .dial(0.4);
        let light = blob.create(&render.device, "hero_booth_light");
        blob.write(&render.queue, &light);
        render.mirrors.0.insert(TOKEN, light.clone());
        state.light = Some(light);
    }
    if bake.look == state.requested && bake.look.is_some() && state.revision != Some(bake.revision)
    {
        if let Some(anchors) = booth_anchors(creatures.as_deref(), Some(bake.display_id)) {
            let light = state.light.as_ref().expect("initialized above").clone();
            let mut ready = true;
            let mut relight = |material: &Handle<WowModelMaterial>| {
                material_variant(
                    &mut state.variants,
                    &light,
                    material,
                    &mut render.materials,
                    VariantLane::World,
                )
                .unwrap_or_else(|| {
                    ready = false;
                    material.clone()
                })
            };
            let parts: Vec<_> = bake
                .parts
                .iter()
                .map(|part| BoothPart {
                    skinned: part.skinned_mesh.clone(),
                    static_mesh: part.static_mesh.clone(),
                    material: relight(&part.material),
                    alpha_anim: part.alpha_anim.clone(),
                    twins: BoothTwins::default(),
                    mat_anim: false,
                })
                .collect();
            let riders: Vec<_> = bake
                .riders
                .iter()
                .map(|part| BoothRider {
                    mesh: part.mesh.clone(),
                    material: relight(&part.material),
                    bone: part.bone,
                    offset: part.offset,
                    twins: BoothTwins::default(),
                    mat_anim: false,
                })
                .collect();
            let billboards: Vec<_> = bake
                .billboards
                .iter()
                .map(|part| BoothBillboardSpec {
                    mesh: part.mesh.clone(),
                    material: relight(&part.material),
                    bone: part.bone,
                    offset: part.offset,
                    kind: part.kind,
                    twins: BoothTwins::default(),
                    mat_anim: false,
                })
                .collect();
            let effects: Vec<_> = bake
                .effects
                .iter()
                .map(|part| BoothEffects {
                    bone: part.bone,
                    offset: part.offset,
                    emitters: part.emitters.clone(),
                    rig: part.rig.clone(),
                })
                .collect();
            if ready {
                let rig = creatures
                    .as_deref()
                    .and_then(|creatures| creatures.display_rig(bake.display_id));
                commands.entity(booth.root).despawn_related::<Children>();
                clear_booth_rig(&mut commands, booth.root);
                let mut posed = spawn_booth_model(
                    &mut commands,
                    &mut render.palettes,
                    booth.root,
                    booth.layer.clone(),
                    &parts,
                    &riders,
                    rig.as_ref().and_then(|rig| {
                        rig.inverse_bindposes
                            .as_ref()
                            .map(|bind| (rig.skeleton, bind, rig.animations))
                    }),
                    render.anim_data.as_deref().map(|data| &data.0),
                    BoothMotion::Loop,
                    bake.grip,
                    &billboards,
                    BoothInstance::default(),
                );
                spawn_booth_effects(
                    &mut commands,
                    &mut posed,
                    &booth.layer,
                    Some(&light),
                    &effects,
                    BoothInstance::default(),
                );
                booth.rigged = posed.rigged();
                posed.finish(&mut commands);
                booth.live = true;
                booth.parked = false;
                wake_booth(
                    booth,
                    &render.materials,
                    parts
                        .iter()
                        .map(|p| &p.material)
                        .chain(riders.iter().map(|p| &p.material))
                        .chain(billboards.iter().map(|p| &p.material)),
                );
                state.anchors = Some(anchors);
                state.revision = Some(bake.revision);
                output.ready = true;
            }
        }
    }
    if let Some(anchors) = &state.anchors {
        let aspect = if request.aspect > 0.0 {
            request.aspect
        } else {
            state.size.x as f32 / state.size.y.max(1) as f32
        };
        let (camera, projection) = body_frame(anchors, aspect);
        if let Some(entity) = state.camera {
            if let Ok((mut transform, mut lens, _)) = cameras.get_mut(entity) {
                *transform = camera;
                *lens = projection;
            } else {
                commands.entity(entity).try_insert((camera, projection));
            }
        }
        commands.entity(booth.root).try_insert(Transform {
            rotation: Quat::from_rotation_y(request.yaw),
            scale: Vec3::splat(pane_root_scale(anchors, gx.0)),
            ..default()
        });
        panes.0.insert(TOKEN.into(), aspect);
    }
}
