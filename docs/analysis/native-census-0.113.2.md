# Native inventory and discovery — 0.113.2

Target SHA-256: `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[Target review](target-0.113.2.md), [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md),
[discovery comparison](evidence/0.113.2/discovery-delta.json).

## Whole-file and independent byte accounting

The complete [PE inventory](evidence/0.113.2/refresh-baseline/native-summary.json) scans all 141,932,032
file bytes, six sections, embedded script/UI/configuration, numeric-ID/resource/
module leads, 350,352 declared unwind extents, 425 imports and 634,029 nonpadding
relocations. There are 730 diagnostic paths (59 custom). `realmd.rs` is present
again and uses its existing system identity; no diagnostic path disappeared.
[Diagnostic decoding](evidence/0.113.2/refresh-baseline/diagnostic-ownership.json) verifies 17,782 reference
leads, with leads for all 59 custom paths. The import function/library sets and
nine complete MPQ hashes match 0.113.0. These are not behavioral equivalence.

The [linear census](evidence/0.113.2/refresh-baseline/instruction-summary.json) decodes all 350,352
extents: **23,264,391 instructions / 94,075,592 bytes**, with no
undecoded suffix. Its 72,276 indirect-call and 10,292 indirect-jump records
remain encoded leads. The [complement pass](evidence/0.113.2/refresh-baseline/unwind-complement-summary.json)
accounts separately for all **5,126,838 executable bytes outside declared
extents**: 307,096 decoded candidate bytes, 2,302,030 mixed/unclassified,
925,331 uniform-CC, 10,931 uniform-NOP and 1,581,450 padding-sequence candidates.
These disjoint byte classes do not establish reachability, noncode or semantics.

The [file-range ledger](evidence/0.113.2/refresh-baseline/file-range-summary.json) independently covers
the entire file as 26 disjoint intervals: 99,202,430 executable-section bytes,
42,727,512 nonexecutable-section bytes, 1,066 raw alignment-tail bytes and 1,024
header bytes. There are no unmapped gaps or trailing bytes. The 200-byte DOS
stub, 256-byte header slack and all raw tails retain unknown roles; zero-filled
bytes do not establish padding. The [whole-file/Data queue](unknown-recovery-0.113.2.md#whole-file-and-data-range-leads)
links exact file-offset/hash selectors and separates the nine MPQ identities
from the [member/override/source map](mpq-member-coverage-0.113.2.md), which also
reproduces without changes. Resource semantics remain open. This structural
partition overlaps native/code/data inventories and does not change their counts.

## Retained declared-entry Ghidra baseline

The [full-image pass](evidence/0.113.2/full-image-census.json) reads the installed EXE
in place through the project REA/Ghidra streaming driver, automatic analysis
disabled, 6 GiB heap. Every one of the **350,352 requested declared starts** has
a decoded entry and repaired flow body; none is missing. Bodies follow observed
control flow rather than being forced to unwind extents.

The pass exports **21,843,332 instructions / 87,179,880 bytes**,
**352,705 native functions**, 409,078 body ranges, **3,761,127 static
Program references** and 425 external locations. Capstone 5.0.7 independently
checks every exported instruction's exact installed bytes and length. All 2,362
observed direct-CALL helper targets have final owners; changes during primary
body repair remain separately audited in the summary.

Ghidra leaves **12,022,550 executable bytes unobserved**:
7,142,485 inside declared extents and 4,880,065 outside. The summary commits
all residual ranges/classes. Its **67,794 computed calls / 134,774 computed jumps**
remain unresolved ownership/alias/semantic leads. This declared-entry profile
applies no current expanded switch, complement/address-taken, metadata or
custom-dispatch queue; no current atomic semantic/source classifier is published.
Those discovery limits remain under **#41**. Generic engine recovery is outside
this task, and co-op gameplay/network/server logic is excluded.

This declared-entry diagnostic join retains 1,881 verified sites without an observed
body owner, including 109 sites across seventeen custom paths. Its exact
per-path counts are linked into the system register; `coop/route.rs` is the only
custom path without any observed diagnostic-site body owner in this profile.
These are discovery limits, independent of the separate minimum-owner queries
below, and do not authorize generic engine or excluded co-op implementation.

The canonical [Unknown recovery queue](unknown-recovery-0.113.2.md) binds exact residual selectors/digests, grouped #41 lead IDs and unavailable downstream inventories to this EXE hash. Grouping does not resolve native/source semantics.

## Expanded full-image Ghidra audit

The selected [expanded summary](coverage/full-image-execheck.json), profile
`7e0f8fd7ebf982e5f87fcc2200bf770dcb5097c33c78668e7dcb4225c569ff0c`,
preserves the complete PE context and applies all prepared entry/code queues:
421,704 function-entry candidates plus 24,184 additional code-only starts.
Every requested entry decoded and had its flow body repaired; no extra code
seed lacks an instruction. The [input manifest](evidence/0.113.2/execheck-native-inputs.json)
retains original producer hashes, including the earlier verifier source in Git.
Those commitments are distinct from the current launch and independent verifier.

The inputs admit 2,532 guarded tables /16,599 distinct case edges, 1,881
diagnostic-code leads, 8,050 independently checked address-code starts, two
import thunks and 28 explicit metadata entries, with complement and relocated
pointer leads. A code-only target is never converted to a function entry merely
to improve ownership counts. Automatic analysis remains disabled, with a 6 GiB
heap and read-only installed input.

Capstone 5.0.7 independently verifies all **22,663,778 instructions /90,722,422
bytes**. The export contains **424,166 native functions**, 478,928 body ranges,
3,919,777 Program references and 425 external locations. Unobserved executable
bytes decrease to **8,480,008**: 5,219,203 inside declared extents and 3,260,805
outside. Their 462,533 exact residual ranges retain every padding candidate.

The new decoded code-only regions include **73,479 instructions /346,639 bytes
without a function-body owner**. These are explicit `Q41-O01` classification
inputs, not new gameplay systems or proof that a function is missing. The
70,681 computed-call and 140,058 computed-jump opcodes are observed populations;
2,532 jump sites have applied guard proofs, while 137,526 lack an applied proof
in this profile. Guarded fallthrough evidence leaves incoming contexts open.
All 135,406 distinct relocated executable targets now have body owners; slot
types, runtime writes and dynamic uses remain unproved.

All 776 custom diagnostic sites decode; 719 have body owners and 57 across
thirteen nonexcluded paths remain ownerless. The Location-only subset is 728
records, with 55 ownerless. All 59 custom paths have at least one Location body
owner, including excluded co-op paths. Source correspondence, current bounded
contracts and gameplay parity remain separate dimensions. The complete
[connection audit](execheck-0.113.2.md) and [unknown queue](unknown-recovery-0.113.2.md)
own the follow-up map. `M01`/`M02` inputs are now available; `M03` still lacks
complete current semantic/source/alias classification. **#41 remains open.**

The queue now retains a [bounded U04 classification](unknown-recovery-0.113.2.md#classified-u04-interval-inter-function-trap-fill):
ten bytes at `[0x145807d86,0x145807d90)` have an inter-function trap-fill pattern,
with no observed incoming reference or established AS contract. This inferred
supporting context does not prove dynamic unreachability or remove census bytes.

The [complete residual-encoding proof](residual-encodings-0.113.2.md) independently classifies all 462,533 Ghidra-unobserved intervals and all 332,690 complement residuals. In the Ghidra view, 3,487,203 bytes decode entirely as NOP/INT3; 4,992,805 remain mixed/unclassified. The independent complement retains 2,273,044 mixed bytes. These overlapping views are not added, do not prove padding/reachability or AS ownership, and do not remove original unobserved bytes.

The [PE resource inventory](evidence/0.113.2/pe-resources.json) independently
binds all eight payload ranges and the seven icon-group relationships. It does
not decode images or observe Windows loading. Fifty-nine selected-target
static contract checkers pass within their [recorded bounds](evidence/0.113.2/execheck-validation.json).
No application compilation, game execution or controlled parity comparison ran.

## Selected diagnostic owners and source correspondence

The separate [selected full-PE profile](evidence/0.113.2/refresh-baseline/seeded-census.json) completes
all **59 diagnostic-owner query sets** without failures: **13,399 independently
checked instructions**, 63,662 summed body bytes, 2,880 outgoing and 1,428 incoming
references, and 245 unresolved calls. All 59 selected bodies match independent
linear boundaries; 33 match their declared extents exactly. Only 58 selected
diagnostic instructions occur in the recovered selected bodies: the `coop/route.rs`
site remains outside its selected owner's recovered flow body. It is retained
as an explicit limitation, without artificial body expansion or co-op recovery.
This is one minimum owner per diagnostic path, not complete custom-source recovery.

The source correspondence review resolves all 423 unique references, including
historical script aliases, and all 138 named anchor records. Existing local startup,
mechanics, card typing capture and client-delivery consumers remain connected.
The [migration repair](legacy-config-0.113.2.md) and
[UI-only co-op adapter](coop-ui-0.113.2.md) now have bounded source counterparts;
four excluded co-op backend systems remain absent. The adapter has no live
discovery/session producer. These later repairs do not expand the census's
observed bodies or establish complete source/native semantics.
Line-only anchor corrections do not revalidate historical native behavior.
The 15,516-byte historical embedded addon Lua matches this EXE exactly at its
newly observed offset; native packet dependencies remain unrevalidated.

The unchanged-target audit repeats registration/resource verification,
whole-file/diagnostic discovery, linear/complement accounting and all exact
unknown-queue selectors. A fresh complete all-seed REA/Ghidra run reproduces
the expanded profile, every requested entry/body operation and code-only seed.
Capstone independently verifies all 22,663,778 new instruction records and their
90,722,422 source bytes. The [replay witness](coverage/execheck-replay.json)
commits the actual collector/verifier, original proof-producer manifest and new
exports. Decompressed content matches for instructions, bodies, references,
externals, both helper inventories and both residual-range inventories. The
canonical selection and all residual counts remain unchanged.

The disjoint file ledger reproduces every interval and Data identity; nine
non-compiling regressions cover headers, gaps/trailers, security offsets,
raw/virtual bounds and unknown alignment tails. The resource tree also
reproduces all eight payloads/seven icon relationships. Historical native/source
proofs retain their actual target and are not promoted by matching labels,
script bytes or this replay. Fifty-nine current static checkers pass through 61
invocations, separately from the native census and its semantic unknowns.
No application compilation, compiling tests, game/network execution,
save/configuration write or controlled original/rebuilt comparison ran.

## Reproduction

Use an existing Python environment containing Capstone 5.0.7 for decoder commands.
All outputs stay inside this checkout; all native work uses `./scripts/rea`.

```sh
python3 -B scripts/register-target.py --inspect-installed
python3 -B scripts/inventory-current-target.py --write
python3 -B scripts/inventory-current-target.py --check
python3 -B scripts/inventory-target-ranges.py --write
python3 -B scripts/inventory-target-ranges.py --check
python3 -B scripts/test-target-ranges.py
python3 -B scripts/discover-native-ownership.py --write
python3 -B scripts/discover-native-ownership.py --check
python3 -B scripts/inventory-native-instructions.py --write
python3 -B scripts/inventory-unwind-complement.py --write
python3 -B scripts/census-current-target.py --run --full-profile full-image-diagnostic-owner-repaired --limit 59 --startup-timeout 600
python3 -B scripts/summarize-seeded-census.py --write
python3 -B scripts/census-native-image.py --run --startup-timeout 1800
python3 -B scripts/summarize-native-image.py --write
python3 -B scripts/test-native-census-selection.py
python3 -B scripts/register-target.py --check
python3 -B scripts/check-reconstruction-coverage.py
```

Use a new `--output runtime/<directory>` for a second streaming pass and the same
`--input` for its summarizer. Preserve exact completed plan/profile/input/tool
commitments and ignored native exports. Consistent accounting does not certify
native completeness, source compilation or gameplay/presentation parity.

The expanded run uses the exact proof inputs recorded in
`runtime/execheck-0.113.2/ghidra-comprehensive/plan.json`. With those inputs
restored and verified, reproduce into a fresh output directory:

```sh
python3 -B scripts/census-native-image.py --run --seed-scope all \
  --jump-tables runtime/execheck-0.113.2/proofs/guarded-jump-tables-summary.json \
  --diagnostic-leads runtime/execheck-0.113.2/proofs/diagnostic-code-leads.json \
  --import-thunks runtime/execheck-0.113.2/proofs/import-thunks-summary.json \
  --unwind-handlers runtime/execheck-0.113.2/proofs/unwind-handlers-summary.json \
  --address-leads runtime/execheck-0.113.2/proofs/address-code-summary.json \
  --output runtime/execheck-0.113.2/ghidra-comprehensive-rerun --startup-timeout 1800
python3 -B scripts/summarize-native-image.py \
  --input runtime/execheck-0.113.2/ghidra-comprehensive-rerun \
  --summary-output runtime/execheck-0.113.2/ghidra-comprehensive-rerun/verified.json --write
```

The manifest links each missing input's producer. Regenerating an input with
changed tools creates a new commitment/profile; never rewrite the retained
producer hashes to make a replay appear identical. Review a new summary before
selecting it for the custom partition, historical-range audit and unknown queue.
