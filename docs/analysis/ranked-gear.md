# Gear star stat projection

Selected EXE: `3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`,
146,721,280 bytes. Historical catalog/repair evidence retains its original target.
The current [star proof](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.127.0/ranked-gear/stars.json) binds native
ranges/data, four successful journaled Ghidra queries and live source consumers.

## Final-star effects (#230)

Current total owner `145b85250..145b85532` and purchase increment owner
`145b84e40..145b85155` obtain the real descriptor through `145b86350` and retain
the nonzero-class/positive-star gate. The total factor remains four ordinary
increments followed by a separate fifth-star addition, with native f32 order:

| Rarity | Each of stars 1–4 | Fifth-star addition |
| --- | ---: | ---: |
| Common | 0.64 | 3.73 |
| Uncommon | 0.40 | 1.85 |
| Rare | 0.28 | 0.85 |
| Epic | 0.17 | 0.42 |
| Tier 3 | 0.12 | 0.12 |
| PvP | 0.15 | 0.22 |

The two tables are at `1470725e8` and `147072600`. The increment subtracts
successive f32 factors before projecting effects; separately rounded health
differences are not equivalent. Typed projection `145cef910` omits integer
extra-target tag11 and rounds health tag2. Base effects precede extra effects
in the retained live merge, currently `145b832a0..145b8373d`.

The descriptor's `145b873db..145b87458` branch appends tag12 with exact f32
bits `3cac0831` to Tier 3 armor (compact slots 0–7), replacing the retained
`0.042` echo with approximately `0.021`. Weapons retain tag11/integer one.
At five stars the separately projected echo merges with that base; its result
must not be replaced with the release note's rounded percentage.

Final-stat bridge `145b840e0..145b845b1` rejects Tier 3 itself and every weapon.
It constructs the same class/compact-slot Tier 3 ID, obtains its descriptor,
projects its star bonus using exact f32 bits `3f199999`, then merges base rows
before bonus rows. Filter `145d0e1a0..145d0e305` excludes tag11 and every tag
already present in the original lower piece. The remaining full Tier 3 +5
values are multiplied by the table at `1470726f0`: common90%, uncommon92%,
rare94%, epic96%, Tier3 100%, PvP98%. Health rounds after this multiplication.
These targets apply to missing tags; existing tags retain the scalar path above.
The total helper appends the bridge at stars >4; purchase preview appends it
only at the fifth star, so a capped later increment cannot repeat the grant.

`gear_stars.rs` supplies those shared scalar/projection/merge/bridge contracts.
`ArmoryCatalog::embedded` corrects the Tier 3 armor echo once and derives each
piece's final-star rows from the same class and slot after catalog corrections,
including faction PvP variants. `GearPiece::effects_at_stars` feeds Armory
details, worn run statistics, inventory item templates and cooperative entry
templates. Purchase preview consumes the same final-star rows independently.
No external EXE is required to build or load those source catalogs.

The existing non-compiling `check-gear-stars.py --proof
docs/analysis/evidence/0.127.0/ranked-gear/stars.json` verifies current bytes,
four native receipts, exact table bits, the `roundf` import and source bindings.
It replays **170 original-instruction cases / 21,378 instruction steps** across
total/increment scalars, Tier 3 armor/weapon selection and all fifteen tag
variants with absent/present masks and each rarity target. Descriptor rows,
preallocated output and C `roundf` are explicit synthetic seams. Source Rust
regressions cover fifth-star-only admission and weapon/Tier3 rejection; they
were authored but not compiled or run. Rust parser/format checks and
`git diff --check` pass.

This establishes the bounded source/static repair, not complete catalog
recovery, compilation, application/game/network/server execution, rendering or
original/rebuilt parity. Those checks remain in
[verification-needed #230](../verification-needed.md#gap-230).
