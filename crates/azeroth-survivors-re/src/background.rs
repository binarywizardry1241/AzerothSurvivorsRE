//! The 0.97.2 menu loading picture, scene request and transition.
//! Native functions and constants: docs/analysis/main-menu-background-0.97.2.md.

use crate::{assets::MenuArt, catalog::MenuCatalog, menu_state::MenuState, options::OptionsState};
use bevy::prelude::*;
use serde::Deserialize;

pub struct BackgroundPlugin;

impl Plugin for BackgroundPlugin {
    fn build(&self, app: &mut App) {
        app.insert_resource(SceneProfiles::embedded())
            .insert_resource(BareBackdrop(std::env::var_os("WOW_ROGUE_BACKDROP_BARE").is_some()))
            .init_resource::<MenuScene>()
            .init_resource::<BackdropSelection>();
        if app.world().contains_resource::<benilla_app::local_client::LocalStockFrontend>() {
            return;
        }
        app.add_systems(
                Update,
                (
                    drive_scene_request,
                    rebuild_backdrop,
                    hide_bare_roots,
                    fade_backdrop,
                    animate_embers,
                )
                    .chain()
                    .after(crate::options::OptionsSet::Input)
                    .before(crate::menu_scene::MenuSceneSet::Prepare),
            );
    }
}

#[derive(Resource, Deserialize)]
struct SceneProfiles {
    profiles: Vec<SceneProfile>,
}

impl SceneProfiles {
    fn embedded() -> Self {
        serde_json::from_str(include_str!("../assets/menu-background-0.97.2.json"))
            .expect("SHA-bound 0.97.2 menu scene profiles")
    }
}

/// The twelve-float result of native 145509c20 plus its selected zone identity.
#[derive(Clone, Debug, Deserialize)]
pub struct SceneProfile {
    pub key: String,
    pub map_id: u32,
    pub zone_index: u32,
    pub center: [f32; 3],
    pub radius: f32,
    pub eye_height: f32,
    pub phase: f32,
    pub amplitude: f32,
    pub period: f32,
    pub target_radius: f32,
    pub target_height: f32,
    pub radius_wave: f32,
    pub clearance: f32,
}

/// Native request payload sent by backdrop.rs to the engine's MenuScenePlugin.
/// Positions retain the original WoW coordinate convention at this interface.
#[derive(Clone, Copy, Debug)]
pub struct SceneRequest {
    pub map_id: u32,
    pub zone_index: u32,
    pub eye: Vec3,
    pub target: Vec3,
    pub clearance: f32,
}

impl SceneRequest {
    /// Native 14070eb40 lifts the eye while leaving the look-at fixed when
    /// sampled terrain enters the clearance. A missing sample targets zero lift.
    pub fn camera_pose(self, terrain_height: Option<f32>, lift: &mut f32, delta: f32) -> Transform {
        let wanted = terrain_height
            .map(|height| (height + self.clearance - self.eye.z).max(0.0))
            .unwrap_or(0.0);
        *lift += (wanted - *lift) * (delta * 2.0).min(1.0);
        let up = Vec3::Z * *lift;
        let eye = benilla_assets::coords::wow_to_bevy((self.eye + up).into());
        let target = benilla_assets::coords::wow_to_bevy(self.target.into());
        Transform::from_translation(eye).looking_at(target, Vec3::Y)
    }
}

impl SceneProfile {
    pub fn request(&self, seconds: f32) -> SceneRequest {
        let phase = seconds * std::f32::consts::TAU / self.period;
        let wave = phase.sin();
        let angle = self.phase
            + if self.amplitude < std::f32::consts::TAU {
                wave * self.amplitude
            } else {
                phase
            };
        let sin = angle.sin();
        let cos = angle.cos();
        let radius = self.radius + wave * self.radius_wave;
        let center = Vec3::from_array(self.center);
        let eye = center + Vec3::new(radius * cos, radius * sin, self.eye_height);
        let target_radius = self.radius * self.target_radius;
        let target = center
            + Vec3::new(
                -target_radius * cos,
                -target_radius * sin,
                self.target_height,
            );
        SceneRequest {
            map_id: self.map_id,
            zone_index: self.zone_index,
            eye,
            target,
            clearance: self.clearance,
        }
    }
}

/// The recovered game/engine interface. The menu scene publishes readiness
/// from real world residency after the native stabilization gates.
#[derive(Resource)]
pub struct MenuScene {
    pub enabled: bool,
    pub request: Option<SceneRequest>,
    pub ready: bool,
    selected: Option<String>,
    started: f32,
    fade: f32,
}

impl Default for MenuScene {
    fn default() -> Self {
        Self {
            enabled: true,
            request: None,
            ready: false,
            selected: None,
            started: 0.0,
            fade: 0.0,
        }
    }
}

