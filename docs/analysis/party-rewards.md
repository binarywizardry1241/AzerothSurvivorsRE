# Co-op cosmetic, tabard and companion source integration

Selected EXE SHA-256:
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
This report owns the source additions under **#116/#117**. The independent
tabard class-appearance correction is documented under **#156**; achievement definitions and
award distribution remain **#114/#157**. [verification-needed](../verification-needed.md)
owns their current implementation and validation status.

## Exact current populations and order

The [compact contract](evidence/party-rewards/contracts.json) binds seventeen
code/table ranges, three completed journaled Ghidra queries and bounded original
instruction results. The [release descriptor proof](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.117.0.md)
owns each new field and its independent table copies.

All fourteen current cosmetics agree across three 64-byte-stride tables. The
seven existing rows remain byte-field equivalent to their source definitions;
the new IDs **90108–90114** append in native order. All twenty-six companions
agree across four 96-byte-stride tables. The twenty-two existing rows match
source; **Ancient Protector, Mini Herod, Mini Nefarian and Mr. Bigglesworth**
append with entries **9623–9626**, displays **2429/2041/11380/16622** and exact
`f32` scales **0.17/0.5/0.065/1.0**.

The three complete tabard tables agree on twenty-one rows. **Contest Winner's
Tabard 90025** is inserted at ordinal **7**, after the six battleground tabards
and Scarlet Crusade Tabard, before the purchased tabards. Its gate is
`coop:odds`, display is **31676** and cost is **0**. The source keeps that order
through the addition asset's single `tabard_insertion_index` value. Its existing
optional `zone` field stores an earned achievement key; its name does not limit
the gate to a zone achievement.

The addition asset is
[`party-rewards-0.117.0.json`](../../crates/azeroth-survivors-re/assets/party-rewards-0.117.0.json).
Historical source catalogs retain their original provenance and are composed
with these exact additions. The check reconstructs every current row from the
installed EXE and compares the composed populations, rather than certifying
only the new labels.

## Admission, item metadata and source consumers

Current lookup **`145ada7f0..145adab5b`** resolves all twenty-six exact companion
keys. Actor getter **`145b4af90..145b4b0ad`** looks up the selected saved slot,
checks its optional achievement against the earned keys and substitutes the
Squirrel descriptor for an unknown key, missing slot or unmet gate. Selected
normalizer **`145c0ecf0..145c0ef39`** performs the same substitution while
retaining input slot positions and cloning the resulting keys. Its captured
Save and iterator data support the pet-selection command counterpart; they do
**not** independently prove that full Save parsing applies that gate.

Source save normalization therefore admits the new known keys through the
merged companion definitions. Existing `apply_pet_command` and
`account_loot_companions`/`saved_config` retain the separate earned-gate checks.
Rewards enumerates the same additions for both slots and applies the existing
selection command. Run entry passes the selected descriptors to
`begin_loot_companions`; their creature ID, scale and display reach the existing
creation event, object fields, movement and collection actors. Cooperative
profile creation and replication also consume the merged definition registry.
The [current creature-query proof](evidence/party-rewards/creature-query-contract.json)
connects 9623–9626 to empty name/subname, creature type 8, rank 0 and their
descriptor displays. The ordinary client query adapter now includes those
four rows; actual cache/VM execution remains unverified.

Current item constructor **`145ab6630..145ab78f5`** selects the cosmetic and
tabard descriptor tables through an external jump table. Raw Ghidra import
does not recover that table. Original-instruction replay with the complete PE
mapping separately verifies every admitted cosmetic ID and 90025: rarity **1**
for cosmetics and **2** for the earned tabard, exact name/display, head lane
**0** or cloak lane **14**, and tabard
inventory type **19** / lane **18**. Formatting and a locale miss are explicit
seams in that metadata replay. Metadata `+0x20` is the empty effects-vector
pointer, not a quality field. The actual ItemQuery consumer reads rarity from
`+0x30`; its selected conversion at `145af9f3e..145af9f63` produces quality
**2** for these cosmetics and **3** for 90025. The inventory source now derives
tabard quality from the same earned/purchased catalog distinction rather than
an older fixed ID set that omitted 90025.

The [current ItemQuery bridge](evidence/item-query-bridge/contracts.json)
connects the requested ID to the actual metadata constructor and logical opcode
0x58 response. Its separate replay checks 404 current native response cases
across 66 starters, 21 tabards and 14 cosmetics with four locale states; it
establishes the native name/metadata contract and source 90025 quality consumer,
without claiming all source localization paths already match.

The inventory tooltip's independent old-catalog reader now includes 90025.
The menu grant, gear normalization, preview and live appearance resolvers consume
the composed cosmetic registry. The cooperative loadout adapter now recognizes
that registry instead of truncating the grant domain to 90101–90107, so the new
looks reach the existing slot validation. The separate earned 90025 class-look
admission is source-corrected under [#156](tabard-admission.md);
its purchase-record rejection remains intentional. The catalog-only
`account_progression::is_purchasable_tabard` library helper supplies the
earned/purchased metadata distinction through a small `id`/`zone` catalog view.
The binary progression module re-exports it for inventory quality; Save fixtures
and normalization can use the public library without a menu or Save dependency.

## Checks and limits

`python3 -B scripts/check-party-rewards.py --require-retained-queries`
checks **209 exact descriptor records across ten tables**, all **26** native
companion lookups, **5** rejected keys, **312** native earned-key/slot cases,
**15** native item constructions, the live catalog/save/remote consumers and
all **3/3** item/getter and **4/4** creature-query receipts. The replay uses synthetic Save memory and
explicit allocation, copy, byte-comparison, formatting and locale-miss seams.
It runs no application, filesystem/save scenario, network or server.

Native data, connected source and bounded instruction results remain distinct
from compilation or executed source. Existing actor movement/collection and
shared engine behavior retain their recorded historical proof scopes; these
descriptor additions do not establish whole-system native equivalence. Actual
achievement distribution, client cache/query delivery, save persistence,
selection/rendering, MPQ appearance resolution and original/rebuilt parity
remain separately unverified. No compilation or game/server execution ran.
