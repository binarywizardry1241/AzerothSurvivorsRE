# Delayed raid visual lifetime — 0.113.2

This **#41** repair is bound to installed 0.113.2 SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The current local update calls the hazard owner, then delayed visual owner
`14591cad0..14591cc4e`. Its separate queue uses `Game+5c0/5c8/5d0` and 32-byte
records: source GUID at 0, deadline at 8, spell ID at 12, and ground position at
16. Source `PendingActionVisuals` retains that independent ownership.

The original `UCOMISS now, deadline` at `14591cb3a` is followed by `JB` at
`14591cb3f`. An earlier clock **or unordered comparison** retains the row and
advances the index. A due row is snapshotted and stably removed before its spell
record is published, then the shifted row is considered at the same index. No
actor lookup or caster-alive gate suppresses this presentation queue.

The source previously used `now < deadline`, which dispatched unordered rows.
It now uses `!(now >= deadline)` for the skip gate. A NaN clock preserves all
queued rows; a NaN deadline remains queued while later due rows can still be
published in insertion order. The delayed actor-action queue remains separate:
its native `UCOMISS deadline, now; JA` and existing source `deadline > now` gate
admit unordered values. That other queue's rule is unchanged.

`python3 -B scripts/check-as-delayed-visuals.py` passes **1,554 native
queue cases**, covering all sequences of up to three deadlines drawn from
negative infinity, -1, 0, 1, positive infinity and NaN, with six supplied clocks.
The check compares complete supplied Game writes, retained record bytes/order,
the existing output prefix and every appended output record in order.
[Contracts](evidence/0.113.2/as-state-contracts/delayed-visuals.json),
[instructions](evidence/0.113.2/as-state-contracts/delayed-visuals.asm) and
[fresh Ghidra provenance](evidence/0.113.2/as-state-contracts/delayed-visuals-rea.json)
retain the current input identity and byte ranges.

The original memmove and spell serializer are explicit fixture seams. Packet
records are opaque 32-byte tokens populated from captured source/spell/ground
inputs; the check does not execute or certify packet formatting or client
consumption. Preallocated queues exclude allocator growth. A meaningful Rust
regression checks NaN retention, exact-boundary dispatch, targets, stable order
around retained rows, and later draining. Rustfmt syntax parsing passes; the
regression was not compiled or executed. Compilation, actual game/client/ECS
execution and original/rebuilt presentation/gameplay parity remain unverified.
