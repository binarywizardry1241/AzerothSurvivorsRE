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
The mixed spans `0x14612b66b..0x14612bb81` and
`0x14612bbb5..0x14612c310` implement opposing TLS cipher identifier
conversions. The branch at `0x14612b108` indexes 256 signed offsets at
`0x147b28a84` after the unsigned `<= 0xff` guard. All 186 first-span leaves
return distinct internal selectors in AX and preserve the wire value in EDX.
The inverse at `0x14612bbb3` uses the 377 signed cells at `0x147b29170`.
All 186 forward selections round-trip exactly. The reverse vector has 375
immediate-return leaves, a bare return at index zero and an EDX-return
fallback at index 376. Five trailing `INT3` bytes retain their own encoding.
The adjoining formatter at `0x14612c310` indexes the same small selector
domain to text including `TLS_NULL_WITH_NULL_NULL`. This establishes a
shared cipher conversion boundary without changing the original range
accounting. The broader caller and handshake state remain separate.
The
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
Soulfire, font and amplification traces account for six. The
[dispatch join](evidence/0.141.0/as-residual-dispatch.json) connects 16 more,
including jumps into range interiors. It checks nine guarded vectors and one
fixed descriptor vector against complete original instruction boundaries.
The original 58-row selector stays reproducible, and 36 rows still lack a
reviewed entry.

