# Optional REA/Ghidra setup

REA/Ghidra is optional tooling for recovering behavior; it is not needed to build
or run the app. REA **6.5.0** is pinned in the npm lockfile. Use `./scripts/rea`
for REA commands so downloads, caches, analysis and temporary files stay in the
active checkout. Linked Git worktrees are allowed under [AGENTS.md](../AGENTS.md#workspace-boundary);
completion includes removing unneeded disposable outputs and unused worktrees.

Repeated EXE audits use the [dependency runner and incremental cache contract](analysis/execheck-performance.md).
It preserves the audit scope while reusing verified stages, Program work and
instruction/search facts; timings remain separate from evidence hashes.

## Requirements and scope

- REA lives in `node_modules/rea-agents`; `package.json` and `package-lock.json` reproduce that installation.
- Node **22.22.3** is pinned by `.nvmrc`. The launcher uses `REA_NODE_BINARY`, that version under the current user's NVM installation, or `node` on PATH. REA supports Node 22.19+, 24.11+, or 26+ in their release lines.
- Ghidra **12.1.4** lives in `.tools/ghidra/ghidra_12.1.4_PUBLIC`. The installer downloads the official release and builds missing native components for this Mac with Ghidra's Gradle wrapper.
- A full Java **21** JDK and native build tools are required. Use `REA_JAVA_HOME` to select a compatible JDK. The launcher can also locate the conventional Temurin installation on macOS. Installing REA does not install or change Node or Java.
- Optional MCP registration uses the tracked `.codex/config.example.toml`. Copy it to `.codex/config.toml` and set `command` and `cwd` to the absolute paths for your checkout. The actual registration stays local and ignored; existing local configuration is preserved.
- The matching REA workflow and references are tracked in `.agents/skills/reverse-engineer-anything`.

The launcher sets project-local temporary, cache, config, data, state, browser, and bridge paths without changing the shell's `HOME` or `CODEX_HOME`. Ghidra uses an isolated subprocess home beneath the local runtime directory. JVM shared performance-data files are disabled. The launcher blocks REA's whole-client `setup`, `update`, and `uninstall` commands, which can change user-level configuration. Update the pinned package, lockfile, bundled skill, and project configuration together instead.

Use **Ghidra** for native analysis. Hopper is disabled because its macOS provider hardcodes a path in `/tmp`, outside this project's workspace boundary. The installed EXE/Data configured by `.codex/reference-game.json` are authorized read-only inputs; read them in place. Keep Ghidra databases, extracts, evidence and other outputs inside this checkout. The configured provider is a tool for investigation; its pseudocode is not original source code.

## Reproduce the installation

Run these commands from the checkout root with supported Node/npm, Python 3, a full JDK 21 and native build tools available:

```sh
mkdir -p runtime/tmp .cache/npm
TMPDIR="$PWD/runtime/tmp" npm ci --ignore-scripts --cache "$PWD/.cache/npm"
python3 -B scripts/repair-rea-reference-input.py --apply
python3 -B scripts/repair-rea-durable-queries.py --apply
python3 scripts/install-ghidra.py
```

The installer downloads `ghidra_12.1.4_PUBLIC_20260921.zip` into `.cache/downloads`, verifies the official release asset's SHA-256, extracts it under `.tools/ghidra`, and builds missing native components using project-local build caches. It does not install software in system directories. Its pinned digest is:

```text
ddac49f903da9d5bac833e5cc79395098b9c33cfd3279be5f31bd00387d2d4db
```

For an alternative existing JDK, pass `--java-home /absolute/path/to/jdk` to the installer and set `REA_JAVA_HOME` when running the launcher. The JDK and Ghidra's native decompiler must match the host architecture.

REA normally snapshots binary inputs into its private session directory. The
pinned `repair-rea-reference-input.py` guard instead opens the configured
installed EXE read-only, verifies its expected SHA-256 and imports that path
directly. It covers the standalone Ghidra API and bundled CLI/MCP code; ordinary
project-local raw-range inputs retain private snapshots. `scripts/rea` refuses to
start without this repair and supplies the local reference configuration. Start a
fresh MCP process after applying it. No installed file is modified. Earlier
census profiles retain their actual private-snapshot provenance; the guard does
not change evidence already collected.

## Retain and consolidate analysis exports

Retain unique historical extracts and census data when the matching EXE is no
longer available. These inputs are not required to build the game. Reuse useful
installed tools and compatible active build caches; remove obsolete or duplicate
builds and finished analysis output under the
[storage and completion cleanup rules](../AGENTS.md#storage-and-completion-cleanup).
After verifying an installation, remove its unneeded download/staging archive.
Keep unfinished query/census journals, needed results and persistent Ghidra
Programs that matching queries actually reopen/resume to save analysis time.
Reproducible imports can still be useful reusable work. Remove superseded profiles
and scratch data the tooling recreates without reusing, after checking consumers.
If removing a Program, invalidate its bootstrap/ready markers so a later query
reimports it correctly. Preserve required unique evidence and all useful
documentation; remove unneeded session snapshots, raw responses and attempt logs.
Ignored `runtime/` output is not permanent storage by default.

### Shared analysis workspace

All workflows use one project-wide `runtime/analysis/` workspace. Its
`knowledge.sqlite` catalog records native inventories, immutable objects,
completed operations, provenance and Program archives across targets. Equal
payload bytes occupy one content-addressed object even when several targets or
tasks reference them. Task directories hold journals and references, not another
independent imported binary. See the
[storage architecture and migration tools](analysis/shared-analysis-storage.md).

Query launchers lease a compatible shared Program; compatible seed additions
extend its saved state. Conflicting code/function boundaries require an explicit
`REA_PROGRAM_VARIANT`. The full-image runner retains frozen per-plan exports and
checkpoints while reusing the underlying compatible decoded Program. Changed
binary bytes require a new Ghidra Program for the installed target. Older
findings and exports remain searchable through the same catalog after their
Programs are retired.

### Reuse documented and saved analysis

Start with the relevant finding in [current state](CURRENT-STATE.md), its owning
report and the [evidence index](analysis/README.md). The agent reads those documents
and applies their target/hash-bound findings to the next investigation; REA does
not automatically ingest all Markdown. Reuse valid extracts and completed query
results, then ask REA only for missing or invalidated proof. Required whole-image
audit stages still run as specified by `execheck`.

The [query runner](../scripts/rea-batch.py) verifies saved operation arguments and
result hashes before returning completed results. The
[durable launcher](../scripts/rea-durable-queries.mjs) reopens a matching saved
Program and skips repeated import/startup analysis when its saved state is ready.
These results, Programs and inventories used by later recovery/checks are useful
retained work. Unused session snapshots, scratch output and unneeded attempt logs
can be removed after preserving their findings. Age alone is not a cleanup rule.

The [export storage index](analysis/evidence/native-export-storage.json) binds
identical large exports and input snapshots to their historical target and exact
SHA-256. One read-only copy lives under
`runtime/analysis/objects/<sha-prefix>/<file-sha>`; legacy
`runtime/analysis-exports/<target-sha>/<file-sha>` paths and earlier evidence
paths remain relative aliases. Existing report, plan and compressed-file hashes
remain unchanged. Identical bytes share storage across targets while their
separate target commitments remain in the catalog and historical index. The index is
textual provenance, not a backup of the ignored payloads: preserve the shared
archive with the rest of the local recovery evidence.

```sh
python3 -B scripts/consolidate-analysis-exports.py
python3 -B scripts/consolidate-analysis-exports.py --apply
python3 -B scripts/consolidate-analysis-exports.py --scan > runtime/proposed-export-storage.json
python3 -B scripts/test-analysis-export-storage.py
```

Default operation verifies all indexed bytes without writing. `--apply` replaces
only verified copies and can restore a missing alias from the retained archive.
`--scan` prints proposed additions within explicitly target-bound analysis roots;
review them before updating the index. It skips databases, tool/dependency/build
caches, small files and unique payloads. These operations need no reference EXE,
Ghidra, compilation or game launch. Run fresh recovery into a new output directory;
do not overwrite read-only historical aliases. Symbolic-link support is needed
only for local analysis storage, not for building or distributing the source.

## Check and use REA

```sh
./scripts/rea --version
./scripts/rea providers --format json
./scripts/rea doctor --provider ghidra --format json
python3 scripts/verify-rea.py --native
```

The verification script checks the MCP transport and, with `--native`, native analysis. Raw installation-verification output belongs under `runtime/tool-state/verification`; a tool handshake/probe is not recovered game behavior and is not a tracked deliverable.

For a target already inside this repository:

```sh
./scripts/rea analyze "$PWD/targets/program" --provider ghidra --format json
./scripts/rea decompile "$PWD/targets/program" 0x1000 --provider ghidra --format json
```

Replace the example target and address with the actual binary and function address. Save intended analysis reports inside the project and commit them with the related work.

## Batch a scoped native investigation

Use `./scripts/rea query <plan.json>` (equivalently
`python3 -B scripts/rea-batch.py <plan.json>`) for one or several static queries.
`fixgap` and `execheck` use this route for individual searches and
decompilation too. A plan's `target` may be
`installed-game/AzerothSurvivors.exe`, resolved through the ignored input
configuration. Output must remain under project `runtime/`.

The runner atomically saves a hash-bound operation journal, complete successful
results, raw JSON-RPC responses and attempt logs. Timeout, provider-timeout and
transport/process failures automatically reopen the target and retry the
unfinished query, with three attempts by default (`--retry-attempts`). Completed
queries are reused after digest verification. Repeating the same plan/output
resumes it; `--resume` requires an existing journal. Without an explicit output,
the plan name/content selects a stable project-local directory. Changed targets,
plans, tools, seeds or effective profiles require a new output; earlier evidence
is preserved. User cancellation and permanent errors retain progress without
automatic retry. `stop_on_error: false` may continue independent operations after
an exhausted/permanent error, while the overall run remains failed.

The launcher retains a leased writable Ghidra Program beneath
`runtime/analysis/programs/`, outside disposable MCP session directories. Earlier
`runtime/ghidra-queries/` locations are adopted through verified legacy aliases.
Task and seed filenames do not choose another import. Compatible code/function
seeds are checked against actual instruction ownership before extension;
conflicts require an explicit experiment variant. Import and preparation are saved before automatic analysis;
analyzed readiness is established by saved Program options. A resumed ready
Program skips repeated startup analysis. Successful native results are bound to
the target, profile and database revision; static workflow profiles reject native
annotation/rename mutations. Search matching saves verified 1,024-entry batches
and resumes after the last committed batch. Initial inventory construction,
an analyzer's internal task and one function decompilation are atomic: unfinished
units retry from their beginning. Completed queries and saved Program facts are
retained. A Program lease prevents simultaneous writers, and owned-process
records permit validated orphan cleanup.

The shared native queue admits two workers across chats and delegates. Whole-image
queries and current census runs reserve both slots. Query plans wait for capacity
and compatible requests before timed provider calls, then reuse verified results
without starting Ghidra when possible. Waiting does not consume a native retry.
Batch related known queries in one plan to reuse the open bridge. Matching queued
consumers keep a raw Program hot; the final consumer returns it to cold storage.
Do not bypass the queue by importing duplicate Programs or changing variants.

Original Evidence IDs and profiles remain in saved result files. Session-ledger
views are fetched fresh, rather than replayed as a new session's ledger; use the
retained files/bundles for earlier-session Evidence. An exhausted retry budget
is a retained failure for diagnosis, never successful analysis. No game target
is executed by this workflow. Full-image census uses its separate durable runner.
See the [recovery contract and interruption proof](analysis/ghidra-query-recovery.md).

### AS candidate graph and review queue

`scripts/compose-as-discovery.py` composes selected native/reference/data
observations, source candidates and exact unknown selectors into one immutable
profile under `runtime/coverage/<sha>/as-discovery/<profile>/`. It launches no
native query or application. Use the [selected graph record](analysis/coverage/as-discovery.json)
for input/artifact hashes, population counts and exact reproduction commands;
[the audit](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/execheck-0.115.0.md#as-discovery-frontier-and-reporting-limits)
records the six stages' separate limits.

`--write` retains graph, queue and journal; `--check` recomposes the same exact
inputs and rejects changed saved status. Changed collector/helpers, inputs,
source or query/result commitments select a different profile. Explicit reviews
require checked source-first, target, query and result receipts; canonical
exports remain distinct from raw query results. With the explicit
`--retain-stale-source-reviews` option, source drift preserves the original
review and current source receipt as `pending_source_revalidation` with unknown
ownership. Target/query/result drift still rejects admission. A result declared
only elsewhere in a manifest retains `pending_query_result_linkage`; a sibling
query's export cannot certify the selected query. Optional explicit
`finding_bindings` attribute exact selectors to numbered findings using
target/proof commitments, while preserving pending state and unknown ownership.
Structural or lexical edges never establish AS ownership or semantic closure.

Raw-slice query subjects require an explicit x86-64 mapping. The shared
`discovery_native_subject.py` validator checks their original PE bytes, virtual
base and contiguous range against the installed target, then verifies the
provider/profile, plan, completed operation, journal and saved result. The raw
subject keeps its own digest; it is never relabelled as the full EXE. This input
binding does not establish semantic applicability, external-body coverage or
runtime behavior. Full-PE admission retains its separate target binding.

`pending_correspondence_leads` retains stable earlier questions when a newer
target's native location has not yet been mapped. Admission checks the current
target, exact predecessor question/range, current source receipts and proof
digest. The graph labels the range as historical and keeps the question pending;
it neither promotes the old address nor resets recovered semantics/source work.
When a current candidate table is located, a separately hash-bound current-target
proof can retain that candidate beside the historical range without resolving
ownership, semantic/source applicability or the prior question.

Run `python3 -B scripts/test-as-discovery.py` for non-compiling admission,
profile, alias and concurrent-input regression fixtures, and
`python3 -B scripts/test-discovery-native-subject.py` for whole-PE/raw-slice
input, mapping and query-receipt rejection cases. This registry does not
replace the journaled Ghidra query runner or full-image census and does not
certify completion, executable behavior or parity.

The [first gameplay plan](analysis/native-pass1-plan.json) and [PE-address seeds](analysis/native-pass1-seeds.tsv) reproduce selected function queries for the supplied EXE. Run it with a new local output directory:

```sh
python3 scripts/rea-batch.py docs/analysis/native-pass1-plan.json \
  --output runtime/rea-gameplay-rerun
```

The plan can configure only `REA_GHIDRA_STARTUP_TIMEOUT_MS`,
`REA_GHIDRA_SEED_FILE`, `REA_GHIDRA_DISABLED_ANALYZERS` and `REA_PROGRAM_VARIANT`. These overrides apply
to that child process; they do not edit Codex or user-level registration. The
shared launcher enables the guarded durable-query repair by default. Ghidra
starts lazily on the first deep query, whose deadline must cover any unfinished
import/startup work; increasing only `open_timeout` is insufficient. The retained
Program prevents successful import/preparation and completed ready analysis from
being discarded between attempts.

A fresh or preparation-changing whole-image query must set the top-level JSON
option `"allow_full_image_analysis": true`. Check retained native evidence and
ready compatible Programs first. Raw bounded queries need no such option.
After a producer update, keep the original plan/journal/results and use a new
`--output` for subsequent work; the existing compatible Program is reused.

MCP initialization has its own deadline: `init_timeout` in the plan, or
`--init-timeout` on the command line (seconds, default 30). It is separate from
`open_timeout`, operation timeouts and Ghidra startup. Selected 0.100.1 raw-slice
investigations use 60 seconds for initialization while retaining bounded
operation deadlines and project-local output. A longer initialization deadline
does not repair a failed provider or justify repeating an unchanged failed plan.

The original full default analysis of the 130 MB EXE reached REA's 330-second startup deadline. The scoped plan disables expensive automatic discovery/analysis and explicitly seeds both function candidates and code decoding at selected addresses. A seed is an analyst-selected address, not a recovered source name. Reduced discovery also limits caller/callee/reference completeness; an absent relation in this profile does not establish absence in the program.

The 0.105.0 whole-image census also reached a **600-second** Ghidra startup
deadline before discovering a procedure queue with its bounded analyzer profile.
Its failed profile remains visible in the project-local census progress report.
Focused raw-function imports continue to work. Use decoded diagnostic leads to
choose bounded native owners; a successful slice does not replace whole-image
reference discovery or certify the omitted engine/data regions.

Analyzer names must be registered for the actual target. The x86 exception-handling and post-search analyzer names are unavailable for this x64 PE and must be omitted from its profile. Inspect fresh failures under `runtime/`; do not retain full diagnostic dumps in documentation or repeat an unchanged failed profile.

The [0.107.0 native census](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.107.0.md) diagnoses two
separate whole-image limits: address-table analysis reaches its startup deadline,
while disabling it permits complete procedure discovery but leaves placeholder
bodies when entry-point disassembly is also disabled. The separately named
`full-image-entry-decoding` profile enables that analyzer; global decoding/body
repair still exceeds its recorded deadline. Completed queries and discovered
functions must therefore remain distinct from decoded instructions and complete
native bodies. The bounded diagnostic-owner full-PE probe is additional evidence,
not a substitute for that global gap.

Large completed MCP results can exceed the transport budget without losing
retained Evidence. The census exports that exact Evidence on the same connection,
validates its ID/target/profile and loads it locally without a row cap. Imported
`EXTERNAL:` procedures are preserved separately from native body queries. See
the owning census report for reproducible commands, exact profiles and limits.

### Selected full-PE body recovery

REA 6.5.0's seed script leaves a PE loader's existing one-address function body
unchanged after decoding its code seed. `scripts/repair-rea-seeded-bodies.py`
applies a small project-local repair to the pinned npm dependency: after decoding,
Ghidra recalculates selected bodies from control flow. The repair does not assign
unwind extents as function bodies. It rejects unknown dependency contents and is
safe to apply again; `npm ci` restores the upstream files.

```sh
python3 -B scripts/repair-rea-seeded-bodies.py --apply
python3 -B scripts/census-current-target.py --run --full-profile full-image-diagnostic-owner-repaired --limit 59 --startup-timeout 600
python3 -B scripts/summarize-seeded-census.py --write
```

Use the existing Python environment containing Capstone for the summarizer.
It checks exact selected-image ranges and independent instruction boundaries;
its default mode checks the existing summary without changing it or starting REA.
The reviewed 0.113.2 scope includes 59 custom paths: the five co-op paths remain
discovery-only, and `realmd.rs` is present again after its absence from 0.113.0;
the selection ceiling rejects further scope growth until reviewed. The census
selects one minimum verified owner for **every current custom
diagnostic path**, with a separate resumable queue and exact seed/tool hashes.
`--limit` bounds completed query sets per invocation. Transiently failed sets
resume automatically; `--retry-errors` also admits other retained failed sets.
Earlier attempt files remain available. The first deep query includes
the Ghidra startup deadline, even on a resumed queue. Completed queries remain
separate from decoded instructions and complete bodies.

The repair's `rea-ghidra-seeds-body-repair-v1` seed-format marker enters the
REA analysis-profile digest, separating repaired observations from upstream
profiles. Both REA's standalone module and bundled CLI/MCP entrypoints receive
the same marker. Start a fresh `./scripts/rea mcp` process after applying the
repair; already running processes retain the old schema. The census runner
starts a fresh process itself. Analyzer exclusions are applied before seed decoding, since
Ghidra's disassembly helper can run pending analysis during a pre-script.
This selected profile also disables `Call Convention ID`, whose
automatic decompilation examines unrelated full-PE functions. Calling conventions,
unseeded callers, indirect targets and disabled analyzer results remain unknown.
Full-PE address context is preserved; this selected queue does not replace the
global native census or establish source ownership or gameplay parity.

An independent declared-unwind instruction census now covers all 346,904
0.107.0 extents without claiming semantic ownership. The sixteen entries missing
from full-image discovery also have a separate hash-bound Ghidra raw-range probe,
prepared by `scripts/prepare-omitted-native-entries.py`. All sixteen analyzed
bodies match their declared extents and independent decoder boundaries; PE
imports, global callers and source ownership remain unknown for that raw import.
One selected entry is a legitimate one-byte `RET`, so collector metrics retain
one-byte body sizes without automatically calling them placeholders.

The isolated `full-image-entry-decoding-extended` census profile defaults to a
6 GiB heap; pass `--startup-timeout 1800` to reproduce its observed resource
bound. This 0.107.0 attempt also reached startup timeout (1,801.922 s) without a
completed inventory or body query. It does not replace the previous failed
2 GiB profile, and changing a saved profile's heap is rejected on resume.

The [historical 0.108.0 census](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.108.0.md) independently
refreshes all declared-extent decoding, full-PE procedure discovery and the
sixteen omitted-entry raw probe. Historical 0.107.0 profiles above retain their
actual target hash; their timeout/bounded outcomes are not current EXE proof.

### Whole-image streaming recovery

The active reconstruction scope is Azeroth Survivors custom systems and deltas
over the existing public benilla/wenilla source. The commands in this section
document completed coverage tooling and reproducibility. They are not a mandate
to reconstruct generic engine/compiler/graphics/Windows internals. Start further
native recovery only for a concrete Survivors-specific contract or dependency.
The selected `full-image-selected.json` profile remains valid supporting
evidence even when later generic exploratory proposals are left unapplied.

The [historical 0.109.0 census](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-census-0.109.0.md) introduced
streaming instruction/body/reference exports. The current runner uses REA's
inspected Ghidra JVM launcher and owned-process controls, with a writable project
under its ignored census output. Import happens once; subsequent workers open
the saved Program with `-process`. It does not put the entire analysis behind an
MCP bridge startup deadline or discard the database when a process closes.
Native library loading, ordinal lookup and sibling/project library searches are
disabled; the configured EXE is read directly, without loading sibling DLLs.

The Java collector decodes requested starts in batches, recalculates actual flow
bodies and streams gzip instruction/body/reference/external inventories. It never
assigns unwind extents as bodies or treats code-only destinations as functions.
The legacy launcher hook remains inert outside its explicitly selected profiles;
historical executions retain their original tooling and limits.

To replay an expanded census after a fresh scan has updated the current
complement inventory, pass `--complement-inventory <retained-inventory>` to
`scripts/summarize-native-image.py`. The verifier requires the original
inventory digest from the frozen plan. Keep the current inventory available to
other readers while verifying the saved census against its own seed input.

```sh
python3 -B scripts/repair-rea-reference-input.py --apply
python3 -B scripts/repair-rea-native-census.py --apply
python3 -B scripts/census-native-image.py --run --seed-scope declared --output runtime/coverage/<target-sha>/ghidra/declared
python3 -B scripts/summarize-native-image.py --input runtime/coverage/<target-sha>/ghidra/declared --write
python3 -B scripts/census-native-image.py --run --seed-scope all --primary-summary runtime/coverage/<target-sha>/ghidra/declared/summary.json --output runtime/coverage/<target-sha>/ghidra/integrated
python3 -B scripts/summarize-native-image.py --input runtime/coverage/<target-sha>/ghidra/integrated --write
python3 -B scripts/recover-native-jump-tables.py --census-summary runtime/coverage/<target-sha>/ghidra/integrated/summary.json --summary-output runtime/coverage/<target-sha>/ghidra/integrated/jump-summary.json --write
python3 -B scripts/census-native-image.py --run --seed-scope all --primary-summary runtime/coverage/<target-sha>/ghidra/declared/summary.json --jump-tables runtime/coverage/<target-sha>/ghidra/integrated/jump-summary.json --output runtime/coverage/<target-sha>/ghidra/guarded
python3 -B scripts/summarize-native-image.py --input runtime/coverage/<target-sha>/ghidra/guarded --write
```

Replace `<target-sha>` with the selected installed hash. Use a new output
directory for every changed input/profile; completed plans and summaries remain
immutable hash commitments. The `all` queue requires the independently verified
declared-body summary and current complement inventory: it adds direct targets
and every relocation-backed executable pointer outside those bodies. The default
heap is 6 GiB and batch size 1,024. Automatic analysis stays disabled. The
watchdog measures absence of native/checkpoint/export progress (600 seconds by
default), rather than total productive analysis time. It retains diagnostics and
retries interrupted workers automatically from the saved Program. Three
consecutive attempts without useful cursor advancement retain the failure and
database for diagnosis; they never produce a successful census record.

Each completed native batch stores its cursor and analysis mutations in the same
Program transaction and calls Ghidra's `saveProgram` before publishing the JSON
journal. On reopen, saved Program options are authoritative; `progress.json` is
a display copy. Direct-call helper identities and counters survive restart too.
An exception rolls back the unfinished batch. The durable supervisor currently
uses POSIX advisory locking; it is optional tooling, separate from game builds. Completed gzip exports are renamed
atomically and hash-committed; only an interrupted/uncommitted export is
regenerated. Full-image byte/seed/tool/profile hashes must match before resume.
A legacy counter-only run cannot be resumed because it has no saved database.

Repeat the same `--run` command to resume its existing durable output, or use
`--resume --output <same-directory>`. Do not edit its frozen plan or collector
sources to force a mismatch through. Changed target/seed/tool/profile inputs
require a new output; preserve the earlier evidence. `--checkpoint-limit 1`
provides a controlled stop after a saved batch for resume verification. This is
static Ghidra work; it neither compiles nor launches the reconstructed game.

Use an existing Python environment containing Capstone 5.0.7 for the summaries
and proof helpers. The summarizer checks every exported instruction's bytes and
length against the installed image, exact seed sets and artifact hashes. It also
subtracts the observed instruction union from every executable section and
preserves unobserved ranges inside/outside declared extents. Padding classes
remain candidates.
Default verification compares derived gzip contents without rewriting the
retained artifacts. Only `--write` publishes missing or changed derivations;
identical content preserves its original compressed bytes and hashes, while new
content uses deterministic gzip headers. The verifier records its own tool
identity separately from the original collector's plan and inputs.
`recover-native-jump-tables.py` accepts explicit unsigned selector bounds, a
preserved static base and the exact signed-relative dispatch idiom in immutable
data. Scalar bounds also include full-width contiguous low-bit AND masks,
zero-extended byte/word domains, logical right shifts, SETcc with proved upper
bits and exact literal selectors. Singleton literals remain singletons; sparse
masks and disjoint wrapped domains stay unknown. Backward transfers invalidate
lexical selector/base values. Every inferred scalar-domain table is retained
whole: one target inside an established instruction or without an independent
boundary rejects the entire table into the candidate inventory. Exact current
linear-extent byte/boundary commitments are retained separately. High-byte
CMP aliases and 32-bit address overrides cannot narrow a 64-bit table access.
Recovered successors apply only to the proved fallthrough path; incoming contexts
and compiler enum/type invariants remain open. A follow-up pass requires an
actual scoped recovery need; a larger generic candidate count is not one.
Use `recover-native-jump-tables.py --census-summary <verified-summary> --write`;
compare the resulting site/target pairs with the preceding pass. For an admitted
Survivors contract, follow required targets or edges before claiming that contract.
Keep the
verified primary summary and its exact original full snapshot: expanded seed
plans may refer to either recorded primary-summary digest. Curated summaries
retain compact counts and exceptions; full diagnostic lists stay in runtime.
Use unique `--inventory-output` and `--summary-output` paths during exploratory
rescans. Each new census copies exact hash-committed proof bytes into its own
runtime directory before selecting seeds; later rescans cannot alter that input.
The diagnostic preparer accepts `--inventory-output`; operand, address-code,
import-thunk and unwind helpers accept both output options. Put a new target's
proofs in a separate project-local directory and pass those exact summaries to
the census. Their defaults remain compatible with earlier commands; an earlier
target's proof must never be overwritten or relabeled as current evidence.

After switch edges stabilize, `prepare-native-diagnostic-leads.py` partitions
verified diagnostic sites into actual owners, exact decoded instructions,
instruction-interior conflicts and nonconflicting undecoded code. Only the last
category supplies additional code starts; it supplies no incoming edge or
function entry. For example, after preparing leads from the verified guarded
summary, use its runtime inventory in a fresh pass:

```sh
python3 -B scripts/prepare-native-diagnostic-leads.py --census-summary runtime/coverage/<target-sha>/ghidra/guarded/summary.json --write
python3 -B scripts/census-native-image.py --run --seed-scope all --primary-summary runtime/coverage/<target-sha>/ghidra/declared/summary.json --jump-tables runtime/coverage/<target-sha>/ghidra/integrated/jump-summary.json --diagnostic-leads runtime/coverage/<target-sha>/ghidra/guarded/diagnostic-code-leads.json --output runtime/coverage/<target-sha>/ghidra/diagnostics
python3 -B scripts/summarize-native-image.py --input runtime/coverage/<target-sha>/ghidra/diagnostics --write
python3 -B scripts/recover-native-jump-tables.py --census-summary runtime/coverage/<target-sha>/ghidra/diagnostics/summary.json --summary-output runtime/coverage/<target-sha>/ghidra/diagnostics/jump-summary.json --write
python3 -B scripts/prepare-native-diagnostic-leads.py --census-summary runtime/coverage/<target-sha>/ghidra/diagnostics/summary.json --write
```

Publish only switch proofs actually applied in the selected census. Do not
replace its exact applied snapshot with a later exploratory proposal. A zero
diagnostic seed count only means all exact sites decode; decoded blocks can
still lack proved incoming ownership. Direct CALL destinations are followed to
a separate fixed point and reconciled against final bodies after primary repair.

Address-taken import thunks and explicit PE metadata supply further bounded
entry classes. Recover them against a verified profile:

```sh
python3 -B scripts/recover-native-import-thunks.py --census-summary runtime/coverage/<target-sha>/ghidra/diagnostics/summary.json --write
python3 -B scripts/recover-native-unwind-handlers.py --census-summary runtime/coverage/<target-sha>/ghidra/diagnostics/summary.json --write
python3 -B scripts/check-native-volatile-metadata.py --output runtime/coverage/volatile-metadata.json
```

The first helper requires exact RIP-LEA sources on actual Ghidra instruction
boundaries and an executable JMP to a declared IAT slot. The second follows
AMD64 version-1 handler RVAs, chained records, executable export/entrypoint/TLS
addresses and present guarded-entry/pointer tables with size/count bounds. It
does not infer language-specific handler payloads or force bodies to unwind
extents. Add both `--import-thunks runtime/coverage/<target-sha>/ghidra/diagnostics/lea-import-thunks-summary.json`
and `--unwind-handlers runtime/coverage/<target-sha>/ghidra/diagnostics/unwind-handlers-summary.json` to a
fresh all-seed census command, retaining the final switch and diagnostic inputs.
Verify its new summary, then rescan again until the applied edge digest agrees.

Ghidra's disabled Data Reference analysis omits many LEA address expressions.
`audit-native-operands.py` therefore inspects every verified instruction, including
outside-unwind code, and compares explicit source/target pairs with the complete
Program reference export. It retains static memory/address expressions and
mapped numeric candidates separately from register/index/segment-dependent
operands. Address relations gain no inferred READ, WRITE or CALL semantics.

```sh
python3 -B scripts/audit-native-operands.py --census-summary runtime/coverage/<target-sha>/ghidra/pe-entries/summary.json --summary-output runtime/coverage/<target-sha>/ghidra/pe-entries/operand-summary.json --write
python3 -B scripts/recover-native-address-leads.py --operand-summary runtime/coverage/<target-sha>/ghidra/pe-entries/operand-summary.json --write
```

The address helper requires exact independently verified RIP-LEA sources and a
coherent code graph or already verified boundary at the executable target.
Source body ownership remains separate. Entire instructions must stay
inside one contiguous executable file-backed mapping. Established-boundary and
cross-candidate conflicts are rejected; open computed exits retain their alias
limits. Add `--address-leads runtime/coverage/<target-sha>/ghidra/pe-entries/address-code-leads-summary.json`
to the next fresh all-seed census. These starts seed code without creating
function entries or incoming edges. Already verified target starts stay in the
code-only queue when a fresh import repeats it. Strong function-entry seeds
always decode before extra code-only targets.

After that pass verifies, repeat the full operand audit against its new summary.
`audit-native-constant-dispatch.py` separately follows immutable register values
into CALL/JMP with all memory/slot reads disabled. Follow scoped Survivors
constant-CALL entry leads and required jump edges before claiming those contracts;
initial import/vtable values cannot substitute for that proof.

`classify-native-ownership.py` audits indirect opcodes, declared imports, encoded
pointers and all diagnostic/source candidates. `revalidate-historical-native-ranges.py`
checks historical range commitments, reconstructs only hash-matching canonical
ASM/JSON/native-range artifact/UTF-8 preimages and searches the whole selected
image for exact relocated sequences.
These tools record unresolved source revision, aliasing and behavioral contracts
separately. No body count, exact short byte match, vendored path or import binding
establishes gameplay or parity.

Bind all final derivatives to the same independently verified report before
publishing the atomic selector. Stage candidates under `runtime/coverage/` and
promote the reviewed summary to `full-image-selected.json` before binding the
final derivatives:

```sh
python3 -B scripts/audit-native-operands.py --census-summary docs/analysis/coverage/full-image-selected.json --summary-output runtime/coverage/selected-operands.json --write
python3 -B scripts/audit-native-constant-dispatch.py --census-summary docs/analysis/coverage/full-image-selected.json --write
python3 -B scripts/audit-native-dispatch.py --census-summary docs/analysis/coverage/full-image-selected.json --write
python3 -B scripts/classify-native-ownership.py --census-summary docs/analysis/coverage/full-image-selected.json --operand-summary runtime/coverage/selected-operands.json --write
python3 -B scripts/revalidate-historical-native-ranges.py --census-summary docs/analysis/coverage/full-image-selected.json --write
python3 -B scripts/summarize-custom-native-coverage.py --site-role-proof docs/analysis/evidence/native-custom-site-roles.json --write
python3 -B scripts/check-full-image-native.py --write
python3 -B scripts/check-reconstruction-coverage.py
```

For a newer target without a current semantic classifier, use
`summarize-custom-native-coverage.py --census-summary <current-verified-summary> --write`
to join its independently verified native bodies and diagnostics to reviewed
source candidates. Then run `revalidate-historical-native-ranges.py` with the same
explicit census and `--write`, followed by `audit-exe-connections.py --write` and
its read-only replay. The connection audit requires both parents to commit the
same current census and keeps any historical classifier as supporting evidence.
This diagnostic/source crosswalk does not certify native source equivalence or
create an atomic native selection.
The custom source join resolves renamed checker references through the tracked
script-provenance index. It records the original reference and the resolved live
candidate separately; hashing the current candidate never satisfies a historical
execution-source commitment.
Current bounded-contract bindings can constrain `bounded_contract_system_ids`
and record each `bounded_contract_owner_scopes` sub-contract. The connection
audit keeps other current references visible as supporting evidence, without
counting a shared report as an unrelated system's recovered contract.

Current selection checks exact target identity, record roles, generator and
available artifact hashes. Supporting profiles retain their executed tool/input
fingerprints. The selected jump summary must remain the exact applied
`jump-tables-input-summary.json` snapshot from its plan: the selected addresses
profile applied 3,355 tables, and later unapplied proposals do not replace it.
The optional executed-tool witness binds retained committed source to the exact
selected census and applied proof. It permits actual old execution provenance
without exempting current classifier/history/operand generators or artifacts.
Collectors/independent verifiers reject generator changes during
the run; freeze their scripts until the output finishes. Candidate source edits
require re-audit before exact-source claims and do not block unrelated work.

The AS-specific partition joins the 53 custom paths to exact current instruction
and body exports, retaining ownerless blocks and source-line/extent context.
It separates real Rust Location references from filename-proximity candidates.
The optional site-role proof validates exact adjacent-literal exclusions while
preserving every raw lead; literal candidates never establish source-body
ownership. `check-native-custom-site-roles.py --check-audit --negative-tests`
reproduces its current byte/descriptor contracts and rejection checks.
Its reviewed source projection uses only original paths, source references,
anchors and candidate hashes, so ledger counts/evidence links do not create a
hash cycle. Decoded filenames or partial source correspondence cannot certify
complete custom-system behavior. Existing mechanic-specific gaps own missing
Survivors contracts; generic engine unknowns remain supporting limits.

Non-compiling regression checks cover the input guard, seeded repair, interval
ownership, pointer propagation, guarded tables and historical byte admission:
`node scripts/test-rea-reference-input.mjs`, `scripts/test-native-image-census.py`,
`scripts/test-native-ownership-classification.py`, `scripts/test-native-jump-tables.py`,
`scripts/test-historical-native-ranges.py` and `scripts/test-full-native-accounting.py`.
`scripts/test-native-import-thunks.py` and `scripts/test-native-unwind-handlers.py`
cover the additional exact entry routes. `test-native-operands.py`,
`test-native-address-leads.py`, `test-native-constant-dispatch.py` and
`test-native-volatile-metadata.py` check explicit addresses, coherent code-only
leads, immutable dispatch and the compatible volatile layout. `audit-native-dispatch.py --census-summary
<verified-summary> --write` reproduces producer-shape and unowned encoded-flow
inventories; these observations do not certify type or alias semantics.
`test-native-scalar-aliases.py` checks exact register/lane/flag correlation and
`test-custom-native-coverage.py` checks the custom-only partition and source
projection without claiming source semantics.
The Python scripts run with
`python3 -B`; the two decoder tests require the Capstone environment above.

Raw protocol logs, tool-probe results, failures and bulk inventories stay under `runtime`. Retain only selected behavioral extracts and concise conclusions in `docs/analysis`, with target identity and analysis limits. The [analysis index](analysis/README.md) distinguishes native observations, embedded source/data, historical intent and unresolved fields.

## Curate shared native extracts

The shared menu, run, overlay, notification, enemy/guardian and passive extraction
helpers stage regenerated files under `runtime/analysis/staging/native-evidence/<version>/<scope>/`.
Review this local output before promoting it into `docs/analysis/evidence`.
Retained manifests use explicit `assembly` / `pseudocode` paths when a role shares
an extract with another scope; paths are relative to the manifest directory unless
they start with `docs/`. Keep the canonical file and its original target/byte hash.
A regenerated scope-local filename is not a reason to add a second tracked copy.
Application assets and fixtures intentionally generated by a helper remain governed
by their own source/test contracts.

## What is pushed to GitHub

Source, scripts, portable configuration examples, documentation, the bundled skill, package metadata, and lockfiles are tracked. Machine-specific registration remains ignored. `node_modules`, `.tools`, `.cache`, and `runtime` are ignored because they contain reinstallable dependencies, downloaded distributions, caches, and disposable output. The Ghidra archive is about 570 MB and exceeds GitHub's normal per-file limit; the tracked installer, release URL, and hash reproduce it instead. Commit intended evidence under `docs` so it is pushed with the project.

## References

- [REA installation and provider requirements](https://github.com/morluto/rea/blob/main/docs/installation.md)
- [Official Ghidra 12.1.4 release](https://github.com/NationalSecurityAgency/ghidra/releases/tag/Ghidra_12.1.4_build)
- [Codex MCP configuration](https://developers.openai.com/codex/mcp/)
