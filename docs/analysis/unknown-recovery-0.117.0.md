# Unknown recovery queue — 0.117.0

Selected SHA-256: `507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`. This is the canonical **#41** queue for the exact installed target. [Selector proof](evidence/0.117.0/unknown-recovery.json), [native census](native-census-0.117.0.md), [candidate graph](coverage/as-discovery.json) and [data containers](evidence/0.117.0/data-classification/manifest.json) retain input/output commitments and saved progress. Counts from overlapping passes must not be added as disjoint coverage.

## Exact encoded-reference and code selectors

The `input` column resolves through `inputs` in the selector proof to a hash-bound read-only SQLite database. Every listed query is an exact population, not a sample. Run the next source-first REA/Ghidra investigation through a durable `./scripts/rea query` plan.

| Lead | Input | Exact selector | Rows | Next static action |
| --- | --- | --- | ---: | --- |
| Q41-U01 | `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | 357937 | All declared ranges are linearly decoded; recover actual body boundaries, role and AS dependency/source ownership. |
| Q41-U02 | `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | 0 | Any undecoded suffix needs exact range recovery; an empty set does not establish reachable-code completeness. |
| Q41-U03 | `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | 337219 | Classify every complement range and its non-padding/leaf/inline/data role; preserve candidate padding as unknown. |
| Q41-F01 | `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 82940 | Recover computed destinations, guards, dispatch tables and relevant aliases without guessing callees. |
| Q41-F02 | `unwind-complement-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 651 | Recover complement computed transfers separately from declared-range references. |
| Q41-A01 | `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 3839399 | Classify every encoded direct/address/memory edge; locate ownerless destinations and AS producer/consumer connections. |
| Q41-A02 | `unwind-complement-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 14122 | Classify complement encoded references and imported-pointer slots without promoting dynamic callee identity. |
| Q41-U04 | `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | 6012 | Resolve decoding/flow stop boundaries; retain unobserved successors and unknown code/data roles. |

## Whole-file and Data range leads

`file-range-summary.json` binds the complete disjoint ledger. Select the exact rows below in that committed ledger; do not treat unknown alignment or constant bytes as proved padding.

| Lead | Exact selector | Ranges / bytes | Next static action |
| --- | --- | --- | --- |
| Q41-B01 | `ranges[lead_id == 'Q41-B01']` | 1 / 101950638 | Follow incoming/outgoing references and current format roles; preserve unknown AS ownership, schema and runtime aliases. |
| Q41-B02 | `ranges[lead_id == 'Q41-B02']` | 13 / 43330024 | Follow incoming/outgoing references and current format roles; preserve unknown AS ownership, schema and runtime aliases. |
| Q41-B03 | `ranges[lead_id == 'Q41-B03']` | 5 / 1386 | Follow incoming/outgoing references and current format roles; preserve unknown AS ownership, schema and runtime aliases. |
| Q41-B05 | `ranges[lead_id == 'Q41-B05']` | 7 / 1024 | Follow incoming/outgoing references and current format roles; preserve unknown AS ownership, schema and runtime aliases. |
| Q41-B04 | `ranges[lead_id == 'Q41-B04']` | 0 / 0 | No file-gap/overlay/trailer exists in this target; other residuals remain open. |
| Q41-R01 | `data_resources[*]` | 10 archives | Use the [member proof](evidence/0.117.0/mpq-member-coverage.json); recover actual native mount/locale/display/model/texture consumers. Table/name identity is not asset semantics. |

## Named and filename-free AS frontiers

