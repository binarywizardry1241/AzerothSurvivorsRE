//! Menu character renderer over the user's MPQ data, on its own render layer.
//!
//! The current-target bridge, framing and outfit evidence is in
//! docs/analysis/hero-preview-0.109.0.md. Renderer/material parity remains open.

mod framing;

use std::collections::HashMap;

use benilla_assets::materials::WowModelMaterial;
use benilla_formats::{
    CharCreateCatalog, CharSections, CharSkinSlot, CharacterGeosets, CreatureCatalog, EquipGeosets,
    ItemDisplay, ItemDisplayCatalog, ModelAnimation, RenderSubmesh, Skeleton,
};
use benilla_world::{
    lighting::LightBlob,
    model_render::{model_material, MaterialCache, ShadeSel},
};
use bevy::asset::RenderAssetUsages;
use bevy::camera::{visibility::RenderLayers, RenderTarget};
use bevy::core_pipeline::tonemapping::Tonemapping;
use bevy::mesh::{Indices, PrimitiveTopology};
use bevy::prelude::*;
use bevy::render::render_resource::{
    Buffer, Extent3d, TextureDimension, TextureFormat, TextureUsages,
};
use bevy::render::renderer::{RenderDevice, RenderQueue};

const LAYER: usize = 29;
const WIDTH: u32 = 124;
const HEIGHT: u32 = 168;

pub const PICKER_YAW: f32 = 0.35;
pub const CHARACTER_YAW: f32 = 0.61;
pub const TURN_RADIANS_PER_SECOND: f32 = 2.4;
pub const DRAG_RADIANS_PER_LOGICAL_PIXEL: f32 = 0.012;
pub const ARMORY_ASPECT: f32 = 100.0 / 122.0;

pub use benilla_formats::StartOutfitItem as HeroGearItem;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct HeroLook {
    pub race: u8,
    pub sex: u8,
    pub class: u8,
    pub skin: u8,
    pub face: u8,
    pub hair_style: u8,
    pub hair_color: u8,
    pub facial_hair: u8,
}

impl Default for HeroLook {
    fn default() -> Self {
        Self {
            race: 1,
            sex: 0,
            class: 1,
            skin: 0,
            face: 0,
            hair_style: 0,
            hair_color: 0,
            facial_hair: 0,
        }
    }
}

#[derive(Resource)]
pub struct HeroPreview {
    pub look: HeroLook,
    /// Native paperdoll slots0..18. None keeps the baseline; display_id0 hides that lane.
    pub equipment: [Option<HeroGearItem>; 19],
    /// Native main hand, off hand and ranged enchant IDs, after star gates.
    pub weapon_enchants: [u32; 3],
    /// Actual physical pixels of the menu's image pane, capped at2048 per native request.
    pub size: UVec2,
    /// Logical pane width/max(height,1), independent of capped physical pixels.
    pub aspect: f32,
    /// Native GxAspect, fed by the primary Window's logical width/height.
    pub display_aspect: f32,
    /// Facing in radians; increasing yaw turns the model around its vertical axis.
    pub yaw: f32,
    /// Picker uses its native fixed facing without changing the Character facing.
    pub fixed_yaw: bool,
    pub visible: bool,
}

impl Default for HeroPreview {
    fn default() -> Self {
        Self {
            look: HeroLook::default(),
            equipment: [None; 19],
            weapon_enchants: [0; 3],
            size: UVec2::new(WIDTH, HEIGHT),
            aspect: WIDTH as f32 / HEIGHT as f32,
            display_aspect: 4.0 / 3.0,
            yaw: CHARACTER_YAW,
            fixed_yaw: true,
            visible: true,
        }
    }
}

#[derive(Resource, Default)]
pub struct HeroPreviewOutput {
    /// Transparent render target, available after Startup. Display with `ImageNode::new`.
    pub image: Handle<Image>,
    pub status: String,
}

/// A live run uses the selected hero's existing MPQ body/outfit in world space.
/// Menu framing remains independent of this placement.
#[derive(Clone, Copy, Debug)]
pub struct HeroWorldPose {
    pub position_wow: [f32; 3],
    pub facing: f32,
    pub moving: bool,
}

#[derive(Resource, Default)]
pub struct HeroWorldRender {
    pub pose: Option<HeroWorldPose>,
}

pub struct HeroPreviewPlugin;

#[derive(SystemSet, Debug, Hash, PartialEq, Eq, Clone)]
pub struct HeroPreviewSet;

impl Plugin for HeroPreviewPlugin {
    fn build(&self, app: &mut App) {
        // The menu world installs this shared material first. Keep the preview
        // usable in isolation without adding a duplicate plugin to the app.
        if !app.is_plugin_added::<bevy::pbr::MaterialPlugin<WowModelMaterial>>() {
            benilla_assets::materials::register_shaders(app);
            app.add_plugins(bevy::pbr::MaterialPlugin::<WowModelMaterial>::default());
        }
        app.init_resource::<HeroPreview>()
            .init_resource::<HeroPreviewOutput>()
            .init_resource::<HeroWorldRender>()
            .init_resource::<PreviewState>();
        if app
            .world()
            .contains_resource::<benilla_app::local_client::LocalStockFrontend>()
        {
            return;
        }
        app.add_systems(Startup, setup_preview)
            .add_systems(
                Update,
                feed_engine_preview
                    .after(crate::menu::sync_preview)
                    .before(benilla_app::local_client::LocalHeroPreviewSet::Feed),
            )
            .add_systems(
                Update,
                copy_engine_preview.after(benilla_app::local_client::LocalHeroPreviewSet::Render),
            )
            .add_systems(
                Update,
                (rebuild_preview, reframe_preview, animate_preview)
                    .chain()
                    .in_set(HeroPreviewSet),
            );
    }
}

