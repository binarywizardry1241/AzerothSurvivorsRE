# Scholomance text consumers in 0.141.0

Installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes with
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This bounded recovery follows [the 0.140.0 locale import](scholomance-localization-0.140.0.md)
under [#142](../verification-needed.md#gap-142). The fourteen current descriptors
at `0x147ae1870` retain all 166 selected values per language. All 2,324
current native values match the corresponding source catalog entries.

## Risen Guard creature query

Class Dismissed creates a Risen Guard with creature entry 9614. Its native
32-byte descriptor at `0x1473a3240` contains the raw name, entry, display
7848 and scale 1.4. Creature-query opcode `0x60` selects the named branch
through the signed cell at `0x147aec820`. The branch at `0x145ea0659`
loads the descriptor and calls `0x145db5d50`. That getter formats
`object.{id}.name` from the entry at descriptor `+0x10`. The locale
lookup falls back to the raw descriptor name if it returns a null pointer.
An empty translation has a non-null pointer and remains empty.

The branch takes display from descriptor `+0x14`, uses creature type 10,
rank zero and an empty subtitle, then calls the ordinary creature template
constructor at `0x145fe9320`. The reconstructed query previously resolved
9614 through the older empty-name, type 8 and display 15290 row. It now
publishes the current named template through the existing packet and client
cache path. Solo queries use the selected locale. The co-op host uses the
requesting member’s locale for the same constructor.
[Creature query](../../crates/azeroth-survivors-re/src/gameplay/client/creature_queries.rs),
[member request](../../crates/azeroth-survivors-re/src/gameplay/coop_commands.rs).

## Encounter, equipment and progression formatting

The Office and Examination producers find the living actor row for the
source GUID and obtain its localized boss name. Each separately looks up the
warning literal and keeps its raw `%s` slot. The common serializer
`0x145fdbe30` emits chat type `0x5a` with the speaker separate from the
body. The [Gandling script](../../crates/azeroth-survivors-re/src/gameplay/mechanics/gandling.rs)
and [announcement adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/announcements.rs)
already use this presentation. [Encounter state](scholomance-encounters-0.140.0.md)
owns attack scheduling, hit logic and the other bosses’ incomplete actions.

The tier 7 eight-piece tooltip selects the class record, localizes its
ordinary and empowered descriptions separately, then substitutes the
`bonus`, `stars`, `max` and `empowered` arguments. The numeric operands
are 3 and 5. Armory uses the same descriptions in the set details. Item
names use `t05.{native_id}` and set names use `set.{class}.7`.
[Item tooltip](../../crates/azeroth-survivors-re/src/gameplay/client/inventory.rs),
[Armory labels](../../crates/azeroth-survivors-re/src/armory.rs).

The Prepared win path inserts a newly qualifying class and formats the notice
with the resulting saved count, total 9 and the localized class name. Before
the system-chat constructor, the native owner wraps the whole formatted
notice in `|cff40ff40` and `|r`. The reconstructed notice now applies that
wrapper around the existing recipient-localized template.
[Prepared delivery](../../crates/azeroth-survivors-re/src/gameplay/mod.rs).
The Heroic Across Azeroth card already joins the localized missing-zone
names with comma-space for `Still to beat: {zones}`. The Prepared reward
descriptor and Armory’s Lifestealing choice keep their separate localized
labels. [Achievement card](../../crates/azeroth-survivors-re/src/progression.rs),
[set and progression producers](scholomance-0.140.0.md).

## Static evidence

| PE range | Preferred VA | File offset | Bytes | SHA-256 |
| --- | --- | --- | --- | --- |
| Risen Guard descriptor | `0x1473a3240` | `0x73a1840` | 32 | `cbdf69bf993f9b2c2a1592565f73baa1131862b7ab43c7f4d1a5692939ce4553` |
| Entry 9614 jump cell | `0x147aec820` | `0x7aeae20` | 4 | `bba0296c64f9fa4afb9cdb729ad4c0578a4854cd7ed1feee3a7744cdd24948fa` |
| Named creature branch | `0x145ea0659` | `0x5e9fa59` | 131 | `580f7aee3b4096a807176184c06d4a8b1d0a7907e1d33c0f401386ddf7c904ee` |
| Object-name getter | `0x145db5d50` | `0x5db5150` | 151 | `656d8c7d3e71273fa7a3c4aec4def1f7fcc1ec71f0a0c5328540047d1742a903` |
| Office warning | `0x14600ff93` | `0x600f393` | 71 | `29062850e03dfa3bcfff7dc8eb34401ce2a5e0986caf83fa1076fb51806c671a` |
| Examination warning | `0x14600eeb3` | `0x600e2b3` | 71 | `878f1fbfe192334c68f6dab95c27566a163f498f76aecbcdf68c9c69bdbaab0c` |
| Tier 0.5 tooltip | `0x145e325e6` | `0x5e319e6` | 436 | `01e12f2f6db850ee7c7012a9160b047e805b490adb34f836f77b8cb337d50cbd` |
| Prepared notice | `0x145ec26e5` | `0x5ec1ae5` | 572 | `59f1ba059a86a10a28d4ee4e3d14060072e080939694496cc242c1e1c1052005` |
| Heroic Across Azeroth card | `0x14033f1c9` | `0x33e5c9` | 143 | `27558aff47af2ced65e49f8369002eb16f1138ade0807b770e4a09dfa2ecaa7f` |
| Locale descriptors | `0x147ae1870` | `0x7adfe70` | 784 | `ecdc0eec7b39e5fb07ced1d60317d820fc9ca39320184a44db36a2a64ffed515` |

The journaled Ghidra getter result is
`ev_c36d5b1cda0a83047b4a2a0a42fc5e91df0ef1e8e1f04f734da9c7296e4d7e2a`.
The shared subject validator checked the original PE bytes, slice address,
journal and result digests. Original instructions establish the branch
arguments where the raw slice leaves external calls opaque. Source checks
validated the query row and the post-insert Prepared formatting inputs.
Rustfmt parsed both changed Rust files. The authored query regression,
compilation, live client and guest delivery, rendered presentation and
original/rebuilt comparison remain open.
