//! Actual creature displays over the shared MPQ renderer and GPU rig owner.
//!
//! The recovered actor collection supplies display ids, scale and motion. No
//! stand-in geometry is spawned for an absent model or a missing texture.

use std::collections::{HashMap, HashSet};

use benilla_app::local_client::{
    LocalClientSet, LocalUnitBounds, LocalUnitEngineVisual, LocalUnitName, LocalUnitPath,
    LocalUnitVisual, ObjectFields,
};
use benilla_assets::{
    AssetSet, LockRecover, M2Model, ModelAnimations, WorldAssets, coords::wow_to_bevy, m2_url,
    materials::WowModelMaterial, skin_url, submesh_to_skinned_mesh, submesh_to_static_mesh,
};
use benilla_formats::{
    CharSkinSlot, CreatureCatalog, CreatureModel, GameObjectCatalog, NpcAppearance,
};
use benilla_world::{
    lighting::SharedLightBuffer,
    model_render::{MaterialCache, ShadeSel, model_material},
    rig_anim::{GlobalSeqDrive, RigPose},
    rig_palette::{RigPalettes, RigPart, RigSkin},
};
use bevy::camera::primitives::{Aabb, MeshAabb};
use bevy::mesh::MeshTag;
use bevy::prelude::*;

use super::{RunSession, world::native_floor::NativeFloor};

pub struct RunVisualsPlugin;

impl Plugin for RunVisualsPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<VisualCache>()
            .add_systems(Startup, load_catalog.after(AssetSet::Open))
            // Publish the previous completed tick before local registration and
            // the Net spline/ground stages. A post-Net pose write would erase
            // that frame's terrain correction and give animation stale motion.
            .add_systems(First, sync_visuals.after(LocalClientSet::Lifecycle));
    }
}

#[derive(Resource, Default)]
struct VisualCache {
    catalog: Option<CreatureCatalog>,
    gameobjects: Option<GameObjectCatalog>,
    displays: HashMap<(bool, u32), Display>,
    actors: HashMap<u64, Entity>,
    materials: MaterialCache,
    unavailable: HashSet<(bool, u32)>,
}

struct Display {
    handle: Handle<M2Model>,
    definition: ResolvedDisplay,
    parts: Option<Vec<Part>>,
    bounds: Option<LocalUnitBounds>,
    selection_radius: Option<f32>,
}

struct ResolvedDisplay {
    model_path: String,
    scale: f32,
    textures: [Option<String>; 3],
    npc_appearance: Option<NpcAppearance>,
}

impl From<CreatureModel> for ResolvedDisplay {
    fn from(model: CreatureModel) -> Self {
        Self {
            model_path: model.model_path,
            scale: model.scale,
            textures: model.textures,
            npc_appearance: model.npc_appearance,
        }
    }
}

#[derive(Clone)]
struct Part {
    static_mesh: Handle<Mesh>,
    skinned_mesh: Handle<Mesh>,
    material: Handle<WowModelMaterial>,
    aabb: Option<Aabb>,
}

#[derive(Component)]
struct ActorVisual {
    last_animation: Option<u16>,
    unit: Option<UnitSnapshot>,
}

#[derive(Clone, Copy, PartialEq, Eq)]
struct UnitSnapshot {
    guid: u64,
    target_guid: Option<u64>,
    entry: u32,
    display_id: u32,
    scale_bits: u32,
    name: &'static str,
    health: u32,
    maximum_health: u32,
    level: u32,
    form_fields: [Option<u32>; FORM_FIELD_KEYS.len()],
}

// UNIT_VIRTUAL_ITEM_SLOT_DISPLAY, UNIT_VIRTUAL_ITEM_INFO, mount and sheath.
// Display and scale already come from actor_appearance's merged override.
const FORM_FIELD_KEYS: [u16; 8] = [37, 38, 40, 41, 42, 43, 133, 164];

struct ActorView {
    guid: u64,
    target_guid: Option<u64>,
    display_id: u32,
    scale: f32,
    gameobject: bool,
    position: [f32; 3],
    facing: f32,
    actor: Option<azeroth_survivors_re::enemies::ai::Actor>,
    name: Option<&'static str>,
    health: Option<f32>,
    maximum_health: Option<f32>,
    entry: Option<u32>,
    native_level: Option<u32>,
}

