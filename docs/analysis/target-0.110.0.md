# Reconstruction target: 0.110.0

**Historical target:** this report covers 0.110.0 only. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the installed target and current limits.

The installed AMD64 PE is 140,523,520 bytes, SHA-256
`e069bf3152f8d8f7160d66388907fc181c733bd170aa150d3b7ff7adf251e048`.
The [identity manifest](target-refresh-0.110.0.json) retains the registered version
markers and the complete nine-MPQ chain. The eight earlier archives are unchanged;
`patch-9.MPQ` adds 5,739,608 bytes, SHA-256
`ffff8ea890bdaf91a1680543ac60106db92132bc2210105279610fa73661a524`.
Archive identity does not establish compatibility or resource presentation.
Installed inputs remain read-only; no reference EXE/MPQ copy is retained here.

The [complete PE inventory](evidence/0.110.0/native-summary.json) contains 347,073
unwind extents, 631,690 relocation sites, 420 imports and 725 diagnostic paths
(53 custom, 672 engine). No diagnostic filename was added or removed relative
to 0.109.0. Complete inventories also retain embedded scripts/UI, configuration,
type/module, resource and ID leads. Changed packed literals are leads rather
than new function/behavior claims. [Discovery differences](evidence/0.110.0/discovery-leads.json)
record the reviewed category counts and relevant current leads.

The [diagnostic pass](evidence/0.110.0/diagnostic-ownership.json) verifies 17,681
references across 5,945 candidate extents, including all custom paths.
[Declared code](evidence/0.110.0/instruction-summary.json) and
[executable complement](evidence/0.110.0/unwind-complement-summary.json) are fully
accounted separately from [Ghidra body recovery](native-census-0.110.0.md).
Neither byte coverage nor diagnostic identity establishes source equivalence.

[0.109.1 and 0.110.0 release notes](../CHANGELOG.md) are supplied and indexed
individually. Boss tower removal, demon cadence/lifecycles/talents, achievements,
looks, summon APIs, combat logging, menu scrolling, Hunter equipment and
translations are pending native/source review under their existing owners.
Earlier current-target claims are now historical assessments, not certified
0.110.0 implementations. Selected #1/#6 recovery is recorded in its owning
reports. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the current limits.

No compilation, compiling tests, games, runtime or original/rebuilt comparison
was performed. The package version denotes the selected target, not parity.
