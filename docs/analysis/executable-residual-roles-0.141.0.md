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

The [formatter operand proof](evidence/0.141.0/addressed-formatters.json)
follows all 59 address materializations for the 37 dereference-tail
adapters in that selector. Fifty-eight materializations for 36 adapters
write a callback field at `+8` in a live 16-byte format-argument row.
Fifty-one pass the row base in R9 to the interpreter at `0x14637fd90`.
Three pass it in R8 to the owned String formatter at `0x146378290`,
which forwards it to the same interpreter. Four pass a Debug field
record to `0x14637bc40`. The record points to the row at `+8` and the
exact vtable at `0x146a58848` selects `0x1463898b0`, which forwards that
pointer to the interpreter. These are shared formatting interfaces.
Individual format programs, invocation and caller semantics remain
separate.

The remaining site at `0x14270617d` materializes adapter `0x1426ea4f0`
and stores it at `[rbp+0x4e8]`. The first call at `0x142706242` takes
`RDX = RBP+0x470`, which carries the row indirectly. `0x1427060d5`
sets RBX to `RBP+0x4e0`. Stores at `0x1427061df` and `0x1427061e6`
pair the `adt … layer array … KiB` format program with that row base
at `RBP+0x740`. The descriptor at `RBP+0x720` holds this pair and the
`tracing_core::field::Value` vtable at `0x1469cda20`. The event's
`+8` slot at `RBP+0x478` points to that descriptor.

The dispatch body at `0x145a047d0` offers the event to the selected
subscriber's `+0x50` method and calls its `+0x58` method on acceptance.
The `Value` method at `0x145a06150` passes the argument pair and the
Debug vtable `0x1472f3350` to the visitor's `+0x60` method. The Debug
method at `0x1463898b0` forwards the format program and the original
row base to `0x14637fd90`. This is the pre-overwrite formatting path
for the ADT loader's existing [layer-array debug log](../../crates/benilla-assets/src/adt.rs).
The active subscriber and visitor determine whether they format the record.

On normal return the SIMD store at `0x14270626e` replaces the callback
field before the direct `R9` argument at `0x142706281`. The
[unwind map proof](evidence/0.141.0/addressed-formatters.json) binds
the containing PE entry at `0x1427053d0` to
`VCRUNTIME140.dll!__CxxFrameHandler3` and its FuncInfo at `0x1480d5984`.
The call is in state 16 with no catch table. All 13 cleanup funclets on its
state chain rebuild the parent frame from `RDX+0x80`. None directly accesses
the eight bytes at parent `RBP+0x4e8`. The first cleanup uses the flag at
`+0x7ff` and the allocation pair at `+0x5f0/+0x5f8`.

The same checker verifies the initial instructions and terminal operands
for all 59 other address-taken prefixes:

| Initial prefix | Count | Immediate role |
| --- | ---: | --- |
| Tail to `0x14637f150` | 32 | Supplies text pointer and length to the shared formatter. The sink loads the formatter vtable's `+0x18` method and forwards both arguments. |
| Tail to `0x14638b180` | 2 | Reorders formatter, text and length before forwarding to `0x14637ec80`. One adapter supplies the 27-byte closed-channel message. |
| Indirect tail | 5 | Four have identified format or error text, including sampler filter names, compression type names and SRP errors. The adapter at `0x1430b8f40` formats two erased error payloads. |
| Return | 12 | Nine construct Lua arithmetic opcodes, two construct WGSL increment or decrement statements, and one supplies a Taffy grid-track size estimate. |
| Other direct tail | 8 | Forwards Lua, Naga and Bevy error payloads, installs two Harfrust Unicode callbacks, or resolves a Taffy track-size estimate. |

Both references to `0x1430b8f40` pass a format-argument row to
`0x14637fd90`. The Lua formatter's tag 10 cell at `0x146a31adc`
selects `0x1430c7d01`, which passes the error payload at enum `+8`
to the single-placeholder program at `0x146a31a63`. This corresponds
to [`Error::ExternalError`](../../crates/benilla-mlua/src/error.rs).
The Bevy asset formatter's tag 14 cell at `0x147225684` selects
`0x145705058`, where the program at `0x147223f30` supplies the
`add_async` error text and formats the payload at enum `+8`. This
matches `AssetLoadError::AddAsyncError` in pinned `bevy_asset` 0.18.1.
The shared adapter advances the allocation pointer by the aligned
16-byte `Arc` header and calls the concrete error's `Display` slot
at vtable `+0x20`. The payload type is selected by each instance.

