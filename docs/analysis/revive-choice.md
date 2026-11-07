# Parallel cooperative revivers

Selected installed EXE: **0.127.0**, 146,721,280 bytes, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
This report owns the new parallel-helper constituent of **#168**. The
[0.119.0 report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/revive-choice-0.119.0.md) retains the original nearby-chooser,
timer ownership and recipient HUD recovery with its historical provenance.

The current party update `0x145bfdac0..0x145c02085` captures a separate
state-1 progress bit alongside the state-1-or-2 nearby bit. Its local snapshot
writes these at `0x145bff07e..0x145bff0b2`; selected nearby indices retain the
existing self/radius interface. At `0x145bff3e0..0x145bff402`, the update sums the
progress byte at snapshot stride `0x10`, offset `0xd`. Choosers remain nearby
interaction rows but do not increase this active-helper count.

The timer at `0x145bff3b6..0x145bff46e` has three branches:

| Selected neighbours | Timer update |
| --- | --- |
| None | Subtract delta, floored at zero. |
| Nearby choosers only | Preserve elapsed time. |
| One or more active fighters | Add `delta * (1 + 0.2 * (active_helpers - 1))`. |

The exact referenced f32 constants are `0x14624c840 = 0.2` and
`0x146232ec0 = 1.0`. The original instructions multiply the extra count, add the
base rate, multiply by delta and add elapsed time in that order. The later
completion threshold and progress-fraction publication are unchanged by this
repair; Heroic V's retained threshold is nine seconds and lower ranks use six.

`coop/game_party.rs::Party::update_revives` now applies this count and arithmetic
through the existing live timer. `gameplay/mechanics/coop.rs::tick_party` still
captures before mutation, writes both local and remote elapsed values back,
applies completion and republishes the party snapshot. Interactions continue to
include nearby choosers and expose the updated fraction to the existing HUD and
addon consumers. No new timer, packet or UI owner is introduced.

[Current proof](evidence/0.127.0/revive-choice/manifest.json) binds two journaled
Ghidra queries to the exact declared PE slice, their original results, selected
native instructions and constants. Run the maintained checker without compiling:

```sh
PYTHONPATH=runtime/armory-recovery/python-libs:runtime/camera-recovery-0.105.0/python-libs python3 -B scripts/check-revive-choice.py --parallel-current
```

The check passes **496 isolated original-instruction cases** over zero through
four selected neighbours, every fighter/chooser bit combination, deltas and
elapsed times. It also checks the actual timer/writeback source connections.
Authored Rust regressions cover local/remote recipients, one through four active
helpers, chooser transitions and interaction fractions; they are uncompiled and
unrun. Compilation, actual choice/network/HUD scheduling, gameplay and
original/rebuilt parity remain unverified. Static instruction replays use scratch
memory and do not launch the application or a service.

## Retained reports

[0.119.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/revive-choice-0.119.0.md)
