# Menu scene, composition and shared input — 0.109.0

Selected installed EXE SHA-256:
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
[verification-needed](../verification-needed.md) owns gap #17; this report owns its backdrop,
menu-scene, shared-scrollbar and GameWindow portions. The [manifest](evidence/0.109.0/menu-fidelity/manifest.json)
records current PE ranges, original-byte hashes, canonical assembly, selected
Ghidra pseudocode and REA provider identities. Historical filenames retain their
original provenance; current reuse below follows fresh installed-byte recovery.

## Scene and world lifetime

Current backdrop publisher `14007c2e0` calls profile selector `1459a77c0` and
publishes the same 40-byte request: tag, map, zone, eye, target and clearance.
All twelve current 240-byte zone records and all 144 profile floats match the
retained `menu-background-0.97.2.json` source input. The profile selector is a
frameless leaf, bounded explicitly at `1459a7991`, rather than by the next
unwind entry. Native request instructions were replayed for all twelve zones
at four positive/zero/negative times with declared `sinf`/`cosf` math seams.

`menuScene` defaults to `1`. `WOW_MENU_SCENE` precedes the CVar; only trimmed
exact `0` disables the scene. The selected world key changes only when the
previous fade has reached zero. `WOW_ROGUE_BACKDROP` selects a known zone key;
`WOW_ROGUE_BACKDROP_SPEED` parses a floating point orbit multiplier. The current
publisher retains the 1.4-second readiness fade, 0.35-second fallback fade and
`1-f*f*(3-2*f)` picture/cover alpha. Black mode removes the picture alpha and
world request while retaining the dark base. A failed/missing world load is
not replaced by a synthetic readiness timer.

Current `MenuScenePlugin` build `140830c10` binds stabilization `14084ff50`
and camera driver `14084f860`. Stabilization compares map and zone, activates
at three unchanged frames and latches readiness from frame eighteen. Readiness
requires loader bytes `+3c/+3d` and zero collider/merge/GX pending counters at
`+10/+18/+28`. The `+20` placements counter is not a separate gate. Readiness
survives later dirty loader fields until identity/admission changes. The
counter saturates. Camera clearance lifts only the eye, with the original
look-at retained and smoothing factor `min(2*delta,1)`.

Current request/mask/active/renderable/ready helpers are separately bound:
`140811850`, `1408116a0`, `140811780`, `140811980`, `140811a60` and
`140811b40`. Armory masking affects renderability without tearing down
residency or clearing readiness. The selected request-present consumer
`140bd69b0` suppresses the stock character-select preview lane, independently
of the reconstructed hero preview.

The current world-live publisher `1409abfc0` combines ordinary client state
`2` **OR** stabilized menu-active. Source previously had two writers: the
client wrote false before the Net stage, and the menu overwrote true later.
That exposed a false falling edge to world teardown every menu frame. Source
now retains `LocalMenuSceneActive` and lets the existing pre-Net publisher
write the combined value. The menu publishes its retained lane, not a second
`WorldLive` value. Actual first-activation scheduling and world-loader/GPU
execution remain runtime validation.

## Loading picture and bare picker

Current loading-picture constructor `140244c60` and ember updater `140078780`
revalidate the existing absolute −3%/106% image bounds, gamma tint, radial and
linear gradients, twenty-eight particles and truncation-based fractional
arithmetic. The picture remains visible until real scene readiness. Native
particle motion, color and gradient records remain connected to `background.rs`.

The startup-only `WOW_ROGUE_BACKDROP_BARE` override was missing. Its presence,
including an empty value, registers `14007e830`, which writes Hidden (`1`) to
picker-root visibility. The filter's zero-size component TypeID is
`19255c156b09fd712b7bb48c6479072b`: current bare query `14038d4f0` and picker
root query `140385dc0` register the same component through `1402c7490`.
Picker rebuild initialization `1400836b0` consumes that root query; its live
owner `140074b60` creates the loading picture and picker/window-footer roots.
Source splits those native roots between `background.rs` and the first two
`menu.rs` root spawns. `PickerBackdropRoot` tags these corresponding roots;
the startup presence value drives their shared visibility writer. Separate
Armory overlay roots retain their own ownership.

## Shared scrollbar

ScreensPlugin `140186ac0` registers the global four-stage chain:
wheel `140197330`, begin `1401982b0`, continue `140196df0`, then visual
synchronization `1401964a0`. Its ordering target is the frontend poll, not a
modal run condition. SystemTypeSet TypeID
`59a80baef35bd02ce1508356898f3ad9` binds FunctionSystem vtable `145de69a0`
through type getter `1401a5370` to runner `14019e4f0` and poll `140191820`.
Configuration helper `14013d450` appends DependencyKind::After (`1`). The
[canonical frontend poll](evidence/0.109.0/menu-fidelity/frontend-poll.c) is
shared with the Discord lifecycle report; it is not duplicated there.