struct PreviewData {
    chain: benilla_formats::Chain,
    creation: CharCreateCatalog,
    creatures: CreatureCatalog,
    geosets: CharacterGeosets,
    sections: CharSections,
    items: ItemDisplayCatalog,
    native: crate::armory::ArmoryCatalog,
}

impl PreviewData {
    fn load() -> Result<Self, String> {
        let directory = crate::assets::data_directory().ok_or("No MPQ data directory")?;
        let mut chain = benilla_formats::Chain::open(&directory).map_err(|e| e.to_string())?;
        Ok(Self {
            creation: CharCreateCatalog::load(&mut chain).map_err(|e| e.to_string())?,
            creatures: benilla_formats::load_creature_catalog(&mut chain)
                .map_err(|e| e.to_string())?,
            geosets: CharacterGeosets::load(&mut chain).map_err(|e| e.to_string())?,
            sections: CharSections::load(&mut chain).map_err(|e| e.to_string())?,
            items: benilla_formats::load_item_display_catalog(&mut chain)
                .map_err(|e| e.to_string())?,
            native: crate::armory::ArmoryCatalog::embedded(),
            chain,
        })
    }
}

/// Resolve every native picker race/class pair and both sexes without opening a window.
/// This checks real meshes, appearance composites, sockets and every referenced texture; it
/// establishes asset coverage, not native render or interaction parity.
pub fn check_assets() -> Result<(), String> {
    let mut data = PreviewData::load()?;
    let mut images = Assets::<Image>::default();
    let mut owned = Vec::new();
    let mut checked = 0;
    let mut failures = Vec::new();
    for class in crate::save::CLASS_IDS {
        for &race in crate::save::allowed_races(class) {
            for sex in 0..=1 {
                let look = HeroLook {
                    race,
                    sex,
                    class,
                    ..default()
                };
                let label = format!("race {race}, sex {sex}, class {class}");
                match build_character(&mut data, look, &[None; 19], &mut images, &mut owned) {
                    Ok(built) => {
                        let mut errors = built.warnings;
                        if built.parts.is_empty() || built.skeleton.bones.is_empty() {
                            errors.push("Body mesh or skeleton is empty".into());
                        }
                        if built.animation.is_none() {
                            errors.push("No Stand animation".into());
                        }
                        for (part, attachment) in &built.parts {
                            if part.positions.len() != part.normals.len()
                                || part.positions.len() != part.uvs.len()
                                || part
                                    .indices
                                    .iter()
                                    .any(|index| *index as usize >= part.positions.len())
                            {
                                errors.push(format!(
                                    "Invalid geometry for geoset {}",
                                    part.geoset_id
                                ));
                            }
                            if attachment.is_none()
                                && (part.joints.len() != part.positions.len()
                                    || part.weights.len() != part.positions.len())
                            {
                                errors.push(format!(
                                    "Invalid skin weights for geoset {}",
                                    part.geoset_id
                                ));
                            }
                            if let Some(slot) = part.char_slot {
                                if !built.textures.contains_key(&slot) {
                                    errors.push(format!(
                                        "Unresolved character texture slot {slot:?}"
                                    ));
                                }
                            } else if let Some(path) = &part.texture {
                                if let Err(error) =
                                    benilla_formats::read_texture_mip_chain(&mut data.chain, path)
                                {
                                    errors.push(format!("{path}: {error}"));
                                }
                            }
                        }
                        errors.sort();
                        errors.dedup();
                        if errors.is_empty() {
                            checked += 1;
                        } else {
                            failures.push(format!("{label}: {}", errors.join("; ")));
                        }
                    }
                    Err(error) => failures.push(format!("{label}: {error}")),
                }
                for image in owned.drain(..) {
                    images.remove(image.id());
                }
            }
        }
    }
    if failures.is_empty() {
        println!("Character preview data OK: {checked} race/sex/class looks; actual body meshes, Stand animations, geosets, composed skins and starting equipment assets resolved.");
        Ok(())
    } else {
        Err(format!(
            "{checked} looks passed; {} failed:\n{}",
            failures.len(),
            failures.join("\n")
        ))
    }
}

#[derive(Resource, Default)]
struct PreviewState {
    data: Option<PreviewData>,
    last: Option<HeroLook>,
    last_equipment: [Option<HeroGearItem>; 19],
    last_size: UVec2,
    last_aspect: Option<f32>,
    frame: Option<framing::BodyFrame>,
    root: Option<Entity>,
    camera: Option<Entity>,
    meshes: Vec<Handle<Mesh>>,
    materials: Vec<Handle<WowModelMaterial>>,
    light: Option<Buffer>,
    textures: Vec<Handle<Image>>,
    skeleton: Skeleton,
    animation: Option<ModelAnimation>,
    run_animation: Option<ModelAnimation>,
    global_bones: Vec<benilla_formats::GlobalSeqBone>,
    grip: Vec<(u16, [f32; 4])>,
    elapsed: f32,
}

#[derive(Component)]
struct PreviewMesh {
    mesh: Handle<Mesh>,
    positions: Vec<[f32; 3]>,
    normals: Vec<[f32; 3]>,
    joints: Vec<[u16; 4]>,
    weights: Vec<[f32; 4]>,
    /// An equipment model is rigid on the body's attachment bone.
    attachment: Option<(u16, Vec3)>,
}

