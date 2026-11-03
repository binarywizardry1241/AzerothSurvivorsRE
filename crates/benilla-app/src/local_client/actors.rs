//! Identity and native picking for models drawn by the embedding game.
//! No transform, mesh, animation, combat or faction policy is authored here.

use std::collections::HashMap;

use benilla_protocol::{EntityKind, ObjectFields, messages::ObjectType};
use bevy::camera::primitives::Aabb;
use bevy::prelude::*;

use benilla_world::interact::{CreaturePickPart, GoPickPart};
use benilla_world::schedule::WorldStage;

use crate::entities::{ModelBound, VisualAttached};
use crate::field_watch::{FieldNotice, id as field_event};
use crate::net::{FieldChanged, Guid, GuidIndex, NetEntity, ObjectStore, SelfPlayer};
use crate::target::{Selection, SelectionRadius, TargetUpdate};

use super::LocalClientSession;

/// Real model-space bounds in the renderer's Bevy axes, before the root transform/scale.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LocalUnitBounds {
    pub min: [f32; 3],
    pub max: [f32; 3],
}

impl LocalUnitBounds {
    fn aabb(self) -> Option<Aabb> {
        let min = Vec3::from_array(self.min);
        let max = Vec3::from_array(self.max);
        (min.is_finite() && max.is_finite() && max.cmpgt(min).all())
            .then(|| Aabb::from_min_max(min, max))
    }
}

/// Attach to an existing visual root. The caller owns its real model, rig, transform and
/// descriptors. GUIDs must use the corresponding unit or GameObject family and be unique.
/// `fields` is a complete public-protocol UNIT or GAMEOBJECT snapshot, including its type mask; no missing
/// health, faction, flags or metadata are guessed by this bridge.
#[derive(Component, Clone, Debug)]
pub struct LocalUnitVisual {
    pub guid: u64,
    pub display_id: u32,
    pub scale: f32,
    pub fields: ObjectFields,
    pub bounds: Option<LocalUnitBounds>,
    pub selection_radius: Option<f32>,
}

/// An authoritative local display name, independent of an unrecovered CreatureRecord template.
#[derive(Component, Clone, Debug)]
pub struct LocalUnitName(pub String);

/// The embedding game supplies identity/pose/descriptors while the ordinary
/// client owns this unit's DBC model, rig, emitters and live appearance rebuild.
/// Registration can therefore precede all model asset loading.
#[derive(Component, Clone, Copy, Debug, Default)]
pub struct LocalUnitEngineVisual;

/// Actual authoritative ground motion, consumed by the ordinary client gait
/// selector. The host retains the position writer; this owns no movement AI.
#[derive(Component, Clone, Copy, Debug, Default)]
pub struct LocalUnitMotion {
    pub speed: f32,
    pub moving: bool,
}

/// The actual native selection after its mouse/script/TAB chain has completed.
#[derive(Resource, Default, Clone, Copy, Debug, PartialEq, Eq)]
pub struct LocalTargetSelection {
    pub guid: Option<u64>,
    pub entity: Option<Entity>,
}

#[derive(SystemSet, Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum LocalActorSet {
    Register,
    Selection,
}

#[derive(Resource, Default)]
struct RegisteredUnits(HashMap<Entity, u64>, HashMap<Entity, ObjectFields>);

#[derive(Component)]
struct RegisteredLocalUnit;

pub struct LocalActorsPlugin;

impl Plugin for LocalActorsPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<RegisteredUnits>()
            .init_resource::<LocalTargetSelection>()
            .configure_sets(
                Update,
                LocalActorSet::Register
                    .after(super::LocalPlayerSet::Prepare)
                    .before(WorldStage::Net),
            )
            .configure_sets(
                Update,
                LocalActorSet::Selection
                    .after(TargetUpdate)
                    .before(WorldStage::Present),
            )
            .add_systems(Update, register_units.in_set(LocalActorSet::Register))
            .add_systems(
                Update,
                super::movement::follow_paths
                    .after(LocalActorSet::Register)
                    // A face-target packet must win over the stopped pose;
                    // likewise a stun stop must win over the host's old path.
                    .before(super::events::LocalPresentationDispatch)
                    .before(WorldStage::Net),
            )
            .add_systems(
                Update,
                mark_pick_parts
                    .after(LocalActorSet::Register)
                    .before(TargetUpdate),
            )
            .add_systems(Update, read_selection.in_set(LocalActorSet::Selection));
    }
}

