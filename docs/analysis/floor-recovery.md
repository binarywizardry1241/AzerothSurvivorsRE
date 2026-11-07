# Current movement admission and floor recovery

The current 0.123.0 [correction/recipient repair](coop-correction.md)
replaces the historical twelve-report pending gate with a three-second
simulation deadline. This report and its original native fixtures retain their
actual historical target; their report-count source correspondence is superseded.

Current target/source recovery: [ground/navigation and publication — 0.110.0](ground-navigation.md). This report retains its historical target and fixtures; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation limits.

Selected 0.100.1 EXE SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
[Manifest](evidence/0.100.1/floor-recovery/manifest.json), unchanged PE instructions
and fresh REA/Ghidra output bind the current owners. This report separates native
recovery, source cache production, and the separately validated controller/runtime adapter.

## Native owner and source

Current `1454a5cb0..1454a68be` receives each movement report before committing its
position to Game+400/+404/+408 and facing to+40c. The clock is Game+934, phase+9b9,
and movement flags+990. The selected target's complete owner is retained with
REA `ev_2f1bfca9a1a131a1f723ca958e4b8e0e445eea47a9e76d420f8511d94d8cba22`.
`floor_recovery::Recovery` transcribes this admission/correction state; the parent
application owns sampling actual reports, applying a correction to the real
LocalPlayer controller, publishing it, and the phase0 movement-to-start gate.
An isolated module is not an integrated floor fix.

| State | Native predicate and transition |
| --- | --- |
| Pending correction +8f8/+8fc/+908 | Ignore an incoming report while its squared XY distance from the correction is strictly greater than9 and the remaining count is nonzero. Decrement that count. Otherwise clear pending and admit the report. Each correction establishes12 reports. |
| Shallow sink +880/+884 | Only zone+ec enabled: a non-NaN minimum secondary-cache height minus exact f32`.35` is strictly above reported Z. Start/reset a timer; it becomes due at`.75`seconds inclusive. |
| Blocked +888/+88c | Only enabled indoor zones with an occupancy cache: all nine one-yard footprint samples are blocked. The timer becomes due at1second inclusive. |
| Stationary +90c/+910/+914 | Enabled indoor zone, phase1, any flags low-four bits and flag`0x1000`absent. Anchor the first report. Displacement strictly greater than`.75`yards replaces the anchor/time; otherwise recovery is due at1.5seconds inclusive. |
| Deep fall | Primary height minus5 indoors or15 outdoors exceeds Z. With no primary, indoors uses nearest secondary height minus5; outdoors tries the primary nearby query with radius12 and subtracts15. Otherwise center-resolved height minus120 is the threshold. Strict equality does not correct. |
| Repeat +920/+924/+928 | Only shallow/stationary recovery enters this branch. A previous such recovery strictly less than6seconds ago and strictly less than3yards away adds an inward step of at most4yards. The new record stores the original reported position even if corrected elsewhere. |

The current zone table at`146733518`has twelve240-byte records. Only SM/Naxx
set the indoor flag. Only WSG/SM use polygon containment, preserving their current
38/4vertices. Other zones use distance from center greater than radius+10. A
polygon boundary correction selects the nearest segment point and advances4yards
toward center; a circular correction uses radius+10−4. The exact current centers,
radii, flags and polygon points are delivered as source JSON and independently
bound by the manifest. A successful boundary correction queues its native message;
the source returns a correction for the embedding application to publish.

After XY correction, the indoor occupancy cache may select its nearest open
footprint within20yards. Final height resolution is primary at corrected XY,
nearest secondary floor (which can replace XY), then outdoor nearest-valid
scan(radius20, exclusion2), then the already-resolved center height. Final Z is
height+.5. No arbitrary near-foot ray is substituted for these queries.

## Native grid operations

- `14552b4e0` uses floor of twice the offset from origin, clamps the surrounding
  ±2cell rectangle, and chooses the minimum **non-NaN** height. The grid has
  half-yard spacing. Infinity is not filtered by this native predicate.
