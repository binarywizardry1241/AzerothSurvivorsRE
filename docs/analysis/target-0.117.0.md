# Installed target review — 0.117.0

Selected SHA-256:
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
The 145,283,072-byte AMD64 PE has matching embedded updater and independently
mapped version/Windows pointer-length witnesses. [Identity/resources](target-refresh-0.117.0.json)
records exact ranges and the complete archive chain. Installed EXE/Data are read
in place; no EXE/MPQ copy, modification or execution is part of this audit.

The complete scan finds six sections, 357,937 unwind records, 425 imports,
637,214 nonpadding relocations and 761 diagnostic paths: 60 custom and 701
engine/other. No known custom diagnostic path was added or removed from 0.115.0.
Unchanged membership does not imply unchanged behavior. The
[whole-file delta](evidence/0.117.0/discovery-delta.json) retains every observed
candidate/import addition and removal, including packed-literal ambiguities.
All 2,132 regex candidates remain in the current data/graph work queue.

The [linear/complement inventories](native-census-0.117.0.md) and 26-interval
file ledger account for every byte structurally. Ghidra actual bodies,
references, independently verified instructions and residuals retain separate
saved-profile evidence; those populations must not be added as disjoint totals.
The [unknown queue](unknown-recovery-0.117.0.md) owns exact outstanding selectors.

Nine MPQs match 0.115.0. The new `patch-A.MPQ` is 1,453,122 bytes, SHA-256
`350cde8cd0f76e5246a663eb3811f5a7b1a9c75e4e699190208c9299177b8d90`.
It contains a Cat model, ten Cat textures, three cape textures, four tabard
textures and its listfile. The [resource census](evidence/0.117.0/mpq-member-coverage.json)
accounts for all ten archives, 29,699 active slots and 29,690 distinct names,
with no opaque slots or existing blocks without an active hash. Asset names and
source patch priority do not establish native resource/locale/mount equivalence,
display selection or successful loading/rendering.

The exact 16,665-byte [embedded addon API](evidence/0.117.0/embedded-api.lua)
has SHA-256 `a0066d2d6356e9f21fe4544e600def13887047a6608bb588cd6c27859b78ccc5`,
identical to 0.115.0. Current native dependencies remain unvalidated; byte equality
is not producer/consumer, lifecycle or addon/runtime proof.

The supplied 0.116.0/0.117.0 notes have fourteen separate findings and
[item-specific reviews](release-review-0.117.0.md). Native strings/tables confirm
new achievement and reward leads; source gaps and missing contracts remain
separate. The [engine lineage comparison](engine-lineage-0.117.0.md) establishes
public ancestry without identifying the game's compiled engine revision.
The 0.116.0 EXE was not supplied separately, so current byte observations cannot
identify which intermediate release first introduced each change.

Source mapping remains partial for all 60 known AS modules; all prior target
contracts retain their provenance. The [connection ledger](coverage/exe-connections.json)
and [module findings](module-contracts-0.117.0.md) separate missing evidence from
missing code. Native semantics, compilation, actual client/game/network/server
execution and controlled original/rebuilt parity remain unverified.
