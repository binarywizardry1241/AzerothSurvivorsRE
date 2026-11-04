# Counterattack in 0.141.0

The installed `installed-game/AzerothSurvivors.exe` is 0.141.0, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This bounded recovery assesses `changelog:0.141.0:5788d609499311cd`
under [#316](../verification-needed.md#gap-316).

The Counterattack descriptor has two ranks and points to one effect. Native
raw tag 12 holds condition 8, the `immolation_trap` key, a 0.15 base roll
and a one-second proc deadline. The source retains the generic rank multiplier
of one or two for the roll. The description uses the same rank value and names
Immolation Trap in all fourteen embedded locale catalogs. Immolation Trap's
descriptor supplies spell 13797, Fire ground cast kind 3, zero range, a
seven-yard base radius, and four ticks over eight seconds. The descriptor's
upgrade selector bytes are `[0, 1, 3, 4]`.

The incoming owner at `0x145f6d340` tests the attacker GUID, incoming melee
flag and active mode before publishing kind 4 and then kind 5. The thorns
arm returns to the same publication path only while the run is active.
Condition 8 at `0x145f8e5b4` checks for kind 4. The prior source published
both callbacks for all admitted damage, including spell damage. The
[incoming adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/incoming.rs)
now gates both callbacks on the sourced melee hit and active run.

The raw tag 12 dispatch cell selects `0x145f8f546`. The proc checks its own
deadline, takes one high-24-bit RNG draw, compares it strictly below the roll
chance, and sets the deadline before resolving the key. The shared free
instance constructor copies the full learned instance by key, including its
trap upgrades. When the trap is unlearned it uses the base definition, current
matching spell modifiers, and mean learned power with a floor of one. The
proc reaches the ordinary cast dispatcher at `0x145f51870` without consuming
the learned trap's normal cooldown. The
[effect replacement](../../crates/azeroth-survivors-re/assets/talent-replacements-0.141.0.json)
feeds the existing generic callback and ground DoT path. Its description and
effect key feed the talent menu and spell tooltip, respectively.

| Evidence range (preferred VA) | File offset | Bytes | SHA-256 |
| --- | ---: | ---: | --- |
| Counterattack descriptor `0x147705bc8` | `0x77041c8` | 112 | `3ac4c80389247397ce723686785ab6a585998f10e7000370a874d7ac41333377` |
| Effect `0x147705250` | `0x7703850` | 64 | `4b8565c69393e3e1b15a30aa8abcffb8c3523cdfedd73d87f89dc8081207d4aa` |
| Immolation Trap descriptor `0x1473a4f60` | `0x73a3560` | 120 | `e9f91abdf313683cda1841d3c94628202ac4ca7dac6ba47746ab8ec946bea4b4` |
| Incoming admission and publication `0x145f6e412` | `0x5f6d812` | 613 | `b9264b3ee82bde43055aac4bd4e13e7b0ffe1b43fc02e2493288b1c125ce055d` |
| Post-thorns mode check `0x145f6ee3b` | `0x5f6e23b` | 18 | `82545fba8ece7386af8e5537dc8b318d76303355c9259bd5ca50a9cadf2ba264` |
| Condition 8 comparison `0x145f8e5b4` | `0x5f8d9b4` | 13 | `c6b9c62fa1b662a0f8f256ae502d8ce3cb8d3ee19c0460f69c7b855c82766e51` |
| Tag 12 dispatch cell `0x147af368c` | `0x7af1c8c` | 4 | `af461e77ea975ef74b72c29d87e0d3ba38576b72b7567160a128cf5079723fd2` |
| Proc and cast call `0x145f8f546` | `0x5f8e946` | 453 | `b77c8e519e3b0049a7e206cced02fdf971b31c916ec75e197e9143207b6b88cb` |
| Free instance constructor `0x145f943a0` | `0x5f937a0` | 581 | `25e805ded56f791d9d62aa8fbb90c23a49ea0d7ddf03e5907ae5c70244cc07e6` |

Journaled Ghidra decompilation
`ev_df799bfad512f0c25ec3a977c9c142b95e82aca06fd45407e35b9302d19a23eb`
uses the 17,381-byte raw slice at preferred VA `0x145f8e670`, file offset
`0x5f8da70`, SHA-256
`ec10d6215f4f975b0eff0351c01d5dd5ab248ccb516b6745badf34dde1909cbb`.
The result SHA-256 is
`f8c4e7d02c976407614c62c8e03a28346fff05109d99899e0ad528ce0057a884`.
The disassembled PE dispatch cell and branch establish the arm where the raw
slice cannot resolve its external table. PE row mapping, normalized effect,
result digest, locale descriptors and inserted translations passed static
checks. Compilation, rendered output, gameplay and parity are unverified.
