# Ras Frostwhisper

The [PE ranges and Ghidra receipts](evidence/scholomance-ras.json)
bind this trace to the installed 0.141.0 image, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This is scoped evidence for [#313](../verification-needed.md#gap-313) and
`changelog:0.141.0:26f30cd823bea0f6`. The 0.140.0 audit remains separate.

The table at `0x147af7768` schedules Frostbolt Volley, Chill Nova and Frozen
Checkmate at spawn plus 1.5, 7.5 and 4.5 seconds. Their repeat delays are 12,
17 and 24 seconds. Checkmate has highest priority and its repeat remains 24
seconds at higher ranks. Volley and Nova decline when the next Checkmate
deadline is at or before their own scaled warning plus a quarter second.

| Action | Native path and source connection |
| --- | --- |
| Frostbolt Volley | `0x145dbcc10` chooses the nearest eligible hero with the lower GUID winning ties. The part builder at `0x14605b6a0` starts six violet capsules at that angle in 60° steps. Each clips a 20-yard ray to the room, is 2.5 yards wide and uses 2.3 times effective boss damage. The windup is 1.5 seconds before rank scaling. |
| Chill Nova | `0x145dbc1c0` uses the live boss position, a radius of 11, 2.6 times effective boss damage, and a 2.25-second windup before rank scaling. A hit attempts a six-yard push away from that position. |
| Frozen Checkmate | `0x145dbde00` passes the top bit of the shared RNG draw to the six-yard grid builder. The source uses the two [previously emulated Scholomance masks](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.140.0/scholomance-encounters.json) at (96, 138), a 1.75-second base windup, and a 0.3-second tail. Grid sampling checks the danger bit and nearby tile edges with the recipient radius; the client projects the intersection of the valid and danger masks onto the arena. |

Chill Nova writes spell `0x46b3` at `0x145dbc45c` and copies the
168-byte part from `[rbp+0x48]` at `0x145dbc5a5`. The write at
`0x145dbc56b` sets part `+0x68` to impact mode 1. The load at
`0x145dbc575` takes `6.0` from `0x1465541a4`, and the packed write at
`0x145dbc580` stores distance, zero fallback heading and the same boss
XY used for the circle at `0x145dbc512`. The shared hit stage applies
damage before the mode-1 branch at `0x145fa1a23`, which computes the
recipient's direction away from the stored center and submits the
destination to `0x145f99870`. The [shared hit sampler](../../crates/azeroth-survivors-re/src/gameplay/mechanics/gandling.rs)
now queues the same push for Chill Nova through the existing clipped
movement and recipient packet path. This connection is static. The
in-game movement and original/rebuilt comparison remain unverified.

Frost Armor starts on the 60% phase and publishes spell 18100 and two
radius-1.5 tower parts. At `0x145dbd1f2` the producer writes multiplier 0.25
and an eight-second deadline. At `0x145dbc927` a touching hero replaces this
with 1.2 for four seconds. The update admits active party heroes through the
common shape test using radius 0.389. The first touch retires both tower
parts and removes the aura. Natural expiry removes the aura without granting
vulnerability. The next armor is due 35 seconds after either retirement.

Rune placement draws an angle from the shared RNG and samples 16 directions
per radius. It tries 8, 7, 9, 6 and 10 yards, then 12.5, 13.5 and 14.5 yards
around Ras, then the first set of radii around the nearest eligible hero.
Candidates check the room, collision, the immediate area around the point,
hero separation and the current damaging attack parts. Pair selection
requires at least one member within a clear 24-yard path from an eligible
hero and separation of at least six yards. It maximizes opposite bearings
about the sampling center. If none passes, the source uses the recovered
opposite three-yard fallback. These stages are at `0x145dbba10`,
`0x145db1c20`, `0x145dbda10` and `0x14605c200`.

The [script](../../crates/azeroth-survivors-re/src/gameplay/mechanics/ras.rs)
uses the live boss damage path for both multipliers. The shared host advances
the shield and checks all admitted touches, and the hit sampler processes
each recipient. The [marker decoder and terrain renderer](../../crates/azeroth-survivors-re/src/gameplay/raid_markers.rs)
use the native grid keys and mask words and reuse the existing tower column
projection. Its fill begins at the attack start and rises over the eight-second
shield.

Verified the 20 PE ranges and nine saved Ghidra results against the selected
EXE and the corresponding raw slice digests. The static checks do not establish
compilation, collision behavior against the loaded map, co-op presentation,
spell visuals or original/rebuilt parity.
