# Native discovery census — 0.120.0

Target SHA-256: `291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
The configured installed EXE is read directly as a read-only input. Structural
and decoder accounting remains distinct from semantic recovery, source
implementation and parity under #41.

## Complete file and linear inventories

The complete PE inventory records 145,447,424 file bytes, six mapped sections,
358,167 declared AMD64 unwind extents and 102,016,350 executable virtual bytes.
The disjoint file ledger accounts for every byte without overlap or omission.
Structural labels and candidate padding retain their exact unknown selectors;
neither establishes recovered meaning.

Capstone 5.0.7 decodes all **358,167** declared extents into **23,904,773
instruction records / 96,767,228 union bytes**, without an undecoded suffix.
The independent executable-complement pass accounts for all **5,249,122** other
executable bytes across **337,445** mapped regions. Its **2,847** seed addresses
produce **80,612** instruction candidates / **349,138** union bytes. Residual
classes retain 2,323,214 mixed bytes, 944,933 uniform CC candidates, 11,188 uniform
NOP candidates and 1,620,649 canonical padding-sequence candidates. Those labels
do not prove noncode or reachability.

Diagnostic discovery verifies **18,073 instruction references** across 602 of
762 paths, including all **61 AS paths**. Its 6,151 candidate extents contain
1,897,897 decoded instructions. Complete discovery and its read-only replay
agree. A diagnostic reference does not prove semantic ownership of the entire
enclosing function.

## Persistent whole-image recovery

The current target's durable declared and expanded passes live below
`runtime/coverage/291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08/ghidra/`.
The declared pass selects every current unwind entry in 4,096-start batches,
with automatic analysis disabled. Saved Program transactions retain the exact
cursor and decoded/repaired state. The expanded pass uses independently checked
current declaration, complement, guarded-switch, diagnostic, address-taken,
import-thunk and unwind/PE inputs; profile commitments remain immutable.

[Independent declared verification](coverage/full-image-declared-0.120.0.json)
checks all **22,480,251 instructions / 89,845,662 exact bytes**, 360,678 functions,
418,372 actual body ranges and 3,876,372 static references. All 358,167 requested
entry bodies are repaired. Its explicit residual retains 12,170,688 executable
bytes, including 7,208,246 inside declared extents and 4,962,442 outside them.

The expanded pass freezes **430,330 entry starts plus 23,940 additional code-only
starts**, including overlapping contributions from 2,580 guarded tables, 1,348
diagnostic starts, 7,963 address-code starts, two import thunks and 28 metadata
entries. Its original seed snapshots, producer/tool commitments and saved
Program remain separate from the declared profile.

[Expanded independent verification](coverage/full-image-execheck-0.120.0.json)
checks every exported instruction against original PE bytes and Capstone
boundaries. All requested entries have repaired flow bodies; code-only starts
decode without inventing function entries or incoming-edge proof.

| Expanded observation | Verified result |
| --- | ---: |
| Instructions / exact bytes | 23,307,824 / 93,414,176 |
| Native functions / actual body ranges | 432,950 / 488,989 |
| Static references / external locations | 4,036,331 / 425 |
| Ghidra computed call / jump-flow records | 70,972 / 142,246 |
| Unobserved executable bytes / ranges | 8,602,174 / 472,201 |

Residual instruction coverage retains 5,272,383 bytes within declared extents
and 3,329,791 outside. These populations overlap and must not be added as AS
implementation, semantic or parity percentages. The exact applied guarded-edge
digest is `8d9b66ad965057b7d5f711f32ee9c743a6a813d6371ab997028605d1c21359d8`.
Subsequent switch proposals remain separate from applied Program edges.

The [separate switch rescan](coverage/native-jump-tables-rechecked-0.120.0.json)
admits 3,680 proposed tables, including 1,100 additional sites and no changed
applied case vectors. Their 6,808 distinct destinations include 584 exact
exported starts and 6,224 undecoded targets, without instruction-interior
conflicts. These proposals are not applied census edges.

[Fourteen current AS-context receipts](evidence/0.120.0/native-switch-proposals.json)
retain the existing Q41-F01 question identities: one Codex table (#17/#73) and
thirteen retained CreatureQuery/shared Engine-command candidates (#64/#65).
Every current candidate table has exact original-byte range/hash verification
and a unique prior candidate with matching diagnostic context, owner-relative
dispatch/guard offsets, selector domain, table width and owner-relative case
vector. This establishes candidate locations, not complete current semantic or
source applicability. Inputs, state, aliases, case meanings and required
producer/consumer/dependency correspondence remain open. The mixed gear/party
diagnostics do not establish whole-function ownership. Generic proposal contexts
remain in the exact residual queue; larger generic counts do not authorize
engine reconstruction.

The [complete residual join](evidence/0.120.0/native-residuals.json) retains
68,343 ownerless instruction records, 805,217 static references with ownerless
sources and 4,839 distinct unowned executable destinations. The separate
diagnostic audit checks all 18,073 references on exact exported instruction
starts; 1,216 have no actual body owner, including 60 AS-context records. Its
legacy `excluded-coop-path` category contains 101 owned co-op records that remain
eligible for source recovery; it is not a current exclusion. Diagnostic
association does not establish semantic ownership.

The [indirect-producer audit](evidence/0.120.0/native-dispatch.json) retains the
observed register/memory producer shapes and all 4,839 unowned direct-flow
destinations as exact instruction starts. Incoming source bodies are absent for
these 6,348 conditional/unconditional jump references; no function or source
ownership follows from their target boundaries. The separate
[constant-register audit](evidence/0.120.0/native-constant-dispatch.json) finds no
additional immutable-register CALL/JMP targets in its exact fallthrough scope.
Neither audit admits initial slot values or dynamic aliases as observed calls.
The final diagnostic recheck adds no further code-only starts and retains every
decoded-but-ownerless site.

The [same-census operand audit](evidence/0.120.0/native-operands.json) inspects all
23,307,824 instructions and retains 674,961 fixed/address expressions, including
8,063 with no source body owner. Its unowned executable-address candidates
contain 5,774 exact instruction starts and twenty unobserved destinations, with
no instruction-interior conflicts. Incoming registers, indices, mutable slots,
data meanings and actual runtime targets remain unresolved independently of
these complete static operand observations.

[Opcode/source classification](coverage/native-ownership-classification.json)
distinguishes 70,749 actual indirect CALLs and 11,626 indirect JMPs from Ghidra's
computed-flow records. The latter also include 130,620 UD2, 220 INT and three
INT3 instructions. All 61 AS diagnostic paths have registered reconstruction
owner candidates. Thirteen missing generic-engine source candidates remain
supporting context, rather than AS source-defect findings or authorization to
reconstruct the engine. Source ancestry and candidate names do not prove the
native compiled revision or behavioral equivalence.

All twelve complete residual artifacts pass independent census/linear/complement
hash/count admission, including eight negative target/input/count/completeness
proof cases. The saved Programs, exact seed snapshots and immutable exports
remain reusable current-target evidence. Complete byte, body and reference
inventories do not close residual semantic/source work or certify parity.

Both durable whole-image passes and complete independent instruction-byte /
boundary checks completed. The current complete-file, declared/complement and
diagnostic inventories retain their exact target bindings. Their independently
verified boundaries, saved Program ownership and retained AS candidate locations
do not resolve mutable receiver/slot writers, dynamic callees, unnamed data/ID
meanings, relevant source equivalence or controlled runtime comparisons.

The preceding 0.119.1 census and semantic reports retain their original identity
and actual tool/input commitments. Current registration, matching candidate
names or resource equality cannot transfer semantic/source or runtime proof.

No application compilation, compiling test, game/client/network/server execution
or controlled original/rebuilt comparison is part of this census. Exact residual
selectors and unresolved ownership/reference semantics remain under #41.
