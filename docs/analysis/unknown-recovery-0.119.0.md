# Unknown recovery queue — 0.119.0

Historical registered 0.119.0 SHA-256:
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This canonical **#41** queue links the [exact selector proof](evidence/0.119.0/unknown-recovery.json),
[current native census](native-census-0.119.0.md),
[data manifest](evidence/0.119.0/data-classification/manifest.json) and
[persistent graph/queue](coverage/as-discovery.json). Each input/artifact resolves
through those manifests to its actual path, digest and complete population.
Overlapping decoder, reference, graph and module populations cannot be added as
functional coverage.

This queue retains the **0.119.0** hash above. The installed target has advanced
to registered **0.119.1**; [its current queue](unknown-recovery-0.119.1.md) owns
newer-target applicability and recovery. No historical selector or semantic
classification is promoted merely by registration.

Read the owning finding/report and actual local source before recovery. Use
journaled `./scripts/rea query` plans and retain unfinished results/Programs.
Reuse available benilla interfaces and stop generic branches at the established
AS boundary. Cooperative client, networking and server source remains in scope;
no server, relay or directory service may be run. Preferred PE addresses below
are static addresses, not observed live pointers.

## Complete range and reference selectors

The following SQL addresses the hash-bound SQLite inputs selected by
`unknown-recovery.json:inputs`; select all rows unless a filter is stated.
Every row remains a classification or dependency question, including rows with
no established AS ownership. An empty undecoded set does not certify reachable
code, semantics or source completeness.

| Lead / input | Exact selector | Next static action |
| --- | --- | --- |
| Q41-U01 / `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | Recover actual body/interior/inline roles and the AS dependency/source boundary of each relevant declared range. |
| Q41-U02 / `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | Resolve any undecoded suffix; preserve unknown reachability and ownership when this set is empty. |
| Q41-U03 / `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | Classify every executable complement range through its references and consumers. Uniform CC/NOP/alignment labels remain candidates. |
| Q41-U04 / `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | Recover unresolved flow/decoding boundaries and distinguish code, embedded data and terminal/error paths. |
| Q41-F01 / `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Prove computed targets from guards, incoming registers/indices, callback registrations and pointer writers. |
| Q41-F02 / `unwind-complement-summary` | The same indirect-reference SQL | Recover complement dispatch and aliases separately from declared-range records. |
| Q41-A01 / `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Follow direct calls, address formation and memory reads/writes into bounded AS producer/consumer questions. |
| Q41-A02 / `unwind-complement-summary` | The same non-indirect-reference SQL | Classify complement/address/import-slot references without treating encoded pointers as live callees. |
| Q41-B01–B05 / `file-range-summary.ledger` | `ranges[lead_id == '<lead>']` | Classify the exact disjoint header/section/gap/alignment ranges. The file ledger accounts for bytes without proving padding or data meanings. |
| Q41-R01 / resource inputs | `data_resources[*]` and [member proof](evidence/0.119.0/mpq-member-coverage.json) | Recover native mount/locale/resource lifetime and actual model/texture/world consumers. All ten MPQs retain 29,699 active slots and 29,690 names; names/table equality do not prove rendering. |
| Q41-I01 / embedded data | `embedded_candidates.<category>[*]` in the selected data manifest and its immutable JSONL outputs | Follow every exact payload, descriptor and ID candidate through actual constructors/parsers/readers/writers; recover field widths, bounds and consumers before naming a schema. |

Q41-B04 has no file-gap/overlay/trailer range in this image; the other header,
section, alignment and semantic unknowns remain open.

`inputs.ghidra-census.artifact_selectors[*]` in the selector proof selects the
same independently verified census as the current connection ledger. Its saved
Program/export observations remain separate from complete linear decoding.
`verified_classifications.residual_artifact_selectors` binds the exact compressed
residual populations. The [residual proof](evidence/0.119.0/native-residuals.json)
retains these additional actions:

| Lead / exact artifact selector | Next static action |
| --- | --- |
| Q41-G01 / `artifacts['ownerless-instructions.tsv.gz']` | Classify actual interior/inline/error/data roles through incoming/outgoing references and registration; do not create a function for every ownerless instruction. |
| Q41-G01 / `artifacts['ownerless-reference-sources.tsv.gz']` | Join each exact source site to its instruction and surrounding state/dispatch before assigning an AS interface. |
| Q41-A01 / `artifacts['unowned-executable-destinations.tsv.gz']` | Recover incoming register/index state and callable versus code-only role; an executable address alone is not a function. |
| Q41-D01 / `artifacts['diagnostic-sites.jsonl.gz']` | Distinguish owned and ownerless Location sites from path literals, then trace the relevant AS state/consumer. |
| Q41-M01 / current ownership and operand proofs selected by `verified_classifications` | Recover callbacks, vtables, queued events, mutable slot writers and data/ID/type meanings. Computed-flow records, actual CALL/JMP opcodes, initial pointer values and proved semantic edges remain distinct. |

