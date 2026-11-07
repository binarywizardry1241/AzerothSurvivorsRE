# Expanded code ownership and missing-range boundaries

Permanent **#41**, target SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This report owns the complete expanded **Q41-U01/U03/B01/M01/A01** projection.
It uses the independently byte-verified
[expanded all-seed census](coverage/full-image-execheck-0.115.0.json), rather
than applying the different canonical Program's ownership totals to it.
Current implementation status remains in [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Complete populations

The [ownership proof](evidence/0.115.0/expanded-code-ownership.json) commits
the target, generator/dependencies, every consumed input and three complete
derived inventories. No sample substitutes for a selected population.

| Expanded population | Exact classification |
| --- | --- |
| 73,536 ownerless saved instructions | Exact bytes, declared-extent relationship, diagnostic context and natural/branch component membership are retained for every instruction. There are 55,858 inside declared extents and 17,678 outside. |
| 6,507 ownerless components | These are undirected fallthrough/branch components, not recovered functions. Exactly 44 components / 851 instructions have custom AS diagnostic context; all 44 contain at least one of the 60 ownerless AS diagnostic sites. The other 72,685 instructions retain unestablished ownership. |
| 790,042 ownerless reference sources | 775,329 are the **exact same source/destination/type multiset** as the canonical metadata selector. The additional 14,713 records originate at exact ownerless executable instruction boundaries. |
| 5,128 unowned executable destinations | Every destination is an exact exported ownerless instruction boundary. All 6,635 incoming encoded edges originate at ownerless instructions: 5,874 conditional and 761 unconditional jumps. No encoded edge from a saved body enters this destination set. |
| 463,115 unobserved executable ranges / 8,496,512 bytes | Every range's original byte hash, adjacent saved instruction boundaries and declared/AS-context relationships are checked. No saved encoded reference lands inside any selected missing range. This does not exclude computed, unwind, erased or runtime ingress. |

The metadata equality is checked with all triples and their multiplicities,
not equal counts. Its reused [field-role proof](native-data-classification.md)
classifies 701,424 `.pdata` fields, 73,458 standard x64 unwind-prefix fields,
425 import slots, seventeen PE-header fields, three load-configuration fields
and two load-configuration indirection slots. These remain supporting metadata.

The executable ownerless-reference partition is 6,021 conditional jumps,
5,155 calls, 3,124 unconditional jumps, 408 reads, three indirections and two
read/write records. Their encoded edges and component relationships do not
establish callees' successful execution, data schemas or AS implementation.

The older collector's broad `party.rs` label includes a shared
`benilla-ui/src/script/party.rs` path. That shared path is not used to seed
custom AS context. Only `wenilla-rogue` / `wenilla-rogue-app` paths seed the
custom-context projection. A matching declared interval still provides context,
not semantic source ownership.

## Missing-range and computed-ingress frontier

The full missing population remains **5,232,300 declared bytes** and
**3,264,212 outside-declared bytes**. NOP/CC/mixed classifications stay candidates;
no range is certified as padding or removed from the census residual.
The producer appends declared then outside-declared ranges. The consumer sorts
their actual VAs and checks disjoint boundaries before all binary-search joins
and the streaming predecessor/successor sweep.

Exactly **997 ranges / 119,531 bytes** have custom AS context in their declared
extent. Their immediate saved predecessors are 919 unconditional jumps,
68 Ghidra `COMPUTED_JUMP` observations and ten terminators. None has an adjacent
saved fallthrough instruction. Thus zero *encoded* incoming edges cannot close
these ranges: computed state and the valid discriminant domains remain relevant.

The [computed-gap proof](evidence/0.115.0/expanded-gap-dispatch.json) retains
all 68 observations separately. Exact decoding distinguishes **eight `ud2`
traps** from **sixty register jumps**. Every actual jump uses an i32 signed
relative table expression; the proof checks the load/add/target-register
relationship and preserves intervening side instructions. It records:

- 53 table-base candidates from bounded straight-line encoded values;
- seven nearest lexical RIP-LEA candidates whose incoming state remains open;
- eighteen finite machine-scalar read windows, retaining every raw signed word
  and resulting candidate address, including non-executable destinations;
- seventeen results admitted by the existing bounded-guard recovery helper,
  plus each other site's exact missing bound/base/suffix obligation.

A finite machine-scalar width is not a valid native enum domain or table length.
A lexical RIP-LEA does not prove dominance across incoming edges. The larger
read windows explicitly retain those limits; their invalid candidate addresses
are not discarded to manufacture a valid table. Existing source is not reopened
solely because the expanded Program assigns a different body boundary.

The 60-site selector includes thirteen actual jumps without a diagnostic-bearing
saved body in the preceding body-only contextual projection:
`1400a4137`, `1400b0e45`, `14010c265`, `140113990`, `140113bf0`,
`1402553a6`, `1402b1263`, `145854245`, `145931af4`, `1459439b4`,
`1459793ef`, `14597e7f4`, `1459e066f` (preferred VAs, hexadecimal).
Their exact custom diagnostic extent, native prefix, table/base/index candidates
and remaining input/domain question are retained in the computed-gap artifact.
These are bounded recovery locations, not demonstrated source defects.

Across the full image, ten missing ranges follow an observed `FALL_THROUGH`:
one twelve-byte uniform-NOP candidate and nine ranges beginning with `vaesenc`
or `vpclmulqdq`. Their exact first instructions are retained in the ownership
proof. None has custom AS declared context. Instruction-family identification
does not establish the complete algorithm, library or a missing AS interface;
generic engine/library reconstruction stops at this boundary.

## Source boundary, checks and retained evidence

The 44 AS-context ownerless components contain the previously classified
[custom diagnostic interfaces](custom-diagnostic-roles.md), including
failure tails, the stable removal/totem path and named-template substitutions.
Their expanded topology establishes no additional independent AS component or
new gameplay defect. The [indirect-transfer report](independent-indirects.md)
and exact computed-gap rows retain incoming base/index/type questions; support
contracts do not certify their surrounding successful mechanics.

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/classify-expanded-code-ownership.py
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/recover-expanded-gap-dispatch.py
```

Default mode regenerates complete deterministic projections, rehashes all inputs
and verifies equality with the curated receipts. `--write` publishes a reviewed
proposal. The full component, instruction-role and range-boundary rows remain
under ignored `runtime/analysis/history/findings/q41-expanded-ownership/6304bee20684/`; the computed-gap artifact
is retained there for the exact producer/type follow-through and later replay.
Existing source-byte-verified Ghidra exports and canonical support contracts are
reused; no new Program/import or generic engine recovery is needed for these
structural results.

This work executes no native instructions or application, compiles no code and
makes no original/rebuilt comparison. Dynamic ingress, valid enum/type domains,
complete AS producer/consumer semantics and parity remain open. Structural
classification alone does not close **#41**.