- `14552d220` searches square rings0through20 around that half-yard cell. In the
  first ring containing a usable height, it picks minimum squared integer-cell
  offset; first equal-distance entry wins. Return XY is the selected cell center.
- `1455257a0` requires all nine one-yard offset samples to be blocked. An absent
  cache or out-of-bounds footprint is not treated as blocked. Occupancy bytes
  represent native booleans.
- `145525bb0` scans integer offsets within the supplied radius, maps each to an
  occupancy-cell center, and requires all nine footprint samples to be clear.
  It picks the closest center, retaining the first exact-distance tie. Fresh
  Ghidra evidence is`ev_d85dbcce54eb71d9634dc4b134234aca55b3ab1c91aae05cb56c06a014fb6822`.
- `14552a140` is the primary terrain query. Its native cache can provide a flat
  height, an indoor half-yard cache, or its underlying terrain result combined
  with a raised-building cache. The engine's existing bounded near-foot query
  has different semantics and is not an equivalent producer.

Source exposes `HeightGrid::{minimum,nearest}`, `completely_blocked` and
`nearest_open`, reusing the shared occupancy record shape. `Terrain` names each
owning query explicitly. The constructor and geometry source are now transcribed
below; original/rebuilt indoor runtime parity remains unverified.

## Cache producer and MPQ connection

Current factory`14544f710`constructs/cache-reuses the resource by map ID and exact
centerXYZ. It calls terrain constructor`145526fa0`at`14544fb77`, passing the native
map name, center, zone radius+20 and polygon only for indoor-flag zones. That
constructor opens MPQ/map resources through`145687e90`, collects map chunks and
placements through`14568ed20`, and calls indoor builder`14552b670`. Fresh Ghidra
IDs are retained in the manifest for both owners.

The indoor builder is a connected-floor construction, with half-yard cells,
side`ceil(4*radius)`and origin`center-radius`. It gathers candidates from ADT
terrain and loaded/transformed WMO triangles: WMO decode`145682320`, placement
transform`145530130`, triangle rasterizer`145530800`. Candidate heights are capped
at centerZ+8. It chooses a seed within ±16cells of center, favoring the closest
cell with a height at most1.6from centerZ, then floods four adjacent cells.
Continuity helper`1455244e0`chooses the candidate closest to the previous cell's
height within1.6inclusive, preserving the first distance tie. Unreached cells
remain NaN. The primary query's indoor cache at primary+58 is the same storage
as resource+68 used by secondary queries.

`floor_recovery::cache` now implements candidate collection, native triangle
rasterization, sorting, seed selection and four-neighbor connectivity. Floor
triangles require `abs(normal.z)/length >= .7`; cell-center barycentric admission
uses the exact f32 tolerances `-.0001` and `1.0001`. The outdoor raised-floor
pass shares this rasterizer with a maximum of `f32::MAX`, then retains only
heights strictly above raw ADT+.1 and at most ADT+3, keeping the highest per
cell. Primary queries still require an ADT answer before applying that overlay.

The one-yard occupancy grid has side`ceil(2*radius)`and origin`center-radius`.
Its baseline samples the direct connected indoor cache at one-yard centers,
or raw ADT outdoors. Occupancy triangles require `abs(normal.z)/length <= .7`;
the longest edge determines `ceil(length/.4)` subdivisions, clamped1through400.
Triangular barycentric samples block a cell only when their Z is strictly
between baseline+.35 and baseline+2.4. Supplied indoor polygons also block
invalid/outside baseline columns and preserve only the center's four-connected
open component (`145524ac0`). With no polygon, the constructor seeds all open
cells; it does not invent a center reachability restriction.

