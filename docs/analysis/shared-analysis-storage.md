# Shared REA analysis storage

REA uses one persistent project workspace under `runtime/analysis/`. Task
journals, historical evidence paths and frozen census receipts remain available,
but no longer define independent stores of the same analysis payloads.

The [EXE audit runner](execheck-performance.md) uses this same catalog and CAS.
Its `execheck_stage_cache`, `instruction_fact_*`, `native_ownership_core` and
`historical_*` records hold stage seals, optional intrinsic facts, native
resolution and exact searches/preimages. They do not create
another analysis store or transfer current ownership/semantic claims across
targets. Pipeline metrics and logs remain separate runtime observations.
Native resolution binds the exact census, applied evidence, operand inputs,
decoder bytes/versions and helper sources. Source mappings and candidate source
files are validated on each join without rescanning native instruction/reference
streams. Dense boundary/operand audits do not require a persistent detail cache.

## Storage owners

| Component | Canonical owner | Reuse boundary |
| --- | --- | --- |
| Provenance, operations, objects, native snapshots, archive records | `knowledge.sqlite` | Project-wide, across targets |
| Immutable exports, results, historical input slices and compressed originals | `objects/<sha-prefix>/<sha256>` | Exact payload bytes; target applicability remains separate |
| Writable query/census Programs | `programs/` | Binary bytes, provider/processor/analysis mode and explicit incompatible variants |
| Native inventory receipts | `inventories/` and retained legacy paths | Target/tool-bound snapshot membership in the shared catalog |
| Indexed native query working set | `native-hot/` | One idle materialization plus actively leased users; shared across tasks |
| Ghidra installed datatype archive cache | `tool-cache/packed-db-cache/` | One expanded cache per installed `.gdt` input, with Ghidra's cross-process locks |
| Task progress | `tasks/` or retained historical task directories | Small journals, plans and references |
| Closed legacy recovery | `history/<category>/` | One category directory with opaque receipt IDs |
| Native admission and request contexts | `scheduler/` and `requests/` | Two shared worker slots, compatible-Program gates and verified pre-start cache pointers |

The files are local analysis state, not build inputs or GitHub deliverables.
Users still supply their MPQs; source builds do not require the reference EXE.
The local `recovery-layout.json` maps former loose paths to retained category
locations. Move only closed recovery whose consumers can resolve the new path.
Retain the exact payloads, target commitments and catalogued object links.
Use `python3 -B scripts/manage-runtime-layout.py --check` to check the root.
Use `--apply --check` to migrate inactive legacy output and resume an
interrupted relocation. The command preserves catalog aliases and relative
links. The root holds only the documented storage owners.

Closed narrative snapshots can be inspected with
`tar -tzf runtime/analysis/history/reports.tar.gz`. The archive records their
original paths and SHA-256 digests. Maintained reports live in `docs/analysis/`.

The primary checkout owns this project-wide workspace. Linked-worktree source
tasks route native operations through the primary checkout instead of creating
another local store; a direct attempt to create an independent worktree store
must fail with that route. Keep source edits/checks in their owning worktree.

## Query reuse and incremental Programs

`./scripts/rea query <plan.json>` uses `scripts/rea-batch.py`. Compatible requests
wait before timed provider calls and recheck the shared cache after the prior
owner finishes. Saved readiness, preparation and revision identify the
native analysis state. A completed operation is keyed by that state, native
producer commitments and operation arguments. A second task with the same query
receives the same verified stored object through its own small alias/journal.
The original Evidence IDs and provenance are retained; reuse does not claim a
fresh native execution or current session ledger. Session-dependent operations
are fetched fresh. A changed Program revision cannot replay a result from an
older revision as if it described the new state.

An exact ready request can return verified results without MCP/JVM startup.
The first native operation also publishes its cache result when preparation
starts lazily. Offline readiness reads take a shared Program lock; a live writer
or changed preparation prevents replay. Session-dependent operations still open
a live provider. Tool/input changes require a new task receipt, while preserving
the earlier journal and compatible Program.

