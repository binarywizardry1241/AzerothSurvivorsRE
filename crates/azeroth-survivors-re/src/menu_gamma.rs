//! Main-menu gamma composition over the shaders shipped in the 0.97.2 executable.
//!
//! The render-graph adapter comes from vendored benilla-app/ui_gamma.rs. Its three WGSL files
//! are reused in place and match the SHA-bound 0.97.2 EXE after LF/CRLF conversion only;
//! offsets and digests are in docs/analysis/evidence/0.97.2/menu-compositor-0.97.2.json.
//! Bevy UI emits gamma-space color and this final pass decodes it once for the sRGB output.
//! The preview's separate float image receives an identity decode for ordinary ImageNode input.
//! Per-view uniforms keep that conversion separate from the Options display-gamma ramp.

use bevy::core_pipeline::core_2d::graph::{Core2d, Node2d};
use bevy::core_pipeline::core_3d::graph::{Core3d, Node3d};
use bevy::core_pipeline::FullscreenShader;
use bevy::ecs::query::QueryItem;
use bevy::prelude::*;
use bevy::render::camera::ExtractedCamera;
use bevy::render::diagnostic::RecordDiagnostics;
use bevy::render::extract_component::{ExtractComponent, ExtractComponentPlugin};
use bevy::render::render_graph::{
    NodeRunError, RenderGraphContext, RenderGraphExt, RenderLabel, ViewNode, ViewNodeRunner,
};
use bevy::render::render_resource::binding_types::{sampler, texture_2d, uniform_buffer_sized};
use bevy::render::render_resource::*;
use bevy::render::renderer::{RenderContext, RenderDevice, RenderQueue};
use bevy::render::view::ViewTarget;
use bevy::render::{Render, RenderApp, RenderStartup, RenderSystems};
use bevy::ui_render::graph::NodeUi;
use bevy::ui_render::ui_texture_slice_pipeline::{
    init_ui_texture_slice_pipeline, UiTextureSlicePipeline,
};
use bevy::ui_render::{init_ui_pipeline, UiPipeline};

use benilla_world::final_pass::FinalPassTarget;

/// Marks the camera whose target holds the gamma-composited UI, with the [`DisplayGamma`]
/// exponent the decode applies.
#[derive(Component, Clone, Copy, ExtractComponent)]
pub(crate) struct UiGammaLane {
    /// The clamped `gamma` CVar; `1.0` is the identity ramp.
    pub(crate) gamma: f32,
    display_ramp: bool,
}

impl Default for UiGammaLane {
    fn default() -> Self {
        Self {
            gamma: DEFAULT_GAMMA,
            display_ramp: true,
        }
    }
}

impl UiGammaLane {
    /// Decode a raw-gamma model image before ordinary Bevy UI samples its linear texture.
    pub(crate) fn model() -> Self {
        Self {
            gamma: 1.0,
            display_ramp: false,
        }
    }
}

#[derive(Resource, Clone)]
struct GammaShaders {
    decode: Handle<Shader>,
    node: Handle<Shader>,
    slice: Handle<Shader>,
}

/// Display exponent consumed by the shipped UI decode shader. The inherited engine adapter's
/// CVar observer is replaced here by the owned OptionsState accessor.
#[derive(Resource, Debug, Clone, Copy, PartialEq)]
pub(crate) struct DisplayGamma(pub(crate) f32);

/// Identity exponent: the final decode changes no displayed gamma value.
pub(crate) const DEFAULT_GAMMA: f32 = 1.0;

/// Consumer clamp inherited from the engine adapter; it does not rewrite the saved CVar.
/// The shipped shader match establishes the decode formula, not independently this clamp.
pub(crate) const GAMMA_RANGE: std::ops::RangeInclusive<f32> = 0.25..=4.0;

impl Default for DisplayGamma {
    fn default() -> Self {
        Self(DEFAULT_GAMMA)
    }
}

/// Copies the clamped gamma onto the lane camera when it changes.
fn stamp_lane_gamma(gamma: Res<DisplayGamma>, mut lanes: Query<&mut UiGammaLane>) {
    if !gamma.is_changed() {
        return;
    }
    for mut lane in &mut lanes {
        if lane.display_ramp {
            lane.gamma = gamma.0.clamp(*GAMMA_RANGE.start(), *GAMMA_RANGE.end());
        }
    }
}

fn sync_options_gamma(options: Res<crate::options::OptionsState>, mut gamma: ResMut<DisplayGamma>) {
    let value = options
        .cvar("gamma")
        .and_then(|value| value.parse::<f32>().ok())
        .filter(|value| value.is_finite())
        .unwrap_or(DEFAULT_GAMMA)
        .clamp(*GAMMA_RANGE.start(), *GAMMA_RANGE.end());
    if gamma.0 != value {
        gamma.0 = value;
    }
}

#[derive(Debug, Hash, PartialEq, Eq, Clone, RenderLabel)]
struct UiGammaLabel;