`floor_recovery::map::NativeTerrain` reads the same WDT-admitted3×3 ADT region
around the fixed center, in row/column order (`14568ed20`, radius1). The shared
format decoder has a separate `adt_to_floor_mesh` entry point preserving authored
positions; ordinary rendering retains its existing edge snapping. The current
ADT column owner `145689130` corroborates the existing145-vertex center-fan
selection, low-resolution holes, barycentric determinant threshold`1e-9`,
normalization `(northwest-XY)/533.3333*16` and fan order. Raw queries try exact
XY, then both coordinates+.07, then both−.07 (`1455264f0`).

Current WMO group decode `145683190`, called with reject mask4/required mask0
by `145682320`, corroborates `load_wmo_collision_tris`: all group files in order,
every face except MOPY DETAIL, remapping referenced vertices. Placement IDs are
deduplicated per construction pass by `14546cf80`. The occupancy pass shares its
ID set across M2 and WMO placements. M2 occupancy admission uses a strict axis
distance below `radius+40*max(scale,1)`; WMO occupancy uses `radius+400`.
M2 hull loading uses the existing bounding-vertex/triangle format path.

The source transcribes current placement owner`145530130`'s SIMD operations and
exact constants, followed by row-major matrix multiplication, uniform scale and
translation (`145542830`). Its fresh Ghidra evidence is
`ev_344b3ab1a43564cf0b734ec8359255a1081c2727f52e973c5d5ef5c06c478c36`.
Host sin/cos remain an explicit platform math seam. The off-thread
`gameplay::world::native_floor::NativeFloor` resource prepares this geometry and
cache once per exact map+centerXYZ identity, then exposes the `Terrain` port to
the real-controller admission system. `Chain::clone` shares immutable archive
indices, so the WorldAssets mutex is released before decoding or grid work.
The all-zone probe below validates cache construction from real MPQs. Controlled
original/rebuilt movement and collision comparisons remain outstanding.

Correction packet owner`145467450`writes opcode`0x00c7`
(`MSG_MOVE_TELEPORT_ACK`), packed GUID, incremented Game+4cc counter, two zero
u32s, corrected XYZ, supplied facing and a final zero u32. The parent application
owns routing this correction through the ordinary same-map controller snap.

## Mechanic terrain and navigation

`WorldTerrain` now borrows the native primary, secondary and occupancy caches
for mechanic spawns and guardian homes, retaining the fixed native fallback
height. A present cache's hole remains absent; the adapter does not replace it
with a near-foot ray. The world plugin prepares the fixed cache after ordinary
world residency publication, and holds run readiness until preparation completes.

Current actor owner`1454db6c0`refreshes Game+8c0 through`14552aaf0`. The exact
[refresh slice](evidence/0.100.1/floor-recovery/actor-navigation-refresh.asm)
reuses a field at the same player cell; a changed/outside cell rebuilds after
`.2`seconds inclusive, and an absent field builds immediately. All distance cells
begin at`u16::MAX`; the player's cell becomes0 even if its mask is blocked.
Eight-neighbor BFS uses right, left, +Y, -Y, then the four diagonals in the bound
constant order. Every step costs1. Diagonals require both adjoining cardinal
cells clear. Source exposes the resulting distances and populated count to
existing spawn admissions.

Segment owner`1455246f0`samples `ceil(length/.3)` points, returns1 for length
below`.001`, and reports the previous sample's fraction at a blocked cell. A
segment starting in a blocked cell may leave that initial block, then cannot
enter another block. Current chase owner`14552b0e0`first tries that direct
segment, then follows up to40 lower-distance cells, bounded by the caller's
14-yard search radius and the same occupancy segment test. Descent owner
`14552a810`preserves the first minimum-distance tie. These pure methods back the
AI terrain port; root's accepted-movement integration calls `refresh_navigation`
before lending the immutable cache to mechanics.

