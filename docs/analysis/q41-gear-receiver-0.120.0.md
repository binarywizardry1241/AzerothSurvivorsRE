# Cooperative equipment notices and ownership — 0.120.0

Selected installed target SHA-256:
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
Permanent **#41**, lead **Q41-F01:site=0x145b02ada**; independent source defects
**#192** (missing guest loot notices) and **#193** (Tester ownership/save bypass).
[verification-needed](../verification-needed.md) owns their current implementation status.

The gear-context indirect call is an **AS frontend request interface**. It sends
an owned equipment-drop JSON notice to the application queue. It is not an
unclassified engine callback. Following its actual receiver and consumers proves
that the reconstructed guest equipment receiver omitted loot notices. The same
native owner separately excludes the Tester roster identity from permanent
equipment insertion and Save admission, while retaining its notices.

## Receiver construction and lifetime

The application owner `14002bd20` constructs the receiver and calls installer
`145ae9390`, passing the object and readonly method table `146175030`.
Wrappers `145ae9390` and `145b28a90` forward that pair into local-server
constructor `145b064c0`. The constructor captures incoming `rdx`/`r8`, then stores
them at server `+17b8`/`+17c0`. Method-table slot `+18` is **`145aceed0`**.

The gear owner `145b022d0` builds a JSON object with exact keys
`type`, `name`, `rarity`, `icon`, `slot`, `new`, and type value `drop`. Once the
closing brace has been appended, its server-mode branch selects:

| Mode | Delivery |
| --- | --- |
| `2` | Load receiver and method table from `+17b8`/`+17c0`, then call slot `+18` with payload pointer and byte length. |
| Other values | Append the owned String triple to the server's local frontend queue at `+668/+670/+678`. |

`145aceed0` copies the incoming byte span into its own allocation before
appending a String triple to the shared frontend queue. The caller can then free
its original String. Empty input retains the native empty-string representation.
The mutex/allocator/threading implementation remains the existing interface
boundary; this repair does not reconstruct or operate that subsystem.

## Actual guest producer and frontend consumers

The admitted guest tag-13 / native enum case `0xc` in `145b261f0` checks server
state `+ca0 <= 1` and a nonzero field at `+fa8`. It uses the
existing item-filter owner `145aa8960`, then caps the resulting vector against
the remaining **64-item budget** at `+fc0` before calling `145b022d0`. Filtering
and transport admission retain their existing owners; this notice repair does
not replace them or accept a new packet type.

The application frontend `140278d90` admits the exact four-byte `drop` type and
retains the JSON Value in its pending drop queue. It also stores the Value with
the current timestamp in the separate timed loot queue. These are actual
downstream queue consumers. The separately inspected `140231310` initializes
navigation/page state, including the Drops page; it is supporting context and
does not establish the notice-card renderer. Current native presentation beyond
the queue remains unproved.

Before #192, reconstructed `WirePacket::Words { tag: 13, .. }` accepted IDs and
wrote account equipment, but produced no `RunEvent::EquipmentLoot`. Its new
`CoopGame::receive_equipment_grants` helper now publishes one ordered notice per
accepted item, with sequential `is_new` state. An active replica receives the
events directly. Earlier delivery retains them in the existing pending event
queue, which replica bootstrap drains; leaving clears that queue. The existing
source loot-notification/card route consumes these same events, retaining its
historical recovery and unverified current rendering. Repeated IDs remain
separate notices. Existing Context teardown is preserved; this receiver proof
does not establish that notices should survive Menu/End or a different Context.

## Tester ownership and Save admission — #193

The current [race account proof](race-account-0.120.0.md) identifies server
`+17c8` as the selected roster GUID. At `145b023fc`, the gear owner compares it
with **`0xffffff`**, the existing Tester identity. Ordinary recipients search and
insert into the sorted owned-equipment vector; Tester recipients search that
vector for notice newness but skip insertion. Consequently, a repeated unowned
Tester drop continues to be marked new, while a repeated ordinary drop becomes
owned after its first grant.

After every item, `145b02b81` accumulates dirty state only for
`is_new && roster_guid != 0xffffff`. At `145b02c33`, a clear dirty bit skips the
later Save/publication path. An already-owned ordinary batch and every Tester
batch therefore retain notices without this account write.

**#193 source/static repair is connected.** The receiver now derives retention
from its captured entry roster GUID and excludes `TESTER_GUID`; a missing adapter
identity supplies no account owner. Each item checks membership before optional
insertion. Only a new retained item changes the local owned set and dirty bit.
The backend equipment write and account commit run once when that batch is
dirty. Already-owned ordinary batches and Tester batches retain their notices
without this account write or revision. Repeated unowned Tester drops therefore
remain new; ordinary duplicates become owned after the first grant.

The strict source guards bind that captured identity, exact Tester constant,
membership-before-insertion ordering, per-item notices and single dirty-gated
account write/commit inside the actual helper. Six Rust regressions are authored
for these notices, pending delivery and ownership cases; they remain
uncompiled/unrun. No further selected source omission is identified. Actual
recipient/UI/file behavior and original/rebuilt parity remain separate.

## Evidence and checks

The [compact proof](evidence/0.120.0/gear-receiver/proof.json) binds twelve
nonoverlapping selected instruction islands, readonly method-table bytes, the
seven exact payload literals and eight receiver/drop-queue Ghidra results, plus
one supporting navigation-context result, in the durable
[query commitments](evidence/0.120.0/gear-receiver/queries.json). Original results
remain in the shared analysis store; the
[canonical extract](evidence/0.120.0/gear-receiver/native.asm) contains only the
selected ranges, without duplicate whole-function decompiler output.

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/armory-recovery/python-libs python3 -B scripts/check-q41-gear-receiver.py --require-tester-source
```

The bounded checker verifies **185 original-instruction cases / 5,705
instructions**: sorted insertion and sequential newness, Tester bypass and dirty
Save admission, actual constructor argument/field storage and installed method
table, mode-specific callback/queue delivery, guest lifecycle/budget
boundaries, receiver-owned String lifetime, exact `drop` discrimination and
Value/timestamp queue insertion. Synthetic preallocated vectors, item
lookup/filter, allocator/copy/deallocation and interface calls are explicit
seams. It also checks the current live source event/queue connections and strict
captured-identity/newness/dirty-Save guards. No native ranges or query receipts
are changed by the source-only Tester repair.

Ghidra's inferred types and unrelated incomplete frontend branches are not used
as executable contracts; the selected original instructions govern these checks.
These checks do not execute Rust, a full constructor, mutex/service/thread,
network client/server, game or renderer. Compilation, actual packet/UI/file and
gameplay behavior, concurrency and original/rebuilt parity remain unverified.
The two selected #41 callable identities are bounded classifications; broader
native ownership and module #92/#145/#151/#153 remain separately owned.
