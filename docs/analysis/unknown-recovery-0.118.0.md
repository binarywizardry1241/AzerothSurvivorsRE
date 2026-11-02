# Unknown recovery queue — 0.118.0

Selected SHA-256: `4c3c6bbac1e5ca403672109ad57cf1c84781ffe78e113ba965b8d89c6f41b6ae`.
This canonical **#41** queue binds the installed target through the
[selector proof](evidence/0.118.0/unknown-recovery.json),
[native census](native-census-0.118.0.md),
[persistent graph](coverage/as-discovery.json) and
[data manifest](evidence/0.118.0/data-classification/manifest.json).
Populations overlap and must not be added as disjoint functionality or coverage.
Run bounded native queries through durable `./scripts/rea query` plans after
reading the owning finding/report and actual local source. Generic engine
implementation stops at established AS interfaces; complete cooperative client,
networking and server source remains eligible, with no server operation.

## Exact encoded-reference and range selectors

Each input resolves through `inputs` in the selector proof to an exact
hash-bound SQLite inventory. These queries select complete recorded populations.

| Lead | Input | Exact selector | Rows | Next static action |
| --- | --- | --- | ---: | --- |
| Q41-U01 | `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | 357,933 | All declared ranges are linearly decoded; recover actual body boundaries, role and AS dependency/source ownership. |
| Q41-U02 | `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | 0 | Any undecoded suffix needs exact range recovery; an empty set does not establish reachable-code completeness. |
| Q41-U03 | `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | 337,219 | Classify every complement range and its non-padding/leaf/inline/data role; preserve candidate padding as unknown. |
| Q41-F01 | `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 82,938 | Recover computed destinations, guards, dispatch tables and relevant aliases without guessing callees. |
| Q41-F02 | `unwind-complement-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 651 | Recover complement computed transfers separately from declared-range references. |
| Q41-A01 | `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 3,839,417 | Classify every encoded direct/address/memory edge; locate ownerless destinations and AS producer/consumer connections. |
| Q41-A02 | `unwind-complement-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 14,122 | Classify complement encoded references and imported-pointer slots without promoting dynamic callee identity. |
| Q41-U04 | `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | 6,012 | Resolve decoding/flow stop boundaries; retain unobserved successors and unknown code/data roles. |

The disjoint file ledger accounts for every byte without certifying padding or
code/data meanings. Select these rows in `inputs.file-range-summary.ledger`.

| Lead | Exact selector | Ranges / bytes | Next static action |
| --- | --- | --- | --- |
| Q41-B01 | `ranges[lead_id == 'Q41-B01']` | 1 / 101,950,766 | Establish actual format/ownership through incoming/outgoing references and consumers; preserve unknown alignment/data/padding roles. |
| Q41-B02 | `ranges[lead_id == 'Q41-B02']` | 13 / 43,403,632 | Establish actual format/ownership through incoming/outgoing references and consumers; preserve unknown alignment/data/padding roles. |
| Q41-B03 | `ranges[lead_id == 'Q41-B03']` | 5 / 1,378 | Establish actual format/ownership through incoming/outgoing references and consumers; preserve unknown alignment/data/padding roles. |
| Q41-B05 | `ranges[lead_id == 'Q41-B05']` | 7 / 1,024 | Establish actual format/ownership through incoming/outgoing references and consumers; preserve unknown alignment/data/padding roles. |
| Q41-B04 | File-gap/overlay/trailer complement | 0 / 0 | This target has no file gap/overlay/trailer; other unknowns remain open. |
| Q41-R01 | `data_resources[*]` | 10 archives | Follow the [member proof](evidence/0.118.0/mpq-member-coverage.json) into native mount/locale/display/model/texture consumers. Names and table identity do not establish rendering or resource semantics. |

## Exact Ghidra and residual populations

`inputs.ghidra-census.artifact_selectors[*]` selects the same independently
verified expanded census used by current custom/source and historical-range
accounting. All requested starts decode, but **8,596,526 executable bytes across
471,937 exact ranges** remain unobserved in that Program state.

The [residual proof](evidence/0.118.0/native-residuals.json) and
`verified_classifications.residual_artifact_selectors` retain complete file/hash
commitments for the rows below. Select all rows unless an explicit filter follows.

| Lead | Exact artifact selector | Rows | Next static action |
| --- | --- | ---: | --- |
| Q41-G01:ownerless-instructions | `native-residuals.json:artifacts['ownerless-instructions.tsv.gz']` | 68,300 | Classify actual interior/inline/error/data roles through references and registrations; do not create functions from every ownerless row. |
| Q41-G01:ownerless-references | `native-residuals.json:artifacts['ownerless-reference-sources.tsv.gz']` | 804,707 | Join exact source instructions and surrounding state/dispatch to bounded AS questions; retain generic context separately. |
| Q41-A01:unowned-destinations | `native-residuals.json:artifacts['unowned-executable-destinations.tsv.gz']` | 4,836 | Recover incoming source/index/register state and callable/code-only role; an executable address is not a proved function. |
| Q41-D01 / Q41-E01 | `native-residuals.json:artifacts['diagnostic-sites.jsonl.gz']` | 18,078 | Filter AS/custom/cooperative paths separately from supporting engine context; follow Location producers/readers before assigning ownership. |

The custom/source join independently retains **55 ownerless Location records
across twelve AS paths**, plus five ownerless path-literal candidates. All sixty
known AS paths have some actual Location/body ownership; that is not whole-module
behavior or source equivalence. The residual collector's legacy
`excluded-coop-path` label groups 100 owned cooperative sites; they remain in this
queue and in current full cooperative source scope under #63. It is not an
exclusion policy or evidence of source completeness.

