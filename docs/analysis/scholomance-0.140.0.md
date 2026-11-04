# Scholomance and Tier 0.5 in 0.140.0

The selected `installed-game/AzerothSurvivors.exe` has SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`
and 151,521,280 bytes. Addresses below are preferred PE VAs. The existing
PE parser maps the addresses to file offsets. Pointer fields were checked
against the PE's DIR64 relocation records. The diagnostic inventory verifies
the instructions that reference Rust `Location` records and identifies their
enclosing unwind extents. Those references locate code for recovery. The packed
text records establish labels and descriptions. Executable callers, state
changes, warning geometry and save outcomes require their own proof. Compilation,
gameplay, cooperative execution and original/rebuilt comparisons remain open.
[Target register](coverage/targets.json), [diagnostic inventory](coverage/diagnostic-ownership.json).

## Zone, entry, resources and unlocks

The 13-row catalog starts at `0x1473b5ac0`, file offset `0x73b4ac0`, with a
240-byte stride. The final four keys are `brm`, `scholomance`, `aq` and `naxx`
at key fields `0x1473b6338`, `0x1473b6428`, `0x1473b6518` and `0x1473b6608`.
The Scholomance record at `0x1473b6420` (offset `0x73b5420`) hashes to
`3317eedff4294257799eccb0e6ced849d5a3dfaf3b6bcd4a9affb9cdf6997e1e`.
Its pointer/length fields resolve to `scholomance`, `Scholomance`, `The Great
Ossuary` and `loadscreenscholomance`. Under the retained zone layout, `+0xc0`
is map 289, `+0xc4` is area 2057 and `+0xc8` gives center `(128, 167, 94.1)`.
The adjacent map fields agree with the known Blackrock Mountain, Ahn'Qiraj and
Naxxramas rows. Recover the current route and asset consumers using references
to this row and the save parser locations. [Retained entry layout](../../scripts/recover-run-entry.py), [loading interface #61](../CURRENT-STATE.md#gap-61).

The installed MPQ chain supplies the matching world and loading art.
`Map.dbc` row 289 maps to `SchoolofNecromancy` with loading screen 102.
`AreaTable.dbc` row 2057 names Scholomance on map 289. `LoadingScreens.dbc`
row 102 selects `Interface\Glues\LoadingScreens\LoadScreenScholomance.blp`,
in `patch.MPQ` at hash slot 54677 and block 8115. `patch-C.MPQ` holds the
`World\Maps\SchoolofNecromancy\SchoolofNecromancy.wdt` member at hash slot
856 and block 289, plus 16 matching ADTs. The WDT's uncompressed SHA-256 is
`cd1230bca784d319845c3e0b9434cf9333be05e435b8971a01f3f77d01eaa993`.
These archive/DBC reads establish the data route the existing engine can
consume. Trace the actual AS map handoff, cover choice and world spawn
before assigning native behavior to the source entry path. [MPQ inventory](evidence/0.140.0/mpq-member-coverage.json), [existing engine map catalog](../../crates/benilla-formats/src/maps.rs).

| 0.140.0 claim ID | Finding and next static step |
| --- | --- |
| `changelog:0.140.0:fdf1a184b8a5af46` | Summary context for #312–#315, the Guardians and translations. Each constituent below keeps its own proof. |
| `changelog:0.140.0:83b104d0d618ca20` | #312. The source catalogs for menu, Guardians and enemies omit the new row. Trace lookup, entry, co-op world bootstrap and floor/loading-art selection to the current table before adding a source connection. `save/progress.rs` already translates legacy numeric unlocks to keys and merges keyed `open` and `beat` entries. Trace the native migration through `save.rs` diagnostic owner `0x145e09a90` and its callers. Check previously opened `aq` and `naxx`, last-open `brm`, beaten-zone auto-unlocks, persisted Heroic clears and guest admission independently. [Menu catalog](../../crates/azeroth-survivors-re/assets/menu.json), [zone definitions](../../crates/azeroth-survivors-re/src/guardians/catalog.rs), [save progression](../../crates/azeroth-survivors-re/src/save/progress.rs), [unlock history #15](../verification-needed.md#gap-15). |
| `changelog:0.140.0:9ccf5d7e81cd52ca` | #142. `zone.scholomance.name`, `.subtitle` and `.blurb` occur in the packed locale region starting at `0x14776ef5b`. The same group of keys occurs in multiple locale payloads. Enumerate the actual loader's map descriptors starting from `i18n.rs` owner `0x145e7b0c0`, then bind locale IDs, fallback behavior and encounter, gear and achievement consumers. [Locale source](../../crates/azeroth-survivors-re/src/localization.rs). |

## Encounter dispatch and Guardians

The Scholomance row's boss slice at `0x1473b64a8` selects five 104-byte rows
starting at `0x1473b3578`, file offset `0x73b2578`. The 520-byte span hashes
to `c761c3594c35d33d53b5d6836dc6634fb92c7738437178712602db7a8198371d`.
Using the retained boss layout, the rows give the following name, entry and
minute fields. Each row has zero generic move and phase counts. Start the
current behavior trace at the script dispatcher and the matching actor-entry
branches. [Retained boss layout](../../scripts/recover-boss-minions.py).

| Record VA | Boss | Entry | Minute |
| --- | --- | ---: | ---: |
| `0x1473b3578` | Kirtonos the Herald | 10506 | 4 |
| `0x1473b35e0` | Ras Frostwhisper | 10508 | 8 |
| `0x1473b3648` | Doctor Theolen Krastinov | 11261 | 12 |
| `0x1473b36b0` | Lord Alexei Barov | 10504 | 16 |
| `0x1473b3718` | Darkmaster Gandling | 1853 | 20 |

The new `game/scripts/mod.rs` locations identify candidate owners `0x145eeb730`,
`0x145f743e0` and `0x14605e250`. Trace registration, actor selection, update
order and cleanup through those owners, then follow the exact case or callback
for each entry. Existing source counterparts include the timed boss scheduler,
the raid action and warning helpers, and their live mechanics adapter.
[Scheduler](../../crates/azeroth-survivors-re/src/bosses/spawning.rs), [raid actions](../../crates/azeroth-survivors-re/src/bosses/raid_actions.rs), [mechanics adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs), [prior mechanics #42](../verification-needed.md#gap-42), [prior warning rendering #43](../verification-needed.md#gap-43).

| 0.140.0 claim ID | Finding and next static step |
| --- | --- |
| `changelog:0.140.0:a97b78ae28053be4` | #313 schedule. The existing `Scheduler::tick_for_rank` uses clock and ordinal and has no living-predecessor gate. Recover the live boss predicate, final-boss/Council interaction, catch-up order and the gate's exact zone scope from callers of the table and the creator. |
| `changelog:0.140.0:3196e4f9f93e005a` | #313 Relentless. Trace delay, repeat and warning producers for each script. Identify the fixed cadence of Frozen Checkmate and Kirtonos's final phase against the existing rank and enrage helpers. [Heroic source](../../crates/azeroth-survivors-re/src/heroic.rs). |
| `changelog:0.140.0:ff8adfa9691fea41` | #313 mitigation. The source preserves a `DamageKind::Mechanic` spell and source GUID but hands the ordinary armor fraction to the shared incoming-damage owner. Trace the native source/spell admission and threshold/order relative to party scaling, other reductions and absorbs. [Incoming adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/incoming.rs). |
| `changelog:0.140.0:69975afd7bcbea6f` | #313 Kirtonos. Follow entry 10506 through the dispatcher to the form producer, threshold order when one hit crosses both gates, final cadence and its distinct attacks and warnings. [Existing transform helper](../../crates/azeroth-survivors-re/src/bosses/raid_transforms.rs). |
| `changelog:0.140.0:763ec669be4a88e7` | #313 Ras. `game/scripts/ras.rs` locations identify `0x145ee3900`, `0x145ee4fc0` and `0x145ee5f20`. Recover the checkerboard phase and bounds, rune placement, touch authority, armor removal and vulnerability lifetime through those bodies and their consumers. |
| `changelog:0.140.0:abf600240606fb36` | #313 Krastinov. `game/scripts/krastinov.rs` locations identify `0x145eebea0` and `0x145eedb80`. Recover dash and cleave order/geometry, moving Bladestorm, farthest-hero selection and hook delivery for local and remote heroes. |
| `changelog:0.140.0:8c658dbf737af799` | #313 Barov. Follow entry 10504 to the ring warning and impact schedule, ground burn retirement, separate X/+ shapes, and moving wall collision and gap geometry. [Existing shape helper](../../crates/azeroth-survivors-re/src/bosses/raid_shapes.rs). |
| `changelog:0.140.0:9438516c781c1935` | #313 Gandling. Follow entry 1853 to Headmaster's Office, Class Dismissed, Pop Quiz and The Last Examination. Recover each warning/hit dispatch, arena partitions, farthest-hero selection and the low-health phase transition. |
| `changelog:0.140.0:16857431d6009747` | #313 Office warning. The packed warning group starts at `0x14776b0eb`. Trace warning construction from the same Gandling dispatch to purple area interpolation, safe-square clipping, damage admission and retirement. |
| `changelog:0.140.0:c078696451fa5441` | #89. The zone's four keyed point records at `0x1473b2f90` give `(102,148)`, `(102,186)`, `(158,186)` and `(158,156)`. The four index words at `0x1473b2fd0` select enemy rows 6–9 at `0x1473b3308`, `0x1473b3358`, `0x1473b33a8` and `0x1473b33f8`. The existing layout reads entries 10488 Risen Construct, 11551 Necrofiend, 10498 Spectral Tutor and 11582 Scholomance Dark Summoner. Trace the current placement and move consumers starting at `game/guardians.rs` owners `0x145fae260` and `0x145ff3d20`. Recover each pair of moves, warning/hit geometry and recipient rules. [Guardian source](../../crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs). |

## Equipment and set consumers

### Catalog, rewards and star progression

The class pointer table at `0x1473f68b8` selects nine 0x228-byte records
starting at `0x1473f3b40`. Each record has eight 0x40-byte armor rows,
set title at +0x200, a weapon slice at +0x210/+0x218 and class/material
at +0x224/+0x225. Weapon rows use a 0x50-byte stride. Both item layouts
carry name, base stat slice, five-star stat slice, client item ID and
display ID in the same prefix. Native constructor `0x145e3d420` selects
the catalog row by compact slot and class, uses the armor paperdoll
table at `0x1473f027c` or the weapon's own slot, and publishes rarity 7.
The client item ID supplies the `t05.{id}` localized name. Save ownership
uses `100070 + 1000 * class + 100 * compact_slot` as emitted by
`0x1460385f0`; the gear getter at `0x145e2cf59` dispatches rarity 7 to the
constructor. The nine source sets share a single [pointer-free catalog](../../crates/azeroth-survivors-re/assets/scholomance-gear-0.140.0.json).

The primary death reward owner `0x145f3fea0` first adds the existing
boss mark award. Scholomance uses the zone-pair base 6 from
`0x14739a228`, the existing final/endless multiplier and the recipient's
Heroic mark multiplier. At `0x145f40063` tier 7 bypasses the per-piece
gear chance and pity path. The recipient supplies one native top-24-bit
draw to `0x145e3d7c0`. That draw must be less than 0.25, and the selected
group is `min(floor((draw * 4) * group_count), group_count - 1)`.
The candidate owner `0x145e3cdf0` uses the four rows at `0x1473f1f80`
for Kirtonos [0,1], Ras [2,3], Krastinov [4,5] and Barov [6,7].
Each armor group contains one item. Gandling yields one group containing
slot 8 and, for Rogue or Shaman, slot 9 in that order. Successful groups
append the normal item receipts with the same boss serial and marks.
The prior local and admitted-party delivery paths consume those receipts.
Duplicate conversion uses base 7 at `0x14739a240` in the existing
recipient at `0x145ea1c50`. [Award source](../../crates/azeroth-survivors-re/src/mob_loot.rs), [save receipt](../../crates/azeroth-survivors-re/src/save/gear_rewards.rs), [pity history #228](../verification-needed.md#gap-228).

The tier-specific stat projection in `0x145e2e1b0` zips the two ordered
stat slices. `0x14605d0e0` subtracts the matching base value from each
five-star value before `0x145e44ad0` scales the difference. Health uses
the integer rounding path. Rank total and incremental callers
`0x145e2b9c0` and `0x145e2b5e0` use the tier 7 step and final increments
at `0x1473ec028` and `0x1473ec048`. The other tiers' missing-stat
bridge exits early for tier 7 at `0x145e2a857`. Star purchases use
the matching cleared zone, the existing other-class full armor discount
and base 5.5 at `0x14739a260`. The current purchase owner
`0x145e08298` multiplies rank by base before applying the discount.
[Star projection](../../crates/azeroth-survivors-re/src/gear_stars.rs), [star purchase](../../crates/azeroth-survivors-re/src/save/gear_progression.rs).

The Armory collection enumerates tier order `[0,1,2,3,5,7,4]`
from `0x1465cfbb8`. Its rarity color lookup at `0x1403d61c3` and
loot notices at `0x140390949` select the tier 7 purple entry from
the component arrays beginning at `0x1465d3898`. The per-group Armory
drop preview uses `0.25 / group_count` at `0x145e29f14`. FrameXML item
publication uses quality 4 at `0x145ea5d80` and an armor scale of 4.3
from `0x1473ebe48`. The existing runtime asset and item query consumers
share the current catalog. [Armory](../../crates/azeroth-survivors-re/src/armory.rs), [item query](../../crates/azeroth-survivors-re/src/gameplay/client/inventory.rs).

`0x145e2a300` counts worn armor of each tier with nonzero rank. The
eight-piece check at `0x145e34f70` selects the first tier in
`[0,1,2,3,5,7,4]` with at least eight pieces and all at rank 3 or
above, and marks the result empowered at rank 5. The source includes
tier 7 in both checks. The independently recovered class effect
constructors and combat consumers retain separate verification below.

### Heroism and Darkmantle

The class constructor at `0x145e30990` uses modes 0, 1 and 2 for
four-piece, eight-piece and empowered payloads. Heroism's eight-piece
branches at `0x145e309c1` emit Shield Slam selectors 0 and 5. The spell
power path applies the 20% or 30% modifier to the base power, adds 4.5%
or 6% of the hero's maximum health, then applies the outgoing power
multiplier. The resulting spell resolves one damage hit. Raw effect 71
identifies the maximum-health share for meter attribution. At
`0x145f43cf0..0x145f43ea4` the owner divides the health power by current
uncapped, uncritical spell power, clamps the fraction and widens it to
f64. The ordinary and set rows receive their shares of the already
applied amount in both damage meters. The run total, hit and combat log
retain the original single damage result.

Darkmantle's four-piece and empowered rows use selector 8. The reader
at `0x145df20ef` takes the largest matching threshold, starting at 30%.
`0x145f7ceae` compares the victim's current health fraction strictly
below that threshold for Backstab and Eviscerate. The set raises it to
40% at four pieces and 45% at eight five-star pieces. Its raw 65 callback
at `0x145fbed14` retains live marks, refreshes an existing mark and
replaces the first lower-priority target when full. The normal and
empowered rows allow one and two marks, with 35% and 40% additive damage
respectively. `0x145fbc250..0x145fbc312` applies the mark before the
independent victim damage-taken field. Aura 8647 stays in its own actor
slot, which the native Gouge and Kidney Shot cleanup paths at
`0x145f4dbe5` and `0x145f52644` preserve. The source tracks each hero's
marks independently of control and periodic effects.
[Set data](../../crates/azeroth-survivors-re/src/sets.rs), [mark consumer](../../crates/azeroth-survivors-re/src/gameplay/mechanics/callbacks.rs).

`python3 -B scripts/recover-gear-effects.py --scholomance` verifies all
72 armor and 11 weapon records against the installed hash, including
both stat slices and the metadata fields. Compilation, runtime
delivery, rendered output and original/rebuilt parity remain open.

| 0.140.0 claim ID | Finding and next static step |
| --- | --- |
| `changelog:0.140.0:3e24ce3552cb9657` | #314 rewards. The one-roll gate, exact armor groups, paired weapon receipts and pity bypass are connected through the retained recipient delivery path. |
| `changelog:0.140.0:3af814319808b3f0` | #314 catalog and sets. The 83 items, star arithmetic, wear thresholds and item publication are connected. The class effect constructor at `0x145e30990` branches by class through `0x1473f70e0` with distinct four-, eight- and five-star modes. Its remaining unconnected payloads and their gameplay consumers need separate proof. |
| `changelog:0.140.0:4a2e1ed28b7af869` | #314 Heroism. Shield Slam uses the eight-piece and empowered modifiers in the existing hit, with its maximum-health share attributed to the set in damage meters. The separate four-piece effect needs a source consumer. |
| `changelog:0.140.0:cf7efae2d63eba41` | #314 Darkmantle. Execute thresholds, ordered per-hero marks, additive amplification and the protected aura are connected. Runtime display and parity remain open. |

## Achievements, progression and glow

### Collection and Heroic progress

The Whole Armory descriptor constructs the key at `0x145e4e873` and stores
kind 23 and the target at `0x145e4ea4b`. Its preceding loop calls
`0x146038a10` for all nine classes and sums their full seven-tier catalog
lengths. The native tier selector is `0x1473ec068`. Each tier has 83 IDs,
including the two classes with paired weapons, for 581 total.
The kind 23 evaluator at `0x145e5b0a3` reads the saved owned-item count.

The kind 40 descriptor at `0x145e4f8d6..0x145e4f92f` adds
`collection:t05` after Armory of Legends. The evaluator at
`0x145e5b41f` gets the current 83 compact IDs from `0x1460385f0`
and tests each against the sorted owned items. The source uses the
existing startup, reload and live reward account evaluators for both
collections, including items already present in a save.

Heroic Across Azeroth uses kind 34, minimum rank 3 at `0x145e504e4`.
Its evaluator begins at `0x145e5a43e` and checks the thirteen current
zone ordinals. The existing card at `0x140385eaa` gets the missing
zones from `0x145e4ba00`, joins the localized names with comma-space,
and formats `Still to beat: {zones}`. The source reads the existing
keyed Heroic records and shares the zone predicate between the count
and the missing list. Historical achievement ordinals remain separate.

PE byte/operand review and the gear catalog check cover the descriptor,
collection and display inputs. Both changed Rust files syntax-parse.
The authored Rust checks, actual save/UI behavior and parity remain open.

### The Insane party gate

The 0.140.0 evaluator at `0x145e5c3f0` reads the party's first-fall
option and clock (+0xa8/+0xac), initial member count (+0xb4) and raw
party rank (+0xb5). At `0x145e5d571..0x145e5d5f8` it requires Naxxramas,
effective rank V, three initial members and at least 2,400 seconds
elapsed. A recorded first fall before 2,400 seconds disqualifies the
party. A first fall exactly at 2,400 seconds is allowed. The effective
rank is the lower of the party rank and the admitted run rank.

The host phase-4 transition at `0x145f9fa50` retains the first time in
Game +0xf50/+0xf54 during a started shared run. Lethal damage
(`0x145f9bed5`) and voluntary departure (`0x145e73e97`) reach that
transition. Revives and later falls preserve the first timestamp. The
first shared tick at `0x145f2e5d6..0x145f2e602` captures starting roster
size after excluding departures. The party projection
(`0x145f36d90`) carries this state separately from the older death count
used by the Victory feats. Each new run starts with an empty latch.

Local award snapshots and the accepted guest cache converge in
`0x145ecae90`. The State15 writer at `0x146055d51` and its party tail at
`0x146057778` send the party rank, starting member count and optional
float time, using -1 when absent. The reader at `0x146053aac` admits
ordered nonnegative times. Validation at `0x145e36b32..0x145e36c04`
caps the party rank to the admitted run rank and size to five. It
clamps a finite timestamp to the admitted clock and maps present
positive infinity to zero. The same current packet carries the
recipient's secondary boss history, Enhancement flag and boss flags.

`python3 -B scripts/check-party-achievement-wire.py --state15-0.140.0`
replays 3 writer, 8 reader, 32 validator and 288 evaluator cases over 6,018 original
instructions. Source checks cover the field ordering and validator
routes. Rust syntax was parsed. The authored Rust regressions, live
account settlement, network execution and parity remain unverified.

| 0.140.0 claim ID | Finding and next static step |
| --- | --- |
| `changelog:0.140.0:1bd2ec64e4e8aedc` | #315. The 83-item collection, Stormstrike Graduation and the nine-class Prepared save/use gate are connected. Lifestealing is gated and selectable in local Armory and preview. Straight A’s needs the Gandling attack producers and recipient result delivery. [Combat records](#graduation-and-straight-as-combat-records), [Prepared and glow](#prepared-use-and-lifestealing). |
| `changelog:0.140.0:6e6db84119aec942` | #315. The Whole Armory is at `0x1473f9b3d` and the Heroic Across Azeroth descriptor at `0x1473fa06f`. `Still to beat: {zones}` is at `0x147770455`. Trace the current catalog denominator, previously owned item admission and missing-zone order/locale through the account and presentation owners. The source already counts `account.gear` and evaluates the retained 12 Heroic zone ordinals. [Progress evaluator](../../crates/azeroth-survivors-re/src/account_progression.rs), [achievement panels](../../crates/azeroth-survivors-re/src/progression.rs). |
| `changelog:0.140.0:094d1782a8db36a3` | #285. The Insane uses the starting party size and first party fall, with the exact effective Heroic V and 40-minute boundaries. Host, State15 and live/cached guest award paths share the recovered inputs. [Party gate](#the-insane-party-gate), [verification #285](../verification-needed.md#gap-285). |

### Graduation and Straight A's combat records

The kind 16 evaluator at `0x145e5c8b7` consumes the recipient's Enhancement
flag from compact snapshot `+0xe0` and 12-byte lethal records from
`+0x50/+0x58`. Selector zero reaches `0x145e5c934`. It checks boss 1853,
spell 17364 and source kind other than 2. The direct boss-death owner writes
the same attributed record into both lists at `0x145f43a37..0x145f43adf`.
The party merge at `0x145f32075..0x145f32148` adds peers' records to the main
history and pair history. The second list retains only the recipient's own
killing blows. Local snapshot `0x146058169` reads the second list from Game
`+0x978/+0x980`, while the guest path reads it from `+0x1498/+0x14a0` at
`0x145ec7d18` and adjacent instructions. Both paths compact it for the same
evaluator.

Local snapshot `0x146058213..0x14605826f` requires class 7 and sums the
allocated ranks in rows 0 through 6 with helper `0x145def1a0`. Enhancement
(tree 1) must have positive points and exceed both Elemental (0) and
Restoration (2) individually. The local flag at full snapshot `+0xfd`
compacts to `+0xe0` through `0x145ecb1f4/0x145ecb2bf`. The source captures
this flag in each hero's configured effects using the saved talent catalog
and preserves the separate personal and party-merged histories. The authored
regression exercises empty, strictly leading and tied trees through real
effect configuration. [Feat source](../../crates/azeroth-survivors-re/src/gameplay/mechanics/kill_feats.rs).

The kind 17 evaluator at `0x145e5cc33` requires a boss 1853 result row with
bit 0 set. Gandling's script header `0x147af4c68` has death callback
`0x145ee88b0` at `+0x58`. The lethal path calls it at `0x145f458b5` before
same-source attack cleanup. It requires boss HP at most zero and every
still-retained attack row for that boss GUID of kind 1, 4 or 5 to have an
empty hit list at row `+0x40`. Office kind 1 is constructed at
`0x145ee6b71`, with the name from `0x147af39d8`. Examination kinds 4 and 5
come from `0x145ee7e85` and `0x145ee7f35` through `0x145ee7930`, which
publishes the variant at `0x145ee7cd8` with the name at `0x147af3a16`.
The hit sampler at `0x145fcf85d..0x145fcf8c7` appends victim/part entries
before the common damage call at `0x145fcfb96`. This records admitted
scripted hits before armor and absorption. Ordinary expiry selects rows by
`+0xcc` at `0x146037070` and removes them at `0x145f77f09`. The callback
reads the live attack vector at death.

The callback appends `{boss_id, flag}` to Game `+0x988`, and in party mode
queues `{active_hero_index, boss_id, flag}` at `+0xe90`. The party merge
`0x145f3214d..0x145f321cd` transfers that result to the other admitted
heroes. Their settlement snapshots consume the resulting boss flag list.
The source still needs the Office and Examination attack rows, hit capture,
and retirement from [#313](../CURRENT-STATE.md#gap-313) before it can produce
a Straight A's result. The generic incoming-boss damage history cannot
substitute for those retained scripted records.

Three Ghidra slices bound the death callback, tree tally and scripted hit
sampler to the installed hash. Original instructions supplied the external
call order and native row offsets. Isolated replay of the unchanged death
callback passed 192 cases across boss HP, attack kind, source GUID, hit
presence and local/party result rows. Rust syntax checks covered the four
changed source files. Authored Rust tests, gameplay and parity remain open.

### Prepared save record

The save loader calls the class collector at `0x145e0e94f`. The flattened
iterator `0x14603d440` and `prep|` scanner `0x14605c190` parse each
trimmed line and continue across all matching rows. The comma-separated
payload uses class parser `0x145e1fbb0`. It permits a leading plus and
leading zeros, rejects interior whitespace and malformed or overflowing
tokens, and accepts class IDs 1, 2, 3, 4, 5, 7, 8, 9 and 11. The native
loader sorts and deduplicates the resulting byte vector. It stores the
capacity, pointer and count at Save `+0x1f8/+0x200/+0x208`. The qualified
run mutation at `0x145ec915d..0x145ec920b` inserts a class once, in order.
Writer `0x145e15ddd..0x145e15f64` emits one nonempty decimal `prep|` row
between `glow|` and `hbeat|`, followed by `beat|`.

The [save schema](../../crates/azeroth-survivors-re/src/save/schema.rs) and
[Heroic save owner](../../crates/azeroth-survivors-re/src/save/heroic.rs)
use the same validated class set for load, mutation and serialization.
Isolated replay passed 268 native class parser cases and four mixed-line
iterator cases. Generic trim and byte-search routines were replay seams.
Both Rust files syntax-parse. The authored save round trip remains uncompiled.

### Prepared use and Lifestealing

The solo Heroic V Scholomance constructor at `0x145faa595` admits the
loadout when `0x145e4c050` recognizes eight pieces for the class and
active tier 7, then finds a nonzero rank for every class requirement
in the table at `0x147733b48`.

| Class | Required talents | Use admitted by the run |
| --- | --- | --- |
| Warrior | `titan`, `fortified` | Shield Slam hit |
| Paladin | `hammer_righteous`, `ardent_defender` | Hammer of Justice hit |
| Hunter | `bestial_wrath` | Matriarch bite or Kill Command strike, entry 9532 |
| Rogue | `shadow_dance` | Backstab or Eviscerate on a living boss, elite or Guardian |
| Priest | `shadowform`, `shadowy_apparitions` | Shadow Word: Pain kill |
| Shaman | `enh_stormbound_echoes` | Stormstrike hit |
| Mage | `water_elemental`, `splitting_ice` | Pet-origin Frostbolt hit, spell 116 |
| Warlock | `rain_of_chaos`, `conflagrate` | Conflagrate on an Immolated living boss, elite or Guardian |
| Druid | `tranquility`, `swiftmend` | Tranquility pulse with a victim and the Seed of Life row |

The dispatcher at `0x145fc0893..0x145fc0bae` rechecks the loadout
before moving Game +0x10ce from pending to confirmed. Named hit
selectors use `0x145fbc460` and reject pet attribution. The Hunter
marks Matriarch-origin damage at `0x145fc3661..0x145fc372e` and
`0x145fc60fc..0x145fc6145`. For Rogue and Warlock the actor must have
+0xd0 equal to zero, plus boss metadata, the elite byte or Guardian
metadata. A lethal hit changes that state before the generic callback.
Warlock uses the first configured raw16 row with spell 348 at
`0x145fc09d4..0x145fc0ad1`, checks Shadow Bolt or Searing Pain, and
requires stored Immolate on the victim. This gate precedes splash
target selection. Druid confirmation runs at
`0x145fb902c..0x145fb908d` before the Seed's target selection. The
solo tick at `0x145facd36` invalidates a changed loadout. The win
transaction at `0x145ec9107..0x145ec920b` requires solo Scholomance,
effective Heroic V and a confirmed current loadout before inserting
the class once and publishing the class-clear count.

The achievement reads the nine-class save count and unlocks enchant
1898. The Save parser at `0x145e0e6c5` accepts an already stored choice,
and the getter at `0x145e08850` applies the achievement gate or selects
Icy Chill. The local Armory at `0x1403778fc..0x14037797a` hides the
locked option and appends the unlocked button after Unholy Weapon.
Preview at `0x1402447d8..0x140244859` uses the enchant for an equipped
weapon at any star rank. The remote co-op sanitizer uses peer
achievement IDs, whose profile carrier remains open in
[#299](../CURRENT-STATE.md#gap-299).

The retained dispatcher and pet tick slices bind to the installed hash.
Warlock replay covered 216 cases over 88,662 original instructions.
`python3 -B scripts/check-weapon-glow.py --current-lifestealing` covers
38 native cases over 1,439 instructions. Rust syntax was parsed.
Compilation, authored Rust tests, in-game notices, network/Armory
behavior and original/rebuilt parity remain open.
