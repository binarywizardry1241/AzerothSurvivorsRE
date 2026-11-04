# Guest spell resources and visual scales in 0.141.0

Installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes with
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This is a bounded guest receive repair under
[#63](../CURRENT-STATE.md#gap-63). The
[0.115.0 replication report](coop-replication-0.115.0.md) retains the
earlier 128-row and whole-list rejection behavior.

The guest dispatcher at `0x145ecc620` selects resource arm
`0x145eccf7c` for wire 11 and visual-scale arm `0x145ecd030` for wire 12.
The resource helper `0x145e37e90` truncates the vector to its first
**512** 176-byte rows and drops the remainder. It sanitizes the name,
both description fields and each present optional. Helper `0x145e393d0`
still escapes the four hyperlink/texture introducers and truncates to
4,096 bytes at a UTF-8 boundary.

The visual-scale arm first selects at most **512** 12-byte rows. It scans
the factor at row +4 for finite values. On the first nonfinite value it
compacts the remaining finite rows in input order at `0x145ece570`.
It clamps retained factors to 0.1 through 10.0, then calls the same guest
publication slot `+0x38` at `0x145ecd1a9` even when zero rows survive.
The source now applies both bounds, compacts the scale vector and always
replaces the previous scale update. The existing resource metadata and
spell-scale consumers read those guest snapshots.
[Sanitizers](../../crates/azeroth-survivors-re/src/coop/client_state.rs),
[receive path](../../crates/azeroth-survivors-re/src/gameplay/coop.rs),
[metadata publication](../../crates/azeroth-survivors-re/src/gameplay/coop_overlay.rs).

```sh
PYTHONPATH=runtime/armory-recovery/python-libs \
  python3 -B scripts/check-coop-replication.py --guest-spell-rows
```

The [PE evidence](evidence/0.141.0/coop-guest-spell-rows.json) binds the
selected receive and sanitation spans. The checker replayed eight resource
count cases and six scale vectors over **16,570** original steps, stopping at
the resource text loop and scale publication. It supplies the dropped-row
destructor as a seam and inspects the published pointer, count, and retained
row bytes before the callback. Changed Rust files syntax-parsed. The extended
Rust regression remains uncompiled and unrun.

Compilation, actual guest UI and spell-scale delivery, and original/rebuilt
comparison remain unverified.

## Friendly aura lineage

Finding [#110](../verification-needed.md#gap-110) follows the guest's resource
rows into the FrameXML spell and aura tooltip answers.

The current app startup at `0x14003ddd5` supplies the callback table at
`0x146554a08`. Its data pointer and table travel through `0x145e80e60`
and `0x145ed0c00` to the co-op constructor `0x145ea2570`, which stores
them in the fields read by the guest dispatcher. The wire-11 callback
slot +0x30 is `0x145e935b0`. It clones the sanitized rows in order and
replaces the queued resource vector at +0x58 from the mutex lock. App owner
`0x140052100` takes that vector and marks the pending slot absent.
It keeps a cloned vector at state +0x48 for the app's custom hover and
passes the original rows at `0x140052409` to `0x1403f7770`. That function
replaces the spell-resource B-tree under the mutex at `0x148a7a340`.
The row mapper `0x1400a3e30` takes the u32 spell ID at row +0xa8 as its
key and moves the name, primary body, secondary body and four optionals
into the 168-byte value. The builder `0x140082b60` sorts by spell ID,
preserving order among equal keys. The bulk loader drops the earlier
value for adjacent equal IDs at `0x140002c37..0x140002c49`, so the last
row wins in FrameXML. This B-tree is distinct from the raw vector's
[historical first-match custom hover](coop-spell-text-0.115.0.md#locale-identity-and-live-consumers).

Method registration at `0x1427c4830` binds `SetPlayerBuff`
and `SetUnitBuff` through their closure tables. Their callbacks at
`0x142cee800` and `0x142cf0bf0` both call the aura tooltip helper
`0x1427c4bc0` with the selected aura's packed spell ID, level and stack.
The unit token selects the aura list before this call. The tooltip key
carries no unit or caster ID. The live ask in `0x1427c4e00` calls
`0x142b1cd60` with the query and answer type tables at `0x146a07048`
and `0x146a07068`. Both TypeIds match the application comparisons at
`0x14090dacb` and `0x14090dafc`, and the matching answer calls
`0x14070ab10` with the same packed key.

The aura answer first requires an ordinary DBC aura view from
`0x140a66220`. With that view, it reads the same spell-ID B-tree root at
`0x148a7a348`. On a match, `0x14070af40..0x14070af7b` selects the
secondary body when its length at value +0x40 is nonzero, otherwise the
primary body. It returns the AS name and plain body and clears the
optional dispel label at output +0x30. On a B-tree miss it returns the
ordinary view. This is a recipient-local table consulted by spell ID for
both self and party hovers. The subject determines the aura selected from
the ordinary unit list.

The adjacent typed spell answer `0x14090de60` calls `0x140709860`.
That owner uses the pet flag to choose ordinary caster context, requires
the ordinary spell view and then reads the same resource B-tree for either
context. It uses the separate primary body. The
[embedding publisher](../../crates/benilla-app/src/local_client/spell_descriptions.rs),
[aura lookup](../../crates/benilla-ui/src/script/tooltip_aura.rs), and
[spell lookup](../../crates/benilla-ui/src/script/tooltip_spell.rs) now
follow these rules. The existing ordinary-data wait answers hovers once
the base view becomes available.

| Installed range | Preferred VA | File offset | Bytes | SHA-256 |
| --- | --- | --- | ---: | --- |
| Main callback binding | `0x14003ddc6` | `0x3d1c6` | 20 | `a96bac23ee7ad64b2204f2a991bfef6f178a54f6acb3e7385f9e5048e7c06fd0` |
| Resource callback slot | `0x146554a38` | `0x6553038` | 8 | `8bcf23891e92ad8b0b89000b25d6d4d151d6972238a4c5e7a4752a51ba56e122` |
| Resource queue publish | `0x145e939c3` | `0x5e92dc3` | 22 | `b60467045cae10869ba5922153a4dddb9763ab5a40839e5fe685d519f5b222d5` |
| Resource queue take | `0x14005222f` | `0x5162f` | 24 | `c2b2218b09758b289afb2a7d0a2adaeebb9767ca99c8da715049feb553ed8400` |
| Local resource vector write | `0x1400523a9` | `0x517a9` | 26 | `845e37f0a2f70a8ae152a065d1c838920a073543b3e191b8ea8704f9de960039` |
| FrameXML aura registration | `0x1427c4830` | `0x27c3c30` | 901 | `ae54734ebab8a89ee5f24f34b922f531054e2907dc1b1176be4c3a1138657d46` |
| Player callback table | `0x146a103a8` | `0x6a0e9a8` | 48 | `28d6aac9143b4885761c3ab01bd7fc4e85ad7fff6b2e4039bb45fa3c0be9e938` |
| Unit callback table | `0x146a10408` | `0x6a0ea08` | 48 | `7fbae25ec6157dbdac3cc26915d3c4db5d379ff629d75505fa18d916f8532aa5` |
| Aura tooltip dispatcher | `0x1427c4bc0` | `0x27c3fc0` | 357 | `0cf807cdcb29f6479d7b3190eaa653e2976a90ea348337799b5b4cef9a49d496` |
| Aura tooltip live consumer | `0x1427c4e00` | `0x27c4200` | 3352 | `98f48e3af24361621c6b67747b2ca338d85b093a0047c83d4cc24cd6ac5e51f6` |
| Aura query host and reader | `0x142b1cd60` | `0x2b1c160` | 520 | `f67fbed62573dab7106618bae3919111d05308719d41f14dc3c9758ee9811870` |
| App aura typed answer | `0x14090da90` | `0x90ce90` | 371 | `50d41a8f6868e247690d3b4d6787eec82d4d8045eddf84d4f78446b4c2d16b9d` |
| App aura lookup | `0x14070ab10` | `0x709f10` | 1599 | `ed8c2d07852efbb09e3422059eaa79a65af2a3fe0f647be0337bcbe07176e4b4` |
| Ordinary aura view | `0x140a66220` | `0xa65620` | 414 | `c11dae9bfd3997a050718f322b99fee61c0aca8299ec4f6319b01b525cdcc129` |
| App spell typed answer | `0x14090de60` | `0x90d260` | 1632 | `c7987a74002a777b0f84dc3d4f3ca4da01271921b65a4e2bd5c3a31e5f052e02` |
| App spell lookup | `0x140709860` | `0x708c60` | 3504 | `2a1b00e1cfd109ccf2e2d046d9ddcb9ef050e1935a26be08de96ab88d703cf90` |
| B-tree replacement | `0x1403f7770` | `0x3f6b70` | 325 | `7455763cacade55f939b8cd583a26d07b0ec525aa399f6a1a949fa957a227379` |
| B-tree row mapper | `0x1400a3e30` | `0xa3230` | 413 | `3190ebe124acb32fc3cc1be963cbe65cc53d013e5ef6f96ea8068d96fd43b880` |
| B-tree collector | `0x140082b60` | `0x81f60` | 617 | `c69bbe70a024308efee1252c1bd63abe71352bc69bfec6451843b6a0e1101f16` |
| B-tree bulk loader | `0x140002a10` | `0x1e10` | 2549 | `4d56146af23dde4413c3faf676f086c05d7707e57dd5e17b394538a08779bf13` |
| Sort driver | `0x1400a8030` | `0xa7430` | 1942 | `727660710cf77ec7b92d1f310edbde8485076742c46782016b06ccee4ff077cd` |
| Sort merge helper | `0x1400acd50` | `0xac150` | 1534 | `f4a2373ff60cad054e62b7e751dd5f53d2f9e992f21de63485536a774de16b36` |
| Small sort helper | `0x140079bd0` | `0x78fd0` | 1612 | `92f710654cf57a4b867a2a692ca34e8e308e327921a028a60af701e8d241ba1e` |
| Sort copy helper | `0x1400740d0` | `0x734d0` | 207 | `0cef53dacbcf4e8e06a03e9ac568184c1de161713b23bacd46f4972a26a3de1b` |

The journaled Ghidra results for the dispatcher and aura lookup match
their PE slice digests above. The shared result SHA-256 values are
`1db683c8f150589ae16c69c29543e8401744debaf3e511538181ce16fd1d5637`
and `fe90d3805ed1ad4645744cc4ca167a148b3613b82f675655bfe4d4a0578c0404`.
Bounded instruction replay checked 10 ordinary-view, duplicate and
aura-output cases, then verified stable sort order at 21, 32, 64, 128
and 512 rows with a scratch-only memory copy seam. Rustfmt parsed the
changed Rust files. The uncompiled source regressions cover duplicate
rows, separate bodies, ordinary-data waits, and player, party and pet
hover consumers. Compilation and original/rebuilt display comparisons
remain unverified.
