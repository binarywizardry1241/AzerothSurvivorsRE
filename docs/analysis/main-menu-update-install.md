# 0.92 installer state and replacement plan

Updated 2026-10-16. This is static analysis of the supplied **0.92.0** target,
SHA-256 `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
[Curated evidence](evidence/0.92/menu-update-install.json) retains ten scoped
Ghidra evidence IDs, original function byte hashes, and five PE import bindings.
`scripts/recover-menu-update-install.py` reproduces that record without executing
target instructions or requesting anything from the update server.

The source module `src/update_install.rs` contains staging-path
calculation, the native apply/rollback sequence behind an injected backend, cleanup
ordering, the Ready timer and a stream decoder behind injected readers/writers. It supplies
no I/O backend internally. Source26 now calls it from the connected
[worker/UI adapters](main-menu-update-worker.md), which supply the native-gated
filesystem/network/process code. Six standalone Rust fixture tests passed;
`runtime/analysis/history/interface/menu-update-recovery/5c4b1380715f/update-install-rule-tests.log` records the result.
The same six fixtures passed through normal Cargo tests in parent build21
(12.05s;54 total focused harness cases). No real backend was supplied.
Six additional stream fixtures passed in parent build24: the offline build passed
in16.29s and53 focused harness cases passed (35 binary,6 Options config and12
installer cases;8.49s test compilation). Logs are
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-build-24-typed-config-update-streams.log` and
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-tests-24-typed-config-update-streams.log`. The source
module was unreferenced at that historical checkpoint; source26 now connects it.
Parent build25 also passed (`--locked --offline`,14.34s;7.54s test compilation).
All18 installer cases passed, including the six new injected part-reader cases;
105 focused harness cases passed with overlap. Its logs are
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-build-25-save-events-talents-progress.log` and
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-tests-25-save-events-talents-progress.log`.
The final build26 passed with `--locked --offline` in11.08s; the preceding
combined build passed in29.09s. All169 focused harness cases passed with overlap:
74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater and18
installer. This includes all five new connected memory-only worker fixtures.
Test compilation took12.95s. Logs are
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-build-26-final.log` and
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-tests-26-menu-bridges.log`.
Fixtures record operations in memory. No update was requested, downloaded,
installed or launched, and no reference file was changed. No Cargo build or app
launch was started by this subtask.

## Native sequence

1. `0x140113bf0` accepts only Available1 or Failed4. It retains the plan, checks
   the exact shipped-executable/env eligibility again, sums all pending patch and
   optional executable **part sizes**, publishes Downloading2 with done/rate zero,
   and creates a `rogue-update` thread. Its spawn owner `0x1400ea150` uses the
   FnOnce vtable at `0x1458bfa28`; entry `0x1400ef950` calls worker `0x1400e8d80`.
2. That worker stages each pending data patch in plan order, then the optional
   executable. It adds each staging path to its cleanup list **before** attempting
   the download. If any download fails, it removes every attempted staging file,
   ignores cleanup errors, and publishes Failed4 with the retained plan and error.
   Successful staging publishes Ready3. Replacement is performed later on the
   main app path.
3. `0x14001c280` starts a deadline at elapsed seconds plus **1.2** when it sees
   Ready3; leaving Ready clears that deadline. Once due, it calls `0x140113110`.
   Success emits AppExit::Success. Failure translates the exact template
   `Could not put the update in place: {error}` and publishes Failed4.

The five native state discriminants are Empty0, Available1, Downloading2, Ready3
(displayed as Restarting), and Failed4. Source26 connects these states and their UI through `update::worker`;
compilation and all five connected memory-only fixtures passed in build26.

## Paths and file operations

For executable path `E`, data directory is
`E.parent().unwrap_or(Path::new(".")).join("Data")`. The bytes at
`0x1458e4538` are `.Data`: the fallback uses the first byte `.`; the following
four-byte string is `Data`, without a leading dot.

| Purpose | Native operation |
| --- | --- |
| Patch stage | `Data.join(format!("{name}.update"))` |
| Patch destination | `Data.join(name)` |
| Executable stage | `E.with_extension("update")` |
| Executable backup | `E.with_extension("old")` |

No further manifest-name sanitization, new temporary directory, or
directory-creation step is present in these staging/apply owners. The earlier
data-manifest parser restricts names to case-insensitive `patch-[A-Za-z0-9].mpq`
and preserves their spelling; [the separate data report](main-menu-update-data.md)
records that producer. The pure source path helper preserves the observed
`std::path` operations and expects a plan constructed from validated entries.

Apply rechecks the shipped-executable guard before checking for Ready3. The exact
guard errors are `not the shipped exe` and `nothing downloaded`. For each patch,
it ignores the result of removing the destination, renames the stage to the
destination, and propagates a rename error immediately. Earlier replaced patches
remain replaced if a later operation fails; there is no whole-plan rollback.

If the plan also contains an executable, apply:

1. Removes `E.with_extension("old")`, ignoring that result.
2. Renames `E` to the backup. Failure stops immediately.
3. Renames the staged executable to `E`. If this fails, it attempts to rename the
   backup to `E`, ignores the rollback result, and returns the **original second
   rename error**.

After successful replacement, or for a data-only plan, it spawns `E` with the
original argument sequence after argv0. A spawn failure propagates without
rolling back applied files. It drops the returned child handles and does not wait
for the new process. This owner constructs no shell command or updater script.
The remove helper resolves to `DeleteFileW` at IAT `0x1458a5178`; the rename helper
resolves to `MoveFileExW` at `0x1458a5048`. Handle drops bind to `CloseHandle` at
`0x1458a5a98`. The Rust standard library's additional Windows error fallbacks are
part of those helpers, not an application-level retry policy.

## Download stream and remaining integration

`0x14012b670` fetches each part sequentially, finishes that response, and advances
to the next. It publishes wire-byte progress before payload decoding. Every
0.25 seconds or more it updates speed: the first sample uses the instantaneous
rate; subsequent samples use 0.7 previous plus 0.3 instantaneous. The same
ureq2.12.1 agent configuration is used: connect10s, read30s, and exact user agent
`AzerothSurvivors/0.2.0`.
The [part-reader report](main-menu-update-parts.md) now binds short/empty/error
behavior, wrapping counters, every-positive-read publication and the separate
second `now` at a speed update. Its injected source helper compiled and all six
fixtures passed in build25. Source26 connects the transport/worker/UI as code;
no real adapter has been executed.
The target I/O-kind byte0x29 is now bound to `Other` through its own Display and
Debug tables and three closed native lookup checks. No host enum ordinal or live
transport behavior is inferred from that naming proof.

`0x140119320` wraps the concatenated input with a gzip reader (`0x140161480`).
Its caller allocates the0x8000-byte input buffer at `0x1401193e5` and builds the
private BufReader at `0x14011943b–0x140119459` before invoking the constructor.
The exact flate2 1.1.9 public `read::GzDecoder::new` constructs that same private
32KiB BufReader and passes it to `bufread::GzDecoder`; the fixture helper uses
this public route. The target's embedded dependency paths also identify
miniz_oxide0.8.9 (file offset0x6ad9025), which matches the source lock. The
retained record hashes the relevant `gz/read.rs`, `gz/bufread.rs` and
`bufreader.rs` primary sources. This is more specific than substituting an
arbitrary buffered reader or the multiple-member decoder.
Its header parser `0x140155200` explicitly checks magic bytes `1f 8b` and
compression method8 at `0x1401554ca` through `0x1401554de`. It reads decoded bytes
in buffers up to65536, writes through an8192-byte buffer, and verifies the decoded
byte count against root `Download.size` and lowercase SHA-256 text against
`Download.sha256`. Declared part sizes instead describe the input/progress total.
Failure uses `the download is damaged (checksum mismatch)`. The gzip input buffer
is32768 bytes. This gzip payload step is separate from ureq HTTP-content decoding.

The exact reader dispatch at `0x1401670c0` uses an external jump table that limits
the initial scoped Ghidra decompilation. Original table bytes and the separately
retained branch interval `0x140167180`–`0x14016780e`, together with the exact local
primary flate2-1.1.9 source, bind a **single-member** `bufread::GzDecoder`.
Constructor `0x140161929` writes the multi flag at+0xf0=false. The read path at
`0x140167400` checks trailer CRC32, then at `0x140167412`–`0x14016741a` checks
ISIZE. The flag check at `0x140167420` skips further members and ends. The derived
branch interval is not described as an original standalone function. Target
runtime gzip decoding has not been replayed or compared against source fixtures.

The original SHA256 compression owner `0x1404ae320` is now separately bound by
Ghidra and [five closed native checks](evidence/0.92/update-sha256-native-checks.json).
`scripts/check-update-sha256.py` replays its original scalar branch against empty,
`abc`,55/56-byte padding boundaries and a65538-byte payload. It uses the actual
initial words loaded by119320 from `0x1458e5bb8`, supplies the recovered SHA
padding/final byte ordering and compares with Python hashlib. All five passed.
Only the compression interval executes; an in-memory CPU feature byte selects
its existing scalar fallback, and any external call/branch aborts. This runs no
OS, filesystem, HTTP, process or full updater path.

The fixture stream helper reuses the already locked, target-present
`ring=0.17.14` standard SHA256 implementation. The target has a ring digest source
path at file offset0x594ef2d, but this does **not** establish that its custom
updater compression is ring; no original sha2 crate/version is asserted. The
standard algorithm is bound by the original IV/compression checks. `flate2` is
pinned to the exact target1.1.9 version; both crates were already in the source
lock/cache, so no new library download was performed by this subtask.

`decode_verified` accepts an injected concatenated reader and destination writer.
It reproduces the32KiB single-member input route,8192-byte BufWriter and65536-byte
decoded read buffer. It updates SHA before writing each decoded block, explicitly
flushes before checking decoded size/lowercase digest and returns the exact
`the download is damaged (checksum mismatch)` on a manifest mismatch. Decoder,
read, write and flush errors propagate instead. Already written output is left
for the outer worker's existing attempted-stage cleanup rule; this helper does
not delete files or construct an HTTP/file backend.

Its six new fixtures cover every two-part boundary and one-byte/empty parts,
empty content, CRC/ISIZE corruption, expected length/SHA mismatch, the ignored
second gzip member (including a corrupt one),64KiB output reads/8KiB buffering,
and input/write/flush error ordering. The larger compressed fixture was generated
independently by Python gzip/zlib; stored-block fixtures use independently checked
CRC/SHA constants. All six stream cases passed in build24, alongside the earlier
six apply/cleanup/timer cases. A separate Python check of the compressed fixture
embedded in source also passed:100 wire bytes decode to65538 bytes with the
expected CRC/ISIZE/SHA. These are source/fixture results, not an operational
updater or native-runtime gzip parity claim.

The OpenOptions path is now bound through `0x1456afd70`, `0x1456a68b0`, and
`0x1456a6570`: write at+25, truncate at+27, and create at+28 are true; read,
append, and create-new are false. It is equivalent to
`OpenOptions::new().write(true).create(true).truncate(true).open(path)`. Native
Windows code uses CreateFileW with GENERIC_WRITE0x40000000, share7, and
OPEN_ALWAYS4, then truncates an existing file through SetFileInformationByHandle
FileEndOfFileInfo5/length0, with the Rust standard library fallback. This avoids
inferring field semantics from initializer offsets alone.
Three [closed native flag checks](evidence/0.92/update-open-options-native-checks.json)
also passed via `scripts/check-update-open-flags.py`: actual staging flags produce
GENERIC_WRITE/share7/OPEN_ALWAYS4, with two control cases producing OPEN_EXISTING3
and TRUNCATE_EXISTING5. The Unicorn boundary stops before CreateFileW and aborts
on every branch outside the flag-arithmetic interval; no OS call is reachable.

The [data-manifest schema/local missing-patch selection](main-menu-update-data.md)
is recovered and its four pure fixtures passed in build22. Its metadata/combined
plan/UI pipeline compiled in build23 (15.47s); its six injected sequence fixtures
passed within64 focused harness cases. The decoding/checksum fixtures above passed
build24. Six wire-progress/rate fixtures passed build25, bringing the installer
harness to18 cases. Source26 connects the native-gated adapters; compilation and
all five connected memory-only fixtures passed in build26.

[The worker/UI report](main-menu-update-worker.md) records the source26 lifecycle,
production adapters, decoder-before-file-open ordering and new fixture bounds.
Actual HTTP, staging/replacement/restart operations and native/rebuilt updater
rendering remain unexecuted. No real update should be used as a parity test for
the0.92 reconstruction target.
