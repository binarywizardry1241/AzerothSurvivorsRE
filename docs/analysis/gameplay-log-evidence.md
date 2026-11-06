# Gameplay tracker evidence

Use the observations below to compare published output or narrow a source
trace. The [verification register](../verification-needed.md) owns finding
status and the remaining comparison work.

## Captures reviewed on 2026-11-06

Both captures show solo Undead Rogue runs in Elwynn Forest on Heroic 4 with
Explosive. The WoWSilicon bootstrap checks the Wine launch argument against
the configured original EXE before assigning the log path. The installed
`installed-game/AzerothSurvivors.exe` matched the
[registered 0.141.0 identity](target-refresh-0.141.0.json) when inspected
(SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`).
The captures lack launch-time EXE hashes. Use them as original-game
observations with the exact launch bytes unconfirmed.

To locate the raw files locally, search `runtime/original-vulkan-cache/cache/traces/session-*/gameplay.log`
for the matching `# t0=` header. Line numbers below include that header. The
prefix digest identifies the reviewed log bytes even if a capture grows.
Run time is the `AZSRUN` clock. Trace time is the elapsed `t=` on each row.

| Capture | `# t0=` value | Reviewed prefix | SHA-256 of reviewed prefix |
| --- | --- | ---: | --- |
| A | `1793927554.520` | 984 lines | `43f1fddec9e53365e7a0e419f80a09b6c536076b3135bb996f13396c401fa609` |
| B | `1793928177.341` | 74,032 lines | `270c6a423be5500d6c68437081a02f94fdaeea1a475140bf3f9868944f77f0e3` |

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
Compare the phase, exit result and meter departure separately. B had no
`AZSEND` within the reviewed prefix.

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
Rhahk’Zor's defeat at run 558.20 is recorded at line 71280.

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

All 11 observed price increases match the source expression through a next
price of 770 (line 64392). In purchase nine, the balance falls from 1,005 to
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

No source discrepancy or rebuilt parity was established by these captures.
Reuse the observed outputs when tracing the corresponding publisher or checking
a later rebuilt capture with a known build identity.
