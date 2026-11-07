# 0.92 update checker and menu notification

Updated 2026-10-16. Target: supplied **0.92.0** executable, SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
The [curated native record](evidence/menu-update-native.json) binds the
instructions, embedded strings, Ghidra evidence IDs and bounded pure-function
checks to that target. `scripts/recover-menu-update.py` reproduces the record;
it requires the reference only for analysis, never for the source build.

`src/update.rs` implements native eligibility/version/schema rules;
`src/update_check.rs` implements gated preparation, EXE/data metadata requests and
combined plan selection. `src/update_ui.rs` implements the notification,
EXE/data-only dialog, Later/reopen actions and native animation. The current
executable stem, `AzerothSurvivorsRE`, fails the native gate, so it starts no
request, performs no backup cleanup and forces no banner.

Source26 now connects Download & restart and exact AUTO behavior to the native
lifecycle, ordered worker, real gated transport/file/process adapters, Ready timer
and apply/restart path. [The worker/UI report](main-menu-update-worker.md) records
the implementation and remaining runtime verification limits. The final
locked/offline build26 and all five connected memory-only fixtures passed. The current artifact
name still fails the native gate. No metadata request, backup cleanup, download,
replacement or app/process launch was performed in this batch.
Parent build23 passed (15.47s), with64 harness cases passing:35 binary,15 native-save
and14 updater integration cases. These include all six new preparation/check
fixtures. Source visual verification remains not run. Parent build24 also passed offline
(16.29s), with53 harness cases passing:35 binary,6 Options config and12 installer
fixtures. That includes six new stream-decode/verification cases; it does not
connect a real installer backend.
Parent build25 passed locked/offline in14.34s and all105 focused harness cases
with overlap passed (7.54s test compilation). Its18 installer cases include the
six new [injected part-reader/progress fixtures](main-menu-update-parts.md).
The native I/O-kind0x29 is also bound to `Other` through target tables and closed
lookups. At that checkpoint the installer, worker state UI and transport remained
disconnected; source26 connects them as code.

The final build26 passed with `--locked --offline` in11.08s; the preceding
combined build passed in29.09s. All169 focused harness cases passed with overlap:
74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater and18
installer. Test compilation took12.95s. Logs are
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-build-26-final.log` and
`runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-tests-26-menu-bridges.log`. No live adapter, app,
metadata/HTTP request, download, staging/replacement/install or process launch
was executed.

## Eligibility and comparison

`0x14011a0c0` reads `WOW_ROGUE_UPDATE` first; exact `0` disables the worker before
querying the executable. Otherwise it obtains that path and requires its Unicode
file stem to compare
ASCII-case-insensitively with the 16-byte `AzerothSurvivors`. The original spelling
is embedded at `0x1458e4528`; the comparison helper is `0x14010b3b0`.

`0x140119dd0` strips repeated leading lowercase `v`, splits on `.`, trims Unicode
whitespace from each lane (`0x14010afd0`), and parses each as `u64`. Empty,
invalid, negative or overflowing lanes become zero (`0x1400fd690`); `+` is accepted
by integer parsing. It compares the resulting vectors lexicographically, including
their lengths. This differs from SemVer: `1.0.0.0` sorts above `1.0.0`, and
`1.0.0-beta` compares equal to `1.0.0`. There is no recovered prerelease policy.

After a successful check, `0x1400e7f80` starts the automatic install worker only
when `WOW_ROGUE_UPDATE_AUTO` is exactly `1`. `true` and other spellings do not
select that branch. The source now invokes the same native-gated start owner for exact `1`; other values do not select that branch.

## Endpoint and manifest contract

`0x140112920` reads `WOW_ROGUE_UPDATE_URL` with embedded default
`https://wow.aethus.pl/exe/latest.json`, and `WOW_ROGUE_DATA_URL` with default
`https://wow.aethus.pl/exe/data/patches.json`. The latest-fetch owner
`0x1401185f0` supplies the exact user agent `AzerothSurvivors/0.2.0` despite the
game target being 0.92.0. Its builder matches the native ureq2.12.1 dependency and applies a 10-second
connect timeout and 30-second read timeout. The field binding follows the native
default constructor `0x14039bb50` and primary ureq2.12.1 source: AgentConfig+0x68
is `timeout_connect`, +0x78 is `timeout_read`; the fetch owner stores10 and30 there.
The native response path is `GET.call().into_reader()` followed by JSON reader parsing.
The deeper part-reader trace corrected the earlier `into_string` attribution: its
data/vtable pair is passed to `0x14010bf70`. Source now uses
`serde_json::from_reader(response.into_reader())`; this correction removes the
extra size/lossy-UTF8 behavior introduced by `into_string`; build21 compiled it.
The source uses this sequence with ureq2.12.1 and the parent-pinned rustls0.23.43.
The acquired crate source and SHA are retained in the curated record. A failed
metadata check only records/logs an error; it does not synthesize installer-failure
state4 or show “The update failed.”

