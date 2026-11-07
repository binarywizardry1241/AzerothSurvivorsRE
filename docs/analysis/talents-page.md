# Talents page and shared hover

Target: installed 0.109.0, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report owns the current #17 Talents page, its constructors and input, and
current shared border/lift revalidation. [verification-needed](../verification-needed.md)
owns overall status. The [Talent/Save report](talents-save.md) owns all
355 definitions, ranked descriptions, allocation gates and saved specs. Gameplay
effect application remains separately owned by #12/#16.

## Current owners and source

The [UI manifest](evidence/talents-menu/ui-manifest.json) binds 38 current
native owners, including page/tree/detail/spec constructors, allocation actions,
right-click refund, inspection hover, milestone grouping and the shared hover
query/registration. It references the shared current Save, frontend poll and
button/panel style evidence instead of duplicating those extracts. Original-VA
assembly governs interpretations where raw Ghidra imports omit data/callees or
recover generic types. Portable REA metadata preserves the original analysis
profile digest using repository-relative import paths.

`talents.rs` uses the recovered current catalog and shared Save allocation owner.
The page remains part of the current Armory shell and navigation; its three
360×520 grids and 310px detail pane use intrinsic translated text. The existing
MPQ quadrant transforms, row/column placement, prerequisite endpoints, tree
headings and milestone classifier were checked against current constructors.
Rebuild invalidation now includes language catalog, font/art and image changes.
Inspection retains its key across hover-out and class/page changes; invalid keys
naturally show the current page prompt rather than inventing a selection reset.

| Area | Current connected behavior and corrections |
| --- | --- |
| Primary actions | Visit every changed Pressed action without an extra physical-left-button gate. Learn and primary Unlearn select their inspected key even when a learning/refund gate rejects the mutation. The native actions have no added updater/dialog run condition. |
| Right click | Visit every grid Cell whose Interaction is Hovered when right is newly pressed. Successful refunds use the same native dependency gate. This path does not separately overwrite inspection. The prior geometric first-cell shortcut was removed. |
| Inspection | Visit changed non-None interactions and retain selection on exit. Milestone footer images are visual; they carry no Cell/action. |
| Persistence | Native allocation/spec actions request Talents14 or Spec15 after the corresponding frontend mutation. Source mutations delegate persistence to the shared menu-state owner, which owns backend Save lifetime and dispatch. Reset supplies the cleared allocation; selecting the current spec causes no write. |
| Grid cells | The image shares the native 46px bordered node. Selection, learned/available, capped, milestone and locked colors retain their separate gates. Current purple milestone/gold selection/black resting shadows and shared border hover are connected. Read-only grids omit allocation actions. |
| Rank badges | Intrinsic dimensions, right/bottom −8px, 4px horizontal padding, border1/radius4, black alpha0.9, 11px text and native rank/availability colors replace fixed-size badge geometry. |
| Milestones | Group same-row choices into one row, with all corresponding icons and names joined by the native literal ` / `. The label becomes cyan when any choice is learned. This matters for Demonology rows2/6 and Feral row6. |
| Specs | Selected card has a gold border/glow and brighter title, without an action or invented background. Inactive cards own the action, current red gradient and hover. Card size remains intrinsic with 6×5px padding, border1/radius5, 14px title and 11px totals/Empty text. |
| Points and XP | 30px available-point text turns green when points remain; totals, XP and instructions use their current muted colors. At 51 points, the current cap label replaces the next-point text. The native 0/0 progress NaN is preserved. |
| Progress and divider | The 8px bordered progress track has native blue linear gradient fill. The divider is a three-stop faded gold gradient with quarter-alpha midpoint, replacing a solid line. |
| Selected details | The icon is 48px with border2/radius6 and milestone-aware border; rank text is 13px muted. Row/prerequisite/exclusion warnings are 13px native red. Alternative prerequisite names join localized ` or `; one-rank requirements use the native singular template. Current/next descriptions and the omitted cyan milestone note are connected. |
| Buttons and text | Enabled action buttons receive their native action/hover/gradient; disabled buttons receive no Button/action. Native padding14×6, border1/radius5, 15px gold text/disabled alpha and black background replace the former provisional style. Shared text shadows apply to the recovered text. |

The native plugin registers its primary action, right-refund and inspection
systems without an explicit chain. The adapter consumes a query-order action
batch followed by right-click requests and rebuilds after edits. Static recovery
does not establish simultaneous cross-system scheduling or per-frame parity;
those interactions require the actual built menu comparison.

## Shared hover

The current body `140076b00..14007731e` is registered by plugin `140064930`,
through vtable `145dcfed0` (reference `1400656a2`), run owner `14007f3b0` and init
owner `14007f1d0`. Query initializer `1403aa7c0` obtains:

- Interaction via `1402a7cf0`, repeated as its Changed filter;
- the constructor’s 44-byte two-colors/lift style via `1402c8f70`;
- mutable 80-byte BorderColor via `1402a87d0`;
- optional mutable 32-byte UiTransform via `1402a6c10`.

Current component registration/type-ID bytes and the vtable hash are retained in
the manifest. The original body writes all four border sides from the resting
color for None and active color for Hovered/Pressed. When the transform exists,
it writes pixel translation `(0,0)` for None and `(0,-lift)` otherwise. Source
`hover.rs` already implements these operations; its provenance now points at the
current target. This proof binds the current query and constructor-produced
style, rather than assuming equivalence from the older 44-byte shape.

## Verification and remaining validation

`python3 -B scripts/check-talents-menu.py --ui` passes 1,121 current native
descriptions, 355 metadata/milestone records and 252 other native instruction
cases across 60 retained data/UI owners. The 111 data/Save cases are described in
the separate report. The 141 additional [UI cases](evidence/talents-menu/ui-native-cases.json)
cover 27 actual milestone collectors, 81 actual same-row grouping operations,
rank badge/action/progress/spec/detail-icon constructor prefixes, the complete
faded-divider helper, progress clamping including NaN and 18 shared-hover paint
cases. Hover checks compare every BorderColor byte and optional translation,
including negative-zero lift, for all three interactions, transform presence and
negative/zero/positive lift.

The checker reads the installed verified PE without launching it. Declared
allocation/C memory/roundf/English-fallback seams are listed in the data report.
Constructor prefixes stop before native ECS spawn; hover fixtures supply typed
query rows and execute the actual paint instructions. The complete Bevy world,
query membership and scheduler are statically bound rather than emulated.
`--ui --prepare-rea` generates project-local raw carriers/plans for all 60 owners.

Rustfmt parsed the two changed Rust modules without compilation. Hash/fixture
checks, manual source/type review and diff whitespace checks ran. No Rust test,
compiler, application build, game launch or original/rebuilt rendered comparison
ran. Font metrics, wrapping, missing/resident MPQ images, DPI, hit testing,
simultaneous actions, queued Save timing and actual gameplay presentation remain
runtime validation requirements. This finite selected-page recovery does not
close the separate gameplay-effect gaps or complete-image/shared-engine #41.
