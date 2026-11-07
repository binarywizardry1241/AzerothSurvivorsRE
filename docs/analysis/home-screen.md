# Home-screen source recovery

**Later integration checkpoint (2026-10-18):** playable-level integration followed this source checkpoint. The [live adapter and validation report](playable-zones.md) owns the new builds/tests, twelve-zone captures and remaining engine/presentation/persistence gaps. Source-only/no-adapter statements below describe the preceding recovery checkpoint; they are not current application status. Full native parity remains unverified.

Updated **2026-10-18**. Target `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This is an implemented source checkpoint, **not verified 1:1 menu parity**.

## Recovered and connected source

- [Catalog](menu-catalog.md): nine classes, eight races, twelve ordered zones,
  112 abilities, 148 enemy labels and 60 boss records. Shred and the current Druid
  pool replace the old picker data. Displayed version/revision are `0.97.2` / `43fe5ff8`.
- [Actions](menu-actions.md): Support, Discord, locale-name toggle, Options
  and direct Quit. Support opens the native `https://wow.aethus.pl/support` URL.
  No external link was opened during recovery.
- Root `140097180` places the controls outside the design canvas: absolute
  right16/top16, gap10, layer5001. `140245750` supplies automatic button sizes,
  padding18/8, text15, and the separate Discord button padding14/8/icon24×18.
  The source removes fixed English-width coordinates. Credit/version text uses
  font12, bottom10, left/right14 in window coordinates. Popup layer5003 comes
  from the native language-toggle wrapper.
- Shell `14024d6d0` revalidates full-size column, padding48/18, rowgap14,
  centered heading gap2, growing pane row with gap22/minheight0, and footer gap7.
  `14024a960` revalidates the heading/tab row and tab padding14/5, border1/radius5.
  Class pane `140241ed0` revalidates the three-column grid, gaps22/12, stat cards
  padding9/6, and wrapping34px spell icons. Retaining those source values is
  supported by this target rather than a claim based on old RVAs. Class-caption
  helper `140244c40` additionally supplies explicit no-wrap TextLayout for12px
  labels; that policy is now connected without guessing CJK-specific widths.
- Zone constructor `14024b870` supplies a growing bounded row, gap4, then a
  column list with minheight0, rightpadding4, rowgap4 and vertical Scroll overflow.
  Cards clip their background children, use border2/radius9 and unselected
  minheight38; the selected content uses padding14/7 and gap2. The source now
  attaches the shared8px scrollbar and the native `picker-zones` cache key.
- Selected-card system `140096af0` supplies one pending visibility adjustment
  requested by content-pane update `14009b220`. Its proven Pick-snapshot change
  branch is connected through an independent resource, so opening a popover or
  resizing/redrawing global controls does not itself request another adjustment.
  The entering-state byte and Save-change invalidation are now also connected. The
  consumer waits for unique positive-height list/card nodes,
  compares transformed top edges in logical units, and moves only the necessary
  distance, clamped to content overflow. A card taller than the viewport aligns
  to its top without an invented margin. The source runs after UI layout;
  full native invalidation/schedule equivalence and rendered interaction remain unverified.
- Shared wheel `140072320` consumes all messages, converts Line×40 and Pixel×1,
  restores newly added named lists from the retained map, adjusts hovered lists,
  clamps to logical content minus viewport, and updates the named cache. The
  source connects both zone and language lists. Existing Options/Achievements
  consumers retain their separately recovered ownership. Exact native input
  fallback, query membership, schedule and all overlapping-root cases remain
  unverified; source modal gates are stated explicitly in `scrollbar.rs`.
- [Languages/fonts](menu-localization.md): thirteen exact catalogs of
  2,621 entries, bounded scrolling popup, Japanese fonts, Romanian accents and
  Ukrainian glyph augmentation. Native fonts remain optional user runtime data.
- [Backdrop](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/main-menu-background-0.97.2.md): exact `menuScene` choice/default,
  environment gate, twelve zone profiles, orbit requests, camera clearance and
  readiness fade. The loading picture, gradients and28 embers were independently
  revalidated against the new target. The [scene driver](menu-scene.md)
  and [world compositor](menu-compositor.md) now connect actual MPQ world
  loading, native stabilization/residency, armory masking, corrected eye-only
  terrain lift and world-to-UI gamma composition. The source integration is
  uncompiled and has not been rendered or compared with the target.
- Native count/selection policies cap unlocks at12. The authored menu-state
  regression check now reads81 count and 216 selection results from unchanged
  current-target instructions, replacing the historical nine-zone oracle.

## Evidence and reproduction

[`home-native.json`](evidence/0.97.2/home-native.json) records exact original PE
function spans, byte hashes, literal bytes, available REA/Ghidra IDs, analyzed
body coverage and limitations. `scripts/recover-home.py --prepare` creates
project-local raw slices and REA plans under ignored `runtime/analysis/history/interface/menu-0972/ae941624b762`.
Run selected plans with `python3 scripts/rea-batch.py <plan>`; `--collect` refreshes
curated provenance without launching the target. Named function roles are analyst
interpretations bound to instruction/data consumers, not recovered Rust symbols.

Raw Ghidra imports omit referenced code/data and use a generic GCC ABI. Original
Windows x64 disassembly and full-PE constant reads control argument and field
interpretation. The large class dossier exceeded the MCP response budget after
successful analysis; its complete retained export was collected, without rerunning
that operation. Path-insensitive stack snapshots under runtime were used only as
leads; manually checked stores govern the source values above.

## Validation and open work

SHA-bound catalog regeneration/check and locale/font/table extraction succeeded.
297 native zone-policy observations are retained with explicit lookup/allocation
seams. They establish those bounded policies, not save migration or rendering.

One locked/offline Apple Silicon application compilation completed in **14.61s**
(`runtime/analysis/history/interface/menu-0972/ae941624b762/build.log`), with existing unused-code/future-compatibility
warnings. During this task another active work stream updated `AGENTS.md` to
source/static-only mode. The build had finished when cancellation was attempted;
no further compilation, compiler checks, compile-based tests or launches were
performed. Later source/fixture additions are **not compile-validated**. No
original/rebuilt UI, audio device, external URL, network updater or installed save
was launched. Windows and rendered/interactive comparison were not run.

The source-only continuation also recovers current Enter pre-launch state, hover
filtering and [talent data/allocation](talents.md), including Cat/Dire Bear
capstone restrictions. Its recovery, source integration and static review ran
without any build, compiler check, test, emulation or game launch. The earlier
14.61s compilation above predates this continuation and validates none of its
new scene/compositor or menu behavior.

The next source-only pass recovers [hero-preview framing/lighting](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/hero-preview-0.97.2.md),
[appearance commands](appearance.md) and
[save/name/ownership normalization](menu-save.md) against the current EXE.
Those reports own the exact newly revalidated portions and remaining gaps.
The separately authorized [player abilities](player-abilities.md) are source
components without a menu-to-gameplay adapter. No builds or launches ran in that pass.

Missing/unverified: compiled/rendered terrain/world/compositor, selected-card
scheduling, complete secondary-page geometry/behavior, full save/progression and
PvP presentation, complete hover/pressed/input priority, multilingual wrapping,
pixel comparison and audible/platform adapters. Unrevalidated portions retain
their0.92 provenance. Compilation/data presence does not establish appearance or
functional parity. GitHub remains private and Actions disabled.
