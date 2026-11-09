# Browser IME handoff

Finding [#293](../CURRENT-STATE.md#gap-293) covers this separate browser
artifact. The [downloaded-client commit repair](ime-bridge.md) and
[current preedit trace](native-ime-preedit.md) own the Windows path.

## Current browser startup and data

The official browser page selected stamp `26b3e1491fee` on 2026-11-09.
Its WASM identifies the app as **0.143.0** and is independent of the
installed Windows PE. The launcher and IME module match their retained
0.141.0 digests. The current generated glue and WASM have new digests.

| Deployed input | Bytes | SHA-256 |
| --- | ---: | --- |
| [Page](https://wow.aethus.pl/) | 1,640 | `73040be608e411939c1eeb1fc06bcd6dfc83f5aafd0861a213714b0aea37d770` |
| [Launcher](https://wow.aethus.pl/rogue.js?v=26b3e1491fee) | 24,224 | `7644df9f61fdca9865d20b9995ff3f57c51223de53ae9d926c5c539ac739a515` |
| [IME module](https://wow.aethus.pl/ime.js?v=26b3e1491fee) | 4,702 | `b785f05a37e1a08172b98e656630368accc432f6cfbf8ca7ec45eedaf6ef065c` |
| [Boot module](https://wow.aethus.pl/boot.js?v=26b3e1491fee) | 14,453 | `268a698dd5b550d46229c300156cca6120847fe4644cd374ba653b4dfb12ea79` |
| [Generated glue](https://wow.aethus.pl/wenilla.js?v=26b3e1491fee) | 187,604 | `8c4cfb89bb93688cb7dc64462d6c0332b4961ef7a17b8b4991704460cabd266b` |
| [WASM](https://wow.aethus.pl/wenilla_bg.wasm?v=26b3e1491fee) | 93,129,008 | `c69ce2ca83be27507e186d4db99b333f955b7d132a5451d82fc69d73d7acda4b` |
| [Data name index](https://wow.aethus.pl/data/__index?v=26b3e1491fee) | 1,734,520 | `eb133d7527f16e0ddd220669ad83e89046f02ad8cc597e5c4a9ed09f077b7e70` |

The page supplies a focusable `canvas#benilla`. The launcher checks WebGPU,
publishes startup choices through `__rogue_config` and mounts the add-on,
save and IME modules before importing the generated client. The boot
module compiles the stamped WASM while the 517-name startup manifest
warms the HTTP cache. Instantiation waits for both and runs
`__wbindgen_start`, which initializes the externref table and calls
`start`. The launcher binds WASI memory after initialization returns.
In the current module, function 4351 reads `__rogue_config` at file
offset `0x14dfa66`.

The launcher sets `__wenilla_data_layout` to `static`, resolves
`__wenilla_data_base` to the page-relative `./data`, and supplies the
stamp through `__wenilla_data_stamp`. The boot reader lowercases the
name, splits on both slash forms, omits empty segments and percent-encodes
each segment before joining. Only `__index` takes the stamp. The index
contains 30,040 original member names. The lowercase segmented URL for
`Interface\GlueXML\GlueStrings.lua` returned 33,563 bytes. The whole-name
encoded URL used by stock wenilla's host returned HTTP 404 on the same site.
WASM functions 50019, 23454 and 78775 read the layout, base and stamp
properties respectively. The layout reader requires the exact six-byte
value `static`.

WABT 1.0.42 validated the complete current module. A decode projection
retained the selected original function bytes and indices. The table
records original file ranges, excluding the variable-length body size
prefix and including the local declarations.

| Current function | File range | SHA-256 |
| ---: | --- | --- |
| 178214, wasm-bindgen start | `0x4bde3a9..0x4bde3b1` | `5d085f1618d860182782b2be984d0b3b047efa5bdfe67d2b473fc628f3d0ce88` |
| 4351, app startup | `0x14df48c..0x150bbac` | `14e2cb14df5f3f15d67366f3cd746995ce24a5d616f926466d3e78d7b8ec263a` |
| 50019, data layout | `0x3f2ce72..0x3f2d583` | `11fcf4e96551a7027846335f6d595b11245aad269d6af93b2492e6076e84b79f` |
| 23454, data base | `0x2e73e78..0x2e7410a` | `264bd6168d42d41736572c69943cf50d1cf8395941957f5a9429f2017a828333` |
| 78775, data stamp | `0x45421b0..0x45425c8` | `cd97a93aabc6c08345c8eb196a57b32e08219598dff1a59ebdb7d10e9890133d` |
| 6565, IME publication | `0x1a75e45..0x1a766c3` | `e2440bc712c4c146be3df2a2d4072a9a7b77527a6dab25c47ed5f90ef44777b2` |
| 29260, key press | `0x33b6c4a..0x33b6e37` | `48280c4216d55d4d646ce905d294114fa7d7413db0449f71863c79e468278aca` |
| 29261, key release | `0x33b6e39..0x33b7026` | `6a7dfe1a068db7ee0637cb7aeda7c9e032e30cefb0299bdd8cac49eb5ef25817` |

Function 6565 retains the 2% and 80% fallback and focus/caret change
gate. It materializes `__rogue_ime` and `typing` at file offsets
`0x1a7627c` and `0x1a762f3`, then calls Function.apply at `0x1a76377`.
The press and release readers both call the `key` and `code` wrappers
88450 and 88451, whose body hashes match the retained 0.141.0 wrappers.
The readers build the text through 27054 and reach the common dispatch
6126 with distinct state bytes. The current browser still identifies
Winit 0.30.13 and Bevy Winit 0.18.1.

## Retained 0.141.0 inputs

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

## Retained body evidence

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

## Rebuilt source boundary

The [app entry point](../../crates/azeroth-survivors-re/src/main.rs)
uses native arguments and creates its primary Winit window after sampling
`std::time::SystemTime` through
[`RunSeeds::default`](../../crates/azeroth-survivors-re/src/run_seed.rs).
The installed-data discovery feeds both
[`load_menu_art`](../../crates/azeroth-survivors-re/src/assets.rs) and
[`register_mpq_source`](../../crates/benilla-assets/src/lib.rs). Both
construct the native [MPQ chain](../../crates/benilla-formats/src/chain.rs),
which opens OS files. The [skin composite](../../crates/benilla-app/src/entities/skin_composite.rs)
and [zone sound](../../crates/benilla-app/src/sound/zone.rs) also call
`archive_for` directly. A page has no archive handle to supply.

The existing [wenilla browser entry](https://github.com/Arnesen/wenilla/blob/ba8ab06dab11e3dc72e4ff0391dcff15211cf8de/crates/wenilla/src/lib.rs)
and [WebGPU canvas bootstrap](https://github.com/Arnesen/wenilla/blob/ba8ab06dab11e3dc72e4ff0391dcff15211cf8de/web/index.html)
provide the app boundary for reuse. Its
[WASM Chain](https://github.com/Arnesen/wenilla/blob/ba8ab06dab11e3dc72e4ff0391dcff15211cf8de/crates/benilla-formats/src/chain.rs)
provides synchronous catalog reads and name lookup, while
[its asset source](https://github.com/Arnesen/wenilla/blob/ba8ab06dab11e3dc72e4ff0391dcff15211cf8de/crates/benilla-assets/src/lib.rs)
fetches asynchronously. Both would need the recovered static URL contract.
Wenilla already has separate browser skin and audio paths and a
browser-backed engine state store. The vendored engine lacks these routes.
The rebuilt AS application also needs its browser startup clock, save and
add-on host adapters before the real picker and FrameXML can run on that
canvas.

Once those platform paths reach the real app, the existing
[focus and caret publisher](../../crates/azeroth-survivors-re/src/ime.rs)
can call the recovered DOM bridge. Winit already supplies the keyboard
events to the custom text fields and FrameXML. The present checkout has
no browser entry that can reach those consumers. Browser source
integration remains open. The static trace leaves downloaded-client
preedit, browser execution and original/rebuilt parity for verification.
