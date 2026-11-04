# Executable residual roles in 0.141.0

The installed EXE is 151,493,632 bytes with SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This review uses the [selected Ghidra census](coverage/full-image-selected-0.141.0.json),
the original EXE bytes and the independent declared and complement inventories.
It covers the four selected leads in the [#41 queue](unknown-recovery-0.141.0.md).
The selected instruction union and the original selectors retain their counts.

## Q41-B01 executable section

The [executable residual proof](evidence/0.141.0/executable-residual-frontier.json)
checks the original bytes of all 488,306 ranges outside the selected instruction
union. The encoding and reference results keep PE-declared membership separate.

| Encoded bytes | Declared ranges / bytes | Outside declared ranges / bytes |
| --- | ---: | ---: |
| Uniform `INT3` | 2 / 2 | 220,195 / 1,594,340 |
| Uniform one-byte `NOP` | 3,950 / 4,741 | 11,559 / 13,131 |
| Complete `NOP` or `INT3` sequence | 46,056 / 393,285 | 197,793 / 1,698,295 |
| Mixed | 8,354 / 4,865,908 | 397 / 51,897 |

The join checks all 4,218,711 selected Ghidra references, 4,073,041 declared
linear reference records and 13,945 complement reference records, plus PE
relocations, admitted handlers, directory entries and applied guarded targets.
Only the declared linear inventory enters a residual range. Its 100,610
encoded direct jumps enter 6,194 declared mixed ranges. Its 139 address records
identify 96 distinct addresses in 74 outside-declared mixed ranges. No joined
destination enters a range composed solely of `NOP` or `INT3` encodings.
An absent recorded destination leaves fallthrough and dynamic entry separate.

All 96 address-taken prefixes decode through a first unconditional `JMP` or
`RET` within their respective bounds. Of the 84 jump-ending prefixes, 37
are exactly `mov rcx,[rcx]; jmp rel32`. The other 12 prefixes end in `RET`.
At `0x145d034a3`, the literal address `0x145ca9de0` is stored in a pair of
format argument descriptors passed to the interpreter at `0x14637fd90`.
That address dereferences the receiver and tail-transfers to `0x145ca8360`.
This establishes the adapter's role at this use. Other address records do
not by themselves establish a caller, argument type or runtime admission.

Three other outside-declared mixed spans are code at a graphics formatting
boundary. The original bytes in `0x144e32ae0..0x144e330a4`,
`0x144e332fc..0x144e33d34` and `0x144e39506..0x144e39a10` decode completely into
62, 110 and 54 leaf adapters respectively. Each loads a RIP-relative string
and tail-transfers to `0x14637f150`. The 219 adapters that set the length
locally read Vulkan format or structure labels, including `D32_SFLOAT` and
`PHYSICAL_DEVICE_VULKAN_1_1_PROPERTIES`. Seven preserve the incoming length.
Their selector and actual callers remain separate from the leaf role.
Two more mixed spans, `0x14612b66b..0x14612bb81` and
`0x14612bbb5..0x14612c310`, contain 186 `mov ax,imm16; mov edx,ecx; ret`
and 376 `mov ax,imm16; ret` encodings respectively. The five trailing `INT3`
bytes in the latter retain their own encoding. The constant identities and
entry producers for these leaves remain unproved. The
[CRYPTOGAMS identifier](native-census-0.141.0.md#embedded-identifier-outside-declared-extents)
retains its earlier data and alignment classification.

## Q41-U01 declared extents

All 372,623 declared extents decode linearly through their recorded ends.
The [AS Location proof](evidence/0.141.0/as-residual-ranges.json) selects 193
mixed residuals, covering 127,970 bytes in 49 of 404 declared extents with
genuine AS Rust Locations. Whole-extent decoding establishes both boundaries
for each of the 193 intervals. Each begins after a `JMP`, `RET` or `UD2`.
Of these intervals, 135 receive 555 encoded direct jumps from the declared
pass. The 1,207 `NOP`/`INT3` candidates in those AS extents and 11 mixed
literal-only ranges retain their distinct selectors. A diagnostic Location
is context for the investigation, and semantic ownership comes from the
producer and consumer trace.

Six mixed residuals in the co-op TCP poller total 793 bytes, selected by
missing-executable-range ordinals 51872–51877. Two start at `0x145e26778`
and `0x145e269d2`, following signed-relative dispatch indexed by the low two
bits of the tagged I/O result. The stores between address formation and
transfer explain their absence from the strict guarded-table producer. The
[journaled Ghidra raw-slice trace](evidence/0.141.0/tcp-pump-residuals.json)
at `0x145e266d0..0x145e26c0e` and original table bytes supply the four vectors
in index order.

| Table VA | Case destinations (preferred VA) |
| --- | --- |
| `0x1477244f8` | `0x145e26778`, `0x145e2681d`, `0x145e267d7`, `0x145e2680d` |
| `0x147724508` | `0x145e26833`, `0x145e26887`, `0x145e26841`, `0x145e26877` |
| `0x147724518` | `0x145e269d2`, `0x145e26a75`, `0x145e26a2f`, `0x145e26a65` |
| `0x147724528` | `0x145e26a91`, `0x145e26ae4`, `0x145e26a9e`, `0x145e26ad4` |

The read and write paths use the `recv` and `send` IAT slots at `0x14654fe38`
and `0x14654fe40`. Kind 13 (`WouldBlock`) ends the current stage, kind 35
(`Interrupted`) retries it, and other failures clear the live byte. The read
stage still reaches the write stage in that pump after clearing the live
byte. The ordinary receive, send and close wrappers reach the same pump at
`0x145e3e614`, `0x145e3e7b0` and `0x145e3e838`. The live
[`TcpConnection::pump`](../../crates/azeroth-survivors-re/src/coop/tcp.rs) implements
these conditions, with callers in the [co-op session](../../crates/azeroth-survivors-re/src/coop/session.rs).
The existing [transport contract](coop-transport-0.115.0.md) retains its
original provenance. A separately known interval at
`0x145e27318..0x145e274c4` is the
[five-lane Soulfire upgrade calculation](soulfire-0.141.0.md).

The font selector at `0x145dd8f0b` subtracts `0x44` from the first byte and
admits the 45 cells at `0x1476f3c64`. It enters the `DSIG` and `loca` lanes
at `0x145dd8f0d` and `0x145dd9080`. The
[font publication trace](font-table-publication-0.141.0.md) already binds
the tags and source consumer.

The content selector at `0x145f8d9c1` normalizes the effect tag and checks
the 20-cell table at `0x147af3508`. Raw tags 50, 51, 59, 67, 68 and 69 reach
nondefault cases. One reaches the residual at `0x145f8d9c3`. The observed
caller at `0x145f1af9f` adds the returned scalar to its victim multiplier
before applying hit damage. The same six tags feed the live
[`spell_amplification`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/enhancement.rs)
and hit consumers. No source discrepancy was established on these routes.

The raw static join found 58 ranges without an incoming edge. The TCP,
Soulfire, font and amplification traces account for six of them. The other
52 exact ranges stay open. Thirty-nine immediately follow indirect
transfers. Thirty-seven have a nearby RIP-relative base and an indexed
signed load added into the jump register. The transfers at `0x145ea40d5`
and `0x145f6c05b` use an earlier base. Prove selector bounds and base dominance
before accepting their case destinations. The other thirteen immediately
follow direct transfers elsewhere. Join the proved table destinations to
these successors before proposing new entries. The original 58-row selector
remains reproducible on the same pass.

## Q41-U03 executable complement

The [complement projection](evidence/0.141.0/executable-complement-projection.json)
checks all 351,512 complement regions and 5,376,717 original bytes. The
331,286 regions whose complete encoding is a `NOP`/`INT3` candidate contain
2,690,758 bytes unobserved by both passes. The other 20,226 regions contain
2,685,959 mixed bytes. The selected Ghidra pass observes 2,019,054 complement
bytes. The independent traversal observes 337,610 bytes in 78,661 instructions,
with 12 bytes observed only in that traversal. The union covers 2,019,066
complement bytes, leaving 3,357,651 unobserved in either pass.

The independent-only bytes at `0x1461e6514..0x1461e6520` are the last twelve
one-byte NOPs on the fallthrough from `mov ecx,0xa` at `0x1461e64fe` into
`add r10,[rdi]` at `0x1461e6520`. The selected census also observes the
alternate edge `0x1461e69ff` to that loop entry. This bounds executable
alignment at this specific entry and leaves the other candidate runs open.

The most-seeded region is `0x1400021b2..0x140002210` with 258,056 seed records
targeting five observed one-instruction bodies. The four `E9 rel32` entries
at `0x1400021c0`, `0x1400021d0`, `0x1400021e0` and `0x1400021f0` forward to
`0x14634eba0`, `0x14634ec00`, `0x14634ec40` and `0x14634eda0`. They reach
the shared `GetProcessHeap`, `HeapAlloc`, `HeapFree` and `HeapReAlloc` paths.
The fifth entry at `0x140002200` returns directly. The heap role is established
at these entry boundaries. Surrounding bytes and other leaf entries keep
their own classifications.

The selected pass covers all bytes of `0x1463752bd..0x14637534a` and
`0x146375449..0x14637545e`, both missed by the independent seed traversal.
Seven leaf adapters there tail into shared formatting paths. Five have exact
DIR64 producers, including `0x147b8c160` into `0x1463752bd`. That leaf loads
lengths from `0x147b8c410` and signed text offsets from `0x147b8c440`. Six
observed entries resolve `Empty`, `InvalidDigit`, `PosOverflow`, `NegOverflow`,
`Zero` and `NotAPowerOfTwo`. The leaf uses the formatter sink and has no
local bound for that discriminator. Two other adapters pass dereferenced
inputs to `0x1463753e2` and `0x14637534a`. Their entry producers remain open.

## Q41-U04 seeded traversal stops

The [stop proof](evidence/0.141.0/complement-stop-proof.json) checks all 5,943
records against the independent traversal and exact selected instruction
and body starts. All 39 stops at the file-backed complement boundary equal
the next declared unwind entry and have an immediately preceding decoded
complement instruction. No invalid or truncated stop remains in this selector.

| Stop class | Records | Established boundary |
| --- | ---: | --- |
| Return | 3,047 | Encoded return ends the traversal. |
| Direct jump | 2,185 | All reach one of 1,116 observed owned instruction starts. 803 edges enter declared unwind entries and 1,382 enter complement starts. |
| Indirect jump through a fixed IAT slot | 126 | The slot is identified. The live destination is a separate question. |
| Indirect jump with runtime operand | 539 | The transfer ends traversal. Runtime targets remain in `Q41-F02`. |
| Trap | 7 | Three `UD2` receive same-body conditional jumps. Four `INT 0x29` have an observed `mov ecx,7` fallthrough predecessor. |
| Complement boundary | 39 | The next declared start is already in the selected pass. |

The two screens-related stop owners follow the existing
[#317 world reset](world-anchors-0.141.0.md) and
[#33 `noSpellEffects` publication](../verification-needed.md#gap-33).
The two upgrade tails share `0x145fb7120` after the pending
choice and enabled-state gates. The party tail passes a peer field from the
`0x8a0` stride into `0x145ef38f0`. Their immediate flow belongs to the existing
choice and party findings [#91](../verification-needed.md#gap-91) and
[#153](../verification-needed.md#gap-153). The stop evidence establishes the
selected transfers without establishing a missing gameplay behavior.

## Reproduce the bounded checks

```sh
export PYTHONPATH=runtime/tests/query-python-deps
python3 -B scripts/check-q41-range-encodings.py --census-summary docs/analysis/coverage/full-image-selected-0.141.0.json
python3 -B scripts/classify-as-residual-ranges.py
python3 -B scripts/classify-q41-residual-frontier.py --complement-projection docs/analysis/coverage/full-image-selected-0.141.0.json
python3 -B scripts/check-u04-trap-fill.py --complement-stops
```

These results preserve unobserved bytes, unresolved computed targets and
source ownership in #41. Compilation, gameplay and original/rebuilt parity
remain unverified.
