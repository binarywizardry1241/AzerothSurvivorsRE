# Addon run space and position replay in 0.139.2

These bounded observations for #137 use the installed
`installed-game/AzerothSurvivors.exe` (150,793,728 bytes, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`).
The published full-audit baseline remains 0.139.1.

## Run key and destination messages

The Game constructor at `0x145efe1f0` allocates one run key before entry.
At `0x145efe2bd` it loads entry configuration `+0x138`, the unexpanded
64-bit seed also passed to the PCG32 expansion at `0x145efe5ab`. The key
formatter uses lowercase hexadecimal for that seed XOR
`0x9e3779b97f4a7c15`, then a hyphen, then unsigned decimal for the
one-based process-wide atomic sequence. The formatter callbacks are
`0x14632f060` and `0x1463308a0`, and the separator descriptor is at
`0x147374708`. The String is copied to stack `rbp+0xbe0`, which becomes
Game `+0xc30` in the final copy from `rbp-0x50`. The constructor
query is shared with the [racial balance receipt](evidence/0.139.2/racial-balance.json).

The zone payload formatter at `0x145ecb200` reads that String at
`0x145ecb709..0x145ecb717` (Game pointer/length `+0xc38/+0xc40`).
Its format descriptor at `0x147a42029` places `run` between `heroic`
and `affixes`. The snapshot builder at `0x145e1cb70` seats
`AZSZONE` first, with the cache and guardian lists later in the same
publication. The native meter owner at `0x145f7c6d0` compares the same
String to its retained key before resetting meter state. A solo run and
the host's recipients consume their own authoritative Game's key.

## Lua coordinate identity and reload

The client constructs `m<map>:<run-or-none>` with `AZS_SpaceOf`.
`AZS_GetPlayerPosition()` accepts the run only when the native sample's
map equals `AZS_ZONE.map` and the retained run is a nonempty string. A
success returns a fresh table, map ID, coordinates, facing and an
`f<frame>` sample identity. Outside a run the table omits `runId`.
The native sample supplies the rendered coordinates and status separately
from the server's periodic `AZSRUN` movement fields.

On `AZSZONE`, the Lua handler stringifies the run and compares both
run and map to their prior values. A change clears the old chest and
lair lists. Each later `AZSCHESTS` or `AZSLAIRS` row inherits the run,
map and space at receipt; its absent-run marker is `"none"`. The
0.139.2 script also clears downed-party data and notifies the separate
world-anchor consumer of changed zone and destination data.

The meter script requests `AZSMREQ\tfull` when it loads and at
`PLAYER_ENTERING_WORLD`, using `SendAddonMessage` on the `PARTY` lane
with a one-second throttle per request kind. The fresh VM starts with an
empty zone, so a position sample can be ready before it can identify an
active run. The addon input owner `0x145e4c400` checks addon language
`0xffffffff`, compares the `AZSMREQ\t` prefix and dispatches the
remaining bytes to `0x145dec170`. The recipient state sits at solo
owner `+0x1918` or admitted guest record `+0x260`. The trimmed exact
token `full` sets ledger replay at `+0xf8` and legacy lines at `+0xfa`.
`party` sets `+0xf8/+0xf9`; `lines` sets only `+0xfa`.

The publication owner `0x145e50b10` consumes and clears the legacy
request byte before comparison against its previous payloads. The guest
uses record `+0x35a` at `0x145e573f4..0x145e5781b`, and solo uses
owner `+0x1a12` at `0x145e5968d`. The reset drops and empties the
previous strings, allowing the ordinary changed-byte publisher to
replay current nonempty addon lines. The request remains per recipient.
The meter ledger is a separate constituent of #75.

## Shared destination publication

The co-op host uses the same chest and lair serializers as the solo feed.
The snapshot is taken with the addressed hero's context seated. It reads the
shared world pickups and lairs, with the recipient's guardian flag selection
and localization. The recipient's changed-byte publisher sends the zone
before both destination lines on the ordinary addon packet lane. The guest
does not synthesize these lines from its local replica.
On VM load or world entry, the [replay source](party-healing-meter-0.139.2.md)
requests current lines through the existing addon chat lane. The solo or host
publisher clears the relevant recipient cache before its next scheduled poll.


## Static evidence

The PE ranges below were rehashed against the installed image. The
formatter and selector reuse completed Ghidra raw-slice queries
`ev_1fa609890c77f883eab2912b264d624672fc49379394393bfef70ad1bafab1a7`
and `ev_c5e605b7623170f99c519b9743e46ecea006ac8607c725ef7886ec7466bd2d98`,
respectively. Original Windows-x64 instructions and separately mapped
data establish the call arguments outside those raw imports.

| Role | VA or Lua file offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Run key construction | VA `0x145efe2b6` | 146 | `a8f4877762a7609e54c3d514b195b70126a476aabaa6f8a5ce67a1a3e22ef186` |
| Reload seed and call expander | VA `0x145efe52e` | 130 | `47a87d0c34483a604bb89d71604ea731ce20d38fa9bf51af4650c334fd55ffcd` |
| Zone formatter | VA `0x145ecb200` | 2878 | `442a0db07033a92485bcbe524bc079c449c0285a055b383902d169b16a3624d0` |
| Snapshot ordering | VA `0x145e1cb70` | 2473 | `515ea0bfd2b40d69c0b616abda3349bd2b2d0f1eb7882f63d8a1b2e7ae698559` |
| Request selector | VA `0x145dec170` | 129 | `00b45f2ae29300e22407388bc440c38c9b5c921de06950b1cb61f363c1b30966` |
| Guest cache replay gate and reset | VA `0x145e573f4` | 1063 | `0a8cd6d1e3bab2323efd7e0556db4fd15daef121c62e09ca7f38fb72cbd37d6d` |
| Solo cache replay gate | VA `0x145e59686` | 29 | `e7d76e2936567a52764eeb197826c818e190e521684eba2a6caa75264102ac2b` |
| Lua space helpers | File `0x76b3f48` | 481 | `f35e198391ca0d2b255d23fe349278abd7f39c1dd444a7fcee9362882aac40dd` |
| Lua zone handler | File `0x76b777e` | 431 | `2500e022b224a182fa3dccfefe93f9123b7cc3ee6b1b907aeffbec21727ab35b` |
| Lua destination handlers | File `0x76b81e6` | 377 | `cde176e4d5a378213e7d184fd38b372da4c060905d5c01f33c35155aaa1dcc14` |
| Lua request throttle and dispatch | File `0x7a47cb3` | 246 | `61e751c8ae1b6e7bd2b1cacabd6348953b4db26f68dd6bfc7f5b5dff5e5b3726` |
| Lua position validation and result | File `0x7a5197b` | 1468 | `d0d5f21e3f05a88ae7d95e28cc4f4f77a08192c672c53ac9713c3656f7bae284` |
| Lua reload and world-entry requests | File `0x7a527b1` | 1011 | `f28bfc2af00cffaba59c4b27eda91aa0e3789ceb5b3e64025b8fac407349876c` |

Static checks rehashed the thirteen ranges, parsed the changed Rust source
and checked the shared serializer, recipient context, publication order and
guest delivery path. Compilation, client or co-op execution, and
original/rebuilt parity remain unverified.