The historical [mob movement connection](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/mob-movement-0.100.1.md) samples primary
heights at both movement endpoints and feeds grounded client splines before Net,
removing the post-Net raw-pose overwrite and base-speed gait feed. The
[0.105.0 mob report](mob-movement.md) owns the current publication
revalidation and subsequent ground-cache continuity fix for a replacement path
starting at an unchanged pose. Its source validation now includes a successful
macOS build, targeted grounding regressions, a new twelve-zone probe against the
refreshed Data chain and live Elwynn swept-step traces. Controlled original/rebuilt
terrain/collision and animation comparisons remain incomplete. The historical
center-floor probe below retains its original inputs and does not establish
those later observations; use the current mob report's validation record.

`native_floor_probe` is an EXE-independent developer example accepting
`--data-dir <compatible Data directory> --zone <key|all>`. It records decoded
tile counts, primary/secondary center answers, connected/blocked cache counts
and8-yard sampling coverage. It reads MPQs and no active save. The example built
and ran successfully for all12 zones on2026-10-19 under the shared unoptimized
`menu` profile, using the project-local Data directory. All12 loaded9 ADT tiles
and resolved a primary floor at the fixed spawn center. All sampled outdoor
points resolved a primary floor. These are structural real-data results from the
reconstructed producer; original/rebuilt floor and collision parity is unverified.

| Indoor zone | Raw ADT center Z | Primary center Z | Connected / total half-yard cells | Primary / secondary / sampled columns |
| --- | --- | --- | --- | --- |
| SM | 0 | 27.304552 | 104,782 / 462,400 | 384 / 517 / 630 |
| Naxx | 138.16573 | 141.28966 | 49,538 / 65,536 | 127 / 132 / 132 |

The indoor probes retain absent primary columns and exercise the wider secondary
lookup. Cache preparation took roughly1–3seconds per zone in this profile,
except SM at18.05seconds. Preparation is off-thread and gates readiness; these
measurements do not establish native loading-time parity. The full
[probe](evidence/0.100.1/floor-recovery/mpq-probe.json) and
[MPQ input SHA-256 manifest](evidence/0.100.1/floor-recovery/mpq-inputs.json)
record every row, exact separately supplied archive and probe hash. MPQs are
excluded from delivery. Runtime logs remain under
`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/floor-mpq-probe.{json,log}`.

## Verification

`python3 scripts/recover-floor-recovery.py --fixtures` completed on
2026-10-19. It executed the unchanged selected-PE movement owner for29reports
with explicit cache/math/packet boundaries, plus48 unchanged native grid-helper
cases,12 floor-triangle cases,10 occupancy-triangle cases,5 placement cases and
4 navigation fields with16 segment/chase queries.
[Movement fixtures](evidence/0.100.1/floor-recovery/native-fixtures.json)
cover timer boundaries, phase/flag exclusions, repeated recovery, deep falls and
12 stale reports. [Grid fixtures](evidence/0.100.1/floor-recovery/grid-fixtures.json)
include NaN holes, ring selection, all-blocked/all-clear footprints and edge
positions. [Floor triangles](evidence/0.100.1/floor-recovery/triangle-fixtures.json)
and [occupancy triangles](evidence/0.100.1/floor-recovery/occupancy-fixtures.json)
cover winding, slope, height caps, strict baseline boundaries and grid edges.
[Placements](evidence/0.100.1/floor-recovery/placement-fixtures.json) execute both
the original rotation owner and actual vertex multiplication, with only host
sinf/cosf and allocation seams. They are native instruction results, not expected
outputs generated from the Rust transcription. A separate f32 operation-order
replay matched all five native matrix outputs exactly with identical host math.
The expanded10-test Rust harness passed on2026-10-19 under the shared `menu`
profile (`--locked --offline --test floor_recovery`), including all native fixture
replays and connected-storey/raised-floor boundary checks. The command also
compiled the current binary integration. Log:
`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/floor-cache-regressions.log`.

No original game process was launched by this recovery. Host `_hypotf`, `cosf`
and`sinf`bit parity with Windows CRT remains unverified. Native instruction fixtures alone do not validate real MPQ cache generation.
The separate all-zone MPQ probe above exercises the producer; residency and
whole-world collision parity still require runtime comparison.
