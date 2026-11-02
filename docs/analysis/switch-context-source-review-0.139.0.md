# AS dispatch context and retained source — 0.139.0

Target: installed `AzerothSurvivors.exe` 0.139.0, SHA-256 `0e8e314df4d78ab211b1bef5c48d78d713ed64260894af342f998d298d74d274`, 150,595,584 bytes.

The [machine review](evidence/0.139.0/switch-context-source-review.json) accounts for every table in the reviewed AS-context publication and supplies exact table, guard, source and finding selectors. All 48 context tables are applied; none remains proposal-only. Fourteen were proposal-only in the initial review snapshot and are now applied without changes to their table bytes, geometry or diagnostic context. Sixteen tables have one predecessor AS geometry candidate, two have ambiguous candidates and 30 have none. These are structural correspondence counts, not counts of new features or missing implementations.

The final receipt join binds the [selected census](coverage/full-image-selected-0.139.0.json), [switch proposal review](evidence/0.139.0/native-switch-proposal-review.json) and [computed correspondence](evidence/0.139.0/computed-correspondence-frontier.json). The final guarded-table publication has 3,783 applied and 3,783 proposed tables, with no added, changed or removed case vectors. All 48 AS-context ranges, geometries and diagnostic contexts are unchanged from the reviewed source snapshot. This is structural switch-frontier closure; applied edges do not establish recovered behavior, complete source or parity.

## Preserved questions and source

