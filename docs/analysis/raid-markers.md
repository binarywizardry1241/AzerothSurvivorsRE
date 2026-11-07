# Raid marker presentation

The installed EXE is **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
It is read in place through the ignored reference configuration. This report
owns current renderer recovery and the line-head repair under **#43**.
[verification-needed](../verification-needed.md) owns current status; the
[0.108.0 report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-markers-0.108.0.md) retains its historical evidence.
The [manifest](evidence/0.109.0/raid-markers/manifest.json) binds 18 declared
owners, their exact bytes and canonical extracts to the selected target.
[REA provenance](evidence/0.109.0/raid-markers/rea-records.json) records bounded
Ghidra queries. Raw imports lack authoritative Rust types, outside callees and
some switch tables; Win64 instructions and bounded replay resolve the selected
contracts below. This does not complete global native ownership under #41.

## Line-head repair

The reconstructed line head projected the entire filled rectangle and then
remapped U coordinates from `max(filled-1.5,0)..filled`. Native
`1401688fc..14016899d` instead supplies **the same** bounds to clipping and UV
projection: `max(filled-1.8,0)..filled`. The constant at `145de2590` is the
original `f32` negative 1.8. A 20-unit line at 50% therefore projects its head
over **8.2..10**, while its ordinary fill still covers **0..10**.

[The live geometry owner](../../crates/azeroth-survivors-re/src/gameplay/raid_markers/geometry.rs)
now passes that short strip directly to the real world's decal projector.
The manual UV rewrite is removed. This also preserves the shortened head near
the start, the 0.01 fill-admission threshold and the winding-only gate.
Fourteen original-instruction cases retain both actual clipping and UV bounds
in the manifest. This establishes the source correction and native vectors;
the reconstructed Rust and GPU output have not been executed.

## Current receiver and renderer contracts

| Owner | Current entry | Recovered role |
| --- | --- | --- |
| Receiver | `140165430` | `hz`, `hzt`, `hzend`, replacement, occupancy and clear |
| Geometry update | `140166bf0` | Clock/progress, outline invalidation, four shapes, fill and tower decoration |
| Draw | `140164000` | Body/fill/outline order, colors, fade, pulse and tower columns |
| Group paint | `14013b920` | Six styles, separate alpha/additive gain and ending brightness |
| Mask | `14013d050` | Eight analytic alpha masks |
| Arc / projection / annulus | `14013d890`, `14013df60`, `14013e2a0` | Subdivision, frames, UVs, clipping and hole triangulation |
| Wedge / column / vertex clip | `1401477f0`, `140147a50`, `140147dd0` | Cone half-planes, 32-segment bands and nine-scalar interpolation |
| Shared terrain projector | `14008d020` | Receiver/collider/BVH gather, box clipping, white vertices and planar UVs |
| Gather box / box clip | `1415ec990`, `1415ed280` | Rotated bounds and six-plane triangle clipping |
| Float mip average | `1400a6800` | Four-sample averages with clamped coordinates |

Fresh receiver/source tracing retains the historical transport contract:
unknown shapes/kinds default to circle/danger; missing numeric values become
zero. `hz` replaces the first matching ID and resets fade, occupancy and cached
geometry. `hzt` advances the clock, applies optional raw-WoW moves/facing and
updates occupancy only for non-fading rows; missing `in` clears that occupancy.
`hzend` starts/restarts a 0.25-second application-clock fade. Other messages on
this separate channel clear its rows. It must not receive ordinary HUD data.

The rendering clock extrapolates at most 100 ms from receipt. Active danger and
tower progress is `clamp((clock-start)/max(end-start,0.05),0,1)`; pool, live and
fading rows use 1. Outlines invalidate on position/facing changes or replacement;
fills regenerate as progress changes. Position converts once to `(-y,z,-x)`.
The 20-by-6 line retains body, two side and two end-cap frames without extending
its sides beyond the endpoints. Circle/cone fill grows outward; donut fill
shrinks the hole. Wide cones split their clipping region into two wedges, and
arcs at least 6.2731853 use the full-circle branch. Donut heads stop at 0.995.

The current paint/mask/column contracts retain the source's colors, occupied
green, six group styles, separate ordinary/additive alpha, late-windup glow,
pool/live pulse and capped 1.6-times ending brightness. Ground order remains
body, fill, outline. Tower bands have 32 segments and use the real effect
stream. Eight masks and float-space mip averaging require no supplied artwork
or reference EXE at build/runtime. Actual blend/depth behavior, terrain
availability, filtering, clock/scheduler integration and screen output remain
runtime comparisons, not results of scalar replay.

