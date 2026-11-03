# Arcane Power echo count in 0.139.2

[Finding #309](../verification-needed.md#gap-309) is bound to the installed EXE SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [0.132.0 claim](release-review-0.139.0.md#r01320-01) concerns the chance
boundary where the initial echo and its talent continuation used to fall back
to a single cast.

The ordinary successful-cast branch of `0x145ee37d0` reads the accumulated
Echo chance at game offset `+0x604`. It sums the continuation counts from
native effect tag 25, then passes both values and the shared RNG to
`0x145f890a0`. The current Arcane Power continuation has three additional
attempts. Source retains its own tag 24 representation.

- Below 100%, roll for the first echo and then each continuation, up to the
  supplied attempt limit plus one. Stop at the first failure.
- At or above 100%, grant that entire sequence without consuming a draw.
- Add the whole part of the chance above 100%, then make one draw if the
  remaining fractional part is positive.

The caller resolves the count before issuing echoes, marks the repeated casts
as overcasts, and clears the marker after the loop. The source uses the same
ordinary scheduler and preserves its separate forced-cast and cooldown paths.

The [native receipt](evidence/0.139.2/arcane-echo.json) binds the caller
spans and journaled Ghidra analysis to the EXE. In 210 isolated instruction
cases, the count and final RNG state matched an independent scalar model.
The check substituted finite CRT floor and truncation. The Rust regression
is authored and unrun. Compilation, gameplay and original/rebuilt comparison
remain open.
