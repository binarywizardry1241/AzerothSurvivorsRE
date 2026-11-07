# Actor movement height

The installed `installed-game/AzerothSurvivors.exe` has SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The [range and Ghidra receipts](evidence/0.140.0/actor-movement-surface/manifest.json)
bind the stop producer, dispatcher, both terrain queries and the facing serializer
to this image. This resolves the 0.140.0 slope release claim
`changelog:0.140.0:e6cc6393427136d3` at the source boundary of [#1](../CURRENT-STATE.md#gap-1).

In the active pursuit-to-attack branch, `0x145f4fdf6..0x145f4ff2f` checks for
an active, unfinished movement. It writes the interpolated XYZ as both actor
endpoints, sets duration to zero and queues the same raw pose. The actor's
simulation height stays raw. `0x145f5076f..0x145f509c7` consumes the 40-byte
movement records and advances the wrapping serial at Game `+0x1048`. A
nonpositive duration samples the start XY and sends the result to the facing
serializer `0x145ef8e40`. Travel samples both endpoints independently.
Unordered duration selects the travel branch.

The dispatcher first calls `0x145dd3fc0` with the terrain field at Game
`+0xf58`, offset `+0x10`. On a miss it checks the indoor cache at terrain
`+0x68` and, if present, calls `0x145dd8ce0`. The primary indoor lookup uses
the adjusted half-yard surface. The fallback searches up to 20 square rings,
uses the closest cell by squared offset in the first nonempty ring, and
also reads the **adjusted** surface at indoor-cache `+0x20`. The dispatcher
takes only the fallback's Z. XY stays at the queued position. If both queries
miss, queued Z goes to the serializer. The type-3 serializer uses the supplied
point for both start and destination, with a target GUID, flags `0x100` and a
duration of one millisecond. This differs from the historical raw-Z facing
dispatcher in [0.105.0](stationary-facing.md).

The [actor frame](../../crates/azeroth-survivors-re/src/gameplay/mechanics/actor_frame.rs)
now applies this lookup to its queued movement copy before publication. The
[native terrain adapter](../../crates/azeroth-survivors-re/src/floor_recovery/map.rs)
reuses the adjusted grid for the primary and nearest queries. The host's
[local travel snapshot](../../crates/azeroth-survivors-re/src/gameplay/visuals.rs)
uses the same height provider. At the stop, the ordinary client consumes the
corrected type-3 spline and resolves its target facing. The
[event bridge](../../crates/azeroth-survivors-re/src/gameplay/client/events.rs)
also encodes that same movement event for co-op guests. Occupancy and floor
recovery continue to read their original connected grid.

`python3 -B scripts/check-ground-contracts.py --actor-publication docs/analysis/evidence/0.140.0/actor-movement-surface`
verified 745 decoded instructions and replayed one raw-stop case and 30
publication cases. The replay executes the original dispatcher and both
height helpers against synthetic grids. The ADT miss, imported `floorf`,
and packet serializer calls are controlled seams. Cases cover the flat and
adjusted surface, indoor holes with and without a fallback, an absent cache,
serial wrap, a single facing point and both travel endpoints. Source receipts
bind the inspected files, and the changed Rust files were syntax parsed.

The original terrain penetration and facing report still lacks the zone,
position, pose and timing needed to attribute that occurrence. Real MPQ
geometry, actual local and co-op client movement, compilation and
original/rebuilt parity remain open in [verification #1](../verification-needed.md#gap-1).
