# Armory equipped and cosmetic badges

Gap **#50** is source-repaired against installed 0.113.2, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[verification-needed](../verification-needed.md) owns runtime/parity status.

The target uses localized **text inside a badge**, rather than a texture. English
`armory.mark_worn` remains `E`; changing that letter to an invented icon would
not match this EXE. The missing source behavior was the surrounding badge:
18×18px, 50% corner radius, 1px black outline, gold fill, centered black 11px
text, and top/right offsets of −7px. The separate cosmetic marker uses the same
constructor, blue `(0.29, 0.549, 1)` fill and top/left offsets of −7px.

Current item child constructor `1402be5a0` checks the nonzero item ID against the
nineteen equipped lanes through `140131a10`, looks up `armory.mark_worn`, and
calls `140304e60` with the gold color and right-edge flag. Its independent
cosmetic predicate then looks up `armory.mark_look` and calls that same helper
with blue and the left-edge flag. The Collection owner's other occurrence of
the label at `1402c389e` builds legend text, not a replacement icon.

`armory::piece_badge` now supplies this shared presentation to both independent
predicates in `piece_icon`. It inherits the cell's parent/layer, allows pointer
input to pass to the item control, and preserves the existing projected worn/look
selection. Save mutation queues the gear command and marks the menu dirty;
class/page changes rebuild the same cell path. The existing source projection
rejects unowned IDs and IDs in the wrong class/slot, so its per-slot lookup is
equivalent to the native membership check for admitted ordinary Collection IDs.
No inventory, ownership, equipment or save mutation rule changes here.

## Static evidence

The [manifest](evidence/0.113.2/armory-badges/manifest.json) binds two fresh
REA/Ghidra raw-function imports, exact current instruction ranges and literals.
The three assembly extracts have one canonical copy under that directory.
Raw imports omit external data/callees and use a generic ABI; actual Win64
instructions and original PE data determine the recorded argument/layout facts.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs \
  python3 -B scripts/check-armory-badges.py
```

The check reproduces **28 original-instruction badge constructors** (both labels
in fourteen locales) and **60 original-instruction membership cases** (all
nineteen lanes, missing/zero IDs, SIMD and scalar tails). It verifies the native
Node/fill/outline/font/text outputs and the source's live badge calls. Exact
localized key/value pairs are checked in the selected image. `--stage` writes
reviewable extracts/results into ignored `runtime/` before curation.

Parent/font handles, allocation, byte-copy and ECS/text publication are explicit
fixture seams. The check does not execute Rust, save files, UI layout, hit tests,
fonts or GPU rendering. Compilation, actual equip/unequip/page/class refresh and
original/rebuilt visual/input comparison remain unverified; **#50 remains open
for those checks**. Race portraits are independently owned by **#51**.
