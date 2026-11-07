# Stateful raid consumers

The selected installed EXE is **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This review connects its remaining periodic, Aftershock, Tether, Gaze,
enemy-producing impact and Crystal consumers to the live source under #42.
It establishes bounded static contracts and one source repair. Compilation,
game execution and original/rebuilt gameplay or visual parity remain unverified.
[verification-needed](../verification-needed.md) owns the overall status.

The [complete current graph](evidence/raid/catalog.json) supplies all
reachable input records, including recursive children. Relevant native tags
contain 23 tracking/Aftershock records, 11 whirlwinds, three sweeps, nine drifting
circle records, six tethers, two gazes, four enemy-producing rains and one
Crystal record. Seventeen tracking records have a positive Aftershock duration.
These are graph-node counts, not distinct mechanics or encounter counts.
[Current producers, marker kinds and dynamic objects](raid-hazards.md),
[current boss/guardian inputs](raid-inputs.md) and
[current wards/healing](raid-wards.md) retain their respective ownership.

## Repair and native contract

The current drift consumer at `145917615..145917800` checks an active row and
positive drift speed, obtains its distance through the `_hypotf` import and
compares that distance with **0.05** at `145db1398` (`cdcc4c3d`). Source used
`d > 0.1`, leaving a drifting circle stationary within an extra interval. The
live `bosses/raid_extra.rs::Area::advance_extra` now uses `d > 0.05`.

Movement retains native order: clamp `speed × elapsed` to distance, divide the
position delta by distance, advance the center, then resolve primary height,
secondary height, or the terrain fallback. Even zero elapsed reaches terrain
when the positive-speed/active/distance gates admit the row. Adjacent float32
values below/equal/above 0.05, distances 0.03/0.05/0.06/0.1, zero displacement,
NaN speed/distance, inactive rows and primary/secondary/fallback heights are
covered. The current consumer retains its `_hypotf` norm. PE import records
also bind `atan2f`, `cosf` and `sinf` fixture seams to their current thunks.

The remaining checked contracts agree with the connected source:

| Family | Producer/state and current consumer output |
| --- | --- |
| Periodic | Native14/24 tick at 0.5s and native15 at 0.25s. Expiry wins over a tick, equality admits a due tick, and only one interval advances per frame. Actual graph radii/widths/damage feed current circle/line containment and accumulated damage. Angular movement occurs only after activation. |
| Aftershock | Initial containment controls the first hit. Activation records `next = now + 1`, clears tracking, queues replacement and optional impact visual, and marks a nonzero dynamic-object visual for construction. Later ticks advance by one second, with expiry checked first. All seventeen positive-duration graph records are exercised. |
| Dynamic object | The shared consumer admits only the marked object slot, kind2, circle shape and nonzero visual; it forwards exact spell/radius/position to the separately checked object constructor and stores its returned GUID. Other existing object slots are retained. |
| Tether | Source-to-player line length is at least one, width stays 1.6, and published length changes exceeding one queue replacement. The active consumer breaks only above its range or at expiry; due ticks add damage, advance by 0.5 and enqueue the final payload scalar as the source-healing fraction. This scalar is not its tick cadence. |
| Gaze | The 0.8s tracking/arm window and expiry gates precede circle containment. Leaving radius2.5 after arming queues a visual at the player's current point, adds one hit and retires the row; the boundary is safe. |
| Spawn | The impact queue retains the full64-bit definition index and position. The ordered consumer passes them through the native optional-position descriptor to the common enemy constructor. Source joins the two words, clamps to a zone definition, checks the shared population cap and calls the live spawn adapter. |
| Crystal | The occupied-circle result supplies an exposure request. The consumer finds the living source, clears shield state and sets exposure to `now + duration`; absent/dead sources receive no mutation. Source preserves the weakened announcement and post-action path. |
| Healing | Ordered `(source, fraction, spell)` requests reach the existing current ward/source healing contract without converting the fraction into a fixed damage amount. |

The connected path is `Pending::dispatch_current_with_rng` → the shared hazard
vector → `Area::advance_extra` → marker/visual outputs and accumulated damage →
post-actions in `gameplay/mechanics/bosses.rs`. Dynamic objects precede marker
publication and actual player damage. Spawn, exposure and healing callbacks
follow player damage in that order. Native callback argument fixtures and
source-order guards check those boundaries; they do not execute Rust.

## Reproduction and limits

`python3 -B scripts/check-raid-stateful.py` re-reads and hashes the installed
target, reconstructs/checks the complete graph, verifies current import thunks,
then executes **2,851** isolated original-byte cases:
744 movement/angle, 492 periodic, 493 Aftershock, 612 object admission,
450 tether, 34 gaze/tracking and 26 spawn/exposure/healing profiles.
It also checks the live source connections/order. `--stage` writes candidate
evidence beneath ignored `runtime/`; default mode verifies the reviewed
[manifest](evidence/raid-stateful/manifest.json).

The manifest identifies every executed instruction range by current installed
bytes and its canonical assembly owner. Existing graph/hazard/input/ward ranges
are referenced; only new instruction rows appear in `selected-native.asm`.
The compact Ghidra provenance binds a raw current consumer branch import, with
one retained pseudocode body. Its interior entry, missing external code/data and
omitted successor context produce decompiler diagnostics; assembly and explicit
fixture stops own the exact tested paths. This does not certify whole-function
ownership or close #41.

CRT mathematical results and terrain replies are injected fixture seams. The
ordered callback fixtures capture dynamic-object, common enemy-constructor and
healing arguments; their canonical owners establish their separate contracts.
Allocator/packet serialization, full shared engine behavior, real MPQ terrain,
renderer/audio behavior and cross-platform CRT equivalence still need independent
evidence. Rustfmt parsed the edited source without compiling. No compiler,
compiling test or game was run, and #42 remains open for its broader requirements.
