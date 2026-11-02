# Cooperative movement admission and correction — 0.123.0

Finding **#270** is source/static repaired against the installed 146,228,736-byte
EXE, SHA-256 `de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [proof](evidence/0.123.0/coop-correction/manifest.json) binds seven journaled
Ghidra results, original instruction ranges and exact constants. Six queries are
new; the current party request query is reused from the selected lobby recovery.
[verification-needed](../verification-needed.md#gap-270) owns outstanding runtime/parity status.

## Local packet-clock source connection (#95)

The source connection reviewed on 2026-10-29 uses the retained dispatcher and
floor-clock contracts below. The selected installed target is 0.127.0, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`;
the native evidence in this report remains bound to 0.123.0. This source repair
does not claim a new native correspondence assessment for 0.127.0.

An active local movement capture now samples the existing protocol uptime once
and carries that exact u32 in both `MovementReport::timestamp_ms` and the queued
movement command. `WorldWriter` preserves it in the ordinary timestamp field.
This includes parked Stops and the existing captured speed/knockback
acknowledgements, which remain excluded from ordinary movement relay admission.
Uncaptured socket sends retain writer-time sampling. No packet field, time
offset, epoch reset or new movement source is introduced.

The embedding serializes local movement and acknowledgement commands in solo
mode too. It discards bodies without an observer and publishes only ordinary
movement bodies to a host observer; guest forwarding keeps its existing route.
`gameplay::tick` supplies the captured u32 to `Recovery::admit_timestamped`.
Indoor timers therefore use the same packet clock for local and guest movement,
while pending correction expiry continues to use `Report::now`, the simulation
clock. Capture order, duplicate equal poses, opcode admission and the existing
floor/navigation behavior remain connected through their prior consumers.

`python3 -B scripts/check-coop-correction.py --source-only` checks those source
connections and syntax-parses 15 Rust files without compilation or native
execution. The historical native replay remains a separate default checker
mode with its original exact-target requirement. Authored regressions compare
each captured command with its encoded timestamp and preserve explicit zero,
unsigned-high-bit and wrapping endpoint values for movement and both captured
acknowledgement serializers; they have not been compiled or run. Actual local
floor/teleport behavior, network delivery, compilation and original/rebuilt
parity remain unverified. Wider floor/cache/navigation applicability is separate
from this completed packet-clock source connection.

## Native contract

| Current owner / exact range | Recovered contract |
| --- | --- |
| Movement request `145c07df0..145c0ae13`, tail `145c099a7..145c099ca` | After finite pose and assigned-actor admission, rebroadcast requires the floor result to equal byte1 and the source actor to remain active. |
| Actor dispatcher `145ae4870..145ae4c16` and remote closure `145bb79f0..145bb7b81` | Local and swapped remote movement pass the original u32 movement timestamp, converted to f32 seconds by division by1000, through the temporary timer-clock override. Context restoration clears that override. |
| Floor `145b0a060..145b0ad13`, pending `145b0a0de..145b0a149` | Pending correction ignores a report only while squared XY distance is strictly greater than9 and authoritative simulation time minus correction time is strictly less than3seconds. It consumes no report budget. Reaching the three-yard radius or the deadline clears pending. |
| Floor timer selection `145b0a149..145b0a168` | Indoor shallow, blocked, stationary and repeated-recovery timers use the movement clock when supplied. Pending expiry uses simulation time independently. The repeated-recovery interval uses the absolute f32 time difference. Floor, occupancy, boundary and deep-fall recovery remain enabled. |
| Floor result `145b0ac31..145b0ac56` | Return true exactly when final XYZ equals the original report, including equal signed zero; unordered comparisons fail. A generated teleport whose final XYZ is unchanged can still return true. |
| Movement broadcast `145c2ba80..145c2bc3c`, loop `145c2bba0..145c2bbce` | Pack the actual source actor GUID and preserve the original movement body. Iterate every actor slot except the source. This is separate from ordinary engine events and owner-only corrections. |
| Forced-position setter `145b2337e..145b233cc` | The actual forced XYZ, teleport counter and simulation timestamp seed the same pending state before the new pose is committed. The current tick additionally retains an automatic relocation setter using those fields. |

