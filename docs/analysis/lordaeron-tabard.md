# Tabard of Lordaeron crest

This is the bounded assessment of `changelog:0.141.1:f254ac47b93d1ae2`
under [#324](../verification-needed.md#gap-324).

## 0.143.0 correspondence

The selected Windows EXE is 151,566,336 bytes with SHA-256
`f35034ea7d44c99728cc6cd5a07a06db1bc46dff3bbd24e1df2755934dd2b07b`.
All three relocated 64-byte records retain the name `Tabard of Lordaeron`,
icon `INV_Banner_02`, null achievement gate and `u32` values
`(90012, 16078, 15)` at offsets `0x30`, `0x34` and `0x38`.

| Native role | Preferred VA | File offset | SHA-256 of 64-byte record |
| --- | --- | --- | --- |
| Rewards list | `0x14657d050` | `0x657c450` | `8fa9b142fc957dbcf0e0b9aa383eb8f3e138ad2cd04fb2bc4be079bb1e91ead5` |
| Shared tabard range | `0x1473b98f8` | `0x73b8cf8` | `72e259881b927ec5b4ccf3426772c1485031730e137d39f757d4743138031e95` |
| Item metadata | `0x1473c9cc0` | `0x73c90c0` | `1b42450d20e649ebedd9e825a3e1f7e30c386cc63a89e1e0aad3eb0b415366d7` |

Capstone 5.0.7 decoded from the declared unwind starts against the selected
EXE bytes. The 21-card list at `0x1401b6400..0x1401b6913` (file offset
`0x1b5800`, SHA-256
`0e8fa054f717a90b2790348abdde7729fdcc26ce3754109ad1c92b186e575e07`)
loads the first record at `0x1401b665e`, places it in `[rsp+0x40]` and
calls `0x14028d590` at `0x1401b6687`. The caller at `0x140293e4d`
reaches the list directly. The current Rewards diagnostic sites fall in
`0x1401af840..0x1401b00e3` and `0x1402b4380..0x1402b54b7`.
Their module correspondence remains pending. The second record is at
zero-based index nine in the 21-row range `0x1473b96b8..0x1473b9bf8`, between
Stormwind 90011/21337 and Stromgarde 90013/36468. The bound pair is loaded
at `0x145df0536` and `0x145df0545`. A second producer loads the same
pair at `0x145e791b1` and `0x145e791bc` and passes it to
`0x146045160` at `0x145e791d3`.

The item constructor at `0x145e5c710..0x145e5da68` (file offset
`0x5e5bb10`, SHA-256
`c22225f073038aa09886bdb28055a2e35179fa188b0f6eef3702ec3890624c1d`)
subtracts 90001 at `0x145e5c739` and guards the index against `0x71`
before dispatching via the signed table at `0x1473d36b8`. Index 11 reads
`4891a8fe` at `0x1473d36e4` (file offset `0x73d2ae4`) and targets
`0x145e5c800`. That arm loads the third record into `r12`, then the
shared block reads `[r12+0x34]` at `0x145e5c976`, stores the display
at `[rsi+0x54]` at `0x145e5c9c5` and stores tabard lane `0x12`
at `[rsi+0x68]` at `0x145e5c9d3`. The current
[diagnostic inventory](coverage/diagnostic-ownership.json) locates
`crates/wenilla-rogue/src/gear.rs` references at `0x145e5da02`,
`0x145e5da16` and `0x145e5da54` within that same extent. This supplies
a bounded display-selection and metadata contract for
`systems[id=custom-game-gear]`.

The current installed `patch.MPQ` and `patch-D.MPQ` hashes match the
0.141.1 values below. Read-only member lookup across all thirteen archives
resolved `ItemDisplayInfo.dbc` only in `patch.MPQ`, with the same member
hash. Its 92-byte row 16078 at DBC offset `0x12e48c` hashes to
`67cd10fc625e798cdd4f39b46682cc2084d9343aa3f16560e35d0cd4ad9275c0`.
The two unisex Hillsbrad BLP2 members resolve only in `patch-D.MPQ`, at
archive file offsets 12130 and 32 for upper and lower respectively. Their
dimensions and hashes match the table below.

The live source applies display 16078 to item 90012 in
[`Catalog::embedded`](../../crates/azeroth-survivors-re/src/progression.rs).
The Rewards cards iterate that catalog. The shared `tabard_display_id`
reaches the [appearance](../../crates/azeroth-survivors-re/src/armory.rs)
and [item metadata](../../crates/azeroth-survivors-re/src/gameplay/client/inventory.rs)
consumers. This compares the selected descriptor, Rewards card argument,
item metadata write and installed asset inputs. Native mount and compositor
behavior, compilation, rendering, item-cache behavior and original/rebuilt
comparison remain open.

## 0.141.1 native display selection

The original proof used `installed-game/AzerothSurvivors.exe`, 151,534,080
bytes, SHA-256
`47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.

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
the [earlier item-constructor proof](party-rewards.md#admission-item-metadata-and-source-consumers).
The third record belongs to the 21-row range passed at `0x145dec913`.

The following Ghidra results were verified against the PE bytes and the
completed raw-slice journals. The original PE operands supply the external
table destinations outside the slices. The shared analysis store retains the
result objects by digest.

| Procedure | EXE offset and byte count | Raw-slice SHA-256 | Verified result SHA-256 |
| --- | --- | --- | --- |
| Rewards list `0x140131270` | `0x130670`, 1299 | `7b6b4cb621428e4219ceaa476f18dabc74b752516f0389e6a96c3f11b2345fa5` | `3e00401215390f73e6ff5e40867d95da5b16c32916dff49282d650af47165226` |
| Item constructor `0x145e33ea0` | `0x5e332a0`, 4952 | `2f68fd089ca1f51107b8b5c6d2f3382d8c1d094d5ed13ad991d2dd279817783e` | `c6476f71e68b5290a4e028cf683ad8cf8b2b420ff105ddff3eddd157d2905b04` |

## 0.141.1 Data and rebuilt consumers

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
