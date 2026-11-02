# Unknown recovery queue — 0.119.1

Selected installed EXE SHA-256:
`b3b5d86b06b95fd24f66697c023c196bac9687673905dcf03c000b31cc8d073c`.
This is **#41**'s current-target queue. The
[selector proof](evidence/0.119.1/unknown-recovery.json),
[native census](native-census-0.119.1.md),
[data manifest](evidence/0.119.1/data-classification/manifest.json) and
[persistent graph/queue](coverage/as-discovery.json) supply exact artifact
paths, hashes, populations and pending states. These overlapping populations
are not functional coverage or evidence of missing gameplay.

The saved current graph has **10,237 nodes / 56,659 edges**, **2,518 pending
entries** and **eight bounded reviews**. Fifteen explicit native questions
include the retained item-registry boundary and the fourteen separately listed
table correspondences below. The [connection ledger](coverage/exe-connections.json)
retains **100% — 61/61** modules with partial reconstructed source and
**3.3% — 2/61** with registered current-target bounded recovery contracts.
The remaining module proof dimensions retain individual finding IDs in the
[module register](module-contracts-0.119.1.md); absent current registration does
not erase prior recovery or source implementation.

Read the owning finding/report and available source first. Use journaled
`./scripts/rea query` plans for Ghidra searches/decompilation and retain
unfinished Program/query state. Reuse the existing benilla interface and stop
generic branches once the required AS boundary is established. Cooperative
client, networking and server source is eligible; no game server, relay or
directory service may be started. Preferred PE VAs are static addresses.

## Complete file, reference and data selectors

Each SQLite selector below addresses the exact database selected by
`unknown-recovery.json:inputs`. Select every row unless a filter is given.
An empty undecoded set proves neither reachability nor semantic completeness.

| Lead / input | Exact selector | Next static action |
| --- | --- | --- |
| Q41-U01 / `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | Recover relevant actual body/interior/inline roles and their AS source/dependency boundaries. |
| Q41-U02 / `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | Resolve any undecoded suffix; retain independent reachability/ownership questions when empty. |
| Q41-U03 / `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | Classify complement regions through references/consumers. Uniform CC/NOP/alignment classes remain candidates. |
| Q41-U04 / `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | Recover decoding/flow stop boundaries and distinguish terminal/error/data roles. |
| Q41-F01 / `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Prove computed targets from incoming register/index state, guards, registrations and pointer writers. |
| Q41-F02 / `unwind-complement-summary` | The same indirect-reference SQL | Recover complement dispatch, aliases and imports separately. |
| Q41-A01 / `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | Trace direct calls, address formation and memory operations into bounded AS producer/consumer questions. |
| Q41-A02 / `unwind-complement-summary` | The same non-indirect-reference SQL | Classify complement encoded references and imported-pointer slots without inventing dynamic targets. |
| Q41-B01–B05 / `file-range-summary.ledger` | `ranges[lead_id == '<lead>']` | Classify every exact header/section/alignment/gap range. Structural assignment does not prove padding or data meaning. |
| Q41-R01 / resources | `data_resources[*]` and [member proof](evidence/0.119.1/mpq-member-coverage.json) | Recover native mount/patch/locale/resource lifetimes and actual world/model/texture consumers. Ten unchanged MPQs and 29,699 active slots / 29,690 names do not establish rendering. |
| Q41-I01 / embedded data | `embedded_candidate_selectors.<category>` and `data-classification/manifest.json:outputs` | Follow each exact payload, descriptor, ID and constructed data lead through bounds, widths, parsers/readers/writers and real consumers. |

The 26-range ledger covers all **145,374,208 bytes** without omissions or
overlap. Q41-B04 contains no file-gap/overlay/trailer range in this image;
the other structural/semantic unknowns remain open.

`unknown-recovery.json:inputs.ghidra-census.artifact_selectors[*]` selects the
same independently verified census as the connection ledger. Its complete
Program-state exports retain exact instruction/body/reference observations,
not complete native behavior. The separately verified residual and operand
inputs are selected by `verified_classifications`. The current opcode/ownership
[classifier](coverage/native-ownership-classification.json) is instead bound
by the [atomic native selection](coverage/native-image-current.json); the
unknown-selector JSON does not claim to admit a separate `native-ownership`
snapshot or complete computed destination classification.

The expanded census verifies **23,295,626 instructions** and retains
**8,596,887 unobserved executable bytes / 472,034 ranges**. Its complete residual
join retains **68,340 ownerless instructions**, **804,874 references with
ownerless sources**, **4,839 unowned executable destinations** and **1,216
ownerless diagnostic sites**. These overlapping structural populations include
prior classified roles whose current correspondence is addressed below; they
are not all newly unexplained AS behavior.

