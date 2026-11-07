# Combat packet and meter source identities

Installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This bounded recovery follows the Windfury and Tier 0.5 constituent of
`changelog:0.140.0:952bce7492eb0be8` under
[#307](../CURRENT-STATE.md#gap-307) and [#75](../CURRENT-STATE.md#gap-75).

## Source selection

The detailed recorder at `0x145f703e7` and the hit suffix producer at
`0x145f1bdce` call the same source selector `0x145fa3b10`. The latter
uses its primary key and separately obtains the localized ordinary label
from `0x145f656b0`. It appends the pair to wire opcodes `0x014a`,
`0x024e` and `0x0250` at `0x145f1bfd0`.

When an active sourced cast matches an ability, the primary descriptor is
normally the ability and the effect descriptor is a child. Raw 54 subtype 4
reverses that order. At `0x145fa4313..0x145fa435f` the selected ability
becomes the child and the Windfury Weapon talent stays primary. Thus
`talent:enh_windfury_weapon:r<rank>` is the extra strike's packet key,
while the ordinary label is Windfury Weapon. Flametongue and Frostbrand
keep the cast ability primary when it resolves. Proc-owned periodic rows
use their indexed effect descriptor as the primary row. A non-ability
spell with a named DBC row uses `spell:<id>`. The same fallback constructor
uses `other` if it has no named DBC row.

The active armor set builder `0x145fcf6e0` calls `0x145e086b0`
with a class key, tier and empowerment flag. The normal key is
`set:<class>.<tier>` and empowerment appends `.empowered`. Both
four- and eight-piece Tier 0.5 effects use tier 7. The parallel descriptor
writer at `0x145efd9f0` associates each admitted generic effect with this
source. For raw 66, 69 and 70 it selects a separate localized display
name and icon. `0x145e08e30` appends the English effect name to the
parent key after converting ASCII letters to lowercase and spaces to
underscores. The ordinary set label comes from the same
`set.<class>.<tier>` localization table as the armory.

| Effect | Primary key | Distinct ordinary row |
| --- | --- | --- |
| The Five Thunders damage | `set:shaman.7:thunderburst` or `set:shaman.7.empowered:thunderburst` | Thunderburst |
| Empowered Deathmist burn | `set:warlock.7.empowered:deathmist_burn` | Deathmist burn |
| Feralheart Seed of Life damage | `set:druid.7:seed_of_life` or `set:druid.7.empowered:seed_of_life` | Seed of Life |
| Generic Soulforge and Sorcerer effects | `set:paladin.7` and `set:mage.7`, with `.empowered` at five stars | Localized set label |
| Heroism maximum-health share | `set:warrior.7`, with `.empowered` at five stars | Localized set label |

Heroism is a separate meter allocation only. The native hit owner
temporarily installs source kind 3 and the set effect index around its
second recorder call at `0x145f1ba40..0x145f1ba76` and then restores the
real hit attribution before writing the packet suffix.

The worn amulet builder calls `0x145e095a0` at `0x145f89057` and clones
the resulting `amulet:<key>:r<picks>` descriptor into its passive effect
rows. This is an equipment origin for the equipped generic suffix and
applies to the whole suffix, including Emberwake. The separate
`item:<numeric id>` constructor at `0x145e089a0` is reached from the
gear-slot loadout loop at `0x145e1b9a2..0x145e1b9ba`. That call site
supplies worn equipment metadata and does not justify a new damage
packet source.

## Source and evidence

The [equipment builder](../../crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs)
stores the set identity alongside the generic talent prefix. The
[canonical hit adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics.rs)
resolves an effect index through the allocated talents, active sets and
equipped amulet in their existing order. The same adapter is used by the
direct and periodic hit paths. The
[shared meter formatter](../../crates/azeroth-survivors-re/src/gameplay/addon_meters.rs)
projects the Tier 0.5 label before sending ordinary addon rows and combat
text attribution. The Heroism share remains a separate legacy meter row,
with a single real combat packet.

| PE range start | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Ordinary row reducer `0x145fcf300` | `0x5fce700` | 805 | `5edf6492bad31b2842580d565668e5beeaa80399440da9f2f3cf0b247faeedcd` |
| Shared source selector `0x145fa3b10` | `0x5fa2f10` | 2336 | `574bc9e73e87f46f37d530e650ae97c1f762f738dafed76b924f73eb0f9d930f` |
| Non-ability spell fallback `0x145fa36b0` | `0x5fa2ab0` | 638 | `b074fd7a3224d5769cbd23e2f813938584443355fa73ffe3a2d69b444f6738ff` |
| Set key constructor `0x145e086b0` | `0x5e07ab0` | 579 | `21bd06e3b3656d85bee6495f42c70ed0f46f4b09c4c8bff251c04b51f2633f0d` |
| Set effect metadata `0x145efd9f0` | `0x5efcdf0` | 659 | `07131e2cdc60da5153e14164e72436fcae7aab30aef70e6da23cdb37be0a7183` |
| Named effect key formatter `0x145e08e30` | `0x5e08230` | 1136 | `09bdca3cb7a4c0852bfa324064b830ae9478cc9c576be76a91b6a4b8bd21c3eb` |
| Set label lookup `0x145e30880` | `0x5e2fc80` | 766 | `9eda20fe0e618cebc406a0394369a8e51ccb07a8e02a13545d3189be06aaede4` |
| Amulet key constructor `0x145e095a0` | `0x5e089a0` | 1219 | `255e506123e1d2a3920d4ee8014440ae359aaf315f8a454c8cee1fbe78cf54ed` |

Ghidra 12.1.4 raw-slice evidence
`ev_fce205b5df62379c271648dbc19a80d67349e4fb1297697abf5f4c4750cec4dd`
and `ev_18288f66787e1b7e2113ad74f65aa186d524b179d266ff4beef133a8fe040202`
cover the reducer and shared selector. The original PE instructions and
data establish external calls, format strings and argument ordering.
The result digests were checked against both operation journals.
Rustfmt parsed the changed Rust and the scoped diff whitespace check
passed. The Deathmist regression exercises the real set builder and
periodic adapter and awaits compilation.

The [detailed meter authority](detailed-meter.md#rebuilt-authority-and-replay)
records Windfury's child ability, the separate Heroism allocation, and
the keyed Feralheart and Deathmist effects. Compilation, co-op delivery
and original/rebuilt parity remain under [#75](../verification-needed.md#gap-75).