#[allow(clippy::type_complexity)]
fn register_units(
    mut commands: Commands,
    session: Res<LocalClientSession>,
    mut registered: ResMut<RegisteredUnits>,
    mut index: ResMut<GuidIndex>,
    mut names: ResMut<crate::names::NameCache>,
    mut selection: ResMut<Selection>,
    mut fields_changed: MessageWriter<FieldChanged>,
    mut field_notices: ResMut<crate::field_watch::NoticeLane>,
    mut units: Query<(
        Entity,
        Ref<LocalUnitVisual>,
        Option<&LocalUnitName>,
        Option<&Guid>,
        Option<&mut NetEntity>,
        Option<&mut ObjectStore>,
        Option<&ModelBound>,
        Option<&SelectionRadius>,
        Has<SelfPlayer>,
        Has<LocalUnitEngineVisual>,
        Option<&LocalUnitMotion>,
        Option<&mut crate::creature_anim::MovementState>,
    )>,
) {
    let removed: Vec<_> = registered
        .0
        .iter()
        .filter_map(|(&entity, &guid)| {
            (!session.active || !units.contains(entity)).then_some((entity, guid))
        })
        .collect();
    for (entity, guid) in removed {
        if index.0.get(&guid) == Some(&entity) {
            index.0.remove(&guid);
        }
        names.set_local_name(guid, None);
        if selection.target == Some(entity) {
            selection.target = None;
            selection.guid = None;
        }
        registered.0.remove(&entity);
        registered.1.remove(&entity);
        if let Ok(mut root) = commands.get_entity(entity) {
            root.remove::<(
                Guid,
                NetEntity,
                ObjectStore,
                VisualAttached,
                ModelBound,
                SelectionRadius,
                crate::entities::CollisionHeight,
                benilla_world::world_unit::WorldUnit,
                RegisteredLocalUnit,
            )>();
        }
    }
    if !session.active {
        return;
    }

    for (
        entity,
        local,
        name,
        existing_guid,
        net,
        store,
        bound,
        radius,
        is_self,
        engine_visual,
        motion,
        movement,
    ) in &mut units
    {
        let object_type = local.fields.object_type();
        let kind = match object_type {
            Some(ObjectType::Unit) if benilla_protocol::guid::is_creature_or_pet(local.guid) => {
                EntityKind::Unit
            }
            Some(ObjectType::GameObject) if benilla_protocol::guid::is_gameobject(local.guid) => {
                EntityKind::GameObject
            }
            _ => {
                if local.is_changed() {
                    warn!(
                        "local registration refused: GUID/descriptor family mismatch on {entity:?}"
                    );
                }
                continue;
            }
        };
        let object_type = object_type.expect("validated descriptor family");
        if is_self || local.display_id == 0 || !local.scale.is_finite() || local.scale <= 0.0 {
            if local.is_changed() {
                warn!("local registration refused: invalid identity/descriptor on {entity:?}");
            }
            continue;
        }
        if index
            .0
            .get(&local.guid)
            .is_some_and(|other| *other != entity)
            || existing_guid.is_some_and(|guid| guid.0 != local.guid)
            || (net.is_some() && !registered.0.contains_key(&entity))
        {
            if local.is_changed() {
                warn!(
                    "local unit registration refused: GUID or entity already owned on {entity:?}"
                );
            }
            continue;
        }
        let fresh = registered.0.insert(entity, local.guid).is_none();
        index.0.insert(local.guid, entity);
        names.set_local_name(local.guid, name.map(|n| n.0.as_str()));
        if fresh {
            // VisualAttached prevents a second set of engine meshes. AppliedDisplay is
            // intentionally absent: native live-display rebuilds must not tear down host rigs.
            commands
                .entity(entity)
                .insert((Guid(local.guid), RegisteredLocalUnit));
            if !engine_visual {
                commands.entity(entity).insert(VisualAttached);
            }
        }
        match net {
            Some(mut net) => {
                if !engine_visual
                    && (net.display_id != Some(local.display_id) || net.scale != local.scale)
                {
                    net.display_id = Some(local.display_id);
                    net.scale = local.scale;
                }
            }
            None => {
                commands.entity(entity).insert(NetEntity {
                    kind,
                    display_id: Some(local.display_id),
                    scale: local.scale,
                });
            }
        }
        // A host health update carries its original display too. Merge only
        // lanes the host changed since its previous snapshot, preserving live
        // packet morph/aura values in the client descriptor.
        let fields = if engine_visual {
            let previous = registered
                .1
                .get(&entity)
                .map(|fields| fields.raw_fields().collect::<HashMap<_, _>>());
            let current = local.fields.raw_fields().collect::<HashMap<_, _>>();
            let mut delta = current
                .iter()
                .filter(|(field, value)| {
                    previous
                        .as_ref()
                        .is_none_or(|old| old.get(*field) != Some(*value))
                })
                .map(|(field, value)| (*field, *value))
                .collect::<Vec<_>>();
            if let Some(previous) = previous {
                delta.extend(
                    previous
                        .keys()
                        .filter(|field| !current.contains_key(*field))
                        .map(|field| (*field, 0)),
                );
            }
            ObjectFields::from_pairs(&delta)
        } else {
            local.fields.clone().into_created(object_type)
        };
        if engine_visual {
            registered.1.insert(entity, local.fields.clone());
        }
        match store {
            Some(mut store) if local.is_changed() => {
                let mut changed = false;
                store
                    .bypass_change_detection()
                    .0
                    .merge_diff(fields, |field, old, new| {
                        changed = true;
                        fields_changed.write(FieldChanged {
                            entity,
                            guid: local.guid,
                            kind: object_type,
                            index: field,
                            old,
                            new,
                        });
                        // This host write precedes local ObjectValues dispatch. A
                        // later packet carrying the same HP cannot rediscover this
                        // edge, so preserve its ordinary unit-field notification
                        // here. The shared dispatcher seats snapshots/tokens before
                        // firing and retains its field-watcher gate.
                        if object_type == ObjectType::Unit {
                            let id = match field {
                                benilla_protocol::field::FIELD_UNIT_HEALTH => {
                                    Some(field_event::UNIT_HEALTH)
                                }
                                benilla_protocol::field::FIELD_UNIT_MAXHEALTH => {
                                    Some(field_event::UNIT_MAXHEALTH)
                                }
                                _ => None,
                            };
                            if let Some(id) = id {
                                field_notices.write(FieldNotice::Unit {
                                    guid: local.guid,
                                    id,
                                });
                            }
                        }
                    });
                if changed {
                    store.set_changed();
                }
            }
            None => {
                commands
                    .entity(entity)
                    .insert(ObjectStore(local.fields.clone().into_created(object_type)));
            }
            _ => {}
        }
        // The normal attach owner supplies model bounds/radius. Replacing
        // those with the embedding's initial None would erase its live values.
        if engine_visual {
            if let Some(motion) = motion {
                let flags = if motion.moving {
                    crate::creature_anim::move_flags::FORWARD
                } else {
                    0
                };
                let speed = if motion.moving { motion.speed } else { 0. };
                if let Some(mut movement) = movement {
                    if movement.flags != flags {
                        movement.flags = flags;
                    }
                    if movement.speed != speed {
                        movement.speed = speed;
                    }
                } else {
                    commands
                        .entity(entity)
                        .insert(crate::creature_anim::MovementState {
                            speed,
                            flags,
                            ..default()
                        });
                }
            }
            continue;
        }
        let actual_bound = local.bounds.and_then(LocalUnitBounds::aabb);
        if bound.map(|b| b.0) != actual_bound {
            match actual_bound {
                Some(aabb) => {
                    commands.entity(entity).insert(ModelBound(aabb));
                }
                None => {
                    commands.entity(entity).remove::<ModelBound>();
                }
            }
        }
        let actual_radius = local
            .selection_radius
            .filter(|v| v.is_finite() && *v >= 0.0);
        if radius.map(|r| r.0) != actual_radius {
            match actual_radius {
                Some(radius) => {
                    commands.entity(entity).insert(SelectionRadius(radius));
                }
                None => {
                    commands.entity(entity).remove::<SelectionRadius>();
                }
            }
        }
    }
}