| Lead / exact selected artifact | Next static action |
| --- | --- |
| Q41-G01 / `ownerless-instructions.tsv.gz` | Classify actual interior/inline/error/data roles through incoming/outgoing references and registration. Do not create a function for every ownerless instruction. |
| Q41-G01 / `ownerless-reference-sources.tsv.gz` | Join each source site to its current instruction, dispatch and state before assigning an AS interface. |
| Q41-A01 / `unowned-executable-destinations.tsv.gz` | Prove incoming receiver/index state and callable versus code-only role. An executable address alone is not a function. |
| Q41-D01 / `diagnostic-sites.jsonl.gz` | Distinguish current Location references, body owners, ownerless sites and literal reads, then trace the required AS state/consumer. |
| Q41-M01 / atomic-selection ownership classifier and selector-proof operands | Recover callbacks, vtables, queued events, mutable slot writers and data/ID/type meanings. Keep computed-flow records, actual CALL/JMP opcodes and proved edges distinct. |

Historical `excluded-coop` collector labels retain their original population
meaning and impose no current source restriction. Generic engine/compiler/OS
unknowns remain supporting context unless a concrete AS dependency or
ownership question is identified.

## Retained recovery and current correspondence

[Incremental correspondence](evidence/0.119.1/incremental-correspondence.json)
links the immutable prior graph/queue/profile and owning reports. Prior source
repairs, stable lead identities and completed bounded classifications survive
this update. Their current applicability is separate from implementation and
semantic recovery already performed on their original targets.

The [0.119.0 site-role proof](as-ownerless-sites-0.119.0.md) classifies sixty
AS diagnostic sites and 788 ownerless instructions. The
[computed/source proof](computed-source-frontier-0.119.0.md) retains 113 AS-body
contexts: six loader interfaces, 78 table expressions and 29 receiver/writer
questions, plus ten existing party-control source actions. Map these roles
through the current diagnostic/body/reference selectors before calling raw
residual entries newly unknown. Neither evidence is silently relabeled current.

The retained selector `runtime/q41-unobserved-as-0.119.0/frontier.json`
contains 143 mixed ranges / 35 AS contexts. Its journal has seventeen completed,
one interrupted and fifteen unstarted queries. Establish current range/context
correspondence before resuming affected questions; preserve prior progress and
reject historical pseudocode that crossed unrelated/out-of-extent code.

## Fourteen current table correspondence questions

The [exact current frontier](evidence/0.119.1/computed-correspondence-frontier.json) and
[switch proposal receipt](evidence/0.119.1/native-switch-proposals.json) retain
each current table range, prior selector and existing owner separately. These
are fourteen refinements of retained Q41-F01 questions, not new gameplay bugs.
All fourteen proposals remain unapplied to the selected Program. Guarded
fallthrough domains are established; incoming producers/types, unobserved case
destinations and complete per-case source applicability remain pending.

| Owning findings / exact current selector | Table / prior site | Next static action |
| --- | --- | --- |
| #17/#73 / `Q41-F01:site=0x140307692` | `0x1461b1720` / `0x1403076a2` | Trace object field +0x44 and moved call, prove admitted payloads/destinations and join Details/growth source. |
| #64/#65 / `Q41-F01:site=0x145afc9a7` | `0x1472df660` / `0x145afa2a7` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afdae2` | `0x1472df820` / `0x145afb3fb` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afdb81` | `0x1472df998` / `0x145afb49a` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afdd35` | `0x1472dfb6c` / `0x145afb64e` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afde7f` | `0x1472dfd00` / `0x145afb798` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afdea8` | `0x1472df9f0` / `0x145afb7c1` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afded4` | `0x1472dfe7c` / `0x145afb7ed` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afe1cf` | `0x1472dfed4` / `0x145afbad2` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afe1f7` | `0x1472e01e0` / `0x145afbb29` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afe234` | `0x1472dfeac` / `0x145afbb66` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afe260` | `0x1472e035c` / `0x145afbb92` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afe507` | `0x1472e04d4` / `0x145afbe39` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |
| #64/#65 / `Q41-F01:site=0x145afe5a1` | `0x1472e0370` / `0x145afbed3` | Recover this table’s entry/payload producer and case destinations; join native fields/locale to the existing CreatureQuery source. |

