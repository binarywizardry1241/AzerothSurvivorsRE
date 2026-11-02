# Native discovery census — 0.119.0

Target SHA-256: `6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
The configured installed EXE is read directly as a read-only input. Structural
and decoder accounting remains distinct from native semantics, implementation
and parity under #41.

## Complete file and linear inventories

All **145,357,824 bytes** are assigned once across 26 disjoint file ranges,
without omissions or overlap. Six mapped sections include 101,951,918
executable virtual bytes. The ledger retains 200 DOS-stub bytes, 256 header-slack
bytes and 1,278 alignment-tail bytes as unknown; candidate padding is not
silently classified as recovered noncode.

Capstone 5.0.7 decodes all **357,933** declared AMD64 extents into
**23,887,827 instruction records / 96,705,283 union bytes**, with no undecoded
suffix. Linear extents do not establish reachable functions or semantic owners.
Encoded indirect calls/jumps, aliases and pointer-slot destinations remain open.

The complement pass accounts for all **5,246,635** other executable bytes across
337,217 mapped regions. Its 2,844 seed addresses produce 80,530 instruction
candidates / 348,817 union bytes. The residual partition contains 2,322,836 mixed
bytes, 944,728 uniform CC candidates, 11,192 uniform NOP candidates and 1,619,062
canonical padding-sequence candidates. Those labels do not prove noncode.

Diagnostic discovery independently checks **18,106 instruction references**
across 601 of 761 paths, including all 60 AS paths. Its 6,150 candidate extents
contain 1,899,238 decoded instructions. Rust Locations are ownership leads;
surrounding helpers and mixed bodies do not inherit semantic ownership.

## Persistent whole-image Ghidra census

The fresh declared pass selects every current unwind entry and saves the Program
before publishing each batch cursor. Its immutable plan and verified exports live beneath
`runtime/coverage/6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f/ghidra/declared`.
The [declared summary](coverage/full-image-declared-0.119.0.json) independently
verifies all 357,933 requested starts and their repaired native bodies:
22,465,154 instructions / 89,791,712 exact bytes, 360,440 functions, 418,091 body
ranges and 3,873,745 static references. Its residual retains 12,160,206 executable
bytes across 400,605 ranges: 7,199,859 inside declared extents and 4,960,347
outside. Those residuals are exact unknown selectors rather than proved padding.

The expanded pass selects 430,095 entry starts and 23,905 additional code-only
starts. Its frozen current inputs contain 2,573 guarded tables, 1,348 diagnostic
starts, 7,963 address-code starts, two import-thunk entries and 28 unwind/PE
entries. These sets overlap and do not add as distinct functions. Exact seed
snapshots, producer/tool commitments and a saved Program cursor remain with its
plan. It uses 4,096-entry batches; every completed batch saves the Program and
cursor together. Automatic analysis stays disabled.

The [expanded independent verification](coverage/full-image-execheck-0.119.0.json)
checks every exported instruction's original PE bytes and Capstone boundaries.
All requested entries have actual repaired flow bodies; all additional code
starts decode without creating invented function-entry or incoming-edge proof.

| Expanded observation | Verified result |
| --- | ---: |
| Instructions / exact bytes | 23,291,509 / 93,355,201 |
| Native functions / actual body ranges | 432,711 / 488,723 |
| Static references / external locations | 4,033,389 / 425 |
| Ghidra computed call / jump-flow records | 70,961 / 142,161 |
| Unobserved executable bytes / ranges | 8,596,717 / 471,943 |

The residual retains 5,268,710 bytes inside declared extents and 3,328,007
outside. Exact ranges and candidate kinds remain in the hash-bound gzip
selectors. Applied guarded-edge digest:
`5e9cff42762bd00051353a0216b4d7c0e9334abff868746f868cfdee03bc6717`.
Only the exact applied snapshot is selected; unproved tables, receiver/index
aliases, pointer writers and dynamic destinations remain open. Declared,
linear, complement, Ghidra and opcode populations overlap and cannot be added
as native/source or AS functionality coverage.

The [complete residual join](evidence/0.119.0/native-residuals.json) retains
68,300 ownerless instruction records, 804,706 static references whose sources
lack body owners, 4,836 distinct unowned executable destinations and 1,216
ownerless diagnostic sites. The separate diagnostic-site audit checks all
18,106 references on exact exported instruction boundaries, including all 60 AS
diagnostic paths; 60 of its 826 custom reference records lack a body owner.
These independently defined populations overlap; diagnostic association does
not prove semantic ownership or an absent source implementation.

The [selected opcode classification](coverage/native-ownership-classification.json)
separates 70,737 actual indirect CALLs and 11,615 indirect JMPs from Ghidra's
computed-flow records. The latter additionally include 130,546 UD2, 221 INT and
three INT3 instructions. The [complete operand audit](evidence/0.119.0/native-operands.json)
checks all 23,291,509 observed instructions and retains 674,745 fixed/address
expressions, including 8,063 without a source body owner. Incoming registers,
indices, segment state, alias/type meaning and live destinations remain open.
The [atomic current selection](coverage/native-image-current.json) binds the
expanded census, these ownership/operand observations, its exact applied switch
snapshot and the selected historical-range audit.

Both durable full-image native passes and independent byte/boundary checks
completed. Complete observed Program-state exports do not establish every
computed runtime reference, source owner, type/alias relationship or AS meaning.
The [unknown recovery queue](unknown-recovery-0.119.0.md) retains exact selectors
and next static recovery actions. The source/decoder tool checks passed 60
non-compiling Python cases: seven census, fourteen instruction, eighteen
complement and twenty-one complement-admission cases. The twelve residual
artifacts pass integrity/count admission and eight negative proof cases.

No application compilation, compiling test or game/client/network/server
execution occurred. The current unknown queue retains pending native/reference,
source and controlled original/rebuilt comparison work under #41.
