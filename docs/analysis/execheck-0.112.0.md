# EXE sweep and rebuild connections — 0.112.0

Selected installed target: **0.112.0**, 140,514,816 bytes, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[Identity/resources](target-refresh-0.112.0.json), [native census](native-census-0.112.0.md)
and [verification-needed](../verification-needed.md) own target identity, native limits and
permanent gaps. The eleven absent feat predicates identified by this sweep
are now connected by the [current grant repair](achievement-grants-0.112.0.md)
under **#19**. Whole-system completeness and original/rebuilt parity remain unverified.

## Complete file and native passes

The [structural review](evidence/0.112.0/execheck-structure.json) reproduces the
complete 140,514,816-byte scan: six PE sections, 347,158 unwind records,
631,683 nonpadding relocations, 420 imports, no exports and 725 diagnostic paths
(53 custom, 672 engine/other). All mapped sections and embedded candidate classes
are reviewed. The candidates include 328 game-binding identifiers, 182 Lua
function declarations, 336 Lua/UI registrations, 906 module/type names, 304
resource paths, four configuration leads and two textual ID assignments.
Strings, labels and address-shaped constants remain leads.

Diagnostic decoding verifies 17,675 references across 5,945 candidate extents.
All 347,158 declared extents are byte-revalidated and decoded: 23,034,418 linear
instructions / 93,131,802 bytes, without an undecoded suffix. The freshly traced
complement partitions all 5,077,188 executable bytes outside those extents;
68,925 candidate instructions / 296,199 bytes are decoded. Linear decoding,
metadata extents and actual Ghidra flow ownership remain distinct.

REA's PE-resource parser reads all 18 resource directory entries and eight
payloads: seven RT_ICON images and one RT_GROUP_ICON, language 1033. Every group
reference resolves to a payload of the declared size. Payload hashes and edges
are retained; actual image decoding, language fallback and shell/window
rendering were not exercised.

The [fresh comprehensive census](evidence/0.112.0/execheck-native-census.json)
completes all 453,137 disassembly roots and all **418,268 requested function
starts**, repairing every requested body. Its **22,505,703 instructions /
90,103,623 bytes** are independently checked against installed bytes with
Capstone 5.0.7. It records 420,696 native functions, 473,698 body ranges,
3,901,941 Program references and 420 externals. All 2,365 observed direct-call
helper targets and all 787,306 direct native CALL pairs have destination owners.
There remain 6,516 CALL source sites and 788,846 Program-reference source records
outside observed bodies; no ownership was forced onto failure blocks.

The [input review](evidence/0.112.0/execheck-native-inputs.json) binds the exact
plan, original input producers and separate current launch tools. The complete
queue retains validated guarded tables, diagnostic/address-code roots, PE and
unwind entries, import thunks and direct-call helper discovery. The current
metadata/import proofs add eighteen function starts beyond the preceding
supporting profile. Its [original census](evidence/0.112.0/full-native-census.json)
and downstream classification keep their actual 22,505,006-instruction /
420,680-function parent; they are not relabeled as products of this fresh pass.

The fresh Ghidra union leaves **8,105,367 executable bytes unobserved**:
4,960,444 inside declared extents and 3,144,923 outside. Mixed/unclassified
bytes account for 4,592,712 inside and 51,004 outside; padding candidates are
not proved noncode. The 70,420 computed calls and 139,585 computed jumps retain
unresolved dynamic targets or semantics. These limits remain **#41**, not newly
demonstrated gameplay defects.

## Operands, pointers and residual leads

The [fresh operand audit](evidence/0.112.0/execheck-native-operands.json) inspects
all 22,505,703 verified instructions and retains 664,549 explicit static
operands: 490,902 LEA address expressions and 173,647 fixed-memory operands.
Every fixed-memory source/destination pair appears in the Program references;
LEA pairs remain an additional explicit domain. Pair membership does not prove
read/write semantics. Encoded access flags identify 173,008 read-only, 326
write-only, 242 read/write and 71 unspecified fixed-memory records.

There are 654,266 source-owned and 10,283 source-unowned retained operands.
All 420 import slots have owned explicit references. The audit records operands
for 43,455 initial DIR64 carrier slots, including fifteen fixed-memory writes;
initial image values do not establish later values or dynamic callees. All
523,126 relocated executable-pointer slots in the census target observed body
bytes, including 34 interior-body targets. This does not prove vtable boundaries,
callability, incoming register aliases or live runtime pointers.

