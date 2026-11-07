# Indoor actor surface and connected floor

Selected installed EXE SHA-256:
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
[CURRENT-STATE #1](../CURRENT-STATE.md#gap-1) owns the remaining reported
penetration/stationary-facing issue; [verification-needed #1](../verification-needed.md#gap-1)
owns compilation, real-world geometry and original/rebuilt comparison.

## Recovered contract and source repair

The indoor builder `0x145ba1840..0x145ba3144` retains two different height grids.
Its first grid is the existing four-connected floor selected from triangle and
ADT candidates. After flooding, `0x145ba2c8e..0x145ba2e55` copies that grid and
visits every valid cell. The copy may rise to the greatest original height in
the cell's inclusive, clipped 3×3 neighbourhood, provided the neighbour minus
the original cell is at most **1.6** (exact f32 bits `0x3fcccccd`, data
`0x146272370`). The pass reads neighbours from the unchanged original grid;
adjustments do not cascade. NaN cells remain absent, including unseeded grids,
and higher disconnected storeys cannot bridge the step limit.

The returned layout keeps original vector fields at `+0/+8/+0x10`, adjusted
vector fields at `+0x18/+0x20/+0x28`, side at `+0x30` and origin XY at `+0x38`.
The primary height query `0x145b9e1e0..0x145b9e4ae` reads the adjusted vector
from terrain `+0x78`, using its side/origin at `+0x88/+0x90`. The terrain
constructor's indoor occupancy baseline reads the original vector instead.
The minimum-floor helper `0x145ba16b0..0x145ba1835` likewise reads original
cache `+8`, with side/origin at `+0x30/+0x38`. These consumers must remain
separate; raising the authoritative connected floor would change navigation
and recovery.

`floor_recovery/cache.rs` previously retained only the connected grid and
returned it for actor publication. It now stores the independent adjusted
surface and selects it only from `PrimaryCache::height`. `IndoorCache::height`
and `grid` keep the original floor for `NativeTerrain::load` occupancy,
`nearest_floor` and `minimum_floor`. The outdoor raised-WMO cache retains its
independent policy and does not run this indoor pass.

The existing live chain already carries this primary answer through
`NativeTerrain::height` → `NativeFloor::terrain_ref` → `visuals::unit_path` →
`LocalUnitPath` → the ordinary benilla spline/ground owner. Positive-duration
paths sample both endpoints. The independently recovered historical stopped
packet/raw-Z/facing contract is preserved; this change adds neither a global
height clamp nor a different stationary-pose rule.

Spawn placement also reaches the adjusted primary surface through
`WorldTerrain::walk_height` and the existing enemy-spawning terrain port.
Floor readiness gates mechanics before spawning. The source stationary branch
still publishes its raw start and resolves the actual party target in
`mechanics/actor_frame.rs`; `local_client/movement.rs` preserves yaw while that
packet is queued, so the ordinary MonsterMove handler owns the final facing.
No additional concrete source discrepancy was found in those retained paths.

This supplies a concrete missing indoor surface mechanism relevant to the
Naxxramas sinking report. Static evidence does not attribute every previously
reported approach/attack penetration or facing case to that omission. Their
precise world geometry, failing pose and timing remain unobserved. Retain the
[historical handoff analysis](ground-handoff.md), with its actual target,
instead of presenting its conditional failure route as a current reproduction.

## Evidence and validation

The [manifest](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/evidence/0.127.0/ground-contracts/manifest.json) binds four
journaled Ghidra observations to exact declared owners, six nonoverlapping
canonical instruction extracts and the threshold. The curated postprocess
pseudocode is an exact excerpt; raw Ghidra subjects omit external code/data and
infer generic ABI types, so PE instructions control layouts and comparisons.
The constructor and candidate helper observations preserve the original flood
and separate-output context without claiming their entire semantics recovered.

```sh
python3 -B scripts/check-ground-contracts.py --evidence docs/analysis/evidence/0.127.0/ground-contracts
```

The existing checker now also verifies this current contract. **56 original
instruction surface cases** cover empty/single-cell grids, diagonal and edge
neighbours, NaNs, exact/above-limit differences, disconnected heights and
noncascading inputs, while asserting the original buffer remains unchanged.
**576 original instruction primary-query cases** distinguish original and
adjusted indoor buffers, flat/indoor/outdoor priority, missing ADT/cells,
boundaries and unordered coordinates. All **567 retained instructions** decode
completely; query result/plan/journal/input hashes and source connection guards
pass. The ADT return is an explicit seam; already-connected synthetic grids
stand in for geometry construction. Native checks do not execute Rust.

Two Rust regressions cover the separate live cache consumers and surface
boundaries; they are authored but uncompiled/unrun. No compilation, compiling
tests, MPQ/world execution, game/client/server operation, displayed facing or
original/rebuilt interaction/rendering comparison occurred.

## Retained reports

[0.113.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/ground-contracts-0.113.2.md)
