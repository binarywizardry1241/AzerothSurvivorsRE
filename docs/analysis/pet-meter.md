# Hunter pet damage attribution

Installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This recovery covers `changelog:0.141.0:6caaee7fb93fce4a` and the pet-meter
constituent of `changelog:0.141.0:1d25a9296037f7e2`, under
[#316](../verification-needed.md#gap-316) and [#8](../verification-needed.md#gap-8).
The [0.140.0 producer recovery](class-balance.md#kill-command-recovery)
retains its original target and lifecycle scope.

## Source and attack identity

The command tick sets source kind 2, meter mode 1, the real combat descriptor
and the strike label before its canonical damage call. The periodic consumer
sets mode 2 for source kind 1 and an equipped raw tag 62. The Matriarch
completion sets the same meter mode around source kind 3 and raw tag 63.
The row resolver `0x145f656b0` assigns the pet, and `0x145f614c0` supplies
the attack breakdown. The detailed producer `0x145f70300` sends the attack
label to `0x145efd690`, which uses the same lowercase/underscore
`demon:` formatter at `0x145e19b40` as the hit attribution suffix.

| Producer | Meter row | Attack | Native detailed key |
| --- | --- | --- | --- |
| Wolf commanded strike | Wolf | Wolf Bite | `demon:wolf_bite` |
| Raptor commanded strikes | Raptor | Raptor Strikes | `demon:raptor_strikes` |
| Matriarch commanded strike | Devilsaur Matriarch | Crushing Bite | `demon:crushing_bite` |
| Raptor periodic effect | Raptor | Bleed | `demon:bleed` |
| Matriarch area effect | Devilsaur Matriarch | Shockwave | `demon:shockwave` |
| Wolf's amplified share | Wolf | Howl | `demon:howl` |

The ordinary bite path installs an explicit descriptor and the `Bite` label
for the Matriarch only. Ordinary Wolf and Raptor bites retain the generic
`Pets` row. Meter appearance selects the matching White Devilsaur descriptor
for both Wolf and Raptor when the independent appearance switch is set.
The original icon lookup returns `Ability_Hunter_BeastTaming` for Wolf and
Matriarch, `Ability_Druid_FerociousBite` for Raptor and an empty icon for both
White variants. The icon helper reaches the static granting talent when a
descriptor has no explicit icon. The scope includes all fourteen native
locale catalogs, with the matching literal `Howl`, `Bleed` and `Bite` labels.

## Howl split and cooperative ownership

The hit owner finds the active, unexpired Howl for the current hero and
excludes companion-origin hits and the Packlord bleed. It adds the Howl
amount to the pre-defense damage multiplier. For a positive multiplier the
native `divss` computes Howl divided by that multiplier. The owner widens
the quotient to `f64`, multiplies by effective damage capped to previous
health and subtracts the share before recording the triggering hit.
The existing equipped-effect share, when eligible, applies to that
remainder. One separate recorder call attributes the positive Howl share
to Wolf with its own breakdown. This changes meter allocation without
changing the triggering damage or adding another combat hit.

The Raptor bleed appends owner kind 1 and the equipped effect index to the
56-byte native actor-periodic row. Its tick copies those two words into
active Game state and resolves the index through the active hero's equipped
effects. The reconstruction shares actor rows between authoritative party
heroes, so it carries the installing hero GUID alongside the native owner
words and uses that GUID to select the existing party context before the
effect-index lookup. The hero GUID also supplies the reconstructed causal
source. The stored effect index retains its native meaning.

The [live hit adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics.rs)
routes the named attacks to the damage and boss ledgers while preserving
canonical spell totals. The existing co-op HUD and ordinary addon meter
messages read those same rows. The
[combat-text adapter](../../crates/azeroth-survivors-re/src/gameplay/client/events.rs)
attaches the companion attribution to the corresponding commanded melee
packet and uses the existing periodic and spell routes for Bleed and
Shockwave. Howl remains a meter-only split. The
[detailed meter authority](detailed-meter.md#rebuilt-authority-and-replay)
also records the companion actor and attack source before aggregation.
Live replay and parity remain under [#75](../verification-needed.md#gap-75).

## Static evidence

| Current PE range start | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Command hit `0x145f954b1` | `0x5f948b1` | 213 | `ad3a503ffbdd9cd4abad536dec0705b98dc977ec5eaf63cfbe9bdbe7c71a0022` |
| Ordinary pet control `0x145f97ed8` | `0x5f972d8` | 210 | `5646c9f636c2a6a4c2b80dd61cfb9c73af36e436f3f465285342db6122b5f600` |
| Shockwave dispatch `0x145effdf1` | `0x5eff1f1` | 111 | `68a2b56ff33145d383e1dc36e8adef8a5faca2d27754c01d1276eefdcb3c73cd` |
| Bleed enqueue `0x145f00310` | `0x5eff710` | 83 | `d42ae217ddadc291261744be209721113ca0145c13aae8cd3931b8b4be8ed9ce` |
| Bleed tick `0x145f284f8` | `0x5f278f8` | 164 | `79ac7bed18a86c25a44018e889d808c312dce15725033eacf2337530ed267aac` |
| Howl multiplier `0x145f1ae64` | `0x5f1a264` | 489 | `a3477ad1b9d8437d548027ec05fefc5fcf5fc54c61bc3b933292adea9081d8b5` |
| Howl accounting `0x145f1b85f` | `0x5f1ac5f` | 913 | `1cc83eefc4c435d8655d0ba2c630dc9b1e62b76bb487984a3fe060c88b41812b` |
| Meter source `0x145f656b0` | `0x5f64ab0` | 1452 | `6bd0a3f172b58017ae24567ed9e64ba4e938a5159fdc79a429c352263e0ba896` |
| Meter parts `0x145f614c0` | `0x5f608c0` | 565 | `b67a8d4101f69e8bb4349bc0d5d1779214fc40dfe8c3e2f66fbd0cdb64d40a0a` |
| Detailed recorder `0x145f70300` | `0x5f6f700` | 3530 | `986dbbdb2e6b65f5e7712b20a2daee3ea478868a48a40034a6b534d982224699` |
| Detailed key `0x145efd690` | `0x5efca90` | 372 | `0047ea8ed5aeff29df3240f8a044191bcde8a2af76206d4f39f8e4fbd8fff45e` |
| Attack key formatter `0x145e19b40` | `0x5e18f40` | 907 | `766b81a5b89a5698b697cf64d78595fc26ea623d8e62f95dac14ac767dfed99e` |
| Icon selector `0x145e0eea0` | `0x5e0e2a0` | 368 | `ae87d629b4baa200b12e82995c5dcb0f795f7bf3caf8ac42d415ac37f7838dae` |
| Icon grant lookup `0x146058860` | `0x6057c60` | 1360 | `b6fd24e6afd98e1f221c5106d85c1ad7167db447edfa46f0fa91d8cad31f8f2c` |

Three journaled Ghidra results cover the completion owner `0x145effbc0`,
meter parts and meter source. In that order the Evidence IDs are
`ev_0363bfb5f24b77c440809a36ed199f337791499166223875cdf0bffd0a010fd9`,
`ev_8b364c7e9318519ae6c5e21ed64a00da67a082bb5abf5e8b8e50a70163` and
`ev_20fe6a0f2001a87c031790153b1c0ad667b512651a13f3b066a77d58b8`.
The journal subject bytes match the original PE ranges at their preferred
addresses. Original instruction decoding supplies the external dispatch
cells, descriptor pointers and Windows x64 argument order.

Thirty bounded original-instruction cases replayed the fraction and split at
six multiplier combinations and five effective amounts. Five original icon
lookups matched the selected descriptors. The 42 added locale values match
the embedded descriptors at `0x147ae1870`; the sorted compact UTF-8 JSON
of the added values hashes to
`08f119e925650619f2c12d3705549c95efd9aa927b2925df2ef6941655c18b47`.
Rustfmt parsed the changed source. Compilation, rebuilt combat and meter
execution, cooperative and addon delivery, and original/rebuilt parity
remain unverified.
