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

The current app startup at `0x14003ddd5` supplies the callback table at
`0x146554a08`. Its data pointer and table travel through `0x145e80e60`
and `0x145ed0c00` to the co-op constructor `0x145ea2570`, which stores
them in the fields read by the guest dispatcher. The wire-11 callback
slot +0x30 is `0x145e935b0`. It clones the sanitized rows in order and
replaces the queued resource vector at +0x58 from the mutex lock. App owner
`0x140052100` takes that vector, marks the pending slot absent, and
replaces the raw local resource vector at state +0x48.

Separately, method registration at `0x1427c4830` binds `SetPlayerBuff`
and `SetUnitBuff` through their closure tables. Their callbacks at
`0x142cee800` and `0x142cf0bf0` both call the aura tooltip helper
`0x1427c4bc0`. The trace establishes the incoming resource path and the
FrameXML entry points. The producer that connects those raw rows to the
selected friendly aura view remains unresolved under
[#110](../CURRENT-STATE.md#gap-110). The rebuilt embedding retains its
existing aura override path and first-match/secondary-body behavior.
[Historical resource and selector evidence](coop-spell-text-0.115.0.md).

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
