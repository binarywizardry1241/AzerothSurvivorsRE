# Native discovery census — 0.120.4

Target SHA-256:
`7e3e3f9558de1d87e615592c7b5d83f00de393ac8efa4e67d8f9b634ed07d6bf`.
The configured installed EXE was read in place. No application, client, network
or cooperative server was started. Structural, decoder, body/reference,
semantic, source and parity populations remain separate under #41.

## Complete file and independent linear inventories

The complete PE scan accounts for **145,489,408 file bytes**, six mapped
sections, **358,210 declared unwind extents** and **102,050,478 executable
virtual bytes**. The [26-range disjoint file ledger](coverage/file-range-summary.json)
retains exact selectors for headers, sections, slack, metadata and unclassified
contents. Configured Data archives are accounted separately by the
[target review](target-0.120.4.md); a complete byte inventory is not semantic
recovery.

[Capstone 5.0.7 linear decoding](coverage/instruction-summary.json) processes
every declared extent: **23,912,330 instruction records / 96,801,051 union
bytes**, with no undecoded suffix. Independent admission checks the target,
producer/parser and database hashes. Reproduction verifies all **358,210**
saved ordinal/range/file-offset/original-byte SHA commitments against the PE
and regenerates the summary counters from the saved inventory, without errors.

The [separate executable complement](coverage/unwind-complement-summary.json)
accounts for all **5,249,427 bytes / 337,482 regions**. Its **2,847** seed
addresses produce **80,612 candidate instructions / 349,138 union bytes**.
The residual partition retains 2,323,146 mixed bytes, 944,979 uniform CC
candidates, 11,194 uniform NOP candidates and 1,620,970 canonical padding
sequence candidates. Independent original-PE mapping, database, count and
partition validation passes. Candidate padding is not proved noncode.

## Durable complete-image Ghidra passes

The [declared pass](coverage/full-image-declared-0.120.4.json) independently
verifies **22,487,299 instructions / 89,876,527 exact bytes**, **360,721**
Ghidra functions, **418,460** actual body ranges and **3,877,683** static
references. Every requested declared entry has a decoded start and repaired
flow body. Unwind extents are not substituted for actual bodies.

The expanded pass extends the **same saved Program**, with no second PE
import. Its frozen queue contains **430,374 entry seeds plus 23,959 code-only
starts**. Exact current inputs include **2,582 guarded tables**, **1,348
diagnostic starts**, **7,963 address-taken starts**, **two import-thunk entries**
and **28 unwind/PE metadata entries**. Contributions overlap and cannot be
summed as functions. All **17,057** admitted guarded edges are applied. Initial
encoded pointers and possible code successors do not establish runtime calls,
source function identity or AS ownership.

[Expanded original-byte and Capstone verification](coverage/full-image-execheck-0.120.4.json)
checks every exported instruction and preserves the complete remaining range
partition:

| Expanded observation | Verified result |
| --- | ---: |
| Instructions / exact bytes | 23,316,158 / 93,451,075 |
| Ghidra functions / actual body ranges | 432,994 / 489,428 |
| Static references / external locations | 4,037,881 / 425 |
| Computed call / jump-flow records | 70,983 / 142,253 |
| Unobserved executable bytes / ranges | 8,599,403 / 472,301 |

All 430,374 requested entry bodies are repaired and all additional code starts
decode. The remaining executable bytes include **5,269,305** within declared
extents and **3,330,098** outside them. Exact residual inventories distinguish
candidate padding and mixed/unclassified ranges. Unobserved bytes are not
automatically AS-specific, absent implementation or noncode. Computed-flow
records also include traps and must not be equated to indirect CALL/JMP counts.

The [shared analysis store](shared-analysis-storage.md) retains frozen plans,
input snapshots, native producer commitments, exports and saved Program
checkpoints. The [historical 0.120.2 path map](coverage/historical-native-inputs-0.120.2.json)
preserves original receipt bytes and their exact input commitments. Historical
semantic recovery and source repairs retain their original provenance; a new
target does not erase them or automatically validate their current applicability.

## Computed connections and residual ownership