Source now follows that four-stage Update chain after the client feed.
Invented updater/page gates were removed from the shared queries. `InputScope`
remains a construction-site compatibility argument; it does not impose an
extra Options, Armory, Picker or Language predicate. Separate page-specific
wheel owners and their actual gates remain in their owning modules.

The fallback collection is now bound to actual Bevy `Touches`, rather than
inferred from its record shape. Begin initializer `14019c680` obtains its
read-only resource through `1400321f0`, using TypeID
`59142ee2089a069b9d97891a40800fae`. The current InputPlugin registers the same
128-byte resource through `1445617b0` at `1445639b9`; the shipped Bevy 0.18.1
source-location record binds this call to `lib.rs`'s `Touches` initialization.
The mutable resource at begin-state `+5d0` is the separate drag state, not
Touches. Both drag bodies iterate the first pressed-touch map using current
leaf `14361df00..14361df39`.

A valid, in-bounds window cursor precedes the first active touch. Touch
positions are already logical; window cursor coordinates divide by its scale.
Held left mouse **or** any pressed touch keeps a drag alive. Thumb press
changes precede track presses; a track starts only when no drag exists. The
wheel retains physical window-cursor admission, maximum hovered stack index,
40-pixel lines, pixel units, named offset cache and logical clamps. The source
continues to use Bevy's actual query/change detection and touch backend.

## Window and composition

The actual custom namespace is `window::GameWindowPlugin`, not a guessed
`screens::window` owner. Build `140186aa0` registers a singleton-window
validation system and title writer `14018d8e0`. The writer iterates all Window
components, compares the exact seventeen bytes `Azeroth Survivors`, and writes
only on mismatch. `game_window.rs` now supplies that live writer. The other
registered system validates its singleton query; this evidence does not
justify an invented icon, positioning or window-configuration operation.

Current WorldBackdropPlugin `140bfa200` binds startup creation `140c039d0`,
resize `140c03dc0`, retarget `140c04400`, active-camera claim `140c035f0`,
startup scale default `140beb6a0` and CVar observer `140c04c60`. Current source
uses the same finite startup override, 0.25–4 scale range, 8192-axis ratio
ceiling, rounded dimensions, one-pixel minimum and 1280×720 missing-window
fallback. The R8Unorm render-attachment-only image is a size carrier; FFX
samples the world view. Retarget derives logical scale from built width and
physical width, re-stamps on changed asset/factor or a new camera, and inserts
`min(log2(effective_scale),0)` mip bias. The first active world camera claims
the UI backdrop; none clears the claim. Current world-camera construction
`140c14230` retains PI/4 FOV, aspect 1, near 0.1 and far 3000.

The CVar observer uses a different numeric contract from the legacy CVar
record. It trims Unicode whitespace through `140089200`, then strictly parses
the complete string as Rust `f32` through `145bdb8d0`; invalid input becomes
zero before the 0.25–4 clamp. Source previously called the record's prefix
parser, so `2junk` incorrectly produced 2 and leading whitespace produced
zero. The observer now uses the recovered trim/parse path. Native complete
observer cases confirm `2junk` → 0.25, ` +2.5 ` → 2.5, Unicode whitespace,
exponents, infinities, NaN preservation and ASCII case-blind exact-name
admission. Startup's finite-only environment contract remains distinct.

All four complete current `ffx_glow`, `ui_gamma`, `ui_node_gamma` and
`ui_slice_gamma` shader byte streams match the actual source after LF→CRLF
conversion only. Source uses the existing world/UI compositor and gamma lane.
These matches do not certify unexecuted backend/render-graph behavior.

## Validation and boundaries

`python3 -B scripts/check-menu-fidelity.py` verifies current target and
retained range/file hashes, replays **128 native instruction cases**, checks
all four complete shaders and checks selected source connections. These are
twelve profiles, forty-eight orbit payloads, readiness/identity/pending/latch
cases, sixteen world-live truth/change-tick cases and seven cursor/touch
branches, plus fourteen complete render-scale observer/trim/f32-parser cases. The checker declares math, mutex and ECS seams for the other contracts. It neither starts
an EXE nor compiles the reconstruction. `--prepare-rea` emits project-local
raw function carriers and Ghidra plans for reproducibility.

Eight affected Rust modules passed syntax-only rustfmt parsing. No `cargo
check`, compiling tests, build, original/rebuilt launch, interactive input,
HiDPI/resize/rendering, Windows or gameplay comparison ran. Remaining #17
page work is owned separately; the selected source connections here still
require compilation and original/rebuilt interaction/rendering validation.

Current WorldHold was also traced to `140a6fbe0`: its held branch shifts two
Instant fields per 104-byte timer record and one f64 deadline per 32-byte hash
entry. Their cooldown/aura producer types are not bound here. No selected menu
owner requires a guessed replacement; this precise shared-engine provenance
boundary remains under #41, separate from the scene and scrollbar repairs.
