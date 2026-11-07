# Compound raid actions and shared runtime ordering

Installed target **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This source portion of **#42** uses the complete current
[action graph](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-native-0.109.0.md), not historical ability enum layouts.
Builds, reconstructed execution, gameplay and original/rebuilt comparison remain
unverified.

## Compound and drifting actions

Native18 dispatches its first child immediately. Each later child enters the
same insertion-ordered vector as native35 charges, native36 pulls and native37
aura removals, with deadline `now + index * spacing`. A due row is removed
before alive-source admission. Newly appended due rows remain visible to that
pass. The live dispatcher re-reads caster interpolation, current damage
reduction, primary-boss enrage and player position for each deferred child; it
passes the original shared RNG and creature counter through nested summons.
The enclosing native duration is applied before its first child.

Native24 creates a first circle even for zero count. Centers begin three yards
from the caster around the player-facing direction, with a 1.2-radian fan
spacing. Its one-second warning becomes a live periodic circle with the
payload's radius, movement speed and damage factor. The original interval is
0.5 seconds and expiry is `(now + 1) + lifetime`. The shared
[hazard lifecycle](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-native-0.109.0.md) owns pursuit, terrain lookup,
occupancy-independent damage and marker publication.

Native20's admitted close-range cast queues native36. Resolution places the
player at the caster's current melee reach plus 1.5 yards, clips the ray with
the original half-yard margin, clamps to zone radius minus four, samples
primary terrain and adds 0.5 Z. It sends the existing player-mover teleport
with facing plus PI and spell21147 at the destination. Subsequent hazards and
the remaining gameplay stages see that corrected position.

Native14's actor deadline changes movement speed by **1.35** while active and
suppresses ordinary melee/cast admission. It retains normal attack timer
countdown and is independent of the raid movement-hold and cast deadlines.
Strict comparisons preserve the native expired/NaN behavior.

## Live ordering and presentation

Primary bosses and guardians append original payloads with shared decision
indices to one deferred list. The shared actor walk preserves per-actor
phase-before-recurring ordering. Periodic hits precede dispatch, which rechecks
the current vector length and selected slot's dead flag after stable corpse
compaction; a shifted index can select a different actor. Ward actions repeat
their GUID/source/parent admission afterward. Ordinary hit requests and periodic
victims preserve the same insertion chronology, including counter wrap.

Hazard damage is applied before the late spawn, exposure and source-healing
intents. Retaliation can therefore kill a source before the later heal or
exposure admission. Native31's first eight payload bytes are one ordinary enemy
index; impact creates an actual capped/scaled enemy with the shared RNG and
counter. Native33 clears timed shielding, arms the exposure deadline and emits
the current `%s is weakened!` template after alive-source admission.

Native0/1/2/32 replacement schedules use the recovered half-repeat-plus-one
initial timers. Current transform fields reach real UNIT updates and live
model/scale publication, including mount and virtual equipment fields. Special
wards use real targeting and combat consumers described in
[ward ownership](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-wards-0.109.0.md).

## Evidence and validation

The [manifest](evidence/0.109.0/raid-sequences/manifest.json) binds each selected
instruction range and the weakening template to the installed bytes. Its
[REA provenance](evidence/0.109.0/raid-sequences/rea-provenance.json) retains
successful Ghidra12.1.4 native18/native24 raw imports, provider limitations and
pseudocode hashes. Raw imports do not recover external/global relationships.
The full-image ownership work remains separately accounted under **#41**.

`python3 -B scripts/check-raid-sequences.py` passes **146 isolated
original-instruction cases**: three clocks for all41 current compound/drifting
actions, eleven current/minimum minion-count cases, and twelve strict whirlwind
deadline cases. It checks complete delayed-child payloads, source/deadline order,
native circle fields/positions and the unchanged current minion placement/index
contract. Allocators, nested dispatch, terrain, trig and packet calls are explicit
fixture seams. The source tracing checks validate connected call paths and
post-damage intent order; they do not execute or typecheck Rust.

The changed Rust owners parse with the existing project rustfmt. No application
compiler, compiling test, reference process or rebuilt game ran. These checks do
not establish rendering, packets/acknowledgments, physics, host math equivalence
or complete encounter/gameplay parity.

Initial actor requests retain native shared-vector indices across stable
corpse compaction; delayed sequence children retain GUID ownership. The
[shared actor frame](actor-frame-order.md) records that distinction,
current source relookup and optional actor-field gates.
