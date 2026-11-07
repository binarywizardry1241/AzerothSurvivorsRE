# Escape and the custom game menu

[Gap #59 in verification-needed](../verification-needed.md) owns the reported
failure to open the original game's menu. The repaired source path is bound to
installed **0.112.5**, SHA-256
`445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36`.
[Native evidence](evidence/escape-menu/manifest.json) and the
[static checker](../../scripts/check-escape-menu.py) own the exact ranges,
resource identities, bounded instruction cases and recovery limits. Historical
pause construction/actions retain their [0.109.0 provenance](run-hud.md).

## Defect and native contract

The initial adapter waited for a visible `GameMenuFrame`, hid it and then raised
`custom_game_menu_requested`. This was an implementation assumption about the
input boundary. It fails when an addon hides the stock frame and replaces
`ToggleGameMenu`: the loaded SurvivorsDragonUi Menu module does both, showing
its own anonymous frame instead. The retained reconstructed launch log records
that module loading. This proves a bypass of the source handoff; the
reported failed key press and its final rendered frame were not captured.

The 0.112.5 EXE uses a different boundary. Producer **`0x14007d170`** resets a
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

## Ordered input and stock menu handoff in 0.139.2

Installed target **0.139.2**, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The declared owner `0x14025d4d0..0x14025e27a` begins at file offset
`0x25c8d0`. Its 3,498 bytes hash to
`d984de6969270949adeedd6024accf853f6f0d23d88c01bbed036637e276b710`.
The journaled Ghidra procedure info and decompilation both completed on
the exact raw slice. Independent instruction checks supply the typed input
proof at the external-resource boundaries.

The producer clears the physical-key deny list at `0x14025da42` and
inserts Escape (`0x73`) at `0x14025da71` when its input predicate
admits it. The later branch at `0x14025dc21` checks the typing result
before searching the typed events for Escape. The request predicate at
`0x14025de03..0x14025de21` requires a pressed, nonrepeat record. The
queue at `0x14025debb..0x14025def6` exposes both typed buffers to the
filter. At `0x14025e088` the producer writes request byte zero of the
resource with TypeId `e9ca2078301041406019272a46dc943f`.

The pause initializer resolves that same TypeId at `0x1402779ce` and
saves the resource ID at system-state offset `+8` at `0x140277d56`.
The dispatcher reads that slot at `0x140278296` and calls the pause
consumer at `0x140278a9d`. The consumer `0x14025f2b0..0x14025f656`
(SHA-256 `89d2841d04ee437d0a578a76795ee3de8a1f279f8287a623441f76ca2715a29d`)
tests and clears the request before the other screen predicates at
`0x14025f408..0x14025f410`. The separate `7 / false` and `7 / true`
paths and two absent-payload checks remain visible in its ordinary pause
branches. The earlier complete scenario matrix retains its 0.112.5
provenance.

The installed EXE embeds the exact tracked `GameMenuAdapters.xml` at
`0x1466e0293` (7,130 bytes, SHA-256
`1c5ef92163e352246c16781092d17bfc2695f59e09e4b411ec40ba19287f9dd1`).
Its wrapper still delegates to stock `ToggleGameMenu` after its Options
and popup handling. The micro button, a binding or an addon can therefore
show the stock frame separately from the physical Escape path. In the
reconstruction, the previous handoff checked the frame only after the
whole ordered input walk. A later click in the same batch could reach
the stock Exit Game row before that check.

The ordered dispatcher now hides a visible stock menu before a button
record can hit it during an active custom run. It consumes that record
and publishes the same custom pause request the post-input fallback uses.
The post-input check also catches non-input shows. The physical Escape
guard in the ordered collector continues to gate both edges separately
from the typed message filter. The custom Options button only opens
Options. The space between buttons has no action, and Quit remains its
own custom row.

`python3 -B scripts/check-escape-menu.py --installed-producer` checks
36 installed producer branches, the exact embedded stock adapter, and
source connectivity. The Rust parser accepted the changed modules. The
same-batch regression covers custom ownership and the ordinary stock
path, and awaits compilation and execution. Actual Escape, Options and
Exit Game interaction, ReloadUI and original/rebuilt comparison remain
under [#59](../verification-needed.md#gap-59). General pointer and wheel
isolation belongs to #310.
