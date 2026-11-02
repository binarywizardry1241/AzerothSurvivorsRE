# Survivors native coverage — 0.109.0

**Historical target:** this report covers 0.109.0 only. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) record the installed target and current implementation limits.

Target SHA-256 `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`,
140,447,744 bytes. The configured installed EXE is the authoritative input.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own implementation and gap status.

## Azeroth Survivors scope

**#41 concerns Survivors-specific code, deltas and undiscovered systems over the
existing public benilla/wenilla source baseline.** Reconstructing generic engine,
compiler, graphics-loader or Windows internals is not a prerequisite. The
whole-image records below supply discovery and address context; their generic
unknowns are supporting limits, not a new engine-reimplementation queue.

The [custom coverage partition](evidence/0.109.0/native-custom-coverage.json)
accounts for all **53 custom paths**, containing **87 filename occurrences**.
Their **683 raw path-associated instruction leads** all match independently
verified current instruction boundaries. **587** leads lie inside **238 distinct
actual native body owners**; **96** are decoded without an established owner.
Those raw relationships split into **656 Rust Location references** and **27
literal-path candidates**. Location references have **562 owned sites / 223
distinct owners** and **94 ownerless sites**. All 53 paths have Location
references; **52** have an actual Location body owner. Rewards is the exception:
both its Locations are ownerless failure blocks; its former owned raw lead is
only filename-adjacent data. Of the 27 literal candidates, 26 address bytes before
the filename and one addresses its start. They establish no source-body claim.
The runtime inventory preserves every raw lead, exact role, current line/column
and declared extent separately from actual body ownership.

There are now **53 reviewed partial source correspondences**.
[Current XInput acquisition](input-0.109.0.md) connects the previously unmapped
`crates/wenilla-rogue-app/src/screens/xinput.rs` to Windows source and 66,794
bounded native cases under **#22/#41**. Downstream custom input and external
platform behavior retain separate recovery/runtime/parity limits. The partition binds only the 53 custom rows' original paths,
source references, review anchors and candidate source hashes. Ledger counts or
new evidence links cannot create a hash cycle or promote source equivalence.

The [focused site-role audit](evidence/0.109.0/native-custom-site-roles.json)
accounts for all 96 raw ownerless leads, inside **20 declared PE extents**.
The 94 Location consumers are **67 bounds failures**, **23 formatted failures**,
**one missing-key failure**, **one Option unwrap failure** and **two checked
vector-removal error paths**. No additional missing Survivors mechanic consumer
was established in this finite audit. The two remaining ownerless Auras leads
and three selected owned Auras leads address the five-byte label `spell`, not
the adjacent filename; their exact pointer/length/consumer contracts are bound.

The 94 actual ownerless Locations span **13 custom paths**: Armory, Markers,
Options, Rewards, Content, Fonts, Abilities, Demons, Enemy, Hazards, Talents,
Upgrades and Navigation. They are accounted cold failure paths, not 94 missing
gameplay consumers. Their actual function attribution remains unknown. Neither
this result nor the 53 source correspondences proves complete enum dispatch,
state transitions or producer/consumer behavior. A declared unwind extent is
address context and is never substituted for an actual control-flow body.

The selected **#42 raid graph** has its own current evidence and source
consumers: [raid graph](raid-native-0.109.0.md),
[sequences](raid-sequences-0.109.0.md), [wards](raid-wards-0.109.0.md),
[actor order](actor-frame-order-0.109.0.md) and
[markers](raid-markers-0.109.0.md). Its sixty bosses, thirty-seven guardians and
493-node action graph reach live source consumers, with no missing action
consumer in that selected graph. This is separate from proving all behavior
associated with `enemy.rs` or `hazards.rs`, and from game/terrain/presentation
validation. The current [camera contract](camera-room-0.109.0.md) likewise
revalidates the selected correction helpers and native control → correction →
shake order, rather than reconstructing the shared camera engine.

**#41 remains open for actual Survivors contracts and discovery limits.**
All known diagnostic paths having some decoded code does not prove the absence
of undiscovered custom systems, or complete behavior in those systems. Existing
mechanic-specific gaps own their unrecovered contracts. Runtime/gameplay parity
is a separate evidence obligation. No application build, compiling test, game
launch or original/rebuilt comparison ran in this census work.

## Selected machine-code observations

The [atomic current selection](evidence/0.109.0/native-image-current.json) binds the
verified census, actual applied switch proof, current ownership classification
and historical audit. REA 6.5.0 / Ghidra 12.1.4 streams instructions, repaired
flow bodies, references and external locations. Independent Capstone 5.0.7
checks every exported instruction's installed bytes and length. Inclusive body
ranges and half-open unwind extents stay distinct; overlaps are rejected.

