# Stored levels and choice presentation

This report retains its 0.100.1 provenance. The selected 0.105.0 card sizing,
font and footer correction is owned by [card layout/font recovery](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/card-layout-0.105.0.md).

Updated 2026-10-19 against the selected supplied EXE, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
The [current manifest](evidence/0.100.1/upgrade-flow/manifest.json) binds five
complete native owners to their PE bytes and fresh REA/Ghidra evidence. External
constants, calls and Windows arguments are checked against the original PE;
raw Ghidra imports alone do not recover those dependencies.

## Completion and storage

Current XP owner `1454c69e0` updates earned levels and stats immediately. With
`storeLevels` enabled, offers wait until spending is requested. Both
`storeLevels` and `spendLevels` register with default `0`; the current Controls
descriptor and stored-level HUD are documented in the
[target/menu report](target-menu.md). The real client CVar registry and
the embedded current addon API carry these controls, including changes from Lua.

Shared completion `1454edd70` gathers eligible experience pickups already in
flight or within the actual pickup radius. It adds their raw u32 amounts first,
then applies the experience multiplier and imported `roundf` once. Rounding
each orb separately gives different results and is not used. Distant idle orbs
remain in the shared collection.

Completion gives pending cache rewards priority, then drains queued levels
while automatic offers or explicit spending permit it. Selecting a cache reward
does not consume a stored level. When no offer remains, completion clears
spending and replaces player aura spell `1020` with the native one-second
resume effect (status tag 11). Skip and reward acceptance use this same owner.
The application resets the spending CVar after draining and preserves the
real client's pause/input ownership.

## Cards and description inputs

Current `14021ce50` supplies entrance, hover, shadows and selected-card exit.
Selection waits through the native `.32`-second opening gate and `.32`-second
exit; ordinary mouse and digit selection share that lifecycle. Reroll, banish
and skip rebuild the current offer when its payload changes. Consecutive
identical offers still receive a new opening clock. Pausing and resuming
refresh button eligibility without losing the offer's opening time.

The current animation and ray-image owner `14021e120` drive native angular
white rays, placement and rotation. Replacement footers and their expanding
comparison tooltip use the current native hierarchy, rank and description
inputs; the [treasure report](treasure-pipeline.md) owns those constants.
The footer explicitly passes focus to its parent card, as established by the
[typed native bundle recovery](footer-focus.md).

Descriptions use live maximum health, damage, cooldown, area, buff potency,
DoT tick bonus and global targets. Preview spell modifiers apply before rarity;
learned instances retain their actual upgrades. The current source-writer
fixtures cover all 112 ability templates, including Lightwell's four native
target/overlap forms and the area softening branch. Historical layout findings
retain their recorded version until a current owner or comparison confirms them.

## Validation and remaining work

The latest combined check passed45 library and147 application tests
(`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/shared-serial-integration-r14b.log`), including
stored-level draining, immediate level stats, combined-XP rounding, cache/level
isolation, repeated identical offers and pause eligibility. An earlier broad
check passed220 library, binary and selected integration cases
(`combined-regressions-r8.log`). The current source-writer
cases compare 338 description scenarios and 1,120 upgrade bundles containing
5,600 lines with unchanged selected-PE instruction output.

These results validate source behavior and bounded native arithmetic. The Mac
locked during isolated QA, preventing the rebuilt card interaction comparison.
No current original/rebuilt treasure replacement, multilingual wrapping, hover
or GPU color-space parity is claimed. Complete menu typography, other tooltip
owners, Windows behavior and long-run interaction remain unverified. No binary
or embedded font asset is required to build this source.
