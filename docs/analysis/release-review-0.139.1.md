# Supplied release review for 0.139.1

Installed identity discovered during final 0.139.0 checks: **0.139.1**,
150,633,472 bytes, SHA-256
`1c0912276637a41a1a971886bb74626577d021af55a313128f85fdbfcc3b2f1d`.
The selected-target refresh owns registration, whole-image/native scans,
current connection/claim accounting and exact selected-target evidence. This
report supplies a source-first ownership review; it does not promote historical
addresses or release prose into 0.139.1 native contracts.

The [canonical changelog](../CHANGELOG.md#01391) retains **ten independent
supplied items**: one summary, eight bullets and one timing note. The summary
links its component work without creating another defect. `notes: live in 20
minutes` is unanchored release context; it supplies no absolute release time,
installed identity, native behavior or runtime obligation.

## Connected ownership and actual source

Existing implementations and their original evidence remain retained.
[Escape recovery](escape-game-menu-2026-10-23.md),
[Options binding capture](in-run-bindings-0.112.0.md),
[gamepad input](pad-0.112.0.md) and [IME bridge](ime-bridge-0.127.0.md)
have historical target bounds. Newest-target correspondence is separate from
missing implementation; source already supplied is not reset by these notes.

The menu/input work is connected through foreground ownership, event lifetime
and downstream dispatch. **#310** owns newly reported general menu/window
pointer/wheel isolation and picker Enter. Existing **#59**, **#7/#8**, **#17**,
**#22** and **#293** retain their distinct issue identities and actual consumers.
**#311** separately owns Windows-on-Wine/Proton activation stability; no shared
root cause with input isolation or IME is established.

| Work owner | Observed reconstructed source | Missing selected-target contract and next static step |
| --- | --- | --- |
| <a id="work-311"></a>**#311 — Windows-on-Wine/Proton activation** | `game_window.rs::publish_title` only updates the title. `native_input/acquisition.rs` detects Wine for gamepad-backend selection, which is not a window-activation repair. Existing `benilla-app/src/player/camera.rs::sync_look_focus` releases/reacquires cursor ownership across focus changes. The explicit `WindowFocused` cursor reassertion inspected in `cursor.rs` belongs to its macOS module. | Identify the 0.139.1 activation/focus handler, changed external/platform call, object/handle lifetime and failure boundary. Compare the actual Windows compatibility path with existing engine source before expanding recovery. No crash, stack trace, responsible API or fix is inferred from release wording. |
| <a id="work-59"></a>**#59 — Escape and duplicate stock/custom menu** | `benilla-app/src/local_client.rs::capture_game_menu_input` already owns fresh nonrepeat Escape before Lua input, drains both keyboard buffers, preserves unrelated events and respects the preceding typing snapshot. `gameplay/run_hud/pause.rs::input` takes the request once with Options/talent/choice priority. `gameplay/client.rs` enables custom-menu ownership for the active game. | Revalidate current registration, filter ordering, active-screen and typing gates, plus every stock `ToggleGameMenu`/GameMenuFrame opening route. Trace the current pause click to its actual action and prove the underlying Exit Game route cannot receive it. Preserve the historical repair; the new note does not prove this exact reconstructed source regressed. |
| <a id="work-310"></a>**#310 — Menu/window click and wheel isolation** | `menu_overlay.rs::spawn` creates a full-screen `FocusPolicy::Block` backdrop. `LocalClientExtension.pointer_over_ui` supplies embedding ownership; `ui_script/input.rs::feed_ui_input` checks it before ordinary FrameXML mouse routing, retaining the independently registered on-top exception. `feed_ui_wheel` explicitly stops for `binding_capture`, while `wheel_for_world` checks the egui pointer gate and otherwise passes unconsumed wheel to the world; this inspected path has no equivalent embedding-pointer test. | Recover the actual 0.139.1 modal/window hit/hover, pointer-consumed and wheel-consumed state, schedule/reset lifetime, ordinary engine window ancestry and explicit on-top exceptions. Follow the current pause/options/window producer through FrameXML bindings and camera zoom. A Bevy backdrop or hover bit alone does not prove complete click/wheel ownership. |
| <a id="work-drag"></a>**#310 with #7/#8 — HUD/meter dragging** | `gameplay/run_hud/controls.rs::capture_pointer` and `gameplay/meter.rs::capture_pointer` already OR retained drag/hover state into `extension.pointer_over_ui` in `OverlayCapture`; drag input also publishes ownership. Existing drag completion/persistence and meter settings remain supplied. | Prove current first-press, held-drag, release/cancel and teardown ownership across custom UI, FrameXML, world picking and camera consumers. Recover the precise changed producer/consumer seam before attributing the report to a missing drag flag or rewriting retained behavior. |
| <a id="work-picker"></a>**#310 — Picker Enter isolation** | `menu.rs::input` handles Enter/NumpadEnter using physical `ButtonInput`, enters only with no dialog on Picker and no pending entry/co-op wait, and owns its `MessageReader`. Advancing/clearing that reader does not itself remove keyboard records from other consumers. Existing custom frontend ownership and stock GlueXML support are separate engine interfaces. | Recover exact current foreground picker admission, keyboard-buffer ownership, synthetic/physical Enter handling and the ordinary character-select consumer. Establish the event's lifetime across both consumers rather than assuming a local reader clear or visual coverage prevents the hidden action. |
| <a id="work-17"></a>**#17 — Binding capture isolation** | `options.rs::capture_input` publishes `binding_capture` in `OverlayCapture` before FrameXML. `ui_script/input.rs` already suppresses new captured presses and their repeats, retains ownership until release, preserves modifier/release handling and stops world wheel during capture. The Options editor accepts nonrepeat key/mouse/wheel tokens and has explicit capture cancel. | Revalidate current capture activation/accept/cancel timing, held-key/release lifetime and each downstream binding/character path. Existing suppression is present; no missing implementation or regression is established by the note alone. Preserve the historical native/source capture contract until its changed-target applicability is resolved. |
| <a id="work-22"></a>**#22 — Controller Back/Select opens Character** | `native_input/mod.rs::pad` maps `GamepadButton::Select` to `pad.character`; focused gameplay without keyboard capture publishes a synthetic C press through `publish_key`. Internal `pad.back` instead means East/cancel and requests a menu only in the non-gameplay focus path. | Recover which physical/native enum the release calls Back, its acquisition/backend mapping, edge and focus/capture gates, and C/character-pane dispatch. Do not conflate controller Back/Select with internal East/cancel or claim this action is absent when Select-to-C source already exists. |
| <a id="work-293"></a>**#293 — Downloaded-client CJK commits and composition keys** | `ime.rs` filters logical Process records, forwards sanitized `Ime::Commit` text as logical press/release pairs before `InputSystems`, and publishes focus/caret after layout. It does not retain a composition-active Enter/Space suppression state; `Ime::Preedit` display remains separately unestablished. Existing FrameXML EditBox/chat key and text routing is reused. | Recover the current downloaded-client native commit bridge, composition state/lifetime, Enter/Space classification and event filtering before chat submit and bindings. Trace the actual chat consumer and OS/backend handoff; distinguish Windows/Linux/macOS applicability and preserve separate browser-artifact limits. Do not invent a preedit renderer or infer a focus-crash cause. |

Further exact current native leads must be selected from the 0.139.1 whole-image
and diagnostic/ownership inventories, including filename-free input and engine
boundary changes. Historical RVAs in the linked reports are navigation context
only. Available benilla source is the first comparison point; surrounding generic
window, ECS, renderer, OS and compiler internals stop at the concrete AS interface
unless a required unresolved dependency justifies further bounded recovery.

## Current bounded InputGate evidence

The [InputGate report](input-gate-native-0.139.1.md) and
[exact manifest](evidence/0.139.1/input-gate-native.json) now recover a bounded
**#310** filter. The name leaf and plugin descriptor lead to callback
`0x1408882e0`; its system descriptor/wrapper calls the 595-byte filter owner
`0x140f1f330`. Original instructions and both four-entry tables establish
in-place filtering of `0x60`-byte records, stable compaction, dropped-record
cleanup and the final retained count. Raw record `+0x40` selects four observed
indices; gate bytes `+0x30/+0x31` and two external list predicates control the
bounded drop conditions. Raw key codes and tags remain unnamed. The different
`!= 0` versus `== 1` tests of the second gate byte agree for 0/1, while its
producer invariant is unproved.

This is stronger than the namespace candidate, but it does not identify the
typed resource/event enums, capture/list producers, reset lifetime, registration
predicate, actual system ordering, modal admission or picker/FrameXML/world
consumers. The filter's Ghidra pseudocode covers only 144 non-contiguous bytes
and stops at indirect dispatch; complete bounded filter observations come from
independent instruction/table checks. Four native operations completed across
the two raw subjects; that is not application execution or a whole-feature
source assignment. **#59**, **#7/#8** and **#17** retain their own source and
missing typed connections. No gamepad or IME contract is inferred from the raw
filter tags.

The same report separately identifies ordinary Windows activation interfaces:
helper `0x1431cc110` calls `MapVirtualKeyW`, `SendInput` and
`SetForegroundWindow`, and another bounded owner compares `GetActiveWindow`
before `ClipCursor`. These are platform correspondence, not the **#311** repair
identity or crash cause. No causal edge from InputGate to Wine/Proton stability
was established.

## Retained four-scope correspondence

The [current correspondence report](native-interface-correspondence-0.139.1.md)
and [code/data evidence](evidence/0.139.1/native-interface-correspondence.json)
revalidate exactly four previously registered local scopes:

- **#302:** local-clock name/length/callback descriptor construction; actual
  registry success, device-time/format/schema, VM and widget lifetime stay open.
- **#300:** recap/killer key/type/generation and named payload consumers;
  capture, grouping, recipient production, helper/numeric and input lifetime
  remain outside the bounded proof.
- **#305:** the raw-tag/rank/timestamp Rockbiter/Stormstrike cooldown consumer;
  descriptor/expiry producers, source assignment and the proc graph stay open.
- **#306:** phase/member/identity/pending-byte first-answer mutation; caller
  meanings, request/roster production, routing, timeout/cancel and start
  admission remain outside that local scope.

Independent current references, required keys/coefficients and 402 internal
branches support those exact scopes. Other normalized owner/anchor candidates
remain navigation; unchanged geometry does not establish their semantics.
Current bounded applicability preserves prior recovery without certifying a
complete release claim, source assignment, execution or parity.

## Independent supplied-item assessments

Every complete behavioral item remains pending selected-target recovery beyond
the bounded observations above. A source observation or an existing historical repair does not certify that complete
claim. The following stable IDs come from the canonical parser; they remain
independent even when several point to the same work item.

| Item / exact supplied claim | Owner / assessment |
| --- | --- |
| <a id="r1391-00"></a>**R1391-00** [Fixes the old WoW menu opening behind the pause menu, where a click could hit its Exit Game and close the game. Menus and windows now stop your clicks and scrolling from reaching what's behind them. The Windows version no longer crashes after alt-tabbing when run on Linux through Proton or Wine.](../CHANGELOG.md#L2068)<br>`changelog:0.139.1:ae521101bfa04ca9` | #59, #310, #311 — Summary context; bounded InputGate filter recovered, typed producer/schedule/consumer connections and Wine repair remain pending. No extra defect is created. |
| <a id="r1391-01"></a>**R1391-01** [The Windows version run on Linux (Proton, Wine, Steam, Lutris and the like) no longer crashes after alt-tabbing.](../CHANGELOG.md#L2070)<br>`changelog:0.139.1:598782f272f82e80` | #311 — Pending current activation/platform contract; no reproduced crash or cause established. |
| <a id="r1391-02"></a>**R1391-02** [Escape no longer opens the old WoW game menu behind the pause menu, so clicking Options or the space between the buttons can't press Exit Game.](../CHANGELOG.md#L2071)<br>`changelog:0.139.1:2947d2c3823fd003` | #59, #310 — Existing Escape repair retained; current duplicate-menu and action ownership need exact proof. |
| <a id="r1391-03"></a>**R1391-03** [Clicks and the mouse wheel on any menu or window stay on it: nothing behind it gets clicked, and the camera no longer zooms while you scroll over the pause menu.](../CHANGELOG.md#L2072)<br>`changelog:0.139.1:9bc9e9a945e88a72` | #310 — Bounded raw InputGate filter recovered; typed modal/window pointer/wheel producers, schedule and downstream consumers remain pending. |
| <a id="r1391-04"></a>**R1391-04** [Moving the HUD or the damage meter no longer clicks what's behind them.](../CHANGELOG.md#L2073)<br>`changelog:0.139.1:86b87a2556a999d3` | #310, #7, #8 — Existing drag ownership retained; current press/held/release and downstream isolation need proof. |
| <a id="r1391-05"></a>**R1391-05** [Enter on the hero picker no longer reaches the character select behind it.](../CHANGELOG.md#L2074)<br>`changelog:0.139.1:6997016548d527f7` | #310 — Pending foreground picker versus underlying character-select event ownership. |
| <a id="r1391-06"></a>**R1391-06** [Binding a key in the options no longer also runs that key's old action.](../CHANGELOG.md#L2075)<br>`changelog:0.139.1:a1b5beada43212ee` | #17 — Existing capture suppression retained; current activation/accept/release correspondence remains pending. |
| <a id="r1391-07"></a>**R1391-07** [Gamepad: Back opens the character pane again.](../CHANGELOG.md#L2076)<br>`changelog:0.139.1:b9ac59f811d17e2f` | #22 — Existing Select-to-C path retained; actual Back enum/backend/capture/consumer correspondence remains pending. |
| <a id="r1391-08"></a>**R1391-08** [Chinese, Japanese and Korean input methods in the downloaded game: finished text reaches the chat box again, and Enter or Space choosing a character no longer also acts on the chat line or your key bindings.](../CHANGELOG.md#L2077)<br>`changelog:0.139.1:7b27e689fb0c93ef` | #293 — Existing Commit bridge retained; current chat commit and composition Enter/Space ownership require recovery. |
| <a id="r1391-09"></a>**R1391-09** [notes: live in 20 minutes](../CHANGELOG.md#L2079)<br>`changelog:0.139.1:8cea6aa41cbbac0a` | Connected release context only — Timing text is preserved; no absolute schedule, native obligation or new finding. |

## Validation limits

This review inspected actual source and retained reports, and partitioned all
ten supplied items with the existing canonical changelog parser. Its machine reviews retain the same bounded evidence and pending claims. It changed no
gameplay source and ran no compiler, game/client,
network/server or OS/IME experiment. The target-refresh workflow separately owns
native recovery, registration and accounting. Recovered behavior, source
connection, static validation, compilation, runtime and original/rebuilt parity
must remain distinct; the release text itself establishes none of them.
