# Addon frames above custom cards — 0.127.0

Finding [#11](../verification-needed.md#gap-11), selected installed target
**0.127.0**, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
This report owns the addon screen-frame interface. It does not certify complete
engine reconstruction, compilation, actual rendering/input or original/rebuilt parity.

## Native contract and existing engine boundary

The exact [embedded Lua](evidence/0.127.0/embedded-api.lua) defines
`AZS_SetOnTopOfScreens(frame, on)` and `AZS_IsOnTopOfScreens(frame)`. A frame
table supplies its `GetName()` result; a string is used directly. Setting requires
a nonempty string, follows ordinary Lua truthiness, and updates the name set.
The API sorts that set into comma-delimited `AZS_ON_TOP_FRAMES`. It promises
that the registered frame and its descendants paint above the level-up and
jewelry cards and receive their own clicks. Disabling restores normal routing.
Names are not trimmed or replaced with synthetic frame identifiers.

The retained [bridge/projection proof](evidence/0.127.0/source-frontier-native.json)
binds owners `1402138e0..140213b7e` and `1402130f0..140213828`.
The bridge reads the exact global name, converts the comma-separated string to
owned names and supplies the shared interface. The additional
[predicate/vector proof](evidence/0.127.0/ontop-interface/manifest.json) resolves
the missing interface contracts:

- `140664980..140664ec7` receives an actual cursor within window bounds,
  converts logical pixels to the 768-high UI root, and calls the existing UI
  hit helper with no extra visibility or mouse-enabled flags. Starting with
  that optional hit, it checks the current frame's optional name and every
  parent against all registered strings by length and bytes. Anonymous frames
  and named children continue upward; the nearest named frame alone is insufficient.
- `140665800..140665b3d` preserves identical vectors without a change write,
  clones replacement names, releases the previous vector and publishes the
  changed state. The setter adds no trim, sorting or deduplication of its own.

The existing benilla `UiScript` owns frame identity, generational handles,
parent/name lookup, visibility, mouse-enabled admission and the actual hit test.
This repair uses that interface rather than reconstructing layout, Lua or ECS
internals. Alphabetical registry serialization does not establish paint order;
the source retains the existing engine's frame painter order within the promoted
set. This is reuse policy, not a separately decoded native sorting algorithm.

## Source connection

The real FrameXML bootstrap includes the exact current Lua before external
addons, including after ReloadUI. The embedding identifies the registry global
through `LocalClientExtension`. The shared UI pass walks registered ancestry
for every extracted frame/region and routes its existing converted quads to a
late lane. Fonts, clipping, alpha, UVs, masks, materials and stable painter keys
stay with the existing renderer. Promoted quads are excluded from the base lane.
Registry and VM changes update classification even when the ordinary extraction
cache can reuse the converted quads; disabling, hiding and VM replacement retire
the old promoted batches.

The late camera draws after the base player-UI camera and its custom Bevy cards.
It shares the same target/usage/HDR/MSAA, loads the existing gamma main texture,
and uses the existing gamma decode. It has no world backdrop, clear, default-UI
or base-camera marker. The debug overlay retains its later, distinct camera
order. These are source scheduling choices implementing the recovered relative
layering contract, not claimed native camera constants.

Input starts from the normal FrameXML hit test and walks all parents. A
registered hit bypasses the embedding's card pointer gate while retaining the
ordinary FrameXML mouse lifecycle. Local and guest custom-card pointer handlers
observe that ownership and do not also activate the card underneath; keyboard
choice input retains its separate rules. Existing pointer-release, focus and
drag handling remain in the engine's ordinary input path.

## Validation limits

The exact 0.127.0 Lua passes **47 assertions** in the existing stub-host checker:

```sh
lua scripts/check-addon-totem-api.lua docs/analysis/evidence/0.127.0/embedded-api.lua
```

Those include the retained affix/totem cases plus registry truthiness, frame/name
identity, canonical serialization, invalid names, disabling and reinitialization.
They do not execute the real VM, renderer or input schedule. Native query
subjects, installed byte ranges and curated assembly hashes are retained in the
manifest. Authored Rust source regressions and syntax parsing do not establish
successful compilation or execution. Window resize/DPI, rendered overlaps,
live dragging/clicks, ReloadUI and original/rebuilt comparisons remain in the
verification register.
