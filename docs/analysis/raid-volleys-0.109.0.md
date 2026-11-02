# Shared volley hazard lifecycle — 0.109.0

Installed target **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This completes a source portion of **#42/#43**, not all encounter mechanics or
presentation. [verification-needed](../verification-needed.md) owns the remaining gaps.
The [manifest](evidence/0.109.0/raid-volley/manifest.json) binds fresh native
ranges, all sixty boss memberships and separate static case counts;
[REA provenance](evidence/0.109.0/raid-volley/rea.json) identifies the Ghidra
producer and hazard-tick analyses. Historical inputs are not relabeled as proof.

## Native contract and source connection

The current move dispatcher is `1459578e0..14595cd42`, with native tag4 entering
at `145957ce8`. The inline first/later constructors allocate **128-byte records
in the shared raid-hazard vector**, using its wrapping u32 ID serial. They do
not add records to the historical pending-impact vector. The current table
retains 26 recurring volleys across sixty bosses; spell/count/repeat inputs
match the source. Current zone lookup/field evidence is also retained by the
[guardian signature owner](guardian-signatures-0.109.0.md).

Both landing lanes retain the native speed lookup and minimum 0.6-second
flight. SpellGo is queued first, then the marker's ground height is sampled
again. Each fixed circle has radius2.5, base damage `effective_damage *0.45`,
source GUID, creation/deadline clocks and infinite warning lead. Optional
impact spell, dynamic object, follow, occupancy and publication flags are zero.
The hazard therefore survives its caster's death; this differs from the
source-following circular cast attack.

`abilities::dispatch` now queues these records through
`PendingEffects.raid_areas.volley_impact`. The existing pre-actor effects stage
owns their impact and message lifecycle. At an inclusive deadline it tests the
player's **current XY**, ignores Z, sums admitted hits in insertion order and
retains the last admitted source GUID. It publishes new markers, optional
impact visuals, reverse-index ends, then the clock/movement message before
delivering the accumulated damage. Expiry before first publication produces
neither a create nor an end message; an initially empty vector sends no clock.
The real event collector already delivers these marker events to the client.

The final hit at `145952f18..145952f5c` multiplies the accumulated damage by2
while Game+`ab8` is false, otherwise by1 for these selected hazard kinds.
The current Endless-resume branch sets this flag while changing terminal
state5 back to running state1. The live adapter reads the existing completion
owner's `endless_enabled`; this is applied once after aggregation. Isolated
historical effect fixtures retain an explicit unscaled port default.

The shared queue also carries an optional inner radius, impact visual and
warning lead for the separately recovered
[concentric-wave producer](raid-waves-0.109.0.md). Those producers retain their
own records, evidence and validation count. Shared hazard IDs, damage and
client messages have one live owner.

## Static verification and limits

```sh
python3 -B scripts/check-raid-volleys.py
```

**471 bounded original-instruction cases pass:** 27 speed branches, 324 flight
lanes, 48 first/later constructor payloads, 36 publication gates, fifteen
circle membership boundaries, nine sum/source cases and twelve final damage
scale cases. Both finite and unordered boundaries are exercised. The checker
rehashes the whole installed EXE and compares the current source's sixty boss
memberships/26 volleys. Earlier fixture files supply test inputs only; current
instruction bytes execute afresh in synthetic Win64 memory, with calls rejected.

The source paths and authored lifecycle regressions syntax-parse without
compilation. Regression source covers caster disappearance, second terrain
sampling, inclusive current-position collision, simultaneous hits/source
attribution, cross-producer serials, reverse ends, empty/late publication and
final damage scaling. These Rust regressions were **not compiled or run**.

Ghidra imports original-VA raw ranges with explicit seeds and a generic compiler
ABI. External terrain/allocator/serializer calls, full RNG/trigonometry and
complete scheduling are separate recovery boundaries; source tracing is not a
Rust type check. The [complete current graph](raid-native-0.109.0.md) owns the
other shape/kind producers, pools, towers, warnings and shared encounter queues;
the [presentation report](raid-markers-0.109.0.md) owns renderer contracts and
the unestablished boss cast-display claim. Complete shared/global ownership
remains #41, with encounter/presentation comparison under #42/#43.
No build, application, hardware/input/rendering,
audible check or original/rebuilt comparison was run. Parity is unverified.