fn mark_pick_parts(
    mut commands: Commands,
    parents: Query<&NetEntity, With<RegisteredLocalUnit>>,
    parts: Query<
        (Entity, &ChildOf),
        (With<Mesh3d>, Without<CreaturePickPart>, Without<GoPickPart>),
    >,
) {
    for (entity, parent) in &parts {
        if let Ok(net) = parents.get(parent.parent()) {
            if net.kind == EntityKind::GameObject {
                commands.entity(entity).insert(GoPickPart);
            } else {
                commands.entity(entity).insert(CreaturePickPart);
            }
        }
    }
}

fn read_selection(selection: Res<Selection>, mut local: ResMut<LocalTargetSelection>) {
    *local = LocalTargetSelection {
        guid: selection.guid,
        entity: selection.target,
    };
}

#[cfg(test)]
mod tests {
    use super::*;

    fn harness() -> App {
        let mut app = App::new();
        app.insert_resource(LocalClientSession {
            active: true,
            ..default()
        })
        .init_resource::<RegisteredUnits>()
        .init_resource::<GuidIndex>()
        .init_resource::<crate::names::NameCache>()
        .init_resource::<Selection>()
        .add_message::<FieldChanged>()
        .init_resource::<crate::field_watch::NoticeLane>()
        .add_systems(Update, register_units);
        app
    }

