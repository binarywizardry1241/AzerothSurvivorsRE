# Player-carried bombs

This report owns native move30's producer and the selected player-following
warning/enemy-burst lifecycle under gaps **#42/#43**. It is bound to the
configured installed 0.109.0 EXE, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
See [verification-needed](../verification-needed.md) for overall reconstruction status.

This is a carried bomb with a locked final warning, rather than a permanent
ground pool. Source semantic12 connects the current three primary boss slots to
their native payloads. No guardian move/phase uses native30 in the current
catalog. The source changes have not been compiled or exercised in a game.

## Producer and presentation

The current dispatcher enters native30 at `145957d4b..145957f34`. The
[manifest](evidence/0.109.0/raid-bombs/manifest.json) records exact native bytes,
data, checks and Ghidra provenance. The five payload words are spell, radius,
windup, player-damage factor and enemy-damage factor; the independent native
repeat stays in source word6.

| Boss | Native slot | Spell | Radius | Windup | Player factor | Enemy factor | Repeat |
|---|---|---|---|---|---|---|---|
| 192 | 1 | 20475 | 7 | 5 | 1.8 | 15 | 14 |
| 193 | 3 | 21056 | 7 | 5 | 1.8 | 18 | 18 |
| 1494 | 5 | 27819 | 7 | 5 | 2 | 20 | 16 |

The generic action block and SpellStart use the windup. The producer has no
actor movement hold. It allocates a danger circle at captured player XY using
the shared primary/secondary/default marker-height chain. Its end is
`windup + now`, its player damage is `effective_damage * player_factor`, and
its optional ground impact spell is the payload spell.

The producer sets a separate follow deadline to
`max(windup + (-1.6), 0) + now`, then stores raw enemy burst damage
`effective_damage * enemy_factor`. It immediately publishes the spell to the
player unit with the player also in its hit list. This initial unit visual is
separate from the later ground explosion. Finally it localizes and sends the
raid-boss emote “You are the bomb! Carry it into the horde!”, keeping the
speaker as the separate native label. The current
[warning owner](raid-warnings.md) owns that transport/template boundary.

## Follow, lock and damage

`14594f1b5..14594f1f8` samples the current player Z with **primary height only**;
failure retains current player Z. The follow lane `14594f743..14594f765` copies
that position into the warning only while `follow_deadline > now`. At equality
the existing center locks. A first hazard tick after the follow deadline keeps
the originally captured center. No caster lookup is required for this
player-following lane, and caster death does not cancel the fixed warning.

After initial `hz` publication, `145950134` admits standard `hzt.m` movement
rows whenever `follow_deadline > creation_time`. This remains true after the
center locks; the native output continues sending `[id,x,y,z,0]`. The source
therefore separates following admission from movement-row publication rather
than dropping the movement row at the lock boundary.

At the inclusive warning deadline, circle membership tests the player's
current XY. Player damage retains the shared encounter multiplier and source
GUID. The optional ground visual uses the locked center. Independently of
whether the player is hit, a positive enemy-damage field on a circle enqueues
center XYZ, radius, raw damage and spell. The queue contains no boss/caster GUID.

The enemy selector `1459c4940` preserves actor-vector order, samples each
actor's current interpolated XY and includes the radius boundary. It requires
all of:

- actor death byte `+0xb0` equals zero;
- primary boss header `+0x18` equals the empty `-1` sentinel;
- guardian/special header `+0x58` equals the empty `-1` sentinel.

Z does not enter this selection. There is no additional caster-GUID exclusion
or inferred faction/type predicate. The source excludes its corresponding
primary/guardian actors and uses the recovered ordinary-actor admission.

After marker/visual output and aggregated player damage, the burst consumer
calls the existing canonical player-hit routine `145971490` for each selected
GUID. Its arguments are raw damage, payload spell, school `2`, critical false
and trailing flag false. Enemy bursts use the player damage owner; they do not
inherit the hazard caster's attribution or the encounter's final player-damage
doubling. The live source routes this through the existing player-hit consumer,
including its normal health/death/event path, rather than changing health in the
hazard module.

## Source and static verification

`bosses/raid_bombs.rs` owns the producer. `bosses/raid_areas.rs` owns marker IDs,
following/lock publication, player hit, optional visual and the ordered enemy
burst queue. The live combat port supplies `raid_bomb_damage`; the current boss
schedule owns the three exact semantic12 records and cooldowns.

Shared expiry preserves the native original hazard-vector index across the
ordinary-row pass and the later grouped-tower pass. The native owner sorts
removal indices at `14595360f..145953671`, removes duplicates at
`145953b7d..145953c52`, then reads indices from the back at `1459528d6`.
`raid_areas.rs` carries parallel original indices while removing rows and
publishes `hzend` in descending original-index order. Sorting marker IDs would
change behavior after their independent u32 serial wraps. Failed tower groups
also add individually to the existing player-damage f32 scalar, matching
`145951d2d..145951d41`; summing towers separately changes rounding.

`gameplay/mechanics/raid_hits.rs` snapshots each burst's ordinary target GUIDs
before synchronous hit callbacks. It feeds the recovered school/critical/source
inputs into the existing `PassiveCombat::hit_with_execution` and `CombatAdapter`
path, then flushes vitals and accepts any refreshed stats in the same pattern as
the existing actor-periodic consumer. A completed/dead run rejects the burst,
matching the native canonical damage owner's active-state gate. The next burst
gets a fresh target snapshot and current effect state.

`scripts/check-raid-bombs.py` re-verifies installed identity and runs
original instructions in synthetic memory. **18 full producer cases** verify
native hazard/header writes, the immediate unit target/hit list, localized
warning and native follow-release arithmetic. **18 duration-selector cases**
check the independent action gate. **Two height, 15 follow and 15 movement-gate
cases** check primary failure, strict equality, unordered input and continued
post-lock publication. **Nine burst-queue cases** verify positive circle-only
admission and record fields; **24 enemy-selection cases** check the alive/boss/
guardian/radius gates. One native consumer case verifies the complete call
arguments passed to canonical player damage.
**Five removal-order cases** execute the native sort, duplicate removal and
descending-index load against mixed and repeated removal indices. The tower
checker separately executes the two rounding-sensitive accumulated additions.

The common native constructor is retained once under
[raid-lines](evidence/0.109.0/raid-lines/hazard-constructor.asm). This report
retains the successful current Ghidra seeded branch decompilation as
[producer.pseudo.c](evidence/0.109.0/raid-bombs/producer.pseudo.c). Height,
localization, serializers, CRT distance and canonical player-damage internals
are explicit seams. Their complete engine behavior is not recertified by these
bounded cases.

`tests/raid_bombs_01090.rs` contains source integration cases for initial
presentation, strict lock/move rows, late first ticks, independent enemy damage,
damage order, all three slots, mixed tower/bomb ending order and accumulated
tower-damage rounding. They were authored and inspected without
compiling or running Rust. Gameplay, packet interpretation, visuals, CRT
equivalence and original/rebuilt parity remain unverified.
