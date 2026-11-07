# Raid forced player position

The current 0.123.0 [correction/recipient repair](coop.md#shared-simulation-and-replication)
replaces the historical twelve-report pending gate with a three-second
simulation deadline. This report and its original native fixtures retain their
actual historical target; their report-count source correspondence is superseded.

Authority is the configured installed EXE, version **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [manifest](evidence/0.112.0/raid-forced-position/manifest.json) binds
current instructions, explicit reused extracts, source guards and profile counts.
[Ghidra provenance](evidence/0.112.0/raid-forced-position/rea-provenance.json)
binds the independently located current movement-report owner and its retained
pending-position excerpt. This follows the current [raid lifecycle](raid-lifecycles.md)
and [admitted-frame](raid-frame-continuation.md) recovery.

## Producer and report consumer

The delayed native36 Pull publishes both an authoritative player position and
a pending movement-report expectation. Existing canonical instructions at
`145916f23..145916f54` write:

| Current Game field | Value |
| --- | --- |
| `+a10` | Pending discriminator 1 |
| `+a14/+a18/+a1c` | Expected corrected X/Y/Z |
| `+a20` | 12 remaining reports |
| `+4d0/+4d4/+4d8` | Authoritative corrected X/Y/Z |

Pull geometry, current admission, terrain/collision seams and packet construction
remain owned by the lifecycle proof. Native21 teleport changes the actor's
position; it is not the player handoff recovered here.

The current movement-report PE owner is `1458f1b50..1458f275e`. Its prefix at
`1458f1bb3..1458f1c13` checks the pending byte before any downstream terrain
queries. When pending is nonzero, it computes squared XY distance from the
expected position using packed f32 subtract/multiply and scalar `dy²+dx²`.
The actual constant at `145df1a50` is **9.0**. Z does not participate.

If distance² is ordered greater than 9 and the remaining byte is nonzero, the
consumer decrements that byte and returns through the actual epilogue at
`1458f26b1..1458f26f7`. The current authoritative XYZ remains unchanged. Otherwise
it clears the pending discriminator and enters the unchanged terrain/report
path. Exactly three yards is admitted. An unordered comparison also clears the
gate. Twelve consecutive distant reports are ignored; the thirteenth enters
the normal report path once the count is zero.

## Live source connection

`BossCombat::raid_pull` already set `player_override` and emitted the ordered
player-mover correction and spell events. `Mechanics::tick` consumed that override
for its actor, pickup-flight and scheduling stages. The outer live adapter then
continued using its pre-tick position for lair markers and nearby pickup
collection, and retained that stale point as the next frame's accepted position.
It also never seeded the report expectation for Pull.

`Mechanics::tick` now returns the final actual forced point from an admitted
frame. Both existing override-consumption sites update that result; an
unadmitted frame returns `None`. The live caller in `gameplay/mod.rs` commits
the returned XYZ to `RunSession.accepted_position` and calls
`Recovery::expect_position` before addon/world markers. Those consumers use
the corrected local point immediately. The follow-on
[pickup consumer recovery](raid-pickup-collection.md) moves collection
into its current post-actor frame stage, where it reads the final forced point,
and forwards accepted position to later choice-completion input.

The native marker selector independently reloads current `Game+4d0` at
`1459073c5`; two-active-lair profiles show its selected lair changes with this
published point. This proof changes the actual position input; the follow-on
pickup proof owns the current collection algorithms and order.
The companion [AS marker recovery](raid-lair-marker.md) binds the remaining
selection, visibility, refresh, localized-label and GossipPoi payload fields.

`Recovery::expect_position` only publishes the expected point and count 12.
It preserves existing below-floor, blocked, stationary and repeat-recovery
timers. The existing report-driven floor-correction path uses the same setter.
The outer caller does not infer a new expectation from queued Teleport events:
an ordinary report correction may already have consumed later reports in the
same input batch, and replaying its event would incorrectly restart the count.
Packet delivery and client movement code remain unchanged.

## Checks and limits

Run `python3 -B scripts/check-raid-forced-position.py`; `--stage`
writes a candidate under ignored
`runtime/analysis/staging/native-evidence/0.112.0/raid-forced-position`.

**229 native profiles** pass: 208 pending admission boundaries, 4 actual Pull
publications, a sequence of 13 distant reports, and 4 two-lair marker input
profiles. Admission cases include zero/nonzero pending discriminators,
remaining counts 0/1/12/255, exact and adjacent f32 radius values, both XY lanes,
Z-only changes, overflow, infinity and NaN. The checker executes only listed
installed instruction ranges and rejects other calls or instruction excursions.
These profiles use no callback seams.

The checker verifies current PE ownership, native constant bytes, current graph
identity, source publication order and the final-point return. Already owned
instructions reference their fixed canonical extracts; only new visited report
and marker rows are retained here. The bounded report fixture stops on admission
to the existing terrain path; it does not replace or certify all report-driven
floor recovery. Marker profiles stop before packet publication. Source guards
inspect the real adapter but do not execute Rust.

Rustfmt parsed the changed source files without rewriting them.
No compiler, Rust test, build, game process, real terrain/client movement,
rendering or original/rebuilt parity comparison ran.
