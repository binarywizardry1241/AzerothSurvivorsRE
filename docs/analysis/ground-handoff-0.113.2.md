# Mob movement and ground ownership — 0.113.2

Target: installed **0.113.2**, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the reported terrain-penetration issue
**#1** and its remaining validation limits. This report covers only the shared
client interface needed to interpret AS travel and stationary-facing packets.

The reconstructed ground resolver now preserves its entire memo on a cache hit,
matching the current native branch. The source previously updated the memo's
path token while reusing its floor answer; the target skips that write. Removing
the additional token update restores the target's first-displacement probe
selection for a newly installed path. It does **not** establish a cure for the
reported finite-position approach/attack penetration. The native consumer also
writes sampled XYZ before grounding and retains the seat when an idle downward
probe misses; no new upward clamp or stopped-pose height query is introduced.

## Current native contracts

The [manifest](evidence/0.113.2/ground-handoff/manifest.json) binds three complete
raw-function Ghidra observations and nine non-overlapping instruction extracts
to the installed PE. Complete-function pseudocode remains disposable; the
selected assembly is the canonical retained extract for each byte range.

| Owner | Recovered contract and retained instructions |
|---|---|
| MonsterMove handler `141188210..141189177` | Located through its calls to the current `mmv` trace owner `1410dd8d0`, then traced through actual event/pose/spline handling. ROOT `0x1000` refuses the path. A non-stop with positive duration and at least two path points constructs a spline with the original path vector, a fresh `Instant`, supplied ID, duration converted to seconds/nanoseconds, grounded = !flying, and supplied run mode. [Admission](evidence/0.113.2/ground-handoff/monster-install-gates.asm), [construction](evidence/0.113.2/ground-handoff/monster-create.asm). |
| Spline sampler `1411a1ec0..1411a31c0` | Calls evaluator `1410cb180`; on the world-position arm, stores the full sampled WoW point as Bevy `[-y, z, -x]`. In particular `1411a286e` stores the sampled Z at Transform+`14`; the sampler itself does not preserve the previous terrain-resolved Y. [Position stores](evidence/0.113.2/ground-handoff/spline-position.asm). |
| Ground resolver `1411a3390..1411a507c` | When current Y equals the resolver's last written Y, reuse its remembered seat; otherwise current Y becomes the new seat. [Seat selection](evidence/0.113.2/ground-handoff/ground-seat.asm). Its continuing swept arm requires a present memo and equality of the current spline's ID and both `Instant` fields. [Token gate](evidence/0.113.2/ground-handoff/ground-continuity.asm). |
| Same ground resolver, cache hit | After Y/epoch/mode/hit/XZ equality, `1411a3fb9..1411a3fe5` updates only stack counters/restored iterator registers and jumps to the next-unit iterator at `1411a3b43` or `1411a3757`. There is no call or memo write on this hit path; the current spline token is not read until the miss path at `1411a4111`. [Complete hit decision and exits](evidence/0.113.2/ground-handoff/ground-cache-hit.asm). |
| Same ground resolver, continuing arm | Starts the shared grounded step from the previous resolved position, with horizontal displacement and zero vertical displacement. It supplies creature rise 2.0 and a one-second displacement interval. An unsupported result retains the seat. Only the resulting height is consumed here. [Swept call and result](evidence/0.113.2/ground-handoff/ground-walk.asm). |
| Same ground resolver, idle/new-path arm | Starts the downward ray at seat + exact f32 `1/36` (`145fa3864`), with reach bits `0x4080e38e` (f32 4 + 1/36). A hit selects origin minus distance; a miss selects the seat. Water-walking and hover have separate later adjustments. [Idle ray and hit/miss selection](evidence/0.113.2/ground-handoff/ground-idle.asm). |
| Same ground resolver, output | Writes resolved Y when changed, then stores the current token, XZ, collider epoch, seat, written Y, modes and hit state in the memo. [Output and memo](evidence/0.113.2/ground-handoff/ground-write.asm). |

Ghidra evidence IDs are retained in the manifest. These are complete immutable
raw-function imports at current addresses, using Ghidra 12.1.4. External calls,
global data and Win64 ABI types are incomplete in headerless pseudocode; mapped
PE assembly controls the field/store interpretation. Diagnostic filenames were
discovery leads only. The `clmp` strings and the resolver's own calls, constants,
queries and writes establish the selected ground-owner connection.

