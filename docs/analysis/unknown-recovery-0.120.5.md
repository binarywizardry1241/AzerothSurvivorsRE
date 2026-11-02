# Unknown recovery queue — 0.120.5

Selected installed EXE SHA-256:
`522e1c831b3b4627875a28a1030368ef9d2e7f98c5606c34cb30448d3b7d776e`.
This report preserves **#41**'s current unknown selectors, retained recovery and
bounded next static work. The [exact machine queue](evidence/0.120.5/unknown-recovery.json)
binds current whole-file, diagnostic, linear/complement, expanded native and
residual/operand proofs. The [connection ledger](coverage/exe-connections.json)
selects the same verified expanded census. Operand/dispatch/ownership derivation
and structural joins are complete within their recorded bounds; semantic
frontier closure remains open. No historical residual counts are used as current.

Read the owning report and actual local benilla/reconstruction source before
expanding native recovery. Use journaled `./scripts/rea query` plans and shared
compatible Programs/results. Stop established engine/library interfaces when
the concrete AS contract has been established. Cooperative client/network/server
source remains in scope; do not operate a server, relay or directory service.

## Verified linear and complement selectors

Each SQL query applies to `unknown-recovery.json:inputs[<inventory>].inventory`
and is reproduced in `sqlite_selectors[*]`. The current
[instruction summary](coverage/instruction-summary.json) and
[complement summary](coverage/unwind-complement-summary.json) supply those exact
inputs. Populations overlap and must not be summed as AS functions or missing
code. `inputs.ghidra-census.artifact_selectors` separately binds actual body,
reference, instruction, diagnostic and unobserved-byte export selectors.

| Lead / inventory | Exact selector | Records | Next static action |
| --- | --- | ---: | --- |
| Q41-U01 / `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | 358,226 | Recover actual bodies, roles and AS dependency/source ownership; declared extents are not function bodies. |
| Q41-U02 / `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | 0 | Recover any invalidated suffix exactly; an empty set does not establish reachable-code completeness. |
| Q41-U03 / `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | 337,494 | Classify complement leaf/inline/data roles; candidate padding remains unknown until proved. |
| Q41-F01 / `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 82,978 | Recover destinations, guards, registration/callback/vtable producers and relevant incoming aliases. |
| Q41-F02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 652 | Recover complement computed transfers separately from declared references. |
| Q41-A01 / `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 3,843,637 | Classify encoded direct/address/memory edges and recover relevant AS producers/consumers without assuming live pointers. |
| Q41-A02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 14,131 | Classify complement references and imported-pointer slots while preserving dynamic callee uncertainty. |
| Q41-U04 / `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | 6,017 | Resolve exact decoding/flow stops, unobserved successors and code/data roles. |

## Whole-file and Data range leads

The [disjoint file ledger](coverage/file-range-summary.json) covers
`[0, 145498624)` with 26 exact ranges. Its `ranges[lead_id == '<lead>']` groups
retain headers, section contents, alignment and unexplained data with their
own questions. Structural classification does not prove semantics or padding.
Q41-R01 selects the ten registered Data resources and their member accounting;
recover actual mount/locale/resource lifetime and world/model/texture consumers.
Q41-I01 selects `embedded_candidates.<category>[*]` in the current whole-image
inventory: follow actual readers/writers/constructors/parsers to establish
bounds, widths, schemas and numeric meanings. Literal/regex membership is not
an exhaustive inventory of AS data.

## Exact native residual frontier

The [native report](native-census-0.120.5.md) and
[independently verified expanded summary](coverage/full-image-execheck-0.120.5.json)
retain **8,600,710 unobserved executable bytes / 472,309 ranges**: 5,270,617
bytes inside declared extents and 3,330,093 outside. The exact partition is
`independent_instructions.executable_sections.range_inventory`; original
instructions, actual bodies and static references are selected by
`artifacts.files[instructions.tsv.gz]`, `[bodies.tsv.gz]` and
`[references.tsv.gz]` beneath `artifacts.directory`. These observations are not
automatically AS-specific, absent implementation or proved noncode.

The [complete residual proof](evidence/0.120.5/native-residuals.json) binds twelve
exact artifact sets to this same current census and the independent linear/
complement inputs. Independent admission, including eight negative target/input/
count/completeness cases, passes. No pending semantic question is represented
as recovered by completed decoding or these spatial ownership joins.

