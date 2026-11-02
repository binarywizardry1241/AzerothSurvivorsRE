# In-run custom binding capture — 0.109.0

Target: installed 0.109.0, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This is the source/recovery portion of #17 associated with the new in-run
binding claim, including the #21 keyboard command's ordinary rebinding route.
[verification-needed](../verification-needed.md) owns remaining overall status. The
[manifest](evidence/0.109.0/in-run-bindings/manifest.json) binds ten nonoverlapping
native instruction ranges and the focused Ghidra result to this target.

## Native ownership and transitions

The Options event owner **0x140027ba0–0x14002a0e6** drains its custom events when
Options is open. It obtains the binding declarations through **0x140722fc0**;
the custom binding page uses the full list, including the active interface's
commands. Its page-6 Defaults branch obtains the default bindings through
**0x140724f80**. Other page Defaults iterates the current 104 descriptors.
The complete event-loop assembly is canonical here; the
[current descriptors report](options-0.109.0.md) shares that extract.

Mouse/wheel conversion **0x140722b60** and layout-aware keyboard conversion
**0x140728300** both reach acceptance **0x14001eb10**. Acceptance takes the pending
capture, setting the Options field at +0x90 to its absent sentinel **before**
editing the binding list through **0x14001bec0**, then committing through
**0x14001b9a0**. That commit saves through **0x1407270d0** and, when the run-state
gate at +0xe8 is set, reaches **0x140725d50** to replace the live engine binding
state. Acceptance requires no close, restart or separate confirmation.

The mouse switch's actual jump table maps Middle to `BUTTON3`, Forward to
`BUTTON4`, Back to `BUTTON5`, and Other(5..19) to `BUTTON6`..`BUTTON20`. Left,
Right and out-of-range Other buttons have no capture token. A wheel direction
uses `MOUSEWHEELUP` or `MOUSEWHEELDOWN`. Both translators prepend modifiers in
ALT, CTRL, SHIFT order. The keyboard route uses the selected layout's character
mapping and fixed key-name conversion, rather than binding a physical US letter.

The custom slot interaction in **0x14002d902–0x14002d9eb** toggles capture off
when the same command/slot is selected again. Page changes and closing discard
capture. The Escape owner **0x1401900d0** cancels a pending capture before its
later Options-close branch. The Options scroll owner **0x14002c750** skips wheel
scrolling while capture is pending.

Old-action suppression is separate from acceptance. **0x14018e450** snapshots
`Options.open && pending_capture != absent` before forwarding keyboard input.
Its filter **0x1400a2190** identifies nonrepeat ordinary press events, excluding
the eight modifier codes and Escape's separate owner. It clears both native
message buffers and republishes the survivors. Releases continue downstream;
advancing only the Options reader's cursor cannot reproduce that ownership.

## Connected implementation

The existing pause Options action and active-VM binding snapshot already supply
the in-run editor. The repair publishes editor ownership in
`LocalClientSet::OverlayCapture`, before FrameXML and world binding dispatch,
and explicitly runs Options acceptance after `LocalClientSet::Input`. This order
retains ownership for the accepting frame even though acceptance clears capture.
Edits still flush through the existing live `SetBinding`/`SaveBindings` owner
before the ordinary UI save drain; Defaults retains the active account/character
set through the existing `LoadBindings(0)` route.

FrameXML's feed excludes owned ordinary presses and character delivery. It
retains modifier events, key releases and a capture-held list so the accepted
key's subsequent OS repeats cannot become a fresh UI key-down. The world
dispatcher records the physical down state before suppressing its command and
records an owner for the eventual key-up. Both feeds retain capture ownership
through event-ordered release before reconciling a missed physical release,
including a repeat and release arriving in the same frame. Existing latched releases and the
missed-release sweep remain active. An embedding-only release adapter delivers
existing FrameXML owners while preventing the engine's unclaimed PrintScreen
release from synthesizing a new key-down walk during capture. The native filter
permits releases; this adapter addresses the reconstructed engine's synthetic
press fallback, without claiming recovery of every native engine input route.
Mouse and wheel command starts are gated
too. The Options overlay participates in the existing pointer arbiter so its
slot click does not also start a world mouse binding.

Options now names keys through the same layout codec as dispatch, rejects the
native unsupported mouse buttons, uses the native Forward/Back token pair, and
disables page scrolling while waiting for a binding. The real mouse dispatcher
also handles the already-supported `BUTTON6`..`BUTTON20` tokens, connecting those
accepted inputs to their live consumer. Selecting the current capture slot
cancels it. Existing right-click unbind, immediate persistence and Escape
cancellation remain connected.

## Checks and limits

[native_bindings.py historical recipe](../SCRIPTS.md#historical-execution-sources) passes **91 bounded
unchanged-native branch cases**: four capture admission cases, 72 keyboard
removal cases, three atomic capture-take cases, ten mouse-routing cases and two
wheel-direction cases. The interpreter stops before external allocation,
binding, VM or filesystem calls. The check also verifies all ten original-byte
and assembly hashes and traces the live source ordering, release, repeat,
layout, mouse, wheel and active-VM write/save consumers. It does not execute
those Rust consumers.

Ghidra 12.1.4 recovered the event-loop prefix under Evidence
`ev_474a7b0e8ba633b85376c9fac527c202a9da5879f22e1d7bd474ea5a1e1390f7`.
Its raw import omits external switch tables, so its pseudocode does not establish
the indirect event branches; original assembly and branch interpretation supply
those bounded facts. Smaller follow-up raw imports reached analysis success but
REA rejected their bridge handshake identity, also on a changed serial retry.
Their pseudocode remains unavailable. Global native caller/reference ownership
and complete shared-engine revalidation remain open under #41.

The eight changed Rust modules pass syntax parsing with the installed project
rustfmt, without changing source. A production-dispatch regression was authored
for held release, captured keyboard/mouse/wheel presses and later key reuse; it
was **not compiled or run**. No build, `cargo check`, compiling test, application
launch, original/rebuilt interaction or visual/persistence comparison ran.
#17/#21 retain their outstanding comparison requirements.