The latest JSON object must contain a nonempty string `version`; `notes` defaults
to an empty string when absent or of another type. The same root is a download
object, parsed by `0x140118060`:

```json
{
  "version": "0.94.1",
  "notes": "...",
  "name": "...",
  "size": 0,
  "sha256": "64 bytes of text",
  "parts": [{"url": "...", "size": 0}]
}
```

This schema illustration is not an acquired server response. `name` defaults to
empty; absent or non-unsigned-integer `size` defaults to zero. `parts` must be an
array and nonempty. SHA text is ASCII-lowercased and must have exactly 64 UTF-8
bytes; the parser does not check that every byte is hexadecimal. Part entries
preserve their order and default invalid/missing `url` and `size` to empty/zero.

`0x140141680` retains a part URL when it contains `://` anywhere. Otherwise it
concatenates the manifest URL prefix through its last slash and the part string.
This is literal concatenation: it does not resolve `..`, leading slashes or other
URL syntax. The source helper preserves that behavior. Native errors, in their
recovered validation order, are `latest.json is incomplete`, `no parts`, and
`a download is listed incomplete`.

Ten closed x86-64 checks passed against the actual string-search/comparison
functions. The Unicorn instruction boundary permits only those two functions and
an emulated `memcmp` thunk, whose identity is bound to the PE import table. No OS,
filesystem, HTTP, updater or restart code is reachable during these checks.
Ghidra analysis of `0x140153590` failed; its exact bytes and these bounded checks
provide the retained evidence for its `contains` behavior.

The separate [data-manifest report](main-menu-update-data.md) binds its `patches`
schema, filename whitelist, length-only local selection, EXE/data check order and
data-only Available plan. The source now follows that sequence for build23.
Native and source data-only UI use “New game data,” omit the version row and
include pending patch part sizes in the download label. Build23 compiled the source and passed its injected fixtures; rebuilt rendering
of these states remains not run.

## Native UI observation and static layout

The isolated reference profile displayed an update from **v0.92.0 to v0.94.1**.
Clicking the bottom-right banner opened a dialog with the new version, release
notes, a **43.0 MB** download label, **Download & restart**, and **Later**.
`runtime/analysis/history/native-recovery/reference-captures/1415f0451c23/update-dialog.png` records that state. Clicking Later
closed the dialog and restored the banner. No update was downloaded or installed,
and the target remained 0.92.0. This is a dated native runtime observation, not a
claim about the current server response.

`0x140019770` constructs the banner at right14/bottom32, with Auto left/top,
padding16×7, border1 and radius4. It uses the common red gradient, GOLD border,
14px body text in PAPER, and a raw-linear `(1,.7,.25,.5)` glow with offset0,
spread1 and blur10. The text is the exact locale key
`v{version} is out · Update`. Its bundle's6300 value is GlobalZIndex, corroborated by the retained native tuple
name containing `update::Badge`, Node and GlobalZIndex. The source preserves this
independent screen root; it is not placed inside the main menu's scaled Canvas.

