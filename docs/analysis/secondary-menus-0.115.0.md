# Secondary-menu contracts — 0.115.0

Target: installed Windows EXE SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own permanent gap **#17**. This is a bounded
current check of the existing Azeroth Survivors secondary-page consumers, using
the existing benilla/wenilla engine. The checks below found no additional source
correction in these contracts; they do not replace the historical ownership of
other presentation, account or mechanic contracts.

| Contract checked | Current evidence and live source connection |
| --- | --- |
| Talents | All 355 records and 27 tree headers match the live base catalog plus Warlock/Warrior overlays. Compared fields include key/name/icon, description and Supremacy templates, both prerequisites, row/column, maximum rank and exclusion flag. The current index is independently located at `147029fc8`; historical addresses are not reused. `save/talents.rs` supplies the catalog consumed by both the page and the existing allocation/spec owners. Numeric rank formatting, milestone predicates and gameplay effects retain their separate recorded proofs. |
| Rewards and appearances | All 13 perks, 22 companions, 20 tabards and seven cosmetic descriptors match across ten current native table copies. This includes costs, prerequisite/achievement gates, descriptions, model/display/inventory/slot fields and companion scales. `progression.rs` and `armory_cosmetics.rs` consume the existing assets; their historical grant and validation owners remain distinct from this data comparison. |
| Codex | All 103 legendary class/spell memberships match the nine current class pools. All 39 fixed entries match current key/name/icon metadata, with shared amulet qualities checked separately. The live base-plus-Mystaria overlay has 23 jewelry and 16 shared amulets, preserving 142 total entries. Per-rarity effects and constructed/localized descriptions retain their owning proofs. |
| Navigation and dirty Rewards plans | Current `14023ec90..14023ee7e` executes 336 complete calls: seven prior tabs, eight destinations including Done, two drop-getter outcomes and absent/equal/changed plans. Every case retains the full 24-byte Codex selection. Changed Rewards plans defer leaving, equal plans proceed, and Drop Tables uses the first supplied location. Existing `ProgressionState::request_page`, confirmation handling and `ArmoryState::enter_page` supply these state consumers. |
| Retained Talents details | Fresh journaled Ghidra recovery at `140350810` independently rebinds the retained native constructor. Its 7,380-byte scalar/instruction shape matches the canonical 0.112.0 owner after masking only actual branch and RIP-relative relocation fields. The live `talent-details` viewport retains its 9px row gap. Equipment, companion-look and appearance viewports remain connected at their existing consumers. Computed scrolling/layout is untested. |

The [contract record](evidence/0.115.0/secondary-menus/contracts.json) retains
current table/range hashes, asset commitments, source guards and result digests.
The [native record](evidence/0.115.0/secondary-menus/native.json) binds two fresh
Ghidra Evidence/profile identities and thirteen unique relocation-only matches.
These additionally include the ten existing talent allocation/spec helpers and
the achievement-catalog constructor. Those matches preserve every nonrelocation
instruction byte; they do **not** prove all callees, global data, complete
achievement output or source/runtime equivalence. Other UI bodies whose shapes
differ were not declared equivalent. A shape change alone is not a demonstrated
source defect.

Reproduce the current bounded data/navigation/source checks with:

```sh
python3 -B scripts/check-secondary-menus.py
```

Only the admitted current navigation instructions run in Unicorn. The account
baseline and first-drop getters, byte equality and deallocation are declared
fixture boundaries; these cases do not execute actual accounts, filesystem,
ECS/query membership or UI publication. Fresh native queries used
`./scripts/rea query <plan.json>`; their databases, journals, saved results and
full decompiler output remain under ignored project-local runtime storage.
The compact [navigation extract](evidence/0.115.0/secondary-menus/navigation.c)
retains Ghidra's generic ABI limitations; original bytes and instruction replay
govern the interpretation.

No compiler, compiling Rust test, game, actual menu interaction/file operation,
font shaping/DPI/rendering or original/rebuilt comparison ran. No new missing AS
source operation was demonstrated by these page checks. Remaining historical
contracts keep their stated provenance and runtime/parity limits; separate
presentation findings #50/#51/#52/#60 are not certified or closed here.