fn setup_preview(
    mut commands: Commands,
    mut images: ResMut<Assets<Image>>,
    mut output: ResMut<HeroPreviewOutput>,
    mut state: ResMut<PreviewState>,
    device: Res<RenderDevice>,
    queue: Res<RenderQueue>,
) {
    let mut target = Image::new_fill(
        Extent3d {
            width: WIDTH,
            height: HEIGHT,
            depth_or_array_layers: 1,
        },
        TextureDimension::D2,
        &[0; 8],
        TextureFormat::Rgba16Float,
        RenderAssetUsages::default(),
    );
    target.texture_descriptor.usage |= TextureUsages::RENDER_ATTACHMENT;
    let target = images.add(target);
    output.image = target.clone();
    state.camera = Some(
        commands
            .spawn((
                Camera3d::default(),
                Camera {
                    order: -10,
                    is_active: false,
                    clear_color: ClearColorConfig::Custom(Color::NONE),
                    ..default()
                },
                RenderTarget::Image(target.into()),
                Projection::Perspective(PerspectiveProjection {
                    fov: 28.0_f32.to_radians(),
                    aspect_ratio: WIDTH as f32 / HEIGHT as f32,
                    near: 0.01,
                    far: 100.0,
                    near_clip_plane: Vec4::new(0.0, 0.0, -1.0, -0.01),
                }),
                Transform::from_xyz(1.0, 1.5, -6.0).looking_at(Vec3::Y, Vec3::Y),
                Tonemapping::None,
                bevy::render::view::Hdr,
                Msaa::Off,
                crate::menu_gamma::UiGammaLane::model(),
                bevy::light::cluster::ClusterConfig::None,
                RenderLayers::layer(LAYER),
            ))
            .id(),
    );
    // Current 1408245f9..1408246cf constructs the pane's plain model light,
    // with no prop probe. Its material twins keep the entity shade lane
    // (14079da50 -> 1407db730 lane0), rather than selecting the glue rig lane.
    let blob = LightBlob::model([0.7; 3], [0.8, 0.8, 0.64], Vec3::NEG_X).dial(0.4);
    let buffer = blob.create(&device, "main_menu_character_light");
    blob.write(&queue, &buffer);
    state.light = Some(buffer);
    match PreviewData::load() {
        Ok(data) => {
            state.data = Some(data);
            output.status = "Character assets loaded".into();
        }
        Err(error) => {
            output.status = format!("Character preview unavailable: {error}");
            warn!("{}", output.status);
        }
    }
}

struct BuiltPreview {
    parts: Vec<(RenderSubmesh, Option<(u16, Vec3)>)>,
    skeleton: Skeleton,
    animation: Option<ModelAnimation>,
    run_animation: Option<ModelAnimation>,
    global_bones: Vec<benilla_formats::GlobalSeqBone>,
    grip: Vec<(u16, [f32; 4])>,
    textures: HashMap<CharSkinSlot, Handle<Image>>,
    frame: framing::BodyFrame,
    warnings: Vec<String>,
}

#[derive(Clone, Copy)]
struct WornItem {
    display_id: u32,
    inv_type: u8,
    slot: u8,
}

/// The shared nineteen-slot request resolution, also used by the standalone asset checker.
fn resolve_outfit(
    native: &crate::armory::ArmoryCatalog,
    look: HeroLook,
    equipment: &[Option<HeroGearItem>; 19],
) -> Vec<WornItem> {
    // Current1459a3e80 baseline is independent of sex. Complete menu requests
    // already carry native1459a4710 composition and140161442 ranged suppression.
    let mut outfit: Vec<_> = native
        .starter(look.race, look.class)
        .into_iter()
        .map(|item| WornItem {
            display_id: item.display_id,
            inv_type: item.inventory_type as u8,
            slot: item.slot_id,
        })
        .collect();
    for (slot, replacement) in equipment.iter().enumerate() {
        let Some(replacement) = replacement else {
            continue;
        };
        outfit.retain(|item| usize::from(item.slot) != slot);
        if replacement.display_id != 0 {
            outfit.push(WornItem {
                display_id: replacement.display_id,
                inv_type: replacement.inv_type,
                slot: slot as u8,
            });
        }
    }
    outfit
}

fn feed_engine_preview(
    preview: Res<HeroPreview>,
    world: Res<HeroWorldRender>,
    native: Res<crate::armory::ArmoryCatalog>,
    mut request: ResMut<benilla_app::local_client::LocalHeroPreview>,
) {
    // Current1400fd906 leaves the previous request intact when the visible
    // custom pane has no nonzero physical extent. Exit/world ownership still
    // withdraws the request below.
    if preview.visible && world.pose.is_none() && (preview.size.x == 0 || preview.size.y == 0) {
        return;
    }
    let look = (preview.visible && world.pose.is_none()).then(|| {
        let mut equipment = [benilla_app::local_client::LocalHeroEquipment::default(); 19];
        for item in resolve_outfit(&native, preview.look, &preview.equipment) {
            equipment[usize::from(item.slot)] = benilla_app::local_client::LocalHeroEquipment {
                display_id: item.display_id,
                inventory_type: item.inv_type,
            };
        }
        let look = preview.look;
        benilla_app::local_client::LocalHeroLook {
            race: look.race,
            sex: look.sex,
            skin: look.skin,
            face: look.face,
            hair_style: look.hair_style,
            hair_color: look.hair_color,
            facial_hair: look.facial_hair,
            equipment,
            weapon_enchants: preview.weapon_enchants,
        }
    });
    let yaw = if preview.fixed_yaw {
        PICKER_YAW
    } else {
        preview.yaw
    };
    if request.look != look {
        request.look = look;
    }
    if request.size != preview.size {
        request.size = preview.size;
    }
    if request.aspect != preview.aspect {
        request.aspect = preview.aspect;
    }
    if request.yaw != yaw {
        request.yaw = yaw;
    }
}

