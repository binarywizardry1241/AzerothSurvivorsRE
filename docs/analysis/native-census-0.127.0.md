# Native discovery census — 0.127.0

Selected installed EXE SHA-256: `3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
Configured installed EXE/Data were read in place. Structural scans, decoded
instructions, native body/reference observations, recovered behavior, source
connection and parity are independent evidence levels.

## Whole-file and independent inventories

The [complete PE inventory](coverage/native-summary.json) accounts for
146,721,280 bytes, six sections, 359,575 declared extents, 425 imports and
638,646 nonpadding relocations. The [26-range file ledger](coverage/file-range-summary.json)
has zero overlap or omissions. All 771 diagnostic paths include 69 custom AS
modules. The [source frontier](source-frontier-0.127.0.md) reviews new modules
and all 63 added candidate occurrences against existing source interfaces.

The [linear inventory](coverage/instruction-summary.json) decodes all 359,575
extents: **24,065,472 instructions / 97,522,563 union bytes**, zero undecoded
suffix. The separate [complement inventory](coverage/unwind-complement-summary.json)
accounts for **5,271,003 bytes / 338,915 regions**; 2,862 distinct incoming seeds
yield 81,009 candidate instructions / 350,825 bytes. Candidate padding and linear
decoding do not prove reachable code or semantics.

All eleven MPQs retain their prior identities. Current
[member coverage](evidence/0.127.0/mpq-member-coverage.json) accounts for 29,701
active slots / 29,691 names without opaque slots or orphan blocks. The exact
embedded API grows to 18,935 bytes. Resource membership and script extraction
do not establish every changed native consumer.

## Saved full-image Ghidra passes

The [declared pass](coverage/full-image-declared-0.127.0.json) independently
verifies **22,629,792 instructions / 90,545,790 bytes**, 362,099 functions,
420,431 body ranges and 3,900,869 static references. All 359,575 requested starts
are decoded and repaired. Its separate residual is 12,247,776 executable bytes.

The [expanded pass](coverage/full-image-execheck-0.127.0.json) extends the same
saved current-target Program with declared/diagnostic/complement, guarded-table,
address-code, import and unwind inputs. All 431,912 requested repairs and 24,046
additional code starts complete; **17,131 guarded edges / 2,587 tables** are
applied. Conservative body repair records `unresolved-thunk-boundary-dependency`
as its full-repair fallback; saved-Program reuse is not a claim of skipped body
work. Exact original collector/input commitments and checkpoints remain retained.

| Independently verified expanded observation | Result |
| --- | ---: |
| Instructions / instruction bytes | 23,463,701 / 94,144,917 |
| Functions / actual body ranges | 434,545 / 491,595 |
| Static references / external locations | 4,062,058 / 425 |
| Ghidra computed-call / computed-jump records | 71,092 / 142,756 |
| Unobserved executable bytes | 8,648,649 |

Every exported instruction matches the original bytes and independent boundaries.
The exact residual inventory is selected by
`independent_instructions.executable_sections.range_inventory`; the declared
subset is `independent_instructions.unobserved_range_inventory`. Overlapping
reference, operand, ownerless and residual populations are not missing-AS counts.

## Bounded recovery and remaining frontier

The [six current queries](evidence/0.127.0/source-frontier-native.json) bind
5,796 code bytes / 1,362 instructions and 17 named data bytes. They recover the
on-top registry-name read/owned-return and selected coordinate gates, plus five
ItemQuery spell-ID read/rewrite helpers. Their exact scopes qualify two modules
for bounded current-contract registration despite pending AS source assignment.
IME's event stride/variant and component-change structure remain structural
observations; event meaning, composition/commit and submission gates are unknown.
No complete layering, font, message/caller/recipient or jewelry-stat contract is
claimed. [Source-first boundary review](source-frontier-0.127.0.md) stops generic
VM/input/geometry/packet recovery at existing benilla interfaces.

The [AS review](as-discovery-0.127.0.md), [unknown queue](unknown-recovery-0.127.0.md),
[connection ledger](coverage/exe-connections.json) and
[module dimensions](module-contracts-0.127.0.md) retain current selectors and
permanent findings. Original producer records, earlier semantic/source repairs
and fourteen retained indirect questions keep their historical provenance;
current applicability requires actual correspondence, not address similarity.
All six global semantic discovery stages remain partial. No compilation,
compiling test, client/game/network/server operation or original/rebuilt
comparison occurred; complete behavior and parity remain unverified.
