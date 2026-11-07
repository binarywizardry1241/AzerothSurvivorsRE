# Damage meter scrolling

This assessment covers `changelog:0.141.0:623f08c5eb0ffcb7` and
[#8](../verification-needed.md#gap-8). The installed
`installed-game/AzerothSurvivors.exe` is 151,493,632 bytes with SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.

The window constructor at `0x14037a480` creates a growing, min-height-zero
row below the header. It creates a second growing node inside that row with
min-height zero, a vertical flow, three pixels of padding, a two-pixel row gap
and vertical Scroll overflow. At `0x14037bfbf` it loads the ten-byte key
`meter-rows` from `0x1465c77eb`. The call at `0x14037c006` forwards the returned
viewport entity to the shared scrollbar constructor. The rail is eight pixels
wide and uses the same target entity for its thumb and track. The window
builds the resize grip later, with the 14-pixel width and height loaded at
`0x14037c7ba`.

Reset's action at `0x14041f341..0x14041f378` updates the view's pending
baseline flag and zeroes its rate-sample length. The action does not write a
scroll offset. The snapshot owner replaces the baselines, clears the flag
and calls the row builder at `0x140421c46`. The row builder handles empty
Damage, Healing, Boss and Party results, as well as populated results, under
the shared viewport. The named list uses the
[retained wheel and offset contract](home-screen.md) and
[track and thumb input](menu-input.md).

The rebuilt [meter window](../../crates/azeroth-survivors-re/src/gameplay/meter.rs)
now uses a bounded scroll viewport and passes it to the
[shared scrollbar](../../crates/azeroth-survivors-re/src/scrollbar.rs).
The shared named cache restores the offset if the viewport is rebuilt.
Rows can repopulate without recreating that viewport. Bevy layout clamps
the rendered offset to the new content size and the shared input system
updates the retained offset. When the result fits, the rail hides and
the offset clamps to zero. The existing meter-window hit covers the list
and rail before the FrameXML wheel walk. The rail and thumb use blocking
focus, with the existing resize control above the shared lower corner.
Wheel input over the row viewport and dragging the rail's thumb can reach
the end of a list independently of the resize control.

| Current PE range | File offset | SHA-256 |
| --- | --- | --- |
| `0x14037bb04..0x14037bd3b` body wrapper | `0x37af04` | `253b34c84b3adbb29d4e12fd2d481e5edbb0124f86c0544f45fca77f2111e152` |
| `0x14037bd7a..0x14037c00b` viewport and rail call | `0x37b17a` | `9ac1935c2d4f8c802cb3a0aa41b94e2d96428d0d39d097d07d4352dfa947be74` |
| `0x140402d30..0x140403318` rail and thumb constructor | `0x402130` | `ff11a25a4c49892f2524a2a0428a81004cd2eed5a21150c0ff177b214f26257e` |
| `0x14041f341..0x14041f378` Reset writer | `0x41e741` | `3348863a702808bb47309873a421695283c9ad95094669abdac652e43420d7fa` |
| `0x140421b55..0x140421c4b` row builder call | `0x420f55` | `56fce22fd9834a05a9be298e5e25519cc37463edc8c6e69c8e93c414cc0de64e` |

The journaled Ghidra constructor query has Evidence ID
`ev_68129afb22f436e3233047c6eb5a5a9281d421c86572d6719cef74e0e049d253`.
Its 10,036-byte raw input at `0x14037a480`, file offset `0x379880`, has SHA-256
`88c0d813039e6e12af93af750aff7635e87033802d1c90601ee470b0b541deba`.
The verified result SHA-256 is
`ad4a616884e6a0653e3debe5ed74c9e2d2815aa5d77f8ed14396bcf74240b4ab`.
Original PE decoding and bounded instruction replay checked the two node
records, viewport identity, rail width and Reset writes using synthetic
entity IDs and explicit spawn and copy seams. Rustfmt parsed both changed
Rust files. Compilation, rendered input and original/rebuilt comparisons
remain open, including reset-and-repopulation and small-window resize behavior.

## Minimap tint change detection

The [meter paint trace](computed-transfers.md#shared-color-comparison-and-receiver-dispatch)
connects `0x14042442d..0x1404244fc` to the minimap icon's linear white and
dim sRGB tint paths. The native comparison at `0x1404244e2` skips the
change-tick store and the tint write when the existing value is equal.
The rebuilt paint previously marked `ImageNode` changed on every update
through its mutable assignment. It now compares the tint through the existing
Bevy change-detection interface before writing the field. The icon values and
the activation conditions remain as recorded in the live paint source.

The [tint proof](evidence/meter-minimap-tint.json) binds the two
color values, native writer and comparison table. Seven bounded instruction
replays cover equal and changed tint, both open states, interaction, a different
color tag and a NaN channel. The check supplies synthetic component and tick
slots. Rendered behavior, initialized scheduling and original/rebuilt comparison
remain open under [#8](../verification-needed.md#gap-8).

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/tool-state/python/armory/python-libs \
  python3 -B scripts/check-meter-minimap.py --current-tint
```
