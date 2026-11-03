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
