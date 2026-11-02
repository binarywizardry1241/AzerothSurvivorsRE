# AS candidate discovery — 0.119.1

Selected installed EXE: **145,374,208 bytes**, SHA-256
`b3b5d86b06b95fd24f66697c023c196bac9687673905dcf03c000b31cc8d073c`.
The configured EXE/Data are read-only inputs. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own permanent findings; the [unknown queue](unknown-recovery-0.119.1.md)
owns exact residual selectors and next static actions.

## Discovery and retained recovery

The [whole-image delta](evidence/0.119.1/discovery-delta.json) records one new
AS diagnostic path, `crates/wenilla-rogue/src/coop/trust.rs`, bringing the known
population to **61 AS / 762 total diagnostic paths**. The new path is an
ownership lead, not proof that every surrounding instruction belongs to trust.
Its guest Engine callback has partial source correspondence through
`gameplay/coop.rs::guest_engine_packet`; the missing current transformation
is a separate finding **#186**. The three supplied release entries retain
their own findings **#183–#185** in the [release review](release-review-0.119.1.md).

The complete regex-candidate population remains **2,132**, across seven
nonempty categories. Binding, UI/Lua, resource, save-key and textual-ID literal
sets are unchanged. Four packed engine namespace suffixes changed. Their
[source-first context](evidence/0.119.1/engine-namespace-context.json) retains
the existing benilla UI-action, asset-loader, terrain-placement and portal
interfaces and stops those generic branches. Packed suffix changes establish
neither an engine behavior change nor a concrete additional AS dependency.
The source baseline remains benilla `0367a2c2`; available source does not
establish the EXE's compiled revision or equivalence.

The exact [embedded addon API](evidence/0.119.1/embedded-api.lua) is
`[0x1472d77f0,0x1472db909)`, **16,665 bytes**, SHA-256
`a0066d2d6356e9f21fe4544e600def13887047a6608bb588cd6c27859b78ccc5`.
Its boundary excludes adjacent packed constants. All ten configured MPQs
retain the prior hashes; the [member proof](evidence/0.119.1/mpq-member-coverage.json)
checks **29,699 active slots / 29,690 names** and all **315 resource candidates**.
Equality does not establish native resource mounting, lifetimes, rendering or
addon producer/consumer equivalence.

The [current data join](evidence/0.119.1/data-classification/manifest.json)
examines all **4,034,084 Ghidra references**, **3,922,896 declared encoded
references**, **14,773 complement references** and **637,214 relocation records**.
It retains 113 string containers and all 2,132 candidates. Source literal
matches occur for 938 candidates; direct Ghidra, encoded, relocation and
container-reference hits occur for 20, 104, 400 and 396 candidates respectively.
These populations overlap and do not establish schemas or semantic ownership.
The ReputationFrame resource now also points to the retained #181 AS source
append; this source-classification change reflects that implemented repair,
not a newly discovered native behavior or a current parity claim.

[Incremental correspondence](evidence/0.119.1/incremental-correspondence.json)
retains prior review/classification identities and source repairs with their
actual targets. In particular, the 0.119.0 Druid, aura, locale, admission and
guest-adapter source repairs remain implemented. Their historical audit-time
source differences are not a current missing-implementation list. Current
applicability is separately pending wherever input, dispatch, state, dependency
and consumer correspondence has not been established. Byte matches, moved
addresses and unchanged resources alone do not promote those contracts.

## Exact retained AS frontiers

The [current frontier proof](evidence/0.119.1/as-discovery-frontier.json)
remaps four established selectors and their complete selected declared encoded
references, preserving the original finding identities:

