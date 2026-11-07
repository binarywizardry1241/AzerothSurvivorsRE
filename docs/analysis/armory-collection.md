# Armor-only collection progress

Selected EXE: `3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`,
146,721,280 bytes. Historical collection evidence retains its original target.

The selected whole-image instruction inventory maps the collection summary to
`1401277d0..140127f0f`, calling row renderer `140364210..140365df2`.
Its prefix explicitly supplies the owned-rank collector with the interval
`[0,8)` (`1401278be..1401278ce`) and writes the star denominator as forty at
`140127997`. Owned ranks alone enter the numerator. Class weapon counts no
longer select either the denominator or the row's slot domain. The current
[collection proof](evidence/0.127.0/ranked-gear/collection.json) retains the
exact target bytes and native-derived inputs/results.

`collection_set_progress` now constructs eight armor positions, including
unowned placeholders. Its shared projection feeds the star numerator,
denominator and individual five-segment bars. Four/eight-piece gates retain
their existing armor-only rank predicates. The selected-item details consumer
already gates set rows on `p.slot < 8`; that source guard is preserved, with its
historical native provenance, and no missing weapon guard is claimed.

`check-armory-collection.py --proof
docs/analysis/evidence/0.127.0/ranked-gear/collection.json` passes **120 current
original-instruction prefix cases / 10,372 steps**, across both class weapon
counts, all six tiers, absent/partial/full armor, and weapon-only ownership.
The native interval `[0,8)` is asserted before the synthetic owned-rank
collector returns; rendering is outside this prefix. The Armory Rust regression
consumes these current summary results and retains weapon ranks in its inputs
to detect accidental inclusion. It remains uncompiled/unrun.

The exact instruction contract and replay resolve the eight-slot/count question;
this prefix proof does not claim decompilation of the complete page. Compilation,
UI interaction, rendered bars and original/rebuilt comparison remain open in
[verification-needed #236](../verification-needed.md#gap-236).

## Retained reports

[0.121.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/armory-collection-0.121.0.md)
