# 0.92 data-update manifest and selection

Updated 2026-10-16. Target: supplied **0.92.0** EXE, SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
[The curated evidence](evidence/menu-update-data.json) retains seven scoped
Ghidra owners, original function-byte hashes, exact strings, metadata import
bindings and261 closed native filename checks. Reproduce it with
`python3 scripts/recover-menu-update-data.py`. This is analysis tooling; building
the source does not need the reference EXE.

`src/update_data.rs`, exposed as `update::data`, implements pure helpers:
`DataManifest::from_json`, `patches`, and `into_pending`. The last accepts an
injected callback returning metadata length. Its four fixtures passed in parent
build22 (11.82s;26 binary tests passed). `src/update_check.rs` now connects these
rules to exact-gated preparation and a metadata-only worker. Build23 passed
(15.47s);64 harness cases passed:35 binary,15 native-save and14 updater integration. It
exposes injected `PrepareHost`/`CheckHost` APIs and six sequencing fixtures;
the real adapter uses environment/current-executable lookup, ignored old-backup
cleanup, independent HTTP clients and local metadata lengths. `UpdateUi` receives
the combined plan. This batch has not run that adapter, requested metadata,
cleaned a backup, launched an app, downloaded an update, installed or restarted.
Source26 connects the native-gated part-download/install/restart adapters as code;
no live adapter was executed. See [worker/UI integration](main-menu-update-worker.md).
The final build26 passed with `--locked --offline` in11.08s; the preceding
combined build passed in29.09s. All169 focused harness cases passed with overlap:
74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater and18
installer, including all five connected memory-only worker fixtures. Test
compilation took12.95s. Logs are
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-build-26-final.log` and
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-tests-26-menu-bridges.log`. No app, metadata/HTTP
request, download, staging/replacement/install or process launch was executed.

## Manifest validation

Before constructing its worker, `0x140112920` checks exact executable eligibility,
then attempts to remove `current_exe.with_extension("old")` and ignores that
result. The removal chain is `0x1456b39b0 →0x1456b6420 →DeleteFileW`. It next
reads `WOW_ROGUE_UPDATE_URL` and `WOW_ROGUE_DATA_URL` independently, in that order.
A successful environment-string result is retained verbatim, including an empty
string; every lookup failure uses the respective embedded default:
`https://wow.aethus.pl/exe/latest.json` and
`https://wow.aethus.pl/exe/data/patches.json`. No trim, empty-value substitution
or URL validation appears before the URLs are captured into the worker closure.
The updater's Data path comes from the eligible executable; it does not read the
source application's separate `--data-dir` option.

`0x140118e40` fetches the data URL with the same ureq configuration as the
[latest-EXE checker](main-menu-update.md), feeds the response reader to JSON
parsing and requires root `patches` to be an array. An absent or wrong-type field
returns `no patches`; an empty array is accepted. `0x14013a7d0` and
`0x1400f1360` collect the entries in order and stop on the first error. They do
not skip invalid entries or return a successful partial list.

Each `0x140150850` invocation derives the base URL prefix through the final `/`
and calls the existing `Download` parser (`0x140118060`) **before** validating the
name. Consequently its `no parts` or `a download is listed incomplete` error
takes precedence over an invalid filename. The normal part URL/default/SHA rules
remain those documented in the latest-EXE report.

It then creates an ASCII-lowercase copy of the name. Instructions
`0x140150b50–0x140150b96` require exactly11 bytes: `patch-`, one ASCII
alphanumeric byte, then `.mpq`. Examples accepted by that rule include
`patch-0.mpq` and `PaTcH-Z.MpQ`; names with extra characters, separators,
non-ASCII letters or punctuation in the single-byte lane fail. The lowercase
copy is discarded; both successful Download and the exact error
`{name} is not a data patch's name` retain the original spelling.

The bounded Unicorn check executes only that comparison block with the
ASCII-lowercase copy supplied as input. It tested every possible byte in the
single-character lane, plus mixed-case and invalid-length/path cases:261/261
passed. Success and failure branches stop before allocations, helpers or
imports. The JSON parser and HTTP owner are not executed by that replay.

## Local selection

`0x1400e7f80` derives `current_exe.parent().unwrap_or(Path::new(".")).join("Data")`.
`0x140158bd0` appends each original patch name and calls `std::fs::metadata`.
It retains a patch when metadata returns any error or when its file length
differs from `Download.size`. Matching length skips the patch. This selection
does not hash local contents, require a file type or deduplicate entries; order
and repeated names survive.

The metadata call chain is `0x1456b3d60 →0x1456b62b0 →0x1456b6570`.
The latter's fallback resolves to PE imports `FindFirstFileExW` and `FindClose`.
It combines the returned size-high/size-low fields at
`0x1456b66ac/0x1456b66b0` and stores the resulting length in Result+0x38 at
`0x1456b66d0`. The selection owner loads that lane at `0x140158d18` and compares
it with Download+0x48 at `0x140158d80`. This binds the compared value to file size,
rather than inferring it from a decompiler local name.

The source callback API reproduces these decisions without reading actual game
files. Its fixtures cover equal length, wrong length, metadata error, zero size,
duplicates, ordering and original path spelling.

## Check ordering and remaining plan/UI work

The native check worker `0x1400e7f80`:

1. Fetches latest executable metadata. A failed fetch is logged and becomes no
   executable update; a successful version that is not newer is discarded.
2. Fetches data metadata even if step1 failed or found no newer executable. A
   data error is logged and becomes an empty patch list.
3. Selects pending patches using the metadata-length rule above.
4. Publishes nothing when there is neither an EXE nor a pending patch.
5. For pending patches without an EXE, synthesizes version `0.92.0` and literal
   notes `New game data for this version: the models and textures it shows.`
   The executable download remains None. Otherwise it retains the newer
   executable manifest and attaches the pending patches.
6. Publishes Available1, then may invoke the install worker only when
   `WOW_ROGUE_UPDATE_AUTO` is exactly `1`.

The Available dialog branch at `0x14000ec39` tests the optional executable at
plan+0x50. A data-only plan uses locale key `New game data` and omits the versions
row. At `0x140010a0d–0x140010b52`, the original instructions sum optional EXE
part sizes plus every pending patch part size before the MiB formatter; the
scoped decompiler omitted these integer accumulators. The same total feeds the
native start-download owner.

These application rules are statically recovered and implemented for build23.
`CheckRequest::prepare_with` preserves the gate/cleanup/endpoint order;
`check_with` logs endpoint failures and continues rather than returning an
installer failure. `UpdatePlan` retains optional EXE, ordered pending patches,
native data-only version/notes and a wrapping-u64 part-size total. `UpdateUi`
selects the heading and version row from the optional EXE. Each manifest request
constructs its own10s-connect/30s-read ureq agent, consumes `into_reader` and feeds
JSON parsing. All six sequencing fixtures passed in build23 and record operations
in memory. Native/rebuilt rendering of these new states remains not run.

The native log helper `0x1456b36b0` selects the six-byte `stdout` literal at
`0x146ae3338`; the source adapter preserves its messages with `println!`.
The prepared request never follows part URLs. The [download/install/restart adapters](main-menu-update-worker.md) and exact
automatic start are connected in source26; compilation and connected memory-only
fixtures passed in build26.
No request to the live endpoint or runtime comparison was performed.