impl MenuScene {
    fn picture_alpha(&self) -> f32 {
        let alpha = 1.0 - self.fade * self.fade * (3.0 - 2.0 * self.fade);
        if self.enabled {
            alpha
        } else {
            0.0
        }
    }

    fn cover_alpha(&self) -> f32 {
        1.0 - self.fade * self.fade * (3.0 - 2.0 * self.fade)
    }
}

fn drive_scene_request(
    time: Res<Time>,
    menu: Res<MenuState>,
    options: Res<OptionsState>,
    catalog: Res<MenuCatalog>,
    profiles: Res<SceneProfiles>,
    mut scene: ResMut<MenuScene>,
) {
    if menu.in_run {
        scene.request = None;
        scene.ready = false;
        scene.fade = 0.0;
        scene.selected = None;
        return;
    }
    // Native 14009df40 registers "1"; the environment takes precedence and
    // only a trimmed exact "0" disables the scene. "0.0" remains enabled.
    let environment = std::env::var("WOW_MENU_SCENE").ok();
    scene.enabled = environment
        .as_deref()
        .or_else(|| options.cvar("menuScene"))
        .is_none_or(|value| value.trim() != "0");
    let override_zone = std::env::var("WOW_ROGUE_BACKDROP").ok();
    let selected = if scene.enabled {
        override_zone
            .as_deref()
            .filter(|key| profiles.profiles.iter().any(|profile| profile.key == *key))
            .or_else(|| catalog.zones.get(menu.zone).map(|zone| zone.key.as_str()))
    } else {
        None
    };
    // Keep the previous world while its cover fades in. The native publisher
    // changes its retained key and clock only after fade reaches zero.
    if scene.fade <= 0.0 && selected != scene.selected.as_deref() {
        scene.selected = selected.map(str::to_owned);
        scene.started = time.elapsed_secs();
        scene.ready = false;
    }
    let speed = std::env::var("WOW_ROGUE_BACKDROP_SPEED")
        .ok()
        .and_then(|value| value.parse::<f32>().ok())
        .unwrap_or(1.0);
    scene.request = scene
        .selected
        .as_deref()
        .and_then(|key| profiles.profiles.iter().find(|profile| profile.key == key))
        .map(|profile| profile.request((time.elapsed_secs() - scene.started) * speed));
    let same = selected == scene.selected.as_deref();
    scene.fade = if same && scene.request.is_some() && scene.ready {
        (scene.fade + time.delta_secs() / 1.4).min(1.0)
    } else {
        (scene.fade + time.delta_secs() / -0.35).max(0.0)
    };
}

#[derive(Resource, Default)]
struct BackdropSelection(Option<(usize, Option<Handle<Image>>)>);

#[derive(Component)]
struct BackdropRoot;

/// Current picker-root marker shared by the picture, picker and window footer.
/// Native14007e830 hides this root lane when the startup BARE override is present.
#[derive(Component)]
pub(crate) struct PickerBackdropRoot;

#[derive(Resource)]
struct BareBackdrop(bool);

fn hide_bare_roots(bare: Res<BareBackdrop>, mut roots: Query<&mut Visibility, With<PickerBackdropRoot>>) {
    if bare.0 {
        for mut visibility in &mut roots {
            *visibility = Visibility::Hidden;
        }
    }
}

#[derive(Component)]
struct BackdropPicture;

#[derive(Component)]
struct BackdropCover;

#[derive(Component, Clone, Copy)]
struct Ember {
    base_x: f32,
    speed: f32,
    drift: f32,
    phase: f32,
}

fn fract(value: f32) -> f32 {
    // Native 0.97.2 thunk 145756e25 imports CRT truncf through IAT 1458e8450.
    value - value.trunc()
}

impl Ember {
    fn at(index: u32) -> (Self, f32) {
        let index = index as f32;
        (
            Self {
                base_x: fract(index * 0.618_034) * 100.0,
                speed: fract(index * 0.731) * 0.08 + 0.06,
                drift: (fract(index * 0.414) - 0.5) * 12.0,
                phase: fract(index * 0.293),
            },
            fract(index * 1.37) * 3.0 + 2.0,
        )
    }

    fn frame(self, elapsed: f32) -> (f32, f32, f32) {
        let progress = fract(self.speed * elapsed + self.phase);
        let envelope = if progress < 0.1 {
            progress / 0.1
        } else {
            (progress - 0.1) / -0.9 + 1.0
        };
        (
            self.drift * progress + self.base_x,
            progress * -106.0 + 102.0,
            envelope * 0.9,
        )
    }
}

