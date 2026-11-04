# Soulfire target upgrades in 0.141.0

The installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This is a bounded review of `changelog:0.141.0:6ea2cb1d0b80a4b9`.
The published whole-image audit remains bound to 0.140.0.

| Owner | Preferred VA range (end exclusive) | File offset | Raw slice SHA-256 | Ghidra evidence |
| --- | --- | --- | --- | --- |
| Upgrade magnitude | `0x145e27300..0x145e27501` | `0x5e26700` | `56fab00d07bd0fe36ebf5d8fd5fdc58df6b338a61dbcb28bc7a4d36e520950c4` | `ev_4ea3ab6b12e0ed5a9201bdda73cf58af6a67cbc5998714ed7e71975c28a3166f` |
| Soulfire launch | `0x145fac590..0x145faced6` | `0x5fab990` | `b19ccf847c2def18dcd54ff0b65bbf40430e7353351f93ce3d9083b1c294ef86` | `ev_2b4435372c2fcbdcd881a7ae1cd1116c751d06ee974de421b5f73de304dc3416` |
| Passive tooltip | `0x145fae6c0..0x145fafeb5` | `0x5fadac0` | `2d66c06588b104b7749b84e496031cc74dcff053b3467a5f3c20dfcd96a0201c` | `ev_0f06e9abaaad47596735ed8200317699cbd30f1e590d02db667f460f4e810024` |

The target-upgrade arm identifies the complete nine-byte `soul_fire` key at
`0x145e273ef..0x145e27413`. It selects a budget of 12 added targets, then
subtracts the existing upgrade bonus with unsigned saturation and limits the
increment to the rarity table at `0x14771c510`. The other historically capped
passives still use a budget of two. The [shared magnitude and offer
source](../../crates/azeroth-survivors-re/src/player_abilities/upgrades.rs)
supplies this lane to the card prose, eligibility and apply paths.

The launch owner checks five shards and the Soulfire deadline, finds the
learned Soulfire definition, and computes the count at
`0x145fac76a..0x145fac790`. A zero base gives one. Otherwise the count adds
the target upgrade, talent and global bonuses as wrapping u32 arithmetic,
with a minimum of one. The target search at `0x145fac8a1` receives the previous
GUIDs as exclusions. The loop at `0x145fac9e1` compares the selected length
against that full count. The [launch
source](../../crates/azeroth-survivors-re/src/player_abilities/behavior/passive_tick.rs)
now uses the shared count and retains the existing search, launch and impact
paths.

The passive description dispatch at `0x145fae8b2` recognizes the same key.
The branch at `0x145faf280..0x145faf2ad` adds the same three bonuses. It
selects singular text for one and otherwise formats the u32 into the localized
plural template at `0x147af1a25`. The [live
formatter](../../crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs)
uses the cast count for this field in the existing localized template. Card
and spell-resource publication both use the formatter. The 0.115.0 expression
asset and fixtures preserve their original count expression.

The shared `native_terminal.NativeReplay` harness ran 558 isolated
original-instruction cases over 13,914 instructions. Cases covered all five
rarities, saturation at the upgrade budget, unrelated passive caps, the
zero-base path, singular/plural selection and wrapping count inputs. The
Ghidra query journals were checked against the three PE ranges above. The
authored Rust regression exercises the upgrade budget and tooltip with more
than three targets. Compilation, runtime targeting, rendered tooltips and
original/rebuilt parity remain open under [#319](../verification-needed.md#gap-319).
