# Enemy HP-helper dispatch

Permanent **#41**, bounded lead **Q41-F01:site=0x145bbf151**. Target is installed
0.120.0, SHA-256
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall implementation status.

The formerly unresolved `call rcx` is a closed, two-target **AS enemy-health
polynomial selection**. It is not a mutable callback or an unidentified engine
callee. The current source already represents this operation; the selected
classification establishes no missing source behavior.

## Native producer, domain and consumers

The genuine `game/enemy.rs:685:20` Location belongs to constructor
`145bbed50..145bbf6c4` (2,420 bytes). Its filename supplies context; the following
code/data flow supplies this bounded semantic classification:

| Selected byte `enemy_definition+4c` | Constructed `rcx` target | Cubic coefficient |
| --- | --- | --- |
| Zero | `145bf6fd0..145bf7015` | `0x3be6afcd` / 0.00704f32 |
| Any nonzero byte | `145bf6f80..145bf6fc5` | `0x3bc2a455` / 0.00594f32 |

At `145bbf0b1` the byte comparison sets the flags. Each path loads the minute
input and its other scalar factors without changing the decisive condition.
`145bbf103` constructs the nonzero target with `LEA`; `145bbf10a` constructs the
zero target; `145bbf111` selects the nonzero target with `CMOVNE`. No loaded
vtable, mutable code slot or external callback registration determines this
call. All 256 byte values select exactly one of these two leaves.

The call at `145bbf151` receives `xmm0 = Game+bdc / 60` and
`xmm1 = zone+e0 * Game+c54`. Both leaves are 69-byte arithmetic functions with
no further calls. In source notation, their result is
`(1 + 0.1*t + 0.036*t*t + c*t*t*t) * z`. The original SSE multiplication and
addition order, rather than the decompiler's reassociated printed expression,
governs exact f32 results.

The returned scalar immediately multiplies the selected definition's base HP
and flag factor at `145bbf153`. The constructor then applies its late-run HP
factor, endless power and HP percentage, followed by the cooperative HP factor
when admitted. Its existing actor construction/publication path receives that
health value, and the final record stores current and maximum health together.
This selected result flow does not recover every other constructor input or
the surrounding allocation, engine, CRT, networking or world behavior.

## Existing live source connection

`enemies/scaling.rs::health_polynomial` already uses the exact two coefficients,
nonzero-byte selection and operation order. Its consumer
`initial_stats_with_health_bonus` supplies run minutes and
`input.zone_scale * input.difficulty`, then applies the existing base/late/endless
and percentage terms. The public `initial_stats_for_zone` path reaches the
actual `gameplay/mechanics.rs::SpawnAdapter::create`: selected enemy definition,
run clock, zone scale and run-rule inputs produce actor health and maximum
health; the existing party multiplier is applied before insertion.

This is the live ordinary/flagged enemy construction path. No isolated helper
or unused substitute was introduced, and no gameplay source change is warranted
by this classification. Historical constructor/helper recovery retains its
original target in [enemy scaling](enemy-scaling.md) and
[modifier readers](runmods-scaling.md).

## Reproduction and evidence limits

The [compact proof](evidence/0.120.0/enemy-callback/proof.json) binds the exact
constructor and three extracted ranges, the
[canonical instructions](evidence/0.120.0/enemy-callback/native.asm), and three
journaled Ghidra results in the [query commitments](evidence/0.120.0/enemy-callback/queries.json).
They reuse the shared full-PE Program; original results, Evidence IDs and
analysis-profile commitments remain retained. No independent database is created
for this lead.

With the existing Capstone and Unicorn installations available:

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-q41-enemy-callback.py
```

The checker verifies the current target, exact query/result commitments and
source connection guards. It executes **12,288 bounded original-instruction
cases / 417,840 instructions** across all 256 flag bytes, eight clock inputs
and six zone/difficulty pairs, checking the selected address and exact f32
result against the checked source expression. Synthetic fields, finite inputs
and the stop immediately after the helper return are explicit seams. The full
constructor and Rust source do not execute.

The selected callable-identity question is resolved as AS arithmetic with an
existing live implementation. Broader #41 and module #139 remain separately
owned. Compilation, actual spawning/client/MPQ/network/server/gameplay effects
and original/rebuilt parity remain unverified.