fn load_catalog(mut cache: ResMut<VisualCache>, assets: Option<Res<WorldAssets>>) {
    let Some(assets) = assets else { return };
    let mut chain = assets.chain.lock_recover();
    match benilla_formats::load_creature_catalog(&mut chain) {
        Ok(catalog) => cache.catalog = Some(catalog),
        Err(error) => error!("Run creature catalog: {error}"),
    };
    match benilla_formats::load_gameobject_catalog(&mut chain) {
        Ok(catalog) => cache.gameobjects = Some(catalog),
        Err(error) => error!("Run gameobject catalog: {error}"),
    };
    for display_id in [1825, 16587] {
        if let Some(model) = cache
            .catalog
            .as_ref()
            .and_then(|catalog| catalog.model(display_id))
        {
            info!(
                "Native XP CreatureDisplay {display_id}: {}",
                model.model_path
            );
        }
    }
    for display_id in [259, 2614] {
        if let Some(path) = cache
            .gameobjects
            .as_ref()
            .and_then(|catalog| catalog.model_path(display_id))
        {
            info!("Native pickup GameObjectDisplay {display_id}: {path}");
        }
    }
}

#[allow(clippy::too_many_arguments)]
pub(super) fn sync_visuals(
    mut commands: Commands,
    session: Res<RunSession>,
    floor: Res<NativeFloor>,
    mut cache: ResMut<VisualCache>,
    server: Res<AssetServer>,
    models: Res<Assets<M2Model>>,
    mut meshes: ResMut<Assets<Mesh>>,
    mut materials: ResMut<Assets<WowModelMaterial>>,
    light: Option<Res<SharedLightBuffer>>,
    mut palettes: ResMut<RigPalettes>,
    mut roots: Query<(
        &mut Transform,
        &mut ActorVisual,
        Option<&mut AnimationPlayer>,
        Option<&ModelAnimations>,
    )>,
) {
    let Some(game) = session.mechanics.as_ref() else {
        for (_, root) in cache.actors.drain() {
            commands.entity(root).despawn();
        }
        return;
    };
    let actors: Vec<_> = game
        .actors
        .iter()
        .map(|row| {
            let guardian_scale = game.guardian_render_scale(row.guid);
            let (display_id,scale) = game.actor_appearance(row.guid)
                .unwrap_or((row.definition.model_id,guardian_scale.unwrap_or(row.definition.scale)));
            ActorView {
                guid: row.guid,
                target_guid: None,
                display_id,
                scale,
                gameobject: false,
                position: position_array(row.actor.movement.position_at(game.clock)),
                facing: row.actor.movement_angle,
                actor: Some(row.actor),
                name: Some(row.definition.name),
                health: Some(row.health),
                maximum_health: Some(row.maximum_health),
                entry: Some(row.definition.id),
                native_level: Some(row.native_level),
            }
        })
        .chain(game.bosses.iter().map(|row| {
            let (display_id,scale) = game.actor_appearance(row.guid).unwrap_or((row.definition.model_id,row.definition.scale));
            ActorView {
            guid: row.guid,
            target_guid: None,
            display_id,
            scale,
            gameobject: false,
            position: position_array(row.actor.movement.position_at(game.clock)),
            facing: row.actor.movement_angle,
            actor: Some(row.actor),
            name: Some(row.definition.name),
            health: Some(row.health),
            maximum_health: Some(row.maximum_health),
            entry: Some(row.definition.id),
            native_level: Some(row.native_level),
        }}))
        .chain(game.ward_actors().iter().map(|row| {
            let (display_id,scale) = game.actor_appearance(row.guid).unwrap_or((row.template.display,row.template.scale));
            ActorView {
            guid: row.guid, display_id, scale,
            target_guid: Some(row.player_guid),
            gameobject: false, position: position_array(row.actor.movement.position_at(game.clock)),
            facing: row.actor.movement_angle, actor: Some(row.actor), name: Some(row.template.name),
            health: Some(row.health), maximum_health: Some(row.maximum_health),
            entry: Some(row.template.entry), native_level: Some(row.native_level),
        }}))
        // All pickups, including caches, enter the ordinary client through
        // their create events. Their model/animation/removal lifetime is not
        // tied to this host-owned creature collection.
        .collect();
    let living_ids: HashSet<u64> = actors.iter().map(|actor| actor.guid).collect();
    cache.actors.retain(|guid, root| {
        if living_ids.contains(guid) {
            true
        } else {
            commands.entity(*root).despawn();
            false
        }
    });
    for actor in &actors {
        if let Some(unit) = unit_snapshot(actor, actor.scale, game.actor_form_fields(actor.guid)) {
            let state = actor.actor.expect("unit snapshot has an actual actor");
            let path = unit_path(state, game.clock, |xy| floor.terrain_ref()?.height(xy));
            if let Some(&root) = cache.actors.get(&actor.guid) {
                if let Ok((_, mut visual, _, _)) = roots.get_mut(root) {
                    // The normal live-display owner retains scale easing and all
                    // animation routing. The host only supplies actual actor data.
                    if visual.unit != Some(unit) {
                        commands.entity(root).insert(unit_visual(unit, None, None));
                        if visual.unit.is_none_or(|old| old.name != unit.name) {
                            commands
                                .entity(root)
                                .insert(LocalUnitName(unit.name.into()));
                        }
                        visual.unit = Some(unit);
                    }
                    commands.entity(root).insert(path);
                }
            } else {
                let root = commands
                    .spawn((
                        Transform::from_translation(wow_to_bevy(path.from))
                            .with_rotation(Quat::from_rotation_y(path.facing))
                            .with_scale(Vec3::splat(actor.scale)),
                        Visibility::Visible,
                        ActorVisual {
                            last_animation: None,
                            unit: Some(unit),
                        },
                        unit_visual(unit, None, None),
                        LocalUnitName(unit.name.into()),
                        LocalUnitEngineVisual,
                        path,
                    ))
                    .id();
                cache.actors.insert(actor.guid, root);
            }
            continue;
        }
        // Retain the display fallback for actor identities without a
        // registrable unit snapshot; pickups use ordinary client creates.
        let Some(light) = light.as_ref() else {
            continue;
        };
        let display_id = actor.display_id;
        let key = (actor.gameobject, display_id);
        if !cache.displays.contains_key(&key) && !cache.unavailable.contains(&key) {
            let definition = if actor.gameobject {
                cache
                    .gameobjects
                    .as_ref()
                    .and_then(|catalog| catalog.model_path(display_id))
                    .map(|path| ResolvedDisplay {
                        model_path: path.into(),
                        scale: 1.0,
                        textures: [None, None, None],
                        npc_appearance: None,
                    })
            } else {
                cache
                    .catalog
                    .as_ref()
                    .and_then(|catalog| catalog.model(display_id))
                    .map(ResolvedDisplay::from)
            };
            if let Some(definition) = definition {
                let handle = server.load(m2_url(&definition.model_path));
                cache.displays.insert(
                    key,
                    Display {
                        handle,
                        definition,
                        parts: None,
                        bounds: None,
                        selection_radius: None,
                    },
                );
            } else {
                warn!("Recovered creature display {display_id} is absent from supplied MPQs");
                cache.unavailable.insert(key);
            }
        }
        if !cache.displays.contains_key(&key) {
            continue;
        }
        // Split cache ownership while preparing one display's shared render forms.
        let mut display = cache.displays.remove(&key).expect("checked above");
        if display.parts.is_none() {
            if let Some(model) = models.get(&display.handle) {
                let directory = display
                    .definition
                    .model_path
                    .rsplit_once(['\\', '/'])
                    .map_or("", |(dir, _)| dir);
                let mut parts = Vec::new();
                for part in &model.submeshes {
                    let texture = if let Some(slot) = part.skin_slot {
                        display
                            .definition
                            .textures
                            .get(usize::from(slot))
                            .and_then(|name| name.as_ref())
                            .map(|name| server.load::<Image>(skin_url(directory, name)))
                    } else if part.char_slot == Some(CharSkinSlot::Body) {
                        display
                            .definition
                            .npc_appearance
                            .as_ref()
                            .and_then(|appearance| appearance.bake_name.as_ref())
                            .map(|name| server.load::<Image>(baked_npc_url(name)))
                    } else {
                        part.texture.clone()
                    };
                    // Missing NPC character composites remain an explicit coverage gap.
                    if (part.skin_slot.is_some() || part.char_slot.is_some()) && texture.is_none() {
                        continue;
                    }
                    let material = model_material(
                        &mut cache.materials,
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
                        part.stage1.as_ref(),
                        part.combine,
                        ShadeSel::Lit,
                        part.geometry.section.unwrap_or(0),
                        part.uv_anim.as_ref(),
                        part.rgb_anim.as_ref(),
                        None,
                        None,
                        false,
                        false,
                        &light.0,
                        None,
                    );
                    benilla_world::model_render::lazy::realize(&mut materials, material.id());
                    let static_mesh = submesh_to_static_mesh(&part.geometry);
                    let aabb = static_mesh.compute_aabb();
                    parts.push(Part {
                        static_mesh: meshes.add(static_mesh),
                        skinned_mesh: meshes.add(submesh_to_skinned_mesh(&part.geometry)),
                        material,
                        aabb,
                    });
                }
                if parts.is_empty() {
                    warn!("Creature display {display_id} has no resolvable textured render parts");
                }
                display.bounds = model_bounds(model, &parts);
                display.selection_radius = model.bounds.map(|bounds| bounds.ring_footprint);
                display.parts = Some(parts);
            }
        }
        if !cache.actors.contains_key(&actor.guid) {
            if let (Some(parts), Some(model)) =
                (display.parts.as_ref(), models.get(&display.handle))
            {
                let position = actor.position;
                let scale = actor.scale * display.definition.scale;
                let unit = unit_snapshot(actor, scale, game.actor_form_fields(actor.guid));
                let root = commands
                    .spawn((
                        Transform::from_translation(wow_to_bevy(position))
                            .with_rotation(Quat::from_rotation_y(actor.facing))
                            .with_scale(Vec3::splat(scale)),
                        Visibility::Visible,
                        ActorVisual {
                            last_animation: None,
                            unit,
                        },
                    ))
                    .id();
                if let Some(unit) = unit {
                    commands.entity(root).insert((
                        unit_visual(unit, display.bounds, display.selection_radius),
                        LocalUnitName(unit.name.into()),
                    ));
                }
                let rig = (!model.skeleton.joints.is_empty())
                    .then(|| {
                        RigSkin::allocate_bones(
                            &mut palettes,
                            model.skeleton.joints.len() as u32,
                            model.inverse_bindposes.clone(),
                        )
                    })
                    .flatten();
                let slot = rig.as_ref().map_or(0, |rig| rig.slot);
                if let Some(rig) = rig {
                    commands
                        .entity(root)
                        .insert((rig, RigPose::new(root, &model.skeleton)));
                }
                if let Some(animations) = model.animations.as_ref() {
                    commands.entity(root).insert((
                        AnimationPlayer::default(),
                        AnimationGraphHandle(animations.graph.clone()),
                        animations.clone(),
                    ));
                    if let Some(drive) = GlobalSeqDrive::new_rig(
                        &animations.global_bones,
                        model.skeleton.joints.len(),
                    ) {
                        commands.entity(root).insert(drive);
                    }
                }
                for part in parts {
                    let mut child = commands.spawn((
                        Mesh3d(if slot == 0 {
                            part.static_mesh.clone()
                        } else {
                            part.skinned_mesh.clone()
                        }),
                        MeshMaterial3d(part.material.clone()),
                        Transform::default(),
                        ChildOf(root),
                        MeshTag(benilla_world::mesh_tag::spawn_tag(slot, 1.0)),
                        bevy::camera::visibility::NoFrustumCulling,
                    ));
                    if slot != 0 {
                        child.insert(RigPart(root));
                    }
                    if let Some(aabb) = part.aabb {
                        child.insert(aabb);
                    }
                }
                cache.actors.insert(actor.guid, root);
            }
        }
        if let Some(&root) = cache.actors.get(&actor.guid) {
            if let Ok((mut transform, mut visual, player, animations)) = roots.get_mut(root) {
                transform.translation = wow_to_bevy(actor.position);
                let scale = actor.scale * display.definition.scale;
                transform.scale = Vec3::splat(scale);
                let unit = unit_snapshot(actor, scale, game.actor_form_fields(actor.guid));
                if visual.unit != unit {
                    if let Some(unit) = unit {
                        commands.entity(root).insert(unit_visual(
                            unit,
                            display.bounds,
                            display.selection_radius,
                        ));
                        if visual.unit.is_none_or(|prior| prior.name != unit.name) {
                            commands
                                .entity(root)
                                .insert(LocalUnitName(unit.name.into()));
                        }
                    } else {
                        commands
                            .entity(root)
                            .remove::<(LocalUnitVisual, LocalUnitName)>();
                    }
                    visual.unit = unit;
                }
                if let Some(state) = actor.actor {
                    let movement = state.movement;
                    let direction = Vec2::new(
                        movement.to.x - movement.from.x,
                        movement.to.y - movement.from.y,
                    );
                    if direction.length_squared() > f32::EPSILON {
                        transform.rotation = Quat::from_rotation_y(direction.y.atan2(direction.x));
                    }
                }
                let moving = actor.actor.is_some_and(|state| {
                    state.movement.duration > 0.0
                        && game.clock < state.movement.started_at + state.movement.duration
                });
                // DBC animation identities are presentation choices; actor decision/damage
                // timing remains exclusively in the recovered mechanics owners.
                let dead = actor.actor.is_some_and(|state| state.dead);
                let requested = if dead {
                    1
                } else if actor.actor.is_some_and(|state| state.casting) {
                    51
                } else if moving {
                    5
                } else {
                    if actor.actor.is_some() { 16 } else { 0 }
                };
                if let (Some(mut player), Some(animations)) = (player, animations) {
                    if let Some(clip) = animations.preferred_clip(Some(requested)) {
                        if visual.last_animation != Some(clip.anim_id) {
                            player.stop_all();
                            let active = player.play(clip.node);
                            if !dead {
                                active.repeat();
                            }
                            visual.last_animation = Some(clip.anim_id);
                        }
                        if moving && clip.move_speed > 0.0 {
                            if let Some(active) = player.animation_mut(clip.node) {
                                active.set_speed(
                                    actor.actor.map_or(0.0, |state| state.movement_speed)
                                        / (clip.move_speed * transform.scale.x),
                                );
                            }
                        }
                    }
                }
            }
        }
        cache.displays.insert(key, display);
    }
}

