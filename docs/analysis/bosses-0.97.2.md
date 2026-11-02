# Bosses — 0.97.2 source reconstruction

**Later integration checkpoint (2026-10-18):** playable-level integration followed this source checkpoint. The [live adapter and validation report](playable-zones.md) owns the new builds/tests, twelve-zone captures and remaining engine/presentation/persistence gaps. Source-only/no-adapter statements below describe the preceding recovery checkpoint; they are not current application status. Full native parity remains unverified.

Date: 2026-10-18. Authoritative target:
`AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This checkpoint covers boss source, zone assignments, spawn timing, abilities
and behavior. **No compilation or game launches were performed.**

The [boss source component](../../crates/azeroth-survivors-re/src/bosses/mod.rs)
implements all **60 scheduled bosses in 12 zones and their 191 ability records**
using REA/Ghidra and selected-target instruction/data evidence. Source recovery,
native evidence and verified application behavior remain separate: this component
has not been compiled, its Rust tests have not run, and gameplay is not connected
to the menu's world loop.

## Owning source and evidence

| Source | Recovered responsibility | Detailed report |
|---|---|---|
| `catalog.rs` | Reuse the canonical 60 boss definitions and 191 raw abilities; exact fixed placement points. | [Complete per-zone boss and ability roster](boss-catalog-0.97.2.md) |
| `spawning.rs`, `placement.rs` | Scheduled cursor, endless repeats, startup flag, terrain/path placement and fixed-point selection. | [Scheduling and placement](boss-spawning-0.97.2.md) |
| `scaling.rs` | Health/damage/speed, entity fields, GUIDs, initial stun and ability timers. | [Creation and scaling](boss-scaling-0.97.2.md) |
| `ai.rs` | Enrage, cooldown collection, shared movement/melee/status gates and deferred actor lookup. | [Hash-bound AI spans](evidence/0.97.2/bosses/ai-native.json) |
| `abilities.rs` | Five dispatch types, ground objects, projectiles, minions, charges and delayed damage. | [Ability effects](boss-abilities-0.97.2.md) |
| `death.rs` | Kill rewards, equipment, magnet schedule, experience attraction, boss meter and completion transitions. | [Death and completion](boss-death-0.97.2.md) |

Definitions are shared with the existing guardian catalog; they are not copied
into a competing boss table. Shared actor movement/status handling and spawn
geometry reuse the existing enemy source, with boss-specific stages and caller
distances. Boss summons call the actual ordinary-enemy constructor through a
required engine port and preserve its cap, scaling and shared counters.

## Zones and spawn times

Each zone has five primary bosses in catalog order. The roster report lists every
name, ID, exact scheduled minute, stats and decoded ability input/cooldown.

| Zones | Primary boss minutes |
|---|---|
| Elwynn Forest, Duskwood, Warsong Gulch, Un'Goro Crater | 3, 6, 9, 12, 16 |
| Arathi Basin, Feralas, Gurubashi Arena, Scarlet Monastery | 4, 7, 11, 14, 18 |
| Alterac Valley, Blackrock Mountain, Ahn'Qiraj, Naxxramas | 4, 8, 12, 16, 20 |

An admitted active tick creates at most one due scheduled boss and advances the
cursor before creation. Previous bosses need not be dead. A suppressed tick does
not advance the schedule. After all five entries are consumed, endless mode picks
one uniformly and sets the next deadline to `now + 300` seconds. That deadline
starts at zero, so the first endless repeat can follow the fifth scheduled spawn
on the next admitted tick. The distinct run-start raw flag at Game+`0x958` creates
all five immediately without consuming the schedule; no unverified mode name is
assigned to that flag.

Scarlet Monastery and Naxxramas use four and six fixed XY points. Points at least
20 units from the player are eligible for uniform selection; if none qualify,
the original float ordering selects the farthest point, with later points winning
ties. Other zones use the shared terrain/path sampler at distances 24–28 and
forward chance zero, including its original retry/fallback sequence.

## Combat behavior

Boss construction applies the recovered zone/difficulty/endless/modifier scaling,
starts remaining melee delay and interval at two seconds, schedules movement at
`now + 1`, and stuns the new actor until `now + 1.5`. Each ability starts with
60% of its catalog cooldown. The creation report preserves f32 operation order
and external power-function seams.

The shared actor path first handles death, fear, stun and forced escape. Only an
actor reaching the boss stage advances its ability timers and enrage state.
Enrage latches when `max_health * 0.3f32 > health`, increases speed by 1.25 and
damage by 1.4, and resets future expired ability timers to 70% of their catalog
cooldown. Healing does not clear it. The rounded f32 comparison matters: with
maximum health 100, the computed threshold is slightly above 30. Each timer
decrements once per admitted update and can fire once; overshoot is discarded.

Expired abilities queue in slot order. After the frame's movement/melee/aura
stages, dispatch looks the actor up again by vector index, skips missing/dead
actors and re-reads current position, damage reduction and enrage. Existing
delayed effects resolve before new actor updates, use the player's current
position, and survive the originating boss's death.

| Type | Catalog records | Behavior |
|---|---:|---|
| Delayed ground area | 29 | Telegraph at the captured player aim; one delayed radius hit and optional impact spell; remove object. |
| Missile volley | 27 | First aim at player, later random nearby aims; native speed lookup, travel deadline, radius 2.5, damage ×0.45. |
| Summon | 60 | Radius-five ring; zone enemy index pattern 0, 0, 1; native minion count and constructor. |
| Immediate area strike | 44 | XY radius test, spell visual and catalog damage factor; boss GUID damage attribution. |
| Charge | 31 | Terrain/collision-adjusted destination, speed 24 with minimum 1.1 seconds, then spell 6343 radius 4.5 at twice effective damage. |

The [ability report](boss-abilities-0.97.2.md) documents exact targeting, RNG draw
order, terrain fallback, object fields and delayed attribution. Spell IDs do not
authorize conventional WoW status effects absent from the recovered branches.

Death increments boss kill count before calculating experience/gold, reuses the
existing equipment owner, consumes due magnet deadlines and attracts idle
experience pickups. A final-slot boss can start the completion phase; normal
mode finishes at the main tick's separate gate, while endless continues. The
death report separates native boss-meter timing, movement stop, victory packet
and account-event requests from later unimplemented engine/persistence consumers.

## Validation and remaining work

[Static checkpoint and artifact hashes](evidence/0.97.2/bosses/source-validation.json)
record exact target-byte verification, independent catalog regeneration, retained
REA provenance, report links and bounded native instruction fixture counts.
The checkpoint retains **3,166 native input cases/rows**: 252 scheduling/placement,
480 creation, 1,936 AI, 153 ability effects, 300 death, 32 completion, six meter
and seven pickup rows within one attraction scenario. Static verification passed
467 unique PE byte spans, 34 retained assembly digests and 38 report links,
with 18 unique REA records retained.
Native instruction fixtures use synthetic state and declared external seams;
they do not execute the Rust implementation or launch the game. Source tests are
authored for catalogs, schedules, placement, creation, AI, effects and death.

No build, compiler check, Rust test, original launch or rebuilt launch was run.
Actual world/terrain/path/entity/packet/damage/account adapters and shared frame
ordering remain required. Windows CRT math equivalence, rendered behavior and
original/rebuilt runtime parity remain unverified. There is no static-recovery
blocker for this boss source checkpoint. Delivery is a local source/evidence
commit; the standing menu-parity restriction still prevents a GitHub push.
