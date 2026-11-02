# Native discovery census — 0.139.0

Selected installed EXE SHA-256:
`0e8e314df4d78ab211b1bef5c48d78d713ed64260894af342f998d298d74d274`.
This is a historical 0.139.0 census. The installed 0.139.1 input requires its own refresh; current status belongs to [CURRENT-STATE](../CURRENT-STATE.md). Configured installed EXE/Data were read in place. Structural scans, native
observations, recovered behavior, source connection and parity are independent.

## Complete input and independent inventories

The whole-file PE inventory accounts for 150,595,584 bytes, six sections,
371,108 declared extents, 430 imports and 643,479 nonpadding relocations.
The disjoint 26-range file ledger has zero overlap/omission. All 837 diagnostic
paths include 77 AS modules. Every added candidate is in the
[source-first frontier](source-frontier-0.139.0.md).

Linear decoding covers all 371,108 extents: 24,780,848 instructions /
100,340,730 union bytes, zero undecoded suffix. The separate complement covers
5,358,708 bytes / 350,075 regions; 2,839 distinct incoming seeds yield 77,442
candidate instructions / 331,888 bytes. Candidate padding/linear decoding are
not reachable-code or semantic proof. Eleven unchanged MPQs retain current
member accounting separately from resource loading/meaning.

## Saved full-image Ghidra passes

The [declared pass](coverage/full-image-declared-0.139.0.json) independently
verifies 23,311,110 instructions / 93,186,700 bytes, 373,602 functions,
432,788 body ranges and 4,017,655 references. All 371,108 requested repairs
complete. Its separate unobserved executable population is 12,512,738 bytes.

The initial [expanded pass](coverage/full-image-execheck-0.139.0.json) extends the same
saved current-target Program with declared/diagnostic/complement, guarded-table,
address-code, import and unwind inputs. For that initial expansion, compatible
disassembly is reused but `unresolved-thunk-boundary-dependency` forces conservative full
body repair. No skipped-body-work or end-to-end speedup is claimed for that pass.

| Independently verified selected observation | Result |
| --- | ---: |
| Instructions / instruction bytes | 24,193,623 / 96,996,463 |
| Functions / actual body ranges | 446,677 / 503,290 |
| Static references / external locations | 4,194,703 / 430 |
| Computed-call / computed-jump records | 72,803 / 144,966 |
| Unobserved executable bytes | 8,702,975 |

The selected [final pass](coverage/full-image-selected-0.139.0.json) applies all 3,783 recovered guarded tables in the same Program while preserving all 444,074 function-seed records. Its immediate expansion reused 444,073 body entries and repaired one affected entry. Earlier [expanded edge review](coverage/full-image-final-0.139.0.json) and [closure pass](coverage/full-image-closure-0.139.0.json) retain actual input lineage. The final scan reproduces the same 3,783 tables and edge digest, with zero added/changed/removed proposals or undecoded proposed targets. These are finite static edges, not complete indirect semantics. All 48 AS-context tables remain applied, while fourteen historical correspondence questions retain their separate pending meanings.

Every exported instruction matches original bytes and independent boundaries.
Exact executable residuals are selected by
`independent_instructions.executable_sections.range_inventory`; declared-only
residuals use `independent_instructions.unobserved_range_inventory`. Overlapping
operand/reference/ownerless populations are not missing-AS counts.

## Bounded recovery and remaining frontier

The [current native interface review](native-frontier-0.139.0.md) binds exact
source-first raw subjects, parent PE ranges, plans/journals, provider profiles,
results and scoped interpretations. Raw slices omit surrounding data/callees;
original Win64 instructions control arguments, not generic decompiler signatures.
Mixed update functions keep AS regions separate from supporting generic context.
The meter producer's deterministic decompiler failure is explicit, with successful
procedure metadata and actual failed operation preserved; no output is invented.

The main API, separate meter API and PaperDoll extracts retain exact Lua bytes.
Their native serialization, injection, scheduling, ID/lifetime and source
consumers remain independent obligations. Current switch proposals and retained
indirect questions keep exact applied/merely-proposed states; geometry does not
transfer historical semantics. [AS discovery](as-discovery-0.139.0.md),
[connection ledger](coverage/exe-connections.json),
[module dimensions](module-contracts-0.139.0.md) and
[unknown queue](unknown-recovery-0.139.0.md) own the remaining selectors.

The first new-target declared pass took 1,066.72 seconds; its independent
verifier took 206.95 seconds. The expanded collector took 319.01 seconds.
These are stage wall times; independent readers overlap and must not be summed
as whole-audit elapsed time. This is a cold new-target audit with compatible
within-target Program reuse, not a measured warm whole-audit benchmark. The
shared audit journal retains subsequent phase timings, cache outcomes and
failures without changing evidence identity.

All six global semantic discovery stages remain partial. Prior contracts,
source and classifications retain actual provenance; no current byte/name
match erases prior work or proves complete applicability. Compilation, compiling
tests, client/game/network/server operation and original/rebuilt comparisons
were not performed. Parity remains unverified.
