# Cooperative movement admission and correction

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

## 0.141.0 teleport acknowledgement

The installed 0.141.0 EXE SHA-256 is
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [current manifest](evidence/0.141.0/coop-replication.json) binds the
selected ingress, packed GUID reader, local and seated consumers, and
correction producers to that EXE.

Engine7 opcode `0xc7` enters `0x145e9e8d7` and skips the packed GUID with
`0x145ecfe20`. The reader assembles a little-endian counter from up to four
remaining bytes and zero-fills a missing suffix. The GUID bytes are consumed
without selecting an actor. The indexed admitted peer and present Game
select the actual actor at `0x145e9f7bc..0x145e9f815`. The local branch
`0x145ef71c3` and seated branch `0x145ef73ba` clear the armed
`Game+0xf30` flag when the acknowledgement is unsigned greater than or equal
to the stored counter at `+0xf40`. The journaled Ghidra result below
supports the swap and restoration boundaries.

Floor correction at `0x145f6b6af..0x145f6b7c4` passes the old sequence to
the teleport serializer, increments the mover sequence and stores the same
sent counter in the pending correction. The forced-position path at
`0x145f3a5ae..0x145f3a680` follows the same sequence. Position and simulation
time belong to the same pending record.

The rebuilt publication binds the actual teleport counter to its matching
pending pose for the local or remote owner. The guest forwards the
controller's acknowledgement with a packed GUID on the AS wire. Stock
socket serialization keeps its existing shape. The host consumes the
guest ACK at the front of its ordered ingress with the assigned actor and
without waiting for terrain. It consumes its own controller ACKs in the
existing local report order, including when ordinary movement is held.
Lower counters leave the correction armed. Proximity and elapsed simulation
time retain their existing movement-report behavior.

```sh
PYTHONPATH=runtime/armory-recovery/python-libs \
  python3 -B scripts/check-coop-correction.py --teleport-ack
```

The replay passed 3,329 packed prefixes, four peer admission cases and
100 local and seated counter cases over 412,781 original instructions.
The checker also checked the source routes and syntax-parsed eight Rust
files. The fixture, compilation, live transport, movement and parity
remain unverified. The seated wrapper result
`ev_c82fabb74b8b04f5f54413d96584c3a114f344d45d4664e648c99fcad997a189`
has digest `b3af33991abc51f0137cbf56725cdec2fbbbd6786c546ba41d3db9cda51b2813`.
Its exact PE slice at file offset `0x5ef6580` is 832 bytes with SHA-256
`6df8c73c4c29d7b885848edbc12873926d8dbceb065842ef603cfd8c2322e1fd`.

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

The historical [floor](floor-recovery.md) and
[forced-position](raid-forced-position.md) evidence still describe their
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
