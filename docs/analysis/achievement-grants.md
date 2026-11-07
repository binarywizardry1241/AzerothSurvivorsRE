# Current achievement grants and account delivery

Bound to installed **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
Current implementation status belongs to [verification-needed](../verification-needed.md).
The eleven missing automatic predicates from #19 now join the live catalog,
bringing it to the same **84 entries / 1,775 points** as the independently
recovered [Rewards display catalog](rewards-catalogs.md).
All current ordinary condition payloads, evaluation and account normalization
and the terminal XP/counter/save route are independently revalidated below.
The [0.100.1 report](account-progression.md)
remains the historical recovery record; unrelated progression/reward metadata
keeps its owning provenance.

The current grant owner is `1459b5e40..1459b63a6`. The earlier diagnostic
candidate `1459ad880` is a date formatter, not the grant dispatcher. Its two
actual callers are `1458b076b` and `1458b0c75`; snapshot construction is
`1458c02a0`. The [checker](../../scripts/check-achievement-grants.py)
reuses the canonical current constructor and executes original grant, set,
date, lethal-record, incoming-history and eligibility instructions against
synthetic typed memory. [Native vectors](evidence/0.112.0/achievement-grants/native-vectors.json),
[canonical instructions](evidence/0.112.0/achievement-grants/selected-native.asm)
and [bounded Ghidra provenance](evidence/0.112.0/achievement-grants/ghidra.json)
retain the exact range commitments and analysis limits.

| Key / boss ID | Native feat variant | Lethal-hit predicate |
| --- | --- | --- |
| `herod` / 1392 | 0 | Spell 1680; source kind differs from 2 |
| `hakkar` / 994 | 0 | Spell 689; source kind differs from 2 |
| `vancleef` / 694 | 1 | Nonzero spell, Fire school 2; source kind differs from 2 |
| `azuregos` / 393 | 1 | Nonzero spell, Arcane school 6; source kind differs from 2 |
| `kazzak` / 193 | 2 | Holy school 1, including pet hits |
| `stitches` / 792 | 3 | Periodic source kind 1 and Physical school 0 |
| `nefarian` / 1094; `mosh` / 1294 | 4 | Summoned-pet source kind 2 |
| `kovork` / 1590 | 5 | The producer's melee flag |
| `gordok` / 894 | 6 | Spell 324, 467 or 20925; source kind differs from 2 |
| `cthun` / 1194 | 7 | A lethal boss record, with boss ID absent from incoming-boss history |

None of these eleven variants requires victory or a selected player class.
Variants 0/1/6 exclude source 2 specifically; periodic source 1 and passive
source 3 remain eligible. The historical kill/guardian/endless/bare/cache/reward
variants moved to native tags 8..13; pair-based `no u` is now tag 14. Their
source catalog tags follow this current native layout.

At `14593f4a6..14593f677`, a metadata-bearing boss hit with post-hit HP <= 0
appends both the existing `(boss ID, spell)` pair and a twelve-byte record:
boss ID, spell ID, school byte, source-kind byte, melee byte and padding. This
happens before generic hit/death callbacks and boss death publication. Spell
visuals 16038/14186/5308 normalize to 8349/2098/20647. Melee classification uses
the original spell: source must be 0 and either the spell is zero, or a matching
ordinary ability has Physical school, kind 2/5/7 and positive base power.
The current 113-entry table and reused source table have identical membership.
The live adapter records captured attribution before it is restored by the
synchronous/deferred/periodic hit wrappers.

Incoming owner `1458ec805..1458ec940` resolves a metadata-bearing boss source
and deduplicates its definition ID before HP subtraction and retaliation.
There is no positive post-absorb damage test at this stage: a fully absorbed
or zero admitted hit still records the boss. Earlier invulnerability/mode/
showcase exits bypass this history. History is by definition ID, persists for
the run and remains independent of damage-meter totals and actor cleanup.
This ordering prevents a reactive lethal hit from incorrectly earning the
no-damage feat during the same incoming hit. The library evaluator consumes
the history and enriched kill records; both active and terminal account
delivery pass them from the live run.

The shared actor's optional primary metadata starts at `Actor+18`, with
`usize::MAX` as its absent niche and the definition pointer at `+30`. Current
guardians explicitly initialize `+18=-1`, retaining their separate metadata
at `+58`; wards initialize both slots absent. Thus only the source `bosses`
collection supplies this contract. The native incoming scan includes retained
dead rows, as the adapter does, and excludes a removed/missing source. Current
primary entry IDs are disjoint from every ordinary/guardian and ward entry ID;
GUIDs encode those entry lanes. Counter reuse for a primary entry therefore
resolves the same definition ID. Native cases cover dead/live, missing/retired
and repeated same-entry GUIDs; history persists after later actor retirement.
The lethal producer's primary-metadata gate deliberately excludes wards and
guardians as well.

