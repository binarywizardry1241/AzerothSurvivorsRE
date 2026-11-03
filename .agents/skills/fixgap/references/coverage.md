# Current-target coverage

Use `docs/analysis/reconstruction-coverage.md` for the portable commands and
record ownership. `docs/analysis/coverage/targets.json` registers supplied target
identities; `coverage_common.latest_target(verify=True)` resolves the newest
supplied version and verifies its bytes. A newly supplied EXE or a changed hash
must be registered and receive current coverage before older records can be used
as current. Do not select by filesystem timestamps or relabel old native RVAs.

The full consistency checker belongs to full `$execheck` audits. For
`$fixgap`, inspect the installed EXE with `scripts/register-target.py
--inspect-installed` and check only the selected gap's inputs and evidence.
Installed EXE identity, bounded recovery and published audit coverage are
separate states. Journaled REA plans can analyze the installed EXE by portable
path before it has a full audit or MPQ registration.

Apply [cross-version repair](../SKILL.md#repair-existing-gaps-across-versions):
an existing gap can be fixed on a different version from its discovery/recovery.
Stale target registration or missing newest-hash correspondence does not block
concrete source repairs supported by retained evidence and live source tracing.
Report that accounting limit without presenting historical coverage as current
or automatically selecting a refresh. Target-bound classification queries and
explicit refresh/audit work still require correctly bound inputs and evidence.

For `$fixgap` choices and pending-work summaries, apply the skill's
[proof-only exclusion](../SKILL.md#work-that-fits-this-skill). An existing
implementation does not become a reportable gap merely because its evidence
has older provenance or lacks exact newest-version/hash proof or a registered
current bounded contract. Inspect the source and prior repair before offering
work; require a concrete remaining defect, missing behavior or implementation
contract beyond that proof deficit. Preserve honest target/provenance records.
Follow `$execheck` for a full refresh or audit, including when the selected
gap [requires the complete audit](../SKILL.md#escalate-when-the-selected-gap-requires-it).
Apply the shared [incremental recovery rules](../../shared/autonomy.md#incremental-recovery-across-target-updates)
to those audits and selected repairs. Completed recovery and implementation
survive target updates; their current applicability is a separate assessment.

## Selected coverage work

Apply [the skill's AS scope boundary](../SKILL.md#stay-within-azeroth-survivors)
to #41 and every coverage refresh. Whole-image inventories locate Survivors
deltas over the existing benilla/wenilla source; their generic engine unknowns
are context, not a mandate for engine reconstruction or further recovery.
Full co-op client/network/server recovery and source reconstruction are included;
historical excluded-co-op classifications describe earlier evidence scope, not
a current stop rule. Apply `AGENTS.md`'s no-server-running boundary and the
invoked workflow's separate compilation/execution limits.

A full `$execheck` audit registers the exact EXE/resource identity, scans
the whole artifact, and reconciles discovered leads, claims and source gaps.
An installed version or hash change is an input to scoped `$fixgap` recovery
and does not select that audit.

When the user selects a target refresh or coverage task, register the supplied
artifact, reproduce the whole PE inventory and update the compact summary.
Bulk results belong under ignored `runtime/coverage/<target-sha>/`; promote only
useful evidence and the concise coverage records. Native recovery uses Ghidra
through `./scripts/rea`; the resumable census records decoded instructions and
references separately from PE metadata and raw byte-pattern candidates.
Individual searches/decompilation use the shared journaled query runner in the
[durable native query rules](../../shared/autonomy.md#durable-native-queries),
retaining completed queries and automatically retrying unfinished transient work.

Account for every newly discovered diagnostic path and native/system lead.
Each system links current native evidence, real reconstructed source consumers,
existing gap IDs and a concrete remaining recovery question. Check shared engine
paths as well as custom game paths; equal filenames do not prove equal behavior.
Record unmapped bodies, failed analysis, unresolved indirect targets and pending
data/ID meanings explicitly. An integer-looking byte sequence is not a proven
spell/item ID, and `.pdata` records are not a complete semantic system count.

The 51 paths observed in 0.105.0 are the current observation, never a hard-coded
coverage denominator. Later EXEs can add/remove paths, inline systems or omit
diagnostics. Preserve stable system identities and historical evidence; update
current membership rather than declaring recovery complete from a matching count.

For a register row with multiple remaining native tasks, identify the exact system
IDs and concrete remaining source/recovery work under the existing permanent gap
number. Apply `SKILL.md`'s completion requirement to the selected issue; do not
silently reduce it to one convenient subtask. An explicitly selected narrower
task retains that scope. Do not offer "audit the game" or validation-only work
as a repair. If a new behavior is discovered, update its existing finding or
append a new permanent number after the maximum across CURRENT-STATE and
verification-needed without reassigning prior issues. Move source-complete
records and execution/comparison work to verification-needed with their evidence;
keep only source/recovery actions in CURRENT-STATE.

## Unknown recovery queue

The [execheck workflow](../../execheck/SKILL.md) must publish a compact
**Unknown recovery queue** in the selected target's owning
native-census report, or in one linked target-bound report if it is too large.
Keep one canonical queue per EXE hash; the unified refresh/audit updates it.
Link it from `docs/CURRENT-STATE.md` under #41 and from
the current coverage report. Preserve historical queues with their actual hashes.
Reuse an unchanged queue after verifying its evidence; do not create diary
entries or duplicate records merely because a workflow ran again.
Across hashes preserve lead/finding identities and predecessor links, mapping
their selectors before reuse. Carry established classifications through reviewed
correspondence; retain pending mapping separately when a match is not established.
Reconcile broad residual populations with these results before offering #41 work,
so an already classified site is not repeatedly offered as unexplained code.

Account for every residual set reported by the whole-image passes: unobserved
or undecoded bytes inside/outside unwind extents, pending/failed ranges,
ownerless instruction/diagnostic sites, unresolved indirect calls/jumps or
address-taken targets, and observed but unexplained data/tables/IDs and missing
producer/consumer connections. Keep decoded-but-semantically-unknown code
separate from bytes a pass did not observe. Padding candidates remain candidates
until their classification is established. Discovery extends beyond named
diagnostic systems and supplied release claims.

Group related sites or ranges into bounded tasks by a shared question or
recovery action. Full inventories stay under ignored `runtime/`; the compact
queue must cover their residual sets through exact selectors and reconciled
counts, without dropping unsampled ranges. A sample does not resolve its whole
group. If an existing result exposes only a total, record a task to recover the
exact range/site inventory first, including the producer and missing output.

Each task records:

- **Identity and parent:** stable lead ID, selected EXE version/SHA-256 and
  permanent gap IDs. Initially use #41 for unclassified discovery; lead IDs are
  subordinate evidence identifiers, never replacements for permanent #N gaps.
- **Exact lead:** PE section, RVA intervals `[start, end)` or instruction/data
  sites, or a reproducible inventory selector with input/output digests and
  producer/profile references. Label file offsets and preferred VAs distinctly;
  record the local artifact path and how to regenerate disposable evidence.
- **Known and unknown:** observed bytes/references and pass limits, the precise
  unresolved question, and whether ownership is AS, unestablished, known engine
  context or cooperative client/network/server logic. Name source/system
  candidates when supported; otherwise explicitly leave them unestablished.
  Separate hypotheses from proof.
- **Next static action and completion evidence:** a concrete REA/Ghidra entry,
  range or reference query and the boundary/ownership/value/consumer proof it
  should establish. State necessary inputs, prior attempted profile/results,
  any blocker and what must change before retrying a failed approach.
- **State and follow-up:** actionable, blocked, classified supporting context,
  excluded or resolved, with evidence for transitions and links to any resulting
  AS system/gap. Keep separate source, build/runtime and parity requirements.
  Resolved classification is not proof of implemented behavior or gameplay parity.

Keep CURRENT-STATE concise and source/recovery-only: link the queue, identify actionable classification/
recovery work and material blockers, and retain #41 while native unknowns remain.
Update the owning system/claim records when a lead actually establishes a
relevant connection. Reuse an existing gameplay gap for the same issue; append a
new permanent gap only for a distinct finding. Preserve resolved/context entries
and their evidence so the next scan does not rediscover or silently lose them.

`$fixgap` reads this queue when presenting #41. Bounded classification of an
unestablished lead is eligible before its gameplay meaning or source owner is
known. Omit entries whose sole remaining question is newest-target proof or
registration for an existing implementation; an open queue state alone does
not make them selectable. Selection authorizes the stated static investigation
and necessary references, not a sweep of all unknown bytes. If the lead proves
to be generic engine logic, retain the result as supporting context and stop
that branch. Cooperative client/network/server logic is in scope. If an AS
connection is established, trace the relevant contract and follow the user's
selected recovery/repair scope, including
[additional AS repairs found along the way](../SKILL.md#additional-as-issues-found-during-a-repair)
when current EXE evidence proves the defect and required behavior. Such repairs
need no further selection; explicit investigation-only limits still apply.
If it remains unclassified,
preserve the exact remaining question and exhausted route or blocker; do not
invent semantics or close #41. Known engine completeness remains outside
`$fixgap`; co-op source implementation is included without running a server.

## Changelog and completion

Index every supplied paragraph/bullet/table claim with a stable identity and
original-text hash. Keep UI/UX, client/engine, input, audio and native platform
obligations visible. Browser-only claims remain explicitly scoped to a different
artifact; do not silently count them as covered by the desktop EXE. Preserve
superseded/uncertain applicability instead of reinstating old balance rules.

Release crosswalk links are context. A claim needs its own current native/source
evidence before it can be marked recovered or implemented. Match an exact source
consumer to its system record, retain its actual target provenance and record
source/recovery, static validation, runtime validation and parity independently.
Closing a path-accounting defect does not close those underlying behaviors.
