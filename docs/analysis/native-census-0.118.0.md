# Native discovery census — 0.118.0

Target SHA-256: `4c3c6bbac1e5ca403672109ad57cf1c84781ffe78e113ba965b8d89c6f41b6ae`.
The installed EXE is a read-only input. Complete structural and decoder coverage
is separate from native semantics, source implementation and parity under #41.

## Complete file and linear inventories

All **145,356,800 bytes** are assigned once across 26 file ranges. Six mapped
sections include 101,950,766 executable virtual bytes. The file ledger retains
200 DOS-stub bytes, 256 header-slack bytes and 1,378 alignment-tail bytes as unknown;
no candidate padding or data meaning is silently certified.

Capstone 5.0.7 decodes all **357,933** declared AMD64 extents into
**23,887,602 instruction records / 96,704,185 union bytes**, with no undecoded
suffix. These linear extents do not establish reachable functions. Encoded
indirect calls/jumps, aliases and pointer-slot destinations remain unresolved.

The complement pass accounts for all **5,246,581** other executable bytes across
337,219 mapped regions. Its 2,844 seed addresses produce 80,530 instruction
candidates / 348,817 union bytes. The residual partition has 2,322,815 mixed bytes,
944,736 uniform CC candidates, 11,193 uniform NOP candidates and 1,619,020 canonical
padding-sequence candidates. Those labels are not proof of noncode.

Diagnostic discovery verifies 18,078 instruction references across 601 of 761
paths, including all 60 AS paths. Its 6,149 candidate extents contain 1,897,897
decoded instructions. Rust Locations are ownership leads; surrounding helpers
and mixed bodies do not inherit semantic ownership automatically.

## Persistent whole-image Ghidra census

Current target/profile-bound Programs, immutable inputs and saved batch cursors
live beneath `runtime/coverage/4c3c6bbac1e5ca403672109ad57cf1c84781ffe78e113ba965b8d89c6f41b6ae/ghidra/`.
The declared pass selects every current unwind start. The expanded pass includes
verified guarded-switch, diagnostic-code, address-code, import and unwind inputs
plus complement and address-taken starts. Automatic analysis is disabled; each
Program checkpoint commits saved mutations before publishing its cursor.

The [declared summary](coverage/full-image-declared-0.118.0.json) independently
verifies all 357,933 requested starts and helper closure: 22,464,949 instructions,
89,790,751 exact bytes, 360,440 native functions, 418,086 body ranges and 3,873,716
static references. Its executable residual remains 12,160,015 bytes across 400,601
exact ranges (7,199,722 inside declared extents; 4,960,293 outside).

The expanded plan selects 430,095 entry starts plus 23,905 additional code-only
starts. Its frozen current inputs contain 2,573 guarded tables, 1,348 diagnostic
starts, 7,963 address-code starts, 2 import-thunk entries and 28 unwind/PE entries;
sets overlap and must not be added as distinct functions. Input producer/tool
commitments and all exact immutable snapshots are saved with the plan. The
[expanded independent verification](coverage/full-image-execheck-0.118.0.json)
checks every exported instruction against the selected PE bytes and Capstone
boundaries. All requested entries and additional code starts decode; no requested
entry lacks an actual repaired flow body.

| Expanded observation | Verified result |
| --- | ---: |
| Instructions / exact bytes | 23,291,304 / 93,354,240 |
| Native functions / actual body ranges | 432,711 / 488,718 |
| Static references / external locations | 4,033,360 / 425 |
| Ghidra computed call / jump-flow records | 70,961 / 142,162 |
| Unobserved executable bytes / ranges | 8,596,526 / 471,937 |

The current opcode classifier separates Ghidra computed-flow records from actual
CALL/JMP instructions: 70,737 indirect calls and 11,615 indirect jumps. The same
Ghidra population also includes 130,547 UD2, 221 INT and 3 INT3 records. Encoded
import/value candidates remain static input facts, not observed runtime callees.
Linear, Ghidra and opcode populations overlap and cannot be added as coverage.

The residual has 5,268,573 bytes inside declared extents and 3,327,953 outside.
Its exact ranges and candidate kinds stay in the committed gzip selectors.
Body ownership leaves 1,216 diagnostic sites ownerless; custom path/Location
subsets remain independently counted by the current connection partition.
The applied guarded-edge digest is
`f6ed716c8e3c979a7b5121d6172a69bf8a12242d5458b8238ed227564341e6de`.
Only that applied snapshot is selected; unproved tables, receiver/index aliases,
pointer writers and dynamic destinations remain unknown.

Exact original input/tool commitments remain separate from current
launcher/verifier witnesses. Completed passes do not resolve all computed runtime
references, type/alias relationships, code/data roles or AS semantics.

No application compilation or game/client/network/server execution occurred.
The [unknown recovery queue](unknown-recovery-0.118.0.md) retains every residual
selector and next bounded static action; controlled original/rebuilt comparisons
and whole-product parity remain open.

The source/connection admission suites pass 73 non-compiling Python cases
(7 census, 12 connection, 40 residual and 14 selected-census cases). The current
full-file/diagnostic/locale/receipt, residual, native-selection and connection
replays pass within their stated bounds. Residual admission uses the exact
selected census throughout; an unrelated default cannot replace it.
