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
The poll checks the host role, indexed peer and live Game at
`0x145ea9163..0x145ea924c`. It constructs the snapshot only after cadence
admission and reaches the peer's outgoing queue at `0x145ea9354`. The
rebuilt host now makes that decision before building the synchronized
recipient's snapshot. It can still use the seated snapshot and State15 codec
when character-creation display data is unavailable or a streaming focus
change clears `ZoneWorld::ready`. The presentation branch retains its own
world-ready and display gates.

The builder and writer join the following histories in source order.

| History | Game pointer/count | Snapshot copy begins | Wire row |
| --- | --- | --- | --- |
| Boss and spell pairs | `+0x960/+0x968` | `0x146051f95` | Two u32 words |
| Main lethal history | `+0x978/+0x980` | `0x146052045` | Two u32 words and three bytes |
| Damaged-by bosses | `+0x9c0/+0x9c8` | `0x1460520e8` | One u32 word |
| Personal lethal history | `+0x990/+0x998` | `0x1460521ae` | Two u32 words and three bytes |
| Boss result flags | `+0x9a8/+0x9b0` | `0x14605230f` | Boss u32 and one flag byte |

The recipient swap at `0x145f38112..0x145f381dd` exchanges the vectors
covering all five pointer/count pairs. The class-7 Enhancement branch at
`0x1460522b3..0x14605230f` requires a positive tree-1 tally that strictly
exceeds trees 0 and 2. The source's ordinary kill, shared kill-credit, damage,
Enhancement and flag owners feed the same fields. The guest validator at
`0x145e3727e..0x145e372c9` builds the five zone boss IDs. Its filter and
cap sequence at `0x145e375f0..0x145e37693` keeps retained rows in wire order
and caps the damaged-by list at five. The other four history lists use the
clock-derived limit. Both host and guest consume the shared feat context
separately from these histories.

The [party context helper](evidence/0.141.0/party-achievement-settlement.json)
at `0x145f0f6c0` returns an absent value for zero at `Game+0x10e3`.
Its present branch clones the cached member and event vectors and copies the
shared death count, starting roster size, first-fall option and raw rank.
The 0.141.0 helper uses the co-op mode byte even when the retained remote
count is zero. The source now uses the same gate for seated host snapshots
and local feat evaluation. Guests still consume the accepted optional value.

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
The snapshot-builder Ghidra result
`ev_290ab1230287a8b450c02cd6b2c5ff9395f74e4a34bf8664b0c7a617a956de8d`
has result SHA-256 `b20b5df6f2172d2cf391a5c2fe95b0092d4c7f76f62b13784d8bc3907e611eea`
and matches the manifest's `state_game_snapshot` PE slice.

## HUD10 guest admission

The guest table cell at `0x147aedd1c` selects `0x145ecccec` for HUD10.
The reader produces a lossy UTF-8 string through `0x146206820`. The guest
then compares the decoded byte length against `0x10000` and rejects larger
strings before the presentation call at `0x145eccd34` and the choice
retry-clock call at `0x145eccd69`. The decoded limit is inclusive. The
host recipient submission at `0x145ea9561` and tag-10 serializer at
`0x14604fc94` pass the produced length directly. The byte limit belongs
to guest admission.

The rebuilt guest checks the length before JSON parsing or updating the
missing-card request timer. The native replay passed sixteen guest and host
cases spanning the boundary and larger synthetic lengths. It stops before
presentation or serialization. Rust syntax parsing and source guards
passed. Live delivery and original/rebuilt comparison remain open.
[Guest receiver](../../crates/azeroth-survivors-re/src/gameplay/coop.rs).

## Guest login and synchronized recipients

The host poll calls the shared State15 and HUD10 recipient iterator at
`0x145ea8ca3`. The iterator at `0x14602aad0` emits the peer index and
assigned actor only when the row has an assignment and `+0x89d` equals 1.
The host's initial Engine7 queue loop completes before it sets that byte at
`0x145ec803e` and refreshes party metadata at `0x145ec8050`.

The guest's PlayerLogin opcode `0x3d` reaches `0x145eb5e9f` through
`0x147aeda78`. Roles 0 and 1 require a nonzero accepted Zone5 pointer
at `+0x1578`. The producer sets the Sync request bit at `0x145eb5ec6`,
flushes earlier Engine7 traffic at `0x145eb5ee2`, and serializes Sync6
before calling the upstream send port at `0x145eb5f30`. It reads no
State15 data on this path.

The rebuilt guest opens the embedded local client from its admitted Hero
after Zone5. The active local-client edge queues Sync6 before the ranked
replica needs State15. The engine bridge samples the initial packet fields
on receipt. The leading login verification packet runs its world reset
before the body registers. The self-create packet supplies the actual
mover speed for the stock body request, and the bridge dispatches the
remaining Engine7 bytes in their original order after registration.
The first validated State15 supplies the replica rank for initial XP,
chest costs and rerolls. The rebuilt host gates State15 on actual
synchronization while keeping it independent of local streaming.
This supersedes the pre-Sync State15 source workaround described in the
[historical Heroic wire report](coop-heroic-wire-0.121.0.md).