fn copy_engine_preview(
    preview: Res<HeroPreview>,
    world: Res<HeroWorldRender>,
    engine: Res<benilla_app::local_client::LocalHeroPreviewOutput>,
    mut output: ResMut<HeroPreviewOutput>,
) {
    if !preview.visible || world.pose.is_some() {
        return;
    }
    if output.image != engine.image {
        output.image = engine.image.clone();
    }
    let status = if engine.ready {
        "Character assets loaded"
    } else {
        "Character assets loading"
    };
    if output.status != status {
        output.status = status.into();
    }
}

fn build_character(
    data: &mut PreviewData,
    look: HeroLook,
    equipment: &[Option<HeroGearItem>; 19],
    images: &mut Assets<Image>,
    owned_textures: &mut Vec<Handle<Image>>,
) -> Result<BuiltPreview, String> {
    let display = data
        .creation
        .body_display(look.race, look.sex)
        .ok_or("Race/sex has no body display")?;
    let model = data
        .creatures
        .model(display)
        .ok_or("Body display has no creature model")?;
    let path = normalize_model_path(&model.model_path);
    let bytes = data.chain.read(&path).map_err(|e| e.to_string())?;
    let skeleton = benilla_formats::parse_m2_skeleton(&bytes).map_err(|e| e.to_string())?;
    let frame = framing::BodyFrame::from_m2(&bytes)?;
    let mut animation = None;
    let mut run_animation = None;
    for clip in benilla_formats::parse_m2_animations(&bytes) {
        match clip.anim_id {
            0 if animation.is_none() => animation = Some(clip),
            5 if run_animation.is_none() => run_animation = Some(clip),
            _ => {}
        }
    }
    let global_bones = benilla_formats::parse_m2_global_sequence_bones(&bytes);
    let mut parts =
        benilla_formats::load_m2_mesh(&mut data.chain, &path).map_err(|e| e.to_string())?;

    let outfit = resolve_outfit(&data.native, look, equipment);
    let hands = [
        outfit
            .iter()
            .any(|item| item.slot == 15 || (item.slot == 17 && item.inv_type != 15)),
        outfit.iter().any(|item| {
            (item.slot == 16 && item.inv_type != 14) || (item.slot == 17 && item.inv_type == 15)
        }),
    ];
    let finger_bones: Vec<_> = (0..skeleton.bones.len())
        .filter(|&index| {
            let mut index = index;
            for _ in 0..=skeleton.bones.len() {
                let Some(bone) = skeleton.bones.get(index) else {
                    break;
                };
                if (hands[0] && (8..=12).contains(&bone.key_bone))
                    || (hands[1] && (13..=17).contains(&bone.key_bone))
                {
                    return true;
                }
                let Ok(parent) = usize::try_from(bone.parent) else {
                    break;
                };
                index = parent;
            }
            false
        })
        .map(|index| index as u16)
        .collect();
    let grip = benilla_formats::hand_grip_finger_poses(&bytes, &finger_bones);
    let mut body_slots = [None; 8];
    let mut helm = None;
    let mut cloak = None;
    for item in &outfit {
        let display = data.items.get(item.display_id);
        match item.inv_type {
            1 => helm = display,
            4 => body_slots[0] = display,
            5 | 20 => body_slots[1] = display,
            6 => body_slots[2] = display,
            7 => body_slots[3] = display,
            8 => body_slots[4] = display,
            9 => body_slots[5] = display,
            10 => body_slots[6] = display,
            19 => body_slots[7] = display,
            16 => cloak = display,
            _ => {}
        }
    }
    let equip_geosets = EquipGeosets {
        bodyslots: body_slots.map(|item| item.map(|item| item.geoset_groups)),
        cloak: cloak.map(|item| item.geoset_groups[0]),
        helm_vis: helm.and_then(ItemDisplay::worn_helm_vis),
        forearm_dressed: benilla_formats::forearm_dressed(&body_slots),
        ..default()
    };
    let visible = data.geosets.visible_geosets(
        look.race,
        look.sex,
        look.hair_style,
        look.facial_hair,
        &equip_geosets,
    );
    parts.retain(|part| visible.contains(&part.geoset_id));

    let mut textures = HashMap::new();
    let body = data
        .sections
        .composite_body(
            &mut data.chain,
            look.race,
            look.sex,
            look.skin,
            look.face,
            look.facial_hair,
            look.hair_style,
            look.hair_color,
            body_slots,
            None,
            false,
        )
        .map_err(|e| e.to_string())?
        .ok_or("Appearance has no composited body skin")?;
    let body = add_texture(body, images, owned_textures)?;
    textures.insert(CharSkinSlot::Body, body);
    for (slot, path) in [
        (
            CharSkinSlot::Hair,
            data.sections
                .hair_mesh_texture(look.race, look.sex, look.hair_style, look.hair_color),
        ),
        (
            CharSkinSlot::SkinExtra,
            data.sections
                .skin_extra_texture(look.race, look.sex, look.skin),
        ),
    ] {
        // The engine binds an auxiliary skin only when a visible M2 batch uses that slot
        // (benilla-app/entities/attach/char_skin.rs). Bald Tauren females have no hair
        // batch, although CharSections names a Hair00_00 sheet absent from the MPQs.
        if !parts.iter().any(|part| part.char_slot == Some(slot)) {
            continue;
        }
        if let Some(path) = path {
            let texture = benilla_formats::read_texture_mip_chain(&mut data.chain, path)
                .map_err(|e| e.to_string())?;
            textures.insert(slot, add_texture(texture, images, owned_textures)?);
        }
    }
    if let Some(path) = cloak.and_then(|cloak| cloak.model_texture[0].as_ref()) {
        let path = format!("Item\\ObjectComponents\\Cape\\{path}.blp");
        let texture = benilla_formats::read_texture_mip_chain(&mut data.chain, &path)
            .map_err(|e| e.to_string())?;
        textures.insert(
            CharSkinSlot::Object,
            add_texture(texture, images, owned_textures)?,
        );
    }

    // The base cloak geoset can remain enabled with no equipped cloak. Its unbound runtime
    // texture is intentional; omit it instead of showing a white fallback cape.
    if cloak.is_none() {
        parts.retain(|part| part.char_slot != Some(CharSkinSlot::Object));
    }
    let attachments = benilla_formats::parse_m2_attachments(&bytes).map_err(|e| e.to_string())?;
    let mut parts: Vec<_> = parts.into_iter().map(|part| (part, None)).collect();
    let mut warnings = Vec::new();
    for item in &outfit {
        let Some(display) = data.items.get(item.display_id) else {
            continue;
        };
        let models: &[(&str, usize, u16)] = match (item.inv_type, item.slot) {
            (1, _) => &[("Head", 0, 11)],
            (3, _) => &[("Shoulder", 0, 6), ("Shoulder", 1, 5)],
            (14, _) => &[("Shield", 0, 0)],
            (13, 16) | (22 | 23, _) | (15, 17) => &[("Weapon", 0, 2)],
            (13 | 17 | 21, _) | (25 | 26, 17) => &[("Weapon", 0, 1)],
            _ => &[],
        };
        for &(directory, column, attachment) in models {
            let Some(model) = display.model[column].as_ref() else {
                continue;
            };
            let Some(attachment) = attachments.iter().find(|point| point.id == attachment) else {
                warnings.push(format!("Missing attachment {attachment}"));
                continue;
            };
            let model = if item.inv_type == 1 {
                const RACES: [&str; 8] = ["Hu", "Or", "Dw", "Ni", "Sc", "Ta", "Gn", "Tr"];
                let race = RACES[usize::from(look.race.clamp(1, 8) - 1)];
                let sex = if look.sex == 1 { 'F' } else { 'M' };
                format!("{}_{race}{sex}.m2", model.trim_end_matches(".m2"))
            } else {
                model.clone()
            };
            let directory = format!("Item\\ObjectComponents\\{directory}");
            let path = format!("{directory}\\{model}");
            match benilla_formats::load_m2_mesh(&mut data.chain, &path) {
                Ok(item_parts) => {
                    for mut part in item_parts {
                        if part.char_slot == Some(CharSkinSlot::Object) {
                            part.char_slot = None;
                            part.texture = display.model_texture[column]
                                .as_ref()
                                .map(|texture| format!("{directory}\\{texture}.blp"));
                        }
                        parts.push((
                            part,
                            Some((attachment.bone, Vec3::from_array(attachment.position))),
                        ));
                    }
                }
                Err(error) => warnings.push(format!("{path}: {error}")),
            }
        }
    }
    Ok(BuiltPreview {
        parts,
        skeleton,
        animation,
        run_animation,
        global_bones,
        grip,
        textures,
        frame,
        warnings,
    })
}

