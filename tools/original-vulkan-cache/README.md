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
preserves separate files for two launches. It checks shader and pipeline
creation, a render pass and draw, compute dispatch, barriers, queue submission,
and a heartbeat flush while the process is still running without presenting.

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
`TRACKER=0` to turn it off. Each traced launch creates a private
`tracker-*.tsv` in `runtime/original-vulkan-cache/cache/traces/` with the profile
above. The general default is `$AZS_VK_CACHE_DIR/traces/`. An absolute
`TRACKER_DIR` inside the checkout overrides the directory. The parent of a
legacy absolute `TRACKER_PATH` is used if `TRACKER_DIR` is unset.

The tracker appends and flushes a heartbeat every 60 seconds, including at
idle, outside the selected frame range, and after reaching the event size
limit. Successful presentations and normal shutdown also flush buffered rows.

| Optional setting | Effect |
| --- | --- |
| `TRACKER_START_FRAME` | First frame to include, starting at `0`. |
| `TRACKER_FRAMES` | Number of frames to include. `0` records until the size limit. |
| `TRACKER_MAX_MIB` | Event data limit from 1 to 1,024 MiB. Defaults to 64 MiB. Heartbeats continue after the limit. |

Frame numbers advance after successful presentation. Object creation and other
metadata can appear outside a selected frame range to identify objects used
inside it. Trace rows contain a sequence number, frame number, monotonic start
time, observed call duration, thread, command, and recorded fields. Handles
connect object creation, command recording and submission within a run.
Observed durations include tracing and CPU call time. The header pairs a Unix
timestamp with the monotonic nanosecond clock used by `t_ns`.

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
Full buffer, texture and pixel contents require separate evidence.

## Gameplay and frame captures

The [tracked launcher](launch-tracked.py) uses WoWSilicon's bundled Wine and the
registered original EXE. It directs the game's native Benilla trace and the
Vulkan layer into the same session directory under
`runtime/original-vulkan-cache/cache/traces/`. Each launch starts with a fresh
workspace save and configuration. The Wine prefix is reused. The EXE and its
Data remain in their registered locations. `session.json` records the verified
EXE version and hash, Wine runtime and requested capture settings.

From the checkout with the layer built, verify the launch plan with the first
command. The second command starts a fresh isolated game session.

```sh
TRACKER=1 python3 -B tools/original-vulkan-cache/launch-tracked.py
TRACKER=1 python3 -B tools/original-vulkan-cache/launch-tracked.py --launch
```

The normal WoWSilicon Play button uses the frame tracker described above. Use
the isolated launcher when the session also needs gameplay events.

The game's `WOW_MOVE_TRACE` writer emits timestamped records as events occur.
The allowlist includes the Azeroth Survivors addon feed, combat damage and
periodic ticks, spell cooldowns, interaction and movement. The feed exposes
observable run phases, levels, boss and guardian updates, buffs, summons,
chests, banners, and run results when the game publishes them. Ordinary chat
and raw packet trace tags are excluded. Addon messages can contain player names
or other player data. Keep raw captures in the ignored workspace directory.

Use the gameplay trace's `# t0=` Unix timestamp plus each row's `t=` offset
to align it with the Vulkan header's `unix_time` plus the difference between
the row's `t_ns` and the header's `monotonic_ns`. This aligns observations by
time. Internal rules, intermediate decisions, and state that the EXE does
not publish still require separate recovery.

The 0.141.0 EXE contains the trace controls and the Azeroth Survivors
addon feed. The local packet route and trace tag behavior are described by
the [addon bridge recovery](../../docs/analysis/addon-bridge-0.109.0.md),
the [supplied API reference](../../docs/addon-api/reference-supplied-0.139.2.md#raw-addon-messages),
and the [Benilla trace writer](../../crates/benilla-assets/src/trace.rs). The
native gameplay capture path requires a live check on the selected EXE.