Each artifact below is selected by its exact key in `native-residuals.json:artifacts`;
the manifest supplies its current path, SHA-256 and full row count.

| Lead / exact artifact selector | Records | Next static action |
| --- | ---: | --- |
| Q41-G01 / `[ownerless-instructions.tsv.gz]` | 90,536 | Recover interior/inline/error/data roles through incoming/outgoing flow without forcing function ownership. |
| Q41-G01/A01 / `[ownerless-reference-sources.tsv.gz]` | 809,236 | Recover the source role of each retained reference; header/data sources are not automatically missing instructions. |
| Q41-A01/A02 / `[unowned-executable-destinations.tsv.gz]` | 7,952 | Recover callable versus code-only destination roles, incoming state and required AS source interfaces. |
| Q41-D01 / `[diagnostic-sites.jsonl.gz]` | 18,119 | Reconcile exact Location/literal/instruction/body roles and original classifications before declaring a new AS unknown. |
| Q41-F01 / `[declared-indirect-sites.tsv.gz]` | 82,978 | Prove guards/domains, callbacks/registrations, aliases and pointer producers; encoded candidates are not observed runtime calls. |
| Q41-F02 / `[complement-indirect-sites.tsv.gz]` | 652 | Recover complement computed-transfer roles independently from declared-range references. |
| Q41-U04 / `[complement-stops.jsonl.gz]` | 6,017 | Follow exact pending decoding/flow stop boundaries and classify unobserved successors. |

The diagnostic set retains **1,216 records with `actual_body_owner == null`**;
**60** additionally have `context == "AS-custom-path"`. The full reference set,
`[static-reference-roles.tsv.gz]`, retains **4,037,940 records**. These populations
overlap and are not unexplained-AS counts. Legacy `excluded-coop-path` context
labels preserve their original collection scope and exclude no current co-op
client/network/server source.

The [current operand audit](evidence/0.120.5/native-operands.json),
[direct-flow/producer audit](evidence/0.120.5/native-dispatch.json),
[constant-register audit](evidence/0.120.5/native-constant-dispatch.json) and
[opcode/source classification](coverage/native-ownership-classification.json)
are all bound to this same independently verified expanded census.

| Lead / exact current selector | Population | Next static action |
| --- | ---: | --- |
| Q41-M01 / `native-operands.json:inventory` | 675,060 explicit static memory/address expressions | Follow actual AS writers/readers, initial slots and consumer schemas; address expressions acquire no implied access or call semantics. |
| Q41-M01 / inventory rows with `source_native_owner == null` | 10,157 | Recover source/body roles and relevant AS input/state ownership before expanding a dependency. |
| Q41-A01 / `native-operands.json:unowned_executable_candidates` | 5,774 exact starts + 20 unobserved targets; zero interiors | Follow incoming reference state and the concrete executable role; fixed addresses alone do not prove function entries. |
| Q41-F01 / `native-dispatch.json:inventory.path:unowned_direct_destinations[*]` | 5,652 exact current instruction starts | Trace incoming conditional/unconditional flow, code-only/interior roles and required source interfaces. This is a subset of the all-reference residual population. |
| Q41-F01/F02 / `native-dispatch.json:inventory.path:producer_records[*]` | Complete retained computed-jump producer observations | Recover register/slot writers, selector guards and callback/vtable/registration domains beyond lexical fallthrough shapes. |
| Q41-F01/F02 / `native-ownership-classification.json:artifact` | 70,768 actual indirect CALLs + 11,627 indirect JMPs | Inspect each retained site, body owner, resolution basis and unknown reason; prove required AS aliases/dispatch without treating encoded imports or initial pointers as live calls. |

The no-memory constant-register audit records no additional transfer target in
its exact domain. Missing rows are not proof of global absence: indexed/register/
segment-dependent memory, mutable slots, unobserved incoming edges and type
invariants remain open. The opcode populations above are separate from Ghidra
computed-flow tags and overlap the independent linear/residual selectors.
Thirteen absent generic-engine source candidates remain supporting context;
they do not create new AS findings or block the current AS reporting boundary.
The machine queue's `verified_classifications` admits the residual and operand
proofs. Its `missing_semantic_inventories` retains complete AS state/type/cycle
and outer-consumer meanings, complete computed-destination/dynamic-alias/type/ID
classification and complete source producer/consumer closure with controlled
original/rebuilt comparisons. Current opcode/shape inventories do not resolve
those semantic obligations.