fn normalize_model_path(path: &str) -> String {
    let path = path.to_ascii_lowercase();
    let stem = path
        .strip_suffix(".mdx")
        .or_else(|| path.strip_suffix(".mdl"));
    stem.map_or_else(|| path.clone(), |stem| format!("{stem}.m2"))
}

fn add_texture(
    texture: benilla_formats::BlpMipChain,
    images: &mut Assets<Image>,
    owned: &mut Vec<Handle<Image>>,
) -> Result<Handle<Image>, String> {
    let rgba = texture
        .mips
        .into_iter()
        .next()
        .ok_or("Texture has no pixels")?;
    let handle = images.add(Image::new(
        Extent3d {
            width: texture.width,
            height: texture.height,
            depth_or_array_layers: 1,
        },
        TextureDimension::D2,
        rgba,
        TextureFormat::Rgba8Unorm,
        RenderAssetUsages::default(),
    ));
    owned.push(handle.clone());
    Ok(handle)
}

fn rebuild_preview(
    mut commands: Commands,
    preview: Res<HeroPreview>,
    world: Res<HeroWorldRender>,
    mut output: ResMut<HeroPreviewOutput>,
    mut state: ResMut<PreviewState>,
    mut meshes: ResMut<Assets<Mesh>>,
    mut materials: ResMut<Assets<WowModelMaterial>>,
    mut images: ResMut<Assets<Image>>,
) {
    // Menu characters are rendered by the real streamed hero booth. This
    // isolated mesh path is retained only for the existing world adapter.
    if world.pose.is_none() {
        if state.root.is_some() {
            release_character(
                &mut commands,
                &mut state,
                &mut meshes,
                &mut materials,
                &mut images,
            );
        }
        state.last = None;
        return;
    }
    // Native setter 1407a1f50 caps each physical axis independently, preserving
    // zero. Bridge 140817c20 skips a resize while either axis is not laid out.
    let size = preview.size.min(UVec2::splat(2048));
    if size.x != 0 && size.y != 0 && state.last_size != size {
        if let Some(image) = images.get_mut(&output.image) {
            image.resize(Extent3d {
                width: size.x,
                height: size.y,
                depth_or_array_layers: 1,
            });
        }
        state.last_size = size;
    }
    if state.data.is_none()
        || (state.last == Some(preview.look) && state.last_equipment == preview.equipment)
    {
        return;
    }
    state.last = Some(preview.look);
    state.last_equipment = preview.equipment;
    release_character(
        &mut commands,
        &mut state,
        &mut meshes,
        &mut materials,
        &mut images,
    );
    // Temporarily move the data out to split the data/catalog and asset ownership borrows.
    let mut data = state.data.take().expect("checked above");
    let built = build_character(
        &mut data,
        preview.look,
        &preview.equipment,
        &mut images,
        &mut state.textures,
    );
    state.data = Some(data);
    let built = match built {
        Ok(built) => built,
        Err(error) => {
            output.status = format!("Character preview unavailable: {error}");
            warn!("{}", output.status);
            return;
        }
    };
    state.skeleton = built.skeleton;
    state.animation = built.animation;
    state.run_animation = built.run_animation;
    state.global_bones = built.global_bones;
    state.grip = built.grip;
    state.frame = Some(built.frame);
    let root = commands
        .spawn((
            Transform::from_scale(Vec3::splat(built.frame.root_scale(preview.display_aspect))),
            Visibility::Visible,
        ))
        .id();
    state.root = Some(root);
    let mut texture_cache = HashMap::<String, Handle<Image>>::new();
    let mut missing_textures = Vec::new();
    let light = state
        .light
        .clone()
        .expect("preview light initialized at Startup");
    let mut material_cache = MaterialCache::default();
    for (part, attachment) in built.parts {
        let texture = if let Some(slot) = part.char_slot {
            built.textures.get(&slot).cloned()
        } else if let Some(path) = part.texture.as_ref() {
            if let Some(texture) = texture_cache.get(path) {
                Some(texture.clone())
            } else {
                let data = state.data.as_mut().expect("data restored above");
                match benilla_formats::read_texture_mip_chain(&mut data.chain, path) {
                    Ok(texture) => match add_texture(texture, &mut images, &mut state.textures) {
                        Ok(texture) => {
                            texture_cache.insert(path.clone(), texture.clone());
                            Some(texture)
                        }
                        Err(error) => {
                            missing_textures.push(format!("{path}: {error}"));
                            None
                        }
                    },
                    Err(error) => {
                        missing_textures.push(format!("{path}: {error}"));
                        None
                    }
                }
            }
        } else {
            None
        };
        // An unresolved runtime texture must not turn into a white substitute body/weapon.
        if (part.char_slot.is_some() || part.texture.is_some()) && texture.is_none() {
            continue;
        }
        let material = model_material(
            &mut material_cache,
            &mut materials,
            texture,
            part.blend,
            part.two_sided,
            false,
            false,
            part.emissive,
            part.additive,
            false,
            part.no_depth_write,
            part.no_depth_test,
            part.fog_policy,
            part.env_map,
            None,
            Some(part.combine),
            ShadeSel::Lit,
            part.section.unwrap_or(0),
            None,
            None,
            None,
            None,
            false,
            false,
            &light,
            None,
        );
        // The full engine realizes visible materials in a separate world sweep. This isolated
        // menu builds only its visible character, so realize the public builder's result now.
        benilla_world::model_render::lazy::realize(&mut materials, material.id());
        state.materials.push(material.clone());
        let mut mesh = Mesh::new(
            PrimitiveTopology::TriangleList,
            RenderAssetUsages::default(),
        );
        mesh.insert_attribute(
            Mesh::ATTRIBUTE_POSITION,
            part.positions
                .iter()
                .map(|position| wow_to_bevy(Vec3::from_array(*position)).to_array())
                .collect::<Vec<_>>(),
        );
        mesh.insert_attribute(
            Mesh::ATTRIBUTE_NORMAL,
            part.normals
                .iter()
                .map(|normal| wow_to_bevy(Vec3::from_array(*normal)).to_array())
                .collect::<Vec<_>>(),
        );
        mesh.insert_attribute(Mesh::ATTRIBUTE_UV_0, part.uvs);
        if !part.vertex_colors.is_empty() {
            mesh.insert_attribute(Mesh::ATTRIBUTE_COLOR, part.vertex_colors);
        }
        mesh.insert_indices(Indices::U32(part.indices));
        let mesh = meshes.add(mesh);
        state.meshes.push(mesh.clone());
        commands.entity(root).with_child((
            Mesh3d(mesh.clone()),
            MeshMaterial3d(material),
            RenderLayers::layer(LAYER),
            // CPU skinning can move beyond the bind-pose AABB.
            bevy::camera::visibility::NoFrustumCulling,
            Transform::default(),
            PreviewMesh {
                mesh,
                positions: part.positions,
                normals: part.normals,
                joints: part.joints,
                weights: part.weights,
                attachment,
            },
        ));
    }
    let warnings: Vec<_> = built.warnings.into_iter().chain(missing_textures).collect();
    output.status = if warnings.is_empty() {
        format!(
            "Race {} · class {} · 3D character",
            preview.look.race, preview.look.class
        )
    } else {
        warn!("Character preview incomplete: {}", warnings.join("; "));
        format!("3D character · {} asset warning(s)", warnings.len())
    };
    info!("{}", output.status);
}

