# Battlefield boundary pillars

Selected EXE SHA-256:
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
The source portion of gap **#30** is implemented. Compilation and original/rebuilt
rendered comparison remain open; [verification-needed](../verification-needed.md) owns status.

## Native contract

[Manifest](evidence/boundary-pillars/manifest.json) binds all retained
instruction/data ranges to this target. REA/Ghidra inspected the exact native
Begin function `145917cc0` and shared GameObject creator `145944080`:
`ev_419101e9c9480b80011c12dda4bc004638b72be793b7107a33d6d2e035de79cf`
and `ev_0f68536a8c32b4f4154f118c87c7083b0fa502e6d0e221b8fb445a426de4833c`.
Original PE instructions establish the Win64 arguments and constants omitted by
the headerless imports. Only the relevant assembly ranges are retained; full
decompilations and immutable analysis inputs remain disposable under `runtime/`.

The movement consumer calls Begin after admitted horizontal movement; the tick
also has a pending-start branch. Begin creates the perimeter once. It samples:

- WSG's 38-vertex polygon and SM's four-vertex polygon, in native edge order.
  Each edge uses `max(ceil(hypot(dx,dy)/12),1)` points with `t=index/count`;
  its endpoint is supplied by the next edge rather than duplicated.
- Every other zone's circle at `radius+10`, including Gurubashi (42 yards).
  Count is `ceil(tau*radius/12)`, with native f32 tau `0x40c90fdb`.
  The angle calculation multiplies before dividing; cosine supplies X.

All twelve centers/radii/indoor flags/polygons exactly match the existing
`native-floor-zones-0.100.1.json` source asset. That asset remains the single
source of these floor inputs; this bounded comparison does not revalidate its
entire cache/navigation implementation.

| Zone | Candidate pillars before floor/filter rejection |
| --- | ---: |
| Elwynn / Duskwood / Un'Goro / Feralas / BRM / AQ | 69 each |
| WSG / Alterac Valley | 76 each |
| Arathi Basin / Scarlet Monastery | 72 each |
| Gurubashi Arena | 22 |
| Naxxramas | 29 |

Indoor zones omit a point when the primary floor is absent. With a floor, they
test the occupancy cell one yard toward the center and omit blocked cells.
Missing grids and points outside the grid are admitted. This probe does not
move the pillar inward. Outdoor points use the primary height; the missing-floor
branch repeats that query, then tries the secondary cache and final fallback.

The descriptor at `146e78e28` supplies entry **9013**, display **4831**, scale **1**.
The call supplies GameObject kind **5**, flags **16**. The creator increments the
shared wrapping counter, then samples orientation from the same run RNG. It
publishes the GUID, fields 2/3/4/8/9/12–18/20/21 and a type-5 object packet.
Rejected points consume neither a serial nor an orientation draw.

## Source connection and checks

[Boundary mechanics](../../crates/azeroth-survivors-re/src/gameplay/mechanics/boundary.rs)
connects the recovered sampling, admission and creation to the first active run
tick, after initial ordinary pets and before advancing the clock. Its once flag
survives later ticks and resets with a new `Mechanics` instance. Existing focused
spell/schedule fixtures suppress this unrelated startup stage; dedicated boundary
regressions cover it explicitly.

The profile-driven constructor already used by Lightwell is reused, including
its shared counter/RNG and quaternion fields. `RunEvent::BoundaryPillar` passes
through the normal client object-event collector and `LocalPresentationEvents`
dispatcher. The existing GameObject DBC/M2 loader, animation and particle renderer
owns display 4831; normal session teardown owns removal. No substitute beam
geometry or second rendering implementation is introduced.

Static unchanged-instruction checks passed for **12 native shapes, 30 floor/filter
cases and nine object/counter/RNG cases**, with all twelve zone inputs checked.
The object cases include counter wrapping and nonzero orientations. Rust syntax
parsing passed for the boundary module and both integration files; the new module
also passes its format check. Four Rust regression functions were authored and
**not run**. No compilation, Cargo checks/tests, game launch or rendered comparison
was performed.

Reproduce the retained byte/data and native-fixture checks with:

```sh
python3 scripts/recover-boundary-pillars.py --check
```

For fresh static decompilation, `--prepare-rea` stages two plans under ignored
`runtime/analysis/history/movement/boundary-pillars/ca2d08dc2dd8/`; run each through `scripts/rea-batch.py` and the
project `scripts/rea` wrapper. The source build needs neither tool nor EXE.

The emulation controls terrain answers, allocations, field-map insertion and
packet delivery. Host-rounded libm seams do not establish Windows CRT bit parity.
These checks do not execute Rust, load MPQ content or verify pillar color, scale,
animation, terrain appearance, full startup-producer ordering or visual parity.
