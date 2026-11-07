# Cooperative incoming damage

This recovery covers the two-player incoming-damage constituent of
[#239](../verification-needed.md#gap-239), release claim
`changelog:0.132.0:6bf158aac9cce02f`. The installed
`installed-game/AzerothSurvivors.exe` is 0.141.0, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [0.127.0 party scaling report](coop-scaling.md) retains its
historical incoming, health, density and reward contracts.

## Shared inputs and recipient state

The remote admission owner at `0x145f1308e..0x145f130c0` inserts the real
hero row and sets the cooperative mode byte at `Game+0x10e3` to one. The
snapshot owner at `0x145f101d0` counts the host when its phase differs from
four, visits remote rows through the hero swap, and adds each non-down remote
at `0x145e715d0..0x145e715e0`. After restoring the rows, it clamps the count
to one and writes `Game+0xfe8`.

The party tick invokes the actor owner `0x145f239b0` with the host active.
Its remote loop swaps a hero into the same Game, sets the one-based active
slot at `Game+0xfd8`, and reaches that same actor owner through
`0x145e6f450`. It resets the active slot and restores the original hero
after the call. The swap includes the personal phase at `Game+0x10e9` and
preserves the shared mode and live count. The actor owner compares its target
slot against that active slot before collecting cooperative attacks. It then
passes the same Game to the ordinary incoming-damage owner at the melee call
`0x145f27fc3`. In the reconstruction, the actor target slot selects
`with_party_hero` and the recipient's position and facing. The swap supplies
that recipient's real GUID, vitals and effects while `CoopSimulation` owns
the shared count and mode.

## Damage lane

The common incoming owner `0x145f6d340` first admits active, unsuppressed
recipient state. If the shared mode byte is exactly one, it scales raw damage
by `(1 + (live_count - 1) * zone_coefficient * 0.064) * 0.8` in f32.
The first three zones use 0.7 and later zones use 1.0. The current incoming
path has no retained-row check before its 0.8 multiplication. Two live
heroes in an early zone therefore use a factor of 0.83584 for either
recipient, before the recipient's own immunity, armor and absorbs. Other
mode values bypass cooperative scaling.

The [source adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/incoming.rs)
continues to gate on cooperative mode and use the shared snapshot count.
[PartyScaling](../../crates/azeroth-survivors-re/src/coop/scaling.rs) now
applies 0.8 to its incoming lane directly. Its health lanes still use
retained hero presence. The actor-melee regression now covers each target's
health and melee event GUID in the two-player fixture.

| PE range (preferred VA) | File offset | Bytes | SHA-256 |
| --- | ---: | ---: | --- |
| Remote insertion and mode `0x145f1308e` | `0x5f1248e` | 50 | `33c5b8754722ce10a36ee91f7dab8c9ff3c025be13699feb3e03b99d3b484b92` |
| Host count and remote snapshot loop `0x145f102c9` | `0x5f0f6c9` | 218 | `5e1776a8e2dc7b0b2c6eab3c710e387c84717558e39d5e537af9dd98f6c0018d` |
| Remote non-down count `0x145e715d0` | `0x5e709d0` | 16 | `3a58a49ec7531096433f7d2dd6e84491ecfcff52e073283b0aa1cceb0a2586f0` |
| Count clamp and write `0x145f104cb` | `0x5f0f8cb` | 19 | `798669f9a65a096e086baf4e014a0b212abfd9abb7464d2a007b1c3074c013ac` |
| Hero swap `0x145f375e0` | `0x5f369e0` | 6112 | `245d7dba85d67747e2b117b3fffa02ad31e64b2cfecbcc2cb5c6a75439bfae52` |
| Host actor call `0x145f080f4` | `0x5f074f4` | 16 | `2a54227c776b5cc85bdafef6966c98cbd2566270936569ba955c3985a17f40e7` |
| Remote actor swap and call `0x145f08190` | `0x5f07590` | 86 | `9a82596dd17f1a4ad3b354cafc2b61fea710514ab668c061b345762749e373e1` |
| Remote callback to actor owner `0x145e6f53e` | `0x5e6e93e` | 73 | `4c18c231cd13bcb2064259b027be941cc81ca16fb4de028b93b40dc34de8edb3` |
| Actor target-slot filter `0x145f24203` | `0x5f23603` | 25 | `635d5721b621d7ccfa6d9463b6211c474ceda595fc45be1b56a37dd68afc84eb` |
| Melee call to common damage `0x145f27f75` | `0x5f27375` | 83 | `ab7f6da83fc8b46b95247929c68ee5074c0f5b0d7ac869d8c9ca991e6dec54e4` |

The journaled Ghidra query bound the 8,896-byte slice at `0x145f6d340`,
file offset `0x5f6c740`, to digest
`76ff5c11570797a150c28bf5d3c5935b3ef0ef3a876f2aa16c96bdc0901d004f`.
The direct response exceeded the transport limit. The verified evidence export
contained `ev_7765db41cf44c39aed962b5f483f0a0326862de64c10bc5a0abb73774ea34ccf`
with pseudocode digest
`4bd17eda85f05ed0e9db565cdea659dce6d089bb98c62eccb881f79a25a826d4`.
The installed PE instructions and constant bytes establish the operand widths
and multiplication order.

The [arithmetic manifest](evidence/0.141.0/coop-incoming/manifest.json)
binds the mode branch and four native constant ranges.
`scripts/check-coop-scaling.py --incoming` replayed 195 instruction cases
covering thirteen zone indices, one to five live heroes and three mode-byte
values. The replay supplies the zone lookup result at the call and uses the
already clamped count. Source guards and syntax parsing passed. Compilation,
the Rust regression, two-client combat, and original/rebuilt parity remain open.
