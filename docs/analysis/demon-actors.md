# Special demon actors and build clocks

The [0.127.0 population repair](warlock-population.md) replaces this
historical Gate group-draw contract with per-summon admission, caps and rerolls.
All other observations below retain their stated target provenance.

The installed target is SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[verification-needed](../verification-needed.md) owns gap #24 and its remaining validation.
This report owns current targeting, ordinary special-attack cadence, following,
Gate/build scheduling, summon placement, Infernal landing follower expiry and published display scale.
Damage, spell proxies, talent
composition and the actual HUD consumer have separate owning reports.

## Connected behavior

All thirteen current descriptors retain the historical scalar values, but their
native pointers changed. `pets::definition_at_current_address` maps only the
current identities while preserving the old catalog's `native_address`
provenance. Current creation multiplies only display field4 by1.2 for
special kinds1–4 and1.5 for kinds5–8. Collision/reach fields keep the
descriptor scale; ordinary followers retain multiplier one. The special scheduler and cast callback resolve current raw33/34
pointers at effect byte 16 through that shared lookup.

`1459586e0` selects current targets. The general radius-28 query is centered on
the player for melee demons and on the follower for ranged demons. Melee
admission also limits the follower-to-victim distance to 34. The Doomguard's
separate focus query uses radius 30 around its own position, retaining an elite
unless a boss is available. The live adapter now supplies both native query
orders rather than one shared result.

Felguard first selects the lowest eligible elite/boss health fraction within
28 yards of the player. It retains its previous elite when the new fraction
improves by at most 0.15; its ordinary fallback takes the first eligible query
row. Felhunter no longer receives the historical Agony selection bonus.
Succubus prefers Corruption targets, with another 0.6 score only while their
per-target Seduction cooldown is inactive (Game+118/+120 pairs). Infernal
retains nearby-victim scoring. The actual
live actor health, motion, control deadlines, periodic spells, pending missiles
and other demon allocations reach these consumers.

The current cooldown helper `1459598b0` leaves ordinary special0 periods
unchanged. For special kinds other than 0/7 it returns
`max(descriptor.period * global_cooldown, 0.5)`. The old aura-haste,
Felguard recovery and execute-haste denominator is removed. Doomguard's separate
Shadow Bolt route uses the current learned cooldown and spell modifier: its
catalog cooldown is 1.4 and the native helper applies another 1.4 factor,
then the global cooldown and half-second floor. Its damage/spell owner supplies
that distinct interval to the same live actor scheduler.

Movement retains quarter-second updates, the 40-yard leash, ranged
movement-before-attack ordering and melee movement after attacks. The current
follow ring is 2.8 yards for lesser demons and 4.5 for kinds 5–8, including
Pit Lord. Ranged followers also pull their next update forward to a pending
attack deadline, preserving non-quarter-second spell cadences. The existing
real terrain/movement publication remains the consumer.

Current Felguard swings query the follower's interpolated position with
radius `15 * global_area`, using the common70/10 logarithmic soft cap. The
original primary is always retained; up to nine ordered neighbors are appended,
so the complete swing has at most ten victims. Felhunter and Voidwalker retain
one extra neighbor within five yards of the primary; Succubus and Infernal
melee keep only their primary. The Felguard's wrapping swing counter still
doubles every third swing and emits845 with Brutal Momentum attribution. Its
old explicit Soul Shard grant has been removed. An echo reuses the captured
victim list and multiplier after filtering dead/missing actors; it does not
advance the swing counter or query replacements. The current native owner
contains no shard-grant call in this path.

Imp Firebolt's extra targets share one global window: accepted extra bolts
retain timestamps younger than one second and consume a saturating budget of
24. The radius30 query excludes the primary and accepts any retained Immolate348
row, including exhausted rows. Succubus target scoring likewise observes any
retained Corruption172 row. Source target publication no longer filters these
spell identities by remaining tick count.

The current summon wrapper `145959b30` samples lesser relative angles across
a full turn. Greater kinds 5–8 take a sign draw followed by a magnitude draw
in `[0.35, 0.65)` times pi. Infernal placement still uses the recovered
30-yard density query and radius `area * 8`, with the 70/10 logarithmic
soft cap. Its landing damage uses descriptor/run growth times **2.25**,
followed by the shared demon power/critical consumer. Control follows the
damage and synchronous callbacks: primary bosses receive 2 seconds, elites
0.5 seconds and ordinary victims 1.5 seconds. The wrapper preserves its
caller-supplied lifetime/origin and power, and schedules the first pulse at
creation time plus one second.

## Ordered lifecycle and HUD input

