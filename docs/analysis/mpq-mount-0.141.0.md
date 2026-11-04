# Survivors MPQ mount and resource consumers — 0.141.0

`Q41-R01` under [#41](../CURRENT-STATE.md#gap-41) identified the mount
regression tracked in [#320](../verification-needed.md#gap-320).
The [twelve archive receipts](evidence/0.141.0/mpq-member-coverage.json) bind
the installed Data to `installed-game/AzerothSurvivors.exe` SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The archive identities, tables and listfiles match 0.140.0. A fresh in-place
walk verifies 30,172 active hash slots, 30,161 distinct normalized names,
zero opaque slots and zero existing blocks without a hash reference. Only
`(listfile)` has more than one archive occurrence.

## Native directory admission

`Q41-I01:resource_path:305` starts at file offset `0x7b6f289`. Its lexical
span includes ten adjacent archive names. The actual 16-byte pointer/length
rows start at VA `0x147b70cf0`, file offset `0x7b6f2f0`. The 160-byte table
has SHA-256 `4ce1580d7f3fb8fae1e2886d63200ef284484cdb6d447720d81cbf84f6a9c8a1`.
It orders the base archives as `dbc`, `speech`, `fonts`, `interface`,
`misc`, `sound`, `wmo`, `terrain`, `texture`, and `model`.

The current Survivors `terrain.rs` owner at `0x146009360` calls Chain open
at `0x1460093fc` (`e8 4f 3b 23 00`, target `0x14623cf50`). The owner
contains five verified Rust Location references for that path in the
[diagnostic inventory](coverage/diagnostic-ownership.json).
Chain open takes the directory branch, collects its listing, passes the
table bounds from `0x14623d1e4` and `0x14623d1f2` to `0x1462e7270`,
and then appends `patch.MPQ`, the sorted single-character patch suffixes
collected by `0x1462e7a00`, and `speech2.MPQ` when present.
The base collector compares each descriptor against the case-folded listing.
Both exhausted searches (`0x1462e7318` → `0x1462e72b0` and
`0x1462e74b8` → `0x1462e7460`) advance to the next descriptor. This permits
the shipped directory, which has zero stock base names. A selected archive
failure returns an error when the open helper at `0x1462099c0` returns tag 1.
An empty mounted set also returns an error. The `patch-` prefix, `.mpq`
suffix and single-character check are visible in the matcher at `0x146248290`.

Journaled Ghidra pseudocode was checked against the original Win64 branch
and call bytes. The operation results are in the shared analysis store by
the digests below. Slice ranges are half-open preferred VAs.

| Operation | Raw slice and SHA-256 | Verified result SHA-256 |
| --- | --- | --- |
| Chain open `0x14623cf50` | `[0x14623c990, 0x146241f66)`, file `0x623bd90`, `df332132be9d221fbda1ebeef185140f34e2bad885b9c763f83867d94a46b095` | `7c52372f506bbef2606bd45a9ce2173b093670d4a3c35804464c591c9208d17a` |
| Base collector `0x1462e7270` | `[0x1462e7270, 0x1462e7c2e)`, file `0x62e6670`, `2543433a60a32becc37e91d04d308557c39f54dbd62c67b005b44b7f3bd3de0b` | `8fbd407cb302c2beb6224b36b4d03a7232f5f93b0502d3948c79347b995a306e` |
| Patch collector `0x1462e7a00` | Same slice as the base collector | `08b332aeda6f2d59b2c40657cb2c598fa8f4e34c36d1e176c9fdc3cd512d1c7f` |

## Rebuilt consumers

The benilla integration made every base filename mandatory. Opening the
supplied directory therefore failed on `model.MPQ` before reaching the
first patch. The [Survivors entry point](../../crates/azeroth-survivors-re/src/main.rs)
now selects the recovered mount policy at startup, before any data check
or asset registration. This covers the [Bevy asset source](../../crates/benilla-assets/src/lib.rs),
[WorldAssets](../../crates/benilla-world/src/assets/mod.rs),
[FrameXML chain](../../crates/benilla-app/src/ui_script/reference_ui.rs)
and [direct data readers](../../crates/azeroth-survivors-re/src/assets.rs)
through their existing [Chain](../../crates/benilla-formats/src/chain.rs).
The policy is process-wide because FrameXML caches its chain per process
and the other consumers open theirs independently. The Survivors floor
probe, the other executable entry point, also selects the policy before
its open. The chain continues to reject missing base names in stock 1.12.1
mode.

In-place payload reads check representative consumers through the exact
member paths in the verified source projection. The table retains the
previously recovered DUST2B data relationship because both supplying
archive hashes match its 0.121.0 evidence and its texture path remains
unique in the selected chain.

| Exact member | Archive | Consumer or retained evidence |
| --- | --- | --- |
| `DBFilesClient/Map.dbc` | `patch.MPQ` | World startup calls [the map catalog loader](../../crates/benilla-world/src/world_map.rs). |
| `Interface/FrameXML/FrameXML.toc` | `patch.MPQ` | [The FrameXML loader](../../crates/benilla-app/src/ui_script/reference_ui.rs) opens the TOC and follows its rows. |
| `Q41-I01:resource_path:0..5` | `patch.MPQ` | All six current spans start at `//` in complete `mpq://` keys. The six BLP2 payloads and both left-arrow counterparts decode in place. Their [progression, Armory and meter consumer proof](as-resource-paths-0.113.2.md) retains its native provenance. |
| `Interface/Glues/LoadingScreens/LoadScreenScholomance.blp` | `patch.MPQ` | [Scholomance entry](scholomance-entry-0.140.0.md) records loading screen 102. |
| `World/Generic/PassiveDoodads/DuelingFlag/DUST2B.blp` | `patch-B.MPQ` | [#246](../verification-needed.md#gap-246) retains four authored model particle references in the unchanged `patch.MPQ`. |
| `World/Maps/SchoolofNecromancy/SchoolofNecromancy.wdt` | `patch-C.MPQ` | The [terrain stream](../../crates/benilla-world/src/terrain_stream.rs) builds this key from the map directory. Its 32,836-byte payload matches the [earlier WDT digest](scholomance-0.140.0.md#zone-entry-resources-and-unlocks). |

## Explosive Orb model

[#248](../verification-needed.md#gap-248) resolves to the exact model in
`installed-game/Data/patch-C.MPQ`, SHA-256
`b2b17d7732de1902e1befed90eeed0fc9588c88d8951a396559f6937c3928a44`.
The [0.121.0 report](explosive-orb-model-0.121.0.md) preserves the native
publication and filename proofs and the negative searches in its eleven
archives. The selected twelve-archive chain supplies the original name.

The live [Explosive affix](../../crates/azeroth-survivors-re/src/gameplay/mechanics/affixes.rs)
spawns [ward template 12](../../crates/azeroth-survivors-re/src/bosses/raid_wards.rs)
with entry 9612, display 16111 and scale 0.9. The [ward visual adapter](../../crates/azeroth-survivors-re/src/gameplay/visuals.rs)
passes that display to the shared creature path. The selected
`CreatureDisplayInfo.dbc` and `CreatureModelData.dbc` in `patch.MPQ` are
byte-identical to the [historical DBC receipt](evidence/0.121.0/resource-consumer-9612.json).
Display 16111 selects model 2247 and variation `SporeCreature_DeathParticle`.
The [catalog](../../crates/benilla-formats/src/creatures.rs) supplies the
authored `Creature\SporeCreature\SporeCreature.mdx` to the
[creature display](../../crates/benilla-app/src/entities/display.rs).
The [shared URL helper](../../crates/benilla-assets/src/lib.rs) normalizes it
to `mpq://creature/sporecreature/sporecreature.m2` for the existing chain.

The M2 is a 206,624-byte `MD20` version 256 payload in hash slot 424,
block 14, starting at archive offset 439,345. Its SHA-256 is
`7a500a0c250fee9f6671822935b59f9d34b5c748f68591bfc71a3904e5c2664d`.
The texture table at model offset `0x30700` has six rows. The four
emitters at `0x31440` use the following authored filenames. Their
geometry and recursion filename fields are empty.

| Emitter / texture row | Exact BLP2 member | Archive | Payload SHA-256 |
| --- | --- | --- | --- |
| 0 / 2 | `Spells/Shockwave9.blp` | `patch.MPQ` | `8f51ecfff4aa2f8446703e72c75f8062a2bc2058739131d3398d04bcec2ce644` |
| 1 / 3 | `Creature/MountedDeathKnight/Smoke02_Flip.blp` | `patch.MPQ` | `44e1463a5be250a9345eded8735eb57f924009f8ecfea85591e1f6d9eb334412` |
| 2 / 4 | `Creature/MountedDeathKnight/Smoke02A.blp` | `patch.MPQ` | `0d7d1b0f73981168087704cc29e4c9c5f589a8860402d12b370ea5afd7c47945` |
| 3 / 5 | `Creature/SporeCreature/SporeCreature_DeathParticle.blp` | `patch-C.MPQ` | `f00f25c131e1f904c5ddffbd64f28927cb237472b436fccbebe26f475596735d` |

The archive identities, exact name lookups and payload reads were checked
in place with the existing MPQ reader. Both DBCs, the M2 and each emitter
texture have one exact match in the mounted archives. The [M2 loader](../../crates/benilla-assets/src/m2.rs)
already forwards the emitter texture names to the image loader. This
closes the named-resource gap through the existing source route.
Compilation, in-game model loading, rendered particles and original/rebuilt
comparison remain open.

## Checks and remaining scope

`python3 -B scripts/inventory-current-mpq-members.py` reproduces the
archive proof and the three full inventory output digests.
`python3 -B scripts/test-current-mpq-members.py` passes three source
projection cases. The repository's pinned rustfmt parses the three Rust files.
The new Rust mount-order regression covers patch-only, partial-base and empty
directories and remains uncompiled.

The raw lexical inventory remains 85 exact names, 196 basename candidates
and 44 unmatched strings across 325 selector rows. The packed archive table
and the sampled keys above have bounded dispositions. The other resource
consumers, dynamic aliases, locale precedence, and loading, rendering and
original/rebuilt comparison remain open under [#41](../CURRENT-STATE.md#gap-41).
No archive or asset was exported.
