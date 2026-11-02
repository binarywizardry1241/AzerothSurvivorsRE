# Menu world composition — 0.97.2

Recovered 2026-10-18 against the supplied PE64 EXE, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This checkpoint changes source only. Nothing was built, compiler-checked, tested,
emulated or launched. Rendered and functional parity remain unverified.

The [scene driver](menu-scene-0.97.2.md) now has a real rendering destination:
`main.rs` registers the configured MPQ asset source before `DefaultPlugins`, registers
M2/WMO/ADT/WDT/BLP loaders afterward, and installs the existing `WorldPlugins`.
`menu_compositor.rs` supplies the world and UI cameras, world image and composition.
No reference EXE, fonts, MPQs or generated binary is required to build the source.
At runtime `--data-dir <directory>` / `WOW_DATA` selects the configured data.
Missing or incompatible data and backend behavior remain runtime-unverified.

## Native evidence and implementation

[Hash-bound evidence](evidence/0.97.2/menu-compositor-0.97.2.json) records eight
original PE function spans, original constants, eight REA/Ghidra records and four
complete embedded WGSL matches. The raw imports have generic GCC ABI, omit external
code/data and do not recover Rust symbols. Original Windows x64 instructions,
source-path panic records and full-PE data reads govern field interpretation.

- `140fa1d50` reads `WOW_RENDER_SCALE`, accepts finite parsed floats, defaults to1,
  and clamps to0.25..4. `140fb9050` is the case-insensitive `renderScale` change
  observer. The source retains the startup environment value until the Options row
  changes; it does not rewrite config as part of rendering.
- `140fb77e0` creates the world image. `140fb7bd0` compares dimensions, replaces
  its asset and retires the old image on resize. The recovered ratio is clamped
  against8192 on both axes before rounding, keeping aspect. Physical axes are
  at least1; a missing window uses1280×720. Native `145756e1f` supplies CRT
  `roundf`; no native instructions were executed during this task.
- The image is an R8Unorm render-attachment-only size carrier. Native image call
  `140fb7a10..140fb7a3e` supplies D2, the zero pixel and render-world usage, then
  writes attachment usage0x10 at `140fb7a43`. The FFX pass samples the world view's
  main texture, rather than this carrier image.
- `140fb87f0` retargets `WorldCamera` with
  `window_factor * built_width / physical_width`; changes to either image identity
  or factor trigger a new stamp, as does an added world camera. Its inserted mip
  bias is `min(log2(target_factor / window_factor),0)`. Source ordering keeps target
  size and factor together after window/Options input.
- `140fb7400` selects the first active world camera as the UI `FfxBackdrop.source`,
  or None. The standalone adapter gates its camera with the scene's recovered
  active-and-not-armory-masked predicate before making this claim.
- `140838a90`, bound by the current `player/setup.rs` panic record, builds the world
  camera. The four floats at `1459f7d40` are FOV PI/4, aspect1, near0.1, far3000.
  The adapter uses the shared constants, HDR, no tonemapping, world FFX and skip
  output; it creates no player/avatar/session or gameplay controller.
- `140a43d70` builds the player UI camera. The source uses order1, no MSAA,
  transparent clear, no MSAA writeback, skip output, `FfxBackdrop` and one UI gamma
  lane. The existing hero-preview camera keeps its own layer and image. Its material
  registration now reuses the shared world material plugin.

The complete `ffx_glow.wgsl`, `ui_gamma.wgsl`, `ui_node_gamma.wgsl` and
`ui_slice_gamma.wgsl` match the current EXE after converting LF to CRLF only.
The evidence records full lengths, file offsets and source/native hashes; this is
stronger than matching entry-point names or excerpts. They are reused from their
existing tracked source. The world is combined into the UI gamma target before
translucent UI, then the UI lane decodes once for the sRGB output. This avoids
changing native byte-space UI blending when the zone becomes visible.

## Reproduction and remaining limits

`python3 scripts/recover-menu-compositor.py` refreshes hash-bound textual
provenance and complete shader comparisons. `--prepare` additionally writes exact
raw slices and static REA plans inside ignored `runtime/menu-compositor-0.97.2`.
Selected plans can be passed to `python3 scripts/rea-batch.py <plan>`, which uses
`./scripts/rea` and Ghidra. The script never executes the reference or rebuilt app.
The first combined raw import could not resolve its second unseeded function;
separate exact-entry imports recovered both creation and resize functions.

Static extraction and source review completed. The new standalone registration,
Bevy schedule/resource compatibility, resize/HiDPI behavior, mask transitions,
terrain and particles, backend/GPU execution, shader pipelines and missing-data
behavior have not been run. Shared engine systems remain inherited source unless
individually revalidated; matching shaders and camera constants does not verify all
of their semantics. Broader graphics-option callbacks, hero preview and secondary
pages still have separately documented historical/unverified behavior. No current
visual, audio, Windows or interactive parity is claimed. No GitHub push is authorized
while the menu parity restriction remains in effect.
