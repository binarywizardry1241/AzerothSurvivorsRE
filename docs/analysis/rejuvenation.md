# Caster-aware cooperative healing

Permanent **#177** belongs to installed 0.119.0, 145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
[verification-needed](../verification-needed.md) owns current implementation status.
The [Druid release contracts](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-contracts-0.119.0.md) and their
[original manifest](evidence/druid-release/manifest.json) retain the
canonical cast, prune, event, recipient and independent-tick ranges. The
[repair manifest](evidence/rejuvenation/manifest.json) adds only the
missing admission/snapshot/lifecycle evidence and references those original
ranges instead of duplicating their extracts.

## Source identity, refresh and healing

Current aura rows are 32 bytes and carry a source GUID. Self contributions
use source0; a received contribution stores its actual casting hero GUID.
For spell774, both local and recipient refresh remove only the matching
`(spell, source)` rows, preserving other casters' order, expiry and remaining
healing. Other spells retain spell-wide replacement. `buffs::Aura`,
`refresh_aura`, `apply_self_buff_with_party` and `receive_shared_healing`
implement these rules through the existing per-hero `ExecutionState`.
All older self/status/rescue constructors explicitly use source0.

Each aura continues through `tick_auras` independently. The existing batch
healing owner combines regeneration and every contribution before one health
clamp, then credits duplicate spell rows proportionally in original order.
The GUID identifies refresh ownership; it does not replace the target's
existing spell-based healing-meter attribution.

## Shared event and party lifetime

The ordinary kind-nine healing branch prepares
`factor = sqrt(power_multiplier * talent_power_multiplier) * 1.4`.
Its local total is `(maximum_health * effect.value) * factor`; its shared
coefficient is `factor * effect.value`. Retaining this f32 multiplication
order avoids converting the local total back into a coefficient by division.
Each recipient multiplies the coefficient by its own maximum health.

The shared event carries the raw definition duration. The local aura instead
uses the existing scaled-duration inputs and native0.1-second lower bound
(including the0.1 fallback for NaN). The event is queued before the cast visual; the local branch
separately checks the raw definition duration for an immediate heal. Thus
Healing Wave331 and Regrowth8936 heal self and peers immediately; Renew139
and Rejuvenation774 send base durations10 and12 to peers while keeping their
own scaled duration. These four definitions share the same recovered healing
branch and party consumer.

All four actual current120-byte definition records are independently bound
by descriptor hash, key/name/icon pointer-length identities and their spell,
kind, effect, school and duration fields. Their selected catalog inputs match;
the instruction fixtures do not stand in for those live definitions.

`CastPort` forwards shared-heal production through the actual
`PassiveCombat` wrapper to `CombatAdapter`. `CoopSimulation` owns the queue,
outside the `HeroState` swap, retaining source slot, actual GUID, position,
spell, coefficient and duration. The party tick captures its heal-admission
snapshot after advancing the shared clock and before simulating any hero.
It takes the queued events once after all hero simulation, delivers to the
local recipient and then the retained remotes, and preserves event order.

High self health may admit a cast for an injured neighbour in the retained
snapshot. The neighbour must be in state1, differ
from the source slot, have `health / max(maximum_health, 1)` strictly below0.85, and be within
inclusive squared XY distance900. Actual delivery separately requires
recipient state1, excludes the source slot and applies the same distance
bound. Choice/down/terminal states therefore do not receive a new shared
contribution. NaN distances fail the ordered range comparison.

Received auras are published immediately through the existing
`PlayerAuraState` and `RunEvent::Aura`/ObjectValues path. Subsequent health
updates use the existing per-recipient event collection and ordinary Engine
transport; this repair adds no cooperative wire envelope. The generic
nonpositive/unordered-duration recipient branch retains direct health clamp/log/field
delivery without recipient effect20/21 hooks. Healing Wave and Regrowth use
that direct branch; Renew and Rejuvenation use the duration branch.

Death, choosing and abandonment retain aura storage and use the existing
state-specific tick gates. Caster departure does not remove another hero's
stored contribution; it expires through that recipient's ordinary aura owner.
New Game ownership discards the old queue and aura state. The independent
grouped icon/application producer is owned by **#178**.

## Validation limits

The focused checker verifies current native ranges and original query
commitments and replays bounded original instructions with explicit allocation,
visual and packet-helper seams. Source wiring and Rust syntax are inspected
separately. **2,037 bounded original-instruction cases** pass across fourteen
native ranges and fourteen retained query results. The live source checks
cover six cast adapters and23 Rust syntax files. Sixteen authored library
and live-party regressions remain uncompiled
and unrun. Four current definition records also pass exact native/source
comparison. No compilation, client/game/network/server execution, actual
health/meter/addon rendering or controlled original/rebuilt comparison is
claimed. This source repair does not certify wider party or transport parity.

```sh
python3 -B scripts/check-rejuvenation.py --require-retained-queries
```

The checker needs the existing Python Unicorn installation and local retained
query results for the optional strict retained-query check. These analysis inputs are not
needed to build the source.