fn rebuild_backdrop(
    mut commands: Commands,
    state: Res<MenuState>,
    art: Res<MenuArt>,
    catalog: Res<MenuCatalog>,
    scene: Res<MenuScene>,
    mut selection: ResMut<BackdropSelection>,
    roots: Query<Entity, With<BackdropRoot>>,
) {
    if state.in_run {
        for root in &roots {
            commands.entity(root).despawn();
        }
        return;
    }
    let image = catalog
        .zones
        .get(state.zone)
        .and_then(|zone| art.icons.get(&zone.key))
        .cloned();
    let current = (state.zone, image.clone());
    if selection.0.as_ref() == Some(&current) && !roots.is_empty() {
        return;
    }
    selection.0 = Some(current);
    for root in &roots {
        commands.entity(root).despawn();
    }
    commands
        .spawn((
            BackdropRoot,
            PickerBackdropRoot,
            BackdropCover,
            BackgroundColor(Color::srgba(0.025, 0.021, 0.018, scene.cover_alpha())),
            GlobalZIndex(-100),
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.0),
                height: Val::Percent(100.0),
                ..default()
            },
        ))
        .with_children(|ui| {
            if let Some(image) = image {
                ui.spawn((
                    BackdropPicture,
                    ImageNode {
                        color: Color::srgba(0.4, 0.38, 0.36, scene.picture_alpha()),
                        ..ImageNode::new(image)
                    },
                    Node {
                        position_type: PositionType::Absolute,
                        left: Val::Percent(-3.0),
                        top: Val::Percent(-3.0),
                        width: Val::Percent(106.0),
                        height: Val::Percent(106.0),
                        ..default()
                    },
                ));
            }
            // 1402472a0 retains the loading-picture gradient constructor.
            ui.spawn((
                Node {
                    position_type: PositionType::Absolute,
                    width: Val::Percent(100.0),
                    height: Val::Percent(100.0),
                    ..default()
                },
                BackgroundGradient(vec![
                    RadialGradient {
                        position: UiPosition::CENTER.at(Val::Percent(0.0), Val::Percent(-10.0)),
                        shape: RadialGradientShape::FarthestCorner,
                        stops: vec![
                            ColorStop::new(
                                Color::linear_rgba(0.0, 0.0, 0.0, 0.0),
                                Val::Percent(30.0),
                            ),
                            ColorStop::new(
                                Color::linear_rgba(0.0, 0.0, 0.0, 0.8),
                                Val::Percent(100.0),
                            ),
                        ],
                        ..default()
                    }
                    .into(),
                    LinearGradient {
                        angle: std::f32::consts::PI,
                        stops: vec![
                            ColorStop::new(
                                Color::linear_rgba(0.0, 0.0, 0.0, 0.0),
                                Val::Percent(60.0),
                            ),
                            ColorStop::new(
                                Color::linear_rgba(0.0, 0.0, 0.0, 0.6),
                                Val::Percent(100.0),
                            ),
                        ],
                        ..default()
                    }
                    .into(),
                ]),
            ));
            for index in 0..28 {
                let (ember, size) = Ember::at(index);
                ui.spawn((
                    ember,
                    Node {
                        position_type: PositionType::Absolute,
                        width: Val::Px(size),
                        height: Val::Px(size),
                        border_radius: BorderRadius::all(Val::Percent(50.0)),
                        ..default()
                    },
                    BackgroundColor(Color::srgba(1.0, 0.7, 0.28, 0.0)),
                    BoxShadow::new(
                        Color::linear_rgba(1.0, 0.48, 0.11, 0.5),
                        Val::Px(0.0),
                        Val::Px(0.0),
                        Val::Px(1.0),
                        Val::Px(6.0),
                    ),
                ));
            }
        });
}

fn fade_backdrop(
    scene: Res<MenuScene>,
    mut pictures: Query<&mut ImageNode, With<BackdropPicture>>,
    mut covers: Query<&mut BackgroundColor, With<BackdropCover>>,
) {
    for mut picture in &mut pictures {
        picture.color = Color::srgba(0.4, 0.38, 0.36, scene.picture_alpha());
    }
    for mut cover in &mut covers {
        cover.0 = Color::srgba(0.025, 0.021, 0.018, scene.cover_alpha());
    }
}

fn animate_embers(time: Res<Time>, mut embers: Query<(&Ember, &mut Node, &mut BackgroundColor)>) {
    let elapsed = time.elapsed_secs();
    for (&ember, mut node, mut color) in &mut embers {
        let (left, top, alpha) = ember.frame(elapsed);
        node.left = Val::Percent(left);
        node.top = Val::Percent(top);
        color.0 = Color::srgba(1.0, 0.7, 0.28, alpha);
    }
}
