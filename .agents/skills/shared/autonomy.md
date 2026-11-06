# Autonomous work and coordination

These rules apply to `execheck` and `fixgap`, including any agents
working on their behalf.

## Standing authorization

Task selection authorizes the necessary work within the selected task and the
skill's scope.
Choose tools, recovery routes and implementation details, resolve dependencies,
run permitted checks, update related evidence/documentation and create focused
local commits autonomously. Do not ask the user to approve routine next steps,
agent coordination, delegation, staging or commits. Review the intended changes
and staged diff and follow the repository's commit discipline.

Delegate bounded subtasks to subagents when useful without a separate approval.
Give them the selected scope, workspace boundary and applicable constraints;
the lead agent remains responsible for integrating and reviewing their work.

## Co-op source and server execution

Apply `AGENTS.md`'s full co-op reconstruction scope to all three workflows.
Client, networking, discovery/relay and server source are eligible; historical
excluded-co-op labels retain their original proof limits and do not prohibit
new recovery or source work. Each workflow keeps its own task-selection and
implementation scope: `execheck` reports findings, while a selected `fixgap`
repair implements them. Do not start, host, deploy or operate a co-op game
server, relay or lobby/directory service, including local host sessions. Finish
permitted source/static work without a running server; existing compilation,
application-launch and runtime-validation limits still apply.

## Relevant active chats

Locate, inspect and message relevant active chats whenever the task needs their
evidence, a shared interface decision, dependency, ownership agreement or handoff,
or coordination of overlapping edits and Git operations. Necessary requests and
substantive replies are already authorized; do not ask the user for each message.
Contact affected chats before changing files or records they are actively editing.
Keep messages concise and actionable, batch related points and continue independent
work while a reply is pending. Stop the exchange once the dependency is resolved.

Do not broadcast to unrelated chats, send acknowledgement-only or routine progress
messages, or repeatedly poll unchanged status. Keep the user informed in their
own chat at meaningful steps and at least every 60 seconds. Creating a separate
user-owned chat still requires a user request.

