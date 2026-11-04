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
| `0x145f546c9` | The selected triplet at frame `+0xf0` is stored at `+8` of a 32-byte aura row, with zero source, spell ID and expiry at `0x145f557b0..0x145f557e2`. The spell-specific continuation checks `battle_shout` and passes this triplet to `0x145f0f8b0`. The rebuilt kind-9 cast uses `apply_self_buff_with_party`, refreshes its self aura, and hands Battle Shout's payload to its party consumer. |

The shared cap is at `0x1465541fc` and both tag-11 arms use it. This
classifies the two payload routes independently of the nearby Kill Command
Locations. The scope is limited to the typed construction and publication
boundaries. It leaves full recipient/timer correspondence and original/rebuilt
behavior open.
