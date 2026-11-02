# Native discovery census — 0.120.2

Target SHA-256:
`80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c`.
The configured installed EXE was read as a read-only input; no application or server was
started. [Frozen input path resolution](coverage/historical-native-inputs-0.120.2.json)
preserves the original canonical summary bytes and commitments after later target refreshes. Structural, decoder, body/reference, semantic, source and parity
populations remain separate under #41.

## Complete file and linear inventories

The complete PE inventory records 145,484,288 file bytes, six mapped sections,
358,198 declared AMD64 unwind extents and 102,045,854 executable virtual bytes.
The [26-range file ledger](coverage/file-range-summary-0.120.2.json) partitions every
file byte without overlap or omission. Headers, section contents, slack and
padding candidates retain their exact selectors and unknown semantics. Ten
configured Data archives are accounted separately, without unregistered files.

Capstone 5.0.7 decodes all **358,198 declared extents** into **23,911,059
instruction records / 96,796,582 union bytes**, with no undecoded suffix.
The independent complement accounts for all **5,249,272** other executable
bytes in **337,474** regions. Its **2,847** seed addresses produce **80,612**
instruction candidates / **349,138** union bytes. The remaining disjoint
classes contain 2,323,153 mixed bytes, 944,950 uniform CC candidates, 11,199
uniform NOP candidates and 1,620,832 canonical padding-sequence candidates.
These labels prove neither noncode nor reachability. Independent exact-input,
database and count validation passes.

Diagnostic discovery/replay verifies **18,135 instruction references** across
603 of 763 paths, including all **62 AS paths**. Its 6,161 candidate extents
contain 1,902,744 decoded instructions. Each diagnostic has its current system
join; a reference does not establish semantic ownership of an entire function.

## Persistent whole-image recovery

The [declared verification](coverage/full-image-declared-0.120.2.json) checks
all **22,486,252 instructions / 89,873,154 exact bytes**, 360,709 functions,
418,416 actual body ranges and 3,877,457 static references. All 358,198 requested
entry bodies are repaired. Every exported instruction is independently checked
against original PE bytes and Capstone boundaries.

The pass uses the [shared analysis store](shared-analysis-storage.md), with
frozen plans and separately committed exports. Its saved Ghidra Program retains
transactions and the exact completed cursor. The current receipt's legacy-path
alias is excluded from older unfinished-Program selection; a focused fixture
checks fresh import, saved reuse and rejection of an unrelated unfinished plan.
Real Ghidra import, durable decoding/body repair and export completed after that
bootstrap correction. Historical producer commitments remain historical.

The expanded pass extends that same saved Program, with no second PE import.
Its frozen queue contains **430,362 function-entry starts plus 23,957 additional
code-only starts**. Current independently verified inputs include 2,581 guarded
tables, 1,348 diagnostic starts, 7,963 address-code starts, two import thunks and
28 unwind/PE metadata entries; contributions overlap and cannot be summed as
distinct functions. The applied 17,051 guarded edges retain the exact seed
snapshots and producer commitments. Code-only starts do not infer function
entries or incoming-edge ownership.

[Expanded independent verification](coverage/full-image-execheck-0.120.2.json)
checks every instruction against original PE bytes and Capstone boundaries:

| Expanded observation | Verified result |
| --- | ---: |
| Instructions / exact bytes | 23,315,051 / 93,447,361 |
| Native functions / actual body ranges | 432,982 / 489,385 |
| Static references / external locations | 4,037,643 / 425 |
| Ghidra computed call / jump-flow records | 70,988 / 142,259 |
| Unobserved executable bytes / ranges | 8,598,493 / 472,261 |

All requested entries have decoded starts and repaired flow bodies, and all
additional code seeds decode. The remaining executable bytes include 5,268,550
within declared extents and 3,329,943 outside them. Exact residual range
inventories distinguish candidate padding and mixed/unclassified bytes;
unobserved does not mean AS-specific, missing implementation or noncode.

