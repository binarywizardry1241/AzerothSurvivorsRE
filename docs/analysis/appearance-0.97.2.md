# Current menu appearance behavior — 0.97.2

Recovered2026-10-18 from the supplied0.97.2 EXE, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This is static REA/Ghidra/Win64 instruction recovery and source implementation.
No builds, compiler checks, tests, emulation or original/rebuilt launches ran.

## Optional counts and normalization

The packed native order is skin, face, hair style, hair color, facial hair.
Clamp helper `0x145500d30..0x145500e7e` asks global cache getter `0x145501470`
for an optional catalog, then race/sex lookup `0x145625c70` for five u8 counts.
If either option is absent, it returns all original feature bytes unchanged.
Otherwise each byte becomes `min(feature, count.saturating_sub(1))`; zero count
therefore produces feature0. This is a clamp, not a modulo operation.

`save::appearance::install_ranges(AppearanceRanges)` publishes the optional
`BTreeMap<(u8,u8),[u8;5]>` once. `normalize_features(race,sex,features)` uses it;
`normalize_with_ranges(..., Option<&AppearanceRanges>)` exposes the pure formula.
Save parsing and full-Pick commands use this helper. Parent integration publishes
the existing loaded character catalog and normalizes the live selection after
asset load, without requesting a save merely because assets became available.
No persistence emission was established from native cache fill.

The native count producer's complete MPQ/DBC traversal was not recovered here.
The source's existing character-creation catalog supplies the counts; this pass
revalidates how the current EXE consumes optional counts, not every asset choice.

## Class, race and sex

Current class selector `0x14541dae0..0x14541dcc3` restores a saved eight-byte
hero for the selected class. A fresh class retains sex, preserves race when
eligible or selects the first eligible race in the previous faction, falling
back to the class's first race. It clears all five feature bytes. Eligibility
is independently re-read from current native tables in the save manifest.

Race and sex actions have different behavior from fresh class selection.
Dispatcher `0x1403a32d0..0x1403a3f5f`:

| Native branch | Behavior |
| --- | --- |
|`0x1403a3989`|Set race at Pick+0x39; preserve the five feature bytes; clamp against new race/sex|
|`0x1403a3a31`|Set sex at Pick+0x3a; preserve features; clamp against new race/sex|
|`0x1403a3ca3`|Pass current features, race, sex, feature index and signed delta to cycle helper|
|`0x1403a37c9`|Sample the clock, then call native appearance randomizer|

Each appearance branch copies the complete Pick into command11. Race and sex
branches do not skip a repeated selected value. `MenuState::choose_race` and
`choose_sex` now preserve/clamp features and commit again on such presses. The
earlier source reset-to-zero behavior was a concrete mismatch and is removed.
Menu integration delegates sex/feature controls to these recovered state methods.

## Feature cycle and Randomize

Cycle helper `0x145500c50..0x145500d24` first clamps all features. It wraps only
the chosen feature with Euclidean remainder over `max(count,1)` after adding
the signed i8 delta. A missing count uses1, so the selected byte becomes0 while
the other bytes remain as returned by the optional clamp. Source
`cycle_features` and `MenuState::cycle_feature` implement this order.

Randomize `0x145501240..0x1455013f5` samples a new clock-derived nanosecond seed
for every action, with7 as failed-clock fallback. It XORs
`0x9e3779b97f4a7c15`, then advances xorshift13/7/17 five times, choosing each
byte modulo `max(count,1)`. Missing cache/counts use five ones. The previous
source used unrelated long-lived menu RNG state; the single Armory Randomize
arm now calls `MenuState::randomize_features`, backed by this fresh-seed helper.
Native Windows FILETIME conversion and portable `SystemTime` have equivalent
Unix-nanosecond intent; platform clock-failure behavior was not executed.

## Evidence and remaining bounds

The [appearance manifest](evidence/0.97.2/appearance-0.97.2.json) records native
bounds/byte hashes, assembly paths and completed REA evidence IDs. The
[save report](menu-save-0.97.2.md) owns parser normalization, first Pick selection,
per-class persistence, names, item compatibility and envelope operations.
Reproduce static extraction with `python3 scripts/recover-menu-save.py`;
its generated REA plans use `./scripts/rea` through `rea-batch.py`.

The source changes are uncompiled, tests are authored but unrun, and the actual
post-layout scheduling and asset-load integration are not runtime validated.
No drag-yaw multiplier, turn-button angle or initial-yaw value was established
by this dispatcher. Character preview rendering remains owned by the separate
[hero-preview report](hero-preview-0.97.2.md). This evidence establishes recovered
formulas and implemented source, not visual or functional1:1 parity.

The save report additionally owns current normal/PvP preview descriptors and the
Horde-only PvP first-to-second-table resolution. Saved gear IDs remain unchanged.
