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

`python3 -B scripts/recover-gear-effects.py --scholomance` verifies all
72 armor and 11 weapon records against the installed hash, including
both stat slices and the metadata fields. Compilation, runtime
delivery, rendered output and original/rebuilt parity remain open.

| 0.140.0 claim ID | Finding and next static step |
| --- | --- |
| `changelog:0.140.0:3e24ce3552cb9657` | #314 rewards. The one-roll gate, exact armor groups, paired weapon receipts and pity bypass are connected through the retained recipient delivery path. |
| `changelog:0.140.0:3af814319808b3f0` | #314 catalog and sets. The 83 items, star arithmetic, wear thresholds and item publication are connected. The class effect constructor at `0x145e30990` branches by class through `0x1473f70e0` with distinct four-, eight- and five-star modes. Its remaining unconnected payloads and their gameplay consumers need separate proof. |
| `changelog:0.140.0:4a2e1ed28b7af869` | #314 Heroism. Follow the 8-piece and five-star descriptors into Shield Slam resolution. Establish multiplier and maximum-health ordering and the fate of the prior extra-hit branch. |
| `changelog:0.140.0:cf7efae2d63eba41` | #314 Darkmantle. `Marked for Death` appears at `0x1473eb3ef`. Recover the mark's aura key, lifetime and projection through Gouge and Kidney Shot, retaining separate state and display checks. |

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
| `changelog:0.140.0:1bd2ec64e4e8aedc` | #315. The packed catalog separates four descriptions. `collection:t05` at `0x1473f9f79` requires all eight armor pieces and the full fixed Gandling weapon reward for each class. `feat:graduation` at `0x1473fab9a` describes an Enhancement Shaman's Stormstrike killing blow on Gandling. `feat:straightas` at `0x1473fac38` describes a Gandling defeat with no player damaged by Headmaster's Office or The Last Examination. `Yes, I am prepared!` at `0x1473fa266` describes solo Heroic V clears with all nine classes using their Tier 0.5 bonuses and matching specialization talents. Its class-clear progress text is in the English region near the Lifestealing glow label at `0x147770399`. Follow the catalog constructor from the `achievements.rs` location owners `0x145e4c2f0` and `0x145e4c9d0` and resolve the individual evaluator cases. Trace the exact star, set and talent predicates, ability-attributed lethal hit, party-wide mechanic hit history, fixed weapon ownership, persisted class bits and the Armory glow gate. Existing damage history records boss identity before HP loss, so the narrower source/spell and post-mitigation boundaries for Straight A's need proof. [Achievements](../../crates/azeroth-survivors-re/src/account_progression.rs), [hit history](../../crates/azeroth-survivors-re/src/gameplay/mechanics/kill_feats.rs), [glow source](../../crates/azeroth-survivors-re/src/armory_cosmetics.rs), [prior achievements #19](../verification-needed.md#gap-19), [achievement module #82](../CURRENT-STATE.md#gap-82). |
| `changelog:0.140.0:6e6db84119aec942` | #315. The Whole Armory is at `0x1473f9b3d` and the Heroic Across Azeroth descriptor at `0x1473fa06f`. `Still to beat: {zones}` is at `0x147770455`. Trace the current catalog denominator, previously owned item admission and missing-zone order/locale through the account and presentation owners. The source already counts `account.gear` and evaluates the retained 12 Heroic zone ordinals. [Progress evaluator](../../crates/azeroth-survivors-re/src/account_progression.rs), [achievement panels](../../crates/azeroth-survivors-re/src/progression.rs). |
| `changelog:0.140.0:094d1782a8db36a3` | #285. The Insane uses the starting party size and first party fall, with the exact effective Heroic V and 40-minute boundaries. Host, State15 and live/cached guest award paths share the recovered inputs. [Party gate](#the-insane-party-gate), [verification #285](../verification-needed.md#gap-285). |
