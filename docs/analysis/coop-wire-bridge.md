# Co-op engine packet bridge

The selected native initial-world publisher `145892220` and party dispatcher
`1458952f0` exchange ordinary engine opcode/payload pairs through AS wire tag7.
The target is 0.115.0, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The owning co-op replication evidence records the native packet boundaries.

`WorldWriter::packets` reuses the existing production CMSG encoders without
opening a socket or adding authentication, encryption or WoW TCP headers.
The socket writer and offline embedding share the exact exhaustive
`ClientCommand` dispatch. Its match arms were checked token-for-token against
the previous socket dispatch; socket split/rejoin retains the same encryption
and traffic ownership, while packet-only writers cannot rejoin a world socket.

`LocalWireRequests` routes actual client commands before the local AS projection
could discard movement, target or acknowledgement fields. When enabled, those
commands do not also execute the local request projection. The current native
clock-query exception remains local. The host can observe complete controller
movement bodies while its ordinary local query/action projection remains active.
`LocalWireEvents`
feeds inbound bodies through `parse_server`, `decode` and the existing handler
table. It retains packets until the embedding activates its real local client.
The embedding owns session admission, shutdown and clearing queued packets.

`local_player_fields` exposes the existing complete5875 player descriptor; the
co-op publisher does not maintain a second player-field layout. The public
movement-body parser likewise reuses the production conditional tail reader.

Regressions cover targeted casts, ground casts and full-GUID raid-target
requests, exclusion from the solo request queue, observed host jump tails and
local clock-query ownership in both modes. Rust syntax parsing
and source review passed; the Rust regression is authored but uncompiled/unrun.
No socket, application or game was executed. These interfaces alone do not
establish world bootstrap, simulation or multiplayer interoperability.
