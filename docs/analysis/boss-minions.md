# Boss minion schedules and health phases

This is a completed source portion of gap **#42**, not the complete encounter
reconstruction. All sixty recurring minion waves and nine health-phase minion
waves now reach the existing live actor queue and spawn consumer. The other boss
moves, guardian signatures and hazard lifecycles remain open. Compilation,
gameplay and original/rebuilt presentation have not been validated.

## Selected target and evidence

The installed 0.108.0 EXE is 140,203,520 bytes, SHA-256
`dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`.
[Registration](target-refresh-0.108.0.json) owns its identity and resource chain.
The recovery tool resolves and verifies this target before reading it; changed
bytes are rejected rather than interpreted with this layout.

The [catalog](evidence/0.108.0/boss-minions/catalog.json) retains exact native
record/string ranges and their hashes. The
[manifest](evidence/0.108.0/boss-minions/manifest.json) binds the selected assembly,
constants and three REA/Ghidra imports to the EXE. Each raw import uses the full
declared native owner at its original VA:

| Owner | Range, end exclusive | Retained contract |
| --- | --- | --- |
| Actor update | `145971120..145976768` | Phase gate/order at `1459737a1..145973b45`; repeat timers at `145973b45..145973d91` |
| Ability dispatcher | `145950bf0..145956052` | Tag5 minion branch at `14595245b..145952604` |
| Boss constructor | `145966be0..1459678fe` | Initial timer allocation and `0.6f32` scaling |

Ghidra 12.1.4 analyzed these bounded imports through `./scripts/rea`. Expensive
discovery analyzers were disabled; the dispatcher branch was explicitly seeded
from the current jump table. That seed is a caller assertion checked against
current PE bytes, not a discovered function. Raw import uses Ghidra's generic
`gcc` compiler spec; Windows register use, external calls and data references
therefore require instruction review. The retained pseudocode is a branch aid,
not original source or complete native ownership. Global decoding/reference
coverage remains #41.

## Recovered records and rules

The current twelve-zone table starts at `146bd7b90`, with 240-byte rows and a
boss pointer/count at `+0x88`. Each zone has five 104-byte boss records. The
boss's scheduled pointer/count is at `+16`, its phase pointer/count at `+48`
and ID at `+64`.

The current enum payload is 48 bytes with the discriminant at **byte 45**.
Scheduled entries are 56 bytes: tag5's count is at `+0`, cooldown at `+48`.
Phase entries are 72 bytes: yell pointer/length at `+0/+8`, payload at `+16`,
tag at `+61`, threshold at `+64`. These are fresh 0.108.0 layouts; historical
28-byte source ability records are a semantic port, not native ABI aliases.

Each boss has exactly one recurring tag5 record. Its count and repeat interval
feed the semantic tag2 summon consumer. The current
[circle/minion scheduler](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-markers-0.108.0.md) now preserves native slot
order for all sixty summons alongside selected tag3/tag6 circles, replacing
legacy summon timer requests without duplication. The first interval is `repeat * 0.6f32`; an admitted tick
decrements each remaining timer and fires at most once, discarding overshoot.
Enrage latches below `maximum_health * 0.3f32`, and subsequent repeats use
`repeat * 0.7f32`. Other current move variants are not copied into the historical
catalog or silently treated as equivalent.

The phase loop follows common actor admission and enrage, precedes recurring
requests, and checks at most 32 native phase entries. The strict comparison is
`health / max(maximum_health, 1.0f32) < threshold`; native `MAXSS` selects the
1.0 operand for a NaN maximum. A bit at the original full-table phase index
latches before queuing. Healing does not clear it. Tag5 is nonblocking, so a
cast hold does not suppress these waves. Each new boss instance starts with
clear bits, including endless instances.

| Boss | Native phase index | Health strictly below | Minions |
| --- | --- | --- | --- |
| Edwin VanCleef (694) | 0 | 50% | 8 |
| King Gordok (894) | 0 | 50% | 8 |
| Herod (1392) | 0 | 20% | 14 |
| High Inquisitor Whitemane (1394) | 0 | 50% | 10 |
| Majordomo Executus (1093) | 0 | 50% | 12 |
| Nefarian (1094) | 1 | 20% | 14 |
| General Rajaxx (1191) | 0 | 50% | 10 |
| C'Thun (1194) | 0 | 50% | 14 |
| Kel'Thuzad (1494) | 1 | 45% | 14 |

