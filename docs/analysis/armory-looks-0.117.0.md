# Armory Look scrolling — 0.117.0

Target: installed 0.117.0, SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
The [verification-needed](../verification-needed.md) owns finding **#120** and its remaining
runtime/presentation limits. [Native captures](evidence/0.117.0/armory-looks/nodes.json)
and the [recovery manifest](evidence/0.117.0/armory-looks/manifest.json) bind the
selected native instructions, data, Ghidra results and source connections.

## Native contract and source repair

The only declared-range encoded reference to `armory-looks` is the LEA at
`0x14031bd1b` inside `[0x14031b280,0x14031c5b6)`. Its direct caller
`[0x14023d840,0x14023db5d)` creates the Look section before invoking that body.
The captured parent has top margin Auto, a column with 6px row gap and minimum
height zero. The latter lets this section shrink inside the existing bounded
Character/Details pane; a new fixed height or reset rule is not supported.

The body creates a separate row with minimum height zero and a 4px column gap.
Its child viewport grows to use the available width, has minimum height zero,
wraps its buttons with 6px horizontal and vertical gaps, aligns wrapped lines to
FlexStart and scrolls vertically. Width, height and flex basis remain Auto.
The viewport bundle carries the exact twelve-byte key `armory-looks` and zero
initial scroll coordinates. The current body passes this same viewport entity
to the shared scrollbar constructor at `0x14031c181`; the scrollbar is its
sibling in the row. The heading/hint precede that row, and Showing follows it.

`armory.rs::look` now constructs that parent, row and viewport, publishes
`ScrollPosition` and the existing named `scrollbar::Kept` component, then calls
`scrollbar::spawn` with that viewport. The shared `kept_list` shortcut has
different row sizing/gaps, so this caller uses the existing lower-level
constructor without changing other lists. Character and item Details already
call this one Look builder. Existing action, save and preview consumers are
preserved by the scrolling repair.

`NativeScrollbarPlugin` already installs the shared input systems. Source
`kept_wheel` restores the named offset after UI reconstruction, applies wheel
input to the topmost hovered retained node, clamps against current content bounds
and updates `KeptPositions`. The existing track/thumb path supplies dragging and
overflow visibility. This source trace connects the new viewport to those
consumers; it does not promote every historical shared-input contract to the
current target or establish executed input/layout behavior.

## Static evidence and limits

`scripts/check-armory-looks.py` replays the three current Node initializers
against installed bytes, with current RIP-relative vector seeds and explicit
byte-copy seams. Two different stack fills distinguish initialized fields from
padding and inactive Auto payloads. Captures include the exact viewport key and
its parent/row/body fields, then check the actual source connections.
The release-data replay also checks its Armory source receipt with
`scripts/check-release-review.py --armory-source-only`, retaining every
native span/reference check.

Reproduce the captures with `python3 -B scripts/check-armory-looks.py`.
Add `--prepare-queries` to recreate the four exact function slices and their
`*-plan.json` files under `runtime/0.117.0/armory-looks/`. Run each desired plan
through `./scripts/rea query`; saved matching results resume automatically.

The 384-byte Node interpretation is bounded to the captured stores and the
matching Bevy 0.18.1 field/enum definitions. Ghidra raw-function imports retain
the current preferred addresses but omit external callee bodies and original
data; the independent captures read those data bytes from the current image.
Generic ECS insertion/allocation, complete shared input scheduling and unrelated
Armory behavior are outside these finite contracts.

Rust syntax parsing and the non-compiling native/source checks do not compile
or execute the reconstruction. Compilation, actual small/large look lists,
wheel/drag/clipping/hit regions, slot/class/page transitions, retained offsets,
DPI/window scaling and original/rebuilt visual/interaction parity remain
unverified. The whole finding remains open for those comparisons.
