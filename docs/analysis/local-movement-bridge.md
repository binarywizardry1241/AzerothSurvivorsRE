# Local movement reports and corrections — 2026-10-19

The local host captures the ordinary controller's actual outgoing position
reports in order: movement transitions/heartbeats, forced-speed acknowledgments,
knockback acknowledgments and parking. Identical-position reports are retained.
Capture is enabled only for a local body; the network client has no capture
allocation. Readback carries the body identity and clears at session teardown.
The report capture does not alter the existing controller's packet policy.

A body-identity-bound correction request queues the client's existing same-map
TeleportMessage. Its ordinary consumer owns snapping, transport release, camera
seating, settle hold and the acknowledgment. Old-body and nonfinite requests
are rejected before queuing. The counter wraps per body. The embedding does not
move the avatar through its world Transform.

The current target's floor correction packet owner145467450 writes opcode0xc7
(MSG_MOVE_TELEPORT_ACK), a packed GUID, incremented Game+4cc counter, zero
movement flags/time, XYZ and facing. That source evidence is retained with
[floor recovery](floor-recovery.md). Current run integration consumes the
captured reports and this correction seam.

Validation:50 filtered client tests passed, including the capture regression
that compares identical-position heartbeats against emitted wire commands.
Four player/local tests passed separately, including correct-body teleport
queuing, stale/invalid rejection, pause clocks and teardown readback. These are
source checks; original/rebuilt indoor movement and Windows parity remain
unverified.
