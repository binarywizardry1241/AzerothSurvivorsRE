# Desktop Saves listing and import — 0.100.1

Recovered and connected on 2026-10-19 against supplied EXE SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
The 0.99 release note is a discovery lead; the selected desktop PE establishes
the platform behavior below. No browser executable was supplied or analyzed.

## Controls actually present

Current page `0x140279c80..0x14027b113` constructs Export Save and Open Saves
Folder using localized keys at `0x1459435b8` and `0x1459435cb`. It then draws
the optional notice/confirmation, the Save Files heading, the actual export
directory, and the hourly-backup explanation. These controls are desktop code.

The file list traverses 56-byte records in the definitions resource at
`+0x80/+0x88`. Row owner `0x1401517c0` constructs the filename and an indexed
**Import** action (`0x800000000000000b`) using `options.import` at
`0x1459435e4`. The filename uses 16px PAPER text. There is no separate Restore
button or browser-style backup metadata in this desktop page/row chain.
Hourly `Backup ...sav` entries pass through that ordinary Import list. A locale
string or browser release note is not evidence for another desktop control.

## Exact listing and metadata

World input `0x140287fa0` obtains the Saves directory from `0x14543a9c0`, then
calls `read_dir` at `0x140289f31`. Failure gives an empty list. Iterator
`0x1401adcf0` skips failed entries and calls predicate `0x1402852f0`:

- Only a three-byte, ASCII-case-insensitive `sav` extension is accepted.
- There is **no file-type test** and no portable-envelope validation at listing.
  A directory whose extension is `.sav` therefore appears and fails if imported.
- Each accepted entry is mapped to its lossy UTF-8 filename, optional modification
  time and path. Sorting uses modification time descending (Some before None),
  then filename bytes ascending, case-sensitive.

Collector `0x1401abbc0` materializes 72-byte sorting records. Short insertion
owner `0x140230ff0` binds that comparator directly; the long-sort wrapper
`0x14017b800` calls current merge owner `0x14000a660`, whose inlined comparisons
use the same optional-time/name fields. `0x14017a6c0` then drops the sort-time
metadata and retains **filename plus path** in 56-byte display records. The
desktop row does not show backup timestamps, hero counts or a Restore badge.

The source now ignores listing/entry failures, filters only the extension,
captures each entry's sort keys once, and uses those exact ordering rules.
It keeps the existing desktop Import list. Native Windows directory entries
carry cached platform metadata; the source uses Rust's host metadata adapter.
This is not a claim of cross-platform filesystem parity for symlinks or I/O races.

## Captured import and confirmation

UI input `0x14028d750` dispatches action 11 to `0x14028e1f7`. It checks the
indexed record, clones its filename and reads the entire UTF-8 file at
`0x14028e262`, **before confirmation appears**. On success, it stores the owned
filename and encoded contents in the pending tuple at `+0x170`; it does not
parse the save yet. On an OS/UTF-8 read failure, it sets localized
`options.cannot_read`, preserving any earlier pending tuple.

Action 14 (`0x14028e3d1`) takes that tuple and queues import of the captured
text. The source previously retained only an index and reread the file after
confirmation, allowing another file's contents to be imported if the directory
changed. It now retains `PendingImport { name, contents }`, so modification,
removal or list reordering cannot change that pending import.

Core `0x14543a760` checks the portable envelope, opens/parses it, attempts the
fixed `characters.before-import.txt` backup and invokes ordinary writer
`0x1454356a0`. Backup/active-write failures do not reject the successfully
parsed in-memory import. Success replaces live save/menu state. An envelope
failure is displayed as `filename: localized error` (`save.not_a_save` or
`save.damaged`), distinct from the initial file-read failure. The source now
preserves that distinction and uses the current locale keys.

The confirmation pane is inline. The native page/export/import input branches
do not test pending `+0x170`, so tabs and other controls remain available; the
source's additional confirmation-wide input lock was removed. Action 15
clears the pending tuple. Done (17) closes Options and clears it too. Existing
Escape handling was not revalidated by this bounded pass.

## Export and refresh lifecycle

Export action 9 queues export command 7. Core `0x14543a660` obtains and
serializes the current Save directly; it does not commit a transient Pick first.
The source no longer forces `persist_selection` or lets an unrelated prior menu
error reject export. Existing UTC filenames and sealed exports remain shared
with the already recovered save code.

The world updater builds definitions on first Options open (absent cached
definitions), and rebuilds them after queued native operations. Its guard
`0x14028813d..0x14028814c` returns when definitions exist and the command queue
is empty. Opening Options, exporting and confirming an import refresh the source
list. Clicking another Options page alone does not constitute a live directory
watch; no invented Refresh/Restore control or periodic scan was added. Exact
refreshes after unrelated CVar/addon commands remain in the broader Options
integration scope.

## Validation and limits

[The evidence manifest](evidence/0.100.1/saves-browser/manifest.json) retains
15 current bounded owners, exact PE hashes, current REA/Ghidra results, action
destinations and control/error literals. Input pseudocode has indirect-jump and
raw Win64 ABI limitations; complete original assembly binds the actual cases.

`scripts/recover-saves-browser.py --fixtures` completed successfully:
**17 original extension cases and 30 original two-record ordering cases**.
Ordering uses an explicit `memcmp` byte-comparison seam; file/clock memory is
provided and no actual OS import or native application is executed.

Two Rust tests consume those native vectors. Four additional integration cases
cover extension-only listing, missing/not-directory errors, cached ordering,
captured contents after replacement/deletion, and delayed envelope validation
versus immediate UTF-8 failure. All33 save-browser integration cases passed in
`runtime/consolidation-2026-10-19/saves-browser-regressions.log`. The first
ordering fixture created both `A.sav` and `a.sav`, which collide on a case-insensitive filesystem;
the filesystem fixture now uses distinct names while native vectors retain
case-sensitive comparison coverage. Existing backup/export tests remain in place. No active installed save was accessed, and no original or
rebuilt GUI comparison was performed. Interactive
parity, remaining page styling, Escape behavior, open-folder error presentation
and browser backup restore remain unverified by this pass.
