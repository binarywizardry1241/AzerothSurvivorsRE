# Unknown recovery queue — 0.120.4

Selected installed EXE SHA-256: `7e3e3f9558de1d87e615592c7b5d83f00de393ac8efa4e67d8f9b634ed07d6bf`. This is **#41**'s current
queue, bound by [exact selector proof](evidence/0.120.4/unknown-recovery.json),
[native census](native-census-0.120.4.md), [data join](evidence/0.120.4/data-classification/manifest.json),
[persistent graph](coverage/as-discovery.json) and [incremental correspondence](evidence/0.120.4/incremental-correspondence.json).
Populations overlap; no count below measures missing AS code or parity.

Read the owning report and actual local benilla/reconstruction source first. Use
journaled `./scripts/rea query` plans and shared compatible Programs/results; stop
established generic engine/codec/I/O branches at their source interfaces. Cooperative
source is in scope; do not operate a game server, relay or directory service.

## Full range and reference selectors

Each SQL selector applies to the exact read-only inventory at
`unknown-recovery.json:inputs[<input>].inventory`.

| Lead / input | Exact selector | Records | Next static action |
| --- | --- | ---: | --- |
| Q41-U01 / `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | 358,210 | All declared ranges are linearly decoded; recover actual body boundaries, role and AS dependency/source ownership. |
| Q41-U02 / `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | 0 | Any undecoded suffix needs exact range recovery; an empty set does not establish reachable-code completeness. |
| Q41-U03 / `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | 337,482 | Classify every complement range and its non-padding/leaf/inline/data role; preserve candidate padding as unknown. |
| Q41-F01 / `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 82,965 | Recover computed destinations, guards, dispatch tables and relevant aliases without guessing callees. |
| Q41-F02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 652 | Recover complement computed transfers separately from declared-range references. |
| Q41-A01 / `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 3,843,468 | Classify every encoded direct/address/memory edge; locate ownerless destinations and AS producer/consumer connections. |
| Q41-A02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 14,135 | Classify complement encoded references and imported-pointer slots without promoting dynamic callee identity. |
| Q41-U04 / `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | 6,019 | Resolve decoding/flow stop boundaries; retain unobserved successors and unknown code/data roles. |

`file_range_groups[*].selector` selects the complete disjoint ledger over
`[0, 145489408)`: headers, mapped sections, alignment, gaps and trailers.
Structural coverage does not establish semantics or padding. Q41-R01 selects
`data_resources[*]` and the ten-MPQ [member proof](evidence/0.120.4/mpq-member-coverage.json);
recover actual mount/patch/locale/lifetime and world/model/texture consumers.
Q41-I01 selects each `embedded_candidate_selectors.<category>` and the data manifest's
outputs; recover bounds, widths, parsers, producers, consumers and numeric meanings.
Literal/regex candidates are not an exhaustive AS data inventory.

The selected Ghidra artifacts remain bound by
`inputs.ghidra-census.artifact_selectors` and the [residual proof](evidence/0.120.4/native-residuals.json).
They retain **90,575 ownerless instruction records**,
**809,207 references with ownerless sources**
and **7,955 distinct unowned executable
destinations** across static reference roles. These overlap and are not unexplained-AS counts.

| Lead / exact residual selector | Next static action |
| --- | --- |
| Q41-G01 / `native-residuals.json:artifacts[ownerless-instructions.tsv.gz]` and `[ownerless-reference-sources.tsv.gz]` | Recover actual interior/inline/error/data roles through incoming/outgoing flow; do not force function ownership. |
| Q41-A01 / `artifacts[unowned-executable-destinations.tsv.gz]` | Recover incoming state, callable/code-only roles and required AS source interfaces. |
| Q41-D01 / `artifacts[diagnostic-sites.jsonl.gz]` | Reconcile exact Location/literal/body roles and retained classifications before treating a site as a new AS unknown. |
| Q41-F01/F02 / `artifacts[declared-indirect-sites.tsv.gz]` and `[complement-indirect-sites.tsv.gz]` | Recover guards/domains, callbacks, registrations, aliases and actual pointer producers; encoded destinations are not observed runtime calls. |
| Q41-M01 / current operand inventory and native ownership record | Follow fixed expressions, initial slots and readers/writers into a concrete AS interface, stopping established source dependencies. |

