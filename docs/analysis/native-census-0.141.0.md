# Native discovery census for 0.141.0

The installed reference is 151,493,632 bytes with SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [identity receipt](target-refresh-0.141.0.json) binds the exact inputs.
[CURRENT-STATE](../CURRENT-STATE.md) owns source and recovery status.

The [PE inventory](coverage/native-summary.json) found six sections, 845
diagnostic paths, 372,623 declared extents, 430 imports and 643,985 nonpadding
relocations. All 83 Survivors paths have verified instruction references.
The [26-range ledger](coverage/file-range-summary.json) partitions every file
byte. The [independent linear scan](coverage/instruction-summary.json) decoded
24,893,474 instructions covering 100,845,169 bytes with zero undecoded suffix.
The [complement](coverage/unwind-complement-summary.json) separately accounts for
5,376,717 executable bytes and 78,661 seeded instructions. All twelve MPQ hashes
match the prior chain. [Current member inventory](evidence/0.141.0/mpq-member-coverage.json)

## Whole-image passes

The audit checked the bytes and boundaries of every instruction in each
Ghidra export against the installed EXE using Capstone 5.0.7. The expanded
passes reused the 0.141.0 Program. The final expansion reused 445,613 function
body entries and repaired three after adding four guarded sites.

| Pass | Instructions / bytes | Functions / body ranges | Static references |
| --- | ---: | ---: | ---: |
| [Declared](coverage/full-image-declared-0.141.0.json) | 23,413,257 / 93,631,178 | 375,139 / 434,628 | 4,033,740 |
| [Initial expanded](coverage/full-image-expanded-0.141.0.json) | 24,265,076 / 97,313,995 | 448,241 / 506,378 | 4,199,488 |
| [Guarded expansion](coverage/full-image-guarded-0.141.0.json) | 24,328,365 / 97,600,132 | 448,241 / 505,175 | 4,218,694 |
| [Selected](coverage/full-image-selected-0.141.0.json) | 24,328,399 / 97,600,287 | 448,241 / 505,170 | 4,218,711 |

Every requested final code seed has an instruction. The selected pass leaves
8,621,599 executable bytes outside the instruction union in 488,306 ranges.
Of those, 5,263,936 bytes are inside declared extents and 3,357,663 outside.
The [unknown queue](unknown-recovery-0.141.0.md) retains exact residual
selectors, candidate padding, dynamic edges and unresolved source questions.

The [applied and proposed proof](evidence/0.141.0/native-switch-proposal-review.json)
binds all 3,936 guarded tables to the selected pass. The
[guarded dispatch review](switch-context-source-review-0.141.0.md) records
current AS-context sites, prior geometry candidates and the pending type,
producer and consumer questions.

The [source frontier](source-frontier-0.141.0.md) accounts for the one new
diagnostic path and each changed literal. The [AS discovery report](as-discovery-0.141.0.md)
links current data, indirect flow, residual classification, query receipts and
the module and release registers. Whole-image accounting, semantic recovery
and source integration have distinct scopes. Build, gameplay, network and
original/rebuilt comparison checks remain in the [verification register](../verification-needed.md).
