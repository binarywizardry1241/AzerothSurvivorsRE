# 0.92 updater lifecycle, worker and state UI

Updated 2026-10-16. Target **0.92.0**, SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
[Curated evidence](evidence/menu-update-worker.json) retains11 scoped Ghidra
owners,3 exact in-owner UI branches,7 literal bindings and2 math imports.
`python3 scripts/recover-menu-update-worker.py` reproduces those static bindings.
Its derived branch intervals are not presented as original standalone functions.

Source26 connects `update::worker` to `update_ui`, the existing plan/check rules,
`update::install`, its part reader, stream decoder and apply helpers. The production
adapters are now code: native-gated thread creation, ureq response readers,
Instant sampling, OpenOptions staging, std filesystem replacement and Command
respawn. **No live adapter was executed.** The `AzerothSurvivorsRE` artifact remains
ineligible; there is no forced banner or gate bypass. The final locked/offline
build26 passed in11.08s, and all five new memory-only fixtures passed.

## State and lifecycle

`State` preserves Empty0, Available1, Downloading2, Ready3 and Failed4. Every
nonempty state retains the same `UpdatePlan`; Downloading additionally holds the
shared wire-byte progress/rate snapshot, and Failed holds the error text.

The check owner publishes Available before reading `WOW_ROGUE_UPDATE_AUTO`.
Exact `1` invokes the same start owner as Download & restart or Try again.
`0x140113bf0` only accepts Available/Failed, re-queries the exact eligibility
helper, publishes Downloading(done0,total from all part sizes,rate0), then creates
the named `rogue-update` worker. Thread-spawn results are discarded, so the
source introduces no synthetic failure state or retry when thread creation fails.
The eligibility helper reads opt-out first and swallows current_exe/Unicode/name
failures into ineligible; the real apply adapter reproduces that behavior.

`0x14001ab20` makes Downloading/Ready modal regardless of dismissal or the menu
lifecycle resource. Available/Failed require !dismissed and the proved enabled
menu context. Their dismissed form uses the banner. Later and banner reopening
change the same in-memory flag; they do not write a preference file.

`0x140019290` compares the body's nonempty/category pair, with category bytes
`[0,0,1,2,3]` for the five states. A category change clears body children and calls
`0x14000eb90`. The outer panel, sparks and opening timestamp survive. The source
therefore replaces only the body on state-category changes; positive-read progress
publications do not reset the modal fade or progress smoothing.

## Connected worker and adapters

The worker captures one initial Instant before constructing stage paths. The
production stage host returns Duration::ZERO for that existing origin, without
calling elapsed/now a second time. It borrows the retained plan through artifact
setup, cloning it at publication; no setup clone shifts the origin. It processes
pending patches in their original order, then the optional EXE. Each attempted
stage is recorded before its download. The source adds no directory creation,
name sanitization or application retry.

Each artifact constructs a fresh ureq2.12.1 agent with connect10s, read30s and
`AzerothSurvivors/0.2.0`. The exact order is agent → sequential PartReader → public
read::GzDecoder construction/header read → OpenOptions(write/create/truncate) →
decode/hash/write/flush/verification. `decode_verified_with` accepts an output-open
closure to preserve that order. The earlier injected writer wrapper remains
available to its existing fixtures. HTTP errors become `io::Error::other`, bound
to native kind0x29/Other by the target's own tables.

A failure removes every attempted stage in order, ignores cleanup failures,
prints `update: download failed: {error}` to stdout and publishes Failed with the
original plan. Successful staging publishes Ready. The shared progress context
continues across every patch and the EXE; the [part-reader report](main-menu-update-parts.md)
records accounting and speed semantics.

Ready starts a1.2-second deadline. Leaving Ready resets it. Once due, the main
app invokes the [recovered apply sequence](main-menu-update-install.md): regate,
patch removals/renames, optional EXE backup/replacement/attempted rollback, then
respawn. The real adapter reads argv after file replacement and passes every
argument after argv0 to direct Command; it drops the child without waiting.
Successful spawn emits AppExit::Success. Apply errors produce the exact localized
`Could not put the update in place: {error}` and Failed with the retained plan.
No extra protection, rollback or restart script is introduced.

## State constructors and progress display

Downloading and Restarting use40px GOLD headings and the native versions row
only when the plan includes an EXE. A30px `(1,.914,.659)` percent label starts at
`0%`; a13px MUTED line displays progress. Failed uses `The update failed`, a15px
red `(1,.353,.235)` centered error with max-width460, and the same footer helper
with Try again(action0) and Later(action1). There are no work-state footer buttons.

The outer progress bar is440×22, padding3, border1, radius11, black alpha.6 and
BUTTON_EDGE border. Its black alpha.7 shadow has y1/spread0/blur4. The fill starts
at width0, has100% height, radius8 and clipped overflow. Its PI gradient uses raw
linear PAPER/GOLD/darker-gold stops `(1,.914,.659)`, `(.973,.824,.416)` and
`(.588,.392,.110)`. Its glow is raw linear `(1,.7,.25,.55)`, spread1/blur10.

`0x14001c4b0` supplies target `done as f32 / max(total,1) as f32`, without a clamp;
Ready targets1. Each frame uses `value += (target-value)*(1-expf(-8*delta))` and
snaps when abs(target-value)<.001. The fill width and percent text both use this
smoothed value×100. An isolated compile-only formatting probe produces the same
8-byte native template for `{:.0}%`; the MiB `{:.1}` template also matches.
This binds formatting precision without executing the target formatter.

Downloading details use `{done} of {total}`. Positive speed adds
` · {rate}/s · {secs}s left`, with MiB1decimal size labels, a saturating/truncated
u64 speed value and `ceil(saturating_sub(total,done) as f64/rate)` seconds. Zero or
negative speed omits the suffix. Ready displays `{size} · checked`, summing part
sizes again. The sheen has width70,100% height and a white alpha0/.65/0 PI/2
gradient; its left is `fract(elapsed/1.4)*560-80` pixels.

## Validation bounds

The connected stage fixture explicitly records exactly one initial clock request,
then artifact agent/header sampling before the file-open callback. It uses supplied
timestamps, not live timing. The five new injected cases exercise accepted-state/regate/publication/spawn
ordering; the actual PartReader → gzip → open → writer/progress → Ready connection;
attempted cleanup and Failed; delayed apply failure localization/success exit;
and modal visibility/no-clamp/easing. All fixture reads/writes are in memory and
spawn hosts only record requests. Existing installer/stream/part tests remain.
The final build26 passed with `--locked --offline` in11.08s; the preceding
combined build passed in29.09s. All169 focused harness cases passed with overlap:
74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater and18
installer. Test compilation took12.95s. Logs are
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-build-26-final.log` and
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-tests-26-menu-bridges.log`.

No original or rebuilt app, live metadata/HTTP request,
part download, staging file, replacement or process launch was used to validate
this batch. Platform filesystem/TLS/process behavior and native/rebuilt updater
rendering remain unverified; connected source alone does not establish1:1 parity.
