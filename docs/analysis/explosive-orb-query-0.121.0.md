# Explosive Orb query identity — 0.121.0

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This bounded discovery owns **[#247](../verification-needed.md#gap-247)**, separate
from [#224](../verification-needed.md#gap-224)'s Explosive combat rules. The
[proof](evidence/0.121.0/orb-query/manifest.json) binds exact current instructions,
tables, data, historical source and one journaled Ghidra query. The subsequent
[query source repair](explosive-orb-source-0.121.0.md) connects its exact current
locale and constructor contract; combat remains separately owned.

## Added guarded case and actual consumer

The current opcode selector `0x145b0f61e..0x145b0f63a` uses the low unsigned
opcode domain beginning at `0x4b`; table `0x1476642f8` cell 21 selects
`0x145b0f862` for **opcode `0x60`**. That branch supplies the existing bounded
little-endian entry-prefix path. Its selector at `0x145b10196` subtracts **9500**
and admits indices **0–112**, using the 113-cell table at `0x147664420`.
The predecessor's corresponding table had 112 cells. The added **index 112** is
therefore **entry 9612**, rather than a count change interpreted as a new mechanic.

Current cell 112 selects `0x145b1142e`, which loads descriptor
`0x146fc0cc0` and joins the named-object consumer `0x145b11495`.

| Descriptor offset | Exact current observation |
| --- | --- |
| `+0x00/+0x08` | Raw UTF-8 pointer `0x146fc0b2f`, length **13**, `Explosive Orb` |
| `+0x10` | u32 entry **9612** |
| `+0x14` | u32 display **16111** |
| `+0x18` | f32 bits `0x3f666666` (**0.9**); no scale consumer is proved here |

The actual name getter `0x145a99110..0x145a991a7` supplies the descriptor's
u32 `+0x10` to the existing integer-format interface with the exact packed
`object.` / `.name` formatter program. Its optional lookup result selects the
localized pointer/length when the pointer is nonzero. A null result preserves
the descriptor's raw pointer/length; a non-null empty translation remains empty.
The formatting implementation and locale-map internals stop at their existing
library/source interfaces.

The shared consumer reads display from descriptor `+0x14`, then supplies entry,
name, an empty subname, **creature type 10**, **rank 0** and **display 16111** to
metadata constructor `0x145b85c20`. The fixture stops at this interface; it does
not execute the constructor's serializer or certify wire output.

## Existing source difference and retained recovery

`gameplay/coop_commands.rs` already routes `CMSG_CREATURE_QUERY` through the
current entry reader and `client/creature_queries.rs::creature_query`.
The pre-repair source's `SPECIALS` row for **9612** supplied an **empty name**,
**type 8** and **display 10990**. That captured empty-name behavior and the
[0.120.2 finite CreatureQuery contract](creature-query-tables-0.120.2.md) retain
their historical target and source provenance; this update changes the selected
entry's current native identity. The [source repair](explosive-orb-source-0.121.0.md)
now applies the recovered name/type/display through the existing row and all
fourteen locale catalogs. Prior source and classified table questions are
preserved rather than reset.

`client/query_packets.rs` feeds the existing engine packet serializer/parser,
and `benilla-protocol/src/messages/parse.rs` retains valid empty names separately
from a high-bit query miss. Those are established source boundaries, not proof
of current reconstructed execution.

The owning current module is **`custom-game-server-party`**, through the AS
command/query producer and metadata consumer. `gear.rs` shares diagnostic
context with its containing native body; that association does not establish an
independent gear-module behavioral contract. The proof qualifies only the named
bounded query-identity scope. The source discrepancy is corrected under #247;
this does not certify the wider party module.

Exact current `object.9612.name` locale data, metadata source row and constructor
packet interface are now supplied by the [source proof](explosive-orb-source-0.121.0.md).
Other changed CreatureQuery cells and actual serializer/wire execution remain
separate. The 0.9 field remains a descriptor observation.
Orb spawn timing, direct-hit admission, area-spell immunity and damage belong to
the independently supplied combat item #224.

## Static checks and limits

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-explosive-orb-query.py
```

The [result](evidence/0.121.0/orb-query/static-check.json) verifies exact current
bytes/Capstone boundaries, the original table entries and source omission,
plus the durable 151-byte raw Ghidra subject/result. **Eight name-getter cases**
and **24 opcode/entry-to-constructor cases** execute **2,656 original
instructions**, covering missing, empty, ordinary and UTF-8 lookup results,
allocated/unallocated key cleanup and two-, three- and four-byte entry prefixes.
Formatting, optional lookup and deallocation are explicit synthetic seams.

Raw-Program pseudocode omits external bodies/data and has inferred argument
types; original registers/instructions govern this contract. Empty payload,
unmatched/default entries, the complete lookup map, serializer/wire delivery,
model/scale/rendering and combat behavior are not validated here. No application
compilation, compiling test, reconstructed Rust, client/game/network/server
operation or controlled original/rebuilt comparison occurred. Parity remains
unverified.
