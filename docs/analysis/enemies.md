# Enemies source reconstruction

**Later integration checkpoint (2026-10-18):** playable-level integration followed this source checkpoint. The [live adapter and validation report](playable-zones.md) owns the new builds/tests, twelve-zone captures and remaining engine/presentation/persistence gaps. Source-only/no-adapter statements below describe the preceding recovery checkpoint; they are not current application status. Full native parity remains unverified.

Recovered on **2026-10-18** from the supplied project-local
`AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This checkpoint covers enemy source, zone assignments, spawn mechanisms and
behavior. No builds, compiler checks, Rust test execution or original/rebuilt
game launches occurred. Source recovery is separate from verified runtime parity.

## Source and coverage

The public [enemy source component](../../crates/azeroth-survivors-re/src/enemies/mod.rs)
contains these recovered owners:

| Source | Recovered behavior and owning report |
| --- | --- |
| `catalog.rs` | All 148 enemy definitions across 12 zones, exact names/model IDs/float bits and attack records. [Complete zone rosters](enemy-catalog.md). |
| `spawning.rs` | Ordinary eligibility, weighted selection, budget/population spawning, boss pressure factors, shared kill credit, primary placement and fallback. [Spawning report](enemy-spawning.md). |
| `waves.rs` | Roaming elites and four patterned waves, their deadlines, selection/counts, geometry and stampede movement requests. [Spawning report](enemy-spawning.md). |
| `scaling.rs` | Ordinary constructor HP/damage, difficulty/endless/modifier arithmetic, initial combat inputs/timing, population cap and GUIDs. [Creation report](enemy-scaling.md). |
| `relocation.rs` | Reposition up to four distant eligible ordinary actors per tick and reset only the native movement/cast fields. [Relocation report](enemy-relocation.md). |
| `ai.rs` | Ordinary movement, melee/casting, fear/stun/escape state and corpse removal; exact request boundaries to the engine. Native owners described below. |

The twelve zones are Elwynn Forest, Duskwood, Warsong Gulch, Un'Goro Crater,
Arathi Basin, Feralas, Gurubashi Arena, Scarlet Monastery, Alterac Valley,
Blackrock Mountain, Ahn'Qiraj and Naxxramas. Each has twelve enemy definitions
except Naxxramas, which has sixteen. Of the 148 records, 108 have ordinary flag
zero, 36 are finite-threshold flagged elites, and four are Naxxramas Horsemen
with infinite eligibility thresholds. Twenty-four records use spell attacks.

The roster report gives every enemy's zone, ID, first eligible minute and
melee/spell inputs. For example, Elwynn admits Kobold Vermin immediately, Young
Wolf from minute 0.5, Murloc Streamrunner from 1.2 and Kobold Geomancer from 2.
An eligibility threshold admits random selection; it does not force an actor
to appear at that exact instant. Native selection retains earlier enemies as
new ones become available.

Flagged definitions are also used by the existing [guardian source](guardians.md).
Its independent lairs first fill at 20 seconds and refill 180 seconds after
death. Naxxramas explicitly assigns its four Horsemen to lairs; their infinity
threshold prevents selection through finite-time roaming-elite gates. The
sixty scheduled primary boss definitions are separate records and are outside
the 148-enemy count. Their full scheduled-boss source is now owned by the subsequent
[boss checkpoint](bosses.md).

## Spawn and initialization rules

The recovered Game constructor initializes ordinary budget to **3**, shared
death credit to **0**, the patterned-wave deadline to **60 run-seconds**, the
roaming-elite deadline to **240 run-seconds**, and previous wave kind to **255**.
These values come from the original aggregate initializer, not conventional
survivor-game defaults; [initialization evidence](evidence/enemies/initialization-native.json)
binds its stack-to-Game copy and constants to this target.

Ordinary spawning uses both a cost budget and a population deficit. Admission
requires flag zero and `first_minute <= elapsed_minutes`; selection weight is
`min(1 + 0.5*max(minutes-first_minute,0),4) / spawn_cost`. Budget rate grows with
run time and density; active bosses reduce it, endless state increases it,
and decaying kill credit can accelerate it up to three times. The ordinary
constructor enforces a 50–120 live-actor cap. The spawning report and source
preserve f32 order, attempt limits, initial conditions and refusal behavior.

Spawn placement samples 26–36 world units around the player with a movement
heading bias, terrain/zone/blocked/path acceptance, shrinking radius retries
and a separate fallback. Distant eligible actors beyond 55 XY units are
relocated through the same placement owner with full forward bias. Actual
terrain and path grids must be supplied by the engine; no substitute map is
provided.

Roaming elites and swarm/stampede/wall/pack patterns use independent recovered
timers and selection rules. Their exact arithmetic, yells, coordinates and
stampede actor overrides are in the spawning report. The native active-run
gate and pause-aware run clock remain the owning Game's responsibility.

## Ordinary behavior

The owner is `1454c9510`, an actor update with earlier guardian and boss
dispatch branches. Reused REA/Ghidra Evidence
`ev_fec0ab5d5ba261d965364f92a8f153a10d9eeb80bde3e3d7c21caff632e529a5`
matches the original PE function slice SHA-256
`65114117995dbb7c0699d9f170e5b751ad863decf286531f7851646b0fe6f048`.
[Retained provenance, byte ranges and constants](evidence/enemies/ai-native.json)
and [decompiler observations](evidence/enemies/actor-update.ghidra.c)
are paired with original Win64 instruction listings. The Ghidra raw import
does not supply reliable ABI types or complete outside-call relationships.

- Ordinary enemies chase the current player. Their movement angle advances
  by 0.15 each refresh, giving a target offset around the player. Melee actors
  use their calculated reach and an offset radius of `reach*0.8`; casters use
  the definition's spell range plus four as the stop range, with the raw range
  as their preferred offset radius. Offset radius is at least 1.5.
- Caster destinations are clipped to the zone's inner disk, radius
  `max(zone_radius-2,1)`. Chase segments are limited to fourteen XY units before
  the real path query. Travel uses current speed with a 0.5 floor; movement
  refreshes after travel time clamped to 0.25–0.7 seconds. An in-range actor
  cancels unfinished movement before attacking.
- The remaining attack delay decreases during admitted combat ticks. When
  due and in range, melee attacks enqueue current effective damage and reset
  the delay to the attack interval. Spell attacks reset the same delay, start
  a cast for the exact recorded duration and complete on a later update when
  its deadline is reached. Completion does not recheck target range. The
  engine receives separate begin/complete cast requests with the original
  spell ID; projectile/effect resolution is a required external owner.
- Fear turns the movement angle by 2.4, moves two XY units with collision
  backoff, sets duration 0.8, and computes the next deadline as
  `(now+0.8)+0.6`. Fear and active stun return before attack-delay subtraction.
  Shared periodic-effect ticking/expiry occurs earlier in the actor owner.
- The separate timed escape effect moves eight units away from the player.
  Stampede escape state follows its explicit target and lifetime while still
  allowing contact melee; it uses the recovered 1.4 speed factor and removes
  the actor after escape ends if the player is farther than forty XY units.
  The source does not invent a generic low-health flee trigger.
- Slows and damage reductions apply their recorded fractions only before
  their deadlines. Corpse removal occurs strictly after 1.2 seconds. Melee
  dispatch applies the victim's armor fraction, floors damage at one, and
  truncates/saturates to u32; spell damage uses its separate effect owner.

## Validation and remaining boundaries

[Validation record](evidence/enemies/source-validation.json) records the
checks actually performed and authored-but-unrun Rust coverage. Hash-bound
extraction/reproducibility, focused REA/Ghidra analysis, bounded execution of
unchanged selected x86-64 instructions and independent static source review
were used. All opened REA sessions were exported and closed.

The AI oracle contains 54 branch/timing cases, including exact range equality,
unordered comparisons, cast start/completion, cooldown reset and chase timing.
The constructor oracle contains 1,184 cases covering every enemy at eight input
combinations, sixty population-cap cases and four GUID/index cases. Additional
spawn, wave and relocation instruction fixtures are listed in the validation
record. These checks are native evidence, not execution of the Rust source.

The source is not wired to a playable world. Actual terrain/pathfinding,
actor collections, packets, aura/proc lists, spell/projectile effects, damage
application and game-loop orchestration remain required. Existing loot and
guardian components have their own reports and validation boundaries. The
Game must supply one shared RNG, run clock and `Game+910` kill-credit field;
component snapshots must not become independent competing state. The build
does not need the reference EXE, and no binary assets are committed.

The subsequent [boss checkpoint](bosses.md) implements scheduled-boss
behavior and parameterizes the shared actor/placement paths without changing
ordinary enemy defaults. Its static record supersedes the earlier hashes for
those shared files; this report's validation record remains the historical
enemy checkpoint. Windows CRT math equivalence, platform execution, rendered
behavior and runtime parity remain unverified or incomplete. Rust
compilation and test execution were **not run** for this checkpoint.
