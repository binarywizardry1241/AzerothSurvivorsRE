# PvP equipment: selected-target recovery and integration

Target: supplied **0.105.0**, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns current implementation status.

The Armory previously exposed only 415 ordinary pieces. PvP drops could already
produce IDs that the menu catalog and run equipment lookup could not resolve.
The supplemental catalog now supplies all **83 canonical PvP pieces**, bringing
the collection to **498**. Collection, equipment, appearance, details, picker
icons, twelve-zone Drops and live run stats use these records.

## Recovered contracts

[Data evidence](evidence/0.105.0/pvp-gear/data-evidence.json) binds the tables,
strings and values to native byte ranges. [Procedure hashes](evidence/0.105.0/pvp-gear/procedures.json)
and [REA/Ghidra provenance](evidence/0.105.0/pvp-gear/rea.json) identify the
retained extracts and their analysis limits.

| Owner | Selected-target behavior |
| --- | --- |
| Item reader `0x1458bd6f0`; class/PvP tables `0x146bbf2a8` / `0x146bbf300` | ID rarity digits 5 and 6 share numeric tier 5. Class armor and weapon records provide names, display IDs, inventory metadata and effects. Both faction variants have identical numeric effects. |
| Outfit resolver `0x1458bd260` | Horde races 2, 5, 6 and 8 select the second appearance of a canonical digit-5 item. Saved canonical ownership stays unchanged. Explicit digit-6 equipment IDs also resolve. |
| Scaling `0x1459b3920`, `0x1459b3b60`, `0x1459b3da0` | Global scale 0.7; PvP base scale 4.0 and extra scale 2.9. Maximum-health values use native roundf. Legendary-only extra-target/echo additions do not apply to PvP. |
| Flavor helper `0x1458bb9e0` | PvP uses the higher-quality class flavor path. Its current pointer/length strings are retained in the supplemental asset. Ordinary prose keeps its historical provenance. |
| Collection constructor `0x1401df3e0` | Quality order is Common, Uncommon, Rare, Epic, PvP, Legendary: numeric `[0,1,2,3,5,4]`. PvP color is RGB `(0.761, 0.486, 1)`. Warrior has 54 pieces; classes with two weapon choices have 60. |
| Drop owner `0x1458bbdc0` | Twelve-zone tiers are `[0,0,1,1,2,2,3,3,5,5,4,4]`. Alterac Valley/Blackrock Mountain use PvP at 25%; Ahn'Qiraj/Naxxramas use Legendary at 20%. Nonfinal bosses split armor across peer zones; final bosses offer class weapons. |
| Equipment effects `0x1458beb10` | Reads nineteen equipment words, resolves item effects, and adds equal tags before stat refresh. Tags 0–10 and 12 use floating addition; tag 11 uses integer addition. Pickup bonuses therefore add together before their single multiplicative stat application. |

The equipment-effect decompiler does not resolve its indirect tag switch.
The retained [assembly](evidence/0.105.0/pvp-gear/equipment-effects.asm) supplies
the additive branches; its partial pseudocode is not treated as complete source.
The nearby `0x1458bd600` predicate checks slot existence, and `0x1458bc2e0`
iterates display IDs; neither is evidence for an invented menu transition.

## Live source connection

[`armory.rs`](../../crates/azeroth-survivors-re/src/armory.rs) merges the new
catalog with ordinary records and resolves faction names/icons. Explicit second
faction IDs are lookup aliases, so they do not double the collection count.
Existing ownership, class, equip/clear, Shift appearance and modal input gates
now receive actual PvP records. The collection adds its sixth row and the Drops
page no longer clamps selection to nine zones.

`GearSave::effects` is shared by the menu summary, Armory sidebar and
[`gameplay::enter`](../../crates/azeroth-survivors-re/src/gameplay/mod.rs).
Only worn equipment contributes; cosmetic overrides contribute no stats.
It merges equal effect tags in equipment order before the existing live health,
damage, cooldown, critical, movement, mitigation, regeneration, pickup, gold,
area and special-effect consumers. This also corrects ordinary multi-item
pickup composition through the same native contract. The ten collection slots
map to their actual equipment words; empty or uncataloged starter slots have
no catalog effects.

[`recover-pvp-gear.py`](../../scripts/recover-pvp-gear.py)
hash-checks the reference before recovery. `--write-assets` regenerates only the
supplemental PvP/drop asset; `--prepare` stages native slices/plans under ignored
`runtime/analysis/history/inventory/pvp-gear/cf55d61c5cf0/`. Source builds consume the checked-in JSON and never
require the reference EXE. `--fixtures` requires the project-local Unicorn
dependency used by the existing recovery tools.

## Validation and limits

- **166 original-instruction scaling cases passed**, using real PE data/jump
  tables, sufficient preallocated vector buffers and a finite nonnegative
  health `roundf` import seam. [Record](evidence/0.105.0/pvp-gear/native-scaling-validation.json).
- Recovery revalidated all **415 ordinary numeric definitions** and **166
  existing PvP faction preview records** without changes.
- A locked/offline serial Armory run passed **seven tests**, including canonical
  collection/faction IDs, ownership and cosmetic persistence, all-class
  twelve-zone drop candidates and live health/damage/critical consumption.
  A macOS application build also passed at that source state.
- The later actual-input-system fixture, additive equipment-effect correction
  and pickup regression were **not compiled or run**. The follow-up test build
  was stopped; no final-source build result is claimed.
- Isolated reference/rebuilt profiles rendered portions of the picker/Armory.
  The reference displayed Warrior 9/54 and its PvP bonus summary. UI automation
  timed out or lost a stable target; no controlled original/rebuilt equip,
  appearance, drop selection or gameplay comparison completed. These partial
  views establish no visual or input parity. Windows remains unverified.

Generated build output, both temporary QA application bundles and the dedicated
Wine prefix were removed. Compact logs and isolated QA profiles remain ignored
under the task's runtime folder. The selected source integration is implemented;
final-source validation and controlled presentation/interaction comparison remain
open.
