# Unknown recovery queue — 0.113.2

This is the canonical residual queue for EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`
(141,932,032 bytes, preferred image base `0x140000000`). The installed identity
was rechecked. Every lead below belongs to permanent gap **#41**; the lead IDs
are subordinate evidence identities. Grouping does not resolve an unknown or
establish source behavior, runtime validation or parity.

The [selector proof](evidence/0.113.2/unknown-recovery.json), SHA-256
`d4148a7bcd2feb746bdd36dd5c88dfbe804b5f608edeafe16792841405ac342b`,
records exact input paths/digests, projections, ordering, output digests, counts,
profiles and address conventions. It selects **all** members of each residual
set from the existing inventories; it contains no sampled replacement inventory.
Bulk artifacts remain under ignored `runtime/execheck-0.113.2/` and
`runtime/coverage/<EXE SHA-256>/`.
The [native census](native-census-0.113.2.md) owns the underlying pass results.

## Evidence and selection rules

The completed full-image Ghidra profile is
`7e0f8fd7ebf982e5f87fcc2200bf770dcb5097c33c78668e7dcb4225c569ff0c`:
421,704 function-entry candidates and 24,184 additional code-only starts,
repaired flow bodies, automatic analysis disabled, 6 GiB heap. It applies 2,532
guarded tables plus verified diagnostic, address-code, import and metadata
inputs; the [input manifest](evidence/0.113.2/execheck-native-inputs.json) retains
their original producer commitments. The earlier declared-only profile remains
unchanged in `evidence/0.113.2/full-image-census.json`.
The independent linear and complement inventories use Capstone 5.0.7. The
selected diagnostic-owner profile is
`20376f200a3fe4b860eeba0aa2e7b217d020a0c49b9dee0b6724e606d1754075`.
These profiles establish their recorded observations, not exhaustive flow or
semantic ownership. Repeating the same disabled-analyzer profile cannot supply
the missing computed targets or semantic classifier.

TSV addresses are preferred VAs in hexadecimal. Range inventories use exclusive
ends; `bodies.tsv.gz` has inclusive ends. SQLite interval ends are exclusive and
addresses are preferred-VA integers. Subtract `0x140000000` to obtain RVAs; do not
treat these as file offsets. All executable ranges below are in `.text`, RVA
`[0x1000,0x5e9c57e)`. Other section mappings and actual file offsets remain in
`inventory.json` / SQLite and the proof. An actual owner means membership in a
nonexternal, disjoint Ghidra body range, never merely an enclosing unwind extent.

Use the exact selectors in the proof, then select a bounded site/range and its
necessary incoming/outgoing references through `./scripts/rea` with Ghidra.
Retain target-bound bytes, actual body boundaries, the ownership/value question
and the evidence answering it. A newly established AS dependency proceeds into
its owning system and existing gameplay gap. A known engine or excluded co-op
branch stops after classification. This queue selects the independently verified
expanded census from the [EXE audit](execheck-0.113.2.md); selector derivation
itself performs no new native decoding.

## Whole-file and Data range leads

The independent [file-range summary](evidence/0.113.2/refresh-baseline/file-range-summary.json) commits
`runtime/coverage/<EXE SHA-256>/file-ranges.json`. This ledger partitions
**all 141,932,032 file bytes into 26 disjoint half-open intervals**, with zero
overlap or omission. Its exact selectors are `ranges[selector]`, carrying
`file_start`, `file_end_exclusive`, byte count and SHA-256. These are **file
offsets**, independent of the preferred-VA native selectors below. Structural
classes describe the PE layout; they do not measure semantic recovery. The
ledger overlaps existing instruction/data populations, so never add their totals.

| Lead | Exact population and status | Next static action and completion evidence |
| --- | --- | --- |
| `Q41-B01` | `ranges[lead_id=Q41-B01]`: 99,202,430 executable-section file bytes; semantics remain individually bounded by the existing native proofs. | Select a file interval, convert through its recorded section/RVA mapping and use Ghidra with the U/S/O/F selectors below to establish the selected producer/consumer contract. Decoding alone does not close semantic ownership. |
| `Q41-B02` | `ranges[lead_id=Q41-B02]`: 42,727,512 nonexecutable-section bytes, split at declared directory boundaries. | Select one exact data/metadata interval and its directory indices; parse its format, then trace Ghidra references to its AS/engine/excluded owner and source consumer. Keep opaque resources, IDs and undeclared data explicit. The existing PE resource payload inventory remains bounded supporting evidence. |
| `Q41-B03` | `ranges[lead_id=Q41-B03]`: 1,066 raw section-tail bytes across five sections, now [classified as supporting zero-tail context](pe-layout-classification-0.113.2.md); no AS contract established and original unknown alignment states retained. | All twelve B03/B05 intervals reproduce through fresh Ghidra reads; all five tail endpoint xref sets and complete retained incoming/encoded inventories contain no tail reference. Zero bytes do not prove padding or dynamic unreachability. Reopen on an actual AS entry/read/write or contradictory observation; do not reconstruct generic loader behavior. |
| `Q41-B04` | `ranges[lead_id=Q41-B04]`: **zero current unmapped gaps, overlays or trailers**. The final section ends exactly at file size; the security directory is absent. | Reopen if a future target yields one of these intervals. The generator retains such bytes and treats security-directory addresses as file offsets; no zero population is assumed for future inputs. |
| `Q41-B05` | `ranges[lead_id=Q41-B05]`: all 1,024 header bytes, now [classified as PE/DOS/Rich structural context](pe-layout-classification-0.113.2.md), including the 200-byte stub/metadata interval and 256 zero slack bytes. | The current reader validates MZ/PE/PE32+ and section bounds. The slack-start LEA forms the one-past-section-table bound, not a byte read. DOS code is decoded, not executed; Rich component IDs/checksum and OS loader behavior are not recovered. This branch stops at supporting platform context; original selectors/counts and dynamic-entry/alias limits remain visible. |
| `Q41-R01` | `data_resources[selector]`: nine registered MPQs with complete identities and zero additional Data files. The [complete member/source map](mpq-member-coverage-0.113.2.md) now accounts for all 29,680 active hash slots/blocks and 29,672 unique names, with zero opaque active slots or unreferenced active blocks. | Exact archive/slot/block and source-priority selectors/digests are available in the proof. Of all 303 original D03 resource-path candidates, 79 are exact member names, 186 require a native basename/path producer, and 38 have no exact or basename match. Follow those exact producers/IDs and their AS consumer when established; table/name coverage does not certify resource semantics, native mount/locale equivalence, content decoding, runtime loading or parity. |

Run `python3 -B scripts/inventory-target-ranges.py --check` to reproduce every
interval/hash and Data identity. `--write` regenerates the ignored ledger and
compact durable summary after review; the main coverage checker also runs this
reproduction. Nine non-compiling regressions cover missing gaps/trailers,
alignment candidates, raw-versus-virtual bounds, directory mapping/security
offsets, overlaps, truncation and byte changes. No new native body, gameplay
contract or runtime comparison is supplied by this partition.

## Range and decoded-code leads

Each row names its proof selector(s). Inputs and prior results are the profiles
above; there is no missing input preventing bounded classification of a row
with an available exact selector. The next action is conditional on selecting
that lead, not authorization to sweep its entire group.

| Lead | Observed set / state | Unresolved question and next static action; completion evidence |
| --- | --- | --- |
| `Q41-U01` | **One bounded AS range classified; other ranges actionable.** Original 54,975 Ghidra-unobserved declared ranges, **5,219,203 bytes**. | The [upgrade-magnitude proof](evidence/0.113.2/q41-u01/report.md) classifies `[0x145840d78,0x145840f24)` as five ordinary upgrade lanes behind a computed jump; 1,050 native magnitude and 15 rarity bounds cases match existing source. Fresh FunctionManager still omits those cases; original residual counts remain unchanged. Choose another exact range with a diagnostic/reference lead and recover its flow/consumer before source work. Independent linear decoding and Ghidra nonobservation remain distinct. |
| `Q41-U02` | **Actionable, ownership unestablished.** 407,558 Ghidra-unobserved outside-declared ranges, **3,260,805 bytes**. | Check one range's encoded entry/address references and section bytes before attempting a Ghidra body. Completion needs coherent code ownership or evidenced noncode classification; a plausible decode alone does not suffice. |
| `Q41-U03` (`-suffix`) | **Resolved operational accounting only.** All 350,352 linear extents processed; zero undecoded suffixes/pending extents. All 350,352 Ghidra declared entries/bodies and all 421,704 requested entry candidates are present; no additional code-only seed lacks an instruction. Selected-owner queue: 59 complete, zero pending/failed/in progress. | Preserve zero residuals and completed profile records. No failed current operation/range is hidden here. Reopen for changed input/profile or an exact contradictory site; this does not resolve semantic unknowns. |
| `Q41-U04` | **Actionable; one bounded supporting classification retained below.** Independent complement residual: 332,690 exact intervals, **4,819,742 bytes**, after subtracting its decoded union. | Query one residual interval's seed/reference context and recover an exact bounded entry/range or establish its role. The independent complement view overlaps `U02`; do not add their bytes. The classified ten-byte trap-fill pattern remains in the original inventory; it does not resolve other intervals or prove dynamic unreachability. |
| `Q41-S01` (`-full`, `-linear`, `-complement`) | **Actionable classification inputs; exact unrevalidated semantic subset unavailable (`M03`).** Ghidra: 22,663,778 instructions /90,722,422 bytes; linear: 23,264,391 /94,075,592; complement: 71,073 /307,096. | The [card-input proof](evidence/0.113.2/card-keyboard/report.md) now binds capture, all nine shortcuts and distinct opening/exit gates, with [ordered delivery](evidence/0.113.2/card-delivery/report.md) reaching immediate source transactions. Other selected AS-linked entries retain their owning contract/source questions. Record byte/range/value/consumer proof and remaining dependencies. These are decoded input populations, **not counts of wholly unknown behavior**; current bounded repairs already cover some members. |
| `Q41-O01` | **Actionable ownership classification:** 73,479 decoded instructions /346,639 bytes have no actual function-body owner. These include code-only seeds and their flow. | Select one exact site, trace its code-seed provenance and incoming/outgoing flow, then classify AS/engine/co-op and whether a callable entry or failure block exists. Keep code-only blocks ownerless when evidence supplies no function entry; never force unwind ownership. |

Padding classifications remain candidates. `U01` partitions into 4,849,350
mixed/unclassified bytes, 365,310 NOP/CC-instruction candidates, 4,541 uniform-NOP
candidates and 2 uniform-CC candidates. `U02` partitions into 143,455 mixed,
1,582,124 NOP/CC-instruction, 12,519 uniform-NOP and 1,522,707 uniform-CC bytes.
The independent `U04` partition is 2,302,030 mixed/other, 1,581,450 padding-sequence,
10,931 uniform-NOP and 925,331 uniform-CC bytes. No candidate class was discarded
or promoted to proven padding. `U01 + U02 = 462,533 ranges /8,480,008 bytes`;
`U04 + S01-complement = 5,126,838 complement bytes`.

### Complete residual-encoding classification

The [current encoding proof](residual-encodings-0.113.2.md) reads all U01/U02 and U04 intervals, not a sample. It classifies 3,487,203 Ghidra-unobserved bytes and 2,546,698 independent complement bytes as complete NOP/INT3 encodings. Their original populations overlap and remain unchanged; static encoding does not establish padding, reachability, AS/source ownership or dynamic aliases. The remaining mixed sets are 9,934 Ghidra intervals /4,992,805 bytes and 19,216 complement intervals /2,273,044 bytes. These have exact selectors/output commitments in the proof; individual producer/consumer and incoming-flow questions remain open.

### Classified U01 interval: ordinary upgrade magnitudes

`Q41-U01-upgrade-magnitude-145840d78` selects the exact 428-byte declared
residual `[0x145840d78,0x145840f24)`. The
[bounded proof](evidence/0.113.2/q41-u01/report.md) recovers its five-lane
relative jump table, scalar/cap arithmetic, rarity bounds and observed incoming
references. The source already connects the matching magnitude helper to
eligibility, application and descriptions; no source mismatch is established.
Original-instruction replay passes 1,050 magnitude and fifteen bounds cases.
Ghidra still owns only the 24-byte dispatch head, so this semantic classification
does not replace the census, remove residual bytes or close AS alias/source/
producer recovery. Other U01 intervals remain actionable.

### Classified U04 interval: inter-function trap fill

`Q41-U04-trap-fill-145807d86` selects the exact residual
`[0x145807d86,0x145807d90)` in `.text`, RVA `[0x5807d86,0x5807d90)`,
file offset `0x5807186`. The [compact proof](evidence/0.113.2/u04-trap-fill.json)
retains its ten `CC` bytes, selector/input commitments and fresh REA/Ghidra
Evidence IDs. Its original parent region is `mixed_or_other`: that larger
region also contains the separately decoded jump thunk. The original category
and every census/selector count remain unchanged.

The preceding observed body ends with `RET` at `0x145807d85`; the next body is
the five-byte thunk at `0x145807d90` jumping to `0x145bb9b80`. Fresh bounded
Ghidra queries find no containing body at either end of the selected residual
and no reference to any of its ten addresses in the three-entry seeded Program.
Reference/Data Reference analyzers are disabled in that fresh bounded profile;
its empty xref results do not replace broader reference discovery.
The expanded census's 3,919,777
reference records and both encoded-reference SQLite inventories independently
contain no incoming reference. Exact target bytes and Capstone decoding confirm
ten one-byte `INT3` instructions. The full U04 selector was independently
reproduced; the selected row is 315,463 of 332,690.

This supports an **inferred inter-function trap-fill pattern**, retained as
supporting binary-layout context. `INT3` is executable; absent static references
cannot prove absence of computed/dynamic entry. The adjacent `fonts.rs` diagnostic
correspondence establishes neither a live font contract nor ownership of these
bytes. No missing AS source consumer or gameplay defect is established, so this
branch stops without engine reconstruction or an application-source change.
Reopen this exact classification if an actual incoming edge, encoded producer
or contradictory byte/body observation is recovered. Other U04 intervals and
the parent #41 semantic/source/alias work remain actionable.

`python3 -B scripts/check-u04-trap-fill.py` replays the bounded proof
using the installed target, retained inventories and original probe responses;
it does not start Ghidra. Use the existing Capstone environment. Reproducing the
fresh probe uses the proof's seed rows and retained `rea.plan` with
`scripts/rea-batch.py`, selecting a fresh project-local output directory.
Different paths/profiles produce new Evidence commitments; preserve the original
probe's digest rather than relabeling a replay. No build, game or parity check ran.

### Classified O01/F01/F02/A01 chain: Options storage setter

`Q41-O01-options-resource-1401a6bcc` and `-1401a6ba0` are diagnostic-code
seeds from the expanded `M02` input, now classified as the string/boolean
Options arms' missing-World-resource failure tails. The
[Options flow proof](evidence/0.113.2/q41-options-flow/report.md) retains exact
input/selector rows and fresh Ghidra evidence; both remain outside any actual
function body. The same setter's `F01`/`F02` jump `0x1401a67d7` reads a tag
from one of 105 immutable 152-byte descriptors after an unsigned index bound.
All tags are 0..3 and the relative table at `0x145eef5a8` supplies four exact
targets. This bounded `M01` producer proof does not add an applied guard,
relax table admission or close arbitrary-memory alias questions.

The `A01` LEA at `0x1401a6904` forms `0x140149550`, whose first consumer is
an input pointer/length formatting argument record. Its 18-byte adapter
forwards to the existing string Debug interface. All descriptor storage tags
and keys match source; no source omission is demonstrated. The checker passes
116 original-instruction cases. Generic World/panic/formatting reconstruction
is outside the AS boundary; exact runtime resource identity/aliases, source
execution and original/rebuilt parity remain open. All original O01, F01/F02,
A01 and M01/M02 counts/selectors are preserved; other members remain actionable.

## Flow, address and data leads

These groups have exact selectors, but AS ownership remains **unestablished**.
They are **actionable for bounded classification**, not proof that a missing AS
implementation exists. Sources/systems must be established from actual current
references; no owner is inferred from a numeric address or import name.

| Lead | Observed set | Next static action and completion evidence |
| --- | --- | --- |
| `Q41-F01` (`-call`, `-jump`) | 70,681 computed-call and 140,058 computed-jump Ghidra sites. The exact `-jump-with-applied-guard` and `-jump-without-applied-guard` selectors partition the latter into 2,532 and 137,526 sites, with zero expected-site exceptions. These are opcode populations, not counts of wholly unresolved behavior. | Select an AS-linked site, query its exact containing body and target-producing instructions; establish a guarded table, finite callback/value producer or explicit unresolved alias. Retain case/default bounds, targets and consumer. An unguarded guessed destination is not admission evidence. |
| `Q41-F02` (`-call`, `-jump`, `-complement`) | Linear encoded leads: 72,276 indirect calls /10,292 indirect jumps. Complement: 647 indirect jumps. | Compare one exact instruction/operand against `F01`, then trace its slot/register producer. A static slot address is not the runtime callee. Differences between decoder/path populations remain visible; do not sum these with `F01`. |
| `Q41-A01` (`-linear`, `-complement`) | 482,738 linear and 1,396 complement address-formation records. | Query one AS-linked formed address and its first live consumer; determine data versus code/callback and preserve exact producer/consumer bytes. Address formation alone establishes neither function entry nor dispatch. |
| `Q41-A02` | 524,805 relocated code-pointer slots, 135,406 distinct encoded targets: 524,771 entry slots and 34 body-interior slots; zero targets/slots lack an observed body. Static body-membership accounting is complete, while callback type, mutable slot values and dynamic use remain unproved. | Inspect one slot and its references/adjacent record layout; establish callback/table identity and bounds before expanding a code seed. Even an owned target leaves slot type and dynamic use unresolved. |
| `Q41-A03` | Remaining 109,224 nonpadding relocation records whose encoded target is outside executable virtual sections. | Query one AS-linked slot's data references and record boundaries; recover the actual data/ID relationship or classify supporting context. Together `A02 + A03` retain all 634,029 nonpadding relocation records. |
| `Q41-O02` | 789,223 exported references whose source lies outside an actual native body. | Query one source's section/type and destination references. Establish whether it is data/metadata or executable code before seeking a native owner. These are reference records, **not 789,223 ownerless instructions**. |
| `Q41-D01` (plus `Q41-D02`) | 531,765 default-space reference records target memory without a native body. Its read/write subset is 174,560 records to 50,209 distinct targets, 143,010 reader pairs and 569 writer pairs. | For one AS-linked target, query current readers/writers and the relevant value/ID consumer. Completion needs typed layout/value/lifetime evidence and the connected source boundary. A data destination normally has no function body; these counts do not demonstrate missing functions or all aliases. |
| `Q41-D03` | All 2,095 embedded candidates: 921 namespace/type, 343 game binding, 336 UI registration, 303 resource, 185 Lua declaration, 5 save/config key and 2 textual ID-assignment leads. Textual-numeric-ID regex returned zero. | Query one candidate's exact bytes and references and trace its registration/decoder/consumer. Establish AS versus engine/co-op and the concrete ID/resource/state contract. Text matches and zero regex hits do not establish semantic coverage. |
| `Q41-E01` | **Classified supporting platform context:** 425 PE import slots with library/symbol names. | Preserve names/slot identities. Follow a call only when a selected AS contract needs its inputs/output boundary; stop generic external-library implementation recovery. Runtime slot overwrites and callee implementation remain unproved. |

### Complete F01/F02 instruction-role classification

The [computed-flow audit](computed-flows-0.113.2.md) checks every original F01/F02 record against the current image. F01 contains 70,459 actual indirect calls, 11,516 actual indirect jumps and 128,764 traps (219 INT, three INT3, 128,542 UD2). Original selector counts and guard partitions remain unchanged. The current straight-line candidate pass records 2,551 encoded import/native candidates and 79,424 register/index/slot residuals; those are candidate boundaries, not counts of wholly unknown behavior. All independent decoder intersections/differences remain exact and overlapping. AS semantics, dynamic callee/type identities and complete M03 source/alias closure remain open.

### Classified A01/U02/O01/M02 subset: newly exposed fixed-address entries

The [complete current fixed-operand audit and selected leaf proof](address-leaves-0.113.2.md) retains487,437 address expressions and174,748 fixed memory operands from all22,663,778 verified instructions. All19 previously unobserved destination candidates and20 forming operands now have fresh scoped Ghidra observations and bounded support-interface classifications. Their AS/type/dynamic identity is not established; no engine implementation or census-population reduction follows. Other fixed and register-dependent producer/consumer questions and complete M03 semantics remain open.

### Classified D03 subset: all five save/configuration string leads

The [five-lead proof](save-key-leads-0.113.2.md) binds every original candidate: two talentxp occurrences are paired XP-result message type/consumer constants, not save keys; the two config.toml literals serve current legacy migration and shared CVar reader/writer paths; characters.txt follows the AS save override/default path. Exact byte/operand and fresh code-only observations preserve body/alias limits. No additional source omission, new save family or change to original D03 populations is established. Other candidate classes and full semantic/source/parity questions remain open.

### Classified D01/D02 target: Options binding-header title

`Q41-D01-D02-binding-title-145eee140` selects the 17-byte immutable title
and exact `READ` at `0x1401a8163` in mapper `0x1401a8020`. The
[binding-label proof](evidence/0.113.2/q41-data-bindings/report.md) traces the
48-byte header/command row, exact `AZS`/`AZS_OPENLEVELS` normalization,
allocation/publication/free ownership and actual Options snapshot consumer.
The source now preserves “Azeroth Survivors” for exact `HEADER_AZS` after live
VM snapshots, retaining ordinary labels and the engine cache observation.
Thirty-seven original-instruction cases pass; the authored Rust integration
regression remains uncompiled/unrun. The complete exported reference scan finds
one selected reader and no writer, which does not prove whole dynamic alias
closure. Original D01/D02 selectors/counts remain unchanged; other targets,
source execution and original/rebuilt parity remain open under #17/#21/#41.

### Classified A02/A03/O02 relations: Armory text and metadata

`Q41-A02-armory-line-display-145ed7700` selects the relocated String display
method used by the `item.equip` argument named `line`. The
[Armory relation proof](evidence/0.113.2/q41-pointer-relations/report.md)
traces construction, named-placeholder selection, table offset 24 and the
existing string-formatting interface. Its independent
`Q41-A03-armory-location-145ed76d0` relocation points to the filename within
an Options-independent Armory Location record (1650:19), not code.
`Q41-O02-armory-runtime-function-1481fa240` and the companion unwind edge
originate in a `.pdata` runtime-function record; absent native-body ownership
of those data addresses is expected, not an orphan instruction.

Ten original-instruction cases cover argument construction and display/drop
ABI transfers. Existing `armory.rs` already connects `item.equip` and its
`{line}` value; no source repair is demonstrated. Canonical older filename
bytes are reused without another extract. Neither metadata nor the enclosing
unwind extent becomes an executable caller/body claim. Complete formatting,
index-flow/alias ownership, source execution and rendered parity remain open;
all original A02/A03/O02 selectors/counts stay unchanged and other members
remain actionable under #41.

## Diagnostic and profile leads

| Lead | Observed set / state | Next static action and completion evidence |
| --- | --- | --- |
| `Q41-C01` | **All 57 local site roles classified; successful-contract/alias work remains open.** Original 57 body-ownerless verified sites across 13 paths, excluding co-op logic; exact partitions remain in the proof. | The [Armory slot proof](evidence/0.113.2/q41-c01/report.md) classifies `0x140147b9d` as the slot-selection bounds failure, reached through the recovered action-table lane. Existing valid-slot source matches; 59 native cases pass. The [upgrade-constructor proof](evidence/0.113.2/q41-c01-upgrade-constructor/report.md) additionally classifies `0x14596b868` as a learned-instance index bounds failure; 105 native cases match the connected source. FunctionManager still omits both selected cases, so original ownerless counts remain unchanged. The [all-site role proof](custom-diagnostic-roles-0.113.2.md) now partitions every original site: thirty bounds, twenty-one formatted failures, one missing-key, one Option failure, two stable-vector interfaces and two adjacent `spell` literals. This does not recover every successful containing contract or assign function ownership; retain those exact producer/consumer/alias questions before source work. |
| `Q41-C02` | **Classified supporting engine/other-crate diagnostic context:** 1,696 ownerless sites across 53 paths. | Preserve the exact selector. Follow only a necessary edge from a selected AS contract; no generic engine-completeness branch. A diagnostic path does not attribute every instruction of an enclosing function. |
| `Q41-C03` | **Excluded co-op logic:** zero remaining ownerless diagnostic sites in this profile; the earlier six now have body owners. Parents #41/#63. Body discovery establishes no cooperative behavior. | Retain inventory and stop the branch. No multiplayer backend/routing/transport implementation. Separately selectable co-op UI presentation is not blanket authorization for logic recovery. |
| `Q41-C04` | **Actionable classification input:** 161 diagnostic paths have no verified instruction references; all are engine/other-crate context. | When required by a selected AS dependency, query the exact path occurrence/location-record references and publish coherent instruction/body ownership. Otherwise retain as supporting context. Absence of a verified reference does not mean unused code. |
| `Q41-P01` | **Selected external and AS alias boundaries classified:** original 245 selected-owner unresolved-call records; 244 name 21 static targets, 1 has no static in-image target owner. | The [current producer proof](evidence/0.113.2/q41-p01/report.md) traces `0x1400b718f` (`CALL [R12]`) through its acquisition resource to the loader-resolved `XInputGetState` slot. Existing source matches this bounded boundary; no source defect is established. The actual external address, aliases/ECS ownership and runtime/parity remain unverified. The [aura-alias proof](evidence/0.113.2/q41-p01-aura/report.md) separately recovers the two selected alias calls, kind/index producer and real field consumer through 1,096 native cases matching source. The [four-interface proof](p01-call-interfaces-0.113.2.md) further classifies ten original records through153 native cases: the observed Pad RGBA copy, shared big-unsigned power/modulus boundary, counter-storage release and five configuration tag-gate/method-slot forwards. Concrete payload/type/method identities remain unclassified. Preserve all original counts, remaining semantic work and local-auth versus excluded-party context; do not add this population to `F01`. |

Two concrete selections from these exact populations, retaining classified results, are:

- `Q41-C01-markers-14017c9a2`: **bounded contract classified**, with [6,145 native lookup cases](custom-diagnostic-roles-0.113.2.md). This is the renderer's generated-mask key4 lookup: empty-map and exhausted-probe paths reach the selected missing-key failure. The actual source counterpart is `gameplay/raid_markers.rs` and its eight generated masks, not a newly recovered raid action. The source already supplies key4. Ghidra still has no actual body owner for the selected site; full handles/geometry/lifetime/alias and runtime/parity obligations remain open.
- `Q41-P01-language-14004fa5f`: **bounded contract classified and source data repaired** by the [current language proof](locale-catalogs-0.113.2.md). Fresh Ghidra connects the persistent index producer, immutable fourteen-row/56-byte table, clamped getter and actual language-list record consumer. All 65,800 native index cases and 40,922 source values pass. The source catalogs now include all 81 previously absent keys per language. Full virtual-resource lifetime, arbitrary mutable aliases, other localization dependencies, source execution and parity remain open; original P01 counts/selectors are unchanged.

These two bounded classifications establish their recorded static interfaces;
neither establishes full containing-system behavior or a new defect beyond the
locale data repair. Source execution, actual UI/rendering and controlled
original/rebuilt comparison remain separate; no build/runtime result is implied.

`C01 + C02 + C03 = 1,753 ownerless verified sites /66 paths`.
The custom subtotal is 57 sites /13 paths: armory 5, markers 1, options 9,
rewards 3, content 14, fonts 1, abilities 7, auras 2, enemy 7, hazards 2,
talents 1, upgrades 1 and navigation 4. These are exact residuals of the
expanded profile. The selected Armory Location
site `0x140147b9d` inside declared extent `[0x140147060,0x140147bc4)` is now
[classified](evidence/0.113.2/q41-c01/report.md): action discriminant 7 selects
table lane 5, valid slots read the worn snapshot and update focused/selected
state, and indices at least 19 reach the bounds diagnostic at native line
1845:28. This is an AS input contract with a matching existing source path.
The computed dispatch still prevents actual Ghidra body ownership; neither this
one-site classification nor the source correspondence closes #17/#41.

### Classified C01 site: upgrade choice learned-instance index

`Q41-C01-upgrade-constructor-14596b868` selects the current `upgrades.rs:348:47`
Location at `0x14730e150`. The [bounded proof](evidence/0.113.2/q41-c01-upgrade-constructor/report.md)
traces weighted candidate index publication, the 32-byte cursor copy and the
constructor's selector-1 lane. Valid indices address `Game[+0x330]+index*0x58`;
indices at least `Game+0x338` reach the exact bounds diagnostic. Existing
`Candidate::Upgrade(index)` enumeration, instance lookup and overlay consumer
match this contract. The 105 native cases pass without reconstructed Rust.
The selected site remains outside the actual 177-byte Ghidra body; complete
collector/RNG/publication behavior, aliases and all original residual counts
remain open. No application source change is justified by this classification.

### Classified P01 calls: provenance-name aura aliases

`Q41-P01-aura-alias-14580b380` selects calls `0x1458f365b/0x1458f369f`.
The [current proof](evidence/0.113.2/q41-p01-aura/report.md) recovers exact
English provenance name/kind-to-spell mapping, its typed index producer and an
additional call in the real field publisher. Existing source matches 1,035 alias,
12 publisher-prefix and 49 index/kind cases. The retained 244-record/21-target
routing separates exact import boundaries, shared runtime candidates, local
configuration/auth context, other AS leads and excluded party logic; these
routing labels do not certify every callee's semantics. Original call counts,
complete descriptor/publication behavior, aliases and runtime/parity stay open.

### Classified P01 AS connection: zone-key fallback and guardian damage

`Q41-P01-zone-key-145808880` now has a [current contract](zone-key-guardian-damage-0.113.2.md).
The exact-key parser defaults every unknown input to row0, the canonical getter
selects its240-byte definition, and the local accessor preserves raw key text.
The complete selected guardian-damage caller agrees with existing f32 source
order across all148 enemies. All12 zone map/area/spawn/scale inputs match.
The runtime/API fallback mismatch is repaired under **#66**, connecting the same
resolved key to admission, roster and mechanics without changing save rules.
Normal picker/loading paths already normalize keys; no ordinary session failure
was reproduced. The proof passes65,536 two-byte cases,12,329 mutations,2,072
damage and24 bounds cases. Native powf is intercepted, Rust tests are unrun,
and full health/AI/type/alias/source execution/parity remain open. This accounts
for the selected P01 key-parser call without changing any original count.

### Classified M03 AS connection: Creature query metadata

`Q41-M03-creature-query-1458646d0` follows the current incoming handler's
opcode0x60 to template selection, localized name/subname producers, hit/miss
serializers and the existing client cache. The [current contract](creature-queries-0.113.2.md)
identifies a dropped local request and repairs its complete 246-template source
path under new permanent finding #64. All 65,536 u16 entries, 3,690 locale/raw
fallback cases, five u32 boundaries and 80 payload cases pass bounded native
replay and source checks. Actual source/event/cache/UI execution and parity remain
unverified. This establishes one AS producer/consumer connection; no original
census/selector count or global semantic/alias completeness claim changes.

### Classified M03 AS connection: template wire responses

`Q41-M03-template-wire-1458d58f0` follows the current GameObject name getter and
serializer from the existing incoming query branch, revalidating all entry,
name/type/display and zero-data selectors. The [wire contract](template-query-wire-0.113.2.md)
repairs direct typed-event bypass of the existing client packet decoder under
new permanent finding #65, shared with the recovered Creature producer (#64).
The 65,536 entry, 270 language/raw-fallback, four u32 boundary, 80 payload and
21 exact wire-fixture cases retain explicit native-instruction/service seams and
unrun Rust/actual-client limits. Native client-parser equivalence and arbitrary
aliases remain unverified; no original census/selector count changes.

### Classified M03 AS connection: inventory refusal delivery

`Q41-M03-inventory-refusal-1458646d0` follows five current local inventory
commands to their exact refusal serializer and the existing client error/unlock
consumer. The [contract](inventory-refusals-0.113.2.md) repairs dropped request
responses under **#67**. All327,680 first/second-byte projections,2,565 exact
wire cases and80 source fixtures pass native replay/source guards. Only the
selected local branches execute; no co-op/server/transport is implemented.
Rust tests are authored/unrun; actual locks/error timing, complete protocol,
native client-parser/alias equivalence and original/rebuilt parity remain open.
The original census/queue counts stay unchanged.

### Classified M03 AS connection: local opcode domain and desktop capability

`Q41-M03-local-dispatch-1458646d0` now has a [current prefix/capability proof](local-dispatch-0.113.2.md).
All65,536 opcodes across eight synthetic local-channel profiles yield43 downstream
boundary candidates and65,493 defaults with no host/payload access. This is an
exact subset inventory, not complete semantics for those43 handlers or a global
M03 count. The current desktop vtable slot+40 returns false into Game+bfe;
771 choice/result guard cases suppress alternative Gossip. Existing custom
overlays remain the desktop path. Source names/cache/control counterparts and
platform/transport/excluded nonlocal contexts are kept distinct; no additional
source defect is established. Arbitrary callback identity, full downstream
handlers, aliases, scheduling and runtime/parity remain open. Original selectors
and census populations are unchanged.

### Classified M03 AS connection: local player-name queries

`Q41-M03-name-query-1458646d0` now has a [current native/source contract](name-queries-0.113.2.md). Ordinary local opcode0x50 uses the retained character even without Game, echoes arbitrary requested GUIDs and emits its exact0x51 wire response. The previously dropped source request is repaired under **#68**, reaching the existing packet decoder/name cache. The 2,236 bounded native cases and 28 fixtures do not execute reconstructed Rust or certify snapshot/cache timing, arbitrary aliases or parity. Original selector/census counts remain unchanged. Nonlocal lookup is excluded.

### Classified M03 AS connection: local wall-clock query

`Q41-M03-clock-query-1458646d0` has a [current native/source contract](clock-queries-0.113.2.md). Local opcode0x1ce samples the existing host-time interface, converts to whole Unix seconds and delivers the exact four-byte0x1cf response independently of Game/character state. The dropped source request is repaired under **#69**, reaching existing clock and Lua sync consumers. The 131,117 bounded native cases/fourteen fixtures intercept actual OS-time acquisition and leave Rust, Windows API, scheduling and original/rebuilt parity unverified. No generic platform/time or multiplayer reconstruction; original selector/census counts remain unchanged.

### Classified M03 AS connection: stateless local request lifetimes

`Q41-M03-local-request-lifetimes-1458646d0` follows metadata, inventory refusal
and cast-response branches across both optional-Game states. The [current
contract](local-request-lifetimes-0.113.2.md), #70, repairs the common source
admission gate to use actual local-channel activation. Cache-use gameplay keeps
its mechanics/readiness checks. The 396,072 bounded native cases retain explicit
cast-constructor/postresponse seams; source tests, scheduling/client behavior and
original/rebuilt parity remain unverified. No original selector/census count changes.

### Classified S01/M03 contract: corrected player report and run start

The [current movement-entry proof](movement-entry-0.113.2.md) traces local dispatch, floor/correction admission and the converged final-position/start tail. It repairs the missing source start check after a corrected report under #38, with858 bounded native cases. Existing native floor and Begin internals are reused at explicit seams; complete AS/type/alias and runtime/parity obligations remain open. Original census populations are unchanged.

### Classified R01/D03 candidates: AS widget resource URIs

The [current resource proof](as-resource-paths-0.113.2.md) traces original
`resource_path:0..5` from partial `//` literals to complete `mpq://` producers,
AS load/handle consumers and eight available BLP2 members (including both paired
left arrows). Six producer cases/two rotation bounds cases and eight fresh Ghidra
observations supplement the reused current race/meter proofs. No source omission
is established for these paths. All original303 rows/statuses remain; the other
297 candidates, native loader/alias semantics and actual source/rendering/parity
are not certified. No generic engine reconstruction or binary asset delivery.

