# Demonology composition and army offers in 0.105.0

The supplied target SHA-256 is
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
Current implementation status belongs to [verification-needed](../verification-needed.md).
This report owns the current talent composition, Demonic Empowerment and the
Legionlord's Medallion portion of gap #24, plus its direct Scorched Earth
dependency within gap #16; it does not establish runtime parity.

## Current talent and effect boundary

The current 120-byte native talent record starts **32 bytes before** the key
addresses retained in the earlier [selected audit data](evidence/0.105.0/game-mode-audit/selected-data.json).
Its two optional prerequisite strings occupy +0/+16, followed by key/name/icon,
effects at +80, description at +96 and row/column/rank/exclusive flag at
+112..+115. The [current records](evidence/0.105.0/demon-offers/native-cases.json)
retain the full-record hashes and both prerequisites.

The source overlays the Warlock Demonology tree with its 14 current entries.
Soul Devourer and Soul Link each require a fully learned Demonic Familiar and
exclude the other flagged choice in their row. Legion Gate requires either
companion at its own maximum rank; both capstones require Legion Gate and
exclude each other. Native owners `1458e2070`, `1458e27c0` and `1458b9220` establish
the exclusive-row and OR-prerequisite consumers. Tree/save key refunds and
migration remain separate gap #12 work.

`run_effects::demon_talents::Config` carries current army ranks and numerical
bonuses to the special actor owner. Numeric current variant35 rows translate
into the historical compositor's stat30 representation. Other current special
variants are not allowed to alias historical stat30/spell31. Current variants33
and34 retain their ordered cast-proc positions through internal tag253, with the
original variant in byte63 and the allocated variant33 rank in byte1. The generic
callbacks ignore these markers; the current cast-proc consumer owns them.

The saved talent definitions and live effect catalog use the same current keys.
They retain current names/icons for effect provenance. This also prevents removed
historical `summon_imp`, `felguard` and other Demonology rows from silently adding
old followers or effects alongside the reconstructed army.

Scorched Earth retains the existing `aftermath` save key in Destruction, with
its current name, icon, prose and two exact selected effects. Current variant36
selects Hellfire by key and adds 5% power per rank; only its internal tag
translates to historical spell31. Current variant8 remains variant8: each
rank adds 5% proc chance, retaining status1, .4 slow magnitude and three seconds,
condition0 at +24 and the Hellfire key selector at +32/+40. The current full
record has no prerequisite or exclusive flag. The other Destruction records
retain their previous provenance: gap #16 remains open for Shadow Dance and
Shadow Weaving.

The current native Infernal owner `14594f779..14594f7bc` captures those exact
variant8 fields for its separate per-victim slow application. Generic source2
callbacks reject key selectors, so they do not also apply that slow. The
Infernal owner therefore consumes the selected status explicitly after its
canonical hit. The same keyed power row reaches ordinary Hellfire and the
captured Infernal spell through the current spell-modifier owner.

## Demonic Empowerment

The current descriptor at `146baf508` adds the spell to the real Warlock ability
pool: ID18708, kind9, school5, 25-second base cooldown, eight-second base duration,
30% damage and 15% haste. Its upgrade order is **0, 5, 4, 1**: damage, demon attack
speed, duration and cooldown. Native player instances now have six upgrade
counters and separate additive demon-damage/haste lanes.

The native upgrade magnitude/apply owners `145986de0`/`145987150` add damage and
haste independently. Damage bonus stops at .45 above the descriptor's .30; haste
bonus stops at .30 above .15. Power and haste increments by rarity are
.02/.04/.06/.10/.15. Cooldown increments are .03/.05/.08/.12/.15 and stop at the
remaining .20 multiplier. Duration increments are .5/1/1.5/2.5/4 base seconds,
converted to the instance multiplier and capped at six. Saturated kinds disappear
from the existing upgrade offer iterator. Learned rarity adds damage to the same
additive lane rather than the ordinary multiplicative power field.

Native learn-offer builder `145951c10` requires an eligible special demon producer;
Demonic Supremacy excludes lesser producers from that predicate. The live cast
also requires a nearby enemy and a currently present special combat demon.
The self-buff branch `1459232ec` computes, in order:

- damage = (descriptor damage + additive damage) × effect strength × qualified
  spell-power modifier;
- haste = (descriptor haste + additive haste) × effect strength.

Ordinary rank-power growth does not enter these formulas. Both numbers occupy
one tag10 status payload, respectively +4 and +8; the separate aura deadline owns
its duration. These values are not clamped again after equipped modifiers. The
source tooltip and upgrade lines use the current demon-damage/attack-speed text
and absolute base-second duration increments.

The description is the exact134-byte literal at `1471b3c73`; branch
`14597028f..145970431` passes it to localization lookup `1458da590`, then
substitutes `d`, `h` and `dur`. Its displayed damage/haste additionally multiply
by `1 + buff_bonus` and100, with native precision0 formatting. Duration uses
the ordinary1.4-scaled duration and native number formatter. The retained
Ghidra branch identity and36 numeric replay cases bind this text and its
displayed values to the selected EXE.

## Legionlord's Medallion

Bounded original constructor execution recovered four key-selected variant36
spell modifiers: +100% duration, +60% power, .35 multiplicative cooldown reduction
and +100% effect strength. Only their internal compositor discriminant is
translated to historical spell31. The new modifier7 remains explicit.

Native `14587af80` and `1459a9020` preserve those amounts through rank3. From rank4
to rank10 they interpolate with `(clamp(rank, 3, 10) - 3) / 7` toward +200%
duration, +150% power, .75 cooldown reduction and +200% effect strength. Native
cache eligibility `145959d5d` suppresses the empowerment seed at rank10;
acceptance `14595db8f` also clamps repeated-key rank growth to ten.

Current spell composition `1458e3a30` has two additional lanes. Key/list-selected
power contributes to a dedicated demon-power multiplier; broad school/all power
does not. Modifier7 multiplies a separate cooldown factor by
`1 - clamp(amount, 0, .95)`, preserving the ordinary additive cooldown stage.
The source applies these lanes to real learned instances and to captured demon
spell proxies. The amulet's damage therefore reaches Empowerment's damage
payload rather than disappearing into its zero base-power field. At rank10 the
amulet yields modifiers 3× duration, 2.5× qualified demon power, .25× additional
cooldown and 3× effect strength.

Searing Pain's current descriptor at `146baf328` has base power50 rather than the
historical source's40; the source definition now supplies that selected-target
value to ordinary and captured Pit Lord casts.

## Static checks and limits

`python3 scripts/recover-demon-offers.py --check` verifies the selected
EXE, 20 retained native instruction scopes, both selected spell descriptors and
both source data overlays. It executes only bounded unchanged native instructions
in Unicorn: 15 talent-record checks, two Scorched Earth payload checks and
10 Hellfire-key modifier cases, four constructor effects, 10 amulet rank
boundary cases, 120 upgrade-cap cases, two spell-modifier selector cases and
12 buff-payload cases and36 description-number cases passed. Allocation/heap
growth, locale misses and rounding have reviewed host seams. No process, OS, networking, file or renderer code runs.

[The manifest](evidence/0.105.0/demon-offers/manifest.json) preserves exact byte
hashes, containing procedures, canonical assembly paths and selected REA/Ghidra
Evidence identities. Raw imports omit external code/data and use Ghidra's generic
ABI; original Win64 instructions control argument bindings. Branch excerpts are
not presented as separate native functions. Detailed provider responses remain
under ignored `runtime/`.

Changed Rust files and regression tests were parsed with the installed formatter;
`git diff --check` passed. The Rust regressions were authored but **not compiled
or run**. No build, game launch, original/rebuilt interaction, presentation or
runtime parity check was performed. Those limits remain open for gap #24/#8.

Historical112-entry description fixtures retain their original Searing Pain
power40 through an explicitly historical descriptor copy; separate current
regressions check the113-entry catalog and power50 against native descriptor
bytes. The mixed talent catalog now contains355 rows, including14 Demonology
entries, while historical fixture files remain unchanged.