Snapshot admission still excludes wrapper state 2, selected GUID `0xffffff`,
showcase and phase zero; custom GUID `0xfffffe` is admitted. The reconstructed
caller retains its corresponding run/selection/showcase gates. The native
grant iterates catalog order, skips already-earned keys, acquires FILETIME,
converts to whole UTC Unix seconds, inserts the earned key/date and returns
the ordered new-definition list. The existing source Save path retains its
dated idempotent insertion, account flush and notification delivery order.
The existing current Rewards asset supplies the new names, descriptions,
points, icons, unlock consumers and notifications.

## Ordinary account conditions

The full current ordinary evaluator is `1459b47d0..1459b5cc5`; account grant
and normalization are `1459b6410..1459b69bc`. All 84 constructor records are
checked against the live condition definitions. Kinds 0..8 retain zone-any/
all-nine-class, class-any/specific-zone, nine full talent trees, owned gear,
best legendary fraction, Codex discovery and lifetime-counter semantics.
The current Codex denominator is **142**, so full discovery now waits for
142 entries. Half remains 71. The old 141-entry predicate could grant the full
achievement one discovery early even though the current Codex display already
uses its 142-entry catalog. This is corrected in the shared predicate asset.

The current gear iterator still produces 498 IDs; the original rarity filter
`1459ebde0` and best-class selector `1459f4ef0` recover 83 legendary IDs and
the same f32 fraction/tie behavior used by the source. Their rarity lookup
boundary supplies only the numeric rarity for actual iterator-produced IDs;
full item name/effect construction is a separate owner. Current normalization
inserts prior clears from the highest open-zone ordinal and takes the maximum
of saved lifetime runs/wins and permanent-roster totals before ordinary grants.
Its four-row and remainder roster paths both execute in the current fixtures.

**24,108** original current evaluator calls across **287** account states
passed the source contract model, followed by complete normalization, dated
grant and repeat-suppression transactions. These include each of nine classes
in each of 12 zones, all-class zone completion, all-class talent XP boundaries,
per-class open-zone boundaries, item/legendary subsets, Codex 70/71/141/142/143,
lifetime thresholds and roster lengths spanning native vector/remainder loops.
Five Codex states also check undated grants. The
[21 retained account states](evidence/0.112.0/achievement-grants/native-account-vectors.json)
are current native results, including the corrected 142-entry boundary, and
now drive the authored pure-module and Save-adapter Rust regressions. Historical
fixtures are reused only as input data; their older expected results remain
unchanged in their historical evidence directory.

## Terminal account producers

Current summary `1458b9fb0..1458bba6a` is reused from the canonical
[addon-bridge owner](evidence/0.112.0/addon-bridge/manifest.json), rather than
duplicating its Ghidra extraction. Current XP parts begin at `1458ba062`;
the delta iterator is `1459da440`, the XP-row mutation is `1458d2fe0`, and
the terminal phase/counter transaction is `1458b0828..1458b0bed`. The
[terminal manifest](evidence/0.112.0/achievement-terminal/manifest.json) binds
eight current ranges, two additional bounded Ghidra owners and the selected
instruction windows to this EXE. Historical 0.105.0/0.109.0 terminal reports
retain their original identities; their old addresses are not reused here.

The seven XP parts remain time, density-normalized kills, bosses, victory,
zone residual, run options and Veteran. Current float ordering matches
`run_progression.rs`: time/kills combine before bosses and victory; zone XP is
the residual from a rounded whole base; option contributions accumulate
density, HP, damage and speed before adding one and capping at two. Veteran
uses the base plus rounded options. The current delta iterator subtracts each
previous signed part with wrapping arithmetic. The sum also wraps, clamps
negative totals to zero and keeps its low32 bits. All seven checkpoints advance
even when that yields zero XP. The complete current XP-row owner saturates the
class's u32 total, retains an existing allocation, appends a missing row with
an empty allocation, and returns the old/new 51-point budgets.

The summary admits any started phase except wrapper state2. Its positive XP
gate excludes selected GUID `0xffffff`, independently of showcase. Permanent
character bests update before the first-result guard; a missing permanent row
allows only the matching optional row's level to change. First-result character
runs/wins wrap as u32; account runs/wins saturate as u64. The tick separately
admits changed terminal phases4/5, retains the last terminal marker through
running phases, and excludes showcase/`0xffffff` from its second transaction.
That transaction saturates five cumulative counter deltas at zero, adds them
with u64 saturation, acknowledges their checkpoints and inserts the beaten
class/zone pair in sorted unique order. Explicit summary calls do not acquire
that tick-only count delivery.

Current backend ownership is `Server+b38`: `1458ba530` calls the XP mutation
on that object and `1458ba545` saves it before bests/results; later summary
saves retain it. The counter path retains the same pointer through run feats,
ordinary account grant at `1458b1d71` and Save at `1458b1df8`. Source
`persist_run_at` uses `menu.backend_save` throughout, and `commit_account`
clones that backend into the ordered write queue. Native Save `1458d9600`
passes the received account to serializer `1458da250`, then sealing/round-trip
and write interfaces. This trace establishes the AS object and call order;
filesystem failures, engine worker scheduling and frontend ECS identity remain
the separate persistence/interface owners. The terminal replay does not execute
those interfaces or promote their historical implementation evidence.