## Expanded inputs and missing semantic inventory

### Classified B02/R01/D01–D03 data: font supply and registration

The [current font proof](font-inputs-0.113.2.md) validates ten embedded SFNT
payloads: nine AS supply inputs and one byte-identical Bevy default-font
counterpart. It connects the three base records, strict CJK cache/miss provider
and three-insert autonym prefix to current callers through 43 native control
cases and eight fresh Ghidra observations. All 49 source glyph-table rows match.
The setup link now documents all nine supplied filenames, including both
Japanese inputs. Full augmentation is an explicit intercepted result boundary;
font output/shaping/rendering, dynamic aliases and other resource contracts remain
open. No binary font, generic engine reconstruction or census-count change.

`M01` and `M02` now have exact available outputs. They remain eligible inputs
for bounded classification, rather than completed semantic reconstruction.
Only `M03` lacks its requested exact downstream inventory; its count is
**unknown**, not zero. Prior profile commitments remain available separately.

| Lead | Available evidence or missing output / next static action | Completion evidence |
| --- | --- | --- |
| `Q41-M01` | **Available; one bounded AS candidate classified.** The applied proof admits 2,532 guarded tables /16,599 distinct case edges and retains 205 rejected scalar-domain candidates. The [jewelry-cap proof](evidence/0.113.2/q41-m01-jewelry/report.md) recovers `0x14583fa56`'s tag producer, unsigned bounds and complete tables; 256 dispatch and 1,120 full-leaf cases match source. Original rejected/ownership counts remain unchanged. Select another AS-linked `F01` site or exact `candidate_tables[]` record. | Recover the selected producer, bounds, table bytes and coherent targets without relaxing existing boundary/conflict checks. Applied fallthrough proof does not establish every incoming caller context. No generic table-count expansion is a gameplay repair. |
| `Q41-M02` | **Available.** The complete 421,704-entry plus 24,184 code-only queue applies complement/pointer, 1,881 diagnostic-code, 8,050 address-code, two import-thunk and 28 metadata-entry inputs. All requested operations completed; every code-only seed decoded. Select one exact `O01`/`C01` site and its input provenance before further recovery. | Retain target bytes, exact input/plan/tool digests and actual body/flow results. Classification still needs AS/engine/co-op ownership and the live contract; available decoding does not provide it. |
| `Q41-M03` | **Missing exact inventory.** Complete current semantic/source/alias and missing-producer/consumer residual classification. The selected card-input subset below now has current producer/consumer and source proof; other subsets remain unclassified. Use current system/report evidence and `classify-native-ownership.py` for a selected AS-linked subset; historical classifier output or source membership cannot supply current semantic proof. | Current site/range IDs, contract/source/value/consumer evidence, exclusions, unresolved aliases and durable residual selectors/counts. The exact global number of unrevalidated contracts or missing AS consumers remains unavailable. |

