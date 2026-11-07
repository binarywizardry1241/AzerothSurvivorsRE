# menu scene engine reconstruction

Updated 2026-10-18. Authoritative target:
`AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This report records static recovery and implemented source. It does not claim a
successful build, asset load, rendered result or menu parity.

## Implemented source and integration

`crates/azeroth-survivors-re/src/menu_scene.rs` reconstructs the absent
`benilla_app::menu_scene::MenuScenePlugin` from this EXE. Its
`menu_scene/residency.rs` implements the native request counter and ready latch.
The plugin drives the shared world engine's `CurrentMap`, `WorldLive`, camera
focus and terrain query; it consumes actual `WorldLoadProgress` residency.

The composing application installs `benilla_world::world_plugins::WorldPlugins`,
the MPQ asset source/loaders and the compositor. It spawns one camera with both
`MenuSceneCamera` and shared `WorldCamera`. The scene module changes that camera's
`Transform`; camera optics, render target, active flag and FFX/UI output belong
to [the compositor](menu-compositor.md). The hero preview retains its own
camera. This module uses the existing `bevy`, `benilla-assets` and `benilla-world`
dependencies; it adds no alternate renderer or asset fallback.

The application publishes `background::MenuScene.request` before
`MenuSceneSet::Prepare`. Prepare and Camera belong to `WorldStage::Input`; the
camera runs before shared `CameraPoseSet`, which publishes its transform before
streaming. Ready belongs to `WorldStage::Present`, after the stream updates
residency. The background fade reads the ready result; a publisher that also
advances the fade before Prepare reads the previous frame's result. This frame
ordering has not been measured against the original executable.

`MenuSceneRuntime` exposes these distinct native lanes:

| API | Native meaning |
| --- | --- |
| `requested()` | Request present, before stabilization. |
| `active` | The same requested map and zone passed the three-frame gate. |
| `renderable()` | Active and not masked by the armory umbrella. |
| `ready` | Residency readiness latched for this map and zone. |
| `presentable()` | Active and ready; the mask is deliberately excluded. |

The menu app has no gameplay route. The original additionally requires
application-state tag 1 for stabilization and keeps the world live in ordinary
state tag 3. Both systems bind the same TypeID at `0x145ab05d0`: scene registration
`0x1407470b0` stores it in state slot `+0x10`; world-live registration
`0x140963bd0` stores it in `+0x8`. This standalone menu implements that fixed menu
route. The excluded gameplay state machine is not reconstructed here.

## Native plugin, request and residency

The plugin name occurs at `0x1458f6147`. Build function `0x1406d3050` registers
two descriptors: `0x1459f2a48` reaches stabilizer `0x14070f550` through wrapper
`0x140747390`; `0x1459f29a0` reaches camera driver `0x14070eb40` through wrapper
`0x140740d30`.

Setter `0x1406cc3f0` copies 40 bytes to `0x14799f51c`: enum tag at 0, map at 4,
zone at 8, eye xyz at 12, target xyz at 24 and clearance at 36. Sibling bytes are
mask `0x14799f544`, active `0x14799f545` and ready `0x14799f546`. The synchronized
helpers have separate semantics: `0x1406cc240` writes mask, `0x1406cc320` reads
active, `0x1406cc520` reads active-and-unmasked, `0x1406cc600` reads
active-and-ready and `0x1406cc6e0` reads the request discriminant.

Stabilizer `0x14070f550` compares only map and zone, allowing eye and target to
move each frame. A new identity resets its saturating u32 counter to zero and
clears active/ready. Its initial local enum tag is 2, distinct from an observed
absent request. Each unchanged observation increments the counter. At three
unchanged frames it updates an existing `CurrentMap` only if different and sets
active. At 18 unchanged frames it may latch ready, requiring:

- `WorldLoadProgress.focus_resident` (`+0x3c`) and `scene_ready` (`+0x3d`).
- Zero `colliders_pending` (`+0x10`), `merge_pending` (`+0x18`) and `gx_pending`
  (`+0x28`).

The placements counter at `+0x20` is not another condition. Once ready, the latch
stays set until identity changes. Missing progress cannot set it. The shared
source exposes these exact residency fields; the implementation consumes them.

World-live adapter `0x140963de0` writes ordinary-world-state OR stabilized menu
active. Camera gate `0x1408395f0` calls the renderable helper and writes actual
`Camera.is_active`, at `+0x100` in the native 0x110-byte Camera. `0x14093f540`
calls request-present but writes another view lane; its bool does not establish
that Camera should become active before stabilization.

## Camera and terrain clearance

`0x14070eb40` updates existing transforms and samples terrain through
`0x141716030`. It computes `wanted = max(ground_height + clearance - eye.z, 0)`
for a sample, otherwise zero, then
`lift += (wanted-lift) * min(2*delta_seconds, 1)`. Its local lift resets to zero
when inactive. This source queries shared loaded ADT terrain through
`terrain_height_under`, then uses `SceneRequest::camera_pose`.

The shared query path is verified at this seam: `0x141716030` is a 29-byte wrapper
that initializes an absent tile cache and calls `0x141716050`. The latter converts
Bevy coordinates to WoW, resolves the tile key, retrieves the streamed ADT asset
by its handle, caches the key and asset pointer, and calls height sampling on its
chunks. This matches the shared `terrain_height_under` /
`terrain_height_under_cached` path. The query does not add a WMO collider sample.

Only eye.z is lifted. `0x14070ed0c` retains original target z; `0x14070ed21` adds
lift to eye z and `0x14070ed3a` subtracts lifted eye z from original target z.
The target stays fixed as the eye clears terrain. Both positions convert from
WoW coordinates and the transform looks toward the target with Bevy up Y. The
compositor camera constructor supplies recovered 45-degree vertical field of view,
0.1 near and 3000 far planes; this transform driver does not change them.

## Armory mask identity

The mask is the native armory umbrella open flag. Its typed binding chain is:

1. Backdrop registration `0x1400a9e60`, instruction `0x1400aa02e`, passes TypeID
   `0x1458f9bb8` to the resource registrar and stores its ID in system state
   `+0x138` at `0x1400aa11e`.
2. Publisher wrapper `0x1400aa700` fetches it for `0x14009d4d0`, whose mask
   helper consumes byte `+0x72`.
3. Armory visibility registration `0x1403ace80`, instruction `0x1403acfbe`,
   passes the same TypeID and stores its ID in state `+0x40` at `0x1403ad08f`.
   Wrapper `0x1403ad2b0` passes that resource to `0x1403a1cc0`.
4. `0x1403a1d5e` reads `+0x72` to drive armory visibility. The owning diagnostic
   source is `crates\wenilla-rogue-app\src\screens\armory.rs`.
5. Picker actions `0x140099b40` open it (`0x14009a5dd`, `0x14009a7e7`,
   `0x14009a93e`) and set tab `+0x76`. Armory actions `0x1403a32d0` close it at
   `0x1403a37c0` or open a tab at `0x1403a3b19`. Escape `0x140069df0` clears it.

Raw TypeID bytes: `1b93c1cac923fd5b7ffc08f7c0a5045a`. This app maps the umbrella
to `MenuState.page != Page::Picker`, covering Character, Collection, Drop Tables,
Codex, Talents, Achievements and Rewards. Masking suppresses drawing without
clearing map residency or readiness.

## Character preview branch and lighting limit

Request-present consumer `0x140fbf8a0` was investigated before assigning meaning
to its write of enum tag 2 at resource `+0xb8`. This is a stock character-select
model-preview route. Its ordinary path reads selected roster character stride
0xe8, nineteen equipment records, seven appearance bytes, flags and pet fields,
and resets yaw at output `+0xb4` when selection changes. The request path sets
the trailing option tag to 2 and returns before that roster feed.

Registration `0x140fe0160` stores the output ID in system state `+0x18`; wrapper
`0x140fe0440` fetches it as the mutable third argument. Registrar `0x140cf52c0`
binds TypeID `0x145ab1b80` (raw bytes `da96659844906cb1465ebe5cf01c3abe`), size
0xbc and alignment 4. The field shape and feeder role correspond to the vendored
stock `char_select::refresh` model-preview path, though its current-target layout
differs from that revision. This is not evidence for a world-lighting mode.
No menu clock or lighting override was invented from this branch. Shared world
lighting belongs to the engine pipeline and its full rendered fidelity remains
unverified.

## Evidence, validation and remaining limits

[Curated evidence](evidence/menu-scene.json) contains target identity,
original function ranges/file offsets, immutable slice hashes and saved
REA/Ghidra evidence IDs. Sibling `menu-scene-0.97.2-*.asm` files preserve original
instructions. `scripts/recover-menu-scene.py --prepare` reproduces these
static slices and prepares project-local REA batch plans; without that flag it
refreshes evidence from the verified target and saved bundles. The script never
executes the target. Building the app does not require this EXE.

Source review checked the public shared-engine API and composing app's camera/fade
integration. No builds, compiler checks, compile-based tests, emulation or
original/rebuilt launches ran during this continuation, as explicitly requested.
MPQ assets, cold/warm loads, all twelve orbit scenes, clipping, mask/fade timing,
compositor output and visual/functional menu parity remain unverified. Reused
world source and matching shaders alone do not establish renderer fidelity.
