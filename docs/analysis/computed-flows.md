# Computed-flow instruction classification

Installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
Parent **#41**, selectors **Q41-F01/F02**, with bounded **M03** candidate output.
The [proof](evidence/computed-flows.json) classifies every original
computed-flow record against the exact current PE bytes and preserves each
selector digest. It does not change the census or establish AS/source semantics.

## Flow labels versus instructions

| Original Ghidra selector | Original records | Actual indirect instructions | Trap instructions |
| --- | ---: | ---: | ---: |
| F01-call | 70,681 | 70,459 calls | 219 INT, 3 INT3 |
| F01-jump | 140,058 | 11,516 jumps | 128,542 UD2 |

Ghidra's recorded computed-flow labels include interrupt/trap operations.
Consequently **128,764 records are traps**, and **81,975 are indirect calls or
jumps**. A trap is neither a missing indirect target nor proof of padding or
unreachability. All original populations, guard partitions and observations
remain intact; semantic and incoming-flow questions are separate.

The independent F02 linear view has 72,276 indirect-call records: 70,451 share
an actual Ghidra indirect start and 1,825 do not. Its 10,292 jump records split
7,323/2,969 respectively. All 647 complement jump records share such a start.
These are overlapping decoder views with different observed boundaries. Their
differences are retained, not added together or promoted to missing functions.

## Current static candidates and boundaries

The [current candidate classifier](evidence/native-call-candidates.json)
consumes the verified full-image census, initial PE import/relocation slots and
bounded straight-line register propagation. The complete 81,975-record artifact
remains ignored and is bound by digest. Of these records, 1,555 have encoded
import-slot candidates and 996 have encoded in-image executable candidates.
The remaining **79,424** retain exact missing-input reasons: 68,107 calls and
11,317 jumps need register, index or memory-slot producer evidence. An applied
guard or another bounded contract can already explain a subset; this classifier
does not replace those stronger owning proofs or count all residuals as wholly
unknown behavior.

All 425 import slots have observed native callers, while only seven have a
diagnostic-path candidate from this limited join. The 31 GetProcAddress sites
retain 26 literal-name inputs, one ordinal and four inputs not established in
their observed blocks. Literal names, baseline source matches and loader slots
are candidates; they establish no runtime module, callee, source revision,
mutable alias, full containing contract or missing gameplay feature.

The eleven absent engine-source candidates are supporting context and do not
authorize engine reconstruction. M03 still lacks the complete current
semantic/source/dynamic-alias inventory. This current candidate output closes
the absence of a current straight-line candidate pass, not that semantic gap.

## Reproduction and limits

`python3 -B scripts/check-q41-computed-flows.py` rechecks every F01/F02
selected instruction against the current image, original selector commitments,
cross-view partitions and the complete candidate-record population. `--stage`
writes a proposed compact proof under ignored `runtime/` for review.

Regenerate the candidate pass with the existing project-local Capstone runtime:

```sh
PYTHONPATH="$PWD/runtime/tool-state/python/camera/python-libs:$PWD/scripts" python3 -B scripts/classify-native-ownership.py --census-summary docs/analysis/coverage/full-image-execheck.json --output runtime/analysis/history/target-audit/execheck/69d2f07fbba6/current-ownership.json --write
```

Bulk gzip bytes can vary on regeneration; review the new commitments before
promoting a changed compact report. No compiler, reconstructed source, game,
network, OS API or original/rebuilt comparison executes. Complete callee/type,
AS ownership, mutable alias and runtime/parity proof remain open.