The dialog child dispatcher `0x14000eb90` uses five state arms: empty, available,
downloading, restarting, failure. Its external jump table is at `0x1458aa984`.
The separately derived branch entry `0x14000ec39` stays within the exact original
function bytes; it is not claimed to be a standalone original function.
`0x14001ab20` creates the full-window root; `0x140214460` supplies a 600×420
Canvas with maximum scale1.3 and a common panel whose width is540px. Its content
height is automatic. The native captured panel width near702 logical pixels is
consistent with that1.3 scale. The source now uses this Canvas, with an Auto-height
panel width540, padding36×26, border2, radius10 and clipped overflow. A width100%
content column has12px row gaps. Header40 uses the heading font. The version line
uses a single Text with spans:17px muted `v{current}  `,17px edge `»  `, then19px
green `v{new}`. Notes are15px, width460 and centered; the13px download label sums
part sizes and always formats one decimal MiB with the native `{n} MB` locale
key (`0x14000ea60`, multiplier1/1048576). Footer margin-top8 and gap14 accompany
17px buttons, horizontal padding28/22 and vertical padding10. These are static
reconstruction facts; rebuilt rendering has not been checked.

`0x14001a340` statically confirms the updater's own one-byte action tags. On
Pressed(tag0), action0 calls the same install-worker owner `0x140113bf0` as the
automatic route; action1 sets the dismissal flag at resource+0x10 to true; action2
sets it false. The available dialog assigns0 to Download & restart and1 to Later.
The banner assigns2. These tags belong to this updater component and must not be
confused with the shared picker action enum. The native runtime Later/reopen
observation agrees with this state transition; dismissal is not shown to persist
across application restarts.

The same updater-specific painter copies the literal scale `.97` for Pressed,
`1.05` for Hovered, and `1` for None into UiTransform.scale x/y (component+16/+20),
using table `0x1458aa968`. This is a different component/query path from the
picker's border/lift helper; it must not be applied to unrelated controls.

## Lifecycle resource, fade and particles

The updater does not gate its notification on the currently selected menu page or
open Options/dialog state. The exact system bridge `0x140027170` registers its
shared resource through `0x140056c20`, with TypeId bytes at`0x1458b5270`:
`e1c3ee471a2392e0d90b30cc6bbc063b`. Registration proves a20-byte resource with
alignment4 and no destructor. `0x140063c3f` registers the same TypeId, and
`0x140063c6f` constructs it with word+0=0, word+8=0, bool+12/+13 copied from the
ScreensPlugin input byte+8, and bool+14/+15/+16=false. The updater tests native
byte+0==0 and bool+13==true. Its original Rust type name has not been recovered;
`NativeUpdateContext` is the source adapter for these proved fields. This app's
menu-only lifecycle supplies mode0 and menus-enabled=true. No page/dialog guess
is used. `UpdateUi::modal_open(&context)` exposes input suppression to the owner.

`0x140011320` initializes the updater dismissal flag false. A successful newer
result therefore opens the modal first. Later sets the flag true; the bottom-right
banner sets it false. No dismissal file is written. `0x14001b140` reads elapsed
seconds from Time+0x5c, subtracts the modal creation timestamp, and fades over.45s.
The shade alpha is `clamp(t,0,1)*.62`; with`q=clamp(t,0,1)-1`, panel scale is
`(1+2.70158*q^3+1.70158*q^2)*.4+.6`.

The dialog has16 sparks, distinct from the backdrop's28. For index`i`, size is
`fract(i*1.37)*2.5+2`; x seed`fract(i*.618034)*100`, speed
`fract(i*.731)*.12+.1`, phase`fract(i*.293)`. For elapsed seconds`e`,
`t=fract(speed*e+phase)`, left%=seed+`2*sin(9*t+6*phase)`, top%=100-110t and
Srgba alpha=`.7*sin(PI*t)` with RGB`(1,.8,.35)`. Their native constructors and
animation owner are included in the curated evidence.

Installation paths/rollback/restart sequencing and the data-manifest schema/local
selection are now recovered, with injected fixtures described in the
[installer](main-menu-update-install.md) and [data](main-menu-update-data.md)
reports. Source26 connects the worker, real adapters and Downloading/Ready/Failed UI.
Actual installer operations, dismissal persistence across restarts and native/rebuilt
updater visual verification remain not run. Source compilation alone does not
establish updater parity.
