# Survivors MPQ mount and resource consumers

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
| `Q41-I01:resource_path:0..5` | `patch.MPQ` | All six current spans start at `//` in complete `mpq://` keys. The six BLP2 payloads and both left-arrow counterparts decode in place. Their [progression, Armory and meter consumer proof](as-resource-paths.md) retains its native provenance. |
| `Interface/Glues/LoadingScreens/LoadScreenScholomance.blp` | `patch.MPQ` | [Scholomance entry](scholomance-entry.md) records loading screen 102. |
| `World/Generic/PassiveDoodads/DuelingFlag/DUST2B.blp` | `patch-B.MPQ` | [#246](../verification-needed.md#gap-246) retains four authored model particle references in the unchanged `patch.MPQ`. |
| `World/Maps/SchoolofNecromancy/SchoolofNecromancy.wdt` | `patch-C.MPQ` | The [terrain stream](../../crates/benilla-world/src/terrain_stream.rs) builds this key from the map directory. Its 32,836-byte payload matches the [earlier WDT digest](scholomance.md#zone-entry-resources-and-unlocks). |

## Explosive Orb model

[#248](../verification-needed.md#gap-248) resolves to the exact model in
`installed-game/Data/patch-C.MPQ`, SHA-256
`b2b17d7732de1902e1befed90eeed0fc9588c88d8951a396559f6937c3928a44`.
The [0.121.0 report](explosive-orb-model.md) preserves the native
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

## Exact URI and locale accounting

The selected [member inventory](evidence/0.141.0/mpq-member-coverage.json)
has locale and platform zero in all 30,172 active hash slots. Its only
repeated normalized name is `(LISTFILE)`, once per archive. Thus the
installed gameplay payloads have no competing locale or archive variant.
Precedence for mixed or differently localized archives remains open.

Select the twelve resource-path ordinals `0..5`, `38`, `60`, `66`, `67`,
`200`, and `201` in `resource-leads.jsonl`. In each row, the four bytes
immediately preceding the literal are `mpq:`. Removing that scheme and
its two separators, then folding slash and case, yields a unique exact
member. The raw lexical counts are preserved because the selected string
spans begin at `//`. Three short `//textures/…` names have no lexical
basename candidate because the Windows path parser treats the two
components as a UNC root.

| Ordinal | Exact `patch.MPQ` payload | Existing source consumer |
| --- | --- | --- |
| `38` | `Textures/ShadowBlob.blp`, 2,709 bytes | [Blob shadow](../../crates/benilla-app/src/blob_shadow.rs) |
| `66` | `Textures/UnitSelectTexture.blp`, 175,934 bytes | [Target ring](../../crates/benilla-app/src/target/ring.rs) |
| `201` | `Textures/WaterPoop02.blp`, 88,580 bytes | [Liquid drift](../../crates/benilla-world/src/liquid/drift.rs) |

Each of these three members was read in place and has a `BLP2` header.
They establish shared rendering inputs. Ordinal `61`, `-Pet.blp`, is a
formatting suffix adjoining `Interface\CharacterFrame\TemporaryPortrait`.
The [existing portrait builder](../../crates/benilla-app/src/portrait/mod.rs)
constructs the unique 6,660-byte `TemporaryPortrait-Pet.blp` member, also
read in place. Ordinal `213` is the `_s.blp` specular suffix. Ordinals
`309..311` retain `_U.blp` separately in the guild-emblem background,
border and emblem path formats.

The other 36 raw unmatched rows have these reproducible groups:

| Resource-path ordinals | Lexical context and next action |
| --- | --- |
| `68`, `70`, `76`, `81`, `90`, `129`, `148`, `162`, `170`, `173`, `175`, `177..181`, `219` | [Builtin glue, FrameXML payloads and lexical comments](source-frontier.md#builtin-glue-and-framexml-resource-selectors). |
| `36`, `37`, `41`, `62`, `202`, `301..304`, `307`, `315..318`, `320`, `321`, `323`, `324` | [Exact DBC readers and diagnostics](#packed-dbc-readers). |
| `305` | [Archive descriptor table](#native-directory-admission). |

The dynamic format programs at file offsets `0x66ab9f8`, `0x69cbe98`
and `0x7b71b50..0x7b71b70`, `0x7b71b70..0x7b71b95` and
`0x7b71b95..0x7b71bba` carry the literals for selectors `61`, `213` and
`309..311`. The existing [portrait builder](../../crates/benilla-app/src/portrait/mod.rs),
[terrain layer reader](../../crates/benilla-assets/src/adt.rs) and
[tabard compositor](../../crates/benilla-formats/src/characters/sections.rs)
own those path families. The in-place check reads the pet fallback and the
Elwynn grass specular BLP. The selected listfiles carry no `GuildEmblems`
members, and the format literals establish no AS producer for guild state.

### Packed DBC readers

The [resource proof](evidence/0.141.0/resource-consumers.json) lists the
exact PE instruction sites for 22 readers. The separate CreatureSoundData
catalog read is described below. Each loads a slice into
`r8:r9` before calling the member read interface at `0x14623e170`.
That interface checks `0x146243a60` for a registered override before
falling back to the chain at `0x14623c640`. The separately selected
short labels passed on the stack to `0x1462e21a0` name tables in the
parse and error context. The shared source counterpart uses
[`Chain::read_file`](../../crates/benilla-formats/src/chain.rs) and
[`dbc::parse`](../../crates/benilla-formats/src/dbc.rs). The local
[PaperDoll trace](source-frontier.md#paperdoll-core-file-and-localized-gear-prefix)
identifies a separate live override writer.

| Ordinals | Native input boundary and rebuilt source |
| --- | --- |
| `36`, `37`, `41` | In `0x140a5eca0`, these are length-prefixed warning templates. The first bytes `5`, `.` and `C` encode 53, 46 and 67, respectively. The calls at `0x140a60967`, `0x140a6083f` and `0x140a60d7e` reach the real CreatureSpellData, Resistances and NameGen readers before the failure branch. [Entity startup](../../crates/benilla-app/src/entities.rs). |
| `62`, `202` | Warning prefixes of lengths 54 and 55. `0x140ec3428` and `0x141cf4745` reach CreatureType and Light readers. [Target scan](../../crates/benilla-app/src/target/scan.rs), [world lighting](../../crates/benilla-world/src/lighting/resolve.rs). |
| `301`, `318`, `320` | The repeated Package, MailTemplate and Stationery names are error/read labels and parser labels. [Mail data setup](../../crates/benilla-app/src/ui_mail/mod.rs). |
| `302..303` | The leading nine-byte `Interface` slice in row 302 reaches a separate path helper from `0x14621da1b`. The remaining pieces select the three separate Languages, LanguageWords and ChrRaces member reads and short parse labels. [Language tables](../../crates/benilla-formats/src/languages.rs), [race table](../../crates/benilla-formats/src/chr_races.rs). |
| `304`, `307` | SpellShapeshiftForm and SkillLineCategory each have separate member, schema and parser labels. [Form table](../../crates/benilla-formats/src/spells/forms.rs), [skill tables](../../crates/benilla-formats/src/skill_lines/mod.rs). |
| `315..316` | DurabilityCosts, DurabilityQuality, ChrClasses, Resistances and Lock are separate reads. The durability parser labels omit `.dbc`. [Repair data](../../crates/benilla-formats/src/durability.rs), [class data](../../crates/benilla-formats/src/chr_classes.rs), [resistances](../../crates/benilla-formats/src/resistances.rs), [locks](../../crates/benilla-formats/src/lock.rs). |
| `317`, `321`, `323`, `324` | SpellRange, SpellDuration, SpellIcon and SpellChainEffects resolve separately. These are the shared typed readers. The custom AS spell metadata cache still has its [separate evidence and source](custom-dbc.md). [Ranges](../../crates/benilla-formats/src/spells/ranges.rs), [durations](../../crates/benilla-formats/src/spells/duration.rs), [icons](../../crates/benilla-formats/src/dbc.rs), [chain effects](../../crates/benilla-formats/src/spell_visual/chain_effects.rs). |

All 21 concrete member names resolve uniquely to `patch.MPQ`. Each
payload has a complete WDBC record and string extent. This resolves the
packed names and the selected read and parser boundaries. Individual field
consumers and competing-locale precedence remain separate.

The Ghidra 12.1.4 result digests are
`640f45d580e0a9a082e2cb30caf899c2b99e2c79899de8c45a67f494265927b2`
for the member read and
`289d183bf071f9d587694a353348c35814a2b15c5e5f4e1ebc0ff2d6a9135093`
for the table parser. The raw slice SHA-256 and native VA intervals are
in the same resource proof. Original PE instructions establish the Win64
argument carriers independently of the raw-slice decompiler's inferred ABI.

## Registered resource overrides

The selected-census references to the writer at 0x146244270 contain
nine direct call sites. The [override proof](evidence/0.141.0/resource-consumers.json)
binds the exact calls, native ranges, and Ghidra results to this EXE.
The writer calls 0x146243ed0 at 0x1462442e7 and uses the shared map at
0x148ac3210. The reader at 0x146243a60 calls the same key helper at
0x146243aeb and reads that map behind the same lock at 0x148ac3208.
The ordinary member reader calls the override lookup at 0x14623e1a5
and takes the archive fallback at 0x14623e1cb on the missing result.
This classifies the selected data state under Q41-B02 and its immediate
read/write paths under Q41-R01.

| Writer call | Native producer |
| --- | --- |
| 0x145dd50b1, 0x145ddb206, 0x145ddb6be, 0x145ddbbee | StaticPopup, ReputationFrame, WorldStateFrame, and [PaperDoll](source-frontier.md#paperdoll-core-file-and-localized-gear-prefix) core-file appends. |
| 0x145dd6add, 0x145dda6f0 | [Locale-dependent font replacement and provider rows](font-table-publication.md). |
| 0x145fda6d3 | The [GlueStrings transform](q41-glue-strings.md) republishes its result under the existing 33-byte path. The exact current producer is 0x145fda5e0. |
| 0x145e5fe3c | Startup at 0x145e80f20 invokes the CreatureSoundData producer at 0x145e5fd70. It reads the 35-byte key at 0x14772a8b4 and calls 0x145e5fc30. The current transform checks the WDBC header, stride and record extent, clones the bytes, and replaces field six only when it equals 8449. The installed input has one matching row, 2068. The existing [voice-cache transform](creature-death-sound.md) supplies this behavior under [#182](../verification-needed.md#gap-182). The adjacent spell label in Q41-I01 resource selector 227 is outside the key. |
| 0x145fee154 | Startup at 0x145e80f16 invokes the binding file publisher at 0x145fedfc0. Two 24-byte local descriptors carry path pointer, length and transform pointer. The successful read branch calls the selected transform at 0x145fee11c and publishes under the same path. The read-failure branch logs and advances without writing an override. |

The binding descriptors select the 31-byte Interface\FrameXML\Bindings.xml
at 0x147af4970 and 23-byte WTF\DefaultBindings.wtf at 0x147af498f. Their
transforms are 0x145fed7c0 and 0x145feddc0. The first supplies the
AZS_OPENLEVELS, AZS header, and AZS_OpenStoredLevels() XML insertion. The
second trims the input tail and appends the formatted CRLF default Y binding.
The ordinary native readers use separate copies of the same keys. The default
reader at 0x140e8ce0d reaches 0x140a8c950 and its archive route at 0x140a8cc39
calls the override-aware member reader. The two XML readers at 0x140e8d6ba and
0x140e8e09d use that same interface. Both installed source files are in
patch.MPQ and lack the AS command before the patch.

The rebuilt [VM loader](../../crates/benilla-app/src/bindings.rs) already
applied the extension's default Y. The [account-data layer](../../crates/benilla-app/src/account_data/mod.rs)
used the stock file alone when converting a downloaded full table to the
local binding diff and when expanding legacy diffs for upload. That omitted
an explicit unbind for a nonempty downloaded table without AZS_OPENLEVELS,
causing Y to reappear when the VM resolved the diff. It could also omit Y
from legacy-diff uploads. Account data now seeds its default table at startup
from the same stock and extension pair sequence as the VM. The existing key
table resolves collisions in file order and the account reset preserves that
table. The regression covers the upload, an explicit unbind on download and
the subsequent diff resolution. The historical binding scope is retained under
[#21](../verification-needed.md#gap-21).

## Checks and remaining scope

`python3 -B scripts/inventory-current-mpq-members.py` reproduces the
archive proof and the three full inventory output digests.
`python3 -B scripts/test-current-mpq-members.py` passes three source
projection cases. The repository's pinned rustfmt parses the three Rust files.
The new Rust mount-order regression covers patch-only, partial-base and empty
directories and remains uncompiled.

The raw lexical inventory remains 85 exact names, 196 basename candidates
and 44 unmatched strings across 325 selector rows. The scoped
`check-as-resource-paths.py --current-consumers` check verifies the 22
member readers, the associated native diagnostics and current payloads,
the [builtin UI joins](source-frontier.md#builtin-glue-and-framexml-resource-selectors)
and the [zone loading artwork](zone-entry-loading-progress.md#desktop-zone-artwork).
Dynamic aliases outside these exact joins remain under [#41](../CURRENT-STATE.md#gap-41).
Actual loading, rendering and original/rebuilt comparison remain open.
No archive or asset was exported.

The expanded resource check validates nine exact override call sites, the
binding member digests and the CreatureSoundData input in place. Rust syntax
and the source call paths were checked. The authored binding regression,
network delivery and live binding interaction remain unverified.

## Progression images and creature table diagnostics

`Q41-I01:resource_path:0` and `:4` begin four bytes into the original
`mpq://` URI. The 0.141.0 instructions copy the complete 62-byte progression
bar key and 56-byte dragon key into the same typed image loader at
`0x1400d65b0`. Both BLP2 members resolve in `patch.MPQ`.

| Image | Native loader and consumer | Connected source |
| --- | --- | --- |
| Progression bar | `0x1402cc4e5` returns the handle into `[rbp+0x1b8]`. The following block moves it into the image node, tests the fill fraction against `1.0`, selects green `(0.55, 1.0, 0.45)` or gold `(1.0, 0.78, 0.30)`, and submits the bundle at `0x1402cc5b6`. | [`progression::load_art` and `bar_flow`](../../crates/azeroth-survivors-re/src/progression.rs) use the same image and full/partial colors. [#103](../verification-needed.md#gap-103). |
| Achievement dragon | A two-entry false/true loop calls `0x140344cf0`, copies the handle into the bundle, and submits at `0x140344e9b`. The native image fields use alternate horizontal flip, alpha `0.85`, alternate side inset `18`, top `30`, and dimensions `84 × 84`. | [`progression::load_art`](../../crates/azeroth-survivors-re/src/progression.rs) supplies the handle used by [`achievements_sidebar::draw`](../../crates/azeroth-survivors-re/src/progression/achievements_sidebar.rs), with the same loop, image fields, and placement. [#104](../verification-needed.md#gap-104). |

`Q41-I01:resource_path:285..288` belong to the shared creature catalog.
Their four relocated pointer/length pairs at `0x147b6ebf8`, `0x147b6ec30`,
`0x147b6ec68`, and `0x147b6eca8` go to the failed-read diagnostic paths.
For CreatureSoundData, the successful read at `0x146236bb9` uses a separate
copy of the key at `0x147b707ec`. The `-1` sentinel branches at
`0x146236bcb` to a `reading` formatter that takes the descriptor and its
slice-display callback. The successful branch supplies the schema and
parse label to `0x1462e21a0` at `0x146236c20`. The shared
[`creatures.rs`](../../crates/benilla-formats/src/creatures.rs) loader uses
this table for row-ID validation, separate from the AS death-sound
override and playback path under [#182](../verification-needed.md#gap-182).

Three Ghidra raw-slice receipts corroborate the original PE operand and
call-site checks. The [resource proof](evidence/0.141.0/resource-consumers.json)
binds their spans to the installed image and records the URI, publication
edges, and diagnostic descriptor uses. The existing resource checker
replays these bindings and checks both image members in place.

| Slice entry | Evidence ID | Result SHA-256 |
| --- | --- | --- |
| `0x1402cbf70` | `ev_45e28ad6619250f89dae5da2b9e03e3bc3266aa181cf41f068ff510c0c50b868` | `4347a4883ebcdcc820fe491069777403b2fac62764f7c6ad9d3e6516aede9720` |
| `0x1403449e0` | `ev_d453e274977ab9d7e571b7eb12ab1b8d75c870ca9a919d412da5c38a675bb963` | `c0e8caca029619255922bc07d436bf1dbfb19925495d195aa0635181e26e37f0` |
| `0x146235580` | `ev_43c4c83fd6652f773f53faa3cbb76ce85d375f81409f8028e3d177caa0596d6e` | `dd91e7bc1f69eebccd9752d78d881b15262b5beef943ed70c72f65407e034d6e` |