For CreatureQuery, reuse `coop_commands` → `creature_queries::query_with` →
guardian/enemy/boss catalogs and `SPECIALS` → `query_packets`/benilla cache.
Its [current owner query](evidence/0.119.1/guarded-creature-query-correspondence.json)
establishes the opcode-0x60 interface within a mixed owner, rather than thirteen
new party/gear behaviors. Codex retains a 16/17 normalized prefix candidate;
the moved call and changed RIP data dependencies still need their exact proof.

## Individual AS frontier actions

The [AS review](as-discovery-0.119.1.md),
[frontier proof](evidence/0.119.1/as-discovery-frontier.json) and
[release review](release-review-0.119.1.md) own the detailed source boundaries.

| Finding / exact selector | Source and next static recovery step |
| --- | --- |
| #183 / supplied fewer-disconnects summary | Current selected-relay liveness and frame recovery bind its executable clause to #184. Keep this distinct release item and its independent runtime/parity limits; a summary is not another contract. |
| #184 / lobby-drop run continuation | Current helpers `0x145ab5130..0x145ab520a`, `0x145ab5240..0x145ab531a` and frame `0x145b01174..0x145b012dd` separate selected party-relay from primary lobby liveness. Repair the older coupling in `coop_directory::transport_closed` and `Session::service_lost/connected`; preserve actual relay loss and explicit Leave. |
| #185 / real guest departure | Current calls at `0x145b01db8`/`0x145b0277e` reach peer remover `0x145b1e7d0..0x145b1e91c`. Existing tick/disconnect/membership owners preserve that interface. Rebind deeper hero/health/projection dependencies; no new concrete source defect found in this bounded item. |
| #186 / `custom-game-coop-trust`, native `0x145ae46c0..0x145ae4f23` | Existing `gameplay/coop.rs::guest_engine_packet` admits/carries the payload unchanged. Current trust owner and nine-cell table recover the `0x51` name / `0x96` chat transform. Resolve remaining required helper edges and implement it at the existing post-admission/pre-delivery boundary, preserving guards, malformed fallbacks and suffixes. |
| #98 / `Q41-I01:save_configuration_key_lead:5` | `talentxp` at `0x1472de146`, one current encoded address. Trace producer → queued Value → dispatch/active context → terminal/save consumer; do not infer schema from spelling. |
| #98 / `Q41-I01:save_configuration_key_lead:0` | Executable immediate at `0x1400ac077`. Re-establish instruction/length/type guard, dispatch and incoming context/resource lifetime against existing `Context::accept`. |
| #103 / `Q41-I01:resource_path:0` | URI at `0x1461a0708`, three encoded reads. Trace actual native handle to `Art.progress_bar`/`bar_flow`, stopping at the shared image loader. |
| #104 / `Q41-I01:resource_path:4` | URI at `0x1461af6ac`, two encoded reads. Recover native handle → achievements-sidebar consumer before claiming source equivalence. |
| #101 / `Q41-ITEMTEXT01:owner:0x145b5fbb0-0x145b5fdb2` | [Current candidate proof](evidence/0.119.1/item-registry-frontier.json) remaps interner/unwind/lock and thirty selected references. Retain the [0.119.0 recovered ordinary decoder/query/receive/cache/lookup](coop-item-registry-0.119.0.md). First establish their current dependency applicability, then follow only a concrete alternative guest registry producer/carrier or computed/mutable writer. No such new lead has been established; do not rerun the ordinary decoder or invent packet, ID-remap, reset or merge policies. |
| #163 / admission `0x145b1d9de..0x145b1da18` | Current native protocol 5 / length 7 / exact `0.119.1` is proved, while the retained shared source constant is `0.119.0`. Update outgoing/incoming admission and the fixed fixture in a selected repair. Wider packet/lifecycle and runtime/parity remain separate. |
| Individual module-contract findings | `exe-connections.json:systems[id=...]` and the [module register](module-contracts-0.119.1.md) preserve one current-contract issue per known module where needed. Inspect actual source plus current Location/body/dispatch/state/consumer/failure boundaries; pending current registration does not prove absent implementation. |

Every reviewed actionable discovery maps to an individual CURRENT-STATE finding;
bulk generic residuals stay in their exact selectors. Recording a pending lead
does not resolve it. All six semantic discovery stages remain partial, with
no global frontier exhaustion or complete indirect/state/schema/source closure.

Compilation, game/client/network/server execution, movement/camera, UI/input/
rendering/audio, save/settings/file effects and controlled original/rebuilt
comparisons were not performed. Their evidence cannot be transferred by a
module connection, byte inventory, bounded static contract or accounting pass.