The [separate switch recheck](coverage/native-jump-tables-rechecked-0.120.4.json)
admits **3,682 proposed tables**, including **1,100 additional sites** and
zero changed applied case vectors. The
[complete proposal review](evidence/0.120.4/native-switch-proposal-review.json)
checks their **6,808 distinct destination candidates**: **582** are exact
exported instruction starts and **6,226** remain unobserved, without instruction
interior conflicts. These proposals are not applied census edges. Fourteen
tables have AS diagnostic/body or declared-extent context; context is not
semantic ownership. Their retained classifications and current correspondence
are reviewed separately by the [AS audit](as-discovery-0.120.4.md).

The [complete residual join](evidence/0.120.4/native-residuals.json) retains
**90,575 ownerless instruction records**, **809,207 static references whose
sources lack actual body owners** and **7,955 distinct unowned executable
destinations** across all reference roles. Diagnostic replay checks all
**18,119** current reference records on exact exported instruction boundaries;
**1,216** have no actual body owner, including **60 AS records**. The retained
`excluded-coop-path` context label describes 111 owned records and excludes no
cooperative client, networking or server source from the current recovery scope.

The [direct-flow/indirect-producer audit](evidence/0.120.4/native-dispatch.json)
separately retains **5,655 unowned direct-flow destinations**, all exact
instruction starts without interior conflicts or undecoded targets. This subset
differs from the all-reference population above. Last-producer shapes and
decoded destinations do not prove incoming owners, mutable aliases or runtime
calls. The [no-memory constant-register audit](evidence/0.120.4/native-constant-dispatch.json)
finds no additional immutable-register transfer target within its exact
fallthrough bounds.

The [same-census operand audit](evidence/0.120.4/native-operands.json) inspects
all **23,316,158** instructions and retains **675,031** explicit static
memory/address expressions, including **10,157** without source body owners.
Its unowned executable address candidates contain **5,774** exact instruction
starts and **20** unobserved destinations, without interior conflicts. Incoming
registers, indexed/segmented addresses, mutable pointer writers and data/ID
meanings remain explicit unknowns.

[Opcode/source classification](coverage/native-ownership-classification.json)
distinguishes **70,760 actual indirect CALLs** and **11,625 indirect JMPs** from
the Ghidra computed-flow population. All **62 AS diagnostic paths** have partial
reconstructed source candidates. Thirteen absent generic-engine source
candidates remain supporting context; path matches and vendored ancestry do
not prove the compiled revision or behavioral equivalence.

Classification replay compares the gzip artifacts, JSON artifacts and complete
receipt without publication. Explicit publication preserves equal bytes and
timestamps, and atomically replaces a final file alias for changed output
without changing its shared target. **28 non-compiling publication/value
fixtures** pass. A complete selected-target replay preserves all four artifact
byte streams and timestamps plus the classification receipt. Original producer
versions remain available through the [script provenance register](script-provenance.json).

The [atomic current selection](coverage/native-image-current.json) binds the
expanded census, applied guarded tables, current ownership classification and
the [same-census historical-range assessment](coverage/historical-range-revalidation.json).
Selection validation passes. Historical profiles and original producer
versions remain explicitly retained and are not relabelled as current native
executions. The historical join examines 19,763 unique range commitments and
retains 1,295 exact byte-match candidates; these are not semantic correspondence
or transferred source/runtime/parity proof.

All twelve residual artifact sets pass independent census/linear/complement
input and count admission, including eight negative target/input/count and
completeness cases. Frozen input snapshots and the current saved Program remain
available for continuation. These successful checks do not close #41.

## Evidence limits

Whole-file accounting, linear decoding, Ghidra flow bodies, static references,
semantic recovery and connected source have different populations and overlaps.
None measures the fraction of AS functionality reconstructed or matched. The
existing benilla/wenilla source remains the engine implementation; native
inventory of engine bytes does not create an engine reconstruction task.

No application compilation, compiling test, game/client/network/server operation
or controlled original/rebuilt comparison is part of this census. Remaining
ownership, dispatch, data/ID and comparison work belongs to the
[current unknown queue](unknown-recovery-0.120.4.md) and permanent findings in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).