The separate [AS dispatch/source-boundary review](native-dispatch-recovery-0.112.0.md)
retains 44 bounded custom tables / 438 distinct edges, all 113 immutable ability
factory descriptors, actual choice publication/accept routes and thirty scoped
computed frontiers. Those contracts and their original supporting census remain
intact. Their finite selector contexts do not close mutable record/alias domains
or certify reconstructed source execution.

The residual operand destinations include 5,962 observed instruction starts,
no instruction interiors and nine unobserved executable addresses. The nine
are unchanged from the preceding supporting audit. A bounded prefix/producer
review joins six to shared Lua VM helpers carrying `benilla-lua/src/vm.rs`
diagnostics; three remain unattributed adapter/data-format leads. No distinct
Survivors contract failure is demonstrated, so all remain under #41. Register-,
index- and segment-dependent addresses, mutable slots, producers/consumers and computed
callees still require a concrete Survivors contract and scoped recovery.

## Source review and the achievement finding

All 54 system rows (53 custom plus the shared-engine residual) and their source
correspondences were reviewed: 349 distinct correspondence files and 138 anchors.
Thirty-five distinct stale anchor lines were repaired, and qualified symbols
were normalized without changing historical evidence hashes. All 53 custom
paths have a Location-derived body lead. The fresh partition decodes all 681
custom leads: 626 have body owners and 55 remain ownerless. Of 657 Location
references, 604 are owned and 53 are ownerless; the separate 24 path-literal
references have 22 owners and two ownerless sites. Ownerless sites may be error
blocks and do not automatically identify missing systems.

The [complete 53-row connection map](coverage/exe-connections.json) supplies
every custom system's source files and anchors, native Location-derived body
addresses, ownerless sites, bounded current evidence, remaining source work and
permanent gap IDs. The readable [system map](system-coverage.md) includes the
shared engine boundary. Current contract links are distinguished from shared
census/diagnostic links; neither count certifies complete system behavior.
Historical embedded data can remain an intentional internal representation.

Forty-two rows carry directly registered bounded current contract references;
eleven need more precise current contract review. A missing direct link does
not prove missing source or changed native behavior. The inventory indexes
1,019 retained JSON documents (144 explicit current identities, 815 historical,
sixty requiring an owning manifest/review) and 134 source-included assets
(twenty-three current, 67 historical, 44 without an asset-level identity). These
provenance counts do not determine source fitness or runtime use.

The [achievement source witness](evidence/0.112.0/achievement-grant-coverage.json)
now matches the verified Rewards display catalog with the live automatic-grant
catalog: **84 entries / 1,775 points**, with no displayed key lacking a predicate.
The eleven boss feats are source-connected through exact native trigger,
eligibility, lethal attribution and incoming-history contracts in the
[grant report](achievement-grants-0.112.0.md). Ordinary conditions and normalization now have independent current evaluator/grant
evidence, including the corrected full Codex threshold142. Unrelated metadata
retains its owning provenance.

`account_progression::definitions` reads `assets/progression.json`.
`grant_account` and `grant_run_feats` retain the two production
`Save::grant_achievements` sites. Ordinary and terminal run delivery pass the
new enriched kill records and incoming-boss history into those wrappers;
the existing dated/idempotent insertion and notification order remain connected.
Gordok's three reflected shields belong to #19; #26 retains its separate `no u`
identity, now revalidated as current feat tag14.

The actual current native grant owner is `1459b5e40..1459b63a6`; diagnostic
candidate `1459ad880` is a date formatter. The independent display constructor
and unlock iterator still establish display data rather than predicate semantics.
The current grant repair independently replays predicates, snapshot admission,
lethal/incoming metadata, ordered grants, dates and repeat suppression.
No compilation, real save/game interaction, rendering or parity is established.

## Actionable recovery backlog