    fn actor(guid: u64) -> LocalUnitVisual {
        LocalUnitVisual {
            guid,
            display_id: 26,
            scale: 0.9,
            fields: ObjectFields::from_pairs(&[(2, 9), (22, 24), (28, 24), (131, 26)]),
            bounds: Some(LocalUnitBounds {
                min: [-1.0, 0.0, -1.0],
                max: [1.0, 2.0, 1.0],
            }),
            selection_radius: Some(0.7),
        }
    }

    #[test]
    fn actual_cache_descriptor_registers_its_existing_mesh_for_gameobject_picking() {
        let mut app = harness();
        app.add_systems(Update, mark_pick_parts.after(register_units));
        let guid = 0xf110_00232d_000001;
        let root = app
            .world_mut()
            .spawn((
                LocalUnitVisual {
                    guid,
                    display_id: 259,
                    scale: 1.,
                    fields: ObjectFields::from_pairs(&[
                        (0, guid as u32),
                        (1, (guid >> 32) as u32),
                        (2, 33),
                        (3, 9005),
                        (4, 1f32.to_bits()),
                        (8, 259),
                        (9, 0),
                        (14, 1),
                        (20, 35),
                        (21, 3),
                    ]),
                    bounds: None,
                    selection_radius: None,
                },
                Transform::default(),
            ))
            .id();
        let child = app
            .world_mut()
            .spawn((Mesh3d::default(), ChildOf(root)))
            .id();
        app.update();
        assert_eq!(
            app.world().resource::<GuidIndex>().0.get(&guid),
            Some(&root)
        );
        assert!(matches!(
            app.world().get::<NetEntity>(root).unwrap().kind,
            EntityKind::GameObject
        ));
        assert_eq!(
            app.world()
                .get::<ObjectStore>(root)
                .unwrap()
                .0
                .gameobject_type_id(),
            3
        );
        assert!(app.world().get::<VisualAttached>(root).is_some());
        assert!(app.world().get::<GoPickPart>(child).is_some());
        assert!(app.world().get::<CreaturePickPart>(child).is_none());
        app.world_mut().resource_mut::<LocalClientSession>().end();
        app.update();
        assert!(!app.world().resource::<GuidIndex>().0.contains_key(&guid));
        assert!(
            app.world().get_entity(child).is_ok(),
            "registration never replaces host cache geometry"
        );
    }

    #[test]
    fn external_visual_is_registered_without_spawning_or_replacing_its_model() {
        let mut app = harness();
        let guid = 0xf130_000258_000001;
        let transform = Transform::from_xyz(1.0, 2.0, 3.0);
        let root = app
            .world_mut()
            .spawn((
                actor(guid),
                LocalUnitName("Kobold Vermin".into()),
                transform,
            ))
            .id();
        let child = app.world_mut().spawn(ChildOf(root)).id();
        app.update();
        assert_eq!(
            app.world().resource::<GuidIndex>().0.get(&guid),
            Some(&root)
        );
        assert_eq!(app.world().get::<Transform>(root), Some(&transform));
        assert!(app.world().get::<VisualAttached>(root).is_some());
        assert!(app.world().get_entity(child).is_ok());
        assert_eq!(
            app.world().resource::<crate::names::NameCache>().peek(guid),
            Some("Kobold Vermin")
        );
        app.world_mut().resource_mut::<LocalClientSession>().end();
        app.update();
        assert!(!app.world().resource::<GuidIndex>().0.contains_key(&guid));
        assert!(app.world().get::<NetEntity>(root).is_none());
        assert!(
            app.world().get_entity(child).is_ok(),
            "host model survives registration teardown"
        );
    }

