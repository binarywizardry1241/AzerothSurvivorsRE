# Native inventory and discovery — 0.110.0

**Historical target:** this report covers 0.110.0 only. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the installed target and current limits.

Target SHA-256: `e069bf3152f8d8f7160d66388907fc181c733bd170aa150d3b7ff7adf251e048`.
[Target review](target-0.110.0.md), [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

The [declared-extent census](evidence/0.110.0/instruction-summary.json) decodes all
347,073 unwind extents, 23,029,153 instructions and 93,111,261 bytes, with no
undecoded suffix. It records 71,867 indirect calls as unresolved leads. The
[complement census](evidence/0.110.0/unwind-complement-summary.json) accounts for all
5,076,673 executable bytes outside these extents: 296,199 decoded candidate
bytes, 2,286,009 mixed/unclassified bytes, 918,586 uniform-CC candidates,
10,858 uniform-NOP candidates and 1,565,021 padding-sequence candidates.
Decoding candidates and padding classifications are not complete code ownership.

The full-image REA/Ghidra automatic entry-decoding profile opened the actual PE
with a 6 GiB heap but failed during startup at its 600-second bound, before
returning procedure/body/reference results. Repeating it unchanged would not
resolve that failure. The established streaming census completed with every declared entry. The [verified declared-entry pass](evidence/0.110.0/full-image-census.json)
contains 21,626,625 instructions, 349,393 native functions, 405,200 actual body
ranges and 3,726,373 references. Capstone independently verifies every exported
instruction against the exact source bytes. All 347,073 requested seeds have
instructions and repaired flow bodies; no requested seed is missing. The broader
[integrated seed pass](evidence/0.110.0/integrated-census.json) also completes:
418,166 seeded entries, 21,983,926 instructions, 420,596 native functions,
477,473 actual body ranges and 3,762,143 Program references. Every exported
instruction is independently verified against the current bytes; every requested
seed has instructions and a repaired body. All 2,329 observed direct-call helper
targets have owners. These are static Program observations, not recovered
source-level behavior.

The separate [custom diagnostic-owner pass](evidence/0.110.0/seeded-census.json) opens
the whole current PE and queries one minimum declared owner for each of the 53
custom paths. All 53 instruction/body/reference query sets complete, with
12,101 instructions, 57,469 summed body bytes, 2,536 outgoing references,
1,238 incoming references and 192 reported unresolved call sites. Independent
Capstone boundaries match all 53 owners and every selected diagnostic instruction
is present. Only 32 observed bodies equal their declared extents; the remaining
flow bodies are retained as observed rather than forced to match unwind ranges.
This bounded selection supplements the completed streaming passes; it is not
whole-body ownership or a substitute for full-image discovery.

Reproduce this selection and its independent checks with the existing Capstone
environment:

```sh
python3 -B scripts/census-current-target.py --run --full-profile full-image-diagnostic-owner-repaired --limit 53 --startup-timeout 600
python3 -B scripts/summarize-seeded-census.py --write
```

The fresh [expanded EXE-sweep pass](evidence/0.110.0/execheck-census.json) verifies
**22,455,629 instructions / 89,873,547 bytes**, 420,612 native functions,
473,918 body ranges and 3,888,726 Program references. All 418,184 function
starts and 29,355 additional code starts decode; all primary bodies are repaired.
All 2,356 direct-call helper targets have final owners. Eight helper owners
change during primary repair, so the final-owner audit is retained separately.
This leaves 5,139 call-source sites without body ownership and 782,348 Program
references sourced outside native bodies; complete destination ownership does
not resolve those source sites.
The pass applies 3,370 proved switch tables / 21,820 guarded edges, current
diagnostic code leads, two import-thunk starts, 28 PE metadata entries and
address-code leads. Input producers, immutable snapshots, launch tools and
independent verification retain their exact separate commitments.

Its inputs are under `runtime/coverage/<target-sha>/execheck-inputs/`:
`native-jump-tables.json`, `diagnostic-code-leads.json`,
`native-import-thunks.json`, `native-unwind-handlers.json` and
`native-address-code-leads.json`. Pass them through the corresponding
`census-native-image.py` options documented in [REA](../REA.md#whole-image-streaming-recovery),
with `--seed-scope all` and a fresh output directory. The summary commits the
complete plan and all exported artifacts. Existing canonical selections remain
unchanged; the 0.109.0 selector/classifier stays historical.

The expanded pass leaves **8,314,387 executable bytes unobserved**:
5,169,453 inside declared extents and 3,144,934 outside. Of those, 4,802,910
declared bytes and 51,647 outside bytes remain mixed/unclassified; the rest are
padding candidates, not proved noncode. Its 70,301 computed calls and 139,254
computed jumps retain unresolved dynamic/alias/source meaning. The preceding
operand preparation audited all 21,983,926 instructions in the integrated parent
and admitted 5,952 address-taken code candidates; it is not a post-expansion
semantic classifier. Complete current operand/alias/dispatch ownership remains
open for concrete Survivors contracts. The independently complete
linear/complement pass accounts for residual bytes without proving their role.
No historical census is selected as current proof.

All 53 custom paths have current decoded diagnostic leads. Whole-body semantic
recovery, unresolved direct/indirect and data ownership, custom source equivalence
and relevant engine deltas remain #41. The historical
[0.109.0 census](native-census-0.109.0.md) retains its actual hash and is not
promoted. Focused raw-slice Ghidra recovery for #1/#6 is separate evidence.
No game, build, source execution or parity validation is implied.