| Gap and scope | Exact lead / source owner | Next recovery or source step | Separate validation needed |
| --- | --- | --- | --- |
| **#19 — current feat grants source-connected** | [Current grant owner/producers](achievement-grants-0.112.0.md), all84 definitions and both live account-delivery routes. | Current ordinary/feat conditions and normalization/grant are source-connected; the full Codex threshold is142. Current terminal XP/counter/result and backend Save producers have bounded proof; XP gain preserves allocations/specs and Tester receives no Veteran bonus. Other account commands and scheduler/I/O interfaces retain their separate contracts. | Compilation, real boss feats, long-run/all-class progression, actual account/save timing and original/rebuilt comparison remain open. |
| **#41 — AS repairs and remaining native boundaries** | [Per-site contract matrix](native-dispatch-recovery-0.112.0.md), choice/Options repairs, generic effect partition and current marker/font producers. All53 connection rows and55 ownerless custom leads remain accounted. Existing benilla/wenilla is the shared engine baseline. | The demonstrated source defects are repaired. Arbitrary native instance/Vec/builder mutations and closed writer/caller ancestry remain unproved after current direct-call, constructor, publication, dataflow and guarded-domain recovery; these unknowns alone do not establish another source defect. Generic engine ownership is outside the selected AS repair. | Compilation, actual pointer/client/platform behavior, gameplay/rendering and original/rebuilt parity remain separate. |
| **#42 — raid composition and engine dependencies** | [Current raid reports](raid-native-0.112.0.md), graph/provider/consumer evidence and registered source owners. | Preserve the separately completed bounded source contracts; recover only remaining concrete whole-frame/terrain/client dependencies. Do not rerun historical addresses as current. | Compilation, composed encounters, terrain/actor lifetimes and original/rebuilt comparison remain open. |
| **#43 — boss cast presentation** | Recovered SpellStart consumer is self-only; [marker/cast report](raid-markers-0.109.0.md). | Obtain original-game observation before asserting a separate boss-widget contract, then recover its current owner if present. | Terrain/GPU, actual casts, rendering/input and parity. |
| **#12/#17/#19/#22/#24/#34/#47 and other existing owners** | Per-system current contract references and the individual [release-claim ledger](coverage/changelog.json). | Follow the row's precise remaining source work and dependencies. A current label/catalog or a static checker does not complete a compound release claim. | Each repair's compilation, real input/save/game/platform behavior and original/rebuilt comparison remain separate. |

No new permanent gap number is required. Existing #19 and #41 are expanded;
#26 and every retained closed/open issue keep their numbers and identities.

## Validation and historical observations

The [bounded checker set](evidence/0.112.0/execheck-contract-checks.json) replays
56 selected-target static/Lua commands: two addon, thirteen catalog/progression,
sixteen menu/input, twelve demon and thirteen raid checks. The separate read-only
selected-target review also passes. Affected raid contracts were replayed after
the final pickup/frame/choice adapter changes, with stable source/checker bytes.
The exact documented arguments, checker commitments and pass results are retained. These Python,
Capstone, Unicorn and interpreted Lua checks exercise recovered instructions or
source guards within their fixtures; they do not execute reconstructed Rust or
certify whole-system behavior.

The historical-range audit and connection map select the exact fresh census.
Of 12,870 distinct historical commitments, 8,223 canonical preimages are hash
verified and 4,647 are unavailable. Recovered sequences have 850 unique current
matches, 3,781 ambiguous matches and 3,592 absent sequences. Fifty-one unique
matches span complete observed native bodies; nineteen are executable ranges
without complete ownership and 780 are data/header ranges. Historical byte
matches do not revalidate callers, layouts, engine dependencies or source semantics; absent or ambiguous old ranges cannot be reused as current
addresses. Retained JSON identities, owning manifests and directly embedded
asset provenance are indexed independently from semantic validity.

Retained reconstructed-launch observations already belong to #5 (audio),
#39 (text/rendering) and #44–#46 (minimap, ChatFrame and deferred entity commands).
No additional unregistered material failure was found. They are historical
reconstruction logs, not original-EXE evidence or fresh reproductions, and do
not attribute a failure to source repaired after those launches.

Final installed identity/resource verification confirms the same EXE and all nine
MPQs. The regenerated ledger accounts for 737 claims across 166 supplied releases;
no claim is certified complete. Connection-map write/read reproduction passes,
and the native-input/operand/census/custom/history/connection tool fixtures pass
55 distinct noncompiling cases. `check-reconstruction-coverage.py` reports zero
errors and 55 open-work warnings: 54 incomplete system scopes and the absent
current atomic classifier selection. The reviewed fresh native and operand
records are selected separately from the supporting AS classifier; an older
classifier is not promoted to the fresher parent.

No compilation, compiling tests, reconstructed Rust execution, game launch, Windows
validation or original/rebuilt comparison was run for this audit.
