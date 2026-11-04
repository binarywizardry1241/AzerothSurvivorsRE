# Downloaded-client IME input in 0.139.2

Finding [#293](../CURRENT-STATE.md#gap-293). The selected installed Windows EXE
is `installed-game/AzerothSurvivors.exe` 0.139.2, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [range and query manifest](evidence/0.139.2/ime-bridge.json) binds this
bounded repair to the installed bytes. The [0.127.0 report](ime-bridge-0.127.0.md)
owns the earlier focus, caret, and IME message census.

## Commit delivery

The initializer at `0x140278f20` gets the IME reader from `0x140230ee0`
and two distinct writers. The wrapper at `0x1402791a0` passes those writers
separately to `0x140266ee0`. The first uses identity `0x146545700`, also
used by the typed Process filter's initializer at `0x140276908`. The second
uses identity `0x146545720`. Its bytes match `0x146544e20`, the identity in
the Winit mixed-event batch write at `0x1431489f9`. The error location at
`0x1469e55a0` resolves to the Bevy Winit `state.rs` line 873
`Messages<BevyWindowEvent>` resource access.

The forwarder reads both 64-byte IME message buffers, appends tag 2
(Commit) payloads, and passes the combined string through
`0x14027fd30` for control removal. It requires a nonempty result and a
selected primary window. Its two-event loop publishes each keyboard record
to the mixed window stream at `0x1402672e1` and the typed keyboard stream
at `0x140267177`, each with its own message ID/count.

The reconstructed `ime.rs` retains the existing PreUpdate filter and commit
order. It now publishes the same synthesized pair to both streams.
Custom screens read the typed pair. FrameXML uses the mixed pair through
`collect_input_records`, `dispatch_input_records`, and `feed_key`.
The press delivers the entire committed text to `char_input`, and the
release carries no text. The unidentified physical key has no submit or
binding token. A focused chat edit box receives the ordinary character
insertion path. Its Enter action remains a separate key walk.

## Candidate-selection keys

The current Windows virtual-key mapper at `0x143203170` resolves three
separate cases from the table at `0x146a01b30`.

| Windows code | Branch | Winit named key |
| --- | --- | --- |
| `VK_RETURN` (`0x0d`) | `0x143203311` | Enter (14) |
| `VK_SPACE` (`0x20`) | `0x143203491` | Space (16) |
| `VK_PROCESSKEY` (`0xe5`) | `0x14320344f` | Process (76) |

The Bevy converter maps the Winit Process key to logical `Key::Process`.
The typed filter at `0x140266620` tests logical tag `0x4f` on new
records. For the ordered path, AS setup at `0x140255db2..0x140255df9`
appends the same tag to the InputGate logical deny list. Its
`0x14063d190` predicate drops matching records before the UI/binding
consumers regardless of press or release. This covers a candidate key whose
physical code is Enter or Space when the platform marks the event as Process.
Plain logical Enter and Space keep their ordinary input routes.

The AS client bootstrap now installs that logical deny entry in its existing
embedding extension. The shared ordered collector applies it before creating
a FrameXML or binding record. The independent typed Process filter continues
to run before Bevy updates the pressed-key state.

## Original browser bridge

The public launcher's stamp `7960c92a7f17` selects a browser artifact
separate from the installed Windows EXE. The corresponding WASM contains
version 0.139.2 and the `__rogue_ime` and `typing` names. The browser
launcher imports its stamped `ime.js` module before WASM initialization.
[Official launcher](https://wow.aethus.pl/rogue.js?v=7960c92a7f17)

The module exposes `window.__rogue_ime.typing(on, x, y)`. It places an
editable textarea at the game-supplied caret in canvas-relative CSS pixels,
focuses it while the game requests typing, and shows its contents between
composition start and end. The textarea withholds key forwarding while the
browser reports composition, legacy key code 229, or the bridge's local
composition state. Composition end forwards the resulting text to the game
canvas as a logical keydown and keyup, then hides and clears the textarea.
Ordinary keyboard events are forwarded with their key, code, repeat and
modifier fields. The bridge masks focus transitions between the canvas and
textarea from the game and forwards page focus changes.
[Official IME bridge](https://wow.aethus.pl/ime.js?v=7960c92a7f17)

## Validation and remaining scope

Four journaled Ghidra slice operations completed and their inputs and results
were checked against the selected EXE. Exact Win64 instructions independently
establish the resource, dispatch, and output edges above. Syntax parsing passed
for the four changed Rust files. The Rust regressions cover mirrored Unicode
commit pairs and Process-tagged Enter/Space edges with ordinary Enter and Space
preserved. They remain uncompiled and unrun. The historical 0.127.0 replay
checker requires its original target and could not run against the installed
0.139.2.

The Windows IMM composition handler still emits preedit and result events.
The inspected AS forwarder reads Commit, and the source retains the established
focus and caret publication. A separate visible preedit producer has yet to
be identified for the downloaded client. The browser DOM bridge is recovered.
The exact browser WASM producer/consumer and a reconstructed browser entry
point remain open. OS/IME event emission, visible composition, Linux/macOS
backend behavior, compilation, actual chat input and original/rebuilt parity
remain open.
