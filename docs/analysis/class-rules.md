# Shadow Dance and Shadow Weaving

This report owns the remaining source portion of gap #16. The selected EXE is
SHA-256 `8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
Current overall status belongs to [verification-needed](../verification-needed.md).
Scorched Earth's already implemented dependency belongs to
[Demonology offers](demon-offers.md).

## Definitions and live consumers

The [selected native data](evidence/game-mode-audit/selected-data.json)
retains Shadow Dance's key record at `146e66668` and its two effects at
`146e65f78`: variant28 selects `backstab`; variant4 retains the 20% splash,
five-yard radius and `backstab`/`eviscerate` key list. Its complete preceding
prerequisite fields still require `preparation`, with no alternative. The
current prose explicitly says Backstab replaces Sinister Strike.

The existing [native constructor](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.105.0/power-scaling/weapon/game-constructor.ghidra.c)
scans the equipped 64-byte rows for variant28 at `1459010c2..14590113e`, with its
key-read tail at `14590162f..145901647`. It publishes one initial spell key,
using the class default when no replacement exists. The canonical shared
extract and Ghidra identity are referenced by the
[manifest](evidence/class-rules/manifest.json); no duplicate constructor
extract is retained here.

The [talent asset](../../crates/azeroth-survivors-re/assets/talents.json) now
uses the exact selected payloads and current prose for Shadow Dance. The live
`Mechanics::configure_effects` variant28 arm replaces its first ability with a
learned Backstab; the historical variant27 arm instead appends. Rank zero adds
no effect. Both menu/save definitions and `run_effects::catalog` consume this
asset, so the corrected record reaches saved-spec run entry and the live
ability slot. Later `refresh_effects` applies modifiers without relearning or
resetting its cooldown. The surrounding asset retains its historical target
identity; only these two rows are revalidated here.

Shadow Weaving's selected key record is `146e68c48`, with variant5 at
`146e68370`. Its fraction is `0x3ba3d70a` (0.005) and its condition0/school5
selector is unchanged. The source now uses that exact payload and displays
`0.5` for the tooltip's percentage.

The [current conversion branch](evidence/class-rules/conversion.asm)
at `14592b5e3..14592b6dc` checks the native condition, resolves the event victim
among live actor records, multiplies its maximum health by the row fraction,
temporarily selects source-kind3 and calls `145933ec0`. The school and spell
metadata remain those of the triggering hit. The fresh Ghidra branch import
is retained with its explicit out-of-slice control-flow limitation.

The live callback evaluates condition8, then
`milestones::conversion_amount` multiplies that same row fraction by the
resolved victim maximum health. `milestone_event` forwards the original spell
and school through the source3 effect-hit path. This path applies no extra
global damage multiplier or random roll; the hit-event gateway prevents source3
from recursively invoking generic callbacks.

## Static checks and limits

`python3 scripts/check-class-rules.py` passed. It checks the EXE digest,
canonical consumer extracts, both source/native records, prerequisites,
payloads and pointer-decoded spell keys/lists. Bounded unchanged instructions
in Unicorn passed four starter scans, 72 condition/school-selector cases and
20 conversion/victim cases. Cases cover absent/append/replacement rows,
matching and other schools, periodic admission, source2 rejection, missing or
dead victims, and maximum-health values from zero to 12,345.67. At 10,000
maximum health the selected coefficient produces 50 damage.

The added live Rust startup regression checks rank-zero behavior, a single
Backstab slot and preserved cooldown after refresh. The existing live damage
regression now expects 50 additional damage at 10,000 maximum health, retaining
the original hit metadata, unchanged RNG and nonrecursive source3 result.
These compile-based regressions were **not run**. No compiler, application,
original/rebuilt interaction or visual comparison ran. The native replay stops
before learning and hit dispatch; it proves the selected contracts, not gameplay
or presentation parity. Gap #16's runtime/parity comparison remains open.
