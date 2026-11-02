# Achievements menu — 0.109.0

Gap **#17** is checked against installed EXE SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The Achievements sidebar now derives its totals from the catalog and uses the
current intrinsic layout. The former absolute layout still displayed the old
66-achievement / 1,365-point totals despite loading the newer catalog.

## Current native contracts and source delivery

The current catalog constructor `1458dccb0..1458e11aa` emits **73 entries worth
1,520 points**. All 365 menu name/description/icon/point/category fields agree
with the existing source asset after its English label and token expansion.
The constructor also runs the current gear iterator `1459c38b0` for all nine
classes. The [catalog record](evidence/0.109.0/achievements-menu/catalog.json)
binds the byte ranges, output digest and class counts. No gameplay grant or
predicate has been inferred from these menu fields.

The current panel constructor `140013680`, sidebar `1401ff210`, medallion wrapper
`140018220`, medallion `140202970`, category control `1400124b0` and category body
`1401fb7e0` establish the source geometry. The page now uses the shared Armory
shell/header/content flow. Its left panel is 300px wide with 16×12px padding and
8px row gaps; the right panel grows into the remaining content space. The
150px medallion wrapper centers the 128px circle with mirrored 84px dragons
anchored 18px from its sides and 30px from its top.

Category buttons use intrinsic height, 8×6px padding, 30px icons, 15px names,
12px counts and 4px progress bars. The account footer uses auto top margin,
rather than a fixed Y coordinate. Current selected/unselected border/gradient
colors, score threshold fonts and complete/incomplete count tints remain in
that source path. `progression::draw_achievements` supplies catalog-derived
point, achievement and category totals to `achievements_sidebar::draw`; no
retained old total is used by the summary, score or account progress bar.

## Static checks and limits

- `python3 -B scripts/check-achievements-catalog.py` executes the unchanged
  native catalog and gear-iteration instructions and compares the 365 menu
  fields. Allocation, Vec growth, memcpy, decimal/compact string formatting,
  missing-locale fallback and token replacement are explicit host seams.
- `python3 -B scripts/check-achievements-layout.py` captures **14 typed
  Node snapshots** and two category-body font sizes from current constructor
  instructions. UI submission, assets/fonts, account getters, allocation,
  color conversion and formatted text are fixture seams. The
  [layout record](evidence/0.109.0/achievements-menu/layout.json) retains emitted
  fields and their instruction hashes; [Ghidra provenance](evidence/0.109.0/achievements-menu/rea.json)
  identifies the independently recovered owners.
- Both Rust owners parse with the installed Rust formatter. This is a syntax
  check, not compilation or type checking.

No Rust build/test, application, input interaction, font shaping, computed UI
layout, GPU rendering or original/rebuilt comparison was run. Achievement
awards, unlock vectors and account migration retain their separately recorded
provenance. [verification-needed](../verification-needed.md) owns the combined #17 status.