The FIFO native queue admits two workers across all callers; whole-image queries
and current census runs reserve both slots. Locked tickets disappear after owned
process cleanup, and stale tickets are reaped before capacity is reused. Registry
and Program leases have distinct diagnostics; a Program wait releases the global
registry. Matching queued consumers keep raw Programs hot until the queue drains.
A fresh/preparation-changing whole-image query requires the explicit plan flag
`allow_full_image_analysis: true`; this flag does not establish permission for
unrelated discovery or change the separate census workflow.

The query Program key excludes task/output/seed filenames and launcher source
hashes. It includes binary identity, processor/raw mapping, Ghidra version,
loader/analyzer mode, extension identity and an explicit experiment variant.
Compatible seed additions are checked against actual instruction/function
ownership before they extend the Program. Conflicting boundaries fail closed;
use a named `REA_PROGRAM_VARIANT` only for a deliberate incompatible experiment.
Never avoid that check by overwriting another task's saved Program.

Full-image census passes preserve frozen inputs, outputs and exact completion
receipts. The shared collector can extend the underlying decoded state for a
new plan after its predecessor finishes; a different plan cannot take over an
unfinished checkpoint. Same-plan retries resume the saved cursor. Canonical
pass identity depends on native input hashes rather than task directory names.
Earlier exact collectors/driver commitments remain available for historical
resume; storage adaptation is not represented as a new native analysis pass.

After the census runner verifies completion against the saved Program, the REA
launcher publishes the frozen gzip exports to the object store. Each pass keeps
its original files as read-only hard links to the objects, so existing resume
checks and historical consumers still open the exact path and bytes they
recorded. Identical compressed bytes share an inode across passes and with
other object-store consumers. The collector writes new exports to staging
files before renaming them into place. Unfinished exports and the writable
Program remain separate from this immutable publication.

Completed replays open Ghidra read-only and verify the published progress
against its saved checkpoint and the exact exports. New work and partial
checkpoints use the writable collector. Frozen census inputs and selected
pipeline outputs use the same content store. The retained PE inventories use
transparent compression where supported, and their original paths still read
the exact committed JSON bytes. Mutable pipeline views can use APFS copy-on-write.

Keep full instruction exports for the current selected census and any distinct
declared or expanded pass the active audit reads. Keep a historical export
only when a retained comparison opens that exact instruction stream. The
historical byte-range audit reads function bodies from the current census, and
the target-refresh comparison reads the predecessor's PE summary and API
extract. The recorded 0.120.5 → 0.121.0 switch replay reads the 0.121.0
instruction stream and the 0.120.5 function bodies.

Keep the plans, completion receipts and other comparison inputs when retiring
an instruction stream. A retired pass remains historical evidence. Exact
completed replay of that pass requires its original export. Local
`census/retired-instructions.json` records retired canonical export hashes so
storage maintenance can distinguish intentional retirement from a missing file.

Keep reference streams for the active census passes and exact proof inputs
that name those streams, including historical data and residual checks. A
superseded pass whose reference stream appears only in its own completion
receipt can retain the receipt and drop the stream after checking for aliases
and stage-cache consumers.

## Across EXE updates

The catalog, content store and discovery interface span all versions. Equal
bytes share one physical payload even when their logical paths and target
provenance differ. Historical completed operations remain searchable by target,
address, operation and scope through `manage-analysis-store.py`.

