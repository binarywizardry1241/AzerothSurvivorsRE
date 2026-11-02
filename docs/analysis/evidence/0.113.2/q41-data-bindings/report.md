# Q41-D01/D02: custom Options binding-header data

Target **0.113.2**, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This classifies the bounded data target `0x145eee140` and reader
`0x1401a8163`, under **#41**, and repairs its demonstrated custom Options
projection omission under **#17/#21**. Other data/alias and runtime/parity work
remains open; the original residual populations are unchanged.

## Exact selection and meaning

The [contract](contract.json) binds current selector input hashes and the exact
`references.tsv.gz` row **57,548**: operand 1 of `0x1401a8163` is a `READ` of
`0x145eee140`. Scanning all **3,919,777** exported references finds this one
record and no observed writer to `[0x145eee140,0x145eee151)`. The selected
destination has no actual native body, so it belongs to both `Q41-D01` and
`Q41-D02`. A data destination's absent body is expected; it is not a missing
function.

The bytes are the non-NUL-terminated **17-byte ASCII/UTF-8 title
`Azeroth Survivors`** in nonwritable `.rdata`. The actual `MOVUPS` reads its first
16 bytes; `0x1401a816d` supplies the final `s` as immediate `0x73`. The next nine
bytes are the separate `Level Up!` localization input. No pointer table or
callback type is involved in the selected data read. The title's image-backed
lifetime is separate from the allocated owned string returned by the mapper.

Fresh [Ghidra observations](ghidra.json) confirm the exact reader, bytes and
422-byte containing function `[0x1401a8020,0x1401a81c6)`. Ghidra reports **no
defined data type** at the literal; the text and layouts below are inferred
from exact instructions, not original/debug type information. Its one observed
incoming function reference is a data pointer at `0x1481fe440`; dynamic caller
identity and whole alias closure are not established. Reference/Data Reference
analyzers are disabled in the bounded probe, and the existing full export's
negative writer result is not proof against every computed/dynamic write.

## Native producer, ownership and consumer boundary

The [canonical assembly](binding-label-mapper.asm) maps a 48-byte binding row:

- A header is recognized by the all-ones qword at offset 0. Its owned string's
  capacity, pointer and byte length are at offsets 8, 16 and 24. Only exact,
  case-sensitive length-three **`AZS`** matches. The mapper allocates 17 bytes
  with alignment 1, copies the title, publishes the header and its new string,
  then frees the consumed old string when its capacity is nonzero. Allocation
  failure reaches the error interface with alignment 1 and size 17 before any
  result is published. The allocator/panic implementation is outside this AS
  interface recovery.
- Other headers are transferred unchanged. Near matches such as `AZs`,
  `AZSS` and `HEADER_AZS` do not receive the title.
- For a command, the key string occupies offsets 0/8/16 and its label occupies
  24/32/40. The exact fourteen-byte **`AZS_OPENLEVELS`** key keeps its command
  string and replaces the label through the separate localized `Level Up!`
  branch, freeing the previous nonempty label. Other commands are transferred
  unchanged. The bounded replay declares the localization and owned-string
  construction seams explicitly; it does not certify their full resources or
  implementation.

These are the relevant observed producer/consumer lifetime operations. They do
not establish every caller, iterator/resource owner, later destructor or mutable
alias in the whole application.

## Connected source repair

[`options.rs`](../../../../../crates/azeroth-survivors-re/src/options.rs)
already used the fixed header title while loading the standalone binding model
through `native_bindings::label`. Its later live `sync_engine` projection,
however, copied the VM snapshot label or fell back to bare `AZS` when empty.
The real custom header renderer consumes that projected `row.label`. Thus an
empty or changed `BINDING_HEADER_AZS` snapshot could replace the title after the
UI became active, contradicting the native mapper's unconditional exact-key
replacement.

`sync_engine` now applies the existing fixed header label to exact
`HEADER_AZS` before custom presentation. It retains the original engine snapshot
as the cache observation and preserves ordinary/near-match headers, command
labels and fallback behavior. The existing command-label renderer already uses
localized `Level Up!`; no second command-label mechanism was added. This is a
bounded AS adapter over the existing benilla binding APIs, not engine recovery.
The authored Rust regression drives the actual sync system with empty, default
and changed labels, near-match headers and ordinary commands, including a
retained unchanged snapshot. It was **not compiled or run**.

## Static verification and remaining limits

`python3 -B scripts/check-q41-data-bindings-0.113.2.py` passes **37
original-instruction cases**: exact and near-match header/command keys, owned
string capacities, header allocation failure, old-label release, localized
command outputs and unchanged-row transfer. Only synthetic valid binding rows
and declared allocation/free/localization/string-construction seams are used.
It also verifies installed bytes, the complete reference selector inputs,
canonical assembly, Ghidra commitments and the live source projection/renderer
connection. These checks execute original instruction bytes, not the Rust source.

Reproduce the bounded Ghidra query with
`python3 -B scripts/rea-batch.py docs/analysis/evidence/0.113.2/q41-data-bindings/probe-plan.json --output runtime/q41-data-relations-0.113.2/rea-new-probe`.
The [plan](probe-plan.json) and [seed](probe-seeds.tsv) retain the actual
selected entry and disabled analyzers. A different path/profile creates new
Evidence identities; it must not overwrite the original observations.

Compilation, real VM/addon input, actual allocation/teardown, rendered
interaction, the full caller/alias inventory, and original/rebuilt parity remain
unverified. No compiler, application, game process or real save/configuration
operation ran. This classified data read does not close #17, #21 or #41.
