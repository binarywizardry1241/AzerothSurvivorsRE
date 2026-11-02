# Codex catalog and text — historical 0.105.0

Target: supplied **0.105.0**, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report retains the 0.105.0 Codex catalog/text evidence for #17/#34.
The [0.109.0 report](codex-0.109.0.md) owns current revalidation and corrections. The
[0.92 report](codex-0.92-recovery.md) retains its actual historical evidence;
[verification-needed](../verification-needed.md) owns current implementation status.

The live Codex previously loaded 140 entries and ten language maps generated
from 0.92. Current class pools contain **103** spells, adding Shred and Demonic
Empowerment; with 22 jewelry definitions and 17 shared amulets, the current
Codex has **142** entries. Fourteen languages are selectable, so the absent
Czech, Romanian, Ukrainian and Japanese maps also reached an `expect` failure
when opening Codex. The new selected-target assets supply every current entry
and every language through the existing Codex rendering path.

## Native catalog, descriptions and growth

Current details owner `1401ca520..1401cd943` calls the selected amulet constructor
`14587b8e0`, jewelry name getter `14587ae20`, shared-amulet name getter
`14587d140`, tag label `1403596c0`, fresh-pick increment `14587a150` and jewelry
description `14587a7c0`. Its growth dispatch and formatting branch
`1401ccf6f..1401cd7bc` is executed unchanged with each actual jewelry descriptor.
The native pointer/length tables and dispatch bytes are hash-bound in the
[validation record](evidence/0.105.0/codex/validation.json).

The class pools are read directly from nine current 144-byte class records and
compared with the live menu catalog. Their ability keys select current 120-byte
ability descriptors. Original constructors produce the localized legendary
names, icons and effects; the current effect formatter
`1459b9dc0..1459bcdd8` produces their actual description lines. Shared amulet
metadata/effects and all 22 jewelry definitions come from their current tables.
The constructor is the same canonical native owner already revalidated by the
[equipment report](equipment-catalog-0.105.0.md), rather than a copied extract.

The recovered output corrects **42 stale fields** among the retained 140 entries
and adds both missing entries. Changes include the native two-procs-per-second
suffixes, current health/damage-reduction lines, jewelry growth rules and
current limiter text. Shred has its actual three lines; the Legionlord medallion
has its actual duration, demon damage, cooldown and strength lines. These are
native formatter outputs, not invented descriptions assembled from release notes.

## Source and static checks

[recover-codex.py historical recipe](../SCRIPTS.md#historical-execution-sources) checks the
newest supplied target/hash, parses locale lookup directly from the current EXE,
and executes bounded original x64 with explicit host seams. It generates:

- `assets/codex-0.105.0.json`: 142 current structural/text records.
- `assets/codex-locales-0.105.0.json`: **1,988** complete localized records.

The live `CodexCatalog` and `CodexText` now load those assets. Historical assets
and extraction scripts remain unchanged. The complete generated corpus is one
cohesive source-data replacement: splitting it by language would leave selectable
languages without their corresponding entry keys.

[recover-codex.py historical recipe](../SCRIPTS.md#historical-execution-sources) passes for all 142 entries
in all fourteen languages, **1,540** fresh jewelry rarity descriptions and **308**
unchanged native growth-branch evaluations. All 250 locale lookup keys are the
same across language passes; each embedded map has an exact byte range,
language prefix and hash, and both output assets have retained hashes. Three
English lookup keys differ from the older source locale maps, so those maps
are not used as current-target proof. The check also verifies that the actual renderer includes those assets.
Project rustfmt parses the changed Codex module without compiling or modifying
it, and `git diff --check` passes.

The host seams replace allocation, copying, comparison, string replacement,
compact Rust formatting, Unicode uppercase-first and locale lookup. The original
constructors, rarity math, effect selection and native growth branch execute;
no target OS, filesystem, Lua VM or application code is reachable. These are
bounded emulation results, not original-game observations. The
[manifest](evidence/0.105.0/codex/manifest.json) records the two scoped Ghidra
analyses and the generic-ABI/external-data limitations.

Compilation, rendering, font coverage, page clipping/scrolling, complete input
and original/rebuilt interaction parity remain unverified. The current data and
text repair does not certify the whole Codex page or close those parent gaps.
