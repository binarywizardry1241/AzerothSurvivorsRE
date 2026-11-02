# Native discovery census — 0.121.0

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The configured EXE and eleven MPQs were read in place without modification or
application execution. Whole-file accounting, linear decoding, Ghidra bodies,
static references, recovered contracts, source implementation and parity are
separate evidence populations. [CURRENT-STATE](../CURRENT-STATE.md#gap-41) and
the [unknown queue](unknown-recovery-0.121.0.md) own the remaining work.

## Whole-file and independent linear scans

The [complete PE inventory](coverage/native-summary.json) records
**146,088,960 bytes**, six sections, **358,683 declared unwind extents**,
**102,316,206 executable virtual bytes**, 425 imports, zero exports and
637,274 nonpadding relocations. All 763 diagnostic paths include **63 AS**
paths and 700 engine/other paths. Three AS paths are new: `heroic.rs`,
`game/affixes.rs` and `sets.rs`; `mods.rs` and `realmd.rs` are absent from the
current diagnostic population. Path presence/absence does not establish
semantic ownership or erase earlier recovery/source.

The [26-range disjoint ledger](coverage/file-range-summary.json) covers
`[0, 146088960)` without overlap or omission. Headers, mapped sections,
alignment and unexplained contents retain exact selectors and semantic unknowns.
Candidate padding is not proved noncode.

The [Capstone 5.0.7 declared inventory](coverage/instruction-summary.json)
decodes all **358,683 extents** into **23,960,726 instruction records /
97,054,528 union bytes**, with zero undecoded suffix. The separate
[executable complement](coverage/unwind-complement-summary.json) accounts for
**5,261,678 bytes / 338,114 regions**. Its 2,853 seed addresses yield
80,341 candidate instructions / 347,443 union bytes. These linear observations
do not establish actual flow bodies, reachable-code completeness or semantics.

All eleven configured MPQs have [member accounting](evidence/0.121.0/mpq-member-coverage.json):
29,701 active hash slots and 29,691 names, with no opaque slots or orphan blocks.
The 318 resource-path candidates and unchanged 16,665-byte addon API remain
discovery inputs. [#246's resource delta](evidence/0.121.0/resource-delta.json)
owns the new `patch-B.MPQ` texture's unresolved consumer.
[#248's separate model-resolution receipt](evidence/0.121.0/resource-consumer-9612.json)
starts from Orb query metadata and establishes no DUST2B link. An inventory or
query display descriptor does not prove successful model loading/rendering.

## Durable Ghidra collection and independent verification

The [declared pass](coverage/full-image-declared-0.121.0.json) verifies
**22,534,888 instructions / 90,118,463 exact bytes**, **361,197 functions**,
419,398 actual body ranges and 3,886,054 static references. All 358,683 requested
entries have decoded starts and repaired bodies. Its separate residual is
12,197,743 unobserved executable bytes / 402,055 ranges: 7,220,505 bytes inside
declared extents and 4,977,238 outside. These are declared-pass observations,
not the expanded pass's final counts.

The [expanded pass](coverage/full-image-execheck-0.121.0.json) extends the same
saved current-target Program. It conservatively repairs all requested bodies:
`incremental_census.reuse_mode` is `full`, with reason
`unresolved-thunk-boundary-dependency`. Same-Program extension does not mean
all earlier bodies were reused. Exact producer/input commitments and durable
checkpoints remain retained; timing/cache measurements remain outside evidence
identities under ignored `runtime/analysis/pipeline/`.

The expanded queue contains **430,854 requested entry repairs plus 24,001
additional code starts**. Its frozen inputs include **2,572 guarded tables**,
1,355 diagnostic leads, 8,018 admitted address-code leads, two import-thunk
entries and 28 unwind/PE metadata entries. These overlapping input populations
are not additive function counts. All **17,032 admitted guarded edges** are
applied; every requested entry/body repair and additional code start completes.

| Independently verified expanded observation | Result |
| --- | ---: |
| Instructions / exact instruction bytes | 23,364,860 / 93,699,034 |
| Ghidra functions / actual body ranges | 433,477 / 490,400 |
| Static references / external locations | 4,046,360 / 425 |
| Computed call / jump-flow records | 71,042 / 142,364 |
| Unobserved executable bytes / ranges | 8,617,172 / 473,494 |

Independent original-byte and Capstone checks verify every exported instruction.
The remaining executable partition contains **5,276,919 bytes inside declared
extents** and **3,340,253 outside**. Its exact selector is
`independent_instructions.executable_sections.range_inventory`; the declared
subset is `independent_instructions.unobserved_range_inventory`. Unobserved
bytes and candidate padding are not automatically AS code or missing source.

The [current atomic selection](coverage/native-image-current.json) binds this
expanded census, its actual applied guarded-table proof, current ownership and
historical-range ledger. Proposal-only successors remain separate from the
selected census's applied edge digest.

## Complete residual and explicit-reference populations

The [residual proof](evidence/0.121.0/native-residuals.json) binds twelve complete
artifact sets to this exact census and the independent linear/complement inputs.
It retains **91,724 ownerless instruction records**, **810,330 references with
ownerless sources** and **8,048 distinct unowned executable destinations**.
Exact selectors are `artifacts[ownerless-instructions.tsv.gz]`,
`[ownerless-reference-sources.tsv.gz]` and
`[unowned-executable-destinations.tsv.gz]`. Header/data reference sources do not
automatically imply missing executable instructions.

All **18,122 diagnostic reference records** replay on exact current exported
instruction boundaries. **1,222** lack actual body owners, including **60**
records with AS diagnostic context. `artifacts[diagnostic-sites.jsonl.gz]`
retains exact path/Location/site/body state. The legacy `excluded-coop-path`
label covers 116 owned records; it excludes no cooperative client/network/server
source from current recovery. These overlapping raw populations differ from the
connection ledger's narrower Location/source projection.

The [same-census operand audit](evidence/0.121.0/native-operands.json) retains
**676,285 static expressions**: 495,757 address expressions and 180,528 fixed
memory operands. **10,249** lack source body owners. Executable destination
candidates contain **5,834 exact starts and 20 unobserved targets**, with no
instruction-interior conflicts. Address expressions do not acquire implied
READ/WRITE/CALL meanings or prove live pointer values.

The [direct-flow/producer audit](evidence/0.121.0/native-dispatch.json) retains
**5,738 unowned direct-flow destinations**, all exact instruction starts, and
complete computed-jump producer observations within its stated block rules.
The [constant-register audit](evidence/0.121.0/native-constant-dispatch.json)
finds no additional target within its no-memory domain. Neither result closes
mutable-slot, incoming register/index, callback/vtable or runtime alias questions.

[Opcode/source classification](coverage/native-ownership-classification.json)
separately records **70,819 actual indirect CALLs and 11,649 indirect JMPs**.
These opcode populations differ from Ghidra computed-flow tags and overlap
linear/residual inventories; Ghidra's computed-flow tags also include trap
instructions. The exact `artifact` JSONL retains each site's
body, resolution basis and remaining reason. Thirteen absent generic-engine
source candidates remain supporting context. Available benilla source and
ancestry do not identify the EXE's compiled revision or prove equivalence;
native expansion stops at established AS interface boundaries.

## Applied edges, unapplied proposals and retained questions

The [switch proposal review](evidence/0.121.0/native-switch-proposal-review.json)
retains **3,680 proposed tables**, including **1,108 additions** beyond applied
inputs, with no changed applied case vectors or removed proposals. The additions
contain **6,865 distinct target candidates**: 583 exact instruction starts,
6,282 unobserved targets and zero instruction-interior conflicts. These
unapplied proposals add no edges to the selected census.

All 45 current AS-context tables, including 31 applied and 14 unapplied,
have [source/context review](evidence/0.121.0/switch-context-source-review.json).
The [generic geometry assessment](evidence/0.121.0/computed-correspondence-frontier.json)
maps six of fourteen retained questions and leaves eight without an exact
geometry match. A separate [reviewed changed-interface assessment](evidence/0.121.0/reviewed-switch-correspondence.json)
maps one of those eight through the proved opcode-96/9500-based CreatureQuery
interface, whose domain changes from 112 to 113 cells. Thus seven retained
questions have current candidates and seven remain wholly unmapped. Generic
geometry counts remain six/eight; no byte/shape match promotes wider semantics.
[#247](../verification-needed.md#gap-247) owns the new 9612 query cell, and
[#249](../verification-needed.md#gap-249) owns the separately widened 37-cell selector.

[Incremental correspondence](evidence/0.121.0/incremental-correspondence.json)
preserves **93 historical review records** with original targets, query/source
receipts and classifications. These overlap in behavior and are not additive
features. Pending current producer/dependency/consumer correspondence does not
erase that recovery or its source repairs.

The [historical-range assessment](coverage/historical-range-revalidation.json)
retains 19,901 commitments and 1,266 unique exact byte-match candidates. These
candidate locations provide navigation; they do not establish current semantic,
producer/dependency/consumer or runtime equivalence.

## Bounded current contracts and validation limits

[Heroic recovery](heroic-native-0.121.0.md) binds three current queries, exact
rank-name/domain and affix-selector helpers plus a state-input callsite:
174 selector cases and 16 label/bounds cases pass. The
[Orb query proof](evidence/0.121.0/orb-query/manifest.json) separately binds the
current 9612 name/type/rank/display constructor arguments; 32 synthetic cases
pass. Weekly seed origin, actual affix combat behavior, source implementation,
wire serialization and full gameplay consumers remain outside those bounds.

| AS-only module measure | Current result |
| --- | ---: |
| Known modules with partial reconstructed source | 95.2% — 60/63 |
| Modules with registered current-target bounded recovery contracts | 3.2% — 2/63 |

The [connection ledger](coverage/exe-connections.json) owns the denominator and
retains 55 ownerless native Location references across twelve AS paths. That
Location/source projection differs from the broader diagnostic-context set.
Only Heroic and server-party qualify through the named bounded scopes. The
[module register](module-contracts-0.121.0.md) links each missing dimension to
its individual permanent finding: source absence for the three new owners is
[#240](../verification-needed.md#gap-240), [#241](../verification-needed.md#gap-241) and
[#242](../verification-needed.md#gap-242); current Heroic registration is bounded
under [#243](../verification-needed.md#gap-243), while affix/set registration remains
[#244](../verification-needed.md#gap-244) and [#245](../verification-needed.md#gap-245).
Earlier module contracts keep their
historical proof and separate current applicability. These are module counts,
not percentages of AS code decompiled, implemented or matched.

The [unknown queue](unknown-recovery-0.121.0.md) retains precise residual,
producer/consumer, resource and correspondence questions, including each of
the 22 supplied release findings #218–#239. All six AS discovery stages remain
partial within their recorded bounds. No application compilation, compiling
test, client/game/network/server operation, installed save/settings mutation or
controlled original/rebuilt comparison occurred. Actual source execution,
complete reconstruction and parity remain unverified.
