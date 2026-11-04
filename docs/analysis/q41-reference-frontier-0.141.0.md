# Encoded references and ownerless flow — 0.141.0

Permanent [#41](../CURRENT-STATE.md#gap-41), selectors **Q41-A01, Q41-A02
and Q41-G01**. The installed EXE SHA-256 is
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This review uses the independently verified [selected Ghidra census](native-census-0.141.0.md)
and [residual inventories](evidence/0.141.0/native-residuals.json).
The [reference proof](evidence/0.141.0/encoded-reference-frontier.json) records
the input commitments and complete structural projections. The independent
encoded and Ghidra reference populations overlap and must be counted separately.

## Q41-A01: declared references

All 3,988,020 encoded direct/address/memory records are classified by
operand, PE destination and saved body membership. The 126,346 records
targeting executable addresses outside saved bodies comprise 113,504
same-extent branch records and 12,842 address operands. No encoded direct
call or memory operand in this population targets an unowned executable
address. An unwind extent can contain several observed bodies, alternate
branches, and mixed code/data. A same-extent jump therefore establishes
local encoded flow without creating a new callable function.

The narrower projection selects 2,757 records whose source body or source
or destination unwind extent has a genuine Survivors Rust Location.
Of the 2,752 same-extent jumps, 345 target observed ownerless instruction
starts and 2,407 lack an observed start there. The other five records
are all LEAs forming observed ownerless targets:

| Operands and targets (preferred VA) | Bounded role |
| --- | --- |
| `0x140201235 → 0x1401df4e0` | The Options path stores the address in a local descriptor at `[rbp+0x568]`. Its thunk tail-jumps to `0x140125800`, which walks 56-byte rows and releases their owned allocations before releasing the backing allocation and other owned fields. This identifies cleanup glue; the selected LEA alone does not prove invocation or the concrete type name. |
| `0x145df1345`, `0x145df16f0 → 0x144c813b0` | These sites write formatting argument descriptors consumed at `0x145df137e` and `0x145df172e`. The adapter dereferences its argument and tail-jumps to `0x146386670`, which reads one unsigned byte and emits decimal digits through the formatter. This identifies a formatting boundary, without assigning the surrounding save/jewelry record a new meaning. |
| `0x145f19f0e → 0x145fd1f70`, `0x145f19f15 → 0x145fd1fc0` | Enemy definition byte `+0x4c` is compared with zero at `0x145f19ecd`. `CMOVNE` selects the nonzero leaf at `0x145f19f1c`; `call rcx` consumes it at `0x145f19f47`. The leaves have the retained scalar operation order and cubic bits `0x3bc2a455` / `0x3be6afcd`. Inputs are seconds divided by 60 and the product of the zone and difficulty scales. The output multiplies the flagged/ordinary base HP factor before the late-run term. |

The enemy selection maps to the
[0.120.0 contract](q41-enemy-callback-0.120.0.md) and live
[`health_polynomial` and its caller](../../crates/azeroth-survivors-re/src/enemies/scaling.rs).
The checked current branch, arithmetic and immediate consumer agree with the
source. The wider [enemy constructor finding](../CURRENT-STATE.md#gap-139)
retains its own applicability limits. The other three operands do not
establish a missing Survivors mechanic or a source defect.

## Q41-A02: complement references and imports

All 13,280 non-indirect complement records have a saved source-body owner:
1,628 address operands, 18 direct calls, 10,360 direct jumps and 1,274
memory operands. All direct destinations are owned. The only executable
unowned destinations are eleven of thirteen LEA targets; all eleven are
observed instruction starts. The proof records every executable-address
operand and the union of sites whose source or destination body has a
custom diagnostic association.

The 126 fixed RIP-relative IAT transfer sites use `jmp [rip+disp32]` to
119 named PE import slots. The checker resolves the displacement directly
from each instruction in the installed EXE. No other complement operand
addresses an IAT slot. This classifies the static Windows import boundary;
the loader's live pointers, executed targets and OS behavior remain outside
the evidence.

Twelve of the thirteen executable LEAs form callback addresses in repeated
adapters. The receiver preserves R8 and stores it at allocation offset
`+0x10` (for example `0x142524987 → 0x142548030`, store
`0x14254849f`). The allocation also holds a context word at `+0x18`. All
twelve vtables have header `(drop=0, size=16, align=8)`. The methods
consume the stored function and forward the result to `0x145bff8a0`;
representative method calls are at `0x140709225` and `0x140706b21` for
vtable `0x146978a30`. The observed leaves are ten caller-buffer writers,
a scalar `0x101` result and one owned RET-only leaf. The 36 saved direct
caller references to these adapters have no joined diagnostic paths, so
the concrete registering subsystem and dynamic execution remain open.
The other LEA, `0x1463a5014 → 0x1463a5024`, passes a filter
checking C++ exception code `0xe06d7363` and its parameter magic to
`kernel32.dll!SetUnhandledExceptionFilter` through `0x14654f8d8`. It is
generic Windows runtime context.

| Selected custom-context site | Current boundary |
| --- | --- |
| `0x14074cee0` | Stores the `noSpellEffects` byte at `0x148ac3488`. Producer `0x140051da0` loads the exact key, trims its value and tests for one ASCII `1` before the tail transfer. Chain-beam and destination-effect consumers read the flag; rebuilt `spell_settings::hidden` supplies the corresponding gate. |
| `0x1408b1180 → 0x1409a3e60` | The previously mapped [host world reset](world-anchors-0.141.0.md) tail transfer. |
| `0x145e957b4 → 0x145ef38f0` | The sole caller at `0x145e9f2ec` comes from opcode `0x56` in table `0x147aec530`. The wrapper checks party discriminant 3, the peer index, the tagged `0x8a0`-byte peer row and its available game before serving a single-item query. The rebuilt [item-query command](../../crates/azeroth-survivors-re/src/gameplay/coop_commands.rs) scopes the lookup to the recipient slot. The item registry and recipient-text findings retain their broader limits. |
| `0x145fb9cd1`, `0x145fc10bb → 0x145fb7120` | Both wrappers gate pending offers, phase 1 and a clear `+0x10dd` flag before passing `EDX=0, R8B=1` to the offer generator. The first requires `+0x10e7=0xff` and sets `+0x10d9`; the second writes `+0x10d8` and takes the admitted false branch. The rebuilt [level-up controls](../../crates/azeroth-survivors-re/src/gameplay/mechanics/completion.rs) have separate store-level and spend routes to common generation. The wider [upgrade contract](../CURRENT-STATE.md#gap-91) owns the remaining field and dispatcher semantics. |

## Q41-G01: ownerless instructions and reference sources

The [instruction proof](evidence/0.141.0/as-ownerless-instructions.json)
partitions all 123,402 ownerless instruction records. The complete
Survivors Location slice has 2,827 records in 83 runs and 26 declared
extents; 27,508 other records have a non-AS diagnostic extent, 51,108
are in extents with no diagnostic context, and 41,959 are outside declared
extents. The checker independently verifies the bytes and length of every
instruction in the Survivors slice. It proves 337 terminal instructions
(47 whole runs) by following local direct flow, including both branches of
each conditional, to a checked failure wrapper or `UD2`. Both branches
of the additional wrapper at `0x14654d94b` end in `UD2`, adding 28
verified instruction rows to the four existing wrapper routes.

All 298 saved Ghidra references targeting the selected ownerless starts
come from other selected instructions: 151 conditional jumps, 101
unconditional jumps and 46 computed jumps. The converse projection finds
110 direct edges from observed ownerless starts into saved bodies with a
genuine AS Location: 68 calls and 42 jumps. Of the calls, 57 enter the
localization bodies `0x145e788b0` and `0x145e78c90`. Thirteen jumps rejoin
the font body `0x145dd6ba0` and twelve rejoin the attack-script body
`0x145f4a110`. Both projections are static observations. The saved pass
lacks a complete incoming-flow proof; Ghidra's missing edge is not evidence
that a fragment is unreachable.

The other 2,490 instructions occupy 36 runs in seven extents. The
selectors retain partial-run failures separately from unresolved local
exits. These anchors identify paths to reuse; they do not assign complete
semantics to the enclosing runs.

| Declared extent start | Instructions without a terminal proof | Existing path or next boundary |
| --- | ---: | --- |
| `0x140205c20` | 7 | [Options header removal](q41-diagnostic-consumers-0.141.0.md#returning-removals); keep writeback separate from failure. |
| `0x145dd6ba0` | 41 | [Font provider](font-table-publication-0.141.0.md); trace the remaining nested table input and fallback branches from the exact rejoins. |
| `0x145f4a110` | 307 | [Attack-script dispatcher](scholomance-barov-0.141.0.md); connect the remaining guarded branches to their script and actor state. |
| `0x145f51870` | 850 | [Ability payload](status-weakening-0.139.2.md#ground-periodic-and-self-aura-payloads-in-01410) and [totem replacement](unknown-recovery-0.141.0.md#q41-d01-immediate-consumers); follow unresolved descriptor inputs and dispatch. |
| `0x145f8e670` | 120 | [Talent/kill reset](kill-selector-0.139.2.md); keep the existing Reaper and Darkmantle branches separate from unproved state flow. |
| `0x145fbbf50` | 266 | Spell and treasure card payload; the gold title, amount and icon have [rebuilt consumers](../../crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs). Remaining variant producers and exits retain exact runs. |
| `0x145fc1500` | 899 | Choice acceptance and selected row application, described below. |

The largest remaining cluster, 899 instructions in `0x145fc1500`, belongs
to the successful choice consumer. The guard at
`[0x145fc154c, 0x145fc1592)` requires phase 2 and a non-sentinel offer
source, checks the zero-based index against the row count, and indexes
160-byte rows. Its file offset is `0x5fc094c` and SHA-256 is
`368266ce855aed3cf458fb40e701b18d17be599e72a6904a286f672d4e411a9e`.
Two command paths call it at `0x145e73e58` and `0x145ef89c3` with the
index from command byte `+1`, after admitting a zero offer generation or
an exact match against `[Game+0x1054]`. The existing
[`pick::admits`](../../crates/azeroth-survivors-re/src/coop/pick.rs)
and [live choice consumer](../../crates/azeroth-survivors-re/src/gameplay/mechanics/choices.rs)
already connect this gate, the row bounds check and choice application.
The packed formatter calls at `0x145fc2372` and `0x145fc2644` sit inside
the chooser; their diagnostic adjacency does not assign this extent to the
detailed meter. The [diagnostic consumer trace](q41-diagnostic-consumers-0.141.0.md)
separately resolves these operands as equipment display names and follows
the card title to its live producer. Remaining card variants, skip and
republish behavior are outside this admission proof.

Of 848,784 saved reference records with sources outside bodies, 823,580
are data references from `.pdata`, `.rdata`, or PE headers and 25,204
originate at observed instructions. The data references are not missing
instruction records. The full Ghidra projection separately reproduces all
11,205 distinct unowned executable destinations from 15,305 saved references.
No function ownership was added.

## Remaining questions and checks

Use the exact extents, runs, terminal subranges and incoming selectors in
the proofs to follow remaining admitted code. In particular, do not reopen
the 74 [diagnostic operand roles](unknown-recovery-0.141.0.md#q41-d01-immediate-consumers),
the five A01 LEAs, or the A02 import and exception interfaces simply because
the raw pass still reports ownerless observations. Remaining local and
dynamic dispatch, typed state, and caller-to-source questions stay under
#41 or their existing mechanic findings. The selected review did not
establish a new gameplay source defect.

```sh
python3 -B scripts/classify-q41-as-references.py --encoded-frontier
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/classify-as-ownerless-sites.py --instruction-frontier
```

The selected EXE and retained inventories are read in place. These checks do
not compile, launch the target or prove original/rebuilt parity.