## Findings and retained bounded questions

The [release review](release-review-0.120.4.md) keeps all fifteen supplied items separate
as **#194–#196 and #202–#213**. Current confirmed source dimensions are:

| Finding / current native lead | Actual source / next static recovery |
| --- | --- |
| #163 / admission `145b25d7e..145b25db8` | Shared `server_party::GAME_VERSION` and fixed Join fixture retain 0.120.2; current native exact gate is 0.120.4/protocol5. Recover relevant admission dependencies before the separately selected correction. |
| #198 / pending bound `145c62b04` | `coop/relay.rs::MAX_PENDING_BYTES` retains 4 MiB against native 16 MiB. Trace overflow/liveness consumers and preserve the broader prior relay repair. |
| #208 / service cases `145c5dbb2`, `145c5dc63` and helper `145c65470` | `coop_directory.rs` Hosted/Joined currently attach handles without native inner/map/flag reset. Recover outside-slice deque helper `145c73070` and close/admission transitions before exact implementation. |
| #210 / sender `145c62120`, selected gates `145c622e2..145c6232e` | `Relay::send_pending` budgets all payloads; native budgets replay-prefix traffic. Recover replay-boundary producers/reset and scheduling before connecting fresh-send behavior. |
| #211 / receiver `145c61910`, branch `145c61e7c..145c61e91` | `Relay::receive` is strict-next-only; native admits forward gaps when control-pending is clear. Recover control/reset, ACK clamp and delivery dependencies. |
| #212 / ACK pump gate `145c5fe35`, constant `146199f20` | `Relay::poll` retains 0.5 seconds against native 2.0 seconds. Recover shared clock/control-priority and send ownership before correction. |

Selected note summaries/reconnect/pause/timeout/chat/frame/teardown obligations retain
their individual next steps in that release table. The current bounded module contracts
resolve only #154/#197's registration dimension, not complete source repair or behavior.
Each of the 60 missing module-contract dimensions retains its own finding and exact
`exe-connections.json:systems[id=<id>]` selector in the [module register](module-contracts-0.120.4.md).
Missing current proof is not absent implementation and these proof-only dimensions are
excluded from ordinary gameplay-repair choices.

The [current literal/reference frontier](evidence/0.120.4/as-discovery-frontier.json)
retains these existing identities:

| Stable finding / selector | Current candidate / actual source | Next static action |
| --- | --- | --- |
| #103 / `Q41-I01:resource_path:0` | `0x14617d578`; progression::load_art -> Art.progress_bar -> bar_flow | Trace exact current URI reads through producer, asset handle and live progression-bar consumer; stop at existing image-loading interface. |
| #104 / `Q41-I01:resource_path:4` | `0x1461c2334`; progression::load_art -> Art.dragon -> achievements_sidebar::draw | Trace exact URI and native handle to sidebar draw; preserve separate rendering/parity evidence. |
| #98 / `Q41-I01:save_configuration_key_lead:5` | `0x1472f1476`; talent_context::Context::accept/request/Snapshot::read; gameplay::client::events::receive_coop -> terminal::queue_talent | Trace exact literal/address site through request production, dispatch, queued Value and terminal/save consumers; do not infer save format or numeric semantics from spelling. |
| #98 / `Q41-I01:save_configuration_key_lead:0` | `0x140279997`; talent_context::Context::accept -> TerminalState pending request drain | Apply exact current guarded tables in full-PE Ghidra and recover incoming resource/context lifecycle, record type/drop/map interfaces and terminal projection; retain historical talent-XP source repair separately. |