## Reconstructed source path

The AS actor's
[movement state](../../crates/azeroth-survivors-re/src/enemies/ai.rs) retains its
authoritative movement points. The
[visual adapter](../../crates/azeroth-survivors-re/src/gameplay/visuals.rs)
samples terrain endpoints for positive-duration travel and supplies
`LocalUnitPath`; nonpositive movement publication produces the distinct
type-3 facing packet through
[mechanics](../../crates/azeroth-survivors-re/src/gameplay/mechanics.rs) and
[client events](../../crates/azeroth-survivors-re/src/gameplay/client/events.rs).
The packet's unadjusted start remains the recovered native publication contract.

[LocalActorsPlugin](../../crates/benilla-app/src/local_client/actors.rs) orders
`follow_paths` before presentation dispatch and Net. A changed stopped pose
writes its supplied destination in
[follow_paths](../../crates/benilla-app/src/local_client/movement.rs); the queued
facing packet then reaches the ordinary
[MonsterMove handler](../../crates/benilla-app/src/net/objects.rs). The
[normal sampler and ground resolver](../../crates/benilla-app/src/net/motion/spline.rs)
own the resulting pose.

The previous source cache-hit branch assigned the new `(id, start)` token to
`GroundClamped::path` before returning. That state change was absent from the
current native hit path. The source now removes only this assignment: it reuses
the valid floor answer and leaves the old memo untouched. On the next changed
pose, a new token fails the continuing-path gate and takes the existing idle
probe; the resulting memo then records the current token. Subsequent frames can
take the ordinary same-token swept arm. This affects initial paths and
replacement paths that begin at an exactly cached pose. It preserves the
existing seat, XYZ sampling, collider-epoch, modes, query and output rules.
The authored offline regression covers both token lifetimes through actual
`follow_paths`, spline sampling and the ground resolver. It replaces the earlier
regression that expected the additional token write to force an uphill sweep;
that expectation was inconsistent with the current EXE.

At an attack stop, raw actor Z can differ from the Y previously resolved by the
client. Writing that pose and replacing the spline token can select an idle ray
instead of a continuing sweep. A ray beginning below an upward-facing surface
can miss and retain its seat. This is a **conditional failure route**, not a
reproduction or attribution of the reported case: the same selected
XYZ/seat/token behavior is present in the current native consumer. The affected
zone, unit, coordinates, geometry, raw/native/rendered points, query results and
exact travel-to-stop timing are not available from this static evidence.

Stationary heading remains packet-owned: the local stopped-pose adapter
preserves yaw while a facing packet is queued; the handler resolves its target
at receipt and resets display-facing state. Missing or coincident targets
retain the prior heading. Existing
[authored scheduling regressions](../../crates/benilla-app/src/net/objects/stationary_facing_tests.rs)
cover those source paths but were not compiled or run for this inspection.

## Verification and limits

`python3 -B scripts/check-ground-handoff.py` verifies the installed target,
three complete owner byte hashes and all **nine retained extracts / 261
instructions**, independently decoding each retained range. It executes **26
bounded current-native cases** in Unicorn: four full XYZ stores, four seat
selections, six spline-token decisions, eight cache-hit/next-probe sequences and
four idle hit/miss selections. The eight cache sequences cover both query
iterator exits, both legacy-probe settings and an absent/present old path token;
they assert no write touches any of the memo's 56 bytes, the full memo stays
unchanged, and the following changed-token gate selects the idle arm. The
idle query is explicitly intercepted with a supplied result after checking its
origin, downward direction and exact reach. No collision/world query, complete
ECS schedule or Rust gameplay implementation is executed by these cases.
The manifest also binds the reviewed ground-resolver source hash; matching that
hash records which source was inspected and does not execute the authored Rust
regression.

No source compilation, compiling tests, application/game launch, real-MPQ
geometry comparison, displayed stationary facing, animation/camera/input check,
Windows check or original/rebuilt parity comparison was performed. The bounded
consumer work resolves this particular missing current-target interface
contract; **#1** remains open for the reported defect and **#41** retains its
other AS-specific recovery obligations.
