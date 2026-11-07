# Addon texture and character-inventory gaps

Current #53 source status: [the 0.113.2 admission repair](jewelry-texture-admission.md) replaces the legacy atlas-size gate. The inspection and target identity below retain their historical context; [verification-needed](../verification-needed.md) owns current status for #53–#55.

These findings own gaps **#53–#55** in [verification-needed](../verification-needed.md).
The inspected reconstruction source is `54ab94c`. Installed reference discovery
still finds unregistered **0.112.5**, SHA-256
`445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36`;
0.112.0 recovery does not certify that target. The findings below come from
supplied screenshots, existing reconstruction logs and source/file inspection,
not a new native recovery or controlled original/rebuilt comparison.

SurvivorsDragonUi **3.2.29-survivors** is installed under the legacy
`-DragonflightReloaded` identity. Its relevant runtime-copy scripts and assets
match the installed addon byte-for-byte. The examined scripts are
`modules/ui/{jewelry,run,character}.lua`; their SHA-256 values are respectively
`1b33be9e0ad4ac53cb8780a414ac8299535497aac55f2cee1aac653b3b91b607`,
`c1dc11d27e99d40b70bff0fbf26e7b7f8004bc2aeaa1072c7a6cfb007bbf3083`, and
`8fc6558b3992cdb90173328591a6a440231e5dd27622ffd7235c2b00db0ff695`.
These addon inputs remain unchanged. They are not bundled with this report.

## #53 — Jewelry rims and socket artwork missing

The HUD screenshot shows five circular empty-item silhouettes without the
expected surrounding jewelry rims/attached socket rail. The action-bar border,
ability icons and other tally icons still render. Missing item contents and
missing decorative artwork are separate paths; inventory publication is #55.

