# Primary bosses and dimensions

The supplied Windows x64 EXE is authoritative: SHA-256 `8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`. This recovery reads its data and replays bounded instructions; it does not execute the game, compile source or establish original/rebuilt parity. See [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) for current remaining gaps.

All **60 primary bosses across twelve zones**, **191 ability records** and **ten fixed placement points** have been independently re-read from this target. The [canonical retained catalog](evidence/0.105.0/boss-catalog/catalog.json) records every name/yell, row, ability word, float bit, source address and span hash. Zone table `0x146ba9450` has stride `0xf0`; each zone's boss pointer/count is at `+0x88/+0x90`, and fixed-point pointer/count at `+0x68/+0x70`. Boss rows remain 88 bytes; abilities remain seven 32-bit words.

[Guardian catalog source](../../crates/azeroth-survivors-re/src/guardians/catalog.rs) remains the single owner of boss definitions. [Boss catalog source](../../crates/azeroth-survivors-re/src/bosses/catalog.rs) reexports those definitions and owns fixed spawn points. Enemy/guardian definitions retain their historical provenance; this recovery does not relabel them.

## Source corrections

Three Naxxramas scales had changed since the source's 0.100.1 refresh. Both model scale and contact reach now consume the current values:

| Boss | Previous source scale | Selected scale and bits | Previous source reach | Selected reach |
| --- | ---: | --- | ---: | ---: |
| Patchwerk | 1.41 | 3.0 (`0x40400000`) | 5.615 | 8.0 |
| Sapphiron | 0.35 | 0.95 (`0x3f733333`) | 4.025 | 4.925 |
| Kel'Thuzad | 1.74 | 3.1 (`0x40466666`) | 6.11 | 8.15 |

Anub'Rekhan's 1.9 and Noth's 4.45 scales already matched. All remaining non-scale boss numeric fields, names, abilities and points match the 0.97.2 definitions. The current table also adds **22 entrance voice IDs** at row `+0x50` and changes Edwin VanCleef's yell to `Lapdogs, all of you!`; the canonical source now includes both. Voice dispatch is owned by [the entrance-audio report](boss-voices.md).

The live [boss spawner](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs) supplies each definition to `bosses::scaling::initial_stats`; `make_combat_actor` installs its computed reach into the common actor. The [visual adapter](../../crates/azeroth-survivors-re/src/gameplay/visuals.rs) reads the same definition scale for real-client model delivery. There is no second boss scale table or special Naxxramas override.

## Current native contract

Current primary-boss creator `0x14592ff90..0x145930df2` directly uses the current table. Its [shared canonical assembly/pseudocode manifest](evidence/0.105.0/boss-catalog/manifest.json) retains the full function, ten constant spans and REA/Ghidra Evidence `ev_4013bdef3f794cf06df3c99ac1f48cfbd0958abc4c64e4dd43e722251fb2c9bc`. The hash-checked raw slice is imported at its original PE address; external functions/data are absent from that Ghidra import. Original PE instructions and separately checked constants govern those operands and the Win64 ABI.

At `145930241`, row `+0x38` becomes the model scale. `145930588..1459305a8` computes single-precision `scale * 1.5 + 3.5` followed by `MINSS 9.0`. Native unordered/equal handling chooses the second operand. `145930622` installs the reach and `14593062a` installs scale into the actor being copied. The existing source formula already matches, so the correction belongs in the canonical dimensions rather than a new reach formula.

The current constant spans also confirm HP multiplier 5.75, endless bases 1.22/1.096, cooldown factor 0.6 and percentage divisor 100. This is a constant/operand revalidation, not a complete replay of current health/damage construction or proof that host `powf` matches the Windows CRT.

## Static checks and remaining limits

`python3 scripts/recover-boss-catalog.py --check` passes. It verifies the full target hash, current row/ability/string bytes, canonical Rust literals, all twelve zone centers/radii/scalars/placement angles, ten point coordinates and the live scale/reach source consumers. **69 bounded native reach cases** replay the current five no-call instructions in Unicorn: all sixty boss scales plus zero, signed zero, negative scale, three cap-adjacent scales, infinities and NaN. [Native vectors](evidence/0.105.0/boss-catalog/reach-native.json).

The [portable catalog regressions](../../crates/azeroth-survivors-re/tests/boss_catalog.rs) now assert every selected-target field and replay the retained reach results through the source constructor. The older HP-factor regression retains its 0.100.1 fixture; superseded boss scale assertions now belong to the selected-target catalog check. The historical 0.97.2 full-constructor vectors keep their declared original scales.

Changed Rust files parse with the existing `rustfmt` parser; Python source parses with `ast.parse`. Rust regressions, compilation, actor/terrain interaction, visual model/reach comparison and audible playback are **not run**. This completes the source/data portion of #34's boss dimensions; gameplay and presentation comparison remain open.

For a fresh static Ghidra extraction, `--prepare-rea` stages the hash-bound creator slice/plan under ignored `runtime/analysis/history/raid/boss-catalog/58c176b71827`, then `python3 scripts/rea-batch.py runtime/analysis/history/raid/boss-catalog/58c176b71827/constructor-plan.json` uses the project `./scripts/rea` wrapper. The default catalog recovery stages outputs under that same ignored directory for review. Normal application builds need neither the reference EXE nor these recovery tools.

## Retained reports

[0.97.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/boss-catalog-0.97.2.md)
