# Run Options gameplay consumers — 0.109.0

Target: installed0.109.0 Windows EXE, SHA-256 `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.

The new-game source previously initialized `RunRules.difficulty` from the weighted Run Options display value while also passing all four percentages into spawn/stat consumers. Current native construction instead initializes the independent difficulty field to1.0. The source now preserves that separation, avoiding an extra aggregate multiplier on enemy health and damage. The four selected percentages continue to reach their individual consumers unchanged.

## Constructor and reader chain

Current new-game factory `0x1458bdf90` calls constructor `0x14592d7e0` at `0x1458be4f1`. These owners and the final handoff already have canonical identities and selected assembly in [run-seed evidence](evidence/0.109.0/run-seed/manifest.json). The new evidence adds only previously unretained constructor intervals and the stat-refresh dependency.

The constructor's stack Game starts at `rbp+0x30`. Its178-byte entry-header copy to `rbp+0x1c8` puts the selected modifier words at Game`+0x2b0`. Instruction `0x14592e624` separately writes the literal float bits`3f800000` to `rbp+0xad8`, which is Game`+0xaa8`. The final path calls current stat refresh `0x145926c90` with this Game, then copies`0xac8` bytes to the returned Game. Neither the modifier words nor the independent difficulty field are replaced by the weighted display value.

The [current boss arithmetic](boss-inputs-0.109.0.md) reads that independent difficulty and applies the separate health/damage/speed percentages. Source ordinary actors, guardians and bosses pass those same `RunRules` fields to their respective scaling helpers. Density is forwarded separately to spawn counts/caps and kill-XP normalization. Correcting the common initial field fixes its consumers without changing the selected modifier words or using the reward multiplier as combat difficulty.

Gear owner `0x145971490` reaches `0x145973090`, passes Game`+0x2b0` to current capped reward helper `0x14590e4a0`, and retains the returned factor in XMM7. The source boss equipment call likewise supplies all four percentages to `equipment_drop_multiplier`; its existing arithmetic matches the current capped expression. This report proves the four-word/factor connection, not the complete candidate selection or random-roll pipeline. The current talent-XP consumer, its density normalization, capped Run Options component and source wiring are independently covered by [terminal account delivery](run-account-0.109.0.md), including1,547 native XP cases.

The uncapped weighted value remains the page's displayed difficulty and the input to the capped reward calculation, as documented in [Run Options](run-options-0.109.0.md). It is not the native constructor's independent Game difficulty.

## Checks and limits

`python3 -B scripts/check-runmods-consumers.py` passes420 constructor-path cases (ten class bytes × seven race bytes × six modifier profiles) and625 actual gear-factor caller executions. Each constructor-path case executes the original entry-header copy and independent-field initialization, the entire current stat-refresh body, then the native final copy. A write watch sees exactly the literal1.0 store to Game`+0xaa8`; output modifier words match the selected values. This deliberately exercises three constructor intervals around synthetic state, not the full constructor/factory.

The manifest records the fresh REA/Ghidra identities and full owner hashes. Raw imports infer a generic ABI and lose some jump tables; original Win64 instructions and full-image data govern the replay. Property-tree insertion and event formatting are explicit output-only seams, ceilf uses the host finite-value operation, and memcpy uses scratch memory. None of those helpers receives the independent difficulty address. The gear check executes the current caller and the real capped helper without substituting its numeric result.

The [manifest and vectors](evidence/0.109.0/runmods-consumers/manifest.json) state these seams and reference existing canonical factory, constructor/final-copy, numeric-helper and XP evidence. Rustfmt parsed the changed gameplay source without compiling or writing. No Rust test, build, application, game, live filesystem or original/rebuilt gameplay comparison ran. Historical ordinary-enemy/spawn mathematics retain their own provenance; this focused repair establishes current entry and modifier connections without asserting their full current gameplay parity.