The addon uses `core/core.lua::GetInfoOrCons("tex")` to build the legacy
`Interface\AddOns\-DragonflightReloaded\media\tex\` prefix.
`modules/ui/jewelry.lua` assigns `jewelry/Frame.tga` to an OVERLAY frame three
levels above its HUD, cropped to x106–178/y56–128. Detached mode uses
`SocketDetached.tga`; `modules/bars/bars.lua` assigns the attached `SocketRail.tga`
and switches it through `SetJewelryBarShown`. The files exist in both examined
copies and have complete uncompressed type-2, 32-bit payloads with eight declared
alpha bits:

| Asset under media/tex/jewelry | Dimensions | SHA-256 |
| --- | --- | --- |
| Frame.tga | 1024×256 | `48959a41a8345f3a4bed88243d7c20872467cb6caf4974a43e669055c095a33c` |
| SocketRail.tga | 2048×256 | `968bfa0b470fbac501d7b8e5072c14e7895780c6175d80617d591593baca4e3d` |
| SocketDetached.tga | 256×256 | `93360239e348b8db3cd3ce1df421684fe89d75f23c7501b8537e530d32f4be3f` |

No missing-file or invalid-header cause is established for these assets. Trace
[loose-file resolution and sprite caching](../../crates/benilla-assets/src/world_assets/mod.rs),
[VM asset probes](../../crates/benilla-app/src/ui_script/lifecycle.rs), region
visibility/parent/frame-level/draw-layer propagation and
[quad extraction/ordering](../../crates/benilla-app/src/ui_pass.rs). Check the
actual rim/rail quad bounds, UVs, alpha and clipping before choosing a repair.
Their eight-alpha-bit headers differ from the concrete coin refusal below;
there is no evidence that one decoder change accounts for both symptoms.

Closure requires all five rims and the attached rail, plus detached sockets,
to render with the unchanged addon across attach/detach, move/scale, hide/show
and ReloadUI. Compare the actual target at the same scale and state. The supplied
Guardians screenshot is additional UI context; its visible icon, names and Alive
labels alone do not establish a separate guardian-state or backdrop defect.

## #54 — Gold atlas rejected and replaced by white

Current source status: [0.113.2 decoder repair](addon-gold-texture.md). The following screenshot/log/source finding is historical. Native replay now admits the unchanged atlas and preserves its alpha; rendered comparison remains open.

The screenshot shows a solid white rectangle in the gold tally. The addon’s
`modules/ui/run.lua` requests `chat/cleaner_coins.tga`, then uses its top-left
quadrant through `SetTexCoord(0, 0.5, 0, 0.5)`. Both examined copies contain the
same 16,402-byte file, SHA-256
`7e2b57533361f224e01171dbc857247b04096fdc33e58364901b230b75b270be`.
Its header is type2, 64×64, 32bpp, descriptor **0x20**: top-origin and **zero
declared alpha bits**. This is distinct from absent artwork.

The reconstruction’s [tga_to_rgba](../../crates/benilla-formats/src/tga.rs)
at the inspected revision required truecolor depth = 24 + declared alpha bits,
rejecting this exact header. [decode_candidate](../../crates/benilla-assets/src/world_assets/mod.rs)
substitutes opaque white when the size gate admits a TGA whose decode fails.
An existing reconstruction log independently records the matching result at
2026-10-23 11:57:55.552992 UTC:

```text
Texture interface\addons\-dragonflightreloaded\media\tex\chat\cleaner_coins.tga not loaded -- replaced with default.
```

The compact excerpt is retained here; its source was
`runtime/client/ship-evidence/game.log:28`. This is existing evidence, not a fresh launch
or controlled correlation of the screenshot with that process. The decoder’s
comments cite a historical Vanilla client; that is not proof of the current
Azeroth Survivors loader contract. A reported case indicates that the original game
loads this unchanged atlas successfully. Recover/revalidate selected-target
TGA admission and pixel/alpha handling, then verify the whole loose-file →
SetTexture → decode → cropped tally path. Fix ownership is the reconstruction’s
asset compatibility layer; changing the addon or rewriting its atlas would
conceal the reported compatibility gap. Close only after the unchanged atlas
renders gold with the target’s transparency and no default-texture warning.

## #55 — Visible outfit never reaches the C-panel inventory

Current source status: [0.113.2 equipped-inventory repair](equipped-inventory.md). The publication absence below describes the inspected revision. Actual worn items, temporary jewelry, item queries and tooltip text now have a source producer; compiled/client/rendered comparison remains open.

The character screenshot shows an equipped 3D model while its paper-doll buttons
show generic slot silhouettes, including rings/trinkets. A reported case describes missing
equipped items in the addon’s C panel. A rendered outfit does not prove that the
inventory API has actual item instances, templates, icons or links.

The [gameplay client adapter](../../crates/azeroth-survivors-re/src/gameplay/client.rs)
resolves `GearSave::outfit` into display rows/metadata and visible item entries.
[LocalPlayer::player_fields](../../crates/benilla-app/src/local_client/player.rs)
publishes those entries in `PLAYER_VISIBLE_ITEM_*`. The inspected AS host had no
producer for the corresponding `PLAYER_FIELD_INV_SLOT_*` GUID pairs and equipped
ItemCreate/template records. The ordinary client can consume ItemCreate events;
that consumer does not supply the missing host publication.

[ui_char::inventory_slots/slot_view](../../crates/benilla-app/src/ui_char.rs)
requires a nonzero `player_inv_slot`, a corresponding object in `Objects`, then
its entry/template and ItemDisplayInfo icon.
[GetInventoryItemTexture/Link/Quality](../../crates/benilla-ui/src/script/char_stats.rs)
read that inventory snapshot. The addon’s `modules/ui/character.lua` preserves
native paper-doll behavior and skips its quality border when
`GetInventoryItemTexture("player", slot)` is nil. This explains a source-level
publication gap without attributing the failure to addon code. The same inventory
route can affect jewelry contents/hover data; it does not explain decorative
rim textures (#53). The custom picker’s `gear.*` image loading (#52) is another
independent consumer.

Recover the actual target’s equipped-item identities, slot mapping, instance and
template publication, event order and removal/update lifetime. Keep worn equipment
separate from cosmetic outfit overrides; the current appearance rows alone are
not a safe inventory specification. Close by checking real saved worn items in
C-panel icons/links/quality/tooltips and jewelry getters, plus equip/unequip,
new-run and ReloadUI updates, with correct model appearance and no fake items or
addon-specific fallback.

## Validation limits

Only read-only addon/source/header inspection, copy/hash comparisons and review
of existing logs were performed. No addon files, assets or saved variables were
modified. No addon checks, Lua execution, Rust compilation, compiling tests, game
launch or original/rebuilt runtime comparison ran. The installed-identity probe
succeeds; reconstruction coverage accounting still rejects the unregistered
0.112.5 target under #41. Documentation links and permanent gap numbering are
checked separately from behavior.
