# Protocol 13 state, engine and control delivery

This [#63 recovery](../CURRENT-STATE.md#gap-63) uses the installed 0.141.0
`installed-game/AzerothSurvivors.exe`, 151,493,632 bytes, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [PE manifest](evidence/0.141.0/coop-replication.json) binds the reviewed
producer, wire, receiver and replay ranges to their original file offsets.

## Recipient State15

The host poll stores its per-peer periodic clock at row `+0x368`.
The initial row is staged at `rbp+0x320`. The zero vector written at
`0x145ea5873` spans row `+0x360/+0x368` before the insertion copy at
`0x145ea564f`. The run reset paths also zero both clocks at `0x145ebfd91`
and `0x145ec006a`. A missing source timestamp therefore means zero.
The two paths at `0x145ea91b7` and `0x145ea91f0` compare the elapsed time
against 1.0 second and write the new clock at `0x145ea9204` only when the
periodic update is due. If the period is still pending, the branch at
`0x145ea9225` tests `phase & 6 == 4` using the phase at
`Core+0x10f9+[Core+0x10f3]`. Game starts at `Core+0x10`. The mode selects
the personal phase at `Game+0x10e9` in solo mode and the shared phase at
`Game+0x10ea` in co-op mode. The builder makes the same choice at
`0x146052639..0x146052670` for the effective-terminal State15 byte, while
copying the personal phase separately. The rebuilt publisher uses that
effective-terminal byte for its independent fast path. One downed hero
in a party still playing uses the regular cadence. A terminal send inside
the period leaves the next scheduled update due at its previous deadline.
[Host publication](../../crates/azeroth-survivors-re/src/gameplay/coop_publish.rs).

The send path calls the per-recipient owner `0x145ef4ef0` at `0x145ea9282`.
It temporarily removes and seats the selected remote hero, calls the snapshot
builder `0x146051cb0` through the locale wrapper at `0x145e6e090`, restores
the hero and writes tag 15 through `0x14604fa80`. The serializer at
`0x14604fdb1` and the reader at `0x14604a857` preserve the scalar prefix and
zone key. The writer continues with the two-word pairs, boss history,
damaged-by list, personal history, Enhancement byte, boss flags, and optional
party context. Its member records cap at five, including each lethal-event
member list. These packet fields retain their earlier
[0.140.0 party context evidence](scholomance-0.140.0.md#the-insane-party-gate).
The rebuilt host uses its existing seated snapshot builder and State15 codec
for both pre-Sync and synchronized recipients.

The scalar producer reads the seated hero's run clock at `Game+0x1028`,
level at `+0x5f0` and the independent won latch at `+0xf20`. The five
counters come from `+0xaa0`, `+0xab0`, `+0xaa8`, `+0xaac` and `+0xab4`
in wire order. The shared post-clear boss count comes from `+0x1090`, while
mark sum and maximum remain the two recipient floats at `+0xa94`.
The writer reduces the nineteen gear-star bytes to their maximum and checks
all nineteen equipment words for the bare flag. Phase 3 is set by the pause
owner `0x145f80be0` only when the game is in personal phase 1 and its co-op
mode is zero. The source [seated snapshot](../../crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs)
and its shared and swapped fields supply those inputs.

The guest arm `0x145ecce08` requires the admitted ZoneKey before calling
`0x145e370b0`. The validator checks canonical zone, class and a finite clock,
then bounds the clock against zone elapsed time plus 30 seconds and applies the
existing scalar and history caps. The guest publishes the accepted cache at
`0x145ece3b3`, evaluates live feats and checks the changed terminal phase
before summary and account settlement. The reconstructed path uses the
[validator](../../crates/azeroth-survivors-re/src/coop/client_state.rs),
[guest cache](../../crates/azeroth-survivors-re/src/gameplay/coop.rs) and
[retained settlement contract](party-achievement-settlement-0.141.0.md).

The retained Ghidra host-poll result `ev_cbe5efcb091d21f4c11c7ed440e451da0835171d22db68755b73b9799dd1d16b`
has result SHA-256 `292c367bedfccadda7f0b9fc09fa92d53d289fdf291a712e4ad5898ba5a6da4a`
and raw slice SHA-256 `6d3fe23bd5b101096f0343322ea410be01dca9f7e9054551af1742a4192583f5`.
The installed PE range `0x145ea3420..0x145ead071` matches that raw slice.
The shared [writer receipt](coop-inspection-0.141.0.md#exact-static-evidence)
was used for the protocol 13 tag selectors.

## Engine7 and Control8

Engine7 writes a little-endian u16 opcode and length-prefixed body. Its reader
at `0x14604b934` reads the same fields. Host arm `0x145ecb607` checks the
per-peer Sync latch before passing the original opcode and body to ingress.
The guest arm `0x145ecd470` requires Sync and calls `0x145e36f80` for opcode
and length admission. Its trust transformer at `0x145e38950` selects name
`0x51` and chat `0x96`; other bodies pass through. The guest resolves the
active engine port at `0x145ece31a`. These correspond to the existing
[guest adapter](../../crates/azeroth-survivors-re/src/gameplay/coop.rs),
[trust rules](coop-trust-0.120.0.md) and
[host ingress](coop-command-ingress-0.141.0.md). Bounded replay checked the
full u16 opcode domain at body lengths `0`, `0xfffd`, `0xfffe` and `u64::MAX`.
All 262,144 cases matched the existing 75-opcode source set and `0xfffd`
ceiling over 6,031,372 original instructions.

Control8 subtypes 0 and 3 carry the extra little-endian offer word. Subtypes 0
and 2 retain the argument byte. The writer masks the three option arguments
in subtypes 7–9 to one bit. Their reader table entries all route to
`0x14604dc6a`, which returns true for every nonzero byte. The decoder now
keeps that distinction so a received option byte such as `2` enables the
option before the host applies it to the seated hero. The host's wire arm
`0x145ecb660` calls `0x145ec9a40`, which checks the host role, indexed assigned
hero and live Game before dispatching the action through `0x145ef8950`.
[Wire codec](../../crates/azeroth-survivors-re/src/coop/replication.rs),
[command drain](../../crates/azeroth-survivors-re/src/gameplay/coop_commands.rs).

```sh
PYTHONPATH=runtime/armory-recovery/python-libs \
  python3 -B scripts/check-coop-replication.py --protocol-13
```

The maintained check passed 7,168 State15 cadence cases and 5,877 Control8
cases over 334,174 original instruction steps. Cadence replay stops before
snapshot construction or delivery. The control writer substitutes only the
byte and dword append primitives. Its reader executes the original input
primitives through subtype dispatch and verifies the exact consumed length.
The checker also checks the live source routes. Rustfmt parsed both changed
Rust files. The extended Rust fixture remains uncompiled and unrun.

The wider State15 history-producer audit, ordinary Engine opcode semantics
outside the selected ingress and trust contracts, compilation, live socket
delivery, and original/rebuilt comparison remain separate work.
