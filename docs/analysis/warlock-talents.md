# Warlock talent definitions and descriptions

Target SHA-256: `dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This report owns the current definition and rank-description part of #12;
[verification-needed](../verification-needed.md) owns integrated status and remaining gaps.

The three current Warlock tree descriptors at `14723e9d8` select 40 records,
including fourteen Demonology records. Their current stride is 160 bytes.
The current menu/allocation catalog overlays only class 9 from the
[source asset](../../crates/azeroth-survivors-re/assets/warlock-talents-0.112.0.json).
Other classes retain their own documented provenance. Rows, columns, ranks,
primary/alternative prerequisites and exclusions come from those current bytes.
Moved Affliction and Destruction definitions are included because they share the
persisted Warlock allocation. This does not revalidate all their gameplay effects.

The [definition proof](evidence/warlock-talents/definitions.json) binds every
record and effect span to installed bytes. The [native manifest](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.112.0/warlock-talents/manifest.json)
retains the formatter and milestone classifier once. Ghidra Evidence
`ev_1d2d17f97df3d2640d326b9968951d15c926c9127dc0a980a6ba42c189fe1673`
recovers formatter `14599ddf0..14599e1ee`; original instruction replay supplies
its exact rank-dependent text. A per-rank float slice at +32/+40 overrides the
rank when present. The two effect-derived substitutions independently own `{v}`
and `{v2}`. The additional description at +128/+136 has its own f32 coefficient
at +144 and is appended for every inspected rank, independently of allocation.

The live description helper now substitutes the two base numeric lanes and
appends that separately localized Supremacy line. Familiar shows Infernal
Hellfire 1–5%; Soul Devourer shows Doomguard boss/elite damage 2/4/6%; Soul Link
shows damage reduction 1/2/3%; Legion Gate shows its fixed 12-second empowered
attack rule. Current Soul Devourer displays 0.5/1/1.5%; Doom Bringer displays
60/120/180% caps; both capstones display 20 seconds. The current page calls the formatter with the allocation rank (zero displayed
as one) at `1401682fd` and the next rank at `1401685d1`; compact caller
instructions are retained in the same manifest. These observed description
numbers do not prescribe the separately recovered combat formulas.
Scorched Earth's damage
and slow-chance placeholders remain independent.

`python3 -B scripts/check-warlock-talents.py` verifies all 40 definition
records, milestone flags and 122 rank descriptions against the installed target.
It executes original instructions in bounded memory with the shared allocation,
C-memory, imported `roundf` and explicit English localization-fallback seams.
No compiler, game process, save-file I/O, translated-resource lookup, rendered
input/UI comparison or original/rebuilt parity check ran. Current allocation
normalization and stored/live specification checks are separately owned by
[talent allocations](talent-allocations.md). Current run-entry effect
projection and its consumer limits are separately recorded in
[Warlock effects](warlock-effects.md).
