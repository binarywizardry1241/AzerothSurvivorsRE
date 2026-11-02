# Updater frontend lifecycle — 0.105.0

This report is bound to the previously selected **0.105.0** EXE, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
The [manifest](evidence/0.105.0/updater/manifest.json) retains 21 original owner
hashes and REA/Ghidra identities, 23 selected instruction intervals, the actual
dialog jump table and fifteen literal bindings. The [instruction vectors](evidence/0.105.0/updater/native-vectors.json)
record 159 bounded checks. Original PE instructions corroborate raw-function
Ghidra imports; no application or updater adapter executed.

[Current0.109.0 recovery](updater-0.109.0.md) now revalidates the owning native
contracts; the historical results below retain their actual target.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the integrated gap status.

## Implemented correction

`update_ui.rs` previously initialized `NativeUpdateContext` once with mode zero
and menus enabled; no live system ever updated it. Available/Failed prompts
and the dismissed banner could therefore remain eligible during Enter, in a
run, or in the stock GlueXML frontend.

The source now derives these fields from the real frontend: `MenuState.entering`
supplies the entering tag; the menu flag requires the custom frontend and
`!MenuState.in_run`. It initializes the process flag from `LocalStockFrontend`,
synchronizes before Update input, and synchronizes again after the live run
input transitions before rebuilding the overlay. Returning from a run restores
custom-menu eligibility. Menu page, Options and other dialog choices do not
replace the native lifecycle gate.

The target's current popup `1400c4420` and banner `1400c3070` read frontend tag
byte zero and bool `+13`. Keyboard `140059aa0` writes tag one and time `-1` on
Enter. Frontend event stores `14005cb57..14005cb7b` clear tag zero and bool
`+13` on world entry; `14005d7e9..14005d7fe` restore that bool from process
custom-mode bool `+12` on return. The existing [frontend initialization](evidence/0.105.0/terminal/return-routing-manifest.json)
owns the canonical `140040322..14004034d` extract: stock mode initializes the
custom-mode flags false. These are actual field consumers/producers, not a
gate inferred from the visible menu page.

## Revalidated state and action contracts

| Native owner | Contract and source correspondence |
|---|---|
| `1400b7ef0`, table `145d9d9e8` | Empty0, Available1, Downloading2, Ready3 and Failed4. The original five destinations are retained because headerless Ghidra cannot recover this external table. |
| `1400c4420` | Downloading/Ready force a modal regardless of dismissal or frontend. Available/Failed require an enabled idle custom menu and `!dismissed`; Empty stays hidden. |
| `1400c3070` | Only Available/Failed with a retained version and dismissed flag can show the banner, under the same menu gate. |
| `1400c3c40` | Both dense and sparse query paths require changed Pressed interaction. Action0 starts/retries, action1 sets in-memory dismissal, action2 reopens. No dismissal preference is persisted. |
| `1400b904c`, `1400ba061` | Failed constructs Try again0/Later1; Available constructs Download & restart0/Later1. Downloading/Ready have no footer action or user cancellation control. |
| `1400c2b90` | Nonempty/category comparison uses bytes `[0,0,1,2,3]`; work progress publications preserve the surrounding modal and opening clock. |
| `14007b2e0`, `140248550` | Start accepts only Available/Failed, rechecks eligibility and publishes Downloading before spawning `rogue-update`; automatic start requires exact `WOW_ROGUE_UPDATE_AUTO=1`. |
| `1400c5b80` | Ready sets the existing 1.2 second deadline; leaving Ready clears it. A due deadline calls apply, success requests application exit, failure publishes the localized error and retained plan. |

The current literal and branch bindings preserve the available version/notes
display, Downloading/Restarting/failed headings, current version `0.105.0`,
button labels and `Could not put the update in place: {error}`. No invented
Cancel button or new updater state was introduced.

## Metadata and worker review

The same bounded native review binds eligibility `140080fa0`, preparation
`14007a040`, numeric version comparison `140080cb0`, latest/download schemas
`14007f4d0`/`14007ef40`, data schema/patch validation
`14007fd20`/`140151770`, metadata combination `140248550`, staged worker
`140249350`, per-artifact download `140080200` and apply `14007a830`.

The existing source rules remain consistent with the inspected 0.105.0 branches:
exact opt-out `0`, the case-insensitive `AzerothSurvivors` executable stem,
numeric version lanes, nonempty latest version, literal relative URL
concatenation, 64-byte lowercase SHA text and ordered part/schema defaults.
Patch names remain exactly `patch-<ASCII alphanumeric>.mpq`; the base
`patch.mpq` is not admitted by this updater manifest parser.

The staged worker attempts patches in order and the optional EXE last,
records an attempted path before each download, cleans attempted paths on
error, retains the plan in Failed4, and publishes Ready3 on success. Each
artifact retains the 10/30 second HTTP agent configuration and
`AzerothSurvivors/0.2.0` user agent. The download owner constructs the gzip
reader before opening staging output, uses the same 32 KiB compressed input,
8 KiB writer and 64 KiB decoded buffer, and compares decoded size/SHA before
success. Apply retains regating, patch-first replacements, EXE backup/attempted
rollback and direct argument-preserving respawn.

Those reviewed top-level contracts do not revalidate every shared HTTP, gzip,
hash, part-reader or Windows standard-library implementation. The historical
[worker](main-menu-update-worker.md), [parts](main-menu-update-parts.md) and
[installation](main-menu-update-install.md) reports retain their 0.92 provenance
for such dependencies. No current network, TLS, filesystem, process or rendered
interaction parity is asserted.

## Checks and limits

The bounded original-instruction checks passed **159 cases**: 40 modal gate,
80 banner gate, eighteen actions across both native query paths, six frontend
field transitions, six Ready deadline cases and nine patch-name cases. Every
executed instruction is byte-checked against the exact PE; writes are confined
to scratch memory. Start calls are recorded and skipped. No native callee runs.
The successful invocation was
[native_updater.py historical recipe](../SCRIPTS.md#historical-execution-sources) during initial recovery,
when the script covered nineteen owners and seventeen instruction intervals.
The final manifest extends that ownership record to 21 owners and 23 intervals;
the final script has not successfully replayed that expanded record.

`scripts/native_updater.py` also traces the corrected source lifecycle,
schedule boundaries and retained work-state modal rules. Its final
`latest_target(verify=True)` preflight now fails with the unregistered newer
0.107.0 identity above; no `--check` invocation passed. There is no older-target
fallback or bypass. Python
parsing, Rustfmt parsing/formatting and diff checks can still inspect the durable
source independently of that target discovery blocker.

No compilation, compiling test, game launch, metadata/part request, staging
replacement, restart or original/rebuilt comparison was run. This source fix
and bounded 0.105.0 recovery do not close parent #17's other secondary pages,
current-target revalidation or runtime/visual parity requirements.
