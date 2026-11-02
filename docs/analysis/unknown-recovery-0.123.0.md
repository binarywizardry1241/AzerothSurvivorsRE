# Unknown recovery queue — 0.123.0

Selected installed EXE SHA-256:
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [verified census](coverage/full-image-execheck-0.123.0.json),
[machine queue](evidence/0.123.0/unknown-recovery.json),
[candidate graph](coverage/as-discovery.json) and
[connection ledger](coverage/exe-connections.json) bind every selector below.
[CURRENT-STATE #41](../CURRENT-STATE.md#gap-41) owns broad native closure;
independently actionable release/source questions retain their own findings.
These populations overlap and are not counts of missing AS features.

## Complete structural selectors

Each SQL row names the exact current inventory through the machine queue's
`inputs` and `sqlite_selectors` receipts.

| Lead / input | Exact selector | Records | Next static action |
| --- | --- | ---: | --- |
| Q41-U01 / `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | 358,847 | All declared ranges are linearly decoded; recover actual body boundaries, role and AS dependency/source ownership. |
| Q41-U02 / `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | 0 | Any undecoded suffix needs exact range recovery; an empty set does not establish reachable-code completeness. |
| Q41-U03 / `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | 338,263 | Classify every complement range and its non-padding/leaf/inline/data role; preserve candidate padding as unknown. |
| Q41-F01 / `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 83,075 | Recover computed destinations, guards, dispatch tables and relevant aliases without guessing callees. |
| Q41-F02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 651 | Recover complement computed transfers separately from declared-range references. |
| Q41-A01 / `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 3,856,027 | Classify every encoded direct/address/memory edge; locate ownerless destinations and AS producer/consumer connections. |
| Q41-A02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 14,093 | Classify complement encoded references and imported-pointer slots without promoting dynamic callee identity. |
| Q41-U04 / `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | 6,034 | Resolve decoding/flow stop boundaries; retain unobserved successors and unknown code/data roles. |

The disjoint file ledger covers all **146,228,736 bytes / 26 ranges**.
Its exact groups are `file_range_groups` and
`ranges[lead_id == <Q41-B01/B02/B03/B05>]`: executable contents, nonexecutable
contents, alignment tails and headers. Classify semantic roles/noncode with
evidence; candidate padding remains unknown. **Q41-R01** selects all eleven
MPQs and their member accounting: recover AS mount/locale/resource consumers
without bundling assets. **Q41-I01** selects
`embedded_candidates.<category>[*]`; follow real parsers/readers/writers for
fields, widths, enum/ID bounds and lifetimes rather than treating regex labels
as an exhaustive data inventory.

## Exact native residual and dispatch populations

The census retains **8,624,595 unobserved executable bytes / 473,889 ranges**:
5,283, 201 inside declared extents and 3,341, 394 outside. The complete selector
is `independent_instructions.executable_sections.range_inventory`; its declared
subset is `independent_instructions.unobserved_range_inventory`. Missing body
ownership and unobserved bytes are not automatically missing source.

The [residual proof](evidence/0.123.0/native-residuals.json) supplies twelve
complete artifact sets. Every key below selects `artifacts` with its exact
path, SHA-256 and row count.

| Lead / artifact | Rows | Next static action |
| --- | ---: | --- |
| Q41-G01 / `ownerless-instructions.tsv.gz` | 92,142 | Recover inline/error/data roles and incoming/outgoing flow without forcing function ownership. |
| Q41-G01/A01 / `ownerless-reference-sources.tsv.gz` | 810,792 | Classify actual source roles; data/header sources are not necessarily missing instructions. |
| Q41-A01/A02 / `unowned-executable-destinations.tsv.gz` | 8,145 | Recover code-only/callable roles, incoming state and actual AS interfaces. |
| Q41-D01 / `diagnostic-sites.jsonl.gz` | 18,130 | Reconcile Location/literal/body roles and retained classifications before declaring a new issue. |
| Q41-F01 / `declared-indirect-sites.tsv.gz` | 83,075 | Trace guards, selector domains, callback/vtable/registration and pointer producers. |
| Q41-F02 / `complement-indirect-sites.tsv.gz` | 651 | Recover complement transfers independently; retain dynamic target uncertainty. |
| Q41-U04 / `complement-stops.jsonl.gz` | 6,034 | Resolve exact stops/successors and distinguish code/data roles. |

The diagnostic projection includes 1,222 ownerless records, of which 60 carry AS
context. The ledger's genuine Location/source projection is separately 55
references across 12 paths. Historical `excluded-coop-path` labels describe a
collector population; all current co-op source is in scope.

**Q41-M01** selects [native-operands.json](evidence/0.123.0/native-operands.json):
follow explicit addresses/memory expressions to actual AS schemas and slot
writers. **Q41-F01/F02** additionally select the
[direct-flow](evidence/0.123.0/native-dispatch.json),
[constant-register](evidence/0.123.0/native-constant-dispatch.json) and
[opcode ownership](coverage/native-ownership-classification.json) artifacts.
Actual indirect opcode counts are 70,816 CALLs and 11,664 JMPs; Ghidra computed
flow tags also include traps and are a different population. Prove incoming
aliases, state and AS dependencies; encoded candidates are not observed calls.

## Applied tables and retained correspondence

The [switch review](evidence/0.123.0/native-switch-proposal-review.json) keeps
**2,581 applied tables / 17,094 edges** distinct from 3,696 proposals. Its 1,115
additional proposals contain 6,291 unobserved target candidates, 600 existing
instruction starts and zero interior conflicts. No proposed edge is promoted
to an applied edge. All 45 current AS-context tables have
[source/context review](evidence/0.123.0/switch-context-source-review.json).
Unmatched geometries preserve established query/party/session and TCP error
interfaces; no new AS operation is inferred from their shape.

The [fourteen stable questions](evidence/0.123.0/computed-correspondence-frontier.json)
retain exact `leads[retained-table-<original-site>]` identities. Six have current
geometry candidates; eight remain unmapped. Next establish actual inputs,
dispatch, state, values/layouts and producer/dependency/consumer correspondence
against each retained semantic/source contract. Do not reinterpret an unmapped
new address as lost implementation or a fresh generic-engine recovery task.

## Bounded current findings and next source/recovery actions

The [individual release review](release-review-0.123.0.md) gives each of the 16
supplied items its own #256–#271 investigation, actual source owner and current
native selector. Source/contract dimensions are #272–#275. Concrete next work:

| Finding | Next static action |
| --- | --- |
| #257 | Distinguish current client sender/ACK behavior from external server scheduling/deployment capacity; no service is operated. |
| #258 | Recover directory difficulty, class eligibility, filter semantics and lock reasons into LobbyRow/CoopUi. |
| #259 | Trace host selected-run snapshot and Change difficulty dispatch into the ordinary dialog. |
| #260 | Trace immediate host metadata publication and per-member eligibility display separately from entry admission. |
| #261 | Connect the recovered 1535→8349 cast alias through existing visual/kit/sound consumers. |
| #262 | Recover the four recipient fields' constructor/subtype meanings, then correct source recipient admission. |
| #263 | Connect offset-aware reopen/Range/fallback/error/retry state to existing gzip/hash/staging/progress. |
| #264 | Trace final-boss lethal→per-player Heroic clear/save, independent of queued choices and early departure. |
| #267 | Recover current Join/version/protocol admission under retained #163; infer no protocol increment from notes. |
| #268 | Recover delay/clock/caller origin and enemy spline catch-up around current smooth helper. |
| #269 | Recover remote-player selection/time origin and extrapolation integration, separately from enemy splines. |
| #270 | Recover guest self-correction/teleport admission and rebroadcast gates at actual route/server owners. |
| #271 / #272 | Recover offer producer, codec, host comparison, ACK/reset and source generation lifecycle. |
| #273 | Implement the recovered AS smoothing adapter only after its remaining caller/clock/correction contracts are established. |
| #276 | Trace command6 chest GUID retirement through retained-client ObjectDestroy delivery. |
| #277 | Trace old rune/aura/mover-speed reset before the next run. |
| #278 | Recover companion/pet/collector object retirement on Again. |
| #279 | Recover boundary-pillar GUID list removal/order on Again. |
| #280 | Recover duplicate/replayed offer suppression and acknowledgement/reset. |
| #281 | Recover host late-pick rejection against the offer actually viewed. |

The [module register](module-contracts-0.123.0.md) links all 66 exact system
selectors and every missing dimension: 65 partial source mappings, five bounded
current contracts and 61 pending module contract registrations. A bounded
contract does not certify a whole module. Proof-only current applicability
questions stay separate from missing source and ordinary fixgap choices.

## Retained recovery and validation limits

[Incremental correspondence](evidence/0.123.0/incremental-correspondence.json)
preserves 97 overlapping historical query reviews, prior module assessments and
nine classification manifests. The prior 60 ownerless roles, 20 fixed-address
leaves, 148 mixed AS ranges, 138 indirect interfaces, 30 data slots, 39 boundary
stops and 28 ownerless incoming sites retain their original proof and source.
The 463-body caller batch has saved native queries; full source/semantic review
is unfinished. Reuse this knowledge and query only affected/unresolved proof.

All six global discovery stages remain partial. Generic engine/compiler/OS
internals remain supporting context once their AS interface is established.
No application compilation, compiling test, client/game/network/server operation
or controlled original/rebuilt comparison was performed. Native recovery,
source implementation, isolated instruction fixtures and parity remain distinct.
