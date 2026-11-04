---
name: execheck
description: Run a full AzerothSurvivorsRE audit against the installed EXE and Data, discover AS-specific behavior, and reconcile source connections, changelog claims and findings. Use for $execheck, explicit full-audit requests or selected $fixgap work that requires the complete audit.
---

# EXE check

Refresh the installed target and audit the entire selected EXE and the
reconstruction's evidence/connection map in one workflow. Run every stage below
for `$execheck`, explicit full-audit requests and selected `$fixgap` work that
[requires the full audit](../fixgap/SKILL.md#escalate-when-the-selected-gap-requires-it),
including an unchanged target.
Use [`$changelog`](../changelog/SKILL.md) for release-note intake and
[`$fixgap`](../fixgap/SKILL.md) for selected repairs on the installed EXE.
Complete each audit stage by extending and reconciling retained work.
The primary deliverable is the numbered findings in `docs/CURRENT-STATE.md`:
report coherent AS issues with their connected discoveries, missing source
connections and recovery questions, exact evidence and next static steps. The
native reports,
machine registers and unknown queue support those findings; they do not replace
them. Preserve existing IDs and closed rows across both registers, reuse the same finding for the same
issue and append new IDs for distinct findings after applying the grouping rules
below. An unchanged review needs no new row or status-only edit. A passing
inventory is never a claim of gap-free
1:1 gameplay.

Apply the shared [source/verification ownership rules](../shared/autonomy.md#source-gaps-and-verification-ownership).
CURRENT-STATE contains unresolved source/recovery issues; post-source gameplay,
runtime/platform, compilation and parity checks belong in
`docs/verification-needed.md`. Preserve moved/completed IDs and their evidence
there. Mixed issues use reciprocally linked records under the same number.

Read the repository's `AGENTS.md` and
`docs/analysis/reconstruction-coverage.md`. Work in the primary checkout or a
linked Git worktree as allowed by `AGENTS.md`. Read reference
inputs directly from `.codex/reference-game.json`: `exe` is the installed
`AzerothSurvivors.exe`; `data_dir` is its installed `Data` directory. This is the
authorized read-only exception to the workspace boundary. Keep all outputs,
Ghidra databases, extracts, logs and caches inside an authorized checkout; apply
the shared completion cleanup rules when they are no longer required. Do not copy or
symlink the game EXE/MPQs into the project, change installed files, use a stale
project copy, or fall back to a historical target.

Use the project-wide [shared analysis workspace](../../../docs/analysis/shared-analysis-storage.md).
Search retained knowledge first, extend compatible Programs and inventories,
and keep task outputs as receipts/references. A repeated audit or changed seed
list does not justify another independent database. Required whole-image scans
and exact current-target evidence remain mandatory.

This workflow authorizes static discovery/recovery and documentation/tools,
not compilation, game launches or gameplay repairs. Inspect reconstructed source
to identify and report differences; implementing the reported gameplay fixes is
a separately selected task. Completing this audit means publishing its findings
and explicit unknowns, not repairing every finding or certifying parity.
Give meaningful chat updates at least every 60 seconds.

Include the full cooperative client/network/server path in static discovery and
coverage, including discovery/relay services, hosting/joining, synchronization,
party mechanics and UI consumers. Historical excluded-co-op labels are evidence
scope, not a current recovery restriction. Report missing source under its
owning finding for implementation in a selected repair. Apply `AGENTS.md`'s
no-server-running boundary: do not start, host, deploy or operate a game server,
relay or lobby/directory service, even locally. This audit's no-compilation,
no-game-launch and no-gameplay-repair limits remain in force.

## Reuse the existing benilla engine

Use the public benilla/wenilla source already present in this checkout as the
engine implementation. **Before expanding any native recovery branch, inspect
the relevant local source first**, using `docs/analysis/benilla-vendor.json` for
upstream provenance and known local overrides. Preserve existing adapters;
do not recreate available engine source from decompiler output.

Resolve the existing API, parser, state owner or dispatcher and record its
source counterpart. Expand native recovery only for an AS-specific addition,
a demonstrated target-specific difference, or an unresolved interface contract
required by AS. State that exact question before following further engine
dependencies. Unknown ownership still permits bounded classification; apply
this source-first check as soon as a possible engine counterpart is identified.

Once the generic engine role and the required AS interface boundary are
established, record the source connection and stop that branch. Do not recurse
through surrounding engine, ECS, rendering, codec, compiler or standard-library
internals merely because AS calls them. Continue beyond the boundary only when
the concrete AS contract requires a further bounded trace. Generic engine
unknowns remain supporting context and do not create engine reconstruction
findings or block completion of the AS audit's reporting work.

The whole-file census may decode and inventory engine bytes for complete range
accounting; it does not require decompiling every engine helper or rebuilding
benilla. Available source, matching names and provenance do not prove the EXE's
compiled revision or behavioral equivalence. Keep that uncertainty explicit
without turning it into a general engine-completeness task. Engine source
reconstruction requires a separate explicit user request.

## Autonomy and coordination

Read and apply the [shared autonomy rules](../shared/autonomy.md). A selected
audit includes the necessary work within this workflow, relevant coordination,
subagent delegation, focused commits and delivery under the
[commit delivery rules](../../../AGENTS.md#commit-delivery).

Apply the shared [durable native query rules](../shared/autonomy.md#durable-native-queries)
to individual Ghidra searches and decompilation as well as multi-operation plans.
Saved progress and automatic timeout recovery are required for these queries.
Keep their saved projects and operation journals alongside the separate durable
full-image census.

## Preserve recovery across audits and updates

Apply the shared [current-target efficiency rules](../shared/autonomy.md#efficient-current-target-work)
before planning investigations: reconcile all supplied releases into the latest
requirements and deduplicate missing contracts and shared dependencies.

Apply the shared [incremental recovery rules](../shared/autonomy.md#incremental-recovery-across-target-updates).
Keep prior semantic recovery, source repairs, classifications and stable #41
lead IDs. For the same target, reuse verified completed native passes and query
results and continue the unresolved frontier. For a new hash, perform whole-image
discovery, map prior work into the new target and recover changed or unresolved
contracts. Keep pending newer-target applicability separate from missing
implementation or unexplained semantics. Reopening a bounded conclusion requires
an identified affected dependency, changed contract or defect in its evidence;
a version/hash change alone does not erase it.

## Execute the automated dependency graph

Apply the shared [analysis-script reuse rules](../shared/autonomy.md#reuse-analysis-scripts).
New runs use existing tools and data plans, not newly generated extractors.
Extend the existing scripts in place for missing capabilities; do not create
additional extractors, checkers or wrappers. Keep script names stable and store
EXE identities and contract parameters in their input/evidence records.

Use `scripts/run-execheck.py` and its portable `execheck_profile.py` stage graph
for repeatable orchestration. Read [the execution and cache contract](../../../docs/analysis/execheck-performance.md).
Print the plan first, select the existing project-local Capstone dependency with
`--python-path`, then run the required phases with `--run`. Discovery/registration
remain sequential. The runner verifies the installed inputs again, keeps the
fresh whole-image/diagnostic scans, overlaps independent readers within its
worker/memory budget, and gives each native Program one exclusive writer.

Start one runtime `--audit-session <path>` with `--new-audit` for this
audit, then pass that same session to every native/derive/reconcile invocation
and retry. Never reuse a prior audit's fresh-scan witness without
`--new-audit`. This preserves fresh whole-image scans per audit while avoiding
repeating them at every phase. The journal retains all phase timings, failures
and cache outcomes, including time between phases, for end-to-end diagnosis.

For unchanged targets, validate/reuse a completed native pass or resume it with
the native driver. A generic cache must never bypass the driver's provider and
saved-Program checks. For a new target/profile, `--phase native` creates the
declared and expanded work up to a review frontier. Review new/applied leads,
extend any remaining seed/edge frontier, then run `--phase derive` against that
explicit reviewed `--census-summary`. Review/publish its current ownership and
the exact applied-switch proof before `--phase reconcile`; its preflight rejects
stale publication inputs before repeating readers. Reconciliation refreshes the
atomic selection after historical joins and before downstream accounting.
Extend the DAG with `--plan` when reviewed target-specific
inputs require additional passes; do not create parallel mutable Programs for
ordinary seed additions.

Use bulk boundary verification and only the operand fields each consumer needs.
Do not eagerly populate or decompress a whole-image detail cache for a
boundary-only verifier or sparse dispatch reader. Keep persistent facts where
reuse actually pays; do not make cache population a prerequisite for the audit.
Reuse verified native ownership resolution for source-only metadata joins.
Changed bodies require a current ownership join even
when intrinsic facts or exact search offsets are reusable. Keep timing/cache
metrics outside evidence identities; inspect stage, checkpoint and save timings
before attributing a speed improvement. Preserve original execution producer
commitments when changing tools. Legacy collectors without a saved mutation
proof require full migration; missing or uncertain reuse proof falls back to
full repair. Validate affected-set changes with the bounded real Ghidra/full
comparison harness as well as non-compiling regression fixtures.

The graph automates mechanics, not native/source interpretation. Complete all
six discovery stages, individual release-item investigations, source reviews,
numbered findings and graph/queue reconciliation below. An automated-stage
success does not certify that review, clear #41, or establish parity. Record
measured cold and warm costs separately; do not promise an end-to-end duration
from a bounded microbenchmark. Performance changes require full current-image
verifier/operand measurements and payload equivalence, not just small windows;
record existing CAS reuse/deduplication honestly. Distinguish whole audit wall
time, sequential critical-path subtotals and overlapping worker durations.

## Required evidence for 1:1 parity

Apply all four requirements below. An audit or refresh may finish with explicit
open work; that does not satisfy the requirements for full reconstruction or parity.

1. **Account for every file range.** Maintain a disjoint, hash-bound file-offset
   ledger covering `[0, EXE size)`, including headers, every section, unmapped
   gaps, overlays/trailers, code, data, resources, metadata and padding. Reconcile
   exact ranges and totals without double counting. Every range needs an
   evidence-backed classification or an explicit unknown state with an exact
   recovery-queue selector. Padding candidates remain unclassified until proved.
   Track configured Data resources and unexplained contents separately; a whole
   file hash or complete byte inventory does not establish semantic recovery.
2. **Trace behavior through dependencies into source.** Connect native code/data
   through callers, dispatch, state, producers and consumers to the actual source
   implementation and its verification evidence. Keep unnamed code, unresolved
   references and reused engine contracts open until their role and relevant
   behavior are established. An engine label, a diagnostic filename, decoded
   instructions or existing benilla/wenilla source cannot certify fidelity.
3. **Require controlled original-versus-rebuilt comparisons.** Bind comparison
   evidence to the exact target hash and rebuilt source revision. Record assets,
   settings, initial state, inputs, RNG/seeds and timing controls, including any
   uncontrolled differences. Cover mechanics and transitions, movement/camera,
   UI/input, graphics, audio, saves/settings/file effects and failure paths.
   Retain mismatches and untested cases; bounded checks cannot certify untested
   behavior. Perform comparisons only within existing build/runtime authorization;
   otherwise record the concrete pending comparisons and continue authorized
   static work. These requirements do not authorize compilation or game launches.
4. **Gate every completeness claim on evidence.** Keep scanned, decoded,
   semantically recovered, implemented and verified states separate. Never claim
   overall 100% or 1:1 parity while unknowns, missing behavior, unresolved
   dependencies or unverified comparisons remain. State the exact included and
   excluded scope; excluded systems cannot count toward whole-product parity.
   A successful audit, refresh or accounting check does not close these gates.

## Establish the inputs and previous work

Read `docs/CURRENT-STATE.md`, `docs/verification-needed.md`, `docs/analysis/reconstruction-coverage.md`, the
selected target review/native census and their machine registers. Review all
currently discovered custom system rows, source anchors, evidence target
bindings, remaining work, release claims and relevant historical reports. The
number of discovered filenames is not a completeness criterion.

Use the [REA skill](../reverse-engineer-anything/SKILL.md) for shipped-code
recovery. Run discovery, registration and accounting sequentially. Do not use
previous coverage as current until the installed inputs are verified.

## Discover and register

1. Run `python3 -B scripts/register-target.py --inspect-installed`. It reads the
   whole installed EXE, hashes it and checks matching embedded version markers.
   If those markers become ambiguous, use REA to establish the actual identity.
2. Verify the registered EXE and complete MPQ chain with
   `python3 -B scripts/register-target.py --check`. A newer EXE, changed
   same-version hash or changed Data chain requires registration with
   `python3 -B scripts/register-target.py --register --installed` before treating
   previous records as current. Registration also hashes the entire installed
   MPQ chain. Review a changed same-version identity and use
   `--replace-same-version` when required; preserve the prior hash's evidence.
   A changed Data chain also needs renewed resource accounting.
   Record a compact target identity/report and preserve historical provenance.
   An unchanged registered target needs verification, not a replacement
   identity-manifest pointer; it still receives the complete scan and
   reconciliation below.
3. Use supplied release notes when available. Use the `$changelog` intake rules
   for any newly supplied text and keep its historical JSON archive unchanged.
   Missing newer notes remain explicit; do not invent claims or read unrelated
   installed files without authorization.

## Investigate every claim; group connected work

Keep every non-empty supplied changelog item as an individually traceable
**claim/review**, including apparently implemented items. Preserve its exact
release/text identity, changelog link, target binding, evidence, source owners,
status, next static step and separate validation limits. Release headings and
blank lines are context; visual wrapping belongs to the same item. Individual
claim accounting does **not** require one numbered gap per bullet.

Before creating or presenting gaps, compare each claim with existing findings
and other supplied releases. **Combine likely related or connected claims into
one coherent work item** when they concern the same feature, mechanic, lifecycle,
state/format, producer/consumer chain, dependency or plausible common cause.
Include a feature's UI, data, save, network and follow-up fixes together when
they form that same work item. Different bullets, versions, source files or
proof dimensions do not justify separate gaps. A likely connection is enough
for grouping; state it as tentative until proved. Grouping is a work-planning
decision, not evidence of a shared root cause or completion.

For example, Again's ghost chest, carried rune state, surviving companions and
boundary pillars belong to one Again teardown/reset item with four explicit
subcases. A Heroic affix's selection, effect, resource and publication questions
can share its feature item. Release summaries link their component groups as
context rather than creating an extra summary repair. Do not combine unrelated
work merely because it shares a release, module, or the #41 audit umbrella.

For new work, reuse an existing finding with the same issue scope or create one
numbered finding for the connected issue, listing all constituent claims and
remaining subcases in its owning report. Several claim reviews may point to
that same gap ID; keep each claim's assessment independent. Do not create extra
gaps solely for source correspondence, contract registration or each symptom
of the grouped issue.

For existing separate rows, **preserve every permanent number, issue identity,
status, closed row, evidence link, report, extract and machine-ledger reference**.
Add or update the **Connected changelog groups** table in CURRENT-STATE with a
descriptive group name, all existing member IDs, the connection and remaining
work. Present each group once as the work item; keep the numbered member rows
as the detailed evidence/status register. Do not delete, renumber, repurpose,
silently close or overwrite a member to achieve consolidation. A group is not
a new gap ID and cannot promote one member's proof to its siblings. Keep only
source/recovery members in that table; the verification register retains the
full related-finding sets and source-complete members. Claim reviews may point
to permanent IDs in either register.

Account for every constituent against the hash-verified EXE and actual source
connections. One current contract may answer several connected claims; retain
superseded aspects as historical context rather than recovering obsolete values
or presenting them as current defects. Keep genuinely uninvestigated or
inconclusive current aspects explicitly pending; release text alone proves
neither a defect nor completion. Before finishing,
reconcile every supplied claim to its review and owning finding/group, including
summary context and intentionally independent items, so grouping loses nothing.
Reconcile CURRENT-STATE's **Unreviewed release leads** against those individual
reviews. Remove a claim from intake when its bounded assessment resolves it or
an owning numbered finding now carries the remaining action. Retain unreviewed
or inapplicable leads, including notes for releases newer than the installed EXE.

On the first audit of a matching or later applicable EXE, review every queued
[**Audit follow-up** from `$fixgap`](../fixgap/SKILL.md#complete-the-selected-sourcerecovery-task),
including claims whose earlier source work was completed. Match by claim ID and
compare the current native contract and its dependencies with the recorded source
paths and live implementation. Account for later changes that supersede a claim.
Record a new assessment against the audited hash and preserve the earlier proof
under its original hash. If the source still matches, close the follow-up. If it
needs a change, flag the affected paths or symbols, the demonstrated difference
and the next source step in CURRENT-STATE under the same permanent finding ID
when one exists, even if the finding had moved to verification. If the comparison
is inconclusive, record the exact missing proof as recovery or applicability
work. Retire the queued follow-up only when the audit resolves it or a linked
finding carries the remaining action.

## Sweep the whole image

- Run `python3 -B scripts/inventory-current-target.py --write` and `--check`.
  Always cover the full current EXE, including executable regions outside unwind
  extents, embedded scripts/UI/configuration, IDs, resources and engine paths.
  Review the full inventories, newly observed leads and relevant changed contracts;
  an unchanged filename list cannot establish unchanged behavior.
- Run/reproduce `scripts/discover-native-ownership.py --write` and `--check`
  using the existing Capstone dependency. Map every discovered custom diagnostic
  owner and shared-engine boundary; follow the current target's code/data leads.

Reproduce the complete PE/embedded-candidate scan and diagnostic ownership,
then the declared-instruction and outside-unwind inventories. Use the existing
project-local Capstone environment; do not silently install dependencies.
Follow `docs/REA.md` and the current native census for exact command profiles.
Review headers, every mapped section, imports/exports, debug/unwind/relocation
records, executable complements, strings, embedded Lua/UI/configuration,
resources, IDs, data tables and address-taken code leads.

Maintain a verified full-image REA/Ghidra pass with the complete current seed queue
and verified diagnostic, guarded-switch, address-code, import and unwind inputs.
For an unchanged target/profile/input set, validate and reuse the completed pass
or resume its unfinished batches; do not import or decode it from scratch. A new
hash or invalidated analysis requires its own bound pass, while prior semantic
knowledge is reused through the incremental correspondence assessment above.
Use `./scripts/rea`, retain the full PE context and keep all databases/output
under ignored `runtime/`. Independently verify all exported instruction bytes
and boundaries with `scripts/summarize-native-image.py`. Preserve the existing
canonical selection until new results have been reviewed.

Use `scripts/census-native-image.py --run` and its durable Program checkpoints;
repeating `--run` or using `--resume` continues the exact saved plan. Keep
`census-current-target.py` for separately scoped procedure/reference profiles.
Resume interrupted full-image work automatically from the last verified saved
batch, retaining the database, cursor and failure diagnostics locally. A timeout
with recoverable progress is not a completed refresh: continue it. Diagnose
repeated no-progress failures before changing the approach; never trust old
JSON counters without a matching saved Program. A sample slice or seeded
analysis cannot replace the full EXE, and no census establishes semantic
completeness or parity. Retain all residual/pending sets under #41.

If replaying an existing plan, verify its target, starts and every input digest;
retain the actual original input-producer/tool commitments separately from
current launch-tool witnesses. A changed collector requires a new profile.
Never relabel an old analysis as using later tooling. Do not rerun a failed
profile unchanged: diagnose and record pending/failed ranges under #41.

Review direct/indirect calls and jumps, fixed memory operands, LEAs, initial
pointer slots, readers/writers, producers and consumers. Guarded tables need
proved bounds, entries and target instructions. Do not force function ownership
onto error blocks, assume a register alias, infer a table length from adjacent
data, or label address-shaped constants as live pointers. Preferred PE VAs are
not observed live-memory addresses; ASLR and dynamic state remain separate.

Revalidate reused addresses, layouts, IDs and producer/consumer dependencies
against this hash. Retain existing source, but do not relabel historical
extracts or infer that the release is additive. Unrelated gameplay repairs
require their own scope.

## Discover AS behavior beyond named modules

Reconcile all six stages after the structural census on every audit, including
an unchanged target. Reuse verified census exports, graph classifications and
saved query results; extend changed or unresolved parts rather than rebuilding
the graph or repeating resolved traces. For a changed target, first reconcile
prior nodes/edges and queue states through the correspondence assessments. Keep
unmapped applicability questions distinct from genuinely unknown behavior, and
do not stop at filename membership, unchanged strings or successful accounting.
Use existing analysis tools and the journaled REA runner; record unavailable
analysis explicitly rather than implying an automation or query already exists.

Use the [shared REA investigation recipes](../shared/rea-investigation-recipes.md)
for the semantic investigation of individual claims, changed dependencies and
residual code/data leads. Turn each unresolved edge or contract into a bounded
proof question and record its result in the existing graph, queue and owning
review. A resolved question closes only its own proof obligation. Continue
the required whole-image scans, all six stages and finding reconciliation.

1. **Maintain an AS candidate graph beyond filenames.** Combine native functions
   and interior/inline regions, data/tables, scripts, UI registrations, packet
   handlers, save/configuration fields, resources and their references. Retain
   callers/callees, readers/writers, registration/dispatch and producer/consumer
   edges. Classify each reviewed node or bounded region as AS-specific, shared
   dependency required by AS, established generic context or unknown ownership,
   with supporting evidence and uncertainty. A filename, nearby string or graph
   neighbour alone cannot prove ownership. Mixed functions retain scoped AS and
   shared regions instead of one forced whole-function label.
2. **Follow leads through a resumable work queue.** Trace each candidate from
   request/input through dispatch, state change and gameplay/UI/save consumers,
   including relevant failure paths. Decompile and inspect the required owners
   through durable query plans; apply the source-first rule before expanding
   newly exposed dependencies. Enqueue necessary AS recovery and bounded
   ownership questions; retain established engine counterparts as stopped
   supporting-context edges instead of recursively recovering their internals.
   Bind graph and queue records to the target hash, exact range/selector, parent
   edge, query/profile commitments, result hashes and pending/resolved/failed
   state under ignored `runtime/`. Resume supported pending work until no new
   candidates or edges emerge from the reviewed frontier. Retain every unresolved
   connection, failed route and concrete next action; a fixed batch, shallow call
   depth or sample does not establish closure. Recover enough to state each
   finding precisely, then publish remaining recovery work without implementing
   the gameplay repair or treating a recorded unknown as recovered behavior.
3. **Recover indirect connections.** Extend direct-call closure through
   callbacks, vtables, ECS system/event registration, queues, indexed dispatch
   and function-pointer producers. Follow incoming register/index state and
   pointer-slot writers across the necessary control/data flow. Keep initial
   encoded pointers, possible targets and proved static edges distinct from
   observed runtime calls. Unresolved targets and aliases remain exact queue
   entries; never discard a branch because it lacks a direct-call instruction.
4. **Discover data through code consumers.** Follow actual reads, writes,
   constructors and parsers to recover binary tables, numeric IDs, enum domains,
   layouts, serialized fields, packed/constructed strings and configuration
   keys. Include gameplay constants, UI actions, packet/save formats and resource
   lifetimes even without a known literal or regex match. Prove bounds, field
   widths, dispatch cases and consumers before assigning meanings; string and
   numeric patterns remain discovery aids, not an exhaustive AS inventory.
5. **Investigate unassigned code and data.** Keep a complete residual partition
   and group related unknown regions by incoming/outgoing references, address
   tables, registrations and shared state. Prioritize classification using those
   relationships without requiring an already proved AS connection. Inspect
   unnamed bodies, leaves, inline/merged regions and unexplained data as well as
   diagnostic owners. Establish generic-context exclusions with evidence and
   retain any AS-specific dependency or override; absence of an AS filename is
   not an exclusion. Check candidate engine roles against local benilla source
   and stop at the established interface boundary. Distinct actionable ownership
   questions get findings, while bulk residual ranges retain exact queue selectors
   rather than invented bugs.
6. **Compare recovered contracts with actual source and report findings.**
   Check the real producers, dispatchers and consumers for missing branches,
   fields/IDs, defaults, ordering, side effects, failure handling and dependencies.
   Record each distinct missing implementation, source connection or recovery
   proof in `docs/CURRENT-STATE.md` under its coherent issue, applying the
   connected-work grouping rules above. Preserve unknown source ownership rather
   than inventing a counterpart.
   Report discovered, classified, decompiled, behavior-recovered and
   source-connected counts independently for explicitly defined populations,
   with unresolved frontiers and overlaps. Never turn known-module coverage or
   decoded-byte totals into a percentage of all AS functionality or parity.

Keep one hash-bound graph/queue with stable selectors and saved progress, not
per-run duplicate inventories. Extend the existing tools to automate these stages;
tool presence, a decompiler export or graph saturation alone does not establish
behavioral recovery. The audit's stop/report boundary requires every reviewed
candidate to have evidence-backed status and every actionable new or changed
AS lead or concrete unknown-ownership question to have a numbered finding or
explicit ownership as a constituent of its connected issue/group.
Generic supporting unknowns remain in the residual queue. Static limitations
and any separately required controlled comparisons remain explicit.

## Reconcile connections and action points

Run these non-compiling audits after the parent inventories are coherent:

```sh
python3 -B scripts/revalidate-historical-native-ranges.py --census-summary <current-verified-summary> --write
python3 -B scripts/audit-exe-connections.py --write
python3 -B scripts/audit-exe-connections.py
python3 -B scripts/test-exe-connections.py
```

Select the summary from the current target's native report; a filename such as
`full-image-addresses.json` can still belong to a historical target. First create
the current custom partition with
`scripts/summarize-custom-native-coverage.py --census-summary <current-verified-summary> --write`.
The historical-range audit and connection audit must select that same exact
census. A current diagnostic/source join does not require or promote a historical
semantic classifier; retain historical classifier inputs with their actual target.

The connection audit provides every discovered custom system's source files,
native Location-derived body addresses, ownerless sites, bounded current
contract references and existing gap IDs. Its runtime inventory also indexes
all retained JSON evidence and directly embedded source assets. Review current
contract links separately from shared diagnostic/census links. Historical asset
formats may be intentional internal representations; old embedded hashes alone
do not prove a source defect or validate current semantics.

Replay relevant existing selected-target static contract checkers with their
documented arguments and local dependencies. Inspect checkers before running;
do not run compiling tests. Investigate failing checks before changing evidence.
Compare current tables against actual source consumers, not just labels or
counts. Sampled or bounded contracts retain their bounds.

Review retained observations referenced by both finding registers for unregistered
material failures. Distinguish historical reconstruction logs from original-EXE
evidence and fresh reproductions. Register a demonstrated failure without
inventing its root cause or attributing it to later untested source.

Reconcile `coverage/systems.json`, `diagnostic-ownership.json`,
`native-summary.json`, individual changelog claims/reviews and owning reports.
Run `python3 -B scripts/index-current-changelog.py --write`. New hashes require
new target-bound assessments, which may reuse prior recovery through recorded
correspondence proof. Preserve old reviews and their limits; a missing current
assessment does not undo an existing implementation. Update package metadata
and the documented baseline where applicable.

Update owning reports/registers when facts change. Keep CURRENT-STATE concise:
record the actual selected identity, implementation, material gaps and checks;
link the complete mapping/action table and state meaningful finished checks and
residual unknowns. Preserve every permanent gap number, issue identity and closed
row across CURRENT-STATE and verification-needed. Move source-complete rows and
all remaining execution/comparison checks to verification-needed; mixed rows keep
only source actions in CURRENT-STATE with reciprocal links. Expand existing rows
for the same issue; append distinct findings after the highest number in either
register. Keep recovery, connected
source, static checks, runtime validation and parity separate. Record incomplete
whole-image/native work explicitly, even if the PE inventory succeeds.
Give every independently actionable missing implementation or recovery proof a
traceable finding or constituent subcase in its connected group. Register each
AS module's missing source correspondence or current-target bounded contract as
an explicit module/dimension subcase in CURRENT-STATE; aggregate counts or
the parent #41 row do not replace those entries. Bind each entry to its stable
module ID, exact missing dimension, current-target connection-ledger selector,
source/native leads and next recovery step, and include its finding ID in the
owning `systems.json` row's `gap_ids`. Review existing rows first and reuse the
same ID for the same finding across audits and targets. Missing evidence is a
recovery-evidence finding, not proof of absent implementation or a gameplay bug.
Where prior recovery exists, retain it and describe the missing dimension as
current-target applicability/registration, not recovery starting from zero.
These proof-only rows remain excluded from ordinary `fixgap` choices.
Keep every reported or discovered bug explicit as a constituent subcase with its
own evidence/status, grouping likely connected bugs under one work item. Create
a separate numbered finding only when it has no coherent existing issue/group.
Use the same grouped work items in chat; preserve existing member identities and
closed rows rather than presenting each as an independent new task.

On every full audit, give each distinct newly
discovered or changed AS-specific code, data, script, UI, resource, ID, format or
behavior lead requiring recovery/reconstruction a traceable CURRENT-STATE owner,
as a finding or explicit constituent of its connected issue/group.
This includes filename-free leads and leads whose purpose is still unknown;
record them as recovery/classification work with the exact target hash and
native range or reproducible inventory selector. Do not wait for a proven bug,
a decompiled explanation or a source counterpart. Give each entry the next
static investigation step and the source connection to recover or identify.
Track recovery, source reconstruction, static checks and runtime/parity proof
separately; recording a lead does not resolve it. Reuse an existing finding
only when it is the same issue, recording renewed recovery needs when an update
invalidates its evidence. Connect related unknowns and behaviors as explicit
subcases; unrelated ones need their own entry. Module coverage counts and parent
#41 cannot absorb them. Generic engine/compiler byte changes remain supporting
context unless an AS dependency or concrete AS-ownership classification question
is identified.

For each follow-up, identify its native lead or missing proof, owning source,
next static recovery step and separate build/runtime/parity needs. Keep generic
engine/compiler/OS internals as supporting unknowns unless a concrete Survivors
contract needs them. Do not mistake unclassified bytes for new gameplay.

Publish the [unknown recovery queue](../fixgap/references/coverage.md#unknown-recovery-queue)
after every audit/refresh for this exact target, including a same-version or
unchanged target. Account for residual byte ranges, ownerless sites, unresolved
computed references and unknown data/ID meanings with exact evidence selectors
and a next REA/Ghidra action. Unknown
ownership is itself an eligible classification question; do not wait for a
proven gameplay defect or source counterpart before recording it. Link the
queue from CURRENT-STATE's #41 row so `$fixgap` can offer its bounded tasks.
Aggregate counts alone do not satisfy this handoff.

## Finish

Before declaring the audit complete, reconcile the candidate graph/work queue
with both finding registers: every distinct actionable discovery or missing connection
must map to an existing or newly appended numbered finding with exact native
evidence, actual/candidate source owner, next static step and separate validation
limits. Update owning system `gap_ids` where ownership is established. Do not
force filename-free leads into a diagnostic module or hide independent findings
under #41, the queue or aggregate counts. State which of the six discovery
stages completed and preserve exact pending/blocked work for any incomplete one.
An inventory/accounting pass alone does not complete this reporting contract.

Recheck `python3 -B scripts/register-target.py --check` so installed updates
during analysis cannot silently change the input. Regenerate/review the
changelog ledger if its inputs changed, and run
`python3 -B scripts/check-reconstruction-coverage.py`. Resolve malformed/stale
accounting through actual review; an accounting pass does not certify completeness.
Apply the [shared completion cleanup rules](../shared/autonomy.md#completion-cleanup):
preserve required evidence and unfinished recovery, remove finished disposable
output and retire an unused temporary worktree after integration. Check that
retained reports/checks do not rely on deleted runtime payloads; missing optional
regenerable inventories must remain explicitly optional.
Review the full diff and commit cohesive durable changes in focused commits.
Push each commit to `origin/main` and verify delivery under the
[commit delivery rules](../../../AGENTS.md#commit-delivery), including when
`$fixgap` invokes this audit. Report which whole-file scans/native passes
completed, what changed in the gap register, what remains under #41 and which
checks were not run. Compilation, compiling
tests and game launches remain subject to `AGENTS.md`; current source execution,
original-game behavior and parity require their own evidence.
Include the queue link and actionable lead IDs with their next recovery steps;
distinguish them from known engine/excluded context and blocked work.
Explain briefly what prior recovery was reused, what changed and what genuinely
remains unknown. Identify pending correspondence separately; do not describe a
drop in current-contract registration as lost implementation progress.

Report AS-only module coverage in CURRENT-STATE and the final chat response,
using the verified connection ledger's current denominator and these labels:

| Measure | Calculation from `exe-connections.json` |
| --- | --- |
| Known modules with partial reconstructed source | (`custom_system_rows` - `without_source_correspondence`) / `custom_system_rows` |
| Modules with registered current-target bounded recovery contracts | `with_registered_current_bounded_contract` / `custom_system_rows` |

Show both percentage and fraction, for example `100% — 60/60` and
`56.7% — 34/60` only when those are the actual current counts. For an empty
denominator report unavailable, not 100%. A bounded contract covers a specific
recovered behavior, so one contract can qualify a module with substantial work
remaining. Explain that these are module-coverage counts, not a percentage of
AS code decompiled, implemented or matched. Do not substitute whole-image
disassembly or engine counts. Link the individual finding IDs for every missing
source or current-target contract; update them only when their exact missing
dimension is resolved, without certifying whole-module completion or parity.
