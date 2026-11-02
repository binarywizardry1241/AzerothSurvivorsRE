# Reconstruction target: 0.107.0

The configured installed reference is **0.107.0**, SHA-256
`92eaef3bc806144860ca838660286c02b66f9d7bbee0771f1f07a628209e9f7a`.
The [identity manifest](target-refresh-0.107.0.json) records its whole-file hash,
PE header, three embedded version contexts and complete installed MPQ chain.
[CURRENT-STATE](../CURRENT-STATE.md) owns remaining source/recovery issues;
[verification-needed](../verification-needed.md) owns execution/comparison status;
[reconstruction coverage](reconstruction-coverage.md) owns full-target discovery
and the separate unresolved native/source obligations under **#41**.

## Exact installed inputs

The portable input `installed-game/AzerothSurvivors.exe` resolves directly to the
EXE configured in local, ignored `.codex/reference-game.json`. It is
**140,192,768 bytes**, AMD64 PE32+, image base `0x140000000`. No EXE/MPQ copy or
symlink is created in the project, and the installed game remains unchanged.
The previous [0.105.0 record](target-0.105.0.md) remains historical.

The three `0.107.0` literals are bound to exact file offsets, VAs, context bytes
and context hashes in the manifest:

| Role | File offset | Virtual address |
| --- | --- | --- |
| Footer/build literal following `1b1c5d0a` | `0x5da98c0` | `0x145daa4c0` |
| Updater checker before `update: up to date` | `0x5dabf38` | `0x145dacb38` |
| New-version dialog before `A new version is out!` | `0x5ddb259` | `0x145ddbe59` |

The unique checker and dialog versions agree. Their discovery and the final EXE
rehash did not execute the target. Literal identity is not recovery of either
updater behavior or menu presentation.

`installed-game/Data` contains **eight MPQs / 1,641,903,179 bytes**:
`patch.MPQ` and `patch-2.MPQ` through `patch-8.MPQ`. Every installed archive was
rehashed, membership was checked, and all eight sizes and SHA-256 values match
the historical 0.105.0 resource manifest. No archive was added, removed or
changed. This establishes unchanged input bytes; content compatibility with
0.107.0 and correctness of the reconstructed consumers remain unverified.

Reference analysis reads this configured Data directly. Application launches
accept `--data-dir /path/to/Data` or `WOW_DATA`; `scripts/run-menu` resolves the
configured Data when neither is supplied. Building source requires neither the
reference EXE nor the MPQs. Users provide compatible assets at runtime.

## Source and recovery boundary

The package version, reconstruction target metadata and corresponding lockfile
entry are **0.107.0**. This metadata change does not update recovered behavior.
Earlier source, catalogs, menu footer, addresses, layouts, numeric IDs and
fixtures retain their actual target provenance until their producer/consumer
contracts and relevant dependencies are revalidated against this EXE. The menu
footer's historical source asset was deliberately retained.

The supplied [original-game changelog](../CHANGELOG.md) includes the newly
supplied 0.106.0 and 0.107.0 release notes. Those notes guide current-target
recovery; they do not establish implemented features or parity. No release
claims are inferred from the version bump. The historical changelog JSON remains
unchanged.

## Whole-file discovery and new recovery ownership

The [PE census](coverage/native-summary.json) scans all 140,192,768 input bytes
and records six sections, 346,904 declared unwind extents, 631,284 relocation
sites, 420 imports, 724 diagnostic paths and every embedded candidate class.
Of 98,119,422 executable virtual bytes, 5,072,917 lie outside the declared
unwind extents. Those bytes remain an explicit native-discovery boundary.
The whole-file inventory reproduced exactly with `--check`.

[Decoded diagnostic discovery](coverage/diagnostic-ownership.json) reproduced
17,692 references across 5,935 candidate unwind extents and all **53 custom
paths**. The summed 8,352,840 decoded bytes can overlap and are not a whole-image
coverage percentage. Every custom path has a stable owner in
[systems.json](coverage/systems.json), together with the shared-engine boundary.
Fifty retain historical partial source correspondences; XInput and the two new
systems have no reviewed native-equivalent source owner.

The [curated discovery leads](evidence/0.107.0/discovery-leads.json) review all
eight script/UI/configuration/ID/resource candidate classes, both new decoded
owner sets, all fourteen embedded locale objects, two complete embedded Lua
sources and the PE resource tree. English has 2,773 keys, including 33 new
phase keys, twelve object names and 25 mechanic warnings; each other language
has 2,683 keys. Existing source locale suppliers retain their historical counts.
Matching embedded Lua bytes do not revalidate native producers or consumers.

The new `game/hazards.rs` path, object/phase labels and supplied encounter
claims have permanent owner **#42**. The new `screens/markers.rs`, native
`MarkersPlugin` and marker geometry have owner **#43**. A scoped Ghidra body
at `140154070..140154804` clips 36-byte triangle vertices against successive
planes and emits triangle fans. This is bounded geometry recovery: exact
shape enums, line/rectangle endpoints, fill colors/timing, cast/phase rules,
actor/target/damage admission and rendering remain unrecovered. Existing AZS
world/lair flags are a separate system.

The [release crosswalk](changelog-coverage-0.107.0.md) accounts for all 161
supplied releases and 675 individual claims. All 27 new claims have explicit
ownership under #42/#43, with pending recovery, unknown implementation and
unverified parity. All 23 earlier individual reviews remain historical and
unapplied to this hash. Earlier release contexts retain their original file,
target and digest instead of being copied or upgraded.

## Full-image native census and decoding limits

The [native census report](native-census-0.107.0.md) distinguishes three full-PE
profiles and a separate bounded diagnostic-owner probe. The original bounded
profile hit a 601.142-second address-table-analysis deadline. Disabling exactly
`Create Address Tables` exposed the complete retained inventory: **347,237
procedure records / 346,889 native address-space entries / 348 external imports**.
Sixteen declared unwind starts are absent from that discovered native queue.
The 100 queried native entries in this profile have zero decoded instructions;
their 102 incoming observations are DATA references. They are not instruction
recovery. Complete retained transport results and external-space entries are
preserved instead of capped or discarded.

A separate profile enabling `Disassemble Entry Points` reached a
601.779-second global disassembly/function-body-repair deadline. Its incomplete
decoding remains **#41**. An additional full-PE probe explicitly seeded and
queried one current diagnostic owner per custom path: **53 owners / 212 facets /
1,595 instruction records / 366 outgoing and 245 incoming observations**.
Forty-six still expose one-byte placeholder bodies, including the selected
hazard and marker owners. Of seven richer bodies, five match their declared
unwind extent and two differ or are non-contiguous. Selected-entry decoding,
returned query facets and complete native bodies are separate claims.

The [owner selection manifest](evidence/0.107.0/native-census-selection.json)
retains exact target/range/seed/profile identities and these limits. Whole-image
instruction-byte coverage, global read/write classification, indirect dispatch,
external/platform implementation and full source correspondence remain unknown.
Neither the whole-file inventory, decoded diagnostic leads, scoped geometry,
bounded entry probe nor a consistent claim ledger establishes complete native
recovery or original/rebuilt parity.

No compilation, compiling tests, game launch, MPQ-content compatibility check
or original/rebuilt comparison was performed by this refresh.
