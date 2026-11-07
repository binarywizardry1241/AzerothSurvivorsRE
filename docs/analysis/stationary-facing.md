# Stationary mob facing

Current target/source recovery: [ground/navigation and publication — 0.110.0](ground-navigation.md). This report retains its historical target and fixtures; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation limits.

Target: supplied **0.105.0** EXE, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall reconstruction status.

## Native contract and evidence

The canonical [movement manifest](evidence/0.105.0/mob-movement/manifest.json)
binds actor dispatch `14593d6bb..14593d801` and facing serializer
`1458aa520..1458aa81e` to their original PE ranges/hashes. Existing REA/Ghidra
Evidence `ev_dceae76d625ed8cf5ac7b49d7312851bff992b390330ec3230a804069b0df7b3`
decompiles the latter; its headerless import leaves external code/data and Win64
types unresolved, so original-PE assembly governs the ABI. No duplicate native
extract is added for this repair.

For a dispatched movement with nonpositive duration, the caller increments the
wrapping movement serial, retains the **start** XYZ without querying terrain,
and passes the player GUID from Game+`460`. The serializer writes opcode `0xdd`,
move type **3**, the raw target GUID, flags `0x100`, duration **1 ms**, and one
destination equal to that same start. This is distinct from move type 1's stop
packet. NaN duration takes the travel branch.

[Twelve native facing cases](evidence/0.105.0/mob-movement/stationary-facing-fixtures.json)
execute the unchanged current caller **and** facing serializer in Unicorn:
positive/negative zero and negative duration, each under four controlled terrain
result pairs. No terrain query occurs, the serial wraps from `u32::MAX` to zero,
and complete emitted packet bodies are retained for the source decoder. The
existing 44 movement fixtures remain byte-for-byte unchanged. Allocation, buffer
growth, packed-GUID and Vector3 writes are modeled seams. This does not execute
the original client consumer, a game process or real MPQ geometry.

Reproduce with `python3 scripts/recover-mob-movement.py`. The helper checks
the exact EXE hash, reuses its explicit current ABI and stages output under
`runtime/mob-movement-0.105.0/` for review. `--rea` uses the project wrapper and
Ghidra for the selected function slices.

## Live source correction

The ordinary, boss and guardian common-AI adapters previously discarded
`Action::Move`, leaving only the visual path snapshot. A stopped snapshot wrote
the old orbit/movement angle; it carried no target-facing packet.

`gameplay/mechanics.rs::publish_actor_movement` now consumes those actual AI
movement actions, advances the shared serial for travel and facing, and records
`RunEvent::StationaryFacing` for the native nonpositive-duration branch. The
offline player's GUID is 1. Initial spawn snapshots, completed travel paths and
repeated idle snapshots do not synthesize another AI stop. Special charge/home
movement producers and complete native frame/serial ordering retain their
separate reconstruction limits.

`gameplay/client/events.rs` supplies the recovered type-3 packet through
`LocalPresentationEvents`. The production decoder/monster-move handler resolves
the target's current XY bearing at receipt and resets display-facing state.
The one-millisecond zero-length grounded spline retains that facing through the
normal spline sampler. This reuses the existing client consumer; it does not
newly establish its complete 0.105.0 native or rendered parity.

`LocalActorsPlugin` now applies host paths **before** presentation dispatch. This
allows facing and stun-stop packets to win over a newly installed host pose or
path. A stopped pose with a queued facing packet preserves its current heading
for that handler, including when the target is missing or coincident. Without
such a packet, a new raw pose drops `DisplayFacing` alongside its old spline and
elapsed state, preventing a stale raw-facing fallback from turning it back.
An unchanged stopped snapshot still preserves the client's grounded pose.

## Validation and limits

Native validation: **12 facing cases and the unchanged 44 movement cases passed**.
Source regressions cover live chase-to-stop delivery, one-shot publication,
serial wrap/travel counting, the raw start position and unordered duration; the
packet adapter is checked against the native fixtures. Headless client tests
decode the original emitted bytes and exercise the actual offline plugin order,
registered monster-move handler, sampler and display-facing pump, including
missing/coincident targets and a target that moves after receipt.

The source regressions are authored but **not run**. The isolated validation
build did not complete; the changed source remains uncompiled. Generated build
outputs were removed. Parsing and diff whitespace checks passed.

An isolated original launch was attempted with a project-local QA save and Wine
prefix. The installed CrossOver loader failed before a game window with missing
`win32u.dll`/dependent Windows imports (`c0000135`); prefix initialization failed
the same way. No original/rebuilt rendered facing comparison was obtained.
Real-MPQ movement, animation, collision, client rendering and Windows gameplay
parity remain outside this bounded integration proof.
