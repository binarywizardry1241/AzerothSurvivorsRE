# Mob ground movement and animation

Target: supplied **0.100.1** EXE, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
[Evidence manifest](evidence/0.100.1/mob-movement/manifest.json) binds the current
caller and packet serializer to original PE bytes and REA/Ghidra function evidence.
Current overall status belongs to [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).
The [0.105.0 report](mob-movement-0.105.0.md) separately revalidates movement
publication against the selected target; this report and its addresses remain
historical 0.100.1 evidence.

## Cause and implemented connection

The prior gameplay visual adapter wrote each unit's raw actor XYZ chord after
the client's Net stage. It supplied only base speed and a moving flag, without
the actual path. The ordinary ground owner therefore took its idle settle arm
instead of following a continuing spline, and its resolved height was overwritten
by the host. Gait also received unmodified base speed during slows and special
movement. Correct spawn floors alone did not repair either connection.

`gameplay/visuals.rs` now publishes the previous completed run snapshot in First,
before local registration and the Net stage, matching the existing player/event
feed. Units receive `LocalUnitPath` rather than per-frame transform writes or a
base-speed `LocalUnitMotion`. Both ordinary/guardian actors and primary bosses
use this path; pickups retain their separate recovered render path.

`benilla-app/local_client/movement.rs` installs a grounded run spline only when
the authoritative path changes. The normal spline sampler, swimming detection,
grounded capsule step and creature gait/clip-rate selector remain the consumers.
The sampler uses the host's admitted path age for these local units, preserving
the run clock through choice/Escape pauses. Network paths keep their existing
clock. Finished paths do not restart on repeated host snapshots; stopped and
relocated poses install once, leaving subsequent ground results in place.

XY admission/pathfinding still uses the recovered occupancy and distance-field
ports in [floor/navigation](floor-recovery-0.100.1.md). This change connects the
rendered unit to the existing terrain-following owner; it does not replace the
native navigation algorithm or introduce an arbitrary height clamp.

## Current native contract

Actor update `1454db6c0` collects movements and dispatches them at
`1454de15b..1454de2a1`. It increments Game+958 with wrapping u32 arithmetic.
For a positive duration (also the unordered comparison branch), it queries
primary terrain independently at the from/to XY and retains each original Z
on a miss. It multiplies duration by exact f32 1000 and converts with saturation
to u32. Serializer `14545b540` enforces a minimum of one millisecond and writes
opcode DD, ordinary movement type 0, flags **0x100**, count 1 and the destination.
The flying flag 0x200 is absent. Nonpositive duration instead calls the
zero-duration target-facing serializer `14545b080`, without height queries.

The visual adapter transcribes the endpoint and duration contract. Client-local
path ID/start tokens supply spline continuity, independently of the gameplay
serial; complete native movement-counter delivery is not established here.
Stationary target-facing behavior and complete native packet sequencing are
separate comparison limits, rather than inferred from the source fix.

## Verification and limits

On 2026-10-20, **44 bounded native cases passed**, executing unchanged current
caller/packet instructions in Unicorn. They cover independent endpoint query
hits/misses, zero/negative/NaN/infinite durations, submillisecond minimums,
truncation, u32 saturation and serial wraparound. Primary-height answers,
allocation, buffer growth, packed-GUID and Vector3 serialization are explicit
seams. These vectors do not execute the game, MPQ geometry or the Rust source.
[Native fixtures](evidence/0.100.1/mob-movement/native-fixtures.json) are consumed
by the authored Rust endpoint/duration regression.

Additional authored Rust regressions exercise the actual offline path producer,
spline sampler and ground owner across a hollow, frozen/resumed path age,
completion without re-arming, slowed path speed and relocation without repeated
height overwrite. They are **not run**. All changed Rust files parse through
rustfmt; parsing is not type checking or source-test execution.

**No build, compilation, Rust test execution, original/rebuilt application launch
or real-MPQ moving-mob comparison was performed for this change.** The reported
animation/airborne/collision defect remains open for runtime validation; the
source connection is implemented, not demonstrated original-game parity.
The earlier all-zone center-floor probe does not establish this behavior.

Recreate the native cases with
[mob_movement_fixtures.py historical recipe](../SCRIPTS.md#historical-execution-sources); add `--rea` to regenerate the
scoped Ghidra recovery through `scripts/rea-batch.py` and `./scripts/rea`.
Output is staged under ignored `runtime/mob-movement-0.100.1/` for review.