### Classified M01 candidate: jewelry increment caps

`Q41-M01-jewelry-cap-14583fa56` reads a definition tag at `+0x44`.
Its unsigned `tag > 19` rejection, twenty-entry table at `0x147014f3c`,
Soulstone bypass and secondary multiplier table are [recovered](evidence/0.113.2/q41-m01-jewelry/report.md).
All five targets decode, but four remain outside FunctionManager ownership.
The existing increment helper reaches offer descriptions, acceptance and effects;
1,376 bounded original-instruction cases match source. The selected original
candidate remains in its 205-row rejected inventory; this classification does
not certify every catalog record, caller alias, body edge or #34/#41 parity.

Current bounded AS state work is recorded separately in
[continuation](as-state-contracts-0.113.2.md), [step timing](as-state-step-0.113.2.md),
[delayed visuals](as-delayed-visuals-0.113.2.md) and
[collection/instance contracts](as-state-collections-0.113.2.md).
Those reports retain their concrete repairs, exercised boundaries and alias/
shared-interface limits. They do not close `M03` or certify a complete custom
protocol enum, native resource lifetime graph or unseen-writer closure.

### Classified S01/M03 contract: local card input and delivery

`Q41-S01-card-input-1400b3420` / `Q41-M03-card-input` selects the complete
921-byte keyboard handler and its necessary capture/local-delivery interfaces.
The [input proof](evidence/0.113.2/card-keyboard/report.md) binds the typing getter,
snapshot publisher, exact TypeId/map/initializer-to-consumer identity, all nine
native key names, 0.45-second opening and independent 0.32-second exit gates.
The [delivery proof](evidence/0.113.2/card-delivery/report.md) binds command append,
ordered 232-byte iteration and actual Select/Reroll consumer lanes. Source now
admits Digit/Numpad aliases, selects the lowest index before R from one snapshot,
and applies transactions once before visual exit. Pointer actions retain their
native collection order; typing suppresses keys without suppressing clicks.
Retired runs remove retained cards even during loading.

