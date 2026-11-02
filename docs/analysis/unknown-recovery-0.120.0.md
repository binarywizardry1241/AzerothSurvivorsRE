# Unknown recovery queue — 0.120.0

Selected installed EXE SHA-256:
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`. This is **#41**'s current-target queue.
[Selector proof](evidence/0.120.0/unknown-recovery.json),
[native census](native-census-0.120.0.md),
[data manifest](evidence/0.120.0/data-classification/manifest.json) and
[persistent graph/queue](coverage/as-discovery.json) bind exact artifact paths,
hashes and pending states. The graph has 10,204 nodes / 56,635 edges,
2,518 pending entries and 21 bounded reviews; these
overlapping populations do not measure functional completeness or missing code.

Read the owning report and actual source first. Use journaled `./scripts/rea query`
plans for missing Ghidra proof, reuse matching saved results/Programs and stop
generic engine branches at the established benilla interface. Cooperative source
is in scope; do not operate a game server, relay or directory service.

## Complete current range/reference selectors

SQL below applies to the exact read-only database bound by
`unknown-recovery.json:inputs[<input>].inventory`. All rows are selected unless
filtered. Empty suffix sets do not prove reachability or semantic closure.

| Lead / input | Exact selector | Next static action |
| --- | --- | --- |
| Q41-U01 / `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | All declared ranges are linearly decoded; recover actual body boundaries, role and AS dependency/source ownership. |
| Q41-U02 / `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | Any undecoded suffix needs exact range recovery; an empty set does not establish reachable-code completeness. |
| Q41-U03 / `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | Classify every complement range and its non-padding/leaf/inline/data role; preserve candidate padding as unknown. |
| Q41-F01 / `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Recover computed destinations, guards, dispatch tables and relevant aliases without guessing callees. |
| Q41-F02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Recover complement computed transfers separately from declared-range references. |
| Q41-A01 / `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Classify every encoded direct/address/memory edge; locate ownerless destinations and AS producer/consumer connections. |
| Q41-A02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Classify complement encoded references and imported-pointer slots without promoting dynamic callee identity. |
| Q41-U04 / `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | Resolve decoding/flow stop boundaries; retain unobserved successors and unknown code/data roles. |

The 26-range ledger covers all 145,447,424 file bytes without omission
or overlap. `file_range_groups[*].selector` retains every exact header, section,
gap/alignment/overlay candidate; structural assignment does not prove padding
or data meaning. Q41-R01 uses `data_resources[*]` plus the ten-MPQ
[member proof](evidence/0.120.0/mpq-member-coverage.json); recover native
mount/patch/locale/resource lifetimes and actual world/model/texture consumers.
Q41-I01 uses `embedded_candidate_selectors.<category>` and the data manifest's
`outputs` to select every literal, descriptor, constructed data and ID question.
Prove actual widths/bounds/parsers/producers/consumers before assigning meaning.

The same selected census leaves **8,602,174 unobserved executable
bytes / 472,201 ranges**, **68,343 ownerless
instruction records**, **805,217 references with ownerless
sources** and **4,839 unowned executable destinations**.
Exact selected exports are bound in `inputs.ghidra-census.artifact_selectors`;
the [residual proof](evidence/0.120.0/native-residuals.json) and
[operand proof](evidence/0.120.0/native-operands.json) distinguish actual
observations from mutable register/index/slot aliases and runtime targets.
Historical `excluded-coop` labels remain original collection categories; co-op
client/network/server source is eligible under the current scope.

| Lead / exact residual artifact selector | Next static action |
| --- | --- |
| Q41-G01 / `native-residuals.json:artifacts[ownerless-instructions.tsv.gz]` and `[ownerless-reference-sources.tsv.gz]` | Classify actual interior/inline/error/data roles through incoming/outgoing flow and registrations; do not force function ownership. |
| Q41-A01 / `artifacts[unowned-executable-destinations.tsv.gz]` | Prove incoming state and callable versus code-only roles, preserving initial encoded pointers separately from observed calls. |
| Q41-D01 / `artifacts[diagnostic-sites.jsonl.gz]` | Reconcile exact Location/literal/body/ownerless roles with retained classifications before identifying new AS ownership questions. |
| Q41-F01/F02 / `artifacts[declared-indirect-sites.tsv.gz]` and `[complement-indirect-sites.tsv.gz]` | Recover guarded selectors, callbacks/vtables, registrations and pointer writers; arbitrary aliases and dynamic destinations remain unknown. |
| Q41-M01 / operand proof `inventory` and atomic-selection ownership classifier | Follow fixed expression/initial-slot observations into concrete AS producers/dispatch/consumers; stop established generic dependencies. |

## Resolved selected receiver questions

These supplements classify exact sites without changing the frozen census or
graph populations above. Their original observation counts remain intact.

| Stable lead | Current result and remaining limits |
| --- | --- |
| `Q41-F01:site=0x145b02ada` | [Equipment frontend receiver](q41-gear-receiver-0.120.0.md) resolves the constructed object/readonly method-table path, owned JSON delivery and actual drop consumers. 185 bounded native cases expose #192 (guest notice delivery, source repaired) and #193 (Tester/new-item Save admission, source repaired). Generic mutex/allocation/transport internals stop at existing interfaces; actual UI/network/file and parity remain unverified. |
| `Q41-F01:site=0x145bbf151` | [Enemy HP-helper dispatch](q41-enemy-callback-0.120.0.md) resolves the former register-callee question: the definition's byte at `+4c` selects one of two fixed AS health polynomials. All 256 flag values and 12,288 bounded original-instruction cases match the existing live source. No source defect is established; broader constructor/module recovery, runtime and parity remain separate. |

## Retained questions and current source connections

[Incremental correspondence](evidence/0.120.0/incremental-correspondence.json)
preserves thirteen earlier bounded review identities and retained site-role,
computed/source and unobserved-range work. Current co-op assessments rebind
only their supported scopes. Earlier source repairs and the #101 ordinary
decoder/query/receive/cache boundary remain implemented historical knowledge;
newer-target applicability is a different dimension.

| Stable finding / current selector | Native lead and actual/candidate source | Next static step |
| --- | --- | --- |
| #98 / `Q41-I01:save_configuration_key_lead:4` (prior `:5`) | `talentxp` data at `146fb917e`, encoded reference manifest; `talent_context`/active Context/terminal owners | Prove current producer, queued Value/schema, dispatch/lifecycle applicability; keep prior context recovery. |
| #98 / `Q41-I01:save_configuration_key_lead:0` | Immediate bytes at `140279787`; retained Context source | Recover current guard/table/incoming receiver semantics; ASCII matching does not identify its domain. |
| #103 / `Q41-I01:resource_path:0` | Progress URI at `1461757b8`, three selected encoded reads; `Art.progress_bar`/`bar_flow` | Follow current native producer→handle→actual consumer and stop at existing image-loading interface. |
| #104 / `Q41-I01:resource_path:4` | Dragon URI at `1461ba2e4`, two reads; `Art.dragon`/sidebar owner | Prove current handle/sidebar connection; rendering/parity remains separate. |
| #101 / `Q41-ITEMTEXT01` | Current interner candidate `145c08df0..145c08ff2`, registry operand `14852b918`, 29 declared/complement references; inventory/CoopGame/LocalItemDescriptions owners | Establish current applicability of retained contracts; follow only a concrete alternative guest writer/carrier or mutable producer. Do not repeat the ordinary decoder or invent a wire/remap policy. |
| #187/#188 / `RACE120:*` query/range selectors in race manifest | [Purchase/account repair](race-rewards-0.120.0.md), current typed ownership/selection and [run carry](race-run-carry-0.120.0.md) | Selected source/static work resolved:6,194 purchase/admission,23,283 eligibility,72 entry/outfit and288 racial-stat cases retain their explicit seams. No further selected source omission identified. Compilation, real file/UI/network/gameplay and original/rebuilt parity remain open; broader #41 discovery is separate. |
| #189 / race manifest `save-loader`/`save-serializer`/`real-reset-helper` queries | Current typed loader, serializer and reset; Save/schema/account plan | [Source/static work complete](race-persistence-0.120.0.md): exact token/repeated-record/sort/dedup rules and live save/reset connections are implemented. 80 original reset cases and source guards pass; no remaining selected source omission identified. Compilation, actual file/UI/reload and parity remain unverified. |
| #190 / `RACE120:form-display:0x145b7b820` | Current filename-free form descriptor; corrected forms.rs/live solo/co-op consumers | [Source/static repair complete](faction-forms-0.120.0.md): IDs2/5/6/8, first recognized form and fields131/132 pass 14,336 native cases and 3,584 source projections. No remaining source repair identified in this contract; runtime/parity and native filename ownership remain unproved. |
| #191 / `RACE120:race-tip:0x1402f8e00` | Current allowed-byte/footer branch; armory/race_tip.rs | Add exact localized guidance and account-aware eligibility; finish the allowed boolean's caller connection. |
| #163/#184/#186 and preserved #185 / `COOP120:*` | [Current co-op report](coop-correspondence-0.120.0.md) binds exact version, service/party fields, guest transform and departure interfaces | Shared version #163, party liveness #184 and [Engine trust #186](coop-trust-0.120.0.md) source/static repairs are connected; no further selected source omission identified. Deeper party/health/full opcode-domain #180 and actual delivery/parity keep their separate owners. |

## Fourteen earlier table mapping questions

Each selector below is admitted into the actual persistent current graph/queue
as `pending_current_correspondence`. The
[frontier proof](evidence/0.120.0/computed-correspondence-frontier.json)
binds its predecessor question/range and current source receipts. **Current
native positions are candidate correspondences, with semantic/source applicability pending**; the displayed old site is historical,
not an address in the selected image. Preserve earlier semantic/source work.

| Stable current queue selector | Existing finding | Current candidate dispatch / table | Historical dispatch | Next static step |
| --- | --- | --- | --- | --- |
| `Q41-F01:correspondence:retained-table-1403076a2` | #17/#73 | `0x1402e18f2` / `0x1461bc2e0` | `Q41-F01:site=0x140307692` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afa2a7` | #64/#65 | `0x145b04217` / `0x146fba2f0` | `Q41-F01:site=0x145afc9a7` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afb3fb` | #64/#65 | `0x145b05352` / `0x146fba4b0` | `Q41-F01:site=0x145afdae2` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afb49a` | #64/#65 | `0x145b053f1` / `0x146fba628` | `Q41-F01:site=0x145afdb81` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afb64e` | #64/#65 | `0x145b055a5` / `0x146fba7fc` | `Q41-F01:site=0x145afdd35` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afb798` | #64/#65 | `0x145b056ef` / `0x146fba990` | `Q41-F01:site=0x145afde7f` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afb7c1` | #64/#65 | `0x145b05718` / `0x146fba680` | `Q41-F01:site=0x145afdea8` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afb7ed` | #64/#65 | `0x145b05744` / `0x146fbab0c` | `Q41-F01:site=0x145afded4` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afbad2` | #64/#65 | `0x145b05a3f` / `0x146fbab64` | `Q41-F01:site=0x145afe1cf` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afbb29` | #64/#65 | `0x145b05a67` / `0x146fbae70` | `Q41-F01:site=0x145afe1f7` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afbb66` | #64/#65 | `0x145b05aa4` / `0x146fbab3c` | `Q41-F01:site=0x145afe234` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afbb92` | #64/#65 | `0x145b05ad0` / `0x146fbafec` | `Q41-F01:site=0x145afe260` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afbe39` | #64/#65 | `0x145b05d77` / `0x146fbb164` | `Q41-F01:site=0x145afe507` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |
| `Q41-F01:correspondence:retained-table-145afbed3` | #64/#65 | `0x145b05e11` / `0x146fbb000` | `Q41-F01:site=0x145afe5a1` | Use its mapped current candidate in the proposal proof, then recover the retained selector/payload producer, case destination and actual source-consumer question. |

All missing module-source/contract dimensions retain their individual finding
IDs and exact `exe-connections.json:systems[id=<id>]` selectors in the
[module register](module-contracts-0.120.0.md). Current results are
61/61 partial-source modules and 6/61 bounded-contract modules;
these are not code implementation, decompilation or parity percentages.
Generic engine/compiler/OS residuals remain supporting context unless a concrete
AS dependency or ownership question is established. All six semantic discovery
stages remain partial; compilation, source/game/network/server operation and
controlled original/rebuilt comparisons remain unverified.
