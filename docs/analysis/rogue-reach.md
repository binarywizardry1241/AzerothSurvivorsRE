# Rogue attack reach

The installed EXE SHA-256 is
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
This resolves the reach behavior under [#318](../verification-needed.md#gap-318)
and `changelog:0.140.0:78aee98f2e312f8a`.

## Weapon and ability admission

The weapon stage in `0x145f8c810` reads the class byte at Game+`0x44c`.
`0x145f8d2bf..0x145f8d2eb` selects the Warrior default or indexes
`0x147afa938` by class minus two, then checks the low enable bit. The
Rogue entry is `0x1473b80b8`, confirmed by the name lookup's
`0x145ed75c4` reference. Its four fields are enable 1, damage 14.0,
interval 1.2 and range 8.0. The enabled Paladin and Warrior records
store 6.0. At `0x145f8d395` the tick loads the selected range from
record+`0xc` into XMM3 and calls the ordered selector `0x145f872c0`
at `0x145f8d3f7`.

The cast dispatcher `0x145f7bb40` reads ability+`0x4c` into XMM3.
The ordered calls at `0x145f7cb71`, `0x145f7cc51` and
`0x145f7d5a7` and the radius call at `0x145f7d8d5` use that
descriptor field. The current Rogue pool uses 8.0 for Sinister Strike,
Eviscerate, Rupture, Kidney Shot, Gouge, Ghostly Strike, Backstab and
Seal Fate. Five of these rows still stored 7.0 in the source. Blade
Flurry's independent radius and the self-buffs retain their own fields.

The ordered selector forwards XMM3 to `0x145f85770`, which squares
it at `0x145f8579e`. The candidate iterator compares that square
against squared XY center distance at `0x14605e75a..0x14605e774`,
including equality. The ordinary reach predicate adds no model,
collision radius or actor scale. The existing Rust weapon and cast
selectors already consume those inputs, so the source repair changes
the class and spell records. The pre-run picker also displays eight yards
for the five updated spell ranges.

## Encounter code and static scope

`0x145ee2a90` is the [retained packed-grid lookup](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.140.0.md)
and receives the edge at `0x145ee245b`. The paired `0x145ee4340`
code computes packed-grid dimensions in six-yard cells. Its caller
at `0x145ee64db` leads into the Frozen Checkmate encounter text.
The other shared Location owner `0x145f743e0` consumes encounter queues
and references the hazard keys and Explosive Orb message. The two
incoming sites `0x145f2fa56` and `0x145fad68c` pass frame delta to
this owner. The downstream `0x145fcd020` and `0x145fcefb0` owners
also reference hazard records. These grid and hazard consumers retain
their encounter and coverage ownership under [#313](../CURRENT-STATE.md#gap-313)
and [#41](../CURRENT-STATE.md#gap-41).

The class-selector query used exact PE slice
`0x145ed6fd0..0x145ed803a`, SHA-256
`21b965d3b2562af408f55329d94f89b769d247eabdb5b86fe686a4b78ef5d1ad`,
Ghidra evidence `ev_be59d67c2fc429b4a5ede7d1a16279efcc81741662d9d06dc9d078687990672b`.
Capstone checks verified the class-table and radius call paths against the
mapped PE, and the Rust sources were parsed without compiling. Compilation,
the exact in-game boundary, combat packets and original/rebuilt parity
remain open.