Native linear decoding can reuse a retained extent when its raw bytes, virtual
address, extent boundary, decoding algorithm and Capstone version all match.
This reuses a decoding result, not a behavioral conclusion. Relocated or changed
functions remain correspondence questions until their required dependencies,
values, layouts and producers/consumers are mapped under the existing
[incremental recovery rules](../../.agents/skills/shared/autonomy.md#incremental-recovery-across-target-updates).
No content match transfers runtime validation or original/rebuilt parity.
Required whole-image scans and exact selected-target accounting still run.

Ghidra's writable state binds the imported executable's exact bytes, addresses
and analysis mode. Use full-EXE Programs for the registered installed target.
Across an update, compare the new image with the historical exports and stored
native facts. The audit still scans the new image and verifies the current
addresses and dependencies before applying an older conclusion.

## Native SQLite inventories

Historical native inventories are imported into compressed, content-addressed
row chunks in `knowledge.sqlite`, with independent snapshot membership and
metadata. Identical chunks share storage. Their exact original SQLite byte
streams are also retained once as compressed CAS objects because existing
evidence manifests commit to those original file hashes. Migration links the
verified compressed staging file into the CAS and releases the staging path.

Legacy `.sqlite` paths become small explicit receipts. Repository consumers use
`shared_native_inventory.open_readonly()` rather than opening those receipts as
raw SQLite. `coverage_common.file_sha256()` verifies the original compressed byte
stream for historical commitments. It does not substitute a newly generated
SQLite file's hash or claim an old producer ran against new bytes.

A bounded shared hot index retains normal indexed lookup performance. Active
readers hold leases; only inactive materializations are evicted. Native writers
append shared chunks directly and preserve committed partial progress without
rebuilding the hot index after each checkpoint. A resumed writer reads the
saved counts and at most one unfinished chunk per table.

## Migration, verification and recovery

Read-only audit is the default. Mutation modes verify commitments before
publishing aliases or removing expanded copies. Run commands from this checkout:

```sh
python3 -B scripts/manage-analysis-store.py
python3 -B scripts/manage-analysis-store.py --migrate
python3 -B scripts/manage-analysis-store.py --migrate-census-exports
python3 -B scripts/manage-analysis-store.py --consolidate-proof-files
python3 -B scripts/manage-analysis-store.py --consolidate-identical-legacy
python3 -B scripts/index-analysis-history.py --apply
python3 -B scripts/manage-analysis-store.py --verify
python3 -B scripts/manage-analysis-store.py --retire-stale-aliases
python3 -B scripts/shared_native_inventory.py
python3 -B scripts/shared_native_inventory.py --apply
python3 -B scripts/shared_native_inventory.py --verify
python3 -B scripts/manage-program-archives.py --historical
python3 -B scripts/manage-program-archives.py --retire-historical
python3 -B scripts/manage-program-archives.py --idle-slices
python3 -B scripts/manage-program-archives.py --archive-idle-slices
python3 -B scripts/manage-program-archives.py --sweep-ready-raw
python3 -B scripts/manage-program-archives.py --ensure runtime/path/to/project
node scripts/manage-ghidra-workspace.mjs --summary
node scripts/manage-ghidra-workspace.mjs --apply --summary
```

Search retained knowledge before issuing new native queries:

```sh
python3 -B scripts/manage-analysis-store.py --find-target <target-sha256>
python3 -B scripts/manage-analysis-store.py --find-text 0x140001000
python3 -B scripts/manage-analysis-store.py --find-sha256 <payload-sha256>
```

Immutable migration publishes one verified object and replaces copies with
relative aliases. Historical paths and their exact bytes remain readable.
Migration journals permit recovery after interrupted publication; use
`manage-analysis-store.py --recover`. The earlier curated native-export index
continues to verify its aliases into the shared object store.

On supported macOS filesystems, eligible large immutable objects also use
transparent filesystem compression through the installed `ditto`. Reads still
return the exact original bytes. Publication verifies hash, size and mode before
atomically replacing a file, and retains the replacement only if it uses fewer
blocks. Existing compressed archives and already-small/sparse allocations are
skipped. Other platforms retain ordinary objects. Audit or apply with
`python3 -B scripts/compress-analysis-objects.py [--apply]`; new eligible CAS
publications use the same optimization automatically.

Storage adapters do not rerun old native producers. The script-provenance index
binds replaced producers to exact committed Git source bytes, and the coverage
checker reports their historical status. Historical tool acceptance does not
make a new collector executed or silently alter a producer's recorded hash.

Active analysis tools use stable capability names. The provenance index keeps
each moved producer's own committed source boundary; migrations from different
points in history do not share an assumed baseline. Live reference/import
resolution follows the replacement, while a recorded execution hash still
requires the exact original Git bytes. Evidence records keep their original
producer paths and target identities rather than being rewritten for a rename.

When one capability retains distinct checking contracts, its stable tool exposes
named `--contract` suites (`--list-contracts` lists them). The existing provenance
resolver retrieves the committed producer by its exact digest without creating
another script file. Native target guards remain intact. Recorded script-input
checks may verify that original Git producer explicitly; ordinary evidence and
source inputs still require their actual bytes. This compatibility adapter does
not claim a new execution of the historical producer, transfer proof to another
EXE or replace the maintained tool's current implementation.
Retained suites require their recorded hash to match the configured installed
EXE before loading. Former project-copy EXE accesses are routed to that same
authorized input. The adapter reports the original producer and its own executed
source separately, including when a frozen generator records its own commitment.

Cold storage is a working cache for Programs with a likely consumer. The
default native audit retires full-EXE Programs for earlier registered hashes,
including earlier hashes of the same release, before starting the successor's
census. The retirement command verifies the
installed EXE, acquires the Program lease, checks for archive consumers and
replaces retired descriptors with small records that prevent stale resume.
Completed exports, query results, native snapshots and findings remain
available for cross-version comparison. A referenced or active Program blocks
the handover until its consumer releases it.

Cold restoration permits a positively identified headless process using another
project directory. The restored Program's runner leases, process ownership and
FileChannel locks still exclude active users, and unidentified Ghidra processes
remain a blocker. Archival retains the conservative project-wide process guard.

Raw-slice query Programs automatically return to cold storage after their JVM
has stopped and released its lease. `REA_ARCHIVE_RAW_PROGRAMS=0` retains an
expanded Program for an immediate sequence of queries. Archival failure is
nonfatal and leaves the saved Program available. Only an unreferenced older
automatic cache generation can retire after a verified replacement; manually
retained archives remain pinned until explicitly retired under their owning
retention policy. This avoids retaining a new full
snapshot after every query while preserving referenced evidence and checkpoints.
An unrelated headless process does not block archival. The native audit sweeps
deferred ready slices and removes idle headless scratch under the Program lease.
Unfinished slice checkpoints and failure diagnostics remain available.
Cold Programs also drop empty runner directories and Ghidra file-cache shells
that contain only a maintenance timestamp. The runner recreates these paths
when needed. Populated caches and configuration files stay with the Program.

Both Java launchers set Ghidra's supported `pdb.cache.dir` property to the shared
datatype cache. The installed Ghidra implementation guards its cache map with
cross-process locks and refreshes entries when their packed source changes.
Legacy per-Program cache paths can alias this cache after exact duplicate
verification. Installed datatype archives remain intact; native Program state
does not live in this tool cache. Other configuration caches are retained unless
their own consumers and reuse requirements have been established.

Keep the shared object store, catalog and necessary Program archives together.
An alias is not a backup. Do not delete a shared target while reports, inventories,
journals or archive descriptors still reference it. Content sharing is independent
of target provenance. Staging files can be removed only after their owner has
finished and their verified result is published.

Derived ownership checks compare all four artifacts and their receipt without
rewriting them. `derived_gzip.py` compares decompressed bytes while preserving
existing gzip headers; fresh payloads use deterministic headers. Explicit
publication replaces a changed final file alias atomically, preserving its
shared object target. Unchanged checks/publication preserve bytes and timestamps.
The non-compiling `test-derived-gzip.py` and
`test-native-ownership-classification.py` fixtures cover these boundaries.

## Validation boundary

Storage fixtures use Python, Node and fake MCP subprocesses. They exercise
cross-task result reuse, target/revision isolation, compatible Program selection,
conflict handling, interrupted publication/restore, native query fidelity and
legacy hash preservation. These checks start no game, server or Ghidra JVM and
compile no application. Actual Java/Ghidra execution of the new shared preparation
and incremental collector remains a separate validation step; source and fixture
success are not native/runtime or gameplay parity evidence.
