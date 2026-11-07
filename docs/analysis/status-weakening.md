# Damage weakening

[Finding #136](../verification-needed.md#gap-136) and the
[native receipt](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.139.2/status-weakening.json) cover the selected
status-scaling tables of the installed EXE, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.

The Demoralizing Shout descriptor at `0x147348658` identifies spell 1160
and reads tag 11, magnitude 0.35 and duration six seconds at offsets
`+0x68/+0x6c/+0x70`. This is the status represented by internal tag 10
in the reconstructed catalog. The older [descriptor translation
proof](ability-definitions.md) records the same correspondence.

The ordinary cast owner `0x145f3d010` reads that descriptor through its
ability instance. The four current capped paths multiply magnitude by the
instance effect operand and clamp it with `minss` against bits
`0x3f666666` (90%). Duration uses the independent duration operand. The
status dispatcher `0x145f45780` reads the same tag, locates the target
and passes magnitude and `now + duration` to the timed strongest-window
owner. The separate preview reader `0x145ec78b0` uses the same 90%
operand. The common source helper now feeds both the status payload and
the guest preview.

The static check compared the current descriptor, all four original cast
operands, the recipient status branch and the preview operand. The change is
scoped to the recovered weakening status. Compilation, combat and tooltip
rendering, and original/rebuilt comparison remain open.

## Ground-periodic and self-aura payloads in 0.141.0

The [current selector evidence](evidence/status-talent-selectors.json)
binds both current-only tables under #136 to the installed 0.141.0 EXE.
Its SHA-256 is
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
Both tables read the ability descriptor's tag at `+0x68` and floats at
`+0x6c/+0x70`. The current Demoralizing Shout descriptor at
`0x1473a4330` supplies spell 1160, tag 11, magnitude 0.35, and duration six.
The Blizzard descriptor at `0x1473a6310` supplies spell 10 and tag 1.
Battle Shout at `0x1473a43a8` supplies spell 6673 and tag 8.

| Dispatch | Selected consumer |
| --- | --- |
| `0x145f53e53` | After the position-bearing object call at `0x145f53e10`, the selected tag, magnitude and duration are written at `+0x20/+0x24/+0x28` of an 88-byte record in the ground queue at Game `+0x6e8`. Tag 1 scales duration. Tag 11 scales both lanes and clamps magnitude at the original f32 0.9. The rebuilt kind-3 cast passes `scaled_hit_effect` to `GroundPeriodic::new` through the existing object path. |
| `0x145f5402e` | Cast kind 2 enters `0x145f525fd`. After the immediate hit at `0x145f5400f`, the selected status triplet at frame `+0x40` reaches `0x145f5a1f0` with the same victim, spell ID and power argument at `0x145f54184`. The rebuilt radius cast supplies the scaled status to the direct hit path. |
| `0x145f546c9` | The selected triplet at frame `+0xf0` is stored at `+8` of a 32-byte aura row, with zero source, spell ID and expiry at `0x145f557b0..0x145f557e2`. The spell-specific continuation checks `battle_shout` and passes this triplet to `0x145f0f8b0`. The rebuilt kind-9 cast uses `apply_self_buff_with_party`, refreshes its self aura, and hands Battle Shout's payload to its party consumer. |
| `0x145f5499b` | Cast kind 6 enters `0x145f52847`. At `0x145f54b16` the target loop passes the triplet from frame `+0x118` and an independent four-word periodic record from frame `+0x40` to the projectile builder `0x145f5d990`. The periodic record carries variant 1, total power, duration and tick count. The rebuilt kind-6 cast puts `DotPlan::words` and `scaled_hit_effect` into the corresponding separate projectile fields. |

The immediate and projectile tables at `0x147af323c` and `0x147af318c`
each have eleven signed cells and nine distinct destinations. A byte replay
of the two guards, all 22 cells and the merge calls establishes the shared
policy. Raw tag 1 scales duration, tags 2, 3 and 7–10 scale magnitude, and
tag 11 scales duration and clamps scaled magnitude against the f32 0.9 at
`0x1465541fc`. Raw tags 4–6 and tags outside 1–11 forward the original
triplet. The 115 consecutive 120-byte ordinary ability definitions at
`0x1473a40d8..0x1473a76c0` have SHA-256
`49e69f818cbdfa9877b49303f4c571b859b70264437c5a214245557cb45f8e31`.
Within this table, raw tag 11 belongs to kind-2 Demoralizing Shout and kind-6
Insect Swarm. Raw tag 10 belongs only to kind-9 Demonic Empowerment, whose
rebuilt self-buff path uses its separate uncapped effect producer. This
explains why the reconstructed tag-10 weakening clamp does not cap that buff.
The [scaled status and cast consumers](../../crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs)
already supply these two typed paths.

### Immediate weakening recipient in 0.141.0

The recipient dispatch at `0x145f5a24e` takes raw tag 11 to `0x145f5a8fb`.
It searches the 552-byte actor rows for the victim GUID, skips the row when
its phase discriminator is 1, and passes the scaled magnitude, `now + duration`
and `now` to `0x145db7490`. It writes the displayed duration at actor `+0x1e4`
only when the selected active magnitude and deadline equal the incoming pair.
A changed nonzero spell ID replaces the old aura and removes the previous
nonzero spell first. The [rebuilt status owner](../../crates/azeroth-survivors-re/src/gameplay/mechanics/callbacks.rs)
uses the same active-pair check and separate aura replacement gate.

The timer helper range `0x145db7490..0x145db762b` has SHA-256
`f82ad3229c0d96861c4135e2f0aeb1ef03b7826e3f4a9083a134838d25373f67`.
Isolated instruction replay matched all 244 steps of the [retained timer
sequences](evidence/shouts/native-cases.json) and 600 finite boundary
cases against the [source timer](../../crates/azeroth-survivors-re/src/player_abilities/behavior/state.rs).
The added cases cross four initial active/fallback states with five clocks,
five incoming magnitudes and six deadlines. They cover expiration, ties,
stronger and weaker arrivals, and the two retained value/deadline pairs.

The Ghidra query for the dispatcher used the mapped PE span
`0x145f5a1f0..0x145f5ac7d`, SHA-256
`e31eef80f986e1436e296fc78d88d1cff7a2589b59dc9d1377b0ba70e667143a`.
Evidence `ev_1d97965370b76f1aeea0d95541b6075c5dc96be34a296ff14207b101d9786af8`
has result SHA-256
`e707de292afc2e7fce28c1f864abb534f9550901a1d931d024cc1244bcad97ac`.
The original PE supplies the signed table cells and tag-11 branch absent
from the raw-slice pseudocode.

### Periodic projectile recipient in 0.141.0

The projectile builder `0x145f5d990` writes the 16-byte periodic plan at
`+0x10` of the 144-byte pending row and the separate status triplet at
`+0x70`. The pending owner `0x145f5aed0` reads both from the detached row.
For a live matching actor, it calls the periodic installer `0x145db52a0`
at `0x145f5b831`. It then emits aura and impact metadata through
`0x145f35690` and `0x145f35ff0`. The dispatch at `0x145f5b87e` forwards the
stored triplet, victim GUID, spell ID and power to the shared status handler
`0x145f5a1f0`. Raw tag 5 supplies the periodic leech fraction and skips this
last dispatch. Raw tag 0 enters the shared handler's no-op case.

Of the 12 ordinary kind-6 definitions, nine carry raw tag 0 and Devouring
Plague and Drain Life carry raw tag 5. Insect Swarm, spell 5570, is the only
kind-6 definition carrying raw tag 11. Its row at `0x1473a6e50` has authored
magnitude bits `0x3e19999a` and duration bits `0x41400000`, representing
0.15 and 12 seconds. The rebuilt dispatch already scales and carries its
weakening as internal tag 10. The [pending-hit callback](../../crates/azeroth-survivors-re/src/gameplay/mechanics/callbacks.rs#L1016)
now passes that payload to the shared status owner after the periodic hit
path attempts installation. The native dispatch also runs after a dead or
missing victim declines installation. The status handler independently
requires a matching live row for raw tag 11, as does the rebuilt recipient.
The explosive-orb cast-kind mask `0x0d0c` admits kind 6. The connected status
applies weakening without an additional direct damage event.

| Preferred VA range | SHA-256 |
| --- | --- |
| `0x145f5df0f..0x145f5df97` | `efa24ef1ed8d884b062455226cdb28ce6ebd5a150a885d08a68ae4b1d8e24d14` |
| `0x145f5b134..0x145f5b1a4` | `cd304186721c622717ff26501db3ca2742392641bf9204ecc7a846aaf1582b6f` |
| `0x145f5b76d..0x145f5b884` | `a888b2619a65c7a354dcfe2416ece26325844c0e8b5c6bd6e993f24858ddc27f` |

Isolated replay of the third original instruction range exercised all 12
definitions with a live matching actor, a dead matching actor and an
unmatched actor. The 36 cases checked periodic admission, leech bits,
publication order and the exact status triplet at the call boundary. Pinned
rustfmt parsed the callback. Compilation, aura delivery, timing and
original/rebuilt comparison remain open.
