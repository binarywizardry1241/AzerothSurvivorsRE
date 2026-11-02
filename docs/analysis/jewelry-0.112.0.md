# Current jewelry and Star of Mystaria — 0.112.0

Target: installed read-only **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This is the jewelry/equipment consumer portion of #34. Current overall status
belongs to [verification-needed](../verification-needed.md). The historical
[equipment catalog](equipment-catalog-0.105.0.md) retains its original target.

The current table `146c00368..146c009e0` has **23** 72-byte jewelry records.
Star of Mystaria follows Soulstone, uses the trinket slot, icon
`INV_Enchant_EssenceMagicLarge`, base bits `3e2aaaab`, and native tag 6. It is
absent from the sixteen-record current shared-amulet table at `146c015c8`.
The source removes the obsolete shared definition before offer expansion and
loads the complete current jewelry table. The other 22 definitions retain their
values. Native tags 7–19 map to stable source tags 6–18; Star uses source tag 19.
Historical raw enum values are never silently treated as current tags.

Star uses the existing sixteen-step diminishing health growth family, with no
finite magnitude/offering ceiling. Its full accumulated value adds to the health
multiplier; its separate damage reduction is `min(value * .16, .12)`. The
current stat dispatch and exact arithmetic reuse the canonical
[buff-potency evidence](evidence/0.112.0/buff-potency/manifest.json). Health
continues growing after this item's mitigation reaches 12%. The ordinary shared
armor cap/conversion stage remains independently applied after composition.

A fresh common pick produces **+21% health and +3.4% damage reduction** in
the current native formatter. The supplied 0.111.0 note says +25%/+4%; that
numeric claim does not match this selected EXE and is not certified.

The live path runs from the current catalog through weighted cache eligibility,
rarity/selection, actual reward cards, acceptance and `refresh_effects` to player
vitals and combat stats. The existing MPQ icon collector reads the new table.
Reward names now use the current `jewel.<key>` getter with the descriptor's
English fallback. The formatter supplies Star's combined health/mitigation
line, one-decimal trimmed mitigation and the native near-cap suffix threshold
(bits `3df5c209`). The Codex moves the same key from the shared amulet group to
the native jewelry position after Soulstone, keeping its highest seen rarity,
current icon, all five rarity descriptions and actual growth text in fourteen
languages. All other current jewelry Codex records match the retained corpus;
only Star needs a compact structural/localized delta. Total entry count stays 142.

Current choice publication `14595d7bb..14595d970` also exposes a previously
missing source connection: every displayed jewelry/amulet offer appends its
key and raw quality byte to Seen **before acceptance**. Gold and ordinary
ability records skip this stage. The source now appends those actual offers in
order, retaining duplicate records for the existing maximum-quality save merge.
The current regular tick `1458b04ca..1458b06dc` drains this queue and applies the
valid-GUID/save-change gates. The source's existing regular save adapter owns
that delivery; the repair introduces no alternate file writer or special Star
migration. The native producer copies the unchanged `star_of_mystaria` key,
and the source's Seen map/lookup preserve that identity across its category move.
Actual save I/O and original/rebuilt persistence remain unverified.

The [manifest](evidence/0.112.0/jewelry/manifest.json) owns the canonical selected
instruction intervals, fresh REA/Ghidra owner identities and raw-import limits.
The noncompiling checks are:

- `scripts/recover-jewelry.py`: 23 complete descriptors, sixteen current
  shared-amulet identities, **805 exact native increment cases** and **63 current
  Mystaria composition cases**. Float bits, repeated picks, large accumulated
  values and mitigation boundaries are checked.
- `scripts/recover-jewelry-text.py`: **2,030 native cases**, including all
  five fresh-rarity descriptions and actual growth branches for 322 localized
  jewelry records, plus Star's near-cap/at-cap/above-cap formatting.
- `scripts/check-treasure-seen.py`: **682 original-instruction sequences**
  cover every four-variant sequence through four offers, existing queues,
  duplicate keys, empty synthetic keys and raw quality bytes. Actual jewelry
  descriptors and explicit owned-amulet fixtures supply the live input shape.
- `scripts/check-jewelry-evidence.py`: nine canonical native intervals and
  five fresh Ghidra owner observations are hash-bound to the selected EXE.
  `--prepare-rea` writes reproducible bounded plans under ignored `runtime/`.

Allocation, cloning/copying, Rust formatting and locale-map services are explicit
fixture seams. Original numeric/variant/dispatch/publication instructions use
actual PE data. Ghidra raw imports omit external data and retain unresolved
computed jumps; generic ABI pseudocode is not an original Rust declaration.
The increment oracle translates the live Rust formula rather than compiling it.
Ten changed Rust modules syntax-parse; current catalog, native-increment/text
and live acceptance/discovery regressions are authored but uncompiled/unrun.
No application build, Rust test execution, game/device/UI/GPU run, original
filesystem operation or original/rebuilt gameplay/presentation comparison ran.
These results establish the selected connected source/static repair, while
compilation, live persistence and runtime/parity requirements remain open.
