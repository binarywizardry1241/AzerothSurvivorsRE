# Ground, navigation and actor movement — 0.110.0

Target: installed 0.110.0, SHA-256
`e069bf3152f8d8f7160d66388907fc181c733bd170aa150d3b7ff7adf251e048`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation status.
This report owns the selected #1 source/static recovery. It does not establish
compiled, real-MPQ, client, camera or original/rebuilt parity.

## Recovered and connected behavior

The native twelve-zone table at `0x146bed630` still uses 240-byte records.
Scarlet Monastery now has **twelve polygon vertices**, where the retained
0.100.1 source asset had four; Warsong Gulch retains 38. All other zone centers,
radii, indoor flags and polygon values reproduce the retained input values.
The source now embeds the exact current table. `Zone::for_key` supplies this
single asset to movement admission/correction, indoor occupancy construction and
connected-component filtering, nearest-valid searches, and boundary pillars.
The native Begin polygon sampler creates 87 Scarlet Monastery pillar positions;
the old rectangular source produced 72. All twelve shape outputs are retained.

Current terrain construction (`0x14589abe0`, split height-grid helper
`0x14599ff30`) and indoor-cache construction (`0x14589e8b0`) retain the source
world's placement/triangle inputs, floor height filtering and occupancy grid
contracts. Mesh transformation remains the separate `0x1459b1ac0` owner;
occupancy rasterization is `0x1459a4390`, floor candidates `0x1458a5ab0`,
height queries `0x14589bf40`, nearest height `0x1458a0450` and minimum height
`0x14589e720`. Existing source consumers in `floor_recovery/{map,geometry,grid}`
and `gameplay/world.rs` retain real world geometry, player floors, candidate
height limits, connected cells and nearest-floor recovery. No replacement
collision world or constant floor is introduced.

Navigation's eight-neighbor field (`0x1459a7c90`), descending step
(`0x1459a79b0`), segment test (`0x1459a3a00`) and chase (`0x1459a8280`)
remain connected through `NativeMap::refresh_navigation` and the live world's
native chase route. Two comparisons are corrected: negative coordinates are
rejected before saturating conversion and integer cell bounds, so unordered
coordinates select zero as native Rust conversion does; an unordered refresh
delta retains the existing navigation field, matching UCOMISS/JB. Cell identity
reuse and the 0.2-second deadline remain distinct gates.

The actor owner `0x1459404a0` publishes movement after its movement decisions.
Its `0x145943c92..0x145943de1` dispatch chooses travel versus facing-only
publication, resolves endpoint terrain heights and increments the shared serial.
The current packet bodies are `0x1458bee80` and `0x1458be9c0`. Source
`gameplay/visuals.rs::unit_path` uses the same endpoint/duration split and the
stock client route; the existing live controller and camera remain the engine
baseline. Packet checks do not execute that client or prove its appearance.

## Evidence and verification

[Manifest](evidence/0.110.0/ground-navigation/manifest.json) binds each exact
native instruction range and the neighbor table to this EXE.
[Ghidra owners](evidence/0.110.0/ground-navigation/ghidra-owners.json) bind the
raw-slice decompiler observations; inferred C types are subordinate to assembly.
One canonical assembly per current range is retained. No EXE or database is
tracked.

`python3 -B scripts/check-ground-navigation.py` reads and verifies the
installed target, independently decodes the retained ranges and replays **164
bounded native cases plus twelve native boundary-shape executions**. They cover
BFS, segment/chase, four grid queries, floor/occupancy triangles, NaN/outside
indices, refresh deadlines, and 44 movement/facing publications. Historical
fixtures supply synthetic inputs/expected outputs; current instructions are
executed. The script rejects unreviewed native calls. Allocators, libm,
pretransformed occupancy vertices, queue storage and supplied heights are explicit
seams. Source guards check the live connections without executing Rust.

No compilation, compiling tests, application, real MPQ ingestion, controller or
camera exercise, rendering/input/platform comparison or parity check was run.
Those remain #1's validation boundary; broader native ownership remains #41.
