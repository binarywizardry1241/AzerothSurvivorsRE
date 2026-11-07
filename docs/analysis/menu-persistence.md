# Save operation ordering and Run Options

Target: installed Windows EXE **0.115.0**, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This bounded **#17** report owns the current export/backup-clock source repairs
and RunMods numeric revalidation. [verification-needed](../verification-needed.md) owns the
combined gap status. Existing schema, envelope, account-command and page reports
retain their actual historical provenance.

## Save operation corrections

The current Options export branch `1400ab984..1400aba00` calls account export
`145836bb0`, then directory selection `1458373d0`, clock `145002900` and UTC
formatter `145837500`, in that order. Account export loads the active file through
`14582beb0`, serializes its typed Save through `145832a60` and seals it through
`1458d32a0`. It does not run the ordinary writer's reopen/plaintext fallback.

Source Options now loads and prepares that account envelope before querying its
export directory. The browser receives the prepared bytes, samples time, derives
the filename and uses the direct file writer. `Save::write_export` shares the
same direct export payload operation; ordinary persistence retains its separate
round-trip check and plaintext fallback. Export does not persist a transient
Pick or touch the hourly-backup timer.

Clock `145002900` returns the duration's seconds on success and **zero** on the
failed duration-since-epoch branch. Source previously returned an export error
when the host clock preceded the epoch. It now uses the native zero fallback,
producing `AzerothSurvivors 1970-01-01 00-00-00.sav` for that case.

Current ordinary writer `145831e10` serializes, seals and reopens/compares its
envelope before active persistence. Both the sealed and plaintext-fallback paths
reconverge at `145831f20`; the typed-default gate follows, and only a nondefault
account reaches clock calls `145832209`/`145832232`. Failed active persistence
does not bypass this later backup stage. The inlined clock has the same zero
fallback at `145832244`.

Source previously captured time before serialization and active persistence,
which could move the backup's hourly decision and UTC name across a slow write.
`Save::write` now supplies a deferred clock to the shared writer, and backup code
invokes it only after active persistence and its existing progress gate.
`write_at` retains its explicit timestamp seam through the same path. Existing
backup retention, timer error handling and active-write failure reporting remain
owned by [the backup report](save-backup.md).

## Current RunMods contracts

Current parser `145829cf0`, CSV collector `1459ce220`, splitter `1459d1fe0` and
bounded byte-search helper `145cefd80` execute the actual current instructions
for **121** retained malformed-token/filter/normalization vectors. These retain
the four valid-u16 requirement, descriptor clamping and rounding down from 100.

The four current 48-byte descriptors at `146ccb850` still supply density/health/
damage/speed ranges of `100..500`, `100..500`, `100..300`, `100..150`, steps
`25/25/10/5` and f32 weights `0.05/0.4/0.6/2`. Current difficulty `145829f20`,
reward `14582a000` and adjustment `145829f80` agree with all **625** formula pairs
and **140** signed adjustment cases. The existing source constants, scalar
addition order, reward cap and sign/step/clamp logic require no correction.
Historical page geometry/input and gameplay consumers remain separately owned
by [Run Options](run-options.md) and its linked reports.

## Source audit and evidence boundaries

The live Saves path still captures UTF-8 bytes before confirmation, preserves
earlier confirmation on a read error, parses the captured envelope only on
confirmation and distinguishes read failure from invalid/damaged envelopes.
Current importer `145836cb0` independently retains the trimmed `RSE1:` prefix
gate, `save.not_a_save`/`save.damaged` distinction, best-effort fixed before-import
backup and ordinary writer. Existing frontend/backend separation, queued Reload,
actual-file Pick restoration and frontend-root refresh are traced in
[account ownership](account-command-owners.md) and
[Saves lifecycle](saves-browser.md); this pass changes none of those
contracts.

Fresh Ghidra observations identify the current full typed parser `14582cde0` and
serializer `145832a60`. Their record-family/source correspondence was inspected,
but their complete current helper graph and fixtures were **not** replayed.
Structural resemblance, the imported parser's body and historical vectors do
not establish full current schema, envelope or dispatcher equivalence. No new
source omission was demonstrated in those inspected routes.

The [manifest](evidence/0.115.0/menu-persistence/manifest.json) binds current bytes,
descriptors, retained fixture identities and finite checks. One canonical
[assembly extract](evidence/0.115.0/menu-persistence/native.asm) contains the
selected ranges; its backup-clock block remains inside the ordinary writer.
[REA observations](evidence/0.115.0/menu-persistence/rea.json) bind the journaled
Ghidra queries and curated pseudocode. Original-VA raw imports retain their exact
current input hash; their generic decompiler ABI is not a Windows x64 signature.
Assembly registers, fields and branches govern the recovered contracts.

`python3 -B scripts/check-menu-persistence.py` passes **14** export/backup
clock-result branches, **20** UTC calendar cases, **4** descriptors, **121** CSV
cases, **625** formula pairs and **140** adjustments. Clock APIs, allocation/free,
memcmp, RawVec growth and UTC formatting/field capture are explicit seams.
Unexpected instruction destinations abort. The check also verifies native call
order, retained hashes and live source ordering. `--stage` creates candidate
evidence under ignored `runtime/analysis/history/interface/menu-persistence/9f64de07bf02/curated/` for review.

An authored Rust regression checks that the injected clock observes the completed
active payload, is skipped for a default account, and still advances a due backup
after an active-file error. It was not compiled or run.

No compilation, Rust test, application/game, actual OS clock manipulation,
installed save/configuration write, real import/export/failure scenario or
original/rebuilt comparison ran. Actual filesystem/scheduler timing, entropy,
UI/input, platform behavior and parity remain unverified. These finite current
contracts do not certify every secondary menu or the complete Save subsystem.
