# Custom-menu hero booth

Target: installed 0.109.0, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report owns the menu-preview source connection under #17. Historical
[0.97.2 preview recovery](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/hero-preview-0.97.2.md) retains its own target;
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall status.

The menu previously used a synchronous, separate CPU mesh and animation renderer.
That path omitted the existing client's full asynchronous character assembly,
animated rig, camera-facing eye/item cards, attached effect models and particle
riders. Asset failure latched until the look changed. Those were concrete source
limitations, independent of a rendered comparison.

## Selected native ownership

Current diagnostic `crates/benilla-app/src/portrait/hero_booth.rs` binds
`140c17470..140c19989`. Four exact original-VA ranges were decoded through
REA/Ghidra. Their canonical assembly, pseudocode, full hashes, profile/Evidence
IDs and independent instruction boundaries are in the
[manifest](evidence/0.109.0/hero-preview/manifest.json).

The current implementation uses its own **`hero`** booth, not the historical
`dressup` token. The bridge reads the custom request through `14058d450`, creates
an image/camera/root, consumes the completed shared dressing-room bake revision,
and maps body parts, riders, billboard cards and effects separately. It retains
the previous completed bake while the requested models or material twins are
unready. A withdrawn request drops the booth and clears the image publication.
The source now follows this through `portrait/hero_booth.rs` and the real shared
`DressUpPreview`/`DressUpBake` assembler, rather than duplicating that assembler.
The menu resolves the current native baseline and all 19 equipment/cosmetic lanes
into one nineteen-slot request before crossing the engine boundary. Its shared
resolver, starter overrides, tabards and separate menu-only ranged suppression
are documented in [equipment persistence](save-gear.md).

The bridge feeds the shared request after ordinary UI dressing-room feed and
before entity visuals; it only claims that input while a custom-menu request is
active. The engine display cache includes that body without requiring a live
world entity. Its completed bake reaches the `hero` booth after assembly and UI
paint, before camera gating. Ordinary in-run dressing-room ownership resumes when
the custom request is withdrawn. The two previews use different booth roots and
render layers.

Current `140bcb130` supplies the shared body camera/projection. The source uses
the existing `body_frame` and `pane_root_scale`, including raw M2 camera 1 and
its fixed-camera fallback. The fixed root-scale numerator is the actual f32
result of `(4/3)*(4/3)+1` (`0x4031c71d`), one ULP above a directly rounded `25/9`.
Using the shared helper also removes that difference from the old CPU menu path.

The current native dimension branch promotes each zero axis to one for initial
allocation. Later resize is skipped only when **both** raw axes are zero; a
single zero axis is promoted to one. The older report's both-positive requirement
is not reused as current proof. Logical projection aspect remains independent of
physical target dimensions. Native root rotation and non-authored root scale
remain independent of reassembly, so drag, held turn buttons and window changes
do not restart the model's rig.

Material twins preserve the original entity shade lane and fog policy while
binding the native fixed character light. Its buffer joins the existing rig
palette mirrors so GPU skinned meshes and rigid equipment share the same pose.
The booth uses existing hand-grip/global-sequence sampling, body/rider/card
attachment, attached effect rigs, particle spawning, camera-facing cards and
texture/pipeline settling. It does not add a second animation implementation.
The previous CPU path remains only for the pre-existing separate world adapter
and the asset-check utility; it is no longer the menu renderer.

## Static checks and limits

`python3 -B scripts/check-hero-preview.py` checks the current installed
hash and all four native ranges, retained REA evidence and complete decoder
boundaries. **34** bounded cases execute the original no-call instructions:
25 zero/nonzero dimension pairs and nine fallback-root-scale aspects. Fixtures
provide only registers, stack and exact native literals. No native external
function, OS call, filesystem operation, Lua VM or application is reachable.

Rustfmt parses the new engine module and menu adapter without compiling. Source
review checks the request/assembler/cache/booth/image consumers, scheduling,
separate render layers, zero-size handling, hidden-request teardown, retry,
material lane and palette/light ownership. Two additional current withdrawn-request
branch fixtures verify its active-state clear, booth/pane map removal requests,
image publication clear and size/revision reset. Hash/map misses and ECS command
submission are explicit seams. The branch performs no material-twin or fixed-light
cache disposal; the source retains those reusable resources across menu reentry,
while removing the camera/root and public image. This does not certify the full
shared material/cache backend's current-target equivalence. These checks do not prove buildability
or visual parity.

The shared assembler, rig, materials, effects, FFX and graphics/platform consumers
are now connected, but their complete selected-target ownership remains under
#41. Their presence is not proof of current native equivalence. Compilation,
actual UI input, asynchronous residency and GPU rendered behavior, all equipment
combinations and original/rebuilt presentation comparison remain unverified.
No compiler, build, compiling test, original game or reconstructed game ran.

## Retained reports

[0.97.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/hero-preview-0.97.2.md)
