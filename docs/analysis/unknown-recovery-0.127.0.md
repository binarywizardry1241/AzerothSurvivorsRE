# Unknown recovery queue — 0.127.0

Selected installed EXE SHA-256:
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [verified census](coverage/full-image-execheck-0.127.0.json),
[machine queue](evidence/0.127.0/unknown-recovery.json),
[candidate graph](coverage/as-discovery.json) and
[connection ledger](coverage/exe-connections.json) bind the selectors below.
[CURRENT-STATE #41](../CURRENT-STATE.md#gap-41) owns broad native closure;
actionable AS feature and source questions retain their own permanent findings.
These populations overlap and do not count missing AS features.

<a id="whole-file-and-data-range-leads"></a>

## Complete structural selectors

Each SQL row selects its exact current inventory through the machine queue's
`inputs` and `sqlite_selectors` receipts. Structural/linear coverage is complete;
body ownership, role, AS dependencies and semantics remain separate.

| Lead / input | Exact selector | Records | Next static action |
| --- | --- | ---: | --- |
| Q41-U01 / `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | 359,575 | Recover actual body boundaries, role and AS dependency/source ownership. |
| Q41-U02 / `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | 0 | Recover any future undecoded suffix at its exact range; this empty set does not prove reachable-code completeness. |
| Q41-U03 / `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | 338,915 | Classify complement leaf/inline/code/data roles; preserve candidate padding as unknown. |
| Q41-F01 / `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 83,111 | Recover destination guards, selector domains, callbacks and pointer producers. |
| Q41-F02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 650 | Recover complement transfers and their incoming state separately. |
| Q41-A01 / `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 3,867,804 | Classify direct/address/memory edges and actual AS producer/consumer connections. |
| Q41-A02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 14,192 | Classify complement references and pointer slots without promoting dynamic callee identity. |
| Q41-U04 / `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | 6,055 | Resolve exact stop/successor boundaries and code/data roles. |

The disjoint file ledger covers all **146,721,280 bytes / 26 ranges** with no
overlap or omissions. Exact groups are `file_range_groups` and
`ranges[lead_id == '<lead>']` in the selected file-range inventory:

| Lead | Bytes | Remaining classification |
| --- | ---: | --- |
| Q41-B01 | 102,793,566 | Executable section contents; decoded bytes do not establish semantics. |
| Q41-B02 | 43,925,508 | Nonexecutable section contents, tables, resources, metadata and unknown data. |
| Q41-B03 | 1,182 | Raw alignment tails; uniform bytes are not proved padding. |
| Q41-B05 | 1,024 | Seven header/stub/slack ranges; preserve unexplained contents. |

**Q41-R01** selects each `data_resources[*]` archive and its exact hash. All
eleven configured MPQs have [member accounting](evidence/0.127.0/mpq-member-coverage.json):
29,701 active slots / 29,691 names, no opaque slots or orphan blocks. Archive
membership does not establish AS mount/locale/resource consumer semantics.
Recover those consumers against existing engine interfaces without copying assets.

**Q41-I01** selects `embedded_candidates.<category>[*]`: 946 namespace, 379
binding, 341 Lua/UI-registration, two textual-ID, six save/configuration,
316 resource-path and 193 Lua-function occurrences. The
[data classification](evidence/0.127.0/data-classification/manifest.json)
binds `outputs['embedded-classification.jsonl']` (2,183 rows) and
`outputs['string-containers.jsonl']` (117 rows), including actual reference,
relocation, source-literal and container observations. Follow readers/writers,
parsers and dispatch to prove widths, domains, layouts and lifetimes. Regex
candidates, namespace labels and matching literals are not exhaustive data or
ownership proof. The [source frontier](source-frontier-0.127.0.md) gives all
63 added candidate occurrences their source/context review and finding ownership.

## Native residual, ownerless and indirect populations

The expanded saved full-image pass independently verifies **23,463,701
instructions / 94,144,917 bytes**. Its residual is **8,648,649 executable bytes /
474,558 ranges**: 5,302,274 bytes inside declared extents and 3,346,375 outside.
The complete selector is
`independent_instructions.executable_sections.range_inventory`; the declared
subset is `independent_instructions.unobserved_range_inventory`. Their receipts
bind exact runtime paths and hashes. Candidate NOP/CC contents remain unclassified.

The [residual proof](evidence/0.127.0/native-residuals.json) binds twelve complete
artifact sets. Each key below selects `artifacts['<name>']`, including path,
SHA-256 and row count; retain the actual payload while its recovery consumer exists.

| Lead / artifact | Rows | Next static action |
| --- | ---: | --- |
| Q41-G01 / `ownerless-instructions.tsv.gz` | 91,497 | Recover inline/error/data roles and incoming/outgoing flow without forcing function ownership. |
| Q41-G01/A01 / `ownerless-reference-sources.tsv.gz` | 812,212 | Classify source roles; a data/header reference is not necessarily a missing instruction. |
| Q41-A01/A02 / `unowned-executable-destinations.tsv.gz` | 8,098 | Recover callable/code-only roles, incoming state and actual AS interfaces. |
| Q41-D01 / `diagnostic-sites.jsonl.gz` | 18,158 | Reconcile Location/literal/body roles with retained classifications. |
| Q41-F01 / `declared-indirect-sites.tsv.gz` | 83,111 | Recover guarded domains, registration/callback/vtable and pointer producers. |
| Q41-F02 / `complement-indirect-sites.tsv.gz` | 650 | Recover complement transfers; retain dynamic destination uncertainty. |
| Q41-U04 / `complement-stops.jsonl.gz` | 6,055 | Resolve exact stops and unobserved successors. |

The diagnostic projection has 1,224 ownerless records, 61 with AS context.
The connection ledger's genuine Location/source projection is separately
55 references across 12 paths. Historical `excluded-coop-path` labels describe
an old collector population; cooperative client/network/server source is in scope.

**Q41-M01** selects [native operands](evidence/0.127.0/native-operands.json).
Trace explicit addresses/memory expressions to AS layouts and slot writers.
**Q41-F01/F02** also select the
[direct-flow](evidence/0.127.0/native-dispatch.json),
[constant-register](evidence/0.127.0/native-constant-dispatch.json) and
[opcode ownership](coverage/native-ownership-classification.json) records.
Actual indirect opcodes are 70,869 CALLs and 11,663 JMPs; Ghidra's 71,092
computed-call and 142,756 computed-jump tags are a different population.
Prove aliases, incoming types and necessary AS dependencies; encoded candidates
are not observed calls. An empty bounded constant-register result does not close
the global indirect frontier.

## Applied tables and retained correspondence

The [switch proposal review](evidence/0.127.0/native-switch-proposal-review.json)
keeps **2,587 applied tables / 17,131 applied edges** distinct from 3,694
proposals. The 1,107 additional proposals have 6,848 distinct targets:
584 exact instruction starts, 6,264 undecoded candidates and no interior conflicts.
Proposal-only edges are not applied proof. The
[source/context review](evidence/0.127.0/switch-context-source-review.json)
accounts for all 46 AS-context tables: 32 applied and 14 proposal-only.

The [fourteen stable correspondence questions](evidence/0.127.0/computed-correspondence-frontier.json)
retain `leads['retained-table-<original-site>']` and
`Q41-F01:correspondence:retained-table-<original-site>` selectors. Six have unique
current geometry candidates; eight lack that mapping. The stable original sites
are `1403076a2` under #17/#73 and `145afa2a7`, `145afb3fb`, `145afb49a`,
`145afb64e`, `145afb798`, `145afb7c1`, `145afb7ed`, `145afbad2`, `145afbb29`,
`145afbb66`, `145afbb92`, `145afbe39`, `145afbed3` under #64/#65.
Map current selector/type producers, bounded data cells, reply/formatter consumers
and affected dependencies to the retained Codex/CreatureQuery contracts. Geometry
is navigation evidence; unmapped applicability does not erase recovered semantics
or implementation.

The eight current dispatch constituents have no predecessor AS-context geometry
candidate. Their stable selectors remain `AS-context-table:<site>` in the
[source/context review](evidence/0.127.0/switch-context-source-review.json).
The following dispositions preserve those exact questions; a bounded role is
separate from complete module semantics.

| Current site / finding | Bounded current disposition and remaining limit |
| --- | --- |
| `0x140352e9a` / [#73](../CURRENT-STATE.md#gap-73) | [Growth-text proof](codex-growth-dispatch-0.120.2.md): actual jewelry rows select six existing text families and detail consumer; no source omission found. Wider Codex applicability is separate. |
| `0x145bb6640` / [#63](../CURRENT-STATE.md#gap-63) | [Co-op proof](coop-dispatch-0.127.0.md): local request 22..27 producers and refresh/host/join/leave/kick/chat consumers; local discriminants are distinct from wire tags. |
| `0x145bd6353` / #63 | Native niche/discriminator, decoded-message producer and actual joined/admission/engine/control/chat/RTT consumers are bounded by the same proof. Unrelated complete driver semantics remain unclaimed. |
| `0x145bd679a` / #63 | The compressed variant 19 path retains its original selector in R12 and returns after its owned storage was consumed; this is a cleanup alias, not 22 new messages. |
| `0x145bd7007` / #63 | Ordinary exit preserves the same niche selector and owned-payload cleanup roles. Generic destructors stop at that interface. |
| `0x145c5aac0` / [#294](../verification-needed.md#gap-294) | [Mark proof](mograine-marks-0.127.0.md): actual record producer, guarded shared-hazard dispatch and selected Mark/circle consumers are bound. No claim that all 32 table entries are32 recovered hazards. |
| `0x145cb7c68` / [#198](../verification-needed.md#gap-198) | [Typed service proof](coop-dispatch-0.127.0.md): all 13 local event/result branches map to current wire 21..33; native 0 / wire 20 takes the unsigned default. This is separate from reliableRelay's five tags. |
| `0x145ccfe36` / [#85](../CURRENT-STATE.md#gap-85) | Existing zone catalog/resolve/fallback interface is present. Exact current row/consumer applicability is proof-only correspondence, with no established missing behavior; it is excluded from ordinary repair choices. |

Stop generic allocation, destructor, I/O and engine internals at their established
AS interface unless a concrete unresolved AS contract requires another trace.

## Current feature recovery and source actions

The [individual release review](release-review-0.127.0.md) preserves all 58 supplied
claims and their stable owners. Current EXE-bound source repairs and exact
non-compiling checks retain their owning reports and the
[verification register](../verification-needed.md); they are not queued again
merely because gameplay/parity remains unverified. This includes the delivered
achievement, gear, control/navigation, shield/shout/leech, rescue/level cap,
addon/totem, terrain/size, on-top, amulet confirmation, ItemQuery and
[cooperative lobby/staff/Kick scopes](../verification-needed.md#gap-291).

| Remaining finding/boundary | Exact source or recovery action |
| --- | --- |
| [#293](../CURRENT-STATE.md#gap-293) | The Unicode/name/font and IME commit/focus/filter/order/caret sources are connected. Visible Preedit/composing-Enter and browser resource/source consumers require a proved native consumer/artifact; do not invent inline composition behavior. |
| [#257](../CURRENT-STATE.md#gap-257) | External deployed-service claims lack the required service artifact/source identity. The client relay/service boundary is implemented; do not infer server internals from client behavior or operate a service to fill the record. |

The historical smoothing, choice, catalog and other module contracts remain
available in their owning reports. Pending newest-target correspondence alone
is excluded from repair choices. #297's existing Armory oval is likewise a
geometry/applicability question without a demonstrated missing implementation.

## Module dimensions, retained knowledge and limits

The [module register](module-contracts-0.127.0.md) links each exact system selector
to its permanent missing-dimension finding and next static action:

| AS-only module measure | Current result |
| --- | ---: |
| Known modules with partial reconstructed source | 100.0% — 69/69 |
| Modules with registered current-target bounded recovery contracts | 30.4% — 21/69 |

IME, on-top and message modules now have bounded partial source assignments.
Each contract registration qualifies only its exact owner scope. No complete
module or parity is certified. Other current-contract dimensions retain their
individual links in the module register; these counts do not measure AS code
decompiled, implemented or matched. Pending applicability is separate from
missing implementation and ordinary fixgap choices.

[Incremental correspondence](evidence/0.127.0/incremental-correspondence.json)
preserves prior module assessments, graph/queue/reviews, classifications and
repairs with their original targets. The saved 463-subject caller review now accounts for416 bounded interfaces and47 retained
contracts across897 incoming references. Its exact unresolved semantic/alias
boundaries and the fourteen historical indirect questions retain their actual target. Reuse completed
proof and query only affected or unresolved inputs, dispatch, layouts/values and
producer/dependency/consumer connections. Current exact byte or geometry matches
alone do not transfer behavior, source equivalence or runtime proof.

Whole-file PE/diagnostic/declared/complement/resource scans and both saved native
passes complete their structural populations. **All six global semantic discovery
stages remain partial**; [AS discovery](as-discovery-0.127.0.md) records each
stage's reviewed population and remaining boundary. Generic engine/compiler/OS
context remains supporting uncertainty once its AS interface is established.
No application compilation, compiling tests, client/game/network/server operation
or original/rebuilt comparison occurred. Native recovery, source implementation,
static checks, execution and parity remain distinct evidence levels.
