# Native inventory and discovery — 0.112.0

Target SHA-256: `dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[Target review](target-0.112.0.md), [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

The [complete declared-extent scan](evidence/0.112.0/refresh-baseline/instruction-summary.json) decodes
347,158 unwind extents, 23,034,418 instructions and 93,131,802 bytes without an
undecoded suffix. Its 71,879 indirect-call records remain unresolved leads.
The [complement inventory](evidence/0.112.0/refresh-baseline/unwind-complement-summary.json) separately
accounts for all 5,077,188 executable bytes outside those extents: 296,199
decoded candidate bytes, 2,286,015 mixed/unclassified bytes, 918,666 uniform-CC
candidates, 10,862 uniform-NOP candidates and 1,565,446 padding-sequence candidates.
Candidate decoding and padding classifications do not establish reachable code
or complete ownership.

## Complete declared-entry Ghidra pass

The [streaming pass](evidence/0.112.0/refresh-baseline/full-image-census.json) reads the installed PE
directly through the project REA/Ghidra driver, with automatic analysis disabled
and a 6 GiB heap. Every one of the 347,158 declared starts has instructions and a
repaired flow body; no requested start is missing. Its actual body ranges are
observed from control flow, not assigned from unwind extents.

The pass exports 21,633,359 instructions / 86,331,074 bytes, 349,478 native
functions, 405,292 body ranges, 3,727,669 Program references and 420 external
locations. Capstone 5.0.7 independently verifies every exported instruction's
exact installed bytes and length. All 2,329 observed direct-call helper targets
have final body owners. The exported static Program state is not a complete
dynamic call graph or semantic reconstruction.

The declared-entry pass leaves 11,877,916 mapped executable bytes unobserved:
7,038,035 inside declared extents and 4,839,881 outside. Its summary retains
every missing range and candidate class. These residuals are separate from
the complete linear/complement byte accounting above.

## Initial integrated code-lead pass

The [broader current pass](evidence/0.112.0/integrated-census.json) combines all
347,158 declared starts with current direct-flow complement leads and relocated
executable-pointer targets outside the independently verified declared bodies.
All **418,250** selected starts have instructions and repaired bodies. It exports
**21,990,655 instructions / 87,769,873 bytes**, 420,680 native functions,
477,564 body ranges and 3,763,437 Program references. Every exported instruction
passes the same independent exact-byte/length verification against this EXE.

All 2,329 observed direct-call helper targets have final native owners. Seven
helper owners change during primary repair; the final-owner audit retains those
observations separately. No observed direct-CALL source/destination lacks a body
owner in this profile, but 767,560 Program references originate outside native
bodies. These static associations do not resolve their source-level meaning.

The integrated pass leaves **10,439,117 executable bytes unobserved**:
7,038,035 inside declared extents and 3,401,082 outside. Mixed/unclassified
residuals account for 6,679,125 declared bytes and 345,299 outside bytes;
other residual classes are padding candidates, not proved noncode. Its
67,474 computed calls and 137,539 computed jumps retain unresolved dynamic,
alias and semantic ownership. This initial profile omits the current guarded-switch/address/metadata inputs
used in the fresh pass below. Historical 0.110.0 proofs retain their own hash.
Concrete custom contracts must follow their required edges and dependencies
before certification.
The complete linear/complement inventory accounts for these bytes independently.

## Fresh comprehensive EXE audit

The [fresh census](evidence/0.112.0/execheck-native-census.json) imports the entire
installed PE through REA/Ghidra with automatic analysis disabled and a 6 GiB heap.
Its [applied-input review](evidence/0.112.0/execheck-native-inputs.json) verifies
original producer/tool commitments separately from this launch. The complete
queue combines declared entries, complement/direct-flow and relocated pointers,
all current diagnostics, 5,964 validated address roots, 3,713 guarded tables,
two import thunks and current unwind/directory entries. Code-only destinations
remain separate from function entries.

All **418,268 requested function starts** have decoded entries and repaired flow
bodies. The 453,137-root disassembly queue additionally includes proved code
roots; it does not assign a function to each root. All **22,505,703 exported
instructions / 90,103,623 bytes** pass independent Capstone 5.0.7 exact-byte and
length checks. The pass observes **420,696 native functions**, 473,698 body ranges,
3,901,941 Program references and 420 external locations.

The additional input review finds three exact source LEAs to two import thunks,
and 271,468 distinct version-1 unwind records with 72,754 handler records and
sixteen chains. PE entry/TLS/load-config and handler metadata supply 28 distinct
entries. Their union adds eighteen function starts beyond the initial queue;
metadata and initial pointer values do not establish runtime behavior.

All 2,365 observed direct-CALL helper targets have final body owners. There are
no ownerless direct-CALL destinations, but 6,516 source CALL sites and 788,846
Program-reference source records remain outside native bodies. The 23,920
proved guarded edges / 69,176 encoded cases retain their exact 3,713 whole-table
bounds. **70,420 computed calls and 139,585 computed jumps** do not become a
complete dynamic graph through this evidence.

The fresh pass leaves **8,105,367 executable bytes unobserved by Ghidra**:
4,960,444 inside declared extents and 3,144,923 outside. Mixed/unclassified
residuals include 4,592,712 declared bytes and 51,004 outside bytes; other classes
are padding candidates, not proved noncode. Complete linear/complement byte
accounting remains separate. Encoded operands, alias/input domains, source
semantics and required Survivors-specific dependencies remain #41.

The [same-parent explicit operand audit](evidence/0.112.0/execheck-native-operands.json)
inspects every fresh instruction and retains 664,549 static operands. All 420
import slots have owned explicit references. Six of nine residual unobserved
LEA destinations connect to shared Lua VM helpers; three remain unattributed
supporting leads. No new Survivors gameplay failure follows from these leads.
Register/index/segment aliases and mutable slot values remain unproved.

The [AS dispatch contracts](native-dispatch-recovery-0.112.0.md) retain their
original supporting census, classifier, source snapshot and finite input bounds.
The fresh census, operand audit, custom partition, historical audit and connection
map select one exact parent. No mixed-parent atomic classifier selection is
created; the historical 0.109.0 selection remains historical.

## Selected diagnostic owners

The independent [selected whole-PE queue](evidence/0.112.0/refresh-baseline/seeded-census.json) completes
all 53 custom diagnostic-owner instruction/body/reference query sets. It exports
12,236 instructions, 58,122 summed body bytes, 2,569 outgoing references,
1,251 incoming references and 198 unresolved call sites. All 53 selected
diagnostic instructions are observed and match independent linear boundaries;
32 observed bodies equal their declared extents. Other flow bodies remain as
observed. This selection supplements the full-image pass and does not replace it.

The [complete custom diagnostic partition](evidence/0.112.0/native-custom-coverage.json)
joins all 53 paths to retained source correspondences using the fresh census.
All 681 distinct lead sites now have exact decoded instructions; 626 have actual
body owners and 55 remain ownerless. All 53 paths have a native Location/body
owner. Decoding an error block or a table target does not create a function or
recover its source semantics. Current alias/input/dispatch dependencies and the
unresolved sites remain #41.

## Historical evidence and source crosswalk

The [range audit](coverage/historical-range-revalidation.json) and
[connection map](coverage/exe-connections.json) now select the same fresh verified
census as the custom partition. Exact recovered preimage matches are separated
from unavailable/ambiguous/absent bytes and actual body ownership. They do not
revalidate callers, data dependencies, effect meaning or complete source contracts.

The connection map retains every custom system's actual source anchors, bounded
current reports, historical evidence and permanent gaps. Current diagnostic
membership does not certify a whole system. The [EXE audit](execheck-0.112.0.md)
owns the complete action table, source-catalog findings and finished static checks.

## Reproduction and limits

Use the existing project-local Capstone environment for Python summaries.
Replace `<sha>` below with this report's exact target hash; every output must
remain in the checkout. Each changed seed plan needs a fresh directory.

```sh
python3 -B scripts/census-native-image.py --run --seed-scope declared --output runtime/coverage/<sha>/ghidra/declared
python3 -B scripts/summarize-native-image.py --input runtime/coverage/<sha>/ghidra/declared --write
python3 -B scripts/census-native-image.py --run --seed-scope all --output runtime/coverage/<sha>/ghidra/integrated
python3 -B scripts/summarize-native-image.py --input runtime/coverage/<sha>/ghidra/integrated --summary-output docs/analysis/evidence/0.112.0/integrated-census.json --write
python3 -B scripts/census-current-target.py --run --full-profile full-image-diagnostic-owner-repaired --limit 53 --startup-timeout 600
python3 -B scripts/summarize-seeded-census.py --write
```

The comprehensive profile also requires the exact verified current proof inputs
listed in the applied-input review. The completed invocation was:

```sh
python3 -B scripts/census-native-image.py --run --seed-scope all \
  --jump-tables runtime/fixgap41-0.112.0/ghidra-full-declared-address/jump-tables-input-summary.json \
  --diagnostic-leads runtime/fixgap41-0.112.0/ghidra-full-declared-address/diagnostic-code-input.json \
  --import-thunks runtime/execheck-0.112.0-20261023/inputs/import-thunks-summary.json \
  --unwind-handlers runtime/execheck-0.112.0-20261023/inputs/unwind-handlers-summary.json \
  --output runtime/execheck-0.112.0-20261023/ghidra-comprehensive
