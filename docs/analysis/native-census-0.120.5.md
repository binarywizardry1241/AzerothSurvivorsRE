# Native discovery census — 0.120.5

Selected installed EXE SHA-256:
`522e1c831b3b4627875a28a1030368ef9d2e7f98c5606c34cb30448d3b7d776e`.
The configured EXE and Data are read directly in place as read-only reference
inputs. Structural accounting, linear decoding, Ghidra body/reference recovery,
semantic interpretation, source correspondence and runtime/parity proof remain
separate populations. Whole-file coverage does not close #41.

## Complete file and independent linear inventories

The [complete PE scan](coverage/native-summary.json) records **145,498,624 file
bytes**, six sections, **358,226 declared unwind extents**, **102,054,414
executable virtual bytes**, 425 imports and 637,303 nonpadding relocations.
All 763 diagnostic paths include 62 AS paths; every known AS path has a
current instruction-verified diagnostic reference. Names and path membership
are navigation evidence rather than semantic ownership or source equivalence.

The [26-range disjoint file ledger](coverage/file-range-summary.json) covers
`[0, 145498624)` without overlap or omission. Exact range selectors distinguish
headers, mapped sections, raw alignment slack and unexplained contents. The
structural classes retain their semantic unknowns, including candidate padding;
classification does not establish that a range is noncode. Configured Data
resources are accounted separately from executable bytes.

[Capstone 5.0.7 declared-extent decoding](coverage/instruction-summary.json)
processes every declared extent: **23,913,368 instruction records / 96,805,055
union bytes**, with zero undecoded suffix. Exact ordinal/range/offset/original-byte
commitments and the decoder identity bind the retained inventory. Linear
instruction boundaries do not establish actual flow bodies or reachability.

The [separate executable complement](coverage/unwind-complement-summary.json)
accounts for all **5,249,359 bytes / 337,494 mapped regions**. Its 2,846 distinct
seed addresses yield **80,599 candidate instructions / 349,088 union bytes**.
The residual partition retains **2,323,196 mixed/other bytes**, **944,952 uniform
CC candidate bytes**, **11,194 uniform NOP candidate bytes** and **1,620,929
canonical-padding-sequence candidate bytes**. These candidates remain separate
from proved noncode; unseeded and computed paths remain open.

## Durable whole-image Ghidra work

The current-target declared and expanded native passes use the shared leased
Program and their exact frozen queue/input commitments. A new target hash has
its own Program; prior semantics, source repairs and classifications retain
their actual historical provenance. Compatible seed expansions extend the same
current Program instead of creating independent per-task databases.

The [independently verified declared pass](coverage/full-image-declared-0.120.5.json)
checks **22,487,614 instructions / 89,877,537 exact bytes**, **360,736 Ghidra
functions**, **418,461 actual body ranges** and **3,877,653 static references**.
All **358,226 requested declared entries** have decoded starts and repaired flow
bodies. The independent original-byte/Capstone check verifies every exported
instruction; unwind extents are not substituted for actual bodies.

This declared-only observation retains **12,176,877 unobserved executable bytes /
400,960 ranges**: 7,214,148 bytes within declared extents and 4,962,729 outside.
The summary's `independent_instructions.executable_sections.range_inventory`
selects the exact remaining executable partition, while
`independent_instructions.unobserved_range_inventory` selects its declared
subset. Padding candidates remain unproved noncode. These are the declared
pass's residuals, not final expanded-pass counts.

The [independently verified expanded pass](coverage/full-image-execheck-0.120.5.json)
extends that same saved Program. Its frozen queue contains **430,388 requested
entry repairs plus 23,958 code-only starts**. Inputs retain **2,580 guarded
tables**, **1,348 diagnostic code leads**, **7,963 address-taken code leads**,
**two import-thunk entries** and **28 unwind/PE metadata entries**. These inputs
overlap and must not be summed as functions. All **17,052 admitted guarded
edges** are applied. Initial encoded pointers and code-only starts do not prove
runtime calls, source function identities or AS ownership.

| Expanded observation | Independently verified result |
| --- | ---: |
| Instructions / exact bytes | 23,316,845 / 93,453,704 |
| Ghidra functions / actual body ranges | 433,007 / 489,436 |
| Static references / external locations | 4,037,940 / 425 |
| Computed call / jump-flow records | 70,991 / 142,256 |
| Unobserved executable bytes / ranges | 8,600,710 / 472,309 |

Every requested entry has a decoded start and repaired body; every additional
code start decodes. The exact remaining executable partition retains
**5,270,617 bytes inside declared extents** and **3,330,093 outside**.
`independent_instructions.executable_sections.range_inventory` in the expanded
summary selects every remaining range. Candidate padding is not proved noncode;
unobserved bytes are not automatically AS-specific or absent implementation.
Computed-flow records include traps and are distinct from opcode-level indirect
CALL/JMP populations. Wider dispatch, aliases, data meanings and semantics remain
open under #41.

The [complete residual join](evidence/0.120.5/native-residuals.json) retains
**90,536 ownerless instruction records**, **809,236 static references with
ownerless sources** and **7,952 distinct unowned executable destinations**.
These are overlapping populations, not unexplained-AS or missing-source counts.
The exact selectors are `artifacts[ownerless-instructions.tsv.gz]`,
`[ownerless-reference-sources.tsv.gz]` and
`[unowned-executable-destinations.tsv.gz]` in that proof.

Diagnostic replay verifies all **18,119 reference records** on current exported
instruction boundaries; **1,216 lack actual body owners**, including **60 AS
records**. `artifacts[diagnostic-sites.jsonl.gz]` retains every record, exact
path/Location/instruction context and actual body-owner state. The legacy
`excluded-coop-path` context label covers 112 owned records and excludes no
cooperative source from current recovery. Body/path associations do not prove
semantics or runtime ownership.

