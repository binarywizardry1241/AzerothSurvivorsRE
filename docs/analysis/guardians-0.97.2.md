# Guardians — 0.97.2 source recovery

**Later integration checkpoint (2026-10-18):** playable-level integration followed this source checkpoint. The [live adapter and validation report](playable-zones.md) owns the new builds/tests, twelve-zone captures and remaining engine/presentation/persistence gaps. Source-only/no-adapter statements below describe the preceding recovery checkpoint; they are not current application status. Full native parity remains unverified.

Source checkpoint: **2026-10-18**. Guardian behavior was recovered through REA.
Final-source compilation, compiling tests and game launches were not performed.
Authored tests remain available; final-source compilation and parity are unverified.

## Authority and source boundary

The reconstruction baseline and package version are **0.97.2**. The selected
project-local target is `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
All addresses here are original preferred VAs, image base `0x140000000`.
Earlier guardian reports under `evidence/guardian-*` belong to **0.91.4** and
were not used as implementation specifications. The identity refresh record
is historical; its old implementation-baseline description predates this work.

Source lives in [guardians](../../crates/azeroth-survivors-re/src/guardians/mod.rs):
`catalog.rs`, `placement.rs`, `ai.rs`, `scaling.rs`, `rewards.rs` and `addon.rs`.
It reconstructs guardian-specific logic as a library with required ports to
the real engine. The menu has no gameplay/world loop, and these components do
not make a playable run. Reference EXE bytes are unnecessary for source builds;
the catalog is generated source, and all original/derived binaries stay ignored.

Owning evidence:

- [Function identities and bounded instructions](evidence/0.97.2/guardians/manifest.json)
  and [REA dossiers/provenance](evidence/0.97.2/guardians/rea-provenance.json).
- [Exact catalog](evidence/0.97.2/guardians/guardian-catalog.json): twelve zones,
  148 enemies, sixty boss records and 48 health-curve knots, including original
  strings, float bits, source ranges and hashes.
- [Reward producers and consumers](evidence/0.97.2/guardians/guardian-rewards.json).
- [Validation state](evidence/0.97.2/guardians/source-validation.json), including
  compilation status and earlier, superseded attempts.

REA ran through `./scripts/rea` with Ghidra 12.1.4 on exact, unmodified function
slices mapped at original VAs. Raw imports use the generic GCC ABI; original
Win64 instructions/registers were used to check arguments and operand order.
Large dossiers exceeded MCP's response budget; analysis completed and the full
retained bundles were exported. That transport status did not truncate the
saved evidence. All opened analysis sessions were closed. Static decompilation
is not execution, and decompiler output is not original source.

## Lairs, initial delay and respawning

Initialization `1454b2274..1454b37dc` skips lair creation when the opaque native
suppression byte `Game+958` is nonzero. Normal initialization creates four
ordered slots with empty active IDs and a first-spawn deadline of **20.0
run-seconds**. Ordinary zones select enemy definitions whose `+4c` byte is
exactly one and whose `+48` float is finite, preserving definition order and
cycling through the candidates. Naxxramas instead supplies indexes 12–15:
Highlord Mograine, Thane Korth'azz, Lady Blaumeux and Sir Zeliek.

Positions use the actual selected zone's center, orientation and lair-radius
override. The source preserves explicit points in Scarlet Monastery,
Alterac Valley, Blackrock Mountain and Naxxramas, and the Arathi Basin/Gurubashi
radius overrides. Other slots sample deterministic radial fractions
`0.70, 0.62, 0.54, 0.46, 0.38`, checking the original 5×5 blocked neighborhood
and ADT height difference below 30. If all fail, half-radius placement is
accepted without repeating those checks. ADT/WMO/fallback-height queries are
required engine inputs. No synthetic terrain is supplied. Host trigonometry
and actual navigation/terrain parity remain unverified.

Respawn tick `1454a97df..1454a9ddc` checks empty slots against their run-clock
deadline and the same suppression byte. Each due slot creates one guardian
at its saved home using its saved enemy index. There is no catch-up loop.
Creation uses the current clock/kill-count scaling, scale `definition.scale *
1.35`, speed `definition[+3c] * speedPercent/100`, melee reach `scale*1.2+2.2`,
and initial attack delay `definition[+38]*0.5`. Native ability timers begin at
`[4.5, 3.5, 8.0]` remaining seconds. GUID packing uses the shared wrapping
creature counter and `F130` creature prefix. Facing consumes the shared
four-word run RNG, not a private guardian stream. The refill announcement is
emitted only when the run clock exceeds 21.0 seconds.

Death clears a valid lair and schedules **current run time + 180 seconds**.
It increments the wrapping guardian kill counter even if the stored lair
index is invalid. Lair/home identity persists across respawns. The engine
must call death dispatch once and supply the native pause-aware run clock.
Nearest-lair hint cache invalidation/announcements need the real UI owner;
this library does not invent a waypoint delivery cadence.

## Waking, leash and combat

State helper `14550a0a0..14550a1cf` and actor caller `1454c9510` establish:

| State/input | Result |
| --- | --- |
| Sleeping, damaged | Wake, including during a return |
| Sleeping, within 3 XY units of home and player within 20 XY units of guardian | Wake |
| Awake, player at most 97.5 XY units from home | Ordinary combat |
| Awake, player farther than 97.5 XY units from home | Sleep, restore maximum health, clear periodic effects and slow fields; cancel cast and move home |
| Sleeping without a wake condition | Idle/return; combat timers do not advance |

The leash tests **player-to-home** distance. Z is ignored by these decisions.
An idle guardian farther than two XY units from home resumes home movement
after its previous path finishes. Returning does not reset its ability timers.
The source emits typed decisions requiring the actor owner to apply the
movement/effect/cast changes; it does not replace ordinary enemy combat.

Wake queues a stat refresh. A higher maximum health preserves
`clamp(oldHP/oldMax,0,1)`; a lower maximum does not reduce the actor. Damage is
also retained at the larger value. Ordinary movement interpolation, dead,
stun, cast, path and aura gates belong to the shared actor owner.

The three guardian ability records at `1469aab94` are recovered and coded:

| Ability | Recovered action | Repeat interval |
| --- | --- | --- |
| Charge | Spell 100, collision-adjusted charge at speed 24, minimum duration 1.1s; arrival spell 6343 in radius 4.5 for twice effective damage | 9s |
| Area strike | Spell 6343, radius 8, effective damage ×1.4 | 7s |
| Summon minions | `Minions, to me!`; four adds at radius 5, enemy indexes `[0,0,1,0]` | 16s |

Timers subtract elapsed time only on the admitted guardian combat path. Each
expired timer fires once in slot order; overshoot is discarded. Below native
`maxHP*0.3f`, the replacement interval is multiplied by `0.7f`. The source
preserves f32 comparisons, including rounding at the apparent 30% boundary.
Charge backs off half a unit from obstacles, samples real endpoint height,
sets next-move time to arrival +0.2s and attack delay to duration +0.3s. The
arrival attack checks the player's then-current position. Typed dispatch
requests require actual collision, spell, damage, summon and packet ports.

## Health and damage

Native guardian health `1454ef9f0`, damage `1454efdf0` and curve collector
`14552b760` were recovered independently against the new EXE. Let `t` be run
minutes, `k` guardians slain, and `z = zoneScale*difficulty`. `B(t)` is the
native boss-health curve, built from the first five boss records, omitting
rows whose final flag is exactly one.

```text
HP = max(B(t)*0.6*z,
         (1 + 0.12*t + 0.009*t*t)*z*enemyBaseHP*2.5)
     *3*endlessHP*(1 + 0.25*k)*(healthPercent/100)

