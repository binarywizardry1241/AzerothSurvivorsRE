# Burning donut pools

Native28 now connects to the live shared raid hazard vector, marker channel,
spell publication and player-damage adapter. The [current action graph](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-native-0.109.0.md)
owns the other connected encounter mechanics. Permanent **#42/#43** retain
compilation/gameplay/rendering/parity requirements;
[verification-needed](../verification-needed.md) owns their current status.

## Recovered current contract

The selected EXE is SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/0.109.0/raid-pools/manifest.json) binds the producer,
activation, periodic deadlines, marker kind/lifetime and all three current
payloads: boss394 slot2 and the first phases of guardians111/1011. The shared
constructor and donut membership retain single canonical extracts under
[lines](raid-lines.md) and [waves](raid-waves.md).

`145958d26..145958df0` reads spell, inner radius, windup, active lifetime and
damage factor. It casts with the windup and captures player XY using the common
primary/secondary/fallback ground-height owner. The donut's outer radius is the
inner radius plus **40 yards**. The generic action block uses the windup; this
producer does not apply a movement hold. Expiry is computed `(now+windup)+life`,
preserving its addition order. Creation precedes the localized RAID_BOSS_EMOTE
warning: “The ground burns around you! Stay inside the circle!”.

Before activation, marker kind is `danger` and its deadline is the windup.
At the first admitted activation tick, the row becomes active, queues its spell
visual, republishes as `pool` with the final expiry, and initializes its periodic
deadline to that tick. Active membership includes both donut boundaries. A due
update advances the deadline by **0.5 seconds** exactly once, even if the player
is outside. It does not drain every missed interval in a loop. The activation
tick can therefore deal one hit; inclusive expiry removes the row before another
periodic hit. The shared owner aggregates damage once and retains the last
hitting source, including the existing pre-Endless multiplier.

## Source and static checks

`bosses/raid_pools.rs` owns the producer; `raid_areas.rs` owns publication,
activation, periodic hit aggregation and end/clock delivery. The current source
catalog generator wires the boss slot and both guardian phases. No historical
instant ability or replacement HUD is substituted.

```sh
python3 -B scripts/check-raid-pools.py
python3 -B scripts/connect-raid-mechanics.py
```

The first check passes **71 original-instruction cases**: producer arguments,
activation, generic duration, periodic wait/advance/expiry and marker-kind
selection. Its synthetic-memory cast and external terrain/allocation seams do
not execute the reconstructed source or the target process. A bounded Ghidra
producer query is retained by Evidence ID in the manifest; its raw import omits
external/data/caller completeness. Textual source checks trace live connections
separately. Authored Rust pool regressions were not compiled or run.

Compilation, actual movement/terrain/input, rendered marker transitions,
long-running encounters and controlled original/rebuilt comparison remain
unverified. Source/static completion here does not close the parent gaps.
