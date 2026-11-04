# Guest receive dispatch in 0.140.0

Finding [#63](../CURRENT-STATE.md#gap-63). The installed
`installed-game/AzerothSurvivors.exe` is 0.140.0, 151,521,280 bytes,
SHA-256 `27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The [0.139.2 Hero refresh report](coop-hero-refresh-0.139.2.md) retains the
earlier host proof and the predecessor guest selector.

The guest dispatcher `0x145ed2450` selects variant 3 for a nonnegative
first qword. A negative first qword XORs its sign bit to obtain the
variant. The 25-cell table at `0x147af3318` indexes variants 1 through 25.
The wire numbers below come from the first tag write in the matching
variant of the serializer table at `0x147afe414`.

| Variant | Wire tag | Guest arm | Owner |
| ---: | ---: | --- | --- |
| 1 | 2 | `0x145ed24cc` | Accepted, including capacity range 1–5 |
| 2 | 3 | `0x145ed2d30` | Denied and role transition |
| 3 | 4 | `0x145ed4085` | Cleanup only, Hero is sent toward the host |
| 4 | 5 | `0x145ed2866` | Canonical ZoneKey and guest zone state |
| 5 | 6 | `0x145ed4085` | Cleanup only, Sync is sent toward the host |
| 6 | 7 | `0x145ed32a0` | Synchronized engine opcode/body and text trust owner |
| 7 | 8 | `0x145ed4085` | Cleanup only, Control is sent toward the host |
| 8 | 9 | `0x145ed337a` | EventBytes and initial type admission |
| 9 | 10 | `0x145ed2b1c` | HUD string, at most 65,536 bytes |
| 10 | 11 | `0x145ed2dac` | Resource vector |
| 11 | 12 | `0x145ed2e60` | Timer vector |
| 12 | 13 | `0x145ed3512` | Equipment grants, requiring a ZoneKey |
| 13 | 20 | `0x145ed3407` | Marks and failed rolls, requiring a ZoneKey |
| 14 | 14 | `0x145ed26b0` | Seen key/rank rows, requiring a ZoneKey |
| 15 | 15 | `0x145ed2c38` | State record, requiring a ZoneKey |
| 16 | 16 | `0x145ed2770` | Explicit host Disconnect |
| 17 | 17 | `0x145ed25f0` | Roster |
| 18 | 18 | `0x145ed300d` | Run End, gated on accepted zone and cached state |
| 19 | 19 | `0x145ed3118` | Compressed decoded-message batch |
| 20 | 21 | `0x145ed3728` | Host clock sample |
| 21 | 22 | `0x145ed366b` | Lobby chat |
| 22 | 23 | `0x145ed2514` | Ping, sends Pong |
| 23 | 24 | `0x145ed4085` | Cleanup only, Pong is sent toward the host |
| 24 | 25 | `0x145ed2799` | Item text carrier and ordinary Engine delivery |
| 25 | 26 | `0x145ed3768` | Ready Check, requiring accepted, absent ZoneKey and unsent Sync |

The generic exit at `0x145ed4085` preserves the already-consumed or
already-cleaned cases encoded in bitmap `0x032afc54`. Cases 8 and 9
release their string when the reject path reaches this exit with a
nonzero capacity. Remaining cases use the message drop at `0x145ed3f74`.
This is native payload ownership. The reconstructed Rust variants use owned
values and naturally release discarded messages without a separate cleanup
operation.

## Source repairs

Explicit host Disconnect calls `0x145ece430` with `the host closed the party`.
The guest owner processes its retained summary, moves the old role out,
closes the handle and publishes `ended` with that reason. The reconstructed
receive pump now stops at wire 16, retains the accepted messages before it,
closes the actual handle, and uses the existing lost-transport world
settlement and presentation path with the explicit reason. Ordinary socket
loss keeps its own reason. Guest Accepted now publishes the native capacity
range, including one for wire capacity zero. Equipment and Seen grants use
the actual guest ZoneKey gate.

Ready Check first requires the Accepted latch at the transport boundary.
The ordered gameplay receiver then checks for an absent ZoneKey and unsent
Sync. A Ready Check following ZoneKey in the same decoded batch cannot use
the earlier lobby state while world bootstrap is pending. Before the UI
callback, native variant 25 retains the first five answers, clamps each
answer byte to two and caps the displayed clock at 30 seconds. The rebuilt
guest applies those same bounds. The host continues to publish its own
authoritative check snapshots through the existing queue.

EventBytes admission at `0x145e37710` requires the exact `{"type":"` prefix,
an admitted case-sensitive type and at most 65,536 decoded string bytes.
The type ends at the next quote or at the end of the text. The admitted
types are `hz`, `hzt`, `atk`, `atku`, `atkl`, `atka`, `atkx`, `start`,
`hzend`, `resume`, `banner`, `paused`, `defeat`, `downed`, `choices`,
`victory`, `endless`, `revived` and `unpaused`. The gate does not parse the
body as a whole JSON document. The Rust receive path checks this before
either local event publication or the gameplay consumer. Forwarding rules
for a host's own events remain independently owned by `forward_to_peers`.

| Original range | Preferred VA | File offset | Bytes | SHA-256 |
| --- | --- | --- | ---: | --- |
| Guest dispatcher | `0x145ed2450` | `0x5ed1850` | 8,256 | `d8c576b6e93b215b13ea9ceaf369697108d6846e636bcfe4a3abecd14da6cbb0` |
| Guest case table | `0x147af3318` | `0x7af2318` | 100 | `a4974af751f6bf731d8f8a2ca960c80cc05b14ffc51a5a9ddeeb313c9dbbd6f6` |
| Serializer case table | `0x147afe414` | `0x7afd414` | 108 | `9c2890f9c78639a219894076c908c99e0b83a2f673879adf73ad5a7e08e1c641` |
| EventBytes gate | `0x145e37710` | `0x5e36b10` | 734 | `4d0c641d657b01d0577cc5cb9d672f8c40c412a2277c02c96fb31c64dd4302aa` |
| Explicit close owner | `0x145ece430` | `0x5ecd830` | 259 | `16d187107385b8139344751413955b728cd09463b3e15767e533ed2af9ee7e6e` |
| Generic cleanup selector | `0x145ed4085` | `0x5ed3485` | 89 | `73e6740d8b5de1418cff5b41787d3ed37071a54973320ee278906796897e0da3` |

Ghidra `analyze_function` receipt
`ev_5beee1d14f5149725eb5e09586cfede7d68e24e4de5927307f46c2b09e006b80`
uses the exact dispatcher slice. Capstone and the matching PE table operands
bind its external case vectors and consumers. 179 original-instruction
EventBytes gate cases, 54 cleanup cases, 40 Accepted cases, 800 Ready Check
admission and normalization cases, and the wire-16 close invocation passed.
The replay substitutes byte comparison, allocator release and drop boundaries.
Changed Rust files syntax-parse. The authored guest-order regression remains
uncompiled and unrun. This records guest arm identity and the selected
connected repairs. Wider current protocol-12 payload schemas, relay and
terminal service behavior, compilation, actual socket/UI execution and parity
remain open.