The native phase yell is queued before deferred ability dispatch. Localization
uses `boss.{id}.phase{index+1}` and falls back to the record's exact English yell
when that key is absent. The selected nine keys' actual presence, absence and
values are verified in all fourteen embedded locale payloads. Their identities
use five common-label fingerprints, not an assumed historical descriptor ABI.

The existing summon consumer then emits `Minions, to me!` even for count zero,
samples a radius-five circle using `(index/count)*TAU`, resolves primary terrain
height, WMO height and fallback, and creates real run enemies. The definition
cycle is enemy 0, enemy 0, enemy 1, repeating. Shared RNG, GUID counter and actor
creation remain the existing owners; no replacement visual-only actors are
introduced.

## Connected source and checks

`bosses/minion_phases.rs` owns selected phase data and per-instance latches.
`BossAiState::tick_with_minion_phases` runs them inside `Actor::tick_with_stage`,
then prepends their requests to ordinary requests. `Mechanics::tick_bosses`
publishes the phase yell and dispatches through the existing `BossCombat`.
`BossCombat::spawn_minion` creates the same real `RunActor` used by ordinary
summons. `bosses/raid_area_catalog.rs` now owns the live sixty current count/interval
inputs and native slots alongside selected circle schedules; the historical
`guardians/catalog.rs` records remain for their other consumers. Unrelated
enemy, guardian and boss fields retain their stated provenance.

`python3 -B scripts/recover-boss-minions.py --check` passes current EXE hashes,
all sixty records, nine phases, selected locale values, live-source tracing
guards and **261 bounded native instruction cases**: 120 normal/enraged repeat
cases, 108 strict-boundary/NaN/latched phase cases and 33 enemy-index cases.
Unicorn executes only short no-call EXE instruction spans with synthetic state;
this is not execution of the Rust source or the game. Source guards are textual
tracing checks, not a type checker. Native caller/constructor/dispatch assembly
and constants are separately inspected and hash-checked.

Rust regression fixtures cover the current records, initial/repeat timers,
phase boundaries/latches, spawn-stun admission and live actor creation/yell
order. Historical tests exclude only replaced minion contracts and keep their
other historical comparisons. The Rust files parse with `rustfmt --emit stdout`;
the Python scripts parse with `ast.parse`. Rust regressions, compilation and
game applications were intentionally not run under the source-only workflow.

To stage fresh bounded REA inputs/plans inside ignored `runtime/`:

```sh
python3 -B scripts/prepare-boss-minion-rea.py
python3 -B scripts/rea-batch.py runtime/analysis/history/raid/boss-minions/0d6660367d5f/rea-preparation/actor-plan.json
python3 -B scripts/rea-batch.py runtime/analysis/history/raid/boss-minions/0d6660367d5f/rea-preparation/dispatch-plan.json
python3 -B scripts/rea-batch.py runtime/analysis/history/raid/boss-minions/0d6660367d5f/rea-preparation/constructor-plan.json
```

Preparation alone does not start REA. Raw EXE slices, databases and full tool
responses remain ignored. The selected assembly has one canonical curated copy
per range, referenced by the manifest.

## Remaining scope

Gap #42 still requires the remaining move/phase assignments and actual
cast/state/target/damage rules for all sixty bosses and thirty-seven guardian
kinds: knockback/root/stance/blink, eggs/cocoons/totems/wards and hatch/heal/shield
ownership, crystals, orbs, tethers/gaze, shockwaves/burning/dance, bombs/meteors
and actor/effect lifecycles. The new `game/hazards.rs` diagnostic path is not
certified as implemented by this adjacent minion recovery. Historical common AI,
grounding, scaling and attack dependencies still need current-target
revalidation outside the selected contract. Raid marker presentation is #43.
No build, gameplay, visual/audio, Windows or complete encounter parity is claimed.
