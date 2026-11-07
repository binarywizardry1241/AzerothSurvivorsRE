# Major Soulstone rescue grace

Permanent finding **#295** is source/static complete for installed EXE SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [manifest](evidence/0.127.0/soulstone/manifest.json) binds the exact incoming
owner, original constants and completed journaled Ghidra query to this target.
Compilation, execution and original/rebuilt parity remain unverified.

## Native contract and connected source

The incoming owner is `145c12330..145c13fb7`. Its early guard at
`145c12441..145c12495` reads the recipient's `Game+cc0` clock and scans the
32-byte aura vector at `Game+3d8/+3e0`. Any raw status12 aura with expiry
strictly greater than that clock refuses the hit before armor, absorption,
damage accounting or reactive callbacks. An equal or unordered expiry does
not refuse it. Raw12 maps to the source's existing semantic immunity tag11.

After racial and talent rescue fail, `145c135c3` checks `Game+598` Soulstone
charges. A zero charge takes final death; otherwise it decrements exactly one
charge and restores `Game+538` health to half `Game+4c8` maximum health.
`145c13637` emits resurrection spell21169 to the recipient GUID at `Game+4b0`.
The subsequent aura update removes every spell1020 entry while retaining the
other auras in order. It appends source GUID0, raw status12, spell1020,
expiry `clock + 2.0f` and remaining healing0, then refreshes effects through
`145c0d580`. The duration constant at `14624c6a8` is exactly `0x40000000`;
the half-health constant at `146233124` is `0x3f000000`.

Only after the aura write and refresh does `145c137e2..145c138c4` capture live
nearby targets and resolve the existing spell15237 burst. Re-entry into the
incoming owner at the same clock therefore sees protection immediately.
There is no separate immunity deadline or next-frame admission in this path.

`gameplay/mechanics/incoming.rs::damage_player` retains charge consumption,
half-health restoration, resurrection visual and burst. Its new call to
`behavior/incoming.rs::soulstone_grace` replaces spell1020 using the existing
`buffs::refresh_aura`, followed by `refresh_effects` before any burst target is
resolved. That refresh also publishes the real player aura fields. The old
unused charge/health-only helper had no callers and is replaced by this live
grace stage. The existing incoming aura guard handles same-tick and subsequent
hits without another damage path or timer.

The aura belongs to the selected hero's `execution` state. Cooperative
`HeroState` swaps that complete state and its effect/publication state around
the existing `with_party_hero` callback, so one recipient's grace neither
protects another hero nor disappears when the borrowed context is restored.
The clock remains the shared run clock. Existing aura expiry and publication
consumers retire the protection; no new save, wire or global field is needed.

## Static validation and limits

The existing resurrection checker provides the current `--soulstone` suite:

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-revive-choice.py --soulstone
```

The [result](evidence/0.127.0/soulstone/static-check.json) records **40 cases
across 109 original instruction sites**. The suite verifies current parent bytes,
the raw-slice Ghidra subject and saved query
receipts, then replays the original charge/health instructions, spell1020
replacement/append and early immunity guard in isolated memory. Boundary cases
include zero/one/two charges, several maximum-health values, duplicate/absent
resume auras, preserved unrelated auras, a same-tick hit, the last float before
expiry, exact expiry, expired and unordered deadlines, and other status tags.
Separate recipient vectors at the same clock prove that the guard protects
only the selected hero. Source checks connect the write, refresh/publication
and burst order and the existing recipient context swap. The Rust helper
regression is retained but was not compiled or executed.

Ghidra's raw import omits external callees and constants and does not recover a
reliable native Win64 function signature. Parent-EXE instructions and data
control those interpretations. These checks establish the bounded source/static
repair; actual gameplay timing, network delivery, aura appearance, compilation
and original/rebuilt comparisons remain separate verification work.
