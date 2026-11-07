# Player ability execution

**Later integration checkpoint (2026-10-18):** playable-level integration followed this source checkpoint. The [live adapter and validation report](playable-zones.md) owns the new builds/tests, twelve-zone captures and remaining engine/presentation/persistence gaps. Source-only/no-adapter statements below describe the preceding recovery checkpoint; they are not current application status. Full native parity remains unverified.

This is static reconstruction against the supplied
`AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
It accompanies the [catalog, damage and upgrades report](player-abilities.md).
The source described below was written on 2026-10-18. **No builds, compiler
checks, tests, emulation, original-game launches or rebuilt-game launches ran.**
There is no installed gameplay adapter or verified gameplay parity.

The [native evidence manifest](evidence/player-abilities/behavior-native.json)
binds 24 complete native functions and nine interior cast-branch slices to their
original bytes, file offsets, SHA-256, REA/Ghidra evidence IDs and retained text.
It also retains the original relative jump tables, scalar bytes and imported
CRT identities. [Slice preparation](evidence/player-abilities/behavior-slices.json)
and [the reproducible extraction script](../../scripts/recover-player-ability-behavior.py)
are target-bound. The script's default prepares exact slices/plans; `--collect`
retains already completed REA analyses and original disassembly. REA uses the
Ghidra provider through `scripts/rea-batch.py` / `./scripts/rea`.

## Owning native code and source

The original cast function is `0x1454e7a20..0x1454eb952`; its twelve-entry
relative table is `0x1469acef4`. Current definitions use kinds0–11 only. Adjacent
relative tables are status transformations, not additional ability kinds.
The full cast decompilation stops at its external jump table. Importing unchanged
bounded slices beginning at the actual case labels recovers those branches;
their live registers and Windows x64 argument locations are checked in the
original full-function assembly. Interior entries are not claimed to be separate
original functions. A sparse analysis-image experiment did not improve the full
dispatch recovery and is disposable runtime material, not specification evidence.

Source is under `src/player_abilities/behavior.rs` and `behavior/`:

| Source | Recovered behavior |
| --- | --- |
| `behavior.rs` | Native88-byte instance semantics, learned defaults, ordered auto-cast scheduling and high24-bit crit/overcast draws. |
| `dispatch.rs` | All twelve native cast-kind entries, gates, target selection, direct/deferred hits, chain hops, area creation and self-casts. |
| `targeting.rs` | Native base/ranked/execute/DoT/cone queries, ground density placement, exact shuffle rejection sampling. |
| `execution.rs` | Projectile travel, launch-time crit and captured80-byte pending-hit semantics, due-frame detachment and DoT-context decoding. |
| `periodic.rs` | Area and actor periodic records, duration/tick/power arithmetic, stack replacement and due-tick state transitions. |
| `buffs.rs` | Self-buff gates, player aura replacement, healing reserve depletion and reserved-shield lifecycle. |
| `state.rs` | Secondary-effect scaling, slow/weaken/Fear writes, root/stun immunity windows, health/absorb math. |
| `totems.rs` | Actual summon object fields, captured/current learned ability selection, lifetime, pulse schedules and AoE/projectile pulses. |
| `totem_passives.rs` | Call of Flame expiry explosions, shared passive intervals/deadlines, recursive multi-hit ordering and talent22 prepulse healing. |
| `passive_tick.rs` | Shared class resources/queues, Bloodrage/Seal Fate/Soul Fire bursts, Redemption resolution, Hunter/Faerie upkeep, Lightwell objects/pulses and Polymorph expiry. |
| `hit_passives.rs` | Source-context gates, hit resource credit, Polymorph application/break, Soul Fire kill credit, Redemption enqueue and Hunter/Faerie death work. |

These are concrete source operations over supplied run/actor state. Required
ports emit actual packets, resolve terrain, perform canonical hit/death/heal
operations and recompute player stats. No flat world, substitute enemy table, fake damage result or no-op
implementation of those ports is installed. Damage arithmetic is shared with
`damage.rs`; definitions and statuses come from `catalog.rs`.
The native cast-entry unique-spell vector is also updated before any gate,
including failed attempts; it is not misrepresented as successful-cast history.

## Scheduler and runtime fields

Native ability rows have stride88. The semantic instance retains rank+8,
remaining+12, power/cooldown multipliers+16/+20, target bonus+24,
area/duration multipliers+28/+32, five **u32** upgrade counts+36..52, talent
power/cooldown+56/+60, talent targets+64, talent area/duration+68/+72,
health-derived power+76 and effect multiplier+80. Native+84 is uninitialized
padding. Learned rows start at rank1, remaining0.5, all multipliers1 and other
values0; the initializer is current upgrade-apply `0x1454e457b..0x1454e45ef`.

The owning main tick is `0x14549d550..0x1454aaf72`. Its ability loop decrements
and handles one row before the next. Kind11 is clamped at zero and skipped.
A ready active row gets infinity before casting, allowing cast/proc work to
shorten cooldowns without being overwritten. Failed gates retry after0.2s.
Successful work runs before rescheduling, which retains the smaller existing
deadline. Native minss plus unordered restoration is preserved. There is at most
one ordinary cast per row/frame and no overshoot carry.

The shared successful interval is the canonical `damage::cooldown`:
`max(base_cooldown*1.4*runtime_cd*talent_cd*global_cd,0.25)`, plus the scaled
duration floor0.1 for status11 **invulnerability**. That tag is not a channel.
Cast power uses current maximum health at Game+1112/0x458 and outgoing multiplier
Game+1116/0x45c. Current HP is Game+1024/0x400, as shown by heal thresholds and
the current main-tick refill, not the maximum-health field.

Crit and overcast consume the shared xoshiro256++ stream using high24 bits and
`2^-24`. Placement floats elsewhere use high23 bits; those are not interchangeable.
Overcast adds the whole factor, then counts consecutive fractional successes
over one plus the supplied variant24 talent count, stopping on first failure.
The scheduler's real adapter must preserve Game+0x7ec extra-cast context.

## Cast-kind behavior

| Kind / count | Native entry | Implemented dispatch |
| --- | --- | --- |
| 0 /24 | `1454e7c4a` | Ranked in-range targets, truncate to target count; Aimed Shot moves its current focus GUID to the front; launch each projectile. |
| 1 /5 | `1454e7c4a` | Shuffle ranked candidates, then repeat cyclically to the requested count. Arcane Missiles prefers metadata-bearing or flagged actors when any exist. Uses the shared projectile/deferred-impact constructor too. |
| 2 /16 | `1454e7ea6` | Player-centered live-actor radius, individual crits and secondary effects; status6 permits an empty victim list and heals the player once after all hits. |
| 3 /8 | `1454e86dd` | Player-centered placement for nonpositive range; otherwise choose the densest of at most24 nearest in-range candidate centers. Equal density replaces the previous winner. Terrain-height correction, actual ground object, periodic record. |
| 4 /1 | `1454e7cc8` | First ranked victim then nearest unvisited victim around each preceding victim. One launch visual; pending impacts at `now+index*0.08`, power multiplied by `powf(0.92,index)`, or1 with native talent variant23. Individual crit draws. |
| 5 /9 | `1454e7c70` | Ranked melee targets truncated to count; visual then direct crit-adjusted hit/status calls. |
| 6 /12 | `1454e7c9e` | Rank high-health candidates within native category, filter current same-spell stack cap1–4, prefer metadata/flagged actors then fewest ordinary stacks. Projectile carries DoT context and zero immediate damage. |
| 7 /3 | `1454e7c70` | Execute-specific category/health-ratio ordering; power doubles strictly below30% HP before crit. |
| 8 /2 | `1454e82bb` | Actor iteration order, inclusive range, distance>.01, normalized facing dot strictly>.5; direct hits and statuses. |
| 9 /21 | `1454e8880` | Current heal/shield/invulnerability gates and concrete aura state described below. |
| 10 /2 | `1454e7cf6` | Nearby25-unit gate, no-target cast, summon1.5 units along adjusted facing, original object fields and live pulse rows. |
| 11 /9 | `1454e9527` | Native cast returnsfalse; scheduler excludes this kind. The separate hit/timer/totem consumers below implement these class specials. |

The common target count treats base0 as1; otherwise it adds global, runtime
and talent target bonuses with native integer wrapping, then floors at1.
The base radius helper uses state-zero actors, interpolated XY, inclusive squared
range, explicit exclusion GUIDs, and a distance-only f32 total-order comparator.
Ranked targeting separates metadata-bearing, flagged, ordinary and native
avoid-target actors. Ordinary actors within6 units are sorted by absolute HP;
farther ordinary actors retain distance order. The avoid-target deadline is
Actor+320, currently named `fear_until` in the existing AI source; this report
does not infer that it is the shared Fear status. Shared status4 writes+336.

Area/cone/chain radii above70 use imported **log1pf**:
`70 + 10*ln(1+(radius-70)/10)`. The source does not substitute a square-root
curve. Ground density includes every live actor, including those beyond the
player's placement range but within the candidate area; current collector
`0x1455267d0` explicitly filters actor state0 and interpolates movement.

## Deferred and periodic state

Projectile construction is `0x1454ef3b0`. It captures the moving victim, emits
the visual, rolls crit at launch, and queues an80-byte hit. Travel uses the
current shared hardcoded spell-ID speed lookup `0x1454f08d0`, not catalog+96.
Zero speed means zero travel term. The queue preserves source/caller context,
source/victim GUIDs, status, due time, spell, crit-adjusted power, crit flag,
player-victim flag, overcast and school. Due hits are detached before processing;
newly emitted hits wait for a later pass. The owning adapter must restore the
captured Game context around the canonical damage/status/proc operation.

Ground areas normalize base ticks to at least1, scale duration by1.4 and both
duration multipliers, then `roundf(scaled/base_duration*base_ticks)` with a0.01
denominator floor and at least1 resulting tick. First tick is now+0.25; interval
is scaled_duration/resulting_ticks; damage per tick divides by **base** ticks.
Removal is `(scaled_duration+now)+0.3`. The queue removes expired objects before
ticking, performs at most one due tick per row/frame, and increments the old
deadline. Victims/crit are sampled separately at each tick.

DoT construction separately scales tick count with Game+0x4a0 and total power
with the same factor and scaled/base duration ratio. The projectile's caller
words are `[1,total_power_bits,total_duration_bits,ticks]`. Impact installs the
current48-byte actor periodic row; immediate raw damage is zero. Current stack
cap is `min(Game+0x49c,3)+1`. The shared constructor first removes exhausted
matching rows, then evicts the matching row with fewest ticks remaining while
at cap. Kind1 rows match their source GUID separately. New next-tick time is
the current clock, and the actor update collects at most one due tick per row
before resolving combat requests. Empty rows remain until later replacement.
The raw tick request retains school, leech fraction and first-player-tick flag;
its final damage/proc/packet consumption remains the actual world adapter.

## Self-casts, statuses and summons

Self-heals fail above85% current maximum HP; immediate healing uses
`sqrt(runtime_power*talent_power)*1.4*maxHP*effect_value`. Positive-duration
heals store the total remaining healing in aura+20. Each frame consumes
`min(delta/max(expires_at-now,delta),1)` of that reserve, then performs expiry.
Invulnerability fails above35% HP. Shield casts refuse a duplicate same-spell
aura, replace the previous reserved shield contribution, and include current
shield bonus/effect multiplier. On expiry the reserved contribution is removed.
Other self-casts require an actor within30 units and replace their own spell's
auras. Status12 reactive power multiplies its value by runtime and talent power.

Hit-status transformations use talent duration for slow/weaken durations,
effect multiplier for single-value variants, and weaken cap0.95. The shared
consumer `0x1454ed630` implements actor slow/weaken replacement, metadata-absent
Fear/forced escape, damage/max-HP healing and absorb. Root/stun uses a shared
movement-stop/control window,25% duration for metadata-bearing actors, maximum
continuous3 seconds and immunity for2 seconds after expiration. Packet auras,
height correction and hit-triggered aura insertion still require world binding.

Summons retain a complete ability instance followed by GUID, position, expiry,
next tick and interval. At each pulse the current matching learned instance is
preferred; the captured instance is the fallback. Lifetime is scaled duration,
first pulse now+0.5, and subsequent interval is **unscaled** base duration/base
ticks. Expiry precedes pulse. Magma emits direct AoE; Searing emits individually
crit-rolled delayed projectiles, using pulse spell-ID speed with minimum1.
Definition+100 is therefore `pulse_spell_id` (8187/3606), not a creature entry.
Both object entries are9500; model4589 is Magma and4587 Searing. Exact GUID,
owner/creator, health, faction, scale/model and other field values are in source.

Totem expiry now invokes the [recovered passive helper](player-totem-passives.md)
before removing the object. Call of Flame explodes at the expired totem; it
does not replace it. A learned, ready instance needs at least one live target
before its shared per-key deadline and displayed cooldown are consumed.
Before each pulse, current talent22 rows heal a fraction of maximum health,
publish health fields even for zero effective healing and retain the native
provenance fallback. The source mutates health once before emitting those actions.
Each pulse queries current actor/health metadata after preceding explosions.
Pulse crit chance/multiplier are read live per victim. Synchronous direct hits
receive the same mutable run RNG, preserving downstream proc draws before the
next victim's crit draw; ordinary totem hits retain their own attribution.

The shared passive multi-hit helper preserves original GUID order, rolls each
crit with the same run RNG as recursive hit/proc work, and restores attribution
after every hit. Matching talent13 rows permit a second pass over surviving
original GUIDs; they do not select new nearby victims. Visual spell IDs remain
separate from the ability definition's actual damage spell ID.

## Class-special hit and timer consumers

The [timer report](player-passive-tick.md) owns resource regeneration,
burst gates, current special-target selection, due queues, mark upkeep,
Lightwell entity fields/pulses/bounces and Polymorph expiry. The
[hit/death report](player-hit-passives.md) owns normal-source gates,
Bloodrage/Seal Fate gains, Polymorph application/break, Soul Fire kill credit,
Redemption probability/enqueue and Hunter/Faerie death transitions. These
consumers share `PassiveTickState`, first-match per-key deadlines and the
same native RNG; they do not substitute ordinary WoW class behavior.

Bloodrage retains fractional credit and decays its pool after the native
three-second idle gate. Seal Fate retains fractional bank credit and publishes
its five-point burst. Soul Fire credits qualifying deaths with a separate
interval/5 gate, then captures delayed crit-adjusted hits. Redemption keeps
at most four queued effects, preserving the probability arithmetic, half-second
spacing and recursive-chain context. Polymorph checks readiness/eligibility
before its12% draw and tracks actual movement/model/aura changes and break bursts.
Hunter's Mark and Faerie Fire preserve their native selection, hysteresis,
charge/cap, replacement and death-order rules. Lightwell creates its recovered
entry9012/display6671 object, keeps at most three wells and runs the current
per-well pulse and equipped-gear bounce consumers.

Ordinary cast/projectile and periodic sources now also read live crit stats
through `CastPort`. Current assembly reads Game+0x464/+0x468 per victim/launch
(for example `1454e80b8`, `1454e8518`, `1454ef872`, `1454a4e94`);
the source no longer captures one crit snapshot for a whole cast/frame.

## Remaining work and limits

- Bind these modules to an actual gameplay world/schedule, real actors and live
  maximum/current health, canonical hit/death/heal consumer, terrain and packets.
  The menu application does not install such an adapter.
- Complete successful-cast/hit proc integration, reactive shields and live
  run-stat recomputation. Required engine ports remain unbound in the menu.
- Bind deferred DoT impact installation and actor periodic combat-request
  consumption; source reconstructs their state/timing but does not substitute
  a second damage/death implementation or guess final packet/combat attribution.
- Bind weapon/ammo/DBC visual metadata and actor/player aura updates. General
  `SpellCast` requests reuse the existing current boss/world packet port.
- Compare Windows CRT float results and equal-key sorting against execution.
  Recovery checks the actual imported functions and comparison predicates;
  source-only analysis does not establish bit-level cross-platform parity.
- Compile and perform meaningful original/rebuilt gameplay comparisons as
  separate validation. No game, compiling test or emulation harness was run
  during this checkpoint.
