# Scholomance: Kirtonos the Herald

The [native receipt](evidence/0.141.0/scholomance-kirtonos.json) binds the
script, shared dispatcher and hit consumers to `installed-game/AzerothSurvivors.exe`,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The action rows, header pointers and fixed-cycle data identify the current
callbacks. [#313](../CURRENT-STATE.md#gap-313) owns encounter work. The
[0.140.0 report](scholomance-encounters.md) retains the earlier evidence.

| Action | Admission and timing | Attack parts and impact |
| --- | --- | --- |
| Shadow Bolt Volley (17228), `0x146012130` | Humanoid; due after 1.5 seconds, repeat after 13. Aims at the nearest admitted hero, lower GUID on a squared-distance tie. Windup 2.25 seconds, locks 1.1 seconds before impact. | Three violet rectangles, width 4, 30-unit nominal length, at −20°, 0° and +20° from aim. `0x14605bf00` clips each lane to the room and occupancy; `0x145f4c79c` updates that aim before lock. Losing the target before lock retires the attack. Each part deals 2.5 times effective boss power and ends 0.25 seconds after impact. |
| Blood Offering (7154), `0x146011210` | Humanoid; due after 5 seconds, repeat after 17. Selects from the admitted heroes in ascending GUID order, rotating by a persistent cursor. The limit is 1 for up to 2 heroes at spawn, 2 for 3–4, and 3 for 5 or more. Windup 1.5 seconds, locks 1 second before impact. | One red radius-4.5 circle per selected hero, tracking until lock. The pre-lock update retires circles whose hero is no longer admitted and retires the attack when all circles are gone. Each part deals 2.5 times effective power and has a 0.25-second tail. |
| Vampiric Swoop (18144), `0x146011b30` | Winged; due 1.5 seconds after the form hold, repeat after 15. Aims at the nearest hero with the same tie rule and tries another eligible hero if the target leaves before lock. Windup 2.25 seconds, locks 1.9 seconds before impact. | One blue cone, range 16, with an 85° full arc (`0x14600ac0c` halves it for hit testing). Deals 3.4 times effective power and ends 0.3 seconds after impact. A hit attempts a six-yard push from the cone origin. |
| Wing Flap (12882), `0x146013920` | Winged; due 5 seconds after the form hold, repeat after 18. No tracking target. Windup 1.5 seconds. | Amber ring from 4 to 9 yards around the current boss position. Deals 2.2 times effective power and ends 0.25 seconds after impact. A hit attempts a four-yard push from the ring origin. |

All four rows have equal priority. A successful recurring action resets its
deadline, with the ordinary Heroic II and higher repeat factor of 0.8 (0.6 when
enraged). Ranked windups use factor 0.85, with the resulting lock floored at
attack start. At 65% health the phase retires both humanoid deadlines and
starts the winged ones after the two-second form hold. At 30% it retires all four
deadlines and starts the 42-second fixed cycle. The phase callback at
`0x1460135d0` gives the final phase precedence; `0x1460127f0` advances one beat
per update from `0x147af7c74`: Volley at +5, Offering at +12, winged form at +20,
Swoop at +25, Flap at +32, and humanoid form at +40 seconds. The final beat
schedule does not take the recurring factor.

The common hit stage records the `(victim, part)` pair before applying damage.
At the part impact, `0x145f4d69a` groups the recorded victim rows by part ID and
`0x145f4d7e1` writes the resulting 56-byte callback record. Delivery through
`0x145f51673` calls `0x1460135a0`, which heals Kirtonos for 8% of maximum health
per victim in an Offering part, capped at missing health by `0x145f39260`.
The source groups after solo or all cooperative recipient samples, so a
circle hitting multiple heroes produces one heal for that part.

Swoop and Flap use impact mode 1 at `0x145fa1a23`. The direction points away
from the stored origin, using the initial Swoop heading or zero for Flap when
the hero is within 0.05 yards of the origin. `0x145f99870` clips the proposed
destination; when clipping reduces travel by more than 0.001 it backs off
another half yard, suppressing a nonpositive move. The packet uses horizontal
speed `travel / f32::from_bits(0x3f39cbb6)` and vertical speed 7. The native
helper also changes the authoritative XY and resolves primary or secondary
height with the old height as fallback. The source applies the push after the
part's damage through the existing player-mover path.

The [script adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/kirtonos.rs)
uses the common scripted warning and hit path and the
[form state](../../crates/azeroth-survivors-re/src/bosses/raid_transforms.rs).
The source connects phase and timer state, part creation and retirement, the
Offering heal and both pushes. Compilation, actual cooperative ordering,
rendered warnings and original/rebuilt comparison remain under
[#313 verification](../verification-needed.md#gap-313).