All twelve residual artifact sets pass independent current census/linear/
complement input and count admission, including eight negative target/input/
count/completeness cases. Same-census operand/dispatch/ownership derivation and
the structural connection/machine-queue joins are complete within their recorded
bounds. These results remain separate from semantic frontier closure.

## Guarded proposal correspondence

The [separate switch recheck](coverage/native-jump-tables-rechecked-0.120.5.json)
admits 3,682 proposed tables: **1,102 additional sites**, with zero changed
applied case vectors or removed proposals. The
[complete proposal review](evidence/0.120.5/native-switch-proposal-review.json)
retains **6,819 distinct target candidates**: **585 exact exported instruction
starts**, **6,234 unobserved targets** and no instruction-interior conflicts.
These proposals are not applied census edges.

All fourteen additional tables with AS body/declared-extent context map uniquely
to retained questions in the
[current correspondence assessment](evidence/0.120.5/computed-correspondence-frontier.json):
one Codex growth selector and thirteen finite CreatureQuery metadata questions.
Complete guard/register/bound/domain and dispatch-relative successor geometry,
plus exact current table bytes, establish correspondence candidates. They do not
revalidate current producer/state/dependency/consumer semantics or transfer source,
runtime or parity proof. No new distinct AS issue is established by these
proposals; the original classifications, source repairs and stable findings
remain retained with separate current applicability work.

## Explicit operands and computed-dispatch ownership

The [same-census operand audit](evidence/0.120.5/native-operands.json) inspects
all **23,316,845 verified instructions** and retains **675,060 explicit static
memory/address expressions**: 495,449 address expressions and 179,611 fixed
memory operands. **10,157 expressions lack source body owners**. Its executable
destination candidates retain **5,774 exact instruction starts** and **20
unobserved targets**, without instruction-interior conflicts. These address
relations acquire no inferred READ/WRITE/CALL semantics. Incoming register,
index/segment and mutable-slot aliases require further evidence.

The [direct-flow/producer-shape audit](evidence/0.120.5/native-dispatch.json)
retains **5,652 unowned direct-flow destinations**, all exact current instruction
starts with zero interior conflicts or undecoded targets. These differ from
the broader all-reference residual population. `inventory.path:unowned_direct_destinations[*]`
and `inventory.path:producer_records[*]` preserve every destination/incoming-reference and
last-producer observation. Contiguous fallthrough producer shapes do not prove
type invariants, table bounds, alias closure or actual runtime dispatch.

The [no-memory constant-register audit](evidence/0.120.5/native-constant-dispatch.json)
finds no additional transfer target within its exact block/domain rules. It
admits neither initial PE slot values nor memory loads and does not close
unresolved computed incoming state.

[Opcode/source classification](coverage/native-ownership-classification.json)
separately records **70,768 actual indirect CALLs** and **11,627 indirect JMPs**.
These are opcode populations, distinct from Ghidra's computed-flow tags above.
The `artifact` JSONL inventory retains each source site, actual body owner,
resolution basis and unresolved reason. All 62 custom diagnostic paths have
partial source candidates. Thirteen absent generic-engine source candidates
remain supporting context, not new AS findings or an engine reconstruction
requirement. Source filenames and vendored ancestry do not identify the native
compiled revision or establish behavioral equivalence.

## Residual and semantic limits

The native/source review retains unknown owners, interior/inline/mixed
regions, direct and computed successors, fixed-address expressions, callback/
vtable/registration edges, mutable pointer producers and unexplained data/IDs.
Structural and decoder populations overlap and cannot be summed as AS functions
or missing implementation. A Ghidra body, decoded opcode, encoded pointer or
proposed guarded successor is not proof of a runtime call or source semantics.

The expanded exact instruction/body/reference exports, remaining-byte ranges and
complete residual selector sets and operand/dispatch/ownership derivations are
verified within their recorded structural bounds. The current
[connection ledger](coverage/exe-connections.json) and
[machine unknown queue](evidence/0.120.5/unknown-recovery.json) select that same
exact expanded census; these joins do not establish source semantics. The [unknown recovery queue](unknown-recovery-0.120.5.md)
and [CURRENT-STATE](../CURRENT-STATE.md#gap-41) own the next static actions under
#41 and individual findings. Historical byte matches and shape correspondence
are candidates; current producer/dispatch/state/dependency/consumer applicability
requires its own assessment and never transfers runtime validation.

The connection ledger retains **55 ownerless native Location references across
12 AS diagnostic paths**. This Location/source projection differs from the
broader raw diagnostic-context population above. Its AS-only denominator is
62 known modules: **100% — 62/62** have partial reconstructed source, and
**4.8% — 3/62** have registered current-target bounded contracts. The
[module register](module-contracts-0.120.5.md) links all 59 missing current
contract dimensions to their permanent findings. These are module counts,
not percentages of AS code decompiled, implemented or matched; one bounded
contract does not certify a complete module.

The [current historical-range assessment](coverage/historical-range-revalidation.json)
retains 19,825 range commitments and 1,306 unique exact byte-match candidates.
Retained semantic knowledge, source repairs and classifications keep their
original target. Byte-match candidates supply navigation, not current
producer/dispatch/state/dependency/consumer or runtime/parity equivalence.

The public benilla/wenilla source remains the engine implementation. Generic
engine/compiler/OS internals are supporting context once the necessary AS
interface boundary is established; whole-image inventory does not create an
engine reconstruction task. Only concrete AS differences and required unresolved
contracts expand native recovery.

No application compilation, compiling test, client/game/network/server operation,
installed save/settings mutation or controlled original/rebuilt comparison is
part of this census. Actual behavior, complete reconstruction and parity remain
unverified.