Both durable native passes and their independent instruction verification
completed. The [atomic current selection](coverage/native-image-current-0.120.2.json)
binds this expanded census, current applied guarded tables, final ownership
classification and the same-census historical-range assessment. Retained older
profiles keep their actual target and are not applied to 0.120.2.

## Computed connections and residual ownership

The [separate switch recheck](coverage/native-jump-tables-rechecked-0.120.2.json)
admits 3,681 proposed tables, including 1,100 additional sites and zero changed
applied case vectors. The [complete proposal review](evidence/0.120.2/native-switch-proposal-review.json)
checks their 6,808 distinct new destination candidates: 582 are exact exported
instruction starts and 6,226 remain unobserved, without instruction-interior
conflicts. These proposals are not applied census edges.

Fourteen added tables have AS diagnostic/body context. The separate
[current correspondence receipts](evidence/0.120.2/native-switch-proposals.json)
map those retained Codex and CreatureQuery/shared Engine-command questions by
their bounded guard/dispatch/case-vector structure and current table bytes.
Their producer/consumer/alias, semantic and source applicability remains separate;
mixed gear/party diagnostics do not establish whole-function ownership. Generic
proposal contexts stay supporting residual work rather than invented AS bugs.

The [complete residual join](evidence/0.120.2/native-residuals.json) retains
90,575 ownerless instruction records, 809,184 static references whose sources
lack actual body owners and 7,955 distinct unowned executable destinations
across all static reference roles. Diagnostic replay checks all 18,135 sites on
exact exported boundaries; 1,216 have no actual body owner, including 60 AS
records. Its legacy `excluded-coop-path` label contains 111 owned records and
does not exclude any cooperative client/network/server source from recovery.

The [direct-flow/indirect-producer audit](evidence/0.120.2/native-dispatch.json)
separately retains 5,655 unowned direct-flow destinations, all exact instruction
starts without interior conflicts or undecoded targets. This flow-only subset
differs from the all-reference population above. Last-producer shapes and
decoded targets do not prove incoming owners, mutable aliases or runtime calls.
The [no-memory constant-register audit](evidence/0.120.2/native-constant-dispatch.json)
finds no additional immutable-register transfer targets within its exact
fallthrough bounds.

The [same-census operand audit](evidence/0.120.2/native-operands.json) inspects
all 23,315,051 instructions and retains 675,037 explicit static memory/address
expressions, including 10,157 without source body owners. Its unowned executable
address candidates contain 5,774 exact instruction starts and twenty unobserved
destinations, without interior conflicts. Register/index/segment inputs,
mutable pointer writers and data/ID meanings remain explicit unknowns.

[Opcode/source classification](coverage/native-ownership-classification-0.120.2.json)
distinguishes 70,765 actual indirect CALLs and 11,624 indirect JMPs from Ghidra's
computed-flow population, which also includes 130,635 UD2, 220 INT and three
INT3 instructions. All 62 AS diagnostic paths have partial reconstructed source
candidates. Thirteen missing generic-engine source candidates remain supporting
context; candidate names and vendored ancestry do not prove the compiled
revision or behavioral equivalence.

All twelve residual artifacts pass independent census/linear/complement input
and count admission, including eight negative target/input/count/completeness
cases. Exact frozen seed snapshots, exports and the shared saved Program remain
available for verified continuation. These successful checks do not close #41.

## Evidence limits

Whole-file accounting, declared linear decoding, Ghidra flow bodies and static
references have different populations and overlaps. None measures the fraction
of AS behavior recovered, reconstructed or matched. Initial pointer values,
possible static successors and actual runtime calls remain distinct.

The existing benilla/wenilla source remains the engine implementation; generic
supporting boundaries do not create an engine reconstruction task. Prior
recovery/source repairs retain their original target and precise applicability
questions. Current census bytes alone do not promote their semantics.

No application compilation, compiling tests, game/client/network/server
operation or controlled original/rebuilt comparison is part of this census.
Exact remaining ownership, dispatch, data/ID and comparison work belongs to the
[current unknown queue](unknown-recovery-0.120.2.md) and permanent findings in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).
