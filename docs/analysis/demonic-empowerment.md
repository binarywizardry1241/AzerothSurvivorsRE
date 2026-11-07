# Demonic Empowerment and Legionlord's Medallion

Target SHA-256: `dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This report owns #12's current Empowerment composition, spell offers and Medallion
source contracts. [verification-needed](../verification-needed.md) owns integrated status;
[definitions](warlock-talents.md) and
[allocation](talent-allocations.md) own the menu and live/stored specs.
The [run-entry effect report](warlock-effects.md) owns all forty current
Warlock talent payloads and their rank composition. Special-demon [actor scheduling/attacks](demon-actors.md),
[spell volleys](demon-spell-math.md), [post-hit attribution](soul-reaping.md),
[movement](demon-movement.md) and [build HUD](build-countdowns.md)
are connected under #24 with separate bounded native evidence.

## Empowerment, ranks and presentation

The current descriptor has 40% demon damage, 8-second base duration, 16-second
base cooldown, no haste payload, and permitted upgrades `[Cooldown, Duration]`.
`145993420` supplies ordinary upgrade magnitudes; `145899d70` grants ordinary
cooldown learned-rarity bonuses. Duration/cooldown offers disappear once the
current scaled duration covers the current interval. The separate historical
damage/haste upgrade fields and their custom caps are removed.

Current admission `14595cec8..14595cfe7` requires an actual demon-producing
contract. Under Supremacy, a greater summon/grant qualifies; lesser grants and
Legion Gate do not. Without it, combat demon grants and Gate/chance/timed
producers qualify. A scalar demon bonus alone does not qualify. The live cast
additionally requires a nearby enemy and a present actor with nonzero special
kind (`145925c94..145925cdb`). Existing source ports supply those current inputs.

Aura production `145925d75..145925da8` computes only
`descriptor.damage × instance.effect_multiplier`, independently of ordinary
rank power and qualified spell power. The current demon consumer applies
`1 + current buff potency` once. It strengthens demons only; the aura carries no
attack-speed lane. The canonical consumer is shared with
[demon damage](evidence/0.112.0/demon-damage/manifest.json), and the shared Horn
scalar with [buff potency](evidence/0.112.0/buff-potency/manifest.json).

Both the picker and live upgrade/description paths now use the current damage-only
literal and ordinary percentage duration upgrades. Neutral picker values are
40% damage, 11 seconds displayed duration and 22.4 seconds displayed cooldown,
including the native common 1.4 timing factor. The exact current picker subtitle
and localized expressions are checked in the [demon tooltip proof](demon-picker-tooltips.md). The native description branch
`14597c3f8..14597c503` supplies the current text and once-scaled displayed damage.

## Legionlord's Medallion and Supremacy

The original current constructor `1458a1730..1458a2ddc` returns three key-selected
spell37 rows: duration modifier4 +100%, ordinary additive cooldown modifier1
35%, and effect-strength modifier6 +100%. The historical dedicated damage row,
modifier7 cooldown lane, rank-ten interpolation and rank-ten admission cap are
removed. Current generic scaling (`1458a1550` and next-rank `1458a0e10`) follows
The Eternal Talisman: `3 - 2 × retention^exponent` with the same rarity steps.
For the current rank, native unsigned `saturating_sub(picks, 1)` is reinterpreted
as signed i32 before conversion to f32; the next-rank wrapper first increments
the u32 count with wrapping. Thus counts above `0x80000000` can produce negative
exponents. The source preserves this conversion rather than extending the
ordinary low-count curve across the whole unsigned domain. Fifty original
wrapper replays capture retention/exponent inputs for both wrappers, all five
rarities and counts 0, 1, `0x80000000`, `0x80000001` and `u32::MAX`, stopping
before the Windows CRT `powf` call.
Ordinary modifier1 effect scaling caps at 50% before additive spell composition.
Repeated acceptance `145968ace` increments the u32 pick count without a ten-rank
cap; replacing the amulet retains the ordinary replacement path and chosen item.

The run-entry effect report separately records Supremacy's current rank
dependencies and Soul Link's stat-refresh contribution, with its selected native
stat-refresh evidence in the shared Warlock manifest.

## Current spell modifier integration

The current evaluator `145897ab0..145897d3b` returns seven lanes: power,
cooldown, targets, area, duration, health-derived power and effect strength.
The historical qualified-demon-power and separate cooldown-factor lanes are
removed from the source state, composition and application. Current key/list
power selectors contribute to the ordinary power lane. Additive cooldown
contributions sum before `max(1 - sum, .4)`; the native output at +4 contains
that entire current talent/amulet cooldown modifier.

The current Warlock effect rows use modifiers0–6; the replaced historical
Legionlord asset was the only source asset carrying modifier7. Removing that
legacy lane prevents a historical factor from entering current cooldowns.
The current containing timer constructs a learned proxy with `145897880` then
calls this evaluator before using the output, providing the live actor path.

`python3 -B scripts/check-spell-modifiers.py` passes **96 cases**:
seventy bounded all/key/list/school/kind selector and modifier cases, twenty-five
current Bane/Intensity/Improved Searing Pain/Scorched Earth/Medallion cases,
and an additive cooldown cap case. Its native evaluator extraction is retained
once in this report's manifest; the new source regression exercises both live
effect rows and the amulet aggregate's supported all/key subset. These explicit
inputs do not establish the full input domain of the unchecked native dispatch.
The Rust regressions were not compiled or run.

`python3 -B scripts/check-demonic-upgrade-flow.py` additionally passes
**150 cases**: five descriptor-support probes, eighty-five current iterator
states and sixty ordinary accept-loop transitions. Eligibility executes current
`145896530` and supports `1458967f0` for the real `[Cooldown, Duration]` list.
The matrix includes equal uptime and adjacent f32 values, global/equipped timing
changes, saturation, and both sides of each rarity's 0.005 magnitude threshold.
Original selected acceptance `1459673e9..1459674fa` applies ordinary cooldown
subtraction/duration addition, counter and rank wrapping, then the common rank
power increment. Ordered bundles preserve the running cooldown. These selected
branches are exercised in a controlled native frame and stop before downstream
reward/UI work. Source regressions cover these same vectors but remain unrun.

## Static verification and limits

`python3 -B scripts/check-demonic-empowerment.py` passes **183 cases**:
40 upgrade magnitudes, six learned rarities, five direct-factor Medallion scaling
cases, fifty generic scaling exponent captures, twelve aura compositions, nine once-only consumer potency cases, thirty
learn-admission cases, sixteen live-cast gate cases, six repeated-pick cases and
nine native descriptions. The [manifest](evidence/0.112.0/demonic-empowerment/manifest.json)
binds the necessary native ranges and curated REA/Ghidra output; the
[fixtures](evidence/0.112.0/demonic-empowerment/native-cases.json) retain results.

These checks execute bounded original instructions in mapped installed-image
memory. Explicit seams cover allocation, C memory and English localization
fallback. The generic rarity formula is statically traced; direct-factor scaling
fixtures keep Windows CRT `powf` bit parity open. Rust regression source covers
current upgrades, learned rarity, uptime admission, Medallion scaling/modifiers,
uncapped repeated picks and removed rank-power/haste composition. It was not run.
No compiler, game process, real save I/O, translated-resource lookup, rendered
input/UI comparison or original/rebuilt gameplay comparison ran. Native data,
connected source and bounded static results do not establish runtime parity.
