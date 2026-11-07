# Armory compact-stat formatting

The installed target is SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This report owns finding **#236**'s compact-stat formatter. Its collection and
detail-screen consumers have separate source ownership. Overall status remains
in [verification-needed](../verification-needed.md).

Native `145af3ef0..145af46a6` selects all fifteen compact-stat localization keys
by the stat's unsigned tag:

| Tag | `bonus.` key | Numeric argument |
| --- | --- | --- |
| 0 | damage | Percentage rule below |
| 1 | cooldown | Percentage rule |
| 2 | hp | `roundf(value)` |
| 3 | crit | Percentage rule |
| 4 | crit_damage | Percentage rule |
| 5 | speed | Percentage rule |
| 6 | armor | Percentage rule |
| 7 | regen | Fixed one decimal of the original `f32` |
| 8 | pickup | Percentage rule |
| 9 | gold | Percentage rule |
| 10 | area | Percentage rule |
| 11 | count | Original `u32` count |
| 12 | echo | Percentage rule |
| 13 | calm_regen | Fixed one decimal after `f32(value × 100)` |
| 14 | crowd_armor | Percentage rule |

For the percentage rule, first compute `p = f32(value × 100)`. If `abs(p) < 10`,
the localization argument is `f32(roundf(f32(p × 10)) / 10)`. Otherwise it is
`roundf(p)`. `roundf` rounds halfway away from zero. The threshold and each
intermediate rounding operate in binary32, so promoting the arithmetic to
double or formatting the unrounded percentage can change boundary results.
Tags 7 and 13 use the same native precision descriptor at `14765c0fc` and
formatter function `145fcf720`; their trailing decimal remains visible.

`armory.rs::native_percent` and `localized_bonus` now follow this selection,
arithmetic and fixed precision, including the two current Heroic-era stat tags.
The source's typed stat projection supplies the count as a numeric value; this
proof retains native tag11's unsigned integer width independently.

The [manifest](evidence/armory-stat-format/manifest.json) binds the saved
Ghidra query, raw subject, jump table, precision metadata and original bytes.
Ghidra's decompiler did not resolve the fifteen-target jump table; the saved
result records that limit. The checker decodes the complete bounded function
and replays its actual indirect branches and arithmetic instead of treating
that prefix as a full decompilation.

`scripts/check-armory-stat-format.py` passes **284 cases**, including
adjacent binary32 values at tenth/whole-percent boundaries, negative values,
fixed precision ties and full-width `u32` counts. All **384** decoded
instructions are visited across **15,690** original instruction steps. The
[result](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.121.0/armory-stat-format/static-check.json) records exact
numeric argument bits, keys, format descriptors and declared seams.

The CRT `roundf`, fixed one-decimal formatter and locale-format interfaces are
explicit synthetic seams. The native formatter's argument preparation executes;
the final original localization and string formatting do not. These checks do
not execute reconstructed Rust or establish final rendered text parity. No
compilation, game/application/client/network/server execution or original/rebuilt
comparison ran.