The 6,410 keyboard/name/gate cases and 269 queue/cursor/dispatch cases pass;
updated existing pointer/renewal checks pass separately. Authored Rust tests are
uncompiled/unrun. Same-valid-World typing resource identity is established;
arbitrary registry mutation, virtual UI resource lifetime, full native/global
scheduling and actual chat/device/source/rendered behavior remain separate.
No further concrete source omission is identified in this selected contract.
Global semantic/alias inventories and their unknown counts remain unavailable;
no census or original selector count changes and #41 stays open.

## Reproduction and validation limits

The portable [derivation tool](../../scripts/summarize-unknown-recovery.py)
is bound by path/SHA-256 in the proof. It uses the configuration-selected target
and existing project-local inventories, with no decoder/Ghidra dependency:

```sh
python3 -B scripts/summarize-unknown-recovery.py
# After reviewing changed inventory inputs/selectors, update the compact proof:
python3 -B scripts/summarize-unknown-recovery.py --write
```

Default operation follows the retained proof's selected census, validates its target,
plan/start/profile and input commitments, and verifies the complete proof by
replaying the existing 22.7-million-row stream and references. It does not start
Ghidra. An explicit selection is required when publishing a different census:

```sh
python3 -B scripts/summarize-unknown-recovery.py \
  --census-summary docs/analysis/coverage/full-image-execheck.json --write
```

The proof records each existing inventory's owning producer and regeneration
inputs through the corresponding current coverage summaries. Regenerating bulk
evidence is a separate selected investigation, not required merely to reuse this
unchanged queue. For selector replay, verify input digests first, apply the
specified SQL/CSV/JSON projection and order, and SHA-256 its UTF-8 JSONL arrays
with compact separators and one LF per row. Empty selections hash zero bytes;
`S01-full` deliberately hashes the original gzip artifact as an identity output.
`P01` verifies all 59 retained selected-procedure artifact hashes before joining
their unresolved calls to current bodies.

All selected instruction/reference streams and exact residual selectors were
read to derive and replay the proof; its count partitions reconcile. The owning
native census separately records the fresh whole-file/Ghidra work and independent
byte verification. Queue derivation performs no native execution. No compilation,
game launch or original/rebuilt comparison ran.