| Jump | Proven input at the transfer | Joined range ordinals |
| --- | --- | --- |
| `0x140372ece` | Codex subtracts one from the descriptor value and admits the seven cells at `0x1465cb8c8`. Cells 2, 4 and 6 reach the same floating-constant block. | 1953 |
| `0x140385df7`, `0x1403894fa` | Two Armory paths subtract one and admit seven cells each at `0x1465cb9f8` and `0x1465cba14`. Both reuse the Codex vector constants and have corresponding three-cell branches. The upstream descriptor identity and final UI consumer remain open. | 1975, 1976 |
| `0x145ea0b2a`, `0x145ea0c38`, `0x145ea1e59` | The [three CreatureQuery selectors](computed-transfers-0.141.0.md#three-additional-creaturequery-tables) already prove these 206 cells and their recipient path. | 52293–52296, 52298–52299 |
| `0x145ea40d5` | Co-op poller walks 120-byte event rows returned by `0x145e8da50`. The signed first word either maps by XOR with the sign bit or selects the out-of-table sentinel 10. An unsigned comparison admits 0–9. The loop loads RBX from `0x147aed9ec` at `0x145ea3f96` before entering at `0x145ea3fc0`. The branch targets include denial, closure and hosting text publication. Full event constructors and transport state correspondence remain under [#63](../CURRENT-STATE.md#gap-63). | 52306 |
| `0x145eb6ccf` | Character Create checks the validator result against five. All six cells set one-byte replies `45`, `46`, `47`, `48`, `4f` and `50`, then `0x145eb8116` passes the byte with reply kind `0x3a` to `0x145ea3190`. The [retained rejection contract](hero-names-0.127.0.md#current-producer-and-validation), [name normalizer](../../crates/azeroth-survivors-re/src/hero_name.rs) and [roster Create consumer](../../crates/azeroth-survivors-re/src/save.rs) use the same six outputs. | 52349, 52352 |
| `0x145f6c05b` | The race descriptor consumer loads the base from `0x147af33a0` at `0x145f6c015`. Its eight-byte rows derive from the seven fixed descriptors selected by race IDs 2–8 and the Human fallback. The fourteen stored rows cover tags 0–11. All eight source race records match the projected scalar values. | 52976 |
| `0x145fbf3c5` | Cache generation matches the worn row's key, reads the candidate definition tag at `+0x44`, handles raw tag 16 separately, and admits the remaining in-range tags to a 20-cell table. | 53303–53305 |

The cache owner at `0x145fbef40` iterates all 23 rows of 72 bytes at
`0x1476f94e8`. Its key, base f32 bits, stable tag and slot match the live
[jewelry catalog](../../crates/azeroth-survivors-re/src/loot_rewards/catalog_01120.rs).
It skips excluded keys, counts occupied slots, and admits eligible new
items at weight 0.5. Raw tag 17 requires a qualifying base or learned Horn
spell, and raw tag 19 requires a learned periodic spell. Worn rows use weight
2.0 if the strict upper cutoff passes. The cutoffs are infinity for raw
tags 0–6 and 8, `(3 * base) * 0.9` for 7, 15 and 18, exact f32
`0x3f0a3d71` for 9, `(10 * base) * 0.9` for 19, and
`(5 * base) * 0.9` for the remaining finite cases. Raw tag 16 checks
remaining lives below two. These paths correspond to the existing
[`cache_candidates`](../../crates/azeroth-survivors-re/src/loot_rewards.rs)
called by the [live treasure owner](../../crates/azeroth-survivors-re/src/gameplay/mechanics/treasure.rs).

The race table reads one static descriptor selected from every possible
byte value at `Game+0x465`. The two class-selection paths normalize the
race byte by subtracting two and choose the fallback for an out-of-range
result. Its descriptor stores the row pointer and count at `+0x20/+0x28`.
The accumulator reads a dword tag and f32 value and advances by eight bytes.
Tag 7 multiplies pickup by one plus the value. Other cases add to the
corresponding scalar. The source [entry](../../crates/azeroth-survivors-re/src/gameplay/mod.rs)
and [refresh](../../crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs)
use the same recovered race values, with separately supplied level-growth
and exact Gnome recovery inputs. The join covers this initial descriptor
vector, with wider stat and gear contributions retaining their own scope.

| Journaled Ghidra slice | Original slice SHA-256 | Shared result SHA-256 |
| --- | --- | --- |
| `0x145ea3420..0x145ead071` | `6d3fe23bd5b101096f0343322ea410be01dca9f7e9054551af1742a4192583f5` | `292c367bedfccadda7f0b9fc09fa92d53d289fdf291a712e4ad5898ba5a6da4a` |
| `0x145f6bbe0..0x145f6d09b` | `f695f5df8bd17f933d6b4d828bef5b49fde7529d8c585aa5e88d9a9ae24bceeb` | `393fa6e5babfaa39f1b594cb5c4ffd1bc76e0a808615ceb112f46cebc91afe84` |
| `0x145fbef40..0x145fc03d9` | `38b0d67f8e43081b907de24902273df6277f11e18acb59af0a5511d3f3d3a2c1` | `513576a1dc0b0577c1ca8b47908d4f864960bf9b560da194d4dad8ea270fbf23` |

### Incoming cells for the remaining 36 ranges

The [entry-frontier proof](evidence/0.141.0/as-residual-entry-frontier.json)
finds an exact incoming signed-relative cell for every row left by the
preceding join. For each row it verifies the original range and containing
extent hashes, RIP-relative base load, signed dword lookup, base addition
and register jump. Every cell lands on an instruction boundary inside its
selected residual. Seven ranges begin after a direct jump, and the
reviewed incoming cell for each comes from a separate register dispatch.
The old 58-row selector and the 36-row remainder of its original join
stay reproducible. The full-image census and instruction union retain
their recorded counts.

Some exact cells also have reviewed producers:

- **Armory row 1999.** The descriptor at `[rbx+0x30]` is decremented at
  `0x140396ef2`; `0x140396ef9` rejects unsigned indices greater than six.
  Index 3 enters `0x140396fde` and checks the dword at `[rbx+0x58]` for
  value 2 before loading the visual constants. The descriptor's
  construction and final Armory presentation remain separate.
- **Font row 51478.** The loop at `0x145dd7815` reads 41 fixed 16-byte
  accent descriptors at `0x1473aad40`, with SHA-256
  `511f015aee27f04a3267e8cae2fa097ba352d380fa86b78293b9dc3cd519c256`.
  The byte at `+0xc` selects modes 0 through 4 with counts 29, 4, 2,
  4 and 2. All 41 records match
  [the live composite table](../../crates/azeroth-survivors-re/src/font_patch.rs).
  Mode 0 enters the residual and centers the mark over the base while
  placing it above the base's top plus the em-scaled margin. The current
  composite function already uses this placement.
- **Party command row 52569.** Index zero at `0x145ef89a5` reaches the
  generation check at `0x145ef89a7` and applies the selected card. The
  [seated ingress and republish trace](coop-replication-0.141.0.md)
  supplies the live Game and hero. The
  [choice owner](q41-reference-frontier-0.141.0.md#choice-completion-and-republish)
  supplies the generation and index conditions, with the remaining
  aliases of the wider dispatcher still under
  [`Q41-F01`](computed-transfers-0.141.0.md#q41-f01-declared-range-as-context).
- **Co-op actor row 52727.** The four returns of the producer at
  `0x145e5ff00` account for the four cells at `0x147af2f04`. Its zero
  return enters `0x145f25cd7`. The [actor input trace](computed-transfers-0.141.0.md#q41-f01-declared-range-as-context)
  establishes the live actor and two frame records.
- **Guardian hazard row 52804.** The raw action tag 35 normalizes to
  index 32 at `0x145f44194`. The unsigned guard sends it through
  `0x145f44277` to extend the active actor deadlines. The two continuations
  at `0x145f441c2` and `0x145f44311` share the same table. Its index 32
  reaches `0x145f476c3`. The current helper at `0x145db5b69` reads the
  windup at row `+8`; the deadline addition is windup, now, then 0.4
  seconds. The case passes the spell and windup to `0x145f435d0`, calls
  the hazard constructor, then stores the duration from row `+0xc` to
  hazard `+0x7c`. The current 56-byte move at `0x1473a9428`
  (SHA-256 `d38df8afe244aa8cdd38f1b79e8f1d21b99994560d0202056c74b643d66a4f53`)
  supplies spell 745, radius 5, windup 1.2, root duration 2 and factor 0.4.
  The two-move descriptor at `0x1473aa0b8` points to that row and carries
  enemy 11551 at `+0x30`. The live
  [Guardian signature](../../crates/azeroth-survivors-re/src/guardians/signatures.rs),
  [root action](../../crates/azeroth-survivors-re/src/bosses/raid_actions.rs)
  and [cast block](../../crates/azeroth-survivors-re/src/bosses/cast_presentation.rs)
  already supply those inputs and the same deadline arithmetic.
- **Scripted impact row 53146.** Index 1 at `0x145fa1a21` enters the
  existing [Kirtonos impact-mode 1 path](scholomance-kirtonos-0.141.0.md).
  Index 4 of that same table reaches row 53143 and calls `0x145f49e90`.
  The mode-4 producer and complete recipient behavior remain open.
- **Choice row 53291.** The
  [five-case constructor proof](q41-reference-frontier-0.141.0.md#choice-card-variants)
  already supplies the admitted payload tags and the live card producer.
  The same table's index zero enters `0x145fbc00c`.

The Guardian query used the original `0x145f43e90..0x145f49c9b`
Ghidra slice with SHA-256
`82b4194c35ef34a07373dfe67361c45e9cde717fc2e52ed6dea5034db02d0986`.
The completed operation
`a328a8efb1600470f5dd2428a96113905603fbed4970e0786b57c092c6224cb0`
returned evidence
`ev_0c5b730c4287108ee4d34c56469f354317703892abb1f5ebc9561cac925aaf42`
with shared result SHA-256
`9123bd6ccc75b39bdfbdc08caacec617944ccdad1ddfdeca595110e888dcdb28`.
The raw slice omits its external tables and callers. The original PE
instructions and data supply the exact case and row bindings.

Remaining work starts from the exact operand at each reviewed transfer.
Follow async state writers for 451/466/467, UI action and variant
constructors for 1124/1555/1587/1761/1845/1999, actor/attack/talent
fields for 52613, 52710–52717, 52758/52772, 52849/52890, 53096,
53143 and 53228, and shape or content-row producers for 52782,
52786–52788, 52808, 52984 and 54188/54224. The encoded cells
establish a local incoming path for each row. Admission, adjacent table
ends, full semantics and source correspondence keep their own evidence.

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
python3 -B scripts/classify-as-residual-ranges.py --dispatch-frontier
python3 -B scripts/classify-as-residual-ranges.py --entry-frontier
python3 -B scripts/classify-q41-residual-frontier.py --complement-projection docs/analysis/coverage/full-image-selected-0.141.0.json
python3 -B scripts/check-u04-trap-fill.py --complement-stops
```

These results preserve unobserved bytes, unresolved computed targets and
source ownership in #41. Compilation, gameplay and original/rebuilt parity
remain unverified.