    #[test]
    fn external_visual_registration_never_replaces_another_objects_guid_entry() {
        let mut app = harness();
        let guid = 0xf130_000258_000001;
        let owner = app.world_mut().spawn_empty().id();
        app.world_mut()
            .resource_mut::<GuidIndex>()
            .0
            .insert(guid, owner);
        let candidate = app.world_mut().spawn(actor(guid)).id();
        app.update();
        assert_eq!(
            app.world().resource::<GuidIndex>().0.get(&guid),
            Some(&owner)
        );
        assert!(app.world().get::<NetEntity>(candidate).is_none());
    }

    #[test]
    fn external_unit_snapshot_clears_withdrawn_flags() {
        let mut app = harness();
        let mut visual = actor(0xf130_000258_000001);
        visual.fields =
            ObjectFields::from_pairs(&[(2, 9), (22, 24), (28, 24), (46, 0x0200_0000), (131, 26)]);
        let root = app.world_mut().spawn(visual).id();
        app.update();
        assert_eq!(
            app.world().get::<ObjectStore>(root).unwrap().0.unit_flags(),
            0x0200_0000
        );

        app.world_mut()
            .get_mut::<LocalUnitVisual>(root)
            .unwrap()
            .fields = ObjectFields::from_pairs(&[(2, 9), (22, 24), (28, 24), (131, 26)]);
        app.update();
        assert_eq!(
            app.world().get::<ObjectStore>(root).unwrap().0.unit_flags(),
            0
        );
    }
    #[test]
    fn engine_unit_identity_is_ready_without_assets_and_host_health_does_not_erase_packet_fields() {
        let mut app = harness();
        let guid = 0xf130_000258_000001;
        let root = app
            .world_mut()
            .spawn((
                actor(guid),
                LocalUnitEngineVisual,
                LocalUnitMotion {
                    speed: 4.5,
                    moving: true,
                },
                Transform::default(),
            ))
            .id();
        app.update();
        assert_eq!(
            app.world().resource::<GuidIndex>().0.get(&guid),
            Some(&root)
        );
        assert!(!app.world().entity(root).contains::<VisualAttached>());
        assert_eq!(
            app.world()
                .get::<crate::creature_anim::MovementState>(root)
                .unwrap()
                .speed,
            4.5
        );
        {
            let mut store = app.world_mut().get_mut::<ObjectStore>(root).unwrap();
            store.0.merge_diff(
                ObjectFields::from_pairs(&[(131, 856), (4, 2f32.to_bits()), (79, 118)]),
                |_, _, _| {},
            );
        }
        {
            let mut net = app.world_mut().get_mut::<NetEntity>(root).unwrap();
            net.display_id = Some(856);
            net.scale = 2.;
        }
        let bound = ModelBound(Aabb::from_min_max(Vec3::ZERO, Vec3::ONE));
        app.world_mut().entity_mut(root).insert(bound);
        app.world_mut()
            .get_mut::<LocalUnitVisual>(root)
            .unwrap()
            .fields = ObjectFields::from_pairs(&[(2, 9), (22, 12), (28, 24), (131, 26)]);
        app.update();
        let store = &app.world().get::<ObjectStore>(root).unwrap().0;
        assert_eq!(store.unit_health(), Some(12));
        assert_eq!(store.unit_displayid(), Some(856));
        assert_eq!(store.object_scale_x(), Some(2.));
        assert!(store.raw_fields().any(|row| row == (79, 118)));
        assert_eq!(
            app.world().get::<NetEntity>(root).unwrap().display_id,
            Some(856)
        );
        assert_eq!(app.world().get::<NetEntity>(root).unwrap().scale, 2.);
        assert!(app.world().entity(root).contains::<ModelBound>());
    }

