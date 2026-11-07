# Inventory move/destroy refusals

Installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`,
141,932,032 bytes. **Q41-M03-inventory-refusal-1458646d0** follows the local
request consumer under **#41**. Permanent finding **#67** records the dropped
refusal responses; true inventory/item metadata remain **#55**.
[verification-needed](../verification-needed.md) owns current status. The source/static
repair is complete for these five requests; actual UI behavior and parity are
unverified.

## Recovered contract

Current incoming owner `0x1458646d0` explicitly refuses the five operations
below. It reads at most the first two payload bytes, zero-filling absent bytes.
There is no successful move, destruction or inventory-state mutation in these
selected branches. The branch reaches serializer `[0x1458d5730,0x1458d586d)`,
then the existing sender `0x145885a50`.

| Opcode | Actual client command | Selected byte | Reason |
| --- | --- | --- | --- |
| 0x10a | AutoEquipItem | second: slot | 0x15 |
| 0x10b | AutoStoreBagItem | second: source slot | 0x15 |
| 0x10c | SwapItem | second: destination slot | 0x15 |
| 0x10d | SwapInvItem | first: source slot | 0x15 |
| 0x111 | DestroyItem | second: slot | 0x18 |

For selected slots0..18, the first item GUID is
`0x4000000000000100 | slot`; otherwise it is zero. These are the same ordinary
item identities the current inventory publisher supplies. Bag identity, other
slots, destroy count and trailing bytes do not affect this refusal. Preserve
those native restrictions even when a different policy seems more useful.

The serializer emits opcode0x112 and an **18-byte body**: reason u8, first item
GUID u64, zero second GUID u64 and zero bag-slot u8. Reasons are nonzero and
neither is1, so no required-level field is present. In the reused client,
reason21 maps to `ERR_CANT_SWAP`, reason24 to `ERR_DROP_BOUND_ITEM`.
The ordinary inventory failure consumer queues the error and unlocks the two
GUIDs named by the response; it does not infer additional source/destination
GUIDs when the packet supplies zero.

## Source repair

`local_client/requests.rs` previously discarded all five commands in its catchall.
It now forwards their opcode and exact first/second wire bytes through the
existing local request queue. The mapping preserves SwapItem's destination-first
layout and SwapInvItem's source-first layout. No transport is introduced.

`gameplay::resolved_requests` consumes each request once and forwards the
current AS refusal through `client/inventory_requests.rs`. That adapter serializes
the recovered body and calls the existing `parse_server`/`decode` before
publishing `InventoryFailure` through `LocalPresentationEvents`. The normal
inbound inventory/error/lock feed remains the consumer. No equipment snapshot,
item object or mechanics state changes in this adapter. Like the other local
requests, it drains inactive runs and needs no terrain-ready gate.
The [current lifetime correction](local-request-lifetimes.md), #70,
uses actual local-channel activation rather than Game presence: these refusals
still answer without an optional Game and stop when the channel disconnects.

The source omission and consumer connection are established by tracing source;
a stuck-lock symptom was not reproduced in the application. The proof does not
establish every native-client error-table or lock timing detail. The engine's
existing implementation is reused at this packet boundary.

## Evidence and checks

The [proof](evidence/0.113.2/inventory-refusals.json) commits the current incoming
owner and serializer ranges, fresh serializer REA/Ghidra Evidence IDs, retained
current incoming observations, all-case result hashes and eighty native wire
fixtures. The [serializer extract](evidence/0.113.2/inventory-refusals.asm) is its
single current native copy. Full incoming bytes are read from the configured
installed EXE rather than duplicated into another extract.

Run `python3 -B scripts/check-inventory-refusals.py`. Original instructions
pass **327,680 routing cases** (all65,536 first/second-byte pairs per opcode)
and **2,565 exact packet cases**, including1,285 truncated bodies and1,280
bodies with ignored tails. The eighty Rust fixture inputs cover slot0,18,19,255
and both-byte selection boundaries. Source guards trace the five projections,
serializer, presentation push and existing error/unlock consumer.

Allocation and the final sender are explicit replay seams. Only these five
local branches execute with synthetic state; no cooperative branch, server,
network or game runs. The reconstructed Rust and native client parser do not
execute. Four changed Rust modules syntax-parse; projection, decoder and
exactly-once/inactive bridge regressions are authored/unrun.

Compilation, actual drag/equip/destroy operations, item locks/error rendering,
schedule/teardown behavior, FrameXML and original/rebuilt UI parity remain
unverified. Other incoming opcodes and complete protocol/type/alias ownership
remain open under #41. Original census and residual selector counts do not change.