The nine Lua arithmetic leaves are the Add, Sub and Mul variants for
register/register, register/constant and constant/register operands.
The table at `0x146a379d0` and the `0xff` split at `0x14311ad8d`
select the leaf. The selected result passes through `0x14311aed6`
to the code vector store at `0x14311a1a4`, corresponding to
[`Parser::codearith` and `code_raw`](../../crates/benilla-lua/src/compile.rs).
The Naga WGSL token cells 4 and 5 at `0x147080640` select the two
statement constructors. They supply tags `0x0b` and `0x0c` at
`0x144ecde0c`, then the parser appends the 64-byte statement at
`0x144ecde2b..0x144ecde5c`. The Taffy grid body installs
`0x143504f60` at `0x1434f0a2e` and passes it to the track-sizing call
at `0x1434f0ab3`. The leaf returns `Some(track.base_size)`, matching
the pinned Taffy 0.9.2 grid sizing callback.

| Preferred VA range | SHA-256 |
| --- | --- |
| ADT alias and overwrite `0x1427060d5..0x142706295` | `e8b8872f122dfc1ed6e01488c9b5afa9d1bb707344aa1a9c081600969368ba2d` |
| ADT format program `0x1469cd9f8..0x1469cda1d` | `cca579c40125e8853384ab20c70fed0288f2f8c885ccc7184ab4f1c3ec190789` |
| Erased error adapter `0x1430b8f40..0x1430b8f63` | `91e96657191db9f17de8e21ca87af27777d27ae1a753332c59650ee5172cf7d7` |
| Lua formatter `0x1430c7a80..0x1430c7e6a` | `0a09fe475aa768ff9e312edd929af2719978e063e4ea0699038fa2fcb4589be7` |
| Bevy asset formatter `0x145704fb0..0x14570549f` | `101d7174a785b0489930a59eccecff3e61039af6aecb02d21b11432610aa8401` |
| Lua arithmetic emitter `0x14311ab20..0x14311af9d` | `baca74034f4333989028a4589b39b52f31951aaa6250ae7036d6bd9a05e80e36` |
| WGSL assignment parser `0x144ecdb90..0x144ecdf5c` | `2ae4c9f81a3486f085ee8c1ce2c606d2a4e74e0e1f9c9bf72b61a8eaa9ee896b` |
| Taffy grid sizing caller `0x1434f0a2e..0x1434f0ab8` | `c1e99f253391228e7acfe3045268bc8244f612be0b24eaf86821cda9ca205dd8` |

The remaining eight direct tails match the saved address and source-site
selectors in the [executable residual proof](evidence/0.141.0/executable-residual-frontier.json).
The Taffy range continues through its local jump to the final return.

