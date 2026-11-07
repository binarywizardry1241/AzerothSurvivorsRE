# Shared diagnostic interface roles

This bounded **Q41-E01** classification follows every **1,772 ownerless
noncustom diagnostic reference across 63 paths**, selected from the current
hash-bound diagnostic inventory and actual saved Ghidra body ranges. Target
SHA-256 is `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The separate D01 proof accounts for the 107 AS custom references and six
excluded co-op references. These partitions do not assign complete body or
source semantics from a filename.

All selected sites decode at their recorded instruction boundaries in **1,057
current PE unwind extents**. Every selected pointer reaches its first call
through a bounded sequence containing only ordinary instructions and direct
unconditional jumps. The proof verifies each exact LEA operand, selected
Location carrier, pointer/length/line/column record, extent hash and local flow
hash. An unwind interval remains provenance rather than a substitute Ghidra
body owner. No fresh Ghidra analysis is required for these first interfaces.

## Failure-path Locations

The selected set contains **1,751 Rust Location references**. Of these,
**1,743** enter the following shared failure interfaces. The current helper
identities already canonical in [D01](custom-diagnostic-roles.md) are
referenced and checked without duplicating their assembly.

| First interface | Location sites | Current entry |
| --- | ---: | --- |
| Formatted failure | 912 | `0x145eb7540` |
| Explicit message failure | 262 | `0x145eb7280` |
| RefCell already borrowed | 258 | `0x145eb7200` |
| Index bounds failure | 104 | `0x145eb7363` |
| Async resumed after completion | 64 | `0x145eb76a0` |
| Async resumed after panicking | 64 | `0x145eb76c0` |
| Slice range failure | 24 | `0x145eb7570` |
| Option unwrap failure | 24 | `0x145eb72c0` |
| Literal message failure | 19 | `0x145eb7520` |
| UTF-8 string slice failure | 6 | `0x145eb71e0` |
| RefCell already mutably borrowed | 5 | `0x145eb7240` |
| Message plus debug value failure | 1 | `0x145eb72e0` |

The two RefCell and two async wrappers are identified by their present strings,
argument moves and shared failure calls. The string/slice interfaces have
current range and UTF-8 boundary guards. A Location on a refusal path does not
recover the successful surrounding operation or establish AS behavior.

## Ordinary helper Locations

All eight remaining Location sites are retained individually:

| Sites | First interface | Boundary established |
| --- | --- | --- |
| `0x1406d18b7` | `0x145cdba10` | Checked seconds/nanoseconds addition; the supplied Location is used on overflow. |
| `0x14102ebb7`, `0x14102ebdc` | `0x140bc6e20` | Shared string splice checks source range and UTF-8 boundaries; the Location is used by boundary failures. |
| `0x140728034` | `0x140b64cc0` | Shared stable 120-byte row removal; shifting and length decrement precede its returned-row/refusal decision. |
| `0x1457ae609`, `0x1457b3783`, `0x1457b3992` | `0x1457aa060` | Shared overlapping 8-byte slice copy; the Location supports the destination-capacity refusal. |
| `0x141039f7e` | `0x1408682b0` | Shared append receives a fourth-argument Location that its code does not read. Its nested allocation-identity helper also has no `r9` read and only calls the established `r8`-Location failure interface; the later growth call replaces `r9` with constant 1. |

These operations belong to shared spell flight, text filtering, mail, Lua VM and
entity attachment context. Their local interfaces establish no new AS-specific
input, state transition or required source repair. Their surrounding engine
semantics are outside this classification.

## Actual literal and data boundaries

The other **21 references** address bytes beside filenames or a filename used
as an explicit value. The proof retains every exact site and its consumed
span, including these distinctions:

| Role | Sites | Span passed to the interface |
| --- | ---: | --- |
| Shared selector | 2 | `aev`, exactly 3 bytes; helper compares stored lengths before its byte comparison. |
| Debug field name | 1 | `nodes`, pointer plus length 5 in the field formatting arguments. |
| Encoded formatting descriptor | 9 | Eight `c1 20 00 80 60 00` streams and one `c0 00` stream. Current sizing and rendering parsers consume their opcode payloads and stop at the terminating zero before the filename. |
| Dynamic formatter literal | 6 | `%.1f`, length 4, one argument, object method slot `0x28`. |
| Copied Lua type name | 1 | `table`, exactly 5 bytes; the first hook is a single `ret`, followed by allocation and the length-bounded copy at `0x1457bb172`. |
| Explicit failure message | 1 | `model`, exactly 5 bytes; a separate Rust Location is passed in `r8`. |
| Filename as dynamic formatting value | 1 | `crates\benilla-ui\src\loader\mod.rs`, exactly 35 bytes, placed in a dynamic formatting argument. |

The adjacent filename is not consumed in the first twenty cases. In the last
case it genuinely is a formatting value; its 35-byte argument is distinct from
the encoded descriptor passed in `rdx`. These are operand boundaries, not
proof that the neighboring filename names the full native function. In
particular, the six `macro_icons.rs` adjacency candidates do not by themselves
prove a macro-icon routine or a corresponding source omission.

The concrete callbacks at **all six** dynamic formatter calls remain
unverified: `0x145bd7762`, `0x145bd79ee`, `0x145bd7a9e`, `0x145bd829b`,
`0x145bd8354`, and `0x145bd845c`. Their respective input LEAs are
`0x145bd775b`, `0x145bd79e7`, `0x145bd7a97`, `0x145bd8294`,
`0x145bd834d`, and `0x145bd8455`. Each exact input and slot is checked; the live
object/vtable is needed to determine the concrete method and formatting output.
This is retained shared-interface uncertainty, without an established AS delta.

## Reproduction and limits

```sh
python3 -B scripts/check-engine-diagnostic-roles.py
```

The [compact all-row proof](evidence/engine-diagnostic-roles-comparison.json)
contains every site, path, declared extent, carrier and first consumer. Column
arrays keep the complete selection reviewable without another full native
extract. The checker independently selects the rows from the original
inventory and saved body census, then rereads the current installed bytes and
verifies all 1,751 Location records, all 21 literal/data boundaries, the helper
identity commitments and the selected native instruction guards. Changes to a
selected byte, carrier, consumer, literal span or retained record fail the
comparison. No source execution or synthetic gameplay case is claimed.

The bounded first-interface classification is complete. Complete native/source
semantics, the six concrete formatter callbacks and original/rebuilt parity
remain unverified. Existing shared-engine source paths are candidates rather
than proof of corresponding native behavior; missing generic source files are
not pursued. No necessary AS interface delta is established by these sites,
so this branch adds no gameplay implementation. Panic, formatter, allocator,
containers, VM, protocol/network and asset internals remain supporting context.
No compiler, application, co-op/network/server execution or fresh Ghidra query
was run.
