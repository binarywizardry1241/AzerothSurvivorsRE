# Scarlet Monastery camera room correction — 0.105.0

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the source/static portion of **#35** and the bounded camera
ownership work under **#41**. Integrated status belongs to [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Native contract and source connection

The [canonical manifest](evidence/0.105.0/camera-room/manifest.json) binds seven
current function extents, constants, assembly and six scoped REA/Ghidra records.
They identify an engine camera correction, rather than a menu-orbit table or a
custom content-table change. Original PE instructions govern arguments and data
operands; raw Ghidra imports use a generic GCC ABI and omit external code/data.

Correction `140b07260..140b080b6` reads the already placed camera Transform,
player position, live framing height, time and a separate local pitch bias:

- It resets the bias outside map **189**, below **2 yards** from the pivot,
  at horizontal reach **<=0.001**, or when the pivot fails the room predicate.
  An absent/non-single camera leaves the state alone.
- Pitch is `asin(offset.y / distance)`. An eye outside its room tries **ten**
  increasing pitch candidates up to **80 degrees**, retaining the original
  distance. Candidate `140ab2310` requires room admission and either a clear
  solid sweep or reach **>=97%** of the desired distance. If none qualify it
  requests the full remaining pitch to 80 degrees.
- The local bias eases with `1-exp(-rate*dt)`, rate **12** while increasing and
  **2.5** while returning. Below **0.0001**, an already admitted eye is retained.
  The final pitch respects an original pitch already above 80 degrees.
- The final solid sweep can shorten the arm. If the resulting point is still
  outside, **eight bisections** retain the last admitted distance. The eye's
  rotation is premultiplied by the arc from its old arm direction to the new one;
  requested wheel distance and mouse pitch are not rewritten.

`benilla-app/src/player/camera_room.rs` connects that state machine after the
ordinary controller. Its pivot uses the existing live framing-height channel;
real WMO/terrain queries and `WorldCollision::cast_camera(..., false)` provide the
world inputs. The normal controller/FrameXML remain their existing owners.
The embedding retains the engine's capture/input gates and places the correction
before camera shake. This historical extraction did not recover the schedule
relation. The [0.109.0 revalidation](camera-room-0.109.0.md) now binds the current
control → correction → shake dependency chain and reruns all 67 bounded inputs
against current instructions; it does not establish full camera/geometry parity.

Room admission `140acaca0` transforms the exact world point into each loaded
WMO placement, converts an available terrain height, and accepts a winning
faces-only group without flag **0x8**. It does not use the lighting mask 0x48,
require a WMOAreaTable identity, lift a unit's feet or retry above a floor.
The current room-ray owner `1419bc530` uses **1,760 yards**. The existing
unit/zone-text helper uses 1,000 yards, so `camera_room_group` shares its face/grid
and terrain-race implementation with an explicit independent depth. Other
callers retain 1,000 yards. The new `WorldPoint::camera_room_at` exposes this law
to the live camera without changing unit lighting.

The selected solid-cast wrapper `141898ff0` creates the **0.3-yard** camera
sphere and solid-layer mask **5**; its optional liquid leg is disabled by this
correction's native callers. Terrain wrapper `1418e5a00` and rotation-arc helper
`144fe3290` are separately identified. The underlying physics engine, terrain
sampler and complete WMO triangle/grid implementation are not exhaustively
certified by these bounded records.

## Static checks and limits

[native_camera.py historical recipe](../SCRIPTS.md#historical-execution-sources) passes **67 bounded native
cases**: 43 caller/candidate position/bias cases and 24 original room-ray
admission cases around the 1,000/1,760-yard boundaries and flags 0/8/0x40/0x48.
The original caller, candidate, rotation-arc and composition instructions run
with synthetic resources. WMO/terrain/spatial and CRT math calls are explicit
fixture seams. Only position/bias are compared with an independent scalar
transcription; this is not execution of the Rust source. The checker also
revalidates the complete selected EXE hash, retained ranges/extracts and live
source routes. [Retained vectors](evidence/0.105.0/camera-room/native-vectors.json).

The changed Rust parses with the project rustfmt parser; three authored Rust
regressions have not been compiled or run. No build, application, MPQ-backed
camera interaction, hardware input or original/rebuilt rendering comparison
was performed. Complete camera/geometry/CRT equivalence and #35 parity remain
open. Seven recovered extents do not establish whole-image decoded coverage,
complete engine ownership, indirect-reference discovery or closure of #41.
