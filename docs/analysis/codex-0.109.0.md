# Codex current catalog, text and layout — 0.109.0

Target: installed 0.109.0, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report owns the current Codex portion of #17; [verification-needed](../verification-needed.md)
owns current implementation status. [0.105.0 catalog recovery](codex-0.105.0.md)
and [historical layout recovery](codex-0.92-recovery.md) retain their own targets.

Current REA/Ghidra owners cover the grid, Details, interactive tile, legendary
constructor and effect-description mapper in the [manifest](evidence/0.109.0/codex/manifest.json).
The current native class/ability/jewelry/shared-amulet tables are read afresh.
All 142 English structural records match the existing historical source asset,
so the live renderer reuses that canonical corpus after current revalidation.
The selected constructor, effect dispatcher, rarity increment and actual native
Codex growth branch execute across all fourteen embedded locale catalogs.
Thirteen translated Legionlord medallion records changed: the name, Demonic
Empowerment and demon-damage descriptions now use current native translations.
A compact current-hash locale overlay supplies those corrections without copying
600KB of unchanged text. It is applied by the real `CodexText::embedded` consumer.

The current grid constructor walks nine class pools and three shared categories;
its catalog still has 103 class legendary entries, 22 jewelry definitions and
17 shared amulets. The actual path supplies the complete grid, item selection,
seen counts and Details. A separate category-filter UI is not present in this
recovered constructor and has not been invented. Selection remains a read-only
Codex resource. Current `14037d490` compares enum/index/string identity before
writing it, so repeated clicks now avoid a redundant source resource write.
Both sparse/dense branches and common Armory navigation are covered by the
[current input record](evidence/0.109.0/armory-pages/input.json); clean tabs,
Done and picker reopen preserve selection.

Current typed submission replay revalidates the six-pixel grid gaps, default
Details paragraphs, section/footer text sizes, and the 100%×8px clipped progress
frame with one-pixel border and four-pixel radius. The footer's automatic top
margin was missing from source and is now connected. Current quality selector
`140364670` also proves that only jewelry takes its rarity from `seen`; shared
amulets keep their record rarity and legendary amulets keep rarity four. The
Details heading previously colored both from `seen`. It now uses the same
native rule as the tile, including valid imported records with a different
stored discovery rarity. Current selected Details construction also exposed an
extra fixed48px source icon wrapper; the native inserts its interactive tile
directly into the12px-gap header row. The source now follows that structure,
uses the native12px Seen-up-to heading, and leaves each rarity row at automatic
width while retaining its84px fixed label track.

Static checks, without compiler or game:

- `python3 -B scripts/recover-codex.py --check`: 142 regenerated current
  entries, 1,988 localized records, 1,540 fresh jewelry rarity descriptions and
  308 native growth-branch evaluations. Every embedded locale and native
  function/table span is hash-bound. Allocation, copying/comparison, string
  replacement, Unicode uppercase-first, compact formatting and locale lookup
  are explicit host seams; original effect selection, constructors and number
  arithmetic execute. Compact precision is decoded as the current u16 field.
- `python3 -B scripts/check-codex-layout.py`: 45 typed Node snapshots,
  21 text submissions and live source guards. The grid sample walks all nine actual
  class records; shared-group contents, padding columns, tile/label UI and
  getters have declared fixtures. Seen/unseen jewelry and shared Details samples execute allfive rarity rows where applicable, with explicit name/effect/rarity-math fixtures; full texts/arithmetic have independent native recovery. These samples do not certify computed layout.
- `python3 -B scripts/check-codex-quality.py`: 114 original-instruction
  quality cases, including every shared amulet and every discovery rarity.
- `python3 -B scripts/check-codex-tile.py`:96 complete native tile
  submissions at42px/48px across jewelry/shared, discovered/selected states and
  allsix rarity colors. Node/border/hover/image tint/shadow inputs are captured
  at the typed bundle boundary. Image lookup, seen/quality getters, generic
  color conversion, shadow allocation and ECS submission are explicit seams.
- Project rustfmt parses the changed module; whitespace diff checks pass.

Compilation, computed layout at different sizes, focus/input, fonts/shaping,
clipping/scroll behavior, GPU drawing and original/rebuilt interaction remain
unverified. Current data and bounded typed submissions do not establish whole
page or engine parity. No build, compiling test or application ran.