Historical collector labels containing `excluded-coop` are population labels,
not current exclusions. Their cooperative source and unresolved native contracts
remain in this queue. Generic engine/compiler/OS residuals remain supporting
context unless a concrete AS ownership or dependency question is identified.

## Completed bounded classifications and remaining source questions

The [site-role proof](as-ownerless-sites-0.119.0.md) resolves the complete 60-site
AS diagnostic projection and 788 decoded ownerless instructions in 49 runs.
Fifty-three sites are terminal failure routes, two enter returning removal
helpers, and five read explicit-length adjacent tokens rather than filenames.
The existing totem/card source paths do not become missing implementations
from body-ownership residuals. Original Program observations remain unchanged.

The [computed/reference proof](computed-source-frontier-0.119.0.md) retains all
113 AS-body-context sites (six known loader interfaces, 78 table expressions
and 29 receiver/writer questions). Its complete 4,033,389-reference join finds
zero selected AS-body edges to the 4,836 unowned executable destinations; erased,
inline and other ownership populations remain separate. Ten party-control
actions have existing source counterparts; no selector domain is invented.

A distinct retained 0.119.0 frontier contains 143 mixed Ghidra-unobserved ranges
across 35 AS-Location contexts. Its exact selector is
`runtime/q41-unobserved-as-0.119.0/frontier.json`; the adjacent durable query
journal preserves 17 completed queries, one interrupted query and 15 unstarted
queries. These outputs do not establish semantic closure. Several full-PE
pseudocodes crossed unrelated or out-of-extent code; their inferred bodies
and enum types are not accepted as behavior. Further recovery remains separate
from gameplay/runtime checks and is not promoted to 0.119.1.

## Exact current AS frontiers and source actions

The [frontier proof](evidence/0.119.0/as-discovery-frontier.json) binds current
literal ranges and complete selected encoded-reference populations without
promoting the historical semantic contracts. The separate
[item-registry frontier](evidence/0.119.0/item-registry-frontier.json) is retained
as an explicitly pending native graph/queue entry.