    #[test]
    fn local_guardian_vitals_notify_after_snapshots_without_retargeting_or_polling() {
        use benilla_ui::script::{UiScript, UnitGuids};

        const ME: u64 = 0x77;
        const GUARDIAN: u64 = 0xf130_000258_000001;
        let mut script = UiScript::new().unwrap();
        script
            .run(
                r#"
                SEEN = {}
                local f = CreateFrame("Frame")
                f:RegisterEvent("UNIT_HEALTH")
                f:RegisterEvent("UNIT_MAXHEALTH")
                f:SetScript("OnEvent", function()
                    table.insert(SEEN, event .. ":" .. tostring(arg1) .. ":" ..
                        tostring(UnitHealth(arg1)) .. ":" .. tostring(UnitHealthMax(arg1)))
                end)
                "#,
            )
            .unwrap();
        let mut app = harness();
        app.init_resource::<crate::net::Reputations>()
            .init_resource::<crate::ui_party::GroupState>()
            .init_resource::<crate::ui_chat::ChatLog>()
            .init_resource::<crate::sound::MessageSounds>()
            .init_resource::<crate::ui_guild::GuildState>()
            .insert_resource(crate::net::NetCommands(crossbeam_channel::unbounded().0))
            .insert_non_send_resource(script)
            .configure_sets(Update, crate::ui_unit::UnitFeed.after(register_units));
        crate::ui_unit::add_token_seats(&mut app);
        app.world_mut().spawn((
            SelfPlayer,
            Guid(ME),
            ObjectStore(ObjectFields::from_pairs(&[]).into_created(ObjectType::Player)),
        ));
        let guardian = app
            .world_mut()
            .spawn((actor(GUARDIAN), LocalUnitEngineVisual))
            .id();
        app.update();
        let select = |app: &mut App, selected: bool| {
            *app.world_mut().resource_mut::<Selection>() = Selection {
                target: selected.then_some(guardian),
                guid: selected.then_some(GUARDIAN),
                ..default()
            };
            app.world_mut()
                .non_send_resource_mut::<UiScript>()
                .set_unit_guids(&UnitGuids {
                    player: ME,
                    target: if selected { GUARDIAN } else { 0 },
                    held: [(ME, 0), (GUARDIAN, 0)].into_iter().collect(),
                    ..default()
                });
        };
        let seen = |app: &mut App| -> Vec<String> {
            let script = app.world_mut().non_send_resource_mut::<UiScript>();
            let events = script.eval("return SEEN").unwrap();
            script.run("SEEN = {}").unwrap();
            events
        };
        select(&mut app, true);
        app.update();
        assert!(seen(&mut app).is_empty(), "create and retarget are silent");
        // Consecutive damage, healing, a max-health rescale, death and reset.
        for (health, maximum, events) in [
            (20, 24, vec!["UNIT_HEALTH:target:20:24"]),
            (17, 24, vec!["UNIT_HEALTH:target:17:24"]),
            (19, 24, vec!["UNIT_HEALTH:target:19:24"]),
            (19, 48, vec!["UNIT_MAXHEALTH:target:19:48"]),
            (40, 60, vec!["UNIT_HEALTH:target:40:60", "UNIT_MAXHEALTH:target:40:60"]),
            (0, 60, vec!["UNIT_HEALTH:target:0:60"]),
            (60, 60, vec!["UNIT_HEALTH:target:60:60"]),
            (60, 60, vec![]),
        ] {
            app.world_mut()
                .get_mut::<LocalUnitVisual>(guardian)
                .unwrap()
                .fields = ObjectFields::from_pairs(&[
                (2, 9), (22, health), (28, maximum), (131, 26),
            ]);
            app.update();
            assert_eq!(seen(&mut app), events);
        }
        select(&mut app, false);
        app.update();
        app.world_mut()
            .get_mut::<LocalUnitVisual>(guardian)
            .unwrap()
            .fields = ObjectFields::from_pairs(&[(2, 9), (22, 30), (28, 48), (131, 26)]);
        app.update();
        assert!(seen(&mut app).is_empty(), "unbound GUID has no target fan-out");
        select(&mut app, true);
        app.update();
        assert!(seen(&mut app).is_empty(), "retarget does not replay stale health events");
        let script = app.world_mut().non_send_resource_mut::<UiScript>();
        assert_eq!(script.eval::<u32>("return UnitHealth('target')").unwrap(), 30);
        assert!(script.errors().is_empty());
    }
}
