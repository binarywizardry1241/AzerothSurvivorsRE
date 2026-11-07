# Playable zone integration

**Preserved 0.97.2 checkpoint.** The selected baseline is now [0.100.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.100.1.md), with [copy and static identity provenance](target-refresh-0.100.1.json). The source, recovery and validation below have not been revalidated against it. Implementation, builds, tests, launches and native decompilation remain stopped; the refresh copied and identified the EXE only. See [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

This checkpoint integrates loadable, playable levels with the recovered
mechanics and records local compilation, tests and reconstructed launches. Its reference was the supplied **0.97.2** EXE, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
No original application launch or Windows validation was performed for this task.
This is an initial playable integration, not full original-game parity.

## Later native-client checkpoint

The [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) replaces the fixed camera,
screen-relative movement and replacement gameplay HUD described below with the
actual client stack. This document retains the earlier map/combat proof and its
binary-bound results. It does not establish final native client/UI parity.

## Required fidelity correction

Controls/camera, the underlying Vanilla interface, level-up choices and
treasure/reward screens must match the EXE.
The fixed camera, screen-relative movement and replacement HUD/choice widgets
below are known deviations. This checkpoint proves map/combat wiring only; it
is not the required player/interface integration. See the
[native-client baseline audit](native-client-baseline.md) for the existing
benilla player/FrameXML stack that was bypassed and the required correction.
No implementation was changed during that follow-up audit.

## Connected source

`src/gameplay/mod.rs` consumes the existing committed Enter request, starts a run,
owns input and the minimal run HUD, and handles loading, pause, choices, death,
victory and return to the menu. Returning clears the menu scene's readiness and
fade so its own camera residency must settle again. A choice pause also gates
movement and pickup collection. The HUD/pause presentation is provisional; it is
not a recovered copy of the original gameplay UI.

`gameplay/world.rs` reuses the vendored benilla world engine's MPQ source,
`CurrentMap`, WDT/ADT/WMO streamer, real colliders, `ViewFocus`, `Viewer`, world
camera and residency counters. The [entry recovery](playable-zone-entry.md)
binds all twelve map IDs, spawn coordinates, facing and radius to the current EXE.
Map readiness waits for the correct body tile, furnished scene and pending
collider/merge/render queues. No fabricated terrain is used.

The selected menu hero reuses its existing MPQ body/outfit in world space, with
Stand/Run clips and world lighting. Creature, boss, guardian, XP, gold and cache
models resolve their actual display IDs from the configured DBC/MPQ data. NPC baked
atlas paths preserve their original extension. Near-foot ground queries reject
upper floors and cave roofs outside the engine mover's vertical window; spawn
ports prefer the real nearby walk surface over terrain beneath a bridge.

`gameplay/mechanics.rs` and its companions supply one live actor collection,
clock, RNG, target collection, damage/vitals and pickup owner to the recovered
library components:

- Ordinary budget/weighted/population spawns, elite timers and patterned waves;
  actor AI, melee and deferred hostile spell impacts.
- Class starters and automatic casts, projectiles, DoTs, ground/status effects,
  healing, absorb, invulnerability, totem pulses/expiry and class-special tick/hit
  consumers with shared RNG and the recovered DoT attribution gate.
- Neutral/racial/level stats, XP attraction and arrival, level costs/cap, gold,
  native weighted level offers, rarity and upgrade bundles.
- Primary boss schedules, placement/scaling, enrage/abilities, death rewards,
  queued equipment and deferred victory; guardian lairs, AI/abilities, respawn,
  scaling and strength rewards.
- Initial/timed/death cache placement and visible cache models. **Purchases are
  disabled until the complete reward expansion/selection consumer exists**;
  the adapter preserves gold and caches instead of charging without a reward.

## Runtime data repair

The previous project Data copy had only `patch.MPQ`, `patch-2.MPQ` and an inactive
`patch-3.MPQ.update`. Its nine older zones could load; Un'Goro ADTs and the Scarlet
Monastery/Naxxramas WDTs were absent. The existing updater's own
[data manifest](https://wow.aethus.pl/exe/data/patches.json) supplied patches 2–6.
The decoded size and SHA-256 of every patch were verified before installation
and rechecked afterward. Patch 3's existing `.update` matched the manifest and
was reused; patches 4–6 were downloaded and gzip-decoded from the listed parts.
See [the retained data record](evidence/0.97.2/run-entry/data-refresh.json).

Only this checkout's `AzerothSurvivors/Data` changed. No external installed game,
player save or reference EXE was modified. MPQs, decoded/downloaded parts, binaries,
logs and screenshots stay ignored. Source builds still need no reference EXE.
Users must provide a compatible, complete Data patch chain at runtime.

## Validation and evidence boundaries

The selected regression runs passed **51 unique tests**: 12 live-mechanics adapter
cases, 2 ground-selection cases, 6 native enemy-spawning cases, 5 mob-loot cases,
4 boss-death cases and 22 chest cases. The first run passed 49; the post-review
run repeated mechanics/ground with two added regression cases. Commands/logs:

```sh
./scripts/cargo test --locked --offline --profile menu -p azeroth-survivors-re \
  --test gameplay_mechanics --test ground_choice --test enemy_spawning \
  --test mob_loot --test boss_death --test treasure_chests
# runtime/playable-final-tests.log
./scripts/cargo test --locked --offline --profile menu -p azeroth-survivors-re \
  --test gameplay_mechanics --test ground_choice
# runtime/playable-postreview-tests.log: 12 + 2 passed
```

All twelve zones subsequently reached world readiness, captured their rendered
level and exited zero, without logged asset errors/panics. The exact capture
binary SHA-256 is
`1cbd5deda29892dbe371c01aef20fbc8bca8e3102d870e38bafad35079070d92`.
The [retained summary](evidence/0.97.2/run-entry/zone-smoke.json) binds each
zone/map/spawn result to this binary and its local screenshot hash. Raw captures
and logs are under `runtime/zone-smoke-final/<zone>/`.
An earlier Elwynn capture also visibly showed damage, a kill and collected XP.
These are short startup/rendered-combat checks, not complete sixteen-minute runs
or every class/ability/zone combination.

Post-review corrections remove escaped/stampede actors from the live collection
without kills/loot, freeing population slots; keep gold collection at the native
fixed nine units even for races with larger XP attraction; and preserve the
recovered gold yaw in rendering. The final build also passed with the existing
unused-source and linker-unwind warnings (`runtime/playable-release-build.log`).
Final-build Elwynn and Scarlet Monastery checks again reached residency and
captured their level with zero exits and no logged asset errors/panics; see the
[post-review record](evidence/0.97.2/run-entry/postreview-smoke.json). This final
binary SHA-256 is `2c1268d39ef5ce89ac2eb0ee6bf2c04a8551616ed9c394fa1a5b0639d742f7e1`;
its captures/logs are under `runtime/zone-postreview/`. The complete twelve-zone
check above precedes only those review corrections. The hash-bound entry
collector check ([recover-run-entry.py historical recipe](../SCRIPTS.md#historical-execution-sources)) and
`git diff --check` also passed.

A bounded Human Warlock/Elwynn scenario passed through the actual UI: Enter loaded the level, combat earned level 2 and two kills, Resume exposed
three earned cards, clicking Soul Fire added its learned icon, holding W moved
the player/camera, Escape paused, and Return to menu restored the picker and
resident animated backdrop. The scenario used the isolated
`runtime/menu-qa-state` profile. See the
[manual check record](evidence/0.97.2/run-entry/manual-check.json); native log is
`runtime/menu-recovery/menu-interaction.log`. Arrow keys, both-mouse movement,
digit-choice keys, death/retry and victory were not manually checked. This one
short interaction does not establish all-class control or original-game parity.

## Remaining work

- Full native player capsule/step/jump and dynamic follow/mouse/pivot camera;
  native blocked/path grids and spline-grounding fidelity.
- Original gameplay HUD, weapon/cast animations, spell/aura/audio presentation,
  complete NPC outfit/hair, polymorph appearance metadata and Lightwell visuals.
- Complete equipped gear/talent/perk/amulet stat/proc composition, active racial
  spells, reactive/death-prevention tails and cross-class totem callbacks.
- Cache/jewelry/amulet reward expansion, seeded magnet scheduling and remaining
  pickup kinds. Typed pending reward requests do not constitute delivered loot.
- Account statistics, queued equipment and permanent zone-unlock persistence.
  The normal picker retains existing save restrictions; `--zone <key>` explicitly
  selects any recovered zone for development without granting save unlocks.
- Full original/rebuilt comparisons, long runs, all-class interaction checks and
  Windows compilation/rendering. No 1:1 menu or gameplay parity is claimed.

## Use locally

```sh
./scripts/run-menu                     # pick a hero and press Enter
./scripts/run-menu --zone elwynn       # explicitly select a development zone
./scripts/run-menu --zone naxx --capture runtime/naxx.png
```

Controls are WASD/arrows (both mouse buttons also move forward), automatic
abilities, 1–4 for offered upgrades, and Escape for pause/resume. The pause/death/
victory UI offers return to the menu; death also offers a new run.
