# Stoneform and The Human Spirit

[Finding #188](../verification-needed.md#gap-188) uses the installed 0.139.2
EXE, SHA-256 `0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [evidence record](evidence/0.139.2/racial-balance.json) binds the selected
PE data, instruction spans and constructor query. The 0.139.1 audit and
[0.120.0 race ownership and run carry](race-run-carry.md) retain their
original provenance.

- The constructor at `0x145efe1f0` looks up the class starter and the race's
  separate ability key, selected by race independently of class. The Dwarf
  race record at `0x147345da0` points to `stoneform`. The 120-byte catalog
  row at `0x14734b5b0` stores spell 20594, kind 9, tag 7, cooldown
  `0x41f00000` (30), duration 8, and shield coefficient `0x3ee66666` (0.45).
- The successful racial scheduler reads the descriptor's cooldown at
  `0x145ee5c5f` and applies 1.4, instance cooldown, talent cooldown, and global
  cooldown in sequence. Stoneform uses the default 0.25-second floor.
  At `0x145f404c2` tag 7 reads the shield coefficient times instance effect
  strength and checks for the same aura before applying it. The cast at
  `0x145f40c1a` multiplies that fraction by maximum health and
  `sqrt(power * talent_power) * 1.4`, then by `1 + shield_bonus`. Stoneform
  takes the general absorb replacement at `0x145f414c2`. With neutral
  modifiers and 100 maximum health, the result is a 42-second scheduled
  cooldown and about 63 absorb. The localized race card states the base values.
- The Human race record at `0x147345cf0` points to two passive rows at
  `0x14734567c`. Tag 8 carries `0x3e4ccccd` (+0.20 XP) and tag 9 retains
  its separate +0.20 gold. The stat refresh initializes XP to 1.0 and adds
  tag 8 at `0x145eef8f1`. The composed XP lane is stored at Game `+0x5e4`
  and multiplied into raw XP before the party factor and rounding at
  `0x145eb235b` and `0x145f5a040`.

The ability catalog and the shared local/remote run-entry data now supply
these values to the existing scheduler, buff and XP paths. The English picker
fallback and all fourteen locale catalogs use the recovered racial descriptions.
The existing Stoneform regression asserts the new scheduled cooldown and
absorb while retaining its checks for the separate racial slot and aura.

The caster also emits party event 15 through `0x145ed8fc0`. The event carries
the spell ID, the caster's modified shield coefficient before maximum-health
scaling, and the scaled duration. The receiver at `0x145eda200` multiplies
the coefficient by its own maximum health, adds that absorb, initializes the
ordinary reservation only when it is empty, and refreshes one source-zero
shield aura for the spell. The shared party buff path now applies this
Stoneform event to admitted nearby peers. A source regression covers the
live party tick with distinct caster and recipient maximum health.

Static checks compared exact native descriptor/passive bytes, current localized
values, the source inputs and the connected consumers. The Rust regression
source was parsed and remains uncompiled and unrun. Gameplay, rendering, co-op
execution and original/rebuilt comparison remain open.