| Independently verified profile | Function seeds | Instructions | Instruction bytes |
| --- | ---: | ---: | ---: |
| [Declared](evidence/0.109.0/full-image-census.json) | 347,099 | 21,620,813 | 86,265,316 |
| [Complement](coverage/full-image-complement.json) | 2,636 | 736,675 | 3,085,850 |
| [Relocated pointer leaves](coverage/full-image-pointers.json) | 71,283 | 1,833,062 | 7,848,895 |
| [Integrated](coverage/full-image-integrated.json) | 420,399 | 21,977,994 | 87,703,631 |
| [Guarded](coverage/full-image-switches.json) | 420,399 | 22,332,968 | 89,289,087 |
| [Guarded v2](coverage/full-image-switches-v2.json) | 420,399 | 22,338,458 | 89,313,475 |
| [Helper fixed point](coverage/full-image-switches-v3.json) | 420,399 | 22,339,095 | 89,316,047 |
| [Diagnostic code](coverage/full-image-diagnostics.json) | 420,399 | 22,348,643 | 89,358,375 |
| [Diagnostic flow](coverage/full-image-diagnostics-v2.json) | 420,399 | 22,348,657 | 89,358,438 |
| [Import thunks](coverage/full-image-thunks.json) | 420,401 | 22,348,659 | 89,358,452 |
| [PE entries](coverage/full-image-pe-entries.json) | 420,417 | 22,349,356 | 89,361,090 |
| **[Selected address profile](coverage/full-image-addresses.json)** | **420,417** | **22,422,439** | **89,704,052** |

These overlapping totals must not be added. The selected profile contains
**420,596 actual functions**, **473,935 body ranges**, **3,882,708 Program
references** and **420 external locations**. Every requested function entry and
all **28,831 extra code starts** decode; missing requested instruction/body
counts are zero. All **2,357** direct-CALL helper targets have final owners.
The **2,342** creation operations are not net retained functions; eleven helper
owners change during primary body repair. No observed direct-CALL destination
lacks an owner; **5,179 call-source sites** remain in ownerless decoded blocks.

The selected [switch proof](coverage/native-jump-tables.json) is the exact
executed **3,355-table / 21,454-edge** snapshot. It accepts explicit unsigned
selector guards or complete bounded scalar domains in an immutable signed-offset
MOVSXD/ADD/JMP idiom. Unknown high bits, overwritten values, high-byte guard
confusion, address-size overrides, backward-loop propagation and incomplete
whole-domain instruction boundaries are rejected. Later exploratory proposals
are retained only under runtime and are not selected, applied or counted here.

The [address-code input](coverage/native-address-code-leads.json) supplied
**5,951 code-only starts** from exact RIP-relative LEAs. Full instruction spans
stay in one executable file-backed mapping; inconsistent target graphs are
rejected. LEAs establish address relationships, not function entries, callback
types or incoming edges. Earlier diagnostic-code inputs likewise supply code
without invented function ownership. Strong entry seeds decode first.

Bulk instruction/reference/body inventories and all 725 diagnostic binding rows
stay under ignored runtime with exact digests. Supporting profiles retain their
actual executed tool and input history, including earlier REA private snapshots.
The selected run imports the configured installed EXE directly and read-only.
[Executed-source witnesses](coverage/native-executed-tool-sources.json) retain
hash-verified old proof-tool source; they do not relabel an old run as using a
later repair. Current derivative tools and all actual artifacts remain checked.

## Reference union and source reuse

With automatic Data Reference analysis disabled, complete Program export does
not imply complete explicit operand coverage. The
[operand supplement](evidence/0.109.0/native-operand-boundaries.json) inspects all
**22,422,439** verified instructions. It joins **488,811 LEA pairs** absent from
Program export with **172,730 fixed-memory pairs**, all already present there.
The [ownership classifier](evidence/0.109.0/refresh-baseline/native-ownership-classification.json) binds
that exact same-census union. No READ/WRITE/CALL semantics are assigned to LEAs.
All **420 declared imports** now have observed native owners, while only **7**
join candidate diagnostic paths. Runtime slot writes, successful DLL binding and
external implementation are separate from these static observations.

Across the entire image the classifier distinguishes **70,030 indirect calls**
and **11,321 indirect jumps** from trap/interrupt labels. It records **1,328
import-call / 183 import-jump** candidates and **940 native-call / 14 native-jump**
candidates; incoming register, pointer, index and alias state remain explicit.
The [dispatch boundary record](evidence/0.109.0/native-dispatch-boundaries.json)
retains current producer shapes and **5,295** exact decoded unowned direct-jump
destinations with **6,847** incoming references from other unowned blocks. These
are full-image bookkeeping limits, not a requirement to rewrite benilla.

