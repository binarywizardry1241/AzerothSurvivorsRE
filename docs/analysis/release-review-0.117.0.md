# Release review — 0.116.0 and 0.117.0

The selected installed **0.117.0** EXE is 145,283,072 bytes, SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
This report investigates every supplied release paragraph, bullet and
acknowledgement in [the original changelog](../CHANGELOG.md#01160).
The fourteen individual findings are **#108–#121** in
[verification-needed](../verification-needed.md); summaries retain their own rows without
absorbing the underlying feature findings. No intermediate 0.116.0 EXE was
supplied, so this review observes 0.117.0 and cannot attribute each byte change
to its first release.

[Curated evidence](evidence/0.117.0/release-review.json) binds exact file offsets,
preferred VAs, byte hashes, selected decoded references, release-intake source
receipts and two
completed journaled Ghidra queries. Preferred addresses are static PE addresses,
not observed runtime locations. Descriptor text and fields do not establish
successful grant conditions, networking, UI operation or parity.

`native_leads.kind` labels identify selected literal search windows; they are
not proofs of descriptor identity or complete native ownership. The original
“White Devilsaur pet” window at `0x1472c2fb0/0x1472c2fc0` contains adjacent
**Water Elemental** data. Its exact recorded references remain observations,
but that semantic candidate is rejected by the
[current descriptor/consumer follow-up](white-devilsaur-0.117.0.md).

## Release items

All implementation assessments below concern the inspected source. Native data
recovery, source implementation, static validation, compilation, application
execution and original/rebuilt parity are separate states.

| Finding | Supplied item | Current evidence and source assessment | Next static recovery step |
| --- | --- | --- | --- |
| #108 | 0.116.0 summary: engine update and friends' buff numbers | Engine provenance and existing aura override consumers are source-mapped. The exact compiled engine revision and current friendly-aura metadata lineage remain unproved. This summary has no independently demonstrated defect beyond the individual items. | Reconcile the bounded [engine lineage](engine-lineage-0.117.0.md) and #110's current producer/consumer proof; do not infer a complete engine revision from filenames. |
| #109 | Under-the-hood engine improvements | The local engine is now vendored benilla revision `0367a2c2180d777392470860693009465495a30d`, with AS overrides preserved in the [source update](benilla-update-2026-10-25.md). Current EXE strings include both benilla and wenilla crate paths, which do not identify a commit. The separately inspected candidate upstream marker/aura files are unchanged across the compared revisions. | Retain the [provenance comparison](engine-lineage-0.117.0.md), then recover only demonstrated AS interface differences; generic engine reconstruction is a separate scope. |
| #110 | Friends' buffs show AS numbers on player and party frames | Existing `gameplay/coop_overlay.rs::guest_metadata`, `benilla-app/src/local_client/spell_descriptions.rs::publish` and `benilla-ui/src/script/tooltip_aura.rs::aura_view_of` connect resource overrides to aura text. Historical #102 explicitly retained an unproved native raw-resource/cache bridge. That historical source path is not current 0.117.0 native proof, and no current incorrect number is demonstrated by this audit. | Locate the current resource producer, recipient/subject identity, friendly-aura publication and FrameXML player/party selectors; bind the bridge and first-match/fallback behavior against this hash. |
| #111 | Boss markers draw above Frost Trap, Consecration and Hurricane | Current marker ground submissions use native sort/raster 11692/32768 versus spell-ground 8192/32768 through the same shared commit. Source ground priority is corrected from -48000 to 11692; separate tower 8192/0 is preserved. | The [source/static repair](marker-order-0.117.0.md) passes 720 paint profiles, 192 emitted submissions, nine tower constructors and source/renderer guards. Actual rendering and original/rebuilt parity remain unverified. |
| #112 | Discord button and site link use the new invite | Current action 12 and its shared URL helper now bind the client destination to the exact 35-byte `https://discord.gg/azerothsurvivors`. The live Community button action in `menu.rs` is repaired; the website clause remains unverified. | Client source/static work is complete; see the [bounded proof](#discord-client-destination-112). Actual input/OS opening, compilation and original/rebuilt parity remain unverified. |
| #113 | 0.117.0 summary: fourteen party feats and rewards | The selected package is source-connected through the owning #114–#119 reports: current predicates/category/unlocks, shared recipient context, cooperative history, looks/tabard/companions, United Front and White Devilsaur. The summary remains a separate compound claim. | Dedicated current native/source checks own each bounded contract; this intake report does not promote old source snapshots or certify compilation, real party delivery, persistence, rendering or parity. |
| #114 | Co-op tab, fourteen named feats, credit to every member | The [achievement repair](coop-achievements-0.117.0.md) connects fourteen exact definitions / 495 added points, six categories, typed party/run/history predicates and ordered unlock rows; the combined page has 98 achievements / 2,270 points. Shared context and recipient saves are owned by #157. | Constructor/category/unlock, composition, history and run-predicate instruction checks pass in the owning report. Compilation, actual UI/party execution and original/rebuilt parity remain unverified. |
| #115 | Cooperative zone victories persist across runs | The [history repair](coop-history-0.117.0.md) connects the separate account-wide `coopbeat\|` family, exact twelve-zone lookup, sorted/deduplicated persistence and won-plus-context writer to account predicates. Solo per-class clears stay independent. | Current parser/collector/formatter/source checks and the isolated zone-key replay pass. Real Save I/O, multi-run delivery and parity remain unverified. |
| #116 | Seven hats/cloaks and Contest Winner's Tabard | The [reward repair](party-rewards-0.117.0.md) composes all fourteen cosmetics and twenty-one ordered tabards, including 90108–90114 and earned-only 90025, through reward gates, gear/look projection, item/query metadata and appearance consumers. The distinct slot validator is #156. | Descriptor/native construction/admission and source checks pass. Actual selection, cache/MPQ appearance loading, rendering, persistence and parity remain unverified. |
| #117 | Ancient Protector, Mini Herod, Mini Nefarian, Mr. Bigglesworth | The [reward repair](party-rewards-0.117.0.md) connects the twenty-six-entry companion registry, earned-gated saved slots, selection, remote profile and existing actor consumers. Current creature-query metadata includes 9623–9626. | Exact descriptor copies, lookup/earned-slot and source checks pass. Historical movement/collection contracts retain their provenance; actual client/cache/actor execution and parity remain unverified. |
| #118 | United Front gives permanent +10% co-op luck | The [United Front repair](united-front-0.117.0.md) connects earned `coop:team` to f32 0.1 through local grants, the current Hero codec/bootstrap and per-hero state. Shared-mode full and callback refreshes add it once after ordinary stats; solo mode skips the addition. | Current native/source checks and 1,024 isolated mode/f32 cases pass; current admission preserves the raw grant. Compilation, live stats/party/persistence and parity remain unverified. |
| #119 | Free White Devilsaur switch replaces hunter wolf/raptor | The [White Devilsaur repair](white-devilsaur-0.117.0.md) connects the Hunter-only point-free flag, earned gate, codec/spec/profile state, exact tree switch/details and actual first-Raptor/provenance removal plus Wolf-to-9530/9531 transformation before existing pet/cache consumers. The adjacent Water Elemental candidate remains rejected. | Nineteen additional current spans, 28 retained query receipts and focused descriptor/data/source/syntax checks pass. Compilation, real UI/save/pet behavior, measured combined damage and parity remain unverified. |
| #120 | Armory’s long Look list scrolls | [Current recovery/source](armory-looks-0.117.0.md) binds the exact Look parent, 4px scrollbar row, wrapping/retained `armory-looks` viewport and actual scrollbar target. Both live source callers now use the recovered shrinkable/clipped layout. | Source/static repair complete: six poison-seeded Node captures, four journaled Ghidra queries, source tracing and Rust syntax parse pass. Compilation, actual layout/input/retention/DPI and original/rebuilt parity remain open. |
| #121 | Achievement acknowledgement | The supplied `notes: thanks **@DK Waiting Room** ...` line is preserved verbatim. It is release context with no executable behavior or demonstrated defect. | No native recovery obligation; keep the independently numbered provenance item and its non-executable status. |

## Discord client destination (#112)

The current dispatch at `0x1401467d4` reads the action byte and resolves a signed
relative entry from `0x146180e60`. Entry **12**, at `0x146180e90`, selects
`0x140146bac`: EDX becomes **35**, RCX selects `0x14617eef4`, and the branch joins
the call at `0x140146c65` to `0x14013fc50`. The exact destination interval is
`[0x14617eef4,0x14617ef17)`. The helper selects the eight bytes `explorer` and
forwards the original destination pointer/length into its command-argument path.
Recovery stops at that existing platform-opening interface.

The source route is `MenuPlugin` → `community_button`/`Action::Community` → the
pressed, enabled button input → the existing platform command with one destination
argument. Controller activation uses that same button interaction route. Its only
client invite literal now matches the current native bytes. The retained Support
action and historical target-specific invite evidence keep their own contracts.

`discord_invite_repair` in the [canonical evidence](evidence/0.117.0/release-review.json)
records six exact instruction/table/command spans, the prior/current source hashes
and the two journaled Ghidra input/plan/result receipts. The full menu raw import
cannot resolve its omitted jump table, and raw imports infer the ABI; the original
PE instructions and signed table entry establish the selected Windows-x64 branch
and argument boundary independently. No full menu, process subsystem or module
completeness follows from this bounded contract.

The existing release checker verifies the exact native destination, dispatch,
shared call, source replacement and query receipts. Client source/static work is
complete. The external website has no supplied source or inspected deployment;
its link remains unverified. Compilation, real button/OS-opener execution and
original/rebuilt parity remain unverified. No URL was opened.

## Fourteen achievement data leads

The following conditions are **English descriptor text**, extracted verbatim
from the selected hash. They are not a substitute for decompiling actual
eligibility, kill attribution, party distribution or persistence consumers.
Every name, full description and key has an exact range/hash in
`achievement_text` in the evidence file. The constructor's reads are independently
decoded from its current unwind start.

| Key after `coop:` | Name | Descriptor condition |
| --- | --- | --- |
| `together` | Better Together | Complete your first zone in co-op. |
| `fiveofakind` | Five of a Kind | Complete any zone in co-op with all 5 players using the same class. |
| `photosynthesis` | Rest in Photosynthesis | Defeat Kel'Thuzad in co-op with 5 Druids, all talented into Tranquility. Tranquility must deliver the killing blow. |
| `odds` | Against All Odds | Complete any zone in co-op with all four enemy difficulty modifiers at maximum. |
| `brotherhood` | The Brotherhood Falls | Defeat Edwin VanCleef in co-op with 5 players, all using different classes. |
| `bump` | Things That Go Bump in the Night | Complete Duskwood in co-op without any player dying. |
| `team` | For the Team | Complete Warsong Gulch and Arathi Basin in co-op. |
| `jurassic` | Jurassic Pack | Complete Un'Goro Crater in co-op with 5 Hunters. |
| `smoothie` | Hakkar Smoothie | Defeat Hakkar in co-op with 5 Warriors, all talented into Bladestorm. Whirlwind must deliver the killing blow. |
| `holyframe` | Holy Frame Drops | Defeat High Inquisitor Whitemane in co-op with 5 Paladins, all having Consecration as their highest-ranked spell. Consecration must deliver the killing blow. |
| `dragonslayers` | Dragonslayers | Defeat Azuregos and Nefarian in co-op. |
| `totemly` | Totem'ly Balanced | Defeat Nefarian in co-op with 5 Shamans, all having Magma Totem as their highest-ranked spell. Magma Totem must deliver the killing blow. |
| `oldgods` | The Old Gods Have No Friends | Defeat C'Thun in co-op with all four enemy difficulty modifiers at maximum. |
| `end` | Together, To the End | Complete every zone in co-op, across any number of runs. |

## Reward descriptors and resource boundaries

The seven new cosmetic rows occupy `[0x1461a97b8,0x1461a9978)`,
`[0x1472c95e0,0x1472c97a0)` and `[0x1475caf80,0x1475cb140)`.
Their pointer/length strings, IDs, display fields, inventory types and slots
agree across those three copies. This checks the selected new rows, not the
complete population or the runtime table-selection mechanism.

| ID | Appearance | Achievement gate | Display | Inventory / slot |
| --- | --- | --- | --- | --- |
| 90108 | Admiral's Hat | `coop:together` | 18872 | 1 / 0 |
| 90109 | Bloodsail Admiral's Hat | `coop:fiveofakind` | 35174 | 1 / 0 |
| 90110 | Cape of the Brotherhood | `coop:brotherhood` | 22998 | 16 / 14 |
| 90111 | Embrace of the Lycan | `coop:bump` | 18392 | 1 / 0 |
| 90112 | Whitemane's Chapeau | `coop:holyframe` | 16224 | 1 / 0 |
| 90113 | Cloak of the Brood Lord | `coop:dragonslayers` | 28891 | 16 / 14 |
| 90114 | Cloak of the Devoured | `coop:oldgods` | 35139 | 16 / 14 |

The Contest Winner's Tabard is **90025**, display **31676**, icon
`INV_Shirt_GuildTabard_01`, cost **0**, gate **`coop:odds`**. Its 64-byte
records begin at `0x1461adc60`, `0x1472c8e20` and `0x1475c99f0`.
The reused optional gate slot must be followed into the current admission
consumer; historical field names such as `zone` do not prove current semantics.

The new companion records occupy `[0x1461aaa18,0x1461aab98)`,
`[0x1472d0a38,0x1472d0bb8)`, `[0x1475caa78,0x1475cabf8)` and
`[0x1475d6848,0x1475d69c8)`. All five string pairs and three scalar fields
agree across all four copies for each row.

| Key | Companion | Achievement gate | Display / creature | Scale |
| --- | --- | --- | --- | --- |
| `ancient_protector` | Ancient Protector | `coop:photosynthesis` | 2429 / 9623 | `f32` 0.17 |
| `herod` | Mini Herod | `coop:smoothie` | 2041 / 9624 | `f32` 0.5 |
| `nefarian` | Mini Nefarian | `coop:totemly` | 11380 / 9625 | `f32` 0.065 |
| `bigglesworth` | Mr. Bigglesworth | `coop:end` | 16622 / 9626 | `f32` 1.0 |

The [current MPQ member proof](evidence/0.117.0/mpq-member-coverage.json)
independently inventories the tenth archive, Patch-A: a Cat model, ten Cat
textures, three cape textures and four ContestPVP tabard textures, plus its
listfile. These are relevant resource leads for #116/#117. Matching names and
archive membership do not establish selected display IDs, texture application,
rendering, historical asset changes or successful live consumers.

## Independent source and recovery findings

**#156 — Contest Winner's Tabard slot admission.** The initial intake diagnosis
that `tabard|` purchases must admit 90025 was incorrect. Current
[tabard admission recovery](tabard-admission-0.117.0.md) proves that 90025 is
intentionally excluded from purchased records because its descriptor carries
the earned key `coop:odds`. Ownership comes from that key; the selected class
can retain `look|class|18:90025`. The actual source defect was the shared Armory
validator's upper bound of 90024. It now admits 90025 only in paperdoll slot 18
and only with the supplied authority inventory. The separate #160 purchase
correction uses exact descriptor/null-gate admission and also excludes gated
90016. Dedicated native/source checks own these contracts; real persistence,
display and parity remain unverified.

**#157 — Shared party context and recipient account delivery.** The
[producer](party-achievement-producer-0.117.0.md),
[State15 codec/admission](party-achievement-wire-0.117.0.md) and
[recipient delivery](party-achievements-0.117.0.md) connect the actual route.
State15 carries optional current members, shared lethal-event member snapshots,
death count and modifier flag. Each admitted recipient evaluates those facts
against its own account and reuses the dated/idempotent Save writer, including
a recipient whose private history does not own the killing blow. No new
achievement-key packet, direct EventBytes9 grant or speculative End18 save is
introduced. Native/static source connections pass; actual network/client/save
execution and original/rebuilt parity remain unverified.

## Source-first boundaries and verification

The source counterparts reuse existing account/save, menu, item/cache, actor,
combat, effect and engine APIs. The selected #113–#119 source/static work is now
owned by the reports above; their formerly unresolved predicates, shared
recipients, cooperative history, earned metadata, run-luck and Hunter switch
questions must not be repeated as missing merely from this intake snapshot.
The separately repaired marker and Look interfaces are owned by #111/#120.
The friendly-aura native bridge (#110), website clause of #112 and broader
native/shared-engine boundaries retain their separate current findings.
Dedicated recovery stops at the necessary AS interface; neither these repairs
nor this overview establish complete engine or whole-system equivalence.

Original release-intake work (retained provenance):

- Rehashed the installed EXE before reading the selected ranges and compared
  all fourteen supplied lines against their separate evidence entries.
- Verified all 42 achievement name/description/key spans and seven additional
  selected literals directly against the current PE.
- Checked 21 new cosmetic, 16 new companion and three new tabard records;
  each selected row's semantic fields agree across its retained copies.
- Independently decoded all **109 selected RIP-relative LEA observations**
  from their current unwind starts. This is a bounded reference search, not
  a complete graph or indirect-call census.
- Completed two journaled REA/Ghidra raw-slice queries, totaling 1,209 original
  file bytes, with target/extraction/plan/result/profile commitments.
  The `coopbeat` parser slice supports its literal/comma parsing. The United
  Front slice supplies bounded name-consumer context and does not resolve the
  numeric run-stat producer. Raw import omits surrounding PE/data/external
  callees; its inferred ABI and variable types remain uncertain.
- At intake, inspected the then-current source/catalogs without modifying gameplay code. Historical
  0.112.0/0.115.0 native checkers were inspected for layout/ownership guidance;
  their old target assertions prevent treating them as 0.117.0 validation.

The completed Discord-scoped intake replay is
`python3 -B scripts/check-release-review.py --discord-source-only --require-retained-queries`.
It passes 95 current native spans, the one Discord source receipt, fourteen
exact note mappings, forty selected reward records, 109 LEA byte/unwind-owner
checks, Discord action/argument/source checks and four retained Ghidra receipts.
These original populations are unchanged. The release evidence's eighteen
`source_receipts` are **release-intake snapshots**, not current receipts for
the subsequent feature repairs. Omitting `--discord-source-only` attempts to
replay those exact historical source bytes and can fail after intended source
changes; no all-eighteen current-source result is claimed. The focused feature
manifests/checkers above own the new source and static assessments.

The earlier Capstone whole-owner decode is separate from the portable byte
check. Without `--require-retained-queries`, unavailable local query payloads
are reported as not run; their absence neither invalidates direct EXE/data
checks nor certifies the unavailable receipts.

No Rust compilation or compiling tests, original/rebuilt application launch,
cooperative server/service operation, real interaction/render/audio/persistence
execution or controlled original/rebuilt comparison was performed by these
repairs. Their source/static completion does not certify those evidence levels.
The [current-target coverage](reconstruction-coverage.md) and unknown queue own
the whole-image and broader AS recovery limits.
