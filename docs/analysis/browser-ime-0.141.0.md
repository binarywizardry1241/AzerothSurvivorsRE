# Browser IME handoff in 0.141.0

Finding [#293](../CURRENT-STATE.md#gap-293) covers this separate browser
artifact. The [downloaded-client commit repair](ime-bridge-0.139.2.md) and
[current preedit trace](native-ime-preedit-0.141.0.md) own the Windows path.

## Deployed inputs

The official index selected stamp `f3a3d645a1ed` on 2026-11-04. The
launcher imports the DOM bridge before initializing the generated WASM glue.
The two handwritten modules match the digests retained from the 0.139.2
browser deployment. The compiled files differ. Both stamps now returned the
same 0.141.0 WASM digest, so the stamp alone cannot identify historical bytes.

| Input | Bytes | SHA-256 |
| --- | ---: | --- |
| [Launcher](https://wow.aethus.pl/rogue.js?v=f3a3d645a1ed) | 24,224 | `7644df9f61fdca9865d20b9995ff3f57c51223de53ae9d926c5c539ac739a515` |
| [DOM bridge](https://wow.aethus.pl/ime.js?v=f3a3d645a1ed) | 4,702 | `b785f05a37e1a08172b98e656630368accc432f6cfbf8ca7ec45eedaf6ef065c` |
| [Generated glue](https://wow.aethus.pl/wenilla.js?v=f3a3d645a1ed) | 187,604 | `fab7fe841a677245c5f6b954ef450656bd09e034b8ba3da632ddf8288cd0dcec` |
| [WASM](https://wow.aethus.pl/wenilla_bg.wasm?v=f3a3d645a1ed) | 93,159,237 | `c1b2c99d39f5809215079951e5df46f091c2d57669ffd9e96edcea61169a17c0` |

The selected WASM embeds `0.141.0`, Winit `0.30.13`, and Bevy Winit
`0.18.1`. These identifiers describe the browser input and do not bind it
to the installed Windows EXE's hash.

## From typing focus to the DOM

WASM function 6571 selects the active typing flag and caret, with a fallback
at 2% of logical width and 80% of logical height. A disabled request uses
zero coordinates. It compares enabled state and coordinates with the previous
publication. At the JS boundary it resolves a browser Window, reads
`__rogue_ime` through Reflect.get, requires an object, reads `typing`
from that object, and requires a function. Its three array pushes supply the
boolean and then the two logical coordinates converted from f32 to JS
numbers. Import 1 calls Function.apply with the bridge as receiver and
that array as arguments. The property literals occupy Data segment 1633 at
linear addresses `0x181461` and `0x18146c`. The string materializations
and apply call are at file offsets `0x1a7aed1`, `0x1a7af48`, and
`0x1a7afcc`.

The DOM module places its textarea at the rounded sum of the canvas origin
and each supplied coordinate. It uses the canvas with ID `benilla`.
Composition start makes the textarea visible. Composition end sends a
bubbling, cancelable keydown followed by keyup to that canvas, using the
committed string as `key` and leaving `code` at its default empty value.
The textarea is then hidden and cleared. The independent input handler
forwards non-composing `insertText` data. Ordinary keys retain their key,
code, location, repeat and modifier fields. Composition state,
`isComposing`, and legacy key code 229 gate ordinary forwarding. The
module masks focus transitions between the textarea and canvas and relays
page focus changes.

## From synthetic DOM keys to game input

WASM functions 29269 and 29270 are the press and release counterparts.
Their instructions differ only in the state byte before the same dispatch
call to 6133. Each reads DOM `key` and `code` through wrappers 88447
and 88448, bound to imports 669 and 670. They build logical and physical
keys separately and call 27059 for the text value. The glue reads the DOM
properties and returns UTF-8 pointer/length pairs.

The matching Winit source shows how the canvas listeners pass these fields
to the window event. A character payload becomes a logical character and
text, and the empty DOM `code` becomes an unidentified physical key.
Named key values still take Winit's ordinary named-key mapping. Both
listeners set Winit `is_synthetic` to false, so their DOM origin does
not trigger Bevy's Winit synthetic-key filter. Bevy's corresponding
conversion carries state, key, text and repeat into typed keyboard
messages and the ordered window stream. The reconstruction already has
the keyboard consumers for custom text fields and FrameXML.
[Winit canvas listeners](https://github.com/rust-windowing/winit/blob/v0.30.13/src/platform_impl/web/web_sys/canvas.rs#L270-L317)
· [Winit key and text mapping](https://github.com/rust-windowing/winit/blob/v0.30.13/src/platform_impl/web/web_sys/event.rs#L163-L183)
· [Winit key-name mapping](https://github.com/rust-windowing/winit/blob/v0.30.13/src/platform_impl/web/keyboard.rs)
· [Winit window events](https://github.com/rust-windowing/winit/blob/v0.30.13/src/platform_impl/web/event_loop/window_target.rs#L133-L202)
· [Bevy Winit publication](https://github.com/bevyengine/bevy/blob/v0.18.1/crates/bevy_winit/src/state.rs)
· [FrameXML input](../../crates/benilla-app/src/ui_script/records.rs).

## Evidence and source boundary

WABT 1.0.42 validated the complete WASM. Its objdump decoded exact selected
function bodies in a temporary projection retaining their original function
indices and import table. The projection was used only for decoding. The
following ranges are file offsets in the original WASM, with exclusive ends
and SHA-256 over the full bodies including local declarations.

| Function | File range | SHA-256 |
| ---: | --- | --- |
| 6133 | `0x199532d..0x1995ea3` | `aede98e0e567a1cca17a7aaec14d63093a333a521df786948eebc1a21351e817` |
| 6571 | `0x1a7aa9c..0x1a7b316` | `cbdbd654817a16af49374687bafc3fd9fa9ff438505f37819ed34beb581e6952` |
| 27059 | `0x31cb9aa..0x31cbe2c` | `ef22a6f9407641dfe57ab495f04eba76f50b26e50e7de1870908e02353de949d` |
| 29269 | `0x33c5fa9..0x33c6196` | `f997754d590b2b61abb59a11724272edd287af623dab683208f0b37448e0f93c` |
| 29270 | `0x33c6198..0x33c6385` | `70acdd56d2ce0c694a60e630bfffa759bf9de41acd56bfd9c6c35cf507434967` |
| 88447 | `0x484e75c..0x484e7a0` | `a9635d80cf3bc6b4de20367d510ec6b2a8f3b15dba773ed69fa076049e99dddd` |
| 88448 | `0x484e7a1..0x484e7e5` | `2a7d84f367903f3175060a31e740236743237c65a8a3a92fae11fd52d4e77db3` |
| 92338 | `0x489526a..0x48952c3` | `5a5190fa924a939e8e94a571d661da79c587cc6f047bc015bd35d2d9b49b93f6` |

The current [app entry point](../../crates/azeroth-survivors-re/src/main.rs)
uses native arguments, files and the local MPQ data path. Its manifest and
the existing engine provide no browser app/data bootstrap or game canvas
entry. Once that platform boundary exists, the AS hook can use the existing
[focus and caret publisher](../../crates/azeroth-survivors-re/src/ime.rs)
to deliver this DOM call and the browser's normal Winit path to receive the
keys. Browser source integration and execution remain open. The static
browser trace leaves downloaded-client preedit, actual browser/IME behavior,
and original/rebuilt parity for separate verification.
