# Damage weakening in 0.139.2

[Finding #136](../verification-needed.md#gap-136) and the
[native receipt](evidence/0.139.2/status-weakening.json) cover the selected
status-scaling tables of the installed EXE, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.

The Demoralizing Shout descriptor at `0x147348658` identifies spell 1160
and reads tag 11, magnitude 0.35 and duration six seconds at offsets
`+0x68/+0x6c/+0x70`. This is the status represented by internal tag 10
in the reconstructed catalog. The older [descriptor translation
proof](ability-definitions-0.109.0.md) records the same correspondence.

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

The [current selector evidence](evidence/0.141.0/status-talent-selectors.json)
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
already supply these two typed paths. Full recipient/timer correspondence and
original/rebuilt behavior remain open.
