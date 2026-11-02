# Raid marker presentation contracts

This report retains historical 0.108.0 evidence. The
[0.109.0 renderer report](raid-markers-0.109.0.md) owns current revalidation and
the line-head repair; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current gaps.

The selected input is installed **0.108.0**, SHA-256
`dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`.
This is bounded recovery of **#43**, including selected circular producer dependencies in #42.
The installed EXE changed from 0.107.0 during recovery; every retained range
below was extracted again from 0.108.0. Older addresses are not current proof.
The [manifest](evidence/0.108.0/raid-markers/manifest.json) binds exact PE offsets,
lengths and hashes to one canonical instruction extract per range.
[REA records](evidence/0.108.0/raid-markers/rea-records.json) identify the fresh
Ghidra raw-range analyses. Generic decompiler typing and missing jump-table
branches were checked against Win64 instructions and current PE constants.

## Transport and lifecycle

`140115440` consumes a separate marker message channel. `hz` creates or replaces
the first matching ID and resets its occupied/fading/cache state. It accepts
circle (`r`), donut (`r`, `inner`), line (`len`, `w`) and cone (`r`, `arc`),
raw WoW `x/y/z/a`, `t0/t1`, and `danger/tower/pool/live`. Unknown shape/kind
falls back to circle/danger. Absent numeric values become zero.

`hzt` updates the server clock, optional `[id,x,y,z,a]` moves and the `in` ID
list. Missing `in` clears active occupancy. Movement invalidates outline
geometry; occupancy only changes paint. `hzend` starts a **0.25-second fade**;
expiry is separate from the impact timestamp. Other messages on this channel
clear the markers. Ordinary HUD messages must not be sent to this decoder.

`140116c00` extrapolates the clock for at most **100ms**. Active danger/tower
progress is `clamp((t-t0)/max(t1-t0,0.05),0,1)`; pool/live and fading rows use
progress 1. Position and facing determine outline-cache invalidation. Fill
geometry is regenerated as progress changes, with a 0.01 admission threshold.

## Geometry, paint and textures

The geometry owner and `1400ec580`, `1400ecc30`, `1400ed910`, `1400ee9d0`,
`1400f8000` and `1400f85e0` establish the projection frames, arc subdivisions,
cone half-planes, conservative annulus triangulation and nine-scalar vertex
interpolation. Raw WoW positions convert to `(-y,z,-x)` once. A line's body
extends from **0 to length**, with side strokes ending at those bounds and
caps across its width. The checked 20-by-6 line has five projection frames:
body, two sides and two caps. This retains the corrected rectangular endpoints.

Danger is `(1,.5,.12)`, tower `(.35,.78,1)`, pool `(.72,.32,1)` and live
`(1,.28,.08)`; occupied rows use `(.45,1,.55)`. `140114010` and `1400eb0b0`
apply six group styles, distinct ordinary/additive alpha, late-windup glow,
pool/live pulse, fade and capped 1.6-times ending brightness. Ground draw order
is body, fill, then outline. Circular towers add the occupied/unoccupied center
decoration and 32-segment additive column bands (`1400f8260`).

`1400ebdc0` defines eight analytic alpha masks. The geometry owner's startup
creates 512×512, 512×512, four 8×256, 256×8 and 256×4 textures. The mip kernel
`1401b76c0` averages four **float** samples with clamped coordinates; each mip
is independently rounded to 8-bit alpha. Quantized bytes must not feed the next
level. These formulas require no original artwork or EXE at build/runtime.

## Cast and warning boundary

`145950b00` suppresses spell 0, truncates/saturates `seconds*1000` to a u32 and
uses cast flags 2 with no target. Current constructor `1458bb4b0` writes the
same caster twice, spell ID, flags and duration. The existing real-client
`SessionEvent::SpellStart` consumer owns spell animation/cast state. Native
warning text uses the existing announcement/emote route; warning selection,
encounter timing and cancellation producers are part of #42. This recovery
does not establish a separate custom cast-bar widget or its layout.

## Connected circle producers and remaining scope

The renderer described above now receives actual encounter messages. The current
boss table contains **seven tag3 ground areas, fourteen tag6 circular cast
attacks and sixty tag5 minion schedules**. The selected catalog preserves each
native slot and cooldown rather than borrowing historical ability assignments.
All 33 phase records were checked: none are tag3/tag6. The existing nine minion
phases keep their native index, yell and one-shot latch.

