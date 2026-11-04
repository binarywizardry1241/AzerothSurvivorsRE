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

The Office and Examination producers find the actor row for the
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

## Guest warning language

The host publishes the raw speaker and body separately in its source locale.
Native wrapper `0x145e6c050` installs the recipient’s recognized two-byte
locale in thread-local state and passes the source locale to the packet
rewriter at `0x145fe3180`. The rewriter admits opcode `0x96` subtypes
`0x0c` and `0x5a`, translates the speaker and body independently through
`0x145e76cf0`, and reconstructs the same message shape. The speaker GUID in
a yell is retained. Empty fields and equal source and recipient locale
indices retain the original text. An invalid or absent recipient code uses
the process language, which is the host projection’s source locale.

The literal path first reverses the displayed value through the source
locale’s merged map, then through the English map. The forward lookup
uses the recipient’s selected map followed by English. The reverse-map
initializer walks each merged forward hash table and overwrites an earlier
reverse entry when a later bucket has the same displayed value. The rebuilt
lookup uses the same last-visited rule. Duplicate override choices can
depend on hash-table iteration order in either application.

The [run event bridge](../../crates/azeroth-survivors-re/src/gameplay/client/events.rs)
prepares recipient-specific bodies using the admitted Hero’s language
bytes, then submits them through the [existing ordered engine queue](../../crates/azeroth-survivors-re/src/coop_runtime.rs).
The ordinary owner-only classifier and synchronized-recipient check still
select delivery. The local FrameXML keeps the host message. During `First`,
network receive and admission apply before event projection, and unit
publication flushes the same queue after local lifecycle and visuals.
Later bootstrap runs in `Update`. Both Gandling bodies retain the raw
`%s` slot through delivery.

The speaker and two warning bodies each reverse to their unique key in
every stock language. Static catalog checks covered all 588 combinations
of source language, recipient language and field. The native rewriter
also contains a general template-matching path for arbitrary formatted
packet prose. The three selected Scholomance strings use exact reverse
hits, and the source repair covers the literal route used by these
announcements.

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
| Recipient locale scope | `0x145e6c050` | `0x5e6b450` | 360 | `66e107075e3bfd4ff726db39969dfb169bfe0c25308050eb4396883b391dca6d` |
| Announcement packet rewrite | `0x145fe3180` | `0x5fe2580` | 1167 | `5f34bd9116ad1d7acf4aecb9837fc1d053a6107d5aad2be021ef7c10347bf719` |
| Exact and template translation | `0x145e76cf0` | `0x5e760f0` | 3314 | `9e326ff9f7edb41a5a268af3598c3607b739964d850372e9a30c8e7cf9096069` |
| Reverse map iterator | `0x145e7f2f0` | `0x5e7e6f0` | 1183 | `8d13c40453b178b0c1b1177426164a505346d8c40cd04396f83d7ce6712737f5` |
| Reverse map initializer | `0x146007530` | `0x6006930` | 119 | `1dff2da1dcfaee8d5b51488bd4271f9e5dd0e5dc0efec35373297426bafc31db` |

The journaled Ghidra getter result is
`ev_c36d5b1cda0a83047b4a2a0a42fc5e91df0ef1e8e1f04f734da9c7296e4d7e2a`.
The reverse-map iteration result is
`ev_a41831b7f547245c45a5c9b0e39b9899d591338f9cb6a34cd6bea38924689fbd`.
The shared subject validator checked the original PE bytes, slice address,
journal and result digests. Original instructions establish the branch
arguments where the raw slice leaves external calls opaque. Source checks
validated the query row and the post-insert Prepared formatting inputs.
Rustfmt parsed the changed Rust files. The authored query, language and queue regressions,
compilation, live client and guest delivery, rendered presentation and
original/rebuilt comparison remain open.
