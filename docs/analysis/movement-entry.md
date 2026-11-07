# Corrected player reports and run start

Installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This **#38/#41** repair follows **Q41-S01/M03** through the local movement
dispatcher, native report consumer and existing AS ready-to-running source path.
It does not change the existing controller, camera, floor rules or engine.

## Current contract and demonstrated omission

The current local opcode dispatcher routes its 25 movement variants through
`1458dd920`. Its local-index-zero branch supplies the parsed XYZ/facing to
`1458fd2b0` and then visits the event-flush wrapper. Fresh Ghidra observes these
actual current bodies; their nonlocal snapshot-swap branches are excluded.

The report consumer first applies its pending-correction report filter, terrain
and boundary admission, corrective packet publication and twelve-report latch.
Both ordinary acceptance and correction converge at **1458fddc7**. That tail
loads the previous Game XYZ, stores the final admitted XYZ and facing, and then
compares the previous/final XY squared distance with the exact f32 0.04 value.
It invokes Begin only for phase0, a strictly greater ordered distance, local
index0 and absent pending-start flag. Begin's current entry **14590b550** stores
phase1 at **14590b5c7**, before its separately owned actor/stat/publication work.
The [contract](evidence/movement-entry/contract.json) and
[canonical selected assembly](evidence/movement-entry/movement-entry.asm)
bind the actual bytes, Ghidra observations and replay limits.

The source previously applied its start check only in `Admission::Accepted`.
`Admission::Corrected` published a teleport and stored the corrected point but
skipped that check. For example, with supplied primary height0, previous position
`[-9396,-633,0]` and report `[-9395,-633,-100]`, native code corrects to
`[-9395,-633,0.5]`, publishes the correction, sets the report latch to12 and
invokes Begin. The former source remained ready. Conversely, a large raw report
corrected back to the previous XY must not start the run merely because its raw
input moved. These are static controlled witnesses, not a reproduced game fault.

## Live source repair

The actual report loop now passes the recovery decision to
`commit_movement_report`. An ignored report returns without publication or
state change. A correction uses the existing `relocate_player` event owner.
Both admitted branches then commit the final point and perform the same
existing start check against the previous authoritative accepted point. The
redundant last-reported-position field was removed; forced relocation already
updates the authoritative point, so it must also supply this comparison.

This feeds the existing `session.started` simulation gate and subsequent
`Mechanics::tick`/Begin route. It adds no separate start implementation, clock,
terrain clamp, packet format, camera or game/network behavior. Pending-start
and nonlocal native gate cases are classification boundaries; this repair does
not claim a complete Game state or multiplayer adapter.

## Verification and limits

`python3 -B scripts/check-movement-entry.py` passes **858 bounded native
cases**: 576 complete ordinary Elwynn movement-consumer cases, 26 pending-report
prefix cases and256 Begin phase-store prefixes. They include corrected and
uncorrected inputs, unchanged final XY despite large raw movement, seven normal
phase values plus255, pending/index gates, the twelve-report latch and its exact
three-unit admission boundary. Source guards trace the real loop, shared commit,
teleport and existing ready/run gate. The changed Rust module syntax-parses.

Primary terrain answers, `hypotf`, corrective/notice packet constructors and the
Begin phase-store boundary are explicit synthetic seams. No MPQ queries,
controller, complete Begin actor/RNG/stat work, native packet consumer or source
ECS schedule executes. Two authored Rust regressions cover actual correction
event delivery, final-point comparison and ignored/Z-only reports; they remain
**uncompiled and unrun**. Compilation, real terrain/input/game timing and
original/rebuilt gameplay/presentation parity remain unverified. Both parent
gaps retain their remaining work.

For fresh Ghidra reproduction, use `scripts/rea-batch.py` against the configured
installed input with current function/code seeds `1458dd920`, `1458fd2b0` and
`14590b550`, the disabled-analyzer profile retained in the contract, and a fresh
ignored project-local output directory. Original raw plans/results remain under
`runtime/analysis/history/findings/q41-local-handlers/40df7123fccd`, `runtime/analysis/history/findings/q41-local-movement/0c550a598fd4` and
`runtime/analysis/history/findings/q41-local-begin/87c7d513caa2`. Original census populations are unchanged.