| Finding / selector | Current candidate and actual source | Remaining static proof |
| --- | --- | --- |
| #98 / `Q41-I01:save_configuration_key_lead:5` | `talentxp` at `0x1472de146`, one address-forming reference; existing `talent_context::request`, active `Context` and terminal consumers. | Recover current producer, queued Value/schema, dispatch and lifecycle applicability. |
| #98 / `Q41-I01:save_configuration_key_lead:0` | Executable immediate at `0x1400ac077`, inside exact `movabs rcx, 0x7078746e656c6174` at `0x1400ac075`; existing `Context::accept` retains the active Value and wrapping revision. | Establish current guard/table and incoming resource/context semantics. The ASCII-matching operand does not identify its receiver or dispatch domain. |
| #103 / `Q41-I01:resource_path:0` | Progression-bar URI at `0x1461a0708`, three encoded reads; `Art.progress_bar` and `bar_flow` exist. | Follow native producer → handle → live bar consumer, stopping at the existing image-loading interface. |
| #104 / `Q41-I01:resource_path:4` | Gold-dragon URI at `0x1461af6ac`, two encoded reads; `Art.dragon` and `achievements_sidebar::draw` exist. | Prove the current native handle/sidebar connection; retain rendering/parity separately. |
| #101 / `Q41-ITEMTEXT01` | [Unique current interner candidate](evidence/0.119.1/item-registry-frontier.json) at `0x145b5fbb0..0x145b5fdb2`, actual lock operand targeting `0x14851a910`, thirty selected declared/complement references. | Establish current applicability of retained interner/query/receive/decoder/lookup contracts. An alternative guest text producer/carrier still needs a concrete lead; do not repeat the recovered ordinary decoder without an affected dependency. |

These are candidate/reference/source observations. They do not recover every
schema, handle lifetime, computed writer or failure path. #101 retains its
0.119.0 blocked producer/carrier boundary, rather than restarting from the
already recovered ordinary item decoder or inventing a wire extension.

## Bounded current native/source reviews

The [review input](evidence/0.119.1/as-discovery-reviews.json) selects **eight
bounded reviews / eight distinct raw full-PE Ghidra results**: seven from the
[nine-result co-op proof](evidence/0.119.1/coop-disconnect/manifest.json), plus
the [current CreatureQuery table-role query](evidence/0.119.1/guarded-creature-query-correspondence.json).
Exact query, result, source and original Evidence/profile commitments pass
admission; this composition runs no new query. Eleven canonical native ranges
and the complete nine-cell trust table remain in that owning proof rather than
being duplicated here.

| Finding / current review | Actual source comparison | Next static work |
| --- | --- | --- |
| #184 / selected-relay closed/alive helpers and frame continuation | The frame retains an admitted party across a primary lobby failure while its selected party relay holds. `transport_closed(false)` still destroys both workers; `Session::service_lost/connected` clears or gates relay liveness. | Repair this separation through the existing directory/session/run owners, preserving actual relay loss, explicit Leave and presentation lifetime. The independent summary remains #183. |
| #185 / actual guest removal | Current dead-transport and explicit-close routes reach the selected peer remover, hero abandonment and roster publication. Existing `Session::tick`, `PartyServer::disconnect` and membership consumer retain those interface owners. | Rebind deeper hero/health/projection dependencies and later validate real delivery/timing. No new source defect is established in this bounded preserved branch. |
| #186 / trust owner and guest delivery | The current receiver invokes the exact name/chat transform after mode/sync/opcode-length/active-port admission and before Engine delivery. Actual `guest_engine_packet` preserves admitted bytes; tag11 resource sanitization is a separate consumer. | Resolve remaining required helper edges and implement the recovered `0x51`/`0x96` transform at this existing boundary, preserving every guard, malformed fallback and suffix. |
| #163 / exact-version admission | Native protocol 5 / length 7 / `0.119.1` admission differs from the shared `GAME_VERSION = "0.119.0"`. | Update the shared outgoing/incoming constant and fixed wire fixture in a selected repair. Wider packet/lifecycle contracts remain distinct. |
| #64/#65 / thirteen CreatureQuery table roles | A current owner query identifies the selected mixed gear/server-party context as opcode `0x60` template-entry dispatch. Existing `coop_commands` → `creature_queries` → catalog/SPECIALS → protocol/cache source is retained. | The thirteen exact current/prior table selectors remain individually pending for admitted payload/entry producers, destinations, native fields/locale and source correspondence. Mixed diagnostic context does not assign the whole owner to gear or party logic. |