The [terminal checker](../../scripts/check-achievement-terminal.py)
passes **3,565 contract cases / 3,667 bounded native executions**: 1,546 XP
vectors, 102 delta/checkpoints, 259 five-counter deliveries, 204 phase/admission
gates, 432 all-class XP mutations, 36 backend XP/save calls, 504 permanent bests,
36 optional-row fallbacks, 14 first-result/count cases and 432 beaten-pair
insertions. It retains compact counts/digests and ten representative XP vectors
with six arithmetic boundaries in
[native vectors](evidence/0.112.0/achievement-terminal/native-vectors.json).
This exposed a source adapter defect: `grant_terminal_xp` called the allocation
editor, which normalized the live allocation and mirrored it into the selected
saved spec. Native XP gain preserves both. The adapter now updates only the
first matching XP field, saturating at u32::MAX, or appends an empty new-class
row. It preserves the allocation payload, later duplicate rows and every saved
spec. Authored Rust regression coverage includes a live `imp_heroic:1` allocation
whose selected saved slot retains `deflection:1`, plus saturation and missing
class insertion. The native all-class cases retain whole-account/spec and
duplicate-row canaries for existing-class updates and new-class insertion.
Three additional complete current typed parser/XP/serializer cases establish
that the stale selected-slot and duplicate-row payloads survive serialization,
including saturation and missing-class insertion. Their exact before/after
records also drive the authored Rust regression.
Actual allocation edits still use their existing normalizer/spec synchronization.
All terminal XP adapter call sites use this corrected owner. Replay with
`python3 -B scripts/check-achievement-terminal.py`; `--prepare-rea`
writes the two additional Ghidra reproduction plans inside ignored runtime.

## Veteran terminal-XP input

Current factor owner `1459b70c0..1459b7487` resolves the retained Veteran rank,
reads the first talent row for each of classes1/2/3/4/5/7/8/9/11, and compares
the selected class's first-row XP against their maximum. Missing classes
contribute zero; other numeric classes and later duplicates do not affect the
comparison. A nonzero rank contributes `rank * 0.2f32` only for strictly lower
selected XP. Ties receive zero. Current typed loading clamps imported Veteran
ranks to the two current purchasable ranks. This independently revalidates the
Veteran portion of `run_progression::account_grants`; unrelated perk projections
retain their historical provenance.

The sole current caller is `1458bff49`, within run entry `1458bf6d0`. It passes
the backend account at `Server+b38` and actual selected class, then stores the
result in `Server+1150`, the current terminal-XP consumer's Veteran field.
Its preceding selected-GUID guard forces zero for `0xffffff` (the transient
Tester); custom `0xfffffe` remains eligible. The source previously applied
ordinary account Veteran grants to Tester runs too. Run entry now zeroes only
that Veteran input for the Tester before applying account grants.

The [Veteran manifest](evidence/0.112.0/achievement-veteran/manifest.json) retains
the967-byte owner,42-byte caller, exact0.2f32 data and fresh Ghidra provenance.
The [checker](../../scripts/check-achievement-veteran.py) passes1,620
complete current factor cases using native typed Save inputs, including all
nine selected/rival classes, zero/positive/import-clamped ranks, lower/tied/
higher/u32::MAX XP, empty accounts, ignored class6 and first-row duplicates.
Its81 original caller cases check GUID admission, selected-class/backend
arguments and the stored factor bits. Compact result digests are retained in
[native vectors](evidence/0.112.0/achievement-veteran/native-vectors.json).
Run `python3 -B scripts/check-achievement-veteran.py`; `--prepare-rea`
prepares its bounded current-owner Ghidra plan. No other perk system is promoted
by this proof.

Static validation passed **3,808 predicate combinations**, **99 retained
native-derived Rust fixtures**, **1,808 lethal attribution cases**, **54
snapshot eligibility cases**, **16 incoming histories**, full-catalog ordered
grant/date insertion and repeated-grant suppression. The canonical Rewards
check also passed 420 display fields and all 84 records. Source Rust parsing
uses the installed project rustfmt without compilation. Authored Rust
regressions cover all retained predicate fixtures, direct/pet Frostbolt
attribution and all three shield spells through the live retaliation adapter;
they have not been compiled or executed.
Twelve original constructor metadata-write cases and 32 source-history
cases additionally establish the actor category/dead/retirement boundaries.

Replay with `python3 -B scripts/check-achievement-grants.py`. To prepare
fresh Ghidra inputs, use its `--prepare-rea` option and run the nine generated
plans with `python3 -B scripts/rea-batch.py <plan>`. Outputs stay under ignored
`runtime/analysis/history/progression/achievement-grants/6d75f76be1b4`; the EXE is read in place and never launched.
Ghidra raw fragments have incomplete external/ABI context and indirect-table
limits; byte-bound dispatch and original instruction replay establish the
contracts, rather than inferred decompiler argument types.

No compilation, application/game execution, actual save-file timing,
long-run/all-class gameplay, presentation or original/rebuilt comparison was
performed. Those existing #19 validation/parity requirements remain open.