The [current opcode/ownership audit](coverage/native-ownership-classification.json)
separates 70,737 actual indirect calls and 11,615 indirect jumps from Ghidra trap
flow records. Initial encoded/import-slot bindings are not live callees.
The [final operand audit](coverage/native-operands-0.118.0.json) retains 674,745
static relations and 5,794 unowned executable address candidates, including 20
unobserved addresses. Select its `details.unowned_executable_address_candidates[*]`
and owning inventory rows; recover pointer writers and incoming aliases.
Complete computed-destination, callback/type and mutable-alias closure remains
open under Q41-F01/F02/M01.

## AS-specific recovery and source actions

Bare native addresses below are hexadecimal preferred PE VAs, not live addresses.

| Finding / lead | Current exact lead | Next bounded static step / source |
| --- | --- | --- |
| #98 / Q41-I01 | `save_configuration_key_lead:5` at 1472db25e, address 145b1012d; executable talentxp immediate 1400ac0d7 in handler 1400ab700 | Follow the current guarded length 8 dispatch, queued 32-byte record and Context consumer into reset/lifetime/JSON/UI semantics. [Current proof](evidence/0.118.0/talent-context-frontier.json); actual `talent_context`/terminal source first. |
| #103 / Q41-I01 | `resource_path:0`, URI 14619d6e8..14619d722, reads 140264186/4191/419c | Trace `progression::load_art` → progress-bar handle → `bar_flow`; recover actual native handle/consumer, then stop at existing image loading. |
| #104 / Q41-I01 | `resource_path:4`, URI 1461ac6ac..1461ac6e0, reads 1402dfdd2/fddd | Trace dragon handle → `achievements_sidebar::draw`; source spelling and candidate grouping do not establish native widget ownership. |
| #101 / Q41-ITEMTEXT01 | Registry 148516728..148516748, interner 145b5ca70, lookup 145b5cd10; original manifest `encoded_reference_review.selector` | Recover the ordinary opcode 0x58 guest decoder and computed mutable writer/carrier into existing `LocalItemDescriptions`. [Current blocked bridge](coop-item-registry-0.118.0.md); no invented packet/reset/merge. |
| #166 / Q41-M01 | Guest End 145b1c26f..145b1c321; started-summary 145b0f720 and account 145b154e0 | Settle cached guest state before End/loss removal in `gameplay/coop.rs`; finish exact close/host-loss caller classification and preserve recipient/idempotence. |
| #167 / Q41-M01 | Any-party 145b336df..145b336eb and event/victory evaluator 145b42b40 | Connect count≥2 admission and seven exact description keys, retaining captured lethal/current victory membership. |
| #173 / Q41-M01 | Won-history 145b15775..145b15791 | Add the independently required count-two writer gate in `gameplay/mod.rs::persist_run_at`, preserving saved history and earned dates. |
| #174 / Q41-M01 | Close wrappers 145b18980/145b18ac0 call both settlement owners | Connect full account count deltas and ordinary/cooperative feats/history for forced Menu/Again persistence, preserving existing summary/XP checkpoints. |
| #168 / Q41-M01 | Party 145b7cfc0..145b814b5, collector 145c334a0, timer 145b7e937 | Connect state 1-or-2 proximity versus state 1 progress and chooser-only hold in `Party::update_revives`; preserve radius, delta and other helpers. |
| #169 / Q41-I01 | Locale table 1475d7340..1475d7650 and fourteen payload ranges | Restore 650 missing locale values and the seven friend-description keys; inspect actual lookup/fallback/feature consumers. |
| #170 / Q41-I01 | Location-owned constructor 145b396b0, new 101-byte Hakkar descriptor | Connect exact native localization key; recover five-Warrior/lethal predicate separately before inferring changed combat eligibility. |
| #171 / Q41-M01 | Tabard helper 145aab420 and UI-card caller 140347303 | Finish Rewards callback binding and connect `tabard.<id>`/descriptor fallback in the actual row. |
| #172 / Q41-M01 | Unlock iterator 145c3e370 and collector 145c2a4e0 | Finish producer/page binding and connect typed cosmetic/tabard ID-key names in achievement detail rows. |
| Module contract findings | `exe-connections.json:systems[id=...]` | All 56 missing current contracts have individual [permanent module findings](module-contracts-0.118.0.md); inspect actual anchors, current Location owners, dispatch/state/consumer and failure boundaries. |

The [current release contracts](release-contracts-0.118.0.md),
[locale contracts](locale-catalogs-0.118.0.md) and
[AS frontier](as-discovery-0.118.0.md) own exact hashes, queries and proof limits.
#163's bounded current admission source is connected; wider server-party recovery
and network/parity evidence remain under #154/#63.

Q41-I01 selects all 2,132 `embedded_candidates.<category>[*]` occurrences and 113
descriptor/payload containers from the current data manifest. Stable graph IDs
retain category/ordinal selectors and independent reference/source relations.
Regex membership, encoded pointer/length form, a source literal or a graph edge
is not a recovered schema/type or whole AS inventory. Every container remains a
classified observation or exact pending queue entry.

All six semantic discovery stages remain partial. Every reviewed actionable AS
lead maps to a permanent finding; generic supporting unknowns stay in exact
residual populations. Compilation, client/game/network/server execution,
save/configuration effects, glyph/layout/audio behavior and controlled
original/rebuilt comparisons remain separate unrun evidence levels.
