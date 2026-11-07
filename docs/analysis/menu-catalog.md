# Main-menu catalog recovery

Recovered on 2026-10-18 from `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`,
133,231,104 bytes, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
The reference was not executed. The previous 0.92 evidence is historical and
was not overwritten.

The implementation now embeds the selected target's catalog in
`crates/azeroth-survivors-re/assets/menu.json`. Compilation and ordinary menu
loading require this textual source asset, not the reference EXE. This report
establishes catalog data recovery; it does not establish rendered-menu or
functional parity.

## Recovered records and changes

| Source | File offset | Virtual address | Count | Stride |
| --- | --- | --- | --- | --- |
| Class records | `0x6717768` | `0x146718768` | 9 | 144 bytes |
| Zone records | `0x6715440` | `0x146716440` | 12 | 240 bytes |
| Ability records | `0x6718a68` | `0x146719a68` | 112 | 120 bytes |
| English JSON | `0x6722312` | `0x146723312` | 2,621 labels | 170,112 bytes |
| Build revision text | `0x58f9a40` | `0x1458faa40` | `43fe5ff8` | 8 bytes |
| Version text | `0x58f9a48` | `0x1458faa48` | `0.97.2` | 6 bytes |

The current classes contain 102 class-pool entries. The eight races' names and
racial summary lines match the embedded English labels. Class names, blurbs,
icons, color strings, starter keys and spell-pool keys were independently read
from the current target, rather than copied from the prior catalog.

The twelve zones retain their actual table order: Elwynn Forest, Duskwood,
Warsong Gulch, Un'Goro Crater, Arathi Basin, Feralas, Gurubashi Arena, Scarlet
Monastery, Alterac Valley, Blackrock Mountain, Gates of Ahn'Qiraj, Naxxramas.
There are 148 enemy entries and 60 boss entries. Naxxramas contains sixteen
enemy records; each other zone contains twelve. Every zone has five bosses.

Compared with the checked-in 0.92 catalog baseline:

- Un'Goro Crater, Scarlet Monastery and Naxxramas are new catalog entries.
- Arathi Basin now uses “The Highlands Rise,” Witherbark/Syndicate/Boulderfist
  enemies and Lord Aliden Perenolde as the last boss; its old Scourge content is
  replaced by the current table data.
- Shred is added to the ability catalog and Druid spell pool.
- The version and build-revision display data become `0.97.2` and `43fe5ff8`.
- The English object has 152 new keys, 38 removed keys and two changed values.

The target has thirteen locale objects. This catalog helper reads the English
object; the separate localization recovery owns the translated assets.

## Source validation and native evidence

[catalog.json](evidence/0.97.2/catalog.json) records the original source identity,
every class, zone, ability, enemy and boss record's raw bytes and SHA-256, string
locations, and referenced slice lengths. Names and zone/class blurbs are
checked against the exact embedded English values. Enemy IDs and boss IDs are
checked against their matching locale keys. Spell pools must contain unique
keys, include their class starter and resolve entirely to the ability catalog.

The zone layout differs from the previous target: enemy slice at `+112`, boss
slice at `+128`, loading-screen string at `+144`, and blurb at `+160`. The old
184-byte zone stride is invalid for this target. Enemy and boss strides remain
80 and 88 bytes respectively.

[catalog-native.json](evidence/0.97.2/catalog-native.json) retains complete REA
Evidence for three exact function slices, along with their original PE
exception-directory boundaries and byte hashes. REA 6.5.0 used Ghidra 12.1.4.

| Native body | Recovered observation | REA Evidence ID |
| --- | --- | --- |
| `0x14540eb90..0x14540ec27` | Ability-key lookup advances by `0x78` to `0x3480`, directly corroborating 112 120-byte records at `0x146719a68`. | `ev_e335502f5195e5c4a0f5c967375a658c7db6fea1dc88e0b9225842a54e06726e` |
| `0x1454193f0..0x1454194f8` | ID lookup checks ability-record `+64`, with the same table extent; it reads the name pointer at record `+16` and follows a localization call. | `ev_7b81b88049b9660e98ab142bd5e9432fc9d321bc06299f09bd5af0a6f526503a` |
| `0x145427b30..0x145427eae` | Picker normalization reads class byte `+140`, current class/race tables and a zone-key length at `0x146716448 + index * 0xf0`, corroborating the new 240-byte zone stride. | `ev_38b5b39ba7906199c9236cb53c6cb5d3af3079f526a7f882a6041de5187a37d6` |

Each raw slice maps unchanged original bytes at its original virtual address.
This omits callees and referenced tables, so those are independently recovered
from the complete PE. The raw import uses Ghidra's generic GCC compiler
specification; decompiled signatures are not treated as recovered Windows x64
source signatures. No native source function names are claimed.

## Remaining limits

The class `base_health` value is the exactly recovered float at record `+128`.
Boss `minute` and final-boss selection preserve the existing interpretation of
float `+64` and the last record's `+84` flag. The current bytes and their
membership are verified, but those numeric fields' native display/behavior
consumers were not established by these three decompilations. Race
Alliance/Horde grouping remains explicitly provisional baseline UI metadata.

The independent progression, armory, talent, codex and dynamic tooltip catalogs
remain version-bound to their own owning evidence. This extraction does not
validate them against 0.97.2 or implement gameplay. UI placement, unlock
transitions and runtime screenshots require separate evidence.
The subsequent [home-action and zone-policy recovery](menu-actions.md)
establishes the current twelve-zone count and selected-zone clamp, with bounded
native-output fixtures. It does not validate the remaining numeric fields
listed above.

## Reproduction and validation

Run from the project root with the selected reference present:

```sh
python3 scripts/recover-menu-catalog.py
python3 scripts/recover-menu-catalog.py --check
```

Both extraction and deterministic comparison passed with 9 classes, 102 pool
entries, 8 races, 12 zones, 112 abilities, 148 enemies and 60 bosses. The script
rejects a different EXE digest before using any fixed offsets.

To repeat the native queries, prepare the exact slices, run each project-local
REA plan, then collect the returned Evidence:

```sh
python3 scripts/recover-menu-catalog.py --prepare-native
python3 scripts/rea-batch.py runtime/analysis/history/native-recovery/catalog/12a875fe3fca/plan-14540eb90.json
python3 scripts/rea-batch.py runtime/analysis/history/native-recovery/catalog/12a875fe3fca/plan-1454193f0.json
python3 scripts/rea-batch.py runtime/analysis/history/native-recovery/catalog/12a875fe3fca/plan-145427b30.json
python3 scripts/recover-menu-catalog.py --collect-native
```

The batch runner requires new output directories; remove an already completed
disposable `runtime/analysis/history/native-recovery/catalog/12a875fe3fca/rea-*` directory before rerunning that plan.
All three original REA queries completed and closed their native sessions.
No game launch or build was performed in this catalog-recovery subtask;
integration/build validation is owned by the main-menu task.