fn release_character(
    commands: &mut Commands,
    state: &mut PreviewState,
    meshes: &mut Assets<Mesh>,
    materials: &mut Assets<WowModelMaterial>,
    images: &mut Assets<Image>,
) {
    if let Some(root) = state.root.take() {
        commands.entity(root).despawn();
    }
    for mesh in state.meshes.drain(..) {
        meshes.remove(mesh.id());
    }
    for material in state.materials.drain(..) {
        materials.remove(material.id());
    }
    for texture in state.textures.drain(..) {
        images.remove(texture.id());
    }
    state.frame = None;
    state.last_aspect = None;
    state.elapsed = 0.0;
}

fn reframe_preview(
    preview: Res<HeroPreview>,
    world: Res<HeroWorldRender>,
    mut state: ResMut<PreviewState>,
    mut cameras: Query<(&mut Camera, &mut Transform, &mut Projection), Without<PreviewMesh>>,
) {
    let Some((mut camera, mut transform, mut projection)) =
        state.camera.and_then(|entity| cameras.get_mut(entity).ok())
    else {
        return;
    };
    camera.is_active = preview.visible && world.pose.is_none() && state.root.is_some();
    let Some(frame) = state.frame else {
        return;
    };
    if state.last_aspect != Some(preview.aspect) {
        let (pose, lens) = frame.pose(preview.aspect);
        *transform = pose;
        *projection = lens;
        state.last_aspect = Some(preview.aspect);
    }
}