fn position_array(position: azeroth_survivors_re::enemies::Position) -> [f32; 3] {
    [position.x, position.y, position.z]
}

/// 0.110.0 dispatch145943cd3..145943d83 samples primary terrain at both endpoints,
/// retaining each original Z on a miss.1458bee80 sends a grounded run path,
/// with truncating/saturating milliseconds and a minimum of one.
fn unit_path(
    actor: azeroth_survivors_re::enemies::ai::Actor,
    clock: f32,
    mut height: impl FnMut([f32; 2]) -> Option<f32>,
) -> LocalUnitPath {
    let movement = actor.movement;
    let mut from = position_array(movement.from);
    let mut to = position_array(movement.to);
    let duration_ms = if movement.duration <= 0.0 {
        0
    } else {
        from[2] = height([from[0], from[1]]).unwrap_or(from[2]);
        to[2] = height([to[0], to[1]]).unwrap_or(to[2]);
        ((movement.duration * 1000.0) as u32).max(1)
    };
    let direction = Vec2::new(to[0] - from[0], to[1] - from[1]);
    LocalUnitPath {
        from,
        to,
        started_at: movement.started_at,
        duration_ms,
        elapsed: clock - movement.started_at,
        facing: if direction.length_squared() > f32::EPSILON {
            direction.y.atan2(direction.x)
        } else {
            actor.movement_angle
        },
    }
}

