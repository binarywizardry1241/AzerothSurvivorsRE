# Independent indirect operands

The installed 0.115.0 target, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`,
has **83,284 exact independent indirect-transfer sites** in the selected F01/F02
inventories. The [compact proof](evidence/0.115.0/independent-indirects.json)
binds the complete ignored row inventory, both owning SQLite inventories and
summaries, the current saved-Program body ranges, the original PE, and the
completed residual and Ghidra ownership proofs.

This companion classifies the encoded operand of every selected site. It
preserves sites outside Ghidra bodies and does not infer missing functions or
computed runtime targets.

| Exact selection | Records | In Ghidra ownership | Outside Ghidra bodies |
| --- | ---: | ---: | ---: |
| Q41-F01, declared unwind inventory | 82,636 | 74,650 | 7,986 |
| Q41-F02, independently decoded complement | 648 | 612 | 36 |
| Total | 83,284 | 75,262 | 8,022 |

| Encoded operand | Records |
| --- | ---: |
| Fixed relative memory slot | 1,567 |
| Register-relative memory | 45,636 |
| Register | 36,065 |
| Indexed memory | 16 |

The fixed slots contain 1,557 declared import bindings, four relocation-backed
initial image pointers and six slots without a declared pointer binding. The
remaining 81,717 operands need dynamic address state. Among the 8,022 sites
absent from Ghidra ownership, 75 have exact declared import slots; the other
7,947 use registers or register-relative memory. Every row retains its original
bytes, selector identity, declared extent ordinal where applicable, spatial
body owner, and presence or absence in the Ghidra indirect set.

An import slot names a loader declaration. A relocation-backed image pointer
records its initial encoded value and spatial destination. Neither establishes
the runtime callee, reachability, alias lifetime or source semantics. Existing
Ghidra initial-target candidates are retained separately; the companion does
not propagate incoming register state or resolve indexed dispatch tables.
F01/F02 runtime destination and alias recovery remains open under #41.

The [producer](../../scripts/classify-independent-indirects.py) verifies each
selected instruction against the hash-verified installed bytes and decodes the
complete saved instruction. It rejects duplicate or overlapping independent
sites and requires the Ghidra records to be the exact observed intersection.
It captures input, dependency and generator commitments before analysis and
rejects changes before publishing its summary.

The [checker](../../scripts/check-independent-indirects.py) passed for all
83,284 rows, comparing exact selected sites, bytes, flow kinds, operand/access
fields, decoded register/slot state, extent IDs, residual body joins and Ghidra initial candidates. Fifteen
negative cases rejected changed target, binding, census, selector counts,
optimistic completeness flags, wrong flow kinds, malformed instruction spans
and a direct call substituted for an indirect call. Seven small instruction
fixtures also checked register, indexed, segment, relative/absolute slot and
32-bit address-size distinctions.

Reproduce with an existing Capstone 5 Python environment:

```sh
python3 -B scripts/classify-independent-indirects.py \
  --ownership-summary runtime/analysis/history/findings/q41-ownership/2bcdf9438d76/ownership-summary-final.json \
  --residual-summary runtime/analysis/history/findings/q41-ownership/2bcdf9438d76/residual-summary-v2.json \
  --output-directory runtime/analysis/history/findings/q41-ownership/2bcdf9438d76/independent-indirects-final \
  --summary-output runtime/analysis/history/findings/q41-ownership/2bcdf9438d76/independent-indirect-summary-final.json
python3 -B scripts/check-independent-indirects.py \
  --proof docs/analysis/evidence/0.115.0/independent-indirects.json \
  --negative-tests
```

No new native analysis session, compilation, application/game launch or
original/rebuilt parity comparison was performed. No source-system or
changelog status follows from these operand classifications.
