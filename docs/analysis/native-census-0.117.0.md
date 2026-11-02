# Native discovery census — 0.117.0

Target SHA-256: `507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
The configured installed EXE is a read-only analysis input. This report records
static discovery and exact evidence boundaries; #41 remains open. The historical
0.115.0 census and its source contracts retain their original target identity.

## Complete file and linear inventories

The whole-file PE scan covers all **145,283,072 bytes**, six sections,
357,937 declared AMD64 unwind extents, 425 imports, 637,214 nonpadding relocation
records and 761 diagnostic paths (60 custom / 701 engine or other). Its disjoint
file ledger assigns every byte once across 26 intervals, without omissions or
overlaps; it retains 1,386 raw alignment-tail bytes, 200 DOS-stub bytes and
256 header-slack bytes as explicit unknowns. Structural coverage does not prove
semantic recovery or padding. The configured Data chain has ten registered files;
resource semantics are accounted for separately.

The independent Capstone 5.0.7 declared-extent linear pass completes all
**357,937 extents: 23,887,583 instruction records / 96,704,046 union bytes**,
with zero undecoded suffix. It retains 72,567 indirect calls, 10,373 indirect
jumps and the other encoded-reference classes. Declared starts and linear
instructions do not establish function ownership or reachability.

The complement pass accounts for all **5,246,592** executable bytes outside
those extents across 337,219 mapped intervals. Its 2,844 unique seed addresses
produce 80,530 instruction candidates / 348,817 decoded union bytes. The disjoint
residual partition retains 2,322,813 mixed bytes, 944,739 uniform CC candidates,
11,194 uniform NOP candidates and 1,619,029 canonical padding-sequence candidates.
None is certified padding. These observations overlap the Ghidra census and
must not be added to its totals.

The current diagnostic inventory contains 761 paths; its 18,076 verified
instruction-reference leads touch 601 paths, including all 60 custom paths. Its selected 6,148 candidate
extents contain 1,897,628 decoded instructions. Rust source-location references
are ownership leads, not complete behavioral contracts.

## Persistent whole-image Ghidra census

The fresh declared-entry pass uses the full installed PE and all 357,937 current
unwind-entry starts. Automatic analysis is disabled and the heap cap is 6 GiB.
The target/profile-bound Program, plan, original input commitments and per-batch
saved cursor live under:

`runtime/coverage/507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293/ghidra/declared/`.

The [independently verified declared census](coverage/full-image-declared-0.117.0.json)
completes every requested start plus direct-call helper closure. Reopening its
saved Program preserves generation 714 and reuses all five hash-verified exports.
Capstone 5.0.7 independently checks every instruction's exact installed bytes and
boundary. Automatic analysis remains disabled; counts describe this saved
Program state, not reachable code or semantic reconstruction.

| Declared observation | Verified result |
| --- | ---: |
| Exported instructions / exact source bytes | 22,464,930 / 89,790,508 |
| Native functions / actual body ranges | 360,444 / 418,090 |
| Static reference records / external locations | 3,873,706 / 425 |
| Direct-call helper targets / created helper functions | 2,517 / 2,501 |
| Requested starts lacking instructions / functions | 0 / 0 |
| Computed calls / jumps | 68,068 / 136,797 |
| Unobserved executable bytes / exact ranges | 12,160,130 / 400,603 |

The executable residual comprises 7,199,826 bytes inside declared extents and
4,960,304 outside. Exact ranges, byte hashes and mixed/NOP/CC candidate classes
are retained in `missing-executable-ranges.tsv.gz`; the declared subset also has
its own inventory. Padding remains unproved. Of the exported references,
3,082,182 sources have actual body owners and 791,524 do not; this does not
resolve runtime callees, aliases or incoming semantic roles.

All 18,076 diagnostic reference sites retain their exact current instruction
leads. Body reconciliation leaves 1,348 sites ownerless, including 112 custom
sites across eighteen paths; `coop/route.rs` is the only custom path with verified
sites and no observed owner. These exact observations belong to this census;
classification from the historical target is not transferred.

The former selected compact census is preserved at
[evidence/0.115.0/refresh-baseline/full-image-census.json](evidence/0.115.0/refresh-baseline/full-image-census.json).
Historical semantic classifiers are not promoted by target registration or by
new instruction counts.

## Expanded all-seed census

The fresh expanded pass selects **430,099 entry starts**, comprising the complete
current declared queue and unowned complement/relocation-pointer/PE-entry leads.
The relocation audit finds 136,724 distinct executable pointer targets, including
71,975 without declared-census body owners. Its separate target/profile-bound
Program lives under `ghidra/execheck-2026-10-25/` in the same target directory.
It uses 4,096-entry saved batches and a 6-GiB heap, with automatic analysis off.

All inputs come from the independently verified current declared census and
current decoder/diagnostic inventories. The [input witness](evidence/0.117.0/execheck-native-inputs.json)
keeps each original producer/source commitment separate from current launcher
commitments. The expanded plan snapshots every full proof and compact summary;
subsequent exploratory proposals cannot replace those applied inputs.

| Fresh input | Exact selected population |
| --- | ---: |
| Admitted guarded tables / case entries / unique target addresses | 2,573 / 52,553 / 16,782 |
| Exact undecoded diagnostic code starts | 1,348 |
| Exact LEA-derived code-only starts | 7,963 |
| Import-thunk LEA sources / callable entries | 3 / 2 |
| Distinct unwind/PE-directory entries | 28 |

The complete explicit-operand audit inspects all 22,464,930 declared-census
instructions, retaining 583,951 encoded static relations (426,656 address
expressions / 157,295 fixed-memory operands). Register/index/segment-dependent
relations remain unknown. Address-code starts prove exact source bytes and
coherent target decoding without inventing callable ownership, callback type or
runtime edges. Table successors preserve their bounded fallthrough conditions.

The [independently verified expanded census](coverage/full-image-execheck-0.117.0.json)
completes all 430,099 requested entries and 23,905 additional code-only starts.
Those additional starts comprise 16,782 guarded-table targets, 1,347 net
diagnostic starts and 5,776 net address-code starts after overlap removal.
Every requested entry has instructions and an actual repaired flow body; every
additional code start has instructions. Reopening the saved Program preserves
generation 229 and reuses all five verified exports. Capstone independently
checks every exported instruction's exact installed bytes and boundary.

| Expanded observation | Verified result |
| --- | ---: |
| Exported instructions / exact source bytes | 23,291,285 / 93,354,061 |
| Native functions / actual body ranges | 432,715 / 488,722 |
| Static reference records / external locations | 4,033,352 / 425 |
| Direct-call helper targets / created helper functions | 2,554 / 2,538 |
| Requested starts lacking instructions / functions | 0 / 0 |
| Additional code starts lacking instructions | 0 |
| Computed calls / jumps | 70,963 / 142,162 |
| Applied guarded tables / distinct bounded static edges | 2,573 / 17,003 |
| Unobserved executable bytes / exact ranges | 8,596,577 / 471,940 |

The expanded executable residual comprises 5,268,613 bytes inside declared
extents and 3,327,964 outside. Its exact ranges, byte hashes and candidate kinds
are retained in the expanded `missing-executable-ranges.tsv.gz`. Mixed, NOP and
CC classifications do not establish semantic roles or padding. Expanded
ownership is a separate population: 3,228,635 references have source body owners
and 804,717 do not; 4,389 call-source sites lack owners. Static call destinations
have owners, without resolving computed runtime destinations or aliases.

The diagnostic projection retains 1,216 ownerless sites, including sixty custom
sites across fourteen paths. Every custom path now has at least one observed
body owner, including `coop/route.rs`; this is partial native ownership rather
than recovered whole-system behavior or source equivalence. Current ownership
classifiers, AS source connections and exact recovery selectors belong to the
separate [unknown queue](unknown-recovery-0.117.0.md) and connection reports.

The applied jump proof has edge digest
`f80cdc945d988a16c94b6a96f02af8f475f9d671840d84a75abbdd1eb58a3241`.
The canonical jump summary is the exact applied snapshot, not a later proposal.
The former canonical jump summary actually targets 0.109.0 and is retained at
[evidence/0.109.0/refresh-baseline/native-jump-tables.json](evidence/0.109.0/refresh-baseline/native-jump-tables.json).
The declared summary/pointer remains immutable because the expanded seed plan
binds its exact bytes. Expanded observations remain distinct from the declared
population and all historical semantic classifiers. Neither decoded-byte totals
nor an enriched seed queue establish complete AS producer/consumer closure.

Both saved plans resume with `scripts/census-native-image.py --resume --output`
and their respective retained Program directories. The [REA reproduction guide](../REA.md#whole-image-streaming-recovery)
explains the profile/input guards and independent summary checks. Changed tools
or inputs require a new profile rather than relabeling this execution.

## Validation limits

The census input-snapshot/body-interval guards and the guarded-table,
address-code, import-thunk and unwind-entry admission suites pass **48
non-compiling Python tests**. Those synthetic regressions check the analysis
tools, not original-game behavior or source equivalence.

No application compilation, compiling tests, game/network execution, server
operation, original/rebuilt comparison, semantic completeness or parity is
claimed. Instruction, function, reference and module populations are separate.
Unresolved AS producers/consumers, computed targets, aliases, types, data meanings,
residual bytes and required controlled comparisons remain explicit under #41.
