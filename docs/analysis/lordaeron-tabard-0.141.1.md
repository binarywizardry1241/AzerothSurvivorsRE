# Tabard of Lordaeron crest in 0.141.1

This is the bounded assessment of `changelog:0.141.1:f254ac47b93d1ae2`
under [#324](../verification-needed.md#gap-324). The installed
`installed-game/AzerothSurvivors.exe` is 151,534,080 bytes with SHA-256
`47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.
The full audit baseline remains 0.141.0.

## Native display selection

All three 64-byte tabard descriptor copies have the same name, icon
`INV_Banner_02`, null achievement gate and `u32` fields at offsets `0x30`,
`0x34` and `0x38` of **90012**, **16078** and **15**. The neighboring Stormwind
and Stromgarde rows retain displays 21337 and 36468 respectively.

| Descriptor preferred VA | EXE file offset | SHA-256 of 64-byte record |
| --- | --- | --- |
| `0x146570758` | `0x656ed58` | `bef05c445fbfa01b8c62b151e07037f567c70097ca1d9f6735ff82ba42c306cd` |
| `0x147726e10` | `0x7725410` | `af48565f50cb9c27e8521a87b26bf8c14bf869fa8068929b5bacae96c759f009` |
| `0x147734ac8` | `0x77330c8` | `4132852798992ff1a227ffc56fb1e8b245a46a9ad246b46ec7de1f4b633930b5` |

The Rewards list passes the first record at `0x1401314ce` to its card call at
`0x1401314f7`. The item constructor subtracts 90001 from the item ID and uses
the signed 32-bit jump-table entry at `0x1477303dc` for item 90012. That entry
targets `0x145e33f90`, which loads the second record. `0x145e34106` reads
`[r12 + 0x34]`, `0x145e34155` writes it to item metadata `+0x54`, and
`0x145e34163` writes tabard lane 18 at `+0x68`. These field offsets agree with
the [earlier item-constructor proof](party-rewards-0.117.0.md#admission-item-metadata-and-source-consumers).
The third record belongs to the 21-row range passed at `0x145dec913`.

The following Ghidra results were verified against the PE bytes and the
completed raw-slice journals. The original PE operands supply the external
table destinations outside the slices. The shared analysis store retains the
result objects by digest.

| Procedure | EXE offset and byte count | Raw-slice SHA-256 | Verified result SHA-256 |
| --- | --- | --- | --- |
| Rewards list `0x140131270` | `0x130670`, 1299 | `7b6b4cb621428e4219ceaa476f18dabc74b752516f0389e6a96c3f11b2345fa5` | `3e00401215390f73e6ff5e40867d95da5b16c32916dff49282d650af47165226` |
| Item constructor `0x145e33ea0` | `0x5e332a0`, 4952 | `2f68fd089ca1f51107b8b5c6d2f3382d8c1d094d5ed13ad991d2dd279817783e` | `c6476f71e68b5290a4e028cf683ad8cf8b2b420ff105ddff3eddd157d2905b04` |

## Data and rebuilt consumers

`DBFilesClient/ItemDisplayInfo.dbc` resolves to `installed-game/Data/patch.MPQ`
(archive SHA-256 `49473c3cd0f47cd949e579240ea694c793aab813549920f1073ef73017364adf`,
member SHA-256 `6f37ca862dc632a11aaf86e0ba7b183aa7abaebb052549e6120aa9fa69dd9dee`).
Display 3864 names `Tabard_A_01Lordaeron_Chest_TU` and `_TL`. Neither the unisex
nor sex-specific members for those names exist in the installed chain. Display
16078 at DBC offset `0x12e48c` has geoset selectors `[1, 0, 0]` and flags `1`.
Its two torso columns name the Hillsbrad basenames. Both resolve on the
existing unisex-first lookup in `installed-game/Data/patch-D.MPQ`, a 35,594-byte
archive with SHA-256 `4ea58417c035e2ea70e0460eaaf10b47f0ed92616c110c3716f338d67e5880f7`.

| Member under `Item/TextureComponents` | BLP2 dimensions | SHA-256 |
| --- | --- | --- |
| `TorsoUpperTexture/Tabard_A_01Hillsbrad_TU_U.blp` | 128 × 64 | `bf85f43f4654de6bdf230a5b530e1148bde45c93aaf58f12b266a8677b1d5d33` |
| `TorsoLowerTexture/Tabard_A_01Hillsbrad_TL_U.blp` | 128 × 32 | `52eb6fbec718026298c6b1ebd74ea34a902d59231979980e88f59b8af49f05ce` |

[`Catalog::embedded`](../../crates/azeroth-survivors-re/src/progression.rs)
updates the one live display field after composing the historical tabard
catalog. The stable saved item ID, cost, gate, name and icon come from the
existing descriptor. [`ArmoryCatalog::appearance`](../../crates/azeroth-survivors-re/src/armory.rs)
resolves that display for the [menu preview](../../crates/azeroth-survivors-re/src/preview.rs)
and the [local run outfit](../../crates/azeroth-survivors-re/src/gameplay/client.rs).
The [item-template path](../../crates/azeroth-survivors-re/src/gameplay/client/inventory.rs)
reads the same display for local and remote item queries, including the stable
IDs published by the [peer outfit path](../../crates/azeroth-survivors-re/src/coop_profile.rs).
The existing [archive mount](../../crates/benilla-formats/src/chain.rs) admits
`patch-D.MPQ`, and the [character compositor](../../crates/benilla-formats/src/characters/sections.rs)
uses the DBC row's own torso art when there is no guild emblem. The preview
bridge supplies no guild emblem, and the Survivors loadout supplies none.

Static checks compared all 21 descriptors in each of the three native copies
with the composed source catalog, checked the item switch and metadata
instructions, and resolved both payloads across the thirteen mounted archive
inputs. The source change
requires the supplied `patch-D.MPQ` for the crest textures. Compilation,
in-game preview and equipped rendering, client item-cache behavior and
original/rebuilt visual parity remain unverified.
