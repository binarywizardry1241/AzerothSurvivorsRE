# Three saved talent specifications

Recovered and connected 2026-10-19 against selected 0.100.1, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.

The current parser reads live `talent|class|xp|allocation` before the three-slot
`spec|class|active|slot0|slot1|slot2` records. View `14542e5c0` uses the live
allocation for the selected slot. Switch `14542e9f0` stores the outgoing live
allocation, selects the destination and updates the live row. An older save
keeps its allocation in the first slot when it first switches; it is not copied
to all three. Setter `145439e60` also updates the selected stored allocation.

Persistence and menu allocation now share one normalizer and current definitions.
Current budget `14542f490`, can-learn `145483ba0`, exclusive `1454834e0`,
previous-row `145483d70`, normalizer `145483fc0`, collector `14553b8e0`,
comparator `145507670` and refund `145483720` were checked in this target.
The old RVAs are not used as current evidence. Prerequisites use their own rank
maximum, row admission requires five earlier points per row, and normalization
orders candidates by row/tree/column before admitting each point.

The current normalizer's completed REA/Ghidra evidence is
`ev_50d7414935b7a5cff55145094e6e1ddbad69055ab8cded7335bc5181dc36d263`.
[Current native slices](evidence/target-menu/talent-normalize.asm) and
[retained pseudocode](evidence/target-menu/talent-normalize.ghidra.c)
keep generic-ABI and external-call limitations explicit. Definition and effect
payload provenance is retained in [talent evidence](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.100.1/talents.json).

The menu places the three selectors above Talent Points and shows per-tree
counts or `Empty`, using the current spec-card owner `140165440`. Original-menu
observation in an isolated profile confirmed that placement and fresh-profile
labels. Complete rebuilt typography, hover and gradient parity remain unverified.

Migration, switch/edit/reopen, selected-versus-stored views, invalid-slot and
class-isolation regressions passed in the combined application/save run. The
legacy allocation round-trip fixture now uses the real current Mage key
`imp_frostbolt` instead of an unknown `frost` key. Broad malformed-save parser
parity remains separate from these specification rules.
