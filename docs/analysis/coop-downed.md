# Downed-party addon publication

Finding [#63](../CURRENT-STATE.md#gap-63), claim `changelog:0.139.2:c456a516752982b8`.
The installed `installed-game/AzerothSurvivors.exe` is 0.140.0, 151,521,280 bytes,
SHA-256 `27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The [Lua and world catalog report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/world-anchors-0.140.0.md) owns the client
space, getter and anchor boundary. `AZSDOWNED` and the existing `AZSREVIVE`
progress line have separate producers and lifetimes.

The party update at `0x145f32d60` collects a local row when the hero has
phase 4 or the departure byte is set. `0x14602bc00` visits the retained
`0xc08`-byte remote records in their world order and applies the same predicate.
The constructed `0x48`-byte row contains the owned name, state string, party
index, actual world unit GUID, accepted world position and fall epoch. The
local position is Game `+0x5c8`; the remote collector reads the corresponding
field of each saved hero. Departure selects `left`; other admitted rows use
`ended` when the shared phase is 4 and `down` otherwise. The new vector replaces
the previous Game `+0xe30` vector. A revived active hero drops out of this set.

The phase-4 transition `0x145f9fa72` stores the shared f32 run clock from
Game `+0x1010` and marks the timestamp present at `+0xf10`. The accepted
lethal-hit caller at `0x145f9bed5` and the departure caller at `0x145e73e97`
both use that transition. The collector reads the retained timestamp, using
zero when the presence lane is clear. The existing position lane supplies
the three coordinates. The serializer at `0x145f2bbf0` first checks the
cooperative-world byte, then its iterator excludes the receiving hero's party
index, using Game `+0xfc0`. It formats `u<guid>,name,x,y,z,ep,state` with a
one-decimal f32 format for the four numeric lanes. It sanitizes the name's
four addon delimiters and joins rows with `;`.

The common builder calls this serializer at `0x145e651aa` and places
`AZSDOWNED` after `AZSREVIVE` and before `AZSCHESTS`. The host frame at
`0x145eb1fd1` walks the 21-entry payload and compares it with the prior
payloads. A borrowed-hero snapshot calls the same builder at `0x145f1cc27`.
Rebuilt `Mechanics` retains the fall clock with the swapped hero, captures
the existing revive position and world GUID in `PartyHero`, and filters by
the active slot in both ordinary host publication and the synchronized
recipient's addon snapshot. The existing publishers handle changed-payload
suppression, empty clears and replay. The guest receives the host's addon
packet via the engine path and retains its independent legacy revive feed.

| Original range | Preferred VA | File offset | Bytes | SHA-256 |
| --- | --- | --- | ---: | --- |
| Common snapshot builder | `0x145e64dc0` | `0x5e641c0` | 2,473 | `85fc3c945262e189efd3ce10daae27d93ae6b6f3c567162a5a2eb0b6f02f2205` |
| Local record and vector replacement | `0x145f32d60` | `0x5f32160` | 595 | `5ca58d3328567007b8fba1c7687fcb518d05ba56f11506ca449703e4801e3aad` |
| Remote collector | `0x14602bc00` | `0x602b000` | 1,249 | `7c046ca14134838b1972ff7507842d92e5112b1136ae84a0fb0eb521fecde04e` |
| Phase and fall-epoch stores | `0x145f9fa72` | `0x5f9ee72` | 33 | `c1ad952b53e8dfdca171ef6acf8d6ee677522db230ccfeb407f05e5e871ace9f` |
| Serializer and recipient gate | `0x145f2bbf0` | `0x5f2aff0` | 264 | `e14468538021c1a778f494ae9faa29387fa046a5c841ccf36272b28573edd2f2` |
| Recipient iterator and format arguments | `0x14603cf50` | `0x603c350` | 434 | `95e6073e540a1c46446ad938c8ad4861376dbff5fb9d4e475866b62e05a94fda` |
| Complete compact row format | `0x147afd9d5` | `0x7afc9d5` | 46 | `678ed53b4ce6309d210a55ce3ce13e7d6dfdadca6e2f68ed7d47b1a6742a2f09` |
| Host changed payload loop | `0x145eb1fc3` | `0x5eb13c3` | 319 | `234380732c74351c9366bc5bf7ff42ed3f0dc1efef6fa2d9877241225809f236` |
| Borrowed-recipient snapshot call | `0x145f1cc1d` | `0x5f1c01d` | 122 | `18ba644d0474fa30e256f1b762fdbbb8d0312b4b52ac6cc05892b2312028a807` |

The Ghidra `analyze_function` receipt for the common builder is
`ev_314b4c1c939409fd9b0cc9243ad11dbbee0587dd6094817d6dd2641240687ab8`,
using the exact raw range at its preferred VA. Capstone instruction and
operand checks supply the external calls and data that the slice omits.
128 bounded original-instruction cases exercised the remote collector and
serializer across solo/co-op, local-row presence, receiving slot, chooser,
active, down, left and shared defeat. Fixture seams supplied allocation,
storage copies, name sanitization, compact formatting and the final join.
The native instructions selected and passed the original row inputs, including
the four f32 lanes and GUID. Changed Rust files syntax-parse. The authored Rust
regression covers recipient exclusion, revival and departure. Compilation,
the regression's execution, live co-op delivery, UI and parity remain open.
