# Unknown recovery queue — 0.139.0

Historical audited EXE: 150,595,584 bytes, SHA-256
`0e8e314df4d78ab211b1bef5c48d78d713ed64260894af342f998d298d74d274`.
[CURRENT-STATE #41](../CURRENT-STATE.md#gap-41) owns broad discovery closure;
each concrete AS feature/source question retains its permanent finding.
The [source frontier](source-frontier-0.139.0.md),
[native interfaces](native-frontier-0.139.0.md) and
[AS review](as-discovery-0.139.0.md) explain reviewed roles and limits.
Structural populations overlap and do not count missing AS features.

This report retains only that 0.139.0 target. The installed input advanced to
0.139.1 during final checks; [CURRENT-STATE](../CURRENT-STATE.md) owns the latest
selection and implementation status. The
[selected census](coverage/full-image-selected-0.139.0.json),
[machine queue](evidence/0.139.0/unknown-recovery.json) and
[residual manifest](evidence/0.139.0/native-residuals.json) retain the passed
0.139.0 native/derived/connection/unknown stages and exact selectors below.
Final AS graph-registry publication and the final current-target check were
interrupted by the changed installed hash and correctly rejected. No graph
node/edge totals or completed whole-audit certification are claimed.

## Whole-file, data and structural selectors

The current [data-classification manifest](evidence/0.139.0/data-classification/manifest.json)
retains a disjoint 26-range `file_partition` covering `[0,150595584)`.
`file_partition[lead_id == '<lead>']` selects each exact range/hash;
`Q41-B01` is executable content, `Q41-B02` nonexecutable content,
`Q41-B03` alignment tails and `Q41-B05` headers/stub/slack.
Uniform bytes and alignment candidates are not proved padding.

**Q41-R01** selects each archive in the
[registered resource chain](target-refresh-0.139.0.json) and
[MPQ member accounting](evidence/0.139.0/mpq-member-coverage.json): eleven
archives, 29,701 active slots / 29,691 names, no opaque slots or orphan blocks.
Resource membership does not establish mount order, locale, consumer meaning or
rendered equivalence. Follow an actual AS resource consumer through the existing
engine parser/loader interface; do not copy installed assets.

**Q41-I01** selects `embedded_candidates.<category>[*]` in the current whole-file
inventory and its classified records. The data manifest binds
`outputs['embedded-classification.jsonl']` (2,804 candidates) and
`outputs['string-containers.jsonl']` (119 containers). Exact
`Q41-I01:<category>:<ordinal>` selectors retain original bytes/addresses;
the [source-first review](evidence/0.139.0/source-frontier.json) assigns all 684
added occurrences without treating repeated/packed literals as independent
behaviors. Follow real readers/writers, parsers, constructors and dispatch to
prove widths, IDs, domains and lifetimes. Lua allowed-key sets such as
`runId=1` are not numeric gameplay or wire IDs.

The machine queue's committed `inputs`/`sqlite_selectors` select the current
declared and complement inventories. Preserve these stable lead identities:

| Lead / input | Exact selector | Next bounded static action |
| --- | --- | --- |
| Q41-U01 / `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | Recover a selected body's role, actual boundaries and AS dependency/source owner. |
| Q41-U02 / `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | Resolve an exact undecoded suffix if present; an empty set does not prove reachable-code closure. |
| Q41-U03 / `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | Classify leaf/inline/code/data roles from incoming/outgoing relationships; keep candidate padding unknown. |
| Q41-F01 / `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Recover guards, domains, callbacks/vtables and pointer producers for an exact selected transfer. |
| Q41-F02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Recover complement transfer and incoming register/index state separately. |
| Q41-A01 / `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Connect direct/address/memory references to actual producers/consumers and source. |
| Q41-A02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Classify complement references and pointer slots without asserting a runtime callee. |
| Q41-U04 / `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | Resolve exact stop/successor boundaries and code/data roles. |

## Native residual and reference selectors

The [selected census](coverage/full-image-selected-0.139.0.json) independently verifies
24,193,623 instructions / 96,996,463 bytes and retains 4,194,703 static references.
Its executable residual is
8,702,975 bytes / 486,144 ranges: 5,357,769 bytes inside declared extents and
3,345,206 outside. These bytes remain unclassified rather than proved padding.

The [residual manifest](evidence/0.139.0/native-residuals.json) binds all twelve
complete artifact sets. Exact populations include 94,945 ownerless instruction
records, 838,642 reference records with ownerless sources, 8,372 distinct unowned
executable destinations and 19,787 diagnostic-site records (1,324 ownerless).
Declared/complement indirect-site inventories contain 84,997 / 663 rows;
complement stops contain 5,861. These populations overlap.

The selected census's
`independent_instructions.executable_sections.range_inventory` covers every
unobserved executable range; its
`independent_instructions.unobserved_range_inventory` selects the declared
subset. Decoded-but-unclassified bytes remain semantically unknown even when
they are absent from these residuals. Each residual receipt must preserve its
actual target, payload digest and saved Program/profile commitment.

| Lead | Exact residual artifact selector | Next static action |
| --- | --- | --- |
| Q41-G01 | `artifacts['ownerless-instructions.tsv.gz']` | Recover an exact inline/error/data role and incoming/outgoing flow; do not force a function owner. |
| Q41-G01/A01 | `artifacts['ownerless-reference-sources.tsv.gz']` | Classify source roles; a data/header reference is not necessarily a missing instruction. |
| Q41-A01/A02 | `artifacts['unowned-executable-destinations.tsv.gz']` | Recover code-only/callable boundaries, incoming state and required AS interface. |
| Q41-D01 | `artifacts['diagnostic-sites.jsonl.gz']` | Reconcile Location/literal/body roles with existing classifications and source. |
| Q41-F01 | `artifacts['declared-indirect-sites.tsv.gz']` | Recover guarded domains, callback/registration slots and actual pointer writers. |
| Q41-F02 | `artifacts['complement-indirect-sites.tsv.gz']` | Resolve a selected complement transfer while retaining dynamic destination uncertainty. |
| Q41-U04 | `artifacts['complement-stops.jsonl.gz']` | Resolve exact stops and unobserved successors. |

**Q41-M01** selects exact current native operand records. Follow fixed memory,
LEA/address-taken values and slot writers to the necessary AS layout/dispatcher;
preferred VAs and encoded candidates are not observed live pointers/calls.
Direct-flow, constant-register and opcode-ownership records support **Q41-F01/F02**
without converting bounded empty results into global indirect closure.

## Applied tables and correspondence

The [switch proposal review](evidence/0.139.0/native-switch-proposal-review.json)
and [source/context review](evidence/0.139.0/switch-context-source-review.json)
bind table sites, guards, entries, target instructions and owning source seams.
All 48 reviewed AS-context tables have applied-edge proof. The selected pass
applies 3,783 tables; the final independent proposal scan reproduces the same
3,783 tables and edge digest, with zero added/changed/removed proposals and zero
undecoded proposed targets or instruction-interior conflicts. The final
source/context publication binds the selected census and exact applied/proposed
receipts. Finite guarded edges do not close all indirect aliases or meanings.

The [fourteen retained questions](evidence/0.139.0/computed-correspondence-frontier.json)
use `leads['retained-table-<original-site>']` and
`Q41-F01:correspondence:retained-table-<original-site>` selectors. Four have
unique current geometry candidates. The stable original sites remain
`1403076a2` under **#17/#73** and `145afa2a7`, `145afb3fb`, `145afb49a`,
`145afb64e`, `145afb798`, `145afb7c1`, `145afb7ed`, `145afbad2`, `145afbb29`,
`145afbb66`, `145afbb92`, `145afbe39`, `145afbed3` under **#64/#65**.
Map current selector/type producers, bounded data cells, reply/formatter
consumers and required dependencies to retained contracts. Geometry is navigation
evidence; missing current applicability is proof-only, not lost implementation.

Ten initially unmatched current CreatureQuery constituents remain explicitly
owned by [#64](../CURRENT-STATE.md#gap-64)/[#65](../CURRENT-STATE.md#gap-65):
`AS-context-table:0x145e25ac4`, `0x145e27690`, `0x145e276dd`, `0x145e278cf`,
`0x145e27a19`, `0x145e27a42`, `0x145e27a6e`, `0x145e27dfa`,
`0x145e2809d`, `0x145e28131` (each prefixed `AS-context-table:`).
The source/context review's `initially_unmatched_finding_constituents` preserves
their exact subcase keys. Its `bounded_creature_query_prefix` proves only
opcode `0x60`, the complete four-byte little-endian request prefix and related
guard inputs in owner `0x145e25130`. Recover actual row/getter/serializer and
guest decoder/cache dependencies against existing `template_entry`,
`creature_query`, query-packet and engine-packet source. These ten subcases are
distinct from all thirteen applied CreatureQuery-context tables.

## Current actionable recovery boundaries

Source/recovery actions below use exact current reviewed records, not an
inferred whole-module or whole-function classification.

| Owner / exact lead | Next static recovery and source connection |
| --- | --- |
| #75 — `Q41-NEW:meterfeed-decompiler:0x145f56de0` in [review input](evidence/0.139.0/as-discovery-reviews.json) | Diagnose the full-PE flow/guarded-table and declared-boundary context before selecting a changed durable query. Preserve successful procedure metadata and the non-retryable `Unable to find unique hash for varnode` failure. Never rerun the failed profile unchanged or invent serialization semantics. Candidate source: `gameplay/addon_meters.rs`, `gameplay/client/addon_feed.rs`, healing/provenance ledger. |
| #75 — owner `0x145f50e10`, table `0x147a1f7f8` | Recover current guarded descriptor dispatch/reached AS branches and join the exact meter Lua consumer; raw-slice pseudocode omitted the table. History, authority and reload replay remain separate. |
| #299 — owners `0x14030a950`, `0x140319c90` | Recover missing tooltip table `0x1465461f8`, subject/profile identity and the lifecycle predicate/construction interfaces; connect existing Armory/co-op profile source. |
| #300 — owners `0x140161d90`, `0x140178750` | Trace recap/killer producers, per-player history/delivery and modal actions into terminal/replication source. Existing render consumption does not prove capture/grouping. |
| #302 — registered callback `0x1402fe5a0` | Recover actual device-time acquisition, locale formatting, result lifetime and HUD/CVar/widget/VM consumers. The bounded registration owner is `0x1402fe070`; geometry owners remain context. |
| #305 — mixed owner `0x145ebdd50` | Map raw effect tag 42/subtype 10 and expiry producer to the current Flurry descriptor/source; follow cast helper `0x145f17720` only for required origin/repeat/proc contracts. Preserve Stormguard/PaperDoll publication as a separate consumer within this work item. |
| #306 — owners `0x14011dc10`, `0x145e4bdb0` | Recover typed UI snapshot/action producers, authenticated request routing, answer/roster initialization, deadline/cancel and all-ready admission into existing lobby/session/server-party source. |
| #137 — `finding_bindings[id=source-frontier-player-position]` | Recover `AZS_NativePlayerSample` rendered-pose producer and world/run/map/frame lifetime; reuse existing player/UI bridge. |
| #307 — `finding_bindings[id=source-frontier-combat-text-anchors]` | Recover native stream/anchor lifetime, target/pet/totem/source-key construction and actual post-camera callback schedule. The exact Lua and native key literals are starting points, not complete producer proof. |

The [source frontier](source-frontier-0.139.0.md) supplies exact grouped
source-first boundaries. The final
[review input](evidence/0.139.0/as-discovery-reviews.json) retains 71 attribution
bindings, 12 native-query review records, 14 pending correspondence questions
and one pending native failure; these are input populations, not published
graph node/edge or completed semantic counts. The
[individual release review](release-review-0.139.0.md) separately owns
**#301/#303/#304/#308/#309** and existing settings, companions, shields,
settlement, scaling, departure and updater constituents.
New module candidates are not established source assignments. Generic engine
and compiler/OS residuals remain supporting context unless an exact AS
dependency or unknown ownership question requires a further bounded trace.

## Retention, eligibility and verification

[Incremental correspondence](evidence/0.139.0/incremental-correspondence.json)
preserves previous source, semantics, graph/queue dispositions and stable IDs.
The historical 463-subject caller review retains its original target and does
not become a current caller census. Reconcile broad residual selectors against
those retained classifications before offering an already answered question.

Unestablished ownership can be an actionable bounded classification question.
Newest-target applicability/contract registration alone is proof-only and is
excluded from ordinary repair choices. A selected recovery must still establish
its concrete source dependency and keep native recovery, implementation,
static checks, compilation, execution and original/rebuilt parity separate.
Full co-op client/network/server source is eligible; no server, relay or lobby
service may be run. No compilation, compiling test, game/client/network/server
execution or original/rebuilt comparison was performed by this audit.
