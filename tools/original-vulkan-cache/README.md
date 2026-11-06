# Vulkan pipeline cache and gameplay tracker for the original Azeroth Survivors

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
Vulkan layer, its loader manifest, the Wine startup library and a private cache
directory in `runtime/original-vulkan-cache/`. The script downloads and verifies
the pinned Vulkan-Headers archive in scratch. For an offline build, set
`AZS_VULKAN_HEADERS` to the matching include directory.

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

To also test the Wine startup library, use `--smoke-wine` with the same Wine
runtime path. This starts Wine's command interpreter in a disposable prefix
and checks that it can write to the Windows trace path prepared at launch.
It also checks that `TRACKER=0` and unrelated executables leave the capture
off, and that two tracked launches use separate gameplay logs.

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

## Gameplay tracker

Add the following entries to the same Azeroth Survivors profile under
**Options → Environment**. You can run the gameplay tracker with or without the
shader cache layer. The tracker uses the private cache directory for capture
storage in both cases.
Use the absolute macOS path to the built startup library and the original EXE
that the profile already launches.

```text
DYLD_INSERT_LIBRARIES=/path/to/checkout/runtime/original-vulkan-cache/libAzsWineTracker.dylib
AZS_TRACKER_EXE=/path/to/AzerothSurvivors/AzerothSurvivors.exe
AZS_VK_CACHE_DIR=/path/to/checkout/runtime/original-vulkan-cache/cache
TRACKER=1
```

If the profile already sets `DYLD_INSERT_LIBRARIES`, append the library path to
its colon-separated list. Press **Play** to start the selected game with its
usual configuration and save. The startup library checks the selected original
EXE and uses the Wine bottle's existing `Z:` mapping to set the game's trace
path before Wine starts it.

Each tracked launch creates a private `session-*` directory under
`$AZS_VK_CACHE_DIR/traces/` for the game's `gameplay.log`. Set `TRACKER=0` before
pressing **Play** to turn off gameplay capture. Shader caching follows its own
settings. If the startup library cannot prepare a capture, it prints a
diagnostic to standard error and allows the game to start.

The game's `WOW_MOVE_TRACE` writer emits timestamped records as events occur.
The allowlist includes the Azeroth Survivors addon feed, combat damage and
periodic ticks, spell cooldowns, interaction and movement. The feed exposes
observable run phases, levels, boss and guardian updates, buffs, summons,
chests, banners, and run results when the game publishes them. Ordinary chat
and raw packet trace tags are excluded. Addon messages can contain player names
or other player data. Keep raw captures in the ignored workspace directory.

Use the gameplay trace's `# t0=` Unix timestamp plus each row's `t=` offset
to place events on a wall-clock timeline. Internal rules, intermediate
decisions, and unpublished state require separate recovery.

The 0.141.0 EXE contains the trace controls and the Azeroth Survivors
addon feed. The local packet route and trace tag behavior are described by
the [addon bridge recovery](../../docs/analysis/addon-bridge-0.109.0.md),
the [supplied API reference](../../docs/addon-api/reference-supplied-0.139.2.md#raw-addon-messages),
and the [Benilla trace writer](../../crates/benilla-assets/src/trace.rs). A
Wine smoke test establishes the environment handoff and file path. A capture
from an original-game session establishes which events the EXE emits in play.