Current raw34 effects are periodic build clocks, replacing the old successful
cast chance and departure-cooldown path. Their actual equipped ordinals own the
same generic timestamp/counter lanes read by the build HUD. The first summon
is immediate; later summons are due at the previous spawn timestamp plus
`max(effect[8] * global_cooldown, effect[12])`. Current Pit Lord and Felguard
records supply duration 20, period 30 and minimum period 13. Each origin admits
two overlapping temporary followers, rejecting a third until one expires.
The timestamp is the spawn clock, not a precomputed deadline. Its HUD projection
uses the same current global cooldown, including active cooldown auras. The live source
uses the same lanes for `hud_build_timers`, so cooldown changes also update the
remaining-time projection.

Gate raw32 shares that equipped traversal. Its first ordinary tick installs an
initial deadline without summoning. Later attempts require an enemy within
35 yards, use the current four-second period/floor and alternate 16/12-second
lifetimes from the previous activity counter. `1459a3280` constructs the pool
as Imp, Succubus, then independently Felhunter and Voidwalker when their talents
are present. `1459f2d70` chooses the entire group with replacement using 64-bit
multiply-high rejection before any creation/landing callback advances the RNG.
The source at this historical recovery reused the existing matching
`uniform_index` owner. Creation then finished for each request in order,
stopping at twelve temporary lesser demons; permanent companions did not spend
that cap. Current source follows the superseding
[0.127.0 per-summon contract](warlock-population.md).

With Supremacy, Gate instead marks all current Infernal/Doomguard followers
every twelve seconds. Their next attack captures and clears the mark, passing
the same 1.5 factor to any synchronous echo. Ordinary successful damaging casts
retain only raw33 greater-demon chance summons. Doomguard rank is applied by its
focus consumer; the summoned actor itself retains power multiplier one.
Infernal keeps its recovered 0.2-per-rank multiplier. Allocation refresh updates
existing followers’ current rank/config inputs while preserving their captured
creation-time power multiplier. The permanent Supremacy
initialization follows the same distinction, without the former flat 25% bonus.
The compact Begin excerpt `14590e066..14590e264` records the current greater
companion discovery and the distinct rank multiplier consumers.

`14592d2c0` performs expiry before the Gate/build/pulse stages. Its predicate is
`now + 0.0001 >= ends`; `1459c4ce0` compacts survivors in their existing order.
There is no current departure mutation of a build timestamp. That stable order
also supports the addon snapshot's merged ordinary/special allocation order.

## Evidence and validation limits

The [manifest](evidence/0.112.0/demon-actors/manifest.json) binds exact current
PE bytes, descriptor data, canonical target/cooldown/pool/expiry/retain extracts
and Ghidra Evidence IDs. Shared time-effect ranges refer to the
[canonical selected excerpts](evidence/0.112.0/demon-time-effects/manifest.json);
the [addon bridge](evidence/0.112.0/addon-bridge/manifest.json) owns the
shared stable-retain assembly. Raw-slice pseudocode has inferred types and can
omit external jump-table arms or floating returns. Exact Win64 instructions,
installed constants and the native replay control those interpretations.

The authored source regressions also consume the 60 current build admission
vectors, 56 non-Doomguard cadence vectors, 84 summon/landing vectors and 30
ranged deadline boundaries; they remain uncompiled.
[Spell math](demon-spell-math.md) owns additional current Infernal
deadline, Doomguard rank/focus and Pit Lord list proofs.

`python3 -B scripts/check-demon-actors.py` passes **1,005 bounded native
cases** and thirteen descriptor hashes: 151 target choices, 77 cooldown cases,
60 timed-build cases, four expiry boundaries, 144 Gate cases, 32 stable
compaction cases, 84 summon/landing cases, 30 ranged deadline boundaries and thirteen display
scale cases, 74 Imp admission/window cases and 336 melee vector/Momentum/Echo
cases.
Gate cases cover both optional companions, three RNG states,
first-delay/enemy/cap/lifetime/Supremacy behavior and deliberate creation-side
RNG advancement after the complete group draw. Query, modifier, allocator and
summon seams are explicit in each fixture. Melee vectors cover five special kinds, area/softcap boundaries, zero through
fourteen queried neighbors and swing counters through wrapping, followed by
sixteen dead/missing Echo filters. Their shared vector append, packet and common
melee calls are explicit seams. Imp vectors exercise the complete native
one-second timestamp compaction and exact retained348 selector. The landing wrapper additionally
substitutes event serialization and host log1p rounded to f32. These execute selected original
instructions in an interpreter; they do not execute Rust or a game process.

Changed actor/lifecycle source parses with the existing project rustfmt.
The [common movement repair](demon-movement.md) connects current
short-distance probe order and packet duration. The [current build-countdown HUD](build-countdowns.md) consumes
the scheduler projection through the existing build visibility/scale/position.
Compilation, authored Rust regression execution, real MPQ actor navigation,
animations, displayed timers, army cadence, original/rebuilt interaction and
visual/gameplay parity remain unverified. Historical 0.105.0 actor/effect
reports and fixtures retain their original target rather than certifying this
version.

## Retained reports

[0.105.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/demon-actors-0.105.0.md)
