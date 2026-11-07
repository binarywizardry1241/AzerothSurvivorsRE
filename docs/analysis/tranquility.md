# Tranquility critical preparation

Selected installed EXE: **0.119.0**, 145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This completes the source correction for **#176**, with compilation, gameplay,
combat-log presentation and original/rebuilt parity still unverified.

## Native contract and source correction

The canonical [Druid evidence](evidence/druid-release/manifest.json)
retains the full pulse branch `145bc5784..145bc5a51`, its exact instruction
bytes, original journaled REA/Ghidra result identities and the shared
source-kind-three exclusion `145bd983b..145bd985a`. The
[release contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-contracts-0.119.0.md#176--tranquility-rolls-a-critical-for-every-selected-victim)
explains the native producers and call boundary. No duplicate native extract
or new Ghidra query was needed for this repair.

`gameplay/mechanics/callbacks.rs::pulse_healing_pool` now consumes one
`behavior::unit24` draw from the run's existing RNG immediately before each
selected victim's synchronous hit. It then reads `CastPort::critical` from
live stats, compares `draw < chance`, and applies the spell-critical multiplier
only on success. Chances zero or one still consume a draw; equality and
unordered/NaN comparisons do not critically hit. Reading and hitting inside
the loop preserves any intervening RNG/stat changes from canonical processing.
The existing pool/deadline gates, visual event and target sequence are retained.

The attributed effect-hit helper now accepts the prepared critical flag.
Tranquility keeps spell **740**, Nature school **3**, the player source GUID,
`[1,0,effect_index_low,effect_index_high]` attribution and normal damage logs.
Source-kind **3** remains set around the canonical hit and is restored afterward.
Other generic-effect hits continue to supply `false` and consume no new draw.

`hit_with_execution` still calls the existing canonical actor/boss/ward hit
consumers. Their damage events already carry `hit.critical`; the actual
`gameplay/client/events.rs` consumer maps it to the spell-damage-log critical
flag. `run_effects::hit_event` rejects source-kind three before consuming first
hit/critical tokens, so generic hit and generic kill callbacks remain suppressed.
The class-special hit adapter's critical-specific Seal Fate gate requires
source-kind zero. Canonical death, loot, healing/leech and class maintenance
remain connected through their existing owners; this repair does not claim
newest-target recovery of their complete historical bodies.

No additional critical-dependent source omission was found in that trace.
The independent Rejuvenation and grouped-icon repairs remain **#177/#178**.

## Static checks and limits

```sh
# Use the repository's existing Python dependency installation for Unicorn.
PYTHONPATH=runtime/tool-state/python/armory/python-libs python3 -B scripts/check-tranquility.py
```

**388 cases pass** against the selected original instructions from
`145bc593b` through `145bc5a2e`, after verifying the target, full pulse range,
source-kind gate and `2^-24` constant hashes. Inputs cover four RNG states,
zero/one/four victims, chance zero/one/outside the unit interval/NaN/exact draw
and adjacent float values, and ordinary/zero/NaN multipliers. Four cases
interleave explicit simulated hit-side RNG consumption and live stat changes.
Each called hit is checked for target order, power bits, spell, school,
critical byte, ordinary-log byte, source-kind and exact RNG state. Completion
also checks restored source-kind and unchanged RNG for zero victims.

Actor-hit calls are hooked seams: these cases execute bounded original
instructions in Unicorn, not the application or the rebuilt Rust. Independent
scalar RNG/arithmetic expectations and focused source wiring assertions catch
pre-rolling, skipped draws, wrong comparison/multiplier, lost attribution or
critical flags, and removal of generic-effect suppression. Damage-log wiring
and canonical hit/death dependencies were reviewed in source, not executed.

The shared Druid evidence check additionally verifies all twelve original
journaled queries, twelve ranges / 4,658 bytes / 1,072 decoded instructions,
and its reviewed source receipts. `git diff --check` passes. No application
build, compiling test, game/client/network/server execution, save/configuration
mutation, visual comparison or original/rebuilt gameplay parity was performed.
