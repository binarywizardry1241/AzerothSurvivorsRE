# Follower movement and packet duration

The installed target is SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [manifest](evidence/demon-movement/manifest.json) binds the current
shared follower move `145939bf0..145939eed` and MonsterMove serializer
`1458c3bf0..1458c3e8d`, including Ghidra provenance for the movement owner.
This is the actual callee of the current special-demon movement branches,
including Pit Lord; [actor policy](demon-actors.md) owns their ring,
leash, cadence, destination and speed inputs.

The movement helper interpolates the old movement at the current clock. Its
first terrain probe samples current XY, using interpolated Z if that probe
fails. Horizontal distance below0.3 rejects the move before any destination
height probe or mutation. An admitted destination uses primary terrain height,
then an available secondary provider returning its success variant, then the
world fallback height. This owner performs no separate navigation projection
or collision rejection. Its actual terrain-provider internals remain a seam.

Movement duration is horizontal distance divided by the supplied speed. The
shared wrapping movement serial increments once, and the packet uses the
corrected start Z, destination XYZ, serial and truncated/saturated milliseconds.
The follower retains corrected start, destination, current start time and the
floating duration after publication. These state and fallback rules match the
connected `move_demon` and `PetMotion` path. The live adapter's short-distance
admission is placed before destination probes to preserve native query order.

The serializer emits opcode0xdd, packed GUID, start XYZ, serial, facing tag0,
flags0x100, one destination and **at least one millisecond**. Native
`1458c3d4c..d59` normalizes zero to one. The live PetMove consumer now preserves
that minimum; PickupMove retains its separately owned conversion. A shared
linear packet constructor retains the existing real client route.

`python3 -B scripts/check-demon-movement.py` passes **500 native cases**:
480 complete movement calls and20 serializer cases. Movement cases cover
stationary/in-progress motion, both sides of the0.3 boundary, both terrain
fallback levels, three speeds, zero-millisecond moves and serial wrap.
Serializer cases include both GUID shapes, serial wrap, durations zero/one/two
and the upper unsigned range. Terrain results, allocation, packed GUID/XYZ
append and packet collection are explicit seams. The checker does not execute
Rust, MPQ terrain internals or a game process. Source regressions are authored
but uncompiled; packet playback, navigation, visuals and original/rebuilt
parity remain unverified.
