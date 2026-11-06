# Vulkan pipeline cache for the original Azeroth Survivors

Benilla's native macOS build enables wgpu's Metal backend. The Windows build can
use Vulkan, with WoWSilicon's WineVulkan forwarding Vulkan calls to the macOS
loader and MoltenVK translating them to Metal. The loader in WoWSilicon 3.2.2 is
x86-64, so this layer is a macOS x86-64 dynamic library. The layer runs on the
host side of Wine's ABI boundary. [wgpu backend gates](../../third_party/wgpu-hal/build.rs)

Bevy 0.18.1 creates graphics and compute pipelines with an empty wgpu cache
field. The Vulkan backend then supplies a null `VkPipelineCache`. This layer
supplies a private Vulkan cache for those calls, leaves application-owned caches
alone, and saves compatible cache data during play. The next launch can reuse
MoltenVK's translated shaders. The cache key includes the GPU, driver version
and pipeline cache UUID. A busy cache or a cache creation error falls back to the
ordinary call. [Bevy pipeline creation](https://github.com/bevyengine/bevy/blob/v0.18.1/crates/bevy_render/src/render_resource/pipeline_cache.rs) · [wgpu Vulkan pipeline creation](../../third_party/wgpu-hal/src/vulkan/device.rs) · [MoltenVK shader cache](https://github.com/KhronosGroup/MoltenVK/blob/main/Docs/MoltenVK_Runtime_UserGuide.md#shader-load-time)

The worker takes its first snapshot about two seconds after the first cached
pipeline call and checks for newer work every 30 seconds. It serializes the
Vulkan cache under its existing lock and writes the file after releasing that
lock. Device teardown saves any remaining changes. A failed write or a snapshot
above 32 MiB preserves the previous cache file.

The registered 0.141.0 EXE zeros the render cache field at `0x144992701` and
the compute cache field at `0x1449941d0`. The render Vulkan HAL passes the
resulting null cache in RDX at `0x144d9e050`, then calls the dispatch slot at
`0x144d9e059`. The loader fills that slot with `vkCreateGraphicsPipelines` at
`0x144e3efea..0x144e3effd`. The layer itself uses the Vulkan loader ABI rather
than EXE-specific offsets. [Registered EXE identity](../../docs/analysis/target-refresh-0.141.0.json)

## Build

Run `tools/original-vulkan-cache/build.sh` from the checkout. This produces the
layer, its loader manifest and a private cache directory in
`runtime/original-vulkan-cache/`. The script downloads and verifies the pinned
Vulkan-Headers archive in scratch and generates the trace wrappers from its
Vulkan registry. For an offline build, set `AZS_VULKAN_HEADERS` to the matching
include directory and `AZS_VULKAN_REGISTRY` to its `registry/vk.xml` if it sits
outside the headers checkout.

To test the build against the bundled MoltenVK and Vulkan loader without
starting Wine or the game, run

```sh
tools/original-vulkan-cache/build.sh --smoke /Applications/WoWSilicon.app/Contents/Resources/Wine
```

The headless test creates Vulkan graphics and compute pipelines with null
caches and another compute pipeline with an application-provided cache. It
waits for a published file while the Vulkan device is alive, exits without
destroying the device, and checks that a second process loads the file. The
second process checks that the layer redirects only the two null-cache calls.
Its temporary cache is removed when the script finishes.
The test also checks that `TRACKER=0` creates no trace and that `TRACKER=1`
records shader and pipeline creation, a render pass and draw, compute dispatch,
barriers, and queue submission.

With WoWSilicon 3.2.2's bundled MoltenVK, the cold run published 1,054 bytes
before teardown and the warm run loaded them. An earlier run with MoltenVK
performance logging reported two shader cache hits and one SPIR-V-to-MSL
conversion on the warm run, compared with three conversions on the cold run.
Both runs compiled MSL into Metal libraries. [MoltenVK performance logging](https://github.com/KhronosGroup/MoltenVK/blob/main/Docs/MoltenVK_Configuration_Parameters.md#mvk_config_activity_performance_logging_style)

## WoWSilicon

In the Azeroth Survivors profile, keep the MoltenVK driver and add these entries
under **Options → Environment**, using absolute macOS paths.

```text
WGPU_BACKEND=vulkan
VK_ADD_LAYER_PATH=/path/to/checkout/runtime/original-vulkan-cache
VK_INSTANCE_LAYERS=VK_LAYER_AZS_pipeline_cache
AZS_VK_CACHE_DIR=/path/to/checkout/runtime/original-vulkan-cache/cache
```

If the profile already enables Vulkan layers, append this name to the existing
layer list. To return to the previous launch path, remove the entries added for
this layer. No game directory files are involved. WoWSilicon passes the profile's
environment to its Wine command. [WoWSilicon launch source](https://github.com/WoWSilicon/WoWSilicon/blob/v3.2.2/Sources/WoWSiliconSwift/Services/LaunchService.swift#L476-L485)

Shader compilation and pipeline creation stutters are the intended target.
In-game frame times need an original-game comparison to quantify the effect.
For diagnostics, `AZS_VK_CACHE_TRACE=1` prints device cache availability and
snapshot results to standard error.

## Frame tracker

Add `TRACKER=1` to the WoWSilicon profile's environment before launching. Set
`TRACKER=0` to turn it off. The layer writes a tab-separated trace to
`tracker.tsv` in `AZS_VK_CACHE_DIR` unless `TRACKER_PATH` supplies an absolute
path. Each traced launch replaces the previous trace at that path. A second
process cannot write to a trace file in use.

| Optional setting | Effect |
| --- | --- |
| `TRACKER_START_FRAME` | First frame to include, starting at `0`. |
| `TRACKER_FRAMES` | Number of frames to include. `0` records until the size limit. |
| `TRACKER_MAX_MIB` | File limit from 1 to 1,024 MiB. Defaults to 64 MiB. |

Frame numbers advance after successful presentation. Object creation and other
metadata can appear outside a selected frame range to identify objects used
inside it. Trace rows contain a sequence number, frame number, monotonic start
time, observed call duration, thread, command, and recorded fields. Handles
connect object creation, command recording and submission within a run.
Observed durations include tracing and CPU call time.

The wrappers cover registry commands in the supported host Vulkan dispatch
chain, including graphics and compute pipelines, render passes, bindings, draws,
dispatches, resource operations, barriers, queue submission and presentation.
The detailed fields include shader fingerprints and entry points, attachment
formats and sizes, blend/depth/raster state, viewport and scissor state, and
submission handles. The trace preserves scalar arguments and selected handle
arrays for other commands. Arrays and event lines have bounds, so a large call
can have omitted fields. Loader-global calls and platform interfaces outside
the host coverage remain outside the trace.

For a menu comparison, follow `vkCmdBeginRenderPass` or `vkCmdBeginRendering`
through pipeline binds, draws, queue submission and `vkQueuePresentKHR`. Use
the same options and scene in both builds. The tracker observes Vulkan calls
through Wine and MoltenVK. RE's direct Metal backend needs its own capture.
Trace rows describe GPU commands and their setup, while game logic and full
buffer, texture and pixel contents require separate evidence.
