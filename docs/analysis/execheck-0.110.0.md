# EXE sweep and rebuild connections — 0.110.0

**Historical target:** this report covers 0.110.0 only. [verification-needed](../verification-needed.md) owns the installed target and current limits.

Selected installed target: **0.110.0**, 140,523,520 bytes, SHA-256
`e069bf3152f8d8f7160d66388907fc181c733bd170aa150d3b7ff7adf251e048`.
[Identity/resources](target-refresh-0.110.0.json), [native census](native-census-0.110.0.md)
and [verification-needed](../verification-needed.md) own target identity, native limits and
permanent gaps. This static audit does not certify complete source recovery,
gameplay or parity.
The [sweep record](evidence/0.110.0/execheck-sweep.json) binds the completed
inventories, fresh pass, proof inputs, contract checks and retained observations.

## Whole-file and native evidence

The full PE/embedded-candidate scan reproduces six sections, 347,073 declared
unwind extents, 631,690 relocation sites, 420 imports, no exports and 725
diagnostic paths, including all 53 custom paths. All mapped sections, directory
records, debug metadata and embedded candidate classes are retained in the
hash-bound [inventory](evidence/0.110.0/native-summary.json). Candidate counts include
328 game-binding identifiers, 182 Lua function declarations, 336 Lua/UI
registrations, 906 module/type names and 303 resource paths. Packed literals and
address-shaped constants remain leads, not recovered behavior.

The diagnostic decoder reproduces 17,681 verified references across 5,945
candidate extents. The complete declared inventory revalidates every retained
extent's bytes and accounts for 23,029,153 instructions / 93,111,261 bytes.
The complement pass is freshly traced and partitions all 5,076,673 executable
bytes outside declared extents. Retained linear decoding and fresh Ghidra flow
decoding are separate evidence.

REA's PE resource parser examines all 18 resource directory entries and eight
payloads: seven RT_ICON images and one RT_GROUP_ICON, language 1033. All seven
group references resolve to matching-size payloads. Opaque image payloads,
language fallback and actual shell/window rendering were not exercised.

The fresh [full-image Ghidra pass](evidence/0.110.0/execheck-census.json) completes
with **22,455,629 independently verified instructions / 89,873,547 bytes**,
420,612 functions, 473,918 body ranges and 3,888,726 Program references. All
418,184 requested function starts and 29,355 supplemental code starts decode;
every requested body is repaired and all 2,356 observed direct-call helper
targets have final owners. Source ownership remains separate: 5,139 call-source
sites and 782,348 Program references have no containing native body. All
instruction bytes/boundaries, seed commitments,
applied proof inputs and exported artifacts are independently checked.

The current input proofs admit 3,370 guarded tables / 21,820 edges, 1,874 exact
diagnostic candidates, two import-thunk entries, 28 metadata entries and 5,952
address-code candidates. Overlaps with function starts reduce the additional
diagnostic/address queues to 1,873/5,950. The preceding operand audit checks all
21,983,926 integrated-parent instructions and retains 637,488 explicit operands.
These proofs preserve the original input producers separately from current
launch tools; no old analysis is relabeled.

The expanded instruction union still excludes **8,314,387 executable bytes**,
including 4,854,557 mixed/unclassified bytes. Padding candidates are not proved
noncode. Computed flow, full current operand/alias/source classification and
custom producer/state/consumer semantics remain **#41**. The historical atomic
selection remains preserved; this wider current census is not a whole-system
or parity certificate.

## Contracts and actionable follow-ups

The existing current-target ground/navigation checker passes **164 bounded
instruction cases and twelve boundary shapes**. The ordinary weapons/pets
checker passes **736 cases**, all five descriptors and all five grant arrays.
These check native instructions/data and inspected source connections; they do
not compile or execute reconstructed Rust. Older address-bound checkers retain
their actual targets and were not replayed against this EXE.

The [current lead record](evidence/0.110.0/execheck-contract-leads.json) reuses
canonical extracts and supplies precise ranges, hashes, source witnesses and
finite probe inputs for the following two existing issues.

The additional addon reference is on the branch for
`SurvivorsDragonUi PR #30`:
`SUMMONS-API.md`,
`PET-FRAMES.md`
and the supplied October 22 API text. The receipt date does not identify a game
version. Its roster/getter description agrees with the selected EXE Lua: eight
raw fields (`id,entry,key,kind,ends,dur,icon,name`), exact key-or-kind filtering,
run-clock remaining time, explicit permanence, and key-grouped counts/earliest
temporary expiry. The parser replaces the roster and stamps `AZS_PETS_UPDATED`;
the getter itself neither phase-gates nor removes zero-remaining rows. Consumer
cleanup policy and documented publication/ID promises remain separate from
recovered native producer behavior. Per-summon health, unit tokens and per-hit
ownership are outside this roster contract.

