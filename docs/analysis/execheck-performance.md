# Incremental EXE audit execution

The static audit keeps its whole-image and semantic-review scope. Performance
is assessed on the complete new-target path, including cold decoding and later
source/report joins. Warm cache samples alone do not establish an audit speedup.
Verified stage reuse and bulk decoding do not establish native
completeness, implementation, execution or parity.

Before scheduling native work, apply the shared
[current-target efficiency rules](../../.agents/skills/shared/autonomy.md#efficient-current-target-work):
reconcile the whole supplied release batch, retain superseded claims as history
and recover each missing current contract/shared dependency once. Separate claim
records do not require separate native workloads or intermediate-release repairs.

## Runner

`scripts/run-execheck.py` prints a dependency plan by default. `--run` verifies
the installed identity and complete registered Data chain before executing it,
then checks those inputs again at completion. An unregistered update must first
follow the registration/review steps in the execheck skill; it never silently
uses the preceding target.

```sh
python3 -B scripts/run-execheck.py --python-path <existing-capstone-directory>
python3 -B scripts/run-execheck.py --run --phase native --audit-session <runtime-session.json> --new-audit --python-path <existing-capstone-directory>
python3 -B scripts/run-execheck.py --run --phase derive --audit-session <runtime-session.json> --census-summary <reviewed-summary> --python-path <existing-capstone-directory>
python3 -B scripts/run-execheck.py --run --phase reconcile --audit-session <runtime-session.json> --census-summary <reviewed-summary> --python-path <existing-capstone-directory>
```

All dependency paths are project-relative. The configured dependency directory
must already exist; the runner installs nothing. The default profile is
`scripts/execheck_profile.py`. The phases are:

| Phase | Automated work |
| --- | --- |
| `scan` | Fresh full PE and diagnostic scans/checks, disjoint file ledger, verified linear/complement inventories, MPQ inventory |
| `native` | Scan plus declared census, independent verification, guarded/diagnostic/import/unwind/operand/address inputs, expanded census and verification |
| `derive` | Scan plus operands, direct/constant dispatch and current ownership against an explicitly reviewed census |
| `reconcile` | Derive plus custom partition, historical applicability, connections, unknown queue, changelog and final accounting |

The native phase ends at a review frontier. Review its new/remaining leads,
repeat required expansions until the applied inputs reconcile, and preserve the
old canonical selection until publication is reviewed. The six AS discovery
stages, release-item investigations, source contracts, discovery graph/queue and
numbered findings still follow the execheck skill. New contracts or findings
cannot be manufactured by a DAG. `reconcile` assumes those reviewed canonical
inputs exist. A cheap preflight requires reviewed ownership and applied switch
proofs for that census before expensive readers run. After historical joins,
the validated selection is refreshed before connections/unknowns/accounting,
so a changed historical receipt cannot leave the final selector stale.
`automated_stages_complete` never means `execheck_semantic_review_complete`.

Use one `--audit-session` file across phases of the same audit, and
`--new-audit` once at the start of every user-requested audit. Mandatory PE,
diagnostic and range scans execute fresh in each new audit. Later phases reuse
their verified receipts within that audit; a changed input/output still requires
new work. A new scan witness does not invalidate unchanged downstream data.
The session retains all phase durations/cache outcomes, including failed and
interrupted attempts, instead of overwriting them with the last phase. Broken
child metrics cannot discard outer wall/CPU measurements or the producer exit
status. Starting another audit archives its compact journal.
Without a session, every invocation retains the older fresh-scan behavior.

Use `--plan <project-local-json>` for an extended reviewed DAG. Its format is
`execheck-dag-v1`, with a `stages` array containing `id`, `argv`, `tools`,
`needs`, `inputs`, `outputs`, `phase`, `memory_mb`, `resources` and `cache`.
Commands are argument arrays, never shell strings. Declare dynamic tool inputs
explicitly; local imports and literal script dependencies are also fingerprinted.
Stages that inspect retained Git history set `git_history: true`, binding HEAD
and all reference tips so an imported branch can invalidate missing preimages.
Historical and connection readers always run their own domain validators and
caches. Their `transitive_inputs: false` avoids reopening unrelated archived
analysis merely because a historical report references it; generic stage-cache
hits are forbidden with this setting. Their actual evidence checks remain in
the producing tools.
`--bind NAME=VALUE` supplies additional portable path/settings bindings.
`--work runtime/...` selects a stable workspace when deliberately extending a
profile. Incompatible collector profiles require separate frozen plans.

The default pool has two workers and a 10,000 MiB declared memory budget.
Stages sharing a Program resource take an exclusive cross-process lease;
independent readers can overlap. The native driver's own authoritative Program
lease remains in force. Native stages always invoke that driver's verified
resume path; the generic stage cache cannot bypass its provider/tool checks.
Declared Ghidra collection depends on PE inputs, not the independent linear or
complement inventories. Those scans overlap. The verifier waits for diagnostic
bindings; the expanded collector waits for the complement it actually consumes.

Each stage key binds target/resources, toolchain, command/settings, effective
analysis environment, tool sources, input files and parent seals. Referenced
manifest payload bytes and missing states are bound, including verification of
shared inventories' original logical SQLite commitments. Evidence admission
remains the producer's responsibility: a required native export must validate,
while a retired optional historical extract can be recovered from retained
assembly or another exact source. Restoring a missing input invalidates its
dependent stage. Successful outputs are snapshotted once into the existing
shared CAS before an immutable receipt is committed to the common catalog.
Cached receipts require their outputs and referenced payloads to remain valid.
Before launching a legacy writer, existing output aliases are detached from CAS;
successful publication restores runtime aliases without modifying old objects.
Failed or interrupted producers cannot publish dependent results. Interrupts
terminate their process groups while preserving completed receipts and native
checkpoints. Repeating the same command resumes work.

Stage wall/CPU/peak-RSS measurements, cache hits and collector-specific counters
live under ignored `runtime/analysis/pipeline/`. They are separate from evidence
hashes. `REA_STAGE_METRICS_PATH` lets an individual producer record additional
decode/search/checkpoint counters. CPU/RSS describe measured child resource use;
declared memory reservations are scheduling limits, not OS memory enforcement.

## Native repair and checkpoints

The collector retains its mutation frontier inside the saved Program. A
compatible predecessor can reuse completed entries. New code and flow/helper
edges seed a conservative reverse-flow and overlapping-body dependency closure;
affected old entries and new entries are repaired. Unknown exits, unproved
state, incompatible metadata and explicit `--full-recompute` use full repair.
External progress JSON cannot authorize skipping a body or advancing a cursor.
The initial migration from a legacy collector also takes the full path because
legacy exports contain no mutation-frontier proof.

Checkpoints are time/adaptive: `--checkpoint-seconds 30` and
`--checkpoint-max-batches 256` bound work between saves, with forced phase,
interruption and final saves. Skipped unchanged batches need no unconditional
save. Metrics distinguish save latency, new/repaired/reused entries and export
work. A changed collector has a new profile; exact original script bytes remain
available for frozen historical plans.
Existing frozen plans keep their recorded settings. The older 16-batch ceiling
forced early saves even when productive work had not reached 30 seconds.

`scripts/benchmark-census-reuse.py` exercises a real target dispatcher, added
function entry and guarded edges in an explicit isolated experiment, including
durable interruption/resume. It compares full record contents with forced full
repair from a separately imported, identical initial state. Matching counts
alone are insufficient. This bounded experiment tests the reuse mechanism;
it is not a whole-image speed benchmark.

## Intrinsic facts and other caches

Boundary-only verification uses contiguous batches of the Capstone C decoder,
checking every exported byte and individual length without constructing full
operand/register records. Dense operand auditing reads only the raw x86 fields
it consumes; sparse dispatch contexts decode locally. Building/decompressing a
whole-image detailed cache is not a prerequisite for these consumers.

The optional `InstructionFacts` API still stores independently decoded facts in
bounded compressed CAS chunks for consumers that benefit from reuse. Keys
include target hash, address/bytes, architecture/mode, decoder binding/native
library versions and hashes, schema and helper contract. Every visit checks
current PE bytes and length. Operand details and intrinsic register/flow facts
are reusable; Ghidra bodies, applied edges and source ownership are joined from
the current census. Sparse ownership/dispatch consumers request only the sites
and fallthrough contexts their analyses need without decompressing thousands of
unrelated full-image fact blocks.

Ownership classification separately caches its native resolution/artifacts by
exact census, operand/proof, decoder and algorithm commitments. A source mapping
change reuses that verified core and regenerates current source candidates;
it does not repeat a scan of every instruction/reference. Source correspondence
remains candidate-only where its evidence says so.

Derivative outputs compare without writing on read-only replay, preserve unchanged bytes,
and publish atomically. `--artifact-directory` or explicit inventory/summary
outputs isolate new derivations from frozen census bundles.

Linear decoding keeps one read-only lookup session and bounded parsed-chunk
cache instead of reopening the catalog per extent. Historical revalidation
separates cached preimage recovery and exact byte searching from the current
ownership join. Search keys bind current image, raw range and algorithm;
negative and ambiguous results are retained too. A changed owner or report
does not require searching identical bytes again. Source/tool/schema changes
invalidate preimage recovery independently. Cross-version decode reuse retains
its exact-byte/address/boundary rules; it does not imply unchanged semantics.

For new targets, the historical search helper performs one bounded
Aho-Corasick scan over up-to-16-byte candidate anchors, then verifies every full
range. It retains the first two overlapping occurrences exactly. Short or
resource-limited cases use native exact searches. Node/helper identities are
recorded; new results and legacy Python rows keep their own algorithm namespaces.
Complete intrinsic search facts publish before source/ownership joins, and
Python fallback publishes a bounded prefix periodically. An interrupted report
or changed source revision does not discard already verified exact searches.

## Measurements and limits

The actual 0.120.5 and 0.121.0 audits took 1h37m47s and 1h46m43s. Both used
the runner and concurrent workers. Their four sequential verifier/operand
stages consumed 38m14s and 37m13s, versus about 19m25s in the earlier workflow.
The eager cold fact population, not a lack of parallel workers, was the largest
regression: declared verification took 1,404.81s and 1,153.12s. Warm-cache
microbenchmarks did not predict that cost.

The full 0.121.0 replacement tests use EXE SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`:

| Workload | Recorded audit/oracle | Replacement |
| --- | ---: | ---: |
| Declared verification, 22,534,888 instructions | 1,153.12s | 132.26s |
| Expanded verification, 23,364,860 instructions | 323.69s | 136.95s |
| Declared operand audit, 585,358 output records | 309.30s | 157.68s |
| Expanded operand audit, 676,285 output records | 447.29s | 164.98s |
| Sparse dispatch, 254,125 required instructions | 185.78s | 53.92s |
| Constant dispatch | 186.05s | 57.17s |
| Native ownership and source join | 268.82s | 83.25s |
| Source-only ownership refresh after a mapping edit | about 301s | 3.50s |
| Fresh historical exact search, 6,945 unique keys | 193.68s | 11.11s |

The four sequential verification/operand stages total 9m52s in these replacement
measurements, versus 37m13s in the recorded audit. This subtotal excludes Ghidra,
other stages and review time. The operand runs construct no dense fact blocks.
Verifier populations and residual-range payload hashes match the original
reports; both complete operand gzip payloads and all three native ownership
payloads are byte-identical. Dispatch record fields match after excluding only
execution paths and producer receipts. The source-only refresh uses a private
copy of the current-target mapping with an actual `source_refs` edit; guards
prove it opens neither full instruction/reference streams nor an instruction
decoder. Its current source candidates change while native payloads stay equal.
Historical first/second offsets match the independent Python oracle
for all 10,948 range references, including negative and ambiguous cases.
The final fresh scan group took 47.28s; repeating it within the same audit session
validated all five receipts in 1.65s. A new audit still executes fresh scans.

These are full-size stage measurements, not a completed fresh-version audit
duration. They include the host's existing shared store and installed tools;
publication deduplication and concurrent workloads can affect timing. Keep
mechanical stage time, phase elapsed time and manual recovery/reporting time
separate. Same-Program full-body fallback remains explicit: recent expanded
body repair cost 39.66s/57.25s, while saves cost 106.19s/142.37s. It was not
the dominant explanation for the two long audits.

### Earlier bounded measurements

Earlier 0.120.4/Capstone 5.0.7 lookup measurements for 1,000 extents produced
identical per-call/session records: cached hits took 4.554 s through the per-call
helper and 0.103 s through one persistent session; forced misses took 0.517 s
and 0.171 s. These are lookup-only measurements.

Full historical-range revalidation took 226.39 s cold and 13.55 s on read-only
replay. All 19,763 range results matched the canonical inventory byte for byte
(SHA-256 `4b2c045f5cead20db49583e10d82b5e1916be34a08d69b7d6750a959c1b588b5`).
Replay reused all 10,894 range-reference lookups with zero misses; search time alone fell from
199.44 s to 0.092 s. Counts, classifications, offsets and current owners matched,
and both canonical reports kept their bytes and modification times.

The independent Ghidra experiment matched initial states, then all five expanded
record streams: 44 instructions, 358,203 actual/placeholder body ranges and
792,116 references. Incremental repair processed the affected old entry and new
secondary entry while reusing one unchanged entry; independent full repair
processed all three. Startup/export dominate this small experiment, so its
approximately 20-second passes do not predict whole-image performance.

On a bounded 100,000-instruction current-target window, warm facts replay took
about 0.75–1.01 s, with zero decoder calls. Cold fact creation cost more than a
single legacy decode: one measurement took 2.589 s versus 0.643 s boundary
verification plus 1.740 s detailed decoding. Population is an up-front cost;
repeated and expanded same-target analyses receive the benefit. All public
intrinsic fields used by the consumers matched independent Capstone decoding.
These samples do not establish an end-to-end audit duration or justify a fixed
daily runtime promise.

Non-compiling regression fixtures cover cache isolation/corruption, byte and
tool drift, ownership changes, sparse/full consumer equivalence, deterministic
read-only publication, cancellation-safe stage admission, dependency failures,
parallel readers, writer leases and precise descendant invalidation. Application
compilation, game/server execution and original/rebuilt comparisons are separate.
