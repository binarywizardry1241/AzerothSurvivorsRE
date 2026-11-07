# Worn set consumers

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This report owns the live consumers for **#231–#233**.
[verification-needed](../verification-needed.md) owns overall implementation status.
The [set core](sets-source.md) owns identity, activation and the108
ordinary/empowered descriptors; [item publication](item-set-publication.md)
owns #234. The [consumer manifest](evidence/0.121.0/set-consumers/manifest.json)
binds native queries, selected original bytes, isolated instruction cases and
the inspected source. Compilation, gameplay and original/rebuilt parity are
separate and have not run.

## Four-piece stats

Current `145affbe0` counts the nineteen parallel item/star entries by six decoded
armor tiers. Nonzero class, decoded armor slot below8 and nonzero stars admit
an entry; valid PvP digit6 IDs normalize before lookup. `145c7bec0` visits tiers
0–5 in order and keeps counts greater than3. This does not require eight pieces
or the three-star threshold used by the spell set. It adds no selected-class
filter or ownership-only contribution.

`145b03060` aggregates the star-scaled effects of all nineteen worn pieces,
then merges each admitted four-piece row by stat tag. Its current tables at
`147662070`/`1476620a0` agree with the shared tooltip table. Source
`sets::four_piece_tiers` supplies the gate; `GearSave::effects` appends
`sets::four_piece_effects` after the piece effects in that same order.

The two new conditional stat lanes are distinct from ordinary flat regeneration
and armor:

| Tag | Current consumer | Connected behavior |
| --- | --- | --- |
| 13 | `145bd2d21`, final field `Game+518`, then `145bcb438..48c` | Adds the set's maximum-health regeneration fraction to the shared Numeric lane. The healing owner admits it after three seconds since the last incoming hit, alongside flat regeneration and before the recovered Heroic healing multiplier. The healing report owns that gate and hit timestamp. |
| 14 | `145bd2d36`, final field `Game+51c`, then `145bcde50..145bce155` | If the value is positive and at least five living shared actors are within inclusive squared XY distance64, multiplies post-armor incoming damage by `1-value` before absorption. Uses each actor's actual interpolated movement; no extra cap or actor ownership gate is added. |

The live incoming adapter preserves the unmodified raw amount for reactive
damage consumers. Its ordinary/boss/ward projections represent the existing
shared native actor pool. `apply_damage_with_crowd` applies the admitted crowd
factor after normal armor; the existing `apply_damage` API retains its ordinary
callers. The compact stat formatter and translated labels are shared with the
Armory and item tooltip.

## Eight-piece spell effects and empowerment

`145c4f090..145c4f276` builds talent effects first, applies the existing talent
normalization, then calls `145ac0f90` with the selected class and parallel worn
item/star arrays. The shared activation owner requires eight decoded pieces of
one tier at minimum rank3. Minimum rank5 selects the constructor's actual1.5
multiplier. Source uses the recovered descriptor directly, including its exact
rounded payload values, rather than rescaling generic records afterward.

`Mechanics::configure_armor_set` snapshots those same nineteen IDs/stars and
selects the descriptor before `configure_effects`. Both local run entry and the
cooperative hero initializer use this interface. EffectsState moves with the
existing per-hero state swap. Recovered generic rows enter after the talent
prefix and before the subsequently composed amulet. Per-row provenance uses
the native set title and the descriptor ability's icon; display localization
uses the existing class/tier set keys.

Native aggregate `145b38120` separates raw37 numeric rows, raw38 spell modifiers
and the remaining generic64-byte rows. `EffectRow::armor_set` deliberately maps
37/38 to the existing stat/spell lanes and preserves their selectors. The new
native24 uses a dedicated semantic marker so it cannot enter the historical
source24 extra-cast path. Existing generic0–23 consumers retain their ordered
deadlines, RNG, status, damage, healing and attribution behavior.

Two concrete missing consumers required source changes:

* **Execute cooldown reduction.** Raw16's condition/deadline branch is
  `145c0b9a1`; `145c0de7a..145c0e0f9` subtracts payload float+4 from every
  learned88-byte ability whose primary spell ID differs from the triggering
  event. It performs no random draw or timer clamp. The per-effect deadline
  uses float+8, and the action sets `Game+1ac`. The source now executes this
  callback and consumes its dirty flag at the two native frame stages.
  `145c02620`/`145c78460` publish all strictly positive finite learned timers
  through the existing saturated/truncated millisecond cooldown path.
* **Moving ground spells.** `145b387b0` finds a live native24 whose selector
  matches the primary definition. `145bfd370` removes expired areas first,
  then checks only kind-zero rows with remaining ticks. Before a due tick it
  samples the current player pose and terrain height. If XY distance from the
  stored center is strictly greater than2, it changes the center and publishes
  DynamicObject movement plus fields11/12/13. The source performs the same
  live-selector check and distance gate before its existing ground damage
  loop. Consecration, Volley and Blizzard therefore use their actual moving
  descriptors. Existing engine ObjectMove/ObjectValues handlers move the
  rendered object; no replacement visual or separate damage object is created.

The ground adapter consumes the existing run player-pose/terrain boundary.
The native input-prediction prefix and packet grouping are not executed by the
isolated check; this work does not certify those existing engine boundaries.

## PvP spell sets

The tier5 descriptor uses the same activation, empowerment, composition and
per-hero interfaces. Its raw38 modifiers enter the already connected spell
modifier consumers. Its raw37 controlled-victim damage lane enters the existing
`VictimContext::talent_effects`, including ordinary, boss and ward hit adapters;
the shared victim multiplier reads actual stun, slow and forced-escape
deadlines. Generic control procs use the existing synchronous status owner.
There is no second invented PvP-only crowd-control system. The four-piece
crowd armor lane remains the separate incoming-damage contract above.

## Static verification and limits

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/armory-recovery/python-libs python3 -B scripts/check-set-consumers.py
```

The check validates12 completed durable Ghidra query subjects against the
installed target, parses ten Rust files, and executes55 isolated original
instruction cases totaling2,747 steps. Cases cover odd/even Execute learned
loops (including matching IDs and negative results), the actual five-actor
crowd gate with its native movement sampler, the exact two-yard ground center
store gate, and positive-finite cooldown publication filtering. Synthetic
Game/actor/ability records and the precise replay entry/exit seams are recorded.
Computed-switch pseudocode remains incomplete where external tables are outside
a raw slice; selected original table/branch bytes are retained explicitly.

The source proof binds owned gameplay files and narrow scopes for the shared
GearSave::effects and GroundMoved packet projection. Independent reward-label
changes and unrelated Armory account/purchase bodies are excluded.

These are native branch checks and source inspection. They do not execute Rust,
resolve Rust types, exercise FrameXML or the engine movement/packet handlers,
run a server, or compare original/rebuilt gameplay, timing or presentation.
