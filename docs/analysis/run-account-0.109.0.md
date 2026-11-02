# Terminal account delivery — 0.109.0

Target: installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/0.109.0/run-account/manifest.json) binds the current
summary `1458b8620`, component-delta helper `1459ca650`, enclosing tick
`1458ad720`, optional roster projection, Save selector and direct write leaf.
Full current owners were inspected through fresh REA/Ghidra imports; compact
instruction and decompiler excerpts retain the relevant control flow.

The source now separates explicit summary requests from regular terminal-edge
account delivery, keeps saved and transient character bests independent of XP,
and queues each native Save snapshot in order. The XP display has a separate
[current presentation report](terminal-presentation-0.109.0.md). These are
source/static repairs; no compiler, game or original filesystem executes.

## Admission and lifetimes

Summary entry `1458b8684..869b` requires a present Game and nonzero phase.
Explicit Again/Menu and ordinary Logout invoke it even for an active run.
Ordinary Logout does not call End Run or manufacture an abandonment first.
The regular tick invokes the summary only on phase 4/5 differing from its last
observed terminal phase. The full tick has one read and one terminal-only store
to that marker: running phases do not reset it. Thus4→running→4 is suppressed,
while4→running→5 admits another result.

Only inside the regular terminal-edge branch do present Game, GUID`!=ffffff`
and showcase-clear admit the subsequent five counters, beaten pair and account
feat evaluation. These are not live counters or explicit Menu/Again grants.
The summary's XP and global first-result counters instead require valid GUID
without a showcase exclusion. Saved-row bests and saved-row first-result counts
have neither exclusion. All callers now preserve those separate predicates.

The seven cumulative XP components are Time survived, Kills, Bosses slain,
Victory, Zone bonus, Run Options and Veteran's Lessons. The native float order,
clamping and roundf boundaries are checked against current bytes. Component
deltas and their sum wrap as i64; the award clamps into u32. The cumulative
seven-component checkpoint advances even for zero/negative awards. Saved class
XP saturates at u32MAX, while summary JSON retains full awarded XP and explicit
old before. Display sums/differences wrap independently.

The five account counters use saturating unsigned subtraction against their
previous u32 checkpoints, then saturating addition into u64 saved statistics.
Checkpoints become current values, including decreases producing zero deltas.
Endless preserves XP/count snapshots and the first-result flag. The source
acknowledges XP/first-result during the summary and five counters only after the
separate eligible regular-edge transaction.

## Permanent and optional character rows

`1458b96cf..9758` scans 56-byte permanent rows for the first matching full GUID,
maxing unsigned level and seconds before the first-result guard. A later
zero-XP Endless terminal can therefore improve bests without another run/win.
The source updates those maxima independently of optional `summary_delivery`.
The first result wraps permanent-row u32 runs/wins; valid-account u64 result
statistics saturate. A saved GUID`ffffff` match still precedes the fallback.

On permanent-row miss, a present matching optional startup Character updates
**best_level only**. Its seconds/runs/wins remain unchanged. Constructor niche
and roster factory `1458bb880` distinguish this row from the custom Pick:
custom mode synthesizes GUID`fffffe`; ordinary mode projects optional`+ee0`
followed by permanent rows. The optional Tester defaults to GUID`ffffff`.
The source keeps that mutable row in MenuState; runtime count/name/Enumerate
and Create checks read that same owner, while NativeStartup remains boot input.

## Ordered writes and persistence boundary

Current summary and tick establish these snapshots:

1. Positive valid-GUID XP is granted and immediately saved before bests.
2. Bests advance. On first victory with valid GUID, a newly opened next zone
   is saved before first-result run/win counters. Already-open/final zone skips
   this extra write.
3. First-result permanent/global run/win counters advance. Every admitted
   summary saves again, including zero deltas and already acknowledged results.
4. The eligible regular terminal edge updates five counters/checkpoints, records
   its beaten pair, evaluates run/account feats and saves again unconditionally.

Earlier regular-tick item/seen ownership changes and newly granted live feats
retain their own writes before the summary. Explicit Again/Menu/Logout call the
summary directly and do not consume those earlier live-tick queues. Unresolved equipment IDs are skipped; ownership
insertion occurs per drop, preserving first-new/later-old behavior. Sentinel
GUIDs neither insert equipment nor save seen records. Source commit queues
clone each admitted snapshot rather than collapsing to the final state, so the
first hourly-backup candidate has the native earlier snapshot.

Fresh Save owner `1458a33c0` serializes, seals and opens the result. Its byte
comparison validates that round trip, not the existing file. Equal round trip
writes sealed bytes; failure/mismatch logs and writes plaintext. Both continue
to backup admission. Its unsigned timestamp gate skips when a previous stamp is
not in the future and elapsed time is below 3,600 seconds. Direct writer `1458ef670` skips only absent active path;
parent-directory failure does not skip the write, and write errors are logged.
The shared [typed Save schema](save-schema-0.109.0.md) now normalizes imported
records and emits the current native family order. Duplicate statistics retain
their maximum; duplicate achievement dates retain their minimum. Permanent
roster counters parse as u64 before truncating to u32, and duplicate GUID rows
retain file order, preserving this summary's first-match mutation. Each queued
snapshot uses that same typed serializer. Current [envelope](save-envelope-0.109.0.md)
and [ordinary-write/backup](save-backup-0.109.0.md) recovery revalidate the nested
contracts. Backup admission tests normalized typed content, keeps the newest
five matching paths and attempts older deletions in native reverse order.
These bounded instruction checks do not execute actual filesystem helpers.

## Static checks and remaining boundaries

`python3 -B scripts/check-run-account.py` passes **2,855 native
executions**: 1,547 XP cases, 103 component deltas,103 sum/checkpoints, 261 five-count
cases, 18 post-summary gates, 147 phase gates, 21 summary-entry gates, 504 permanent
bests, 72 optional-bests/precedence cases, 14 first-result cases, 18 XP gates,
23 phase steps across 6 continuous sequences, 8 Save-selector and 8 direct-writer
cases and 8 hourly-backup timestamp boundaries. Thirty-one XP cases distinguish native float order from the old alternate
model. Source guards check independent eligibility, maxima, runtime optional-row
ownership, ordered Save mutations and ordinary Logout. Authored Rust regressions
cover bests, showcase/sentinel admission and intermediate snapshot order; they
were not compiled or executed.

Zone-index and roundf are explicit leaf seams. Roster storage is preallocated.
Save replay substitutes comparison/free/log/write leaves; direct writer replay
substitutes path/parent/mkdir/write/free/log leaves. Actual save/backup timing,
source compilation, worker/client scheduling and original/rebuilt gameplay
parity remain unverified. The shared typed Save dependency under #17 is connected
in source and has its own current native fixtures; its finite parser, envelope
and backup checks retain their explicit seams and limits. The [separate frontend/backend account](account-command-owners-0.109.0.md)
now connects terminal readers and backend-only snapshots, while preserving the
independent imported frontend cache. Its native command/helper fixtures have
separate declared seams and do not execute Rust or native workers. Actual
codec/file-operation parity is not inferred from these bounded current caller checks.
