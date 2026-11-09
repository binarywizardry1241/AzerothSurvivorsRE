# Gameplay tracker evidence

Use the observations below to compare published output or narrow a source
trace. The [verification register](../verification-needed.md) owns finding
status and the remaining comparison work.

## Captures reviewed on 2026-11-06

A and B show solo Undead Rogue runs in Elwynn Forest on Heroic 4 with
Explosive. C covers one solo entry and exit in each of the thirteen zones
with the same class and race, on Heroic 5 except Scholomance (Heroic 3).
D covers a solo Elwynn Heroic 5 run with Explosive and Bolstering, followed
by a five-player Scholomance Heroic 3 run with Bolstering.
The WoWSilicon bootstrap checks the Wine launch argument against
the configured original EXE before assigning the log path. The installed
`installed-game/AzerothSurvivors.exe` matched the
[registered 0.141.0 identity](coverage/targets.json) when inspected
(SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`).
The captures lack launch-time EXE hashes. Use them as original-game
observations with the exact launch bytes unconfirmed.

E and F contain only the gameplay header. G contains two solo Undead Rogue
attempts in Scholomance on Heroic 3 with Bolstering. At review, the installed
EXE was 0.141.1 (SHA-256
`47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`).
The launch bytes for E through G are unconfirmed.

To locate the raw files locally, search `runtime/original-vulkan-cache/cache/traces/session-*/gameplay.log`
for the matching `# t0=` header. Line numbers below include that header. The
prefix digest identifies the reviewed log bytes even if a capture grows.
Run time is the `AZSRUN` clock. Trace time is the elapsed `t=` on each row.

| Capture | `# t0=` value | Reviewed prefix | SHA-256 of reviewed prefix |
| --- | --- | ---: | --- |
| A | `1793927554.520` | 984 lines | `43f1fddec9e53365e7a0e419f80a09b6c536076b3135bb996f13396c401fa609` |
| B | `1793928177.341` | 126,765 lines | `ff4084a8421d9cbc85ba7557c60262a8b83b0254b8a943a781aec78c26213af4` |
| C | `1793929745.053` | 14,850 lines | `eae6895210fc668cbb7f47151f61d0b7b76020c2651d080ad3fdb6edfbeaf6df` |
| D | `1793976975.399` | 379,537 lines | `187de0e61cd2de1e6b605b69eda067a163dd3a8bb050877e9eeb2b857be3de88` |
| E | `1793993466.223` | 1 line | `67522d6f755853b2ffd6a997ed3446ed602d5b23cc6056021efaed204d0676b3` |
| F | `1793993579.308` | 1 line | `dedd729485279d82ba2a3330acd448f3c6de23e8413438e0c30df90881aa7aff` |
| G | `1793995446.386` | 998,617 lines | `805a8ddcf8cf8ac555a6ade73111d4d991ab2583db532f2edbd908e7e0576c6c` |

## Scholomance scripted cast packets

**[#313](../verification-needed.md#gap-313).** G's first attempt ends with `left`
at run 50.5 (line 22088). The second starts at line 22360. Its schedule
publishes Kirtonos, Ras and Krastinov `up` at run 240.11, 480.11 and 720.12
(lines 152204, 445993 and 898374). Kirtonos and Ras go `dead` at 300.01 and
528.60 (lines 207296 and 543790). The run ends in defeat at 769.7 with two
boss kills and Krastinov still up (lines 995535–995543).

The incoming `SPELL_GO` trace identifies each caster by the creature entry
in its packed GUID (10506, 10508 and 11261 respectively). The following rows
all report an indexed caster and zero hits and misses.

| Caster | Spell IDs and G lines |
| --- | --- |
| Kirtonos | Shadow Bolt Volley 17228 at 154726, Blood Offering 7154 at 156424, Vampiric Swoop 18144 at 184917, Wing Flap 12882 at 187799, and form change 16467 at 177661 |
| Ras | Frostbolt Volley 8398 at 451700, Chill Nova 18099 at 467261, 492363 and 521972, and Frost Armor 18100 at 506716 |
| Krastinov | Twin Cleaver 15284 at 908931 and 913084, then again at 948107 and 951669 |

The capture confirms reception and empty hit and miss counts. The
[0.143.0 native launch trace](scholomance-encounters.md#scripted-spell-launches)
establishes the missing packet fields, marker order and Ras's spell identity
and connects the rebuilt launch path.

## Downed-party addon IDs

**[#63](../CURRENT-STATE.md#gap-63).** In D lines 248544–379140, every
nonempty `AZSDOWNED` row starts with `u` followed by the actor's unpadded
lowercase hexadecimal GUID. The four distinct tokens first appear at lines
248544, 253603, 376029 and 378786. Their hexadecimal suffixes decode to the
same numeric caster GUIDs as `SPELL_GO` at lines 234765, 234762, 234776 and
234768, respectively. The token for the third actor stays the same across
`down` and `left` (lines 376029 and 376855). The final list retains that
token as `left` alongside three `ended` rows (lines 378786–379140).

The [0.143.0 formatter proof](coop.md#downed-party-addon-guids) independently
identifies the world unit GUID input and lowercase hexadecimal formatter. The
rebuilt [shared host and recipient publisher](../../crates/azeroth-survivors-re/src/coop/game_party.rs#L258)
now emits the observed format. The [Lua getter](evidence/addon-api/selected-reference.lua#L596)
returns the string ID, and the [catalog](../../crates/benilla-app/src/combat_text/world_anchors.rs#L239)
keys a fall by the string and its epoch. The capture covers published IDs for
these four actors. Lua return values and rendered anchors require separate
verification.

## Capture D run boundaries

Elwynn starts at lines 3–106 and ends with `AZSEND result=left` at line
234595 (run 448.3, two bosses, eight caches). The [addon replay case](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/addon-run-space-0.139.2.md)
has `AZSMREQ full` at line 65649, trace 443.910, followed by the identical
zone payload and the current run, boss, cache and lair lines at lines
65783–65797, trace 445.776–445.782.

Scholomance starts at lines 234632–234701. The first `AZSPARTY` at line
234985 lists five heroes. For [#168](../verification-needed.md#gap-168)
and [#9](../verification-needed.md#gap-9), lines 316208–316218 publish
`ph=dead`, `AZSREVIVE down=1` and `AZSEND result=defeat` at run 69.23.
Lines 334038–334047 resume `playing` at 83.85 with full HP, publish
`down=0` and clear `AZSEND`. The second fall starts at line 353039
(run 94.32). At run 113.85, lines 378780–378787 show the recipient still
dead, `down=0`, the other four heroes `ended` or `left`, and a defeat
payload. The last complete line is at trace 1008.799. These are addon
publications from one recipient. They leave helper inputs, exact revive
timing rules and terminal save settlement outside the capture.

## Zone entry and login position

**[#312](../CURRENT-STATE.md#gap-312).** C line 2364 already publishes
Scholomance at `(124.9, 169.5, 93.1)` in `ready`, with the run clock at
`0.00`. The mover holds height `93.085` with no horizontal step (line 2371),
settles at that height (line 2408), and starts walking from
`(124.88, 169.51, 93.09)` (line 2410). This is about four yards from the
authored XY before the first walking step.

The installed 0.141.0 EXE still stores map 289, area 2057, center
`(128, 167, 94.1f32)`, facing zero and radius 46. The record at file
offset `0x739f610` resolves its key pointer to `scholomance`; its 28-byte
field slice at `0x739f6d0` hashes to
`55fa0c0c5dc945ef44a53fde06341886a0a2a0e9f739614a9a246227113973e3`.
Those values agree with the [recovered entry data](scholomance-entry.md).
The [native login-position trace](zone-login-position.md) connects
the radial search and height fallbacks to local player creation and the
initial `AZSRUN`. The rebuilt floor worker retains the authored center as
its cache key. The logged pose remains a comparison point for the rebuilt
client on the installed MPQs.

Five more zones publish a different initial height from the current table
at one decimal place, while their XY and facing still agree. Each has a
matching height in the first mover row, before any horizontal displacement:

| Zone | C `ready` / mover lines | Authored Z | First mover height |
| --- | --- | ---: | ---: |
| Alterac Valley | 4492 / 4498 | 7.0 | 6.806 |
| Scarlet Monastery | 5242 / 5248 | 27.0 | 27.305 |
| Feralas | 7555 / 7561 | 95.2 | 95.135 |
| Arathi Basin | 8206 / 8212 | −45.0 | −44.013 |
| Warsong Gulch | 12049 / 12056 | 310.0 | 308.674 |

For [#61](../verification-needed.md#gap-61),
[#137](../verification-needed.md#gap-137),
[#89](../verification-needed.md#gap-89) and
[#49](../verification-needed.md#gap-49), C gives a short original-game
comparison for each zone. All thirteen go from `ready` at 0.00 to
`playing`, then publish `AZSEND result=left`. In each case the initial
`playing` publication includes two caches and four empty lairs with 20
seconds displayed. The companion UI diagnostics report two matching
entry-9005/display-259/type-3 creates for every zone; for Scholomance see
UI lines 935–936 and gameplay lines 2482–2485. The initial boss names,
deadlines and final flags match the source catalog for all thirteen zones.
Duskwood and Elwynn both use map 0 but publish distinct run IDs and fresh
destination lists. The table indexes those windows without preserving the
run IDs.

| Zone | Map | C `ready` | C first `playing` | C exit |
| --- | ---: | ---: | ---: | ---: |
| Naxxramas | 533 | 4 | 80 | 463 |
| Gates of Ahn'Qiraj | 1 | 471 | 555 | 2276 |
| Scholomance | 289 | 2364 | 2482 | 3479 |
| Blackrock Mountain | 0 | 3489 | 3565 | 4136 |
| Alterac Valley | 30 | 4492 | 4588 | 5093 |
| Scarlet Monastery | 189 | 5242 | 5318 | 6272 |
| Gurubashi Arena | 0 | 6563 | 6637 | 7326 |
| Feralas | 1 | 7555 | 7626 | 8198 |
| Arathi Basin | 529 | 8206 | 8612 | 10343 |
| Un'Goro Crater | 1 | 10845 | 10936 | 12042 |
| Warsong Gulch | 489 | 12049 | 12149 | 12854 |
| Duskwood | 0 | 12862 | 12921 | 13792 |
| Elwynn Forest | 0 | 13799 | 14004 | 14842 |

The runs lasted 2–8.5 seconds on the published run clock. They expose
opening state and ordinary movement, not boss or guardian encounters,
completed runs, rendered loading-cover duration or rebuilt behavior.

## Meter and combat attribution

**[#75](../verification-needed.md#gap-75), [#307](../verification-needed.md#gap-307).**
In A lines 568, 597 and 875, `AZSM` gives direct Blade Flurry the key
`ability:blade_flurry:r1` and the talent proc `talent:rogue.blade_flurry_talent:r1`.
The legacy `AZSMETER` keeps two Blade Flurry rows with proc flags `0` and `1`
(line 959). The Riposte row gives `ability:ghostly_strike` as the source and
`talent:rogue.riposte:r2` as its origin (line 676). Compare both source keys and
origin preservation through the [detailed hit recorder](../../crates/azeroth-survivors-re/src/gameplay/mechanics/detailed_credit.rs)
and the legacy meter publisher. These are captured rows for a particular
loadout. The trace does not expose the hit selector's internal inputs.

## Upgrade publication and run exit

**[#91](../verification-needed.md#gap-91), [#11](../verification-needed.md#gap-11).**
In A lines 409–423 and 899–910, level-ups enter `choosing` with `owed=1` and
resume `playing` with `owed=0`. The first post-choice `AZSSPELLS` adds Blade
Flurry (13877, rank 1, 2.5-second interval) and then Gouge (1776, rank 1,
5.0-second interval), respectively. B lines 5189–5202 show 26.9 seconds of trace
time between observed choice and resume, with the published run clock moving
from 77.37 to 77.49 seconds. B lines 2958–3003 show a guardian reward and a
level increase with `owed=2` on entry and `owed=0` on resume. These cases give
the observable publication order and clock behavior. Card contents, selection
input and layout are outside the capture.

B lines 34038–34072 give the intermediate state after Bellygrub's defeat.
The run clock stays at 370.22 while `owed` changes from 2 to 1 and the phase
stays `choosing`. The next transition reports `owed=0`, `playing` and 370.24.

**[#9](../verification-needed.md#gap-9).** A lines 980–984 show `paused → dead`
with the run clock held at 11.30, `AZSEND result=left`, and a detailed meter
frame marking the hero `departed`. The final run snapshot still has full HP.
Compare the phase, exit result and meter departure separately. B also
publishes `paused → dead` at full HP and a frozen run clock of 756.16.
Its `AZSEND` at line 126760 reports `left`, level 40, four bosses, nine
guardians, thirteen caches and two magnets (lines 126744–126760).

## Guardian and boss lifecycle

**[#57](../verification-needed.md#gap-57), [#89](../verification-needed.md#gap-89).**
All 95 B `AZSTGT kind=guardian` snapshots in lines 1–25,994 match the most
recent `AZSUNITS` row for the same GUID on current HP, maximum HP and awake
state. The first 70 are in lines 1–16,493. For example, lines 1866–1868 show
both channels publishing 12,641/12,787 HP. Lair slot 2 becomes awake at run
29.45 (line 1812). After Gruff Swiftbite's defeat, the unit row disappears
and the lair reports `empty`,
GUID `0` and 150 seconds remaining (lines 2958–2973). The same lair publishes a
new sleeping guardian with a different GUID at run 191.31 (line 15387).
Compare addon publication, actor removal and respawn. The capture does not
observe Lua unit notifications or the rendered target frame.

**[#42](../verification-needed.md#gap-42), [#75](../verification-needed.md#gap-75).**
B starts with Hogger `due` at 180 seconds (line 5). At run 180.02 it emits the
approach banner and publishes `up` (lines 14003–14007). The next-boss field
already names Mother Fang in that spawn snapshot. `AZSBOSSDMG` publishes
encounter-specific rows during the fight (first at line 14147). At run 189.28,
`bk` increments and the schedule marks Hogger `dead` (lines 15109–15118).
These are addon-facing schedule and meter cases. The trace does not establish
the boss's movement, reach, hazard geometry or rendered state.

B lines 32424 and 35900 mark Mother Fang's spawn at run 360.07 and defeat at
378.07. The final `AZSBOSSDMG` at line 35908 remains the last published payload
through Rhahk’Zor's spawn at run 540.11 (line 66943). The first new boss damage
payload at line 67915 starts with fresh totals. This matches the existing
[meter rollover on first admitted hit](../../crates/azeroth-survivors-re/src/run_meter.rs).
Rhahk’Zor's defeat at run 558.20 is recorded at line 71280. The last
observed encounter is Mr. Smite: the schedule changes to `up` at line
114998 and `dead` at line 120707, with `bk=4` at run 736.45.

## Cache transactions

**[#18](../verification-needed.md#gap-18), [#49](../verification-needed.md#gap-49),
[#91](../verification-needed.md#gap-91).** B line 622 shows the insufficient-gold
banner at the initial 25-gold price. Each successful purchase increments `ck`
and publishes `choosing` with `owed=1`. The first purchased cache disappears
from `AZSCHESTS` in the same update (lines 5872–5876). Compare the first four
price transitions against the [cache transaction](../../crates/azeroth-survivors-re/src/treasure_chests/mod.rs).

| B line | Run time (s) | Paid | Gold before → after | Next price |
| --- | ---: | ---: | ---: | ---: |
| 5872 | 87.04 | 25 | 129 → 104 | 38 |
| 12036 | 164.25 | 38 | 349 → 311 | 55 |
| 23943 | 283.02 | 55 | 828 → 773 | 77 |
| 24161 | 284.67 | 77 | 773 → 696 | 106 |

All thirteen observed price increases match the source expression, ending
with 770 → 1007 (line 86776) and 1007 → 1315 (line 121015). In purchase
nine, the balance falls from 1,005 to
685 across a 340-gold purchase while lifetime earned gold (`ge`) rises by 20
(line 48258). Compare balance and earned gold together when other gameplay
credits occur between snapshots.

The marker list gives the published removal order. It does not show object
animation, audio, the selected reward or its rendered card.

## Evidence boundaries

- **[#1](../verification-needed.md#gap-1).** Player movement and combat lines
  lack the enemy pose, floor samples and pursuit-to-attack state needed to
  diagnose the reported terrain penetration.
- **[#2](../verification-needed.md#gap-2), [#58](../verification-needed.md#gap-58).**
  Choice phases and banner messages expose publication. They do not show
  rendered cards or which native and addon displays were visible. A's historical
  Vulkan event stream reached its 64 MiB cap about 48 seconds before the first
  gameplay row. B uses the gameplay-only tracker.
- **[#224](../verification-needed.md#gap-224).** B's first 25,994 lines have five
  client `SPELL_GO` records for Explosive spell 20475 (lines 4256, 6291, 10218,
  11298 and 12534).
  Use those as selectors for an expiry-event comparison. They do not identify
  every orb spawn or establish its timer, damage formula or hit admission.

Use these observed outputs for comparison with a rebuilt capture of known
build identity. Rebuilt parity remains unverified.
