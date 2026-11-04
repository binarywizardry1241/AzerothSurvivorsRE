# Continuous addon player position in 0.139.2

This contract uses `installed-game/AzerothSurvivors.exe`, 150,793,728 bytes,
SHA-256 `0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [run-space report](addon-run-space-0.139.2.md) records the authoritative run
key, destination packets and reload request separately.

## Native sample

- Core registration at `0x140255479..0x140255494` supplies
  `AZS_NativePlayerSample` at `0x14654c978` with length 22. The Lua
  closure entry thunk at `0x140b99150` reaches `0x140b84690`.
- The frame producer at `0x140aa4e70` increments its local counter when the
  Lua VM is present. It records `NO_WORLD` when the world state is absent or
  its discriminant differs from 2, `NO_PLAYER` when the Player active byte at
  `+0x10c` is clear, and `NOT_READY` when the map is absent or the frame's
  mover state blocks the sample. The reads at `0x140aa4f0e..0x140aa4f17`
  reject a pending reseat at byte `+0x11` or a foreign mover at the
  `+0` option discriminant. The player plugin initializes descriptor
  `0x146635738` with a zero discriminant and zero bytes `+0x10/+0x11`.
  The embodiment system uses the same descriptor. At `0x140c2b66e` and
  `0x140c2b6a1` it reads the mover's discriminant and GUID. At
  `0x140c2b8a2` it marks the reseat after a new body is selected, and
  at `0x140c2b8c8` it uses the separate `+0x10` control-lost flag
  to gate steering. The existing `MoverLock` and its embodiment
  consumer own those same fields in the rebuild.
- The success path at `0x140aa53dd..0x140aa545b` reads the current map
  and converts Player position floats `+0x88/+0x8c/+0x90` to WoW
  `(-z, -x, y)` with sign mask `0x1464f7320`. It reduces facing at
  `+0xec` modulo the f32 `TAU` literal at `0x14650885c`, adding the
  modulus for a negative remainder. The Lua closure reads the VM-owned
  snapshot and returns one status string on failure, or seven values
  `ok, map, x, y, z, facing, frame` on success.

## Source connection

The FrameXML embedding installs the sample function on each in-game VM.
`ui_script/player_position.rs` samples the real local controller in the
UI feed after packet application. The sample stays fixed through the
`OnUpdate` walk and the later paint callbacks. The original scheduler's
relative ordering remains unverified. The sample uses the shared coordinate
transform and checks the existing mover lock. The rebuild also gates its
own opaque cover, pending map transfer and frame hold so a transition
does not expose the old map's retained pose. The update system owns the
frame counter, and a replacement VM starts without a sample.

The bootstrap reuses the 0.139.1 Lua position helpers and wrapper, whose
position and space sections are byte-identical in the installed 0.139.2
image. It also integrates the recovered zone, chest and lair space changes
from the retained Lua. The 0.139.2 additions for downed-party cache
invalidation and world-anchor notifications belong to the separate anchor
feed. The detailed meter API has additional producer requirements under #75.

`RunSeeds` supplies the raw seed and its existing expanded RNG state at
authoritative Game creation. The Game formats and retains one native run
ID before emitting `AZSZONE`. A host's per-recipient snapshots use that
same Game-owned ID, and the guest consumes the received zone line. The Lua
uses the ID for local pose and destination space only on the matching map.

## Static checks

Raw-slice Ghidra results were bound to the installed image by exact bytes
and PE mapping. The addresses below are virtual addresses and the sizes
are in bytes.

| Role | Address | Size | SHA-256 |
| --- | --- | ---: | --- |
| VM registration | `0x140253570` | 18254 | `4f57c3f9baa70c85bc5e8f844e14b803f485e71f90a4cb461badf4fab2b42664` |
| Frame producer | `0x140aa4e70` | 1548 | `5a6178b6c75e472dbb2d1c29303b20766d4f59bde81012985bb6e538b3f5d817` |
| Lua snapshot getter | `0x140b84690` | 2854 | `56b86363d7b39aa0d64c88c9cb652d1b64686cf8249a2370c55c0330f7d4aaf0` |
| Sign mask | `0x1464f7320` | 16 | `df141773470ba96aff5d6e9264a0bd638c9c6f3bb7ad30881cf4db943b5dd021` |
| Facing modulus | `0x14650885c` | 4 | `12d85026b5109a3119231704608d5991a63d8d397d2867a9fc522305810ddb76` |
| Mover lock initialization | `0x140db37bd` | 206 | `5168f0d94309fbcf1eacb366bdf9fe4570c590fb8255adb235a4b4602fef74d8` |
| Embodiment resource binding | `0x140c7391c` | 27 | `7032a7bff0ed8fc1805b083f0bcbdc45049115c129e9bc6df4c3c5afd66d2fb7` |
| Embodiment dispatch | `0x140c7413f` | 5 | `89805300a62f535dca6b7d17b469580e0a0803fc360ed65aa06f1443e28b462c` |
| Mover selection and reseat | `0x140c2b610` | 2345 | `f084225f2244809ff5587887ea825e17f03025e57510f415fd9ecce55ad1fce4` |

The corresponding Ghidra pseudocode IDs are
`ev_928df937e930abe777d1660439b106190c5d5ea41b3d4e3bf8327ac867fd4c9f`,
`ev_d2caa7a5caedb6a17be8d86cdce4d62db6229f26889b44d326ad8dda9d5fb4be`
and `ev_76e037742527538e2ba622f92145ea6ca6c2270be46106b14419432761ca658e`.
The embodiment query returned
`ev_3a8792f8940a1abbf8ce35fc71e6fb316e221ad7a5eff220421122da3a7225d1`
(result SHA-256 `3e8aca925e862ce1745a33b8af6438a2406955519bd012652408b3d2d800cb47`).
The standalone Lua bootstrap check exercised readiness, argument arity,
numeric validity, matching and changed map/run space, fresh return tables,
and destination cache invalidation. Rust parse checks and static checks
of the sample's schedule and mover gate passed. The Rust regressions for
schedule ordering and mover status remain uncompiled. Compilation,
original/rebuilt position comparisons and live client or server execution
remain open.