| Preferred VA range and saved references | Checked shared boundary | Range SHA-256 |
| --- | --- | --- |
| `0x1430b8f70..0x1430b8f7f` from `0x1430c7b4a`, `0x1430c7d54`, `0x1430c7e3c` | Advances past the 16-byte `Arc` header and tail-calls the concrete Lua error formatter at `0x1430c7a80`. The caller uses it for nested Lua causes in the existing [`Error::fmt`](../../crates/benilla-mlua/src/error.rs). | `c80fee279eb6fdef8825a2495f5a41b20f462471a42fac8102faab763c560cdb` |
| `0x143504f70..0x143504fa7` from `0x1434f07c0` | The inline-axis call at `0x1434f0861` supplies the callback to `0x143507de0`. It returns a fixed length, a percentage scaled by an available basis, or `None`, matching the pinned Taffy column estimate in `compute/grid/mod.rs`. | `22526015c2197940ddc6e0b4d90197949161f90dc588f853f1c1269d3b6fc0fa` |
| `0x1442e5a70..0x1442e5a7a` from `0x1442e7392` | Installs the Harfrust default Unicode composition callback at `RSP+0xb0`, with a shaper override from `+0x30`. The leaf forwards both codepoints to `0x1442cf5e0`. | `67986a20024a3d28cd140e36003e01e08d3b248d3e46793679470de95386d011` |
| `0x1442e5a80..0x1442e5a88` from `0x1442e7383` | Installs the companion Unicode decomposition callback at `RSP+0xa8`, with a shaper override from `+0x28`. The leaf forwards the output pointer and codepoint to `0x1442cf8e0`. Both match pinned Harfrust `hb/ot_shape_normalize.rs`. | `dea65c176055f75cd92ac1d5b3a1655c3ac853c3e7a5a7c4586130b8505a8230` |
| `0x144b33c30..0x144b33c3c` from `0x144b3416e`, `0x144b3436d` | Forwards the validation error at `+0x18` to `0x144e83c90`. The two format calls at `0x144b3418d` and `0x144b3438c` match `HeaderValidationError` and `ShaderValidationError` in pinned Naga Oil `compose/error.rs`. | `b3d596e4e5720cee0bf573d6d2f57f103827490f5cdc043a664226c71b601804` |
| `0x144e9c7a0..0x144e9c7a9` from `0x144eb9c54` | Forwards the `FunctionError` at `+0x18` to `0x144e69170` for the derivative-uniformity diagnostic. The native record names `naga::valid::analyzer` and line 883, matching the pinned analyzer's error log. | `bdf870569b12313e99d31daae4aa07544171bde9bf7e4a14049393c939b05927` |
| `0x14573bbd0..0x14573bbdf` from `0x1457053cf` | Advances past the 16-byte `Arc` header and tail-calls `0x145bec300` for the `AssetLoaderError` format program. The pinned Bevy asset server defines this payload as `Arc<BevyError>`. | `931bcadeda3ce9101ab02dd3f2c65264f04b37b5801451f0c2b5ce9868e18bbb` |
| `0x14573c260..0x14573c26c` from `0x1457cc265`, `0x1457d65e7` | Advances past the 16-byte `Arc` header and tail-calls `0x146388f50` for the two asset processor I/O diagnostics. Both branches correspond to `AssetReaderError::Io(Arc<std::io::Error>)` in pinned Bevy. | `70f04aa33caaef5c0e0de43d962c3fb114c1b4f5b94fe4e0941ee46757b6fabc` |

The immediate shared boundary is classified for all 59 selected prefixes.
Wider dynamic admission and other mixed spans remain open.

Three other outside-declared mixed spans are code at a graphics formatting
boundary. The original bytes in `0x144e32ae0..0x144e330a4`,
`0x144e332fc..0x144e33d34` and `0x144e39506..0x144e39a10` decode completely into
62, 110 and 54 leaf adapters respectively. Each loads a RIP-relative string
and tail-transfers to `0x14637f150`. The 219 adapters that set the length
locally read Vulkan format or structure labels, including `D32_SFLOAT` and
`PHYSICAL_DEVICE_VULKAN_1_1_PROPERTIES`. Seven preserve the incoming length.
Their selector and actual callers remain separate from the leaf role.
The [complete-range text projection](evidence/0.141.0/addressed-formatters.json)
extends this group to 70 outside-declared mixed ranges covering 9,283 bytes.
All 407 adapters establish the shared formatter argument order. Of these,
402 tail to `0x14637f150` and five tail to `0x14637ec80`. The 391 adapters
that write a length have valid printable text of that exact length.
The other sixteen preserve the incoming length. The projection includes the
three earlier Vulkan ranges as well as JSON kind names, GPU setup diagnostics,
GPU command-buffer errors and memory-allocation errors. It classifies the
immediate code and text in these ranges while retaining incoming reachability
and surrounding mixed code as separate questions.
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
- **Windfury row 52613.** The low dword of the command passed to
  `0x145eff450` selects index zero at `0x145eff498`. The command's high
  dword is the strike count. The entry scans 64-byte effect rows for raw
  tag 54 and subtype 4, saves the first matching index, and restores the
  previous attribution after casting. The loop at `0x145eff79a` resolves
  the original spell key for each strike and calls the ordinary cast at
  `0x145eff86f`. The [historical Enhancement contract](enhancement-0.139.2.md)
  and [live proc path](../../crates/azeroth-survivors-re/src/gameplay/mechanics/enhancement.rs)
  already supply the separate strike count, attribution and cast reuse.
