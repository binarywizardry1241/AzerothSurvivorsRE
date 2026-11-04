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

The raw-resource cache write for friendly aura numbers remains a separate
native lineage question under [#110](../CURRENT-STATE.md#gap-110).
Compilation, actual guest UI and spell-scale delivery, and original/rebuilt
comparison remain unverified.
