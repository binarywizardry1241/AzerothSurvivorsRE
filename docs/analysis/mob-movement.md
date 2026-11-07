# Mob ground-path publication

Current target/source ownership: [0.113.2 ground query/publication](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/ground-contracts-0.113.2.md) and [ground-cache lifecycle](ground-handoff.md). This report retains its historical contracts; the current native cache-hit behavior supersedes the earlier token-refresh compatibility change.


Target: supplied **0.105.0** EXE, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[Manifest](evidence/mob-movement/manifest.json) records original PE byte
ranges, hashes, the explicit current ABI and three REA/Ghidra Evidence IDs.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall implementation and validation.

## Recovered publication contract

Actor owner `14593ac20..14593ffd0` dispatches its movement vector at
`14593d6bb..14593d801`. The current instructions establish:

- Every dispatched movement increments Game+`a10` as a wrapping u32.
- Positive duration, including the unordered comparison branch, queries primary
  terrain `1458c7b60` independently at both endpoint XY positions through the
  terrain resource at Game+`950`. Each query miss retains that endpoint's Z.
- Duration is multiplied by exact f32 `1000`, truncated and saturated to u32.
  Serializer `1458aa9e0..1458aac7d` writes opcode `0xdd`, movement type 0,
  flags `0x100`, at least one millisecond, one destination and the terrain-adjusted
  start/destination. The flying flag `0x200` is absent.
- Nonpositive duration skips both height queries and calls facing serializer
  `1458aa520..1458aa81e`, with the unadjusted start and target GUID from Game+`460`.
  Its packet uses type 3, flags `0x100`, one millisecond and one destination.
  [Stationary-facing integration](stationary-facing.md) now connects the
  actual AI stop event to that packet; its source remains uncompiled.

The current publication rules match the bounded historical contract, but the
actor layout, addresses and byte hashes changed. No historical RVA is used as a
current address. The shared emulator takes an explicit per-version ABI.

## Live source connection

`gameplay/visuals.rs::unit_path` applies the recovered moving endpoint/duration
contract to ordinary mobs, guardians and primary bosses. The prior
[ground-path connection](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/mob-movement-0.100.1.md) publishes `LocalUnitPath` before
Net; `local_client/movement.rs` installs an ordinary grounded spline and feeds
its age from the admitted run clock. The usual spline sampler, ground owner and
creature gait/clip-rate selector remain the consumers. The source regression now
uses the independently generated 0.105.0 fixture table.

`net/motion/spline.rs::ground_clamp_creatures` also preserves path continuity
when a new or replacement spline begins at an already cached grounded pose.
Previously, the unchanged-pose memo returned before recording the new spline's
`(id, start)` token. Its first displacement therefore failed the continuing-path
test and used the short downward idle probe, which can miss a rising floor above
the raw path chord. The cache-hit branch now refreshes only that path token and
retains the valid floor answer. The following displacement uses the existing
swept ground step; no height clamp, additional collision cast or replacement
collision algorithm is introduced.

The authored `an_offline_path_at_a_cached_pose_keeps_its_first_uphill_step`
regression drives the actual local path producer, spline sampler and ground
owner. It starts from a cached floor, joins a path at age zero, advances uphill,
replaces the path at the same pose and advances uphill again. It checks both
path tokens and resulting heights. This regression **passed** in the source
validation bound below.

This recovery covers publication only. Actor decisions, occupancy/navigation,
floor-cache construction and the inherited creature collision/animation engine
retain their separately documented provenance and limits. It does not promote
those systems to 0.105.0 parity. In particular, the inherited ground owner uses
the player capsule for creatures, retains only collision-resolved Y, and preserves
the supplied seat height when unsupported. The run clock can freeze local spline
translation while the gait selector still sees a moving spline and the animation
driver uses frame time. Target behavior during these pauses needs comparison;
those collision and animation choices were not changed by this fix.

## Validation and limits

On 2026-10-20, **44 current native cases passed** using unchanged selected-PE
caller and movement-packet instructions in Unicorn. Every output matches the
historical 44-case corpus: independent height hits/misses, zero/negative/NaN/
infinite durations, submillisecond minimums, truncation, u32 saturation and serial
wraparound. Current raw function slices were independently decompiled through
the project REA wrapper with Ghidra 12.1.4. Assembly controls Win64 arguments;
headerless pseudocode leaves external code/data and types unresolved.

Terrain answers, memory state, allocation/buffer growth, packed-GUID and Vector3
serialization are explicit seams. The nonpositive-duration facing serializer is
statically recovered but intercepted in those cases. These checks execute no
Rust source, real MPQ geometry, rendered animation or original game process.

The [source/data validation record](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.105.0/mob-movement/source-validation.json)
binds the ground-cache fix to source hashes, the compiled application hash, test
filters, input manifest and log digests. The locked macOS aarch64 `menu` build
passed, as did **37 targeted Rust tests**: 34 spline/grounding cases, one local
path-speed case and two application visual-adapter cases. The initially
self-skipped Galen cage case was rerun with the actual MPQ directory and passed.
The new cached-pose uphill regression therefore executes the live producer,
sampler and collision owner rather than a copied formula. Later source edits
require their own checks; this record does not validate them automatically.

All eight archives were rehashed against the selected target manifest. The
compiled `native_floor_probe --zone all` loaded nine ADT tiles and resolved a
primary spawn floor for each of the twelve zones. This checks the reconstructed
producer against the refreshed Data chain; its source catalog still has 0.100.1
provenance and the native cache/navigation algorithms are not newly revalidated.

An isolated rebuilt Elwynn run reached world readiness and published live
grounded mob splines. Its trace recorded **2,174 grounding frames**, including
**1,642 with swept steps**, at most 31 visited bodies and 19 swept steps in one
frame. No missing-floor or ratchet result was reported in that bounded run.
These observations establish that real-MPQ moving mobs reach the normal ground
consumer. They do not establish every terrain/collision route or rendered gait.

UI automation timed out during attachment/window capture, and a separate
automatic-capture run exited without producing its PNG. No controlled input
route, displayed-animation comparison or original/rebuilt comparison was
completed. The wider animation/floating/collision report therefore remains
partial. Windows was not built or run. Generated application/test binaries and
the disposable build directory were removed after validation; source, fixtures
and compact textual evidence remain.

Reproduce with `python3 scripts/recover-mob-movement.py --rea`.
The helper verifies the exact target hash and stages all output under ignored
`runtime/analysis/history/movement/mob-movement/46a02b277df9/`; only curated textual evidence is retained here.

## Retained reports

[0.100.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/mob-movement-0.100.1.md)
