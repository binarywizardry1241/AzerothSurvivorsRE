# Armory equipment palette in 0.141.0

The installed `installed-game/AzerothSurvivors.exe` has SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [declared-range review](executable-residual-roles-0.141.0.md#incoming-cells-for-the-remaining-36-ranges)
identifies the incoming dispatch cell for Q41-U01 row 1999.

The Armory equipment list calls the row builder at `0x1402dd357`.
The row builder receives an optional item descriptor. The absent descriptor
has a `-1` first qword and selects the paperdoll placeholder asset and
the localized `armory.empty` label. The occupied path resolves the
item's icon and reads descriptor tier at `+0x30` and item class at
`+0x58`. The icon and 14 px item name use separate dispatch tables with
the same color selection.

| Descriptor tier | Icon border and name RGB |
| --- | --- |
| 0 or default | .91, .91, .91 |
| 1 | .118, 1, 0 |
| 2 | .231, .612, 1 |
| 3, 4 armor, 5 and 7 | .761, .486, 1 |
| 4 weapon, item class 2 | 1, .604, .165 |

The 32 × 32 px icon has a one-pixel border and a four-pixel corner
radius. Each side receives the same color. The empty icon has a black
border and uses the same white image tint as an occupied icon. The
empty name is RGB (.42, .39, .33). The [descriptor trace for inspection](coop-inspection-0.141.0.md#item-kind-and-model-stage)
binds the tier and class fields to the live item producer, including
the stored PvP digit 6 normalizing to tier 5. The catalog already exposes
that tier as rarity 5.

The [ordinary equipment view](../../crates/azeroth-survivors-re/src/armory.rs)
uses the recovered icon border and shares the quality color with the
[co-op inspector](../../crates/azeroth-survivors-re/src/coop_inspect.rs).
The inspector's separate edge and fill colors keep their existing consumers.

| Native range, end exclusive | File offset | SHA-256 |
| --- | --- | --- |
| Row call `0x1402dd31f..0x1402dd35c` | `0x2dc71f` | `30cf458f629be42abc4de0f44f297940949284302062d7dacfb187251062c3b4` |
| Icon selector `0x140396eaa..0x14039703f` | `0x3962aa` | `82c0fba48817d80f45a88c090779acf64678c9d096ad95693babb607cc50a815` |
| Icon bundle `0x14039703f..0x140397309` | `0x39643f` | `7ef7d003c9c720badf985cf94ae7fa4a88b453b0c14cbe15a4a599a3c16c5c54` |
| Image initialization `0x1434a4810..0x1434a484f` | `0x34a3c10` | `d839d86eb9d61d27299d94dc47fae465c535c9a58f365212541e1c411ef1b2ee` |
| Name dispatch `0x140397a72..0x140397aa4` | `0x396e72` | `4bf89df134d06a63d78a718eeafb2a7a750d51d247ed4e948a8914eaa6bdab09` |
| Name color branches `0x140397c30..0x140397c6d` | `0x397030` | `8a413548d874adafd74617757e5ee590d07cf91b06c0d67da88478831d5f20b6` |
| Name color stores `0x140397d4e..0x140397d92` | `0x39714e` | `b0e5964666735eae08ad185b0c2b90b2ac08aa54d816421afd75864188e9c917` |
| Icon table `0x1465cba78..0x1465cba94` | `0x65ca078` | `9afea29fe7ab60c27939138313cb8a9e01731c734e3ed7617b0131f4e2583d31` |
| Name table `0x1465cba94..0x1465cbab0` | `0x65ca094` | `6ef02d82ba84319560d56871cc8a4c47789383ea2c47c94b6647906926f1a5bb` |

Journaled Ghidra decompilation
`ev_2955177d3240531b4ad84305cf5bfd10a279e34fa30f9e60aff5edeb6439fd40`
used the exact row body at file `0x396210`, 5,130 bytes, SHA-256
`c00b74e7bc832df895e0087d5844d1cceb68ea8df02650a0262c0a39d1dea2fd`.
Its result SHA-256 is
`a697ce41c25088a4f7462ba2bff4069e5fb1cd070a7adfd5b5d76ad1d9619968`.
The separate native tables and direct instructions establish the cases.

Thirty original-instruction name cases matched the source color bits.
Nine icon cases captured the native node, four border colors and image
tint, with preloaded item handles and a byte-copy seam. Rust syntax and
whitespace checks passed. Compilation and rendered comparison remain open.
