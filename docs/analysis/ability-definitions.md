# Ordinary ability definitions

Selected installed EXE: SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [proof](evidence/0.109.0/ability-definitions.json) compares all fields of
the 113 recovered stride-120 records at preferred VA `0x146be1c18` against
the live [Rust catalog](../../crates/azeroth-survivors-re/src/player_abilities/catalog.rs).
The current [addon contract checker](../../scripts/check-addon-contracts.py)
independently uses this table for its narrower key/name/icon/spell metadata.

All keys, names, icons, ordered upgrade types, spell/pulse IDs, power, cooldown,
range, radius, targets, duration, ticks, stored projectile-speed field, complete
status payload, school and cast kind match. Float comparisons use exact f32 bits.
The existing native-status 11/12/13 to internal 10/11/12 translations remain
intentional; the proof records each affected definition. No source repair was
needed. Historical raw assets have not been relabelled as current native bytes.

```sh
python3 -B scripts/check-ability-definitions.py
```

This extends #34's definition-data evidence to the selected hash. It does not
revalidate class baselines/pools, talent/effect data, ordinary upgrade magnitude
arrays, ability dispatch, targeting/cooldowns/hit order, proc/aura consumers,
actual projectile speed lookup, or every possible record outside this recovered
table. Their current contract review remains #41 and the existing gameplay gaps.
No compilation, reconstructed source execution, game launch, live-memory check
or original/rebuilt gameplay/rendering comparison occurred.
