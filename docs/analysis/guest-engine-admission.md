# Guest Engine event admission

Finding **#180**, discovered through **#41 / Q41-F01 / Q41-M01**. The selected
installed EXE is 0.119.0, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
The [proof](evidence/guest-engine-admission.json) binds native ranges,
the complete computed table, reused current Ghidra results and live source slices.
[verification-needed](../verification-needed.md) owns current reconstruction status.

The guest receive arm previously decoded and observed every incoming Engine
opcode/body, then appended it to `LocalWireEvents`, including before guest
synchronization or after its local engine port had ended. The ordinary protocol
parser is a different boundary: it does not implement AS's native event policy.
The shared `coop/server_party.rs::guest_engine_packet_allowed` now admits the
exact 75 native opcodes with body length at most **65,533 bytes**. The live
`CoopGame::guest_engine_packet` also requires the guest synchronization state
and its receiving local engine port before either observation or queue insertion.
Admitted opcode/body bytes are preserved. Host-side guest command processing
keeps its independently owned direction and admission rules.

## Recovered contract and source connection

| Boundary | Current native evidence and connected source |
| --- | --- |
| Complete opcode/body predicate | `145ae0ce0..145ae0e04` rejects lengths above `0xfffd`. For opcodes `0x96..0x1de`, subtraction and comparison bound exactly **329 signed-i32 cells** at `1472da60c..1472dab30`; every cell targets either unconditional admission or the movement fallback. Four bounded bitsets, explicit opcodes and the movement predicate supply the other cases. The complete u16 domain yields 75 admitted values; the source's sorted whitelist contains exactly those values. |
| Guest and synchronization gates | Receiver `145b1cd7f..145b1cd8f` requires native mode `0/1` and bit 0 of server `+fd1`. Current request branch `145b099ee..145b09a1c` sets that same synchronization flag during the actual `CMSG_PLAYER_LOGIN` path, before synchronization publication. The source's existing guest branch and `sync_sent` preserve those separate conditions; bootstrap sets the flag only after `local.begin` and successful synchronization send. |
| Actual receiving engine port | `145b1cdb0..145b1cdec` requires a nonempty actor vector, scans rows of stride `0xb0` and selects the first nonzero `+a8` row. `145b1d4f8..145b1d520` copies the unchanged received cap/pointer/length/opcode record and calls `145afd100` with that exact actor index. The existing source embedding has one receiving local port: `LocalClientSession.active` is the actual admission predicate in `LocalWireEvents::dispatch`, independently of world readiness. The new guard checks this port before queuing; previously an inactive port retained queued packets for a later session. This is an explicit adapter connection, not a claim that the source reproduces the native actor layout. |
| Delivery and lifetime | Admitted packets still follow `EnginePacket::decode_server` → `observe` and the unchanged opcode/body → `LocalWireEvents` → production parser/decoder/handler table. The existing `leave` resets `sync_sent` on zone replacement and recovered End/transport teardown paths; `LocalClientSession::begin/end/logout` own its active port. No `world.ready` gate delays the pre-world initial snapshot. |

Four existing current-target Ghidra results are reused after checking their
original result, Evidence, profile, input and normalized-text digests. The
predicate's raw-range decompiler result omitted the external table; the installed
hash-bound table bytes and the actual opcode guard resolve that finite computed
dispatch. No new import, byte-copy of the reference EXE or broader engine
reconstruction was needed.

## Static validation and limits

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/check-guest-engine-admission.py
```

The check passes **262,144 original-instruction predicate cases**: every u16
opcode at lengths 0, 65,533, 65,534 and `u64::MAX`. It separately passes **2,625
original receiver cases**, including both admitted native modes, other mode
values, sync bit states, empty/inactive/multiple ports, first-port selection,
admitted/refused opcodes and the length boundary. Exactly **144** receiver cases
reach callback preparation. The fixtures execute **6,070,981 native instructions**
with no substituted host calls. They verify exact callback actor/index/record
arguments and unchanged payload bytes. Execution stops before the callback or
rejection cleanup, so this does not run the client, network or native game.

The source checks bind the full sorted opcode set, length boundary, guest-only
guard before observation/queueing, existing synchronization/reset lifetimes and
the actual local port consumer. Both changed Rust files pass syntax-only
`rustfmt --emit stdout` parsing. Two Rust regressions cover opcode/length edges
and guest synchronization/port/leave behavior; they are **uncompiled/unrun**.

No further missing source operation is identified for this admission boundary.
Actual transport/client scheduling, packet delivery, local port replacement,
compilation and original/rebuilt parity remain unverified. Native internal mode
and actor-layout meanings beyond these exact reads/writes are not reconstructed.
This repair does **not** establish a guest synthetic item-text registry producer
or carrier; **#101 remains blocked** at its independently recorded boundary.
The wider #41 computed/alias/type/source populations remain open.
