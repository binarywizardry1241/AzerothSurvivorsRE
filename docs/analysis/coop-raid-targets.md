# Cooperative raid-target requests

Findings [#63](../CURRENT-STATE.md#gap-63) and
[#71](../verification-needed.md#gap-71). The installed EXE is
`installed-game/AzerothSurvivors.exe` 0.139.2 with SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [manifest](evidence/0.139.2/coop-raid-targets.json) identifies the original
ranges and saved Ghidra results. This is a bounded repair on the installed
target. The [0.115.0 solo report](raid-targets.md) retains its target,
popup and reset evidence.

## Shared opcode and recipients

The local request adapter at `0x145e62fc9..0x145e62fe3` enters shared command
owner `0x145e4c400` with role zero. Host message dispatcher `0x145e77bd0`
checks the host role, peer row and joined flag. Its native variant 6 reads
the engine opcode and body, then checks the synchronized byte at row
`+0x86d`. The ordered adapter call at `0x145e7851c` reaches
`0x145eb4880`, which forwards the same payload with role one and the peer
index.

Opcode `0x321` enters at `0x145e4c69e`. An absent icon byte becomes zero.
Up to eight following bytes contribute to the little-endian GUID, with zero
fill for missing bytes. When the icon is `0xff`, the shared owner serializes
the current list and calls `0x145e77490` with the original role and sender.
The helper resolves the local engine port for role zero. For role one it
checks hosting and the peer index, then queues engine variant 6 for that
peer. This branch leaves the board untouched.

For a guest mutation, `0x145e4ca17..0x145e4ca50` requires host role, a
valid peer index and a nonzero connection row. The local mutation skips
that peer check. Both use the same eight GUIDs at driver `+0x1de8` and
board helper `0x145e21b70`. The helper rejects icons 8–254, clears existing
copies of a nonzero GUID from other slots in ascending order, and emits
the selected slot last when its value changes. Clearing a slot with GUID
zero does not change other slots.

For every changed slot, the shared owner emits a mode-zero packet with
its final GUID and calls actor publisher `0x145e778e0` for actor indices
zero through the world's remote actor count. An absent Game selects only
index zero. The publisher resolves index zero to the active local engine
port. Other indices resolve through the host connection table by assigned
actor index and require the synchronized row. No terrain-readiness gate
appears in this command branch.

## Source and checks

The local request projection now retains the ordinary full-list verb, and
the local raid-target arm forwards changed slots to the current world
recipients. The host's existing ordered receive loop consumes synchronized
guest raid-target commands directly. It uses the same board and packet
encoder, sends lists only to the requester and queues deltas before the
next request can queue its list. Local presentation stays on the ordinary
raid-target event path. The guest receives those packets through its existing
synchronized engine admission, decoder and GroupState consumer.

`python3 -B scripts/check-solo-raid-target.py --coop` checks the installed
hash, exact ranges and live source routing. It replays the native shared
request, board and two serializers in **6,783** cases covering both role
projections, all icon values, sparse and duplicate boards, empty and short
payloads, trailing bytes, sender-only lists, invalid guest mutation
admission and Game-present/absent actor loops. Allocation and the two final
publishers are explicit seams. Selected original publisher bytes establish
the local and synchronized-peer delivery gates. The saved raw Ghidra result
does not resolve distant calls or jump-table data by itself.

Compilation, actual client and service delivery, rendered markers and
original/rebuilt parity remain open. This contract resolves the selected
`0x321` branch. The broader party dispatch, role transitions and service
interfaces retain their own evidence and findings.
