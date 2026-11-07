# Warlock run-entry effects

Target SHA-256: `dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This report owns #12's current run-entry payloads and rank composition.
[verification-needed](../verification-needed.md) owns integrated status; the
[definition](warlock-talents.md) and
[allocation](talent-allocations.md) reports own the menu and live/stored specs.
The [Empowerment report](demonic-empowerment.md) owns its spell, Medallion and shared seven-lane modifiers.

The live class-9 catalog loads all forty Warlock talents in current three-tree
order from [warlock-effects](../../crates/azeroth-survivors-re/assets/warlock-effects-0.112.0.json).
Moved talents share the persisted allocation, so their current maximum ranks
must reach current effects as well as the menu. The source replaces class 9's
effect definitions together, preserving native talent and effect ordering.

Current native stat36 and spell37 become the compositor's explicit internal
stat30/spell31. Current stat17/29/30/31/32 retain demon damage, critical chance,
Familiar, Echo and Supremacy contributions for dedicated actor consumers.
Grant/rank variants29/30 retain their original generic-vector positions through
internal markers; Config and the actor layer remain their sole behavioral owners.
Variants29–35 use internal marker253 with the native tag at byte63, including
Soul Link, Legion Gate, chance summons, timed capstones and Soul Reaping. Soul
Link's raw31 amount retains original-rank scaling and order for the Voidwalker
grant consumer. Owned key strings and lists replace native pointer words in
matching operations.

The [current aggregate/index proof](gameplay-frontiers.md) checks all
355 talent descriptors across every class, including these marker positions.
Stat/spell rows have separate numeric vectors and no generic proc index.
Matching provenance and retained cooldown/counter prefixes follow generic rows
only, so numeric talent or amulet inputs cannot shift captured proc attribution.

The whole current collector `14599e8d0..14599ef73` executes for every current
talent/rank in `scripts/check-warlock-effects.py`: **145 rank/effect
cases** pass. Its canonical native extraction is shared with the
[Warrior manifest](evidence/0.112.0/warrior-talents/manifest.json); the check
verifies the selected native ranges and extraction hashes. The
[fixtures](evidence/0.112.0/warlock-talents/effect-cases.json) retain original and
projected effect indices so source regressions address each emitted payload.
Defined semantic fields are compared; inactive native union padding is excluded.

Only stat36/spell37 use a definition's optional numeric-rank weights. Bane's
weights `[1, 2, 2.857142925262451]` yield 7/14/20% reduction. Intensity now applies
Soulfire power rather than its historical health statistic. Scorched Earth
separately applies 5% Hellfire power and 3% slow chance per rank. Soul Reaping's
original-rank coefficient is 5/7.5/10%; numeric-rank overrides do not enter that
special variant.

Supremacy no longer supplies a flat 25% demon bonus. Its lesser-talent ranks
feed the dedicated actor consumers. Soul Link's additional 1/2/3% damage
reduction is appended once to the stat-refresh scratch copy, following current
`1458f2a52..1458f2b8d`, before the common numeric finish and armor cap. The
[Warlock manifest](evidence/0.112.0/warlock-talents/manifest.json) retains
that selected native stat-refresh range. The contribution is not accumulated
in permanently equipped rows across refreshes.

The new source regression file
[warlock_effects_0_112.rs](../../crates/azeroth-survivors-re/tests/warlock_effects_0_112.rs)
compares projected fields with the native collector fixtures and checks that
Bane, Intensity and Improved Searing Pain reach their keyed spell lanes.
It was not compiled or run. The collector checks establish current definition,
rank and selector payloads, rather than every generic proc consumer's behavior.
Special-demon [scheduling/attacks](demon-actors.md), [spell volleys](demon-spell-math.md),
[critical damage](demon-damage.md), [Soul Reaping](soul-reaping.md),
[movement](demon-movement.md) and [build HUD](build-countdowns.md)
are source-connected under #24 with their own current bounded native evidence.
No compiler, game process or original/rebuilt gameplay or presentation comparison
ran; connected source and bounded static replay do not establish runtime parity.