fn unit_snapshot(actor: &ActorView, scale: f32, form_fields: Option<&[(u16, u32)]>) -> Option<UnitSnapshot> {
    actor.actor?;
    // Recovered creature GUIDs already carry this family. A low-48-bit embedding identity may
    // also use it, without truncating an entry/counter or aliasing a foreign GUID family.
    const UNIT_FAMILY: u64 = 0xf130_0000_0000_0000;
    let family = actor.guid & 0xffff_0000_0000_0000;
    if actor.guid == 0 || (family != 0 && family != UNIT_FAMILY) {
        return None;
    }
    Some(UnitSnapshot {
        guid: UNIT_FAMILY | actor.guid,
        target_guid: actor.target_guid,
        entry: actor.entry?,
        display_id: actor.display_id,
        scale_bits: scale.to_bits(),
        name: actor.name?,
        // Current constructor1454d2910 /1454d2b82 and actor-hit1454d5b06/
        //1454d5bed call ceilf before the saturating unsigned conversion.
        health: actor.health?.max(0.0).ceil() as u32,
        maximum_health: actor.maximum_health?.max(0.0).ceil() as u32,
        level: actor.native_level?,
        form_fields: FORM_FIELD_KEYS.map(|key| form_fields
            .and_then(|fields| fields.iter().find_map(|&(field, value)| (field == key).then_some(value)))),
    })
}

