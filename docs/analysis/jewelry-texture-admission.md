# Jewelry rim and socket texture admission

This report owns the source repair for **gap #53**. The authoritative target is
Azeroth Survivors **0.113.2**, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
Current implementation status belongs to [verification-needed](../verification-needed.md).
The [earlier presentation report](addon-presentation-gaps-2026-10-23.md) retains
the supplied screenshot context and the original input hashes.

The missing five rims and attached rail have a shared source cause: the
reconstruction rejected TGA dimensions at or above 1024 before assigning or
decoding the texture. The unchanged addon's rim atlas is 1024×256 and its rail
atlas is 2048×256. The selected target accepts these dimensions. The repair
changes the shared admission helper to the recovered nonzero **1–8192 inclusive**
range on each axis, including non-power-of-two images. It does not modify the
addon, its textures, its anchors or its draw order.

## Selected-target native contract

The [native manifest](evidence/0.113.2/jewelry-texture-admission.json) binds exact
source ranges, byte hashes, selected Ghidra dossiers and unchanged addon inputs.
The full canonical decoder extract is [tga-decoder.asm](evidence/0.113.2/tga-decoder.asm).

| Owner | Selected range | Static result |
| --- | --- | --- |
| Sprite load | `0x142207a10..0x1422082fa` | Candidate bytes are read; BLP2 magic dispatches to BLP, otherwise `0x142207c15` calls TGA decode at `0x145c30ed0`. The path into that call has no legacy power-of-two/below-1024 size gate. |
| TGA decode | `0x145c30ed0..0x145c31e46` | Width and height are unsigned 16-bit header values. Each passes `lea dimension-0x2001; cmp 0xffffe000; jb reject` at `0x145c31088..0x145c310aa`, equivalent to `1 <= dimension <= 8192`. |

REA/Ghidra Evidence IDs are
`ev_8d84a28b7229704f47902b39c7b1d97d7f19363f6aa52874a0c6748a02c37539`
(sprite load) and
`ev_e00d6bf1c877653be7c7a4d90742e2a588bc4b8a9a97e64250de0cfc4a6395cc`
(TGA decode). Both functions match selected PE exception-directory boundaries.
These were exact raw-function imports through `./scripts/rea` with Ghidra;
external data/callees and source names/types are absent from those imports.
This is static recovery, with no observation of original-game execution.

The native existence probe at `0x142207780..0x142207990` checks the loose/archive
candidates without reading a TGA header. The reconstruction still shares a
memoized header check with its rendering loader. For these complete, valid
artwork inputs, the corrected dimensions give the same successful verdict;
malformed-image/failure-policy compatibility is not established here. The
historical alpha-admission issue belongs to **#54** and is independent of these
three type-2, 32-bit, eight-alpha-bit images.

## Live source and presentation path