fn wow_to_bevy(point: Vec3) -> Vec3 {
    Vec3::new(-point.y, point.z, -point.x)
}

fn animate_preview(
    time: Res<Time>,
    preview: Res<HeroPreview>,
    world: Res<HeroWorldRender>,
    mut state: ResMut<PreviewState>,
    mut parts: Query<(&PreviewMesh, &mut RenderLayers)>,
    mut roots: Query<&mut Transform, Without<PreviewMesh>>,
    mut meshes: ResMut<Assets<Mesh>>,
    light: Option<Res<benilla_world::lighting::SharedLightBuffer>>,
    mut materials: ResMut<Assets<WowModelMaterial>>,
) {
    if (!preview.visible && world.pose.is_none()) || state.root.is_none() {
        return;
    }
    state.elapsed += time.delta_secs();
    let light = if world.pose.is_some() {
        light.as_deref().map(|light| &light.0)
    } else {
        state.light.as_ref()
    };
    if let Some(light) = light {
        for handle in &state.materials {
            if let Some(material) = materials.get_mut(handle) {
                if material.extension.light_buf.id() != light.id() {
                    material.extension.light_buf = light.clone();
                }
            }
        }
    }
    if let Some(root) = state.root.and_then(|root| roots.get_mut(root).ok()) {
        let mut root = root;
        let yaw = if let Some(pose) = world.pose {
            pose.facing
        } else if preview.fixed_yaw {
            PICKER_YAW
        } else {
            preview.yaw
        };
        root.rotation = Quat::from_rotation_y(yaw);
        if let Some(pose) = world.pose {
            root.translation = benilla_assets::coords::wow_to_bevy(pose.position_wow);
            root.scale = Vec3::ONE;
        } else if let Some(frame) = state.frame {
            root.translation = Vec3::ZERO;
            root.scale = Vec3::splat(frame.root_scale(preview.display_aspect));
        }
    }
    let pose = pose_matrices(
        &state.skeleton,
        if world.pose.is_some_and(|pose| pose.moving) {
            state.run_animation.as_ref().or(state.animation.as_ref())
        } else {
            state.animation.as_ref()
        },
        &state.global_bones,
        &state.grip,
        state.elapsed,
    );
    for (part, mut layers) in &mut parts {
        let layer = if world.pose.is_some() {
            RenderLayers::default()
        } else {
            RenderLayers::layer(LAYER)
        };
        if *layers != layer {
            *layers = layer;
        }
        let Some(mesh) = meshes.get_mut(&part.mesh) else {
            continue;
        };
        let skin = |index: usize, value: [f32; 3], normal: bool| {
            let value = Vec3::from_array(value);
            let transform = |matrix: Mat4, value: Vec3| {
                if normal {
                    matrix.transform_vector3(value)
                } else {
                    matrix.transform_point3(value)
                }
            };
            let result = if let Some((bone, offset)) = part.attachment {
                let matrix = pose
                    .get(usize::from(bone))
                    .copied()
                    .unwrap_or(Mat4::IDENTITY)
                    * Mat4::from_translation(offset);
                transform(matrix, value)
            } else if let (Some(joints), Some(weights)) =
                (part.joints.get(index), part.weights.get(index))
            {
                let mut result = Vec3::ZERO;
                for lane in 0..4 {
                    if weights[lane] > 0.0 {
                        let matrix = pose
                            .get(usize::from(joints[lane]))
                            .copied()
                            .unwrap_or(Mat4::IDENTITY);
                        result += transform(matrix, value) * weights[lane];
                    }
                }
                result
            } else {
                value
            };
            let result = wow_to_bevy(result);
            if normal {
                result.normalize_or_zero().to_array()
            } else {
                result.to_array()
            }
        };
        mesh.insert_attribute(
            Mesh::ATTRIBUTE_POSITION,
            part.positions
                .iter()
                .enumerate()
                .map(|(index, position)| skin(index, *position, false))
                .collect::<Vec<_>>(),
        );
        mesh.insert_attribute(
            Mesh::ATTRIBUTE_NORMAL,
            part.normals
                .iter()
                .enumerate()
                .map(|(index, normal)| skin(index, *normal, true))
                .collect::<Vec<_>>(),
        );
    }
}