| Finding / exact current selector | Actual source and next static step |
| --- | --- |
| #98 / `Q41-I01:save_configuration_key_lead:5` | `talentxp` at `0x1472db26e`, with one current address-forming reference. Trace the producer/queued Value through `talent_context::request`, dispatch, active `Context` and terminal/save consumers. Do not infer numeric schema or lifecycle from the spelling. |
| #98 / `Q41-I01:save_configuration_key_lead:0` | Executable immediate at `0x1400ac137`. Re-establish its full current type/length guard, dispatch table and incoming context/resource lifetime in full-PE Ghidra; the existing `Context::accept`/terminal source is available. |
| #103 / `Q41-I01:resource_path:0` | URI at `0x14619d6d8`, three current encoded reads. Recover producer → asset handle → `progression::bar_flow`; stop at the existing image-loading interface. |
| #104 / `Q41-I01:resource_path:4` | URI at `0x1461ac65c`, two current reads. Recover the actual native dragon handle → sidebar consumer before assigning equivalence to `achievements_sidebar::draw`. |
| #101 / `Q41-ITEMTEXT01:owner:0x145b5cb20-0x145b5cd22` | [Current follow-up](coop-item-registry-0.119.0.md) establishes interning/lookup semantics, the actual opcode `0x58` decoder/helpers, query/Engine delivery, cache and observed reserve alias. Thirty selected encoded references and 204 bounded decoder cases pass; these routes do not insert guest effect text. The initial [candidate proof](evidence/0.119.0/item-registry-frontier.json) and audit graph retain their original observation scope. **Blocked:** no concrete alternative guest registry producer/carrier or computed/mutable writer site has been established. A new bounded query needs that specific lead; do not repeat the ordinary decoder or invent packet, ID-remap, reset or merge policies. Source repair and rendering/parity remain open. |
| #180 / `Q41-F01` / `Q41-M01`, predicate `0x145ae0ce0..0x145ae0e04`, table `0x1472da60c..0x1472dab30` | [Source/static repair](guest-engine-admission-0.119.0.md) resolves all 329 computed cells into the exact 75-opcode/65,533-byte policy and connects guest synchronization/receiving-port gates before observation and queueing. 262,144 predicate and 2,625 receiver cases pass. The selected boundary has no identified remaining source omission; actual session/client delivery and parity remain unverified. Broader F/M selectors and #101 remain open. |
| #181 / `Q41-I01:resource_path:219` / `Q41-B02` / `Q41-R01`, patcher `0x145b44190..0x145b443c1` | [Source/static repair](run-level-cap-0.119.0.md) connects the exact ReputationFrame cap99 suffix through the existing core loader before addons on each VM. Current bootstrap/value/resource/query proof,12 native cases and400 stock Lua assertions pass. No further selected source omission is identified; actual UI/addon/runtime/parity remain unverified. |
| #182 / `Q41-I01:resource_path:221` / `Q41-B02` / `Q41-R01` | [0.119.0 source/static repair](creature-death-sound-0.119.0.md) connects the exact WDBC field6 kit8449→0 replacement through the shared raw-table input, parser/catalog and existing death-bark consumer. 505 native cases passed before target drift. Actual audio/client execution and parity remain unverified; no newer-target equivalence is claimed. |
| #163 / `COOPADMISSION01:protocol-version:0x145b1b2de-0x145b1b318` | [Source/static repair](coop-handshake-0.119.0.md) connects protocol 5/seven-byte `0.119.0` through the shared outgoing/incoming constant and fixed wire fixture. No selected source operation remains; broader packet, recipient and lifecycle contracts are separate. Interoperability and parity are unverified. |
| #175 / supplied Druid summary | Its independent clauses #176/#177 have source/static repairs; #178 owns grouped publication. The [release review](release-review-0.119.0.md) links their bounded evidence. This summary adds no separate executable contract or pending source operation. |
| #176 / `druid-release/manifest.json:native_spans[role=tranquility-pulse-and-critical]` and `[role=proc-kind-three-gate]` | [Source/static repair](tranquility-0.119.0.md) connects one live critical/RNG draw per victim, multiplier and attribution while preserving source-kind 3 suppression. 388 bounded instruction cases pass. No further selected source omission is identified; gameplay/log presentation and parity remain unverified. |
| #177 / `rejuvenation/manifest.json` and reused `druid-release/manifest.json` | [Source/static repair](rejuvenation-0.119.0.md) connects caster GUID/refresh, exact current descriptor inputs, raw/shared versus scaled/self duration, fixed tick-start admission, kind14 queue and active recipient healing/Engine delivery. 2,037 instruction cases and source/syntax checks pass. No further selected source omission identified; actual gameplay/client/network/meter and original/rebuilt parity remain unverified. Wider co-op contracts retain #63/#41. |
| #178 / `druid-release/manifest.json:native_spans[role=merged-aura-stacks]` | [Source/static repair](player-aura-grouping-0.119.0.md) connects active spell/count/max-expiry grouping to `PlayerAuraInputs::slots`, preserving encounter order and later partitions through existing application-word/UNIT_AURA consumers. 278 bounded instruction cases pass. Rendering and parity remain unverified. |
| #169/#170 / [current locale data](locale-catalogs-0.119.0.md) | All fourteen source catalogs now match the exact native payloads after restoring 650 translations and replacing eight obsolete keys. #169 also recovers the [loader/parser/lookup](localization-loader-0.119.0.md); #170 connects the [Hakkar description and existing predicate](hakkar-smoothie-0.119.0.md). Separate name consumers #171/#172 have source/static repairs. Actual locale/UI execution and parity remain unverified. |
| Individual module contract findings | `exe-connections.json:systems[id=...]` and [module register](module-contracts-0.119.0.md) retain every missing current bounded recovery contract with its permanent finding. Inspect the actual source, Location/body anchors and dispatch/state/consumer/failure boundaries for that exact module. Missing proof is not proof of absent implementation. |

The [release contracts](release-contracts-0.119.0.md) own the current Druid spans,
original query/result/profile commitments and source receipts. The
[AS review](as-discovery-0.119.0.md) distinguishes completed bounded reviews,
pending attribution and structural graph observations. All six semantic
discovery stages remain partial; the queue has no global semantic closure.
The graph and original review input retain their audit-time source receipts;
their historical source-difference counts are not a list of pending repairs.
Existing implementations do not become new recovery tasks solely because a
current contract registration or newest-target proof is missing.
Recording or classifying a lead does not repair it. Compilation, actual client/
game/network/server execution, save/settings/file effects, mechanics, movement/
camera, UI/input/rendering/audio and controlled original/rebuilt comparisons
remain separate evidence levels and were not performed by this audit.