The examined project-local runtime addon copies have the same script and image
hashes recorded in the original report; this work did not read or change the
external addon installation. `core/core.lua::GetInfoOrCons("tex")` retains the
legacy `Interface\AddOns\-DragonflightReloaded\media\tex\` prefix. Addon
inventory and UI loading use the same configured `AddOns` root.

The concrete route is:

1. `benilla-app/src/ui_script/lifecycle.rs::install_addon_asset_resolvers`
   installs that root in `WorldAssets`, and binds `SpriteProbe` and
   `sprite_dimensions` to the same loose-file/MPQ chain as the renderer.
   `LooseFiles::find` resolves the backslash path through the addon's root,
   matching each component without case sensitivity; it has no image-size or
   extension-copy filter. The three complete files exist in the runtime copy.
2. `SpriteProbe::found` reads the TGA header through `tga_texture_size`. The old
   dimension predicate refused `Frame.tga` and `SocketRail.tga` here.
   `region/paint.rs::apply_texture_name` preserves the preceding texture on a
   failed verdict, so a newly created rim or rail region remained empty.
   Correct admission assigns the requested path normally.
3. `WorldAssets::sprite_texture_opened` and the size probe use the same helper
   before `tga_to_rgba`. Therefore correcting only the Lua verdict would not
   have repaired the renderer: the shared helper now admits both consumers.
   Sprite handles/misses are cached by normalized stem; addon-root changes
   invalidate addon/miss entries, install-index generation changes invalidate
   loose entries, and the VM installs a fresh header probe on UI loading.
4. All three images use descriptor `0x08`: bottom-origin uncompressed BGRA,
   with eight alpha bits. The existing type-2/32-bit branch flips rows and
   preserves byte 3 as alpha. The exact authored crops contain visible pixels:

   | Image | Crop in top-origin decoded pixels | Transparent / partial / opaque alpha |
   | --- | --- | --- |
   | `Frame.tga` | x106–178, y56–128 | 1751 / 2773 / 660 |
   | `SocketRail.tga` | x0–1200, y0–152 | 120904 / 9840 / 51656 |
   | `SocketDetached.tga` | x0–160, y0–160 | 15444 / 1924 / 8232 |

5. `jewelry.lua` creates one rim per each of its five slots, in an `OVERLAY`
   frame at HUD level +3. Icon/artwork owners sit at +1. The rim is centered
   on its slot, has size `43*72/86` and the exact 72×72 crop above. In detached
   mode the already admissible 256×256 socket texture is shown in `BACKGROUND`
   at `43*40/36` around each slot. Attached mode intentionally hides those
   detached textures and shows `bars.lua`'s single `SocketRail.tga` instead.
6. `UpdateDisplay` reparents the HUD to the bar or detached owner, updates its
   scale/frame levels, and selects the rail/socket visibility. `OnShow`,
   `OnHide`, `Refresh` and `SetJewelryBarShown` preserve that state. Ordinary
   frames do not impose a parent-bounds clip, so the rail extending above the
   action bar and rims extending beyond 32-unit slot buttons are retained.
7. `benilla-ui/src/script/extract.rs` carries the assigned path, rect, owner
   scale/alpha and UV crop into `QuadContent::Texture`. Its effective visibility
   and region-hidden gates honor the attach/detach/show/hide state. The app
   extractor selects the normal sprite route, keeps the UVs, applies the
   half-texel crop clamp and emits the quad. `ui_pass.rs` sorts the supplied
   frame/layer key, clips only against the explicit clip, and samples the
   uploaded image with its alpha. No additional missing jewelry-specific
   source consumer or contradictory geometry/visibility branch was found.

Inventory contents and jewelry hover data remain **#55**; this decorative-art
repair does not publish or fabricate equipped items.

## Checks and remaining limits

The non-compiling checker verifies target/range hashes, exhausts all **65,536**
possible unsigned 16-bit dimensions against the recovered native comparisons,
and compares that range to the Rust source admission bounds on both axes. With
the optional runtime input root, it also verifies all recorded script/image
hashes and independently decodes/counts the three exact cropped alpha regions:

```sh
python3 -B scripts/check-jewelry-texture-admission.py
python3 -B scripts/check-jewelry-texture-admission.py --addon-root runtime/menu-state/AddOns/-DragonflightReloaded
```

Both checks passed, as did scoped `git diff --check`. Existing Rust gate/asset
fixtures were updated for the large atlases, non-power-of-two dimensions,
8192 endpoints, 8193 rejection and zero rejection; those compiling tests were
**not run**. Source tracing and offline pixel checks do not execute Rust or the
addon and do not demonstrate rendering or native parity.

No remaining concrete source/recovery defect was found in the selected
decorative-art route. The parent gap stays open for compilation and actual
rendering comparisons of all five rims, attached rail and detached sockets
across move/scale, attach/detach, hide/show and ReloadUI. No build, game/addon
launch, Lua execution, or original/rebuilt visual comparison ran.
