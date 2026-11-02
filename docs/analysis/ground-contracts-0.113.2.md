# AS terrain queries and movement publication — 0.113.2

Target: installed 0.113.2, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the remaining #1/#41 scope.

## Current contract and source correction

Current primary height `1458a67e0..1458a6aa5` gives a flat override priority,
then an exclusive indoor half-yard grid, otherwise ADT followed by a higher
raised-grid value. A raised grid cannot supply a missing ADT column. Negative
and upper-bound branches admit unordered coordinates; saturating conversion
then selects row/column zero. `IndoorCache::height` previously rejected NaN
with an ordered `>=` conjunction. It now uses the recovered rejection branches,
including for the shared raised-grid route. Ordinary finite-coordinate behavior
is unchanged. The Rust regression covers grid boundaries, missing cells and
flat/indoor/raised/ADT precedence; it is authored, not executed.

The live `NativeFloor` cache reaches `visuals::unit_path`, which samples primary
height for both travel endpoints. Current actor dispatch
`145949ab2..145949c02` independently establishes `Game+ab8` terrain,
`Game+b9c` serial and `Game+468` target ownership. Positive duration calls
`1458cb3d0` with sampled heights or each original Z on a miss. Nonpositive
duration calls `1458caf10` without querying terrain, retaining raw start XYZ;
the packet is type 3, target GUID, one millisecond, grounded/run flags and one
destination equal to the start. NaN duration follows travel. These are current
contracts, not relocated assertions from the historical 0.110.0 report.

The current terrain constructor `1458a3640..1458a56d9` and actor body
`145945cf0..14594b72d` were recovered through Ghidra to locate and check these
interfaces. Their complete behavior and all dependencies are not certified by
the selected ranges or the fixtures.

The independently located current twelve-zone table at `146fdcd48` retains
240-byte records. All centers, radii, indoor flags and both SM/WSG polygons match
the retained source asset exactly (including all fifty polygon vertices). Its
filename keeps the actual 0.110.0 recovery provenance; the current manifest
separately binds the 0.113.2 table and decoded values. Data equality does not
certify geometry loading, navigation or rendered feet.

## Reported approach/attack penetration remains unresolved

The source can replace a previously grounded height with raw actor Z during a
new path or stationary packet. The following client spline samples XYZ before
the shared ground owner decides between a continuing swept step and a new idle
probe. This identifies a concrete path to inspect, not proof of the reported
failure or permission to alter the target's grounding rules. The native AS
stationary publication deliberately preserves raw Z; no invented endpoint
sampling, upward clamp or fixed height is added. The failing zone, position,
geometry, timing and native/rebuilt rendered results were not supplied or
observed. The finite-position reported defect and original/rebuilt comparison
remain open under #1.

## Evidence and checks

[Byte/result manifest](evidence/0.113.2/ground-contracts/manifest.json) binds
the current ranges and deterministic result commitments.
[Ghidra provenance](evidence/0.113.2/ground-contracts/ghidra-owners.json) records
the immutable range hashes, Evidence IDs and exact provider profiles. Complete
responses and disposable raw imports remain under ignored `runtime/`.

`python3 -B scripts/check-ground-contracts.py` checks **576 current
native primary-query cases** and **44 current movement/facing cases**. The
primary matrix covers flat/indoor/raised/ADT priority, absent ADT/cells,
negative/edge/infinite/unordered coordinates and independent row/column
selection. Movement covers duration boundaries, serial wrap, endpoint misses
and complete stationary packet bytes. Supplied grids/heights, allocator,
buffer growth and packed GUID/vector writers are explicit seams. Source guards
trace the connected adapter; they do not execute Rust.

No compilation, compiling tests, game, real-MPQ geometry execution, source/ECS
execution or original/rebuilt interaction/rendering comparison ran. These
bounded checks neither close #1 nor establish complete #41 AS ownership.