`bosses/raid_area_catalog.rs` replaces legacy ground/strike/summon requests in
the live admitted boss stage. Initial timers use repeat×0.6; subsequent timers
use the normal or enraged repeat. A blocked circle retains its overdue timer;
one blocking selected circle is admitted per actor/tick, while minions remain
nonblocking. The independent boss action deadline is `(duration + now) + 0.4`.
The fourteen tag6 attacks additionally hold movement/attacks for 1.3 seconds,
freeze the interpolated actor at primary terrain height (or actor Z), and emit
a stop using the shared movement serial before native `SpellStart`.

`bosses/raid_areas.rs` owns the selected plain-circle state. Native creation
`1459508f0` increments its separate wrapping u32 marker ID, captures current
clock/damage and samples terrain through primary, secondary and fallback
providers. Tag3 captures player XY and its recovered delay; tag6 follows its
alive caster and cancels when that source disappears. The existing pre-actor
effects stage updates follow positions and resolves inclusive deadlines using
the player's **current XY**. Same-stage hits sum once, retaining the last hit's
source GUID. These two native variants have no optional visual SpellGo or
DynamicObject; the older ground-spell objects are not used for them.

The next hazard stage publishes `hz`, subsequent following updates reach `hzt`,
and published rows end with reverse-index `hzend` before the clock message.
Expiry before first publication sends no create/end pair. Plain danger circles
do not populate the native occupancy list. The real one-shot event collector
feeds these messages to `RaidMarkersPlugin`; cast starts reach the client's
existing creature Casting/animation path. The stock self-player cast bar is
not a recovered custom boss cast bar.

Evidence is split by owner: [schedule catalog and checks](evidence/0.108.0/raid-area-schedules/catalog.json),
[native schedule cases](evidence/0.108.0/raid-area-schedules/native.json),
[hazard producer ranges](evidence/0.108.0/raid-area-producers/manifest.json), and
[cast/hold ranges](evidence/0.108.0/raid-cast/manifest.json).
The fresh Ghidra hazard-tick import covers `145947920..14594cf62`; compact
[REA provenance](evidence/0.108.0/raid-area-producers/rea.json) records its exact
input and analysis limits. The retained assembly is canonical per selected
range; schedule/dispatcher dependencies reference the existing minion extracts.

This completes the selected circular producer connection, **not all #43 or
#42**. Other shapes/kinds, pools/towers, warning decisions, custom boss cast-bar
layout, rotation and other cancellations remain unrecovered. Unselected native
moves/phases and guardian signatures still need #42 reconstruction; retained
legacy missile/charge interactions are not certified by this selected scheduler.
Full native/global/indirect ownership remains #41. Terrain/GPU, compilation,
gameplay and original/rebuilt presentation remain unverified.

## Checks and limits

[check-raid-markers.py historical recipe](../SCRIPTS.md#historical-execution-sources) checks the selected full-file
hash and exact owner extents, then executes bounded original instructions in
Unicorn with synthetic Win64 memory. It covers 504 mask samples (maximum
absolute error 0.0000118081 against the independent scalar transcription),
144 progress/admission cases, nine mip averages, one interpolated clipping
triangle including retained boundary duplicates, ten cast gates/durations and
the five line projection frames and 60 group-paint cases.
Math uses Python libm returned as f32; allocation, packet construction, image
lookup and terrain-query seams are explicit in the checker. These checks do
not execute compiled Rust or validate Windows CRT, actual MPQ receivers, GPU
filtering, client cast bars or original/rebuilt presentation.

Additional producer checks pass: `scripts/check-raid-area-producers.py`
executes 83 bounded original-instruction creation/publication/membership cases;
`scripts/check-raid-cast.py` executes 127 hold, admission, action-deadline
and duration cases; `scripts/recover-raid-area-schedules.py --check`
executes 7,680 schedule cases and checks all selected records/phase tags.
Synthetic terrain/heap/state and external seams are explicit. Rust lifecycle
and schedule regressions are authored and parse, but were not compiled/run.
These checks do not execute the reconstructed Rust or establish full encounter
or custom cast-bar behavior.
Compilation, compiling regressions, game launches and controlled original/
rebuilt comparisons were intentionally not run for this repair.
