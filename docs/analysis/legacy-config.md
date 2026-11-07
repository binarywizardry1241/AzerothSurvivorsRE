# Windows first-start configuration migration

Target SHA-256: `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The [manifest](evidence/legacy-config/manifest.json) binds the current
native ranges, Ghidra evidence/profile identities and canonical extracts.
Historical 0.112.5 addresses are not reused. Current implementation status lives
in [verification-needed](../verification-needed.md), gap #62; this is a source/static repair,
not Windows execution or original/rebuilt parity evidence.

## Native contract and connected source

Startup `140001276` calls migration `140017b60` before argument collection and
application setup. It asks the shared configuration-home owner (thunk
`1404f7650` → `140c03ca0`). `WOW_CAPTURE` disables persistence; `BENILLA_HOME`
wins next; unattended roots retain their separate owner. Ordinary Windows
startup uses the executable parent plus `benilla-config`, including development
builds. The source now calls `legacy_config::migrate()` at the start of `main`;
`benilla-app::local_state::resident_home` uses this same Windows destination.
The existing non-Windows project-home route is retained, not claimed as a
current Windows migration contract.

Migration requires that home to equal the exe-adjacent home and that metadata
lookup of the destination fail. An existing destination, including an empty
folder, prevents migration. There is **no separate migration marker**. The
published directory itself is the first-start guard. Explicit alternate homes
are not merged into or searched for legacy inputs.

The legacy roots are the native literal `C:\Git\wenilla\benilla-config` and
`C:\Git\wenilla\.claude\worktrees\<entry>\benilla-config`. Child-root paths
are sorted, and `1400657b0` retains only directories. These are literal target
inputs, not the reconstruction checkout or a request to use another workspace.
No migration happens when there are no existing roots. `140017550` recursively
collects ordinary entries by relative path. Enumeration/entry failures are
skipped, name-surrogate reparse entries (symlinks/junctions) are skipped, and only
top-level directories named exactly `cache` or `Diagnostics` are excluded.
Nested directories of those names remain eligible; empty directories have no
collected files and are not reproduced.

For each relative path, copies sort by signed Windows last-write ticks, then
`Path` order. `140024c10` shows that increasing timestamps sort later; the final
copy supplies ordinary files (`140018fab..140018fd8`). This copies addons,
SavedVariables, bindings, chat, camera and all other collected settings without
special-casing their contents. It does not alter the source roots.

Root `config.toml` is special. Each candidate is read as UTF-8 and parsed as
generic TOML in sorted order; unreadable/malformed candidates are skipped. Only
the `[cvars]` table is accumulated, retaining key spelling/case and TOML value
types. Later candidates replace equal keys. The contiguous initial lines whose
first byte is `#` form the comment header from the last successfully parsed
candidate; `14009e3c0` strips CRLF and appends one newline per retained comment.
Other sections and comments do not survive this special merge. A fresh TOML
root containing the merged `cvars` table is serialized after that header. A
serialization failure falls back to copying the newest candidate. Source uses
the existing TOML dependency; byte-for-byte serializer/platform output remains
unverified.

The destination's extension is replaced with `part`. An existing staging tree
is removed, a new one is created, parent directories and selected files are
written there, then `140019283..14001929f` renames the completed tree to the
active home. Create/copy/write/rename errors abort, log the native warning and
leave the active destination absent. A later launch can retry, removing the
stale staging tree first. The source preserves this publication boundary and
native success/error messages. Character/account saves remain owned separately
by `save::native_path`/`native_base_directory`; no character-save move is added.

## Checks and remaining limits

`python3 -B scripts/check-legacy-config.py` verifies selected-target/extract
hashes, executes 25 native signed-timestamp predicate cases and 14 native
root/nested exclusion cases, and checks startup/source connections. These are
unmodified selected-EXE instructions with explicit memory seams; they do not
execute Rust or Windows APIs. Ghidra's raw-range profiles omit external code and
data; the selected full-PE profile also disables broad automatic analysis.
Assembly, current data and producer/callee tracing supply the contract above;
this does not establish whole-image completeness under #41.

The three changed Rust modules parse with the installed formatter in stdout
mode. The filesystem merge regression is authored but unrun. No compilation,
compiling tests, application launch, real user file migration, Windows file
operation, settings/addon reload or original/rebuilt preservation comparison
ran. Those remain open under #62/#17; source/static completion does not close
the whole gap.
