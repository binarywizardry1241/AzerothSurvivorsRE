# Named creature dimensions and melee reach

Target: installed **0.127.0**, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
This completes the source/static portion of **#34**'s supplied 0.126 creature
size and independent reach constituents. [Release/source review](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.127.0.md)
R126-16–19 retains their separate claim identities. Earlier boss/enemy reports
and all other fields keep their actual target provenance.

The [current contract](evidence/0.127.0/creature-sizes/contract.json) retains all
17 named records, exact names/IDs/IEEE754 scales, row bytes and selected native
consumer ranges. The existing catalog recovery tool locates the zone table
through all twelve ordered zone keys: current `14703a5b0`, stride 240. Enemy
rows remain 80 bytes, with scale at `+28`. Current boss rows are **104 bytes**:
their extra metadata precedes the ID/model/scale at `+40/+44/+48`. The earlier
88-byte boss ABI is not applied to this target.

| Creature | ID | Current scale / exact bits | Ordinary or boss melee reach |
| --- | ---: | --- | ---: |
| Guardian of Icecrown | 1411 | 0.43 / `0x3edc28f6` | 2.716 |
| Ironbark Protector | 811 | 0.63 / `0x3f2147ae` | 2.956 |
| Doomguard | 111 | 0.97 / `0x3f7851ec` | 3.364 |
| Soul Weaver | 1409 | 1.40 / `0x3fb33333` | 3.880 |
| Flesh Eating Abomination | 711 | 1.19 / `0x3f9851ec` | 3.628 |
| Ravasaur Hunter | 1209 | 1.20 / `0x3f99999a` | 3.640 |
| Rumbling Exile | 1510 | 1.19 / `0x3f9851ec` | 3.628 |
| Ravasaur Matriarch | 1290 | 2.43 / `0x401b851f` | 7.145 |
| General Rajaxx | 1191 | 1.77 / `0x3fe28f5c` | 6.155 |
| Arcanist Doan | 1391 | 4.05 / `0x4081999a` | 9.000 |
| Houndmaster Loksey | 1390 | 4.05 / `0x4081999a` | 9.000 |
| Lar'korwi | 1292 | 2.49 / `0x401f5c29` | 7.235 |
| Herod | 1392 | 3.99 / `0x407f5c29` | 9.000 |
| Kovork | 1590 | 2.83 / `0x40351eb8` | 7.745 |
| Immol'thar | 893 | 1.66 / `0x3fd47ae1` | 5.990 |
| Ossirian the Unscarred | 1193 | 0.91 / `0x3f68f5c3` | 4.865 |
| Mannoroth's Herald | 191 | 2.95 / `0x403ccccd` | 7.925 |

The Doomguard above is world enemy **111**, identified by its actual current
record. Its scale does not replace the separately recovered summoned-demon
descriptor. Guardian of Icecrown likewise retains its enemy ID and normal
content consumers; the lair-guardian constructor is an independent consumer of
the underlying enemy definitions.

## Native and live source consumers

The retained [enemy](enemy-catalog.md),
[guardian](guardians.md) and [boss](boss-catalog.md) reconstruction
already connects size and reach. Current original-byte tracing independently
maps those inputs and arithmetic:

| Current owner | Scale and reach consumer |
| --- | --- |
| Ordinary creator `145c31220..145c31d49` | Definition `+28` reaches the model constructor at `145c3177c..145c317b2`; `145c317c8..145c317ea` multiplies scale by 1.2 and `145c31849..145c31852` adds 2.2. |
| Lair guardian creator `145c9c5c0..145c9d44d` | `145c9c7e0..145c9c7f0` multiplies definition scale by 1.35; `145c9c935..145c9c94b` computes that displayed scale ×1.2 +2.2. |
| Boss creator `145c44d30..145c45b6d` | `145c451d2` reads current row `+48` and passes the same scale to the model constructor. `145c45440..145c45460` computes scale ×1.5 +3.5, then `MINSS 9.0`. `145c4551f/145c45527` store reach and scale before the actor copy. |

Those arithmetic contracts already match `enemies/scaling.rs`,
`guardians/mod.rs` and `bosses/scaling.rs`. The repair therefore changes all
seven named enemy scales in both existing enemy/guardian source projections,
and all ten named boss scales in their canonical guardian-owned catalog:
**24 scale literals**, with no replacement reach formula or duplicate size table.

The actual ordinary spawn, guardian spawn port and boss actor constructor consume
those source records. `gameplay/visuals.rs` and the actor-appearance path use the
same definition/guardian display scale for client model delivery. Raid/minion
consumers retain their existing catalog references. Existing benilla object and
world interfaces remain the implementation boundary.

## Checks and remaining verification

```sh
python3 -B scripts/recover-enemy-catalog.py --size-contract docs/analysis/evidence/0.127.0/creature-sizes/contract.json
python3 -B scripts/recover-boss-catalog.py --reach-contract docs/analysis/evidence/0.127.0/creature-sizes/contract.json
```

Both pass. The first checks current target/table/record/string identities and
every selected source scale. The second verifies original instructions/constants
and **51 isolated native reach cases**: each selected creature in its applicable
ordinary/boss projection, all seven in the guardian constructor, and nine
zero/negative/cap-boundary/infinity/NaN inputs per arithmetic sequence.
[Native vectors](evidence/0.127.0/creature-sizes/reach-native.json) are independent
of the Rust source.

Existing Rust catalog regressions now use explicit current scale overrides
while retaining every other historical field assertion. The historical enemy
constructor oracle explicitly restores its historical input scale. New authored
coverage exercises the actual enemy/boss constructors against current native
vectors and the real guardian spawn port for the seven selected enemy rows.
Rust syntax parsing and Python AST parsing pass; compilation and Rust tests were
not run. No game, client, network or server operation, model/contact comparison
or original/rebuilt parity validation occurred. These remain separate work in
the verification register.
