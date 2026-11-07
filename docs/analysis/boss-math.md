# Primary-boss caller arithmetic

Target SHA-256: `8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the bounded arithmetic portion of #34. Integrated status stays
in [verification-needed](../verification-needed.md).

The existing live `bosses::scaling::initial_stats` implementation matches the
current native caller's operand order. No balance constant needed changing.
The boss spawner calls this owner and passes its results through
`make_combat_actor`; these are the actual actor health, damage, speed and reach
inputs, rather than an unused comparison helper.

The [canonical constructor](evidence/boss-catalog/manifest.json) already
retains REA/Ghidra's complete `14592ff90..145930df2` extract. This recovery reuses
it and retains only [compact current vectors](evidence/boss-math/native.json).
Two original-PE ranges, `145930179..145930209` and `14593054f..1459306ae`,
execute the endless gate/exponent, health, damage, percentage conversion,
movement speed, reach and initial-clock writes. The native `SQRTSS` and packed
u16-to-float percentage operations execute unchanged.

Health multiplies definition HP by 5.75, zone scale and difficulty, then the
first power result and HP percentage. Damage uses the square root of zone
scale times difficulty, definition damage, the second power result and damage
percentage. Both power calls occur even with exponent zero. The exponent is
`max((clock-endless_start)/60,0)` only in phase 1 with endless enabled; other
states supply zero. Bases remain 1.22 and 1.096.

`145bc9805` jumps through IAT slot `145d6a330`, imported `powf` from
`api-ms-win-crt-math-l1-1-0.dll`. The supplied EXE does not contain that runtime's
implementation. The check captures both exact f32 argument pairs and injects
declared results; it never substitutes a purported recovered Windows CRT.
Cross-platform `f32::powf` equivalence remains an explicit unresolved boundary.

Run `python3 -B scripts/recover-boss-math.py --check`. **480 cases pass**:
all sixty current bosses across eight ordinary, zero/max-percentage, fractional
endless, future-start, wrong-phase and exact-start profiles. An independent
source-order f32 translation checks the health/damage/speed results. The authored
Rust regression consumes every native result and both captured power calls;
it was syntax-parsed, **not compiled or run**.

The oracle excludes position selection, allocation, entity publication and
subsequent AI. It establishes bounded native caller correspondence, not compiled
Rust, complete combat behavior, Windows CRT equivalence or original/rebuilt parity.
No builds or game processes ran.
