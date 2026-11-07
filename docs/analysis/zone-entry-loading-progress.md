# Zone-entry loading progress

[#61](../verification-needed.md#gap-61) tracks zone-entry correspondence. The
[0.113.2 recovery](zone-entry-loading-screen.md) retains the
original staged-loader and cover implementation evidence.

The [deployed browser WASM](https://wow.aethus.pl/wenilla_bg.wasm?v=f3a3d645a1ed)
has SHA-256 `c1b2c99d39f5809215079951e5df46f091c2d57669ffd9e96edcea61169a17c0`.
WABT 1.0.42 validated the complete module. Function 1123 divides completed
world work by its total, clamps the result to one, and uses zero for an
empty total. A present UI counter object enables the 80% world and 20%
UI blend. Its counter pair uses the same clamped division. With the UI
object absent, world progress passes through at full weight. A wait guard
keeps the previous fill. The ordinary path stores the greater of the new
fraction and the previous fill. This runs inside the compiled game client.
The site's DOM boot overlay tracks a separate startup phase.

The installed Windows EXE has SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The loading consumer in the unwind extent at `0x140636120` follows the
same branch structure. It reads the pending UI completed and total counters
at `+0x110` and `+0x118`. The f32 weights at `0x146554134` and
`0x146565ec0` have exact bits `0x3f4ccccd` and `0x3e4ccccd`. The loader
within the extent at `0x1407d5a80` initializes those fields at
`0x1407d75b6` and `0x1407d75bd`, increments completed as stages finish,
and continues the loop below the eight-millisecond cutoff at `0x1407d7982`.
The existing Rust [loading screen](../../crates/benilla-app/src/loading_screen.rs)
and [staged loader](../../crates/benilla-app/src/ui_script/lifecycle.rs)
already express this calculation and yield boundary.

| Input and selector | File range (exclusive end) | SHA-256 of range |
| --- | --- | --- |
| Browser function 1123, progress calculation | `0x654198..0x65426d` | `90fb600f3ab2163e6befd7ad0443e577ad64d71523aeaef3c1bc1f1421240c6d` |
| Windows `0x140637a19..0x140637b15`, progress calculation | `0x636e19..0x636f15` | `eadd936aa8192527abd04fbc23b837d7d15f76eb9e4910d3bcd57c61a0c8b34c` |
| Windows `0x1407d796c..0x1407d798e`, slice cutoff | `0x7d6d6c..0x7d6d8e` | `f5357b70f11f45ae69cbbdc5b79ded7ef625d0d7bebb254a7ef5d2718a913cfa` |

The WASM projection retained the original function indices and selected
body bytes for instruction decoding. Capstone decoded the Windows ranges
directly from the verified PE. The trace covers the progress calculation
and the native yield boundary.

## Desktop zone artwork

The current drive at `0x140637548..0x140637a1d` skips the artwork
lookup when the screen is inactive, blacked out or already resolved.
`0x140637617` passes the selected map from `+0xcc` to `0x146224bf0`.
On a hit that helper returns the row's 32-bit loading-screen ID in
`edx` at `0x146224cb0` and a present flag in `eax`. The next call
at `0x140637633` passes that same ID to `0x146224cd0`. Its matching
row returns the path pointer and length in `rax:rdx` at
`0x146224d8b..0x146224d93`. `0x1406376e1` sends the copied
path to the cache and texture consumer. That consumer compares the
complete path on a cache hit and passes archive mode zero to the
asset reader on a miss. A failed resolution clears the optional
map key at `0x1406379dd`. The successful branch sets the resolved
byte at `0x1406378e9`.

The [existing source](../../crates/benilla-app/src/loading_screen.rs)
reads the [map loading-screen ID](../../crates/benilla-formats/src/maps.rs),
then the [path catalog](../../crates/benilla-formats/src/loading_screen.rs)
and uses the same archive-only read, path cache and one-shot miss behavior.
The [current resource proof](evidence/resource-consumers.json)
joins all 13 entry zones to eight distinct map IDs and eight exact BLP2
members through the installed Map column 38 and LoadingScreens column 2.
Open-world zones reuse their continent art. Scholomance map 289 uses
loading screen 102. The source's picker thumbnail basenames do not
feed this cover.

The journaled Ghidra 12.1.4 result SHA-256 values are
`da68f6c7d3599914a88feb9b066f281fe28df7870a88ac87b646da47c8c8fba0`
for the map helper,
`83b2c6b92191ef3eba58d64b9912944be33b96c388693446fa21e5fbb949ed37`
for the path helper and
`728c4e31a041a78521932e44189bd7f054e3559a9f3ff4bf2bdebef104702141`
for the cache/texture consumer. Their raw slice digests and current
drive span are in the resource proof. The static resource checker reads
the EXE and installed members in place.

## Cover wait and transport route

The Windows raise helper at `0x1405f50b0` stores its fourth argument in
the wait byte at `+0x115` and zeros the ready-frame counter and displayed
fraction. World entry and transfer pending pass 1. A transport leg
notification and an unannounced worldport pass 0. The cleared transfer arm
at `0x140636554`, the active-screen worldport continuation at `0x140636950`,
and the teleport notification at `0x140636b89` clear the wait. While it
remains set, the fill path at `0x140637a1d` reuses the stored fraction.
These branches correspond to `raise`, `snap_landed` and `far_snap` in the
[cover driver](../../crates/benilla-app/src/loading_screen.rs).

The transfer arm at `0x140636560` checks the optional transport fields,
including a nonzero entry and a source map other than `u32::MAX`. It
requests the leaving-map leg through `0x1406371db`. A successful route
omits the art map. A failed route uses the destination map and clears the
route. An ordinary transfer uses the destination map and skips updating
the route slot. The leg notification calls the same constructor at
`0x1406367ea` with the index selector and preserves the prior art map on
failure. The source reaches `RouteLeg::Leaving` and `RouteLeg::Index`
through these separate [route paths](../../crates/benilla-app/src/loading_screen/route.rs).

The dismiss gate requires a nonempty world total, completed work at least
equal to that total, scene readiness and three empty backlog fields.
`0x140637cf7` checks the snap wait, the optional player settle flag,
pipeline readiness and absence of pending entry UI. A failed readiness
check resets the frame count at `0x140636fa3`. The successful branch calls
the dismiss helper at `0x140637d5e` on the third consecutive ready frame.
The rebuilt driver has the same frame gate and uses
[`WorldLoadProgress`](../../crates/benilla-world/src/terrain_stream.rs) for
world readiness. Offline admission also checks its active local-entry owner.

| Native branch | File range (exclusive end) | SHA-256 of range |
| --- | --- | --- |
| Raise state writes | `0x5f44b0..0x5f4526` | `04f4b35dc32ad05cf38b8b5d851858a6665d49e4bc8c92c8f13030427133289c` |
| Transfer selection and raise | `0x635919..0x635a9b` | `c2a25a93455207163f0a824fc838374867101a37e13370b8878aa027ca00d554` |
| Leaving-map route result | `0x6365ad..0x6365f8` | `10fd23e713c393bf4319c39202d465e2b8987c16ab0d03b56ddcf21429a43620` |
| Indexed route notification | `0x635b7b..0x635cab` | `5d3e5533c1c98a2d2d488362cce8584f4d0ebe5c5dfe38021e6488e1dae5b108` |
| Worldport wait | `0x635d50..0x635f1d` | `e4becff457229128e21b0256b59c30365720baa90bca6de159da7562a7b03e83` |
| Teleport wait | `0x635f1d..0x635f90` | `972e50de520dae146b2d50a52ccde831d1493d3c9390d1307e6eab16bdee2295` |
| World readiness | `0x636347..0x6363ad` | `8cc9bfbece4934505a9a23dfee40eb4a71015049963495d0aefd4a447f074996` |
| Readiness hold and dismiss | `0x6370f7..0x637163` | `9b76b4fd464cc04226f075a5cde64a4fd968bedc1e5ac719e73548e80b3ceaef` |

Ghidra 12.1.4 examined the drive slice at file `0x635520..0x637318`,
SHA-256 `061f74b22ead7e8016b107d62423b4532fd1f259332ce401f5a776d9c84e758b`.
The evidence export carried the result after the inline response exceeded
the transport limit. The original PE instructions establish the argument,
state and branch boundaries above.

## Same-map frozen frame

The teleport branch in the player update at `0x1407621bf` stores the new
pose and checks the detached flag at player `+0x115`. The followed body
compares the squared three-axis displacement against f32 `900.0` from
`0x14656dd78`. Only a strictly greater result sets the reload byte at
`+0x119`, increments the reload count and sets its deadline. The same
teleport path sets the settle byte at `+0x117` regardless of distance.
The adjacent packed `teleport: snapped to …, acked` log anchors the packet
consumer. The rebuilt [`snap_near_teleport` and `mark_world_reload`](../../crates/benilla-app/src/player/wire_in.rs)
connect those writes to the controller and streaming focus.

The frame hold at `0x140d89c10` requires the player pointer and all three
bytes at `+0x10c`, `+0x117` and `+0x119` before publishing the held state.
Its paired held/resumed log identifies the existing [`decide_present_hold`](../../crates/benilla-app/src/loading_screen/hold.rs)
consumer. The settle update at `0x14125a320` compares six world counters,
checks scene and outstanding work, and clears settle and reload together
on readiness or timeout. A far reload uses its fixed deadline at `+0xcc`.
The stall path extends `+0xc0` by f32 `6.0` at `0x14125a553` when world
state is stale or the counters progress. The [rebuilt release](../../crates/benilla-app/src/player/world_focus.rs)
keeps those two deadlines separate and passes the clear to `Player::end_settle`.

| Native branch | File range (exclusive end) | SHA-256 of range |
| --- | --- | --- |
| Teleport distance and hold producer | `0x761562..0x7616b8` | `53f82e0c6cebc7085b60ffa6ae138844739f07727a68c6c76b149d2dfb5f5bbc` |
| Frame hold consumer | `0xd89010..0xd89229` | `3f7c26696d3f773b6c0b97659ddc390d2d92fdfc98d22024ac7e1f2945943a63` |
| Settle release | `0x1259720..0x1259aec` | `fde1863a07db843f96c7b51561860918721539d8643d69383c1684e84af87454` |

The source paths agree on the recovered admission and release branches.
Live entry timing, frozen-frame and input behavior, and rendered comparison
remain under [#61](../verification-needed.md#gap-61).