/// Evaluate the authored Stand pose in raw model space, before the single WoW→Bevy conversion.
fn pose_matrices(
    skeleton: &Skeleton,
    animation: Option<&ModelAnimation>,
    global_bones: &[benilla_formats::GlobalSeqBone],
    grip: &[(u16, [f32; 4])],
    elapsed: f32,
) -> Vec<Mat4> {
    let count = skeleton.bones.len();
    let mut local = vec![Mat4::IDENTITY; count];
    let mut translations = vec![Vec3::ZERO; count];
    let mut rotations = vec![Quat::IDENTITY; count];
    let mut scales = vec![Vec3::ONE; count];
    let mut keyed_rotation = vec![false; count];
    let t = animation.map_or(0.0, |animation| {
        if animation.looping {
            elapsed.rem_euclid(animation.duration.max(0.001))
        } else {
            elapsed.min(animation.duration)
        }
    });
    if let Some(animation) = animation {
        for keys in &animation.bones {
            let index = usize::from(keys.bone);
            if index >= count {
                continue;
            }
            translations[index] = sample_vec3(&keys.translation, t, Vec3::ZERO);
            rotations[index] = sample_quat(&keys.rotation, t);
            keyed_rotation[index] = !keys.rotation.is_empty();
            scales[index] = sample_vec3(&keys.scale, t, Vec3::ONE);
        }
    }
    for &(bone, rotation) in grip {
        let index = usize::from(bone);
        if index < count {
            // The existing renderer overlays HandsClosed at weight 8 over Stand's weight 1.
            let weight = if keyed_rotation[index] {
                8.0 / 9.0
            } else {
                1.0
            };
            rotations[index] =
                rotations[index].slerp(Quat::from_array(rotation).normalize(), weight);
        }
    }
    for bone in global_bones {
        let index = usize::from(bone.bone);
        if index >= count {
            continue;
        }
        let cursor = |period: u32| (elapsed * 1000.0) % period.max(1) as f32;
        if let Some(channel) = &bone.translation {
            if let Some((a, b, factor)) =
                global_key_window(&channel.keys, cursor(channel.period_ms))
            {
                translations[index] = Vec3::from_array(*a).lerp(Vec3::from_array(*b), factor);
            }
        }
        if let Some(channel) = &bone.rotation {
            if let Some((a, b, factor)) =
                global_key_window(&channel.keys, cursor(channel.period_ms))
            {
                rotations[index] = Quat::from_array(*a)
                    .normalize()
                    .slerp(Quat::from_array(*b).normalize(), factor);
            }
        }
        if let Some(channel) = &bone.scale {
            if let Some((a, b, factor)) =
                global_key_window(&channel.keys, cursor(channel.period_ms))
            {
                scales[index] = Vec3::from_array(*a).lerp(Vec3::from_array(*b), factor);
            }
        }
    }
    for (index, bone) in skeleton.bones.iter().enumerate() {
        let pivot = Vec3::from_array(bone.pivot);
        local[index] = Mat4::from_translation(pivot + translations[index])
            * Mat4::from_quat(rotations[index])
            * Mat4::from_scale(scales[index])
            * Mat4::from_translation(-pivot);
    }
    let mut pose = vec![None; count];
    fn resolve(
        index: usize,
        skeleton: &Skeleton,
        local: &[Mat4],
        pose: &mut [Option<Mat4>],
        depth: usize,
    ) -> Mat4 {
        if let Some(matrix) = pose[index] {
            return matrix;
        }
        if depth > skeleton.bones.len() {
            return Mat4::IDENTITY;
        }
        let parent = usize::try_from(skeleton.bones[index].parent)
            .ok()
            .filter(|parent| *parent < skeleton.bones.len());
        let matrix = parent.map_or(local[index], |parent| {
            resolve(parent, skeleton, local, pose, depth + 1) * local[index]
        });
        pose[index] = Some(matrix);
        matrix
    }
    for index in 0..count {
        resolve(index, skeleton, &local, &mut pose, 0);
    }
    pose.into_iter().map(Option::unwrap_or_default).collect()
}

fn global_key_window<T>(keys: &[(u32, T)], t: f32) -> Option<(&T, &T, f32)> {
    let first = keys.first()?;
    let next = keys.partition_point(|(time, _)| *time as f32 <= t);
    if next == 0 {
        return Some((&first.1, &first.1, 0.0));
    }
    let (start, a) = &keys[next - 1];
    let Some((end, b)) = keys.get(next) else {
        return Some((a, a, 0.0));
    };
    let factor = ((t - *start as f32) / end.saturating_sub(*start).max(1) as f32).clamp(0.0, 1.0);
    Some((a, b, factor))
}

fn key_window<T>(keys: &[(f32, T)], t: f32) -> Option<(&T, &T, f32)> {
    let first = keys.first()?;
    let next = keys.partition_point(|(time, _)| *time <= t);
    if next == 0 {
        return Some((&first.1, &first.1, 0.0));
    }
    let (start, a) = &keys[next - 1];
    let Some((end, b)) = keys.get(next) else {
        return Some((a, a, 0.0));
    };
    let factor = ((t - start) / (end - start).max(f32::EPSILON)).clamp(0.0, 1.0);
    Some((a, b, factor))
}

fn sample_vec3(keys: &[(f32, [f32; 3])], t: f32, fallback: Vec3) -> Vec3 {
    key_window(keys, t).map_or(fallback, |(a, b, factor)| {
        Vec3::from_array(*a).lerp(Vec3::from_array(*b), factor)
    })
}

fn sample_quat(keys: &[(f32, [f32; 4])], t: f32) -> Quat {
    key_window(keys, t).map_or(Quat::IDENTITY, |(a, b, factor)| {
        Quat::from_array(*a)
            .normalize()
            .slerp(Quat::from_array(*b).normalize(), factor)
    })
}