damage = enemyBaseDamage*sqrt(z)*(1 + 0.08*t + 0.004*t*t)
         *1.4*endlessDamage*(1 + 0.05*k)*(damagePercent/100)
```

These are explanatory formulas. Source preserves the actual separate SSE/f32
operand order and NaN selection. The curve has its recovered first-segment
ramp, interpolation, final-segment extrapolation and minimum denominator.
Endless multipliers apply only for native phase one plus the endless flag:
`1.22^elapsedMinutes` for HP and `1.096^elapsedMinutes` for damage, with elapsed
minutes clamped to zero. A required/injectable `powf` boundary keeps Windows
CRT versus host-library equivalence explicit.

## Death and rewards

The guardian branch `1454c422b..1454c44d8` performs these effects in order after
its lair/counter updates: localized slain announcement, sound 8174, account
event `{type:"guardian", name:<localized name>}`, gold pickup, scheduled
magnet opportunity, and one pending strength award. Gold amount is
`25 + 5*postincrementGuardianKills`, with wrapping integer arithmetic: the
first kill requests 30 gold. Actual gold collection applies the shared run's
gold multiplier and updates the shared tally.

For each captured pending strength award, the active tick increments pending
jewelry and requests enough XP for the **current** level threshold, at least
one. The threshold is native `roundf(5+4*n+0.35*n*n)`, where
`n=level.saturating_sub(1)`, preserving f32 operation order. Each actual XP
callback can change level/XP and open a normal level-up spell choice. The
captured loop continues; the guardian jewelry request happens only after its
final active-state/suppression/pending gate. It uses mode 2, pause=true and
generation parameter 0.25. Shared item eligibility, caps, rarity generation,
choice consumption and account/save mutation require their real owners.

The optional shared magnet helper examines only the first schedule deadline.
Only a due head consumes one 24-bit shared-RNG draw. A draw below 0.5 removes
that head and requests a kind-6 magnet at death XY+(-2,+1.5), preserving Z.
The collection consumer confirms a magnet, not a soulstone. Source keeps
this shared helper distinct from guaranteed guardian rewards.

## Addon projections

The current lair producer `145515b10`, unit producer `145514650` and embedded
Lua establish separate guardian/unit and lair schemas. The source projects
already-produced guardian rows with native awake state and lazy shared debuff
lookup. Lair rows include one-based slot, awake/asleep/empty state, localized
name, low 32-bit GUID, home coordinates and respawn time; live slots use -1
for the remaining-time field. Missing or dead linked actors produce empty
slots. Map projection uses the native bounds/axis order without clamping;
absent bounds produce `(-1,-1)`.

See [addon producer evidence](evidence/0.97.2/guardians/guardian-addon.json).
The complete upstream unit-list alive/order filter, delivery, wire serialization
and VM scheduling remain outside this projection component. The source does
not equate possession of a schema with a working native addon bridge.

## Coverage and remaining work

Target identity, catalog, selection/placement rules, initial/respawn timing,
guardian-specific state transitions, ability requests, stat formulas and
guardian reward inputs are recovered and represented in source. The native
instruction oracles generated 306 scalar/curve/rescale, 36 state/timer and 16
lifecycle/RNG cases during native recovery. These are bounded emulated
instruction results with explicit seams, not live-game observations.

Final source tests are **authored, not run**. An earlier
library test attempt completed with 12 passed/1 failed (a boundary expectation
subsequently corrected); other attempts hit concurrent missing/generated files
and unrelated in-progress menu source errors. Those attempts do not validate
this final source. Final-source build and compiling-test results remain unavailable.

Still partial/unverified: full actor/world integration, navigation/collision
and real terrain, spell damage/proc/network adapters, actual reward UI and
save/account owners, complete native addon serialization/cadence, platform
math/trigonometry, rendered behavior and original/rebuilt parity. No game was
launched. Menu parity remains incomplete. Static recovery and source buildup are complete for
this checkpoint; full guardian runtime parity is not established.
