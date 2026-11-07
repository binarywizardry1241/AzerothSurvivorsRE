# Options choice-label bounds

Gap **#41** recovery is bound to the installed EXE SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The complete formatter `14012de80..14012e2cb` rounds a numeric choice value,
converts it to a saturating unsigned index and clamps that index to the last
choice. The live source `Definition::formatted` previously used an unclamped
lookup, displaying the invalid raw value when the index exceeded the list.
It now applies the native upper bound before reading the label.

For example, `WorldDetail=1000` displays **High**, as the original does, rather
than **1000**. Negative values and NaN select the first label; positive infinity
selects the last. Empty lists have no current descriptor producer; the source
retains its safe fallback for that unproved input.

The [45 native cases](evidence/options-choice-labels/cases.json) execute
the complete original formatter with all three actual choice descriptors:
WorldDetail, spellEffectLevel and weatherDensity. They cover half-step rounding,
negative/oversized values, signed zero, NaN and both infinities. Eight cases
demonstrate the previous source mismatch. Allocation, byte operations and roundf
are explicit fixture seams; the original empty-registry English fallback runs
unchanged. The actual Options value-label widget calls the corrected method.

[REA provenance](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.112.0/options-choice-labels/rea.json) retains the
fresh Ghidra query and address-preserving carrier identity. Its generic ABI and
missing switch-table context do not supply Rust types or a closed incoming tag
domain. The exact Win64 replay establishes this selected formatter contract;
it does not widen current descriptor inputs to every mutable UI caller.

Reproduce without compiling or launching the game:

```sh
python3 -B scripts/check-options-choice-labels.py
```

The changed Rust syntax parses. Compilation, actual configuration/input/UI
execution, localization/rendering and original/rebuilt parity remain unverified.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the remaining #41 boundaries.