All fourteen original finite-table questions remain under their stable `retained-table-<historical-site>` / `Q41-F01:correspondence:…` identities. The [0.127 review](evidence/0.127.0/switch-context-source-review.json) and [prior frontier](evidence/0.127.0/computed-correspondence-frontier.json) retain their actual targets. One question concerns Codex growth text (#17/#73); thirteen concern the finite CreatureQuery metadata path (#64/#65). Their recovered classifications and delivered source are not reset by the update.

Four questions currently have unique geometry candidates:

| Stable question | Current candidate | Existing owner |
| --- | --- | --- |
| `retained-table-1403076a2` | `0x1403a3825` | #17/#73 |
| `retained-table-145afbad2` | `0x145e27d69` | #64/#65 |
| `retained-table-145afbb29` | `0x145e27d91` | #64/#65 |
| `retained-table-145afbb66` | `0x145e27dce` | #64/#65 |

The other ten retain pending current correspondence. Matching guard kind, register, bound and complete relative successor vector supplies a navigation candidate; it does not validate the current producer, row layout, dependencies or consumer. Unmapped geometry likewise proves neither removed behavior nor lost source.

Existing source inspected for the query family includes `gameplay/coop_commands.rs::template_entry` and its opcode `0x60` branch, `gameplay/client/creature_queries.rs::{creature_query,query_with,SPECIALS}`, shared `guardians::catalog::ZONES`, `gameplay/client/query_packets.rs::decode` and the shared packet encoder. The retained [finite CreatureQuery report](creature-query-tables-0.120.2.md) owns the exhaustive historical row/response classification. Existing Codex catalog, localized text and `codex.rs::detail` supply the retained growth-text consumer. Source presence does not establish compiled-revision identity or current behavioral equivalence.

## Ten initially unpaired tables: #64/#65

All ten initially unpaired proposals belong to the shared native owner `0x145e25130`, associated with both `gear.rs` and `server/party.rs` diagnostics. They are now applied-context constituents under the same #64/#65 owners. Their disappearance from the proposal-only array reflects edge application, not completed semantic/source correspondence. Those filenames do not type the complete owner as a gear operation or a party protocol.

A separate bounded original-instruction review establishes the relevant entry path. The incoming opcode is taken from `R9W`; opcode `0x60`, after subtracting `0x4b`, selects cell 21 of table `0x14769f4c8`, whose exact signed-relative target is `0x145e254b5`. That branch initializes `R14D` and reads the request prefix. The complete-four-byte path shifts its bytes by 8, 16 and 24 bits and combines their little-endian value into `R14D`. The exact instruction ranges and four-byte dispatch cell are hash-bound in `bounded_creature_query_prefix` in the machine review.

The following selectors subtract fixed entry offsets from that register and use unsigned bounds. Their table vectors are verified against the current installed PE. These are bounded selector observations; every caller context, selected metadata row and reply dependency is not thereby recovered.

| Exact selector | Table | Candidate entry interval | Stored cells |
| --- | --- | --- | ---: |
| `AS-context-table:0x145e25ac4` | `0x14769f5f0` | 9500–9612 | 113 |
| `AS-context-table:0x145e27690` | `0x14769f7b4` | 600–693 | 94 |
| `AS-context-table:0x145e276dd` | `0x14769f92c` | 9510–9531 | 22 |
| `AS-context-table:0x145e278cf` | `0x14769fb00` | 694–794 | 101 |
| `AS-context-table:0x145e27a19` | `0x14769fc94` | 1200–1294 | 95 |
| `AS-context-table:0x145e27a42` | `0x14769f984` | 100–194 | 95 |
| `AS-context-table:0x145e27a6e` | `0x14769fe10` | 1500–1511 | 12 |
| `AS-context-table:0x145e27dfa` | `0x1476a02f0` | 1590–1594 | 5 |
| `AS-context-table:0x145e2809d` | `0x1476a0468` | 1000–1494 | 495 |
| `AS-context-table:0x145e28131` | `0x1476a0304` | 306–394 | 89 |

All ten remain constituents of existing #64/#65 after application. The source-first action is to map current entry admission, selected descriptor/name/type/rank/display values, miss versus valid-empty-name handling and actual reply/recipient consumers to the retained finite query contract. Preserve #201's prefix-reader repair. Table length or a moved successor does not independently demonstrate a new template or a source defect. Generic string formatting, allocation, packet engine and VM internals stop at the required AS interface.

The other four initially proposal-only tables are the four geometry candidates listed above; they too are now applied. Their current dependency applicability remains separate from the completed historical classification. No AS-context table remains proposal-only in the current publication. Application or an unchanged case vector does not establish semantic equivalence with 0.127.

## Every other current context

The machine review contains all 48 exact applied `AS-context-table:<site>` records, including every context without predecessor geometry. The following source families give those records explicit existing owners and a bounded next action. The source receipts include the actual inspected interfaces; these are candidate current counterparts unless a narrower proof is explicitly cited.

| Current family / table count | Existing finding owner | Source seam and missing current contract |
| --- | --- | --- |
| Screen/menu dispatch / 1 | #128 | Existing menu actions/page state; map actual transition input and selected screen consumer. |
| Inspection / 3 | #299 | Party/profile and Armory item/set consumers; recover inspected subject, item-kind input, recipient identity and live snapshot delivery. |
| Codex / 3 | #73 | Existing catalog/localized growth text/Details; retain bounded historical formatting and recover current producer/dependencies. |
| Armory / 6 | #123 | Existing input/build/details, `SetTip` and gear save model; identify actual item/operation tags before assigning new gear semantics. |
| Picker / 1 | #77 | Existing picker/name/selection/preview; identify its actual action rather than assigning updater or Enhancement from neighboring context. |
| Talent dispatch / 1 | #148 | Existing talent catalog/normalization/effect state; type the current selector. Enhancement #305 remains independently owned. |
| Route / 1 | #151 | Existing forwarding interface; map exact current input and routing result. |
| Trust / 1 | #186 | Existing admission/identity validation; recover the selected input and consumer before alleging a trust defect. |
| TCP / 1 | #152 | Existing framing and pump/send/receive/close lifecycle; identify the concrete state/error boundary and stop generic I/O. |
| Gear / 3 | #92 | Existing rank/equipment normalization and query seam; establish actual incoming type and selected consumer. |
| Shared command dispatch / 2 | #63/#154 | Existing command admission and application; distinguish ordinary engine packets, queries and co-op controls. |
| CreatureQuery / 13 | #64/#65 | Retained metadata and reply path; the ten initially unpaired selectors and three geometry candidates retain separate correspondence dispositions after application. |
| Party dispatch / 5 | #63/#154 | Existing local requests, message codecs and session state; map current producer/niche/consumer and preserve historical cleanup roles. |
| Save / 2 | #146 | Existing load/schema/allocation paths; identify selected field/value consumers before naming a changed save operation. |
| Hazard action / 1 | #149/#294 | Existing native action and hazard consumers; preserve the historical Mark repair and recover current selected tags separately. |
| Demons / 2 | #138/#24 | Existing summon, target and attack state; Nathrezim identity/model/scale requires its independent current data/consumer proof. |
| Service event / 1 | #197/#198 | Existing event codec, pump consumers and reliable relay; keep typed local service events separate from relay wire tags. |
| Localization / 1 | #142 | Existing lookup/label/format and catalog; identify current key/value input and consumer, then stop generic string/map internals. |

Only inspection table `0x14030aa18` shares an exact owner with the retained [current native query review](native-frontier-0.139.0.md): `0x14030a950`. That query supports a partial ranked item/appearance tooltip consumer, but its raw slice omitted this external table. This review verifies the five cells and guard independently; it does not claim complete tooltip branches, subject identity or a source connection. No other current helper classification is transferred merely from nearby diagnostics or geometry.

The 28 predecessor AS context tables without current geometry remain historical correspondence questions. Their absence from this structural join does not erase the prior seven bounded dispatch roles, mixed zone-catalog lookup, source repairs or their explicit limits. Those retained conclusions keep their original targets and owners.

## Limits

No new distinct finding is required by the reviewed evidence. Every actionable current question has an existing feature or module finding; #41 owns the wider discovery/accounting frontier without replacing those owners. No native query, Program mutation, edge application, gameplay source change, compilation, client/game/network/server execution or original/rebuilt comparison was performed for this source review. Exact table bytes, source receipts, bounded instruction context, recovered semantics, connected implementation and parity remain separate evidence levels.
