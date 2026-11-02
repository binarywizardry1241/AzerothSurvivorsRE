---
name: fixgap
description: "Offer and repair Azeroth Survivors gamemode, gameplay and mechanics gaps. Fix established source defects directly from retained evidence; use REA/Ghidra only for missing native contracts. Include incidental AS defects proved by current EXE evidence. Check, commit and push source/static repairs without builds or game validation. Reuse the open-source benilla/wenilla engine. Use for $fixgap or choosing AS reconstruction gaps that do not require in-game checks."
---

# Fix Gap

Complete the source or static-recovery work the user chooses without requiring
them to build, play the game or verify its appearance. The five workflows guide
implementation; they are not a fixed menu of tasks.

Read and apply the [shared autonomy rules](../shared/autonomy.md). Task selection
includes necessary work within this workflow, relevant coordination, subagent
delegation, focused commits and the delivery specified below.

Work in the primary checkout or a linked Git worktree under `AGENTS.md`.
Apply the shared [completion cleanup rules](../shared/autonomy.md#completion-cleanup)
to remove finished disposable output and retire unused temporary worktrees after
integrating their durable changes. Reuse suitable tools/caches; preserve active
work and required evidence rather than duplicating or retaining every output.

When fresh native recovery is needed, apply the shared
[analysis-script reuse rules](../shared/autonomy.md#reuse-analysis-scripts) and
[durable native query rules](../shared/autonomy.md#durable-native-queries),
including each individual Ghidra search or function decompilation. Resume saved
work automatically after transient timeouts.
Use stable existing script names and extend those tools in place when needed;
do not generate additional extractors, checkers or wrappers for this repair.
Use the [shared analysis workspace](../../../docs/analysis/shared-analysis-storage.md)
for those operations: search retained operations, reuse compatible saved
Programs and append missing work. Task paths and compatible seed additions must
not create another large database. Preserve cross-version correspondence limits.

Current coverage always follows the **newest supplied, hash-verified EXE**.
Historical reports retain their original target; a familiar filename, package
version or old inventory must not select the working target. The
[coverage workflow](references/coverage.md) owns target registration, discovery,
system/source accounting and individual changelog claims.
Apply the shared [incremental recovery rules](../shared/autonomy.md#incremental-recovery-across-target-updates).
Continue prior repairs and #41 questions from their saved results. A new EXE
hash requires correspondence checks for the contracts actually needed by the
selected task, not re-recovery of every known module. Preserve completed work
and omit proof-only applicability/registration tasks from ordinary repair choices.

## Choose the shortest sufficient repair path

Apply the shared [current-target efficiency rules](../shared/autonomy.md#efficient-current-target-work):
repair the latest outstanding requirement once, reusing completed work and shared
dependencies rather than stepping through historical changes.

REA/Ghidra is conditional, not a prerequisite for every `$fixgap` repair.
Start with the gap, owning report, retained evidence and live source. Choose the
route automatically and state it with the selected deliverable:

- **Source-only:** the required behavior and its relevant conditions are already
  established, and source tracing identifies the discrepancy. Reuse applicable
  reports, recovered data/tables, native extracts, correspondence assessments
  and durable fixtures; implement and check the live source directly. Do not
  load the REA skill, open a Ghidra Program, rerun recovery or create a new native
  report merely because a fix changes gameplay or a numeric value. Wiring an
  existing recovered contract into its missing consumer also fits this route.
- **Needs REA:** a necessary value, condition, ordering, identity, layout or
  producer/consumer contract is unresolved or conflicting. Identify that exact
  missing fact and recover it with the smallest sufficient targeted operation,
  then implement the repair. Do not expand it into a whole-image audit unless
  the selected task actually requires that audit.
- **Mixed:** complete independent, established source corrections directly and
  use targeted recovery only for the unresolved parts of the selected gap.

For example, if retained applicable evidence establishes that the Lich King's
attack deals one fifth of the base damage in a particular phase, while the live
source applies the full amount, correct that path and check its conditions and
arithmetic without starting REA. If "5x less damage" is only a symptom or release
note and the intended formula/phase is unknown, it is a recovery question rather
than permission to guess a multiplier.

Evidence still follows the target/provenance rules above. Reading retained
evidence and checking target identity/accounting do not require fresh native
analysis. Reuse an existing sufficient applicability assessment; missing
newest-target proof alone does not require rediscovering an established source
defect or reopening completed work. Preserve historical provenance and pending
applicability honestly; do not claim current fidelity without its proof. If an
uncertain native fact is necessary to justify the change, resolve that fact.
Keep review, documentation and permitted checks proportional to the actual fix;
a small correction does not need a new recovery project or redundant fixtures.

## Stay within Azeroth Survivors

The scope is **Azeroth Survivors gamemode, gameplay and mechanics**. Reuse the
existing open-source benilla/wenilla engine. Engine reconstruction or a general
engine-completeness audit requires an explicit separate user request. This
boundary also applies when the user selects **#41**.

Full co-op reconstruction is included: client and server source, discovery/relay
services, hosting/joining, transport, synchronization, party mechanics and their
UI/addon/localization consumers. Follow necessary source dependencies rather
than stopping at presentation or the four named co-op modules. Apply
`AGENTS.md`'s no-server-running boundary: do not start, host, deploy or operate
a game server, relay or lobby/directory service, even locally. Finish feasible
source/static work without requiring a running server. This skill's existing
no-build, no-game-launch and no-runtime-validation limits still apply.

**Scope-drift failure to avoid:** treating whole-EXE decoding/ownership totals,
unknown computed targets or missing engine-source paths as a completion
checklist can turn an AS repair into generic engine recovery. A census lead is
not automatically an AS task. Do not chase engine switches, address-taken code,
missing engine files or public-source completeness just to increase coverage
totals or remove unknown counts. Generic engine unknowns do not block completion
of an otherwise supported AS source repair.

Before expanding native recovery, identify the selected or incidentally discovered
AS mechanic, its live source consumer or necessary shared interface, and the
missing target contract the operation will resolve. When that connection is
still unknown, a concrete task in the
[unknown recovery queue](references/coverage.md#unknown-recovery-queue)
may instead be selected for bounded ownership/meaning classification. A known
mechanic or source counterpart is not a prerequisite for that investigation.
Follow the selected ranges/sites and necessary references with REA/Ghidra to
establish whether an AS contract is involved, including a co-op contract. If it
proves generic engine logic, record that classification and stop the branch. If it
remains unknown, record the exact missing proof and blocker. A whole-file scan
or classification task does not authorize general engine reconstruction.

Necessary shared-interface work may recover how AS calls an engine API and wire
the existing implementation to the recovered AS inputs, state and outputs.
Stop at that boundary; do not reconstruct the surrounding engine subsystem.
Keep AS-specific recovery and unresolved AS contracts separate from generic
engine discovery metrics. Preserve the EXE-fidelity requirements within this
scope rather than inventing replacement behavior.

## Additional AS issues found during a repair

Once a repair is selected, also fix unrelated AS issues discovered along the way
without asking for another selection or permission when current EXE evidence
proves the defect and required behavior. This is standing authorization for
incidental AS repairs, including findings absent from the gap register; it is not
permission to start an unrelated backlog sweep or generic engine reconstruction.

- Establish AS ownership, the current target version/hash, the native behavior
  and the discrepancy in its live reconstructed source path before changing it.
  Trace relevant producers, conditions, values and consumers. A nearby byte,
  literal, label, old-target extract or missing newest-target proof alone does
  not prove a defect. Reuse sufficient retained evidence for source-only fixes;
  use bounded static recovery only for a missing fact in an incidental lead;
  preserve an uncertain finding without implementing guessed behavior.
- For example, while repairing spell A, current hash-bound evidence may prove
  that unrelated spell B deals 10 damage while its live source deals 5. Fix B
  without another question once its identity, conditions and damage consumer
  are established, even though B is not a dependency of A.
- Apply the same completion, evidence, static-check, documentation, focused-commit
  and source-delivery requirements to each additional repair. Reuse its existing
  permanent gap or append a distinct finding, and keep the original selected
  repair moving; additional fixes do not replace its completion requirement.
- Explicit user limits such as "only A", investigation-only or documentation-only
  take precedence. Bare invocations still require an initial selection. All
  existing build, runtime, no-server-running, workspace and engine boundaries
  remain in force. This rule applies to selected `$fixgap` repairs, not to
  `execheck` audits.

## Completion requirement

**Do not deliver a partial fix. Resolve the selected
gap as fully as possible until further progress requires gameplay verification.**
Complete all feasible source and static-recovery work for the selected issue,
including necessary dependencies and its live inputs, state transitions,
consumers and presentation. Do not arbitrarily narrow a selected gap to a small
helper, extracted table, first patch or recovery report and call that finished.
Only an explicit narrower user request limits the repair to that portion.

After each meaningful fix, trace what remains in the selected issue and continue
recovering and implementing any source work that can still be done without a
build or game session. Missing native evidence needed to finish that behavior
calls for further targeted recovery, not an immediate handoff to the user.
Missing newest-target proof alone does not reopen completed source work.
Finish when further progress truly requires excluded compilation, runtime or
gameplay comparisons, or when a specific recovery or external blocker prevents
further source progress. For a
blocker, exhaust feasible recovery routes, finish independent work in scope and
report exactly what remains; do not describe the blocked repair as complete.
Keep required runtime/parity checks open in `docs/verification-needed.md` without asking the user to perform
them, inventing missing behavior or treating static checks as gameplay proof.

## Work that fits this skill

- Offer concrete missing implementations, source defects and EXE-bound recovery
  tasks that can be completed and assessed through static evidence, source
  tracing or existing checks that do not compile code or launch the game.
- **Exclude proof-only revalidation.** Do not report or offer an already
  implemented or recovered feature solely because its evidence is from an older
  EXE, exact newest-version/hash proof is missing, or a current bounded-contract
  registration is absent. This applies even when a register or ledger labels
  the row "Recovery evidence missing", "unknown" or "partial" for that reason.
  Omit those rows from gap choices and pending-work summaries. Offer the issue
  only when source or its owning report identifies a concrete defect, missing
  behavior or an unresolved contract needed to finish an implementation,
  independently of that proof/registration deficit. Preserve historical
  provenance and unverified parity; omission does not certify current fidelity.
- Include bounded unknown-byte/reference/data classification tasks from the
  current target's queue under #41, even while AS ownership is unestablished.
  Exact locations or reproducible selectors, an explicit question and a next
  static recovery action make these eligible; a residual byte count alone does
  not. A classification-only selection is an investigation whose deliverable is
  evidence, ownership and follow-up gaps, without implying a gameplay repair.
  Apply the proof-only exclusion here too: rebinding an existing implementation
  to the newest EXE is not a new unexplained native lead.
- Exclude work whose remaining action is compilation, gameplay validation,
  original/rebuilt interaction, screenshot/rendering comparison, audible checks
  or platform/runtime testing. An already implemented fix awaiting those checks
  is not an eligible task.
- A mixed gap is eligible only when it has concrete remaining source/recovery
  work. Describe that work under the existing gap number and state that runtime
  comparison remains open. Selection covers all feasible source/recovery work
  for that issue unless the user explicitly chooses a narrower task. Do not
  offer a vague source audit or an arbitrary small slice as a complete repair.
- Do not run builds, `cargo check`, compiling tests or game applications, or ask
  the user to perform/authorize them as part of this workflow. Static REA/Ghidra
  recovery is allowed after selection. Record runtime limits without making
  user gameplay checks a prerequisite for completing the selected source task.

## Learn the current state, then let the user choose

1. Read the current checkout's `AGENTS.md` and `docs/CURRENT-STATE.md`. Check
   `git status --short` to understand pending work. Read the linked owning reports
   or relevant source only as needed to understand the documented gaps and avoid
   presenting an already completed item as missing. Check the implementation and
   prior repair evidence before proposing a row; missing current-target proof or
   registration alone is not evidence of unfinished source work.
   Consult `docs/verification-needed.md` for the selected IDs' retained evidence
   or completed source history; it is not a second source-repair backlog.
   Run `python3 -B scripts/check-reconstruction-coverage.py` as a read-only
   accounting preflight. It verifies the newest supplied target and current
   system/changelog records without compiling, launching REA or running a game.
   If it fails, report the exact stale/missing accounting; do not silently use an
   older inventory or offer its findings as current. Existing records with open
   recovery are expected and do not constitute a preflight failure.
   For a bare invocation with an unregistered/new target, offer the bounded
   latest-target registration and coverage refresh under #41 and wait for that
   selection before writing records or running native discovery. When an exact
   repair or game-file update is already selected, necessary target/accounting
   refresh is part of that scope; do not request the same authorization again.
   Consult `docs/analysis/coverage/systems.json` for source work and pending
   native questions associated with each gap, including all diagnostic paths.
   For a bare invocation or selected #41 work, follow #41's link to the current
   target's unknown recovery queue and verify its target/evidence bindings.
   Read actionable unclassified leads as well as
   known AS recovery tasks; do not silently filter out unknown ownership.
   Resolve broad residual selectors against retained classification results and
   cross-target correspondence before offering them: presence in a raw census
   does not make a resolved site unknown again. Resume the remaining question
   under its existing lead/finding ID rather than repeating completed traces.
   Treat changed reviewed source as requiring renewed tracing before relying on
   its earlier mapping. Do not overwrite another session's active source work.
   For an exact repair outside #41, inspect its owning records and dependencies;
   do not read unrelated recovery queues or start a coverage audit as preparation.
2. Give a concise summary of the current target and list every eligible open
   finding in the snapshot's **Gap register**, in ascending permanent-number
   order. Apply the eligibility rules above using current descriptions/statuses
   and the owning reports; status alone does not establish remaining source work.
   Label each choice **Source-only**, **Needs REA** or **Mixed** using the routing
   rules above, so quick source fixes are visible alongside recovery tasks.
   Honor CURRENT-STATE's **Connected changelog groups**: apply eligibility to
   each member, then offer each group once with all eligible permanent IDs and
   its concrete remaining work. Sort a group by its lowest eligible ID; show
   ungrouped eligible findings normally. Keep every member's evidence and status
   separate; grouping does not reopen completed/proof-only/runtime-only work.
   Selecting the named group covers its eligible members; selecting exact `#N`
   IDs retains that explicit scope and does not silently select their siblings.
   Apply the proof-only exclusion before listing rows; do not turn missing
   newest-target evidence into a repair or revalidation choice. Explicit requests
   for target revalidation or a coverage refresh retain that separate audit scope.
   For a mixed gap, describe only its actionable source/recovery portion. Use
   explicit `#N` labels in a table or bullets so filtered findings cannot cause
   Markdown to renumber the choices. These are stable identifiers, not
   priorities or positions in a freshly generated list: `#1` always identifies
   the same issue. Read current descriptions/statuses on each invocation;
   distinguish missing source/recovery work from deferred validation/comparison.
   Do not select an arbitrary subset of eligible findings, invent chat-local
   numbers, or use stale chat history or the five workflow names as choices.
   Preserve each issue's identity rather than offering only a broad category.
   Under #41, expose eligible queue tasks by their stable lead IDs and concrete
   classification questions so the user can select one without selecting the
   entire census. Keep known engine/excluded context and blocked prerequisites
   distinct from work that can currently be investigated.
   Briefly note that proof-only revalidation and build/game-validation-only rows
   are excluded, without enumerating them as pending fixes. If no eligible work
   remains, say so and stop without requesting gameplay checks.
3. Ask: **"Which of these source/recovery gaps should I fix?"** Let the user
   select one or more listed gaps or describe another exact eligible gap. Use the
   available user-input tool to present the choices when possible; otherwise ask
   in the final response.
   Wait for their answer. A bare `$fixgap` authorizes learning and presenting
   choices; it does not authorize choosing a gap on their behalf.
4. Before that answer, keep the work read-only. Do not launch REA/Ghidra jobs,
   builds, tests or applications, change source/docs, switch branches or make
   commits just to prepare the choices. If the user selects only a broad area,
   ask which concrete gap within it they mean before starting its repair.

If the invocation already selects an exact eligible task, learn the current state
and proceed without asking for the same selection again. For a mixed gap, state
the source/recovery portion being addressed. If the selected issue has only
build/runtime work left, explain that it is outside this skill and present the
eligible choices instead. A request for investigation or documentation only
limits the work to that action. Otherwise, selection means recover what is
needed, implement the fix and check it within the boundary above. Do not add a
second general permission or work-mode question. When resuming an active repair,
retain its eligible source scope, including authorized
[additional AS repairs](#additional-as-issues-found-during-a-repair). Ask for a
new selection only for work outside that authorization or an explicit user limit.

## Complete the selected source/recovery task

- State the selected issue, the source/recovery deliverable and the static
  evidence that can establish its completion. Follow necessary cross-cutting
  dependencies and the additional-AS-repair rule above; announce each proved
  incidental defect and proceed without another permission question. Preserve
  explicit user limits and do not start unrelated backlog sweeps.
- Choose the source-only, REA or mixed route above. Read the relevant section of
  [the five workflow guides](references/workflows.md) only when its domain
  guidance is needed. A direct source correction does not require loading the
  native recovery instructions or historical routing reports. Combine guides
  when necessary; they do not require completing all five scopes.
- When a necessary native contract is missing, use the existing
  [reverse-engineer-anything skill](../reverse-engineer-anything/SKILL.md),
  `docs/REA.md`, the project `./scripts/rea` wrapper and Ghidra. Read
  the latest target returned by `scripts/coverage_common.py` through the
  [coverage workflow](references/coverage.md), including its identity manifest,
  and verify its hash before fresh native analysis. Reuse recorded current
  correspondence assessments for older evidence; where necessary, establish
  only the missing correspondence or changed dependency needed by this task.
  Preserve historical provenance and do not use old addresses unverified.
- Submit native work through the [shared query queue](../shared/autonomy.md#durable-native-queries).
  Its worker limit and compatible-Program leases cover all chats and delegates;
  leave queued work waiting and continue independent source work. Batch related
  known queries in one plan, search retained results first, and never create a
  duplicate Program/variant or increase timeouts just to bypass contention.
  A producer update requires a new output receipt; it does not require another
  import or invalidate the original evidence. Fresh whole-image autoanalysis
  requires the explicit plan option documented in `docs/REA.md`.
- Reuse sufficient hash-bound evidence and recovered engine behavior. Recover
  missing producers, state transitions, consumers, values or presentation from
  the selected EXE before implementing them. Do not invent behavior, reuse old
  RVAs unverified or run broad recovery merely to produce more evidence.
- For a selected unknown-classification task, carry out its bounded REA/Ghidra
  action and update the queue with the observed result, exact evidence and any
  remaining blocker. Map a recovered AS contract to its existing system/gap or
  append a distinct permanent finding when warranted; keep #41's discovery
  ownership and the lead ID traceable. Follow the selected investigation/repair
  scope and the additional-AS-repair rule. An explicitly classification-only
  request remains an investigation and does not authorize source repairs.
- Trace and fix the live source path. Connect recovered behavior through its
  actual runtime inputs, state, output and UI as applicable. An extracted table,
  isolated helper or unused implementation does not close a live gameplay gap.
- Check the changed source path against the established contract, relevant call
  sites, state transitions and boundary cases. For source-only fixes, cite the
  retained evidence and inspect the connected path without a fresh native query.
  Use suitable existing non-compiling checks when useful; inspect what a check
  invokes before running it. Do not substitute a build or game session. Report
  the checks actually run
  and leave compilation, gameplay and visual parity explicitly unverified.
  If static recovery cannot resolve a necessary behavior, report the precise
  unresolved part and continue independent work within the selected scope;
  do not invent behavior or turn it into a request for user gameplay validation.
- Keep useful progress updates at meaningful steps and at least every 60 seconds.
  Preserve existing changes and follow the current checkout's workspace, evidence
  and commit rules. Deliver source-only commits to the configured public GitHub repository;
  do not open PRs or run Actions.
- When facts change, update the owning report and the two finding registers.
  Keep only remaining source/recovery actions in `docs/CURRENT-STATE.md`.
  Move a source-complete row and its evidence to `docs/verification-needed.md`;
  retain its actual pending compilation/runtime/parity requirements there.
  For mixed issues, keep reciprocally linked source and verification records
  under the same permanent number. A move does not close verification or imply
  parity. Retain completed/history records there instead of leaving them in the
  source queue. Append new findings after the highest assigned number across
  **both** documents;
  never renumber, reuse or reassign an existing number, including across target
  updates. Update an existing row when it is the same issue; link related new
  findings rather than silently changing the old number's scope. Do not create
  diary entries or commits for unchanged inspections.
  Also update the owning system and individual changelog claim records when
  their evidence or connected source changes. A source-path match, recovered
  table or release-level crosswalk cannot certify a whole system or every
  changelog claim. Preserve unresolved code/data/indirect-reference coverage
  under its permanent gap until the native/source work is demonstrated. Check
  the coverage records again before delivery; retain open runtime/parity fields.
- As each focused change is ready, review and commit its intended durable changes
  in the chosen checkout. A worktree may use its own task branch; confirm branch
  ownership before implementation and preserve pending work. Follow the
  repository's focused-commit discipline, staging only the selected repair or an
  authorized incidental repair and its related evidence/checks/documentation.
  Keep distinct repairs in separate commits and leave other pending work alone.
  Integrate each focused repair into local `main` in coordination with its owning
  checkout, without switching/resetting another task's dirty checkout or folding
  unrelated work into the repair. For work already on `main`, deliver immediately;
  for a worktree branch, deliver as soon as its reviewed integration is safe.
  Verify the intended repair is on `main`, push it to `origin/main`
  over HTTPS and verify that GitHub's `refs/heads/main` matches the committed SHA
  before continuing the repair or creating another commit. Do not accumulate
  local commits or wait until the whole selected gap is finished to push them.
  Each push delivers that focused change; continue the remaining selected work
  under the completion requirement above. Do not leave delivery as a suggested
  next step or ask for separate permission unless the user's current instructions
  explicitly limit delivery. Report the delivered commit hashes in the final
  reply. If a push fails, report the blocker and preserve the commits; resolve
  delivery before creating more commits, and do not force-push or rewrite
  published history.

Apply completion cleanup before the final report. Keep a worktree only while its
changes or required outputs still need integration or another task is using it;
do not remove unfinished work to satisfy cleanup.

Finish with what changed, the static evidence for the completed task and any
remaining source limitation or deferred runtime/parity requirement. Do not ask
the user to build or check the game. Do not stop at a plan or recovery notes when
the selected implementation is possible within this skill's scope.
