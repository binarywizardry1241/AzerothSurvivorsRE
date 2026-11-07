# Zone-entry loading screens (#61)

[verification-needed](../verification-needed.md) owns the current finding. Run entry uses the
existing loading renderer and native FrameXML/addon loader. The selected
**0.113.2** target is SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The current [UI-progress manifest](evidence/0.113.2/entry-ui-progress/manifest.json)
binds the recovered producer, consumer and scalar replays. Picker scenery is #60.

## Current UI-progress contract

The producer at `1405a42c0..1405a652d` retains a pending entry VM and staged
loader. Its completed/total counters are `+0x110`/`+0x118`. Preparation sets
completed to zero and total to the actual FrameXML TOC row count plus five phase
units. Nested XML includes, addon files and elapsed time do not inflate total.

| Stage | Current native contract | Connected source |
| --- | --- | --- |
| Prepare | `1405a520b`, `1405a5267..5272`, `1405a5b98..5bcb`: prepare VM and initialize row total plus five. | Seat the existing VM once, retaining identity, scale, zoom, legacy settings and extension state. |
| Core rows | `1405a54d5`, `1405a5772..5819`: attempt one row, increment completed and retain next row. Failed attempts advance too. | Existing Lua/XML provider and chunk names, nested includes/source appends, and retained TOC status. |
| Core close/bindings | `1405a5361`, `1407ae670`, `1405a59d7..59e8`: close TOC record, load core bindings, increment and advance to stage 3. | Existing load-log status and binding parser. |
| Layer | `1405a53da`, `1407ae870`, `1405a596f..5980`: conditionally load layer, increment and advance to stage 4. | Existing benilla layer and its enable gate. |
| Positions | `1405a5277`, `1407af960`, `1405a5907..5918`: managed-position bootstrap, increment and advance to stage 5. | Existing `UIParent_ManageFramePositions`; its diagnostic literal independently identifies the helper. |
| Addons and tail | `1405a5552`, `140c46d40`, `1405a5e05..5e16`: addon walk and UI tail, increment and advance to stage 6. | Existing dependencies, addon saved variables/`ADDON_LOADED`, extension postlude, flat variables/`VARIABLES_LOADED`, chat appearance, scale and login arming. |
| Publication | `1405a6140..616e`: remove pending load and publish completed UI. | Deferred host calls, log/font/budget finalization, VM/identity publication and latch release. |

The exact seven-entry relative table at `145f77a80` selects these stages. With
a present TOC, pending completed reaches rows plus four; final publication uses
the last reserved phase by removing pending state. A missing TOC starts at stage
3 (`1405a5bae..5bc2`), skipping core-close/bindings even when `Bindings.xml`
exists. It reports the absent TOC and continues the layer and addon/tail phases.
The standalone core helper now follows that same gate.

After preparation and each complete unit, `1405a5e55..5e81` checks real elapsed
time against **8,000,000 ns**. Work below eight milliseconds continues in the
same turn; reaching the boundary yields. A TOC document, layer, bootstrap or
addon/tail unit stays indivisible. Source does not invent a smooth animation or
promise that one heavy unit finishes in eight milliseconds.

The current cover consumer at `1408dd872..1408dd962` confirms world progress's
80% plus pending UI's 20% from these counters. Empty totals contribute zero and
fractions clamp at one. An awaited snap retains fill; fill never decreases.
Without pending UI, world progress supplies the whole fraction. Reveal still
requires no pending UI, alongside the existing readiness gates.

Raw REA/Ghidra imports use a generic GCC ABI and omit PE/global/callee context.
The producer import cannot resolve its external relative table and its
decompiler removes case successors. Exact current table bytes, decoded case
instructions and scalar replays establish this bounded state/count contract;
decompiler text alone does not. The producer input has three exact PE extent
segments with explicit zero-filled intervening gaps, verified separately from
its complete raw-input hash. This does not certify surrounding engine semantics.

## Connected lifecycle

The [lifecycle](../../crates/benilla-app/src/ui_script/lifecycle.rs) waits for a
presented entry cover, then runs the staged walk with an eight-millisecond slice
instead of loading the entire interface in one `PreUpdate`. The
[manifest loader](../../crates/benilla-app/src/ui_script/manifest.rs) shares its
file/phase steps with synchronous reload/helper callers. XML/Lua errors, addon
dependencies and load-log order retain their existing consumers. The
[cover](../../crates/benilla-app/src/loading_screen.rs) reads actual
`EntryUiLoadProgress` while the pending latch exists, including zero before
preparation. The readiness gate stays closed until publication.

