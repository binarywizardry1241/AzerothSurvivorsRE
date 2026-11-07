# Options checkbox values

This [#41](../CURRENT-STATE.md#gap-41) trace covers `Q41-U01` rows 1555
and 1587 and the checkbox portion of
[#129](../CURRENT-STATE.md#gap-129). The installed EXE SHA-256 is
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.

## Input, publication and presentation

At `0x1402064d5`, action index 1 takes the checkbox path. It bounds the
descriptor index below 108, uses the 152-byte table at `0x1465a0f70` and
requires control kind 5 at descriptor `+0x40`. The cached option value is
a string in a 24-byte row. The original branches at
`0x140206505..0x140206569`, `0x140206f0b` and `0x1402070e0..0x140207117`
choose the one-byte replacement.

| Cached value | Click queues |
| --- | --- |
| Missing, empty or exactly `0` | `1` |
| Any other nonempty bytes | `0` |

The click writes the replacement and descriptor index into the pending
56-byte operation. The drain at `0x140200518` takes index 0 of the
operation table and calls `0x1401f1ec0` at `0x140200535`. The setter
selects storage using descriptor `+0x18` at `0x1401f1f14`. Its engine
CVar lane takes the descriptor key and replacement string. The existing
source `OptionsState::set` connects the corresponding registry and
saved-variable paths.

The current renderer calls the per-row builder at `0x1403c85a4` and
passes its value into `0x1403c5300` through `0x1401f0140`. The checkbox
arm at `0x1403c6b0f` uses the same empty-or-single-zero comparison and
XORs the Boolean with the descriptor inversion byte at `+0x48`. Click
inverts the stored state. The inversion flag affects the display.

The [live Options source](../../crates/azeroth-survivors-re/src/options.rs)
now uses the same string predicate in its click and draw paths. Numeric
zero aliases such as `0.0`, `-0` and `0e0` can reach the cached value
through the existing numeric CVar admission. Those values now draw checked
for non-inverted controls and queue `0` when clicked.

## Static evidence

All 108 current descriptors match the connected Options asset across
keys, labels, pages, storage, control, ranges, inversion, choices, indent,
linked writes, multiplier and direct literal defaults. The 16,416-byte
table SHA-256 is
`88c902151c7ccd229798aed932c3a730dd11c7d234674e06d21c53d735e06584`.

The original Win64 click and draw branches passed 1,296 click and 1,134
draw cases across 81 checkbox descriptors, including all three inverted
ones. The cases supply cached strings, descriptor indexes and allocation
through the existing instruction harness and stop before the queued
storage write or UI publication. The input set covers missing and
out-of-range cache entries, empty strings, canonical and noncanonical
numeric values, whitespace, text, UTF-8 and NUL. The compact case digest is
`070c17d971433281b0c19819a658e97e65a81dc61d61d76e7475c47a6c893bf8`.

| Journaled Ghidra span | Original span SHA-256 | Shared result SHA-256 |
| --- | --- | --- |
| `0x140205c20..0x14020723e` | `8782714522e4c48705e49c4b69d2eec4da6597123a427507f8798ff9d5391103` | `dd188e8e63075e37faa5b0f9b9707d566c687f08983256f308cf51d75bc70458` |
| `0x1403c5300..0x1403c6e52` | `a1df314cfb27907a1900c28386fb83697cc286ed891d298c654ca182ef12637c` | `77d7be45ce8b7650107918adf34015547935bda77a4acbfbc345455ef7c1df50` |

Raw Ghidra imports omit external tables and callees. Original PE
instructions and table bytes supply those joins. The authored Rust
regression remains uncompiled. Actual setting persistence, pointer
interaction, rendering and original/rebuilt comparison remain in
[verification](../verification-needed.md#gap-129).
