# Doctor Theolen Krastinov

The [PE ranges and Ghidra receipts](evidence/scholomance-krastinov.json)
are bound to the installed EXE SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The current action table at `0x147af7838` retains the four initial delays,
repeat intervals, phase masks and priorities from 0.140.0. The header
`0x147af78b8` points to the current movement update at `0x146015d10`
and attack event callback at `0x146013d20`. Near and far selection in
`0x145f9f7c0` and `0x145fa2870` compare squared planar distance and break
ties in favor of the lower GUID.

| Attack | Initial / repeat | Current action |
| --- | --- | --- |
| Surgical Rush, 22120 | 1.5s / 14s | Aim at the nearest eligible hero and clip an 18-yard ray to the arena. The swept part starts as an open-ended segment of at most one yard, with width four. Its translation spans the rest of the clipped ray. At the scaled 1.5-second impact, the boss starts a 0.75-second move. If clipping shortened the route below 17.999 yards, movement backs off half a yard from the endpoint. The hit is 2.3× effective boss damage and pushes the recipient sideways by up to four yards. |
| Twin Cleaver, 15284 | 5s / 17s | Aim at the nearest eligible hero. A radius-13 cone centered on the aim angle plus π/2 resolves after the scaled 1.5-second windup. The pending callback at `0x146015450` uses the saved origin and aim angle minus π/2 for the second cone. Each deals 2.3× effective boss damage. |
| Butcher's Bladestorm, 1680 | 10.5s / 23s | Choose the farthest eligible hero and refresh that selection if the target leaves. After a scaled 1.75-second warning, the moving radius-seven circle pulses at half-second intervals for four seconds with 0.4× effective boss damage per pulse. The 0.25-second pursuit clock starts steps at 3.5 yd/s, for up to half a second per step, adjusting for remaining time, target clearance and arena clipping. |
| Butcher's Hook, 13608 | 10.5s / 18s | Aim at the farthest eligible hero. The two-yard-wide capsule follows the target heading from a fixed origin and clips an 18-yard ray until its scaled one-second lock. The scaled 2.5-second impact emits the endpoint cast and hits for 1.8× effective boss damage. |

The priority order is Bladestorm, Hook, Cleaver, then Rush. Existing scripted
warning scaling and Heroic II and higher repeat scaling apply. Rush and Hook
process movement after the recipient's damage. Rush chooses the perpendicular
direction on the recipient's side of the original dash and uses the shared
collision-clipped push. Hook checks the recipient is still active, then looks
for a four-yard landing from the original origin in the recipient's direction.
The search tries that angle followed by alternating offsets of π/12 up to π.
Each candidate must lie in the playable polygon and clear the occupancy grid.
The segment clip may change the landing by less than 0.001 yards. A candidate
must also avoid every live damaging part at progress 0, 0.25, 0.5, 0.75 and 1.
On success, the recipient is moved to the sampled terrain height plus 0.5 and
faces the origin. The native selectors are `0x145fa1b0a`, `0x146065290`,
`0x145ef0ed0` and `0x145fa2b70`.

The shared geometry selector `0x14600aa00` establishes the open ends and
translating endpoints of Sweep. The cone branch admits the outer radial
boundary and uses the recipient radius to expand the allowed angle. The
capsule projects onto the closed segment and tests strict radial distance.
The donut uses strict inner and outer contact with the native radius inset.
The `atk` serializer at `0x145f99b50` publishes the initial segment angle
and length, width and separate translation vector for Sweep.

The [script adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/krastinov.rs)
uses the host script stage, shared part lifecycle and existing movement and
spell event routes. The
[geometry owner](../../crates/azeroth-survivors-re/src/bosses/scripted_attack_geometry.rs)
shares the recovered hit math with other Scholomance scripts. Ghidra result
and mapped PE slice digests were checked. Rustfmt parsed the changed files.
Compilation, actual client warnings, floor and movement replication, rendered
spell effects, and original/rebuilt behavior remain under
[#313 verification](../verification-needed.md#gap-313).
