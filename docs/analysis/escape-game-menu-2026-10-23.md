# Escape and the custom game menu

[Gap #59 in verification-needed](../verification-needed.md) owns the reported
failure to open the original game's menu. The repaired source path is bound to
installed **0.112.5**, SHA-256
`445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36`.
[Native evidence](evidence/0.112.5/escape-menu/manifest.json) and the
[static checker](../../scripts/check-escape-menu.py) own the exact ranges,
resource identities, bounded instruction cases and recovery limits. Historical
pause construction/actions retain their [0.109.0 provenance](run-hud-0.109.0.md).

## Defect and native contract

The initial adapter waited for a visible `GameMenuFrame`, hid it and then raised
`custom_game_menu_requested`. This was an implementation assumption about the
input boundary. It fails when an addon hides the stock frame and replaces
`ToggleGameMenu`: the loaded SurvivorsDragonUi Menu module does both, showing
its own anonymous frame instead. The retained reconstructed launch log records
that module loading. This proves a bypass of the source handoff; the
reported failed key press and its final rendered frame were not captured.

The current EXE uses a different boundary. Producer **`0x14007d170`** resets a
separate Escape request resource. During an active run it obtains the preceding
UI typing snapshot through **`0x14065e210`**. When typing does not own the key and
an Escape event is present, it removes **all** Escape events from the two native
keyboard message buffers before Lua input, including repeats and releases. Only
a **Pressed, nonrepeat** event raises the request. An EditBox's typing route
continues to receive its own Escape. The producer and consumer share the same
recovered request-resource TypeId; visibility of a named Lua frame is not a
prerequisite.

Consumer **`0x14008e180`** takes and clears that request once. Its custom-screen
priority precedes pause: Options binding capture/close and other custom menus,
then the run talent viewer. An existing pause sends resume command **7 / false**.
A new run pause requires the current choice and reward payloads to be absent and
sends **7 / true**. The unstarted-run branch opens the pregame menu state.
This is independent of the Lua `ToggleGameMenu` cast/target/window ladder. The
older report's proposed FrameXML-first trace did not establish the target's
actual Escape ownership.

## Connected repair

[Local client input](../../crates/benilla-app/src/local_client.rs) now installs
`capture_game_menu_input` in `LocalClientSet::OverlayCapture`, before `UiInput`.
The embedding opts in through `LocalClientExtension.custom_game_menu` while the
AS run is active. A persistent message cursor advances even while inactive or
typing, so an earlier press that closed an EditBox cannot reopen a menu after
focus clears. The filter reads the UI typing snapshot, preserves unrelated keys,
removes owned Escape from both message buffers and publishes one fresh request.
It advances the cursor again after republishing the retained events. Device
requests and the existing stock-frame handoff join the same
request in `capture_input`; neither can overwrite the physical request.

The [pause consumer](../../crates/azeroth-survivors-re/src/gameplay/run_hud/pause.rs)
takes the request once, respects current typing and Options ownership, closes
the custom talent viewer before opening pause, and refuses a new pause while
the live choices vector contains a level or treasure offer. Closing an existing
pause retains precedence. It uses the existing native-style root and
Resume/Options/End Run/Character select/Quit actions. The
[gameplay controls](../../crates/azeroth-survivors-re/src/gameplay/mod.rs) continue
to publish pause to the simulation and local player through that same state;
there is no addon or replacement menu change.

The unstarted run now uses the recovered main-menu title, Back row and Escape
hint; a started run uses Paused, Resume and its resume hint. End Run confirmation
and terminal/account delivery retain their separate historical contracts and
#7/#9 limits.

## Validation and remaining limits

The non-compiling checker passes **115 original-instruction cases**: 36 producer
cases, 48 retained-event predicate cases, 19 request/priority/pause transitions,
six reader-freshness cases and six started/pregame label selections. It verifies selected target bytes,
nonoverlapping retained extracts, six localization literals and connected source
routes. It requires the existing Unicorn analysis dependency and never installs
tools. Rust source was parsed with `rustfmt --emit stdout`; it was not compiled.
The authored Rust regression covers both message buffers, unrelated-key
retention, absent/replaced stock menu, repeats/releases, typing-to-unfocused
transitions without a new press and inactive sessions; it was **not run**.

No build, `cargo check`, compiling test, application/game launch, addon change or
original/rebuilt input/rendering comparison ran. Bounded instruction replay does
not execute the Bevy schedule, Lua input walk, renderer or a full game session.
The exact reported interaction remains unreproduced. Displayed menu geometry,
click targets/actions, Options return, pregame and terminal interaction, chat/UI
focus transitions and ReloadUI still need controlled runtime comparison. #59
retains those validation/parity requirements; broad menu/style and terminal
ownership remain #7/#9/#17.
