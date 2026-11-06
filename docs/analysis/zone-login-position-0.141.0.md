# Local zone login position in 0.141.0

The installed EXE SHA-256 is
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
All twelve installed MPQs match the registered resource hashes.
[#312](../verification-needed.md#gap-312) owns the remaining comparisons.

## Observed entry

The retained original-game solo capture first publishes Scholomance at
`(124.9, 169.5, 93.1)` in `ready` with run time zero (line 2364).
The first mover row holds Z `93.085` without a horizontal step, and
the first walk begins from `(124.88, 169.51, 93.09)` (line 2410).
The reviewed 14,850-line capture prefix has SHA-256
`eae6895210fc668cbb7f47151f61d0b7b76020c2651d080ad3fdb6edfbeaf6df`.
The tracker matched the configured original executable launch argument.
The capture lacks a launch-time EXE hash.

The 0.141.0 zone table at `0x1473a06b0` has thirteen 240-byte records.
Scholomance is ordinal 10, with map 289, area 2057, authored center
`(128, 167, 94.1f32)`, facing 0 and radius 46. Its field slice starts
at file offset `0x739f6d0` and has SHA-256
`55fa0c0c5dc945ef44a53fde06341886a0a2a0e9f739614a9a246227113973e3`.
The other measured entry differences preserve authored XY and change Z.

| Zone | Authored Z | First mover Z |
| --- | ---: | ---: |
| Alterac Valley | 7.0 | 6.806 |
| Scarlet Monastery | 27.0 | 27.305 |
| Feralas | 95.2 | 95.135 |
| Arathi Basin | −45.0 | −44.013 |
| Warsong Gulch | 310.0 | 308.674 |

## Native selector and publication

The local entry factory at `0x145ec0530` constructs terrain from the
authored zone center at `0x145ec07c3`, then passes that terrain to Game
construction at `0x145ec08c9`. The terrain constructor stores authored
Z as its fallback at `0x14600955a..0x14600957f`.

| Stage | Contract |
| --- | --- |
| Scholomance admission | At `0x145f7d3c6..0x145f7d3ee`, ordinal 10 and the exact key admit the special search. `0x145f7d486` calls `0x146008310` with an eight-yard limit and the authored XY. |
| Search order | Try the authored point first, then radii 0.5 through 8.0 in half-yard steps. Each ring uses `ceilf(radius × TAU × 2)` samples. Visit ascending indices from zero at `angle = index × TAU / samples`, using cos for X and sin for Y. The first accepted point supplies unsnapped XY and its indoor cell height. |
| Candidate admission | The indoor grid must contain a non-NaN height at the candidate. `0x14600d820` requires all 25 half-yard cells in the surrounding 5×5 footprint to be in bounds, with no NaN and a maximum height spread of 0.05. An in-bounds occupancy byte of 1 rejects the candidate. An absent mask or out-of-bounds occupancy point adds no veto. |
| Fallback for every zone | Keep authored XY. Take the primary height at that XY using `0x14600a730`. On a miss, use the Z of the nearest valid indoor grid point from `0x14600da10`, searching cell rings 0–20 and retaining the first shortest offset in the first nonempty ring. Use the stored fallback Z on a total miss. An accepted Scholomance search result overrides the authored-XY height route. |
| Local world entry and self create | Game writes the chosen pose at `0x145f7da5c` and `0x145f7da63` to returned Game offsets `+0x5e0/+0x5e8`. The login reads those fields at `0x145eb78d0` and `0x145eb78de` before the initial map/pose packet builder. The self-create route at `0x145eb82c0` passes Game to `0x145f71dc0`, which forwards `Game+0x5e0` and the facing at `+0x5ec` to the movement writer. |
| Addon snapshot | The shared list builder calls `0x145f01650` at `0x145e60eac` and pairs its returned string with `AZSRUN` at `0x145e6132a..0x145e61375`. The formatter binds X, Y, Z and facing from the same Game fields beginning at `0x145f01fcf`. |

| PE span | File range, end exclusive | SHA-256 |
| --- | --- | --- |
| Constructor admission and selection | `0x5f7c7ac..0x5f7c8d1` | `009b1d18286e12374d17c0bbca1e11963b6e088836d80b2787d9bd93ef800c31` |
| Scholomance fallback tail | `0x5f7e1ad..0x5f7e20e` | `17504593b3d0bf9683ab7a8360ed6d79934b9028dde320ce2dec7c0e458c9714` |
| Game pose writes | `0x5f7ce5c..0x5f7ce6b` | `e6c4be55905d37b727cfe8917a6873810f550edab209ac789acb0dfa76c6a3af` |
| Login pose reads | `0x5eb6cd0..0x5eb6d30` | `28e963cd6f64e342427091a8721b6635a0d64958e28af8f23388b6c2689fa526` |
| Footprint check | `0x600cc20..0x600ce05` | `22e78b00d2c16810975d7ff4ecf3421c5cc4969c5226222482b1021f66da4297` |
| Addon pose formatter | `0x5f013cf..0x5f013f3` | `f7c6978f92d07f908c7809cdc0575fc8b6de90850dc2ac139ed928a54c75d146` |

The existing Game constructor receipt
`ev_76f7f9f948ed0431051c75227019841ecce7a71e372accd8d233ed68e6e0be4d`
was verified against its saved result. Ghidra 12.1.4 analyzed the terrain
slice at file `0x6007710..0x600d0eb`, SHA-256
`f5604cdaaf87d64b144669c866bb8b90a48d980355a0ba913b99fd08eefdf062`.
The journal and original-byte checks bind these completed results.

| Entry | Evidence ID | Result SHA-256 |
| --- | --- | --- |
| `0x146008310` | `ev_ae9270458bdb82784441fced105464f6d21a8018b92487a26c4a6b6bc957cf54` | `754f6ac513b3b268d83a52b0b0b752e70da81b21e0349ba4de1171c89c5ca9aa` |
| `0x14600a730` | `ev_43f2de708285c8400d396e703721772d906fc496beb71e47afff34b09ea49e29` | `22a126a34011945d0045970681b0523812c2a436da0fece1a0c576dfd2eabaa1` |
| `0x14600da10` | `ev_4208552d18bab7e5d042621bf8cf7cb8777260f2df75611be779cd969a677192` | `0075574ad35b07a0376b99bde4d7e3c23fda0ba5ce9ac622a94fb35f1bee1301` |

## Source and checks

The [entry system](../../crates/azeroth-survivors-re/src/gameplay/mod.rs)
waits under the presented cover for the existing off-thread fixed-region
cache before consuming the run seed or Again state. The
[terrain selector](../../crates/azeroth-survivors-re/src/floor_recovery/map.rs)
uses the adjusted indoor grid, occupancy mask and primary/nearest queries.
The [world request](../../crates/azeroth-survivors-re/src/gameplay/world.rs)
keeps the authored center for cache identity and the resolved pose for the
initial world state. The [client bridge](../../crates/azeroth-survivors-re/src/gameplay/client.rs)
passes that pose through the real local player request and initial addon
publication. The existing Again teleport consumes the resolved position.
The independent co-op guest bootstrap continues to use its existing
authoritative input path.

All thirteen authored map, position, facing and radius records matched the
current PE. A bounded Unicorn replay passed 48 original-instruction cases
over 4,455,677 instruction steps, including center admission, slope and
hole rejection, occupancy veto, ordered radial selection, both identity
guards and all fallback tiers. The replay used synthetic floor grids and
host f32 math at the four CRT calls, with an explicit ADT query seam.
A synthetic level patch selects sample 20 of 51 at radius four, producing
`(124.883675, 169.507690)`, which rounds to the logged XY.
Pinned rustfmt parsed the six edited Rust modules. The authored Rust
regression remains uncompiled. Actual MPQ-derived output, loading timing,
local and co-op execution, and original/rebuilt parity remain open.