## Current source findings and bounded next recovery

The [release review](release-review-0.120.5.md) retains supplied items **#214–#216**
separately and the independently discovered presentation omission as **#217**.
The [policy proof](evidence/0.120.5/release-policy/manifest.json) reuses source-first
interfaces and binds four Ghidra queries, thirteen original instruction ranges,
fourteen locale payloads and bounded getter/URL replay. The
[admission proof](evidence/0.120.5/admission/manifest.json) re-establishes the
exact current protocol/version gate under existing #163.

| Finding / exact current native lead | Actual source owner and next static step |
| --- | --- |
| #214 / policy manifest `contracts.alternate_url`, `.guest_failure`, `.reason_consumer` | `coop_directory.rs`, `coop/relay_lifetime.rs`, `coop_runtime.rs`, `coop_ui.rs`; complete #215/#216's required interfaces before a selected repair, preserving this separate supplied summary item. Real restricted-network hosting/joining remains untested. |
| #215 / service pump `0x145b64cd0`, alternate take `0x145b66e8c..0x145b66f28`, retained endpoint commit `0x145b675b8..0x145b675d2` | `coop_directory.rs::Worker::open`, `coop/websocket.rs::DirectorySocket`, `coop/relay_lifetime.rs::SecondaryLifetime`; trace the actual callback/auth-envelope producer, initial timeout and close/replacement ownership. The port-removing alternate transformation and one-shot unadmitted-failure gate are recovered; wider callback/transport dependencies remain open. |
| #216 / frame selector `0x145b18512`, vtable `0x146fbca38`, guest failure getter `0x145b74870..0x145b74930` | `coop_runtime.rs::poll` and directory status; preserve selected/unadmitted/failed provenance through terminal status and review teardown/denial priority before selected implementation. Ordinary host departure and direct-TCP failures remain separate. |
| #217 / UI key branch `0x14008ae34..0x14008ae68`, localization call `0x14008b8ed`, fourteen descriptor-bound locale payloads | `coop_forms.rs::localized_reason`, `coop_ui.rs::status_message`, `assets/locales/*.json`; add the exact recovered key/translations and existing recognized-reason route in a selected repair. Separate language-selection/settings module proof remains pending under #127. |
| #163 / admission owner `0x145b34a30`, gate `0x145b34cde..0x145b34d18` | `coop/server_party.rs::GAME_VERSION`, `Session` Join producers and directory Handshake; native requires protocol 5 / exact 0.120.5, while retained source says 0.120.2. Preserve the shared owner and existing repair, recover required admission dependencies and correct source in a selected repair. |

These native/source differences are documented audit results; no gameplay or
localization repair is made here. Compilation, reconstructed-source execution,
client/network/server behavior, rendering/input and controlled original/rebuilt
comparisons remain separate evidence. Bounded static instruction replay does
not establish those outcomes.

## Retained literal and semantic correspondence questions

The [current literal/reference frontier](evidence/0.120.5/as-discovery-frontier.json)
reconciles earlier stable selectors through exact candidate bytes and the complete
current declared/complement reference join. This supplies navigation, not full
producer/schema/consumer applicability.

| Stable selector / existing finding | Current native candidate / actual source | Next static action |
| --- | --- | --- |
| `Q41-I01:resource_path:0` / #103 | `0x14617e768`; `progression::load_art -> Art.progress_bar -> bar_flow` | Trace exact URI readers through producer, asset handle and live progression-bar consumer; stop at the existing image-loading interface. |
| `Q41-I01:resource_path:4` / #104 | `0x1461c3334`; `progression::load_art -> Art.dragon -> achievements_sidebar::draw` | Trace current URI/handle to sidebar drawing and lifetime; preserve separate rendering/parity needs. |
| `Q41-I01:save_configuration_key_lead:5` / #98 | `0x146fbc6be`; `talent_context::Context::accept/request/Snapshot::read` and `gameplay::client::events::receive_coop -> terminal::queue_talent` | Follow exact literal/reference sites through request dispatch, queued Value and terminal/save consumers; spelling does not prove schema or numeric meaning. |
| `Q41-I01:save_configuration_key_lead:0` / #98 | `0x140279257`; `talent_context::Context::accept -> TerminalState` pending request drain | Apply the reviewed current guarded context and recover incoming lifecycle/type/drop/map interfaces and terminal projection; retain prior talent-XP repair separately. |

