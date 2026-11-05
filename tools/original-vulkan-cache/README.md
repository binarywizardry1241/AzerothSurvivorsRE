# Vulkan pipeline cache for the original Azeroth Survivors

Benilla's native macOS build enables wgpu's Metal backend. The Windows build can
use Vulkan, with WoWSilicon's WineVulkan forwarding Vulkan calls to the macOS
loader and MoltenVK translating them to Metal. The loader in WoWSilicon 3.2.2 is
x86-64, so this layer is a macOS x86-64 dynamic library. The layer runs on the
host side of Wine's ABI boundary. [wgpu backend gates](../../third_party/wgpu-hal/build.rs)

Bevy 0.18.1 creates graphics and compute pipelines with an empty wgpu cache
field. The Vulkan backend then supplies a null `VkPipelineCache`. This layer
supplies a private Vulkan cache for those calls, leaves application-owned caches
alone, and saves compatible cache data after clean device teardown. The next
launch can reuse MoltenVK's translated shaders. The cache key includes the GPU,
driver version and pipeline cache UUID. A busy cache or a cache creation error
falls back to the ordinary call. The layer does not change shaders, render
settings or gameplay. [Bevy pipeline creation](https://github.com/bevyengine/bevy/blob/v0.18.1/crates/bevy_render/src/render_resource/pipeline_cache.rs) · [wgpu Vulkan pipeline creation](../../third_party/wgpu-hal/src/vulkan/device.rs) · [MoltenVK shader cache](https://github.com/KhronosGroup/MoltenVK/blob/main/Docs/MoltenVK_Runtime_UserGuide.md#shader-load-time)

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
Vulkan-Headers archive in scratch. Set `AZS_VULKAN_HEADERS` to an existing
Vulkan-Headers include directory to build offline.

To test the build against the bundled MoltenVK and Vulkan loader without
starting Wine or the game, run

```sh
tools/original-vulkan-cache/build.sh --smoke /Applications/WoWSilicon.app/Contents/Resources/Wine
```

The headless test creates Vulkan graphics and compute pipelines with null
caches and another compute pipeline with an application-provided cache. It
checks that the layer redirects only the two null-cache calls, saves a cache,
and gives the saved bytes to the driver in a separate process. Its temporary
cache is removed when the script finishes.

With WoWSilicon 3.2.2's bundled MoltenVK, the cold run saved 1,054 bytes.
The warm run reported two shader cache hits and one SPIR-V-to-MSL conversion
compared with three conversions on the cold run. Both runs still compiled MSL
into Metal libraries. These are headless driver counters from the smoke
fixture. [MoltenVK performance logging](https://github.com/KhronosGroup/MoltenVK/blob/main/Docs/MoltenVK_Configuration_Parameters.md#mvk_config_activity_performance_logging_style)

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

The first clean game exit can populate the cache. Shader compilation and
pipeline creation stutters are the intended target. In-game frame times need
an original-game comparison to quantify the effect.
