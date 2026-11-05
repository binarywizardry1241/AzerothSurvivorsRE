# Zone-entry loading progress in 0.141.0

[#61](../CURRENT-STATE.md#gap-61) tracks zone-entry correspondence. The
[0.113.2 recovery](zone-entry-loading-screen-2026-10-23.md) retains the
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
The [current resource proof](evidence/0.141.0/resource-consumers.json)
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
the EXE and installed members in place. Native route selection, other
hold interactions and rendered/runtime comparison remain open under #61.