The executable `talentxp` byte pattern remains an immediate/domain question, not proof
of a save key or type solely from spelling. #101's historical ordinary decoder/query/
receive/cache source and its bounded .2 interner/lookup/reserve findings remain retained;
no alternative guest writer/carrier was established. Follow a concrete new mutable or
computed producer/carrier and revalidate its current applicability, without repeating
resolved ordinary decoding or inventing a protocol/ID policy. #201's prior entry-prefix
source repair likewise remains retained with current applicability separate.

The fourteen prior table questions, nine helper classifications and 77 bounded review
identities remain preserved by incremental correspondence. Six changed current table
shapes have exact [service](evidence/0.120.4/guarded-service-classification.json) and
[batch-error](evidence/0.120.4/batch-error-table-context.json) dispositions: existing
#208/#212 pump operations or supporting cleanup/I/O interfaces. New addresses/geometry
alone neither erase old semantic recovery nor create a new AS bug. Wider mutable aliases,
unnamed/mixed roles and the full current dependency frontier remain open.

The current graph has 10,221 nodes / 56,691 edges,
2,509 pending entries and 11 current query-supported scopes
(nine release plus two supporting scopes). The separate batch region has no new Ghidra
query. All six discovery stages remain partial. No compilation, actual client/game/
network/server operation, installed-input mutation or original/rebuilt comparison occurred.

## Exact retained AS table correspondence

The final switch rescan retains 1,100 additional table proposals with 6,808 distinct
proposed targets: 582 are current Ghidra instruction starts, 6,226 are unobserved and
none is an instruction interior. These proposals remain unapplied and do not supply
new census edges or prove dispatch/type semantics. All fourteen AS-context proposal
rows map uniquely to retained questions by full guarded geometry; the
[current correspondence proof](evidence/0.120.4/computed-correspondence-frontier.json)
binds their original classified proof, exact current table bytes and source receipts.
No unmapped current AS-context row or independent new AS question was established.

| Stable selector | Existing findings | Current dispatch / table | Preserved role and next static work |
| --- | --- | --- | --- |
| `Q41-F01:correspondence:retained-table-1403076a2` | #17/#73 | `0x1402e1b02` / `0x1461c4330` | Retained Codex growth selector; current producer/Details consumer applicability pending. |
| `Q41-F01:correspondence:retained-table-145afa2a7` | #64/#65 | `0x145b03ae7` / `0x1472f25dc` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afb3fb` | #64/#65 | `0x145b04c22` / `0x1472f279c` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afb49a` | #64/#65 | `0x145b04cc1` / `0x1472f2914` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afb64e` | #64/#65 | `0x145b04e75` / `0x1472f2ae8` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afb798` | #64/#65 | `0x145b04fbf` / `0x1472f2c7c` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afb7c1` | #64/#65 | `0x145b04fe8` / `0x1472f296c` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afb7ed` | #64/#65 | `0x145b05014` / `0x1472f2df8` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afbad2` | #64/#65 | `0x145b0530f` / `0x1472f2e50` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afbb29` | #64/#65 | `0x145b05337` / `0x1472f315c` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afbb66` | #64/#65 | `0x145b05374` / `0x1472f2e28` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afbb92` | #64/#65 | `0x145b053a0` / `0x1472f32d8` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afbe39` | #64/#65 | `0x145b05647` / `0x1472f3450` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |
| `Q41-F01:correspondence:retained-table-145afbed3` | #64/#65 | `0x145b056e1` / `0x1472f32ec` | Retained finite CreatureQuery metadata classification; current entry/selector/reply dependency applicability pending. |

Revalidate the current input/selector/data/consumer dependencies against those retained
contracts, rather than reconstructing their already recovered meanings from zero.
Matching geometry alone does not admit a current semantic/source contract, establish
arbitrary aliases or certify application behavior/parity.