The current initial-world builder calls the login verification encoder at
`0x145e62072`, which writes opcode `0x236` at `0x145fe475d`. It copies the
record to entry zero at `0x145e6211f..0x145e62132`. It later calls the player
create builder with its self argument at `0x145e62204..0x145e6220c`. The
builder reads the seated mover multiplier at `0x145f71e2a`, scales it by
7 and supplies the resulting movement descriptor to `0x145ec63f0`.

End18 at `0x145ecd1dd` settles only with both Zone5 and State15, but its
logout call at `0x145ecd258` depends on the Sync request bit. It then
clears the guest's zone and state caches. The Hero4 refresh helper at
`0x145eca010` requires an accepted guest with no active Zone5. The rebuilt
guest likewise retires an in-progress login when End arrives before the
first State15.

The checker passed 216 recipient-list cases, 16 PlayerLogin cases, three
last-queue-entry cases, 16 End18 cases and 12 Hero4 refresh cases. It
replays bounded original instructions with declared call seams.
The local stock login bridge,
world and body startup, initial engine packet delivery, and rapid
restart remain to be verified in execution.

### Localized guest entry notices

The host's Sync callback at `0x145ec7dfe` calls `0x145ef7560` with
the assigned actor index before appending the raid targets to the immediate
snapshot. The positive actor branch seats that hero at `0x145ef7c69` and
passes the seated language bytes at Game `+0x400/+0x408` to
`0x145e72810`. That builder queues the action buttons first, sets a scoped
locale for its text, and formats the join sentence from the admitted hero
name and the localized race, class and zone names. The following lines
come from the race descriptor's 16-byte string rows at `+0x40/+0x48`.
The 22 shipped lines use `race.<key>.line<N>` and the format
`|cffffd100- <line>|r`. Orc and Tauren carry two lines each. The other
six races carry three.

The writer at `0x145fe1290` emits opcode `0x96` with system type
`0x0a`, universal language and a zero sender. The seated helper drains
the entries with the actor index at `0x145ef7ca4`. The host poll applies
the owner-only rule at `0x145eaab4f` before the delivery call. The
snapshot's Engine7 append and synchronization latch precede party metadata
refresh and the later seated-queue drain.

The [rebuilt synchronization](../../crates/azeroth-survivors-re/src/gameplay/coop.rs)
now sends the admitted guest the action buttons followed by the join and
racial lines after the initial snapshot and party frames. It uses the
guest's language through the existing locale catalogs and the shared
system-chat encoder. The existing synchronization gate suppresses the
publication on repeated or refused requests.

The [proof](evidence/0.141.0/coop-entry-notices.json) binds the bounded
Ghidra query to the 2,896-byte installed PE slice and checks 10 ranges,
15 instruction anchors, all 22 native race lines and 257 recipient
classifier cases. Rust syntax parsing passed. Packet delivery and the
FrameXML chat display remain in [#203 verification](../verification-needed.md#gap-203).

## HUD10 host cadence

The host loads the f64 0.2-second period at `0x145ea8cd5`. It compares
elapsed time against that period at `0x145ea9199..0x145ea91b7` and
updates the recipient row's clock at `+0x360` only when due. This is the
other half of the zeroed clock pair described under State15. The comparison
at `0x145ea93a9` uses the same elapsed time to enter the seated HUD
builder at `0x145ea9498`. The output goes through serialization at
`0x145ea95d4` and into the peer's outgoing list at `0x145ea961e`.
The producer does not compare the JSON with its previous output.

The rebuilt [host overlay publisher](../../crates/azeroth-survivors-re/src/gameplay/coop_overlay.rs)
tracks the HUD clock per synchronized recipient and submits each due
snapshot, including identical JSON. This gives a guest waiting for a
missing choice offer fresh HUD messages even when the displayed data
is steady. The checker passed 56 replay cases across two peer rows,
including the exact 0.2-second boundary and nonfinite elapsed times.
It verifies clock writes and the branch into the builder. Live HUD
delivery and choice retry remain unverified.

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

The maintained check passed 7,168 State15 cadence cases, 12 party-context
cases and 5,877 Control8 cases over 334,945 original instruction steps.
Cadence replay stops before snapshot construction or delivery. The context
replay supplies empty member and event vectors and replaces the event clone.
It tests mode and remote-count combinations and the shared scalar fields.
The control writer substitutes only the
byte and dword append primitives. Its reader executes the original input
primitives through subtype dispatch and verifies the exact consumed length.
The checker also checks the live source routes. Rustfmt parsed both changed
Rust files. The extended Rust fixture remains uncompiled and unrun.

Compilation, live State15 delivery, save settlement and original/rebuilt
comparison remain open.
