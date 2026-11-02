# Native discovery census — 0.115.0

Target SHA-256: `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
[Target identity/review](target-0.115.0.md), [coverage](reconstruction-coverage.md),
[canonical unknown queue](unknown-recovery-0.115.0.md). **#41 remains open.**

## Complete file and linear inventories

The whole-file PE scan covers the complete 142,111,232-byte target: six sections,
350,712 declared unwind extents, 425 imports, 634,018 nonpadding relocations and
731 diagnostic paths (60 custom / 671 engine or other). The disjoint file ledger
assigns all bytes once across 26 intervals; it retains 1,054 raw alignment-tail
bytes and 1,024 header/stub/slack bytes. No file gap or trailer exists. Structural
classification is not semantic recovery or proof of padding.

The declared-extent linear pass completes every extent: **23,293,354 instruction
records / 94,182,550 union bytes**, zero undecoded suffix. It retains 72,316
indirect calls, 10,320 indirect jumps and every other encoded reference. This
is linear decoding from declared starts, not reachable-code or function ownership.

The complement pass accounts for all **5,131,048** other executable bytes across
330,329 intervals, with 2,678 unique seed addresses, 71,238 instruction candidates
and 307,839 decoded union bytes. Its disjoint residual partition retains 2,302,030
mixed bytes, 926,498 uniform CC candidates, 10,915 uniform NOP candidates and
1,583,766 canonical padding-sequence candidates. None is certified padding.
The exact SQL/JSON input commitments, ranges, transfer sites and reference sets
are retained in the [unknown selector proof](evidence/0.115.0/unknown-recovery.json).

Diagnostic decoding verifies all 60 custom paths among 17,790 overall reference
leads, decoding 5,991 candidate extents / 1,835,054 instructions. Those selected
byte totals overlap the linear pass and must not be added to it. Every discovered
custom path has a stable system ID, including the newly added `custom-game-banners`.
A diagnostic reference is a source-location lead, not complete semantic ownership.

## REA/Ghidra attempts and retained limits

The [compact attempt proof](evidence/0.115.0/native-attempts.json) records exact
profiles, heap/analyzer/seed commitments and project-local result paths:

| Profile | Observed result | Remaining work |
| --- | --- | --- |
| Default full-PE string search | 330-second startup timeout; no string-query result | Old dialog adjacency no longer identifies the target. Current updater plus mapped self-referencing version/platform descriptors establish identity structurally; no native updater behavior certified |
| Full-image no-address-tables | 180-second Ghidra startup timeout before procedure discovery | Procedure queue/body/reference inventory unavailable; no completed native operations |
| Full-image repaired diagnostic owners | 60 current paths selected; first instruction operation fails at 180-second startup deadline, one failed and 59 pending owners | Selected queue is caller asserted, not whole-image discovery. No completed instruction/reference query sets |
| Earlier disposable streaming profile | All 350,712 seeds committed, 6-GiB heap, auto-analysis disabled; decoded 274,432 entries before the 600-second startup deadline killed productive analysis | Superseded by the durable runner below; retain this failure's actual profile and target |

The earlier runner performed its census before REA's bridge became ready, so a
startup deadline covered the entire useful job. Its read-only, disposable project
was deleted on exit. External counters recorded progress but could not restore
the analyzed Program. This was a lifecycle/persistence failure, rather than a
failure to decode the first batch.

The replacement runner imports once into a project-local persistent Ghidra
Program. Each batch commits its mutations and cursor together; only after the
Program is saved does it publish the external progress journal. Restart trusts
that saved Program, validates the exact target/plan/tool hashes and resumes
after the last committed batch. The supervisor retries unexpected exits and genuine
no-progress timeouts, retains diagnostics and stops after three consecutive
attempts without useful advancement. Completed exports are atomically published
and hash checked. A project lock prevents concurrent writers. See [REA setup and
resume behavior](../REA.md) and the [real recovery proof](evidence/0.115.0/census-resume.json).

The recovery proof includes a clean batch stop/reopen, rejection of an optimistic
external "completed" journal, and an unexpected analysis-JVM termination followed
by automatic continuation without reimporting. These are static analysis tests;
the installed game was neither modified nor launched.

## Completed persistent declared-entry census

The [independently verified census](evidence/0.115.0/refresh-baseline/full-image-census.json) completes
the full installed PE's **350,712 declared entry seeds**, plus direct-call helper
closure. Every requested entry has instructions and a repaired actual flow body;
none is missing. Automatic analysis is disabled, with a 6-GiB heap. The persistent
runner's profile is `dcdb60b2ecbb77992bbea14c45047fb842d666b78022d8c89c02409897b8f8ad`.
Reopening the completed Program preserves generation 187 and reuses all five
verified exports without repeating batches.

| Observation | Verified result |
| --- | ---: |
| Exported instructions / exact source bytes | 21,869,183 / 87,271,206 |
| Native functions / actual body ranges | 353,069 / 409,650 |
| Static reference records / external locations | 3,766,641 / 425 |
| Direct-call helper targets / created helper functions | 2,366 / 2,351 |
| Requested seeds lacking instructions / functions | 0 / 0 |
| Ghidra computed calls / jumps | 67,824 / 134,835 |

Capstone 5.0.7 independently checks every exported instruction's exact installed
bytes and boundary. Actual body ranges are disjoint and are not replaced by
unwind extents. All export hashes, the plan, final progress/result and immutable
full summary are retained in the compact census. Helper ownership is audited
again after primary body repair: seven owners change, with no helper left
without a final owner. These counts describe this saved Program state.

The executable-byte partition retains **12,042,392 Ghidra-unobserved bytes**:
7,158,738 inside declared extents and 4,883,654 outside them, across 392,430 exact
ranges. `missing-declared-ranges.tsv.gz` and `missing-executable-ranges.tsv.gz`
retain boundaries, candidate kinds and byte hashes. Candidate NOP/CC and mixed
classes do not establish padding, reachability or semantic roles.

Of 3,766,641 static references, 2,991,312 have sources inside actual bodies and
775,329 outside. The observed call references have no ownerless source site or
destination; this does not resolve computed runtime destinations or aliases.
The diagnostic audit matches all 17,790 verified sites across 731 paths against
actual bodies: 1,885 sites across 81 paths lack an owner. Eighteen custom paths
have such sites, including 35 in `game/hazards.rs`; `coop/route.rs` is the sole
custom path with verified sites but no observed owner. Exact per-path counts,
the original diagnostic sites and the body/reference artifacts are bound by the
[unknown selector proof](evidence/0.115.0/unknown-recovery.json).

**Q41-G01 collection is complete; #41 remains open.** The separate
[current residual classification](native-residual-classification-0.115.0.md)
now retains complete explicit ownerless/site/destination, operand, stop and
range projections. All 21,869,183 exported instructions have body owners;
all 775,329 reference sources outside bodies are metadata. Diagnostic consumer
classification preserves 107 ownerless AS, six excluded custom and 1,772 shared
sites. All 788 custom records also have current bounded interface roles.
The independent computed-transfer proof checks every F01/F02 selector row.
These tools do not change saved Program observations or certify dynamic
aliases/types/IDs, successful AS producer/consumer closure or parity.

Current [banner recovery](banner-suppression-2026-10-23.md) connects the bounded
record/parser/helper, scoped-localization caller and update reader with five
producer traces and 74 native cases. Its shared callback/type identities and
actual sustained duplicate cause remain open; it does not certify a visibility
change, shared formatter closure or rendered parity.

## Expanded all-seed audit

The separate [expanded census](coverage/full-image-execheck-0.115.0.json)
uses the complete current seed queue and all five independently checked native
input proofs. The [input witness](evidence/0.115.0/execheck-native-inputs.json)
preserves the original declared census's producer/tool commitments alongside
the distinct current launch commitments. Changed repair/launcher hashes reject
resuming the original profile with current tools; its Program and canonical
selection are preserved. This expanded result does not replace its classifiers.

The new profile is
`66270ad4a97c9a2584303bec80892ea2dee6fe88e46196c9fe05f2ace107a6ab`.
It completes 422,071 requested entries and 24,207 additional code-only starts,
with 2,537 guarded tables / 16,624 applied edges. Every requested entry has an
instruction and actual repaired flow body; every additional code start has an
instruction. A reopen of the saved Program reuses all verified exports at
generation 863. Independent Capstone verification checks every exported
instruction's exact source bytes and boundary.

| Expanded observation | Verified result |
| --- | ---: |
| Exported instructions / exact source bytes | 22,690,396 / 90,817,086 |
| Native functions / actual body ranges | 424,537 / 479,497 |
| Static reference records / external locations | 3,925,504 / 425 |
| Direct-call helper targets / created helper functions | 2,400 / 2,385 |
| Requested seeds lacking instructions / functions | 0 / 0 |
| Ghidra computed calls / jumps | 70,717 / 140,121 |
| Unobserved executable bytes / exact ranges | 8,496,512 / 463,115 |

Unobserved bytes comprise 5,232,300 inside declared extents and 3,264,212
outside. Exact ranges, hashes and mixed/NOP/CC candidate classes remain in the
expanded summary's `independent_instructions` inventories. More decoded bytes
and seed bodies do not establish reachable code, padding or semantic recovery.

The expanded diagnostic projection verifies all 17,790 original sites as exact
exported instruction boundaries and bytes. Actual body ownership is independent:
1,756 sites remain ownerless, including sixty custom sites across fourteen paths.
The expanded reference population has 790,042 source records outside bodies and
5,155 call-source sites without body owners. Its complete residual projection
also retains 73,536 ownerless exported instructions and 5,128 distinct unowned
executable destinations. These differ from the canonical
sets and require the [matching residual proof](evidence/0.115.0/execheck-residuals.json)
and [exact site selectors](evidence/0.115.0/execheck-diagnostic-sites.json).
The ownerless source set preserves the exact 775,329 canonical DATA
source/target/type triples and adds 14,713 `.text` references. All 5,128 unowned
destinations have incoming conditional/unconditional jumps from those ownerless
code sites; none overlaps the canonical fourteen unwind destinations, which
now have expanded body owners. These are exact set/spatial observations;
successful execution and semantic roles remain unestablished.
Canonical classifications are not transferred by count or target hash alone.
The [audit report](execheck-0.115.0.md) and queue give the remaining actions.

## Source, claims and next recovery

The current system ledger retains 61 stable identities, including the shared
engine boundary. All 796 supplied claims are individually indexed; the 28 newly
supplied claims have individual ownership reviews. Local raid-target, hazard,
timer/API, banner, lobby presentation, directory and generated-name leads have
current owning source/static results in the queue. Their runtime/parity limits
remain separate. All historic contracts keep
their actual target. Generic engine reconstruction remains supporting context.
Current [co-op reconstruction](coop-0.115.0.md) owns gameplay/network/server
source under #63, separately from the census's original collector classes.

No application compilation, compiling tests, game/network execution,
original/rebuilt comparison, native semantic completeness or parity is claimed.
Python identity/accounting and deterministic inventory checks are static only.

## Reproduce

Run from this checkout, exposing the existing recorded Capstone dependency where
needed. The explicit expanded directory resumes its exact saved plan and frozen
seed proofs. The original declared plan retains its original tool commitments;
use its saved exports for read-only verification. Do not restart a disposable
failed profile. Full inputs/selector
commitments are in the linked JSON reports; bulk evidence stays under runtime/.

```sh
python3 -B scripts/register-target.py --inspect-installed
python3 -B scripts/inventory-current-target.py --write
python3 -B scripts/inventory-current-target.py --check
python3 -B scripts/inventory-target-ranges.py --write
python3 -B scripts/inventory-target-ranges.py --check
python3 -B scripts/discover-native-ownership.py --write
python3 -B scripts/discover-native-ownership.py --check
python3 -B scripts/inventory-native-instructions.py --write
python3 -B scripts/inventory-unwind-complement.py --write
census_dir=runtime/coverage/0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c/ghidra/execheck-2026-10-25
python3 -B scripts/census-native-image.py --resume --output "$census_dir"
python3 -B scripts/summarize-native-image.py --input "$census_dir" --summary-output docs/analysis/coverage/full-image-execheck-0.115.0.json
python3 -B scripts/check-native-residuals.py --proof docs/analysis/evidence/0.115.0/execheck-residuals.json --census-summary docs/analysis/coverage/full-image-execheck-0.115.0.json --negative-tests
python3 -B scripts/review-target-refresh.py --previous-summary docs/analysis/evidence/0.113.2/refresh-baseline/native-summary.json
python3 -B scripts/summarize-refresh-unknowns.py
python3 -B scripts/index-current-changelog.py --check
python3 -B scripts/register-target.py --check
python3 -B scripts/check-reconstruction-coverage.py
```