- **Experience pickup row 52717.** Index zero at `0x145f22bcb` enters the
  XP creation path. The stationary XP count at `0x145f22c63` has a threshold
  of 45. At or above it, the selected 72-byte pickup-row scan compares
  planar squared distances and keeps the earlier row on a tie. The write
  at `0x145f2367a` adds the incoming amount to its `+0x24` field with
  native u32 wrapping. The creation fallback emits unit entry 9001 and
  selects display and scale at amount thresholds 4 and 20. The
  [live pickup creator](../../crates/azeroth-survivors-re/src/gameplay/mechanics/pickups.rs)
  already connects that coalescing and spawn contract.
- **Co-op actor row 52727.** The four returns of the producer at
  `0x145e5ff00` account for the four cells at `0x147af2f04`. Its zero
  return enters `0x145f25cd7`. The [actor input trace](computed-transfers-0.141.0.md#q41-f01-declared-range-as-context)
  establishes the live actor and two frame records.
- **Rune pickup row 52758.** The cells for tags 3–5 at `0x145f2dd7d`
  pass the collected kind to `0x145f36f10` after the shared removal call.
  Kind 3 refreshes spell 23451 for 10 seconds and kind 4 refreshes spell
  23505 for 15. Kind 5 passes half maximum health to the heal helper
  and publishes spell 23493. The existing [rune consumer](../../crates/azeroth-survivors-re/src/gameplay/mechanics/pickups.rs)
  already supplies the same spells and separate heal/refresh paths.
- **Swarm row 52772.** Index zero at `0x145f321b8` uses the two original
  f32 constants 2.5 and 12.0 at `0x145f321ba..0x145f321ca` before
  multiplying by the density scale, truncating to an unsigned count,
  and applying the minimum of one. The [live wave count](../../crates/azeroth-survivors-re/src/enemies/waves.rs)
  uses the same operation order for `Pattern::Swarm`.
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
- **Ward warning row 52808.** Main action tag 22 enters `0x145f4792a`.
  The producer reads the first payload byte at `0x145f47949`, spawns the
  wards, then uses that byte at `0x145f48c45` to select one of five warnings.
  The 20-byte table at `0x147af305c` has SHA-256
  `5381138f0ec42c1aa1d09d940f4009f059d39a0a6a63f1955ea88efd46e883aa`.
  The index-zero entry loads the 31-byte egg warning at `0x147aefe88`.
  All five paths reach the localization call at `0x145f491e9` and the
  localized speaker/body constructor at `0x145f4921f`.
  A schedule walk from the 13 zone records at `0x1473a06b0` and 41 guardian
  records at `0x1473a9948` reaches 501 unique action descriptors through
  moves, phases, alternates and nested action lists. Its fourteen tag-22
  rows are byte-identical as a multiset to the retained
  [ward payloads](evidence/0.109.0/raid-wards/manifest.json). Three have
  kind 0 (eggs), five have kind 1 (healing), and six have kind 2 (shielding).
  The [live ward producer](../../crates/azeroth-survivors-re/src/bosses/raid_wards.rs)
  supplies those three warnings. The additional kind-3 and kind-4
  warning cells have no producer in the selected authored ward rows.
- **Scripted callback row 52849.** The dispatch at `0x145f4d75c` selects
  the part with the matching hit ID and chooses how to read its anchor.
  Index 8 takes the inline XY at part `+0x30/+0x34` through `0x145f4d92c`.
  The adjoining vector cases at `0x145f4d90f` use the first point if present,
  or zero XY if empty. The join stores the selected XY at `+0x20` of the
  56-byte callback record at `0x145f4d80d`. The selected callback
  publication is identified. Other authored part geometry variants and
  their callbacks retain separate evidence.
- **Status row 52890.** Index zero at `0x145f5a24e` reaches the immediate
  return at `0x145f5a250`. The dispatcher reads the tag from the triplet
  passed in R8, including the [kind-2 direct status route](status-weakening-0.139.2.md#ground-periodic-and-self-aura-payloads-in-01410).
  The zero tag supplies no secondary effect in the rebuilt status path.
- **Milestone conversion row 53096.** Raw effect tag 17 normalizes to
  index 5 at `0x145f8e9c7`. After the condition call at `0x145f8ea02`,
  the selected path finds a live victim by GUID and multiplies the
  effect fraction copied from row `+0x28` by victim maximum health at
  `0x145f9036c`. It publishes damage with the original spell and restores
  the prior source-kind byte after the call at `0x145f903a2`. The current
  authored effect vectors contain raw-17 rows for Titan at `0x1476fe730`,
  Hammer of the Righteous at `0x147700e90`, and Shadow Weaving at
  `0x14770af48`. Their f32 coefficients are 0.02, 0.015, and 0.005.
  The rebuilt [milestone callback](../../crates/azeroth-survivors-re/src/gameplay/mechanics/milestones.rs)
  supplies the translated tag-5 conversion. This selected consumer does
  not establish every dynamically generated raw-17 producer.
- **Scripted impact row 53146.** Index 1 at `0x145fa1a21` enters the
  shared radial push. Its [Kirtonos consumers](scholomance-kirtonos-0.141.0.md)
  and [Ras Chill Nova producer](scholomance-ras-0.141.0.md)
  reach the same post-damage movement path.
- **Scripted root row 53143.** Index 4 of that same table reaches
  `0x145fa16a3`. The 20-byte table at `0x147af3864` has SHA-256
  `d98cf07ef787236927f9e15c53e917445d1f0df099aa9d8c7665d86d54157401`.
  The hit stage reads mode and duration at `+0x68/+0x6c` of the 168-byte
  part at `0x145fa17b4..0x145fa17c0`, calls the common damage helper at
  `0x145fa1a06`, then dispatches. The call at `0x145fa16b3` passes the
  seated Game, source GUID, spell and duration to `0x145f49e90`.
  The helper requires run phase
  1 and rejects requests during the seated hero's cooldown. Its first
  five accepted roots use the f32 factors `1.0`, `0.8`, `0.6`, `0.4` and
  `0.2` at `0x147aef4f0`. The sixth request clears the count and sets an
  eight-second cooldown using the constant at `0x1465541f4`. An accepted
  request sends a single-target spell to the seated hero, emits force-root
  when the old deadline is zero or negative, and keeps the later deadline.
  The hazard batch call at `0x145f3ec26` reaches the same helper. These
  finite-duration rules correspond to the existing
  [player mover](../../crates/azeroth-survivors-re/src/gameplay/mechanics/player_mover.rs)
  and [hazard batch](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs).
  The original helper span `0x145f49e90..0x145f4a069` has SHA-256
  `55fa41066323ec44330c411f649f2609c9087b9831f685c6a8a77bbc5f270531`.
  The declared and Ghidra reference inventories agree on 25 direct calls to
  the attack publisher `0x145f9e450`; the extra Ghidra reference at
  `0x148ed8408` is the PE runtime-function record. The publisher's part
  loop writes timing fields at `+0x8c/+0x98/+0x9c`. The selected direct
  callers and their part constructors supply modes 0–3 or an empty part
  vector. The nonzero writes are Ras's mode 1 at `0x145dbc56b`, Kirtonos's
  at `0x146011faf` and `0x146013c3f`, and Krastinov's mode 2/3 at
  `0x146015040` and `0x146014894`. The bounded Ghidra query for
  `0x145fa0e20..0x145fa20cc` used the exact raw input SHA-256
  `8388b7642f34fc409f32d824b5856e2128677a34854f02bc442ba8cc287a42c5`
  and returned evidence
  `ev_da92baf7e4e3725b5a2b62d490093aaf182758e186b1a2543a761d69f715ced1`,
  result SHA-256 `6b97e93466ea6e9acaff67bda8609f55e7ff80b28cc21877bad3bb6bdc5af4fb`.
  The signed dispatch cells and external calls come from the original PE.
  The live scripted update at `0x145f4a110` writes only `+0x00..+0x47`
  when replacing geometry at `0x145f4ce31..0x145f4ce58`. This preserves the
  impact mode and duration. Its apparent tag-6 and tag-7 constructions
  at `0x145f4c67f` and `0x145f4cf41` are copies of existing geometry,
  selected by the part's own tag at `0x145f4c41c..0x145f4c44a`.
  The mode is independent of those geometry tags.
  An additional writer is [Krastinov's movement callback](scholomance-krastinov-0.141.0.md)
  at `0x146015d10..0x146016b99` (SHA-256
  `77f0ff54fe1290027999ccf276aff6569e2f4f20793a2a5afdab37f9c1bba281`).
  It requires a matching actor, a distinct due attack and first-part
  Sweep tag 5. It writes mode 2, direction, four-yard distance, and
  origin at `0x146015e48..0x146015e64`. The other direct impact entry
  at `0x145e71fc0` only selects thread-local locale state around the
  same hit owner. The vector handoff at `0x145e48dcc..0x145e48dda`
  copies an initially empty attack vector from the constructor at
  `0x145f7db82..0x145f7db95`.
  The projection covered 45 unique publishing and selected live-vector
  owner extents. It found no fresh tag-6/7 part or mode-4 write. A live
  mode-4 producer still requires an indirect constructor caller or a
  proved alias that writes part `+0x68` before the hit dispatcher.
- **Imp target row 53228.** The table at `0x147af38a8` indexes the
  companion's special kind byte. Index 1 scans 56-byte periodic rows at
  `0x145fb3133..0x145fb316a` for spell 348 at row `+0x18`. Exhaustion of
  that scan adds f32 `0.8` from `0x146554134` at `0x145fb3364`.
  A matching row bypasses the bonus regardless of its remaining ticks.
  The [target scorer](../../crates/azeroth-survivors-re/src/run_effects/demons.rs)
  and [live periodic projection](../../crates/azeroth-survivors-re/src/gameplay/mechanics/demons.rs)
  already supply this Imp preference.
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

| Rows | Selected native role and source boundary |
| --- | --- |
| 451, 466, 467 | The adjacent six-cell vectors at `0x146565b10` and `0x146565b28` clone JSON values inside the Discord paths. Cases 1 at `0x140093fb3` and `0x14009d833` copy the boolean payload byte. Case 4 at `0x14009d88d` clones the 32-byte array rows through `0x140034e20`. Row 451 follows the worker's event-error data log. Rows 466 and 467 reach the same publisher continuation at `0x14012f740`. The [Discord source](../../crates/azeroth-survivors-re/src/discord.rs) clones the activity value for its worker. |
| 1124 | The Picker class grid takes the class ID from descriptor `+0x8c` at `0x14039f7a0`, writes it after action tag 0, and passes the action to the 60-pixel class icon builder at `0x14039f813`. The builder reads the action pointer at `0x140138f43` and passes the descriptor to `0x1403a2e20` at `0x140138fb2`. The consumer reads the class byte at `0x1401488e7`, upserts the previous class's eight-byte selection row through `0x145de50b0`, and queues Pick command 12 at `0x140148a15`. The [Picker grid](../../crates/azeroth-survivors-re/src/picker.rs) produces `Action::Class`, and the [menu input path](../../crates/azeroth-survivors-re/src/menu.rs) dispatches it into `choose_class`. |
| 1555, 1587 | The [Options checkbox repair](options-checkbox-0.141.0.md) joins the kind-5 click to the queued 56-byte update, storage setter at `0x1401f1ec0`, and inverted draw path. The [binding-header removal](q41-diagnostic-consumers-0.141.0.md#returning-removals) is a separate case in the same function. |
| 1761 | The Rewards action takes a signed delta from record `+1`, a key pointer and length from `+8/+0x10`, and the current rank from `0x145e46460`. `0x145e5f500` returns the named descriptor. `0x1402b87e7..0x1402b8818` clamps the new rank between zero and its limit and updates the draft through `0x145e47880`. The UI admits decreases at `0x1403d21f8..0x1403d2245` using the dependent-perk and owned-rank gates and increases at `0x1403d2257..0x1403d22c1` using the catalog and point budget. The [Rewards editor](../../crates/azeroth-survivors-re/src/progression.rs) validates its candidate at input as well. The builder only inserts the action into the deferred bundle when enabled. The consumer accepts each fresh Pressed row and clamps its rank before updating the draft. It reads no budget or dependency gate at this point. Whether stale or simultaneous presses reach these controls remains open. |
| 1845 | The Armory header loads `options.done` at `0x14039352b`, writes dword action 2 at `0x14039353f`, and passes its pointer to button builder `0x1402dd410` at `0x14039356a`. The handler enters `0x1402ed729` and requests destination `0xff` through `0x1402cb5a0`. The shared helper chooses Picker and checks for an edited Rewards draft. The button caller supplies `0x41800000` at `0x140393558`. The builder copies that float into the text style at `0x1402ddb61..0x1402ddbba`, giving the 16-pixel label now used by the [Armory header](../../crates/azeroth-survivors-re/src/armory.rs). The [rebuilt page request](../../crates/azeroth-survivors-re/src/progression.rs) owns the leave guard. The adjacent lookup `0x145df0470` copies the 232-byte Armory class row keyed by its byte at `+0xe4`, with a default when absent. |
| 1999 | The [ordinary equipment palette repair](armory-equipment-palette-0.141.0.md) connects this tier and item-class selector to the native icon border and text consumers and reuses the same palette in the rebuilt inspector. |
| 52710, 52711, 52712, 52714 | The [computed transfer review](computed-transfers-0.141.0.md) owns the hit-source dispatch and the distinct source-kind predicate that qualifies death consumers. |
| 52782 | Raw action 18 enters `0x145f45b6a` through cell 15 of `0x147af2fd8`. It runs the first child at `0x145f45bb0` and queues the later children at `0x145f45c02..0x145f45c67`. Each 64-byte row in the Game `+0x7b0` vector carries the original actor GUID, deadline `now + index × spacing`, and the child action. The consumer at `0x145f39d37..0x145f39f72` admits due rows, checks co-op target slot at actor `+0x118`, removes the row in insertion order, then matches the living actor by `+0x110` and bit 0 at `+0xd0`. Tags below `0x24` reach the shared dispatcher at `0x145f43e90`. The [sequence producer](../../crates/azeroth-survivors-re/src/bosses/raid_sequences.rs), [delayed queue](../../crates/azeroth-survivors-re/src/bosses/raid_lines.rs), and [live actor context](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs) implement these steps. |
| 52786, 52787, 52788 | Shared constructor `0x145f433a0` writes the producer's shape triple at `+0x30/+0x34/+0x38` in the 136-byte Game `+0x798` hazard vector. The 14 direct calls in raid-action dispatcher `0x145f43e90` supply circle 0, donut 1, line 2 or cone 3. At call `0x145f48cd7`, raw action 13 selects circle for a nonpositive or unordered inner radius and donut otherwise. The dispatcher's 20 inline appends use the same tags, with 13 circles, one donut and six lines. The four-cell consumers at `0x147af2f8c`, `0x147af2f9c`, and `0x147af2fac` read that shape and the planar center at `+0x40`. The first admits active kind 4 rows, the second checks kinds 1, 4 or 5 and flag `+0x82`, and the third checks a zero byte at `+0x81` and an elapsed end time. The [live hazard geometry](../../crates/azeroth-survivors-re/src/bosses/raid_areas.rs) distinguishes the four shapes and uses separate single- and two-position predicates. |
| 52984 | The caller copies the Game stat vector from `+0xb40` with count at `+0xb48`. Eight-byte rows carry a byte tag and a float at `+4`. The zero case adds the float to the accumulator at `0x145f6cdf1` and joins the common loop. The [stat fold](../../crates/azeroth-survivors-re/src/run_effects.rs) already consumes numeric additions during [effect refresh](../../crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs). |
| 54188, 54224 | Both content paths resolve the modifier key through the same 115-record ability vector of 120-byte rows at `0x1473a40d8`. The first follows the `+8` payload kind into the damage sentence at `0x14605eb50`. The second uses the descriptor selector at `+0x24` and reaches absorb/healing and additional-target templates. The [reward prose](../../crates/azeroth-survivors-re/src/loot_rewards/prose.rs) and [inventory sentence renderer](../../crates/azeroth-survivors-re/src/gameplay/client/inventory.rs) supply the corresponding presentations. |

The Discord vector pair at `0x146565b10..0x146565b40` has SHA-256
`71567518af8317c09b72509d29e09b3940227bd63321e9b34aa30d5f668b17d7`.
The ability vector has SHA-256
`49e69f818cbdfa9877b49303f4c571b859b70264437c5a214245557cb45f8e31`.
The mode-4 writer question for row 53143 remains under the scripted
attack review. The remaining UI producer questions require the typed
component writer or downstream action consumer before a source change.

The Rewards button builder at `0x1402954b0` tests enabled at
`0x14029570e` before copying the key and delta. The receiver at
`0x1402b7cc0` checks interaction change ticks at `0x1402b7ee9` and
`0x1402b8032` and admits interaction byte zero at `0x1402b805f`.
Bevy focus owner `0x1433e5bb0..0x1433e715f` has SHA-256
`4e1c29a19d98fa30daa41328be10476fe83a5708e2542953aa5e5dcd9f03b307`.
It sets Pressed=0 on a new press at `0x1433e6ea7` and advances through the
hit stack only with nonzero policy at `0x1433e6f1b..0x1433e6f39`. The
missing-policy default byte at `0x146a90e28` is zero. The exact installed
policy for these buttons and any other source of fresh Pressed rows remain
unproved. The rebuilt input rechecks budget and dependencies per action.

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

Two more mixed spans contain shared graphics conversions. The leaf at
`0x144e5f090` indexes 79 signed cells from `0x14705e744` into 78 instruction
starts. Nonempty cases return shader builtin names such as
`pack4xI8Clamp` and `unpack4xI8` as pointer and length. The adjacent
exact Location identifies `naga-27.0.3/src/proc/mod.rs:490`. The dispatcher
at `0x144d60080` indexes 77 cells from `0x147022ccc` into 64 instruction
starts. Its leaves return absence or set EAX to one and return the numeric
DXGI format in EDX. The wrapper at `0x144d60050` unwraps the result with
Location `wgpu-hal/src/auxil/dxgi/conv.rs:106`. These ranges total 1,654
bytes of graphics context.

| Original range, end exclusive | SHA-256 |
| --- | --- |
| WGSL builtin names `0x144e5f0a8..0x144e5f460` | `eeec8c433fe15ce07dbbf95ca3044b22f3d21d3564878589085c30e7b589b371` |
| WGSL cells `0x14705e744..0x14705e880` | `8c93f3b307a0fdcc8f4629187647e72c510ab42c2f384e9f7e194ea1c4628d96` |
| DXGI format cases `0x144d60092..0x144d60350` | `0a99f95c2f26b9667a7209042d326144f5a6b7c2bf0a216bedf9aab9862784b6` |
| DXGI cells `0x147022ccc..0x147022e00` | `f17b6387bb26a9bea7cb77c140a5c626a146b4b8c229abb53f6dfc04d343c623` |

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
python3 -B scripts/check-q41-range-encodings.py --addressed-formatters
python3 -B scripts/check-q41-range-encodings.py --mixed-formatters docs/analysis/coverage/full-image-selected-0.141.0.json
python3 -B scripts/classify-as-residual-ranges.py
python3 -B scripts/classify-as-residual-ranges.py --dispatch-frontier
python3 -B scripts/classify-as-residual-ranges.py --entry-frontier
python3 -B scripts/classify-q41-residual-frontier.py --complement-projection docs/analysis/coverage/full-image-selected-0.141.0.json
python3 -B scripts/check-u04-trap-fill.py --complement-stops
```

These results preserve unobserved bytes, unresolved computed targets and
source ownership in #41. Compilation, gameplay and original/rebuilt parity
remain unverified.