fn unit_visual(
    unit: UnitSnapshot,
    bounds: Option<LocalUnitBounds>,
    selection_radius: Option<f32>,
) -> LocalUnitVisual {
    let mut fields = vec![
        (0,unit.guid as u32),(1,(unit.guid>>32) as u32),(2,9),(3,unit.entry),
        (4,unit.scale_bits),(22,unit.health),(28,unit.maximum_health),(34,unit.level),
        (35,14),(36,0x100),(46,0),(126,2000),(127,2000),(131,unit.display_id),(132,unit.display_id),
    ];
    fields.extend(FORM_FIELD_KEYS.into_iter().zip(unit.form_fields)
        .filter_map(|(field, value)| value.map(|value| (field, value))));
    if azeroth_survivors_re::bosses::raid_wards::TEMPLATES.iter().any(|row| row.entry == unit.entry) {
        let scale = f32::from_bits(unit.scale_bits);
        fields.extend([(129,(scale*0.5).to_bits()),(130,(scale*1.5).to_bits()),
            (134,5f32.to_bits()),(135,10f32.to_bits()),(145,1f32.to_bits())]);
        // Current AS creation publishes the configured hero GUID, including
        // its high word. It is the ward's captured creation target, not host1.
        if let Some(target) = unit.target_guid {
            fields.extend([(16, target as u32), (17, (target >> 32) as u32)]);
        }
    }
    LocalUnitVisual {
        guid: unit.guid,
        display_id: unit.display_id,
        scale: f32::from_bits(unit.scale_bits),
        fields: ObjectFields::from_pairs(&fields),
        bounds,
        selection_radius,
    }
}

