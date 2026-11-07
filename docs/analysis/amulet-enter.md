# Amulet confirmation input

Finding [#18](../verification-needed.md#gap-18), release claim
`changelog:0.140.0:ac3ebee1359ef8ca`. The installed
`installed-game/AzerothSurvivors.exe` is version 0.141.0, 151,493,632 bytes,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This is bounded evidence against the installed target. The registered audit and
the [0.127.0 modal contract](amulet-confirmation.md) retain their own
target identities.

## Input ownership

The card registration owner at `0x1401b28c0` constructs separate systems using
descriptors `0x14659b130` and `0x14659b280`. Their wrappers call the
capture producer at `0x1401c0110` and the confirmation handler at
`0x1401c0600`. The handler still checks pending tag 1 and reads both
physical Enter aliases from the just-pressed set at offset `+0x20`. Typing
leaves pointer actions available. The existing Escape precedence and ordinary
selection command remain in that handler.

The producer reads the pending byte at `+0x10`, the preceding typing byte at
`+1` and two local ownership bytes. With a pending confirmation and no
typing, it appends Enter (`0x3a`) and Numpad Enter (`0x66`) to the physical
deny vector. Outside that condition it appends each previously owned alias
independently. After publication, it sets that alias's ownership byte from
the held-key set at offset zero of the same keyboard input resource, with
its count at `+0x18`. This keeps the release frame owned and clears ownership
for the next frame. A held Enter does not extend ownership of Numpad Enter,
or vice versa.

The current ordered filter at `0x140f1bee0` calls the 12-byte physical-key
membership predicate at `0x1409096a0` on both edges. The separate logical
deny vector and general keyboard press gate follow the
[shared InputGate contract](input-gate-native.md). The producer's
typed key state remains available to the modal.

## Source connection

The [modal producer](../../crates/azeroth-survivors-re/src/gameplay/native_overlays/confirmation.rs)
publishes the per-alias denies in `OverlayCapture`, before `UiInput`.
The [shared collector](../../crates/benilla-app/src/ui_script/records.rs)
withholds matching ordered keyboard records before FrameXML and world
bindings dispatch. The typing snapshot prevents this gate from taking a
new key away from an already focused edit box. The confirmation transaction
still runs in its existing local/guest handler using typed input. The
producer reads the pending state at its own scheduled entry, preserving the
separate ordinary card and modal decision systems.

## Static checks

| Original preferred VA range | PE file offset | Bytes | SHA-256 |
| --- | ---: | ---: | --- |
| `0x1401c0110..0x1401c02eb` | `0x1bf510` | 475 | `5e23900da606e07c6ed2d6d655df2f05d79ce8eac7f0c6610e445ac69c371a16` |
| `0x1401c0600..0x1401c0b14` | `0x1bfa00` | 1,300 | `1e0815834879e458f951254f549e09a61bf7adbdbae3256947582ffffc807cd9` |
| `0x140f1bee0..0x140f1c133` | `0xf1b2e0` | 595 | `8e4d8ba997e77112473f68fe3dd095decb95f9e2ddc5110eccfbe99c88177297` |

The journaled Ghidra raw-slice results for the first two ranges have
Evidence IDs `ev_8fc9543f200ba81cf743f3da12b49049db260fca7007eebecbaf7e09ba7b873d`
and `ev_03dbe531282b666643f488d39438e0969956ed6b25eaaae19572dd3514142d5a`.
Independent PE instruction decoding supplies the wrapper, external call and
Win64 argument details.

The original producer passed 64 isolated cases varying pending, typing, both
local ownership bits and both physical held bits. The lookup seam returned
membership from the selected held bits. The original filter and its physical
membership predicate passed 32 cases across press, release, repeat,
independent alias selection and stable record compaction. These fixtures
used an empty logical deny vector and omitted event destruction. Rustfmt
syntax-parsed the five changed Rust files. The collector regression was
authored and remains uncompiled and unrun. Actual chat focus, movement
following either key, local and guest confirmation, and original/rebuilt
parity remain open.
