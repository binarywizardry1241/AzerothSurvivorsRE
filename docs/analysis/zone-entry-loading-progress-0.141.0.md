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
and the native yield boundary. Hold, route, artwork selection and
visual/runtime comparison remain open under #61.
