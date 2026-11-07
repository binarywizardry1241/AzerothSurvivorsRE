# Local request dispatcher and desktop capability

Installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`,
141,932,032 bytes. **Q41-M03-local-dispatch-1458646d0**, under **#41**, classifies
the local opcode prefixes and the desktop's alternative-Gossip capability.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current status. This is a bounded
classification, not complete protocol semantics or source/runtime parity.

## Complete opcode domain, bounded input states

Current incoming owner `0x1458646d0` masks its opcode to sixteen bits. The
[proof](evidence/0.113.2/local-dispatch.json) covers **all65,536 opcodes in eight
synthetic profiles**: optional Game discriminant0/2 at wrapper+0x10, Game's
local/nonlocal flag0/1 at wrapper+0xc1d, and absent/present fallback row at
wrapper+0x1390. Payloads are32 zero bytes; channel flag/index remain0/0.
Each prefix stops before entering any callee outside the dispatcher. The
nonlocal-flag fixtures are excluded-context classification, not cooperative
execution or implementation.

Across these profiles, **43 opcodes** reach such a boundary. The other
**65,493** return without reading/writing synthetic host or payload memory.
Their executed traces use only opcode, stack and static table bytes, so these
are meaningful no-op classifications for this installed local dispatcher.
The exact complementary ranges, per-profile groups and trace/result hashes
are retained. Thirty-three upper-bit aliases separately confirm the mask.
Arbitrary table mutation and invalid machine state are not covered.

| Opcode family | Observed first boundary / role | Source or scope disposition |
| --- | --- | --- |
| 0x4b | allocation prefix of logout acknowledgement | Existing frontend/session departure owners; prefix does not certify lifecycle equivalence. |
| 0x50 | name lookup `1458630e0` or fallback serializer `1458d4300` | Lookup is gated by the nonlocal flag; ordinary local fallback uses the retained character. [Current local fallback delivery](name-queries.md), #68, now answers uncached GUIDs through the ordinary decoder; actual snapshot/cache timing remains unverified. |
| 0x56 | item descriptor `145825570` | [Current item-query/source contract](equipped-inventory.md), #55. |
| 0x5e | object name `145809000` | [Current object response and decoder](template-query-wire.md), #65. |
| 0x60 | current template selector `145847c70` | [Creature request repair](creature-queries.md), #64. |
| 0x95 | chat reader `1458a9c10` | Gated by the nonlocal flag in this dispatcher; ordinary local flag0 returns. No cooperative chat/backend implementation. |
| 0xb1 | GameObject-use wrapper `1458dd550` | Existing exact-GUID cache transaction; [current cache lifetime](cache-lifecycle.md). |
| 0xb5..0xc6, 0xc8..0xcb, 0xda, 0xdb, 0xee | 25 movement variants reach `1458dd920` | Existing real controller/pose interface; prefix recognition does not revalidate every movement payload/state consumer. 0xc7 is a default/no-op. |
| 0x10a/10b/10c/10d/111 | refusal serializer `1458d5730` | [Five request/refusal repairs](inventory-refusals.md), #67. 0x10e SplitItem remains a native default/no-op. |
| 0x12e | cast-result constructor `1458ca2f0`, then post-response selection wrapper | Existing manual-cast rejection; no invented cast or extra desktop choice action. |
| 0x13d | selection wrapper `1458ded90` after GUID handling | Existing local target selection; nonlocal snapshot swapping is excluded. Full alias/scheduling equivalence remains open. |
| 0x17c | Gossip option wrapper `1458db0b0` | Selected local option/terminal command routing observed; alternative Gossip presentation is disabled for the desktop host below. |
| 0x17f | cached NPC text wrapper `1458dcc30` | Same alternative presentation boundary; full enabled-host payload/consumer equivalence is not asserted. |
| 0x1ce | host clock boundary `145ca7360` | [Current local clock-query delivery](clock-queries.md), #69, now feeds the existing packet/clock/Lua sync route. The host clock remains a shared API boundary; actual clock/scheduling/platform parity is unverified. |
| 0x1dc | allocation prefix of echoed ping reply | Supporting transport context; the embedding has no socket. No transport/latency backend implementation. |

The 43 candidates are not43 source defects, and the prefix inventory is not a
complete semantic protocol enum. Each downstream handler keeps its own input,
state, source and runtime obligations. Full callback and source closure remain
open; this subset does not provide the missing global M03 inventory.

## Current desktop callback and Gossip guard

The current startup owner `14002eb70` supplies vtable **145ec6020** in R9 at
`14002ecd6`, calling `14581dd90`. That forwarder retains the callback data/table;
`145888010` passes them as the Core constructor's second/third arguments.
Current constructor `145867380` stores them at Core+1668/+1670.
Fresh Ghidra observes these actual bodies and the factory below. No old address
or layout is reused as proof.

Factory `1458807f0` calls Core's vtable slot+40 at `145880d79` and stores AL at
RBP+bb6. Its constructed Game begins at RBP-48, so this is **Game+bfe**;
the final native0xc18-byte publication includes it. The selected table's slot
points to **14005fb70**, exactly `xor eax,eax; ret`. Ten cases execute this
actual leaf, indirect call and store and produce zero. The callback body is
three bytes; metadata/table identity does not prove arbitrary runtime aliases.

Current choice publisher `1459672d0` returns for choice kindff or capability0.
Result publisher `145969320` returns unless capability1. **768 choice and three
result guard cases** establish their differing nonzero-versus-exact1 predicates.
With the recovered desktop false capability neither emits alternative Gossip.
This revalidates the old0.100.1 policy at current addresses; it does not relabel
that historical report or certify complete current constructors/publishers.

The reconstruction uses the separately recovered custom card/terminal overlays.
Its AS source has no `SessionEvent::GossipMessage` producer. The reused Gossip
request sender requires a present NPC, completed text query and an actual
option row. Adding a substitute Gossip UI is therefore not justified by these
native helpers. Cleanup's existing GossipComplete remains independent.

## Reproduction and limits

`python3 -B scripts/check-local-dispatch.py` reproduces **524,288 opcode
prefixes**, the default-memory-access audit, upper-bit aliases, callback and
guards against the configured installed EXE. Fresh Ghidra observations retain
five request wrappers, name helpers separately in ignored analysis, the factory,
Core/forwarders/startup, actual leaf and both publishers. The curated proof
records only the observations used by this classification; raw projects stay
under ignored runtime. [Interface extract](evidence/0.113.2/local-dispatch-interfaces.asm)
retains only the necessary callback/guard spans, without duplicating the full
incoming function or existing query/refusal extracts.

For fresh Ghidra reproduction use `scripts/rea-batch.py`, current function/code
seeds named in the proof, the configured installed target and disabled analyzer
profile from the existing census/REA setup. Query procedure info, instructions
and pseudocode; a fresh run has its own Evidence IDs and output commitments.
Do not overwrite or relabel retained observations with a different profile.

No downstream nonlocal helper, cooperative game, network/server process,
reconstructed Rust, real client/parser/VM, compilation or application executes.
The actual host/callback ownership, arbitrary aliases, active event/teardown
scheduling, enabled-host Gossip bodies, complete movement/query handling and
original/rebuilt gameplay/UI parity remain unverified. The source changes in
#64–#69 have their separate proofs. The opcode-prefix classification itself
establishes no additional defect; the downstream name-query investigation
subsequently repairs the missing local fallback under #68. All original
census/queue selectors and counts remain.
