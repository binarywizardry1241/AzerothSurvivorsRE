# Co-op logout and terminal authority

Bound to installed0.115.0 SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This recovery distinguishes leaving the network session from the host ending a
world while retaining lobby connections.

A synchronized guest's engine-command owner145883b80 forwards ordinary commands
through wire7, but explicitly handles0x4b Logout,0x1ce QueryTime and0x1dc Ping
locally through145873b00. Logout emits ordinary local SMSG_LOGOUT_RESPONSE0x4c
with reason0:u32 and instant1:u8. The synchronized guest then invokes frontend
command9 through145893a20. That owner flushes pending upstream messages, sends
wire16 Disconnect immediately, drops the upstream connection, invokes the
existing1458948f0 local engine/logout cleanup, and reports ended with reason
`you left the run`. Host wire16 admission already removes that member; there
is no invented CMSG0x4b forwarding or required End18 acknowledgement.

Guest frontend commands6 Again and9 Menu share this exact leave path. A guest
must not restart its local projection as a new solo simulation. Guest command8
Endless emits wire8 Control kind4; the current host control handler has no
kind4 operation. The host controls shared Endless continuation.

The ordinary gossip bridge agrees:0x17c reads its selected option after the
8-byte GUID; options20/21/22 map to frontend commands6/8/9. For a remote origin,
145818e00 maps command8 to control kind4, while commands6/9 return0xff and are
ignored. The direct guest frontend leave path remains separate from those
forwarded gossip commands. Current host frontend command8 reaches1458feff0
through14588bd10/table14702fc50; older continuation addresses must not be reused.

A host-local Logout calls145889a60, which ends the world through14588dbf0,
delivers ordinary local SMSG_LOGOUT_COMPLETE0x4d and emits local exit. The world
end owner flushes queued peer packets, sends wire18 End to assigned peers,
clears their synchronized/profile-world state, and retains the lobby transport.
The guest End18 consumer is separately retained in
[the wire/state report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-replication-0.115.0.md): it resets the world and
resubmits the current hero on the same connection. End18 is not Disconnect16.

[Canonical evidence](evidence/0.115.0/coop-logout/manifest.json) retains12 bounded
assembly ranges,8 completed durable Ghidra owner identities and5 original PE
dispatch tables. The existing local cleanup1458948f0 extract is referenced,
not duplicated. `python3 -B scripts/check-coop-logout.py` verifies current
native bytes, table targets, constants and source routing anchors. Compilation,
Rust regressions, live logout/terminal sessions and native parity have not run.