The source audit classifies **725 path records**: **53 custom paths**, **614
pristine vendored candidates**, **47 modified/local candidates**, **10 missing
engine candidates** and **1 embedded shader-comment path**. Of these, **564**
have recovered Rust Location records; **160** remain literal-path candidates.
The alleged Bevy `visitors.rs` path occurs inside a byte-identical embedded WGSL
comment, not a missing compiled Rust file. The
[source-boundary evidence](evidence/0.109.0/native-source-boundaries.json) binds
that distinction and the bounded public-source search. Existing public engine
source remains the reuse baseline; path or byte identity alone does not certify
the exact compiled revision or every custom integration.

The EXE has RSDS identity `benilla_rogue.pdb`, raw GUID
`bf853d3aaacbdc4cbe7080488c5636a1`, age 1. COFF symbol count is zero; Type 13
has 44 linker-section names rather than function/source names. The exact
Microsoft public-symbol route
`benilla_rogue.pdb/3A3D85BFCBAA4CDCBE7080488C5636A11/benilla_rogue.pdb`
returned HTTP 404. This tests one symbol route and establishes no blanket PDB
absence. Compiler and shader revision strings do not identify a game commit.

The compact [PE metadata](evidence/0.109.0/native-pe-boundaries.json) and
[conditional slot](evidence/0.109.0/native-resolver-boundaries.json) records retain
completed static boundaries. PE entry/unwind routes add sixteen seed addresses,
fourteen previously unowned; two other omitted IAT thunks add two. Volatile
metadata has a compatible 116-byte layout with thirteen instruction annotations
and five already declared range starts, no new callable entries; packed version
semantics and Windows runtime acceptance remain uncertified. Six initially zero
fixed call slots have conditional producer proofs. None of these generic facts
is a missing Survivors mechanic or an engine-reconstruction requirement.

## Historical evidence and remaining byte limits

The [historical audit](coverage/historical-range-revalidation.json) preserves
original EXE identities. It admits only exact byte-count/SHA preimages from
encoded assembly, explicit JSON, native artifacts, UTF-8 or witnessed
record/array serializers. It never guesses padding, layout or target identity.
Each preimage is searched across the whole current image and joined to current
bodies; an exact short match revalidates only those bytes, not gameplay behavior.

Of **9,614** distinct historical commitments, **6,688** have exact preimages and
**2,926** remain unavailable. Search finds **565 unique**, **3,008 ambiguous** and
**3,115 absent** byte sequences. Unique matches comprise **545 data/header**,
**11 whole-body executable** and **9 executable ranges without complete body
coverage**; only two also match their old file offset. Explicit identities bind
781 documents and exact owning-manifest hashes bind two; 46 documents remain
unbound. Historical mechanic contracts need current producer/consumer evidence
under their actual owning gaps before reuse.

Of **98,142,894 mapped executable bytes**, **89,704,052** are in the selected
instruction union and **8,438,842** remain unobserved: **5,292,799** inside
declared extents and **3,146,043** outside. Mixed/unclassified portions are
**4,926,648** and **51,334** bytes respectively. The other **3,460,860** bytes
are CC/NOP or canonical padding candidates, not proved noncode. This accounting
is distinct from the larger declared-extent linear decode and old complement
partition. Neither byte total proves complete custom behavior.

Anonymous/template semantics, generic alias/type invariants and external
implementations remain static or platform unknowns. They are not silently called
verified, and they do not expand #41 into reimplementing the public engine.
Actual Survivors-specific dispatch, state or source connections discovered by
bounded evidence must still be repaired. Compilation, MPQ-backed gameplay,
input/audio/rendering and original/rebuilt parity remain unverified.

## Reproduction

[REA setup and commands](../REA.md#whole-image-streaming-recovery) document the
collector, independent checks, exact applied snapshots and atomic selection.
`summarize-custom-native-coverage.py --site-role-proof
docs/analysis/evidence/0.109.0/native-custom-site-roles.json --write` reproduces
the AS partition from that verified selection; its noncompiling regressions check source
projection stability when ledger-only fields change. Other focused Python/Node
regressions cover decoder boundaries, source-role classification, pointer widths,
guard/alias admission, historical preimages, input snapshots and accounting.
A coverage-check pass certifies accounting consistency, not native completeness
or gameplay fidelity.
