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

Each exported instruction was independently checked against the installed EXE
for bytes and boundaries. The requested seeds all resolve to decoded entries
and functions. The expanded runs reuse the saved whole-image Program.

| Pass | Instructions / bytes | Functions / body ranges | Static references |
| --- | ---: | ---: | ---: |
| [Declared](coverage/full-image-declared-0.140.0.json) | 23,416,040 / 93,641,831 | 375,159 / 434,785 | 4,034,558 |
| [Initial expanded](coverage/full-image-expanded-0.140.0.json) | 24,269,444 / 97,332,078 | 448,261 / 506,519 | 4,200,675 |
| [Guarded expansion](coverage/full-image-guarded-0.140.0.json) | 24,332,681 / 97,617,432 | 448,261 / 505,311 | 4,219,938 |
| [Selected completion](coverage/full-image-selected-0.140.0.json) | 24,332,715 / 97,617,587 | 448,261 / 505,306 | 4,219,955 |

The selected pass retains **8,631,211 executable residual bytes in 488,461
ranges**. Of those, 5,273,299 bytes are inside declared extents and 3,357,912
are outside. The [guarded proposal review](evidence/0.140.0/native-switch-proposal-review.json)
binds the final independent proposal to 3,943 applied tables, 76,589 case
entries and 25,896 distinct applied edges. No additional code seed lacks an
instruction. The selected expansion reused 445,632 body entries and repaired
three. The previous expansion used full body repair because an unresolved
thunk dependency precluded incremental reuse. These are recorded operation
counts from this audit.

The [switch-context review](switch-context-source-review-0.140.0.md) retains
the source candidates and finding owners for AS-context tables. The
[correspondence frontier](evidence/0.140.0/computed-correspondence-frontier.json)
preserves the 14 stable historical questions. Case geometry is a candidate for
mapping. Typed selectors, actual callers and consumers still require review.

[Six bounded Ghidra operations](evidence/0.140.0/bounded-native-frontier.json)
cover three declared raw slices. The `attacks.rs` bounds-failure site in
`0x145ee2a90` belongs to a packed-bit grid test. Its producer and callers
are encounter and coverage leads under [#313](../CURRENT-STATE.md#gap-313) and
[#41](../CURRENT-STATE.md#gap-41). [#318](../verification-needed.md#gap-318) owns
the separately connected cast/swing reach. Ras's `0x145ee3900` uses a tag-3 record selection and
calls `0x145f6d350`. Krastinov's `0x145eebea0` tests tag 4, finds an
`0xe0`-byte record and appends a `0x20`-byte record. Trace those inputs
and consumers under [#313](../CURRENT-STATE.md#gap-313) before assigning
mechanic meanings. Raw subjects retain exact address and byte provenance.
They omit external code and data context.

The [code/data joins](evidence/0.140.0/native-data-consumers.json) bind the
Scholomance locale lookup, world-anchor name-slice handoff, three incoming calls
to the downed addon line carrier and mixed encounter/attack caller leads.
The [source frontier](source-frontier-0.140.0.md) owns every changed distinct
literal and the added diagnostic paths. The [cooperative admission proof](coop-admission-0.140.0.md)
binds a current host and outgoing Join mismatch. The [unknown queue](unknown-recovery-0.140.0.md)
retains the current static questions and previous targets' provenance.
Compilation, game/server execution, network interoperability and controlled
original/rebuilt comparisons remain open.
