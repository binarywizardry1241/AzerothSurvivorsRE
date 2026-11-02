# Character/account binding selection — 0.105.0

Target: supplied 0.105.0, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the binding-set selection portion of gap #17. The broader
[Options owner](options-0.105.0.md) retains the remaining source and comparison
limits; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall status.

## Two separate binding surfaces

The current native custom binding-page constructor is
**0x1400ef540–0x1400eff31** (end exclusive). Its complete Ghidra body tests the
binding-row count at +0x40, displays `options.no_bindings` when empty, or iterates
the 48-byte section/binding rows. It calls section constructor **0x140208490**
and binding-row constructor **0x140206f60**. It creates no character-specific
selector or confirmation popup. The full procedure hash and Ghidra evidence ID
are retained in the [manifest](evidence/0.105.0/options/binding-sets.json).
A custom selector and its cross-layer popup transport are therefore absent from
the reconstruction. The existing custom binding editor still follows the live
binding command/key/reset/save paths described in the Options owner.

The embedded `KeyBindingsPage.xml` and `OptionsFrame.xml` instead define a
character-specific checkbox in the full FrameXML interface. Its 26px row,
30×29 checkbox, anchors, tooltip and actual MPQ textures are already present in
`crates/benilla-app/assets/ui/OptionsFrame.xml`. The exact selected-target
CharacterRow and Lua transition extract are retained in the same manifest.
They specify the native interface; they do not authorize adding the control to
the separate custom page.

Checking this FrameXML box runs `LoadBindings(2)` **before** `SaveBindings(2)`:
an existing character set is restored, and a missing character set falls back
to account bindings before it is saved. Unchecking restores the checked state
and opens `BENILLA_CONFIRM_DELETING_CHARACTER_SPECIFIC_BINDINGS`; it does not
change the active binding set yet. The popup's acceptance loads set 1 before
saving set 1. Cancel preserves the character set. The earlier
[lifecycle manifest](evidence/0.105.0/options/lifecycle-manifest.json) remains the
canonical extract for ordinary commit and Defaults. The engine's existing
binding store, event generation and account/character save writer own these
operations.

## Static checks and presentation boundary

`scripts/recover-binding-sets.py --check` verifies the selected EXE,
procedure/extract hashes, the existing FrameXML toggle/checkbox source, and the
absence of the unsupported custom selector/transport. It interprets **five
native Lua transition cases** with explicit binding-host seams: existing
character keys, account fallback, default fallback, confirmation cancellation
and acceptance. The real Rust load/save writer is source-traced, not executed
by this Lua fixture. The lifecycle check also passes its 28 native branch cases
and 14 interpreted Lua cases. Project rustfmt parsed the three corrected Rust
modules without compilation or source mutation; `git diff --check` passed.

The source renderer paints FrameXML quads in PlayerUiCamera's main pass before
Bevy's separate UI pass; the custom Options uses that camera and its own
GlobalZIndex 100/101. GlobalZIndex cannot promote a FrameXML popup above the
custom page. No selected-target cross-layer popup bridge was found in the
custom binding constructor, so this reconstruction adds none. The native
FrameXML confirmation remains part of the full interface, whose complete
presentation, interaction and engine correspondence remain unverified under
#17/#41. Existing source-only popup flags also differ from the selected embedded
XML; those shared-engine differences require their own native/default audit.
No compilation, application launch or persistence/interaction comparison was
performed. Gap #17 remains open.
