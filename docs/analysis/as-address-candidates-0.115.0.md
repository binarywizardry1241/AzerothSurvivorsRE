# Direct AS-context address candidates — 0.115.0

Target: installed 0.115.0 EXE, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The complete address inventory contains five code-only candidates whose source
owner has direct AS diagnostic context. Their [compact proof](evidence/0.115.0/as-address-candidates.json)
binds that exact selection, current original code/constants, source expression
and native cases. No source defect was found in this bounded comparison.

| Candidate | Exact source LEA | Classification |
| --- | --- | --- |
| `140006ea0` | `14012fca3`, owner `14012f990` | Atomic reference-count release thunk |
| `14005b390` | `14008177e`, owner `14007f800` | Data/count forwarding thunk in a formatting argument path |
| `14008c5e0` | `1401320d2`, owner `14012f990` | Vector buffer deallocation thunk |
| `145985db0` | `14594e2b3`, owner `14594df00` | Ordinary enemy HP polynomial for nonzero definition flag `+4c` |
| `145985e00` | `14594e2ba`, owner `14594df00` | Ordinary enemy HP polynomial for zero definition flag `+4c` |

Diagnostic paths provide context for these source owners. They do not establish
complete function/source equivalence or make every helper a distinct AS feature.

## Enemy HP helpers and current caller

The two 69-byte helpers preserve the expression in
[health_polynomial](../../crates/azeroth-survivors-re/src/enemies/scaling.rs):

```text
linear = f32(f32(0.1 * minutes) + 1)
quadratic = f32(f32(0.036 * minutes) * minutes)
partial = f32(quadratic + linear)
cubic = f32(f32(coefficient * minutes) * minutes)
cubic = f32(minutes * cubic)
health_scale = f32(f32(cubic + partial) * zone_difficulty)
```

The current constants have exact f32 bits `3dcccccd`, `3f800000`,
`3d1374bc`, and either `3bc2a455` for the nonzero flag or `3be6afcd` for
zero. The original separate `MULSS`/`ADDSS` order matches the reviewed source
expression. No alternate generic curve was substituted.

Current ordinary constructor `14594df00..14594e874` loads clock seconds from
Game`+b9c`, divides by 60, and tests definition byte`+4c` against zero at
`14594e261`. Its two LEAs and `CMOVNE` at `14594e2c1` select the actual helper
called through RCX at `14594e301`. The helper receives minutes in XMM0 and
`zone+e0 * Game+c14` in XMM1. The caller then multiplies its result by
definition base HP`+30` times 4.8 for nonzero flags or 4.95 for zero. This agrees
with the source's initial HP product and nonzero-flag selection.

The bounded replay executes 330 original helper cases and 324 current caller
cases. Flags 0, 1, 2, 3, 128 and 255 check that the native selection uses the
whole byte; clocks, zone scalars, independent difficulty and base HP vary.
Every finite result matches an independent scalar-f32 transcription of the
reviewed, hash-bound source expression. The original selected helper runs
normally inside the caller replay, with no arithmetic or call host seam.

The caller replay stops immediately after the helper/base-HP product at
`14594e308`. Subsequent late-zone, endless, percentage and entity-publication
behavior is static consumer context, not replayed current parity. The broader
[historical scaling evidence](runmods-scaling-0.109.0.md) keeps its actual
0.109.0 provenance.

## UI-context support thunks

`140006ea0..140006eaf` reads a pointer from RCX and atomically decrements its
count. A zero result tails to `14581fb30`; a retained reference returns. Its
source LEA is stored as a callback at descriptor`+1c8` before the descriptor is
passed to `140028eb0`. This is lifetime support in an AS-context owner, not a
new touch interaction contract.

`14008c5e0..14008c5fd` returns for a zero buffer count at object`+18`.
Otherwise it loads object`+20` as the allocation pointer, multiplies the count
by 16, supplies alignment 8 and tails to shared deallocation at `1400021d0`.
Its source likewise stores the callback at descriptor`+1c8` before the same
shared descriptor consumer. No additional AS UI behavior follows from it.

`14005b390..14005b3a3` forwards incoming RDX to R8, loads a pointed object's
data/count pair at `+8/+10` into RCX/RDX, and tails to `145cfa240`. Its source
stores this callback in an argument record passed to `145ce7350`. The direct
diagnostic context includes Discord and meter paths, but the candidate itself
only supplies the shared argument forwarding contract.

Five original-instruction support cases checked count-release branches,
zero/nonzero vector deallocation and forwarded registers. They stop at the
encoded shared callee; its destructor, allocator or formatter implementation
was not recovered as part of this scope.

## Reproduce and limits

With existing Capstone 5 and Unicorn Python dependencies available:

```sh
python3 -B scripts/check-as-address-candidates.py
```

The checker reselects all five candidates from the complete committed
inventories, verifies current raw bytes and coefficients, executes the native
cases and compares the retained proof and case artifact. Fresh extraction uses
`--write --proof runtime/<new-proof>.json`; outputs remain inside the checkout.

The source expression was reviewed and transcribed, not compiled or executed.
No Ghidra session, application/game launch, full enemy/UI recovery or
original/rebuilt comparison was performed. These results establish the selected
current helper/caller contracts and classify the three support thunks; they do
not close #41, prove generic source semantics or establish gameplay parity.
