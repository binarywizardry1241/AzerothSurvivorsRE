# Picker equipment artwork — 0.113.2

This is the source repair for **#52**. Target SHA-256:
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[verification-needed](../verification-needed.md) owns overall status and remaining comparisons.

The picker requested `gear.{display_id}` from `MenuArt`, but `load_gear_art`
admitted only Character, Collection and DropTables. A saved equipped item could
therefore have no image on a cold picker until an Armory visit populated the
shared map. The loader now also admits **Picker**. It retains the existing
process cache, failed-dictionary/open retry and run exclusion. Equipment state,
faction display selection and the slot-placeholder path are unchanged.

The live route is ArmoryPlugin's Update registration → `load_gear_art` → shared
ItemDisplayInfo dictionary → installed MPQ icon → BLP mip 0 → `MenuArt` handle.
`menu::rebuild` observes changes to that resource and reconstructs the picker
ImageNode; loading after a prior rebuild therefore invalidates the next update.
Equip/unequip and class/race navigation use the same existing picker rebuild
and the preloaded base/faction display handles. This repair changes asset admission,
without a separate image cache or manufactured fallback for a missing worn icon.

## Selected native contract and resources

Fresh REA/Ghidra raw-function analysis binds the current picker equipment owner
`1402dcbf0..1402dd37a` and shared getter `1458270a0..145827578`.
The [canonical contract](evidence/0.113.2/picker-equipment-art/native-contract.json)
records exact range hashes, Evidence IDs and selected instruction text. In the
picker, the worn-item branch calls the getter at `1402dcdb2`, before passing the
returned icon name to the existing image request at `1402dcddf`. The empty-item
branch constructs its separate slot texture. The getter directly names
`DBFilesClient\ItemDisplayInfo.dbc`. This establishes that the picker itself is
an icon requester; visiting a secondary page is not its native prerequisite.

The installed nine-MPQ chain is hash-checked against the current identity
manifest. Independent Python MPQ/DBC inspection finds names and complete DXT
BLP mip-0 payloads for **all 455 display IDs**, using **194 unique icon paths**,
from the merged **498-piece** ordinary/PvP/correction catalogs. All **11** picker
placeholder paths also resolve, including `Wrist` → `Wrists`. All **3,984**
piece/race selections resolve through the same base/Horde display set; every
requested display is already admitted by the retained shared dictionary ID list.
No additional missing resource or catalog-membership cause was found in these
inputs. Catalog identity and unrelated gear rules retain their owning provenance.

## Checks and limits

```sh
python3 -B scripts/check-picker-equipment-art.py
```

The check verifies the installed EXE, exact native ranges/calls/DBC literal,
nine archive hashes, icon and placeholder payloads, catalog/faction selection
digests, loader registration/admission/retry ordering and resource-driven picker
invalidation. [Compact proof](evidence/0.113.2/picker-equipment-art/resource-source-proof.json).
`--stage` writes regenerated proof under ignored `runtime/` for review.

Ghidra's raw imports omit external data and callees; the picker rarity-color
computed branch remains unresolved in that profile. The icon branch precedes
it and is independently instruction-bound. Neither native callee execution nor
reconstructed Rust executes in this check. BLP validation establishes complete
supported payloads, not decoded pixels or GPU output.

The identified source loading gap is repaired. Compilation, actual cold/warm
picker execution, input/cache timing, equip/unequip and class/faction transitions,
and original/rebuilt visual parity remain **unverified**. No build, compiling
test, game launch, addon execution or original/rebuilt comparison was run.