| Finding / lead | Exact selector or native lead | Candidate source and next action |
| --- | --- | --- |
| #103 | `Q41-I01:resource_path:0`, URI `0x14619d6f8`; reads `0x140264196/41a1/41ac` | `progression::load_art` → progress-bar handle → `bar_flow`; complete URI begins at `0x14619d6f4`; recover actual handle and consumer. |
| #104 | `Q41-I01:resource_path:4`, URI `0x1461ac6ac`; reads `0x1402dfdb2/fdbd` | `progression::load_art` → dragon handle → `achievements_sidebar::draw`; current consumer proof remains missing. |
| #98 | `Q41-I01:save_configuration_key_lead:5`, bytes `0x1472da5ae`, address lead `0x145b1013d` | Existing terminal/talent-context source is first context; establish this occurrence's actual domain/producer/consumer before calling it a save field. |
| #108–#121 | [Individual release rows](release-review-0.117.0.md), exact per-item ranges in `release-review.json` | Recover only each recorded missing AS contract; preserve separate summaries and informational acknowledgement. |
| #156 | Current class-slot owner `145ac20b0..145ac2250`, earned-key gate `145b4a9f0..145b4ab76`, and 90025 descriptors | Class-appearance admission is recovered and source-corrected; purchased 90025 rejection is intentional. Distinct #160 purchase normalization is also source-corrected. See [bounded proof and consumers](tabard-admission-0.117.0.md); actual Save/rendering/multiplayer execution and parity remain unverified. |
| #157 | Constructor `[0x145b3f980,0x145b45d51)` plus all fourteen `coop:*` keys | Trace host kill/victory, eligible party, all recipients, received grant and dated/idempotent save writers. Current actual writer/replication selector is unidentified. |
| #159 | Current Look body `0x14031b280`, context `0x140249b50`, input `0x140248e60`, starter getter `0x145ab5910` and projector `0x145ac28d0` | [Starting clothes repair](starting-clothes-0.117.0.md) connects distinct baseline/Hidden/Worn actions, exact starter admission and localized Showing. Selected source/static work is complete; actual UI/save/rendering/parity remain open. |
| Module contract findings | `exe-connections.json:systems[id=...]` for all missing contracts in the [module table](module-contracts-0.117.0.md) | Inspect listed actual source anchors, then recover current Location owner/dispatch/state/consumer interfaces. Missing evidence is not a missing-code finding. |

The current #119 [follow-up](white-devilsaur-0.117.0.md) supersedes the nearby
Water Elemental candidate with exact White descriptors 9530/9531, independent
Hunter flag, achievement mask, codec/spec writeback and effect transformation.
Its remaining constructor ingress/grid, complete save and downstream pet actors
are exact selected recovery tasks. The #158 [catalog delta](locale-catalogs-0.117.0.md)
adds fifty English source entries; native table-index/fallback/loader consumers
remain separate. Bounded module contracts do not close these feature findings.

## Verified expanded native selectors

The selector proof's `inputs.ghidra-census.artifact_selectors[*]` binds the same
expanded census used by the current historical-range and AS connection audits.
Select all rows from its body, reference and instruction exports; exact residual
selectors cover **8,596,577 executable bytes across 471,940 ranges**. The current
diagnostic partition retains sixty ownerless custom sites across fourteen
paths; Location references and path-literal candidates remain separate rows.
The [ownership inventory](coverage/native-ownership-classification.json) keeps
encoded references, body boundaries and unknown owners without semantic promotion.
The declared operand audit remains an expanded-plan input. The separate
[final expanded audit](coverage/native-operands-0.117.0.json) retains all 674,740
explicit static relations, including 5,794 unowned executable address candidates
(5,774 exact decoded starts and twenty unobserved addresses). Follow their exact
`unowned_executable_address_candidates[*]` detail selectors through incoming
state and pointer writers. Neither population establishes live aliases or callees.

## Data, descriptors and indirect ownership

Q41-I01 selects every `embedded_candidates.<category>[*]` row from the current whole-file inventory, with stable `Q41-I01:<category>:<ordinal>` graph IDs. The data manifest retains all 2,132 candidates and separate descriptor/payload containers. Source literals, XML byte matches and encoded pointer/length forms are candidates, not recovered native types or callback ownership. Every container has its own pending queue entry; a descriptor reference is not transferred to an interior candidate as a direct consumer.

Q41-D01 selects `diagnostics[custom_game_crate == true]`; Q41-E01 selects the engine/shared complement. Exact sites are `diagnostics[*].verified_references[*]` in the committed diagnostic inventory. Join actual body ownership before assigning a function; retain ownerless interior/data sites. Generic engine/compiler roles stop at the established source boundary unless a concrete AS dependency remains.

Q41-G01 owns full-image native collection and independently verified exports. Q41-M01 retains AS source producer/consumer closure, computed register/index/receiver aliases, callbacks, state lifetimes, numeric IDs and mixed schemas. Current census/expanded proof populations are owned by the [native report](native-census-0.117.0.md); historical classifications are not copied to this hash.

Every unresolved reviewed AS lead has its own finding or a stable existing issue. The graph also preserves unreviewed exact residual selectors without inventing gameplay bugs. Complete frontier exhaustion, dynamic dispatch, original/rebuilt comparisons and semantic completeness remain unproved. All six semantic discovery stages remain partial.

Compilation, actual client/game/network/server operation, save/configuration mutation and controlled original/rebuilt parity are separate, unrun evidence levels. Full co-op source is eligible for selected repair; this queue does not authorize a server run.
