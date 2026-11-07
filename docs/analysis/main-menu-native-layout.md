# 0.92.0 picker Node reconstruction

Current **0.97.2 source recovery (2026-10-18)** is owned by [the home-screen checkpoint](home-screen.md). It connects current controls/placement, catalogs, thirteen locales/fonts, scrolling and scene interfaces. The report below remains explicitly historical0.92 evidence; final source changes have no new runtime/parity comparison, and source/static-only mode prohibits further compiler checks and launches.

Updated 2026-10-16. Target `AzerothSurvivors/AzerothSurvivors.exe`, embedded 0.92.0, SHA-256 `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.

`crates/azeroth-survivors-re/src/picker.rs` now reconstructs the picker using the executable's flex/grid Nodes instead of measured absolute pane coordinates. This is implemented layout recovery, **not a claim of 1:1 visual or functional parity**. The preview renderer has a separate owning report, [main-menu-preview.md](main-menu-preview.md).

## Evidence method

`scripts/extract-menu-native-slices.py` validates the reference SHA and obtains exact function byte boundaries from the PE exception directory `RUNTIME_FUNCTION` records. For leaf functions without unwind metadata, an explicit `--range START:END` is separately labeled as a bounded interval rather than a proven function boundary. It copies those bytes to a project-local derived artifact without modifying the reference. `scripts/rea-batch.py` opens each derived artifact with REA's Ghidra provider, `format=raw-binary`, `architecture=x86_64`, `entry_point=original VA`. Each result and evidence export stays under `runtime/menu-recovery/rea-<VA>/`.

Curated records, REA evidence IDs, the Node field offset map, manually bound literals and candidate stack snapshots are in [picker-node-layout.json](evidence/0.92/picker-node-layout.json). Slice provenance files alongside it bind each derived SHA, original VA and original file offset back to the reference SHA. Full binary slices, Ghidra sessions and large disposable exports remain under ignored `runtime/`.

Bevy 0.18.1 `Node` has size384 in the project metadata, with width at136, height144, padding216, border248, radius280, flex_basis312, row_gap320, column_gap328, flex_grow348 and packed enum fields370–381. The native code's 384-byte copies and explicit stores match that layout. `Val` is tag/payload: Auto0, Px1, Percent2. This is a source/type-layout binding inference cross-checked against native stores, not recovered original Rust source.

Important limits:

- Raw Ghidra imports use the x86_64 GCC compiler specification although the original uses Windows x64. Decompiled cross-function argument signatures are therefore provisional; layout values come from original instruction stores, register/stack ABI and original PE constants.
- Slices exclude callees and referenced data. Referenced constants were read separately from the SHA-bound original PE.
- The disposable literal stack tracker is path-insensitive. Its output is labeled candidate snapshots; only manually confirmed writes were implemented. Unknown/dynamic data remains unknown.
- Some larger analysis responses exceeded the tool transport limit after successful analysis. Their successful canonical records were recovered from the exported evidence bundle; they were not reinterpreted as failed native analyses.

## Implemented native layout values

| Native function | Meaning | Recovered values used |
| --- | --- | --- |
| `0x140207f90` | Whole picker shell | Full width/height, Column, horizontal padding48, vertical18, row gap14, centered children; heading group gap2; pane row gap22 and flex-grow1/min-height0; footer gap7 |
| `0x140205500` | Game heading and seven tabs | Title font54; tab font15; row gap8; tab padding14 horizontal/5 vertical, border1, radius5 |
| `0x14011a470`, `0x14011dd10`, `0x14011cbd0` | Class, hero, zone wrappers | Flex basis0, grow1/1.18/1, min-height0, padding18 horizontal/14 vertical, Column gap12 |
| `0x1400a1ce0` | Common framed pane | Border1/radius10; frame RGB(.427,.333,.145); PI gradient RGBA(.078,.059,.035,.90) to (.031,.024,.016,.93); black .6 shadow offsetY14, blur40 |
| `0x1401e83a0` | Common pane heading | Font22, horizontal separator rules |
| `0x1401fd0e0` | Class pane | Three-column grid, column gap22, row gap12, vertical padding4, centered; name22, blurb15/MUTED/min-height40; class labels selected class RGB/unselected MUTED; stat row gap8, cards padding9/6, border1/radius6, label11/value16; wrapping spell grid gap5, icons34/border1/radius4 |
| `0x14011a8c0`, `0x1401ffe50`, `0x14011a2a0` | Class icon and label | Column gap5, centered; size60 literal at `0x1401fd8dd`, border2/radius8, label12; actual art is `UI-CharacterCreate-Classes.blp` with native pixel Rects, not `ClassDef.icon` |
| `0x14020b380` | Hero identity and racial info | Identity row gap18, top padding6; portrait124×168, border2/radius12; class badge46, right−6/bottom−4; faction badge left−8/top−6, padding7/1, border1/radius10; detail Column gap8; name row height42/border1/radius6; input horizontal padding10; Random horizontal padding12, left border1; fonts23/17/13; race row gap12, icon44/border1/radius6, detail gap3/fonts20 and14 |
| `0x1401fa130`, `0x14020aaa0`, `0x1453dff40` | Equipment | 11 candidate slots `[0,2,4,9,8,5,6,7,15,16,17]`, filtered to the selected class's available gear slots (Warrior9), each40×40/border2/radius5, gap4; action row gap12; worn item icons and collection count bind to actual save ownership |
| `0x140206410`, `0x14011ce80`, `0x14020f910` | Zone list and cards | List gap4; outer border2/radius9; unselected minimum height38; selected inner padding14/7 and Column gap2; unselected padding12/1; selected title25/subtitle14/blurb13/enemies12/boss tag11; unselected title19 |
| `0x140203cb0` | Enter/footer | Action row gap18; Enter padding56 horizontal/top10/bottom9, border2/radius8; title32/subtitle13, control hint13 |
| `0x140201e50`, `0x140127000` | Main canvas/background | Design1600×900, max scale1.6; oversized background image left/top−3%, size106%, native opaque tint, radial+linear vignette; 28 deterministic animated embers implemented |

The HEALTH card directly formats selected ClassDef record+0x80 in `0x1401fd0e0` (`0x1401fe326` address, `0x1401fe357` formatter), confirming the extracted base-health field. It does not display a gear/talent total at that site. Additional static style/health bindings are in [picker-style-values.json](evidence/0.92/picker-style-values.json).

Native overlay stores outside the picker shell are also recovered: top-right controls right16/top16/column gap10; credits left14/bottom10 and version right14/bottom10, both font12. Their parent integration is owned by `menu.rs`.

The native canvas fit system was identified independently at `0x14006c640` by the Options audit. It computes the minimum of logical window/design width, logical window/design height and the screen's maximum scale, with a small positive lower clamp. The small positive lower clamp is0.1. The main canvas maximum is1.6, while Options uses1.4 for1060×700.

The companion scale system `0x14006d9e0` queues `0x1401b89f0` → `0x1402387f0` → `0x140326310`; the specialized bundle lookup `0x1402f99a0` names the exact type `Propagate<ComputedUiRenderTargetInfo>` at originalVA `0x14590166b` (length76). The component contains physical viewport width/height and scale `fit × camera.target_scaling_factor × UiScale`; its command has an additional insertion-mode bool. The native left/top offsets are `((logical_window / fit) - design) ×0.5`. The new `canvas.rs` reproduces that route using Bevy's typed reflection API for the component's crate-private fields, then normal hierarchy propagation. The main-menu and Talents canvases are separate UI roots with this component; their old UiTransform bitmap scaling was removed. See [canvas-preview-native-paths.json](evidence/0.92/canvas-preview-native-paths.json) for the type binding, REA IDs and limits. The parent's build7 and1600×900 client capture rendered this route successfully; visual parity remains unestablished.

## Remaining parity gaps

The implemented picker retains existing catalog-driven menu behavior, class/race eligibility, name editing, spell inspection, page navigation, zone eligibility and preview selection resources. It adds the parent's drag-to-turn marker to the real 3D portrait. The following are incomplete or unverified:

- Font paths were confirmed by native `0x14006b7a0`: FRIZQT__ for the first font handle and MORPHEUS for the second. The engine overrides those paths with embedded Cyrillic variants and applies a21-entry Polish/Turkish glyph transform; the owned runtime provider is now implemented, with English/Polish runtime capture proof in build14. See [main-menu-fonts.md](main-menu-fonts.md). Native text stores use weight400 and smoothing1, matching Bevy Normal/AntiAliased. Selected Latin Friz glyph outlines/advances were compared between MPQ and EXE-embedded fonts: most are identical; changed whole-file hashes do not by themselves explain apparent font weight. Curated metadata/hashes only are in [menu-font-metadata.json](evidence/0.92/menu-font-metadata.json). The shipped UI gamma shaders were subsequently matched to the EXE and an owned gamma-lane adapter rendered successfully in build9 after separate UI roots received explicit z-order. The common pane additionally converts its sRGB inputs back to raw sRGB and stores them as LinearRgba gradient stops; that exact color path is now implemented, and later picker captures show the restored brown pane tones. See [panel-gradient-color-path.json](evidence/0.92/panel-gradient-color-path.json). Exact line heights, remaining text colors, icon clipping and all hover states remain under comparison. The 28 native background particles now render in build15; see [main-menu-background.md](main-menu-background.md). The static class helper also now supplies selectedscale1.06, class-color alpha.75 glow(spread2/blur16), unselectedblack alpha.85 shadow(y4/blur10), and unselectedatlas tint(.74,.72,.68). The earlier zone clip was removed and later matching-window captures rendered the zone content/class atlas. Build7 and build9 rendered the native canvas path; the full menu remains under comparison.
- Equipment images now bind actual worn display IDs, native class slot availability and saved collection ownership. Equipped-stat text now uses the recovered Armory summary and talent points use the shared native budget/available-points helper. Item tooltips and saved-combination comparisons remain incomplete. The Armory reconstruction owns the catalog/save route needed to finish these.
- The selected zone now uses the native wrapping boss-chip row from `0x14020f910`: top margin3, gaps5 horizontal/4 vertical, chip padding7/1, border1/radius10, font11 and recovered normal/final-boss colors. Enemy names still use plain joined text, and progression decoration remains incomplete. The card sizes flow from their text, so exact selected-card height still needs a fresh capture.
- Run Options geometry/text are recovered from `0x14011b060`→`0x140203300`: padding20/8, gap0, border1/radius6, title17/subtitle12 and literal normal/reward colors. Its gradient/hover remains partly inherited. Its subtitle uses the shared recovered RunMods reward formula and embedded labels: default Normal difficulty, custom Rewards xN.NN in green. The native RunMods record and dialog behavior are separately recovered.
- Random button UI is in `0x14020b380`; action handler `0x140125b70` calls the native fragment producer `0x14011a6f0`. The owned `hero_name.rs` now implements that producer, ASCII live editing and initial Hero replacement; it removed the incorrect DBC race/sex sampling. Exact native/rebuilt edit focus/save timing and invalid-name launch behavior remain unverified. See [main-menu-name-input.md](main-menu-name-input.md).
- Native model camera, lighting, material modes, gender/appearance persistence and equipment integration have separate limits in the preview report. Actual M2/DBC assets are used; no generic character stand-in was substituted.
- Gameplay/entering a world remains excluded from the requested scope.

Validation: `rustfmt` completed on the picker, preview and new canvas source. The parent's integrated builds/captures through the matching1600×900 windowed capture succeeded and were visually inspected here; class atlas and zone content render. The parent's build7 capture rendered the native starting gear, portrait resolution, canvas and boss chips. Build9/build11 rendered the integrated model material and gamma graph; latest fine styling, all tabards/cosmetics and multilingual layouts remain under comparison. No concurrent cargo build was started by this subtask. Static layout evidence above is checked; integrated visual parity is not established.

Language catalogs and the native popover are implemented using explicit native keys; build11 verified rebuilt Polish selection and exact `pl` persistence. Native font-data overrides and accent augmentation were subsequently recovered and implemented; their integrated multilingual comparison remains pending. See [main-menu-fonts.md](main-menu-fonts.md). See [main-menu-localization.md](main-menu-localization.md). The equipment summary now uses `armory::equipment_summary` for actual worn bonuses, with the native no-gear fallback and recovered green/neutral text colors.

Native text bundle recovery additionally identified `TextShadow` at the bare picker text sites: black sRGBA alpha0.85, offset(0,1.5). The owned picker text helper now supplies it; font-directory/shadow integrated comparison is pending. The no-gear text tuple contains no explicit Node width or TextLayout override, so no provisional wrapping clamp was introduced. See [picker-text-shadow-native.json](evidence/0.92/picker-text-shadow-native.json).

The zone renderer now uses recovered image crops, opaque native tints, the separate three-stop
horizontal darkening overlay, state borders/shadows and7px progress dots. Native class stat
cards additionally have flex-basis0, so their equal widths no longer depend on label length.
These changes follow build14's corrected-font capture and rendered in build15/build16; full comparison continues.
See [picker-zone-cards-native.json](evidence/0.92/picker-zone-cards-native.json). The settled
Polish build14 capture fits the middle pane; no width clamp was added from an earlier transient
layout interpretation.

The background and 28 native animated embers now have a scoped plugin implementation that rendered in build15. Image tint/overscan, compound gradient geometry,
particle sizes, phase, speed, drift and alpha follow the SHA-bound SSE stores and CRT truncf
import. See [main-menu-background.md](main-menu-background.md) for exact formulas and limits.

The class-text correction follows native 1fde45 and 1fdff9: the 15px blurb is
MUTED and its Text+Node has min-height40. The previous bare Text collapsed below
that minimum. Class labels additionally use class RGB when selected and MUTED
otherwise. The 1px class/racial divider is now the native 0a1700 PI/2 three-stop
transparent/GOLD-alpha.25/transparent gradient, rather than an opaque flat line.
Build16 rendered these changes. Class content remains about3–4px above the native frame;
no screenshot-derived gap was added. See [picker-class-text-native.json](evidence/0.92/picker-class-text-native.json).

The Options Key Bindings header has an independently recovered margin-top4px.
Native17f890 passes a432-byte bundle to1b1b80, whose original copy instructions
place the384-byte Node at bundle+48 (RBP-0x30). Width100%, min-height32,
column-gap10 and Center alignment bind its layout; stores17fb53/17fb5a then bind
the full UiRect margin to Px(0,0,4,0), using original constants1458a8220 and1458aab10.
The missing top margin explains the parent-observed source17 header offset after
Options scaling, but the screenshot was not used to derive it. This subtask made
no options.rs edit or runtime validation; integration is parent-owned.
See [keybinding-header-layout.json](evidence/0.92/keybinding-header-layout.json).