fn model_bounds(model: &M2Model, parts: &[Part]) -> Option<LocalUnitBounds> {
    if let Some(clip) = model
        .animations
        .as_ref()
        .and_then(|animations| animations.idle_clip())
        .filter(|clip| {
            clip.bounds_min.is_finite()
                && clip.bounds_max.is_finite()
                && clip.bounds_max.cmpgt(clip.bounds_min).all()
        })
    {
        return Some(LocalUnitBounds {
            min: clip.bounds_min.to_array(),
            max: clip.bounds_max.to_array(),
        });
    }
    // Match the normal attachment owner's fallback: the union of the built render parts'
    // real bind-pose boxes, already in renderer axes. Header boxes are in WoW model space.
    let mut boxes = parts.iter().filter_map(|part| part.aabb);
    let first = boxes.next()?;
    let (mut min, mut max) = (first.min(), first.max());
    for bounds in boxes {
        min = min.min(bounds.min());
        max = max.max(bounds.max());
    }
    Some(LocalUnitBounds {
        min: Vec3::from(min).to_array(),
        max: Vec3::from(max).to_array(),
    })
}

fn baked_npc_url(name: &str) -> String {
    format!(
        "mpq://textures/bakednpctextures/{}",
        name.replace('\\', "/").to_ascii_lowercase()
    )
}

#[cfg(test)]
mod tests {
    use super::*;
    use azeroth_survivors_re::enemies::{
        Position,
        ai::{Actor, Movement},
    };
    fn actor_state() -> Actor {
        let p = Position {
            x: 0.,
            y: 0.,
            z: 0.,
        };
        Actor {
            guid: 1,
            movement: Movement {
                from: p,
                to: p,
                started_at: 0.,
                duration: 0.,
            },
            next_movement_at: 0.,
            attack_delay: 0.,
            attack_interval: 1.,
            melee_reach: 1.,
            movement_speed: 1.,
            damage: 1.,
            movement_angle: 0.,
            casting: false,
            cast_ends_at: 0.,
            dead: false,
            died_at: 0.,
            fear_until: 0.,
            stun_until: 0.,
            forced_escape_until: 0.,
            escape: None,
            slow: default(),
            damage_reduction: default(), whirlwind_until: 0.0,
        }
    }