/// The decode's shared parts; the pipeline is specialised per view ([`ViewUiGammaPipeline`]).
#[derive(Resource)]
struct UiGammaPipeline {
    layout: BindGroupLayoutDescriptor,
    sampler: Sampler,
    shader: Handle<Shader>,
    fullscreen: FullscreenShader,
}

impl SpecializedRenderPipeline for UiGammaPipeline {
    type Key = TextureFormat;

    fn specialize(&self, format: Self::Key) -> RenderPipelineDescriptor {
        RenderPipelineDescriptor {
            label: Some("ui_gamma_decode".into()),
            layout: vec![self.layout.clone()],
            vertex: self.fullscreen.to_vertex_state(),
            fragment: Some(FragmentState {
                shader: self.shader.clone(),
                shader_defs: vec![],
                entry_point: Some("fs_decode".into()),
                // Specialize on the actual output: the UI target is sRGB, while the preview
                // converts its raw-gamma intermediate into a linear float image.
                targets: vec![Some(ColorTargetState {
                    format,
                    blend: None,
                    write_mask: ColorWrites::ALL,
                })],
            }),
            ..default()
        }
    }
}

/// The decode pipeline for one view, specialised on where the decode lands
/// ([`benilla_world::final_pass`]); stamped every frame, as Bevy stamps `ViewUpscalingPipeline`.
#[derive(Component)]
struct ViewUiGammaPipeline {
    id: CachedRenderPipelineId,
    ramp: Buffer,
}

fn prepare_view_pipelines(
    mut commands: Commands,
    pipeline_cache: Res<PipelineCache>,
    pipeline: Res<UiGammaPipeline>,
    mut pipelines: ResMut<SpecializedRenderPipelines<UiGammaPipeline>>,
    device: Res<RenderDevice>,
    views: Query<
        (
            Entity,
            &ExtractedCamera,
            &ViewTarget,
            Option<&ViewUiGammaPipeline>,
        ),
        With<UiGammaLane>,
    >,
) {
    for (entity, camera, target, existing) in &views {
        let format = FinalPassTarget::format(&camera.output_mode, target);
        let id = pipelines.specialize(&pipeline_cache, &pipeline, format);
        let ramp = existing.map(|view| view.ramp.clone()).unwrap_or_else(|| {
            device.create_buffer(&BufferDescriptor {
                label: Some("menu_gamma_ramp"),
                size: 16,
                usage: BufferUsages::UNIFORM | BufferUsages::COPY_DST,
                mapped_at_creation: false,
            })
        });
        commands
            .entity(entity)
            .insert(ViewUiGammaPipeline { id, ramp });
    }
}

fn init_pipeline(
    mut commands: Commands,
    render_device: Res<RenderDevice>,
    fullscreen_shader: Res<FullscreenShader>,
    shaders: Res<GammaShaders>,
) {
    let layout = BindGroupLayoutDescriptor::new(
        "ui_gamma_layout",
        &BindGroupLayoutEntries::sequential(
            ShaderStages::FRAGMENT,
            (
                texture_2d(TextureSampleType::Float { filterable: true }),
                sampler(SamplerBindingType::Filtering),
                // The exponent as a `vec4<f32>`: a uniform is 16-byte aligned, so no padding field.
                uniform_buffer_sized(false, Some(std::num::NonZero::new(16).unwrap())),
            ),
        ),
    );
    // Point sampling: this is a 1:1 full-screen resolve, never a resample.
    let sampler = render_device.create_sampler(&SamplerDescriptor {
        min_filter: FilterMode::Nearest,
        mag_filter: FilterMode::Nearest,
        address_mode_u: AddressMode::ClampToEdge,
        address_mode_v: AddressMode::ClampToEdge,
        ..Default::default()
    });
    commands.insert_resource(UiGammaPipeline {
        layout,
        sampler,
        shader: shaders.decode.clone(),
        fullscreen: fullscreen_shader.clone(),
    });
}

#[derive(Default)]
struct UiGammaNode;

impl ViewNode for UiGammaNode {
    type ViewQuery = (
        &'static ViewTarget,
        &'static UiGammaLane,
        &'static ExtractedCamera,
        &'static ViewUiGammaPipeline,
    );