A partial VM lives outside the world's live VM slot. Ordinary feeds, input,
OnUpdate and save writers cannot observe its incomplete tree. Sound suppression,
queued host calls, instruction budget, TOC status and seeded values survive
yields. Finalization publishes once. Leaving the world, a new entry or teardown
drops partial VM/counters; shutdown skips saved-variable writes while pending.
A reload runs first, discards partial entry before the save tail and builds a
replacement synchronously. Abandoned work cannot resume afterwards. The existing
post-entry nameplate clear and world/login arming remain in the final path.

## Original admission/cover connection

The initial repair was recovered against **0.112.5**, SHA-256
`445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36`.
Its [historical manifest](evidence/0.112.5/zone-loading/manifest.json) retains
raise, drive, catalog and map/art contracts with their actual provenance. The
current progress recovery above revalidates its selected producer/consumer,
without relabeling those historical RVAs as current evidence.

The offline host directly seats a local session/body, using the narrow
[LocalLoadingScreen](../../crates/benilla-app/src/loading_screen/local.rs)
interface to the same renderer. [Run admission](../../crates/azeroth-survivors-re/src/gameplay/mod.rs)
requests the map's cover before consuming a seed or constructing mechanics. The
stock map → LoadingScreenID → loading catalog lookup remains the artwork source;
picker-thumbnail basenames do not override it. Offline admission composes this
opaque root above the embedding's menu/HUD roots.

The [bridge](../../crates/azeroth-survivors-re/src/gameplay/client.rs) publishes
readiness for the matching ZoneWorld/body identity, focus, settled pose,
presentable world and terrain cache. An old scene or same-map run cannot release
a new entry. Input, controller motion and mechanics remain held. Again/retry
reset art, fill and cover-frame state; failed/cancelled admission, logout and
disconnection cancel the request. Missing art retains black; an unready world is
not force-revealed. Tip, notification, loot and music consumers retain the same
cover lifecycle.

## Checks and remaining limits

```sh
python3 -B scripts/recover-entry-ui-progress.py --check
```

The check rehashes the installed selected EXE, verifies retained ranges and
Ghidra input segments, and executes **24 native counter/state cases**, **12
native slice-boundary cases** and **864 native progress cases**. Cases cover
zero/overfull totals, unsigned 64-bit conversion, snap hold, monotonic fill and
the exact eight-millisecond boundary. Source checks trace the real cover gate,
row/phase work, publication, retained VM and cancellation. These checks passed
without executing the application or compiled source.

Five changed Rust modules parsed with the existing project rustfmt in
`--emit stdout --config skip_children=true` mode. Five new Rust regressions
cover row/include/failure order, fraction boundaries, partial cancellation,
reload replacement without saving/resuming partial state and the actual cover
consumer. Existing deferred-entry tests drain staged work without asserting a
wall-clock completion frame, retaining their pre-presentation gate assertions.
The missing-TOC assertion also covers an available bindings file. Rust tests
were **not compiled or run**.

The older `recover-zone-loading.py` replay remains bound to its historical
EXE, where it recorded 3,072 readiness and 864 progress cases. It was not rerun
against 0.113.2 and does not certify current readiness, artwork or native parity.

The intermediate UI-counter source limitation is repaired. **#61 remains open
for compilation, ECS/source execution, cold/warm and all-zone transitions, real
MPQ art/rendering/DPI, input, failure presentation, audio timing and controlled
original/rebuilt comparison.** None was run. No further missing source producer
is currently identified within this selected progress connection; surrounding
shared-engine equivalence is outside this bounded claim.

## Retained reported-defect evidence

A historical `runtime/client/ship-evidence/game.log` recorded 40 loading-screen catalog
rows at 12:12:40 on 2026-10-23, map-0 entry at 12:12:51.564572 and readiness at
12:12:57.760838 without `loading screen: up` between them. Its later logout
blackout was separate. This corroborated the original absent-activation report,
not current execution or original timing. The [older loading/audio report](cold-loading.md)
retains its actual 0.105.0 evidence and limits.