The floor's correction publication itself records pending time from simulation
clock `Game+c98`; its indoor timers can instead read `Game+bd4` when the override
bit at `+bd0` is set. The pending flag/position/counter/time are
`+bb8/+bbc/+bc8/+bcc`. These are recovered native offsets, independent from
reconstructed Rust layout.

The raw dispatcher has an external stack-probe seam and incomplete external/data
context. The broad boss/tick query omits a computed-dispatch branch in pseudocode;
original instructions independently establish the bounded forced-position setter.
This does not recover every condition or mechanic in that surrounding function.
Existing boss behavior retains its own provenance; this repair connects its
actual already-produced forced positions to the recovered shared admission state.

## Connected source

The historical 0.123.0 repair described here stores correction time and rejects distant reports
for three simulation seconds. `admit_timestamped` supplies the guest's actual
movement timestamp to the existing indoor timers. The ordinary local floor path
then remained available with its existing simulation-clock timer input. At that
point local captures did not expose the serialized packet timestamp; the later
#95 source connection above resolves that interface. The guest timestamp path and shared pending
deadline are repaired independently. A self-correction seeds its deadline once; forced local and
remote positions seed the same state with the current simulation clock. Remote
forced positions leave `Mechanics::tick_party` in production order and map through
the actual actor-slot/client association before a later guest report can arrive.

`gameplay/coop_commands.rs` commits the accepted or corrected pose and publishes
its existing owner-only teleport. Changed coordinates suppress movement
rebroadcast; unchanged coordinates preserve the original body. A dedicated
`CoopRuntime::route_movement` excludes the source actor. General events and private
teleports keep their existing recipient policy. Deferred movement and ordinary
events share one ordered publication queue, preserving object registration before
movement delivery. The source actor therefore receives no echoed movement through
the remote smoother, while other actors retain its movement stream.

The host's local movement forwarder likewise preserves original bodies and
consumes each admission exactly once, matching opcode and XYZ. The existing
benilla movement capture now exposes its actual `MoveKind` opcode; speed and
knockback acknowledgements remain separate captures and do not contribute relay
admission records. Repeated equal-position reports can consequently carry
different decisions without reusing an earlier acceptance.

The historical [floor](floor-recovery-0.100.1.md) and
[forced-position](raid-forced-position-0.112.0.md) evidence still describe their
original twelve-report budget. Their original native fixtures remain unchanged.
The Rust fixture replay omits only those superseded stale-budget vectors; the new
current tests cover elapsed time and movement-clock behavior separately.

## Static verification and limits

```sh
python3 -B scripts/check-coop-correction.py
```

The checker passes **467 isolated original-instruction cases /8,614 steps**,
including ordered/unordered XY and deadline boundaries, repeated stale reports,
clock override selection, unsigned timestamp conversion, exact final-position
comparison, active-source admission, recipient exclusion and forced-position
publication. Omitted engine functions use explicit synthetic stop/callback seams.
It verifies all seven exact input/query/result commitments and parses eight changed
Rust files with `rustfmt` without compiling them. Static source guards trace the
actual admission, deferred recipients, unchanged payload and forced-position
consumers.

The absolute six-second repeated-recovery check is verified through the current
bytes/decompiler and source trace; it is not an additional replayed native vector.

Four authored Rust regressions cover repeated stale reports independent of report
count, delayed indoor timestamps, duplicate local pose admission, and mixed
movement/private-event publication order. Those tests remain uncompiled and
unrun. No compilation, source/application execution, network connection, game or
server operation, or controlled original/rebuilt comparison occurred. Actual
multiplayer motion, teleport delivery, terrain behavior and parity remain
unverified. No further source omission is identified in this selected
correction/timing/recipient contract; wider floor and cooperative modules retain
their separate findings.