    fn run<'w>(
        &self,
        _graph: &mut RenderGraphContext,
        render_context: &mut RenderContext<'w>,
        (view_target, lane, camera, pipeline): QueryItem<'w, '_, Self::ViewQuery>,
        world: &'w World,
    ) -> Result<(), NodeRunError> {
        let pipelines = world.resource::<UiGammaPipeline>();
        let pipeline_cache = world.resource::<PipelineCache>();
        let Some(decode) = pipeline_cache.get_render_pipeline(pipeline.id) else {
            // Still compiling: the UI stays undecoded, over-bright, for a frame or two.
            return Ok(());
        };
        // This frame's exponent as `[g, 0, 0, 0]`; the shader reads `.x`.
        let mut exponent = [0u8; 16];
        exponent[..4].copy_from_slice(&lane.gamma.to_ne_bytes());
        world
            .resource::<RenderQueue>()
            .write_buffer(&pipeline.ramp, 0, &exponent);
        // The public engine helper preserves the camera's output/viewport policy.
        let out = FinalPassTarget::resolve(camera, view_target);
        let layout = pipeline_cache.get_bind_group_layout(&pipelines.layout);
        let bind = render_context.render_device().create_bind_group(
            "ui_gamma_decode",
            &layout,
            &BindGroupEntries::sequential((
                out.source,
                &pipelines.sampler,
                pipeline.ramp.as_entire_binding(),
            )),
        );
        // The perf journal buckets this span's name into `gpu_ui`.
        let diagnostics = render_context.diagnostic_recorder();
        let scissor = out.scissor_rect();
        let mut pass = render_context
            .command_encoder()
            .begin_render_pass(&RenderPassDescriptor {
                label: Some("ui_gamma_decode"),
                color_attachments: &[Some(out.destination)],
                depth_stencil_attachment: None,
                timestamp_writes: None,
                occlusion_query_set: None,
            });
        if let Some((x, y, w, h)) = scissor {
            pass.set_scissor_rect(x, y, w, h);
        }
        let span = diagnostics.pass_span(&mut pass, "ui_gamma_decode");
        pass.set_pipeline(decode);
        pass.set_bind_group(0, &bind, &[]);
        pass.draw(0..3, 0..1);
        span.end(&mut pass);
        Ok(())
    }
}

/// Puts the menu's Bevy UI tree on the shipped gamma lane. Bevy UI has no color-space hook,
/// so this swaps the
/// `shader` handle [`UiPipeline`] and [`UiTextureSlicePipeline`] clone into every specialisation
/// for vendored gamma-emitting copies, once, after their init systems.
fn use_gamma_ui_shaders(
    shaders: Res<GammaShaders>,
    mut node: ResMut<UiPipeline>,
    mut slice: ResMut<UiTextureSlicePipeline>,
) {
    node.shader = shaders.node.clone();
    slice.shader = shaders.slice.clone();
}

pub(crate) struct UiGammaPlugin;

impl Plugin for UiGammaPlugin {
    fn build(&self, app: &mut App) {
        let shaders = {
            let mut assets = app.world_mut().resource_mut::<Assets<Shader>>();
            GammaShaders {
                decode: assets.add(Shader::from_wgsl(
                    include_str!("../../benilla-app/src/shaders/ui_gamma.wgsl"),
                    "menu/ui_gamma.wgsl",
                )),
                node: assets.add(Shader::from_wgsl(
                    include_str!("../../benilla-app/src/shaders/ui_node_gamma.wgsl"),
                    "menu/ui_node_gamma.wgsl",
                )),
                slice: assets.add(Shader::from_wgsl(
                    include_str!("../../benilla-app/src/shaders/ui_slice_gamma.wgsl"),
                    "menu/ui_slice_gamma.wgsl",
                )),
            }
        };
        app.insert_resource(shaders.clone());
        app.init_resource::<DisplayGamma>()
            .add_plugins(ExtractComponentPlugin::<UiGammaLane>::default())
            .add_systems(Update, (sync_options_gamma, stamp_lane_gamma).chain());
        let Some(render_app) = app.get_sub_app_mut(RenderApp) else {
            return;
        };
        render_app.insert_resource(shaders);
        render_app
            .init_resource::<SpecializedRenderPipelines<UiGammaPipeline>>()
            .add_systems(RenderStartup, init_pipeline)
            .add_systems(
                Render,
                prepare_view_pipelines.in_set(RenderSystems::Prepare),
            )
            .add_systems(
                RenderStartup,
                use_gamma_ui_shaders
                    .after(init_ui_pipeline)
                    .after(init_ui_texture_slice_pipeline),
            )
            .add_render_graph_node::<ViewNodeRunner<UiGammaNode>>(Core2d, UiGammaLabel)
            // Decode the finished UI before its output blit.
            .add_render_graph_edges(
                Core2d,
                (Node2d::EndMainPass, UiGammaLabel, Node2d::Upscaling),
            )
            // And after Bevy UI, which writes gamma into the same target: upstream orders `UiPass`
            // only against `EndMainPass` and `Upscaling`, leaving it unordered against the decode.
            .add_render_graph_edge(Core2d, NodeUi::UiPass, UiGammaLabel)
            // The preview's raw-gamma model target is decoded to linear for Bevy ImageNode;
            // the UI node shader restores gamma before the shared final UI decode.
            .add_render_graph_node::<ViewNodeRunner<UiGammaNode>>(Core3d, UiGammaLabel)
            .add_render_graph_edges(
                Core3d,
                (Node3d::Tonemapping, UiGammaLabel, Node3d::Upscaling),
            );
    }
}