One selected removal interface is source-connected, one CreatureQuery role has
partial source-interface correspondence, and six review scopes expose three
distinct source differences (#184, #186 and #163). Review scopes overlap
and are not six separate defects or whole-module recovery. Thirty-six bounded
original-instruction relay-liveness cases support that predicate only; actual
network/source execution and original/rebuilt parity remain unverified.

The [fourteen explicit table questions](evidence/0.119.1/computed-correspondence-frontier.json)
retain thirteen prior CreatureQuery selectors under #64/#65 and the Codex
discriminant under #17/#73. The [switch proposal proof](evidence/0.119.1/native-switch-proposals.json)
keeps all 3,673 proposals separate from the exact 2,574 tables applied to the
selected census. None of these fourteen proposal edge sets is applied there;
guard admission and candidate correspondence do not establish complete case
destinations or producer/source semantics. They refine existing questions and
do not establish newly introduced behavior or additional gameplay defects.

## Selected graph and module populations

The [canonical register](coverage/as-discovery.json) commits one immutable
target/input/query/source-bound profile with **10,237 nodes / 56,659 edges**,
**2,518 pending queue entries** and **eight bounded reviews**. The graph contains
2,132 embedded candidates, 113 containers, 5,466 selected static-reference sites,
855 flow-body contexts and 1,438 source-file observations. Those are structural
and review units, not counts of recovered AS functions. The fifteen explicit
native questions consist of the retained item-registry boundary and fourteen
individual current/prior table correspondences. Four embedded finding
attributions remain pending as described above.

| AS-only module measure from the verified connection ledger | Result |
| --- | ---: |
| Known modules with partial reconstructed source | 100% — 61/61 |
| Modules with registered current-target bounded recovery contracts | 3.3% — 2/61 |

The [module register](module-contracts-0.119.1.md) links every missing current
contract to its individual finding. The two registered scopes cover trust and
server-party only; substantial work can remain in either module. The remaining
fifty-nine registrations are current-target applicability/recovery-proof work,
not fifty-nine absent implementations. Prior contracts and source repairs remain
retained. These module counts do not measure AS code decompiled, implemented or
matched.

## Six discovery stages and proof boundary

The current [native census](native-census-0.119.1.md),
[data manifest](evidence/0.119.1/data-classification/manifest.json) and
[graph/queue register](coverage/as-discovery.json) bind the selected populations.
All six stages are performed within these explicit bounds; all remain
semantically partial.

| Stage | Bounded audit work | Exact remaining work |
| --- | --- | --- |
| 1. Candidate graph beyond filenames | Current embedded/container, reference and source candidates, sixty-one module contexts and explicit reviewed/pending findings. | Classify unnamed/interior/inline/mixed regions, further registrations and AS data consumers. |
| 2. Resumable frontier | Target/input/query/result-bound reviews and exact pending selectors; prior issue identities and recovered source retained. | Continue the queue's required input/dispatch/state/consumer/failure branches; map historical applicability before redoing recovery. |
| 3. Indirect connections | Current computed/reference populations and selected cooperative source boundaries are kept separate from proved edges. | Prove incoming register/index domains, callbacks/vtables, mutable pointer writers and lifetimes. Initial encoded pointers are not observed calls. |
| 4. Data through consumers | Complete candidate/container and code-reference joins, selected co-op fields/transforms and four renewed data-frontier mappings. | Recover remaining numeric IDs, widths, bounds, serializers/parsers and actual consumers; regex/pointer-length observations do not establish schemas. |
| 5. Unassigned code/data | Whole-file/linear/complement/Ghidra residual selectors plus prior completed site-role/computed classifications and their current applicability questions. | Correlate old classified roles before assigning new unknown meaning; classify residual groups by references, tables, registration and shared state. |
| 6. Source comparison/findings | Separate release findings #183–#185, trust #186, retained #98/#101/#103/#104 and individual missing module contracts. | Recover or implement each selected dimension independently; missing applicability proof is not absent implementation. |

No global frontier exhaustion, complete AS semantics/source closure or parity
is claimed. Graph, queue, module, instruction and reference populations use
different units and overlap; they cannot be summed into a percentage of AS
code recovered or implemented.

No application compilation, compiling test, client/game/network/server run,
save/configuration mutation or controlled original/rebuilt comparison occurred.
Movement/camera, UI/input/graphics, audio, file effects and failure comparisons
remain separate evidence levels. Full cooperative source remains in scope
without operating a server, relay or directory service.
