# Amulet target milestones

[Finding #301](../verification-needed.md#gap-301) and the
[native receipt](evidence/0.139.2/amulet-milestones.json) bind this change to
the installed EXE, SHA-256 `0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.

The equipped-effect owner at `0x145e01fa0` retains ordinary rarity growth.
Its target modifier branch at `0x146004e72..0x146004ea7` returns
`min(floor(base * factor + 0.0001), max(ceil(base * 3 - 0.001) - 1, 0))`.
The floor admits earlier milestones while the ceiling removes the terminal
increase caused by floating-point rounding. The existing spell modifier
aggregate consumes these integer values.

The tooltip owner at `0x145e02380` selects amulets with a target effect. Its
helper at `0x145e02750` compares the sum of target modifiers at the current
rank against each later rank through 2000 and stops once ordinary rarity
growth saturates. The formatter selects the completion, singular-rank or
comma-separated-ranks sentence. The Codex owner at `0x140364140` reaches
this formatter via `0x1402bb920`. The worn-item owner calls it directly at
`0x145f77a4c`. The reconstructed Codex and worn inventory each add the line
through the existing localized renderer.

In 8,000 isolated target-lane instruction cases, the current scalar matched
the source formula across five rarity multipliers and eight base target
values. The legendary examples with base 1, 3 and 4 retain their earlier
milestones and lose their terminal increases at ranks 95, 106 and 109.
All 42 milestone locale entries match the installed JSON descriptors.
The arithmetic check modeled finite CRT floor and ceil. Compilation, actual
item application and tooltip rendering, and original/rebuilt comparison remain
open. Enhancement necklace-specific effects and catalog identity belong to #305.