    #[test]
    fn movement_endpoints_and_duration_match_current_native_dispatch() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/../../docs/analysis/evidence/0.105.0/mob-movement/native-fixtures.json"
        ))).unwrap();
        let point = |row: &serde_json::Value| -> [f32; 3] {
            std::array::from_fn(|i| row[i].as_f64().unwrap() as f32)
        };
        for row in fixture["cases"].as_array().unwrap() {
            let mut actor = actor_state();
            let from = point(&row["from_point"]);
            let to = point(&row["to_point"]);
            actor.movement = Movement {
                from: Position { x: from[0], y: from[1], z: from[2] },
                to: Position { x: to[0], y: to[1], z: to[2] },
                started_at: 10.,
                duration: f32::from_bits(row["duration_bits"].as_u64().unwrap() as u32),
            };
            let mut queries = 0;
            let path = unit_path(actor, 10.25, |_| {
                let height = row["heights"][queries].as_f64().map(|value| value as f32);
                queries += 1;
                height
            });
            assert_eq!(queries, row["height_queries"].as_u64().unwrap() as usize);
            if row["mode"] == "move" {
                assert_eq!(path.from, point(&row["expected_from"]));
                assert_eq!(path.to, point(&row["expected_to"]));
                assert_eq!(path.duration_ms, row["duration_ms"].as_u64().unwrap() as u32);
            } else {
                assert_eq!(path.duration_ms, 0);
            }
        }
    }

    #[test]
    fn native_fractional_health_reaches_unit_fields_with_ceil_conversion() {
        let state = actor_state();
        for (health, expected) in [(0.1, 1), (0.99, 1), (1.1, 2), (0., 0), (-0.1, 0)] {
            let actor = ActorView {
                guid: 1,
                target_guid: None,
                display_id: 26,
                scale: 1.,
                gameobject: false,
                position: [0.; 3],
                facing: 0.,
                actor: Some(state),
                name: Some("Kobold Vermin"),
                health: Some(health),
                maximum_health: Some(13.1),
                entry: Some(1),
                native_level: Some(1),
            };
            let unit = unit_snapshot(&actor, 1., None).unwrap();
            let visual = unit_visual(unit, None, None);
            assert_eq!(visual.fields.unit_health(), Some(expected));
            assert_eq!(visual.fields.unit_max_health(), Some(14));
        }
    }

    #[test]
    fn ward_creation_target_preserves_native_guid_and_snapshot_changes() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/../../docs/analysis/evidence/0.121.0/ward-target-guid.json"
        ))).unwrap();
        for row in fixture["publication_cases"].as_array().unwrap() {
            let target = row["target_guid"].as_u64().unwrap();
            let actor = ActorView {
                guid: 0xf130_0025_8c00_0001,
                target_guid: Some(target),
                display_id: 16111,
                scale: f32::from_bits(0x3f666666),
                gameobject: false,
                position: [0.; 3],
                facing: 0.,
                actor: Some(actor_state()),
                name: Some("Explosive Orb"),
                health: Some(1.),
                maximum_health: Some(1.),
                entry: Some(9612),
                native_level: Some(1),
            };
            let unit = unit_snapshot(&actor, actor.scale, None).unwrap();
            let visual = unit_visual(unit, None, None);
            assert_eq!(visual.fields.unit_target(), (target != 0).then_some(target));
            assert_eq!(visual.fields.get_u32(16), Some(row["field16"].as_u64().unwrap() as u32));
            assert_eq!(visual.fields.get_u32(17), Some(row["field17"].as_u64().unwrap() as u32));
            assert_eq!(visual.fields.unit_displayid(), Some(16111));
            assert_eq!(visual.fields.unit_native_displayid(), Some(16111));
            assert_eq!(visual.scale.to_bits(), 0x3f666666);
            // This is the equality used by sync_visuals before publication.
            let mut changed = unit;
            changed.target_guid = Some(target ^ (1 << 32));
            assert!(changed != unit);
            let changed_target = target ^ (1 << 32);
            assert_eq!(unit_visual(changed, None, None).fields.unit_target(),
                (changed_target != 0).then_some(changed_target));
            // Ordinary actors do not acquire the ward-only target fields.
            let ordinary = ActorView { target_guid: None, entry: Some(1), ..actor };
            let ordinary = unit_visual(unit_snapshot(&ordinary, ordinary.scale, None).unwrap(), None, None);
            assert_eq!(ordinary.fields.get_u32(16), None);
            assert_eq!(ordinary.fields.get_u32(17), None);
        }
    }
}
