# Rewards input, confirmation and current records

Target: installed0.109.0, SHA-256 `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
[verification-needed](../verification-needed.md) owns #17. The [manifest](evidence/0.109.0/rewards-menu/manifest.json)
binds current owners, original instruction hashes and Ghidra identities. The
[historical layout report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/rewards-menu-0.105.0.md) retains its actual target.

## Current source connections

Current input `1401160d0` processes every admitted pressed row. Source previously
stopped after its first row. It now continues, refreshing the account baseline
after each immediate account mutation so subsequent rows observe the changed
account while pending allocations remain separate.

Confirmation helper `140105ab0` takes the pending plan before applying it, even
when validation rejects it. A valid application queues command17. Source now
consumes the plan before validation and queues its ordinary account persistence.
The Confirm-and-leave continuation `14011689a` resumes the requested destination
after the helper, including absent or rejected plans. The former source retained
a rejected plan and blocked navigation. Discard and Keep Editing preserve their
separate native transitions. Armory owns the destination2 selection projection.

Current validator `1458d7780` preserves existing purchased ranks/tabards, checks
known perks and their rank ceilings, achievements for increases, prerequisites,
companion-instinct capacity and earned-point costs. Its prerequisite branch
`1458d7a5c` also applies to an explicitly present zero-rank row; source no longer
adds an extra positive-rank predicate. Native rank editing and text parsing remove zero rows; this explicit typed-plan
check nevertheless follows the validator without adding an extra predicate.

Current frontend Reset helper `1458e5690` checks the purchased-vector count and
resets below2, so retained zero-rank rows still count. The sidebar admission at
`1402630d5..1402630f9` additionally requires an unchanged plan and remaining
resets. Source shares the count predicate between input/render and applies the
unchanged-plan gate only in rendering, preserving input over already admitted
rows. Rewards Confirm calls `1458d8080`, which assigns only perks/tabards;
source optimistic writes now preserve a single saved Pets slot instead of
expanding it through the two-slot selection helper. The
[account ownership report](account-command-owners.md) owns the56 current
zero-rank serializer/reload/Reset sequences, including both sidebar edited
states, the frontend helper and unchanged single-slot Pets state.

The [account-command proof](account-command-owners.md) separately
executes the complete current validator/application, Pets collector, serializer,
reload and Reset paths. Accepted zero-rank entries survive live mutations and
serialization until an actual load discards them. Reset tests vector presence,
including zero ranks. Its sidebar also requires an unchanged plan; the input
helper keeps its own restriction for already admitted rows. Unrelated Rewards
writes preserve a single existing Pets slot, while an explicit slot selection
uses its recovered two-slot projection. Frontend and backend mutations retain
separate account owners.

Current descriptors independently match all13 perks,13 companions and20 tabards
in the connected asset, including Sapphiron's `feat:nou` gate. Source continues
to use the existing Rewards rules rather than a second account gate catalog.
Fresh Ghidra recovery covers the current validator, application, rank edit,
spending, slot count, companion admission, lookup and reset owners. The complete
modal/sidebar/right-pane/companion-card/validator/input instruction bodies match
their historical counterparts after checking instruction identity and masking
only actual branch/RIP relocation fields. This supports bounded reuse of those
contracts with the independently checked current data and localization; it does
not promote unrelated historical addresses or renderer behavior.

Three current control constructors independently confirm command14×6,
navigation12×8 and slot10×5 padding, with the established one-pixel border and
five-pixel radius. Their typed Node captures are retained. The native query and
command queue still run through the actual Bevy schedule in the source.

## Static evidence and limits

- `python3 -B scripts/check-rewards-data.py` checks all46 current records.
- `python3 -B scripts/check-rewards-input.py` passes26 native cases:
  six companion selections, four historical navigation algorithms rebound to
  verified current instructions, four complete confirmation-helper cases, four
  Confirm-leave continuations and eight current prerequisite branches.
- Allocation/copy/drop, clone/application/publication and sparse ECS prerequisites
  are declared fixture seams. The prerequisite cases execute the actual current
  branch with explicit descriptor/row inputs and a memcmp seam. They do not run
  the complete validator or filesystem receiver.
- The compact address map contains only the eleven historical constants used by
  the reused fixture; every executed instruction comes from the current EXE.
- Added Rust regression tests and changed source remain uncompiled. Syntax-only
  parsing and whitespace review do not establish build or gameplay correctness.

Save parsing/serialization is owned by the current Save-core work; the Rewards
UI does not establish normalization of imported account records. Builds,
interactive input, actual queued persistence, rendered text/layout and controlled
original/rebuilt comparisons remain unrun. No game or installed save was changed.

## Retained reports

[0.105.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/rewards-menu-0.105.0.md)