Agents may use the primary checkout or linked Git worktrees under
[AGENTS.md](../../../AGENTS.md#workspace-boundary). Agree on ownership and serialize
overlapping staging/commit/integration operations; worktrees still share branch
refs and may share runtime resources. Re-read shared files and Git state before
editing or committing; preserve other sessions' changes and staged work. Commit
only the task's intended files or hunks, keeping unrelated unfinished work out.
Reuse suitable tooling/caches rather than duplicating large installations.

## Completion cleanup

Apply [storage and completion cleanup](../../../AGENTS.md#storage-and-completion-cleanup)
before finishing, including after delegated work. Preserve required source,
fixtures, documentation, curated evidence, unfinished recovery results, useful
game build caches and Ghidra Programs actually reused by later queries;
remove finished disposable outputs and obsolete duplicates without asking again.
Integrate durable worktree changes and preserve needed ignored results before
removing an unused temporary worktree. Report reclaimed space and substantial
remaining outputs with their ongoing purpose. Ignored does not mean keep forever.
Use likely future consumers and recovery value to judge retention, with no
hourly/daily expiry. Keep useful documented analysis even when no current job is
reading it; remove session leftovers with no remaining use.

## Source gaps and verification ownership

`docs/CURRENT-STATE.md` owns unresolved source, recovery, provenance and resource
issues. `docs/verification-needed.md` owns gameplay/runtime, rendering/audio/input,
network/service/platform, compilation and original/rebuilt comparison work, plus
completed/informational finding history. Do not keep source-complete rows in the
source backlog merely because execution or parity remains unverified.

Move a source-complete finding to verification-needed with its permanent ID,
evidence and remaining checks. A mixed issue keeps only its source actions in
CURRENT-STATE and a reciprocally linked verification record under the same ID.
A reported unresolved defect stays a source issue; its capture/reproduction
instructions live in verification-needed. Moving a record never closes its
verification or promotes static proof to execution/parity evidence.

The registers jointly reserve every permanent ID. New IDs follow the highest
number in either document; never renumber or reuse a moved/completed ID. Use the
existing `coverage_common.finding_register` / `finding_reference` helpers for
machine ownership and navigation. Source-repair choices come from CURRENT-STATE;
consult the verification register for retained evidence, not new repair choices.
Use the [shared categories](gap-categories.md) when adding or revising source
findings, connected changelog groups and intake rows. Categorize the remaining
action and use tags for cross-cutting topics.

## Efficient current-target work

Reconcile the complete supplied changelog batch with existing findings before
planning recovery or repairs. Maintain one current requirement for each
mechanic/property and its conditions. A later applicable change replaces the
earlier requirement for that same aspect; retain the earlier claim and evidence
as history with a link to its replacement, not another active repair. Preserve
independent aspects such as cooldown, rank or phase behavior. Release text guides
this reconciliation; the selected hash-verified EXE decides the actual current
contract. Keep unresolved
applicability explicit instead of assuming that a similar later bullet replaces
everything about a feature.

Reuse the existing finding/group and investigate its current behavior directly.
Do not implement or recover every intermediate release state merely to reach
the latest one. Recover an intermediate contract only when a concrete current
question depends on it. Preserve every claim's accounting and all permanent IDs;
historical or already-supplied subcases do not become extra pending work.

The unit of native recovery is a missing current contract or shared dependency,
not a changelog bullet, gap row or report. Reuse one sufficient result across its
consumers and claim assessments, keeping their scopes independent. Establish
the exact missing fact before an expensive operation. Use retained evidence and
source tracing directly where sufficient; otherwise batch related missing
queries through the existing shared Program and journal. Extend existing tools
only for an identified missing capability; a small repair needs no new framework,
report, fixture or analysis pipeline merely to record that work occurred.

Invalidate only work affected by changed inputs, dependencies or a demonstrated
evidence defect, following the incremental rules below. Source/report joins must
not repeat unchanged native decoding or decompilation. Run mandatory whole-image
discovery once per audit session and reuse its verified results across phases;
resume completed native passes through their existing validated drivers. Keep
required scans, current-target correspondence and evidence integrity intact.

Choose the smallest meaningful permitted checks for the affected behavior. Reuse
existing fixtures/checkers and broaden checks only for changed dependencies,
failures or a concrete unresolved concern. Do not repeat unchanged checks merely
after documentation, staging or commits. Tool-performance changes require the
[full-path measurements and output-equivalence checks](../../../docs/analysis/execheck-performance.md)
appropriate to the changed mechanism; cache hits or short samples do not establish
an end-to-end speedup.

## Reuse gameplay tracker logs

When observed behavior could resolve a gap or audit claim, check relevant
existing gameplay captures before starting fresh recovery. Use them for
reported state, event order and errors within the captured interval.

- Search the owning authorized checkout's
  `runtime/original-vulkan-cache/cache/traces/` for `session-*/gameplay.log`.
  Use any associated `session.json` or retained launch evidence. If the
  launch used a custom cache directory, check its authorized location.
- Verify which executable produced the capture using independent launch or
  build evidence. Bind an original capture to its EXE hash and a rebuilt
  capture to its source revision and build identity. Correlate the session,
  timestamps and PID where available, and record relevant runner, graphics
  settings and inputs. Use captures with unresolved provenance as leads.
- Read only the relevant events or time window. Account for the trace tags,
  gaps and termination. Treat missing events as inconclusive unless the
  relevant event was observable in the captured interval. Keep published
  gameplay observations, internal behavior and parity conclusions separate.
- Keep raw logs in ignored runtime storage and retain only compact observations
  and capture provenance in the owning report or verification record. Continue
  the permitted static route when applicable captures are unavailable. Collect
  fresh captures only with separate game execution authorization and within
  the project's runtime boundaries.

## Incremental recovery across target updates

Recovery is cumulative. An EXE update changes which evidence applies to the
selected target; it does not erase recovered knowledge, source implementations,
resolved classifications or completed repairs. Preserve their original target,
stable system/lead/gap identities and exact remaining questions. Never reset an
entire module or #41 to unknown merely because the whole-file hash changed.

For existing `fixgap` findings, apply the skill's
[cross-version repair rule](../fixgap/SKILL.md#repair-existing-gaps-across-versions).
The discovery/recovery version does not gate source repairs on another version.
Pending current-target applicability stays separate from source completion;
correspondence and coverage-refresh requirements below govern audit claims and
fresh native queries and do not gate established source corrections.
Resolve a necessary unknown or concrete behavioral conflict with targeted
recovery; version/hash drift alone does not require that work.

- **Same target and inputs:** verify the target, any Data used and relevant source,
  query/profile/input commitments, then reuse completed results and saved
  Programs. Resume unfinished queries/census batches. In full audits, repeat
  the required whole-file inventory scans and reconciliation. Reuse compatible
  Ghidra imports and completed decompilation/census work. Missing outputs, changed analysis inputs or a
  demonstrated analysis defect can require a replacement pass; identify why.
- **Changed target during a selected refresh/audit:** perform the required
  whole-image discovery and obtain a census bound to the new hash; an ordinary
  source repair does not select that audit. Never resume an old Program as if
  it contained the new EXE. Before repeating semantic recovery, correlate retained
  contracts, classifications and unresolved leads with the new code/data. Keep predecessor
  links and old/new exact selectors. Recompilation, moved addresses or changed
  encodings are reasons to establish correspondence, not proof of new behavior.
- **Changed Data or source:** reassess the resource consumers or source
  connections affected by that change. Preserve independent native recovery
  whose inputs and contract remain valid; do not restart unrelated branches.

For each reused bounded contract, record current applicability separately from
its original recovery/implementation status:

| Applicability | Required action |
| --- | --- |
| Unchanged within the recovered scope | Retain the original evidence and add current-target correspondence proof; reuse the recovered contract. |
| Changed within that scope or its required dependencies | Identify the affected fields, branches or connections and recover that difference; preserve unaffected conclusions. |
| Not yet mapped, ambiguous or insufficiently checked | Keep the prior knowledge with its historical provenance and the precise pending applicability question; do not label the implementation absent or the old semantics newly unknown. |

Correspondence proof must establish the current code/data locations and the
relevant inputs, dispatch, referenced values/layouts, producers/consumers and
dependencies needed for that particular contract. Inspect the AS interface
boundary rather than restarting surrounding generic-engine recovery. Exact byte
matches, normalized instruction similarity, names and release notes are candidate
matches, not sufficient behavioral proof alone. Retained historical ranges may
be relocated or recompiled; a failed exact-byte search does not prove a change
in behavior. Static correspondence never transfers runtime/parity validation.

Use existing matchers, saved evidence and targeted journaled queries. Record a
compact correspondence assessment in the owning report/register, binding both
targets, selectors, comparison evidence and limits. Preserve original extracts
and receipts; add a current assessment rather than rewriting their provenance.
The historical-range checker supplies byte-match candidates, not this complete
assessment. If tooling or evidence cannot establish a match, record that exact
pending work instead of claiming automatic carry-forward or restarting all
semantic recovery. Count a contract as current only when its current assessment
is registered in the accounting format supported by the existing checkers.

Reconcile #41's queue against these assessments before offering work. Carry
forward resolved/context classifications where correspondence is established,
continue mapped unfinished questions and add genuinely new or changed leads.
Unmapped old leads need a mapping question with historical links, not silently
copied addresses or a second identity for the same issue. Compare each broad
residual selector with retained classifications before calling its members
unknown; a raw inventory can still contain sites whose role is already known.
Do not turn pending applicability alone into a `fixgap` repair choice. In refresh
reports distinguish retained knowledge, checked differences, genuinely unresolved
recovery and pending applicability, without presenting all historical work as
lost or creating status-only documentation.

## Reuse analysis scripts

Reuse the existing EXE-analysis tooling across tasks and target versions. Before
writing analysis code, search `scripts/` and the owning documentation for the
capability. Use `scripts/run-execheck.py` / `execheck_profile.py` for audit stages,
`./scripts/rea query <plan.json>` / `rea-batch.py` for targeted queries, and the
existing census drivers and `scripts/ghidra/ReaNativeCensus.java` collector for
whole-image work. Use the existing inventory, extraction, decoding, mapping and
verification helpers rather than reproducing them in a task script.

Express a new question or target through arguments, query plans, selectors,
seed/range inputs and hash-bound fixtures. Resume existing plans/results where
applicable. A new run, task name, gap number or EXE version is not a reason to
generate another Python/JavaScript/Java extractor, copy a runner, or create a
parallel disassembly pipeline.

If a required capability is missing, identify that specific gap in chat and
extend the closest existing shared tool. Do not create another script or wrapper
for a run, release or feature check. Keep tool filenames stable and put EXE
identities, addresses, expected values and retained contract selections in
evidence/input records. Add new assertions and supported inputs to the existing
checker rather than creating another checker. This is an implementation choice
within the authorized task, not a new approval step.

Consolidate existing stamped filenames into their stable capability names and
update live callers. Preserve exact historical producer bytes and hashes through
the existing script-provenance registry and committed Git history, keeping
evidence and its target bindings intact. Do not retain stamped compatibility
wrappers or silently make a newer tool satisfy an older execution hash.

Plans, result receipts and bridge files rendered internally from the runners'
canonical templates are analysis inputs/outputs, not newly authored extraction
tools. Keep generated runtime files only while required by their consumers and
apply completion cleanup. Tool reuse never makes old RVAs, data or behavior
current without the existing target/applicability checks.

## Durable native queries

All workflows use the project-wide [shared analysis workspace](../../../docs/analysis/shared-analysis-storage.md)
under `runtime/analysis/`. The catalog and immutable object store cover every
target. Discover earlier operations by exact content, target, address or scope;
retain semantic recovery and correspondence assessments across updates. Shared
native decode records can skip work only when their exact input bytes, address
coordinates, decoder algorithm and version agree. A content/search match is a
candidate, not proof of current behavioral applicability.

Retain full-EXE Program state for the registered installed target. After
verifying the successor's input identity, retire idle older Programs before
starting its full-image census. The default native audit phase runs
`python3 -B scripts/manage-program-archives.py --retire-historical` for this
handover. Keep older evidence and exports for the correspondence review.
Bounded recovery of an unregistered successor can use stored evidence or raw
slices without starting a new full-image Program.

Idle raw-slice Programs return to verified cold storage after close. An immediate follow-up
may opt out through `REA_ARCHIVE_RAW_PROGRAMS=0`. Matching queued consumers keep
the Program hot automatically; the final consumer can archive it without
starting Ghidra. Reuse the shared installed
datatype cache; do not copy it into every Program. All native operations use
the primary checkout's store, including recovery requested from a worktree.

Read the selected finding's owning report and retained native evidence before
issuing new queries. Apply [incremental recovery](#incremental-recovery-across-target-updates):
verify target/hash and reuse applicable completed results and saved Programs;
recover only missing or specifically invalidated proof. This does not replace
mandatory full-image discovery/audit stages. REA receives explicit
plans/inputs; the agent is responsible for reading and applying the documentation.

For `fixgap` and `execheck`, run individual Ghidra searches,
decompilation and other static queries through `./scripts/rea query <plan.json>`
(the shared `scripts/rea-batch.py` runner). A plan may contain one operation.
The shared queue admits at most two native workers across all chats/worktrees;
whole-image queries and current census runs reserve both slots. Compatible
query contexts wait before provider/execution deadlines begin, then recheck the
verified cache. Queuing is normal contention, not a failed recovery attempt.
Batch related known operations in one plan to reuse its live bridge. Continue
independent source work while queued; do not bypass admission with duplicate
Programs, named variants or direct producer calls. Native leases remain
exclusive, and cancellation/crash cleanup preserves saved evidence.
Use this journaled route rather than direct one-off CLI/MCP producer calls in
these workflows. The launcher selects a shared leased Ghidra Program for the
binary and compatible analysis mode. Compatible seeds extend it; an actual
conflicting function/code boundary requires an explicit named variant. The
runner stores completed results once, binds shared cache hits to the saved
Program revision and automatically reopens/retries
only unfinished transient work. Repeating the same plan/output resumes it;
`--resume` explicitly requires existing saved progress. Keep plan, inputs,
tool/seed commitments and output stable; changed inputs need a new task receipt and
must never overwrite earlier evidence.
After producer code changes, retain the old journal and select a new output
receipt for new work; the compatible saved Program remains reusable. A fresh or
newly prepared whole-image query must explicitly set `allow_full_image_analysis`
in its plan. Check retained census/query evidence first; a targeted repair must
not silently start another default whole-image autoanalysis.

Retain the per-operation journal and original results under ignored project
`runtime/` while recovery is unfinished or needed by a recorded consumer. Keep
databases that matching later queries reopen/resume to avoid repeated analysis.
Remove unneeded attempt diagnostics, superseded profiles and scratch data that
the tooling recreates without reusing. Inspect consumers before deletion and
invalidate reuse markers correctly if removing a Program. At completion retain
necessary compact evidence and remove unneeded runtime material. Verify saved result hashes before
reuse. A search checkpoint resumes supported scan work; an interrupted atomic
function decompilation retries that function, while completed queries remain
saved. Cancellation stops the run without discarding completed results. After
three consecutive transient attempts fail, diagnose the retained failure and
resume supported work; do not call the operation complete or repeatedly restart
the whole investigation. Permanent input/profile errors require correction,
not automatic retries. Keep full-image census work on its separate durable
`census-native-image.py` runner.

## Task and project boundaries

GitHub operations follow `AGENTS.md`'s project-account requirement. Require an
explicit project account and verify the authenticated identity before remote
operations. Verify delivery commit author and committer identities too. Global
credentials and identity settings do not select the project account. Missing or
mismatched configuration keeps work local; do not fall back to another account.

Standing authorization covers execution of the current task; preserve explicit
user limits and each workflow's scope. Selected `fixgap` repairs also authorize
[unrelated AS defects found along the way](../fixgap/SKILL.md#additional-as-issues-found-during-a-repair)
when current EXE evidence proves them, without another permission question;
this explicit exception does not expand `execheck` audits or
authorize other unrelated work. A bare `fixgap` still presents eligible gaps
for user selection. Build/compilation and game-launch restrictions remain
as specified in `AGENTS.md` and the invoked skill. Keep reference inputs read-only
and GitHub delivery source-only to the configured public repository. Apply
`AGENTS.md`'s public-repository privacy rules; machine-specific configuration and
the shared `runtime/analysis/` store remain local and Git-ignored.
Push each commit under the [commit delivery rules](../../../AGENTS.md#commit-delivery).
Scoped completion cleanup is authorized. Do not infer permission for unrelated
work, PRs, Actions, deletion of required/active material or rewriting published
history. Ask only for genuinely missing task
information or an action outside existing authorization, after completing
independent work that can proceed.
