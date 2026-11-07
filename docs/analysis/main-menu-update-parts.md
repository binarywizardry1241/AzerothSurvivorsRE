# 0.92 sequential update parts and progress

Updated 2026-10-16. Target: supplied **0.92.0** EXE, SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
Current implementation status is owned by [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).
The 0.123.0 [resume repair](update-resume.md) supersedes the historical
error/empty-buffer and HTTP conversion behavior below; the original 0.92 evidence
and past validation retain their original target.

[Curated evidence](evidence/0.92/menu-update-parts.json) binds six Ghidra owners,
their original bytes, five threshold checks, five exact native floating-point
rate checks and three native I/O-kind lookups. Reproduce with
`python3 scripts/recover-menu-update-parts.py`.

`src/update_parts.rs` is a child of `update::install`, now called by the source26
worker through its real gated NativeParts host. It is also exercised through the
installer test harness. It implements functional `Read`
sequencing and shared progress behind an injected `PartHost`. The host supplies
part readers, already-converted open errors, monotonic timestamps and progress
publication. The helper itself contains no I/O backend; source26 supplies those adapters in
`update_worker.rs`, without executing them during reconstruction.
All six new fixture tests passed within18 installer cases in parent build25.
The locked offline build passed in14.34s, test compilation took7.54s, and105
harness cases with overlap passed:41 binary,15 native-save,6 Options config,
1 run-modifier,10 save-browser,14 updater and18 installer. Logs are
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-build-25-save-events-talents-progress.log` and
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-tests-25-save-events-talents-progress.log`.
The final build26 passed with `--locked --offline` in11.08s; the preceding
combined build passed in29.09s. All169 focused harness cases passed with overlap:
74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater and18
installer, including all five connected memory-only worker fixtures. Test
compilation took12.95s. Logs are
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-build-26-final.log` and
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-tests-26-menu-bridges.log`.
No requests, update downloads, file replacements or app/process launches occurred.

## Part sequencing

`0x14012b670` stores the current reader at self+0x28/+0x30 and the next/end part
pointers at self+0x10/+0x18. It opens a part only when no current reader exists.
The index/pointer advances **before** the request, so an open failure consumes
that part's index and leaves no current reader. A read failure instead preserves
the current reader. Both errors return before progress/time/publication. The
outer download owner propagates the error and stops; these state details do not
introduce an application retry policy.

A positive short read returns immediately after progress publication. It does
not fill the remaining caller buffer from another part. `Ok(0)` drops the current
reader before opening the next; empty parts are skipped. With no remaining part,
the method returns zero without a final progress publication.

There is no early return for an empty caller buffer. If the response reader
returns `Ok(0)` for that buffer, the native owner treats it as EOF and continues
opening/reading/dropping the remaining parts. Such a call can drain the remaining
part list without accounting any bytes. The source preserves this observed edge
case instead of substituting a conventional empty-buffer shortcut.

The native HTTP-error wrapper call at `0x14012b94e` supplies I/O-kind byte0x29 to
`0x1403a3c30`. This EXE's43-entry Display and Debug tables bind41 to `Other`,
displayed as `other error`. This is target evidence, rather than an assumed
host Rust enum ordinal: its preceding kind40 is `TooManyOpenFiles`, and42 is
`Uncategorized`. The native Display branch at `0x1456dae9a` looks up lengths
through `0x146aef260` and pointers through `0x146aef3b8`; the Debug tables are
at `0x146aef510`/`0x146aef668`. Three closed native lookup checks passed.

The full Display owner's scoped Ghidra output stops at its external jump table;
the exact in-owner branch is separately retained, with that boundary explicit.
The conversion helper also truncates after allocation. Those decompiler limits
do not prevent naming the original kind from its actual tables, but they do not
establish a complete live transport adapter. `PartHost::open_part` receives an
already-converted `io::Error` and propagates it unchanged. Source26 NativeParts
uses `io::Error::other` for the ureq conversion; no real request was performed.

## Byte accounting and publication

Worker `0x1400e8d80` initializes one progress context before the patch and optional
EXE downloads: done0, total from the complete plan, rate0, last-sample bytes0 and
an initial `now` at `0x1400e8dc9`. Each artifact's part reader borrows this same
context, so progress and speed continue across artifact boundaries.

Each positive response-reader count is added to done with wrapping `u64`
arithmetic (`0x14012b6e2`); there is no cap at the manifest total. These are bytes
returned by the HTTP response reader before payload gzip decoding. They exclude
HTTP headers/framing and are not the decoded output count. “Wire” here names
the updater's compressed-body progress lane, not raw TCP traffic.

The native context layout used by this owner is:

| Offset | Field |
| --- | --- |
| +0x00 | cumulative done |
| +0x08 | complete plan total |
| +0x10 | f64 smoothed bytes/second |
| +0x18 | done at previous speed sample |
| +0x20/+0x28 | state/retained-plan references |
| +0x30/+0x38 | previous sample timestamp seconds/nanoseconds |

After accounting, every positive read optionally updates speed, clones the
retained plan with `0x14012bf90`, publishes Downloading2 through `0x140112360`,
then returns the original read count. Publication is **not** throttled to the
speed-sampling interval. The injected callback currently receives the numerical
snapshot; a future worker host must attach that same retained plan when it
publishes the complete native state.

## Exact speed sampling

`0x1456a1e60` obtains `now`, subtracts the saved timestamp and converts a backwards
result to zero. `0x14012b6f1–0x14012b72d` converts elapsed seconds and nanoseconds
to `f64` as `seconds + nanos / 1_000_000_000` and samples only at elapsed>=0.25.
Below that threshold, rate and previous sample byte/time lanes remain unchanged;
zero elapsed therefore never divides by zero, but still publishes the new done.

At a speed sample:

```text
instantaneous = wrapping_sub(done, sampled_done) as f64 / elapsed
rate = instantaneous                         if old_rate == 0
rate = 0.3 * instantaneous + 0.7 * old_rate    otherwise
```

The literal coefficients at `0x1458c07a8/+0x8` are0.7/0.3. This is a zero-rate
test, rather than a separate “first sample” boolean. At `0x14012b9cd` the owner
calls `now` **again**, stores that second timestamp and current done, then
publishes. Reusing the timestamp obtained by `elapsed()` changes later speed
samples and is not the native sequence.

The closed checks replay only the conversion/threshold block and arithmetic
`0x14012b966–0x14012b9cd`. The latter stops before the clock call. The five
threshold cases include zero,249999999ns and250000000ns; five rate cases include
the first sample, smoothing, unsigned counter wrap and maximum unsigned count.
All ten passed, with exact `f64` bit comparison for rates. No OS, clock, HTTP,
publication or full updater path executes in that replay.

## Source fixtures and remaining work

The six injected cases cover lazy opens, short reads, empty parts and drop order;
threshold/first-rate/blend/second-now reset; zero/backwards time; retained read
errors versus consumed open indices; empty-buffer draining; and shared progress
across artifact readers with wrapping counters/no total clamp. All six passed
in build25. The separate kind lookup replay stops before the formatter callback
or stack epilogue; it runs no OS or HTTP operation.

The source26 [worker/UI integration](main-menu-update-worker.md) connects the
real gated HTTP/time/staging/apply/process adapters as code. Compilation and all
five connected memory-only fixtures passed in build26. No live adapter, HTTP
request, staging/install operation or updater UI was executed.
The stream fixtures passed build24 and the part fixtures build25; those results
do not establish operational updater or visual parity.