The [complete action graph](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-native-0.109.0.md),
[recursive sequences](raid-sequences.md) and
[wards](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-wards-0.109.0.md) own producer/actor recovery under #42. Their live
hazards publish through the shared serial/vector and the existing
`RunEvent::RaidMarker` → client `MarkerInbox` → `RaidMarkersPlugin` route.
The renderer consumes each queued message once, clears on run identity changes,
and submits projected geometry through the real terrain/effect stream.
Producer, actor and renderer contracts remain independently assessed.

## Cast presentation and the release claim

Native `1459577f0` suppresses spell zero, converts seconds to truncated,
saturated u32 milliseconds, and sends cast flags 2 with no target. Its packet
constructor `1458c2220` stores the caster in both GUID fields. The source route
is `CombatPort::raid_cast` → `RunEvent::RaidCast` →
`SessionEvent::SpellStart` → the real client's spell consumer.

Fresh Ghidra recovery identifies that consumer at `14067e670`. Eight bounded
executions of `14067ec8c..14067ecf5`/`14067ed63` establish its positive stock
cast-bar gate: the caster must equal the self-player GUID, duration must be
nonzero, and the spell must not use the ranged slot. It also inserts the timed
`Casting` state and emits the animation start for other indexed casters, matching
[the source consumer](../../crates/benilla-app/src/spell/net.rs). Ten separate
producer cases verify spell-zero suppression, duration conversion and flags.
The canonical cast-start extract remains in the
[wave evidence](evidence/0.109.0/raid-waves/manifest.json); it is not duplicated.

The release note says a winding boss shows a cast bar. The selected packet
consumer does **not** establish a boss widget, and the custom HUD boss-row
constructor `14020b1f0` supplies health/name content, as independently recovered
in [the current HUD report](run-hud.md). These recovered paths do not
establish a separate boss cast-display owner or prove that one is absent
elsewhere. No speculative widget, styling or lifetime is added.
The exact visible meaning of this release claim needs controlled observation
of the supplied original before a separate UI contract can be asserted. **#43
therefore remains open for presentation/gameplay comparison**, including this
unestablished cast-display claim; the full compound claim is not certified.

## Checks and reproduction

`python3 -B scripts/check-raid-markers.py` verifies the full target hash,
all declared owner extents and canonical extracts, and executes bounded native
instructions with synthetic Win64 memory:

| Check | Result |
| --- | --- |
| Alpha masks | 504 samples; maximum scalar-model error 0.0000118081 |
| Progress and fill admission | 144 cases |
| Line projection / moving head | Five outline frames; 14 fill cases |
| Circle, donut and cone fill branches | 70 cases |
| Arc subdivision/projection | 15 cases; 742 projection frames |
| Annulus clipping | 12 cases; 327 vertices |
| Tower band emitter | Six cases; 1,152 vertices |
| Vertex / terrain box clipping | One nine-scalar triangle case; 18 box cases |
| Group paint / mip average | 60 cases / nine cases |
| Cast producer / self-cast bar gate | Ten cases / eight cases |

Math thunks return Python libm results as f32; allocation, packet construction,
texture/mesh handles and selected terrain queries have explicit synthetic seams.
Fill-dispatch checks capture helper arguments; arc/annulus algorithms have
separate native replays. Box tests use synthetic triangles and original plane
vtables. Real ECS/collider/BVH traversal, MPQ surfaces, Windows CRT, GPU output
and reconstructed Rust execution are not tested. Source hashes/text guards
record renewed tracing, not a compiler or semantic-equivalence certificate.

`--write` stages extracts/results under ignored
`runtime/native-evidence/0.109.0/raid-markers/` for review. To reproduce Ghidra
recovery, run `--prepare-rea --work runtime/raid-markers-replay`, run every
generated `plan.json` with `python3 -B scripts/rea-batch.py`, then run
`--collect-rea --work runtime/raid-markers-replay`. Only compact reviewed
provenance and canonical textual extracts belong in documentation.

The changed Rust owners syntax-parse with rustfmt. Compilation, `cargo check`,
compiling tests, original/rebuilt game launches and rendered/gameplay comparison
were intentionally not run. No whole-system or original-game parity is claimed.

## Retained reports

[0.108.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-markers-0.108.0.md)
