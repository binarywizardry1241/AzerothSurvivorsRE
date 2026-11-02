# Armory secondary clicks — 0.100.1

Recovered and connected on 2026-10-19 against supplied EXE SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
The 0.98 release note was a discovery lead; the rules below come from the current
selected PE, independently of that note and the historical 0.92 UI report.

## Current input and mutation owners

Owner `0x140255270..0x140255abb` consumes the mouse message stream before checking
the Armory-open resource byte `+0x72`. The message predicate at `0x1402553b7`
accepts right-button **presses**, not releases; a frame with multiple such messages
still traverses the UI once. It obtains either Shift key through helper
`0x1400320d0`, using current `KeyCode` discriminants `0x3d/0x3e` (ShiftLeft and
ShiftRight in the matching Bevy 0.18.1 enum).

The query considers every matching `Act` whose Interaction byte equals `1`
(`Hovered`). It does not require a changed Interaction and does not change the
selected detail item or equipment-list selection. The existing ordinary action
owner `0x140257150` remains the separate selection/button path.

| Hovered action | Right-click | Shift + right-click |
| --- | --- | --- |
| Piece (`Act` tag 6) | Toggle that piece in its native equipment slot | Toggle an explicit look for that piece; the same look becomes absent |
| Equipment slot (`Act` tag 7) | Clear its equipment slot | Clear its explicit look, including a zero/hidden override |

A piece first passes current descriptor getter `0x14546f110` and ownership lookup
`0x14542f520`. Unowned or unrecognized pieces do nothing. Changing equipment does
not change looks, and changing looks does not change equipment. Clearing an empty
slot does not mark a change; clearing an explicit hidden look does. The mutations
retain native 19-slot paperdoll indices, including Shoulder 2, Main Hand 15, Off
Hand 16 and Ranged 17.

After processing the query, any change writes the class/race equipment view through
`0x14542e950` and queues the existing account command through `0x140044cc0`.
It does not make a full-Pick commit. `armory.rs` uses its existing account-save
queue accordingly, preserving unrelated progression and item ownership.

## Current cell ownership and hint

The source previously drew a clickable piece button and a full-size icon as sibling
nodes. The latter can capture Bevy focus before the button. Current native owner
`0x140247090` instead constructs one entity holding the action, Interaction and
ImageNode. This is bound through the complete call chain:

`0x140247090 → 0x1400e32f0 → 0x140172f90 → 0x1400527e0 → 0x1402f9940 → 0x140342b20`.

The final bundle metadata references the exact 335-byte type-name literal at
`0x145960bb7`: ChildOf, Act, Interaction, picker Hover, Node, BorderColor,
BackgroundColor, ImageNode, BoxShadow and UiTransform. The native action data and
image therefore belong to one entity. Source piece cells now have that ownership
structure, with existing badges as children. This focused change does not claim
that their remaining colors, borders, badge placement or icon treatment have
complete current-target parity.

Current footer owner `0x140249840` appends localized `armory.click_hint`
(`0x14594f969`, length 17) after the collection summary. Its text uses font size
11 and sRGBA color `(0.725, 0.663, 0.510, 1)` from `0x14594f944`. That existing
current locale key is now shown in the source footer.

## Evidence, validation and limits

[The manifest](evidence/0.100.1/armory-input/manifest.json) retains ten bounded
current owners, exact PE byte hashes, REA/Ghidra evidence for the secondary-click
owner, typed bundle identity and the footer literals. Raw GCC decompiler signatures
are not treated as Windows x64 call definitions; original assembly binds the
arguments and state fields.

`python3 scripts/recover-armory-input.py --fixtures` completed successfully,
executing **180 native mutation cases and 12 mouse-message predicate cases** in
bounded original instructions. Native descriptor/ownership and input memory are
explicit fragment seams; no imported function was simulated. The retained vectors
cover five distinct native slots, absent/hidden/same/different looks, matching and
different equipment, both Shift states, empty-slot changes and mouse releases.

Three Rust tests compare the source with these vectors and check ownership and
unrelated-save preservation. All three passed in the combined r13b check (44 library and142 application
tests passed). Local rustfmt and diff whitespace checks completed. No original or reconstructed GUI was launched or
compared for this change; the Mac was locked. The shortcuts are implemented from
current native evidence, with interactive/runtime parity still unverified.

This does not promote the entire historical Armory report to 0.100.1. Complete
current tooltip/stat prose, PvP piece presentation, remaining body styling,
drop-table behavior and all-window-size visual parity remain separate work.
