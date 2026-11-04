---
name: fixgap
description: "Offer Azeroth Survivors source gaps and changelog leads from CURRENT-STATE for selection. Repair established defects from retained evidence and recover missing contracts on demand against the installed EXE. Check, commit and push source/static repairs without builds or game validation. Use for $fixgap or choosing static AS reconstruction work."
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
Reuse exact sealed query results and the active census exports where a reader
needs them. Apply the shared storage retention rules to bulk historical
instruction and reference streams. Use bounded streaming checks for operand
work and keep cache experiments in task scratch.

Use the **currently installed, hash-verified EXE** for fresh native work. Keep
its identity separate from the last fully audited target. Historical reports
retain their original target. Use the [coverage reference](references/coverage.md)
for retained accounting and bounded #41 leads. Use the
[`$execheck` workflow](../execheck/SKILL.md) for full audits.
Apply the shared [incremental recovery rules](../shared/autonomy.md#incremental-recovery-across-target-updates).
Continue prior repairs and #41 questions from their saved results. Preserve
completed work and omit proof-only applicability/registration tasks from ordinary
repair choices.

## Repair existing gaps across versions

A gap's discovery version or EXE hash does not restrict which version it can be
fixed on. Offer and repair the same permanent gap against the live source even
when the installed game differs from the version used to identify or recover it.
Reuse established behavior and trace the remaining source discrepancy. A version
or hash mismatch, missing newest-target correspondence or stale coverage
registration alone must not block the repair, require the historical EXE, force
fresh REA or turn it into a target-refresh audit.

Keep retained evidence bound to its actual version/hash and record unverified
current applicability separately from source completion. Older evidence can
support a source repair without certifying current-target fidelity. Recover a
new native fact only when the implementation needs an unresolved value, condition
or connection, or concrete conflicting evidence makes the intended behavior
uncertain. Fresh queries must still verify the EXE they actually analyze and
resolve its addresses correctly.

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
  then implement the repair. Reuse only the discovery and verification steps
  needed for that contract.
- **Mixed:** complete independent, established source corrections directly and
  use targeted recovery only for the unresolved parts of the selected gap.

For example, if retained applicable evidence establishes that the Lich King's
attack deals one fifth of the base damage in a particular phase, while the live
source applies the full amount, correct that path and check its conditions and
arithmetic without starting REA. If "5x less damage" is only a symptom or release
note and the intended formula/phase is unknown, it is a recovery question rather
than permission to guess a multiplier.

Apply [cross-version repair](#repair-existing-gaps-across-versions) when reusing
retained evidence. Reuse an existing applicability assessment when available;
its absence alone neither blocks an established source correction nor reopens
completed work. If an uncertain native fact is necessary to
justify the change, resolve that fact.
Keep review, documentation and permitted checks proportional to the actual fix;
a small correction does not need a new recovery project or redundant fixtures.

## Escalate when the selected gap requires it

Reuse any `$execheck` procedure that supplies evidence the selected gap needs,
including a whole-image scan or census when the question requires it. If the
selected work requires the complete audit, such as a full #41 coverage review,
follow `$execheck` end to end in the same task. Explain which required result
depends on the full audit and why retained evidence or a smaller pass is
insufficient. The existing selection authorizes this dependency. Reuse completed
work and resume the selected gap with the audited evidence.

A new EXE hash, stale coverage ledger, difficult query or one required audit
stage alone does not trigger the complete workflow. Keep audit findings in
focused audit commits and deliver them under the
[commit delivery rules](../../../AGENTS.md#commit-delivery). Link the evidence
needed by the selected repair with verified provenance.

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
   Run `python3 -B scripts/register-target.py --inspect-installed` for the
   configured EXE's version and SHA-256. Compare the pair with the audit identity
   in CURRENT-STATE. Report an unaudited hash as such and keep established source
   work selectable. If inspection fails, report the reason and continue eligible
   source-only work. Resolve the installed identity before fresh native recovery.
   Use the full coverage checker as part of a full audit. A bare invocation
   remains read-only, including on a new hash.
   Consult `docs/analysis/coverage/systems.json` for source work and pending
   native questions associated with each gap, including all diagnostic paths.
   For a bare invocation or selected #41 work, follow #41's queue link and
   compare its target/evidence binding to the installed EXE. Historical
   selectors may guide a selected investigation after current mapping. Keep
   their original provenance and present them as historical leads.
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
2. Give a concise summary of the current target and show every eligible open
   finding in the snapshot's **Gap register** under its
   [primary category](../shared/gap-categories.md). Order numbered choices by
   permanent ID within each category. Show useful tags and omit empty headings.
   Apply eligibility first using current descriptions, statuses and owning
   reports. Status alone does not establish remaining source work.
   Label each choice **Source-only**, **Needs REA** or **Mixed** using the routing
   rules above, so quick source fixes are visible alongside recovery tasks.
   Honor CURRENT-STATE's **Connected changelog groups**: apply eligibility to
   each member, then offer each group once with all eligible permanent IDs and
   its concrete remaining work under the group's category. Sort a group by its
   lowest eligible ID and show ungrouped eligible findings normally. Keep every
   member's evidence and status separate. Grouping does not reopen completed,
   proof-only or runtime-only work. Mark **Good to pair** only where two choices
   can reuse specific work. Name the IDs and what they would reuse.
   Selecting the named group covers its eligible members; selecting exact `#N`
   IDs retains that explicit scope and does not silently select their siblings.
   Apply the proof-only exclusion before listing rows. Also read CURRENT-STATE's
   **Unreviewed release leads** from [`$changelog`](../changelog/SKILL.md). Offer
   them under their categories in the same menu as **Release lead — review first**
   choices, by group name and with stable claim IDs. Attach them to an eligible
   existing finding when it owns the same work so the choice appears once. Use
   `python3 -B scripts/index-current-changelog.py --claims-only <version> ...`
   to resolve their exact text without an audit. Selecting a release group
   covers its actionable claims. An exact claim ID selects that claim and its
   required dependencies. Offer actionable desktop leads from newer releases
   even when an older EXE is installed. Label them **Release lead — newer than
   installed EXE**, with both versions, and allow selection by group or claim ID.
   If the installed identity is unavailable, mark it unverified and keep source
   review selectable. Keep other-artifact leads pending until applicable. Once a
   reviewed lead only needs a newer EXE for its follow-up, show that dependency
   separately from selectable work.
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
3. Ask **"Which of these gaps or release leads should I work on?"** Let the user
   select one or more listed gaps or leads or describe another exact task. Use the
   available user-input tool to present the choices when possible; otherwise ask
   in the final response.
   Wait for their answer. A bare `$fixgap` authorizes learning and presenting
   choices; it does not authorize choosing a gap on their behalf.
4. Before that answer, keep the work read-only. Do not launch REA/Ghidra jobs,
   builds, tests or applications, change source/docs, switch branches or make
   commits just to prepare the choices. A category or class request filters the
   menu. Show the matching choices and ask for the concrete gap or named group
   before starting a repair.

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

- For a selected release lead, trace the live source and compare applicable
  retained evidence before choosing a route. Recover unclear behavior from the
  installed EXE when it applies to the selected claim. If the contract is
  already connected, record the bounded result and close the intake item unless
  the audit follow-up below applies. If a defect is established, reuse its
  permanent finding or assign one under the register rules, then repair it in
  the same selection. Retain unresolved subcases as leads and keep every
  constituent claim traceable to its assessment.
- For a lead ahead of the installed EXE, trace the live source and complete any
  repair supported by established evidence. Use the older EXE for bounded
  baseline questions and bind those results to its actual version and hash.
  The older EXE establishes baseline behavior only. Defer the parts that
  require the newer EXE and keep the release note as the recovery question.
- Keep each reviewed claim ahead of the installed EXE, or whose installed
  identity could not be verified, in **Unreviewed release leads**. Mark it
  **Audit follow-up** in the next source/recovery question for the
  [applicable audit](../execheck/SKILL.md#investigate-every-claim-group-connected-work).
  In that field or its linked owning report, record the
  installed version and hash if verified, the relevant source paths and symbols
  inspected or changed, the evidence used, and the exact behavior to compare
  when the updated EXE is available. Include any existing gap ID. Carry the
  follow-up even if the supported source work is complete. Keep the release
  version and the evidence target separate in the claim assessment.
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
  `docs/REA.md`, the project `./scripts/rea` wrapper and Ghidra. Verify the
  installed identity immediately before fresh native analysis. Use
  `installed-game/AzerothSurvivors.exe` for direct queries and check the
  journal's target digest against the inspected hash. If a compatible prepared
  Program is unavailable, use bounded PE discovery and journaled raw-slice
  queries as needed. Bind each slice's bytes, digest and VA to the inspected
  EXE and check its journal against the slice digest. A newer version or changed
  same-version hash can be queried before full registration. Verify the specific
  Data inputs only when the selected contract depends on them. Reuse recorded
  current correspondence assessments when available. Establish missing correspondence
  only where a necessary query or unresolved behavior needs it, following
  [cross-version repair](#repair-existing-gaps-across-versions). Preserve
  historical provenance and do not use old addresses unverified.
- For the native portion of a **Needs REA** or **Mixed** task, use the
  [shared REA investigation recipes](../shared/rea-investigation-recipes.md)
  to turn each missing fact into a bounded static question with a proof and
  stop condition. Reuse an applicable result across dependent claims and gaps,
  keeping each assessment separate. Apply the recipes to selected #41
  classification questions as well, including when AS ownership is unknown.
- Submit native work through the [shared query queue](../shared/autonomy.md#durable-native-queries).
  Its worker limit and compatible-Program leases cover all chats and delegates;
  leave queued work waiting and continue independent source work. Search retained
  results first and batch related known queries for the selected work in one plan.
  Reuse the shared result where applicable and record each gap's separate proof.
  Never create a duplicate Program/variant or increase timeouts to bypass
  contention.
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
  and commit rules.
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
  the affected claim IDs, finding links, evidence and source before delivery.
  Reconcile the selected intake row so resolved claims stop appearing as repair
  choices. Preserve ahead-of-install audit follow-ups as described above.
  For an unaudited hash, record the assessment with its actual version/hash in
  the durable reviews and owning report. When only historical evidence supports
  a source repair, retain that provenance and record current applicability as
  pending. Keep the published audit ledger bound to its reviewed inputs and
  retain open runtime/parity fields.
- As each focused change is ready, review and commit its intended durable changes
  in the chosen checkout. A worktree may use its own task branch; confirm branch
  ownership before implementation and preserve pending work. Follow the
  repository's focused-commit discipline, staging only that change and its
  related evidence, checks and documentation. Keep distinct repairs and audit
  findings in separate commits. Push each commit to `origin/main` and verify
  delivery under the [commit delivery rules](../../../AGENTS.md#commit-delivery).
  Deliver each focused change as it is ready, then continue the remaining
  selected work under the completion requirement above.

Apply completion cleanup before the final report. Keep a worktree only while its
changes or required outputs still need integration or another task is using it;
do not remove unfinished work to satisfy cleanup.

Finish with what changed, the static evidence for the completed task and any
remaining source limitation or deferred runtime/parity requirement. Do not ask
the user to build or check the game. Do not stop at a plan or recovery notes when
the selected implementation is possible within this skill's scope.