| Gap | Current evidence and source connection | Next static recovery | Separate validation |
| --- | --- | --- | --- |
| #11 — addon summons | The current embedded 14,541-byte API chunk contains `AZS_GetSummons`, `AZS_GetSummonCount`, `AZS_GetSummonGroups`, `AZS_PETS` and `AZSPETS`. The actually embedded historical API and inspected production source/assets lack these names. `addon_bootstrap.rs` still installs the historical API. | Follow verified LEA `0x1458aca3a` to the standalone `AZSPETS` literal at `0x146c01622` (declared candidate extent `0x1458aa0c0..0x1458ad20d`). Recover the complete current chunk and native summon snapshot producer, payload/schema, cache/event/reset/ReloadUI lifetimes; connect them through the existing addon feed. Literal presence alone does not prove the entire producer contract. | Compile the resulting repair, exercise real Lua/client/addon lifetimes and compare original/rebuilt behavior. |
| #24 — special-demon cadence | Helper `0x145954780` reads descriptor period and, for special values other than 0/7, multiplies it by `Game+0x490` before a 0.5-second floor. Eight synthetic special1/5 probes visit 34 instruction addresses. Retained `run_effects/demons.rs::attack_interval` uses the older haste/recovery/execute formula; its live caller supplies aura10 haste. With synthetic special1, period 2, cooldown 0.5, zero aura10 haste and no selected target, the native helper returns 1 second while the retained scalar formula gives 2. | Recover current descriptors, all helper callers and cooldown/aura producers, including the distinct special7 path, before replacing the connected source formula. These probes do not execute Rust or recover the complete demon clock. | Compile a later repair, then compare real army cadence, buffs, targeting and presentation. |
| #12/#24 — talents and army | All new Demonology release claims remain pending current-target recovery. Historical talent/lifecycle integration is retained. | Follow current talent records, summon effects, limits, Supremacy, Empowerment/Medallion and their actual consumers. | Save/spec/upgrade and full-run comparisons remain separate. |
| #42/#43 — raids | Tower removals in the supplied 0.109.1 notes require current action-graph and presentation revalidation. The connected 493-node graph retains 0.109.0 provenance. | Recover current tables/recursive actions and verify every affected producer/consumer against current instruction bodies. | Compile and compare terrain, actors, markers and casts. |
| #17/#19/#34 — release changes | All 38 new 0.109.1/0.110.0 assessments have source/system/gap owners and remain pending. Menu scrolling, combat logging, Hunter equipment, achievements, appearances and translation claims have no whole-contract certification. | Use the individual [claim ledger](coverage/changelog.json) to recover current data and owning consumers; release prose is a lead. | Actual input, persistence, services, rendering and long-run account behavior require their own evidence. |
| #41 — ownership and discovery | Diagnostic/source correspondences, declared decoding and observed Ghidra bodies are distinct. Source paths do not establish complete producers/state/dispatch/consumer ownership. | Follow custom ownerless sites, scoped indirect targets, data readers/writers and relevant engine changes from the [connection map](evidence/0.110.0/exe-connections.json). Generic runtime internals and unclassified bytes alone are not new gameplay. | Current source execution, original behavior, ASLR/dynamic aliases and parity remain unverified. |

## Source, evidence and historical observations

All 54 system records (53 custom and one shared-engine residual) were reviewed.
All 666 registered source references exist. Of 138 source anchors, 137 carry a
line and now point to the current declaration; one is intentionally symbol-only.
Sixty-nine anchors changed, including two renamed functions. This repairs
navigation without refreshing historical contract hashes or certifying source
equivalence.

The current [machine connection map](evidence/0.110.0/exe-connections.json) records every
custom path's preferred PE body addresses, ownerless sites, source files,
bounded current evidence and permanent gaps. The previous
[0.109.0 map](evidence/0.109.0/exe-connections.json) remains immutable historical
evidence. Current contracts and shared diagnostic/census links are counted
separately. Historical asset hashes can describe intentional internal formats;
neither their age nor a byte match establishes a current source defect or a
revalidated semantic contract.

The current structural partition retains 663 Location-reference leads with
229 distinct body owners: 603 references have an owner and **60 remain
ownerless**. All 53 paths have at least one Location-derived body lead. Another
24 filename/literal candidates remain separate, including two without an owner.
Historical site-role exclusions are not applied to the new target; these counts
do not prove every site role or assign failure blocks to functions. Six systems
have directly registered bounded current contracts; 47 still need precise
current contract review. Neither count identifies complete or missing systems.

The connection inventory indexes 863 retained JSON documents: twelve have direct
current identities, 795 are historical and 56 need an owning manifest or review.
It also indexes 115 directly embedded assets, with one current identity, 72
historical identities and 42 undeclared identities. These are provenance counts,
not source-fitness or implementation verdicts.

The [historical range audit](evidence/0.110.0/historical-range-revalidation.json) checks
12,638 distinct commitments. Canonical bytes can be recovered for 8,141; 4,497
remain unavailable. Of the recovered sequences, 840 have a unique exact current
match, 3,770 are ambiguous and 3,531 are absent. Only three commitments match at
their old file offsets. Fifty unique sequences span complete observed native
bodies, but their callers/layouts/dependencies and behavior are not thereby
revalidated. Unmatched old addresses cannot be reused as current addresses.

The retained October 21 reconstructed launch already owns minimap, ChatFrame
and deferred-command observations under #44–#46. Its log additionally reports a
140-logical-pixel text request becoming 280 device pixels and being capped at
256. The current warning owner is `ui_text/engine/mod.rs::ppem`; the producing
widget and original-EXE behavior are unknown. This is retained rendering
validation work under **#39**, not a fresh reproduction or an attribution to
later source. The retained log is
`runtime/optimized-2026-10-21/game.log`, SHA-256
`0829603730726b24b5f72718476a5582e0b9da3176561405b8ef1048ad365802`, line 40.
Its audio limiter observations remain separately bounded by #5.

No new permanent issue number is required: #11/#24/#39/#41 cover the additional
leads; #12/#17 now explicitly distinguish their historical completed scopes
from current recovery. All 46 permanent numbers are preserved.

## Final consistency and validation

Historical-range generation completes against the fresh census. The connection
map's write/read reproduction and six tool regressions pass. The proof-helper
and connection/partition/history regression suites pass 56 distinct
noncompiling cases. Final installed identity checking verifies the same EXE
and all nine MPQs. `check-reconstruction-coverage.py` reports **zero errors**;
its 55 warnings retain the 54 open source scopes and absent current atomic
native selection. These are accounting checks, not semantic completion.

Compilation, compiling tests, either game, current source execution, Windows
and original/rebuilt comparisons were not run.