python3 -B scripts/summarize-native-image.py \
  --input runtime/execheck-0.112.0-20261023/ghidra-comprehensive \
  --summary-output runtime/execheck-0.112.0-20261023/verified-census.json --write
python3 -B scripts/audit-native-operands.py \
  --census-summary docs/analysis/evidence/0.112.0/execheck-native-census.json \
  --inventory-output runtime/execheck-0.112.0-20261023/operands/operands.jsonl.gz \
  --summary-output runtime/execheck-0.112.0-20261023/operands/summary.json --write
```

Recreate missing ignored inputs through their hash-bound producers before a
replay; directory names alone are not proof. Use new output paths for a new
pass. In particular, the combined diagnostic input carries revalidated address
boundaries and must not be replaced with the earlier unvalidated address list.
Summary generation writes compacted inventories; do not overwrite artifacts
already referenced by a retained summary.

The fresh whole-image pass completed; the known historical automatic-analysis
startup failure was not repeated with an unchanged failed profile. Current passes use the established streaming and
repaired selected profiles; old failures and old switch/operand/classifier
observations retain their actual target hashes. No previous RVA or repaired
body is silently selected as current proof.

All 53 custom diagnostics have current native leads. Complete body/source
semantics, required caller/data/producer/consumer dependencies, computed edges,
aliases, script/UI/ID consumers and relevant benilla engine deltas remain #41.
The [release-data review](evidence/0.112.0/release-data-leads.json) is a separate
bounded data observation, not native effect-consumer validation. No compilation,
compiling test, target process, game/input/rendering or parity comparison was run.
