# Durable individual Ghidra queries

`fixgap` and `execheck` use `./scripts/rea query <plan.json>` for
individual searches, function decompilation and scoped static investigations.
A timeout no longer discards completed queries or the saved Ghidra Program.
The full-image census retains its separate durable runner and evidence.

## Recovery boundaries

`scripts/rea-batch.py` binds its operation journal to the exact input bytes,
plan, effective options, seeds and tools before spawning MCP. Successful results
keep their original Evidence envelopes and digests. Timeout, provider-timeout,
malformed transport, EOF and process failure automatically reopen the saved
analysis and retry the unfinished operation, up to three attempts by default.
Reusing the same plan/output resumes it; `--resume` requires saved progress.
Permanent errors and cancellation retain progress for diagnosis. Each session
exports a new evidence bundle beneath its attempt directory, preserving earlier
bundles. Session/ledger views are queried fresh.

The guarded REA provider repair covers the standalone provider and bundled
CLI/MCP providers. It saves import and preparation before autoanalysis, validates
readiness against Program options, retains completed native results and resumes
search matching in verified 1,024-entry batches. Target/profile/tool/seed changes
cannot reuse incompatible state. Static workflow profiles reject annotations and
renames; separate authoring profiles invalidate cached results before mutations.
Program locking and owned-process records serialize writers and validate cleanup.
Missing bootstrap metadata reopens and verifies an existing Program instead of
importing over it. Preparation failure aborts without admitting native analysis.

Initial inventory construction, one analyzer task and one function decompilation
are atomic. A timeout retries that unfinished unit; it cannot resume the
Decompiler's internal CPU state. Query deadlines must cover saved-Program startup.
An exhausted budget stays failed with its journal/checkpoint available. These
boundaries do not certify native completeness or game behavior.

## Verification

The [compact evidence](evidence/tooling/ghidra-query-recovery.json) binds the
executed tools and synthetic input. Ghidra 12.1.4 analyzed 4,096 raw x86_64
functions without executing them. The fixture is reproducible from its byte and
seed construction in that record; all databases, plans and raw logs remain under
ignored `runtime/analysis/history/native-recovery/rea-query-recovery-smoke/9c753ee1b053/`.

A controlled test suspended only its validated owned JVM after search entry
1,024. The 30-second query deadline expired. Automatic attempt two reopened the
same Program and finished at entry 4,096; the committed first batch's bytes and
modification time were unchanged. Function information, string search and
function decompilation each needed one attempt. Decompilation recovered the
fixture's `return 0x2a` and its completed result was reused on reopening.

Repeating the completed plan skipped all four native producers and exited
successfully with a distinct evidence bundle. Removing the bootstrap marker then
starting a fresh operation journal recovered the existing Program: one import
in total, no repeated seeds/autoanalysis, unchanged revision and unchanged native
result files. A deliberately short 10-second variant exhausted its three attempts
while reopening and retained its failed journal and search checkpoint.

The noncompiling regressions pass: 33 fake-MCP cases, eight Python provider/repair
checks, eight Node provider/lease checks, 24 census reporting checks, 12 census
resume checks, six seeded-census checks and the reference-input Node check.
Commands are:

```sh
python3 -B scripts/test-rea-batch-resume.py
python3 -B scripts/test-rea-durable-queries.py
node --test scripts/test-rea-durable-queries.mjs
python3 -B scripts/test-census-progress.py
python3 -B scripts/test-census-resume.py
python3 -B scripts/test-seeded-census.py
node --test scripts/test-rea-reference-input.mjs
python3 -B scripts/check-reconstruction-coverage.py
```

Seeded-census checks require Capstone; this verification used 5.0.9 in an ignored
project-local dependency directory. Coverage accounting reports zero errors with
64 existing open-work warnings; package/lock review fingerprints remain pending.
The current structural file-range ledger was regenerated only to bind the
existing `coverage_common.py` generator bytes; all 26 ranges/counts are unchanged.
No application compilation, game launch or original/rebuilt comparison ran.
