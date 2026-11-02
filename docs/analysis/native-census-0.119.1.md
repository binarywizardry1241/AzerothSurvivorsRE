# Native discovery census — 0.119.1

Target SHA-256: `b3b5d86b06b95fd24f66697c023c196bac9687673905dcf03c000b31cc8d073c`.
The configured installed EXE is read directly as a read-only input. Structural
and decoder accounting remains distinct from semantic recovery, source
implementation and parity under #41.

## Complete file and linear inventories

The complete PE inventory records 145,374,208 file bytes, six mapped sections,
358,010 declared AMD64 unwind extents and 101,964,718 executable virtual bytes.
All file bytes belong to exactly one of 26 disjoint ranges, without overlap or
omissions. The ledger retains 200 DOS-stub bytes, 256 header-slack bytes and 982
alignment-tail bytes as unknown; structural labels and padding candidates do
not establish recovered meaning.

Capstone 5.0.7 decodes all **358,010** declared extents into **23,891,779
instruction records / 96,717,198 union bytes**, without an undecoded suffix.
The independent executable-complement pass accounts for all **5,247,520** other
executable bytes across **337,302** mapped regions. Its **2,844** seed addresses
produce **80,530** instruction candidates / **348,817** union bytes. Residual
classes retain 2,322,829 mixed bytes, 944,911 uniform CC candidates, 11,187
uniform NOP candidates and 1,619,776 canonical padding-sequence candidates.
Those labels do not prove noncode or reachability.

Diagnostic discovery verifies **18,096 instruction references** across 602 of
762 paths, including all **61 AS paths**. Its 6,155 candidate extents contain
1,899,735 decoded instructions. The new `coop/trust.rs` Rust Location supplies
an exact current instruction lead; a diagnostic reference alone does not prove
the entire enclosing function's semantic owner. The complete ownership pass
and read-only replay use the current system register.

## Persistent whole-image recovery

The durable declared pass lives beneath
`runtime/coverage/b3b5d86b06b95fd24f66697c023c196bac9687673905dcf03c000b31cc8d073c/ghidra/declared`.
Its immutable plan selects every current unwind entry in 4,096-start batches,
with automatic analysis disabled. The Program is saved with each committed
cursor. [Independent verification](coverage/full-image-declared-0.119.1.json)
checks all 22,468,706 exported instructions / 89,802,022 exact bytes, 360,517
functions, 418,179 body ranges and 3,874,311 static references. All 358,010
requested entry bodies are repaired. Its explicit residual retains 12,162,696
executable bytes, including 7,201,464 within declared extents and 4,961,232
outside them.

The fresh expanded pass freezes every declared/complement/pointer entry and
current guarded-table, diagnostic, address-taken, import-thunk and unwind/PE
input. It selects **430,174 entry starts plus 23,914 additional code-only
starts**, including overlapping contributions from 2,574 guarded tables, 1,348
diagnostic starts, 7,963 address-code starts, two import thunks and 28 metadata
entries. The immutable seed snapshots, producer/tool commitments and saved
Program live beneath the same target's `ghidra/execheck-expanded` directory.

[Expanded independent verification](coverage/full-image-execheck-0.119.1.json)
checks every exported instruction against original PE bytes and Capstone
boundaries. All requested entries have repaired bodies; code-only starts are
decoded without inventing function entries or incoming-edge proof.

| Expanded observation | Verified result |
| --- | ---: |
| Instructions / exact bytes | 23,295,626 / 93,367,831 |
| Native functions / actual body ranges | 432,790 / 488,807 |
| Static references / external locations | 4,034,084 / 425 |
| Ghidra computed call / jump-flow records | 70,965 / 142,171 |
| Unobserved executable bytes / ranges | 8,596,887 / 472,034 |

Residual instruction coverage retains 5,268,008 bytes within declared extents
and 3,328,879 outside. All populations overlap and must not be added as AS
implementation, semantic or parity percentages.

The exact applied guarded-edge digest is
`c91846e99c9995e315c40b6ec4977e9e9c7c0ba78413667fa6080ad50b502fac`.
The [separate rescan](coverage/native-jump-tables-rechecked-0.119.1.json) admits
3,673 proposed tables, including 1,099 additional sites and no changed applied
case vectors. The added tables' 6,803 distinct destinations include 581 exact exported
starts and 6,222 undecoded targets, with no instruction-interior conflicts.
Those proposals are not applied census edges. The [fourteen AS-context
receipts](evidence/0.119.1/native-switch-proposals.json) retain the existing
Q41-F01 discriminant questions: one Codex table (#17/#73) and thirteen
CreatureQuery template-entry/payload tables in the shared Engine-command owner
(#64/#65). [Current bounded owner/source classification](evidence/0.119.1/guarded-creature-query-correspondence.json)
identifies the existing creature-query/cache boundary while leaving individual
native cases, inputs and consumers open. Old/current candidate correspondence
is separate from recovered behavior and source applicability. The remaining proposal contexts stay in the exact
residual queue; a larger generic table inventory does not authorize unrelated
engine reconstruction.

The [complete residual join](evidence/0.119.1/native-residuals.json) retains
68,340 ownerless instruction records, 804,874 static references with ownerless
sources and 4,839 distinct unowned executable destinations. The separate
diagnostic-site audit checks all 18,096 references on exact exported instruction
starts; 1,216 have no actual body owner, including 60 of 816 AS-context records.
Its legacy `excluded-coop-path` category contains 101 owned co-op records that
remain present and eligible for source recovery; it is not a current exclusion.
Diagnostic association does not establish semantic ownership.

The [same-census operand audit](evidence/0.119.1/native-operands.json) checks
all 23,295,626 instructions, retaining 674,786 explicit fixed/address
expressions, including 8,063 with no source body owner. Its unowned executable
address population has 5,774 exact instruction starts and twenty unobserved
destinations; incoming registers, indices, aliases and data/type meanings remain
open. The final diagnostic recheck finds zero additional code-only seeds and
retains all 1,216 decoded-but-ownerless sites.

[Opcode/source classification](coverage/native-ownership-classification.json)
distinguishes 70,741 actual indirect CALLs and 11,616 indirect JMPs from Ghidra's
computed-flow records. The latter also include 130,555 UD2, 221 INT and three
INT3 instructions. All 61 AS diagnostic paths have registered reconstruction
owner candidates. Thirteen missing generic-engine source candidates remain
supporting context; they do not authorize engine reconstruction or establish AS
source defects. Complete static operand/reference inventories still leave
mutable receiver/slot writers, dynamic callees and source-equivalence proof open.

Both durable whole-image passes, complete independent instruction-byte/boundary
checks, file-range and linear/complement/diagnostic replays completed. Their
saved Programs and exact inputs preserve future resume/review work. The exact
applied switch snapshot remains authoritative; subsequent proposal admission
does not change the selected Program's edges or close residual semantic work.
All twelve residual artifacts pass complete hash/count admission, including
eight negative target/input/count/completeness-proof cases.

The preceding 0.119.0 census and semantic reports retain their original target
and actual tool/input commitments. New target registration, matching resource
bytes or a diagnostic/source join do not transfer behavioral or runtime proof.

No application compilation, compiling test, game/client/network/server execution
or controlled original/rebuilt comparison is part of this census. Exact residual
selectors and unresolved ownership/reference semantics remain under #41.
