# Native discovery census for 0.140.0

The installed reference is 151,521,280 bytes, SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
[CURRENT-STATE](../CURRENT-STATE.md) owns implementation status.

The PE scan found six sections, 844 diagnostic paths, 372,642 declared extents,
430 imports and 644,103 nonpadding relocations. All 82 custom paths have decoded
references. The 26-range ledger covers the full file without gaps or overlaps.
The linear pass decoded 24,899,412 instructions and 100,870,444 union bytes with
zero undecoded suffix. It accounts separately for the 5,378,354-byte executable
complement, with 78,693 seeded instructions covering 337,687 bytes.

The [declared pass](coverage/full-image-declared-0.140.0.json) independently
verified 23,416,040 instructions and 93,641,831 bytes. It retained 375,159
functions, 434,785 body ranges and 4,034,558 references. The exact residual after
this pass is 12,606,967 executable bytes. Its 372,642 required seeds each have
a decoded entry and function. The expanded and guarded-table frontier uses the
same saved whole-image Program. Compare exact applied and proposed edges before
replacing the historical canonical selection.

[Six bounded Ghidra operations](evidence/0.140.0/bounded-native-frontier.json)
cover three declared raw slices. The `attacks.rs` bounds-failure site in
`0x145ee2a90` belongs to a packed-bit grid test. Its producer and callers
remain open under [#318](../CURRENT-STATE.md#gap-318), alongside a separate
cast/swing reach trace. Ras's `0x145ee3900` uses a tag-3 record selection and
calls `0x145f6d350`. Krastinov's `0x145eebea0` tests tag 4, finds an
`0xe0`-byte record and appends a `0x20`-byte record. Trace those inputs
and consumers under [#313](../CURRENT-STATE.md#gap-313) before assigning
mechanic meanings. Raw subjects retain exact address and byte provenance.
They omit external code and data context.

The [source frontier](source-frontier-0.140.0.md) owns every changed distinct
literal and the added diagnostic paths. The [cooperative admission proof](coop-admission-0.140.0.md)
binds a current host and outgoing Join mismatch. The [unknown queue](unknown-recovery-0.140.0.md)
retains the current static questions and previous targets' provenance.
Compilation, game/server execution, network interoperability and controlled
original/rebuilt comparisons remain open.