The executable `talentxp` byte pattern remains an immediate/domain question,
not a proved save key from spelling alone. Prior finite CreatureQuery, Codex,
helper and ordinary decoder/query/receive/cache classifications retain their
original evidence in [incremental correspondence](evidence/0.120.5/incremental-correspondence.json).
Their precise current dependency applicability is separate from missing
implementation or unexplained semantics. Existing #198/#208/#210/#211/#212
relay/reset/budget/gap/ACK findings keep their 0.120.4 proof and prior source
status; new-target registration does not erase or automatically revalidate them.

The [module register](module-contracts-0.120.5.md) supplies every missing current contract dimension's stable
finding and `exe-connections.json:systems[id=<module ID>]` selector. Current
bounded registrations qualify only their named scopes; a language data link
or broad report does not certify unrelated modules. All six AS discovery stages
ran within the recorded audit bounds and remain partial. The exact current
connection ledger, machine queue and numbered findings retain the reviewed
frontier and required next static work. These structural joins do not establish
that every semantic branch is recovered. Generic engine/compiler residuals
remain supporting context until a concrete AS interface or ownership question
requires further recovery.

## Retained guarded-table questions

The [current proposal review](evidence/0.120.5/native-switch-proposal-review.json)
retains **1,102 unapplied proposals / 6,819 distinct target candidates**:
585 exact instruction starts, 6,234 unobserved and zero instruction-interior
conflicts. Unapplied proposals do not supply new edges to the selected census.
All fourteen additional AS-context proposals map uniquely to retained questions
by complete guarded geometry and independently verified current table bytes.
No new distinct AS finding is established by that correspondence.

Each stable selector below is `Q41-F01:correspondence:<question ID>` and selects
`computed-correspondence-frontier.json:leads[<question ID>]`. The original
classification and source repair remain retained. The next static step is
current input/state/dependency/consumer applicability, not reconstruction of
already recovered meanings from zero.

| Question ID / existing findings | Current dispatch / table | Retained role and next static action |
| --- | --- | --- |
| `retained-table-1403076a2` / #17/#73 | `0x1402e13c2` / `0x1461c5330` | Codex growth selector; map current type/field producers and live Details formatter/source consumers to the retained jewelry-growth contract. |
| `retained-table-145afa2a7` / #64/#65 | `0x145b12b57` / `0x146fbd7ac` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afb3fb` / #64/#65 | `0x145b13c92` / `0x146fbd96c` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afb49a` / #64/#65 | `0x145b13d31` / `0x146fbdae4` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afb64e` / #64/#65 | `0x145b13ee5` / `0x146fbdcb8` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afb798` / #64/#65 | `0x145b1402f` / `0x146fbde4c` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afb7c1` / #64/#65 | `0x145b14058` / `0x146fbdb3c` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afb7ed` / #64/#65 | `0x145b14084` / `0x146fbdfc8` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afbad2` / #64/#65 | `0x145b1437f` / `0x146fbe020` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afbb29` / #64/#65 | `0x145b143a7` / `0x146fbe32c` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afbb66` / #64/#65 | `0x145b143e4` / `0x146fbdff8` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afbb92` / #64/#65 | `0x145b14410` / `0x146fbe4a8` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afbe39` / #64/#65 | `0x145b146b7` / `0x146fbe620` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |
| `retained-table-145afbed3` / #64/#65 | `0x145b14751` / `0x146fbe4bc` | Finite CreatureQuery metadata; map current entry/selector producers, finite cells and reply/source consumers to the retained schema. |

Matching geometry and table bytes do not admit full current behavioral equivalence,
prove arbitrary mutable aliases or transfer original/rebuilt runtime/parity proof.
These correspondence tasks keep their original findings and remain separate from
new unexplained AS behavior or missing source implementation.

## AS module connection coverage

The current ledger records **55 ownerless native Location references across
12 AS paths**, distinct from the broader raw AS diagnostic-context set of 60.
Every known module retains partial reconstructed source correspondence:
**100% — 62/62**. Registered current-target bounded contracts cover
**4.8% — 3/62** modules; **59** missing current dimensions retain their individual
finding IDs and exact selectors in the
[module register](module-contracts-0.120.5.md). These module counts measure neither
AS code decompiled/implemented nor complete behavior or parity. Historical
contracts and source repairs remain retained; pending current applicability is
separate from missing implementation.
