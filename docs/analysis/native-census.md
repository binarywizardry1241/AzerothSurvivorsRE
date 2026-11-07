# Native discovery census

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
The [unknown queue](unknown-recovery.md) retains exact residual
selectors, candidate padding, dynamic edges and unresolved source questions.

The same-target #41 audit reopened the saved expanded and selected Ghidra
checkpoints and independently replayed every exported instruction in the
declared, initial expanded and selected passes. Both expanded replays matched
the retained instruction, byte, body, reference and guarded-edge commitments.
The fresh PE inventory matched every retained observation outside the producer
digest. All 213 non-metadata chunks of the fresh complement inventory matched
the frozen input. The selected pass therefore continues to reference its
original immutable seed evidence. The census profile keeps a shared-storage
descriptor under `retained-inputs/` named
`unwind-complement-c3b122c3ac58757ed0021dc3f514b72b1d0db60840270df9821caf7f65351fcb.sqlite`.
Use that descriptor with `--complement-inventory` when replaying this plan
after the current complement path changes.

### Embedded identifier outside declared extents

For `Q41-B01` and `Q41-U03`, the selected census's
`independent_instructions.executable_sections.range_inventory` with SHA-256
`6fe796e1d2ccc7b8915cf949fc425c9dcee71fcb51261ffed6b30d006714f30e`
has 397 `outside-declared` and `mixed-unclassified` rows covering 51,897
bytes. The row at `0x1461da686..0x1461da6d0` is the only one with a
truncated linear decode. Its 74 bytes at file offset `0x61d9a86` have
SHA-256 `fe495aa8c1532fc8baeb85e36eb3879d2ec0ad7e288b068dec2b9ea551912a2e`.
The span consists of a 71-byte ASCII CRYPTOGAMS Montgomery multiplication
identifier, a NUL terminator, and two NOP bytes before the next aligned entry.

The previous declared extent returns at `0x1461da685`. The successor at
`0x1461da6d0` is the handler encoded at `0x148a45b94` and `0x148a45ba4`.
The saved Ghidra references, declared and complement linear references,
relocations, PE entry and export records, and applied guarded tables identify
no incoming destination within the span. This supports a bounded data and
alignment classification at a generic crypto-library boundary. The exact
crypto package and dynamic entry behavior remain outside the proof. The other
396 rows are covered by the [executable residual review](executable-residual-roles.md#q41-b01-executable-section),
which separates recorded address-taken prefixes, graphics helpers and
remaining mixed roles. The larger complement region remains mixed because
it also contains admitted handler instructions.

### Guarded tables and AS discovery

The [applied and proposed proof](evidence/0.141.0/native-switch-proposal-review.json)
binds all 3,936 guarded tables to the selected pass. The
[guarded dispatch review](switch-context-source-review.md) records
current AS-context sites, prior geometry candidates and the pending type,
producer and consumer questions.

The [source frontier](source-frontier.md) accounts for the one new
diagnostic path and each changed literal. The [AS discovery report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/as-discovery-0.141.0.md)
links current data, indirect flow, residual classification, query receipts and
the module and release registers. Whole-image accounting, semantic recovery
and source integration have distinct scopes. Build, gameplay, network and
original/rebuilt comparison checks remain in the [verification register](../verification-needed.md).

## Retained reports

[0.140.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.140.0.md) · [0.139.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.139.1.md) · [0.139.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.139.0.md) · [0.127.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.127.0.md) · [0.123.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.123.0.md) · [0.121.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.121.0.md) · [0.120.5](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.120.5.md) · [0.120.4](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.120.4.md) · [0.120.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.120.2.md) · [0.120.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.120.0.md) · [0.119.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.119.1.md) · [0.119.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.119.0.md) · [0.118.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.118.0.md) · [0.117.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.117.0.md) · [0.115.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.115.0.md) · [0.113.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.113.2.md) · [0.113.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.113.0.md) · [0.112.5](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.112.5.md) · [0.112.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.112.0.md) · [0.110.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.110.0.md) · [0.109.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.109.0.md) · [0.108.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.108.0.md) · [0.107.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.107.0.md)
