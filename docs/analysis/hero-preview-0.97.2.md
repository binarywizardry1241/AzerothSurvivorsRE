# Main-menu hero preview — supplied 0.97.2 EXE

Recovered and source updated **2026-10-18**. Authoritative file:
`AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This is static recovery and source implementation. No build, compiler check, test,
emulation, original launch, rebuilt launch, or visual parity comparison ran in this
session, as explicitly requested.

Owning source: [`preview.rs`](../../crates/azeroth-survivors-re/src/preview.rs),
[`preview/framing.rs`](../../crates/azeroth-survivors-re/src/preview/framing.rs), and
the target-matched [`wow_model.wgsl`](../../crates/benilla-assets/src/shaders/wow_model.wgsl).
The parent menu integration consumes the recovered constants and pane request fields.
[`main-menu-preview.md`](main-menu-preview.md) remains historical **0.92** evidence;
its Picker drag, camera-size coupling, and default-facing statements do not specify
the current implementation.

## Evidence and recovery boundary

[`recover-hero-preview.py`](../../scripts/recover-hero-preview.py)
checks the complete selected EXE hash before extracting anything. `--prepare`
extracts exact PE unwind ranges at their original virtual addresses, prepares
project-local REA/Ghidra plans, and retains textual assembly. The curated
[`hero-preview-0.97.2.json`](evidence/0.97.2/hero-preview-0.97.2.json) records
function hashes, file offsets, data, full shader equality, validation limits, and
REA Evidence IDs. Corresponding `hero-preview-0.97.2-<VA>.asm` files are retained
beside it. Raw binaries, Ghidra databases, complete decompilation bundles and
scratch searches stay under ignored `runtime/hero-preview-0.97.2/`.

REA/Ghidra recovered the request bridge, publisher, outfit resolver, body framing,
live pane, light setup, and rotation input. Two large `analyze_function` responses
exceeded REA's stdio response budget, but their complete retained Evidence exported
successfully and supplies their Evidence IDs and pseudocode. This transport limit
did not execute the target or truncate the retained analysis.

| Current native owner | Recovered role |
| --- | --- |
| `1407f29c0`, name `1458f616f`, build vtable slot `1458ee840` | Named `HeroPreviewPlugin`; bridge descriptor `145a0b5d0` |
| `140876380`, `1408767a0`, `140816b50` | Resource binding, runtime wrapper, shared request → named `dressup` pane |
| `1407a1f50`, `1407a2100` | Request setter and cached image getter |
| `1403a29f0`, `1403ab340`, `1403ab990` | Menu request publisher and resource identity |
| `145423b80`, `145459e90`, `145500d30`, `1401b0f50` | Saved class profile, outfit merge, appearance normalization, nineteen display/inventory slots |
| `140a030e0`, `140a6b970`, `1407ae0c0` | Body camera, diagonal-FOV projection, live pane root transform |
| `1408755a0`, `1408757e0`, `140897ee0` | Shared GxAspect identity, primary Window feed, pane consumer resource tuple |
| `14085ad80` | PortraitPlugin initializes that same GxAspect resource to 4/3 |
| `1408242e0`, `1418c5210`, `1416af7b0`, `14079da50`, `1407db730` | Character light creation, row packer, material light-buffer twin and lane |
| `140399640`, `1403a24c0`, `1403aa430`, `1403aa820`, `14023d600` | Initial Character yaw, held arrows, drag input, signed button speed construction |

## Request, visibility, rotation and size

The shared request at `14799fa98` is 164 bytes: a four-byte option tag,
nineteen eight-byte `CharEnumItem` records, seven appearance bytes in
race/sex/skin/face/hair-style/hair-color/facial-hair order, and one padding byte.
Yaw at `14799fb3c`, logical aspect at `14799fb40`, and physical size at
`14799fa88` are separate lanes.

The publisher requires auxiliary resource byte `+0xd == 1` and first byte zero.
It requests the hero on Picker, or when the armory umbrella is open with tab zero
(Character). Other tabs and the entering state clear the request. Clearing also
clears the bridge's dress-up look. The reconstructed preview releases its model
assets and deactivates its camera when the menu withdraws visibility.

Picker uses a fixed **0.35-radian** yaw. Character uses an independent resource,
initially **0.61 radians** (`140399d5e`, float bits `3f1c28f6`). Its TypeID bytes
`a42ca2dc8a37677822cf48fba8b15902` are identical at publisher/input blob
`1458f9ba8`, plugin lookup `14594f2e0`, and initialization descriptor `14594f4c0`.
`HeroPreview.fixed_yaw` chooses Picker's facing without overwriting stored yaw.

Native `1403a24c0` applies each pressed arrow's signed speed times
`Time.delta_secs`: **left −2.4 rad/s, right +2.4 rad/s**. Builder `14023d600`
stores those values at `14023e650`/`14023e665`, selects the matching left/right
rotation image from `14593fb10`, and publishes each speed component.
The arrow behavior is continuous while held.

Drag uses the pane's pressed Interaction and a valid cursor inside the primary
Window. It converts cursor physical X by the selected Window scale factor, records
the first held X without rotating, then adds **(current logical X − previous
logical X) × 0.012** on subsequent frames. Literal `14594f370` is float bits
`3c449ba6`. Releasing, leaving the valid cursor/pane condition, or missing the
query resets the local previous-X option. Parent menu input uses these recovered
rules; Picker does not accept this Character input.

Physical width/height are each `round(node dimension × transform column length)`,
then independently capped at 2048. Zero is preserved; the bridge skips target
resize while either axis is zero. Picker's projection aspect is logical
`width/max(height,1)`; Character's is fixed **100/122** (`14594f374`). Therefore a
per-axis render-target cap must not replace projection aspect or restart the pose.

## Framing and current light path

The body uses **raw M2 cameras[1]**, when present, with authored eye/target/roll,
FOV and clip distances. It does not fit the selected geosets. Without that camera,
`140a030e0` uses WoW-space eye **(200/36, 0, 87/36)**, aims at the **MD20 header
bounding-box center**, and uses diagonal FOV **0.5**, near **1/36**, far **5000**.
The custom projection uses an infinite reverse right-handed perspective and
`fovy = fov / sqrt(aspect²+1)`. Its update method is a no-op, preserving logical
aspect when Bevy updates target dimensions.

Authored-camera panes have root scale one. Camera-less panes use
`sqrt((25/9)/(display_aspect²+1))` (`1407af074..1407af090`). GxAspect is the
four-byte resource with TypeID blob `145ab1160`. PortraitPlugin initializes it to
**4/3** at `14085e86e` (float bits `3faaaaab`), with a byte-identical TypeID in
descriptor `1459f8200`. Current `1408757e0` reads the
primary Window's logical width/height and updates that resource when height is
positive and the difference exceeds **0.0001**. It selects scale-factor override
or base scale at Window `+0xb8/+0xbc/+0xc8`; width/height are `+0xc0/+0xc4`.
This current native path contains no `widescreen` CVar branch. The older vendored
framing comment about original WoW `gxResolution/widescreen` is not the current
EXE producer. The parent's menu feed supplies this live aspect.

Current setup `1408245f9..1408246cf` builds the character pane light with ambient
**(0.7,0.7,0.7)**, diffuse **(0.8,0.8,0.64)** and Bevy sun travel direction
**(−1,0,−0)**. Row 19's exterior dial is **0.4** (`14082466a`, literal vector
`145933ce0`); the current shader does not read that dial.
`LightBlob::model` at `1418c5210` has no prop probe. The body pane's
part adapters reach `14079da50`, which calls `1407db730` with lane zero. The twin
swaps the light buffer and retains the source material's entity selector and fog;
only nonzero lanes write selector 2.0 (Rig). Source now uses the direct model
buffer, ordinary entity Lit lane, and each parsed batch's fog policy. This
replaces the provisional SH-probe/Rig substitute.

The full current embedded `wow_model.wgsl`, file range **0x5d4aace..0x5d54524**,
is **39,510 LF bytes**, SHA-256
`580f1c318af4b387077994b4a4391c03a0fb25fb945050f20864233050b2f7be`.
Source is byte-identical. The recovered change defers tile/far/water `discard`
until after texture samples, preserving derivative helper lanes. Shader equality
does not verify the Rust material/animation inputs or rendered appearance.

## Appearance and equipment boundary

Native baseline getter `145459600` and item reader `1454598d0` revalidate exactly
**66 starting item definitions** (`1469865f0`, stride 40) and **72 race/class
nineteen-slot outfits**. Both subsets compare equal to existing
`assets/armory.json`. Its overall version remains 0.92; this proves only those
subsets, not all equipment or item behavior.

Current outfit resolver `145459e90` applies selected class gear/cosmetics before
display conversion and clears the off-hand lane for a type-17 two-handed primary
at `14545a207..14545a20c`. Publisher `1403a2b52..1403a2b62` clears the ranged slot when
either main hand or off hand is nonzero; the renderer now applies this rule.
The current save/catalog lane additionally recovers all 581 normal/PvP preview
descriptors and the Horde race 2/5/6/8 PvP first-to-second-table shift. Parent
selection uses that API; see [`menu-save-0.97.2.md`](menu-save-0.97.2.md).
Five-feature range normalization and its absence-of-catalog behavior belong to
[`appearance-0.97.2.md`](appearance-0.97.2.md); this renderer keeps their API.

## Remaining limits and static review

The request/camera/size/light/rotation changes are implemented source, with static
evidence and byte comparisons as described above. No runtime parity is claimed.
The preview still uses its existing CPU skeleton/Stand animation and rigid
attachment path rather than the target's complete streamed unit/booth rig. Full
M2 batch material animation, secondary textures/UVs, effects, billboard/ribbon/
particle riders, animation variation and transitions, and asynchronous
residency/retry/settling behavior are not established as equivalent. Batch fog is
now preserved, but correct shader bytes alone do not complete these inputs.
The selected model's visual scale/attachments/textures across every race, sex,
feature and gear choice still need a permitted original/rebuilt comparison.

Static source review checked field construction, hidden-camera gating, request
clearing, independent logical and physical dimensions, projection updates,
asset cleanup, and frame/rotation state preservation. Asset-load failure currently
reports an unavailable preview and awaits a changed look rather than reproducing
the full native asynchronous retry path. Buildability and runtime behavior were
**not checked**, at this source-recovery checkpoint.
